<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text" encoding="UTF-8"/>
      <xsl:template match="/p">
    <xsl:apply-templates select="m" />
  </xsl:template>
  <xsl:template match="m">
    <xsl:value-of select="." />
    <xsl:text>&#x0a;</xsl:text>
  </xsl:template>
</xsl:stylesheet>