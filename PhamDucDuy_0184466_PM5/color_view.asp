<!--#include file="connection.asp"-->
<%
	sql = "select * from Color_184466_1"
	rs.open sql, conn  
%>
<html>
	<head>
		<title>Tiêu đề trang web</title>
		<meta charset="utf-8">
	</head>
	<body>
			<h1 align=center>Danh sách các màu</h1>
			<center><font color=red><%=Session("color_error")%></center>
			<br>
			<table border=1 width=800 align=center>
				<tr>
					<th>Mã màu</th>
					<th>Tên màu</th>
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
						<td><%=rs("colorid")%></td>
						<td><%=rs("colorname")%></td>
						<td><%
								if (rs("colorstatus")=1) then
									response.write("Còn")
								else 
									response.write("Hết")
								end if 
						%></td>
						<td><a href="color_edit.asp?colorid=<%=rs("colorid")%>">Sửa</a></td>
						<td><a onclick="return confirm('Bạn có chắc muốn xoá màu <%=rs("colorname")%> hay ko?');"  href="color_delete.asp?colorid=<%=rs("colorid")%>">Xóa</a></td>
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
			<center><a href="color_add.asp">Thêm mới một màu</a></center>			
			
	</body>
</html>
