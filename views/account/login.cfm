<cfparam name="user">

<cfoutput>

<h2>Login</h2>

#startFormTag(action="signin")#

<cfif flashKeyExists("error")>
	<ul id="error">
		<li>#flash("error")#</li>
	</ul>
</cfif>
<ul>
#textField(label="E-Mail Address", objectName="user", property="email")#
#passwordField(label="Password", objectName="user", property="password")#
</ul>
#linkTo(text="Forgotten your password?", controller="account", action="register", id="forgotpass")#
#submitTag(value="Login")#

#endFormTag()#

</cfoutput>