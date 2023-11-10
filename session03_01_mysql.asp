<%
	set conn = Server.CreateObject("ADODB.Connection")
	strconn = "Driver={MySQL ODBC 5.2 ANSI Driver};Server=localhost;Database=test;User=root;Password=;Option=3;"
	conn.open strconn
	'sql = "delete from [user] where uid>5"
	'sql = "insert into [user]([username],[password],fullname,[level],status) values ('hanntt','12344321','Nguyen Thi Thanh Han',1,0)"
	'response.write(sql)
	'conn.execute sql
	conn.close
%>