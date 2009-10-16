<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>
<xsl:import href="../utilities/timezone.xsl"/>

<xsl:template match="data">
	<xsl:for-each select="members-edit/entry">
		<h2 class="heading">Edit Profile for <xsl:value-of select="username-and-password/@username"/></h2>
		<form method="post" action="{$current-url}">
			<fieldset>
				<p>
					<xsl:if test="/data/events/edit-member/name">
						<xsl:attribute name="class">error</xsl:attribute>
					</xsl:if>
					<label for="name">Full Name</label>
					<input id="name" name="fields[name]" type="text" value="{name}" />
				</p>
				<p>
					<xsl:if test="/data/events/edit-member/email-address">
						<xsl:attribute name="class">error</xsl:attribute>
					</xsl:if>
					<label for="email">Email</label>
					<input id="email" name="fields[email-address]" type="text" value="{email-address}" />
				</p>						
				<p>
					<label for="location">Country</label>
					<select id="location" name="fields[location]">
						<xsl:for-each select="/data/location/item">
							<option value="{@value}">
								<xsl:if test="@value = /data/members-edit/entry/location">
									<xsl:attribute name="selected">selected</xsl:attribute>
								</xsl:if>
								<xsl:value-of select="."/>
							</option>
						</xsl:for-each>
					</select>
				</p>	
				<p>
					<xsl:if test="/data/events/edit-member/city">
						<xsl:attribute name="class">error</xsl:attribute>
					</xsl:if>
					<label for="city">City</label>
					<input id="city" name="fields[city]" type="text" value="{city}" />
				</p>
				<p>
					<label for="timezone">Timezone</label>
					<select id="timezone" name="fields[timezone-offset]">
						<xsl:call-template name="timezone-offset-options">
							<xsl:with-param name="ii">-12</xsl:with-param>
							<xsl:with-param name="count">12</xsl:with-param>
							<xsl:with-param name="selected">
								<xsl:choose>
									<xsl:when test="timezone-offset = 'None'">10</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="timezone-offset"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:with-param>	
						</xsl:call-template>								
					</select>
				</p>
				<p>
					<xsl:if test="/data/events/edit-member/website">
						<xsl:attribute name="class">error</xsl:attribute>
					</xsl:if>
					<label for="website">Website</label>
					<input id="website" name="fields[website]" type="text" value="{website}" />
				</p>						
				<p class="option">
					<label for="opt-in">Opt-in</label>
					<span>
				    	<input name="fields[email-opt-in]" value="no" type="hidden"/>
						<input id="opt-in" name="fields[email-opt-in]" value="yes" type="checkbox">
							<xsl:if test="email-opt-in = 'Yes'">
								<xsl:attribute name="checked">checked</xsl:attribute>
							</xsl:if>
						</input>
						<xsl:text> Send me email when there is important Symphony news.</xsl:text>
					</span>
				</p>
				<p class="option">
				    <label>Picture</label>
				    <span>To change your profile picture, sign up at <a href="http://gravatar.com/">Gravatar</a> with the same email address you provided here.</span>
				</p>

				<input name="id" type="hidden" value="{@id}"/>
				<div id="submission">
					<input id="submit" name="action[edit-member]" type="submit" value="Save" class="button"/>
					<a id="cancel" href="{$root}/members/{$member/username-and-password/@username}/" class="button">Cancel and go back</a>
				</div>
			</fieldset>
		</form>
	</xsl:for-each>
</xsl:template>

</xsl:stylesheet>