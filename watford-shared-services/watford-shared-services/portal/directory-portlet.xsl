<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:admin="http://www.arsdigita.com/admin-ui/1.0"
  xmlns:bebop="http://www.arsdigita.com/bebop/1.0"
  xmlns:portal="http://www.uk.arsdigita.com/portal/1.0"
  xmlns:portlet="http://www.uk.arsdigita.com/portlet/1.0"
	exclude-result-prefixes="xsl admin bebop portal portlet"
	version="1.0">


<xsl:template match="portlet:contentDirectory">
  <div id="dirBox">
	<h2><xsl:value-of select="../@title"/></h2>
	<xsl:apply-templates />
	</div>
</xsl:template>




<xsl:template match="portlet:contentDirectoryEntry" >
    <div class="dirCat">
      <div class="directoryEntry"><a class="directoryEntryLink" href="{@url}"><xsl:value-of select="@name" /></a></div>
      <xsl:for-each select="portlet:contentDirectorySubentry">
            <a class="directorySubentryLink" href="{@url}"><xsl:value-of select="@name" /></a>
            <xsl:if test="not(position() = last())">
              |
            </xsl:if>
      </xsl:for-each>
   </div>
  </xsl:template>






 
</xsl:stylesheet>
