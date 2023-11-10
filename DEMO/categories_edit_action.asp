<!--#include file="connection.asp"-->
<%
	cid = Request.Form("cid")
	cname=Request.Form("txtCname")
	cdesc=Request.Form("taCdesc")
	cimage=Request.Form("txtCimage")
	corder=Request.Form("txtCorder")
	cstatus=Request.Form("rdCstatus")
	'Kiểm tra nếu tên danh mục có rồi thì báo lỗi
	sql="update Categories set cname='" & cname &"',cdesc='" & cdesc & "',cimage='"&cimage & "',corder=" & corder & ",cstatus=" & cstatus & " where cid=" & cid 
		conn.execute sql 
		conn.close 
	Session("categories_error")="Sửa thành công"
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