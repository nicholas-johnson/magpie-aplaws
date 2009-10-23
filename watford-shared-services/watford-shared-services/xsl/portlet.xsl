<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:portal="http://www.uk.arsdigita.com/portal/1.0"
  xmlns:portlet="http://www.uk.arsdigita.com/portlet/1.0"
  xmlns:bebop="http://www.arsdigita.com/bebop/1.0"
  xmlns:nav="http://ccm.redhat.com/london/navigation"
  xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
  xmlns:rss="http://purl.org/rss/1.0/"
  version="1.0" exclude-result-prefixes="xsl portal portlet bebop nav">
  
  <xsl:template match="portal:homepageWorkspace[@id='left']">
    <xsl:for-each select="portal:portal/bebop:portlet">
      <xsl:apply-templates select="."/>
      <xsl:apply-templates select="portlet:action"/>
    </xsl:for-each>
    <xsl:apply-templates select="bebop:link"/>
  </xsl:template>
  
  <xsl:template match="portal:homepageWorkspace[@id='middle']">
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
    <div class="content_list">
      <xsl:attribute name="style">background:transparent url(http://www.watford.gov.uk/ext-static/<xsl:value-of select="translate(@title, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ &amp;-_%#@', 'abcdefghijklmnopqrstuvwxyz')" />.png) top right no-repeat;</xsl:attribute>
      <h2><xsl:value-of select="@title" /></h2>
      <xsl:for-each select="nav:objectList/nav:item">
        <h3>
          <a href="{nav:path}">
            <xsl:if test="nav:attribute[@name='newsDate']">
              <strong class="date"><xsl:text> </xsl:text>
                <xsl:call-template name="date">
                  <xsl:with-param name="date">
                    <xsl:value-of select="nav:attribute[@name='newsDate']" />
                  </xsl:with-param>
                </xsl:call-template>
              </strong> - 
            </xsl:if>
            <xsl:value-of select="nav:attribute[@name='title']" />
          </a>
        </h3>
        <p>
          <xsl:if test="nav:attribute[@name='imageAttachments.image.id']">
            <img align="left" style="width:60px; height:60px;" src="{$dispatcher-prefix}/cms-service/stream/image/?image_id={nav:attribute[@name='imageAttachments.image.id']}" alt="nav:attribute[@name='imageAttachments.caption']" />
          </xsl:if>
          
          <xsl:value-of select="nav:attribute[@name='lead']"/>
          <div class="clear">&#160;</div>
        </p>
      </xsl:for-each>
    </div>
  </xsl:template>

  <xsl:template match="bebop:portlet[portlet:contentDirectory]">
    <div class="navigation">
      <a name="nav" class="access">&#160;</a>
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
    </div>
  </xsl:template>
  
  <!-- RSS Feed portlet -->
  <xsl:template match="bebop:portlet[portlet:RSSFeed]">
    <div class="rss_feed">
      <xsl:attribute name="style">background:transparent url(http://www.watford.gov.uk/ext-static/<xsl:value-of select="translate(@title, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ &amp;-_%#@', 'abcdefghijklmnopqrstuvwxyz')" />.png) top right no-repeat;</xsl:attribute>
      <h2>
        <xsl:value-of select="@title" />
      </h2>
      <xsl:for-each select="//item[position() &lt; 10]">
        <h3><a href="{link}"><xsl:value-of select="title" /></a></h3>
        <p><xsl:value-of select="description" /></p>
      </xsl:for-each>
    </div>
  </xsl:template>
  
  <xsl:template match="portlet:loginuser">
    <h2>Welcome <strong><xsl:value-of select="@givenName" />&#xA0;<xsl:value-of select="@familyName" /></strong> </h2>
    <ul>
      <xsl:for-each select="bebop:link">
        <li>
          <xsl:apply-templates select="." />
        </li>
      </xsl:for-each>
      <li>
        <a href="{$dispatcher-prefix}/register/logout" title="Logout">Logout</a>
      </li>
    </ul>
  </xsl:template>
  
</xsl:stylesheet>
