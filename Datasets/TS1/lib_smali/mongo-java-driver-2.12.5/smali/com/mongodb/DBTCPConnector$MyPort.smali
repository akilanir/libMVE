.class Lcom/mongodb/DBTCPConnector$MyPort;
.super Ljava/lang/Object;
.source "DBTCPConnector.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/DBTCPConnector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MyPort"
.end annotation


# instance fields
.field private final pinnedRequestStatusThreadLocal:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Lcom/mongodb/DBTCPConnector$PinnedRequestStatus;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/mongodb/DBTCPConnector;


# direct methods
.method constructor <init>(Lcom/mongodb/DBTCPConnector;)V
    .registers 3

    .prologue
    .line 418
    iput-object p1, p0, Lcom/mongodb/DBTCPConnector$MyPort;->this$0:Lcom/mongodb/DBTCPConnector;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 542
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    iput-object v0, p0, Lcom/mongodb/DBTCPConnector$MyPort;->pinnedRequestStatusThreadLocal:Ljava/lang/ThreadLocal;

    return-void
.end method

.method private getConnection(Lcom/mongodb/ServerSelector;)Lcom/mongodb/DBPort;
    .registers 6
    .param p1, "serverSelector"    # Lcom/mongodb/ServerSelector;

    .prologue
    .line 499
    iget-object v0, p0, Lcom/mongodb/DBTCPConnector$MyPort;->this$0:Lcom/mongodb/DBTCPConnector;

    # invokes: Lcom/mongodb/DBTCPConnector;->getServer(Lcom/mongodb/ServerSelector;)Lcom/mongodb/Server;
    invoke-static {v0, p1}, Lcom/mongodb/DBTCPConnector;->access$300(Lcom/mongodb/DBTCPConnector;Lcom/mongodb/ServerSelector;)Lcom/mongodb/Server;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/DBTCPConnector$MyPort;->this$0:Lcom/mongodb/DBTCPConnector;

    # invokes: Lcom/mongodb/DBTCPConnector;->getConnectionWaitTimeMS()I
    invoke-static {v1}, Lcom/mongodb/DBTCPConnector;->access$400(Lcom/mongodb/DBTCPConnector;)I

    move-result v1

    int-to-long v1, v1

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v0, v1, v2, v3}, Lcom/mongodb/Server;->getConnection(JLjava/util/concurrent/TimeUnit;)Lcom/mongodb/Connection;

    move-result-object v0

    check-cast v0, Lcom/mongodb/DBPort;

    return-object v0
.end method

.method private portIsAPrimary(Lcom/mongodb/DBPort;)Z
    .registers 6
    .param p1, "pinnedRequestPort"    # Lcom/mongodb/DBPort;

    .prologue
    .line 458
    iget-object v2, p0, Lcom/mongodb/DBTCPConnector$MyPort;->this$0:Lcom/mongodb/DBTCPConnector;

    # invokes: Lcom/mongodb/DBTCPConnector;->getClusterDescription()Lcom/mongodb/ClusterDescription;
    invoke-static {v2}, Lcom/mongodb/DBTCPConnector;->access$200(Lcom/mongodb/DBTCPConnector;)Lcom/mongodb/ClusterDescription;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mongodb/ClusterDescription;->getPrimaries()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/ServerDescription;

    .line 459
    .local v0, "cur":Lcom/mongodb/ServerDescription;
    invoke-virtual {v0}, Lcom/mongodb/ServerDescription;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v2

    invoke-virtual {p1}, Lcom/mongodb/DBPort;->serverAddress()Lcom/mongodb/ServerAddress;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/mongodb/ServerAddress;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_e

    .line 460
    const/4 v2, 0x1

    .line 463
    .end local v0    # "cur":Lcom/mongodb/ServerDescription;
    :goto_29
    return v2

    :cond_2a
    const/4 v2, 0x0

    goto :goto_29
.end method


# virtual methods
.method done(Lcom/mongodb/DBPort;)V
    .registers 4
    .param p1, "port"    # Lcom/mongodb/DBPort;

    .prologue
    .line 467
    invoke-virtual {p0}, Lcom/mongodb/DBTCPConnector$MyPort;->getPinnedRequestPortForThread()Lcom/mongodb/DBPort;

    move-result-object v0

    .line 470
    .local v0, "requestPort":Lcom/mongodb/Connection;
    if-eq p1, v0, :cond_d

    .line 471
    invoke-virtual {p1}, Lcom/mongodb/DBPort;->getProvider()Lcom/mongodb/PooledConnectionProvider;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/mongodb/PooledConnectionProvider;->release(Lcom/mongodb/Connection;)V

    .line 473
    :cond_d
    return-void
