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
		<xsl:value-of select="substring($date, 8, 3)" />
		<xsl:text>/</xsl:text>
		<xsl:variable name="month" select="substring($date, 5, 3)"/>
		<xsl:choose>
			<xsl:when test="$month='Jan'">1</xsl:when>
			<xsl:when test="$month='Feb'">2</xsl:when>
			<xsl:when test="$month='Mar'">3</xsl:when>
			<xsl:when test="$month='Apr'">4</xsl:when>
			<xsl:when test="$month='May'">5</xsl:when>
			<xsl:when test="$month='Jun'">6</xsl:when>
			<xsl:when test="$month='Jul'">7</xsl:when>
			<xsl:when test="$month='Aug'">8</xsl:when>
			<xsl:when test="$month='Sep'">9</xsl:when>
			<xsl:when test="$month='Oct'">10</xsl:when>
			<xsl:when test="$month='Nov'">11</xsl:when>
			<xsl:when test="$month='Dec'">12</xsl:when>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>