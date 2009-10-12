<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
 xmlns:bebop="http://www.arsdigita.com/bebop/1.0"
 xmlns:cms="http://www.arsdigita.com/cms/1.0" 
 xmlns:nav="http://ccm.redhat.com/london/navigation" 
 exclude-result-prefixes="xsl bebop cms nav" >

  <!-- Adds the 'Related items, links and downloads in the right hand column -->
  <xsl:template name="links">
    <xsl:param name="item" />
    <xsl:if test="(count($item/links) > 0) or (count(/bebop:page/nav:relatedItems/nav:relatedItem) > 0) or (count($item/fileAttachments) > 0)">
      <div class="relatedItems">
        <ul>
          <xsl:call-template name="relatedLinks">
            <xsl:with-param name="item" select="$item" />
          </xsl:call-template>
          <xsl:call-template name="downloads">
            <xsl:with-param name="item" select="$item" />
          </xsl:call-template>
          <xsl:call-template name="relatedItems">
            <xsl:with-param name="item" select="$item"/>
          </xsl:call-template>
        </ul>
      </div>
    </xsl:if>
  </xsl:template>

  
  <xsl:template name="relatedLinks">
    <xsl:param name="item" />
    <xsl:for-each select="$item/links[targetType='internalLink']">
      <xsl:sort select="linkOrder"/>
      <xsl:if test="targetItem/@oid"><!-- check that the linked to item is published -->
        <li class="internal">
          <xsl:variable name="uri">/redirect/?oid=<xsl:call-template name="url-encode"><xsl:with-param name="str" select="targetItem/@oid" /></xsl:call-template></xsl:variable>
          <xsl:variable name="title"><xsl:value-of select="linkTitle" /></xsl:variable>
          <xsl:variable name="description"><xsl:value-of select="linkDescription" /></xsl:variable>
          <a href="{$uri}"><xsl:value-of select="$title" /></a><xsl:if test="not($description = '')"> - <xsl:value-of select="$description" /></xsl:if>
        </li>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>
  
  <xsl:template name="externalLinks">
  <xsl:param name="item" />
    <xsl:if test="count($item/links[targetType='externalLink']) > 0">
      <div class="related">
        <h2><span>External links</span></h2>
        <div class="related-content">
          <p class="disclaimer"><xsl:call-template name="councilName" /> is not responsible for the content of external websites.</p>
          <ul>
            <xsl:for-each select="$item/links[targetType='externalLink']">
              <xsl:sort select="linkOrder"/>
              <li class="external">
                <xsl:variable name="uri"><xsl:value-of select="targetURI"/></xsl:variable>
                <xsl:variable name="title"><xsl:value-of select="linkTitle" /></xsl:variable>
                <xsl:variable name="tip">Go to external website: <xsl:value-of select="linkTitle" /></xsl:variable>
                <xsl:variable name="description"><xsl:value-of select="linkDescription" /></xsl:variable>
                <xsl:variable name="newPage">true</xsl:variable>
                <a href="{$uri}" title="{$tip}"><xsl:value-of select="$title" /></a><xsl:if test="not($description = '')"> - <xsl:value-of select="$description" /></xsl:if>
              </li>
            </xsl:for-each>
          </ul>
        </div>
      </div>
    </xsl:if>
  </xsl:template>
  
  
  <xsl:template name="relatedItems">
    <xsl:if test="count(/bebop:page/nav:relatedItems/nav:relatedItem) > 0">
      <div class="related">
        <h2><span>Related Items</span></h2>
        <div class="related-content">
          <ul>
            <xsl:for-each select="/bebop:page/nav:relatedItems/nav:relatedItem">
              <li class="internal">
                <xsl:variable name="uri"><xsl:value-of select="@path"/></xsl:variable>
                <xsl:variable name="title"><xsl:value-of select="@title" /></xsl:variable>
                <a href="{$uri}"><xsl:value-of select="$title" /></a>
              </li>
            </xsl:for-each>
          </ul>
        </div>
      </div>
    </xsl:if>
  </xsl:template>
  
  
  <xsl:template name="downloads">
    <xsl:param name="item" />
    <xsl:if test="count($item/fileAttachments) > 0">
      <div class="related">
        <h2><span>Downloads</span></h2>
        <div class="related-content">
          <ul>
            <xsl:for-each select="$item/fileAttachments">
              <li class="download">
                <xsl:if test="contains(name,'.pdf')">
                  <xsl:attribute name="class">pdf</xsl:attribute>
                </xsl:if>
                <a href="{$dispatcher-prefix}/cms-service/download/asset/?asset_id={id}">
                  <xsl:value-of select="translate(name, '-_', '  ')" />
                </a>
                <xsl:if test="description">
                  <xsl:text> - </xsl:text><xsl:value-of select="description" disable-output-escaping="yes"/>
                </xsl:if>
                <xsl:text> </xsl:text>(<xsl:value-of select="round(length div 1024)" />&#160;K)
              </li>
            </xsl:for-each>
          </ul>
        </div>
      </div>
    </xsl:if>
  </xsl:template>
  
</xsl:stylesheet>
