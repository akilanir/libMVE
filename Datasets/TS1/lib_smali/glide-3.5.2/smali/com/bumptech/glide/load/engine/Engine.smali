.class public Lcom/bumptech/glide/load/engine/Engine;
.super Ljava/lang/Object;
.source "Engine.java"

# interfaces
.implements Lcom/bumptech/glide/load/engine/EngineJobListener;
.implements Lcom/bumptech/glide/load/engine/cache/MemoryCache$ResourceRemovedListener;
.implements Lcom/bumptech/glide/load/engine/EngineResource$ResourceListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;,
        Lcom/bumptech/glide/load/engine/Engine$RefQueueIdleHandler;,
        Lcom/bumptech/glide/load/engine/Engine$ResourceWeakReference;,
        Lcom/bumptech/glide/load/engine/Engine$LazyDiskCacheProvider;,
        Lcom/bumptech/glide/load/engine/Engine$LoadStatus;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "Engine"


# instance fields
.field private final activeResources:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/bumptech/glide/load/Key;",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/bumptech/glide/load/engine/EngineResource",
            "<*>;>;>;"
        }
    .end annotation
.end field

.field private final cache:Lcom/bumptech/glide/load/engine/cache/MemoryCache;

.field private final diskCacheProvider:Lcom/bumptech/glide/load/engine/Engine$LazyDiskCacheProvider;

.field private final engineJobFactory:Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;

.field private final jobs:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/bumptech/glide/load/Key;",
            "Lcom/bumptech/glide/load/engine/EngineJob;",
            ">;"
        }
    .end annotation
.end field

.field private final keyFactory:Lcom/bumptech/glide/load/engine/EngineKeyFactory;

.field private final resourceRecycler:Lcom/bumptech/glide/load/engine/ResourceRecycler;

.field private resourceReferenceQueue:Ljava/lang/ref/ReferenceQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/ReferenceQueue",
            "<",
            "Lcom/bumptech/glide/load/engine/EngineResource",
            "<*>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/bumptech/glide/load/engine/cache/MemoryCache;Lcom/bumptech/glide/load/engine/cache/DiskCache$Factory;Ljava/util/concurrent/ExecutorService;Ljava/util/concurrent/ExecutorService;)V
    .registers 15
    .param p1, "memoryCache"    # Lcom/bumptech/glide/load/engine/cache/MemoryCache;
    .param p2, "diskCacheFactory"    # Lcom/bumptech/glide/load/engine/cache/DiskCache$Factory;
    .param p3, "diskCacheService"    # Ljava/util/concurrent/ExecutorService;
    .param p4, "sourceService"    # Ljava/util/concurrent/ExecutorService;

    .prologue
    const/4 v5, 0x0

    .line 62
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v6, v5

    move-object v7, v5

    move-object v8, v5

    move-object v9, v5

    invoke-direct/range {v0 .. v9}, Lcom/bumptech/glide/load/engine/Engine;-><init>(Lcom/bumptech/glide/load/engine/cache/MemoryCache;Lcom/bumptech/glide/load/engine/cache/DiskCache$Factory;Ljava/util/concurrent/ExecutorService;Ljava/util/concurrent/ExecutorService;Ljava/util/Map;Lcom/bumptech/glide/load/engine/EngineKeyFactory;Ljava/util/Map;Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;Lcom/bumptech/glide/load/engine/ResourceRecycler;)V

    .line 63
    return-void
.end method

