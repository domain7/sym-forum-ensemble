<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>
<xsl:import href="../utilities/timezone.xsl"/>

<xsl:template match="data">
	<h2 class="heading">Member Registration</h2>
	<xsl:if test="events/save-member/username-and-password/@type = 'invalid'">
		<div id="system-message">
			<p class="error">The username supplied already exist.</p>
		</div>
	</xsl:if>
	<form method="post" action="{$current-url}">
		<fieldset>
			<p>
				<xsl:if test="events/save-member/name">
					<xsl:attribute name="class">error</xsl:attribute>
				</xsl:if>
				<label for="name">Full Name</label>
				<input id="name" name="fields[name]" type="text" value="{events/save-member/post-values/name}" />
			</p>
			<p>
				<xsl:if test="events/save-member/username-and-password">
					<xsl:attribute name="class">error</xsl:attribute>
				</xsl:if>
				<label for="username">Username</label>
				<input id="username" name="fields[username-and-password][username]" type="text" value="{events/save-member/post-values/username-and-password/username}" />
			</p>
			<p>
				<label for="password">Password</label>
				<input id="password" name="fields[username-and-password][password]" type="password" />
			</p>
			<p>
				<xsl:if test="events/save-member/email-address">
					<xsl:attribute name="class">error</xsl:attribute>
				</xsl:if>
				<label for="email">Email</label>
				<input id="email" name="fields[email-address]" type="text" value="{events/save-member/post-values/email-address}" />
			</p>					
			<p>
				<xsl:if test="events/save-member/location">
					<xsl:attribute name="class">error</xsl:attribute>
				</xsl:if>
				<label for="location">Country</label>
				<select id="location" name="fields[location]">
					<xsl:for-each select="location/item">
						<option value="{@value}">
							<xsl:choose>
								<xsl:when test="@value = 'AUS'">
									<xsl:attribute name="selected">selected</xsl:attribute>
								</xsl:when>
							</xsl:choose>
							<xsl:value-of select="."/>
						</option>
					</xsl:for-each>
				</select>
			</p>	
			<p>
				<xsl:if test="events/save-member/city">
					<xsl:attribute name="class">error</xsl:attribute>
				</xsl:if>
				<label for="city">City</label>
				<input id="city" name="fields[city]" type="text" value="{events/save-member/post-values/city}" />
			</p>		
			<p>
				<label for="timezone">Timezone</label>
				<select id="timezone" name="fields[timezone-offset]">
					<xsl:call-template name="timezone-offset-options">
						<xsl:with-param name="ii">-12</xsl:with-param>
						<xsl:with-param name="count">12</xsl:with-param>
						<xsl:with-param name="selected">
							<xsl:choose>
								<xsl:when test="events/save-member/post-values/timezone-offset">
									<xsl:value-of select="events/save-member/post-values/timezone-offset"/>
								</xsl:when>
								<xsl:otherwise>10</xsl:otherwise>
							</xsl:choose>
						</xsl:with-param>	
					</xsl:call-template>								
				</select>
			</p>											
			<p>
				<xsl:if test="events/save-member/website">
					<xsl:attribute name="class">error</xsl:attribute>
				</xsl:if>
				<label for="website">Website</label>
				<input id="website" name="fields[website]" type="text" value="{events/save-member/post-values/website}" />
			</p>					
			<p class="option">
				<label for="email-opt-in">Opt-in</label>
				<span>
					<input id="email-opt-in" name="fields[email-opt-in]" type="checkbox" value="yes" />
					<xsl:text> Send me email when there is important Symphony news.</xsl:text>
				</span>
			</p>				
			<div id="submission">
				<input id="submit" name="action[save-member]" type="submit" value="Register" class="button"/>
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