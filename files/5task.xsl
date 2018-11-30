<x:stylesheet version="1.0" xmlns:x="http://www.w3.org/1999/XSL/Transform">
    <x:output method="xml" indent="yes"/>

    <x:key name="knd" match="format" use="knd"/>

    <x:template match="formats">
        <x:text>&#10;</x:text>
        <formats>
            <x:apply-templates
                    select="format[generate-id(.) = generate-id(key('knd',knd))]"/>
        </formats>
    </x:template>

    <x:template match="format">
        <format knd="{knd}">
            <x:text>&#10;</x:text>
            <x:for-each select="key('knd',knd)">
                <x:text>&#x9;</x:text>
                <gfv>
                    <x:value-of select="@gfv"/>
                </gfv>
                <x:text>&#10;</x:text>
            </x:for-each>
        </format>
    </x:template>

</x:stylesheet>