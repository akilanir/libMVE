.class public Lcom/facebook/stetho/server/CompositeInputStream;
.super Ljava/io/InputStream;
.source "CompositeInputStream.java"


# annotations
.annotation build Ljavax/annotation/concurrent/NotThreadSafe;
.end annotation


# instance fields
.field private mCurrentIndex:I

.field private final mStreams:[Ljava/io/InputStream;


# direct methods
.method public constructor <init>([Ljava/io/InputStream;)V
    .registers 4
    .param p1, "streams"    # [Ljava/io/InputStream;

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 25
    if-eqz p1, :cond_9

    array-length v0, p1

    const/4 v1, 0x2

    if-ge v0, v1, :cond_11

    .line 26
    :cond_9
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Streams must be non-null and have more than 1 entry"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 28
    :cond_11
    iput-object p1, p0, Lcom/facebook/stetho/server/CompositeInputStream;->mStreams:[Ljava/io/InputStream;

    .line 29
    const/4 v0, 0x0

    iput v0, p0, Lcom/facebook/stetho/server/CompositeInputStream;->mCurrentIndex:I

    .line 30
    return-void
.end method

.method private closeAll(I)V
    .registers 7
    .param p1, "mostImportantIndex"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 43
    const/4 v1, 0x0

    .line 44
    .local v1, "exceptionToThrow":Ljava/io/IOException;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2
    iget-object v4, p0, Lcom/facebook/stetho/server/CompositeInputStream;->mStreams:[Ljava/io/InputStream;

    array-length v4, v4

    if-ge v2, v4, :cond_22

    .line 46
    :try_start_7
    iget-object v4, p0, Lcom/facebook/stetho/server/CompositeInputStream;->mStreams:[Ljava/io/InputStream;

    aget-object v4, v4, v2

    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_e
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_e} :catch_11

    .line 44
    :cond_e
    :goto_e
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 47
    :catch_11
    move-exception v0

    .line 48
    .local v0, "e":Ljava/io/IOException;
    move-object v3, v1

    .line 49
    .local v3, "previousException":Ljava/io/IOException;
    if-eq v2, p1, :cond_17

    if-nez v1, :cond_18

    .line 50
    :cond_17
    move-object v1, v0

    .line 52
    :cond_18
    if-eqz v3, :cond_e

    if-eq v3, v1, :cond_e

    .line 53
    const-string v4, "Suppressing exception"

    invoke-static {v3, v4}, Lcom/facebook/stetho/common/LogUtil;->w(Ljava/lang/Throwable;Ljava/lang/String;)V

    goto :goto_e

    .line 57
    .end local v0    # "e":Ljava/io/IOException;
    .end local v3    # "previousException":Ljava/io/IOException;
    :cond_22
    return-void
.end method

.method private tryMoveToNextStream()Z
    .registers 3

    .prologue
    .line 102
    iget v0, p0, Lcom/facebook/stetho/server/CompositeInputStream;->mCurrentIndex:I

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/facebook/stetho/server/CompositeInputStream;->mStreams:[Ljava/io/InputStream;

    array-length v1, v1

    if-ge v0, v1, :cond_11

    .line 103
    iget v0, p0, Lcom/facebook/stetho/server/CompositeInputStream;->mCurrentIndex:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/facebook/stetho/server/CompositeInputStream;->mCurrentIndex:I

    .line 104
    const/4 v0, 0x1

    .line 106
    :goto_10
    return v0

    :cond_11
    const/4 v0, 0x0

    goto :goto_10
.end method


# virtual methods
.method public available()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 34
    iget-object v0, p0, Lcom/facebook/stetho/server/CompositeInputStream;->mStreams:[Ljava/io/InputStream;

    iget v1, p0, Lcom/facebook/stetho/server/CompositeInputStream;->mCurrentIndex:I

    aget-object v0, v0, v1

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
    .line 39
    iget v0, p0, Lcom/facebook/stetho/server/CompositeInputStream;->mCurrentIndex:I

    invoke-direct {p0, v0}, Lcom/facebook/stetho/server/CompositeInputStream;->closeAll(I)V

    .line 40
    return-void
.end method

.method public mark(I)V
    .registers 3
    .param p1, "readlimit"    # I

    .prologue
    .line 61
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public markSupported()Z
    .registers 2

    .prologue
    .line 66
    const/4 v0, 0x0

    return v0
.end method

.method public read()I
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 93
    :cond_0
    iget-object v1, p0, Lcom/facebook/stetho/server/CompositeInputStream;->mStreams:[Ljava/io/InputStream;

    iget v2, p0, Lcom/facebook/stetho/server/CompositeInputStream;->mCurrentIndex:I

    aget-object v1, v1, v2

    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    move-result v0

    .local v0, "b":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_13

    .line 94
    invoke-direct {p0}, Lcom/facebook/stetho/server/CompositeInputStream;->tryMoveToNextStream()Z

    move-result v1

    if-nez v1, :cond_0

    .line 98
    :cond_13
    return v0
.end method

.method public read([B)I
    .registers 4
    .param p1, "buffer"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 76
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/facebook/stetho/server/CompositeInputStream;->read([BII)I

    move-result v0

    return v0
.end method

.method public read([BII)I
    .registers 7
    .param p1, "buffer"    # [B
    .param p2, "byteOffset"    # I
    .param p3, "byteCount"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 82
    :cond_0
    iget-object v1, p0, Lcom/facebook/stetho/server/CompositeInputStream;->mStreams:[Ljava/io/InputStream;

    iget v2, p0, Lcom/facebook/stetho/server/CompositeInputStream;->mCurrentIndex:I

    aget-object v1, v1, v2

    invoke-virtual {v1, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .local v0, "n":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_13

    .line 83
    invoke-direct {p0}, Lcom/facebook/stetho/server/CompositeInputStream;->tryMoveToNextStream()Z

    move-result v1

    if-nez v1, :cond_0

    .line 87
    :cond_13
    return v0
.end method

.method public reset()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 71
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
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
    .line 111
    long-to-int v2, p1

    new-array v0, v2, [B

    .line 112
    .local v0, "buf":[B
    invoke-virtual {p0, v0}, Lcom/facebook/stetho/server/CompositeInputStream;->read([B)I

    move-result v1

    .line 113
    .local v1, "n":I
    if-ltz v1, :cond_b

    int-to-long v2, v1

    :goto_a
    return-wide v2

    :cond_b
    const-wide/16 v2, -0x1

    goto :goto_a
.end method
