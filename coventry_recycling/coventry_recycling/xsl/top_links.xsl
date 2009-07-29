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
		
	<xsl:template name="topLinks">
	  
	  <xsl:variable name="blue_bin_path">/navigation/business</xsl:variable>
	  <xsl:variable name="brown_bin_path">/navigation/business</xsl:variable>
	  <xsl:variable name="green_bin_path">/navigation/business</xsl:variable>
	  <xsl:variable name="contact_path">/navigation/business</xsl:variable>
	  
		<ul class="top_links">
			<li>
				<a href="{$dispatcher-prefix}">
					<img src="{$theme-prefix}/images/top_nav/home_off.png" alt="Home" class="rollover" />
				</a>
			</li>
			<li>
				<a href="{$dispatcher-prefix}{$blue_bin_path}">
					<img src="{$theme-prefix}/images/top_nav/blue_bin_off.png" alt="Blue Bin" class="rollover" />
				</a>
			</li>
			<li>
				<a href="{$dispatcher-prefix}{$brown_bin_path}">
					<img src="{$theme-prefix}/images/top_nav/brown_bin_off.png" alt="Brown Bin" class="rollover" />
				</a>
			</li>
			<li>
				<a href="{$dispatcher-prefix}{$green_bin_path}">
					<img src="{$theme-prefix}/images/top_nav/green_bin_off.png" alt="Green Bin" class="rollover" />
				</a>
			</li>
			<li>
				<a href="{$dispatcher-prefix}{$contact_path}">
					<img src="{$theme-prefix}/images/top_nav/contact_off.png" alt="Contact" class="rollover" />
				</a>
			</li>
		</ul>
	</xsl:template>
	
</xsl:stylesheet>