.class Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;
.super Ljava/lang/Object;
.source "DateTimeFormatterBuilder.java"

# interfaces
.implements Lorg/joda/time/format/InternalPrinter;
.implements Lorg/joda/time/format/InternalParser;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/joda/time/format/DateTimeFormatterBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "TimeZoneOffset"
.end annotation


# instance fields
.field private final iMaxFields:I

.field private final iMinFields:I

.field private final iShowSeparators:Z

.field private final iZeroOffsetParseText:Ljava/lang/String;

.field private final iZeroOffsetPrintText:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;ZII)V
    .registers 7

    .prologue
    const/4 v0, 0x4

    .line 1964
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1965
    iput-object p1, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->iZeroOffsetPrintText:Ljava/lang/String;

    .line 1966
    iput-object p2, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->iZeroOffsetParseText:Ljava/lang/String;

    .line 1967
    iput-boolean p3, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->iShowSeparators:Z

    .line 1968
    if-lez p4, :cond_e

    if-ge p5, p4, :cond_14

    .line 1969
    :cond_e
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 1971
    :cond_14
    if-le p4, v0, :cond_1c

    move p5, v0

    .line 1975
    :goto_17
    iput v0, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->iMinFields:I

    .line 1976
    iput p5, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->iMaxFields:I

    .line 1977
    return-void

    :cond_1c
    move v0, p4

    goto :goto_17
.end method

