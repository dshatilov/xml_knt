<x:stylesheet version="1.0" xmlns:x="http://www.w3.org/1999/XSL/Transform">
    <x:output method="xml" indent="yes"/>

    <x:key name="knd" match="format" use="knd"/>

    <x:template match="formats">
        <formats>
            <x:apply-templates
                    select="format[generate-id(.) = generate-id(key('knd',knd))]"/>
        </formats>
    </x:template>

    <x:template match="format">
        <format knd="{knd}">
            <x:for-each select="key('knd',knd)">
                <gfv>
                    <x:value-of select="@gfv"/>
                </gfv>
            </x:for-each>
        </format>
    </x:template>

</x:stylesheet>