<cfparam name="user">


<cfoutput>

#startFormTag(action="mobilecreate")#

#errorMessagesFor("user")#


<div data-role="fieldcontain">#textField(label="First Name", objectName="user", property="firstname")#</div>
<div data-role="fieldcontain">#textField(label="Surname", objectName="user", property="surname")#</div>
<div data-role="fieldcontain">#textField(label="E-mail Address", objectName="user", property="email")#</div>
<div data-role="fieldcontain">#passwordField(label="Password", objectName="user", property="password")#</div>
<div data-role="fieldcontain">#passwordField(label="Confirm Password", objectName="user", property="passwordConfirmation")#</div>

<div data-role="fieldcontain">#submitTag(value="Register")#</div>

#endFormTag()#

</cfoutput>