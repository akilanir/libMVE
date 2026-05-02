.class final Lcom/squareup/picasso/MarkableInputStream;
.super Ljava/io/InputStream;
.source "MarkableInputStream.java"


# static fields
.field private static final DEFAULT_BUFFER_SIZE:I = 0x1000


# instance fields
.field private defaultMark:J

.field private final in:Ljava/io/InputStream;

.field private limit:J

.field private offset:J

.field private reset:J


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 3
    .param p1, "in"    # Ljava/io/InputStream;

    .prologue
    .line 38
    const/16 v0, 0x1000

    invoke-direct {p0, p1, v0}, Lcom/squareup/picasso/MarkableInputStream;-><init>(Ljava/io/InputStream;I)V

    .line 39
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;I)V
    .registers 6
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "size"    # I

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 35
    const-wide/16 v1, -0x1

    iput-wide v1, p0, Lcom/squareup/picasso/MarkableInputStream;->defaultMark:J

    .line 42
    invoke-virtual {p1}, Ljava/io/InputStream;->markSupported()Z

    move-result v1

    if-nez v1, :cond_13

    .line 43
    new-instance v0, Ljava/io/BufferedInputStream;

    invoke-direct {v0, p1, p2}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V

    .end local p1    # "in":Ljava/io/InputStream;
    .local v0, "in":Ljava/io/InputStream;
    move-object p1, v0

    .line 45
    .end local v0    # "in":Ljava/io/InputStream;
    .restart local p1    # "in":Ljava/io/InputStream;
    :cond_13
    iput-object p1, p0, Lcom/squareup/picasso/MarkableInputStream;->in:Ljava/io/InputStream;

    .line 46
    return-void
.end method

.method private setLimit(J)V
    .registers 8
    .param p1, "limit"    # J

    .prologue
    .line 77
    :try_start_0
    iget-wide v1, p0, Lcom/squareup/picasso/MarkableInputStream;->reset:J

    iget-wide v3, p0, Lcom/squareup/picasso/MarkableInputStream;->offset:J

    cmp-long v1, v1, v3

    if-gez v1, :cond_29

    iget-wide v1, p0, Lcom/squareup/picasso/MarkableInputStream;->offset:J

    iget-wide v3, p0, Lcom/squareup/picasso/MarkableInputStream;->limit:J

    cmp-long v1, v1, v3

    if-gtz v1, :cond_29

    .line 78
    iget-object v1, p0, Lcom/squareup/picasso/MarkableInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v1}, Ljava/io/InputStream;->reset()V

    .line 79
    iget-object v1, p0, Lcom/squareup/picasso/MarkableInputStream;->in:Ljava/io/InputStream;

    iget-wide v2, p0, Lcom/squareup/picasso/MarkableInputStream;->reset:J

    sub-long v2, p1, v2

    long-to-int v2, v2

    invoke-virtual {v1, v2}, Ljava/io/InputStream;->mark(I)V

    .line 80
    iget-wide v1, p0, Lcom/squareup/picasso/MarkableInputStream;->reset:J

    iget-wide v3, p0, Lcom/squareup/picasso/MarkableInputStream;->offset:J

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/squareup/picasso/MarkableInputStream;->skip(JJ)V

    .line 85
    :goto_26
    iput-wide p1, p0, Lcom/squareup/picasso/MarkableInputStream;->limit:J

    .line 89
    return-void

    .line 82
    :cond_29
    iget-wide v1, p0, Lcom/squareup/picasso/MarkableInputStream;->offset:J

    iput-wide v1, p0, Lcom/squareup/picasso/MarkableInputStream;->reset:J

    .line 83
    iget-object v1, p0, Lcom/squareup/picasso/MarkableInputStream;->in:Ljava/io/InputStream;

    iget-wide v2, p0, Lcom/squareup/picasso/MarkableInputStream;->offset:J

    sub-long v2, p1, v2

    long-to-int v2, v2

    invoke-virtual {v1, v2}, Ljava/io/InputStream;->mark(I)V
    :try_end_37
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_37} :catch_38

    goto :goto_26

    .line 86
    :catch_38
    move-exception v0

    .line 87
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
    .line 108
    :goto_0
    cmp-long v2, p1, p3

    if-gez v2, :cond_19

    .line 109
    iget-object v2, p0, Lcom/squareup/picasso/MarkableInputStream;->in:Ljava/io/InputStream;

    sub-long v3, p3, p1

    invoke-virtual {v2, v3, v4}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v0

    .line 110
    .local v0, "skipped":J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-nez v2, :cond_1c

    .line 111
    invoke-virtual {p0}, Lcom/squareup/picasso/MarkableInputStream;->read()I

    move-result v2

    const/4 v3, -0x1

    if-ne v2, v3, :cond_1a

    .line 119
    .end local v0    # "skipped":J
    :cond_19
    return-void

    .line 114
    .restart local v0    # "skipped":J
    :cond_1a
    const-wide/16 v0, 0x1

    .line 117
    :cond_1c
    add-long/2addr p1, v0

    .line 118
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
    .line 152
    iget-object v0, p0, Lcom/squareup/picasso/MarkableInputStream;->in:Ljava/io/InputStream;

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
    .line 156
    iget-object v0, p0, Lcom/squareup/picasso/MarkableInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 157
    return-void
