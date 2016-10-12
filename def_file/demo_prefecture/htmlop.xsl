<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8"/>
  <xsl:template match="/p">
    <select name="member">
    <xsl:text>&#x0a;</xsl:text>
    <xsl:apply-templates select="m" />
    </select>
  </xsl:template>
  <xsl:template match="m">
    <option>
    	<xsl:attribute name="value">
	    	<xsl:value-of select="@roma" />
    	</xsl:attribute>
		<xsl:value-of select="." />
    </option>
    <xsl:text>&#x0a;</xsl:text>
  </xsl:template>
</xsl:stylesheet>