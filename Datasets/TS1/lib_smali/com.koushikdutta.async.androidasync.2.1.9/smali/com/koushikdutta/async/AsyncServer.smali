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

.field private static final ipSorter:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Ljava/net/InetAddress;",
            ">;"
        }
    .end annotation
.end field

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

.field postCounter:I


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 44
    const-class v0, Lcom/koushikdutta/async/AsyncServer;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_3b

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lcom/koushikdutta/async/AsyncServer;->$assertionsDisabled:Z

    .line 88
    :try_start_b
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x8

    if-gt v0, v1, :cond_1f

    .line 89
    const-string v0, "java.net.preferIPv4Stack"

    const-string v1, "true"

    invoke-static {v0, v1}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 90
    const-string v0, "java.net.preferIPv6Addresses"

    const-string v1, "false"

    invoke-static {v0, v1}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_1f
    .catch Ljava/lang/Throwable; {:try_start_b .. :try_end_1f} :catch_3d

    .line 97
    :cond_1f
    :goto_1f
    new-instance v0, Lcom/koushikdutta/async/AsyncServer;

    invoke-direct {v0}, Lcom/koushikdutta/async/AsyncServer;-><init>()V

    sput-object v0, Lcom/koushikdutta/async/AsyncServer;->mInstance:Lcom/koushikdutta/async/AsyncServer;

    .line 428
    new-instance v0, Lcom/koushikdutta/async/AsyncServer$8;

    invoke-direct {v0}, Lcom/koushikdutta/async/AsyncServer$8;-><init>()V

    sput-object v0, Lcom/koushikdutta/async/AsyncServer;->ipSorter:Ljava/util/Comparator;

    .line 441
    invoke-static {}, Lcom/koushikdutta/async/AsyncServer;->newSynchronousWorkers()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/koushikdutta/async/AsyncServer;->synchronousWorkers:Ljava/util/concurrent/ExecutorService;

    .line 556
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lcom/koushikdutta/async/AsyncServer;->mServers:Ljava/util/WeakHashMap;

    return-void

    .line 44
    :cond_3b
    const/4 v0, 0x0

    goto :goto_9

    .line 93
    :catch_3d
    move-exception v0

    goto :goto_1f
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 110
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/koushikdutta/async/AsyncServer;-><init>(Ljava/lang/String;)V

    .line 111
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 113
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 146
    const/4 v0, 0x0

    iput v0, p0, Lcom/koushikdutta/async/AsyncServer;->postCounter:I

    .line 230
    new-instance v0, Ljava/util/PriorityQueue;

    const/4 v1, 0x1

    sget-object v2, Lcom/koushikdutta/async/AsyncServer$Scheduler;->INSTANCE:Lcom/koushikdutta/async/AsyncServer$Scheduler;

    invoke-direct {v0, v1, v2}, Ljava/util/PriorityQueue;-><init>(ILjava/util/Comparator;)V

    iput-object v0, p0, Lcom/koushikdutta/async/AsyncServer;->mQueue:Ljava/util/PriorityQueue;

    .line 114
    if-nez p1, :cond_14

    .line 115
    const-string p1, "AsyncServer"

    .line 116
    :cond_14
    iput-object p1, p0, Lcom/koushikdutta/async/AsyncServer;->mName:Ljava/lang/String;

    .line 117
    return-void
.end method

.method static synthetic access$100(Lcom/koushikdutta/async/SelectorWrapper;)V
    .registers 1
    .param p0, "x0"    # Lcom/koushikdutta/async/SelectorWrapper;

    .prologue
    .line 44
    invoke-static {p0}, Lcom/koushikdutta/async/AsyncServer;->shutdownEverything(Lcom/koushikdutta/async/SelectorWrapper;)V

    return-void
.end method

.method static synthetic access$300(Lcom/koushikdutta/async/AsyncServer;)Lcom/koushikdutta/async/SelectorWrapper;
    .registers 2
    .param p0, "x0"    # Lcom/koushikdutta/async/AsyncServer;

    .prologue
    .line 44
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncServer;->mSelector:Lcom/koushikdutta/async/SelectorWrapper;

    return-object v0
.end method

.method static synthetic access$500(Lcom/koushikdutta/async/AsyncServer;Ljava/net/InetSocketAddress;Lcom/koushikdutta/async/callback/ConnectCallback;)Lcom/koushikdutta/async/AsyncServer$ConnectFuture;
    .registers 4
    .param p0, "x0"    # Lcom/koushikdutta/async/AsyncServer;
    .param p1, "x1"    # Ljava/net/InetSocketAddress;
    .param p2, "x2"    # Lcom/koushikdutta/async/callback/ConnectCallback;

    .prologue
    .line 44
    invoke-direct {p0, p1, p2}, Lcom/koushikdutta/async/AsyncServer;->connectResolvedInetSocketAddress(Ljava/net/InetSocketAddress;Lcom/koushikdutta/async/callback/ConnectCallback;)Lcom/koushikdutta/async/AsyncServer$ConnectFuture;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$600()Ljava/util/Comparator;
    .registers 1

    .prologue
    .line 44
    sget-object v0, Lcom/koushikdutta/async/AsyncServer;->ipSorter:Ljava/util/Comparator;

    return-object v0
.end method

.method static synthetic access$700(Lcom/koushikdutta/async/AsyncServer;Lcom/koushikdutta/async/AsyncNetworkSocket;)V
    .registers 2
    .param p0, "x0"    # Lcom/koushikdutta/async/AsyncServer;
    .param p1, "x1"    # Lcom/koushikdutta/async/AsyncNetworkSocket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/nio/channels/ClosedChannelException;
        }
    .end annotation

    .prologue
    .line 44
    invoke-direct {p0, p1}, Lcom/koushikdutta/async/AsyncServer;->handleSocket(Lcom/koushikdutta/async/AsyncNetworkSocket;)V

    return-void
.end method

.method static synthetic access$800(Lcom/koushikdutta/async/AsyncServer;Lcom/koushikdutta/async/SelectorWrapper;Ljava/util/PriorityQueue;)V
    .registers 3
    .param p0, "x0"    # Lcom/koushikdutta/async/AsyncServer;
    .param p1, "x1"    # Lcom/koushikdutta/async/SelectorWrapper;
    .param p2, "x2"    # Ljava/util/PriorityQueue;

    .prologue
    .line 44
    invoke-static {p0, p1, p2}, Lcom/koushikdutta/async/AsyncServer;->run(Lcom/koushikdutta/async/AsyncServer;Lcom/koushikdutta/async/SelectorWrapper;Ljava/util/PriorityQueue;)V

    return-void
.end method

