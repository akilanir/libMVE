.class public Lcom/facebook/stetho/server/LeakyBufferedInputStream;
.super Ljava/io/BufferedInputStream;
.source "LeakyBufferedInputStream.java"


# annotations
.annotation build Ljavax/annotation/concurrent/ThreadSafe;
.end annotation


# instance fields
.field private mLeaked:Z

.field private mMarked:Z


# direct methods
.method public constructor <init>(Ljava/io/InputStream;I)V
    .registers 3
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "bufSize"    # I

    .prologue
    .line 25
    invoke-direct {p0, p1, p2}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V

    .line 26
    return-void
.end method

.method private clearBufferLocked()[B
    .registers 6

    .prologue
    const/4 v4, 0x0

    .line 59
    iget v1, p0, Lcom/facebook/stetho/server/LeakyBufferedInputStream;->count:I

    iget v2, p0, Lcom/facebook/stetho/server/LeakyBufferedInputStream;->pos:I

    sub-int/2addr v1, v2

    new-array v0, v1, [B

    .line 60
    .local v0, "leaked":[B
    iget-object v1, p0, Lcom/facebook/stetho/server/LeakyBufferedInputStream;->buf:[B

    iget v2, p0, Lcom/facebook/stetho/server/LeakyBufferedInputStream;->pos:I

    array-length v3, v0

    invoke-static {v1, v2, v0, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 61
    iput v4, p0, Lcom/facebook/stetho/server/LeakyBufferedInputStream;->pos:I

    .line 62
    iput v4, p0, Lcom/facebook/stetho/server/LeakyBufferedInputStream;->count:I

    .line 63
    return-object v0
.end method

.method private throwIfLeaked()V
    .registers 2

    .prologue
    .line 67
    iget-boolean v0, p0, Lcom/facebook/stetho/server/LeakyBufferedInputStream;->mLeaked:Z

    if-eqz v0, :cond_a

    .line 68
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 70
    :cond_a
    return-void
.end method

.method private throwIfMarked()V
    .registers 2

    .prologue
    .line 73
    iget-boolean v0, p0, Lcom/facebook/stetho/server/LeakyBufferedInputStream;->mMarked:Z

    if-eqz v0, :cond_a

    .line 74
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 76
    :cond_a
    return-void
.end method


# virtual methods
.method public declared-synchronized leakBufferAndStream()Ljava/io/InputStream;
    .registers 6

    .prologue
    .line 48
    monitor-enter p0

    :try_start_1
    invoke-direct {p0}, Lcom/facebook/stetho/server/LeakyBufferedInputStream;->throwIfLeaked()V

    .line 49
    invoke-direct {p0}, Lcom/facebook/stetho/server/LeakyBufferedInputStream;->throwIfMarked()V

    .line 50
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/facebook/stetho/server/LeakyBufferedInputStream;->mLeaked:Z

    .line 51
    new-instance v0, Lcom/facebook/stetho/server/CompositeInputStream;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/io/InputStream;

    const/4 v2, 0x0

    new-instance v3, Ljava/io/ByteArrayInputStream;

    .line 53
    invoke-direct {p0}, Lcom/facebook/stetho/server/LeakyBufferedInputStream;->clearBufferLocked()[B

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/facebook/stetho/server/LeakyBufferedInputStream;->in:Ljava/io/InputStream;

    aput-object v3, v1, v2

    invoke-direct {v0, v1}, Lcom/facebook/stetho/server/CompositeInputStream;-><init>([Ljava/io/InputStream;)V
    :try_end_23
    .catchall {:try_start_1 .. :try_end_23} :catchall_25

    monitor-exit p0

    return-object v0

    .line 48
    :catchall_25
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized mark(I)V
    .registers 3
    .param p1, "readlimit"    # I

    .prologue
    .line 30
    monitor-enter p0

    :try_start_1
    invoke-direct {p0}, Lcom/facebook/stetho/server/LeakyBufferedInputStream;->throwIfLeaked()V

    .line 31
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/facebook/stetho/server/LeakyBufferedInputStream;->mMarked:Z

    .line 32
    invoke-super {p0, p1}, Ljava/io/BufferedInputStream;->mark(I)V
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_c

    .line 33
    monitor-exit p0

    return-void

    .line 30
    :catchall_c
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public markSupported()Z
    .registers 2

    .prologue
    .line 44
    const/4 v0, 0x1

    return v0
.end method

.method public declared-synchronized reset()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 37
    monitor-enter p0

    :try_start_1
    invoke-direct {p0}, Lcom/facebook/stetho/server/LeakyBufferedInputStream;->throwIfLeaked()V

    .line 38
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/facebook/stetho/server/LeakyBufferedInputStream;->mMarked:Z

    .line 39
    invoke-super {p0}, Ljava/io/BufferedInputStream;->reset()V
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_c

    .line 40
    monitor-exit p0

    return-void

    .line 37
    :catchall_c
    move-exception v0

    monitor-exit p0

    throw v0
.end method
