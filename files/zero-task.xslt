<?xml version="1.0" encoding="utf-8"?>
<x:stylesheet version="1.0" xmlns:x="http://www.w3.org/1999/XSL/Transform" xmlns:ms="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="ms">
	<x:output method="xml" indent="yes"/>

	<x:template match="@*|*">
		<x:copy>
			<x:apply-templates select="@*|*"/>
		</x:copy>
	</x:template>

	<x:template match="variant">
		<x:copy>
			<x:copy-of select="@*"/>
			<x:variable name="g" select="ancestor::group/@id"/>
			<x:variable name="f" select="ancestor::format/@id"/>
			<x:variable name="v" select="@id"/>
			<x:variable name="gfv">
				<x:value-of select="$g"/>
				<x:call-template name="Zeros">
					<x:with-param name="value" select="$f"/>
					<x:with-param name="zeros" select="'000'"/>
				</x:call-template>
				<x:call-template name="Zeros">
					<x:with-param name="value" select="$v"/>
					<x:with-param name="zeros" select="'00'"/>
				</x:call-template>
			</x:variable>
			<x:attribute name="gfv">
				<x:value-of select="$gfv"/>
			</x:attribute>
		</x:copy>
	</x:template>

	<x:template name="Zeros">
		<x:param name="value"/>
		<x:param name="zeros"/>
		<x:if test="string-length($value) &lt; string-length($zeros)">
			<x:value-of select="substring($zeros, 1, string-length($zeros) - string-length($value))"/>
		</x:if>
		<x:value-of select="$value"/>
	</x:template>

</x:stylesheet>
