.class public final Lcom/google/android/exoplayer/upstream/ByteArrayDataSink;
.super Ljava/lang/Object;
.source "ByteArrayDataSink.java"

# interfaces
.implements Lcom/google/android/exoplayer/upstream/DataSink;


# instance fields
.field private stream:Ljava/io/ByteArrayOutputStream;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
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
    .line 44
    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/ByteArrayDataSink;->stream:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 45
    return-void
.end method

.method public getData()[B
    .registers 2

    .prologue
    .line 58
    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/ByteArrayDataSink;->stream:Ljava/io/ByteArrayOutputStream;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/ByteArrayDataSink;->stream:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    goto :goto_5
.end method

.method public open(Lcom/google/android/exoplayer/upstream/DataSpec;)Lcom/google/android/exoplayer/upstream/DataSink;
    .registers 6
    .param p1, "dataSpec"    # Lcom/google/android/exoplayer/upstream/DataSpec;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 33
    iget-wide v0, p1, Lcom/google/android/exoplayer/upstream/DataSpec;->length:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_10

    .line 34
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/upstream/ByteArrayDataSink;->stream:Ljava/io/ByteArrayOutputStream;

    .line 39
    :goto_f
    return-object p0

    .line 36
    :cond_10
    iget-wide v0, p1, Lcom/google/android/exoplayer/upstream/DataSpec;->length:J

    const-wide/32 v2, 0x7fffffff

    cmp-long v0, v0, v2

    if-gtz v0, :cond_28

    const/4 v0, 0x1

    :goto_1a
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkArgument(Z)V

    .line 37
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    iget-wide v1, p1, Lcom/google/android/exoplayer/upstream/DataSpec;->length:J

    long-to-int v1, v1

    invoke-direct {v0, v1}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/exoplayer/upstream/ByteArrayDataSink;->stream:Ljava/io/ByteArrayOutputStream;

    goto :goto_f

    .line 36
    :cond_28
    const/4 v0, 0x0

    goto :goto_1a
.end method

.method public write([BII)V
    .registers 5
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 49
    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/ByteArrayDataSink;->stream:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 50
    return-void
.end method
