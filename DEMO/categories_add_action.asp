<!--#include file="connection.asp"-->
<%
	cname=Request.Form("txtCname")
	cdesc=Request.Form("taCdesc")
	cimage=Request.Form("txtCimage")
	corder=Request.Form("txtCorder")
	cstatus=Request.Form("rdCstatus")
	'Kiểm tra nếu tên danh mục có rồi thì báo lỗi
	sql="select * From Categories where cname='" & cname &"'"
	rs.open sql, conn 
	if (not rs.eof) then
		Session("categories_add_error")="Tên danh mục: " & cname &" đã có rồi!"
		Response.Redirect("categories_add.asp")	
    else 
		sql = "insert into Categories(cname,cdesc,cimage,corder,cstatus) values ('" & cname & "','" & cdesc & "','" & cimage & "'," & corder & "," & cstatus & ")"
		'Response.write(sql)
		conn.execute sql 
		conn.close
		Session("categories_add_error")=""
		Session("categories_error")="Thêm mới thành công"
		Response.Redirect("categories_view.asp")
	end if		
	
%>
<html>
	<head>
		<meta charset="utf-8">
		<title>Tiêu đề trang web</title>
	</head>
	<body>
	
	</body>
</html>