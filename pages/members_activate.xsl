<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>

<xsl:param name="member" select="/data/member-email/entry" />
<xsl:param name="event-action" select="'members-activate-account'"/>
<xsl:param name="event" select="/data/events/*[name()=$event-action]"/>
<xsl:param name="resend-event-action" select="'members-regenerate-activation-code'"/>
<xsl:param name="resend-event" select="/data/events/*[name()=$resend-event-action]"/>

<xsl:template match="data">
	<section class="main">
		<div class="content">
			<xsl:choose>
				<xsl:when test="$event/@result = 'error'"><xsl:apply-templates select="." mode="failed"/></xsl:when>
				<xsl:when test="$event/@result = 'success' or events/member-login-info/@logged-in = 'yes'"><xsl:apply-templates select="." mode="success"/></xsl:when>
				<xsl:when test="$member/activation/@activated = 'yes'"><xsl:apply-templates select="." mode="already-active"/></xsl:when>
				<xsl:when test="$code = 'resend'"><xsl:apply-templates select="." mode="resend"/></xsl:when>
				<xsl:otherwise><xsl:apply-templates select="." mode="activate"/></xsl:otherwise>
			</xsl:choose>
		</div>
	</section>
</xsl:template>

<xsl:template match="data" mode="activate">
	<h2 class="heading">Account Activation</h2>
	<xsl:if test="$member"><h3>Hello, <xsl:value-of select="$member/name"/></h3></xsl:if>
	<p>Thanks for becoming a member of this site<xsl:if test="$member">, <xsl:value-of select="$member/username"/></xsl:if>!</p>
	<p>There is just one mission left: we have sent you an email with a secret code and we need you to enter it below to activate your account. If the code has expired, you'll need to <a href="{$root}/{$root-page}/{$current-page}/resend/{$email}">generate a new activation code</a>.</p>
	<xsl:choose>
		<xsl:when test="$member/activation/code">
			<p><strong>The code expires at <xsl:call-template name="format-time"><xsl:with-param name="time" select="$member/activation/expires/@time" /><xsl:with-param name="format" select="'t'" /></xsl:call-template>.</strong></p>
		</xsl:when>
	</xsl:choose>
	<xsl:for-each select="$event[@result = 'error']/*">
		<xsl:choose>
			<xsl:when test="name() = 'error'">
				<p class="error"><xsl:value-of select="@message" /></p>
			</xsl:when>
			<xsl:otherwise>
				<p class="error"><strong><xsl:value-of select="@label" /></strong>: <xsl:value-of select="@message" /></p>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:for-each>
	<xsl:for-each select="$event[@result = 'success']/*">
		<p class="error">Your account was successfully activated.</p>
	</xsl:for-each>
	<form method="post" action="{$current-url}" class="members-form">
		<fieldset>
			<p>
				<xsl:if test="$event/email">
					<xsl:attribute name="class">error</xsl:attribute>
				</xsl:if>
				<label for="name">Email</label>
				<input id="email" name="fields[email]" type="text" value="{$email}" />
			</p>
			<p>
				<xsl:if test="$event/activation">
					<xsl:attribute name="class">error</xsl:attribute>
				</xsl:if>
				<label for="activation">Activation Code</label>
				<input id="activation" name="fields[activation]" type="text" value="{$code}" />
			</p>
			<div id="submission">
				<input name="redirect" type="hidden" value="{$root}/" />
				<input id="submit" name="action[members-activate-account]" type="submit" value="Activate account" class="button"/>
			</div>
		</fieldset>
	</form>
</xsl:template>

<xsl:template match="data" mode="resend">
	<h2 class="heading">Account Activation</h2>
	<xsl:if test="$member"><h3>Hello, <xsl:value-of select="$member/name"/></h3></xsl:if>
	<p>Thanks for becoming a member of this site<xsl:if test="$member">, <xsl:value-of select="$member/username"/></xsl:if>!</p>
	<p>If your activation code has expired, enter your email below to send a new activation code. If you have received the activation code, <a href="{$root}/{$root-page}/{$current-page}/">enter the code here</a>.</p>
	<xsl:choose>
		<xsl:when test="$member/activation/code">
			<p><strong>The code expires at <xsl:call-template name="format-time"><xsl:with-param name="time" select="$member/activation/expires/@time" /><xsl:with-param name="format" select="'t'" /></xsl:call-template>.</strong></p>
		</xsl:when>
	</xsl:choose>
	<xsl:if test="$resend-event[@result = 'error']/error">
		<p class="error"><strong><xsl:value-of select="$resend-event/error/@message" /></strong>: Enter a valid email address.</p>
	</xsl:if>
	<xsl:for-each select="$resend-event[@result = 'error']/*[name() != 'error' and name() != 'post-values']">
		<p class="error"><strong><xsl:value-of select="@label" /></strong>: <xsl:value-of select="@message" /></p>
	</xsl:for-each>
	<xsl:for-each select="$resend-event[@result = 'success']/activation-code">
		<p class="success">The code was emailed to you at <xsl:value-of select="$member/email" /></p>
	</xsl:for-each>
	<form method="post" action="{$current-url}" class="members-form">
		<fieldset>
			<p>
				<xsl:if test="$event/email">
					<xsl:attribute name="class">error</xsl:attribute>
				</xsl:if>
				<label for="name">Email</label>
				<input id="email" name="fields[email]" type="text" value="{$email}" />
			</p>
			<div id="submission">
				<input id="resend" class="button" name="action[members-regenerate-activation-code]" type="submit" value="Resend the activation email" />
			</div>
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
	<p>Agent <xsl:value-of select="$member/name"/>, our records show that you are already on active duty.<xsl:if test="$logged-in = 'no'"> You may want to <a href="{$root}/login/">log in</a>, now that your account has been activated.</xsl:if></p>
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