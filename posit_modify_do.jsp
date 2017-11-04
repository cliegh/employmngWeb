<%@ page contentType="text/html;charset=utf-8"
	import="posit.DB.*, java.sql.*, javax.naming.NamingException"%>
<%
	request.setCharacterEncoding("utf-8");
	String sidx = request.getParameter("idx");
	String positcode = request.getParameter("positcode");
	String isusing = request.getParameter("isusing");

	Articlep art = new Articlep();
	art.setIdx(Integer.parseInt(sidx));
	art.setPositcode(positcode);
	art.setIsusing(isusing);
	
	try {
		ArticlepDB db = new ArticlepDB();

		db.updateRecord(art);
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