.method constructor <init>(Lcom/bumptech/glide/load/engine/cache/MemoryCache;Lcom/bumptech/glide/load/engine/cache/DiskCache$Factory;Ljava/util/concurrent/ExecutorService;Ljava/util/concurrent/ExecutorService;Ljava/util/Map;Lcom/bumptech/glide/load/engine/EngineKeyFactory;Ljava/util/Map;Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;Lcom/bumptech/glide/load/engine/ResourceRecycler;)V
    .registers 11
    .param p1, "cache"    # Lcom/bumptech/glide/load/engine/cache/MemoryCache;
    .param p2, "diskCacheFactory"    # Lcom/bumptech/glide/load/engine/cache/DiskCache$Factory;
    .param p3, "diskCacheService"    # Ljava/util/concurrent/ExecutorService;
    .param p4, "sourceService"    # Ljava/util/concurrent/ExecutorService;
    .param p6, "keyFactory"    # Lcom/bumptech/glide/load/engine/EngineKeyFactory;
    .param p8, "engineJobFactory"    # Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;
    .param p9, "resourceRecycler"    # Lcom/bumptech/glide/load/engine/ResourceRecycler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/engine/cache/MemoryCache;",
            "Lcom/bumptech/glide/load/engine/cache/DiskCache$Factory;",
            "Ljava/util/concurrent/ExecutorService;",
            "Ljava/util/concurrent/ExecutorService;",
            "Ljava/util/Map",
            "<",
            "Lcom/bumptech/glide/load/Key;",
            "Lcom/bumptech/glide/load/engine/EngineJob;",
            ">;",
            "Lcom/bumptech/glide/load/engine/EngineKeyFactory;",
            "Ljava/util/Map",
            "<",
            "Lcom/bumptech/glide/load/Key;",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/bumptech/glide/load/engine/EngineResource",
            "<*>;>;>;",
            "Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;",
            "Lcom/bumptech/glide/load/engine/ResourceRecycler;",
            ")V"
        }
    .end annotation

    .prologue
    .line 69
    .local p5, "jobs":Ljava/util/Map;, "Ljava/util/Map<Lcom/bumptech/glide/load/Key;Lcom/bumptech/glide/load/engine/EngineJob;>;"
    .local p7, "activeResources":Ljava/util/Map;, "Ljava/util/Map<Lcom/bumptech/glide/load/Key;Ljava/lang/ref/WeakReference<Lcom/bumptech/glide/load/engine/EngineResource<*>;>;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    iput-object p1, p0, Lcom/bumptech/glide/load/engine/Engine;->cache:Lcom/bumptech/glide/load/engine/cache/MemoryCache;

    .line 71
    new-instance v0, Lcom/bumptech/glide/load/engine/Engine$LazyDiskCacheProvider;

    invoke-direct {v0, p2}, Lcom/bumptech/glide/load/engine/Engine$LazyDiskCacheProvider;-><init>(Lcom/bumptech/glide/load/engine/cache/DiskCache$Factory;)V

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/Engine;->diskCacheProvider:Lcom/bumptech/glide/load/engine/Engine$LazyDiskCacheProvider;

    .line 73
    if-nez p7, :cond_13

    .line 74
    new-instance p7, Ljava/util/HashMap;

    .end local p7    # "activeResources":Ljava/util/Map;, "Ljava/util/Map<Lcom/bumptech/glide/load/Key;Ljava/lang/ref/WeakReference<Lcom/bumptech/glide/load/engine/EngineResource<*>;>;>;"
    invoke-direct {p7}, Ljava/util/HashMap;-><init>()V

    .line 76
    .restart local p7    # "activeResources":Ljava/util/Map;, "Ljava/util/Map<Lcom/bumptech/glide/load/Key;Ljava/lang/ref/WeakReference<Lcom/bumptech/glide/load/engine/EngineResource<*>;>;>;"
    :cond_13
    iput-object p7, p0, Lcom/bumptech/glide/load/engine/Engine;->activeResources:Ljava/util/Map;

    .line 78
    if-nez p6, :cond_1c

    .line 79
    new-instance p6, Lcom/bumptech/glide/load/engine/EngineKeyFactory;

    .end local p6    # "keyFactory":Lcom/bumptech/glide/load/engine/EngineKeyFactory;
    invoke-direct {p6}, Lcom/bumptech/glide/load/engine/EngineKeyFactory;-><init>()V

    .line 81
    .restart local p6    # "keyFactory":Lcom/bumptech/glide/load/engine/EngineKeyFactory;
    :cond_1c
    iput-object p6, p0, Lcom/bumptech/glide/load/engine/Engine;->keyFactory:Lcom/bumptech/glide/load/engine/EngineKeyFactory;

    .line 83
    if-nez p5, :cond_25

    .line 84
    new-instance p5, Ljava/util/HashMap;

    .end local p5    # "jobs":Ljava/util/Map;, "Ljava/util/Map<Lcom/bumptech/glide/load/Key;Lcom/bumptech/glide/load/engine/EngineJob;>;"
    invoke-direct {p5}, Ljava/util/HashMap;-><init>()V

    .line 86
    .restart local p5    # "jobs":Ljava/util/Map;, "Ljava/util/Map<Lcom/bumptech/glide/load/Key;Lcom/bumptech/glide/load/engine/EngineJob;>;"
    :cond_25
    iput-object p5, p0, Lcom/bumptech/glide/load/engine/Engine;->jobs:Ljava/util/Map;

    .line 88
    if-nez p8, :cond_2e

    .line 89
    new-instance p8, Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;

    .end local p8    # "engineJobFactory":Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;
    invoke-direct {p8, p3, p4, p0}, Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;-><init>(Ljava/util/concurrent/ExecutorService;Ljava/util/concurrent/ExecutorService;Lcom/bumptech/glide/load/engine/EngineJobListener;)V

    .line 91
    .restart local p8    # "engineJobFactory":Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;
    :cond_2e
    iput-object p8, p0, Lcom/bumptech/glide/load/engine/Engine;->engineJobFactory:Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;

    .line 93
    if-nez p9, :cond_37

    .line 94
    new-instance p9, Lcom/bumptech/glide/load/engine/ResourceRecycler;

    .end local p9    # "resourceRecycler":Lcom/bumptech/glide/load/engine/ResourceRecycler;
    invoke-direct {p9}, Lcom/bumptech/glide/load/engine/ResourceRecycler;-><init>()V

    .line 96
    .restart local p9    # "resourceRecycler":Lcom/bumptech/glide/load/engine/ResourceRecycler;
    :cond_37
    iput-object p9, p0, Lcom/bumptech/glide/load/engine/Engine;->resourceRecycler:Lcom/bumptech/glide/load/engine/ResourceRecycler;

    .line 98
    invoke-interface {p1, p0}, Lcom/bumptech/glide/load/engine/cache/MemoryCache;->setResourceRemovedListener(Lcom/bumptech/glide/load/engine/cache/MemoryCache$ResourceRemovedListener;)V

    .line 99
    return-void
