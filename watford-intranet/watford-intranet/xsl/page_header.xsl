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
    
  <xsl:template name="pageHeader">
    <div id="header">
      <h1>
        <a href="{$dispatcher-prefix}"> 
          Staff Intranet
        </a>
      </h1>
      <div class="strap">
        <a href="http://www.watford.gov.uk">Watford Borough Council</a>
      </div>
    </div>
  </xsl:template>
  
</xsl:stylesheet>