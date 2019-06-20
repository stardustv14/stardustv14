<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>

function calculateDistance(lat1, lon1, lat2, lon2) {
	Number.prototype.toRad = function() {
	    return this * Math.PI / 180;
	  };
	
    var R = 6371; // km
    var dLat = (lat2-lat1).toRad();
    var dLon = (lon2-lon1).toRad(); 
    var a = (Math.sin(dLat/2) * Math.sin(dLat/2)) + 
    		Math.cos(lat1.toRad()) * Math.cos(lat2.toRad()) * 
            Math.sin(dLon/2) * Math.sin(dLon/2); 
    var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a)); 
    var d = R * c;
    
    
    return d;
  };
  alert(calculateDistance(14, 50.1211, 17, 60.3333));
  //주석을 추가한다ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ
</script>
</body>
</html>