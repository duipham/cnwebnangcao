<%
	set conn = Server.CreateObject("ADODB.Connection")
	set rs_prod = Server.CreateObject("ADODB.Recordset")
	set rs_user = Server.CreateObject("ADODB.Recordset")
	set rs_ord = Server.CreateObject("ADODB.Recordset")
	strconn = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & Server.Mappath("Database2.mdb")
	conn.open strconn
%>