<x:stylesheet version="1.0" xmlns:x="http://www.w3.org/1999/XSL/Transform">
    <x:output method="xml" indent="yes"/>

    <x:template match="formats|format|format/@*|format/text()">
        <x:copy>
            <x:apply-templates select="*|@*|text()"/>
        </x:copy>
    </x:template>

    <!--Входной фаил classification, включающий аттрибуты gfv -->
    <x:variable name="class" select="document('0task.xml')//format/variant"/>


    <x:template match="format/periodBegin|periodEnd|isStoredInDataTree|isCheckedByDom|orgTypes|alwaysShowInMenu|disabledInRegions">
        <x:copy>
            <x:apply-templates />
        </x:copy>
    </x:template>


    <x:template match="format/name">
        <x:variable name="gfv" select="../@gfv"/>
        <x:variable name="new">
            <x:choose>
                <x:when test="$class[@gfv = $gfv]/@name">
                    <x:value-of select="$class[@gfv = $gfv]/@name"/>
                </x:when>
                <x:when test="$class[@gfv = $gfv]/../@name">
                    <x:value-of select="$class[@gfv = $gfv]/../@name"/>
                </x:when>
                <x:when test="$class[@gfv = $gfv]/../../@name">
                    <x:value-of select="$class[@gfv = $gfv]/../../@name"/>
                </x:when>
            </x:choose>
        </x:variable>
        <x:choose>
            <x:when test="not($new = text()) and not($new = '')">
                <name>
                    <x:attribute name="changed">true</x:attribute>
                    <x:value-of select="$new"/>
                </name>
            </x:when>
            <x:otherwise>
                <x:copy>
                    <x:apply-templates/>
                </x:copy>
            </x:otherwise>
        </x:choose>
    </x:template>

    <x:template match="format/shortName">
        <x:variable name="gfv" select="../@gfv"/>
        <x:variable name="new">
            <x:choose>
                <x:when test="$class[@gfv = $gfv]/@shortName">
                        <x:value-of select="$class[@gfv = $gfv]/@shortName"/>
                </x:when>
                <x:when test="$class[@gfv = $gfv]/../@shortName">
                        <x:value-of select="$class[@gfv = $gfv]/../@shortName"/>
                </x:when>
                <x:when test="$class[@gfv = $gfv]/../../@shortName">
                        <x:value-of select="$class[@gfv = $gfv]/../../@shortName"/>
                </x:when>
            </x:choose>
        </x:variable>
        <x:choose>
            <x:when test="not($new = text()) and not($new = '')">
                <shortName>
                    <x:attribute name="changed">true</x:attribute>
                    <x:value-of select="$new"/>
                </shortName>
            </x:when>
            <x:otherwise>
                <x:copy>
                    <x:apply-templates/>
                </x:copy>
            </x:otherwise>
        </x:choose>
    </x:template>

    <x:template match="format/type">
        <x:variable name="gfv" select="../@gfv"/>
        <x:choose>
            <x:when test="text() = 0">
                <x:copy>
                    <x:apply-templates/>
                </x:copy>
            </x:when>
            <x:when test="not($class[@gfv = $gfv]/../../@id = text())">
                <type>
                    <x:attribute name="changed">true</x:attribute>
                    <x:value-of select="$class[@gfv = $gfv]/../../@id"/>
                </type>
            </x:when>
            <x:otherwise>
                <x:copy>
                    <x:apply-templates/>
                </x:copy>
            </x:otherwise>
        </x:choose>
    </x:template>

    <x:template match="format/knd" xmlns:fp="format-properties">
        <x:variable name="gfv" select="../@gfv"/>
        <x:variable name="new">
            <x:choose>
                <x:when test="$class[@gfv = $gfv]/@fp:КНД">
                        <x:value-of select="$class[@gfv = $gfv]/@fp:КНД"/>
                </x:when>
                <x:when test="$class[@gfv = $gfv]/../@fp:КНД">
                        <x:value-of select="$class[@gfv = $gfv]/../@fp:КНД"/>
                </x:when>
                <x:when test="$class[@gfv = $gfv]/../../@fp:КНД">
                        <x:value-of select="$class[@gfv = $gfv]/../../@fp:КНД"/>
                </x:when>
            </x:choose>
        </x:variable>
        <x:choose>
            <x:when test="not($new = text()) and not($new = '')">
                <knd>
                    <x:attribute name="changed">true</x:attribute>
                    <x:value-of select="$new"/>
                </knd>
            </x:when>
            <x:otherwise>
                <x:copy>
                    <x:apply-templates/>
                </x:copy>
            </x:otherwise>
        </x:choose>
    </x:template>
<!--С версиями нужно уточнение. Есть аттрибуты ВерФОтч и ВерсФорм в адресном пространстве format-properties-->
    <!--а так же два ВерсФорм в стандартном namespace. будет выведен один в порядке упоимнания в данном коментарии-->
    <x:template match="format/version" xmlns:fp="format-properties">
        <x:variable name="gfv" select="../@gfv"/>
        <x:variable name="new">
            <x:choose>
                <x:when test="$class[@gfv = $gfv]/@fp:ВерФОтч">
                        <x:value-of select="$class[@gfv = $gfv]/@fp:ВерФОтч"/>
                </x:when>
                <x:when test="$class[@gfv = $gfv]/../@fp:ВерФОтч">
                        <x:value-of select="$class[@gfv = $gfv]/../@fp:ВерФОтч"/>
                </x:when>
                <x:when test="$class[@gfv = $gfv]/../../@fp:ВерФОтч">
                        <x:value-of select="$class[@gfv = $gfv]/../../@fp:ВерФОтч"/>
                </x:when>
                <x:when test="$class[@gfv = $gfv]/@fp:ВерсФорм">
                        <x:value-of select="$class[@gfv = $gfv]/@fp:ВерсФорм"/>
                </x:when>
                <x:when test="$class[@gfv = $gfv]/../@fp:ВерсФорм">
                        <x:value-of select="$class[@gfv = $gfv]/../@fp:ВерсФорм"/>
                </x:when>
                <x:when test="$class[@gfv = $gfv]/../../@fp:ВерсФорм">
                        <x:value-of select="$class[@gfv = $gfv]/../../@fp:ВерсФорм"/>
                </x:when>
                <x:when test="$class[@gfv = $gfv]/@ВерсФорм">
                        <x:value-of select="$class[@gfv = $gfv]/@ВерсФорм"/>
                </x:when>
                <x:when test="$class[@gfv = $gfv]/../@ВерсФорм">
                        <x:value-of select="$class[@gfv = $gfv]/../@ВерсФорм"/>
                </x:when>
                <x:when test="$class[@gfv = $gfv]/../../@ВерсФорм">
                        <x:value-of select="$class[@gfv = $gfv]/../../@ВерсФорм"/>
                </x:when>
            </x:choose>
        </x:variable>
        <x:choose>
            <x:when test="not($new = text()) and not($new = '')">
                <version>
                    <x:attribute name="changed">true</x:attribute>
                    <x:value-of select="$new"/>
                </version>
            </x:when>
            <x:otherwise>
                <x:copy>
                    <x:apply-templates/>
                </x:copy>
            </x:otherwise>
        </x:choose>
    </x:template>

</x:stylesheet>