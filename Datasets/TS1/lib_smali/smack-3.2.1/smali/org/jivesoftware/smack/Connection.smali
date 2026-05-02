.class public abstract Lorg/jivesoftware/smack/Connection;
.super Ljava/lang/Object;
.source "Connection.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smack/Connection$InterceptorWrapper;,
        Lorg/jivesoftware/smack/Connection$ListenerWrapper;
    }
.end annotation


# static fields
.field public static DEBUG_ENABLED:Z

.field private static final connectionCounter:Ljava/util/concurrent/atomic/AtomicInteger;

.field private static final connectionEstablishedListeners:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lorg/jivesoftware/smack/ConnectionCreationListener;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private accountManager:Lorg/jivesoftware/smack/AccountManager;

.field private chatManager:Lorg/jivesoftware/smack/ChatManager;

.field protected final collectors:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Lorg/jivesoftware/smack/PacketCollector;",
            ">;"
        }
    .end annotation
.end field

.field protected final config:Lorg/jivesoftware/smack/ConnectionConfiguration;

.field protected final connectionCounterValue:I

.field protected final connectionListeners:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Lorg/jivesoftware/smack/ConnectionListener;",
            ">;"
        }
    .end annotation
.end field

.field protected debugger:Lorg/jivesoftware/smack/debugger/SmackDebugger;

.field protected final interceptors:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lorg/jivesoftware/smack/PacketInterceptor;",
            "Lorg/jivesoftware/smack/Connection$InterceptorWrapper;",
            ">;"
        }
    .end annotation
.end field

.field protected reader:Ljava/io/Reader;

.field protected final recvListeners:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lorg/jivesoftware/smack/PacketListener;",
            "Lorg/jivesoftware/smack/Connection$ListenerWrapper;",
            ">;"
        }
    .end annotation
.end field

.field protected saslAuthentication:Lorg/jivesoftware/smack/SASLAuthentication;

.field protected final sendListeners:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lorg/jivesoftware/smack/PacketListener;",
            "Lorg/jivesoftware/smack/Connection$ListenerWrapper;",
            ">;"
        }
    .end annotation
.end field

.field protected writer:Ljava/io/Writer;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    const/4 v1, 0x0

    .line 85
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    sput-object v0, Lorg/jivesoftware/smack/Connection;->connectionCounter:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 90
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArraySet;-><init>()V

    sput-object v0, Lorg/jivesoftware/smack/Connection;->connectionEstablishedListeners:Ljava/util/Set;

    .line 106
    sput-boolean v1, Lorg/jivesoftware/smack/Connection;->DEBUG_ENABLED:Z

    .line 112
    :try_start_11
    const-string v0, "smack.debugEnabled"

    invoke-static {v0}, Ljava/lang/Boolean;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Lorg/jivesoftware/smack/Connection;->DEBUG_ENABLED:Z
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_19} :catch_1d

    .line 118
    :goto_19
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getVersion()Ljava/lang/String;

    .line 119
    return-void

    .line 114
    :catch_1d
    move-exception v0

    goto :goto_19
.end method

.method protected constructor <init>(Lorg/jivesoftware/smack/ConnectionConfiguration;)V
    .registers 4
    .param p1, "configuration"    # Lorg/jivesoftware/smack/ConnectionConfiguration;

    .prologue
    const/4 v1, 0x0

    .line 201
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 125
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smack/Connection;->connectionListeners:Ljava/util/Collection;

    .line 132
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smack/Connection;->collectors:Ljava/util/Collection;

    .line 137
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smack/Connection;->recvListeners:Ljava/util/Map;

    .line 143
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smack/Connection;->sendListeners:Ljava/util/Map;

    .line 151
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smack/Connection;->interceptors:Ljava/util/Map;

    .line 157
    iput-object v1, p0, Lorg/jivesoftware/smack/Connection;->accountManager:Lorg/jivesoftware/smack/AccountManager;

    .line 162
    iput-object v1, p0, Lorg/jivesoftware/smack/Connection;->chatManager:Lorg/jivesoftware/smack/ChatManager;

    .line 167
    iput-object v1, p0, Lorg/jivesoftware/smack/Connection;->debugger:Lorg/jivesoftware/smack/debugger/SmackDebugger;

    .line 183
    new-instance v0, Lorg/jivesoftware/smack/SASLAuthentication;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smack/SASLAuthentication;-><init>(Lorg/jivesoftware/smack/Connection;)V

    iput-object v0, p0, Lorg/jivesoftware/smack/Connection;->saslAuthentication:Lorg/jivesoftware/smack/SASLAuthentication;

    .line 189
    sget-object v0, Lorg/jivesoftware/smack/Connection;->connectionCounter:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v0

    iput v0, p0, Lorg/jivesoftware/smack/Connection;->connectionCounterValue:I

    .line 202
    iput-object p1, p0, Lorg/jivesoftware/smack/Connection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    .line 203
    return-void
