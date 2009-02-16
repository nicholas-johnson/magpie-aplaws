<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:bebop="http://www.arsdigita.com/bebop/1.0"
		xmlns:aplaws="http://www.arsdigita.com/aplaws/1.0"
		xmlns:ui="http://www.arsdigita.com/ui/1.0"
		xmlns:cms="http://www.arsdigita.com/cms/1.0"
		xmlns:nav="http://ccm.redhat.com/london/navigation"
		exclude-result-prefixes="xsl bebop aplaws ui cms nav">

	<!-- Category Navigation Lists - Full navigation, just outputs the full --> 
  <!-- category menu as found in the xsl. nj20050210 -->
	
	<xsl:template name="catNav" match="nav:categoryMenu">
		<ul>
			<xsl:apply-templates select="/bebop:page/nav:categoryMenu/nav:category/nav:category" />
		</ul>
	</xsl:template>
	
	<!-- descend into categories -->
	<xsl:template match="nav:category">
		<li>
			<xsl:if test="@url=/bebop:page/@url">
				<xsl:attribute name="class">selected</xsl:attribute>
			</xsl:if>
			<a href="{@url}">
				<xsl:value-of select="@title" />
			</a>
		</li>
		<xsl:if test="nav:category">
			<ul>
				<xsl:apply-templates select="nav:category" />
			</ul>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>
