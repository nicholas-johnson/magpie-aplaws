<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE stylesheet [
<!ENTITY nbsp "&#160;">
<!-- no-break space = non-breaking space, U+00A0 ISOnum -->]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ui="http://www.arsdigita.com/ui/1.0" xmlns:bebop="http://www.arsdigita.com/bebop/1.0" xmlns:portal="http://www.uk.arsdigita.com/portal/1.0" xmlns:cms="http://www.arsdigita.com/cms/1.0" xmlns:nav="http://ccm.redhat.com/london/navigation" version="1.0" exclude-result-prefixes="xsl ui bebop portal cms nav"><!--
Copyright (C) 2004-2005 Runtime Collective Ltd. All Rights Reserved.

This library is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public License
as published by the Free Software Foundation; either version 2.1 of
the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with this library; if not, write to the Free Software
Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA

-->

<!-- most content items use the same formatting for their headings so it is grouped here -->
	<xsl:template name="itemHead">
		<xsl:if test="not(ancestor::nav:greetingItem)">
			<xsl:call-template name="contentTitle"><xsl:with-param name="title" select="title" /></xsl:call-template>
		</xsl:if>
	</xsl:template>

	<xsl:template name="contentTitle">
		<xsl:param name="title" />
		<h2>
			<span>
				<xsl:value-of select="$title" />
			</span>
		</h2>
	</xsl:template>

</xsl:stylesheet>
