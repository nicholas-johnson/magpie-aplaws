<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:bebop="http://www.arsdigita.com/bebop/1.0"
  xmlns:aplaws="http://www.arsdigita.com/aplaws/1.0"
  xmlns:ui="http://www.arsdigita.com/ui/1.0"
  xmlns:cms="http://www.arsdigita.com/cms/1.0"
  xmlns:nav="http://ccm.redhat.com/london/navigation"
  exclude-result-prefixes="xsl bebop aplaws ui cms nav"
  version="1.0">

  
	


<xsl:template name="cssStyles">
<link rel="stylesheet" href="{$theme-prefix}/css/main.css" type="text/css" media="all"/>
<link rel="stylesheet" href="{$theme-prefix}/css/wysiwyg.css" type="text/css" media="all"/>
</xsl:template>


  




</xsl:stylesheet>
