<%@ page contentType="text/html;charset=utf-8"
	import="dept.DB.*, java.sql.*, javax.naming.NamingException"%>
<%
	request.setCharacterEncoding("utf-8");
	String sidx = request.getParameter("idx");
	String deptcode = request.getParameter("deptcode");
	String isusing = request.getParameter("isusing");

	Article art = new Article();
	art.setIdx(Integer.parseInt(sidx));
	art.setDeptcode(deptcode);
	art.setIsusing(isusing);
	
	try {
		ArticleDB db = new ArticleDB();

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
		
	response.sendRedirect("deptRegist.jsp");
%>