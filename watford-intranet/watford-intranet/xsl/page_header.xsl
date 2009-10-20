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
            Staff Intranet
          </a>
        </h1>
        <div class="strap">
          <a href="http://www.watford.gov.uk">Watford Borough Council</a>
        </div>
      </div>
      <div class="search">
        <form method="get" action="{$dispatcher-prefix}/search">
          <label for="terms">Search for: </label>
          <input class="search_field" id="terms" name="terms">
            <xsl:choose>
              <xsl:when test="//search:query/search:terms">
                <xsl:attribute name="value">
                  <xsl:value-of select="//search:query/search:terms/@value" />
                </xsl:attribute>
              </xsl:when>
              <xsl:otherwise>
                <xsl:attribute name="value">
                  <xsl:text>search</xsl:text>
                </xsl:attribute>
              </xsl:otherwise>
            </xsl:choose>
          </input>
          <input type="submit" name="Submit" id="basicSearchGo" value="Search" class="adgo" />
          <xsl:apply-templates select="bebop:pageState" />
        </form>
      </div>
      <div class="atoz">
        <ul>
          <xsl:call-template name="atozLetter">
            <xsl:with-param name="letter">a</xsl:with-param>
          </xsl:call-template>
          <xsl:call-template name="atozLetter">
            <xsl:with-param name="letter">b</xsl:with-param>
          </xsl:call-template>
          <xsl:call-template name="atozLetter">
            <xsl:with-param name="letter">c</xsl:with-param>
          </xsl:call-template>
          <xsl:call-template name="atozLetter">
            <xsl:with-param name="letter">d</xsl:with-param>
          </xsl:call-template>
          <xsl:call-template name="atozLetter">
            <xsl:with-param name="letter">e</xsl:with-param>
          </xsl:call-template>
          <xsl:call-template name="atozLetter">
            <xsl:with-param name="letter">f</xsl:with-param>
          </xsl:call-template>
          <xsl:call-template name="atozLetter">
            <xsl:with-param name="letter">g</xsl:with-param>
          </xsl:call-template>
          <xsl:call-template name="atozLetter">
            <xsl:with-param name="letter">h</xsl:with-param>
          </xsl:call-template>
          <xsl:call-template name="atozLetter">
            <xsl:with-param name="letter">i</xsl:with-param>
          </xsl:call-template>
          <xsl:call-template name="atozLetter">
            <xsl:with-param name="letter">j</xsl:with-param>
          </xsl:call-template>
          <xsl:call-template name="atozLetter">
            <xsl:with-param name="letter">k</xsl:with-param>
          </xsl:call-template>
          <xsl:call-template name="atozLetter">
            <xsl:with-param name="letter">l</xsl:with-param>
          </xsl:call-template>
          <xsl:call-template name="atozLetter">
            <xsl:with-param name="letter">m</xsl:with-param>
          </xsl:call-template>
          <xsl:call-template name="atozLetter">
            <xsl:with-param name="letter">n</xsl:with-param>
          </xsl:call-template>
          <xsl:call-template name="atozLetter">
            <xsl:with-param name="letter">o</xsl:with-param>
          </xsl:call-template>
          <xsl:call-template name="atozLetter">
            <xsl:with-param name="letter">p</xsl:with-param>
          </xsl:call-template>
          <xsl:call-template name="atozLetter">
            <xsl:with-param name="letter">q</xsl:with-param>
          </xsl:call-template>
          <xsl:call-template name="atozLetter">
            <xsl:with-param name="letter">r</xsl:with-param>
          </xsl:call-template>
          <xsl:call-template name="atozLetter">
            <xsl:with-param name="letter">s</xsl:with-param>
          </xsl:call-template>
          <xsl:call-template name="atozLetter">
            <xsl:with-param name="letter">t</xsl:with-param>
          </xsl:call-template>
          <xsl:call-template name="atozLetter">
            <xsl:with-param name="letter">u</xsl:with-param>
          </xsl:call-template>
          <xsl:call-template name="atozLetter">
            <xsl:with-param name="letter">v</xsl:with-param>
          </xsl:call-template>
          <xsl:call-template name="atozLetter">
            <xsl:with-param name="letter">w</xsl:with-param>
          </xsl:call-template>
          <xsl:call-template name="atozLetter">
            <xsl:with-param name="letter">x</xsl:with-param>
          </xsl:call-template>
          <xsl:call-template name="atozLetter">
            <xsl:with-param name="letter">y</xsl:with-param>
          </xsl:call-template>
          <xsl:call-template name="atozLetter">
            <xsl:with-param name="letter">z</xsl:with-param>
          </xsl:call-template>
        </ul>
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
