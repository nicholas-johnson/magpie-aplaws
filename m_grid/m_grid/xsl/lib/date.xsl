<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:ui="http://www.arsdigita.com/ui/1.0"
		xmlns:bebop="http://www.arsdigita.com/bebop/1.0"
		xmlns:portal="http://www.uk.arsdigita.com/portal/1.0"
		xmlns:cms="http://www.arsdigita.com/cms/1.0"
		xmlns:nav="http://ccm.redhat.com/london/navigation"
		xmlns:atoz="http://xmlns.redhat.com/atoz/1.0"
		xmlns:terms="http://xmlns.redhat.com/london/terms/1.0"
		exclude-result-prefixes="xsl ui bebop portal cms nav atoz terms">
		
	<xsl:template name="date">
		<xsl:param name="date" />
		<xsl:value-of select="substring($date, 8, 4)" />
		<xsl:text> </xsl:text>
		<xsl:variable name="month" select="substring($date, 5, 3)"/>
		<xsl:choose>
			<xsl:when test="$month='Jan'">January</xsl:when>
			<xsl:when test="$month='Feb'">February</xsl:when>
			<xsl:when test="$month='Mar'">March</xsl:when>
			<xsl:when test="$month='Apr'">April</xsl:when>
			<xsl:when test="$month='May'">May</xsl:when>
			<xsl:when test="$month='Jun'">June</xsl:when>
			<xsl:when test="$month='Jul'">July</xsl:when>
			<xsl:when test="$month='Aug'">August</xsl:when>
			<xsl:when test="$month='Sep'">September</xsl:when>
			<xsl:when test="$month='Oct'">October</xsl:when>
			<xsl:when test="$month='Nov'">November</xsl:when>
			<xsl:when test="$month='Dec'">December</xsl:when>
		</xsl:choose>
		<xsl:text> </xsl:text>
		<xsl:value-of select="number(substring($date, 25, 4))" />
	</xsl:template>

</xsl:stylesheet>