<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0">
   <xsl:output method="text" encoding="UTF-8"/>

  <xsl:template match="/xml"><xsl:apply-templates select="option"/></xsl:template> 
  <xsl:template match="option[@lang=&quot;#ATOK::DEFINE::TEXT[0]#&quot; and @type=&quot;#ATOK::DEFINE::TEXT[1]#&quot;]"><xsl:value-of select="."/></xsl:template> 
  <xsl:template match="option" /> 
</xsl:stylesheet>