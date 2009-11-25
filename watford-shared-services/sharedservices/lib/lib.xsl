<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:bebop="http://www.arsdigita.com/bebop/1.0"
  xmlns:aplaws="http://www.arsdigita.com/aplaws/1.0"
  xmlns:ui="http://www.arsdigita.com/ui/1.0"
  xmlns:cms="http://www.arsdigita.com/cms/1.0"
  xmlns:nav="http://ccm.redhat.com/london/navigation"
	xmlns:terms="http://xmlns.redhat.com/london/terms/1.0"
  exclude-result-prefixes="xsl bebop aplaws ui nav cms terms"
	version="1.0">

<xsl:import href="../types/ContentTypes.xsl"/>

<xsl:param name="theme-prefix"/>



<xsl:template name="header">

<!--HEADER -->

<div id="header">

<div id="logo">
<a href="{$dispatcher-prefix}/portal/" title="APLAWS+ home">
<img src="{$theme-prefix}/images/aplawsplus.gif" hspace="5" width="158" height="30" alt="APLAWS+ logo" />
</a>
</div>


<div id="utils">
	<span class="hide">|</span>
	<a href="{$dispatcher-prefix}/portal/" title="home" accesskey="1">home</a><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;|<xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;
	<a href="{$dispatcher-prefix}/atoz" title="a-z">a-z</a><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;|<xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;
	<a href="{$dispatcher-prefix}/navigation/sitemap.jsp" title="site map" accesskey="3">site map</a><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;|<xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;
	<a href="/contact" title="contact us" accesskey="9">contact us</a><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;|<xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;
	<a href="/help" title="help" accesskey="6">help</a><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;<xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp; 
</div>


<div id="search">

	<form name="search" method="get" action="{$dispatcher-prefix}/search/">
			<label for="topSearch" accesskey="4">Search</label>
			<input class="searchBox" id="topSearch" name="terms" value="search" />
			<label for="topGo">Go</label>
			<input type="submit" name="Submit" id="topGo" value="GO" class="go" />
			<xsl:apply-templates select="bebop:pageState" />
	</form>
			
			
</div>
<br id="clear"/>
</div>



<!--TOP LEVEL NAVIGATION -->
<div id="tlcNav">

<span class="hide">|</span>

<p>
<xsl:call-template name="TLC"/>
</p>
	

</div>


</xsl:template>



<xsl:template name="breadcrumb">

<!--BREADCRUMB -->
<span class="hide">|</span>
<div id="bread">
<p>
<b>
<a href="{$dispatcher-prefix}/portal/" title="home">home</a><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;<xsl:text disable-output-escaping="yes">&amp;</xsl:text>gt;<xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;</b> 
<span class="hide">|</span>
<xsl:for-each select="nav:categoryPath/nav:category[not(position()=1)]">
<xsl:choose>
<xsl:when test="not(position()=last())">
<a>
<xsl:attribute name="href"><xsl:value-of select="@url" /></xsl:attribute>
<xsl:attribute name="title"><xsl:value-of select="@description" /></xsl:attribute>
<xsl:value-of select="@title" />
</a>
<span class="hide">|</span>
<xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;<span class="breadArrow"><xsl:text disable-output-escaping="yes">&amp;</xsl:text>gt;</span><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;
</xsl:when>
<xsl:otherwise>
<span class="breadHi"><xsl:value-of select="@title" /></span>
</xsl:otherwise>
</xsl:choose>
</xsl:for-each>
</p>
<span class="hide">|</span>
</div>


</xsl:template>


<xsl:template name="TLC">
<span class="hide">|</span>
<!-- CONFIGURED TO MATCH LGCL TOP CATEGORIES-->
<a href="{$dispatcher-prefix}/navigation/business" title="business channel">business</a><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;|<xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;<a href="{$dispatcher-prefix}/navigation/community-and-living" title="community and living channel">community and living</a><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;|<xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;<a href="{$dispatcher-prefix}/navigation/council--government-and-democracy" title="council, government and democracy channel">council, government and democracy</a><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;|<xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;<a href="{$dispatcher-prefix}/navigation/education-and-learning" title="education and learning channel">education</a><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;|<xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;<a href="{$dispatcher-prefix}/navigation/environment" title="environment channel">environment</a><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;|<xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;<a href="{$dispatcher-prefix}/navigation/health-and-social-care" title="health and social care channel">health and social care</a><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;|<xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;<a href="{$dispatcher-prefix}/navigation/housing" title="housing channel">housing</a><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;|<xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;<a href="{$dispatcher-prefix}/navigation/jobs-and-careers" title="jobs and careers channel">jobs and careers</a><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;|<xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;<a href="{$dispatcher-prefix}/navigation/legal-services" title="legal services channel">legal services</a><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;|<xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;<a href="{$dispatcher-prefix}/navigation/leisure-and-culture" title="leisure and culture channel">leisure and culture</a><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;|<xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;<a href="{$dispatcher-prefix}/navigation/policing-and-public-safety" title="policing and public safety channel">policing and public safety</a><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;|<xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;<a href="{$dispatcher-prefix}/navigation/social-issues" title="social issues channel">social issues</a><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;|<xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;<a href="{$dispatcher-prefix}/navigation/transport-and-streets" title="transport and streets channel">transport and streets</a>
</xsl:template>




