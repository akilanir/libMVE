.class public abstract Lorg/apache/commons/io/output/ThresholdingOutputStream;
.super Ljava/io/OutputStream;
.source "ThresholdingOutputStream.java"


# instance fields
.field private final threshold:I

.field private thresholdExceeded:Z

.field private written:J


# direct methods
.method public constructor <init>(I)V
    .registers 2
    .param p1, "threshold"    # I

    .prologue
    .line 76
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 77
    iput p1, p0, Lorg/apache/commons/io/output/ThresholdingOutputStream;->threshold:I

    .line 78
    return-void
.end method


# virtual methods
.method protected checkThreshold(I)V
    .registers 6
    .param p1, "count"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 223
    iget-boolean v0, p0, Lorg/apache/commons/io/output/ThresholdingOutputStream;->thresholdExceeded:Z

    if-nez v0, :cond_15

    iget-wide v0, p0, Lorg/apache/commons/io/output/ThresholdingOutputStream;->written:J

    int-to-long v2, p1

    add-long/2addr v0, v2

    iget v2, p0, Lorg/apache/commons/io/output/ThresholdingOutputStream;->threshold:I

    int-to-long v2, v2

    cmp-long v0, v0, v2

    if-lez v0, :cond_15

    .line 225
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/io/output/ThresholdingOutputStream;->thresholdExceeded:Z

    .line 226
    invoke-virtual {p0}, Lorg/apache/commons/io/output/ThresholdingOutputStream;->thresholdReached()V

    .line 228
    :cond_15
    return-void
.end method

.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 160
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/commons/io/output/ThresholdingOutputStream;->flush()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3} :catch_b

    .line 166
    :goto_3
    invoke-virtual {p0}, Lorg/apache/commons/io/output/ThresholdingOutputStream;->getStream()Ljava/io/OutputStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 167
    return-void

    .line 162
    :catch_b
    move-exception v0

    goto :goto_3
.end method

.method public flush()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 145
    invoke-virtual {p0}, Lorg/apache/commons/io/output/ThresholdingOutputStream;->getStream()Ljava/io/OutputStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 146
    return-void
.end method

.method public getByteCount()J
    .registers 3

    .prologue
    .line 191
    iget-wide v0, p0, Lorg/apache/commons/io/output/ThresholdingOutputStream;->written:J

    return-wide v0
.end method

.method protected abstract getStream()Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public getThreshold()I
    .registers 2

    .prologue
    .line 180
    iget v0, p0, Lorg/apache/commons/io/output/ThresholdingOutputStream;->threshold:I

    return v0
.end method

.method public isThresholdExceeded()Z
    .registers 5

    .prologue
    .line 204
    iget-wide v0, p0, Lorg/apache/commons/io/output/ThresholdingOutputStream;->written:J

    iget v2, p0, Lorg/apache/commons/io/output/ThresholdingOutputStream;->threshold:I

    int-to-long v2, v2

    cmp-long v0, v0, v2

    if-lez v0, :cond_b

    const/4 v0, 0x1

    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method protected resetByteCount()V
    .registers 3

    .prologue
    .line 236
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/io/output/ThresholdingOutputStream;->thresholdExceeded:Z

    .line 237
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/apache/commons/io/output/ThresholdingOutputStream;->written:J

    .line 238
    return-void
.end method

.method protected abstract thresholdReached()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public write(I)V
    .registers 6
    .param p1, "b"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 94
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/apache/commons/io/output/ThresholdingOutputStream;->checkThreshold(I)V

    .line 95
    invoke-virtual {p0}, Lorg/apache/commons/io/output/ThresholdingOutputStream;->getStream()Ljava/io/OutputStream;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V

    .line 96
    iget-wide v0, p0, Lorg/apache/commons/io/output/ThresholdingOutputStream;->written:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lorg/apache/commons/io/output/ThresholdingOutputStream;->written:J

    .line 97
    return-void
.end method

.method public write([B)V
    .registers 6
    .param p1, "b"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 111
    array-length v0, p1

    invoke-virtual {p0, v0}, Lorg/apache/commons/io/output/ThresholdingOutputStream;->checkThreshold(I)V

    .line 112
    invoke-virtual {p0}, Lorg/apache/commons/io/output/ThresholdingOutputStream;->getStream()Ljava/io/OutputStream;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write([B)V

    .line 113
    iget-wide v0, p0, Lorg/apache/commons/io/output/ThresholdingOutputStream;->written:J

    array-length v2, p1

    int-to-long v2, v2

    add-long/2addr v0, v2

    iput-wide v0, p0, Lorg/apache/commons/io/output/ThresholdingOutputStream;->written:J

    .line 114
    return-void
.end method

.method public write([BII)V
    .registers 8
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 130
    invoke-virtual {p0, p3}, Lorg/apache/commons/io/output/ThresholdingOutputStream;->checkThreshold(I)V

    .line 131
    invoke-virtual {p0}, Lorg/apache/commons/io/output/ThresholdingOutputStream;->getStream()Ljava/io/OutputStream;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V

    .line 132
    iget-wide v0, p0, Lorg/apache/commons/io/output/ThresholdingOutputStream;->written:J

    int-to-long v2, p3

    add-long/2addr v0, v2

    iput-wide v0, p0, Lorg/apache/commons/io/output/ThresholdingOutputStream;->written:J

    .line 133
    return-void
.end method
