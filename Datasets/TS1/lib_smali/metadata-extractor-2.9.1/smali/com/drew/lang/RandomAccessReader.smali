.class public abstract Lcom/drew/lang/RandomAccessReader;
.super Ljava/lang/Object;
.source "RandomAccessReader.java"


# instance fields
.field private _isMotorolaByteOrder:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/drew/lang/RandomAccessReader;->_isMotorolaByteOrder:Z

    return-void
.end method


# virtual methods
.method public getBit(I)Z
    .registers 7
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    .line 137
    div-int/lit8 v2, p1, 0x8

    .line 138
    .local v2, "byteIndex":I
    rem-int/lit8 v1, p1, 0x8

    .line 140
    .local v1, "bitIndex":I
    invoke-virtual {p0, v2, v3}, Lcom/drew/lang/RandomAccessReader;->validateIndex(II)V

    .line 142
    invoke-virtual {p0, v2}, Lcom/drew/lang/RandomAccessReader;->getByte(I)B

    move-result v0

    .line 143
    .local v0, "b":B
    shr-int v4, v0, v1

    and-int/lit8 v4, v4, 0x1

    if-ne v4, v3, :cond_13

    :goto_12
    return v3

    :cond_13
    const/4 v3, 0x0

    goto :goto_12
.end method

