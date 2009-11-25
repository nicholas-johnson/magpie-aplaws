<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:ui="http://www.arsdigita.com/ui/1.0"
    xmlns:bebop="http://www.arsdigita.com/bebop/1.0"
    xmlns:portal="http://www.uk.arsdigita.com/portal/1.0"
    xmlns:cms="http://www.arsdigita.com/cms/1.0"
    xmlns:nav="http://ccm.redhat.com/london/navigation"
    xmlns:atoz="http://xmlns.redhat.com/atoz/1.0"
    xmlns:terms="http://xmlns.redhat.com/london/terms/1.0"
    exclude-result-prefixes="xsl ui bebop portal cms nav atoz terms">

  <xsl:template name="accessLinks">
    <div id="access_links">
      <ul>
         <li><a href="#content" accesskey="s" title="Skip content: access key S">Skip to Content</a></li>
         <li><a href="#nav" accesskey="n" title="Skip navigation: access key N">Skip to Navigation</a></li>
         <li><a href="{$dispatcher-prefix}/portal/" accesskey="1" title="Intranet homepage, access key: 1">Home page</a></li>
         <li><a href="{$dispatcher-prefix}/search/" accesskey="4" title="Search, access key: 4">Search</a></li>
      </ul>
    </div>
  </xsl:template>

</xsl:stylesheet>
