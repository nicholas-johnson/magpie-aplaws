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

	<!-- Inline site template -->
	<xsl:template match="cms:item[objectType='com.arsdigita.cms.contenttypes.InlineSite']">
	  <br />
		<div class="inlineSite">
		<xsl:choose>
			<xsl:when test="contains(/bebop:page/@url, '?terms=')">
				<xsl:text disable-output-escaping="yes">&lt;iframe frameborder="0" name="content" width="100%" height="800" scrolling="auto" src="</xsl:text><xsl:value-of select="url" /><xsl:text disable-output-escaping="yes">search?term=</xsl:text><xsl:value-of select="substring-after(/bebop:page/@url, '?terms=')" /><xsl:text disable-output-escaping="yes">&amp;page=1"</xsl:text>
					<p>You are using a browser that cannot display inline frames.<br />The page you were meant to see is here: <a href="{url}" title="external link"><xsl:value-of select="url" /></a></p>
				<xsl:text disable-output-escaping="yes">&lt;/iframe&gt;</xsl:text>
			</xsl:when>
			
			<xsl:otherwise>
				<iframe>
					<xsl:attribute name="frameborder">0</xsl:attribute>
					<xsl:attribute name="name">content</xsl:attribute>
					<xsl:attribute name="width">100%</xsl:attribute>
					<xsl:attribute name="height">400</xsl:attribute>
					<xsl:attribute name="scrolling">auto</xsl:attribute>
					<xsl:attribute name="src">
						<xsl:value-of select="url" />
					</xsl:attribute>
					<xsl:attribute name="title"><xsl:value-of select="title" /></xsl:attribute>
					<p>You are using a browser that cannot display inline frames.<br />The page you were meant to see is here: <a href="{url}" title="external link"><xsl:value-of select="url" /></a></p>
				</iframe>
			</xsl:otherwise>
		</xsl:choose>
		</div>
	</xsl:template>
</xsl:stylesheet>