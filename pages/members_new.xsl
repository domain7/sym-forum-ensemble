<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>
<xsl:import href="../utilities/timezone.xsl"/>

<xsl:variable name="event-action" select="'members-register'"/>
<xsl:variable name="event" select="/data/events/*[name()=$event-action]"/>

<xsl:template match="data">
	<h2 class="heading">Member Registration</h2>
	<xsl:for-each select="$event[@result = 'error']">
		<div id="system-message">
			<p class="message">There was a problem with your registration:</p>
			<xsl:for-each select="*[@label]">
				<p class="error"><strong><xsl:value-of select="@label"/></strong>: <xsl:value-of select="@message"/></p>
			</xsl:for-each>
		</div>
	</xsl:for-each>
	<xsl:if test="$event[@result = 'success']">
		<div id="system-message">
			<p class="success">You have registered successfully. Please check your email for your activation code.</p>
		</div>
	</xsl:if>
	<form method="post" action="" class="members-form">
		<fieldset>
			<p>
				<xsl:if test="$event/name">
					<xsl:attribute name="class">error</xsl:attribute>
				</xsl:if>
				<label for="name">Full Name</label>
				<input id="name" name="fields[name]" type="text" value="{$event/post-values/name}" />
			</p>
			<p>
				<xsl:if test="$event/username">
					<xsl:attribute name="class">error</xsl:attribute>
				</xsl:if>
				<label for="username">Username</label>
				<input id="username" name="fields[username]" type="text" value="{$event/post-values/username}" />
			</p>
			<p>
				<xsl:if test="$event/password">
					<xsl:attribute name="class">error</xsl:attribute>
				</xsl:if>
				<label for="password">Password</label>
				<input id="password" name="fields[password][password]" type="password" value="{$event/post-values/password/password}" />
			</p>
			<p>
				<xsl:if test="$event/password">
					<xsl:attribute name="class">error</xsl:attribute>
				</xsl:if>
				<label for="password">Confirm Password</label>
				<input id="password" name="fields[password][confirm]" type="password" value="{$event/post-values/password/confirm}" />
			</p>
			<p>
				<xsl:if test="$event/email">
					<xsl:attribute name="class">error</xsl:attribute>
				</xsl:if>
				<label for="email">Email</label>
				<input id="email" name="fields[email]" type="text" value="{$event/post-values/email}" />
			</p>					
			<p>
				<xsl:if test="$event/location">
					<xsl:attribute name="class">error</xsl:attribute>
				</xsl:if>
				<label for="location">Country</label>
				<select id="location" name="fields[location]">
					<xsl:for-each select="location/item">
						<option value="{@value}">
							<xsl:choose>
								<xsl:when test="@value = 'CAN' or @value = $event/post-values/location">
									<xsl:attribute name="selected">selected</xsl:attribute>
								</xsl:when>
							</xsl:choose>
							<xsl:value-of select="."/>
						</option>
					</xsl:for-each>
				</select>
			</p>	
			<p>
				<xsl:if test="$event/city">
					<xsl:attribute name="class">error</xsl:attribute>
				</xsl:if>
				<label for="city">City</label>
				<input id="city" name="fields[city]" type="text" value="{$event/post-values/city}" />
			</p>		
			<p>
				<label for="timezone">Timezone</label>
				<select id="timezone" name="fields[timezone]">
					<xsl:for-each select="/data/timezones/timezone">
						<option value="{@value}">
							<xsl:if test="@value = /data/member-info/entry/timezone/name or @value = $event/post-values/timezone">
								<xsl:attribute name="selected">selected</xsl:attribute>
							</xsl:if>
							<xsl:value-of select="."/>
						</option>
					</xsl:for-each>
				</select>
			</p>
			<p>
				<xsl:if test="$event/website">
					<xsl:attribute name="class">error</xsl:attribute>
				</xsl:if>
				<label for="website">Website</label>
				<input id="website" name="fields[website]" type="text" value="{$event/post-values/website}" />
			</p>					
			<p class="option">
				<label for="email-opt-in">Opt-in</label>
				<span>
					<input id="email-opt-in" name="fields[email-opt-in]" type="checkbox" value="yes">
						<xsl:if test="$event/post-values/email-opt-in = 'yes'">
							<xsl:attribute name="checked">checked</xsl:attribute>
						</xsl:if>
					</input>
					<xsl:text> Send me email when there is important news.</xsl:text>
				</span>
			</p>				
			<div id="submission">
				<input id="submit" name="action[{$event-action}]" type="submit" value="Register" class="button"/>
				<input name="fields[role]" type="hidden" value="Inactive" />
				<a id="cancel" href="{$root}/" class="button">Cancel and go back</a>
			</div>
		</fieldset>
	</form>
</xsl:template>

<xsl:template match="data[events/member-login-info/@logged-in='true']">
	<h2>Switching Secret Identities?</h2>
	<h3>You already have an account</h3>
	<p>According to our records, <xsl:value-of select="$member/name"/>, you are currently an existing agent. Coming here can only mean one thing: you're a double agent!</p>
	<p>We have alerted the authorities and <strong>depending on time and traffic</strong>, they will arrive in 4 to 8 weeks.</p>
</xsl:template>

</xsl:stylesheet>