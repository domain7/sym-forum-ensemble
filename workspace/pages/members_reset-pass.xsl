<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>

<xsl:template match="data">
	<xsl:choose>
		<xsl:when test="$mode = 'success'"><xsl:apply-templates select="." mode="reset-pass"/></xsl:when>
		<xsl:when test="$mode = 'code'"><xsl:apply-templates select="." mode="enter-code"/></xsl:when>
		<xsl:otherwise><xsl:apply-templates select="." mode="identify"/></xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="data" mode="identify">
	<h2 class="heading">Jedi Mind Trick</h2>
	<h3>Reset Password</h3>
	<p>There is only one way you can reset your password &#8211; by persuading us with your force.</p>
	<p>With your force and some identification (but mostly with your force), we will email you a code that <strong><a href="./code/">you must enter</a></strong> before you can reset your password.</p>
	<p><strong>Supply us with either your username or email.</strong></p>
	<form method="post" action="{$current-url}">
		<fieldset>
			<p>
				<xsl:if test="events/forgot-password/member-username">
					<xsl:attribute name="class">error</xsl:attribute>
				</xsl:if>
				<label for="name">Username</label>
				<input id="name" name="fields[member-username]" type="text" />
			</p>
			<p>
				<xsl:if test="events/forgot-password/member-email-address">
					<xsl:attribute name="class">error</xsl:attribute>
				</xsl:if>
				<label for="name">Email</label>
				<input id="name" name="fields[member-email-address]" type="text" />
			</p>
			<div id="submission">
				<input id="submit" name="action[member-retrieve-password]" type="submit" value="Send me the code" class="button"/>
			</div>
		</fieldset>
	</form>
</xsl:template>

<xsl:template match="data" mode="enter-code">
	<h2>Enter The Code With Your Brain</h2>
	<h3>Reset Password</h3>
	<p>Check your email. If you have the code, now is a good time to put it to use &#8211; telepathically if you must!</p>
	<p><strong>The code expires in one hour.</strong></p>
	<form method="post" action="{$current-url}">
		<fieldset>
			<p>
				<xsl:if test="events/save-member/name">
					<xsl:attribute name="class">error</xsl:attribute>
				</xsl:if>
				<label for="name">Code</label>
				<input id="name" name="fields[code]" type="text" value="{events/save-member/post-values/name}" />
			</p>	
			<div id="submission">
				<input id="submit" class="resend button" name="action[resend-code]" type="submit" value="Resend the email"/>
				<input id="submit" name="action[member-retrieve-password]" type="submit" value="Reset password" class="button"/>
			</div>
		</fieldset>
	</form>
</xsl:template>

<xsl:template match="data" mode="reset-pass">
	<h2>Success!</h2>
	<h3>Reset Password</h3>
	<p>You have won us over with your beauty and wit. Your password has been reset.</p>
	<p>Check your email, it should be with you soon. Don't forget to change it straight away, lest you risk it falling into the hands of Khaos.</p>
</xsl:template>

</xsl:stylesheet>