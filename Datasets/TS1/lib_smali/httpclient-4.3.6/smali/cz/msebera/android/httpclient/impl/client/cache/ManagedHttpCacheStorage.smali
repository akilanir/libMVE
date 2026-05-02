.class public Lcz/msebera/android/httpclient/impl/client/cache/ManagedHttpCacheStorage;
.super Ljava/lang/Object;
.source "ManagedHttpCacheStorage.java"

# interfaces
.implements Lcz/msebera/android/httpclient/client/cache/HttpCacheStorage;
.implements Ljava/io/Closeable;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/ThreadSafe;
.end annotation


# instance fields
.field private final active:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final entries:Lcz/msebera/android/httpclient/impl/client/cache/CacheMap;

.field private final morque:Ljava/lang/ref/ReferenceQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/ReferenceQueue",
            "<",
            "Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;",
            ">;"
        }
    .end annotation
.end field

.field private final resources:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcz/msebera/android/httpclient/impl/client/cache/ResourceReference;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;)V
    .registers 4
    .param p1, "config"    # Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;

    .prologue
    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    new-instance v0, Lcz/msebera/android/httpclient/impl/client/cache/CacheMap;

    invoke-virtual {p1}, Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;->getMaxCacheEntries()I

    move-result v1

    invoke-direct {v0, v1}, Lcz/msebera/android/httpclient/impl/client/cache/CacheMap;-><init>(I)V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/ManagedHttpCacheStorage;->entries:Lcz/msebera/android/httpclient/impl/client/cache/CacheMap;

    .line 69
    new-instance v0, Ljava/lang/ref/ReferenceQueue;

    invoke-direct {v0}, Ljava/lang/ref/ReferenceQueue;-><init>()V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/ManagedHttpCacheStorage;->morque:Ljava/lang/ref/ReferenceQueue;

    .line 70
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/ManagedHttpCacheStorage;->resources:Ljava/util/Set;

    .line 71
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/ManagedHttpCacheStorage;->active:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 72
    return-void
.end method

.method private ensureValidState()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .prologue
    .line 75
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/ManagedHttpCacheStorage;->active:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_10

    .line 76
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cache has been shut down"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 78
    :cond_10
    return-void
.end method

