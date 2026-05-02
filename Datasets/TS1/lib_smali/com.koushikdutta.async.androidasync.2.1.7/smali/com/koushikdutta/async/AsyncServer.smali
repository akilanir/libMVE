.class public Lcom/koushikdutta/async/AsyncServer;
.super Ljava/lang/Object;
.source "AsyncServer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/koushikdutta/async/AsyncServer$NamedThreadFactory;,
        Lcom/koushikdutta/async/AsyncServer$AsyncSelectorException;,
        Lcom/koushikdutta/async/AsyncServer$ConnectFuture;,
        Lcom/koushikdutta/async/AsyncServer$ObjectHolder;,
        Lcom/koushikdutta/async/AsyncServer$Scheduler;,
        Lcom/koushikdutta/async/AsyncServer$Scheduled;,
        Lcom/koushikdutta/async/AsyncServer$RunnableWrapper;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field public static final LOGTAG:Ljava/lang/String; = "NIO"

.field private static final QUEUE_EMPTY:J = 0x7fffffffffffffffL

.field static mInstance:Lcom/koushikdutta/async/AsyncServer;

.field static final mServers:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap",
            "<",
            "Ljava/lang/Thread;",
            "Lcom/koushikdutta/async/AsyncServer;",
            ">;"
        }
    .end annotation
.end field

.field private static synchronousWorkers:Ljava/util/concurrent/ExecutorService;


# instance fields
.field mAffinity:Ljava/lang/Thread;

.field mName:Ljava/lang/String;

.field mQueue:Ljava/util/PriorityQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/PriorityQueue",
            "<",
            "Lcom/koushikdutta/async/AsyncServer$Scheduled;",
            ">;"
        }
    .end annotation
.end field

.field private mSelector:Lcom/koushikdutta/async/SelectorWrapper;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 41
    const-class v0, Lcom/koushikdutta/async/AsyncServer;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_34

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lcom/koushikdutta/async/AsyncServer;->$assertionsDisabled:Z

    .line 85
    :try_start_b
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x8

    if-gt v0, v1, :cond_1f

    .line 86
    const-string v0, "java.net.preferIPv4Stack"

    const-string v1, "true"

    invoke-static {v0, v1}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 87
    const-string v0, "java.net.preferIPv6Addresses"

    const-string v1, "false"

    invoke-static {v0, v1}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_1f
    .catch Ljava/lang/Throwable; {:try_start_b .. :try_end_1f} :catch_36

    .line 94
    :cond_1f
    :goto_1f
    new-instance v0, Lcom/koushikdutta/async/AsyncServer;

    invoke-direct {v0}, Lcom/koushikdutta/async/AsyncServer;-><init>()V

    sput-object v0, Lcom/koushikdutta/async/AsyncServer;->mInstance:Lcom/koushikdutta/async/AsyncServer;

    .line 412
    invoke-static {}, Lcom/koushikdutta/async/AsyncServer;->newSynchronousWorkers()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/koushikdutta/async/AsyncServer;->synchronousWorkers:Ljava/util/concurrent/ExecutorService;

    .line 526
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lcom/koushikdutta/async/AsyncServer;->mServers:Ljava/util/WeakHashMap;

    return-void

    .line 41
    :cond_34
    const/4 v0, 0x0

    goto :goto_9

    .line 90
    :catch_36
    move-exception v0

    goto :goto_1f
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 107
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/koushikdutta/async/AsyncServer;-><init>(Ljava/lang/String;)V

    .line 108
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 110
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 214
    new-instance v0, Ljava/util/PriorityQueue;

    const/4 v1, 0x1

    sget-object v2, Lcom/koushikdutta/async/AsyncServer$Scheduler;->INSTANCE:Lcom/koushikdutta/async/AsyncServer$Scheduler;

    invoke-direct {v0, v1, v2}, Ljava/util/PriorityQueue;-><init>(ILjava/util/Comparator;)V

    iput-object v0, p0, Lcom/koushikdutta/async/AsyncServer;->mQueue:Ljava/util/PriorityQueue;

    .line 111
    if-nez p1, :cond_11

    .line 112
    const-string p1, "AsyncServer"

    .line 113
    :cond_11
    iput-object p1, p0, Lcom/koushikdutta/async/AsyncServer;->mName:Ljava/lang/String;

    .line 114
    return-void
.end method

.method static synthetic access$100(Lcom/koushikdutta/async/SelectorWrapper;)V
    .registers 1
    .param p0, "x0"    # Lcom/koushikdutta/async/SelectorWrapper;

    .prologue
    .line 41
    invoke-static {p0}, Lcom/koushikdutta/async/AsyncServer;->shutdownEverything(Lcom/koushikdutta/async/SelectorWrapper;)V

    return-void
.end method

.method static synthetic access$300(Lcom/koushikdutta/async/AsyncServer;)Lcom/koushikdutta/async/SelectorWrapper;
    .registers 2
    .param p0, "x0"    # Lcom/koushikdutta/async/AsyncServer;

    .prologue
    .line 41
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncServer;->mSelector:Lcom/koushikdutta/async/SelectorWrapper;

    return-object v0
.end method

.method static synthetic access$500(Lcom/koushikdutta/async/AsyncServer;Ljava/net/InetSocketAddress;Lcom/koushikdutta/async/callback/ConnectCallback;)Lcom/koushikdutta/async/AsyncServer$ConnectFuture;
    .registers 4
    .param p0, "x0"    # Lcom/koushikdutta/async/AsyncServer;
    .param p1, "x1"    # Ljava/net/InetSocketAddress;
    .param p2, "x2"    # Lcom/koushikdutta/async/callback/ConnectCallback;

    .prologue
    .line 41
    invoke-direct {p0, p1, p2}, Lcom/koushikdutta/async/AsyncServer;->connectResolvedInetSocketAddress(Ljava/net/InetSocketAddress;Lcom/koushikdutta/async/callback/ConnectCallback;)Lcom/koushikdutta/async/AsyncServer$ConnectFuture;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$600(Lcom/koushikdutta/async/AsyncServer;Lcom/koushikdutta/async/AsyncNetworkSocket;)V
    .registers 2
    .param p0, "x0"    # Lcom/koushikdutta/async/AsyncServer;
    .param p1, "x1"    # Lcom/koushikdutta/async/AsyncNetworkSocket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/nio/channels/ClosedChannelException;
        }
    .end annotation

    .prologue
    .line 41
    invoke-direct {p0, p1}, Lcom/koushikdutta/async/AsyncServer;->handleSocket(Lcom/koushikdutta/async/AsyncNetworkSocket;)V

    return-void
.end method

.method static synthetic access$700(Lcom/koushikdutta/async/AsyncServer;Lcom/koushikdutta/async/SelectorWrapper;Ljava/util/PriorityQueue;)V
    .registers 3
    .param p0, "x0"    # Lcom/koushikdutta/async/AsyncServer;
    .param p1, "x1"    # Lcom/koushikdutta/async/SelectorWrapper;
    .param p2, "x2"    # Ljava/util/PriorityQueue;

    .prologue
    .line 41
    invoke-static {p0, p1, p2}, Lcom/koushikdutta/async/AsyncServer;->run(Lcom/koushikdutta/async/AsyncServer;Lcom/koushikdutta/async/SelectorWrapper;Ljava/util/PriorityQueue;)V

    return-void
.end method

