<!--#include file="connection.asp"-->
<%
	clname=Request.Form("txtClname")
	clstatus=Request.Form("rdClstatus")
	sql="select * From Color_184466_1 where colorname='" & clname & "'"
	rs.open sql, conn 
	if (not rs.eof) then
		Session("color_add_error")="Tên màu này đã tồn tại!"
		Response.Redirect("color_add.asp")	
    else 
		sql = "insert into color_184466_1 (colorname, colorstatus) values ('" & clname & "', " & clstatus & ")"
		conn.execute sql 
		conn.close
		Session("color_add_error")=""
		Session("color_error")="Thêm mới thành công"
		Response.Redirect("color_view.asp")
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