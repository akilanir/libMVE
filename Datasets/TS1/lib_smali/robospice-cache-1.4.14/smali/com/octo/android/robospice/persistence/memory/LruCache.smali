.class public Lcom/octo/android/robospice/persistence/memory/LruCache;
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


# static fields
.field private static final DEFAULT_LOAD_FACTOR:F = 0.75f

.field private static final MAX_PERCENT:I = 0x64


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

.field private maxSize:I

.field private missCount:I

.field private putCount:I

.field private size:I


# direct methods
.method public constructor <init>(I)V
    .registers 6
    .param p1, "maxSize"    # I

    .prologue
    .line 53
    .local p0, "this":Lcom/octo/android/robospice/persistence/memory/LruCache;, "Lcom/octo/android/robospice/persistence/memory/LruCache<TK;TV;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    if-gtz p1, :cond_d

    .line 55
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "maxSize <= 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 57
    :cond_d
    iput p1, p0, Lcom/octo/android/robospice/persistence/memory/LruCache;->maxSize:I

    .line 58
    new-instance v0, Ljava/util/LinkedHashMap;

    const/4 v1, 0x0

    const/high16 v2, 0x3f400000    # 0.75f

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Ljava/util/LinkedHashMap;-><init>(IFZ)V

    iput-object v0, p0, Lcom/octo/android/robospice/persistence/memory/LruCache;->map:Ljava/util/LinkedHashMap;

    .line 59
    return-void
.end method

