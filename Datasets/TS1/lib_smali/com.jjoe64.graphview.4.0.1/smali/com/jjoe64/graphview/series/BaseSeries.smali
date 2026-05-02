.class public abstract Lcom/jjoe64/graphview/series/BaseSeries;
.super Ljava/lang/Object;
.source "BaseSeries.java"

# interfaces
.implements Lcom/jjoe64/graphview/series/Series;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E::",
        "Lcom/jjoe64/graphview/series/DataPointInterface;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/jjoe64/graphview/series/Series",
        "<TE;>;"
    }
.end annotation


# instance fields
.field private mColor:I

.field private final mData:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<TE;>;"
        }
    .end annotation
.end field

.field private mDataPoints:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Landroid/graphics/PointF;",
            "TE;>;"
        }
    .end annotation
.end field

.field private mGraphViews:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/jjoe64/graphview/GraphView;",
            ">;"
        }
    .end annotation
.end field

.field protected mOnDataPointTapListener:Lcom/jjoe64/graphview/series/OnDataPointTapListener;

.field private mTitle:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 92
    .local p0, "this":Lcom/jjoe64/graphview/series/BaseSeries;, "Lcom/jjoe64/graphview/series/BaseSeries<TE;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/jjoe64/graphview/series/BaseSeries;->mData:Ljava/util/List;

    .line 64
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/jjoe64/graphview/series/BaseSeries;->mDataPoints:Ljava/util/Map;

    .line 76
    const v0, -0xff8834

    iput v0, p0, Lcom/jjoe64/graphview/series/BaseSeries;->mColor:I

    .line 93
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/jjoe64/graphview/series/BaseSeries;->mGraphViews:Ljava/util/List;

    .line 94
    return-void
.end method

