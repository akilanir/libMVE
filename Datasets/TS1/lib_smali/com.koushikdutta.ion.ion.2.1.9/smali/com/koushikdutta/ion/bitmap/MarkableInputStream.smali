.class final Lcom/koushikdutta/ion/bitmap/MarkableInputStream;
.super Ljava/io/InputStream;
.source "MarkableInputStream.java"


# instance fields
.field private defaultMark:J

.field private final in:Ljava/io/InputStream;

.field private limit:J

.field private offset:J

.field private reset:J


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 5
    .param p1, "in"    # Ljava/io/InputStream;

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 34
    const-wide/16 v1, -0x1

    iput-wide v1, p0, Lcom/koushikdutta/ion/bitmap/MarkableInputStream;->defaultMark:J

    .line 37
    invoke-virtual {p1}, Ljava/io/InputStream;->markSupported()Z

    move-result v1

    if-nez v1, :cond_13

    .line 38
    new-instance v0, Ljava/io/BufferedInputStream;

    invoke-direct {v0, p1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .end local p1    # "in":Ljava/io/InputStream;
    .local v0, "in":Ljava/io/InputStream;
    move-object p1, v0

    .line 40
    .end local v0    # "in":Ljava/io/InputStream;
    .restart local p1    # "in":Ljava/io/InputStream;
    :cond_13
    iput-object p1, p0, Lcom/koushikdutta/ion/bitmap/MarkableInputStream;->in:Ljava/io/InputStream;

    .line 41
    return-void
.end method

.method private setLimit(J)V
    .registers 8
    .param p1, "limit"    # J

    .prologue
    .line 72
    :try_start_0
    iget-wide v1, p0, Lcom/koushikdutta/ion/bitmap/MarkableInputStream;->reset:J

    iget-wide v3, p0, Lcom/koushikdutta/ion/bitmap/MarkableInputStream;->offset:J

    cmp-long v1, v1, v3

    if-gez v1, :cond_29

    iget-wide v1, p0, Lcom/koushikdutta/ion/bitmap/MarkableInputStream;->offset:J

    iget-wide v3, p0, Lcom/koushikdutta/ion/bitmap/MarkableInputStream;->limit:J

    cmp-long v1, v1, v3

    if-gtz v1, :cond_29

    .line 73
    iget-object v1, p0, Lcom/koushikdutta/ion/bitmap/MarkableInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v1}, Ljava/io/InputStream;->reset()V

    .line 74
    iget-object v1, p0, Lcom/koushikdutta/ion/bitmap/MarkableInputStream;->in:Ljava/io/InputStream;

    iget-wide v2, p0, Lcom/koushikdutta/ion/bitmap/MarkableInputStream;->reset:J

    sub-long v2, p1, v2

    long-to-int v2, v2

    invoke-virtual {v1, v2}, Ljava/io/InputStream;->mark(I)V

    .line 75
    iget-wide v1, p0, Lcom/koushikdutta/ion/bitmap/MarkableInputStream;->reset:J

    iget-wide v3, p0, Lcom/koushikdutta/ion/bitmap/MarkableInputStream;->offset:J

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/koushikdutta/ion/bitmap/MarkableInputStream;->skip(JJ)V

    .line 80
    :goto_26
    iput-wide p1, p0, Lcom/koushikdutta/ion/bitmap/MarkableInputStream;->limit:J

    .line 84
    return-void

    .line 77
    :cond_29
    iget-wide v1, p0, Lcom/koushikdutta/ion/bitmap/MarkableInputStream;->offset:J

    iput-wide v1, p0, Lcom/koushikdutta/ion/bitmap/MarkableInputStream;->reset:J

    .line 78
    iget-object v1, p0, Lcom/koushikdutta/ion/bitmap/MarkableInputStream;->in:Ljava/io/InputStream;

    iget-wide v2, p0, Lcom/koushikdutta/ion/bitmap/MarkableInputStream;->offset:J

    sub-long v2, p1, v2

    long-to-int v2, v2

    invoke-virtual {v1, v2}, Ljava/io/InputStream;->mark(I)V
    :try_end_37
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_37} :catch_38

    goto :goto_26

    .line 81
    :catch_38
    move-exception v0

    .line 82
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unable to mark: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private skip(JJ)V
    .registers 10
    .param p1, "current"    # J
    .param p3, "target"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 103
    :goto_0
    cmp-long v2, p1, p3

    if-gez v2, :cond_19

    .line 104
    iget-object v2, p0, Lcom/koushikdutta/ion/bitmap/MarkableInputStream;->in:Ljava/io/InputStream;

    sub-long v3, p3, p1

    invoke-virtual {v2, v3, v4}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v0

    .line 105
    .local v0, "skipped":J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-nez v2, :cond_1c

    .line 106
    invoke-virtual {p0}, Lcom/koushikdutta/ion/bitmap/MarkableInputStream;->read()I

    move-result v2

    const/4 v3, -0x1

    if-ne v2, v3, :cond_1a

    .line 114
    .end local v0    # "skipped":J
    :cond_19
    return-void

    .line 109
    .restart local v0    # "skipped":J
    :cond_1a
    const-wide/16 v0, 0x1

    .line 112
    :cond_1c
    add-long/2addr p1, v0

    .line 113
    goto :goto_0
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
    .line 147
    iget-object v0, p0, Lcom/koushikdutta/ion/bitmap/MarkableInputStream;->in:Ljava/io/InputStream;

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
    .line 151
    iget-object v0, p0, Lcom/koushikdutta/ion/bitmap/MarkableInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 152
    return-void
