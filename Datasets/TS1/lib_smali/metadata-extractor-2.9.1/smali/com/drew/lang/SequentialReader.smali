.class public abstract Lcom/drew/lang/SequentialReader;
.super Ljava/lang/Object;
.source "SequentialReader.java"


# instance fields
.field private _isMotorolaByteOrder:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/drew/lang/SequentialReader;->_isMotorolaByteOrder:Z

    return-void
.end method


# virtual methods
.method protected abstract getByte()B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract getBytes(I)[B
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public getDouble64()D
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 266
    invoke-virtual {p0}, Lcom/drew/lang/SequentialReader;->getInt64()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v0

    return-wide v0
.end method

.method public getFloat32()F
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 261
    invoke-virtual {p0}, Lcom/drew/lang/SequentialReader;->getInt32()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v0

    return v0
.end method

.method public getInt16()S
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 145
    iget-boolean v0, p0, Lcom/drew/lang/SequentialReader;->_isMotorolaByteOrder:Z

    if-eqz v0, :cond_17

    .line 147
    invoke-virtual {p0}, Lcom/drew/lang/SequentialReader;->getByte()B

    move-result v0

    int-to-short v0, v0

    shl-int/lit8 v0, v0, 0x8

    and-int/lit16 v0, v0, -0x100

    invoke-virtual {p0}, Lcom/drew/lang/SequentialReader;->getByte()B

    move-result v1

    int-to-short v1, v1

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    int-to-short v0, v0

    .line 151
    :goto_16
    return v0

    :cond_17
    invoke-virtual {p0}, Lcom/drew/lang/SequentialReader;->getByte()B

    move-result v0

    int-to-short v0, v0

    and-int/lit16 v0, v0, 0xff

    invoke-virtual {p0}, Lcom/drew/lang/SequentialReader;->getByte()B

    move-result v1

    int-to-short v1, v1

    shl-int/lit8 v1, v1, 0x8

    and-int/lit16 v1, v1, -0x100

    or-int/2addr v0, v1

    int-to-short v0, v0

    goto :goto_16
.end method

.method public getInt32()I
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/high16 v4, 0xff0000

    const v3, 0xff00

    const/high16 v2, -0x1000000

    .line 187
    iget-boolean v0, p0, Lcom/drew/lang/SequentialReader;->_isMotorolaByteOrder:Z

    if-eqz v0, :cond_2a

    .line 189
    invoke-virtual {p0}, Lcom/drew/lang/SequentialReader;->getByte()B

    move-result v0

    shl-int/lit8 v0, v0, 0x18

    and-int/2addr v0, v2

    invoke-virtual {p0}, Lcom/drew/lang/SequentialReader;->getByte()B

    move-result v1

    shl-int/lit8 v1, v1, 0x10

    and-int/2addr v1, v4

    or-int/2addr v0, v1

    invoke-virtual {p0}, Lcom/drew/lang/SequentialReader;->getByte()B

    move-result v1

    shl-int/lit8 v1, v1, 0x8

    and-int/2addr v1, v3

    or-int/2addr v0, v1

    invoke-virtual {p0}, Lcom/drew/lang/SequentialReader;->getByte()B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    .line 195
    :goto_29
    return v0

    :cond_2a
    invoke-virtual {p0}, Lcom/drew/lang/SequentialReader;->getByte()B

    move-result v0

    and-int/lit16 v0, v0, 0xff

    invoke-virtual {p0}, Lcom/drew/lang/SequentialReader;->getByte()B

    move-result v1

    shl-int/lit8 v1, v1, 0x8

    and-int/2addr v1, v3

    or-int/2addr v0, v1

    invoke-virtual {p0}, Lcom/drew/lang/SequentialReader;->getByte()B

    move-result v1

    shl-int/lit8 v1, v1, 0x10

    and-int/2addr v1, v4

    or-int/2addr v0, v1

    invoke-virtual {p0}, Lcom/drew/lang/SequentialReader;->getByte()B

    move-result v1

    shl-int/lit8 v1, v1, 0x18

    and-int/2addr v1, v2

    or-int/2addr v0, v1

    goto :goto_29
.end method

.method public getInt64()J
    .registers 12
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

    .line 210
    iget-boolean v0, p0, Lcom/drew/lang/SequentialReader;->_isMotorolaByteOrder:Z

    if-eqz v0, :cond_6c

    .line 212
    invoke-virtual {p0}, Lcom/drew/lang/SequentialReader;->getByte()B

    move-result v0

    int-to-long v0, v0

    const/16 v2, 0x38

    shl-long/2addr v0, v2

    const-wide/high16 v2, -0x100000000000000L

    and-long/2addr v0, v2

    invoke-virtual {p0}, Lcom/drew/lang/SequentialReader;->getByte()B

    move-result v2

    int-to-long v2, v2

    const/16 v4, 0x30

    shl-long/2addr v2, v4

    const-wide/high16 v4, 0xff000000000000L

    and-long/2addr v2, v4

    or-long/2addr v0, v2

    invoke-virtual {p0}, Lcom/drew/lang/SequentialReader;->getByte()B

    move-result v2

    int-to-long v2, v2

    shl-long/2addr v2, v10

    const-wide v4, 0xff0000000000L

    and-long/2addr v2, v4

    or-long/2addr v0, v2

    invoke-virtual {p0}, Lcom/drew/lang/SequentialReader;->getByte()B

    move-result v2

    int-to-long v2, v2

    shl-long/2addr v2, v9

    const-wide v4, 0xff00000000L

    and-long/2addr v2, v4

    or-long/2addr v0, v2

    invoke-virtual {p0}, Lcom/drew/lang/SequentialReader;->getByte()B

    move-result v2

    int-to-long v2, v2

    shl-long/2addr v2, v8

    const-wide v4, 0xff000000L

    and-long/2addr v2, v4

    or-long/2addr v0, v2

    invoke-virtual {p0}, Lcom/drew/lang/SequentialReader;->getByte()B

    move-result v2

    int-to-long v2, v2

    shl-long/2addr v2, v7

    const-wide/32 v4, 0xff0000

    and-long/2addr v2, v4

    or-long/2addr v0, v2

    invoke-virtual {p0}, Lcom/drew/lang/SequentialReader;->getByte()B

    move-result v2

    int-to-long v2, v2

    shl-long/2addr v2, v6

    const-wide/32 v4, 0xff00

    and-long/2addr v2, v4

    or-long/2addr v0, v2

    invoke-virtual {p0}, Lcom/drew/lang/SequentialReader;->getByte()B

    move-result v2

    int-to-long v2, v2

    const-wide/16 v4, 0xff

    and-long/2addr v2, v4

    or-long/2addr v0, v2

    .line 222
    :goto_6b
    return-wide v0

    :cond_6c
    invoke-virtual {p0}, Lcom/drew/lang/SequentialReader;->getByte()B

    move-result v0

    int-to-long v0, v0

    const-wide/16 v2, 0xff

    and-long/2addr v0, v2

    invoke-virtual {p0}, Lcom/drew/lang/SequentialReader;->getByte()B

    move-result v2

    int-to-long v2, v2

    shl-long/2addr v2, v6

    const-wide/32 v4, 0xff00

    and-long/2addr v2, v4

    or-long/2addr v0, v2

    invoke-virtual {p0}, Lcom/drew/lang/SequentialReader;->getByte()B

    move-result v2

    int-to-long v2, v2

    shl-long/2addr v2, v7

    const-wide/32 v4, 0xff0000

    and-long/2addr v2, v4

    or-long/2addr v0, v2

    invoke-virtual {p0}, Lcom/drew/lang/SequentialReader;->getByte()B

    move-result v2

    int-to-long v2, v2

    shl-long/2addr v2, v8

    const-wide v4, 0xff000000L

    and-long/2addr v2, v4

    or-long/2addr v0, v2

    invoke-virtual {p0}, Lcom/drew/lang/SequentialReader;->getByte()B

    move-result v2

    int-to-long v2, v2

    shl-long/2addr v2, v9

    const-wide v4, 0xff00000000L

    and-long/2addr v2, v4

    or-long/2addr v0, v2

    invoke-virtual {p0}, Lcom/drew/lang/SequentialReader;->getByte()B

    move-result v2

    int-to-long v2, v2

    shl-long/2addr v2, v10

    const-wide v4, 0xff0000000000L

    and-long/2addr v2, v4

    or-long/2addr v0, v2

    invoke-virtual {p0}, Lcom/drew/lang/SequentialReader;->getByte()B

    move-result v2

    int-to-long v2, v2

    const/16 v4, 0x30

    shl-long/2addr v2, v4

    const-wide/high16 v4, 0xff000000000000L

    and-long/2addr v2, v4

    or-long/2addr v0, v2

    invoke-virtual {p0}, Lcom/drew/lang/SequentialReader;->getByte()B

    move-result v2

    int-to-long v2, v2

    const/16 v4, 0x38

    shl-long/2addr v2, v4

    const-wide/high16 v4, -0x100000000000000L

    and-long/2addr v2, v4

    or-long/2addr v0, v2

    goto :goto_6b
.end method

.method public getInt8()B
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 116
    invoke-virtual {p0}, Lcom/drew/lang/SequentialReader;->getByte()B

    move-result v0

    return v0
.end method

.method public getNullTerminatedString(I)Ljava/lang/String;
    .registers 6
    .param p1, "maxLengthBytes"    # I
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 299
    new-array v0, p1, [B

    .line 302
    .local v0, "bytes":[B
    const/4 v1, 0x0

    .line 303
    .local v1, "length":I
    :goto_3
    array-length v2, v0

    if-ge v1, v2, :cond_11

    invoke-virtual {p0}, Lcom/drew/lang/SequentialReader;->getByte()B

    move-result v2

    aput-byte v2, v0, v1

    if-eqz v2, :cond_11

    .line 304
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 306
    :cond_11
    new-instance v2, Ljava/lang/String;

    const/4 v3, 0x0

    invoke-direct {v2, v0, v3, v1}, Ljava/lang/String;-><init>([BII)V

    return-object v2
.end method

.method public getS15Fixed16()F
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/high16 v6, 0x40f0000000000000L    # 65536.0

    .line 243
    iget-boolean v2, p0, Lcom/drew/lang/SequentialReader;->_isMotorolaByteOrder:Z

    if-eqz v2, :cond_2c

    .line 244
    invoke-virtual {p0}, Lcom/drew/lang/SequentialReader;->getByte()B

    move-result v2

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0x8

    invoke-virtual {p0}, Lcom/drew/lang/SequentialReader;->getByte()B

    move-result v3

    and-int/lit16 v3, v3, 0xff

    or-int/2addr v2, v3

    int-to-float v1, v2

    .line 246
    .local v1, "res":F
    invoke-virtual {p0}, Lcom/drew/lang/SequentialReader;->getByte()B

    move-result v2

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0x8

    invoke-virtual {p0}, Lcom/drew/lang/SequentialReader;->getByte()B

    move-result v3

    and-int/lit16 v3, v3, 0xff

    or-int v0, v2, v3

    .line 248
    .local v0, "d":I
    float-to-double v2, v1

    int-to-double v4, v0

    div-double/2addr v4, v6

    add-double/2addr v2, v4

    double-to-float v2, v2

    .line 255
    :goto_2b
    return v2

    .line 251
    .end local v0    # "d":I
    .end local v1    # "res":F
    :cond_2c
    invoke-virtual {p0}, Lcom/drew/lang/SequentialReader;->getByte()B

    move-result v2

    and-int/lit16 v2, v2, 0xff

    invoke-virtual {p0}, Lcom/drew/lang/SequentialReader;->getByte()B

    move-result v3

    and-int/lit16 v3, v3, 0xff

    shl-int/lit8 v3, v3, 0x8

    or-int v0, v2, v3

    .line 253
    .restart local v0    # "d":I
    invoke-virtual {p0}, Lcom/drew/lang/SequentialReader;->getByte()B

    move-result v2

    and-int/lit16 v2, v2, 0xff

    invoke-virtual {p0}, Lcom/drew/lang/SequentialReader;->getByte()B

    move-result v3

    and-int/lit16 v3, v3, 0xff

    shl-int/lit8 v3, v3, 0x8

    or-int/2addr v2, v3

    int-to-float v1, v2

    .line 255
    .restart local v1    # "res":F
    float-to-double v2, v1

    int-to-double v4, v0

    div-double/2addr v4, v6

    add-double/2addr v2, v4

    double-to-float v2, v2

    goto :goto_2b
.end method

.method public getString(I)Ljava/lang/String;
    .registers 4
    .param p1, "bytesRequested"    # I
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 272
    new-instance v0, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/drew/lang/SequentialReader;->getBytes(I)[B

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([B)V

    return-object v0
.end method

.method public getString(ILjava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p1, "bytesRequested"    # I
    .param p2, "charset"    # Ljava/lang/String;
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 278
    invoke-virtual {p0, p1}, Lcom/drew/lang/SequentialReader;->getBytes(I)[B

    move-result-object v0

    .line 280
    .local v0, "bytes":[B
    :try_start_4
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v0, p2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_9
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_4 .. :try_end_9} :catch_a

    .line 282
    :goto_9
    return-object v2

    .line 281
    :catch_a
    move-exception v1

    .line 282
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v0}, Ljava/lang/String;-><init>([B)V

    goto :goto_9
.end method

.method public getUInt16()I
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const v2, 0xff00

    .line 126
    iget-boolean v0, p0, Lcom/drew/lang/SequentialReader;->_isMotorolaByteOrder:Z

    if-eqz v0, :cond_16

    .line 128
    invoke-virtual {p0}, Lcom/drew/lang/SequentialReader;->getByte()B

    move-result v0

    shl-int/lit8 v0, v0, 0x8

    and-int/2addr v0, v2

    invoke-virtual {p0}, Lcom/drew/lang/SequentialReader;->getByte()B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    .line 132
    :goto_15
    return v0

    :cond_16
    invoke-virtual {p0}, Lcom/drew/lang/SequentialReader;->getByte()B

    move-result v0

    and-int/lit16 v0, v0, 0xff

    invoke-virtual {p0}, Lcom/drew/lang/SequentialReader;->getByte()B

    move-result v1

    shl-int/lit8 v1, v1, 0x8

    and-int/2addr v1, v2

    or-int/2addr v0, v1

    goto :goto_15
.end method

.method public getUInt32()J
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/32 v10, 0xff00

    const-wide/16 v8, 0xff

    const/16 v7, 0x18

    const/16 v4, 0x10

    const/16 v6, 0x8

    .line 164
    iget-boolean v0, p0, Lcom/drew/lang/SequentialReader;->_isMotorolaByteOrder:Z

    if-eqz v0, :cond_36

    .line 166
    invoke-virtual {p0}, Lcom/drew/lang/SequentialReader;->getByte()B

    move-result v0

    int-to-long v0, v0

    shl-long/2addr v0, v7

    const-wide v2, 0xff000000L

    and-long/2addr v0, v2

    invoke-virtual {p0}, Lcom/drew/lang/SequentialReader;->getByte()B

    move-result v2

    int-to-long v2, v2

    shl-long/2addr v2, v4

    const-wide/32 v4, 0xff0000

    and-long/2addr v2, v4

    or-long/2addr v0, v2

    invoke-virtual {p0}, Lcom/drew/lang/SequentialReader;->getByte()B

    move-result v2

    int-to-long v2, v2

    shl-long/2addr v2, v6

    and-long/2addr v2, v10

    or-long/2addr v0, v2

    invoke-virtual {p0}, Lcom/drew/lang/SequentialReader;->getByte()B

    move-result v2

    int-to-long v2, v2

    and-long/2addr v2, v8

    or-long/2addr v0, v2

    .line 172
    :goto_35
    return-wide v0

    :cond_36
    invoke-virtual {p0}, Lcom/drew/lang/SequentialReader;->getByte()B

    move-result v0

    int-to-long v0, v0

    and-long/2addr v0, v8

    invoke-virtual {p0}, Lcom/drew/lang/SequentialReader;->getByte()B

    move-result v2

    int-to-long v2, v2

    shl-long/2addr v2, v6

    and-long/2addr v2, v10

    or-long/2addr v0, v2

    invoke-virtual {p0}, Lcom/drew/lang/SequentialReader;->getByte()B

    move-result v2

    int-to-long v2, v2

    shl-long/2addr v2, v4

    const-wide/32 v4, 0xff0000

    and-long/2addr v2, v4

    or-long/2addr v0, v2

    invoke-virtual {p0}, Lcom/drew/lang/SequentialReader;->getByte()B

    move-result v2

    int-to-long v2, v2

    shl-long/2addr v2, v7

    const-wide v4, 0xff000000L

    and-long/2addr v2, v4

    or-long/2addr v0, v2

    goto :goto_35
.end method

.method public getUInt8()S
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 106
    invoke-virtual {p0}, Lcom/drew/lang/SequentialReader;->getByte()B

    move-result v0

    and-int/lit16 v0, v0, 0xff

    int-to-short v0, v0

    return v0
.end method

.method public isMotorolaByteOrder()Z
    .registers 2

    .prologue
    .line 96
    iget-boolean v0, p0, Lcom/drew/lang/SequentialReader;->_isMotorolaByteOrder:Z

    return v0
.end method

.method public setMotorolaByteOrder(Z)V
    .registers 2
    .param p1, "motorolaByteOrder"    # Z

    .prologue
    .line 84
    iput-boolean p1, p0, Lcom/drew/lang/SequentialReader;->_isMotorolaByteOrder:Z

    .line 85
    return-void
.end method

.method public abstract skip(J)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract trySkip(J)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
