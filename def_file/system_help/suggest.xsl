<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml">
  <xsl:output method="xml" encoding="UTF-8" omit-xml-declaration="yes" indent="no"/>

  <xsl:template match="/atoksparkhelp">
    <html>
      <head>
	      <title>ATOK Spark Trigger Help</title>
      </head>
      <body>
      <h1 style="font-size: 1.5em; padding: .5em .75em; background-color: #f6f6f6; border-bottom: 1px solid #ccc;">ATOK Spark 定義フレーズ 推測【 #ATOK::DEFINE::TEXT[1]# 】</h1>
  		<xsl:apply-templates select="help">
		    <xsl:sort select="@auto_created" data-type="text" />
		</xsl:apply-templates>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="help[Example/Code = &quot;#ATOK::DEFINE::TEXT[0]#&quot;]">
		<div style="padding: 8px 2px 8px 8px;">
	  		<xsl:apply-templates select="Example" />
  		</div>
  </xsl:template>
  
  <xsl:template match="help[contains(string(Example/Code),&quot;#ATOK::DEFINE::TEXT[1]#&quot;)]">
		<div style="padding: 8px 2px 8px 8px;">
	  		<xsl:apply-templates select="Example" />
  		</div>
  </xsl:template>



  <xsl:template match="Example[contains(string(Code),&quot;#ATOK::DEFINE::TEXT[1]#&quot;)]">
	<xsl:apply-templates select="Guid" />
	<xsl:apply-templates select="Code" />
  </xsl:template>

  <xsl:template match="Guid">
    <div style="padding-top: 5px;"><xsl:value-of select="." /></div>
  </xsl:template>

  <xsl:template match="Code">
    <div style="border: #86bf91 solid 1px; border-left: #86bf91 solid 10px; padding: 3px; background: #fff;font-family: 'Ricty Diminished', 'Monaco', 'Consolas', 'Courier New', Courier, monospace, sans-serif;"
    ><xsl:value-of select="." /></div>
  </xsl:template>

  <xsl:template match="help">
  </xsl:template>

  <xsl:template match="Example">
  </xsl:template>

</xsl:stylesheet>