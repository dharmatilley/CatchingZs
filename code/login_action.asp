<%@ Language="VBScript" %>

<%
Dim dbhost, dbname_and_username, dbpwd, oConn, sConnection
dbhost = "cgt141s17db.db.9951734.hostedresource.com"
dbname_and_username = "cgt141s17db"
dbpwd = "Test#1234"

Set DB = Server.CreateObject("ADODB.Connection")
sConnection = "Driver={MySQL ODBC 3.51 Driver};&_"Server"=& dbhost &";uid="& dbname_and_username &";pwd="& dbpwd &"
	;database="& dbname_and_username &";"
DB.Open(sConnection)

	p_username = Request("uname")
	p_password = Request("upass")
	
	theSQL="Select * from users where duname='" &p_username& "'and dpass='" &p_password &"'"
	
	set userSet = DB.Execute(theSQL)
	
	if userSet.EOF then
		Response.write("go away")
	else
		Session("firstname")=userSet("dfirst")
	
	Response.Write(p_username)
	Response.Write(p_password)
	
%>