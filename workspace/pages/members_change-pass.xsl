<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>

<xsl:template match="data">
	<xsl:choose>
		<xsl:when test="$mode = 'success'"><xsl:apply-templates select="." mode="success"/></xsl:when>
		<xsl:when test="$mode = 'failed'"><xsl:apply-templates select="." mode="failed"/></xsl:when>		
		<xsl:otherwise><xsl:apply-templates select="." mode="change-pass"/></xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="data" mode="change-pass">
	<h2 class="heading">Change your password</h2>
	<xsl:call-template name="change-password-form"/>
</xsl:template>

<xsl:template match="data" mode="success">
	<h2 class="heading">Change your password</h2>
	<h3>Success!</h3>
	<p>Password changed successfully.</p>
</xsl:template>

<xsl:template match="data" mode="failed">
	<h2 class="heading">Change your password</h2>
	<h3>Oh Noes!</h3>
	<p class="error">The old password provided doesn't seem to be correct.</p>
	<xsl:call-template name="change-password-form"/>
</xsl:template>

<xsl:template name="change-password-form">
	<form method="post" action="{$current-url}">
		<fieldset>
			<p>
				<xsl:if test="events/member-change-password/old-password">
					<xsl:attribute name="class">error</xsl:attribute>
				</xsl:if>
				<label for="name">Old Password</label>
				<input id="name" name="fields[old-password]" type="password" />
			</p>
			<p>
				<xsl:if test="events/member-change-password/new-password">
					<xsl:attribute name="class">error</xsl:attribute>
				</xsl:if>
				<label for="name">New Password</label>
				<input id="name" name="fields[new-password]" type="password" />
			</p>
			<div id="submission">
				<input id="submit" name="action[member-change-password]" type="submit" value="Change Password" class="button"/>
				<a id="cancel" href="{$root}/members/{$member/username-and-password/@username}/" class="button">Cancel and go back</a>
			</div>
		</fieldset>
	</form>
</xsl:template>

</xsl:stylesheet>