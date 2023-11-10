<!--#include file="connection.asp"-->
<%
	page = Cint(request("page"))
	
	if (page<1) then
		page = 1
	end if 
	rs.pagesize = 3
	rs.CursorLocation=3
	rs.open "select P.*,C.cname from product P inner join categories C on P.cid = C.cid", conn, 0, 4
	if (page>rs.pagecount) then
		page = rs.pagecount
	end if
	pagecount = rs.pagecount 
	'response.write(page) 
	rs.absolutepage = page 
%>
<html>
	<head>
		<meta charset="utf-8">
		<script src="https://cdn.ckeditor.com/ckeditor5/40.0.0/classic/ckeditor.js"></script>
	</head>
	<body>
		<h1 align=center>Danh sách sản phẩm có phân trang</h1>
		<table border=1 width=100% align=center>
			<tr>
				<th>Mã</th>
				<th>Tên</th>
				<th>Mô tả</th>
				<th>Ảnh</th>
				<th>Nhóm</th>
				<th>Giá</th>
				<th>Số lượng</th>
			</tr>
			<%
			while ((not rs.eof) and (rs.absolutepage=page)) 
			%>
				<tr>
					<td><%=rs("pid")%></td>
					<td><%=rs("pname")%></td>
					<td>
						<div class="editor"><%=rs("pdesc")%></div>
					</td>
					<td><img src="images/<%=rs("pimage")%>" width=300 height=200></td>
					<td><%=rs("cname")%></td>
					<td><%=rs("pprice")%></td>
					<td><%=rs("pquantity")%></td>
				</tr>
			<%
			rs.movenext
			wend 
			rs.close
			conn.close 
			%>
		</table>
		<center>
		<%
			for i=1 to pagecount 
				if (i=page) then 
					response.write(" " & i &" ")
				else 
					response.write(" <a href=?page=" & i &">" & i & "</a> ")
				end if 
			next
		%>
		</center>
		<script>
			var editors = document.querySelectorAll('.editor');
			for (var i = 0; i < editors.length; ++i) {
				ClassicEditor
					.create( editors[i] )
					.catch( error => {
						console.error( error );
					} );
			}
		</script>
	</body>
</html>