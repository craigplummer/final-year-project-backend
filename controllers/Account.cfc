﻿<cfcomponent extends="Controller" output="false">

	<cffunction name="init">
		 <cfset provides("html,json")>
	</cffunction>

	<cffunction name="register">
		
		<cfset user = model("person").new()>
		<cfset renderPage(layout="registerLayout")>
		
	</cffunction>
	
	<cffunction name="create">
	
		<cfset user = model("person").new(params.user)>
		<cfset user.id = createuuid()>
		<cfset user.save()>
		
		<cfif user.hasErrors()>
			<cfset renderPage(action="register", layout="registerLayout")>
		<cfelse>
			<cfset flashInsert(success="Registration was sucessful")>
			<cfset redirectTo(controller="account", action="dashboard")>	
		</cfif>
			
	</cffunction>
	
	<cffunction name="device">
		<cfset user = model("person").findOne(where="email='#params.email#'")>
		<cfif model("device").exists(where="devicetoken='#params.token#'")>
    		<cfset response = {}>
			<cfset response['success'] = "false">
    	<cfelse>
    		<cfset device = model("device").new()>
			<cfset device.id = createuuid()>
			<cfset device.userid = "#user.id#">
			<cfset device.devicetoken = "#params.token#">
		
			<cfif device.save()>
				<cfset response = {}>
				<cfset response['success'] = "true">
			<cfelse>
				<cfset response = {}>
				<cfset response['success'] = "false">
			</cfif>
		</cfif>
		
		
		<cfset renderWith(response)>
		
	</cffunction>
	
	<cffunction name="mobileregister">
		<cfset user = model("person").new()>
		<cfset renderPage(layout="mobilelayout")>
		
	</cffunction>
	
	<cffunction name="dashboard">
		<cfset events = model("event").findAll(where="personid='#session.user.id#'")>
		
		
		
	</cffunction>
	
	<cffunction name="mobilecreate">
		<cfset user = model("person").new(params.user)>
		<cfset user.id = createuuid()>
		<cfset user.save()>
		
		<cfif user.hasErrors()>
			<cfset renderPage(action="mobileregister", layout="mobilelayout")>
		<cfelse>
			<cfset flashInsert(success="Registration was sucessful")>
			<cfset redirectTo(controller="account", action="mobilethanks")>	
		</cfif>
	</cffunction>
	
	<cffunction name="twitter">

		<cfset session.user.email = #params.email#>
		<cfset Twitter = createObject("java", "twitter4j.Twitter")>
	
		<cfset Twitter.setOAuthConsumer('q8RebEtK6UObawa7Ia4zQ','SrenfcKPuFwVporxcjIpZvFXQoWDSy6QUa3GOAhxo')>
		
		<cfset RequestToken = Twitter.getOAuthRequestToken()>
		<cfset Session.oAuthRequestToken = RequestToken.getToken()>
		<cfset Session.oAuthRequestTokenSecret = RequestToken.getTokenSecret()>
		
		<cflocation url="#RequestToken.getAuthorizationURL()#" addtoken="No">
		
		
	</cffunction>
	
	<cffunction name="twitterconfirm">
		<cfset Twitter = createObject("java", "twitter4j.Twitter")>
		<cfset Twitter.setOAuthConsumer('q8RebEtK6UObawa7Ia4zQ','SrenfcKPuFwVporxcjIpZvFXQoWDSy6QUa3GOAhxo')>
		<cfset AccessToken = Twitter.getOAuthAccessToken(Session.oAuthRequestToken,Session.oAuthRequestTokenSecret)>
		<cfset token = AccessToken.getToken()>
		<cfset secret = AccessToken.getTokenSecret()>
		<cfset user = model("person").updateOne(where="email='#session.user.email#'", taccesstoken="#token#", taccesssecret="#secret#")>
		
		
			<cfset renderPage(layout="mobilelayout")>
		
	</cffunction>
	
	<cffunction name="mobilethanks">
		<cfset renderPage(layout="mobilelayout")>
	</cffunction>
	
	<cffunction name="login">
	
		
		<cfset user = model("person").new()>
		<cfset renderPage(layout="loginLayout")>
	
	</cffunction>
	
	<cffunction name="signin">
		
		<cfset user = model("person").findOne(where="email='#params.user.email#' AND password='#params.user.password#'")>
		
		<cfif IsObject(user)>
			<cfset session.user.id = user.id>
			<cfset session.user.firstname = user.firstname>
			<cfset session.user.surname = user.surname>
			<cfset redirectTo(controller="account", action="dashboard")>
		<cfelse>
			<cfset user = model("person").new(email=params.user.email)>
			<cfset flashInsert(error="Your username or password was incorrect")>
			<cfset renderPage(action="login", layout="loginLayout")>
		</cfif>
				
	</cffunction>
	
	<cffunction name="mobilesignin">
	
		<cfset user = model("person").findOne(where="email='#params.email#' AND password='#params.password#'")>
	
		<cfif IsObject(user)>
			<cfset response = {}>
			<cfset response['success'] = "true">
		<cfelse>
			<cfset response = {}>
			<cfset response['success'] = "false">
		</cfif>
		
		<cfset renderWith(response)>
	
	</cffunction>
	
	<cffunction name="logout">
	
		<cfset StructDelete(session, "user")>
		<cfset redirectTo(controller="account", action="login")>
	
	</cffunction>

</cfcomponent>