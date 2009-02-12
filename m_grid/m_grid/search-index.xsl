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
				<title><xsl:call-template name="councilName" /><xsl:call-template name="htmlTitleBuilder" /></title>
				<xsl:call-template name="metaData"/>
				<xsl:call-template name="css" />
			</head>
			<body>
				<xsl:call-template name="accessLinks" />
				<div id="page">
					<div id="wrap">
						<xsl:call-template name="pageHeader" />
						<div id="container">
							<xsl:call-template name="topNav" />
							<div id="content">
									<xsl:call-template name="searchBreadcrumb" />
									<xsl:call-template name="searchContent" />
							</div> <!-- End Content -->
							<xsl:call-template name="pageFooter" />
						</div> <!-- End Container -->
					</div> <!-- End Wrap -->
				</div> <!-- End Page -->
			</body>
		</html>
	</xsl:template>
	
	<xsl:template name="searchContent">
		<div id="content-left">
			<a name="content" class="access">&#160;</a>
			<h3>Search</h3>
			<xsl:call-template name="searchMain" />
		</div>
		<div id="right">
			<h2>Key Links</h2>
			<ul>
				<li>
					<a href="{$dispatcher-prefix}/atoz" title="Go to A to Z of content">A to Z content listing</a>
				</li>
			</ul>
		</div>
	</xsl:template>
	
	<xsl:template name="searchMain">
		<a name="content" class="access">&#160;</a>
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
	</xsl:template>

	<xsl:template name="searchBreadcrumb">
		<div id="breadcrumb">
			<p>
				<em>You are here:</em> 
				<a href="{//bebop:page/ui:userBanner/@workspaceURL}"><abbr title="Middlesbrough Grid for Learning">MGrid</abbr></a>&#160;&gt; Search
			</p>
		</div>
	</xsl:template>

	<xsl:template name="searchBasic">
		<xsl:for-each select="bebop:form[@name='search']">
			<div id="searchArea">
				<div class="info">
					<xsl:choose>
						<xsl:when test="//search:results">
							<p>
								<xsl:apply-templates select="//search:paginator" mode="results-summary" />
							</p>
						</xsl:when>
						<xsl:otherwise>
							<p>Type one or more words into the box below and click 'Search'</p>
						</xsl:otherwise>
					</xsl:choose>
				</div><!-- /info -->
				<form name="{@name}" method="get" action="{@action}">
					<label class="searchLabel" for="terms">Search for: </label>
					<input class="searchBox" id="terms2" name="terms">
						<xsl:attribute name="value">
							<xsl:value-of select="./search:query/search:terms/@value" />
						</xsl:attribute>
					</input>
					<input type="submit" name="Submit" id="basicSearchGo" value="Search" class="adgo" />
					<xsl:apply-templates select="bebop:pageState" />
				</form>
			</div><!-- /searchArea -->
		</xsl:for-each>
		<xsl:if test="/bebop:page/search:results/search:paginator/@objectCount &gt; 0">
			<xsl:apply-templates select="search:results" />
		</xsl:if>
	</xsl:template>

  <xsl:template match="search:documents">
			<xsl:for-each select="search:object">
				<p class="searchResult">
					<a>
						<xsl:attribute name="href">
							<xsl:call-template name="hostlessUri">
								<xsl:with-param name="url" select="@url" />
							</xsl:call-template>
						</xsl:attribute>
						<xsl:attribute name="title">
							<xsl:value-of select="@title" />
						</xsl:attribute>
						<xsl:value-of select="@title" />
					</a>
					<xsl:if test="@summary">
						<xsl:choose>
							<xsl:when test="string-length(@summary) &gt; 150">
								<br /><xsl:value-of select="substring(@summary, 1, 147)" />...
							</xsl:when>
							<xsl:otherwise>
								<br /><xsl:value-of select="@summary" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
				</p>
			</xsl:for-each>
		<xsl:apply-templates select="search:paginator" mode="pages" />
  </xsl:template>


 <xsl:template match="search:paginator" mode="page-summary">
    <xsl:if test="@objectCount &gt; 0">
      <p class="info">
        <xsl:text>Displaying page </xsl:text>
        <xsl:value-of select="@pageNumber" />
        <xsl:text> of </xsl:text>
        <xsl:value-of select="@pageCount" />
        <xsl:text> (maximum of </xsl:text>
        <xsl:value-of select="@pageSize" />
        <xsl:text> results per page)</xsl:text>
      </p><!-- /pageSummary -->
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>