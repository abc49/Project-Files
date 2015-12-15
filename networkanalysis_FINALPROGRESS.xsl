<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="text"/>
    <xsl:template match="/">
        <xsl:for-each select="//dialogue[curse | slur]/curse|//dialogue[curse | slur]/slur"> <!-- For each CURSE/SLUR in a dialogue with it,-->
            <xsl:variable name="Node1Edge"> <!-- NODE 1 and ATTRIBUTE such as fuck, curse -->
                <xsl:value-of select="@type"/>
                <xsl:text>,</xsl:text>
                <xsl:value-of select="name()"/>
                <xsl:text>,</xsl:text> 
            </xsl:variable>
            <xsl:for-each select="ancestor::dialogue//curse[not(. = current())] | ancestor::dialogue//slur[not(. = current())]">
                <xsl:value-of select="$Node1Edge"/> <!-- NODE 1 and ATTRIBUTE -->
                <xsl:value-of select="./ancestor::screenplay/@title"/> <!-- MOVIE -->
                <xsl:text>,</xsl:text>
                <xsl:value-of select="//role[@xml:id = current()/ancestor::dialogue/@ref]/@gender"/> <!--EDGE ATTRIBUTE: m or f -->
                <xsl:text>,</xsl:text>
                <xsl:value-of select="@type"/>  <!--TARGET NODE -->
                <xsl:text>,</xsl:text>
                <xsl:value-of select="name()"/>  <!--TARGET NODE ATTRIBUTE  -->
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>

<!-- MAYBE PER GENDER
//role[@xml:id = current()/ancestor::dialogue/@ref]/@gender[@g"-->