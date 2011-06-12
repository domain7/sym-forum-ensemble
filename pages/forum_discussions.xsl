<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>
<xsl:import href="../utilities/forum-tools.xsl"/>
<xsl:import href="../utilities/pagination.xsl"/>

<xsl:template match="data">
	<xsl:apply-templates select="forum-comments"/>
</xsl:template>

<xsl:variable name="closed" select="/data/forum-discussions/entry/closed"/>
<xsl:variable name="pinned" select="/data/forum-discussions/entry/pinned"/>

<xsl:template match="data" mode="side-panel">
	<h3>Search</h3>
	<div id="search">
		<form method="get" action="{$root}/">
			<fieldset>
				<input id="query" class="clear-on-focus" name="query" type="text" title="Search" value="" />
				<button type="submit" value="Search">Search</button>
			</fieldset>
		</form>
	</div>
	<xsl:if test="$member/role = 'Author' or $member/role = 'Administrator'">
		<xsl:call-template name="discussion-options">
			<xsl:with-param name="closed" select="$closed"/>
			<xsl:with-param name="sticky" select="$pinned"/>
		</xsl:call-template>
	</xsl:if>
	<h3>Filters</h3>
	<ul>
		<li>
			<a href="{$root}/" title="Filter discussions">All Discussions</a>
		</li>
		<li>
			<a href="{$root}/forum-filter/" title="Filter discussions">My Discussions</a>
		</li>
	</ul>
</xsl:template>

<!-- Main comments template -->
<xsl:template match="forum-comments">
	<h2 class="heading"><xsl:value-of select="/data/forum-discussions/entry/topic"/></h2>

	<xsl:if test="pagination/@total-pages &gt; 1">
		<a id="page-info" href="#pagination"><xsl:value-of select="concat('Page ', pagination/@current-page, ' of ', pagination/@total-pages)"/></a>
	</xsl:if>

	<xsl:apply-templates select="entry"/>

	<xsl:call-template name="pagination">
	    <xsl:with-param name="pagination-element" select="pagination" />
	    <xsl:with-param name="display-number" select="'7'" />
	    <xsl:with-param name="url">
	    	<xsl:value-of select="$root"/>
	    	<xsl:text>/forum/discussions/</xsl:text>
	    	<xsl:value-of select="$discussion-id"/>
	    	<xsl:text>/$/</xsl:text>
	    </xsl:with-param>
	</xsl:call-template>

	<xsl:if test="($permissions/add_comment and $closed = 'No') or ($member/role = 'Author')">
		<form method="post" action="{$current-url}">
			<fieldset>
				<p>
					<xsl:if test="/data/events/forum-post[@result = 'error']/comment">
						<xsl:attribute name="class">error</xsl:attribute>
					</xsl:if>
					<label>Comment</label>
					<span id="wmd-editor" class="wmd-panel">
						<span id="wmd-button-bar"></span>
						<textarea id="wmd-input" name="fields[comment]">
							<xsl:value-of select="/data/events/forum-post/post-values/comment"/>					
						</textarea>
					</span>
				</p>
				<input name="fields[parent-id]" type="hidden" value="{$discussion-id}"/>
				<input name="fields[created-by]" type="hidden" value="{$member/@id}"/>
				<input name="redirect" type="hidden">
					<xsl:attribute name="value">
						<xsl:value-of select="concat($root, '/forum/discussions/', $discussion-id, '/')"/>
						<xsl:choose>
							<xsl:when test="/data/forum-comments/pagination/@total-entries mod 20 = 0">
								<xsl:value-of select="/data/forum-comments/pagination/@total-pages + 1"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="/data/forum-comments/pagination/@total-pages"/>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:value-of select="concat('/#position-', /data/forum-comments/pagination/@total-entries + 1)"/>	
					</xsl:attribute>
				</input>
				<div id="submission">
					<input id="submit" name="action[forum-new-comment]" type="submit" value="Post comment" class="button" />
					<a id="cancel" href="{$root}/forum/" class="button">Cancel and go back</a>
				</div>
			</fieldset>
		</form>
	</xsl:if>
</xsl:template>