.end method

.method public mark(I)V
    .registers 4
    .param p1, "readLimit"    # I

    .prologue
    .line 50
    invoke-virtual {p0, p1}, Lcom/squareup/picasso/MarkableInputStream;->savePosition(I)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/squareup/picasso/MarkableInputStream;->defaultMark:J

    .line 51
    return-void
.end method

.method public markSupported()Z
    .registers 2

    .prologue
    .line 160
    iget-object v0, p0, Lcom/squareup/picasso/MarkableInputStream;->in:Ljava/io/InputStream;

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
    .line 122
    iget-object v1, p0, Lcom/squareup/picasso/MarkableInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 123
    .local v0, "result":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_10

    .line 124
    iget-wide v1, p0, Lcom/squareup/picasso/MarkableInputStream;->offset:J

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    iput-wide v1, p0, Lcom/squareup/picasso/MarkableInputStream;->offset:J

    .line 126
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
    .line 130
    iget-object v1, p0, Lcom/squareup/picasso/MarkableInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v1, p1}, Ljava/io/InputStream;->read([B)I

    move-result v0

    .line 131
    .local v0, "count":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_f

    .line 132
    iget-wide v1, p0, Lcom/squareup/picasso/MarkableInputStream;->offset:J

    int-to-long v3, v0

    add-long/2addr v1, v3

    iput-wide v1, p0, Lcom/squareup/picasso/MarkableInputStream;->offset:J

    .line 134
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
    .line 138
    iget-object v1, p0, Lcom/squareup/picasso/MarkableInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v1, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 139
    .local v0, "count":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_f

    .line 140
    iget-wide v1, p0, Lcom/squareup/picasso/MarkableInputStream;->offset:J

    int-to-long v3, v0

    add-long/2addr v1, v3

    iput-wide v1, p0, Lcom/squareup/picasso/MarkableInputStream;->offset:J

    .line 142
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
    .line 93
    iget-wide v0, p0, Lcom/squareup/picasso/MarkableInputStream;->defaultMark:J

    invoke-virtual {p0, v0, v1}, Lcom/squareup/picasso/MarkableInputStream;->reset(J)V

    .line 94
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
    .line 98
    iget-wide v0, p0, Lcom/squareup/picasso/MarkableInputStream;->offset:J

    iget-wide v2, p0, Lcom/squareup/picasso/MarkableInputStream;->limit:J

    cmp-long v0, v0, v2

    if-gtz v0, :cond_e

    iget-wide v0, p0, Lcom/squareup/picasso/MarkableInputStream;->reset:J

    cmp-long v0, p1, v0

    if-gez v0, :cond_16

    .line 99
    :cond_e
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Cannot reset"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 101
    :cond_16
    iget-object v0, p0, Lcom/squareup/picasso/MarkableInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->reset()V

    .line 102
    iget-wide v0, p0, Lcom/squareup/picasso/MarkableInputStream;->reset:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/squareup/picasso/MarkableInputStream;->skip(JJ)V

    .line 103
    iput-wide p1, p0, Lcom/squareup/picasso/MarkableInputStream;->offset:J

    .line 104
    return-void
.end method

.method public savePosition(I)J
    .registers 8
    .param p1, "readLimit"    # I

    .prologue
    .line 60
    iget-wide v2, p0, Lcom/squareup/picasso/MarkableInputStream;->offset:J

    int-to-long v4, p1

    add-long v0, v2, v4

    .line 61
    .local v0, "offsetLimit":J
    iget-wide v2, p0, Lcom/squareup/picasso/MarkableInputStream;->limit:J

    cmp-long v2, v2, v0

    if-gez v2, :cond_e

    .line 62
    invoke-direct {p0, v0, v1}, Lcom/squareup/picasso/MarkableInputStream;->setLimit(J)V

    .line 64
    :cond_e
    iget-wide v2, p0, Lcom/squareup/picasso/MarkableInputStream;->offset:J

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
    .line 146
    iget-object v2, p0, Lcom/squareup/picasso/MarkableInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v2, p1, p2}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v0

    .line 147
    .local v0, "skipped":J
    iget-wide v2, p0, Lcom/squareup/picasso/MarkableInputStream;->offset:J

    add-long/2addr v2, v0

    iput-wide v2, p0, Lcom/squareup/picasso/MarkableInputStream;->offset:J

    .line 148
    return-wide v0
.end method
