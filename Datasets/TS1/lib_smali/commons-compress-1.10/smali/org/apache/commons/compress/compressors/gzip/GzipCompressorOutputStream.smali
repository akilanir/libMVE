.class public Lorg/apache/commons/compress/compressors/gzip/GzipCompressorOutputStream;
.super Lorg/apache/commons/compress/compressors/CompressorOutputStream;
.source "GzipCompressorOutputStream.java"


# static fields
.field private static final FCOMMENT:I = 0x10

.field private static final FNAME:I = 0x8


# instance fields
.field private closed:Z

.field private final crc:Ljava/util/zip/CRC32;

.field private final deflateBuffer:[B

.field private final deflater:Ljava/util/zip/Deflater;

.field private final out:Ljava/io/OutputStream;


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;)V
    .registers 3
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 68
    new-instance v0, Lorg/apache/commons/compress/compressors/gzip/GzipParameters;

    invoke-direct {v0}, Lorg/apache/commons/compress/compressors/gzip/GzipParameters;-><init>()V

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorOutputStream;-><init>(Ljava/io/OutputStream;Lorg/apache/commons/compress/compressors/gzip/GzipParameters;)V

    .line 69
    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;Lorg/apache/commons/compress/compressors/gzip/GzipParameters;)V
    .registers 6
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "parameters"    # Lorg/apache/commons/compress/compressors/gzip/GzipParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 76
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/CompressorOutputStream;-><init>()V

    .line 56
    const/16 v0, 0x200

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorOutputStream;->deflateBuffer:[B

    .line 62
    new-instance v0, Ljava/util/zip/CRC32;

    invoke-direct {v0}, Ljava/util/zip/CRC32;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorOutputStream;->crc:Ljava/util/zip/CRC32;

    .line 77
    iput-object p1, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorOutputStream;->out:Ljava/io/OutputStream;

    .line 78
    new-instance v0, Ljava/util/zip/Deflater;

    invoke-virtual {p2}, Lorg/apache/commons/compress/compressors/gzip/GzipParameters;->getCompressionLevel()I

    move-result v1

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Ljava/util/zip/Deflater;-><init>(IZ)V

    iput-object v0, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorOutputStream;->deflater:Ljava/util/zip/Deflater;

    .line 80
    invoke-direct {p0, p2}, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorOutputStream;->writeHeader(Lorg/apache/commons/compress/compressors/gzip/GzipParameters;)V

    .line 81
    return-void
.end method

.method private deflate()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 165
    iget-object v1, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorOutputStream;->deflater:Ljava/util/zip/Deflater;

    iget-object v2, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorOutputStream;->deflateBuffer:[B

    iget-object v3, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorOutputStream;->deflateBuffer:[B

    array-length v3, v3

    invoke-virtual {v1, v2, v4, v3}, Ljava/util/zip/Deflater;->deflate([BII)I

    move-result v0

    .line 166
    .local v0, "length":I
    if-lez v0, :cond_15

    .line 167
    iget-object v1, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorOutputStream;->out:Ljava/io/OutputStream;

    iget-object v2, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorOutputStream;->deflateBuffer:[B

    invoke-virtual {v1, v2, v4, v0}, Ljava/io/OutputStream;->write([BII)V

    .line 169
    :cond_15
    return-void
.end method

.method private writeHeader(Lorg/apache/commons/compress/compressors/gzip/GzipParameters;)V
    .registers 12
    .param p1, "parameters"    # Lorg/apache/commons/compress/compressors/gzip/GzipParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v4, 0x8

    const/4 v5, 0x0

    .line 84
    invoke-virtual {p1}, Lorg/apache/commons/compress/compressors/gzip/GzipParameters;->getFilename()Ljava/lang/String;

    move-result-object v3

    .line 85
    .local v3, "filename":Ljava/lang/String;
    invoke-virtual {p1}, Lorg/apache/commons/compress/compressors/gzip/GzipParameters;->getComment()Ljava/lang/String;

    move-result-object v1

    .line 87
    .local v1, "comment":Ljava/lang/String;
    const/16 v6, 0xa

    invoke-static {v6}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 88
    .local v0, "buffer":Ljava/nio/ByteBuffer;
    sget-object v6, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v6}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 89
    const/16 v6, -0x74e1

    invoke-virtual {v0, v6}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 90
    invoke-virtual {v0, v4}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 91
    if-eqz v3, :cond_77

    move v6, v4

    :goto_21
    if-eqz v1, :cond_79

    const/16 v4, 0x10

    :goto_25
    or-int/2addr v4, v6

    int-to-byte v4, v4

    invoke-virtual {v0, v4}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 92
    invoke-virtual {p1}, Lorg/apache/commons/compress/compressors/gzip/GzipParameters;->getModificationTime()J

    move-result-wide v6

    const-wide/16 v8, 0x3e8

    div-long/2addr v6, v8

    long-to-int v4, v6

    invoke-virtual {v0, v4}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 95
    invoke-virtual {p1}, Lorg/apache/commons/compress/compressors/gzip/GzipParameters;->getCompressionLevel()I

    move-result v2

    .line 96
    .local v2, "compressionLevel":I
    const/16 v4, 0x9

    if-ne v2, v4, :cond_7b

    .line 97
    const/4 v4, 0x2

    invoke-virtual {v0, v4}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 104
    :goto_41
    invoke-virtual {p1}, Lorg/apache/commons/compress/compressors/gzip/GzipParameters;->getOperatingSystem()I

    move-result v4

    int-to-byte v4, v4

    invoke-virtual {v0, v4}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 106
    iget-object v4, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/io/OutputStream;->write([B)V

    .line 108
    if-eqz v3, :cond_64

    .line 109
    iget-object v4, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorOutputStream;->out:Ljava/io/OutputStream;

    const-string v6, "ISO-8859-1"

    invoke-virtual {v3, v6}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/io/OutputStream;->write([B)V

    .line 110
    iget-object v4, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v4, v5}, Ljava/io/OutputStream;->write(I)V

    .line 113
    :cond_64
    if-eqz v1, :cond_76

    .line 114
    iget-object v4, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorOutputStream;->out:Ljava/io/OutputStream;

    const-string v6, "ISO-8859-1"

    invoke-virtual {v1, v6}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/io/OutputStream;->write([B)V

    .line 115
    iget-object v4, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v4, v5}, Ljava/io/OutputStream;->write(I)V

    .line 117
    :cond_76
    return-void

    .end local v2    # "compressionLevel":I
    :cond_77
    move v6, v5

    .line 91
    goto :goto_21

    :cond_79
    move v4, v5

    goto :goto_25

    .line 98
    .restart local v2    # "compressionLevel":I
    :cond_7b
    const/4 v4, 0x1

    if-ne v2, v4, :cond_83

    .line 99
    const/4 v4, 0x4

    invoke-virtual {v0, v4}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    goto :goto_41

    .line 101
    :cond_83
    invoke-virtual {v0, v5}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    goto :goto_41
.end method

.method private writeTrailer()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 120
    const/16 v1, 0x8

    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 121
    .local v0, "buffer":Ljava/nio/ByteBuffer;
    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 122
    iget-object v1, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorOutputStream;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v1}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v1

    long-to-int v1, v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 123
    iget-object v1, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorOutputStream;->deflater:Ljava/util/zip/Deflater;

    invoke-virtual {v1}, Ljava/util/zip/Deflater;->getTotalIn()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 125
    iget-object v1, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/OutputStream;->write([B)V

    .line 126
    return-void
.end method


# virtual methods
.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 200
    iget-boolean v0, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorOutputStream;->closed:Z

    if-nez v0, :cond_14

    .line 201
    invoke-virtual {p0}, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorOutputStream;->finish()V

    .line 202
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorOutputStream;->deflater:Ljava/util/zip/Deflater;

    invoke-virtual {v0}, Ljava/util/zip/Deflater;->end()V

    .line 203
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 204
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorOutputStream;->closed:Z

    .line 206
    :cond_14
    return-void
.end method

.method public finish()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 177
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorOutputStream;->deflater:Ljava/util/zip/Deflater;

    invoke-virtual {v0}, Ljava/util/zip/Deflater;->finished()Z

    move-result v0

    if-nez v0, :cond_1c

    .line 178
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorOutputStream;->deflater:Ljava/util/zip/Deflater;

    invoke-virtual {v0}, Ljava/util/zip/Deflater;->finish()V

    .line 180
    :goto_d
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorOutputStream;->deflater:Ljava/util/zip/Deflater;

    invoke-virtual {v0}, Ljava/util/zip/Deflater;->finished()Z

    move-result v0

    if-nez v0, :cond_19

    .line 181
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorOutputStream;->deflate()V

    goto :goto_d

    .line 184
    :cond_19
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorOutputStream;->writeTrailer()V

    .line 186
    :cond_1c
    return-void
.end method

.method public flush()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 195
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 196
    return-void
.end method

.method public write(I)V
    .registers 6
    .param p1, "b"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 130
    new-array v0, v3, [B

    and-int/lit16 v1, p1, 0xff

    int-to-byte v1, v1

    aput-byte v1, v0, v2

    invoke-virtual {p0, v0, v2, v3}, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorOutputStream;->write([BII)V

    .line 131
    return-void
.end method

.method public write([B)V
    .registers 4
    .param p1, "buffer"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 140
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorOutputStream;->write([BII)V

    .line 141
    return-void
.end method

.method public write([BII)V
    .registers 6
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 150
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorOutputStream;->deflater:Ljava/util/zip/Deflater;

    invoke-virtual {v0}, Ljava/util/zip/Deflater;->finished()Z

    move-result v0

    if-eqz v0, :cond_10

    .line 151
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Cannot write more data, the end of the compressed data stream has been reached"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 153
    :cond_10
    if-lez p3, :cond_28

    .line 154
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorOutputStream;->deflater:Ljava/util/zip/Deflater;

    invoke-virtual {v0, p1, p2, p3}, Ljava/util/zip/Deflater;->setInput([BII)V

    .line 156
    :goto_17
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorOutputStream;->deflater:Ljava/util/zip/Deflater;

    invoke-virtual {v0}, Ljava/util/zip/Deflater;->needsInput()Z

    move-result v0

    if-nez v0, :cond_23

    .line 157
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorOutputStream;->deflate()V

    goto :goto_17

    .line 160
    :cond_23
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorOutputStream;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v0, p1, p2, p3}, Ljava/util/zip/CRC32;->update([BII)V

    .line 162
    :cond_28
    return-void
.end method
