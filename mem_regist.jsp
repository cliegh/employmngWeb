<%@ page language="java" contentType="text/html; charset=utf-8"
    import = "posit.DB.*, dept.DB.*, java.sql.*, javax.naming.NamingException" pageEncoding="UTF-8"
%>
<%
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
<script>
function overlap(){
	var id = document.getElementsByName("id")[0].value;
	
	<%while(rs.next()){%>
	if(id == <%=rs.getString("id")%>){
		alert("중복입니다!");
		document.getElementsByName("id")[0].value = '';
		return false;
	}
	<%}rs = pstmt.executeQuery();%>
	alert("사용가능합니다!");
	return true;
	
}
function check(){
	var id = document.getElementsByName("id")[0].value;
	
	<%while(rs.next()){%>
	if(id == <%=rs.getString("id")%>){
		alert("id가 중복입니다. 중복체크를 해주세요!");
		document.getElementsByName("id")[0].value = '';
		return false;
	}
	<%}%>
	alert("등록되었습니다!");
	form.submit();
	return true;

}
</script>
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
	<form method = "post" onsubmit = "return check()" action="mem_insert_do.jsp" enctype="multipart/form-data">
		사원번호 : <input type = "text" name = "id">
				<input type = "button" value = "중복확인" onclick = "overlap()"/><br/><!-- 아직미구현 -->
		사진 : <input type = "file" accept="image/jpg,image/gif" name = "filename"><br/>
		성명 : <input type = "text" name = "krname"><br/>
		영문성명 : <input type = "text" name = "enname"><br/>
		생년월일 : <input type = "date" name = "birth"><br/>
		성별 : <label for = "male">남성</label>
			<input type="radio" name = "gender" id = "male" value = "남성">
			<label for = "female">여성</label>
			<input type="radio" name = "gender" id = "female" value = "여성"><br/>
			<br/>
		입사일자 : <input type = "date" name = "enterdate"><br/>
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

		퇴사일자 : <input type = "date" name = "leavedate"><br/>
		퇴사사유 :<br/> <textarea name = "reason" rows = "5" cols="50"></textarea><br/>
		전화번호 : <input type = "tel" name = "tel"><br/>
		휴대폰번호 : <input type = "tel" name = "cellphone"><br/>
		이메일 : <input type="email"name="email" ><br/>
		주소 : <input type = "text" name = "address"><br/>
		<fieldset><legend>급여통장정보</legend>
		은행명 : <input type = "text" name = "bank"><br/>
		계좌번호 : <input type = "text" name = "account"><br/>
		예금주 : <input type = "text" name = "hostname"><br/>
		</fieldset>
		적요사항 :<br/> <textarea name = "others" rows = "5" cols="50"></textarea><br/>
			
	<input type="submit" value="제출"/>
	</form>
	<%
	rsd.close();
	rsp.close(); // ResultSet 종료
	stmtd.close(); // Statement 종료
	stmtp.close();
	con.close(); // Connection 종료

	} catch (SQLException e) {
		out.println("err:" + e.toString());
	}
%>
	
	</div>

</body>
</html>
