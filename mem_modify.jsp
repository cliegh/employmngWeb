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
	Statement stmtd = null;
	Statement stmtp = null;
	ResultSet rsd = null;
	ResultSet rsp = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try {
		con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		stmtd = con.createStatement();
		stmtp = con.createStatement();
		String query = "SELECT idx, deptcode, isusing FROM deptmem";
		rsd = stmtd.executeQuery(query);
		query = "SELECT idx, positcode, isusing FROM positmem";
		rsp = stmtp.executeQuery(query);
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
<%	while(rs.next()) {
	if(sid.equals(rs.getString("id"))){
%>
	<form method = "post" action="mem_modify_do.jsp" enctype="multipart/form-data">
		사원번호 : <input type = "text" name = "id" value = "<%= rs.getString("id") %>">
				<input type = "button" value = "중복확인" name = "check"/><br/><!-- 아직미구현 -->
		사진 : <input type = "file" accept="image/jpg,image/gif" name = "filename"><br/>
		성명 : <input type = "text" name = "krname" value = "<%= rs.getString("krname")%>"><br/>
		영문성명 : <input type = "text" name = "enname" value = "<%= rs.getString("enname") %>"><br/>
		생년월일 : <input type = "date" name = "birth" value = "<%= rs.getString("birth") %>"><br/>
		성별 : <label for = "male">남성</label>
			<input type="radio" name = "gender" id = "male" value = "남성">
			<label for = "female">여성</label>
			<input type="radio" name = "gender" id = "female" value = "여성"><br/>
			<br/>
		입사일자 : <input type = "date" name = "enterdate" value = "<%= rs.getString("enterdate") %>"><br/>
		입사구분 : <select name = "enterposit">
		<option value = "정규">정규</option>
		<option value = "수시">수시</option>
		<option value = "계약">계약</option>
		<option value = "일용">일용</option>
		</select><br/>
		
		부서 : <select name = "depart">
		<%
		while(rsd.next()) {
			if("사용".equals(rsd.getString("isusing"))){
		%>
		<option value = "<%=rsd.getString("deptcode")%>"><%=rsd.getString("deptcode") %></option>
		<%
			}}
		%>
		</select><br/>
		
		직급 : <select name = "position">
		<%
		while(rsp.next()) {
			if("사용".equals(rsp.getString("isusing"))){
		%>
		<option value = "<%=rsp.getString("positcode")%>"><%=rsp.getString("positcode") %></option>
		<%
			}}
		%>
		</select><br/> 

		퇴사일자 : <input type = "date" name = "leavedate" value = "<%= rs.getString("leavedate") %>"><br/>
		퇴사사유 :<br/> <textarea name = "reason" rows = "5" cols="50" ><%= rs.getString("reason") %></textarea><br/>
		전화번호 : <input type = "tel" name = "tel" value = "<%= rs.getString("tel") %>"><br/>
		휴대폰번호 : <input type = "tel" name = "cellphone" value = "<%= rs.getString("cellphone") %>"><br/>
		이메일 : <input type="email"name="email" value = "<%= rs.getString("email") %>"><br/>
		주소 : <input type = "text" name = "address" value = "<%= rs.getString("address") %>"><br/>
		<fieldset><legend>급여통장정보</legend>
		은행명 : <input type = "text" name = "bank" value = "<%= rs.getString("bank") %>"><br/>
		계좌번호 : <input type = "text" name = "account" value = "<%= rs.getString("account") %>"><br/>
		예금주 : <input type = "text" name = "hostname" value = "<%= rs.getString("hostname") %>"><br/>
		</fieldset>
		적요사항 :<br/> <textarea name = "others" rows = "5" cols="50" ><%= rs.getString("others") %></textarea><br/>

	<input type = "hidden" name = "idx" value = "<%=rs.getInt("idx") %>">
	<input type="submit" value="수정완료">
	
	<%
	rsd.close();
	rsp.close(); // ResultSet 종료
	rs.close();
	stmtd.close(); // Statement 종료
	stmtp.close();
	pstmt.close();
	con.close(); // Connection 종료

	}}} catch (SQLException e) {
		
	}
%>
	</form>
	</div>

</body>
</html>
