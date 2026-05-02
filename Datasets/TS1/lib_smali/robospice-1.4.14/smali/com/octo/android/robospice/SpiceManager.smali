.class public Lcom/octo/android/robospice/SpiceManager;
.super Ljava/lang/Object;
.source "SpiceManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand;,
        Lcom/octo/android/robospice/SpiceManager$PendingRequestHandlerSpiceServiceListener;,
        Lcom/octo/android/robospice/SpiceManager$SpiceServiceConnection;,
        Lcom/octo/android/robospice/SpiceManager$MinPriorityThreadFactory;
    }
.end annotation


# static fields
.field private static final DEFAULT_THREAD_COUNT:I = 0x3

.field private static final DELAY_WAIT_FOR_RUNNER_TO_STOP:I = 0x1f4

.field protected static final SPICE_MANAGER_THREAD_NAME_PREFIX:Ljava/lang/String; = "SpiceManagerThread "


# instance fields
.field private final conditionServiceBound:Ljava/util/concurrent/locks/Condition;

.field private final conditionServiceUnbound:Ljava/util/concurrent/locks/Condition;

.field private contextWeakReference:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field private executorService:Ljava/util/concurrent/ExecutorService;

.field private volatile isStopped:Z

.field private volatile isUnbinding:Z

.field private final lockAcquireService:Ljava/util/concurrent/locks/ReentrantLock;

.field private final lockSendRequestsToService:Ljava/util/concurrent/locks/ReentrantLock;

.field private final mapPendingRequestToRequestListener:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;",
            "Ljava/util/Set",
            "<",
            "Lcom/octo/android/robospice/request/listener/RequestListener",
            "<*>;>;>;"
        }
    .end annotation
.end field

.field private final mapRequestToLaunchToRequestListener:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;",
            "Ljava/util/Set",
            "<",
            "Lcom/octo/android/robospice/request/listener/RequestListener",
            "<*>;>;>;"
        }
    .end annotation
.end field

.field private final removerSpiceServiceListener:Lcom/octo/android/robospice/SpiceManager$PendingRequestHandlerSpiceServiceListener;

.field protected final requestQueue:Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingQueue",
            "<",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;>;"
        }
    .end annotation
.end field

.field protected runner:Ljava/lang/Thread;

.field private spiceManagerThreadIndex:I

.field private spiceService:Lcom/octo/android/robospice/SpiceService;

.field private final spiceServiceClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<+",
            "Lcom/octo/android/robospice/SpiceService;",
            ">;"
        }
    .end annotation
.end field

.field private spiceServiceConnection:Lcom/octo/android/robospice/SpiceManager$SpiceServiceConnection;


# direct methods
.method public constructor <init>(Ljava/lang/Class;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Lcom/octo/android/robospice/SpiceService;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 179
    .local p1, "spiceServiceClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/octo/android/robospice/SpiceService;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 102
    new-instance v0, Lcom/octo/android/robospice/SpiceManager$SpiceServiceConnection;

    invoke-direct {v0, p0}, Lcom/octo/android/robospice/SpiceManager$SpiceServiceConnection;-><init>(Lcom/octo/android/robospice/SpiceManager;)V

    iput-object v0, p0, Lcom/octo/android/robospice/SpiceManager;->spiceServiceConnection:Lcom/octo/android/robospice/SpiceManager$SpiceServiceConnection;

    .line 111
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/octo/android/robospice/SpiceManager;->isStopped:Z

    .line 114
    new-instance v0, Ljava/util/concurrent/PriorityBlockingQueue;

    invoke-direct {v0}, Ljava/util/concurrent/PriorityBlockingQueue;-><init>()V

    iput-object v0, p0, Lcom/octo/android/robospice/SpiceManager;->requestQueue:Ljava/util/concurrent/BlockingQueue;

    .line 121
    new-instance v0, Ljava/util/IdentityHashMap;

    invoke-direct {v0}, Ljava/util/IdentityHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/octo/android/robospice/SpiceManager;->mapRequestToLaunchToRequestListener:Ljava/util/Map;

    .line 129
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/octo/android/robospice/SpiceManager;->mapPendingRequestToRequestListener:Ljava/util/Map;

    .line 138
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v0, p0, Lcom/octo/android/robospice/SpiceManager;->lockAcquireService:Ljava/util/concurrent/locks/ReentrantLock;

    .line 140
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceManager;->lockAcquireService:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->newCondition()Ljava/util/concurrent/locks/Condition;

    move-result-object v0

    iput-object v0, p0, Lcom/octo/android/robospice/SpiceManager;->conditionServiceBound:Ljava/util/concurrent/locks/Condition;

    .line 142
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceManager;->lockAcquireService:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->newCondition()Ljava/util/concurrent/locks/Condition;

    move-result-object v0

    iput-object v0, p0, Lcom/octo/android/robospice/SpiceManager;->conditionServiceUnbound:Ljava/util/concurrent/locks/Condition;

    .line 148
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v0, p0, Lcom/octo/android/robospice/SpiceManager;->lockSendRequestsToService:Ljava/util/concurrent/locks/ReentrantLock;

    .line 154
    new-instance v0, Lcom/octo/android/robospice/SpiceManager$PendingRequestHandlerSpiceServiceListener;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/octo/android/robospice/SpiceManager$PendingRequestHandlerSpiceServiceListener;-><init>(Lcom/octo/android/robospice/SpiceManager;Lcom/octo/android/robospice/SpiceManager$1;)V

    iput-object v0, p0, Lcom/octo/android/robospice/SpiceManager;->removerSpiceServiceListener:Lcom/octo/android/robospice/SpiceManager$PendingRequestHandlerSpiceServiceListener;

    .line 160
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/octo/android/robospice/SpiceManager;->isUnbinding:Z

    .line 180
    iput-object p1, p0, Lcom/octo/android/robospice/SpiceManager;->spiceServiceClass:Ljava/lang/Class;

    .line 181
    return-void
.end method

.method static synthetic access$1000(Lcom/octo/android/robospice/SpiceManager;)Ljava/util/concurrent/locks/Condition;
    .registers 2
    .param p0, "x0"    # Lcom/octo/android/robospice/SpiceManager;

    .prologue
    .line 76
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceManager;->conditionServiceBound:Ljava/util/concurrent/locks/Condition;

    return-object v0
.end method

.method static synthetic access$1102(Lcom/octo/android/robospice/SpiceManager;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/octo/android/robospice/SpiceManager;
    .param p1, "x1"    # Z

    .prologue
    .line 76
    iput-boolean p1, p0, Lcom/octo/android/robospice/SpiceManager;->isUnbinding:Z

    return p1
.end method

.method static synthetic access$1200(Lcom/octo/android/robospice/SpiceManager;)Ljava/util/concurrent/locks/Condition;
    .registers 2
    .param p0, "x0"    # Lcom/octo/android/robospice/SpiceManager;

    .prologue
    .line 76
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceManager;->conditionServiceUnbound:Ljava/util/concurrent/locks/Condition;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/octo/android/robospice/SpiceManager;)Z
    .registers 2
    .param p0, "x0"    # Lcom/octo/android/robospice/SpiceManager;

    .prologue
    .line 76
    iget-boolean v0, p0, Lcom/octo/android/robospice/SpiceManager;->isStopped:Z

    return v0
.end method

.method static synthetic access$200(Lcom/octo/android/robospice/SpiceManager;)V
    .registers 1
    .param p0, "x0"    # Lcom/octo/android/robospice/SpiceManager;

    .prologue
    .line 76
    invoke-direct {p0}, Lcom/octo/android/robospice/SpiceManager;->cancelAllRequestsInternal()V

    return-void
.end method

.method static synthetic access$300(Lcom/octo/android/robospice/SpiceManager;)Ljava/util/concurrent/locks/ReentrantLock;
    .registers 2
    .param p0, "x0"    # Lcom/octo/android/robospice/SpiceManager;

    .prologue
    .line 76
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceManager;->lockSendRequestsToService:Ljava/util/concurrent/locks/ReentrantLock;

    return-object v0
.end method

.method static synthetic access$400(Lcom/octo/android/robospice/SpiceManager;)Ljava/util/Map;
    .registers 2
    .param p0, "x0"    # Lcom/octo/android/robospice/SpiceManager;

    .prologue
    .line 76
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceManager;->mapRequestToLaunchToRequestListener:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$500(Lcom/octo/android/robospice/SpiceManager;Ljava/lang/StringBuilder;Ljava/util/Map;)V
    .registers 3
    .param p0, "x0"    # Lcom/octo/android/robospice/SpiceManager;
    .param p1, "x1"    # Ljava/lang/StringBuilder;
    .param p2, "x2"    # Ljava/util/Map;

    .prologue
    .line 76
    invoke-direct {p0, p1, p2}, Lcom/octo/android/robospice/SpiceManager;->dumpMap(Ljava/lang/StringBuilder;Ljava/util/Map;)V

    return-void
.end method

.method static synthetic access$600(Lcom/octo/android/robospice/SpiceManager;)Ljava/util/Map;
    .registers 2
    .param p0, "x0"    # Lcom/octo/android/robospice/SpiceManager;

    .prologue
    .line 76
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceManager;->mapPendingRequestToRequestListener:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$700(Lcom/octo/android/robospice/SpiceManager;)Lcom/octo/android/robospice/SpiceService;
    .registers 2
    .param p0, "x0"    # Lcom/octo/android/robospice/SpiceManager;

    .prologue
    .line 76
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceManager;->spiceService:Lcom/octo/android/robospice/SpiceService;

    return-object v0
.end method

.method static synthetic access$702(Lcom/octo/android/robospice/SpiceManager;Lcom/octo/android/robospice/SpiceService;)Lcom/octo/android/robospice/SpiceService;
    .registers 2
    .param p0, "x0"    # Lcom/octo/android/robospice/SpiceManager;
    .param p1, "x1"    # Lcom/octo/android/robospice/SpiceService;

    .prologue
    .line 76
    iput-object p1, p0, Lcom/octo/android/robospice/SpiceManager;->spiceService:Lcom/octo/android/robospice/SpiceService;

    return-object p1
.end method

.method static synthetic access$800(Lcom/octo/android/robospice/SpiceManager;)Ljava/util/concurrent/locks/ReentrantLock;
    .registers 2
    .param p0, "x0"    # Lcom/octo/android/robospice/SpiceManager;

    .prologue
    .line 76
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceManager;->lockAcquireService:Ljava/util/concurrent/locks/ReentrantLock;

    return-object v0
.end method

.method static synthetic access$900(Lcom/octo/android/robospice/SpiceManager;)Lcom/octo/android/robospice/SpiceManager$PendingRequestHandlerSpiceServiceListener;
    .registers 2
    .param p0, "x0"    # Lcom/octo/android/robospice/SpiceManager;

    .prologue
    .line 76
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceManager;->removerSpiceServiceListener:Lcom/octo/android/robospice/SpiceManager$PendingRequestHandlerSpiceServiceListener;

    return-object v0
.end method

.method private addRequestListenerToListOfRequestListeners(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/listener/RequestListener;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<TT;>;",
            "Lcom/octo/android/robospice/request/listener/RequestListener",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 1015
    .local p1, "cachedSpiceRequest":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<TT;>;"
    .local p2, "requestListener":Lcom/octo/android/robospice/request/listener/RequestListener;, "Lcom/octo/android/robospice/request/listener/RequestListener<TT;>;"
    iget-object v2, p0, Lcom/octo/android/robospice/SpiceManager;->mapRequestToLaunchToRequestListener:Ljava/util/Map;

    monitor-enter v2

    .line 1016
    :try_start_3
    iget-object v1, p0, Lcom/octo/android/robospice/SpiceManager;->mapRequestToLaunchToRequestListener:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    .line 1017
    .local v0, "listeners":Ljava/util/Set;, "Ljava/util/Set<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;"
    if-nez v0, :cond_1b

    .line 1018
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    invoke-static {v1}, Ljava/util/Collections;->synchronizedSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    .line 1019
    iget-object v1, p0, Lcom/octo/android/robospice/SpiceManager;->mapRequestToLaunchToRequestListener:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1021
    :cond_1b
    invoke-interface {v0, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1022
    monitor-exit v2

    .line 1024
    return-void

    .line 1022
    .end local v0    # "listeners":Ljava/util/Set;, "Ljava/util/Set<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;"
    :catchall_20
    move-exception v1

    monitor-exit v2
    :try_end_22
    .catchall {:try_start_3 .. :try_end_22} :catchall_20

    throw v1
.end method

.method private bindToService()V
    .registers 8

    .prologue
    .line 1178
    invoke-direct {p0}, Lcom/octo/android/robospice/SpiceManager;->getContextReference()Landroid/content/Context;

    move-result-object v1

    .line 1179
    .local v1, "context":Landroid/content/Context;
    if-eqz v1, :cond_12

    iget-object v4, p0, Lcom/octo/android/robospice/SpiceManager;->requestQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v4}, Ljava/util/concurrent/BlockingQueue;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_13

    iget-boolean v4, p0, Lcom/octo/android/robospice/SpiceManager;->isStopped:Z

    if-eqz v4, :cond_13

    .line 1209
    :cond_12
    :goto_12
    return-void

    .line 1185
    :cond_13
    iget-object v4, p0, Lcom/octo/android/robospice/SpiceManager;->lockAcquireService:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v4}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 1186
    iget-object v4, p0, Lcom/octo/android/robospice/SpiceManager;->lockSendRequestsToService:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v4}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 1189
    :try_start_1d
    iget-object v4, p0, Lcom/octo/android/robospice/SpiceManager;->spiceService:Lcom/octo/android/robospice/SpiceService;

    if-nez v4, :cond_4c

    .line 1190
    new-instance v2, Landroid/content/Intent;

    iget-object v4, p0, Lcom/octo/android/robospice/SpiceManager;->spiceServiceClass:Ljava/lang/Class;

    invoke-direct {v2, v1, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1191
    .local v2, "intentService":Landroid/content/Intent;
    const-string v4, "Binding to service."

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v4, v5}, Lroboguice/util/temp/Ln;->v(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 1192
    new-instance v4, Lcom/octo/android/robospice/SpiceManager$SpiceServiceConnection;

    invoke-direct {v4, p0}, Lcom/octo/android/robospice/SpiceManager$SpiceServiceConnection;-><init>(Lcom/octo/android/robospice/SpiceManager;)V

    iput-object v4, p0, Lcom/octo/android/robospice/SpiceManager;->spiceServiceConnection:Lcom/octo/android/robospice/SpiceManager$SpiceServiceConnection;

    .line 1193
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    iget-object v5, p0, Lcom/octo/android/robospice/SpiceManager;->spiceServiceConnection:Lcom/octo/android/robospice/SpiceManager$SpiceServiceConnection;

    const/4 v6, 0x1

    invoke-virtual {v4, v2, v5, v6}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result v0

    .line 1194
    .local v0, "bound":Z
    if-nez v0, :cond_57

    .line 1195
    const-string v4, "Binding to service failed."

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v4, v5}, Lroboguice/util/temp/Ln;->v(Ljava/lang/Object;[Ljava/lang/Object;)I
    :try_end_4c
    .catch Ljava/lang/Exception; {:try_start_1d .. :try_end_4c} :catch_60
    .catchall {:try_start_1d .. :try_end_4c} :catchall_ab

    .line 1206
    .end local v0    # "bound":Z
    .end local v2    # "intentService":Landroid/content/Intent;
    :cond_4c
    :goto_4c
    iget-object v4, p0, Lcom/octo/android/robospice/SpiceManager;->lockSendRequestsToService:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v4}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 1207
    iget-object v4, p0, Lcom/octo/android/robospice/SpiceManager;->lockAcquireService:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v4}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    goto :goto_12

    .line 1197
    .restart local v0    # "bound":Z
    .restart local v2    # "intentService":Landroid/content/Intent;
    :cond_57
    :try_start_57
    const-string v4, "Binding to service succeeded."

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v4, v5}, Lroboguice/util/temp/Ln;->v(Ljava/lang/Object;[Ljava/lang/Object;)I
    :try_end_5f
    .catch Ljava/lang/Exception; {:try_start_57 .. :try_end_5f} :catch_60
    .catchall {:try_start_57 .. :try_end_5f} :catchall_ab

    goto :goto_4c

    .line 1200
    .end local v0    # "bound":Z
    .end local v2    # "intentService":Landroid/content/Intent;
    :catch_60
    move-exception v3

    .line 1202
    .local v3, "t":Ljava/lang/Exception;
    :try_start_61
    const-string v4, "Binding to service failed."

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v3, v4, v5}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Throwable;Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 1203
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Context is"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v4, v5}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 1204
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "ApplicationContext is "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v4, v5}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I
    :try_end_9f
    .catchall {:try_start_61 .. :try_end_9f} :catchall_ab

    .line 1206
    iget-object v4, p0, Lcom/octo/android/robospice/SpiceManager;->lockSendRequestsToService:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v4}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 1207
    iget-object v4, p0, Lcom/octo/android/robospice/SpiceManager;->lockAcquireService:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v4}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    goto/16 :goto_12

    .line 1206
    .end local v3    # "t":Ljava/lang/Exception;
    :catchall_ab
    move-exception v4

    iget-object v5, p0, Lcom/octo/android/robospice/SpiceManager;->lockSendRequestsToService:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v5}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 1207
    iget-object v5, p0, Lcom/octo/android/robospice/SpiceManager;->lockAcquireService:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v5}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v4
