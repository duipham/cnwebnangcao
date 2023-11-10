<html>
	<head>
		<title>Tiêu đề của website</title>
		<meta charset="utf-8">
	</head>
	<body>
<%
	Dim dulieu
	'dulieu = Request.QueryString
	'Response.write(dulieu)
	HoVaTen = Request.QueryString("txtHoVaTen")
	MatKhau = Request.QueryString("txtMatKhau")
	GioiTinh = Request.QueryString("rdGioiTinh")
	KhoangTuoi = Request.QueryString("slKhoangTuoi")
	SoThich = Request.QueryString("ckSoThich")
	GhiChu = Request.QueryString("taGhiChu")
	Response.write("Họ và tên:" & HoVaTen & "<br>")
	Response.write("Mật khẩu:" & MatKhau & "<br>")
	Response.write("Gioi tính: " & GioiTinh & "<br>")
	Response.write("Khoảng tuổi: " & KhoangTuoi & "<br>")
	Response.write("Sở thích: " & SoThich)
	'For each x in SoThich	
	'	response.write(x & ",")
	'Next 
		response.write("<br>")
	Response.write("Ghi chú thông tin:" & GhiChu)
	if ((HoVaTen="admin") and (MatKhau="123456")) then
		Response.redirect("admin.asp")
	end if 
	
%>
</body>
</html>