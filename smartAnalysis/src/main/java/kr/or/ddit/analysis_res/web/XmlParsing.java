package kr.or.ddit.analysis_res.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import kr.or.ddit.analysis_res.model.AnalysisCodeVo;
import kr.or.ddit.analysis_res.model.AnalysisRecVo;
import kr.or.ddit.analysis_res.model.StoreVo;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

public class XmlParsing {
	//페이지에 접근해줄 Document객체 생성
	private DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
	private final String KEY = "qFxwY7cE9FVYVQtzCgEJ0ZVpBB55tmobF4PsGSKvhvA5roJjnXiH%2FJ%2BLjDGjKVFMi%2BtmdAWW3TT1X4E6GYU2QA%3D%3D";
	private final int NUMOFROWS = 1000;
	
	private static String getTagValue(String tag, Element eElement) { // tag값의 정보를 가져오는 메소드
	    NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
	    Node nValue = (Node) nlList.item(0);
	    if(nValue == null) 
	        return null;
	    return nValue.getNodeValue();
	}
	
	//행정동에 해당하는 업소 개수
	public Map<String, Object> getstoreListInUpjong(List<AnalysisCodeVo> acVo, List<AnalysisRecVo> list) throws ParserConfigurationException, SAXException, IOException{
		Map<String, Object> map = new HashMap<String, Object>();
		String url = "";
		switch(list.get(0).getAN_SHAPE()){
		case '1': //마커
			long reg_code = acVo.get(0).getREG_CODE(); //지역코드(행정동)
			String divId = "adongCd";
			url = "http://apis.data.go.kr/B553077/api/open/sdsc/storeListInDong?divId="+divId+"&key="+reg_code+"&ServiceKey="+KEY + "&numOfRows=" + NUMOFROWS;
			break;
		case '2': //반경
			double radius = list.get(0).getAN_RAD();
			double an_coorx = list.get(0).getAN_COORX();
			double an_coory = list.get(0).getAN_COORY();
			url = "http://apis.data.go.kr/B553077/api/open/sdsc/storeListInRadius?radius="+radius+"&cx="+an_coorx+"&cy="+an_coory+"&ServiceKey="+KEY + "&numOfRows=" + NUMOFROWS;
			break;
		case '3': //다각
			String coor = "";
			for(int i=0; i<list.size(); i++){
				coor += list.get(i).getAN_COORX()+" "+list.get(i).getAN_COORY();
				if(i!=list.size()-1) coor+=",";
			}
			url = "http://apis.data.go.kr/B553077/api/open/sdsc/storeListInPolygon?key=POLYGON (("+coor+"))&ServiceKey="+KEY + "&numOfRows=" + NUMOFROWS;
			break;
		}
		String userIndsLclsCd = acVo.get(0).getIND_CODE().substring(0,1); //사용자가 고른거..대분류코드
		
		DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
		dbFactoty = DocumentBuilderFactory.newInstance();
		
		Document doc = dBuilder.parse(url);

		// root tag, 페이지에 접근해줄 Document객체 생성
		doc.getDocumentElement().normalize();
		//doc.getDocumentElement().getNodeName())를 출력하면 위 XML의 최상위 tag값을 가져온다. 
		
		NodeList nList = doc.getElementsByTagName("item");
		int q = 0; //음식
		int f = 0; //생활서비스
		int d = 0; //소매
		int u = 0;
		List<StoreVo> storeList = new ArrayList<StoreVo>();
		for(int temp = 0; temp < nList.getLength(); temp++){
			Node nNode = nList.item(temp);
			if(nNode.getNodeType() == Node.ELEMENT_NODE){
				Element eElement = (Element) nNode;
				String indsLclsCd = getTagValue("indsLclsCd", eElement); //입력한 tag 정보
				if(indsLclsCd.equals("Q")) q++;
				else if(indsLclsCd.equals("F")) f++;
				else if(indsLclsCd.equals("D")) d++;
				if(indsLclsCd.equals(userIndsLclsCd)){
					u++;
					StoreVo store = new StoreVo();
					store.setBizesNm(getTagValue("bizesNm", eElement)); //상호명
					store.setIndsMclsCd(getTagValue("indsMclsCd", eElement)); //상권업종중분류코드
					store.setIndsMclsNm(getTagValue("indsMclsNm", eElement)); //상권업종중분류명
					store.setLnoAdr(getTagValue("lnoAdr", eElement)); //지번주소
					store.setLat(Double.parseDouble(getTagValue("lat", eElement))); //위도
					store.setLon(Double.parseDouble(getTagValue("lon", eElement))); //경도
					storeList.add(store);
				}
			}	// if end
		}	// for end
		map.put("storeList", storeList);
		List<Integer> getstoreListInUpjong = new ArrayList<Integer>();
		if(userIndsLclsCd.equals("Q")||userIndsLclsCd.equals("F")||userIndsLclsCd.equals("D")) { //userIndsLclsCd = 사용자가 고른거..대분류코드
			getstoreListInUpjong.add(q+f+d);
		}else {
			getstoreListInUpjong.add(q+f+d+u);
		}
		getstoreListInUpjong.add(q);
		getstoreListInUpjong.add(f);
		getstoreListInUpjong.add(d);
		getstoreListInUpjong.add(u);
		map.put("getstoreListInUpjong", getstoreListInUpjong);
		return map;
	}
	
}
