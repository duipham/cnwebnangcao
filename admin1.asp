<%
	if (Session("login")=true) and (Session("QuyenHan")=1) then
		Response.write("Chào mừng bạn: " & Session("TenDangNhap"))
	else 
		Session("login_error")="Bạn ko đủ quyền vào trang admin1"
		Response.Redirect("login.asp")
	end if
	
	
%>