<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="/">
        <xliff version="2.1" xmlns="urn:oasis:names:tc:xliff:document:2.0" srcLang="fr_FR" trgLang="de_DE">
            <file id="exercice-01">
                <!-- apply-templates est une règle récursive, elle va parcourir tous les éléments "key" -->
                <xsl:apply-templates select="/translation/key"/>
            </file>
        </xliff>
    </xsl:template>
    
    <xsl:template match="/translation/key">
        
        <!-- Attention: il faut ajouter le même espace de nom (xmlns) aux fils qu'élément racine -->
        <unit id="{concat('u', position())}" xmlns="urn:oasis:names:tc:xliff:document:2.0">
            <segment xmlns="urn:oasis:names:tc:xliff:document:2.0">
                <source xmlns="urn:oasis:names:tc:xliff:document:2.0">
                    <xsl:value-of select="./val[@lang='fr_FR']"/>
                </source>
                
                <!-- l'élémént <target> n'est pas nécessaire, un test if pour voir s'il a apparu dans le fichier original -->
                <xsl:if test="./val/@lang='de_DE'">
                    <target xmlns="urn:oasis:names:tc:xliff:document:2.0">
                        <xsl:value-of select="./val[@lang='de_DE']"/>
                    </target>
                </xsl:if>
            </segment>
        </unit>
    </xsl:template>
    
    <xsl:output indent="yes" method="xml"></xsl:output>
</xsl:stylesheet>