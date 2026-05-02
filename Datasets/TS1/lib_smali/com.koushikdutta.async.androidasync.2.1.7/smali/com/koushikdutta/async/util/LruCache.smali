.class public Lcom/koushikdutta/async/util/LruCache;
.super Ljava/lang/Object;
.source "LruCache.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private createCount:I

.field private evictionCount:I

.field private hitCount:I

.field private final map:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap",
            "<TK;TV;>;"
        }
    .end annotation
.end field

.field private maxSize:J

.field private missCount:I

.field private putCount:I

.field private size:J


# direct methods
.method public constructor <init>(J)V
    .registers 7
    .param p1, "maxSize"    # J

    .prologue
    .line 47
    .local p0, "this":Lcom/koushikdutta/async/util/LruCache;, "Lcom/koushikdutta/async/util/LruCache<TK;TV;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gtz v0, :cond_11

    .line 49
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "maxSize <= 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 51
    :cond_11
    iput-wide p1, p0, Lcom/koushikdutta/async/util/LruCache;->maxSize:J

    .line 52
    new-instance v0, Ljava/util/LinkedHashMap;

    const/4 v1, 0x0

    const/high16 v2, 0x3f400000    # 0.75f

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Ljava/util/LinkedHashMap;-><init>(IFZ)V

    iput-object v0, p0, Lcom/koushikdutta/async/util/LruCache;->map:Ljava/util/LinkedHashMap;

    .line 53
    return-void
.end method

.method private safeSizeOf(Ljava/lang/Object;Ljava/lang/Object;)J
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)J"
        }
    .end annotation

    .prologue
    .line 230
    .local p0, "this":Lcom/koushikdutta/async/util/LruCache;, "Lcom/koushikdutta/async/util/LruCache<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "value":Ljava/lang/Object;, "TV;"
    invoke-virtual {p0, p1, p2}, Lcom/koushikdutta/async/util/LruCache;->sizeOf(Ljava/lang/Object;Ljava/lang/Object;)J

    move-result-wide v0

    .line 231
    .local v0, "result":J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-gez v2, :cond_2d

    .line 232
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Negative size: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 234
    :cond_2d
    return-wide v0
.end method

.method private trimToSize(J)V
    .registers 12
    .param p1, "maxSize"    # J

    .prologue
    .local p0, "this":Lcom/koushikdutta/async/util/LruCache;, "Lcom/koushikdutta/async/util/LruCache<TK;TV;>;"
    const-wide/16 v7, 0x0

    .line 146
    :goto_2
    monitor-enter p0

    .line 147
    :try_start_3
    iget-wide v3, p0, Lcom/koushikdutta/async/util/LruCache;->size:J

    cmp-long v3, v3, v7

    if-ltz v3, :cond_17

    iget-object v3, p0, Lcom/koushikdutta/async/util/LruCache;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_3b

    iget-wide v3, p0, Lcom/koushikdutta/async/util/LruCache;->size:J

    cmp-long v3, v3, v7

    if-eqz v3, :cond_3b

    .line 148
    :cond_17
    new-instance v3, Ljava/lang/IllegalStateException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".sizeOf() is reporting inconsistent results!"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 162
    :catchall_38
    move-exception v3

    monitor-exit p0
    :try_end_3a
    .catchall {:try_start_3 .. :try_end_3a} :catchall_38

    throw v3

    .line 152
    :cond_3b
    :try_start_3b
    iget-wide v3, p0, Lcom/koushikdutta/async/util/LruCache;->size:J

    cmp-long v3, v3, p1

    if-lez v3, :cond_49

    iget-object v3, p0, Lcom/koushikdutta/async/util/LruCache;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_4b

    .line 153
    :cond_49
    monitor-exit p0

    .line 166
    return-void

    .line 156
    :cond_4b
    iget-object v3, p0, Lcom/koushikdutta/async/util/LruCache;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 157
    .local v1, "toEvict":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<TK;TV;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    .line 158
    .local v0, "key":Ljava/lang/Object;, "TK;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    .line 159
    .local v2, "value":Ljava/lang/Object;, "TV;"
    iget-object v3, p0, Lcom/koushikdutta/async/util/LruCache;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v3, v0}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 160
    iget-wide v3, p0, Lcom/koushikdutta/async/util/LruCache;->size:J

    invoke-direct {p0, v0, v2}, Lcom/koushikdutta/async/util/LruCache;->safeSizeOf(Ljava/lang/Object;Ljava/lang/Object;)J

    move-result-wide v5

    sub-long/2addr v3, v5

    iput-wide v3, p0, Lcom/koushikdutta/async/util/LruCache;->size:J

    .line 161
    iget v3, p0, Lcom/koushikdutta/async/util/LruCache;->evictionCount:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/koushikdutta/async/util/LruCache;->evictionCount:I

    .line 162
    monitor-exit p0
    :try_end_78
    .catchall {:try_start_3b .. :try_end_78} :catchall_38

    .line 164
    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-virtual {p0, v3, v0, v2, v4}, Lcom/koushikdutta/async/util/LruCache;->entryRemoved(ZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_2
.end method


# virtual methods
.method protected create(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)TV;"
        }
    .end annotation

    .prologue
    .line 226
    .local p0, "this":Lcom/koushikdutta/async/util/LruCache;, "Lcom/koushikdutta/async/util/LruCache<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    const/4 v0, 0x0

    return-object v0
