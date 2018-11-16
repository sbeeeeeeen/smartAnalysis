package kr.or.ddit.future.web;

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

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

public class XmlParsing2 {
	//페이지에 접근해줄 Document객체 생성
	private DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
	private final String KEY = "qFxwY7cE9FVYVQtzCgEJ0ZVpBB55tmobF4PsGSKvhvA5roJjnXiH%2FJ%2BLjDGjKVFMi%2BtmdAWW3TT1X4E6GYU2QA%3D%3D";
	
	/*private static String getTagValue(String tag, Element eElement) { // tag값의 정보를 가져오는 메소드
	    NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
	    Node nValue = (Node) nlList.item(0);
	    if(nValue == null) 
	        return null;
	    return nValue.getNodeValue();
	}*/
	
	
	public Map<String, Object> getstoreListInUpjong(List<AnalysisCodeVo> acVo, List<AnalysisRecVo> list) throws ParserConfigurationException, SAXException, IOException{
		Map<String, Object> map = new HashMap<String, Object>();
		String url = "";
		switch(list.get(0).getAN_SHAPE()){
		case '1': //마커
			long reg_code = acVo.get(0).getREG_CODE(); //지역코드(행정동)
			String divId = "adongCd";
			url = "http://apis.data.go.kr/B553077/api/open/sdsc/storeListInDong?divId="+divId+"&key="+reg_code+"&ServiceKey="+KEY+"&numOfRows=1000";
			break;
		case '2': //반경
			double radius = list.get(0).getAN_RAD();
			double an_coorx = list.get(0).getAN_COORX();
			double an_coory = list.get(0).getAN_COORY();
			url = "http://apis.data.go.kr/B553077/api/open/sdsc/storeListInRadius?radius="+radius+"&cx="+an_coorx+"&cy="+an_coory+"&ServiceKey="+KEY+"&numOfRows=1000";
			break;
		case '3': //다각
			String coor = "";
			for(int i=0; i<list.size(); i++){
				coor += list.get(i).getAN_COORX()+" "+list.get(i).getAN_COORY();
				if(i!=list.size()-1) coor+=",";
			}
			url = "http://apis.data.go.kr/B553077/api/open/sdsc/storeListInPolygon?key=POLYGON (("+coor+"))&ServiceKey="+KEY+"&numOfRows=1000";
			break;
		}
		String userIndsLclsCd = acVo.get(0).getIND_CODE().substring(0,1); //사용자가 고른거..대분류코드
		String userIndsMclsCd = acVo.get(0).getIND_MCODE();
		List<String> userIndsSclsCd = new ArrayList<String>();
		for (int i = 0; i < acVo.size(); i++) {
			userIndsSclsCd.add(acVo.get(i).getIND_CODE());
		}
		String indQFDU = "";
		List<String> indList = new ArrayList<String>();
		indList.add("Q");
		indList.add("F");
		indList.add("D");
		indList.add(userIndsLclsCd);
		indList.add(userIndsMclsCd);
		indList.addAll(userIndsSclsCd);
		int q = 0; //음식
		int f = 0; //생활서비스
		int d = 0; //소매
		int u = 0; //사용자가 고른 대분류
		int indM = 0;//사용자가 고른 중분류 수
		int indS1 = 0;
		int indS2 = 0;
		int indS3 = 0;
		List<Integer> indsList = new ArrayList<Integer>();
		for (int i = 0; i < indList.size(); i++) {
			indQFDU = indList.get(i);
			
			String url2 = "";
			if(i<4){
				url2 = "&indsLclsCd=";
			}else if(i==4){
				url2 = "&indsMclsCd=";
			}else if(i>=5){
				url2 = "&indsSclsCd=";
			}
			
			
			DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
			dbFactoty = DocumentBuilderFactory.newInstance();
			
			Document doc = dBuilder.parse(url+url2+indQFDU);

			// root tag, 페이지에 접근해줄 Document객체 생성
			doc.getDocumentElement().normalize();
			//doc.getDocumentElement().getNodeName())를 출력하면 위 XML의 최상위 tag값을 가져온다. 
			System.out.println("Root element: " + doc.getDocumentElement().getNodeName()); // Root element: result
			// 파싱할 데이터는 item 안에 있음?
			NodeList nList = doc.getElementsByTagName("item");
			//System.out.println("파싱할 리스트 수 : "+ nList.getLength());
			
			if (i==0){q = nList.getLength(); map.put("qCnt", q);} 
			if (i==1){f = nList.getLength(); map.put("fCnt", f);}
			if (i==2){d = nList.getLength(); map.put("dCnt", d);} 
			if (i==3){u = nList.getLength(); map.put("uCnt", u);}
			if (i==4){indM = nList.getLength(); map.put("indMCnt", indM);}
			if (i==5){indS1 = nList.getLength(); indsList.add(indS1);}
			if (i==6){indS2 = nList.getLength(); indsList.add(indS2);}
			if (i==7){indS3 = nList.getLength(); indsList.add(indS3);}
		}
		map.put("indsList", indsList);
		return map;
	}
	
}
