<!DOCTYPE stylesheet [
<!ENTITY nbsp   "&#160;" ><!-- no-break space = non-breaking space, U+00A0 ISOnum -->
]>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:bebop="http://www.arsdigita.com/bebop/1.0"
                xmlns:cms="http://www.arsdigita.com/cms/1.0"
                exclude-result-prefixes="xsl bebop cms"
version="1.0">

 

<xsl:template name="CT_Job_graphics">
<div id="details">	
<p>
<span class="bold">Grade:</span><xsl:value-of disable-output-escaping="yes" select="./grade"/>
</p>
<p>
<span class="bold">Department:</span><xsl:value-of disable-output-escaping="yes" select="./department"/>
</p>
<p>
<span class="bold">Salary:</span><xsl:value-of disable-output-escaping="yes" select="./salary"/>
</p>
<p>
<span class="bold">Ref:</span><xsl:value-of disable-output-escaping="yes" select="./refNumber"/>
</p>
<p>
<span class="bold">Closing Date:</span><xsl:value-of disable-output-escaping="yes" select="./closingDate"/>
</p>
<p>
<span class="bold">Contact:</span><xsl:value-of disable-output-escaping="yes" select="./contactDetails"/>
</p>
</div>
<div id="mainBody">
<p> 
<span class="bold">Job Description: </span>
<xsl:value-of disable-output-escaping="yes" select="./jobDescription"/>
</p>
<p> 
<span class="bold">Person Specification: </span>
<xsl:value-of disable-output-escaping="yes" select="./personSpecification"/>
</p>
<xsl:value-of disable-output-escaping="yes" select="./body"/>
</div>
</xsl:template>
</xsl:stylesheet>