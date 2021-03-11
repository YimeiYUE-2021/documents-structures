<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match=".">
        <xsl:copy>
            <xsl:apply-templates />
        </xsl:copy>
    </xsl:template>
    
    <!-- traiter tous les textes -->
    <xsl:template match="text()">
        
        <!-- voir si le texte contient l'expression coeur -->
        <xsl:analyze-string select="." regex="[^\w-](coeur)">
            <!-- s'il y en a, ajouter les balises autour -->
            <xsl:matching-substring>
                
                <!-- rajouter l'espace enlever -->
                <xsl:text> </xsl:text>
                <emph xmlns="http://www.tei-c.org/ns/1.0"><xsl:value-of select="regex-group(1)"/></emph>
            </xsl:matching-substring>
            
            <!-- s'il n'y en a pas, copier directement le texte -->
            <xsl:non-matching-substring>
                <xsl:value-of select="."/>
            </xsl:non-matching-substring>
        </xsl:analyze-string>
    </xsl:template>
    
    <xsl:output indent="yes" method="xml"></xsl:output>
</xsl:stylesheet>