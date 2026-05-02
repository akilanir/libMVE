.class public Lorg/apache/commons/compress/compressors/lzma/LZMACompressorInputStream;
.super Lorg/apache/commons/compress/compressors/CompressorInputStream;
.source "LZMACompressorInputStream.java"


# instance fields
.field private final in:Ljava/io/InputStream;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 3
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 47
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/CompressorInputStream;-><init>()V

    .line 48
    new-instance v0, Lorg/tukaani/xz/LZMAInputStream;

    invoke-direct {v0, p1}, Lorg/tukaani/xz/LZMAInputStream;-><init>(Ljava/io/InputStream;)V

    iput-object v0, p0, Lorg/apache/commons/compress/compressors/lzma/LZMACompressorInputStream;->in:Ljava/io/InputStream;

    .line 49
    return-void
.end method

.method public static matches([BI)Z
    .registers 6
    .param p0, "signature"    # [B
    .param p1, "length"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 98
    if-eqz p0, :cond_7

    const/4 v2, 0x3

    if-ge p1, v2, :cond_8

    .line 114
    :cond_7
    :goto_7
    return v0

    .line 102
    :cond_8
    aget-byte v2, p0, v0

    const/16 v3, 0x5d

    if-ne v2, v3, :cond_7

    .line 106
    aget-byte v2, p0, v1

    if-nez v2, :cond_7

    .line 110
    const/4 v2, 0x2

    aget-byte v2, p0, v2

    if-nez v2, :cond_7

    move v0, v1

    .line 114
    goto :goto_7
.end method


# virtual methods
.method public available()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 76
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/lzma/LZMACompressorInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->available()I

    move-result v0

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
    .line 82
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/lzma/LZMACompressorInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 83
    return-void
.end method

.method public read()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 54
    iget-object v1, p0, Lorg/apache/commons/compress/compressors/lzma/LZMACompressorInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 55
    .local v0, "ret":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_e

    const/4 v1, 0x0

    :goto_a
    invoke-virtual {p0, v1}, Lorg/apache/commons/compress/compressors/lzma/LZMACompressorInputStream;->count(I)V

    .line 56
    return v0

    .line 55
    :cond_e
    const/4 v1, 0x1

    goto :goto_a
.end method

.method public read([BII)I
    .registers 6
    .param p1, "buf"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 62
    iget-object v1, p0, Lorg/apache/commons/compress/compressors/lzma/LZMACompressorInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v1, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 63
    .local v0, "ret":I
    invoke-virtual {p0, v0}, Lorg/apache/commons/compress/compressors/lzma/LZMACompressorInputStream;->count(I)V

    .line 64
    return v0
.end method

.method public skip(J)J
    .registers 5
    .param p1, "n"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 70
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/lzma/LZMACompressorInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0, p1, p2}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v0

    return-wide v0
.end method
