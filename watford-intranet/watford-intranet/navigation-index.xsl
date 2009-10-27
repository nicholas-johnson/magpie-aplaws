<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:bebop="http://www.arsdigita.com/bebop/1.0"
    xmlns:aplaws="http://www.arsdigita.com/aplaws/1.0"
    xmlns:ui="http://www.arsdigita.com/ui/1.0"
    xmlns:cms="http://www.arsdigita.com/cms/1.0"
    xmlns:nav="http://ccm.redhat.com/london/navigation"
    exclude-result-prefixes="xsl bebop aplaws ui cms nav"
    version="1.0">
  
  <xsl:import href="../../../../ROOT/__ccm__/apps/workspace/xsl/index.xsl"/>
  <xsl:import href="content-section-index.xsl"/>

  
  
    <!-- Primary APLAWS+ stylesheet for 'content items' (Articles, News items etc) -->
  
  <!-- Standard APLAWS+ imports -->
  <!-- Leave the standard imports so that we retain any functionality 
  that we do not specifically override TJB-RC-20040608 -->
  <xsl:import href="../../../../ROOT/__ccm__/themes/aplaws/lib/header.xsl"/>
  <xsl:import href="../../../../ROOT/__ccm__/themes/aplaws/lib/lib.xsl"/>
  <xsl:import href="../../../../ROOT/__ccm__/themes/aplaws/lib/leftNav.xsl"/>
  <xsl:import href="../../../../ROOT/__ccm__/themes/aplaws/types/ContentTypes.xsl"/>

  <!-- Runtime Collective Core stylesheets, 
    placed after Standard imports to override the default behaviors -->
  <!-- First stylesheets specific to the content pages -->
  <xsl:import href="../../../../ROOT/__ccm__/themes/rc-core/xsl/cms/item.xsl" />
  <xsl:import href="../../../../ROOT/__ccm__/themes/rc-core/xsl/cms/articleSectionPanel.xsl" />
  <xsl:import href="../../../../ROOT/__ccm__/themes/rc-core/xsl/nav/greetingItem.xsl" />
  <xsl:import href="../../../../ROOT/__ccm__/themes/rc-core/xsl/nav/simpleObjectList.xsl"/>
  <xsl:import href="../../../../ROOT/__ccm__/themes/rc-core/xsl/nav/categoryMenu.xsl"/>
  <xsl:import href="../../../../ROOT/__ccm__/themes/rc-core/xsl/cms/articleSectionPanel.xsl"/>
  <!-- then stylesheets that are needed on all RC pages -->
  <xsl:import href="../../../../ROOT/__ccm__/themes/rc-core/xsl/coreIncludes.xsl" />

  <!-- now override the defaults with theme specific includes -->
  <xsl:import href="xsl/themeIncludes.xsl"/>
  
  <xsl:param name="context-prefix" />
  <xsl:param name="dispatcher-prefix" />
  <xsl:param name="theme-prefix" />
  <xsl:variable name="textOnly" select="contains(/bebop:page/@url, 'textonly=yes')" />
  
  <!-- Output HTML with correct DOCTYPE including system identifier URI 
  So as not to trigger 'Quirks mode' in modern browsers TJB-RC-20040608 -->
  <xsl:output method="xml" indent="yes"
      doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
      doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
      omit-xml-declaration="yes"/>
  
  <!-- Displays a navigation page -->
  <xsl:template name="page" match="bebop:page[@class='simplePage' and @application='navigation']">
    <html lang="en">
      <head>
        <title><xsl:call-template name="councilName" /><xsl:call-template name="htmlTitleBuilder" /></title>
        <xsl:call-template name="metaData"/>
        <xsl:call-template name="css" />
        <xsl:call-template name="navigation_css" />
        <xsl:call-template name="javascript" />
      </head>
      <body>
        <div id="wrapper">
          <xsl:call-template name="accessLinks" />
          <xsl:call-template name="pageHeader" />
          <xsl:call-template name="topLinks" />
          <xsl:call-template name="navigationBreadcrumb" />
          <xsl:call-template name="navigationContent" />
          <xsl:call-template name="pageFooter" />
        </div>
      </body>
    </html>
  </xsl:template>
  
  <xsl:template name="navigationContent">
    <div id="left_col">
      <a name="nav" class="access">&#160;</a>
      <xsl:apply-templates select="/bebop:page/nav:categoryMenu" />
    </div>
    <div>
      <xsl:choose>
        <xsl:when test="(count(nav:greetingItem/cms:item/links) > 0) or (count(/bebop:page/nav:relatedItems/nav:relatedItem) > 0) or (count(nav:greetingItem/cms:item/fileAttachments) > 0)">
          <xsl:attribute name="id">main_col</xsl:attribute>
        </xsl:when>
        <xsl:otherwise>
          <xsl:attribute name="id">wide_main_col</xsl:attribute>
        </xsl:otherwise>
      </xsl:choose>
      <div class="content">
        <a name="content" class="access">&#160;</a>
        <h2>
          <xsl:value-of select="//nav:categoryPath/nav:category[last()]/@title" />
        </h2>
        <xsl:apply-templates select="nav:greetingItem" />
        <xsl:apply-templates select="nav:simpleObjectList" mode="alphabetical" />
      </div>
    </div>
    
    <xsl:if test="(count(nav:greetingItem/cms:item/links) > 0) or (count(/bebop:page/nav:relatedItems/nav:relatedItem) > 0) or (count(nav:greetingItem/cms:item/fileAttachments) > 0)">
      <div id="right_col">
        <xsl:call-template name="links">
          <xsl:with-param name="item" select="nav:greetingItem/cms:item"/>
        </xsl:call-template>
      </div>
    </xsl:if>
  </xsl:template>
  
  <xsl:template name="navigation_css">
    <link rel="stylesheet" href="{$theme-prefix}/stylesheets/content_page.css" type="text/css" />
  </xsl:template>
  
  <xsl:template name="navigationBreadcrumb">
    <xsl:apply-templates select="nav:categoryPath" />
  </xsl:template>
  
</xsl:stylesheet>
