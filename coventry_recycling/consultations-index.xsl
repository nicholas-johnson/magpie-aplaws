<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:bebop="http://www.arsdigita.com/bebop/1.0"
  xmlns:aplaws="http://www.arsdigita.com/aplaws/1.0"
  xmlns:ui="http://www.arsdigita.com/ui/1.0"
  xmlns:cms="http://www.arsdigita.com/cms/1.0"
  xmlns:nav="http://ccm.redhat.com/london/navigation"
  version="1.0">

  <xsl:import href="../../../../ROOT/__ccm__/themes/aplaws/navigation-index.xsl"/>
  
  <xsl:template name="pageContent">
    <a class="intLink" name="top" />
    <xsl:call-template name="greeting" />
    <xsl:call-template name="contentLinks" />
    <xsl:call-template name="dimensionalNavbars" />
    <xsl:call-template name="dataTables" />
    <xsl:call-template name="boxPanels1" />
    <xsl:call-template name="forms" />
    <xsl:call-template name="labels" />
  </xsl:template>

  <!-- Copied from ccm-core/web/packages/bebop/xsl/DataTable.xsl -->
  <xsl:template name="dataTables">
    <xsl:for-each select="bebop:table[@class='dataTable']">
      <table cellpadding="1" cellspacing="2" border="0">
        <xsl:for-each select="thead|bebop:thead"> 
          <xsl:call-template name="dataTableHead">
            <xsl:with-param name="orderColumn" select="../@order"/>
            <xsl:with-param name="direction" select="../@direction"/> 
          </xsl:call-template>
        </xsl:for-each>
        <xsl:for-each select="bebop:tbody">
          <xsl:call-template name="dataTableBody"/>
        </xsl:for-each>
      </table>
    </xsl:for-each>
  </xsl:template>

  <!-- Copied from ccm-core/web/packages/bebop/xsl/BoxPanel.xsl -->
  <xsl:template name="boxPanels1">
    <xsl:for-each select="bebop:boxPanel[@axis='1']">
      <table>
        <xsl:if test="string-length(@width)>0">
          <xsl:attribute name="width">
            <xsl:value-of select="@width"/>
          </xsl:attribute>
        </xsl:if>
        <xsl:if test="string-length(@border)>0">
          <xsl:attribute name="border">
            <xsl:value-of select="@border"/>
          </xsl:attribute>
        </xsl:if>
        <tr>
          <xsl:for-each select="bebop:cell">
            <td>
              <xsl:for-each select="*/@class|*/@style">
                <xsl:attribute name="{name()}">
                  <xsl:value-of select="." />
                </xsl:attribute>
              </xsl:for-each>
              <xsl:apply-templates/>
            </td>
          </xsl:for-each>
        </tr>
      </table>  
    </xsl:for-each>
  </xsl:template>

  <!-- Copied from ccm-core/web/packages/bebop/xsl/DimensionalNavbar.xsl -->
  <xsl:template name="dimensionalNavbars">
    <xsl:for-each select="bebop:dimensionalNavbar">
      <xsl:comment>bebop:dimensionalNavbar</xsl:comment>
      <xsl:value-of select="@startTag"/>
      <xsl:for-each select="*">
        <xsl:apply-templates select="."/>
        <xsl:if test="position()!=last()">
          <xsl:choose>
            <xsl:when test="string-length(../@delimiter)=0">
              &#160;&gt;&#160;
            </xsl:when>
            <xsl:otherwise><xsl:value-of select="../@delimiter"/></xsl:otherwise>
          </xsl:choose>
        </xsl:if>
      </xsl:for-each>
      <xsl:value-of select="@endTag"/>
      <xsl:comment>/bebop:dimensionalNavbar</xsl:comment>
    </xsl:for-each>
  </xsl:template>

  <!-- Copied from ccm-core/web/packages/bebop/xsl/Form.xsl -->
  <xsl:template name="forms">
    <xsl:for-each select="bebop:form">
      <xsl:value-of select="@message"/>
      <form>
        <xsl:for-each select="@*[not(self::method)]">
          <xsl:attribute name="{name()}">
            <xsl:value-of select="."/>
          </xsl:attribute>
          <xsl:attribute name="method">
            <xsl:choose> 
              <xsl:when test="string-length(../@method)=0">post</xsl:when>
              <xsl:otherwise><xsl:value-of select="../@method"/></xsl:otherwise>
            </xsl:choose> 
          </xsl:attribute>
        </xsl:for-each>
        <xsl:apply-templates />
      </form>
    </xsl:for-each>
  </xsl:template>

  <!-- Copied from ccm-core/web/packages/bebop/xsl/Label.xsl -->
  <xsl:template name="labels">
    <xsl:for-each select="bebop:label">
      <xsl:call-template name="bebop-label-text">
         <xsl:with-param name="text" select="text()"/>
         <xsl:with-param name="escape" select="@escape"/>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:template>

  <xsl:output method="html"/>
</xsl:stylesheet>
