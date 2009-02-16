<!DOCTYPE stylesheet [
<!ENTITY nbsp   "&#160;" ><!-- no-break space = non-breaking space, U+00A0 ISOnum -->
]>

<xsl:stylesheet 
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
		xmlns:bebop="http://www.arsdigita.com/bebop/1.0"
		xmlns:cms="http://www.arsdigita.com/cms/1.0"
		exclude-result-prefixes="xsl bebop cms"
		version="1.0">




<xsl:template name="CT_InlineSite">
<iframe>
	<xsl:attribute name="noresize" />
	<xsl:attribute name="frameborder">0</xsl:attribute>
	<xsl:attribute name="name">content</xsl:attribute>
	<xsl:attribute name="width">100%</xsl:attribute>
	<xsl:attribute name="height">400</xsl:attribute>
	<xsl:attribute name="scrolling">yes</xsl:attribute>
	<xsl:attribute name="src"><xsl:value-of select="./url"/></xsl:attribute>
</iframe>
</xsl:template>


</xsl:stylesheet>