.method private addMe()Z
    .registers 5

    .prologue
    .line 559
    sget-object v2, Lcom/koushikdutta/async/AsyncServer;->mServers:Ljava/util/WeakHashMap;

    monitor-enter v2

    .line 560
    :try_start_3
    sget-object v1, Lcom/koushikdutta/async/AsyncServer;->mServers:Ljava/util/WeakHashMap;

    iget-object v3, p0, Lcom/koushikdutta/async/AsyncServer;->mAffinity:Ljava/lang/Thread;

    invoke-virtual {v1, v3}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/koushikdutta/async/AsyncServer;

    .line 561
    .local v0, "current":Lcom/koushikdutta/async/AsyncServer;
    if-eqz v0, :cond_12

    .line 563
    const/4 v1, 0x0

    monitor-exit v2

    .line 567
    :goto_11
    return v1

    .line 565
    :cond_12
    sget-object v1, Lcom/koushikdutta/async/AsyncServer;->mServers:Ljava/util/WeakHashMap;

    iget-object v3, p0, Lcom/koushikdutta/async/AsyncServer;->mAffinity:Ljava/lang/Thread;

    invoke-virtual {v1, v3, p0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 566
    monitor-exit v2

    .line 567
    const/4 v1, 0x1

    goto :goto_11

    .line 566
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
    .line 362
    new-instance v0, Lcom/koushikdutta/async/AsyncServer$ConnectFuture;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/koushikdutta/async/AsyncServer$ConnectFuture;-><init>(Lcom/koushikdutta/async/AsyncServer;Lcom/koushikdutta/async/AsyncServer$1;)V

    .line 363
    .local v0, "cancel":Lcom/koushikdutta/async/AsyncServer$ConnectFuture;
    sget-boolean v1, Lcom/koushikdutta/async/AsyncServer;->$assertionsDisabled:Z

    if-nez v1, :cond_16

    invoke-virtual {p1}, Ljava/net/InetSocketAddress;->isUnresolved()Z

    move-result v1

    if-eqz v1, :cond_16

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 365
    :cond_16
    new-instance v1, Lcom/koushikdutta/async/AsyncServer$6;

    invoke-direct {v1, p0, v0, p2, p1}, Lcom/koushikdutta/async/AsyncServer$6;-><init>(Lcom/koushikdutta/async/AsyncServer;Lcom/koushikdutta/async/AsyncServer$ConnectFuture;Lcom/koushikdutta/async/callback/ConnectCallback;Ljava/net/InetSocketAddress;)V

    invoke-virtual {p0, v1}, Lcom/koushikdutta/async/AsyncServer;->post(Ljava/lang/Runnable;)Ljava/lang/Object;

    .line 390
    return-object v0
.end method

.method public static getCurrentThreadServer()Lcom/koushikdutta/async/AsyncServer;
    .registers 2

    .prologue
    .line 571
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
    .line 99
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
    .line 120
    invoke-virtual {p1}, Lcom/koushikdutta/async/AsyncNetworkSocket;->getChannel()Lcom/koushikdutta/async/ChannelWrapper;

    move-result-object v1

    .line 121
    .local v1, "sc":Lcom/koushikdutta/async/ChannelWrapper;
    iget-object v2, p0, Lcom/koushikdutta/async/AsyncServer;->mSelector:Lcom/koushikdutta/async/SelectorWrapper;

    invoke-virtual {v2}, Lcom/koushikdutta/async/SelectorWrapper;->getSelector()Ljava/nio/channels/Selector;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/koushikdutta/async/ChannelWrapper;->register(Ljava/nio/channels/Selector;)Ljava/nio/channels/SelectionKey;

    move-result-object v0

    .line 122
    .local v0, "ckey":Ljava/nio/channels/SelectionKey;
    invoke-virtual {v0, p1}, Ljava/nio/channels/SelectionKey;->attach(Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    invoke-virtual {p1, p0, v0}, Lcom/koushikdutta/async/AsyncNetworkSocket;->setup(Lcom/koushikdutta/async/AsyncServer;Ljava/nio/channels/SelectionKey;)V

    .line 124
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
    .line 715
    .local p1, "queue":Ljava/util/PriorityQueue;, "Ljava/util/PriorityQueue<Lcom/koushikdutta/async/AsyncServer$Scheduled;>;"
    const-wide v4, 0x7fffffffffffffffL

    .line 719
    .local v4, "wait":J
    :goto_5
    const/4 v2, 0x0

    .line 721
    .local v2, "run":Lcom/koushikdutta/async/AsyncServer$Scheduled;
    monitor-enter p0

    .line 722
    :try_start_7
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 724
    .local v0, "now":J
    invoke-virtual {p1}, Ljava/util/PriorityQueue;->size()I

    move-result v6

    if-lez v6, :cond_1e

    .line 725
    invoke-virtual {p1}, Ljava/util/PriorityQueue;->remove()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/koushikdutta/async/AsyncServer$Scheduled;

    .line 726
    .local v3, "s":Lcom/koushikdutta/async/AsyncServer$Scheduled;
    iget-wide v6, v3, Lcom/koushikdutta/async/AsyncServer$Scheduled;->time:J

    cmp-long v6, v6, v0

    if-gtz v6, :cond_25

    .line 727
    move-object v2, v3

    .line 734
    .end local v3    # "s":Lcom/koushikdutta/async/AsyncServer$Scheduled;
    :cond_1e
    :goto_1e
    monitor-exit p0
    :try_end_1f
    .catchall {:try_start_7 .. :try_end_1f} :catchall_2d

    .line 736
    if-nez v2, :cond_30

    .line 742
    const/4 v6, 0x0

    iput v6, p0, Lcom/koushikdutta/async/AsyncServer;->postCounter:I

    .line 743
    return-wide v4

    .line 730
    .restart local v3    # "s":Lcom/koushikdutta/async/AsyncServer$Scheduled;
    :cond_25
    :try_start_25
    iget-wide v6, v3, Lcom/koushikdutta/async/AsyncServer$Scheduled;->time:J

    sub-long v4, v6, v0

    .line 731
    invoke-virtual {p1, v3}, Ljava/util/PriorityQueue;->add(Ljava/lang/Object;)Z

    goto :goto_1e

    .line 734
    .end local v0    # "now":J
    .end local v3    # "s":Lcom/koushikdutta/async/AsyncServer$Scheduled;
    :catchall_2d
    move-exception v6

    monitor-exit p0
    :try_end_2f
    .catchall {:try_start_25 .. :try_end_2f} :catchall_2d

    throw v6

    .line 739
    .restart local v0    # "now":J
    :cond_30
    iget-object v6, v2, Lcom/koushikdutta/async/AsyncServer$Scheduled;->runnable:Ljava/lang/Runnable;

    invoke-interface {v6}, Ljava/lang/Runnable;->run()V

    goto :goto_5
.end method

.method private static newSynchronousWorkers()Ljava/util/concurrent/ExecutorService;
    .registers 8

    .prologue
    .line 422
    new-instance v7, Lcom/koushikdutta/async/AsyncServer$NamedThreadFactory;

    const-string v1, "AsyncServer-worker-"

    invoke-direct {v7, v1}, Lcom/koushikdutta/async/AsyncServer$NamedThreadFactory;-><init>(Ljava/lang/String;)V

    .line 423
    .local v7, "tf":Ljava/util/concurrent/ThreadFactory;
    new-instance v0, Ljava/util/concurrent/ThreadPoolExecutor;

    const/4 v1, 0x1

    const/4 v2, 0x4

    const-wide/16 v3, 0xa

    sget-object v5, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v6, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v6}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    invoke-direct/range {v0 .. v7}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    .line 425
    .local v0, "tpe":Ljava/util/concurrent/ThreadPoolExecutor;
    return-object v0
.end method

.method public static post(Landroid/os/Handler;Ljava/lang/Runnable;)V
    .registers 5
    .param p0, "handler"    # Landroid/os/Handler;
    .param p1, "runnable"    # Ljava/lang/Runnable;

    .prologue
    .line 73
    new-instance v1, Lcom/koushikdutta/async/AsyncServer$RunnableWrapper;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/koushikdutta/async/AsyncServer$RunnableWrapper;-><init>(Lcom/koushikdutta/async/AsyncServer$1;)V

    .line 74
    .local v1, "wrapper":Lcom/koushikdutta/async/AsyncServer$RunnableWrapper;
    invoke-virtual {p0}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-virtual {v2}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-static {v2}, Lcom/koushikdutta/async/ThreadQueue;->getOrCreateThreadQueue(Ljava/lang/Thread;)Lcom/koushikdutta/async/ThreadQueue;

    move-result-object v0

    .line 75
    .local v0, "threadQueue":Lcom/koushikdutta/async/ThreadQueue;
    iput-object v0, v1, Lcom/koushikdutta/async/AsyncServer$RunnableWrapper;->threadQueue:Lcom/koushikdutta/async/ThreadQueue;

    .line 76
    iput-object p0, v1, Lcom/koushikdutta/async/AsyncServer$RunnableWrapper;->handler:Landroid/os/Handler;

    .line 77
    iput-object p1, v1, Lcom/koushikdutta/async/AsyncServer$RunnableWrapper;->runnable:Ljava/lang/Runnable;

    .line 79
    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/ThreadQueue;->add(Ljava/lang/Runnable;)Z

    .line 80
    invoke-virtual {p0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 83
    iget-object v2, v0, Lcom/koushikdutta/async/ThreadQueue;->queueSemaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v2}, Ljava/util/concurrent/Semaphore;->release()V

    .line 84
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
    .line 657
    .local p2, "queue":Ljava/util/PriorityQueue;, "Ljava/util/PriorityQueue<Lcom/koushikdutta/async/AsyncServer$Scheduled;>;"
    :goto_0
    :try_start_0
    invoke-static {p0, p1, p2}, Lcom/koushikdutta/async/AsyncServer;->runLoop(Lcom/koushikdutta/async/AsyncServer;Lcom/koushikdutta/async/SelectorWrapper;Ljava/util/PriorityQueue;)V
    :try_end_3
    .catch Lcom/koushikdutta/async/AsyncServer$AsyncSelectorException; {:try_start_0 .. :try_end_3} :catch_1f

    .line 669
    :goto_3
    monitor-enter p0

    .line 670
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

    .line 671
    :cond_1a
    monitor-exit p0

    goto :goto_0

    .line 680
    :catchall_1c
    move-exception v1

    monitor-exit p0
    :try_end_1e
    .catchall {:try_start_4 .. :try_end_1e} :catchall_1c

    throw v1

    .line 659
    :catch_1f
    move-exception v0

    .line 660
    .local v0, "e":Lcom/koushikdutta/async/AsyncServer$AsyncSelectorException;
    const-string v1, "NIO"

    const-string v2, "Selector exception, shutting down"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 663
    :try_start_27
    invoke-virtual {p1}, Lcom/koushikdutta/async/SelectorWrapper;->getSelector()Ljava/nio/channels/Selector;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/channels/Selector;->close()V
    :try_end_2e
    .catch Ljava/lang/Exception; {:try_start_27 .. :try_end_2e} :catch_2f

    goto :goto_3

    .line 665
    :catch_2f
    move-exception v1

    goto :goto_3

    .line 673
    .end local v0    # "e":Lcom/koushikdutta/async/AsyncServer$AsyncSelectorException;
    :cond_31
    :try_start_31
    invoke-static {p1}, Lcom/koushikdutta/async/AsyncServer;->shutdownEverything(Lcom/koushikdutta/async/SelectorWrapper;)V

    .line 674
    iget-object v1, p0, Lcom/koushikdutta/async/AsyncServer;->mSelector:Lcom/koushikdutta/async/SelectorWrapper;

    if-ne v1, p1, :cond_48

    .line 675
    new-instance v1, Ljava/util/PriorityQueue;

    const/4 v2, 0x1

    sget-object v3, Lcom/koushikdutta/async/AsyncServer$Scheduler;->INSTANCE:Lcom/koushikdutta/async/AsyncServer$Scheduler;

    invoke-direct {v1, v2, v3}, Ljava/util/PriorityQueue;-><init>(ILjava/util/Comparator;)V

    iput-object v1, p0, Lcom/koushikdutta/async/AsyncServer;->mQueue:Ljava/util/PriorityQueue;

    .line 676
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/koushikdutta/async/AsyncServer;->mSelector:Lcom/koushikdutta/async/SelectorWrapper;

    .line 677
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/koushikdutta/async/AsyncServer;->mAffinity:Ljava/lang/Thread;

    .line 679
    :cond_48
    monitor-exit p0
    :try_end_49
    .catchall {:try_start_31 .. :try_end_49} :catchall_1c

    .line 682
    sget-object v2, Lcom/koushikdutta/async/AsyncServer;->mServers:Ljava/util/WeakHashMap;

    monitor-enter v2

    .line 683
    :try_start_4c
    sget-object v1, Lcom/koushikdutta/async/AsyncServer;->mServers:Ljava/util/WeakHashMap;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 684
    monitor-exit v2

    .line 686
    return-void

    .line 684
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
    .line 578
    const/4 v2, 0x0

    .line 579
    .local v2, "reentrant":Z
    monitor-enter p0

    .line 580
    :try_start_2
    iget-object v4, p0, Lcom/koushikdutta/async/AsyncServer;->mSelector:Lcom/koushikdutta/async/SelectorWrapper;

    if-eqz v4, :cond_2e

    .line 581
    const-string v4, "NIO"

    const-string v5, "Reentrant call"

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 582
    sget-boolean v4, Lcom/koushikdutta/async/AsyncServer;->$assertionsDisabled:Z

    if-nez v4, :cond_22

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    iget-object v5, p0, Lcom/koushikdutta/async/AsyncServer;->mAffinity:Ljava/lang/Thread;

    if-eq v4, v5, :cond_22

    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4

    .line 625
    :catchall_1f
    move-exception v4

    monitor-exit p0
    :try_end_21
    .catchall {:try_start_2 .. :try_end_21} :catchall_1f

    throw v4

    .line 584
    :cond_22
    const/4 v2, 0x1

    .line 585
    :try_start_23
    iget-object v3, p0, Lcom/koushikdutta/async/AsyncServer;->mSelector:Lcom/koushikdutta/async/SelectorWrapper;

    .line 586
    .local v3, "selector":Lcom/koushikdutta/async/SelectorWrapper;
    iget-object v1, p0, Lcom/koushikdutta/async/AsyncServer;->mQueue:Ljava/util/PriorityQueue;

    .line 625
    .local v1, "queue":Ljava/util/PriorityQueue;, "Ljava/util/PriorityQueue<Lcom/koushikdutta/async/AsyncServer$Scheduled;>;"
    :cond_27
    monitor-exit p0
    :try_end_28
    .catchall {:try_start_23 .. :try_end_28} :catchall_1f

    .line 627
    if-eqz v2, :cond_82

    .line 629
    :try_start_2a
    invoke-static {p0, v3, v1}, Lcom/koushikdutta/async/AsyncServer;->runLoop(Lcom/koushikdutta/async/AsyncServer;Lcom/koushikdutta/async/SelectorWrapper;Ljava/util/PriorityQueue;)V
    :try_end_2d
    .catch Lcom/koushikdutta/async/AsyncServer$AsyncSelectorException; {:try_start_2a .. :try_end_2d} :catch_70

    .line 644
    .end local v1    # "queue":Ljava/util/PriorityQueue;, "Ljava/util/PriorityQueue<Lcom/koushikdutta/async/AsyncServer$Scheduled;>;"
    .end local v3    # "selector":Lcom/koushikdutta/async/SelectorWrapper;
    :goto_2d
    return-void

    .line 590
    :cond_2e
    :try_start_2e
    new-instance v3, Lcom/koushikdutta/async/SelectorWrapper;

    invoke-static {}, Ljava/nio/channels/spi/SelectorProvider;->provider()Ljava/nio/channels/spi/SelectorProvider;

    move-result-object v4

    invoke-virtual {v4}, Ljava/nio/channels/spi/SelectorProvider;->openSelector()Ljava/nio/channels/spi/AbstractSelector;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/koushikdutta/async/SelectorWrapper;-><init>(Ljava/nio/channels/Selector;)V

    iput-object v3, p0, Lcom/koushikdutta/async/AsyncServer;->mSelector:Lcom/koushikdutta/async/SelectorWrapper;

    .line 591
    .restart local v3    # "selector":Lcom/koushikdutta/async/SelectorWrapper;
    iget-object v1, p0, Lcom/koushikdutta/async/AsyncServer;->mQueue:Ljava/util/PriorityQueue;
    :try_end_3f
    .catch Ljava/io/IOException; {:try_start_2e .. :try_end_3f} :catch_5d
    .catchall {:try_start_2e .. :try_end_3f} :catchall_1f

    .line 596
    .restart local v1    # "queue":Ljava/util/PriorityQueue;, "Ljava/util/PriorityQueue<Lcom/koushikdutta/async/AsyncServer$Scheduled;>;"
    if-eqz p1, :cond_60

    .line 597
    :try_start_41
    new-instance v4, Lcom/koushikdutta/async/AsyncServer$14;

    iget-object v5, p0, Lcom/koushikdutta/async/AsyncServer;->mName:Ljava/lang/String;

    invoke-direct {v4, p0, v5, v3, v1}, Lcom/koushikdutta/async/AsyncServer$14;-><init>(Lcom/koushikdutta/async/AsyncServer;Ljava/lang/String;Lcom/koushikdutta/async/SelectorWrapper;Ljava/util/PriorityQueue;)V

    iput-object v4, p0, Lcom/koushikdutta/async/AsyncServer;->mAffinity:Ljava/lang/Thread;

    .line 606
    :goto_4a
    invoke-direct {p0}, Lcom/koushikdutta/async/AsyncServer;->addMe()Z
    :try_end_4d
    .catchall {:try_start_41 .. :try_end_4d} :catchall_1f

    move-result v4

    if-nez v4, :cond_67

    .line 608
    :try_start_50
    iget-object v4, p0, Lcom/koushikdutta/async/AsyncServer;->mSelector:Lcom/koushikdutta/async/SelectorWrapper;

    invoke-virtual {v4}, Lcom/koushikdutta/async/SelectorWrapper;->close()V
    :try_end_55
    .catch Ljava/lang/Exception; {:try_start_50 .. :try_end_55} :catch_86
    .catchall {:try_start_50 .. :try_end_55} :catchall_1f

    .line 612
    :goto_55
    const/4 v4, 0x0

    :try_start_56
    iput-object v4, p0, Lcom/koushikdutta/async/AsyncServer;->mSelector:Lcom/koushikdutta/async/SelectorWrapper;

    .line 613
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/koushikdutta/async/AsyncServer;->mAffinity:Ljava/lang/Thread;

    .line 614
    monitor-exit p0

    goto :goto_2d

    .line 593
    .end local v1    # "queue":Ljava/util/PriorityQueue;, "Ljava/util/PriorityQueue<Lcom/koushikdutta/async/AsyncServer$Scheduled;>;"
    .end local v3    # "selector":Lcom/koushikdutta/async/SelectorWrapper;
    :catch_5d
    move-exception v0

    .line 594
    .local v0, "e":Ljava/io/IOException;
    monitor-exit p0

    goto :goto_2d

    .line 604
    .end local v0    # "e":Ljava/io/IOException;
    .restart local v1    # "queue":Ljava/util/PriorityQueue;, "Ljava/util/PriorityQueue<Lcom/koushikdutta/async/AsyncServer$Scheduled;>;"
    .restart local v3    # "selector":Lcom/koushikdutta/async/SelectorWrapper;
    :cond_60
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    iput-object v4, p0, Lcom/koushikdutta/async/AsyncServer;->mAffinity:Ljava/lang/Thread;

    goto :goto_4a

    .line 616
    :cond_67
    if-eqz p1, :cond_27

    .line 617
    iget-object v4, p0, Lcom/koushikdutta/async/AsyncServer;->mAffinity:Ljava/lang/Thread;

    invoke-virtual {v4}, Ljava/lang/Thread;->start()V

    .line 619
    monitor-exit p0
    :try_end_6f
    .catchall {:try_start_56 .. :try_end_6f} :catchall_1f

    goto :goto_2d

    .line 631
    :catch_70
    move-exception v0

    .line 632
    .local v0, "e":Lcom/koushikdutta/async/AsyncServer$AsyncSelectorException;
    const-string v4, "NIO"

    const-string v5, "Selector closed"

    invoke-static {v4, v5, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 635
    :try_start_78
    invoke-virtual {v3}, Lcom/koushikdutta/async/SelectorWrapper;->getSelector()Ljava/nio/channels/Selector;

    move-result-object v4

    invoke-virtual {v4}, Ljava/nio/channels/Selector;->close()V
    :try_end_7f
    .catch Ljava/lang/Exception; {:try_start_78 .. :try_end_7f} :catch_80

    goto :goto_2d

    .line 637
    :catch_80
    move-exception v4

    goto :goto_2d

    .line 643
    .end local v0    # "e":Lcom/koushikdutta/async/AsyncServer$AsyncSelectorException;
    :cond_82
    invoke-static {p0, v3, v1}, Lcom/koushikdutta/async/AsyncServer;->run(Lcom/koushikdutta/async/AsyncServer;Lcom/koushikdutta/async/SelectorWrapper;Ljava/util/PriorityQueue;)V

    goto :goto_2d

    .line 610
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
    .line 754
    .local p2, "queue":Ljava/util/PriorityQueue;, "Ljava/util/PriorityQueue<Lcom/koushikdutta/async/AsyncServer$Scheduled;>;"
    const/4 v10, 0x1

    .line 757
    .local v10, "needsSelect":Z
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-static {v0, v1}, Lcom/koushikdutta/async/AsyncServer;->lockAndRunQueue(Lcom/koushikdutta/async/AsyncServer;Ljava/util/PriorityQueue;)J

    move-result-wide v18

    .line 759
    .local v18, "wait":J
    :try_start_9
    monitor-enter p0
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_a} :catch_b5

    .line 762
    :try_start_a
    invoke-virtual/range {p1 .. p1}, Lcom/koushikdutta/async/SelectorWrapper;->selectNow()I

    move-result v14

    .line 763
    .local v14, "readyNow":I
    if-nez v14, :cond_25

    .line 766
    invoke-virtual/range {p1 .. p1}, Lcom/koushikdutta/async/SelectorWrapper;->keys()Ljava/util/Set;

    move-result-object v20

    invoke-interface/range {v20 .. v20}, Ljava/util/Set;->size()I

    move-result v20

    if-nez v20, :cond_26

    const-wide v20, 0x7fffffffffffffffL

    cmp-long v20, v18, v20

    if-nez v20, :cond_26

    .line 768
    monitor-exit p0

    .line 863
    :goto_24
    return-void

    .line 772
    :cond_25
    const/4 v10, 0x0

    .line 774
    :cond_26
    monitor-exit p0
    :try_end_27
    .catchall {:try_start_a .. :try_end_27} :catchall_b2

    .line 776
    if-eqz v10, :cond_35

    .line 777
    const-wide v20, 0x7fffffffffffffffL

    cmp-long v20, v18, v20

    if-nez v20, :cond_be

    .line 779
    :try_start_32
    invoke-virtual/range {p1 .. p1}, Lcom/koushikdutta/async/SelectorWrapper;->select()V
    :try_end_35
    .catch Ljava/lang/Exception; {:try_start_32 .. :try_end_35} :catch_b5

    .line 792
    :cond_35
    :goto_35
    invoke-virtual/range {p1 .. p1}, Lcom/koushikdutta/async/SelectorWrapper;->selectedKeys()Ljava/util/Set;

    move-result-object v13

    .line 793
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

    .line 795
    .local v9, "key":Ljava/nio/channels/SelectionKey;
    :try_start_49
    invoke-virtual {v9}, Ljava/nio/channels/SelectionKey;->isAcceptable()Z

    move-result v20

    if-eqz v20, :cond_c7

    .line 796
    invoke-virtual {v9}, Ljava/nio/channels/SelectionKey;->channel()Ljava/nio/channels/SelectableChannel;

    move-result-object v12

    check-cast v12, Ljava/nio/channels/ServerSocketChannel;
    :try_end_55
    .catch Ljava/nio/channels/CancelledKeyException; {:try_start_49 .. :try_end_55} :catch_b0

    .line 797
    .local v12, "nextReady":Ljava/nio/channels/ServerSocketChannel;
    const/4 v15, 0x0

    .line 798
    .local v15, "sc":Ljava/nio/channels/SocketChannel;
    const/4 v4, 0x0

    .line 800
    .local v4, "ckey":Ljava/nio/channels/SelectionKey;
    :try_start_57
    invoke-virtual {v12}, Ljava/nio/channels/ServerSocketChannel;->accept()Ljava/nio/channels/SocketChannel;

    move-result-object v15

    .line 801
    if-eqz v15, :cond_3d

    .line 803
    const/16 v20, 0x0

    move/from16 v0, v20

    invoke-virtual {v15, v0}, Ljava/nio/channels/SocketChannel;->configureBlocking(Z)Ljava/nio/channels/SelectableChannel;

    .line 804
    invoke-virtual/range {p1 .. p1}, Lcom/koushikdutta/async/SelectorWrapper;->getSelector()Ljava/nio/channels/Selector;

    move-result-object v20

    const/16 v21, 0x1

    move-object/from16 v0, v20

    move/from16 v1, v21

    invoke-virtual {v15, v0, v1}, Ljava/nio/channels/SocketChannel;->register(Ljava/nio/channels/Selector;I)Ljava/nio/channels/SelectionKey;

    move-result-object v4

    .line 805
    invoke-virtual {v9}, Ljava/nio/channels/SelectionKey;->attachment()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/koushikdutta/async/callback/ListenCallback;

    .line 806
    .local v16, "serverHandler":Lcom/koushikdutta/async/callback/ListenCallback;
    new-instance v7, Lcom/koushikdutta/async/AsyncNetworkSocket;

    invoke-direct {v7}, Lcom/koushikdutta/async/AsyncNetworkSocket;-><init>()V

    .line 807
    .local v7, "handler":Lcom/koushikdutta/async/AsyncNetworkSocket;
    invoke-virtual {v15}, Ljava/nio/channels/SocketChannel;->socket()Ljava/net/Socket;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/net/Socket;->getRemoteSocketAddress()Ljava/net/SocketAddress;

    move-result-object v20

    check-cast v20, Ljava/net/InetSocketAddress;

    move-object/from16 v0, v20

    invoke-virtual {v7, v15, v0}, Lcom/koushikdutta/async/AsyncNetworkSocket;->attach(Ljava/nio/channels/SocketChannel;Ljava/net/InetSocketAddress;)V

    .line 808
    move-object/from16 v0, p0

    invoke-virtual {v7, v0, v4}, Lcom/koushikdutta/async/AsyncNetworkSocket;->setup(Lcom/koushikdutta/async/AsyncServer;Ljava/nio/channels/SelectionKey;)V

    .line 809
    invoke-virtual {v4, v7}, Ljava/nio/channels/SelectionKey;->attach(Ljava/lang/Object;)Ljava/lang/Object;

    .line 810
    move-object/from16 v0, v16

    invoke-interface {v0, v7}, Lcom/koushikdutta/async/callback/ListenCallback;->onAccepted(Lcom/koushikdutta/async/AsyncSocket;)V
    :try_end_99
    .catch Ljava/io/IOException; {:try_start_57 .. :try_end_99} :catch_9a
    .catch Ljava/nio/channels/CancelledKeyException; {:try_start_57 .. :try_end_99} :catch_b0

    goto :goto_3d

    .line 812
    .end local v7    # "handler":Lcom/koushikdutta/async/AsyncNetworkSocket;
    .end local v16    # "serverHandler":Lcom/koushikdutta/async/callback/ListenCallback;
    :catch_9a
    move-exception v5

    .line 813
    .local v5, "e":Ljava/io/IOException;
    const/16 v20, 0x1

    :try_start_9d
    move/from16 v0, v20

    new-array v0, v0, [Ljava/io/Closeable;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    aput-object v15, v20, v21

    invoke-static/range {v20 .. v20}, Lcom/koushikdutta/async/util/StreamUtility;->closeQuietly([Ljava/io/Closeable;)V

    .line 814
    if-eqz v4, :cond_3d

    .line 815
    invoke-virtual {v4}, Ljava/nio/channels/SelectionKey;->cancel()V
    :try_end_af
    .catch Ljava/nio/channels/CancelledKeyException; {:try_start_9d .. :try_end_af} :catch_b0

    goto :goto_3d

    .line 859
    .end local v4    # "ckey":Ljava/nio/channels/SelectionKey;
    .end local v5    # "e":Ljava/io/IOException;
    .end local v12    # "nextReady":Ljava/nio/channels/ServerSocketChannel;
    .end local v15    # "sc":Ljava/nio/channels/SocketChannel;
    :catch_b0
    move-exception v20

    goto :goto_3d

    .line 774
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

    .line 787
    :catch_b5
    move-exception v5

    .line 788
    .local v5, "e":Ljava/lang/Exception;
    new-instance v20, Lcom/koushikdutta/async/AsyncServer$AsyncSelectorException;

    move-object/from16 v0, v20

    invoke-direct {v0, v5}, Lcom/koushikdutta/async/AsyncServer$AsyncSelectorException;-><init>(Ljava/lang/Exception;)V

    throw v20

    .line 783
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

    .line 818
    .restart local v8    # "i$":Ljava/util/Iterator;
    .restart local v9    # "key":Ljava/nio/channels/SelectionKey;
    .restart local v13    # "readyKeys":Ljava/util/Set;, "Ljava/util/Set<Ljava/nio/channels/SelectionKey;>;"
    :cond_c7
    :try_start_c7
    invoke-virtual {v9}, Ljava/nio/channels/SelectionKey;->isReadable()Z

    move-result v20

    if-eqz v20, :cond_e0

    .line 819
    invoke-virtual {v9}, Ljava/nio/channels/SelectionKey;->attachment()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/koushikdutta/async/AsyncNetworkSocket;

    .line 820
    .restart local v7    # "handler":Lcom/koushikdutta/async/AsyncNetworkSocket;
    invoke-virtual {v7}, Lcom/koushikdutta/async/AsyncNetworkSocket;->onReadable()I

    move-result v17

    .line 821
    .local v17, "transmitted":I
    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/AsyncServer;->onDataReceived(I)V

    goto/16 :goto_3d

    .line 823
    .end local v7    # "handler":Lcom/koushikdutta/async/AsyncNetworkSocket;
    .end local v17    # "transmitted":I
    :cond_e0
    invoke-virtual {v9}, Ljava/nio/channels/SelectionKey;->isWritable()Z

    move-result v20

    if-eqz v20, :cond_f1

    .line 824
    invoke-virtual {v9}, Ljava/nio/channels/SelectionKey;->attachment()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/koushikdutta/async/AsyncNetworkSocket;

    .line 825
    .restart local v7    # "handler":Lcom/koushikdutta/async/AsyncNetworkSocket;
    invoke-virtual {v7}, Lcom/koushikdutta/async/AsyncNetworkSocket;->onDataWritable()V

    goto/16 :goto_3d

    .line 827
    .end local v7    # "handler":Lcom/koushikdutta/async/AsyncNetworkSocket;
    :cond_f1
    invoke-virtual {v9}, Ljava/nio/channels/SelectionKey;->isConnectable()Z

    move-result v20

    if-eqz v20, :cond_16f

    .line 828
    invoke-virtual {v9}, Ljava/nio/channels/SelectionKey;->attachment()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/koushikdutta/async/AsyncServer$ConnectFuture;

    .line 829
    .local v3, "cancel":Lcom/koushikdutta/async/AsyncServer$ConnectFuture;
    invoke-virtual {v9}, Ljava/nio/channels/SelectionKey;->channel()Ljava/nio/channels/SelectableChannel;

    move-result-object v15

    check-cast v15, Ljava/nio/channels/SocketChannel;

    .line 830
    .restart local v15    # "sc":Ljava/nio/channels/SocketChannel;
    const/16 v20, 0x1

    move/from16 v0, v20

    invoke-virtual {v9, v0}, Ljava/nio/channels/SelectionKey;->interestOps(I)Ljava/nio/channels/SelectionKey;
    :try_end_10a
    .catch Ljava/nio/channels/CancelledKeyException; {:try_start_c7 .. :try_end_10a} :catch_b0

    .line 833
    :try_start_10a
    invoke-virtual {v15}, Ljava/nio/channels/SocketChannel;->finishConnect()Z

    .line 834
    new-instance v11, Lcom/koushikdutta/async/AsyncNetworkSocket;

    invoke-direct {v11}, Lcom/koushikdutta/async/AsyncNetworkSocket;-><init>()V

    .line 835
    .local v11, "newHandler":Lcom/koushikdutta/async/AsyncNetworkSocket;
    move-object/from16 v0, p0

    invoke-virtual {v11, v0, v9}, Lcom/koushikdutta/async/AsyncNetworkSocket;->setup(Lcom/koushikdutta/async/AsyncServer;Ljava/nio/channels/SelectionKey;)V

    .line 836
    invoke-virtual {v15}, Ljava/nio/channels/SocketChannel;->socket()Ljava/net/Socket;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/net/Socket;->getRemoteSocketAddress()Ljava/net/SocketAddress;

    move-result-object v20

    check-cast v20, Ljava/net/InetSocketAddress;

    move-object/from16 v0, v20

    invoke-virtual {v11, v15, v0}, Lcom/koushikdutta/async/AsyncNetworkSocket;->attach(Ljava/nio/channels/SocketChannel;Ljava/net/InetSocketAddress;)V

    .line 837
    invoke-virtual {v9, v11}, Ljava/nio/channels/SelectionKey;->attach(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_129
    .catch Ljava/io/IOException; {:try_start_10a .. :try_end_129} :catch_147
    .catch Ljava/nio/channels/CancelledKeyException; {:try_start_10a .. :try_end_129} :catch_b0

    .line 847
    :try_start_129
    invoke-virtual {v3, v11}, Lcom/koushikdutta/async/AsyncServer$ConnectFuture;->setComplete(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_3d

    .line 848
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

    .line 850
    :catch_13e
    move-exception v5

    .line 851
    .restart local v5    # "e":Ljava/lang/Exception;
    :try_start_13f
    new-instance v20, Ljava/lang/RuntimeException;

    move-object/from16 v0, v20

    invoke-direct {v0, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v20

    .line 839
    .end local v5    # "e":Ljava/lang/Exception;
    .end local v11    # "newHandler":Lcom/koushikdutta/async/AsyncNetworkSocket;
    :catch_147
    move-exception v6

    .line 840
    .local v6, "ex":Ljava/io/IOException;
    invoke-virtual {v9}, Ljava/nio/channels/SelectionKey;->cancel()V

    .line 841
    const/16 v20, 0x1

    move/from16 v0, v20

    new-array v0, v0, [Ljava/io/Closeable;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    aput-object v15, v20, v21

    invoke-static/range {v20 .. v20}, Lcom/koushikdutta/async/util/StreamUtility;->closeQuietly([Ljava/io/Closeable;)V

    .line 842
    invoke-virtual {v3, v6}, Lcom/koushikdutta/async/AsyncServer$ConnectFuture;->setComplete(Ljava/lang/Exception;)Z

    move-result v20

    if-eqz v20, :cond_3d

    .line 843
    iget-object v0, v3, Lcom/koushikdutta/async/AsyncServer$ConnectFuture;->callback:Lcom/koushikdutta/async/callback/ConnectCallback;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v0, v6, v1}, Lcom/koushikdutta/async/callback/ConnectCallback;->onConnectCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/AsyncSocket;)V

    goto/16 :goto_3d

    .line 855
    .end local v3    # "cancel":Lcom/koushikdutta/async/AsyncServer$ConnectFuture;
    .end local v6    # "ex":Ljava/io/IOException;
    .end local v15    # "sc":Ljava/nio/channels/SocketChannel;
    :cond_16f
    const-string v20, "NIO"

    const-string v21, "wtf"

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 856
    new-instance v20, Ljava/lang/RuntimeException;

    const-string v21, "Unknown key state."

    invoke-direct/range {v20 .. v21}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v20
    :try_end_17e
    .catch Ljava/nio/channels/CancelledKeyException; {:try_start_13f .. :try_end_17e} :catch_b0

    .line 862
    .end local v9    # "key":Ljava/nio/channels/SelectionKey;
    :cond_17e
    invoke-interface {v13}, Ljava/util/Set;->clear()V

    goto/16 :goto_24
.end method

.method private static shutdownEverything(Lcom/koushikdutta/async/SelectorWrapper;)V
    .registers 2
    .param p0, "selector"    # Lcom/koushikdutta/async/SelectorWrapper;

    .prologue
    .line 704
    invoke-static {p0}, Lcom/koushikdutta/async/AsyncServer;->shutdownKeys(Lcom/koushikdutta/async/SelectorWrapper;)V

    .line 707
    :try_start_3
    invoke-virtual {p0}, Lcom/koushikdutta/async/SelectorWrapper;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_6} :catch_7

    .line 711
    :goto_6
    return-void

    .line 709
    :catch_7
    move-exception v0

    goto :goto_6
.end method

.method private static shutdownKeys(Lcom/koushikdutta/async/SelectorWrapper;)V
    .registers 6
    .param p0, "selector"    # Lcom/koushikdutta/async/SelectorWrapper;

    .prologue
    .line 690
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

    .line 691
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

    .line 693
    :try_start_21
    invoke-virtual {v1}, Ljava/nio/channels/SelectionKey;->cancel()V
    :try_end_24
    .catch Ljava/lang/Exception; {:try_start_21 .. :try_end_24} :catch_25

    goto :goto_8

    .line 695
    :catch_25
    move-exception v2

    goto :goto_8

    .line 699
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "key":Ljava/nio/channels/SelectionKey;
    :catch_27
    move-exception v2

    .line 701
    :cond_28
    return-void
.end method

.method private static wakeup(Lcom/koushikdutta/async/SelectorWrapper;)V
    .registers 3
    .param p0, "selector"    # Lcom/koushikdutta/async/SelectorWrapper;

    .prologue
    .line 133
    sget-object v0, Lcom/koushikdutta/async/AsyncServer;->synchronousWorkers:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/koushikdutta/async/AsyncServer$1;

    invoke-direct {v1, p0}, Lcom/koushikdutta/async/AsyncServer$1;-><init>(Lcom/koushikdutta/async/SelectorWrapper;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 144
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
    .line 482
    invoke-static {}, Ljava/nio/channels/DatagramChannel;->open()Ljava/nio/channels/DatagramChannel;

    move-result-object v5

    .line 483
    .local v5, "socket":Ljava/nio/channels/DatagramChannel;
    new-instance v4, Lcom/koushikdutta/async/AsyncDatagramSocket;

    invoke-direct {v4}, Lcom/koushikdutta/async/AsyncDatagramSocket;-><init>()V

    .line 484
    .local v4, "handler":Lcom/koushikdutta/async/AsyncDatagramSocket;
    invoke-virtual {v4, v5}, Lcom/koushikdutta/async/AsyncDatagramSocket;->attach(Ljava/nio/channels/DatagramChannel;)V

    .line 488
    new-instance v0, Lcom/koushikdutta/async/AsyncServer$11;

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    invoke-direct/range {v0 .. v5}, Lcom/koushikdutta/async/AsyncServer$11;-><init>(Lcom/koushikdutta/async/AsyncServer;Ljava/lang/String;ILcom/koushikdutta/async/AsyncDatagramSocket;Ljava/nio/channels/DatagramChannel;)V

    invoke-virtual {p0, v0}, Lcom/koushikdutta/async/AsyncServer;->run(Ljava/lang/Runnable;)V

    .line 502
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
    .line 535
    invoke-static {}, Ljava/nio/channels/DatagramChannel;->open()Ljava/nio/channels/DatagramChannel;

    move-result-object v1

    .line 536
    .local v1, "socket":Ljava/nio/channels/DatagramChannel;
    new-instance v0, Lcom/koushikdutta/async/AsyncDatagramSocket;

    invoke-direct {v0}, Lcom/koushikdutta/async/AsyncDatagramSocket;-><init>()V

    .line 537
    .local v0, "handler":Lcom/koushikdutta/async/AsyncDatagramSocket;
    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/AsyncDatagramSocket;->attach(Ljava/nio/channels/DatagramChannel;)V

    .line 541
    new-instance v2, Lcom/koushikdutta/async/AsyncServer$13;

    invoke-direct {v2, p0, v0, v1, p1}, Lcom/koushikdutta/async/AsyncServer$13;-><init>(Lcom/koushikdutta/async/AsyncServer;Lcom/koushikdutta/async/AsyncDatagramSocket;Ljava/nio/channels/DatagramChannel;Ljava/net/SocketAddress;)V

    invoke-virtual {p0, v2}, Lcom/koushikdutta/async/AsyncServer;->run(Ljava/lang/Runnable;)V

    .line 553
    return-object v0
.end method

.method public connectSocket(Ljava/lang/String;ILcom/koushikdutta/async/callback/ConnectCallback;)Lcom/koushikdutta/async/future/Cancellable;
    .registers 5
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "callback"    # Lcom/koushikdutta/async/callback/ConnectCallback;

    .prologue
    .line 418
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
    .line 394
    invoke-virtual {p1}, Ljava/net/InetSocketAddress;->isUnresolved()Z

    move-result v2

    if-nez v2, :cond_b

    .line 395
    invoke-direct {p0, p1, p2}, Lcom/koushikdutta/async/AsyncServer;->connectResolvedInetSocketAddress(Ljava/net/InetSocketAddress;Lcom/koushikdutta/async/callback/ConnectCallback;)Lcom/koushikdutta/async/AsyncServer$ConnectFuture;

    move-result-object v1

    .line 414
    :goto_a
    return-object v1

    .line 397
    :cond_b
    new-instance v1, Lcom/koushikdutta/async/future/SimpleFuture;

    invoke-direct {v1}, Lcom/koushikdutta/async/future/SimpleFuture;-><init>()V

    .line 399
    .local v1, "ret":Lcom/koushikdutta/async/future/SimpleFuture;, "Lcom/koushikdutta/async/future/SimpleFuture<Lcom/koushikdutta/async/AsyncNetworkSocket;>;"
    invoke-virtual {p1}, Ljava/net/InetSocketAddress;->getHostName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/koushikdutta/async/AsyncServer;->getByName(Ljava/lang/String;)Lcom/koushikdutta/async/future/Future;

    move-result-object v0

    .line 400
    .local v0, "lookup":Lcom/koushikdutta/async/future/Future;, "Lcom/koushikdutta/async/future/Future<Ljava/net/InetAddress;>;"
    invoke-virtual {v1, v0}, Lcom/koushikdutta/async/future/SimpleFuture;->setParent(Lcom/koushikdutta/async/future/Cancellable;)Lcom/koushikdutta/async/future/SimpleFuture;

    .line 401
    new-instance v2, Lcom/koushikdutta/async/AsyncServer$7;

    invoke-direct {v2, p0, p2, v1, p1}, Lcom/koushikdutta/async/AsyncServer$7;-><init>(Lcom/koushikdutta/async/AsyncServer;Lcom/koushikdutta/async/callback/ConnectCallback;Lcom/koushikdutta/async/future/SimpleFuture;Ljava/net/InetSocketAddress;)V

    .line 402
    invoke-interface {v0, v2}, Lcom/koushikdutta/async/future/Future;->setCallback(Lcom/koushikdutta/async/future/FutureCallback;)Lcom/koushikdutta/async/future/Future;

    goto :goto_a
.end method

.method public dump()V
    .registers 2

    .prologue
    .line 866
    new-instance v0, Lcom/koushikdutta/async/AsyncServer$15;

    invoke-direct {v0, p0}, Lcom/koushikdutta/async/AsyncServer$15;-><init>(Lcom/koushikdutta/async/AsyncServer;)V

    invoke-virtual {p0, v0}, Lcom/koushikdutta/async/AsyncServer;->post(Ljava/lang/Runnable;)Ljava/lang/Object;

    .line 880
    return-void
.end method

.method public getAffinity()Ljava/lang/Thread;
    .registers 2

    .prologue
    .line 883
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
    .line 443
    new-instance v0, Lcom/koushikdutta/async/future/SimpleFuture;

    invoke-direct {v0}, Lcom/koushikdutta/async/future/SimpleFuture;-><init>()V

    .line 444
    .local v0, "ret":Lcom/koushikdutta/async/future/SimpleFuture;, "Lcom/koushikdutta/async/future/SimpleFuture<[Ljava/net/InetAddress;>;"
    sget-object v1, Lcom/koushikdutta/async/AsyncServer;->synchronousWorkers:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Lcom/koushikdutta/async/AsyncServer$9;

    invoke-direct {v2, p0, p1, v0}, Lcom/koushikdutta/async/AsyncServer$9;-><init>(Lcom/koushikdutta/async/AsyncServer;Ljava/lang/String;Lcom/koushikdutta/async/future/SimpleFuture;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 468
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
    .line 472
    invoke-virtual {p0, p1}, Lcom/koushikdutta/async/AsyncServer;->getAllByName(Ljava/lang/String;)Lcom/koushikdutta/async/future/Future;

    move-result-object v0

    new-instance v1, Lcom/koushikdutta/async/AsyncServer$10;

    invoke-direct {v1, p0}, Lcom/koushikdutta/async/AsyncServer$10;-><init>(Lcom/koushikdutta/async/AsyncServer;)V

    .line 473
    invoke-interface {v0, v1}, Lcom/koushikdutta/async/future/Future;->then(Lcom/koushikdutta/async/future/FutureCallback;)Lcom/koushikdutta/async/future/FutureCallback;

    move-result-object v0

    check-cast v0, Lcom/koushikdutta/async/future/Future;

    return-object v0
.end method

.method public isAffinityThread()Z
    .registers 3

    .prologue
    .line 887
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
    .line 891
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncServer;->mAffinity:Ljava/lang/Thread;

    .line 892
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
    .line 105
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
    .line 298
    new-instance v5, Lcom/koushikdutta/async/AsyncServer$ObjectHolder;

    const/4 v0, 0x0

    invoke-direct {v5, v0}, Lcom/koushikdutta/async/AsyncServer$ObjectHolder;-><init>(Lcom/koushikdutta/async/AsyncServer$1;)V

    .line 299
    .local v5, "holder":Lcom/koushikdutta/async/AsyncServer$ObjectHolder;, "Lcom/koushikdutta/async/AsyncServer$ObjectHolder<Lcom/koushikdutta/async/AsyncServerSocket;>;"
    new-instance v0, Lcom/koushikdutta/async/AsyncServer$5;

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move-object v4, p3

    invoke-direct/range {v0 .. v5}, Lcom/koushikdutta/async/AsyncServer$5;-><init>(Lcom/koushikdutta/async/AsyncServer;Ljava/net/InetAddress;ILcom/koushikdutta/async/callback/ListenCallback;Lcom/koushikdutta/async/AsyncServer$ObjectHolder;)V

    invoke-virtual {p0, v0}, Lcom/koushikdutta/async/AsyncServer;->run(Ljava/lang/Runnable;)V

    .line 342
    iget-object v0, v5, Lcom/koushikdutta/async/AsyncServer$ObjectHolder;->held:Ljava/lang/Object;

    check-cast v0, Lcom/koushikdutta/async/AsyncServerSocket;

    return-object v0
.end method

.method protected onDataReceived(I)V
    .registers 2
    .param p1, "transmitted"    # I

    .prologue
    .line 289
    return-void
.end method

.method protected onDataSent(I)V
    .registers 2
    .param p1, "transmitted"    # I

    .prologue
    .line 292
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
    .line 506
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
    .line 510
    invoke-static {}, Ljava/nio/channels/DatagramChannel;->open()Ljava/nio/channels/DatagramChannel;

    move-result-object v3

    .line 511
    .local v3, "socket":Ljava/nio/channels/DatagramChannel;
    new-instance v5, Lcom/koushikdutta/async/AsyncDatagramSocket;

    invoke-direct {v5}, Lcom/koushikdutta/async/AsyncDatagramSocket;-><init>()V

    .line 512
    .local v5, "handler":Lcom/koushikdutta/async/AsyncDatagramSocket;
    invoke-virtual {v5, v3}, Lcom/koushikdutta/async/AsyncDatagramSocket;->attach(Ljava/nio/channels/DatagramChannel;)V

    .line 516
    new-instance v0, Lcom/koushikdutta/async/AsyncServer$12;

    move-object v1, p0

    move v2, p2

    move-object v4, p1

    invoke-direct/range {v0 .. v5}, Lcom/koushikdutta/async/AsyncServer$12;-><init>(Lcom/koushikdutta/async/AsyncServer;ZLjava/nio/channels/DatagramChannel;Ljava/net/SocketAddress;Lcom/koushikdutta/async/AsyncDatagramSocket;)V

    invoke-virtual {p0, v0}, Lcom/koushikdutta/async/AsyncServer;->run(Ljava/lang/Runnable;)V

    .line 531
    return-object v5
.end method

.method public post(Lcom/koushikdutta/async/callback/CompletedCallback;Ljava/lang/Exception;)Ljava/lang/Object;
    .registers 4
    .param p1, "callback"    # Lcom/koushikdutta/async/callback/CompletedCallback;
    .param p2, "e"    # Ljava/lang/Exception;

    .prologue
    .line 191
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
    .line 187
    const-wide/16 v0, 0x0

    invoke-virtual {p0, p1, v0, v1}, Lcom/koushikdutta/async/AsyncServer;->postDelayed(Ljava/lang/Runnable;J)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public postDelayed(Ljava/lang/Runnable;J)Ljava/lang/Object;
    .registers 14
    .param p1, "runnable"    # Ljava/lang/Runnable;
    .param p2, "delay"    # J

    .prologue
    const-wide/16 v4, 0x0

    .line 149
    monitor-enter p0

    .line 159
    cmp-long v3, p2, v4

    if-lez v3, :cond_2c

    .line 160
    :try_start_7
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    add-long v1, v3, p2

    .line 167
    .local v1, "time":J
    :goto_d
    iget-object v3, p0, Lcom/koushikdutta/async/AsyncServer;->mQueue:Ljava/util/PriorityQueue;

    new-instance v0, Lcom/koushikdutta/async/AsyncServer$Scheduled;

    invoke-direct {v0, p1, v1, v2}, Lcom/koushikdutta/async/AsyncServer$Scheduled;-><init>(Ljava/lang/Runnable;J)V

    .local v0, "s":Lcom/koushikdutta/async/AsyncServer$Scheduled;
    invoke-virtual {v3, v0}, Ljava/util/PriorityQueue;->add(Ljava/lang/Object;)Z

    .line 169
    iget-object v3, p0, Lcom/koushikdutta/async/AsyncServer;->mSelector:Lcom/koushikdutta/async/SelectorWrapper;

    if-nez v3, :cond_1f

    .line 170
    const/4 v3, 0x1

    invoke-direct {p0, v3}, Lcom/koushikdutta/async/AsyncServer;->run(Z)V

    .line 171
    :cond_1f
    invoke-virtual {p0}, Lcom/koushikdutta/async/AsyncServer;->isAffinityThread()Z

    move-result v3

    if-nez v3, :cond_2a

    .line 172
    iget-object v3, p0, Lcom/koushikdutta/async/AsyncServer;->mSelector:Lcom/koushikdutta/async/SelectorWrapper;

    invoke-static {v3}, Lcom/koushikdutta/async/AsyncServer;->wakeup(Lcom/koushikdutta/async/SelectorWrapper;)V

    .line 174
    :cond_2a
    monitor-exit p0

    .line 175
    return-object v0

    .line 161
    .end local v0    # "s":Lcom/koushikdutta/async/AsyncServer$Scheduled;
    .end local v1    # "time":J
    :cond_2c
    cmp-long v3, p2, v4

    if-nez v3, :cond_38

    .line 162
    iget v3, p0, Lcom/koushikdutta/async/AsyncServer;->postCounter:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/koushikdutta/async/AsyncServer;->postCounter:I

    int-to-long v1, v3

    .restart local v1    # "time":J
    goto :goto_d

    .line 163
    .end local v1    # "time":J
    :cond_38
    iget-object v3, p0, Lcom/koushikdutta/async/AsyncServer;->mQueue:Ljava/util/PriorityQueue;

    invoke-virtual {v3}, Ljava/util/PriorityQueue;->size()I

    move-result v3

    if-lez v3, :cond_54

    .line 164
    const-wide/16 v4, 0x0

    iget-object v3, p0, Lcom/koushikdutta/async/AsyncServer;->mQueue:Ljava/util/PriorityQueue;

    invoke-virtual {v3}, Ljava/util/PriorityQueue;->peek()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/koushikdutta/async/AsyncServer$Scheduled;

    iget-wide v6, v3, Lcom/koushikdutta/async/AsyncServer$Scheduled;->time:J

    const-wide/16 v8, 0x1

    sub-long/2addr v6, v8

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v1

    .restart local v1    # "time":J
    goto :goto_d

    .line 166
    .end local v1    # "time":J
    :cond_54
    const-wide/16 v1, 0x0

    .restart local v1    # "time":J
    goto :goto_d

    .line 174
    .end local v1    # "time":J
    :catchall_57
    move-exception v3

    monitor-exit p0
    :try_end_59
    .catchall {:try_start_7 .. :try_end_59} :catchall_57

    throw v3
.end method

.method public postImmediate(Ljava/lang/Runnable;)Ljava/lang/Object;
    .registers 4
    .param p1, "runnable"    # Ljava/lang/Runnable;

    .prologue
    .line 179
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {p0}, Lcom/koushikdutta/async/AsyncServer;->getAffinity()Ljava/lang/Thread;

    move-result-object v1

    if-ne v0, v1, :cond_f

    .line 180
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 181
    const/4 v0, 0x0

    .line 183
    :goto_e
    return-object v0

    :cond_f
    const-wide/16 v0, -0x1

    invoke-virtual {p0, p1, v0, v1}, Lcom/koushikdutta/async/AsyncServer;->postDelayed(Ljava/lang/Runnable;J)Ljava/lang/Object;

    move-result-object v0

    goto :goto_e
.end method

.method public removeAllCallbacks(Ljava/lang/Object;)V
    .registers 3
    .param p1, "scheduled"    # Ljava/lang/Object;

    .prologue
    .line 127
    monitor-enter p0

    .line 128
    :try_start_1
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncServer;->mQueue:Ljava/util/PriorityQueue;

    invoke-virtual {v0, p1}, Ljava/util/PriorityQueue;->remove(Ljava/lang/Object;)Z

    .line 129
    monitor-exit p0

    .line 130
    return-void

    .line 129
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
    .line 200
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    iget-object v3, p0, Lcom/koushikdutta/async/AsyncServer;->mAffinity:Ljava/lang/Thread;

    if-ne v2, v3, :cond_11

    .line 201
    invoke-virtual {p0, p1}, Lcom/koushikdutta/async/AsyncServer;->post(Ljava/lang/Runnable;)Ljava/lang/Object;

    .line 202
    iget-object v2, p0, Lcom/koushikdutta/async/AsyncServer;->mQueue:Ljava/util/PriorityQueue;

    invoke-static {p0, v2}, Lcom/koushikdutta/async/AsyncServer;->lockAndRunQueue(Lcom/koushikdutta/async/AsyncServer;Ljava/util/PriorityQueue;)J

    .line 220
    :goto_10
    return-void

    .line 206
    :cond_11
    new-instance v1, Ljava/util/concurrent/Semaphore;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Ljava/util/concurrent/Semaphore;-><init>(I)V

    .line 207
    .local v1, "semaphore":Ljava/util/concurrent/Semaphore;
    new-instance v2, Lcom/koushikdutta/async/AsyncServer$3;

    invoke-direct {v2, p0, p1, v1}, Lcom/koushikdutta/async/AsyncServer$3;-><init>(Lcom/koushikdutta/async/AsyncServer;Ljava/lang/Runnable;Ljava/util/concurrent/Semaphore;)V

    invoke-virtual {p0, v2}, Lcom/koushikdutta/async/AsyncServer;->post(Ljava/lang/Runnable;)Ljava/lang/Object;

    .line 215
    :try_start_1f
    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_22
    .catch Ljava/lang/InterruptedException; {:try_start_1f .. :try_end_22} :catch_23

    goto :goto_10

    .line 217
    :catch_23
    move-exception v0

    .line 218
    .local v0, "e":Ljava/lang/InterruptedException;
    const-string v2, "NIO"

    const-string v3, "run"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_10
.end method

.method public stop()V
    .registers 9

    .prologue
    .line 253
    monitor-enter p0

    .line 254
    :try_start_1
    invoke-virtual {p0}, Lcom/koushikdutta/async/AsyncServer;->isAffinityThread()Z

    move-result v1

    .line 255
    .local v1, "isAffinityThread":Z
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncServer;->mSelector:Lcom/koushikdutta/async/SelectorWrapper;

    .line 256
    .local v0, "currentSelector":Lcom/koushikdutta/async/SelectorWrapper;
    if-nez v0, :cond_b

    .line 257
    monitor-exit p0

    .line 286
    :cond_a
    :goto_a
    return-void

    .line 258
    :cond_b
    sget-object v4, Lcom/koushikdutta/async/AsyncServer;->mServers:Ljava/util/WeakHashMap;

    monitor-enter v4
    :try_end_e
    .catchall {:try_start_1 .. :try_end_e} :catchall_4f

    .line 259
    :try_start_e
    sget-object v3, Lcom/koushikdutta/async/AsyncServer;->mServers:Ljava/util/WeakHashMap;

    iget-object v5, p0, Lcom/koushikdutta/async/AsyncServer;->mAffinity:Ljava/lang/Thread;

    invoke-virtual {v3, v5}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 260
    monitor-exit v4
    :try_end_16
    .catchall {:try_start_e .. :try_end_16} :catchall_4c

    .line 261
    :try_start_16
    new-instance v2, Ljava/util/concurrent/Semaphore;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Ljava/util/concurrent/Semaphore;-><init>(I)V

    .line 264
    .local v2, "semaphore":Ljava/util/concurrent/Semaphore;
    iget-object v3, p0, Lcom/koushikdutta/async/AsyncServer;->mQueue:Ljava/util/PriorityQueue;

    new-instance v4, Lcom/koushikdutta/async/AsyncServer$Scheduled;

    new-instance v5, Lcom/koushikdutta/async/AsyncServer$4;

    invoke-direct {v5, p0, v0, v2}, Lcom/koushikdutta/async/AsyncServer$4;-><init>(Lcom/koushikdutta/async/AsyncServer;Lcom/koushikdutta/async/SelectorWrapper;Ljava/util/concurrent/Semaphore;)V

    const-wide/16 v6, 0x0

    invoke-direct {v4, v5, v6, v7}, Lcom/koushikdutta/async/AsyncServer$Scheduled;-><init>(Ljava/lang/Runnable;J)V

    invoke-virtual {v3, v4}, Ljava/util/PriorityQueue;->add(Ljava/lang/Object;)Z

    .line 271
    invoke-virtual {v0}, Lcom/koushikdutta/async/SelectorWrapper;->wakeupOnce()V

    .line 274
    invoke-static {v0}, Lcom/koushikdutta/async/AsyncServer;->shutdownKeys(Lcom/koushikdutta/async/SelectorWrapper;)V

    .line 276
    new-instance v3, Ljava/util/PriorityQueue;

    const/4 v4, 0x1

    sget-object v5, Lcom/koushikdutta/async/AsyncServer$Scheduler;->INSTANCE:Lcom/koushikdutta/async/AsyncServer$Scheduler;

    invoke-direct {v3, v4, v5}, Ljava/util/PriorityQueue;-><init>(ILjava/util/Comparator;)V

    iput-object v3, p0, Lcom/koushikdutta/async/AsyncServer;->mQueue:Ljava/util/PriorityQueue;

    .line 277
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/koushikdutta/async/AsyncServer;->mSelector:Lcom/koushikdutta/async/SelectorWrapper;

    .line 278
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/koushikdutta/async/AsyncServer;->mAffinity:Ljava/lang/Thread;

    .line 279
    monitor-exit p0
    :try_end_44
    .catchall {:try_start_16 .. :try_end_44} :catchall_4f

    .line 281
    if-nez v1, :cond_a

    .line 282
    :try_start_46
    invoke-virtual {v2}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_49
    .catch Ljava/lang/Exception; {:try_start_46 .. :try_end_49} :catch_4a

    goto :goto_a

    .line 284
    :catch_4a
    move-exception v3

    goto :goto_a

    .line 260
    .end local v2    # "semaphore":Ljava/util/concurrent/Semaphore;
    :catchall_4c
    move-exception v3

    :try_start_4d
    monitor-exit v4
    :try_end_4e
    .catchall {:try_start_4d .. :try_end_4e} :catchall_4c

    :try_start_4e
    throw v3

    .line 279
    .end local v0    # "currentSelector":Lcom/koushikdutta/async/SelectorWrapper;
    .end local v1    # "isAffinityThread":Z
    :catchall_4f
    move-exception v3

    monitor-exit p0
    :try_end_51
    .catchall {:try_start_4e .. :try_end_51} :catchall_4f

    throw v3
.end method