.method protected abstract getByte(I)B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract getBytes(II)[B
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public getDouble64(I)D
    .registers 4
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 363
    invoke-virtual {p0, p1}, Lcom/drew/lang/RandomAccessReader;->getInt64(I)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v0

    return-wide v0
.end method

.method public getFloat32(I)F
    .registers 3
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 358
    invoke-virtual {p0, p1}, Lcom/drew/lang/RandomAccessReader;->getInt32(I)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v0

    return v0
.end method

.method public getInt16(I)S
    .registers 4
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 205
    const/4 v0, 0x2

    invoke-virtual {p0, p1, v0}, Lcom/drew/lang/RandomAccessReader;->validateIndex(II)V

    .line 207
    iget-boolean v0, p0, Lcom/drew/lang/RandomAccessReader;->_isMotorolaByteOrder:Z

    if-eqz v0, :cond_1d

    .line 209
    invoke-virtual {p0, p1}, Lcom/drew/lang/RandomAccessReader;->getByte(I)B

    move-result v0

    int-to-short v0, v0

    shl-int/lit8 v0, v0, 0x8

    and-int/lit16 v0, v0, -0x100

    add-int/lit8 v1, p1, 0x1

    invoke-virtual {p0, v1}, Lcom/drew/lang/RandomAccessReader;->getByte(I)B

    move-result v1

    int-to-short v1, v1

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    int-to-short v0, v0

    .line 213
    :goto_1c
    return v0

    :cond_1d
    add-int/lit8 v0, p1, 0x1

    invoke-virtual {p0, v0}, Lcom/drew/lang/RandomAccessReader;->getByte(I)B

    move-result v0

    int-to-short v0, v0

    shl-int/lit8 v0, v0, 0x8

    and-int/lit16 v0, v0, -0x100

    invoke-virtual {p0, p1}, Lcom/drew/lang/RandomAccessReader;->getByte(I)B

    move-result v1

    int-to-short v1, v1

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    int-to-short v0, v0

    goto :goto_1c
.end method

.method public getInt24(I)I
    .registers 5
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/high16 v1, 0xff0000

    const v2, 0xff00

    .line 227
    const/4 v0, 0x3

    invoke-virtual {p0, p1, v0}, Lcom/drew/lang/RandomAccessReader;->validateIndex(II)V

    .line 229
    iget-boolean v0, p0, Lcom/drew/lang/RandomAccessReader;->_isMotorolaByteOrder:Z

    if-eqz v0, :cond_28

    .line 231
    invoke-virtual {p0, p1}, Lcom/drew/lang/RandomAccessReader;->getByte(I)B

    move-result v0

    shl-int/lit8 v0, v0, 0x10

    and-int/2addr v0, v1

    add-int/lit8 v1, p1, 0x1

    invoke-virtual {p0, v1}, Lcom/drew/lang/RandomAccessReader;->getByte(I)B

    move-result v1

    shl-int/lit8 v1, v1, 0x8

    and-int/2addr v1, v2

    or-int/2addr v0, v1

    add-int/lit8 v1, p1, 0x2

    invoke-virtual {p0, v1}, Lcom/drew/lang/RandomAccessReader;->getByte(I)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    .line 236
    :goto_27
    return v0

    :cond_28
    add-int/lit8 v0, p1, 0x2

    invoke-virtual {p0, v0}, Lcom/drew/lang/RandomAccessReader;->getByte(I)B

    move-result v0

    shl-int/lit8 v0, v0, 0x10

    and-int/2addr v0, v1

    add-int/lit8 v1, p1, 0x1

    invoke-virtual {p0, v1}, Lcom/drew/lang/RandomAccessReader;->getByte(I)B

    move-result v1

    shl-int/lit8 v1, v1, 0x8

    and-int/2addr v1, v2

    or-int/2addr v0, v1

    invoke-virtual {p0, p1}, Lcom/drew/lang/RandomAccessReader;->getByte(I)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    goto :goto_27
.end method

.method public getInt32(I)I
    .registers 6
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/high16 v3, 0xff0000

    const v2, 0xff00

    const/high16 v1, -0x1000000

    .line 277
    const/4 v0, 0x4

    invoke-virtual {p0, p1, v0}, Lcom/drew/lang/RandomAccessReader;->validateIndex(II)V

    .line 279
    iget-boolean v0, p0, Lcom/drew/lang/RandomAccessReader;->_isMotorolaByteOrder:Z

    if-eqz v0, :cond_34

    .line 281
    invoke-virtual {p0, p1}, Lcom/drew/lang/RandomAccessReader;->getByte(I)B

    move-result v0

    shl-int/lit8 v0, v0, 0x18

    and-int/2addr v0, v1

    add-int/lit8 v1, p1, 0x1

    invoke-virtual {p0, v1}, Lcom/drew/lang/RandomAccessReader;->getByte(I)B

    move-result v1

    shl-int/lit8 v1, v1, 0x10

    and-int/2addr v1, v3

    or-int/2addr v0, v1

    add-int/lit8 v1, p1, 0x2

    invoke-virtual {p0, v1}, Lcom/drew/lang/RandomAccessReader;->getByte(I)B

    move-result v1

    shl-int/lit8 v1, v1, 0x8

    and-int/2addr v1, v2

    or-int/2addr v0, v1

    add-int/lit8 v1, p1, 0x3

    invoke-virtual {p0, v1}, Lcom/drew/lang/RandomAccessReader;->getByte(I)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    .line 287
    :goto_33
    return v0

    :cond_34
    add-int/lit8 v0, p1, 0x3

    invoke-virtual {p0, v0}, Lcom/drew/lang/RandomAccessReader;->getByte(I)B

    move-result v0

    shl-int/lit8 v0, v0, 0x18

    and-int/2addr v0, v1

    add-int/lit8 v1, p1, 0x2

    invoke-virtual {p0, v1}, Lcom/drew/lang/RandomAccessReader;->getByte(I)B

    move-result v1

    shl-int/lit8 v1, v1, 0x10

    and-int/2addr v1, v3

    or-int/2addr v0, v1

    add-int/lit8 v1, p1, 0x1

    invoke-virtual {p0, v1}, Lcom/drew/lang/RandomAccessReader;->getByte(I)B

    move-result v1

    shl-int/lit8 v1, v1, 0x8

    and-int/2addr v1, v2

    or-int/2addr v0, v1

    invoke-virtual {p0, p1}, Lcom/drew/lang/RandomAccessReader;->getByte(I)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    goto :goto_33
.end method

.method public getInt64(I)J
    .registers 13
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v10, 0x28

    const/16 v9, 0x20

    const/16 v8, 0x18

    const/16 v7, 0x10

    const/16 v6, 0x8

    .line 303
    invoke-virtual {p0, p1, v6}, Lcom/drew/lang/RandomAccessReader;->validateIndex(II)V

    .line 305
    iget-boolean v0, p0, Lcom/drew/lang/RandomAccessReader;->_isMotorolaByteOrder:Z

    if-eqz v0, :cond_7d

    .line 307
    invoke-virtual {p0, p1}, Lcom/drew/lang/RandomAccessReader;->getByte(I)B

    move-result v0

    int-to-long v0, v0

    const/16 v2, 0x38

    shl-long/2addr v0, v2

    const-wide/high16 v2, -0x100000000000000L

    and-long/2addr v0, v2

    add-int/lit8 v2, p1, 0x1

    invoke-virtual {p0, v2}, Lcom/drew/lang/RandomAccessReader;->getByte(I)B

    move-result v2

    int-to-long v2, v2

    const/16 v4, 0x30

    shl-long/2addr v2, v4

    const-wide/high16 v4, 0xff000000000000L

    and-long/2addr v2, v4

    or-long/2addr v0, v2

    add-int/lit8 v2, p1, 0x2

    invoke-virtual {p0, v2}, Lcom/drew/lang/RandomAccessReader;->getByte(I)B

    move-result v2

    int-to-long v2, v2

    shl-long/2addr v2, v10

    const-wide v4, 0xff0000000000L

    and-long/2addr v2, v4

    or-long/2addr v0, v2

    add-int/lit8 v2, p1, 0x3

    invoke-virtual {p0, v2}, Lcom/drew/lang/RandomAccessReader;->getByte(I)B

    move-result v2

    int-to-long v2, v2

    shl-long/2addr v2, v9

    const-wide v4, 0xff00000000L

    and-long/2addr v2, v4

    or-long/2addr v0, v2

    add-int/lit8 v2, p1, 0x4

    invoke-virtual {p0, v2}, Lcom/drew/lang/RandomAccessReader;->getByte(I)B

    move-result v2

    int-to-long v2, v2

    shl-long/2addr v2, v8

    const-wide v4, 0xff000000L

    and-long/2addr v2, v4

    or-long/2addr v0, v2

    add-int/lit8 v2, p1, 0x5

    invoke-virtual {p0, v2}, Lcom/drew/lang/RandomAccessReader;->getByte(I)B

    move-result v2

    int-to-long v2, v2

    shl-long/2addr v2, v7

    const-wide/32 v4, 0xff0000

    and-long/2addr v2, v4

    or-long/2addr v0, v2

    add-int/lit8 v2, p1, 0x6

    invoke-virtual {p0, v2}, Lcom/drew/lang/RandomAccessReader;->getByte(I)B

    move-result v2

    int-to-long v2, v2

    shl-long/2addr v2, v6

    const-wide/32 v4, 0xff00

    and-long/2addr v2, v4

    or-long/2addr v0, v2

    add-int/lit8 v2, p1, 0x7

    invoke-virtual {p0, v2}, Lcom/drew/lang/RandomAccessReader;->getByte(I)B

    move-result v2

    int-to-long v2, v2

    const-wide/16 v4, 0xff

    and-long/2addr v2, v4

    or-long/2addr v0, v2

    .line 317
    :goto_7c
    return-wide v0

    :cond_7d
    add-int/lit8 v0, p1, 0x7

    invoke-virtual {p0, v0}, Lcom/drew/lang/RandomAccessReader;->getByte(I)B

    move-result v0

    int-to-long v0, v0

    const/16 v2, 0x38

    shl-long/2addr v0, v2

    const-wide/high16 v2, -0x100000000000000L

    and-long/2addr v0, v2

    add-int/lit8 v2, p1, 0x6

    invoke-virtual {p0, v2}, Lcom/drew/lang/RandomAccessReader;->getByte(I)B

    move-result v2

    int-to-long v2, v2

    const/16 v4, 0x30

    shl-long/2addr v2, v4

    const-wide/high16 v4, 0xff000000000000L

    and-long/2addr v2, v4

    or-long/2addr v0, v2

    add-int/lit8 v2, p1, 0x5

    invoke-virtual {p0, v2}, Lcom/drew/lang/RandomAccessReader;->getByte(I)B

    move-result v2

    int-to-long v2, v2

    shl-long/2addr v2, v10

    const-wide v4, 0xff0000000000L

    and-long/2addr v2, v4

    or-long/2addr v0, v2

    add-int/lit8 v2, p1, 0x4

    invoke-virtual {p0, v2}, Lcom/drew/lang/RandomAccessReader;->getByte(I)B

    move-result v2

    int-to-long v2, v2

    shl-long/2addr v2, v9

    const-wide v4, 0xff00000000L

    and-long/2addr v2, v4

    or-long/2addr v0, v2

    add-int/lit8 v2, p1, 0x3

    invoke-virtual {p0, v2}, Lcom/drew/lang/RandomAccessReader;->getByte(I)B

    move-result v2

    int-to-long v2, v2

    shl-long/2addr v2, v8

    const-wide v4, 0xff000000L

    and-long/2addr v2, v4

    or-long/2addr v0, v2

    add-int/lit8 v2, p1, 0x2

    invoke-virtual {p0, v2}, Lcom/drew/lang/RandomAccessReader;->getByte(I)B

    move-result v2

    int-to-long v2, v2

    shl-long/2addr v2, v7

    const-wide/32 v4, 0xff0000

    and-long/2addr v2, v4

    or-long/2addr v0, v2

    add-int/lit8 v2, p1, 0x1

    invoke-virtual {p0, v2}, Lcom/drew/lang/RandomAccessReader;->getByte(I)B

    move-result v2

    int-to-long v2, v2

    shl-long/2addr v2, v6

    const-wide/32 v4, 0xff00

    and-long/2addr v2, v4

    or-long/2addr v0, v2

    invoke-virtual {p0, p1}, Lcom/drew/lang/RandomAccessReader;->getByte(I)B

    move-result v2

    int-to-long v2, v2

    const-wide/16 v4, 0xff

    and-long/2addr v2, v4

    or-long/2addr v0, v2

    goto :goto_7c
.end method

.method public getInt8(I)B
    .registers 3
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 169
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/drew/lang/RandomAccessReader;->validateIndex(II)V

    .line 171
    invoke-virtual {p0, p1}, Lcom/drew/lang/RandomAccessReader;->getByte(I)B

    move-result v0

    return v0
.end method

.method public abstract getLength()J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public getNullTerminatedString(II)Ljava/lang/String;
    .registers 7
    .param p1, "index"    # I
    .param p2, "maxLengthBytes"    # I
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 398
    invoke-virtual {p0, p1, p2}, Lcom/drew/lang/RandomAccessReader;->getBytes(II)[B

    move-result-object v0

    .line 401
    .local v0, "bytes":[B
    const/4 v1, 0x0

    .line 402
    .local v1, "length":I
    :goto_5
    array-length v2, v0

    if-ge v1, v2, :cond_f

    aget-byte v2, v0, v1

    if-eqz v2, :cond_f

    .line 403
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 405
    :cond_f
    new-instance v2, Ljava/lang/String;

    const/4 v3, 0x0

    invoke-direct {v2, v0, v3, v1}, Ljava/lang/String;-><init>([BII)V

    return-object v2
.end method

.method public getS15Fixed16(I)F
    .registers 10
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/high16 v6, 0x40f0000000000000L    # 65536.0

    .line 338
    const/4 v2, 0x4

    invoke-virtual {p0, p1, v2}, Lcom/drew/lang/RandomAccessReader;->validateIndex(II)V

    .line 340
    iget-boolean v2, p0, Lcom/drew/lang/RandomAccessReader;->_isMotorolaByteOrder:Z

    if-eqz v2, :cond_36

    .line 341
    invoke-virtual {p0, p1}, Lcom/drew/lang/RandomAccessReader;->getByte(I)B

    move-result v2

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0x8

    add-int/lit8 v3, p1, 0x1

    invoke-virtual {p0, v3}, Lcom/drew/lang/RandomAccessReader;->getByte(I)B

    move-result v3

    and-int/lit16 v3, v3, 0xff

    or-int/2addr v2, v3

    int-to-float v1, v2

    .line 343
    .local v1, "res":F
    add-int/lit8 v2, p1, 0x2

    invoke-virtual {p0, v2}, Lcom/drew/lang/RandomAccessReader;->getByte(I)B

    move-result v2

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0x8

    add-int/lit8 v3, p1, 0x3

    invoke-virtual {p0, v3}, Lcom/drew/lang/RandomAccessReader;->getByte(I)B

    move-result v3

    and-int/lit16 v3, v3, 0xff

    or-int v0, v2, v3

    .line 345
    .local v0, "d":I
    float-to-double v2, v1

    int-to-double v4, v0

    div-double/2addr v4, v6

    add-double/2addr v2, v4

    double-to-float v2, v2

    .line 352
    :goto_35
    return v2

    .line 348
    .end local v0    # "d":I
    .end local v1    # "res":F
    :cond_36
    add-int/lit8 v2, p1, 0x3

    invoke-virtual {p0, v2}, Lcom/drew/lang/RandomAccessReader;->getByte(I)B

    move-result v2

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0x8

    add-int/lit8 v3, p1, 0x2

    invoke-virtual {p0, v3}, Lcom/drew/lang/RandomAccessReader;->getByte(I)B

    move-result v3

    and-int/lit16 v3, v3, 0xff

    or-int/2addr v2, v3

    int-to-float v1, v2

    .line 350
    .restart local v1    # "res":F
    add-int/lit8 v2, p1, 0x1

    invoke-virtual {p0, v2}, Lcom/drew/lang/RandomAccessReader;->getByte(I)B

    move-result v2

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0x8

    invoke-virtual {p0, p1}, Lcom/drew/lang/RandomAccessReader;->getByte(I)B

    move-result v3

    and-int/lit16 v3, v3, 0xff

    or-int v0, v2, v3

    .line 352
    .restart local v0    # "d":I
    float-to-double v2, v1

    int-to-double v4, v0

    div-double/2addr v4, v6

    add-double/2addr v2, v4

    double-to-float v2, v2

    goto :goto_35
.end method

.method public getString(II)Ljava/lang/String;
    .registers 5
    .param p1, "index"    # I
    .param p2, "bytesRequested"    # I
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 369
    new-instance v0, Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Lcom/drew/lang/RandomAccessReader;->getBytes(II)[B

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([B)V

    return-object v0
.end method

.method public getString(IILjava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p1, "index"    # I
    .param p2, "bytesRequested"    # I
    .param p3, "charset"    # Ljava/lang/String;
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 375
    invoke-virtual {p0, p1, p2}, Lcom/drew/lang/RandomAccessReader;->getBytes(II)[B

    move-result-object v0

    .line 377
    .local v0, "bytes":[B
    :try_start_4
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v0, p3}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_9
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_4 .. :try_end_9} :catch_a

    .line 379
    :goto_9
    return-object v2

    .line 378
    :catch_a
    move-exception v1

    .line 379
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v0}, Ljava/lang/String;-><init>([B)V

    goto :goto_9
.end method

.method public getUInt16(I)I
    .registers 4
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const v1, 0xff00

    .line 183
    const/4 v0, 0x2

    invoke-virtual {p0, p1, v0}, Lcom/drew/lang/RandomAccessReader;->validateIndex(II)V

    .line 185
    iget-boolean v0, p0, Lcom/drew/lang/RandomAccessReader;->_isMotorolaByteOrder:Z

    if-eqz v0, :cond_1c

    .line 187
    invoke-virtual {p0, p1}, Lcom/drew/lang/RandomAccessReader;->getByte(I)B

    move-result v0

    shl-int/lit8 v0, v0, 0x8

    and-int/2addr v0, v1

    add-int/lit8 v1, p1, 0x1

    invoke-virtual {p0, v1}, Lcom/drew/lang/RandomAccessReader;->getByte(I)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    .line 191
    :goto_1b
    return v0

    :cond_1c
    add-int/lit8 v0, p1, 0x1

    invoke-virtual {p0, v0}, Lcom/drew/lang/RandomAccessReader;->getByte(I)B

    move-result v0

    shl-int/lit8 v0, v0, 0x8

    and-int/2addr v0, v1

    invoke-virtual {p0, p1}, Lcom/drew/lang/RandomAccessReader;->getByte(I)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    goto :goto_1b
.end method

.method public getUInt32(I)J
    .registers 13
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/32 v9, 0xff00

    const-wide/16 v7, 0xff

    const/16 v2, 0x18

    const/16 v4, 0x10

    const/16 v6, 0x8

    .line 251
    const/4 v0, 0x4

    invoke-virtual {p0, p1, v0}, Lcom/drew/lang/RandomAccessReader;->validateIndex(II)V

    .line 253
    iget-boolean v0, p0, Lcom/drew/lang/RandomAccessReader;->_isMotorolaByteOrder:Z

    if-eqz v0, :cond_40

    .line 255
    invoke-virtual {p0, p1}, Lcom/drew/lang/RandomAccessReader;->getByte(I)B

    move-result v0

    int-to-long v0, v0

    shl-long/2addr v0, v2

    const-wide v2, 0xff000000L

    and-long/2addr v0, v2

    add-int/lit8 v2, p1, 0x1

    invoke-virtual {p0, v2}, Lcom/drew/lang/RandomAccessReader;->getByte(I)B

    move-result v2

    int-to-long v2, v2

    shl-long/2addr v2, v4

    const-wide/32 v4, 0xff0000

    and-long/2addr v2, v4

    or-long/2addr v0, v2

    add-int/lit8 v2, p1, 0x2

    invoke-virtual {p0, v2}, Lcom/drew/lang/RandomAccessReader;->getByte(I)B

    move-result v2

    int-to-long v2, v2

    shl-long/2addr v2, v6

    and-long/2addr v2, v9

    or-long/2addr v0, v2

    add-int/lit8 v2, p1, 0x3

    invoke-virtual {p0, v2}, Lcom/drew/lang/RandomAccessReader;->getByte(I)B

    move-result v2

    int-to-long v2, v2

    and-long/2addr v2, v7

    or-long/2addr v0, v2

    .line 261
    :goto_3f
    return-wide v0

    :cond_40
    add-int/lit8 v0, p1, 0x3

    invoke-virtual {p0, v0}, Lcom/drew/lang/RandomAccessReader;->getByte(I)B

    move-result v0

    int-to-long v0, v0

    shl-long/2addr v0, v2

    const-wide v2, 0xff000000L

    and-long/2addr v0, v2

    add-int/lit8 v2, p1, 0x2

    invoke-virtual {p0, v2}, Lcom/drew/lang/RandomAccessReader;->getByte(I)B

    move-result v2

    int-to-long v2, v2

    shl-long/2addr v2, v4

    const-wide/32 v4, 0xff0000

    and-long/2addr v2, v4

    or-long/2addr v0, v2

    add-int/lit8 v2, p1, 0x1

    invoke-virtual {p0, v2}, Lcom/drew/lang/RandomAccessReader;->getByte(I)B

    move-result v2

    int-to-long v2, v2

    shl-long/2addr v2, v6

    and-long/2addr v2, v9

    or-long/2addr v0, v2

    invoke-virtual {p0, p1}, Lcom/drew/lang/RandomAccessReader;->getByte(I)B

    move-result v2

    int-to-long v2, v2

    and-long/2addr v2, v7

    or-long/2addr v0, v2

    goto :goto_3f
.end method

.method public getUInt8(I)S
    .registers 3
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 155
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/drew/lang/RandomAccessReader;->validateIndex(II)V

    .line 157
    invoke-virtual {p0, p1}, Lcom/drew/lang/RandomAccessReader;->getByte(I)B

    move-result v0

    and-int/lit16 v0, v0, 0xff

    int-to-short v0, v0

    return v0
.end method

.method public isMotorolaByteOrder()Z
    .registers 2

    .prologue
    .line 125
    iget-boolean v0, p0, Lcom/drew/lang/RandomAccessReader;->_isMotorolaByteOrder:Z

    return v0
.end method

.method protected abstract isValidIndex(II)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public setMotorolaByteOrder(Z)V
    .registers 2
    .param p1, "motorolaByteOrder"    # Z

    .prologue
    .line 113
    iput-boolean p1, p0, Lcom/drew/lang/RandomAccessReader;->_isMotorolaByteOrder:Z

    .line 114
    return-void
.end method

.method protected abstract validateIndex(II)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
