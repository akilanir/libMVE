.class public Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;
.super Lorg/apache/james/mime4j/io/LineReaderInputStream;
.source "BufferedLineReaderInputStream.java"


# instance fields
.field private buffer:[B

.field private buflen:I

.field private bufpos:I

.field private final maxLineLen:I

.field private origBuffer:[B

.field private origBuflen:I

.field private origBufpos:I

.field tempBuffer:Z

.field private truncated:Z


# direct methods
.method public constructor <init>(Ljava/io/InputStream;I)V
    .registers 4
    .param p1, "instream"    # Ljava/io/InputStream;
    .param p2, "buffersize"    # I

    .prologue
    .line 68
    const/4 v0, -0x1

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;-><init>(Ljava/io/InputStream;II)V

    .line 69
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;II)V
    .registers 6
    .param p1, "instream"    # Ljava/io/InputStream;
    .param p2, "buffersize"    # I
    .param p3, "maxLineLen"    # I

    .prologue
    const/4 v1, 0x0

    .line 51
    invoke-direct {p0, p1}, Lorg/apache/james/mime4j/io/LineReaderInputStream;-><init>(Ljava/io/InputStream;)V

    .line 35
    iput-boolean v1, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->tempBuffer:Z

    .line 52
    if-nez p1, :cond_10

    .line 53
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Input stream may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 55
    :cond_10
    if-gtz p2, :cond_1a

    .line 56
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Buffer size may not be negative or zero"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 58
    :cond_1a
    new-array v0, p2, [B

    iput-object v0, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->buffer:[B

    .line 59
    iput v1, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->bufpos:I

    .line 60
    iput v1, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->buflen:I

    .line 61
    iput p3, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->maxLineLen:I

    .line 62
    iput-boolean v1, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->truncated:Z

    .line 63
    return-void
.end method

.method private bufferLen()I
    .registers 3

    .prologue
    .line 121
    iget v0, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->buflen:I

    iget v1, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->bufpos:I

    sub-int/2addr v0, v1

    return v0
.end method

.method private clear()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 342
    iput v0, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->bufpos:I

    .line 343
    iput v0, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->buflen:I

    .line 344
    return-void
.end method

.method private expand(I)V
    .registers 7
    .param p1, "newlen"    # I

    .prologue
    .line 72
    new-array v1, p1, [B

    .line 73
    .local v1, "newbuffer":[B
    invoke-direct {p0}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->bufferLen()I

    move-result v0

    .line 74
    .local v0, "len":I
    if-lez v0, :cond_11

    .line 75
    iget-object v2, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->buffer:[B

    iget v3, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->bufpos:I

    iget v4, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->bufpos:I

    invoke-static {v2, v3, v1, v4, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 77
    :cond_11
    iput-object v1, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->buffer:[B

    .line 78
    return-void
.end method


# virtual methods
.method protected buf()[B
    .registers 2

    .prologue
    .line 316
    iget-object v0, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->buffer:[B

    return-object v0
.end method

.method public byteAt(I)I
    .registers 5
    .param p1, "pos"    # I

    .prologue
    .line 309
    iget v0, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->bufpos:I

    if-lt p1, v0, :cond_8

    iget v0, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->buflen:I

    if-le p1, v0, :cond_39

    .line 310
    :cond_8
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "looking for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " in "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->bufpos:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->buflen:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 312
    :cond_39
    iget-object v0, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->buffer:[B

    aget-byte v0, v0, p1

    and-int/lit16 v0, v0, 0xff

    return v0
.end method

.method public capacity()I
    .registers 2

    .prologue
    .line 332
    iget-object v0, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->buffer:[B

    array-length v0, v0

    return v0
.end method

.method public ensureCapacity(I)V
    .registers 3
    .param p1, "len"    # I

    .prologue
    .line 81
    iget-object v0, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->buffer:[B

    array-length v0, v0

    if-le p1, v0, :cond_8

    .line 82
    invoke-direct {p0, p1}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->expand(I)V

    .line 84
    :cond_8
    return-void
.end method

.method public fillBuffer()I
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, -0x1

    const/4 v7, 0x0

    .line 87
    iget-boolean v4, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->tempBuffer:Z

    if-eqz v4, :cond_27

    .line 90
    iget v3, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->bufpos:I

    iget v4, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->buflen:I

    if-eq v3, v4, :cond_14

    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "unread only works when a buffer is fully read before the next refill is asked!"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 92
    :cond_14
    iget-object v3, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->origBuffer:[B

    iput-object v3, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->buffer:[B

    .line 93
    iget v3, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->origBuflen:I

    iput v3, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->buflen:I

    .line 94
    iget v3, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->origBufpos:I

    iput v3, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->bufpos:I

    .line 95
    iput-boolean v7, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->tempBuffer:Z

    .line 97
    invoke-direct {p0}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->bufferLen()I

    move-result v0

    .line 116
    :goto_26
    return v0

    .line 100
    :cond_27
    iget v4, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->bufpos:I

    if-lez v4, :cond_3e

    .line 101
    invoke-direct {p0}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->bufferLen()I

    move-result v1

    .line 102
    .local v1, "len":I
    if-lez v1, :cond_3a

    .line 103
    iget-object v4, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->buffer:[B

    iget v5, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->bufpos:I

    iget-object v6, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->buffer:[B

    invoke-static {v4, v5, v6, v7, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 105
    :cond_3a
    iput v7, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->bufpos:I

    .line 106
    iput v1, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->buflen:I

    .line 109
    .end local v1    # "len":I
    :cond_3e
    iget v2, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->buflen:I

    .line 110
    .local v2, "off":I
    iget-object v4, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->buffer:[B

    array-length v4, v4

    sub-int v1, v4, v2

    .line 111
    .restart local v1    # "len":I
    iget-object v4, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->in:Ljava/io/InputStream;

    iget-object v5, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->buffer:[B

    invoke-virtual {v4, v5, v2, v1}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 112
    .local v0, "l":I
    if-ne v0, v3, :cond_51

    move v0, v3

    .line 113
    goto :goto_26

    .line 115
    :cond_51
    add-int v3, v2, v0

    iput v3, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->buflen:I

    goto :goto_26
.end method

.method public hasBufferedData()Z
    .registers 2

    .prologue
    .line 125
    invoke-direct {p0}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->bufferLen()I

    move-result v0

    if-lez v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public indexOf(B)I
    .registers 4
    .param p1, "b"    # B

    .prologue
    .line 305
    iget v0, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->bufpos:I

    invoke-direct {p0}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->bufferLen()I

    move-result v1

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->indexOf(BII)I

    move-result v0

    return v0
.end method

.method public indexOf(BII)I
    .registers 7
    .param p1, "b"    # B
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 293
    iget v1, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->bufpos:I

    if-lt p2, v1, :cond_c

    if-ltz p3, :cond_c

    add-int v1, p2, p3

    iget v2, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->buflen:I

    if-le v1, v2, :cond_12

    .line 294
    :cond_c
    new-instance v1, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v1}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v1

    .line 296
    :cond_12
    move v0, p2

    .local v0, "i":I
    :goto_13
    add-int v1, p2, p3

    if-ge v0, v1, :cond_21

    .line 297
    iget-object v1, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->buffer:[B

    aget-byte v1, v1, v0

    if-ne v1, p1, :cond_1e

    .line 301
    .end local v0    # "i":I
    :goto_1d
    return v0

    .line 296
    .restart local v0    # "i":I
    :cond_1e
    add-int/lit8 v0, v0, 0x1

    goto :goto_13

    .line 301
    :cond_21
    const/4 v0, -0x1

    goto :goto_1d
.end method

.method public indexOf([B)I
    .registers 5
    .param p1, "pattern"    # [B

    .prologue
    .line 289
    iget v0, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->bufpos:I

    iget v1, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->buflen:I

    iget v2, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->bufpos:I

    sub-int/2addr v1, v2

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->indexOf([BII)I

    move-result v0

    return v0
.end method

.method public indexOf([BII)I
    .registers 14
    .param p1, "pattern"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    const/4 v7, -0x1

    .line 237
    if-nez p1, :cond_b

    .line 238
    new-instance v7, Ljava/lang/IllegalArgumentException;

    const-string v8, "Pattern may not be null"

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 240
    :cond_b
    iget v8, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->bufpos:I

    if-lt p2, v8, :cond_17

    if-ltz p3, :cond_17

    add-int v8, p2, p3

    iget v9, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->buflen:I

    if-le v8, v9, :cond_58

    .line 241
    :cond_17
    new-instance v7, Ljava/lang/IndexOutOfBoundsException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "looking for "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ")"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " in "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->bufpos:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "/"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->buflen:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 243
    :cond_58
    array-length v8, p1

    if-ge p3, v8, :cond_5d

    move v0, v7

    .line 277
    :cond_5c
    :goto_5c
    return v0

    .line 247
    :cond_5d
    const/16 v8, 0x100

    new-array v5, v8, [I

    .line 248
    .local v5, "shiftTable":[I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_62
    array-length v8, v5

    if-ge v1, v8, :cond_6d

    .line 249
    array-length v8, p1

    add-int/lit8 v8, v8, 0x1

    aput v8, v5, v1

    .line 248
    add-int/lit8 v1, v1, 0x1

    goto :goto_62

    .line 251
    :cond_6d
    const/4 v1, 0x0

    :goto_6e
    array-length v8, p1

    if-ge v1, v8, :cond_7c

    .line 252
    aget-byte v8, p1, v1

    and-int/lit16 v6, v8, 0xff

    .line 253
    .local v6, "x":I
    array-length v8, p1

    sub-int/2addr v8, v1

    aput v8, v5, v6

    .line 251
    add-int/lit8 v1, v1, 0x1

    goto :goto_6e

    .line 256
    .end local v6    # "x":I
    :cond_7c
    const/4 v2, 0x0

    .line 257
    .local v2, "j":I
    :goto_7d
    array-length v8, p1

    sub-int v8, p3, v8

    if-gt v2, v8, :cond_9e

    .line 258
    add-int v0, p2, v2

    .line 259
    .local v0, "cur":I
    const/4 v3, 0x1

    .line 260
    .local v3, "match":Z
    const/4 v1, 0x0

    :goto_86
    array-length v8, p1

    if-ge v1, v8, :cond_94

    .line 261
    iget-object v8, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->buffer:[B

    add-int v9, v0, v1

    aget-byte v8, v8, v9

    aget-byte v9, p1, v1

    if-eq v8, v9, :cond_a0

    .line 262
    const/4 v3, 0x0

    .line 266
    :cond_94
    if-nez v3, :cond_5c

    .line 270
    array-length v8, p1

    add-int v4, v0, v8

    .line 271
    .local v4, "pos":I
    iget-object v8, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->buffer:[B

    array-length v8, v8

    if-lt v4, v8, :cond_a3

    .end local v0    # "cur":I
    .end local v3    # "match":Z
    .end local v4    # "pos":I
    :cond_9e
    move v0, v7

    .line 277
    goto :goto_5c

    .line 260
    .restart local v0    # "cur":I
    .restart local v3    # "match":Z
    :cond_a0
    add-int/lit8 v1, v1, 0x1

    goto :goto_86

    .line 274
    .restart local v4    # "pos":I
    :cond_a3
    iget-object v8, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->buffer:[B

    aget-byte v8, v8, v4

    and-int/lit16 v6, v8, 0xff

    .line 275
    .restart local v6    # "x":I
    aget v8, v5, v6

    add-int/2addr v2, v8

    .line 276
    goto :goto_7d
.end method

.method protected length()I
    .registers 2

    .prologue
    .line 328
    invoke-direct {p0}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->bufferLen()I

    move-result v0

    return v0
.end method

.method protected limit()I
    .registers 2

    .prologue
    .line 324
    iget v0, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->buflen:I

    return v0
.end method

.method public markSupported()Z
    .registers 2

    .prologue
    .line 183
    const/4 v0, 0x0

    return v0
.end method

.method protected pos()I
    .registers 2

    .prologue
    .line 320
    iget v0, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->bufpos:I

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
    const/4 v1, -0x1

    .line 139
    invoke-virtual {p0}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->readAllowed()Z

    move-result v2

    if-nez v2, :cond_8

    .line 147
    :goto_7
    return v1

    .line 140
    :cond_8
    const/4 v0, 0x0

    .line 141
    .local v0, "noRead":I
    :cond_9
    invoke-virtual {p0}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->hasBufferedData()Z

    move-result v2

    if-nez v2, :cond_16

    .line 142
    invoke-virtual {p0}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->fillBuffer()I

    move-result v0

    .line 143
    if-ne v0, v1, :cond_9

    goto :goto_7

    .line 147
    :cond_16
    iget-object v1, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->buffer:[B

    iget v2, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->bufpos:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->bufpos:I

    aget-byte v1, v1, v2

    and-int/lit16 v1, v1, 0xff

    goto :goto_7
.end method

.method public read([B)I
    .registers 4
    .param p1, "b"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 174
    invoke-virtual {p0}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->readAllowed()Z

    move-result v1

    if-nez v1, :cond_9

    const/4 v0, -0x1

    .line 178
    :cond_8
    :goto_8
    return v0

    .line 175
    :cond_9
    if-eqz p1, :cond_8

    .line 178
    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->read([BII)I

    move-result v0

    goto :goto_8
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
    const/4 v0, -0x1

    .line 152
    invoke-virtual {p0}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->readAllowed()Z

    move-result v2

    if-nez v2, :cond_8

    .line 169
    :goto_7
    return v0

    .line 153
    :cond_8
    if-nez p1, :cond_c

    .line 154
    const/4 v0, 0x0

    goto :goto_7

    .line 156
    :cond_c
    const/4 v1, 0x0

    .line 157
    .local v1, "noRead":I
    :cond_d
    invoke-virtual {p0}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->hasBufferedData()Z

    move-result v2

    if-nez v2, :cond_1a

    .line 158
    invoke-virtual {p0}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->fillBuffer()I

    move-result v1

    .line 159
    if-ne v1, v0, :cond_d

    goto :goto_7

    .line 163
    :cond_1a
    invoke-direct {p0}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->bufferLen()I

    move-result v0

    .line 164
    .local v0, "chunk":I
    if-le v0, p3, :cond_21

    .line 165
    move v0, p3

    .line 167
    :cond_21
    iget-object v2, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->buffer:[B

    iget v3, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->bufpos:I

    invoke-static {v2, v3, p1, p2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 168
    iget v2, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->bufpos:I

    add-int/2addr v2, v0

    iput v2, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->bufpos:I

    goto :goto_7
.end method

.method protected readAllowed()Z
    .registers 2

    .prologue
    .line 134
    iget-boolean v0, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->truncated:Z

    if-nez v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public readLine(Lorg/apache/james/mime4j/util/ByteArrayBuffer;)I
    .registers 10
    .param p1, "dst"    # Lorg/apache/james/mime4j/util/ByteArrayBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/james/mime4j/io/MaxLineLimitException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, -0x1

    .line 189
    if-nez p1, :cond_b

    .line 190
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "Buffer may not be null"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 192
    :cond_b
    invoke-virtual {p0}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->readAllowed()Z

    move-result v6

    if-nez v6, :cond_13

    move v4, v5

    .line 224
    :cond_12
    :goto_12
    return v4

    .line 194
    :cond_13
    const/4 v4, 0x0

    .line 195
    .local v4, "total":I
    const/4 v2, 0x0

    .line 196
    .local v2, "found":Z
    const/4 v0, 0x0

    .line 197
    .local v0, "bytesRead":I
    :cond_16
    if-nez v2, :cond_24

    .line 198
    invoke-virtual {p0}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->hasBufferedData()Z

    move-result v6

    if-nez v6, :cond_2a

    .line 199
    invoke-virtual {p0}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->fillBuffer()I

    move-result v0

    .line 200
    if-ne v0, v5, :cond_2a

    .line 221
    :cond_24
    if-nez v4, :cond_12

    if-ne v0, v5, :cond_12

    move v4, v5

    .line 222
    goto :goto_12

    .line 204
    :cond_2a
    const/16 v6, 0xa

    invoke-virtual {p0, v6}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->indexOf(B)I

    move-result v3

    .line 206
    .local v3, "i":I
    if-eq v3, v5, :cond_60

    .line 207
    const/4 v2, 0x1

    .line 208
    add-int/lit8 v6, v3, 0x1

    invoke-virtual {p0}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->pos()I

    move-result v7

    sub-int v1, v6, v7

    .line 212
    .local v1, "chunk":I
    :goto_3b
    if-lez v1, :cond_4c

    .line 213
    invoke-virtual {p0}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->buf()[B

    move-result-object v6

    invoke-virtual {p0}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->pos()I

    move-result v7

    invoke-virtual {p1, v6, v7, v1}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->append([BII)V

    .line 214
    invoke-virtual {p0, v1}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->skip(I)I

    .line 215
    add-int/2addr v4, v1

    .line 217
    :cond_4c
    iget v6, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->maxLineLen:I

    if-lez v6, :cond_16

    invoke-virtual {p1}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->length()I

    move-result v6

    iget v7, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->maxLineLen:I

    if-lt v6, v7, :cond_16

    .line 218
    new-instance v5, Lorg/apache/james/mime4j/io/MaxLineLimitException;

    const-string v6, "Maximum line length limit exceeded"

    invoke-direct {v5, v6}, Lorg/apache/james/mime4j/io/MaxLineLimitException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 210
    .end local v1    # "chunk":I
    :cond_60
    invoke-virtual {p0}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->length()I

    move-result v1

    .restart local v1    # "chunk":I
    goto :goto_3b
.end method

.method protected skip(I)I
    .registers 4
    .param p1, "n"    # I

    .prologue
    .line 336
    invoke-direct {p0}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->bufferLen()I

    move-result v1

    invoke-static {p1, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 337
    .local v0, "chunk":I
    iget v1, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->bufpos:I

    add-int/2addr v1, v0

    iput v1, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->bufpos:I

    .line 338
    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 348
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 349
    .local v0, "buffer":Ljava/lang/StringBuilder;
    const-string v2, "[pos: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 350
    iget v2, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->bufpos:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 351
    const-string v2, "]"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 352
    const-string v2, "[limit: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 353
    iget v2, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->buflen:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 354
    const-string v2, "]"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 355
    const-string v2, "["

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 356
    iget v1, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->bufpos:I

    .local v1, "i":I
    :goto_2a
    iget v2, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->buflen:I

    if-ge v1, v2, :cond_39

    .line 357
    iget-object v2, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->buffer:[B

    aget-byte v2, v2, v1

    int-to-char v2, v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 356
    add-int/lit8 v1, v1, 0x1

    goto :goto_2a

    .line 359
    :cond_39
    const-string v2, "]"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 360
    iget-boolean v2, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->tempBuffer:Z

    if-eqz v2, :cond_7b

    .line 361
    const-string v2, "-ORIG[pos: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 362
    iget v2, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->origBufpos:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 363
    const-string v2, "]"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 364
    const-string v2, "[limit: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 365
    iget v2, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->origBuflen:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 366
    const-string v2, "]"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 367
    const-string v2, "["

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 368
    iget v1, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->origBufpos:I

    :goto_67
    iget v2, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->origBuflen:I

    if-ge v1, v2, :cond_76

    .line 369
    iget-object v2, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->origBuffer:[B

    aget-byte v2, v2, v1

    int-to-char v2, v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 368
    add-int/lit8 v1, v1, 0x1

    goto :goto_67

    .line 371
    :cond_76
    const-string v2, "]"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 373
    :cond_7b
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public truncate()V
    .registers 2

    .prologue
    .line 129
    invoke-direct {p0}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->clear()V

    .line 130
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->truncated:Z

    .line 131
    return-void
.end method

.method public unread(Lorg/apache/james/mime4j/util/ByteArrayBuffer;)Z
    .registers 5
    .param p1, "buf"    # Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 378
    iget-boolean v2, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->tempBuffer:Z

    if-eqz v2, :cond_7

    .line 386
    :goto_6
    return v0

    .line 379
    :cond_7
    iget-object v2, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->buffer:[B

    iput-object v2, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->origBuffer:[B

    .line 380
    iget v2, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->buflen:I

    iput v2, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->origBuflen:I

    .line 381
    iget v2, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->bufpos:I

    iput v2, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->origBufpos:I

    .line 382
    iput v0, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->bufpos:I

    .line 383
    invoke-virtual {p1}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->length()I

    move-result v0

    iput v0, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->buflen:I

    .line 384
    invoke-virtual {p1}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->buffer()[B

    move-result-object v0

    iput-object v0, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->buffer:[B

    .line 385
    iput-boolean v1, p0, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->tempBuffer:Z

    move v0, v1

    .line 386
    goto :goto_6
.end method
