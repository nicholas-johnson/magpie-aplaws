<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:bebop="http://www.arsdigita.com/bebop/1.0"
    xmlns:aplaws="http://www.arsdigita.com/aplaws/1.0"
    xmlns:ui="http://www.arsdigita.com/ui/1.0"
    xmlns:cms="http://www.arsdigita.com/cms/1.0"
    xmlns:nav="http://ccm.redhat.com/london/navigation"
    xmlns:search="http://rhea.redhat.com/search/1.0"
    xmlns:atoz="http://xmlns.redhat.com/atoz/1.0"
    exclude-result-prefixes="xsl bebop aplaws ui cms nav search atoz"
    version="1.0">

  <!-- Primary Stylesheet for APLAWS+ A to Z page -->
  
  <!-- Standard APLAWS+ imports -->
  <!-- We leave the standard imports so that we retain any 
  functionality that we do not specifically override 
  TJB-RC-20040705 -->
  <xsl:import href="../../../../ROOT/__ccm__/apps/content-section/xsl/index.xsl"/>
  <xsl:import href="../../../../ROOT/__ccm__/themes/aplaws/lib/header.xsl"/>
  <xsl:import href="../../../../ROOT/__ccm__/themes/aplaws/lib/lib.xsl"/>

  <!-- RC core stylesheets, placed after Standard imports to 
  override the default behaviors -->
  <!-- First stylesheets specific to the atoz page -->
  <xsl:import href="../../../../ROOT/__ccm__/themes/rc-core/xsl/atoz/atoz.xsl"/>
  <xsl:import href="../../../../ROOT/__ccm__/themes/rc-core/xsl/lib/creatorContactDetails.xsl"/>
  <xsl:import href="../../../../ROOT/__ccm__/themes/rc-core/xsl/lib/toTop.xsl"/>
  <xsl:import href="../../../../ROOT/__ccm__/themes/rc-core/xsl/nav/categoryMenu.xsl"/>
  <!-- then stylesheets that are needed on all RC pages -->
  <xsl:import href="../../../../ROOT/__ccm__/themes/rc-core/xsl/coreIncludes.xsl"/>

  <!-- now override the defaults with theme specific includes -->
  <xsl:import href="xsl/themeIncludes.xsl"/>

  
  <xsl:param name="context-prefix"></xsl:param>
  <xsl:param name="dispatcher-prefix" />
  <xsl:param name="theme-prefix" />
  <xsl:variable name="textOnly" select="contains(/bebop:page/@url, 'textonly=yes')" />
    
  <!-- Output HTML with correct DOCTYPE including system identifier URI 
  So as not to trigger 'Quirks mode' in modern browsers TJB-RC-20040608 -->
  <xsl:output method="xml" indent="yes"
      doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
      doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
      omit-xml-declaration="yes"/>
      
  <xsl:template match="bebop:page[@class='simplePage' and @application='atoz']">
    <html lang="en">
      <head>
        <title>
          <xsl:call-template name="councilName" /> - A to Z
        </title>
        <xsl:call-template name="metaData"/>
        <xsl:call-template name="css" />
        <xsl:call-template name="javascript" />
      </head>
      <body>
        <div id="wrapper">
          <xsl:call-template name="accessLinks" />
          <xsl:call-template name="pageHeader" />
          <xsl:call-template name="atozBreadcrumb" />
          <xsl:call-template name="atozContent" />
          <xsl:call-template name="pageFooter"/>
        </div>
      </body>
    </html>
  </xsl:template>

  <xsl:template name="atozBreadcrumb">
    <div id="breadcrumb">
      <a href="{$dispatcher-prefix}/portal/" title="Home">Home</a>
      <xsl:text disable-output-escaping="yes"> &gt; </xsl:text>
      A to Z
      <xsl:if test="//atoz:atoz/atoz:letter[@isSelected]">
        <xsl:text disable-output-escaping="yes"> &gt; </xsl:text>
        <xsl:value-of select="translate(//atoz:atoz/atoz:letter[@isSelected], 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')" />
      </xsl:if>
    </div>
  </xsl:template>

  <xsl:template name="atozContent">
    <div id="left_col">
      <a name="navigation" class="access">&#160;</a>
      <xsl:call-template name="atozNavigation" />
    </div>
    <div id="wide_main_col">
      <a name="content" class="access">&#160;</a>
      <xsl:call-template name="atozMain" />
    </div>    
  </xsl:template>
    
  <xsl:template name="atozMain">
    <div id="content">
      <div class="lead">
        <h2>Categories starting with the letter <xsl:value-of select="translate(//atoz:atoz/atoz:letter[@isSelected], 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')" /></h2>
      </div>
      <xsl:if test="//atoz:atoz/atoz:letter[@isSelected]">
        <div class="results">
          <ul>
            <xsl:for-each select="//atoz:atoz/atoz:provider/atoz:atomicEntry">
              <li>
                <a href="{@url}" title="{@description}">
                  <xsl:value-of select="@title" />
                </a>
                <xsl:if test="@description and @description != ''">
                  - <xsl:value-of select="@description" />
                </xsl:if>
              </li>
            </xsl:for-each>
          </ul>
        </div>
      </xsl:if>
    </div>
  </xsl:template>
  
  <xsl:template name="atozNavigation">
    <div id="navigation">
      <h2>Navigation</h2>
      <ul>
        <li class="home_link">
          <a href="{$dispatcher-prefix}/portal" title="go to homepage">Home</a>
        </li>
        <li>
          A to Z
        </li>
      </ul>
    </div>
  </xsl:template>

</xsl:stylesheet>
