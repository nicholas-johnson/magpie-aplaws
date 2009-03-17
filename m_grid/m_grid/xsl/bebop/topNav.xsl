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
		
	<!-- Why is this hardcoded? Answer- AToZ and Search Results Pages -->
	<xsl:template name="topNav">
		
		<!-- Adjust these to change the top nav -->
		<xsl:variable name="nav_item_1">Parents/Carers</xsl:variable>
		<xsl:variable name="nav_url_1">/navigation/business</xsl:variable>
		<xsl:variable name="nav_item_2">Learners</xsl:variable>
		<xsl:variable name="nav_url_2">/navigation/business</xsl:variable>
		<xsl:variable name="nav_item_3">School Staff</xsl:variable>
		<xsl:variable name="nav_url_3">/navigation/business</xsl:variable>
		<xsl:variable name="nav_item_4">CFL Staff</xsl:variable>
		<xsl:variable name="nav_url_4">/navigation/business</xsl:variable>
		<xsl:variable name="nav_item_5">Governers</xsl:variable>
		<xsl:variable name="nav_url_5">/navigation/business</xsl:variable>
		
		
		<ul id="nav">
			<li>
				<xsl:if test="/bebop:page/@application='portal'">
					<xsl:attribute name="class">current</xsl:attribute>
				</xsl:if>	
				<a href="{$dispatcher-prefix}">
					<span>Home</span>
				</a>
			</li>
			<li>
				<xsl:if test="//nav:categoryPath/nav:category[@title=$nav_item_1]">
					<xsl:attribute name="class">current</xsl:attribute>
				</xsl:if>	
				<a href="{$dispatcher-prefix}{$nav_url_1}"><span><xsl:value-of select="$nav_item_1" /></span></a>
			</li>
			<li>
				<xsl:if test="//nav:categoryPath/nav:category[@title=$nav_item_2]">
					<xsl:attribute name="class">current</xsl:attribute>
				</xsl:if>	
				<a href="{$dispatcher-prefix}{$nav_url_2}"><span><xsl:value-of select="$nav_item_2" /></span></a>
			</li>
			<li>
				<xsl:if test="//nav:categoryPath/nav:category[@title=$nav_item_3]">
					<xsl:attribute name="class">current</xsl:attribute>
				</xsl:if>	
				<a href="{$dispatcher-prefix}{$nav_url_3}"><span><xsl:value-of select="$nav_item_3" /></span></a>
			</li>
			<li>
				<xsl:if test="//nav:categoryPath/nav:category[@title=$nav_item_4]">
					<xsl:attribute name="class">current</xsl:attribute>
				</xsl:if>	
				<a href="{$dispatcher-prefix}{$nav_url_4}"><span><xsl:value-of select="$nav_item_4" /></span></a>
			</li>
			<li>
				<xsl:if test="//nav:categoryPath/nav:category[@title=$nav_item_5]">
					<xsl:attribute name="class">current</xsl:attribute>
				</xsl:if>	
				<a href="{$dispatcher-prefix}{$nav_url_5}"><span><xsl:value-of select="$nav_item_5" /></span></a>
			</li>
			<li><a href="{$dispatcher-prefix}/content-center"><span>Log on</span></a></li>
		</ul>
	</xsl:template>
</xsl:stylesheet>
