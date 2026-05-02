.class public Lorg/apache/commons/compress/compressors/deflate/DeflateCompressorInputStream;
.super Lorg/apache/commons/compress/compressors/CompressorInputStream;
.source "DeflateCompressorInputStream.java"


# static fields
.field private static final MAGIC_1:I = 0x78

.field private static final MAGIC_2a:I = 0x1

.field private static final MAGIC_2b:I = 0x5e

.field private static final MAGIC_2c:I = 0x9c

.field private static final MAGIC_2d:I = 0xda


# instance fields
.field private final in:Ljava/io/InputStream;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 3
    .param p1, "inputStream"    # Ljava/io/InputStream;

    .prologue
    .line 49
    new-instance v0, Lorg/apache/commons/compress/compressors/deflate/DeflateParameters;

    invoke-direct {v0}, Lorg/apache/commons/compress/compressors/deflate/DeflateParameters;-><init>()V

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/compress/compressors/deflate/DeflateCompressorInputStream;-><init>(Ljava/io/InputStream;Lorg/apache/commons/compress/compressors/deflate/DeflateParameters;)V

    .line 50
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Lorg/apache/commons/compress/compressors/deflate/DeflateParameters;)V
    .registers 6
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .param p2, "parameters"    # Lorg/apache/commons/compress/compressors/deflate/DeflateParameters;

    .prologue
    .line 60
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/CompressorInputStream;-><init>()V

    .line 61
    new-instance v1, Ljava/util/zip/InflaterInputStream;

    new-instance v2, Ljava/util/zip/Inflater;

    invoke-virtual {p2}, Lorg/apache/commons/compress/compressors/deflate/DeflateParameters;->withZlibHeader()Z

    move-result v0

    if-nez v0, :cond_17

    const/4 v0, 0x1

    :goto_e
    invoke-direct {v2, v0}, Ljava/util/zip/Inflater;-><init>(Z)V

    invoke-direct {v1, p1, v2}, Ljava/util/zip/InflaterInputStream;-><init>(Ljava/io/InputStream;Ljava/util/zip/Inflater;)V

    iput-object v1, p0, Lorg/apache/commons/compress/compressors/deflate/DeflateCompressorInputStream;->in:Ljava/io/InputStream;

    .line 62
    return-void

    .line 61
    :cond_17
    const/4 v0, 0x0

    goto :goto_e
.end method

.method public static matches([BI)Z
    .registers 6
    .param p0, "signature"    # [B
    .param p1, "length"    # I

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 112
    const/4 v2, 0x3

    if-le p1, v2, :cond_22

    aget-byte v2, p0, v1

    const/16 v3, 0x78

    if-ne v2, v3, :cond_22

    aget-byte v2, p0, v0

    if-eq v2, v0, :cond_21

    aget-byte v2, p0, v0

    const/16 v3, 0x5e

    if-eq v2, v3, :cond_21

    aget-byte v2, p0, v0

    const/16 v3, -0x64

    if-eq v2, v3, :cond_21

    aget-byte v2, p0, v0

    const/16 v3, -0x26

    if-ne v2, v3, :cond_22

    :cond_21
    :goto_21
    return v0

    :cond_22
    move v0, v1

    goto :goto_21
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
    .line 89
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/deflate/DeflateCompressorInputStream;->in:Ljava/io/InputStream;

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
    .line 95
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/deflate/DeflateCompressorInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 96
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
    .line 67
    iget-object v1, p0, Lorg/apache/commons/compress/compressors/deflate/DeflateCompressorInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 68
    .local v0, "ret":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_e

    const/4 v1, 0x0

    :goto_a
    invoke-virtual {p0, v1}, Lorg/apache/commons/compress/compressors/deflate/DeflateCompressorInputStream;->count(I)V

    .line 69
    return v0

    .line 68
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
    .line 75
    iget-object v1, p0, Lorg/apache/commons/compress/compressors/deflate/DeflateCompressorInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v1, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 76
    .local v0, "ret":I
    invoke-virtual {p0, v0}, Lorg/apache/commons/compress/compressors/deflate/DeflateCompressorInputStream;->count(I)V

    .line 77
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
    .line 83
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/deflate/DeflateCompressorInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0, p1, p2}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v0

    return-wide v0
.end method