<xsl:template name="footer">
<div id="footer">
<p id="foottlc"> 
<span class="hide">|</span>	
<!-- CONFIGURED TO MATCH LGCL TOP CATEGORIES-->
<a href="{$dispatcher-prefix}/navigation/business" title="business channel">business</a><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;|<xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;<a href="{$dispatcher-prefix}/navigation/community-and-living" title="community and living channel">community and living</a><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;|<xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;<a href="{$dispatcher-prefix}/navigation/council--government-and-democracy" title="council, government and democracy channel">council, government and democracy</a><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;|<xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;<a href="{$dispatcher-prefix}/navigation/education-and-learning" title="education and learning channel">education</a><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;|<xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;<a href="{$dispatcher-prefix}/navigation/environment" title="environment channel">environment</a><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;|<xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;<a href="{$dispatcher-prefix}/navigation/health-and-social-care" title="health and social care channel">health and social care</a><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;|<xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;<a href="{$dispatcher-prefix}/navigation/housing" title="housing channel">housing</a><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;|<xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;<a href="{$dispatcher-prefix}/navigation/jobs-and-careers" title="jobs and careers channel">jobs and careers</a><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;|<xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;<a href="{$dispatcher-prefix}/navigation/legal-services" title="legal services channel">legal services</a><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;|<xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;<a href="{$dispatcher-prefix}/navigation/leisure-and-culture" title="leisure and culture channel">leisure and culture</a><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;|<xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;<a href="{$dispatcher-prefix}/navigation/policing-and-public-safety" title="policing and public safety channel">policing and public safety</a><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;|<xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;<a href="{$dispatcher-prefix}/navigation/social-issues" title="social issues channel">social issues</a><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;|<xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;<a href="{$dispatcher-prefix}/navigation/transport-and-streets" title="transport and streets channel">transport and streets</a>
</p>

<p id="legal"> 
<span class="hide">|</span>
<a href="/copyright" title="copyright">copyright</a><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;|<xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;<a href="/disclaimer" title="disclaimer and privacy statement" accesskey="8">disclaimer and privacy statement</a><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;|<xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;<a href="/contact" title="contact" accesskey="9">contact</a><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;|<xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;<a href="/accessibility" title="accessibility statement" accesskey="0">accessibility</a>
</p>


<p>
<span class="hide">|</span>
<a href="http://validator.w3.org/check/referer"><img border="0" src="{$theme-prefix}/images/w3c-xhtml.png" alt="Valid HTML 4.01!" height="31" width="88" /></a>
<span class="hide">|</span>
<a href="http://jigsaw.w3.org/css-validator/"><img style="border:0;width:88px;height:31px" src="{$theme-prefix}/images/w3c-css.png" alt="Valid CSS!" /></a>
</p>


</div>

<xsl:call-template name="aplaws:bodyDebug"/>

</xsl:template>









<xsl:template name="pageContent">
<a class="intLink" name="top" />
<xsl:choose>
<!-- CIs -->
<xsl:when test="cms:contentPanel">
<xsl:apply-templates select="cms:contentPanel/cms:item"/>
<xsl:call-template name="fileAttachments" />
<xsl:call-template name="associatedLinks" />
<font family="arial">Data Protection and Information Sharing notice. No personal information you have given us will be passed on to third parties for commercial purposes. The Council's policy is that all information will be shared among officers and other agencies where the legal framework allows it, if this will help to improve the service you receive and to develop other services. If you do not wish certain information about you to be exchanged within the Council, you can request that this does not happen.
</font>
</xsl:when>
<!-- A-Z -->
<xsl:when test="cms:alphabetNavigation">
<xsl:apply-templates select="ui:simplePageContent/cms:alphabetNavigation"/>
<div id="navSpace"><img src="{$theme-prefix}/images/spacer.gif" alt="*" /></div>
</xsl:when>
<!-- Nav pages -->
<xsl:otherwise>
<xsl:call-template name="greeting" />
<xsl:call-template name="contentLinks" />
</xsl:otherwise>
</xsl:choose>
</xsl:template>




