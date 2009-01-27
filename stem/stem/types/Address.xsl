<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:bebop="http://www.arsdigita.com/bebop/1.0"
                xmlns:cms="http://www.arsdigita.com/cms/1.0"
                exclude-result-prefixes="xsl bebop cms"
version="1.0">




<xsl:template name="CT_Address_graphics">
<div id="details">
<xsl:if test="./address">
<p>
<span class="bold">Address:</span><xsl:value-of disable-output-escaping="yes" select="./address"/>
</p>
</xsl:if>
<xsl:if test="./postalCode">
<p>
<span class="bold">Post Code:</span><xsl:value-of disable-output-escaping="yes" select="./postalCode"/>
</p>
</xsl:if>
<xsl:if test="./isoCountryCode/countryName">
<p>
<span class="bold">Country:</span><xsl:value-of disable-output-escaping="yes" select="./isoCountryCode/countryName"/>
</p>
</xsl:if>
<xsl:if test="./phone">
<p>
<span class="bold">Phone:</span><xsl:value-of disable-output-escaping="yes" select="./phone"/>
</p>
</xsl:if>
<xsl:if test="./mobile">
<p>
<span class="bold">Mobile:</span><xsl:value-of disable-output-escaping="yes" select="./mobile"/>
</p>
</xsl:if>
<xsl:if test="./fax">
<p>
<span class="bold">Fax:</span><xsl:value-of disable-output-escaping="yes" select="./fax"/>
</p>
</xsl:if>
<xsl:if test="./email">
<p>
<span class="bold">Email:</span><xsl:value-of disable-output-escaping="yes" select="./email"/>
</p>
</xsl:if>
<xsl:if test="./notes">
<p>
<span class="bold">Notes:</span><xsl:value-of disable-output-escaping="yes" select="./notes"/>
</p>
</xsl:if>
</div>


<div id="mainBody">
<p class="bold">
<xsl:value-of disable-output-escaping="yes" select="./lead"/>
</p>
<xsl:value-of disable-output-escaping="yes" select="./textAsset/content"/>
</div>

</xsl:template>
</xsl:stylesheet>
