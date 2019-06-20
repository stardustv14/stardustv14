<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>ajaxTest01</title>
	<script src="js/jquery-3.3.1.min.js"></script>
	<script>
	$(function(){
		$("#requestBtn").on("click", function(){
			$("#text").load("ajaxTest.txt");
		});
	});
	</script>
</head>
<body>
	<h1>AJAX(Asynchronous JavaScript and XML)</h1>
	<p id="text">이 단락에 다른 텍스트를 불러옵시다.</p>
	<button id="requestBtn">Data Loading</button>
</body>
</html>