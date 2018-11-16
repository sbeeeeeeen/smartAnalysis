package kr.or.ddit.a_main.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@ServerEndpoint(value="/chat/{mem_id}/{ind_l}")
@RequestMapping("/chatting")
@Controller
public class Broadsocket {
	
	private static Map<String, List<ClientVo>> clientMap = new HashMap<String, List<ClientVo>>();
	private Logger logger = LoggerFactory.getLogger(Broadsocket.class);
	
	{
		if(clientMap.size()==0){
			List<String> industryLList = new ArrayList<String>(
					Arrays.asList("R", "P", "D", "Q", "N", "O", "L", "F"));
			for(String industry : industryLList){
				clientMap.put(industry, new ArrayList<ClientVo>());
			}
		}
	}
	
	@OnOpen
	public void onOpen(@PathParam("mem_id") String mem_id,
						@PathParam("ind_l") String ind_l,
						Session session, EndpointConfig config){
		logger.debug("open mem_id={}", mem_id);
		logger.debug("session id = {}", session.getId());
		List<ClientVo> clientList = clientMap.get(ind_l);
		for(ClientVo c : clientList){
			if(c.getMem_id().equals(mem_id)){
				return;
			}
		}
		ClientVo client = new ClientVo();
		client.setMem_id(mem_id);
		client.setSession(session);
		clientList.add(client);
		clientMap.put(ind_l, clientList);
	}
	
	@OnMessage
	public void onMessage(@PathParam("mem_id") String mem_id,
									@PathParam("ind_l") String ind_l,
									String message, Session session) throws IOException {
		logger.debug("message={}", message);
		List<ClientVo> clientList = clientMap.get(ind_l);
		for(ClientVo c : clientList){
			if(!c.getMem_id().equals(mem_id)){
				c.getSession().getBasicRemote().sendText(message);
			}
		}
	}

	@OnClose
	public void onClose(Session session){
		for(String key : clientMap.keySet()){
			for(ClientVo c : clientMap.get(key)){
				if(c.getSession().equals(session)){
					clientMap.get(key).remove(c);
					logger.debug("remove session {}", c.getMem_id());
					return;
				}
			}
		}
	}
	
	@RequestMapping("/getChatMemList")
	protected void getChatMemList(HttpServletRequest request, HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String callBack = request.getParameter("callback");
		 
		Map<String, Integer> chatMemMap = new HashMap<String, Integer>();
		for(String key : clientMap.keySet()){
			chatMemMap.put(key, clientMap.get(key).size());
		}
		
		JSONObject obj = new JSONObject();
		obj.put("memList", chatMemMap);
		
		PrintWriter out = response.getWriter();
		out.write(callBack + "(" + obj.toString() + ")");
		out.flush();
		out.close();
	}	

}