.end method

.method public final declared-synchronized createCount()I
    .registers 2

    .prologue
    .line 296
    .local p0, "this":Lcom/koushikdutta/async/util/LruCache;, "Lcom/koushikdutta/async/util/LruCache<TK;TV;>;"
    monitor-enter p0

    :try_start_1
    iget v0, p0, Lcom/koushikdutta/async/util/LruCache;->createCount:I
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected entryRemoved(ZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 5
    .param p1, "evicted"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZTK;TV;TV;)V"
        }
    .end annotation

    .prologue
    .line 208
    .local p0, "this":Lcom/koushikdutta/async/util/LruCache;, "Lcom/koushikdutta/async/util/LruCache<TK;TV;>;"
    .local p2, "key":Ljava/lang/Object;, "TK;"
    .local p3, "oldValue":Ljava/lang/Object;, "TV;"
    .local p4, "newValue":Ljava/lang/Object;, "TV;"
    return-void
.end method

.method public final evictAll()V
    .registers 3

    .prologue
    .line 252
    .local p0, "this":Lcom/koushikdutta/async/util/LruCache;, "Lcom/koushikdutta/async/util/LruCache<TK;TV;>;"
    const-wide/16 v0, -0x1

    invoke-direct {p0, v0, v1}, Lcom/koushikdutta/async/util/LruCache;->trimToSize(J)V

    .line 253
    return-void
.end method