.end method

.method error(Lcom/mongodb/DBPort;Ljava/lang/Exception;)V
    .registers 6
    .param p1, "port"    # Lcom/mongodb/DBPort;
    .param p2, "e"    # Ljava/lang/Exception;

    .prologue
    .line 481
    instance-of v0, p2, Ljava/io/InterruptedIOException;

    if-nez v0, :cond_16

    .line 482
    iget-object v0, p0, Lcom/mongodb/DBTCPConnector$MyPort;->this$0:Lcom/mongodb/DBTCPConnector;

    new-instance v1, Lcom/mongodb/ServerAddressSelector;

    invoke-virtual {p1}, Lcom/mongodb/DBPort;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/mongodb/ServerAddressSelector;-><init>(Lcom/mongodb/ServerAddress;)V

    # invokes: Lcom/mongodb/DBTCPConnector;->getServer(Lcom/mongodb/ServerSelector;)Lcom/mongodb/Server;
    invoke-static {v0, v1}, Lcom/mongodb/DBTCPConnector;->access$300(Lcom/mongodb/DBTCPConnector;Lcom/mongodb/ServerSelector;)Lcom/mongodb/Server;

    move-result-object v0

    invoke-interface {v0}, Lcom/mongodb/Server;->invalidate()V

    .line 484
    :cond_16
    invoke-virtual {p1}, Lcom/mongodb/DBPort;->close()V

    .line 485
    iget-object v0, p0, Lcom/mongodb/DBTCPConnector$MyPort;->pinnedRequestStatusThreadLocal:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->remove()V

    .line 486
    return-void
.end method

.method get(ZLcom/mongodb/ReadPreference;Lcom/mongodb/ServerAddress;)Lcom/mongodb/DBPort;
    .registers 7
    .param p1, "keep"    # Z
    .param p2, "readPref"    # Lcom/mongodb/ReadPreference;
    .param p3, "hostNeeded"    # Lcom/mongodb/ServerAddress;

    .prologue
    .line 422
    invoke-virtual {p0}, Lcom/mongodb/DBTCPConnector$MyPort;->getPinnedRequestPortForThread()Lcom/mongodb/DBPort;

    move-result-object v0

    .line 424
    .local v0, "pinnedRequestPort":Lcom/mongodb/DBPort;
    if-eqz p3, :cond_1d

    .line 425
    if-eqz v0, :cond_13

    invoke-virtual {v0}, Lcom/mongodb/DBPort;->serverAddress()Lcom/mongodb/ServerAddress;

    move-result-object v2

    invoke-virtual {v2, p3}, Lcom/mongodb/ServerAddress;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_13

    .line 454
    .end local v0    # "pinnedRequestPort":Lcom/mongodb/DBPort;
    :cond_12
    :goto_12
    return-object v0

    .line 430
    .restart local v0    # "pinnedRequestPort":Lcom/mongodb/DBPort;
    :cond_13
    new-instance v2, Lcom/mongodb/ServerAddressSelector;

    invoke-direct {v2, p3}, Lcom/mongodb/ServerAddressSelector;-><init>(Lcom/mongodb/ServerAddress;)V

    invoke-direct {p0, v2}, Lcom/mongodb/DBTCPConnector$MyPort;->getConnection(Lcom/mongodb/ServerSelector;)Lcom/mongodb/DBPort;

    move-result-object v0

    goto :goto_12

    .line 433
    :cond_1d
    if-eqz v0, :cond_32

    .line 435
    invoke-direct {p0, v0}, Lcom/mongodb/DBTCPConnector$MyPort;->portIsAPrimary(Lcom/mongodb/DBPort;)Z

    move-result v2

    if-nez v2, :cond_12

    if-eqz p1, :cond_12

    .line 443
    invoke-virtual {v0}, Lcom/mongodb/DBPort;->getProvider()Lcom/mongodb/PooledConnectionProvider;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/mongodb/PooledConnectionProvider;->release(Lcom/mongodb/Connection;)V

    .line 444
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Lcom/mongodb/DBTCPConnector$MyPort;->setPinnedRequestPortForThread(Lcom/mongodb/DBPort;)V

    .line 447
    :cond_32
    iget-object v2, p0, Lcom/mongodb/DBTCPConnector$MyPort;->this$0:Lcom/mongodb/DBTCPConnector;

    # invokes: Lcom/mongodb/DBTCPConnector;->createServerSelector(Lcom/mongodb/ReadPreference;)Lcom/mongodb/ServerSelector;
    invoke-static {v2, p2}, Lcom/mongodb/DBTCPConnector;->access$100(Lcom/mongodb/DBTCPConnector;Lcom/mongodb/ReadPreference;)Lcom/mongodb/ServerSelector;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/mongodb/DBTCPConnector$MyPort;->getConnection(Lcom/mongodb/ServerSelector;)Lcom/mongodb/DBPort;

    move-result-object v1

    .line 450
    .local v1, "port":Lcom/mongodb/DBPort;
    invoke-virtual {p0}, Lcom/mongodb/DBTCPConnector$MyPort;->threadHasPinnedRequest()Z

    move-result v2

    if-eqz v2, :cond_45

    .line 451
    invoke-virtual {p0, v1}, Lcom/mongodb/DBTCPConnector$MyPort;->setPinnedRequestPortForThread(Lcom/mongodb/DBPort;)V

    :cond_45
    move-object v0, v1

    .line 454
    goto :goto_12
