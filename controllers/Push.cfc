﻿<cfcomponent extends="Controller">

<cffunction name="send">
	<cfset token="5EC885B63B3451ACD009B1BD504CB32139503476C5197B0595A580B5134A0354">
	<cfset APNSService = createObject( "java", "com.notnoop.apns.APNS" ).newService()
  	.withCert("/var/www/html/lib/push.p12", "3nv3l0p3")
  	.withProductionDestination()
  	.build() />
	
	<cfset payload = createObject( "java", "com.notnoop.apns.APNS" ).newPayload()
				.badge(3)
				.alertBody("Hello world.")
				.build()/>
				
	<cfset APNSService.push(token, payload) />
	
	<cfabort>
</cffunction>

<cffunction name="inactive">
	<cfset APNSService = createObject( "java", "com.notnoop.apns.APNS" ).newService()
  	.withCert("/var/www/html/lib/push.p12", "3nv3l0p3")
  	.withProductionDestination()
  	.build() />
	
	<cfset inactiveDevices = APNSService.getInactiveDevices()>
	
	<cfdump var="#inactiveDevices#" abort>

</cffunction>

</cfcomponent>