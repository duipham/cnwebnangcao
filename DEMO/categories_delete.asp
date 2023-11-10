<!--#include file="connection.asp"-->
<%
	cid = Request.Querystring("cid")
	
	sql="delete from Categories where cid = " & cid 
	conn.execute sql 
		conn.close 
	Session("categories_error")="Xóa thành công"
		Response.Redirect("categories_view.asp")
			
	
%>
<html>
	<head>
		<meta charset="utf-8">
		<title>Tiêu đề trang web</title>
	</head>
	<body>
	
	</body>
</html>