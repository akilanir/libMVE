.class public final Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;
.super Ljava/io/FilterInputStream;
.source "ResponseHandlingInputStream.java"


# static fields
.field private static final BUFFER_SIZE:I = 0x400

.field public static final TAG:Ljava/lang/String; = "ResponseHandlingInputStream"


# instance fields
.field private mClosed:Z
    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private final mDecompressedCounter:Lcom/facebook/stetho/inspector/network/CountingOutputStream;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private mEofSeen:Z
    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private mLastDecompressedCount:J

.field private final mNetworkPeerManager:Lcom/facebook/stetho/inspector/helper/ChromePeerManager;

.field private final mOutputStream:Ljava/io/OutputStream;

.field private final mRequestId:Ljava/lang/String;

.field private final mResponseHandler:Lcom/facebook/stetho/inspector/network/ResponseHandler;

.field private mSkipBuffer:[B
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "this"
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/io/InputStream;Ljava/lang/String;Ljava/io/OutputStream;Lcom/facebook/stetho/inspector/network/CountingOutputStream;Lcom/facebook/stetho/inspector/helper/ChromePeerManager;Lcom/facebook/stetho/inspector/network/ResponseHandler;)V
    .registers 9
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .param p2, "requestId"    # Ljava/lang/String;
    .param p3, "outputStream"    # Ljava/io/OutputStream;
    .param p4, "decompressedCounter"    # Lcom/facebook/stetho/inspector/network/CountingOutputStream;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p5, "networkPeerManager"    # Lcom/facebook/stetho/inspector/helper/ChromePeerManager;
    .param p6, "responseHandler"    # Lcom/facebook/stetho/inspector/network/ResponseHandler;

    .prologue
    .line 77
    invoke-direct {p0, p1}, Ljava/io/FilterInputStream;-><init>(Ljava/io/InputStream;)V

    .line 56
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mLastDecompressedCount:J

    .line 78
    iput-object p2, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mRequestId:Ljava/lang/String;

    .line 79
    iput-object p3, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mOutputStream:Ljava/io/OutputStream;

    .line 80
    iput-object p4, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mDecompressedCounter:Lcom/facebook/stetho/inspector/network/CountingOutputStream;

    .line 81
    iput-object p5, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mNetworkPeerManager:Lcom/facebook/stetho/inspector/helper/ChromePeerManager;

    .line 82
    iput-object p6, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mResponseHandler:Lcom/facebook/stetho/inspector/network/ResponseHandler;

    .line 83
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mClosed:Z

    .line 84
    return-void
.end method

.method private declared-synchronized checkEOF(I)I
    .registers 3
    .param p1, "n"    # I

    .prologue
    .line 87
    monitor-enter p0

    const/4 v0, -0x1

    if-ne p1, v0, :cond_f

    .line 88
    :try_start_4
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->closeOutputStreamQuietly()V

    .line 89
    iget-object v0, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mResponseHandler:Lcom/facebook/stetho/inspector/network/ResponseHandler;

    invoke-interface {v0}, Lcom/facebook/stetho/inspector/network/ResponseHandler;->onEOF()V

    .line 90
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mEofSeen:Z
    :try_end_f
    .catchall {:try_start_4 .. :try_end_f} :catchall_11

    .line 92
    :cond_f
    monitor-exit p0

    return p1

    .line 87
    :catchall_11
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private declared-synchronized closeOutputStreamQuietly()V
    .registers 7

    .prologue
    .line 198
    monitor-enter p0

    :try_start_1
    iget-boolean v1, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mClosed:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_33

    if-nez v1, :cond_10

    .line 200
    :try_start_5
    iget-object v1, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mOutputStream:Ljava/io/OutputStream;

    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    .line 201
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->reportDecodedSizeIfApplicable()V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_d} :catch_12
    .catchall {:try_start_5 .. :try_end_d} :catchall_36

    .line 209
    const/4 v1, 0x1

    :try_start_e
    iput-boolean v1, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mClosed:Z
    :try_end_10
    .catchall {:try_start_e .. :try_end_10} :catchall_33

    .line 212
    :cond_10
    :goto_10
    monitor-exit p0

    return-void

    .line 202
    :catch_12
    move-exception v0

    .line 203
    .local v0, "e":Ljava/io/IOException;
    :try_start_13
    iget-object v1, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mNetworkPeerManager:Lcom/facebook/stetho/inspector/helper/ChromePeerManager;

    sget-object v2, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageLevel;->ERROR:Lcom/facebook/stetho/inspector/protocol/module/Console$MessageLevel;

    sget-object v3, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;->NETWORK:Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Could not close the output stream"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v2, v3, v4}, Lcom/facebook/stetho/inspector/console/CLog;->writeToConsole(Lcom/facebook/stetho/inspector/helper/ChromePeerManager;Lcom/facebook/stetho/inspector/protocol/module/Console$MessageLevel;Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;Ljava/lang/String;)V
    :try_end_2f
    .catchall {:try_start_13 .. :try_end_2f} :catchall_36

    .line 209
    const/4 v1, 0x1

    :try_start_30
    iput-boolean v1, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mClosed:Z
    :try_end_32
    .catchall {:try_start_30 .. :try_end_32} :catchall_33

    goto :goto_10

    .line 198
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_33
    move-exception v1

    monitor-exit p0

    throw v1

    .line 209
    :catchall_36
    move-exception v1

    const/4 v2, 0x1

    :try_start_38
    iput-boolean v2, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mClosed:Z

    throw v1
    :try_end_3b
    .catchall {:try_start_38 .. :try_end_3b} :catchall_33
