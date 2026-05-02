.class public Lorg/achartengine/model/XYSeries;
.super Ljava/lang/Object;
.source "XYSeries.java"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private mAnnotations:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mMaxX:D

.field private mMaxY:D

.field private mMinX:D

.field private mMinY:D

.field private mScaleNumber:I

.field private final mStringXY:Lorg/achartengine/util/IndexXYMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/achartengine/util/IndexXYMap",
            "<",
            "Ljava/lang/Double;",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation
.end field

.field private mTitle:Ljava/lang/String;

.field private final mXY:Lorg/achartengine/util/IndexXYMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/achartengine/util/IndexXYMap",
            "<",
            "Ljava/lang/Double;",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 59
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/achartengine/model/XYSeries;-><init>(Ljava/lang/String;I)V

    .line 60
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .registers 8
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "scaleNumber"    # I

    .prologue
    const-wide v3, 0x7fefffffffffffffL    # Double.MAX_VALUE

    const-wide v1, -0x10000000000001L

    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    new-instance v0, Lorg/achartengine/util/IndexXYMap;

    invoke-direct {v0}, Lorg/achartengine/util/IndexXYMap;-><init>()V

    iput-object v0, p0, Lorg/achartengine/model/XYSeries;->mXY:Lorg/achartengine/util/IndexXYMap;

    .line 39
    iput-wide v3, p0, Lorg/achartengine/model/XYSeries;->mMinX:D

    .line 41
    iput-wide v1, p0, Lorg/achartengine/model/XYSeries;->mMaxX:D

    .line 43
    iput-wide v3, p0, Lorg/achartengine/model/XYSeries;->mMinY:D

    .line 45
    iput-wide v1, p0, Lorg/achartengine/model/XYSeries;->mMaxY:D

    .line 49
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/achartengine/model/XYSeries;->mAnnotations:Ljava/util/List;

    .line 51
    new-instance v0, Lorg/achartengine/util/IndexXYMap;

    invoke-direct {v0}, Lorg/achartengine/util/IndexXYMap;-><init>()V

    iput-object v0, p0, Lorg/achartengine/model/XYSeries;->mStringXY:Lorg/achartengine/util/IndexXYMap;

    .line 69
    iput-object p1, p0, Lorg/achartengine/model/XYSeries;->mTitle:Ljava/lang/String;

    .line 70
    iput p2, p0, Lorg/achartengine/model/XYSeries;->mScaleNumber:I

    .line 71
    invoke-direct {p0}, Lorg/achartengine/model/XYSeries;->initRange()V

    .line 72
    return-void
.end method

.method private initRange()V
    .registers 11

    .prologue
    const-wide v8, 0x7fefffffffffffffL    # Double.MAX_VALUE

    const-wide v6, -0x10000000000001L

    .line 87
    iput-wide v8, p0, Lorg/achartengine/model/XYSeries;->mMinX:D

    .line 88
    iput-wide v6, p0, Lorg/achartengine/model/XYSeries;->mMaxX:D

    .line 89
    iput-wide v8, p0, Lorg/achartengine/model/XYSeries;->mMinY:D

    .line 90
    iput-wide v6, p0, Lorg/achartengine/model/XYSeries;->mMaxY:D

    .line 91
    invoke-virtual {p0}, Lorg/achartengine/model/XYSeries;->getItemCount()I

    move-result v1

    .line 92
    .local v1, "length":I
    const/4 v0, 0x0

    .local v0, "k":I
    :goto_17
    if-ge v0, v1, :cond_27

    .line 93
    invoke-virtual {p0, v0}, Lorg/achartengine/model/XYSeries;->getX(I)D

    move-result-wide v2

    .line 94
    .local v2, "x":D
    invoke-virtual {p0, v0}, Lorg/achartengine/model/XYSeries;->getY(I)D

    move-result-wide v4

    .line 95
    .local v4, "y":D
    invoke-direct {p0, v2, v3, v4, v5}, Lorg/achartengine/model/XYSeries;->updateRange(DD)V

    .line 92
    add-int/lit8 v0, v0, 0x1

    goto :goto_17

    .line 97
    .end local v2    # "x":D
    .end local v4    # "y":D
    :cond_27
    return-void
.end method

