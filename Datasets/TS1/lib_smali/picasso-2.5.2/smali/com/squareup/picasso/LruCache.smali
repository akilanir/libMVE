.class public Lcom/squareup/picasso/LruCache;
.super Ljava/lang/Object;
.source "LruCache.java"

# interfaces
.implements Lcom/squareup/picasso/Cache;


# instance fields
.field private evictionCount:I

.field private hitCount:I

.field final map:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap",
            "<",
            "Ljava/lang/String;",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field private final maxSize:I

.field private missCount:I

.field private putCount:I

.field private size:I


# direct methods
.method public constructor <init>(I)V
    .registers 6
    .param p1, "maxSize"    # I

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    if-gtz p1, :cond_d

    .line 45
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Max size must be positive."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 47
    :cond_d
    iput p1, p0, Lcom/squareup/picasso/LruCache;->maxSize:I

    .line 48
    new-instance v0, Ljava/util/LinkedHashMap;

    const/4 v1, 0x0

    const/high16 v2, 0x3f400000    # 0.75f

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Ljava/util/LinkedHashMap;-><init>(IFZ)V

    iput-object v0, p0, Lcom/squareup/picasso/LruCache;->map:Ljava/util/LinkedHashMap;

    .line 49
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 39
    invoke-static {p1}, Lcom/squareup/picasso/Utils;->calculateMemoryCacheSize(Landroid/content/Context;)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/squareup/picasso/LruCache;-><init>(I)V

    .line 40
    return-void
.end method

.method private trimToSize(I)V
    .registers 8
    .param p1, "maxSize"    # I

    .prologue
    .line 91
    :goto_0
    monitor-enter p0

    .line 92
    :try_start_1
    iget v3, p0, Lcom/squareup/picasso/LruCache;->size:I

    if-ltz v3, :cond_11

    iget-object v3, p0, Lcom/squareup/picasso/LruCache;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_35

    iget v3, p0, Lcom/squareup/picasso/LruCache;->size:I

    if-eqz v3, :cond_35

    .line 93
    :cond_11
    new-instance v3, Ljava/lang/IllegalStateException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 94
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

    .line 107
    :catchall_32
    move-exception v3

    monitor-exit p0
    :try_end_34
    .catchall {:try_start_1 .. :try_end_34} :catchall_32

    throw v3

    .line 97
    :cond_35
    :try_start_35
    iget v3, p0, Lcom/squareup/picasso/LruCache;->size:I

    if-le v3, p1, :cond_41

    iget-object v3, p0, Lcom/squareup/picasso/LruCache;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_43

    .line 98
    :cond_41
    monitor-exit p0

    .line 109
    return-void

    .line 101
    :cond_43
    iget-object v3, p0, Lcom/squareup/picasso/LruCache;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 102
    .local v1, "toEvict":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Landroid/graphics/Bitmap;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 103
    .local v0, "key":Ljava/lang/String;
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/Bitmap;

    .line 104
    .local v2, "value":Landroid/graphics/Bitmap;
    iget-object v3, p0, Lcom/squareup/picasso/LruCache;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v3, v0}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    iget v3, p0, Lcom/squareup/picasso/LruCache;->size:I

    invoke-static {v2}, Lcom/squareup/picasso/Utils;->getBitmapBytes(Landroid/graphics/Bitmap;)I

    move-result v4

    sub-int/2addr v3, v4

    iput v3, p0, Lcom/squareup/picasso/LruCache;->size:I

    .line 106
    iget v3, p0, Lcom/squareup/picasso/LruCache;->evictionCount:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/squareup/picasso/LruCache;->evictionCount:I

    .line 107
    monitor-exit p0
    :try_end_74
    .catchall {:try_start_35 .. :try_end_74} :catchall_32

    goto :goto_0
.end method


