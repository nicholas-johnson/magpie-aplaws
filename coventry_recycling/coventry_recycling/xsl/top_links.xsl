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
    
    <xsl:variable name="blue_bin_path">/navigation/blue-bin</xsl:variable>
    <xsl:variable name="brown_bin_path">/navigation/brown-bin</xsl:variable>
    <xsl:variable name="green_bin_path">/navigation/green-bin</xsl:variable>
    <xsl:variable name="contact_path">/content/contact</xsl:variable>
    
    <ul class="top_links">
      <li>
        <a href="{$dispatcher-prefix}">
          <img src="{$theme-prefix}/images/top_nav/home_off.png" alt="Home" class="rollover" />
        </a>
      </li>
      <li>
        <a href="{$dispatcher-prefix}{$blue_bin_path}">
          <xsl:choose>
            <xsl:when test="/bebop:page[@application='navigation']/nav:categoryPath/nav:category[@title='Blue Bin']">
              <img src="{$theme-prefix}/images/top_nav/blue_bin_over.png" alt="Blue Bin" />
            </xsl:when>
            <xsl:otherwise>
              <img src="{$theme-prefix}/images/top_nav/blue_bin_off.png" alt="Blue Bin" class="rollover" />
            </xsl:otherwise>
          </xsl:choose>
        </a>
      </li>
      <li>
        <a href="{$dispatcher-prefix}{$brown_bin_path}">
          <xsl:choose>
            <xsl:when test="/bebop:page[@application='navigation']/nav:categoryPath/nav:category[@title='Brown Bin']">
          <img src="{$theme-prefix}/images/top_nav/brown_bin_over.png" alt="Brown Bin" />
            </xsl:when>
            <xsl:otherwise>
          <img src="{$theme-prefix}/images/top_nav/brown_bin_off.png" alt="Brown Bin" class="rollover" />
            </xsl:otherwise>
          </xsl:choose>
        </a>
      </li>
      <li>
        <a href="{$dispatcher-prefix}{$green_bin_path}">
          <xsl:choose>
            <xsl:when test="/bebop:page[@application='navigation']/nav:categoryPath/nav:category[@title='Green Bin']">
          <img src="{$theme-prefix}/images/top_nav/green_bin_over.png" alt="Green Bin" />
            </xsl:when>
            <xsl:otherwise>
          <img src="{$theme-prefix}/images/top_nav/green_bin_off.png" alt="Green Bin" class="rollover" />
            </xsl:otherwise>
          </xsl:choose>
        </a>
      </li>
      <li>
        <a href="{$dispatcher-prefix}{$contact_path}">
          <xsl:choose>
            <xsl:when test="/bebop:page[@application='content']//cms:item/name='contact'">
              <img src="{$theme-prefix}/images/top_nav/contact_over.png" alt="Contact" />
            </xsl:when>
            <xsl:otherwise>
              <img src="{$theme-prefix}/images/top_nav/contact_off.png" alt="Contact" class="rollover" />
            </xsl:otherwise>
          </xsl:choose>
        </a>
      </li>
    </ul>
  </xsl:template>
  
</xsl:stylesheet>