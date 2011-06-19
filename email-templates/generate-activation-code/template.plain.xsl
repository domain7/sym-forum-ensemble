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

As requested, we are sending you an activation code for <xsl:value-of select="$website-name" />.

To activate your account, head to <xsl:value-of select="concat($root, '/members/activate/', activation/code, '/' , email, '/')" />

This code will expire in one hour, so if you miss your window, simply head to the link above and click "Resend the activation email" to get a new one.

If you have problems accessing your account, let us know and we'll do our best to help.

Regards,

</xsl:template>

</xsl:stylesheet>