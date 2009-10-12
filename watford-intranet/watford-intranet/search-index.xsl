<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:bebop="http://www.arsdigita.com/bebop/1.0"
		xmlns:aplaws="http://www.arsdigita.com/aplaws/1.0"
		xmlns:ui="http://www.arsdigita.com/ui/1.0"
		xmlns:cms="http://www.arsdigita.com/cms/1.0"
		xmlns:nav="http://ccm.redhat.com/london/navigation"
		xmlns:search="http://rhea.redhat.com/search/1.0"
		exclude-result-prefixes="xsl bebop aplaws ui cms nav search">

	<!-- Primary Stylesheet for APLAWS+ search pages -->
	
	<!-- Standard APLAWS+ imports -->
	<!-- We leave the standard imports so that we retain any 
	functionality that we do not specifically override 
	TJB-RC-20040705 -->
	<xsl:import href="../../../../ROOT/__ccm__/themes/aplaws/lib/header.xsl"/>
	<xsl:import href="../../../../ROOT/__ccm__/themes/aplaws/lib/lib.xsl"/>
	<xsl:import href="../../../../ROOT/packages/bebop/xsl/bebop.xsl"/>
	<xsl:import href="../../../../ROOT/__ccm__/apps/content-section/xsl/index.xsl"/>

	<!-- Runtime Collective core stylesheets, placed after Standard imports to 
  override the default behaviors TJB-RC-20040705 -->
	<!-- First stylesheets specific to the search page -->
	<xsl:import href="../../../../ROOT/__ccm__/themes/rc-core/xsl/search/documents.xsl"/>
	<xsl:import href="../../../../ROOT/__ccm__/themes/rc-core/xsl/search/results.xsl"/>
	<xsl:import href="../../../../ROOT/__ccm__/themes/rc-core/xsl/search/paginator.xsl"/>

	<!-- Then stylesheets that are needed on all RC pages -->
	<xsl:import href="../../../../ROOT/__ccm__/themes/rc-core/xsl/coreIncludes.xsl" />
	
	<!-- Now override the defaults with theme specific includes -->
	<xsl:import href="xsl/themeIncludes.xsl"/>
	
	
	<xsl:param name="context-prefix"/>
	<xsl:param name="dispatcher-prefix" />
	<xsl:param name="theme-prefix" />

		<!-- Displays a content page -->
	<xsl:template name="page" match="bebop:page[@class='simplePage' and @application='search']">
		<html lang="en">
			<head>
				<title>
					<xsl:call-template name="councilName" /> - Search
				</title>
				<xsl:call-template name="metaData"/>
				<xsl:call-template name="css" />
				<xsl:call-template name="javascript" />
			</head>
			<body>
				<div id="wrapper">
					<xsl:call-template name="pageHeader" />
					<xsl:call-template name="searchBreadcrumb" />
					<xsl:call-template name="searchContent" />
					<xsl:call-template name="pageFooter" />
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template name="searchContent">
		<div id="contentPage">
			<div id="floatWrapper">
				<xsl:call-template name="searchMain" />
				<xsl:call-template name="searchRelated" />
			</div>
			<xsl:call-template name="searchNavigation" />
		
		</div>
	</xsl:template>
	
	<xsl:template name="searchMain">
		<div id="content">
		<a name="content" class="access">&#160;</a>
			<h2>Search</h2>
			<xsl:choose>
				<xsl:when test="@id='search'">
					<xsl:call-template name="searchBasic" />
				</xsl:when>
				<xsl:when test="@id='advanced'">
					<xsl:call-template name="searchAdvanced" />
				</xsl:when>
				<xsl:when test="@id='reindex'">
					<xsl:apply-templates/>
				</xsl:when>
			</xsl:choose>
		</div>
	</xsl:template>
	
	<xsl:template name="searchNavigation">
		<div id="navigation">
			<a name="navigation" class="access">&#160;</a>
			<h2>Site Categories</h2>
			<ul id="nav">
				<li class="selected">
					<a href="{$dispatcher-prefix}/portal/" class="home" title="go to homepage">Home</a>
					<ul>
						<li>
							<p>Search</p>
							<ul>
								<li>
									<a href="{$dispatcher-prefix}/searchhelp" class="navChild" title="Search explained">Search explained</a>
								</li>
							</ul>
						</li>
					</ul>
				</li>
			</ul>
		</div>
	</xsl:template>
			
	<xsl:template name="searchRelated">
		<div id="relatedItems">
			<div class="related">
				<h2>A to Z</h2>
				<ul class="colItems">
					<li>
						<a href="{$dispatcher-prefix}/atoz" class="more" title="Go to A to Z page">A to Z</a> - Can't find what you're looking for? Our A to Z page lists all categories in alphabetical order.
					</li>
				</ul>
			</div>
		</div>
	</xsl:template>
	
	<xsl:template name="searchBreadcrumb">
		<div id="breadcrumb">
			You are in: <a href="{$dispatcher-prefix}/">Home</a> &gt; Search
		</div>
	</xsl:template>

</xsl:stylesheet>
