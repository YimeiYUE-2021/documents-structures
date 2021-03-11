<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0"
    xmlns:table="urn:oasis:names:tc:opendocument:xmlns:table:1.0"
    xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0"
    xmlns:calcext="urn:org:documentfoundation:names:experimental:calc:xmlns:calcext:1.0"
    exclude-result-prefixes="xs office table text calcext"
    version="2.0">

    <!-- copier tous les noeuds et leurs attributs -->
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- déplacer pour les noeuds table-cell -->
    <xsl:template match="table:table-cell">
        
        <!-- faire un test -->
        <xsl:choose>
            
            <!-- voir si la balise est auto-fermante -->
            <xsl:when test=". = ''">
                <!-- récrire avec Non renseigné -->
                <table:table-cell office:value-type="string" calcext:value-type="string">
                    <text:p>Non renseigné</text:p>
                </table:table-cell>
            </xsl:when>
            
            <!-- sinon, copier directement le noeud et ses enfants -->
            <xsl:otherwise>
                <xsl:copy-of select="."/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:output indent="yes" method="xml"></xsl:output>
</xsl:stylesheet>
