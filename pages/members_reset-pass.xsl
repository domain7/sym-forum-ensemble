<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>

<xsl:template match="data">
	<section class="main">
		<div class="content">
			<xsl:choose>
				<xsl:when test="$mode = 'username'"><xsl:apply-templates select="." mode="identify"/></xsl:when>
				<xsl:when test="$mode = 'success'"><xsl:apply-templates select="." mode="reset-pass"/></xsl:when>
				<xsl:when test="$mode"><xsl:apply-templates select="." mode="enter-code"/></xsl:when>
				<xsl:otherwise><xsl:apply-templates select="." mode="identify"/></xsl:otherwise>
			</xsl:choose>
		</div>
	</section>
</xsl:template>

<xsl:template match="data" mode="identify">
	<xsl:param name="event-action" select="'members-generate-recovery-code'"/>
	<xsl:param name="event" select="/data/events/*[name()=$event-action]"/>
	
	<h2 class="heading">Jedi Mind Trick</h2>
	<h3>Reset Password</h3>
	<p>There is only one way you can reset your password &#8211; by persuading us with your force.</p>
	<p>With your force and some identification (but mostly with your force), we will email you a code that <strong><a href="{$root}/{$root-page}/{$current-page}/code/">you must enter</a></strong> before you can reset your password.</p>
	<xsl:choose>
		<xsl:when test="$event[@result = 'success']">
			<p class="success"><strong>A code has been emailed to you.</strong> Click on the link to submit the code and enter and confirm a new password.</p>
		</xsl:when>
		<xsl:when test="$event[@result = 'error']">
			<xsl:if test="$event[@result = 'error']/error">
				<p class="error"><strong><xsl:value-of select="$event/error/@message" /></strong>: Enter a valid email address.</p>
			</xsl:if>
			<xsl:for-each select="$event[@result = 'error']/*[name() != 'error' and name() != 'post-values']">
				<p class="error"><strong><xsl:value-of select="@label" /></strong>: <xsl:value-of select="@message" /></p>
			</xsl:for-each>
		</xsl:when>
		<xsl:when test="$mode = 'username'">
			<p><strong>Supply us with your username</strong> (or try your <a href="{$root}/{$root-page}/{$current-page}/">email address</a> instead).</p>
		</xsl:when>
		<xsl:otherwise>
			<p><strong>Supply us with your email address</strong> (or try your <a href="{$root}/{$root-page}/{$current-page}/username/">username</a> instead).</p>
		</xsl:otherwise>
	</xsl:choose>
	<form method="post" action="{$current-url}" class="members-form">
		<fieldset>
			<xsl:choose>
				<xsl:when test="$mode = 'username'">
					<p>
						<xsl:if test="$event/username">
							<xsl:attribute name="class">error</xsl:attribute>
						</xsl:if>
						<label for="username">Username</label>
						<input id="username" name="fields[username]" type="text" />
					</p>
				</xsl:when>
				<xsl:otherwise>
					<p>
						<xsl:if test="$event/email">
							<xsl:attribute name="class">error</xsl:attribute>
						</xsl:if>
						<label for="email">Email Address</label>
						<input id="email" name="fields[email]" type="text" />
					</p>
				</xsl:otherwise>
			</xsl:choose>
			<div id="submission">
				<input id="submit" name="action[{$event-action}]" type="submit" value="Send me the code" class="button"/>
				<input name="etm[][reset-password]" type="hidden" value="{$root}/{$root-page}/{$current-page}/code/" />
			</div>
		</fieldset>
	</form>
</xsl:template>

<xsl:template match="data" mode="enter-code">
	<xsl:param name="event-action" select="'members-reset-password'"/>
	<xsl:param name="event" select="/data/events/*[name()=$event-action]"/>

	<h2>Enter The Code With Your Brain</h2>
	<h3>Reset Password</h3>
	<p>Check your email. If you have received the code (when you <a href="{$root}/{$root-page}/{$current-page}/">submitted your email address</a>), now is a good time to put it to use &#8211; telepathically if you must!</p>
	<xsl:choose>
		<xsl:when test="$event/@result = 'error'">
			<xsl:for-each select="$event/*[name() != 'post-values']">
				<p class="error"><strong><xsl:value-of select="@label" /></strong>: <xsl:value-of select="@message" /></p>
			</xsl:for-each>
		</xsl:when>
		<xsl:otherwise>
			<p><strong>The code expires in one hour.</strong> 
			If you haven't received the code yet, or an hour has already passed, <a href="{$root}/{$root-page}/{$current-page}/">try again</a>.</p>
		</xsl:otherwise>
	</xsl:choose>
	<form method="post" action="{$current-url}" class="members-form">
		<fieldset>
			<p>
				<xsl:if test="$event/activation">
					<xsl:attribute name="class">error</xsl:attribute>
				</xsl:if>
				<label for="email">Email Address</label>
				<input id="email" name="fields[email]" type="text" value="{$email}" />
			</p>	
			<p>
				<xsl:if test="$event/activation">
					<xsl:attribute name="class">error</xsl:attribute>
				</xsl:if>
				<label for="recovery">Recovery Code</label>
				<input id="recovery" name="fields[password][recovery-code]" type="text" value="{$mode}" />
			</p>	
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
				<input name="redirect" type="hidden" value="{$root}/{$root-page}/{$current-page}/success/" />
				<input id="submit" name="action[{$event-action}]" type="submit" value="Reset password" class="button"/>
			</div>
		</fieldset>
	</form>
</xsl:template>

<xsl:template match="data" mode="reset-pass">
	<h2>Success!</h2>
	<h3>Reset Password</h3>
	<p>You have won us over with your beauty and wit. Your password has been reset.</p>
	<p>Check your email, it should be with you soon. Don't forget to change it straight away, lest you risk it falling into the hands of KAOS.</p>
</xsl:template>

</xsl:stylesheet>