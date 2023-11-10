<html>
	<head>
		<title>Tiêu đề của website</title>
		<meta charset="utf-8">
	</head>
	<body>
		<h1 align=center>Đăng nhập vào hệ thống</h1>
		<form name=f method=POST action="login_action.asp">
		<table border=0 cellspacing=5 cellpadding=5 align=center width=500>
				<tr>
					<td colspan=2 align=center><font style="color:red"><%=Session("login_error")%></font></td>
				</tr>
				<tr>
					<td>Tên đăng nhập:</td>
					<td><input type=text name=txtTenDangNhap></td>
				</tr>
				<tr>
					<td>Mật khẩu:</td>
					<td><input type=password name=txtMatKhau></td>
				</tr>
				<tr>
					<td>Quyền hạn:</td>
					<td>
						<select name=slQuyenHan>
							<option value=0>Admin</option>
							<option value=1>Supper Admin</option>
							<option value=2>Member</option>
							<option value=3>Guest</option>
						</select>
					</td>
				</tr>
				<tr>
					<td align=right><input type=submit name=cmdGuiDi value="Đăng nhập"></td>
					<td><input type=reset value="Làm lại"></td>
				</tr>
		</table>
		</form>
	</body>
</html>