.method private updateRange(DD)V
    .registers 7
    .param p1, "x"    # D
    .param p3, "y"    # D

    .prologue
    .line 106
    iget-wide v0, p0, Lorg/achartengine/model/XYSeries;->mMinX:D

    invoke-static {v0, v1, p1, p2}, Ljava/lang/Math;->min(DD)D

    move-result-wide v0

    iput-wide v0, p0, Lorg/achartengine/model/XYSeries;->mMinX:D

    .line 107
    iget-wide v0, p0, Lorg/achartengine/model/XYSeries;->mMaxX:D

    invoke-static {v0, v1, p1, p2}, Ljava/lang/Math;->max(DD)D

    move-result-wide v0

    iput-wide v0, p0, Lorg/achartengine/model/XYSeries;->mMaxX:D

    .line 108
    iget-wide v0, p0, Lorg/achartengine/model/XYSeries;->mMinY:D

    invoke-static {v0, v1, p3, p4}, Ljava/lang/Math;->min(DD)D

    move-result-wide v0

    iput-wide v0, p0, Lorg/achartengine/model/XYSeries;->mMinY:D

    .line 109
    iget-wide v0, p0, Lorg/achartengine/model/XYSeries;->mMaxY:D

    invoke-static {v0, v1, p3, p4}, Ljava/lang/Math;->max(DD)D

    move-result-wide v0

    iput-wide v0, p0, Lorg/achartengine/model/XYSeries;->mMaxY:D

    .line 110
    return-void
.end method


