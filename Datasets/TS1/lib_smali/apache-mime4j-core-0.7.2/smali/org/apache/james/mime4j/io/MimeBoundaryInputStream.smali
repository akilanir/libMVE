.class public Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;
.super Lorg/apache/james/mime4j/io/LineReaderInputStream;
.source "MimeBoundaryInputStream.java"


# instance fields
.field private atBoundary:Z

.field private final boundary:[B

.field private boundaryLen:I

.field private buffer:Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;

.field private completed:Z

.field private eof:Z

.field private initialLength:I

.field private lastPart:Z

.field private limit:I

.field private final strict:Z


# direct methods
.method public constructor <init>(Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;Ljava/lang/String;)V
    .registers 4
    .param p1, "inbuffer"    # Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;
    .param p2, "boundary"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 103
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;-><init>(Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;Ljava/lang/String;Z)V

    .line 104
    return-void
.end method

.method public constructor <init>(Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;Ljava/lang/String;Z)V
    .registers 11
    .param p1, "inbuffer"    # Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;
    .param p2, "boundary"    # Ljava/lang/String;
    .param p3, "strict"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v6, 0x2d

    const/4 v5, -0x1

    const/4 v4, 0x0

    .line 66
    invoke-direct {p0, p1}, Lorg/apache/james/mime4j/io/LineReaderInputStream;-><init>(Ljava/io/InputStream;)V

    .line 67
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v3

    mul-int/lit8 v0, v3, 0x2

    .line 68
    .local v0, "bufferSize":I
    const/16 v3, 0x1000

    if-ge v0, v3, :cond_13

    .line 69
    const/16 v0, 0x1000

    .line 71
    :cond_13
    invoke-virtual {p1, v0}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->ensureCapacity(I)V

    .line 72
    iput-object p1, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->buffer:Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;

    .line 73
    iput-boolean v4, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->eof:Z

    .line 74
    iput v5, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->limit:I

    .line 75
    iput-boolean v4, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->atBoundary:Z

    .line 76
    iput v4, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->boundaryLen:I

    .line 77
    iput-boolean v4, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->lastPart:Z

    .line 78
    iput v5, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->initialLength:I

    .line 79
    iput-boolean v4, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->completed:Z

    .line 81
    iput-boolean p3, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->strict:Z

    .line 82
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, 0x2

    new-array v3, v3, [B

    iput-object v3, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->boundary:[B

    .line 83
    iget-object v3, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->boundary:[B

    aput-byte v6, v3, v4

    .line 84
    iget-object v3, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->boundary:[B

    const/4 v4, 0x1

    aput-byte v6, v3, v4

    .line 85
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_3c
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v2, v3, :cond_50

    .line 86
    invoke-virtual {p2, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    int-to-byte v1, v3

    .line 87
    .local v1, "ch":B
    iget-object v3, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->boundary:[B

    add-int/lit8 v4, v2, 0x2

    aput-byte v1, v3, v4

    .line 85
    add-int/lit8 v2, v2, 0x1

    goto :goto_3c

    .line 90
    .end local v1    # "ch":B
    :cond_50
    invoke-direct {p0}, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->fillBuffer()I

    .line 91
    return-void
.end method

.method private calculateBoundaryLen()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 280
    iget-object v1, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->boundary:[B

    array-length v1, v1

    iput v1, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->boundaryLen:I

    .line 281
    iget v1, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->limit:I

    iget-object v2, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->buffer:Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;

    invoke-virtual {v2}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->pos()I

    move-result v2

    sub-int v0, v1, v2

    .line 282
    .local v0, "len":I
    if-ltz v0, :cond_18

    iget v1, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->initialLength:I

    const/4 v2, -0x1

    if-ne v1, v2, :cond_18

    iput v0, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->initialLength:I

    .line 283
    :cond_18
    if-lez v0, :cond_34

    .line 284
    iget-object v1, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->buffer:Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;

    iget v2, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->limit:I

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v1, v2}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->byteAt(I)I

    move-result v1

    const/16 v2, 0xa

    if-ne v1, v2, :cond_34

    .line 285
    iget v1, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->boundaryLen:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->boundaryLen:I

    .line 286
    iget v1, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->limit:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->limit:I

    .line 289
    :cond_34
    const/4 v1, 0x1

    if-le v0, v1, :cond_51

    .line 290
    iget-object v1, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->buffer:Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;

    iget v2, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->limit:I

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v1, v2}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->byteAt(I)I

    move-result v1

    const/16 v2, 0xd

    if-ne v1, v2, :cond_51

    .line 291
    iget v1, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->boundaryLen:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->boundaryLen:I

    .line 292
    iget v1, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->limit:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->limit:I

    .line 295
    :cond_51
    return-void
.end method

.method private endOfStream()Z
    .registers 2

    .prologue
    .line 210
    iget-boolean v0, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->eof:Z

    if-nez v0, :cond_8

    iget-boolean v0, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->atBoundary:Z

    if-eqz v0, :cond_a

    :cond_8
    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private fillBuffer()I
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x1

    const/4 v6, -0x1

    .line 218
    iget-boolean v7, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->eof:Z

    if-eqz v7, :cond_8

    move v0, v6

    .line 268
    :goto_7
    return v0

    .line 222
    :cond_8
    invoke-direct {p0}, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->hasData()Z

    move-result v7

    if-nez v7, :cond_39

    .line 223
    iget-object v7, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->buffer:Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;

    invoke-virtual {v7}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->fillBuffer()I

    move-result v0

    .line 224
    .local v0, "bytesRead":I
    if-ne v0, v6, :cond_18

    .line 225
    iput-boolean v10, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->eof:Z

    .line 232
    :cond_18
    :goto_18
    iget-object v7, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->buffer:Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;

    invoke-virtual {v7}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->pos()I

    move-result v3

    .line 234
    .local v3, "off":I
    :goto_1e
    iget-object v7, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->buffer:Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;

    iget-object v8, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->boundary:[B

    iget-object v9, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->buffer:Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;

    invoke-virtual {v9}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->limit()I

    move-result v9

    sub-int/2addr v9, v3

    invoke-virtual {v7, v8, v3, v9}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->indexOf([BII)I

    move-result v2

    .line 235
    .local v2, "i":I
    if-ne v2, v6, :cond_3b

    .line 256
    :cond_2f
    if-eq v2, v6, :cond_75

    .line 257
    iput v2, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->limit:I

    .line 258
    iput-boolean v10, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->atBoundary:Z

    .line 259
    invoke-direct {p0}, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->calculateBoundaryLen()V

    goto :goto_7

    .line 228
    .end local v0    # "bytesRead":I
    .end local v2    # "i":I
    .end local v3    # "off":I
    :cond_39
    const/4 v0, 0x0

    .restart local v0    # "bytesRead":I
    goto :goto_18

    .line 240
    .restart local v2    # "i":I
    .restart local v3    # "off":I
    :cond_3b
    iget-object v7, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->buffer:Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;

    invoke-virtual {v7}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->pos()I

    move-result v7

    if-eq v2, v7, :cond_4f

    iget-object v7, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->buffer:Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;

    add-int/lit8 v8, v2, -0x1

    invoke-virtual {v7, v8}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->byteAt(I)I

    move-result v7

    const/16 v8, 0xa

    if-ne v7, v8, :cond_6f

    .line 241
    :cond_4f
    iget-object v7, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->boundary:[B

    array-length v7, v7

    add-int v4, v2, v7

    .line 242
    .local v4, "pos":I
    iget-object v7, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->buffer:Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;

    invoke-virtual {v7}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->limit()I

    move-result v7

    sub-int v5, v7, v4

    .line 243
    .local v5, "remaining":I
    if-lez v5, :cond_2f

    .line 248
    iget-object v7, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->buffer:Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;

    invoke-virtual {v7, v4}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->byteAt(I)I

    move-result v7

    int-to-char v1, v7

    .line 249
    .local v1, "ch":C
    invoke-static {v1}, Lorg/apache/james/mime4j/util/CharsetUtil;->isWhitespace(C)Z

    move-result v7

    if-nez v7, :cond_2f

    const/16 v7, 0x2d

    if-eq v1, v7, :cond_2f

    .line 254
    .end local v1    # "ch":C
    .end local v4    # "pos":I
    .end local v5    # "remaining":I
    :cond_6f
    iget-object v7, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->boundary:[B

    array-length v7, v7

    add-int v3, v2, v7

    goto :goto_1e

    .line 261
    :cond_75
    iget-boolean v6, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->eof:Z

    if-eqz v6, :cond_82

    .line 262
    iget-object v6, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->buffer:Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;

    invoke-virtual {v6}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->limit()I

    move-result v6

    iput v6, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->limit:I

    goto :goto_7

    .line 264
    :cond_82
    iget-object v6, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->buffer:Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;

    invoke-virtual {v6}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->limit()I

    move-result v6

    iget-object v7, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->boundary:[B

    array-length v7, v7

    add-int/lit8 v7, v7, 0x2

    sub-int/2addr v6, v7

    iput v6, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->limit:I

    goto/16 :goto_7
.end method

.method private hasData()Z
    .registers 3

    .prologue
    .line 214
    iget v0, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->limit:I

    iget-object v1, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->buffer:Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;

    invoke-virtual {v1}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->pos()I

    move-result v1

    if-le v0, v1, :cond_16

    iget v0, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->limit:I

    iget-object v1, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->buffer:Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;

    invoke-virtual {v1}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->limit()I

    move-result v1

    if-gt v0, v1, :cond_16

    const/4 v0, 0x1

    :goto_15
    return v0

    :cond_16
    const/4 v0, 0x0

    goto :goto_15
.end method

.method private skipBoundary()V
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v8, 0x2d

    const/16 v7, 0xa

    const/4 v6, 0x2

    const/4 v5, 0x1

    .line 298
    iget-boolean v3, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->completed:Z

    if-nez v3, :cond_50

    .line 299
    iput-boolean v5, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->completed:Z

    .line 300
    iget-object v3, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->buffer:Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;

    iget v4, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->boundaryLen:I

    invoke-virtual {v3, v4}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->skip(I)I

    .line 301
    const/4 v2, 0x1

    .line 303
    .local v2, "checkForLastPart":Z
    :goto_14
    iget-object v3, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->buffer:Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;

    invoke-virtual {v3}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->length()I

    move-result v3

    if-le v3, v5, :cond_5f

    .line 304
    iget-object v3, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->buffer:Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;

    iget-object v4, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->buffer:Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;

    invoke-virtual {v4}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->pos()I

    move-result v4

    invoke-virtual {v3, v4}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->byteAt(I)I

    move-result v0

    .line 305
    .local v0, "ch1":I
    iget-object v3, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->buffer:Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;

    iget-object v4, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->buffer:Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;

    invoke-virtual {v4}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->pos()I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    invoke-virtual {v3, v4}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->byteAt(I)I

    move-result v1

    .line 307
    .local v1, "ch2":I
    if-eqz v2, :cond_45

    if-ne v0, v8, :cond_45

    if-ne v1, v8, :cond_45

    .line 308
    iput-boolean v5, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->lastPart:Z

    .line 309
    iget-object v3, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->buffer:Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;

    invoke-virtual {v3, v6}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->skip(I)I

    .line 310
    const/4 v2, 0x0

    .line 311
    goto :goto_14

    .line 314
    :cond_45
    const/16 v3, 0xd

    if-ne v0, v3, :cond_51

    if-ne v1, v7, :cond_51

    .line 315
    iget-object v3, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->buffer:Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;

    invoke-virtual {v3, v6}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->skip(I)I

    .line 333
    .end local v0    # "ch1":I
    .end local v1    # "ch2":I
    .end local v2    # "checkForLastPart":Z
    :cond_50
    :goto_50
    return-void

    .line 317
    .restart local v0    # "ch1":I
    .restart local v1    # "ch2":I
    .restart local v2    # "checkForLastPart":Z
    :cond_51
    if-ne v0, v7, :cond_59

    .line 318
    iget-object v3, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->buffer:Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;

    invoke-virtual {v3, v5}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->skip(I)I

    goto :goto_50

    .line 322
    :cond_59
    iget-object v3, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->buffer:Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;

    invoke-virtual {v3, v5}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->skip(I)I

    goto :goto_14

    .line 326
    .end local v0    # "ch1":I
    .end local v1    # "ch2":I
    :cond_5f
    iget-boolean v3, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->eof:Z

    if-nez v3, :cond_50

    .line 329
    invoke-direct {p0}, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->fillBuffer()I

    goto :goto_14
.end method

.method private verifyEndOfStream()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 204
    iget-boolean v0, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->strict:Z

    if-eqz v0, :cond_19

    iget-boolean v0, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->eof:Z

    if-eqz v0, :cond_19

    iget-boolean v0, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->atBoundary:Z

    if-nez v0, :cond_19

    .line 205
    new-instance v0, Lorg/apache/james/mime4j/MimeIOException;

    new-instance v1, Lorg/apache/james/mime4j/MimeException;

    const-string v2, "Unexpected end of stream"

    invoke-direct {v1, v2}, Lorg/apache/james/mime4j/MimeException;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/apache/james/mime4j/MimeIOException;-><init>(Lorg/apache/james/mime4j/MimeException;)V

    throw v0

    .line 207
    :cond_19
    return-void
.end method


# virtual methods
.method public close()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 113
    return-void
.end method

.method public eof()Z
    .registers 2

    .prologue
    .line 340
    iget-boolean v0, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->eof:Z

    if-eqz v0, :cond_e

    iget-object v0, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->buffer:Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;

    invoke-virtual {v0}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->hasBufferedData()Z

    move-result v0

    if-nez v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public isEmptyStream()Z
    .registers 2

    .prologue
    .line 272
    iget v0, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->initialLength:I

    if-nez v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public isFullyConsumed()Z
    .registers 2

    .prologue
    .line 276
    iget-boolean v0, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->completed:Z

    if-eqz v0, :cond_e

    iget-object v0, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->buffer:Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;

    invoke-virtual {v0}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->hasBufferedData()Z

    move-result v0

    if-nez v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public isLastPart()Z
    .registers 2

    .prologue
    .line 336
    iget-boolean v0, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->lastPart:Z

    return v0
.end method

.method public markSupported()Z
    .registers 2

    .prologue
    .line 120
    const/4 v0, 0x0

    return v0
.end method

.method public read()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 141
    :goto_0
    invoke-virtual {p0}, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->readAllowed()Z

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, -0x1

    .line 143
    :goto_7
    return v0

    .line 142
    :cond_8
    invoke-direct {p0}, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->hasData()Z

    move-result v0

    if-eqz v0, :cond_15

    .line 143
    iget-object v0, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->buffer:Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;

    invoke-virtual {v0}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->read()I

    move-result v0

    goto :goto_7

    .line 145
    :cond_15
    invoke-direct {p0}, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->fillBuffer()I

    goto :goto_0
.end method

.method public read([BII)I
    .registers 7
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 152
    :goto_0
    invoke-virtual {p0}, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->readAllowed()Z

    move-result v1

    if-nez v1, :cond_8

    const/4 v1, -0x1

    .line 155
    :goto_7
    return v1

    .line 153
    :cond_8
    invoke-direct {p0}, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->hasData()Z

    move-result v1

    if-eqz v1, :cond_22

    .line 154
    iget v1, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->limit:I

    iget-object v2, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->buffer:Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;

    invoke-virtual {v2}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->pos()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-static {p3, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 155
    .local v0, "chunk":I
    iget-object v1, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->buffer:Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;

    invoke-virtual {v1, p1, p2, v0}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->read([BII)I

    move-result v1

    goto :goto_7

    .line 157
    .end local v0    # "chunk":I
    :cond_22
    invoke-direct {p0}, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->fillBuffer()I

    goto :goto_0
.end method

.method public readAllowed()Z
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 124
    iget-boolean v1, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->completed:Z

    if-eqz v1, :cond_6

    .line 132
    :goto_5
    return v0

    .line 127
    :cond_6
    invoke-direct {p0}, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->endOfStream()Z

    move-result v1

    if-eqz v1, :cond_19

    invoke-direct {p0}, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->hasData()Z

    move-result v1

    if-nez v1, :cond_19

    .line 128
    invoke-direct {p0}, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->skipBoundary()V

    .line 129
    invoke-direct {p0}, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->verifyEndOfStream()V

    goto :goto_5

    .line 132
    :cond_19
    const/4 v0, 0x1

    goto :goto_5
.end method

.method public readLine(Lorg/apache/james/mime4j/util/ByteArrayBuffer;)I
    .registers 12
    .param p1, "dst"    # Lorg/apache/james/mime4j/util/ByteArrayBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, -0x1

    .line 163
    if-nez p1, :cond_b

    .line 164
    new-instance v6, Ljava/lang/IllegalArgumentException;

    const-string v7, "Destination buffer may not be null"

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 166
    :cond_b
    invoke-virtual {p0}, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->readAllowed()Z

    move-result v7

    if-nez v7, :cond_13

    move v5, v6

    .line 199
    :cond_12
    :goto_12
    return v5

    .line 168
    :cond_13
    const/4 v5, 0x0

    .line 169
    .local v5, "total":I
    const/4 v2, 0x0

    .line 170
    .local v2, "found":Z
    const/4 v0, 0x0

    .line 171
    .local v0, "bytesRead":I
    :cond_16
    :goto_16
    if-nez v2, :cond_35

    .line 172
    invoke-direct {p0}, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->hasData()Z

    move-result v7

    if-nez v7, :cond_3b

    .line 173
    invoke-direct {p0}, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->fillBuffer()I

    move-result v0

    .line 174
    invoke-direct {p0}, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->endOfStream()Z

    move-result v7

    if-eqz v7, :cond_3b

    invoke-direct {p0}, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->hasData()Z

    move-result v7

    if-nez v7, :cond_3b

    .line 175
    invoke-direct {p0}, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->skipBoundary()V

    .line 176
    invoke-direct {p0}, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->verifyEndOfStream()V

    .line 177
    const/4 v0, -0x1

    .line 196
    :cond_35
    if-nez v5, :cond_12

    if-ne v0, v6, :cond_12

    move v5, v6

    .line 197
    goto :goto_12

    .line 181
    :cond_3b
    iget v7, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->limit:I

    iget-object v8, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->buffer:Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;

    invoke-virtual {v8}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->pos()I

    move-result v8

    sub-int v4, v7, v8

    .line 182
    .local v4, "len":I
    iget-object v7, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->buffer:Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;

    const/16 v8, 0xa

    iget-object v9, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->buffer:Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;

    invoke-virtual {v9}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->pos()I

    move-result v9

    invoke-virtual {v7, v8, v9, v4}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->indexOf(BII)I

    move-result v3

    .line 184
    .local v3, "i":I
    if-eq v3, v6, :cond_78

    .line 185
    const/4 v2, 0x1

    .line 186
    add-int/lit8 v7, v3, 0x1

    iget-object v8, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->buffer:Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;

    invoke-virtual {v8}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->pos()I

    move-result v8

    sub-int v1, v7, v8

    .line 190
    .local v1, "chunk":I
    :goto_60
    if-lez v1, :cond_16

    .line 191
    iget-object v7, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->buffer:Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;

    invoke-virtual {v7}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->buf()[B

    move-result-object v7

    iget-object v8, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->buffer:Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;

    invoke-virtual {v8}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->pos()I

    move-result v8

    invoke-virtual {p1, v7, v8, v1}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->append([BII)V

    .line 192
    iget-object v7, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->buffer:Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;

    invoke-virtual {v7, v1}, Lorg/apache/james/mime4j/io/BufferedLineReaderInputStream;->skip(I)I

    .line 193
    add-int/2addr v5, v1

    goto :goto_16

    .line 188
    .end local v1    # "chunk":I
    :cond_78
    move v1, v4

    .restart local v1    # "chunk":I
    goto :goto_60
.end method

.method public toString()Ljava/lang/String;
    .registers 7

    .prologue
    .line 345
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v5, "MimeBoundaryInputStream, boundary "

    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 346
    .local v2, "buffer":Ljava/lang/StringBuilder;
    iget-object v0, p0, Lorg/apache/james/mime4j/io/MimeBoundaryInputStream;->boundary:[B

    .local v0, "arr$":[B
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_b
    if-ge v3, v4, :cond_16

    aget-byte v1, v0, v3

    .line 347
    .local v1, "b":B
    int-to-char v5, v1

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 346
    add-int/lit8 v3, v3, 0x1

    goto :goto_b

    .line 349
    .end local v1    # "b":B
    :cond_16
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method public unread(Lorg/apache/james/mime4j/util/ByteArrayBuffer;)Z
    .registers 3
    .param p1, "buf"    # Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    .prologue
    .line 354
    const/4 v0, 0x0

    return v0
.end method
