<!--#include file="connection.asp"-->
<%
	sname=Request.Form("txtSname")
	saddress=Request.Form("taSaddress")
	sphone=Request.Form("txtSphone")
	stax=Request.Form("txtStax")
	sstatus=Request.Form("rdSstatus")
	sql="select * From Supplier_184466_1 where sname='" & sname &"' OR sphone='" & sphone & "'" 
	rs.open sql, conn 
	if (not rs.eof) then
		Session("supplier_add_error")="Tên/Số điện thoại này đã tồn tại!"
		Response.Redirect("supplier_add.asp")	
    else 
		sql = "insert into Supplier_184466_1 (sname,saddress,sphone,stax,sstatus) values ('" & sname & "','" & saddress & "','" & sphone & "', '" & stax & "'," & sstatus & ")"
		conn.execute sql 
		conn.close
		Session("supplier_add_error")=""
		Session("supplier_error")="Thêm mới thành công"
		Response.Redirect("supplier_view.asp")
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