# virtual methods
.method public declared-synchronized add(DD)V
    .registers 8
    .param p1, "x"    # D
    .param p3, "y"    # D

    .prologue
    .line 137
    monitor-enter p0

    :goto_1
    :try_start_1
    iget-object v0, p0, Lorg/achartengine/model/XYSeries;->mXY:Lorg/achartengine/util/IndexXYMap;

    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/achartengine/util/IndexXYMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_13

    .line 140
    invoke-virtual {p0, p1, p2}, Lorg/achartengine/model/XYSeries;->getPadding(D)D

    move-result-wide v0

    add-double/2addr p1, v0

    goto :goto_1

    .line 142
    :cond_13
    iget-object v0, p0, Lorg/achartengine/model/XYSeries;->mXY:Lorg/achartengine/util/IndexXYMap;

    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-static {p3, p4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/achartengine/util/IndexXYMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 143
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/achartengine/model/XYSeries;->updateRange(DD)V
    :try_end_23
    .catchall {:try_start_1 .. :try_end_23} :catchall_25

    .line 144
    monitor-exit p0

    return-void

    .line 137
    :catchall_25
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized add(IDD)V
    .registers 9
    .param p1, "index"    # I
    .param p2, "x"    # D
    .param p4, "y"    # D

    .prologue
    .line 154
    monitor-enter p0

    :goto_1
    :try_start_1
    iget-object v0, p0, Lorg/achartengine/model/XYSeries;->mXY:Lorg/achartengine/util/IndexXYMap;

    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/achartengine/util/IndexXYMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_13

    .line 157
    invoke-virtual {p0, p2, p3}, Lorg/achartengine/model/XYSeries;->getPadding(D)D

    move-result-wide v0

    add-double/2addr p2, v0

    goto :goto_1

    .line 159
    :cond_13
    iget-object v0, p0, Lorg/achartengine/model/XYSeries;->mXY:Lorg/achartengine/util/IndexXYMap;

    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-static {p4, p5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v0, p1, v1, v2}, Lorg/achartengine/util/IndexXYMap;->put(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 160
    invoke-direct {p0, p2, p3, p4, p5}, Lorg/achartengine/model/XYSeries;->updateRange(DD)V
    :try_end_23
    .catchall {:try_start_1 .. :try_end_23} :catchall_25

    .line 161
    monitor-exit p0

    return-void

    .line 154
    :catchall_25
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public addAnnotation(Ljava/lang/String;DD)V
    .registers 9
    .param p1, "annotation"    # Ljava/lang/String;
    .param p2, "x"    # D
    .param p4, "y"    # D

    .prologue
    .line 242
    iget-object v0, p0, Lorg/achartengine/model/XYSeries;->mAnnotations:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 243
    :goto_5
    iget-object v0, p0, Lorg/achartengine/model/XYSeries;->mStringXY:Lorg/achartengine/util/IndexXYMap;

    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/achartengine/util/IndexXYMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_17

    .line 244
    invoke-virtual {p0, p2, p3}, Lorg/achartengine/model/XYSeries;->getPadding(D)D

    move-result-wide v0

    add-double/2addr p2, v0

    goto :goto_5

    .line 246
    :cond_17
    iget-object v0, p0, Lorg/achartengine/model/XYSeries;->mStringXY:Lorg/achartengine/util/IndexXYMap;

    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-static {p4, p5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/achartengine/util/IndexXYMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 247
    return-void
.end method

.method public declared-synchronized clear()V
    .registers 2

    .prologue
    .line 185
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lorg/achartengine/model/XYSeries;->clearAnnotations()V

    .line 186
    invoke-virtual {p0}, Lorg/achartengine/model/XYSeries;->clearSeriesValues()V
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_9

    .line 187
    monitor-exit p0

    return-void

    .line 185
    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized clearAnnotations()V
    .registers 2

    .prologue
    .line 201
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/achartengine/model/XYSeries;->mAnnotations:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 202
    iget-object v0, p0, Lorg/achartengine/model/XYSeries;->mStringXY:Lorg/achartengine/util/IndexXYMap;

    invoke-virtual {v0}, Lorg/achartengine/util/IndexXYMap;->clear()V
    :try_end_b
    .catchall {:try_start_1 .. :try_end_b} :catchall_d

    .line 203
    monitor-exit p0

    return-void

    .line 201
    :catchall_d
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized clearSeriesValues()V
    .registers 2

    .prologue
    .line 193
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/achartengine/model/XYSeries;->mXY:Lorg/achartengine/util/IndexXYMap;

    invoke-virtual {v0}, Lorg/achartengine/util/IndexXYMap;->clear()V

    .line 194
    invoke-direct {p0}, Lorg/achartengine/model/XYSeries;->initRange()V
    :try_end_9
    .catchall {:try_start_1 .. :try_end_9} :catchall_b

    .line 195
    monitor-exit p0

    return-void

    .line 193
    :catchall_b
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getAnnotationAt(I)Ljava/lang/String;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 295
    iget-object v0, p0, Lorg/achartengine/model/XYSeries;->mAnnotations:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getAnnotationCount()I
    .registers 2

    .prologue
    .line 285
    iget-object v0, p0, Lorg/achartengine/model/XYSeries;->mAnnotations:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getAnnotationX(I)D
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 266
    iget-object v0, p0, Lorg/achartengine/model/XYSeries;->mStringXY:Lorg/achartengine/util/IndexXYMap;

    invoke-virtual {v0, p1}, Lorg/achartengine/util/IndexXYMap;->getXByIndex(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    return-wide v0
.end method

.method public getAnnotationY(I)D
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 276
    iget-object v0, p0, Lorg/achartengine/model/XYSeries;->mStringXY:Lorg/achartengine/util/IndexXYMap;

    invoke-virtual {v0, p1}, Lorg/achartengine/util/IndexXYMap;->getYByIndex(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    return-wide v0
.end method

.method public getIndexForKey(D)I
    .registers 5
    .param p1, "key"    # D

    .prologue
    .line 343
    iget-object v0, p0, Lorg/achartengine/model/XYSeries;->mXY:Lorg/achartengine/util/IndexXYMap;

    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/achartengine/util/IndexXYMap;->getIndexForKey(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public declared-synchronized getItemCount()I
    .registers 2

    .prologue
    .line 352
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/achartengine/model/XYSeries;->mXY:Lorg/achartengine/util/IndexXYMap;

    invoke-virtual {v0}, Lorg/achartengine/util/IndexXYMap;->size()I
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_9

    move-result v0

    monitor-exit p0

    return v0

    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getMaxX()D
    .registers 3

    .prologue
    .line 379
    iget-wide v0, p0, Lorg/achartengine/model/XYSeries;->mMaxX:D

    return-wide v0
.end method

.method public getMaxY()D
    .registers 3

    .prologue
    .line 388
    iget-wide v0, p0, Lorg/achartengine/model/XYSeries;->mMaxY:D

    return-wide v0
.end method

.method public getMinX()D
    .registers 3

    .prologue
    .line 361
    iget-wide v0, p0, Lorg/achartengine/model/XYSeries;->mMinX:D

    return-wide v0
.end method

.method public getMinY()D
    .registers 3

    .prologue
    .line 370
    iget-wide v0, p0, Lorg/achartengine/model/XYSeries;->mMinY:D

    return-wide v0
.end method

.method protected getPadding(D)D
    .registers 5
    .param p1, "x"    # D

    .prologue
    .line 164
    invoke-static {p1, p2}, Ljava/lang/Math;->ulp(D)D

    move-result-wide v0

    return-wide v0
.end method

.method public declared-synchronized getRange(DDZ)Ljava/util/SortedMap;
    .registers 13
    .param p1, "start"    # D
    .param p3, "stop"    # D
    .param p5, "beforeAfterPoints"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(DDZ)",
            "Ljava/util/SortedMap",
            "<",
            "Ljava/lang/Double;",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation

    .prologue
    .line 309
    monitor-enter p0

    if-eqz p5, :cond_4b

    .line 316
    :try_start_3
    iget-object v4, p0, Lorg/achartengine/model/XYSeries;->mXY:Lorg/achartengine/util/IndexXYMap;

    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/achartengine/util/IndexXYMap;->headMap(Ljava/lang/Object;)Ljava/util/SortedMap;

    move-result-object v0

    .line 317
    .local v0, "headMap":Ljava/util/SortedMap;, "Ljava/util/SortedMap<Ljava/lang/Double;Ljava/lang/Double;>;"
    invoke-interface {v0}, Ljava/util/SortedMap;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_1d

    .line 318
    invoke-interface {v0}, Ljava/util/SortedMap;->lastKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Double;

    invoke-virtual {v4}, Ljava/lang/Double;->doubleValue()D

    move-result-wide p1

    .line 324
    :cond_1d
    iget-object v4, p0, Lorg/achartengine/model/XYSeries;->mXY:Lorg/achartengine/util/IndexXYMap;

    invoke-static {p3, p4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/achartengine/util/IndexXYMap;->tailMap(Ljava/lang/Object;)Ljava/util/SortedMap;

    move-result-object v3

    .line 325
    .local v3, "tailMap":Ljava/util/SortedMap;, "Ljava/util/SortedMap<Ljava/lang/Double;Ljava/lang/Double;>;"
    invoke-interface {v3}, Ljava/util/SortedMap;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_4b

    .line 326
    invoke-interface {v3}, Ljava/util/SortedMap;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 327
    .local v2, "tailIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/Double;>;"
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Double;

    .line 328
    .local v1, "next":Ljava/lang/Double;
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5f

    .line 329
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Double;

    invoke-virtual {v4}, Ljava/lang/Double;->doubleValue()D

    move-result-wide p3

    .line 335
    .end local v0    # "headMap":Ljava/util/SortedMap;, "Ljava/util/SortedMap<Ljava/lang/Double;Ljava/lang/Double;>;"
    .end local v1    # "next":Ljava/lang/Double;
    .end local v2    # "tailIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/Double;>;"
    .end local v3    # "tailMap":Ljava/util/SortedMap;, "Ljava/util/SortedMap<Ljava/lang/Double;Ljava/lang/Double;>;"
    :cond_4b
    :goto_4b
    cmpg-double v4, p1, p3

    if-gtz v4, :cond_65

    .line 336
    iget-object v4, p0, Lorg/achartengine/model/XYSeries;->mXY:Lorg/achartengine/util/IndexXYMap;

    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    invoke-static {p3, p4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lorg/achartengine/util/IndexXYMap;->subMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/SortedMap;
    :try_end_5c
    .catchall {:try_start_3 .. :try_end_5c} :catchall_6b

    move-result-object v4

    .line 338
    :goto_5d
    monitor-exit p0

    return-object v4

    .line 331
    .restart local v0    # "headMap":Ljava/util/SortedMap;, "Ljava/util/SortedMap<Ljava/lang/Double;Ljava/lang/Double;>;"
    .restart local v1    # "next":Ljava/lang/Double;
    .restart local v2    # "tailIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/Double;>;"
    .restart local v3    # "tailMap":Ljava/util/SortedMap;, "Ljava/util/SortedMap<Ljava/lang/Double;Ljava/lang/Double;>;"
    :cond_5f
    :try_start_5f
    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v4

    add-double/2addr p3, v4

    goto :goto_4b

    .line 338
    .end local v0    # "headMap":Ljava/util/SortedMap;, "Ljava/util/SortedMap<Ljava/lang/Double;Ljava/lang/Double;>;"
    .end local v1    # "next":Ljava/lang/Double;
    .end local v2    # "tailIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/Double;>;"
    .end local v3    # "tailMap":Ljava/util/SortedMap;, "Ljava/util/SortedMap<Ljava/lang/Double;Ljava/lang/Double;>;"
    :cond_65
    new-instance v4, Ljava/util/TreeMap;

    invoke-direct {v4}, Ljava/util/TreeMap;-><init>()V
    :try_end_6a
    .catchall {:try_start_5f .. :try_end_6a} :catchall_6b

    goto :goto_5d

    .line 309
    :catchall_6b
    move-exception v4

    monitor-exit p0

    throw v4
.end method

.method public getScaleNumber()I
    .registers 2

    .prologue
    .line 75
    iget v0, p0, Lorg/achartengine/model/XYSeries;->mScaleNumber:I

    return v0
.end method

.method public getTitle()Ljava/lang/String;
    .registers 2

    .prologue
    .line 118
    iget-object v0, p0, Lorg/achartengine/model/XYSeries;->mTitle:Ljava/lang/String;

    return-object v0
.end method

.method public declared-synchronized getX(I)D
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 221
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/achartengine/model/XYSeries;->mXY:Lorg/achartengine/util/IndexXYMap;

    invoke-virtual {v0, p1}, Lorg/achartengine/util/IndexXYMap;->getXByIndex(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D
    :try_end_c
    .catchall {:try_start_1 .. :try_end_c} :catchall_f

    move-result-wide v0

    monitor-exit p0

    return-wide v0

    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getXYMap()Lorg/achartengine/util/IndexXYMap;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/achartengine/util/IndexXYMap",
            "<",
            "Ljava/lang/Double;",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation

    .prologue
    .line 211
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/achartengine/model/XYSeries;->mXY:Lorg/achartengine/util/IndexXYMap;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-object v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getY(I)D
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 231
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/achartengine/model/XYSeries;->mXY:Lorg/achartengine/util/IndexXYMap;

    invoke-virtual {v0, p1}, Lorg/achartengine/util/IndexXYMap;->getYByIndex(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D
    :try_end_c
    .catchall {:try_start_1 .. :try_end_c} :catchall_f

    move-result-wide v0

    monitor-exit p0

    return-wide v0

    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized remove(I)V
    .registers 9
    .param p1, "index"    # I

    .prologue
    .line 173
    monitor-enter p0

    :try_start_1
    iget-object v5, p0, Lorg/achartengine/model/XYSeries;->mXY:Lorg/achartengine/util/IndexXYMap;

    invoke-virtual {v5, p1}, Lorg/achartengine/util/IndexXYMap;->removeByIndex(I)Lorg/achartengine/util/XYEntry;

    move-result-object v0

    .line 174
    .local v0, "removedEntry":Lorg/achartengine/util/XYEntry;, "Lorg/achartengine/util/XYEntry<Ljava/lang/Double;Ljava/lang/Double;>;"
    invoke-virtual {v0}, Lorg/achartengine/util/XYEntry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Double;

    invoke-virtual {v5}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v1

    .line 175
    .local v1, "removedX":D
    invoke-virtual {v0}, Lorg/achartengine/util/XYEntry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Double;

    invoke-virtual {v5}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v3

    .line 176
    .local v3, "removedY":D
    iget-wide v5, p0, Lorg/achartengine/model/XYSeries;->mMinX:D

    cmpl-double v5, v1, v5

    if-eqz v5, :cond_33

    iget-wide v5, p0, Lorg/achartengine/model/XYSeries;->mMaxX:D

    cmpl-double v5, v1, v5

    if-eqz v5, :cond_33

    iget-wide v5, p0, Lorg/achartengine/model/XYSeries;->mMinY:D

    cmpl-double v5, v3, v5

    if-eqz v5, :cond_33

    iget-wide v5, p0, Lorg/achartengine/model/XYSeries;->mMaxY:D

    cmpl-double v5, v3, v5

    if-nez v5, :cond_36

    .line 177
    :cond_33
    invoke-direct {p0}, Lorg/achartengine/model/XYSeries;->initRange()V
    :try_end_36
    .catchall {:try_start_1 .. :try_end_36} :catchall_38

    .line 179
    :cond_36
    monitor-exit p0

    return-void

    .line 173
    .end local v0    # "removedEntry":Lorg/achartengine/util/XYEntry;, "Lorg/achartengine/util/XYEntry<Ljava/lang/Double;Ljava/lang/Double;>;"
    .end local v1    # "removedX":D
    .end local v3    # "removedY":D
    :catchall_38
    move-exception v5

    monitor-exit p0

    throw v5
.end method

.method public removeAnnotation(I)V
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 255
    iget-object v0, p0, Lorg/achartengine/model/XYSeries;->mAnnotations:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 256
    iget-object v0, p0, Lorg/achartengine/model/XYSeries;->mStringXY:Lorg/achartengine/util/IndexXYMap;

    invoke-virtual {v0, p1}, Lorg/achartengine/util/IndexXYMap;->removeByIndex(I)Lorg/achartengine/util/XYEntry;

    .line 257
    return-void
.end method

.method public setScaleNumber(I)V
    .registers 2
    .param p1, "scaleNumber"    # I

    .prologue
    .line 79
    iput p1, p0, Lorg/achartengine/model/XYSeries;->mScaleNumber:I

    .line 80
    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .registers 2
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 127
    iput-object p1, p0, Lorg/achartengine/model/XYSeries;->mTitle:Ljava/lang/String;

    .line 128
    return-void
.end method
