.class public Lorg/apache/http/entity/BufferedHttpEntity;
.super Lorg/apache/http/entity/HttpEntityWrapper;
.source "BufferedHttpEntity.java"


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# instance fields
.field private final buffer:[B


# direct methods
.method public constructor <init>(Lorg/apache/http/HttpEntity;)V
    .registers 6
    .param p1, "entity"    # Lorg/apache/http/HttpEntity;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 60
    invoke-direct {p0, p1}, Lorg/apache/http/entity/HttpEntityWrapper;-><init>(Lorg/apache/http/HttpEntity;)V

    .line 61
    invoke-interface {p1}, Lorg/apache/http/HttpEntity;->isRepeatable()Z

    move-result v0

    if-eqz v0, :cond_13

    invoke-interface {p1}, Lorg/apache/http/HttpEntity;->getContentLength()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-gez v0, :cond_1a

    .line 62
    :cond_13
    invoke-static {p1}, Lorg/apache/http/util/EntityUtils;->toByteArray(Lorg/apache/http/HttpEntity;)[B

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/entity/BufferedHttpEntity;->buffer:[B

    .line 66
    :goto_19
    return-void

    .line 64
    :cond_1a
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/http/entity/BufferedHttpEntity;->buffer:[B

    goto :goto_19
.end method


# virtual methods
.method public getContent()Ljava/io/InputStream;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 79
    iget-object v0, p0, Lorg/apache/http/entity/BufferedHttpEntity;->buffer:[B

    if-eqz v0, :cond_c

    .line 80
    new-instance v0, Ljava/io/ByteArrayInputStream;

    iget-object v1, p0, Lorg/apache/http/entity/BufferedHttpEntity;->buffer:[B

    invoke-direct {v0, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 82
    :goto_b
    return-object v0

    :cond_c
    iget-object v0, p0, Lorg/apache/http/entity/BufferedHttpEntity;->wrappedEntity:Lorg/apache/http/HttpEntity;

    invoke-interface {v0}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v0

    goto :goto_b
.end method

.method public getContentLength()J
    .registers 3

    .prologue
    .line 70
    iget-object v0, p0, Lorg/apache/http/entity/BufferedHttpEntity;->buffer:[B

    if-eqz v0, :cond_9

    .line 71
    iget-object v0, p0, Lorg/apache/http/entity/BufferedHttpEntity;->buffer:[B

    array-length v0, v0

    int-to-long v0, v0

    .line 73
    :goto_8
    return-wide v0

    :cond_9
    iget-object v0, p0, Lorg/apache/http/entity/BufferedHttpEntity;->wrappedEntity:Lorg/apache/http/HttpEntity;

    invoke-interface {v0}, Lorg/apache/http/HttpEntity;->getContentLength()J

    move-result-wide v0

    goto :goto_8
.end method

.method public isChunked()Z
    .registers 2

    .prologue
    .line 93
    iget-object v0, p0, Lorg/apache/http/entity/BufferedHttpEntity;->buffer:[B

    if-nez v0, :cond_e

    iget-object v0, p0, Lorg/apache/http/entity/BufferedHttpEntity;->wrappedEntity:Lorg/apache/http/HttpEntity;

    invoke-interface {v0}, Lorg/apache/http/HttpEntity;->isChunked()Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public isRepeatable()Z
    .registers 2

    .prologue
    .line 103
    const/4 v0, 0x1

    return v0
.end method

.method public isStreaming()Z
    .registers 2

    .prologue
    .line 123
    iget-object v0, p0, Lorg/apache/http/entity/BufferedHttpEntity;->buffer:[B

    if-nez v0, :cond_e

    iget-object v0, p0, Lorg/apache/http/entity/BufferedHttpEntity;->wrappedEntity:Lorg/apache/http/HttpEntity;

    invoke-interface {v0}, Lorg/apache/http/HttpEntity;->isStreaming()Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public writeTo(Ljava/io/OutputStream;)V
    .registers 4
    .param p1, "outstream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 109
    if-nez p1, :cond_a

    .line 110
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Output stream may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 112
    :cond_a
    iget-object v0, p0, Lorg/apache/http/entity/BufferedHttpEntity;->buffer:[B

    if-eqz v0, :cond_14

    .line 113
    iget-object v0, p0, Lorg/apache/http/entity/BufferedHttpEntity;->buffer:[B

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 117
    :goto_13
    return-void

    .line 115
    :cond_14
    iget-object v0, p0, Lorg/apache/http/entity/BufferedHttpEntity;->wrappedEntity:Lorg/apache/http/HttpEntity;

    invoke-interface {v0, p1}, Lorg/apache/http/HttpEntity;->writeTo(Ljava/io/OutputStream;)V

    goto :goto_13
.end method
