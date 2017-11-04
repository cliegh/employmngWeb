<%@ page language="java" contentType="text/html; charset=UTF-8" 
import = "dept.DB.*, java.sql.*, javax.naming.NamingException" pageEncoding="UTF-8"%>
<%
	Class.forName("com.mysql.jdbc.Driver");

	String DB_URL = "jdbc:mysql://localhost:3306/employee?useSSL=false&amp;useUnicode=true&amp;characterEncoding=utf8";
	String DB_USER = "admin";
	String DB_PASSWORD = "1234";

	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;

	try {
		con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		stmt = con.createStatement();

		String query = "SELECT idx, deptcode, isusing FROM deptmem";
		rs = stmt.executeQuery(query);
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
	<form method = "post" action = "dept_insert_do.jsp">
		<table border="1" style="border-collapse: collapse">
		<tr>
		<th>코드 - 부서명</th>
		<th>사용 구분</th>
		</tr>
		<tr>
		<td><input type = "text" name = "deptcode"></td>
		<td>
		<label for = "deptused">사용</label>
		<input type = "radio" id = "deptused" name ="isusing" value = "사용"> 
		<label for = "deptunused">비사용</label>
		<input type = "radio" id = "deptunused" name ="isusing" value = "비사용">
		</td>
		</table>
		<input type="submit" value="등록">
		
		<p>
		<table border="1" style="border-collapse: collapse">
		<tr>
		<th>코드 - 부서명</th>
		<th>사용 구분</th>
		<th>수정</th>
		</tr>
		<%
		while (rs.next()) {
		%><tr>
		<td><%=rs.getString("deptcode")%></td>
		<td><%=rs.getString("isusing")%></td>
		<td><a href="dept_modify.jsp?idx=<%=rs.getInt("idx")%>">수정하기</a></td>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      		</TD>
		</tr>
		<%
			} // end while
		%>
		</table>
<%
	rs.close(); // ResultSet 종료
	stmt.close(); // Statement 종료
	con.close(); // Connection 종료

	} catch (SQLException e) {
		out.println("err:" + e.toString());
	}
%>
	</form>
	</div>
	
</body>
</html>