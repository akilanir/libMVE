.class public Lcom/facebook/stetho/server/LocalSocketServer;
.super Ljava/lang/Object;
.source "LocalSocketServer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/stetho/server/LocalSocketServer$WorkerThread;
    }
.end annotation


# static fields
.field private static final MAX_BIND_RETRIES:I = 0x2

.field private static final TIME_BETWEEN_BIND_RETRIES_MS:I = 0x3e8

.field private static final WORKER_THREAD_NAME_PREFIX:Ljava/lang/String; = "StethoWorker"


# instance fields
.field private final mAddress:Ljava/lang/String;

.field private final mFriendlyName:Ljava/lang/String;

.field private mListenerThread:Ljava/lang/Thread;

.field private mServerSocket:Landroid/net/LocalServerSocket;

.field private final mSocketHandler:Lcom/facebook/stetho/server/SocketHandler;

.field private mStopped:Z

.field private final mThreadId:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/facebook/stetho/server/SocketHandler;)V
    .registers 5
    .param p1, "friendlyName"    # Ljava/lang/String;
    .param p2, "address"    # Ljava/lang/String;
    .param p3, "socketHandler"    # Lcom/facebook/stetho/server/SocketHandler;

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Lcom/facebook/stetho/server/LocalSocketServer;->mThreadId:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 49
    invoke-static {p1}, Lcom/facebook/stetho/common/Util;->throwIfNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/facebook/stetho/server/LocalSocketServer;->mFriendlyName:Ljava/lang/String;

    .line 50
    invoke-static {p2}, Lcom/facebook/stetho/common/Util;->throwIfNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/facebook/stetho/server/LocalSocketServer;->mAddress:Ljava/lang/String;

    .line 51
    iput-object p3, p0, Lcom/facebook/stetho/server/LocalSocketServer;->mSocketHandler:Lcom/facebook/stetho/server/SocketHandler;

    .line 52
    return-void
.end method

