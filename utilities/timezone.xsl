<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="timezone-offset-options">
	<xsl:param name="ii" />
	<xsl:param name="count" />
	<xsl:param name="selected" />

	<xsl:if test="$ii &lt;= $count">
		<option value="{$ii}">
			<xsl:if test="$ii = $selected">
				<xsl:attribute name="selected">selected</xsl:attribute>
			</xsl:if>
			<xsl:if test="$ii &gt; 0">+</xsl:if>
			<xsl:value-of select="$ii" />
		</option>
	</xsl:if>

	<xsl:if test="$ii &lt;= $count">
		<xsl:call-template name="timezone-offset-options">
			<xsl:with-param name="ii">
				<xsl:value-of select="$ii + 1"/>
			</xsl:with-param>
			<xsl:with-param name="count">
				<xsl:value-of select="$count"/>
			</xsl:with-param>
			<xsl:with-param name="selected">
				<xsl:value-of select="$selected"/>
			</xsl:with-param>			
		</xsl:call-template>
	</xsl:if>
</xsl:template>

</xsl:stylesheet>