.method private addMe()Z
    .registers 5

    .prologue
    .line 529
    sget-object v2, Lcom/koushikdutta/async/AsyncServer;->mServers:Ljava/util/WeakHashMap;

    monitor-enter v2

    .line 530
    :try_start_3
    sget-object v1, Lcom/koushikdutta/async/AsyncServer;->mServers:Ljava/util/WeakHashMap;

    iget-object v3, p0, Lcom/koushikdutta/async/AsyncServer;->mAffinity:Ljava/lang/Thread;

    invoke-virtual {v1, v3}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/koushikdutta/async/AsyncServer;

    .line 531
    .local v0, "current":Lcom/koushikdutta/async/AsyncServer;
    if-eqz v0, :cond_12

    .line 533
    const/4 v1, 0x0

    monitor-exit v2

    .line 537
    :goto_11
    return v1

    .line 535
    :cond_12
    sget-object v1, Lcom/koushikdutta/async/AsyncServer;->mServers:Ljava/util/WeakHashMap;

    iget-object v3, p0, Lcom/koushikdutta/async/AsyncServer;->mAffinity:Ljava/lang/Thread;

    invoke-virtual {v1, v3, p0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 536
    monitor-exit v2

    .line 537
    const/4 v1, 0x1

    goto :goto_11

    .line 536
    .end local v0    # "current":Lcom/koushikdutta/async/AsyncServer;
    :catchall_1c
    move-exception v1

    monitor-exit v2
    :try_end_1e
    .catchall {:try_start_3 .. :try_end_1e} :catchall_1c

    throw v1
.end method

.method private connectResolvedInetSocketAddress(Ljava/net/InetSocketAddress;Lcom/koushikdutta/async/callback/ConnectCallback;)Lcom/koushikdutta/async/AsyncServer$ConnectFuture;
    .registers 5
    .param p1, "address"    # Ljava/net/InetSocketAddress;
    .param p2, "callback"    # Lcom/koushikdutta/async/callback/ConnectCallback;

    .prologue
    .line 346
    new-instance v0, Lcom/koushikdutta/async/AsyncServer$ConnectFuture;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/koushikdutta/async/AsyncServer$ConnectFuture;-><init>(Lcom/koushikdutta/async/AsyncServer;Lcom/koushikdutta/async/AsyncServer$1;)V

    .line 347
    .local v0, "cancel":Lcom/koushikdutta/async/AsyncServer$ConnectFuture;
    sget-boolean v1, Lcom/koushikdutta/async/AsyncServer;->$assertionsDisabled:Z

    if-nez v1, :cond_16

    invoke-virtual {p1}, Ljava/net/InetSocketAddress;->isUnresolved()Z

    move-result v1

    if-eqz v1, :cond_16

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 349
    :cond_16
    new-instance v1, Lcom/koushikdutta/async/AsyncServer$6;

    invoke-direct {v1, p0, v0, p2, p1}, Lcom/koushikdutta/async/AsyncServer$6;-><init>(Lcom/koushikdutta/async/AsyncServer;Lcom/koushikdutta/async/AsyncServer$ConnectFuture;Lcom/koushikdutta/async/callback/ConnectCallback;Ljava/net/InetSocketAddress;)V

    invoke-virtual {p0, v1}, Lcom/koushikdutta/async/AsyncServer;->post(Ljava/lang/Runnable;)Ljava/lang/Object;

    .line 374
    return-object v0
.end method

.method public static getCurrentThreadServer()Lcom/koushikdutta/async/AsyncServer;
    .registers 2

    .prologue
    .line 541
    sget-object v0, Lcom/koushikdutta/async/AsyncServer;->mServers:Ljava/util/WeakHashMap;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/koushikdutta/async/AsyncServer;

    return-object v0
.end method

.method public static getDefault()Lcom/koushikdutta/async/AsyncServer;
    .registers 1

    .prologue
    .line 96
    sget-object v0, Lcom/koushikdutta/async/AsyncServer;->mInstance:Lcom/koushikdutta/async/AsyncServer;

    return-object v0
.end method

.method private handleSocket(Lcom/koushikdutta/async/AsyncNetworkSocket;)V
    .registers 5
    .param p1, "handler"    # Lcom/koushikdutta/async/AsyncNetworkSocket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/nio/channels/ClosedChannelException;
        }
    .end annotation

    .prologue
    .line 117
    invoke-virtual {p1}, Lcom/koushikdutta/async/AsyncNetworkSocket;->getChannel()Lcom/koushikdutta/async/ChannelWrapper;

    move-result-object v1

    .line 118
    .local v1, "sc":Lcom/koushikdutta/async/ChannelWrapper;
    iget-object v2, p0, Lcom/koushikdutta/async/AsyncServer;->mSelector:Lcom/koushikdutta/async/SelectorWrapper;

    invoke-virtual {v2}, Lcom/koushikdutta/async/SelectorWrapper;->getSelector()Ljava/nio/channels/Selector;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/koushikdutta/async/ChannelWrapper;->register(Ljava/nio/channels/Selector;)Ljava/nio/channels/SelectionKey;

    move-result-object v0

    .line 119
    .local v0, "ckey":Ljava/nio/channels/SelectionKey;
    invoke-virtual {v0, p1}, Ljava/nio/channels/SelectionKey;->attach(Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    invoke-virtual {p1, p0, v0}, Lcom/koushikdutta/async/AsyncNetworkSocket;->setup(Lcom/koushikdutta/async/AsyncServer;Ljava/nio/channels/SelectionKey;)V

    .line 121
    return-void
.end method

.method private static lockAndRunQueue(Lcom/koushikdutta/async/AsyncServer;Ljava/util/PriorityQueue;)J
    .registers 10
    .param p0, "server"    # Lcom/koushikdutta/async/AsyncServer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/koushikdutta/async/AsyncServer;",
            "Ljava/util/PriorityQueue",
            "<",
            "Lcom/koushikdutta/async/AsyncServer$Scheduled;",
            ">;)J"
        }
    .end annotation

    .prologue
    .line 685
    .local p1, "queue":Ljava/util/PriorityQueue;, "Ljava/util/PriorityQueue<Lcom/koushikdutta/async/AsyncServer$Scheduled;>;"
    const-wide v4, 0x7fffffffffffffffL

    .line 689
    .local v4, "wait":J
    :goto_5
    const/4 v2, 0x0

    .line 691
    .local v2, "run":Lcom/koushikdutta/async/AsyncServer$Scheduled;
    monitor-enter p0

    .line 692
    :try_start_7
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 694
    .local v0, "now":J
    invoke-virtual {p1}, Ljava/util/PriorityQueue;->size()I

    move-result v6

    if-lez v6, :cond_1e

    .line 695
    invoke-virtual {p1}, Ljava/util/PriorityQueue;->remove()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/koushikdutta/async/AsyncServer$Scheduled;

    .line 696
    .local v3, "s":Lcom/koushikdutta/async/AsyncServer$Scheduled;
    iget-wide v6, v3, Lcom/koushikdutta/async/AsyncServer$Scheduled;->time:J

    cmp-long v6, v6, v0

    if-gtz v6, :cond_22

    .line 697
    move-object v2, v3

    .line 704
    .end local v3    # "s":Lcom/koushikdutta/async/AsyncServer$Scheduled;
    :cond_1e
    :goto_1e
    monitor-exit p0

    .line 706
    if-nez v2, :cond_2d

    .line 712
    return-wide v4

    .line 700
    .restart local v3    # "s":Lcom/koushikdutta/async/AsyncServer$Scheduled;
    :cond_22
    iget-wide v6, v3, Lcom/koushikdutta/async/AsyncServer$Scheduled;->time:J

    sub-long v4, v6, v0

    .line 701
    invoke-virtual {p1, v3}, Ljava/util/PriorityQueue;->add(Ljava/lang/Object;)Z

    goto :goto_1e

    .line 704
    .end local v0    # "now":J
    .end local v3    # "s":Lcom/koushikdutta/async/AsyncServer$Scheduled;
    :catchall_2a
    move-exception v6

    monitor-exit p0
    :try_end_2c
    .catchall {:try_start_7 .. :try_end_2c} :catchall_2a

    throw v6

    .line 709
    .restart local v0    # "now":J
    :cond_2d
    iget-object v6, v2, Lcom/koushikdutta/async/AsyncServer$Scheduled;->runnable:Ljava/lang/Runnable;

    invoke-interface {v6}, Ljava/lang/Runnable;->run()V

    goto :goto_5
.end method

.method private static newSynchronousWorkers()Ljava/util/concurrent/ExecutorService;
    .registers 8

    .prologue
    .line 406
    new-instance v7, Lcom/koushikdutta/async/AsyncServer$NamedThreadFactory;

    const-string v1, "AsyncServer-worker-"

    invoke-direct {v7, v1}, Lcom/koushikdutta/async/AsyncServer$NamedThreadFactory;-><init>(Ljava/lang/String;)V

    .line 407
    .local v7, "tf":Ljava/util/concurrent/ThreadFactory;
    new-instance v0, Ljava/util/concurrent/ThreadPoolExecutor;

    const/4 v1, 0x1

    const/4 v2, 0x4

    const-wide/16 v3, 0xa

    sget-object v5, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v6, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v6}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    invoke-direct/range {v0 .. v7}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    .line 409
    .local v0, "tpe":Ljava/util/concurrent/ThreadPoolExecutor;
    return-object v0
.end method

.method public static post(Landroid/os/Handler;Ljava/lang/Runnable;)V
    .registers 5
    .param p0, "handler"    # Landroid/os/Handler;
    .param p1, "runnable"    # Ljava/lang/Runnable;

    .prologue
    .line 70
    new-instance v1, Lcom/koushikdutta/async/AsyncServer$RunnableWrapper;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/koushikdutta/async/AsyncServer$RunnableWrapper;-><init>(Lcom/koushikdutta/async/AsyncServer$1;)V

    .line 71
    .local v1, "wrapper":Lcom/koushikdutta/async/AsyncServer$RunnableWrapper;
    invoke-virtual {p0}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-virtual {v2}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-static {v2}, Lcom/koushikdutta/async/ThreadQueue;->getOrCreateThreadQueue(Ljava/lang/Thread;)Lcom/koushikdutta/async/ThreadQueue;

    move-result-object v0

    .line 72
    .local v0, "threadQueue":Lcom/koushikdutta/async/ThreadQueue;
    iput-object v0, v1, Lcom/koushikdutta/async/AsyncServer$RunnableWrapper;->threadQueue:Lcom/koushikdutta/async/ThreadQueue;

    .line 73
    iput-object p0, v1, Lcom/koushikdutta/async/AsyncServer$RunnableWrapper;->handler:Landroid/os/Handler;

    .line 74
    iput-object p1, v1, Lcom/koushikdutta/async/AsyncServer$RunnableWrapper;->runnable:Ljava/lang/Runnable;

    .line 76
    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/ThreadQueue;->add(Ljava/lang/Runnable;)Z

    .line 77
    invoke-virtual {p0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 80
    iget-object v2, v0, Lcom/koushikdutta/async/ThreadQueue;->queueSemaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v2}, Ljava/util/concurrent/Semaphore;->release()V

    .line 81
    return-void
.end method

