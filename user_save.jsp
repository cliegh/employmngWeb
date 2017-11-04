<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html>
<HTML>
<HEAD><title>회원 저장</title></HEAD>
<BODY>
<FORM action="user_save_do.jsp" method="post">
ID : <INPUT type="text" name="id" maxlength="8" size="8"><BR>
성명 : <INPUT type="text" name="name" maxlength="12" size="12"><BR>
암호 : <INPUT type="password" name="pwd"><BR>
<INPUT type="submit" value=" 저  장 ">
</FORM>
</BODY>
</HTML>