.method private safeSizeOf(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)I"
        }
    .end annotation

    .prologue
    .line 237
    .local p0, "this":Lcom/octo/android/robospice/persistence/memory/LruCache;, "Lcom/octo/android/robospice/persistence/memory/LruCache<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "value":Ljava/lang/Object;, "TV;"
    invoke-virtual {p0, p1, p2}, Lcom/octo/android/robospice/persistence/memory/LruCache;->sizeOf(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    .line 238
    .local v0, "result":I
    if-gez v0, :cond_29

    .line 239
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Negative size: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 241
    :cond_29
    return v0
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
    .line 233
    .local p0, "this":Lcom/octo/android/robospice/persistence/memory/LruCache;, "Lcom/octo/android/robospice/persistence/memory/LruCache<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    const/4 v0, 0x0

    return-object v0
.end method

.method public final declared-synchronized createCount()I
    .registers 2

    .prologue
    .line 299
    .local p0, "this":Lcom/octo/android/robospice/persistence/memory/LruCache;, "Lcom/octo/android/robospice/persistence/memory/LruCache<TK;TV;>;"
    monitor-enter p0

    :try_start_1
    iget v0, p0, Lcom/octo/android/robospice/persistence/memory/LruCache;->createCount:I
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
    .line 216
    .local p0, "this":Lcom/octo/android/robospice/persistence/memory/LruCache;, "Lcom/octo/android/robospice/persistence/memory/LruCache<TK;TV;>;"
    .local p2, "key":Ljava/lang/Object;, "TK;"
    .local p3, "oldValue":Ljava/lang/Object;, "TV;"
    .local p4, "newValue":Ljava/lang/Object;, "TV;"
    return-void
.end method

.method public final evictAll()V
    .registers 2

    .prologue
    .line 259
    .local p0, "this":Lcom/octo/android/robospice/persistence/memory/LruCache;, "Lcom/octo/android/robospice/persistence/memory/LruCache<TK;TV;>;"
    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Lcom/octo/android/robospice/persistence/memory/LruCache;->trimToSize(I)V

    .line 260
    return-void
.end method

.method public final declared-synchronized evictionCount()I
    .registers 2

    .prologue
    .line 313
    .local p0, "this":Lcom/octo/android/robospice/persistence/memory/LruCache;, "Lcom/octo/android/robospice/persistence/memory/LruCache<TK;TV;>;"
    monitor-enter p0

    :try_start_1
    iget v0, p0, Lcom/octo/android/robospice/persistence/memory/LruCache;->evictionCount:I
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
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)TV;"
        }
    .end annotation

    .prologue
    .line 68
    .local p0, "this":Lcom/octo/android/robospice/persistence/memory/LruCache;, "Lcom/octo/android/robospice/persistence/memory/LruCache<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    if-nez p1, :cond_a

    .line 69
    new-instance v2, Ljava/lang/NullPointerException;

    const-string v3, "key == null"

    invoke-direct {v2, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 73
    :cond_a
    monitor-enter p0

    .line 74
    :try_start_b
    iget-object v2, p0, Lcom/octo/android/robospice/persistence/memory/LruCache;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v2, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 75
    .local v1, "mapValue":Ljava/lang/Object;, "TV;"
    if-eqz v1, :cond_1c

    .line 76
    iget v2, p0, Lcom/octo/android/robospice/persistence/memory/LruCache;->hitCount:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/octo/android/robospice/persistence/memory/LruCache;->hitCount:I

    .line 77
    monitor-exit p0

    move-object v0, v1

    .line 111
    :goto_1b
    return-object v0

    .line 79
    :cond_1c
    iget v2, p0, Lcom/octo/android/robospice/persistence/memory/LruCache;->missCount:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/octo/android/robospice/persistence/memory/LruCache;->missCount:I

    .line 80
    monitor-exit p0
    :try_end_23
    .catchall {:try_start_b .. :try_end_23} :catchall_2b

    .line 89
    invoke-virtual {p0, p1}, Lcom/octo/android/robospice/persistence/memory/LruCache;->create(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 90
    .local v0, "createdValue":Ljava/lang/Object;, "TV;"
    if-nez v0, :cond_2e

    .line 91
    const/4 v0, 0x0

    goto :goto_1b

    .line 80
    .end local v0    # "createdValue":Ljava/lang/Object;, "TV;"
    .end local v1    # "mapValue":Ljava/lang/Object;, "TV;"
    :catchall_2b
    move-exception v2

    :try_start_2c
    monitor-exit p0
    :try_end_2d
    .catchall {:try_start_2c .. :try_end_2d} :catchall_2b

    throw v2

    .line 94
    .restart local v0    # "createdValue":Ljava/lang/Object;, "TV;"
    .restart local v1    # "mapValue":Ljava/lang/Object;, "TV;"
    :cond_2e
    monitor-enter p0

    .line 95
    :try_start_2f
    iget v2, p0, Lcom/octo/android/robospice/persistence/memory/LruCache;->createCount:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/octo/android/robospice/persistence/memory/LruCache;->createCount:I

    .line 96
    iget-object v2, p0, Lcom/octo/android/robospice/persistence/memory/LruCache;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v2, p1, v0}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 98
    if-eqz v1, :cond_4b

    .line 100
    iget-object v2, p0, Lcom/octo/android/robospice/persistence/memory/LruCache;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v2, p1, v1}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    :goto_42
    monitor-exit p0
    :try_end_43
    .catchall {:try_start_2f .. :try_end_43} :catchall_55

    .line 106
    if-eqz v1, :cond_58

    .line 107
    const/4 v2, 0x0

    invoke-virtual {p0, v2, p1, v0, v1}, Lcom/octo/android/robospice/persistence/memory/LruCache;->entryRemoved(ZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    move-object v0, v1

    .line 108
    goto :goto_1b

    .line 102
    :cond_4b
    :try_start_4b
    iget v2, p0, Lcom/octo/android/robospice/persistence/memory/LruCache;->size:I

    invoke-direct {p0, p1, v0}, Lcom/octo/android/robospice/persistence/memory/LruCache;->safeSizeOf(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v3

    add-int/2addr v2, v3

    iput v2, p0, Lcom/octo/android/robospice/persistence/memory/LruCache;->size:I

    goto :goto_42

    .line 104
    :catchall_55
    move-exception v2

    monitor-exit p0
    :try_end_57
    .catchall {:try_start_4b .. :try_end_57} :catchall_55

    throw v2

    .line 110
    :cond_58
    iget v2, p0, Lcom/octo/android/robospice/persistence/memory/LruCache;->maxSize:I

    invoke-virtual {p0, v2}, Lcom/octo/android/robospice/persistence/memory/LruCache;->trimToSize(I)V

    goto :goto_1b
.end method

.method public final declared-synchronized hitCount()I
    .registers 2

    .prologue
    .line 284
    .local p0, "this":Lcom/octo/android/robospice/persistence/memory/LruCache;, "Lcom/octo/android/robospice/persistence/memory/LruCache<TK;TV;>;"
    monitor-enter p0

    :try_start_1
    iget v0, p0, Lcom/octo/android/robospice/persistence/memory/LruCache;->hitCount:I
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized maxSize()I
    .registers 2

    .prologue
    .line 277
    .local p0, "this":Lcom/octo/android/robospice/persistence/memory/LruCache;, "Lcom/octo/android/robospice/persistence/memory/LruCache<TK;TV;>;"
    monitor-enter p0

    :try_start_1
    iget v0, p0, Lcom/octo/android/robospice/persistence/memory/LruCache;->maxSize:I
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized missCount()I
    .registers 2

    .prologue
    .line 292
    .local p0, "this":Lcom/octo/android/robospice/persistence/memory/LruCache;, "Lcom/octo/android/robospice/persistence/memory/LruCache<TK;TV;>;"
    monitor-enter p0

    :try_start_1
    iget v0, p0, Lcom/octo/android/robospice/persistence/memory/LruCache;->missCount:I
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
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)TV;"
        }
    .end annotation

    .prologue
    .line 121
    .local p0, "this":Lcom/octo/android/robospice/persistence/memory/LruCache;, "Lcom/octo/android/robospice/persistence/memory/LruCache<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "value":Ljava/lang/Object;, "TV;"
    if-eqz p1, :cond_4

    if-nez p2, :cond_c

    .line 122
    :cond_4
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "key == null || value == null"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 126
    :cond_c
    monitor-enter p0

    .line 127
    :try_start_d
    iget v1, p0, Lcom/octo/android/robospice/persistence/memory/LruCache;->putCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/octo/android/robospice/persistence/memory/LruCache;->putCount:I

    .line 128
    iget v1, p0, Lcom/octo/android/robospice/persistence/memory/LruCache;->size:I

    invoke-direct {p0, p1, p2}, Lcom/octo/android/robospice/persistence/memory/LruCache;->safeSizeOf(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v2

    add-int/2addr v1, v2

    iput v1, p0, Lcom/octo/android/robospice/persistence/memory/LruCache;->size:I

    .line 129
    iget-object v1, p0, Lcom/octo/android/robospice/persistence/memory/LruCache;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, p1, p2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 130
    .local v0, "previous":Ljava/lang/Object;, "TV;"
    if-eqz v0, :cond_2d

    .line 131
    iget v1, p0, Lcom/octo/android/robospice/persistence/memory/LruCache;->size:I

    invoke-direct {p0, p1, v0}, Lcom/octo/android/robospice/persistence/memory/LruCache;->safeSizeOf(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v2

    sub-int/2addr v1, v2

    iput v1, p0, Lcom/octo/android/robospice/persistence/memory/LruCache;->size:I

    .line 133
    :cond_2d
    monitor-exit p0
    :try_end_2e
    .catchall {:try_start_d .. :try_end_2e} :catchall_3a

    .line 135
    if-eqz v0, :cond_34

    .line 136
    const/4 v1, 0x0

    invoke-virtual {p0, v1, p1, v0, p2}, Lcom/octo/android/robospice/persistence/memory/LruCache;->entryRemoved(ZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 139
    :cond_34
    iget v1, p0, Lcom/octo/android/robospice/persistence/memory/LruCache;->maxSize:I

    invoke-virtual {p0, v1}, Lcom/octo/android/robospice/persistence/memory/LruCache;->trimToSize(I)V

    .line 140
    return-object v0

    .line 133
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
    .line 306
    .local p0, "this":Lcom/octo/android/robospice/persistence/memory/LruCache;, "Lcom/octo/android/robospice/persistence/memory/LruCache<TK;TV;>;"
    monitor-enter p0

    :try_start_1
    iget v0, p0, Lcom/octo/android/robospice/persistence/memory/LruCache;->putCount:I
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
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)TV;"
        }
    .end annotation

    .prologue
    .line 180
    .local p0, "this":Lcom/octo/android/robospice/persistence/memory/LruCache;, "Lcom/octo/android/robospice/persistence/memory/LruCache<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    if-nez p1, :cond_a

    .line 181
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "key == null"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 185
    :cond_a
    monitor-enter p0

    .line 186
    :try_start_b
    iget-object v1, p0, Lcom/octo/android/robospice/persistence/memory/LruCache;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, p1}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 187
    .local v0, "previous":Ljava/lang/Object;, "TV;"
    if-eqz v0, :cond_1c

    .line 188
    iget v1, p0, Lcom/octo/android/robospice/persistence/memory/LruCache;->size:I

    invoke-direct {p0, p1, v0}, Lcom/octo/android/robospice/persistence/memory/LruCache;->safeSizeOf(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v2

    sub-int/2addr v1, v2

    iput v1, p0, Lcom/octo/android/robospice/persistence/memory/LruCache;->size:I

    .line 190
    :cond_1c
    monitor-exit p0
    :try_end_1d
    .catchall {:try_start_b .. :try_end_1d} :catchall_25

    .line 192
    if-eqz v0, :cond_24

    .line 193
    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {p0, v1, p1, v0, v2}, Lcom/octo/android/robospice/persistence/memory/LruCache;->entryRemoved(ZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 196
    :cond_24
    return-object v0

    .line 190
    .end local v0    # "previous":Ljava/lang/Object;, "TV;"
    :catchall_25
    move-exception v1

    :try_start_26
    monitor-exit p0
    :try_end_27
    .catchall {:try_start_26 .. :try_end_27} :catchall_25

    throw v1
.end method

.method public final declared-synchronized size()I
    .registers 2

    .prologue
    .line 268
    .local p0, "this":Lcom/octo/android/robospice/persistence/memory/LruCache;, "Lcom/octo/android/robospice/persistence/memory/LruCache<TK;TV;>;"
    monitor-enter p0

    :try_start_1
    iget v0, p0, Lcom/octo/android/robospice/persistence/memory/LruCache;->size:I
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected sizeOf(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)I"
        }
    .end annotation

    .prologue
    .line 252
    .local p0, "this":Lcom/octo/android/robospice/persistence/memory/LruCache;, "Lcom/octo/android/robospice/persistence/memory/LruCache<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "value":Ljava/lang/Object;, "TV;"
    const/4 v0, 0x1

    return v0
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
    .line 321
    .local p0, "this":Lcom/octo/android/robospice/persistence/memory/LruCache;, "Lcom/octo/android/robospice/persistence/memory/LruCache<TK;TV;>;"
    monitor-enter p0

    :try_start_1
    new-instance v0, Ljava/util/LinkedHashMap;

    iget-object v1, p0, Lcom/octo/android/robospice/persistence/memory/LruCache;->map:Ljava/util/LinkedHashMap;

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
    .registers 7

    .prologue
    .local p0, "this":Lcom/octo/android/robospice/persistence/memory/LruCache;, "Lcom/octo/android/robospice/persistence/memory/LruCache<TK;TV;>;"
    const/4 v1, 0x0

    .line 326
    monitor-enter p0

    :try_start_2
    iget v2, p0, Lcom/octo/android/robospice/persistence/memory/LruCache;->hitCount:I

    iget v3, p0, Lcom/octo/android/robospice/persistence/memory/LruCache;->missCount:I

    add-int v0, v2, v3

    .line 327
    .local v0, "accesses":I
    if-eqz v0, :cond_10

    iget v2, p0, Lcom/octo/android/robospice/persistence/memory/LruCache;->hitCount:I

    mul-int/lit8 v2, v2, 0x64

    div-int v1, v2, v0

    .line 328
    .local v1, "hitPercent":I
    :cond_10
    const-string v2, "LruCache[maxSize=%d,hits=%d,misses=%d,hitRate=%d%%]"

    const/4 v3, 0x4

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget v5, p0, Lcom/octo/android/robospice/persistence/memory/LruCache;->maxSize:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    iget v5, p0, Lcom/octo/android/robospice/persistence/memory/LruCache;->hitCount:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x2

    iget v5, p0, Lcom/octo/android/robospice/persistence/memory/LruCache;->missCount:I

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

    .line 326
    .end local v0    # "accesses":I
    .end local v1    # "hitPercent":I
    :catchall_3d
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public trimToSize(I)V
    .registers 8
    .param p1, "maxSize"    # I

    .prologue
    .line 154
    .local p0, "this":Lcom/octo/android/robospice/persistence/memory/LruCache;, "Lcom/octo/android/robospice/persistence/memory/LruCache<TK;TV;>;"
    :goto_0
    monitor-enter p0

    .line 155
    :try_start_1
    iget v3, p0, Lcom/octo/android/robospice/persistence/memory/LruCache;->size:I

    if-ltz v3, :cond_11

    iget-object v3, p0, Lcom/octo/android/robospice/persistence/memory/LruCache;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_35

    iget v3, p0, Lcom/octo/android/robospice/persistence/memory/LruCache;->size:I

    if-eqz v3, :cond_35

    .line 156
    :cond_11
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

    .line 169
    :catchall_32
    move-exception v3

    monitor-exit p0
    :try_end_34
    .catchall {:try_start_1 .. :try_end_34} :catchall_32

    throw v3

    .line 159
    :cond_35
    :try_start_35
    iget v3, p0, Lcom/octo/android/robospice/persistence/memory/LruCache;->size:I

    if-le v3, p1, :cond_41

    iget-object v3, p0, Lcom/octo/android/robospice/persistence/memory/LruCache;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_43

    .line 160
    :cond_41
    monitor-exit p0

    .line 173
    return-void

    .line 163
    :cond_43
    iget-object v3, p0, Lcom/octo/android/robospice/persistence/memory/LruCache;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 164
    .local v1, "toEvict":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<TK;TV;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    .line 165
    .local v0, "key":Ljava/lang/Object;, "TK;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    .line 166
    .local v2, "value":Ljava/lang/Object;, "TV;"
    iget-object v3, p0, Lcom/octo/android/robospice/persistence/memory/LruCache;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v3, v0}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 167
    iget v3, p0, Lcom/octo/android/robospice/persistence/memory/LruCache;->size:I

    invoke-direct {p0, v0, v2}, Lcom/octo/android/robospice/persistence/memory/LruCache;->safeSizeOf(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v4

    sub-int/2addr v3, v4

    iput v3, p0, Lcom/octo/android/robospice/persistence/memory/LruCache;->size:I

    .line 168
    iget v3, p0, Lcom/octo/android/robospice/persistence/memory/LruCache;->evictionCount:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/octo/android/robospice/persistence/memory/LruCache;->evictionCount:I

    .line 169
    monitor-exit p0
    :try_end_70
    .catchall {:try_start_35 .. :try_end_70} :catchall_32

    .line 171
    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-virtual {p0, v3, v0, v2, v4}, Lcom/octo/android/robospice/persistence/memory/LruCache;->entryRemoved(ZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0
.end method
