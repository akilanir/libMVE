.class public Lcom/google/common/eventbus/EventBus;
.super Ljava/lang/Object;
.source "EventBus.java"


# annotations
.annotation build Lcom/google/common/annotations/Beta;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/eventbus/EventBus$EventWithHandler;
    }
.end annotation


# static fields
.field private static final flattenHierarchyCache:Lcom/google/common/cache/LoadingCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/cache/LoadingCache",
            "<",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Class",
            "<*>;>;>;"
        }
    .end annotation
.end field


# instance fields
.field private final eventsToDispatch:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Ljava/util/Queue",
            "<",
            "Lcom/google/common/eventbus/EventBus$EventWithHandler;",
            ">;>;"
        }
    .end annotation
.end field

.field private final finder:Lcom/google/common/eventbus/HandlerFindingStrategy;

.field private final handlersByType:Lcom/google/common/collect/SetMultimap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/SetMultimap",
            "<",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/google/common/eventbus/EventHandler;",
            ">;"
        }
    .end annotation
.end field

.field private final handlersByTypeLock:Ljava/util/concurrent/locks/ReadWriteLock;

.field private final isDispatching:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private final logger:Ljava/util/logging/Logger;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 120
    invoke-static {}, Lcom/google/common/cache/CacheBuilder;->newBuilder()Lcom/google/common/cache/CacheBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/cache/CacheBuilder;->weakKeys()Lcom/google/common/cache/CacheBuilder;

    move-result-object v0

    new-instance v1, Lcom/google/common/eventbus/EventBus$1;

    invoke-direct {v1}, Lcom/google/common/eventbus/EventBus$1;-><init>()V

    invoke-virtual {v0, v1}, Lcom/google/common/cache/CacheBuilder;->build(Lcom/google/common/cache/CacheLoader;)Lcom/google/common/cache/LoadingCache;

    move-result-object v0

    sput-object v0, Lcom/google/common/eventbus/EventBus;->flattenHierarchyCache:Lcom/google/common/cache/LoadingCache;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 174
    const-string v0, "default"

    invoke-direct {p0, v0}, Lcom/google/common/eventbus/EventBus;-><init>(Ljava/lang/String;)V

    .line 175
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 4
    .param p1, "identifier"    # Ljava/lang/String;

    .prologue
    .line 183
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 137
    invoke-static {}, Lcom/google/common/collect/HashMultimap;->create()Lcom/google/common/collect/HashMultimap;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/eventbus/EventBus;->handlersByType:Lcom/google/common/collect/SetMultimap;

    .line 139
    new-instance v0, Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;-><init>()V

    iput-object v0, p0, Lcom/google/common/eventbus/EventBus;->handlersByTypeLock:Ljava/util/concurrent/locks/ReadWriteLock;

    .line 152
    new-instance v0, Lcom/google/common/eventbus/AnnotatedHandlerFinder;

    invoke-direct {v0}, Lcom/google/common/eventbus/AnnotatedHandlerFinder;-><init>()V

    iput-object v0, p0, Lcom/google/common/eventbus/EventBus;->finder:Lcom/google/common/eventbus/HandlerFindingStrategy;

    .line 155
    new-instance v0, Lcom/google/common/eventbus/EventBus$2;

    invoke-direct {v0, p0}, Lcom/google/common/eventbus/EventBus$2;-><init>(Lcom/google/common/eventbus/EventBus;)V

    iput-object v0, p0, Lcom/google/common/eventbus/EventBus;->eventsToDispatch:Ljava/lang/ThreadLocal;

    .line 163
    new-instance v0, Lcom/google/common/eventbus/EventBus$3;

    invoke-direct {v0, p0}, Lcom/google/common/eventbus/EventBus$3;-><init>(Lcom/google/common/eventbus/EventBus;)V

    iput-object v0, p0, Lcom/google/common/eventbus/EventBus;->isDispatching:Ljava/lang/ThreadLocal;

    .line 184
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-class v1, Lcom/google/common/eventbus/EventBus;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/eventbus/EventBus;->logger:Ljava/util/logging/Logger;

    .line 185
    return-void
