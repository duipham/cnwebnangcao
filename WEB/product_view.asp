<!--#include file="connection.asp"-->
<%
    sql = "select  from "
    rs_prod.open sql, conn
%>
<html>
    <head>
        <title>Tiêu đề trang web</title>
        <meta charset='utf-8'>
    </head>
    <body>
        <h1 align=center>Danh sách</h1>
        <center><font color=red><%=Session("product_message")%></center>
        <br>
        <center><a href="product_add_view.asp">Thêm mới một product</a></center>
        <table border=1 width=800 align=center>
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Image</th>
                <th>Status</th>
                <th>Description</th>
            </tr>
        <%
            if (rs.eof) then
                response.write("<tr><td colspan=8>Tập dữ liệu rỗng!</td></tr>")
            else
                while not rs.eof 
        %>
        <tr>
        <td><%=rs("id")%></td>
        <td><%=rs(
    )%></td>
        <td><%=rs(
    )%></td>
        <td><img src="./<%=rs("image")%>" width=200></td>
        <td><%
                if (rs("status")=1) then
                response.write("Hoạt động")
                else
                response.write("Ngừng hoạt động")
                end if
        %></td>
        <td><a href="_edit.asp?id=<%=rs("pid")%>">Sửa</a></td>
        <td><a onclick="return confirm('Bạn có chắc muốn xoá <%=rs("name")%> hay ko?');"  href="delete.asp?id=<%=rs("pid")%>">Xóa</a></td>
    </tr>
    <%
    rs.movenext
    wend
    rs.close
    conn.close 
    %>
    <%
    end if
    %>
    </table>
    <center><a href="add.asp">Thêm mới </a></center>
    </body>
    </html>