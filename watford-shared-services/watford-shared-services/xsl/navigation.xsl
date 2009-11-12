<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:bebop="http://www.arsdigita.com/bebop/1.0"
    xmlns:aplaws="http://www.arsdigita.com/aplaws/1.0"
    xmlns:ui="http://www.arsdigita.com/ui/1.0"
    xmlns:cms="http://www.arsdigita.com/cms/1.0"
    xmlns:nav="http://ccm.redhat.com/london/navigation"
    exclude-result-prefixes="xsl bebop aplaws ui cms nav">

  <!-- Category Navigation Lists - Full navigation, just outputs the full --> 
  <!-- category menu as found in the xsl. nj20050210 -->
  
  <xsl:template name="catNav" match="nav:categoryMenu">
    <ul class="nav">
      <li class="up">
        <a href="{$dispatcher-prefix}/portal">Home</a>
        <ul>
          <xsl:apply-templates select="/bebop:page/nav:categoryMenu/nav:category/nav:category" />
        </ul>
      </li>
    </ul>
  </xsl:template>
  
  <!-- descend into categories -->
  <xsl:template match="nav:category">
    
      <!-- test to see if item is current category. If it is don't make it a link. 
      Also test to see if you are a child of the what's on category you are not 
      in the past or more than 12 months in the future -->
    <xsl:choose>
      <xsl:when test="@title = 'Staff Directory'">
        <li>
          <a href="http://intranet2/directory/index.aspx"><xsl:value-of select="@title" /></a>
        </li>
      </xsl:when>
      <xsl:when test="@title = 'Have Your Say'">
        <li>
          <a href="{$dispatcher-prefix}/sharedservicesintranet/have-your-say/have-your-say.en"><xsl:value-of select="@title" /></a>
        </li>
      </xsl:when>
      <xsl:when test="@url=/bebop:page/@url">
        <li class="selected">
          <span><xsl:value-of select="@title" /></span>
          <xsl:if test="nav:category">
            <ul class="selected">
              <xsl:apply-templates select="nav:category" />
            </ul>
          </xsl:if>
        </li>
      </xsl:when>
      <!-- If we are viewing the what's on category, only show months in the next year -->
      <xsl:when test="parent::nav:category/@description='WhatsOnCategory'">
        <xsl:variable name="currentMonth" select="( /bebop:page/ui:nowDateTime/monthNo + 1 ) + ( /bebop:page/ui:nowDateTime/year * 12 )" />
        <xsl:variable name="navMonth" select="substring-before(@description, '.') + ( substring-after(@description, '.') * 12 )" />
        <xsl:variable name="monthProximity" select="$navMonth - $currentMonth" />
        <xsl:if test="$monthProximity &gt; -1 and $monthProximity &lt; 13">
          <li>
            <xsl:if test="@isSelected='true'">
              <xsl:attribute name="class">up</xsl:attribute>
            </xsl:if>
            <a href="{@url}">
              <xsl:value-of select="@title" />
            </a>
            
            <xsl:if test="nav:category">
              <ul class="selected">
                <xsl:apply-templates select="nav:category" />
              </ul>
            </xsl:if>
          </li>
        </xsl:if>
      </xsl:when>
      <xsl:otherwise>
        <li>
          <xsl:if test="@isSelected='true'">
            <xsl:attribute name="class">up</xsl:attribute>
          </xsl:if>
          <a href="{@url}">
            <xsl:value-of select="@title" />
          </a>
          
          <xsl:if test="nav:category">
            <ul class="selected">
              <xsl:apply-templates select="nav:category" />
            </ul>
          </xsl:if>
        </li>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>
