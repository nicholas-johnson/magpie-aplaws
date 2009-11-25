<!DOCTYPE stylesheet [
<!ENTITY nbsp   "&#160;" ><!-- no-break space = non-breaking space, U+00A0 ISOnum -->
]>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
		xmlns:bebop="http://www.arsdigita.com/bebop/1.0"
		xmlns:cms="http://www.arsdigita.com/cms/1.0"
		exclude-result-prefixes="xsl bebop cms"
		version="1.0">		


<xsl:template name="CT_Event_graphics">
<div id="details">
<p>
<span class="bold">Event Type:</span><xsl:value-of disable-output-escaping="yes" select="./eventType"/>
</p>
<p>
<span class="bold">Event Date:</span>
<xsl:value-of disable-output-escaping="yes" select="./eventDate"/>
</p>
<p>
<span class="bold">Start Date:</span>
<xsl:value-of disable-output-escaping="yes" select="./startDate"/>
</p>
<p>
<span class="bold">Start Time:</span>
<xsl:value-of disable-output-escaping="yes" select="./startTime"/>
</p>
<p>
<span class="bold">End Date:</span>
<xsl:value-of disable-output-escaping="yes" select="./endDate"/>
</p>
<p>
<span class="bold">End Time:</span>
<xsl:value-of disable-output-escaping="yes" select="./endTime"/>
</p>
<p>
<span class="bold">Contributor:</span><xsl:value-of disable-output-escaping="yes" select="./mainContributor"/>
</p>
<p>
<span class="bold">Location:</span><xsl:value-of disable-output-escaping="yes" select="./location"/>
</p>
<p>
<span class="bold">Map:</span>
<a class="CIDetail" href="{./mapLink}">
View map
</a>
</p>
<p>
<span class="bold">Cost:</span><xsl:value-of disable-output-escaping="yes" select="./cost"/>
</p>
</div>
<div id="mainBody">
<p class="bold">
<xsl:value-of disable-output-escaping="yes" select="./lead"/>
</p>
<xsl:value-of disable-output-escaping="yes" select="./textAsset/content"/>
</div>
</xsl:template>   
</xsl:stylesheet>