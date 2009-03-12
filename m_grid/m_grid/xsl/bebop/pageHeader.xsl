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
			
			<xsl:call-template name="search" />
			
		</div> <!-- End Header -->
	</xsl:template>
	
	<xsl:template name="search">
		<div id="search">
			<form action="{$dispatcher-prefix}/search" method="get">
				<!--input value="default_collection" name="site" type="hidden" />
				<input value="default_frontend" name="client" type="hidden" />
				<input value="default_frontend" name="proxystylesheet" type="hidden" />
				<input value="default_collection" name="site" type="hidden" />
				<input value="default_frontend" name="client" type="hidden" />
				<input value="default_frontend" name="proxystylesheet" type="hidden" />
				<input value="xml_no_dtd" name="output" type="hidden" / -->
				<input type="text" name="terms" value="Search MGrid" id="searchbox" accesskey="4" onfocus="if(this.value=='Search MGrid')this.value='';"/>
				<input type="submit" value="Search" name="submit" id="searchbtn" />
			</form>
		</div>
	</xsl:template>
	
</xsl:stylesheet>