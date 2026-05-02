.class Lorg/apache/commons/beanutils/WeakFastHashMap;
.super Ljava/util/HashMap;
.source "WeakFastHashMap.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/beanutils/WeakFastHashMap$1;,
        Lorg/apache/commons/beanutils/WeakFastHashMap$EntrySet;,
        Lorg/apache/commons/beanutils/WeakFastHashMap$Values;,
        Lorg/apache/commons/beanutils/WeakFastHashMap$KeySet;,
        Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;
    }
.end annotation


# instance fields
.field private fast:Z

.field private map:Ljava/util/Map;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 86
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 72
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->map:Ljava/util/Map;

    .line 77
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->fast:Z

    .line 87
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/WeakFastHashMap;->createMap()Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->map:Ljava/util/Map;

    .line 88
    return-void
.end method

.method public constructor <init>(I)V
    .registers 3
    .param p1, "capacity"    # I

    .prologue
    .line 96
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 72
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->map:Ljava/util/Map;

    .line 77
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->fast:Z

    .line 97
    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/WeakFastHashMap;->createMap(I)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->map:Ljava/util/Map;

    .line 98
    return-void
.end method

.method public constructor <init>(IF)V
    .registers 4
    .param p1, "capacity"    # I
    .param p2, "factor"    # F

    .prologue
    .line 107
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 72
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->map:Ljava/util/Map;

    .line 77
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->fast:Z

    .line 108
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/beanutils/WeakFastHashMap;->createMap(IF)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->map:Ljava/util/Map;

    .line 109
    return-void
.end method

.method public constructor <init>(Ljava/util/Map;)V
    .registers 3
    .param p1, "map"    # Ljava/util/Map;

    .prologue
    .line 117
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 72
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->map:Ljava/util/Map;

    .line 77
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->fast:Z

    .line 118
    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/WeakFastHashMap;->createMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->map:Ljava/util/Map;

    .line 119
    return-void
.end method

.method static access$300(Lorg/apache/commons/beanutils/WeakFastHashMap;)Z
    .registers 2
    .param p0, "x0"    # Lorg/apache/commons/beanutils/WeakFastHashMap;

    .prologue
    .line 67
    iget-boolean v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->fast:Z

    return v0
.end method

.method static access$400(Lorg/apache/commons/beanutils/WeakFastHashMap;)Ljava/util/Map;
    .registers 2
    .param p0, "x0"    # Lorg/apache/commons/beanutils/WeakFastHashMap;

    .prologue
    .line 67
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->map:Ljava/util/Map;

    return-object v0
.end method

.method static access$402(Lorg/apache/commons/beanutils/WeakFastHashMap;Ljava/util/Map;)Ljava/util/Map;
    .registers 2
    .param p0, "x0"    # Lorg/apache/commons/beanutils/WeakFastHashMap;
    .param p1, "x1"    # Ljava/util/Map;

    .prologue
    .line 67
    iput-object p1, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->map:Ljava/util/Map;

    return-object p1
.end method


# virtual methods
.method public clear()V
    .registers 3

    .prologue
    .line 308
    iget-boolean v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->fast:Z

    if-eqz v0, :cond_10

    .line 309
    monitor-enter p0

    .line 310
    :try_start_5
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/WeakFastHashMap;->createMap()Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->map:Ljava/util/Map;

    .line 311
    monitor-exit p0

    .line 317
    :goto_c
    return-void

    .line 311
    :catchall_d
    move-exception v0

    monitor-exit p0
    :try_end_f
    .catchall {:try_start_5 .. :try_end_f} :catchall_d

    throw v0

    .line 313
    :cond_10
    iget-object v1, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->map:Ljava/util/Map;

    monitor-enter v1

    .line 314
    :try_start_13
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 315
    monitor-exit v1

    goto :goto_c

    :catchall_1a
    move-exception v0

    monitor-exit v1
    :try_end_1c
    .catchall {:try_start_13 .. :try_end_1c} :catchall_1a

    throw v0
.end method

