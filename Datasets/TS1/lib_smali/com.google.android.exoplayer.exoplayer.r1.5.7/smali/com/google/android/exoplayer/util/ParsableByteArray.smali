.class public final Lcom/google/android/exoplayer/util/ParsableByteArray;
.super Ljava/lang/Object;
.source "ParsableByteArray.java"


# instance fields
.field public data:[B

.field private limit:I

.field private position:I


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(I)V
    .registers 3
    .param p1, "length"    # I

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    new-array v0, p1, [B

    iput-object v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    .line 38
    iget-object v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    array-length v0, v0

    iput v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->limit:I

    .line 39
    return-void
.end method

.method public constructor <init>([B)V
    .registers 3
    .param p1, "data"    # [B

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-object p1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    .line 44
    array-length v0, p1

    iput v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->limit:I

    .line 45
    return-void
.end method

.method public constructor <init>([BI)V
    .registers 3
    .param p1, "data"    # [B
    .param p2, "limit"    # I

    .prologue
    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    iput-object p1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    .line 55
    iput p2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->limit:I

    .line 56
    return-void
.end method


# virtual methods
.method public bytesLeft()I
    .registers 3

    .prologue
    .line 80
    iget v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->limit:I

    iget v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public capacity()I
    .registers 2

    .prologue
    .line 105
    iget-object v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    array-length v0, v0

    goto :goto_5
.end method

.method public getPosition()I
    .registers 2

    .prologue
    .line 100
    iget v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    return v0
.end method

.method public limit()I
    .registers 2

    .prologue
    .line 85
    iget v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->limit:I

    return v0
.end method

.method public readBytes(Lcom/google/android/exoplayer/util/ParsableBitArray;I)V
    .registers 5
    .param p1, "bitArray"    # Lcom/google/android/exoplayer/util/ParsableBitArray;
    .param p2, "length"    # I

    .prologue
    const/4 v1, 0x0

    .line 139
    iget-object v0, p1, Lcom/google/android/exoplayer/util/ParsableBitArray;->data:[B

    invoke-virtual {p0, v0, v1, p2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readBytes([BII)V

    .line 140
    invoke-virtual {p1, v1}, Lcom/google/android/exoplayer/util/ParsableBitArray;->setPosition(I)V

    .line 141
    return-void
.end method

.method public readBytes(Ljava/nio/ByteBuffer;I)V
    .registers 5
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;
    .param p2, "length"    # I

    .prologue
    .line 159
    iget-object v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    invoke-virtual {p1, v0, v1, p2}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 160
    iget v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/2addr v0, p2

    iput v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    .line 161
    return-void
.end method

.method public readBytes([BII)V
    .registers 6
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    .line 149
    iget-object v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    invoke-static {v0, v1, p1, p2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 150
    iget v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/2addr v0, p3

    iput v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    .line 151
    return-void
.end method

.method public readInt()I
    .registers 5

    .prologue
    .line 229
    iget-object v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    shl-int/lit8 v0, v0, 0x18

    iget-object v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    aget-byte v1, v1, v2

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x10

    or-int/2addr v0, v1

    iget-object v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    aget-byte v1, v1, v2

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    iget-object v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    aget-byte v1, v1, v2

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    return v0
.end method

.method public readLine()Ljava/lang/String;
    .registers 8

    .prologue
    const/16 v6, 0xd

    const/16 v5, 0xa

    .line 365
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->bytesLeft()I

    move-result v2

    if-nez v2, :cond_c

    .line 366
    const/4 v0, 0x0

    .line 391
    :cond_b
    :goto_b
    return-object v0

    .line 368
    :cond_c
    iget v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    .line 369
    .local v1, "lineLimit":I
    :goto_e
    iget v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->limit:I

    if-ge v1, v2, :cond_21

    iget-object v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    aget-byte v2, v2, v1

    if-eq v2, v5, :cond_21

    iget-object v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    aget-byte v2, v2, v1

    if-eq v2, v6, :cond_21

    .line 370
    add-int/lit8 v1, v1, 0x1

    goto :goto_e

    .line 372
    :cond_21
    iget v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    sub-int v2, v1, v2

    const/4 v3, 0x3

    if-lt v2, v3, :cond_50

    iget-object v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v3, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    aget-byte v2, v2, v3

    const/16 v3, -0x11

    if-ne v2, v3, :cond_50

    iget-object v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v3, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v3, v3, 0x1

    aget-byte v2, v2, v3

    const/16 v3, -0x45

    if-ne v2, v3, :cond_50

    iget-object v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v3, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v3, v3, 0x2

    aget-byte v2, v2, v3

    const/16 v3, -0x41

    if-ne v2, v3, :cond_50

    .line 375
    iget v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v2, v2, 0x3

    iput v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    .line 377
    :cond_50
    new-instance v0, Ljava/lang/String;

    iget-object v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v3, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    iget v4, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    sub-int v4, v1, v4

    invoke-direct {v0, v2, v3, v4}, Ljava/lang/String;-><init>([BII)V

    .line 378
    .local v0, "line":Ljava/lang/String;
    iput v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    .line 379
    iget v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    iget v3, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->limit:I

    if-eq v2, v3, :cond_b

    .line 382
    iget-object v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v3, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    aget-byte v2, v2, v3

    if-ne v2, v6, :cond_79

    .line 383
    iget v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    .line 384
    iget v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    iget v3, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->limit:I

    if-eq v2, v3, :cond_b

    .line 388
    :cond_79
    iget-object v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v3, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    aget-byte v2, v2, v3

    if-ne v2, v5, :cond_b

    .line 389
    iget v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    goto :goto_b
.end method

.method public readLittleEndianInt()I
    .registers 5

    .prologue
    .line 237
    iget-object v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    iget-object v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    aget-byte v1, v1, v2

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    iget-object v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    aget-byte v1, v1, v2

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x10

    or-int/2addr v0, v1

    iget-object v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    aget-byte v1, v1, v2

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x18

    or-int/2addr v0, v1

    return v0
.end method

.method public readLittleEndianInt24()I
    .registers 5

    .prologue
    .line 199
    iget-object v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    iget-object v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    aget-byte v1, v1, v2

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    iget-object v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    aget-byte v1, v1, v2

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x10

    or-int/2addr v0, v1

    return v0
.end method

.method public readLittleEndianLong()J
    .registers 8

    .prologue
    const-wide/16 v5, 0xff

    .line 257
    iget-object v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    aget-byte v0, v0, v1

    int-to-long v0, v0

    and-long/2addr v0, v5

    iget-object v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v3, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    aget-byte v2, v2, v3

    int-to-long v2, v2

    and-long/2addr v2, v5

    const/16 v4, 0x8

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    iget-object v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v3, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    aget-byte v2, v2, v3

    int-to-long v2, v2

    and-long/2addr v2, v5

    const/16 v4, 0x10

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    iget-object v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v3, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    aget-byte v2, v2, v3

    int-to-long v2, v2

    and-long/2addr v2, v5

    const/16 v4, 0x18

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    iget-object v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v3, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    aget-byte v2, v2, v3

    int-to-long v2, v2

    and-long/2addr v2, v5

    const/16 v4, 0x20

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    iget-object v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v3, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    aget-byte v2, v2, v3

    int-to-long v2, v2

    and-long/2addr v2, v5

    const/16 v4, 0x28

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    iget-object v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v3, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    aget-byte v2, v2, v3

    int-to-long v2, v2

    and-long/2addr v2, v5

    const/16 v4, 0x30

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    iget-object v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v3, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    aget-byte v2, v2, v3

    int-to-long v2, v2

    and-long/2addr v2, v5

    const/16 v4, 0x38

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    return-wide v0
.end method

.method public readLittleEndianShort()S
    .registers 5

    .prologue
    .line 187
    iget-object v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    iget-object v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    aget-byte v1, v1, v2

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    int-to-short v0, v0

    return v0
.end method

.method public readLittleEndianUnsignedInt()J
    .registers 8

    .prologue
    const-wide/16 v5, 0xff

    .line 221
    iget-object v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    aget-byte v0, v0, v1

    int-to-long v0, v0

    and-long/2addr v0, v5

    iget-object v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v3, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    aget-byte v2, v2, v3

    int-to-long v2, v2

    and-long/2addr v2, v5

    const/16 v4, 0x8

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    iget-object v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v3, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    aget-byte v2, v2, v3

    int-to-long v2, v2

    and-long/2addr v2, v5

    const/16 v4, 0x10

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    iget-object v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v3, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    aget-byte v2, v2, v3

    int-to-long v2, v2

    and-long/2addr v2, v5

    const/16 v4, 0x18

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    return-wide v0
.end method

.method public readLittleEndianUnsignedInt24()I
    .registers 5

    .prologue
    .line 206
    iget-object v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    iget-object v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    aget-byte v1, v1, v2

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    iget-object v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    aget-byte v1, v1, v2

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x10

    or-int/2addr v0, v1

    return v0
.end method

.method public readLittleEndianUnsignedIntToInt()I
    .registers 5

    .prologue
    .line 311
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readLittleEndianInt()I

    move-result v0

    .line 312
    .local v0, "result":I
    if-gez v0, :cond_1f

    .line 313
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Top bit not zero: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 315
    :cond_1f
    return v0
.end method

.method public readLittleEndianUnsignedShort()I
    .registers 5

    .prologue
    .line 176
    iget-object v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    iget-object v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    aget-byte v1, v1, v2

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    return v0
.end method

.method public readLong()J
    .registers 8

    .prologue
    const-wide/16 v5, 0xff

    .line 245
    iget-object v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    aget-byte v0, v0, v1

    int-to-long v0, v0

    and-long/2addr v0, v5

    const/16 v2, 0x38

    shl-long/2addr v0, v2

    iget-object v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v3, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    aget-byte v2, v2, v3

    int-to-long v2, v2

    and-long/2addr v2, v5

    const/16 v4, 0x30

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    iget-object v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v3, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    aget-byte v2, v2, v3

    int-to-long v2, v2

    and-long/2addr v2, v5

    const/16 v4, 0x28

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    iget-object v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v3, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    aget-byte v2, v2, v3

    int-to-long v2, v2

    and-long/2addr v2, v5

    const/16 v4, 0x20

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    iget-object v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v3, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    aget-byte v2, v2, v3

    int-to-long v2, v2

    and-long/2addr v2, v5

    const/16 v4, 0x18

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    iget-object v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v3, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    aget-byte v2, v2, v3

    int-to-long v2, v2

    and-long/2addr v2, v5

    const/16 v4, 0x10

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    iget-object v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v3, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    aget-byte v2, v2, v3

    int-to-long v2, v2

    and-long/2addr v2, v5

    const/16 v4, 0x8

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    iget-object v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v3, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    aget-byte v2, v2, v3

    int-to-long v2, v2

    and-long/2addr v2, v5

    or-long/2addr v0, v2

    return-wide v0
.end method

.method public readShort()S
    .registers 5

    .prologue
    .line 181
    iget-object v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    shl-int/lit8 v0, v0, 0x8

    iget-object v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    aget-byte v1, v1, v2

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    int-to-short v0, v0

    return v0
.end method

.method public readString(I)Ljava/lang/String;
    .registers 3
    .param p1, "length"    # I

    .prologue
    .line 338
    invoke-static {}, Ljava/nio/charset/Charset;->defaultCharset()Ljava/nio/charset/Charset;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readString(ILjava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public readString(ILjava/nio/charset/Charset;)Ljava/lang/String;
    .registers 6
    .param p1, "length"    # I
    .param p2, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 349
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    invoke-direct {v0, v1, v2, p1, p2}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 350
    .local v0, "result":Ljava/lang/String;
    iget v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/2addr v1, p1

    iput v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    .line 351
    return-object v0
.end method

.method public readSynchSafeInt()I
    .registers 7

    .prologue
    .line 284
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v0

    .line 285
    .local v0, "b1":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v1

    .line 286
    .local v1, "b2":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v2

    .line 287
    .local v2, "b3":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v3

    .line 288
    .local v3, "b4":I
    shl-int/lit8 v4, v0, 0x15

    shl-int/lit8 v5, v1, 0xe

    or-int/2addr v4, v5

    shl-int/lit8 v5, v2, 0x7

    or-int/2addr v4, v5

    or-int/2addr v4, v3

    return v4
.end method

.method public readUnsignedByte()I
    .registers 4

    .prologue
    .line 165
    iget-object v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    return v0
.end method

.method public readUnsignedFixedPoint1616()I
    .registers 6

    .prologue
    .line 269
    iget-object v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    aget-byte v1, v1, v2

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    iget-object v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v3, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    aget-byte v2, v2, v3

    and-int/lit16 v2, v2, 0xff

    or-int v0, v1, v2

    .line 271
    .local v0, "result":I
    iget v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v1, v1, 0x2

    iput v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    .line 272
    return v0
.end method

.method public readUnsignedInt()J
    .registers 8

    .prologue
    const-wide/16 v5, 0xff

    .line 213
    iget-object v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    aget-byte v0, v0, v1

    int-to-long v0, v0

    and-long/2addr v0, v5

    const/16 v2, 0x18

    shl-long/2addr v0, v2

    iget-object v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v3, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    aget-byte v2, v2, v3

    int-to-long v2, v2

    and-long/2addr v2, v5

    const/16 v4, 0x10

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    iget-object v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v3, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    aget-byte v2, v2, v3

    int-to-long v2, v2

    and-long/2addr v2, v5

    const/16 v4, 0x8

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    iget-object v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v3, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    aget-byte v2, v2, v3

    int-to-long v2, v2

    and-long/2addr v2, v5

    or-long/2addr v0, v2

    return-wide v0
.end method

.method public readUnsignedInt24()I
    .registers 5

    .prologue
    .line 192
    iget-object v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    shl-int/lit8 v0, v0, 0x10

    iget-object v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    aget-byte v1, v1, v2

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    iget-object v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    aget-byte v1, v1, v2

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    return v0
.end method

.method public readUnsignedIntToInt()I
    .registers 5

    .prologue
    .line 297
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v0

    .line 298
    .local v0, "result":I
    if-gez v0, :cond_1f

    .line 299
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Top bit not zero: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 301
    :cond_1f
    return v0
.end method

.method public readUnsignedLongToLong()J
    .registers 6

    .prologue
    .line 324
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readLong()J

    move-result-wide v0

    .line 325
    .local v0, "result":J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-gez v2, :cond_23

    .line 326
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Top bit not zero: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 328
    :cond_23
    return-wide v0
.end method

.method public readUnsignedShort()I
    .registers 5

    .prologue
    .line 170
    iget-object v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    shl-int/lit8 v0, v0, 0x8

    iget-object v1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    aget-byte v1, v1, v2

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    return v0
.end method

.method public reset()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 74
    iput v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    .line 75
    iput v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->limit:I

    .line 76
    return-void
.end method

.method public reset([BI)V
    .registers 4
    .param p1, "data"    # [B
    .param p2, "limit"    # I

    .prologue
    .line 65
    iput-object p1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    .line 66
    iput p2, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->limit:I

    .line 67
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    .line 68
    return-void
.end method

.method public setLimit(I)V
    .registers 3
    .param p1, "limit"    # I

    .prologue
    .line 94
    if-ltz p1, :cond_e

    iget-object v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    array-length v0, v0

    if-gt p1, v0, :cond_e

    const/4 v0, 0x1

    :goto_8
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkArgument(Z)V

    .line 95
    iput p1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->limit:I

    .line 96
    return-void

    .line 94
    :cond_e
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public setPosition(I)V
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 117
    if-ltz p1, :cond_d

    iget v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->limit:I

    if-gt p1, v0, :cond_d

    const/4 v0, 0x1

    :goto_7
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkArgument(Z)V

    .line 118
    iput p1, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    .line 119
    return-void

    .line 117
    :cond_d
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public skipBytes(I)V
    .registers 3
    .param p1, "bytes"    # I

    .prologue
    .line 128
    iget v0, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->position:I

    add-int/2addr v0, p1

    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 129
    return-void
.end method
