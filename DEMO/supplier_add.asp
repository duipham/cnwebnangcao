<html>
	<head>
		<meta charset="utf-8">
		<title>Tiêu đề trang web</title>
	</head>
	<body>
		<h1 align=center>Thêm mới một nhà cung cấp</h1>
		<center><font color=red><%=Session("supplier_add_error")%></font></center>
		<form method=POST action="supplier_add_action.asp">
			<table border=0 align=center width=400>
				<tr>
					<td>Tên nhà cung cấp :</td>
					<td><input style="width:180px" type=text name=txtSname></td>
				</tr>
				<tr>
					<td>Địa chỉ :</td>
					<td><textarea cols=20 style="width:180px" rows=6 name=taSaddress></textarea></td>
				</tr>
				<tr>
					<td>Số điện thoại:</td>
					<td><input type=text  style="width:180px" name=txtSphone></td>
				</tr>
                <tr>
					<td>Số tax:</td>
					<td><input type=text  style="width:180px" name=txtStax></td>
				</tr>
				<tr>
					<td>Trạng thái:</td>
					<td><input type=radio checked name=rdSstatus value=1>Hoạt động
						<input type=radio name=rdSstatus value=0>Ngừng Hoạt động
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