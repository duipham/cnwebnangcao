<!--#include file="connection.asp"-->
<%
	sid = Request.Querystring("sid")
	sql="delete from Supplier_184466_1 where sid = " & sid 
    Response.Write sql
	conn.execute sql 
		conn.close 
	Session("supplier_error")="Xóa thành công"
		Response.Redirect("supplier_view.asp")
%>
<html>
	<head>
		<meta charset="utf-8">
		<title>Tiêu đề trang web</title>
	</head>
	<body>
	
	</body>
</html>