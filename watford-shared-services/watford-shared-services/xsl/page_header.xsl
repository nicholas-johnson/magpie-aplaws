<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:ui="http://www.arsdigita.com/ui/1.0"
    xmlns:bebop="http://www.arsdigita.com/bebop/1.0"
    xmlns:portal="http://www.uk.arsdigita.com/portal/1.0"
    xmlns:cms="http://www.arsdigita.com/cms/1.0"
    xmlns:nav="http://ccm.redhat.com/london/navigation"
		xmlns:search="http://rhea.redhat.com/search/1.0"
    xmlns:atoz="http://xmlns.redhat.com/atoz/1.0"
    xmlns:terms="http://xmlns.redhat.com/london/terms/1.0"
    exclude-result-prefixes="xsl ui bebop portal cms nav atoz terms">
    
  <xsl:template name="pageHeader">
    <div class="login">
      <xsl:choose>
        <xsl:when test="//ui:userBanner/@screenName">
          welcome: <xsl:value-of select="//ui:userBanner/@screenName" /> - 
          <a href="{$dispatcher-prefix}/content-center">content center</a> -
          <a href="{//ui:userBanner/@logoutURL}">logout</a>
        </xsl:when>
        <xsl:otherwise>
          <a href="{//ui:userBanner/@loginExcursionURL}">login</a>
        </xsl:otherwise>
      </xsl:choose>
    </div>
    <div class="clear">&#160;</div>
    <div id="header">
      <div class="title">
        <h1>
          <a href="{$dispatcher-prefix}"> 
            Shared Services Intranet
          </a>
        </h1>
        <div class="strap">
          Shared working between Three Rivers District Council and Watford Borough Council
        </div>
      </div>
      <div class="clear">&#160;</div>
    </div>
  </xsl:template>
  
  <xsl:template name="atozLetter">
    <xsl:param name="letter" />
    <li>
      <a href="{$dispatcher-prefix}/atoz?letter={$letter}">
        <xsl:if test="//atoz:atoz/atoz:letter[.=$letter]/@isSelected">
          <xsl:attribute name="class">selected</xsl:attribute>
        </xsl:if>
        <span>
          <xsl:value-of select="$letter" />
        </span>
      </a>
    </li>
  </xsl:template>
  
  
</xsl:stylesheet>
