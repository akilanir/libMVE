.class final Lorg/unbescape/xml/XmlEscapeUtil;
.super Ljava/lang/Object;
.source "XmlEscapeUtil.java"


# static fields
.field private static HEXA_CHARS_LOWER:[C = null

.field private static HEXA_CHARS_UPPER:[C = null

.field private static final REFERENCE_DECIMAL_PREFIX:[C

.field private static final REFERENCE_HEXA_PREFIX:[C

.field private static final REFERENCE_HEXA_PREFIX3:C = 'x'

.field private static final REFERENCE_NUMERIC_PREFIX2:C = '#'

.field private static final REFERENCE_PREFIX:C = '&'

.field private static final REFERENCE_SUFFIX:C = ';'


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 78
    const-string v0, "&#"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lorg/unbescape/xml/XmlEscapeUtil;->REFERENCE_DECIMAL_PREFIX:[C

    .line 79
    const-string v0, "&#x"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lorg/unbescape/xml/XmlEscapeUtil;->REFERENCE_HEXA_PREFIX:[C

    .line 87
    const-string v0, "0123456789ABCDEF"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lorg/unbescape/xml/XmlEscapeUtil;->HEXA_CHARS_UPPER:[C

    .line 88
    const-string v0, "0123456789abcdef"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lorg/unbescape/xml/XmlEscapeUtil;->HEXA_CHARS_LOWER:[C

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 94
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 95
    return-void
.end method

.method static escape(Ljava/lang/String;Lorg/unbescape/xml/XmlEscapeSymbols;Lorg/unbescape/xml/XmlEscapeType;Lorg/unbescape/xml/XmlEscapeLevel;)Ljava/lang/String;
    .registers 17
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "symbols"    # Lorg/unbescape/xml/XmlEscapeSymbols;
    .param p2, "escapeType"    # Lorg/unbescape/xml/XmlEscapeType;
    .param p3, "escapeLevel"    # Lorg/unbescape/xml/XmlEscapeLevel;

    .prologue
    .line 107
    if-nez p0, :cond_4

    .line 108
    const/4 p0, 0x0

    .line 242
    .end local p0    # "text":Ljava/lang/String;
    :cond_3
    :goto_3
    return-object p0

    .line 111
    .restart local p0    # "text":Ljava/lang/String;
    :cond_4
    invoke-virtual/range {p3 .. p3}, Lorg/unbescape/xml/XmlEscapeLevel;->getEscapeLevel()I

    move-result v4

    .line 112
    .local v4, "level":I
    invoke-virtual {p2}, Lorg/unbescape/xml/XmlEscapeType;->getUseCERs()Z

    move-result v9

    .line 113
    .local v9, "useCERs":Z
    invoke-virtual {p2}, Lorg/unbescape/xml/XmlEscapeType;->getUseHexa()Z

    move-result v10

    .line 115
    .local v10, "useHexa":Z
    const/4 v8, 0x0

    .line 117
    .local v8, "strBuilder":Ljava/lang/StringBuilder;
    const/4 v6, 0x0

    .line 118
    .local v6, "offset":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    .line 120
    .local v5, "max":I
    const/4 v7, 0x0

    .line 122
    .local v7, "readOffset":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_18
    if-ge v3, v5, :cond_9b

    .line 124
    invoke-static {p0, v3}, Ljava/lang/Character;->codePointAt(Ljava/lang/CharSequence;I)I

    move-result v0

    .line 127
    .local v0, "codepoint":I
    iget-object v11, p1, Lorg/unbescape/xml/XmlEscapeSymbols;->CODEPOINT_VALIDATOR:Lorg/unbescape/xml/XmlCodepointValidator;

    invoke-interface {v11, v0}, Lorg/unbescape/xml/XmlCodepointValidator;->isValid(I)Z

    move-result v2

    .line 134
    .local v2, "codepointValid":Z
    const/16 v11, 0x9f

    if-gt v0, v11, :cond_33

    iget-object v11, p1, Lorg/unbescape/xml/XmlEscapeSymbols;->ESCAPE_LEVELS:[B

    aget-byte v11, v11, v0

    if-ge v4, v11, :cond_33

    if-eqz v2, :cond_33

    .line 122
    :cond_30
    :goto_30
    add-int/lit8 v3, v3, 0x1

    goto :goto_18

    .line 144
    :cond_33
    const/16 v11, 0x9f

    if-le v0, v11, :cond_4b

    iget-object v11, p1, Lorg/unbescape/xml/XmlEscapeSymbols;->ESCAPE_LEVELS:[B

    const/16 v12, 0xa0

    aget-byte v11, v11, v12

    if-ge v4, v11, :cond_4b

    if-eqz v2, :cond_4b

    .line 148
    invoke-static {v0}, Ljava/lang/Character;->charCount(I)I

    move-result v11

    const/4 v12, 0x1

    if-le v11, v12, :cond_30

    .line 150
    add-int/lit8 v3, v3, 0x1

    goto :goto_30

    .line 164
    :cond_4b
    if-nez v8, :cond_54

    .line 165
    new-instance v8, Ljava/lang/StringBuilder;

    .end local v8    # "strBuilder":Ljava/lang/StringBuilder;
    add-int/lit8 v11, v5, 0x14

    invoke-direct {v8, v11}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 168
    .restart local v8    # "strBuilder":Ljava/lang/StringBuilder;
    :cond_54
    sub-int v11, v3, v7

    if-lez v11, :cond_5b

    .line 169
    invoke-virtual {v8, p0, v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 172
    :cond_5b
    invoke-static {v0}, Ljava/lang/Character;->charCount(I)I

    move-result v11

    const/4 v12, 0x1

    if-le v11, v12, :cond_64

    .line 174
    add-int/lit8 v3, v3, 0x1

    .line 177
    :cond_64
    add-int/lit8 v7, v3, 0x1

    .line 184
    if-eqz v2, :cond_30

    .line 197
    if-eqz v9, :cond_7a

    .line 200
    iget-object v11, p1, Lorg/unbescape/xml/XmlEscapeSymbols;->SORTED_CODEPOINTS:[I

    .line 201
    invoke-static {v11, v0}, Ljava/util/Arrays;->binarySearch([II)I

    move-result v1

    .line 203
    .local v1, "codepointIndex":I
    if-ltz v1, :cond_7a

    .line 205
    iget-object v11, p1, Lorg/unbescape/xml/XmlEscapeSymbols;->SORTED_CERS_BY_CODEPOINT:[[C

    aget-object v11, v11, v1

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    goto :goto_30

    .line 215
    .end local v1    # "codepointIndex":I
    :cond_7a
    if-eqz v10, :cond_8e

    .line 216
    sget-object v11, Lorg/unbescape/xml/XmlEscapeUtil;->REFERENCE_HEXA_PREFIX:[C

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    .line 217
    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 222
    :goto_88
    const/16 v11, 0x3b

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_30

    .line 219
    :cond_8e
    sget-object v11, Lorg/unbescape/xml/XmlEscapeUtil;->REFERENCE_DECIMAL_PREFIX:[C

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    .line 220
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_88

    .line 234
    .end local v0    # "codepoint":I
    .end local v2    # "codepointValid":Z
    :cond_9b
    if-eqz v8, :cond_3

    .line 238
    sub-int v11, v5, v7

    if-lez v11, :cond_a4

    .line 239
    invoke-virtual {v8, p0, v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 242
    :cond_a4
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto/16 :goto_3
.end method

.method static escape([CIILjava/io/Writer;Lorg/unbescape/xml/XmlEscapeSymbols;Lorg/unbescape/xml/XmlEscapeType;Lorg/unbescape/xml/XmlEscapeLevel;)V
    .registers 18
    .param p0, "text"    # [C
    .param p1, "offset"    # I
    .param p2, "len"    # I
    .param p3, "writer"    # Ljava/io/Writer;
    .param p4, "symbols"    # Lorg/unbescape/xml/XmlEscapeSymbols;
    .param p5, "escapeType"    # Lorg/unbescape/xml/XmlEscapeType;
    .param p6, "escapeLevel"    # Lorg/unbescape/xml/XmlEscapeLevel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 258
    if-eqz p0, :cond_5

    array-length v9, p0

    if-nez v9, :cond_6

    .line 380
    :cond_5
    :goto_5
    return-void

    .line 262
    :cond_6
    invoke-virtual/range {p6 .. p6}, Lorg/unbescape/xml/XmlEscapeLevel;->getEscapeLevel()I

    move-result v4

    .line 263
    .local v4, "level":I
    invoke-virtual/range {p5 .. p5}, Lorg/unbescape/xml/XmlEscapeType;->getUseCERs()Z

    move-result v7

    .line 264
    .local v7, "useCERs":Z
    invoke-virtual/range {p5 .. p5}, Lorg/unbescape/xml/XmlEscapeType;->getUseHexa()Z

    move-result v8

    .line 266
    .local v8, "useHexa":Z
    add-int v5, p1, p2

    .line 268
    .local v5, "max":I
    move v6, p1

    .line 270
    .local v6, "readOffset":I
    move v3, p1

    .local v3, "i":I
    :goto_16
    if-ge v3, v5, :cond_92

    .line 272
    invoke-static {p0, v3}, Ljava/lang/Character;->codePointAt([CI)I

    move-result v0

    .line 275
    .local v0, "codepoint":I
    iget-object v9, p4, Lorg/unbescape/xml/XmlEscapeSymbols;->CODEPOINT_VALIDATOR:Lorg/unbescape/xml/XmlCodepointValidator;

    invoke-interface {v9, v0}, Lorg/unbescape/xml/XmlCodepointValidator;->isValid(I)Z

    move-result v2

    .line 282
    .local v2, "codepointValid":Z
    const/16 v9, 0x9f

    if-gt v0, v9, :cond_31

    iget-object v9, p4, Lorg/unbescape/xml/XmlEscapeSymbols;->ESCAPE_LEVELS:[B

    aget-byte v9, v9, v0

    if-ge v4, v9, :cond_31

    if-eqz v2, :cond_31

    .line 270
    :cond_2e
    :goto_2e
    add-int/lit8 v3, v3, 0x1

    goto :goto_16

    .line 292
    :cond_31
    const/16 v9, 0x9f

    if-le v0, v9, :cond_49

    iget-object v9, p4, Lorg/unbescape/xml/XmlEscapeSymbols;->ESCAPE_LEVELS:[B

    const/16 v10, 0xa0

    aget-byte v9, v9, v10

    if-ge v4, v9, :cond_49

    if-eqz v2, :cond_49

    .line 296
    invoke-static {v0}, Ljava/lang/Character;->charCount(I)I

    move-result v9

    const/4 v10, 0x1

    if-le v9, v10, :cond_2e

    .line 298
    add-int/lit8 v3, v3, 0x1

    goto :goto_2e

    .line 311
    :cond_49
    sub-int v9, v3, v6

    if-lez v9, :cond_52

    .line 312
    sub-int v9, v3, v6

    invoke-virtual {p3, p0, v6, v9}, Ljava/io/Writer;->write([CII)V

    .line 315
    :cond_52
    invoke-static {v0}, Ljava/lang/Character;->charCount(I)I

    move-result v9

    const/4 v10, 0x1

    if-le v9, v10, :cond_5b

    .line 317
    add-int/lit8 v3, v3, 0x1

    .line 320
    :cond_5b
    add-int/lit8 v6, v3, 0x1

    .line 327
    if-eqz v2, :cond_2e

    .line 340
    if-eqz v7, :cond_71

    .line 343
    iget-object v9, p4, Lorg/unbescape/xml/XmlEscapeSymbols;->SORTED_CODEPOINTS:[I

    .line 344
    invoke-static {v9, v0}, Ljava/util/Arrays;->binarySearch([II)I

    move-result v1

    .line 346
    .local v1, "codepointIndex":I
    if-ltz v1, :cond_71

    .line 348
    iget-object v9, p4, Lorg/unbescape/xml/XmlEscapeSymbols;->SORTED_CERS_BY_CODEPOINT:[[C

    aget-object v9, v9, v1

    invoke-virtual {p3, v9}, Ljava/io/Writer;->write([C)V

    goto :goto_2e

    .line 358
    .end local v1    # "codepointIndex":I
    :cond_71
    if-eqz v8, :cond_85

    .line 359
    sget-object v9, Lorg/unbescape/xml/XmlEscapeUtil;->REFERENCE_HEXA_PREFIX:[C

    invoke-virtual {p3, v9}, Ljava/io/Writer;->write([C)V

    .line 360
    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p3, v9}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 365
    :goto_7f
    const/16 v9, 0x3b

    invoke-virtual {p3, v9}, Ljava/io/Writer;->write(I)V

    goto :goto_2e

    .line 362
    :cond_85
    sget-object v9, Lorg/unbescape/xml/XmlEscapeUtil;->REFERENCE_DECIMAL_PREFIX:[C

    invoke-virtual {p3, v9}, Ljava/io/Writer;->write([C)V

    .line 363
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p3, v9}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto :goto_7f

    .line 376
    .end local v0    # "codepoint":I
    .end local v2    # "codepointValid":Z
    :cond_92
    sub-int v9, v5, v6

    if-lez v9, :cond_5

    .line 377
    sub-int v9, v5, v6

    invoke-virtual {p3, p0, v6, v9}, Ljava/io/Writer;->write([CII)V

    goto/16 :goto_5
.end method

.method static parseIntFromReference(Ljava/lang/String;III)I
    .registers 10
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "start"    # I
    .param p2, "end"    # I
    .param p3, "radix"    # I

    .prologue
    .line 396
    const/4 v4, 0x0

    .line 397
    .local v4, "result":I
    move v1, p1

    .local v1, "i":I
    :goto_2
    if-ge v1, p2, :cond_26

    .line 398
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 399
    .local v0, "c":C
    const/4 v3, -0x1

    .line 400
    .local v3, "n":I
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_a
    sget-object v5, Lorg/unbescape/xml/XmlEscapeUtil;->HEXA_CHARS_UPPER:[C

    array-length v5, v5

    if-ge v2, v5, :cond_1c

    .line 401
    sget-object v5, Lorg/unbescape/xml/XmlEscapeUtil;->HEXA_CHARS_UPPER:[C

    aget-char v5, v5, v2

    if-eq v0, v5, :cond_1b

    sget-object v5, Lorg/unbescape/xml/XmlEscapeUtil;->HEXA_CHARS_LOWER:[C

    aget-char v5, v5, v2

    if-ne v0, v5, :cond_23

    .line 402
    :cond_1b
    move v3, v2

    .line 406
    :cond_1c
    mul-int v5, p3, v4

    add-int v4, v5, v3

    .line 397
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 400
    :cond_23
    add-int/lit8 v2, v2, 0x1

    goto :goto_a

    .line 408
    .end local v0    # "c":C
    .end local v2    # "j":I
    .end local v3    # "n":I
    :cond_26
    return v4
.end method

.method static parseIntFromReference([CIII)I
    .registers 10
    .param p0, "text"    # [C
    .param p1, "start"    # I
    .param p2, "end"    # I
    .param p3, "radix"    # I

    .prologue
    .line 412
    const/4 v4, 0x0

    .line 413
    .local v4, "result":I
    move v1, p1

    .local v1, "i":I
    :goto_2
    if-ge v1, p2, :cond_24

    .line 414
    aget-char v0, p0, v1

    .line 415
    .local v0, "c":C
    const/4 v3, -0x1

    .line 416
    .local v3, "n":I
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_8
    sget-object v5, Lorg/unbescape/xml/XmlEscapeUtil;->HEXA_CHARS_UPPER:[C

    array-length v5, v5

    if-ge v2, v5, :cond_1a

    .line 417
    sget-object v5, Lorg/unbescape/xml/XmlEscapeUtil;->HEXA_CHARS_UPPER:[C

    aget-char v5, v5, v2

    if-eq v0, v5, :cond_19

    sget-object v5, Lorg/unbescape/xml/XmlEscapeUtil;->HEXA_CHARS_LOWER:[C

    aget-char v5, v5, v2

    if-ne v0, v5, :cond_21

    .line 418
    :cond_19
    move v3, v2

    .line 422
    :cond_1a
    mul-int v5, p3, v4

    add-int v4, v5, v3

    .line 413
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 416
    :cond_21
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    .line 424
    .end local v0    # "c":C
    .end local v2    # "j":I
    .end local v3    # "n":I
    :cond_24
    return v4
.end method

.method static unescape(Ljava/lang/String;Lorg/unbescape/xml/XmlEscapeSymbols;)Ljava/lang/String;
    .registers 22
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "symbols"    # Lorg/unbescape/xml/XmlEscapeSymbols;

    .prologue
    .line 440
    if-nez p0, :cond_5

    .line 441
    const/16 p0, 0x0

    .line 636
    .end local p0    # "text":Ljava/lang/String;
    :cond_4
    :goto_4
    return-object p0

    .line 444
    .restart local p0    # "text":Ljava/lang/String;
    :cond_5
    const/16 v16, 0x0

    .line 446
    .local v16, "strBuilder":Ljava/lang/StringBuilder;
    const/4 v13, 0x0

    .line 447
    .local v13, "offset":I
    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v11

    .line 449
    .local v11, "max":I
    const/4 v14, 0x0

    .line 450
    .local v14, "readOffset":I
    const/4 v15, 0x0

    .line 452
    .local v15, "referenceOffset":I
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_f
    if-ge v10, v11, :cond_1c1

    .line 454
    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 460
    .local v4, "c":C
    const/16 v17, 0x26

    move/from16 v0, v17

    if-ne v4, v0, :cond_23

    add-int/lit8 v17, v10, 0x1

    move/from16 v0, v17

    if-lt v0, v11, :cond_26

    .line 452
    :cond_23
    :goto_23
    add-int/lit8 v10, v10, 0x1

    goto :goto_f

    .line 464
    :cond_26
    const/4 v8, 0x0

    .line 466
    .local v8, "codepoint":I
    const/16 v17, 0x26

    move/from16 v0, v17

    if-ne v4, v0, :cond_d7

    .line 468
    add-int/lit8 v17, v10, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v5

    .line 470
    .local v5, "c1":C
    const/16 v17, 0x20

    move/from16 v0, v17

    if-eq v5, v0, :cond_23

    const/16 v17, 0xa

    move/from16 v0, v17

    if-eq v5, v0, :cond_23

    const/16 v17, 0x9

    move/from16 v0, v17

    if-eq v5, v0, :cond_23

    const/16 v17, 0xc

    move/from16 v0, v17

    if-eq v5, v0, :cond_23

    const/16 v17, 0x3c

    move/from16 v0, v17

    if-eq v5, v0, :cond_23

    const/16 v17, 0x26

    move/from16 v0, v17

    if-eq v5, v0, :cond_23

    .line 479
    const/16 v17, 0x23

    move/from16 v0, v17

    if-ne v5, v0, :cond_154

    .line 481
    add-int/lit8 v17, v10, 0x2

    move/from16 v0, v17

    if-ge v0, v11, :cond_23

    .line 486
    add-int/lit8 v17, v10, 0x2

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v6

    .line 488
    .local v6, "c2":C
    const/16 v17, 0x78

    move/from16 v0, v17

    if-ne v6, v0, :cond_102

    add-int/lit8 v17, v10, 0x3

    move/from16 v0, v17

    if-ge v0, v11, :cond_102

    .line 491
    add-int/lit8 v9, v10, 0x3

    .line 492
    .local v9, "f":I
    :goto_7f
    if-ge v9, v11, :cond_ab

    .line 493
    move-object/from16 v0, p0

    invoke-virtual {v0, v9}, Ljava/lang/String;->charAt(I)C

    move-result v7

    .line 494
    .local v7, "cf":C
    const/16 v17, 0x30

    move/from16 v0, v17

    if-lt v7, v0, :cond_93

    const/16 v17, 0x39

    move/from16 v0, v17

    if-le v7, v0, :cond_fe

    :cond_93
    const/16 v17, 0x41

    move/from16 v0, v17

    if-lt v7, v0, :cond_9f

    const/16 v17, 0x46

    move/from16 v0, v17

    if-le v7, v0, :cond_fe

    :cond_9f
    const/16 v17, 0x61

    move/from16 v0, v17

    if-lt v7, v0, :cond_ab

    const/16 v17, 0x66

    move/from16 v0, v17

    if-le v7, v0, :cond_fe

    .line 500
    .end local v7    # "cf":C
    :cond_ab
    add-int/lit8 v17, v10, 0x3

    sub-int v17, v9, v17

    if-lez v17, :cond_23

    .line 505
    if-ge v9, v11, :cond_23

    move-object/from16 v0, p0

    invoke-virtual {v0, v9}, Ljava/lang/String;->charAt(I)C

    move-result v17

    const/16 v18, 0x3b

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_23

    .line 509
    add-int/lit8 v9, v9, 0x1

    .line 511
    add-int/lit8 v17, v10, 0x3

    add-int/lit8 v18, v9, -0x1

    const/16 v19, 0x10

    move-object/from16 v0, p0

    move/from16 v1, v17

    move/from16 v2, v18

    move/from16 v3, v19

    invoke-static {v0, v1, v2, v3}, Lorg/unbescape/xml/XmlEscapeUtil;->parseIntFromReference(Ljava/lang/String;III)I

    move-result v8

    .line 512
    add-int/lit8 v15, v9, -0x1

    .line 593
    .end local v5    # "c1":C
    .end local v6    # "c2":C
    .end local v9    # "f":I
    :cond_d7
    :goto_d7
    if-nez v16, :cond_e0

    .line 594
    new-instance v16, Ljava/lang/StringBuilder;

    .end local v16    # "strBuilder":Ljava/lang/StringBuilder;
    add-int/lit8 v17, v11, 0x5

    invoke-direct/range {v16 .. v17}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 597
    .restart local v16    # "strBuilder":Ljava/lang/StringBuilder;
    :cond_e0
    sub-int v17, v10, v14

    if-lez v17, :cond_eb

    .line 598
    move-object/from16 v0, v16

    move-object/from16 v1, p0

    invoke-virtual {v0, v1, v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 601
    :cond_eb
    move v10, v15

    .line 602
    add-int/lit8 v14, v10, 0x1

    .line 612
    const v17, 0xffff

    move/from16 v0, v17

    if-le v8, v0, :cond_1b9

    .line 613
    invoke-static {v8}, Ljava/lang/Character;->toChars(I)[C

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    goto/16 :goto_23

    .line 497
    .restart local v5    # "c1":C
    .restart local v6    # "c2":C
    .restart local v7    # "cf":C
    .restart local v9    # "f":I
    :cond_fe
    add-int/lit8 v9, v9, 0x1

    .line 498
    goto/16 :goto_7f

    .line 516
    .end local v7    # "cf":C
    .end local v9    # "f":I
    :cond_102
    const/16 v17, 0x30

    move/from16 v0, v17

    if-lt v6, v0, :cond_23

    const/16 v17, 0x39

    move/from16 v0, v17

    if-gt v6, v0, :cond_23

    .line 519
    add-int/lit8 v9, v10, 0x2

    .line 520
    .restart local v9    # "f":I
    :goto_110
    if-ge v9, v11, :cond_124

    .line 521
    move-object/from16 v0, p0

    invoke-virtual {v0, v9}, Ljava/lang/String;->charAt(I)C

    move-result v7

    .line 522
    .restart local v7    # "cf":C
    const/16 v17, 0x30

    move/from16 v0, v17

    if-lt v7, v0, :cond_124

    const/16 v17, 0x39

    move/from16 v0, v17

    if-le v7, v0, :cond_151

    .line 528
    .end local v7    # "cf":C
    :cond_124
    add-int/lit8 v17, v10, 0x2

    sub-int v17, v9, v17

    if-lez v17, :cond_23

    .line 533
    if-ge v9, v11, :cond_23

    move-object/from16 v0, p0

    invoke-virtual {v0, v9}, Ljava/lang/String;->charAt(I)C

    move-result v17

    const/16 v18, 0x3b

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_23

    .line 537
    add-int/lit8 v9, v9, 0x1

    .line 539
    add-int/lit8 v17, v10, 0x2

    add-int/lit8 v18, v9, -0x1

    const/16 v19, 0xa

    move-object/from16 v0, p0

    move/from16 v1, v17

    move/from16 v2, v18

    move/from16 v3, v19

    invoke-static {v0, v1, v2, v3}, Lorg/unbescape/xml/XmlEscapeUtil;->parseIntFromReference(Ljava/lang/String;III)I

    move-result v8

    .line 540
    add-int/lit8 v15, v9, -0x1

    goto :goto_d7

    .line 525
    .restart local v7    # "cf":C
    :cond_151
    add-int/lit8 v9, v9, 0x1

    .line 526
    goto :goto_110

    .line 554
    .end local v6    # "c2":C
    .end local v7    # "cf":C
    .end local v9    # "f":I
    :cond_154
    add-int/lit8 v9, v10, 0x1

    .line 555
    .restart local v9    # "f":I
    :goto_156
    if-ge v9, v11, :cond_182

    .line 556
    move-object/from16 v0, p0

    invoke-virtual {v0, v9}, Ljava/lang/String;->charAt(I)C

    move-result v7

    .line 557
    .restart local v7    # "cf":C
    const/16 v17, 0x61

    move/from16 v0, v17

    if-lt v7, v0, :cond_16a

    const/16 v17, 0x7a

    move/from16 v0, v17

    if-le v7, v0, :cond_1b6

    :cond_16a
    const/16 v17, 0x41

    move/from16 v0, v17

    if-lt v7, v0, :cond_176

    const/16 v17, 0x5a

    move/from16 v0, v17

    if-le v7, v0, :cond_1b6

    :cond_176
    const/16 v17, 0x30

    move/from16 v0, v17

    if-lt v7, v0, :cond_182

    const/16 v17, 0x39

    move/from16 v0, v17

    if-le v7, v0, :cond_1b6

    .line 563
    .end local v7    # "cf":C
    :cond_182
    add-int/lit8 v17, v10, 0x1

    sub-int v17, v9, v17

    if-lez v17, :cond_23

    .line 568
    if-ge v9, v11, :cond_19a

    move-object/from16 v0, p0

    invoke-virtual {v0, v9}, Ljava/lang/String;->charAt(I)C

    move-result v17

    const/16 v18, 0x3b

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_19a

    .line 569
    add-int/lit8 v9, v9, 0x1

    .line 572
    :cond_19a
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/unbescape/xml/XmlEscapeSymbols;->SORTED_CERS:[[C

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-static {v0, v1, v10, v9}, Lorg/unbescape/xml/XmlEscapeSymbols;->binarySearch([[CLjava/lang/String;II)I

    move-result v12

    .line 573
    .local v12, "ncrPosition":I
    if-ltz v12, :cond_23

    .line 574
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/unbescape/xml/XmlEscapeSymbols;->SORTED_CODEPOINTS_BY_CER:[I

    move-object/from16 v17, v0

    aget v8, v17, v12

    .line 580
    add-int/lit8 v15, v9, -0x1

    goto/16 :goto_d7

    .line 560
    .end local v12    # "ncrPosition":I
    .restart local v7    # "cf":C
    :cond_1b6
    add-int/lit8 v9, v9, 0x1

    .line 561
    goto :goto_156

    .line 615
    .end local v5    # "c1":C
    .end local v7    # "cf":C
    .end local v9    # "f":I
    :cond_1b9
    int-to-char v0, v8

    move/from16 v17, v0

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_23

    .line 628
    .end local v4    # "c":C
    .end local v8    # "codepoint":I
    :cond_1c1
    if-eqz v16, :cond_4

    .line 632
    sub-int v17, v11, v14

    if-lez v17, :cond_1ce

    .line 633
    move-object/from16 v0, v16

    move-object/from16 v1, p0

    invoke-virtual {v0, v1, v14, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 636
    :cond_1ce
    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto/16 :goto_4
.end method

.method static unescape([CIILjava/io/Writer;Lorg/unbescape/xml/XmlEscapeSymbols;)V
    .registers 20
    .param p0, "text"    # [C
    .param p1, "offset"    # I
    .param p2, "len"    # I
    .param p3, "writer"    # Ljava/io/Writer;
    .param p4, "symbols"    # Lorg/unbescape/xml/XmlEscapeSymbols;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 652
    if-nez p0, :cond_3

    .line 835
    :cond_2
    :goto_2
    return-void

    .line 656
    :cond_3
    add-int v8, p1, p2

    .line 658
    .local v8, "max":I
    move/from16 v10, p1

    .line 659
    .local v10, "readOffset":I
    move/from16 v11, p1

    .line 661
    .local v11, "referenceOffset":I
    move/from16 v7, p1

    .local v7, "i":I
    :goto_b
    if-ge v7, v8, :cond_12d

    .line 663
    aget-char v1, p0, v7

    .line 669
    .local v1, "c":C
    const/16 v12, 0x26

    if-ne v1, v12, :cond_17

    add-int/lit8 v12, v7, 0x1

    if-lt v12, v8, :cond_1a

    .line 661
    :cond_17
    :goto_17
    add-int/lit8 v7, v7, 0x1

    goto :goto_b

    .line 673
    :cond_1a
    const/4 v5, 0x0

    .line 675
    .local v5, "codepoint":I
    const/16 v12, 0x26

    if-ne v1, v12, :cond_89

    .line 677
    add-int/lit8 v12, v7, 0x1

    aget-char v2, p0, v12

    .line 679
    .local v2, "c1":C
    const/16 v12, 0x20

    if-eq v2, v12, :cond_17

    const/16 v12, 0xa

    if-eq v2, v12, :cond_17

    const/16 v12, 0x9

    if-eq v2, v12, :cond_17

    const/16 v12, 0xc

    if-eq v2, v12, :cond_17

    const/16 v12, 0x3c

    if-eq v2, v12, :cond_17

    const/16 v12, 0x26

    if-eq v2, v12, :cond_17

    .line 688
    const/16 v12, 0x23

    if-ne v2, v12, :cond_e0

    .line 690
    add-int/lit8 v12, v7, 0x2

    if-ge v12, v8, :cond_17

    .line 695
    add-int/lit8 v12, v7, 0x2

    aget-char v3, p0, v12

    .line 697
    .local v3, "c2":C
    const/16 v12, 0x78

    if-ne v3, v12, :cond_aa

    add-int/lit8 v12, v7, 0x3

    if-ge v12, v8, :cond_aa

    .line 700
    add-int/lit8 v6, v7, 0x3

    .line 701
    .local v6, "f":I
    :goto_51
    if-ge v6, v8, :cond_6d

    .line 702
    aget-char v4, p0, v6

    .line 703
    .local v4, "cf":C
    const/16 v12, 0x30

    if-lt v4, v12, :cond_5d

    const/16 v12, 0x39

    if-le v4, v12, :cond_a7

    :cond_5d
    const/16 v12, 0x41

    if-lt v4, v12, :cond_65

    const/16 v12, 0x46

    if-le v4, v12, :cond_a7

    :cond_65
    const/16 v12, 0x61

    if-lt v4, v12, :cond_6d

    const/16 v12, 0x66

    if-le v4, v12, :cond_a7

    .line 709
    .end local v4    # "cf":C
    :cond_6d
    add-int/lit8 v12, v7, 0x3

    sub-int v12, v6, v12

    if-lez v12, :cond_17

    .line 714
    if-ge v6, v8, :cond_17

    aget-char v12, p0, v6

    const/16 v13, 0x3b

    if-ne v12, v13, :cond_17

    .line 718
    add-int/lit8 v6, v6, 0x1

    .line 720
    add-int/lit8 v12, v7, 0x3

    add-int/lit8 v13, v6, -0x1

    const/16 v14, 0x10

    invoke-static {p0, v12, v13, v14}, Lorg/unbescape/xml/XmlEscapeUtil;->parseIntFromReference([CIII)I

    move-result v5

    .line 721
    add-int/lit8 v11, v6, -0x1

    .line 801
    .end local v2    # "c1":C
    .end local v3    # "c2":C
    .end local v6    # "f":I
    :cond_89
    :goto_89
    sub-int v12, v7, v10

    if-lez v12, :cond_94

    .line 802
    sub-int v12, v7, v10

    move-object/from16 v0, p3

    invoke-virtual {v0, p0, v10, v12}, Ljava/io/Writer;->write([CII)V

    .line 805
    :cond_94
    move v7, v11

    .line 806
    add-int/lit8 v10, v7, 0x1

    .line 816
    const v12, 0xffff

    if-le v5, v12, :cond_125

    .line 817
    invoke-static {v5}, Ljava/lang/Character;->toChars(I)[C

    move-result-object v12

    move-object/from16 v0, p3

    invoke-virtual {v0, v12}, Ljava/io/Writer;->write([C)V

    goto/16 :goto_17

    .line 706
    .restart local v2    # "c1":C
    .restart local v3    # "c2":C
    .restart local v4    # "cf":C
    .restart local v6    # "f":I
    :cond_a7
    add-int/lit8 v6, v6, 0x1

    .line 707
    goto :goto_51

    .line 725
    .end local v4    # "cf":C
    .end local v6    # "f":I
    :cond_aa
    const/16 v12, 0x30

    if-lt v3, v12, :cond_17

    const/16 v12, 0x39

    if-gt v3, v12, :cond_17

    .line 728
    add-int/lit8 v6, v7, 0x2

    .line 729
    .restart local v6    # "f":I
    :goto_b4
    if-ge v6, v8, :cond_c0

    .line 730
    aget-char v4, p0, v6

    .line 731
    .restart local v4    # "cf":C
    const/16 v12, 0x30

    if-lt v4, v12, :cond_c0

    const/16 v12, 0x39

    if-le v4, v12, :cond_dd

    .line 737
    .end local v4    # "cf":C
    :cond_c0
    add-int/lit8 v12, v7, 0x2

    sub-int v12, v6, v12

    if-lez v12, :cond_17

    .line 742
    if-ge v6, v8, :cond_17

    aget-char v12, p0, v6

    const/16 v13, 0x3b

    if-ne v12, v13, :cond_17

    .line 746
    add-int/lit8 v6, v6, 0x1

    .line 748
    add-int/lit8 v12, v7, 0x2

    add-int/lit8 v13, v6, -0x1

    const/16 v14, 0xa

    invoke-static {p0, v12, v13, v14}, Lorg/unbescape/xml/XmlEscapeUtil;->parseIntFromReference([CIII)I

    move-result v5

    .line 749
    add-int/lit8 v11, v6, -0x1

    goto :goto_89

    .line 734
    .restart local v4    # "cf":C
    :cond_dd
    add-int/lit8 v6, v6, 0x1

    .line 735
    goto :goto_b4

    .line 763
    .end local v3    # "c2":C
    .end local v4    # "cf":C
    .end local v6    # "f":I
    :cond_e0
    add-int/lit8 v6, v7, 0x1

    .line 764
    .restart local v6    # "f":I
    :goto_e2
    if-ge v6, v8, :cond_fe

    .line 765
    aget-char v4, p0, v6

    .line 766
    .restart local v4    # "cf":C
    const/16 v12, 0x61

    if-lt v4, v12, :cond_ee

    const/16 v12, 0x7a

    if-le v4, v12, :cond_122

    :cond_ee
    const/16 v12, 0x41

    if-lt v4, v12, :cond_f6

    const/16 v12, 0x5a

    if-le v4, v12, :cond_122

    :cond_f6
    const/16 v12, 0x30

    if-lt v4, v12, :cond_fe

    const/16 v12, 0x39

    if-le v4, v12, :cond_122

    .line 772
    .end local v4    # "cf":C
    :cond_fe
    add-int/lit8 v12, v7, 0x1

    sub-int v12, v6, v12

    if-lez v12, :cond_17

    .line 777
    if-ge v6, v8, :cond_10e

    aget-char v12, p0, v6

    const/16 v13, 0x3b

    if-ne v12, v13, :cond_10e

    .line 778
    add-int/lit8 v6, v6, 0x1

    .line 781
    :cond_10e
    move-object/from16 v0, p4

    iget-object v12, v0, Lorg/unbescape/xml/XmlEscapeSymbols;->SORTED_CERS:[[C

    invoke-static {v12, p0, v7, v6}, Lorg/unbescape/xml/XmlEscapeSymbols;->binarySearch([[C[CII)I

    move-result v9

    .line 782
    .local v9, "ncrPosition":I
    if-ltz v9, :cond_17

    .line 783
    move-object/from16 v0, p4

    iget-object v12, v0, Lorg/unbescape/xml/XmlEscapeSymbols;->SORTED_CODEPOINTS_BY_CER:[I

    aget v5, v12, v9

    .line 789
    add-int/lit8 v11, v6, -0x1

    goto/16 :goto_89

    .line 769
    .end local v9    # "ncrPosition":I
    .restart local v4    # "cf":C
    :cond_122
    add-int/lit8 v6, v6, 0x1

    .line 770
    goto :goto_e2

    .line 819
    .end local v2    # "c1":C
    .end local v4    # "cf":C
    .end local v6    # "f":I
    :cond_125
    int-to-char v12, v5

    move-object/from16 v0, p3

    invoke-virtual {v0, v12}, Ljava/io/Writer;->write(I)V

    goto/16 :goto_17

    .line 831
    .end local v1    # "c":C
    .end local v5    # "codepoint":I
    :cond_12d
    sub-int v12, v8, v10

    if-lez v12, :cond_2

    .line 832
    sub-int v12, v8, v10

    move-object/from16 v0, p3

    invoke-virtual {v0, p0, v10, v12}, Ljava/io/Writer;->write([CII)V

    goto/16 :goto_2
.end method
