<!DOCTYPE stylesheet [
<!ENTITY nbsp   "&#160;" ><!-- no-break space = non-breaking space, U+00A0 ISOnum -->
]>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:bebop="http://www.arsdigita.com/bebop/1.0"
                xmlns:cms="http://www.arsdigita.com/cms/1.0"
                exclude-result-prefixes="xsl bebop cms"
version="1.0">



<xsl:template name="CT_Article_graphics">

<div id="greeting">
<xsl:for-each select="./imageCaptions">		
<div id="R_image">
<img align="top">
<xsl:attribute name="src"><xsl:value-of select="$dispatcher-prefix"/>/cms-service/stream/image/?image_id=<xsl:value-of select="imageAsset/id" /></xsl:attribute>
<xsl:attribute name="alt"><xsl:value-of select="caption" /></xsl:attribute>
</img>
</div>
</xsl:for-each>

<div id="lead">
	<xsl:value-of disable-output-escaping="yes" select="./lead"/>
</div>

</div>
<div id="mainBody">
	<xsl:value-of disable-output-escaping="yes" select="./textAsset/content"/>
</div>

</xsl:template>
</xsl:stylesheet>

