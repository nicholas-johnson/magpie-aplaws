<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:aplaws="http://www.arsdigita.com/aplaws/1.0"
  version="1.0">

  <xsl:import href="../../../../ROOT/__ccm__/apps/workspace/xsl/admin.xsl"/>
  <xsl:import href="lib/page.xsl"/>

  <xsl:param name="theme-prefix" />
  <xsl:param name="context-prefix" />

  <xsl:template name="aplaws:headerStyleSheets">
    <link rel="stylesheet" href="{$context-prefix}/css/acs-master.css" type="text/css" media="screen"/>
  </xsl:template>

</xsl:stylesheet>
