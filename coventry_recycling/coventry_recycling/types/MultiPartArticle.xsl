<!DOCTYPE stylesheet [
<!ENTITY nbsp   "&#160;" ><!-- no-break space = non-breaking space, U+00A0 ISOnum -->
]>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:bebop="http://www.arsdigita.com/bebop/1.0"
                xmlns:cms="http://www.arsdigita.com/cms/1.0"
                xmlns:ui="http://www.arsdigita.com/ui/1.0"
                xmlns:nav="http://ccm.redhat.com/london/navigation"
                exclude-result-prefixes="xsl bebop cms ui"
                version="1.0">
  
  <xsl:template name="CT_MultiPartArticle_graphics">    

    <div id="greeting">
      <div id="leadDetails">
        <xsl:value-of disable-output-escaping="yes" select="./summary"/>
      </div>
    </div>
    
    <span class="hide">|</span>
	
    <div id="sectionList">	
	
      <span class="bold">Sections:</span>
	
      <xsl:for-each select="./sections">
        <xsl:sort select="./rank" data-type="number"/>
  
        <xsl:variable name="currentRank" select="./rank"/>
        <xsl:variable name="prevRank" select="number($currentRank -1)"/>
        <xsl:variable name="Page" select="count(../sections[./pageBreak ='true' and ./rank &lt; $currentRank]) + 1"/>
        <xsl:variable name="prevPage" select="count(../sections[./pageBreak ='true' and ./rank &lt; $prevRank]) + 1"/>
        <xsl:variable name="internalRank" select="count(../sections[./pageBreak ='false' and ./rank &lt; $currentRank]) + 1"/>
  
        <xsl:choose>
          <xsl:when test="@oid = ../../../cms:articleSectionPanel/cms:item[position() = 1]/@oid">
            <xsl:value-of select="title"/>
          </xsl:when>
          <xsl:when test="@oid = ../../../cms:articleSectionPanel/cms:item[position() != 1]/@oid">
            <a>
              <xsl:attribute name="href">#internalSection<xsl:value-of select="$internalRank" /></xsl:attribute>
              <xsl:attribute name="title">internal section <xsl:value-of select="$internalRank" /></xsl:attribute>
              <xsl:value-of select="title"/>
            </a>
          </xsl:when>
          <xsl:when test="@oid = ../../../nav:greetingItemExtraXML/cms:articleSectionPanel/cms:item[position() = 1]/@oid">
            <xsl:value-of select="title"/>
          </xsl:when>
          <xsl:when test="@oid = ../../../nav:greetingItemExtraXML/cms:articleSectionPanel/cms:item[position() != 1]/@oid">
            <a>
              <xsl:attribute name="href">#internalSection<xsl:value-of select="$internalRank" /></xsl:attribute>
              <xsl:attribute name="title">internal section <xsl:value-of select="$internalRank" /></xsl:attribute>
              <xsl:value-of select="title"/>
            </a>
          </xsl:when>
          <xsl:when test="($Page = $prevPage) and $Page!='1'">
            <a>
              <xsl:attribute name="href">?page=<xsl:value-of select="$Page" />#internalSection<xsl:value-of select="$internalRank" /></xsl:attribute>
              <xsl:attribute name="title">page<xsl:value-of select="$Page" />internal section <xsl:value-of select="$internalRank" /></xsl:attribute>
              <xsl:value-of select="title"/>
            </a>
          </xsl:when>
          <xsl:otherwise>
            <a href="?page={$Page}" title="page{$Page}">
              <xsl:value-of select="title"/>
            </a>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:if test="not(position()=last())"><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;|<xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;</xsl:if>
      </xsl:for-each>
      
    </div>

    <xsl:for-each select="/bebop:page/cms:articleSectionPanel/cms:item">
      <xsl:call-template name="oneSection" />
    </xsl:for-each>
      
    <xsl:for-each select="/bebop:page/nav:greetingItemExtraXML/cms:articleSectionPanel/cms:item">
      <xsl:call-template name="oneSection" />
    </xsl:for-each>
      
    <div id="mpaDirection">
      
      <xsl:for-each select="./sections">
        <xsl:sort select="./rank"/>
        
        <xsl:variable name="currentRank" select="./rank"/>
        <xsl:variable name="Page" select="count(../sections[./pageBreak ='true' and ./rank &lt; $currentRank]) + 1"/>
        <xsl:variable name="internalRank" select="count(../sections[./pageBreak ='false' and ./rank &lt; $currentRank]) + 1"/>
        
        <xsl:choose>
			<xsl:when test="@oid = ../../../cms:articleSectionPanel/cms:item[position() = 1]/@oid">
              
              <xsl:if test="position() !='1'">
                <a class="prev" href="?page={$Page -1}" title="previous page">
                  Previous page
                </a>
              </xsl:if>
              | 
              <xsl:if test="(number(rank))!=(count(../sections))">
                <a class="next" href="?page={$Page +1}" title="next page">
                  Next page
                </a>
              </xsl:if>
            </xsl:when>
        </xsl:choose>
      </xsl:for-each>
      
    </div>
    
  </xsl:template>
  


  <xsl:template name="oneSection">

    <div class="section">
      <xsl:for-each select="image">
        
        <img align="right">
          <xsl:attribute name="src"><xsl:value-of select="$dispatcher-prefix"/>/cms-service/stream/image/?image_id=<xsl:value-of select="id" /></xsl:attribute>
          <xsl:attribute name="alt"><xsl:value-of select="description" /></xsl:attribute>
          <xsl:attribute name="width"><xsl:value-of select="width" /></xsl:attribute>
          <xsl:attribute name="height"><xsl:value-of select="height" /></xsl:attribute>
        </img>
      </xsl:for-each>
      
      <xsl:choose>
        <xsl:when test="position() =1">
          <div class="bold"><xsl:value-of disable-output-escaping="yes" select="title"/>:</div>
        </xsl:when>
        <xsl:otherwise>
          <div class="bold">
            <a  class="intLink">
              <xsl:attribute name="name">internalSection<xsl:value-of select="position()" /></xsl:attribute>
            </a>
          <xsl:value-of disable-output-escaping="yes" select="title"/>:</div>
          <div class="top"><xsl:text>[</xsl:text><a href="#top" class="topLink" title="top of page">top of page</a><xsl:text>]</xsl:text></div>
        </xsl:otherwise>
        </xsl:choose>
        
        <xsl:for-each select="text">
          <xsl:value-of disable-output-escaping="yes" select="content"/>
        </xsl:for-each>
        
    </div>
    
  </xsl:template>
  
</xsl:stylesheet>