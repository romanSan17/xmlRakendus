<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">

		<strong>Kõik andmed tabelina</strong>
		<strong>punase tekstiga nimed, milles on täht „R”, kollased lahtrid tähendavad, et inimesel on rohkem kui 1 laps</strong>

		<table border="1">
			<tr>
				<th>Nimi</th>
				<th>Laps</th>
				<th>Sünnipäev</th>
				<th>Vanus</th>
				<th>Vanem oli vana</th>
				<th>Elukoht</th>
			</tr>

			<xsl:for-each select="//inimene">

				<xsl:variable name="kidsCount" select="count(lapsed/inimene)"/>

				<tr>
					<xsl:if test="$kidsCount = 2 or $kidsCount = 3">
						<xsl:attribute name="style">background-color:yellow;</xsl:attribute>
					</xsl:if>

					<td>
						<xsl:attribute name="style">
							<xsl:if test="contains(translate(nimi, 'r', 'R'), 'R')">
								<xsl:text>color:red;</xsl:text>
							</xsl:if>
						</xsl:attribute>
						<xsl:value-of select="nimi"/>
					</td>

					<td>
						<xsl:for-each select="lapsed/inimene">
							<xsl:value-of select="nimi"/>
							<xsl:if test="position()!=last()">, </xsl:if>
						</xsl:for-each>
					</td>

					<td>
						<xsl:value-of select="@saasta"/>
					</td>

					<td>
						<xsl:value-of select="2025 - @saasta"/>
					</td>

					<td>
						<xsl:if test="ancestor::inimene">
							<xsl:value-of select="@saasta - ancestor::inimene[1]/@saasta"/>
						</xsl:if>
					</td>
					<td>
						<xsl:value-of select="elukoht"/>
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