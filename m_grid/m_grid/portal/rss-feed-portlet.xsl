<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:admin="http://www.arsdigita.com/admin-ui/1.0"
  xmlns:bebop="http://www.arsdigita.com/bebop/1.0"
  xmlns:portal="http://www.uk.arsdigita.com/portal/1.0"
  xmlns:portlet="http://www.uk.arsdigita.com/portlet/1.0"
	xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
  xmlns:rss="http://purl.org/rss/1.0/"
  xmlns:backslash="http://slashdot.org/backslash.dtd"
	exclude-result-prefixes="xsl admin bebop portal portlet rdf rss backslash"
	version="1.0">

  <xsl:template match="portlet:RSSFeed">
    <div class="RSS">
	<h2><xsl:value-of select="../@title"/></h2>
	<xsl:apply-templates select="rdf:RDF"/>
    <xsl:apply-templates select="rss:rss"/>
    <xsl:apply-templates select="rss"/>
    <xsl:apply-templates select="portlet:RSSFeedError"/>
	</div>
  </xsl:template>

  <xsl:template match="portlet:RSSFeedError">
    <div>
      <xsl:value-of select="." disable-output-escaping="no"/>
    </div>
  </xsl:template>

  <xsl:template match="rss">
    <xsl:param name="maxItems" select="10"/>
    <xsl:apply-templates select="channel">
      <xsl:with-param name="maxItems" select="$maxItems"/>
    </xsl:apply-templates>
  </xsl:template>
  
  <xsl:template match="rss:rss">
    <xsl:param name="maxItems" select="10"/>
    <xsl:apply-templates select="rss:channel">
      <xsl:with-param name="maxItems" select="$maxItems"/>
    </xsl:apply-templates>
  </xsl:template>

  <xsl:template match="rdf:RDF">
    <xsl:param name="maxItems" select="10"/>
    <xsl:apply-templates select="rss:channel" />
    <xsl:for-each select="rss:item[$maxItems > position()]">
      <dl>
        <xsl:apply-templates select="."/>
      </dl>
    </xsl:for-each>
  </xsl:template>
  
  <xsl:template match="rss:channel">
    <xsl:param name="maxItems" select="10"/>
    <a><xsl:attribute name="href"><xsl:value-of select="rss:link"/></xsl:attribute><xsl:value-of select="rss:title"/></a>
    <!-- backwards compatability with old rss format -->
    <xsl:for-each select="rss:item[$maxItems > position()]">
      <dl>
        <xsl:apply-templates select="."/>
      </dl>
    </xsl:for-each>
  </xsl:template>
    
  <xsl:template match="rss:item">
    <dt>
        <a><xsl:attribute name="href"><xsl:value-of select="rss:link"/></xsl:attribute><xsl:value-of select="rss:title"/></a>
    </dt>
    <dd>
      <xsl:value-of select="rss:description"/>
    </dd>
  </xsl:template>
  
  
  <xsl:template match="channel">
    <xsl:param name="maxItems" select="10"/>
    <a><xsl:attribute name="href"><xsl:value-of select="link"/></xsl:attribute><xsl:value-of select="title"/></a>
    <!-- backwards compatability with old rss format -->
    <xsl:for-each select="item[$maxItems > position()]">
      <dl>
        <xsl:apply-templates select="."/>
      </dl>
    </xsl:for-each>
  </xsl:template>
    
  <xsl:template match="item">
    <dt>
        <a><xsl:attribute name="href"><xsl:value-of select="link"/></xsl:attribute><xsl:value-of select="title"/></a>
    </dt>
    <dd>
      <xsl:value-of select="description"/>
    </dd>
  </xsl:template>

</xsl:stylesheet>
