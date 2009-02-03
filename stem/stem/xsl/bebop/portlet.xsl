<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:portal="http://www.uk.arsdigita.com/portal/1.0"
		xmlns:portlet="http://www.uk.arsdigita.com/portlet/1.0"
		xmlns:bebop="http://www.arsdigita.com/bebop/1.0"
		xmlns:nav="http://ccm.redhat.com/london/navigation"
		exclude-result-prefixes="xsl portal portlet bebop nav">
	
	
	<xsl:template match="portal:homepageWorkspace[@id='left']">
		<xsl:for-each select="portal:portal/bebop:portlet">
			<xsl:apply-templates select="." />
			<xsl:apply-templates select="portlet:action" />
		</xsl:for-each>
		<xsl:apply-templates select="bebop:link" />
	</xsl:template>
	
	<xsl:template match="portal:homepageWorkspace[@id='right']">
		<xsl:for-each select="portal:portal/bebop:portlet">
			<xsl:apply-templates select="." />
			<xsl:apply-templates select="portlet:action" />
		</xsl:for-each>
		<xsl:apply-templates select="bebop:link" />
	</xsl:template>
	
	<xsl:template match="bebop:portlet[nav:objectList]">
		<div class="feature">
			<xsl:choose>
				
				<xsl:when test="attribute::title='TextTicker'">
					<form id="tickform" name="tickform">
						<textarea id="tickfield" name="tickfield" rows="6" cols="48" wrap="hard" scrolling="no">The latest news will appear here when the page has finished loading. If the news is not displayed you may be using a browser which does not support javascript, or you may have javascript disabled. If this is the case you can <a href="#">click here to go to the news section</a>.</textarea>
					</form>
				</xsl:when>
				
				<xsl:when test="parent::portal:portal/attribute::title='Middle'">
					<xsl:for-each select="nav:objectList/nav:item">
						<div class="featuredArticle">
							<xsl:if test="nav:attribute[@name='imageCaptions.imageAsset.id'] and nav:attribute[@name='imageCaptions.caption']">
								<img>
									<xsl:attribute name="src">
										<xsl:value-of select="$dispatcher-prefix"/>/cms-service/stream/image/?image_id=<xsl:value-of select="nav:attribute[@name='imageCaptions.imageAsset.id']" />
									</xsl:attribute>
									<xsl:attribute name="alt">
										<xsl:value-of select="nav:attribute[@name='imageCaptions.caption']" />
									</xsl:attribute>
								</img>
							</xsl:if>
							<xsl:if test="nav:attribute[@name='imageAttachments.image.id'] and nav:attribute[@name='imageAttachments.caption']">
								<img>
									<xsl:attribute name="src">
										<xsl:value-of select="$dispatcher-prefix"/>/cms-service/stream/image/?image_id=<xsl:value-of select="nav:attribute[@name='imageAttachments.image.id']" />
									</xsl:attribute>
									<xsl:attribute name="alt">
										<xsl:value-of select="nav:attribute[@name='imageAttachments.caption']" />
									</xsl:attribute>
								</img>
							</xsl:if>
							
							<div class="item">
								<xsl:if test="nav:attribute[@name='title']">
									<xsl:choose>
										<xsl:when test="nav:path and nav:attribute[@name='title']">
											<h2>
												<a href="{nav:path}" class="more">
													<xsl:attribute name="title">
											More details about: <xsl:value-of select="nav:attribute[@name='title']"/>
													</xsl:attribute>
													<xsl:value-of select="nav:attribute[@name='title']"/>
												</a>
											</h2>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="nav:attribute[@name='title']"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								<xsl:if test="nav:attribute[@name='lead']">
									<br/>
									<xsl:value-of select="nav:attribute[@name='lead']"/>
								</xsl:if>
								<xsl:if test="nav:attribute[@name='description']">
									<br/>
									<xsl:value-of select="nav:attribute[@name='description']"/>
								</xsl:if>
								<xsl:text>    </xsl:text>
								<a>
									<xsl:attribute name="href">
										<xsl:value-of select="nav:path"/>
									</xsl:attribute>
									<xsl:attribute name="class">more</xsl:attribute>
									<xsl:attribute name="title">
										<xsl:value-of select="nav:attribute[@name='title']"/>
									</xsl:attribute>
									Read&#160;more
								</a>
							</div>
							<div class="clear">&#160;</div>
						</div>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<xsl:if test="nav:objectList/nav:item">
						<ul>
							<xsl:for-each select="nav:objectList/nav:item">
								<li>
									<a href="{nav:path}">
										<xsl:attribute name="title">
										More details about: <xsl:value-of select="nav:attribute[@name='title']"/>
										</xsl:attribute>
										<xsl:value-of select="nav:attribute[attribute::name='title']" />
									</a>
								</li>
							</xsl:for-each>
						</ul>
						<xsl:if test="attribute::title='Press Releases'">
							<a href="/press" class="more">More</a>
						</xsl:if>
					</xsl:if>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:template>
	
	<!-- The Content Directory portlet to display the content directory on the homepage
	Overrides the rc-core content directory portlet NJ20040127 -->
	<xsl:template match="bebop:portlet[portlet:contentDirectory]">
		<h2><span>Navigation</span></h2>
		<ul>
			<xsl:for-each select="portlet:contentDirectory/portlet:contentDirectoryEntry">
				<xsl:sort select="@name"/>
				<li>
					<xsl:attribute name="class"><xsl:value-of select="translate(@name, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ ,.:;()+-&amp;', 'abcdefghijklmnopqrstuvwxyz')"/></xsl:attribute>
					<a>
						<xsl:attribute name="href"><xsl:value-of select="@url" /></xsl:attribute>
						<xsl:value-of select="@name"/>
					</a>
				</li>
			</xsl:for-each>
		</ul>
	</xsl:template>

	<xsl:template match="bebop:portlet/portlet:contentItem">
		Rudi!!!!
	</xsl:template>


</xsl:stylesheet>
