.class final Lorg/unbescape/javascript/JavaScriptEscapeUtil;
.super Ljava/lang/Object;
.source "JavaScriptEscapeUtil.java"


# static fields
.field private static final ESCAPE_LEVELS:[B

.field private static final ESCAPE_LEVELS_LEN:C = '\u00a1'

.field private static final ESCAPE_PREFIX:C = '\\'

.field private static final ESCAPE_UHEXA_PREFIX:[C

.field private static final ESCAPE_UHEXA_PREFIX2:C = 'u'

.field private static final ESCAPE_XHEXA_PREFIX:[C

.field private static final ESCAPE_XHEXA_PREFIX2:C = 'x'

.field private static HEXA_CHARS_LOWER:[C

.field private static HEXA_CHARS_UPPER:[C

.field private static SEC_CHARS:[C

.field private static SEC_CHARS_LEN:I

.field private static SEC_CHARS_NO_SEC:C


# direct methods
.method static constructor <clinit>()V
    .registers 9

    .prologue
    const/16 v8, 0x2f

    const/16 v7, 0x27

    const/16 v6, 0x22

    const/4 v5, 0x4

    const/4 v4, 0x1

    .line 81
    const-string v1, "\\x"

    invoke-virtual {v1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    sput-object v1, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->ESCAPE_XHEXA_PREFIX:[C

    .line 82
    const-string v1, "\\u"

    invoke-virtual {v1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    sput-object v1, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->ESCAPE_UHEXA_PREFIX:[C

    .line 87
    const-string v1, "0123456789ABCDEF"

    invoke-virtual {v1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    sput-object v1, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->HEXA_CHARS_UPPER:[C

    .line 88
    const-string v1, "0123456789abcdef"

    invoke-virtual {v1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    sput-object v1, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->HEXA_CHARS_LOWER:[C

    .line 94
    const/16 v1, 0x5d

    sput v1, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->SEC_CHARS_LEN:I

    .line 95
    const/16 v1, 0x2a

    sput-char v1, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->SEC_CHARS_NO_SEC:C

    .line 113
    sget v1, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->SEC_CHARS_LEN:I

    new-array v1, v1, [C

    sput-object v1, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->SEC_CHARS:[C

    .line 114
    sget-object v1, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->SEC_CHARS:[C

    sget-char v2, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->SEC_CHARS_NO_SEC:C

    invoke-static {v1, v2}, Ljava/util/Arrays;->fill([CC)V

    .line 115
    sget-object v1, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->SEC_CHARS:[C

    const/4 v2, 0x0

    const/16 v3, 0x30

    aput-char v3, v1, v2

    .line 116
    sget-object v1, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->SEC_CHARS:[C

    const/16 v2, 0x8

    const/16 v3, 0x62

    aput-char v3, v1, v2

    .line 117
    sget-object v1, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->SEC_CHARS:[C

    const/16 v2, 0x9

    const/16 v3, 0x74

    aput-char v3, v1, v2

    .line 118
    sget-object v1, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->SEC_CHARS:[C

    const/16 v2, 0xa

    const/16 v3, 0x6e

    aput-char v3, v1, v2

    .line 119
    sget-object v1, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->SEC_CHARS:[C

    const/16 v2, 0xc

    const/16 v3, 0x66

    aput-char v3, v1, v2

    .line 120
    sget-object v1, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->SEC_CHARS:[C

    const/16 v2, 0xd

    const/16 v3, 0x72

    aput-char v3, v1, v2

    .line 121
    sget-object v1, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->SEC_CHARS:[C

    aput-char v6, v1, v6

    .line 122
    sget-object v1, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->SEC_CHARS:[C

    aput-char v7, v1, v7

    .line 123
    sget-object v1, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->SEC_CHARS:[C

    const/16 v2, 0x5c

    const/16 v3, 0x5c

    aput-char v3, v1, v2

    .line 125
    sget-object v1, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->SEC_CHARS:[C

    aput-char v8, v1, v8

    .line 139
    const/16 v1, 0xa1

    new-array v1, v1, [B

    sput-object v1, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->ESCAPE_LEVELS:[B

    .line 144
    sget-object v1, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->ESCAPE_LEVELS:[B

    const/4 v2, 0x3

    invoke-static {v1, v2}, Ljava/util/Arrays;->fill([BB)V

    .line 149
    const/16 v0, 0x80

    .local v0, "c":C
    :goto_8e
    const/16 v1, 0xa1

    if-ge v0, v1, :cond_9b

    .line 150
    sget-object v1, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->ESCAPE_LEVELS:[B

    const/4 v2, 0x2

    aput-byte v2, v1, v0

    .line 149
    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_8e

    .line 156
    :cond_9b
    const/16 v0, 0x41

    :goto_9d
    const/16 v1, 0x5a

    if-gt v0, v1, :cond_a9

    .line 157
    sget-object v1, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->ESCAPE_LEVELS:[B

    aput-byte v5, v1, v0

    .line 156
    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_9d

    .line 159
    :cond_a9
    const/16 v0, 0x61

    :goto_ab
    const/16 v1, 0x7a

    if-gt v0, v1, :cond_b7

    .line 160
    sget-object v1, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->ESCAPE_LEVELS:[B

    aput-byte v5, v1, v0

    .line 159
    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_ab

    .line 162
    :cond_b7
    const/16 v0, 0x30

    :goto_b9
    const/16 v1, 0x39

    if-gt v0, v1, :cond_c5

    .line 163
    sget-object v1, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->ESCAPE_LEVELS:[B

    aput-byte v5, v1, v0

    .line 162
    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_b9

    .line 169
    :cond_c5
    sget-object v1, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->ESCAPE_LEVELS:[B

    const/4 v2, 0x0

    aput-byte v4, v1, v2

    .line 170
    sget-object v1, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v2, 0x8

    aput-byte v4, v1, v2

    .line 171
    sget-object v1, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v2, 0x9

    aput-byte v4, v1, v2

    .line 172
    sget-object v1, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v2, 0xa

    aput-byte v4, v1, v2

    .line 173
    sget-object v1, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v2, 0xc

    aput-byte v4, v1, v2

    .line 174
    sget-object v1, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v2, 0xd

    aput-byte v4, v1, v2

    .line 175
    sget-object v1, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->ESCAPE_LEVELS:[B

    aput-byte v4, v1, v6

    .line 176
    sget-object v1, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->ESCAPE_LEVELS:[B

    aput-byte v4, v1, v7

    .line 177
    sget-object v1, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v2, 0x5c

    aput-byte v4, v1, v2

    .line 179
    sget-object v1, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->ESCAPE_LEVELS:[B

    aput-byte v4, v1, v8

    .line 185
    const/4 v0, 0x1

    :goto_fb
    const/16 v1, 0x1f

    if-gt v0, v1, :cond_107

    .line 186
    sget-object v1, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->ESCAPE_LEVELS:[B

    aput-byte v4, v1, v0

    .line 185
    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_fb

    .line 188
    :cond_107
    const/16 v0, 0x7f

    :goto_109
    const/16 v1, 0x9f

    if-gt v0, v1, :cond_115

    .line 189
    sget-object v1, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->ESCAPE_LEVELS:[B

    aput-byte v4, v1, v0

    .line 188
    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_109

    .line 192
    :cond_115
    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 197
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 198
    return-void
.end method

.method static escape(Ljava/lang/String;Lorg/unbescape/javascript/JavaScriptEscapeType;Lorg/unbescape/javascript/JavaScriptEscapeLevel;)Ljava/lang/String;
    .registers 16
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "escapeType"    # Lorg/unbescape/javascript/JavaScriptEscapeType;
    .param p2, "escapeLevel"    # Lorg/unbescape/javascript/JavaScriptEscapeLevel;

    .prologue
    .line 228
    if-nez p0, :cond_4

    .line 229
    const/4 p0, 0x0

    .line 367
    .end local p0    # "text":Ljava/lang/String;
    :cond_3
    :goto_3
    return-object p0

    .line 232
    .restart local p0    # "text":Ljava/lang/String;
    :cond_4
    invoke-virtual {p2}, Lorg/unbescape/javascript/JavaScriptEscapeLevel;->getEscapeLevel()I

    move-result v3

    .line 233
    .local v3, "level":I
    invoke-virtual {p1}, Lorg/unbescape/javascript/JavaScriptEscapeType;->getUseSECs()Z

    move-result v9

    .line 234
    .local v9, "useSECs":Z
    invoke-virtual {p1}, Lorg/unbescape/javascript/JavaScriptEscapeType;->getUseXHexa()Z

    move-result v10

    .line 236
    .local v10, "useXHexa":Z
    const/4 v8, 0x0

    .line 238
    .local v8, "strBuilder":Ljava/lang/StringBuilder;
    const/4 v5, 0x0

    .line 239
    .local v5, "offset":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    .line 241
    .local v4, "max":I
    const/4 v6, 0x0

    .line 243
    .local v6, "readOffset":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_18
    if-ge v2, v4, :cond_da

    .line 245
    invoke-static {p0, v2}, Ljava/lang/Character;->codePointAt(Ljava/lang/CharSequence;I)I

    move-result v0

    .line 252
    .local v0, "codepoint":I
    const/16 v11, 0x9f

    if-gt v0, v11, :cond_2b

    sget-object v11, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->ESCAPE_LEVELS:[B

    aget-byte v11, v11, v0

    if-ge v3, v11, :cond_2b

    .line 243
    :cond_28
    :goto_28
    add-int/lit8 v2, v2, 0x1

    goto :goto_18

    .line 260
    :cond_2b
    const/16 v11, 0x2f

    if-ne v0, v11, :cond_3e

    const/4 v11, 0x3

    if-ge v3, v11, :cond_3e

    if-eqz v2, :cond_28

    add-int/lit8 v11, v2, -0x1

    invoke-virtual {p0, v11}, Ljava/lang/String;->charAt(I)C

    move-result v11

    const/16 v12, 0x3c

    if-ne v11, v12, :cond_28

    .line 269
    :cond_3e
    const/16 v11, 0x9f

    if-le v0, v11, :cond_5c

    sget-object v11, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v12, 0xa0

    aget-byte v11, v11, v12

    if-ge v3, v11, :cond_5c

    const/16 v11, 0x2028

    if-eq v0, v11, :cond_5c

    const/16 v11, 0x2029

    if-eq v0, v11, :cond_5c

    .line 272
    invoke-static {v0}, Ljava/lang/Character;->charCount(I)I

    move-result v11

    const/4 v12, 0x1

    if-le v11, v12, :cond_28

    .line 274
    add-int/lit8 v2, v2, 0x1

    goto :goto_28

    .line 288
    :cond_5c
    if-nez v8, :cond_65

    .line 289
    new-instance v8, Ljava/lang/StringBuilder;

    .end local v8    # "strBuilder":Ljava/lang/StringBuilder;
    add-int/lit8 v11, v4, 0x14

    invoke-direct {v8, v11}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 292
    .restart local v8    # "strBuilder":Ljava/lang/StringBuilder;
    :cond_65
    sub-int v11, v2, v6

    if-lez v11, :cond_6c

    .line 293
    invoke-virtual {v8, p0, v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 296
    :cond_6c
    invoke-static {v0}, Ljava/lang/Character;->charCount(I)I

    move-result v11

    const/4 v12, 0x1

    if-le v11, v12, :cond_75

    .line 298
    add-int/lit8 v2, v2, 0x1

    .line 301
    :cond_75
    add-int/lit8 v6, v2, 0x1

    .line 312
    if-eqz v9, :cond_8e

    sget v11, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->SEC_CHARS_LEN:I

    if-ge v0, v11, :cond_8e

    .line 315
    sget-object v11, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->SEC_CHARS:[C

    aget-char v7, v11, v0

    .line 317
    .local v7, "sec":C
    sget-char v11, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->SEC_CHARS_NO_SEC:C

    if-eq v7, v11, :cond_8e

    .line 319
    const/16 v11, 0x5c

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 320
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_28

    .line 330
    .end local v7    # "sec":C
    :cond_8e
    if-eqz v10, :cond_a1

    const/16 v11, 0xff

    if-gt v0, v11, :cond_a1

    .line 332
    sget-object v11, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->ESCAPE_XHEXA_PREFIX:[C

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    .line 333
    invoke-static {v0}, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->toXHexa(I)[C

    move-result-object v11

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    goto :goto_28

    .line 337
    :cond_a1
    invoke-static {v0}, Ljava/lang/Character;->charCount(I)I

    move-result v11

    const/4 v12, 0x1

    if-le v11, v12, :cond_cc

    .line 338
    invoke-static {v0}, Ljava/lang/Character;->toChars(I)[C

    move-result-object v1

    .line 339
    .local v1, "codepointChars":[C
    sget-object v11, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->ESCAPE_UHEXA_PREFIX:[C

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    .line 340
    const/4 v11, 0x0

    aget-char v11, v1, v11

    invoke-static {v11}, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->toUHexa(I)[C

    move-result-object v11

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    .line 341
    sget-object v11, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->ESCAPE_UHEXA_PREFIX:[C

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    .line 342
    const/4 v11, 0x1

    aget-char v11, v1, v11

    invoke-static {v11}, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->toUHexa(I)[C

    move-result-object v11

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    goto/16 :goto_28

    .line 346
    .end local v1    # "codepointChars":[C
    :cond_cc
    sget-object v11, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->ESCAPE_UHEXA_PREFIX:[C

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    .line 347
    invoke-static {v0}, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->toUHexa(I)[C

    move-result-object v11

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    goto/16 :goto_28

    .line 359
    .end local v0    # "codepoint":I
    :cond_da
    if-eqz v8, :cond_3

    .line 363
    sub-int v11, v4, v6

    if-lez v11, :cond_e3

    .line 364
    invoke-virtual {v8, p0, v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 367
    :cond_e3
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto/16 :goto_3
.end method

.method static escape([CIILjava/io/Writer;Lorg/unbescape/javascript/JavaScriptEscapeType;Lorg/unbescape/javascript/JavaScriptEscapeLevel;)V
    .registers 17
    .param p0, "text"    # [C
    .param p1, "offset"    # I
    .param p2, "len"    # I
    .param p3, "writer"    # Ljava/io/Writer;
    .param p4, "escapeType"    # Lorg/unbescape/javascript/JavaScriptEscapeType;
    .param p5, "escapeLevel"    # Lorg/unbescape/javascript/JavaScriptEscapeLevel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 382
    if-eqz p0, :cond_5

    array-length v9, p0

    if-nez v9, :cond_6

    .line 509
    :cond_5
    :goto_5
    return-void

    .line 386
    :cond_6
    invoke-virtual/range {p5 .. p5}, Lorg/unbescape/javascript/JavaScriptEscapeLevel;->getEscapeLevel()I

    move-result v3

    .line 387
    .local v3, "level":I
    invoke-virtual {p4}, Lorg/unbescape/javascript/JavaScriptEscapeType;->getUseSECs()Z

    move-result v7

    .line 388
    .local v7, "useSECs":Z
    invoke-virtual {p4}, Lorg/unbescape/javascript/JavaScriptEscapeType;->getUseXHexa()Z

    move-result v8

    .line 390
    .local v8, "useXHexa":Z
    add-int v4, p1, p2

    .line 392
    .local v4, "max":I
    move v5, p1

    .line 394
    .local v5, "readOffset":I
    move v2, p1

    .local v2, "i":I
    :goto_16
    if-ge v2, v4, :cond_cf

    .line 396
    invoke-static {p0, v2}, Ljava/lang/Character;->codePointAt([CI)I

    move-result v0

    .line 403
    .local v0, "codepoint":I
    const/16 v9, 0x9f

    if-gt v0, v9, :cond_29

    sget-object v9, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->ESCAPE_LEVELS:[B

    aget-byte v9, v9, v0

    if-ge v3, v9, :cond_29

    .line 394
    :cond_26
    :goto_26
    add-int/lit8 v2, v2, 0x1

    goto :goto_16

    .line 411
    :cond_29
    const/16 v9, 0x2f

    if-ne v0, v9, :cond_3a

    const/4 v9, 0x3

    if-ge v3, v9, :cond_3a

    if-eqz v2, :cond_26

    add-int/lit8 v9, v2, -0x1

    aget-char v9, p0, v9

    const/16 v10, 0x3c

    if-ne v9, v10, :cond_26

    .line 420
    :cond_3a
    const/16 v9, 0x9f

    if-le v0, v9, :cond_58

    sget-object v9, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v10, 0xa0

    aget-byte v9, v9, v10

    if-ge v3, v9, :cond_58

    const/16 v9, 0x2028

    if-eq v0, v9, :cond_58

    const/16 v9, 0x2029

    if-eq v0, v9, :cond_58

    .line 423
    invoke-static {v0}, Ljava/lang/Character;->charCount(I)I

    move-result v9

    const/4 v10, 0x1

    if-le v9, v10, :cond_26

    .line 425
    add-int/lit8 v2, v2, 0x1

    goto :goto_26

    .line 438
    :cond_58
    sub-int v9, v2, v5

    if-lez v9, :cond_61

    .line 439
    sub-int v9, v2, v5

    invoke-virtual {p3, p0, v5, v9}, Ljava/io/Writer;->write([CII)V

    .line 442
    :cond_61
    invoke-static {v0}, Ljava/lang/Character;->charCount(I)I

    move-result v9

    const/4 v10, 0x1

    if-le v9, v10, :cond_6a

    .line 444
    add-int/lit8 v2, v2, 0x1

    .line 447
    :cond_6a
    add-int/lit8 v5, v2, 0x1

    .line 458
    if-eqz v7, :cond_83

    sget v9, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->SEC_CHARS_LEN:I

    if-ge v0, v9, :cond_83

    .line 461
    sget-object v9, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->SEC_CHARS:[C

    aget-char v6, v9, v0

    .line 463
    .local v6, "sec":C
    sget-char v9, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->SEC_CHARS_NO_SEC:C

    if-eq v6, v9, :cond_83

    .line 465
    const/16 v9, 0x5c

    invoke-virtual {p3, v9}, Ljava/io/Writer;->write(I)V

    .line 466
    invoke-virtual {p3, v6}, Ljava/io/Writer;->write(I)V

    goto :goto_26

    .line 476
    .end local v6    # "sec":C
    :cond_83
    if-eqz v8, :cond_96

    const/16 v9, 0xff

    if-gt v0, v9, :cond_96

    .line 478
    sget-object v9, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->ESCAPE_XHEXA_PREFIX:[C

    invoke-virtual {p3, v9}, Ljava/io/Writer;->write([C)V

    .line 479
    invoke-static {v0}, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->toXHexa(I)[C

    move-result-object v9

    invoke-virtual {p3, v9}, Ljava/io/Writer;->write([C)V

    goto :goto_26

    .line 483
    :cond_96
    invoke-static {v0}, Ljava/lang/Character;->charCount(I)I

    move-result v9

    const/4 v10, 0x1

    if-le v9, v10, :cond_c1

    .line 484
    invoke-static {v0}, Ljava/lang/Character;->toChars(I)[C

    move-result-object v1

    .line 485
    .local v1, "codepointChars":[C
    sget-object v9, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->ESCAPE_UHEXA_PREFIX:[C

    invoke-virtual {p3, v9}, Ljava/io/Writer;->write([C)V

    .line 486
    const/4 v9, 0x0

    aget-char v9, v1, v9

    invoke-static {v9}, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->toUHexa(I)[C

    move-result-object v9

    invoke-virtual {p3, v9}, Ljava/io/Writer;->write([C)V

    .line 487
    sget-object v9, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->ESCAPE_UHEXA_PREFIX:[C

    invoke-virtual {p3, v9}, Ljava/io/Writer;->write([C)V

    .line 488
    const/4 v9, 0x1

    aget-char v9, v1, v9

    invoke-static {v9}, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->toUHexa(I)[C

    move-result-object v9

    invoke-virtual {p3, v9}, Ljava/io/Writer;->write([C)V

    goto/16 :goto_26

    .line 492
    .end local v1    # "codepointChars":[C
    :cond_c1
    sget-object v9, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->ESCAPE_UHEXA_PREFIX:[C

    invoke-virtual {p3, v9}, Ljava/io/Writer;->write([C)V

    .line 493
    invoke-static {v0}, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->toUHexa(I)[C

    move-result-object v9

    invoke-virtual {p3, v9}, Ljava/io/Writer;->write([C)V

    goto/16 :goto_26

    .line 505
    .end local v0    # "codepoint":I
    :cond_cf
    sub-int v9, v4, v5

    if-lez v9, :cond_5

    .line 506
    sub-int v9, v4, v5

    invoke-virtual {p3, p0, v5, v9}, Ljava/io/Writer;->write([CII)V

    goto/16 :goto_5
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

    .line 562
    if-lt p1, p2, :cond_9

    .line 589
    :cond_8
    :goto_8
    return v4

    .line 566
    :cond_9
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 567
    .local v0, "c1":C
    if-lt v0, v6, :cond_8

    if-gt v0, v7, :cond_8

    .line 571
    add-int/lit8 v5, p1, 0x1

    if-lt v5, p2, :cond_1b

    .line 572
    if-eq v0, v6, :cond_19

    :goto_17
    move v4, v3

    goto :goto_8

    :cond_19
    move v3, v4

    goto :goto_17

    .line 575
    :cond_1b
    add-int/lit8 v5, p1, 0x1

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 576
    .local v1, "c2":C
    if-lt v1, v6, :cond_25

    if-le v1, v7, :cond_2b

    .line 577
    :cond_25
    if-eq v0, v6, :cond_29

    :goto_27
    move v4, v3

    goto :goto_8

    :cond_29
    move v3, v4

    goto :goto_27

    .line 580
    :cond_2b
    add-int/lit8 v5, p1, 0x2

    if-lt v5, p2, :cond_35

    .line 581
    if-ne v0, v6, :cond_33

    if-eq v1, v6, :cond_8

    :cond_33
    move v4, v3

    goto :goto_8

    .line 584
    :cond_35
    add-int/lit8 v5, p1, 0x2

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 585
    .local v2, "c3":C
    if-lt v2, v6, :cond_3f

    if-le v2, v7, :cond_45

    .line 586
    :cond_3f
    if-ne v0, v6, :cond_43

    if-eq v1, v6, :cond_8

    :cond_43
    move v4, v3

    goto :goto_8

    .line 589
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

    .line 596
    if-lt p1, p2, :cond_9

    .line 623
    :cond_8
    :goto_8
    return v4

    .line 600
    :cond_9
    aget-char v0, p0, p1

    .line 601
    .local v0, "c1":C
    if-lt v0, v6, :cond_8

    if-gt v0, v7, :cond_8

    .line 605
    add-int/lit8 v5, p1, 0x1

    if-lt v5, p2, :cond_19

    .line 606
    if-eq v0, v6, :cond_17

    :goto_15
    move v4, v3

    goto :goto_8

    :cond_17
    move v3, v4

    goto :goto_15

    .line 609
    :cond_19
    add-int/lit8 v5, p1, 0x1

    aget-char v1, p0, v5

    .line 610
    .local v1, "c2":C
    if-lt v1, v6, :cond_21

    if-le v1, v7, :cond_27

    .line 611
    :cond_21
    if-eq v0, v6, :cond_25

    :goto_23
    move v4, v3

    goto :goto_8

    :cond_25
    move v3, v4

    goto :goto_23

    .line 614
    :cond_27
    add-int/lit8 v5, p1, 0x2

    if-lt v5, p2, :cond_31

    .line 615
    if-ne v0, v6, :cond_2f

    if-eq v1, v6, :cond_8

    :cond_2f
    move v4, v3

    goto :goto_8

    .line 618
    :cond_31
    add-int/lit8 v5, p1, 0x2

    aget-char v2, p0, v5

    .line 619
    .local v2, "c3":C
    if-lt v2, v6, :cond_39

    if-le v2, v7, :cond_3f

    .line 620
    :cond_39
    if-ne v0, v6, :cond_3d

    if-eq v1, v6, :cond_8

    :cond_3d
    move v4, v3

    goto :goto_8

    .line 623
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
    .line 525
    const/4 v4, 0x0

    .line 526
    .local v4, "result":I
    move v1, p1

    .local v1, "i":I
    :goto_2
    if-ge v1, p2, :cond_26

    .line 527
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 528
    .local v0, "c":C
    const/4 v3, -0x1

    .line 529
    .local v3, "n":I
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_a
    sget-object v5, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->HEXA_CHARS_UPPER:[C

    array-length v5, v5

    if-ge v2, v5, :cond_1c

    .line 530
    sget-object v5, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->HEXA_CHARS_UPPER:[C

    aget-char v5, v5, v2

    if-eq v0, v5, :cond_1b

    sget-object v5, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->HEXA_CHARS_LOWER:[C

    aget-char v5, v5, v2

    if-ne v0, v5, :cond_23

    .line 531
    :cond_1b
    move v3, v2

    .line 535
    :cond_1c
    mul-int v5, p3, v4

    add-int v4, v5, v3

    .line 526
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 529
    :cond_23
    add-int/lit8 v2, v2, 0x1

    goto :goto_a

    .line 537
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
    .line 541
    const/4 v4, 0x0

    .line 542
    .local v4, "result":I
    move v1, p1

    .local v1, "i":I
    :goto_2
    if-ge v1, p2, :cond_24

    .line 543
    aget-char v0, p0, v1

    .line 544
    .local v0, "c":C
    const/4 v3, -0x1

    .line 545
    .local v3, "n":I
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_8
    sget-object v5, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->HEXA_CHARS_UPPER:[C

    array-length v5, v5

    if-ge v2, v5, :cond_1a

    .line 546
    sget-object v5, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->HEXA_CHARS_UPPER:[C

    aget-char v5, v5, v2

    if-eq v0, v5, :cond_19

    sget-object v5, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->HEXA_CHARS_LOWER:[C

    aget-char v5, v5, v2

    if-ne v0, v5, :cond_21

    .line 547
    :cond_19
    move v3, v2

    .line 551
    :cond_1a
    mul-int v5, p3, v4

    add-int v4, v5, v3

    .line 542
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 545
    :cond_21
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    .line 553
    .end local v0    # "c":C
    .end local v2    # "j":I
    .end local v3    # "n":I
    :cond_24
    return v4
.end method

.method static toUHexa(I)[C
    .registers 5
    .param p0, "codepoint"    # I

    .prologue
    .line 212
    const/4 v1, 0x4

    new-array v0, v1, [C

    .line 213
    .local v0, "result":[C
    const/4 v1, 0x3

    sget-object v2, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->HEXA_CHARS_UPPER:[C

    rem-int/lit8 v3, p0, 0x10

    aget-char v2, v2, v3

    aput-char v2, v0, v1

    .line 214
    const/4 v1, 0x2

    sget-object v2, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->HEXA_CHARS_UPPER:[C

    ushr-int/lit8 v3, p0, 0x4

    rem-int/lit8 v3, v3, 0x10

    aget-char v2, v2, v3

    aput-char v2, v0, v1

    .line 215
    const/4 v1, 0x1

    sget-object v2, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->HEXA_CHARS_UPPER:[C

    ushr-int/lit8 v3, p0, 0x8

    rem-int/lit8 v3, v3, 0x10

    aget-char v2, v2, v3

    aput-char v2, v0, v1

    .line 216
    const/4 v1, 0x0

    sget-object v2, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->HEXA_CHARS_UPPER:[C

    ushr-int/lit8 v3, p0, 0xc

    rem-int/lit8 v3, v3, 0x10

    aget-char v2, v2, v3

    aput-char v2, v0, v1

    .line 217
    return-object v0
.end method

.method static toXHexa(I)[C
    .registers 5
    .param p0, "codepoint"    # I

    .prologue
    .line 204
    const/4 v1, 0x2

    new-array v0, v1, [C

    .line 205
    .local v0, "result":[C
    const/4 v1, 0x1

    sget-object v2, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->HEXA_CHARS_UPPER:[C

    rem-int/lit8 v3, p0, 0x10

    aget-char v2, v2, v3

    aput-char v2, v0, v1

    .line 206
    const/4 v1, 0x0

    sget-object v2, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->HEXA_CHARS_UPPER:[C

    ushr-int/lit8 v3, p0, 0x4

    rem-int/lit8 v3, v3, 0x10

    aget-char v2, v2, v3

    aput-char v2, v0, v1

    .line 207
    return-object v0
.end method

.method static unescape(Ljava/lang/String;)Ljava/lang/String;
    .registers 15
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 635
    if-nez p0, :cond_4

    .line 636
    const/4 p0, 0x0

    .line 830
    .end local p0    # "text":Ljava/lang/String;
    .local v5, "i":I
    .local v6, "max":I
    .local v7, "offset":I
    .local v8, "readOffset":I
    .local v9, "referenceOffset":I
    .local v10, "strBuilder":Ljava/lang/StringBuilder;
    :cond_3
    :goto_3
    return-object p0

    .line 639
    .end local v5    # "i":I
    .end local v6    # "max":I
    .end local v7    # "offset":I
    .end local v8    # "readOffset":I
    .end local v9    # "referenceOffset":I
    .end local v10    # "strBuilder":Ljava/lang/StringBuilder;
    .restart local p0    # "text":Ljava/lang/String;
    :cond_4
    const/4 v10, 0x0

    .line 641
    .restart local v10    # "strBuilder":Ljava/lang/StringBuilder;
    const/4 v7, 0x0

    .line 642
    .restart local v7    # "offset":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    .line 644
    .restart local v6    # "max":I
    const/4 v8, 0x0

    .line 645
    .restart local v8    # "readOffset":I
    const/4 v9, 0x0

    .line 647
    .restart local v9    # "referenceOffset":I
    const/4 v5, 0x0

    .restart local v5    # "i":I
    :goto_d
    if-ge v5, v6, :cond_172

    .line 649
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 655
    .local v0, "c":C
    const/16 v11, 0x5c

    if-ne v0, v11, :cond_1b

    add-int/lit8 v11, v5, 0x1

    if-lt v11, v6, :cond_1e

    .line 647
    :cond_1b
    :goto_1b
    add-int/lit8 v5, v5, 0x1

    goto :goto_d

    .line 659
    :cond_1e
    const/4 v3, -0x1

    .line 661
    .local v3, "codepoint":I
    const/16 v11, 0x5c

    if-ne v0, v11, :cond_ac

    .line 663
    add-int/lit8 v11, v5, 0x1

    invoke-virtual {p0, v11}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 665
    .local v1, "c1":C
    sparse-switch v1, :sswitch_data_182

    .line 679
    :cond_2c
    :goto_2c
    const/4 v11, -0x1

    if-ne v3, v11, :cond_ac

    .line 681
    const/16 v11, 0x78

    if-ne v1, v11, :cond_cd

    .line 684
    add-int/lit8 v4, v5, 0x2

    .line 685
    .local v4, "f":I
    :goto_35
    add-int/lit8 v11, v5, 0x4

    if-ge v4, v11, :cond_57

    if-ge v4, v6, :cond_57

    .line 686
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 687
    .local v2, "cf":C
    const/16 v11, 0x30

    if-lt v2, v11, :cond_47

    const/16 v11, 0x39

    if-le v2, v11, :cond_9f

    :cond_47
    const/16 v11, 0x41

    if-lt v2, v11, :cond_4f

    const/16 v11, 0x46

    if-le v2, v11, :cond_9f

    :cond_4f
    const/16 v11, 0x61

    if-lt v2, v11, :cond_57

    const/16 v11, 0x66

    if-le v2, v11, :cond_9f

    .line 693
    .end local v2    # "cf":C
    :cond_57
    add-int/lit8 v11, v5, 0x2

    sub-int v11, v4, v11

    const/4 v12, 0x2

    if-ge v11, v12, :cond_a2

    .line 696
    add-int/lit8 v5, v5, 0x1

    .line 697
    goto :goto_1b

    .line 666
    .end local v4    # "f":I
    :sswitch_61
    add-int/lit8 v11, v5, 0x1

    invoke-static {p0, v11, v6}, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->isOctalEscape(Ljava/lang/String;II)Z

    move-result v11

    if-nez v11, :cond_2c

    const/4 v3, 0x0

    add-int/lit8 v9, v5, 0x1

    goto :goto_2c

    .line 667
    :sswitch_6d
    const/16 v3, 0x8

    add-int/lit8 v9, v5, 0x1

    goto :goto_2c

    .line 668
    :sswitch_72
    const/16 v3, 0x9

    add-int/lit8 v9, v5, 0x1

    goto :goto_2c

    .line 669
    :sswitch_77
    const/16 v3, 0xa

    add-int/lit8 v9, v5, 0x1

    goto :goto_2c

    .line 670
    :sswitch_7c
    const/16 v3, 0xb

    add-int/lit8 v9, v5, 0x1

    goto :goto_2c

    .line 671
    :sswitch_81
    const/16 v3, 0xc

    add-int/lit8 v9, v5, 0x1

    goto :goto_2c

    .line 672
    :sswitch_86
    const/16 v3, 0xd

    add-int/lit8 v9, v5, 0x1

    goto :goto_2c

    .line 673
    :sswitch_8b
    const/16 v3, 0x22

    add-int/lit8 v9, v5, 0x1

    goto :goto_2c

    .line 674
    :sswitch_90
    const/16 v3, 0x27

    add-int/lit8 v9, v5, 0x1

    goto :goto_2c

    .line 675
    :sswitch_95
    const/16 v3, 0x5c

    add-int/lit8 v9, v5, 0x1

    goto :goto_2c

    .line 676
    :sswitch_9a
    const/16 v3, 0x2f

    add-int/lit8 v9, v5, 0x1

    goto :goto_2c

    .line 690
    .restart local v2    # "cf":C
    .restart local v4    # "f":I
    :cond_9f
    add-int/lit8 v4, v4, 0x1

    .line 691
    goto :goto_35

    .line 700
    .end local v2    # "cf":C
    :cond_a2
    add-int/lit8 v11, v5, 0x2

    const/16 v12, 0x10

    invoke-static {p0, v11, v4, v12}, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->parseIntFromReference(Ljava/lang/String;III)I

    move-result v3

    .line 703
    add-int/lit8 v9, v4, -0x1

    .line 787
    .end local v1    # "c1":C
    .end local v4    # "f":I
    :cond_ac
    :goto_ac
    if-nez v10, :cond_b5

    .line 788
    new-instance v10, Ljava/lang/StringBuilder;

    .end local v10    # "strBuilder":Ljava/lang/StringBuilder;
    add-int/lit8 v11, v6, 0x5

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 791
    .restart local v10    # "strBuilder":Ljava/lang/StringBuilder;
    :cond_b5
    sub-int v11, v5, v8

    if-lez v11, :cond_bc

    .line 792
    invoke-virtual {v10, p0, v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 795
    :cond_bc
    move v5, v9

    .line 796
    add-int/lit8 v8, v5, 0x1

    .line 806
    const v11, 0xffff

    if-le v3, v11, :cond_16c

    .line 807
    invoke-static {v3}, Ljava/lang/Character;->toChars(I)[C

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    goto/16 :goto_1b

    .line 707
    .restart local v1    # "c1":C
    :cond_cd
    const/16 v11, 0x75

    if-ne v1, v11, :cond_10e

    .line 710
    add-int/lit8 v4, v5, 0x2

    .line 711
    .restart local v4    # "f":I
    :goto_d3
    add-int/lit8 v11, v5, 0x6

    if-ge v4, v11, :cond_f5

    if-ge v4, v6, :cond_f5

    .line 712
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 713
    .restart local v2    # "cf":C
    const/16 v11, 0x30

    if-lt v2, v11, :cond_e5

    const/16 v11, 0x39

    if-le v2, v11, :cond_100

    :cond_e5
    const/16 v11, 0x41

    if-lt v2, v11, :cond_ed

    const/16 v11, 0x46

    if-le v2, v11, :cond_100

    :cond_ed
    const/16 v11, 0x61

    if-lt v2, v11, :cond_f5

    const/16 v11, 0x66

    if-le v2, v11, :cond_100

    .line 719
    .end local v2    # "cf":C
    :cond_f5
    add-int/lit8 v11, v5, 0x2

    sub-int v11, v4, v11

    const/4 v12, 0x4

    if-ge v11, v12, :cond_103

    .line 722
    add-int/lit8 v5, v5, 0x1

    .line 723
    goto/16 :goto_1b

    .line 716
    .restart local v2    # "cf":C
    :cond_100
    add-int/lit8 v4, v4, 0x1

    .line 717
    goto :goto_d3

    .line 726
    .end local v2    # "cf":C
    :cond_103
    add-int/lit8 v11, v5, 0x2

    const/16 v12, 0x10

    invoke-static {p0, v11, v4, v12}, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->parseIntFromReference(Ljava/lang/String;III)I

    move-result v3

    .line 729
    add-int/lit8 v9, v4, -0x1

    .line 733
    goto :goto_ac

    .end local v4    # "f":I
    :cond_10e
    const/16 v11, 0x30

    if-lt v1, v11, :cond_14b

    const/16 v11, 0x37

    if-gt v1, v11, :cond_14b

    .line 736
    add-int/lit8 v4, v5, 0x2

    .line 737
    .restart local v4    # "f":I
    :goto_118
    add-int/lit8 v11, v5, 0x4

    if-ge v4, v11, :cond_12a

    if-ge v4, v6, :cond_12a

    .line 738
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 739
    .restart local v2    # "cf":C
    const/16 v11, 0x30

    if-lt v2, v11, :cond_12a

    const/16 v11, 0x37

    if-le v2, v11, :cond_144

    .line 745
    .end local v2    # "cf":C
    :cond_12a
    add-int/lit8 v11, v5, 0x1

    const/16 v12, 0x8

    invoke-static {p0, v11, v4, v12}, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->parseIntFromReference(Ljava/lang/String;III)I

    move-result v3

    .line 747
    const/16 v11, 0xff

    if-le v3, v11, :cond_147

    .line 749
    add-int/lit8 v11, v5, 0x1

    add-int/lit8 v12, v4, -0x1

    const/16 v13, 0x8

    invoke-static {p0, v11, v12, v13}, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->parseIntFromReference(Ljava/lang/String;III)I

    move-result v3

    .line 750
    add-int/lit8 v9, v4, -0x2

    goto/16 :goto_ac

    .line 742
    .restart local v2    # "cf":C
    :cond_144
    add-int/lit8 v4, v4, 0x1

    .line 743
    goto :goto_118

    .line 752
    .end local v2    # "cf":C
    :cond_147
    add-int/lit8 v9, v4, -0x1

    goto/16 :goto_ac

    .line 757
    .end local v4    # "f":I
    :cond_14b
    const/16 v11, 0x38

    if-eq v1, v11, :cond_163

    const/16 v11, 0x39

    if-eq v1, v11, :cond_163

    const/16 v11, 0xa

    if-eq v1, v11, :cond_163

    const/16 v11, 0xd

    if-eq v1, v11, :cond_163

    const/16 v11, 0x2028

    if-eq v1, v11, :cond_163

    const/16 v11, 0x2029

    if-ne v1, v11, :cond_167

    .line 763
    :cond_163
    add-int/lit8 v5, v5, 0x1

    .line 764
    goto/16 :goto_1b

    .line 771
    :cond_167
    move v3, v1

    .line 772
    add-int/lit8 v9, v5, 0x1

    goto/16 :goto_ac

    .line 809
    .end local v1    # "c1":C
    :cond_16c
    int-to-char v11, v3

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_1b

    .line 822
    .end local v0    # "c":C
    .end local v3    # "codepoint":I
    :cond_172
    if-eqz v10, :cond_3

    .line 826
    sub-int v11, v6, v8

    if-lez v11, :cond_17b

    .line 827
    invoke-virtual {v10, p0, v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 830
    :cond_17b
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto/16 :goto_3

    .line 665
    nop

    :sswitch_data_182
    .sparse-switch
        0x22 -> :sswitch_8b
        0x27 -> :sswitch_90
        0x2f -> :sswitch_9a
        0x30 -> :sswitch_61
        0x5c -> :sswitch_95
        0x62 -> :sswitch_6d
        0x66 -> :sswitch_81
        0x6e -> :sswitch_77
        0x72 -> :sswitch_86
        0x74 -> :sswitch_72
        0x76 -> :sswitch_7c
    .end sparse-switch
.end method

.method static unescape([CIILjava/io/Writer;)V
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
    .line 845
    if-nez p0, :cond_3

    .line 1026
    :cond_2
    :goto_2
    return-void

    .line 849
    :cond_3
    add-int v6, p1, p2

    .line 851
    .local v6, "max":I
    move v7, p1

    .line 852
    .local v7, "readOffset":I
    move v8, p1

    .line 854
    .local v8, "referenceOffset":I
    move v5, p1

    .local v5, "i":I
    :goto_8
    if-ge v5, v6, :cond_15c

    .line 856
    aget-char v0, p0, v5

    .line 862
    .local v0, "c":C
    const/16 v9, 0x5c

    if-ne v0, v9, :cond_14

    add-int/lit8 v9, v5, 0x1

    if-lt v9, v6, :cond_17

    .line 854
    :cond_14
    :goto_14
    add-int/lit8 v5, v5, 0x1

    goto :goto_8

    .line 866
    :cond_17
    const/4 v3, -0x1

    .line 868
    .local v3, "codepoint":I
    const/16 v9, 0x5c

    if-ne v0, v9, :cond_a1

    .line 870
    add-int/lit8 v9, v5, 0x1

    aget-char v1, p0, v9

    .line 872
    .local v1, "c1":C
    sparse-switch v1, :sswitch_data_168

    .line 886
    :cond_23
    :goto_23
    const/4 v9, -0x1

    if-ne v3, v9, :cond_a1

    .line 888
    const/16 v9, 0x78

    if-ne v1, v9, :cond_bb

    .line 891
    add-int/lit8 v4, v5, 0x2

    .line 892
    .local v4, "f":I
    :goto_2c
    add-int/lit8 v9, v5, 0x4

    if-ge v4, v9, :cond_4c

    if-ge v4, v6, :cond_4c

    .line 893
    aget-char v2, p0, v4

    .line 894
    .local v2, "cf":C
    const/16 v9, 0x30

    if-lt v2, v9, :cond_3c

    const/16 v9, 0x39

    if-le v2, v9, :cond_94

    :cond_3c
    const/16 v9, 0x41

    if-lt v2, v9, :cond_44

    const/16 v9, 0x46

    if-le v2, v9, :cond_94

    :cond_44
    const/16 v9, 0x61

    if-lt v2, v9, :cond_4c

    const/16 v9, 0x66

    if-le v2, v9, :cond_94

    .line 900
    .end local v2    # "cf":C
    :cond_4c
    add-int/lit8 v9, v5, 0x2

    sub-int v9, v4, v9

    const/4 v10, 0x2

    if-ge v9, v10, :cond_97

    .line 903
    add-int/lit8 v5, v5, 0x1

    .line 904
    goto :goto_14

    .line 873
    .end local v4    # "f":I
    :sswitch_56
    add-int/lit8 v9, v5, 0x1

    invoke-static {p0, v9, v6}, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->isOctalEscape([CII)Z

    move-result v9

    if-nez v9, :cond_23

    const/4 v3, 0x0

    add-int/lit8 v8, v5, 0x1

    goto :goto_23

    .line 874
    :sswitch_62
    const/16 v3, 0x8

    add-int/lit8 v8, v5, 0x1

    goto :goto_23

    .line 875
    :sswitch_67
    const/16 v3, 0x9

    add-int/lit8 v8, v5, 0x1

    goto :goto_23

    .line 876
    :sswitch_6c
    const/16 v3, 0xa

    add-int/lit8 v8, v5, 0x1

    goto :goto_23

    .line 877
    :sswitch_71
    const/16 v3, 0xb

    add-int/lit8 v8, v5, 0x1

    goto :goto_23

    .line 878
    :sswitch_76
    const/16 v3, 0xc

    add-int/lit8 v8, v5, 0x1

    goto :goto_23

    .line 879
    :sswitch_7b
    const/16 v3, 0xd

    add-int/lit8 v8, v5, 0x1

    goto :goto_23

    .line 880
    :sswitch_80
    const/16 v3, 0x22

    add-int/lit8 v8, v5, 0x1

    goto :goto_23

    .line 881
    :sswitch_85
    const/16 v3, 0x27

    add-int/lit8 v8, v5, 0x1

    goto :goto_23

    .line 882
    :sswitch_8a
    const/16 v3, 0x5c

    add-int/lit8 v8, v5, 0x1

    goto :goto_23

    .line 883
    :sswitch_8f
    const/16 v3, 0x2f

    add-int/lit8 v8, v5, 0x1

    goto :goto_23

    .line 897
    .restart local v2    # "cf":C
    .restart local v4    # "f":I
    :cond_94
    add-int/lit8 v4, v4, 0x1

    .line 898
    goto :goto_2c

    .line 907
    .end local v2    # "cf":C
    :cond_97
    add-int/lit8 v9, v5, 0x2

    const/16 v10, 0x10

    invoke-static {p0, v9, v4, v10}, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->parseIntFromReference([CIII)I

    move-result v3

    .line 910
    add-int/lit8 v8, v4, -0x1

    .line 992
    .end local v1    # "c1":C
    .end local v4    # "f":I
    :cond_a1
    :goto_a1
    sub-int v9, v5, v7

    if-lez v9, :cond_aa

    .line 993
    sub-int v9, v5, v7

    invoke-virtual {p3, p0, v7, v9}, Ljava/io/Writer;->write([CII)V

    .line 996
    :cond_aa
    move v5, v8

    .line 997
    add-int/lit8 v7, v5, 0x1

    .line 1007
    const v9, 0xffff

    if-le v3, v9, :cond_156

    .line 1008
    invoke-static {v3}, Ljava/lang/Character;->toChars(I)[C

    move-result-object v9

    invoke-virtual {p3, v9}, Ljava/io/Writer;->write([C)V

    goto/16 :goto_14

    .line 914
    .restart local v1    # "c1":C
    :cond_bb
    const/16 v9, 0x75

    if-ne v1, v9, :cond_fa

    .line 917
    add-int/lit8 v4, v5, 0x2

    .line 918
    .restart local v4    # "f":I
    :goto_c1
    add-int/lit8 v9, v5, 0x6

    if-ge v4, v9, :cond_e1

    if-ge v4, v6, :cond_e1

    .line 919
    aget-char v2, p0, v4

    .line 920
    .restart local v2    # "cf":C
    const/16 v9, 0x30

    if-lt v2, v9, :cond_d1

    const/16 v9, 0x39

    if-le v2, v9, :cond_ec

    :cond_d1
    const/16 v9, 0x41

    if-lt v2, v9, :cond_d9

    const/16 v9, 0x46

    if-le v2, v9, :cond_ec

    :cond_d9
    const/16 v9, 0x61

    if-lt v2, v9, :cond_e1

    const/16 v9, 0x66

    if-le v2, v9, :cond_ec

    .line 926
    .end local v2    # "cf":C
    :cond_e1
    add-int/lit8 v9, v5, 0x2

    sub-int v9, v4, v9

    const/4 v10, 0x4

    if-ge v9, v10, :cond_ef

    .line 929
    add-int/lit8 v5, v5, 0x1

    .line 930
    goto/16 :goto_14

    .line 923
    .restart local v2    # "cf":C
    :cond_ec
    add-int/lit8 v4, v4, 0x1

    .line 924
    goto :goto_c1

    .line 933
    .end local v2    # "cf":C
    :cond_ef
    add-int/lit8 v9, v5, 0x2

    const/16 v10, 0x10

    invoke-static {p0, v9, v4, v10}, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->parseIntFromReference([CIII)I

    move-result v3

    .line 936
    add-int/lit8 v8, v4, -0x1

    .line 940
    goto :goto_a1

    .end local v4    # "f":I
    :cond_fa
    const/16 v9, 0x30

    if-lt v1, v9, :cond_135

    const/16 v9, 0x37

    if-gt v1, v9, :cond_135

    .line 943
    add-int/lit8 v4, v5, 0x2

    .line 944
    .restart local v4    # "f":I
    :goto_104
    add-int/lit8 v9, v5, 0x4

    if-ge v4, v9, :cond_114

    if-ge v4, v6, :cond_114

    .line 945
    aget-char v2, p0, v4

    .line 946
    .restart local v2    # "cf":C
    const/16 v9, 0x30

    if-lt v2, v9, :cond_114

    const/16 v9, 0x37

    if-le v2, v9, :cond_12e

    .line 952
    .end local v2    # "cf":C
    :cond_114
    add-int/lit8 v9, v5, 0x1

    const/16 v10, 0x8

    invoke-static {p0, v9, v4, v10}, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->parseIntFromReference([CIII)I

    move-result v3

    .line 953
    const/16 v9, 0xff

    if-le v3, v9, :cond_131

    .line 955
    add-int/lit8 v9, v5, 0x1

    add-int/lit8 v10, v4, -0x1

    const/16 v11, 0x8

    invoke-static {p0, v9, v10, v11}, Lorg/unbescape/javascript/JavaScriptEscapeUtil;->parseIntFromReference([CIII)I

    move-result v3

    .line 956
    add-int/lit8 v8, v4, -0x2

    goto/16 :goto_a1

    .line 949
    .restart local v2    # "cf":C
    :cond_12e
    add-int/lit8 v4, v4, 0x1

    .line 950
    goto :goto_104

    .line 958
    .end local v2    # "cf":C
    :cond_131
    add-int/lit8 v8, v4, -0x1

    goto/16 :goto_a1

    .line 963
    .end local v4    # "f":I
    :cond_135
    const/16 v9, 0x38

    if-eq v1, v9, :cond_14d

    const/16 v9, 0x39

    if-eq v1, v9, :cond_14d

    const/16 v9, 0xa

    if-eq v1, v9, :cond_14d

    const/16 v9, 0xd

    if-eq v1, v9, :cond_14d

    const/16 v9, 0x2028

    if-eq v1, v9, :cond_14d

    const/16 v9, 0x2029

    if-ne v1, v9, :cond_151

    .line 969
    :cond_14d
    add-int/lit8 v5, v5, 0x1

    .line 970
    goto/16 :goto_14

    .line 977
    :cond_151
    move v3, v1

    .line 978
    add-int/lit8 v8, v5, 0x1

    goto/16 :goto_a1

    .line 1010
    .end local v1    # "c1":C
    :cond_156
    int-to-char v9, v3

    invoke-virtual {p3, v9}, Ljava/io/Writer;->write(I)V

    goto/16 :goto_14

    .line 1022
    .end local v0    # "c":C
    .end local v3    # "codepoint":I
    :cond_15c
    sub-int v9, v6, v7

    if-lez v9, :cond_2

    .line 1023
    sub-int v9, v6, v7

    invoke-virtual {p3, p0, v7, v9}, Ljava/io/Writer;->write([CII)V

    goto/16 :goto_2

    .line 872
    nop

    :sswitch_data_168
    .sparse-switch
        0x22 -> :sswitch_80
        0x27 -> :sswitch_85
        0x2f -> :sswitch_8f
        0x30 -> :sswitch_56
        0x5c -> :sswitch_8a
        0x62 -> :sswitch_62
        0x66 -> :sswitch_76
        0x6e -> :sswitch_6c
        0x72 -> :sswitch_7b
        0x74 -> :sswitch_67
        0x76 -> :sswitch_71
    .end sparse-switch
.end method