.method private static run(Lcom/koushikdutta/async/AsyncServer;Lcom/koushikdutta/async/SelectorWrapper;Ljava/util/PriorityQueue;)V
    .registers 7
    .param p0, "server"    # Lcom/koushikdutta/async/AsyncServer;
    .param p1, "selector"    # Lcom/koushikdutta/async/SelectorWrapper;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/koushikdutta/async/AsyncServer;",
            "Lcom/koushikdutta/async/SelectorWrapper;",
            "Ljava/util/PriorityQueue",
            "<",
            "Lcom/koushikdutta/async/AsyncServer$Scheduled;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 627
    .local p2, "queue":Ljava/util/PriorityQueue;, "Ljava/util/PriorityQueue<Lcom/koushikdutta/async/AsyncServer$Scheduled;>;"
    :goto_0
    :try_start_0
    invoke-static {p0, p1, p2}, Lcom/koushikdutta/async/AsyncServer;->runLoop(Lcom/koushikdutta/async/AsyncServer;Lcom/koushikdutta/async/SelectorWrapper;Ljava/util/PriorityQueue;)V
    :try_end_3
    .catch Lcom/koushikdutta/async/AsyncServer$AsyncSelectorException; {:try_start_0 .. :try_end_3} :catch_1f

    .line 639
    :goto_3
    monitor-enter p0

    .line 640
    :try_start_4
    invoke-virtual {p1}, Lcom/koushikdutta/async/SelectorWrapper;->isOpen()Z

    move-result v1

    if-eqz v1, :cond_31

    invoke-virtual {p1}, Lcom/koushikdutta/async/SelectorWrapper;->keys()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v1

    if-gtz v1, :cond_1a

    invoke-virtual {p2}, Ljava/util/PriorityQueue;->size()I

    move-result v1

    if-lez v1, :cond_31

    .line 641
    :cond_1a
    monitor-exit p0

    goto :goto_0

    .line 650
    :catchall_1c
    move-exception v1

    monitor-exit p0
    :try_end_1e
    .catchall {:try_start_4 .. :try_end_1e} :catchall_1c

    throw v1

    .line 629
    :catch_1f
    move-exception v0

    .line 630
    .local v0, "e":Lcom/koushikdutta/async/AsyncServer$AsyncSelectorException;
    const-string v1, "NIO"

    const-string v2, "Selector exception, shutting down"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 633
    :try_start_27
    invoke-virtual {p1}, Lcom/koushikdutta/async/SelectorWrapper;->getSelector()Ljava/nio/channels/Selector;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/channels/Selector;->close()V
    :try_end_2e
    .catch Ljava/lang/Exception; {:try_start_27 .. :try_end_2e} :catch_2f

    goto :goto_3

    .line 635
    :catch_2f
    move-exception v1

    goto :goto_3

    .line 643
    .end local v0    # "e":Lcom/koushikdutta/async/AsyncServer$AsyncSelectorException;
    :cond_31
    :try_start_31
    invoke-static {p1}, Lcom/koushikdutta/async/AsyncServer;->shutdownEverything(Lcom/koushikdutta/async/SelectorWrapper;)V

    .line 644
    iget-object v1, p0, Lcom/koushikdutta/async/AsyncServer;->mSelector:Lcom/koushikdutta/async/SelectorWrapper;

    if-ne v1, p1, :cond_48

    .line 645
    new-instance v1, Ljava/util/PriorityQueue;

    const/4 v2, 0x1

    sget-object v3, Lcom/koushikdutta/async/AsyncServer$Scheduler;->INSTANCE:Lcom/koushikdutta/async/AsyncServer$Scheduler;

    invoke-direct {v1, v2, v3}, Ljava/util/PriorityQueue;-><init>(ILjava/util/Comparator;)V

    iput-object v1, p0, Lcom/koushikdutta/async/AsyncServer;->mQueue:Ljava/util/PriorityQueue;

    .line 646
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/koushikdutta/async/AsyncServer;->mSelector:Lcom/koushikdutta/async/SelectorWrapper;

    .line 647
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/koushikdutta/async/AsyncServer;->mAffinity:Ljava/lang/Thread;

    .line 649
    :cond_48
    monitor-exit p0
    :try_end_49
    .catchall {:try_start_31 .. :try_end_49} :catchall_1c

    .line 652
    sget-object v2, Lcom/koushikdutta/async/AsyncServer;->mServers:Ljava/util/WeakHashMap;

    monitor-enter v2

    .line 653
    :try_start_4c
    sget-object v1, Lcom/koushikdutta/async/AsyncServer;->mServers:Ljava/util/WeakHashMap;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 654
    monitor-exit v2

    .line 656
    return-void

    .line 654
    :catchall_57
    move-exception v1

    monitor-exit v2
    :try_end_59
    .catchall {:try_start_4c .. :try_end_59} :catchall_57

    throw v1
.end method

