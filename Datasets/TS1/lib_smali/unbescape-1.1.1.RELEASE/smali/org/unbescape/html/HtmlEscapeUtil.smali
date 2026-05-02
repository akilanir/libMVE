.class final Lorg/unbescape/html/HtmlEscapeUtil;
.super Ljava/lang/Object;
.source "HtmlEscapeUtil.java"


# static fields
.field private static HEXA_CHARS_LOWER:[C = null

.field private static HEXA_CHARS_UPPER:[C = null

.field private static final REFERENCE_DECIMAL_PREFIX:[C

.field private static final REFERENCE_HEXA_PREFIX:[C

.field private static final REFERENCE_HEXA_PREFIX3_LOWER:C = 'x'

.field private static final REFERENCE_HEXA_PREFIX3_UPPER:C = 'X'

.field private static final REFERENCE_NUMERIC_PREFIX2:C = '#'

.field private static final REFERENCE_PREFIX:C = '&'

.field private static final REFERENCE_SUFFIX:C = ';'


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 72
    const-string v0, "&#"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lorg/unbescape/html/HtmlEscapeUtil;->REFERENCE_DECIMAL_PREFIX:[C

    .line 73
    const-string v0, "&#x"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lorg/unbescape/html/HtmlEscapeUtil;->REFERENCE_HEXA_PREFIX:[C

    .line 79
    const-string v0, "0123456789ABCDEF"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lorg/unbescape/html/HtmlEscapeUtil;->HEXA_CHARS_UPPER:[C

    .line 80
    const-string v0, "0123456789abcdef"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lorg/unbescape/html/HtmlEscapeUtil;->HEXA_CHARS_LOWER:[C

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 87
    return-void
.end method

.method static escape(Ljava/lang/String;Lorg/unbescape/html/HtmlEscapeType;Lorg/unbescape/html/HtmlEscapeLevel;)Ljava/lang/String;
    .registers 18
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "escapeType"    # Lorg/unbescape/html/HtmlEscapeType;
    .param p2, "escapeLevel"    # Lorg/unbescape/html/HtmlEscapeLevel;

    .prologue
    .line 98
    if-nez p0, :cond_4

    .line 99
    const/4 p0, 0x0

    .line 233
    .end local p0    # "text":Ljava/lang/String;
    :cond_3
    :goto_3
    return-object p0

    .line 102
    .restart local p0    # "text":Ljava/lang/String;
    :cond_4
    invoke-virtual/range {p2 .. p2}, Lorg/unbescape/html/HtmlEscapeLevel;->getEscapeLevel()I

    move-result v3

    .line 103
    .local v3, "level":I
    invoke-virtual/range {p1 .. p1}, Lorg/unbescape/html/HtmlEscapeType;->getUseHtml5()Z

    move-result v11

    .line 104
    .local v11, "useHtml5":Z
    invoke-virtual/range {p1 .. p1}, Lorg/unbescape/html/HtmlEscapeType;->getUseNCRs()Z

    move-result v12

    .line 105
    .local v12, "useNCRs":Z
    invoke-virtual/range {p1 .. p1}, Lorg/unbescape/html/HtmlEscapeType;->getUseHexa()Z

    move-result v10

    .line 107
    .local v10, "useHexa":Z
    if-eqz v11, :cond_33

    sget-object v9, Lorg/unbescape/html/HtmlEscapeSymbols;->HTML5_SYMBOLS:Lorg/unbescape/html/HtmlEscapeSymbols;

    .line 110
    .local v9, "symbols":Lorg/unbescape/html/HtmlEscapeSymbols;
    :goto_18
    const/4 v8, 0x0

    .line 112
    .local v8, "strBuilder":Ljava/lang/StringBuilder;
    const/4 v6, 0x0

    .line 113
    .local v6, "offset":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    .line 115
    .local v4, "max":I
    const/4 v7, 0x0

    .line 117
    .local v7, "readOffset":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_20
    if-ge v2, v4, :cond_b4

    .line 119
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 126
    .local v0, "c":C
    const/16 v13, 0x7f

    if-gt v0, v13, :cond_36

    iget-object v13, v9, Lorg/unbescape/html/HtmlEscapeSymbols;->ESCAPE_LEVELS:[B

    aget-byte v13, v13, v0

    if-ge v3, v13, :cond_36

    .line 117
    :cond_30
    :goto_30
    add-int/lit8 v2, v2, 0x1

    goto :goto_20

    .line 107
    .end local v0    # "c":C
    .end local v2    # "i":I
    .end local v4    # "max":I
    .end local v6    # "offset":I
    .end local v7    # "readOffset":I
    .end local v8    # "strBuilder":Ljava/lang/StringBuilder;
    .end local v9    # "symbols":Lorg/unbescape/html/HtmlEscapeSymbols;
    :cond_33
    sget-object v9, Lorg/unbescape/html/HtmlEscapeSymbols;->HTML4_SYMBOLS:Lorg/unbescape/html/HtmlEscapeSymbols;

    goto :goto_18

    .line 134
    .restart local v0    # "c":C
    .restart local v2    # "i":I
    .restart local v4    # "max":I
    .restart local v6    # "offset":I
    .restart local v7    # "readOffset":I
    .restart local v8    # "strBuilder":Ljava/lang/StringBuilder;
    .restart local v9    # "symbols":Lorg/unbescape/html/HtmlEscapeSymbols;
    :cond_36
    const/16 v13, 0x7f

    if-le v0, v13, :cond_42

    iget-object v13, v9, Lorg/unbescape/html/HtmlEscapeSymbols;->ESCAPE_LEVELS:[B

    const/16 v14, 0x80

    aget-byte v13, v13, v14

    if-lt v3, v13, :cond_30

    .line 143
    :cond_42
    invoke-static {p0, v2}, Ljava/lang/Character;->codePointAt(Ljava/lang/CharSequence;I)I

    move-result v1

    .line 152
    .local v1, "codepoint":I
    if-nez v8, :cond_4f

    .line 153
    new-instance v8, Ljava/lang/StringBuilder;

    .end local v8    # "strBuilder":Ljava/lang/StringBuilder;
    add-int/lit8 v13, v4, 0x14

    invoke-direct {v8, v13}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 156
    .restart local v8    # "strBuilder":Ljava/lang/StringBuilder;
    :cond_4f
    sub-int v13, v2, v7

    if-lez v13, :cond_56

    .line 157
    invoke-virtual {v8, p0, v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 160
    :cond_56
    invoke-static {v1}, Ljava/lang/Character;->charCount(I)I

    move-result v13

    const/4 v14, 0x1

    if-le v13, v14, :cond_5f

    .line 162
    add-int/lit8 v2, v2, 0x1

    .line 165
    :cond_5f
    add-int/lit8 v7, v2, 0x1

    .line 176
    if-eqz v12, :cond_93

    .line 179
    const/16 v13, 0x2fff

    if-ge v1, v13, :cond_75

    .line 182
    iget-object v13, v9, Lorg/unbescape/html/HtmlEscapeSymbols;->NCRS_BY_CODEPOINT:[S

    aget-short v5, v13, v1

    .line 183
    .local v5, "ncrIndex":S
    if-eqz v5, :cond_93

    .line 185
    iget-object v13, v9, Lorg/unbescape/html/HtmlEscapeSymbols;->SORTED_NCRS:[[C

    aget-object v13, v13, v5

    invoke-virtual {v8, v13}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    goto :goto_30

    .line 189
    .end local v5    # "ncrIndex":S
    :cond_75
    iget-object v13, v9, Lorg/unbescape/html/HtmlEscapeSymbols;->NCRS_BY_CODEPOINT_OVERFLOW:Ljava/util/Map;

    if-eqz v13, :cond_93

    .line 192
    iget-object v13, v9, Lorg/unbescape/html/HtmlEscapeSymbols;->NCRS_BY_CODEPOINT_OVERFLOW:Ljava/util/Map;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-interface {v13, v14}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Short;

    .line 193
    .local v5, "ncrIndex":Ljava/lang/Short;
    if-eqz v5, :cond_93

    .line 194
    iget-object v13, v9, Lorg/unbescape/html/HtmlEscapeSymbols;->SORTED_NCRS:[[C

    invoke-virtual {v5}, Ljava/lang/Short;->shortValue()S

    move-result v14

    aget-object v13, v13, v14

    invoke-virtual {v8, v13}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    goto :goto_30

    .line 206
    .end local v5    # "ncrIndex":Ljava/lang/Short;
    :cond_93
    if-eqz v10, :cond_a7

    .line 207
    sget-object v13, Lorg/unbescape/html/HtmlEscapeUtil;->REFERENCE_HEXA_PREFIX:[C

    invoke-virtual {v8, v13}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    .line 208
    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v8, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 213
    :goto_a1
    const/16 v13, 0x3b

    invoke-virtual {v8, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_30

    .line 210
    :cond_a7
    sget-object v13, Lorg/unbescape/html/HtmlEscapeUtil;->REFERENCE_DECIMAL_PREFIX:[C

    invoke-virtual {v8, v13}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    .line 211
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v8, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_a1

    .line 225
    .end local v0    # "c":C
    .end local v1    # "codepoint":I
    :cond_b4
    if-eqz v8, :cond_3

    .line 229
    sub-int v13, v4, v7

    if-lez v13, :cond_bd

    .line 230
    invoke-virtual {v8, p0, v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 233
    :cond_bd
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto/16 :goto_3
.end method

.method static escape([CIILjava/io/Writer;Lorg/unbescape/html/HtmlEscapeType;Lorg/unbescape/html/HtmlEscapeLevel;)V
    .registers 20
    .param p0, "text"    # [C
    .param p1, "offset"    # I
    .param p2, "len"    # I
    .param p3, "writer"    # Ljava/io/Writer;
    .param p4, "escapeType"    # Lorg/unbescape/html/HtmlEscapeType;
    .param p5, "escapeLevel"    # Lorg/unbescape/html/HtmlEscapeLevel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 248
    if-eqz p0, :cond_5

    array-length v12, p0

    if-nez v12, :cond_6

    .line 369
    :cond_5
    :goto_5
    return-void

    .line 252
    :cond_6
    invoke-virtual/range {p5 .. p5}, Lorg/unbescape/html/HtmlEscapeLevel;->getEscapeLevel()I

    move-result v4

    .line 253
    .local v4, "level":I
    invoke-virtual/range {p4 .. p4}, Lorg/unbescape/html/HtmlEscapeType;->getUseHtml5()Z

    move-result v10

    .line 254
    .local v10, "useHtml5":Z
    invoke-virtual/range {p4 .. p4}, Lorg/unbescape/html/HtmlEscapeType;->getUseNCRs()Z

    move-result v11

    .line 255
    .local v11, "useNCRs":Z
    invoke-virtual/range {p4 .. p4}, Lorg/unbescape/html/HtmlEscapeType;->getUseHexa()Z

    move-result v9

    .line 257
    .local v9, "useHexa":Z
    if-eqz v10, :cond_2f

    sget-object v8, Lorg/unbescape/html/HtmlEscapeSymbols;->HTML5_SYMBOLS:Lorg/unbescape/html/HtmlEscapeSymbols;

    .line 260
    .local v8, "symbols":Lorg/unbescape/html/HtmlEscapeSymbols;
    :goto_1a
    add-int v5, p1, p2

    .line 262
    .local v5, "max":I
    move v7, p1

    .line 264
    .local v7, "readOffset":I
    move v3, p1

    .local v3, "i":I
    :goto_1e
    if-ge v3, v5, :cond_b9

    .line 266
    aget-char v1, p0, v3

    .line 273
    .local v1, "c":C
    const/16 v12, 0x7f

    if-gt v1, v12, :cond_32

    iget-object v12, v8, Lorg/unbescape/html/HtmlEscapeSymbols;->ESCAPE_LEVELS:[B

    aget-byte v12, v12, v1

    if-ge v4, v12, :cond_32

    .line 264
    :cond_2c
    :goto_2c
    add-int/lit8 v3, v3, 0x1

    goto :goto_1e

    .line 257
    .end local v1    # "c":C
    .end local v3    # "i":I
    .end local v5    # "max":I
    .end local v7    # "readOffset":I
    .end local v8    # "symbols":Lorg/unbescape/html/HtmlEscapeSymbols;
    :cond_2f
    sget-object v8, Lorg/unbescape/html/HtmlEscapeSymbols;->HTML4_SYMBOLS:Lorg/unbescape/html/HtmlEscapeSymbols;

    goto :goto_1a

    .line 281
    .restart local v1    # "c":C
    .restart local v3    # "i":I
    .restart local v5    # "max":I
    .restart local v7    # "readOffset":I
    .restart local v8    # "symbols":Lorg/unbescape/html/HtmlEscapeSymbols;
    :cond_32
    const/16 v12, 0x7f

    if-le v1, v12, :cond_3e

    iget-object v12, v8, Lorg/unbescape/html/HtmlEscapeSymbols;->ESCAPE_LEVELS:[B

    const/16 v13, 0x80

    aget-byte v12, v12, v13

    if-lt v4, v12, :cond_2c

    .line 289
    :cond_3e
    invoke-static {p0, v3}, Ljava/lang/Character;->codePointAt([CI)I

    move-result v2

    .line 297
    .local v2, "codepoint":I
    sub-int v12, v3, v7

    if-lez v12, :cond_4d

    .line 298
    sub-int v12, v3, v7

    move-object/from16 v0, p3

    invoke-virtual {v0, p0, v7, v12}, Ljava/io/Writer;->write([CII)V

    .line 301
    :cond_4d
    invoke-static {v2}, Ljava/lang/Character;->charCount(I)I

    move-result v12

    const/4 v13, 0x1

    if-le v12, v13, :cond_56

    .line 303
    add-int/lit8 v3, v3, 0x1

    .line 306
    :cond_56
    add-int/lit8 v7, v3, 0x1

    .line 317
    if-eqz v11, :cond_8e

    .line 320
    const/16 v12, 0x2fff

    if-ge v2, v12, :cond_6e

    .line 323
    iget-object v12, v8, Lorg/unbescape/html/HtmlEscapeSymbols;->NCRS_BY_CODEPOINT:[S

    aget-short v6, v12, v2

    .line 324
    .local v6, "ncrIndex":S
    if-eqz v6, :cond_8e

    .line 326
    iget-object v12, v8, Lorg/unbescape/html/HtmlEscapeSymbols;->SORTED_NCRS:[[C

    aget-object v12, v12, v6

    move-object/from16 v0, p3

    invoke-virtual {v0, v12}, Ljava/io/Writer;->write([C)V

    goto :goto_2c

    .line 330
    .end local v6    # "ncrIndex":S
    :cond_6e
    iget-object v12, v8, Lorg/unbescape/html/HtmlEscapeSymbols;->NCRS_BY_CODEPOINT_OVERFLOW:Ljava/util/Map;

    if-eqz v12, :cond_8e

    .line 333
    iget-object v12, v8, Lorg/unbescape/html/HtmlEscapeSymbols;->NCRS_BY_CODEPOINT_OVERFLOW:Ljava/util/Map;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-interface {v12, v13}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Short;

    .line 334
    .local v6, "ncrIndex":Ljava/lang/Short;
    if-eqz v6, :cond_8e

    .line 335
    iget-object v12, v8, Lorg/unbescape/html/HtmlEscapeSymbols;->SORTED_NCRS:[[C

    invoke-virtual {v6}, Ljava/lang/Short;->shortValue()S

    move-result v13

    aget-object v12, v12, v13

    move-object/from16 v0, p3

    invoke-virtual {v0, v12}, Ljava/io/Writer;->write([C)V

    goto :goto_2c

    .line 347
    .end local v6    # "ncrIndex":Ljava/lang/Short;
    :cond_8e
    if-eqz v9, :cond_a8

    .line 348
    sget-object v12, Lorg/unbescape/html/HtmlEscapeUtil;->REFERENCE_HEXA_PREFIX:[C

    move-object/from16 v0, p3

    invoke-virtual {v0, v12}, Ljava/io/Writer;->write([C)V

    .line 349
    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v12

    move-object/from16 v0, p3

    invoke-virtual {v0, v12}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 354
    :goto_a0
    const/16 v12, 0x3b

    move-object/from16 v0, p3

    invoke-virtual {v0, v12}, Ljava/io/Writer;->write(I)V

    goto :goto_2c

    .line 351
    :cond_a8
    sget-object v12, Lorg/unbescape/html/HtmlEscapeUtil;->REFERENCE_DECIMAL_PREFIX:[C

    move-object/from16 v0, p3

    invoke-virtual {v0, v12}, Ljava/io/Writer;->write([C)V

    .line 352
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v12

    move-object/from16 v0, p3

    invoke-virtual {v0, v12}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto :goto_a0

    .line 365
    .end local v1    # "c":C
    .end local v2    # "codepoint":I
    :cond_b9
    sub-int v12, v5, v7

    if-lez v12, :cond_5

    .line 366
    sub-int v12, v5, v7

    move-object/from16 v0, p3

    invoke-virtual {v0, p0, v7, v12}, Ljava/io/Writer;->write([CII)V

    goto/16 :goto_5
.end method

.method static parseIntFromReference(Ljava/lang/String;III)I
    .registers 11
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "start"    # I
    .param p2, "end"    # I
    .param p3, "radix"    # I

    .prologue
    const v5, 0xfffd

    .line 431
    const/4 v4, 0x0

    .line 432
    .local v4, "result":I
    move v1, p1

    .local v1, "i":I
    :goto_5
    if-ge v1, p2, :cond_2c

    .line 433
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 434
    .local v0, "c":C
    const/4 v3, -0x1

    .line 435
    .local v3, "n":I
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_d
    sget-object v6, Lorg/unbescape/html/HtmlEscapeUtil;->HEXA_CHARS_UPPER:[C

    array-length v6, v6

    if-ge v2, v6, :cond_1f

    .line 436
    sget-object v6, Lorg/unbescape/html/HtmlEscapeUtil;->HEXA_CHARS_UPPER:[C

    aget-char v6, v6, v2

    if-eq v0, v6, :cond_1e

    sget-object v6, Lorg/unbescape/html/HtmlEscapeUtil;->HEXA_CHARS_LOWER:[C

    aget-char v6, v6, v2

    if-ne v0, v6, :cond_23

    .line 437
    :cond_1e
    move v3, v2

    .line 441
    :cond_1f
    mul-int/2addr v4, p3

    .line 442
    if-gez v4, :cond_26

    .line 450
    .end local v0    # "c":C
    .end local v2    # "j":I
    .end local v3    # "n":I
    :cond_22
    :goto_22
    return v5

    .line 435
    .restart local v0    # "c":C
    .restart local v2    # "j":I
    .restart local v3    # "n":I
    :cond_23
    add-int/lit8 v2, v2, 0x1

    goto :goto_d

    .line 445
    :cond_26
    add-int/2addr v4, v3

    .line 446
    if-ltz v4, :cond_22

    .line 432
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .end local v0    # "c":C
    .end local v2    # "j":I
    .end local v3    # "n":I
    :cond_2c
    move v5, v4

    .line 450
    goto :goto_22
.end method

.method static parseIntFromReference([CIII)I
    .registers 11
    .param p0, "text"    # [C
    .param p1, "start"    # I
    .param p2, "end"    # I
    .param p3, "radix"    # I

    .prologue
    const v5, 0xfffd

    .line 454
    const/4 v4, 0x0

    .line 455
    .local v4, "result":I
    move v1, p1

    .local v1, "i":I
    :goto_5
    if-ge v1, p2, :cond_2a

    .line 456
    aget-char v0, p0, v1

    .line 457
    .local v0, "c":C
    const/4 v3, -0x1

    .line 458
    .local v3, "n":I
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_b
    sget-object v6, Lorg/unbescape/html/HtmlEscapeUtil;->HEXA_CHARS_UPPER:[C

    array-length v6, v6

    if-ge v2, v6, :cond_1d

    .line 459
    sget-object v6, Lorg/unbescape/html/HtmlEscapeUtil;->HEXA_CHARS_UPPER:[C

    aget-char v6, v6, v2

    if-eq v0, v6, :cond_1c

    sget-object v6, Lorg/unbescape/html/HtmlEscapeUtil;->HEXA_CHARS_LOWER:[C

    aget-char v6, v6, v2

    if-ne v0, v6, :cond_21

    .line 460
    :cond_1c
    move v3, v2

    .line 464
    :cond_1d
    mul-int/2addr v4, p3

    .line 465
    if-gez v4, :cond_24

    .line 473
    .end local v0    # "c":C
    .end local v2    # "j":I
    .end local v3    # "n":I
    :cond_20
    :goto_20
    return v5

    .line 458
    .restart local v0    # "c":C
    .restart local v2    # "j":I
    .restart local v3    # "n":I
    :cond_21
    add-int/lit8 v2, v2, 0x1

    goto :goto_b

    .line 468
    :cond_24
    add-int/2addr v4, v3

    .line 469
    if-ltz v4, :cond_20

    .line 455
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .end local v0    # "c":C
    .end local v2    # "j":I
    .end local v3    # "n":I
    :cond_2a
    move v5, v4

    .line 473
    goto :goto_20
.end method

.method static translateIllFormedCodepoint(I)I
    .registers 3
    .param p0, "codepoint"    # I

    .prologue
    const v0, 0xfffd

    .line 383
    sparse-switch p0, :sswitch_data_6c

    .line 414
    const v1, 0xd800

    if-lt p0, v1, :cond_65

    const v1, 0xdfff

    if-gt p0, v1, :cond_65

    move p0, v0

    .line 419
    .end local p0    # "codepoint":I
    :cond_11
    :goto_11
    return p0

    .restart local p0    # "codepoint":I
    :sswitch_12
    move p0, v0

    .line 384
    goto :goto_11

    .line 385
    :sswitch_14
    const/16 p0, 0x20ac

    goto :goto_11

    .line 386
    :sswitch_17
    const/16 p0, 0x201a

    goto :goto_11

    .line 387
    :sswitch_1a
    const/16 p0, 0x192

    goto :goto_11

    .line 388
    :sswitch_1d
    const/16 p0, 0x201e

    goto :goto_11

    .line 389
    :sswitch_20
    const/16 p0, 0x2026

    goto :goto_11

    .line 390
    :sswitch_23
    const/16 p0, 0x2020

    goto :goto_11

    .line 391
    :sswitch_26
    const/16 p0, 0x2021

    goto :goto_11

    .line 392
    :sswitch_29
    const/16 p0, 0x2c6

    goto :goto_11

    .line 393
    :sswitch_2c
    const/16 p0, 0x2030

    goto :goto_11

    .line 394
    :sswitch_2f
    const/16 p0, 0x160

    goto :goto_11

    .line 395
    :sswitch_32
    const/16 p0, 0x2039

    goto :goto_11

    .line 396
    :sswitch_35
    const/16 p0, 0x152

    goto :goto_11

    .line 397
    :sswitch_38
    const/16 p0, 0x17d

    goto :goto_11

    .line 398
    :sswitch_3b
    const/16 p0, 0x2018

    goto :goto_11

    .line 399
    :sswitch_3e
    const/16 p0, 0x2019

    goto :goto_11

    .line 400
    :sswitch_41
    const/16 p0, 0x201c

    goto :goto_11

    .line 401
    :sswitch_44
    const/16 p0, 0x201d

    goto :goto_11

    .line 402
    :sswitch_47
    const/16 p0, 0x2022

    goto :goto_11

    .line 403
    :sswitch_4a
    const/16 p0, 0x2013

    goto :goto_11

    .line 404
    :sswitch_4d
    const/16 p0, 0x2014

    goto :goto_11

    .line 405
    :sswitch_50
    const/16 p0, 0x2dc

    goto :goto_11

    .line 406
    :sswitch_53
    const/16 p0, 0x2122

    goto :goto_11

    .line 407
    :sswitch_56
    const/16 p0, 0x161

    goto :goto_11

    .line 408
    :sswitch_59
    const/16 p0, 0x203a

    goto :goto_11

    .line 409
    :sswitch_5c
    const/16 p0, 0x153

    goto :goto_11

    .line 410
    :sswitch_5f
    const/16 p0, 0x17e

    goto :goto_11

    .line 411
    :sswitch_62
    const/16 p0, 0x178

    goto :goto_11

    .line 416
    :cond_65
    const v1, 0x10ffff

    if-le p0, v1, :cond_11

    move p0, v0

    .line 417
    goto :goto_11

    .line 383
    :sswitch_data_6c
    .sparse-switch
        0x0 -> :sswitch_12
        0x80 -> :sswitch_14
        0x82 -> :sswitch_17
        0x83 -> :sswitch_1a
        0x84 -> :sswitch_1d
        0x85 -> :sswitch_20
        0x86 -> :sswitch_23
        0x87 -> :sswitch_26
        0x88 -> :sswitch_29
        0x89 -> :sswitch_2c
        0x8a -> :sswitch_2f
        0x8b -> :sswitch_32
        0x8c -> :sswitch_35
        0x8e -> :sswitch_38
        0x91 -> :sswitch_3b
        0x92 -> :sswitch_3e
        0x93 -> :sswitch_41
        0x94 -> :sswitch_44
        0x95 -> :sswitch_47
        0x96 -> :sswitch_4a
        0x97 -> :sswitch_4d
        0x98 -> :sswitch_50
        0x99 -> :sswitch_53
        0x9a -> :sswitch_56
        0x9b -> :sswitch_59
        0x9c -> :sswitch_5c
        0x9e -> :sswitch_5f
        0x9f -> :sswitch_62
    .end sparse-switch
.end method

.method static unescape(Ljava/lang/String;)Ljava/lang/String;
    .registers 24
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 491
    if-nez p0, :cond_5

    .line 492
    const/16 p0, 0x0

    .line 711
    .end local p0    # "text":Ljava/lang/String;
    .local v10, "i":I
    .local v11, "max":I
    .local v13, "offset":I
    .local v16, "readOffset":I
    .local v17, "referenceOffset":I
    .local v18, "strBuilder":Ljava/lang/StringBuilder;
    .local v19, "symbols":Lorg/unbescape/html/HtmlEscapeSymbols;
    :cond_4
    :goto_4
    return-object p0

    .line 496
    .end local v10    # "i":I
    .end local v11    # "max":I
    .end local v13    # "offset":I
    .end local v16    # "readOffset":I
    .end local v17    # "referenceOffset":I
    .end local v18    # "strBuilder":Ljava/lang/StringBuilder;
    .end local v19    # "symbols":Lorg/unbescape/html/HtmlEscapeSymbols;
    .restart local p0    # "text":Ljava/lang/String;
    :cond_5
    sget-object v19, Lorg/unbescape/html/HtmlEscapeSymbols;->HTML5_SYMBOLS:Lorg/unbescape/html/HtmlEscapeSymbols;

    .line 497
    .restart local v19    # "symbols":Lorg/unbescape/html/HtmlEscapeSymbols;
    const/16 v18, 0x0

    .line 499
    .restart local v18    # "strBuilder":Ljava/lang/StringBuilder;
    const/4 v13, 0x0

    .line 500
    .restart local v13    # "offset":I
    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v11

    .line 502
    .restart local v11    # "max":I
    const/16 v16, 0x0

    .line 503
    .restart local v16    # "readOffset":I
    const/16 v17, 0x0

    .line 505
    .restart local v17    # "referenceOffset":I
    const/4 v10, 0x0

    .restart local v10    # "i":I
    :goto_13
    if-ge v10, v11, :cond_28b

    .line 507
    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 513
    .local v3, "c":C
    const/16 v20, 0x26

    move/from16 v0, v20

    if-ne v3, v0, :cond_27

    add-int/lit8 v20, v10, 0x1

    move/from16 v0, v20

    if-lt v0, v11, :cond_2a

    .line 505
    :cond_27
    :goto_27
    add-int/lit8 v10, v10, 0x1

    goto :goto_13

    .line 517
    :cond_2a
    const/4 v7, 0x0

    .line 519
    .local v7, "codepoint":I
    const/16 v20, 0x26

    move/from16 v0, v20

    if-ne v3, v0, :cond_e1

    .line 521
    add-int/lit8 v20, v10, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 523
    .local v4, "c1":C
    const/16 v20, 0x20

    move/from16 v0, v20

    if-eq v4, v0, :cond_27

    const/16 v20, 0xa

    move/from16 v0, v20

    if-eq v4, v0, :cond_27

    const/16 v20, 0x9

    move/from16 v0, v20

    if-eq v4, v0, :cond_27

    const/16 v20, 0xc

    move/from16 v0, v20

    if-eq v4, v0, :cond_27

    const/16 v20, 0x3c

    move/from16 v0, v20

    if-eq v4, v0, :cond_27

    const/16 v20, 0x26

    move/from16 v0, v20

    if-eq v4, v0, :cond_27

    .line 532
    const/16 v20, 0x23

    move/from16 v0, v20

    if-ne v4, v0, :cond_16a

    .line 534
    add-int/lit8 v20, v10, 0x2

    move/from16 v0, v20

    if-ge v0, v11, :cond_27

    .line 539
    add-int/lit8 v20, v10, 0x2

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v5

    .line 541
    .local v5, "c2":C
    const/16 v20, 0x78

    move/from16 v0, v20

    if-eq v5, v0, :cond_81

    const/16 v20, 0x58

    move/from16 v0, v20

    if-ne v5, v0, :cond_117

    :cond_81
    add-int/lit8 v20, v10, 0x3

    move/from16 v0, v20

    if-ge v0, v11, :cond_117

    .line 544
    add-int/lit8 v9, v10, 0x3

    .line 545
    .local v9, "f":I
    :goto_89
    if-ge v9, v11, :cond_b5

    .line 546
    move-object/from16 v0, p0

    invoke-virtual {v0, v9}, Ljava/lang/String;->charAt(I)C

    move-result v6

    .line 547
    .local v6, "cf":C
    const/16 v20, 0x30

    move/from16 v0, v20

    if-lt v6, v0, :cond_9d

    const/16 v20, 0x39

    move/from16 v0, v20

    if-le v6, v0, :cond_113

    :cond_9d
    const/16 v20, 0x41

    move/from16 v0, v20

    if-lt v6, v0, :cond_a9

    const/16 v20, 0x46

    move/from16 v0, v20

    if-le v6, v0, :cond_113

    :cond_a9
    const/16 v20, 0x61

    move/from16 v0, v20

    if-lt v6, v0, :cond_b5

    const/16 v20, 0x66

    move/from16 v0, v20

    if-le v6, v0, :cond_113

    .line 553
    .end local v6    # "cf":C
    :cond_b5
    add-int/lit8 v20, v10, 0x3

    sub-int v20, v9, v20

    if-lez v20, :cond_27

    .line 558
    add-int/lit8 v20, v10, 0x3

    const/16 v21, 0x10

    move-object/from16 v0, p0

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-static {v0, v1, v9, v2}, Lorg/unbescape/html/HtmlEscapeUtil;->parseIntFromReference(Ljava/lang/String;III)I

    move-result v7

    .line 559
    add-int/lit8 v17, v9, -0x1

    .line 561
    if-ge v9, v11, :cond_dd

    move-object/from16 v0, p0

    invoke-virtual {v0, v9}, Ljava/lang/String;->charAt(I)C

    move-result v20

    const/16 v21, 0x3b

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_dd

    .line 562
    add-int/lit8 v17, v17, 0x1

    .line 565
    :cond_dd
    invoke-static {v7}, Lorg/unbescape/html/HtmlEscapeUtil;->translateIllFormedCodepoint(I)I

    move-result v7

    .line 655
    .end local v4    # "c1":C
    .end local v5    # "c2":C
    .end local v9    # "f":I
    :cond_e1
    :goto_e1
    if-nez v18, :cond_ee

    .line 656
    new-instance v18, Ljava/lang/StringBuilder;

    .end local v18    # "strBuilder":Ljava/lang/StringBuilder;
    add-int/lit8 v20, v11, 0x5

    move-object/from16 v0, v18

    move/from16 v1, v20

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 659
    .restart local v18    # "strBuilder":Ljava/lang/StringBuilder;
    :cond_ee
    sub-int v20, v10, v16

    if-lez v20, :cond_fb

    .line 660
    move-object/from16 v0, v18

    move-object/from16 v1, p0

    move/from16 v2, v16

    invoke-virtual {v0, v1, v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 663
    :cond_fb
    move/from16 v10, v17

    .line 664
    add-int/lit8 v16, v10, 0x1

    .line 674
    const v20, 0xffff

    move/from16 v0, v20

    if-le v7, v0, :cond_214

    .line 675
    invoke-static {v7}, Ljava/lang/Character;->toChars(I)[C

    move-result-object v20

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    goto/16 :goto_27

    .line 550
    .restart local v4    # "c1":C
    .restart local v5    # "c2":C
    .restart local v6    # "cf":C
    .restart local v9    # "f":I
    :cond_113
    add-int/lit8 v9, v9, 0x1

    .line 551
    goto/16 :goto_89

    .line 569
    .end local v6    # "cf":C
    .end local v9    # "f":I
    :cond_117
    const/16 v20, 0x30

    move/from16 v0, v20

    if-lt v5, v0, :cond_27

    const/16 v20, 0x39

    move/from16 v0, v20

    if-gt v5, v0, :cond_27

    .line 572
    add-int/lit8 v9, v10, 0x2

    .line 573
    .restart local v9    # "f":I
    :goto_125
    if-ge v9, v11, :cond_139

    .line 574
    move-object/from16 v0, p0

    invoke-virtual {v0, v9}, Ljava/lang/String;->charAt(I)C

    move-result v6

    .line 575
    .restart local v6    # "cf":C
    const/16 v20, 0x30

    move/from16 v0, v20

    if-lt v6, v0, :cond_139

    const/16 v20, 0x39

    move/from16 v0, v20

    if-le v6, v0, :cond_167

    .line 581
    .end local v6    # "cf":C
    :cond_139
    add-int/lit8 v20, v10, 0x2

    sub-int v20, v9, v20

    if-lez v20, :cond_27

    .line 586
    add-int/lit8 v20, v10, 0x2

    const/16 v21, 0xa

    move-object/from16 v0, p0

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-static {v0, v1, v9, v2}, Lorg/unbescape/html/HtmlEscapeUtil;->parseIntFromReference(Ljava/lang/String;III)I

    move-result v7

    .line 587
    add-int/lit8 v17, v9, -0x1

    .line 589
    if-ge v9, v11, :cond_161

    move-object/from16 v0, p0

    invoke-virtual {v0, v9}, Ljava/lang/String;->charAt(I)C

    move-result v20

    const/16 v21, 0x3b

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_161

    .line 590
    add-int/lit8 v17, v17, 0x1

    .line 593
    :cond_161
    invoke-static {v7}, Lorg/unbescape/html/HtmlEscapeUtil;->translateIllFormedCodepoint(I)I

    move-result v7

    goto/16 :goto_e1

    .line 578
    .restart local v6    # "cf":C
    :cond_167
    add-int/lit8 v9, v9, 0x1

    .line 579
    goto :goto_125

    .line 607
    .end local v5    # "c2":C
    .end local v6    # "cf":C
    .end local v9    # "f":I
    :cond_16a
    add-int/lit8 v9, v10, 0x1

    .line 608
    .restart local v9    # "f":I
    :goto_16c
    if-ge v9, v11, :cond_198

    .line 609
    move-object/from16 v0, p0

    invoke-virtual {v0, v9}, Ljava/lang/String;->charAt(I)C

    move-result v6

    .line 610
    .restart local v6    # "cf":C
    const/16 v20, 0x61

    move/from16 v0, v20

    if-lt v6, v0, :cond_180

    const/16 v20, 0x7a

    move/from16 v0, v20

    if-le v6, v0, :cond_1cc

    :cond_180
    const/16 v20, 0x41

    move/from16 v0, v20

    if-lt v6, v0, :cond_18c

    const/16 v20, 0x5a

    move/from16 v0, v20

    if-le v6, v0, :cond_1cc

    :cond_18c
    const/16 v20, 0x30

    move/from16 v0, v20

    if-lt v6, v0, :cond_198

    const/16 v20, 0x39

    move/from16 v0, v20

    if-le v6, v0, :cond_1cc

    .line 616
    .end local v6    # "cf":C
    :cond_198
    add-int/lit8 v20, v10, 0x1

    sub-int v20, v9, v20

    if-lez v20, :cond_27

    .line 621
    if-ge v9, v11, :cond_1b0

    move-object/from16 v0, p0

    invoke-virtual {v0, v9}, Ljava/lang/String;->charAt(I)C

    move-result v20

    const/16 v21, 0x3b

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_1b0

    .line 622
    add-int/lit8 v9, v9, 0x1

    .line 625
    :cond_1b0
    move-object/from16 v0, v19

    iget-object v0, v0, Lorg/unbescape/html/HtmlEscapeSymbols;->SORTED_NCRS:[[C

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    invoke-static {v0, v1, v10, v9}, Lorg/unbescape/html/HtmlEscapeSymbols;->binarySearch([[CLjava/lang/String;II)I

    move-result v12

    .line 626
    .local v12, "ncrPosition":I
    if-ltz v12, :cond_1cf

    .line 627
    move-object/from16 v0, v19

    iget-object v0, v0, Lorg/unbescape/html/HtmlEscapeSymbols;->SORTED_CODEPOINTS:[I

    move-object/from16 v20, v0

    aget v7, v20, v12

    .line 642
    :goto_1c8
    add-int/lit8 v17, v9, -0x1

    goto/16 :goto_e1

    .line 613
    .end local v12    # "ncrPosition":I
    .restart local v6    # "cf":C
    :cond_1cc
    add-int/lit8 v9, v9, 0x1

    .line 614
    goto :goto_16c

    .line 628
    .end local v6    # "cf":C
    .restart local v12    # "ncrPosition":I
    :cond_1cf
    const/high16 v20, -0x80000000

    move/from16 v0, v20

    if-eq v12, v0, :cond_27

    .line 631
    const/16 v20, -0xa

    move/from16 v0, v20

    if-ge v12, v0, :cond_1f9

    .line 633
    add-int/lit8 v20, v12, 0xa

    mul-int/lit8 v14, v20, -0x1

    .line 634
    .local v14, "partialIndex":I
    move-object/from16 v0, v19

    iget-object v0, v0, Lorg/unbescape/html/HtmlEscapeSymbols;->SORTED_NCRS:[[C

    move-object/from16 v20, v0

    aget-object v15, v20, v14

    .line 635
    .local v15, "partialMatch":[C
    move-object/from16 v0, v19

    iget-object v0, v0, Lorg/unbescape/html/HtmlEscapeSymbols;->SORTED_CODEPOINTS:[I

    move-object/from16 v20, v0

    aget v7, v20, v14

    .line 636
    sub-int v20, v9, v10

    array-length v0, v15

    move/from16 v21, v0

    sub-int v20, v20, v21

    sub-int v9, v9, v20

    .line 637
    goto :goto_1c8

    .line 639
    .end local v14    # "partialIndex":I
    .end local v15    # "partialMatch":[C
    :cond_1f9
    new-instance v20, Ljava/lang/RuntimeException;

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "Invalid unescape codepoint after search: "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-direct/range {v20 .. v21}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v20

    .line 676
    .end local v4    # "c1":C
    .end local v9    # "f":I
    .end local v12    # "ncrPosition":I
    :cond_214
    if-gez v7, :cond_27f

    .line 678
    move-object/from16 v0, v19

    iget-object v0, v0, Lorg/unbescape/html/HtmlEscapeSymbols;->DOUBLE_CODEPOINTS:[[I

    move-object/from16 v20, v0

    mul-int/lit8 v21, v7, -0x1

    add-int/lit8 v21, v21, -0x1

    aget-object v8, v20, v21

    .line 679
    .local v8, "codepoints":[I
    const/16 v20, 0x0

    aget v20, v8, v20

    const v21, 0xffff

    move/from16 v0, v20

    move/from16 v1, v21

    if-le v0, v1, :cond_25c

    .line 680
    const/16 v20, 0x0

    aget v20, v8, v20

    invoke-static/range {v20 .. v20}, Ljava/lang/Character;->toChars(I)[C

    move-result-object v20

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    .line 684
    :goto_23e
    const/16 v20, 0x1

    aget v20, v8, v20

    const v21, 0xffff

    move/from16 v0, v20

    move/from16 v1, v21

    if-le v0, v1, :cond_26d

    .line 685
    const/16 v20, 0x1

    aget v20, v8, v20

    invoke-static/range {v20 .. v20}, Ljava/lang/Character;->toChars(I)[C

    move-result-object v20

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    goto/16 :goto_27

    .line 682
    :cond_25c
    const/16 v20, 0x0

    aget v20, v8, v20

    move/from16 v0, v20

    int-to-char v0, v0

    move/from16 v20, v0

    move-object/from16 v0, v18

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_23e

    .line 687
    :cond_26d
    const/16 v20, 0x1

    aget v20, v8, v20

    move/from16 v0, v20

    int-to-char v0, v0

    move/from16 v20, v0

    move-object/from16 v0, v18

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_27

    .line 690
    .end local v8    # "codepoints":[I
    :cond_27f
    int-to-char v0, v7

    move/from16 v20, v0

    move-object/from16 v0, v18

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_27

    .line 703
    .end local v3    # "c":C
    .end local v7    # "codepoint":I
    :cond_28b
    if-eqz v18, :cond_4

    .line 707
    sub-int v20, v11, v16

    if-lez v20, :cond_29a

    .line 708
    move-object/from16 v0, v18

    move-object/from16 v1, p0

    move/from16 v2, v16

    invoke-virtual {v0, v1, v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 711
    :cond_29a
    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto/16 :goto_4
.end method

.method static unescape([CIILjava/io/Writer;)V
    .registers 25
    .param p0, "text"    # [C
    .param p1, "offset"    # I
    .param p2, "len"    # I
    .param p3, "writer"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 728
    if-nez p0, :cond_3

    .line 935
    :cond_2
    :goto_2
    return-void

    .line 732
    :cond_3
    sget-object v17, Lorg/unbescape/html/HtmlEscapeSymbols;->HTML5_SYMBOLS:Lorg/unbescape/html/HtmlEscapeSymbols;

    .line 734
    .local v17, "symbols":Lorg/unbescape/html/HtmlEscapeSymbols;
    add-int v11, p1, p2

    .line 736
    .local v11, "max":I
    move/from16 v15, p1

    .line 737
    .local v15, "readOffset":I
    move/from16 v16, p1

    .line 739
    .local v16, "referenceOffset":I
    move/from16 v10, p1

    .local v10, "i":I
    :goto_d
    if-ge v10, v11, :cond_250

    .line 741
    aget-char v3, p0, v10

    .line 747
    .local v3, "c":C
    const/16 v18, 0x26

    move/from16 v0, v18

    if-ne v3, v0, :cond_1d

    add-int/lit8 v18, v10, 0x1

    move/from16 v0, v18

    if-lt v0, v11, :cond_20

    .line 739
    :cond_1d
    :goto_1d
    add-int/lit8 v10, v10, 0x1

    goto :goto_d

    .line 751
    :cond_20
    const/4 v7, 0x0

    .line 753
    .local v7, "codepoint":I
    const/16 v18, 0x26

    move/from16 v0, v18

    if-ne v3, v0, :cond_c3

    .line 755
    add-int/lit8 v18, v10, 0x1

    aget-char v4, p0, v18

    .line 757
    .local v4, "c1":C
    const/16 v18, 0x20

    move/from16 v0, v18

    if-eq v4, v0, :cond_1d

    const/16 v18, 0xa

    move/from16 v0, v18

    if-eq v4, v0, :cond_1d

    const/16 v18, 0x9

    move/from16 v0, v18

    if-eq v4, v0, :cond_1d

    const/16 v18, 0xc

    move/from16 v0, v18

    if-eq v4, v0, :cond_1d

    const/16 v18, 0x3c

    move/from16 v0, v18

    if-eq v4, v0, :cond_1d

    const/16 v18, 0x26

    move/from16 v0, v18

    if-eq v4, v0, :cond_1d

    .line 766
    const/16 v18, 0x23

    move/from16 v0, v18

    if-ne v4, v0, :cond_137

    .line 768
    add-int/lit8 v18, v10, 0x2

    move/from16 v0, v18

    if-ge v0, v11, :cond_1d

    .line 773
    add-int/lit8 v18, v10, 0x2

    aget-char v5, p0, v18

    .line 775
    .local v5, "c2":C
    const/16 v18, 0x78

    move/from16 v0, v18

    if-eq v5, v0, :cond_6b

    const/16 v18, 0x58

    move/from16 v0, v18

    if-ne v5, v0, :cond_ed

    :cond_6b
    add-int/lit8 v18, v10, 0x3

    move/from16 v0, v18

    if-ge v0, v11, :cond_ed

    .line 778
    add-int/lit8 v9, v10, 0x3

    .line 779
    .local v9, "f":I
    :goto_73
    if-ge v9, v11, :cond_9b

    .line 780
    aget-char v6, p0, v9

    .line 781
    .local v6, "cf":C
    const/16 v18, 0x30

    move/from16 v0, v18

    if-lt v6, v0, :cond_83

    const/16 v18, 0x39

    move/from16 v0, v18

    if-le v6, v0, :cond_ea

    :cond_83
    const/16 v18, 0x41

    move/from16 v0, v18

    if-lt v6, v0, :cond_8f

    const/16 v18, 0x46

    move/from16 v0, v18

    if-le v6, v0, :cond_ea

    :cond_8f
    const/16 v18, 0x61

    move/from16 v0, v18

    if-lt v6, v0, :cond_9b

    const/16 v18, 0x66

    move/from16 v0, v18

    if-le v6, v0, :cond_ea

    .line 787
    .end local v6    # "cf":C
    :cond_9b
    add-int/lit8 v18, v10, 0x3

    sub-int v18, v9, v18

    if-lez v18, :cond_1d

    .line 792
    add-int/lit8 v18, v10, 0x3

    const/16 v19, 0x10

    move-object/from16 v0, p0

    move/from16 v1, v18

    move/from16 v2, v19

    invoke-static {v0, v1, v9, v2}, Lorg/unbescape/html/HtmlEscapeUtil;->parseIntFromReference([CIII)I

    move-result v7

    .line 793
    add-int/lit8 v16, v9, -0x1

    .line 795
    if-ge v9, v11, :cond_bf

    aget-char v18, p0, v9

    const/16 v19, 0x3b

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_bf

    .line 796
    add-int/lit8 v16, v16, 0x1

    .line 799
    :cond_bf
    invoke-static {v7}, Lorg/unbescape/html/HtmlEscapeUtil;->translateIllFormedCodepoint(I)I

    move-result v7

    .line 888
    .end local v4    # "c1":C
    .end local v5    # "c2":C
    .end local v9    # "f":I
    :cond_c3
    :goto_c3
    sub-int v18, v10, v15

    if-lez v18, :cond_d2

    .line 889
    sub-int v18, v10, v15

    move-object/from16 v0, p3

    move-object/from16 v1, p0

    move/from16 v2, v18

    invoke-virtual {v0, v1, v15, v2}, Ljava/io/Writer;->write([CII)V

    .line 892
    :cond_d2
    move/from16 v10, v16

    .line 893
    add-int/lit8 v15, v10, 0x1

    .line 903
    const v18, 0xffff

    move/from16 v0, v18

    if-le v7, v0, :cond_1d9

    .line 904
    invoke-static {v7}, Ljava/lang/Character;->toChars(I)[C

    move-result-object v18

    move-object/from16 v0, p3

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/io/Writer;->write([C)V

    goto/16 :goto_1d

    .line 784
    .restart local v4    # "c1":C
    .restart local v5    # "c2":C
    .restart local v6    # "cf":C
    .restart local v9    # "f":I
    :cond_ea
    add-int/lit8 v9, v9, 0x1

    .line 785
    goto :goto_73

    .line 803
    .end local v6    # "cf":C
    .end local v9    # "f":I
    :cond_ed
    const/16 v18, 0x30

    move/from16 v0, v18

    if-lt v5, v0, :cond_1d

    const/16 v18, 0x39

    move/from16 v0, v18

    if-gt v5, v0, :cond_1d

    .line 806
    add-int/lit8 v9, v10, 0x2

    .line 807
    .restart local v9    # "f":I
    :goto_fb
    if-ge v9, v11, :cond_10b

    .line 808
    aget-char v6, p0, v9

    .line 809
    .restart local v6    # "cf":C
    const/16 v18, 0x30

    move/from16 v0, v18

    if-lt v6, v0, :cond_10b

    const/16 v18, 0x39

    move/from16 v0, v18

    if-le v6, v0, :cond_134

    .line 815
    .end local v6    # "cf":C
    :cond_10b
    add-int/lit8 v18, v10, 0x2

    sub-int v18, v9, v18

    if-lez v18, :cond_1d

    .line 820
    add-int/lit8 v18, v10, 0x2

    const/16 v19, 0xa

    move-object/from16 v0, p0

    move/from16 v1, v18

    move/from16 v2, v19

    invoke-static {v0, v1, v9, v2}, Lorg/unbescape/html/HtmlEscapeUtil;->parseIntFromReference([CIII)I

    move-result v7

    .line 821
    add-int/lit8 v16, v9, -0x1

    .line 823
    if-ge v9, v11, :cond_12f

    aget-char v18, p0, v9

    const/16 v19, 0x3b

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_12f

    .line 824
    add-int/lit8 v16, v16, 0x1

    .line 827
    :cond_12f
    invoke-static {v7}, Lorg/unbescape/html/HtmlEscapeUtil;->translateIllFormedCodepoint(I)I

    move-result v7

    goto :goto_c3

    .line 812
    .restart local v6    # "cf":C
    :cond_134
    add-int/lit8 v9, v9, 0x1

    .line 813
    goto :goto_fb

    .line 841
    .end local v5    # "c2":C
    .end local v6    # "cf":C
    .end local v9    # "f":I
    :cond_137
    add-int/lit8 v9, v10, 0x1

    .line 842
    .restart local v9    # "f":I
    :goto_139
    if-ge v9, v11, :cond_161

    .line 843
    aget-char v6, p0, v9

    .line 844
    .restart local v6    # "cf":C
    const/16 v18, 0x61

    move/from16 v0, v18

    if-lt v6, v0, :cond_149

    const/16 v18, 0x7a

    move/from16 v0, v18

    if-le v6, v0, :cond_191

    :cond_149
    const/16 v18, 0x41

    move/from16 v0, v18

    if-lt v6, v0, :cond_155

    const/16 v18, 0x5a

    move/from16 v0, v18

    if-le v6, v0, :cond_191

    :cond_155
    const/16 v18, 0x30

    move/from16 v0, v18

    if-lt v6, v0, :cond_161

    const/16 v18, 0x39

    move/from16 v0, v18

    if-le v6, v0, :cond_191

    .line 850
    .end local v6    # "cf":C
    :cond_161
    add-int/lit8 v18, v10, 0x1

    sub-int v18, v9, v18

    if-lez v18, :cond_1d

    .line 855
    if-ge v9, v11, :cond_175

    aget-char v18, p0, v9

    const/16 v19, 0x3b

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_175

    .line 856
    add-int/lit8 v9, v9, 0x1

    .line 859
    :cond_175
    move-object/from16 v0, v17

    iget-object v0, v0, Lorg/unbescape/html/HtmlEscapeSymbols;->SORTED_NCRS:[[C

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    invoke-static {v0, v1, v10, v9}, Lorg/unbescape/html/HtmlEscapeSymbols;->binarySearch([[C[CII)I

    move-result v12

    .line 860
    .local v12, "ncrPosition":I
    if-ltz v12, :cond_194

    .line 861
    move-object/from16 v0, v17

    iget-object v0, v0, Lorg/unbescape/html/HtmlEscapeSymbols;->SORTED_CODEPOINTS:[I

    move-object/from16 v18, v0

    aget v7, v18, v12

    .line 876
    :goto_18d
    add-int/lit8 v16, v9, -0x1

    goto/16 :goto_c3

    .line 847
    .end local v12    # "ncrPosition":I
    .restart local v6    # "cf":C
    :cond_191
    add-int/lit8 v9, v9, 0x1

    .line 848
    goto :goto_139

    .line 862
    .end local v6    # "cf":C
    .restart local v12    # "ncrPosition":I
    :cond_194
    const/high16 v18, -0x80000000

    move/from16 v0, v18

    if-eq v12, v0, :cond_1d

    .line 865
    const/16 v18, -0xa

    move/from16 v0, v18

    if-ge v12, v0, :cond_1be

    .line 867
    add-int/lit8 v18, v12, 0xa

    mul-int/lit8 v13, v18, -0x1

    .line 868
    .local v13, "partialIndex":I
    move-object/from16 v0, v17

    iget-object v0, v0, Lorg/unbescape/html/HtmlEscapeSymbols;->SORTED_NCRS:[[C

    move-object/from16 v18, v0

    aget-object v14, v18, v13

    .line 869
    .local v14, "partialMatch":[C
    move-object/from16 v0, v17

    iget-object v0, v0, Lorg/unbescape/html/HtmlEscapeSymbols;->SORTED_CODEPOINTS:[I

    move-object/from16 v18, v0

    aget v7, v18, v13

    .line 870
    sub-int v18, v9, v10

    array-length v0, v14

    move/from16 v19, v0

    sub-int v18, v18, v19

    sub-int v9, v9, v18

    .line 871
    goto :goto_18d

    .line 873
    .end local v13    # "partialIndex":I
    .end local v14    # "partialMatch":[C
    :cond_1be
    new-instance v18, Ljava/lang/RuntimeException;

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "Invalid unescape codepoint after search: "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v18

    .line 905
    .end local v4    # "c1":C
    .end local v9    # "f":I
    .end local v12    # "ncrPosition":I
    :cond_1d9
    if-gez v7, :cond_244

    .line 907
    move-object/from16 v0, v17

    iget-object v0, v0, Lorg/unbescape/html/HtmlEscapeSymbols;->DOUBLE_CODEPOINTS:[[I

    move-object/from16 v18, v0

    mul-int/lit8 v19, v7, -0x1

    add-int/lit8 v19, v19, -0x1

    aget-object v8, v18, v19

    .line 908
    .local v8, "codepoints":[I
    const/16 v18, 0x0

    aget v18, v8, v18

    const v19, 0xffff

    move/from16 v0, v18

    move/from16 v1, v19

    if-le v0, v1, :cond_221

    .line 909
    const/16 v18, 0x0

    aget v18, v8, v18

    invoke-static/range {v18 .. v18}, Ljava/lang/Character;->toChars(I)[C

    move-result-object v18

    move-object/from16 v0, p3

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/io/Writer;->write([C)V

    .line 913
    :goto_203
    const/16 v18, 0x1

    aget v18, v8, v18

    const v19, 0xffff

    move/from16 v0, v18

    move/from16 v1, v19

    if-le v0, v1, :cond_232

    .line 914
    const/16 v18, 0x1

    aget v18, v8, v18

    invoke-static/range {v18 .. v18}, Ljava/lang/Character;->toChars(I)[C

    move-result-object v18

    move-object/from16 v0, p3

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/io/Writer;->write([C)V

    goto/16 :goto_1d

    .line 911
    :cond_221
    const/16 v18, 0x0

    aget v18, v8, v18

    move/from16 v0, v18

    int-to-char v0, v0

    move/from16 v18, v0

    move-object/from16 v0, p3

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/io/Writer;->write(I)V

    goto :goto_203

    .line 916
    :cond_232
    const/16 v18, 0x1

    aget v18, v8, v18

    move/from16 v0, v18

    int-to-char v0, v0

    move/from16 v18, v0

    move-object/from16 v0, p3

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/io/Writer;->write(I)V

    goto/16 :goto_1d

    .line 919
    .end local v8    # "codepoints":[I
    :cond_244
    int-to-char v0, v7

    move/from16 v18, v0

    move-object/from16 v0, p3

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/io/Writer;->write(I)V

    goto/16 :goto_1d

    .line 931
    .end local v3    # "c":C
    .end local v7    # "codepoint":I
    :cond_250
    sub-int v18, v11, v15

    if-lez v18, :cond_2

    .line 932
    sub-int v18, v11, v15

    move-object/from16 v0, p3

    move-object/from16 v1, p0

    move/from16 v2, v18

    invoke-virtual {v0, v1, v15, v2}, Ljava/io/Writer;->write([CII)V

    goto/16 :goto_2
.end method
