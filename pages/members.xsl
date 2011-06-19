<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="../utilities/master.xsl"/>

<xsl:template match="data" mode="side-panel">
	<h3>Actions</h3>
	<ul>
		<li><a href="{$root}/members/edit/">Edit My Profile</a></li>
		<li class="last"><a href="{$root}/members/change-pass/">Change My Password</a></li>
	</ul>
</xsl:template>

<xsl:template match="data">
	<xsl:apply-templates select="member-username/entry" />
</xsl:template>

<xsl:template match="member-username/entry">
	<div id="header">
		<img src="http://www.gravatar.com/avatar/{email/@hash}" width="50" height="50" />
		<h2 class="heading">
			<xsl:value-of select="name"/>
			<em><xsl:value-of select="concat(' (a.k.a. ', username, ')')"/></em>
		</h2>
	</div>
	<dl id="member-details">
		<dt>Role</dt>
		<dd><xsl:value-of select="role/name"/></dd>
		<dt>Location</dt>
		<dd>
			<xsl:value-of select="city" />
			<xsl:text>, </xsl:text>
			<xsl:choose>
				<xsl:when test="location = 'CAN'">Canada</xsl:when>
				<xsl:otherwise><xsl:value-of select="location" /></xsl:otherwise>
			</xsl:choose>
		</dd>
		<xsl:if test="website">
			<dt>Website</dt>
			<dd><a href="{website}"><xsl:value-of select="website"/></a></dd>
		</xsl:if>
		<dt>Account Created</dt>
		<dd>
			<xsl:call-template name="format-date">
				<xsl:with-param name="date" select="activation/date"/>
				<xsl:with-param name="format" select="'W, x M Y, t'"/>
			</xsl:call-template>
		</dd>
		<dt>Discussions Started</dt>
		<dd><xsl:value-of select="@discussions"/></dd>
		<dt>Comments Made</dt>
		<dd><xsl:value-of select="@comments - @discussions"/></dd>
	</dl>
</xsl:template>

<xsl:template match="data" mode="page-title">
	<title>Forum &#8211; Members &#8211; <xsl:value-of select="member-info/entry/username"/></title>
</xsl:template>

</xsl:stylesheet>