.end method

.method private cancelAllRequestsInternal()V
    .registers 6

    .prologue
    .line 842
    iget-object v3, p0, Lcom/octo/android/robospice/SpiceManager;->lockSendRequestsToService:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 848
    :try_start_5
    iget-object v4, p0, Lcom/octo/android/robospice/SpiceManager;->mapRequestToLaunchToRequestListener:Ljava/util/Map;

    monitor-enter v4
    :try_end_8
    .catchall {:try_start_5 .. :try_end_8} :catchall_25

    .line 849
    :try_start_8
    iget-object v3, p0, Lcom/octo/android/robospice/SpiceManager;->mapRequestToLaunchToRequestListener:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_12
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2c

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/octo/android/robospice/request/CachedSpiceRequest;

    .line 850
    .local v0, "cachedSpiceRequest":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    invoke-virtual {v0}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->cancel()V

    goto :goto_12

    .line 852
    .end local v0    # "cachedSpiceRequest":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    .end local v1    # "i$":Ljava/util/Iterator;
    :catchall_22
    move-exception v3

    monitor-exit v4
    :try_end_24
    .catchall {:try_start_8 .. :try_end_24} :catchall_22

    :try_start_24
    throw v3
    :try_end_25
    .catchall {:try_start_24 .. :try_end_25} :catchall_25

    .line 865
    :catchall_25
    move-exception v3

    iget-object v4, p0, Lcom/octo/android/robospice/SpiceManager;->lockSendRequestsToService:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v4}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v3

    .line 852
    .restart local v1    # "i$":Ljava/util/Iterator;
    :cond_2c
    :try_start_2c
    monitor-exit v4
    :try_end_2d
    .catchall {:try_start_2c .. :try_end_2d} :catchall_22

    .line 860
    :try_start_2d
    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/octo/android/robospice/SpiceManager;->mapPendingRequestToRequestListener:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 861
    .local v2, "listDuplicate":Ljava/util/List;, "Ljava/util/List<Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_3c
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4c

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/octo/android/robospice/request/CachedSpiceRequest;

    .line 862
    .restart local v0    # "cachedSpiceRequest":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    invoke-virtual {v0}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->cancel()V
    :try_end_4b
    .catchall {:try_start_2d .. :try_end_4b} :catchall_25

    goto :goto_3c

    .line 865
    .end local v0    # "cachedSpiceRequest":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    :cond_4c
    iget-object v3, p0, Lcom/octo/android/robospice/SpiceManager;->lockSendRequestsToService:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 867
    return-void
.end method

