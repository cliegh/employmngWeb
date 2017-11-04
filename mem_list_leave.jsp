<%@ page language="java" contentType="text/html; charset=UTF-8" 
import = "dept.DB.*, java.sql.*, javax.naming.NamingException" pageEncoding="UTF-8"%>
<%
	Class.forName("com.mysql.jdbc.Driver");

	String DB_URL = "jdbc:mysql://localhost:3306/employee?useSSL=false&amp;useUnicode=true&amp;characterEncoding=utf8";
	String DB_USER = "admin";
	String DB_PASSWORD = "1234";

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try {
		 con = DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);
		 String sql = "SELECT * FROM member";
		 pstmt = con.prepareStatement(sql);

		 rs = pstmt.executeQuery();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사원관리 프로그램</title>
<link type="text/css" rel="stylesheet" href="boardstyle.css">
</head>
<body>
	<h1>
		<a href="http://localhost:8080/finalproj/index.html" target="_self">사원관리 프로그램</a>
	</h1>
	<hr/>
	<div id = "nav">
		<ul>
			<li><a href="http://localhost:8080/finalproj/deptRegist.jsp"target="_self">부서 코드 등록</a></li>
			<li><a href="http://localhost:8080/finalproj/posit_regist.jsp"target="_self">직급 코드 등록</a></li>
			<li><a href="http://localhost:8080/finalproj/mem_regist.jsp"target="_self">사원 등록</a></li>
			<li><a href="http://localhost:8080/finalproj/mem_list.jsp"target="_self">사원 목록(수정/인쇄)</a></li>
		</ul>
	</div>
	<div id = "content">
		<form method = "post" action = "mem_list_search.jsp">
		<input type = "text" name = "search" value = "성명 또는 사원번호를 입력해주세요." onFocus="this.value=''">
		<input type = "submit" value = "검색">
		<input type = "button" value = "퇴직자 목록">
		</form>
		<p>
		<table border="1" style="border-collapse: collapse">
		<tr>
		<th>사원번호</th>
		<th>한글성명</th>
		<th>영어성명</th>
		<th>부서</th>
		<th>직급</th>
		<th>입사일자</th>
		<th>퇴사일자</th>
		<th>은행명:계좌번호</th>
		<th>이메일</th>
		</tr>
<%
 while(rs.next()) {
	 if("".equals(rs.getString("leavedate"))){}
	 else{
%>
<TR>
<TD><a href="mem_info.jsp?id=<%= rs.getString("id") %>"><%= rs.getString("id") %></a></TD>
<TD><a href="mem_info.jsp?id=<%= rs.getString("id")%>"><%= rs.getString("krname")%></a></TD>
<TD><%= rs.getString("enname")%></TD>
<TD><%= rs.getString("depart")%></TD>
<TD><%= rs.getString("position") %></TD>
<TD><%= rs.getString("enterdate") %></TD>
<TD><%= rs.getString("leavedate") %></TD>
<TD><%= rs.getString("bank")%>&nbsp;<%= rs.getString("account")%></TD>
<TD><%= rs.getString("email") %></TD>
</TR>
<%}}
	rs.close(); // ResultSet 종료
	pstmt.close(); // Statement 종료
	con.close(); // Connection 종료

	} catch (SQLException e) {
		out.println("err:" + e.toString());
	}
%>
	</table>
	</div>
	
</body>
</html>