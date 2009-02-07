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
	<xsl:import href="../../../../ROOT/__ccm__/themes/aplaws/lib/header.xsl"/>
	<xsl:import href="../../../../ROOT/__ccm__/themes/aplaws/lib/lib.xsl"/>

	<!-- Runtime Collective Core stylesheets, placed after Standard imports to 
	override the default behaviors -->
	<!-- First stylesheets specific to the home (portal) page: -->
	<xsl:import href="../../../../ROOT/__ccm__/themes/rc-core/xsl/portal/homepageWorkspace.xsl"/>
	<!-- xsl:import href="../../../../ROOT/__ccm__/themes/rc-core/xsl/portal/portal.xsl"/ -->
	<xsl:import href="../../../../ROOT/__ccm__/themes/rc-core/xsl/portlet/loginuser.xsl"/>
	<xsl:import href="../../../../ROOT/__ccm__/themes/rc-core/xsl/portlet/loginform.xsl"/>
	<!-- xsl:import href="../../../../ROOT/__ccm__/themes/rc-core/xsl/bebop/portlet.xsl"/ -->
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
				<xsl:call-template name="css"/>
			</head>
			<body>
				<xsl:call-template name="accessLinks" />
				<div id="page">
					<div id="wrap">
						<xsl:call-template name="pageHeader" />
						<div id="container">
							<xsl:call-template name="topNav" />
							<div id="content">
								<xsl:call-template name="homepageBreadcrumb" />
								<xsl:call-template name="homepageLeftCol" />
								<xsl:call-template name="homepageCenterCol" />
								<xsl:call-template name="homepageRightCol" />
							</div> <!-- End Content -->
							<xsl:call-template name="pageFooter" />
						</div> <!-- End Container -->
					</div> <!-- End Wrap -->
				</div> <!-- End Page -->
			</body>
		</html>
	</xsl:template>
	
	<xsl:template name="homepageContent">
		<div class="content">
			<h2 class="title"><span>Stem</span></h2>
			<div class="content-wrapper">
				<div class="random_image">
					<img id="random_image" src="{$theme-prefix}/images/random_images/1.jpg" alt="" />
				</div>
				<a name="content" class="access">&#160;</a>
				<xsl:apply-templates select="//portal:homepageWorkspace[@id='right']" />
				<div class="clear">&#160;</div>
			</div>
		</div>
		
		<div class="navigation">
			<xsl:apply-templates select="//portal:homepageWorkspace[@id='left']" />
		</div>
	</xsl:template>
	
	<xsl:template name="homepageBreadcrumb">
		<div id="breadcrumb">
			<p><em>You are here:</em> Home</p>
		</div> <!-- end breadcrumb -->
	</xsl:template>
	
	<xsl:template name="homepageLeftCol">
		<div id="left">
			<h3>Latest News</h3>
			<div class="post">
				<h4>Learning Platform downtime</h4>
				<p><img src="images/middlesbrough-grid.gif" align="left" border="1" alt="icon" />
				The Learning Platform will be unavailable from 18:00 on Sunday 18 January to 09:00 on Monday 19 January. This is due to the upgrade of Service Pack 71.3.
				<span class="grey">Posted on: 07 Jan 09</span>	
				</p>
			</div> <!-- end post -->
			<div class="post">	
				<h4>Northern Grid newsletter</h4>
				<p>
				<img src="images/ngfl.gif" align="left" border="1" alt="icon" />
				December's edition of the Northern Grid Newsletter is now available. Click on the link below to access the HTML version, or go to the Northern Grid
				<span class="grey">Posted on: 01 Dec 08</span>
				</p>
			</div> <!-- end post -->
		    <div class="post">
				<h4>Chandlers Ridge</h4>
				<p>
				<img src="images/chandlers.jpg" align="left" border="1" alt="icon" />
				The school has been recommended by BECTA to be part of the prestigious ICT Register (www.ict-register.net) in recognition of the work
				<span class="grey">Posted on: 27 Nov 08</span>
				</p>
			</div> <!-- end post -->
			<xsl:apply-templates select="//portal:homepageWorkspace[@id='left']" />
		</div> <!-- end left -->
		
	</xsl:template>
	
	<xsl:template name="homepageCenterCol">
		<div id="center">
			<h3>ICT Conference 2009</h3>
			<img src="images/ict-conference.jpg" alt="ICT Conference will be held on 25 September 2009" />
		</div> <!-- end center -->
		<xsl:apply-templates select="//portal:homepageWorkspace[@id='middle']" />
	</xsl:template>
	
	<xsl:template name="homepageRightCol">
		<div id="right">
			<h3>Key Links</h3>
			<ul>
				<li><a href="/">Middlesbrough Council homepage</a></li>	
				<li><a href="/">Children and Young People Plan 2007/2008</a></li>
				<li><a href="/">Free Video and Audio</a></li>
				<li><a href="/">Family Service Directory</a></li>
				<li><a href="/">Professional Development</a></li>
				<li><a href="/">School Admissions</a></li>
				<li><a href="/">Grants</a></li>
				<li><a href="/">Education Jobs in Middlesbrough</a></li>
				<li><a href="/">Education Visits</a></li>
			</ul>
			<h3>Resources</h3>
			<ul>
				<li><a href="/">Freedom of Information</a></li>
				<li><a href="/">Fixed term contracts</a></li>
				<li><a href="/">Sure Start timetables</a></li>
				<li><a href="/">Program Resources from Priory Woods</a></li>
			</ul>
		</div> <!-- end right -->
		<xsl:apply-templates select="//portal:homepageWorkspace[@id='right']" />
	</xsl:template>

</xsl:stylesheet>
