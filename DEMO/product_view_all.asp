<!--#include file="connection.asp"-->
<%
	action = Request("action")
	pid = Request("pid")
	select case action
	case "save_add"
		pname=Request("txtPname")
		pdesc=Request("taPdesc")
		pimage=Request("txtPimage")
		pprice=Request("txtPprice")
		pquantity=Request("txtPquantity")
		cid = Request("slCid")
		pstatus=Request("rdPstatus")
		rs.open "select * from Product where pname like '" & pname &"'",conn
		if (not rs.eof) then
			session("product_add_error")=pname & " đã tồn tại!"
			response.redirect("product_view_all.asp?action=add")
		else 
			sql="insert into product(pname,pdesc,pimage,pprice,pquantity,cid,pstatus) values ('" & pname & "','" & pdesc & "','" & pimage & "'," & pprice & "," & pquantity &"," & cid & "," &pstatus &")"
			'response.write(sql)
			conn.execute sql 
			session("product_error")="Thêm mới thành công!"
		end if 
		rs.close 
	case "save_edit"
		pname=Request("txtPname")
		pdesc = Request("taPdesc")
		pimage = Request("txtPimage")
		cid = Request("slCid")
		pstatus = Request("rdPstatus")
		rs.open "select * from Product where pname like '" & pname & "' and pid<>" &pid, conn 
		if (not rs.eof) then
			session("product_error")=pname & " đã tồn tại!"
			response.redirect("product_view_all.asp?action=edit&pid="&pid) 
		else 
			sql = "update product set pname='" & pname & "',pdesc = '" & pdesc & "',pimage='" & pimage & "',cid = " & cid & ",pstatus = " & pstatus & " where pid = " & pid 
			'response.write("Vào đây")
			conn.execute sql 
			Session("product_error") = "Cập nhật thành công!"
			
		end if
		rs.close 
	case "delete"
		conn.execute "delete from product where pid = " & pid 
		session("product_error")="Xóa thành công!"
	
	end select 
	sql = "select Product.*,Categories.cname from Product, Categories where Product.cid = Categories.cid"
	rs.open sql, conn  
%>
<html>
	<head>
		<title>Tiêu đề trang web</title>
		<meta charset="utf-8">
	</head>
	<body>
			<h1 align=center>Danh sách các sản phẩm trong hệ thống</h1>
			<center><font color=red><%=Session("product_error")%></font></center>
			<br>
			<center><a href="product_view_all.asp?action=add">Thêm mới một sản phẩm</a></center>
			<table border=1 width=100% align=center>
				<tr>
					<th>Mã sản phẩm</th>
					<th>Tên sản phẩm </th>
					<th>Mô tả</th>
					<th>Ảnh</th>
					<th>Nhóm sản phẩm</th>
					<th>Trạng thái</th>
					<th>Sửa</th>
					<th>Xóa</th>
				</tr>
				<%
				if (rs.eof) then
					response.write("<tr><td colspan=8>Tập dữ liệu rỗng!</td></tr>")
				else
					while not rs.eof 
					if ((action="edit") and (cint(pid)=rs("pid"))) then
						rs1.open "select * from Categories",conn 
					%>	
						<form action="product_view_all.asp?action=save_edit" method=POST>
							<tr valign=top>
								<td><%=rs("pid")%></td>
								<td><input type=text name=txtPname value="<%=rs("pname")%>"></td>
								<td><textarea cols=15 rows=5 name=taPdesc><%=rs("pdesc")%></textarea></td>
								<td><input type=text name=txtPimage value="<%=rs("pimage")%>"></td>
								<td>
									<select name=slCid>
									<% while not rs1.eof 
									%>
										<option value="<%=rs1("cid")%>"
										<% if rs1("cid")=rs("cid") then	
											response.write(" selected ")
											end if 
										%>
										><%=rs1("cname")%></option>
									<%
										rs1.movenext
										wend
										rs1.close
										
									%>
								</select>
								</td>
								<td><input type=radio
									<% if (rs("pstatus")=1) then 
										response.write(" checked ")
										end if 
									%>
								name=rdPstatus value=1>Hoạt động
									<br> 
									<input type=radio
									<% if (rs("pstatus")=0) then 
										response.write(" checked ")
										end if 
									%>
									name=rdPstatus value=0>Ngừng Hoạt động
								</td>
								<td><input type=submit value="Lưu"></td>
								<td><input type=button value="Hủy bỏ" onClick="window.location='product_view_all.asp';">
									<input type=hidden name=pid value="<%=pid%>">
								</td>
							</tr>
						</form>
					<%
					else 
				%>
					<tr>
						<td><%=rs("pid")%></td>
						<td><%=rs("pname")%></td>
						<td><%=rs("pdesc")%></td>
						<td><img src="images/<%=rs("pimage")%>" width=200></td>
						<td><%=rs("cname")%></td>
						<td><%
								if (rs("pstatus")=1) then
									response.write("Hoạt động")
								else 
									response.write("Ngừng hoạt động")
								end if 
						%></td>
						<td><a href="product_view_all.asp?action=edit&pid=<%=rs("pid")%>">Sửa</a></td>
						<td><a onclick="return confirm('Bạn có chắc muốn xoá <%=rs("pname")%> hay ko?');"  href="product_view_all.asp?action=delete&pid=<%=rs("pid")%>">Xóa</a></td>
					</tr>
				<%
					end if 
					rs.movenext
					wend
					rs.close
					
				%>
				<%
					end if
					%>
			</table>
			<center><a href="product_view_all.asp?action=add">Thêm mới một sản phẩm</a></center>			
			<%
				if (Request("action")="add") then 
					rs.open "select * from Categories", conn
					%>
				<h1 align=center>Thêm mới một sản phẩm</h1>
				<center><font color=red><%=Session("product_add_error")%></font></center>
				<form method=POST action="product_view_all.asp">
					<table border=0 align=center width=400>
						<tr>
							<td>Tên sản phẩm:</td>
							<td><input style="width:180px" type=text name=txtPname></td>
						</tr>
						<tr>
							<td>Mô tả:</td>
							<td><textarea cols=20 style="width:180px" rows=6 name=taPdesc></textarea></td>
						</tr>
						<tr>
							<td>Ảnh:</td>
							<td><input type=text  style="width:180px" name=txtPimage></td>
						</tr>
						<tr>
							<td>Giá:</td>
							<td><input type=text style="width:180px" name=txtPprice></td>
						</tr>
						<tr>
							<td>Số lượng:</td>
							<td><input type=text style="width:180px" name=txtPquantity></td>
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
										conn.close
									%>
								</select>
							</td>
						</tr>
						
						<tr>
							<td>Trạng thái:</td>
							<td><input type=radio checked name=rdPstatus value=1>Hoạt động
								<input type=radio name=rdPstatus value=0>Ngừng Hoạt động
							</td>
						</tr>
						<tr>
							<td align=right><input type=submit value="Thêm mới"></td>
							<td><input type=reset value="Làm lại">
								<input type=hidden name=action value="save_add">
							</td>
							
						</tr>
					</table>
				</form>

			
			<%
				end if 
			%>
	</body>
</html>
<%
	session("product_error")=""
	session("product_add_error")=""
%>
