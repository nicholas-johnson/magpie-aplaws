<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:bebop="http://www.arsdigita.com/bebop/1.0"
    xmlns:aplaws="http://www.arsdigita.com/aplaws/1.0"
    xmlns:ui="http://www.arsdigita.com/ui/1.0"
    xmlns:cms="http://www.arsdigita.com/cms/1.0"
    xmlns:nav="http://ccm.redhat.com/london/navigation"
    xmlns:formbuilder="http://www.arsdigita.com/formbuilder/1.0"
    exclude-result-prefixes="xsl bebop aplaws ui cms nav formbuilder">

  <!-- Category Navigation Lists - Full navigation, just outputs the full --> 
  <!-- category menu as found in the xsl. nj20050210 -->
  
  <xsl:template match="//cms:item/auditing">
  </xsl:template>
  
  <xsl:template match="//cms:item/masterVersion">
  </xsl:template>
  
  <xsl:template match="//cms:item//formbuilder:formInfo">
  </xsl:template>
  
</xsl:stylesheet>
