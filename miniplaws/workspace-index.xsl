<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:bebop="http://www.arsdigita.com/bebop/1.0"
		xmlns:aplaws="http://www.arsdigita.com/aplaws/1.0"
		xmlns:ui="http://www.arsdigita.com/ui/1.0"
		xmlns:cms="http://www.arsdigita.com/cms/1.0"
		xmlns:nav="http://ccm.redhat.com/london/navigation"
		xmlns:search="http://rhea.redhat.com/search/1.0"
		xmlns:portal="http://www.uk.arsdigita.com/portal/1.0"
		exclude-result-prefixes="xsl bebop aplaws ui cms nav search portal">

	<!-- Primary Stylesheet for APLAWS+ home (portal) page -->

	<!-- Standard APLAWS+ imports -->
	<!-- We leave the standard imports so that we retain any 
	functionality that we do not specifically override -->
	<xsl:import href="../../../../ROOT/__ccm__/apps/workspace/xsl/index.xsl"/>
	<xsl:import href="../../../../ROOT/__ccm__/themes/aplaws/portal/lib.xsl"/>
	<xsl:import href="../../../../ROOT/__ccm__/themes/aplaws/portal/portlets.xsl"/>
	<xsl:import href="../../../../ROOT/__ccm__/themes/aplaws/lib/header.xsl"/>
	<xsl:import href="../../../../ROOT/__ccm__/themes/aplaws/lib/lib.xsl"/>

	<!-- Runtime Collective Core stylesheets, placed after Standard imports to 
	override the default behaviors -->
	<!-- First stylesheets specific to the home (portal) page: -->
	<xsl:import href="../../../../ROOT/__ccm__/themes/rc-core/xsl/portal/homepageWorkspace.xsl"/>
	<xsl:import href="../../../../ROOT/__ccm__/themes/rc-core/xsl/portal/portal.xsl"/>
	<xsl:import href="../../../../ROOT/__ccm__/themes/rc-core/xsl/portlet/loginuser.xsl"/>
	<xsl:import href="../../../../ROOT/__ccm__/themes/rc-core/xsl/portlet/loginform.xsl"/>
	<xsl:import href="../../../../ROOT/__ccm__/themes/rc-core/xsl/bebop/portlet.xsl"/>
	<xsl:import href="../../../../ROOT/__ccm__/themes/rc-core/xsl/lib/creatorContactDetails.xsl"/>
	<xsl:import href="../../../../ROOT/__ccm__/themes/rc-core/xsl/lib/toTop.xsl"/>	
	<!-- then stylesheets that are needed on all runtime pages: -->
	<xsl:import href="../../../../ROOT/__ccm__/themes/rc-core/xsl/coreIncludes.xsl"/>

	<!-- Override the defaults with theme specific includes -->
	<xsl:import href="xsl/themeIncludes.xsl" />
	<xsl:import href="xsl/bebop/portlet.xsl" />

	<!-- get useful parameters -->
	<xsl:param name="context-prefix"></xsl:param>
	<xsl:param name="dispatcher-prefix" />
	<xsl:param name="theme-prefix" />
	<xsl:variable name="textOnly" select="contains(/bebop:page/@url, 'textonly=yes')" />

	<!-- Output HTML with correct DOCTYPE including system identifier URI 
	So as not to trigger 'Quirks mode' in modern browsers TJB-RC-20040608 -->
	<xsl:output method="xml" indent="yes"
			doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
			doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
			omit-xml-declaration="yes"/>
			
		<!-- Displays a portal page -->
	<xsl:template name="page" match="bebop:page[@class='simplePage' and @application='portal']">
		<html lang="en">
			<head>
				<title>
					<xsl:call-template name="councilName" /> - Homepage
				</title>
				<xsl:call-template name="metaData"/>
				<xsl:call-template name="cssHomepage" />
				<xsl:call-template name="javaScript" />
			</head>
			<body>
				<div id="wrapper">
          <xsl:call-template name="accessLinks" />
					<xsl:call-template name="pageHeader" />
					<xsl:call-template name="homepageBreadcrumb" />
					<xsl:call-template name="homepageContent" />
					<xsl:call-template name="pageFooter" />
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template name="homepageContent">
		<div id="homepage">
			<div id="floatWrapper">
				<a name="content" class="access">&#160;</a>
				<div id="main">
					<a name="content" class="access">&#160;</a>
					<xsl:apply-templates select="//portal:homepageWorkspace[@id='middle']"/>
				</div>
				<div id="relatedItems">
					<xsl:apply-templates select="//portal:homepageWorkspace[@id='right']"/>
				</div>
			</div>
			<div id="navigation">
				<a name="navigation" class="access">&#160;</a>
				<xsl:apply-templates select="//portal:homepageWorkspace[@id='left']"/>
			</div>
		</div>
	</xsl:template>
	
	<xsl:template name="homepageBreadcrumb">
		<div id="breadcrumb">
			You are in: Home
		</div>
	</xsl:template>

</xsl:stylesheet>
