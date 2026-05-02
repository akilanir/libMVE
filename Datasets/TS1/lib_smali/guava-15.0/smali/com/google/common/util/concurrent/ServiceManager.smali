.class public final Lcom/google/common/util/concurrent/ServiceManager;
.super Ljava/lang/Object;
.source "ServiceManager.java"


# annotations
.annotation build Lcom/google/common/annotations/Beta;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/util/concurrent/ServiceManager$EmptyServiceManagerWarning;,
        Lcom/google/common/util/concurrent/ServiceManager$NoOpService;,
        Lcom/google/common/util/concurrent/ServiceManager$ListenerExecutorPair;,
        Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;,
        Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;,
        Lcom/google/common/util/concurrent/ServiceManager$Listener;
    }
.end annotation

.annotation runtime Ljavax/inject/Singleton;
.end annotation


# static fields
.field private static final logger:Ljava/util/logging/Logger;


# instance fields
.field private final services:Lcom/google/common/collect/ImmutableMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableMap",
            "<",
            "Lcom/google/common/util/concurrent/Service;",
            "Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;",
            ">;"
        }
    .end annotation
.end field

.field private final state:Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 108
    const-class v0, Lcom/google/common/util/concurrent/ServiceManager;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lcom/google/common/util/concurrent/ServiceManager;->logger:Ljava/util/logging/Logger;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Iterable;)V
    .registers 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<+",
            "Lcom/google/common/util/concurrent/Service;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "services":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lcom/google/common/util/concurrent/Service;>;"
    const/4 v12, 0x0

    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 163
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 164
    invoke-static {p1}, Lcom/google/common/collect/ImmutableList;->copyOf(Ljava/lang/Iterable;)Lcom/google/common/collect/ImmutableList;

    move-result-object v1

    .line 165
    .local v1, "copy":Lcom/google/common/collect/ImmutableList;, "Lcom/google/common/collect/ImmutableList<Lcom/google/common/util/concurrent/Service;>;"
    invoke-virtual {v1}, Lcom/google/common/collect/ImmutableList;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_27

    .line 168
    sget-object v6, Lcom/google/common/util/concurrent/ServiceManager;->logger:Ljava/util/logging/Logger;

    sget-object v9, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    const-string v10, "ServiceManager configured with no services.  Is your application configured properly?"

    new-instance v11, Lcom/google/common/util/concurrent/ServiceManager$EmptyServiceManagerWarning;

    invoke-direct {v11, v12}, Lcom/google/common/util/concurrent/ServiceManager$EmptyServiceManagerWarning;-><init>(Lcom/google/common/util/concurrent/ServiceManager$1;)V

    invoke-virtual {v6, v9, v10, v11}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 171
    new-instance v6, Lcom/google/common/util/concurrent/ServiceManager$NoOpService;

    invoke-direct {v6, v12}, Lcom/google/common/util/concurrent/ServiceManager$NoOpService;-><init>(Lcom/google/common/util/concurrent/ServiceManager$1;)V

    invoke-static {v6}, Lcom/google/common/collect/ImmutableList;->of(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;

    move-result-object v1

    .line 173
    :cond_27
    new-instance v6, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;

    invoke-virtual {v1}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v9

    invoke-direct {v6, v9}, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;-><init>(I)V

    iput-object v6, p0, Lcom/google/common/util/concurrent/ServiceManager;->state:Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;

    .line 174
    invoke-static {}, Lcom/google/common/collect/ImmutableMap;->builder()Lcom/google/common/collect/ImmutableMap$Builder;

    move-result-object v0

    .line 175
    .local v0, "builder":Lcom/google/common/collect/ImmutableMap$Builder;, "Lcom/google/common/collect/ImmutableMap$Builder<Lcom/google/common/util/concurrent/Service;Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;>;"
    invoke-static {}, Lcom/google/common/util/concurrent/MoreExecutors;->sameThreadExecutor()Lcom/google/common/util/concurrent/ListeningExecutorService;

    move-result-object v2

    .line 176
    .local v2, "executor":Ljava/util/concurrent/Executor;
    invoke-virtual {v1}, Lcom/google/common/collect/ImmutableList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_3e
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_6c

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/common/util/concurrent/Service;

    .line 177
    .local v5, "service":Lcom/google/common/util/concurrent/Service;
    new-instance v4, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;

    iget-object v6, p0, Lcom/google/common/util/concurrent/ServiceManager;->state:Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;

    invoke-direct {v4, v5, v6}, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;-><init>(Lcom/google/common/util/concurrent/Service;Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;)V

    .line 178
    .local v4, "listener":Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;
    invoke-interface {v5, v4, v2}, Lcom/google/common/util/concurrent/Service;->addListener(Lcom/google/common/util/concurrent/Service$Listener;Ljava/util/concurrent/Executor;)V

    .line 181
    invoke-interface {v5}, Lcom/google/common/util/concurrent/Service;->state()Lcom/google/common/util/concurrent/Service$State;

    move-result-object v6

    sget-object v9, Lcom/google/common/util/concurrent/Service$State;->NEW:Lcom/google/common/util/concurrent/Service$State;

    if-ne v6, v9, :cond_6a

    move v6, v7

    :goto_5d
    const-string v9, "Can only manage NEW services, %s"

    new-array v10, v7, [Ljava/lang/Object;

    aput-object v5, v10, v8

    invoke-static {v6, v9, v10}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 182
    invoke-virtual {v0, v5, v4}, Lcom/google/common/collect/ImmutableMap$Builder;->put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableMap$Builder;

    goto :goto_3e

    :cond_6a
    move v6, v8

    .line 181
    goto :goto_5d

    .line 184
    .end local v4    # "listener":Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;
    .end local v5    # "service":Lcom/google/common/util/concurrent/Service;
    :cond_6c
    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableMap$Builder;->build()Lcom/google/common/collect/ImmutableMap;

    move-result-object v6

    iput-object v6, p0, Lcom/google/common/util/concurrent/ServiceManager;->services:Lcom/google/common/collect/ImmutableMap;

    .line 185
    return-void
.end method

.method constructor <init>(Ljava/util/Set;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Lcom/google/common/util/concurrent/Service;",
            ">;)V"
        }
    .end annotation

    .annotation runtime Ljavax/inject/Inject;
    .end annotation

    .prologue
    .line 196
    .local p1, "services":Ljava/util/Set;, "Ljava/util/Set<Lcom/google/common/util/concurrent/Service;>;"
    invoke-direct {p0, p1}, Lcom/google/common/util/concurrent/ServiceManager;-><init>(Ljava/lang/Iterable;)V

    .line 197
    return-void
.end method

.method static synthetic access$300()Ljava/util/logging/Logger;
    .registers 1

    .prologue
    .line 107
    sget-object v0, Lcom/google/common/util/concurrent/ServiceManager;->logger:Ljava/util/logging/Logger;

    return-object v0
.end method


# virtual methods
.method public addListener(Lcom/google/common/util/concurrent/ServiceManager$Listener;)V
    .registers 4
    .param p1, "listener"    # Lcom/google/common/util/concurrent/ServiceManager$Listener;

    .prologue
    .line 236
    iget-object v0, p0, Lcom/google/common/util/concurrent/ServiceManager;->state:Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;

    invoke-static {}, Lcom/google/common/util/concurrent/MoreExecutors;->sameThreadExecutor()Lcom/google/common/util/concurrent/ListeningExecutorService;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->addListener(Lcom/google/common/util/concurrent/ServiceManager$Listener;Ljava/util/concurrent/Executor;)V

    .line 237
    return-void
.end method

.method public addListener(Lcom/google/common/util/concurrent/ServiceManager$Listener;Ljava/util/concurrent/Executor;)V
    .registers 4
    .param p1, "listener"    # Lcom/google/common/util/concurrent/ServiceManager$Listener;
    .param p2, "executor"    # Ljava/util/concurrent/Executor;

    .prologue
    .line 220
    iget-object v0, p0, Lcom/google/common/util/concurrent/ServiceManager;->state:Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;

    invoke-virtual {v0, p1, p2}, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->addListener(Lcom/google/common/util/concurrent/ServiceManager$Listener;Ljava/util/concurrent/Executor;)V

    .line 221
    return-void
.end method

.method public awaitHealthy()V
    .registers 3

    .prologue
    .line 277
    iget-object v0, p0, Lcom/google/common/util/concurrent/ServiceManager;->state:Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;

    invoke-virtual {v0}, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->awaitHealthy()V

    .line 278
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/ServiceManager;->isHealthy()Z

    move-result v0

    const-string v1, "Expected to be healthy after starting"

    invoke-static {v0, v1}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 279
    return-void
.end method

.method public awaitHealthy(JLjava/util/concurrent/TimeUnit;)V
    .registers 6
    .param p1, "timeout"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/concurrent/TimeoutException;
        }
    .end annotation

    .prologue
    .line 293
    iget-object v0, p0, Lcom/google/common/util/concurrent/ServiceManager;->state:Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;

    invoke-virtual {v0, p1, p2, p3}, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->awaitHealthy(JLjava/util/concurrent/TimeUnit;)Z

    move-result v0

    if-nez v0, :cond_10

    .line 300
    new-instance v0, Ljava/util/concurrent/TimeoutException;

    const-string v1, "Timeout waiting for the services to become healthy."

    invoke-direct {v0, v1}, Ljava/util/concurrent/TimeoutException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 302
    :cond_10
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/ServiceManager;->isHealthy()Z

    move-result v0

    const-string v1, "Expected to be healthy after starting"

    invoke-static {v0, v1}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 303
    return-void
.end method

.method public awaitStopped()V
    .registers 2

    .prologue
    .line 324
    iget-object v0, p0, Lcom/google/common/util/concurrent/ServiceManager;->state:Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;

    invoke-virtual {v0}, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->awaitStopped()V

    .line 325
    return-void
.end method

.method public awaitStopped(JLjava/util/concurrent/TimeUnit;)V
    .registers 6
    .param p1, "timeout"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/concurrent/TimeoutException;
        }
    .end annotation

    .prologue
    .line 337
    iget-object v0, p0, Lcom/google/common/util/concurrent/ServiceManager;->state:Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;

    invoke-virtual {v0, p1, p2, p3}, Lcom/google/common/util/concurrent/ServiceManager$ServiceManagerState;->awaitStopped(JLjava/util/concurrent/TimeUnit;)Z

    move-result v0

    if-nez v0, :cond_10

    .line 338
    new-instance v0, Ljava/util/concurrent/TimeoutException;

    const-string v1, "Timeout waiting for the services to stop."

    invoke-direct {v0, v1}, Ljava/util/concurrent/TimeoutException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 340
    :cond_10
    return-void
