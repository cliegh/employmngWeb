<%@ page contentType="text/html;charset=utf-8" import="java.sql.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");

	String DB_URL = "jdbc:mysql://localhost:3306/mydb?useSSL=false";
	String DB_USER = "admin";
	String DB_PASSWORD = "1234";

	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;

	try {
		con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		stmt = con.createStatement();

		String query = "SELECT idx, id, name, pwd FROM member";
		rs = stmt.executeQuery(query);
%>
<table border="1" style="border-collapse: collapse">
	<tr style="background-color: #dddddd">
		<th>번호</th>
		<th>ID</th>
		<th>성명</th>
		<th>암호</th>
		<th>비고</th>
	</tr>
	<%
		while (rs.next()) {
	%><tr>
		<td><%=rs.getInt("idx") /*ⓖ*/%></td>
		<td><%=rs.getString("id")%></td>
		<td><%=rs.getString("name") /*ⓗ*/%></td>
		<td><%=rs.getString("pwd")%></td>

		<TD><A href="user_delete_do.jsp?idx=<%=rs.getInt("idx")%>">삭제</A>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
			<INPUT type="button" value="수정"
			onClick="location.href='user_modify.jsp?idx=<%=rs.getInt("idx")%>'">
		</TD>
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
<A href="user_save.jsp">회원 추가</A>





