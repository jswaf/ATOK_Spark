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
      <h1 style="font-size: 1.5em; padding: .5em .75em; background-color: #f6f6f6; border-bottom: 1px solid #ccc;">ATOK Spark 定義フレーズ 一覧　(help:)</h1>
  		<xsl:apply-templates select="help">
		    <xsl:sort select="@auto_created" data-type="text" />
		</xsl:apply-templates>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="help">
  		<xsl:apply-templates select="Guidance" />
		<div style="padding: 8px 2px 8px 8px;">
	  		<xsl:apply-templates select="Detail" />
	  		<xsl:apply-templates select="Example" />
  			<xsl:apply-templates select="Notice" />
  			<xsl:apply-templates select="Creator" />
	  		<xsl:apply-templates select="Copyright" />
  		</div>
  </xsl:template>

  <xsl:template match="Guidance">
    <h3 style="font-size: 1.1em; padding: .5em .75em; background-color: #f6f6f6; border-bottom: 1px solid #ccc;">◎ <xsl:value-of select="." /></h3>
  </xsl:template>


  <xsl:template match="Example">
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

  <xsl:template match="Detail">
    <div style="padding-left: 5px;padding-bottom: 10px;"><xsl:value-of select="." /></div>
  </xsl:template>

  <xsl:template match="Notice">
  <div style="padding: 3px">
    <div style="padding: 5px; border: #ff7f92 dashed 1px; background: #fff;"><xsl:value-of select="." /></div>
  </div>
  </xsl:template>

  <xsl:template match="Creator">
    <div style="font-size: 0.6em; color:darkgray;">制作： <xsl:value-of select="." /></div>
  </xsl:template>

  <xsl:template match="Copyright">
    <div style="font-size: 0.6em; color:darkgray;">Copyright： <xsl:value-of select="." /></div>
  </xsl:template>

</xsl:stylesheet>