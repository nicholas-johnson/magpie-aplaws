<!DOCTYPE stylesheet [
<!ENTITY nbsp   "&#160;" ><!-- no-break space = non-breaking space, U+00A0 ISOnum -->
]>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
		xmlns:bebop="http://www.arsdigita.com/bebop/1.0"
		xmlns:cms="http://www.arsdigita.com/cms/1.0"
		exclude-result-prefixes="xsl bebop cms"
		version="1.0">



<xsl:template name="CT_Service_graphics">
<div id="details">
<p>
<span class="bold">Opening Times:</span><xsl:value-of disable-output-escaping="yes" select="./openingTimes"/>
</p>
<p>
<span class="bold">Contact:</span><xsl:value-of disable-output-escaping="yes" select="./contacts"/>
</p>
<p>
<span class="bold">Address:</span><xsl:value-of disable-output-escaping="yes" select="./address"/>
</p>
</div>

<div id="mainBody">
<p> 
<span class="bold">Services Provided: </span>
<xsl:value-of disable-output-escaping="yes" select="./servicesProvided"/>
</p>
<p> 
<span class="bold">Summary: </span>
<xsl:value-of disable-output-escaping="yes" select="./summary"/>
</p>
<xsl:value-of disable-output-escaping="yes" select="./body"/>
</div>

</xsl:template>
  
</xsl:stylesheet>