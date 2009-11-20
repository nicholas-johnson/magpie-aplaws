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
      <xsl:call-template name="search_form" />
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
        <xsl:if test="nav:greetingItem/nav:objectList/nav:paginator/@pageCount &gt; 1">
          <div class="paginator">
          Page: 
          <xsl:call-template name="simplePaginator">
            <xsl:with-param name="pageCount" select="nav:objectList/nav:paginator/@pageCount" />
            <xsl:with-param name="pageNumber" select="nav:objectList/nav:paginator/@pageNumber" />
            <xsl:with-param name="counter" select="0" />
          </xsl:call-template>
          </div>
        </xsl:if>
        <xsl:if test="nav:simpleObjectList/nav:objectList/nav:item">
        
          <xsl:variable name="sorted_items">
              <xsl:for-each select="nav:simpleObjectList/nav:objectList/nav:item">
                <xsl:sort select="nav:attribute[@name='newsDate']/@year" data-type="number" order="descending" />
                <xsl:sort select="nav:attribute[@name='newsDate']/@month" data-type="number" order="descending" />
                <xsl:copy-of select="."/>
             </xsl:for-each>
          </xsl:variable>
          <ul class="nav_list">
            <xsl:for-each select="$sorted_items">
              <xsl:for-each select="nav:item">
                <xsl:variable name="title" select="nav:attribute[@name='title']" />
                <xsl:variable name="year" select="nav:attribute[@name='newsDate']/@year" />
                <xsl:variable name="month" select="nav:attribute[@name='newsDate']/@month" />
                <xsl:variable name="preceeding_year" select="preceding-sibling::nav:item[1]/nav:attribute[@name='newsDate']/@year" />
                <xsl:variable name="preceeding_month" select="preceding-sibling::nav:item[1]/nav:attribute[@name='newsDate']/@month" />
                <xsl:variable name="preceeding_title" select="preceding-sibling::nav:item[1]/nav:attribute[@name='title']" />
                <xsl:if test="$year != $preceeding_year or $month != $preceeding_month or count(preceding-sibling::nav:item) = 0">
                  <li class="title">
                    <h3>
                      <xsl:choose>
                        <xsl:when test="$month = 1">
                          January
                        </xsl:when>
                        <xsl:when test="$month = 2">
                          February
                        </xsl:when>
                        <xsl:when test="$month = 3">
                          March
                        </xsl:when>
                        <xsl:when test="$month = 4">
                          April
                        </xsl:when>
                        <xsl:when test="$month = 5">
                          May
                        </xsl:when>
                        <xsl:when test="$month = 6">
                          June
                        </xsl:when>
                        <xsl:when test="$month = 7">
                          July
                        </xsl:when>
                        <xsl:when test="$month = 8">
                          August
                        </xsl:when>
                        <xsl:when test="$month = 9">
                          September
                        </xsl:when>
                        <xsl:when test="$month = 10">
                          October
                        </xsl:when>
                        <xsl:when test="$month = 11">
                          November
                        </xsl:when>
                        <xsl:when test="$month = 12">
                          December
                        </xsl:when>
                      </xsl:choose>
                      <xsl:value-of select="$year" />
                    </h3>
                  </li>
                </xsl:if>
                <li>
                  <a href="{nav:path}"><xsl:value-of select="$title" /></a>
                </li>
              </xsl:for-each>
            </xsl:for-each>
          </ul>
        </xsl:if>

        <xsl:if test="nav:greetingItem/nav:objectList/nav:paginator/@pageCount &gt; 1">
          <div class="paginator">
          Page: 
          <xsl:call-template name="simplePaginator">
            <xsl:with-param name="pageCount" select="nav:objectList/nav:paginator/@pageCount" />
            <xsl:with-param name="pageNumber" select="nav:objectList/nav:paginator/@pageNumber" />
            <xsl:with-param name="counter" select="0" />
          </xsl:call-template>
          </div>
        </xsl:if>

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
    <link rel="stylesheet" href="{$theme-prefix}/stylesheets/navigation_page.css" type="text/css" />
  </xsl:template>
  
  <xsl:template name="navigationBreadcrumb">
    <xsl:apply-templates select="nav:categoryPath" />
  </xsl:template>
  
</xsl:stylesheet>
