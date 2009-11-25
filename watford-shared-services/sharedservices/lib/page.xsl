<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:bebop="http://www.arsdigita.com/bebop/1.0"
  xmlns:aplaws="http://www.arsdigita.com/aplaws/1.0"
  xmlns:ui="http://www.arsdigita.com/ui/1.0"
  version="1.0">

  <xsl:import href="head.xsl"/>
  <xsl:import href="body.xsl"/>
  <xsl:import href="../../../../../ROOT/packages/bebop/xsl/dcp.xsl"/>

  <xsl:output method="html"/>


  <xsl:template match="bebop:page[@class='simplePage']">
    <html>
      <head>
        <title><xsl:call-template name="aplaws:pageTitle"/></title>
        <xsl:call-template name="aplaws:headerMetaData"/>
        <xsl:call-template name="aplaws:headerStyleSheets"/>
      </head>
      
      <body style="margin: 0em">
        <xsl:call-template name="bebop:dcpJavascript"/>
        <xsl:call-template name="aplaws:bodyHeader"/>
        <xsl:call-template name="aplaws:bodyBreadcrumb"/>
        <xsl:call-template name="aplaws:bodyContent"/>
        <xsl:call-template name="aplaws:bodyFooter"/>
        <xsl:call-template name="aplaws:bodyDebug"/>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
