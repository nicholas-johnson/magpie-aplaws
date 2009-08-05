<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:portal="http://www.uk.arsdigita.com/portal/1.0" xmlns:portlet="http://www.uk.arsdigita.com/portlet/1.0" xmlns:bebop="http://www.arsdigita.com/bebop/1.0" xmlns:nav="http://ccm.redhat.com/london/navigation" version="1.0" exclude-result-prefixes="xsl portal portlet bebop nav">

  <xsl:template match="portal:homepageWorkspace[@id='left']">
    <xsl:for-each select="portal:portal/bebop:portlet">
      <xsl:choose>
        <xsl:when test="@title='Configure portlet'">
          <xsl:call-template name="configure_portlet" />
        </xsl:when>
        <xsl:when test="portlet:freeformHTML">
          <xsl:value-of select="portlet:freeformHTML" disable-output-escaping="yes" />
          <xsl:apply-templates select="portlet:action"/>
        </xsl:when>
      </xsl:choose>
    </xsl:for-each>
    <xsl:apply-templates select="bebop:link"/>
  </xsl:template>

  <xsl:template match="portal:homepageWorkspace[@id='right']">
    <xsl:for-each select="portal:portal/bebop:portlet">
      <xsl:choose>
        <xsl:when test="@title='Configure portlet'">
          <xsl:call-template name="configure_portlet" />
        </xsl:when>
        <xsl:when test="portlet:freeformHTML">
          <div class="portlet {@title}">
            <div class="content_wrapper">
              <div class="content">
                <xsl:value-of select="portlet:freeformHTML" disable-output-escaping="yes" />
                <xsl:apply-templates select="portlet:action"/>
              </div>
            </div>
          </div>
        </xsl:when>
      </xsl:choose>
    </xsl:for-each>
    <xsl:apply-templates select="bebop:link"/>
  </xsl:template>
  
  <xsl:template name="configure_portlet">
    <div class="{.//bebop:formWidget[@name='title']/@value} configure">
      <div class="content_wrapper">
        <div class="content">
          <h1>Configure <xsl:value-of select=".//bebop:formWidget[@name='title']/@value" /> portlet</h1>
          <form action="{.//bebop:form/@action}" method="post" class="{.//bebop:formWidget[@name='title']/@value}_form">
            <input name="form.wrapper" type="hidden" value="visited" />
            <input name="title" type="hidden" value="{.//bebop:formWidget[@name='title']/@value}" />
            <textarea name="content"><xsl:value-of select=".//bebop:textarea[@name='content']/@value" disable-output-escaping="yes" />&#160;</textarea>
            <br />
            <input onclick="dcp_hide(this.form);" name="save" type="submit" value="Save" />&#160;
            <input onclick="dcp_hide(this.form);" name="cancel" type="submit" value="Cancel" />
            <xsl:for-each select=".//bebop:pageState">
              <input type="hidden" name="{@name}" value="{@value}" />
            </xsl:for-each>
          </form>
        </div>
      </div>
    </div>
  </xsl:template>

</xsl:stylesheet>
