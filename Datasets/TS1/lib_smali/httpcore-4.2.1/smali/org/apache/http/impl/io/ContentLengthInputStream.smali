.class public Lorg/apache/http/impl/io/ContentLengthInputStream;
.super Ljava/io/InputStream;
.source "ContentLengthInputStream.java"


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# static fields
.field private static final BUFFER_SIZE:I = 0x800


# instance fields
.field private closed:Z

.field private contentLength:J

.field private in:Lorg/apache/http/io/SessionInputBuffer;

.field private pos:J


# direct methods
.method public constructor <init>(Lorg/apache/http/io/SessionInputBuffer;J)V
    .registers 7
    .param p1, "in"    # Lorg/apache/http/io/SessionInputBuffer;
    .param p2, "contentLength"    # J

    .prologue
    const-wide/16 v1, 0x0

    .line 84
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 65
    iput-wide v1, p0, Lorg/apache/http/impl/io/ContentLengthInputStream;->pos:J

    .line 68
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/http/impl/io/ContentLengthInputStream;->closed:Z

    .line 73
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/http/impl/io/ContentLengthInputStream;->in:Lorg/apache/http/io/SessionInputBuffer;

    .line 85
    if-nez p1, :cond_17

    .line 86
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Input stream may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 88
    :cond_17
    cmp-long v0, p2, v1

    if-gez v0, :cond_23

    .line 89
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Content length may not be negative"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 91
    :cond_23
    iput-object p1, p0, Lorg/apache/http/impl/io/ContentLengthInputStream;->in:Lorg/apache/http/io/SessionInputBuffer;

    .line 92
    iput-wide p2, p0, Lorg/apache/http/impl/io/ContentLengthInputStream;->contentLength:J

    .line 93
    return-void
.end method


# virtual methods
.method public available()I
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 121
    iget-object v1, p0, Lorg/apache/http/impl/io/ContentLengthInputStream;->in:Lorg/apache/http/io/SessionInputBuffer;

    instance-of v1, v1, Lorg/apache/http/io/BufferInfo;

    if-eqz v1, :cond_19

    .line 122
    iget-object v1, p0, Lorg/apache/http/impl/io/ContentLengthInputStream;->in:Lorg/apache/http/io/SessionInputBuffer;

    check-cast v1, Lorg/apache/http/io/BufferInfo;

    invoke-interface {v1}, Lorg/apache/http/io/BufferInfo;->length()I

    move-result v0

    .line 123
    .local v0, "len":I
    iget-wide v1, p0, Lorg/apache/http/impl/io/ContentLengthInputStream;->contentLength:J

    iget-wide v3, p0, Lorg/apache/http/impl/io/ContentLengthInputStream;->pos:J

    sub-long/2addr v1, v3

    long-to-int v1, v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 125
    .end local v0    # "len":I
    :goto_18
    return v1

    :cond_19
    const/4 v1, 0x0

    goto :goto_18
.end method

