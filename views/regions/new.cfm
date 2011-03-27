<h1>Create new regions</h1>

<cfoutput>

			#errorMessagesFor("regions")#
	
			#startFormTag(action="create")#
		
				
						#textField(objectName='regions', property='name', label='Name')#
					

				#submitTag()#
				
			#endFormTag()#
			

#linkTo(text="Return to the listing", action="index")#
</cfoutput>
