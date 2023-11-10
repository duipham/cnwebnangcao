<html>
	<head>
		<meta charset="utf-8">
		<title>Tiêu đề trang web</title>
	</head>
	<body>
		<h1 align=center>Thêm mới một danh mục</h1>
		<center><font color=red><%=Session("categories_add_error")%></font></center>
		<form method=POST action="categories_add_action.asp">
			<table border=0 align=center width=400>
				<tr>
					<td>Tên danh mục:</td>
					<td><input style="width:180px" type=text name=txtCname></td>
				</tr>
				<tr>
					<td>Mô tả:</td>
					<td><textarea cols=20 style="width:180px" rows=6 name=taCdesc></textarea></td>
				</tr>
				<tr>
					<td>Ảnh:</td>
					<td><input type=text  style="width:180px" name=txtCimage></td>
				</tr>
				<tr>
					<td>Thứ tự:</td>
					<td><input type=text style="width:180px" name=txtCorder></td>
				</tr>
				<tr>
					<td>Trạng thái:</td>
					<td><input type=radio checked name=rdCstatus value=1>Hoạt động
						<input type=radio name=rdCstatus value=0>Ngừng Hoạt động
					</td>
				</tr>
				<tr>
					<td align=right><input type=submit value="Thêm mới"></td>
					<td><input type=reset value="Làm lại">
				</tr>
			</table>
		</form>
	</body>
</html>