<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>

<xsl:template match="data">
	<xsl:choose>
		<xsl:when test="$mode = 'success'"><xsl:apply-templates select="." mode="success"/></xsl:when>
		<xsl:when test="$mode = 'failed'"><xsl:apply-templates select="." mode="failed"/></xsl:when>		
		<xsl:when test="$mode = 'sent'"><xsl:apply-templates select="." mode="sent"/></xsl:when>
		<xsl:when test="$logged-in = 'false'"><xsl:apply-templates select="." mode="guest"/></xsl:when>
		<xsl:when test="$member/role = 'Inactive'"><xsl:apply-templates select="." mode="activate"/></xsl:when>
		<xsl:otherwise><xsl:apply-templates select="." mode="already-active"/></xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="data" mode="activate">
	<h2 class="heading">Account Activation</h2>
	<h3>
		<xsl:value-of select="substring-after($member/name, ' ')"/>
		<xsl:value-of select="concat(', ', $member/name)"/>
	</h3>
	<p>Thanks for your interest in being a part of the Symphony family, <xsl:value-of select="$member/username-and-password/@username"/>!</p>
	<p>There is just one mission left: we have sent you an email with a secret code and we need you to enter it below to activate your account.</p>
	<p><strong>The code expires in one hour.</strong></p>
	<form method="post" action="{$current-url}">
		<fieldset>
			<p>
				<xsl:if test="events/save-member/name">
					<xsl:attribute name="class">error</xsl:attribute>
				</xsl:if>
				<label for="name">Code</label>
				<input id="name" name="fields[code]" type="text" value="" />
			</p>
			<div id="submission">
				<input id="submit" class="resend button" name="action[resend-activation-email]" type="submit" value="Resend the activation email" />
				<input id="submit" name="action[activate-account]" type="submit" value="Activate account" class="button"/>
			</div>
			<input name="redirect" type="hidden" value="{$root}" />
		</fieldset>
	</form>
</xsl:template>

<xsl:template match="data" mode="guest">
	<h2 class="heading">Account Activation</h2>
	<h3>Identification Please</h3>
	<p>Looks like you're not logged in yet. You need to login first before we can activate your account.</p>
</xsl:template>

<xsl:template match="data" mode="already-active">
	<h2 class="heading">Account Activation</h2>
	<h3>You're already an active agent</h3>
	<p>Agent <xsl:value-of select="$member/name"/>, our records show that you are already on active duty.</p>
	<p>Our agency needs you, keep up the good work!</p>
</xsl:template>

<xsl:template match="data" mode="sent">
	<h2 class="heading">Account Activation</h2>
	<h3>Activation Email Resent</h3>
	<p>Good news <xsl:value-of select="$member/username-and-password/@username"/>, an email containing your top secret activation code as been dispatched.</p>
	<p>Head back to the <a href="{$root}/members/activate/">activation page</a> to enter the code sent to you.</p>
</xsl:template>

<xsl:template match="data" mode="failed">
	<h2 class="heading">Account Activation</h2>
	<h3>Oh Noes!</h3>
	<p>Sorry <xsl:value-of select="$member/username-and-password/@username"/>, it looks like the code you supplied is not in our system.</p>
</xsl:template>

<xsl:template match="data" mode="success">
	<h2 class="heading">Congratulations!</h2>
	<h3>Welcome, agent <xsl:value-of select="$member/username-and-password/@username"/></h3>
	<p>All the training at agent school has paid off, you are now a fully-qualified member, with a license to dress in black.</p>
	<blockquote>
		<p>You'll dress only in attire specially sanctioned by Symphony special services. You'll conform to the identity we give you, eat where we tell you, live where we tell you. Your entire image is crafted to leave no lasting memory with anyone you encounter. You're a rumor, recognizable only as deja vu and dismissed just as quickly. You don't exist; you were never even born. Anonymity is your name. Silence your native tongue. You're no longer part of the System. You're above the System. Over it. Beyond it.</p>
	</blockquote>
</xsl:template>

</xsl:stylesheet>