.class public Lorg/apache/commons/collections/FastHashMap;
.super Ljava/util/HashMap;
.source "FastHashMap.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/collections/FastHashMap$1;,
        Lorg/apache/commons/collections/FastHashMap$EntrySet;,
        Lorg/apache/commons/collections/FastHashMap$Values;,
        Lorg/apache/commons/collections/FastHashMap$KeySet;,
        Lorg/apache/commons/collections/FastHashMap$CollectionView;
    }
.end annotation


# instance fields
.field protected fast:Z

.field protected map:Ljava/util/HashMap;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 85
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 71
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    .line 76
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/collections/FastHashMap;->fast:Z

    .line 86
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    .line 87
    return-void
.end method

.method public constructor <init>(I)V
    .registers 3
    .param p1, "capacity"    # I

    .prologue
    .line 95
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 71
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    .line 76
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/collections/FastHashMap;->fast:Z

    .line 96
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, p1}, Ljava/util/HashMap;-><init>(I)V

    iput-object v0, p0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    .line 97
    return-void
.end method

.method public constructor <init>(IF)V
    .registers 4
    .param p1, "capacity"    # I
    .param p2, "factor"    # F

    .prologue
    .line 106
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 71
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    .line 76
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/collections/FastHashMap;->fast:Z

    .line 107
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, p1, p2}, Ljava/util/HashMap;-><init>(IF)V

    iput-object v0, p0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    .line 108
    return-void
.end method

.method public constructor <init>(Ljava/util/Map;)V
    .registers 3
    .param p1, "map"    # Ljava/util/Map;

    .prologue
    .line 116
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 71
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    .line 76
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/collections/FastHashMap;->fast:Z

    .line 117
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, p1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    iput-object v0, p0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    .line 118
    return-void
.end method


# virtual methods
.method public clear()V
    .registers 3

    .prologue
    .line 307
    iget-boolean v0, p0, Lorg/apache/commons/collections/FastHashMap;->fast:Z

    if-eqz v0, :cond_11

    .line 308
    monitor-enter p0

    .line 309
    :try_start_5
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    .line 310
    monitor-exit p0

    .line 316
    :goto_d
    return-void

    .line 310
    :catchall_e
    move-exception v0

    monitor-exit p0
    :try_end_10
    .catchall {:try_start_5 .. :try_end_10} :catchall_e

    throw v0

    .line 312
    :cond_11
    iget-object v1, p0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    monitor-enter v1

    .line 313
    :try_start_14
    iget-object v0, p0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 314
    monitor-exit v1

    goto :goto_d

    :catchall_1b
    move-exception v0

    monitor-exit v1
    :try_end_1d
    .catchall {:try_start_14 .. :try_end_1d} :catchall_1b

    throw v0
.end method

