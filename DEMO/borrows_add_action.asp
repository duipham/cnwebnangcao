<!--#include file="connection.asp"-->
<%
	studentid = Request.Form("slStudentid")
	bookid = Request.Form("slBookid")
	borrowdate = Request.Form("BorrowDate")
	sql = "insert into Borrows(studentid,bookid,borrowdate) values (" & studentid & "," & bookid & ",'" & borrowdate & "')"
	'response.write(sql)
	conn.execute sql
	conn.close
	response.redirect("borrows_view.asp")
%>

<html>
	<head>
		<title>Tiêu đề trang web</title>
		<meta charset="utf-8">
	</head>
	<body>
	
	</body>
</html>
	