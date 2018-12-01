<x:stylesheet version="1.0" xmlns:x="http://www.w3.org/1999/XSL/Transform">
    <x:output method="xml" indent="yes"/>

    <x:template match="formats">
        <x:copy>
            <x:apply-templates/>
        </x:copy>
    </x:template>

    <!--<x:template match="text()"/>-->

    <x:template match="format|format/@*">
        <x:choose>
            <x:when test="*/@changed = 'true'">
                <x:copy>
                    <x:attribute name="change">true</x:attribute>
                    <x:apply-templates select="*|@*|text()"/>
                </x:copy>
            </x:when>
            <x:otherwise>
                <x:copy>
                    <x:apply-templates select="*|@*|text()"/>
                </x:copy>
            </x:otherwise>
        </x:choose>
    </x:template>

    <x:template match="format/*">
        <x:copy>
            <x:apply-templates select="text()"/>
        </x:copy>
    </x:template>


</x:stylesheet>