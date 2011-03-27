<h1>Editing regions</h1>

<cfoutput>

			#errorMessagesFor("regions")#
	
			#startFormTag(action="update", key=params.key)#
		
				
						#textField(objectName='regions', property='name', label='Name')#
					
				
				#submitTag()#
				
			#endFormTag()#
			

#linkTo(text="Return to the listing", action="index")#
</cfoutput>