<xsl:template name="Title">
<xsl:choose>
<xsl:when test="cms:contentPanel">
<xsl:value-of select="cms:contentPanel/cms:item/title"/>
</xsl:when>
<xsl:when test="cms:alphabetNavigation">A to Z</xsl:when>
<xsl:otherwise>
<xsl:for-each select="/bebop:page/nav:categoryMenu//nav:category[@isSelected='true']">
<xsl:if test="position() = last()">
<xsl:value-of select="@title"/>
</xsl:if>
</xsl:for-each>
</xsl:otherwise>
</xsl:choose>
</xsl:template>






<xsl:template name="greeting">
  <xsl:for-each select="nav:greetingItem[@id='greetingItem']/cms:item">
    <div id="greeting">
      
      <xsl:choose>

        <xsl:when test="type[label = 'MultiPartArticle']">
          <xsl:call-template name="CT_MultiPartArticle_graphics" />
        </xsl:when>

        <xsl:when test="type[label = 'Site Proxy']">
          <xsl:call-template name="CT_SiteProxy_graphics" />
        </xsl:when>

        <xsl:otherwise>
          <xsl:for-each select="imageCaptions">
            <div id="CI_Image">
              <img align="right">
                <xsl:attribute name="src"><xsl:value-of select="$dispatcher-prefix"/>/cms-service/stream/image/?image_id=<xsl:value-of select="imageAsset/id" /></xsl:attribute>
                <xsl:attribute name="alt"><xsl:value-of select="caption" /></xsl:attribute>
              </img>
            </div>
          </xsl:for-each>
          <p>
            <xsl:value-of disable-output-escaping="yes" select="./textAsset/content"/>
          </p>
        </xsl:otherwise>

      </xsl:choose>

    </div>
  </xsl:for-each>
</xsl:template>




<xsl:template name="contentLinks">
<xsl:for-each select="nav:simpleObjectList/nav:objectList">
		
		<div id="contentLinks">
		<xsl:for-each select="nav:item">
		<a>
		<xsl:attribute name="href"><xsl:value-of select="nav:path" /></xsl:attribute>
		<xsl:attribute name="title"><xsl:value-of select="nav:attribute[@name='title']" /></xsl:attribute>
		<xsl:value-of select="nav:attribute[@name='title']" />
		</a>
		<span class="hide">|</span>
		</xsl:for-each>
		</div>



</xsl:for-each>
</xsl:template>





<xsl:template name="fileAttachments">
<xsl:if test="cms:contentPanel/cms:item/fileAttachments">
<div class="attachment">
<h2>Related Files:</h2>
<ul class="linklist">
<xsl:for-each select="cms:contentPanel/cms:item/fileAttachments">
<xsl:sort select="fileOrder" data-type="number" />
<li>
<xsl:value-of select="name"/> - 
<xsl:value-of select="description"/>
<a  href="{$dispatcher-prefix}/cms-service/stream/asset/?asset_id={./id}" title="view file">[View]</a>
<a  href="{$dispatcher-prefix}/cms-service/download/asset/?asset_id={./id}" title="save file to your computer">[Save]</a>
</li>
</xsl:for-each>
</ul>
</div>
</xsl:if>
</xsl:template>	

<!-- URL Encoding Template Begin -->
<!-- Taken on as is basis.Written by Mike J. Brown, mike@skew.org.
     No license; use freely, but credit me if reproducing in print.
     Characters we'll support.
     We could add control chars 0-31 and 127-159, but we won't.
