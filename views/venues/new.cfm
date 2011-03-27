<h1>Create new venues</h1>

<cfoutput>

			#errorMessagesFor("venues")#
	
			#startFormTag(action="create")#
		
				
						#textField(objectName='venues', property='name', label='Name')#
					
						#textField(objectName='venues', property='description', label='Description')#
					
						
							
						#select(label = "Select a region", property="regionid", objectName="venues",  options=regions, includeBlank=true)# 
					
						
					
						#textField(objectName='venues', property='address1', label='Address1')#
					
						#textField(objectName='venues', property='address2', label='Address2')#
					
						#textField(objectName='venues', property='towncity', label='Towncity')#
					
						#textField(objectName='venues', property='county', label='County')#
					
						#textField(objectName='venues', property='postcode', label='Postcode')#
					

				#submitTag()#
				
			#endFormTag()#
			

#linkTo(text="Return to the listing", action="index")#
</cfoutput>