.method private static bindToSocket(Ljava/lang/String;)Landroid/net/LocalServerSocket;
    .registers 7
    .param p0, "address"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .prologue
    .line 135
    const/4 v2, 0x2

    .line 136
    .local v2, "retries":I
    const/4 v1, 0x0

    .local v1, "firstException":Ljava/io/IOException;
    move v3, v2

    .line 139
    .end local v2    # "retries":I
    .local v3, "retries":I
    :goto_3
    const/4 v4, 0x3

    :try_start_4
    invoke-static {v4}, Lcom/facebook/stetho/common/LogUtil;->isLoggable(I)Z

    move-result v4

    if-eqz v4, :cond_20

    .line 140
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Trying to bind to @"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/facebook/stetho/common/LogUtil;->d(Ljava/lang/String;)V

    .line 142
    :cond_20
    new-instance v4, Landroid/net/LocalServerSocket;

    invoke-direct {v4, p0}, Landroid/net/LocalServerSocket;-><init>(Ljava/lang/String;)V
    :try_end_25
    .catch Ljava/net/BindException; {:try_start_4 .. :try_end_25} :catch_26

    return-object v4

    .line 143
    :catch_26
    move-exception v0

    .line 144
    .local v0, "be":Ljava/net/BindException;
    const-string v4, "Binding error, sleep 1000 ms..."

    invoke-static {v0, v4}, Lcom/facebook/stetho/common/LogUtil;->w(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 145
    if-nez v1, :cond_2f

    .line 146
    move-object v1, v0

    .line 148
    :cond_2f
    const-wide/16 v4, 0x3e8

    invoke-static {v4, v5}, Lcom/facebook/stetho/common/Util;->sleepUninterruptibly(J)V

    .line 150
    add-int/lit8 v2, v3, -0x1

    .end local v3    # "retries":I
    .restart local v2    # "retries":I
    if-gtz v3, :cond_39

    .line 152
    throw v1

    :cond_39
    move v3, v2

    .end local v2    # "retries":I
    .restart local v3    # "retries":I
    goto :goto_3
.end method

.method private listenOnAddress(Ljava/lang/String;)V
    .registers 9
    .param p1, "address"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 78
    invoke-static {p1}, Lcom/facebook/stetho/server/LocalSocketServer;->bindToSocket(Ljava/lang/String;)Landroid/net/LocalServerSocket;

    move-result-object v5

    iput-object v5, p0, Lcom/facebook/stetho/server/LocalSocketServer;->mServerSocket:Landroid/net/LocalServerSocket;

    .line 79
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Listening on @"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/facebook/stetho/common/LogUtil;->i(Ljava/lang/String;)V

    .line 81
    :goto_1c
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v5

    if-nez v5, :cond_66

    .line 85
    :try_start_22
    iget-object v5, p0, Lcom/facebook/stetho/server/LocalSocketServer;->mServerSocket:Landroid/net/LocalServerSocket;

    invoke-virtual {v5}, Landroid/net/LocalServerSocket;->accept()Landroid/net/LocalSocket;

    move-result-object v3

    .line 88
    .local v3, "socket":Landroid/net/LocalSocket;
    new-instance v4, Lcom/facebook/stetho/server/LocalSocketServer$WorkerThread;

    iget-object v5, p0, Lcom/facebook/stetho/server/LocalSocketServer;->mSocketHandler:Lcom/facebook/stetho/server/SocketHandler;

    invoke-direct {v4, v3, v5}, Lcom/facebook/stetho/server/LocalSocketServer$WorkerThread;-><init>(Landroid/net/LocalSocket;Lcom/facebook/stetho/server/SocketHandler;)V

    .line 89
    .local v4, "t":Ljava/lang/Thread;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "StethoWorker-"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/facebook/stetho/server/LocalSocketServer;->mFriendlyName:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "-"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/facebook/stetho/server/LocalSocketServer;->mThreadId:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 92
    invoke-virtual {v6}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 89
    invoke-virtual {v4, v5}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 93
    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 94
    invoke-virtual {v4}, Ljava/lang/Thread;->start()V
    :try_end_5e
    .catch Ljava/net/SocketException; {:try_start_22 .. :try_end_5e} :catch_5f
    .catch Ljava/io/InterruptedIOException; {:try_start_22 .. :try_end_5e} :catch_83
    .catch Ljava/io/IOException; {:try_start_22 .. :try_end_5e} :catch_85

    goto :goto_1c

    .line 95
    .end local v3    # "socket":Landroid/net/LocalSocket;
    .end local v4    # "t":Ljava/lang/Thread;
    :catch_5f
    move-exception v2

    .line 97
    .local v2, "se":Ljava/net/SocketException;
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v5

    if-eqz v5, :cond_7d

    .line 109
    .end local v2    # "se":Ljava/net/SocketException;
    :cond_66
    :goto_66
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Server shutdown on @"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/facebook/stetho/common/LogUtil;->i(Ljava/lang/String;)V

    .line 110
    return-void

    .line 100
    .restart local v2    # "se":Ljava/net/SocketException;
    :cond_7d
    const-string v5, "I/O error"

    invoke-static {v2, v5}, Lcom/facebook/stetho/common/LogUtil;->w(Ljava/lang/Throwable;Ljava/lang/String;)V

    goto :goto_1c

    .line 101
    .end local v2    # "se":Ljava/net/SocketException;
    :catch_83
    move-exception v1

    .line 102
    .local v1, "ex":Ljava/io/InterruptedIOException;
    goto :goto_66

    .line 103
    .end local v1    # "ex":Ljava/io/InterruptedIOException;
    :catch_85
    move-exception v0

    .line 104
    .local v0, "e":Ljava/io/IOException;
    const-string v5, "I/O error initialising connection thread"

    invoke-static {v0, v5}, Lcom/facebook/stetho/common/LogUtil;->w(Ljava/lang/Throwable;Ljava/lang/String;)V

    goto :goto_66
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 55
    iget-object v0, p0, Lcom/facebook/stetho/server/LocalSocketServer;->mFriendlyName:Ljava/lang/String;

    return-object v0
.end method

.method public run()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 67
    monitor-enter p0

    .line 68
    :try_start_1
    iget-boolean v0, p0, Lcom/facebook/stetho/server/LocalSocketServer;->mStopped:Z

    if-eqz v0, :cond_7

    .line 69
    monitor-exit p0

    .line 75
    :goto_6
    return-void

    .line 71
    :cond_7
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/stetho/server/LocalSocketServer;->mListenerThread:Ljava/lang/Thread;

    .line 72
    monitor-exit p0
    :try_end_e
    .catchall {:try_start_1 .. :try_end_e} :catchall_14

    .line 74
    iget-object v0, p0, Lcom/facebook/stetho/server/LocalSocketServer;->mAddress:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/facebook/stetho/server/LocalSocketServer;->listenOnAddress(Ljava/lang/String;)V

    goto :goto_6

    .line 72
    :catchall_14
    move-exception v0

    :try_start_15
    monitor-exit p0
    :try_end_16
    .catchall {:try_start_15 .. :try_end_16} :catchall_14

    throw v0
.end method

.method public stop()V
    .registers 2

    .prologue
    .line 116
    monitor-enter p0

    .line 117
    const/4 v0, 0x1

    :try_start_2
    iput-boolean v0, p0, Lcom/facebook/stetho/server/LocalSocketServer;->mStopped:Z

    .line 118
    iget-object v0, p0, Lcom/facebook/stetho/server/LocalSocketServer;->mListenerThread:Ljava/lang/Thread;

    if-nez v0, :cond_a

    .line 119
    monitor-exit p0

    .line 131
    :cond_9
    :goto_9
    return-void

    .line 121
    :cond_a
    monitor-exit p0
    :try_end_b
    .catchall {:try_start_2 .. :try_end_b} :catchall_1c

    .line 123
    iget-object v0, p0, Lcom/facebook/stetho/server/LocalSocketServer;->mListenerThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 125
    :try_start_10
    iget-object v0, p0, Lcom/facebook/stetho/server/LocalSocketServer;->mServerSocket:Landroid/net/LocalServerSocket;

    if-eqz v0, :cond_9

    .line 126
    iget-object v0, p0, Lcom/facebook/stetho/server/LocalSocketServer;->mServerSocket:Landroid/net/LocalServerSocket;

    invoke-virtual {v0}, Landroid/net/LocalServerSocket;->close()V
    :try_end_19
    .catch Ljava/io/IOException; {:try_start_10 .. :try_end_19} :catch_1a

    goto :goto_9

    .line 128
    :catch_1a
    move-exception v0

    goto :goto_9

    .line 121
    :catchall_1c
    move-exception v0

    :try_start_1d
    monitor-exit p0
    :try_end_1e
    .catchall {:try_start_1d .. :try_end_1e} :catchall_1c

    throw v0
.end method