.end method

.method private getSkipBufferLocked()[B
    .registers 2
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .prologue
    .line 146
    iget-object v0, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mSkipBuffer:[B

    if-nez v0, :cond_a

    .line 147
    const/16 v0, 0x400

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mSkipBuffer:[B

    .line 150
    :cond_a
    iget-object v0, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mSkipBuffer:[B

    return-object v0
.end method

.method private handleIOException(Ljava/io/IOException;)Ljava/io/IOException;
    .registers 3
    .param p1, "ex"    # Ljava/io/IOException;

    .prologue
    .line 221
    iget-object v0, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mResponseHandler:Lcom/facebook/stetho/inspector/network/ResponseHandler;

    invoke-interface {v0, p1}, Lcom/facebook/stetho/inspector/network/ResponseHandler;->onError(Ljava/io/IOException;)V

    .line 222
    return-object p1
.end method

.method private handleIOExceptionWritingToStream(Ljava/io/IOException;)V
    .registers 7
    .param p1, "e"    # Ljava/io/IOException;

    .prologue
    .line 269
    iget-object v0, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mNetworkPeerManager:Lcom/facebook/stetho/inspector/helper/ChromePeerManager;

    sget-object v1, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageLevel;->ERROR:Lcom/facebook/stetho/inspector/protocol/module/Console$MessageLevel;

    sget-object v2, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;->NETWORK:Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Could not write response body to the stream "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lcom/facebook/stetho/inspector/console/CLog;->writeToConsole(Lcom/facebook/stetho/inspector/helper/ChromePeerManager;Lcom/facebook/stetho/inspector/protocol/module/Console$MessageLevel;Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;Ljava/lang/String;)V

    .line 275
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->closeOutputStreamQuietly()V

    .line 276
    return-void
.end method

.method private reportDecodedSizeIfApplicable()V
    .registers 6

    .prologue
    .line 226
    iget-object v3, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mDecompressedCounter:Lcom/facebook/stetho/inspector/network/CountingOutputStream;

    if-eqz v3, :cond_16

    .line 227
    iget-object v3, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mDecompressedCounter:Lcom/facebook/stetho/inspector/network/CountingOutputStream;

    invoke-virtual {v3}, Lcom/facebook/stetho/inspector/network/CountingOutputStream;->getCount()J

    move-result-wide v0

    .line 228
    .local v0, "currentCount":J
    iget-wide v3, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mLastDecompressedCount:J

    sub-long v3, v0, v3

    long-to-int v2, v3

    .line 229
    .local v2, "delta":I
    iget-object v3, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mResponseHandler:Lcom/facebook/stetho/inspector/network/ResponseHandler;

    invoke-interface {v3, v2}, Lcom/facebook/stetho/inspector/network/ResponseHandler;->onReadDecoded(I)V

    .line 230
    iput-wide v0, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mLastDecompressedCount:J

    .line 232
    .end local v0    # "currentCount":J
    .end local v2    # "delta":I
    :cond_16
    return-void
.end method

.method private declared-synchronized writeToOutputStream(I)V
    .registers 4
    .param p1, "oneByte"    # I

    .prologue
    .line 240
    monitor-enter p0

    :try_start_1
    iget-boolean v1, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mClosed:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_15

    if-eqz v1, :cond_7

    .line 250
    :goto_5
    monitor-exit p0

    return-void

    .line 245
    :cond_7
    :try_start_7
    iget-object v1, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mOutputStream:Ljava/io/OutputStream;

    invoke-virtual {v1, p1}, Ljava/io/OutputStream;->write(I)V

    .line 246
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->reportDecodedSizeIfApplicable()V
    :try_end_f
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_f} :catch_10
    .catchall {:try_start_7 .. :try_end_f} :catchall_15

    goto :goto_5

    .line 247
    :catch_10
    move-exception v0

    .line 248
    .local v0, "e":Ljava/io/IOException;
    :try_start_11
    invoke-direct {p0, v0}, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->handleIOExceptionWritingToStream(Ljava/io/IOException;)V
    :try_end_14
    .catchall {:try_start_11 .. :try_end_14} :catchall_15

    goto :goto_5

    .line 240
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_15
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method private declared-synchronized writeToOutputStream([BII)V
    .registers 6
    .param p1, "b"    # [B
    .param p2, "offset"    # I
    .param p3, "count"    # I

    .prologue
    .line 256
    monitor-enter p0

    :try_start_1
    iget-boolean v1, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mClosed:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_15

    if-eqz v1, :cond_7

    .line 266
    :goto_5
    monitor-exit p0

    return-void

    .line 261
    :cond_7
    :try_start_7
    iget-object v1, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mOutputStream:Ljava/io/OutputStream;

    invoke-virtual {v1, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V

    .line 262
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->reportDecodedSizeIfApplicable()V
    :try_end_f
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_f} :catch_10
    .catchall {:try_start_7 .. :try_end_f} :catchall_15

    goto :goto_5

    .line 263
    :catch_10
    move-exception v0

    .line 264
    .local v0, "e":Ljava/io/IOException;
    :try_start_11
    invoke-direct {p0, v0}, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->handleIOExceptionWritingToStream(Ljava/io/IOException;)V
    :try_end_14
    .catchall {:try_start_11 .. :try_end_14} :catchall_15

    goto :goto_5

    .line 256
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_15
    move-exception v1

    monitor-exit p0

    throw v1
.end method


# virtual methods
.method public close()V
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 172
    const-wide/16 v1, 0x0

    .line 173
    .local v1, "bytesRead":J
    :try_start_2
    iget-boolean v4, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mEofSeen:Z

    if-nez v4, :cond_14

    .line 174
    const/16 v4, 0x400

    new-array v0, v4, [B

    .line 176
    .local v0, "buffer":[B
    :goto_a
    invoke-virtual {p0, v0}, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->read([B)I

    move-result v3

    .local v3, "count":I
    const/4 v4, -0x1

    if-eq v3, v4, :cond_14

    .line 177
    int-to-long v4, v3

    add-long/2addr v1, v4

    goto :goto_a

    .line 180
    .end local v0    # "buffer":[B
    .end local v3    # "count":I
    :cond_14
    const-wide/16 v4, 0x0

    cmp-long v4, v1, v4

    if-lez v4, :cond_4c

    .line 181
    iget-object v4, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mNetworkPeerManager:Lcom/facebook/stetho/inspector/helper/ChromePeerManager;

    sget-object v5, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageLevel;->ERROR:Lcom/facebook/stetho/inspector/protocol/module/Console$MessageLevel;

    sget-object v6, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;->NETWORK:Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "There were "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 185
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " bytes that were not consumed while "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "processing request "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mRequestId:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 181
    invoke-static {v4, v5, v6, v7}, Lcom/facebook/stetho/inspector/console/CLog;->writeToConsole(Lcom/facebook/stetho/inspector/helper/ChromePeerManager;Lcom/facebook/stetho/inspector/protocol/module/Console$MessageLevel;Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;Ljava/lang/String;)V
    :try_end_4c
    .catchall {:try_start_2 .. :try_end_4c} :catchall_53

    .line 189
    :cond_4c
    invoke-super {p0}, Ljava/io/FilterInputStream;->close()V

    .line 190
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->closeOutputStreamQuietly()V

    .line 192
    return-void

    .line 189
    :catchall_53
    move-exception v4

    invoke-super {p0}, Ljava/io/FilterInputStream;->close()V

    .line 190
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->closeOutputStreamQuietly()V

    throw v4
.end method

.method public mark(I)V
    .registers 2
    .param p1, "readlimit"    # I

    .prologue
    .line 162
    return-void
.end method

.method public markSupported()Z
    .registers 2

    .prologue
    .line 156
    const/4 v0, 0x0

    return v0
.end method

.method public read()I
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 98
    :try_start_0
    iget-object v2, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v2}, Ljava/io/InputStream;->read()I

    move-result v2

    invoke-direct {p0, v2}, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->checkEOF(I)I

    move-result v1

    .line 99
    .local v1, "result":I
    const/4 v2, -0x1

    if-eq v1, v2, :cond_16

    .line 100
    iget-object v2, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mResponseHandler:Lcom/facebook/stetho/inspector/network/ResponseHandler;

    const/4 v3, 0x1

    invoke-interface {v2, v3}, Lcom/facebook/stetho/inspector/network/ResponseHandler;->onRead(I)V

    .line 101
    invoke-direct {p0, v1}, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->writeToOutputStream(I)V
    :try_end_16
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_16} :catch_17

    .line 103
    :cond_16
    return v1

    .line 104
    .end local v1    # "result":I
    :catch_17
    move-exception v0

    .line 105
    .local v0, "ex":Ljava/io/IOException;
    invoke-direct {p0, v0}, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->handleIOException(Ljava/io/IOException;)Ljava/io/IOException;

    move-result-object v2

    throw v2
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
    .line 111
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->read([BII)I

    move-result v0

    return v0
.end method

.method public read([BII)I
    .registers 7
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 117
    :try_start_0
    iget-object v2, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v2, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v2

    invoke-direct {p0, v2}, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->checkEOF(I)I

    move-result v1

    .line 118
    .local v1, "result":I
    const/4 v2, -0x1

    if-eq v1, v2, :cond_15

    .line 119
    iget-object v2, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mResponseHandler:Lcom/facebook/stetho/inspector/network/ResponseHandler;

    invoke-interface {v2, v1}, Lcom/facebook/stetho/inspector/network/ResponseHandler;->onRead(I)V

    .line 120
    invoke-direct {p0, p1, p2, v1}, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->writeToOutputStream([BII)V
    :try_end_15
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_15} :catch_16

    .line 122
    :cond_15
    return v1

    .line 123
    .end local v1    # "result":I
    :catch_16
    move-exception v0

    .line 124
    .local v0, "ex":Ljava/io/IOException;
    invoke-direct {p0, v0}, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->handleIOException(Ljava/io/IOException;)Ljava/io/IOException;

    move-result-object v2

    throw v2
.end method

.method public reset()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 166
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Mark not supported"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public declared-synchronized skip(J)J
    .registers 12
    .param p1, "n"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 130
    monitor-enter p0

    :try_start_1
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->getSkipBufferLocked()[B

    move-result-object v0

    .line 131
    .local v0, "buffer":[B
    const-wide/16 v5, 0x0

    .line 132
    .local v5, "total":J
    :goto_7
    cmp-long v7, v5, p1

    if-gez v7, :cond_1c

    .line 133
    sub-long v1, p1, v5

    .line 134
    .local v1, "bytesDiff":J
    array-length v7, v0

    int-to-long v7, v7

    invoke-static {v7, v8, v1, v2}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v7

    long-to-int v3, v7

    .line 135
    .local v3, "bytesToRead":I
    const/4 v7, 0x0

    invoke-virtual {p0, v0, v7, v3}, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->read([BII)I
    :try_end_18
    .catchall {:try_start_1 .. :try_end_18} :catchall_21

    move-result v4

    .line 136
    .local v4, "result":I
    const/4 v7, -0x1

    if-ne v4, v7, :cond_1e

    .line 141
    .end local v1    # "bytesDiff":J
    .end local v3    # "bytesToRead":I
    .end local v4    # "result":I
    :cond_1c
    monitor-exit p0

    return-wide v5

    .line 139
    .restart local v1    # "bytesDiff":J
    .restart local v3    # "bytesToRead":I
    .restart local v4    # "result":I
    :cond_1e
    int-to-long v7, v4

    add-long/2addr v5, v7

    .line 140
    goto :goto_7

    .line 130
    .end local v0    # "buffer":[B
    .end local v1    # "bytesDiff":J
    .end local v3    # "bytesToRead":I
    .end local v4    # "result":I
    .end local v5    # "total":J
    :catchall_21
    move-exception v7

    monitor-exit p0

    throw v7
.end method
