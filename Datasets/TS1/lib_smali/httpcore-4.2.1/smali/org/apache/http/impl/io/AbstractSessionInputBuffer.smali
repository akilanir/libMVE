.class public abstract Lorg/apache/http/impl/io/AbstractSessionInputBuffer;
.super Ljava/lang/Object;
.source "AbstractSessionInputBuffer.java"

# interfaces
.implements Lorg/apache/http/io/SessionInputBuffer;
.implements Lorg/apache/http/io/BufferInfo;


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# static fields
.field private static final ASCII:Ljava/nio/charset/Charset;


# instance fields
.field private ascii:Z

.field private buffer:[B

.field private bufferlen:I

.field private bufferpos:I

.field private cbuf:Ljava/nio/CharBuffer;

.field private charset:Ljava/nio/charset/Charset;

.field private decoder:Ljava/nio/charset/CharsetDecoder;

.field private instream:Ljava/io/InputStream;

.field private linebuffer:Lorg/apache/http/util/ByteArrayBuffer;

.field private maxLineLen:I

.field private metrics:Lorg/apache/http/impl/io/HttpTransportMetricsImpl;

.field private minChunkLimit:I

.field private onMalformedInputAction:Ljava/nio/charset/CodingErrorAction;

.field private onUnMappableInputAction:Ljava/nio/charset/CodingErrorAction;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 72
    const-string v0, "US-ASCII"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    sput-object v0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->ASCII:Ljava/nio/charset/Charset;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 79
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->linebuffer:Lorg/apache/http/util/ByteArrayBuffer;

    .line 84
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->ascii:Z

    .line 85
    const/4 v0, -0x1

    iput v0, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->maxLineLen:I

    .line 86
    const/16 v0, 0x200

    iput v0, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->minChunkLimit:I

    return-void
.end method

.method private appendDecoded(Lorg/apache/http/util/CharArrayBuffer;Ljava/nio/ByteBuffer;)I
    .registers 8
    .param p1, "charbuffer"    # Lorg/apache/http/util/CharArrayBuffer;
    .param p2, "bbuf"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 356
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v2

    if-nez v2, :cond_8

    .line 357
    const/4 v0, 0x0

    .line 376
    :goto_7
    return v0

    .line 359
    :cond_8
    iget-object v2, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->decoder:Ljava/nio/charset/CharsetDecoder;

    if-nez v2, :cond_22

    .line 360
    iget-object v2, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->charset:Ljava/nio/charset/Charset;

    invoke-virtual {v2}, Ljava/nio/charset/Charset;->newDecoder()Ljava/nio/charset/CharsetDecoder;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->decoder:Ljava/nio/charset/CharsetDecoder;

    .line 361
    iget-object v2, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->decoder:Ljava/nio/charset/CharsetDecoder;

    iget-object v3, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->onMalformedInputAction:Ljava/nio/charset/CodingErrorAction;

    invoke-virtual {v2, v3}, Ljava/nio/charset/CharsetDecoder;->onMalformedInput(Ljava/nio/charset/CodingErrorAction;)Ljava/nio/charset/CharsetDecoder;

    .line 362
    iget-object v2, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->decoder:Ljava/nio/charset/CharsetDecoder;

    iget-object v3, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->onUnMappableInputAction:Ljava/nio/charset/CodingErrorAction;

    invoke-virtual {v2, v3}, Ljava/nio/charset/CharsetDecoder;->onUnmappableCharacter(Ljava/nio/charset/CodingErrorAction;)Ljava/nio/charset/CharsetDecoder;

    .line 364
    :cond_22
    iget-object v2, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->cbuf:Ljava/nio/CharBuffer;

    if-nez v2, :cond_2e

    .line 365
    const/16 v2, 0x400

    invoke-static {v2}, Ljava/nio/CharBuffer;->allocate(I)Ljava/nio/CharBuffer;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->cbuf:Ljava/nio/CharBuffer;

    .line 367
    :cond_2e
    iget-object v2, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->decoder:Ljava/nio/charset/CharsetDecoder;

    invoke-virtual {v2}, Ljava/nio/charset/CharsetDecoder;->reset()Ljava/nio/charset/CharsetDecoder;

    .line 368
    const/4 v0, 0x0

    .line 369
    .local v0, "len":I
    :goto_34
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v2

    if-eqz v2, :cond_49

    .line 370
    iget-object v2, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->decoder:Ljava/nio/charset/CharsetDecoder;

    iget-object v3, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->cbuf:Ljava/nio/CharBuffer;

    const/4 v4, 0x1

    invoke-virtual {v2, p2, v3, v4}, Ljava/nio/charset/CharsetDecoder;->decode(Ljava/nio/ByteBuffer;Ljava/nio/CharBuffer;Z)Ljava/nio/charset/CoderResult;

    move-result-object v1

    .line 371
    .local v1, "result":Ljava/nio/charset/CoderResult;
    invoke-direct {p0, v1, p1, p2}, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->handleDecodingResult(Ljava/nio/charset/CoderResult;Lorg/apache/http/util/CharArrayBuffer;Ljava/nio/ByteBuffer;)I

    move-result v2

    add-int/2addr v0, v2

    .line 372
    goto :goto_34

    .line 373
    .end local v1    # "result":Ljava/nio/charset/CoderResult;
    :cond_49
    iget-object v2, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->decoder:Ljava/nio/charset/CharsetDecoder;

    iget-object v3, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->cbuf:Ljava/nio/CharBuffer;

    invoke-virtual {v2, v3}, Ljava/nio/charset/CharsetDecoder;->flush(Ljava/nio/CharBuffer;)Ljava/nio/charset/CoderResult;

    move-result-object v1

    .line 374
    .restart local v1    # "result":Ljava/nio/charset/CoderResult;
    invoke-direct {p0, v1, p1, p2}, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->handleDecodingResult(Ljava/nio/charset/CoderResult;Lorg/apache/http/util/CharArrayBuffer;Ljava/nio/ByteBuffer;)I

    move-result v2

    add-int/2addr v0, v2

    .line 375
    iget-object v2, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->cbuf:Ljava/nio/CharBuffer;

    invoke-virtual {v2}, Ljava/nio/CharBuffer;->clear()Ljava/nio/Buffer;

    goto :goto_7
.end method

.method private handleDecodingResult(Ljava/nio/charset/CoderResult;Lorg/apache/http/util/CharArrayBuffer;Ljava/nio/ByteBuffer;)I
    .registers 6
    .param p1, "result"    # Ljava/nio/charset/CoderResult;
    .param p2, "charbuffer"    # Lorg/apache/http/util/CharArrayBuffer;
    .param p3, "bbuf"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 383
    invoke-virtual {p1}, Ljava/nio/charset/CoderResult;->isError()Z

    move-result v1

    if-eqz v1, :cond_9

    .line 384
    invoke-virtual {p1}, Ljava/nio/charset/CoderResult;->throwException()V

    .line 386
    :cond_9
    iget-object v1, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->cbuf:Ljava/nio/CharBuffer;

    invoke-virtual {v1}, Ljava/nio/CharBuffer;->flip()Ljava/nio/Buffer;

    .line 387
    iget-object v1, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->cbuf:Ljava/nio/CharBuffer;

    invoke-virtual {v1}, Ljava/nio/CharBuffer;->remaining()I

    move-result v0

    .line 388
    .local v0, "len":I
    :goto_14
    iget-object v1, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->cbuf:Ljava/nio/CharBuffer;

    invoke-virtual {v1}, Ljava/nio/CharBuffer;->hasRemaining()Z

    move-result v1

    if-eqz v1, :cond_26

    .line 389
    iget-object v1, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->cbuf:Ljava/nio/CharBuffer;

    invoke-virtual {v1}, Ljava/nio/CharBuffer;->get()C

    move-result v1

    invoke-virtual {p2, v1}, Lorg/apache/http/util/CharArrayBuffer;->append(C)V

    goto :goto_14

    .line 391
    :cond_26
    iget-object v1, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->cbuf:Ljava/nio/CharBuffer;

    invoke-virtual {v1}, Ljava/nio/CharBuffer;->compact()Ljava/nio/CharBuffer;

    .line 392
    return v0
.end method

.method private lineFromLineBuffer(Lorg/apache/http/util/CharArrayBuffer;)I
    .registers 7
    .param p1, "charbuffer"    # Lorg/apache/http/util/CharArrayBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 313
    iget-object v2, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->linebuffer:Lorg/apache/http/util/ByteArrayBuffer;

    invoke-virtual {v2}, Lorg/apache/http/util/ByteArrayBuffer;->length()I

    move-result v1

    .line 314
    .local v1, "len":I
    if-lez v1, :cond_27

    .line 315
    iget-object v2, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->linebuffer:Lorg/apache/http/util/ByteArrayBuffer;

    add-int/lit8 v3, v1, -0x1

    invoke-virtual {v2, v3}, Lorg/apache/http/util/ByteArrayBuffer;->byteAt(I)I

    move-result v2

    const/16 v3, 0xa

    if-ne v2, v3, :cond_17

    .line 316
    add-int/lit8 v1, v1, -0x1

    .line 319
    :cond_17
    if-lez v1, :cond_27

    .line 320
    iget-object v2, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->linebuffer:Lorg/apache/http/util/ByteArrayBuffer;

    add-int/lit8 v3, v1, -0x1

    invoke-virtual {v2, v3}, Lorg/apache/http/util/ByteArrayBuffer;->byteAt(I)I

    move-result v2

    const/16 v3, 0xd

    if-ne v2, v3, :cond_27

    .line 321
    add-int/lit8 v1, v1, -0x1

    .line 325
    :cond_27
    iget-boolean v2, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->ascii:Z

    if-eqz v2, :cond_36

    .line 326
    iget-object v2, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->linebuffer:Lorg/apache/http/util/ByteArrayBuffer;

    invoke-virtual {p1, v2, v4, v1}, Lorg/apache/http/util/CharArrayBuffer;->append(Lorg/apache/http/util/ByteArrayBuffer;II)V

    .line 331
    :goto_30
    iget-object v2, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->linebuffer:Lorg/apache/http/util/ByteArrayBuffer;

    invoke-virtual {v2}, Lorg/apache/http/util/ByteArrayBuffer;->clear()V

    .line 332
    return v1

    .line 328
    :cond_36
    iget-object v2, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->linebuffer:Lorg/apache/http/util/ByteArrayBuffer;

    invoke-virtual {v2}, Lorg/apache/http/util/ByteArrayBuffer;->buffer()[B

    move-result-object v2

    invoke-static {v2, v4, v1}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 329
    .local v0, "bbuf":Ljava/nio/ByteBuffer;
    invoke-direct {p0, p1, v0}, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->appendDecoded(Lorg/apache/http/util/CharArrayBuffer;Ljava/nio/ByteBuffer;)I

    move-result v1

    goto :goto_30
.end method

.method private lineFromReadBuffer(Lorg/apache/http/util/CharArrayBuffer;I)I
    .registers 8
    .param p1, "charbuffer"    # Lorg/apache/http/util/CharArrayBuffer;
    .param p2, "pos"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 337
    iget v2, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->bufferpos:I

    .line 339
    .local v2, "off":I
    add-int/lit8 v3, p2, 0x1

    iput v3, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->bufferpos:I

    .line 340
    if-le p2, v2, :cond_14

    iget-object v3, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->buffer:[B

    add-int/lit8 v4, p2, -0x1

    aget-byte v3, v3, v4

    const/16 v4, 0xd

    if-ne v3, v4, :cond_14

    .line 342
    add-int/lit8 p2, p2, -0x1

    .line 344
    :cond_14
    sub-int v1, p2, v2

    .line 345
    .local v1, "len":I
    iget-boolean v3, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->ascii:Z

    if-eqz v3, :cond_20

    .line 346
    iget-object v3, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->buffer:[B

    invoke-virtual {p1, v3, v2, v1}, Lorg/apache/http/util/CharArrayBuffer;->append([BII)V

    .line 351
    :goto_1f
    return v1

    .line 348
    :cond_20
    iget-object v3, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->buffer:[B

    invoke-static {v3, v2, v1}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 349
    .local v0, "bbuf":Ljava/nio/ByteBuffer;
    invoke-direct {p0, p1, v0}, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->appendDecoded(Lorg/apache/http/util/CharArrayBuffer;Ljava/nio/ByteBuffer;)I

    move-result v1

    goto :goto_1f
.end method

.method private locateLF()I
    .registers 4

    .prologue
    .line 232
    iget v0, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->bufferpos:I

    .local v0, "i":I
    :goto_2
    iget v1, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->bufferlen:I

    if-ge v0, v1, :cond_12

    .line 233
    iget-object v1, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->buffer:[B

    aget-byte v1, v1, v0

    const/16 v2, 0xa

    if-ne v1, v2, :cond_f

    .line 237
    .end local v0    # "i":I
    :goto_e
    return v0

    .line 232
    .restart local v0    # "i":I
    :cond_f
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 237
    :cond_12
    const/4 v0, -0x1

    goto :goto_e
.end method


# virtual methods
.method public available()I
    .registers 3

    .prologue
    .line 150
    invoke-virtual {p0}, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->capacity()I

    move-result v0

    invoke-virtual {p0}, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->length()I

    move-result v1

    sub-int/2addr v0, v1

    return v0
.end method

.method public capacity()I
    .registers 2

    .prologue
    .line 136
    iget-object v0, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->buffer:[B

    array-length v0, v0

    return v0
.end method

.method protected createTransportMetrics()Lorg/apache/http/impl/io/HttpTransportMetricsImpl;
    .registers 2

    .prologue
    .line 129
    new-instance v0, Lorg/apache/http/impl/io/HttpTransportMetricsImpl;

    invoke-direct {v0}, Lorg/apache/http/impl/io/HttpTransportMetricsImpl;-><init>()V

    return-object v0
.end method

.method protected fillBuffer()I
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    const/4 v3, -0x1

    .line 155
    iget v4, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->bufferpos:I

    if-lez v4, :cond_1b

    .line 156
    iget v4, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->bufferlen:I

    iget v5, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->bufferpos:I

    sub-int v1, v4, v5

    .line 157
    .local v1, "len":I
    if-lez v1, :cond_17

    .line 158
    iget-object v4, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->buffer:[B

    iget v5, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->bufferpos:I

    iget-object v6, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->buffer:[B

    invoke-static {v4, v5, v6, v7, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 160
    :cond_17
    iput v7, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->bufferpos:I

    .line 161
    iput v1, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->bufferlen:I

    .line 164
    .end local v1    # "len":I
    :cond_1b
    iget v2, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->bufferlen:I

    .line 165
    .local v2, "off":I
    iget-object v4, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->buffer:[B

    array-length v4, v4

    sub-int v1, v4, v2

    .line 166
    .restart local v1    # "len":I
    iget-object v4, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->instream:Ljava/io/InputStream;

    iget-object v5, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->buffer:[B

    invoke-virtual {v4, v5, v2, v1}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 167
    .local v0, "l":I
    if-ne v0, v3, :cond_2e

    move v0, v3

    .line 172
    .end local v0    # "l":I
    :goto_2d
    return v0

    .line 170
    .restart local v0    # "l":I
    :cond_2e
    add-int v3, v2, v0

    iput v3, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->bufferlen:I

    .line 171
    iget-object v3, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->metrics:Lorg/apache/http/impl/io/HttpTransportMetricsImpl;

    int-to-long v4, v0

    invoke-virtual {v3, v4, v5}, Lorg/apache/http/impl/io/HttpTransportMetricsImpl;->incrementBytesTransferred(J)V

    goto :goto_2d
.end method

.method public getMetrics()Lorg/apache/http/io/HttpTransportMetrics;
    .registers 2

    .prologue
    .line 406
    iget-object v0, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->metrics:Lorg/apache/http/impl/io/HttpTransportMetricsImpl;

    return-object v0
.end method

.method protected hasBufferedData()Z
    .registers 3

    .prologue
    .line 177
    iget v0, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->bufferpos:I

    iget v1, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->bufferlen:I

    if-ge v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method protected init(Ljava/io/InputStream;ILorg/apache/http/params/HttpParams;)V
    .registers 6
    .param p1, "instream"    # Ljava/io/InputStream;
    .param p2, "buffersize"    # I
    .param p3, "params"    # Lorg/apache/http/params/HttpParams;

    .prologue
    const/4 v1, 0x0

    .line 101
    if-nez p1, :cond_b

    .line 102
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Input stream may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 104
    :cond_b
    if-gtz p2, :cond_15

    .line 105
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Buffer size may not be negative or zero"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 107
    :cond_15
    if-nez p3, :cond_1f

    .line 108
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "HTTP parameters may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 110
    :cond_1f
    iput-object p1, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->instream:Ljava/io/InputStream;

    .line 111
    new-array v0, p2, [B

    iput-object v0, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->buffer:[B

    .line 112
    iput v1, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->bufferpos:I

    .line 113
    iput v1, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->bufferlen:I

    .line 114
    new-instance v0, Lorg/apache/http/util/ByteArrayBuffer;

    invoke-direct {v0, p2}, Lorg/apache/http/util/ByteArrayBuffer;-><init>(I)V

    iput-object v0, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->linebuffer:Lorg/apache/http/util/ByteArrayBuffer;

    .line 115
    invoke-static {p3}, Lorg/apache/http/params/HttpProtocolParams;->getHttpElementCharset(Lorg/apache/http/params/HttpParams;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->charset:Ljava/nio/charset/Charset;

    .line 116
    iget-object v0, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->charset:Ljava/nio/charset/Charset;

    sget-object v1, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {v0, v1}, Ljava/nio/charset/Charset;->equals(Ljava/lang/Object;)Z

    move-result v0

    iput-boolean v0, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->ascii:Z

    .line 117
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->decoder:Ljava/nio/charset/CharsetDecoder;

    .line 118
    const-string v0, "http.connection.max-line-length"

    const/4 v1, -0x1

    invoke-interface {p3, v0, v1}, Lorg/apache/http/params/HttpParams;->getIntParameter(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->maxLineLen:I

    .line 119
    const-string v0, "http.connection.min-chunk-limit"

    const/16 v1, 0x200

    invoke-interface {p3, v0, v1}, Lorg/apache/http/params/HttpParams;->getIntParameter(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->minChunkLimit:I

    .line 120
    invoke-virtual {p0}, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->createTransportMetrics()Lorg/apache/http/impl/io/HttpTransportMetricsImpl;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->metrics:Lorg/apache/http/impl/io/HttpTransportMetricsImpl;

    .line 121
    invoke-static {p3}, Lorg/apache/http/params/HttpProtocolParams;->getMalformedInputAction(Lorg/apache/http/params/HttpParams;)Ljava/nio/charset/CodingErrorAction;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->onMalformedInputAction:Ljava/nio/charset/CodingErrorAction;

    .line 122
    invoke-static {p3}, Lorg/apache/http/params/HttpProtocolParams;->getUnmappableInputAction(Lorg/apache/http/params/HttpParams;)Ljava/nio/charset/CodingErrorAction;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->onUnMappableInputAction:Ljava/nio/charset/CodingErrorAction;

    .line 123
    return-void
.end method

.method public length()I
    .registers 3

    .prologue
    .line 143
    iget v0, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->bufferlen:I

    iget v1, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->bufferpos:I

    sub-int/2addr v0, v1

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

    .line 181
    const/4 v0, 0x0

    .line 182
    .local v0, "noRead":I
    :cond_2
    invoke-virtual {p0}, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->hasBufferedData()Z

    move-result v2

    if-nez v2, :cond_f

    .line 183
    invoke-virtual {p0}, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->fillBuffer()I

    move-result v0

    .line 184
    if-ne v0, v1, :cond_2

    .line 188
    :goto_e
    return v1

    :cond_f
    iget-object v1, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->buffer:[B

    iget v2, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->bufferpos:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->bufferpos:I

    aget-byte v1, v1, v2

    and-int/lit16 v1, v1, 0xff

    goto :goto_e
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

    .line 225
    if-nez p1, :cond_4

    .line 228
    :goto_3
    return v0

    :cond_4
    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->read([BII)I

    move-result v0

    goto :goto_3
.end method

.method public read([BII)I
    .registers 10
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

    .line 192
    if-nez p1, :cond_5

    .line 193
    const/4 v0, 0x0

    .line 220
    :goto_4
    return v0

    .line 195
    :cond_5
    invoke-virtual {p0}, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->hasBufferedData()Z

    move-result v3

    if-eqz v3, :cond_21

    .line 196
    iget v3, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->bufferlen:I

    iget v4, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->bufferpos:I

    sub-int/2addr v3, v4

    invoke-static {p3, v3}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 197
    .local v0, "chunk":I
    iget-object v3, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->buffer:[B

    iget v4, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->bufferpos:I

    invoke-static {v3, v4, p1, p2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 198
    iget v3, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->bufferpos:I

    add-int/2addr v3, v0

    iput v3, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->bufferpos:I

    goto :goto_4

    .line 203
    .end local v0    # "chunk":I
    :cond_21
    iget v3, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->minChunkLimit:I

    if-le p3, v3, :cond_35

    .line 204
    iget-object v3, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->instream:Ljava/io/InputStream;

    invoke-virtual {v3, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v2

    .line 205
    .local v2, "read":I
    if-lez v2, :cond_33

    .line 206
    iget-object v3, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->metrics:Lorg/apache/http/impl/io/HttpTransportMetricsImpl;

    int-to-long v4, v2

    invoke-virtual {v3, v4, v5}, Lorg/apache/http/impl/io/HttpTransportMetricsImpl;->incrementBytesTransferred(J)V

    :cond_33
    move v0, v2

    .line 208
    goto :goto_4

    .line 211
    .end local v2    # "read":I
    :cond_35
    invoke-virtual {p0}, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->hasBufferedData()Z

    move-result v3

    if-nez v3, :cond_42

    .line 212
    invoke-virtual {p0}, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->fillBuffer()I

    move-result v1

    .line 213
    .local v1, "noRead":I
    if-ne v1, v0, :cond_35

    goto :goto_4

    .line 217
    .end local v1    # "noRead":I
    :cond_42
    iget v3, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->bufferlen:I

    iget v4, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->bufferpos:I

    sub-int/2addr v3, v4

    invoke-static {p3, v3}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 218
    .restart local v0    # "chunk":I
    iget-object v3, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->buffer:[B

    iget v4, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->bufferpos:I

    invoke-static {v3, v4, p1, p2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 219
    iget v3, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->bufferpos:I

    add-int/2addr v3, v0

    iput v3, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->bufferpos:I

    goto :goto_4
.end method

.method public readLine(Lorg/apache/http/util/CharArrayBuffer;)I
    .registers 10
    .param p1, "charbuffer"    # Lorg/apache/http/util/CharArrayBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, -0x1

    .line 256
    if-nez p1, :cond_b

    .line 257
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "Char array buffer may not be null"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 259
    :cond_b
    const/4 v2, 0x0

    .line 260
    .local v2, "noRead":I
    const/4 v3, 0x1

    .line 261
    .local v3, "retry":Z
    :cond_d
    if-eqz v3, :cond_6d

    .line 263
    invoke-direct {p0}, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->locateLF()I

    move-result v0

    .line 264
    .local v0, "i":I
    if-eq v0, v4, :cond_4c

    .line 266
    iget-object v5, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->linebuffer:Lorg/apache/http/util/ByteArrayBuffer;

    invoke-virtual {v5}, Lorg/apache/http/util/ByteArrayBuffer;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_22

    .line 268
    invoke-direct {p0, p1, v0}, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->lineFromReadBuffer(Lorg/apache/http/util/CharArrayBuffer;I)I

    move-result v4

    .line 294
    .end local v0    # "i":I
    :cond_21
    :goto_21
    return v4

    .line 270
    .restart local v0    # "i":I
    :cond_22
    const/4 v3, 0x0

    .line 271
    add-int/lit8 v5, v0, 0x1

    iget v6, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->bufferpos:I

    sub-int v1, v5, v6

    .line 272
    .local v1, "len":I
    iget-object v5, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->linebuffer:Lorg/apache/http/util/ByteArrayBuffer;

    iget-object v6, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->buffer:[B

    iget v7, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->bufferpos:I

    invoke-virtual {v5, v6, v7, v1}, Lorg/apache/http/util/ByteArrayBuffer;->append([BII)V

    .line 273
    add-int/lit8 v5, v0, 0x1

    iput v5, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->bufferpos:I

    .line 286
    .end local v1    # "len":I
    :cond_36
    :goto_36
    iget v5, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->maxLineLen:I

    if-lez v5, :cond_d

    iget-object v5, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->linebuffer:Lorg/apache/http/util/ByteArrayBuffer;

    invoke-virtual {v5}, Lorg/apache/http/util/ByteArrayBuffer;->length()I

    move-result v5

    iget v6, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->maxLineLen:I

    if-lt v5, v6, :cond_d

    .line 287
    new-instance v4, Ljava/io/IOException;

    const-string v5, "Maximum line length limit exceeded"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 276
    :cond_4c
    invoke-virtual {p0}, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->hasBufferedData()Z

    move-result v5

    if-eqz v5, :cond_65

    .line 277
    iget v5, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->bufferlen:I

    iget v6, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->bufferpos:I

    sub-int v1, v5, v6

    .line 278
    .restart local v1    # "len":I
    iget-object v5, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->linebuffer:Lorg/apache/http/util/ByteArrayBuffer;

    iget-object v6, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->buffer:[B

    iget v7, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->bufferpos:I

    invoke-virtual {v5, v6, v7, v1}, Lorg/apache/http/util/ByteArrayBuffer;->append([BII)V

    .line 279
    iget v5, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->bufferlen:I

    iput v5, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->bufferpos:I

    .line 281
    .end local v1    # "len":I
    :cond_65
    invoke-virtual {p0}, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->fillBuffer()I

    move-result v2

    .line 282
    if-ne v2, v4, :cond_36

    .line 283
    const/4 v3, 0x0

    goto :goto_36

    .line 290
    .end local v0    # "i":I
    :cond_6d
    if-ne v2, v4, :cond_77

    iget-object v5, p0, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->linebuffer:Lorg/apache/http/util/ByteArrayBuffer;

    invoke-virtual {v5}, Lorg/apache/http/util/ByteArrayBuffer;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_21

    .line 294
    :cond_77
    invoke-direct {p0, p1}, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->lineFromLineBuffer(Lorg/apache/http/util/CharArrayBuffer;)I

    move-result v4

    goto :goto_21
.end method

.method public readLine()Ljava/lang/String;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 396
    new-instance v0, Lorg/apache/http/util/CharArrayBuffer;

    const/16 v2, 0x40

    invoke-direct {v0, v2}, Lorg/apache/http/util/CharArrayBuffer;-><init>(I)V

    .line 397
    .local v0, "charbuffer":Lorg/apache/http/util/CharArrayBuffer;
    invoke-virtual {p0, v0}, Lorg/apache/http/impl/io/AbstractSessionInputBuffer;->readLine(Lorg/apache/http/util/CharArrayBuffer;)I

    move-result v1

    .line 398
    .local v1, "l":I
    const/4 v2, -0x1

    if-eq v1, v2, :cond_13

    .line 399
    invoke-virtual {v0}, Lorg/apache/http/util/CharArrayBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 401
    :goto_12
    return-object v2

    :cond_13
    const/4 v2, 0x0

    goto :goto_12
.end method
