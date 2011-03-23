<h1>Editing categories</h1>

<cfoutput>

			#errorMessagesFor("categories")#
	
			#startFormTag(action="update", key=params.key)#
		
				
						#textField(objectName='categories', property='name', label='Name')#
					
						#textField(objectName='categories', property='description', label='Description')#
					
				
				#submitTag()#
				
			#endFormTag()#
			

#linkTo(text="Return to the listing", action="index")#
</cfoutput>
