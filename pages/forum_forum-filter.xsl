<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>
<xsl:import href="../utilities/forum-tools.xsl"/>
<xsl:import href="../utilities/time-ago.xsl"/>
<xsl:import href="../utilities/pagination.xsl"/>

<xsl:param name="url-query"/>

<xsl:template match="data">
	<xsl:if test="$logged-in = 'true'">
		<div id="toolbox">
			<a id="create-entry" href="{$root}/forum/discussions/new/" class="button">Start a new discussion</a>
		</div>
	</xsl:if>
	<table id="discussions" cellpadding="0" cellspacing="0">
		<thead>
			<tr>
				<th class="topic">Topic</th>
				<th class="replies">Replies</th>
				<th class="last-active">Last Active</th>
				<th class="last-post">Last Post</th>
			</tr>
		</thead>
		<tbody>
			<td colspan="4" class="notification">This is a filtered view of discussions you have either started or replied. <a href="{$root}/forum/">Return to all discussions</a>.</td>
			<xsl:apply-templates select="forum-discussions/entry"/>
			<xsl:apply-templates select="forum-discussions/error"/>
		</tbody>
	</table>
	<xsl:call-template name="pagination">
	    <xsl:with-param name="pagination-element" select="forum-discussions/pagination" />
	    <xsl:with-param name="display-number" select="'7'" />
	    <xsl:with-param name="url" select="concat($root, '/forum/forum-filter/$/')" />
	</xsl:call-template>
</xsl:template>

<!-- Lookup table to determine discussions have been read by member -->
<xsl:key name="read-discussions" match="forum-read-discussions/discussion" use="@id"/>

<!-- Discussions entry template -->
<xsl:template match="forum-discussions/entry">

	<!-- -1 to offset the first comment since it's a 'discussion' -->
	<xsl:variable name="total-replies" select="@comments - 1"/>

	<xsl:variable name="read-discussions" select="key('read-discussions', @id)"/>

	<xsl:variable name="read-replies" select="$read-discussions/@comments - 1"/>

	<!-- Get the difference between the read comments and the total comments in a discussion -->
	<xsl:variable name="new-comments">
		<xsl:choose>
			<xsl:when test="$read-replies &lt; $total-replies">
				<xsl:value-of select="$total-replies - $read-replies"/>
			</xsl:when>
			<xsl:otherwise>0</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<!-- Different status types for a discussion -->
	<xsl:variable name="raw-status">
		<xsl:text> discussion </xsl:text>
		<xsl:if test="position() mod 2 = 0"> alternate </xsl:if>
		<xsl:if test="pinned = 'Yes'"> sticky </xsl:if>
		<xsl:if test="closed = 'Yes'"> closed </xsl:if>
		<xsl:if test="$logged-in = 'true' and ($new-comments &gt; 0 or $read-replies = 'NaN')"> unread </xsl:if>
		<xsl:if test="position() = last()"> last </xsl:if>
	</xsl:variable>

	<!-- Clean up the redundant spaces -->
	<xsl:variable name="status" select="normalize-space($raw-status)"/>

	<xsl:variable name="last-comment-page" select="1 + floor($total-replies div 20)"/>

	<xsl:variable name="next-unread-comment-page" select="1 + floor($read-replies div 20)"/>

	<!-- +1 for main discussion offset and +1 for next comment -->
	<xsl:variable name="next-unread-comment" select="$read-replies + 2"/>

	<tr id="discussion-{@id}" class="{$status}">
		<td class="topic">
			<xsl:call-template name="tagify">
				<xsl:with-param name="string" select="topic"/>
				<xsl:with-param name="forum-id" select="@id"/>
			</xsl:call-template>
			<xsl:if test="$new-comments &gt; 0">
				<a href="{$root}/forum/discussions/{@id}/{$next-unread-comment-page}/#position-{$next-unread-comment}">
					<span class="new-comments"><xsl:value-of select="concat($new-comments, ' new')"/></span>
				</a>
			</xsl:if>
		</td>
		<td class="replies"><xsl:value-of select="$total-replies"/></td>
		<td class="last-active">
			<xsl:call-template name="time-ago">
				<xsl:with-param name="date" select="last-active"/>
			</xsl:call-template>
		</td>
		<td class="last-post">
			<a href="{$root}/forum/discussions/{@id}/{$last-comment-page}/#position-{@comments}">
				<xsl:value-of select="last-post"/>
			</a>
		</td>
	</tr>
</xsl:template>

<xsl:template match="error">
	<tr class="last">
		<td colspan="3">No records found</td>
	</tr>
</xsl:template>

<xsl:template match="data" mode="page-title">
	<title>Symphony &#8211; Forum</title>
</xsl:template>

</xsl:stylesheet>