.class public Lorg/apache/james/mime4j/codec/CodecUtil;
.super Ljava/lang/Object;
.source "CodecUtil.java"


# static fields
.field static final DEFAULT_ENCODING_BUFFER_SIZE:I = 0x400


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static copy(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    .registers 5
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 40
    const/16 v2, 0x400

    new-array v0, v2, [B

    .line 42
    .local v0, "buffer":[B
    :goto_4
    const/4 v2, -0x1

    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    .local v1, "inputLength":I
    if-eq v2, v1, :cond_10

    .line 43
    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2, v1}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_4

    .line 45
    :cond_10
    return-void
.end method

.method public static encodeBase64(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    .registers 3
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 83
    new-instance v0, Lorg/apache/james/mime4j/codec/Base64OutputStream;

    invoke-direct {v0, p1}, Lorg/apache/james/mime4j/codec/Base64OutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 84
    .local v0, "b64Out":Lorg/apache/james/mime4j/codec/Base64OutputStream;
    invoke-static {p0, v0}, Lorg/apache/james/mime4j/codec/CodecUtil;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 85
    invoke-virtual {v0}, Lorg/apache/james/mime4j/codec/Base64OutputStream;->close()V

    .line 86
    return-void
.end method

.method public static encodeQuotedPrintable(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    .registers 4
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 70
    new-instance v0, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;-><init>(Ljava/io/OutputStream;Z)V

    .line 71
    .local v0, "qpOut":Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;
    invoke-static {p0, v0}, Lorg/apache/james/mime4j/codec/CodecUtil;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 72
    invoke-virtual {v0}, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->close()V

    .line 73
    return-void
.end method

.method public static encodeQuotedPrintableBinary(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    .registers 4
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 56
    new-instance v0, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;

    const/4 v1, 0x1

    invoke-direct {v0, p1, v1}, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;-><init>(Ljava/io/OutputStream;Z)V

    .line 57
    .local v0, "qpOut":Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;
    invoke-static {p0, v0}, Lorg/apache/james/mime4j/codec/CodecUtil;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 58
    invoke-virtual {v0}, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;->close()V

    .line 59
    return-void
.end method

.method public static wrapBase64(Ljava/io/OutputStream;)Ljava/io/OutputStream;
    .registers 2
    .param p0, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 105
    new-instance v0, Lorg/apache/james/mime4j/codec/Base64OutputStream;

    invoke-direct {v0, p0}, Lorg/apache/james/mime4j/codec/Base64OutputStream;-><init>(Ljava/io/OutputStream;)V

    return-object v0
.end method

.method public static wrapQuotedPrintable(Ljava/io/OutputStream;Z)Ljava/io/OutputStream;
    .registers 3
    .param p0, "out"    # Ljava/io/OutputStream;
    .param p1, "binary"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 95
    new-instance v0, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;

    invoke-direct {v0, p0, p1}, Lorg/apache/james/mime4j/codec/QuotedPrintableOutputStream;-><init>(Ljava/io/OutputStream;Z)V

    return-object v0
.end method