.method private checkServiceIsProperlyDeclaredInAndroidManifest(Landroid/content/Context;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 1284
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/octo/android/robospice/SpiceManager;->spiceServiceClass:Ljava/lang/Class;

    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1285
    .local v0, "intentCheck":Landroid/content/Intent;
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Landroid/content/pm/PackageManager;->queryIntentServices(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_3e

    .line 1286
    invoke-virtual {p0}, Lcom/octo/android/robospice/SpiceManager;->shouldStop()V

    .line 1287
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Impossible to start SpiceManager as no service of class : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/octo/android/robospice/SpiceManager;->spiceServiceClass:Ljava/lang/Class;

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " is registered in AndroidManifest.xml file !"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1289
    :cond_3e
    return-void
.end method

.method private dumpMap(Ljava/lang/StringBuilder;Ljava/util/Map;)V
    .registers 6
    .param p1, "stringBuilder"    # Ljava/lang/StringBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/StringBuilder;",
            "Ljava/util/Map",
            "<",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;",
            "Ljava/util/Set",
            "<",
            "Lcom/octo/android/robospice/request/listener/RequestListener",
            "<*>;>;>;)V"
        }
    .end annotation

    .prologue
    .line 1292
    .local p2, "map":Ljava/util/Map;, "Ljava/util/Map<Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;Ljava/util/Set<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;>;"
    monitor-enter p2

    .line 1293
    :try_start_1
    const-string v2, " request count= "

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1294
    iget-object v2, p0, Lcom/octo/android/robospice/SpiceManager;->mapRequestToLaunchToRequestListener:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->size()I

    move-result v2

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1296
    const-string v2, ", listeners per requests = ["

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1297
    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_20
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_77

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 1298
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;Ljava/util/Set<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/octo/android/robospice/request/CachedSpiceRequest;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1299
    const-string v2, ":"

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1300
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 1301
    const-string v2, " --> "

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1302
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_69

    .line 1303
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 1307
    :goto_5b
    const-string v2, " listeners"

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1308
    const/16 v2, 0xa

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_20

    .line 1312
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;Ljava/util/Set<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;>;"
    .end local v1    # "i$":Ljava/util/Iterator;
    :catchall_66
    move-exception v2

    monitor-exit p2
    :try_end_68
    .catchall {:try_start_1 .. :try_end_68} :catchall_66

    throw v2

    .line 1305
    .restart local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;Ljava/util/Set<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;>;"
    .restart local v1    # "i$":Ljava/util/Iterator;
    :cond_69
    :try_start_69
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->size()I

    move-result v2

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    goto :goto_5b

    .line 1310
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;Ljava/util/Set<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;>;"
    :cond_77
    const/16 v2, 0x5d

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1311
    const/16 v2, 0xa

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1312
    monitor-exit p2
    :try_end_82
    .catchall {:try_start_69 .. :try_end_82} :catchall_66

    .line 1313
    return-void
.end method

.method private getContextReference()Landroid/content/Context;
    .registers 2

    .prologue
    .line 241
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceManager;->contextWeakReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    return-object v0
.end method

.method private match(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/SpiceRequest;)Z
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;",
            "Lcom/octo/android/robospice/request/SpiceRequest",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .local p1, "cachedSpiceRequest":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    .local p2, "spiceRequest":Lcom/octo/android/robospice/request/SpiceRequest;, "Lcom/octo/android/robospice/request/SpiceRequest<*>;"
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 809
    instance-of v2, p2, Lcom/octo/android/robospice/request/CachedSpiceRequest;

    if-eqz v2, :cond_b

    .line 810
    if-ne p2, p1, :cond_9

    .line 812
    :cond_8
    :goto_8
    return v0

    :cond_9
    move v0, v1

    .line 810
    goto :goto_8

    .line 812
    :cond_b
    invoke-virtual {p1}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->getSpiceRequest()Lcom/octo/android/robospice/request/SpiceRequest;

    move-result-object v2

    if-eq v2, p2, :cond_8

    move v0, v1

    goto :goto_8
.end method

.method private removeListenersOfAllPendingCachedRequests()V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 783
    iget-object v4, p0, Lcom/octo/android/robospice/SpiceManager;->mapPendingRequestToRequestListener:Ljava/util/Map;

    monitor-enter v4

    .line 784
    :try_start_4
    iget-object v3, p0, Lcom/octo/android/robospice/SpiceManager;->mapPendingRequestToRequestListener:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_65

    .line 785
    iget-object v3, p0, Lcom/octo/android/robospice/SpiceManager;->mapPendingRequestToRequestListener:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_16
    :goto_16
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_60

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/octo/android/robospice/request/CachedSpiceRequest;

    .line 787
    .local v0, "cachedSpiceRequest":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    iget-object v3, p0, Lcom/octo/android/robospice/SpiceManager;->mapPendingRequestToRequestListener:Ljava/util/Map;

    invoke-interface {v3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Set;

    .line 788
    .local v2, "setRequestListeners":Ljava/util/Set;, "Ljava/util/Set<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;"
    if-eqz v2, :cond_16

    .line 789
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Removing listeners of pending request : "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, " : "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {v2}, Ljava/util/Set;->size()I

    move-result v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v3, v5}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 790
    iget-object v3, p0, Lcom/octo/android/robospice/SpiceManager;->spiceService:Lcom/octo/android/robospice/SpiceService;

    invoke-virtual {v3, v0, v2}, Lcom/octo/android/robospice/SpiceService;->dontNotifyRequestListenersForRequest(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Collection;)V

    goto :goto_16

    .line 795
    .end local v0    # "cachedSpiceRequest":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "setRequestListeners":Ljava/util/Set;, "Ljava/util/Set<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;"
    :catchall_5d
    move-exception v3

    monitor-exit v4
    :try_end_5f
    .catchall {:try_start_4 .. :try_end_5f} :catchall_5d

    throw v3

    .line 793
    .restart local v1    # "i$":Ljava/util/Iterator;
    :cond_60
    :try_start_60
    iget-object v3, p0, Lcom/octo/android/robospice/SpiceManager;->mapPendingRequestToRequestListener:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->clear()V

    .line 795
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_65
    monitor-exit v4
    :try_end_66
    .catchall {:try_start_60 .. :try_end_66} :catchall_5d

    .line 796
    const-string v3, "Cleared listeners of all pending requests"

    new-array v4, v6, [Ljava/lang/Object;

    invoke-static {v3, v4}, Lroboguice/util/temp/Ln;->v(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 797
    return-void
.end method

.method private removeListenersOfCachedRequestToLaunch(Lcom/octo/android/robospice/request/SpiceRequest;)Z
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/SpiceRequest",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 693
    .local p1, "request":Lcom/octo/android/robospice/request/SpiceRequest;, "Lcom/octo/android/robospice/request/SpiceRequest<*>;"
    iget-object v4, p0, Lcom/octo/android/robospice/SpiceManager;->mapRequestToLaunchToRequestListener:Ljava/util/Map;

    monitor-enter v4

    .line 694
    :try_start_3
    iget-object v3, p0, Lcom/octo/android/robospice/SpiceManager;->mapRequestToLaunchToRequestListener:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/octo/android/robospice/request/CachedSpiceRequest;

    .line 695
    .local v0, "cachedSpiceRequest":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    invoke-direct {p0, v0, p1}, Lcom/octo/android/robospice/SpiceManager;->match(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/SpiceRequest;)Z

    move-result v3

    if-eqz v3, :cond_d

    .line 696
    iget-object v3, p0, Lcom/octo/android/robospice/SpiceManager;->mapRequestToLaunchToRequestListener:Ljava/util/Map;

    invoke-interface {v3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Set;

    .line 697
    .local v2, "setRequestListeners":Ljava/util/Set;, "Ljava/util/Set<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;"
    invoke-interface {v2}, Ljava/util/Set;->clear()V

    .line 698
    const/4 v3, 0x1

    monitor-exit v4

    .line 701
    .end local v0    # "cachedSpiceRequest":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    .end local v2    # "setRequestListeners":Ljava/util/Set;, "Ljava/util/Set<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;"
    :goto_2c
    return v3

    :cond_2d
    const/4 v3, 0x0

    monitor-exit v4

    goto :goto_2c

    .line 702
    .end local v1    # "i$":Ljava/util/Iterator;
    :catchall_30
    move-exception v3

    monitor-exit v4
    :try_end_32
    .catchall {:try_start_3 .. :try_end_32} :catchall_30

    throw v3
.end method

.method private removeListenersOfPendingCachedRequest(Lcom/octo/android/robospice/request/SpiceRequest;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/SpiceRequest",
            "<*>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 714
    .local p1, "request":Lcom/octo/android/robospice/request/SpiceRequest;, "Lcom/octo/android/robospice/request/SpiceRequest<*>;"
    iget-object v4, p0, Lcom/octo/android/robospice/SpiceManager;->mapPendingRequestToRequestListener:Ljava/util/Map;

    monitor-enter v4

    .line 715
    :try_start_3
    iget-object v3, p0, Lcom/octo/android/robospice/SpiceManager;->mapPendingRequestToRequestListener:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/octo/android/robospice/request/CachedSpiceRequest;

    .line 716
    .local v0, "cachedSpiceRequest":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    invoke-direct {p0, v0, p1}, Lcom/octo/android/robospice/SpiceManager;->match(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/SpiceRequest;)Z

    move-result v3

    if-eqz v3, :cond_d

    .line 717
    invoke-virtual {p0}, Lcom/octo/android/robospice/SpiceManager;->waitForServiceToBeBound()V

    .line 718
    iget-object v3, p0, Lcom/octo/android/robospice/SpiceManager;->spiceService:Lcom/octo/android/robospice/SpiceService;

    if-nez v3, :cond_28

    .line 719
    monitor-exit v4

    .line 728
    .end local v0    # "cachedSpiceRequest":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    :goto_27
    return-void

    .line 721
    .restart local v0    # "cachedSpiceRequest":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    :cond_28
    iget-object v3, p0, Lcom/octo/android/robospice/SpiceManager;->mapPendingRequestToRequestListener:Ljava/util/Map;

    invoke-interface {v3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Set;

    .line 722
    .local v2, "setRequestListeners":Ljava/util/Set;, "Ljava/util/Set<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;"
    iget-object v3, p0, Lcom/octo/android/robospice/SpiceManager;->spiceService:Lcom/octo/android/robospice/SpiceService;

    invoke-virtual {v3, v0, v2}, Lcom/octo/android/robospice/SpiceService;->dontNotifyRequestListenersForRequest(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Collection;)V

    .line 723
    iget-object v3, p0, Lcom/octo/android/robospice/SpiceManager;->mapPendingRequestToRequestListener:Ljava/util/Map;

    invoke-interface {v3, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 727
    .end local v0    # "cachedSpiceRequest":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    .end local v2    # "setRequestListeners":Ljava/util/Set;, "Ljava/util/Set<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;"
    :cond_3a
    monitor-exit v4

    goto :goto_27

    .end local v1    # "i$":Ljava/util/Iterator;
    :catchall_3c
    move-exception v3

    monitor-exit v4
    :try_end_3e
    .catchall {:try_start_3 .. :try_end_3e} :catchall_3c

    throw v3
.end method

.method private sendRequestToService(Lcom/octo/android/robospice/request/CachedSpiceRequest;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 278
    .local p1, "spiceRequest":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    iget-object v1, p0, Lcom/octo/android/robospice/SpiceManager;->lockSendRequestsToService:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 280
    if-eqz p1, :cond_72

    :try_start_7
    iget-object v1, p0, Lcom/octo/android/robospice/SpiceManager;->spiceService:Lcom/octo/android/robospice/SpiceService;

    if-eqz v1, :cond_72

    .line 281
    iget-boolean v1, p0, Lcom/octo/android/robospice/SpiceManager;->isStopped:Z

    if-eqz v1, :cond_3c

    .line 282
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Sending request to service without listeners : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v1, v2}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 283
    iget-object v1, p0, Lcom/octo/android/robospice/SpiceManager;->spiceService:Lcom/octo/android/robospice/SpiceService;

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2}, Lcom/octo/android/robospice/SpiceService;->addRequest(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Set;)V
    :try_end_36
    .catchall {:try_start_7 .. :try_end_36} :catchall_6b

    .line 293
    :goto_36
    iget-object v1, p0, Lcom/octo/android/robospice/SpiceManager;->lockSendRequestsToService:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 295
    return-void

    .line 285
    :cond_3c
    :try_start_3c
    iget-object v1, p0, Lcom/octo/android/robospice/SpiceManager;->mapRequestToLaunchToRequestListener:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    .line 286
    .local v0, "listRequestListener":Ljava/util/Set;, "Ljava/util/Set<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;"
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Sending request to service : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v1, v2}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 287
    iget-object v1, p0, Lcom/octo/android/robospice/SpiceManager;->spiceService:Lcom/octo/android/robospice/SpiceService;

    invoke-virtual {v1, p1, v0}, Lcom/octo/android/robospice/SpiceService;->addRequest(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Set;)V
    :try_end_6a
    .catchall {:try_start_3c .. :try_end_6a} :catchall_6b

    goto :goto_36

    .line 293
    .end local v0    # "listRequestListener":Ljava/util/Set;, "Ljava/util/Set<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;"
    :catchall_6b
    move-exception v1

    iget-object v2, p0, Lcom/octo/android/robospice/SpiceManager;->lockSendRequestsToService:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v1

    .line 290
    :cond_72
    :try_start_72
    const-string v1, "Service or request was null"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v1, v2}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I
    :try_end_7a
    .catchall {:try_start_72 .. :try_end_7a} :catchall_6b

    goto :goto_36
.end method

.method private tryToStartService()Z
    .registers 5

    .prologue
    .line 1163
    const/4 v2, 0x0

    .line 1166
    .local v2, "success":Z
    invoke-direct {p0}, Lcom/octo/android/robospice/SpiceManager;->getContextReference()Landroid/content/Context;

    move-result-object v0

    .line 1167
    .local v0, "context":Landroid/content/Context;
    if-eqz v0, :cond_15

    .line 1168
    invoke-direct {p0, v0}, Lcom/octo/android/robospice/SpiceManager;->checkServiceIsProperlyDeclaredInAndroidManifest(Landroid/content/Context;)V

    .line 1169
    new-instance v1, Landroid/content/Intent;

    iget-object v3, p0, Lcom/octo/android/robospice/SpiceManager;->spiceServiceClass:Ljava/lang/Class;

    invoke-direct {v1, v0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1170
    .local v1, "intent":Landroid/content/Intent;
    invoke-virtual {v0, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 1171
    const/4 v2, 0x1

    .line 1174
    .end local v1    # "intent":Landroid/content/Intent;
    :cond_15
    return v2
.end method

.method private unbindFromService()V
    .registers 5

    .prologue
    .line 1212
    invoke-direct {p0}, Lcom/octo/android/robospice/SpiceManager;->getContextReference()Landroid/content/Context;

    move-result-object v0

    .line 1213
    .local v0, "context":Landroid/content/Context;
    if-nez v0, :cond_7

    .line 1237
    :goto_6
    return-void

    .line 1217
    :cond_7
    iget-object v2, p0, Lcom/octo/android/robospice/SpiceManager;->lockAcquireService:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 1219
    iget-object v2, p0, Lcom/octo/android/robospice/SpiceManager;->lockSendRequestsToService:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 1221
    :try_start_11
    const-string v2, "Unbinding from service start."

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v2, v3}, Lroboguice/util/temp/Ln;->v(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 1222
    iget-object v2, p0, Lcom/octo/android/robospice/SpiceManager;->spiceService:Lcom/octo/android/robospice/SpiceService;

    if-eqz v2, :cond_65

    iget-boolean v2, p0, Lcom/octo/android/robospice/SpiceManager;->isUnbinding:Z

    if-nez v2, :cond_65

    .line 1223
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/octo/android/robospice/SpiceManager;->isUnbinding:Z

    .line 1224
    iget-object v2, p0, Lcom/octo/android/robospice/SpiceManager;->spiceService:Lcom/octo/android/robospice/SpiceService;

    iget-object v3, p0, Lcom/octo/android/robospice/SpiceManager;->removerSpiceServiceListener:Lcom/octo/android/robospice/SpiceManager$PendingRequestHandlerSpiceServiceListener;

    invoke-virtual {v2, v3}, Lcom/octo/android/robospice/SpiceService;->removeSpiceServiceListener(Lcom/octo/android/robospice/request/listener/SpiceServiceListener;)V

    .line 1225
    const-string v2, "Unbinding from service."

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v2, v3}, Lroboguice/util/temp/Ln;->v(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 1226
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/octo/android/robospice/SpiceManager;->spiceServiceConnection:Lcom/octo/android/robospice/SpiceManager$SpiceServiceConnection;

    invoke-virtual {v2, v3}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    .line 1227
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unbound from service : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/octo/android/robospice/SpiceManager;->spiceService:Lcom/octo/android/robospice/SpiceService;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v2, v3}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 1228
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/octo/android/robospice/SpiceManager;->spiceService:Lcom/octo/android/robospice/SpiceService;

    .line 1229
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/octo/android/robospice/SpiceManager;->isUnbinding:Z
    :try_end_65
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_65} :catch_70
    .catchall {:try_start_11 .. :try_end_65} :catchall_84

    .line 1234
    :cond_65
    iget-object v2, p0, Lcom/octo/android/robospice/SpiceManager;->lockSendRequestsToService:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 1235
    iget-object v2, p0, Lcom/octo/android/robospice/SpiceManager;->lockAcquireService:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    goto :goto_6

    .line 1231
    :catch_70
    move-exception v1

    .line 1232
    .local v1, "e":Ljava/lang/Exception;
    :try_start_71
    const-string v2, "Could not unbind from service."

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v1, v2, v3}, Lroboguice/util/temp/Ln;->e(Ljava/lang/Throwable;Ljava/lang/Object;[Ljava/lang/Object;)I
    :try_end_79
    .catchall {:try_start_71 .. :try_end_79} :catchall_84

    .line 1234
    iget-object v2, p0, Lcom/octo/android/robospice/SpiceManager;->lockSendRequestsToService:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 1235
    iget-object v2, p0, Lcom/octo/android/robospice/SpiceManager;->lockAcquireService:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    goto :goto_6

    .line 1234
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_84
    move-exception v2

    iget-object v3, p0, Lcom/octo/android/robospice/SpiceManager;->lockSendRequestsToService:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 1235
    iget-object v3, p0, Lcom/octo/android/robospice/SpiceManager;->lockAcquireService:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v2
.end method


# virtual methods
.method public addListenerIfPending(Ljava/lang/Class;Ljava/lang/Object;Lcom/octo/android/robospice/request/listener/PendingRequestListener;)V
    .registers 4
    .param p2, "requestCacheKey"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;",
            "Ljava/lang/Object;",
            "Lcom/octo/android/robospice/request/listener/PendingRequestListener",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 430
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    .local p3, "requestListener":Lcom/octo/android/robospice/request/listener/PendingRequestListener;, "Lcom/octo/android/robospice/request/listener/PendingRequestListener<TT;>;"
    invoke-virtual {p0, p1, p2, p3}, Lcom/octo/android/robospice/SpiceManager;->addListenerIfPending(Ljava/lang/Class;Ljava/lang/Object;Lcom/octo/android/robospice/request/listener/RequestListener;)V

    .line 431
    return-void
.end method

.method public addListenerIfPending(Ljava/lang/Class;Ljava/lang/Object;Lcom/octo/android/robospice/request/listener/RequestListener;)V
    .registers 8
    .param p2, "requestCacheKey"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;",
            "Ljava/lang/Object;",
            "Lcom/octo/android/robospice/request/listener/RequestListener",
            "<TT;>;)V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 404
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    .local p3, "requestListener":Lcom/octo/android/robospice/request/listener/RequestListener;, "Lcom/octo/android/robospice/request/listener/RequestListener<TT;>;"
    new-instance v1, Lcom/octo/android/robospice/SpiceManager$2;

    invoke-direct {v1, p0, p1}, Lcom/octo/android/robospice/SpiceManager$2;-><init>(Lcom/octo/android/robospice/SpiceManager;Ljava/lang/Class;)V

    .line 411
    .local v1, "request":Lcom/octo/android/robospice/request/SpiceRequest;, "Lcom/octo/android/robospice/request/SpiceRequest<TT;>;"
    new-instance v0, Lcom/octo/android/robospice/request/CachedSpiceRequest;

    const-wide/16 v2, -0x1

    invoke-direct {v0, v1, p2, v2, v3}, Lcom/octo/android/robospice/request/CachedSpiceRequest;-><init>(Lcom/octo/android/robospice/request/SpiceRequest;Ljava/lang/Object;J)V

    .line 412
    .local v0, "cachedSpiceRequest":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<TT;>;"
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->setProcessable(Z)V

    .line 413
    invoke-virtual {p0, v0, p3}, Lcom/octo/android/robospice/SpiceManager;->execute(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/listener/RequestListener;)V

    .line 414
    return-void
.end method

.method public addSpiceServiceListener(Lcom/octo/android/robospice/request/listener/SpiceServiceListener;)V
    .registers 3
    .param p1, "spiceServiceListener"    # Lcom/octo/android/robospice/request/listener/SpiceServiceListener;

    .prologue
    .line 870
    new-instance v0, Lcom/octo/android/robospice/command/AddSpiceServiceListenerCommand;

    invoke-direct {v0, p0, p1}, Lcom/octo/android/robospice/command/AddSpiceServiceListenerCommand;-><init>(Lcom/octo/android/robospice/SpiceManager;Lcom/octo/android/robospice/request/listener/SpiceServiceListener;)V

    invoke-virtual {p0, v0}, Lcom/octo/android/robospice/SpiceManager;->executeCommand(Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand;)Ljava/util/concurrent/Future;

    .line 871
    return-void
.end method

.method public cancel(Lcom/octo/android/robospice/request/SpiceRequest;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/SpiceRequest",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 826
    .local p1, "request":Lcom/octo/android/robospice/request/SpiceRequest;, "Lcom/octo/android/robospice/request/SpiceRequest<*>;"
    invoke-virtual {p1}, Lcom/octo/android/robospice/request/SpiceRequest;->cancel()V

    .line 827
    return-void
.end method

.method public cancel(Ljava/lang/Class;Ljava/lang/Object;)V
    .registers 7
    .param p2, "requestCacheKey"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .prologue
    .line 611
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    new-instance v1, Lcom/octo/android/robospice/SpiceManager$4;

    invoke-direct {v1, p0, p1}, Lcom/octo/android/robospice/SpiceManager$4;-><init>(Lcom/octo/android/robospice/SpiceManager;Ljava/lang/Class;)V

    .line 618
    .local v1, "request":Lcom/octo/android/robospice/request/SpiceRequest;, "Lcom/octo/android/robospice/request/SpiceRequest<TT;>;"
    new-instance v0, Lcom/octo/android/robospice/request/CachedSpiceRequest;

    const-wide/16 v2, -0x1

    invoke-direct {v0, v1, p2, v2, v3}, Lcom/octo/android/robospice/request/CachedSpiceRequest;-><init>(Lcom/octo/android/robospice/request/SpiceRequest;Ljava/lang/Object;J)V

    .line 619
    .local v0, "cachedSpiceRequest":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<TT;>;"
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->setProcessable(Z)V

    .line 620
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->setOffline(Z)V

    .line 621
    invoke-virtual {v0}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->cancel()V

    .line 622
    const/4 v2, 0x0

    invoke-virtual {p0, v0, v2}, Lcom/octo/android/robospice/SpiceManager;->execute(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/listener/RequestListener;)V

    .line 623
    return-void
.end method

.method public cancelAllRequests()V
    .registers 3

    .prologue
    .line 833
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceManager;->executorService:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/octo/android/robospice/SpiceManager$7;

    invoke-direct {v1, p0}, Lcom/octo/android/robospice/SpiceManager$7;-><init>(Lcom/octo/android/robospice/SpiceManager;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 839
    return-void
.end method

.method public dontNotifyAnyRequestListeners()V
    .registers 3

    .prologue
    .line 735
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceManager;->executorService:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/octo/android/robospice/SpiceManager$6;

    invoke-direct {v1, p0}, Lcom/octo/android/robospice/SpiceManager$6;-><init>(Lcom/octo/android/robospice/SpiceManager;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 741
    return-void
.end method

.method protected dontNotifyAnyRequestListenersInternal()V
    .registers 8

    .prologue
    .line 750
    iget-object v4, p0, Lcom/octo/android/robospice/SpiceManager;->lockSendRequestsToService:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v4}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 752
    :try_start_5
    iget-object v4, p0, Lcom/octo/android/robospice/SpiceManager;->spiceService:Lcom/octo/android/robospice/SpiceService;
    :try_end_7
    .catch Ljava/lang/InterruptedException; {:try_start_5 .. :try_end_7} :catch_6e
    .catchall {:try_start_5 .. :try_end_7} :catchall_95

    if-nez v4, :cond_f

    .line 773
    iget-object v4, p0, Lcom/octo/android/robospice/SpiceManager;->lockSendRequestsToService:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v4}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 775
    :goto_e
    return-void

    .line 755
    :cond_f
    :try_start_f
    iget-object v5, p0, Lcom/octo/android/robospice/SpiceManager;->mapRequestToLaunchToRequestListener:Ljava/util/Map;

    monitor-enter v5
    :try_end_12
    .catch Ljava/lang/InterruptedException; {:try_start_f .. :try_end_12} :catch_6e
    .catchall {:try_start_f .. :try_end_12} :catchall_95

    .line 756
    :try_start_12
    iget-object v4, p0, Lcom/octo/android/robospice/SpiceManager;->mapRequestToLaunchToRequestListener:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_7d

    .line 757
    iget-object v4, p0, Lcom/octo/android/robospice/SpiceManager;->mapRequestToLaunchToRequestListener:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_24
    :goto_24
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_7d

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/octo/android/robospice/request/CachedSpiceRequest;

    .line 758
    .local v0, "cachedSpiceRequest":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    iget-object v4, p0, Lcom/octo/android/robospice/SpiceManager;->mapRequestToLaunchToRequestListener:Ljava/util/Map;

    invoke-interface {v4, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Set;

    .line 759
    .local v3, "setRequestListeners":Ljava/util/Set;, "Ljava/util/Set<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;"
    if-eqz v3, :cond_24

    .line 760
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Removing listeners of request to launch : "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, " : "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {v3}, Ljava/util/Set;->size()I

    move-result v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v6, 0x0

    new-array v6, v6, [Ljava/lang/Object;

    invoke-static {v4, v6}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 761
    iget-object v4, p0, Lcom/octo/android/robospice/SpiceManager;->spiceService:Lcom/octo/android/robospice/SpiceService;

    invoke-virtual {v4, v0, v3}, Lcom/octo/android/robospice/SpiceService;->dontNotifyRequestListenersForRequest(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Collection;)V

    goto :goto_24

    .line 766
    .end local v0    # "cachedSpiceRequest":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "setRequestListeners":Ljava/util/Set;, "Ljava/util/Set<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;"
    :catchall_6b
    move-exception v4

    monitor-exit v5
    :try_end_6d
    .catchall {:try_start_12 .. :try_end_6d} :catchall_6b

    :try_start_6d
    throw v4
    :try_end_6e
    .catch Ljava/lang/InterruptedException; {:try_start_6d .. :try_end_6e} :catch_6e
    .catchall {:try_start_6d .. :try_end_6e} :catchall_95

    .line 770
    :catch_6e
    move-exception v1

    .line 771
    .local v1, "e":Ljava/lang/InterruptedException;
    :try_start_6f
    const-string v4, "Interrupted while removing listeners."

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v1, v4, v5}, Lroboguice/util/temp/Ln;->e(Ljava/lang/Throwable;Ljava/lang/Object;[Ljava/lang/Object;)I
    :try_end_77
    .catchall {:try_start_6f .. :try_end_77} :catchall_95

    .line 773
    iget-object v4, p0, Lcom/octo/android/robospice/SpiceManager;->lockSendRequestsToService:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v4}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    goto :goto_e

    .line 765
    .end local v1    # "e":Ljava/lang/InterruptedException;
    :cond_7d
    :try_start_7d
    iget-object v4, p0, Lcom/octo/android/robospice/SpiceManager;->mapRequestToLaunchToRequestListener:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->clear()V

    .line 766
    monitor-exit v5
    :try_end_83
    .catchall {:try_start_7d .. :try_end_83} :catchall_6b

    .line 767
    :try_start_83
    const-string v4, "Cleared listeners of all requests to launch"

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v4, v5}, Lroboguice/util/temp/Ln;->v(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 769
    invoke-direct {p0}, Lcom/octo/android/robospice/SpiceManager;->removeListenersOfAllPendingCachedRequests()V
    :try_end_8e
    .catch Ljava/lang/InterruptedException; {:try_start_83 .. :try_end_8e} :catch_6e
    .catchall {:try_start_83 .. :try_end_8e} :catchall_95

    .line 773
    iget-object v4, p0, Lcom/octo/android/robospice/SpiceManager;->lockSendRequestsToService:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v4}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    goto/16 :goto_e

    :catchall_95
    move-exception v4

    iget-object v5, p0, Lcom/octo/android/robospice/SpiceManager;->lockSendRequestsToService:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v5}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v4
.end method

.method public dontNotifyRequestListenersForRequest(Lcom/octo/android/robospice/request/SpiceRequest;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/SpiceRequest",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 644
    .local p1, "request":Lcom/octo/android/robospice/request/SpiceRequest;, "Lcom/octo/android/robospice/request/SpiceRequest<*>;"
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceManager;->executorService:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/octo/android/robospice/SpiceManager$5;

    invoke-direct {v1, p0, p1}, Lcom/octo/android/robospice/SpiceManager$5;-><init>(Lcom/octo/android/robospice/SpiceManager;Lcom/octo/android/robospice/request/SpiceRequest;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 650
    return-void
.end method

.method protected dontNotifyRequestListenersForRequestInternal(Lcom/octo/android/robospice/request/SpiceRequest;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/SpiceRequest",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 662
    .local p1, "request":Lcom/octo/android/robospice/request/SpiceRequest;, "Lcom/octo/android/robospice/request/SpiceRequest<*>;"
    iget-object v2, p0, Lcom/octo/android/robospice/SpiceManager;->lockSendRequestsToService:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 665
    :try_start_5
    invoke-direct {p0, p1}, Lcom/octo/android/robospice/SpiceManager;->removeListenersOfCachedRequestToLaunch(Lcom/octo/android/robospice/request/SpiceRequest;)Z

    move-result v1

    .line 666
    .local v1, "requestNotPassedToServiceYet":Z
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Removed from requests to launch list : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v2, v3}, Lroboguice/util/temp/Ln;->v(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 671
    if-nez v1, :cond_2f

    .line 672
    invoke-direct {p0, p1}, Lcom/octo/android/robospice/SpiceManager;->removeListenersOfPendingCachedRequest(Lcom/octo/android/robospice/request/SpiceRequest;)V

    .line 673
    const-string v2, "Removed from pending requests list"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v2, v3}, Lroboguice/util/temp/Ln;->v(Ljava/lang/Object;[Ljava/lang/Object;)I
    :try_end_2f
    .catch Ljava/lang/InterruptedException; {:try_start_5 .. :try_end_2f} :catch_35
    .catchall {:try_start_5 .. :try_end_2f} :catchall_44

    .line 679
    :cond_2f
    iget-object v2, p0, Lcom/octo/android/robospice/SpiceManager;->lockSendRequestsToService:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 681
    .end local v1    # "requestNotPassedToServiceYet":Z
    :goto_34
    return-void

    .line 676
    :catch_35
    move-exception v0

    .line 677
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_36
    const-string v2, "Interrupted while removing listeners."

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v0, v2, v3}, Lroboguice/util/temp/Ln;->e(Ljava/lang/Throwable;Ljava/lang/Object;[Ljava/lang/Object;)I
    :try_end_3e
    .catchall {:try_start_36 .. :try_end_3e} :catchall_44

    .line 679
    iget-object v2, p0, Lcom/octo/android/robospice/SpiceManager;->lockSendRequestsToService:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    goto :goto_34

    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catchall_44
    move-exception v2

    iget-object v3, p0, Lcom/octo/android/robospice/SpiceManager;->lockSendRequestsToService:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v2
.end method

.method public dumpState()V
    .registers 3

    .prologue
    .line 1035
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceManager;->executorService:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/octo/android/robospice/SpiceManager$8;

    invoke-direct {v1, p0}, Lcom/octo/android/robospice/SpiceManager$8;-><init>(Lcom/octo/android/robospice/SpiceManager;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 1063
    return-void
.end method

.method public execute(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/listener/RequestListener;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<TT;>;",
            "Lcom/octo/android/robospice/request/listener/RequestListener",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 488
    .local p1, "cachedSpiceRequest":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<TT;>;"
    .local p2, "requestListener":Lcom/octo/android/robospice/request/listener/RequestListener;, "Lcom/octo/android/robospice/request/listener/RequestListener<TT;>;"
    invoke-direct {p0, p1, p2}, Lcom/octo/android/robospice/SpiceManager;->addRequestListenerToListOfRequestListeners(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/listener/RequestListener;)V

    .line 489
    const-string v0, "adding request to request queue"

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 490
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceManager;->requestQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v0, p1}, Ljava/util/concurrent/BlockingQueue;->add(Ljava/lang/Object;)Z

    .line 491
    return-void
.end method

.method public execute(Lcom/octo/android/robospice/request/SpiceRequest;Lcom/octo/android/robospice/request/listener/RequestListener;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/octo/android/robospice/request/SpiceRequest",
            "<TT;>;",
            "Lcom/octo/android/robospice/request/listener/RequestListener",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 443
    .local p1, "request":Lcom/octo/android/robospice/request/SpiceRequest;, "Lcom/octo/android/robospice/request/SpiceRequest<TT;>;"
    .local p2, "requestListener":Lcom/octo/android/robospice/request/listener/RequestListener;, "Lcom/octo/android/robospice/request/listener/RequestListener<TT;>;"
    new-instance v0, Lcom/octo/android/robospice/request/CachedSpiceRequest;

    const/4 v1, 0x0

    const-wide/16 v2, 0x0

    invoke-direct {v0, p1, v1, v2, v3}, Lcom/octo/android/robospice/request/CachedSpiceRequest;-><init>(Lcom/octo/android/robospice/request/SpiceRequest;Ljava/lang/Object;J)V

    .line 444
    .local v0, "cachedSpiceRequest":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<TT;>;"
    invoke-virtual {p0, v0, p2}, Lcom/octo/android/robospice/SpiceManager;->execute(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/listener/RequestListener;)V

    .line 445
    return-void
.end method

.method public execute(Lcom/octo/android/robospice/request/SpiceRequest;Ljava/lang/Object;JLcom/octo/android/robospice/request/listener/RequestListener;)V
    .registers 7
    .param p2, "requestCacheKey"    # Ljava/lang/Object;
    .param p3, "cacheExpiryDuration"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/octo/android/robospice/request/SpiceRequest",
            "<TT;>;",
            "Ljava/lang/Object;",
            "J",
            "Lcom/octo/android/robospice/request/listener/RequestListener",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 473
    .local p1, "request":Lcom/octo/android/robospice/request/SpiceRequest;, "Lcom/octo/android/robospice/request/SpiceRequest<TT;>;"
    .local p5, "requestListener":Lcom/octo/android/robospice/request/listener/RequestListener;, "Lcom/octo/android/robospice/request/listener/RequestListener<TT;>;"
    new-instance v0, Lcom/octo/android/robospice/request/CachedSpiceRequest;

    invoke-direct {v0, p1, p2, p3, p4}, Lcom/octo/android/robospice/request/CachedSpiceRequest;-><init>(Lcom/octo/android/robospice/request/SpiceRequest;Ljava/lang/Object;J)V

    .line 474
    .local v0, "cachedSpiceRequest":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<TT;>;"
    invoke-virtual {p0, v0, p5}, Lcom/octo/android/robospice/SpiceManager;->execute(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/listener/RequestListener;)V

    .line 475
    return-void
.end method

.method protected executeCommand(Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand;)Ljava/util/concurrent/Future;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand",
            "<TT;>;)",
            "Ljava/util/concurrent/Future",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 1277
    .local p1, "spiceManagerCommand":Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand;, "Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand<TT;>;"
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceManager;->executorService:Ljava/util/concurrent/ExecutorService;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/octo/android/robospice/SpiceManager;->executorService:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->isShutdown()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 1278
    :cond_c
    const/4 v0, 0x0

    .line 1280
    :goto_d
    return-object v0

    :cond_e
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceManager;->executorService:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0, p1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object v0

    goto :goto_d
.end method

.method public getAllCacheKeys(Ljava/lang/Class;)Ljava/util/concurrent/Future;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/util/concurrent/Future",
            "<",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 878
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v0, Lcom/octo/android/robospice/command/GetAllCacheKeysCommand;

    invoke-direct {v0, p0, p1}, Lcom/octo/android/robospice/command/GetAllCacheKeysCommand;-><init>(Lcom/octo/android/robospice/SpiceManager;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lcom/octo/android/robospice/SpiceManager;->executeCommand(Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand;)Ljava/util/concurrent/Future;

    move-result-object v0

    return-object v0
.end method

.method public getAllDataFromCache(Ljava/lang/Class;)Ljava/util/concurrent/Future;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Ljava/util/concurrent/Future",
            "<",
            "Ljava/util/List",
            "<TT;>;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheLoadingException;
        }
    .end annotation

    .prologue
    .line 882
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    new-instance v0, Lcom/octo/android/robospice/command/GetAllDataFromCacheCommand;

    invoke-direct {v0, p0, p1}, Lcom/octo/android/robospice/command/GetAllDataFromCacheCommand;-><init>(Lcom/octo/android/robospice/SpiceManager;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lcom/octo/android/robospice/SpiceManager;->executeCommand(Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand;)Ljava/util/concurrent/Future;

    move-result-object v0

    return-object v0
.end method

.method public getDataFromCache(Ljava/lang/Class;Ljava/lang/Object;)Ljava/util/concurrent/Future;
    .registers 4
    .param p2, "cacheKey"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/concurrent/Future",
            "<TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheLoadingException;
        }
    .end annotation

    .prologue
    .line 905
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    new-instance v0, Lcom/octo/android/robospice/command/GetDataFromCacheCommand;

    invoke-direct {v0, p0, p1, p2}, Lcom/octo/android/robospice/command/GetDataFromCacheCommand;-><init>(Lcom/octo/android/robospice/SpiceManager;Ljava/lang/Class;Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lcom/octo/android/robospice/SpiceManager;->executeCommand(Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand;)Ljava/util/concurrent/Future;

    move-result-object v0

    return-object v0
.end method

.method public getDateOfDataInCache(Ljava/lang/Class;Ljava/lang/Object;)Ljava/util/concurrent/Future;
    .registers 4
    .param p2, "cacheKey"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/concurrent/Future",
            "<",
            "Ljava/util/Date;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheCreationException;
        }
    .end annotation

    .prologue
    .line 966
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v0, Lcom/octo/android/robospice/command/GetDateOfDataInCacheCommand;

    invoke-direct {v0, p0, p1, p2}, Lcom/octo/android/robospice/command/GetDateOfDataInCacheCommand;-><init>(Lcom/octo/android/robospice/SpiceManager;Ljava/lang/Class;Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lcom/octo/android/robospice/SpiceManager;->executeCommand(Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand;)Ljava/util/concurrent/Future;

    move-result-object v0

    return-object v0
.end method

.method public getFromCache(Ljava/lang/Class;Ljava/lang/Object;JLcom/octo/android/robospice/request/listener/RequestListener;)V
    .registers 9
    .param p2, "requestCacheKey"    # Ljava/lang/Object;
    .param p3, "cacheExpiryDuration"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;",
            "Ljava/lang/Object;",
            "J",
            "Lcom/octo/android/robospice/request/listener/RequestListener",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 382
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    .local p5, "requestListener":Lcom/octo/android/robospice/request/listener/RequestListener;, "Lcom/octo/android/robospice/request/listener/RequestListener<TT;>;"
    new-instance v1, Lcom/octo/android/robospice/SpiceManager$1;

    invoke-direct {v1, p0, p1}, Lcom/octo/android/robospice/SpiceManager$1;-><init>(Lcom/octo/android/robospice/SpiceManager;Ljava/lang/Class;)V

    .line 394
    .local v1, "request":Lcom/octo/android/robospice/request/SpiceRequest;, "Lcom/octo/android/robospice/request/SpiceRequest<TT;>;"
    new-instance v0, Lcom/octo/android/robospice/request/CachedSpiceRequest;

    invoke-direct {v0, v1, p2, p3, p4}, Lcom/octo/android/robospice/request/CachedSpiceRequest;-><init>(Lcom/octo/android/robospice/request/SpiceRequest;Ljava/lang/Object;J)V

    .line 395
    .local v0, "cachedSpiceRequest":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<TT;>;"
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->setOffline(Z)V

    .line 396
    invoke-virtual {p0, v0, p5}, Lcom/octo/android/robospice/SpiceManager;->execute(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/listener/RequestListener;)V

    .line 397
    return-void
.end method

.method public getFromCacheAndLoadFromNetworkIfExpired(Lcom/octo/android/robospice/request/SpiceRequest;Ljava/lang/Object;JLcom/octo/android/robospice/request/listener/RequestListener;)V
    .registers 8
    .param p2, "requestCacheKey"    # Ljava/lang/Object;
    .param p3, "cacheExpiryDuration"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/octo/android/robospice/request/SpiceRequest",
            "<TT;>;",
            "Ljava/lang/Object;",
            "J",
            "Lcom/octo/android/robospice/request/listener/RequestListener",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 519
    .local p1, "request":Lcom/octo/android/robospice/request/SpiceRequest;, "Lcom/octo/android/robospice/request/SpiceRequest<TT;>;"
    .local p5, "requestListener":Lcom/octo/android/robospice/request/listener/RequestListener;, "Lcom/octo/android/robospice/request/listener/RequestListener<TT;>;"
    new-instance v0, Lcom/octo/android/robospice/request/CachedSpiceRequest;

    invoke-direct {v0, p1, p2, p3, p4}, Lcom/octo/android/robospice/request/CachedSpiceRequest;-><init>(Lcom/octo/android/robospice/request/SpiceRequest;Ljava/lang/Object;J)V

    .line 520
    .local v0, "cachedSpiceRequest":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<TT;>;"
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->setAcceptingDirtyCache(Z)V

    .line 521
    invoke-virtual {p0, v0, p5}, Lcom/octo/android/robospice/SpiceManager;->execute(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/listener/RequestListener;)V

    .line 522
    return-void
.end method

.method public getPendingRequestCount()I
    .registers 2

    .prologue
    .line 237
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceManager;->mapPendingRequestToRequestListener:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    return v0
.end method

.method public getRequestToLaunchCount()I
    .registers 2

    .prologue
    .line 229
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceManager;->mapRequestToLaunchToRequestListener:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    return v0
.end method

.method protected getThreadCount()I
    .registers 2

    .prologue
    .line 189
    const/4 v0, 0x3

    return v0
.end method

.method protected isBound()Z
    .registers 2

    .prologue
    .line 1159
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceManager;->spiceService:Lcom/octo/android/robospice/SpiceService;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public isDataInCache(Ljava/lang/Class;Ljava/lang/Object;J)Ljava/util/concurrent/Future;
    .registers 11
    .param p2, "cacheKey"    # Ljava/lang/Object;
    .param p3, "cacheExpiryDuration"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Object;",
            "J)",
            "Ljava/util/concurrent/Future",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheCreationException;
        }
    .end annotation

    .prologue
    .line 949
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v0, Lcom/octo/android/robospice/command/IsDataInCacheCommand;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-wide v4, p3

    invoke-direct/range {v0 .. v5}, Lcom/octo/android/robospice/command/IsDataInCacheCommand;-><init>(Lcom/octo/android/robospice/SpiceManager;Ljava/lang/Class;Ljava/lang/Object;J)V

    invoke-virtual {p0, v0}, Lcom/octo/android/robospice/SpiceManager;->executeCommand(Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand;)Ljava/util/concurrent/Future;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized isStarted()Z
    .registers 2

    .prologue
    .line 221
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcom/octo/android/robospice/SpiceManager;->isStopped:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_a

    if-nez v0, :cond_8

    const/4 v0, 0x1

    :goto_6
    monitor-exit p0

    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_6

    :catchall_a
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public putDataInCache(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/concurrent/Future;
    .registers 4
    .param p1, "cacheKey"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "TT;)",
            "Ljava/util/concurrent/Future",
            "<TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheSavingException;,
            Lcom/octo/android/robospice/persistence/exception/CacheCreationException;
        }
    .end annotation

    .prologue
    .line 926
    .local p2, "data":Ljava/lang/Object;, "TT;"
    new-instance v0, Lcom/octo/android/robospice/command/PutDataInCacheCommand;

    invoke-direct {v0, p0, p2, p1}, Lcom/octo/android/robospice/command/PutDataInCacheCommand;-><init>(Lcom/octo/android/robospice/SpiceManager;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lcom/octo/android/robospice/SpiceManager;->executeCommand(Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand;)Ljava/util/concurrent/Future;

    move-result-object v0

    return-object v0
.end method

.method public putInCache(Ljava/lang/Class;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 5
    .param p2, "requestCacheKey"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<-TT;>;",
            "Ljava/lang/Object;",
            "TT;)V"
        }
    .end annotation

    .prologue
    .line 563
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<-TT;>;"
    .local p3, "data":Ljava/lang/Object;, "TT;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/octo/android/robospice/SpiceManager;->putInCache(Ljava/lang/Class;Ljava/lang/Object;Ljava/lang/Object;Lcom/octo/android/robospice/request/listener/RequestListener;)V

    .line 564
    return-void
.end method

.method public putInCache(Ljava/lang/Class;Ljava/lang/Object;Ljava/lang/Object;Lcom/octo/android/robospice/request/listener/RequestListener;)V
    .registers 9
    .param p2, "requestCacheKey"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            "T:TU;>(",
            "Ljava/lang/Class",
            "<TU;>;",
            "Ljava/lang/Object;",
            "TT;",
            "Lcom/octo/android/robospice/request/listener/RequestListener",
            "<TU;>;)V"
        }
    .end annotation

    .prologue
    .line 539
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TU;>;"
    .local p3, "data":Ljava/lang/Object;, "TT;"
    .local p4, "listener":Lcom/octo/android/robospice/request/listener/RequestListener;, "Lcom/octo/android/robospice/request/listener/RequestListener<TU;>;"
    new-instance v1, Lcom/octo/android/robospice/SpiceManager$3;

    invoke-direct {v1, p0, p1, p3}, Lcom/octo/android/robospice/SpiceManager$3;-><init>(Lcom/octo/android/robospice/SpiceManager;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 545
    .local v1, "spiceRequest":Lcom/octo/android/robospice/request/SpiceRequest;, "Lcom/octo/android/robospice/request/SpiceRequest<TU;>;"
    new-instance v0, Lcom/octo/android/robospice/request/CachedSpiceRequest;

    const-wide/16 v2, -0x1

    invoke-direct {v0, v1, p2, v2, v3}, Lcom/octo/android/robospice/request/CachedSpiceRequest;-><init>(Lcom/octo/android/robospice/request/SpiceRequest;Ljava/lang/Object;J)V

    .line 546
    .local v0, "cachedSpiceRequest":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<TU;>;"
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->setOffline(Z)V

    .line 547
    invoke-virtual {p0, v0, p4}, Lcom/octo/android/robospice/SpiceManager;->execute(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/listener/RequestListener;)V

    .line 548
    return-void
.end method

.method public putInCache(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 4
    .param p1, "requestCacheKey"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "TT;)V"
        }
    .end annotation

    .prologue
    .line 597
    .local p2, "data":Ljava/lang/Object;, "TT;"
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p0, v0, p1, p2}, Lcom/octo/android/robospice/SpiceManager;->putInCache(Ljava/lang/Class;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 598
    return-void
.end method

.method public putInCache(Ljava/lang/Object;Ljava/lang/Object;Lcom/octo/android/robospice/request/listener/RequestListener;)V
    .registers 5
    .param p1, "requestCacheKey"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "TT;",
            "Lcom/octo/android/robospice/request/listener/RequestListener",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 581
    .local p2, "data":Ljava/lang/Object;, "TT;"
    .local p3, "listener":Lcom/octo/android/robospice/request/listener/RequestListener;, "Lcom/octo/android/robospice/request/listener/RequestListener<TT;>;"
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p0, v0, p1, p2, p3}, Lcom/octo/android/robospice/SpiceManager;->putInCache(Ljava/lang/Class;Ljava/lang/Object;Ljava/lang/Object;Lcom/octo/android/robospice/request/listener/RequestListener;)V

    .line 582
    return-void
.end method

.method public removeAllDataFromCache()Ljava/util/concurrent/Future;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/concurrent/Future",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 1001
    new-instance v0, Lcom/octo/android/robospice/command/RemoveAllDataFromCacheCommand;

    invoke-direct {v0, p0}, Lcom/octo/android/robospice/command/RemoveAllDataFromCacheCommand;-><init>(Lcom/octo/android/robospice/SpiceManager;)V

    invoke-virtual {p0, v0}, Lcom/octo/android/robospice/SpiceManager;->executeCommand(Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand;)Ljava/util/concurrent/Future;

    move-result-object v0

    return-object v0
.end method

.method public removeDataFromCache(Ljava/lang/Class;)Ljava/util/concurrent/Future;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Ljava/util/concurrent/Future",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 990
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    if-nez p1, :cond_a

    .line 991
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Clazz must be non null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 993
    :cond_a
    new-instance v0, Lcom/octo/android/robospice/command/RemoveDataClassFromCacheCommand;

    invoke-direct {v0, p0, p1}, Lcom/octo/android/robospice/command/RemoveDataClassFromCacheCommand;-><init>(Lcom/octo/android/robospice/SpiceManager;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lcom/octo/android/robospice/SpiceManager;->executeCommand(Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand;)Ljava/util/concurrent/Future;

    move-result-object v0

    return-object v0
.end method

.method public removeDataFromCache(Ljava/lang/Class;Ljava/lang/Object;)Ljava/util/concurrent/Future;
    .registers 5
    .param p2, "cacheKey"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/concurrent/Future",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 977
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    if-eqz p1, :cond_4

    if-nez p2, :cond_c

    .line 978
    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Both parameters must be non null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 981
    :cond_c
    new-instance v0, Lcom/octo/android/robospice/command/RemoveDataFromCacheCommand;

    invoke-direct {v0, p0, p1, p2}, Lcom/octo/android/robospice/command/RemoveDataFromCacheCommand;-><init>(Lcom/octo/android/robospice/SpiceManager;Ljava/lang/Class;Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lcom/octo/android/robospice/SpiceManager;->executeCommand(Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand;)Ljava/util/concurrent/Future;

    move-result-object v0

    return-object v0
.end method

.method public removeSpiceServiceListener(Lcom/octo/android/robospice/request/listener/SpiceServiceListener;)V
    .registers 3
    .param p1, "spiceServiceListener"    # Lcom/octo/android/robospice/request/listener/SpiceServiceListener;

    .prologue
    .line 874
    new-instance v0, Lcom/octo/android/robospice/command/RemoveSpiceServiceListenerCommand;

    invoke-direct {v0, p0, p1}, Lcom/octo/android/robospice/command/RemoveSpiceServiceListenerCommand;-><init>(Lcom/octo/android/robospice/SpiceManager;Lcom/octo/android/robospice/request/listener/SpiceServiceListener;)V

    invoke-virtual {p0, v0}, Lcom/octo/android/robospice/SpiceManager;->executeCommand(Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand;)Ljava/util/concurrent/Future;

    .line 875
    return-void
.end method

.method public run()V
    .registers 8

    .prologue
    const/4 v4, 0x1

    const/4 v6, 0x0

    .line 247
    invoke-direct {p0}, Lcom/octo/android/robospice/SpiceManager;->tryToStartService()Z

    move-result v2

    if-nez v2, :cond_12

    .line 248
    const-string v2, "Service was not started as Activity died prematurely"

    new-array v3, v6, [Ljava/lang/Object;

    invoke-static {v2, v3}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 249
    iput-boolean v4, p0, Lcom/octo/android/robospice/SpiceManager;->isStopped:Z

    .line 275
    :goto_11
    return-void

    .line 253
    :cond_12
    invoke-direct {p0}, Lcom/octo/android/robospice/SpiceManager;->bindToService()V

    .line 256
    :try_start_15
    invoke-virtual {p0}, Lcom/octo/android/robospice/SpiceManager;->waitForServiceToBeBound()V

    .line 257
    iget-object v2, p0, Lcom/octo/android/robospice/SpiceManager;->spiceService:Lcom/octo/android/robospice/SpiceService;

    if-nez v2, :cond_2e

    .line 258
    const-string v2, "No spice service bound."

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v2, v3}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I
    :try_end_24
    .catch Ljava/lang/InterruptedException; {:try_start_15 .. :try_end_24} :catch_25

    goto :goto_11

    .line 272
    :catch_25
    move-exception v0

    .line 273
    .local v0, "e":Ljava/lang/InterruptedException;
    const-string v2, "Interrupted while waiting for acquiring service."

    new-array v3, v6, [Ljava/lang/Object;

    invoke-static {v0, v2, v3}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Throwable;Ljava/lang/Object;[Ljava/lang/Object;)I

    goto :goto_11

    .line 261
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :cond_2e
    :goto_2e
    :try_start_2e
    iget-object v2, p0, Lcom/octo/android/robospice/SpiceManager;->requestQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v2}, Ljava/util/concurrent/BlockingQueue;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_40

    iget-boolean v2, p0, Lcom/octo/android/robospice/SpiceManager;->isStopped:Z

    if-nez v2, :cond_55

    invoke-static {}, Ljava/lang/Thread;->interrupted()Z
    :try_end_3d
    .catch Ljava/lang/InterruptedException; {:try_start_2e .. :try_end_3d} :catch_25

    move-result v2

    if-nez v2, :cond_55

    .line 263
    :cond_40
    :try_start_40
    iget-object v2, p0, Lcom/octo/android/robospice/SpiceManager;->requestQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v2}, Ljava/util/concurrent/BlockingQueue;->take()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/octo/android/robospice/request/CachedSpiceRequest;

    invoke-direct {p0, v2}, Lcom/octo/android/robospice/SpiceManager;->sendRequestToService(Lcom/octo/android/robospice/request/CachedSpiceRequest;)V
    :try_end_4b
    .catch Ljava/lang/InterruptedException; {:try_start_40 .. :try_end_4b} :catch_4c

    goto :goto_2e

    .line 264
    :catch_4c
    move-exception v1

    .line 265
    .local v1, "ex":Ljava/lang/InterruptedException;
    :try_start_4d
    const-string v2, "Interrupted while waiting for new request."

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v2, v3}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 271
    .end local v1    # "ex":Ljava/lang/InterruptedException;
    :cond_55
    const-string v2, "SpiceManager request runner terminated. Requests count: %d, stopped %b, interrupted %b"

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/octo/android/robospice/SpiceManager;->requestQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v5}, Ljava/util/concurrent/BlockingQueue;->size()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    iget-boolean v5, p0, Lcom/octo/android/robospice/SpiceManager;->isStopped:Z

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x2

    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v5

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I
    :try_end_7e
    .catch Ljava/lang/InterruptedException; {:try_start_4d .. :try_end_7e} :catch_25

    goto :goto_11
.end method

.method public setFailOnCacheError(Z)V
    .registers 3
    .param p1, "failOnCacheError"    # Z

    .prologue
    .line 1011
    new-instance v0, Lcom/octo/android/robospice/command/SetFailOnCacheErrorCommand;

    invoke-direct {v0, p0, p1}, Lcom/octo/android/robospice/command/SetFailOnCacheErrorCommand;-><init>(Lcom/octo/android/robospice/SpiceManager;Z)V

    invoke-virtual {p0, v0}, Lcom/octo/android/robospice/SpiceManager;->executeCommand(Lcom/octo/android/robospice/SpiceManager$SpiceManagerCommand;)Ljava/util/concurrent/Future;

    .line 1012
    return-void
.end method

.method public declared-synchronized shouldStop()V
    .registers 4

    .prologue
    .line 306
    monitor-enter p0

    const-wide/16 v1, 0x1f4

    :try_start_3
    invoke-virtual {p0, v1, v2}, Lcom/octo/android/robospice/SpiceManager;->shouldStopAndJoin(J)V
    :try_end_6
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_6} :catch_8
    .catchall {:try_start_3 .. :try_end_6} :catchall_12

    .line 310
    :goto_6
    monitor-exit p0

    return-void

    .line 307
    :catch_8
    move-exception v0

    .line 308
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_9
    const-string v1, "Exception when joining the runner that was stopping."

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v0, v1, v2}, Lroboguice/util/temp/Ln;->e(Ljava/lang/Throwable;Ljava/lang/Object;[Ljava/lang/Object;)I
    :try_end_11
    .catchall {:try_start_9 .. :try_end_11} :catchall_12

    goto :goto_6

    .line 306
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catchall_12
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized shouldStopAndJoin(J)V
    .registers 14
    .param p1, "timeOut"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 322
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lcom/octo/android/robospice/SpiceManager;->isStarted()Z

    move-result v5

    if-nez v5, :cond_12

    .line 323
    new-instance v5, Ljava/lang/IllegalStateException;

    const-string v6, "Not started yet"

    invoke-direct {v5, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_f
    .catchall {:try_start_1 .. :try_end_f} :catchall_f

    .line 322
    :catchall_f
    move-exception v5

    monitor-exit p0

    throw v5

    .line 326
    :cond_12
    :try_start_12
    const-string v5, "SpiceManager stopping. Joining"

    const/4 v6, 0x0

    new-array v6, v6, [Ljava/lang/Object;

    invoke-static {v5, v6}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 327
    const/4 v5, 0x1

    iput-boolean v5, p0, Lcom/octo/android/robospice/SpiceManager;->isStopped:Z

    .line 328
    invoke-virtual {p0}, Lcom/octo/android/robospice/SpiceManager;->dontNotifyAnyRequestListenersInternal()V

    .line 329
    iget-object v5, p0, Lcom/octo/android/robospice/SpiceManager;->requestQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v5}, Ljava/util/concurrent/BlockingQueue;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_2d

    .line 330
    iget-object v5, p0, Lcom/octo/android/robospice/SpiceManager;->runner:Ljava/lang/Thread;

    invoke-virtual {v5}, Ljava/lang/Thread;->interrupt()V

    .line 332
    :cond_2d
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    :try_end_30
    .catchall {:try_start_12 .. :try_end_30} :catchall_f

    move-result-wide v3

    .line 334
    .local v3, "start":J
    :try_start_31
    iget-object v5, p0, Lcom/octo/android/robospice/SpiceManager;->runner:Ljava/lang/Thread;

    invoke-virtual {v5, p1, p2}, Ljava/lang/Thread;->join(J)V
    :try_end_36
    .catch Ljava/lang/InterruptedException; {:try_start_31 .. :try_end_36} :catch_65
    .catchall {:try_start_31 .. :try_end_36} :catchall_67

    .line 338
    :try_start_36
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 339
    .local v1, "end":J
    const-string v5, "Runner join time (ms) when should stop %d"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    sub-long v8, v1, v3

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 341
    invoke-direct {p0}, Lcom/octo/android/robospice/SpiceManager;->unbindFromService()V

    .line 342
    const/4 v5, 0x0

    iput-object v5, p0, Lcom/octo/android/robospice/SpiceManager;->runner:Ljava/lang/Thread;

    .line 343
    iget-object v5, p0, Lcom/octo/android/robospice/SpiceManager;->executorService:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v5}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    .line 344
    iget-object v5, p0, Lcom/octo/android/robospice/SpiceManager;->contextWeakReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v5}, Ljava/lang/ref/WeakReference;->clear()V

    .line 345
    const-string v5, "SpiceManager stopped."

    const/4 v6, 0x0

    new-array v6, v6, [Ljava/lang/Object;

    invoke-static {v5, v6}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I
    :try_end_63
    .catchall {:try_start_36 .. :try_end_63} :catchall_f

    .line 346
    monitor-exit p0

    return-void

    .line 335
    .end local v1    # "end":J
    :catch_65
    move-exception v0

    .line 336
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_66
    throw v0
    :try_end_67
    .catchall {:try_start_66 .. :try_end_67} :catchall_67

    .line 338
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catchall_67
    move-exception v5

    :try_start_68
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 339
    .restart local v1    # "end":J
    const-string v6, "Runner join time (ms) when should stop %d"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    sub-long v9, v1, v3

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v6, v7}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 340
    throw v5
    :try_end_7e
    .catchall {:try_start_68 .. :try_end_7e} :catchall_f
.end method

.method public declared-synchronized start(Landroid/content/Context;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 201
    monitor-enter p0

    :try_start_1
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/octo/android/robospice/SpiceManager;->contextWeakReference:Ljava/lang/ref/WeakReference;

    .line 202
    invoke-virtual {p0}, Lcom/octo/android/robospice/SpiceManager;->isStarted()Z

    move-result v0

    if-eqz v0, :cond_19

    .line 203
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Already started."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_16
    .catchall {:try_start_1 .. :try_end_16} :catchall_16

    .line 201
    :catchall_16
    move-exception v0

    monitor-exit p0

    throw v0

    .line 205
    :cond_19
    :try_start_19
    invoke-virtual {p0}, Lcom/octo/android/robospice/SpiceManager;->getThreadCount()I

    move-result v0

    new-instance v1, Lcom/octo/android/robospice/SpiceManager$MinPriorityThreadFactory;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/octo/android/robospice/SpiceManager$MinPriorityThreadFactory;-><init>(Lcom/octo/android/robospice/SpiceManager$1;)V

    invoke-static {v0, v1}, Ljava/util/concurrent/Executors;->newFixedThreadPool(ILjava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/octo/android/robospice/SpiceManager;->executorService:Ljava/util/concurrent/ExecutorService;

    .line 207
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "SpiceManagerThread "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/octo/android/robospice/SpiceManager;->spiceManagerThreadIndex:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/octo/android/robospice/SpiceManager;->spiceManagerThreadIndex:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/octo/android/robospice/SpiceManager;->runner:Ljava/lang/Thread;

    .line 208
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceManager;->runner:Ljava/lang/Thread;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setPriority(I)V

    .line 209
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/octo/android/robospice/SpiceManager;->isStopped:Z

    .line 210
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceManager;->runner:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 212
    const-string v0, "SpiceManager started."

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I
    :try_end_5f
    .catchall {:try_start_19 .. :try_end_5f} :catchall_16

    .line 214
    monitor-exit p0

    return-void
.end method

.method protected waitForServiceToBeBound()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 1245
    const-string v0, "Waiting for service to be bound."

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 1247
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceManager;->lockAcquireService:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 1249
    :goto_d
    :try_start_d
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceManager;->spiceService:Lcom/octo/android/robospice/SpiceService;

    if-nez v0, :cond_2a

    iget-object v0, p0, Lcom/octo/android/robospice/SpiceManager;->requestQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v0}, Ljava/util/concurrent/BlockingQueue;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1d

    iget-boolean v0, p0, Lcom/octo/android/robospice/SpiceManager;->isStopped:Z

    if-nez v0, :cond_2a

    .line 1250
    :cond_1d
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceManager;->conditionServiceBound:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Condition;->await()V
    :try_end_22
    .catchall {:try_start_d .. :try_end_22} :catchall_23

    goto :goto_d

    .line 1254
    :catchall_23
    move-exception v0

    iget-object v1, p0, Lcom/octo/android/robospice/SpiceManager;->lockAcquireService:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v0

    .line 1252
    :cond_2a
    :try_start_2a
    const-string v0, "Bound ok."

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I
    :try_end_32
    .catchall {:try_start_2a .. :try_end_32} :catchall_23

    .line 1254
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceManager;->lockAcquireService:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 1256
    return-void
.end method

.method protected waitForServiceToBeUnbound()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 1264
    const-string v0, "Waiting for service to be unbound."

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 1266
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceManager;->lockAcquireService:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 1268
    :goto_d
    :try_start_d
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceManager;->spiceService:Lcom/octo/android/robospice/SpiceService;

    if-eqz v0, :cond_1e

    .line 1269
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceManager;->conditionServiceUnbound:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Condition;->await()V
    :try_end_16
    .catchall {:try_start_d .. :try_end_16} :catchall_17

    goto :goto_d

    .line 1272
    :catchall_17
    move-exception v0

    iget-object v1, p0, Lcom/octo/android/robospice/SpiceManager;->lockAcquireService:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v0

    :cond_1e
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceManager;->lockAcquireService:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 1274
    return-void
.end method
