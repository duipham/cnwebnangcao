<!--#include file="connection.asp"-->
<%
	rs.open "select cid, cname from Categories", conn 
	rs1.open "select * from Supplier_184466_1", conn 
	rs2.open "select * from Color_184466_1", conn 
%>

<html>
	<head>
		<meta charset="utf-8">
		<title>Tiêu đề trang web</title>
	</head>
	<body>
		<h1 align=center>Tìm kiếm một sản phẩm</h1>
		<center><font color=red><%=Session("product_search_error")%></font></center>
		<form method=POST action="product_search_action.asp">
			<table border=0 align=center width=400>
				<tr>
					<td>Tên sản phẩm:</td>
					<td><input style="width:180px" type=text name=txtPname></td>
				</tr>
				<tr>
					<td>Danh mục:</td>
					<td>
						<select name=slCid>
							<% while not rs.eof 
							%>
								<option value="<%=rs("cid")%>"><%=rs("cname")%></option>
							<%
								rs.movenext
								wend
								rs.close
							%>
						</select>
					</td>
				</tr>
				<tr>
					<td>Nhà cung cấp:</td>
					<td>
						<select name=slSid>
							<% while not rs1.eof 
							%>
								<option value="<%=rs1("sid")%>"><%=rs1("sname")%></option>
							<%
								rs1.movenext
								wend
								rs1.close
							%>
						</select>
					</td>
				</tr>
				<tr>
					<td>Màu:</td>
					<td>
						<select name=slColorid>
							<% while not rs2.eof 
							%>
								<option value="<%=rs2("colorid")%>"><%=rs2("colorname")%></option>
							<%
								rs2.movenext
								wend
								rs2.close
								conn.close
							%>
						</select>
					</td>
				</tr>
				<tr>
					<td align=right><input type=submit value="Tìm kiếm"></td>
					<td><input type=reset value="Làm lại">
                        <input type=hidden name="key" value="66PM5_1">
                    </td>
				</tr>
			</table>
		</form>
	</body>
</html>