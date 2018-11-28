<x:stylesheet version="1.0" xmlns:x="http://www.w3.org/1999/XSL/Transform">
    <x:output method="xml" indent="yes"/>
    <x:template match="formats">
        <x:copy>
            <x:apply-templates select="@*|*"/>
        </x:copy>
    </x:template>

    <x:template match="format">
        <x:if test="knd != ''">
            <x:copy>
                <x:copy-of select="@gfv"/>
                <x:attribute name="knd">
                    <x:value-of select="knd"/>
                </x:attribute>
            </x:copy>
        </x:if>
    </x:template>

</x:stylesheet>