<!--#include file="connection.asp"-->
<%
	sql = "select * from [user]"
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
			<h1 align=center>Danh sách các tài khoản trong hệ thống</h1>
			<table border=1 width=800 align=center>
				<tr>
					<th>STT</th>
					<th>Tên tài khoản</th>
					<th>Mật khẩu</th>
					<th>Tên dầy đủ</th>
					<th>Quyền</th>
					<th>Trạng thái</th>
				</tr>
				<%
					while not rs.eof 
				%>
					<tr>
						<td><%=rs("uid")%></td>
						<td><%=rs("username")%></td>
						<td><%=rs("password")%></td>
						<td><%=rs("fullname")%></td>
						<td><%=rs("level")%></td>
						<td><%
								if (rs("status")=1) then
									response.write("Hoạt động")
								else 
									response.write("Ngừng hoạt động")
								end if 
						%></td>
					</tr>
				<%
					rs.movenext
					wend
					rs.close
					conn.close 
				%>
			</table>
			
			
	</body>
</html>
<%
end if
%>