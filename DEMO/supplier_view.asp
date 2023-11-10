<!--#include file="connection.asp"-->
<%
	sql = "select * from Supplier_184466_1"
	rs.open sql, conn  
%>
<html>
	<head>
		<title>Tiêu đề trang web</title>
		<meta charset="utf-8">
	</head>
	<body>
			<h1 align=center>Danh sách các nhà cung cấp</h1>
			<center><font color=red><%=Session("supplier_error")%></center>
			<br>
			<table border=1 width=800 align=center>
				<tr>
					<th>Mã nhà cung cấp</th>
					<th>Tên nhà cung cấp</th>
					<th>Địa chỉ</th>
					<th>Số điện thoại</th>
					<th>Số tax</th>
					<th>Trạng thái</th>
					<th>Sửa</th>
					<th>Xóa</th>
				</tr>
				<%
				if (rs.eof) then
					response.write("<tr><td colspan=8>Tập dữ liệu rỗng!</td></tr>")
				else
					while not rs.eof 
				%>
					<tr>
						<td><%=rs("sid")%></td>
						<td><%=rs("sname")%></td>
						<td><%=rs("saddress")%></td>
						<td><%=rs("sphone")%></td>
						<td><%=rs("stax")%></td>
						<td><%
								if (rs("sstatus")=1) then
									response.write("Hoạt động")
								else 
									response.write("Ngừng hoạt động")
								end if 
						%></td>
						<td><a href="supplier_edit.asp?sid=<%=rs("sid")%>">Sửa</a></td>
						<td><a onclick="return confirm('Bạn có chắc muốn xoá NCC <%=rs("sname")%> hay ko?');"  href="supplier_delete.asp?sid=<%=rs("sid")%>">Xóa</a></td>
					</tr>
				<%
					rs.movenext
					wend
					rs.close
					conn.close 
				%>
				<%
					end if
					%>
			</table>
			<center><a href="supplier_add.asp">Thêm mới một nhà cung cấp</a></center>			
			
	</body>
</html>
