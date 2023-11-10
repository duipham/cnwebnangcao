<!--#include file="connection.asp"-->
<%
	borrowid = Request.QueryString("borrowid")
	studentid = Request.Form("slStudentid")
	bookid = Request.Form("slBookid")
	borrowdate = Request.Form("BorrowDate")
	sql ="update Borrows set StudentID = " & studentid & ",bookid = " & bookid & ",borrowdate='" & borrowdate & "' where borrowid=" & borrowid
	'response.write(sql) 
	conn.execute sql
	conn.close 
	session("borrow_error") = "Cập nhật thành công!"
	Response.Redirect("borrows_view.asp")
%>

<html>
	<head>
		<title>Tiêu đề trang web</title>
		<meta charset="utf-8">
	</head>
	<body>
	
	</body>
</html>
	