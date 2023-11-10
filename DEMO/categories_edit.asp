<!--#include file="connection.asp"-->
<%
	cid = Request.QueryString("cid")
	sql = "select * from Categories where cid=" & cid 
	rs.open sql, conn 
	if (rs.eof) then
		Session("categories_error")="Không có bản ghi phù hợp!"
		response.Redirect("categories_view.asp")
	else 
%>
<html>
	<head>
		<meta charset="utf-8">
		<title>Tiêu đề trang web</title>
	</head>
	<body>
		<h1 align=center>Sửa danh mục</h1>
		<center><font color=red><%=Session("categories_edit_error")%></font></center>
		<form method=POST action="categories_edit_action.asp">
			<table border=0 align=center width=400>
				<tr>
					<td>Tên danh mục:</td>
					<td><input style="width:180px" type=text name=txtCname value="<%=rs("cname")%>"></td>
				</tr>
				<tr>
					<td>Mô tả:</td>
					<td><textarea cols=20 style="width:180px" rows=6 name=taCdesc><%=rs("cdesc")%></textarea></td>
				</tr>
				<tr>
					<td>Ảnh:</td>
					<td><input type=text  style="width:180px" name=txtCimage value="<%=rs("cimage")%>"></td>
				</tr>
				<tr>
					<td>Thứ tự:</td>
					<td><input type=text style="width:180px" name=txtCorder value="<%=rs("corder")%>"></td>
				</tr>
				<tr>
					<td>Trạng thái:</td>
					<td><input type=radio <%if rs("cstatus")=1 then Response.write(" checked ")%> name=rdCstatus value=1>Hoạt động
						<input type=radio name=rdCstatus value=0 <%if rs("cstatus")=0 then Response.write(" checked ")%> >Ngừng Hoạt động
					</td>
				</tr>
				<tr>
					<td align=right><input type=submit value="Cập nhật"></td>
					<td><input type=reset value="Làm lại">
						<input type=hidden name=cid value="<%=cid%>">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
<%
	end if 
	rs.close
	conn.close
%>