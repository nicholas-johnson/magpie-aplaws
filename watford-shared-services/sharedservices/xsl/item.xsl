<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ui="http://www.arsdigita.com/ui/1.0" xmlns:bebop="http://www.arsdigita.com/bebop/1.0" xmlns:portal="http://www.uk.arsdigita.com/portal/1.0" xmlns:cms="http://www.arsdigita.com/cms/1.0" xmlns:nav="http://ccm.redhat.com/london/navigation" version="1.0" exclude-result-prefixes="xsl ui bebop portal cms nav"><!--
Copyright (C) 2004-2005 Runtime Collective Ltd. All Rights Reserved.

This library is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public License
as published by the Free Software Foundation; either version 2.1 of
the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with this library; if not, write to the Free Software
Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA

-->

	<!-- Content type templates
		look for the most specific match on
	 cms:item TJB-RC-20040619 -->


	<!-- Default template -->
	<!-- 	Just output whatever we find (apart from metatdata and things specifically output) -->
	<xsl:template match="cms:item">
		<xsl:call-template name="itemHead" />
		<div class="item default">
			<xsl:if test="(description) or (lead) or (summary)">
			    <div class="lead">
				    <xsl:if test="description">
					    <p><xsl:value-of select="description" disable-output-escaping="yes" /></p>
				    </xsl:if>
				    <xsl:if test="lead">
					    <p><xsl:value-of select="lead" disable-output-escaping="yes" /></p>
				    </xsl:if>
				    <xsl:if test="summary">
					    <p><xsl:value-of select="summary" disable-output-escaping="yes" /></p>
				    </xsl:if>
			    </div><!-- /lead -->
			</xsl:if>
			<div class="itemContent">
				<xsl:apply-templates select="imageCaptions" />
				<xsl:apply-templates select="imageAttachments" />
				<xsl:value-of disable-output-escaping="yes" select="./textAsset/content" />
				<!-- filter out things we've already shown and 'meta' information -->
				<xsl:for-each select="*[      not(name()='name')       and       not(name()='language')      and       not(name()='objectType')      and       not(name()='type')      and       not(name()='title')      and       not(name()='launchDate')      and       not(name()='imageCaptions')      and       not(name()='imageAttachments')      and       not(name()='textAsset')      and       not(name()='description')      and       not(name()='lead')      and       not(name()='summary')     ]">
					<p><xsl:apply-templates select="." /></p>
				</xsl:for-each>
			</div>			
			<div class="clear">&#160;</div>
		</div>
	</xsl:template>

	<!-- Standard Article and News item template -->
	<xsl:template match="cms:item[   objectType='com.arsdigita.cms.contenttypes.Article'   or   objectType='com.arsdigita.cms.contenttypes.NewsItem'  ]">
		<xsl:call-template name="itemHead" />
		<xsl:if test="description or lead or summary or textAsset/content or imageAttachments or imageCaptions">
			<div class="item news">
				<xsl:if test="description or lead or summary">
				    <div class="lead">
					    <xsl:if test="description">
						    <p><xsl:value-of select="description" disable-output-escaping="yes" /></p>
					    </xsl:if>
					    <xsl:if test="lead">
						    <p><xsl:value-of select="lead" disable-output-escaping="yes" /></p>
					    </xsl:if>
					    <xsl:if test="summary">
						    <p><xsl:value-of select="summary" disable-output-escaping="yes" /></p>
					    </xsl:if>
				    </div><!-- /lead -->
				</xsl:if>
				<xsl:if test="textAsset/content or imageAttachments or imageCaptions">
					<div class="itemContent">
						<xsl:apply-templates select="imageCaptions" />
						<xsl:apply-templates select="imageAttachments" />
						<xsl:value-of disable-output-escaping="yes" select="./textAsset/content" />
					</div><!-- /itemContent -->
				</xsl:if>
				<div class="clear">&#160;</div>
			</div>
		</xsl:if>
	</xsl:template>


	<!-- First part of the template for multi part article, draws in the "meta" info at the top
	of the page -->
	<xsl:template match="cms:item[objectType='com.arsdigita.cms.contenttypes.MultiPartArticle']">
		<xsl:call-template name="itemHead" />
		<div class="item mpa">
			<xsl:apply-templates select="imageCaptions" />
			<xsl:apply-templates select="imageAttachments" />
			<xsl:if test="(description) or (lead) or (summary)">
			    <div class="lead">
				    <xsl:if test="description">
					    <p><xsl:value-of select="description" disable-output-escaping="yes" /></p>
				    </xsl:if>
				    <xsl:if test="lead">
					    <p><xsl:value-of select="lead" disable-output-escaping="yes" /></p>
				    </xsl:if>
				    <xsl:if test="summary">
					    <p><xsl:value-of select="summary" disable-output-escaping="yes" /></p>
				    </xsl:if>
			    </div>
			</xsl:if>
			<div class="mpaSections">
				<ul>
				<xsl:for-each select="sections">
					<xsl:sort select="rank" data-type="number" />
					<xsl:variable name="currentRank" select="./rank" />
					<xsl:variable name="prevRank" select="number($currentRank -1)" />
					<xsl:variable name="Page" select="count(../sections[./pageBreak ='true' and ./rank &lt; $currentRank]) + 1" />
					<xsl:variable name="prevPage" select="count(../sections[./pageBreak ='true' and ./rank &lt; $prevRank]) + 1" />
					<xsl:variable name="internalRank" select="count(../sections[./pageBreak ='false' and ./rank &lt; $currentRank]) + 1" />
					<li>
					<xsl:if test="position()=last()">
						<xsl:attribute name="class">last</xsl:attribute>
					</xsl:if>
					<xsl:if test="position()=1">
						<xsl:attribute name="class">first</xsl:attribute>
					</xsl:if>

					<xsl:choose>
						<xsl:when test="@oid = ../../../cms:articleSectionPanel/cms:item[position() = 1]/@oid">
							<a href="#internalSection{$internalRank}">
									<xsl:if test="position()=last()">
										<xsl:attribute name="class">last</xsl:attribute>
									</xsl:if>
									<xsl:attribute name="title">Jump to <xsl:value-of select="title" /></xsl:attribute>
								<xsl:value-of select="title" />
							</a>
						</xsl:when>
						<xsl:when test="@oid = ../../../cms:articleSectionPanel/cms:item[position() != 1]/@oid">
							<a>
									<xsl:if test="position()=last()">
										<xsl:attribute name="class">last</xsl:attribute>
									</xsl:if>
									<xsl:attribute name="href">#internalSection<xsl:value-of select="$internalRank" /></xsl:attribute>
								<xsl:attribute name="title">Jump to <xsl:value-of select="title" /></xsl:attribute>
								<xsl:value-of select="title" />
							</a>
						</xsl:when>
						<xsl:when test="@oid = ../../../nav:greetingItemExtraXML/cms:articleSectionPanel/cms:item[position() = 1]/@oid">
							<a href="#internalSection{$internalRank}">
									<xsl:if test="position()=last()">
										<xsl:attribute name="class">last</xsl:attribute>
									</xsl:if>
									<xsl:attribute name="title">Jump to <xsl:value-of select="title" /></xsl:attribute>
								<xsl:value-of select="title" />
							</a>
						</xsl:when>
						<xsl:when test="@oid = ../../../nav:greetingItemExtraXML/cms:articleSectionPanel/cms:item[position() != 1]/@oid">
							<a>
									<xsl:if test="position()=last()">
										<xsl:attribute name="class">last</xsl:attribute>
									</xsl:if>
									<xsl:attribute name="href">#internalSection<xsl:value-of select="$internalRank" /></xsl:attribute>
								<xsl:attribute name="title">Jump to <xsl:value-of select="title" /></xsl:attribute>
								<xsl:value-of select="title" />
							</a>
						</xsl:when>
						<xsl:when test="($Page = $prevPage) and $Page!='1'">
							<a>
									<xsl:if test="position()=last()">
										<xsl:attribute name="class">last</xsl:attribute>
									</xsl:if>
									<xsl:attribute name="href">?page=<xsl:value-of select="$Page" />#internalSection<xsl:value-of select="$internalRank" /></xsl:attribute>
								<xsl:attribute name="title">Jump to <xsl:value-of select="title" /></xsl:attribute>
								<xsl:value-of select="title" />
							</a>
						</xsl:when>
						<xsl:otherwise>
							<a href="?page={$Page}" title="page{$Page}">
								<xsl:if test="position()=last()">
									<xsl:attribute name="class">last</xsl:attribute>
								</xsl:if>
								<xsl:attribute name="title">Jump to <xsl:value-of select="title" /></xsl:attribute>
								<xsl:value-of select="title" />
							</a>
						</xsl:otherwise>
					</xsl:choose>
					</li>
				</xsl:for-each>
				</ul>
			</div>
			<div class="clear">&#160;</div>
			
			<xsl:call-template name="pageDirection" />
			<div class="clear">&#160;</div>
		</div><!-- /item -->
	</xsl:template>
	
	<!-- Main template for 'multi-article' draws in the 'body' parts
			(see also cms:articleSectionPanel) TJB-RC-20040619 -->
	<xsl:template match="cms:item[objectType='com.arsdigita.cms.contenttypes.ArticleSection']">
		<div class="itemContent mpaContent">
			<h3><xsl:value-of select="title" /></h3>
			<xsl:for-each select="image">
				<xsl:call-template name="image"><xsl:with-param name="image" select="." /></xsl:call-template>
			</xsl:for-each>
			<xsl:value-of disable-output-escaping="yes" select="text/content" />
			<xsl:for-each select="fileAttachments">
				<xsl:call-template name="fileAttachments"><xsl:with-param name="file" select="." /></xsl:call-template>
			</xsl:for-each>
			<div class="clear">&#160;</div>
		</div>
	</xsl:template>

	<!-- File storage item -->
	<xsl:template match="cms:item[objectType='com.arsdigita.cms.contenttypes.FileStorageItem']">
		<xsl:param name="simpleDownloadTimes" /> <!-- displays some simple download times guidelines. -->
		<xsl:param name="adobeLink" /> <!-- displays a link to adobe acrobat if file is a pdf. -->
		<xsl:param name="downloadTable" /> <!-- displays a table of download times. -->
		<xsl:call-template name="itemHead" />
		<div class="item fileStorageItem">
			<xsl:apply-templates select="imageCaptions" />
			<xsl:apply-templates select="imageAttachments" />
			<xsl:if test="description or lead or summary">
				<div class="lead">
					<xsl:if test="description">
						<p><xsl:value-of select="description" disable-output-escaping="yes" /></p>
					</xsl:if>
					<xsl:if test="lead">
						<p><xsl:value-of select="lead" disable-output-escaping="yes" /></p>
					</xsl:if>
					<xsl:if test="summary">
						<p><xsl:value-of select="summary" disable-output-escaping="yes" /></p>
					</xsl:if>
				</div><!-- /lead -->
			</xsl:if>
			<div class="itemContent">
				<xsl:call-template name="fileAttachments">
					<xsl:with-param name="file" select="file" />
					<xsl:with-param name="simpleDownloadTimes" select="$simpleDownloadTimes" />
					<xsl:with-param name="adobeLink" select="$adobeLink" />
					<xsl:with-param name="downloadTable" select="$downloadTable" />
				</xsl:call-template>
				<xsl:value-of disable-output-escaping="yes" select="./textAsset/content" />
			</div><!-- /itemContent -->
		</div><!-- /item -->
	</xsl:template>

</xsl:stylesheet>
