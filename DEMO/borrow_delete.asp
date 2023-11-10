<!--#include file="connection.asp"-->
<%
	borrowid=Request.QueryString("borrowid")
	sql = "delete from Borrows where borrowid=" & borrowid
	conn.execute sql
	conn.close
	session("borrow_error")="Xóa thành công!"
	Response.redirect("borrows_view.asp")
%>
<html>
	<head>
		<title>Tiêu đề trang web</title>
		<meta charset="utf-8">
	</head>
	<body>
	
	</body>
</html>
	