.class public Lcom/octo/android/robospice/request/ProgressByteProcessor;
.super Ljava/lang/Object;
.source "ProgressByteProcessor.java"


# instance fields
.field private final bos:Ljava/io/OutputStream;

.field private progress:J

.field private spiceRequest:Lcom/octo/android/robospice/request/SpiceRequest;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/octo/android/robospice/request/SpiceRequest",
            "<*>;"
        }
    .end annotation
.end field

.field private final total:J


# direct methods
.method public constructor <init>(Lcom/octo/android/robospice/request/SpiceRequest;Ljava/io/OutputStream;J)V
    .registers 5
    .param p2, "bos"    # Ljava/io/OutputStream;
    .param p3, "total"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/SpiceRequest",
            "<*>;",
            "Ljava/io/OutputStream;",
            "J)V"
        }
    .end annotation

    .prologue
    .line 16
    .local p1, "spiceRequest":Lcom/octo/android/robospice/request/SpiceRequest;, "Lcom/octo/android/robospice/request/SpiceRequest<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput-object p2, p0, Lcom/octo/android/robospice/request/ProgressByteProcessor;->bos:Ljava/io/OutputStream;

    .line 18
    iput-wide p3, p0, Lcom/octo/android/robospice/request/ProgressByteProcessor;->total:J

    .line 19
    iput-object p1, p0, Lcom/octo/android/robospice/request/ProgressByteProcessor;->spiceRequest:Lcom/octo/android/robospice/request/SpiceRequest;

    .line 20
    return-void
.end method


# virtual methods
.method public processBytes([BII)Z
    .registers 8
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 23
    iget-object v0, p0, Lcom/octo/android/robospice/request/ProgressByteProcessor;->bos:Ljava/io/OutputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V

    .line 24
    iget-wide v0, p0, Lcom/octo/android/robospice/request/ProgressByteProcessor;->progress:J

    sub-int v2, p3, p2

    int-to-long v2, v2

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/octo/android/robospice/request/ProgressByteProcessor;->progress:J

    .line 25
    iget-object v0, p0, Lcom/octo/android/robospice/request/ProgressByteProcessor;->spiceRequest:Lcom/octo/android/robospice/request/SpiceRequest;

    iget-wide v1, p0, Lcom/octo/android/robospice/request/ProgressByteProcessor;->progress:J

    long-to-float v1, v1

    iget-wide v2, p0, Lcom/octo/android/robospice/request/ProgressByteProcessor;->total:J

    long-to-float v2, v2

    div-float/2addr v1, v2

    invoke-virtual {v0, v1}, Lcom/octo/android/robospice/request/SpiceRequest;->publishProgress(F)V

    .line 26
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v0

    if-nez v0, :cond_21

    const/4 v0, 0x1

    :goto_20
    return v0

    :cond_21
    const/4 v0, 0x0

    goto :goto_20
.end method
