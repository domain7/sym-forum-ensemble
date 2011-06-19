<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>

<xsl:variable name="event-action" select="'members-update-password'"/>
<xsl:variable name="event" select="/data/events/*[name()=$event-action]"/>

<xsl:template match="data">
	<section class="main">
		<div class="content">
			<xsl:choose>
				<xsl:when test="$event/@result = 'success'"><xsl:apply-templates select="." mode="success"/></xsl:when>
				<xsl:when test="$event/@result = 'error'"><xsl:apply-templates select="." mode="failed"/></xsl:when>
				<xsl:otherwise><xsl:apply-templates select="." mode="change-pass"/></xsl:otherwise>
			</xsl:choose>
		</div>
	</section>
</xsl:template>

<xsl:template match="data" mode="change-pass">
	<h2 class="heading">Change your password</h2>
	<xsl:apply-templates select="member-info/entry" mode="update-password" />
</xsl:template>

<xsl:template match="data" mode="success">
	<h2 class="heading">Change your password</h2>
	<h3>Success!</h3>
	<p>Your password was updated successfully.</p>
</xsl:template>

<xsl:template match="data" mode="failed">
	<h2 class="heading">Change your password</h2>
	<div id="system-message">
		<h3>Oh Noes!</h3>
		<p class="error">The password confirmation did not match the original password. Try again.</p>
	</div>
	<xsl:apply-templates select="member-info/entry" mode="update-password" />
</xsl:template>

<xsl:template match="member-info/entry" mode="update-password">
	<form method="post" class="members-form">
		<fieldset>
			<p>
				<xsl:if test="$event/password">
					<xsl:attribute name="class">error</xsl:attribute>
				</xsl:if>
				<label for="password">Password</label>
				<input id="password" name="fields[password][password]" type="password" />
			</p>
			<p>
				<xsl:if test="$event/password">
					<xsl:attribute name="class">error</xsl:attribute>
				</xsl:if>
				<label for="confirm-password">Confirm Password</label>
				<input id="confirm-password" name="fields[password][confirm]" type="password" />
			</p>
			<div id="submission">
				<input name="id" type="hidden" value="{@id}" />
				<input name="fields[name]" type="hidden" value="{name}" />
				<input name="fields[username]" type="hidden" value="{username}" />
				<input name="fields[email]" type="hidden" value="{email}" />
				<input name="fields[role]" type="hidden" value="{role/@id}" />
				<input id="submit" name="action[{$event-action}]" type="submit" value="Change Password" class="button"/>
				<a id="cancel" href="{$root}/members/{username}/" class="button">Cancel and go back</a>
			</div>
		</fieldset>
	</form>
</xsl:template>

</xsl:stylesheet>