<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:bebop="http://www.arsdigita.com/bebop/1.0"
  xmlns:cms="http://www.arsdigita.com/cms/1.0"
  xmlns:ui="http://www.arsdigita.com/ui/1.0"
  xmlns:aplaws="http://www.arsdigita.com/aplaws/1.0"
  version="1.0" exclude-result-prefixes="bebop cms ui aplaws xsl">

  <xsl:import href="../../../../ROOT/__ccm__/apps/content-section/xsl/admin.xsl"/>
  <xsl:import href="../../../../ROOT/packages/bebop/xsl/dcp.xsl"/>

  <xsl:import href="../../../../ROOT/__ccm__/themes/aplaws/category-step.xsl"/>
  
  <xsl:param name="theme-prefix" />

  <xsl:variable name="here"><xsl:value-of select="$static-prefix"/>/cms/admin/page</xsl:variable>

  <xsl:template name="cat-widget-cat-name">
    <xsl:value-of select="@name"/>

    <xsl:if test="@pid and @domain='LGSL'">
        (<xsl:value-of select="@pid"/>)
    </xsl:if>
  </xsl:template>


  <xsl:template match="bebop:page[@class = 'cms-admin']">
    <html xmlns:deditor="http://www.arsdigita.com/deditor/1.0">
      <head>
        <title><xsl:value-of select="bebop:title"/></title>
        <link rel="stylesheet" type="text/css" href="{$legacy-asset-prefix}/css/acs-master.css"/>
        <link rel="stylesheet" type="text/css" href="{$static-prefix}/cms/admin/cms-admin.css"/>
      </head>
      <body>
        <xsl:call-template name="bebop:dcpJavascript"/>
        <table id="global-header">
          <tr>
            <td id="logo"><img src="{$theme-prefix}/images/aplaws-logo-small.png" height="30" width="30"/></td>
            <td id="context"><xsl:apply-templates select="bebop:contextBar"/></td>
            <td style="margin: 0; color: #3f3f3f; border: 0; padding: 0; padding-right: 18px;">Welcome <strong><xsl:value-of select="@name" /></strong></td>
            <td>
              <table id="global-links">
                <tr>
                  <td class="global-link-icon"><a href="{cms:globalNavigation/cms:workspace/@href}"><img src="{$here}/home.png" height="18" width="18"/></a></td>
                  <td class="global-link"><a href="{cms:globalNavigation/cms:workspace/@href}">Home</a></td>

                  <td class="global-link-icon"><a href="{cms:globalNavigation/cms:signOut/@href}"><img src="{$here}//lock.png" height="18" width="14"/></a></td>
                  <td class="global-link"><a href="{cms:globalNavigation/cms:signOut/@href}">Logout</a></td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
        <div id="page-title"><xsl:value-of select="bebop:title"/></div>
        <xsl:if test="bebop:link[@id = 'preview_link']">
          <xsl:choose>
            <xsl:when test="bebop:link[@target]">
              <div style="float: right; margin-right: 12px"><a target="{bebop:link/@target}" href="{bebop:link[@id = 'preview_link']/@href}"><xsl:value-of select="bebop:link[@id = 'preview_link']/bebop:label"/></a></div>
            </xsl:when>
            <xsl:otherwise>
              <div style="float: right; margin-right: 12px"><a href="{bebop:link[@id = 'preview_link']/@href}"><xsl:value-of select="bebop:link[@id = 'preview_link']/bebop:label"/></a></div>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:if>
        <div><xsl:apply-templates select="*[@id = 'page-body']"/></div>
        <xsl:choose>
          <xsl:when test="bebop:structure">
            <div><xsl:apply-templates select="bebop:structure"/></div>
          </xsl:when>
          <xsl:when test="ui:debugPanel">
            <div><xsl:apply-templates select="ui:debugPanel"/></div>            
          </xsl:when>
        </xsl:choose>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
