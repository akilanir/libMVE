.class public Lorg/apache/commons/compress/compressors/deflate/DeflateCompressorOutputStream;
.super Lorg/apache/commons/compress/compressors/CompressorOutputStream;
.source "DeflateCompressorOutputStream.java"


# instance fields
.field private final out:Ljava/util/zip/DeflaterOutputStream;


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;)V
    .registers 3
    .param p1, "outputStream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 41
    new-instance v0, Lorg/apache/commons/compress/compressors/deflate/DeflateParameters;

    invoke-direct {v0}, Lorg/apache/commons/compress/compressors/deflate/DeflateParameters;-><init>()V

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/compress/compressors/deflate/DeflateCompressorOutputStream;-><init>(Ljava/io/OutputStream;Lorg/apache/commons/compress/compressors/deflate/DeflateParameters;)V

    .line 42
    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;Lorg/apache/commons/compress/compressors/deflate/DeflateParameters;)V
    .registers 7
    .param p1, "outputStream"    # Ljava/io/OutputStream;
    .param p2, "parameters"    # Lorg/apache/commons/compress/compressors/deflate/DeflateParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 51
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/CompressorOutputStream;-><init>()V

    .line 52
    new-instance v1, Ljava/util/zip/DeflaterOutputStream;

    new-instance v2, Ljava/util/zip/Deflater;

    invoke-virtual {p2}, Lorg/apache/commons/compress/compressors/deflate/DeflateParameters;->getCompressionLevel()I

    move-result v3

    invoke-virtual {p2}, Lorg/apache/commons/compress/compressors/deflate/DeflateParameters;->withZlibHeader()Z

    move-result v0

    if-nez v0, :cond_1b

    const/4 v0, 0x1

    :goto_12
    invoke-direct {v2, v3, v0}, Ljava/util/zip/Deflater;-><init>(IZ)V

    invoke-direct {v1, p1, v2}, Ljava/util/zip/DeflaterOutputStream;-><init>(Ljava/io/OutputStream;Ljava/util/zip/Deflater;)V

    iput-object v1, p0, Lorg/apache/commons/compress/compressors/deflate/DeflateCompressorOutputStream;->out:Ljava/util/zip/DeflaterOutputStream;

    .line 53
    return-void

    .line 52
    :cond_1b
    const/4 v0, 0x0

    goto :goto_12
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
    .line 86
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/deflate/DeflateCompressorOutputStream;->out:Ljava/util/zip/DeflaterOutputStream;

    invoke-virtual {v0}, Ljava/util/zip/DeflaterOutputStream;->close()V

    .line 87
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
    .line 81
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/deflate/DeflateCompressorOutputStream;->out:Ljava/util/zip/DeflaterOutputStream;

    invoke-virtual {v0}, Ljava/util/zip/DeflaterOutputStream;->finish()V

    .line 82
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
    .line 73
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/deflate/DeflateCompressorOutputStream;->out:Ljava/util/zip/DeflaterOutputStream;

    invoke-virtual {v0}, Ljava/util/zip/DeflaterOutputStream;->flush()V

    .line 74
    return-void
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
    .line 57
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/deflate/DeflateCompressorOutputStream;->out:Ljava/util/zip/DeflaterOutputStream;

    invoke-virtual {v0, p1}, Ljava/util/zip/DeflaterOutputStream;->write(I)V

    .line 58
    return-void
.end method

.method public write([BII)V
    .registers 5
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
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/deflate/DeflateCompressorOutputStream;->out:Ljava/util/zip/DeflaterOutputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/util/zip/DeflaterOutputStream;->write([BII)V

    .line 63
    return-void
.end method
