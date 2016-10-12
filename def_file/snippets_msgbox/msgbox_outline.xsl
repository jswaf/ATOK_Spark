<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml">
  <xsl:output method="xml" encoding="UTF-8" omit-xml-declaration="yes" indent="no"/>

  <xsl:template match="/xml">
    <html>
      <head> <title>ATOK Spark</title> </head>
      <body>
  		<xsl:apply-templates select="param">
		</xsl:apply-templates>
      </body>
    </html>
  </xsl:template>


  <xsl:template match="param">
	<xsl:value-of select="@guid" />
	<table border="1"  style="font-size : 12px;">
	<tr bgcolor="#dddddd"><th>type</th><th>詳細</th></tr>
  	<xsl:apply-templates select="type">
	</xsl:apply-templates>
  	</table>
  </xsl:template>

  <xsl:template match="type">
	<tr>
	<xsl:if test="text()='#ATOK::DEFINE::TEXT[0]#'">
	    	<xsl:attribute name="bgcolor">
		    	<xsl:text>#ddffff</xsl:text>
	    	</xsl:attribute>
	</xsl:if>

	<xsl:if test="text()='#ATOK::DEFINE::TEXT[1]#'">
	    	<xsl:attribute name="bgcolor">
		    	<xsl:text>#ddffff</xsl:text>
	    	</xsl:attribute>
	</xsl:if>

	<td style="font-size : 18px;">
		<xsl:value-of select="." />
	</td>
	<td style="font-size : 12px;">
		<xsl:value-of select="@guid" />
	</td>
	</tr>
  </xsl:template>
</xsl:stylesheet>