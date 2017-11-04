<%@ page contentType="text/html;charset=utf-8"
	import="java.sql.*, myBean.DB.*, javax.naming.*"%>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");

	Article art = new Article();
	art.setId(id);
	art.setName(name);
	art.setPwd(pwd);

	try {
		ArticleDB db = new ArticleDB();

		db.insertRecord(art);
		db.close();
	} catch (NamingException e) {
		out.print(e);
		return;
	}

	catch (SQLException e) {
		out.print(e);
		return;
	}
	//만일, 저장이 안되면, 아래 코드 주석 처리하여 오류 확인할 것.
	response.sendRedirect("user_list.jsp");
%>