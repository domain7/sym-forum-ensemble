<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="text" encoding="UTF-8"/>

<xsl:template match="/">
	<xsl:apply-templates select="data/forum-code-source/entry"/>
</xsl:template>

<xsl:template match="forum-code-source/entry">
	<xsl:value-of select="comment/pre[position() = $position]/code"/>
</xsl:template>
	
</xsl:stylesheet>