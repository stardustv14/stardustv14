<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
String driver = "com.mysql.jdbc.Driver";
String dbURL = "jdbc:mysql://localhost/bookshopdb";
String user = "bookmaster";
String pass = "1111";

String sql = "";
Connection 	conn 	= null;
Statement 	stmt 	= null;

String id	=	request.getParameter("id");
String passwd	=	request.getParameter("passwd");
String name	=	request.getParameter("name");
String tel	=	request.getParameter("tel");
String address	=	request.getParameter("address");

try{
	Class.forName(driver);
	conn = DriverManager.getConnection(dbURL, user, pass);
	System.out.println("login");
	sql = "insert into member(id, passwd, name, reg_date, tel, address) ";
	sql +=	" values('"+id+"','"+passwd+"','"+name+"', now() ,'"+tel+"','"+address+"')";
	
	stmt = conn.createStatement();
	stmt.executeUpdate(sql);
	
}catch(ClassNotFoundException e){
	
}catch(SQLException e){
	
}


%>