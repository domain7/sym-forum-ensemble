<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>

<xsl:template match="data">
	<h2 class="heading">Edit Comment</h2>
	<form method="post" action="{$current-url}">
		<fieldset>
			<p>
				<xsl:if test="/data/events/forum-post-comment[@result = 'error']/comment">
					<xsl:attribute name="class">error</xsl:attribute>
				</xsl:if>
				<label>Comment</label>
				<span id="wmd-editor" class="wmd-panel">
					<span id="wmd-button-bar"></span>
					<textarea id="wmd-input" name="fields[comment]">
						<xsl:value-of select="forum-edit-comment"/>							
					</textarea>
				</span>
			</p>
			<input name="id" type="hidden" value="{$comment-id}" />
			<div id="submission">
				<input id="submit" name="action[forum-edit-comment]" type="submit" value="Commit changes" class="button"/>
				<a id="cancel" href="{$root}/forum/" class="button">Cancel and go back</a>
			</div>
			<input name="redirect" type="hidden">
				<xsl:attribute name="value">
					<xsl:value-of select="$root"/>
					<xsl:text>/forum/discussions/</xsl:text>
					<xsl:value-of select="forum-edit-comment/@discussion-id"/>
					<xsl:text>/</xsl:text>
					<xsl:value-of select="$cpage"/>
					<xsl:text>/</xsl:text>
					<xsl:text>#position-</xsl:text>
					<xsl:value-of select="$position"/>
				</xsl:attribute>
			</input>
		</fieldset>
	</form>
</xsl:template>

</xsl:stylesheet>