<!-- Comments entry template -->
<xsl:template match="forum-comments/entry">
	<xsl:variable name="page">
		<xsl:choose>
			<xsl:when test="$cpage = ''">1</xsl:when>
			<xsl:otherwise><xsl:value-of select="$cpage"/></xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<xsl:variable name="comment-position" select="($page - 1) * 20 + position()"/>
	
	<div id="position-{$comment-position}" class="comment">
		<div class="meta">
			<ul class="avatar">
				<li class="gicon">
					<img src="http://www.gravatar.com/avatar/{created-by/@email-address-hash}?s=50&amp;d=http%3A%2F%2Fsymphony-cms.com%2Fworkspace%2Fassets%2Fimages%2Ficons%2Fsymphony-avatar.png" width="50" height="50"/>
				</li>
				<li class="position"><a href="#position-{$comment-position}"><xsl:value-of select="$comment-position"/></a></li>
			</ul>
			<ul>
				<li class="member">
					<a href="{$root}/members/{created-by}/">
						<xsl:value-of select="created-by"/>
					</a>
				</li>
				<li class="date">
					<xsl:call-template name="format-date">
						<xsl:with-param name="date" select="date"/>
						<xsl:with-param name="format" select="'d m y, T'"/>
					</xsl:call-template>
				</li>
				<xsl:choose>
					<xsl:when test="created-by/@id = 2101 or created-by/@id = 2102 or created-by/@id = 2103 or created-by/@id = 5061">
						<li class="dev icon">dev team</li>
					</xsl:when>
					<xsl:when test="created-by/@id = /data/forum-moderators/entry/@id">
						<li class="admin icon">admin</li>
					</xsl:when>
				</xsl:choose>
			</ul>
			<ul class="comment-options">
				<xsl:if test="$member/role = 'Administrator'">
					<xsl:attribute name="class">comment-options admin hide</xsl:attribute>
				</xsl:if>
				<xsl:choose>
					<xsl:when test="(position() = 1 and ../pagination/@current-page = 1) and ($permissions/edit_discussion)">
						<li><a href="{$root}/forum/discussions/edit-discussion/{$discussion-id}/" class="button">Edit</a></li>
					</xsl:when>
					<xsl:when test="(position() = 1 and ../pagination/@current-page = 1) and ($permissions/edit_own_discussion) and ($member/@id = created-by/@id)">
						<li><a href="{$root}/forum/discussions/edit-discussion/{$discussion-id}/" class="button">Edit</a></li>
					</xsl:when>
					<xsl:when test="$permissions/edit_comment">
						<li><a href="{$root}/forum/discussions/edit-comment/{@id}/{../pagination/@current-page}/{$comment-position}/" class="button">Edit</a></li>
					</xsl:when>
					<xsl:when test="($permissions/edit_own_comment) and ($member/@id = created-by/@id)">
						<li><a href="{$root}/forum/discussions/edit-comment/{@id}/{../pagination/@current-page}/{$comment-position}/" class="button">Edit</a></li>
					</xsl:when>
				</xsl:choose>
				<xsl:choose>
					<xsl:when test="(position() = 1) and $permissions/remove_discussion">
						<li><a class="confirm button" title="Are you sure you want to remove the entire discussion?" href="{$current-url}?forum-action=remove">Remove</a></li>
					</xsl:when>
					<xsl:when test="(position() = 1) and $permissions/remove_own_discussion and ($member/@id = created-by/@id)">
						<li><a class="confirm button" title="Are you sure you want to remove the entire discussion?" href="{$current-url}?forum-action=remove">Remove</a></li>
					</xsl:when>
					<xsl:when test="$permissions/remove_comment">
						<li><a class="confirm button" title="Are you sure you want to remove this comment?" href="{$current-url}?forum-action=remove-comment&amp;comment-id={@id}">Remove</a></li>
					</xsl:when>
					<xsl:when test="($permissions/remove_own_comment) and ($member/@id = created-by/@id)">
						<li><a class="confirm button" title="Are you sure you want to remove this comment?" href="{$current-url}?forum-action=remove-comment&amp;comment-id={@id}">Remove</a></li>
					</xsl:when>
				</xsl:choose>
			</ul>
		</div>
		<div class="comment-body"><xsl:apply-templates select="comment/*" mode="html"/></div>
	</div>
</xsl:template>

<xsl:template match="pre[string-length(.) &gt; 180]" mode="html">
	<div class="code-block">
		<pre>
			<xsl:value-of select="code"/>
		</pre>
		<a href="{$root}/forum/code-source/{ancestor::entry/@id}/{count(preceding-sibling::pre) + 1}/">View Source</a>
	</div>
</xsl:template>

<xsl:template match="data" mode="page-title">
	<title>Forum &#8211; &#8220;<xsl:value-of select="forum-discussions/entry/topic"/>&#8221;</title>
</xsl:template>

</xsl:stylesheet>