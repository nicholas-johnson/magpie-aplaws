<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:admin="http://www.arsdigita.com/admin-ui/1.0"
  xmlns:bebop="http://www.arsdigita.com/bebop/1.0"
  xmlns:portal="http://www.uk.arsdigita.com/portal/1.0"
  xmlns:portlet="http://www.uk.arsdigita.com/portlet/1.0"
	exclude-result-prefixes="xsl admin bebop portal portlet"
	version="1.0">



<xsl:template match="portlet:login">
  <div id="loginBox"><xsl:apply-templates /></div>
</xsl:template>



<xsl:template match="portlet:loginuser">
  <h2><xsl:value-of select="../../@title"/></h2>
  Welcome <b><xsl:value-of select="@givenName"/>&#160;<xsl:value-of select="@familyName"/></b>
  <ul>
    <xsl:for-each select="bebop:link">
      <li><xsl:apply-templates select="."/></li>
    </xsl:for-each>
		<li><a href="{$dispatcher-prefix}/register/logout" title="Logout">Logout</a></li>
  </ul>
<span class="hide">|</span>
<div id="registerB"><a title="why register?" href="/whyregister">why register?</a></div>

</xsl:template>

<xsl:template match="portlet:loginform">
  <h2>Site Login</h2>
	<xsl:apply-templates />
  <form method="post" action="{$dispatcher-prefix}/{@url}" name="user-login">
    <div>Email: <input class="logbx" type="text" size="20" name="email"/></div>
    <div>Password: <input  class="logbx" type="password" size="20" name="password"/></div>
    <div><input type="checkbox" checked="checked" name="persistentCookieP" value="1" id="persistentCookieP:1"/>
          <label for="persistentCookieP:1">Remember this login?</label>
     </div>
     <div class="logSubmit"><input class="loggo" type="submit" name="login.submit" value="Login"/></div>
     <input name="form.user-login" type="hidden" value="visited"/>
     <input name="timestamp" type="hidden" value="{@timestamp}"/>
  </form>
</xsl:template>
 
</xsl:stylesheet>
