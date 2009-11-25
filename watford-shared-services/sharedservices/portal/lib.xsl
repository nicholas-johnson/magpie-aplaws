<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:admin="http://www.arsdigita.com/admin-ui/1.0"
  xmlns:bebop="http://www.arsdigita.com/bebop/1.0"
  xmlns:portal="http://www.uk.arsdigita.com/portal/1.0"
  xmlns:portlet="http://www.uk.arsdigita.com/portlet/1.0"
	version="1.0">

  <xsl:template match="portlet:simple">
    <xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template match="portlet:action">
    <xsl:variable name="title">
      <xsl:choose>
        <xsl:when test="@name = 'moveDown'">
          <xsl:text>Move Down</xsl:text>
        </xsl:when>
        <xsl:when test="@name = 'moveUp'">
          <xsl:text>Move Up</xsl:text>
        </xsl:when>
        <xsl:when test="@name = 'customize'">
          <xsl:text>Configure</xsl:text>
        </xsl:when>
        <xsl:when test="@name = 'delete'">
          <xsl:text>Delete</xsl:text>
        </xsl:when>
      </xsl:choose>
    </xsl:variable>
    
    <a href="{@url}" title="{$title}">
      <img src="/STATIC/portal/{@name}.gif"  border="1" alt="{$title}"/>
    </a>
  </xsl:template>
  
  <xsl:template match="portal:portal">
    <table class="portalWrap" width="100%" cellpadding="0" cellspacing="0" border="0">
      <tr valign="top">
        <xsl:apply-templates select="." mode="columns">
          <xsl:with-param name="format" select="@layout"/>
        </xsl:apply-templates>
      </tr>
    </table>
  </xsl:template>

  <xsl:template match="bebop:portlet">
    <div class="portletWrap">
      <xsl:apply-templates />
	</div>
  </xsl:template>
    
</xsl:stylesheet>

