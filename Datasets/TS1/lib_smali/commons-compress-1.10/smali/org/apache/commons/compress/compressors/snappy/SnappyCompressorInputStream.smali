.class public Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;
.super Lorg/apache/commons/compress/compressors/CompressorInputStream;
.source "SnappyCompressorInputStream.java"


# static fields
.field public static final DEFAULT_BLOCK_SIZE:I = 0x8000

.field private static final TAG_MASK:I = 0x3


# instance fields
.field private final blockSize:I

.field private final decompressBuf:[B

.field private endReached:Z

.field private final in:Ljava/io/InputStream;

.field private final oneByte:[B

.field private readIndex:I

.field private final size:I

.field private uncompressedBytesRemaining:I

.field private writeIndex:I


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 3
    .param p1, "is"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 84
    const v0, 0x8000

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;-><init>(Ljava/io/InputStream;I)V

    .line 85
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;I)V
    .registers 5
    .param p1, "is"    # Ljava/io/InputStream;
    .param p2, "blockSize"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 98
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/CompressorInputStream;-><init>()V

    .line 71
    const/4 v0, 0x1

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->oneByte:[B

    .line 73
    iput-boolean v1, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->endReached:Z

    .line 99
    iput-object p1, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->in:Ljava/io/InputStream;

    .line 100
    iput p2, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->blockSize:I

    .line 101
    mul-int/lit8 v0, p2, 0x3

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->decompressBuf:[B

    .line 102
    iput v1, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->readIndex:I

    iput v1, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->writeIndex:I

    .line 103
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->readSize()J

    move-result-wide v0

    long-to-int v0, v0

    iput v0, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->size:I

    iput v0, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->uncompressedBytesRemaining:I

    .line 104
    return-void
.end method

.method private expandCopy(JI)Z
    .registers 15
    .param p1, "off"    # J
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    .line 337
    iget v7, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->blockSize:I

    int-to-long v7, v7

    cmp-long v7, p1, v7

    if-lez v7, :cond_10

    .line 338
    new-instance v6, Ljava/io/IOException;

    const-string v7, "Offset is larger than block size"

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 340
    :cond_10
    long-to-int v4, p1

    .line 342
    .local v4, "offset":I
    if-ne v4, v6, :cond_2b

    .line 343
    iget-object v7, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->decompressBuf:[B

    iget v8, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->writeIndex:I

    add-int/lit8 v8, v8, -0x1

    aget-byte v3, v7, v8

    .line 344
    .local v3, "lastChar":B
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1c
    if-ge v2, p3, :cond_3e

    .line 345
    iget-object v7, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->decompressBuf:[B

    iget v8, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->writeIndex:I

    add-int/lit8 v9, v8, 0x1

    iput v9, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->writeIndex:I

    aput-byte v3, v7, v8

    .line 344
    add-int/lit8 v2, v2, 0x1

    goto :goto_1c

    .line 347
    .end local v2    # "i":I
    .end local v3    # "lastChar":B
    :cond_2b
    if-ge p3, v4, :cond_47

    .line 348
    iget-object v7, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->decompressBuf:[B

    iget v8, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->writeIndex:I

    sub-int/2addr v8, v4

    iget-object v9, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->decompressBuf:[B

    iget v10, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->writeIndex:I

    invoke-static {v7, v8, v9, v10, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 350
    iget v7, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->writeIndex:I

    add-int/2addr v7, p3

    iput v7, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->writeIndex:I

    .line 368
    :cond_3e
    :goto_3e
    iget v7, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->writeIndex:I

    iget v8, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->blockSize:I

    mul-int/lit8 v8, v8, 0x2

    if-lt v7, v8, :cond_79

    :goto_46
    return v6

    .line 352
    :cond_47
    div-int v0, p3, v4

    .line 353
    .local v0, "fullRotations":I
    mul-int v7, v4, v0

    sub-int v5, p3, v7

    .local v5, "pad":I
    move v1, v0

    .line 355
    .end local v0    # "fullRotations":I
    .local v1, "fullRotations":I
    :goto_4e
    add-int/lit8 v0, v1, -0x1

    .end local v1    # "fullRotations":I
    .restart local v0    # "fullRotations":I
    if-eqz v1, :cond_65

    .line 356
    iget-object v7, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->decompressBuf:[B

    iget v8, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->writeIndex:I

    sub-int/2addr v8, v4

    iget-object v9, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->decompressBuf:[B

    iget v10, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->writeIndex:I

    invoke-static {v7, v8, v9, v10, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 358
    iget v7, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->writeIndex:I

    add-int/2addr v7, v4

    iput v7, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->writeIndex:I

    move v1, v0

    .end local v0    # "fullRotations":I
    .restart local v1    # "fullRotations":I
    goto :goto_4e

    .line 361
    .end local v1    # "fullRotations":I
    .restart local v0    # "fullRotations":I
    :cond_65
    if-lez v5, :cond_3e

    .line 362
    iget-object v7, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->decompressBuf:[B

    iget v8, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->writeIndex:I

    sub-int/2addr v8, v4

    iget-object v9, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->decompressBuf:[B

    iget v10, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->writeIndex:I

    invoke-static {v7, v8, v9, v10, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 365
    iget v7, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->writeIndex:I

    add-int/2addr v7, v5

    iput v7, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->writeIndex:I

    goto :goto_3e

    .line 368
    .end local v0    # "fullRotations":I
    .end local v5    # "pad":I
    :cond_79
    const/4 v6, 0x0

    goto :goto_46
.end method

.method private expandLiteral(I)Z
    .registers 6
    .param p1, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 307
    iget-object v1, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->in:Ljava/io/InputStream;

    iget-object v2, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->decompressBuf:[B

    iget v3, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->writeIndex:I

    invoke-static {v1, v2, v3, p1}, Lorg/apache/commons/compress/utils/IOUtils;->readFully(Ljava/io/InputStream;[BII)I

    move-result v0

    .line 308
    .local v0, "bytesRead":I
    invoke-virtual {p0, v0}, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->count(I)V

    .line 309
    if-eq p1, v0, :cond_17

    .line 310
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Premature end of stream"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 313
    :cond_17
    iget v1, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->writeIndex:I

    add-int/2addr v1, p1

    iput v1, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->writeIndex:I

    .line 314
    iget v1, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->writeIndex:I

    iget v2, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->blockSize:I

    mul-int/lit8 v2, v2, 0x2

    if-lt v1, v2, :cond_26

    const/4 v1, 0x1

    :goto_25
    return v1

    :cond_26
    const/4 v1, 0x0

    goto :goto_25
.end method

.method private fill(I)V
    .registers 10
    .param p1, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 153
    iget v5, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->uncompressedBytesRemaining:I

    if-nez v5, :cond_7

    .line 154
    const/4 v5, 0x1

    iput-boolean v5, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->endReached:Z

    .line 156
    :cond_7
    iget v5, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->uncompressedBytesRemaining:I

    invoke-static {p1, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    .line 158
    .local v4, "readNow":I
    :goto_d
    if-lez v4, :cond_2c

    .line 159
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->readOneByte()I

    move-result v0

    .line 160
    .local v0, "b":I
    const/4 v1, 0x0

    .line 161
    .local v1, "length":I
    const-wide/16 v2, 0x0

    .line 163
    .local v2, "offset":J
    and-int/lit8 v5, v0, 0x3

    packed-switch v5, :pswitch_data_86

    .line 236
    :cond_1b
    sub-int/2addr v4, v1

    .line 237
    iget v5, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->uncompressedBytesRemaining:I

    sub-int/2addr v5, v1

    iput v5, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->uncompressedBytesRemaining:I

    goto :goto_d

    .line 167
    :pswitch_22
    invoke-direct {p0, v0}, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->readLiteralLength(I)I

    move-result v1

    .line 169
    invoke-direct {p0, v1}, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->expandLiteral(I)Z

    move-result v5

    if-eqz v5, :cond_1b

    .line 239
    .end local v0    # "b":I
    .end local v1    # "length":I
    .end local v2    # "offset":J
    :cond_2c
    :goto_2c
    return-void

    .line 185
    .restart local v0    # "b":I
    .restart local v1    # "length":I
    .restart local v2    # "offset":J
    :pswitch_2d
    shr-int/lit8 v5, v0, 0x2

    and-int/lit8 v5, v5, 0x7

    add-int/lit8 v1, v5, 0x4

    .line 186
    and-int/lit16 v5, v0, 0xe0

    shl-int/lit8 v5, v5, 0x3

    int-to-long v2, v5

    .line 187
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->readOneByte()I

    move-result v5

    int-to-long v5, v5

    or-long/2addr v2, v5

    .line 189
    invoke-direct {p0, v2, v3, v1}, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->expandCopy(JI)Z

    move-result v5

    if-eqz v5, :cond_1b

    goto :goto_2c

    .line 204
    :pswitch_45
    shr-int/lit8 v5, v0, 0x2

    add-int/lit8 v1, v5, 0x1

    .line 206
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->readOneByte()I

    move-result v5

    int-to-long v2, v5

    .line 207
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->readOneByte()I

    move-result v5

    shl-int/lit8 v5, v5, 0x8

    int-to-long v5, v5

    or-long/2addr v2, v5

    .line 209
    invoke-direct {p0, v2, v3, v1}, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->expandCopy(JI)Z

    move-result v5

    if-eqz v5, :cond_1b

    goto :goto_2c

    .line 223
    :pswitch_5d
    shr-int/lit8 v5, v0, 0x2

    add-int/lit8 v1, v5, 0x1

    .line 225
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->readOneByte()I

    move-result v5

    int-to-long v2, v5

    .line 226
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->readOneByte()I

    move-result v5

    shl-int/lit8 v5, v5, 0x8

    int-to-long v5, v5

    or-long/2addr v2, v5

    .line 227
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->readOneByte()I

    move-result v5

    shl-int/lit8 v5, v5, 0x10

    int-to-long v5, v5

    or-long/2addr v2, v5

    .line 228
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->readOneByte()I

    move-result v5

    int-to-long v5, v5

    const/16 v7, 0x18

    shl-long/2addr v5, v7

    or-long/2addr v2, v5

    .line 230
    invoke-direct {p0, v2, v3, v1}, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->expandCopy(JI)Z

    move-result v5

    if-eqz v5, :cond_1b

    goto :goto_2c

    .line 163
    :pswitch_data_86
    .packed-switch 0x0
        :pswitch_22
        :pswitch_2d
        :pswitch_45
        :pswitch_5d
    .end packed-switch
.end method

.method private readLiteralLength(I)I
    .registers 8
    .param p1, "b"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 267
    shr-int/lit8 v1, p1, 0x2

    packed-switch v1, :pswitch_data_4c

    .line 287
    shr-int/lit8 v0, p1, 0x2

    .line 291
    .local v0, "length":I
    :goto_7
    add-int/lit8 v1, v0, 0x1

    return v1

    .line 269
    .end local v0    # "length":I
    :pswitch_a
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->readOneByte()I

    move-result v0

    .line 270
    .restart local v0    # "length":I
    goto :goto_7

    .line 272
    .end local v0    # "length":I
    :pswitch_f
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->readOneByte()I

    move-result v0

    .line 273
    .restart local v0    # "length":I
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->readOneByte()I

    move-result v1

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    .line 274
    goto :goto_7

    .line 276
    .end local v0    # "length":I
    :pswitch_1b
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->readOneByte()I

    move-result v0

    .line 277
    .restart local v0    # "length":I
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->readOneByte()I

    move-result v1

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    .line 278
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->readOneByte()I

    move-result v1

    shl-int/lit8 v1, v1, 0x10

    or-int/2addr v0, v1

    .line 279
    goto :goto_7

    .line 281
    .end local v0    # "length":I
    :pswitch_2e
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->readOneByte()I

    move-result v0

    .line 282
    .restart local v0    # "length":I
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->readOneByte()I

    move-result v1

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    .line 283
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->readOneByte()I

    move-result v1

    shl-int/lit8 v1, v1, 0x10

    or-int/2addr v0, v1

    .line 284
    int-to-long v1, v0

    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->readOneByte()I

    move-result v3

    int-to-long v3, v3

    const/16 v5, 0x18

    shl-long/2addr v3, v5

    or-long/2addr v1, v3

    long-to-int v0, v1

    .line 285
    goto :goto_7

    .line 267
    :pswitch_data_4c
    .packed-switch 0x3c
        :pswitch_a
        :pswitch_f
        :pswitch_1b
        :pswitch_2e
    .end packed-switch
.end method

.method private readOneByte()I
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 382
    iget-object v1, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 383
    .local v0, "b":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_11

    .line 384
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Premature end of stream"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 386
    :cond_11
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->count(I)V

    .line 387
    and-int/lit16 v1, v0, 0xff

    return v1
.end method

.method private readSize()J
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 404
    const/4 v1, 0x0

    .line 405
    .local v1, "index":I
    const-wide/16 v3, 0x0

    .line 406
    .local v3, "sz":J
    const/4 v0, 0x0

    .line 409
    .local v0, "b":I
    :goto_4
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->readOneByte()I

    move-result v0

    .line 410
    and-int/lit8 v5, v0, 0x7f

    add-int/lit8 v2, v1, 0x1

    .end local v1    # "index":I
    .local v2, "index":I
    mul-int/lit8 v6, v1, 0x7

    shl-int/2addr v5, v6

    int-to-long v5, v5

    or-long/2addr v3, v5

    .line 411
    and-int/lit16 v5, v0, 0x80

    if-nez v5, :cond_16

    .line 412
    return-wide v3

    :cond_16
    move v1, v2

    .end local v2    # "index":I
    .restart local v1    # "index":I
    goto :goto_4
.end method

.method private slideBuffer()V
    .registers 6

    .prologue
    .line 248
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->decompressBuf:[B

    iget v1, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->blockSize:I

    iget-object v2, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->decompressBuf:[B

    const/4 v3, 0x0

    iget v4, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->blockSize:I

    mul-int/lit8 v4, v4, 0x2

    invoke-static {v0, v1, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 250
    iget v0, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->writeIndex:I

    iget v1, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->blockSize:I

    sub-int/2addr v0, v1

    iput v0, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->writeIndex:I

    .line 251
    iget v0, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->readIndex:I

    iget v1, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->blockSize:I

    sub-int/2addr v0, v1

    iput v0, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->readIndex:I

    .line 252
    return-void
.end method


# virtual methods
.method public available()I
    .registers 3

    .prologue
    .line 121
    iget v0, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->writeIndex:I

    iget v1, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->readIndex:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 115
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 116
    return-void
.end method

.method public getSize()I
    .registers 2

    .prologue
    .line 421
    iget v0, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->size:I

    return v0
.end method

.method public read()I
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    const/4 v0, -0x1

    .line 109
    iget-object v1, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->oneByte:[B

    const/4 v2, 0x1

    invoke-virtual {p0, v1, v3, v2}, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->read([BII)I

    move-result v1

    if-ne v1, v0, :cond_c

    :goto_b
    return v0

    :cond_c
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->oneByte:[B

    aget-byte v0, v0, v3

    and-int/lit16 v0, v0, 0xff

    goto :goto_b
.end method

.method public read([BII)I
    .registers 8
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 129
    iget-boolean v2, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->endReached:Z

    if-eqz v2, :cond_6

    .line 130
    const/4 v1, -0x1

    .line 143
    :cond_5
    :goto_5
    return v1

    .line 132
    :cond_6
    invoke-virtual {p0}, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->available()I

    move-result v0

    .line 133
    .local v0, "avail":I
    if-le p3, v0, :cond_11

    .line 134
    sub-int v2, p3, v0

    invoke-direct {p0, v2}, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->fill(I)V

    .line 137
    :cond_11
    invoke-virtual {p0}, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->available()I

    move-result v2

    invoke-static {p3, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 138
    .local v1, "readable":I
    iget-object v2, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->decompressBuf:[B

    iget v3, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->readIndex:I

    invoke-static {v2, v3, p1, p2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 139
    iget v2, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->readIndex:I

    add-int/2addr v2, v1

    iput v2, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->readIndex:I

    .line 140
    iget v2, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->readIndex:I

    iget v3, p0, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->blockSize:I

    if-le v2, v3, :cond_5

    .line 141
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->slideBuffer()V

    goto :goto_5
.end method
