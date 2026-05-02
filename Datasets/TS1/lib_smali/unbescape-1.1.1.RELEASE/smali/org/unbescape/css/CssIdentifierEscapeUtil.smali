.class final Lorg/unbescape/css/CssIdentifierEscapeUtil;
.super Ljava/lang/Object;
.source "CssIdentifierEscapeUtil.java"


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
    const/16 v8, 0x22

    const/16 v7, 0x21

    const/16 v6, 0x20

    const/4 v5, 0x4

    const/4 v4, 0x1

    .line 109
    const-string v1, "0123456789ABCDEF"

    invoke-virtual {v1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    sput-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->HEXA_CHARS_UPPER:[C

    .line 115
    const/16 v1, 0x7f

    sput v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->BACKSLASH_CHARS_LEN:I

    .line 116
    const/4 v1, 0x0

    sput-char v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->BACKSLASH_CHARS_NO_ESCAPE:C

    .line 134
    sget v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->BACKSLASH_CHARS_LEN:I

    new-array v1, v1, [C

    sput-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->BACKSLASH_CHARS:[C

    .line 135
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->BACKSLASH_CHARS:[C

    sget-char v2, Lorg/unbescape/css/CssIdentifierEscapeUtil;->BACKSLASH_CHARS_NO_ESCAPE:C

    invoke-static {v1, v2}, Ljava/util/Arrays;->fill([CC)V

    .line 136
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->BACKSLASH_CHARS:[C

    aput-char v6, v1, v6

    .line 137
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->BACKSLASH_CHARS:[C

    aput-char v7, v1, v7

    .line 138
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->BACKSLASH_CHARS:[C

    aput-char v8, v1, v8

    .line 139
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->BACKSLASH_CHARS:[C

    const/16 v2, 0x23

    const/16 v3, 0x23

    aput-char v3, v1, v2

    .line 140
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->BACKSLASH_CHARS:[C

    const/16 v2, 0x24

    const/16 v3, 0x24

    aput-char v3, v1, v2

    .line 141
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->BACKSLASH_CHARS:[C

    const/16 v2, 0x25

    const/16 v3, 0x25

    aput-char v3, v1, v2

    .line 142
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->BACKSLASH_CHARS:[C

    const/16 v2, 0x26

    const/16 v3, 0x26

    aput-char v3, v1, v2

    .line 143
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->BACKSLASH_CHARS:[C

    const/16 v2, 0x27

    const/16 v3, 0x27

    aput-char v3, v1, v2

    .line 144
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->BACKSLASH_CHARS:[C

    const/16 v2, 0x28

    const/16 v3, 0x28

    aput-char v3, v1, v2

    .line 145
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->BACKSLASH_CHARS:[C

    const/16 v2, 0x29

    const/16 v3, 0x29

    aput-char v3, v1, v2

    .line 146
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->BACKSLASH_CHARS:[C

    const/16 v2, 0x2a

    const/16 v3, 0x2a

    aput-char v3, v1, v2

    .line 147
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->BACKSLASH_CHARS:[C

    const/16 v2, 0x2b

    const/16 v3, 0x2b

    aput-char v3, v1, v2

    .line 148
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->BACKSLASH_CHARS:[C

    const/16 v2, 0x2c

    const/16 v3, 0x2c

    aput-char v3, v1, v2

    .line 150
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->BACKSLASH_CHARS:[C

    const/16 v2, 0x2d

    const/16 v3, 0x2d

    aput-char v3, v1, v2

    .line 151
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->BACKSLASH_CHARS:[C

    const/16 v2, 0x2e

    const/16 v3, 0x2e

    aput-char v3, v1, v2

    .line 152
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->BACKSLASH_CHARS:[C

    const/16 v2, 0x2f

    const/16 v3, 0x2f

    aput-char v3, v1, v2

    .line 155
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->BACKSLASH_CHARS:[C

    const/16 v2, 0x3b

    const/16 v3, 0x3b

    aput-char v3, v1, v2

    .line 156
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->BACKSLASH_CHARS:[C

    const/16 v2, 0x3c

    const/16 v3, 0x3c

    aput-char v3, v1, v2

    .line 157
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->BACKSLASH_CHARS:[C

    const/16 v2, 0x3d

    const/16 v3, 0x3d

    aput-char v3, v1, v2

    .line 158
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->BACKSLASH_CHARS:[C

    const/16 v2, 0x3e

    const/16 v3, 0x3e

    aput-char v3, v1, v2

    .line 159
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->BACKSLASH_CHARS:[C

    const/16 v2, 0x3f

    const/16 v3, 0x3f

    aput-char v3, v1, v2

    .line 160
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->BACKSLASH_CHARS:[C

    const/16 v2, 0x40

    const/16 v3, 0x40

    aput-char v3, v1, v2

    .line 161
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->BACKSLASH_CHARS:[C

    const/16 v2, 0x5b

    const/16 v3, 0x5b

    aput-char v3, v1, v2

    .line 162
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->BACKSLASH_CHARS:[C

    const/16 v2, 0x5c

    const/16 v3, 0x5c

    aput-char v3, v1, v2

    .line 163
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->BACKSLASH_CHARS:[C

    const/16 v2, 0x5d

    const/16 v3, 0x5d

    aput-char v3, v1, v2

    .line 164
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->BACKSLASH_CHARS:[C

    const/16 v2, 0x5e

    const/16 v3, 0x5e

    aput-char v3, v1, v2

    .line 166
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->BACKSLASH_CHARS:[C

    const/16 v2, 0x5f

    const/16 v3, 0x5f

    aput-char v3, v1, v2

    .line 167
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->BACKSLASH_CHARS:[C

    const/16 v2, 0x60

    const/16 v3, 0x60

    aput-char v3, v1, v2

    .line 168
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->BACKSLASH_CHARS:[C

    const/16 v2, 0x7b

    const/16 v3, 0x7b

    aput-char v3, v1, v2

    .line 169
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->BACKSLASH_CHARS:[C

    const/16 v2, 0x7c

    const/16 v3, 0x7c

    aput-char v3, v1, v2

    .line 170
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->BACKSLASH_CHARS:[C

    const/16 v2, 0x7d

    const/16 v3, 0x7d

    aput-char v3, v1, v2

    .line 171
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->BACKSLASH_CHARS:[C

    const/16 v2, 0x7e

    const/16 v3, 0x7e

    aput-char v3, v1, v2

    .line 185
    const/16 v1, 0xa1

    new-array v1, v1, [B

    sput-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->ESCAPE_LEVELS:[B

    .line 190
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->ESCAPE_LEVELS:[B

    const/4 v2, 0x3

    invoke-static {v1, v2}, Ljava/util/Arrays;->fill([BB)V

    .line 195
    const/16 v0, 0x80

    .local v0, "c":C
    :goto_126
    const/16 v1, 0xa1

    if-ge v0, v1, :cond_133

    .line 196
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->ESCAPE_LEVELS:[B

    const/4 v2, 0x2

    aput-byte v2, v1, v0

    .line 195
    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_126

    .line 202
    :cond_133
    const/16 v0, 0x41

    :goto_135
    const/16 v1, 0x5a

    if-gt v0, v1, :cond_141

    .line 203
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->ESCAPE_LEVELS:[B

    aput-byte v5, v1, v0

    .line 202
    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_135

    .line 205
    :cond_141
    const/16 v0, 0x61

    :goto_143
    const/16 v1, 0x7a

    if-gt v0, v1, :cond_14f

    .line 206
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->ESCAPE_LEVELS:[B

    aput-byte v5, v1, v0

    .line 205
    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_143

    .line 208
    :cond_14f
    const/16 v0, 0x30

    :goto_151
    const/16 v1, 0x39

    if-gt v0, v1, :cond_15d

    .line 209
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->ESCAPE_LEVELS:[B

    aput-byte v5, v1, v0

    .line 208
    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_151

    .line 215
    :cond_15d
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->ESCAPE_LEVELS:[B

    aput-byte v4, v1, v6

    .line 216
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->ESCAPE_LEVELS:[B

    aput-byte v4, v1, v7

    .line 217
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->ESCAPE_LEVELS:[B

    aput-byte v4, v1, v8

    .line 218
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v2, 0x23

    aput-byte v4, v1, v2

    .line 219
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v2, 0x24

    aput-byte v4, v1, v2

    .line 220
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v2, 0x25

    aput-byte v4, v1, v2

    .line 221
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v2, 0x26

    aput-byte v4, v1, v2

    .line 222
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v2, 0x27

    aput-byte v4, v1, v2

    .line 223
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v2, 0x28

    aput-byte v4, v1, v2

    .line 224
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v2, 0x29

    aput-byte v4, v1, v2

    .line 225
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v2, 0x2a

    aput-byte v4, v1, v2

    .line 226
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v2, 0x2b

    aput-byte v4, v1, v2

    .line 227
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v2, 0x2c

    aput-byte v4, v1, v2

    .line 229
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v2, 0x2d

    aput-byte v4, v1, v2

    .line 230
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v2, 0x2e

    aput-byte v4, v1, v2

    .line 231
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v2, 0x2f

    aput-byte v4, v1, v2

    .line 233
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v2, 0x3a

    aput-byte v4, v1, v2

    .line 234
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v2, 0x3b

    aput-byte v4, v1, v2

    .line 235
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v2, 0x3c

    aput-byte v4, v1, v2

    .line 236
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v2, 0x3d

    aput-byte v4, v1, v2

    .line 237
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v2, 0x3e

    aput-byte v4, v1, v2

    .line 238
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v2, 0x3f

    aput-byte v4, v1, v2

    .line 239
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v2, 0x40

    aput-byte v4, v1, v2

    .line 240
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v2, 0x5b

    aput-byte v4, v1, v2

    .line 241
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v2, 0x5c

    aput-byte v4, v1, v2

    .line 242
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v2, 0x5d

    aput-byte v4, v1, v2

    .line 243
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v2, 0x5e

    aput-byte v4, v1, v2

    .line 245
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v2, 0x5f

    aput-byte v4, v1, v2

    .line 246
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v2, 0x60

    aput-byte v4, v1, v2

    .line 247
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v2, 0x7b

    aput-byte v4, v1, v2

    .line 248
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v2, 0x7c

    aput-byte v4, v1, v2

    .line 249
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v2, 0x7d

    aput-byte v4, v1, v2

    .line 250
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v2, 0x7e

    aput-byte v4, v1, v2

    .line 257
    const/4 v0, 0x0

    :goto_21e
    const/16 v1, 0x1f

    if-gt v0, v1, :cond_22a

    .line 258
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->ESCAPE_LEVELS:[B

    aput-byte v4, v1, v0

    .line 257
    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_21e

    .line 260
    :cond_22a
    const/16 v0, 0x7f

    :goto_22c
    const/16 v1, 0x9f

    if-gt v0, v1, :cond_238

    .line 261
    sget-object v1, Lorg/unbescape/css/CssIdentifierEscapeUtil;->ESCAPE_LEVELS:[B

    aput-byte v4, v1, v0

    .line 260
    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_22c

    .line 264
    :cond_238
    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 269
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 270
    return-void
.end method

.method static escape(Ljava/lang/String;Lorg/unbescape/css/CssIdentifierEscapeType;Lorg/unbescape/css/CssIdentifierEscapeLevel;)Ljava/lang/String;
    .registers 17
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "escapeType"    # Lorg/unbescape/css/CssIdentifierEscapeType;
    .param p2, "escapeLevel"    # Lorg/unbescape/css/CssIdentifierEscapeLevel;

    .prologue
    .line 332
    if-nez p0, :cond_4

    .line 333
    const/4 p0, 0x0

    .line 478
    .end local p0    # "text":Ljava/lang/String;
    :cond_3
    :goto_3
    return-object p0

    .line 336
    .restart local p0    # "text":Ljava/lang/String;
    :cond_4
    invoke-virtual/range {p2 .. p2}, Lorg/unbescape/css/CssIdentifierEscapeLevel;->getEscapeLevel()I

    move-result v4

    .line 337
    .local v4, "level":I
    invoke-virtual {p1}, Lorg/unbescape/css/CssIdentifierEscapeType;->getUseBackslashEscapes()Z

    move-result v10

    .line 338
    .local v10, "useBackslashEscapes":Z
    invoke-virtual {p1}, Lorg/unbescape/css/CssIdentifierEscapeType;->getUseCompactHexa()Z

    move-result v11

    .line 340
    .local v11, "useCompactHexa":Z
    const/4 v9, 0x0

    .line 342
    .local v9, "strBuilder":Ljava/lang/StringBuilder;
    const/4 v7, 0x0

    .line 343
    .local v7, "offset":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    .line 345
    .local v5, "max":I
    const/4 v8, 0x0

    .line 347
    .local v8, "readOffset":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_18
    if-ge v3, v5, :cond_cf

    .line 349
    invoke-static {p0, v3}, Ljava/lang/Character;->codePointAt(Ljava/lang/CharSequence;I)I

    move-result v1

    .line 356
    .local v1, "codepoint":I
    const/16 v12, 0x9f

    if-gt v1, v12, :cond_35

    sget-object v12, Lorg/unbescape/css/CssIdentifierEscapeUtil;->ESCAPE_LEVELS:[B

    aget-byte v12, v12, v1

    if-ge v4, v12, :cond_35

    if-gtz v3, :cond_32

    const/16 v12, 0x30

    if-lt v1, v12, :cond_32

    const/16 v12, 0x39

    if-le v1, v12, :cond_35

    .line 347
    :cond_32
    :goto_32
    add-int/lit8 v3, v3, 0x1

    goto :goto_18

    .line 366
    :cond_35
    const/16 v12, 0x2d

    if-ne v1, v12, :cond_54

    const/4 v12, 0x3

    if-ge v4, v12, :cond_54

    .line 367
    if-gtz v3, :cond_32

    add-int/lit8 v12, v3, 0x1

    if-ge v12, v5, :cond_32

    .line 370
    add-int/lit8 v12, v3, 0x1

    invoke-virtual {p0, v12}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 371
    .local v0, "c1":C
    const/16 v12, 0x2d

    if-eq v0, v12, :cond_54

    const/16 v12, 0x30

    if-lt v0, v12, :cond_32

    const/16 v12, 0x39

    if-gt v0, v12, :cond_32

    .line 380
    .end local v0    # "c1":C
    :cond_54
    const/16 v12, 0x5f

    if-ne v1, v12, :cond_5d

    const/4 v12, 0x3

    if-ge v4, v12, :cond_5d

    if-gtz v3, :cond_32

    .line 388
    :cond_5d
    const/16 v12, 0x9f

    if-le v1, v12, :cond_73

    sget-object v12, Lorg/unbescape/css/CssIdentifierEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v13, 0xa0

    aget-byte v12, v12, v13

    if-ge v4, v12, :cond_73

    .line 390
    invoke-static {v1}, Ljava/lang/Character;->charCount(I)I

    move-result v12

    const/4 v13, 0x1

    if-le v12, v13, :cond_32

    .line 392
    add-int/lit8 v3, v3, 0x1

    goto :goto_32

    .line 406
    :cond_73
    if-nez v9, :cond_7c

    .line 407
    new-instance v9, Ljava/lang/StringBuilder;

    .end local v9    # "strBuilder":Ljava/lang/StringBuilder;
    add-int/lit8 v12, v5, 0x14

    invoke-direct {v9, v12}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 410
    .restart local v9    # "strBuilder":Ljava/lang/StringBuilder;
    :cond_7c
    sub-int v12, v3, v8

    if-lez v12, :cond_83

    .line 411
    invoke-virtual {v9, p0, v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 414
    :cond_83
    invoke-static {v1}, Ljava/lang/Character;->charCount(I)I

    move-result v12

    const/4 v13, 0x1

    if-le v12, v13, :cond_8c

    .line 416
    add-int/lit8 v3, v3, 0x1

    .line 419
    :cond_8c
    add-int/lit8 v8, v3, 0x1

    .line 430
    if-eqz v10, :cond_a5

    sget v12, Lorg/unbescape/css/CssIdentifierEscapeUtil;->BACKSLASH_CHARS_LEN:I

    if-ge v1, v12, :cond_a5

    .line 433
    sget-object v12, Lorg/unbescape/css/CssIdentifierEscapeUtil;->BACKSLASH_CHARS:[C

    aget-char v2, v12, v1

    .line 435
    .local v2, "escape":C
    sget-char v12, Lorg/unbescape/css/CssIdentifierEscapeUtil;->BACKSLASH_CHARS_NO_ESCAPE:C

    if-eq v2, v12, :cond_a5

    .line 437
    const/16 v12, 0x5c

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 438
    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_32

    .line 448
    .end local v2    # "escape":C
    :cond_a5
    add-int/lit8 v12, v3, 0x1

    if-ge v12, v5, :cond_bf

    add-int/lit8 v12, v3, 0x1

    .line 449
    invoke-virtual {p0, v12}, Ljava/lang/String;->charAt(I)C

    move-result v6

    .line 451
    .local v6, "next":C
    :goto_af
    if-eqz v11, :cond_c1

    .line 452
    const/16 v12, 0x5c

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 453
    invoke-static {v1, v6, v4}, Lorg/unbescape/css/CssIdentifierEscapeUtil;->toCompactHexa(ICI)[C

    move-result-object v12

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    goto/16 :goto_32

    .line 449
    .end local v6    # "next":C
    :cond_bf
    const/4 v6, 0x0

    goto :goto_af

    .line 457
    .restart local v6    # "next":C
    :cond_c1
    const/16 v12, 0x5c

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 458
    invoke-static {v1, v6, v4}, Lorg/unbescape/css/CssIdentifierEscapeUtil;->toSixDigitHexa(ICI)[C

    move-result-object v12

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    goto/16 :goto_32

    .line 470
    .end local v1    # "codepoint":I
    .end local v6    # "next":C
    :cond_cf
    if-eqz v9, :cond_3

    .line 474
    sub-int v12, v5, v8

    if-lez v12, :cond_d8

    .line 475
    invoke-virtual {v9, p0, v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 478
    :cond_d8
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto/16 :goto_3
.end method

.method static escape([CIILjava/io/Writer;Lorg/unbescape/css/CssIdentifierEscapeType;Lorg/unbescape/css/CssIdentifierEscapeLevel;)V
    .registers 18
    .param p0, "text"    # [C
    .param p1, "offset"    # I
    .param p2, "len"    # I
    .param p3, "writer"    # Ljava/io/Writer;
    .param p4, "escapeType"    # Lorg/unbescape/css/CssIdentifierEscapeType;
    .param p5, "escapeLevel"    # Lorg/unbescape/css/CssIdentifierEscapeLevel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 493
    if-eqz p0, :cond_5

    array-length v10, p0

    if-nez v10, :cond_6

    .line 626
    :cond_5
    :goto_5
    return-void

    .line 497
    :cond_6
    invoke-virtual/range {p5 .. p5}, Lorg/unbescape/css/CssIdentifierEscapeLevel;->getEscapeLevel()I

    move-result v4

    .line 498
    .local v4, "level":I
    invoke-virtual/range {p4 .. p4}, Lorg/unbescape/css/CssIdentifierEscapeType;->getUseBackslashEscapes()Z

    move-result v8

    .line 499
    .local v8, "useBackslashEscapes":Z
    invoke-virtual/range {p4 .. p4}, Lorg/unbescape/css/CssIdentifierEscapeType;->getUseCompactHexa()Z

    move-result v9

    .line 501
    .local v9, "useCompactHexa":Z
    add-int v5, p1, p2

    .line 503
    .local v5, "max":I
    move v7, p1

    .line 505
    .local v7, "readOffset":I
    move v3, p1

    .local v3, "i":I
    :goto_16
    if-ge v3, v5, :cond_c1

    .line 507
    invoke-static {p0, v3}, Ljava/lang/Character;->codePointAt([CI)I

    move-result v1

    .line 514
    .local v1, "codepoint":I
    const/16 v10, 0x9f

    if-gt v1, v10, :cond_33

    sget-object v10, Lorg/unbescape/css/CssIdentifierEscapeUtil;->ESCAPE_LEVELS:[B

    aget-byte v10, v10, v1

    if-ge v4, v10, :cond_33

    if-gt v3, p1, :cond_30

    const/16 v10, 0x30

    if-lt v1, v10, :cond_30

    const/16 v10, 0x39

    if-le v1, v10, :cond_33

    .line 505
    :cond_30
    :goto_30
    add-int/lit8 v3, v3, 0x1

    goto :goto_16

    .line 524
    :cond_33
    const/16 v10, 0x2d

    if-ne v1, v10, :cond_50

    const/4 v10, 0x3

    if-ge v4, v10, :cond_50

    .line 525
    if-gt v3, p1, :cond_30

    add-int/lit8 v10, v3, 0x1

    if-ge v10, v5, :cond_30

    .line 528
    add-int/lit8 v10, v3, 0x1

    aget-char v0, p0, v10

    .line 529
    .local v0, "c1":C
    const/16 v10, 0x2d

    if-eq v0, v10, :cond_50

    const/16 v10, 0x30

    if-lt v0, v10, :cond_30

    const/16 v10, 0x39

    if-gt v0, v10, :cond_30

    .line 538
    .end local v0    # "c1":C
    :cond_50
    const/16 v10, 0x5f

    if-ne v1, v10, :cond_59

    const/4 v10, 0x3

    if-ge v4, v10, :cond_59

    if-gt v3, p1, :cond_30

    .line 546
    :cond_59
    const/16 v10, 0x9f

    if-le v1, v10, :cond_6f

    sget-object v10, Lorg/unbescape/css/CssIdentifierEscapeUtil;->ESCAPE_LEVELS:[B

    const/16 v11, 0xa0

    aget-byte v10, v10, v11

    if-ge v4, v10, :cond_6f

    .line 548
    invoke-static {v1}, Ljava/lang/Character;->charCount(I)I

    move-result v10

    const/4 v11, 0x1

    if-le v10, v11, :cond_30

    .line 550
    add-int/lit8 v3, v3, 0x1

    goto :goto_30

    .line 563
    :cond_6f
    sub-int v10, v3, v7

    if-lez v10, :cond_78

    .line 564
    sub-int v10, v3, v7

    invoke-virtual {p3, p0, v7, v10}, Ljava/io/Writer;->write([CII)V

    .line 567
    :cond_78
    invoke-static {v1}, Ljava/lang/Character;->charCount(I)I

    move-result v10

    const/4 v11, 0x1

    if-le v10, v11, :cond_81

    .line 569
    add-int/lit8 v3, v3, 0x1

    .line 572
    :cond_81
    add-int/lit8 v7, v3, 0x1

    .line 583
    if-eqz v8, :cond_9a

    sget v10, Lorg/unbescape/css/CssIdentifierEscapeUtil;->BACKSLASH_CHARS_LEN:I

    if-ge v1, v10, :cond_9a

    .line 586
    sget-object v10, Lorg/unbescape/css/CssIdentifierEscapeUtil;->BACKSLASH_CHARS:[C

    aget-char v2, v10, v1

    .line 588
    .local v2, "escape":C
    sget-char v10, Lorg/unbescape/css/CssIdentifierEscapeUtil;->BACKSLASH_CHARS_NO_ESCAPE:C

    if-eq v2, v10, :cond_9a

    .line 590
    const/16 v10, 0x5c

    invoke-virtual {p3, v10}, Ljava/io/Writer;->write(I)V

    .line 591
    invoke-virtual {p3, v2}, Ljava/io/Writer;->write(I)V

    goto :goto_30

    .line 601
    .end local v2    # "escape":C
    :cond_9a
    add-int/lit8 v10, v3, 0x1

    if-ge v10, v5, :cond_b1

    add-int/lit8 v10, v3, 0x1

    aget-char v6, p0, v10

    .line 604
    .local v6, "next":C
    :goto_a2
    if-eqz v9, :cond_b3

    .line 605
    const/16 v10, 0x5c

    invoke-virtual {p3, v10}, Ljava/io/Writer;->write(I)V

    .line 606
    invoke-static {v1, v6, v4}, Lorg/unbescape/css/CssIdentifierEscapeUtil;->toCompactHexa(ICI)[C

    move-result-object v10

    invoke-virtual {p3, v10}, Ljava/io/Writer;->write([C)V

    goto :goto_30

    .line 601
    .end local v6    # "next":C
    :cond_b1
    const/4 v6, 0x0

    goto :goto_a2

    .line 610
    .restart local v6    # "next":C
    :cond_b3
    const/16 v10, 0x5c

    invoke-virtual {p3, v10}, Ljava/io/Writer;->write(I)V

    .line 611
    invoke-static {v1, v6, v4}, Lorg/unbescape/css/CssIdentifierEscapeUtil;->toSixDigitHexa(ICI)[C

    move-result-object v10

    invoke-virtual {p3, v10}, Ljava/io/Writer;->write([C)V

    goto/16 :goto_30

    .line 622
    .end local v1    # "codepoint":I
    .end local v6    # "next":C
    :cond_c1
    sub-int v10, v5, v7

    if-lez v10, :cond_5

    .line 623
    sub-int v10, v5, v7

    invoke-virtual {p3, p0, v7, v10}, Ljava/io/Writer;->write([CII)V

    goto/16 :goto_5
.end method

.method static toCompactHexa(ICI)[C
    .registers 12
    .param p0, "codepoint"    # I
    .param p1, "next"    # C
    .param p2, "level"    # I

    .prologue
    const/16 v8, 0x30

    const/4 v5, 0x2

    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 279
    const/4 v4, 0x4

    if-ge p2, v4, :cond_29

    if-lt p1, v8, :cond_e

    const/16 v4, 0x39

    if-le p1, v4, :cond_1e

    :cond_e
    const/16 v4, 0x41

    if-lt p1, v4, :cond_16

    const/16 v4, 0x46

    if-le p1, v4, :cond_1e

    :cond_16
    const/16 v4, 0x61

    if-lt p1, v4, :cond_29

    const/16 v4, 0x66

    if-gt p1, v4, :cond_29

    :cond_1e
    move v2, v6

    .line 282
    .local v2, "needTrailingSpace":Z
    :goto_1f
    if-nez p0, :cond_30

    .line 283
    if-eqz v2, :cond_2b

    new-array v4, v5, [C

    fill-array-data v4, :array_70

    .line 302
    :goto_28
    return-object v4

    .end local v2    # "needTrailingSpace":Z
    :cond_29
    move v2, v7

    .line 279
    goto :goto_1f

    .line 283
    .restart local v2    # "needTrailingSpace":Z
    :cond_2b
    new-array v4, v6, [C

    aput-char v8, v4, v7

    goto :goto_28

    .line 285
    :cond_30
    const/16 v0, 0x14

    .line 286
    .local v0, "div":I
    const/4 v3, 0x0

    .line 287
    .local v3, "result":[C
    :goto_33
    if-nez v3, :cond_4a

    if-ltz v0, :cond_4a

    .line 288
    ushr-int v4, p0, v0

    rem-int/lit8 v4, v4, 0x10

    if-lez v4, :cond_45

    .line 289
    div-int/lit8 v7, v0, 0x4

    if-eqz v2, :cond_48

    move v4, v5

    :goto_42
    add-int/2addr v4, v7

    new-array v3, v4, [C

    .line 291
    :cond_45
    add-int/lit8 v0, v0, -0x4

    goto :goto_33

    :cond_48
    move v4, v6

    .line 289
    goto :goto_42

    .line 293
    :cond_4a
    const/4 v0, 0x0

    .line 294
    if-eqz v2, :cond_61

    array-length v4, v3

    add-int/lit8 v1, v4, -0x2

    .local v1, "i":I
    :goto_50
    if-ltz v1, :cond_65

    .line 295
    sget-object v4, Lorg/unbescape/css/CssIdentifierEscapeUtil;->HEXA_CHARS_UPPER:[C

    ushr-int v5, p0, v0

    rem-int/lit8 v5, v5, 0x10

    aget-char v4, v4, v5

    aput-char v4, v3, v1

    .line 296
    add-int/lit8 v0, v0, 0x4

    .line 294
    add-int/lit8 v1, v1, -0x1

    goto :goto_50

    .end local v1    # "i":I
    :cond_61
    array-length v4, v3

    add-int/lit8 v1, v4, -0x1

    goto :goto_50

    .line 298
    .restart local v1    # "i":I
    :cond_65
    if-eqz v2, :cond_6e

    .line 299
    array-length v4, v3

    add-int/lit8 v4, v4, -0x1

    const/16 v5, 0x20

    aput-char v5, v3, v4

    :cond_6e
    move-object v4, v3

    .line 302
    goto :goto_28

    .line 283
    :array_70
    .array-data 2
        0x30s
        0x20s
    .end array-data
.end method

.method static toSixDigitHexa(ICI)[C
    .registers 8
    .param p0, "codepoint"    # I
    .param p1, "next"    # C
    .param p2, "level"    # I

    .prologue
    .line 310
    const/4 v0, 0x0

    .line 312
    .local v0, "needTrailingSpace":Z
    const/4 v2, 0x6

    new-array v1, v2, [C

    .line 316
    .local v1, "result":[C
    const/4 v2, 0x5

    sget-object v3, Lorg/unbescape/css/CssIdentifierEscapeUtil;->HEXA_CHARS_UPPER:[C

    rem-int/lit8 v4, p0, 0x10

    aget-char v3, v3, v4

    aput-char v3, v1, v2

    .line 317
    const/4 v2, 0x4

    sget-object v3, Lorg/unbescape/css/CssIdentifierEscapeUtil;->HEXA_CHARS_UPPER:[C

    ushr-int/lit8 v4, p0, 0x4

    rem-int/lit8 v4, v4, 0x10

    aget-char v3, v3, v4

    aput-char v3, v1, v2

    .line 318
    const/4 v2, 0x3

    sget-object v3, Lorg/unbescape/css/CssIdentifierEscapeUtil;->HEXA_CHARS_UPPER:[C

    ushr-int/lit8 v4, p0, 0x8

    rem-int/lit8 v4, v4, 0x10

    aget-char v3, v3, v4

    aput-char v3, v1, v2

    .line 319
    const/4 v2, 0x2

    sget-object v3, Lorg/unbescape/css/CssIdentifierEscapeUtil;->HEXA_CHARS_UPPER:[C

    ushr-int/lit8 v4, p0, 0xc

    rem-int/lit8 v4, v4, 0x10

    aget-char v3, v3, v4

    aput-char v3, v1, v2

    .line 320
    const/4 v2, 0x1

    sget-object v3, Lorg/unbescape/css/CssIdentifierEscapeUtil;->HEXA_CHARS_UPPER:[C

    ushr-int/lit8 v4, p0, 0x10

    rem-int/lit8 v4, v4, 0x10

    aget-char v3, v3, v4

    aput-char v3, v1, v2

    .line 321
    const/4 v2, 0x0

    sget-object v3, Lorg/unbescape/css/CssIdentifierEscapeUtil;->HEXA_CHARS_UPPER:[C

    ushr-int/lit8 v4, p0, 0x14

    rem-int/lit8 v4, v4, 0x10

    aget-char v3, v3, v4

    aput-char v3, v1, v2

    .line 322
    return-object v1
.end method
