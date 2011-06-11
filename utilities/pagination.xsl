<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="pagination">
	<xsl:param name="pagination-element" />
	<xsl:param name="display-number" />
	<xsl:param name="url" />
		
	<xsl:variable name="display-number">
		<xsl:choose>
			<xsl:when test="$display-number &lt; 3">3</xsl:when>
			<xsl:when test="$display-number &lt; $pagination-element/@total-pages">
				<xsl:value-of select="$display-number"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$pagination-element/@total-pages - 1"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	
	<xsl:if test="$pagination-element/@total-pages &gt; 1">
	
		<xsl:variable name="current-page">
			<xsl:choose>
				<xsl:when test="$pagination-element/@current-page = ''">1</xsl:when>
				<xsl:otherwise><xsl:value-of select="$pagination-element/@current-page"/></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
	
		<xsl:variable name="previous-page">
			<xsl:choose>
				<xsl:when test="$current-page = 1"><xsl:value-of select="$pagination-element/@total-pages" /></xsl:when>
				<xsl:otherwise><xsl:value-of select="$current-page - 1" /></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		
		<xsl:variable name="next-page">
			<xsl:choose>
				<xsl:when test="$current-page = $pagination-element/@total-pages">1</xsl:when>
				<xsl:otherwise><xsl:value-of select="$current-page + 1" /></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		
		<xsl:variable name="last-section">
			<xsl:value-of select="$pagination-element/@total-pages - $display-number" />
		</xsl:variable>
		
		<xsl:variable name="first-page">
			<xsl:choose>
				<xsl:when test="$current-page &gt;= 1 and $current-page &lt; $display-number">
					<xsl:text>1</xsl:text>
				</xsl:when>
				<xsl:when test="$current-page &gt; $last-section and $current-page &lt;= $pagination-element/@total-pages">
					<xsl:value-of select="$last-section" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$current-page - (floor($display-number div 2))" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="last-page">
			<xsl:choose>
				<xsl:when test="$current-page &gt; $last-section and $current-page &lt;= $pagination-element/@total-pages">
					<xsl:value-of select="$first-page + $display-number"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$first-page + $display-number - 1"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		
		<ul id="pagination">
			<li>
				<xsl:if test="$next-page = 2">
					<xsl:attribute name="class">disabled</xsl:attribute>
				</xsl:if>
				<a class="pagination-previous">
					<xsl:attribute name="href">
						<xsl:call-template name="string-replace">
							<xsl:with-param name="string" select="$url" />
							<xsl:with-param name="search" select="'$'" />
							<xsl:with-param name="replace" select="string($previous-page)" />
						</xsl:call-template>
					</xsl:attribute>
					<xsl:text>&#171; Previous</xsl:text>
				</a>
			</li>
			
			<xsl:call-template name="pagination-numbers">
				<xsl:with-param name="first-page" select="$first-page"/>
				<xsl:with-param name="last-page" select="$last-page"/>
				<xsl:with-param name="current-page" select="$current-page"/>
				<xsl:with-param name="iterations" select="$last-page - $first-page"/>
				<xsl:with-param name="total-pages" select="$pagination-element/@total-pages"/>
				<xsl:with-param name="url" select="$url"/>
			</xsl:call-template>
			
			<li>
				<xsl:if test="$next-page = 1">
					<xsl:attribute name="class">disabled</xsl:attribute>
				</xsl:if>
				<a class="pagination-next">
					<xsl:attribute name="href">
						<xsl:call-template name="string-replace">
							<xsl:with-param name="string" select="$url" />
							<xsl:with-param name="search" select="'$'" />
							<xsl:with-param name="replace" select="string($next-page)" />
						</xsl:call-template>
					</xsl:attribute>
					<xsl:text>Next &#187;</xsl:text>
				</a>
			</li>
		</ul>
	
	</xsl:if>
	
</xsl:template>

<xsl:template name="pagination-numbers">
	<xsl:param name="first-page" select="$first-page"/>
	<xsl:param name="last-page" select="$last-page"/>
	<xsl:param name="current-page" select="$current-page"/>
	<xsl:param name="iterations" select="$iterations"/>
	<xsl:param name="total-pages" select="$total-pages"/>
	<xsl:param name="url" select="$url"/>
	<xsl:param name="count" select="$iterations"/>

	<xsl:if test="$count &gt;= 0">
		
		<xsl:variable name="this-page" select="$first-page + ($iterations - $count)"/>
		
		<xsl:if test="$this-page = $first-page and $first-page &gt; 1">
			<li>				 
				<a class="page">
					<xsl:attribute name="href">
						<xsl:call-template name="string-replace">
							<xsl:with-param name="string" select="$url" />
							<xsl:with-param name="search" select="'$'" />
							<xsl:with-param name="replace" select="'1'" />
						</xsl:call-template>
					</xsl:attribute>
					<xsl:text>1</xsl:text>
				</a>
				<xsl:if test="$this-page != 2">
					<span>...</span>
				</xsl:if>		
			</li>		
		</xsl:if>
		
		<li>
			<xsl:if test="$this-page = $current-page">
				<xsl:attribute name="class">selected</xsl:attribute>
			</xsl:if>
			<a class="page">
				<xsl:attribute name="href">
					<xsl:call-template name="string-replace">
						<xsl:with-param name="string" select="$url"/>
						<xsl:with-param name="search" select="'$'"/>
						<xsl:with-param name="replace" select="string($this-page)"/>
					</xsl:call-template>
				</xsl:attribute>
				<xsl:value-of select="$this-page"/>
			</a>
		</li>
		
		<xsl:if test="$this-page = $last-page and $last-page &lt; $total-pages">
			<li>
				<xsl:if test="$this-page != ($total-pages - 1)">
					<span>...</span>
				</xsl:if> 
				<a class="page">
					<xsl:attribute name="href">
						<xsl:call-template name="string-replace">
							<xsl:with-param name="string" select="$url" />
							<xsl:with-param name="search" select="'$'" />
							<xsl:with-param name="replace" select="string($total-pages)" />
						</xsl:call-template>
					</xsl:attribute>
					<xsl:value-of select="$total-pages" />
				</a>
			</li>
		</xsl:if>
		
		<xsl:call-template name="pagination-numbers">
			<xsl:with-param name="count" select="$count - 1"/>
			<xsl:with-param name="first-page" select="$first-page"/>
			<xsl:with-param name="last-page" select="$last-page"/>
			<xsl:with-param name="current-page" select="$current-page"/>
			<xsl:with-param name="total-pages" select="$total-pages"/>
			<xsl:with-param name="url" select="$url"/>
			<xsl:with-param name="iterations" select="$iterations"/>
		</xsl:call-template>
		
	</xsl:if>
	
</xsl:template>

<xsl:template name="string-replace">
    <xsl:param name="string"/>
    <xsl:param name="search"/>
    <xsl:param name="replace"/>

    <xsl:choose>
         <xsl:when test="contains($string, $search)">
            <xsl:variable name="before" select="substring-before($string, $search)"/>
            <xsl:variable name="after" select="substring-after($string, $search)"/>

            <xsl:value-of select="$before"/>
            <xsl:value-of select="$replace"/>

            <xsl:call-template name="string-replace">
                 <xsl:with-param name="string" select="$after"/>
                 <xsl:with-param name="search" select="$search"/>
                 <xsl:with-param name="replace" select="$replace"/>
            </xsl:call-template>
        </xsl:when>

        <xsl:otherwise>
            <xsl:value-of select="$string"/>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

</xsl:stylesheet>