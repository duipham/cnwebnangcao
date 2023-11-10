<!--#include file="connection.asp"-->
<%
	'Sửa dữ liệu: 
	'Lấy dữ liệu cũ theo khóa chính 
	'Hiển thị dữ liệu cũ ra form 
	'Khi form submit thì lấy các dữ liệu được truyền
	'Thực hiện việc update
	'Quay lại trang hiển thị
	borrowid = Request.QueryString("borrowid")
	'lấy thông tin cũ của dòng cần sửa
	sql = "select * from Borrows where borrowID=" & borrowid 
	rs.open sql, conn 
	'lấy thông tin sinh viên
	sql1 = "select * from Students"
	rs1.open sql1, conn 
	'lấy thông tin Sách
	sql2 = "select * from Books"
	rs2.open sql2, conn 
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
		<h1 align=center>Sửa thông tin sách mượn</h1>
			<center><font color=red><%=session("borrows_add_error")%></font></center>
		<form method=POST action="borrows_edit_action.asp?borrowid=<%=borrowid%>">
			<table border=0 align=center cellspacing=10>
				<tr>
					<td align=right>Chọn tên cuốn sách:</td>
					<td><select class=dodai name=slBookid>
						<%
							while not rs2.eof 
						%>
								<option value="<%=rs2("bookid")%>"
								<% if (rs("bookid")=rs2("bookid")) then
										response.write(" selected")
								   end if
								%>
								><%=rs2("name")%></option>
						<%
							rs2.movenext
							wend
							rs2.close
						%>
						</select>
					</td>
				</tr>
				<tr>
					<td align=right>Tên sinh viên:</td>
					<td>
						<select class=dodai name=slStudentid>
						<%
							while not rs1.eof 
						%>
							<option value="<%=rs1("studentid")%>"
							<% if (rs("studentid")=rs1("studentid")) then
										response.write(" selected")
								   end if
								%>
							><%=rs1("name")%></option>
						<%
							rs1.movenext
							wend
							rs1.close
							'conn.close
						%>
						</select>
					</td>
				</tr>
				<tr>
					<td align=right>Ngày mượn:</td>
					<td><input class=dodai type="text" value="<%=rs("borrowDate")%>" name="BorrowDate" id="BorrowDate"></td>
				</tr>
				<tr>
					<td align=right><input type=submit value="Cập nhật"></td>
					<td><input type=reset value="Làm lại"></td>
				</tr>
			</table>
		</form>
	</body>
</html>
	
