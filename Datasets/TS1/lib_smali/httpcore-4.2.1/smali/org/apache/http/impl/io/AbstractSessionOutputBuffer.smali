.class public abstract Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;
.super Ljava/lang/Object;
.source "AbstractSessionOutputBuffer.java"

# interfaces
.implements Lorg/apache/http/io/SessionOutputBuffer;
.implements Lorg/apache/http/io/BufferInfo;


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# static fields
.field private static final ASCII:Ljava/nio/charset/Charset;

.field private static final CRLF:[B


# instance fields
.field private ascii:Z

.field private bbuf:Ljava/nio/ByteBuffer;

.field private buffer:Lorg/apache/http/util/ByteArrayBuffer;

.field private charset:Ljava/nio/charset/Charset;

.field private encoder:Ljava/nio/charset/CharsetEncoder;

.field private metrics:Lorg/apache/http/impl/io/HttpTransportMetricsImpl;

.field private minChunkLimit:I

.field private onMalformedInputAction:Ljava/nio/charset/CodingErrorAction;

.field private onUnMappableInputAction:Ljava/nio/charset/CodingErrorAction;

.field private outstream:Ljava/io/OutputStream;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 71
    const-string v0, "US-ASCII"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    sput-object v0, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->ASCII:Ljava/nio/charset/Charset;

    .line 72
    const/4 v0, 0x2

    new-array v0, v0, [B

    fill-array-data v0, :array_12

    sput-object v0, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->CRLF:[B

    return-void

    nop

    :array_12
    .array-data 1
        0xdt
        0xat
    .end array-data
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 80
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->ascii:Z

    .line 81
    const/16 v0, 0x200

    iput v0, p0, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->minChunkLimit:I

    return-void
.end method

.method private handleEncodingResult(Ljava/nio/charset/CoderResult;)V
    .registers 3
    .param p1, "result"    # Ljava/nio/charset/CoderResult;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 281
    invoke-virtual {p1}, Ljava/nio/charset/CoderResult;->isError()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 282
    invoke-virtual {p1}, Ljava/nio/charset/CoderResult;->throwException()V

    .line 284
    :cond_9
    iget-object v0, p0, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->bbuf:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 285
    :goto_e
    iget-object v0, p0, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->bbuf:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v0

    if-eqz v0, :cond_20

    .line 286
    iget-object v0, p0, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->bbuf:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    invoke-virtual {p0, v0}, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->write(I)V

    goto :goto_e

    .line 288
    :cond_20
    iget-object v0, p0, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->bbuf:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->compact()Ljava/nio/ByteBuffer;

    .line 289
    return-void
.end method

.method private writeEncoded(Ljava/nio/CharBuffer;)V
    .registers 6
    .param p1, "cbuf"    # Ljava/nio/CharBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 259
    invoke-virtual {p1}, Ljava/nio/CharBuffer;->hasRemaining()Z

    move-result v1

    if-nez v1, :cond_7

    .line 278
    :goto_6
    return-void

    .line 262
    :cond_7
    iget-object v1, p0, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->encoder:Ljava/nio/charset/CharsetEncoder;

    if-nez v1, :cond_21

    .line 263
    iget-object v1, p0, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->charset:Ljava/nio/charset/Charset;

    invoke-virtual {v1}, Ljava/nio/charset/Charset;->newEncoder()Ljava/nio/charset/CharsetEncoder;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->encoder:Ljava/nio/charset/CharsetEncoder;

    .line 264
    iget-object v1, p0, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->encoder:Ljava/nio/charset/CharsetEncoder;

    iget-object v2, p0, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->onMalformedInputAction:Ljava/nio/charset/CodingErrorAction;

    invoke-virtual {v1, v2}, Ljava/nio/charset/CharsetEncoder;->onMalformedInput(Ljava/nio/charset/CodingErrorAction;)Ljava/nio/charset/CharsetEncoder;

    .line 265
    iget-object v1, p0, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->encoder:Ljava/nio/charset/CharsetEncoder;

    iget-object v2, p0, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->onUnMappableInputAction:Ljava/nio/charset/CodingErrorAction;

    invoke-virtual {v1, v2}, Ljava/nio/charset/CharsetEncoder;->onUnmappableCharacter(Ljava/nio/charset/CodingErrorAction;)Ljava/nio/charset/CharsetEncoder;

    .line 267
    :cond_21
    iget-object v1, p0, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->bbuf:Ljava/nio/ByteBuffer;

    if-nez v1, :cond_2d

    .line 268
    const/16 v1, 0x400

    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->bbuf:Ljava/nio/ByteBuffer;

    .line 270
    :cond_2d
    iget-object v1, p0, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->encoder:Ljava/nio/charset/CharsetEncoder;

    invoke-virtual {v1}, Ljava/nio/charset/CharsetEncoder;->reset()Ljava/nio/charset/CharsetEncoder;

    .line 271
    :goto_32
    invoke-virtual {p1}, Ljava/nio/CharBuffer;->hasRemaining()Z

    move-result v1

    if-eqz v1, :cond_45

    .line 272
    iget-object v1, p0, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->encoder:Ljava/nio/charset/CharsetEncoder;

    iget-object v2, p0, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->bbuf:Ljava/nio/ByteBuffer;

    const/4 v3, 0x1

    invoke-virtual {v1, p1, v2, v3}, Ljava/nio/charset/CharsetEncoder;->encode(Ljava/nio/CharBuffer;Ljava/nio/ByteBuffer;Z)Ljava/nio/charset/CoderResult;

    move-result-object v0

    .line 273
    .local v0, "result":Ljava/nio/charset/CoderResult;
    invoke-direct {p0, v0}, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->handleEncodingResult(Ljava/nio/charset/CoderResult;)V

    goto :goto_32

    .line 275
    .end local v0    # "result":Ljava/nio/charset/CoderResult;
    :cond_45
    iget-object v1, p0, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->encoder:Ljava/nio/charset/CharsetEncoder;

    iget-object v2, p0, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->bbuf:Ljava/nio/ByteBuffer;

    invoke-virtual {v1, v2}, Ljava/nio/charset/CharsetEncoder;->flush(Ljava/nio/ByteBuffer;)Ljava/nio/charset/CoderResult;

    move-result-object v0

    .line 276
    .restart local v0    # "result":Ljava/nio/charset/CoderResult;
    invoke-direct {p0, v0}, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->handleEncodingResult(Ljava/nio/charset/CoderResult;)V

    .line 277
    iget-object v1, p0, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->bbuf:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    goto :goto_6
.end method


# virtual methods
.method public available()I
    .registers 3

    .prologue
    .line 141
    invoke-virtual {p0}, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->capacity()I

    move-result v0

    invoke-virtual {p0}, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->length()I

    move-result v1

    sub-int/2addr v0, v1

    return v0
.end method

.method public capacity()I
    .registers 2

    .prologue
    .line 127
    iget-object v0, p0, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->buffer:Lorg/apache/http/util/ByteArrayBuffer;

    invoke-virtual {v0}, Lorg/apache/http/util/ByteArrayBuffer;->capacity()I

    move-result v0

    return v0
.end method

.method protected createTransportMetrics()Lorg/apache/http/impl/io/HttpTransportMetricsImpl;
    .registers 2

    .prologue
    .line 120
    new-instance v0, Lorg/apache/http/impl/io/HttpTransportMetricsImpl;

    invoke-direct {v0}, Lorg/apache/http/impl/io/HttpTransportMetricsImpl;-><init>()V

    return-object v0
.end method

.method public flush()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 154
    invoke-virtual {p0}, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->flushBuffer()V

    .line 155
    iget-object v0, p0, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->outstream:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 156
    return-void
.end method

.method protected flushBuffer()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 145
    iget-object v1, p0, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->buffer:Lorg/apache/http/util/ByteArrayBuffer;

    invoke-virtual {v1}, Lorg/apache/http/util/ByteArrayBuffer;->length()I

    move-result v0

    .line 146
    .local v0, "len":I
    if-lez v0, :cond_1f

    .line 147
    iget-object v1, p0, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->outstream:Ljava/io/OutputStream;

    iget-object v2, p0, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->buffer:Lorg/apache/http/util/ByteArrayBuffer;

    invoke-virtual {v2}, Lorg/apache/http/util/ByteArrayBuffer;->buffer()[B

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3, v0}, Ljava/io/OutputStream;->write([BII)V

    .line 148
    iget-object v1, p0, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->buffer:Lorg/apache/http/util/ByteArrayBuffer;

    invoke-virtual {v1}, Lorg/apache/http/util/ByteArrayBuffer;->clear()V

    .line 149
    iget-object v1, p0, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->metrics:Lorg/apache/http/impl/io/HttpTransportMetricsImpl;

    int-to-long v2, v0

    invoke-virtual {v1, v2, v3}, Lorg/apache/http/impl/io/HttpTransportMetricsImpl;->incrementBytesTransferred(J)V

    .line 151
    :cond_1f
    return-void
.end method

.method public getMetrics()Lorg/apache/http/io/HttpTransportMetrics;
    .registers 2

    .prologue
    .line 292
    iget-object v0, p0, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->metrics:Lorg/apache/http/impl/io/HttpTransportMetricsImpl;

    return-object v0
.end method

.method protected init(Ljava/io/OutputStream;ILorg/apache/http/params/HttpParams;)V
    .registers 6
    .param p1, "outstream"    # Ljava/io/OutputStream;
    .param p2, "buffersize"    # I
    .param p3, "params"    # Lorg/apache/http/params/HttpParams;

    .prologue
    .line 96
    if-nez p1, :cond_a

    .line 97
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Input stream may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 99
    :cond_a
    if-gtz p2, :cond_14

    .line 100
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Buffer size may not be negative or zero"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 102
    :cond_14
    if-nez p3, :cond_1e

    .line 103
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "HTTP parameters may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 105
    :cond_1e
    iput-object p1, p0, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->outstream:Ljava/io/OutputStream;

    .line 106
    new-instance v0, Lorg/apache/http/util/ByteArrayBuffer;

    invoke-direct {v0, p2}, Lorg/apache/http/util/ByteArrayBuffer;-><init>(I)V

    iput-object v0, p0, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->buffer:Lorg/apache/http/util/ByteArrayBuffer;

    .line 107
    invoke-static {p3}, Lorg/apache/http/params/HttpProtocolParams;->getHttpElementCharset(Lorg/apache/http/params/HttpParams;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->charset:Ljava/nio/charset/Charset;

    .line 108
    iget-object v0, p0, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->charset:Ljava/nio/charset/Charset;

    sget-object v1, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {v0, v1}, Ljava/nio/charset/Charset;->equals(Ljava/lang/Object;)Z

    move-result v0

    iput-boolean v0, p0, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->ascii:Z

    .line 109
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->encoder:Ljava/nio/charset/CharsetEncoder;

    .line 110
    const-string v0, "http.connection.min-chunk-limit"

    const/16 v1, 0x200

    invoke-interface {p3, v0, v1}, Lorg/apache/http/params/HttpParams;->getIntParameter(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->minChunkLimit:I

    .line 111
    invoke-virtual {p0}, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->createTransportMetrics()Lorg/apache/http/impl/io/HttpTransportMetricsImpl;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->metrics:Lorg/apache/http/impl/io/HttpTransportMetricsImpl;

    .line 112
    invoke-static {p3}, Lorg/apache/http/params/HttpProtocolParams;->getMalformedInputAction(Lorg/apache/http/params/HttpParams;)Ljava/nio/charset/CodingErrorAction;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->onMalformedInputAction:Ljava/nio/charset/CodingErrorAction;

    .line 113
    invoke-static {p3}, Lorg/apache/http/params/HttpProtocolParams;->getUnmappableInputAction(Lorg/apache/http/params/HttpParams;)Ljava/nio/charset/CodingErrorAction;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->onUnMappableInputAction:Ljava/nio/charset/CodingErrorAction;

    .line 114
    return-void
.end method

.method public length()I
    .registers 2

    .prologue
    .line 134
    iget-object v0, p0, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->buffer:Lorg/apache/http/util/ByteArrayBuffer;

    invoke-virtual {v0}, Lorg/apache/http/util/ByteArrayBuffer;->length()I

    move-result v0

    return v0
.end method

.method public write(I)V
    .registers 3
    .param p1, "b"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 191
    iget-object v0, p0, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->buffer:Lorg/apache/http/util/ByteArrayBuffer;

    invoke-virtual {v0}, Lorg/apache/http/util/ByteArrayBuffer;->isFull()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 192
    invoke-virtual {p0}, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->flushBuffer()V

    .line 194
    :cond_b
    iget-object v0, p0, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->buffer:Lorg/apache/http/util/ByteArrayBuffer;

    invoke-virtual {v0, p1}, Lorg/apache/http/util/ByteArrayBuffer;->append(I)V

    .line 195
    return-void
.end method

.method public write([B)V
    .registers 4
    .param p1, "b"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 184
    if-nez p1, :cond_3

    .line 188
    :goto_2
    return-void

    .line 187
    :cond_3
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->write([BII)V

    goto :goto_2
.end method

.method public write([BII)V
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
    .line 159
    if-nez p1, :cond_3

    .line 181
    :goto_2
    return-void

    .line 165
    :cond_3
    iget v1, p0, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->minChunkLimit:I

    if-gt p3, v1, :cond_f

    iget-object v1, p0, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->buffer:Lorg/apache/http/util/ByteArrayBuffer;

    invoke-virtual {v1}, Lorg/apache/http/util/ByteArrayBuffer;->capacity()I

    move-result v1

    if-le p3, v1, :cond_1e

    .line 167
    :cond_f
    invoke-virtual {p0}, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->flushBuffer()V

    .line 169
    iget-object v1, p0, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->outstream:Ljava/io/OutputStream;

    invoke-virtual {v1, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V

    .line 170
    iget-object v1, p0, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->metrics:Lorg/apache/http/impl/io/HttpTransportMetricsImpl;

    int-to-long v2, p3

    invoke-virtual {v1, v2, v3}, Lorg/apache/http/impl/io/HttpTransportMetricsImpl;->incrementBytesTransferred(J)V

    goto :goto_2

    .line 173
    :cond_1e
    iget-object v1, p0, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->buffer:Lorg/apache/http/util/ByteArrayBuffer;

    invoke-virtual {v1}, Lorg/apache/http/util/ByteArrayBuffer;->capacity()I

    move-result v1

    iget-object v2, p0, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->buffer:Lorg/apache/http/util/ByteArrayBuffer;

    invoke-virtual {v2}, Lorg/apache/http/util/ByteArrayBuffer;->length()I

    move-result v2

    sub-int v0, v1, v2

    .line 174
    .local v0, "freecapacity":I
    if-le p3, v0, :cond_31

    .line 176
    invoke-virtual {p0}, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->flushBuffer()V

    .line 179
    :cond_31
    iget-object v1, p0, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->buffer:Lorg/apache/http/util/ByteArrayBuffer;

    invoke-virtual {v1, p1, p2, p3}, Lorg/apache/http/util/ByteArrayBuffer;->append([BII)V

    goto :goto_2
.end method

.method public writeLine(Ljava/lang/String;)V
    .registers 5
    .param p1, "s"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 207
    if-nez p1, :cond_3

    .line 221
    :goto_2
    return-void

    .line 210
    :cond_3
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_25

    .line 211
    iget-boolean v2, p0, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->ascii:Z

    if-eqz v2, :cond_1e

    .line 212
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_e
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_25

    .line 213
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-virtual {p0, v2}, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->write(I)V

    .line 212
    add-int/lit8 v1, v1, 0x1

    goto :goto_e

    .line 216
    .end local v1    # "i":I
    :cond_1e
    invoke-static {p1}, Ljava/nio/CharBuffer;->wrap(Ljava/lang/CharSequence;)Ljava/nio/CharBuffer;

    move-result-object v0

    .line 217
    .local v0, "cbuf":Ljava/nio/CharBuffer;
    invoke-direct {p0, v0}, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->writeEncoded(Ljava/nio/CharBuffer;)V

    .line 220
    .end local v0    # "cbuf":Ljava/nio/CharBuffer;
    :cond_25
    sget-object v2, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->CRLF:[B

    invoke-virtual {p0, v2}, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->write([B)V

    goto :goto_2
.end method

.method public writeLine(Lorg/apache/http/util/CharArrayBuffer;)V
    .registers 9
    .param p1, "charbuffer"    # Lorg/apache/http/util/CharArrayBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 233
    if-nez p1, :cond_3

    .line 256
    :goto_2
    return-void

    .line 236
    :cond_3
    iget-boolean v4, p0, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->ascii:Z

    if-eqz v4, :cond_35

    .line 237
    const/4 v2, 0x0

    .line 238
    .local v2, "off":I
    invoke-virtual {p1}, Lorg/apache/http/util/CharArrayBuffer;->length()I

    move-result v3

    .line 239
    .local v3, "remaining":I
    :goto_c
    if-lez v3, :cond_45

    .line 240
    iget-object v4, p0, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->buffer:Lorg/apache/http/util/ByteArrayBuffer;

    invoke-virtual {v4}, Lorg/apache/http/util/ByteArrayBuffer;->capacity()I

    move-result v4

    iget-object v5, p0, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->buffer:Lorg/apache/http/util/ByteArrayBuffer;

    invoke-virtual {v5}, Lorg/apache/http/util/ByteArrayBuffer;->length()I

    move-result v5

    sub-int v1, v4, v5

    .line 241
    .local v1, "chunk":I
    invoke-static {v1, v3}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 242
    if-lez v1, :cond_27

    .line 243
    iget-object v4, p0, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->buffer:Lorg/apache/http/util/ByteArrayBuffer;

    invoke-virtual {v4, p1, v2, v1}, Lorg/apache/http/util/ByteArrayBuffer;->append(Lorg/apache/http/util/CharArrayBuffer;II)V

    .line 245
    :cond_27
    iget-object v4, p0, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->buffer:Lorg/apache/http/util/ByteArrayBuffer;

    invoke-virtual {v4}, Lorg/apache/http/util/ByteArrayBuffer;->isFull()Z

    move-result v4

    if-eqz v4, :cond_32

    .line 246
    invoke-virtual {p0}, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->flushBuffer()V

    .line 248
    :cond_32
    add-int/2addr v2, v1

    .line 249
    sub-int/2addr v3, v1

    .line 250
    goto :goto_c

    .line 252
    .end local v1    # "chunk":I
    .end local v2    # "off":I
    .end local v3    # "remaining":I
    :cond_35
    invoke-virtual {p1}, Lorg/apache/http/util/CharArrayBuffer;->buffer()[C

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {p1}, Lorg/apache/http/util/CharArrayBuffer;->length()I

    move-result v6

    invoke-static {v4, v5, v6}, Ljava/nio/CharBuffer;->wrap([CII)Ljava/nio/CharBuffer;

    move-result-object v0

    .line 253
    .local v0, "cbuf":Ljava/nio/CharBuffer;
    invoke-direct {p0, v0}, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->writeEncoded(Ljava/nio/CharBuffer;)V

    .line 255
    .end local v0    # "cbuf":Ljava/nio/CharBuffer;
    :cond_45
    sget-object v4, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->CRLF:[B

    invoke-virtual {p0, v4}, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;->write([B)V

    goto :goto_2
.end method
