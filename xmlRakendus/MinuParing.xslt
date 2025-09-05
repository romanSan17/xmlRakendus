<?xml version="1.0" encoding="utf-8"?>
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

		<table border="1">
			<tr>
				<th>Laps</th>
				<th>Vanema sünniaasta</th>
				<th>Lapse sünniaasta</th>
				<th>Vanem oli vana</th>
			</tr>
			<xsl:for-each select="//inimene">
				<tr>

					<td>
						<xsl:value-of select="nimi"/>
					</td>


					<td>
						<xsl:value-of select="../../@saasta"/>
					</td>


					<td>
						<xsl:value-of select="@saasta"/>
					</td>


					<td>
						<xsl:value-of select="@saasta - ../../@saasta"/>
					</td>
				</tr>
			</xsl:for-each>
		</table>


		<table border="1">
			<tr>
				<th>Funktsioon</th>
				<th>Tulemus</th>
			</tr>
			<tr>
				<td>Count() – üldkogus kõik nimed</td>
				<td>
					<xsl:value-of select="count(//nimi)"/>
				</td>
			</tr>
			<tr>
				<td>Substring() – kolm esimest tähte</td>
				<td>
					<xsl:for-each select="//inimene">
						<xsl:value-of select="substring(nimi, 1, 3)"/> |
					</xsl:for-each>
				</td>
			</tr>
			<tr>
				<td>Substring() – kolm viimast tähte</td>
				<td>
					<xsl:for-each select="//inimene">
						<xsl:value-of select="substring(nimi, string-length(nimi) - 2)"/> |
					</xsl:for-each>
				</td>
			</tr>
			<tr>
				<td>Starts-with(nimi, 'R')</td>
				<td>
					<xsl:for-each select="//inimene[starts-with(nimi, 'R')]">
						<xsl:value-of select="nimi"/> |
					</xsl:for-each>
				</td>
			</tr>
		</table>

	</xsl:template>
</xsl:stylesheet>