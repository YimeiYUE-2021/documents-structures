<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:ds="uri:documents-structures:devoirs-vacances"
    xmlns:foo="http://whatever"
    exclude-result-prefixes="xs ds foo"
    version="2.0">
    
    <!-- préciser le type de sortie, c'est HTML -->
    <xsl:output method="html"/>
    
    <!-- création de fonction echange() -->
    <xsl:function name="foo:echange">
        
        <!-- donner les noms aux deux argument
            et préciser le type de donnée comme float pour l'argument "montant"
        -->
        <xsl:param name="montant" as="xs:float"/>
        <xsl:param name="monnaie"/>
        
        <!-- parcourir les noeuds "monnaie" -->
        <xsl:for-each select="document('conversion.xml')/conversion/monnaie">
            
            <!-- faire un test, choisir le taux d'échange de monnaie cohérent -->
            <xsl:if test="./@target/string()=$monnaie">
                
                <!-- retourner la sortie de fonction -->
                <xsl:value-of select="$montant*./text()"/>
            </xsl:if>
        </xsl:for-each>
    </xsl:function>
  
    <xsl:template match="ds:catalogue">
        <!-- construire la structure d'HTML -->
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <title>Catalogue des produits</title>
            </head>
            <body>
                <h1>Produits</h1>
                
                <table border="1">
                    <tr>
                        <th>Nom</th>
                        <th>Prix en euro</th>
                        <th>Prix en dollar</th>
                        <th>Prix en yuan</th>
                        <th>Prix en won</th>
                    </tr>
                    
                    <!-- parcourir les noeds-fils, ce sont les noeuds "produit" -->
                    <xsl:apply-templates />
                </table>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="produit">
        <!-- créer la ligne -->
        <tr xmlns="http://www.w3.org/1999/xhtml">
            <!-- 1ère colonne : nom de produit -->
            <td><xsl:value-of select="./text()"/></td>
            
            <!-- 2e colonne : prix en euro -->
            <!-- la fonction "format-number(number, format)" pour donner un style d'affichage de nombre -->
            <td><xsl:value-of select="concat(format-number(./@prix, '#,###.00'), ' €')"/></td>
            
            <!-- rappel de fonction pour calculer les prix de monnaies différents -->
            <td><xsl:value-of select="concat(format-number(foo:echange(./@prix, 'dollar'), '#,###.00'),' $')"/></td>
            <td><xsl:value-of select="concat(format-number(foo:echange(./@prix, 'yuan'), '#,###.00'),' ¥')"/></td>
            <td><xsl:value-of select="concat(format-number(foo:echange(./@prix, 'won'), '#,###.00'),' ￦')"/></td>
            
            
        </tr>
    </xsl:template>
</xsl:stylesheet>