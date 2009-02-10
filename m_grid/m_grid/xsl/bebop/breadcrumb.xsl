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

	<xsl:template name="breadcrumb">
		<xsl:apply-templates select="nav:categoryPath" />
	</xsl:template>

	<xsl:template match="nav:categoryPath">
		<div id="breadcrumb">
			<p>
				<em>You are here:</em> 
				<xsl:for-each select="nav:category">
					<xsl:choose>
						<xsl:when test="position() = 1"><a href="{//bebop:page/ui:userBanner/@workspaceURL}"><abbr title="Middlesbrough Grid for Learning">MGrid</abbr></a>&#160;&gt; </xsl:when>
						<xsl:when test="(position() = last()) and /bebop:page/@id='defaultItemPage'"><xsl:value-of select="translate(@title, ' ', '&#160;')" /></xsl:when>
						<xsl:otherwise><a href="{@url}"><xsl:value-of select="translate(@title, ' ', '&#160;')" /></a>&#160;&gt; </xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
				<xsl:if test="/bebop:page/@id='itemPage'">
					<xsl:value-of select="translate(/bebop:page/cms:contentPanel/cms:item/title, ' ', '&#160;')" />
				</xsl:if>
			</p>
		</div>
	</xsl:template>
	
</xsl:stylesheet>