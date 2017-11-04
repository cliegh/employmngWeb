<%@ page contentType="text/html;charset=utf-8"
	import="java.sql.*, dept.DB.*, javax.naming.*"%>
<%
	request.setCharacterEncoding("utf-8");
	String deptcode = request.getParameter("deptcode");
	String isusing = request.getParameter("isusing");

	Article art = new Article();
	art.setDeptcode(deptcode);
	art.setIsusing(isusing);

	try {
		ArticleDB db = new ArticleDB();

		db.insertRecord(art);
		db.close();
	} catch (SQLException e) {
		out.print(e);
		return;
	}

	catch (NamingException e) {
		out.print(e);
		return;
	}
	response.sendRedirect("deptRegist.jsp");
%>