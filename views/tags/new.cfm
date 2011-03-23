<h1>Create new tags</h1>

<cfoutput>

			#errorMessagesFor("tags")#
	
			#startFormTag(action="create")#
		
				
						#select(label = "Select a category", property="categoryid", objectName="tags",  options=Categories, includeBlank=true)# 
					
						#textField(objectName='tags', property='name', label='Name')#
					
						#textField(objectName='tags', property='description', label='Description')#
					
						#textField(objectName='tags', property='image', label='Image')#
					

				#submitTag()#
				
			#endFormTag()#
			

#linkTo(text="Return to the listing", action="index")#
</cfoutput>
