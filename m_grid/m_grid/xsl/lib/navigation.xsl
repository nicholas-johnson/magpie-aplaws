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
	
	<xsl:template name="navLinks">
		<xsl:if test="//nav:simpleObjectList//nav:item">
			<h3><xsl:value-of select="/bebop:page/nav:categoryPath/nav:category[last()]/@title" /> Links</h3>
			<xsl:apply-templates select="//nav:simpleObjectList" mode="alphabetical" />
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="catNav" match="nav:categoryMenu">
		<xsl:if test="/bebop:page/nav:categoryMenu/nav:category/nav:category/nav:category">
			<h3>Navigation</h3>
			<ul>
				<xsl:apply-templates select="/bebop:page/nav:categoryMenu/nav:category/nav:category/nav:category">
					<xsl:sort select="@title" />
				</xsl:apply-templates>
			</ul>
		</xsl:if>
	</xsl:template>
	
	<!-- descend into categories -->
	<xsl:template match="nav:category">
		
			<!-- test to see if item is current category. If it is don't make it a link. 
			Also test to see if you are a child of the what's on category you are not 
			in the past or more than 12 months in the future -->
		<xsl:choose>
			<xsl:when test="@url=/bebop:page/@url">
				<li class="selected">
					<xsl:value-of select="@title" />
				</li>
			</xsl:when>
			<xsl:otherwise>
				<li>
					<xsl:if test="@isSelected='true'">
						<xsl:attribute name="class">up</xsl:attribute>
					</xsl:if>
					<a href="{@url}">
						<xsl:value-of select="@title" />
					</a>
				</li>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:if test="nav:category">
			<ul class="selected">
				<xsl:apply-templates select="nav:category" />
			</ul>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>
