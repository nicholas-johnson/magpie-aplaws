<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:bebop="http://www.arsdigita.com/bebop/1.0"
		xmlns:portal="http://www.uk.arsdigita.com/portal/1.0"
		xmlns:ui="http://www.arsdigita.com/ui/1.0"
		xmlns:atoz="http://xmlns.redhat.com/atoz/1.0"
		xmlns:nav="http://ccm.redhat.com/london/navigation"
		xmlns:cms="http://www.arsdigita.com/cms/1.0"
		exclude-result-prefixes="xsl bebop portal atoz nav cms ui">
	
	
	<xsl:template name="javascript">
		<script src="{$theme-prefix}/javascripts/jquery-1.3.2.min.js" type="text/jvascript">&#160;</script>
		<script src="{$theme-prefix}/javascripts/search.js" type="text/jvascript">&#160;</script>
	</xsl:template>
	
</xsl:stylesheet>
