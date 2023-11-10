<!--#include file="Connection.asp"-->
<%
    cname = Request.Form("txtCname")
    cimage = Request.Form("txtCimage")
    cdesc = Request.Form("txtCdesc")
    corder = Request.Form("numCorder")
    cstatus = Request.Form("rdCstatus")

	' Nếu có rồi ==> lỗi
	sql = "select * from [categories] where cname = '" &cname& "'"
	rs.open sql, conn 
	if (not rs.eof) then 
		Session("categories_add_error") = "Tên danh mục " &cname& " đã tồn tại"
		Response.Redirect("categories_add.asp")
	else 
		sqlins = "insert into [Categories] ([cname], [cimage], [corder], [cstatus], [cdesc]) VALUES ("&cname&", "&cimage&", "&corder&", "&cstatus&", "&cdesc&")" 
		Response.Write(sqlins)
		conn.execute sqlins
		conn.close
		Session("categories_add_error") = ""
		' Session("categories_message") = "Thêm thành công"
		Response.Redirect("categories_add.asp")
	End If
%>