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
                <td colspan="2">
                    <xsl:value-of select="resume/text"/>
                </td>
            </tr>
        </table>
    </xsl:template>
</xsl:stylesheet>
