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
		
	<xsl:template name="contact_us_page">
    <html lang="en">
      <head>
        <title><xsl:call-template name="councilName" /><xsl:call-template name="htmlTitleBuilder" /></title>
        <xsl:call-template name="metaData"/>
        <xsl:call-template name="css" />
        <xsl:call-template name="contact_us_css" />
        <xsl:call-template name="javascript" />
      </head>
      <body>
        <div id="wrapper">
          <xsl:call-template name="accessLinks" />
          <xsl:call-template name="pageHeader" />
          <xsl:call-template name="topLinks" />
          <xsl:call-template name="contact_us_content" />
          <div class="clear">&#160;</div>
          <xsl:call-template name="pageFooter" />
        </div>
      </body>
    </html>
	</xsl:template>
	
	<xsl:template name="contact_us_content">
    <div class="top_row">
      <a name="content" class="access">&#160;</a>
      <div class="main">
        <div class="content_wrapper">
          <div class="content">
            <xsl:if test="//cms:contentPanel//imageAttachments[useContext='title']">
              <h1>
                <img src="{$dispatcher-prefix}/cms-service/stream/image/?image_id={//cms:contentPanel//imageAttachments[useContext='title']//id}" alt="{//cms:contentPanel//imageAttachments[useContext='title']//description}" />
              </h1>
            </xsl:if>
            <xsl:value-of select="//cms:articleSectionPanel/cms:item[title='main']/text/content" disable-output-escaping="yes" />
          </div>
        </div>
      </div>
      <div class="links">
        <div class="content_wrapper">
          <div class="content">
            <!-- form id="search">
              <fieldset>
                <input type="text" class="search" value="search" />
                <input type="submit" class="submit" value="search" />
              </fieldset>
            </form -->
            <h2><img src="{$theme-prefix}/images/titles/useful_links.png" alt="Useful Links" /></h2>
            <ul>&#160;
              <xsl:for-each select="//cms:item//links">
                <li>
                  <xsl:if test="targetType='internalLink'">
                    <xsl:variable name="uri">/redirect/?oid=<xsl:call-template name="url-encode"><xsl:with-param name="str" select="targetItem/@oid" /></xsl:call-template></xsl:variable>
                    <xsl:variable name="text"><xsl:value-of select="linkTitle" /></xsl:variable>
                    <xsl:variable name="title"><xsl:value-of select="linkDescription" /></xsl:variable>
                    <a href="{$uri}" title="{$title}">
                      <xsl:value-of select="$text" />
                    </a>
                  </xsl:if>
                  <xsl:if test="targetType='externalLink'">
                    <xsl:variable name="uri"><xsl:value-of select="targetURI"/></xsl:variable>
                    <xsl:variable name="text"><xsl:value-of select="linkTitle" /></xsl:variable>
                    <xsl:variable name="title">Go to external website - <xsl:value-of select="linkDescription" /></xsl:variable>
                    <xsl:variable name="newPage">true</xsl:variable>
                    <a href="{$uri}" title="{$title}">
                      <xsl:value-of select="$text" />
                    </a>
                  </xsl:if>
                </li>
              </xsl:for-each>
            </ul>
          </div>
        </div>
      </div>
      <div class="clear">&#160;</div>
    </div>
    
    <div class="bottom_row">
      <div class="contact_block phone">
        <div class="content_wrapper">
          <div class="content">
            <xsl:value-of select="//cms:articleSectionPanel/cms:item[title='phone']/text/content" disable-output-escaping="yes" />
          </div>
        </div>
      </div>
      <div class="contact_block write">
        <div class="content_wrapper">
          <div class="content">
            <xsl:value-of select="//cms:articleSectionPanel/cms:item[title='write']/text/content" disable-output-escaping="yes" />
          </div>
        </div>
      </div>
      <div class="contact_block visit">
        <div class="content_wrapper">
          <div class="content">
            <xsl:value-of select="//cms:articleSectionPanel/cms:item[title='visit']/text/content" disable-output-escaping="yes" />
          </div>
        </div>
      </div>
    </div>
  </xsl:template>
	
	<xsl:template name="contact_us_css">
	  <link rel="stylesheet" href="{$theme-prefix}/stylesheets/contact_us_page.css" type="text/css" />
    <link rel="stylesheet" href="{$theme-prefix}/stylesheets/navigation_page.css" type="text/css" />
	</xsl:template>
	
</xsl:stylesheet>