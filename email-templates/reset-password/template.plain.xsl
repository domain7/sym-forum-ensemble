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

As requested, we are sending you a password recovery code for <xsl:value-of select="$website-name" />.

To change your password, head to <xsl:value-of select="concat($root, '/members/reset-pass/', password/recovery-code, '/', email, '/')" />

If you have problems accessing your account, let us know and we'll do our best to help.

Regards,

</xsl:template>

</xsl:stylesheet>