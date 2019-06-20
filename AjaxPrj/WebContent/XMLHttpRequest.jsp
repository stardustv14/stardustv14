<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>XMLHttpRequest</title>
	<script>
	function sendRequest(){
		var httpRequest;
		function createRequest(){
			//Explorer 7이상, 크롬, 파이어폭스, 사파리, 오페라
			if(window.XMLHttpRequest){
				return new XMLHttpRequest();	
			}else{ //익스플로러6이하 버전 
				return new ActiveXObject("MicrosoftXMLHTTP");
			}
		}
		function receiveResponse(){
			if(httpRequest.readyState == XMLHttpRequest.DONE && 
				httpRequest.state == 200){
				document.getElementById("text").innerHTML = 
					httpRequest.responseText;
			}
		}
		httpRequest = createRequest(); //XMLHttpRequest 객체를 생성한다.
		//XMLHttpRequest 객체의 현재 상태를 파악한다.
		httpRequest.onreadystatechange = receiveResponse;
		//GET방식의 비동기식 요청으로 Http요청을 생성한다. 
		httpRequest.open("GET", "ajaxTest.txt", true);
		httpRequest.send(); //Http요청을 보냄.
	}
	</script>
</head>
<body>
	<h1>XMLHttpRequest 객체 생성</h1>
	<button type="button" onclick="sendRequest()">Ajax 요청</button>
	<p id="text"></p>
</body>
</html>