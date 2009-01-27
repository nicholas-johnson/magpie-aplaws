<!DOCTYPE stylesheet [
<!ENTITY nbsp   "&#160;" ><!-- no-break space = non-breaking space, U+00A0 ISOnum -->
]>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:bebop="http://www.arsdigita.com/bebop/1.0"
                xmlns:cms="http://www.arsdigita.com/cms/1.0"
                exclude-result-prefixes="xsl bebop cms"
version="1.0">



<xsl:import href="/__ccm__/servlet/content-type/index.xsl"/>
<xsl:import href="Article.xsl"/>
<xsl:import href="MultiPartArticle.xsl"/>
<xsl:import href="FileStorageItem.xsl"/>
<xsl:import href="Event.xsl"/>
<xsl:import href="Address.xsl"/>
<xsl:import href="Agenda.xsl"/>
<xsl:import href="Job.xsl"/>
<xsl:import href="LegalNotice.xsl"/>
<xsl:import href="Minutes.xsl"/>
<xsl:import href="Service.xsl"/>
<xsl:import href="PressRelease.xsl"/>
<xsl:import href="NewsItem.xsl"/>
<xsl:import href="InlineSite.xsl"/>
<xsl:import href="SiteProxy.xsl"/>


<xsl:template match="cms:item[objectType='com.arsdigita.cms.contenttypes.Article' and not(@useContext = 'itemAdminSummary')]">
<xsl:call-template name="CT_Article_graphics"/>
</xsl:template>
<xsl:template match="cms:item[objectType='com.arsdigita.cms.contenttypes.MultiPartArticle' and not(@useContext = 'itemAdminSummary')]">
<xsl:call-template name="CT_MultiPartArticle_graphics"/>
</xsl:template>
<xsl:template match="cms:item[objectType='com.arsdigita.cms.contenttypes.FileStorageItem' and not(@useContext = 'itemAdminSummary')]">
<xsl:call-template name="CT_FileStorageItem_graphics"/>
</xsl:template>
<xsl:template match="cms:item[objectType='com.arsdigita.cms.contenttypes.Event' and not(@useContext = 'itemAdminSummary')]">
<xsl:call-template name="CT_Event_graphics"/>
</xsl:template>
<xsl:template match="cms:item[objectType='com.arsdigita.cms.contenttypes.Address' and not(@useContext = 'itemAdminSummary')]">
<xsl:call-template name="CT_Address_graphics"/>
</xsl:template>
<xsl:template match="cms:item[objectType='com.arsdigita.cms.contenttypes.Agenda' and not(@useContext = 'itemAdminSummary')]">
<xsl:call-template name="CT_Agenda_graphics"/>
</xsl:template>
<xsl:template match="cms:item[objectType='com.arsdigita.cms.contenttypes.Job' and not(@useContext = 'itemAdminSummary')]">
<xsl:call-template name="CT_Job_graphics"/>
</xsl:template>
<xsl:template match="cms:item[objectType='com.arsdigita.cms.contenttypes.LegalNotice' and not(@useContext = 'itemAdminSummary')]">
<xsl:call-template name="CT_LegalNotice_graphics"/>
</xsl:template>
<xsl:template match="cms:item[objectType='com.arsdigita.cms.contenttypes.Minutes' and not(@useContext = 'itemAdminSummary')]">
<xsl:call-template name="CT_Minutes_graphics"/>
</xsl:template>
<xsl:template match="cms:item[objectType='com.arsdigita.cms.contenttypes.Service' and not(@useContext = 'itemAdminSummary')]">
<xsl:call-template name="CT_Service_graphics"/>
</xsl:template>
<xsl:template match="cms:item[objectType='com.arsdigita.cms.contenttypes.PressRelease' and not(@useContext = 'itemAdminSummary')]">
<xsl:call-template name="CT_PressRelease_graphics"/>
</xsl:template>
<xsl:template match="cms:item[objectType='com.arsdigita.cms.contenttypes.NewsItem' and not(@useContext = 'itemAdminSummary')]">
<xsl:call-template name="CT_NewsItem_graphics"/>
</xsl:template>
<xsl:template match="cms:item[objectType='com.arsdigita.cms.contenttypes.InlineSite']">
<xsl:call-template name="CT_InlineSite"/>
</xsl:template>
<xsl:template match="cms:item[objectType='com.arsdigita.cms.contenttypes.ESDService']">
<xsl:apply-templates select="." mode="cms:CT_graphics"/>
</xsl:template>
<xsl:template match="cms:item[objectType='com.arsdigita.cms.contenttypes.SiteProxy']">
<xsl:apply-templates select="." mode="cms:CT_graphics"/>
</xsl:template>


</xsl:stylesheet>
