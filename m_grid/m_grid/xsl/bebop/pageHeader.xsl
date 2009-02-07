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
	
	<xsl:template name="pageHeader">
		<div id="header">
			
			<div id="logo">
				<h1><a href="{$dispatcher-prefix}" title="MGrid Logo">MGrid - Middlesbrough Education Grid for Learning</a></h1> 
			</div> <!-- End Logo -->
			
			<div id="heading">
				<h2>...Engaging our Learning Community</h2>
			</div> <!-- End Heading -->

			<div id="search">
				<form action="http://www.bbc.co.uk/cgi-bin/search/results.pl" method="get">
					<input type="hidden" value="/" name="uri" />
					<input type="hidden" value="all" name="scope" />
					<input type="hidden" value="toolbar" name="go" />
					<input name="q" type="text" id="searchbox" value="Search MGrid" />
					<input type="submit" value="Search" id="searchbtn" />
				</form>
			</div> <!-- End Search -->
			
		</div> <!-- End Header -->
	</xsl:template>
	
</xsl:stylesheet>