<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:date="http://exslt.org/dates-and-times" xmlns:math="http://exslt.org/math" extension-element-prefixes="date math">

<xsl:template name="time-ago">
	<xsl:param name="date"/>
	
	<xsl:param name="date-and-time" select="concat($date, 'T', $date/@time, ':00')"/>
	
	<xsl:variable name="now" select="concat($today, 'T', $current-time, ':00')" />	
	<xsl:variable name="minutes" select="date:seconds(date:difference($date-and-time, $now)) div 60" />
	<xsl:variable name="delta-minutes" select="math:abs($minutes)" />

	<xsl:variable name="formatted-date">
		<xsl:call-template name="format-date">
			<xsl:with-param name="date" select="$date"/>
			<xsl:with-param name="format" select="'d m Y'"/>
		</xsl:call-template>
	</xsl:variable>

	<xsl:variable name="delta-in-words">
		<xsl:choose>
			<xsl:when test="$delta-minutes &lt; 30">
				<xsl:text>Just now</xsl:text>
			</xsl:when>
			<xsl:when test="$delta-minutes &lt; 1440">
				<xsl:text>Today</xsl:text>
			</xsl:when>
			<xsl:when test="$delta-minutes &lt; 2880">
				<xsl:text>Yesterday</xsl:text>
			</xsl:when>
			<xsl:when test="$delta-minutes &lt; 43200">
				<xsl:value-of select="floor($delta-minutes div 1440)"/>
				<xsl:text> days</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$formatted-date"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	
	<xsl:value-of select="$delta-in-words"/>
	
</xsl:template>

</xsl:stylesheet>