.method private digitCount(Ljava/lang/CharSequence;II)I
    .registers 8

    .prologue
    .line 2233
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    sub-int/2addr v0, p2

    invoke-static {v0, p3}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 2234
    const/4 v1, 0x0

    .line 2235
    :goto_a
    if-lez v0, :cond_1a

    .line 2236
    add-int v2, p2, v1

    invoke-interface {p1, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    .line 2237
    const/16 v3, 0x30

    if-lt v2, v3, :cond_1a

    const/16 v3, 0x39

    if-le v2, v3, :cond_1b

    .line 2242
    :cond_1a
    return v1

    .line 2240
    :cond_1b
    add-int/lit8 v1, v1, 0x1

    .line 2235
    add-int/lit8 v0, v0, -0x1

    goto :goto_a
.end method


# virtual methods
.method public estimateParsedLength()I
    .registers 2

    .prologue
    .line 2054
    invoke-virtual {p0}, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->estimatePrintedLength()I

    move-result v0

    return v0
.end method

.method public estimatePrintedLength()I
    .registers 3

    .prologue
    .line 1980
    iget v0, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->iMinFields:I

    add-int/lit8 v0, v0, 0x1

    shl-int/lit8 v0, v0, 0x1

    .line 1981
    iget-boolean v1, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->iShowSeparators:Z

    if-eqz v1, :cond_f

    .line 1982
    iget v1, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->iMinFields:I

    add-int/lit8 v1, v1, -0x1

    add-int/2addr v0, v1

    .line 1984
    :cond_f
    iget-object v1, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->iZeroOffsetPrintText:Ljava/lang/String;

    if-eqz v1, :cond_21

    iget-object v1, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->iZeroOffsetPrintText:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-le v1, v0, :cond_21

    .line 1985
    iget-object v0, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->iZeroOffsetPrintText:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    .line 1987
    :cond_21
    return v0
.end method

.method public parseInto(Lorg/joda/time/format/DateTimeParserBucket;Ljava/lang/CharSequence;I)I
    .registers 13

    .prologue
    const/16 v5, 0x2d

    const/16 v4, 0x2b

    const/4 v2, 0x0

    const/4 v1, 0x1

    const/4 v8, 0x2

    .line 2058
    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    move-result v0

    sub-int v3, v0, p3

    .line 2061
    iget-object v0, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->iZeroOffsetParseText:Ljava/lang/String;

    if-eqz v0, :cond_23

    .line 2062
    iget-object v0, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->iZeroOffsetParseText:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_30

    .line 2064
    if-lez v3, :cond_28

    .line 2065
    invoke-interface {p2, p3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    .line 2066
    if-eq v0, v5, :cond_23

    if-ne v0, v4, :cond_28

    .line 2081
    :cond_23
    if-gt v3, v1, :cond_47

    .line 2082
    xor-int/lit8 p3, p3, -0x1

    .line 2225
    :goto_27
    return p3

    .line 2070
    :cond_28
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/joda/time/format/DateTimeParserBucket;->setOffset(Ljava/lang/Integer;)V

    goto :goto_27

    .line 2073
    :cond_30
    iget-object v0, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->iZeroOffsetParseText:Ljava/lang/String;

    invoke-static {p2, p3, v0}, Lorg/joda/time/format/DateTimeFormatterBuilder;->csStartsWithIgnoreCase(Ljava/lang/CharSequence;ILjava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_23

    .line 2074
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/joda/time/format/DateTimeParserBucket;->setOffset(Ljava/lang/Integer;)V

    .line 2075
    iget-object v0, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->iZeroOffsetParseText:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/2addr p3, v0

    goto :goto_27

    .line 2086
    :cond_47
    invoke-interface {p2, p3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    .line 2087
    if-ne v0, v5, :cond_5b

    move v0, v1

    .line 2095
    :goto_4e
    add-int/lit8 v3, v3, -0x1

    .line 2096
    add-int/lit8 v4, p3, 0x1

    .line 2110
    invoke-direct {p0, p2, v4, v8}, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->digitCount(Ljava/lang/CharSequence;II)I

    move-result v5

    if-ge v5, v8, :cond_62

    .line 2112
    xor-int/lit8 p3, v4, -0x1

    goto :goto_27

    .line 2089
    :cond_5b
    if-ne v0, v4, :cond_5f

    move v0, v2

    .line 2090
    goto :goto_4e

    .line 2092
    :cond_5f
    xor-int/lit8 p3, p3, -0x1

    goto :goto_27

    .line 2117
    :cond_62
    invoke-static {p2, v4}, Lorg/joda/time/format/FormatUtils;->parseTwoDigits(Ljava/lang/CharSequence;I)I

    move-result v5

    .line 2118
    const/16 v6, 0x17

    if-le v5, v6, :cond_6d

    .line 2119
    xor-int/lit8 p3, v4, -0x1

    goto :goto_27

    .line 2121
    :cond_6d
    const v6, 0x36ee80

    mul-int/2addr v5, v6

    .line 2122
    add-int/lit8 v3, v3, -0x2

    .line 2123
    add-int/lit8 v4, v4, 0x2

    .line 2129
    if-gtz v3, :cond_84

    move v1, v5

    move p3, v4

    .line 2224
    :goto_79
    if-eqz v0, :cond_157

    neg-int v0, v1

    :goto_7c
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/joda/time/format/DateTimeParserBucket;->setOffset(Ljava/lang/Integer;)V

    goto :goto_27

    .line 2134
    :cond_84
    invoke-interface {p2, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v6

    .line 2135
    const/16 v7, 0x3a

    if-ne v6, v7, :cond_9e

    .line 2137
    add-int/lit8 v2, v3, -0x1

    .line 2138
    add-int/lit8 v3, v4, 0x1

    move v4, v3

    move v3, v2

    move v2, v1

    .line 2147
    :cond_93
    invoke-direct {p0, p2, v4, v8}, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->digitCount(Ljava/lang/CharSequence;II)I

    move-result v6

    .line 2148
    if-nez v6, :cond_a9

    if-nez v2, :cond_a9

    move v1, v5

    move p3, v4

    .line 2149
    goto :goto_79

    .line 2139
    :cond_9e
    const/16 v7, 0x30

    if-lt v6, v7, :cond_a6

    const/16 v7, 0x39

    if-le v6, v7, :cond_93

    :cond_a6
    move v1, v5

    move p3, v4

    goto :goto_79

    .line 2150
    :cond_a9
    if-ge v6, v8, :cond_af

    .line 2152
    xor-int/lit8 p3, v4, -0x1

    goto/16 :goto_27

    .line 2155
    :cond_af
    invoke-static {p2, v4}, Lorg/joda/time/format/FormatUtils;->parseTwoDigits(Ljava/lang/CharSequence;I)I

    move-result v6

    .line 2156
    const/16 v7, 0x3b

    if-le v6, v7, :cond_bb

    .line 2157
    xor-int/lit8 p3, v4, -0x1

    goto/16 :goto_27

    .line 2159
    :cond_bb
    const v7, 0xea60

    mul-int/2addr v6, v7

    add-int/2addr v5, v6

    .line 2160
    add-int/lit8 v3, v3, -0x2

    .line 2161
    add-int/lit8 v4, v4, 0x2

    .line 2165
    if-gtz v3, :cond_c9

    move v1, v5

    move p3, v4

    .line 2166
    goto :goto_79

    .line 2169
    :cond_c9
    if-eqz v2, :cond_da

    .line 2170
    invoke-interface {p2, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v6

    const/16 v7, 0x3a

    if-eq v6, v7, :cond_d6

    move v1, v5

    move p3, v4

    .line 2171
    goto :goto_79

    .line 2173
    :cond_d6
    add-int/lit8 v3, v3, -0x1

    .line 2174
    add-int/lit8 v4, v4, 0x1

    .line 2177
    :cond_da
    invoke-direct {p0, p2, v4, v8}, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->digitCount(Ljava/lang/CharSequence;II)I

    move-result v6

    .line 2178
    if-nez v6, :cond_e5

    if-nez v2, :cond_e5

    move v1, v5

    move p3, v4

    .line 2179
    goto :goto_79

    .line 2180
    :cond_e5
    if-ge v6, v8, :cond_eb

    .line 2182
    xor-int/lit8 p3, v4, -0x1

    goto/16 :goto_27

    .line 2185
    :cond_eb
    invoke-static {p2, v4}, Lorg/joda/time/format/FormatUtils;->parseTwoDigits(Ljava/lang/CharSequence;I)I

    move-result v6

    .line 2186
    const/16 v7, 0x3b

    if-le v6, v7, :cond_f7

    .line 2187
    xor-int/lit8 p3, v4, -0x1

    goto/16 :goto_27

    .line 2189
    :cond_f7
    mul-int/lit16 v6, v6, 0x3e8

    add-int/2addr v5, v6

    .line 2190
    add-int/lit8 v6, v3, -0x2

    .line 2191
    add-int/lit8 v3, v4, 0x2

    .line 2195
    if-gtz v6, :cond_104

    move v1, v5

    move p3, v3

    .line 2196
    goto/16 :goto_79

    .line 2199
    :cond_104
    if-eqz v2, :cond_11e

    .line 2200
    invoke-interface {p2, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    const/16 v7, 0x2e

    if-eq v4, v7, :cond_11a

    invoke-interface {p2, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    const/16 v7, 0x2c

    if-eq v4, v7, :cond_11a

    move v1, v5

    move p3, v3

    .line 2201
    goto/16 :goto_79

    .line 2203
    :cond_11a
    add-int/lit8 v4, v6, -0x1

    .line 2204
    add-int/lit8 v3, v3, 0x1

    .line 2207
    :cond_11e
    const/4 v4, 0x3

    invoke-direct {p0, p2, v3, v4}, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->digitCount(Ljava/lang/CharSequence;II)I

    move-result v6

    .line 2208
    if-nez v6, :cond_12b

    if-nez v2, :cond_12b

    move v1, v5

    move p3, v3

    .line 2209
    goto/16 :goto_79

    .line 2210
    :cond_12b
    if-ge v6, v1, :cond_131

    .line 2212
    xor-int/lit8 p3, v3, -0x1

    goto/16 :goto_27

    .line 2215
    :cond_131
    add-int/lit8 v4, v3, 0x1

    invoke-interface {p2, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    add-int/lit8 v2, v2, -0x30

    mul-int/lit8 v2, v2, 0x64

    add-int/2addr v2, v5

    .line 2216
    if-le v6, v1, :cond_15d

    .line 2217
    add-int/lit8 v3, v4, 0x1

    invoke-interface {p2, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    add-int/lit8 v1, v1, -0x30

    mul-int/lit8 v1, v1, 0xa

    add-int/2addr v1, v2

    .line 2218
    if-le v6, v8, :cond_15a

    .line 2219
    add-int/lit8 v4, v3, 0x1

    invoke-interface {p2, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    add-int/lit8 v2, v2, -0x30

    add-int/2addr v1, v2

    move p3, v4

    goto/16 :goto_79

    :cond_157
    move v0, v1

    .line 2224
    goto/16 :goto_7c

    :cond_15a
    move p3, v3

    goto/16 :goto_79

    :cond_15d
    move v1, v2

    move p3, v4

    goto/16 :goto_79
.end method

.method public printTo(Ljava/lang/Appendable;JLorg/joda/time/Chronology;ILorg/joda/time/DateTimeZone;Ljava/util/Locale;)V
    .registers 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const v6, 0xea60

    const/16 v5, 0x3a

    const/4 v2, 0x1

    const/4 v4, 0x3

    const/4 v3, 0x2

    .line 1993
    if-nez p6, :cond_b

    .line 2047
    :cond_a
    :goto_a
    return-void

    .line 1996
    :cond_b
    if-nez p5, :cond_17

    iget-object v0, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->iZeroOffsetPrintText:Ljava/lang/String;

    if-eqz v0, :cond_17

    .line 1997
    iget-object v0, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->iZeroOffsetPrintText:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    goto :goto_a

    .line 2000
    :cond_17
    if-ltz p5, :cond_74

    .line 2001
    const/16 v0, 0x2b

    invoke-interface {p1, v0}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 2007
    :goto_1e
    const v0, 0x36ee80

    div-int v0, p5, v0

    .line 2008
    invoke-static {p1, v0, v3}, Lorg/joda/time/format/FormatUtils;->appendPaddedInteger(Ljava/lang/Appendable;II)V

    .line 2009
    iget v1, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->iMaxFields:I

    if-eq v1, v2, :cond_a

    .line 2012
    const v1, 0x36ee80

    mul-int/2addr v0, v1

    sub-int v0, p5, v0

    .line 2013
    if-nez v0, :cond_36

    iget v1, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->iMinFields:I

    if-le v1, v2, :cond_a

    .line 2017
    :cond_36
    div-int v1, v0, v6

    .line 2018
    iget-boolean v2, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->iShowSeparators:Z

    if-eqz v2, :cond_3f

    .line 2019
    invoke-interface {p1, v5}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 2021
    :cond_3f
    invoke-static {p1, v1, v3}, Lorg/joda/time/format/FormatUtils;->appendPaddedInteger(Ljava/lang/Appendable;II)V

    .line 2022
    iget v2, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->iMaxFields:I

    if-eq v2, v3, :cond_a

    .line 2025
    mul-int/2addr v1, v6

    sub-int/2addr v0, v1

    .line 2026
    if-nez v0, :cond_4e

    iget v1, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->iMinFields:I

    if-le v1, v3, :cond_a

    .line 2030
    :cond_4e
    div-int/lit16 v1, v0, 0x3e8

    .line 2031
    iget-boolean v2, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->iShowSeparators:Z

    if-eqz v2, :cond_57

    .line 2032
    invoke-interface {p1, v5}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 2034
    :cond_57
    invoke-static {p1, v1, v3}, Lorg/joda/time/format/FormatUtils;->appendPaddedInteger(Ljava/lang/Appendable;II)V

    .line 2035
    iget v2, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->iMaxFields:I

    if-eq v2, v4, :cond_a

    .line 2038
    mul-int/lit16 v1, v1, 0x3e8

    sub-int/2addr v0, v1

    .line 2039
    if-nez v0, :cond_67

    iget v1, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->iMinFields:I

    if-le v1, v4, :cond_a

    .line 2043
    :cond_67
    iget-boolean v1, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$TimeZoneOffset;->iShowSeparators:Z

    if-eqz v1, :cond_70

    .line 2044
    const/16 v1, 0x2e

    invoke-interface {p1, v1}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 2046
    :cond_70
    invoke-static {p1, v0, v4}, Lorg/joda/time/format/FormatUtils;->appendPaddedInteger(Ljava/lang/Appendable;II)V

    goto :goto_a

    .line 2003
    :cond_74
    const/16 v0, 0x2d

    invoke-interface {p1, v0}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 2004
    neg-int p5, p5

    goto :goto_1e
.end method

.method public printTo(Ljava/lang/Appendable;Lorg/joda/time/ReadablePartial;Ljava/util/Locale;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2051
    return-void
.end method
