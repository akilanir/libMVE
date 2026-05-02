.class final Lorg/unbescape/properties/PropertiesValueEscapeUtil;
.super Ljava/lang/Object;
.source "PropertiesValueEscapeUtil.java"


# static fields
.field private static final ESCAPE_LEVELS:[B

.field private static final ESCAPE_LEVELS_LEN:C = '\u00a1'

.field private static final ESCAPE_PREFIX:C = '\\'

.field private static final ESCAPE_UHEXA_PREFIX:[C

.field private static HEXA_CHARS_UPPER:[C

.field private static SEC_CHARS:[C

.field private static SEC_CHARS_LEN:I

.field private static SEC_CHARS_NO_SEC:C


# direct methods
.method static constructor <clinit>()V
    .registers 9

    .prologue
    const/16 v8, 0xa

    const/16 v7, 0x9

    const/16 v6, 0x5c

    const/4 v5, 0x4

    const/4 v4, 0x1

    .line 88
    const-string v1, "\\u"

    invoke-virtual {v1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    sput-object v1, Lorg/unbescape/properties/PropertiesValueEscapeUtil;->ESCAPE_UHEXA_PREFIX:[C

    .line 93
    const-string v1, "0123456789ABCDEF"

    invoke-virtual {v1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    sput-object v1, Lorg/unbescape/properties/PropertiesValueEscapeUtil;->HEXA_CHARS_UPPER:[C

    .line 99
    const/16 v1, 0x5d

    sput v1, Lorg/unbescape/properties/PropertiesValueEscapeUtil;->SEC_CHARS_LEN:I

    .line 100
    const/16 v1, 0x2a

    sput-char v1, Lorg/unbescape/properties/PropertiesValueEscapeUtil;->SEC_CHARS_NO_SEC:C

    .line 118
    sget v1, Lorg/unbescape/properties/PropertiesValueEscapeUtil;->SEC_CHARS_LEN:I

    new-array v1, v1, [C

    sput-object v1, Lorg/unbescape/properties/PropertiesValueEscapeUtil;->SEC_CHARS:[C

    .line 119
    sget-object v1, Lorg/unbescape/properties/PropertiesValueEscapeUtil;->SEC_CHARS:[C

    sget-char v2, Lorg/unbescape/properties/PropertiesValueEscapeUtil;->SEC_CHARS_NO_SEC:C

    invoke-static {v1, v2}, Ljava/util/Arrays;->fill([CC)V

    .line 120
    sget-object v1, Lorg/unbescape/properties/PropertiesValueEscapeUtil;->SEC_CHARS:[C

    const/16 v2, 0x74

    aput-char v2, v1, v7

    .line 121
    sget-object v1, Lorg/unbescape/properties/PropertiesValueEscapeUtil;->SEC_CHARS:[C

    const/16 v2, 0x6e

    aput-char v2, v1, v8

    .line 122
    sget-object v1, Lorg/unbescape/properties/PropertiesValueEscapeUtil;->SEC_CHARS:[C

    const/16 v2, 0xc

    const/16 v3, 0x66

    aput-char v3, v1, v2

    .line 123
    sget-object v1, Lorg/unbescape/properties/PropertiesValueEscapeUtil;->SEC_CHARS:[C

    const/16 v2, 0xd

    const/16 v3, 0x72

    aput-char v3, v1, v2

    .line 124
    sget-object v1, Lorg/unbescape/properties/PropertiesValueEscapeUtil;->SEC_CHARS:[C

    aput-char v6, v1, v6

    .line 138
    const/16 v1, 0xa1

    new-array v1, v1, [B

    sput-object v1, Lorg/unbescape/properties/PropertiesValueEscapeUtil;->ESCAPE_LEVELS:[B

    .line 143
    sget-object v1, Lorg/unbescape/properties/PropertiesValueEscapeUtil;->ESCAPE_LEVELS:[B

    const/4 v2, 0x3

    invoke-static {v1, v2}, Ljava/util/Arrays;->fill([BB)V

    .line 148
    const/16 v0, 0x80

    .local v0, "c":C
    :goto_5b
    const/16 v1, 0xa1

    if-ge v0, v1, :cond_68

    .line 149
    sget-object v1, Lorg/unbescape/properties/PropertiesValueEscapeUtil;->ESCAPE_LEVELS:[B

    const/4 v2, 0x2

    aput-byte v2, v1, v0

    .line 148
    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_5b

    .line 155
    :cond_68
    const/16 v0, 0x41

    :goto_6a
    const/16 v1, 0x5a

    if-gt v0, v1, :cond_76

    .line 156
    sget-object v1, Lorg/unbescape/properties/PropertiesValueEscapeUtil;->ESCAPE_LEVELS:[B

    aput-byte v5, v1, v0

    .line 155
    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_6a

    .line 158
    :cond_76
    const/16 v0, 0x61

    :goto_78
    const/16 v1, 0x7a

    if-gt v0, v1, :cond_84

    .line 159
    sget-object v1, Lorg/unbescape/properties/PropertiesValueEscapeUtil;->ESCAPE_LEVELS:[B

    aput-byte v5, v1, v0

    .line 158
    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_78

    .line 161
    :cond_84
    const/16 v0, 0x30

    :goto_86
    const/16 v1, 0x39

    if-gt v0, v1, :cond_92

    .line 162
    sget-object v1, Lorg/unbescape/properties/PropertiesValueEscapeUtil;->ESCAPE_LEVELS:[B

    aput-byte v5, v1, v0

    .line 161
    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_86

    .line 168
    :cond_92
    sget-object v1, Lorg/unbescape/properties/PropertiesValueEscapeUtil;->ESCAPE_LEVELS:[B

    aput-byte v4, v1, v7

    .line 169
    sget-object v1, Lorg/unbescape/properties/PropertiesValueEscapeUtil;->ESCAPE_LEVELS:[B

    aput-byte v4, v1, v8

    .line 170
    sget-object v1, Lorg/unbescape/properties/PropertiesValueEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v2, 0xc

    aput-byte v4, v1, v2

    .line 171
    sget-object v1, Lorg/unbescape/properties/PropertiesValueEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v2, 0xd

    aput-byte v4, v1, v2

    .line 172
    sget-object v1, Lorg/unbescape/properties/PropertiesValueEscapeUtil;->ESCAPE_LEVELS:[B

    aput-byte v4, v1, v6

    .line 178
    const/4 v0, 0x0

    :goto_ab
    const/16 v1, 0x1f

    if-gt v0, v1, :cond_b7

    .line 179
    sget-object v1, Lorg/unbescape/properties/PropertiesValueEscapeUtil;->ESCAPE_LEVELS:[B

    aput-byte v4, v1, v0

    .line 178
    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_ab

    .line 181
    :cond_b7
    const/16 v0, 0x7f

    :goto_b9
    const/16 v1, 0x9f

    if-gt v0, v1, :cond_c5

    .line 182
    sget-object v1, Lorg/unbescape/properties/PropertiesValueEscapeUtil;->ESCAPE_LEVELS:[B

    aput-byte v4, v1, v0

    .line 181
    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_b9

    .line 185
    :cond_c5
    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 190
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 191
    return-void
.end method

.method static escape(Ljava/lang/String;Lorg/unbescape/properties/PropertiesValueEscapeLevel;)Ljava/lang/String;
    .registers 15
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "escapeLevel"    # Lorg/unbescape/properties/PropertiesValueEscapeLevel;

    .prologue
    const/16 v12, 0x9f

    const/4 v11, 0x1

    .line 212
    if-nez p0, :cond_7

    .line 213
    const/4 p0, 0x0

    .line 331
    .end local p0    # "text":Ljava/lang/String;
    :cond_6
    :goto_6
    return-object p0

    .line 216
    .restart local p0    # "text":Ljava/lang/String;
    :cond_7
    invoke-virtual {p1}, Lorg/unbescape/properties/PropertiesValueEscapeLevel;->getEscapeLevel()I

    move-result v3

    .line 218
    .local v3, "level":I
    const/4 v8, 0x0

    .line 220
    .local v8, "strBuilder":Ljava/lang/StringBuilder;
    const/4 v5, 0x0

    .line 221
    .local v5, "offset":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    .line 223
    .local v4, "max":I
    const/4 v6, 0x0

    .line 225
    .local v6, "readOffset":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_13
    if-ge v2, v4, :cond_9b

    .line 227
    invoke-static {p0, v2}, Ljava/lang/Character;->codePointAt(Ljava/lang/CharSequence;I)I

    move-result v0

    .line 234
    .local v0, "codepoint":I
    if-gt v0, v12, :cond_24

    sget-object v9, Lorg/unbescape/properties/PropertiesValueEscapeUtil;->ESCAPE_LEVELS:[B

    aget-byte v9, v9, v0

    if-ge v3, v9, :cond_24

    .line 225
    :cond_21
    :goto_21
    add-int/lit8 v2, v2, 0x1

    goto :goto_13

    .line 241
    :cond_24
    if-le v0, v12, :cond_37

    sget-object v9, Lorg/unbescape/properties/PropertiesValueEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v10, 0xa0

    aget-byte v9, v9, v10

    if-ge v3, v9, :cond_37

    .line 243
    invoke-static {v0}, Ljava/lang/Character;->charCount(I)I

    move-result v9

    if-le v9, v11, :cond_21

    .line 245
    add-int/lit8 v2, v2, 0x1

    goto :goto_21

    .line 259
    :cond_37
    if-nez v8, :cond_40

    .line 260
    new-instance v8, Ljava/lang/StringBuilder;

    .end local v8    # "strBuilder":Ljava/lang/StringBuilder;
    add-int/lit8 v9, v4, 0x14

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 263
    .restart local v8    # "strBuilder":Ljava/lang/StringBuilder;
    :cond_40
    sub-int v9, v2, v6

    if-lez v9, :cond_47

    .line 264
    invoke-virtual {v8, p0, v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 267
    :cond_47
    invoke-static {v0}, Ljava/lang/Character;->charCount(I)I

    move-result v9

    if-le v9, v11, :cond_4f

    .line 269
    add-int/lit8 v2, v2, 0x1

    .line 272
    :cond_4f
    add-int/lit8 v6, v2, 0x1

    .line 283
    sget v9, Lorg/unbescape/properties/PropertiesValueEscapeUtil;->SEC_CHARS_LEN:I

    if-ge v0, v9, :cond_66

    .line 286
    sget-object v9, Lorg/unbescape/properties/PropertiesValueEscapeUtil;->SEC_CHARS:[C

    aget-char v7, v9, v0

    .line 288
    .local v7, "sec":C
    sget-char v9, Lorg/unbescape/properties/PropertiesValueEscapeUtil;->SEC_CHARS_NO_SEC:C

    if-eq v7, v9, :cond_66

    .line 290
    const/16 v9, 0x5c

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 291
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_21

    .line 301
    .end local v7    # "sec":C
    :cond_66
    invoke-static {v0}, Ljava/lang/Character;->charCount(I)I

    move-result v9

    if-le v9, v11, :cond_8e

    .line 302
    invoke-static {v0}, Ljava/lang/Character;->toChars(I)[C

    move-result-object v1

    .line 303
    .local v1, "codepointChars":[C
    sget-object v9, Lorg/unbescape/properties/PropertiesValueEscapeUtil;->ESCAPE_UHEXA_PREFIX:[C

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    .line 304
    const/4 v9, 0x0

    aget-char v9, v1, v9

    invoke-static {v9}, Lorg/unbescape/properties/PropertiesValueEscapeUtil;->toUHexa(I)[C

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    .line 305
    sget-object v9, Lorg/unbescape/properties/PropertiesValueEscapeUtil;->ESCAPE_UHEXA_PREFIX:[C

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    .line 306
    aget-char v9, v1, v11

    invoke-static {v9}, Lorg/unbescape/properties/PropertiesValueEscapeUtil;->toUHexa(I)[C

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    goto :goto_21

    .line 310
    .end local v1    # "codepointChars":[C
    :cond_8e
    sget-object v9, Lorg/unbescape/properties/PropertiesValueEscapeUtil;->ESCAPE_UHEXA_PREFIX:[C

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    .line 311
    invoke-static {v0}, Lorg/unbescape/properties/PropertiesValueEscapeUtil;->toUHexa(I)[C

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    goto :goto_21

    .line 323
    .end local v0    # "codepoint":I
    :cond_9b
    if-eqz v8, :cond_6

    .line 327
    sub-int v9, v4, v6

    if-lez v9, :cond_a4

    .line 328
    invoke-virtual {v8, p0, v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 331
    :cond_a4
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto/16 :goto_6
.end method

.method static escape([CIILjava/io/Writer;Lorg/unbescape/properties/PropertiesValueEscapeLevel;)V
    .registers 16
    .param p0, "text"    # [C
    .param p1, "offset"    # I
    .param p2, "len"    # I
    .param p3, "writer"    # Ljava/io/Writer;
    .param p4, "escapeLevel"    # Lorg/unbescape/properties/PropertiesValueEscapeLevel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v10, 0x9f

    const/4 v9, 0x1

    .line 346
    if-eqz p0, :cond_8

    array-length v7, p0

    if-nez v7, :cond_9

    .line 452
    :cond_8
    :goto_8
    return-void

    .line 350
    :cond_9
    invoke-virtual {p4}, Lorg/unbescape/properties/PropertiesValueEscapeLevel;->getEscapeLevel()I

    move-result v3

    .line 352
    .local v3, "level":I
    add-int v4, p1, p2

    .line 354
    .local v4, "max":I
    move v5, p1

    .line 356
    .local v5, "readOffset":I
    move v2, p1

    .local v2, "i":I
    :goto_11
    if-ge v2, v4, :cond_92

    .line 358
    invoke-static {p0, v2}, Ljava/lang/Character;->codePointAt([CI)I

    move-result v0

    .line 365
    .local v0, "codepoint":I
    if-gt v0, v10, :cond_22

    sget-object v7, Lorg/unbescape/properties/PropertiesValueEscapeUtil;->ESCAPE_LEVELS:[B

    aget-byte v7, v7, v0

    if-ge v3, v7, :cond_22

    .line 356
    :cond_1f
    :goto_1f
    add-int/lit8 v2, v2, 0x1

    goto :goto_11

    .line 372
    :cond_22
    if-le v0, v10, :cond_35

    sget-object v7, Lorg/unbescape/properties/PropertiesValueEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v8, 0xa0

    aget-byte v7, v7, v8

    if-ge v3, v7, :cond_35

    .line 374
    invoke-static {v0}, Ljava/lang/Character;->charCount(I)I

    move-result v7

    if-le v7, v9, :cond_1f

    .line 376
    add-int/lit8 v2, v2, 0x1

    goto :goto_1f

    .line 389
    :cond_35
    sub-int v7, v2, v5

    if-lez v7, :cond_3e

    .line 390
    sub-int v7, v2, v5

    invoke-virtual {p3, p0, v5, v7}, Ljava/io/Writer;->write([CII)V

    .line 393
    :cond_3e
    invoke-static {v0}, Ljava/lang/Character;->charCount(I)I

    move-result v7

    if-le v7, v9, :cond_46

    .line 395
    add-int/lit8 v2, v2, 0x1

    .line 398
    :cond_46
    add-int/lit8 v5, v2, 0x1

    .line 409
    sget v7, Lorg/unbescape/properties/PropertiesValueEscapeUtil;->SEC_CHARS_LEN:I

    if-ge v0, v7, :cond_5d

    .line 412
    sget-object v7, Lorg/unbescape/properties/PropertiesValueEscapeUtil;->SEC_CHARS:[C

    aget-char v6, v7, v0

    .line 414
    .local v6, "sec":C
    sget-char v7, Lorg/unbescape/properties/PropertiesValueEscapeUtil;->SEC_CHARS_NO_SEC:C

    if-eq v6, v7, :cond_5d

    .line 416
    const/16 v7, 0x5c

    invoke-virtual {p3, v7}, Ljava/io/Writer;->write(I)V

    .line 417
    invoke-virtual {p3, v6}, Ljava/io/Writer;->write(I)V

    goto :goto_1f

    .line 427
    .end local v6    # "sec":C
    :cond_5d
    invoke-static {v0}, Ljava/lang/Character;->charCount(I)I

    move-result v7

    if-le v7, v9, :cond_85

    .line 428
    invoke-static {v0}, Ljava/lang/Character;->toChars(I)[C

    move-result-object v1

    .line 429
    .local v1, "codepointChars":[C
    sget-object v7, Lorg/unbescape/properties/PropertiesValueEscapeUtil;->ESCAPE_UHEXA_PREFIX:[C

    invoke-virtual {p3, v7}, Ljava/io/Writer;->write([C)V

    .line 430
    const/4 v7, 0x0

    aget-char v7, v1, v7

    invoke-static {v7}, Lorg/unbescape/properties/PropertiesValueEscapeUtil;->toUHexa(I)[C

    move-result-object v7

    invoke-virtual {p3, v7}, Ljava/io/Writer;->write([C)V

    .line 431
    sget-object v7, Lorg/unbescape/properties/PropertiesValueEscapeUtil;->ESCAPE_UHEXA_PREFIX:[C

    invoke-virtual {p3, v7}, Ljava/io/Writer;->write([C)V

    .line 432
    aget-char v7, v1, v9

    invoke-static {v7}, Lorg/unbescape/properties/PropertiesValueEscapeUtil;->toUHexa(I)[C

    move-result-object v7

    invoke-virtual {p3, v7}, Ljava/io/Writer;->write([C)V

    goto :goto_1f

    .line 436
    .end local v1    # "codepointChars":[C
    :cond_85
    sget-object v7, Lorg/unbescape/properties/PropertiesValueEscapeUtil;->ESCAPE_UHEXA_PREFIX:[C

    invoke-virtual {p3, v7}, Ljava/io/Writer;->write([C)V

    .line 437
    invoke-static {v0}, Lorg/unbescape/properties/PropertiesValueEscapeUtil;->toUHexa(I)[C

    move-result-object v7

    invoke-virtual {p3, v7}, Ljava/io/Writer;->write([C)V

    goto :goto_1f

    .line 448
    .end local v0    # "codepoint":I
    :cond_92
    sub-int v7, v4, v5

    if-lez v7, :cond_8

    .line 449
    sub-int v7, v4, v5

    invoke-virtual {p3, p0, v5, v7}, Ljava/io/Writer;->write([CII)V

    goto/16 :goto_8
.end method

.method static toUHexa(I)[C
    .registers 5
    .param p0, "codepoint"    # I

    .prologue
    .line 197
    const/4 v1, 0x4

    new-array v0, v1, [C

    .line 198
    .local v0, "result":[C
    const/4 v1, 0x3

    sget-object v2, Lorg/unbescape/properties/PropertiesValueEscapeUtil;->HEXA_CHARS_UPPER:[C

    rem-int/lit8 v3, p0, 0x10

    aget-char v2, v2, v3

    aput-char v2, v0, v1

    .line 199
    const/4 v1, 0x2

    sget-object v2, Lorg/unbescape/properties/PropertiesValueEscapeUtil;->HEXA_CHARS_UPPER:[C

    ushr-int/lit8 v3, p0, 0x4

    rem-int/lit8 v3, v3, 0x10

    aget-char v2, v2, v3

    aput-char v2, v0, v1

    .line 200
    const/4 v1, 0x1

    sget-object v2, Lorg/unbescape/properties/PropertiesValueEscapeUtil;->HEXA_CHARS_UPPER:[C

    ushr-int/lit8 v3, p0, 0x8

    rem-int/lit8 v3, v3, 0x10

    aget-char v2, v2, v3

    aput-char v2, v0, v1

    .line 201
    const/4 v1, 0x0

    sget-object v2, Lorg/unbescape/properties/PropertiesValueEscapeUtil;->HEXA_CHARS_UPPER:[C

    ushr-int/lit8 v3, p0, 0xc

    rem-int/lit8 v3, v3, 0x10

    aget-char v2, v2, v3

    aput-char v2, v0, v1

    .line 202
    return-object v0
.end method
