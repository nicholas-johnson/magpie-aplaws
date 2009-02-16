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
	
	<xsl:import href="../../../../ROOT/__ccm__/apps/workspace/xsl/index.xsl"/>
	<xsl:import href="content-section-index.xsl"/>

	
	
		<!-- Primary APLAWS+ stylesheet for 'content items' (Articles, News items etc) -->
	
	<!-- Standard APLAWS+ imports -->
	<!-- Leave the standard imports so that we retain any functionality 
	that we do not specifically override TJB-RC-20040608 -->
	<xsl:import href="../../../../ROOT/__ccm__/themes/aplaws/lib/header.xsl"/>
	<xsl:import href="../../../../ROOT/__ccm__/themes/aplaws/lib/lib.xsl"/>
	<xsl:import href="../../../../ROOT/__ccm__/themes/aplaws/lib/leftNav.xsl"/>
	<xsl:import href="../../../../ROOT/__ccm__/themes/aplaws/types/ContentTypes.xsl"/>

	<!-- Runtime Collective Core stylesheets, 
		placed after Standard imports to override the default behaviors -->
	<!-- First stylesheets specific to the content pages -->
	<xsl:import href="../../../../ROOT/__ccm__/themes/rc-core/xsl/cms/item.xsl" />
	<xsl:import href="../../../../ROOT/__ccm__/themes/rc-core/xsl/cms/articleSectionPanel.xsl" />
	<xsl:import href="../../../../ROOT/__ccm__/themes/rc-core/xsl/nav/greetingItem.xsl" />
	<xsl:import href="../../../../ROOT/__ccm__/themes/rc-core/xsl/nav/simpleObjectList.xsl"/>
	<xsl:import href="../../../../ROOT/__ccm__/themes/rc-core/xsl/nav/categoryMenu.xsl"/>
	<xsl:import href="../../../../ROOT/__ccm__/themes/rc-core/xsl/cms/articleSectionPanel.xsl"/>
	<!-- then stylesheets that are needed on all RC pages -->
	<xsl:import href="../../../../ROOT/__ccm__/themes/rc-core/xsl/coreIncludes.xsl" />

	<!-- now override the defaults with theme specific includes -->
	<xsl:import href="xsl/themeIncludes.xsl"/>
	
	<xsl:param name="context-prefix" />
	<xsl:param name="dispatcher-prefix" />
	<xsl:param name="theme-prefix" />
	<xsl:variable name="textOnly" select="contains(/bebop:page/@url, 'textonly=yes')" />
	
	<!-- Output HTML with correct DOCTYPE including system identifier URI 
	So as not to trigger 'Quirks mode' in modern browsers TJB-RC-20040608 -->
	<xsl:output method="xml" indent="yes"
			doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
			doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
			omit-xml-declaration="yes"/>
	
	<!-- Displays a navigation page -->
	<xsl:template name="page" match="bebop:page[@class='simplePage' and @application='navigation']">
		<html lang="en">
			<head>
				<title><xsl:call-template name="councilName" /><xsl:call-template name="htmlTitleBuilder" /></title>
				<xsl:call-template name="metaData"/>
				<xsl:call-template name="css" />
				<xsl:call-template name="cssNavigation" />
				<xsl:call-template name="javaScript" />
			</head>
			<body>
				<xsl:call-template name="accessLinks" />
				<div id="wrapper">
					<div class="header">
						<h1><a href="index.html"><img src="{$theme-prefix}/images/logos/logo_pink.png" alt="Middlesbrough Learning Disability Open Partnership Board" /></a></h1>
						<h2><a href="#"><img src="{$theme-prefix}/images/titles/sub_groups.png" alt="Sub Groups" /></a></h2>
						<br class="clear" />
					</div>
					<xsl:call-template name="navigationContent" />
				</div>
				<xsl:call-template name="pageFooter" />
			</body>
		</html>
	</xsl:template>
	
	<xsl:template name="navigationContent">
		<xsl:call-template name="navigationMain" />
		<xsl:call-template name="navigationRelated" />
		<xsl:call-template name="navigationNav" />
		<xsl:call-template name="creatorContactDetails" />
	</xsl:template>
	
	<xsl:template name="navigationMain">
		<div class="content">
			<xsl:if test="(count(nav:greetingItem/cms:item/links) > 0) or (count(/bebop:page/nav:relatedItems/nav:relatedItem) > 0) or (count(nav:greetingItem/cms:item/fileAttachments) > 0)">
				<xsl:attribute name="class">content narrow</xsl:attribute>
			</xsl:if>
			<h2>
				<span><xsl:value-of select="/bebop:page/nav:categoryPath/nav:category[position()=last()]/@title"/></span>
			</h2>
			<div class="text">
				<a name="content" class="access">&#160;</a>
				<xsl:apply-templates select="nav:greetingItem" />
				<xsl:apply-templates select="nav:simpleObjectList" mode="alphabetical" />
			</div>
		</div>
	</xsl:template>
	
	<xsl:template name="navigationRelated">
		<xsl:call-template name="links">
			<xsl:with-param name="item" select="nav:greetingItem/cms:item"/>
		</xsl:call-template>
	</xsl:template>
			
	<xsl:template name="navigationNav">
		<div class="nav">
			<a name="nav" class="access">&#160;</a>
			<h2><span>Navigation</span></h2>
			<xsl:apply-templates select="/bebop:page/nav:categoryMenu" />
		</div>
	</xsl:template>
	
	<xsl:template name="cssNavigation">
		<xsl:choose>
			<xsl:when test="(count(nav:greetingItem/cms:item/links) > 0) or (count(/bebop:page/nav:relatedItems/nav:relatedItem) > 0) or (count(nav:greetingItem/cms:item/fileAttachments) > 0)">
				<link rel="stylesheet" href="{$theme-prefix}/stylesheets/three_col.css" type="text/css" />
			</xsl:when>
			<xsl:otherwise>
				<link rel="stylesheet" href="{$theme-prefix}/stylesheets/two_col.css" type="text/css" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
</xsl:stylesheet>