.method public clone()Ljava/lang/Object;
    .registers 5

    .prologue
    .line 420
    const/4 v0, 0x0

    .line 421
    .local v0, "results":Lorg/apache/commons/collections/FastHashMap;
    iget-boolean v2, p0, Lorg/apache/commons/collections/FastHashMap;->fast:Z

    if-eqz v2, :cond_14

    .line 422
    new-instance v0, Lorg/apache/commons/collections/FastHashMap;

    .end local v0    # "results":Lorg/apache/commons/collections/FastHashMap;
    iget-object v2, p0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    invoke-direct {v0, v2}, Lorg/apache/commons/collections/FastHashMap;-><init>(Ljava/util/Map;)V

    .line 428
    .restart local v0    # "results":Lorg/apache/commons/collections/FastHashMap;
    :goto_c
    invoke-virtual {p0}, Lorg/apache/commons/collections/FastHashMap;->getFast()Z

    move-result v2

    invoke-virtual {v0, v2}, Lorg/apache/commons/collections/FastHashMap;->setFast(Z)V

    .line 429
    return-object v0

    .line 424
    :cond_14
    iget-object v3, p0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    monitor-enter v3

    .line 425
    :try_start_17
    new-instance v1, Lorg/apache/commons/collections/FastHashMap;

    iget-object v2, p0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    invoke-direct {v1, v2}, Lorg/apache/commons/collections/FastHashMap;-><init>(Ljava/util/Map;)V
    :try_end_1e
    .catchall {:try_start_17 .. :try_end_1e} :catchall_21

    .line 426
    .end local v0    # "results":Lorg/apache/commons/collections/FastHashMap;
    .local v1, "results":Lorg/apache/commons/collections/FastHashMap;
    :try_start_1e
    monitor-exit v3
    :try_end_1f
    .catchall {:try_start_1e .. :try_end_1f} :catchall_24

    move-object v0, v1

    .end local v1    # "results":Lorg/apache/commons/collections/FastHashMap;
    .restart local v0    # "results":Lorg/apache/commons/collections/FastHashMap;
    goto :goto_c

    :catchall_21
    move-exception v2

    :goto_22
    :try_start_22
    monitor-exit v3
    :try_end_23
    .catchall {:try_start_22 .. :try_end_23} :catchall_21

    throw v2

    .end local v0    # "results":Lorg/apache/commons/collections/FastHashMap;
    .restart local v1    # "results":Lorg/apache/commons/collections/FastHashMap;
    :catchall_24
    move-exception v2

    move-object v0, v1

    .end local v1    # "results":Lorg/apache/commons/collections/FastHashMap;
    .restart local v0    # "results":Lorg/apache/commons/collections/FastHashMap;
    goto :goto_22
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .registers 4
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 205
    iget-boolean v0, p0, Lorg/apache/commons/collections/FastHashMap;->fast:Z

    if-eqz v0, :cond_b

    .line 206
    iget-object v0, p0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    .line 209
    :goto_a
    return v0

    .line 208
    :cond_b
    iget-object v1, p0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    monitor-enter v1

    .line 209
    :try_start_e
    iget-object v0, p0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    monitor-exit v1

    goto :goto_a

    .line 210
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
    .line 222
    iget-boolean v0, p0, Lorg/apache/commons/collections/FastHashMap;->fast:Z

    if-eqz v0, :cond_b

    .line 223
    iget-object v0, p0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsValue(Ljava/lang/Object;)Z

    move-result v0

    .line 226
    :goto_a
    return v0

    .line 225
    :cond_b
    iget-object v1, p0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    monitor-enter v1

    .line 226
    :try_start_e
    iget-object v0, p0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsValue(Ljava/lang/Object;)Z

    move-result v0

    monitor-exit v1

    goto :goto_a

    .line 227
    :catchall_16
    move-exception v0

    monitor-exit v1
    :try_end_18
    .catchall {:try_start_e .. :try_end_18} :catchall_16

    throw v0
.end method

