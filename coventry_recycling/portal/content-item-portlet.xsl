<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:admin="http://www.arsdigita.com/admin-ui/1.0"
  xmlns:bebop="http://www.arsdigita.com/bebop/1.0"
  xmlns:cms="http://www.arsdigita.com/cms/1.0"
  xmlns:portal="http://www.uk.arsdigita.com/portal/1.0"
  xmlns:portlet="http://www.arsdigita.com/portlet/1.0"
	exclude-result-prefixes="xsl admin bebop cms portal portlet"
	version="1.0">




<xsl:template match="portlet:contentItem">
<xsl:for-each select="./cms:item">
<div class="CI">
	
	RUDI!!!
<h2>
<a>
		<xsl:attribute name="href">/redirect/?oid=<xsl:value-of select="@oid"/></xsl:attribute>
		<xsl:value-of select="title"/>
</a>
</h2>
<xsl:value-of disable-output-escaping="yes" select="./summary"/>
</div>
</xsl:for-each>
</xsl:template>    
</xsl:stylesheet>
