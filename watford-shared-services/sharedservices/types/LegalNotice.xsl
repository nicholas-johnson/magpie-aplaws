<!DOCTYPE stylesheet [
<!ENTITY nbsp   "&#160;" ><!-- no-break space = non-breaking space, U+00A0 ISOnum -->
]>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:bebop="http://www.arsdigita.com/bebop/1.0"
                xmlns:cms="http://www.arsdigita.com/cms/1.0"
                exclude-result-prefixes="xsl bebop cms"
version="1.0">



<xsl:template name="CT_LegalNotice_graphics">
<div id="details">
<p>
<span class="bold">UID:</span><xsl:value-of disable-output-escaping="yes" select="./governmentUID"/>
</p>
</div>
<div id="mainBody">
<xsl:value-of disable-output-escaping="yes" select="./textAsset/content"/>
</div>
</xsl:template>
</xsl:stylesheet>