.method public entrySet()Ljava/util/Set;
    .registers 3

    .prologue
    .line 441
    new-instance v0, Lorg/apache/commons/collections/FastHashMap$EntrySet;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lorg/apache/commons/collections/FastHashMap$EntrySet;-><init>(Lorg/apache/commons/collections/FastHashMap;Lorg/apache/commons/collections/FastHashMap$1;)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 12
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 332
    if-ne p1, p0, :cond_5

    .line 381
    :cond_4
    :goto_4
    return v5

    .line 334
    :cond_5
    instance-of v7, p1, Ljava/util/Map;

    if-nez v7, :cond_b

    move v5, v6

    .line 335
    goto :goto_4

    :cond_b
    move-object v3, p1

    .line 337
    check-cast v3, Ljava/util/Map;

    .line 340
    .local v3, "mo":Ljava/util/Map;
    iget-boolean v7, p0, Lorg/apache/commons/collections/FastHashMap;->fast:Z

    if-eqz v7, :cond_5a

    .line 341
    invoke-interface {v3}, Ljava/util/Map;->size()I

    move-result v7

    iget-object v8, p0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    invoke-virtual {v8}, Ljava/util/HashMap;->size()I

    move-result v8

    if-eq v7, v8, :cond_20

    move v5, v6

    .line 342
    goto :goto_4

    .line 344
    :cond_20
    iget-object v7, p0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    invoke-virtual {v7}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 345
    .local v1, "i":Ljava/util/Iterator;
    :cond_2a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_4

    .line 346
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 347
    .local v0, "e":Ljava/util/Map$Entry;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    .line 348
    .local v2, "key":Ljava/lang/Object;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    .line 349
    .local v4, "value":Ljava/lang/Object;
    if-nez v4, :cond_4e

    .line 350
    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    if-nez v7, :cond_4c

    invoke-interface {v3, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_2a

    :cond_4c
    move v5, v6

    .line 351
    goto :goto_4

    .line 354
    :cond_4e
    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_2a

    move v5, v6

    .line 355
    goto :goto_4

    .line 362
    .end local v0    # "e":Ljava/util/Map$Entry;
    .end local v1    # "i":Ljava/util/Iterator;
    .end local v2    # "key":Ljava/lang/Object;
    .end local v4    # "value":Ljava/lang/Object;
    :cond_5a
    iget-object v7, p0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    monitor-enter v7

    .line 363
    :try_start_5d
    invoke-interface {v3}, Ljava/util/Map;->size()I

    move-result v8

    iget-object v9, p0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    invoke-virtual {v9}, Ljava/util/HashMap;->size()I

    move-result v9

    if-eq v8, v9, :cond_6c

    .line 364
    monitor-exit v7

    move v5, v6

    goto :goto_4

    .line 366
    :cond_6c
    iget-object v8, p0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    invoke-virtual {v8}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 367
    .restart local v1    # "i":Ljava/util/Iterator;
    :cond_76
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_aa

    .line 368
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 369
    .restart local v0    # "e":Ljava/util/Map$Entry;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    .line 370
    .restart local v2    # "key":Ljava/lang/Object;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    .line 371
    .restart local v4    # "value":Ljava/lang/Object;
    if-nez v4, :cond_9c

    .line 372
    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    if-nez v8, :cond_98

    invoke-interface {v3, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_76

    .line 373
    :cond_98
    monitor-exit v7

    move v5, v6

    goto/16 :goto_4

    .line 376
    :cond_9c
    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v4, v8}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_76

    .line 377
    monitor-exit v7

    move v5, v6

    goto/16 :goto_4

    .line 381
    .end local v0    # "e":Ljava/util/Map$Entry;
    .end local v2    # "key":Ljava/lang/Object;
    .end local v4    # "value":Ljava/lang/Object;
    :cond_aa
    monitor-exit v7

    goto/16 :goto_4

    .line 382
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
    .line 158
    iget-boolean v0, p0, Lorg/apache/commons/collections/FastHashMap;->fast:Z

    if-eqz v0, :cond_b

    .line 159
    iget-object v0, p0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 162
    :goto_a
    return-object v0

    .line 161
    :cond_b
    iget-object v1, p0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    monitor-enter v1

    .line 162
    :try_start_e
    iget-object v0, p0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    monitor-exit v1

    goto :goto_a

    .line 163
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
    .line 130
    iget-boolean v0, p0, Lorg/apache/commons/collections/FastHashMap;->fast:Z

    return v0
.end method

.method public hashCode()I
    .registers 5

    .prologue
    .line 394
    iget-boolean v2, p0, Lorg/apache/commons/collections/FastHashMap;->fast:Z

    if-eqz v2, :cond_1f

    .line 395
    const/4 v0, 0x0

    .line 396
    .local v0, "h":I
    iget-object v2, p0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 397
    .local v1, "i":Ljava/util/Iterator;
    :goto_f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3e

    .line 398
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v0, v2

    goto :goto_f

    .line 402
    .end local v0    # "h":I
    .end local v1    # "i":Ljava/util/Iterator;
    :cond_1f
    iget-object v3, p0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    monitor-enter v3

    .line 403
    const/4 v0, 0x0

    .line 404
    .restart local v0    # "h":I
    :try_start_23
    iget-object v2, p0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 405
    .restart local v1    # "i":Ljava/util/Iterator;
    :goto_2d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3d

    .line 406
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v0, v2

    goto :goto_2d

    .line 408
    :cond_3d
    monitor-exit v3

    :cond_3e
    return v0

    .line 409
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
    .line 188
    iget-boolean v0, p0, Lorg/apache/commons/collections/FastHashMap;->fast:Z

    if-eqz v0, :cond_b

    .line 189
    iget-object v0, p0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->isEmpty()Z

    move-result v0

    .line 192
    :goto_a
    return v0

    .line 191
    :cond_b
    iget-object v1, p0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    monitor-enter v1

    .line 192
    :try_start_e
    iget-object v0, p0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->isEmpty()Z

    move-result v0

    monitor-exit v1

    goto :goto_a

    .line 193
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
    .line 449
    new-instance v0, Lorg/apache/commons/collections/FastHashMap$KeySet;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lorg/apache/commons/collections/FastHashMap$KeySet;-><init>(Lorg/apache/commons/collections/FastHashMap;Lorg/apache/commons/collections/FastHashMap$1;)V

    return-object v0
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 7
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 247
    iget-boolean v2, p0, Lorg/apache/commons/collections/FastHashMap;->fast:Z

    if-eqz v2, :cond_18

    .line 248
    monitor-enter p0

    .line 249
    :try_start_5
    iget-object v2, p0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    .line 250
    .local v1, "temp":Ljava/util/HashMap;
    invoke-virtual {v1, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 251
    .local v0, "result":Ljava/lang/Object;
    iput-object v1, p0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    .line 252
    monitor-exit p0

    .line 256
    .end local v0    # "result":Ljava/lang/Object;
    .end local v1    # "temp":Ljava/util/HashMap;
    :goto_14
    return-object v0

    .line 253
    :catchall_15
    move-exception v2

    monitor-exit p0
    :try_end_17
    .catchall {:try_start_5 .. :try_end_17} :catchall_15

    throw v2

    .line 255
    :cond_18
    iget-object v3, p0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    monitor-enter v3

    .line 256
    :try_start_1b
    iget-object v2, p0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    invoke-virtual {v2, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    monitor-exit v3

    goto :goto_14

    .line 257
    :catchall_23
    move-exception v2

    monitor-exit v3
    :try_end_25
    .catchall {:try_start_1b .. :try_end_25} :catchall_23

    throw v2
.end method

.method public putAll(Ljava/util/Map;)V
    .registers 5
    .param p1, "in"    # Ljava/util/Map;

    .prologue
    .line 268
    iget-boolean v1, p0, Lorg/apache/commons/collections/FastHashMap;->fast:Z

    if-eqz v1, :cond_17

    .line 269
    monitor-enter p0

    .line 270
    :try_start_5
    iget-object v1, p0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    .line 271
    .local v0, "temp":Ljava/util/HashMap;
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 272
    iput-object v0, p0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    .line 273
    monitor-exit p0

    .line 279
    .end local v0    # "temp":Ljava/util/HashMap;
    :goto_13
    return-void

    .line 273
    :catchall_14
    move-exception v1

    monitor-exit p0
    :try_end_16
    .catchall {:try_start_5 .. :try_end_16} :catchall_14

    throw v1

    .line 275
    :cond_17
    iget-object v2, p0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    monitor-enter v2

    .line 276
    :try_start_1a
    iget-object v1, p0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 277
    monitor-exit v2

    goto :goto_13

    :catchall_21
    move-exception v1

    monitor-exit v2
    :try_end_23
    .catchall {:try_start_1a .. :try_end_23} :catchall_21

    throw v1
.end method

.method public remove(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 289
    iget-boolean v2, p0, Lorg/apache/commons/collections/FastHashMap;->fast:Z

    if-eqz v2, :cond_18

    .line 290
    monitor-enter p0

    .line 291
    :try_start_5
    iget-object v2, p0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    .line 292
    .local v1, "temp":Ljava/util/HashMap;
    invoke-virtual {v1, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 293
    .local v0, "result":Ljava/lang/Object;
    iput-object v1, p0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    .line 294
    monitor-exit p0

    .line 298
    .end local v0    # "result":Ljava/lang/Object;
    .end local v1    # "temp":Ljava/util/HashMap;
    :goto_14
    return-object v0

    .line 295
    :catchall_15
    move-exception v2

    monitor-exit p0
    :try_end_17
    .catchall {:try_start_5 .. :try_end_17} :catchall_15

    throw v2

    .line 297
    :cond_18
    iget-object v3, p0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    monitor-enter v3

    .line 298
    :try_start_1b
    iget-object v2, p0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    monitor-exit v3

    goto :goto_14

    .line 299
    :catchall_23
    move-exception v2

    monitor-exit v3
    :try_end_25
    .catchall {:try_start_1b .. :try_end_25} :catchall_23

    throw v2
.end method

.method public setFast(Z)V
    .registers 2
    .param p1, "fast"    # Z

    .prologue
    .line 139
    iput-boolean p1, p0, Lorg/apache/commons/collections/FastHashMap;->fast:Z

    .line 140
    return-void
.end method

.method public size()I
    .registers 3

    .prologue
    .line 173
    iget-boolean v0, p0, Lorg/apache/commons/collections/FastHashMap;->fast:Z

    if-eqz v0, :cond_b

    .line 174
    iget-object v0, p0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v0

    .line 177
    :goto_a
    return v0

    .line 176
    :cond_b
    iget-object v1, p0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    monitor-enter v1

    .line 177
    :try_start_e
    iget-object v0, p0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v0

    monitor-exit v1

    goto :goto_a

    .line 178
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
    .line 457
    new-instance v0, Lorg/apache/commons/collections/FastHashMap$Values;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lorg/apache/commons/collections/FastHashMap$Values;-><init>(Lorg/apache/commons/collections/FastHashMap;Lorg/apache/commons/collections/FastHashMap$1;)V

    return-object v0
.end method
