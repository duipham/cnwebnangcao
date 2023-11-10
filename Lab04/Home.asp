<!--#include file="Connection.asp"-->
<%
	sql = "select * from [categories]"
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
			<a href="./categories_view_add.asp">Thêm mới</a>
			<table border=1 width=800 align=center>
				<tr>
					<th>STT</th>
					<th>Name</th>
					<th>Image</th>
					<th>Description</th>
					<th>Order</th>
					<th>Is Empty</th>
				</tr>
				<%
					while not rs.eof 
				%>
                <tr>
                    <td><%=rs("cid")%></td>
                    <td><%=rs("cname")%></td>
                    <td><%=rs("cimage")%></td>
                    <td><%=rs("cdesc")%></td>
                    <td><%=rs("corder")%></td>
                    <td><%
                            if (rs("cstatus")=1) then
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