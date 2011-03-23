<h1>Create new categories</h1>

<cfoutput>

			#errorMessagesFor("categories")#
	
			#startFormTag(action="create")#
		
				
						#textField(objectName='categories', property='name', label='Name')#
					
						#textField(objectName='categories', property='description', label='Description')#
					

				#submitTag()#
				
			#endFormTag()#
			

#linkTo(text="Return to the listing", action="index")#
</cfoutput>
