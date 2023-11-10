<!--#include file="connection.asp"-->
<%
    colorid = Request.Form("colorid")
	clname=Request.Form("txtClname")
	clstatus=Request.Form("rdClstatus")
	sql="select * From color_184466_1 where clname='" & clname & "'"
	rs.open sql, conn 
	if (not rs.eof) then
		Session("color_edit_error")="Tên màu này đã tồn tại!"
		Response.Redirect("color_edit.asp")	
    else 
	    sql="update color_184466_1 set colorname='" & clname & "', colorstatus=" & clstatus & " where colorid=" & colorid 
        conn.execute sql 
		conn.close 
	Session("color_error")="Sửa thành công"
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