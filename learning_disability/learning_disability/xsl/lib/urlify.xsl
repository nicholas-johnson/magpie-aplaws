<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet 
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		exclude-result-prefixes="xsl"
		version="1.0">
		
	<xsl:template name="urlify">
		<xsl:param name="string" />
		<xsl:variable name="apostrophe">ABCDEFGHIJKLMNOPQRSTUVWXYZ ,'</xsl:variable>
		<xsl:variable name="no_apostrophe">abcdefghijklmnopqrstuvwxyz-'</xsl:variable>
		<xsl:value-of select='translate($string, $apostrophe, $no_apostrophe)'/>
	</xsl:template>
		
</xsl:stylesheet>