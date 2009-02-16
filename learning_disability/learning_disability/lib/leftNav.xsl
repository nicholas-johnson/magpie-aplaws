<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:bebop="http://www.arsdigita.com/bebop/1.0"
  xmlns:aplaws="http://www.arsdigita.com/aplaws/1.0"
  xmlns:ui="http://www.arsdigita.com/ui/1.0"
  xmlns:cms="http://www.arsdigita.com/cms/1.0"
  xmlns:nav="http://ccm.redhat.com/london/navigation"
  exclude-result-prefixes="xsl bebop aplaws ui cms nav"
  version="1.0">




<xsl:template name="leftNav">
		
<div id="nav">
<xsl:for-each select="/bebop:page/nav:categoryMenu//nav:category[@isSelected='true']">
<xsl:choose>



<xsl:when test="position() = last()">


<div class="navUp">
<!-- category above -->
<xsl:for-each select="../../nav:category[@isSelected='true']">
<xsl:if test="../../nav:categoryMenu">
<a href="{$dispatcher-prefix}/portal/">
<xsl:attribute name="title">up to homepage</xsl:attribute>
<xsl:text disable-output-escaping="yes">&amp;</xsl:text>#094;
<xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;home</a>
</xsl:if>

<xsl:if test="not(../../nav:categoryMenu)">
<a href="{@url}">
<xsl:attribute name="title">up to <xsl:value-of select="@title" /></xsl:attribute>
<xsl:text disable-output-escaping="yes">&amp;</xsl:text>#094;
<xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;<xsl:value-of select="@title" />
</a>
</xsl:if>
</xsl:for-each>



<!-- category above if homepage/root-->
<xsl:for-each select="../../nav:categoryMenu">
<a href="{$dispatcher-prefix}/portal/">
<xsl:attribute name="title">up to homepage</xsl:attribute>
<xsl:text disable-output-escaping="yes">&amp;</xsl:text>#094;
<xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;home</a>
</xsl:for-each>
<span class="hide">|</span>
</div>



<div class="navHere">
<!-- selected category -->
<p>
<a href="{@url}" title="{@title}"><xsl:value-of select="@title" /></a>
</p>
<span class="hide">|</span>
</div>
		
<!-- children -->
<xsl:for-each select="./nav:category">
<xsl:if test="not(@isSelected)">
<a href="{@url}" class="navChild" title="{@title}"><xsl:value-of select="@title" /></a>
</xsl:if>
<span class="hide">|</span>
</xsl:for-each>

</xsl:when>
</xsl:choose>
</xsl:for-each>
</div>
</xsl:template>
  
</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c)1998-2003. Sonic Software Corporation. All rights reserved.
<metaInformation>
<scenarios/><MapperInfo srcSchemaPath="" srcSchemaRoot="" srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/>
</metaInformation>
-->