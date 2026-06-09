<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
var IMP = window.IMP; 
IMP.init("imp33007782"); 
function requestPay() {
    IMP.request_pay({
        pg: "nice",
        pay_method: "card",
        merchant_uid: "ORD20180131-0000011",   // 주문번호
        name: 'HTML5 웹프로그래밍 입문' ,
        amount: 29000,         // 숫자 타입
        buyer_email: 'hong@gmail.com',
        buyer_name: '홍길동',
        buyer_tel: '010-1111-2222',
        buyer_addr: '서울 마포구 서교동',
        buyer_postcode: '142-3124'
    }, function (rsp) { // callback
    	
    	alert("구매가 완료되었습니다.\n마이페이지에서 확인하세요")
    	//window.location.href="../mypage/buy_list.do"
    	//parent.Shadowbox.close()
   });
}
</script>
</head>
<body>
<button type="button" onclick="requestPay()">구매</button>
</body>
</html>