.class public final Lcom/sun/mail/auth/MD4;
.super Ljava/lang/Object;
.source "MD4.java"


# static fields
.field private static final S11:I = 0x3

.field private static final S12:I = 0x7

.field private static final S13:I = 0xb

.field private static final S14:I = 0x13

.field private static final S21:I = 0x3

.field private static final S22:I = 0x5

.field private static final S23:I = 0x9

.field private static final S24:I = 0xd

.field private static final S31:I = 0x3

.field private static final S32:I = 0x9

.field private static final S33:I = 0xb

.field private static final S34:I = 0xf

.field private static final blockSize:I = 0x40

.field private static final padding:[B


# instance fields
.field private bufOfs:I

.field private final buffer:[B

.field private bytesProcessed:J

.field private final state:[I

.field private final x:[I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 97
    const/16 v0, 0x88

    new-array v0, v0, [B

    sput-object v0, Lcom/sun/mail/auth/MD4;->padding:[B

    .line 98
    sget-object v0, Lcom/sun/mail/auth/MD4;->padding:[B

    const/4 v1, 0x0

    const/16 v2, -0x80

    aput-byte v2, v0, v1

    .line 99
    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 104
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    const/16 v0, 0x40

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/sun/mail/auth/MD4;->buffer:[B

    .line 105
    const/4 v0, 0x4

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/sun/mail/auth/MD4;->state:[I

    .line 106
    const/16 v0, 0x10

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/sun/mail/auth/MD4;->x:[I

    .line 107
    invoke-direct {p0}, Lcom/sun/mail/auth/MD4;->implReset()V

    .line 108
    return-void
.end method

.method private static FF(IIIIII)I
    .registers 8
    .param p0, "a"    # I
    .param p1, "b"    # I
    .param p2, "c"    # I
    .param p3, "d"    # I
    .param p4, "x"    # I
    .param p5, "s"    # I

    .prologue
    .line 209
    and-int v0, p1, p2

    xor-int/lit8 v1, p1, -0x1

    and-int/2addr v1, p3

    or-int/2addr v0, v1

    add-int/2addr v0, p4

    add-int/2addr p0, v0

    .line 210
    shl-int v0, p0, p5

    rsub-int/lit8 v1, p5, 0x20

    ushr-int v1, p0, v1

    or-int/2addr v0, v1

    return v0
.end method

.method private static GG(IIIIII)I
    .registers 8
    .param p0, "a"    # I
    .param p1, "b"    # I
    .param p2, "c"    # I
    .param p3, "d"    # I
    .param p4, "x"    # I
    .param p5, "s"    # I

    .prologue
    .line 214
    and-int v0, p1, p2

    and-int v1, p1, p3

    or-int/2addr v0, v1

    and-int v1, p2, p3

    or-int/2addr v0, v1

    add-int/2addr v0, p4

    const v1, 0x5a827999

    add-int/2addr v0, v1

    add-int/2addr p0, v0

    .line 215
    shl-int v0, p0, p5

    rsub-int/lit8 v1, p5, 0x20

    ushr-int v1, p0, v1

    or-int/2addr v0, v1

    return v0
.end method

.method private static HH(IIIIII)I
    .registers 8
    .param p0, "a"    # I
    .param p1, "b"    # I
    .param p2, "c"    # I
    .param p3, "d"    # I
    .param p4, "x"    # I
    .param p5, "s"    # I

    .prologue
    .line 219
    xor-int v0, p1, p2

    xor-int/2addr v0, p3

    add-int/2addr v0, p4

    const v1, 0x6ed9eba1

    add-int/2addr v0, v1

    add-int/2addr p0, v0

    .line 220
    shl-int v0, p0, p5

    rsub-int/lit8 v1, p5, 0x20

    ushr-int v1, p0, v1

    or-int/2addr v0, v1

    return v0
.end method

.method private engineUpdate([BII)V
    .registers 11
    .param p1, "b"    # [B
    .param p2, "ofs"    # I
    .param p3, "len"    # I

    .prologue
    const/16 v6, 0x40

    const/4 v5, 0x0

    .line 172
    if-nez p3, :cond_6

    .line 206
    :cond_5
    :goto_5
    return-void

    .line 175
    :cond_6
    if-ltz p2, :cond_e

    if-ltz p3, :cond_e

    array-length v1, p1

    sub-int/2addr v1, p3

    if-le p2, v1, :cond_14

    .line 176
    :cond_e
    new-instance v1, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>()V

    throw v1

    .line 178
    :cond_14
    iget-wide v1, p0, Lcom/sun/mail/auth/MD4;->bytesProcessed:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-gez v1, :cond_1f

    .line 179
    invoke-direct {p0}, Lcom/sun/mail/auth/MD4;->implReset()V

    .line 181
    :cond_1f
    iget-wide v1, p0, Lcom/sun/mail/auth/MD4;->bytesProcessed:J

    int-to-long v3, p3

    add-long/2addr v1, v3

    iput-wide v1, p0, Lcom/sun/mail/auth/MD4;->bytesProcessed:J

    .line 183
    iget v1, p0, Lcom/sun/mail/auth/MD4;->bufOfs:I

    if-eqz v1, :cond_4a

    .line 184
    iget v1, p0, Lcom/sun/mail/auth/MD4;->bufOfs:I

    rsub-int/lit8 v1, v1, 0x40

    invoke-static {p3, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 185
    .local v0, "n":I
    iget-object v1, p0, Lcom/sun/mail/auth/MD4;->buffer:[B

    iget v2, p0, Lcom/sun/mail/auth/MD4;->bufOfs:I

    invoke-static {p1, p2, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 186
    iget v1, p0, Lcom/sun/mail/auth/MD4;->bufOfs:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/sun/mail/auth/MD4;->bufOfs:I

    .line 187
    add-int/2addr p2, v0

    .line 188
    sub-int/2addr p3, v0

    .line 189
    iget v1, p0, Lcom/sun/mail/auth/MD4;->bufOfs:I

    if-lt v1, v6, :cond_4a

    .line 191
    iget-object v1, p0, Lcom/sun/mail/auth/MD4;->buffer:[B

    invoke-direct {p0, v1, v5}, Lcom/sun/mail/auth/MD4;->implCompress([BI)V

    .line 192
    iput v5, p0, Lcom/sun/mail/auth/MD4;->bufOfs:I

    .line 196
    .end local v0    # "n":I
    :cond_4a
    :goto_4a
    if-lt p3, v6, :cond_54

    .line 197
    invoke-direct {p0, p1, p2}, Lcom/sun/mail/auth/MD4;->implCompress([BI)V

    .line 198
    add-int/lit8 p3, p3, -0x40

    .line 199
    add-int/lit8 p2, p2, 0x40

    goto :goto_4a

    .line 202
    :cond_54
    if-lez p3, :cond_5

    .line 203
    iget-object v1, p0, Lcom/sun/mail/auth/MD4;->buffer:[B

    invoke-static {p1, p2, v1, v5, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 204
    iput p3, p0, Lcom/sun/mail/auth/MD4;->bufOfs:I

    goto :goto_5
.end method

.method private implCompress([BI)V
    .registers 13
    .param p1, "buf"    # [B
    .param p2, "ofs"    # I

    .prologue
    .line 230
    const/4 v9, 0x0

    .local v9, "xfs":I
    :goto_1
    iget-object v4, p0, Lcom/sun/mail/auth/MD4;->x:[I

    array-length v4, v4

    if-ge v9, v4, :cond_2e

    .line 231
    iget-object v4, p0, Lcom/sun/mail/auth/MD4;->x:[I

    aget-byte v5, p1, p2

    and-int/lit16 v5, v5, 0xff

    add-int/lit8 v6, p2, 0x1

    aget-byte v6, p1, v6

    and-int/lit16 v6, v6, 0xff

    shl-int/lit8 v6, v6, 0x8

    or-int/2addr v5, v6

    add-int/lit8 v6, p2, 0x2

    aget-byte v6, p1, v6

    and-int/lit16 v6, v6, 0xff

    shl-int/lit8 v6, v6, 0x10

    or-int/2addr v5, v6

    add-int/lit8 v6, p2, 0x3

    aget-byte v6, p1, v6

    and-int/lit16 v6, v6, 0xff

    shl-int/lit8 v6, v6, 0x18

    or-int/2addr v5, v6

    aput v5, v4, v9

    .line 233
    add-int/lit8 p2, p2, 0x4

    .line 230
    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    .line 236
    :cond_2e
    iget-object v4, p0, Lcom/sun/mail/auth/MD4;->state:[I

    const/4 v5, 0x0

    aget v0, v4, v5

    .line 237
    .local v0, "a":I
    iget-object v4, p0, Lcom/sun/mail/auth/MD4;->state:[I

    const/4 v5, 0x1

    aget v1, v4, v5

    .line 238
    .local v1, "b":I
    iget-object v4, p0, Lcom/sun/mail/auth/MD4;->state:[I

    const/4 v5, 0x2

    aget v2, v4, v5

    .line 239
    .local v2, "c":I
    iget-object v4, p0, Lcom/sun/mail/auth/MD4;->state:[I

    const/4 v5, 0x3

    aget v3, v4, v5

    .line 242
    .local v3, "d":I
    iget-object v4, p0, Lcom/sun/mail/auth/MD4;->x:[I

    const/4 v5, 0x0

    aget v4, v4, v5

    const/4 v5, 0x3

    invoke-static/range {v0 .. v5}, Lcom/sun/mail/auth/MD4;->FF(IIIIII)I

    move-result v0

    .line 243
    iget-object v4, p0, Lcom/sun/mail/auth/MD4;->x:[I

    const/4 v5, 0x1

    aget v7, v4, v5

    const/4 v8, 0x7

    move v4, v0

    move v5, v1

    move v6, v2

    invoke-static/range {v3 .. v8}, Lcom/sun/mail/auth/MD4;->FF(IIIIII)I

    move-result v3

    .line 244
    iget-object v4, p0, Lcom/sun/mail/auth/MD4;->x:[I

    const/4 v5, 0x2

    aget v6, v4, v5

    const/16 v7, 0xb

    move v4, v0

    move v5, v1

    invoke-static/range {v2 .. v7}, Lcom/sun/mail/auth/MD4;->FF(IIIIII)I

    move-result v2

    .line 245
    iget-object v4, p0, Lcom/sun/mail/auth/MD4;->x:[I

    const/4 v5, 0x3

    aget v5, v4, v5

    const/16 v6, 0x13

    move v4, v0

    invoke-static/range {v1 .. v6}, Lcom/sun/mail/auth/MD4;->FF(IIIIII)I

    move-result v1

    .line 246
    iget-object v4, p0, Lcom/sun/mail/auth/MD4;->x:[I

    const/4 v5, 0x4

    aget v4, v4, v5

    const/4 v5, 0x3

    invoke-static/range {v0 .. v5}, Lcom/sun/mail/auth/MD4;->FF(IIIIII)I

    move-result v0

    .line 247
    iget-object v4, p0, Lcom/sun/mail/auth/MD4;->x:[I

    const/4 v5, 0x5

    aget v7, v4, v5

    const/4 v8, 0x7

    move v4, v0

    move v5, v1

    move v6, v2

    invoke-static/range {v3 .. v8}, Lcom/sun/mail/auth/MD4;->FF(IIIIII)I

    move-result v3

    .line 248
    iget-object v4, p0, Lcom/sun/mail/auth/MD4;->x:[I

    const/4 v5, 0x6

    aget v6, v4, v5

    const/16 v7, 0xb

    move v4, v0

    move v5, v1

    invoke-static/range {v2 .. v7}, Lcom/sun/mail/auth/MD4;->FF(IIIIII)I

    move-result v2

    .line 249
    iget-object v4, p0, Lcom/sun/mail/auth/MD4;->x:[I

    const/4 v5, 0x7

    aget v5, v4, v5

    const/16 v6, 0x13

    move v4, v0

    invoke-static/range {v1 .. v6}, Lcom/sun/mail/auth/MD4;->FF(IIIIII)I

    move-result v1

    .line 250
    iget-object v4, p0, Lcom/sun/mail/auth/MD4;->x:[I

    const/16 v5, 0x8

    aget v4, v4, v5

    const/4 v5, 0x3

    invoke-static/range {v0 .. v5}, Lcom/sun/mail/auth/MD4;->FF(IIIIII)I

    move-result v0

    .line 251
    iget-object v4, p0, Lcom/sun/mail/auth/MD4;->x:[I

    const/16 v5, 0x9

    aget v7, v4, v5

    const/4 v8, 0x7

    move v4, v0

    move v5, v1

    move v6, v2

    invoke-static/range {v3 .. v8}, Lcom/sun/mail/auth/MD4;->FF(IIIIII)I

    move-result v3

    .line 252
    iget-object v4, p0, Lcom/sun/mail/auth/MD4;->x:[I

    const/16 v5, 0xa

    aget v6, v4, v5

    const/16 v7, 0xb

    move v4, v0

    move v5, v1

    invoke-static/range {v2 .. v7}, Lcom/sun/mail/auth/MD4;->FF(IIIIII)I

    move-result v2

    .line 253
    iget-object v4, p0, Lcom/sun/mail/auth/MD4;->x:[I

    const/16 v5, 0xb

    aget v5, v4, v5

    const/16 v6, 0x13

    move v4, v0

    invoke-static/range {v1 .. v6}, Lcom/sun/mail/auth/MD4;->FF(IIIIII)I

    move-result v1

    .line 254
    iget-object v4, p0, Lcom/sun/mail/auth/MD4;->x:[I

    const/16 v5, 0xc

    aget v4, v4, v5

    const/4 v5, 0x3

    invoke-static/range {v0 .. v5}, Lcom/sun/mail/auth/MD4;->FF(IIIIII)I

    move-result v0

    .line 255
    iget-object v4, p0, Lcom/sun/mail/auth/MD4;->x:[I

    const/16 v5, 0xd

    aget v7, v4, v5

    const/4 v8, 0x7

    move v4, v0

    move v5, v1

    move v6, v2

    invoke-static/range {v3 .. v8}, Lcom/sun/mail/auth/MD4;->FF(IIIIII)I

    move-result v3

    .line 256
    iget-object v4, p0, Lcom/sun/mail/auth/MD4;->x:[I

    const/16 v5, 0xe

    aget v6, v4, v5

    const/16 v7, 0xb

    move v4, v0

    move v5, v1

    invoke-static/range {v2 .. v7}, Lcom/sun/mail/auth/MD4;->FF(IIIIII)I

    move-result v2

    .line 257
    iget-object v4, p0, Lcom/sun/mail/auth/MD4;->x:[I

    const/16 v5, 0xf

    aget v5, v4, v5

    const/16 v6, 0x13

    move v4, v0

    invoke-static/range {v1 .. v6}, Lcom/sun/mail/auth/MD4;->FF(IIIIII)I

    move-result v1

    .line 260
    iget-object v4, p0, Lcom/sun/mail/auth/MD4;->x:[I

    const/4 v5, 0x0

    aget v4, v4, v5

    const/4 v5, 0x3

    invoke-static/range {v0 .. v5}, Lcom/sun/mail/auth/MD4;->GG(IIIIII)I

    move-result v0

    .line 261
    iget-object v4, p0, Lcom/sun/mail/auth/MD4;->x:[I

    const/4 v5, 0x4

    aget v7, v4, v5

    const/4 v8, 0x5

    move v4, v0

    move v5, v1

    move v6, v2

    invoke-static/range {v3 .. v8}, Lcom/sun/mail/auth/MD4;->GG(IIIIII)I

    move-result v3

    .line 262
    iget-object v4, p0, Lcom/sun/mail/auth/MD4;->x:[I

    const/16 v5, 0x8

    aget v6, v4, v5

    const/16 v7, 0x9

    move v4, v0

    move v5, v1

    invoke-static/range {v2 .. v7}, Lcom/sun/mail/auth/MD4;->GG(IIIIII)I

    move-result v2

    .line 263
    iget-object v4, p0, Lcom/sun/mail/auth/MD4;->x:[I

    const/16 v5, 0xc

    aget v5, v4, v5

    const/16 v6, 0xd

    move v4, v0

    invoke-static/range {v1 .. v6}, Lcom/sun/mail/auth/MD4;->GG(IIIIII)I

    move-result v1

    .line 264
    iget-object v4, p0, Lcom/sun/mail/auth/MD4;->x:[I

    const/4 v5, 0x1

    aget v4, v4, v5

    const/4 v5, 0x3

    invoke-static/range {v0 .. v5}, Lcom/sun/mail/auth/MD4;->GG(IIIIII)I

    move-result v0

    .line 265
    iget-object v4, p0, Lcom/sun/mail/auth/MD4;->x:[I

    const/4 v5, 0x5

    aget v7, v4, v5

    const/4 v8, 0x5

    move v4, v0

    move v5, v1

    move v6, v2

    invoke-static/range {v3 .. v8}, Lcom/sun/mail/auth/MD4;->GG(IIIIII)I

    move-result v3

    .line 266
    iget-object v4, p0, Lcom/sun/mail/auth/MD4;->x:[I

    const/16 v5, 0x9

    aget v6, v4, v5

    const/16 v7, 0x9

    move v4, v0

    move v5, v1

    invoke-static/range {v2 .. v7}, Lcom/sun/mail/auth/MD4;->GG(IIIIII)I

    move-result v2

    .line 267
    iget-object v4, p0, Lcom/sun/mail/auth/MD4;->x:[I

    const/16 v5, 0xd

    aget v5, v4, v5

    const/16 v6, 0xd

    move v4, v0

    invoke-static/range {v1 .. v6}, Lcom/sun/mail/auth/MD4;->GG(IIIIII)I

    move-result v1

    .line 268
    iget-object v4, p0, Lcom/sun/mail/auth/MD4;->x:[I

    const/4 v5, 0x2

    aget v4, v4, v5

    const/4 v5, 0x3

    invoke-static/range {v0 .. v5}, Lcom/sun/mail/auth/MD4;->GG(IIIIII)I

    move-result v0

    .line 269
    iget-object v4, p0, Lcom/sun/mail/auth/MD4;->x:[I

    const/4 v5, 0x6

    aget v7, v4, v5

    const/4 v8, 0x5

    move v4, v0

    move v5, v1

    move v6, v2

    invoke-static/range {v3 .. v8}, Lcom/sun/mail/auth/MD4;->GG(IIIIII)I

    move-result v3

    .line 270
    iget-object v4, p0, Lcom/sun/mail/auth/MD4;->x:[I

    const/16 v5, 0xa

    aget v6, v4, v5

    const/16 v7, 0x9

    move v4, v0

    move v5, v1

    invoke-static/range {v2 .. v7}, Lcom/sun/mail/auth/MD4;->GG(IIIIII)I

    move-result v2

    .line 271
    iget-object v4, p0, Lcom/sun/mail/auth/MD4;->x:[I

    const/16 v5, 0xe

    aget v5, v4, v5

    const/16 v6, 0xd

    move v4, v0

    invoke-static/range {v1 .. v6}, Lcom/sun/mail/auth/MD4;->GG(IIIIII)I

    move-result v1

    .line 272
    iget-object v4, p0, Lcom/sun/mail/auth/MD4;->x:[I

    const/4 v5, 0x3

    aget v4, v4, v5

    const/4 v5, 0x3

    invoke-static/range {v0 .. v5}, Lcom/sun/mail/auth/MD4;->GG(IIIIII)I

    move-result v0

    .line 273
    iget-object v4, p0, Lcom/sun/mail/auth/MD4;->x:[I

    const/4 v5, 0x7

    aget v7, v4, v5

    const/4 v8, 0x5

    move v4, v0

    move v5, v1

    move v6, v2

    invoke-static/range {v3 .. v8}, Lcom/sun/mail/auth/MD4;->GG(IIIIII)I

    move-result v3

    .line 274
    iget-object v4, p0, Lcom/sun/mail/auth/MD4;->x:[I

    const/16 v5, 0xb

    aget v6, v4, v5

    const/16 v7, 0x9

    move v4, v0

    move v5, v1

    invoke-static/range {v2 .. v7}, Lcom/sun/mail/auth/MD4;->GG(IIIIII)I

    move-result v2

    .line 275
    iget-object v4, p0, Lcom/sun/mail/auth/MD4;->x:[I

    const/16 v5, 0xf

    aget v5, v4, v5

    const/16 v6, 0xd

    move v4, v0

    invoke-static/range {v1 .. v6}, Lcom/sun/mail/auth/MD4;->GG(IIIIII)I

    move-result v1

    .line 278
    iget-object v4, p0, Lcom/sun/mail/auth/MD4;->x:[I

    const/4 v5, 0x0

    aget v4, v4, v5

    const/4 v5, 0x3

    invoke-static/range {v0 .. v5}, Lcom/sun/mail/auth/MD4;->HH(IIIIII)I

    move-result v0

    .line 279
    iget-object v4, p0, Lcom/sun/mail/auth/MD4;->x:[I

    const/16 v5, 0x8

    aget v7, v4, v5

    const/16 v8, 0x9

    move v4, v0

    move v5, v1

    move v6, v2

    invoke-static/range {v3 .. v8}, Lcom/sun/mail/auth/MD4;->HH(IIIIII)I

    move-result v3

    .line 280
    iget-object v4, p0, Lcom/sun/mail/auth/MD4;->x:[I

    const/4 v5, 0x4

    aget v6, v4, v5

    const/16 v7, 0xb

    move v4, v0

    move v5, v1

    invoke-static/range {v2 .. v7}, Lcom/sun/mail/auth/MD4;->HH(IIIIII)I

    move-result v2

    .line 281
    iget-object v4, p0, Lcom/sun/mail/auth/MD4;->x:[I

    const/16 v5, 0xc

    aget v5, v4, v5

    const/16 v6, 0xf

    move v4, v0

    invoke-static/range {v1 .. v6}, Lcom/sun/mail/auth/MD4;->HH(IIIIII)I

    move-result v1

    .line 282
    iget-object v4, p0, Lcom/sun/mail/auth/MD4;->x:[I

    const/4 v5, 0x2

    aget v4, v4, v5

    const/4 v5, 0x3

    invoke-static/range {v0 .. v5}, Lcom/sun/mail/auth/MD4;->HH(IIIIII)I

    move-result v0

    .line 283
    iget-object v4, p0, Lcom/sun/mail/auth/MD4;->x:[I

    const/16 v5, 0xa

    aget v7, v4, v5

    const/16 v8, 0x9

    move v4, v0

    move v5, v1

    move v6, v2

    invoke-static/range {v3 .. v8}, Lcom/sun/mail/auth/MD4;->HH(IIIIII)I

    move-result v3

    .line 284
    iget-object v4, p0, Lcom/sun/mail/auth/MD4;->x:[I

    const/4 v5, 0x6

    aget v6, v4, v5

    const/16 v7, 0xb

    move v4, v0

    move v5, v1

    invoke-static/range {v2 .. v7}, Lcom/sun/mail/auth/MD4;->HH(IIIIII)I

    move-result v2

    .line 285
    iget-object v4, p0, Lcom/sun/mail/auth/MD4;->x:[I

    const/16 v5, 0xe

    aget v5, v4, v5

    const/16 v6, 0xf

    move v4, v0

    invoke-static/range {v1 .. v6}, Lcom/sun/mail/auth/MD4;->HH(IIIIII)I

    move-result v1

    .line 286
    iget-object v4, p0, Lcom/sun/mail/auth/MD4;->x:[I

    const/4 v5, 0x1

    aget v4, v4, v5

    const/4 v5, 0x3

    invoke-static/range {v0 .. v5}, Lcom/sun/mail/auth/MD4;->HH(IIIIII)I

    move-result v0

    .line 287
    iget-object v4, p0, Lcom/sun/mail/auth/MD4;->x:[I

    const/16 v5, 0x9

    aget v7, v4, v5

    const/16 v8, 0x9

    move v4, v0

    move v5, v1

    move v6, v2

    invoke-static/range {v3 .. v8}, Lcom/sun/mail/auth/MD4;->HH(IIIIII)I

    move-result v3

    .line 288
    iget-object v4, p0, Lcom/sun/mail/auth/MD4;->x:[I

    const/4 v5, 0x5

    aget v6, v4, v5

    const/16 v7, 0xb

    move v4, v0

    move v5, v1

    invoke-static/range {v2 .. v7}, Lcom/sun/mail/auth/MD4;->HH(IIIIII)I

    move-result v2

    .line 289
    iget-object v4, p0, Lcom/sun/mail/auth/MD4;->x:[I

    const/16 v5, 0xd

    aget v5, v4, v5

    const/16 v6, 0xf

    move v4, v0

    invoke-static/range {v1 .. v6}, Lcom/sun/mail/auth/MD4;->HH(IIIIII)I

    move-result v1

    .line 290
    iget-object v4, p0, Lcom/sun/mail/auth/MD4;->x:[I

    const/4 v5, 0x3

    aget v4, v4, v5

    const/4 v5, 0x3

    invoke-static/range {v0 .. v5}, Lcom/sun/mail/auth/MD4;->HH(IIIIII)I

    move-result v0

    .line 291
    iget-object v4, p0, Lcom/sun/mail/auth/MD4;->x:[I

    const/16 v5, 0xb

    aget v7, v4, v5

    const/16 v8, 0x9

    move v4, v0

    move v5, v1

    move v6, v2

    invoke-static/range {v3 .. v8}, Lcom/sun/mail/auth/MD4;->HH(IIIIII)I

    move-result v3

    .line 292
    iget-object v4, p0, Lcom/sun/mail/auth/MD4;->x:[I

    const/4 v5, 0x7

    aget v6, v4, v5

    const/16 v7, 0xb

    move v4, v0

    move v5, v1

    invoke-static/range {v2 .. v7}, Lcom/sun/mail/auth/MD4;->HH(IIIIII)I

    move-result v2

    .line 293
    iget-object v4, p0, Lcom/sun/mail/auth/MD4;->x:[I

    const/16 v5, 0xf

    aget v5, v4, v5

    const/16 v6, 0xf

    move v4, v0

    invoke-static/range {v1 .. v6}, Lcom/sun/mail/auth/MD4;->HH(IIIIII)I

    move-result v1

    .line 295
    iget-object v4, p0, Lcom/sun/mail/auth/MD4;->state:[I

    const/4 v5, 0x0

    aget v6, v4, v5

    add-int/2addr v6, v0

    aput v6, v4, v5

    .line 296
    iget-object v4, p0, Lcom/sun/mail/auth/MD4;->state:[I

    const/4 v5, 0x1

    aget v6, v4, v5

    add-int/2addr v6, v1

    aput v6, v4, v5

    .line 297
    iget-object v4, p0, Lcom/sun/mail/auth/MD4;->state:[I

    const/4 v5, 0x2

    aget v6, v4, v5

    add-int/2addr v6, v2

    aput v6, v4, v5

    .line 298
    iget-object v4, p0, Lcom/sun/mail/auth/MD4;->state:[I

    const/4 v5, 0x3

    aget v6, v4, v5

    add-int/2addr v6, v3

    aput v6, v4, v5

    .line 299
    return-void
.end method

.method private implDigest([BI)V
    .registers 16
    .param p1, "out"    # [B
    .param p2, "ofs"    # I

    .prologue
    const/4 v12, 0x0

    const/16 v11, 0x38

    .line 143
    iget-wide v7, p0, Lcom/sun/mail/auth/MD4;->bytesProcessed:J

    const/4 v9, 0x3

    shl-long v0, v7, v9

    .line 145
    .local v0, "bitsProcessed":J
    iget-wide v7, p0, Lcom/sun/mail/auth/MD4;->bytesProcessed:J

    long-to-int v7, v7

    and-int/lit8 v3, v7, 0x3f

    .line 146
    .local v3, "index":I
    if-ge v3, v11, :cond_9a

    rsub-int/lit8 v5, v3, 0x38

    .line 147
    .local v5, "padLen":I
    :goto_11
    sget-object v7, Lcom/sun/mail/auth/MD4;->padding:[B

    invoke-direct {p0, v7, v12, v5}, Lcom/sun/mail/auth/MD4;->engineUpdate([BII)V

    .line 151
    iget-object v7, p0, Lcom/sun/mail/auth/MD4;->buffer:[B

    long-to-int v8, v0

    int-to-byte v8, v8

    aput-byte v8, v7, v11

    .line 152
    iget-object v7, p0, Lcom/sun/mail/auth/MD4;->buffer:[B

    const/16 v8, 0x39

    const/16 v9, 0x8

    shr-long v9, v0, v9

    long-to-int v9, v9

    int-to-byte v9, v9

    aput-byte v9, v7, v8

    .line 153
    iget-object v7, p0, Lcom/sun/mail/auth/MD4;->buffer:[B

    const/16 v8, 0x3a

    const/16 v9, 0x10

    shr-long v9, v0, v9

    long-to-int v9, v9

    int-to-byte v9, v9

    aput-byte v9, v7, v8

    .line 154
    iget-object v7, p0, Lcom/sun/mail/auth/MD4;->buffer:[B

    const/16 v8, 0x3b

    const/16 v9, 0x18

    shr-long v9, v0, v9

    long-to-int v9, v9

    int-to-byte v9, v9

    aput-byte v9, v7, v8

    .line 155
    iget-object v7, p0, Lcom/sun/mail/auth/MD4;->buffer:[B

    const/16 v8, 0x3c

    const/16 v9, 0x20

    shr-long v9, v0, v9

    long-to-int v9, v9

    int-to-byte v9, v9

    aput-byte v9, v7, v8

    .line 156
    iget-object v7, p0, Lcom/sun/mail/auth/MD4;->buffer:[B

    const/16 v8, 0x3d

    const/16 v9, 0x28

    shr-long v9, v0, v9

    long-to-int v9, v9

    int-to-byte v9, v9

    aput-byte v9, v7, v8

    .line 157
    iget-object v7, p0, Lcom/sun/mail/auth/MD4;->buffer:[B

    const/16 v8, 0x3e

    const/16 v9, 0x30

    shr-long v9, v0, v9

    long-to-int v9, v9

    int-to-byte v9, v9

    aput-byte v9, v7, v8

    .line 158
    iget-object v7, p0, Lcom/sun/mail/auth/MD4;->buffer:[B

    const/16 v8, 0x3f

    shr-long v9, v0, v11

    long-to-int v9, v9

    int-to-byte v9, v9

    aput-byte v9, v7, v8

    .line 159
    iget-object v7, p0, Lcom/sun/mail/auth/MD4;->buffer:[B

    invoke-direct {p0, v7, v12}, Lcom/sun/mail/auth/MD4;->implCompress([BI)V

    .line 162
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_74
    iget-object v7, p0, Lcom/sun/mail/auth/MD4;->state:[I

    array-length v7, v7

    if-ge v2, v7, :cond_9e

    .line 163
    iget-object v7, p0, Lcom/sun/mail/auth/MD4;->state:[I

    aget v6, v7, v2

    .line 164
    .local v6, "x":I
    add-int/lit8 v4, p2, 0x1

    .end local p2    # "ofs":I
    .local v4, "ofs":I
    int-to-byte v7, v6

    aput-byte v7, p1, p2

    .line 165
    add-int/lit8 p2, v4, 0x1

    .end local v4    # "ofs":I
    .restart local p2    # "ofs":I
    shr-int/lit8 v7, v6, 0x8

    int-to-byte v7, v7

    aput-byte v7, p1, v4

    .line 166
    add-int/lit8 v4, p2, 0x1

    .end local p2    # "ofs":I
    .restart local v4    # "ofs":I
    shr-int/lit8 v7, v6, 0x10

    int-to-byte v7, v7

    aput-byte v7, p1, p2

    .line 167
    add-int/lit8 p2, v4, 0x1

    .end local v4    # "ofs":I
    .restart local p2    # "ofs":I
    shr-int/lit8 v7, v6, 0x18

    int-to-byte v7, v7

    aput-byte v7, p1, v4

    .line 162
    add-int/lit8 v2, v2, 0x1

    goto :goto_74

    .line 146
    .end local v2    # "i":I
    .end local v5    # "padLen":I
    .end local v6    # "x":I
    :cond_9a
    rsub-int/lit8 v5, v3, 0x78

    goto/16 :goto_11

    .line 169
    .restart local v2    # "i":I
    .restart local v5    # "padLen":I
    :cond_9e
    return-void
.end method

.method private implReset()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 129
    iget-object v0, p0, Lcom/sun/mail/auth/MD4;->state:[I

    const v1, 0x67452301

    aput v1, v0, v3

    .line 130
    iget-object v0, p0, Lcom/sun/mail/auth/MD4;->state:[I

    const/4 v1, 0x1

    const v2, -0x10325477

    aput v2, v0, v1

    .line 131
    iget-object v0, p0, Lcom/sun/mail/auth/MD4;->state:[I

    const/4 v1, 0x2

    const v2, -0x67452302

    aput v2, v0, v1

    .line 132
    iget-object v0, p0, Lcom/sun/mail/auth/MD4;->state:[I

    const/4 v1, 0x3

    const v2, 0x10325476

    aput v2, v0, v1

    .line 133
    iput v3, p0, Lcom/sun/mail/auth/MD4;->bufOfs:I

    .line 134
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/sun/mail/auth/MD4;->bytesProcessed:J

    .line 135
    return-void
.end method


# virtual methods
.method public digest([B)[B
    .registers 5
    .param p1, "in"    # [B

    .prologue
    const/4 v2, 0x0

    .line 117
    invoke-direct {p0}, Lcom/sun/mail/auth/MD4;->implReset()V

    .line 118
    array-length v1, p1

    invoke-direct {p0, p1, v2, v1}, Lcom/sun/mail/auth/MD4;->engineUpdate([BII)V

    .line 119
    const/16 v1, 0x10

    new-array v0, v1, [B

    .line 120
    .local v0, "out":[B
    invoke-direct {p0, v0, v2}, Lcom/sun/mail/auth/MD4;->implDigest([BI)V

    .line 121
    return-object v0
.end method
