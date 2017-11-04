<%@ page contentType="text/html;charset=utf-8"
	import="com.oreilly.servlet.*, com.oreilly.servlet.multipart.*"
	import="java.sql.*, java.io.*"%>
<%
request.setCharacterEncoding("utf-8");

Class.forName("com.mysql.jdbc.Driver");
String DB_URL = "jdbc:mysql://localhost:3306/employee?useSSL=false&amp;useUnicode=true&amp;characterEncoding=utf8";
String DB_USER = "admin";
String DB_PASSWORD= "1234";

try {
 String idx = request.getParameter("idx");

 Connection con = DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);

 String sql = "DELETE FROM member WHERE idx = ?";
 PreparedStatement pstmt = con.prepareStatement(sql);

 //pstmt의 SQL 쿼리 구성
 pstmt.setString(1, idx);
 pstmt.executeUpdate();

 pstmt.close();
 con.close();

} catch(SQLException e) {
 return;
}
response.sendRedirect("mem_list.jsp");
%>