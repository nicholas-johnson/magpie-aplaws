<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:aplaws="http://www.arsdigita.com/aplaws/1.0"
  version="1.0">

  <xsl:import href="../../../../ROOT/__ccm__/apps/navigation/xsl/admin.xsl"/>
  <xsl:import href="lib/page.xsl"/>

  <xsl:param name="theme-prefix" />

  <xsl:template name="aplaws:headerStyleSheets">
    <link rel="stylesheet" href="{$theme-prefix}/navigation-admin.css" type="text/css" media="screen"/>
  </xsl:template>

</xsl:stylesheet>
