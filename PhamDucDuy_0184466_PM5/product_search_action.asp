<!--#include file="connection.asp"-->
<%
	pname=Request.Form("txtPname")
	cid=Request.Form("slCid")
	sid=Request.Form("slSid")
	colorid=Request.Form("slColorid")
    key=Request.Form("key")
	sql="select * From Product where pname LIKE '%" & pname &"%' and Product.cid=" & cid & " and sid=" & sid & " and colorid=" & colorid
	rs.open sql, conn 
	if (rs.eof) then
        Response.write "<h1>"
		Session("product_search_error")="Không có sản phẩm nào thoả mãn"
%>
<%
    else 	
        rs1.open "select cname from Categories where cid = " & cid, conn
        rs2.open "select sname from Supplier_184466_1 where sid = " & sid, conn
        rs3.open "select colorname from Color_184466_1 where colorid = " & colorid, conn
		Session("product_search_error")="Tìm kiếm thành công!!!"
%>
<html>
	<head>
		<meta charset="utf-8">
		<title>Tiêu đề trang web</title>
	</head>
	<body>
    <script>alert('<%=key%>')</script>
    <center><font color=red><%=Session("product_search_error")%></center>

    <table border=1 width=800 align=center>
        <tr>
            <th>Mã sản phẩm</th>
            <th>Tên sản phẩm </th>
            <th>Mô tả</th>
            <th>Ảnh</th>
            <th>Nhóm sản phẩm</th>
            <th>Nhà cung cấp</th>
            <th>Màu</th>
            <th>Trạng thái</th>
        </tr>
        <%
            while not rs.eof 
        %>
            <tr>
                <td><%=rs("pid")%></td>
                <td><%=rs("pname")%></td>
                <td><%=rs("pdesc")%></td>
                <td><img src="images/<%=rs("pimage")%>" width=200></td>
                <td><%=rs1("cname")%></td>
                <td><%=rs2("sname")%></td>
                <td><%=rs3("colorname")%></td>
                <td><%
                        if (rs("pstatus")=1) then
                            response.write("Hoạt động")
                        else 
                            response.write("Ngừng hoạt động")
                        end if 
                %></td>
            </tr>
        <%
            rs.movenext
            wend
            Session("product_search_error")=""
            rs.close
            conn.close 
        %>
        <%
            end if
        %>
    </table>

    <center><a href="product_search.asp">Tìm kiếm tiếp sản phẩm</a></center>	
	</body>
</html>