.end method

.method public isHealthy()Z
    .registers 4

    .prologue
    .line 349
    iget-object v2, p0, Lcom/google/common/util/concurrent/ServiceManager;->services:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v2}, Lcom/google/common/collect/ImmutableMap;->keySet()Lcom/google/common/collect/ImmutableSet;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/common/collect/ImmutableSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1e

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/common/util/concurrent/Service;

    .line 350
    .local v1, "service":Lcom/google/common/util/concurrent/Service;
    invoke-interface {v1}, Lcom/google/common/util/concurrent/Service;->isRunning()Z

    move-result v2

    if-nez v2, :cond_a

    .line 351
    const/4 v2, 0x0

    .line 354
    .end local v1    # "service":Lcom/google/common/util/concurrent/Service;
    :goto_1d
    return v2

    :cond_1e
    const/4 v2, 0x1

    goto :goto_1d
.end method

.method public servicesByState()Lcom/google/common/collect/ImmutableMultimap;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableMultimap",
            "<",
            "Lcom/google/common/util/concurrent/Service$State;",
            "Lcom/google/common/util/concurrent/Service;",
            ">;"
        }
    .end annotation

    .prologue
    .line 364
    invoke-static {}, Lcom/google/common/collect/ImmutableMultimap;->builder()Lcom/google/common/collect/ImmutableMultimap$Builder;

    move-result-object v0

    .line 365
    .local v0, "builder":Lcom/google/common/collect/ImmutableMultimap$Builder;, "Lcom/google/common/collect/ImmutableMultimap$Builder<Lcom/google/common/util/concurrent/Service$State;Lcom/google/common/util/concurrent/Service;>;"
    iget-object v3, p0, Lcom/google/common/util/concurrent/ServiceManager;->services:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v3}, Lcom/google/common/collect/ImmutableMap;->keySet()Lcom/google/common/collect/ImmutableSet;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/common/collect/ImmutableSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_e
    :goto_e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_26

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/common/util/concurrent/Service;

    .line 366
    .local v2, "service":Lcom/google/common/util/concurrent/Service;
    instance-of v3, v2, Lcom/google/common/util/concurrent/ServiceManager$NoOpService;

    if-nez v3, :cond_e

    .line 367
    invoke-interface {v2}, Lcom/google/common/util/concurrent/Service;->state()Lcom/google/common/util/concurrent/Service$State;

    move-result-object v3

    invoke-virtual {v0, v3, v2}, Lcom/google/common/collect/ImmutableMultimap$Builder;->put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableMultimap$Builder;

    goto :goto_e

    .line 370
    .end local v2    # "service":Lcom/google/common/util/concurrent/Service;
    :cond_26
    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableMultimap$Builder;->build()Lcom/google/common/collect/ImmutableMultimap;

    move-result-object v3

    return-object v3
