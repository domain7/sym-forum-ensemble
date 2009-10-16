<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="../utilities/master.xsl"/>

<xsl:template match="data[events/member-login-info/@id = members/entry/@id]" mode="side-panel">
	<h3>Actions</h3>
	<ul>
		<li><a href="{$root}/members/edit/">Edit My Profile</a></li>
		<li class="last"><a href="{$root}/members/change-pass/">Change My Password</a></li>
	</ul>
</xsl:template>

<xsl:template match="data">
	<xsl:variable name="discussions-count" select="members-forum-discussion-count/pagination/@total-entries"/>
	<xsl:variable name="comments-count" select="members-forum-comment-count/pagination/@total-entries"/>
	<div id="header">
		<img src="http://www.gravatar.com/avatar/{members/entry/@email-hash}?s=50&amp;d=http%3A%2F%2Fsymphony-cms.com%2Fworkspace%2Fassets%2Fimages%2Ficons%2Fsymphony-avatar.png" width="50" height="50" />
		<h2 class="heading">
			<xsl:value-of select="members/entry/name"/>
			<em><xsl:value-of select="concat(' (a.k.a. ', members/entry/username, ')')"/></em>
		</h2>
	</div>
	<dl id="member-details">
		<dt>Role</dt>
		<dd><xsl:value-of select="members/entry/role"/></dd>
		<xsl:if test="members/entry/website">
			<dt>Website</dt>
			<dd><a href="{members/entry/website}"><xsl:value-of select="members/entry/website"/></a></dd>
		</xsl:if>
		<dt>Account Created</dt>
		<dd>
			<xsl:call-template name="format-date">
				<xsl:with-param name="date" select="members/entry/date-joined"/>
				<xsl:with-param name="format" select="'W, x M Y, t'"/>
			</xsl:call-template>
		</dd>
		<dt>Discussions Started</dt>
		<dd><xsl:value-of select="$discussions-count"/></dd>
		<dt>Comments Made</dt>
		<dd><xsl:value-of select="$comments-count - $discussions-count"/></dd>
	</dl>
</xsl:template>

<xsl:template match="data" mode="page-title">
	<title>Forum &#8211; Members &#8211; <xsl:value-of select="members/entry/username"/></title>
</xsl:template>

</xsl:stylesheet>