.method public final declared-synchronized evictionCount()I
    .registers 2

    .prologue
    .line 310
    .local p0, "this":Lcom/koushikdutta/async/util/LruCache;, "Lcom/koushikdutta/async/util/LruCache<TK;TV;>;"
    monitor-enter p0

    :try_start_1
    iget v0, p0, Lcom/koushikdutta/async/util/LruCache;->evictionCount:I
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)TV;"
        }
    .end annotation

    .prologue
    .line 62
    .local p0, "this":Lcom/koushikdutta/async/util/LruCache;, "Lcom/koushikdutta/async/util/LruCache<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    if-nez p1, :cond_a

    .line 63
    new-instance v2, Ljava/lang/NullPointerException;

    const-string v3, "key == null"

    invoke-direct {v2, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 67
    :cond_a
    monitor-enter p0

    .line 68
    :try_start_b
    iget-object v2, p0, Lcom/koushikdutta/async/util/LruCache;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v2, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 69
    .local v1, "mapValue":Ljava/lang/Object;, "TV;"
    if-eqz v1, :cond_1c

    .line 70
    iget v2, p0, Lcom/koushikdutta/async/util/LruCache;->hitCount:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/koushikdutta/async/util/LruCache;->hitCount:I

    .line 71
    monitor-exit p0

    move-object v0, v1

    .line 105
    :goto_1b
    return-object v0

    .line 73
    :cond_1c
    iget v2, p0, Lcom/koushikdutta/async/util/LruCache;->missCount:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/koushikdutta/async/util/LruCache;->missCount:I

    .line 74
    monitor-exit p0
    :try_end_23
    .catchall {:try_start_b .. :try_end_23} :catchall_2b

    .line 83
    invoke-virtual {p0, p1}, Lcom/koushikdutta/async/util/LruCache;->create(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 84
    .local v0, "createdValue":Ljava/lang/Object;, "TV;"
    if-nez v0, :cond_2e

    .line 85
    const/4 v0, 0x0

    goto :goto_1b

    .line 74
    .end local v0    # "createdValue":Ljava/lang/Object;, "TV;"
    .end local v1    # "mapValue":Ljava/lang/Object;, "TV;"
    :catchall_2b
    move-exception v2

    :try_start_2c
    monitor-exit p0
    :try_end_2d
    .catchall {:try_start_2c .. :try_end_2d} :catchall_2b

    throw v2

    .line 88
    .restart local v0    # "createdValue":Ljava/lang/Object;, "TV;"
    .restart local v1    # "mapValue":Ljava/lang/Object;, "TV;"
    :cond_2e
    monitor-enter p0

    .line 89
    :try_start_2f
    iget v2, p0, Lcom/koushikdutta/async/util/LruCache;->createCount:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/koushikdutta/async/util/LruCache;->createCount:I

    .line 90
    iget-object v2, p0, Lcom/koushikdutta/async/util/LruCache;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v2, p1, v0}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 92
    if-eqz v1, :cond_4b

    .line 94
    iget-object v2, p0, Lcom/koushikdutta/async/util/LruCache;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v2, p1, v1}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    :goto_42
    monitor-exit p0
    :try_end_43
    .catchall {:try_start_2f .. :try_end_43} :catchall_55

    .line 100
    if-eqz v1, :cond_58

    .line 101
    const/4 v2, 0x0

    invoke-virtual {p0, v2, p1, v0, v1}, Lcom/koushikdutta/async/util/LruCache;->entryRemoved(ZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    move-object v0, v1

    .line 102
    goto :goto_1b

    .line 96
    :cond_4b
    :try_start_4b
    iget-wide v2, p0, Lcom/koushikdutta/async/util/LruCache;->size:J

    invoke-direct {p0, p1, v0}, Lcom/koushikdutta/async/util/LruCache;->safeSizeOf(Ljava/lang/Object;Ljava/lang/Object;)J

    move-result-wide v4

    add-long/2addr v2, v4

    iput-wide v2, p0, Lcom/koushikdutta/async/util/LruCache;->size:J

    goto :goto_42

    .line 98
    :catchall_55
    move-exception v2

    monitor-exit p0
    :try_end_57
    .catchall {:try_start_4b .. :try_end_57} :catchall_55

    throw v2

    .line 104
    :cond_58
    iget-wide v2, p0, Lcom/koushikdutta/async/util/LruCache;->maxSize:J

    invoke-direct {p0, v2, v3}, Lcom/koushikdutta/async/util/LruCache;->trimToSize(J)V

    goto :goto_1b
.end method

.method public final declared-synchronized hitCount()I
    .registers 2

    .prologue
    .line 281
    .local p0, "this":Lcom/koushikdutta/async/util/LruCache;, "Lcom/koushikdutta/async/util/LruCache<TK;TV;>;"
    monitor-enter p0

    :try_start_1
    iget v0, p0, Lcom/koushikdutta/async/util/LruCache;->hitCount:I
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized maxSize()J
    .registers 3

    .prologue
    .line 274
    .local p0, "this":Lcom/koushikdutta/async/util/LruCache;, "Lcom/koushikdutta/async/util/LruCache<TK;TV;>;"
    monitor-enter p0

    :try_start_1
    iget-wide v0, p0, Lcom/koushikdutta/async/util/LruCache;->maxSize:J
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-wide v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized missCount()I
    .registers 2

    .prologue
    .line 289
    .local p0, "this":Lcom/koushikdutta/async/util/LruCache;, "Lcom/koushikdutta/async/util/LruCache<TK;TV;>;"
    monitor-enter p0

    :try_start_1
    iget v0, p0, Lcom/koushikdutta/async/util/LruCache;->missCount:I
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)TV;"
        }
    .end annotation

    .prologue
    .line 116
    .local p0, "this":Lcom/koushikdutta/async/util/LruCache;, "Lcom/koushikdutta/async/util/LruCache<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "value":Ljava/lang/Object;, "TV;"
    if-eqz p1, :cond_4

    if-nez p2, :cond_c

    .line 117
    :cond_4
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "key == null || value == null"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 121
    :cond_c
    monitor-enter p0

    .line 122
    :try_start_d
    iget v1, p0, Lcom/koushikdutta/async/util/LruCache;->putCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/koushikdutta/async/util/LruCache;->putCount:I

    .line 123
    iget-wide v1, p0, Lcom/koushikdutta/async/util/LruCache;->size:J

    invoke-direct {p0, p1, p2}, Lcom/koushikdutta/async/util/LruCache;->safeSizeOf(Ljava/lang/Object;Ljava/lang/Object;)J

    move-result-wide v3

    add-long/2addr v1, v3

    iput-wide v1, p0, Lcom/koushikdutta/async/util/LruCache;->size:J

    .line 124
    iget-object v1, p0, Lcom/koushikdutta/async/util/LruCache;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, p1, p2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 125
    .local v0, "previous":Ljava/lang/Object;, "TV;"
    if-eqz v0, :cond_2d

    .line 126
    iget-wide v1, p0, Lcom/koushikdutta/async/util/LruCache;->size:J

    invoke-direct {p0, p1, v0}, Lcom/koushikdutta/async/util/LruCache;->safeSizeOf(Ljava/lang/Object;Ljava/lang/Object;)J

    move-result-wide v3

    sub-long/2addr v1, v3

    iput-wide v1, p0, Lcom/koushikdutta/async/util/LruCache;->size:J

    .line 128
    :cond_2d
    monitor-exit p0
    :try_end_2e
    .catchall {:try_start_d .. :try_end_2e} :catchall_3a

    .line 130
    if-eqz v0, :cond_34

    .line 131
    const/4 v1, 0x0

    invoke-virtual {p0, v1, p1, v0, p2}, Lcom/koushikdutta/async/util/LruCache;->entryRemoved(ZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 134
    :cond_34
    iget-wide v1, p0, Lcom/koushikdutta/async/util/LruCache;->maxSize:J

    invoke-direct {p0, v1, v2}, Lcom/koushikdutta/async/util/LruCache;->trimToSize(J)V

    .line 135
    return-object v0

    .line 128
    .end local v0    # "previous":Ljava/lang/Object;, "TV;"
    :catchall_3a
    move-exception v1

    :try_start_3b
    monitor-exit p0
    :try_end_3c
    .catchall {:try_start_3b .. :try_end_3c} :catchall_3a

    throw v1
.end method

.method public final declared-synchronized putCount()I
    .registers 2

    .prologue
    .line 303
    .local p0, "this":Lcom/koushikdutta/async/util/LruCache;, "Lcom/koushikdutta/async/util/LruCache<TK;TV;>;"
    monitor-enter p0

    :try_start_1
    iget v0, p0, Lcom/koushikdutta/async/util/LruCache;->putCount:I
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final remove(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)TV;"
        }
    .end annotation

    .prologue
    .line 174
    .local p0, "this":Lcom/koushikdutta/async/util/LruCache;, "Lcom/koushikdutta/async/util/LruCache<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    if-nez p1, :cond_a

    .line 175
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "key == null"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 179
    :cond_a
    monitor-enter p0

    .line 180
    :try_start_b
    iget-object v1, p0, Lcom/koushikdutta/async/util/LruCache;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, p1}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 181
    .local v0, "previous":Ljava/lang/Object;, "TV;"
    if-eqz v0, :cond_1c

    .line 182
    iget-wide v1, p0, Lcom/koushikdutta/async/util/LruCache;->size:J

    invoke-direct {p0, p1, v0}, Lcom/koushikdutta/async/util/LruCache;->safeSizeOf(Ljava/lang/Object;Ljava/lang/Object;)J

    move-result-wide v3

    sub-long/2addr v1, v3

    iput-wide v1, p0, Lcom/koushikdutta/async/util/LruCache;->size:J

    .line 184
    :cond_1c
    monitor-exit p0
    :try_end_1d
    .catchall {:try_start_b .. :try_end_1d} :catchall_25

    .line 186
    if-eqz v0, :cond_24

    .line 187
    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {p0, v1, p1, v0, v2}, Lcom/koushikdutta/async/util/LruCache;->entryRemoved(ZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 190
    :cond_24
    return-object v0

    .line 184
    .end local v0    # "previous":Ljava/lang/Object;, "TV;"
    :catchall_25
    move-exception v1

    :try_start_26
    monitor-exit p0
    :try_end_27
    .catchall {:try_start_26 .. :try_end_27} :catchall_25

    throw v1
.end method

.method public setMaxSize(J)V
    .registers 3
    .param p1, "maxSize"    # J

    .prologue
    .line 265
    .local p0, "this":Lcom/koushikdutta/async/util/LruCache;, "Lcom/koushikdutta/async/util/LruCache<TK;TV;>;"
    iput-wide p1, p0, Lcom/koushikdutta/async/util/LruCache;->maxSize:J

    .line 266
    return-void
.end method

.method public final declared-synchronized size()J
    .registers 3

    .prologue
    .line 261
    .local p0, "this":Lcom/koushikdutta/async/util/LruCache;, "Lcom/koushikdutta/async/util/LruCache<TK;TV;>;"
    monitor-enter p0

    :try_start_1
    iget-wide v0, p0, Lcom/koushikdutta/async/util/LruCache;->size:J
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-wide v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected sizeOf(Ljava/lang/Object;Ljava/lang/Object;)J
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)J"
        }
    .end annotation

    .prologue
    .line 245
    .local p0, "this":Lcom/koushikdutta/async/util/LruCache;, "Lcom/koushikdutta/async/util/LruCache<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "value":Ljava/lang/Object;, "TV;"
    const-wide/16 v0, 0x1

    return-wide v0