.end method

.method getPinnedRequestPortForThread()Lcom/mongodb/DBPort;
    .registers 2

    .prologue
    .line 535
    invoke-virtual {p0}, Lcom/mongodb/DBTCPConnector$MyPort;->threadHasPinnedRequest()Z

    move-result v0

    if-eqz v0, :cond_11

    iget-object v0, p0, Lcom/mongodb/DBTCPConnector$MyPort;->pinnedRequestStatusThreadLocal:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/DBTCPConnector$PinnedRequestStatus;

    iget-object v0, v0, Lcom/mongodb/DBTCPConnector$PinnedRequestStatus;->requestPort:Lcom/mongodb/DBPort;

    :goto_10
    return-object v0

    :cond_11
    const/4 v0, 0x0

    goto :goto_10
.end method

.method getPinnedRequestStatusForThread()Lcom/mongodb/DBTCPConnector$PinnedRequestStatus;
    .registers 2

    .prologue
    .line 527
    iget-object v0, p0, Lcom/mongodb/DBTCPConnector$MyPort;->pinnedRequestStatusThreadLocal:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/DBTCPConnector$PinnedRequestStatus;

    return-object v0
.end method

.method requestDone()V
    .registers 4

    .prologue
    .line 513
    invoke-virtual {p0}, Lcom/mongodb/DBTCPConnector$MyPort;->getPinnedRequestStatusForThread()Lcom/mongodb/DBTCPConnector$PinnedRequestStatus;

    move-result-object v0

    .line 514
    .local v0, "current":Lcom/mongodb/DBTCPConnector$PinnedRequestStatus;
    if-eqz v0, :cond_10

    .line 515
    iget v1, v0, Lcom/mongodb/DBTCPConnector$PinnedRequestStatus;->nestedBindings:I

    if-lez v1, :cond_11

    .line 516
    iget v1, v0, Lcom/mongodb/DBTCPConnector$PinnedRequestStatus;->nestedBindings:I

    add-int/lit8 v1, v1, -0x1

    iput v1, v0, Lcom/mongodb/DBTCPConnector$PinnedRequestStatus;->nestedBindings:I

    .line 524
    :cond_10
    :goto_10
    return-void

    .line 519
    :cond_11
    iget-object v1, p0, Lcom/mongodb/DBTCPConnector$MyPort;->pinnedRequestStatusThreadLocal:Ljava/lang/ThreadLocal;

    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->remove()V

    .line 520
    iget-object v1, v0, Lcom/mongodb/DBTCPConnector$PinnedRequestStatus;->requestPort:Lcom/mongodb/DBPort;

    if-eqz v1, :cond_10

    .line 521
    iget-object v1, v0, Lcom/mongodb/DBTCPConnector$PinnedRequestStatus;->requestPort:Lcom/mongodb/DBPort;

    invoke-virtual {v1}, Lcom/mongodb/DBPort;->getProvider()Lcom/mongodb/PooledConnectionProvider;

    move-result-object v1

    iget-object v2, v0, Lcom/mongodb/DBTCPConnector$PinnedRequestStatus;->requestPort:Lcom/mongodb/DBPort;

    invoke-virtual {v1, v2}, Lcom/mongodb/PooledConnectionProvider;->release(Lcom/mongodb/Connection;)V

    goto :goto_10
