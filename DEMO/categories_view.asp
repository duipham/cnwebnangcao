<!--#include file="connection.asp"-->
<%
	sql = "select * from Categories order by corder desc"
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
			<h1 align=center>Danh sách các nhóm sản phẩm trong hệ thống</h1>
			<center><font color=red><%=Session("categories_error")%></center>
			<br>
			<center><a href="categories_add.asp">Thêm mới một danh mục</a></center>
			<table border=1 width=800 align=center>
				<tr>
					<th>Mã nhóm</th>
					<th>Tên nhóm</th>
					<th>Mô tả</th>
					<th>Ảnh</th>
					<th>Thứ tự</th>
					<th>Trạng thái</th>
					<th>Sửa</th>
					<th>Xóa</th>
				</tr>
				<%
					while not rs.eof 
				%>
					<tr>
						<td><%=rs("cid")%></td>
						<td><%=rs("cname")%></td>
						<td><%=rs("cdesc")%></td>
						<td><img src="images/<%=rs("cimage")%>" width=200></td>
						<td><%=rs("corder")%></td>
						<td><%
								if (rs("cstatus")=1) then
									response.write("Hoạt động")
								else 
									response.write("Ngừng hoạt động")
								end if 
						%></td>
						<td><a href="categories_edit.asp?cid=<%=rs("cid")%>">Sửa</a></td>
						<td><a href="categories_delete.asp?cid=<%=rs("cid")%>">Xóa</a></td>
					</tr>
				<%
					rs.movenext
					wend
					rs.close
					conn.close 
				%>
			</table>
			<center><a href="categories_add.asp">Thêm mới một danh mục</a></center>			
			
	</body>
</html>
<%
end if
%>