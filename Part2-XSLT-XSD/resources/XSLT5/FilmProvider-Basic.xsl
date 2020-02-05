<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version=   "1.0">

    <xsl:template match="/films">
        <html>
            <head>
                <title>
                    Liste des Films
                </title>
            </head>
            <body>
                <h1>Films</h1>
                <xsl:apply-templates select="film"/>
            </body>
        </html>



    </xsl:template>
    <xsl:template match="film">
        <xsl:variable name="real" select="@id_realisateur"/>

        <table width="60%">
            <tr>
                <td colspan="2"><b><xsl:value-of select="titre"/></b>
                    <i> (<xsl:value-of select="/films/realisateur[@id_realisateur=$real]/prenom"/>&#160;,
                        <xsl:value-of select="/films/realisateur[@id_realisateur=$real]/nom"/>)</i>
                </td>
            </tr>
            <tr>
                <xsl:variable name="image" select="resume/image/@source"/>
                <xsl:choose>
                    <xsl:when test="$image!= ''">
                        <td>
                            <xsl:element name="img">
                                <xsl:attribute name="src"><xsl:value-of select="resume/image/@source"/></xsl:attribute>
                            </xsl:element>
                        </td>
                    </xsl:when>
                </xsl:choose>


                <xsl:choose>
                    <xsl:when test="$image = ''">
                        <td colspan="2">
                            <xsl:value-of select="resume/text"/>
                        </td>
                    </xsl:when>
                    <xsl:otherwise>
                        <td>
                            <xsl:value-of select="resume/text"/>
                        </td>
                    </xsl:otherwise>
                </xsl:choose>
            </tr>
        </table>
    </xsl:template>
</xsl:stylesheet>
