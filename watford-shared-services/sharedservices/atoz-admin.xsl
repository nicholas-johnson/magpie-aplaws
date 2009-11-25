<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:aplaws="http://www.arsdigita.com/aplaws/1.0"
  version="1.0">

  <xsl:import href="../../../../ccm-ldn-atoz/__ccm__/apps/atoz/xsl/index.xsl"/>
  <xsl:import href="lib/page.xsl"/>

  <xsl:param name="theme-prefix"/>

  <xsl:template name="aplaws:headerStyleSheets">
    <link rel="stylesheet" href="{$theme-prefix}/atoz-index.css" type="text/css" media="screen"/>
  </xsl:template>

</xsl:stylesheet>