.end method

.method public static addConnectionCreationListener(Lorg/jivesoftware/smack/ConnectionCreationListener;)V
    .registers 2
    .param p0, "connectionCreationListener"    # Lorg/jivesoftware/smack/ConnectionCreationListener;

    .prologue
    .line 488
    sget-object v0, Lorg/jivesoftware/smack/Connection;->connectionEstablishedListeners:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 489
    return-void
.end method

.method protected static getConnectionCreationListeners()Ljava/util/Collection;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lorg/jivesoftware/smack/ConnectionCreationListener;",
            ">;"
        }
    .end annotation

    .prologue
    .line 507
    sget-object v0, Lorg/jivesoftware/smack/Connection;->connectionEstablishedListeners:Ljava/util/Set;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public static removeConnectionCreationListener(Lorg/jivesoftware/smack/ConnectionCreationListener;)V
    .registers 2
    .param p0, "connectionCreationListener"    # Lorg/jivesoftware/smack/ConnectionCreationListener;

    .prologue
    .line 498
    sget-object v0, Lorg/jivesoftware/smack/Connection;->connectionEstablishedListeners:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 499
    return-void
.end method


# virtual methods
.method public addConnectionListener(Lorg/jivesoftware/smack/ConnectionListener;)V
    .registers 4
    .param p1, "connectionListener"    # Lorg/jivesoftware/smack/ConnectionListener;

    .prologue
    .line 518
    invoke-virtual {p0}, Lorg/jivesoftware/smack/Connection;->isConnected()Z

    move-result v0

    if-nez v0, :cond_e

    .line 519
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Not connected to server."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 521
    :cond_e
    if-nez p1, :cond_11

    .line 527
    :cond_10
    :goto_10
    return-void

    .line 524
    :cond_11
    iget-object v0, p0, Lorg/jivesoftware/smack/Connection;->connectionListeners:Ljava/util/Collection;

    invoke-interface {v0, p1}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_10

    .line 525
    iget-object v0, p0, Lorg/jivesoftware/smack/Connection;->connectionListeners:Ljava/util/Collection;

    invoke-interface {v0, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_10
.end method

.method public addPacketInterceptor(Lorg/jivesoftware/smack/PacketInterceptor;Lorg/jivesoftware/smack/filter/PacketFilter;)V
    .registers 5
    .param p1, "packetInterceptor"    # Lorg/jivesoftware/smack/PacketInterceptor;
    .param p2, "packetFilter"    # Lorg/jivesoftware/smack/filter/PacketFilter;

    .prologue
    .line 676
    if-nez p1, :cond_a

    .line 677
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Packet interceptor is null."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 679
    :cond_a
    iget-object v0, p0, Lorg/jivesoftware/smack/Connection;->interceptors:Ljava/util/Map;

    new-instance v1, Lorg/jivesoftware/smack/Connection$InterceptorWrapper;

    invoke-direct {v1, p1, p2}, Lorg/jivesoftware/smack/Connection$InterceptorWrapper;-><init>(Lorg/jivesoftware/smack/PacketInterceptor;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 680
    return-void
.end method

.method public addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V
    .registers 6
    .param p1, "packetListener"    # Lorg/jivesoftware/smack/PacketListener;
    .param p2, "packetFilter"    # Lorg/jivesoftware/smack/filter/PacketFilter;

    .prologue
    .line 590
    if-nez p1, :cond_a

    .line 591
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "Packet listener is null."

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 593
    :cond_a
    new-instance v0, Lorg/jivesoftware/smack/Connection$ListenerWrapper;

    invoke-direct {v0, p1, p2}, Lorg/jivesoftware/smack/Connection$ListenerWrapper;-><init>(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 594
    .local v0, "wrapper":Lorg/jivesoftware/smack/Connection$ListenerWrapper;
    iget-object v1, p0, Lorg/jivesoftware/smack/Connection;->recvListeners:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 595
    return-void
.end method

.method public addPacketSendingListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V
    .registers 6
    .param p1, "packetListener"    # Lorg/jivesoftware/smack/PacketListener;
    .param p2, "packetFilter"    # Lorg/jivesoftware/smack/filter/PacketFilter;

    .prologue
    .line 627
    if-nez p1, :cond_a

    .line 628
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "Packet listener is null."

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 630
    :cond_a
    new-instance v0, Lorg/jivesoftware/smack/Connection$ListenerWrapper;

    invoke-direct {v0, p1, p2}, Lorg/jivesoftware/smack/Connection$ListenerWrapper;-><init>(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 631
    .local v0, "wrapper":Lorg/jivesoftware/smack/Connection$ListenerWrapper;
    iget-object v1, p0, Lorg/jivesoftware/smack/Connection;->sendListeners:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 632
    return-void
.end method

.method public abstract connect()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation
.end method

.method public createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;
    .registers 4
    .param p1, "packetFilter"    # Lorg/jivesoftware/smack/filter/PacketFilter;

    .prologue
    .line 557
    new-instance v0, Lorg/jivesoftware/smack/PacketCollector;

    invoke-direct {v0, p0, p1}, Lorg/jivesoftware/smack/PacketCollector;-><init>(Lorg/jivesoftware/smack/Connection;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 559
    .local v0, "collector":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v1, p0, Lorg/jivesoftware/smack/Connection;->collectors:Ljava/util/Collection;

    invoke-interface {v1, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 560
    return-object v0
.end method

.method public disconnect()V
    .registers 3

    .prologue
    .line 459
    new-instance v0, Lorg/jivesoftware/smack/packet/Presence;

    sget-object v1, Lorg/jivesoftware/smack/packet/Presence$Type;->unavailable:Lorg/jivesoftware/smack/packet/Presence$Type;

    invoke-direct {v0, v1}, Lorg/jivesoftware/smack/packet/Presence;-><init>(Lorg/jivesoftware/smack/packet/Presence$Type;)V

    invoke-virtual {p0, v0}, Lorg/jivesoftware/smack/Connection;->disconnect(Lorg/jivesoftware/smack/packet/Presence;)V

    .line 460
    return-void
.end method

.method public abstract disconnect(Lorg/jivesoftware/smack/packet/Presence;)V
.end method

.method protected firePacketInterceptors(Lorg/jivesoftware/smack/packet/Packet;)V
    .registers 5
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 709
    if-eqz p1, :cond_1c

    .line 710
    iget-object v2, p0, Lorg/jivesoftware/smack/Connection;->interceptors:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_c
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smack/Connection$InterceptorWrapper;

    .line 711
    .local v1, "interceptorWrapper":Lorg/jivesoftware/smack/Connection$InterceptorWrapper;
    invoke-virtual {v1, p1}, Lorg/jivesoftware/smack/Connection$InterceptorWrapper;->notifyListener(Lorg/jivesoftware/smack/packet/Packet;)V

    goto :goto_c

    .line 714
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "interceptorWrapper":Lorg/jivesoftware/smack/Connection$InterceptorWrapper;
    :cond_1c
    return-void
.end method

.method protected firePacketSendingListeners(Lorg/jivesoftware/smack/packet/Packet;)V
    .registers 5
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 660
    iget-object v2, p0, Lorg/jivesoftware/smack/Connection;->sendListeners:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smack/Connection$ListenerWrapper;

    .line 661
    .local v1, "listenerWrapper":Lorg/jivesoftware/smack/Connection$ListenerWrapper;
    invoke-virtual {v1, p1}, Lorg/jivesoftware/smack/Connection$ListenerWrapper;->notifyListener(Lorg/jivesoftware/smack/packet/Packet;)V

    goto :goto_a

    .line 663
    .end local v1    # "listenerWrapper":Lorg/jivesoftware/smack/Connection$ListenerWrapper;
    :cond_1a
    return-void
.end method

.method public getAccountManager()Lorg/jivesoftware/smack/AccountManager;
    .registers 2

    .prologue
    .line 404
    iget-object v0, p0, Lorg/jivesoftware/smack/Connection;->accountManager:Lorg/jivesoftware/smack/AccountManager;

    if-nez v0, :cond_b

    .line 405
    new-instance v0, Lorg/jivesoftware/smack/AccountManager;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smack/AccountManager;-><init>(Lorg/jivesoftware/smack/Connection;)V

    iput-object v0, p0, Lorg/jivesoftware/smack/Connection;->accountManager:Lorg/jivesoftware/smack/AccountManager;

    .line 407
    :cond_b
    iget-object v0, p0, Lorg/jivesoftware/smack/Connection;->accountManager:Lorg/jivesoftware/smack/AccountManager;

    return-object v0
.end method

.method public declared-synchronized getChatManager()Lorg/jivesoftware/smack/ChatManager;
    .registers 2

    .prologue
    .line 417
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/jivesoftware/smack/Connection;->chatManager:Lorg/jivesoftware/smack/ChatManager;

    if-nez v0, :cond_c

    .line 418
    new-instance v0, Lorg/jivesoftware/smack/ChatManager;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smack/ChatManager;-><init>(Lorg/jivesoftware/smack/Connection;)V

    iput-object v0, p0, Lorg/jivesoftware/smack/Connection;->chatManager:Lorg/jivesoftware/smack/ChatManager;

    .line 420
    :cond_c
    iget-object v0, p0, Lorg/jivesoftware/smack/Connection;->chatManager:Lorg/jivesoftware/smack/ChatManager;
    :try_end_e
    .catchall {:try_start_1 .. :try_end_e} :catchall_10

    monitor-exit p0

    return-object v0

    .line 417
    :catchall_10
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected getConfiguration()Lorg/jivesoftware/smack/ConnectionConfiguration;
    .registers 2

    .prologue
    .line 211
    iget-object v0, p0, Lorg/jivesoftware/smack/Connection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    return-object v0
.end method

.method public abstract getConnectionID()Ljava/lang/String;
.end method

.method protected getConnectionListeners()Ljava/util/Collection;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lorg/jivesoftware/smack/ConnectionListener;",
            ">;"
        }
    .end annotation

    .prologue
    .line 544
    iget-object v0, p0, Lorg/jivesoftware/smack/Connection;->connectionListeners:Ljava/util/Collection;

    return-object v0
.end method

.method public getHost()Ljava/lang/String;
    .registers 2

    .prologue
    .line 232
    iget-object v0, p0, Lorg/jivesoftware/smack/Connection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/ConnectionConfiguration;->getHost()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getPacketCollectors()Ljava/util/Collection;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lorg/jivesoftware/smack/PacketCollector;",
            ">;"
        }
    .end annotation

    .prologue
    .line 578
    iget-object v0, p0, Lorg/jivesoftware/smack/Connection;->collectors:Ljava/util/Collection;

    return-object v0
.end method

.method protected getPacketInterceptors()Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Lorg/jivesoftware/smack/PacketInterceptor;",
            "Lorg/jivesoftware/smack/Connection$InterceptorWrapper;",
            ">;"
        }
    .end annotation

    .prologue
    .line 697
    iget-object v0, p0, Lorg/jivesoftware/smack/Connection;->interceptors:Ljava/util/Map;

    return-object v0
.end method

.method protected getPacketListeners()Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Lorg/jivesoftware/smack/PacketListener;",
            "Lorg/jivesoftware/smack/Connection$ListenerWrapper;",
            ">;"
        }
    .end annotation

    .prologue
    .line 612
    iget-object v0, p0, Lorg/jivesoftware/smack/Connection;->recvListeners:Ljava/util/Map;

    return-object v0
.end method

.method protected getPacketSendingListeners()Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Lorg/jivesoftware/smack/PacketListener;",
            "Lorg/jivesoftware/smack/Connection$ListenerWrapper;",
            ">;"
        }
    .end annotation

    .prologue
    .line 649
    iget-object v0, p0, Lorg/jivesoftware/smack/Connection;->sendListeners:Ljava/util/Map;

    return-object v0
.end method

.method public getPort()I
    .registers 2

    .prologue
    .line 242
    iget-object v0, p0, Lorg/jivesoftware/smack/Connection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/ConnectionConfiguration;->getPort()I

    move-result v0

    return v0
.end method

.method public abstract getRoster()Lorg/jivesoftware/smack/Roster;
.end method

.method public getSASLAuthentication()Lorg/jivesoftware/smack/SASLAuthentication;
    .registers 2

    .prologue
    .line 444
    iget-object v0, p0, Lorg/jivesoftware/smack/Connection;->saslAuthentication:Lorg/jivesoftware/smack/SASLAuthentication;

    return-object v0
.end method

.method public getServiceName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 222
    iget-object v0, p0, Lorg/jivesoftware/smack/Connection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/ConnectionConfiguration;->getServiceName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public abstract getUser()Ljava/lang/String;
.end method

.method protected initDebugger()V
    .registers 10

    .prologue
    .line 724
    iget-object v6, p0, Lorg/jivesoftware/smack/Connection;->reader:Ljava/io/Reader;

    if-eqz v6, :cond_8

    iget-object v6, p0, Lorg/jivesoftware/smack/Connection;->writer:Ljava/io/Writer;

    if-nez v6, :cond_10

    .line 725
    :cond_8
    new-instance v6, Ljava/lang/NullPointerException;

    const-string v7, "Reader or writer isn\'t initialized."

    invoke-direct {v6, v7}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 728
    :cond_10
    iget-object v6, p0, Lorg/jivesoftware/smack/Connection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-virtual {v6}, Lorg/jivesoftware/smack/ConnectionConfiguration;->isDebuggerEnabled()Z

    move-result v6

    if-eqz v6, :cond_70

    .line 729
    iget-object v6, p0, Lorg/jivesoftware/smack/Connection;->debugger:Lorg/jivesoftware/smack/debugger/SmackDebugger;

    if-nez v6, :cond_8c

    .line 731
    const/4 v0, 0x0

    .line 735
    .local v0, "className":Ljava/lang/String;
    :try_start_1d
    const-string v6, "smack.debuggerClass"

    invoke-static {v6}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;
    :try_end_22
    .catch Ljava/lang/Throwable; {:try_start_1d .. :try_end_22} :catch_a1

    move-result-object v0

    .line 740
    :goto_23
    const/4 v2, 0x0

    .line 741
    .local v2, "debuggerClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz v0, :cond_2a

    .line 743
    :try_start_26
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_29
    .catch Ljava/lang/Exception; {:try_start_26 .. :try_end_29} :catch_71

    move-result-object v2

    .line 749
    :cond_2a
    :goto_2a
    if-nez v2, :cond_32

    .line 751
    :try_start_2c
    const-string v6, "org.jivesoftware.smackx.debugger.EnhancedDebugger"

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_31
    .catch Ljava/lang/Exception; {:try_start_2c .. :try_end_31} :catch_76

    move-result-object v2

    .line 767
    :cond_32
    :goto_32
    const/4 v6, 0x3

    :try_start_33
    new-array v6, v6, [Ljava/lang/Class;

    const/4 v7, 0x0

    const-class v8, Lorg/jivesoftware/smack/Connection;

    aput-object v8, v6, v7

    const/4 v7, 0x1

    const-class v8, Ljava/io/Writer;

    aput-object v8, v6, v7

    const/4 v7, 0x2

    const-class v8, Ljava/io/Reader;

    aput-object v8, v6, v7

    invoke-virtual {v2, v6}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    .line 769
    .local v1, "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object p0, v6, v7

    const/4 v7, 0x1

    iget-object v8, p0, Lorg/jivesoftware/smack/Connection;->writer:Ljava/io/Writer;

    aput-object v8, v6, v7

    const/4 v7, 0x2

    iget-object v8, p0, Lorg/jivesoftware/smack/Connection;->reader:Ljava/io/Reader;

    aput-object v8, v6, v7

    invoke-virtual {v1, v6}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/jivesoftware/smack/debugger/SmackDebugger;

    iput-object v6, p0, Lorg/jivesoftware/smack/Connection;->debugger:Lorg/jivesoftware/smack/debugger/SmackDebugger;

    .line 770
    iget-object v6, p0, Lorg/jivesoftware/smack/Connection;->debugger:Lorg/jivesoftware/smack/debugger/SmackDebugger;

    invoke-interface {v6}, Lorg/jivesoftware/smack/debugger/SmackDebugger;->getReader()Ljava/io/Reader;

    move-result-object v6

    iput-object v6, p0, Lorg/jivesoftware/smack/Connection;->reader:Ljava/io/Reader;

    .line 771
    iget-object v6, p0, Lorg/jivesoftware/smack/Connection;->debugger:Lorg/jivesoftware/smack/debugger/SmackDebugger;

    invoke-interface {v6}, Lorg/jivesoftware/smack/debugger/SmackDebugger;->getWriter()Ljava/io/Writer;

    move-result-object v6

    iput-object v6, p0, Lorg/jivesoftware/smack/Connection;->writer:Ljava/io/Writer;
    :try_end_70
    .catch Ljava/lang/Exception; {:try_start_33 .. :try_end_70} :catch_83

    .line 783
    .end local v0    # "className":Ljava/lang/String;
    .end local v1    # "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    .end local v2    # "debuggerClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_70
    :goto_70
    return-void

    .line 745
    .restart local v0    # "className":Ljava/lang/String;
    .restart local v2    # "debuggerClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_71
    move-exception v3

    .line 746
    .local v3, "e":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_2a

    .line 754
    .end local v3    # "e":Ljava/lang/Exception;
    :catch_76
    move-exception v4

    .line 756
    .local v4, "ex":Ljava/lang/Exception;
    :try_start_77
    const-string v6, "org.jivesoftware.smack.debugger.LiteDebugger"

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_7c
    .catch Ljava/lang/Exception; {:try_start_77 .. :try_end_7c} :catch_7e

    move-result-object v2

    goto :goto_32

    .line 759
    :catch_7e
    move-exception v5

    .line 760
    .local v5, "ex2":Ljava/lang/Exception;
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_32

    .line 773
    .end local v4    # "ex":Ljava/lang/Exception;
    .end local v5    # "ex2":Ljava/lang/Exception;
    :catch_83
    move-exception v3

    .line 774
    .restart local v3    # "e":Ljava/lang/Exception;
    new-instance v6, Ljava/lang/IllegalArgumentException;

    const-string v7, "Can\'t initialize the configured debugger!"

    invoke-direct {v6, v7, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 779
    .end local v0    # "className":Ljava/lang/String;
    .end local v2    # "debuggerClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "e":Ljava/lang/Exception;
    :cond_8c
    iget-object v6, p0, Lorg/jivesoftware/smack/Connection;->debugger:Lorg/jivesoftware/smack/debugger/SmackDebugger;

    iget-object v7, p0, Lorg/jivesoftware/smack/Connection;->reader:Ljava/io/Reader;

    invoke-interface {v6, v7}, Lorg/jivesoftware/smack/debugger/SmackDebugger;->newConnectionReader(Ljava/io/Reader;)Ljava/io/Reader;

    move-result-object v6

    iput-object v6, p0, Lorg/jivesoftware/smack/Connection;->reader:Ljava/io/Reader;

    .line 780
    iget-object v6, p0, Lorg/jivesoftware/smack/Connection;->debugger:Lorg/jivesoftware/smack/debugger/SmackDebugger;

    iget-object v7, p0, Lorg/jivesoftware/smack/Connection;->writer:Ljava/io/Writer;

    invoke-interface {v6, v7}, Lorg/jivesoftware/smack/debugger/SmackDebugger;->newConnectionWriter(Ljava/io/Writer;)Ljava/io/Writer;

    move-result-object v6

    iput-object v6, p0, Lorg/jivesoftware/smack/Connection;->writer:Ljava/io/Writer;

    goto :goto_70

    .line 737
    .restart local v0    # "className":Ljava/lang/String;
    :catch_a1
    move-exception v6

    goto :goto_23
.end method

.method public abstract isAnonymous()Z
.end method

.method public abstract isAuthenticated()Z
.end method

.method public abstract isConnected()Z
.end method

.method protected isReconnectionAllowed()Z
    .registers 2

    .prologue
    .line 299
    iget-object v0, p0, Lorg/jivesoftware/smack/Connection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/ConnectionConfiguration;->isReconnectionAllowed()Z

    move-result v0

    return v0
.end method

.method public abstract isSecureConnection()Z
.end method

.method public abstract isUsingCompression()Z
.end method

.method public login(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "password"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 348
    const-string v0, "Smack"

    invoke-virtual {p0, p1, p2, v0}, Lorg/jivesoftware/smack/Connection;->login(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 349
    return-void
.end method

.method public abstract login(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation
.end method

.method public abstract loginAnonymously()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation
.end method

.method public removeConnectionListener(Lorg/jivesoftware/smack/ConnectionListener;)V
    .registers 3
    .param p1, "connectionListener"    # Lorg/jivesoftware/smack/ConnectionListener;

    .prologue
    .line 535
    iget-object v0, p0, Lorg/jivesoftware/smack/Connection;->connectionListeners:Ljava/util/Collection;

    invoke-interface {v0, p1}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    .line 536
    return-void
.end method

.method protected removePacketCollector(Lorg/jivesoftware/smack/PacketCollector;)V
    .registers 3
    .param p1, "collector"    # Lorg/jivesoftware/smack/PacketCollector;

    .prologue
    .line 569
    iget-object v0, p0, Lorg/jivesoftware/smack/Connection;->collectors:Ljava/util/Collection;

    invoke-interface {v0, p1}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    .line 570
    return-void
.end method

.method public removePacketInterceptor(Lorg/jivesoftware/smack/PacketInterceptor;)V
    .registers 3
    .param p1, "packetInterceptor"    # Lorg/jivesoftware/smack/PacketInterceptor;

    .prologue
    .line 688
    iget-object v0, p0, Lorg/jivesoftware/smack/Connection;->interceptors:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 689
    return-void
.end method

.method public removePacketListener(Lorg/jivesoftware/smack/PacketListener;)V
    .registers 3
    .param p1, "packetListener"    # Lorg/jivesoftware/smack/PacketListener;

    .prologue
    .line 603
    iget-object v0, p0, Lorg/jivesoftware/smack/Connection;->recvListeners:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 604
    return-void
.end method

.method public removePacketSendingListener(Lorg/jivesoftware/smack/PacketListener;)V
    .registers 3
    .param p1, "packetListener"    # Lorg/jivesoftware/smack/PacketListener;

    .prologue
    .line 640
    iget-object v0, p0, Lorg/jivesoftware/smack/Connection;->sendListeners:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 641
    return-void
.end method

.method public abstract sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V
.end method
