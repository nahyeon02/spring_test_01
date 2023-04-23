<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
	<script src="https://js.tosspayments.com/v1/brandpay"></script>
</head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

var clientKey = "test_ck_MGjLJoQ1aVZpeAPGoBA8w6KYe2RN";
var customerKey = '1234567890023';
//비번 112233

console.log(customerKey);

var brandpay = BrandPay(clientKey, customerKey, {
	  redirectUrl: 'http://localhost:7001/callback-auth',
	  ui: {
	    highlightColor: '#26C2E3',
	    buttonStyle: 'full',
	    labels: {
	      oneTouchPay: '내 상점 원터치결제',
	    },
	  },
	  windowTarget: 'iframe'
	})
  
function requestPayment() {
	brandpay.requestPayment({
		  amount: 15000,
		  orderId: '12345678900222',
		  orderName: '토스 티셔츠 외 333건',
		  customerName: '박토스',
		  customerEmail: 'customer@example.com',
		  successUrl : 'http://localhost:7001/tossSuccess'
		  , failUrl : 'http://localhost:7001/tossFail'
		})
		.then(function (data) {
		  // 결제 요청 성공 처리
		  console.log(data);
		})
		.catch(function (error) {
			console.log(error);
			  console.log(error.code);
		  if (error.code === 'USER_CANCEL') {
		    // 사용자가 창을 닫아 취소한 경우에 대한 처리
		  }
		})
  };
  
function getPayment(){
	brandpay
	  .getPaymentMethods()
	  .then(function (methods) {
	    // 성공 처리
	    console.log(methods);
	  })
	  .catch(function (error) {
		  console.log(error);
		  console.log(error.code);
	    if (error.code === 'USER_CANCEL') {
	      // 사용자가 결제창을 닫은 경우 에러 처리
	    }
	  })
}

</script>
<body>

<button onclick="requestPayment()">결제하기</button>
<button onclick="getPayment()">결제수단정보</button>

</body>
</html>