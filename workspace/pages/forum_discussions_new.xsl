<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>

<xsl:template match="data">
	<h2 class="heading">New Discussion</h2>
	<form method="post" action="{$current-url}">
		<fieldset>
			<p>
				<xsl:if test="/data/events/forum-post[@result = 'error']/topic">
					<xsl:attribute name="class">error</xsl:attribute>
				</xsl:if>
				<label for="post-topic">Topic</label>
				<input id="post-topic" name="fields[topic]" type="text" value="{/data/events/forum-post-discussion/post-values/topic}"/>
			</p>
			<p>
				<xsl:if test="/data/events/forum-post[@result = 'error']/comment">
					<xsl:attribute name="class">error</xsl:attribute>
				</xsl:if>
				<label for="post-comment">Comment</label>
				<span id="wmd-editor" class="wmd-panel">
					<span id="wmd-button-bar"></span>
					<textarea id="wmd-input" name="fields[comment]">
						<xsl:value-of select="/data/events/forum-post-comment/post-values/comment"/>
					</textarea>
				</span>
			</p>
			<input name="fields[created-by]" type="hidden" value="{$member/@id}"/>
			<input name="fields[last-post]" type="hidden" value="{$member/@id}"/>
			<div id="submission">
				<input id="submit" name="action[forum-new-discussion]" type="submit" value="Create discussion" class="button"/>
				<a id="cancel" href="{$root}/forum/" class="button">Cancel and go back</a>
			</div>
			<input name="redirect" type="hidden">
				<xsl:attribute name="value"><xsl:value-of select="$root"/>/forum/discussions/{$id}/</xsl:attribute>
			</input>
		</fieldset>
	</form>
</xsl:template>

</xsl:stylesheet>