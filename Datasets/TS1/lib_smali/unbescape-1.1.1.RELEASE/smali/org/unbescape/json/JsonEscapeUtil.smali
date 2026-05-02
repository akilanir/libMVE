.class final Lorg/unbescape/json/JsonEscapeUtil;
.super Ljava/lang/Object;
.source "JsonEscapeUtil.java"


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

    const/16 v7, 0x2f

    const/16 v6, 0x22

    const/4 v5, 0x4

    const/4 v4, 0x1

    .line 81
    const-string v1, "\\u"

    invoke-virtual {v1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    sput-object v1, Lorg/unbescape/json/JsonEscapeUtil;->ESCAPE_UHEXA_PREFIX:[C

    .line 86
    const-string v1, "0123456789ABCDEF"

    invoke-virtual {v1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    sput-object v1, Lorg/unbescape/json/JsonEscapeUtil;->HEXA_CHARS_UPPER:[C

    .line 87
    const-string v1, "0123456789abcdef"

    invoke-virtual {v1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    sput-object v1, Lorg/unbescape/json/JsonEscapeUtil;->HEXA_CHARS_LOWER:[C

    .line 93
    const/16 v1, 0x5d

    sput v1, Lorg/unbescape/json/JsonEscapeUtil;->SEC_CHARS_LEN:I

    .line 94
    const/16 v1, 0x2a

    sput-char v1, Lorg/unbescape/json/JsonEscapeUtil;->SEC_CHARS_NO_SEC:C

    .line 112
    sget v1, Lorg/unbescape/json/JsonEscapeUtil;->SEC_CHARS_LEN:I

    new-array v1, v1, [C

    sput-object v1, Lorg/unbescape/json/JsonEscapeUtil;->SEC_CHARS:[C

    .line 113
    sget-object v1, Lorg/unbescape/json/JsonEscapeUtil;->SEC_CHARS:[C

    sget-char v2, Lorg/unbescape/json/JsonEscapeUtil;->SEC_CHARS_NO_SEC:C

    invoke-static {v1, v2}, Ljava/util/Arrays;->fill([CC)V

    .line 114
    sget-object v1, Lorg/unbescape/json/JsonEscapeUtil;->SEC_CHARS:[C

    const/16 v2, 0x8

    const/16 v3, 0x62

    aput-char v3, v1, v2

    .line 115
    sget-object v1, Lorg/unbescape/json/JsonEscapeUtil;->SEC_CHARS:[C

    const/16 v2, 0x9

    const/16 v3, 0x74

    aput-char v3, v1, v2

    .line 116
    sget-object v1, Lorg/unbescape/json/JsonEscapeUtil;->SEC_CHARS:[C

    const/16 v2, 0xa

    const/16 v3, 0x6e

    aput-char v3, v1, v2

    .line 117
    sget-object v1, Lorg/unbescape/json/JsonEscapeUtil;->SEC_CHARS:[C

    const/16 v2, 0xc

    const/16 v3, 0x66

    aput-char v3, v1, v2

    .line 118
    sget-object v1, Lorg/unbescape/json/JsonEscapeUtil;->SEC_CHARS:[C

    const/16 v2, 0xd

    const/16 v3, 0x72

    aput-char v3, v1, v2

    .line 119
    sget-object v1, Lorg/unbescape/json/JsonEscapeUtil;->SEC_CHARS:[C

    aput-char v6, v1, v6

    .line 120
    sget-object v1, Lorg/unbescape/json/JsonEscapeUtil;->SEC_CHARS:[C

    aput-char v8, v1, v8

    .line 122
    sget-object v1, Lorg/unbescape/json/JsonEscapeUtil;->SEC_CHARS:[C

    aput-char v7, v1, v7

    .line 136
    const/16 v1, 0xa1

    new-array v1, v1, [B

    sput-object v1, Lorg/unbescape/json/JsonEscapeUtil;->ESCAPE_LEVELS:[B

    .line 141
    sget-object v1, Lorg/unbescape/json/JsonEscapeUtil;->ESCAPE_LEVELS:[B

    const/4 v2, 0x3

    invoke-static {v1, v2}, Ljava/util/Arrays;->fill([BB)V

    .line 146
    const/16 v0, 0x80

    .local v0, "c":C
    :goto_77
    const/16 v1, 0xa1

    if-ge v0, v1, :cond_84

    .line 147
    sget-object v1, Lorg/unbescape/json/JsonEscapeUtil;->ESCAPE_LEVELS:[B

    const/4 v2, 0x2

    aput-byte v2, v1, v0

    .line 146
    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_77

    .line 153
    :cond_84
    const/16 v0, 0x41

    :goto_86
    const/16 v1, 0x5a

    if-gt v0, v1, :cond_92

    .line 154
    sget-object v1, Lorg/unbescape/json/JsonEscapeUtil;->ESCAPE_LEVELS:[B

    aput-byte v5, v1, v0

    .line 153
    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_86

    .line 156
    :cond_92
    const/16 v0, 0x61

    :goto_94
    const/16 v1, 0x7a

    if-gt v0, v1, :cond_a0

    .line 157
    sget-object v1, Lorg/unbescape/json/JsonEscapeUtil;->ESCAPE_LEVELS:[B

    aput-byte v5, v1, v0

    .line 156
    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_94

    .line 159
    :cond_a0
    const/16 v0, 0x30

    :goto_a2
    const/16 v1, 0x39

    if-gt v0, v1, :cond_ae

    .line 160
    sget-object v1, Lorg/unbescape/json/JsonEscapeUtil;->ESCAPE_LEVELS:[B

    aput-byte v5, v1, v0

    .line 159
    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_a2

    .line 166
    :cond_ae
    sget-object v1, Lorg/unbescape/json/JsonEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v2, 0x8

    aput-byte v4, v1, v2

    .line 167
    sget-object v1, Lorg/unbescape/json/JsonEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v2, 0x9

    aput-byte v4, v1, v2

    .line 168
    sget-object v1, Lorg/unbescape/json/JsonEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v2, 0xa

    aput-byte v4, v1, v2

    .line 169
    sget-object v1, Lorg/unbescape/json/JsonEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v2, 0xc

    aput-byte v4, v1, v2

    .line 170
    sget-object v1, Lorg/unbescape/json/JsonEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v2, 0xd

    aput-byte v4, v1, v2

    .line 171
    sget-object v1, Lorg/unbescape/json/JsonEscapeUtil;->ESCAPE_LEVELS:[B

    aput-byte v4, v1, v6

    .line 172
    sget-object v1, Lorg/unbescape/json/JsonEscapeUtil;->ESCAPE_LEVELS:[B

    aput-byte v4, v1, v8

    .line 174
    sget-object v1, Lorg/unbescape/json/JsonEscapeUtil;->ESCAPE_LEVELS:[B

    aput-byte v4, v1, v7

    .line 180
    const/4 v0, 0x0

    :goto_d9
    const/16 v1, 0x1f

    if-gt v0, v1, :cond_e5

    .line 181
    sget-object v1, Lorg/unbescape/json/JsonEscapeUtil;->ESCAPE_LEVELS:[B

    aput-byte v4, v1, v0

    .line 180
    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_d9

    .line 183
    :cond_e5
    const/16 v0, 0x7f

    :goto_e7
    const/16 v1, 0x9f

    if-gt v0, v1, :cond_f3

    .line 184
    sget-object v1, Lorg/unbescape/json/JsonEscapeUtil;->ESCAPE_LEVELS:[B

    aput-byte v4, v1, v0

    .line 183
    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_e7

    .line 187
    :cond_f3
    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 192
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 193
    return-void
.end method

.method static escape(Ljava/lang/String;Lorg/unbescape/json/JsonEscapeType;Lorg/unbescape/json/JsonEscapeLevel;)Ljava/lang/String;
    .registers 15
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "escapeType"    # Lorg/unbescape/json/JsonEscapeType;
    .param p2, "escapeLevel"    # Lorg/unbescape/json/JsonEscapeLevel;

    .prologue
    .line 214
    if-nez p0, :cond_4

    .line 215
    const/4 p0, 0x0

    .line 342
    .end local p0    # "text":Ljava/lang/String;
    :cond_3
    :goto_3
    return-object p0

    .line 218
    .restart local p0    # "text":Ljava/lang/String;
    :cond_4
    invoke-virtual {p2}, Lorg/unbescape/json/JsonEscapeLevel;->getEscapeLevel()I

    move-result v3

    .line 219
    .local v3, "level":I
    invoke-virtual {p1}, Lorg/unbescape/json/JsonEscapeType;->getUseSECs()Z

    move-result v9

    .line 221
    .local v9, "useSECs":Z
    const/4 v8, 0x0

    .line 223
    .local v8, "strBuilder":Ljava/lang/StringBuilder;
    const/4 v5, 0x0

    .line 224
    .local v5, "offset":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    .line 226
    .local v4, "max":I
    const/4 v6, 0x0

    .line 228
    .local v6, "readOffset":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_14
    if-ge v2, v4, :cond_bb

    .line 230
    invoke-static {p0, v2}, Ljava/lang/Character;->codePointAt(Ljava/lang/CharSequence;I)I

    move-result v0

    .line 237
    .local v0, "codepoint":I
    const/16 v10, 0x9f

    if-gt v0, v10, :cond_27

    sget-object v10, Lorg/unbescape/json/JsonEscapeUtil;->ESCAPE_LEVELS:[B

    aget-byte v10, v10, v0

    if-ge v3, v10, :cond_27

    .line 228
    :cond_24
    :goto_24
    add-int/lit8 v2, v2, 0x1

    goto :goto_14

    .line 245
    :cond_27
    const/16 v10, 0x2f

    if-ne v0, v10, :cond_3a

    const/4 v10, 0x3

    if-ge v3, v10, :cond_3a

    if-eqz v2, :cond_24

    add-int/lit8 v10, v2, -0x1

    invoke-virtual {p0, v10}, Ljava/lang/String;->charAt(I)C

    move-result v10

    const/16 v11, 0x3c

    if-ne v10, v11, :cond_24

    .line 252
    :cond_3a
    const/16 v10, 0x9f

    if-le v0, v10, :cond_50

    sget-object v10, Lorg/unbescape/json/JsonEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v11, 0xa0

    aget-byte v10, v10, v11

    if-ge v3, v10, :cond_50

    .line 254
    invoke-static {v0}, Ljava/lang/Character;->charCount(I)I

    move-result v10

    const/4 v11, 0x1

    if-le v10, v11, :cond_24

    .line 256
    add-int/lit8 v2, v2, 0x1

    goto :goto_24

    .line 270
    :cond_50
    if-nez v8, :cond_59

    .line 271
    new-instance v8, Ljava/lang/StringBuilder;

    .end local v8    # "strBuilder":Ljava/lang/StringBuilder;
    add-int/lit8 v10, v4, 0x14

    invoke-direct {v8, v10}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 274
    .restart local v8    # "strBuilder":Ljava/lang/StringBuilder;
    :cond_59
    sub-int v10, v2, v6

    if-lez v10, :cond_60

    .line 275
    invoke-virtual {v8, p0, v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 278
    :cond_60
    invoke-static {v0}, Ljava/lang/Character;->charCount(I)I

    move-result v10

    const/4 v11, 0x1

    if-le v10, v11, :cond_69

    .line 280
    add-int/lit8 v2, v2, 0x1

    .line 283
    :cond_69
    add-int/lit8 v6, v2, 0x1

    .line 294
    if-eqz v9, :cond_82

    sget v10, Lorg/unbescape/json/JsonEscapeUtil;->SEC_CHARS_LEN:I

    if-ge v0, v10, :cond_82

    .line 297
    sget-object v10, Lorg/unbescape/json/JsonEscapeUtil;->SEC_CHARS:[C

    aget-char v7, v10, v0

    .line 299
    .local v7, "sec":C
    sget-char v10, Lorg/unbescape/json/JsonEscapeUtil;->SEC_CHARS_NO_SEC:C

    if-eq v7, v10, :cond_82

    .line 301
    const/16 v10, 0x5c

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 302
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_24

    .line 312
    .end local v7    # "sec":C
    :cond_82
    invoke-static {v0}, Ljava/lang/Character;->charCount(I)I

    move-result v10

    const/4 v11, 0x1

    if-le v10, v11, :cond_ad

    .line 313
    invoke-static {v0}, Ljava/lang/Character;->toChars(I)[C

    move-result-object v1

    .line 314
    .local v1, "codepointChars":[C
    sget-object v10, Lorg/unbescape/json/JsonEscapeUtil;->ESCAPE_UHEXA_PREFIX:[C

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    .line 315
    const/4 v10, 0x0

    aget-char v10, v1, v10

    invoke-static {v10}, Lorg/unbescape/json/JsonEscapeUtil;->toUHexa(I)[C

    move-result-object v10

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    .line 316
    sget-object v10, Lorg/unbescape/json/JsonEscapeUtil;->ESCAPE_UHEXA_PREFIX:[C

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    .line 317
    const/4 v10, 0x1

    aget-char v10, v1, v10

    invoke-static {v10}, Lorg/unbescape/json/JsonEscapeUtil;->toUHexa(I)[C

    move-result-object v10

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    goto/16 :goto_24

    .line 321
    .end local v1    # "codepointChars":[C
    :cond_ad
    sget-object v10, Lorg/unbescape/json/JsonEscapeUtil;->ESCAPE_UHEXA_PREFIX:[C

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    .line 322
    invoke-static {v0}, Lorg/unbescape/json/JsonEscapeUtil;->toUHexa(I)[C

    move-result-object v10

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    goto/16 :goto_24

    .line 334
    .end local v0    # "codepoint":I
    :cond_bb
    if-eqz v8, :cond_3

    .line 338
    sub-int v10, v4, v6

    if-lez v10, :cond_c4

    .line 339
    invoke-virtual {v8, p0, v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 342
    :cond_c4
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto/16 :goto_3
.end method

.method static escape([CIILjava/io/Writer;Lorg/unbescape/json/JsonEscapeType;Lorg/unbescape/json/JsonEscapeLevel;)V
    .registers 16
    .param p0, "text"    # [C
    .param p1, "offset"    # I
    .param p2, "len"    # I
    .param p3, "writer"    # Ljava/io/Writer;
    .param p4, "escapeType"    # Lorg/unbescape/json/JsonEscapeType;
    .param p5, "escapeLevel"    # Lorg/unbescape/json/JsonEscapeLevel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 357
    if-eqz p0, :cond_5

    array-length v8, p0

    if-nez v8, :cond_6

    .line 473
    :cond_5
    :goto_5
    return-void

    .line 361
    :cond_6
    invoke-virtual {p5}, Lorg/unbescape/json/JsonEscapeLevel;->getEscapeLevel()I

    move-result v3

    .line 362
    .local v3, "level":I
    invoke-virtual {p4}, Lorg/unbescape/json/JsonEscapeType;->getUseSECs()Z

    move-result v7

    .line 364
    .local v7, "useSECs":Z
    add-int v4, p1, p2

    .line 366
    .local v4, "max":I
    move v5, p1

    .line 368
    .local v5, "readOffset":I
    move v2, p1

    .local v2, "i":I
    :goto_12
    if-ge v2, v4, :cond_af

    .line 370
    invoke-static {p0, v2}, Ljava/lang/Character;->codePointAt([CI)I

    move-result v0

    .line 377
    .local v0, "codepoint":I
    const/16 v8, 0x9f

    if-gt v0, v8, :cond_25

    sget-object v8, Lorg/unbescape/json/JsonEscapeUtil;->ESCAPE_LEVELS:[B

    aget-byte v8, v8, v0

    if-ge v3, v8, :cond_25

    .line 368
    :cond_22
    :goto_22
    add-int/lit8 v2, v2, 0x1

    goto :goto_12

    .line 385
    :cond_25
    const/16 v8, 0x2f

    if-ne v0, v8, :cond_36

    const/4 v8, 0x3

    if-ge v3, v8, :cond_36

    if-eq v2, p1, :cond_22

    add-int/lit8 v8, v2, -0x1

    aget-char v8, p0, v8

    const/16 v9, 0x3c

    if-ne v8, v9, :cond_22

    .line 392
    :cond_36
    const/16 v8, 0x9f

    if-le v0, v8, :cond_4c

    sget-object v8, Lorg/unbescape/json/JsonEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v9, 0xa0

    aget-byte v8, v8, v9

    if-ge v3, v8, :cond_4c

    .line 394
    invoke-static {v0}, Ljava/lang/Character;->charCount(I)I

    move-result v8

    const/4 v9, 0x1

    if-le v8, v9, :cond_22

    .line 396
    add-int/lit8 v2, v2, 0x1

    goto :goto_22

    .line 409
    :cond_4c
    sub-int v8, v2, v5

    if-lez v8, :cond_55

    .line 410
    sub-int v8, v2, v5

    invoke-virtual {p3, p0, v5, v8}, Ljava/io/Writer;->write([CII)V

    .line 413
    :cond_55
    invoke-static {v0}, Ljava/lang/Character;->charCount(I)I

    move-result v8

    const/4 v9, 0x1

    if-le v8, v9, :cond_5e

    .line 415
    add-int/lit8 v2, v2, 0x1

    .line 418
    :cond_5e
    add-int/lit8 v5, v2, 0x1

    .line 429
    if-eqz v7, :cond_77

    sget v8, Lorg/unbescape/json/JsonEscapeUtil;->SEC_CHARS_LEN:I

    if-ge v0, v8, :cond_77

    .line 432
    sget-object v8, Lorg/unbescape/json/JsonEscapeUtil;->SEC_CHARS:[C

    aget-char v6, v8, v0

    .line 434
    .local v6, "sec":C
    sget-char v8, Lorg/unbescape/json/JsonEscapeUtil;->SEC_CHARS_NO_SEC:C

    if-eq v6, v8, :cond_77

    .line 436
    const/16 v8, 0x5c

    invoke-virtual {p3, v8}, Ljava/io/Writer;->write(I)V

    .line 437
    invoke-virtual {p3, v6}, Ljava/io/Writer;->write(I)V

    goto :goto_22

    .line 447
    .end local v6    # "sec":C
    :cond_77
    invoke-static {v0}, Ljava/lang/Character;->charCount(I)I

    move-result v8

    const/4 v9, 0x1

    if-le v8, v9, :cond_a1

    .line 448
    invoke-static {v0}, Ljava/lang/Character;->toChars(I)[C

    move-result-object v1

    .line 449
    .local v1, "codepointChars":[C
    sget-object v8, Lorg/unbescape/json/JsonEscapeUtil;->ESCAPE_UHEXA_PREFIX:[C

    invoke-virtual {p3, v8}, Ljava/io/Writer;->write([C)V

    .line 450
    const/4 v8, 0x0

    aget-char v8, v1, v8

    invoke-static {v8}, Lorg/unbescape/json/JsonEscapeUtil;->toUHexa(I)[C

    move-result-object v8

    invoke-virtual {p3, v8}, Ljava/io/Writer;->write([C)V

    .line 451
    sget-object v8, Lorg/unbescape/json/JsonEscapeUtil;->ESCAPE_UHEXA_PREFIX:[C

    invoke-virtual {p3, v8}, Ljava/io/Writer;->write([C)V

    .line 452
    const/4 v8, 0x1

    aget-char v8, v1, v8

    invoke-static {v8}, Lorg/unbescape/json/JsonEscapeUtil;->toUHexa(I)[C

    move-result-object v8

    invoke-virtual {p3, v8}, Ljava/io/Writer;->write([C)V

    goto :goto_22

    .line 456
    .end local v1    # "codepointChars":[C
    :cond_a1
    sget-object v8, Lorg/unbescape/json/JsonEscapeUtil;->ESCAPE_UHEXA_PREFIX:[C

    invoke-virtual {p3, v8}, Ljava/io/Writer;->write([C)V

    .line 457
    invoke-static {v0}, Lorg/unbescape/json/JsonEscapeUtil;->toUHexa(I)[C

    move-result-object v8

    invoke-virtual {p3, v8}, Ljava/io/Writer;->write([C)V

    goto/16 :goto_22

    .line 469
    .end local v0    # "codepoint":I
    :cond_af
    sub-int v8, v4, v5

    if-lez v8, :cond_5

    .line 470
    sub-int v8, v4, v5

    invoke-virtual {p3, p0, v5, v8}, Ljava/io/Writer;->write([CII)V

    goto/16 :goto_5
.end method

.method static parseIntFromReference(Ljava/lang/String;III)I
    .registers 10
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "start"    # I
    .param p2, "end"    # I
    .param p3, "radix"    # I

    .prologue
    .line 489
    const/4 v4, 0x0

    .line 490
    .local v4, "result":I
    move v1, p1

    .local v1, "i":I
    :goto_2
    if-ge v1, p2, :cond_26

    .line 491
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 492
    .local v0, "c":C
    const/4 v3, -0x1

    .line 493
    .local v3, "n":I
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_a
    sget-object v5, Lorg/unbescape/json/JsonEscapeUtil;->HEXA_CHARS_UPPER:[C

    array-length v5, v5

    if-ge v2, v5, :cond_1c

    .line 494
    sget-object v5, Lorg/unbescape/json/JsonEscapeUtil;->HEXA_CHARS_UPPER:[C

    aget-char v5, v5, v2

    if-eq v0, v5, :cond_1b

    sget-object v5, Lorg/unbescape/json/JsonEscapeUtil;->HEXA_CHARS_LOWER:[C

    aget-char v5, v5, v2

    if-ne v0, v5, :cond_23

    .line 495
    :cond_1b
    move v3, v2

    .line 499
    :cond_1c
    mul-int v5, p3, v4

    add-int v4, v5, v3

    .line 490
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 493
    :cond_23
    add-int/lit8 v2, v2, 0x1

    goto :goto_a

    .line 501
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
    .line 505
    const/4 v4, 0x0

    .line 506
    .local v4, "result":I
    move v1, p1

    .local v1, "i":I
    :goto_2
    if-ge v1, p2, :cond_24

    .line 507
    aget-char v0, p0, v1

    .line 508
    .local v0, "c":C
    const/4 v3, -0x1

    .line 509
    .local v3, "n":I
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_8
    sget-object v5, Lorg/unbescape/json/JsonEscapeUtil;->HEXA_CHARS_UPPER:[C

    array-length v5, v5

    if-ge v2, v5, :cond_1a

    .line 510
    sget-object v5, Lorg/unbescape/json/JsonEscapeUtil;->HEXA_CHARS_UPPER:[C

    aget-char v5, v5, v2

    if-eq v0, v5, :cond_19

    sget-object v5, Lorg/unbescape/json/JsonEscapeUtil;->HEXA_CHARS_LOWER:[C

    aget-char v5, v5, v2

    if-ne v0, v5, :cond_21

    .line 511
    :cond_19
    move v3, v2

    .line 515
    :cond_1a
    mul-int v5, p3, v4

    add-int v4, v5, v3

    .line 506
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 509
    :cond_21
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    .line 517
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
    .line 199
    const/4 v1, 0x4

    new-array v0, v1, [C

    .line 200
    .local v0, "result":[C
    const/4 v1, 0x3

    sget-object v2, Lorg/unbescape/json/JsonEscapeUtil;->HEXA_CHARS_UPPER:[C

    rem-int/lit8 v3, p0, 0x10

    aget-char v2, v2, v3

    aput-char v2, v0, v1

    .line 201
    const/4 v1, 0x2

    sget-object v2, Lorg/unbescape/json/JsonEscapeUtil;->HEXA_CHARS_UPPER:[C

    ushr-int/lit8 v3, p0, 0x4

    rem-int/lit8 v3, v3, 0x10

    aget-char v2, v2, v3

    aput-char v2, v0, v1

    .line 202
    const/4 v1, 0x1

    sget-object v2, Lorg/unbescape/json/JsonEscapeUtil;->HEXA_CHARS_UPPER:[C

    ushr-int/lit8 v3, p0, 0x8

    rem-int/lit8 v3, v3, 0x10

    aget-char v2, v2, v3

    aput-char v2, v0, v1

    .line 203
    const/4 v1, 0x0

    sget-object v2, Lorg/unbescape/json/JsonEscapeUtil;->HEXA_CHARS_UPPER:[C

    ushr-int/lit8 v3, p0, 0xc

    rem-int/lit8 v3, v3, 0x10

    aget-char v2, v2, v3

    aput-char v2, v0, v1

    .line 204
    return-object v0
.end method

.method static unescape(Ljava/lang/String;)Ljava/lang/String;
    .registers 15
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    const/16 v13, 0x5c

    .line 529
    if-nez p0, :cond_6

    .line 530
    const/4 p0, 0x0

    .line 661
    .end local p0    # "text":Ljava/lang/String;
    .local v5, "i":I
    .local v6, "max":I
    .local v7, "offset":I
    .local v8, "readOffset":I
    .local v9, "referenceOffset":I
    .local v10, "strBuilder":Ljava/lang/StringBuilder;
    :cond_5
    :goto_5
    return-object p0

    .line 533
    .end local v5    # "i":I
    .end local v6    # "max":I
    .end local v7    # "offset":I
    .end local v8    # "readOffset":I
    .end local v9    # "referenceOffset":I
    .end local v10    # "strBuilder":Ljava/lang/StringBuilder;
    .restart local p0    # "text":Ljava/lang/String;
    :cond_6
    const/4 v10, 0x0

    .line 535
    .restart local v10    # "strBuilder":Ljava/lang/StringBuilder;
    const/4 v7, 0x0

    .line 536
    .restart local v7    # "offset":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    .line 538
    .restart local v6    # "max":I
    const/4 v8, 0x0

    .line 539
    .restart local v8    # "readOffset":I
    const/4 v9, 0x0

    .line 541
    .restart local v9    # "referenceOffset":I
    const/4 v5, 0x0

    .restart local v5    # "i":I
    :goto_f
    if-ge v5, v6, :cond_bf

    .line 543
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 549
    .local v0, "c":C
    if-ne v0, v13, :cond_1b

    add-int/lit8 v11, v5, 0x1

    if-lt v11, v6, :cond_1e

    .line 541
    :cond_1b
    :goto_1b
    add-int/lit8 v5, v5, 0x1

    goto :goto_f

    .line 553
    :cond_1e
    const/4 v3, -0x1

    .line 555
    .local v3, "codepoint":I
    if-ne v0, v13, :cond_94

    .line 557
    add-int/lit8 v11, v5, 0x1

    invoke-virtual {p0, v11}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 559
    .local v1, "c1":C
    sparse-switch v1, :sswitch_data_ce

    .line 570
    :goto_2a
    const/4 v11, -0x1

    if-ne v3, v11, :cond_94

    .line 572
    const/16 v11, 0x75

    if-ne v1, v11, :cond_b5

    .line 575
    add-int/lit8 v4, v5, 0x2

    .line 576
    .local v4, "f":I
    :goto_33
    add-int/lit8 v11, v5, 0x6

    if-ge v4, v11, :cond_55

    if-ge v4, v6, :cond_55

    .line 577
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 578
    .local v2, "cf":C
    const/16 v11, 0x30

    if-lt v2, v11, :cond_45

    const/16 v11, 0x39

    if-le v2, v11, :cond_87

    :cond_45
    const/16 v11, 0x41

    if-lt v2, v11, :cond_4d

    const/16 v11, 0x46

    if-le v2, v11, :cond_87

    :cond_4d
    const/16 v11, 0x61

    if-lt v2, v11, :cond_55

    const/16 v11, 0x66

    if-le v2, v11, :cond_87

    .line 584
    .end local v2    # "cf":C
    :cond_55
    add-int/lit8 v11, v5, 0x2

    sub-int v11, v4, v11

    const/4 v12, 0x4

    if-ge v11, v12, :cond_8a

    .line 587
    add-int/lit8 v5, v5, 0x1

    .line 588
    goto :goto_1b

    .line 560
    .end local v4    # "f":I
    :sswitch_5f
    const/16 v3, 0x8

    add-int/lit8 v9, v5, 0x1

    goto :goto_2a

    .line 561
    :sswitch_64
    const/16 v3, 0x9

    add-int/lit8 v9, v5, 0x1

    goto :goto_2a

    .line 562
    :sswitch_69
    const/16 v3, 0xa

    add-int/lit8 v9, v5, 0x1

    goto :goto_2a

    .line 563
    :sswitch_6e
    const/16 v3, 0xc

    add-int/lit8 v9, v5, 0x1

    goto :goto_2a

    .line 564
    :sswitch_73
    const/16 v3, 0xd

    add-int/lit8 v9, v5, 0x1

    goto :goto_2a

    .line 565
    :sswitch_78
    const/16 v3, 0x22

    add-int/lit8 v9, v5, 0x1

    goto :goto_2a

    .line 566
    :sswitch_7d
    const/16 v3, 0x5c

    add-int/lit8 v9, v5, 0x1

    goto :goto_2a

    .line 567
    :sswitch_82
    const/16 v3, 0x2f

    add-int/lit8 v9, v5, 0x1

    goto :goto_2a

    .line 581
    .restart local v2    # "cf":C
    .restart local v4    # "f":I
    :cond_87
    add-int/lit8 v4, v4, 0x1

    .line 582
    goto :goto_33

    .line 591
    .end local v2    # "cf":C
    :cond_8a
    add-int/lit8 v11, v5, 0x2

    const/16 v12, 0x10

    invoke-static {p0, v11, v4, v12}, Lorg/unbescape/json/JsonEscapeUtil;->parseIntFromReference(Ljava/lang/String;III)I

    move-result v3

    .line 594
    add-int/lit8 v9, v4, -0x1

    .line 618
    .end local v1    # "c1":C
    .end local v4    # "f":I
    :cond_94
    if-nez v10, :cond_9d

    .line 619
    new-instance v10, Ljava/lang/StringBuilder;

    .end local v10    # "strBuilder":Ljava/lang/StringBuilder;
    add-int/lit8 v11, v6, 0x5

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 622
    .restart local v10    # "strBuilder":Ljava/lang/StringBuilder;
    :cond_9d
    sub-int v11, v5, v8

    if-lez v11, :cond_a4

    .line 623
    invoke-virtual {v10, p0, v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 626
    :cond_a4
    move v5, v9

    .line 627
    add-int/lit8 v8, v5, 0x1

    .line 637
    const v11, 0xffff

    if-le v3, v11, :cond_b9

    .line 638
    invoke-static {v3}, Ljava/lang/Character;->toChars(I)[C

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    goto/16 :goto_1b

    .line 602
    .restart local v1    # "c1":C
    :cond_b5
    add-int/lit8 v5, v5, 0x1

    .line 603
    goto/16 :goto_1b

    .line 640
    .end local v1    # "c1":C
    :cond_b9
    int-to-char v11, v3

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_1b

    .line 653
    .end local v0    # "c":C
    .end local v3    # "codepoint":I
    :cond_bf
    if-eqz v10, :cond_5

    .line 657
    sub-int v11, v6, v8

    if-lez v11, :cond_c8

    .line 658
    invoke-virtual {v10, p0, v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 661
    :cond_c8
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto/16 :goto_5

    .line 559
    :sswitch_data_ce
    .sparse-switch
        0x22 -> :sswitch_78
        0x2f -> :sswitch_82
        0x5c -> :sswitch_7d
        0x62 -> :sswitch_5f
        0x66 -> :sswitch_6e
        0x6e -> :sswitch_69
        0x72 -> :sswitch_73
        0x74 -> :sswitch_64
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
    const/16 v11, 0x5c

    .line 676
    if-nez p0, :cond_5

    .line 795
    :cond_4
    :goto_4
    return-void

    .line 680
    :cond_5
    add-int v6, p1, p2

    .line 682
    .local v6, "max":I
    move v7, p1

    .line 683
    .local v7, "readOffset":I
    move v8, p1

    .line 685
    .local v8, "referenceOffset":I
    move v5, p1

    .local v5, "i":I
    :goto_a
    if-ge v5, v6, :cond_ad

    .line 687
    aget-char v0, p0, v5

    .line 693
    .local v0, "c":C
    if-ne v0, v11, :cond_14

    add-int/lit8 v9, v5, 0x1

    if-lt v9, v6, :cond_17

    .line 685
    :cond_14
    :goto_14
    add-int/lit8 v5, v5, 0x1

    goto :goto_a

    .line 697
    :cond_17
    const/4 v3, -0x1

    .line 699
    .local v3, "codepoint":I
    if-ne v0, v11, :cond_89

    .line 701
    add-int/lit8 v9, v5, 0x1

    aget-char v1, p0, v9

    .line 703
    .local v1, "c1":C
    sparse-switch v1, :sswitch_data_b8

    .line 714
    :goto_21
    const/4 v9, -0x1

    if-ne v3, v9, :cond_89

    .line 716
    const/16 v9, 0x75

    if-ne v1, v9, :cond_a3

    .line 719
    add-int/lit8 v4, v5, 0x2

    .line 720
    .local v4, "f":I
    :goto_2a
    add-int/lit8 v9, v5, 0x6

    if-ge v4, v9, :cond_4a

    if-ge v4, v6, :cond_4a

    .line 721
    aget-char v2, p0, v4

    .line 722
    .local v2, "cf":C
    const/16 v9, 0x30

    if-lt v2, v9, :cond_3a

    const/16 v9, 0x39

    if-le v2, v9, :cond_7c

    :cond_3a
    const/16 v9, 0x41

    if-lt v2, v9, :cond_42

    const/16 v9, 0x46

    if-le v2, v9, :cond_7c

    :cond_42
    const/16 v9, 0x61

    if-lt v2, v9, :cond_4a

    const/16 v9, 0x66

    if-le v2, v9, :cond_7c

    .line 728
    .end local v2    # "cf":C
    :cond_4a
    add-int/lit8 v9, v5, 0x2

    sub-int v9, v4, v9

    const/4 v10, 0x4

    if-ge v9, v10, :cond_7f

    .line 731
    add-int/lit8 v5, v5, 0x1

    .line 732
    goto :goto_14

    .line 704
    .end local v4    # "f":I
    :sswitch_54
    const/16 v3, 0x8

    add-int/lit8 v8, v5, 0x1

    goto :goto_21

    .line 705
    :sswitch_59
    const/16 v3, 0x9

    add-int/lit8 v8, v5, 0x1

    goto :goto_21

    .line 706
    :sswitch_5e
    const/16 v3, 0xa

    add-int/lit8 v8, v5, 0x1

    goto :goto_21

    .line 707
    :sswitch_63
    const/16 v3, 0xc

    add-int/lit8 v8, v5, 0x1

    goto :goto_21

    .line 708
    :sswitch_68
    const/16 v3, 0xd

    add-int/lit8 v8, v5, 0x1

    goto :goto_21

    .line 709
    :sswitch_6d
    const/16 v3, 0x22

    add-int/lit8 v8, v5, 0x1

    goto :goto_21

    .line 710
    :sswitch_72
    const/16 v3, 0x5c

    add-int/lit8 v8, v5, 0x1

    goto :goto_21

    .line 711
    :sswitch_77
    const/16 v3, 0x2f

    add-int/lit8 v8, v5, 0x1

    goto :goto_21

    .line 725
    .restart local v2    # "cf":C
    .restart local v4    # "f":I
    :cond_7c
    add-int/lit8 v4, v4, 0x1

    .line 726
    goto :goto_2a

    .line 735
    .end local v2    # "cf":C
    :cond_7f
    add-int/lit8 v9, v5, 0x2

    const/16 v10, 0x10

    invoke-static {p0, v9, v4, v10}, Lorg/unbescape/json/JsonEscapeUtil;->parseIntFromReference([CIII)I

    move-result v3

    .line 738
    add-int/lit8 v8, v4, -0x1

    .line 761
    .end local v1    # "c1":C
    .end local v4    # "f":I
    :cond_89
    sub-int v9, v5, v7

    if-lez v9, :cond_92

    .line 762
    sub-int v9, v5, v7

    invoke-virtual {p3, p0, v7, v9}, Ljava/io/Writer;->write([CII)V

    .line 765
    :cond_92
    move v5, v8

    .line 766
    add-int/lit8 v7, v5, 0x1

    .line 776
    const v9, 0xffff

    if-le v3, v9, :cond_a7

    .line 777
    invoke-static {v3}, Ljava/lang/Character;->toChars(I)[C

    move-result-object v9

    invoke-virtual {p3, v9}, Ljava/io/Writer;->write([C)V

    goto/16 :goto_14

    .line 746
    .restart local v1    # "c1":C
    :cond_a3
    add-int/lit8 v5, v5, 0x1

    .line 747
    goto/16 :goto_14

    .line 779
    .end local v1    # "c1":C
    :cond_a7
    int-to-char v9, v3

    invoke-virtual {p3, v9}, Ljava/io/Writer;->write(I)V

    goto/16 :goto_14

    .line 791
    .end local v0    # "c":C
    .end local v3    # "codepoint":I
    :cond_ad
    sub-int v9, v6, v7

    if-lez v9, :cond_4

    .line 792
    sub-int v9, v6, v7

    invoke-virtual {p3, p0, v7, v9}, Ljava/io/Writer;->write([CII)V

    goto/16 :goto_4

    .line 703
    :sswitch_data_b8
    .sparse-switch
        0x22 -> :sswitch_6d
        0x2f -> :sswitch_77
        0x5c -> :sswitch_72
        0x62 -> :sswitch_54
        0x66 -> :sswitch_63
        0x6e -> :sswitch_5e
        0x72 -> :sswitch_68
        0x74 -> :sswitch_59
    .end sparse-switch
.end method