-->
  <xsl:variable name="ascii"> !"#$%&amp;'()*+,-./0123456789:;&lt;=&gt;?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~</xsl:variable>
  <xsl:variable name="latin1">&#160;&#161;&#162;&#163;&#164;&#165;&#166;&#167;&#168;&#169;&#170;&#171;&#172;&#173;&#174;&#175;&#176;&#177;&#178;&#179;&#180;&#181;&#182;&#183;&#184;&#185;&#186;&#187;&#188;&#189;&#190;&#191;&#192;&#193;&#194;&#195;&#196;&#197;&#198;&#199;&#200;&#201;&#202;&#203;&#204;&#205;&#206;&#207;&#208;&#209;&#210;&#211;&#212;&#213;&#214;&#215;&#216;&#217;&#218;&#219;&#220;&#221;&#222;&#223;&#224;&#225;&#226;&#227;&#228;&#229;&#230;&#231;&#232;&#233;&#234;&#235;&#236;&#237;&#238;&#239;&#240;&#241;&#242;&#243;&#244;&#245;&#246;&#247;&#248;&#249;&#250;&#251;&#252;&#253;&#254;&#255;</xsl:variable>

  <!-- Characters that usually don't need to be escaped -->
  <xsl:variable name="safe">!'()*-.0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz~</xsl:variable>

  <xsl:variable name="hex" >0123456789ABCDEF</xsl:variable> 
  <xsl:template name="url-encode">
    <xsl:param name="str"/>
    <xsl:if test="$str">
      <xsl:variable name="first-char" select="substring($str,1,1)"/>
      <xsl:choose>
        <xsl:when test="contains($safe,$first-char)">
          <xsl:value-of select="$first-char"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:variable name="codepoint">
            <xsl:choose>
              <xsl:when test="contains($ascii,$first-char)">
                <xsl:value-of select="string-length(substring-before($ascii,$first-char)) + 32"/>
              </xsl:when>
              <xsl:when test="contains($latin1,$first-char)">
                <xsl:value-of select="string-length(substring-before($latin1,$first-char)) + 160"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:message terminate="no">Warning: string contains a character that is out of range! Substituting "?".</xsl:message>
                <xsl:text>63</xsl:text>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:variable>
        <xsl:variable name="hex-digit1" select="substring($hex,floor($codepoint div 16) + 1,1)"/>
        <xsl:variable name="hex-digit2" select="substring($hex,$codepoint mod 16 + 1,1)"/>
        <xsl:value-of select="concat('%',$hex-digit1,$hex-digit2)"/>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:if test="string-length($str) &gt; 1">
        <xsl:call-template name="url-encode">
          <xsl:with-param name="str" select="substring($str,2)"/>
        </xsl:call-template>
      </xsl:if>
    </xsl:if>
  </xsl:template>
<!-- URL Encoding Template End -->

<xsl:template name="associatedLinks">
<xsl:if test="cms:contentPanel/cms:item/links">
<div class="attachment">
<h2>Associated Links:</h2>
<ul class="linklist">
<xsl:for-each select="cms:contentPanel/cms:item/links">
<xsl:sort select="linkOrder" data-type="number" />
<li>
  <a>
    <xsl:attribute name="href">
      <xsl:choose>
        <xsl:when test="targetType='internalLink'">
        <xsl:text>/redirect/?oid=</xsl:text>
        <xsl:call-template name="url-encode">
          <xsl:with-param name="str">
             <xsl:value-of select="targetItem/@oid"/>
          </xsl:with-param>
        </xsl:call-template>
<!--          <xsl:text>/redirect/?oid=</xsl:text><xsl:value-of select="targetItem/@oid"/> -->
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="targetURI"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
    <xsl:attribute name="title"><xsl:value-of select="./linkDescription" /></xsl:attribute>
    <xsl:if test="./targetWindow">
       <xsl:attribute name="target"><xsl:value-of select="./targetWindow" /></xsl:attribute>
    </xsl:if>
    <xsl:value-of disable-output-escaping="yes" select="./linkTitle" />
	</a>
- <xsl:value-of select="./linkDescription" />

</li>
</xsl:for-each>
</ul>
</div>
</xsl:if>
</xsl:template>	


<xsl:template name="relatedItems">
<xsl:for-each select="nav:relatedItems">
    <h2>Related Items</h2>
		<xsl:for-each select="nav:relatedItem">
		<a href="{@path}" title="{@title}"><xsl:value-of select="@title" /></a>
		</xsl:for-each>
		<span class="hide">|</span>
</xsl:for-each>
</xsl:template>


