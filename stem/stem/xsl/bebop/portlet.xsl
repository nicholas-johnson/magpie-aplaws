<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:portal="http://www.uk.arsdigita.com/portal/1.0" xmlns:portlet="http://www.uk.arsdigita.com/portlet/1.0" xmlns:bebop="http://www.arsdigita.com/bebop/1.0" xmlns:nav="http://ccm.redhat.com/london/navigation" version="1.0" exclude-result-prefixes="xsl portal portlet bebop nav">
	
	<xsl:template match="portal:homepageWorkspace[@id='left']">
		<xsl:for-each select="portal:portal/bebop:portlet">
			<xsl:apply-templates select="."/>
			<xsl:apply-templates select="portlet:action"/>
		</xsl:for-each>
		<xsl:apply-templates select="bebop:link"/>
	</xsl:template>
	
	<xsl:template match="portal:homepageWorkspace[@id='right']">
		<xsl:for-each select="portal:portal/bebop:portlet">
			<xsl:apply-templates select="."/>
			<xsl:apply-templates select="portlet:action"/>
		</xsl:for-each>
		<xsl:apply-templates select="bebop:link"/>
	</xsl:template>
	
	<xsl:template match="bebop:portlet[nav:objectList]">
		<div class="feature">
			<xsl:for-each select="nav:objectList/nav:item">
				<div class="item">
					<div class="item_wrapper">
						<img>
							<xsl:attribute name="src"><xsl:value-of select="$dispatcher-prefix"/>/cms-service/stream/image/?image_id=<xsl:value-of select="nav:attribute[@name='imageAttachments.image.id']"/></xsl:attribute>
							<xsl:attribute name="alt">
								<xsl:value-of select="nav:attribute[@name='imageAttachments.caption']"/>
							</xsl:attribute>
						</img>
						<h2>
							<xsl:value-of select="nav:attribute[@name='title']"/>
						</h2>
						<xsl:value-of select="nav:attribute[@name='lead']"/>
					</div>
				</div>
			</xsl:for-each>
		</div>
	</xsl:template>

	<xsl:template match="bebop:portlet[portlet:contentDirectory]">
		<h2>
			<span>Navigation</span>
		</h2>
		<ul>
			<xsl:for-each select="portlet:contentDirectory/portlet:contentDirectoryEntry">
				<xsl:sort select="@name"/>
				<li>
					<xsl:attribute name="class">
						<xsl:value-of select="translate(@name, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ ,.:;()+-&amp;', 'abcdefghijklmnopqrstuvwxyz')"/>
					</xsl:attribute>
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="@url"/>
						</xsl:attribute>
						<xsl:value-of select="@name"/>
					</a>
				</li>
			</xsl:for-each>
		</ul>
	</xsl:template>
	
</xsl:stylesheet>
