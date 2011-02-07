<cfoutput>
<h1>Welcome to Ticketseller</h1>

<cfif flashKeyExists("success")>
	<p>#flash("success")#</p>
</cfif>

</cfoutput>