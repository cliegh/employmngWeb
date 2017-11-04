<%@ page contentType="text/html;charset=utf-8"
	import="java.sql.*, posit.DB.*, javax.naming.*"%>
<%
	request.setCharacterEncoding("utf-8");
	String positcode = request.getParameter("positcode");
	String isusing = request.getParameter("isusing");

	Articlep art = new Articlep();
	art.setPositcode(positcode);
	art.setIsusing(isusing);

	try {
		ArticlepDB db = new ArticlepDB();

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
	response.sendRedirect("posit_regist.jsp");
%>