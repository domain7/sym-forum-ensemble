<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>

<xsl:template match="data">
	<h2 class="heading">Edit Discussion</h2>
	<form method="post" action="{$current-url}">
		<fieldset>
			<p>
				<xsl:if test="/data/events/forum-post[@result = 'error']/topic">
					<xsl:attribute name="class">error</xsl:attribute>
				</xsl:if>
				<label>Topic</label>
				<input name="fields[topic]" type="text" value="{forum-discussions/entry/topic}"/>
			</p>
			<p>
				<xsl:if test="/data/events/forum-post[@result = 'error']/comment">
					<xsl:attribute name="class">error</xsl:attribute>
				</xsl:if>
				<label>Comment</label>
				<span id="wmd-editor" class="wmd-panel">
					<span id="wmd-button-bar"></span>
					<textarea id="wmd-input" name="fields[comment]">
						<xsl:value-of select="forum-edit-discussion"/>							
					</textarea>
				</span>
			</p>
		
			<input name="id" type="hidden" value="{$discussion-id}"/>
	        <input name="fields[comment-id]" type="hidden" value="{forum-edit-discussion/@comment-id}"/>

			<div id="submission">
				<input id="submit" name="action[forum-edit-discussion]" type="submit" value="Submit changes" class="button"/>
				<a id="cancel" href="{$root}/forum/" class="button">Cancel and go back</a>
			</div>
			<input name="redirect" type="hidden" value="{$root}/forum/discussions/{$discussion-id}/" />
		</fieldset>
	</form>
</xsl:template>

</xsl:stylesheet>