.method public clone()Ljava/lang/Object;
    .registers 5

    .prologue
    .line 421
    const/4 v0, 0x0

    .line 422
    .local v0, "results":Lorg/apache/commons/beanutils/WeakFastHashMap;
    iget-boolean v2, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->fast:Z

    if-eqz v2, :cond_14

    .line 423
    new-instance v0, Lorg/apache/commons/beanutils/WeakFastHashMap;

    .end local v0    # "results":Lorg/apache/commons/beanutils/WeakFastHashMap;
    iget-object v2, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->map:Ljava/util/Map;

    invoke-direct {v0, v2}, Lorg/apache/commons/beanutils/WeakFastHashMap;-><init>(Ljava/util/Map;)V

    .line 429
    .restart local v0    # "results":Lorg/apache/commons/beanutils/WeakFastHashMap;
    :goto_c
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/WeakFastHashMap;->getFast()Z

    move-result v2

    invoke-virtual {v0, v2}, Lorg/apache/commons/beanutils/WeakFastHashMap;->setFast(Z)V

    .line 430
    return-object v0

    .line 425
    :cond_14
    iget-object v3, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->map:Ljava/util/Map;

    monitor-enter v3

    .line 426
    :try_start_17
    new-instance v1, Lorg/apache/commons/beanutils/WeakFastHashMap;

    iget-object v2, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->map:Ljava/util/Map;

    invoke-direct {v1, v2}, Lorg/apache/commons/beanutils/WeakFastHashMap;-><init>(Ljava/util/Map;)V
    :try_end_1e
    .catchall {:try_start_17 .. :try_end_1e} :catchall_21

    .line 427
    .end local v0    # "results":Lorg/apache/commons/beanutils/WeakFastHashMap;
    .local v1, "results":Lorg/apache/commons/beanutils/WeakFastHashMap;
    :try_start_1e
    monitor-exit v3
    :try_end_1f
    .catchall {:try_start_1e .. :try_end_1f} :catchall_24

    move-object v0, v1

    .end local v1    # "results":Lorg/apache/commons/beanutils/WeakFastHashMap;
    .restart local v0    # "results":Lorg/apache/commons/beanutils/WeakFastHashMap;
    goto :goto_c

    :catchall_21
    move-exception v2

    :goto_22
    :try_start_22
    monitor-exit v3
    :try_end_23
    .catchall {:try_start_22 .. :try_end_23} :catchall_21

    throw v2

    .end local v0    # "results":Lorg/apache/commons/beanutils/WeakFastHashMap;
    .restart local v1    # "results":Lorg/apache/commons/beanutils/WeakFastHashMap;
    :catchall_24
    move-exception v2

    move-object v0, v1

    .end local v1    # "results":Lorg/apache/commons/beanutils/WeakFastHashMap;
    .restart local v0    # "results":Lorg/apache/commons/beanutils/WeakFastHashMap;
    goto :goto_22
.end method

.method protected cloneMap(Ljava/util/Map;)Ljava/util/Map;
    .registers 3
    .param p1, "map"    # Ljava/util/Map;

    .prologue
    .line 481
    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/WeakFastHashMap;->createMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .registers 4
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 206
    iget-boolean v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->fast:Z

    if-eqz v0, :cond_b

    .line 207
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->map:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    .line 210
    :goto_a
    return v0

    .line 209
    :cond_b
    iget-object v1, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->map:Ljava/util/Map;

    monitor-enter v1

    .line 210
    :try_start_e
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->map:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    monitor-exit v1

    goto :goto_a

    .line 211
    :catchall_16
    move-exception v0

    monitor-exit v1
    :try_end_18
    .catchall {:try_start_e .. :try_end_18} :catchall_16

    throw v0
.end method

.method public containsValue(Ljava/lang/Object;)Z
    .registers 4
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 223
    iget-boolean v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->fast:Z

    if-eqz v0, :cond_b

    .line 224
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->map:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsValue(Ljava/lang/Object;)Z

    move-result v0

    .line 227
    :goto_a
    return v0

    .line 226
    :cond_b
    iget-object v1, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->map:Ljava/util/Map;

    monitor-enter v1

    .line 227
    :try_start_e
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->map:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsValue(Ljava/lang/Object;)Z

    move-result v0

    monitor-exit v1

    goto :goto_a

    .line 228
    :catchall_16
    move-exception v0

    monitor-exit v1
    :try_end_18
    .catchall {:try_start_e .. :try_end_18} :catchall_16

    throw v0
.end method

.method protected createMap()Ljava/util/Map;
    .registers 2

    .prologue
    .line 465
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    return-object v0
.end method

.method protected createMap(I)Ljava/util/Map;
    .registers 3
    .param p1, "capacity"    # I

    .prologue
    .line 469
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0, p1}, Ljava/util/WeakHashMap;-><init>(I)V

    return-object v0
.end method

