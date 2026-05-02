.class public Lorg/apache/http/entity/BasicHttpEntity;
.super Lorg/apache/http/entity/AbstractHttpEntity;
.source "BasicHttpEntity.java"


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# instance fields
.field private content:Ljava/io/InputStream;

.field private length:J


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 54
    invoke-direct {p0}, Lorg/apache/http/entity/AbstractHttpEntity;-><init>()V

    .line 55
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lorg/apache/http/entity/BasicHttpEntity;->length:J

    .line 56
    return-void
.end method


# virtual methods
.method public consumeContent()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 137
    iget-object v0, p0, Lorg/apache/http/entity/BasicHttpEntity;->content:Ljava/io/InputStream;

    if-eqz v0, :cond_9

    .line 138
    iget-object v0, p0, Lorg/apache/http/entity/BasicHttpEntity;->content:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 140
    :cond_9
    return-void
.end method

.method public getContent()Ljava/io/InputStream;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .prologue
    .line 72
    iget-object v0, p0, Lorg/apache/http/entity/BasicHttpEntity;->content:Ljava/io/InputStream;

    if-nez v0, :cond_c

    .line 73
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Content has not been provided"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 75
    :cond_c
    iget-object v0, p0, Lorg/apache/http/entity/BasicHttpEntity;->content:Ljava/io/InputStream;

    return-object v0
.end method

.method public getContentLength()J
    .registers 3

    .prologue
    .line 59
    iget-wide v0, p0, Lorg/apache/http/entity/BasicHttpEntity;->length:J

    return-wide v0
.end method

.method public isRepeatable()Z
    .registers 2

    .prologue
    .line 85
    const/4 v0, 0x0

    return v0
.end method

.method public isStreaming()Z
    .registers 2

    .prologue
    .line 125
    iget-object v0, p0, Lorg/apache/http/entity/BasicHttpEntity;->content:Ljava/io/InputStream;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public setContent(Ljava/io/InputStream;)V
    .registers 2
    .param p1, "instream"    # Ljava/io/InputStream;

    .prologue
    .line 105
    iput-object p1, p0, Lorg/apache/http/entity/BasicHttpEntity;->content:Ljava/io/InputStream;

    .line 106
    return-void
.end method

.method public setContentLength(J)V
    .registers 3
    .param p1, "len"    # J

    .prologue
    .line 95
    iput-wide p1, p0, Lorg/apache/http/entity/BasicHttpEntity;->length:J

    .line 96
    return-void
.end method

.method public writeTo(Ljava/io/OutputStream;)V
    .registers 7
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
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Output stream may not be null"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 112
    :cond_a
    invoke-virtual {p0}, Lorg/apache/http/entity/BasicHttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v0

    .line 115
    .local v0, "instream":Ljava/io/InputStream;
    const/16 v3, 0x800

    :try_start_10
    new-array v2, v3, [B

    .line 116
    .local v2, "tmp":[B
    :goto_12
    invoke-virtual {v0, v2}, Ljava/io/InputStream;->read([B)I

    move-result v1

    .local v1, "l":I
    const/4 v3, -0x1

    if-eq v1, v3, :cond_23

    .line 117
    const/4 v3, 0x0

    invoke-virtual {p1, v2, v3, v1}, Ljava/io/OutputStream;->write([BII)V
    :try_end_1d
    .catchall {:try_start_10 .. :try_end_1d} :catchall_1e

    goto :goto_12

    .line 120
    .end local v1    # "l":I
    .end local v2    # "tmp":[B
    :catchall_1e
    move-exception v3

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    throw v3

    .restart local v1    # "l":I
    .restart local v2    # "tmp":[B
    :cond_23
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 122
    return-void
.end method