.end method

.method requestEnsureConnection()V
    .registers 3

    .prologue
    .line 489
    invoke-virtual {p0}, Lcom/mongodb/DBTCPConnector$MyPort;->threadHasPinnedRequest()Z

    move-result v0

    if-nez v0, :cond_7

    .line 496
    :cond_6
    :goto_6
    return-void

    .line 492
    :cond_7
    invoke-virtual {p0}, Lcom/mongodb/DBTCPConnector$MyPort;->getPinnedRequestPortForThread()Lcom/mongodb/DBPort;

    move-result-object v0

    if-nez v0, :cond_6

    .line 495
    iget-object v0, p0, Lcom/mongodb/DBTCPConnector$MyPort;->this$0:Lcom/mongodb/DBTCPConnector;

    invoke-static {}, Lcom/mongodb/ReadPreference;->primary()Lcom/mongodb/ReadPreference;

    move-result-object v1

    # invokes: Lcom/mongodb/DBTCPConnector;->createServerSelector(Lcom/mongodb/ReadPreference;)Lcom/mongodb/ServerSelector;
    invoke-static {v0, v1}, Lcom/mongodb/DBTCPConnector;->access$100(Lcom/mongodb/DBTCPConnector;Lcom/mongodb/ReadPreference;)Lcom/mongodb/ServerSelector;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mongodb/DBTCPConnector$MyPort;->getConnection(Lcom/mongodb/ServerSelector;)Lcom/mongodb/DBPort;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mongodb/DBTCPConnector$MyPort;->setPinnedRequestPortForThread(Lcom/mongodb/DBPort;)V

    goto :goto_6
.end method

.method requestStart()V
    .registers 4

    .prologue
    .line 503
    invoke-virtual {p0}, Lcom/mongodb/DBTCPConnector$MyPort;->getPinnedRequestStatusForThread()Lcom/mongodb/DBTCPConnector$PinnedRequestStatus;

    move-result-object v0

    .line 504
    .local v0, "current":Lcom/mongodb/DBTCPConnector$PinnedRequestStatus;
    if-nez v0, :cond_11

    .line 505
    iget-object v1, p0, Lcom/mongodb/DBTCPConnector$MyPort;->pinnedRequestStatusThreadLocal:Ljava/lang/ThreadLocal;

    new-instance v2, Lcom/mongodb/DBTCPConnector$PinnedRequestStatus;

    invoke-direct {v2}, Lcom/mongodb/DBTCPConnector$PinnedRequestStatus;-><init>()V

    invoke-virtual {v1, v2}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 510
    :goto_10
    return-void

    .line 508
    :cond_11
    iget v1, v0, Lcom/mongodb/DBTCPConnector$PinnedRequestStatus;->nestedBindings:I

    add-int/lit8 v1, v1, 0x1

    iput v1, v0, Lcom/mongodb/DBTCPConnector$PinnedRequestStatus;->nestedBindings:I

    goto :goto_10
.end method

.method setPinnedRequestPortForThread(Lcom/mongodb/DBPort;)V
    .registers 3
    .param p1, "port"    # Lcom/mongodb/DBPort;

    .prologue
    .line 539
    iget-object v0, p0, Lcom/mongodb/DBTCPConnector$MyPort;->pinnedRequestStatusThreadLocal:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/DBTCPConnector$PinnedRequestStatus;

    iput-object p1, v0, Lcom/mongodb/DBTCPConnector$PinnedRequestStatus;->requestPort:Lcom/mongodb/DBPort;

    .line 540
    return-void
.end method

.method threadHasPinnedRequest()Z
    .registers 2

    .prologue
    .line 531
    iget-object v0, p0, Lcom/mongodb/DBTCPConnector$MyPort;->pinnedRequestStatusThreadLocal:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method