.end method

.method public startAsync()Lcom/google/common/util/concurrent/ServiceManager;
    .registers 11

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 248
    iget-object v5, p0, Lcom/google/common/util/concurrent/ServiceManager;->services:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v5}, Lcom/google/common/collect/ImmutableMap;->entrySet()Lcom/google/common/collect/ImmutableSet;

    move-result-object v5

    invoke-virtual {v5}, Lcom/google/common/collect/ImmutableSet;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_c
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_36

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 249
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/google/common/util/concurrent/Service;Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/common/util/concurrent/Service;

    .line 250
    .local v3, "service":Lcom/google/common/util/concurrent/Service;
    invoke-interface {v3}, Lcom/google/common/util/concurrent/Service;->state()Lcom/google/common/util/concurrent/Service$State;

    move-result-object v4

    .line 251
    .local v4, "state":Lcom/google/common/util/concurrent/Service$State;
    sget-object v5, Lcom/google/common/util/concurrent/Service$State;->NEW:Lcom/google/common/util/concurrent/Service$State;

    if-ne v4, v5, :cond_34

    move v5, v6

    :goto_27
    const-string v8, "Service %s is %s, cannot start it."

    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Object;

    aput-object v3, v9, v7

    aput-object v4, v9, v6

    invoke-static {v5, v8, v9}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/String;[Ljava/lang/Object;)V

    goto :goto_c

    :cond_34
    move v5, v7

    goto :goto_27

    .line 254
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/google/common/util/concurrent/Service;Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;>;"
    .end local v3    # "service":Lcom/google/common/util/concurrent/Service;
    .end local v4    # "state":Lcom/google/common/util/concurrent/Service$State;
    :cond_36
    iget-object v5, p0, Lcom/google/common/util/concurrent/ServiceManager;->services:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v5}, Lcom/google/common/collect/ImmutableMap;->values()Lcom/google/common/collect/ImmutableCollection;

    move-result-object v5

    invoke-virtual {v5}, Lcom/google/common/collect/ImmutableCollection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_40
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_6e

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;

    .line 256
    .local v3, "service":Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;
    :try_start_4c
    invoke-virtual {v3}, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;->start()V
    :try_end_4f
    .catch Ljava/lang/IllegalStateException; {:try_start_4c .. :try_end_4f} :catch_50

    goto :goto_40

    .line 257
    :catch_50
    move-exception v0

    .line 262
    .local v0, "e":Ljava/lang/IllegalStateException;
    sget-object v5, Lcom/google/common/util/concurrent/ServiceManager;->logger:Ljava/util/logging/Logger;

    sget-object v6, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Unable to start Service "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, v3, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;->service:Lcom/google/common/util/concurrent/Service;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7, v0}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_40

    .line 265
    .end local v0    # "e":Ljava/lang/IllegalStateException;
    .end local v3    # "service":Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;
    :cond_6e
    return-object p0
