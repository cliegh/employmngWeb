<%@ page language="java" contentType="text/html; charset=utf-8"
    import = "posit.DB.*, dept.DB.*, java.sql.*, javax.naming.NamingException" pageEncoding="UTF-8"
%>
<%
String sid = request.getParameter("id");

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
<meta charset="UTF-8">
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
	
<%
 while(rs.next()) {
	 if(sid.equals(rs.getString("id"))){
%>
사원번호 : <%= rs.getString("id") %><br>
<!-- upload 디렉토리의 그림출력 -->
사진 : <img src="<%= "http://localhost:8080/finalproj/upload/"
+ rs.getString("filename") %>" width="100" height="100"/><br>
성명 : <%= rs.getString("krname")%><br>
영문성명 : <%= rs.getString("enname") %><br>
생년월일 : <%= rs.getString("birth") %><br>
성별 : <%= rs.getString("gender") %><br>
입사일자 : <%= rs.getString("enterdate") %><br>
입사구분 : <%= rs.getString("enterposit")%><br>
부서 : <%= rs.getString("depart") %><br>
직급 : <%= rs.getString("position") %><br>
퇴사일자 : <%= rs.getString("leavedate") %><br>
퇴사사유 : <br><textarea rows = "5" cols="50"> <%= rs.getString("reason") %></textarea><br>
전화번호 : <%= rs.getString("tel") %><br>
휴대폰번호 : <%= rs.getString("cellphone") %><br>
이메일 : <%= rs.getString("email") %><br>
주소 : <%= rs.getString("address") %><br>
<fieldset><legend>급여통장정보</legend>
은행명 : <%= rs.getString("bank") %><br>
계좌번호 : <%= rs.getString("account") %><br>
예금주 : <%= rs.getString("hostname") %><br>
</fieldset>
적요사항 : <br><textarea rows = "5" cols="50"><%= rs.getString("others") %></textarea><br>
	</div>
	
	<input type="button" value="수정" onclick="location.href = 'mem_modify.jsp?id=<%= rs.getString("id") %>'">
	<input type="button" value="삭제" onclick="location.href = 'mem_delete_do.jsp?idx=<%= rs.getInt("idx") %>'">
	<input type="button" value="증명서 출력" onclick="location.href = 'mem_print.jsp?idx=<%= rs.getInt("idx") %>'">
	<%
	rs.close(); // ResultSet 종료
	pstmt.close(); // Statement 종료
	con.close(); // Connection 종료
	 }}
	} catch (SQLException e) {
		
	}
%>
	</form>
	</div>

</body>
</html>
