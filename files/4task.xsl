<x:stylesheet version="1.0" xmlns:x="http://www.w3.org/1999/XSL/Transform" xmlns:math="http://exslt.org/math" extension-element-prefixes="math">
    <x:output method="xml" indent="yes"/>

    <x:param name="version">0</x:param>
    <x:param name="mode">0</x:param>
<!--0 - strong match; 1 - with subversions-->
    <x:template match="formats">
        <x:copy>
            <x:apply-templates select="format"/>
        </x:copy>
    </x:template>



    <x:template match="formats/format">
        <x:if test="number(version) = number($version) and $mode = 0">
            <x:copy-of select="."/>
        </x:if>
        <x:if test="version &gt;= $version and version &lt; math:power(10, -string-length(substring-after($version, '.')))+$version and $mode = 1">
            <x:copy-of select="."/>
        </x:if>
    </x:template>

</x:stylesheet>