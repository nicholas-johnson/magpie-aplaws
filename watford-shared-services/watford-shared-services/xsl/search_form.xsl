<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:bebop="http://www.arsdigita.com/bebop/1.0"
    xmlns:aplaws="http://www.arsdigita.com/aplaws/1.0"
    xmlns:ui="http://www.arsdigita.com/ui/1.0"
    xmlns:cms="http://www.arsdigita.com/cms/1.0"
    xmlns:nav="http://ccm.redhat.com/london/navigation"
    xmlns:search="http://rhea.redhat.com/search/1.0"
    exclude-result-prefixes="xsl bebop aplaws ui cms nav search">
    
  <xsl:template name="search_form">
    <div class="search">
      <form method="get" action="{$dispatcher-prefix}/search">
        <label for="terms">Search for: </label>
        <table>
          <tr>
            <td class="search_cell">
              <fieldset>
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
              </fieldset>
            </td>
            <td>
              <input type="submit" name="Submit" id="basicSearchGo" value="Go" class="go" />
            </td>
          </tr>
        </table>
        <xsl:apply-templates select="bebop:pageState" />
      </form>
      <div class="clear">&#160;</div>
    </div>
  </xsl:template>
  
</xsl:stylesheet>