<!DOCTYPE stylesheet [
<!ENTITY nbsp   "&#160;" ><!-- no-break space = non-breaking space, U+00A0 ISOnum -->
]>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:bebop="http://www.arsdigita.com/bebop/1.0"
                xmlns:cms="http://www.arsdigita.com/cms/1.0"
                exclude-result-prefixes="xsl bebop cms"
version="1.0">


<xsl:template name="CT_Minutes_graphics">
<div id="details">
<p>
<span class="bold">Description of Minutes:</span><xsl:value-of disable-output-escaping="yes" select="./description"/>
</p>
<p>
<span class="bold">Minutes ID Number:</span><xsl:value-of disable-output-escaping="yes" select="./minuteNumber" />
</p>
<p>
<span class="bold">Attendees At Meeting:</span><xsl:value-of disable-output-escaping="yes" select="./attendees"/>
</p>			
</div>
<div id="mainBody">
<p class="bold">
<xsl:value-of disable-output-escaping="yes" select="./descriptionOfMinutes"/>
</p>
<p>
<span class="bold">Action Item: </span><xsl:value-of disable-output-escaping="yes" select="./actionItem"/>
</p>
<xsl:value-of disable-output-escaping="yes" select="./textAsset/content"/>
</div>
</xsl:template>
</xsl:stylesheet>
