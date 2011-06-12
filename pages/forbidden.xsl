<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>

<xsl:template match="data">
	<h2 class="heading heading-alert">Access Denied!</h2>
	<h3>Hey! You're not allowed back here! Or are you?</h3>
	<p>Some parts of our agency require top secret clearance to access.</p>
	<p>If you're trying to get the inside scoop, why don't you <a href="{$root}/members/new/">join our ranks</a>?</p>
</xsl:template>

<xsl:template match="data[events/member-login-info/@logged-in = 'true']">
	<h2>403: Access Denied</h2>
	<h3>Hey! You're not allowed back here!</h3>
	<p>Some parts of our agency require the blue key.</p>
	<p>It would appear that your clearance level is not high enough, so quit poking around.</p>
</xsl:template>

<xsl:template match="data[events/member-login-info/role = 'Inactive']">
	<h2>403: Access Denied</h2>
	<h3>Hey! You're not allowed back here!</h3>
	<p>Some parts of our agency require the blue key.</p>
	<p>Perhaps you do have access, but you just need to <a href="{$root}/members/activate/">activate your enrollment</a>?</p>
</xsl:template>

</xsl:stylesheet>