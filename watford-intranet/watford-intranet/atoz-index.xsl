<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:bebop="http://www.arsdigita.com/bebop/1.0"
		xmlns:aplaws="http://www.arsdigita.com/aplaws/1.0"
		xmlns:ui="http://www.arsdigita.com/ui/1.0"
		xmlns:cms="http://www.arsdigita.com/cms/1.0"
		xmlns:nav="http://ccm.redhat.com/london/navigation"
		xmlns:search="http://rhea.redhat.com/search/1.0"
		xmlns:atoz="http://xmlns.redhat.com/atoz/1.0"
		exclude-result-prefixes="xsl bebop aplaws ui cms nav search atoz"
		version="1.0">

	<!-- Primary Stylesheet for APLAWS+ A to Z page -->
	
	<!-- Standard APLAWS+ imports -->
	<!-- We leave the standard imports so that we retain any 
	functionality that we do not specifically override 
	TJB-RC-20040705 -->
	<xsl:import href="../../../../ROOT/__ccm__/apps/content-section/xsl/index.xsl"/>
	<xsl:import href="../../../../ROOT/__ccm__/themes/aplaws/lib/header.xsl"/>
	<xsl:import href="../../../../ROOT/__ccm__/themes/aplaws/lib/lib.xsl"/>

	<!-- RC core stylesheets, placed after Standard imports to 
 	override the default behaviors -->
	<!-- First stylesheets specific to the atoz page -->
	<xsl:import href="../../../../ROOT/__ccm__/themes/rc-core/xsl/atoz/atoz.xsl"/>
	<xsl:import href="../../../../ROOT/__ccm__/themes/rc-core/xsl/lib/creatorContactDetails.xsl"/>
	<xsl:import href="../../../../ROOT/__ccm__/themes/rc-core/xsl/lib/toTop.xsl"/>
	<xsl:import href="../../../../ROOT/__ccm__/themes/rc-core/xsl/nav/categoryMenu.xsl"/>
	<!-- then stylesheets that are needed on all RC pages -->
	<xsl:import href="../../../../ROOT/__ccm__/themes/rc-core/xsl/coreIncludes.xsl"/>

	<!-- now override the defaults with theme specific includes -->
	<xsl:import href="xsl/themeIncludes.xsl"/>

	
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
			
	<xsl:template match="bebop:page[@class='simplePage' and @application='atoz']">
		<html lang="en">
			<head>
				<title>
					Generic Council<xsl:call-template name="htmlTitleBuilder" />
				</title>
				<xsl:call-template name="metaData"/>
				<xsl:call-template name="css" />
				<xsl:call-template name="javascript" />
			</head>
			<body>
				<div id="wrapper">
					<ul class="access">
						<li>
							<a href="#content">Skip to content</a>
						</li>
						<li>
							<a href="#navigation">Skip to Navigation</a>
						</li>
					</ul>
					<xsl:call-template name="pageHeader" />
					<xsl:call-template name="atozBreadcrumb" />
					<xsl:call-template name="atozContent" />
					<xsl:call-template name="pageFooter"/>
				</div>
			</body>
		</html>
	</xsl:template>

	<xsl:template name="atozBreadcrumb">
		<div id="breadcrumb">
			<a href="{$dispatcher-prefix}/portal/" title="home">home</a>
			<xsl:text disable-output-escaping="yes"> &gt; </xsl:text>A to Z
		</div>
	</xsl:template>

	<xsl:template name="atozContent">
		<div id="contentPage">
			<div id="floatWrapper">
				<xsl:call-template name="atozMain" />
				<xsl:call-template name="atozRelated" />
			</div>
			<xsl:call-template name="atozNavigation" />
		</div>
	</xsl:template>
		
	<xsl:template name="atozMain">
		<div id="content">
			<a name="content" class="access">&#160;</a>
			<xsl:call-template name="atozLead" />
			<xsl:call-template name="atozResults" />
		</div>
	</xsl:template>

	<xsl:template name="atozLead">
		<div class="lead">
			<h2>A to Z index of <xsl:call-template name="councilName" /></h2>
			<p>Choose a letter to browse information and services</p>
			
			<ul class="siteNav">
				<xsl:for-each select="atoz:atoz/atoz:letter">
					<li>
						<xsl:if test="position()=1">
							<xsl:attribute name="class">first</xsl:attribute>
						</xsl:if>
						<xsl:choose>
							<xsl:when test="not(@isSelected)">
								<a>
									<xsl:attribute name="href">?letter=<xsl:value-of select="." />
									</xsl:attribute>
									<xsl:attribute name="title">Go to information and services starting with <xsl:value-of select="."/>
									</xsl:attribute>
									<xsl:value-of select="."/>
								</a>
							</xsl:when>
							<xsl:otherwise>
								<span>
									<xsl:value-of select="."/>
								</span>
							</xsl:otherwise>
						</xsl:choose>
					</li>
				</xsl:for-each>
			</ul>
			<div class="clear">
				<br/>
			</div>
		</div><!-- /lead -->
	</xsl:template>

	<xsl:template name="atozResults">
		<xsl:if test="atoz:atoz/atoz:letter[@isSelected]">
			<div class="results">
				<h3>Categories starting with the letter <xsl:value-of select="atoz:atoz/atoz:letter[@isSelected]" /></h3>
				<ul>
					<xsl:for-each select="atoz:atoz/atoz:provider">
						<xsl:for-each select="atoz:atoz/atoz:atomicEntry">
							<li class="azResult">
								<a href="{@url}" title="{@description}">
									<xsl:value-of select="@title" />
								</a>
							</li>
						</xsl:for-each>
					</xsl:for-each>
				</ul>
			</div>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="atozNavigation">
		<div id="navigation">
			<a name="navigation" class="access">&#160;</a>
			<h2>Site Categories</h2>
			<ul id="nav">
				<li>
					<a href="{$dispatcher-prefix}/portal" title="go to homepage">Home</a>
					<ul>
						<li>
							<p>A to Z</p>
							<ul>
								<li>
									<a href="{$dispatcher-prefix}/atozhelp" class="navChild" title="A to Z explained">A to Z explained</a>
								</li>
							</ul>
						</li>
					</ul>
				</li>
			</ul>
		</div>
	</xsl:template>

	<xsl:template name="atozRelated">
		<div id="relatedItems">
			<div class="related">
				<h2>Search</h2>
				<ul class="colItems">
					<li>
						<a href="{$dispatcher-prefix}/search" class="more" title="Go to Search page">Search</a> - Can't find what you're looking for? Our Search page might have what you need.
					</li>
				</ul>
			</div>
		</div>
	</xsl:template>

</xsl:stylesheet>
