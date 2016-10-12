<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml">
  <xsl:output method="xml" encoding="UTF-8" omit-xml-declaration="yes" indent="no"/>

  <xsl:template match="/p">
    <html>
      <head> <title>ATOK Phrase</title> </head>
      <body>

    <xsl:text>&#x0a;</xsl:text>
    <xsl:apply-templates select="m" />
      </body>
    </html>

  </xsl:template>

  <xsl:template match="m">
    <b>
    <xsl:text>・</xsl:text>
	<xsl:value-of select="." />
    </b><br /><br />
    <xsl:text>&#x0a;</xsl:text>
  </xsl:template>
</xsl:stylesheet>