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
        <xsl:call-template name="cssNavigation" />
        <xsl:call-template name="javascript" />
      </head>
      <body>
        <div id="wrapper">
          <xsl:call-template name="accessLinks" />
          <xsl:call-template name="pageHeader" />
          <xsl:call-template name="topLinks" />
          <xsl:call-template name="navigationContent" />
          <div class="clear">&#160;</div>
          <xsl:call-template name="pageFooter" />
        </div>
      </body>
    </html>
  </xsl:template>
  
  <xsl:template name="navigationContent">
    <div class="top_row">
      <a name="content" class="access">&#160;</a>
      <div class="main">
        <div class="content_wrapper">
          <div class="content">
            <xsl:if test="//nav:greetingItem//imageAttachments[useContext='title']">
              <h1>
                <img src="{$dispatcher-prefix}/cms-service/stream/image/?image_id={//nav:greetingItem//imageAttachments[useContext='title']//id}" alt="{//nav:greetingItem//imageAttachments[useContext='title']//description}" />
              </h1>
            </xsl:if>
            <xsl:value-of select="//nav:greetingItem//textAsset/content" disable-output-escaping="yes" />
          </div>
        </div>
      </div>
      <div class="links">
        <div class="content_wrapper">
          <div class="content">
            <form id="search">
              <fieldset>
                <input type="text" class="search" value="search" />
                <input type="submit" class="submit" value="search" />
              </fieldset>
            </form>
            <h2><img src="{$theme-prefix}/images/titles/useful_links.png" alt="Useful Links" /></h2>
            <ul>
              <xsl:for-each select="//nav:greetingItem//links">
                <li>
                  <xsl:if test="targetType='internalLink'">
                    <xsl:variable name="uri">/redirect/?oid=<xsl:call-template name="url-encode"><xsl:with-param name="str" select="targetItem/@oid" /></xsl:call-template></xsl:variable>
                    <xsl:variable name="text"><xsl:value-of select="linkTitle" /></xsl:variable>
                    <xsl:variable name="title"><xsl:value-of select="linkDescription" /></xsl:variable>
                    <a href="{$uri}" title="{$title}">
                      <xsl:value-of select="$text" />
                    </a>
                  </xsl:if>
                  <xsl:if test="targetType='externalLink'">
                    <xsl:variable name="uri"><xsl:value-of select="targetURI"/></xsl:variable>
                    <xsl:variable name="text"><xsl:value-of select="linkTitle" /></xsl:variable>
                    <xsl:variable name="title">Go to external website - <xsl:value-of select="linkDescription" /></xsl:variable>
                    <xsl:variable name="newPage">true</xsl:variable>
                    <a href="{$uri}" title="{$title}">
                      <xsl:value-of select="$text" />
                    </a>
                  </xsl:if>
                </li>
              </xsl:for-each>
            </ul>
          </div>
        </div>
      </div>
      <div class="clear">&#160;</div>
    </div>
    <xsl:if test="//nav:greetingItem//imageAttachments[useContext='items']">
      <div class="middle_row">
        <img src="{$dispatcher-prefix}/cms-service/stream/image/?image_id={//nav:greetingItem//imageAttachments[useContext='items']//id}" alt="{//nav:greetingItem//imageAttachments[useContext='items']//description}" />
      </div>
    </xsl:if>
    
      
    
    
    <div class="bottom_row">
      <div class="accordian_1">
        
      </div>
      <div class="accordian_2">
        
      </div>
    </div>
  </xsl:template>
  
  <xsl:template name="cssNavigation">
    <link rel="stylesheet" href="{$theme-prefix}/stylesheets/navigation_page.css" type="text/css" />
  </xsl:template>
  
</xsl:stylesheet>
