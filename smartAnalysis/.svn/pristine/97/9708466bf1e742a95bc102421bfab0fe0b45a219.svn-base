<%@page import="kr.or.ddit.member.model.MemberVo"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
function parent(){
	openr.document.getElementById('').value();
}
IMP.init('imp02463329');

IMP.request_pay({
    pg : 'html5_inicis',
    pay_method : 'card',
    merchant_uid : 'merchant_' + new Date().getTime(),
    name : '컨설팅',
    amount : '${proVo.pro_cost}',
    buyer_email : '${memberVo.mem_email}',
    buyer_name : '${memberVo.mem_name}',
    buyer_tel : '${memberVo.mem_call}',
    buyer_addr : '${memberVo.mem_add}',
}, function(rsp) {
    if ( rsp.success ) {											//결제하면 error쪽으로 가는데 결과는 제대로 나옴
        var msg = '결제가 완료되었습니다.\n';
        msg += '결제 금액 : ' + rsp.paid_amount;
        msg += '\n주문상품명 : ' + rsp.name;
        msg += '\n컨설팅 시작 10분전에 화상채팅 ID를 보내드립니다.'
        alert(msg);
	    var cst_num = '${cst_num}';
	    $.ajax({
			url : "/consulting/consultingPayYN"
			,contextType : "application/json;charset=UTF-8"
			,dataType : "json"
			,type : "post"
			,data : {"cst_num" : cst_num}
		});
    } else {
        var msg = '결제에 실패하였습니다.\n';
        msg += '에러내용 : ' + rsp.error_msg;
	    alert(msg);
    }
    opener.parent.location.reload();
    window.close();
});
</script>
</head>
<body>

</body>
</html>