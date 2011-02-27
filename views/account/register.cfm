<cfparam name="user">

<cfoutput>

<h2>Register</h2>

#startFormTag(action="create")#

#errorMessagesFor("user")#

<ul class="form">
#textField(label="First Name", objectName="user", property="firstname")#
#textField(label="Surname", objectName="user", property="surname")#
#textField(label="E-mail Address", objectName="user", property="email")#
#passwordField(label="Password", objectName="user", property="password")#
#passwordField(label="Confirm Password", objectName="user", property="passwordConfirmation")#
</ul>


#submitTag(value="Register")#


#endFormTag()#

</cfoutput>
