<h1>Editing tags</h1>

<cfoutput>

			#errorMessagesFor("tags")#
	
			#startFormTag(action="update", key=params.key)#
		
				
						#textField(objectName='tags', property='categoryid', label='Categoryid')#
					
						#textField(objectName='tags', property='name', label='Name')#
					
						#textField(objectName='tags', property='description', label='Description')#
					
						#textField(objectName='tags', property='image', label='Image')#
					
				
				#submitTag()#
				
			#endFormTag()#
			

#linkTo(text="Return to the listing", action="index")#
</cfoutput>
