.class final Lorg/unbescape/java/JavaEscapeUtil;
.super Ljava/lang/Object;
.source "JavaEscapeUtil.java"


# static fields
.field private static final ESCAPE_LEVELS:[B

.field private static final ESCAPE_LEVELS_LEN:C = '\u00a1'

.field private static final ESCAPE_PREFIX:C = '\\'

.field private static final ESCAPE_UHEXA_PREFIX:[C

.field private static final ESCAPE_UHEXA_PREFIX2:C = 'u'

.field private static HEXA_CHARS_LOWER:[C

.field private static HEXA_CHARS_UPPER:[C

.field private static SEC_CHARS:[C

.field private static SEC_CHARS_LEN:I

.field private static SEC_CHARS_NO_SEC:C


# direct methods
.method static constructor <clinit>()V
    .registers 9

    .prologue
    const/16 v8, 0x5c

    const/16 v7, 0x27

    const/16 v6, 0x22

    const/4 v5, 0x4

    const/4 v4, 0x1

    .line 109
    const-string v1, "\\u"

    invoke-virtual {v1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    sput-object v1, Lorg/unbescape/java/JavaEscapeUtil;->ESCAPE_UHEXA_PREFIX:[C

    .line 114
    const-string v1, "0123456789ABCDEF"

    invoke-virtual {v1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    sput-object v1, Lorg/unbescape/java/JavaEscapeUtil;->HEXA_CHARS_UPPER:[C

    .line 115
    const-string v1, "0123456789abcdef"

    invoke-virtual {v1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    sput-object v1, Lorg/unbescape/java/JavaEscapeUtil;->HEXA_CHARS_LOWER:[C

    .line 121
    const/16 v1, 0x5d

    sput v1, Lorg/unbescape/java/JavaEscapeUtil;->SEC_CHARS_LEN:I

    .line 122
    const/16 v1, 0x2a

    sput-char v1, Lorg/unbescape/java/JavaEscapeUtil;->SEC_CHARS_NO_SEC:C

    .line 140
    sget v1, Lorg/unbescape/java/JavaEscapeUtil;->SEC_CHARS_LEN:I

    new-array v1, v1, [C

    sput-object v1, Lorg/unbescape/java/JavaEscapeUtil;->SEC_CHARS:[C

    .line 141
    sget-object v1, Lorg/unbescape/java/JavaEscapeUtil;->SEC_CHARS:[C

    sget-char v2, Lorg/unbescape/java/JavaEscapeUtil;->SEC_CHARS_NO_SEC:C

    invoke-static {v1, v2}, Ljava/util/Arrays;->fill([CC)V

    .line 142
    sget-object v1, Lorg/unbescape/java/JavaEscapeUtil;->SEC_CHARS:[C

    const/16 v2, 0x8

    const/16 v3, 0x62

    aput-char v3, v1, v2

    .line 143
    sget-object v1, Lorg/unbescape/java/JavaEscapeUtil;->SEC_CHARS:[C

    const/16 v2, 0x9

    const/16 v3, 0x74

    aput-char v3, v1, v2

    .line 144
    sget-object v1, Lorg/unbescape/java/JavaEscapeUtil;->SEC_CHARS:[C

    const/16 v2, 0xa

    const/16 v3, 0x6e

    aput-char v3, v1, v2

    .line 145
    sget-object v1, Lorg/unbescape/java/JavaEscapeUtil;->SEC_CHARS:[C

    const/16 v2, 0xc

    const/16 v3, 0x66

    aput-char v3, v1, v2

    .line 146
    sget-object v1, Lorg/unbescape/java/JavaEscapeUtil;->SEC_CHARS:[C

    const/16 v2, 0xd

    const/16 v3, 0x72

    aput-char v3, v1, v2

    .line 147
    sget-object v1, Lorg/unbescape/java/JavaEscapeUtil;->SEC_CHARS:[C

    aput-char v6, v1, v6

    .line 150
    sget-object v1, Lorg/unbescape/java/JavaEscapeUtil;->SEC_CHARS:[C

    aput-char v7, v1, v7

    .line 151
    sget-object v1, Lorg/unbescape/java/JavaEscapeUtil;->SEC_CHARS:[C

    aput-char v8, v1, v8

    .line 165
    const/16 v1, 0xa1

    new-array v1, v1, [B

    sput-object v1, Lorg/unbescape/java/JavaEscapeUtil;->ESCAPE_LEVELS:[B

    .line 170
    sget-object v1, Lorg/unbescape/java/JavaEscapeUtil;->ESCAPE_LEVELS:[B

    const/4 v2, 0x3

    invoke-static {v1, v2}, Ljava/util/Arrays;->fill([BB)V

    .line 175
    const/16 v0, 0x80

    .local v0, "c":C
    :goto_77
    const/16 v1, 0xa1

    if-ge v0, v1, :cond_84

    .line 176
    sget-object v1, Lorg/unbescape/java/JavaEscapeUtil;->ESCAPE_LEVELS:[B

    const/4 v2, 0x2

    aput-byte v2, v1, v0

    .line 175
    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_77

    .line 182
    :cond_84
    const/16 v0, 0x41

    :goto_86
    const/16 v1, 0x5a

    if-gt v0, v1, :cond_92

    .line 183
    sget-object v1, Lorg/unbescape/java/JavaEscapeUtil;->ESCAPE_LEVELS:[B

    aput-byte v5, v1, v0

    .line 182
    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_86

    .line 185
    :cond_92
    const/16 v0, 0x61

    :goto_94
    const/16 v1, 0x7a

    if-gt v0, v1, :cond_a0

    .line 186
    sget-object v1, Lorg/unbescape/java/JavaEscapeUtil;->ESCAPE_LEVELS:[B

    aput-byte v5, v1, v0

    .line 185
    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_94

    .line 188
    :cond_a0
    const/16 v0, 0x30

    :goto_a2
    const/16 v1, 0x39

    if-gt v0, v1, :cond_ae

    .line 189
    sget-object v1, Lorg/unbescape/java/JavaEscapeUtil;->ESCAPE_LEVELS:[B

    aput-byte v5, v1, v0

    .line 188
    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_a2

    .line 195
    :cond_ae
    sget-object v1, Lorg/unbescape/java/JavaEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v2, 0x8

    aput-byte v4, v1, v2

    .line 196
    sget-object v1, Lorg/unbescape/java/JavaEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v2, 0x9

    aput-byte v4, v1, v2

    .line 197
    sget-object v1, Lorg/unbescape/java/JavaEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v2, 0xa

    aput-byte v4, v1, v2

    .line 198
    sget-object v1, Lorg/unbescape/java/JavaEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v2, 0xc

    aput-byte v4, v1, v2

    .line 199
    sget-object v1, Lorg/unbescape/java/JavaEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v2, 0xd

    aput-byte v4, v1, v2

    .line 200
    sget-object v1, Lorg/unbescape/java/JavaEscapeUtil;->ESCAPE_LEVELS:[B

    aput-byte v4, v1, v6

    .line 203
    sget-object v1, Lorg/unbescape/java/JavaEscapeUtil;->ESCAPE_LEVELS:[B

    const/4 v2, 0x3

    aput-byte v2, v1, v7

    .line 204
    sget-object v1, Lorg/unbescape/java/JavaEscapeUtil;->ESCAPE_LEVELS:[B

    aput-byte v4, v1, v8

    .line 210
    const/4 v0, 0x0

    :goto_da
    const/16 v1, 0x1f

    if-gt v0, v1, :cond_e6

    .line 211
    sget-object v1, Lorg/unbescape/java/JavaEscapeUtil;->ESCAPE_LEVELS:[B

    aput-byte v4, v1, v0

    .line 210
    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_da

    .line 213
    :cond_e6
    const/16 v0, 0x7f

    :goto_e8
    const/16 v1, 0x9f

    if-gt v0, v1, :cond_f4

    .line 214
    sget-object v1, Lorg/unbescape/java/JavaEscapeUtil;->ESCAPE_LEVELS:[B

    aput-byte v4, v1, v0

    .line 213
    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_e8

    .line 217
    :cond_f4
    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 222
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 223
    return-void
.end method

.method static escape(Ljava/lang/String;Lorg/unbescape/java/JavaEscapeLevel;)Ljava/lang/String;
    .registers 15
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "escapeLevel"    # Lorg/unbescape/java/JavaEscapeLevel;

    .prologue
    const/16 v12, 0x9f

    const/4 v11, 0x1

    .line 244
    if-nez p0, :cond_7

    .line 245
    const/4 p0, 0x0

    .line 363
    .end local p0    # "text":Ljava/lang/String;
    :cond_6
    :goto_6
    return-object p0

    .line 248
    .restart local p0    # "text":Ljava/lang/String;
    :cond_7
    invoke-virtual {p1}, Lorg/unbescape/java/JavaEscapeLevel;->getEscapeLevel()I

    move-result v3

    .line 250
    .local v3, "level":I
    const/4 v8, 0x0

    .line 252
    .local v8, "strBuilder":Ljava/lang/StringBuilder;
    const/4 v5, 0x0

    .line 253
    .local v5, "offset":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    .line 255
    .local v4, "max":I
    const/4 v6, 0x0

    .line 257
    .local v6, "readOffset":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_13
    if-ge v2, v4, :cond_9b

    .line 259
    invoke-static {p0, v2}, Ljava/lang/Character;->codePointAt(Ljava/lang/CharSequence;I)I

    move-result v0

    .line 266
    .local v0, "codepoint":I
    if-gt v0, v12, :cond_24

    sget-object v9, Lorg/unbescape/java/JavaEscapeUtil;->ESCAPE_LEVELS:[B

    aget-byte v9, v9, v0

    if-ge v3, v9, :cond_24

    .line 257
    :cond_21
    :goto_21
    add-int/lit8 v2, v2, 0x1

    goto :goto_13

    .line 273
    :cond_24
    if-le v0, v12, :cond_37

    sget-object v9, Lorg/unbescape/java/JavaEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v10, 0xa0

    aget-byte v9, v9, v10

    if-ge v3, v9, :cond_37

    .line 275
    invoke-static {v0}, Ljava/lang/Character;->charCount(I)I

    move-result v9

    if-le v9, v11, :cond_21

    .line 277
    add-int/lit8 v2, v2, 0x1

    goto :goto_21

    .line 291
    :cond_37
    if-nez v8, :cond_40

    .line 292
    new-instance v8, Ljava/lang/StringBuilder;

    .end local v8    # "strBuilder":Ljava/lang/StringBuilder;
    add-int/lit8 v9, v4, 0x14

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 295
    .restart local v8    # "strBuilder":Ljava/lang/StringBuilder;
    :cond_40
    sub-int v9, v2, v6

    if-lez v9, :cond_47

    .line 296
    invoke-virtual {v8, p0, v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 299
    :cond_47
    invoke-static {v0}, Ljava/lang/Character;->charCount(I)I

    move-result v9

    if-le v9, v11, :cond_4f

    .line 301
    add-int/lit8 v2, v2, 0x1

    .line 304
    :cond_4f
    add-int/lit8 v6, v2, 0x1

    .line 315
    sget v9, Lorg/unbescape/java/JavaEscapeUtil;->SEC_CHARS_LEN:I

    if-ge v0, v9, :cond_66

    .line 318
    sget-object v9, Lorg/unbescape/java/JavaEscapeUtil;->SEC_CHARS:[C

    aget-char v7, v9, v0

    .line 320
    .local v7, "sec":C
    sget-char v9, Lorg/unbescape/java/JavaEscapeUtil;->SEC_CHARS_NO_SEC:C

    if-eq v7, v9, :cond_66

    .line 322
    const/16 v9, 0x5c

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 323
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_21

    .line 333
    .end local v7    # "sec":C
    :cond_66
    invoke-static {v0}, Ljava/lang/Character;->charCount(I)I

    move-result v9

    if-le v9, v11, :cond_8e

    .line 334
    invoke-static {v0}, Ljava/lang/Character;->toChars(I)[C

    move-result-object v1

    .line 335
    .local v1, "codepointChars":[C
    sget-object v9, Lorg/unbescape/java/JavaEscapeUtil;->ESCAPE_UHEXA_PREFIX:[C

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    .line 336
    const/4 v9, 0x0

    aget-char v9, v1, v9

    invoke-static {v9}, Lorg/unbescape/java/JavaEscapeUtil;->toUHexa(I)[C

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    .line 337
    sget-object v9, Lorg/unbescape/java/JavaEscapeUtil;->ESCAPE_UHEXA_PREFIX:[C

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    .line 338
    aget-char v9, v1, v11

    invoke-static {v9}, Lorg/unbescape/java/JavaEscapeUtil;->toUHexa(I)[C

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    goto :goto_21

    .line 342
    .end local v1    # "codepointChars":[C
    :cond_8e
    sget-object v9, Lorg/unbescape/java/JavaEscapeUtil;->ESCAPE_UHEXA_PREFIX:[C

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    .line 343
    invoke-static {v0}, Lorg/unbescape/java/JavaEscapeUtil;->toUHexa(I)[C

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    goto :goto_21

    .line 355
    .end local v0    # "codepoint":I
    :cond_9b
    if-eqz v8, :cond_6

    .line 359
    sub-int v9, v4, v6

    if-lez v9, :cond_a4

    .line 360
    invoke-virtual {v8, p0, v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 363
    :cond_a4
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto/16 :goto_6
.end method

.method static escape([CIILjava/io/Writer;Lorg/unbescape/java/JavaEscapeLevel;)V
    .registers 16
    .param p0, "text"    # [C
    .param p1, "offset"    # I
    .param p2, "len"    # I
    .param p3, "writer"    # Ljava/io/Writer;
    .param p4, "escapeLevel"    # Lorg/unbescape/java/JavaEscapeLevel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v10, 0x9f

    const/4 v9, 0x1

    .line 378
    if-eqz p0, :cond_8

    array-length v7, p0

    if-nez v7, :cond_9

    .line 484
    :cond_8
    :goto_8
    return-void

    .line 382
    :cond_9
    invoke-virtual {p4}, Lorg/unbescape/java/JavaEscapeLevel;->getEscapeLevel()I

    move-result v3

    .line 384
    .local v3, "level":I
    add-int v4, p1, p2

    .line 386
    .local v4, "max":I
    move v5, p1

    .line 388
    .local v5, "readOffset":I
    move v2, p1

    .local v2, "i":I
    :goto_11
    if-ge v2, v4, :cond_92

    .line 390
    invoke-static {p0, v2}, Ljava/lang/Character;->codePointAt([CI)I

    move-result v0

    .line 397
    .local v0, "codepoint":I
    if-gt v0, v10, :cond_22

    sget-object v7, Lorg/unbescape/java/JavaEscapeUtil;->ESCAPE_LEVELS:[B

    aget-byte v7, v7, v0

    if-ge v3, v7, :cond_22

    .line 388
    :cond_1f
    :goto_1f
    add-int/lit8 v2, v2, 0x1

    goto :goto_11

    .line 404
    :cond_22
    if-le v0, v10, :cond_35

    sget-object v7, Lorg/unbescape/java/JavaEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v8, 0xa0

    aget-byte v7, v7, v8

    if-ge v3, v7, :cond_35

    .line 406
    invoke-static {v0}, Ljava/lang/Character;->charCount(I)I

    move-result v7

    if-le v7, v9, :cond_1f

    .line 408
    add-int/lit8 v2, v2, 0x1

    goto :goto_1f

    .line 421
    :cond_35
    sub-int v7, v2, v5

    if-lez v7, :cond_3e

    .line 422
    sub-int v7, v2, v5

    invoke-virtual {p3, p0, v5, v7}, Ljava/io/Writer;->write([CII)V

    .line 425
    :cond_3e
    invoke-static {v0}, Ljava/lang/Character;->charCount(I)I

    move-result v7

    if-le v7, v9, :cond_46

    .line 427
    add-int/lit8 v2, v2, 0x1

    .line 430
    :cond_46
    add-int/lit8 v5, v2, 0x1

    .line 441
    sget v7, Lorg/unbescape/java/JavaEscapeUtil;->SEC_CHARS_LEN:I

    if-ge v0, v7, :cond_5d

    .line 444
    sget-object v7, Lorg/unbescape/java/JavaEscapeUtil;->SEC_CHARS:[C

    aget-char v6, v7, v0

    .line 446
    .local v6, "sec":C
    sget-char v7, Lorg/unbescape/java/JavaEscapeUtil;->SEC_CHARS_NO_SEC:C

    if-eq v6, v7, :cond_5d

    .line 448
    const/16 v7, 0x5c

    invoke-virtual {p3, v7}, Ljava/io/Writer;->write(I)V

    .line 449
    invoke-virtual {p3, v6}, Ljava/io/Writer;->write(I)V

    goto :goto_1f

    .line 459
    .end local v6    # "sec":C
    :cond_5d
    invoke-static {v0}, Ljava/lang/Character;->charCount(I)I

    move-result v7

    if-le v7, v9, :cond_85

    .line 460
    invoke-static {v0}, Ljava/lang/Character;->toChars(I)[C

    move-result-object v1

    .line 461
    .local v1, "codepointChars":[C
    sget-object v7, Lorg/unbescape/java/JavaEscapeUtil;->ESCAPE_UHEXA_PREFIX:[C

    invoke-virtual {p3, v7}, Ljava/io/Writer;->write([C)V

    .line 462
    const/4 v7, 0x0

    aget-char v7, v1, v7

    invoke-static {v7}, Lorg/unbescape/java/JavaEscapeUtil;->toUHexa(I)[C

    move-result-object v7

    invoke-virtual {p3, v7}, Ljava/io/Writer;->write([C)V

    .line 463
    sget-object v7, Lorg/unbescape/java/JavaEscapeUtil;->ESCAPE_UHEXA_PREFIX:[C

    invoke-virtual {p3, v7}, Ljava/io/Writer;->write([C)V

    .line 464
    aget-char v7, v1, v9

    invoke-static {v7}, Lorg/unbescape/java/JavaEscapeUtil;->toUHexa(I)[C

    move-result-object v7

    invoke-virtual {p3, v7}, Ljava/io/Writer;->write([C)V

    goto :goto_1f

    .line 468
    .end local v1    # "codepointChars":[C
    :cond_85
    sget-object v7, Lorg/unbescape/java/JavaEscapeUtil;->ESCAPE_UHEXA_PREFIX:[C

    invoke-virtual {p3, v7}, Ljava/io/Writer;->write([C)V

    .line 469
    invoke-static {v0}, Lorg/unbescape/java/JavaEscapeUtil;->toUHexa(I)[C

    move-result-object v7

    invoke-virtual {p3, v7}, Ljava/io/Writer;->write([C)V

    goto :goto_1f

    .line 480
    .end local v0    # "codepoint":I
    :cond_92
    sub-int v7, v4, v5

    if-lez v7, :cond_8

    .line 481
    sub-int v7, v4, v5

    invoke-virtual {p3, p0, v5, v7}, Ljava/io/Writer;->write([CII)V

    goto/16 :goto_8
.end method

.method static isOctalEscape(Ljava/lang/String;II)Z
    .registers 11
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "start"    # I
    .param p2, "end"    # I

    .prologue
    const/16 v7, 0x37

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/16 v6, 0x30

    .line 537
    if-lt p1, p2, :cond_9

    .line 564
    :cond_8
    :goto_8
    return v4

    .line 541
    :cond_9
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 542
    .local v0, "c1":C
    if-lt v0, v6, :cond_8

    if-gt v0, v7, :cond_8

    .line 546
    add-int/lit8 v5, p1, 0x1

    if-lt v5, p2, :cond_1b

    .line 547
    if-eq v0, v6, :cond_19

    :goto_17
    move v4, v3

    goto :goto_8

    :cond_19
    move v3, v4

    goto :goto_17

    .line 550
    :cond_1b
    add-int/lit8 v5, p1, 0x1

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 551
    .local v1, "c2":C
    if-lt v1, v6, :cond_25

    if-le v1, v7, :cond_2b

    .line 552
    :cond_25
    if-eq v0, v6, :cond_29

    :goto_27
    move v4, v3

    goto :goto_8

    :cond_29
    move v3, v4

    goto :goto_27

    .line 555
    :cond_2b
    add-int/lit8 v5, p1, 0x2

    if-lt v5, p2, :cond_35

    .line 556
    if-ne v0, v6, :cond_33

    if-eq v1, v6, :cond_8

    :cond_33
    move v4, v3

    goto :goto_8

    .line 559
    :cond_35
    add-int/lit8 v5, p1, 0x2

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 560
    .local v2, "c3":C
    if-lt v2, v6, :cond_3f

    if-le v2, v7, :cond_45

    .line 561
    :cond_3f
    if-ne v0, v6, :cond_43

    if-eq v1, v6, :cond_8

    :cond_43
    move v4, v3

    goto :goto_8

    .line 564
    :cond_45
    if-ne v0, v6, :cond_4b

    if-ne v1, v6, :cond_4b

    if-eq v2, v6, :cond_8

    :cond_4b
    move v4, v3

    goto :goto_8
.end method

.method static isOctalEscape([CII)Z
    .registers 11
    .param p0, "text"    # [C
    .param p1, "start"    # I
    .param p2, "end"    # I

    .prologue
    const/16 v7, 0x37

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/16 v6, 0x30

    .line 571
    if-lt p1, p2, :cond_9

    .line 598
    :cond_8
    :goto_8
    return v4

    .line 575
    :cond_9
    aget-char v0, p0, p1

    .line 576
    .local v0, "c1":C
    if-lt v0, v6, :cond_8

    if-gt v0, v7, :cond_8

    .line 580
    add-int/lit8 v5, p1, 0x1

    if-lt v5, p2, :cond_19

    .line 581
    if-eq v0, v6, :cond_17

    :goto_15
    move v4, v3

    goto :goto_8

    :cond_17
    move v3, v4

    goto :goto_15

    .line 584
    :cond_19
    add-int/lit8 v5, p1, 0x1

    aget-char v1, p0, v5

    .line 585
    .local v1, "c2":C
    if-lt v1, v6, :cond_21

    if-le v1, v7, :cond_27

    .line 586
    :cond_21
    if-eq v0, v6, :cond_25

    :goto_23
    move v4, v3

    goto :goto_8

    :cond_25
    move v3, v4

    goto :goto_23

    .line 589
    :cond_27
    add-int/lit8 v5, p1, 0x2

    if-lt v5, p2, :cond_31

    .line 590
    if-ne v0, v6, :cond_2f

    if-eq v1, v6, :cond_8

    :cond_2f
    move v4, v3

    goto :goto_8

    .line 593
    :cond_31
    add-int/lit8 v5, p1, 0x2

    aget-char v2, p0, v5

    .line 594
    .local v2, "c3":C
    if-lt v2, v6, :cond_39

    if-le v2, v7, :cond_3f

    .line 595
    :cond_39
    if-ne v0, v6, :cond_3d

    if-eq v1, v6, :cond_8

    :cond_3d
    move v4, v3

    goto :goto_8

    .line 598
    :cond_3f
    if-ne v0, v6, :cond_45

    if-ne v1, v6, :cond_45

    if-eq v2, v6, :cond_8

    :cond_45
    move v4, v3

    goto :goto_8
.end method

.method static parseIntFromReference(Ljava/lang/String;III)I
    .registers 10
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "start"    # I
    .param p2, "end"    # I
    .param p3, "radix"    # I

    .prologue
    .line 500
    const/4 v4, 0x0

    .line 501
    .local v4, "result":I
    move v1, p1

    .local v1, "i":I
    :goto_2
    if-ge v1, p2, :cond_26

    .line 502
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 503
    .local v0, "c":C
    const/4 v3, -0x1

    .line 504
    .local v3, "n":I
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_a
    sget-object v5, Lorg/unbescape/java/JavaEscapeUtil;->HEXA_CHARS_UPPER:[C

    array-length v5, v5

    if-ge v2, v5, :cond_1c

    .line 505
    sget-object v5, Lorg/unbescape/java/JavaEscapeUtil;->HEXA_CHARS_UPPER:[C

    aget-char v5, v5, v2

    if-eq v0, v5, :cond_1b

    sget-object v5, Lorg/unbescape/java/JavaEscapeUtil;->HEXA_CHARS_LOWER:[C

    aget-char v5, v5, v2

    if-ne v0, v5, :cond_23

    .line 506
    :cond_1b
    move v3, v2

    .line 510
    :cond_1c
    mul-int v5, p3, v4

    add-int v4, v5, v3

    .line 501
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 504
    :cond_23
    add-int/lit8 v2, v2, 0x1

    goto :goto_a

    .line 512
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
    .line 516
    const/4 v4, 0x0

    .line 517
    .local v4, "result":I
    move v1, p1

    .local v1, "i":I
    :goto_2
    if-ge v1, p2, :cond_24

    .line 518
    aget-char v0, p0, v1

    .line 519
    .local v0, "c":C
    const/4 v3, -0x1

    .line 520
    .local v3, "n":I
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_8
    sget-object v5, Lorg/unbescape/java/JavaEscapeUtil;->HEXA_CHARS_UPPER:[C

    array-length v5, v5

    if-ge v2, v5, :cond_1a

    .line 521
    sget-object v5, Lorg/unbescape/java/JavaEscapeUtil;->HEXA_CHARS_UPPER:[C

    aget-char v5, v5, v2

    if-eq v0, v5, :cond_19

    sget-object v5, Lorg/unbescape/java/JavaEscapeUtil;->HEXA_CHARS_LOWER:[C

    aget-char v5, v5, v2

    if-ne v0, v5, :cond_21

    .line 522
    :cond_19
    move v3, v2

    .line 526
    :cond_1a
    mul-int v5, p3, v4

    add-int v4, v5, v3

    .line 517
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 520
    :cond_21
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    .line 528
    .end local v0    # "c":C
    .end local v2    # "j":I
    .end local v3    # "n":I
    :cond_24
    return v4
.end method

.method static requiresUnicodeUnescape([CII)Z
    .registers 10
    .param p0, "text"    # [C
    .param p1, "offset"    # I
    .param p2, "len"    # I

    .prologue
    const/16 v6, 0x5c

    const/4 v4, 0x0

    .line 749
    if-nez p0, :cond_6

    .line 776
    :cond_5
    :goto_5
    return v4

    .line 753
    :cond_6
    add-int v3, p1, p2

    .line 755
    .local v3, "max":I
    move v2, p1

    .local v2, "i":I
    :goto_9
    if-ge v2, v3, :cond_5

    .line 757
    aget-char v0, p0, v2

    .line 759
    .local v0, "c":C
    if-ne v0, v6, :cond_13

    add-int/lit8 v5, v2, 0x1

    if-lt v5, v3, :cond_16

    .line 755
    :cond_13
    add-int/lit8 v2, v2, 0x1

    goto :goto_9

    .line 763
    :cond_16
    if-ne v0, v6, :cond_13

    .line 765
    add-int/lit8 v5, v2, 0x1

    aget-char v1, p0, v5

    .line 767
    .local v1, "c1":C
    const/16 v5, 0x75

    if-ne v1, v5, :cond_13

    .line 769
    const/4 v4, 0x1

    goto :goto_5
.end method

.method static toUHexa(I)[C
    .registers 5
    .param p0, "codepoint"    # I

    .prologue
    .line 229
    const/4 v1, 0x4

    new-array v0, v1, [C

    .line 230
    .local v0, "result":[C
    const/4 v1, 0x3

    sget-object v2, Lorg/unbescape/java/JavaEscapeUtil;->HEXA_CHARS_UPPER:[C

    rem-int/lit8 v3, p0, 0x10

    aget-char v2, v2, v3

    aput-char v2, v0, v1

    .line 231
    const/4 v1, 0x2

    sget-object v2, Lorg/unbescape/java/JavaEscapeUtil;->HEXA_CHARS_UPPER:[C

    ushr-int/lit8 v3, p0, 0x4

    rem-int/lit8 v3, v3, 0x10

    aget-char v2, v2, v3

    aput-char v2, v0, v1

    .line 232
    const/4 v1, 0x1

    sget-object v2, Lorg/unbescape/java/JavaEscapeUtil;->HEXA_CHARS_UPPER:[C

    ushr-int/lit8 v3, p0, 0x8

    rem-int/lit8 v3, v3, 0x10

    aget-char v2, v2, v3

    aput-char v2, v0, v1

    .line 233
    const/4 v1, 0x0

    sget-object v2, Lorg/unbescape/java/JavaEscapeUtil;->HEXA_CHARS_UPPER:[C

    ushr-int/lit8 v3, p0, 0xc

    rem-int/lit8 v3, v3, 0x10

    aget-char v2, v2, v3

    aput-char v2, v0, v1

    .line 234
    return-object v0
.end method

.method static unescape(Ljava/lang/String;)Ljava/lang/String;
    .registers 16
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 915
    if-nez p0, :cond_4

    .line 916
    const/4 v11, 0x0

    .line 1049
    :cond_3
    :goto_3
    return-object v11

    .line 920
    :cond_4
    invoke-static {p0}, Lorg/unbescape/java/JavaEscapeUtil;->unicodeUnescape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 922
    .local v11, "unicodeEscapedText":Ljava/lang/String;
    const/4 v10, 0x0

    .line 924
    .local v10, "strBuilder":Ljava/lang/StringBuilder;
    const/4 v7, 0x0

    .line 925
    .local v7, "offset":I
    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v6

    .line 927
    .local v6, "max":I
    const/4 v8, 0x0

    .line 928
    .local v8, "readOffset":I
    const/4 v9, 0x0

    .line 930
    .local v9, "referenceOffset":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_11
    if-ge v5, v6, :cond_ce

    .line 932
    invoke-virtual {v11, v5}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 938
    .local v0, "c":C
    const/16 v12, 0x5c

    if-ne v0, v12, :cond_1f

    add-int/lit8 v12, v5, 0x1

    if-lt v12, v6, :cond_22

    .line 930
    :cond_1f
    :goto_1f
    add-int/lit8 v5, v5, 0x1

    goto :goto_11

    .line 942
    :cond_22
    const/4 v3, -0x1

    .line 944
    .local v3, "codepoint":I
    const/16 v12, 0x5c

    if-ne v0, v12, :cond_67

    .line 946
    add-int/lit8 v12, v5, 0x1

    invoke-virtual {v11, v12}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 948
    .local v1, "c1":C
    sparse-switch v1, :sswitch_data_de

    .line 960
    :cond_30
    :goto_30
    const/4 v12, -0x1

    if-ne v3, v12, :cond_67

    .line 962
    const/16 v12, 0x30

    if-lt v1, v12, :cond_c4

    const/16 v12, 0x37

    if-gt v1, v12, :cond_c4

    .line 965
    add-int/lit8 v4, v5, 0x2

    .line 966
    .local v4, "f":I
    :goto_3d
    add-int/lit8 v12, v5, 0x4

    if-ge v4, v12, :cond_4f

    if-ge v4, v6, :cond_4f

    .line 967
    invoke-virtual {v11, v4}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 968
    .local v2, "cf":C
    const/16 v12, 0x30

    if-lt v2, v12, :cond_4f

    const/16 v12, 0x37

    if-le v2, v12, :cond_bd

    .line 974
    .end local v2    # "cf":C
    :cond_4f
    add-int/lit8 v12, v5, 0x1

    const/16 v13, 0x8

    invoke-static {v11, v12, v4, v13}, Lorg/unbescape/java/JavaEscapeUtil;->parseIntFromReference(Ljava/lang/String;III)I

    move-result v3

    .line 976
    const/16 v12, 0xff

    if-le v3, v12, :cond_c1

    .line 978
    add-int/lit8 v12, v5, 0x1

    add-int/lit8 v13, v4, -0x1

    const/16 v14, 0x8

    invoke-static {v11, v12, v13, v14}, Lorg/unbescape/java/JavaEscapeUtil;->parseIntFromReference(Ljava/lang/String;III)I

    move-result v3

    .line 979
    add-int/lit8 v9, v4, -0x2

    .line 1006
    .end local v1    # "c1":C
    .end local v4    # "f":I
    :cond_67
    :goto_67
    if-nez v10, :cond_70

    .line 1007
    new-instance v10, Ljava/lang/StringBuilder;

    .end local v10    # "strBuilder":Ljava/lang/StringBuilder;
    add-int/lit8 v12, v6, 0x5

    invoke-direct {v10, v12}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 1010
    .restart local v10    # "strBuilder":Ljava/lang/StringBuilder;
    :cond_70
    sub-int v12, v5, v8

    if-lez v12, :cond_77

    .line 1011
    invoke-virtual {v10, v11, v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 1014
    :cond_77
    move v5, v9

    .line 1015
    add-int/lit8 v8, v5, 0x1

    .line 1025
    const v12, 0xffff

    if-le v3, v12, :cond_c8

    .line 1026
    invoke-static {v3}, Ljava/lang/Character;->toChars(I)[C

    move-result-object v12

    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    goto :goto_1f

    .line 949
    .restart local v1    # "c1":C
    :sswitch_87
    add-int/lit8 v12, v5, 0x1

    invoke-static {v11, v12, v6}, Lorg/unbescape/java/JavaEscapeUtil;->isOctalEscape(Ljava/lang/String;II)Z

    move-result v12

    if-nez v12, :cond_30

    const/4 v3, 0x0

    add-int/lit8 v9, v5, 0x1

    goto :goto_30

    .line 950
    :sswitch_93
    const/16 v3, 0x8

    add-int/lit8 v9, v5, 0x1

    goto :goto_30

    .line 951
    :sswitch_98
    const/16 v3, 0x9

    add-int/lit8 v9, v5, 0x1

    goto :goto_30

    .line 952
    :sswitch_9d
    const/16 v3, 0xa

    add-int/lit8 v9, v5, 0x1

    goto :goto_30

    .line 953
    :sswitch_a2
    const/16 v3, 0xc

    add-int/lit8 v9, v5, 0x1

    goto :goto_30

    .line 954
    :sswitch_a7
    const/16 v3, 0xd

    add-int/lit8 v9, v5, 0x1

    goto :goto_30

    .line 955
    :sswitch_ac
    const/16 v3, 0x22

    add-int/lit8 v9, v5, 0x1

    goto :goto_30

    .line 956
    :sswitch_b1
    const/16 v3, 0x27

    add-int/lit8 v9, v5, 0x1

    goto/16 :goto_30

    .line 957
    :sswitch_b7
    const/16 v3, 0x5c

    add-int/lit8 v9, v5, 0x1

    goto/16 :goto_30

    .line 971
    .restart local v2    # "cf":C
    .restart local v4    # "f":I
    :cond_bd
    add-int/lit8 v4, v4, 0x1

    .line 972
    goto/16 :goto_3d

    .line 981
    .end local v2    # "cf":C
    :cond_c1
    add-int/lit8 v9, v4, -0x1

    goto :goto_67

    .line 990
    .end local v4    # "f":I
    :cond_c4
    add-int/lit8 v5, v5, 0x1

    .line 991
    goto/16 :goto_1f

    .line 1028
    .end local v1    # "c1":C
    :cond_c8
    int-to-char v12, v3

    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_1f

    .line 1041
    .end local v0    # "c":C
    .end local v3    # "codepoint":I
    :cond_ce
    if-eqz v10, :cond_3

    .line 1045
    sub-int v12, v6, v8

    if-lez v12, :cond_d7

    .line 1046
    invoke-virtual {v10, v11, v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 1049
    :cond_d7
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    goto/16 :goto_3

    .line 948
    nop

    :sswitch_data_de
    .sparse-switch
        0x22 -> :sswitch_ac
        0x27 -> :sswitch_b1
        0x30 -> :sswitch_87
        0x5c -> :sswitch_b7
        0x62 -> :sswitch_93
        0x66 -> :sswitch_a2
        0x6e -> :sswitch_9d
        0x72 -> :sswitch_a7
        0x74 -> :sswitch_98
    .end sparse-switch
.end method

.method static unescape([CIILjava/io/Writer;)V
    .registers 23
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
    .line 1064
    if-nez p0, :cond_3

    .line 1194
    :cond_2
    :goto_2
    return-void

    .line 1068
    :cond_3
    move-object/from16 v15, p0

    .line 1069
    .local v15, "unicodeEscapedText":[C
    move/from16 v14, p1

    .line 1070
    .local v14, "unicodeEscapedOffset":I
    move/from16 v13, p2

    .line 1071
    .local v13, "unicodeEscapedLen":I
    invoke-static/range {p0 .. p2}, Lorg/unbescape/java/JavaEscapeUtil;->requiresUnicodeUnescape([CII)Z

    move-result v16

    if-eqz v16, :cond_27

    .line 1072
    new-instance v6, Ljava/io/CharArrayWriter;

    add-int/lit8 v16, p2, 0x2

    move/from16 v0, v16

    invoke-direct {v6, v0}, Ljava/io/CharArrayWriter;-><init>(I)V

    .line 1073
    .local v6, "charArrayWriter":Ljava/io/CharArrayWriter;
    move-object/from16 v0, p0

    move/from16 v1, p1

    move/from16 v2, p2

    invoke-static {v0, v1, v2, v6}, Lorg/unbescape/java/JavaEscapeUtil;->unicodeUnescape([CIILjava/io/Writer;)V

    .line 1074
    invoke-virtual {v6}, Ljava/io/CharArrayWriter;->toCharArray()[C

    move-result-object v15

    .line 1075
    const/4 v14, 0x0

    .line 1076
    array-length v13, v15

    .line 1079
    .end local v6    # "charArrayWriter":Ljava/io/CharArrayWriter;
    :cond_27
    add-int v10, v14, v13

    .line 1081
    .local v10, "max":I
    move v11, v14

    .line 1082
    .local v11, "readOffset":I
    move v12, v14

    .line 1084
    .local v12, "referenceOffset":I
    move v9, v14

    .local v9, "i":I
    :goto_2c
    if-ge v9, v10, :cond_10c

    .line 1086
    aget-char v3, v15, v9

    .line 1092
    .local v3, "c":C
    const/16 v16, 0x5c

    move/from16 v0, v16

    if-ne v3, v0, :cond_3c

    add-int/lit8 v16, v9, 0x1

    move/from16 v0, v16

    if-lt v0, v10, :cond_3f

    .line 1084
    :cond_3c
    :goto_3c
    add-int/lit8 v9, v9, 0x1

    goto :goto_2c

    .line 1096
    :cond_3f
    const/4 v7, -0x1

    .line 1098
    .local v7, "codepoint":I
    const/16 v16, 0x5c

    move/from16 v0, v16

    if-ne v3, v0, :cond_95

    .line 1100
    add-int/lit8 v16, v9, 0x1

    aget-char v4, v15, v16

    .line 1102
    .local v4, "c1":C
    sparse-switch v4, :sswitch_data_11c

    .line 1114
    :cond_4d
    :goto_4d
    const/16 v16, -0x1

    move/from16 v0, v16

    if-ne v7, v0, :cond_95

    .line 1116
    const/16 v16, 0x30

    move/from16 v0, v16

    if-lt v4, v0, :cond_fc

    const/16 v16, 0x37

    move/from16 v0, v16

    if-gt v4, v0, :cond_fc

    .line 1119
    add-int/lit8 v8, v9, 0x2

    .line 1120
    .local v8, "f":I
    :goto_61
    add-int/lit8 v16, v9, 0x4

    move/from16 v0, v16

    if-ge v8, v0, :cond_77

    if-ge v8, v10, :cond_77

    .line 1121
    aget-char v5, v15, v8

    .line 1122
    .local v5, "cf":C
    const/16 v16, 0x30

    move/from16 v0, v16

    if-lt v5, v0, :cond_77

    const/16 v16, 0x37

    move/from16 v0, v16

    if-le v5, v0, :cond_f5

    .line 1128
    .end local v5    # "cf":C
    :cond_77
    add-int/lit8 v16, v9, 0x1

    const/16 v17, 0x8

    move/from16 v0, v16

    move/from16 v1, v17

    invoke-static {v15, v0, v8, v1}, Lorg/unbescape/java/JavaEscapeUtil;->parseIntFromReference([CIII)I

    move-result v7

    .line 1130
    const/16 v16, 0xff

    move/from16 v0, v16

    if-le v7, v0, :cond_f9

    .line 1132
    add-int/lit8 v16, v9, 0x1

    add-int/lit8 v17, v8, -0x1

    const/16 v18, 0x8

    invoke-static/range {v15 .. v18}, Lorg/unbescape/java/JavaEscapeUtil;->parseIntFromReference([CIII)I

    move-result v7

    .line 1133
    add-int/lit8 v12, v8, -0x2

    .line 1159
    .end local v4    # "c1":C
    .end local v8    # "f":I
    :cond_95
    :goto_95
    sub-int v16, v9, v11

    if-lez v16, :cond_a2

    .line 1160
    sub-int v16, v9, v11

    move-object/from16 v0, p3

    move/from16 v1, v16

    invoke-virtual {v0, v15, v11, v1}, Ljava/io/Writer;->write([CII)V

    .line 1163
    :cond_a2
    move v9, v12

    .line 1164
    add-int/lit8 v11, v9, 0x1

    .line 1174
    const v16, 0xffff

    move/from16 v0, v16

    if-le v7, v0, :cond_100

    .line 1175
    invoke-static {v7}, Ljava/lang/Character;->toChars(I)[C

    move-result-object v16

    move-object/from16 v0, p3

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/io/Writer;->write([C)V

    goto :goto_3c

    .line 1103
    .restart local v4    # "c1":C
    :sswitch_b8
    add-int/lit8 v16, v9, 0x1

    move/from16 v0, v16

    invoke-static {v15, v0, v10}, Lorg/unbescape/java/JavaEscapeUtil;->isOctalEscape([CII)Z

    move-result v16

    if-nez v16, :cond_4d

    const/4 v7, 0x0

    add-int/lit8 v12, v9, 0x1

    goto :goto_4d

    .line 1104
    :sswitch_c6
    const/16 v7, 0x8

    add-int/lit8 v12, v9, 0x1

    goto :goto_4d

    .line 1105
    :sswitch_cb
    const/16 v7, 0x9

    add-int/lit8 v12, v9, 0x1

    goto/16 :goto_4d

    .line 1106
    :sswitch_d1
    const/16 v7, 0xa

    add-int/lit8 v12, v9, 0x1

    goto/16 :goto_4d

    .line 1107
    :sswitch_d7
    const/16 v7, 0xc

    add-int/lit8 v12, v9, 0x1

    goto/16 :goto_4d

    .line 1108
    :sswitch_dd
    const/16 v7, 0xd

    add-int/lit8 v12, v9, 0x1

    goto/16 :goto_4d

    .line 1109
    :sswitch_e3
    const/16 v7, 0x22

    add-int/lit8 v12, v9, 0x1

    goto/16 :goto_4d

    .line 1110
    :sswitch_e9
    const/16 v7, 0x27

    add-int/lit8 v12, v9, 0x1

    goto/16 :goto_4d

    .line 1111
    :sswitch_ef
    const/16 v7, 0x5c

    add-int/lit8 v12, v9, 0x1

    goto/16 :goto_4d

    .line 1125
    .restart local v5    # "cf":C
    .restart local v8    # "f":I
    :cond_f5
    add-int/lit8 v8, v8, 0x1

    .line 1126
    goto/16 :goto_61

    .line 1135
    .end local v5    # "cf":C
    :cond_f9
    add-int/lit8 v12, v8, -0x1

    goto :goto_95

    .line 1144
    .end local v8    # "f":I
    :cond_fc
    add-int/lit8 v9, v9, 0x1

    .line 1145
    goto/16 :goto_3c

    .line 1177
    .end local v4    # "c1":C
    :cond_100
    int-to-char v0, v7

    move/from16 v16, v0

    move-object/from16 v0, p3

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/io/Writer;->write(I)V

    goto/16 :goto_3c

    .line 1189
    .end local v3    # "c":C
    .end local v7    # "codepoint":I
    :cond_10c
    sub-int v16, v10, v11

    if-lez v16, :cond_2

    .line 1190
    sub-int v16, v10, v11

    move-object/from16 v0, p3

    move/from16 v1, v16

    invoke-virtual {v0, v15, v11, v1}, Ljava/io/Writer;->write([CII)V

    goto/16 :goto_2

    .line 1102
    nop

    :sswitch_data_11c
    .sparse-switch
        0x22 -> :sswitch_e3
        0x27 -> :sswitch_e9
        0x30 -> :sswitch_b8
        0x5c -> :sswitch_ef
        0x62 -> :sswitch_c6
        0x66 -> :sswitch_d7
        0x6e -> :sswitch_d1
        0x72 -> :sswitch_dd
        0x74 -> :sswitch_cb
    .end sparse-switch
.end method

.method static unicodeUnescape(Ljava/lang/String;)Ljava/lang/String;
    .registers 15
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 611
    if-nez p0, :cond_4

    .line 612
    const/4 p0, 0x0

    .line 737
    .end local p0    # "text":Ljava/lang/String;
    .local v5, "i":I
    .local v6, "max":I
    .local v7, "offset":I
    .local v8, "readOffset":I
    .local v9, "referenceOffset":I
    .local v11, "strBuilder":Ljava/lang/StringBuilder;
    :cond_3
    :goto_3
    return-object p0

    .line 615
    .end local v5    # "i":I
    .end local v6    # "max":I
    .end local v7    # "offset":I
    .end local v8    # "readOffset":I
    .end local v9    # "referenceOffset":I
    .end local v11    # "strBuilder":Ljava/lang/StringBuilder;
    .restart local p0    # "text":Ljava/lang/String;
    :cond_4
    const/4 v11, 0x0

    .line 617
    .restart local v11    # "strBuilder":Ljava/lang/StringBuilder;
    const/4 v7, 0x0

    .line 618
    .restart local v7    # "offset":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    .line 620
    .restart local v6    # "max":I
    const/4 v8, 0x0

    .line 621
    .restart local v8    # "readOffset":I
    const/4 v9, 0x0

    .line 623
    .restart local v9    # "referenceOffset":I
    const/4 v5, 0x0

    .restart local v5    # "i":I
    :goto_d
    if-ge v5, v6, :cond_9a

    .line 625
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 631
    .local v0, "c":C
    const/16 v12, 0x5c

    if-ne v0, v12, :cond_1b

    add-int/lit8 v12, v5, 0x1

    if-lt v12, v6, :cond_1e

    .line 623
    :cond_1b
    :goto_1b
    add-int/lit8 v5, v5, 0x1

    goto :goto_d

    .line 635
    :cond_1e
    const/4 v3, -0x1

    .line 637
    .local v3, "codepoint":I
    const/16 v12, 0x5c

    if-ne v0, v12, :cond_72

    .line 639
    add-int/lit8 v12, v5, 0x1

    invoke-virtual {p0, v12}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 641
    .local v1, "c1":C
    const/16 v12, 0x75

    if-ne v1, v12, :cond_92

    .line 644
    add-int/lit8 v4, v5, 0x2

    .line 646
    .local v4, "f":I
    :goto_2f
    if-ge v4, v6, :cond_39

    .line 647
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 648
    .local v2, "cf":C
    const/16 v12, 0x75

    if-eq v2, v12, :cond_64

    .line 653
    .end local v2    # "cf":C
    :cond_39
    move v10, v4

    .line 655
    .local v10, "s":I
    :goto_3a
    add-int/lit8 v12, v10, 0x4

    if-ge v4, v12, :cond_5c

    if-ge v4, v6, :cond_5c

    .line 656
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 657
    .restart local v2    # "cf":C
    const/16 v12, 0x30

    if-lt v2, v12, :cond_4c

    const/16 v12, 0x39

    if-le v2, v12, :cond_67

    :cond_4c
    const/16 v12, 0x41

    if-lt v2, v12, :cond_54

    const/16 v12, 0x46

    if-le v2, v12, :cond_67

    :cond_54
    const/16 v12, 0x61

    if-lt v2, v12, :cond_5c

    const/16 v12, 0x66

    if-le v2, v12, :cond_67

    .line 663
    .end local v2    # "cf":C
    :cond_5c
    sub-int v12, v4, v10

    const/4 v13, 0x4

    if-ge v12, v13, :cond_6a

    .line 666
    add-int/lit8 v5, v5, 0x1

    .line 667
    goto :goto_1b

    .line 651
    .end local v10    # "s":I
    .restart local v2    # "cf":C
    :cond_64
    add-int/lit8 v4, v4, 0x1

    .line 652
    goto :goto_2f

    .line 660
    .restart local v10    # "s":I
    :cond_67
    add-int/lit8 v4, v4, 0x1

    .line 661
    goto :goto_3a

    .line 670
    .end local v2    # "cf":C
    :cond_6a
    const/16 v12, 0x10

    invoke-static {p0, v10, v4, v12}, Lorg/unbescape/java/JavaEscapeUtil;->parseIntFromReference(Ljava/lang/String;III)I

    move-result v3

    .line 673
    add-int/lit8 v9, v4, -0x1

    .line 694
    .end local v1    # "c1":C
    .end local v4    # "f":I
    .end local v10    # "s":I
    :cond_72
    if-nez v11, :cond_7b

    .line 695
    new-instance v11, Ljava/lang/StringBuilder;

    .end local v11    # "strBuilder":Ljava/lang/StringBuilder;
    add-int/lit8 v12, v6, 0x5

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 698
    .restart local v11    # "strBuilder":Ljava/lang/StringBuilder;
    :cond_7b
    sub-int v12, v5, v8

    if-lez v12, :cond_82

    .line 699
    invoke-virtual {v11, p0, v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 702
    :cond_82
    move v5, v9

    .line 703
    add-int/lit8 v8, v5, 0x1

    .line 713
    const v12, 0xffff

    if-le v3, v12, :cond_95

    .line 714
    invoke-static {v3}, Ljava/lang/Character;->toChars(I)[C

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    goto :goto_1b

    .line 680
    .restart local v1    # "c1":C
    :cond_92
    add-int/lit8 v5, v5, 0x1

    .line 681
    goto :goto_1b

    .line 716
    .end local v1    # "c1":C
    :cond_95
    int-to-char v12, v3

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1b

    .line 729
    .end local v0    # "c":C
    .end local v3    # "codepoint":I
    :cond_9a
    if-eqz v11, :cond_3

    .line 733
    sub-int v12, v6, v8

    if-lez v12, :cond_a3

    .line 734
    invoke-virtual {v11, p0, v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 737
    :cond_a3
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto/16 :goto_3
.end method

.method static unicodeUnescape([CIILjava/io/Writer;)V
    .registers 16
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
    .line 790
    if-nez p0, :cond_3

    .line 903
    :cond_2
    :goto_2
    return-void

    .line 794
    :cond_3
    add-int v6, p1, p2

    .line 796
    .local v6, "max":I
    move v7, p1

    .line 797
    .local v7, "readOffset":I
    move v8, p1

    .line 799
    .local v8, "referenceOffset":I
    move v5, p1

    .local v5, "i":I
    :goto_8
    if-ge v5, v6, :cond_86

    .line 801
    aget-char v0, p0, v5

    .line 807
    .local v0, "c":C
    const/16 v10, 0x5c

    if-ne v0, v10, :cond_14

    add-int/lit8 v10, v5, 0x1

    if-lt v10, v6, :cond_17

    .line 799
    :cond_14
    :goto_14
    add-int/lit8 v5, v5, 0x1

    goto :goto_8

    .line 811
    :cond_17
    const/4 v3, -0x1

    .line 813
    .local v3, "codepoint":I
    const/16 v10, 0x5c

    if-ne v0, v10, :cond_65

    .line 815
    add-int/lit8 v10, v5, 0x1

    aget-char v1, p0, v10

    .line 817
    .local v1, "c1":C
    const/16 v10, 0x75

    if-ne v1, v10, :cond_7e

    .line 820
    add-int/lit8 v4, v5, 0x2

    .line 822
    .local v4, "f":I
    :goto_26
    if-ge v4, v6, :cond_2e

    .line 823
    aget-char v2, p0, v4

    .line 824
    .local v2, "cf":C
    const/16 v10, 0x75

    if-eq v2, v10, :cond_57

    .line 829
    .end local v2    # "cf":C
    :cond_2e
    move v9, v4

    .line 831
    .local v9, "s":I
    :goto_2f
    add-int/lit8 v10, v9, 0x4

    if-ge v4, v10, :cond_4f

    if-ge v4, v6, :cond_4f

    .line 832
    aget-char v2, p0, v4

    .line 833
    .restart local v2    # "cf":C
    const/16 v10, 0x30

    if-lt v2, v10, :cond_3f

    const/16 v10, 0x39

    if-le v2, v10, :cond_5a

    :cond_3f
    const/16 v10, 0x41

    if-lt v2, v10, :cond_47

    const/16 v10, 0x46

    if-le v2, v10, :cond_5a

    :cond_47
    const/16 v10, 0x61

    if-lt v2, v10, :cond_4f

    const/16 v10, 0x66

    if-le v2, v10, :cond_5a

    .line 839
    .end local v2    # "cf":C
    :cond_4f
    sub-int v10, v4, v9

    const/4 v11, 0x4

    if-ge v10, v11, :cond_5d

    .line 842
    add-int/lit8 v5, v5, 0x1

    .line 843
    goto :goto_14

    .line 827
    .end local v9    # "s":I
    .restart local v2    # "cf":C
    :cond_57
    add-int/lit8 v4, v4, 0x1

    .line 828
    goto :goto_26

    .line 836
    .restart local v9    # "s":I
    :cond_5a
    add-int/lit8 v4, v4, 0x1

    .line 837
    goto :goto_2f

    .line 846
    .end local v2    # "cf":C
    :cond_5d
    const/16 v10, 0x10

    invoke-static {p0, v9, v4, v10}, Lorg/unbescape/java/JavaEscapeUtil;->parseIntFromReference([CIII)I

    move-result v3

    .line 849
    add-int/lit8 v8, v4, -0x1

    .line 869
    .end local v1    # "c1":C
    .end local v4    # "f":I
    .end local v9    # "s":I
    :cond_65
    sub-int v10, v5, v7

    if-lez v10, :cond_6e

    .line 870
    sub-int v10, v5, v7

    invoke-virtual {p3, p0, v7, v10}, Ljava/io/Writer;->write([CII)V

    .line 873
    :cond_6e
    move v5, v8

    .line 874
    add-int/lit8 v7, v5, 0x1

    .line 884
    const v10, 0xffff

    if-le v3, v10, :cond_81

    .line 885
    invoke-static {v3}, Ljava/lang/Character;->toChars(I)[C

    move-result-object v10

    invoke-virtual {p3, v10}, Ljava/io/Writer;->write([C)V

    goto :goto_14

    .line 856
    .restart local v1    # "c1":C
    :cond_7e
    add-int/lit8 v5, v5, 0x1

    .line 857
    goto :goto_14

    .line 887
    .end local v1    # "c1":C
    :cond_81
    int-to-char v10, v3

    invoke-virtual {p3, v10}, Ljava/io/Writer;->write(I)V

    goto :goto_14

    .line 899
    .end local v0    # "c":C
    .end local v3    # "codepoint":I
    :cond_86
    sub-int v10, v6, v7

    if-lez v10, :cond_2

    .line 900
    sub-int v10, v6, v7

    invoke-virtual {p3, p0, v7, v10}, Ljava/io/Writer;->write([CII)V

    goto/16 :goto_2
.end method