.end method


# virtual methods
.method dispatch(Ljava/lang/Object;Lcom/google/common/eventbus/EventHandler;)V
    .registers 8
    .param p1, "event"    # Ljava/lang/Object;
    .param p2, "wrapper"    # Lcom/google/common/eventbus/EventHandler;

    .prologue
    .line 314
    :try_start_0
    invoke-virtual {p2, p1}, Lcom/google/common/eventbus/EventHandler;->handleEvent(Ljava/lang/Object;)V
    :try_end_3
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_3} :catch_4

    .line 319
    :goto_3
    return-void

    .line 315
    :catch_4
    move-exception v0

    .line 316
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    iget-object v1, p0, Lcom/google/common/eventbus/EventBus;->logger:Ljava/util/logging/Logger;

    sget-object v2, Ljava/util/logging/Level;->SEVERE:Ljava/util/logging/Level;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Could not dispatch event: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " to handler "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3, v0}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_3
.end method

.method dispatchQueuedEvents()V
    .registers 5

    .prologue
    .line 287
    iget-object v2, p0, Lcom/google/common/eventbus/EventBus;->isDispatching:Ljava/lang/ThreadLocal;

    invoke-virtual {v2}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_f

    .line 302
    :goto_e
    return-void

    .line 291
    :cond_f
    iget-object v2, p0, Lcom/google/common/eventbus/EventBus;->isDispatching:Ljava/lang/ThreadLocal;

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 293
    :try_start_19
    iget-object v2, p0, Lcom/google/common/eventbus/EventBus;->eventsToDispatch:Ljava/lang/ThreadLocal;

    invoke-virtual {v2}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Queue;

    .line 295
    .local v1, "events":Ljava/util/Queue;, "Ljava/util/Queue<Lcom/google/common/eventbus/EventBus$EventWithHandler;>;"
    :goto_21
    invoke-interface {v1}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/eventbus/EventBus$EventWithHandler;

    .local v0, "eventWithHandler":Lcom/google/common/eventbus/EventBus$EventWithHandler;
    if-eqz v0, :cond_3d

    .line 296
    iget-object v2, v0, Lcom/google/common/eventbus/EventBus$EventWithHandler;->event:Ljava/lang/Object;

    iget-object v3, v0, Lcom/google/common/eventbus/EventBus$EventWithHandler;->handler:Lcom/google/common/eventbus/EventHandler;

    invoke-virtual {p0, v2, v3}, Lcom/google/common/eventbus/EventBus;->dispatch(Ljava/lang/Object;Lcom/google/common/eventbus/EventHandler;)V
    :try_end_30
    .catchall {:try_start_19 .. :try_end_30} :catchall_31

    goto :goto_21

    .line 299
    .end local v0    # "eventWithHandler":Lcom/google/common/eventbus/EventBus$EventWithHandler;
    .end local v1    # "events":Ljava/util/Queue;, "Ljava/util/Queue<Lcom/google/common/eventbus/EventBus$EventWithHandler;>;"
    :catchall_31
    move-exception v2

    iget-object v3, p0, Lcom/google/common/eventbus/EventBus;->isDispatching:Ljava/lang/ThreadLocal;

    invoke-virtual {v3}, Ljava/lang/ThreadLocal;->remove()V

    .line 300
    iget-object v3, p0, Lcom/google/common/eventbus/EventBus;->eventsToDispatch:Ljava/lang/ThreadLocal;

    invoke-virtual {v3}, Ljava/lang/ThreadLocal;->remove()V

    throw v2

    .line 299
    .restart local v0    # "eventWithHandler":Lcom/google/common/eventbus/EventBus$EventWithHandler;
    .restart local v1    # "events":Ljava/util/Queue;, "Ljava/util/Queue<Lcom/google/common/eventbus/EventBus$EventWithHandler;>;"
    :cond_3d
    iget-object v2, p0, Lcom/google/common/eventbus/EventBus;->isDispatching:Ljava/lang/ThreadLocal;

    invoke-virtual {v2}, Ljava/lang/ThreadLocal;->remove()V

    .line 300
    iget-object v2, p0, Lcom/google/common/eventbus/EventBus;->eventsToDispatch:Ljava/lang/ThreadLocal;

    invoke-virtual {v2}, Ljava/lang/ThreadLocal;->remove()V

    goto :goto_e
