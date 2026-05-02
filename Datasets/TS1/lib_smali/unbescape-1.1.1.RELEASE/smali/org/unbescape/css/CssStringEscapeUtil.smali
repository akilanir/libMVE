.class final Lorg/unbescape/css/CssStringEscapeUtil;
.super Ljava/lang/Object;
.source "CssStringEscapeUtil.java"


# static fields
.field private static BACKSLASH_CHARS:[C = null

.field private static BACKSLASH_CHARS_LEN:I = 0x0

.field private static BACKSLASH_CHARS_NO_ESCAPE:C = '\u0000'

.field private static final ESCAPE_LEVELS:[B

.field private static final ESCAPE_LEVELS_LEN:C = '\u00a1'

.field private static final ESCAPE_PREFIX:C = '\\'

.field private static HEXA_CHARS_UPPER:[C


# direct methods
.method static constructor <clinit>()V
    .registers 9

    .prologue
    const/16 v8, 0x5c

    const/16 v7, 0x27

    const/16 v6, 0x22

    const/4 v5, 0x4

    const/4 v4, 0x1

    .line 79
    const-string v1, "0123456789ABCDEF"

    invoke-virtual {v1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    sput-object v1, Lorg/unbescape/css/CssStringEscapeUtil;->HEXA_CHARS_UPPER:[C

    .line 85
    const/16 v1, 0x7f

    sput v1, Lorg/unbescape/css/CssStringEscapeUtil;->BACKSLASH_CHARS_LEN:I

    .line 86
    const/4 v1, 0x0

    sput-char v1, Lorg/unbescape/css/CssStringEscapeUtil;->BACKSLASH_CHARS_NO_ESCAPE:C

    .line 104
    sget v1, Lorg/unbescape/css/CssStringEscapeUtil;->BACKSLASH_CHARS_LEN:I

    new-array v1, v1, [C

    sput-object v1, Lorg/unbescape/css/CssStringEscapeUtil;->BACKSLASH_CHARS:[C

    .line 105
    sget-object v1, Lorg/unbescape/css/CssStringEscapeUtil;->BACKSLASH_CHARS:[C

    sget-char v2, Lorg/unbescape/css/CssStringEscapeUtil;->BACKSLASH_CHARS_NO_ESCAPE:C

    invoke-static {v1, v2}, Ljava/util/Arrays;->fill([CC)V

    .line 106
    sget-object v1, Lorg/unbescape/css/CssStringEscapeUtil;->BACKSLASH_CHARS:[C

    const/16 v2, 0x20

    const/16 v3, 0x20

    aput-char v3, v1, v2

    .line 107
    sget-object v1, Lorg/unbescape/css/CssStringEscapeUtil;->BACKSLASH_CHARS:[C

    const/16 v2, 0x21

    const/16 v3, 0x21

    aput-char v3, v1, v2

    .line 108
    sget-object v1, Lorg/unbescape/css/CssStringEscapeUtil;->BACKSLASH_CHARS:[C

    aput-char v6, v1, v6

    .line 109
    sget-object v1, Lorg/unbescape/css/CssStringEscapeUtil;->BACKSLASH_CHARS:[C

    const/16 v2, 0x23

    const/16 v3, 0x23

    aput-char v3, v1, v2

    .line 110
    sget-object v1, Lorg/unbescape/css/CssStringEscapeUtil;->BACKSLASH_CHARS:[C

    const/16 v2, 0x24

    const/16 v3, 0x24

    aput-char v3, v1, v2

    .line 111
    sget-object v1, Lorg/unbescape/css/CssStringEscapeUtil;->BACKSLASH_CHARS:[C

    const/16 v2, 0x25

    const/16 v3, 0x25

    aput-char v3, v1, v2

    .line 112
    sget-object v1, Lorg/unbescape/css/CssStringEscapeUtil;->BACKSLASH_CHARS:[C

    const/16 v2, 0x26

    const/16 v3, 0x26

    aput-char v3, v1, v2

    .line 113
    sget-object v1, Lorg/unbescape/css/CssStringEscapeUtil;->BACKSLASH_CHARS:[C

    aput-char v7, v1, v7

    .line 114
    sget-object v1, Lorg/unbescape/css/CssStringEscapeUtil;->BACKSLASH_CHARS:[C

    const/16 v2, 0x28

    const/16 v3, 0x28

    aput-char v3, v1, v2

    .line 115
    sget-object v1, Lorg/unbescape/css/CssStringEscapeUtil;->BACKSLASH_CHARS:[C

    const/16 v2, 0x29

    const/16 v3, 0x29

    aput-char v3, v1, v2

    .line 116
    sget-object v1, Lorg/unbescape/css/CssStringEscapeUtil;->BACKSLASH_CHARS:[C

    const/16 v2, 0x2a

    const/16 v3, 0x2a

    aput-char v3, v1, v2

    .line 117
    sget-object v1, Lorg/unbescape/css/CssStringEscapeUtil;->BACKSLASH_CHARS:[C

    const/16 v2, 0x2b

    const/16 v3, 0x2b

    aput-char v3, v1, v2

    .line 118
    sget-object v1, Lorg/unbescape/css/CssStringEscapeUtil;->BACKSLASH_CHARS:[C

    const/16 v2, 0x2c

    const/16 v3, 0x2c

    aput-char v3, v1, v2

    .line 119
    sget-object v1, Lorg/unbescape/css/CssStringEscapeUtil;->BACKSLASH_CHARS:[C

    const/16 v2, 0x2d

    const/16 v3, 0x2d

    aput-char v3, v1, v2

    .line 120
    sget-object v1, Lorg/unbescape/css/CssStringEscapeUtil;->BACKSLASH_CHARS:[C

    const/16 v2, 0x2e

    const/16 v3, 0x2e

    aput-char v3, v1, v2

    .line 121
    sget-object v1, Lorg/unbescape/css/CssStringEscapeUtil;->BACKSLASH_CHARS:[C

    const/16 v2, 0x2f

    const/16 v3, 0x2f

    aput-char v3, v1, v2

    .line 124
    sget-object v1, Lorg/unbescape/css/CssStringEscapeUtil;->BACKSLASH_CHARS:[C

    const/16 v2, 0x3b

    const/16 v3, 0x3b

    aput-char v3, v1, v2

    .line 125
    sget-object v1, Lorg/unbescape/css/CssStringEscapeUtil;->BACKSLASH_CHARS:[C

    const/16 v2, 0x3c

    const/16 v3, 0x3c

    aput-char v3, v1, v2

    .line 126
    sget-object v1, Lorg/unbescape/css/CssStringEscapeUtil;->BACKSLASH_CHARS:[C

    const/16 v2, 0x3d

    const/16 v3, 0x3d

    aput-char v3, v1, v2

    .line 127
    sget-object v1, Lorg/unbescape/css/CssStringEscapeUtil;->BACKSLASH_CHARS:[C

    const/16 v2, 0x3e

    const/16 v3, 0x3e

    aput-char v3, v1, v2

    .line 128
    sget-object v1, Lorg/unbescape/css/CssStringEscapeUtil;->BACKSLASH_CHARS:[C

    const/16 v2, 0x3f

    const/16 v3, 0x3f

    aput-char v3, v1, v2

    .line 129
    sget-object v1, Lorg/unbescape/css/CssStringEscapeUtil;->BACKSLASH_CHARS:[C

    const/16 v2, 0x40

    const/16 v3, 0x40

    aput-char v3, v1, v2

    .line 130
    sget-object v1, Lorg/unbescape/css/CssStringEscapeUtil;->BACKSLASH_CHARS:[C

    const/16 v2, 0x5b

    const/16 v3, 0x5b

    aput-char v3, v1, v2

    .line 131
    sget-object v1, Lorg/unbescape/css/CssStringEscapeUtil;->BACKSLASH_CHARS:[C

    aput-char v8, v1, v8

    .line 132
    sget-object v1, Lorg/unbescape/css/CssStringEscapeUtil;->BACKSLASH_CHARS:[C

    const/16 v2, 0x5d

    const/16 v3, 0x5d

    aput-char v3, v1, v2

    .line 133
    sget-object v1, Lorg/unbescape/css/CssStringEscapeUtil;->BACKSLASH_CHARS:[C

    const/16 v2, 0x5e

    const/16 v3, 0x5e

    aput-char v3, v1, v2

    .line 134
    sget-object v1, Lorg/unbescape/css/CssStringEscapeUtil;->BACKSLASH_CHARS:[C

    const/16 v2, 0x5f

    const/16 v3, 0x5f

    aput-char v3, v1, v2

    .line 135
    sget-object v1, Lorg/unbescape/css/CssStringEscapeUtil;->BACKSLASH_CHARS:[C

    const/16 v2, 0x60

    const/16 v3, 0x60

    aput-char v3, v1, v2

    .line 136
    sget-object v1, Lorg/unbescape/css/CssStringEscapeUtil;->BACKSLASH_CHARS:[C

    const/16 v2, 0x7b

    const/16 v3, 0x7b

    aput-char v3, v1, v2

    .line 137
    sget-object v1, Lorg/unbescape/css/CssStringEscapeUtil;->BACKSLASH_CHARS:[C

    const/16 v2, 0x7c

    const/16 v3, 0x7c

    aput-char v3, v1, v2

    .line 138
    sget-object v1, Lorg/unbescape/css/CssStringEscapeUtil;->BACKSLASH_CHARS:[C

    const/16 v2, 0x7d

    const/16 v3, 0x7d

    aput-char v3, v1, v2

    .line 139
    sget-object v1, Lorg/unbescape/css/CssStringEscapeUtil;->BACKSLASH_CHARS:[C

    const/16 v2, 0x7e

    const/16 v3, 0x7e

    aput-char v3, v1, v2

    .line 153
    const/16 v1, 0xa1

    new-array v1, v1, [B

    sput-object v1, Lorg/unbescape/css/CssStringEscapeUtil;->ESCAPE_LEVELS:[B

    .line 158
    sget-object v1, Lorg/unbescape/css/CssStringEscapeUtil;->ESCAPE_LEVELS:[B

    const/4 v2, 0x3

    invoke-static {v1, v2}, Ljava/util/Arrays;->fill([BB)V

    .line 163
    const/16 v0, 0x80

    .local v0, "c":C
    :goto_126
    const/16 v1, 0xa1

    if-ge v0, v1, :cond_133

    .line 164
    sget-object v1, Lorg/unbescape/css/CssStringEscapeUtil;->ESCAPE_LEVELS:[B

    const/4 v2, 0x2

    aput-byte v2, v1, v0

    .line 163
    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_126

    .line 170
    :cond_133
    const/16 v0, 0x41

    :goto_135
    const/16 v1, 0x5a

    if-gt v0, v1, :cond_141

    .line 171
    sget-object v1, Lorg/unbescape/css/CssStringEscapeUtil;->ESCAPE_LEVELS:[B

    aput-byte v5, v1, v0

    .line 170
    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_135

    .line 173
    :cond_141
    const/16 v0, 0x61

    :goto_143
    const/16 v1, 0x7a

    if-gt v0, v1, :cond_14f

    .line 174
    sget-object v1, Lorg/unbescape/css/CssStringEscapeUtil;->ESCAPE_LEVELS:[B

    aput-byte v5, v1, v0

    .line 173
    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_143

    .line 176
    :cond_14f
    const/16 v0, 0x30

    :goto_151
    const/16 v1, 0x39

    if-gt v0, v1, :cond_15d

    .line 177
    sget-object v1, Lorg/unbescape/css/CssStringEscapeUtil;->ESCAPE_LEVELS:[B

    aput-byte v5, v1, v0

    .line 176
    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_151

    .line 183
    :cond_15d
    sget-object v1, Lorg/unbescape/css/CssStringEscapeUtil;->ESCAPE_LEVELS:[B

    aput-byte v4, v1, v6

    .line 184
    sget-object v1, Lorg/unbescape/css/CssStringEscapeUtil;->ESCAPE_LEVELS:[B

    aput-byte v4, v1, v7

    .line 185
    sget-object v1, Lorg/unbescape/css/CssStringEscapeUtil;->ESCAPE_LEVELS:[B

    aput-byte v4, v1, v8

    .line 192
    const/4 v0, 0x0

    :goto_16a
    const/16 v1, 0x1f

    if-gt v0, v1, :cond_176

    .line 193
    sget-object v1, Lorg/unbescape/css/CssStringEscapeUtil;->ESCAPE_LEVELS:[B

    aput-byte v4, v1, v0

    .line 192
    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_16a

    .line 195
    :cond_176
    const/16 v0, 0x7f

    :goto_178
    const/16 v1, 0x9f

    if-gt v0, v1, :cond_184

    .line 196
    sget-object v1, Lorg/unbescape/css/CssStringEscapeUtil;->ESCAPE_LEVELS:[B

    aput-byte v4, v1, v0

    .line 195
    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_178

    .line 199
    :cond_184
    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 204
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 205
    return-void
.end method

.method static escape(Ljava/lang/String;Lorg/unbescape/css/CssStringEscapeType;Lorg/unbescape/css/CssStringEscapeLevel;)Ljava/lang/String;
    .registers 16
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "escapeType"    # Lorg/unbescape/css/CssStringEscapeType;
    .param p2, "escapeLevel"    # Lorg/unbescape/css/CssStringEscapeLevel;

    .prologue
    .line 268
    if-nez p0, :cond_4

    .line 269
    const/4 p0, 0x0

    .line 390
    .end local p0    # "text":Ljava/lang/String;
    :cond_3
    :goto_3
    return-object p0

    .line 272
    .restart local p0    # "text":Ljava/lang/String;
    :cond_4
    invoke-virtual {p2}, Lorg/unbescape/css/CssStringEscapeLevel;->getEscapeLevel()I

    move-result v2

    .line 273
    .local v2, "level":I
    invoke-virtual {p1}, Lorg/unbescape/css/CssStringEscapeType;->getUseBackslashEscapes()Z

    move-result v9

    .line 274
    .local v9, "useBackslashEscapes":Z
    invoke-virtual {p1}, Lorg/unbescape/css/CssStringEscapeType;->getUseCompactHexa()Z

    move-result v10

    .line 276
    .local v10, "useCompactHexa":Z
    const/4 v8, 0x0

    .line 278
    .local v8, "strBuilder":Ljava/lang/StringBuilder;
    const/4 v5, 0x0

    .line 279
    .local v5, "offset":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    .line 281
    .local v3, "max":I
    const/4 v6, 0x0

    .line 283
    .local v6, "readOffset":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_18
    if-ge v1, v3, :cond_9b

    .line 285
    invoke-static {p0, v1}, Ljava/lang/Character;->codePointAt(Ljava/lang/CharSequence;I)I

    move-result v0

    .line 292
    .local v0, "codepoint":I
    const/16 v11, 0x9f

    if-gt v0, v11, :cond_2b

    sget-object v11, Lorg/unbescape/css/CssStringEscapeUtil;->ESCAPE_LEVELS:[B

    aget-byte v11, v11, v0

    if-ge v2, v11, :cond_2b

    .line 283
    :cond_28
    :goto_28
    add-int/lit8 v1, v1, 0x1

    goto :goto_18

    .line 300
    :cond_2b
    const/16 v11, 0x9f

    if-le v0, v11, :cond_41

    sget-object v11, Lorg/unbescape/css/CssStringEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v12, 0xa0

    aget-byte v11, v11, v12

    if-ge v2, v11, :cond_41

    .line 302
    invoke-static {v0}, Ljava/lang/Character;->charCount(I)I

    move-result v11

    const/4 v12, 0x1

    if-le v11, v12, :cond_28

    .line 304
    add-int/lit8 v1, v1, 0x1

    goto :goto_28

    .line 318
    :cond_41
    if-nez v8, :cond_4a

    .line 319
    new-instance v8, Ljava/lang/StringBuilder;

    .end local v8    # "strBuilder":Ljava/lang/StringBuilder;
    add-int/lit8 v11, v3, 0x14

    invoke-direct {v8, v11}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 322
    .restart local v8    # "strBuilder":Ljava/lang/StringBuilder;
    :cond_4a
    sub-int v11, v1, v6

    if-lez v11, :cond_51

    .line 323
    invoke-virtual {v8, p0, v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 326
    :cond_51
    invoke-static {v0}, Ljava/lang/Character;->charCount(I)I

    move-result v11

    const/4 v12, 0x1

    if-le v11, v12, :cond_5a

    .line 328
    add-int/lit8 v1, v1, 0x1

    .line 331
    :cond_5a
    add-int/lit8 v6, v1, 0x1

    .line 342
    if-eqz v9, :cond_73

    sget v11, Lorg/unbescape/css/CssStringEscapeUtil;->BACKSLASH_CHARS_LEN:I

    if-ge v0, v11, :cond_73

    .line 345
    sget-object v11, Lorg/unbescape/css/CssStringEscapeUtil;->BACKSLASH_CHARS:[C

    aget-char v7, v11, v0

    .line 347
    .local v7, "sec":C
    sget-char v11, Lorg/unbescape/css/CssStringEscapeUtil;->BACKSLASH_CHARS_NO_ESCAPE:C

    if-eq v7, v11, :cond_73

    .line 349
    const/16 v11, 0x5c

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 350
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_28

    .line 360
    .end local v7    # "sec":C
    :cond_73
    add-int/lit8 v11, v1, 0x1

    if-ge v11, v3, :cond_8c

    add-int/lit8 v11, v1, 0x1

    .line 361
    invoke-virtual {p0, v11}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 363
    .local v4, "next":C
    :goto_7d
    if-eqz v10, :cond_8e

    .line 364
    const/16 v11, 0x5c

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 365
    invoke-static {v0, v4, v2}, Lorg/unbescape/css/CssStringEscapeUtil;->toCompactHexa(ICI)[C

    move-result-object v11

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    goto :goto_28

    .line 361
    .end local v4    # "next":C
    :cond_8c
    const/4 v4, 0x0

    goto :goto_7d

    .line 369
    .restart local v4    # "next":C
    :cond_8e
    const/16 v11, 0x5c

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 370
    invoke-static {v0, v4, v2}, Lorg/unbescape/css/CssStringEscapeUtil;->toSixDigitHexa(ICI)[C

    move-result-object v11

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    goto :goto_28

    .line 382
    .end local v0    # "codepoint":I
    .end local v4    # "next":C
    :cond_9b
    if-eqz v8, :cond_3

    .line 386
    sub-int v11, v3, v6

    if-lez v11, :cond_a4

    .line 387
    invoke-virtual {v8, p0, v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 390
    :cond_a4
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto/16 :goto_3
.end method

.method static escape([CIILjava/io/Writer;Lorg/unbescape/css/CssStringEscapeType;Lorg/unbescape/css/CssStringEscapeLevel;)V
    .registers 17
    .param p0, "text"    # [C
    .param p1, "offset"    # I
    .param p2, "len"    # I
    .param p3, "writer"    # Ljava/io/Writer;
    .param p4, "escapeType"    # Lorg/unbescape/css/CssStringEscapeType;
    .param p5, "escapeLevel"    # Lorg/unbescape/css/CssStringEscapeLevel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 405
    if-eqz p0, :cond_5

    array-length v9, p0

    if-nez v9, :cond_6

    .line 514
    :cond_5
    :goto_5
    return-void

    .line 409
    :cond_6
    invoke-virtual/range {p5 .. p5}, Lorg/unbescape/css/CssStringEscapeLevel;->getEscapeLevel()I

    move-result v3

    .line 410
    .local v3, "level":I
    invoke-virtual {p4}, Lorg/unbescape/css/CssStringEscapeType;->getUseBackslashEscapes()Z

    move-result v7

    .line 411
    .local v7, "useBackslashEscapes":Z
    invoke-virtual {p4}, Lorg/unbescape/css/CssStringEscapeType;->getUseCompactHexa()Z

    move-result v8

    .line 413
    .local v8, "useCompactHexa":Z
    add-int v4, p1, p2

    .line 415
    .local v4, "max":I
    move v6, p1

    .line 417
    .local v6, "readOffset":I
    move v2, p1

    .local v2, "i":I
    :goto_16
    if-ge v2, v4, :cond_90

    .line 419
    invoke-static {p0, v2}, Ljava/lang/Character;->codePointAt([CI)I

    move-result v0

    .line 426
    .local v0, "codepoint":I
    const/16 v9, 0x9f

    if-gt v0, v9, :cond_29

    sget-object v9, Lorg/unbescape/css/CssStringEscapeUtil;->ESCAPE_LEVELS:[B

    aget-byte v9, v9, v0

    if-ge v3, v9, :cond_29

    .line 417
    :cond_26
    :goto_26
    add-int/lit8 v2, v2, 0x1

    goto :goto_16

    .line 434
    :cond_29
    const/16 v9, 0x9f

    if-le v0, v9, :cond_3f

    sget-object v9, Lorg/unbescape/css/CssStringEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v10, 0xa0

    aget-byte v9, v9, v10

    if-ge v3, v9, :cond_3f

    .line 436
    invoke-static {v0}, Ljava/lang/Character;->charCount(I)I

    move-result v9

    const/4 v10, 0x1

    if-le v9, v10, :cond_26

    .line 438
    add-int/lit8 v2, v2, 0x1

    goto :goto_26

    .line 451
    :cond_3f
    sub-int v9, v2, v6

    if-lez v9, :cond_48

    .line 452
    sub-int v9, v2, v6

    invoke-virtual {p3, p0, v6, v9}, Ljava/io/Writer;->write([CII)V

    .line 455
    :cond_48
    invoke-static {v0}, Ljava/lang/Character;->charCount(I)I

    move-result v9

    const/4 v10, 0x1

    if-le v9, v10, :cond_51

    .line 457
    add-int/lit8 v2, v2, 0x1

    .line 460
    :cond_51
    add-int/lit8 v6, v2, 0x1

    .line 471
    if-eqz v7, :cond_6a

    sget v9, Lorg/unbescape/css/CssStringEscapeUtil;->BACKSLASH_CHARS_LEN:I

    if-ge v0, v9, :cond_6a

    .line 474
    sget-object v9, Lorg/unbescape/css/CssStringEscapeUtil;->BACKSLASH_CHARS:[C

    aget-char v1, v9, v0

    .line 476
    .local v1, "escape":C
    sget-char v9, Lorg/unbescape/css/CssStringEscapeUtil;->BACKSLASH_CHARS_NO_ESCAPE:C

    if-eq v1, v9, :cond_6a

    .line 478
    const/16 v9, 0x5c

    invoke-virtual {p3, v9}, Ljava/io/Writer;->write(I)V

    .line 479
    invoke-virtual {p3, v1}, Ljava/io/Writer;->write(I)V

    goto :goto_26

    .line 489
    .end local v1    # "escape":C
    :cond_6a
    add-int/lit8 v9, v2, 0x1

    if-ge v9, v4, :cond_81

    add-int/lit8 v9, v2, 0x1

    aget-char v5, p0, v9

    .line 492
    .local v5, "next":C
    :goto_72
    if-eqz v8, :cond_83

    .line 493
    const/16 v9, 0x5c

    invoke-virtual {p3, v9}, Ljava/io/Writer;->write(I)V

    .line 494
    invoke-static {v0, v5, v3}, Lorg/unbescape/css/CssStringEscapeUtil;->toCompactHexa(ICI)[C

    move-result-object v9

    invoke-virtual {p3, v9}, Ljava/io/Writer;->write([C)V

    goto :goto_26

    .line 489
    .end local v5    # "next":C
    :cond_81
    const/4 v5, 0x0

    goto :goto_72

    .line 498
    .restart local v5    # "next":C
    :cond_83
    const/16 v9, 0x5c

    invoke-virtual {p3, v9}, Ljava/io/Writer;->write(I)V

    .line 499
    invoke-static {v0, v5, v3}, Lorg/unbescape/css/CssStringEscapeUtil;->toSixDigitHexa(ICI)[C

    move-result-object v9

    invoke-virtual {p3, v9}, Ljava/io/Writer;->write([C)V

    goto :goto_26

    .line 510
    .end local v0    # "codepoint":I
    .end local v5    # "next":C
    :cond_90
    sub-int v9, v4, v6

    if-lez v9, :cond_5

    .line 511
    sub-int v9, v4, v6

    invoke-virtual {p3, p0, v6, v9}, Ljava/io/Writer;->write([CII)V

    goto/16 :goto_5
.end method

.method static toCompactHexa(ICI)[C
    .registers 13
    .param p0, "codepoint"    # I
    .param p1, "next"    # C
    .param p2, "level"    # I

    .prologue
    const/16 v9, 0x30

    const/16 v8, 0x20

    const/4 v5, 0x2

    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 214
    const/4 v4, 0x4

    if-ge p2, v4, :cond_20

    if-lt p1, v9, :cond_10

    const/16 v4, 0x39

    if-le p1, v4, :cond_25

    :cond_10
    const/16 v4, 0x41

    if-lt p1, v4, :cond_18

    const/16 v4, 0x46

    if-le p1, v4, :cond_25

    :cond_18
    const/16 v4, 0x61

    if-lt p1, v4, :cond_20

    const/16 v4, 0x66

    if-le p1, v4, :cond_25

    :cond_20
    const/4 v4, 0x3

    if-ge p2, v4, :cond_30

    if-ne p1, v8, :cond_30

    :cond_25
    move v2, v6

    .line 218
    .local v2, "needTrailingSpace":Z
    :goto_26
    if-nez p0, :cond_37

    .line 219
    if-eqz v2, :cond_32

    new-array v4, v5, [C

    fill-array-data v4, :array_76

    .line 238
    :goto_2f
    return-object v4

    .end local v2    # "needTrailingSpace":Z
    :cond_30
    move v2, v7

    .line 214
    goto :goto_26

    .line 219
    .restart local v2    # "needTrailingSpace":Z
    :cond_32
    new-array v4, v6, [C

    aput-char v9, v4, v7

    goto :goto_2f

    .line 221
    :cond_37
    const/16 v0, 0x14

    .line 222
    .local v0, "div":I
    const/4 v3, 0x0

    .line 223
    .local v3, "result":[C
    :goto_3a
    if-nez v3, :cond_51

    if-ltz v0, :cond_51

    .line 224
    ushr-int v4, p0, v0

    rem-int/lit8 v4, v4, 0x10

    if-lez v4, :cond_4c

    .line 225
    div-int/lit8 v7, v0, 0x4

    if-eqz v2, :cond_4f

    move v4, v5

    :goto_49
    add-int/2addr v4, v7

    new-array v3, v4, [C

    .line 227
    :cond_4c
    add-int/lit8 v0, v0, -0x4

    goto :goto_3a

    :cond_4f
    move v4, v6

    .line 225
    goto :goto_49

    .line 229
    :cond_51
    const/4 v0, 0x0

    .line 230
    if-eqz v2, :cond_68

    array-length v4, v3

    add-int/lit8 v1, v4, -0x2

    .local v1, "i":I
    :goto_57
    if-ltz v1, :cond_6c

    .line 231
    sget-object v4, Lorg/unbescape/css/CssStringEscapeUtil;->HEXA_CHARS_UPPER:[C

    ushr-int v5, p0, v0

    rem-int/lit8 v5, v5, 0x10

    aget-char v4, v4, v5

    aput-char v4, v3, v1

    .line 232
    add-int/lit8 v0, v0, 0x4

    .line 230
    add-int/lit8 v1, v1, -0x1

    goto :goto_57

    .end local v1    # "i":I
    :cond_68
    array-length v4, v3

    add-int/lit8 v1, v4, -0x1

    goto :goto_57

    .line 234
    .restart local v1    # "i":I
    :cond_6c
    if-eqz v2, :cond_73

    .line 235
    array-length v4, v3

    add-int/lit8 v4, v4, -0x1

    aput-char v8, v3, v4

    :cond_73
    move-object v4, v3

    .line 238
    goto :goto_2f

    .line 219
    nop

    :array_76
    .array-data 2
        0x30s
        0x20s
    .end array-data
.end method

.method static toSixDigitHexa(ICI)[C
    .registers 11
    .param p0, "codepoint"    # I
    .param p1, "next"    # C
    .param p2, "level"    # I

    .prologue
    const/16 v5, 0x20

    const/4 v7, 0x3

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 246
    if-ge p2, v7, :cond_54

    if-ne p1, v5, :cond_54

    move v0, v3

    .line 248
    .local v0, "needTrailingSpace":Z
    :goto_a
    if-eqz v0, :cond_56

    move v2, v3

    :goto_d
    add-int/lit8 v2, v2, 0x6

    new-array v1, v2, [C

    .line 249
    .local v1, "result":[C
    if-eqz v0, :cond_16

    .line 250
    const/4 v2, 0x6

    aput-char v5, v1, v2

    .line 252
    :cond_16
    const/4 v2, 0x5

    sget-object v5, Lorg/unbescape/css/CssStringEscapeUtil;->HEXA_CHARS_UPPER:[C

    rem-int/lit8 v6, p0, 0x10

    aget-char v5, v5, v6

    aput-char v5, v1, v2

    .line 253
    const/4 v2, 0x4

    sget-object v5, Lorg/unbescape/css/CssStringEscapeUtil;->HEXA_CHARS_UPPER:[C

    ushr-int/lit8 v6, p0, 0x4

    rem-int/lit8 v6, v6, 0x10

    aget-char v5, v5, v6

    aput-char v5, v1, v2

    .line 254
    sget-object v2, Lorg/unbescape/css/CssStringEscapeUtil;->HEXA_CHARS_UPPER:[C

    ushr-int/lit8 v5, p0, 0x8

    rem-int/lit8 v5, v5, 0x10

    aget-char v2, v2, v5

    aput-char v2, v1, v7

    .line 255
    const/4 v2, 0x2

    sget-object v5, Lorg/unbescape/css/CssStringEscapeUtil;->HEXA_CHARS_UPPER:[C

    ushr-int/lit8 v6, p0, 0xc

    rem-int/lit8 v6, v6, 0x10

    aget-char v5, v5, v6

    aput-char v5, v1, v2

    .line 256
    sget-object v2, Lorg/unbescape/css/CssStringEscapeUtil;->HEXA_CHARS_UPPER:[C

    ushr-int/lit8 v5, p0, 0x10

    rem-int/lit8 v5, v5, 0x10

    aget-char v2, v2, v5

    aput-char v2, v1, v3

    .line 257
    sget-object v2, Lorg/unbescape/css/CssStringEscapeUtil;->HEXA_CHARS_UPPER:[C

    ushr-int/lit8 v3, p0, 0x14

    rem-int/lit8 v3, v3, 0x10

    aget-char v2, v2, v3

    aput-char v2, v1, v4

    .line 258
    return-object v1

    .end local v0    # "needTrailingSpace":Z
    .end local v1    # "result":[C
    :cond_54
    move v0, v4

    .line 246
    goto :goto_a

    .restart local v0    # "needTrailingSpace":Z
    :cond_56
    move v2, v4

    .line 248
    goto :goto_d
.end method
