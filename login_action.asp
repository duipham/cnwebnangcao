<html>
	<head>
		<title>Tiêu đề của website</title>
		<meta charset="utf-8">
	</head>
	<body>
<!--#include file="connection.asp"-->
<%
	TenDangNhap = Request.Form("txtTenDangNhap")
	MatKhau = Request.Form("txtMatKhau")
	QuyenHan = Request.Form("slQuyenHan")
	sql = "select * from [user] where [username]='" & TenDangNhap & "' and [password]='" & MatKhau & "'"
	rs.open sql, conn 	
	if (not rs.eof) then
		if (rs("status")=0) then 
		Session("login")=false
		Session("login_error")="Tài khoản bị khóa!"
		Response.Redirect("login.asp")
		else 
		Session("login")=true
		Session("login_error") = ""
		
		if (rs("level") = 1) then 
			Session("QuyenHan")=1
			response.Redirect("admin1.asp")
		else 
			Session("QuyenHan")=0
			response.Redirect("admin.asp")
		end if
		end if 
	else 
		Session("login")=false
		Session("login_error")="Tài khoản, mật khẩu bị sai!"
		Response.Redirect("login.asp")
	end if
%>
</body>
</html>