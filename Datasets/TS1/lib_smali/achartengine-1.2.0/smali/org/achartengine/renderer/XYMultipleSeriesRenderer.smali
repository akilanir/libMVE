.class public Lorg/achartengine/renderer/XYMultipleSeriesRenderer;
.super Lorg/achartengine/renderer/DefaultRenderer;
.source "XYMultipleSeriesRenderer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    }
.end annotation


# instance fields
.field private initialRange:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "[D>;"
        }
    .end annotation
.end field

.field private mAxisTitleTextSize:F

.field private mBarSpacing:D

.field private mBarWidth:F

.field private mGridColors:[I

.field private mMarginsColor:I

.field private mMaxX:[D

.field private mMaxY:[D

.field private mMinX:[D

.field private mMinY:[D

.field private mOrientation:Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;

.field private mPanLimits:[D

.field private mPanXEnabled:Z

.field private mPanYEnabled:Z

.field private mPointSize:F

.field private mXLabelFormat:Ljava/text/NumberFormat;

.field private mXLabels:I

.field private mXLabelsAngle:F

.field private mXLabelsColor:I

.field private mXLabelsPadding:F

.field private mXRoundedLabels:Z

.field private mXTextLabels:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Double;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mXTitle:Ljava/lang/String;

.field private mYLabelFormat:[Ljava/text/NumberFormat;

.field private mYLabels:I

.field private mYLabelsAngle:F

.field private mYLabelsColor:[I

.field private mYLabelsPadding:F

.field private mYLabelsVerticalPadding:F

.field private mYTextLabels:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Double;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private mYTitle:[Ljava/lang/String;

.field private mZoomInLimitX:D

.field private mZoomInLimitY:D

.field private mZoomLimits:[D

.field private mZoomXEnabled:Z

.field private mZoomYEnabled:Z

.field private scalesCount:I

.field private xLabelsAlign:Landroid/graphics/Paint$Align;

.field private yAxisAlign:[Landroid/graphics/Paint$Align;

.field private yLabelsAlign:[Landroid/graphics/Paint$Align;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 139
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;-><init>(I)V

    .line 140
    return-void
.end method

.method public constructor <init>(I)V
    .registers 9
    .param p1, "scaleNumber"    # I

    .prologue
    const/4 v6, 0x0

    const v5, -0x333334

    const/4 v4, 0x0

    const-wide/16 v2, 0x0

    const/4 v1, 0x1

    .line 142
    invoke-direct {p0}, Lorg/achartengine/renderer/DefaultRenderer;-><init>()V

    .line 33
    const-string v0, ""

    iput-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mXTitle:Ljava/lang/String;

    .line 37
    const/high16 v0, 0x41400000    # 12.0f

    iput v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mAxisTitleTextSize:F

    .line 47
    const/4 v0, 0x5

    iput v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mXLabels:I

    .line 49
    const/4 v0, 0x5

    iput v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mYLabels:I

    .line 51
    sget-object v0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;->HORIZONTAL:Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;

    iput-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mOrientation:Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;

    .line 53
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mXTextLabels:Ljava/util/Map;

    .line 55
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mYTextLabels:Ljava/util/Map;

    .line 57
    iput-boolean v1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mPanXEnabled:Z

    .line 59
    iput-boolean v1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mPanYEnabled:Z

    .line 61
    iput-boolean v1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mZoomXEnabled:Z

    .line 63
    iput-boolean v1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mZoomYEnabled:Z

    .line 65
    iput-wide v2, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mBarSpacing:D

    .line 67
    iput v6, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mMarginsColor:I

    .line 77
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->initialRange:Ljava/util/Map;

    .line 79
    const/high16 v0, 0x40400000    # 3.0f

    iput v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mPointSize:F

    .line 85
    sget-object v0, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    iput-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->xLabelsAlign:Landroid/graphics/Paint$Align;

    .line 89
    iput v4, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mXLabelsPadding:F

    .line 91
    iput v4, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mYLabelsPadding:F

    .line 93
    const/high16 v0, 0x40000000    # 2.0f

    iput v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mYLabelsVerticalPadding:F

    .line 97
    iput v5, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mXLabelsColor:I

    .line 99
    new-array v0, v1, [I

    aput v5, v0, v6

    iput-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mYLabelsColor:[I

    .line 104
    iput-boolean v1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mXRoundedLabels:Z

    .line 110
    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mBarWidth:F

    .line 112
    iput-wide v2, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mZoomInLimitX:D

    .line 114
    iput-wide v2, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mZoomInLimitY:D

    .line 143
    iput p1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->scalesCount:I

    .line 144
    invoke-virtual {p0, p1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->initAxesRange(I)V

    .line 145
    return-void
.end method


# virtual methods
.method public addTextLabel(DLjava/lang/String;)V
    .registers 4
    .param p1, "x"    # D
    .param p3, "text"    # Ljava/lang/String;

    .prologue
    .line 537
    invoke-virtual {p0, p1, p2, p3}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->addXTextLabel(DLjava/lang/String;)V

    .line 538
    return-void
.end method

.method public declared-synchronized addXTextLabel(DLjava/lang/String;)V
    .registers 6
    .param p1, "x"    # D
    .param p3, "text"    # Ljava/lang/String;

    .prologue
    .line 547
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mXTextLabels:Ljava/util/Map;

    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-interface {v0, v1, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_c

    .line 548
    monitor-exit p0

    return-void

    .line 547
    :catchall_c
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public addYTextLabel(DLjava/lang/String;)V
    .registers 5
    .param p1, "y"    # D
    .param p3, "text"    # Ljava/lang/String;

    .prologue
    .line 619
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->addYTextLabel(DLjava/lang/String;I)V

    .line 620
    return-void
.end method

.method public declared-synchronized addYTextLabel(DLjava/lang/String;I)V
    .registers 7
    .param p1, "y"    # D
    .param p3, "text"    # Ljava/lang/String;
    .param p4, "scale"    # I

    .prologue
    .line 639
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mYTextLabels:Ljava/util/Map;

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-interface {v0, v1, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_14
    .catchall {:try_start_1 .. :try_end_14} :catchall_16

    .line 640
    monitor-exit p0

    return-void

    .line 639
    :catchall_16
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public clearTextLabels()V
    .registers 1

    .prologue
    .line 584
    invoke-virtual {p0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->clearXTextLabels()V

    .line 585
    return-void
.end method

.method public declared-synchronized clearXTextLabels()V
    .registers 2

    .prologue
    .line 591
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mXTextLabels:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_8

    .line 592
    monitor-exit p0

    return-void

    .line 591
    :catchall_8
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public clearYTextLabels()V
    .registers 2

    .prologue
    .line 696
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->clearYTextLabels(I)V

    .line 697
    return-void
.end method

.method public declared-synchronized clearYTextLabels(I)V
    .registers 4
    .param p1, "scale"    # I

    .prologue
    .line 705
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mYTextLabels:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V
    :try_end_10
    .catchall {:try_start_1 .. :try_end_10} :catchall_12

    .line 706
    monitor-exit p0

    return-void

    .line 705
    :catchall_12
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getAxisTitleTextSize()F
    .registers 2

    .prologue
    .line 259
    iget v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mAxisTitleTextSize:F

    return v0
.end method

.method public getBarSpacing()D
    .registers 3

    .prologue
    .line 845
    iget-wide v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mBarSpacing:D

    return-wide v0
.end method

.method public getBarWidth()F
    .registers 2

    .prologue
    .line 732
    iget v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mBarWidth:F

    return v0
.end method

.method public getBarsSpacing()D
    .registers 3

    .prologue
    .line 836
    invoke-virtual {p0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getBarSpacing()D

    move-result-wide v0

    return-wide v0
.end method

.method public getGridColor(I)I
    .registers 3
    .param p1, "scale"    # I

    .prologue
    .line 884
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mGridColors:[I

    aget v0, v0, p1

    return v0
.end method

.method public getInitialRange()[D
    .registers 2

    .prologue
    .line 1038
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getInitialRange(I)[D

    move-result-object v0

    return-object v0
.end method

.method public getInitialRange(I)[D
    .registers 4
    .param p1, "scale"    # I

    .prologue
    .line 1048
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->initialRange:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [D

    return-object v0
.end method

.method public getLabelFormat()Ljava/text/NumberFormat;
    .registers 2

    .prologue
    .line 1219
    invoke-virtual {p0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getXLabelFormat()Ljava/text/NumberFormat;

    move-result-object v0

    return-object v0
.end method

.method public getMarginsColor()I
    .registers 2

    .prologue
    .line 865
    iget v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mMarginsColor:I

    return v0
.end method

.method public getOrientation()Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    .registers 2

    .prologue
    .line 185
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mOrientation:Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;

    return-object v0
.end method

.method public getPanLimits()[D
    .registers 2

    .prologue
    .line 912
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mPanLimits:[D

    return-object v0
.end method

.method public getPointSize()F
    .registers 2

    .prologue
    .line 988
    iget v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mPointSize:F

    return v0
.end method

.method public getScalesCount()I
    .registers 2

    .prologue
    .line 1321
    iget v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->scalesCount:I

    return v0
.end method

.method public getXAxisMax()D
    .registers 3

    .prologue
    .line 304
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getXAxisMax(I)D

    move-result-wide v0

    return-wide v0
.end method

.method public getXAxisMax(I)D
    .registers 4
    .param p1, "scale"    # I

    .prologue
    .line 419
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mMaxX:[D

    aget-wide v0, v0, p1

    return-wide v0
.end method

.method public getXAxisMin()D
    .registers 3

    .prologue
    .line 277
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getXAxisMin(I)D

    move-result-wide v0

    return-wide v0
.end method

.method public getXAxisMin(I)D
    .registers 4
    .param p1, "scale"    # I

    .prologue
    .line 386
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mMinX:[D

    aget-wide v0, v0, p1

    return-wide v0
.end method

.method public getXLabelFormat()Ljava/text/NumberFormat;
    .registers 2

    .prologue
    .line 1238
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mXLabelFormat:Ljava/text/NumberFormat;

    return-object v0
.end method

.method public getXLabels()I
    .registers 2

    .prologue
    .line 517
    iget v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mXLabels:I

    return v0
.end method

.method public getXLabelsAlign()Landroid/graphics/Paint$Align;
    .registers 2

    .prologue
    .line 1115
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->xLabelsAlign:Landroid/graphics/Paint$Align;

    return-object v0
.end method

.method public getXLabelsAngle()F
    .registers 2

    .prologue
    .line 952
    iget v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mXLabelsAngle:F

    return v0
.end method

.method public getXLabelsColor()I
    .registers 2

    .prologue
    .line 1078
    iget v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mXLabelsColor:I

    return v0
.end method

.method public getXLabelsPadding()F
    .registers 2

    .prologue
    .line 1164
    iget v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mXLabelsPadding:F

    return v0
.end method

.method public declared-synchronized getXTextLabel(Ljava/lang/Double;)Ljava/lang/String;
    .registers 3
    .param p1, "x"    # Ljava/lang/Double;

    .prologue
    .line 566
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mXTextLabels:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;
    :try_end_9
    .catchall {:try_start_1 .. :try_end_9} :catchall_b

    monitor-exit p0

    return-object v0

    :catchall_b
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getXTextLabelLocations()[Ljava/lang/Double;
    .registers 3

    .prologue
    .line 575
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mXTextLabels:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Double;

    invoke-interface {v0, v1}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Double;
    :try_end_10
    .catchall {:try_start_1 .. :try_end_10} :catchall_12

    monitor-exit p0

    return-object v0

    :catchall_12
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getXTitle()Ljava/lang/String;
    .registers 2

    .prologue
    .line 203
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mXTitle:Ljava/lang/String;

    return-object v0
.end method

.method public getYAxisAlign(I)Landroid/graphics/Paint$Align;
    .registers 3
    .param p1, "scale"    # I

    .prologue
    .line 1142
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->yAxisAlign:[Landroid/graphics/Paint$Align;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public getYAxisMax()D
    .registers 3

    .prologue
    .line 358
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYAxisMax(I)D

    move-result-wide v0

    return-wide v0
.end method

.method public getYAxisMax(I)D
    .registers 4
    .param p1, "scale"    # I

    .prologue
    .line 485
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mMaxY:[D

    aget-wide v0, v0, p1

    return-wide v0
.end method

.method public getYAxisMin()D
    .registers 3

    .prologue
    .line 331
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYAxisMin(I)D

    move-result-wide v0

    return-wide v0
.end method

.method public getYAxisMin(I)D
    .registers 4
    .param p1, "scale"    # I

    .prologue
    .line 452
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mMinY:[D

    aget-wide v0, v0, p1

    return-wide v0
.end method

.method public getYLabelFormat(I)Ljava/text/NumberFormat;
    .registers 3
    .param p1, "scale"    # I

    .prologue
    .line 1257
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mYLabelFormat:[Ljava/text/NumberFormat;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public getYLabels()I
    .registers 2

    .prologue
    .line 714
    iget v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mYLabels:I

    return v0
.end method

.method public getYLabelsAlign(I)Landroid/graphics/Paint$Align;
    .registers 3
    .param p1, "scale"    # I

    .prologue
    .line 1134
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->yLabelsAlign:[Landroid/graphics/Paint$Align;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public getYLabelsAngle()F
    .registers 2

    .prologue
    .line 970
    iget v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mYLabelsAngle:F

    return v0
.end method

.method public getYLabelsColor(I)I
    .registers 3
    .param p1, "scale"    # I

    .prologue
    .line 1087
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mYLabelsColor:[I

    aget v0, v0, p1

    return v0
.end method

.method public getYLabelsPadding()F
    .registers 2

    .prologue
    .line 1182
    iget v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mYLabelsPadding:F

    return v0
.end method

.method public getYLabelsVerticalPadding()F
    .registers 2

    .prologue
    .line 1200
    iget v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mYLabelsVerticalPadding:F

    return v0
.end method

.method public getYTextLabel(Ljava/lang/Double;)Ljava/lang/String;
    .registers 3
    .param p1, "y"    # Ljava/lang/Double;

    .prologue
    .line 659
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYTextLabel(Ljava/lang/Double;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized getYTextLabel(Ljava/lang/Double;I)Ljava/lang/String;
    .registers 5
    .param p1, "y"    # Ljava/lang/Double;
    .param p2, "scale"    # I

    .prologue
    .line 670
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mYTextLabels:Ljava/util/Map;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;
    :try_end_13
    .catchall {:try_start_1 .. :try_end_13} :catchall_15

    monitor-exit p0

    return-object v0

    :catchall_15
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getYTextLabelLocations()[Ljava/lang/Double;
    .registers 2

    .prologue
    .line 679
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYTextLabelLocations(I)[Ljava/lang/Double;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized getYTextLabelLocations(I)[Ljava/lang/Double;
    .registers 4
    .param p1, "scale"    # I

    .prologue
    .line 689
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mYTextLabels:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Double;

    invoke-interface {v0, v1}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Double;
    :try_end_1a
    .catchall {:try_start_1 .. :try_end_1a} :catchall_1c

    monitor-exit p0

    return-object v0

    :catchall_1c
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getYTitle()Ljava/lang/String;
    .registers 2

    .prologue
    .line 221
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYTitle(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getYTitle(I)Ljava/lang/String;
    .registers 3
    .param p1, "scale"    # I

    .prologue
    .line 231
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mYTitle:[Ljava/lang/String;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public getZoomInLimitX()D
    .registers 3

    .prologue
    .line 1278
    iget-wide v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mZoomInLimitX:D

    return-wide v0
.end method

.method public getZoomInLimitY()D
    .registers 3

    .prologue
    .line 1303
    iget-wide v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mZoomInLimitY:D

    return-wide v0
.end method

.method public getZoomLimits()[D
    .registers 2

    .prologue
    .line 932
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mZoomLimits:[D

    return-object v0
.end method

.method public initAxesRange(I)V
    .registers 6
    .param p1, "scales"    # I

    .prologue
    const/16 v3, 0xc8

    .line 148
    new-array v1, p1, [Ljava/lang/String;

    iput-object v1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mYTitle:[Ljava/lang/String;

    .line 149
    new-array v1, p1, [Landroid/graphics/Paint$Align;

    iput-object v1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->yLabelsAlign:[Landroid/graphics/Paint$Align;

    .line 150
    new-array v1, p1, [Landroid/graphics/Paint$Align;

    iput-object v1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->yAxisAlign:[Landroid/graphics/Paint$Align;

    .line 151
    new-array v1, p1, [I

    iput-object v1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mYLabelsColor:[I

    .line 152
    new-array v1, p1, [Ljava/text/NumberFormat;

    iput-object v1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mYLabelFormat:[Ljava/text/NumberFormat;

    .line 153
    new-array v1, p1, [D

    iput-object v1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mMinX:[D

    .line 154
    new-array v1, p1, [D

    iput-object v1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mMaxX:[D

    .line 155
    new-array v1, p1, [D

    iput-object v1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mMinY:[D

    .line 156
    new-array v1, p1, [D

    iput-object v1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mMaxY:[D

    .line 157
    new-array v1, p1, [I

    iput-object v1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mGridColors:[I

    .line 158
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2b
    if-ge v0, p1, :cond_4c

    .line 159
    iget-object v1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mYLabelsColor:[I

    const v2, -0x333334

    aput v2, v1, v0

    .line 160
    iget-object v1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mYLabelFormat:[Ljava/text/NumberFormat;

    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    move-result-object v2

    aput-object v2, v1, v0

    .line 161
    iget-object v1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mGridColors:[I

    const/16 v2, 0x4b

    invoke-static {v2, v3, v3, v3}, Landroid/graphics/Color;->argb(IIII)I

    move-result v2

    aput v2, v1, v0

    .line 162
    invoke-virtual {p0, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->initAxesRangeForScale(I)V

    .line 158
    add-int/lit8 v0, v0, 0x1

    goto :goto_2b

    .line 164
    :cond_4c
    return-void
.end method

.method public initAxesRangeForScale(I)V
    .registers 8
    .param p1, "i"    # I

    .prologue
    const-wide v4, 0x7fefffffffffffffL    # Double.MAX_VALUE

    const-wide v2, -0x10000000000001L

    .line 167
    iget-object v1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mMinX:[D

    aput-wide v4, v1, p1

    .line 168
    iget-object v1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mMaxX:[D

    aput-wide v2, v1, p1

    .line 169
    iget-object v1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mMinY:[D

    aput-wide v4, v1, p1

    .line 170
    iget-object v1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mMaxY:[D

    aput-wide v2, v1, p1

    .line 171
    const/4 v1, 0x4

    new-array v0, v1, [D

    const/4 v1, 0x0

    iget-object v2, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mMinX:[D

    aget-wide v2, v2, p1

    aput-wide v2, v0, v1

    const/4 v1, 0x1

    iget-object v2, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mMaxX:[D

    aget-wide v2, v2, p1

    aput-wide v2, v0, v1

    const/4 v1, 0x2

    iget-object v2, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mMinY:[D

    aget-wide v2, v2, p1

    aput-wide v2, v0, v1

    const/4 v1, 0x3

    iget-object v2, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mMaxY:[D

    aget-wide v2, v2, p1

    aput-wide v2, v0, v1

    .line 172
    .local v0, "range":[D
    iget-object v1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->initialRange:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 173
    iget-object v1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mYTitle:[Ljava/lang/String;

    const-string v2, ""

    aput-object v2, v1, p1

    .line 174
    iget-object v1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mYTextLabels:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 175
    iget-object v1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->yLabelsAlign:[Landroid/graphics/Paint$Align;

    sget-object v2, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    aput-object v2, v1, p1

    .line 176
    iget-object v1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->yAxisAlign:[Landroid/graphics/Paint$Align;

    sget-object v2, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    aput-object v2, v1, p1

    .line 177
    return-void
.end method

.method public isInitialRangeSet()Z
    .registers 2

    .prologue
    .line 1019
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isInitialRangeSet(I)Z

    move-result v0

    return v0
.end method

.method public isInitialRangeSet(I)Z
    .registers 4
    .param p1, "scale"    # I

    .prologue
    .line 1029
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->initialRange:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public isMaxXSet()Z
    .registers 2

    .prologue
    .line 322
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isMaxXSet(I)Z

    move-result v0

    return v0
.end method

.method public isMaxXSet(I)Z
    .registers 6
    .param p1, "scale"    # I

    .prologue
    .line 442
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mMaxX:[D

    aget-wide v0, v0, p1

    const-wide v2, -0x10000000000001L

    cmpl-double v0, v0, v2

    if-eqz v0, :cond_f

    const/4 v0, 0x1

    :goto_e
    return v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method

.method public isMaxYSet()Z
    .registers 2

    .prologue
    .line 376
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isMaxYSet(I)Z

    move-result v0

    return v0
.end method

.method public isMaxYSet(I)Z
    .registers 6
    .param p1, "scale"    # I

    .prologue
    .line 508
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mMaxY:[D

    aget-wide v0, v0, p1

    const-wide v2, -0x10000000000001L

    cmpl-double v0, v0, v2

    if-eqz v0, :cond_f

    const/4 v0, 0x1

    :goto_e
    return v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method

.method public isMinXSet()Z
    .registers 2

    .prologue
    .line 295
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isMinXSet(I)Z

    move-result v0

    return v0
.end method

.method public isMinXSet(I)Z
    .registers 6
    .param p1, "scale"    # I

    .prologue
    .line 409
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mMinX:[D

    aget-wide v0, v0, p1

    const-wide v2, 0x7fefffffffffffffL    # Double.MAX_VALUE

    cmpl-double v0, v0, v2

    if-eqz v0, :cond_f

    const/4 v0, 0x1

    :goto_e
    return v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method

.method public isMinYSet()Z
    .registers 2

    .prologue
    .line 349
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isMinYSet(I)Z

    move-result v0

    return v0
.end method

.method public isMinYSet(I)Z
    .registers 6
    .param p1, "scale"    # I

    .prologue
    .line 475
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mMinY:[D

    aget-wide v0, v0, p1

    const-wide v2, 0x7fefffffffffffffL    # Double.MAX_VALUE

    cmpl-double v0, v0, v2

    if-eqz v0, :cond_f

    const/4 v0, 0x1

    :goto_e
    return v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method

.method public isPanEnabled()Z
    .registers 2

    .prologue
    .line 750
    invoke-virtual {p0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isPanXEnabled()Z

    move-result v0

    if-nez v0, :cond_c

    invoke-virtual {p0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isPanYEnabled()Z

    move-result v0

    if-eqz v0, :cond_e

    :cond_c
    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public isPanXEnabled()Z
    .registers 2

    .prologue
    .line 759
    iget-boolean v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mPanXEnabled:Z

    return v0
.end method

.method public isPanYEnabled()Z
    .registers 2

    .prologue
    .line 768
    iget-boolean v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mPanYEnabled:Z

    return v0
.end method

.method public isXRoundedLabels()Z
    .registers 2

    .prologue
    .line 600
    iget-boolean v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mXRoundedLabels:Z

    return v0
.end method

.method public isZoomEnabled()Z
    .registers 2

    .prologue
    .line 797
    invoke-virtual {p0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isZoomXEnabled()Z

    move-result v0

    if-nez v0, :cond_c

    invoke-virtual {p0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isZoomYEnabled()Z

    move-result v0

    if-eqz v0, :cond_e

    :cond_c
    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public isZoomXEnabled()Z
    .registers 2

    .prologue
    .line 806
    iget-boolean v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mZoomXEnabled:Z

    return v0
.end method

.method public isZoomYEnabled()Z
    .registers 2

    .prologue
    .line 815
    iget-boolean v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mZoomYEnabled:Z

    return v0
.end method

.method public declared-synchronized removeXTextLabel(D)V
    .registers 5
    .param p1, "x"    # D

    .prologue
    .line 556
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mXTextLabels:Ljava/util/Map;

    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_c

    .line 557
    monitor-exit p0

    return-void

    .line 556
    :catchall_c
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public removeYTextLabel(D)V
    .registers 4
    .param p1, "y"    # D

    .prologue
    .line 628
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->removeYTextLabel(DI)V

    .line 629
    return-void
.end method

.method public declared-synchronized removeYTextLabel(DI)V
    .registers 6
    .param p1, "y"    # D
    .param p3, "scale"    # I

    .prologue
    .line 649
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mYTextLabels:Ljava/util/Map;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_14
    .catchall {:try_start_1 .. :try_end_14} :catchall_16

    .line 650
    monitor-exit p0

    return-void

    .line 649
    :catchall_16
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setAxisTitleTextSize(F)V
    .registers 2
    .param p1, "textSize"    # F

    .prologue
    .line 268
    iput p1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mAxisTitleTextSize:F

    .line 269
    return-void
.end method

.method public setBarSpacing(D)V
    .registers 3
    .param p1, "spacing"    # D

    .prologue
    .line 856
    iput-wide p1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mBarSpacing:D

    .line 857
    return-void
.end method

.method public setBarWidth(F)V
    .registers 2
    .param p1, "width"    # F

    .prologue
    .line 741
    iput p1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mBarWidth:F

    .line 742
    return-void
.end method

.method public setGridColor(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 893
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setGridColor(II)V

    .line 894
    return-void
.end method

.method public setGridColor(II)V
    .registers 4
    .param p1, "color"    # I
    .param p2, "scale"    # I

    .prologue
    .line 903
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mGridColors:[I

    aput p1, v0, p2

    .line 904
    return-void
.end method

.method public setInitialRange([D)V
    .registers 3
    .param p1, "range"    # [D

    .prologue
    .line 1058
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setInitialRange([DI)V

    .line 1059
    return-void
.end method

.method public setInitialRange([DI)V
    .registers 5
    .param p1, "range"    # [D
    .param p2, "scale"    # I

    .prologue
    .line 1069
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->initialRange:Ljava/util/Map;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1070
    return-void
.end method

.method public setLabelFormat(Ljava/text/NumberFormat;)V
    .registers 2
    .param p1, "format"    # Ljava/text/NumberFormat;

    .prologue
    .line 1229
    invoke-virtual {p0, p1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setXLabelFormat(Ljava/text/NumberFormat;)V

    .line 1230
    return-void
.end method

.method public setMarginsColor(I)V
    .registers 2
    .param p1, "color"    # I

    .prologue
    .line 874
    iput p1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mMarginsColor:I

    .line 875
    return-void
.end method

.method public setOrientation(Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;)V
    .registers 2
    .param p1, "orientation"    # Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;

    .prologue
    .line 194
    iput-object p1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mOrientation:Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;

    .line 195
    return-void
.end method

.method public setPanEnabled(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 788
    invoke-virtual {p0, p1, p1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setPanEnabled(ZZ)V

    .line 789
    return-void
.end method

.method public setPanEnabled(ZZ)V
    .registers 3
    .param p1, "enabledX"    # Z
    .param p2, "enabledY"    # Z

    .prologue
    .line 778
    iput-boolean p1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mPanXEnabled:Z

    .line 779
    iput-boolean p2, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mPanYEnabled:Z

    .line 780
    return-void
.end method

.method public setPanLimits([D)V
    .registers 2
    .param p1, "panLimits"    # [D

    .prologue
    .line 923
    iput-object p1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mPanLimits:[D

    .line 924
    return-void
.end method

.method public setPointSize(F)V
    .registers 2
    .param p1, "size"    # F

    .prologue
    .line 997
    iput p1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mPointSize:F

    .line 998
    return-void
.end method

.method public setRange([D)V
    .registers 3
    .param p1, "range"    # [D

    .prologue
    .line 1001
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setRange([DI)V

    .line 1002
    return-void
.end method

.method public setRange([DI)V
    .registers 5
    .param p1, "range"    # [D
    .param p2, "scale"    # I

    .prologue
    .line 1012
    const/4 v0, 0x0

    aget-wide v0, p1, v0

    invoke-virtual {p0, v0, v1, p2}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setXAxisMin(DI)V

    .line 1013
    const/4 v0, 0x1

    aget-wide v0, p1, v0

    invoke-virtual {p0, v0, v1, p2}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setXAxisMax(DI)V

    .line 1014
    const/4 v0, 0x2

    aget-wide v0, p1, v0

    invoke-virtual {p0, v0, v1, p2}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setYAxisMin(DI)V

    .line 1015
    const/4 v0, 0x3

    aget-wide v0, p1, v0

    invoke-virtual {p0, v0, v1, p2}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setYAxisMax(DI)V

    .line 1016
    return-void
.end method

.method public setXAxisMax(D)V
    .registers 4
    .param p1, "max"    # D

    .prologue
    .line 313
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setXAxisMax(DI)V

    .line 314
    return-void
.end method

.method public setXAxisMax(DI)V
    .registers 6
    .param p1, "max"    # D
    .param p3, "scale"    # I

    .prologue
    .line 429
    invoke-virtual {p0, p3}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isMaxXSet(I)Z

    move-result v0

    if-nez v0, :cond_15

    .line 430
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->initialRange:Ljava/util/Map;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [D

    const/4 v1, 0x1

    aput-wide p1, v0, v1

    .line 432
    :cond_15
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mMaxX:[D

    aput-wide p1, v0, p3

    .line 433
    return-void
.end method

.method public setXAxisMin(D)V
    .registers 4
    .param p1, "min"    # D

    .prologue
    .line 286
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setXAxisMin(DI)V

    .line 287
    return-void
.end method

.method public setXAxisMin(DI)V
    .registers 6
    .param p1, "min"    # D
    .param p3, "scale"    # I

    .prologue
    .line 396
    invoke-virtual {p0, p3}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isMinXSet(I)Z

    move-result v0

    if-nez v0, :cond_15

    .line 397
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->initialRange:Ljava/util/Map;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [D

    const/4 v1, 0x0

    aput-wide p1, v0, v1

    .line 399
    :cond_15
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mMinX:[D

    aput-wide p1, v0, p3

    .line 400
    return-void
.end method

.method public setXLabelFormat(Ljava/text/NumberFormat;)V
    .registers 2
    .param p1, "format"    # Ljava/text/NumberFormat;

    .prologue
    .line 1247
    iput-object p1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mXLabelFormat:Ljava/text/NumberFormat;

    .line 1248
    return-void
.end method

.method public setXLabels(I)V
    .registers 2
    .param p1, "xLabels"    # I

    .prologue
    .line 526
    iput p1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mXLabels:I

    .line 527
    return-void
.end method

.method public setXLabelsAlign(Landroid/graphics/Paint$Align;)V
    .registers 2
    .param p1, "align"    # Landroid/graphics/Paint$Align;

    .prologue
    .line 1124
    iput-object p1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->xLabelsAlign:Landroid/graphics/Paint$Align;

    .line 1125
    return-void
.end method

.method public setXLabelsAngle(F)V
    .registers 2
    .param p1, "angle"    # F

    .prologue
    .line 961
    iput p1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mXLabelsAngle:F

    .line 962
    return-void
.end method

.method public setXLabelsColor(I)V
    .registers 2
    .param p1, "color"    # I

    .prologue
    .line 1096
    iput p1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mXLabelsColor:I

    .line 1097
    return-void
.end method

.method public setXLabelsPadding(F)V
    .registers 2
    .param p1, "padding"    # F

    .prologue
    .line 1173
    iput p1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mXLabelsPadding:F

    .line 1174
    return-void
.end method

.method public setXRoundedLabels(Z)V
    .registers 2
    .param p1, "rounded"    # Z

    .prologue
    .line 609
    iput-boolean p1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mXRoundedLabels:Z

    .line 610
    return-void
.end method

.method public setXTitle(Ljava/lang/String;)V
    .registers 2
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 212
    iput-object p1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mXTitle:Ljava/lang/String;

    .line 213
    return-void
.end method

.method public setYAxisAlign(Landroid/graphics/Paint$Align;I)V
    .registers 4
    .param p1, "align"    # Landroid/graphics/Paint$Align;
    .param p2, "scale"    # I

    .prologue
    .line 1146
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->yAxisAlign:[Landroid/graphics/Paint$Align;

    aput-object p1, v0, p2

    .line 1147
    return-void
.end method

.method public setYAxisMax(D)V
    .registers 4
    .param p1, "max"    # D

    .prologue
    .line 367
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setYAxisMax(DI)V

    .line 368
    return-void
.end method

.method public setYAxisMax(DI)V
    .registers 6
    .param p1, "max"    # D
    .param p3, "scale"    # I

    .prologue
    .line 495
    invoke-virtual {p0, p3}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isMaxYSet(I)Z

    move-result v0

    if-nez v0, :cond_15

    .line 496
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->initialRange:Ljava/util/Map;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [D

    const/4 v1, 0x3

    aput-wide p1, v0, v1

    .line 498
    :cond_15
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mMaxY:[D

    aput-wide p1, v0, p3

    .line 499
    return-void
.end method

.method public setYAxisMin(D)V
    .registers 4
    .param p1, "min"    # D

    .prologue
    .line 340
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setYAxisMin(DI)V

    .line 341
    return-void
.end method

.method public setYAxisMin(DI)V
    .registers 6
    .param p1, "min"    # D
    .param p3, "scale"    # I

    .prologue
    .line 462
    invoke-virtual {p0, p3}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isMinYSet(I)Z

    move-result v0

    if-nez v0, :cond_15

    .line 463
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->initialRange:Ljava/util/Map;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [D

    const/4 v1, 0x2

    aput-wide p1, v0, v1

    .line 465
    :cond_15
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mMinY:[D

    aput-wide p1, v0, p3

    .line 466
    return-void
.end method

.method public setYLabelFormat(Ljava/text/NumberFormat;I)V
    .registers 4
    .param p1, "format"    # Ljava/text/NumberFormat;
    .param p2, "scale"    # I

    .prologue
    .line 1267
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mYLabelFormat:[Ljava/text/NumberFormat;

    aput-object p1, v0, p2

    .line 1268
    return-void
.end method

.method public setYLabels(I)V
    .registers 2
    .param p1, "yLabels"    # I

    .prologue
    .line 723
    iput p1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mYLabels:I

    .line 724
    return-void
.end method

.method public setYLabelsAlign(Landroid/graphics/Paint$Align;)V
    .registers 3
    .param p1, "align"    # Landroid/graphics/Paint$Align;

    .prologue
    .line 1138
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setYLabelsAlign(Landroid/graphics/Paint$Align;I)V

    .line 1139
    return-void
.end method

.method public setYLabelsAlign(Landroid/graphics/Paint$Align;I)V
    .registers 4
    .param p1, "align"    # Landroid/graphics/Paint$Align;
    .param p2, "scale"    # I

    .prologue
    .line 1155
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->yLabelsAlign:[Landroid/graphics/Paint$Align;

    aput-object p1, v0, p2

    .line 1156
    return-void
.end method

.method public setYLabelsAngle(F)V
    .registers 2
    .param p1, "angle"    # F

    .prologue
    .line 979
    iput p1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mYLabelsAngle:F

    .line 980
    return-void
.end method

.method public setYLabelsColor(II)V
    .registers 4
    .param p1, "scale"    # I
    .param p2, "color"    # I

    .prologue
    .line 1106
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mYLabelsColor:[I

    aput p2, v0, p1

    .line 1107
    return-void
.end method

.method public setYLabelsPadding(F)V
    .registers 2
    .param p1, "padding"    # F

    .prologue
    .line 1209
    iput p1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mYLabelsPadding:F

    .line 1210
    return-void
.end method

.method public setYLabelsVerticalPadding(F)V
    .registers 2
    .param p1, "padding"    # F

    .prologue
    .line 1191
    iput p1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mYLabelsVerticalPadding:F

    .line 1192
    return-void
.end method

.method public setYTitle(Ljava/lang/String;)V
    .registers 3
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 240
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setYTitle(Ljava/lang/String;I)V

    .line 241
    return-void
.end method

.method public setYTitle(Ljava/lang/String;I)V
    .registers 4
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "scale"    # I

    .prologue
    .line 250
    iget-object v0, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mYTitle:[Ljava/lang/String;

    aput-object p1, v0, p2

    .line 251
    return-void
.end method

.method public setZoomEnabled(ZZ)V
    .registers 3
    .param p1, "enabledX"    # Z
    .param p2, "enabledY"    # Z

    .prologue
    .line 825
    iput-boolean p1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mZoomXEnabled:Z

    .line 826
    iput-boolean p2, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mZoomYEnabled:Z

    .line 827
    return-void
.end method

.method public setZoomInLimitX(D)V
    .registers 3
    .param p1, "zoomInLimitX"    # D

    .prologue
    .line 1292
    iput-wide p1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mZoomInLimitX:D

    .line 1293
    return-void
.end method

.method public setZoomInLimitY(D)V
    .registers 3
    .param p1, "zoomInLimitY"    # D

    .prologue
    .line 1317
    iput-wide p1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mZoomInLimitY:D

    .line 1318
    return-void
.end method

.method public setZoomLimits([D)V
    .registers 2
    .param p1, "zoomLimits"    # [D

    .prologue
    .line 943
    iput-object p1, p0, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->mZoomLimits:[D

    .line 944
    return-void
.end method
