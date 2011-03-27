<h1>Create new restaurants</h1>

<cfoutput>

			#errorMessagesFor("restaurants")#
	
			#startFormTag(action="create")#
		
				
						#textField(objectName='restaurants', property='name', label='Name')#
					
						#textField(objectName='restaurants', property='type', label='Type')#
					
						#textField(objectName='restaurants', property='address1', label='Address1')#
					
						#textField(objectName='restaurants', property='address2', label='Address2')#
					
						#textField(objectName='restaurants', property='towncity', label='Towncity')#
					
						#textField(objectName='restaurants', property='county', label='County')#
					
						#textField(objectName='restaurants', property='postcode', label='Postcode')#
					
						#textField(objectName='restaurants', property='phone', label='Phone')#
					

				#submitTag()#
				
			#endFormTag()#
			

#linkTo(text="Return to the listing", action="index")#
</cfoutput>
