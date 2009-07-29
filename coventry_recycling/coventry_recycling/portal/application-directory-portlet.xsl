<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:admin="http://www.arsdigita.com/admin-ui/1.0"
  xmlns:bebop="http://www.arsdigita.com/bebop/1.0"
  xmlns:portal="http://www.uk.arsdigita.com/portal/1.0"
  xmlns:portlet="http://www.uk.arsdigita.com/portlet/1.0"
	exclude-result-prefixes="xsl admin bebop portal portlet"
	version="1.0">


  
  <xsl:template match="portlet:applicationDirectory">
    <xsl:for-each select="portlet:applicationDirectoryEntry">
        <xsl:apply-templates select="."/>
		</xsl:for-each>
  </xsl:template>

  <xsl:template match="portlet:applicationDirectoryEntry">
    <div>
      <a href="{@url}">
        <xsl:value-of select="@title"/>
      </a>
      <xsl:value-of select="@description"/>
    </div>
  </xsl:template>


</xsl:stylesheet>
