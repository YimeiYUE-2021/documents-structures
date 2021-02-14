<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    <!-- Q1
    <xsl:template match="services"/>
    -->
    
    <!-- Q2
    <xsl:template match="ville">
        <ville taille="{string-length(./text())}">
            <xsl:apply-templates/>
        </ville>
    </xsl:template>
    -->
    
    <!-- Q3
    <xsl:template match="adresse">
        <ADRESSE>
            <xsl:value-of select="."/>
        </ADRESSE>
    </xsl:template>
    -->
    
    <!-- Q4
    <xsl:template match="prix">
        <prix nom="{@nom}" id="{@id}" maj="{@maj}" valeur="{concat(@valeur*0.001,'€')}">
            <xsl:apply-templates/>
        </prix>
    </xsl:template>
    -->
    
</xsl:stylesheet>