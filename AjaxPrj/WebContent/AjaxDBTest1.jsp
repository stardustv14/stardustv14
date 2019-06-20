<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.catalina.Session" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>

<%! 
Connection 	conn = null;
Statement 	stmt = null;
ResultSet 	rs	 = null;
Session 	session = null;

String URL = "jdbc:mysql://localhost/bookshopdb";
String ID = "bookmaster";
String PWD = "1111";

int result;
%>

<%
try{
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(URL, ID, PWD);
	String sql = "SELECT COUNT(*) FROM MEMBER";
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql);
	rs.next();
	result = rs.getInt(1);
}catch(Exception e){
	e.printStackTrace();
}finally{
	if(rs != null){rs.close();}
	if(stmt != null){stmt.close();}
	if(conn != null){conn.close();}
}
%>

<%=result%>