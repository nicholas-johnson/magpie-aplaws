<!DOCTYPE stylesheet [
<!ENTITY nbsp   "&#160;" ><!-- no-break space = non-breaking space, U+00A0 ISOnum -->
]>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:bebop="http://www.arsdigita.com/bebop/1.0"
                xmlns:cms="http://www.arsdigita.com/cms/1.0"
                exclude-result-prefixes="xsl bebop cms"
version="1.0">



<xsl:template name="CT_Agenda_graphics">
<div id="details">
<p>
<span class="bold">Date:</span><xsl:value-of disable-output-escaping="yes" select="./agendaDate"/>
</p>
<p>
<span class="bold">Location:</span><xsl:value-of disable-output-escaping="yes" select="./location"/>
</p>
<p>
<span class="bold">Attendees:</span><xsl:value-of disable-output-escaping="yes" select="./attendees"/>
</p>
<p>
<span class="bold">Contact Info:</span><xsl:value-of disable-output-escaping="yes" select="./contactInfo"/>
</p>
</div>

<div id="mainBody">
<p> 
<span class="bold">Subject Items: </span>
<xsl:value-of disable-output-escaping="yes" select="./subjectItems"/>
</p>
<p> 
<span class="bold">Summary: </span>
<xsl:value-of disable-output-escaping="yes" select="./summary"/>
</p>
<xsl:value-of disable-output-escaping="yes" select="./textAsset/content"/>
</div>
</xsl:template>




<xsl:template name="agendaDate">
<xsl:param name="date" />
<xsl:choose>
<xsl:when test="not(boolean($date))">
<xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;
</xsl:when>
</xsl:choose>
<xsl:choose>
<xsl:when test="boolean($date)">
<xsl:variable name="day" select="substring($date, 1, 3)"/>
<xsl:choose>
<xsl:when test="$day='Mon'">Mon</xsl:when>
<xsl:when test="$day='Tue'">Tue</xsl:when>
<xsl:when test="$day='Wed'">Wed</xsl:when>
<xsl:when test="$day='Thu'">Thu</xsl:when>
<xsl:when test="$day='Fri'">Fri</xsl:when>
<xsl:when test="$day='Sat'">Sat</xsl:when>
<xsl:when test="$day='Sun'">Sun</xsl:when>
<xsl:otherwise />
</xsl:choose>
<xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;
<xsl:value-of select="number(substring($date, 9, 2))" />
<xsl:choose>
<xsl:when test="number(substring($date, 9, 2))='1'">st</xsl:when>
<xsl:when test="number(substring($date, 9, 2))='2'">nd</xsl:when>
<xsl:when test="number(substring($date, 9, 2))='3'">rd</xsl:when>
<xsl:otherwise>th</xsl:otherwise>
</xsl:choose>
<xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;
<xsl:variable name="month" select="substring($date, 5, 3)"/>
<xsl:choose>
<xsl:when test="$month='Jan'">Jan</xsl:when>
<xsl:when test="$month='Feb'">Feb</xsl:when>
<xsl:when test="$month='Mar'">Mar</xsl:when>
<xsl:when test="$month='Apr'">Apr</xsl:when>
<xsl:when test="$month='May'">May</xsl:when>
<xsl:when test="$month='Jun'">Jun</xsl:when>
<xsl:when test="$month='Jul'">Jul</xsl:when>
<xsl:when test="$month='Aug'">Aug</xsl:when>
<xsl:when test="$month='Sep'">Sep</xsl:when>
<xsl:when test="$month='Oct'">Oct</xsl:when>
<xsl:when test="$month='Nov'">Nov</xsl:when>
<xsl:when test="$month='Dec'">Dec</xsl:when>
<xsl:otherwise />
</xsl:choose>
<xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;
20<xsl:value-of select="substring($date, 27, 2)" />
<xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;
<xsl:value-of select="substring($date, 12, 5)" />
</xsl:when>
</xsl:choose>
</xsl:template>

</xsl:stylesheet>