<xsl:template name="metaData">
<meta name="eGMS.accessibility" scheme="WCAG" content="Double-A" />
<meta name="DCTERMS.audience" content="" scheme="LGAL" href="http://www.esd.org.uk/standards/lgal/" />
<xsl:for-each select="descendant::dublinCore">
<meta name="DC.coverage.spatial" scheme="ONS SNAC" content="{./dcCoverageSpatialRef}" />
<meta name="DC.coverage.temporal.beginnningDate" scheme="ISO 639-2" ><xsl:attribute name="content"><xsl:call-template name="metaDate"><xsl:with-param name="date" select="./dcTemporalBegin" /></xsl:call-template></xsl:attribute></meta>
<meta name="DC.coverage.temporal.endDate"  scheme="ISO 639-2" ><xsl:attribute name="content"><xsl:call-template name="metaDate"><xsl:with-param name="date" select="./dcTemporalEnd" /></xsl:call-template></xsl:attribute></meta>
<meta name="DC.creator" content="{./dcCreatorOwner}" />
<meta name="Dc.date.valid" scheme="ISO8601" ><xsl:attribute name="content"><xsl:call-template name="metaDate"><xsl:with-param name="date" select="./dcDateValid" /></xsl:call-template></xsl:attribute></meta>
<meta name="eGMS.disposal.review" scheme="ISO8601" ><xsl:attribute name="content"><xsl:call-template name="metaDate"><xsl:with-param name="date" select="./dcDisposalReview" /></xsl:call-template></xsl:attribute></meta>
<meta name="DC.identifier" content="" schmeme="URI"/>
<meta name="DC.language" content="{./dcLanguage}" scheme="ISO 639-2" />
<meta name="DC.publisher" content="{./dcPublisher}" />
<meta name="DC.rights" content="{./dcRights}" />
<meta name="DC.relation.isFormatOf" content="{$context-prefix}{//bebop:page/@url}?output=xml" />
<meta name="DC.subject"><xsl:attribute name="content"><xsl:call-template name="metaTranslate"><xsl:with-param name="toTranslate" select="./dcKeywords" /></xsl:call-template></xsl:attribute></meta>
</xsl:for-each>

<xsl:for-each select="terms:assignedTerms/terms:term">
<xsl:choose>
<xsl:when test="@domain='GCL'">
<meta name="eGMS.subject.category" content="{@name}" scheme="GCL" href="http://www.esd.org.uk/standards/gcl/gcl.xml" />
</xsl:when>
<xsl:when test="@domain='LGCL'">
<meta name="eGMS.subject.category" content="{@name}" scheme="LGCL" href="http://www.esd.org.uk/standards/lgcl/lgcl.xml" />
</xsl:when>
<xsl:when test="@domain='LGSL'">
<meta name="eGMS.subject.service" content="{@id}" scheme="LGSL" href="http://www.esd.org.uk/standards/lgsl/lgsl.xml" />
</xsl:when>
<xsl:when test="@domain='LGIL'">
<meta name="eGMS.subject.interaction" content="{@name}" scheme="LGIL" href="http://www.esd.org.uk/standards/lgil/lgil.xml" />
</xsl:when>
</xsl:choose>
</xsl:for-each>

<meta name="DC.title">
<xsl:attribute name="content">APLAWS+: <xsl:call-template name="Title" /></xsl:attribute>
</meta>

</xsl:template>



<xsl:template name="metaTranslate">
<xsl:param name="toTranslate" />
<xsl:value-of select="translate($toTranslate,',' , ';')" />
</xsl:template>



<xsl:template name="metaDate"><xsl:param name="date" />20<xsl:value-of select="substring($date, 8, 2)" />
	<xsl:text>-</xsl:text>
	<xsl:variable name="month" 
     select="substring($date, 4, 3)"/>
	<xsl:choose>
		<xsl:when test="$month='Jan'">01</xsl:when>
		<xsl:when test="$month='Feb'">02</xsl:when>
		<xsl:when test="$month='Mar'">03</xsl:when>
		<xsl:when test="$month='Apr'">04</xsl:when>
		<xsl:when test="$month='May'">05</xsl:when>
		<xsl:when test="$month='Jun'">06</xsl:when>
		<xsl:when test="$month='Jul'">07</xsl:when>
		<xsl:when test="$month='Aug'">08</xsl:when>
		<xsl:when test="$month='Sep'">09</xsl:when>
		<xsl:when test="$month='Oct'">10</xsl:when>
		<xsl:when test="$month='Nov'">11</xsl:when>
		<xsl:when test="$month='Dec'">12</xsl:when>
	</xsl:choose>
	<xsl:text>-</xsl:text>
	<!-- Day -->
	<xsl:value-of select="number(substring($date, 1, 2))" />
</xsl:template>


<xsl:template name="aplaws:bodyDebug">
    <div class="bodyDebug">
      <xsl:apply-templates select="ui:debugPanel"/>
      <xsl:apply-templates select="bebop:structure"/>
    </div>
</xsl:template>


</xsl:stylesheet>
