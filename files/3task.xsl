<x:stylesheet version="1.0" xmlns:x="http://www.w3.org/1999/XSL/Transform">
    <x:output method="xml" indent="yes"/>

    <x:param name="type">0</x:param>

    <x:template match="formats">
        <x:copy>
            <x:apply-templates select="format"/>
        </x:copy>
    </x:template>



    <x:template match="formats/format">
        <x:if test="type = $type">
                <x:copy-of select="."/>
        </x:if>
    </x:template>

</x:stylesheet>