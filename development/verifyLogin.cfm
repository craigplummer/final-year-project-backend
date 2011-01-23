<cfquery name="qCheckLogin" datasource="ticketseller">
	SELECT uuid from crm_users where email='#url.email#' and password='#url.password#'
</cfquery>

<cfif #qCheckLogin.recordcount# EQ 1>
	<cfoutput>1</cfoutput>
<cfelse>
	<cfoutput>0</cfoutput>
</cfif>