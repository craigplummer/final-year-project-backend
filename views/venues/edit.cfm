<h1>Editing venues</h1>

<cfoutput>

			#errorMessagesFor("venues")#
	
			#startFormTag(action="update", key=params.key)#
		
				
						#textField(objectName='venues', property='name', label='Name')#
					
						#textField(objectName='venues', property='description', label='Description')#
					
						#textField(objectName='venues', property='location', label='Location')#
					
						#textField(objectName='venues', property='gps', label='Gps')#
					
						#textField(objectName='venues', property='address1', label='Address1')#
					
						#textField(objectName='venues', property='address2', label='Address2')#
					
						#textField(objectName='venues', property='towncity', label='Towncity')#
					
						#textField(objectName='venues', property='county', label='County')#
					
						#textField(objectName='venues', property='postcode', label='Postcode')#
					
				
				#submitTag()#
				
			#endFormTag()#
			

#linkTo(text="Return to the listing", action="index")#
</cfoutput>