.end method

.method private getEngineResourceFromCache(Lcom/bumptech/glide/load/Key;)Lcom/bumptech/glide/load/engine/EngineResource;
    .registers 5
    .param p1, "key"    # Lcom/bumptech/glide/load/Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/Key;",
            ")",
            "Lcom/bumptech/glide/load/engine/EngineResource",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 231
    iget-object v2, p0, Lcom/bumptech/glide/load/engine/Engine;->cache:Lcom/bumptech/glide/load/engine/cache/MemoryCache;

    invoke-interface {v2, p1}, Lcom/bumptech/glide/load/engine/cache/MemoryCache;->remove(Lcom/bumptech/glide/load/Key;)Lcom/bumptech/glide/load/engine/Resource;

    move-result-object v0

    .line 234
    .local v0, "cached":Lcom/bumptech/glide/load/engine/Resource;, "Lcom/bumptech/glide/load/engine/Resource<*>;"
    if-nez v0, :cond_a

    .line 235
    const/4 v1, 0x0

    .line 242
    .local v1, "result":Lcom/bumptech/glide/load/engine/EngineResource;
    :goto_9
    return-object v1

    .line 236
    .end local v1    # "result":Lcom/bumptech/glide/load/engine/EngineResource;
    :cond_a
    instance-of v2, v0, Lcom/bumptech/glide/load/engine/EngineResource;

    if-eqz v2, :cond_12

    move-object v1, v0

    .line 238
    check-cast v1, Lcom/bumptech/glide/load/engine/EngineResource;

    .restart local v1    # "result":Lcom/bumptech/glide/load/engine/EngineResource;
    goto :goto_9

    .line 240
    .end local v1    # "result":Lcom/bumptech/glide/load/engine/EngineResource;
    :cond_12
    new-instance v1, Lcom/bumptech/glide/load/engine/EngineResource;

    const/4 v2, 0x1

    invoke-direct {v1, v0, v2}, Lcom/bumptech/glide/load/engine/EngineResource;-><init>(Lcom/bumptech/glide/load/engine/Resource;Z)V

    .restart local v1    # "result":Lcom/bumptech/glide/load/engine/EngineResource;
    goto :goto_9
.end method

.method private getReferenceQueue()Ljava/lang/ref/ReferenceQueue;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/ref/ReferenceQueue",
            "<",
            "Lcom/bumptech/glide/load/engine/EngineResource",
            "<*>;>;"
        }
    .end annotation

    .prologue
    .line 297
    iget-object v1, p0, Lcom/bumptech/glide/load/engine/Engine;->resourceReferenceQueue:Ljava/lang/ref/ReferenceQueue;

    if-nez v1, :cond_1b

    .line 298
    new-instance v1, Ljava/lang/ref/ReferenceQueue;

    invoke-direct {v1}, Ljava/lang/ref/ReferenceQueue;-><init>()V

    iput-object v1, p0, Lcom/bumptech/glide/load/engine/Engine;->resourceReferenceQueue:Ljava/lang/ref/ReferenceQueue;

    .line 299
    invoke-static {}, Landroid/os/Looper;->myQueue()Landroid/os/MessageQueue;

    move-result-object v0

    .line 300
    .local v0, "queue":Landroid/os/MessageQueue;
    new-instance v1, Lcom/bumptech/glide/load/engine/Engine$RefQueueIdleHandler;

    iget-object v2, p0, Lcom/bumptech/glide/load/engine/Engine;->activeResources:Ljava/util/Map;

    iget-object v3, p0, Lcom/bumptech/glide/load/engine/Engine;->resourceReferenceQueue:Ljava/lang/ref/ReferenceQueue;

    invoke-direct {v1, v2, v3}, Lcom/bumptech/glide/load/engine/Engine$RefQueueIdleHandler;-><init>(Ljava/util/Map;Ljava/lang/ref/ReferenceQueue;)V

    invoke-virtual {v0, v1}, Landroid/os/MessageQueue;->addIdleHandler(Landroid/os/MessageQueue$IdleHandler;)V

    .line 302
    .end local v0    # "queue":Landroid/os/MessageQueue;
    :cond_1b
    iget-object v1, p0, Lcom/bumptech/glide/load/engine/Engine;->resourceReferenceQueue:Ljava/lang/ref/ReferenceQueue;

    return-object v1
