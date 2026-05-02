.class Lch/qos/logback/classic/turbo/LRUMessageCache;
.super Ljava/util/LinkedHashMap;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/LinkedHashMap",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field final cacheSize:I


# direct methods
.method constructor <init>(I)V
    .registers 5

    const/4 v2, 0x1

    int-to-float v0, p1

    const v1, 0x3faaaaab

    mul-float/2addr v0, v1

    float-to-int v0, v0

    const/high16 v1, 0x3f400000    # 0.75f

    invoke-direct {p0, v0, v1, v2}, Ljava/util/LinkedHashMap;-><init>(IFZ)V

    if-ge p1, v2, :cond_16

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Cache size cannot be smaller than 1"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_16
    iput p1, p0, Lch/qos/logback/classic/turbo/LRUMessageCache;->cacheSize:I

    return-void
.end method


# virtual methods
.method public declared-synchronized clear()V
    .registers 2

    monitor-enter p0

    :try_start_1
    invoke-super {p0}, Ljava/util/LinkedHashMap;->clear()V
    :try_end_4
    .catchall {:try_start_1 .. :try_end_4} :catchall_6

    monitor-exit p0

    return-void

    :catchall_6
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method getMessageCountAndThenIncrement(Ljava/lang/String;)I
    .registers 3

    const/4 v0, 0x0

    if-nez p1, :cond_4

    :goto_3
    return v0

    :cond_4
    monitor-enter p0

    :try_start_5
    invoke-super {p0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    if-nez v0, :cond_1b

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    :goto_12
    invoke-super {p0, p1, v0}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit p0
    :try_end_16
    .catchall {:try_start_5 .. :try_end_16} :catchall_26

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    goto :goto_3

    :cond_1b
    :try_start_1b
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_12

    :catchall_26
    move-exception v0

    monitor-exit p0
    :try_end_28
    .catchall {:try_start_1b .. :try_end_28} :catchall_26

    throw v0
.end method

.method protected removeEldestEntry(Ljava/util/Map$Entry;)Z
    .registers 4

    invoke-virtual {p0}, Lch/qos/logback/classic/turbo/LRUMessageCache;->size()I

    move-result v0

    iget v1, p0, Lch/qos/logback/classic/turbo/LRUMessageCache;->cacheSize:I

    if-le v0, v1, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method
