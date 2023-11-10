<!--#include file="connection.asp"-->
<%
	'lấy danh sách sinh viên
	'lấy danh sách cuốn sách
	sql = "select * from Students"
	sql1 = "select * from Books"
	rs.open sql, conn 
	rs1.open sql1, conn 
%>
<html>
	<head>
		<title>Tiêu đề trang web</title>
		<meta charset="utf-8">
		<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
	  <link rel="stylesheet" href="/resources/demos/style.css">
	  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	  <script>
	  $( function() {
		$( "#BorrowDate" ).datepicker();
	  } );
	  </script>
		<style type="text/css">
			.dodai{ width:200px;}
		</style>
	</head>
	<body>
		<h1 align=center>Mượn thêm một cuốn sách</h1>
			<center><font color=red><%=session("borrows_add_error")%></font></center>
		<form method=POST action="borrows_add_action.asp">
			<table border=0 align=center cellspacing=10>
				<tr>
					<td align=right>Chọn tên cuốn sách:</td>
					<td><select class=dodai name=slBookid>
						<%
							while not rs1.eof 
						%>
								<option value="<%=rs1("bookid")%>"><%=rs1("name")%></option>
						<%
							rs1.movenext
							wend
							rs1.close
						%>
						</select>
					</td>
				</tr>
				<tr>
					<td align=right>Tên sinh viên:</td>
					<td>
						<select class=dodai name=slStudentid>
						<%
							while not rs.eof 
						%>
							<option value="<%=rs("studentid")%>"><%=rs("name")%></option>
						<%
							rs.movenext
							wend
							rs.close
							conn.close
						%>
						</select>
					</td>
				</tr>
				<tr>
					<td align=right>Ngày mượn:</td>
					<td><input class=dodai type="text" name="BorrowDate" id="BorrowDate"></td>
				</tr>
				<tr>
					<td align=right><input type=submit value="Thêm mới"></td>
					<td><input type=reset value="Làm lại"></td>
				</tr>
			</table>
		</form>
	</body>
</html>
	