.method public close()V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    .line 104
    iget-boolean v1, p0, Lorg/apache/http/impl/io/ContentLengthInputStream;->closed:Z

    if-nez v1, :cond_19

    .line 106
    :try_start_5
    iget-wide v1, p0, Lorg/apache/http/impl/io/ContentLengthInputStream;->pos:J

    iget-wide v3, p0, Lorg/apache/http/impl/io/ContentLengthInputStream;->contentLength:J

    cmp-long v1, v1, v3

    if-gez v1, :cond_17

    .line 107
    const/16 v1, 0x800

    new-array v0, v1, [B

    .line 108
    .local v0, "buffer":[B
    :cond_11
    invoke-virtual {p0, v0}, Lorg/apache/http/impl/io/ContentLengthInputStream;->read([B)I
    :try_end_14
    .catchall {:try_start_5 .. :try_end_14} :catchall_1a

    move-result v1

    if-gez v1, :cond_11

    .line 114
    .end local v0    # "buffer":[B
    :cond_17
    iput-boolean v5, p0, Lorg/apache/http/impl/io/ContentLengthInputStream;->closed:Z

    .line 117
    :cond_19
    return-void

    .line 114
    :catchall_1a
    move-exception v1

    iput-boolean v5, p0, Lorg/apache/http/impl/io/ContentLengthInputStream;->closed:Z

    throw v1
.end method

.method public read()I
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, -0x1

    .line 137
    iget-boolean v2, p0, Lorg/apache/http/impl/io/ContentLengthInputStream;->closed:Z

    if-eqz v2, :cond_d

    .line 138
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Attempted read from closed stream."

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 141
    :cond_d
    iget-wide v2, p0, Lorg/apache/http/impl/io/ContentLengthInputStream;->pos:J

    iget-wide v4, p0, Lorg/apache/http/impl/io/ContentLengthInputStream;->contentLength:J

    cmp-long v2, v2, v4

    if-ltz v2, :cond_17

    move v0, v1

    .line 154
    :cond_16
    :goto_16
    return v0

    .line 144
    :cond_17
    iget-object v2, p0, Lorg/apache/http/impl/io/ContentLengthInputStream;->in:Lorg/apache/http/io/SessionInputBuffer;

    invoke-interface {v2}, Lorg/apache/http/io/SessionInputBuffer;->read()I

    move-result v0

    .line 145
    .local v0, "b":I
    if-ne v0, v1, :cond_4e

    .line 146
    iget-wide v1, p0, Lorg/apache/http/impl/io/ContentLengthInputStream;->pos:J

    iget-wide v3, p0, Lorg/apache/http/impl/io/ContentLengthInputStream;->contentLength:J

    cmp-long v1, v1, v3

    if-gez v1, :cond_16

    .line 147
    new-instance v1, Lorg/apache/http/ConnectionClosedException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Premature end of Content-Length delimited message body (expected: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v3, p0, Lorg/apache/http/impl/io/ContentLengthInputStream;->contentLength:J

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; received: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v3, p0, Lorg/apache/http/impl/io/ContentLengthInputStream;->pos:J

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/http/ConnectionClosedException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 152
    :cond_4e
    iget-wide v1, p0, Lorg/apache/http/impl/io/ContentLengthInputStream;->pos:J

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    iput-wide v1, p0, Lorg/apache/http/impl/io/ContentLengthInputStream;->pos:J

    goto :goto_16
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
    .line 204
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/http/impl/io/ContentLengthInputStream;->read([BII)I

    move-result v0

    return v0
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
    const/4 v1, -0x1

    .line 171
    iget-boolean v2, p0, Lorg/apache/http/impl/io/ContentLengthInputStream;->closed:Z

    if-eqz v2, :cond_d

    .line 172
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Attempted read from closed stream."

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 175
    :cond_d
    iget-wide v2, p0, Lorg/apache/http/impl/io/ContentLengthInputStream;->pos:J

    iget-wide v4, p0, Lorg/apache/http/impl/io/ContentLengthInputStream;->contentLength:J

    cmp-long v2, v2, v4

    if-ltz v2, :cond_17

    move v0, v1

    .line 191
    :cond_16
    :goto_16
    return v0

    .line 179
    :cond_17
    iget-wide v2, p0, Lorg/apache/http/impl/io/ContentLengthInputStream;->pos:J

    int-to-long v4, p3

    add-long/2addr v2, v4

    iget-wide v4, p0, Lorg/apache/http/impl/io/ContentLengthInputStream;->contentLength:J

    cmp-long v2, v2, v4

    if-lez v2, :cond_27

    .line 180
    iget-wide v2, p0, Lorg/apache/http/impl/io/ContentLengthInputStream;->contentLength:J

    iget-wide v4, p0, Lorg/apache/http/impl/io/ContentLengthInputStream;->pos:J

    sub-long/2addr v2, v4

    long-to-int p3, v2

    .line 182
    :cond_27
    iget-object v2, p0, Lorg/apache/http/impl/io/ContentLengthInputStream;->in:Lorg/apache/http/io/SessionInputBuffer;

    invoke-interface {v2, p1, p2, p3}, Lorg/apache/http/io/SessionInputBuffer;->read([BII)I

    move-result v0

    .line 183
    .local v0, "count":I
    if-ne v0, v1, :cond_5e

    iget-wide v1, p0, Lorg/apache/http/impl/io/ContentLengthInputStream;->pos:J

    iget-wide v3, p0, Lorg/apache/http/impl/io/ContentLengthInputStream;->contentLength:J

    cmp-long v1, v1, v3

    if-gez v1, :cond_5e

    .line 184
    new-instance v1, Lorg/apache/http/ConnectionClosedException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Premature end of Content-Length delimited message body (expected: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v3, p0, Lorg/apache/http/impl/io/ContentLengthInputStream;->contentLength:J

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; received: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v3, p0, Lorg/apache/http/impl/io/ContentLengthInputStream;->pos:J

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/http/ConnectionClosedException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 188
    :cond_5e
    if-lez v0, :cond_16

    .line 189
    iget-wide v1, p0, Lorg/apache/http/impl/io/ContentLengthInputStream;->pos:J

    int-to-long v3, v0

    add-long/2addr v1, v3

    iput-wide v1, p0, Lorg/apache/http/impl/io/ContentLengthInputStream;->pos:J

    goto :goto_16
.end method

.method public skip(J)J
    .registers 15
    .param p1, "n"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v6, 0x0

    .line 217
    cmp-long v8, p1, v6

    if-gtz v8, :cond_8

    move-wide v1, v6

    .line 234
    :cond_7
    return-wide v1

    .line 220
    :cond_8
    const/16 v8, 0x800

    new-array v0, v8, [B

    .line 223
    .local v0, "buffer":[B
    iget-wide v8, p0, Lorg/apache/http/impl/io/ContentLengthInputStream;->contentLength:J

    iget-wide v10, p0, Lorg/apache/http/impl/io/ContentLengthInputStream;->pos:J

    sub-long/2addr v8, v10

    invoke-static {p1, p2, v8, v9}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    .line 225
    .local v4, "remaining":J
    const-wide/16 v1, 0x0

    .line 226
    .local v1, "count":J
    :goto_17
    cmp-long v8, v4, v6

    if-lez v8, :cond_7

    .line 227
    const/4 v8, 0x0

    const-wide/16 v9, 0x800

    invoke-static {v9, v10, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v9

    long-to-int v9, v9

    invoke-virtual {p0, v0, v8, v9}, Lorg/apache/http/impl/io/ContentLengthInputStream;->read([BII)I

    move-result v3

    .line 228
    .local v3, "l":I
    const/4 v8, -0x1

    if-eq v3, v8, :cond_7

    .line 231
    int-to-long v8, v3

    add-long/2addr v1, v8

    .line 232
    int-to-long v8, v3

    sub-long/2addr v4, v8

    .line 233
    goto :goto_17
.end method
