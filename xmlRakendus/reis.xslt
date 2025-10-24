<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="html" indent="yes"/>

	<xsl:template match="/">
		<html>
			<head>
				<style>
					.third-level { background-color: yellow; padding: 2px; }
					table { border-collapse: collapse; width: 100%; margin-bottom: 30px; }
					th, td { border: 1px solid black; padding: 5px; text-align: left; }
					tr:nth-child(even) { background-color: #f2f2f2; }
					h1, h2 { font-family: Arial, sans-serif; }
					.high-price { color: red; font-weight: bold; }
				</style>
			</head>
			<body>
				<h1>Reisid</h1>

				<!-- Ülesanne 1 -->
				<h2>Kõik reiside andmed koos hindadega</h2>
				<table>
					<tr>
						<th>Sihtkoht</th>
						<th>Lennujaam</th>
						<th>Lennufirma</th>
						<th>Lend</th>
						<th>Tänav</th>
						<th>Valuuta</th>
						<th>Transpordikulu</th>
						<th>Majutus</th>
						<th>Ekskursioonid</th>
						<th>Kogumaksumus</th>
						<th>Hinnang</th>
					</tr>

					<xsl:for-each select="reisi/reis[transport='Flight']">
						<xsl:sort select="rating" data-type="number" order="descending"/>


						<xsl:variable name="kogumaksumus"
									  select="number(transport_cost) + number(accommodation) + number(excursions)"/>

						<tr>
							<td>
								<xsl:value-of select="city/@city"/>
							</td>
							<td>
								<xsl:value-of select="@airport"/>
							</td>
							<td>
								<xsl:value-of select="@airline"/>
							</td>
							<td>
								<xsl:value-of select="@number"/>
							</td>
							<td>
								<span class="third-level">
									<xsl:value-of select="city/street"/>
								</span>
							</td>
							<td>
								<xsl:value-of select="currency"/>
							</td>
							<td>
								<xsl:value-of select="transport_cost"/>
							</td>
							<td>
								<xsl:value-of select="accommodation"/>
							</td>
							<td>
								<xsl:value-of select="excursions"/>
							</td>

							
							<td>
								<xsl:choose>
									<xsl:when test="$kogumaksumus &gt; 300">
										<span class="high-price">
											<xsl:value-of select="$kogumaksumus"/>
										</span>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="$kogumaksumus"/>
									</xsl:otherwise>
								</xsl:choose>
							</td>

							<td>
								<xsl:value-of select="rating"/>
							</td>
						</tr>
					</xsl:for-each>
				</table>

				<h2>Reisid sorteeritud kogumaksumuse järgi </h2>
				<table>
					<tr>
						<th>Sihtkoht</th>
						<th>Transpord</th>
						<th>Majutus</th>
						<th>Ekskursioonid</th>
						<th>Kogumaksumus</th>
					</tr>

					<xsl:for-each select="reisi/reis">

						<xsl:sort select="number(transport_cost) + number(accommodation) + number(excursions)" data-type="number" order="descending"/>

						<xsl:variable name="kogumaksumus"
									  select="number(transport_cost) + number(accommodation) + number(excursions)"/>

						<tr>
							<td>
								<xsl:value-of select="city/@city"/>
							</td>
							<td>
								<xsl:value-of select="transport_cost"/>
							</td>
							<td>
								<xsl:value-of select="accommodation"/>
							</td>
							<td>
								<xsl:value-of select="excursions"/>
							</td>
							<td>
								<xsl:choose>
									<xsl:when test="$kogumaksumus &gt; 300">
										<span class="high-price">
											<xsl:value-of select="$kogumaksumus"/>
										</span>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="$kogumaksumus"/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</xsl:for-each>
				</table>


				<!-- Ülesanne 3 -->
				<h2>Kõrgeima hinnanguga reisid </h2>
				<table>
					<tr>
						<th>Sihtkoht</th>
						<th>Hinnang</th>
					</tr>
					<xsl:for-each select="reisi/reis[rating > 4.5]">
						<xsl:sort select="rating" data-type="number" order="descending"/>
						<tr>
							<td>
								<xsl:value-of select="city/@city"/>
							</td>
							<td>
								<xsl:value-of select="rating"/>
							</td>
						</tr>
					</xsl:for-each>
				</table>

			</body>
		</html>
	</xsl:template>

</xsl:stylesheet>
