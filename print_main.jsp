<%@ page language="java" contentType="text/html; charset=utf-8"
    import = "posit.DB.*, dept.DB.*, java.sql.*, javax.naming.NamingException" pageEncoding="UTF-8"
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
			<li><a href="http://localhost:8080/finalproj/mem_list.jsp"target="_self">사원 목록(수정)</a></li>
		</ul>
	</div>
	<div id = "content">
	<form method = "post" action = "print_search.jsp">
		<input type = "text" name = "search" value = "성명 또는 사원번호를 입력해주세요." onFocus="this.value=''">
		<input type = "submit" value = "검색">
	</form>
	</div>

</body>
</html>
