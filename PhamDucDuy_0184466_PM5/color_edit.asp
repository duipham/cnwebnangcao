<html>
	<head>
		<meta charset="utf-8">
		<title>Tiêu đề trang web</title>
	</head>
	<body>
		<h1 align=center>Cập nhật màu</h1>
		<center><font color=red><%=Session("color_edit_error")%></font></center>
		<form method=POST action="color_edit_action.asp">
			<table border=0 align=center width=400>
				<tr>
					<td>Tên màu :</td>
					<td><input style="width:180px" type=text name=txtClname></td>
				</tr>
				<tr>
					<td>Trạng thái:</td>
					<td><input type=radio checked name=rdClstatus value=1>Còn
						<input type=radio name=rdClstatus value=0>Hết
					</td>
				</tr>
				<tr>
					<td align=right><input type=submit value="Lưu"></td>
					<td><input type=reset value="Làm lại">
						<input type=hidden name=colorid value="<%=colorid%>">
				</tr>
			</table>
		</form>
	</body>
</html>