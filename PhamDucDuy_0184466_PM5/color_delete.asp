<!--#include file="connection.asp"-->
<%
	colorid = Request.Querystring("colorid")
	sql="delete from color_184466_1 where colorid = " & colorid 
    Response.Write sql
	conn.execute sql 
		conn.close 
	Session("color_error")="Xóa thành công"
		Response.Redirect("color_view.asp")
%>
<html>
	<head>
		<meta charset="utf-8">
		<title>Tiêu đề trang web</title>
	</head>
	<body>
	
	</body>
</html>