.end method

.method private loadFromActiveResources(Lcom/bumptech/glide/load/Key;Z)Lcom/bumptech/glide/load/engine/EngineResource;
    .registers 6
    .param p1, "key"    # Lcom/bumptech/glide/load/Key;
    .param p2, "isMemoryCacheable"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/Key;",
            "Z)",
            "Lcom/bumptech/glide/load/engine/EngineResource",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 198
    if-nez p2, :cond_4

    .line 199
    const/4 v0, 0x0

    .line 213
    :cond_3
    :goto_3
    return-object v0

    .line 202
    :cond_4
    const/4 v0, 0x0

    .line 203
    .local v0, "active":Lcom/bumptech/glide/load/engine/EngineResource;, "Lcom/bumptech/glide/load/engine/EngineResource<*>;"
    iget-object v2, p0, Lcom/bumptech/glide/load/engine/Engine;->activeResources:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/WeakReference;

    .line 204
    .local v1, "activeRef":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Lcom/bumptech/glide/load/engine/EngineResource<*>;>;"
    if-eqz v1, :cond_3

    .line 205
    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "active":Lcom/bumptech/glide/load/engine/EngineResource;, "Lcom/bumptech/glide/load/engine/EngineResource<*>;"
    check-cast v0, Lcom/bumptech/glide/load/engine/EngineResource;

    .line 206
    .restart local v0    # "active":Lcom/bumptech/glide/load/engine/EngineResource;, "Lcom/bumptech/glide/load/engine/EngineResource<*>;"
    if-eqz v0, :cond_1b

    .line 207
    invoke-virtual {v0}, Lcom/bumptech/glide/load/engine/EngineResource;->acquire()V

    goto :goto_3

    .line 209
    :cond_1b
    iget-object v2, p0, Lcom/bumptech/glide/load/engine/Engine;->activeResources:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3
.end method

.method private loadFromCache(Lcom/bumptech/glide/load/Key;Z)Lcom/bumptech/glide/load/engine/EngineResource;
    .registers 7
    .param p1, "key"    # Lcom/bumptech/glide/load/Key;
    .param p2, "isMemoryCacheable"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/Key;",
            "Z)",
            "Lcom/bumptech/glide/load/engine/EngineResource",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 217
    if-nez p2, :cond_4

    .line 218
    const/4 v0, 0x0

    .line 226
    :cond_3
    :goto_3
    return-object v0

    .line 221
    :cond_4
    invoke-direct {p0, p1}, Lcom/bumptech/glide/load/engine/Engine;->getEngineResourceFromCache(Lcom/bumptech/glide/load/Key;)Lcom/bumptech/glide/load/engine/EngineResource;

    move-result-object v0

    .line 222
    .local v0, "cached":Lcom/bumptech/glide/load/engine/EngineResource;, "Lcom/bumptech/glide/load/engine/EngineResource<*>;"
    if-eqz v0, :cond_3

    .line 223
    invoke-virtual {v0}, Lcom/bumptech/glide/load/engine/EngineResource;->acquire()V

    .line 224
    iget-object v1, p0, Lcom/bumptech/glide/load/engine/Engine;->activeResources:Ljava/util/Map;

    new-instance v2, Lcom/bumptech/glide/load/engine/Engine$ResourceWeakReference;

    invoke-direct {p0}, Lcom/bumptech/glide/load/engine/Engine;->getReferenceQueue()Ljava/lang/ref/ReferenceQueue;

    move-result-object v3

    invoke-direct {v2, p1, v0, v3}, Lcom/bumptech/glide/load/engine/Engine$ResourceWeakReference;-><init>(Lcom/bumptech/glide/load/Key;Lcom/bumptech/glide/load/engine/EngineResource;Ljava/lang/ref/ReferenceQueue;)V

    invoke-interface {v1, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3
.end method

.method private static logWithTimeAndKey(Ljava/lang/String;JLcom/bumptech/glide/load/Key;)V
    .registers 8
    .param p0, "log"    # Ljava/lang/String;
    .param p1, "startTime"    # J
    .param p3, "key"    # Lcom/bumptech/glide/load/Key;

    .prologue
    .line 194
    const-string v0, "Engine"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " in "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p1, p2}, Lcom/bumptech/glide/util/LogTime;->getElapsedMillis(J)D

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "ms, key: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 195
    return-void
.end method


