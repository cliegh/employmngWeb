<%@ page language="java" contentType="text/html; charset=utf-8"
    import = "posit.DB.*, dept.DB.*, java.sql.*, javax.naming.NamingException" pageEncoding="UTF-8"
%>
<%
request.setCharacterEncoding("utf-8");
String sidx = request.getParameter("idx");

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
<script>
function pprint(){
	window.print();
}
</script>
</head>
<body>

<div id = "content">
<form>
<%
 while(rs.next()) {
	 if(sidx.equals(rs.getString("idx"))){
%>

성명 : <%= rs.getString("krname")%><br>
생년월일 : <%= rs.getString("birth") %><br>
주소 : <%= rs.getString("address") %><br>
부서 : <%= rs.getString("depart") %><br>
직급 : <%= rs.getString("position") %><br>
근무기간 : <%= rs.getString("enterdate") %><br>
용도 : <br><textarea rows = "5" cols="50"></textarea><br>
발행기관 : <input type = "text" value = "SWindustry" readonly><br>
기관장명 : <input type = "text" value = "권순원" readonly><br>

	<%}}
	rs.close(); // ResultSet 종료
	pstmt.close(); // Statement 종료
	con.close(); // Connection 종료
	 
	} catch (SQLException e) {
		
	}
%>
<input type="button" value="출력하기" onclick="pprint()"/>
</form>
</div>
</body>
</html>
