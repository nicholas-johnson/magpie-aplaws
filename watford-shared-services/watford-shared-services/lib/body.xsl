<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:bebop="http://www.arsdigita.com/bebop/1.0"
  xmlns:aplaws="http://www.arsdigita.com/aplaws/1.0"
  xmlns:ui="http://www.arsdigita.com/ui/1.0"
  version="1.0">

  <!--
    This file contains templates relating to
    generating <body> tags in HTML.
  -->

  <xsl:import href="user-banner.xsl"/>

  <xsl:template name="aplaws:bodyHeader">
    <div class="bodyHeader">
      <xsl:apply-templates select="ui:userBanner"/>
    </div>
  </xsl:template>

  <xsl:template name="aplaws:bodyBreadcrumb">
    <div class="bodyBreadcrumb">
      <a href="/">APLAWS</a>&gt;<xsl:call-template name="aplaws:pageTitle"/>
    </div>
  </xsl:template>

  <xsl:template name="aplaws:bodyContent">
    <h1><xsl:call-template name="aplaws:pageTitle"/></h1>
    <div class="bodyContent">
      <xsl:apply-templates select="*[not(@metadata.tag)]"/>
    </div>
  </xsl:template>

  <xsl:template name="aplaws:bodyFooter">
    <div class="bodyFooter">
      <xsl:apply-templates select="ui:siteBanner"/>
    </div>
  </xsl:template>

  <xsl:template name="aplaws:bodyDebug">
    <div class="bodyDebug">
      <xsl:apply-templates select="ui:debugPanel"/>
      <xsl:apply-templates select="bebop:structure"/>
    </div>
  </xsl:template>

</xsl:stylesheet>
