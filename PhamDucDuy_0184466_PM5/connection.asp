<%
	set conn = Server.CreateObject("ADODB.Connection")
	set rs = Server.CreateObject("ADODB.Recordset")
	set rs1 = Server.CreateObject("ADODB.Recordset")
	set rs2 = Server.CreateObject("ADODB.Recordset")
	set rs3 = Server.CreateObject("ADODB.Recordset")
	strconn = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & Server.Mappath("Database.mdb") & ";Mode=ReadWrite"
	conn.open strconn  
%>