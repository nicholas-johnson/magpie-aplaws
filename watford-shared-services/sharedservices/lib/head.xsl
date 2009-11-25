<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:bebop="http://www.arsdigita.com/bebop/1.0"
  xmlns:aplaws="http://www.arsdigita.com/aplaws/1.0"
  xmlns:ui="http://www.arsdigita.com/ui/1.0"
  version="1.0">

  <!--
     This file contains templates related
     to generating <head> tags in HTML
  -->

  <xsl:template name="aplaws:pageTitle">
    <xsl:value-of select="/bebop:page/bebop:title"/>
  </xsl:template>

  <xsl:template name="aplaws:headerMetaData">
    <meta name="title">
      <xsl:attribute name="content">
        <xsl:call-template name="aplaws:pageTitle"/>
      </xsl:attribute>
    </meta>
  </xsl:template>

  <xsl:template name="aplaws:headerStyleSheets">
    <link rel="stylesheet" href="/__ccm__/themes/aplaws/lib/page.css" type="text/css" media="screen"/>
  </xsl:template>

</xsl:stylesheet>
