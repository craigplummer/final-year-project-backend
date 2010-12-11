<cfset urltmp = "http://" &"#CGI.Server_name#" & ":" & "#cgi.SERVER_PORT#" & "#CGI.Script_name#">
<cfif CGI.QUERY_STRING is not "">
  <cfset urlfin = urltmp & "?#CGI.QUERY_STRING#">
<cfelse>
  <cfset urlfin = urltmp>
</cfif>

<cflogin idletimeout="1800">

<form action="<cfoutput>#urlfin#</cfoutput>" method="post">
	<label for="email">E-Mail Address: </label><input type="text" name="j_username" id="email" />
	<label for="password">Password: </label><input type="password" name="j_password" id="password">
	<input type="submit">
</form>