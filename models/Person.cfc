<cfcomponent extends="Model">

	<cffunction name="init">
		
		<cfset validatesPresenceOf("firstname, surname, email")>
		<cfset validatesUniquenessOf("email")>
		<cfset validatesLengthOf(property="firstname", maximum=50)>
		<cfset validatesLengthOf(property="surname", maximum="50")>
		<cfset validatesFormatOf(property="email", type="email")>
		<cfset validatesConfirmationOf("password")>
		
	</cffunction>

</cfcomponent>