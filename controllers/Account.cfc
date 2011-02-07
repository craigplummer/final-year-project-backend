﻿<cfcomponent extends="Controller" output="false">

	<cffunction name="register">
		
		<cfset user = model("person").new()>
		<cfset renderPage(layout="registerLayout")>
		
	</cffunction>
	
	<cffunction name="create">
	
		<cfset user = model("person").new(params.user)>
		<cfset user.save()>
		
		<cfif user.hasErrors()>
			<cfset renderPage(action="register", layout="registerLayout")>
		<cfelse>
			<cfset flashInsert(success="Registration was sucessful")>
			<cfset redirectTo(controller="account", action="dashboard")>	
		</cfif>
			
	</cffunction>
	
	<cffunction name="login">
	
		
		<cfset user = model("person").new()>
		<cfset renderPage(layout="loginLayout")>
	
	</cffunction>
	
	<cffunction name="signin">
		
		<cfset user = model("person").findOne(where="email='#params.user.email#' AND password='#params.user.password#'")>
		
		<cfif IsObject(user)>
			<cfset session.user.id = user.id>
			<cfset redirectTo(controller="account", action="dashboard")>
		<cfelse>
			<cfset user = model("person").new(email=params.user.email)>
			<cfset flashInsert(error="Your username or password was incorrect")>
			<cfset renderPage(action="login", layout="loginLayout")>
		</cfif>
				
	</cffunction>
	
	<cffunction name="logout">
	
		<cfset StructDelete(session, "user")>
		<cfset redirectTo(controller="account", action="login")>
	
	</cffunction>

</cfcomponent>