<!---
Filename: Application.cfc
Created by: Craig Plummer (c.m.plummer@herts.ac.uk)
--->

<cfcomponent output="false">
	
	<!--- Application settings --->
	<cfset THIS.Name="TicketsellerMobile" />
	<cfset THIS.ApplicationTimeout = CreateTimeSpan( 0, 0, 5, 0 ) />
	<cfset THIS.SessionManagement = true />
	<cfset THIS.SessionTimeout = CreateTimeSpan ( 0, 0, 0, 20 ) />
	<cfset THIS.SetClientCookies = true />

	
	<!--- Function that is run before each page in the application is loaded --->
	<cffunction name="onRequestStart" returnType="void" output="true">
		<!--- Set the name of the datasource for this application to ticketseller_local --->
		<cfset REQUEST.datasource = "ticketseller_local" />	
		<!--- If login data is incorrect or not defined take user to the login page --->
		<cfif NOT IsDefined("cflogin")>
			<cfinclude template="/account/login.cfm" />
		<cfabort>
		<cfelse>
			<cfquery name="qCheckUser" datasource="#datasource#">
			select uuid from crm_users where username='#cflogin.username#' and password='#cflogin.password#'
			</cfquery>
				<cfif #qCheckUser.recordcount# EQ 1>
					<cfloginuser name="#cflogin.username#" password="#cflogin.password#" roles="std" />
					<!--- Set the location of the header template to be included on all pages --->
					<cfinclude template="/assets/account/header.cfm" />
				<cfelse>
					<cfset errMsg="Your details were not found" />
					<cfinclude template="/account/login.cfm" />
				</cfif>
		</cfif>

	</cffunction>
	
	<!--- Function that is run after each page in the application has loaded --->
	<cffunction name="onRequestEnd" returnType="void" output="true">
		<!--- Set the location of the footer template to be included on all pages --->
		<cfinclude template="/assets/account/footer.cfm" />
	</cffunction>
		
</cfcomponent>