# virtual methods
.method public load(Lcom/bumptech/glide/load/Key;IILcom/bumptech/glide/load/data/DataFetcher;Lcom/bumptech/glide/provider/DataLoadProvider;Lcom/bumptech/glide/load/Transformation;Lcom/bumptech/glide/load/resource/transcode/ResourceTranscoder;Lcom/bumptech/glide/Priority;ZLcom/bumptech/glide/load/engine/DiskCacheStrategy;Lcom/bumptech/glide/request/ResourceCallback;)Lcom/bumptech/glide/load/engine/Engine$LoadStatus;
    .registers 35
    .param p1, "signature"    # Lcom/bumptech/glide/load/Key;
    .param p2, "width"    # I
    .param p3, "height"    # I
    .param p8, "priority"    # Lcom/bumptech/glide/Priority;
    .param p9, "isMemoryCacheable"    # Z
    .param p10, "diskCacheStrategy"    # Lcom/bumptech/glide/load/engine/DiskCacheStrategy;
    .param p11, "cb"    # Lcom/bumptech/glide/request/ResourceCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "Z:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/bumptech/glide/load/Key;",
            "II",
            "Lcom/bumptech/glide/load/data/DataFetcher",
            "<TT;>;",
            "Lcom/bumptech/glide/provider/DataLoadProvider",
            "<TT;TZ;>;",
            "Lcom/bumptech/glide/load/Transformation",
            "<TZ;>;",
            "Lcom/bumptech/glide/load/resource/transcode/ResourceTranscoder",
            "<TZ;TR;>;",
            "Lcom/bumptech/glide/Priority;",
            "Z",
            "Lcom/bumptech/glide/load/engine/DiskCacheStrategy;",
            "Lcom/bumptech/glide/request/ResourceCallback;",
            ")",
            "Lcom/bumptech/glide/load/engine/Engine$LoadStatus;"
        }
    .end annotation

    .prologue
    .line 144
    .local p4, "fetcher":Lcom/bumptech/glide/load/data/DataFetcher;, "Lcom/bumptech/glide/load/data/DataFetcher<TT;>;"
    .local p5, "loadProvider":Lcom/bumptech/glide/provider/DataLoadProvider;, "Lcom/bumptech/glide/provider/DataLoadProvider<TT;TZ;>;"
    .local p6, "transformation":Lcom/bumptech/glide/load/Transformation;, "Lcom/bumptech/glide/load/Transformation<TZ;>;"
    .local p7, "transcoder":Lcom/bumptech/glide/load/resource/transcode/ResourceTranscoder;, "Lcom/bumptech/glide/load/resource/transcode/ResourceTranscoder<TZ;TR;>;"
    invoke-static {}, Lcom/bumptech/glide/util/Util;->assertMainThread()V

    .line 145
    invoke-static {}, Lcom/bumptech/glide/util/LogTime;->getLogTime()J

    move-result-wide v21

    .line 147
    .local v21, "startTime":J
    invoke-interface/range {p4 .. p4}, Lcom/bumptech/glide/load/data/DataFetcher;->getId()Ljava/lang/String;

    move-result-object v4

    .line 148
    .local v4, "id":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/bumptech/glide/load/engine/Engine;->keyFactory:Lcom/bumptech/glide/load/engine/EngineKeyFactory;

    invoke-interface/range {p5 .. p5}, Lcom/bumptech/glide/provider/DataLoadProvider;->getCacheDecoder()Lcom/bumptech/glide/load/ResourceDecoder;

    move-result-object v8

    invoke-interface/range {p5 .. p5}, Lcom/bumptech/glide/provider/DataLoadProvider;->getSourceDecoder()Lcom/bumptech/glide/load/ResourceDecoder;

    move-result-object v9

    invoke-interface/range {p5 .. p5}, Lcom/bumptech/glide/provider/DataLoadProvider;->getEncoder()Lcom/bumptech/glide/load/ResourceEncoder;

    move-result-object v11

    invoke-interface/range {p5 .. p5}, Lcom/bumptech/glide/provider/DataLoadProvider;->getSourceEncoder()Lcom/bumptech/glide/load/Encoder;

    move-result-object v13

    move-object/from16 v5, p1

    move/from16 v6, p2

    move/from16 v7, p3

    move-object/from16 v10, p6

    move-object/from16 v12, p7

    invoke-virtual/range {v3 .. v13}, Lcom/bumptech/glide/load/engine/EngineKeyFactory;->buildKey(Ljava/lang/String;Lcom/bumptech/glide/load/Key;IILcom/bumptech/glide/load/ResourceDecoder;Lcom/bumptech/glide/load/ResourceDecoder;Lcom/bumptech/glide/load/Transformation;Lcom/bumptech/glide/load/ResourceEncoder;Lcom/bumptech/glide/load/resource/transcode/ResourceTranscoder;Lcom/bumptech/glide/load/Encoder;)Lcom/bumptech/glide/load/engine/EngineKey;

    move-result-object v6

    .line 152
    .local v6, "key":Lcom/bumptech/glide/load/engine/EngineKey;
    move-object/from16 v0, p0

    move/from16 v1, p9

    invoke-direct {v0, v6, v1}, Lcom/bumptech/glide/load/engine/Engine;->loadFromCache(Lcom/bumptech/glide/load/Key;Z)Lcom/bumptech/glide/load/engine/EngineResource;

    move-result-object v17

    .line 153
    .local v17, "cached":Lcom/bumptech/glide/load/engine/EngineResource;, "Lcom/bumptech/glide/load/engine/EngineResource<*>;"
    if-eqz v17, :cond_50

    .line 154
    move-object/from16 v0, p11

    move-object/from16 v1, v17

    invoke-interface {v0, v1}, Lcom/bumptech/glide/request/ResourceCallback;->onResourceReady(Lcom/bumptech/glide/load/engine/Resource;)V

    .line 155
    const-string v3, "Engine"

    const/4 v7, 0x2

    invoke-static {v3, v7}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_4e

    .line 156
    const-string v3, "Loaded resource from cache"

    move-wide/from16 v0, v21

    invoke-static {v3, v0, v1, v6}, Lcom/bumptech/glide/load/engine/Engine;->logWithTimeAndKey(Ljava/lang/String;JLcom/bumptech/glide/load/Key;)V

    .line 158
    :cond_4e
    const/4 v3, 0x0

    .line 190
    :goto_4f
    return-object v3

    .line 161
    :cond_50
    move-object/from16 v0, p0

    move/from16 v1, p9

    invoke-direct {v0, v6, v1}, Lcom/bumptech/glide/load/engine/Engine;->loadFromActiveResources(Lcom/bumptech/glide/load/Key;Z)Lcom/bumptech/glide/load/engine/EngineResource;

    move-result-object v16

    .line 162
    .local v16, "active":Lcom/bumptech/glide/load/engine/EngineResource;, "Lcom/bumptech/glide/load/engine/EngineResource<*>;"
    if-eqz v16, :cond_73

    .line 163
    move-object/from16 v0, p11

    move-object/from16 v1, v16

    invoke-interface {v0, v1}, Lcom/bumptech/glide/request/ResourceCallback;->onResourceReady(Lcom/bumptech/glide/load/engine/Resource;)V

    .line 164
    const-string v3, "Engine"

    const/4 v7, 0x2

    invoke-static {v3, v7}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_71

    .line 165
    const-string v3, "Loaded resource from active resources"

    move-wide/from16 v0, v21

    invoke-static {v3, v0, v1, v6}, Lcom/bumptech/glide/load/engine/Engine;->logWithTimeAndKey(Ljava/lang/String;JLcom/bumptech/glide/load/Key;)V

    .line 167
    :cond_71
    const/4 v3, 0x0

    goto :goto_4f

    .line 170
    :cond_73
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/bumptech/glide/load/engine/Engine;->jobs:Ljava/util/Map;

    invoke-interface {v3, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lcom/bumptech/glide/load/engine/EngineJob;

    .line 171
    .local v18, "current":Lcom/bumptech/glide/load/engine/EngineJob;
    if-eqz v18, :cond_a0

    .line 172
    move-object/from16 v0, v18

    move-object/from16 v1, p11

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/load/engine/EngineJob;->addCallback(Lcom/bumptech/glide/request/ResourceCallback;)V

    .line 173
    const-string v3, "Engine"

    const/4 v7, 0x2

    invoke-static {v3, v7}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_96

    .line 174
    const-string v3, "Added to existing load"

    move-wide/from16 v0, v21

    invoke-static {v3, v0, v1, v6}, Lcom/bumptech/glide/load/engine/Engine;->logWithTimeAndKey(Ljava/lang/String;JLcom/bumptech/glide/load/Key;)V

    .line 176
    :cond_96
    new-instance v3, Lcom/bumptech/glide/load/engine/Engine$LoadStatus;

    move-object/from16 v0, p11

    move-object/from16 v1, v18

    invoke-direct {v3, v0, v1}, Lcom/bumptech/glide/load/engine/Engine$LoadStatus;-><init>(Lcom/bumptech/glide/request/ResourceCallback;Lcom/bumptech/glide/load/engine/EngineJob;)V

    goto :goto_4f

    .line 179
    :cond_a0
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/bumptech/glide/load/engine/Engine;->engineJobFactory:Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;

    move/from16 v0, p9

    invoke-virtual {v3, v6, v0}, Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;->build(Lcom/bumptech/glide/load/Key;Z)Lcom/bumptech/glide/load/engine/EngineJob;

    move-result-object v19

    .line 180
    .local v19, "engineJob":Lcom/bumptech/glide/load/engine/EngineJob;
    new-instance v5, Lcom/bumptech/glide/load/engine/DecodeJob;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/bumptech/glide/load/engine/Engine;->diskCacheProvider:Lcom/bumptech/glide/load/engine/Engine$LazyDiskCacheProvider;

    move/from16 v7, p2

    move/from16 v8, p3

    move-object/from16 v9, p4

    move-object/from16 v10, p5

    move-object/from16 v11, p6

    move-object/from16 v12, p7

    move-object/from16 v14, p10

    move-object/from16 v15, p8

    invoke-direct/range {v5 .. v15}, Lcom/bumptech/glide/load/engine/DecodeJob;-><init>(Lcom/bumptech/glide/load/engine/EngineKey;IILcom/bumptech/glide/load/data/DataFetcher;Lcom/bumptech/glide/provider/DataLoadProvider;Lcom/bumptech/glide/load/Transformation;Lcom/bumptech/glide/load/resource/transcode/ResourceTranscoder;Lcom/bumptech/glide/load/engine/DecodeJob$DiskCacheProvider;Lcom/bumptech/glide/load/engine/DiskCacheStrategy;Lcom/bumptech/glide/Priority;)V

    .line 182
    .local v5, "decodeJob":Lcom/bumptech/glide/load/engine/DecodeJob;, "Lcom/bumptech/glide/load/engine/DecodeJob<TT;TZ;TR;>;"
    new-instance v20, Lcom/bumptech/glide/load/engine/EngineRunnable;

    move-object/from16 v0, v20

    move-object/from16 v1, v19

    move-object/from16 v2, p8

    invoke-direct {v0, v1, v5, v2}, Lcom/bumptech/glide/load/engine/EngineRunnable;-><init>(Lcom/bumptech/glide/load/engine/EngineRunnable$EngineRunnableManager;Lcom/bumptech/glide/load/engine/DecodeJob;Lcom/bumptech/glide/Priority;)V

    .line 183
    .local v20, "runnable":Lcom/bumptech/glide/load/engine/EngineRunnable;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/bumptech/glide/load/engine/Engine;->jobs:Ljava/util/Map;

    move-object/from16 v0, v19

    invoke-interface {v3, v6, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 184
    move-object/from16 v0, v19

    move-object/from16 v1, p11

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/load/engine/EngineJob;->addCallback(Lcom/bumptech/glide/request/ResourceCallback;)V

    .line 185
    invoke-virtual/range {v19 .. v20}, Lcom/bumptech/glide/load/engine/EngineJob;->start(Lcom/bumptech/glide/load/engine/EngineRunnable;)V

    .line 187
    const-string v3, "Engine"

    const/4 v7, 0x2

    invoke-static {v3, v7}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_f1

    .line 188
    const-string v3, "Started new load"

    move-wide/from16 v0, v21

    invoke-static {v3, v0, v1, v6}, Lcom/bumptech/glide/load/engine/Engine;->logWithTimeAndKey(Ljava/lang/String;JLcom/bumptech/glide/load/Key;)V

    .line 190
    :cond_f1
    new-instance v3, Lcom/bumptech/glide/load/engine/Engine$LoadStatus;

    move-object/from16 v0, p11

    move-object/from16 v1, v19

    invoke-direct {v3, v0, v1}, Lcom/bumptech/glide/load/engine/Engine$LoadStatus;-><init>(Lcom/bumptech/glide/request/ResourceCallback;Lcom/bumptech/glide/load/engine/EngineJob;)V

    goto/16 :goto_4f
.end method

.method public onEngineJobCancelled(Lcom/bumptech/glide/load/engine/EngineJob;Lcom/bumptech/glide/load/Key;)V
    .registers 5
    .param p1, "engineJob"    # Lcom/bumptech/glide/load/engine/EngineJob;
    .param p2, "key"    # Lcom/bumptech/glide/load/Key;

    .prologue
    .line 272
    invoke-static {}, Lcom/bumptech/glide/util/Util;->assertMainThread()V

    .line 273
    iget-object v1, p0, Lcom/bumptech/glide/load/engine/Engine;->jobs:Ljava/util/Map;

    invoke-interface {v1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bumptech/glide/load/engine/EngineJob;

    .line 274
    .local v0, "current":Lcom/bumptech/glide/load/engine/EngineJob;
    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_16

    .line 275
    iget-object v1, p0, Lcom/bumptech/glide/load/engine/Engine;->jobs:Ljava/util/Map;

    invoke-interface {v1, p2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 277
    :cond_16
    return-void
.end method

.method public onEngineJobComplete(Lcom/bumptech/glide/load/Key;Lcom/bumptech/glide/load/engine/EngineResource;)V
    .registers 6
    .param p1, "key"    # Lcom/bumptech/glide/load/Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/Key;",
            "Lcom/bumptech/glide/load/engine/EngineResource",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 257
    .local p2, "resource":Lcom/bumptech/glide/load/engine/EngineResource;, "Lcom/bumptech/glide/load/engine/EngineResource<*>;"
    invoke-static {}, Lcom/bumptech/glide/util/Util;->assertMainThread()V

    .line 259
    if-eqz p2, :cond_1c

    .line 260
    invoke-virtual {p2, p1, p0}, Lcom/bumptech/glide/load/engine/EngineResource;->setResourceListener(Lcom/bumptech/glide/load/Key;Lcom/bumptech/glide/load/engine/EngineResource$ResourceListener;)V

    .line 262
    invoke-virtual {p2}, Lcom/bumptech/glide/load/engine/EngineResource;->isCacheable()Z

    move-result v0

    if-eqz v0, :cond_1c

    .line 263
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/Engine;->activeResources:Ljava/util/Map;

    new-instance v1, Lcom/bumptech/glide/load/engine/Engine$ResourceWeakReference;

    invoke-direct {p0}, Lcom/bumptech/glide/load/engine/Engine;->getReferenceQueue()Ljava/lang/ref/ReferenceQueue;

    move-result-object v2

    invoke-direct {v1, p1, p2, v2}, Lcom/bumptech/glide/load/engine/Engine$ResourceWeakReference;-><init>(Lcom/bumptech/glide/load/Key;Lcom/bumptech/glide/load/engine/EngineResource;Ljava/lang/ref/ReferenceQueue;)V

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 267
    :cond_1c
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/Engine;->jobs:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 268
    return-void
.end method

.method public onResourceReleased(Lcom/bumptech/glide/load/Key;Lcom/bumptech/glide/load/engine/EngineResource;)V
    .registers 4
    .param p1, "cacheKey"    # Lcom/bumptech/glide/load/Key;
    .param p2, "resource"    # Lcom/bumptech/glide/load/engine/EngineResource;

    .prologue
    .line 287
    invoke-static {}, Lcom/bumptech/glide/util/Util;->assertMainThread()V

    .line 288
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/Engine;->activeResources:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 289
    invoke-virtual {p2}, Lcom/bumptech/glide/load/engine/EngineResource;->isCacheable()Z

    move-result v0

    if-eqz v0, :cond_14

    .line 290
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/Engine;->cache:Lcom/bumptech/glide/load/engine/cache/MemoryCache;

    invoke-interface {v0, p1, p2}, Lcom/bumptech/glide/load/engine/cache/MemoryCache;->put(Lcom/bumptech/glide/load/Key;Lcom/bumptech/glide/load/engine/Resource;)Lcom/bumptech/glide/load/engine/Resource;

    .line 294
    :goto_13
    return-void

    .line 292
    :cond_14
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/Engine;->resourceRecycler:Lcom/bumptech/glide/load/engine/ResourceRecycler;

    invoke-virtual {v0, p2}, Lcom/bumptech/glide/load/engine/ResourceRecycler;->recycle(Lcom/bumptech/glide/load/engine/Resource;)V

    goto :goto_13
.end method

.method public onResourceRemoved(Lcom/bumptech/glide/load/engine/Resource;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/engine/Resource",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 281
    .local p1, "resource":Lcom/bumptech/glide/load/engine/Resource;, "Lcom/bumptech/glide/load/engine/Resource<*>;"
    invoke-static {}, Lcom/bumptech/glide/util/Util;->assertMainThread()V

    .line 282
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/Engine;->resourceRecycler:Lcom/bumptech/glide/load/engine/ResourceRecycler;

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/load/engine/ResourceRecycler;->recycle(Lcom/bumptech/glide/load/engine/Resource;)V

    .line 283
    return-void
.end method

.method public release(Lcom/bumptech/glide/load/engine/Resource;)V
    .registers 4
    .param p1, "resource"    # Lcom/bumptech/glide/load/engine/Resource;

    .prologue
    .line 246
    invoke-static {}, Lcom/bumptech/glide/util/Util;->assertMainThread()V

    .line 247
    instance-of v0, p1, Lcom/bumptech/glide/load/engine/EngineResource;

    if-eqz v0, :cond_d

    .line 248
    check-cast p1, Lcom/bumptech/glide/load/engine/EngineResource;

    .end local p1    # "resource":Lcom/bumptech/glide/load/engine/Resource;
    invoke-virtual {p1}, Lcom/bumptech/glide/load/engine/EngineResource;->release()V

    .line 252
    return-void

    .line 250
    .restart local p1    # "resource":Lcom/bumptech/glide/load/engine/Resource;
    :cond_d
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Cannot release anything but an EngineResource"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
