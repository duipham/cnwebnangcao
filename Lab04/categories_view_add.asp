<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Category</title>
</head>
<body>
    <h1 align="center">Thêm 1 danh mục (categories)</h1>
    <center>
        <font color=red>
            <%Session("categories_add_error")%>
        </font>
    </center>
    <form action="categories_add_action.asp" method="post">
        <table border="0" align="center" width=400>
            <tr>
                <td>Tên danh mục</td>
                <td><input type="text" name="txtCname"></td>
            </tr>
            <tr>
                <td>Mô tả</td>
                <td><textarea name="txtCdesc" cols="30" rows="10"></textarea></td>
            </tr>
            <tr>
                <td>Ảnh</td>
                <td><input type="text" name="txtCimage"></td>
            </tr>
            <tr>
                <td>Thứ tự</td>
                <td><input type="text" name="numCorder"></td>
            </tr>
            <tr>
                <td>Trạng thái</td>
                <td>
                    Hoạt động
                    <input type="radio" name="rdCstatus" value="1">
                </td>
                <td>
                    Ngừng hoạt động
                    <input type="radio" name="rdCstatus" value="0">
                </td>
            </tr>
            <tr>
                <td><input type="submit" value="Thêm"></td>
                <td><input type="button" value="Làm lại"></td>
            </tr>
        </table>
    </form>
</body>
</html>