.method public constructor <init>([Lcom/jjoe64/graphview/series/DataPointInterface;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TE;)V"
        }
    .end annotation

    .prologue
    .line 102
    .local p0, "this":Lcom/jjoe64/graphview/series/BaseSeries;, "Lcom/jjoe64/graphview/series/BaseSeries<TE;>;"
    .local p1, "data":[Lcom/jjoe64/graphview/series/DataPointInterface;, "[TE;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/jjoe64/graphview/series/BaseSeries;->mData:Ljava/util/List;

    .line 64
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/jjoe64/graphview/series/BaseSeries;->mDataPoints:Ljava/util/Map;

    .line 76
    const v1, -0xff8834

    iput v1, p0, Lcom/jjoe64/graphview/series/BaseSeries;->mColor:I

    .line 103
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/jjoe64/graphview/series/BaseSeries;->mGraphViews:Ljava/util/List;

    .line 104
    array-length v2, p1

    const/4 v1, 0x0

    :goto_1f
    if-ge v1, v2, :cond_2b

    aget-object v0, p1, v1

    .line 105
    .local v0, "d":Lcom/jjoe64/graphview/series/DataPointInterface;, "TE;"
    iget-object v3, p0, Lcom/jjoe64/graphview/series/BaseSeries;->mData:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 104
    add-int/lit8 v1, v1, 0x1

    goto :goto_1f

    .line 107
    .end local v0    # "d":Lcom/jjoe64/graphview/series/DataPointInterface;, "TE;"
    :cond_2b
    return-void
.end method

.method static synthetic access$000(Lcom/jjoe64/graphview/series/BaseSeries;)Ljava/util/List;
    .registers 2
    .param p0, "x0"    # Lcom/jjoe64/graphview/series/BaseSeries;

    .prologue
    .line 49
    iget-object v0, p0, Lcom/jjoe64/graphview/series/BaseSeries;->mData:Ljava/util/List;

    return-object v0
.end method


# virtual methods
.method public appendData(Lcom/jjoe64/graphview/series/DataPointInterface;ZI)V
    .registers 13
    .param p2, "scrollToEnd"    # Z
    .param p3, "maxDataPoints"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;ZI)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/jjoe64/graphview/series/BaseSeries;, "Lcom/jjoe64/graphview/series/BaseSeries<TE;>;"
    .local p1, "dataPoint":Lcom/jjoe64/graphview/series/DataPointInterface;, "TE;"
    const/4 v2, 0x1

    const/4 v4, 0x0

    .line 383
    invoke-virtual {p0, p1}, Lcom/jjoe64/graphview/series/BaseSeries;->checkValueOrder(Lcom/jjoe64/graphview/series/DataPointInterface;)V

    .line 385
    iget-object v3, p0, Lcom/jjoe64/graphview/series/BaseSeries;->mData:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_31

    invoke-interface {p1}, Lcom/jjoe64/graphview/series/DataPointInterface;->getX()D

    move-result-wide v5

    iget-object v3, p0, Lcom/jjoe64/graphview/series/BaseSeries;->mData:Ljava/util/List;

    iget-object v7, p0, Lcom/jjoe64/graphview/series/BaseSeries;->mData:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    invoke-interface {v3, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/jjoe64/graphview/series/DataPointInterface;

    invoke-interface {v3}, Lcom/jjoe64/graphview/series/DataPointInterface;->getX()D

    move-result-wide v7

    cmpg-double v3, v5, v7

    if-gez v3, :cond_31

    .line 386
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "new x-value must be greater then the last value. x-values has to be ordered in ASC."

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 388
    :cond_31
    iget-object v5, p0, Lcom/jjoe64/graphview/series/BaseSeries;->mData:Ljava/util/List;

    monitor-enter v5

    .line 389
    :try_start_34
    iget-object v3, p0, Lcom/jjoe64/graphview/series/BaseSeries;->mData:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v0

    .line 390
    .local v0, "curDataCount":I
    if-ge v0, p3, :cond_69

    .line 392
    iget-object v3, p0, Lcom/jjoe64/graphview/series/BaseSeries;->mData:Ljava/util/List;

    invoke-interface {v3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 398
    :goto_41
    monitor-exit v5
    :try_end_42
    .catchall {:try_start_34 .. :try_end_42} :catchall_75

    .line 401
    iget-object v3, p0, Lcom/jjoe64/graphview/series/BaseSeries;->mData:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-eq v3, v2, :cond_78

    .line 405
    .local v2, "keepLabels":Z
    :goto_4a
    iget-object v3, p0, Lcom/jjoe64/graphview/series/BaseSeries;->mGraphViews:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_50
    :goto_50
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_7a

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/jjoe64/graphview/GraphView;

    .line 406
    .local v1, "gv":Lcom/jjoe64/graphview/GraphView;
    invoke-virtual {v1, v2, p2}, Lcom/jjoe64/graphview/GraphView;->onDataChanged(ZZ)V

    .line 407
    if-eqz p2, :cond_50

    .line 408
    invoke-virtual {v1}, Lcom/jjoe64/graphview/GraphView;->getViewport()Lcom/jjoe64/graphview/Viewport;

    move-result-object v4

    invoke-virtual {v4}, Lcom/jjoe64/graphview/Viewport;->scrollToEnd()V

    goto :goto_50

    .line 395
    .end local v1    # "gv":Lcom/jjoe64/graphview/GraphView;
    .end local v2    # "keepLabels":Z
    :cond_69
    :try_start_69
    iget-object v3, p0, Lcom/jjoe64/graphview/series/BaseSeries;->mData:Ljava/util/List;

    const/4 v6, 0x0

    invoke-interface {v3, v6}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 396
    iget-object v3, p0, Lcom/jjoe64/graphview/series/BaseSeries;->mData:Ljava/util/List;

    invoke-interface {v3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_41

    .line 398
    .end local v0    # "curDataCount":I
    :catchall_75
    move-exception v3

    monitor-exit v5
    :try_end_77
    .catchall {:try_start_69 .. :try_end_77} :catchall_75

    throw v3

    .restart local v0    # "curDataCount":I
    :cond_78
    move v2, v4

    .line 401
    goto :goto_4a

    .line 411
    .restart local v2    # "keepLabels":Z
    :cond_7a
    return-void
.end method

.method protected checkValueOrder(Lcom/jjoe64/graphview/series/DataPointInterface;)V
    .registers 10
    .param p1, "onlyLast"    # Lcom/jjoe64/graphview/series/DataPointInterface;

    .prologue
    .line 428
    .local p0, "this":Lcom/jjoe64/graphview/series/BaseSeries;, "Lcom/jjoe64/graphview/series/BaseSeries<TE;>;"
    iget-object v3, p0, Lcom/jjoe64/graphview/series/BaseSeries;->mData:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    const/4 v4, 0x1

    if-le v3, v4, :cond_7e

    .line 429
    if-eqz p1, :cond_2f

    .line 431
    invoke-interface {p1}, Lcom/jjoe64/graphview/series/DataPointInterface;->getX()D

    move-result-wide v4

    iget-object v3, p0, Lcom/jjoe64/graphview/series/BaseSeries;->mData:Ljava/util/List;

    iget-object v6, p0, Lcom/jjoe64/graphview/series/BaseSeries;->mData:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    invoke-interface {v3, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/jjoe64/graphview/series/DataPointInterface;

    invoke-interface {v3}, Lcom/jjoe64/graphview/series/DataPointInterface;->getX()D

    move-result-wide v6

    cmpg-double v3, v4, v6

    if-gez v3, :cond_7e

    .line 432
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "new x-value must be greater then the last value. x-values has to be ordered in ASC."

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 435
    :cond_2f
    iget-object v3, p0, Lcom/jjoe64/graphview/series/BaseSeries;->mData:Ljava/util/List;

    const/4 v4, 0x0

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/jjoe64/graphview/series/DataPointInterface;

    invoke-interface {v3}, Lcom/jjoe64/graphview/series/DataPointInterface;->getX()D

    move-result-wide v1

    .line 437
    .local v1, "lx":D
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_3d
    iget-object v3, p0, Lcom/jjoe64/graphview/series/BaseSeries;->mData:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v0, v3, :cond_7e

    .line 438
    iget-object v3, p0, Lcom/jjoe64/graphview/series/BaseSeries;->mData:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/jjoe64/graphview/series/DataPointInterface;

    invoke-interface {v3}, Lcom/jjoe64/graphview/series/DataPointInterface;->getX()D

    move-result-wide v3

    const-wide/high16 v5, 0x7ff8000000000000L    # Double.NaN

    cmpl-double v3, v3, v5

    if-eqz v3, :cond_7b

    .line 439
    iget-object v3, p0, Lcom/jjoe64/graphview/series/BaseSeries;->mData:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/jjoe64/graphview/series/DataPointInterface;

    invoke-interface {v3}, Lcom/jjoe64/graphview/series/DataPointInterface;->getX()D

    move-result-wide v3

    cmpl-double v3, v1, v3

    if-lez v3, :cond_6f

    .line 440
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "The order of the values is not correct. X-Values have to be ordered ASC. First the lowest x value and at least the highest x value."

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 442
    :cond_6f
    iget-object v3, p0, Lcom/jjoe64/graphview/series/BaseSeries;->mData:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/jjoe64/graphview/series/DataPointInterface;

    invoke-interface {v3}, Lcom/jjoe64/graphview/series/DataPointInterface;->getX()D

    move-result-wide v1

    .line 437
    :cond_7b
    add-int/lit8 v0, v0, 0x1

    goto :goto_3d

    .line 447
    .end local v0    # "i":I
    .end local v1    # "lx":D
    :cond_7e
    return-void
.end method

.method protected findDataPoint(FF)Lcom/jjoe64/graphview/series/DataPointInterface;
    .registers 15
    .param p1, "x"    # F
    .param p2, "y"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(FF)TE;"
        }
    .end annotation

    .prologue
    .line 304
    .local p0, "this":Lcom/jjoe64/graphview/series/BaseSeries;, "Lcom/jjoe64/graphview/series/BaseSeries<TE;>;"
    const/high16 v3, 0x7fc00000    # Float.NaN

    .line 305
    .local v3, "shortestDistance":F
    const/4 v2, 0x0

    .line 306
    .local v2, "shortest":Lcom/jjoe64/graphview/series/DataPointInterface;, "TE;"
    iget-object v8, p0, Lcom/jjoe64/graphview/series/BaseSeries;->mDataPoints:Ljava/util/Map;

    invoke-interface {v8}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_d
    :goto_d
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_4a

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 307
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroid/graphics/PointF;TE;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/graphics/PointF;

    iget v4, v8, Landroid/graphics/PointF;->x:F

    .line 308
    .local v4, "x1":F
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/graphics/PointF;

    iget v6, v8, Landroid/graphics/PointF;->y:F

    .line 309
    .local v6, "y1":F
    move v5, p1

    .line 310
    .local v5, "x2":F
    move v7, p2

    .line 312
    .local v7, "y2":F
    sub-float v8, v4, v5

    sub-float v10, v4, v5

    mul-float/2addr v8, v10

    sub-float v10, v6, v7

    sub-float v11, v6, v7

    mul-float/2addr v10, v11

    add-float/2addr v8, v10

    float-to-double v10, v8

    invoke-static {v10, v11}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v10

    double-to-float v0, v10

    .line 313
    .local v0, "distance":F
    if-eqz v2, :cond_42

    cmpg-float v8, v0, v3

    if-gez v8, :cond_d

    .line 314
    :cond_42
    move v3, v0

    .line 315
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "shortest":Lcom/jjoe64/graphview/series/DataPointInterface;, "TE;"
    check-cast v2, Lcom/jjoe64/graphview/series/DataPointInterface;

    .restart local v2    # "shortest":Lcom/jjoe64/graphview/series/DataPointInterface;, "TE;"
    goto :goto_d

    .line 318
    .end local v0    # "distance":F
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroid/graphics/PointF;TE;>;"
    .end local v4    # "x1":F
    .end local v5    # "x2":F
    .end local v6    # "y1":F
    .end local v7    # "y2":F
    :cond_4a
    if-eqz v2, :cond_53

    .line 319
    const/high16 v8, 0x42f00000    # 120.0f

    cmpg-float v8, v3, v8

    if-gez v8, :cond_53

    .line 323
    .end local v2    # "shortest":Lcom/jjoe64/graphview/series/DataPointInterface;, "TE;"
    :goto_52
    return-object v2

    .restart local v2    # "shortest":Lcom/jjoe64/graphview/series/DataPointInterface;, "TE;"
    :cond_53
    const/4 v2, 0x0

    goto :goto_52
.end method

.method public getColor()I
    .registers 2

    .prologue
    .line 255
    .local p0, "this":Lcom/jjoe64/graphview/series/BaseSeries;, "Lcom/jjoe64/graphview/series/BaseSeries<TE;>;"
    iget v0, p0, Lcom/jjoe64/graphview/series/BaseSeries;->mColor:I

    return v0
.end method

.method public getHighestValueX()D
    .registers 3

    .prologue
    .line 121
    .local p0, "this":Lcom/jjoe64/graphview/series/BaseSeries;, "Lcom/jjoe64/graphview/series/BaseSeries<TE;>;"
    iget-object v0, p0, Lcom/jjoe64/graphview/series/BaseSeries;->mData:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_b

    const-wide/16 v0, 0x0

    .line 122
    :goto_a
    return-wide v0

    :cond_b
    iget-object v0, p0, Lcom/jjoe64/graphview/series/BaseSeries;->mData:Ljava/util/List;

    iget-object v1, p0, Lcom/jjoe64/graphview/series/BaseSeries;->mData:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/jjoe64/graphview/series/DataPointInterface;

    invoke-interface {v0}, Lcom/jjoe64/graphview/series/DataPointInterface;->getX()D

    move-result-wide v0

    goto :goto_a
.end method

.method public getHighestValueY()D
    .registers 8

    .prologue
    .line 144
    .local p0, "this":Lcom/jjoe64/graphview/series/BaseSeries;, "Lcom/jjoe64/graphview/series/BaseSeries<TE;>;"
    iget-object v5, p0, Lcom/jjoe64/graphview/series/BaseSeries;->mData:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_b

    const-wide/16 v2, 0x0

    .line 152
    :cond_a
    return-wide v2

    .line 145
    :cond_b
    iget-object v5, p0, Lcom/jjoe64/graphview/series/BaseSeries;->mData:Ljava/util/List;

    const/4 v6, 0x0

    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/jjoe64/graphview/series/DataPointInterface;

    invoke-interface {v5}, Lcom/jjoe64/graphview/series/DataPointInterface;->getY()D

    move-result-wide v2

    .line 146
    .local v2, "h":D
    const/4 v4, 0x1

    .local v4, "i":I
    :goto_19
    iget-object v5, p0, Lcom/jjoe64/graphview/series/BaseSeries;->mData:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-ge v4, v5, :cond_a

    .line 147
    iget-object v5, p0, Lcom/jjoe64/graphview/series/BaseSeries;->mData:Ljava/util/List;

    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/jjoe64/graphview/series/DataPointInterface;

    invoke-interface {v5}, Lcom/jjoe64/graphview/series/DataPointInterface;->getY()D

    move-result-wide v0

    .line 148
    .local v0, "c":D
    cmpg-double v5, v2, v0

    if-gez v5, :cond_32

    .line 149
    move-wide v2, v0

    .line 146
    :cond_32
    add-int/lit8 v4, v4, 0x1

    goto :goto_19
.end method

.method public getLowestValueX()D
    .registers 3

    .prologue
    .line 113
    .local p0, "this":Lcom/jjoe64/graphview/series/BaseSeries;, "Lcom/jjoe64/graphview/series/BaseSeries<TE;>;"
    iget-object v0, p0, Lcom/jjoe64/graphview/series/BaseSeries;->mData:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_b

    const-wide/16 v0, 0x0

    .line 114
    :goto_a
    return-wide v0

    :cond_b
    iget-object v0, p0, Lcom/jjoe64/graphview/series/BaseSeries;->mData:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/jjoe64/graphview/series/DataPointInterface;

    invoke-interface {v0}, Lcom/jjoe64/graphview/series/DataPointInterface;->getX()D

    move-result-wide v0

    goto :goto_a
.end method

.method public getLowestValueY()D
    .registers 8

    .prologue
    .line 129
    .local p0, "this":Lcom/jjoe64/graphview/series/BaseSeries;, "Lcom/jjoe64/graphview/series/BaseSeries<TE;>;"
    iget-object v5, p0, Lcom/jjoe64/graphview/series/BaseSeries;->mData:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_b

    const-wide/16 v3, 0x0

    .line 137
    :cond_a
    return-wide v3

    .line 130
    :cond_b
    iget-object v5, p0, Lcom/jjoe64/graphview/series/BaseSeries;->mData:Ljava/util/List;

    const/4 v6, 0x0

    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/jjoe64/graphview/series/DataPointInterface;

    invoke-interface {v5}, Lcom/jjoe64/graphview/series/DataPointInterface;->getY()D

    move-result-wide v3

    .line 131
    .local v3, "l":D
    const/4 v2, 0x1

    .local v2, "i":I
    :goto_19
    iget-object v5, p0, Lcom/jjoe64/graphview/series/BaseSeries;->mData:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-ge v2, v5, :cond_a

    .line 132
    iget-object v5, p0, Lcom/jjoe64/graphview/series/BaseSeries;->mData:Ljava/util/List;

    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/jjoe64/graphview/series/DataPointInterface;

    invoke-interface {v5}, Lcom/jjoe64/graphview/series/DataPointInterface;->getY()D

    move-result-wide v0

    .line 133
    .local v0, "c":D
    cmpl-double v5, v3, v0

    if-lez v5, :cond_32

    .line 134
    move-wide v3, v0

    .line 131
    :cond_32
    add-int/lit8 v2, v2, 0x1

    goto :goto_19
.end method

.method public getTitle()Ljava/lang/String;
    .registers 2

    .prologue
    .line 238
    .local p0, "this":Lcom/jjoe64/graphview/series/BaseSeries;, "Lcom/jjoe64/graphview/series/BaseSeries<TE;>;"
    iget-object v0, p0, Lcom/jjoe64/graphview/series/BaseSeries;->mTitle:Ljava/lang/String;

    return-object v0
.end method

.method public getValues(DD)Ljava/util/Iterator;
    .registers 11
    .param p1, "from"    # D
    .param p3, "until"    # D
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(DD)",
            "Ljava/util/Iterator",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 167
    .local p0, "this":Lcom/jjoe64/graphview/series/BaseSeries;, "Lcom/jjoe64/graphview/series/BaseSeries<TE;>;"
    invoke-virtual {p0}, Lcom/jjoe64/graphview/series/BaseSeries;->getLowestValueX()D

    move-result-wide v0

    cmpg-double v0, p1, v0

    if-gtz v0, :cond_17

    invoke-virtual {p0}, Lcom/jjoe64/graphview/series/BaseSeries;->getHighestValueX()D

    move-result-wide v0

    cmpl-double v0, p3, v0

    if-ltz v0, :cond_17

    .line 168
    iget-object v0, p0, Lcom/jjoe64/graphview/series/BaseSeries;->mData:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 170
    :goto_16
    return-object v0

    :cond_17
    new-instance v0, Lcom/jjoe64/graphview/series/BaseSeries$1;

    move-object v1, p0

    move-wide v2, p1

    move-wide v4, p3

    invoke-direct/range {v0 .. v5}, Lcom/jjoe64/graphview/series/BaseSeries$1;-><init>(Lcom/jjoe64/graphview/series/BaseSeries;DD)V

    goto :goto_16
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 418
    .local p0, "this":Lcom/jjoe64/graphview/series/BaseSeries;, "Lcom/jjoe64/graphview/series/BaseSeries<TE;>;"
    iget-object v0, p0, Lcom/jjoe64/graphview/series/BaseSeries;->mData:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public onGraphViewAttached(Lcom/jjoe64/graphview/GraphView;)V
    .registers 3
    .param p1, "graphView"    # Lcom/jjoe64/graphview/GraphView;

    .prologue
    .line 371
    .local p0, "this":Lcom/jjoe64/graphview/series/BaseSeries;, "Lcom/jjoe64/graphview/series/BaseSeries<TE;>;"
    iget-object v0, p0, Lcom/jjoe64/graphview/series/BaseSeries;->mGraphViews:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 372
    return-void
.end method

.method public onTap(FF)V
    .registers 5
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    .line 287
    .local p0, "this":Lcom/jjoe64/graphview/series/BaseSeries;, "Lcom/jjoe64/graphview/series/BaseSeries<TE;>;"
    iget-object v1, p0, Lcom/jjoe64/graphview/series/BaseSeries;->mOnDataPointTapListener:Lcom/jjoe64/graphview/series/OnDataPointTapListener;

    if-eqz v1, :cond_f

    .line 288
    invoke-virtual {p0, p1, p2}, Lcom/jjoe64/graphview/series/BaseSeries;->findDataPoint(FF)Lcom/jjoe64/graphview/series/DataPointInterface;

    move-result-object v0

    .line 289
    .local v0, "p":Lcom/jjoe64/graphview/series/DataPointInterface;, "TE;"
    if-eqz v0, :cond_f

    .line 290
    iget-object v1, p0, Lcom/jjoe64/graphview/series/BaseSeries;->mOnDataPointTapListener:Lcom/jjoe64/graphview/series/OnDataPointTapListener;

    invoke-interface {v1, p0, v0}, Lcom/jjoe64/graphview/series/OnDataPointTapListener;->onTap(Lcom/jjoe64/graphview/series/Series;Lcom/jjoe64/graphview/series/DataPointInterface;)V

    .line 293
    .end local v0    # "p":Lcom/jjoe64/graphview/series/DataPointInterface;, "TE;"
    :cond_f
    return-void
.end method

.method protected registerDataPoint(FFLcom/jjoe64/graphview/series/DataPointInterface;)V
    .registers 6
    .param p1, "x"    # F
    .param p2, "y"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(FFTE;)V"
        }
    .end annotation

    .prologue
    .line 334
    .local p0, "this":Lcom/jjoe64/graphview/series/BaseSeries;, "Lcom/jjoe64/graphview/series/BaseSeries<TE;>;"
    .local p3, "dp":Lcom/jjoe64/graphview/series/DataPointInterface;, "TE;"
    iget-object v0, p0, Lcom/jjoe64/graphview/series/BaseSeries;->mDataPoints:Ljava/util/Map;

    new-instance v1, Landroid/graphics/PointF;

    invoke-direct {v1, p1, p2}, Landroid/graphics/PointF;-><init>(FF)V

    invoke-interface {v0, v1, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 335
    return-void
.end method

.method public resetData([Lcom/jjoe64/graphview/series/DataPointInterface;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TE;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/jjoe64/graphview/series/BaseSeries;, "Lcom/jjoe64/graphview/series/BaseSeries<TE;>;"
    .local p1, "data":[Lcom/jjoe64/graphview/series/DataPointInterface;, "[TE;"
    const/4 v3, 0x0

    .line 352
    iget-object v2, p0, Lcom/jjoe64/graphview/series/BaseSeries;->mData:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 353
    array-length v4, p1

    move v2, v3

    :goto_8
    if-ge v2, v4, :cond_14

    aget-object v0, p1, v2

    .line 354
    .local v0, "d":Lcom/jjoe64/graphview/series/DataPointInterface;, "TE;"
    iget-object v5, p0, Lcom/jjoe64/graphview/series/BaseSeries;->mData:Ljava/util/List;

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 353
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    .line 356
    .end local v0    # "d":Lcom/jjoe64/graphview/series/DataPointInterface;, "TE;"
    :cond_14
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Lcom/jjoe64/graphview/series/BaseSeries;->checkValueOrder(Lcom/jjoe64/graphview/series/DataPointInterface;)V

    .line 359
    iget-object v2, p0, Lcom/jjoe64/graphview/series/BaseSeries;->mGraphViews:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1e
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2f

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/jjoe64/graphview/GraphView;

    .line 360
    .local v1, "gv":Lcom/jjoe64/graphview/GraphView;
    const/4 v4, 0x1

    invoke-virtual {v1, v4, v3}, Lcom/jjoe64/graphview/GraphView;->onDataChanged(ZZ)V

    goto :goto_1e

    .line 362
    .end local v1    # "gv":Lcom/jjoe64/graphview/GraphView;
    :cond_2f
    return-void
.end method

.method protected resetDataPoints()V
    .registers 2

    .prologue
    .line 341
    .local p0, "this":Lcom/jjoe64/graphview/series/BaseSeries;, "Lcom/jjoe64/graphview/series/BaseSeries<TE;>;"
    iget-object v0, p0, Lcom/jjoe64/graphview/series/BaseSeries;->mDataPoints:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 342
    return-void
.end method

.method public setColor(I)V
    .registers 2
    .param p1, "mColor"    # I

    .prologue
    .line 266
    .local p0, "this":Lcom/jjoe64/graphview/series/BaseSeries;, "Lcom/jjoe64/graphview/series/BaseSeries<TE;>;"
    iput p1, p0, Lcom/jjoe64/graphview/series/BaseSeries;->mColor:I

    .line 267
    return-void
.end method

.method public setOnDataPointTapListener(Lcom/jjoe64/graphview/series/OnDataPointTapListener;)V
    .registers 2
    .param p1, "l"    # Lcom/jjoe64/graphview/series/OnDataPointTapListener;

    .prologue
    .line 275
    .local p0, "this":Lcom/jjoe64/graphview/series/BaseSeries;, "Lcom/jjoe64/graphview/series/BaseSeries<TE;>;"
    iput-object p1, p0, Lcom/jjoe64/graphview/series/BaseSeries;->mOnDataPointTapListener:Lcom/jjoe64/graphview/series/OnDataPointTapListener;

    .line 276
    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .registers 2
    .param p1, "mTitle"    # Ljava/lang/String;

    .prologue
    .line 248
    .local p0, "this":Lcom/jjoe64/graphview/series/BaseSeries;, "Lcom/jjoe64/graphview/series/BaseSeries<TE;>;"
    iput-object p1, p0, Lcom/jjoe64/graphview/series/BaseSeries;->mTitle:Ljava/lang/String;

    .line 249
    return-void
.end method
