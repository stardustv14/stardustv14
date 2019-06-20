<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
String driver 	= "com.mysql.jdbc.Driver";
String dbURL 	= "jdbc:mysql://localhost/bookshopdb";
String user 	= "bookmaster";
String pass 	= "1111";

String 		sql 	= "";
Connection 	conn 	= null;
Statement 	stmt 	= null;
ResultSet 	rs		= null;

try{
	Class.forName(driver);
	conn = DriverManager.getConnection(dbURL, user, pass);
	
	sql = "select * from member";
	stmt = conn.createStatement();
	stmt.executeQuery(sql);
%>
<customer>
<%	
	while(rs.next()){
		out.println("<person>");
		out.println("<id>"+rs.getString("id")+"</id>");
		out.println("<passwd>"+rs.getString("passwd")+"</passwd>");
		out.println("<name>"+rs.getString("name")+"</name>");
		out.println("<reg_date>"+rs.getString("reg_date")+"</reg_date>");
		out.println("<tel>"+rs.getString("tel")+"</tel>");
		out.println("<address>"+rs.getString("address")+"</address>");
		out.println("</person>");
	}
%>
</customer>	
<%
}catch(ClassNotFoundException e){
	e.printStackTrace();
}catch(SQLException e){
	e.printStackTrace();
}


%>