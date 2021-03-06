<%@page import="kr.or.ddit.member.model.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>채팅</title>
</head>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<script type="text/javascript" src="/Moderna/js/jquery.js"></script>    
<style>
	.messageDiv{
		width: 500px;
		height: 500px;
		overflow-y: scroll;
		padding: 10px;
	}
	
	.messageDiv h5{
		text-align: center;
		margin-top: 5px;
	}
	
	.receive{
		background: #ddd;
	}
	
	.send{
		background: #68A4C4;
	    color: white;
	    float: right;
	    margin-right: 15px;
	}
	
	.message{
	    border-radius: 10px;
	    padding: 10px;
	    display: inline-block;
	    max-width: 230px;
	    word-wrap: break-word;
	    margin-top: 5px;
	}
	
	.messageBox{
		margin-left: 10px;
	    overflow: auto;
	    position: relative;
		margin-top: 32px;
	}
	
	.messageBox p{
		margin-bottom: 0;
	}
	
	.inputMessage{
		width: 400px;
		padding: 5px;
		height: 50px;
	}
	
	.sendBtn{
		width: 60px;
	    background: #68A4C4;
	    color: white;
	    padding: 5px;
	    border: none;
	    height: 64px;
	    cursor: pointer;
	}
	
	.messageHeader{
		width: 500px;
		background: #68A4C4;
		color: white;
		height: 50px;
		display:table-cell;
		vertical-align:middle;
		padding-left: 10px;
	}
	
	.receiveTime{
		font-size: 12px;
	    display: inline-block;
	    padding-left: 5px;
	}
	
	.sendTime{
		font-size: 12px;
	    float: right;
	    margin-right: 16px;
	    text-align: right;
	    margin-bottom: 15px;
	    width: 100%;
	}
	
	.fa{
		color: white;
	}
	
</style>
<body style="overflow:hidden">
<%
	MemberVo memberVo = (MemberVo)session.getAttribute("memberVo"); 
%>
	<div class="messageHeader">
	<a href="chatList"><i class="fa fa-chevron-left"></i></a>
	${industry.IND_L }
	</div>
	   <div class="messageDiv" id="messageContainer">
	   </div>
	   <br/>
	   <input id="inputMessage" type="text" class="inputMessage" onkeyup="enterkey()" placeholder="메시지를 입력하세요"/>
	<input type="button" value="보내기" class="sendBtn" onclick="send()" />
	<input id="userId" type="hidden" value="<%=memberVo.getMem_id()%>"/>
</body>
<script type="text/javascript">
    var textarea = document.getElementById("messageWindow");
    var userId = document.getElementById('userId').value;
    var webSocket = new WebSocket('ws://192.168.207.140:8180/chat/'+userId+"/${industry.IND_LCODE}");
    var inputMessage = document.getElementById('inputMessage');
    
    webSocket.onerror = function(event) {
		onError(event)
    };
    webSocket.onopen = function(event) {
		webSocket.send("<h5>" + userId + "님이 입장하셨습니다.</h5>");
		onOpen(event)
    };
    webSocket.onmessage = function(event) {
		onMessage(event)
    };
    webSocket.onclose = function (event) {      
    	close(event);
    };
    window.onbeforeunload = function(event){
    	close(event);
    }
    
    function close(event){
    	webSocket.send("<h5>" + userId + "님이 퇴장하였습니다.</h5>");
        webSocket.close();
    }
    
    function onMessage(event) {
		$("#messageContainer").append(event.data);
		scroll();
    }
    
    function onOpen(event) {
		$("#messageContainer").append("<h5>채팅에 참여하였습니다</h5>");
    }
    
    function onError(event) {
		alert(event.data);
    }
    
    function send() {
    	var messageStr = "<div class=\"messageBox\"><p>"+userId+"</p><div class=\"message receive\">"+inputMessage.value+"</div><p class=\"receiveTime\">"+timeFormat(new Date())+"</p></div>";
		$("#messageContainer").append("<div class=\"messageBox\"><div class=\"message send\">"+inputMessage.value+"</div></div>"+"<div class=\"sendTime\">"+timeFormat(new Date())+"</div>");
        webSocket.send(messageStr);
        inputMessage.value = "";
        scroll();
    }
    
    //엔터키를 통해 send함
    function enterkey(){
    	if(window.event.keyCode==13&&$("#inputMessage").val()!=''){
    		send();
    	}
    	scroll();
    }

    function scroll(){
	    var objDiv = document.getElementById("messageContainer"); 
	    objDiv.scrollTop = objDiv.scrollHeight;
    }
    
    function timeFormat(date){
    	var time = ("00" + date.getHours()).slice(-2) 
    		+ ":" + ("00" + date.getMinutes()).slice(-2);
//     		+ ":" + ("00" + date.getSeconds()).slice(-2);
    	return time;
    }
    
  </script>
</html>