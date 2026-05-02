.class public Lfreemarker/cache/StrongCacheStorage;
.super Ljava/lang/Object;
.source "StrongCacheStorage.java"

# interfaces
.implements Lfreemarker/cache/ConcurrentCacheStorage;


# instance fields
.field private final map:Ljava/util/Map;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 73
    invoke-static {}, Lfreemarker/core/_ConcurrentMapFactory;->newMaybeConcurrentHashMap()Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/cache/StrongCacheStorage;->map:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public clear()V
    .registers 2

    .prologue
    .line 95
    iget-object v0, p0, Lfreemarker/cache/StrongCacheStorage;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 96
    return-void
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 83
    iget-object v0, p0, Lfreemarker/cache/StrongCacheStorage;->map:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public isConcurrent()Z
    .registers 2

    .prologue
    .line 79
    iget-object v0, p0, Lfreemarker/cache/StrongCacheStorage;->map:Ljava/util/Map;

    invoke-static {v0}, Lfreemarker/core/_ConcurrentMapFactory;->isConcurrent(Ljava/util/Map;)Z

    move-result v0

    return v0
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 4
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 87
    iget-object v0, p0, Lfreemarker/cache/StrongCacheStorage;->map:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    return-void
.end method

.method public remove(Ljava/lang/Object;)V
    .registers 3
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 91
    iget-object v0, p0, Lfreemarker/cache/StrongCacheStorage;->map:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    return-void
.end method
