<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:variable name="discussion-limit" select="20"/>
<xsl:variable name="comment-limit" select="20"/>

<!-- Processes over string and converts [tag] into <span class="tag">tag</span> -->
<xsl:template name="tagify">
	<xsl:param name="string"/>
	<xsl:param name="forum-id"/>

	<xsl:variable name="created-by">
		<xsl:value-of select="concat('Created by ', created-by, ' on ')"/>
		<xsl:call-template name="format-date">
			<xsl:with-param name="date" select="creation-date"/>
			<xsl:with-param name="format" select="'d m Y, t'"/>
		</xsl:call-template>
	</xsl:variable>

	<xsl:choose>
		<xsl:when test="substring($string, 1,1) = '[' and string-length(substring-before($string, ']')) &lt; 15">
			<span class="tag">
				<xsl:value-of select="substring(substring-before($string, ']'), 2)"/>
			</span>
			<a href="{$root}/forum/discussions/{$forum-id}/">
				<xsl:value-of select="substring-after($string, ']')"/>
			</a>
		</xsl:when>
		<xsl:otherwise>
			<a href="{$root}/forum/discussions/{$forum-id}/" title="{$created-by}">
				<xsl:value-of select="$string"/>
			</a>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<!-- Displays a set of moderator options for a discussion-->
<xsl:template name="discussion-options">
	<xsl:param name="closed"/>
	<xsl:param name="sticky"/>

	<h3>Actions</h3>
	<ul>
		<li><a class="confirm" title="Are you sure you want to remove the entire discussion?" href="{$current-url}?forum-action=remove">Remove discussion</a></li>
		<li>
			<xsl:choose>
				<xsl:when test="$closed = 'Yes'">
					<a href="{$current-url}?forum-action=open">Open discussion</a>
				</xsl:when>
				<xsl:otherwise>
					<a href="{$current-url}?forum-action=close">Close discussion</a>
				</xsl:otherwise>
			</xsl:choose>
		</li>
		<li>
			<xsl:choose>
				<xsl:when test="$sticky = 'Yes'">
					<a href="{$current-url}?forum-action=unpin">Unpin discussion</a>
				</xsl:when>
				<xsl:otherwise>
					<a href="{$current-url}?forum-action=pin">Pin discussion</a>
				</xsl:otherwise>
			</xsl:choose>
		</li>
		<li>
			<a id="toggle-admin-controls" href="#">Toggle Admin Controls</a>
		</li>
	</ul>
</xsl:template>

</xsl:stylesheet>