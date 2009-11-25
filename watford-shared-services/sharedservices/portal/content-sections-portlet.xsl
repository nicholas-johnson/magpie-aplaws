<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:admin="http://www.arsdigita.com/admin-ui/1.0"
  xmlns:bebop="http://www.arsdigita.com/bebop/1.0"
  xmlns:portal="http://www.uk.arsdigita.com/portal/1.0"
  xmlns:portlet="http://www.uk.arsdigita.com/portlet/1.0"
	exclude-result-prefixes="xsl admin bebop portal portlet"
	version="1.0">

  <xsl:param name="context-prefix"/>

<xsl:template match="portlet:contentSection">
  <div>
    <a href="{@url}index">
      <xsl:value-of select="@name"/>
    </a>
  </div>
  <div>
    <a href="{@url}admin/index.jsp">
      <img border="0" width="11" height="11" alt="admin" src="{$context-prefix}/assets/arrow-box.gif"/>
    </a>
    <a href="{@url}admin/index.jsp" class="action_link">admin</a>
  </div>
</xsl:template>

<xsl:template match="portlet:contentSections">
  <xsl:for-each select="portlet:contentSection">
      <div>
        <xsl:attribute name="class">
          <xsl:choose>
            <xsl:when test="position() mod 2">table_row_odd</xsl:when>
            <xsl:otherwise>table_row_even</xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>
        <xsl:apply-templates select="."/>
      </div>
    </xsl:for-each>
</xsl:template>

</xsl:stylesheet>