.method private keepResourceReference(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)V
    .registers 5
    .param p1, "entry"    # Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;

    .prologue
    .line 81
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;->getResource()Lcz/msebera/android/httpclient/client/cache/Resource;

    move-result-object v1

    .line 82
    .local v1, "resource":Lcz/msebera/android/httpclient/client/cache/Resource;
    if-eqz v1, :cond_12

    .line 84
    new-instance v0, Lcz/msebera/android/httpclient/impl/client/cache/ResourceReference;

    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/client/cache/ManagedHttpCacheStorage;->morque:Ljava/lang/ref/ReferenceQueue;

    invoke-direct {v0, p1, v2}, Lcz/msebera/android/httpclient/impl/client/cache/ResourceReference;-><init>(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;Ljava/lang/ref/ReferenceQueue;)V

    .line 85
    .local v0, "ref":Lcz/msebera/android/httpclient/impl/client/cache/ResourceReference;
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/client/cache/ManagedHttpCacheStorage;->resources:Ljava/util/Set;

    invoke-interface {v2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 87
    .end local v0    # "ref":Lcz/msebera/android/httpclient/impl/client/cache/ResourceReference;
    :cond_12
    return-void
.end method


# virtual methods
.method public cleanResources()V
    .registers 3

    .prologue
    .line 134
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/client/cache/ManagedHttpCacheStorage;->active:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-eqz v1, :cond_24

    .line 136
    :goto_8
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/client/cache/ManagedHttpCacheStorage;->morque:Ljava/lang/ref/ReferenceQueue;

    invoke-virtual {v1}, Ljava/lang/ref/ReferenceQueue;->poll()Ljava/lang/ref/Reference;

    move-result-object v0

    check-cast v0, Lcz/msebera/android/httpclient/impl/client/cache/ResourceReference;

    .local v0, "ref":Lcz/msebera/android/httpclient/impl/client/cache/ResourceReference;
    if-eqz v0, :cond_24

    .line 137
    monitor-enter p0

    .line 138
    :try_start_13
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/client/cache/ManagedHttpCacheStorage;->resources:Ljava/util/Set;

    invoke-interface {v1, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 139
    monitor-exit p0
    :try_end_19
    .catchall {:try_start_13 .. :try_end_19} :catchall_21

    .line 140
    invoke-virtual {v0}, Lcz/msebera/android/httpclient/impl/client/cache/ResourceReference;->getResource()Lcz/msebera/android/httpclient/client/cache/Resource;

    move-result-object v1

    invoke-interface {v1}, Lcz/msebera/android/httpclient/client/cache/Resource;->dispose()V

    goto :goto_8

    .line 139
    :catchall_21
    move-exception v1

    :try_start_22
    monitor-exit p0
    :try_end_23
    .catchall {:try_start_22 .. :try_end_23} :catchall_21

    throw v1

    .line 143
    .end local v0    # "ref":Lcz/msebera/android/httpclient/impl/client/cache/ResourceReference;
    :cond_24
    return-void
.end method

.method public close()V
    .registers 1

    .prologue
    .line 160
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/client/cache/ManagedHttpCacheStorage;->shutdown()V

    .line 161
    return-void
.end method

.method public getEntry(Ljava/lang/String;)Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;
    .registers 3
    .param p1, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 100
    const-string v0, "URL"

    invoke-static {p1, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 101
    invoke-direct {p0}, Lcz/msebera/android/httpclient/impl/client/cache/ManagedHttpCacheStorage;->ensureValidState()V

    .line 102
    monitor-enter p0

    .line 103
    :try_start_9
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/ManagedHttpCacheStorage;->entries:Lcz/msebera/android/httpclient/impl/client/cache/CacheMap;

    invoke-virtual {v0, p1}, Lcz/msebera/android/httpclient/impl/client/cache/CacheMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;

    monitor-exit p0

    return-object v0

    .line 104
    :catchall_13
    move-exception v0

    monitor-exit p0
    :try_end_15
    .catchall {:try_start_9 .. :try_end_15} :catchall_13

    throw v0
.end method

.method public putEntry(Ljava/lang/String;Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)V
    .registers 4
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "entry"    # Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 90
    const-string v0, "URL"

    invoke-static {p1, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 91
    const-string v0, "Cache entry"

    invoke-static {p2, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 92
    invoke-direct {p0}, Lcz/msebera/android/httpclient/impl/client/cache/ManagedHttpCacheStorage;->ensureValidState()V

    .line 93
    monitor-enter p0

    .line 94
    :try_start_e
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/ManagedHttpCacheStorage;->entries:Lcz/msebera/android/httpclient/impl/client/cache/CacheMap;

    invoke-virtual {v0, p1, p2}, Lcz/msebera/android/httpclient/impl/client/cache/CacheMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    invoke-direct {p0, p2}, Lcz/msebera/android/httpclient/impl/client/cache/ManagedHttpCacheStorage;->keepResourceReference(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)V

    .line 96
    monitor-exit p0

    .line 97
    return-void

    .line 96
    :catchall_18
    move-exception v0

    monitor-exit p0
    :try_end_1a
    .catchall {:try_start_e .. :try_end_1a} :catchall_18

    throw v0
.end method

.method public removeEntry(Ljava/lang/String;)V
    .registers 3
    .param p1, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 108
    const-string v0, "URL"

    invoke-static {p1, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 109
    invoke-direct {p0}, Lcz/msebera/android/httpclient/impl/client/cache/ManagedHttpCacheStorage;->ensureValidState()V

    .line 110
    monitor-enter p0

    .line 113
    :try_start_9
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/ManagedHttpCacheStorage;->entries:Lcz/msebera/android/httpclient/impl/client/cache/CacheMap;

    invoke-virtual {v0, p1}, Lcz/msebera/android/httpclient/impl/client/cache/CacheMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    monitor-exit p0

    .line 115
    return-void

    .line 114
    :catchall_10
    move-exception v0

    monitor-exit p0
    :try_end_12
    .catchall {:try_start_9 .. :try_end_12} :catchall_10

    throw v0
.end method

.method public shutdown()V
    .registers 5

    .prologue
    .line 146
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/client/cache/ManagedHttpCacheStorage;->active:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v1

    if-eqz v1, :cond_3b

    .line 147
    monitor-enter p0

    .line 148
    :try_start_b
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/client/cache/ManagedHttpCacheStorage;->entries:Lcz/msebera/android/httpclient/impl/client/cache/CacheMap;

    invoke-virtual {v1}, Lcz/msebera/android/httpclient/impl/client/cache/CacheMap;->clear()V

    .line 149
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/client/cache/ManagedHttpCacheStorage;->resources:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_16
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcz/msebera/android/httpclient/impl/client/cache/ResourceReference;

    .line 150
    .local v0, "ref":Lcz/msebera/android/httpclient/impl/client/cache/ResourceReference;
    invoke-virtual {v0}, Lcz/msebera/android/httpclient/impl/client/cache/ResourceReference;->getResource()Lcz/msebera/android/httpclient/client/cache/Resource;

    move-result-object v2

    invoke-interface {v2}, Lcz/msebera/android/httpclient/client/cache/Resource;->dispose()V

    goto :goto_16

    .line 155
    .end local v0    # "ref":Lcz/msebera/android/httpclient/impl/client/cache/ResourceReference;
    :catchall_2a
    move-exception v1

    monitor-exit p0
    :try_end_2c
    .catchall {:try_start_b .. :try_end_2c} :catchall_2a

    throw v1

    .line 152
    :cond_2d
    :try_start_2d
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/client/cache/ManagedHttpCacheStorage;->resources:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->clear()V

    .line 153
    :cond_32
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/client/cache/ManagedHttpCacheStorage;->morque:Ljava/lang/ref/ReferenceQueue;

    invoke-virtual {v1}, Ljava/lang/ref/ReferenceQueue;->poll()Ljava/lang/ref/Reference;

    move-result-object v1

    if-nez v1, :cond_32

    .line 155
    monitor-exit p0
    :try_end_3b
    .catchall {:try_start_2d .. :try_end_3b} :catchall_2a

    .line 157
    :cond_3b
    return-void
.end method

.method public updateEntry(Ljava/lang/String;Lcz/msebera/android/httpclient/client/cache/HttpCacheUpdateCallback;)V
    .registers 6
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "callback"    # Lcz/msebera/android/httpclient/client/cache/HttpCacheUpdateCallback;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 120
    const-string v2, "URL"

    invoke-static {p1, v2}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 121
    const-string v2, "Callback"

    invoke-static {p2, v2}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 122
    invoke-direct {p0}, Lcz/msebera/android/httpclient/impl/client/cache/ManagedHttpCacheStorage;->ensureValidState()V

    .line 123
    monitor-enter p0

    .line 124
    :try_start_e
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/client/cache/ManagedHttpCacheStorage;->entries:Lcz/msebera/android/httpclient/impl/client/cache/CacheMap;

    invoke-virtual {v2, p1}, Lcz/msebera/android/httpclient/impl/client/cache/CacheMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;

    .line 125
    .local v0, "existing":Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;
    invoke-interface {p2, v0}, Lcz/msebera/android/httpclient/client/cache/HttpCacheUpdateCallback;->update(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;

    move-result-object v1

    .line 126
    .local v1, "updated":Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/client/cache/ManagedHttpCacheStorage;->entries:Lcz/msebera/android/httpclient/impl/client/cache/CacheMap;

    invoke-virtual {v2, p1, v1}, Lcz/msebera/android/httpclient/impl/client/cache/CacheMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    if-eq v0, v1, :cond_24

    .line 128
    invoke-direct {p0, v1}, Lcz/msebera/android/httpclient/impl/client/cache/ManagedHttpCacheStorage;->keepResourceReference(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)V

    .line 130
    :cond_24
    monitor-exit p0

    .line 131
    return-void

    .line 130
    .end local v0    # "existing":Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;
    .end local v1    # "updated":Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;
    :catchall_26
    move-exception v2

    monitor-exit p0
    :try_end_28
    .catchall {:try_start_e .. :try_end_28} :catchall_26

    throw v2
.end method
