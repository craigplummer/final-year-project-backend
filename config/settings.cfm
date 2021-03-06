<!---
	If you leave these settings commented out, Wheels will set the data source name to the same name as the folder the application resides in.
--->
	<cfset set(dataSourceName="ticketseller")>

<!--- Adding new data types --->

<cfset addFormat(extension="json", mimeType="application/json")> 

<!---Set a reload password--->
<cfset set(reloadPassword="3nv3l0p3")>

<!---
	If you leave this setting commented out, Wheels will try to determine the URL rewrite capabilities automatically.
	The URLRewriting setting can bet set to "On", "Partial" or "Off".
	To run with "Partial" rewriting, the "PATH_INFO" variable needs to be supported by the web server.
	To run with rewriting "On", you need to apply the necessary rewrite rules on the web server first.
	<cfset set(URLRewriting="Partial")>
--->

	<cfset set(functionName="textField", labelPlacement="before")> 
	<cfset set(functionName="passwordField", labelPlacement="before")>
	<cfset set(functionName="textArea", labelPlacement="before")>
	<cfset set(functionName="select", labelPlacement="before")>