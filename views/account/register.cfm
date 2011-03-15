<cfparam name="user">

<cfoutput>

<h2>Register</h2>
<p class="logintext">Please complete all the fields on this form to setup your Ticketseller account.</p>

#startFormTag(action="create")#

#errorMessagesFor("user")#

<ul class="form">
#textField(label="First Name", objectName="user", property="firstname")#
#textField(label="Surname", objectName="user", property="surname")#
#textField(label="E-mail Address", objectName="user", property="email")#
#passwordField(label="Password", objectName="user", property="password")#
#passwordField(label="Confirm Password", objectName="user", property="passwordConfirmation")#
</ul>

<div id="login-button" class="clear">
#submitTag(value="Register")#
</div>

#endFormTag()#

</cfoutput>