.end method

.method public mark(I)V
    .registers 4
    .param p1, "readLimit"    # I

    .prologue
    .line 45
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/bitmap/MarkableInputStream;->savePosition(I)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/koushikdutta/ion/bitmap/MarkableInputStream;->defaultMark:J

    .line 46
    return-void
.end method

.method public markSupported()Z
    .registers 2

    .prologue
    .line 155
    iget-object v0, p0, Lcom/koushikdutta/ion/bitmap/MarkableInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->markSupported()Z

    move-result v0

    return v0
.end method

.method public read()I
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 117
    iget-object v1, p0, Lcom/koushikdutta/ion/bitmap/MarkableInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 118
    .local v0, "result":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_10

    .line 119
    iget-wide v1, p0, Lcom/koushikdutta/ion/bitmap/MarkableInputStream;->offset:J

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    iput-wide v1, p0, Lcom/koushikdutta/ion/bitmap/MarkableInputStream;->offset:J

    .line 121
    :cond_10
    return v0
.end method

.method public read([B)I
    .registers 7
    .param p1, "buffer"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 125
    iget-object v1, p0, Lcom/koushikdutta/ion/bitmap/MarkableInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v1, p1}, Ljava/io/InputStream;->read([B)I

    move-result v0

    .line 126
    .local v0, "count":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_f

    .line 127
    iget-wide v1, p0, Lcom/koushikdutta/ion/bitmap/MarkableInputStream;->offset:J

    int-to-long v3, v0

    add-long/2addr v1, v3

    iput-wide v1, p0, Lcom/koushikdutta/ion/bitmap/MarkableInputStream;->offset:J

    .line 129
    :cond_f
    return v0
.end method

.method public read([BII)I
    .registers 9
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 133
    iget-object v1, p0, Lcom/koushikdutta/ion/bitmap/MarkableInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v1, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 134
    .local v0, "count":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_f

    .line 135
    iget-wide v1, p0, Lcom/koushikdutta/ion/bitmap/MarkableInputStream;->offset:J

    int-to-long v3, v0

    add-long/2addr v1, v3

    iput-wide v1, p0, Lcom/koushikdutta/ion/bitmap/MarkableInputStream;->offset:J

    .line 137
    :cond_f
    return v0
.end method

.method public reset()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 88
    iget-wide v0, p0, Lcom/koushikdutta/ion/bitmap/MarkableInputStream;->defaultMark:J

    invoke-virtual {p0, v0, v1}, Lcom/koushikdutta/ion/bitmap/MarkableInputStream;->reset(J)V

    .line 89
    return-void
.end method

.method public reset(J)V
    .registers 7
    .param p1, "token"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 93
    iget-wide v0, p0, Lcom/koushikdutta/ion/bitmap/MarkableInputStream;->offset:J

    iget-wide v2, p0, Lcom/koushikdutta/ion/bitmap/MarkableInputStream;->limit:J

    cmp-long v0, v0, v2

    if-gtz v0, :cond_e

    iget-wide v0, p0, Lcom/koushikdutta/ion/bitmap/MarkableInputStream;->reset:J

    cmp-long v0, p1, v0

    if-gez v0, :cond_16

    .line 94
    :cond_e
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Cannot reset"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 96
    :cond_16
    iget-object v0, p0, Lcom/koushikdutta/ion/bitmap/MarkableInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->reset()V

    .line 97
    iget-wide v0, p0, Lcom/koushikdutta/ion/bitmap/MarkableInputStream;->reset:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/koushikdutta/ion/bitmap/MarkableInputStream;->skip(JJ)V

    .line 98
    iput-wide p1, p0, Lcom/koushikdutta/ion/bitmap/MarkableInputStream;->offset:J

    .line 99
    return-void
.end method

.method public savePosition(I)J
    .registers 8
    .param p1, "readLimit"    # I

    .prologue
    .line 55
    iget-wide v2, p0, Lcom/koushikdutta/ion/bitmap/MarkableInputStream;->offset:J

    int-to-long v4, p1

    add-long v0, v2, v4

    .line 56
    .local v0, "offsetLimit":J
    iget-wide v2, p0, Lcom/koushikdutta/ion/bitmap/MarkableInputStream;->limit:J

    cmp-long v2, v2, v0

    if-gez v2, :cond_e

    .line 57
    invoke-direct {p0, v0, v1}, Lcom/koushikdutta/ion/bitmap/MarkableInputStream;->setLimit(J)V

    .line 59
    :cond_e
    iget-wide v2, p0, Lcom/koushikdutta/ion/bitmap/MarkableInputStream;->offset:J

    return-wide v2
.end method

.method public skip(J)J
    .registers 7
    .param p1, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 141
    iget-object v2, p0, Lcom/koushikdutta/ion/bitmap/MarkableInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v2, p1, p2}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v0

    .line 142
    .local v0, "skipped":J
    iget-wide v2, p0, Lcom/koushikdutta/ion/bitmap/MarkableInputStream;->offset:J

    add-long/2addr v2, v0

    iput-wide v2, p0, Lcom/koushikdutta/ion/bitmap/MarkableInputStream;->offset:J

    .line 143
    return-wide v0
.end method
