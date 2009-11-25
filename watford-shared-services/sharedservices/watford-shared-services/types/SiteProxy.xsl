<!DOCTYPE stylesheet [
<!ENTITY nbsp   "&#160;" ><!-- no-break space = non-breaking space, U+00A0 ISOnum -->
]>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:bebop="http://www.arsdigita.com/bebop/1.0"
                xmlns:cms="http://www.arsdigita.com/cms/1.0"
                xmlns:ui="http://www.arsdigita.com/ui/1.0"
                xmlns:nav="http://ccm.redhat.com/london/navigation"
                exclude-result-prefixes="xsl bebop cms ui"
                version="1.0">
  
  <xsl:template name="CT_SiteProxy_graphics">    

    <!-- as an item, or as an index item on a category page -->
    <xsl:value-of select="../../cms:contentPanel/cms:siteProxyPanel" disable-output-escaping="yes" />
    <xsl:value-of select="../../nav:greetingItemExtraXML/cms:siteProxyPanel" disable-output-escaping="yes" />

  </xsl:template>
  
</xsl:stylesheet>