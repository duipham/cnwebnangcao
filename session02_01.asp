<html>
	<head>
		<title>Tiêu đề của website</title>
		<meta charset="utf-8">
	</head>
	<body>
		<h1 align=center>Đăng ký thông tin</h1>
		<form name=f method=POST action="session02_01_action.asp">
		<table border=0 cellspacing=5 cellpadding=5 align=center width=500>
				<tr>
					<td>Họ và tên:</td>
					<td><input type=text name=txtHoVaTen></td>
				</tr>
				<tr>
					<td>Mật khẩu:</td>
					<td><input type=password name=txtMatKhau></td>
				</tr>
				<tr>
					<td>Giới tính:</td>
					<td><input type=radio name=rdGioiTinh value="Nam">Nam
						<input type=radio name=rdGioiTinh checked value="Nữ">Nữ
					</td>
				</tr>
				<tr>
					<td>Khoảng tuổi:</td>
					<td>
						<select name=slKhoangTuoi>
							<option value=0>Dưới 18 tuổi</option>
							<option value=1>Từ 18 đến 25</option>
							<option selected value=2>Trên 25 tuổi</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>Sở thích:</td>
					<td><input type=checkbox name=ckSoThich value="Âm nhạc">Âm nhạc
						<input type=checkbox name=ckSoThich value="Thể thao">Thể thao
						<input type=checkbox name=ckSoThich value="Du lịch">Du lịch
						<br>
						<input type=checkbox name=ckSoThich value="Mua sắm">Mua sắm
						<input type=checkbox name=ckSoThich value="Kiếm tiền">Kiếm tiền
						<input type=checkbox name=ckSoThich value="Tiêu tiền">Tiêu tiền	
					</td>
				</tr>
				<tr>
					<td valign=top>Ghi chú thông tin</td>
					<td>
						<textarea cols=30 rows=6 name=taGhiChu>
						</textarea>
					</td>
				</tr>
				<tr>
					<td align=right><input type=submit name=cmdGuiDi value="Gửi đi"></td>
					<td><input type=reset value="Làm lại"></td>
				</tr>
		</table>
		</form>
	</body>
</html>