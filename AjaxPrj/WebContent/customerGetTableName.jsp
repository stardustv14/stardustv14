<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
Connection 			conn = null;
PreparedStatement 	pstmt = null;
ResultSet			rs = null;


try{
	String url = "jdbc:mysql://localhost:3306/bookshopdb";
	String user = "bookmaster";
	String pwd = "1111";
	
	//데이터베이스와 연동하기 위해 DriverManager에 등록한다. 
	Class.forName("com.mysql.jdbc.Driver");
	
	//DriverManager객체로부터 Connection객체를 얻어온다. 
	conn = DriverManager.getConnection(url, user, pwd);
	
	//sql 쿼리 작성
	String sql = "SELECT * FROM member";
	
	//prepareStatement에서 해당 sql을 미리 컴파일한다. 
	pstmt = conn.prepareStatement(sql);
	
	//쿼리를 실행하고 결과를 resultset객체에 넣는다. 
	rs = pstmt.executeQuery();
%>
<table class="table table-bordered table-striped table-hover">
		<tr>
			<td width="100" align="center">아이디</td>
			<td width="100" align="center">비밀번호</td>
			<td width="100" align="center">이름</td>
			<td width="100" align="center">가입일자</td>
			<td width="100" align="center">전화번호</td>
			<td width="100" align="center">주소</td>
		</tr>
<%		
		while(rs.next()){
			String id		= rs.getString("id");
			String passwd	= rs.getString("passwd");
			String name		= rs.getString("name");
			String reg_date	= rs.getString("reg_date");
			String tel		= rs.getString("tel");
			String address	= rs.getString("address");
		
%>
	<tr>
		<td width="100" align="center"><%=id %></td>
			<td width="100" align="center"><%=passwd %></td>
			<td width="100" align="center"><%=name %></td>
			<td width="100" align="center"><%=reg_date %></td>
			<td width="100" align="center"><%=tel %></td>
			<td width="100" align="center"><%=address %></td>
	</tr>		
	
<%
	}

%>
	</table>
<%
}catch(Exception e){
	e.printStackTrace();
	e.getMessage();
	out.println("회원정보를 가져오는데 실패했습니다.");
}finally{
	if(rs != null)try{rs.close();}catch(SQLException sqle){}
	if(pstmt != null)try{pstmt.close();}catch(SQLException sqle){}
	if(conn != null)try{conn.close();}catch(SQLException sqle){}
	
}

%>