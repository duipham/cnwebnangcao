' <html>
' 	<body>
' 		<%
' 			response.write("Trang chủ")
' 		%>
' 	</body>
' </html>

<!--#include file="connection.asp"-->
<%
    sql = "select  from "
    rs.open sql, conn
%>
<html>
    <head>
        <title>Tiêu đề trang web</title>
        <meta charset='utf-8'>
    </head>
    <body>
        <h1 align=center>Danh sách</h1>
        <center><font color=red><%=Session("")%></center>
        <br>
        <center><a href=".asp">Thêm mới một </a></center>
        <table border=1 width=800 align=center>
            <tr>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
            </tr>
        <%
            if (rs.eof) then
                response.write("<tr><td colspan=8>Tập dữ liệu rỗng!</td></tr>")
            else
                while not rs.eof 
        %>
        <tr>
            <td><%=rs("id")%></td>
            <td><%=rs("")%></td>
            <td><%=rs("")%></td>
            <td><img src="./<%=rs("image")%>" width=200></td>
            <td><%
                if (rs("status")=1) then
                    tresponse.write("Hoạt động")
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