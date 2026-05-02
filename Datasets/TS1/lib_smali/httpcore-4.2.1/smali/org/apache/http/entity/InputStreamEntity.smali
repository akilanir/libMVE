.class public Lorg/apache/http/entity/InputStreamEntity;
.super Lorg/apache/http/entity/AbstractHttpEntity;
.source "InputStreamEntity.java"


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# static fields
.field private static final BUFFER_SIZE:I = 0x800


# instance fields
.field private final content:Ljava/io/InputStream;

.field private final length:J


# direct methods
.method public constructor <init>(Ljava/io/InputStream;J)V
    .registers 5
    .param p1, "instream"    # Ljava/io/InputStream;
    .param p2, "length"    # J

    .prologue
    .line 51
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/apache/http/entity/InputStreamEntity;-><init>(Ljava/io/InputStream;JLorg/apache/http/entity/ContentType;)V

    .line 52
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;JLorg/apache/http/entity/ContentType;)V
    .registers 7
    .param p1, "instream"    # Ljava/io/InputStream;
    .param p2, "length"    # J
    .param p4, "contentType"    # Lorg/apache/http/entity/ContentType;

    .prologue
    .line 58
    invoke-direct {p0}, Lorg/apache/http/entity/AbstractHttpEntity;-><init>()V

    .line 59
    if-nez p1, :cond_d

    .line 60
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Source input stream may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 62
    :cond_d
    iput-object p1, p0, Lorg/apache/http/entity/InputStreamEntity;->content:Ljava/io/InputStream;

    .line 63
    iput-wide p2, p0, Lorg/apache/http/entity/InputStreamEntity;->length:J

    .line 64
    if-eqz p4, :cond_1a

    .line 65
    invoke-virtual {p4}, Lorg/apache/http/entity/ContentType;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/http/entity/InputStreamEntity;->setContentType(Ljava/lang/String;)V

    .line 67
    :cond_1a
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
    .line 124
    iget-object v0, p0, Lorg/apache/http/entity/InputStreamEntity;->content:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 125
    return-void
.end method

.method public getContent()Ljava/io/InputStream;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 78
    iget-object v0, p0, Lorg/apache/http/entity/InputStreamEntity;->content:Ljava/io/InputStream;

    return-object v0
.end method

.method public getContentLength()J
    .registers 3

    .prologue
    .line 74
    iget-wide v0, p0, Lorg/apache/http/entity/InputStreamEntity;->length:J

    return-wide v0
.end method

.method public isRepeatable()Z
    .registers 2

    .prologue
    .line 70
    const/4 v0, 0x0

    return v0
.end method

.method public isStreaming()Z
    .registers 2

    .prologue
    .line 112
    const/4 v0, 0x1

    return v0
.end method

.method public writeTo(Ljava/io/OutputStream;)V
    .registers 13
    .param p1, "outstream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v9, 0x0

    const/4 v8, -0x1

    .line 82
    if-nez p1, :cond_d

    .line 83
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "Output stream may not be null"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 85
    :cond_d
    iget-object v1, p0, Lorg/apache/http/entity/InputStreamEntity;->content:Ljava/io/InputStream;

    .line 87
    .local v1, "instream":Ljava/io/InputStream;
    const/16 v5, 0x800

    :try_start_11
    new-array v0, v5, [B

    .line 89
    .local v0, "buffer":[B
    iget-wide v5, p0, Lorg/apache/http/entity/InputStreamEntity;->length:J

    cmp-long v5, v5, v9

    if-gez v5, :cond_29

    .line 91
    :goto_19
    invoke-virtual {v1, v0}, Ljava/io/InputStream;->read([B)I

    move-result v2

    .local v2, "l":I
    if-eq v2, v8, :cond_3d

    .line 92
    const/4 v5, 0x0

    invoke-virtual {p1, v0, v5, v2}, Ljava/io/OutputStream;->write([BII)V
    :try_end_23
    .catchall {:try_start_11 .. :try_end_23} :catchall_24

    goto :goto_19

    .line 107
    .end local v0    # "buffer":[B
    .end local v2    # "l":I
    :catchall_24
    move-exception v5

    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    throw v5

    .line 96
    .restart local v0    # "buffer":[B
    :cond_29
    :try_start_29
    iget-wide v3, p0, Lorg/apache/http/entity/InputStreamEntity;->length:J

    .line 97
    .local v3, "remaining":J
    :goto_2b
    cmp-long v5, v3, v9

    if-lez v5, :cond_3d

    .line 98
    const/4 v5, 0x0

    const-wide/16 v6, 0x800

    invoke-static {v6, v7, v3, v4}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v6

    long-to-int v6, v6

    invoke-virtual {v1, v0, v5, v6}, Ljava/io/InputStream;->read([BII)I
    :try_end_3a
    .catchall {:try_start_29 .. :try_end_3a} :catchall_24

    move-result v2

    .line 99
    .restart local v2    # "l":I
    if-ne v2, v8, :cond_41

    .line 107
    .end local v2    # "l":I
    .end local v3    # "remaining":J
    :cond_3d
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 109
    return-void

    .line 102
    .restart local v2    # "l":I
    .restart local v3    # "remaining":J
    :cond_41
    const/4 v5, 0x0

    :try_start_42
    invoke-virtual {p1, v0, v5, v2}, Ljava/io/OutputStream;->write([BII)V
    :try_end_45
    .catchall {:try_start_42 .. :try_end_45} :catchall_24

    .line 103
    int-to-long v5, v2

    sub-long/2addr v3, v5

    goto :goto_2b
.end method