.end method

.method public startupTimes()Lcom/google/common/collect/ImmutableMap;
    .registers 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableMap",
            "<",
            "Lcom/google/common/util/concurrent/Service;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v8, 0x1

    const/4 v9, 0x0

    .line 381
    iget-object v7, p0, Lcom/google/common/util/concurrent/ServiceManager;->services:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v7}, Lcom/google/common/collect/ImmutableMap;->size()I

    move-result v7

    invoke-static {v7}, Lcom/google/common/collect/Lists;->newArrayListWithCapacity(I)Ljava/util/ArrayList;

    move-result-object v4

    .line 382
    .local v4, "loadTimes":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map$Entry<Lcom/google/common/util/concurrent/Service;Ljava/lang/Long;>;>;"
    iget-object v7, p0, Lcom/google/common/util/concurrent/ServiceManager;->services:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v7}, Lcom/google/common/collect/ImmutableMap;->entrySet()Lcom/google/common/collect/ImmutableSet;

    move-result-object v7

    invoke-virtual {v7}, Lcom/google/common/collect/ImmutableSet;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_16
    :goto_16
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_5b

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 383
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/google/common/util/concurrent/Service;Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/common/util/concurrent/Service;

    .line 384
    .local v5, "service":Lcom/google/common/util/concurrent/Service;
    invoke-interface {v5}, Lcom/google/common/util/concurrent/Service;->state()Lcom/google/common/util/concurrent/Service$State;

    move-result-object v6

    .line 385
    .local v6, "state":Lcom/google/common/util/concurrent/Service$State;
    sget-object v7, Lcom/google/common/util/concurrent/Service$State;->NEW:Lcom/google/common/util/concurrent/Service$State;

    if-eq v6, v7, :cond_55

    move v7, v8

    :goto_31
    sget-object v10, Lcom/google/common/util/concurrent/Service$State;->STARTING:Lcom/google/common/util/concurrent/Service$State;

    if-eq v6, v10, :cond_57

    move v10, v8

    :goto_36
    and-int/2addr v10, v7

    instance-of v7, v5, Lcom/google/common/util/concurrent/ServiceManager$NoOpService;

    if-nez v7, :cond_59

    move v7, v8

    :goto_3c
    and-int/2addr v7, v10

    if-eqz v7, :cond_16

    .line 386
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;

    invoke-virtual {v7}, Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;->startupTimeMillis()J

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-static {v5, v7}, Lcom/google/common/collect/Maps;->immutableEntry(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map$Entry;

    move-result-object v7

    invoke-interface {v4, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_16

    :cond_55
    move v7, v9

    .line 385
    goto :goto_31

    :cond_57
    move v10, v9

    goto :goto_36

    :cond_59
    move v7, v9

    goto :goto_3c

    .line 389
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/google/common/util/concurrent/Service;Lcom/google/common/util/concurrent/ServiceManager$ServiceListener;>;"
    .end local v5    # "service":Lcom/google/common/util/concurrent/Service;
    .end local v6    # "state":Lcom/google/common/util/concurrent/Service$State;
    :cond_5b
    invoke-static {}, Lcom/google/common/collect/Ordering;->natural()Lcom/google/common/collect/Ordering;

    move-result-object v7

    new-instance v8, Lcom/google/common/util/concurrent/ServiceManager$1;

    invoke-direct {v8, p0}, Lcom/google/common/util/concurrent/ServiceManager$1;-><init>(Lcom/google/common/util/concurrent/ServiceManager;)V

    invoke-virtual {v7, v8}, Lcom/google/common/collect/Ordering;->onResultOf(Lcom/google/common/base/Function;)Lcom/google/common/collect/Ordering;

    move-result-object v7

    invoke-static {v4, v7}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 395
    invoke-static {}, Lcom/google/common/collect/ImmutableMap;->builder()Lcom/google/common/collect/ImmutableMap$Builder;

    move-result-object v0

    .line 396
    .local v0, "builder":Lcom/google/common/collect/ImmutableMap$Builder;, "Lcom/google/common/collect/ImmutableMap$Builder<Lcom/google/common/util/concurrent/Service;Ljava/lang/Long;>;"
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_73
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_83

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 397
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/google/common/util/concurrent/Service;Ljava/lang/Long;>;"
    invoke-virtual {v0, v2}, Lcom/google/common/collect/ImmutableMap$Builder;->put(Ljava/util/Map$Entry;)Lcom/google/common/collect/ImmutableMap$Builder;

    goto :goto_73

    .line 399
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/google/common/util/concurrent/Service;Ljava/lang/Long;>;"
    :cond_83
    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableMap$Builder;->build()Lcom/google/common/collect/ImmutableMap;

    move-result-object v7

    return-object v7
.end method

.method public stopAsync()Lcom/google/common/util/concurrent/ServiceManager;
    .registers 4

    .prologue
    .line 312
    iget-object v2, p0, Lcom/google/common/util/concurrent/ServiceManager;->services:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v2}, Lcom/google/common/collect/ImmutableMap;->keySet()Lcom/google/common/collect/ImmutableSet;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/common/collect/ImmutableSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/common/util/concurrent/Service;

    .line 313
    .local v1, "service":Lcom/google/common/util/concurrent/Service;
    invoke-interface {v1}, Lcom/google/common/util/concurrent/Service;->stop()Lcom/google/common/util/concurrent/ListenableFuture;

    goto :goto_a

    .line 315
    .end local v1    # "service":Lcom/google/common/util/concurrent/Service;
    :cond_1a
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 403
    const-class v0, Lcom/google/common/util/concurrent/ServiceManager;

    invoke-static {v0}, Lcom/google/common/base/Objects;->toStringHelper(Ljava/lang/Class;)Lcom/google/common/base/Objects$ToStringHelper;

    move-result-object v0

    const-string v1, "services"

    iget-object v2, p0, Lcom/google/common/util/concurrent/ServiceManager;->services:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v2}, Lcom/google/common/collect/ImmutableMap;->keySet()Lcom/google/common/collect/ImmutableSet;

    move-result-object v2

    const-class v3, Lcom/google/common/util/concurrent/ServiceManager$NoOpService;

    invoke-static {v3}, Lcom/google/common/base/Predicates;->instanceOf(Ljava/lang/Class;)Lcom/google/common/base/Predicate;

    move-result-object v3

    invoke-static {v3}, Lcom/google/common/base/Predicates;->not(Lcom/google/common/base/Predicate;)Lcom/google/common/base/Predicate;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/google/common/collect/Collections2;->filter(Ljava/util/Collection;Lcom/google/common/base/Predicate;)Ljava/util/Collection;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/common/base/Objects$ToStringHelper;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/common/base/Objects$ToStringHelper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/base/Objects$ToStringHelper;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
