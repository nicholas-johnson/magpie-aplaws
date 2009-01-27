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
				<xsl:call-template name="javaScript" />
			</head>
			<body>
				<div id="wrapper">
          <xsl:call-template name="accessLinks" />
					<xsl:call-template name="pageHeader" />
					<xsl:call-template name="breadcrumb" />
					<xsl:call-template name="navigationContent" />
					<xsl:call-template name="pageFooter" />
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template name="navigationContent">
		<div id="contentPage">
			<div id="floatWrapper">
				<xsl:call-template name="navigationMain" />
				<xsl:call-template name="navigationRelated" />
			</div>
			<xsl:call-template name="navigationNav" />
			<xsl:call-template name="creatorContactDetails" />
		</div>
	</xsl:template>
	
	<xsl:template name="navigationMain">
		<div id="main">
			<h2>
				<xsl:value-of select="/bebop:page/nav:categoryPath/nav:category[position()=last()]/@title"/>
			</h2>
			<a name="content" class="access">&#160;</a>
			<xsl:apply-templates select="nav:greetingItem" />
			<xsl:apply-templates select="nav:simpleObjectList" mode="alphabetical" />
		</div>
	</xsl:template>
	
	<xsl:template name="navigationRelated">
		<xsl:call-template name="links">
			<xsl:with-param name="item" select="nav:greetingItem/cms:item"/>
		</xsl:call-template>
	</xsl:template>
			
	<xsl:template name="navigationNav">
		<div id="navigation">
			<a name="navigation" class="access">&#160;</a>
			<h2>Site Categories</h2>
			<xsl:apply-templates select="/bebop:page/nav:categoryMenu" />
		</div>
	</xsl:template>

</xsl:stylesheet>