# virtual methods
.method public final declared-synchronized clear()V
    .registers 2

    .prologue
    .line 125
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lcom/squareup/picasso/LruCache;->evictAll()V
    :try_end_4
    .catchall {:try_start_1 .. :try_end_4} :catchall_6

    .line 126
    monitor-exit p0

    return-void

    .line 125
    :catchall_6
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized clearKeyUri(Ljava/lang/String;)V
    .registers 11
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 129
    monitor-enter p0

    const/4 v4, 0x0

    .line 130
    .local v4, "sizeChanged":Z
    :try_start_2
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    .line 131
    .local v5, "uriLength":I
    iget-object v7, p0, Lcom/squareup/picasso/LruCache;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v7}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Landroid/graphics/Bitmap;>;>;"
    :cond_10
    :goto_10
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_49

    .line 132
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 133
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Landroid/graphics/Bitmap;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 134
    .local v2, "key":Ljava/lang/String;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/graphics/Bitmap;

    .line 135
    .local v6, "value":Landroid/graphics/Bitmap;
    const/16 v7, 0xa

    invoke-virtual {v2, v7}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    .line 136
    .local v3, "newlineIndex":I
    if-ne v3, v5, :cond_10

    const/4 v7, 0x0

    invoke-virtual {v2, v7, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_10

    .line 137
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    .line 138
    iget v7, p0, Lcom/squareup/picasso/LruCache;->size:I

    invoke-static {v6}, Lcom/squareup/picasso/Utils;->getBitmapBytes(Landroid/graphics/Bitmap;)I

    move-result v8

    sub-int/2addr v7, v8

    iput v7, p0, Lcom/squareup/picasso/LruCache;->size:I

    .line 139
    const/4 v4, 0x1

    goto :goto_10

    .line 142
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Landroid/graphics/Bitmap;>;"
    .end local v2    # "key":Ljava/lang/String;
    .end local v3    # "newlineIndex":I
    .end local v6    # "value":Landroid/graphics/Bitmap;
    :cond_49
    if-eqz v4, :cond_50

    .line 143
    iget v7, p0, Lcom/squareup/picasso/LruCache;->maxSize:I

    invoke-direct {p0, v7}, Lcom/squareup/picasso/LruCache;->trimToSize(I)V
    :try_end_50
    .catchall {:try_start_2 .. :try_end_50} :catchall_52

    .line 145
    :cond_50
    monitor-exit p0

    return-void

    .line 129
    .end local v1    # "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Landroid/graphics/Bitmap;>;>;"
    .end local v5    # "uriLength":I
    :catchall_52
    move-exception v7

    monitor-exit p0

    throw v7
.end method

.method public final evictAll()V
    .registers 2

    .prologue
    .line 113
    const/4 v0, -0x1

    invoke-direct {p0, v0}, Lcom/squareup/picasso/LruCache;->trimToSize(I)V

    .line 114
    return-void
.end method

.method public final declared-synchronized evictionCount()I
    .registers 2

    .prologue
    .line 164
    monitor-enter p0

    :try_start_1
    iget v0, p0, Lcom/squareup/picasso/LruCache;->evictionCount:I
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public get(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .registers 5
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 52
    if-nez p1, :cond_a

    .line 53
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "key == null"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 57
    :cond_a
    monitor-enter p0

    .line 58
    :try_start_b
    iget-object v1, p0, Lcom/squareup/picasso/LruCache;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    .line 59
    .local v0, "mapValue":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_1d

    .line 60
    iget v1, p0, Lcom/squareup/picasso/LruCache;->hitCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/squareup/picasso/LruCache;->hitCount:I

    .line 61
    monitor-exit p0

    .line 66
    .end local v0    # "mapValue":Landroid/graphics/Bitmap;
    :goto_1c
    return-object v0

    .line 63
    .restart local v0    # "mapValue":Landroid/graphics/Bitmap;
    :cond_1d
    iget v1, p0, Lcom/squareup/picasso/LruCache;->missCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/squareup/picasso/LruCache;->missCount:I

    .line 64
    monitor-exit p0

    .line 66
    const/4 v0, 0x0

    goto :goto_1c

    .line 64
    .end local v0    # "mapValue":Landroid/graphics/Bitmap;
    :catchall_26
    move-exception v1

    monitor-exit p0
    :try_end_28
    .catchall {:try_start_b .. :try_end_28} :catchall_26

    throw v1
.end method

.method public final declared-synchronized hitCount()I
    .registers 2

    .prologue
    .line 149
    monitor-enter p0

    :try_start_1
    iget v0, p0, Lcom/squareup/picasso/LruCache;->hitCount:I
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
    .line 121
    monitor-enter p0

    :try_start_1
    iget v0, p0, Lcom/squareup/picasso/LruCache;->maxSize:I
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
    .line 154
    monitor-enter p0

    :try_start_1
    iget v0, p0, Lcom/squareup/picasso/LruCache;->missCount:I
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized putCount()I
    .registers 2

    .prologue
    .line 159
    monitor-enter p0

    :try_start_1
    iget v0, p0, Lcom/squareup/picasso/LruCache;->putCount:I
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public set(Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .registers 6
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 70
    if-eqz p1, :cond_4

    if-nez p2, :cond_c

    .line 71
    :cond_4
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "key == null || bitmap == null"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 75
    :cond_c
    monitor-enter p0

    .line 76
    :try_start_d
    iget v1, p0, Lcom/squareup/picasso/LruCache;->putCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/squareup/picasso/LruCache;->putCount:I

    .line 77
    iget v1, p0, Lcom/squareup/picasso/LruCache;->size:I

    invoke-static {p2}, Lcom/squareup/picasso/Utils;->getBitmapBytes(Landroid/graphics/Bitmap;)I

    move-result v2

    add-int/2addr v1, v2

    iput v1, p0, Lcom/squareup/picasso/LruCache;->size:I

    .line 78
    iget-object v1, p0, Lcom/squareup/picasso/LruCache;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, p1, p2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    .line 79
    .local v0, "previous":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_2f

    .line 80
    iget v1, p0, Lcom/squareup/picasso/LruCache;->size:I

    invoke-static {v0}, Lcom/squareup/picasso/Utils;->getBitmapBytes(Landroid/graphics/Bitmap;)I

    move-result v2

    sub-int/2addr v1, v2

    iput v1, p0, Lcom/squareup/picasso/LruCache;->size:I

    .line 82
    :cond_2f
    monitor-exit p0
    :try_end_30
    .catchall {:try_start_d .. :try_end_30} :catchall_36

    .line 84
    iget v1, p0, Lcom/squareup/picasso/LruCache;->maxSize:I

    invoke-direct {p0, v1}, Lcom/squareup/picasso/LruCache;->trimToSize(I)V

    .line 85
    return-void

    .line 82
    .end local v0    # "previous":Landroid/graphics/Bitmap;
    :catchall_36
    move-exception v1

    :try_start_37
    monitor-exit p0
    :try_end_38
    .catchall {:try_start_37 .. :try_end_38} :catchall_36

    throw v1
.end method

.method public final declared-synchronized size()I
    .registers 2

    .prologue
    .line 117
    monitor-enter p0

    :try_start_1
    iget v0, p0, Lcom/squareup/picasso/LruCache;->size:I
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method