.end method

.method public final declared-synchronized snapshot()Ljava/util/Map;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 318
    .local p0, "this":Lcom/koushikdutta/async/util/LruCache;, "Lcom/koushikdutta/async/util/LruCache<TK;TV;>;"
    monitor-enter p0

    :try_start_1
    new-instance v0, Ljava/util/LinkedHashMap;

    iget-object v1, p0, Lcom/koushikdutta/async/util/LruCache;->map:Ljava/util/LinkedHashMap;

    invoke-direct {v0, v1}, Ljava/util/LinkedHashMap;-><init>(Ljava/util/Map;)V
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_a

    monitor-exit p0

    return-object v0

    :catchall_a
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized toString()Ljava/lang/String;
    .registers 8

    .prologue
    .local p0, "this":Lcom/koushikdutta/async/util/LruCache;, "Lcom/koushikdutta/async/util/LruCache<TK;TV;>;"
    const/4 v1, 0x0

    .line 322
    monitor-enter p0

    :try_start_2
    iget v2, p0, Lcom/koushikdutta/async/util/LruCache;->hitCount:I

    iget v3, p0, Lcom/koushikdutta/async/util/LruCache;->missCount:I

    add-int v0, v2, v3

    .line 323
    .local v0, "accesses":I
    if-eqz v0, :cond_10

    iget v2, p0, Lcom/koushikdutta/async/util/LruCache;->hitCount:I

    mul-int/lit8 v2, v2, 0x64

    div-int v1, v2, v0

    .line 324
    .local v1, "hitPercent":I
    :cond_10
    const-string v2, "LruCache[maxSize=%d,hits=%d,misses=%d,hitRate=%d%%]"

    const/4 v3, 0x4

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-wide v5, p0, Lcom/koushikdutta/async/util/LruCache;->maxSize:J

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    iget v5, p0, Lcom/koushikdutta/async/util/LruCache;->hitCount:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x2

    iget v5, p0, Lcom/koushikdutta/async/util/LruCache;->missCount:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    :try_end_3a
    .catchall {:try_start_2 .. :try_end_3a} :catchall_3d

    move-result-object v2

    monitor-exit p0

    return-object v2

    .line 322
    .end local v0    # "accesses":I
    .end local v1    # "hitPercent":I
    :catchall_3d
    move-exception v2

    monitor-exit p0

    throw v2
.end method
