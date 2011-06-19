<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />

<xsl:template match="/">
	<xsl:apply-templates select="data/etm-member/entry" />
---
<xsl:value-of select="$website-name" />
</xsl:template>

<xsl:template match="data/etm-member/entry">Dear <xsl:value-of select="name" />,

Your password has been successfully updated for <xsl:value-of select="$website-name" />.

If you believe your password has been reset by someone else, let us know and we'll restore the security of your account.

Regards,

</xsl:template>

</xsl:stylesheet>