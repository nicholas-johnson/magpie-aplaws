<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:bebop="http://www.arsdigita.com/bebop/1.0"
                xmlns:cms="http://www.arsdigita.com/cms/1.0"
                exclude-result-prefixes="xsl bebop cms"
version="1.0">




<xsl:template name="CT_FileStorageItem_graphics">

<div id="mainBody">
<xsl:value-of disable-output-escaping="yes" select="./description"/>
</div>

<div id="sectionList">		
<a href="{$dispatcher-prefix}/cms-service/stream/asset/?asset_id={./file/id}">View in browser</a>
<xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;|<xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;
<a href="{$dispatcher-prefix}/cms-service/download/asset/?asset_id={./file/id}">Save to disk</a>
</div>

</xsl:template>
</xsl:stylesheet>
