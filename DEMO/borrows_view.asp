<!--#include file="connection.asp"-->
<%
	sql = "select a.*,b.BookID,b.Name as [BookName],c.borrowid,c.borrowdate from Students a, books b, Borrows c where a.StudentID = c.StudentID and b.BookID = c.BookID"
	rs.open sql, conn 
	if (rs.eof) then
		response.write("Tập dữ liệu rỗng!")
	else 
%>
<html>
	<head>
		<title>Tiêu đề trang web</title>
		<meta charset="utf-8">
	</head>
	<body>
			<h1 align=center>Danh sách các sách mượn</h1>
			<center><font color=red><%=Session("borrows_error")%></center>
			<br>
			<center><a href="borrows_add.asp">Thêm mới một dòng mượn sách</a></center>
			<table border=1 width=800 align=center>
				<tr>
					<th>Mã mượn</th>
					<th>Tên sách</th>
					<th>Tên sinh viên</th>
					<th>Ngày mượn</th>
					<th>Sửa</th>
					<th>Xóa</th>
				</tr>
				<%
					while not rs.eof 
				%>
					<tr>
						<td><%=rs("borrowid")%></td>
						<td><%=rs("name")%></td>
						<td><%=rs("BookName")%></td>
						<td><%=rs("BorrowDate")%></td>
						<td><a href="borrows_edit.asp?borrowid=<%=rs("borrowid")%>">Sửa</a></td>
						<td><a href="borrows_delete.asp?borrowid=<%=rs("borrowid")%>">Xóa</a></td>
					</tr>
				<%
					rs.movenext
					wend
					rs.close
					conn.close 
				%>
			</table>
			<center><a href="borrows_add.asp">Thêm mới một dòng mượn sách</a></center>			
			
	</body>
</html>
<%
end if
%>