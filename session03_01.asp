<%
	set conn = Server.CreateObject("ADODB.Connection")
	strconn = "Provider=Microsoft.JET.OLEDB.4.0;Data Source=" & Server.Mappath("database.mdb")
	conn.open strconn
	sql = "delete from [user] where uid>5"
	'sql = "insert into [user]([username],[password],fullname,[level],status) values ('hanntt','12344321','Nguyen Thi Thanh Han',1,0)"
	'response.write(sql)
	conn.execute sql
	conn.close
%>