.method private run(Z)V
    .registers 8
    .param p1, "newThread"    # Z

    .prologue
    .line 548
    const/4 v2, 0x0

    .line 549
    .local v2, "reentrant":Z
    monitor-enter p0

    .line 550
    :try_start_2
    iget-object v4, p0, Lcom/koushikdutta/async/AsyncServer;->mSelector:Lcom/koushikdutta/async/SelectorWrapper;

    if-eqz v4, :cond_2e

    .line 551
    const-string v4, "NIO"

    const-string v5, "Reentrant call"

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 552
    sget-boolean v4, Lcom/koushikdutta/async/AsyncServer;->$assertionsDisabled:Z

    if-nez v4, :cond_22

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    iget-object v5, p0, Lcom/koushikdutta/async/AsyncServer;->mAffinity:Ljava/lang/Thread;

    if-eq v4, v5, :cond_22

    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4

    .line 595
    :catchall_1f
    move-exception v4

    monitor-exit p0
    :try_end_21
    .catchall {:try_start_2 .. :try_end_21} :catchall_1f

    throw v4

    .line 554
    :cond_22
    const/4 v2, 0x1

    .line 555
    :try_start_23
    iget-object v3, p0, Lcom/koushikdutta/async/AsyncServer;->mSelector:Lcom/koushikdutta/async/SelectorWrapper;

    .line 556
    .local v3, "selector":Lcom/koushikdutta/async/SelectorWrapper;
    iget-object v1, p0, Lcom/koushikdutta/async/AsyncServer;->mQueue:Ljava/util/PriorityQueue;

    .line 595
    .local v1, "queue":Ljava/util/PriorityQueue;, "Ljava/util/PriorityQueue<Lcom/koushikdutta/async/AsyncServer$Scheduled;>;"
    :cond_27
    monitor-exit p0
    :try_end_28
    .catchall {:try_start_23 .. :try_end_28} :catchall_1f

    .line 597
    if-eqz v2, :cond_82

    .line 599
    :try_start_2a
    invoke-static {p0, v3, v1}, Lcom/koushikdutta/async/AsyncServer;->runLoop(Lcom/koushikdutta/async/AsyncServer;Lcom/koushikdutta/async/SelectorWrapper;Ljava/util/PriorityQueue;)V
    :try_end_2d
    .catch Lcom/koushikdutta/async/AsyncServer$AsyncSelectorException; {:try_start_2a .. :try_end_2d} :catch_70

    .line 614
    .end local v1    # "queue":Ljava/util/PriorityQueue;, "Ljava/util/PriorityQueue<Lcom/koushikdutta/async/AsyncServer$Scheduled;>;"
    .end local v3    # "selector":Lcom/koushikdutta/async/SelectorWrapper;
    :goto_2d
    return-void

    .line 560
    :cond_2e
    :try_start_2e
    new-instance v3, Lcom/koushikdutta/async/SelectorWrapper;

    invoke-static {}, Ljava/nio/channels/spi/SelectorProvider;->provider()Ljava/nio/channels/spi/SelectorProvider;

    move-result-object v4

    invoke-virtual {v4}, Ljava/nio/channels/spi/SelectorProvider;->openSelector()Ljava/nio/channels/spi/AbstractSelector;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/koushikdutta/async/SelectorWrapper;-><init>(Ljava/nio/channels/Selector;)V

    iput-object v3, p0, Lcom/koushikdutta/async/AsyncServer;->mSelector:Lcom/koushikdutta/async/SelectorWrapper;

    .line 561
    .restart local v3    # "selector":Lcom/koushikdutta/async/SelectorWrapper;
    iget-object v1, p0, Lcom/koushikdutta/async/AsyncServer;->mQueue:Ljava/util/PriorityQueue;
    :try_end_3f
    .catch Ljava/io/IOException; {:try_start_2e .. :try_end_3f} :catch_5d
    .catchall {:try_start_2e .. :try_end_3f} :catchall_1f

    .line 566
    .restart local v1    # "queue":Ljava/util/PriorityQueue;, "Ljava/util/PriorityQueue<Lcom/koushikdutta/async/AsyncServer$Scheduled;>;"
    if-eqz p1, :cond_60

    .line 567
    :try_start_41
    new-instance v4, Lcom/koushikdutta/async/AsyncServer$13;

    iget-object v5, p0, Lcom/koushikdutta/async/AsyncServer;->mName:Ljava/lang/String;

    invoke-direct {v4, p0, v5, v3, v1}, Lcom/koushikdutta/async/AsyncServer$13;-><init>(Lcom/koushikdutta/async/AsyncServer;Ljava/lang/String;Lcom/koushikdutta/async/SelectorWrapper;Ljava/util/PriorityQueue;)V

    iput-object v4, p0, Lcom/koushikdutta/async/AsyncServer;->mAffinity:Ljava/lang/Thread;

    .line 576
    :goto_4a
    invoke-direct {p0}, Lcom/koushikdutta/async/AsyncServer;->addMe()Z
    :try_end_4d
    .catchall {:try_start_41 .. :try_end_4d} :catchall_1f

    move-result v4

    if-nez v4, :cond_67

    .line 578
    :try_start_50
    iget-object v4, p0, Lcom/koushikdutta/async/AsyncServer;->mSelector:Lcom/koushikdutta/async/SelectorWrapper;

    invoke-virtual {v4}, Lcom/koushikdutta/async/SelectorWrapper;->close()V
    :try_end_55
    .catch Ljava/lang/Exception; {:try_start_50 .. :try_end_55} :catch_86
    .catchall {:try_start_50 .. :try_end_55} :catchall_1f

    .line 582
    :goto_55
    const/4 v4, 0x0

    :try_start_56
    iput-object v4, p0, Lcom/koushikdutta/async/AsyncServer;->mSelector:Lcom/koushikdutta/async/SelectorWrapper;

    .line 583
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/koushikdutta/async/AsyncServer;->mAffinity:Ljava/lang/Thread;

    .line 584
    monitor-exit p0

    goto :goto_2d

    .line 563
    .end local v1    # "queue":Ljava/util/PriorityQueue;, "Ljava/util/PriorityQueue<Lcom/koushikdutta/async/AsyncServer$Scheduled;>;"
    .end local v3    # "selector":Lcom/koushikdutta/async/SelectorWrapper;
    :catch_5d
    move-exception v0

    .line 564
    .local v0, "e":Ljava/io/IOException;
    monitor-exit p0

    goto :goto_2d

    .line 574
    .end local v0    # "e":Ljava/io/IOException;
    .restart local v1    # "queue":Ljava/util/PriorityQueue;, "Ljava/util/PriorityQueue<Lcom/koushikdutta/async/AsyncServer$Scheduled;>;"
    .restart local v3    # "selector":Lcom/koushikdutta/async/SelectorWrapper;
    :cond_60
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    iput-object v4, p0, Lcom/koushikdutta/async/AsyncServer;->mAffinity:Ljava/lang/Thread;

    goto :goto_4a

    .line 586
    :cond_67
    if-eqz p1, :cond_27

    .line 587
    iget-object v4, p0, Lcom/koushikdutta/async/AsyncServer;->mAffinity:Ljava/lang/Thread;

    invoke-virtual {v4}, Ljava/lang/Thread;->start()V

    .line 589
    monitor-exit p0
    :try_end_6f
    .catchall {:try_start_56 .. :try_end_6f} :catchall_1f

    goto :goto_2d

    .line 601
    :catch_70
    move-exception v0

    .line 602
    .local v0, "e":Lcom/koushikdutta/async/AsyncServer$AsyncSelectorException;
    const-string v4, "NIO"

    const-string v5, "Selector closed"

    invoke-static {v4, v5, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 605
    :try_start_78
    invoke-virtual {v3}, Lcom/koushikdutta/async/SelectorWrapper;->getSelector()Ljava/nio/channels/Selector;

    move-result-object v4

    invoke-virtual {v4}, Ljava/nio/channels/Selector;->close()V
    :try_end_7f
    .catch Ljava/lang/Exception; {:try_start_78 .. :try_end_7f} :catch_80

    goto :goto_2d

    .line 607
    :catch_80
    move-exception v4

    goto :goto_2d

    .line 613
    .end local v0    # "e":Lcom/koushikdutta/async/AsyncServer$AsyncSelectorException;
    :cond_82
    invoke-static {p0, v3, v1}, Lcom/koushikdutta/async/AsyncServer;->run(Lcom/koushikdutta/async/AsyncServer;Lcom/koushikdutta/async/SelectorWrapper;Ljava/util/PriorityQueue;)V

    goto :goto_2d

    .line 580
    :catch_86
    move-exception v4

    goto :goto_55
.end method

.method private static runLoop(Lcom/koushikdutta/async/AsyncServer;Lcom/koushikdutta/async/SelectorWrapper;Ljava/util/PriorityQueue;)V
    .registers 25
    .param p0, "server"    # Lcom/koushikdutta/async/AsyncServer;
    .param p1, "selector"    # Lcom/koushikdutta/async/SelectorWrapper;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/koushikdutta/async/AsyncServer;",
            "Lcom/koushikdutta/async/SelectorWrapper;",
            "Ljava/util/PriorityQueue",
            "<",
            "Lcom/koushikdutta/async/AsyncServer$Scheduled;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/koushikdutta/async/AsyncServer$AsyncSelectorException;
        }
    .end annotation

    .prologue
    .line 723
    .local p2, "queue":Ljava/util/PriorityQueue;, "Ljava/util/PriorityQueue<Lcom/koushikdutta/async/AsyncServer$Scheduled;>;"
    const/4 v10, 0x1

    .line 726
    .local v10, "needsSelect":Z
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-static {v0, v1}, Lcom/koushikdutta/async/AsyncServer;->lockAndRunQueue(Lcom/koushikdutta/async/AsyncServer;Ljava/util/PriorityQueue;)J

    move-result-wide v18

    .line 728
    .local v18, "wait":J
    :try_start_9
    monitor-enter p0
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_a} :catch_b5

    .line 731
    :try_start_a
    invoke-virtual/range {p1 .. p1}, Lcom/koushikdutta/async/SelectorWrapper;->selectNow()I

    move-result v14

    .line 732
    .local v14, "readyNow":I
    if-nez v14, :cond_25

    .line 735
    invoke-virtual/range {p1 .. p1}, Lcom/koushikdutta/async/SelectorWrapper;->keys()Ljava/util/Set;

    move-result-object v20

    invoke-interface/range {v20 .. v20}, Ljava/util/Set;->size()I

    move-result v20

    if-nez v20, :cond_26

    const-wide v20, 0x7fffffffffffffffL

    cmp-long v20, v18, v20

    if-nez v20, :cond_26

    .line 737
    monitor-exit p0

    .line 832
    :goto_24
    return-void

    .line 741
    :cond_25
    const/4 v10, 0x0

    .line 743
    :cond_26
    monitor-exit p0
    :try_end_27
    .catchall {:try_start_a .. :try_end_27} :catchall_b2

    .line 745
    if-eqz v10, :cond_35

    .line 746
    const-wide v20, 0x7fffffffffffffffL

    cmp-long v20, v18, v20

    if-nez v20, :cond_be

    .line 748
    :try_start_32
    invoke-virtual/range {p1 .. p1}, Lcom/koushikdutta/async/SelectorWrapper;->select()V
    :try_end_35
    .catch Ljava/lang/Exception; {:try_start_32 .. :try_end_35} :catch_b5

    .line 761
    :cond_35
    :goto_35
    invoke-virtual/range {p1 .. p1}, Lcom/koushikdutta/async/SelectorWrapper;->selectedKeys()Ljava/util/Set;

    move-result-object v13

    .line 762
    .local v13, "readyKeys":Ljava/util/Set;, "Ljava/util/Set<Ljava/nio/channels/SelectionKey;>;"
    invoke-interface {v13}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, "i$":Ljava/util/Iterator;
    :cond_3d
    :goto_3d
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v20

    if-eqz v20, :cond_17e

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/nio/channels/SelectionKey;

    .line 764
    .local v9, "key":Ljava/nio/channels/SelectionKey;
    :try_start_49
    invoke-virtual {v9}, Ljava/nio/channels/SelectionKey;->isAcceptable()Z

    move-result v20

    if-eqz v20, :cond_c7

    .line 765
    invoke-virtual {v9}, Ljava/nio/channels/SelectionKey;->channel()Ljava/nio/channels/SelectableChannel;

    move-result-object v12

    check-cast v12, Ljava/nio/channels/ServerSocketChannel;
    :try_end_55
    .catch Ljava/nio/channels/CancelledKeyException; {:try_start_49 .. :try_end_55} :catch_b0

    .line 766
    .local v12, "nextReady":Ljava/nio/channels/ServerSocketChannel;
    const/4 v15, 0x0

    .line 767
    .local v15, "sc":Ljava/nio/channels/SocketChannel;
    const/4 v4, 0x0

    .line 769
    .local v4, "ckey":Ljava/nio/channels/SelectionKey;
    :try_start_57
    invoke-virtual {v12}, Ljava/nio/channels/ServerSocketChannel;->accept()Ljava/nio/channels/SocketChannel;

    move-result-object v15

    .line 770
    if-eqz v15, :cond_3d

    .line 772
    const/16 v20, 0x0

    move/from16 v0, v20

    invoke-virtual {v15, v0}, Ljava/nio/channels/SocketChannel;->configureBlocking(Z)Ljava/nio/channels/SelectableChannel;

    .line 773
    invoke-virtual/range {p1 .. p1}, Lcom/koushikdutta/async/SelectorWrapper;->getSelector()Ljava/nio/channels/Selector;

    move-result-object v20

    const/16 v21, 0x1

    move-object/from16 v0, v20

    move/from16 v1, v21

    invoke-virtual {v15, v0, v1}, Ljava/nio/channels/SocketChannel;->register(Ljava/nio/channels/Selector;I)Ljava/nio/channels/SelectionKey;

    move-result-object v4

    .line 774
    invoke-virtual {v9}, Ljava/nio/channels/SelectionKey;->attachment()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/koushikdutta/async/callback/ListenCallback;

    .line 775
    .local v16, "serverHandler":Lcom/koushikdutta/async/callback/ListenCallback;
    new-instance v7, Lcom/koushikdutta/async/AsyncNetworkSocket;

    invoke-direct {v7}, Lcom/koushikdutta/async/AsyncNetworkSocket;-><init>()V

    .line 776
    .local v7, "handler":Lcom/koushikdutta/async/AsyncNetworkSocket;
    invoke-virtual {v15}, Ljava/nio/channels/SocketChannel;->socket()Ljava/net/Socket;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/net/Socket;->getRemoteSocketAddress()Ljava/net/SocketAddress;

    move-result-object v20

    check-cast v20, Ljava/net/InetSocketAddress;

    move-object/from16 v0, v20

    invoke-virtual {v7, v15, v0}, Lcom/koushikdutta/async/AsyncNetworkSocket;->attach(Ljava/nio/channels/SocketChannel;Ljava/net/InetSocketAddress;)V

    .line 777
    move-object/from16 v0, p0

    invoke-virtual {v7, v0, v4}, Lcom/koushikdutta/async/AsyncNetworkSocket;->setup(Lcom/koushikdutta/async/AsyncServer;Ljava/nio/channels/SelectionKey;)V

    .line 778
    invoke-virtual {v4, v7}, Ljava/nio/channels/SelectionKey;->attach(Ljava/lang/Object;)Ljava/lang/Object;

    .line 779
    move-object/from16 v0, v16

    invoke-interface {v0, v7}, Lcom/koushikdutta/async/callback/ListenCallback;->onAccepted(Lcom/koushikdutta/async/AsyncSocket;)V
    :try_end_99
    .catch Ljava/io/IOException; {:try_start_57 .. :try_end_99} :catch_9a
    .catch Ljava/nio/channels/CancelledKeyException; {:try_start_57 .. :try_end_99} :catch_b0

    goto :goto_3d

    .line 781
    .end local v7    # "handler":Lcom/koushikdutta/async/AsyncNetworkSocket;
    .end local v16    # "serverHandler":Lcom/koushikdutta/async/callback/ListenCallback;
    :catch_9a
    move-exception v5

    .line 782
    .local v5, "e":Ljava/io/IOException;
    const/16 v20, 0x1

    :try_start_9d
    move/from16 v0, v20

    new-array v0, v0, [Ljava/io/Closeable;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    aput-object v15, v20, v21

    invoke-static/range {v20 .. v20}, Lcom/koushikdutta/async/util/StreamUtility;->closeQuietly([Ljava/io/Closeable;)V

    .line 783
    if-eqz v4, :cond_3d

    .line 784
    invoke-virtual {v4}, Ljava/nio/channels/SelectionKey;->cancel()V
    :try_end_af
    .catch Ljava/nio/channels/CancelledKeyException; {:try_start_9d .. :try_end_af} :catch_b0

    goto :goto_3d

    .line 828
    .end local v4    # "ckey":Ljava/nio/channels/SelectionKey;
    .end local v5    # "e":Ljava/io/IOException;
    .end local v12    # "nextReady":Ljava/nio/channels/ServerSocketChannel;
    .end local v15    # "sc":Ljava/nio/channels/SocketChannel;
    :catch_b0
    move-exception v20

    goto :goto_3d

    .line 743
    .end local v8    # "i$":Ljava/util/Iterator;
    .end local v9    # "key":Ljava/nio/channels/SelectionKey;
    .end local v13    # "readyKeys":Ljava/util/Set;, "Ljava/util/Set<Ljava/nio/channels/SelectionKey;>;"
    .end local v14    # "readyNow":I
    :catchall_b2
    move-exception v20

    :try_start_b3
    monitor-exit p0
    :try_end_b4
    .catchall {:try_start_b3 .. :try_end_b4} :catchall_b2

    :try_start_b4
    throw v20
    :try_end_b5
    .catch Ljava/lang/Exception; {:try_start_b4 .. :try_end_b5} :catch_b5

    .line 756
    :catch_b5
    move-exception v5

    .line 757
    .local v5, "e":Ljava/lang/Exception;
    new-instance v20, Lcom/koushikdutta/async/AsyncServer$AsyncSelectorException;

    move-object/from16 v0, v20

    invoke-direct {v0, v5}, Lcom/koushikdutta/async/AsyncServer$AsyncSelectorException;-><init>(Ljava/lang/Exception;)V

    throw v20

    .line 752
    .end local v5    # "e":Ljava/lang/Exception;
    .restart local v14    # "readyNow":I
    :cond_be
    :try_start_be
    move-object/from16 v0, p1

    move-wide/from16 v1, v18

    invoke-virtual {v0, v1, v2}, Lcom/koushikdutta/async/SelectorWrapper;->select(J)V
    :try_end_c5
    .catch Ljava/lang/Exception; {:try_start_be .. :try_end_c5} :catch_b5

    goto/16 :goto_35

    .line 787
    .restart local v8    # "i$":Ljava/util/Iterator;
    .restart local v9    # "key":Ljava/nio/channels/SelectionKey;
    .restart local v13    # "readyKeys":Ljava/util/Set;, "Ljava/util/Set<Ljava/nio/channels/SelectionKey;>;"
    :cond_c7
    :try_start_c7
    invoke-virtual {v9}, Ljava/nio/channels/SelectionKey;->isReadable()Z

    move-result v20

    if-eqz v20, :cond_e0

    .line 788
    invoke-virtual {v9}, Ljava/nio/channels/SelectionKey;->attachment()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/koushikdutta/async/AsyncNetworkSocket;

    .line 789
    .restart local v7    # "handler":Lcom/koushikdutta/async/AsyncNetworkSocket;
    invoke-virtual {v7}, Lcom/koushikdutta/async/AsyncNetworkSocket;->onReadable()I

    move-result v17

    .line 790
    .local v17, "transmitted":I
    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/AsyncServer;->onDataReceived(I)V

    goto/16 :goto_3d

    .line 792
    .end local v7    # "handler":Lcom/koushikdutta/async/AsyncNetworkSocket;
    .end local v17    # "transmitted":I
    :cond_e0
    invoke-virtual {v9}, Ljava/nio/channels/SelectionKey;->isWritable()Z

    move-result v20

    if-eqz v20, :cond_f1

    .line 793
    invoke-virtual {v9}, Ljava/nio/channels/SelectionKey;->attachment()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/koushikdutta/async/AsyncNetworkSocket;

    .line 794
    .restart local v7    # "handler":Lcom/koushikdutta/async/AsyncNetworkSocket;
    invoke-virtual {v7}, Lcom/koushikdutta/async/AsyncNetworkSocket;->onDataWritable()V

    goto/16 :goto_3d

    .line 796
    .end local v7    # "handler":Lcom/koushikdutta/async/AsyncNetworkSocket;
    :cond_f1
    invoke-virtual {v9}, Ljava/nio/channels/SelectionKey;->isConnectable()Z

    move-result v20

    if-eqz v20, :cond_16f

    .line 797
    invoke-virtual {v9}, Ljava/nio/channels/SelectionKey;->attachment()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/koushikdutta/async/AsyncServer$ConnectFuture;

    .line 798
    .local v3, "cancel":Lcom/koushikdutta/async/AsyncServer$ConnectFuture;
    invoke-virtual {v9}, Ljava/nio/channels/SelectionKey;->channel()Ljava/nio/channels/SelectableChannel;

    move-result-object v15

    check-cast v15, Ljava/nio/channels/SocketChannel;

    .line 799
    .restart local v15    # "sc":Ljava/nio/channels/SocketChannel;
    const/16 v20, 0x1

    move/from16 v0, v20

    invoke-virtual {v9, v0}, Ljava/nio/channels/SelectionKey;->interestOps(I)Ljava/nio/channels/SelectionKey;
    :try_end_10a
    .catch Ljava/nio/channels/CancelledKeyException; {:try_start_c7 .. :try_end_10a} :catch_b0

    .line 802
    :try_start_10a
    invoke-virtual {v15}, Ljava/nio/channels/SocketChannel;->finishConnect()Z

    .line 803
    new-instance v11, Lcom/koushikdutta/async/AsyncNetworkSocket;

    invoke-direct {v11}, Lcom/koushikdutta/async/AsyncNetworkSocket;-><init>()V

    .line 804
    .local v11, "newHandler":Lcom/koushikdutta/async/AsyncNetworkSocket;
    move-object/from16 v0, p0

    invoke-virtual {v11, v0, v9}, Lcom/koushikdutta/async/AsyncNetworkSocket;->setup(Lcom/koushikdutta/async/AsyncServer;Ljava/nio/channels/SelectionKey;)V

    .line 805
    invoke-virtual {v15}, Ljava/nio/channels/SocketChannel;->socket()Ljava/net/Socket;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/net/Socket;->getRemoteSocketAddress()Ljava/net/SocketAddress;

    move-result-object v20

    check-cast v20, Ljava/net/InetSocketAddress;

    move-object/from16 v0, v20

    invoke-virtual {v11, v15, v0}, Lcom/koushikdutta/async/AsyncNetworkSocket;->attach(Ljava/nio/channels/SocketChannel;Ljava/net/InetSocketAddress;)V

    .line 806
    invoke-virtual {v9, v11}, Ljava/nio/channels/SelectionKey;->attach(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_129
    .catch Ljava/io/IOException; {:try_start_10a .. :try_end_129} :catch_147
    .catch Ljava/nio/channels/CancelledKeyException; {:try_start_10a .. :try_end_129} :catch_b0

    .line 816
    :try_start_129
    invoke-virtual {v3, v11}, Lcom/koushikdutta/async/AsyncServer$ConnectFuture;->setComplete(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_3d

    .line 817
    iget-object v0, v3, Lcom/koushikdutta/async/AsyncServer$ConnectFuture;->callback:Lcom/koushikdutta/async/callback/ConnectCallback;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v0, v1, v11}, Lcom/koushikdutta/async/callback/ConnectCallback;->onConnectCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/AsyncSocket;)V
    :try_end_13c
    .catch Ljava/lang/Exception; {:try_start_129 .. :try_end_13c} :catch_13e
    .catch Ljava/nio/channels/CancelledKeyException; {:try_start_129 .. :try_end_13c} :catch_b0

    goto/16 :goto_3d

    .line 819
    :catch_13e
    move-exception v5

    .line 820
    .restart local v5    # "e":Ljava/lang/Exception;
    :try_start_13f
    new-instance v20, Ljava/lang/RuntimeException;

    move-object/from16 v0, v20

    invoke-direct {v0, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v20

    .line 808
    .end local v5    # "e":Ljava/lang/Exception;
    .end local v11    # "newHandler":Lcom/koushikdutta/async/AsyncNetworkSocket;
    :catch_147
    move-exception v6

    .line 809
    .local v6, "ex":Ljava/io/IOException;
    invoke-virtual {v9}, Ljava/nio/channels/SelectionKey;->cancel()V

    .line 810
    const/16 v20, 0x1

    move/from16 v0, v20

    new-array v0, v0, [Ljava/io/Closeable;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    aput-object v15, v20, v21

    invoke-static/range {v20 .. v20}, Lcom/koushikdutta/async/util/StreamUtility;->closeQuietly([Ljava/io/Closeable;)V

    .line 811
    invoke-virtual {v3, v6}, Lcom/koushikdutta/async/AsyncServer$ConnectFuture;->setComplete(Ljava/lang/Exception;)Z

    move-result v20

    if-eqz v20, :cond_3d

    .line 812
    iget-object v0, v3, Lcom/koushikdutta/async/AsyncServer$ConnectFuture;->callback:Lcom/koushikdutta/async/callback/ConnectCallback;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v0, v6, v1}, Lcom/koushikdutta/async/callback/ConnectCallback;->onConnectCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/AsyncSocket;)V

    goto/16 :goto_3d

    .line 824
    .end local v3    # "cancel":Lcom/koushikdutta/async/AsyncServer$ConnectFuture;
    .end local v6    # "ex":Ljava/io/IOException;
    .end local v15    # "sc":Ljava/nio/channels/SocketChannel;
    :cond_16f
    const-string v20, "NIO"

    const-string v21, "wtf"

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 825
    new-instance v20, Ljava/lang/RuntimeException;

    const-string v21, "Unknown key state."

    invoke-direct/range {v20 .. v21}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v20
    :try_end_17e
    .catch Ljava/nio/channels/CancelledKeyException; {:try_start_13f .. :try_end_17e} :catch_b0

    .line 831
    .end local v9    # "key":Ljava/nio/channels/SelectionKey;
    :cond_17e
    invoke-interface {v13}, Ljava/util/Set;->clear()V

    goto/16 :goto_24
.end method

.method private static shutdownEverything(Lcom/koushikdutta/async/SelectorWrapper;)V
    .registers 2
    .param p0, "selector"    # Lcom/koushikdutta/async/SelectorWrapper;

    .prologue
    .line 674
    invoke-static {p0}, Lcom/koushikdutta/async/AsyncServer;->shutdownKeys(Lcom/koushikdutta/async/SelectorWrapper;)V

    .line 677
    :try_start_3
    invoke-virtual {p0}, Lcom/koushikdutta/async/SelectorWrapper;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_6} :catch_7

    .line 681
    :goto_6
    return-void

    .line 679
    :catch_7
    move-exception v0

    goto :goto_6
.end method

.method private static shutdownKeys(Lcom/koushikdutta/async/SelectorWrapper;)V
    .registers 6
    .param p0, "selector"    # Lcom/koushikdutta/async/SelectorWrapper;

    .prologue
    .line 660
    :try_start_0
    invoke-virtual {p0}, Lcom/koushikdutta/async/SelectorWrapper;->keys()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_28

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/nio/channels/SelectionKey;

    .line 661
    .local v1, "key":Ljava/nio/channels/SelectionKey;
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/io/Closeable;

    const/4 v3, 0x0

    invoke-virtual {v1}, Ljava/nio/channels/SelectionKey;->channel()Ljava/nio/channels/SelectableChannel;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v2}, Lcom/koushikdutta/async/util/StreamUtility;->closeQuietly([Ljava/io/Closeable;)V
    :try_end_21
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_21} :catch_27

    .line 663
    :try_start_21
    invoke-virtual {v1}, Ljava/nio/channels/SelectionKey;->cancel()V
    :try_end_24
    .catch Ljava/lang/Exception; {:try_start_21 .. :try_end_24} :catch_25

    goto :goto_8

    .line 665
    :catch_25
    move-exception v2

    goto :goto_8

    .line 669
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "key":Ljava/nio/channels/SelectionKey;
    :catch_27
    move-exception v2

    .line 671
    :cond_28
    return-void
.end method

.method private static wakeup(Lcom/koushikdutta/async/SelectorWrapper;)V
    .registers 3
    .param p0, "selector"    # Lcom/koushikdutta/async/SelectorWrapper;

    .prologue
    .line 130
    sget-object v0, Lcom/koushikdutta/async/AsyncServer;->synchronousWorkers:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/koushikdutta/async/AsyncServer$1;

    invoke-direct {v1, p0}, Lcom/koushikdutta/async/AsyncServer$1;-><init>(Lcom/koushikdutta/async/SelectorWrapper;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 141
    return-void
.end method


# virtual methods
.method public connectDatagram(Ljava/lang/String;I)Lcom/koushikdutta/async/AsyncDatagramSocket;
    .registers 9
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 452
    invoke-static {}, Ljava/nio/channels/DatagramChannel;->open()Ljava/nio/channels/DatagramChannel;

    move-result-object v5

    .line 453
    .local v5, "socket":Ljava/nio/channels/DatagramChannel;
    new-instance v4, Lcom/koushikdutta/async/AsyncDatagramSocket;

    invoke-direct {v4}, Lcom/koushikdutta/async/AsyncDatagramSocket;-><init>()V

    .line 454
    .local v4, "handler":Lcom/koushikdutta/async/AsyncDatagramSocket;
    invoke-virtual {v4, v5}, Lcom/koushikdutta/async/AsyncDatagramSocket;->attach(Ljava/nio/channels/DatagramChannel;)V

    .line 458
    new-instance v0, Lcom/koushikdutta/async/AsyncServer$10;

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    invoke-direct/range {v0 .. v5}, Lcom/koushikdutta/async/AsyncServer$10;-><init>(Lcom/koushikdutta/async/AsyncServer;Ljava/lang/String;ILcom/koushikdutta/async/AsyncDatagramSocket;Ljava/nio/channels/DatagramChannel;)V

    invoke-virtual {p0, v0}, Lcom/koushikdutta/async/AsyncServer;->run(Ljava/lang/Runnable;)V

    .line 472
    return-object v4
.end method

.method public connectDatagram(Ljava/net/SocketAddress;)Lcom/koushikdutta/async/AsyncDatagramSocket;
    .registers 5
    .param p1, "remote"    # Ljava/net/SocketAddress;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 505
    invoke-static {}, Ljava/nio/channels/DatagramChannel;->open()Ljava/nio/channels/DatagramChannel;

    move-result-object v1

    .line 506
    .local v1, "socket":Ljava/nio/channels/DatagramChannel;
    new-instance v0, Lcom/koushikdutta/async/AsyncDatagramSocket;

    invoke-direct {v0}, Lcom/koushikdutta/async/AsyncDatagramSocket;-><init>()V

    .line 507
    .local v0, "handler":Lcom/koushikdutta/async/AsyncDatagramSocket;
    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/AsyncDatagramSocket;->attach(Ljava/nio/channels/DatagramChannel;)V

    .line 511
    new-instance v2, Lcom/koushikdutta/async/AsyncServer$12;

    invoke-direct {v2, p0, v0, v1, p1}, Lcom/koushikdutta/async/AsyncServer$12;-><init>(Lcom/koushikdutta/async/AsyncServer;Lcom/koushikdutta/async/AsyncDatagramSocket;Ljava/nio/channels/DatagramChannel;Ljava/net/SocketAddress;)V

    invoke-virtual {p0, v2}, Lcom/koushikdutta/async/AsyncServer;->run(Ljava/lang/Runnable;)V

    .line 523
    return-object v0
.end method

.method public connectSocket(Ljava/lang/String;ILcom/koushikdutta/async/callback/ConnectCallback;)Lcom/koushikdutta/async/future/Cancellable;
    .registers 5
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "callback"    # Lcom/koushikdutta/async/callback/ConnectCallback;

    .prologue
    .line 402
    invoke-static {p1, p2}, Ljava/net/InetSocketAddress;->createUnresolved(Ljava/lang/String;I)Ljava/net/InetSocketAddress;

    move-result-object v0

    invoke-virtual {p0, v0, p3}, Lcom/koushikdutta/async/AsyncServer;->connectSocket(Ljava/net/InetSocketAddress;Lcom/koushikdutta/async/callback/ConnectCallback;)Lcom/koushikdutta/async/future/Cancellable;

    move-result-object v0

    return-object v0
.end method

.method public connectSocket(Ljava/net/InetSocketAddress;Lcom/koushikdutta/async/callback/ConnectCallback;)Lcom/koushikdutta/async/future/Cancellable;
    .registers 6
    .param p1, "remote"    # Ljava/net/InetSocketAddress;
    .param p2, "callback"    # Lcom/koushikdutta/async/callback/ConnectCallback;

    .prologue
    .line 378
    invoke-virtual {p1}, Ljava/net/InetSocketAddress;->isUnresolved()Z

    move-result v2

    if-nez v2, :cond_b

    .line 379
    invoke-direct {p0, p1, p2}, Lcom/koushikdutta/async/AsyncServer;->connectResolvedInetSocketAddress(Ljava/net/InetSocketAddress;Lcom/koushikdutta/async/callback/ConnectCallback;)Lcom/koushikdutta/async/AsyncServer$ConnectFuture;

    move-result-object v1

    .line 398
    :goto_a
    return-object v1

    .line 381
    :cond_b
    new-instance v1, Lcom/koushikdutta/async/future/SimpleFuture;

    invoke-direct {v1}, Lcom/koushikdutta/async/future/SimpleFuture;-><init>()V

    .line 383
    .local v1, "ret":Lcom/koushikdutta/async/future/SimpleFuture;, "Lcom/koushikdutta/async/future/SimpleFuture<Lcom/koushikdutta/async/AsyncNetworkSocket;>;"
    invoke-virtual {p1}, Ljava/net/InetSocketAddress;->getHostName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/koushikdutta/async/AsyncServer;->getByName(Ljava/lang/String;)Lcom/koushikdutta/async/future/Future;

    move-result-object v0

    .line 384
    .local v0, "lookup":Lcom/koushikdutta/async/future/Future;, "Lcom/koushikdutta/async/future/Future<Ljava/net/InetAddress;>;"
    invoke-virtual {v1, v0}, Lcom/koushikdutta/async/future/SimpleFuture;->setParent(Lcom/koushikdutta/async/future/Cancellable;)Lcom/koushikdutta/async/future/SimpleFuture;

    .line 385
    new-instance v2, Lcom/koushikdutta/async/AsyncServer$7;

    invoke-direct {v2, p0, p2, v1, p1}, Lcom/koushikdutta/async/AsyncServer$7;-><init>(Lcom/koushikdutta/async/AsyncServer;Lcom/koushikdutta/async/callback/ConnectCallback;Lcom/koushikdutta/async/future/SimpleFuture;Ljava/net/InetSocketAddress;)V

    invoke-interface {v0, v2}, Lcom/koushikdutta/async/future/Future;->setCallback(Lcom/koushikdutta/async/future/FutureCallback;)Lcom/koushikdutta/async/future/Future;

    goto :goto_a
.end method

.method public dump()V
    .registers 2

    .prologue
    .line 835
    new-instance v0, Lcom/koushikdutta/async/AsyncServer$14;

    invoke-direct {v0, p0}, Lcom/koushikdutta/async/AsyncServer$14;-><init>(Lcom/koushikdutta/async/AsyncServer;)V

    invoke-virtual {p0, v0}, Lcom/koushikdutta/async/AsyncServer;->post(Ljava/lang/Runnable;)Ljava/lang/Object;

    .line 849
    return-void
.end method

.method public getAffinity()Ljava/lang/Thread;
    .registers 2

    .prologue
    .line 852
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncServer;->mAffinity:Ljava/lang/Thread;

    return-object v0
.end method

.method public getAllByName(Ljava/lang/String;)Lcom/koushikdutta/async/future/Future;
    .registers 5
    .param p1, "host"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/koushikdutta/async/future/Future",
            "<[",
            "Ljava/net/InetAddress;",
            ">;"
        }
    .end annotation

    .prologue
    .line 414
    new-instance v0, Lcom/koushikdutta/async/future/SimpleFuture;

    invoke-direct {v0}, Lcom/koushikdutta/async/future/SimpleFuture;-><init>()V

    .line 415
    .local v0, "ret":Lcom/koushikdutta/async/future/SimpleFuture;, "Lcom/koushikdutta/async/future/SimpleFuture<[Ljava/net/InetAddress;>;"
    sget-object v1, Lcom/koushikdutta/async/AsyncServer;->synchronousWorkers:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Lcom/koushikdutta/async/AsyncServer$8;

    invoke-direct {v2, p0, p1, v0}, Lcom/koushikdutta/async/AsyncServer$8;-><init>(Lcom/koushikdutta/async/AsyncServer;Ljava/lang/String;Lcom/koushikdutta/async/future/SimpleFuture;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 438
    return-object v0
.end method

.method public getByName(Ljava/lang/String;)Lcom/koushikdutta/async/future/Future;
    .registers 4
    .param p1, "host"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/koushikdutta/async/future/Future",
            "<",
            "Ljava/net/InetAddress;",
            ">;"
        }
    .end annotation

    .prologue
    .line 442
    invoke-virtual {p0, p1}, Lcom/koushikdutta/async/AsyncServer;->getAllByName(Ljava/lang/String;)Lcom/koushikdutta/async/future/Future;

    move-result-object v0

    new-instance v1, Lcom/koushikdutta/async/AsyncServer$9;

    invoke-direct {v1, p0}, Lcom/koushikdutta/async/AsyncServer$9;-><init>(Lcom/koushikdutta/async/AsyncServer;)V

    invoke-interface {v0, v1}, Lcom/koushikdutta/async/future/Future;->then(Lcom/koushikdutta/async/future/FutureCallback;)Lcom/koushikdutta/async/future/FutureCallback;

    move-result-object v0

    check-cast v0, Lcom/koushikdutta/async/future/Future;

    return-object v0
.end method

.method public isAffinityThread()Z
    .registers 3

    .prologue
    .line 856
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncServer;->mAffinity:Ljava/lang/Thread;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    if-ne v0, v1, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public isAffinityThreadOrStopped()Z
    .registers 3

    .prologue
    .line 860
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncServer;->mAffinity:Ljava/lang/Thread;

    .line 861
    .local v0, "affinity":Ljava/lang/Thread;
    if-eqz v0, :cond_a

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    if-ne v0, v1, :cond_c

    :cond_a
    const/4 v1, 0x1

    :goto_b
    return v1

    :cond_c
    const/4 v1, 0x0

    goto :goto_b
.end method

.method public isRunning()Z
    .registers 2

    .prologue
    .line 102
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncServer;->mSelector:Lcom/koushikdutta/async/SelectorWrapper;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public listen(Ljava/net/InetAddress;ILcom/koushikdutta/async/callback/ListenCallback;)Lcom/koushikdutta/async/AsyncServerSocket;
    .registers 10
    .param p1, "host"    # Ljava/net/InetAddress;
    .param p2, "port"    # I
    .param p3, "handler"    # Lcom/koushikdutta/async/callback/ListenCallback;

    .prologue
    .line 282
    new-instance v5, Lcom/koushikdutta/async/AsyncServer$ObjectHolder;

    const/4 v0, 0x0

    invoke-direct {v5, v0}, Lcom/koushikdutta/async/AsyncServer$ObjectHolder;-><init>(Lcom/koushikdutta/async/AsyncServer$1;)V

    .line 283
    .local v5, "holder":Lcom/koushikdutta/async/AsyncServer$ObjectHolder;, "Lcom/koushikdutta/async/AsyncServer$ObjectHolder<Lcom/koushikdutta/async/AsyncServerSocket;>;"
    new-instance v0, Lcom/koushikdutta/async/AsyncServer$5;

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move-object v4, p3

    invoke-direct/range {v0 .. v5}, Lcom/koushikdutta/async/AsyncServer$5;-><init>(Lcom/koushikdutta/async/AsyncServer;Ljava/net/InetAddress;ILcom/koushikdutta/async/callback/ListenCallback;Lcom/koushikdutta/async/AsyncServer$ObjectHolder;)V

    invoke-virtual {p0, v0}, Lcom/koushikdutta/async/AsyncServer;->run(Ljava/lang/Runnable;)V

    .line 326
    iget-object v0, v5, Lcom/koushikdutta/async/AsyncServer$ObjectHolder;->held:Ljava/lang/Object;

    check-cast v0, Lcom/koushikdutta/async/AsyncServerSocket;

    return-object v0
.end method

.method protected onDataReceived(I)V
    .registers 2
    .param p1, "transmitted"    # I

    .prologue
    .line 273
    return-void
.end method

.method protected onDataSent(I)V
    .registers 2
    .param p1, "transmitted"    # I

    .prologue
    .line 276
    return-void
.end method

.method public openDatagram()Lcom/koushikdutta/async/AsyncDatagramSocket;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 476
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/koushikdutta/async/AsyncServer;->openDatagram(Ljava/net/SocketAddress;Z)Lcom/koushikdutta/async/AsyncDatagramSocket;

    move-result-object v0

    return-object v0
.end method

.method public openDatagram(Ljava/net/SocketAddress;Z)Lcom/koushikdutta/async/AsyncDatagramSocket;
    .registers 9
    .param p1, "address"    # Ljava/net/SocketAddress;
    .param p2, "reuseAddress"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 480
    invoke-static {}, Ljava/nio/channels/DatagramChannel;->open()Ljava/nio/channels/DatagramChannel;

    move-result-object v3

    .line 481
    .local v3, "socket":Ljava/nio/channels/DatagramChannel;
    new-instance v5, Lcom/koushikdutta/async/AsyncDatagramSocket;

    invoke-direct {v5}, Lcom/koushikdutta/async/AsyncDatagramSocket;-><init>()V

    .line 482
    .local v5, "handler":Lcom/koushikdutta/async/AsyncDatagramSocket;
    invoke-virtual {v5, v3}, Lcom/koushikdutta/async/AsyncDatagramSocket;->attach(Ljava/nio/channels/DatagramChannel;)V

    .line 486
    new-instance v0, Lcom/koushikdutta/async/AsyncServer$11;

    move-object v1, p0

    move v2, p2

    move-object v4, p1

    invoke-direct/range {v0 .. v5}, Lcom/koushikdutta/async/AsyncServer$11;-><init>(Lcom/koushikdutta/async/AsyncServer;ZLjava/nio/channels/DatagramChannel;Ljava/net/SocketAddress;Lcom/koushikdutta/async/AsyncDatagramSocket;)V

    invoke-virtual {p0, v0}, Lcom/koushikdutta/async/AsyncServer;->run(Ljava/lang/Runnable;)V

    .line 501
    return-object v5
.end method

.method public post(Lcom/koushikdutta/async/callback/CompletedCallback;Ljava/lang/Exception;)Ljava/lang/Object;
    .registers 4
    .param p1, "callback"    # Lcom/koushikdutta/async/callback/CompletedCallback;
    .param p2, "e"    # Ljava/lang/Exception;

    .prologue
    .line 175
    new-instance v0, Lcom/koushikdutta/async/AsyncServer$2;

    invoke-direct {v0, p0, p1, p2}, Lcom/koushikdutta/async/AsyncServer$2;-><init>(Lcom/koushikdutta/async/AsyncServer;Lcom/koushikdutta/async/callback/CompletedCallback;Ljava/lang/Exception;)V

    invoke-virtual {p0, v0}, Lcom/koushikdutta/async/AsyncServer;->post(Ljava/lang/Runnable;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public post(Ljava/lang/Runnable;)Ljava/lang/Object;
    .registers 4
    .param p1, "runnable"    # Ljava/lang/Runnable;

    .prologue
    .line 171
    const-wide/16 v0, 0x0

    invoke-virtual {p0, p1, v0, v1}, Lcom/koushikdutta/async/AsyncServer;->postDelayed(Ljava/lang/Runnable;J)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public postDelayed(Ljava/lang/Runnable;J)Ljava/lang/Object;
    .registers 9
    .param p1, "runnable"    # Ljava/lang/Runnable;
    .param p2, "delay"    # J

    .prologue
    .line 145
    monitor-enter p0

    .line 155
    const-wide/16 v3, 0x0

    cmp-long v3, p2, v3

    if-eqz v3, :cond_2c

    .line 156
    :try_start_7
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    add-long v1, v3, p2

    .line 159
    .local v1, "time":J
    :goto_d
    iget-object v3, p0, Lcom/koushikdutta/async/AsyncServer;->mQueue:Ljava/util/PriorityQueue;

    new-instance v0, Lcom/koushikdutta/async/AsyncServer$Scheduled;

    invoke-direct {v0, p1, v1, v2}, Lcom/koushikdutta/async/AsyncServer$Scheduled;-><init>(Ljava/lang/Runnable;J)V

    .local v0, "s":Lcom/koushikdutta/async/AsyncServer$Scheduled;
    invoke-virtual {v3, v0}, Ljava/util/PriorityQueue;->add(Ljava/lang/Object;)Z

    .line 161
    iget-object v3, p0, Lcom/koushikdutta/async/AsyncServer;->mSelector:Lcom/koushikdutta/async/SelectorWrapper;

    if-nez v3, :cond_1f

    .line 162
    const/4 v3, 0x1

    invoke-direct {p0, v3}, Lcom/koushikdutta/async/AsyncServer;->run(Z)V

    .line 163
    :cond_1f
    invoke-virtual {p0}, Lcom/koushikdutta/async/AsyncServer;->isAffinityThread()Z

    move-result v3

    if-nez v3, :cond_2a

    .line 164
    iget-object v3, p0, Lcom/koushikdutta/async/AsyncServer;->mSelector:Lcom/koushikdutta/async/SelectorWrapper;

    invoke-static {v3}, Lcom/koushikdutta/async/AsyncServer;->wakeup(Lcom/koushikdutta/async/SelectorWrapper;)V

    .line 166
    :cond_2a
    monitor-exit p0

    .line 167
    return-object v0

    .line 158
    .end local v0    # "s":Lcom/koushikdutta/async/AsyncServer$Scheduled;
    .end local v1    # "time":J
    :cond_2c
    iget-object v3, p0, Lcom/koushikdutta/async/AsyncServer;->mQueue:Ljava/util/PriorityQueue;

    invoke-virtual {v3}, Ljava/util/PriorityQueue;->size()I

    move-result v3

    int-to-long v1, v3

    .restart local v1    # "time":J
    goto :goto_d

    .line 166
    .end local v1    # "time":J
    :catchall_34
    move-exception v3

    monitor-exit p0
    :try_end_36
    .catchall {:try_start_7 .. :try_end_36} :catchall_34

    throw v3
.end method

.method public removeAllCallbacks(Ljava/lang/Object;)V
    .registers 3
    .param p1, "scheduled"    # Ljava/lang/Object;

    .prologue
    .line 124
    monitor-enter p0

    .line 125
    :try_start_1
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncServer;->mQueue:Ljava/util/PriorityQueue;

    invoke-virtual {v0, p1}, Ljava/util/PriorityQueue;->remove(Ljava/lang/Object;)Z

    .line 126
    monitor-exit p0

    .line 127
    return-void

    .line 126
    :catchall_8
    move-exception v0

    monitor-exit p0
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_8

    throw v0
.end method

.method public run(Ljava/lang/Runnable;)V
    .registers 6
    .param p1, "runnable"    # Ljava/lang/Runnable;

    .prologue
    .line 184
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    iget-object v3, p0, Lcom/koushikdutta/async/AsyncServer;->mAffinity:Ljava/lang/Thread;

    if-ne v2, v3, :cond_11

    .line 185
    invoke-virtual {p0, p1}, Lcom/koushikdutta/async/AsyncServer;->post(Ljava/lang/Runnable;)Ljava/lang/Object;

    .line 186
    iget-object v2, p0, Lcom/koushikdutta/async/AsyncServer;->mQueue:Ljava/util/PriorityQueue;

    invoke-static {p0, v2}, Lcom/koushikdutta/async/AsyncServer;->lockAndRunQueue(Lcom/koushikdutta/async/AsyncServer;Ljava/util/PriorityQueue;)J

    .line 204
    :goto_10
    return-void

    .line 190
    :cond_11
    new-instance v1, Ljava/util/concurrent/Semaphore;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Ljava/util/concurrent/Semaphore;-><init>(I)V

    .line 191
    .local v1, "semaphore":Ljava/util/concurrent/Semaphore;
    new-instance v2, Lcom/koushikdutta/async/AsyncServer$3;

    invoke-direct {v2, p0, p1, v1}, Lcom/koushikdutta/async/AsyncServer$3;-><init>(Lcom/koushikdutta/async/AsyncServer;Ljava/lang/Runnable;Ljava/util/concurrent/Semaphore;)V

    invoke-virtual {p0, v2}, Lcom/koushikdutta/async/AsyncServer;->post(Ljava/lang/Runnable;)Ljava/lang/Object;

    .line 199
    :try_start_1f
    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_22
    .catch Ljava/lang/InterruptedException; {:try_start_1f .. :try_end_22} :catch_23

    goto :goto_10

    .line 201
    :catch_23
    move-exception v0

    .line 202
    .local v0, "e":Ljava/lang/InterruptedException;
    const-string v2, "NIO"

    const-string v3, "run"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_10
.end method

.method public stop()V
    .registers 9

    .prologue
    .line 237
    monitor-enter p0

    .line 238
    :try_start_1
    invoke-virtual {p0}, Lcom/koushikdutta/async/AsyncServer;->isAffinityThread()Z

    move-result v1

    .line 239
    .local v1, "isAffinityThread":Z
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncServer;->mSelector:Lcom/koushikdutta/async/SelectorWrapper;

    .line 240
    .local v0, "currentSelector":Lcom/koushikdutta/async/SelectorWrapper;
    if-nez v0, :cond_b

    .line 241
    monitor-exit p0

    .line 270
    :cond_a
    :goto_a
    return-void

    .line 242
    :cond_b
    sget-object v4, Lcom/koushikdutta/async/AsyncServer;->mServers:Ljava/util/WeakHashMap;

    monitor-enter v4
    :try_end_e
    .catchall {:try_start_1 .. :try_end_e} :catchall_4f

    .line 243
    :try_start_e
    sget-object v3, Lcom/koushikdutta/async/AsyncServer;->mServers:Ljava/util/WeakHashMap;

    iget-object v5, p0, Lcom/koushikdutta/async/AsyncServer;->mAffinity:Ljava/lang/Thread;

    invoke-virtual {v3, v5}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 244
    monitor-exit v4
    :try_end_16
    .catchall {:try_start_e .. :try_end_16} :catchall_4c

    .line 245
    :try_start_16
    new-instance v2, Ljava/util/concurrent/Semaphore;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Ljava/util/concurrent/Semaphore;-><init>(I)V

    .line 248
    .local v2, "semaphore":Ljava/util/concurrent/Semaphore;
    iget-object v3, p0, Lcom/koushikdutta/async/AsyncServer;->mQueue:Ljava/util/PriorityQueue;

    new-instance v4, Lcom/koushikdutta/async/AsyncServer$Scheduled;

    new-instance v5, Lcom/koushikdutta/async/AsyncServer$4;

    invoke-direct {v5, p0, v0, v2}, Lcom/koushikdutta/async/AsyncServer$4;-><init>(Lcom/koushikdutta/async/AsyncServer;Lcom/koushikdutta/async/SelectorWrapper;Ljava/util/concurrent/Semaphore;)V

    const-wide/16 v6, 0x0

    invoke-direct {v4, v5, v6, v7}, Lcom/koushikdutta/async/AsyncServer$Scheduled;-><init>(Ljava/lang/Runnable;J)V

    invoke-virtual {v3, v4}, Ljava/util/PriorityQueue;->add(Ljava/lang/Object;)Z

    .line 255
    invoke-virtual {v0}, Lcom/koushikdutta/async/SelectorWrapper;->wakeupOnce()V

    .line 258
    invoke-static {v0}, Lcom/koushikdutta/async/AsyncServer;->shutdownKeys(Lcom/koushikdutta/async/SelectorWrapper;)V

    .line 260
    new-instance v3, Ljava/util/PriorityQueue;

    const/4 v4, 0x1

    sget-object v5, Lcom/koushikdutta/async/AsyncServer$Scheduler;->INSTANCE:Lcom/koushikdutta/async/AsyncServer$Scheduler;

    invoke-direct {v3, v4, v5}, Ljava/util/PriorityQueue;-><init>(ILjava/util/Comparator;)V

    iput-object v3, p0, Lcom/koushikdutta/async/AsyncServer;->mQueue:Ljava/util/PriorityQueue;

    .line 261
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/koushikdutta/async/AsyncServer;->mSelector:Lcom/koushikdutta/async/SelectorWrapper;

    .line 262
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/koushikdutta/async/AsyncServer;->mAffinity:Ljava/lang/Thread;

    .line 263
    monitor-exit p0
    :try_end_44
    .catchall {:try_start_16 .. :try_end_44} :catchall_4f

    .line 265
    if-nez v1, :cond_a

    .line 266
    :try_start_46
    invoke-virtual {v2}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_49
    .catch Ljava/lang/Exception; {:try_start_46 .. :try_end_49} :catch_4a

    goto :goto_a

    .line 268
    :catch_4a
    move-exception v3

    goto :goto_a

    .line 244
    .end local v2    # "semaphore":Ljava/util/concurrent/Semaphore;
    :catchall_4c
    move-exception v3

    :try_start_4d
    monitor-exit v4
    :try_end_4e
    .catchall {:try_start_4d .. :try_end_4e} :catchall_4c

    :try_start_4e
    throw v3

    .line 263
    .end local v0    # "currentSelector":Lcom/koushikdutta/async/SelectorWrapper;
    .end local v1    # "isAffinityThread":Z
    :catchall_4f
    move-exception v3

    monitor-exit p0
    :try_end_51
    .catchall {:try_start_4e .. :try_end_51} :catchall_4f

    throw v3
.end method
