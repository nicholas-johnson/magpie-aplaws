<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:aplaws="http://www.arsdigita.com/aplaws/1.0"
  xmlns:terms="http://xmlns.redhat.com/london/terms/1.0"
  version="1.0">

  <xsl:import href="../../../../ROOT/__ccm__/apps/navigation/xsl/index.xsl"/>
  
  
  <xsl:import href="content-section-index.xsl"/>
  
  <xsl:template name="pageContent">
    <xsl:apply-templates select="terms:termItemCountSummary"/>
  </xsl:template>

  <xsl:template match="terms:termItemCountSummary">
    <table>
      <tr>
        <th>PID</th>
        <th>Term</th>
        <th># items</th>
      </tr>
      <xsl:for-each select="terms:term">
        <xsl:sort data-type="number" select="@id"/>
        <tr>
          <td><xsl:value-of select="@id"/></td>
          <td><a href="pid.jsp?pid={@id}"><xsl:value-of select="@name"/></a></td>
          <td><xsl:value-of select="@count"/></td>
        </tr>
      </xsl:for-each>
    </table>
  </xsl:template>

</xsl:stylesheet>
