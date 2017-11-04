<%@ page contentType="text/html;charset=utf-8"
	import="com.oreilly.servlet.*, com.oreilly.servlet.multipart.*"
	import="java.sql.*, java.io.*"%>
<%
request.setCharacterEncoding("utf-8");

Class.forName("com.mysql.jdbc.Driver");
String DB_URL = "jdbc:mysql://localhost:3306/employee?useSSL=false&amp;useUnicode=true&amp;characterEncoding=utf8";
String DB_USER = "admin";
String DB_PASSWORD= "1234";

//upload 이름을 가지는 실제 서버의 경로명 알아내기
ServletContext context = getServletContext();
String realFolder = context.getRealPath("upload");
//"C:\\Users\\순원\\Desktop\\대학\\3-2\\인터넷 프로그래밍\\workspace\\finalproj\\WebContent\\upload";

//최대 전송 파일 크기 결정
int maxsize = 5*1024*1024;

try {
//만일, 서버에 동일한 파일이름이 저장되어있다면, 파일이름 뒤에 숫자를 증가시킴
 MultipartRequest multi = new MultipartRequest(request, realFolder, maxsize, "utf-8", new DefaultFileRenamePolicy());
 String idx = multi.getParameter("idx");
 String id = multi.getParameter("id");
 String krname = multi.getParameter("krname");
 String enname = multi.getParameter("enname");
 String birth = multi.getParameter("birth");
 String gender = multi.getParameter("gender");
 String enterdate = multi.getParameter("enterdate");
 String enterposit = multi.getParameter("enterposit");
 String depart = multi.getParameter("depart");
 String position = multi.getParameter("position");
 String leavedate = multi.getParameter("leavedate");
 String reason = multi.getParameter("reason");
 String tel = multi.getParameter("tel");
 String cellphone = multi.getParameter("cellphone");
 String email = multi.getParameter("email");
 String address = multi.getParameter("address");
 String bank = multi.getParameter("bank");
 String account = multi.getParameter("account");
 String hostname = multi.getParameter("hostname");
 String others = multi.getParameter("others");
 //서버에 저장된 파일이름 알아내기
 String filename = multi.getFilesystemName("filename");

 //DB 연결자 생성(이곳에 빈즈나 Connection Pool로 대치 가능)
 Connection con = DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);

 String sql = "UPDATE member SET id=?, filename=?, krname=?, enname=?, birth=?, gender=?, enterdate=?, enterposit=?, depart=?, position=?, leavedate=?, reason=?, tel=?, cellphone=?, email=?, address=?, bank=?, account=?, hostname=?, others=? "
		 + "WHERE idx = ?";
 PreparedStatement pstmt = con.prepareStatement(sql);

 //pstmt의 SQL 쿼리 구성
 pstmt.setString(1, id);
 pstmt.setString(2, filename);
 pstmt.setString(3, krname);
 pstmt.setString(4, enname);
 pstmt.setString(5, birth);
 pstmt.setString(6, gender);
 pstmt.setString(7, enterdate);
 pstmt.setString(8, enterposit);
 pstmt.setString(9, depart);
 pstmt.setString(10, position);
 pstmt.setString(11, leavedate);
 pstmt.setString(12, reason);
 pstmt.setString(13, tel);
 pstmt.setString(14, cellphone);
 pstmt.setString(15, email);
 pstmt.setString(16, address);
 pstmt.setString(17, bank);
 pstmt.setString(18, account);
 pstmt.setString(19, hostname);
 pstmt.setString(20, others);
 pstmt.setString(21, idx);
 
 pstmt.executeUpdate();

 pstmt.close();
 con.close();

} catch(IOException e) {
 out.println(e);
 return;
} catch(SQLException e) {
 out.println(e);
 return;
}
response.sendRedirect("mem_list.jsp");
%>