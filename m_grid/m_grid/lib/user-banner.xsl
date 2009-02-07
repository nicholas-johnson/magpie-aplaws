<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:bebop="http://www.arsdigita.com/bebop/1.0"
    xmlns:ui="http://www.arsdigita.com/ui/1.0">
  
 <xsl:output method="html" indent="yes"/>
 
 <xsl:param name="theme-prefix" />
 
 <xsl:template name="ui:userBanner" match="ui:userBanner" >
   <xsl:choose>
    <!-- If a userID is set, then we know user is logged in. If not, -->
    <!-- Log in message is presented...  -->
     <xsl:when test="@userID">
      <table class="globalAdminHeader">
       <tr>
         <td id="logo"><img src="{$theme-prefix}/images/aplaws-logo-small.png" height="30" width="30"/></td>
         <td><xsl:text>&#160;&#160;&#160;&#160;&#160;&#160;</xsl:text></td>
          <td style="margin: 0; border: 0; padding: 0;">
           <table align="center" style="margin: 0; border: 0; padding: 0;">
            <tr>
             <td style="margin: 0; color: #3f3f3f; border: 0; padding: 0; padding-right: 18px;">
             <xsl:value-of select="@greeting"/>
             <xsl:text>&#160;</xsl:text>
              <strong><xsl:value-of select="@givenName"/>
               <xsl:text>&#160;</xsl:text>
               <xsl:value-of select="@familyName"/>
              </strong>
             </td>
            </tr>
           </table>
          </td>
          <td style="margin: 0; border: 0; padding: 0;">
           <table align="right" style="margin: 0; border: 0; padding: 0;">
            <tr>
             <td class="global-link-icon">
              <a>
               <xsl:attribute name="href">
                <xsl:value-of select="@workspaceURL"/>
               </xsl:attribute>
               <img src="/assets/home.png" height="18" width="18"/>
              </a>
             </td>
             <td class="global-link">
               <a>
                 <xsl:attribute name="href">
                  <xsl:value-of select="@workspaceURL"/>
                 </xsl:attribute>
                 <xsl:text>Home</xsl:text>
               </a>
             </td>

             <td class="global-link-icon">
              <a>
               <xsl:attribute name="href">
                 <xsl:value-of select="@logoutURL"/>
               </xsl:attribute>
               <img src="/assets/lock.png" height="18" width="14"/>
              </a>
            </td>
            <td class="global-link">
              <a>
               <xsl:attribute name="href">
                 <xsl:value-of select="@logoutURL"/>
               </xsl:attribute>
               <xsl:text>Logout</xsl:text>
              </a>
            </td>
         </tr>
       </table>
      </td>
     </tr>
    </table>
     </xsl:when>
     <xsl:otherwise>
      <table class="globalAdminHeader">
       <tr>
        <!-- Shadow man logo by default -->
        <a href="http://www.redhat.com"><td class="globalLogo"></td></a>
        <td><xsl:text>&#160;&#160;&#160;&#160;&#160;&#160;</xsl:text></td>
        <td style="margin: 0; border: 0; padding: 0;">
         <table align="center" style="margin: 0; border: 0; padding: 0;">
          <tr>
           <td style="margin: 0; color: #3f3f3f; border: 0; padding: 0; padding-right: 18px;">
            You are not currently logged in
           </td>
          </tr>
         </table>
        </td>
        <td style="font-size: smaller; text-align: right">
         <a>
          <xsl:attribute name="href">
           <xsl:value-of select="@loginURL"/>
          </xsl:attribute>
          Login
         </a>
       </td>
       </tr>
      </table>
     </xsl:otherwise>
   </xsl:choose>
 </xsl:template>

</xsl:stylesheet>
