<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="*" mode="html">
    <xsl:element name="{name()}">
        <xsl:apply-templates select="* | @* | text()" mode="html"/>
    </xsl:element>
</xsl:template>

<xsl:template match="@*" mode="html">
    <xsl:attribute name="{name(.)}">
        <xsl:value-of select="." mode="html"/>
    </xsl:attribute>
</xsl:template>

<xsl:template match="pre" mode="html">
	<div class="code-block">
		<pre>
			<xsl:value-of select="code"/>
		</pre>
	</div>
</xsl:template>

</xsl:stylesheet>