.method protected createMap(IF)Ljava/util/Map;
    .registers 4
    .param p1, "capacity"    # I
    .param p2, "factor"    # F

    .prologue
    .line 473
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0, p1, p2}, Ljava/util/WeakHashMap;-><init>(IF)V

    return-object v0
.end method

.method protected createMap(Ljava/util/Map;)Ljava/util/Map;
    .registers 3
    .param p1, "map"    # Ljava/util/Map;

    .prologue
    .line 477
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0, p1}, Ljava/util/WeakHashMap;-><init>(Ljava/util/Map;)V

    return-object v0
.end method

.method public entrySet()Ljava/util/Set;
    .registers 3

    .prologue
    .line 442
    new-instance v0, Lorg/apache/commons/beanutils/WeakFastHashMap$EntrySet;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lorg/apache/commons/beanutils/WeakFastHashMap$EntrySet;-><init>(Lorg/apache/commons/beanutils/WeakFastHashMap;Lorg/apache/commons/beanutils/WeakFastHashMap$1;)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 12
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 333
    if-ne p1, p0, :cond_5

    .line 382
    :cond_4
    :goto_4
    return v5

    .line 335
    :cond_5
    instance-of v7, p1, Ljava/util/Map;

    if-nez v7, :cond_b

    move v5, v6

    .line 336
    goto :goto_4

    :cond_b
    move-object v3, p1

    .line 338
    check-cast v3, Ljava/util/Map;

    .line 341
    .local v3, "mo":Ljava/util/Map;
    iget-boolean v7, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->fast:Z

    if-eqz v7, :cond_5a

    .line 342
    invoke-interface {v3}, Ljava/util/Map;->size()I

    move-result v7

    iget-object v8, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->map:Ljava/util/Map;

    invoke-interface {v8}, Ljava/util/Map;->size()I

    move-result v8

    if-eq v7, v8, :cond_20

    move v5, v6

    .line 343
    goto :goto_4

    .line 345
    :cond_20
    iget-object v7, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->map:Ljava/util/Map;

    invoke-interface {v7}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 346
    .local v1, "i":Ljava/util/Iterator;
    :cond_2a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_4

    .line 347
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 348
    .local v0, "e":Ljava/util/Map$Entry;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    .line 349
    .local v2, "key":Ljava/lang/Object;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    .line 350
    .local v4, "value":Ljava/lang/Object;
    if-nez v4, :cond_4e

    .line 351
    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    if-nez v7, :cond_4c

    invoke-interface {v3, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_2a

    :cond_4c
    move v5, v6

    .line 352
    goto :goto_4

    .line 355
    :cond_4e
    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_2a

    move v5, v6

    .line 356
    goto :goto_4

    .line 363
    .end local v0    # "e":Ljava/util/Map$Entry;
    .end local v1    # "i":Ljava/util/Iterator;
    .end local v2    # "key":Ljava/lang/Object;
    .end local v4    # "value":Ljava/lang/Object;
    :cond_5a
    iget-object v7, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->map:Ljava/util/Map;

    monitor-enter v7

    .line 364
    :try_start_5d
    invoke-interface {v3}, Ljava/util/Map;->size()I

    move-result v8

    iget-object v9, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->map:Ljava/util/Map;

    invoke-interface {v9}, Ljava/util/Map;->size()I

    move-result v9

    if-eq v8, v9, :cond_6c

    .line 365
    monitor-exit v7

    move v5, v6

    goto :goto_4

    .line 367
    :cond_6c
    iget-object v8, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->map:Ljava/util/Map;

    invoke-interface {v8}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 368
    .restart local v1    # "i":Ljava/util/Iterator;
    :cond_76
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_aa

    .line 369
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 370
    .restart local v0    # "e":Ljava/util/Map$Entry;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    .line 371
    .restart local v2    # "key":Ljava/lang/Object;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    .line 372
    .restart local v4    # "value":Ljava/lang/Object;
    if-nez v4, :cond_9c

    .line 373
    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    if-nez v8, :cond_98

    invoke-interface {v3, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_76

    .line 374
    :cond_98
    monitor-exit v7

    move v5, v6

    goto/16 :goto_4

    .line 377
    :cond_9c
    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v4, v8}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_76

    .line 378
    monitor-exit v7

    move v5, v6

    goto/16 :goto_4

    .line 382
    .end local v0    # "e":Ljava/util/Map$Entry;
    .end local v2    # "key":Ljava/lang/Object;
    .end local v4    # "value":Ljava/lang/Object;
    :cond_aa
    monitor-exit v7

    goto/16 :goto_4

    .line 383
    .end local v1    # "i":Ljava/util/Iterator;
    :catchall_ad
    move-exception v5

    monitor-exit v7
    :try_end_af
    .catchall {:try_start_5d .. :try_end_af} :catchall_ad

    throw v5
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 159
    iget-boolean v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->fast:Z

    if-eqz v0, :cond_b

    .line 160
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->map:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 163
    :goto_a
    return-object v0

    .line 162
    :cond_b
    iget-object v1, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->map:Ljava/util/Map;

    monitor-enter v1

    .line 163
    :try_start_e
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->map:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    monitor-exit v1

    goto :goto_a

    .line 164
    :catchall_16
    move-exception v0

    monitor-exit v1
    :try_end_18
    .catchall {:try_start_e .. :try_end_18} :catchall_16

    throw v0
.end method

.method public getFast()Z
    .registers 2

    .prologue
    .line 131
    iget-boolean v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->fast:Z

    return v0
.end method

.method public hashCode()I
    .registers 5

    .prologue
    .line 395
    iget-boolean v2, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->fast:Z

    if-eqz v2, :cond_1f

    .line 396
    const/4 v0, 0x0

    .line 397
    .local v0, "h":I
    iget-object v2, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->map:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 398
    .local v1, "i":Ljava/util/Iterator;
    :goto_f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3e

    .line 399
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v0, v2

    goto :goto_f

    .line 403
    .end local v0    # "h":I
    .end local v1    # "i":Ljava/util/Iterator;
    :cond_1f
    iget-object v3, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->map:Ljava/util/Map;

    monitor-enter v3

    .line 404
    const/4 v0, 0x0

    .line 405
    .restart local v0    # "h":I
    :try_start_23
    iget-object v2, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->map:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 406
    .restart local v1    # "i":Ljava/util/Iterator;
    :goto_2d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3d

    .line 407
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v0, v2

    goto :goto_2d

    .line 409
    :cond_3d
    monitor-exit v3

    :cond_3e
    return v0

    .line 410
    .end local v1    # "i":Ljava/util/Iterator;
    :catchall_3f
    move-exception v2

    monitor-exit v3
    :try_end_41
    .catchall {:try_start_23 .. :try_end_41} :catchall_3f

    throw v2
.end method

.method public isEmpty()Z
    .registers 3

    .prologue
    .line 189
    iget-boolean v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->fast:Z

    if-eqz v0, :cond_b

    .line 190
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    .line 193
    :goto_a
    return v0

    .line 192
    :cond_b
    iget-object v1, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->map:Ljava/util/Map;

    monitor-enter v1

    .line 193
    :try_start_e
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    monitor-exit v1

    goto :goto_a

    .line 194
    :catchall_16
    move-exception v0

    monitor-exit v1
    :try_end_18
    .catchall {:try_start_e .. :try_end_18} :catchall_16

    throw v0
.end method

.method public keySet()Ljava/util/Set;
    .registers 3

    .prologue
    .line 450
    new-instance v0, Lorg/apache/commons/beanutils/WeakFastHashMap$KeySet;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lorg/apache/commons/beanutils/WeakFastHashMap$KeySet;-><init>(Lorg/apache/commons/beanutils/WeakFastHashMap;Lorg/apache/commons/beanutils/WeakFastHashMap$1;)V

    return-object v0
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 7
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 248
    iget-boolean v2, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->fast:Z

    if-eqz v2, :cond_16

    .line 249
    monitor-enter p0

    .line 250
    :try_start_5
    iget-object v2, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->map:Ljava/util/Map;

    invoke-virtual {p0, v2}, Lorg/apache/commons/beanutils/WeakFastHashMap;->cloneMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    .line 251
    .local v1, "temp":Ljava/util/Map;
    invoke-interface {v1, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 252
    .local v0, "result":Ljava/lang/Object;
    iput-object v1, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->map:Ljava/util/Map;

    .line 253
    monitor-exit p0

    .line 257
    .end local v0    # "result":Ljava/lang/Object;
    .end local v1    # "temp":Ljava/util/Map;
    :goto_12
    return-object v0

    .line 254
    :catchall_13
    move-exception v2

    monitor-exit p0
    :try_end_15
    .catchall {:try_start_5 .. :try_end_15} :catchall_13

    throw v2

    .line 256
    :cond_16
    iget-object v3, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->map:Ljava/util/Map;

    monitor-enter v3

    .line 257
    :try_start_19
    iget-object v2, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->map:Ljava/util/Map;

    invoke-interface {v2, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    monitor-exit v3

    goto :goto_12

    .line 258
    :catchall_21
    move-exception v2

    monitor-exit v3
    :try_end_23
    .catchall {:try_start_19 .. :try_end_23} :catchall_21

    throw v2
.end method

.method public putAll(Ljava/util/Map;)V
    .registers 5
    .param p1, "in"    # Ljava/util/Map;

    .prologue
    .line 269
    iget-boolean v1, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->fast:Z

    if-eqz v1, :cond_15

    .line 270
    monitor-enter p0

    .line 271
    :try_start_5
    iget-object v1, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->map:Ljava/util/Map;

    invoke-virtual {p0, v1}, Lorg/apache/commons/beanutils/WeakFastHashMap;->cloneMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    .line 272
    .local v0, "temp":Ljava/util/Map;
    invoke-interface {v0, p1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 273
    iput-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->map:Ljava/util/Map;

    .line 274
    monitor-exit p0

    .line 280
    .end local v0    # "temp":Ljava/util/Map;
    :goto_11
    return-void

    .line 274
    :catchall_12
    move-exception v1

    monitor-exit p0
    :try_end_14
    .catchall {:try_start_5 .. :try_end_14} :catchall_12

    throw v1

    .line 276
    :cond_15
    iget-object v2, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->map:Ljava/util/Map;

    monitor-enter v2

    .line 277
    :try_start_18
    iget-object v1, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->map:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 278
    monitor-exit v2

    goto :goto_11

    :catchall_1f
    move-exception v1

    monitor-exit v2
    :try_end_21
    .catchall {:try_start_18 .. :try_end_21} :catchall_1f

    throw v1
.end method

.method public remove(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 290
    iget-boolean v2, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->fast:Z

    if-eqz v2, :cond_16

    .line 291
    monitor-enter p0

    .line 292
    :try_start_5
    iget-object v2, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->map:Ljava/util/Map;

    invoke-virtual {p0, v2}, Lorg/apache/commons/beanutils/WeakFastHashMap;->cloneMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    .line 293
    .local v1, "temp":Ljava/util/Map;
    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 294
    .local v0, "result":Ljava/lang/Object;
    iput-object v1, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->map:Ljava/util/Map;

    .line 295
    monitor-exit p0

    .line 299
    .end local v0    # "result":Ljava/lang/Object;
    .end local v1    # "temp":Ljava/util/Map;
    :goto_12
    return-object v0

    .line 296
    :catchall_13
    move-exception v2

    monitor-exit p0
    :try_end_15
    .catchall {:try_start_5 .. :try_end_15} :catchall_13

    throw v2

    .line 298
    :cond_16
    iget-object v3, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->map:Ljava/util/Map;

    monitor-enter v3

    .line 299
    :try_start_19
    iget-object v2, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->map:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    monitor-exit v3

    goto :goto_12

    .line 300
    :catchall_21
    move-exception v2

    monitor-exit v3
    :try_end_23
    .catchall {:try_start_19 .. :try_end_23} :catchall_21

    throw v2
.end method

.method public setFast(Z)V
    .registers 2
    .param p1, "fast"    # Z

    .prologue
    .line 140
    iput-boolean p1, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->fast:Z

    .line 141
    return-void
.end method

.method public size()I
    .registers 3

    .prologue
    .line 174
    iget-boolean v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->fast:Z

    if-eqz v0, :cond_b

    .line 175
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    .line 178
    :goto_a
    return v0

    .line 177
    :cond_b
    iget-object v1, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->map:Ljava/util/Map;

    monitor-enter v1

    .line 178
    :try_start_e
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    monitor-exit v1

    goto :goto_a

    .line 179
    :catchall_16
    move-exception v0

    monitor-exit v1
    :try_end_18
    .catchall {:try_start_e .. :try_end_18} :catchall_16

    throw v0
.end method

.method public values()Ljava/util/Collection;
    .registers 3

    .prologue
    .line 458
    new-instance v0, Lorg/apache/commons/beanutils/WeakFastHashMap$Values;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lorg/apache/commons/beanutils/WeakFastHashMap$Values;-><init>(Lorg/apache/commons/beanutils/WeakFastHashMap;Lorg/apache/commons/beanutils/WeakFastHashMap$1;)V

    return-object v0
.end method
