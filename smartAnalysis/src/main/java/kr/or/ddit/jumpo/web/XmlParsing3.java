package kr.or.ddit.jumpo.web;

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

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

public class XmlParsing3 {
	
	private Logger logger = LoggerFactory.getLogger(XmlParsing3.class);
	
	//페이지에 접근해줄 Document객체 생성
	private DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
	private final String KEY = "qFxwY7cE9FVYVQtzCgEJ0ZVpBB55tmobF4PsGSKvhvA5roJjnXiH%2FJ%2BLjDGjKVFMi%2BtmdAWW3TT1X4E6GYU2QA%3D%3D";
	
	private static String getTagValue(String tag, Element eElement) { // tag값의 정보를 가져오는 메소드
	    NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
	    Node nValue = (Node) nlList.item(0);
	    if(nValue == null) 
	        return null;
	    return nValue.getNodeValue();
	}
	
	//행정동에 해당하는 업소 개수
	public Map<String, Object> getstoreListInUpjong(List<AnalysisCodeVo> acVoList, List<AnalysisRecVo> arVoList,char divRange) throws ParserConfigurationException, SAXException, IOException{
		Map<String, Object> map = new HashMap<String, Object>();
		String url = "";
		switch(divRange){
		case '1': //반경
			double radius = arVoList.get(0).getAN_RAD();
			double an_coorx = arVoList.get(0).getAN_COORX();
			double an_coory = arVoList.get(0).getAN_COORY();
			url = "http://apis.data.go.kr/B553077/api/open/sdsc/storeListInRadius?radius="+radius+"&cx="+an_coorx+"&cy="+an_coory+"&ServiceKey="+KEY+"&numOfRows=1000";
			break;
		case '2': //다각
			String coor = "";
			for(int i=0; i<arVoList.size(); i++){
				coor += arVoList.get(i).getAN_COORX()+" "+arVoList.get(i).getAN_COORY();
				if(i!=arVoList.size()-1) coor+=",";
			}
			url = "http://apis.data.go.kr/B553077/api/open/sdsc/storeListInPolygon?key=POLYGON (("+coor+"))&ServiceKey="+KEY+"&numOfRows=1000";
			break;
		}
		String userIndsLclsCd = acVoList.get(0).getIND_CODE().substring(0,1); //사용자가 고른거..대분류코드
		String userIndsMclsCd = acVoList.get(0).getIND_MCODE();
		List<String> userIndsSclsCd = new ArrayList<String>();
		for (int i = 0; i < acVoList.size(); i++) {
			userIndsSclsCd.add(acVoList.get(i).getIND_CODE());
		}
		
		List<StoreVo> storeList1 = new ArrayList<StoreVo>();
		List<StoreVo> storeList2 = new ArrayList<StoreVo>();
		List<StoreVo> storeList3 = new ArrayList<StoreVo>();
		String url2 = "&indsLclsCd="+userIndsLclsCd+"&indsMclsCd="+userIndsMclsCd+"&indsSclsCd=";
		url+=url2;
		for(int i =0; i<userIndsSclsCd.size(); i++){
			DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
			dbFactoty = DocumentBuilderFactory.newInstance();
			logger.debug("{},=========================================url"+url);
			Document doc = dBuilder.parse(url+userIndsSclsCd.get(i));

			// root tag, 페이지에 접근해줄 Document객체 생성
			doc.getDocumentElement().normalize();
			//doc.getDocumentElement().getNodeName())를 출력하면 위 XML의 최상위 tag값을 가져온다. 
			System.out.println("Root element: " + doc.getDocumentElement().getNodeName()); // Root element: result
			
			// 파싱할 데이터는 item 안에 있음?
			NodeList nList = doc.getElementsByTagName("item");
			//System.out.println("파싱할 리스트 수 : "+ nList.getLength());
			for(int temp = 0; temp < nList.getLength(); temp++){
				Node nNode = nList.item(temp);
				if(nNode.getNodeType() == Node.ELEMENT_NODE){
					Element eElement = (Element) nNode;
					String indsSclsCd = getTagValue("indsSclsCd", eElement); //입력한 tag 정보
					if(indsSclsCd.equals(userIndsSclsCd.get(i))){
						StoreVo store = new StoreVo();
						store.setBizesNm(getTagValue("bizesNm", eElement)); //상호명
						store.setIndsLclsCd(getTagValue("indsLclsCd", eElement)); //상권업종대분류코드
						store.setIndsLclsNm(getTagValue("indsLclsNm", eElement)); //상권업종대분류명
						store.setIndsMclsCd(getTagValue("indsMclsCd", eElement)); //상권업종중분류코드
						store.setIndsMclsNm(getTagValue("indsMclsNm", eElement)); //상권업종중분류명
						store.setIndsSclsNm(getTagValue("indsSclsCd", eElement)); //상권업종소분류코드
						store.setIndsSclsNm(getTagValue("indsSclsNm", eElement)); //상권업종소분류명
						store.setLnoAdr(getTagValue("lnoAdr", eElement)); //지번주소
						store.setLat(Double.parseDouble(getTagValue("lat", eElement))); //위도
						store.setLon(Double.parseDouble(getTagValue("lon", eElement))); //경도
						if(i==0){
							storeList1.add(store);
							logger.debug("{},==================================================store"+store.toString()+"  size = "+storeList1.size());
						}else if(i==1){
							storeList2.add(store);
							map.put("storeList2", storeList2);
						}else{
							storeList3.add(store);
							map.put("storeList3", storeList3);
						}
					}	
				}	// if end
			}	// for end
		}//선택한 업종 수 만큼 회전하는 for문
		map.put("storeList1", storeList1);
		
		
		return map;
	}
	
}
