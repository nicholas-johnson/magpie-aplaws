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
		<xsl:variable name="category">
			<xsl:call-template name="urlify">
				<xsl:with-param name="string">
					<xsl:value-of select="/bebop:page/nav:categoryMenu/nav:category/nav:category[@isSelected='true']/@title" />
				</xsl:with-param>
			</xsl:call-template>
		</xsl:variable>
		<div class="header">
			
			<h1>
				<a href="{$dispatcher-prefix}">
					<xsl:choose>
						<xsl:when test="$category='sub-groups'">
							<img src="{$theme-prefix}/images/logos/logo_pink.png" alt="Middlesbrough Learning Disability Open Partnership Board" />
						</xsl:when>
						<xsl:when test="$category='news'">
							<img src="{$theme-prefix}/images/logos/logo_pink.png" alt="Middlesbrough Learning Disability Open Partnership Board" />
						</xsl:when>
						<xsl:when test="$category='consultation'">
							<img src="{$theme-prefix}/images/logos/logo_blue.png" alt="Middlesbrough Learning Disability Open Partnership Board" />
						</xsl:when>
						<xsl:when test="$category='about-us'">
							<img src="{$theme-prefix}/images/logos/logo_yellow.png" alt="Middlesbrough Learning Disability Open Partnership Board" />
						</xsl:when>
						<xsl:when test="$category='contact-us'">
							<img src="{$theme-prefix}/images/logos/logo_green.png" alt="Middlesbrough Learning Disability Open Partnership Board" />
						</xsl:when>
						<xsl:when test="$category='links'">
							<img src="{$theme-prefix}/images/logos/logo_yellow.png" alt="Middlesbrough Learning Disability Open Partnership Board" />
						</xsl:when>
						<xsl:when test="$category='projects'">
							<img src="{$theme-prefix}/images/logos/logo_grey.png" alt="Middlesbrough Learning Disability Open Partnership Board" />
						</xsl:when>
						<xsl:otherwise>
							<img src="{$theme-prefix}/images/logos/logo_blue.png" alt="Middlesbrough Learning Disability Open Partnership Board" />
						</xsl:otherwise>
					</xsl:choose>
				</a>
			</h1>
			
			<h2>
				<a href="{/bebop:page/nav:categoryMenu/nav:category/nav:category[@isSelected='true']/@url}">
					<xsl:choose>
						<xsl:when test="$category='sub-groups'">
							<img src="{$theme-prefix}/images/titles/sub_groups.png" alt="Middlesbrough Learning Disability Open Partnership Board" />
						</xsl:when>
						<xsl:when test="$category='news'">
							<img src="{$theme-prefix}/images/titles/news.png" alt="Middlesbrough Learning Disability Open Partnership Board" />
						</xsl:when>
						<xsl:when test="$category='consultation'">
							<img src="{$theme-prefix}/images/titles/consultation.png" alt="Middlesbrough Learning Disability Open Partnership Board" />
						</xsl:when>
						<xsl:when test="$category='about-us'">
							<img src="{$theme-prefix}/images/titles/about_us.png" alt="Middlesbrough Learning Disability Open Partnership Board" />
						</xsl:when>
						<xsl:when test="$category='contact-us'">
							<img src="{$theme-prefix}/images/titles/contact_us.png" alt="Middlesbrough Learning Disability Open Partnership Board" />
						</xsl:when>
						<xsl:when test="$category='links'">
							<img src="{$theme-prefix}/images/titles/links.png" alt="Middlesbrough Learning Disability Open Partnership Board" />
						</xsl:when>
						<xsl:when test="$category='projects'">
							<img src="{$theme-prefix}/images/titles/projects.png" alt="Middlesbrough Learning Disability Open Partnership Board" />
						</xsl:when>
						
						<xsl:otherwise>
							<img src="{$theme-prefix}/images/titles/sub_groups.png" alt="Middlesbrough Learning Disability Open Partnership Board" />
						</xsl:otherwise>
					</xsl:choose>
				</a>
			</h2>
			<br class="clear" />
		</div>
	</xsl:template>

</xsl:stylesheet>
