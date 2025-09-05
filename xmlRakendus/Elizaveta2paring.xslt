﻿<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="xml" indent="yes"/>

	<xsl:template match="/">
		<strong>Näitme kõik nimed</strong>
		<ul>
			<xsl:for-each select="//inimene">
				<!--descending - suuremast väiksemani-->
				<xsl:sort select="@saasta" order="descending"/>
				<li>
					<xsl:value-of select="nimi"/>
					,
					<xsl:value-of select="@saasta"/>
					: <i>
						<xsl:value-of select="concat(nimi, ', ', @saasta, '.')"/>
					</i>
					, vanus:
					<xsl:value-of select ="2025-@saasta"/>
				</li>
			</xsl:for-each>
		</ul>
		<strong>Kõik andmed tabelina</strong>
		<table border="1">
			<th>Nimi</th>
			<th>Laps</th>
			<th>Sünnipäev</th>
			<th>Vanus</th>
			<xsl:for-each select="//inimene">
				<tr>
					<td>
						<xsl:value-of select="../../nimi"/>
					</td>
					<td>
						<xsl:value-of select="nimi"/>
					</td>
					<td>
						<xsl:value-of select="@saasta"/>
					</td>
					<td>
						<xsl:value-of select="2025-@saasta"/>
					</td>
				</tr>
			</xsl:for-each>
		</table>
		<strong>Iga inimese kohta näita mitmendal oma vanema sünniaastal ta sündis</strong>
		<ul>
		<xsl:for-each select="//inimene">
			<li>
				<xsl:value-of select="nimi"/>
				<xsl:if test="../..">
					-lapsevanema vanus oli
					<xsl:value-of select="../../@saasta - @saasta"/>aasts vana
				</xsl:if>
			</li>
		</xsl:for-each>
		</ul>
		<strong>
			<ol>
				<li>
					Count() - kogus -üldkogus- kõik nimed xmal jadas:
					<xsl:value-of select="count(//nimi)"/>
				</li>
				<li>
					substring()-eralda kolm esimest tähte nimest
					<xsl:for-each select="//inimene">
					<xsl:value-of select ="substring(nimi, 1, 3)"/> | 
					</xsl:for-each>
				</li>
				<li>
					substring()-eralda kolm viimast tähte nimest
					<xsl:for-each select="//inimene">
						<xsl:value-of select ="substring(nimi, string-length(nimi))"/> |
					</xsl:for-each>
				</li>
				<li>starts-with</li>
				<xsl:for-each select="//inimene[starts-with(nimi, 'E')]">
					<xsl:value-of select ="nimi"/>
				</xsl:for-each>
			</ol>
		</strong>
	</xsl:template>
</xsl:stylesheet>