.end method

.method enqueueEvent(Ljava/lang/Object;Lcom/google/common/eventbus/EventHandler;)V
    .registers 5
    .param p1, "event"    # Ljava/lang/Object;
    .param p2, "handler"    # Lcom/google/common/eventbus/EventHandler;

    .prologue
    .line 276
    iget-object v0, p0, Lcom/google/common/eventbus/EventBus;->eventsToDispatch:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Queue;

    new-instance v1, Lcom/google/common/eventbus/EventBus$EventWithHandler;

    invoke-direct {v1, p1, p2}, Lcom/google/common/eventbus/EventBus$EventWithHandler;-><init>(Ljava/lang/Object;Lcom/google/common/eventbus/EventHandler;)V

    invoke-interface {v0, v1}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    .line 277
    return-void
.end method

.method flattenHierarchy(Ljava/lang/Class;)Ljava/util/Set;
    .registers 4
    .annotation build Lcom/google/common/annotations/VisibleForTesting;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Class",
            "<*>;>;"
        }
    .end annotation

    .prologue
    .line 332
    .local p1, "concreteClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_0
    sget-object v1, Lcom/google/common/eventbus/EventBus;->flattenHierarchyCache:Lcom/google/common/cache/LoadingCache;

    invoke-interface {v1, p1}, Lcom/google/common/cache/LoadingCache;->getUnchecked(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Set;
    :try_end_8
    .catch Lcom/google/common/util/concurrent/UncheckedExecutionException; {:try_start_0 .. :try_end_8} :catch_9

    return-object v1

    .line 333
    :catch_9
    move-exception v0

    .line 334
    .local v0, "e":Lcom/google/common/util/concurrent/UncheckedExecutionException;
    invoke-virtual {v0}, Lcom/google/common/util/concurrent/UncheckedExecutionException;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    invoke-static {v1}, Lcom/google/common/base/Throwables;->propagate(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1
.end method

.method public post(Ljava/lang/Object;)V
    .registers 11
    .param p1, "event"    # Ljava/lang/Object;

    .prologue
    .line 244
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/google/common/eventbus/EventBus;->flattenHierarchy(Ljava/lang/Class;)Ljava/util/Set;

    move-result-object v0

    .line 246
    .local v0, "dispatchTypes":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Class<*>;>;"
    const/4 v1, 0x0

    .line 247
    .local v1, "dispatched":Z
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_d
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_58

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Class;

    .line 248
    .local v2, "eventType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v7, p0, Lcom/google/common/eventbus/EventBus;->handlersByTypeLock:Ljava/util/concurrent/locks/ReadWriteLock;

    invoke-interface {v7}, Ljava/util/concurrent/locks/ReadWriteLock;->readLock()Ljava/util/concurrent/locks/Lock;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 250
    :try_start_22
    iget-object v7, p0, Lcom/google/common/eventbus/EventBus;->handlersByType:Lcom/google/common/collect/SetMultimap;

    invoke-interface {v7, v2}, Lcom/google/common/collect/SetMultimap;->get(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v6

    .line 252
    .local v6, "wrappers":Ljava/util/Set;, "Ljava/util/Set<Lcom/google/common/eventbus/EventHandler;>;"
    invoke-interface {v6}, Ljava/util/Set;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_4e

    .line 253
    const/4 v1, 0x1

    .line 254
    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :goto_33
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_4e

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/common/eventbus/EventHandler;

    .line 255
    .local v5, "wrapper":Lcom/google/common/eventbus/EventHandler;
    invoke-virtual {p0, p1, v5}, Lcom/google/common/eventbus/EventBus;->enqueueEvent(Ljava/lang/Object;Lcom/google/common/eventbus/EventHandler;)V
    :try_end_42
    .catchall {:try_start_22 .. :try_end_42} :catchall_43

    goto :goto_33

    .line 259
    .end local v4    # "i$":Ljava/util/Iterator;
    .end local v5    # "wrapper":Lcom/google/common/eventbus/EventHandler;
    .end local v6    # "wrappers":Ljava/util/Set;, "Ljava/util/Set<Lcom/google/common/eventbus/EventHandler;>;"
    :catchall_43
    move-exception v7

    iget-object v8, p0, Lcom/google/common/eventbus/EventBus;->handlersByTypeLock:Ljava/util/concurrent/locks/ReadWriteLock;

    invoke-interface {v8}, Ljava/util/concurrent/locks/ReadWriteLock;->readLock()Ljava/util/concurrent/locks/Lock;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v7

    .restart local v6    # "wrappers":Ljava/util/Set;, "Ljava/util/Set<Lcom/google/common/eventbus/EventHandler;>;"
    :cond_4e
    iget-object v7, p0, Lcom/google/common/eventbus/EventBus;->handlersByTypeLock:Ljava/util/concurrent/locks/ReadWriteLock;

    invoke-interface {v7}, Ljava/util/concurrent/locks/ReadWriteLock;->readLock()Ljava/util/concurrent/locks/Lock;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/concurrent/locks/Lock;->unlock()V

    goto :goto_d

    .line 263
    .end local v2    # "eventType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v6    # "wrappers":Ljava/util/Set;, "Ljava/util/Set<Lcom/google/common/eventbus/EventHandler;>;"
    :cond_58
    if-nez v1, :cond_66

    instance-of v7, p1, Lcom/google/common/eventbus/DeadEvent;

    if-nez v7, :cond_66

    .line 264
    new-instance v7, Lcom/google/common/eventbus/DeadEvent;

    invoke-direct {v7, p0, p1}, Lcom/google/common/eventbus/DeadEvent;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p0, v7}, Lcom/google/common/eventbus/EventBus;->post(Ljava/lang/Object;)V

    .line 267
    :cond_66
    invoke-virtual {p0}, Lcom/google/common/eventbus/EventBus;->dispatchQueuedEvents()V

    .line 268
    return-void
.end method

.method public register(Ljava/lang/Object;)V
    .registers 5
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 196
    iget-object v1, p0, Lcom/google/common/eventbus/EventBus;->finder:Lcom/google/common/eventbus/HandlerFindingStrategy;

    invoke-interface {v1, p1}, Lcom/google/common/eventbus/HandlerFindingStrategy;->findAllHandlers(Ljava/lang/Object;)Lcom/google/common/collect/Multimap;

    move-result-object v0

    .line 198
    .local v0, "methodsInListener":Lcom/google/common/collect/Multimap;, "Lcom/google/common/collect/Multimap<Ljava/lang/Class<*>;Lcom/google/common/eventbus/EventHandler;>;"
    iget-object v1, p0, Lcom/google/common/eventbus/EventBus;->handlersByTypeLock:Ljava/util/concurrent/locks/ReadWriteLock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/ReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 200
    :try_start_f
    iget-object v1, p0, Lcom/google/common/eventbus/EventBus;->handlersByType:Lcom/google/common/collect/SetMultimap;

    invoke-interface {v1, v0}, Lcom/google/common/collect/SetMultimap;->putAll(Lcom/google/common/collect/Multimap;)Z
    :try_end_14
    .catchall {:try_start_f .. :try_end_14} :catchall_1e

    .line 202
    iget-object v1, p0, Lcom/google/common/eventbus/EventBus;->handlersByTypeLock:Ljava/util/concurrent/locks/ReadWriteLock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/ReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 204
    return-void

    .line 202
    :catchall_1e
    move-exception v1

    iget-object v2, p0, Lcom/google/common/eventbus/EventBus;->handlersByTypeLock:Ljava/util/concurrent/locks/ReadWriteLock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/ReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public unregister(Ljava/lang/Object;)V
    .registers 11
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 213
    iget-object v6, p0, Lcom/google/common/eventbus/EventBus;->finder:Lcom/google/common/eventbus/HandlerFindingStrategy;

    invoke-interface {v6, p1}, Lcom/google/common/eventbus/HandlerFindingStrategy;->findAllHandlers(Ljava/lang/Object;)Lcom/google/common/collect/Multimap;

    move-result-object v5

    .line 214
    .local v5, "methodsInListener":Lcom/google/common/collect/Multimap;, "Lcom/google/common/collect/Multimap<Ljava/lang/Class<*>;Lcom/google/common/eventbus/EventHandler;>;"
    invoke-interface {v5}, Lcom/google/common/collect/Multimap;->asMap()Ljava/util/Map;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :goto_12
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_76

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 215
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Class<*>;Ljava/util/Collection<Lcom/google/common/eventbus/EventHandler;>;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Class;

    .line 216
    .local v3, "eventType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Collection;

    .line 218
    .local v2, "eventMethodsInListener":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/google/common/eventbus/EventHandler;>;"
    iget-object v6, p0, Lcom/google/common/eventbus/EventBus;->handlersByTypeLock:Ljava/util/concurrent/locks/ReadWriteLock;

    invoke-interface {v6}, Ljava/util/concurrent/locks/ReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 220
    :try_start_33
    iget-object v6, p0, Lcom/google/common/eventbus/EventBus;->handlersByType:Lcom/google/common/collect/SetMultimap;

    invoke-interface {v6, v3}, Lcom/google/common/collect/SetMultimap;->get(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    .line 221
    .local v0, "currentHandlers":Ljava/util/Set;, "Ljava/util/Set<Lcom/google/common/eventbus/EventHandler;>;"
    invoke-interface {v0, v2}, Ljava/util/Set;->containsAll(Ljava/util/Collection;)Z

    move-result v6

    if-nez v6, :cond_69

    .line 222
    new-instance v6, Ljava/lang/IllegalArgumentException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "missing event handler for an annotated method. Is "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " registered?"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_5e
    .catchall {:try_start_33 .. :try_end_5e} :catchall_5e

    .line 227
    .end local v0    # "currentHandlers":Ljava/util/Set;, "Ljava/util/Set<Lcom/google/common/eventbus/EventHandler;>;"
    :catchall_5e
    move-exception v6

    iget-object v7, p0, Lcom/google/common/eventbus/EventBus;->handlersByTypeLock:Ljava/util/concurrent/locks/ReadWriteLock;

    invoke-interface {v7}, Ljava/util/concurrent/locks/ReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v6

    .line 225
    .restart local v0    # "currentHandlers":Ljava/util/Set;, "Ljava/util/Set<Lcom/google/common/eventbus/EventHandler;>;"
    :cond_69
    :try_start_69
    invoke-interface {v0, v2}, Ljava/util/Set;->removeAll(Ljava/util/Collection;)Z
    :try_end_6c
    .catchall {:try_start_69 .. :try_end_6c} :catchall_5e

    .line 227
    iget-object v6, p0, Lcom/google/common/eventbus/EventBus;->handlersByTypeLock:Ljava/util/concurrent/locks/ReadWriteLock;

    invoke-interface {v6}, Ljava/util/concurrent/locks/ReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/concurrent/locks/Lock;->unlock()V

    goto :goto_12

    .line 230
    .end local v0    # "currentHandlers":Ljava/util/Set;, "Ljava/util/Set<Lcom/google/common/eventbus/EventHandler;>;"
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Class<*>;Ljava/util/Collection<Lcom/google/common/eventbus/EventHandler;>;>;"
    .end local v2    # "eventMethodsInListener":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/google/common/eventbus/EventHandler;>;"
    .end local v3    # "eventType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_76
    return-void
.end method
