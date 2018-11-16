<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>채팅</title>
</head>
<style>
	ul{
		list-style-type: none;
	}
	#chatList li {
		cursor: pointer;
	    padding: 20px;
	    margin-left: -40px;
	}
	
	#chatList li:hover{
		background: #68A4C4;
		color: white;
	}
</style>
<body>
	<form id="frm" action="/main/chat" method="post">
		<input type="hidden" name="IND_LCODE" id="IND_LCODE" value="">
		<input type="hidden" name="IND_L" id="IND_L" value="">
	</form>
	<ul id="chatList">
		<c:forEach items="${industryList }" var="indL">
			<li id="${indL.IND_LCODE }" data-name="${indL.IND_L }">${indL.IND_L }</li>
		</c:forEach>
	</ul>
</body>
<script type="text/javascript" src="/Moderna/js/jquery.js"></script>
<script>
	/* $.ajax({
		url : "http://192.168.207.218:8180/chatting/getChatMemList"
		,dataType:"jsonp"
		,jsonp: "callback"
		,type: 'GET'
		,success : function(data){
			console.log(data);
			$.each(data.memList, function(index, value){
				document.getElementById(index).append(" (" + value + ")");
			});
		}
        ,error : function(error){
        	console.log(error);
		}
	}); */
	$("#chatList").on("click", "li", function(){
		document.getElementById("IND_LCODE").value = this.id;
		document.getElementById("IND_L").value=$(this).data("name");
		document.getElementById("frm").submit();
	});
</script>
</html>