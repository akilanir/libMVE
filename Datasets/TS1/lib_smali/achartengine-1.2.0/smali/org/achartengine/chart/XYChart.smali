.class public abstract Lorg/achartengine/chart/XYChart;
.super Lorg/achartengine/chart/AbstractChart;
.source "XYChart.java"


# instance fields
.field private clickableAreas:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/util/List",
            "<",
            "Lorg/achartengine/chart/ClickableArea;",
            ">;>;"
        }
    .end annotation
.end field

.field private final mCalcRange:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "[D>;"
        }
    .end annotation
.end field

.field private mCenter:Lorg/achartengine/model/Point;

.field protected mDataset:Lorg/achartengine/model/XYMultipleSeriesDataset;

.field protected mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

.field private mScale:F

.field private mScreenR:Landroid/graphics/Rect;

.field private mTranslate:F


# direct methods
.method protected constructor <init>()V
    .registers 2

    .prologue
    .line 76
    invoke-direct {p0}, Lorg/achartengine/chart/AbstractChart;-><init>()V

    .line 68
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/achartengine/chart/XYChart;->mCalcRange:Ljava/util/Map;

    .line 74
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/achartengine/chart/XYChart;->clickableAreas:Ljava/util/Map;

    .line 77
    return-void
.end method

.method public constructor <init>(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V
    .registers 4
    .param p1, "dataset"    # Lorg/achartengine/model/XYMultipleSeriesDataset;
    .param p2, "renderer"    # Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    .prologue
    .line 85
    invoke-direct {p0}, Lorg/achartengine/chart/AbstractChart;-><init>()V

    .line 68
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/achartengine/chart/XYChart;->mCalcRange:Ljava/util/Map;

    .line 74
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/achartengine/chart/XYChart;->clickableAreas:Ljava/util/Map;

    .line 86
    iput-object p1, p0, Lorg/achartengine/chart/XYChart;->mDataset:Lorg/achartengine/model/XYMultipleSeriesDataset;

    .line 87
    iput-object p2, p0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    .line 88
    return-void
.end method

.method private getLabelLinePos(Landroid/graphics/Paint$Align;)I
    .registers 4
    .param p1, "align"    # Landroid/graphics/Paint$Align;

    .prologue
    .line 874
    const/4 v0, 0x4

    .line 875
    .local v0, "pos":I
    sget-object v1, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    if-ne p1, v1, :cond_6

    .line 876
    neg-int v0, v0

    .line 878
    :cond_6
    return v0
.end method

.method private getValidLabels(Ljava/util/List;)Ljava/util/List;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Double;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation

    .prologue
    .line 502
    .local p1, "labels":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 503
    .local v2, "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_9
    :goto_9
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Double;

    .line 504
    .local v1, "label":Ljava/lang/Double;
    invoke-virtual {v1}, Ljava/lang/Double;->isNaN()Z

    move-result v3

    if-eqz v3, :cond_9

    .line 505
    invoke-interface {v2, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    goto :goto_9

    .line 508
    .end local v1    # "label":Ljava/lang/Double;
    :cond_1f
    return-object v2
.end method

.method private setStroke(Landroid/graphics/Paint$Cap;Landroid/graphics/Paint$Join;FLandroid/graphics/Paint$Style;Landroid/graphics/PathEffect;Landroid/graphics/Paint;)V
    .registers 7
    .param p1, "cap"    # Landroid/graphics/Paint$Cap;
    .param p2, "join"    # Landroid/graphics/Paint$Join;
    .param p3, "miter"    # F
    .param p4, "style"    # Landroid/graphics/Paint$Style;
    .param p5, "pathEffect"    # Landroid/graphics/PathEffect;
    .param p6, "paint"    # Landroid/graphics/Paint;

    .prologue
    .line 584
    invoke-virtual {p6, p1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 585
    invoke-virtual {p6, p2}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    .line 586
    invoke-virtual {p6, p3}, Landroid/graphics/Paint;->setStrokeMiter(F)V

    .line 587
    invoke-virtual {p6, p5}, Landroid/graphics/Paint;->setPathEffect(Landroid/graphics/PathEffect;)Landroid/graphics/PathEffect;

    .line 588
    invoke-virtual {p6, p4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 589
    return-void
.end method

.method private transform(Landroid/graphics/Canvas;FZ)V
    .registers 7
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "angle"    # F
    .param p3, "inverse"    # Z

    .prologue
    const/high16 v2, 0x3f800000    # 1.0f

    .line 681
    if-eqz p3, :cond_26

    .line 682
    iget v0, p0, Lorg/achartengine/chart/XYChart;->mScale:F

    div-float v0, v2, v0

    iget v1, p0, Lorg/achartengine/chart/XYChart;->mScale:F

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->scale(FF)V

    .line 683
    iget v0, p0, Lorg/achartengine/chart/XYChart;->mTranslate:F

    iget v1, p0, Lorg/achartengine/chart/XYChart;->mTranslate:F

    neg-float v1, v1

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 684
    neg-float v0, p2

    iget-object v1, p0, Lorg/achartengine/chart/XYChart;->mCenter:Lorg/achartengine/model/Point;

    invoke-virtual {v1}, Lorg/achartengine/model/Point;->getX()F

    move-result v1

    iget-object v2, p0, Lorg/achartengine/chart/XYChart;->mCenter:Lorg/achartengine/model/Point;

    invoke-virtual {v2}, Lorg/achartengine/model/Point;->getY()F

    move-result v2

    invoke-virtual {p1, v0, v1, v2}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 690
    :goto_25
    return-void

    .line 686
    :cond_26
    iget-object v0, p0, Lorg/achartengine/chart/XYChart;->mCenter:Lorg/achartengine/model/Point;

    invoke-virtual {v0}, Lorg/achartengine/model/Point;->getX()F

    move-result v0

    iget-object v1, p0, Lorg/achartengine/chart/XYChart;->mCenter:Lorg/achartengine/model/Point;

    invoke-virtual {v1}, Lorg/achartengine/model/Point;->getY()F

    move-result v1

    invoke-virtual {p1, p2, v0, v1}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 687
    iget v0, p0, Lorg/achartengine/chart/XYChart;->mTranslate:F

    neg-float v0, v0

    iget v1, p0, Lorg/achartengine/chart/XYChart;->mTranslate:F

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 688
    iget v0, p0, Lorg/achartengine/chart/XYChart;->mScale:F

    iget v1, p0, Lorg/achartengine/chart/XYChart;->mScale:F

    div-float v1, v2, v1

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->scale(FF)V

    goto :goto_25
.end method


# virtual methods
.method protected abstract clickableAreasForPoints(Ljava/util/List;Ljava/util/List;FII)[Lorg/achartengine/chart/ClickableArea;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Float;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Double;",
            ">;FII)[",
            "Lorg/achartengine/chart/ClickableArea;"
        }
    .end annotation
.end method

.method public draw(Landroid/graphics/Canvas;IIIILandroid/graphics/Paint;)V
    .registers 124
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "x"    # I
    .param p3, "y"    # I
    .param p4, "width"    # I
    .param p5, "height"    # I
    .param p6, "paint"    # Landroid/graphics/Paint;

    .prologue
    .line 108
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isAntialiasing()Z

    move-result v4

    move-object/from16 v0, p6

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 109
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    div-int/lit8 v5, p5, 0x5

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v6}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getAxisTitleTextSize()F

    move-result v6

    move-object/from16 v0, p0

    invoke-virtual {v0, v4, v5, v6}, Lorg/achartengine/chart/XYChart;->getLegendSize(Lorg/achartengine/renderer/DefaultRenderer;IF)I

    move-result v13

    .line 110
    .local v13, "legendSize":I
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getMargins()[I

    move-result-object v86

    .line 111
    .local v86, "margins":[I
    const/4 v4, 0x1

    aget v4, v86, v4

    add-int v8, p2, v4

    .line 112
    .local v8, "left":I
    const/4 v4, 0x0

    aget v4, v86, v4

    add-int v109, p3, v4

    .line 113
    .local v109, "top":I
    add-int v4, p2, p4

    const/4 v5, 0x3

    aget v5, v86, v5

    sub-int v9, v4, v5

    .line 114
    .local v9, "right":I
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mDataset:Lorg/achartengine/model/XYMultipleSeriesDataset;

    invoke-virtual {v4}, Lorg/achartengine/model/XYMultipleSeriesDataset;->getSeriesCount()I

    move-result v102

    .line 115
    .local v102, "sLength":I
    move/from16 v0, v102

    new-array v7, v0, [Ljava/lang/String;

    .line 116
    .local v7, "titles":[Ljava/lang/String;
    const/16 v22, 0x0

    .local v22, "i":I
    :goto_48
    move/from16 v0, v22

    move/from16 v1, v102

    if-ge v0, v1, :cond_61

    .line 117
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mDataset:Lorg/achartengine/model/XYMultipleSeriesDataset;

    move/from16 v0, v22

    invoke-virtual {v4, v0}, Lorg/achartengine/model/XYMultipleSeriesDataset;->getSeriesAt(I)Lorg/achartengine/model/XYSeries;

    move-result-object v4

    invoke-virtual {v4}, Lorg/achartengine/model/XYSeries;->getTitle()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v7, v22

    .line 116
    add-int/lit8 v22, v22, 0x1

    goto :goto_48

    .line 119
    :cond_61
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isFitLegend()Z

    move-result v4

    if-eqz v4, :cond_8a

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isShowLegend()Z

    move-result v4

    if-eqz v4, :cond_8a

    .line 120
    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    const/4 v15, 0x1

    move-object/from16 v4, p0

    move-object/from16 v5, p1

    move/from16 v10, p3

    move/from16 v11, p4

    move/from16 v12, p5

    move-object/from16 v14, p6

    invoke-virtual/range {v4 .. v15}, Lorg/achartengine/chart/XYChart;->drawLegend(Landroid/graphics/Canvas;Lorg/achartengine/renderer/DefaultRenderer;[Ljava/lang/String;IIIIIILandroid/graphics/Paint;Z)I

    move-result v13

    .line 123
    :cond_8a
    add-int v4, p3, p5

    const/4 v5, 0x2

    aget v5, v86, v5

    sub-int/2addr v4, v5

    sub-int v37, v4, v13

    .line 124
    .local v37, "bottom":I
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mScreenR:Landroid/graphics/Rect;

    if-nez v4, :cond_a1

    .line 125
    new-instance v4, Landroid/graphics/Rect;

    invoke-direct {v4}, Landroid/graphics/Rect;-><init>()V

    move-object/from16 v0, p0

    iput-object v4, v0, Lorg/achartengine/chart/XYChart;->mScreenR:Landroid/graphics/Rect;

    .line 127
    :cond_a1
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mScreenR:Landroid/graphics/Rect;

    move/from16 v0, v109

    move/from16 v1, v37

    invoke-virtual {v4, v8, v0, v9, v1}, Landroid/graphics/Rect;->set(IIII)V

    .line 128
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    const/16 v22, 0x0

    const/16 v23, 0x0

    move-object/from16 v14, p0

    move-object/from16 v16, p1

    move/from16 v17, p2

    move/from16 v18, p3

    move/from16 v19, p4

    move/from16 v20, p5

    move-object/from16 v21, p6

    invoke-virtual/range {v14 .. v23}, Lorg/achartengine/chart/XYChart;->drawBackground(Lorg/achartengine/renderer/DefaultRenderer;Landroid/graphics/Canvas;IIIILandroid/graphics/Paint;ZI)V

    .line 130
    .end local v22    # "i":I
    invoke-virtual/range {p6 .. p6}, Landroid/graphics/Paint;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v4

    if-eqz v4, :cond_10f

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getTextTypeface()Landroid/graphics/Typeface;

    move-result-object v4

    if-eqz v4, :cond_e7

    invoke-virtual/range {p6 .. p6}, Landroid/graphics/Paint;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v5}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getTextTypeface()Landroid/graphics/Typeface;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_10f

    :cond_e7
    invoke-virtual/range {p6 .. p6}, Landroid/graphics/Paint;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v5}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getTextTypefaceName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_10f

    invoke-virtual/range {p6 .. p6}, Landroid/graphics/Paint;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v4

    invoke-virtual {v4}, Landroid/graphics/Typeface;->getStyle()I

    move-result v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v5}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getTextTypefaceStyle()I

    move-result v5

    if-eq v4, v5, :cond_126

    .line 135
    :cond_10f
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getTextTypeface()Landroid/graphics/Typeface;

    move-result-object v4

    if-eqz v4, :cond_1b4

    .line 136
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getTextTypeface()Landroid/graphics/Typeface;

    move-result-object v4

    move-object/from16 v0, p6

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 142
    :cond_126
    :goto_126
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getOrientation()Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;

    move-result-object v23

    .line 143
    .local v23, "or":Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    sget-object v4, Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;->VERTICAL:Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;

    move-object/from16 v0, v23

    if-ne v0, v4, :cond_139

    .line 144
    sub-int/2addr v9, v13

    .line 145
    add-int/lit8 v4, v13, -0x14

    add-int v37, v37, v4

    .line 147
    :cond_139
    invoke-virtual/range {v23 .. v23}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;->getAngle()I

    move-result v70

    .line 148
    .local v70, "angle":I
    const/16 v4, 0x5a

    move/from16 v0, v70

    if-ne v0, v4, :cond_1cf

    const/16 v101, 0x1

    .line 149
    .local v101, "rotate":Z
    :goto_145
    move/from16 v0, p5

    int-to-float v4, v0

    move/from16 v0, p4

    int-to-float v5, v0

    div-float/2addr v4, v5

    move-object/from16 v0, p0

    iput v4, v0, Lorg/achartengine/chart/XYChart;->mScale:F

    .line 150
    sub-int v4, p4, p5

    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    int-to-float v4, v4

    move-object/from16 v0, p0

    iput v4, v0, Lorg/achartengine/chart/XYChart;->mTranslate:F

    .line 151
    move-object/from16 v0, p0

    iget v4, v0, Lorg/achartengine/chart/XYChart;->mScale:F

    const/high16 v5, 0x3f800000    # 1.0f

    cmpg-float v4, v4, v5

    if-gez v4, :cond_172

    .line 152
    move-object/from16 v0, p0

    iget v4, v0, Lorg/achartengine/chart/XYChart;->mTranslate:F

    const/high16 v5, -0x40800000    # -1.0f

    mul-float/2addr v4, v5

    move-object/from16 v0, p0

    iput v4, v0, Lorg/achartengine/chart/XYChart;->mTranslate:F

    .line 154
    :cond_172
    new-instance v4, Lorg/achartengine/model/Point;

    add-int v5, p2, p4

    div-int/lit8 v5, v5, 0x2

    int-to-float v5, v5

    add-int v6, p3, p5

    div-int/lit8 v6, v6, 0x2

    int-to-float v6, v6

    invoke-direct {v4, v5, v6}, Lorg/achartengine/model/Point;-><init>(FF)V

    move-object/from16 v0, p0

    iput-object v4, v0, Lorg/achartengine/chart/XYChart;->mCenter:Lorg/achartengine/model/Point;

    .line 155
    if-eqz v101, :cond_192

    .line 156
    move/from16 v0, v70

    int-to-float v4, v0

    const/4 v5, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v4, v5}, Lorg/achartengine/chart/XYChart;->transform(Landroid/graphics/Canvas;FZ)V

    .line 159
    :cond_192
    const v87, -0x7fffffff

    .line 160
    .local v87, "maxScaleNumber":I
    const/16 v22, 0x0

    .restart local v22    # "i":I
    :goto_197
    move/from16 v0, v22

    move/from16 v1, v102

    if-ge v0, v1, :cond_1d3

    .line 161
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mDataset:Lorg/achartengine/model/XYMultipleSeriesDataset;

    move/from16 v0, v22

    invoke-virtual {v4, v0}, Lorg/achartengine/model/XYMultipleSeriesDataset;->getSeriesAt(I)Lorg/achartengine/model/XYSeries;

    move-result-object v4

    invoke-virtual {v4}, Lorg/achartengine/model/XYSeries;->getScaleNumber()I

    move-result v4

    move/from16 v0, v87

    invoke-static {v0, v4}, Ljava/lang/Math;->max(II)I

    move-result v87

    .line 160
    add-int/lit8 v22, v22, 0x1

    goto :goto_197

    .line 138
    .end local v22    # "i":I
    .end local v23    # "or":Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    .end local v70    # "angle":I
    .end local v87    # "maxScaleNumber":I
    .end local v101    # "rotate":Z
    :cond_1b4
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getTextTypefaceName()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v5}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getTextTypefaceStyle()I

    move-result v5

    invoke-static {v4, v5}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v4

    move-object/from16 v0, p6

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    goto/16 :goto_126

    .line 148
    .restart local v23    # "or":Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    .restart local v70    # "angle":I
    :cond_1cf
    const/16 v101, 0x0

    goto/16 :goto_145

    .line 163
    .restart local v22    # "i":I
    .restart local v87    # "maxScaleNumber":I
    .restart local v101    # "rotate":Z
    :cond_1d3
    add-int/lit8 v87, v87, 0x1

    .line 164
    if-gez v87, :cond_1d8

    .line 478
    :cond_1d7
    :goto_1d7
    return-void

    .line 167
    :cond_1d8
    move/from16 v0, v87

    new-array v0, v0, [D

    move-object/from16 v94, v0

    .line 168
    .local v94, "minX":[D
    move/from16 v0, v87

    new-array v0, v0, [D

    move-object/from16 v88, v0

    .line 169
    .local v88, "maxX":[D
    move/from16 v0, v87

    new-array v0, v0, [D

    move-object/from16 v53, v0

    .line 170
    .local v53, "minY":[D
    move/from16 v0, v87

    new-array v0, v0, [D

    move-object/from16 v89, v0

    .line 171
    .local v89, "maxY":[D
    move/from16 v0, v87

    new-array v0, v0, [Z

    move-object/from16 v81, v0

    .line 172
    .local v81, "isMinXSet":[Z
    move/from16 v0, v87

    new-array v0, v0, [Z

    move-object/from16 v79, v0

    .line 173
    .local v79, "isMaxXSet":[Z
    move/from16 v0, v87

    new-array v0, v0, [Z

    move-object/from16 v82, v0

    .line 174
    .local v82, "isMinYSet":[Z
    move/from16 v0, v87

    new-array v0, v0, [Z

    move-object/from16 v80, v0

    .line 176
    .local v80, "isMaxYSet":[Z
    const/16 v22, 0x0

    :goto_20a
    move/from16 v0, v22

    move/from16 v1, v87

    if-ge v0, v1, :cond_290

    .line 177
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    move/from16 v0, v22

    invoke-virtual {v4, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getXAxisMin(I)D

    move-result-wide v4

    aput-wide v4, v94, v22

    .line 178
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    move/from16 v0, v22

    invoke-virtual {v4, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getXAxisMax(I)D

    move-result-wide v4

    aput-wide v4, v88, v22

    .line 179
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    move/from16 v0, v22

    invoke-virtual {v4, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYAxisMin(I)D

    move-result-wide v4

    aput-wide v4, v53, v22

    .line 180
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    move/from16 v0, v22

    invoke-virtual {v4, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYAxisMax(I)D

    move-result-wide v4

    aput-wide v4, v89, v22

    .line 181
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    move/from16 v0, v22

    invoke-virtual {v4, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isMinXSet(I)Z

    move-result v4

    aput-boolean v4, v81, v22

    .line 182
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    move/from16 v0, v22

    invoke-virtual {v4, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isMaxXSet(I)Z

    move-result v4

    aput-boolean v4, v79, v22

    .line 183
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    move/from16 v0, v22

    invoke-virtual {v4, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isMinYSet(I)Z

    move-result v4

    aput-boolean v4, v82, v22

    .line 184
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    move/from16 v0, v22

    invoke-virtual {v4, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isMaxYSet(I)Z

    move-result v4

    aput-boolean v4, v80, v22

    .line 185
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mCalcRange:Ljava/util/Map;

    invoke-static/range {v22 .. v22}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-nez v4, :cond_28c

    .line 186
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mCalcRange:Ljava/util/Map;

    invoke-static/range {v22 .. v22}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v6, 0x4

    new-array v6, v6, [D

    invoke-interface {v4, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 176
    :cond_28c
    add-int/lit8 v22, v22, 0x1

    goto/16 :goto_20a

    .line 189
    :cond_290
    move/from16 v0, v87

    new-array v0, v0, [D

    move-object/from16 v111, v0

    .line 190
    .local v111, "xPixelsPerUnit":[D
    move/from16 v0, v87

    new-array v0, v0, [D

    move-object/from16 v52, v0

    .line 191
    .local v52, "yPixelsPerUnit":[D
    const/16 v22, 0x0

    :goto_29e
    move/from16 v0, v22

    move/from16 v1, v102

    if-ge v0, v1, :cond_355

    .line 192
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mDataset:Lorg/achartengine/model/XYMultipleSeriesDataset;

    move/from16 v0, v22

    invoke-virtual {v4, v0}, Lorg/achartengine/model/XYMultipleSeriesDataset;->getSeriesAt(I)Lorg/achartengine/model/XYSeries;

    move-result-object v14

    .line 193
    .local v14, "series":Lorg/achartengine/model/XYSeries;
    invoke-virtual {v14}, Lorg/achartengine/model/XYSeries;->getScaleNumber()I

    move-result v103

    .line 194
    .local v103, "scale":I
    invoke-virtual {v14}, Lorg/achartengine/model/XYSeries;->getItemCount()I

    move-result v4

    if-nez v4, :cond_2bb

    .line 191
    :cond_2b8
    :goto_2b8
    add-int/lit8 v22, v22, 0x1

    goto :goto_29e

    .line 197
    :cond_2bb
    aget-boolean v4, v81, v103

    if-nez v4, :cond_2e0

    .line 198
    invoke-virtual {v14}, Lorg/achartengine/model/XYSeries;->getMinX()D

    move-result-wide v95

    .line 199
    .local v95, "minimumX":D
    aget-wide v4, v94, v103

    move-wide/from16 v0, v95

    invoke-static {v4, v5, v0, v1}, Ljava/lang/Math;->min(DD)D

    move-result-wide v4

    aput-wide v4, v94, v103

    .line 200
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mCalcRange:Ljava/util/Map;

    invoke-static/range {v103 .. v103}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [D

    const/4 v5, 0x0

    aget-wide v10, v94, v103

    aput-wide v10, v4, v5

    .line 202
    .end local v95    # "minimumX":D
    :cond_2e0
    aget-boolean v4, v79, v103

    if-nez v4, :cond_305

    .line 203
    invoke-virtual {v14}, Lorg/achartengine/model/XYSeries;->getMaxX()D

    move-result-wide v90

    .line 204
    .local v90, "maximumX":D
    aget-wide v4, v88, v103

    move-wide/from16 v0, v90

    invoke-static {v4, v5, v0, v1}, Ljava/lang/Math;->max(DD)D

    move-result-wide v4

    aput-wide v4, v88, v103

    .line 205
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mCalcRange:Ljava/util/Map;

    invoke-static/range {v103 .. v103}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [D

    const/4 v5, 0x1

    aget-wide v10, v88, v103

    aput-wide v10, v4, v5

    .line 207
    .end local v90    # "maximumX":D
    :cond_305
    aget-boolean v4, v82, v103

    if-nez v4, :cond_32c

    .line 208
    invoke-virtual {v14}, Lorg/achartengine/model/XYSeries;->getMinY()D

    move-result-wide v97

    .line 209
    .local v97, "minimumY":D
    aget-wide v4, v53, v103

    move-wide/from16 v0, v97

    double-to-float v6, v0

    float-to-double v10, v6

    invoke-static {v4, v5, v10, v11}, Ljava/lang/Math;->min(DD)D

    move-result-wide v4

    aput-wide v4, v53, v103

    .line 210
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mCalcRange:Ljava/util/Map;

    invoke-static/range {v103 .. v103}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [D

    const/4 v5, 0x2

    aget-wide v10, v53, v103

    aput-wide v10, v4, v5

    .line 212
    .end local v97    # "minimumY":D
    :cond_32c
    aget-boolean v4, v80, v103

    if-nez v4, :cond_2b8

    .line 213
    invoke-virtual {v14}, Lorg/achartengine/model/XYSeries;->getMaxY()D

    move-result-wide v92

    .line 214
    .local v92, "maximumY":D
    aget-wide v4, v89, v103

    move-wide/from16 v0, v92

    double-to-float v6, v0

    float-to-double v10, v6

    invoke-static {v4, v5, v10, v11}, Ljava/lang/Math;->max(DD)D

    move-result-wide v4

    aput-wide v4, v89, v103

    .line 215
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mCalcRange:Ljava/util/Map;

    invoke-static/range {v103 .. v103}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [D

    const/4 v5, 0x3

    aget-wide v10, v89, v103

    aput-wide v10, v4, v5

    goto/16 :goto_2b8

    .line 218
    .end local v14    # "series":Lorg/achartengine/model/XYSeries;
    .end local v92    # "maximumY":D
    .end local v103    # "scale":I
    :cond_355
    const/16 v22, 0x0

    :goto_357
    move/from16 v0, v22

    move/from16 v1, v87

    if-ge v0, v1, :cond_39f

    .line 219
    aget-wide v4, v88, v22

    aget-wide v10, v94, v22

    sub-double/2addr v4, v10

    const-wide/16 v10, 0x0

    cmpl-double v4, v4, v10

    if-eqz v4, :cond_373

    .line 220
    sub-int v4, v9, v8

    int-to-double v4, v4

    aget-wide v10, v88, v22

    aget-wide v15, v94, v22

    sub-double/2addr v10, v15

    div-double/2addr v4, v10

    aput-wide v4, v111, v22

    .line 222
    :cond_373
    aget-wide v4, v89, v22

    aget-wide v10, v53, v22

    sub-double/2addr v4, v10

    const-wide/16 v10, 0x0

    cmpl-double v4, v4, v10

    if-eqz v4, :cond_38b

    .line 223
    sub-int v4, v37, v109

    int-to-double v4, v4

    aget-wide v10, v89, v22

    aget-wide v15, v53, v22

    sub-double/2addr v10, v15

    div-double/2addr v4, v10

    double-to-float v4, v4

    float-to-double v4, v4

    aput-wide v4, v52, v22

    .line 226
    :cond_38b
    if-lez v22, :cond_39c

    .line 227
    const/4 v4, 0x0

    aget-wide v4, v111, v4

    aput-wide v4, v111, v22

    .line 228
    const/4 v4, 0x0

    aget-wide v4, v94, v4

    aput-wide v4, v94, v22

    .line 229
    const/4 v4, 0x0

    aget-wide v4, v88, v4

    aput-wide v4, v88, v22

    .line 218
    :cond_39c
    add-int/lit8 v22, v22, 0x1

    goto :goto_357

    .line 233
    :cond_39f
    const/16 v77, 0x0

    .line 238
    .local v77, "hasValues":Z
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    move-object/from16 v0, p0

    iput-object v4, v0, Lorg/achartengine/chart/XYChart;->clickableAreas:Ljava/util/Map;

    .line 239
    const/16 v22, 0x0

    :goto_3ac
    move/from16 v0, v22

    move/from16 v1, v102

    if-ge v0, v1, :cond_5bf

    .line 240
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mDataset:Lorg/achartengine/model/XYMultipleSeriesDataset;

    move/from16 v0, v22

    invoke-virtual {v4, v0}, Lorg/achartengine/model/XYMultipleSeriesDataset;->getSeriesAt(I)Lorg/achartengine/model/XYSeries;

    move-result-object v14

    .line 241
    .restart local v14    # "series":Lorg/achartengine/model/XYSeries;
    invoke-virtual {v14}, Lorg/achartengine/model/XYSeries;->getScaleNumber()I

    move-result v103

    .line 242
    .restart local v103    # "scale":I
    invoke-virtual {v14}, Lorg/achartengine/model/XYSeries;->getItemCount()I

    move-result v4

    if-nez v4, :cond_3c9

    .line 239
    :goto_3c6
    add-int/lit8 v22, v22, 0x1

    goto :goto_3ac

    .line 246
    :cond_3c9
    const/16 v77, 0x1

    .line 247
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    move/from16 v0, v22

    invoke-virtual {v4, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getSeriesRendererAt(I)Lorg/achartengine/renderer/SimpleSeriesRenderer;

    move-result-object v20

    check-cast v20, Lorg/achartengine/renderer/XYSeriesRenderer;

    .line 253
    .local v20, "seriesRenderer":Lorg/achartengine/renderer/XYSeriesRenderer;
    new-instance v26, Ljava/util/ArrayList;

    invoke-direct/range {v26 .. v26}, Ljava/util/ArrayList;-><init>()V

    .line 254
    .local v26, "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    new-instance v27, Ljava/util/ArrayList;

    invoke-direct/range {v27 .. v27}, Ljava/util/ArrayList;-><init>()V

    .line 255
    .local v27, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    move/from16 v0, v37

    int-to-float v4, v0

    move/from16 v0, v37

    int-to-double v5, v0

    aget-wide v10, v52, v103

    aget-wide v15, v53, v103

    mul-double/2addr v10, v15

    add-double/2addr v5, v10

    double-to-float v5, v5

    invoke-static {v4, v5}, Ljava/lang/Math;->min(FF)F

    move-result v21

    .line 256
    .local v21, "yAxisValue":F
    new-instance v74, Ljava/util/LinkedList;

    invoke-direct/range {v74 .. v74}, Ljava/util/LinkedList;-><init>()V

    .line 258
    .local v74, "clickableArea":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/achartengine/chart/ClickableArea;>;"
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->clickableAreas:Ljava/util/Map;

    invoke-static/range {v22 .. v22}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    move-object/from16 v0, v74

    invoke-interface {v4, v5, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 260
    monitor-enter v14

    .line 261
    :try_start_405
    aget-wide v15, v94, v103

    aget-wide v17, v88, v103

    invoke-virtual/range {v20 .. v20}, Lorg/achartengine/renderer/XYSeriesRenderer;->isDisplayBoundingPoints()Z

    move-result v19

    invoke-virtual/range {v14 .. v19}, Lorg/achartengine/model/XYSeries;->getRange(DDZ)Ljava/util/SortedMap;

    move-result-object v99

    .line 263
    .local v99, "range":Ljava/util/SortedMap;, "Ljava/util/SortedMap<Ljava/lang/Double;Ljava/lang/Double;>;"
    const/16 v24, -0x1

    .line 265
    .local v24, "startIndex":I
    invoke-interface/range {v99 .. v99}, Ljava/util/SortedMap;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v78

    .local v78, "i$":Ljava/util/Iterator;
    :goto_41b
    invoke-interface/range {v78 .. v78}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_502

    invoke-interface/range {v78 .. v78}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v110

    check-cast v110, Ljava/util/Map$Entry;

    .line 266
    .local v110, "value":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Double;Ljava/lang/Double;>;"
    invoke-interface/range {v110 .. v110}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Double;

    invoke-virtual {v4}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v112

    .line 267
    .local v112, "xValue":D
    invoke-interface/range {v110 .. v110}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Double;

    invoke-virtual {v4}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v115

    .line 268
    .local v115, "yValue":D
    if-gez v24, :cond_453

    move-object/from16 v0, p0

    move-wide/from16 v1, v115

    invoke-virtual {v0, v1, v2}, Lorg/achartengine/chart/XYChart;->isNullValue(D)Z

    move-result v4

    if-eqz v4, :cond_44d

    invoke-virtual/range {p0 .. p0}, Lorg/achartengine/chart/XYChart;->isRenderNullValues()Z

    move-result v4

    if-eqz v4, :cond_453

    .line 269
    :cond_44d
    move-wide/from16 v0, v112

    invoke-virtual {v14, v0, v1}, Lorg/achartengine/model/XYSeries;->getIndexForKey(D)I

    move-result v24

    .line 276
    :cond_453
    invoke-interface/range {v110 .. v110}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    move-object/from16 v0, v27

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 277
    invoke-interface/range {v110 .. v110}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    move-object/from16 v0, v27

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 279
    move-object/from16 v0, p0

    move-wide/from16 v1, v115

    invoke-virtual {v0, v1, v2}, Lorg/achartengine/chart/XYChart;->isNullValue(D)Z

    move-result v4

    if-nez v4, :cond_49b

    .line 280
    int-to-double v4, v8

    aget-wide v10, v111, v103

    aget-wide v15, v94, v103

    sub-double v15, v112, v15

    mul-double/2addr v10, v15

    add-double/2addr v4, v10

    double-to-float v4, v4

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    move-object/from16 v0, v26

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 281
    move/from16 v0, v37

    int-to-double v4, v0

    aget-wide v10, v52, v103

    aget-wide v15, v53, v103

    sub-double v15, v115, v15

    mul-double/2addr v10, v15

    sub-double/2addr v4, v10

    double-to-float v4, v4

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    move-object/from16 v0, v26

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_41b

    .line 325
    .end local v24    # "startIndex":I
    .end local v78    # "i$":Ljava/util/Iterator;
    .end local v99    # "range":Ljava/util/SortedMap;, "Ljava/util/SortedMap<Ljava/lang/Double;Ljava/lang/Double;>;"
    .end local v110    # "value":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Double;Ljava/lang/Double;>;"
    .end local v112    # "xValue":D
    .end local v115    # "yValue":D
    :catchall_498
    move-exception v4

    monitor-exit v14
    :try_end_49a
    .catchall {:try_start_405 .. :try_end_49a} :catchall_498

    throw v4

    .line 282
    .restart local v24    # "startIndex":I
    .restart local v78    # "i$":Ljava/util/Iterator;
    .restart local v99    # "range":Ljava/util/SortedMap;, "Ljava/util/SortedMap<Ljava/lang/Double;Ljava/lang/Double;>;"
    .restart local v110    # "value":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Double;Ljava/lang/Double;>;"
    .restart local v112    # "xValue":D
    .restart local v115    # "yValue":D
    :cond_49b
    :try_start_49b
    invoke-virtual/range {p0 .. p0}, Lorg/achartengine/chart/XYChart;->isRenderNullValues()Z

    move-result v4

    if-eqz v4, :cond_4ca

    .line 283
    int-to-double v4, v8

    aget-wide v10, v111, v103

    aget-wide v15, v94, v103

    sub-double v15, v112, v15

    mul-double/2addr v10, v15

    add-double/2addr v4, v10

    double-to-float v4, v4

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    move-object/from16 v0, v26

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 284
    move/from16 v0, v37

    int-to-double v4, v0

    aget-wide v10, v52, v103

    aget-wide v15, v53, v103

    neg-double v15, v15

    mul-double/2addr v10, v15

    sub-double/2addr v4, v10

    double-to-float v4, v4

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    move-object/from16 v0, v26

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_41b

    .line 286
    :cond_4ca
    invoke-interface/range {v26 .. v26}, Ljava/util/List;->size()I

    move-result v4

    if-lez v4, :cond_4fa

    move-object/from16 v15, p0

    move-object/from16 v16, v14

    move-object/from16 v17, p1

    move-object/from16 v18, p6

    move-object/from16 v19, v26

    .line 287
    invoke-virtual/range {v15 .. v24}, Lorg/achartengine/chart/XYChart;->drawSeries(Lorg/achartengine/model/XYSeries;Landroid/graphics/Canvas;Landroid/graphics/Paint;Ljava/util/List;Lorg/achartengine/renderer/XYSeriesRenderer;FILorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;I)V

    move-object/from16 v25, p0

    move/from16 v28, v21

    move/from16 v29, v22

    move/from16 v30, v24

    .line 289
    invoke-virtual/range {v25 .. v30}, Lorg/achartengine/chart/XYChart;->clickableAreasForPoints(Ljava/util/List;Ljava/util/List;FII)[Lorg/achartengine/chart/ClickableArea;

    move-result-object v75

    .line 291
    .local v75, "clickableAreasForSubSeries":[Lorg/achartengine/chart/ClickableArea;
    invoke-static/range {v75 .. v75}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    move-object/from16 v0, v74

    invoke-virtual {v0, v4}, Ljava/util/LinkedList;->addAll(Ljava/util/Collection;)Z

    .line 292
    invoke-interface/range {v26 .. v26}, Ljava/util/List;->clear()V

    .line 293
    invoke-interface/range {v27 .. v27}, Ljava/util/List;->clear()V

    .line 294
    const/16 v24, -0x1

    .line 296
    .end local v75    # "clickableAreasForSubSeries":[Lorg/achartengine/chart/ClickableArea;
    :cond_4fa
    const/4 v4, 0x0

    move-object/from16 v0, v74

    invoke-virtual {v0, v4}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_41b

    .line 300
    .end local v110    # "value":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Double;Ljava/lang/Double;>;"
    .end local v112    # "xValue":D
    .end local v115    # "yValue":D
    :cond_502
    invoke-virtual {v14}, Lorg/achartengine/model/XYSeries;->getAnnotationCount()I

    move-result v76

    .line 301
    .local v76, "count":I
    if-lez v76, :cond_594

    .line 302
    invoke-virtual/range {v20 .. v20}, Lorg/achartengine/renderer/XYSeriesRenderer;->getAnnotationsColor()I

    move-result v4

    move-object/from16 v0, p6

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 303
    invoke-virtual/range {v20 .. v20}, Lorg/achartengine/renderer/XYSeriesRenderer;->getAnnotationsTextSize()F

    move-result v4

    move-object/from16 v0, p6

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 304
    invoke-virtual/range {v20 .. v20}, Lorg/achartengine/renderer/XYSeriesRenderer;->getAnnotationsTextAlign()Landroid/graphics/Paint$Align;

    move-result-object v4

    move-object/from16 v0, p6

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 305
    new-instance v73, Landroid/graphics/Rect;

    invoke-direct/range {v73 .. v73}, Landroid/graphics/Rect;-><init>()V

    .line 306
    .local v73, "bound":Landroid/graphics/Rect;
    const/16 v83, 0x0

    .local v83, "j":I
    :goto_52a
    move/from16 v0, v83

    move/from16 v1, v76

    if-ge v0, v1, :cond_594

    .line 307
    int-to-double v4, v8

    aget-wide v10, v111, v103

    move/from16 v0, v83

    invoke-virtual {v14, v0}, Lorg/achartengine/model/XYSeries;->getAnnotationX(I)D

    move-result-wide v15

    aget-wide v17, v94, v103

    sub-double v15, v15, v17

    mul-double/2addr v10, v15

    add-double/2addr v4, v10

    double-to-float v0, v4

    move/from16 v31, v0

    .line 309
    .local v31, "xS":F
    move/from16 v0, v37

    int-to-double v4, v0

    aget-wide v10, v52, v103

    move/from16 v0, v83

    invoke-virtual {v14, v0}, Lorg/achartengine/model/XYSeries;->getAnnotationY(I)D

    move-result-wide v15

    aget-wide v17, v53, v103

    sub-double v15, v15, v17

    mul-double/2addr v10, v15

    sub-double/2addr v4, v10

    double-to-float v0, v4

    move/from16 v32, v0

    .line 311
    .local v32, "yS":F
    move/from16 v0, v83

    invoke-virtual {v14, v0}, Lorg/achartengine/model/XYSeries;->getAnnotationAt(I)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    move/from16 v0, v83

    invoke-virtual {v14, v0}, Lorg/achartengine/model/XYSeries;->getAnnotationAt(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    move-object/from16 v0, p6

    move-object/from16 v1, v73

    invoke-virtual {v0, v4, v5, v6, v1}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 313
    invoke-virtual/range {v73 .. v73}, Landroid/graphics/Rect;->width()I

    move-result v4

    int-to-float v4, v4

    add-float v4, v4, v31

    cmpg-float v4, v31, v4

    if-gez v4, :cond_591

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v4

    int-to-float v4, v4

    cmpg-float v4, v32, v4

    if-gez v4, :cond_591

    .line 314
    move/from16 v0, v83

    invoke-virtual {v14, v0}, Lorg/achartengine/model/XYSeries;->getAnnotationAt(I)Ljava/lang/String;

    move-result-object v30

    move-object/from16 v28, p0

    move-object/from16 v29, p1

    move-object/from16 v33, p6

    invoke-virtual/range {v28 .. v33}, Lorg/achartengine/chart/XYChart;->drawString(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 306
    :cond_591
    add-int/lit8 v83, v83, 0x1

    goto :goto_52a

    .line 319
    .end local v31    # "xS":F
    .end local v32    # "yS":F
    .end local v73    # "bound":Landroid/graphics/Rect;
    .end local v83    # "j":I
    :cond_594
    invoke-interface/range {v26 .. v26}, Ljava/util/List;->size()I

    move-result v4

    if-lez v4, :cond_5bc

    move-object/from16 v15, p0

    move-object/from16 v16, v14

    move-object/from16 v17, p1

    move-object/from16 v18, p6

    move-object/from16 v19, v26

    .line 320
    invoke-virtual/range {v15 .. v24}, Lorg/achartengine/chart/XYChart;->drawSeries(Lorg/achartengine/model/XYSeries;Landroid/graphics/Canvas;Landroid/graphics/Paint;Ljava/util/List;Lorg/achartengine/renderer/XYSeriesRenderer;FILorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;I)V

    move-object/from16 v25, p0

    move/from16 v28, v21

    move/from16 v29, v22

    move/from16 v30, v24

    .line 321
    invoke-virtual/range {v25 .. v30}, Lorg/achartengine/chart/XYChart;->clickableAreasForPoints(Ljava/util/List;Ljava/util/List;FII)[Lorg/achartengine/chart/ClickableArea;

    move-result-object v75

    .line 323
    .restart local v75    # "clickableAreasForSubSeries":[Lorg/achartengine/chart/ClickableArea;
    invoke-static/range {v75 .. v75}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    move-object/from16 v0, v74

    invoke-virtual {v0, v4}, Ljava/util/LinkedList;->addAll(Ljava/util/Collection;)Z

    .line 325
    .end local v75    # "clickableAreasForSubSeries":[Lorg/achartengine/chart/ClickableArea;
    :cond_5bc
    monitor-exit v14
    :try_end_5bd
    .catchall {:try_start_49b .. :try_end_5bd} :catchall_498

    goto/16 :goto_3c6

    .line 328
    .end local v14    # "series":Lorg/achartengine/model/XYSeries;
    .end local v20    # "seriesRenderer":Lorg/achartengine/renderer/XYSeriesRenderer;
    .end local v21    # "yAxisValue":F
    .end local v24    # "startIndex":I
    .end local v26    # "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    .end local v27    # "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    .end local v74    # "clickableArea":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/achartengine/chart/ClickableArea;>;"
    .end local v76    # "count":I
    .end local v78    # "i$":Ljava/util/Iterator;
    .end local v99    # "range":Ljava/util/SortedMap;, "Ljava/util/SortedMap<Ljava/lang/Double;Ljava/lang/Double;>;"
    .end local v103    # "scale":I
    :cond_5bf
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    move-object/from16 v34, v0

    sub-int v39, p5, v37

    const/16 v41, 0x1

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getMarginsColor()I

    move-result v42

    move-object/from16 v33, p0

    move-object/from16 v35, p1

    move/from16 v36, p2

    move/from16 v38, p4

    move-object/from16 v40, p6

    invoke-virtual/range {v33 .. v42}, Lorg/achartengine/chart/XYChart;->drawBackground(Lorg/achartengine/renderer/DefaultRenderer;Landroid/graphics/Canvas;IIIILandroid/graphics/Paint;ZI)V

    .line 330
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    move-object/from16 v39, v0

    const/4 v4, 0x0

    aget v44, v86, v4

    const/16 v46, 0x1

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getMarginsColor()I

    move-result v47

    move-object/from16 v38, p0

    move-object/from16 v40, p1

    move/from16 v41, p2

    move/from16 v42, p3

    move/from16 v43, p4

    move-object/from16 v45, p6

    invoke-virtual/range {v38 .. v47}, Lorg/achartengine/chart/XYChart;->drawBackground(Lorg/achartengine/renderer/DefaultRenderer;Landroid/graphics/Canvas;IIIILandroid/graphics/Paint;ZI)V

    .line 332
    sget-object v4, Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;->HORIZONTAL:Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;

    move-object/from16 v0, v23

    if-ne v0, v4, :cond_7f1

    .line 333
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    move-object/from16 v39, v0

    sub-int v43, v8, p2

    sub-int v44, p5, p3

    const/16 v46, 0x1

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getMarginsColor()I

    move-result v47

    move-object/from16 v38, p0

    move-object/from16 v40, p1

    move/from16 v41, p2

    move/from16 v42, p3

    move-object/from16 v45, p6

    invoke-virtual/range {v38 .. v47}, Lorg/achartengine/chart/XYChart;->drawBackground(Lorg/achartengine/renderer/DefaultRenderer;Landroid/graphics/Canvas;IIIILandroid/graphics/Paint;ZI)V

    .line 335
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    move-object/from16 v39, v0

    const/4 v4, 0x3

    aget v43, v86, v4

    sub-int v44, p5, p3

    const/16 v46, 0x1

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getMarginsColor()I

    move-result v47

    move-object/from16 v38, p0

    move-object/from16 v40, p1

    move/from16 v41, v9

    move/from16 v42, p3

    move-object/from16 v45, p6

    invoke-virtual/range {v38 .. v47}, Lorg/achartengine/chart/XYChart;->drawBackground(Lorg/achartengine/renderer/DefaultRenderer;Landroid/graphics/Canvas;IIIILandroid/graphics/Paint;ZI)V

    .line 344
    :cond_649
    :goto_649
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isShowLabels()Z

    move-result v4

    if-eqz v4, :cond_83b

    if-eqz v77, :cond_83b

    const/16 v106, 0x1

    .line 345
    .local v106, "showLabels":Z
    :goto_657
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isShowGridX()Z

    move-result v105

    .line 346
    .local v105, "showGridX":Z
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isShowTickMarks()Z

    move-result v107

    .line 348
    .local v107, "showTickMarks":Z
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isShowCustomTextGridY()Z

    move-result v104

    .line 349
    .local v104, "showCustomTextGridY":Z
    if-nez v106, :cond_673

    if-eqz v105, :cond_9d6

    .line 350
    :cond_673
    const/4 v4, 0x0

    aget-wide v39, v94, v4

    const/4 v4, 0x0

    aget-wide v41, v88, v4

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getXLabels()I

    move-result v43

    move-object/from16 v38, p0

    invoke-virtual/range {v38 .. v43}, Lorg/achartengine/chart/XYChart;->getXLabels(DDI)Ljava/util/List;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lorg/achartengine/chart/XYChart;->getValidLabels(Ljava/util/List;)Ljava/util/List;

    move-result-object v39

    .line 351
    .local v39, "xLabels":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    move-object/from16 v0, p0

    move-object/from16 v1, v53

    move-object/from16 v2, v89

    move/from16 v3, v87

    invoke-virtual {v0, v1, v2, v3}, Lorg/achartengine/chart/XYChart;->getYLabels([D[DI)Ljava/util/Map;

    move-result-object v69

    .line 353
    .local v69, "allYLabels":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Ljava/lang/Double;>;>;"
    move/from16 v43, v8

    .line 354
    .local v43, "xLabelsLeft":I
    if-eqz v106, :cond_6c4

    .line 355
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getXLabelsColor()I

    move-result v4

    move-object/from16 v0, p6

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 356
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getLabelsTextSize()F

    move-result v4

    move-object/from16 v0, p6

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 357
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getXLabelsAlign()Landroid/graphics/Paint$Align;

    move-result-object v4

    move-object/from16 v0, p6

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 362
    :cond_6c4
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getXTextLabelLocations()[Ljava/lang/Double;

    move-result-object v40

    const/4 v4, 0x0

    aget-wide v46, v111, v4

    const/4 v4, 0x0

    aget-wide v48, v94, v4

    const/4 v4, 0x0

    aget-wide v50, v88, v4

    move-object/from16 v38, p0

    move-object/from16 v41, p1

    move-object/from16 v42, p6

    move/from16 v44, v109

    move/from16 v45, v37

    invoke-virtual/range {v38 .. v51}, Lorg/achartengine/chart/XYChart;->drawXLabels(Ljava/util/List;[Ljava/lang/Double;Landroid/graphics/Canvas;Landroid/graphics/Paint;IIIDDD)V

    move-object/from16 v44, p0

    move-object/from16 v45, v69

    move-object/from16 v46, p1

    move-object/from16 v47, p6

    move/from16 v48, v87

    move/from16 v49, v8

    move/from16 v50, v9

    move/from16 v51, v37

    .line 364
    invoke-virtual/range {v44 .. v53}, Lorg/achartengine/chart/XYChart;->drawYLabels(Ljava/util/Map;Landroid/graphics/Canvas;Landroid/graphics/Paint;IIII[D[D)V

    .line 367
    if-eqz v106, :cond_8e2

    .line 368
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getLabelsColor()I

    move-result v4

    move-object/from16 v0, p6

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 369
    const/16 v22, 0x0

    :goto_706
    move/from16 v0, v22

    move/from16 v1, v87

    if-ge v0, v1, :cond_8e2

    .line 370
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    move/from16 v0, v22

    invoke-virtual {v4, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYAxisAlign(I)Landroid/graphics/Paint$Align;

    move-result-object v72

    .line 371
    .local v72, "axisAlign":Landroid/graphics/Paint$Align;
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    move/from16 v0, v22

    invoke-virtual {v4, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYTextLabelLocations(I)[Ljava/lang/Double;

    move-result-object v114

    .line 372
    .local v114, "yTextLabelLocations":[Ljava/lang/Double;
    move-object/from16 v71, v114

    .local v71, "arr$":[Ljava/lang/Double;
    move-object/from16 v0, v71

    array-length v0, v0

    move/from16 v84, v0

    .local v84, "len$":I
    const/16 v78, 0x0

    .local v78, "i$":I
    :goto_729
    move/from16 v0, v78

    move/from16 v1, v84

    if-ge v0, v1, :cond_8de

    aget-object v85, v71, v78

    .line 373
    .local v85, "location":Ljava/lang/Double;
    aget-wide v4, v53, v22

    invoke-virtual/range {v85 .. v85}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v10

    cmpg-double v4, v4, v10

    if-gtz v4, :cond_7ed

    invoke-virtual/range {v85 .. v85}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v4

    aget-wide v10, v89, v22

    cmpg-double v4, v4, v10

    if-gtz v4, :cond_7ed

    .line 374
    move/from16 v0, v37

    int-to-double v4, v0

    aget-wide v10, v52, v22

    invoke-virtual/range {v85 .. v85}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v15

    aget-wide v17, v53, v22

    sub-double v15, v15, v17

    mul-double/2addr v10, v15

    sub-double/2addr v4, v10

    double-to-float v0, v4

    move/from16 v46, v0

    .line 376
    .local v46, "yLabel":F
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    move-object/from16 v0, v85

    move/from16 v1, v22

    invoke-virtual {v4, v0, v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYTextLabel(Ljava/lang/Double;I)Ljava/lang/String;

    move-result-object v56

    .line 377
    .local v56, "label":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    move/from16 v0, v22

    invoke-virtual {v4, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYLabelsColor(I)I

    move-result v4

    move-object/from16 v0, p6

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 378
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    move/from16 v0, v22

    invoke-virtual {v4, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYLabelsAlign(I)Landroid/graphics/Paint$Align;

    move-result-object v4

    move-object/from16 v0, p6

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 379
    sget-object v4, Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;->HORIZONTAL:Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;

    move-object/from16 v0, v23

    if-ne v0, v4, :cond_881

    .line 380
    sget-object v4, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    move-object/from16 v0, v72

    if-ne v0, v4, :cond_83f

    .line 381
    if-eqz v107, :cond_7a7

    .line 382
    move-object/from16 v0, p0

    move-object/from16 v1, v72

    invoke-direct {v0, v1}, Lorg/achartengine/chart/XYChart;->getLabelLinePos(Landroid/graphics/Paint$Align;)I

    move-result v4

    add-int/2addr v4, v8

    int-to-float v0, v4

    move/from16 v45, v0

    int-to-float v0, v8

    move/from16 v47, v0

    move-object/from16 v44, p1

    move/from16 v48, v46

    move-object/from16 v49, p6

    invoke-virtual/range {v44 .. v49}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 384
    :cond_7a7
    int-to-float v4, v8

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v5}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYLabelsPadding()F

    move-result v5

    sub-float v57, v4, v5

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYLabelsVerticalPadding()F

    move-result v4

    sub-float v58, v46, v4

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYLabelsAngle()F

    move-result v60

    move-object/from16 v54, p0

    move-object/from16 v55, p1

    move-object/from16 v59, p6

    invoke-virtual/range {v54 .. v60}, Lorg/achartengine/chart/XYChart;->drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;F)V

    .line 397
    :goto_7cd
    if-eqz v104, :cond_7ed

    .line 398
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    move/from16 v0, v22

    invoke-virtual {v4, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getGridColor(I)I

    move-result v4

    move-object/from16 v0, p6

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 399
    int-to-float v0, v8

    move/from16 v45, v0

    int-to-float v0, v9

    move/from16 v47, v0

    move-object/from16 v44, p1

    move/from16 v48, v46

    move-object/from16 v49, p6

    invoke-virtual/range {v44 .. v49}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 372
    .end local v46    # "yLabel":F
    .end local v56    # "label":Ljava/lang/String;
    :cond_7ed
    :goto_7ed
    add-int/lit8 v78, v78, 0x1

    goto/16 :goto_729

    .line 337
    .end local v39    # "xLabels":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    .end local v43    # "xLabelsLeft":I
    .end local v69    # "allYLabels":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Ljava/lang/Double;>;>;"
    .end local v71    # "arr$":[Ljava/lang/Double;
    .end local v72    # "axisAlign":Landroid/graphics/Paint$Align;
    .end local v78    # "i$":I
    .end local v84    # "len$":I
    .end local v85    # "location":Ljava/lang/Double;
    .end local v104    # "showCustomTextGridY":Z
    .end local v105    # "showGridX":Z
    .end local v106    # "showLabels":Z
    .end local v107    # "showTickMarks":Z
    .end local v114    # "yTextLabelLocations":[Ljava/lang/Double;
    :cond_7f1
    sget-object v4, Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;->VERTICAL:Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;

    move-object/from16 v0, v23

    if-ne v0, v4, :cond_649

    .line 338
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    move-object/from16 v39, v0

    sub-int v43, p4, v9

    sub-int v44, p5, p3

    const/16 v46, 0x1

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getMarginsColor()I

    move-result v47

    move-object/from16 v38, p0

    move-object/from16 v40, p1

    move/from16 v41, v9

    move/from16 v42, p3

    move-object/from16 v45, p6

    invoke-virtual/range {v38 .. v47}, Lorg/achartengine/chart/XYChart;->drawBackground(Lorg/achartengine/renderer/DefaultRenderer;Landroid/graphics/Canvas;IIIILandroid/graphics/Paint;ZI)V

    .line 340
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    move-object/from16 v39, v0

    sub-int v43, v8, p2

    sub-int v44, p5, p3

    const/16 v46, 0x1

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getMarginsColor()I

    move-result v47

    move-object/from16 v38, p0

    move-object/from16 v40, p1

    move/from16 v41, p2

    move/from16 v42, p3

    move-object/from16 v45, p6

    invoke-virtual/range {v38 .. v47}, Lorg/achartengine/chart/XYChart;->drawBackground(Lorg/achartengine/renderer/DefaultRenderer;Landroid/graphics/Canvas;IIIILandroid/graphics/Paint;ZI)V

    goto/16 :goto_649

    .line 344
    :cond_83b
    const/16 v106, 0x0

    goto/16 :goto_657

    .line 388
    .restart local v39    # "xLabels":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    .restart local v43    # "xLabelsLeft":I
    .restart local v46    # "yLabel":F
    .restart local v56    # "label":Ljava/lang/String;
    .restart local v69    # "allYLabels":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Ljava/lang/Double;>;>;"
    .restart local v71    # "arr$":[Ljava/lang/Double;
    .restart local v72    # "axisAlign":Landroid/graphics/Paint$Align;
    .restart local v78    # "i$":I
    .restart local v84    # "len$":I
    .restart local v85    # "location":Ljava/lang/Double;
    .restart local v104    # "showCustomTextGridY":Z
    .restart local v105    # "showGridX":Z
    .restart local v106    # "showLabels":Z
    .restart local v107    # "showTickMarks":Z
    .restart local v114    # "yTextLabelLocations":[Ljava/lang/Double;
    :cond_83f
    if-eqz v107, :cond_859

    .line 389
    int-to-float v0, v9

    move/from16 v45, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v72

    invoke-direct {v0, v1}, Lorg/achartengine/chart/XYChart;->getLabelLinePos(Landroid/graphics/Paint$Align;)I

    move-result v4

    add-int/2addr v4, v9

    int-to-float v0, v4

    move/from16 v47, v0

    move-object/from16 v44, p1

    move/from16 v48, v46

    move-object/from16 v49, p6

    invoke-virtual/range {v44 .. v49}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 392
    :cond_859
    int-to-float v4, v9

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v5}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYLabelsPadding()F

    move-result v5

    sub-float v57, v4, v5

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYLabelsVerticalPadding()F

    move-result v4

    sub-float v58, v46, v4

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYLabelsAngle()F

    move-result v60

    move-object/from16 v54, p0

    move-object/from16 v55, p1

    move-object/from16 v59, p6

    invoke-virtual/range {v54 .. v60}, Lorg/achartengine/chart/XYChart;->drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;F)V

    goto/16 :goto_7cd

    .line 402
    :cond_881
    if-eqz v107, :cond_89c

    .line 403
    move-object/from16 v0, p0

    move-object/from16 v1, v72

    invoke-direct {v0, v1}, Lorg/achartengine/chart/XYChart;->getLabelLinePos(Landroid/graphics/Paint$Align;)I

    move-result v4

    sub-int v4, v9, v4

    int-to-float v0, v4

    move/from16 v45, v0

    int-to-float v0, v9

    move/from16 v47, v0

    move-object/from16 v44, p1

    move/from16 v48, v46

    move-object/from16 v49, p6

    invoke-virtual/range {v44 .. v49}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 405
    :cond_89c
    add-int/lit8 v4, v9, 0xa

    int-to-float v0, v4

    move/from16 v57, v0

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYLabelsVerticalPadding()F

    move-result v4

    sub-float v58, v46, v4

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYLabelsAngle()F

    move-result v60

    move-object/from16 v54, p0

    move-object/from16 v55, p1

    move-object/from16 v59, p6

    invoke-virtual/range {v54 .. v60}, Lorg/achartengine/chart/XYChart;->drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;F)V

    .line 407
    if-eqz v104, :cond_7ed

    .line 408
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    move/from16 v0, v22

    invoke-virtual {v4, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getGridColor(I)I

    move-result v4

    move-object/from16 v0, p6

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 409
    int-to-float v0, v9

    move/from16 v45, v0

    int-to-float v0, v8

    move/from16 v47, v0

    move-object/from16 v44, p1

    move/from16 v48, v46

    move-object/from16 v49, p6

    invoke-virtual/range {v44 .. v49}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_7ed

    .line 369
    .end local v46    # "yLabel":F
    .end local v56    # "label":Ljava/lang/String;
    .end local v85    # "location":Ljava/lang/Double;
    :cond_8de
    add-int/lit8 v22, v22, 0x1

    goto/16 :goto_706

    .line 417
    .end local v71    # "arr$":[Ljava/lang/Double;
    .end local v72    # "axisAlign":Landroid/graphics/Paint$Align;
    .end local v78    # "i$":I
    .end local v84    # "len$":I
    .end local v114    # "yTextLabelLocations":[Ljava/lang/Double;
    :cond_8e2
    if-eqz v106, :cond_9d6

    .line 418
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getLabelsColor()I

    move-result v4

    move-object/from16 v0, p6

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 419
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getAxisTitleTextSize()F

    move-result v108

    .line 420
    .local v108, "size":F
    move-object/from16 v0, p6

    move/from16 v1, v108

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 421
    sget-object v4, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    move-object/from16 v0, p6

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 422
    sget-object v4, Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;->HORIZONTAL:Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;

    move-object/from16 v0, v23

    if-ne v0, v4, :cond_a5e

    .line 423
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getXTitle()Ljava/lang/String;

    move-result-object v59

    div-int/lit8 v4, p4, 0x2

    add-int v4, v4, p2

    int-to-float v0, v4

    move/from16 v60, v0

    move/from16 v0, v37

    int-to-float v4, v0

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v5}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getLabelsTextSize()F

    move-result v5

    const/high16 v6, 0x40800000    # 4.0f

    mul-float/2addr v5, v6

    const/high16 v6, 0x40400000    # 3.0f

    div-float/2addr v5, v6

    add-float/2addr v4, v5

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v5}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getXLabelsPadding()F

    move-result v5

    add-float/2addr v4, v5

    add-float v61, v4, v108

    const/16 v63, 0x0

    move-object/from16 v57, p0

    move-object/from16 v58, p1

    move-object/from16 v62, p6

    invoke-virtual/range {v57 .. v63}, Lorg/achartengine/chart/XYChart;->drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;F)V

    .line 429
    const/16 v22, 0x0

    :goto_946
    move/from16 v0, v22

    move/from16 v1, v87

    if-ge v0, v1, :cond_9a2

    .line 430
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    move/from16 v0, v22

    invoke-virtual {v4, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYAxisAlign(I)Landroid/graphics/Paint$Align;

    move-result-object v72

    .line 431
    .restart local v72    # "axisAlign":Landroid/graphics/Paint$Align;
    sget-object v4, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    move-object/from16 v0, v72

    if-ne v0, v4, :cond_980

    .line 432
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    move/from16 v0, v22

    invoke-virtual {v4, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYTitle(I)Ljava/lang/String;

    move-result-object v59

    move/from16 v0, p2

    int-to-float v4, v0

    add-float v60, v4, v108

    div-int/lit8 v4, p5, 0x2

    add-int v4, v4, p3

    int-to-float v0, v4

    move/from16 v61, v0

    const/high16 v63, -0x3d4c0000    # -90.0f

    move-object/from16 v57, p0

    move-object/from16 v58, p1

    move-object/from16 v62, p6

    invoke-virtual/range {v57 .. v63}, Lorg/achartengine/chart/XYChart;->drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;F)V

    .line 429
    :goto_97d
    add-int/lit8 v22, v22, 0x1

    goto :goto_946

    .line 434
    :cond_980
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    move/from16 v0, v22

    invoke-virtual {v4, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYTitle(I)Ljava/lang/String;

    move-result-object v59

    add-int v4, p2, p4

    int-to-float v0, v4

    move/from16 v60, v0

    div-int/lit8 v4, p5, 0x2

    add-int v4, v4, p3

    int-to-float v0, v4

    move/from16 v61, v0

    const/high16 v63, -0x3d4c0000    # -90.0f

    move-object/from16 v57, p0

    move-object/from16 v58, p1

    move-object/from16 v62, p6

    invoke-virtual/range {v57 .. v63}, Lorg/achartengine/chart/XYChart;->drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;F)V

    goto :goto_97d

    .line 437
    .end local v72    # "axisAlign":Landroid/graphics/Paint$Align;
    :cond_9a2
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getChartTitleTextSize()F

    move-result v4

    move-object/from16 v0, p6

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 438
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getChartTitle()Ljava/lang/String;

    move-result-object v59

    div-int/lit8 v4, p4, 0x2

    add-int v4, v4, p2

    int-to-float v0, v4

    move/from16 v60, v0

    move/from16 v0, p3

    int-to-float v4, v0

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v5}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getChartTitleTextSize()F

    move-result v5

    add-float v61, v4, v5

    const/16 v63, 0x0

    move-object/from16 v57, p0

    move-object/from16 v58, p1

    move-object/from16 v62, p6

    invoke-virtual/range {v57 .. v63}, Lorg/achartengine/chart/XYChart;->drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;F)V

    .line 449
    .end local v39    # "xLabels":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    .end local v43    # "xLabelsLeft":I
    .end local v69    # "allYLabels":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Ljava/lang/Double;>;>;"
    .end local v108    # "size":F
    :cond_9d6
    :goto_9d6
    sget-object v4, Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;->HORIZONTAL:Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;

    move-object/from16 v0, v23

    if-ne v0, v4, :cond_ada

    .line 450
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    move-object/from16 v59, v0

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getXLabelsPadding()F

    move-result v4

    float-to-int v4, v4

    add-int v63, p3, v4

    const/16 v68, 0x0

    move-object/from16 v57, p0

    move-object/from16 v58, p1

    move-object/from16 v60, v7

    move/from16 v61, v8

    move/from16 v62, v9

    move/from16 v64, p4

    move/from16 v65, p5

    move/from16 v66, v13

    move-object/from16 v67, p6

    invoke-virtual/range {v57 .. v68}, Lorg/achartengine/chart/XYChart;->drawLegend(Landroid/graphics/Canvas;Lorg/achartengine/renderer/DefaultRenderer;[Ljava/lang/String;IIIIIILandroid/graphics/Paint;Z)I

    .line 458
    :cond_a04
    :goto_a04
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isShowAxes()Z

    move-result v4

    if-eqz v4, :cond_b5a

    .line 459
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getXAxisColor()I

    move-result v4

    move-object/from16 v0, p6

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 460
    int-to-float v0, v8

    move/from16 v58, v0

    move/from16 v0, v37

    int-to-float v0, v0

    move/from16 v59, v0

    int-to-float v0, v9

    move/from16 v60, v0

    move/from16 v0, v37

    int-to-float v0, v0

    move/from16 v61, v0

    move-object/from16 v57, p1

    move-object/from16 v62, p6

    invoke-virtual/range {v57 .. v62}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 461
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYAxisColor()I

    move-result v4

    move-object/from16 v0, p6

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 462
    const/16 v100, 0x0

    .line 463
    .local v100, "rightAxis":Z
    const/16 v22, 0x0

    :goto_a43
    move/from16 v0, v22

    move/from16 v1, v87

    if-ge v0, v1, :cond_b24

    if-nez v100, :cond_b24

    .line 464
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    move/from16 v0, v22

    invoke-virtual {v4, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYAxisAlign(I)Landroid/graphics/Paint$Align;

    move-result-object v4

    sget-object v5, Landroid/graphics/Paint$Align;->RIGHT:Landroid/graphics/Paint$Align;

    if-ne v4, v5, :cond_b20

    const/16 v100, 0x1

    .line 463
    :goto_a5b
    add-int/lit8 v22, v22, 0x1

    goto :goto_a43

    .line 440
    .end local v100    # "rightAxis":Z
    .restart local v39    # "xLabels":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    .restart local v43    # "xLabelsLeft":I
    .restart local v69    # "allYLabels":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Ljava/lang/Double;>;>;"
    .restart local v108    # "size":F
    :cond_a5e
    sget-object v4, Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;->VERTICAL:Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;

    move-object/from16 v0, v23

    if-ne v0, v4, :cond_9d6

    .line 441
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getXTitle()Ljava/lang/String;

    move-result-object v59

    div-int/lit8 v4, p4, 0x2

    add-int v4, v4, p2

    int-to-float v0, v4

    move/from16 v60, v0

    add-int v4, p3, p5

    int-to-float v4, v4

    sub-float v4, v4, v108

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v5}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getXLabelsPadding()F

    move-result v5

    add-float v61, v4, v5

    const/high16 v63, -0x3d4c0000    # -90.0f

    move-object/from16 v57, p0

    move-object/from16 v58, p1

    move-object/from16 v62, p6

    invoke-virtual/range {v57 .. v63}, Lorg/achartengine/chart/XYChart;->drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;F)V

    .line 443
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYTitle()Ljava/lang/String;

    move-result-object v59

    add-int/lit8 v4, v9, 0x14

    int-to-float v0, v4

    move/from16 v60, v0

    div-int/lit8 v4, p5, 0x2

    add-int v4, v4, p3

    int-to-float v0, v4

    move/from16 v61, v0

    const/16 v63, 0x0

    move-object/from16 v57, p0

    move-object/from16 v58, p1

    move-object/from16 v62, p6

    invoke-virtual/range {v57 .. v63}, Lorg/achartengine/chart/XYChart;->drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;F)V

    .line 444
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getChartTitleTextSize()F

    move-result v4

    move-object/from16 v0, p6

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 445
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getChartTitle()Ljava/lang/String;

    move-result-object v59

    move/from16 v0, p2

    int-to-float v4, v0

    add-float v60, v4, v108

    div-int/lit8 v4, p5, 0x2

    add-int v4, v4, v109

    int-to-float v0, v4

    move/from16 v61, v0

    const/16 v63, 0x0

    move-object/from16 v57, p0

    move-object/from16 v58, p1

    move-object/from16 v62, p6

    invoke-virtual/range {v57 .. v63}, Lorg/achartengine/chart/XYChart;->drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;F)V

    goto/16 :goto_9d6

    .line 452
    .end local v39    # "xLabels":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    .end local v43    # "xLabelsLeft":I
    .end local v69    # "allYLabels":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Ljava/lang/Double;>;>;"
    .end local v108    # "size":F
    :cond_ada
    sget-object v4, Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;->VERTICAL:Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;

    move-object/from16 v0, v23

    if-ne v0, v4, :cond_a04

    .line 453
    move/from16 v0, v70

    int-to-float v4, v0

    const/4 v5, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v4, v5}, Lorg/achartengine/chart/XYChart;->transform(Landroid/graphics/Canvas;FZ)V

    .line 454
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    move-object/from16 v59, v0

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getXLabelsPadding()F

    move-result v4

    float-to-int v4, v4

    add-int v63, p3, v4

    const/16 v68, 0x0

    move-object/from16 v57, p0

    move-object/from16 v58, p1

    move-object/from16 v60, v7

    move/from16 v61, v8

    move/from16 v62, v9

    move/from16 v64, p4

    move/from16 v65, p5

    move/from16 v66, v13

    move-object/from16 v67, p6

    invoke-virtual/range {v57 .. v68}, Lorg/achartengine/chart/XYChart;->drawLegend(Landroid/graphics/Canvas;Lorg/achartengine/renderer/DefaultRenderer;[Ljava/lang/String;IIIIIILandroid/graphics/Paint;Z)I

    .line 456
    move/from16 v0, v70

    int-to-float v4, v0

    const/4 v5, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v4, v5}, Lorg/achartengine/chart/XYChart;->transform(Landroid/graphics/Canvas;FZ)V

    goto/16 :goto_a04

    .line 464
    .restart local v100    # "rightAxis":Z
    :cond_b20
    const/16 v100, 0x0

    goto/16 :goto_a5b

    .line 466
    :cond_b24
    sget-object v4, Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;->HORIZONTAL:Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;

    move-object/from16 v0, v23

    if-ne v0, v4, :cond_b69

    .line 467
    int-to-float v0, v8

    move/from16 v58, v0

    move/from16 v0, v109

    int-to-float v0, v0

    move/from16 v59, v0

    int-to-float v0, v8

    move/from16 v60, v0

    move/from16 v0, v37

    int-to-float v0, v0

    move/from16 v61, v0

    move-object/from16 v57, p1

    move-object/from16 v62, p6

    invoke-virtual/range {v57 .. v62}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 468
    if-eqz v100, :cond_b5a

    .line 469
    int-to-float v0, v9

    move/from16 v58, v0

    move/from16 v0, v109

    int-to-float v0, v0

    move/from16 v59, v0

    int-to-float v0, v9

    move/from16 v60, v0

    move/from16 v0, v37

    int-to-float v0, v0

    move/from16 v61, v0

    move-object/from16 v57, p1

    move-object/from16 v62, p6

    invoke-virtual/range {v57 .. v62}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 475
    .end local v100    # "rightAxis":Z
    :cond_b5a
    :goto_b5a
    if-eqz v101, :cond_1d7

    .line 476
    move/from16 v0, v70

    int-to-float v4, v0

    const/4 v5, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v4, v5}, Lorg/achartengine/chart/XYChart;->transform(Landroid/graphics/Canvas;FZ)V

    goto/16 :goto_1d7

    .line 471
    .restart local v100    # "rightAxis":Z
    :cond_b69
    sget-object v4, Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;->VERTICAL:Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;

    move-object/from16 v0, v23

    if-ne v0, v4, :cond_b5a

    .line 472
    int-to-float v0, v9

    move/from16 v58, v0

    move/from16 v0, v109

    int-to-float v0, v0

    move/from16 v59, v0

    int-to-float v0, v9

    move/from16 v60, v0

    move/from16 v0, v37

    int-to-float v0, v0

    move/from16 v61, v0

    move-object/from16 v57, p1

    move-object/from16 v62, p6

    invoke-virtual/range {v57 .. v62}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto :goto_b5a
.end method

.method protected drawChartValuesText(Landroid/graphics/Canvas;Lorg/achartengine/model/XYSeries;Lorg/achartengine/renderer/XYSeriesRenderer;Landroid/graphics/Paint;Ljava/util/List;II)V
    .registers 19
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "series"    # Lorg/achartengine/model/XYSeries;
    .param p3, "renderer"    # Lorg/achartengine/renderer/XYSeriesRenderer;
    .param p4, "paint"    # Landroid/graphics/Paint;
    .param p6, "seriesIndex"    # I
    .param p7, "startIndex"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Canvas;",
            "Lorg/achartengine/model/XYSeries;",
            "Lorg/achartengine/renderer/XYSeriesRenderer;",
            "Landroid/graphics/Paint;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Float;",
            ">;II)V"
        }
    .end annotation

    .prologue
    .line 604
    .local p5, "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    invoke-interface/range {p5 .. p5}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x2

    if-le v1, v2, :cond_191

    .line 606
    const/4 v1, 0x0

    move-object/from16 v0, p5

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v9

    .line 607
    .local v9, "previousPointX":F
    const/4 v1, 0x1

    move-object/from16 v0, p5

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v10

    .line 608
    .local v10, "previousPointY":F
    const/4 v8, 0x0

    .local v8, "k":I
    :goto_22
    invoke-interface/range {p5 .. p5}, Ljava/util/List;->size()I

    move-result v1

    if-ge v8, v1, :cond_1d2

    .line 609
    const/4 v1, 0x2

    if-ne v8, v1, :cond_105

    .line 611
    const/4 v1, 0x2

    move-object/from16 v0, p5

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v2

    const/4 v1, 0x0

    move-object/from16 v0, p5

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    sub-float v1, v2, v1

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    invoke-virtual {p3}, Lorg/achartengine/renderer/XYSeriesRenderer;->getDisplayChartValuesDistance()I

    move-result v2

    int-to-float v2, v2

    cmpl-float v1, v1, v2

    if-gtz v1, :cond_7d

    const/4 v1, 0x3

    move-object/from16 v0, p5

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v2

    const/4 v1, 0x1

    move-object/from16 v0, p5

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    sub-float v1, v2, v1

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    invoke-virtual {p3}, Lorg/achartengine/renderer/XYSeriesRenderer;->getDisplayChartValuesDistance()I

    move-result v2

    int-to-float v2, v2

    cmpl-float v1, v1, v2

    if-lez v1, :cond_101

    .line 614
    :cond_7d
    invoke-virtual {p3}, Lorg/achartengine/renderer/XYSeriesRenderer;->getChartValuesFormat()Ljava/text/NumberFormat;

    move-result-object v1

    move/from16 v0, p7

    invoke-virtual {p2, v0}, Lorg/achartengine/model/XYSeries;->getY(I)D

    move-result-wide v2

    invoke-virtual {p0, v1, v2, v3}, Lorg/achartengine/chart/XYChart;->getLabel(Ljava/text/NumberFormat;D)Ljava/lang/String;

    move-result-object v3

    const/4 v1, 0x0

    move-object/from16 v0, p5

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v4

    const/4 v1, 0x1

    move-object/from16 v0, p5

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-virtual {p3}, Lorg/achartengine/renderer/XYSeriesRenderer;->getChartValuesSpacing()F

    move-result v2

    sub-float v5, v1, v2

    const/4 v7, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v6, p4

    invoke-virtual/range {v1 .. v7}, Lorg/achartengine/chart/XYChart;->drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;F)V

    .line 617
    invoke-virtual {p3}, Lorg/achartengine/renderer/XYSeriesRenderer;->getChartValuesFormat()Ljava/text/NumberFormat;

    move-result-object v1

    add-int/lit8 v2, p7, 0x1

    invoke-virtual {p2, v2}, Lorg/achartengine/model/XYSeries;->getY(I)D

    move-result-wide v2

    invoke-virtual {p0, v1, v2, v3}, Lorg/achartengine/chart/XYChart;->getLabel(Ljava/text/NumberFormat;D)Ljava/lang/String;

    move-result-object v3

    const/4 v1, 0x2

    move-object/from16 v0, p5

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v4

    const/4 v1, 0x3

    move-object/from16 v0, p5

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-virtual {p3}, Lorg/achartengine/renderer/XYSeriesRenderer;->getChartValuesSpacing()F

    move-result v2

    sub-float v5, v1, v2

    const/4 v7, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v6, p4

    invoke-virtual/range {v1 .. v7}, Lorg/achartengine/chart/XYChart;->drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;F)V

    .line 621
    const/4 v1, 0x2

    move-object/from16 v0, p5

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v9

    .line 622
    const/4 v1, 0x3

    move-object/from16 v0, p5

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v10

    .line 608
    :cond_101
    :goto_101
    add-int/lit8 v8, v8, 0x2

    goto/16 :goto_22

    .line 624
    :cond_105
    const/4 v1, 0x2

    if-le v8, v1, :cond_101

    .line 627
    move-object/from16 v0, p5

    invoke-interface {v0, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    sub-float/2addr v1, v9

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    invoke-virtual {p3}, Lorg/achartengine/renderer/XYSeriesRenderer;->getDisplayChartValuesDistance()I

    move-result v2

    int-to-float v2, v2

    cmpl-float v1, v1, v2

    if-gtz v1, :cond_13e

    add-int/lit8 v1, v8, 0x1

    move-object/from16 v0, p5

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    sub-float/2addr v1, v10

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    invoke-virtual {p3}, Lorg/achartengine/renderer/XYSeriesRenderer;->getDisplayChartValuesDistance()I

    move-result v2

    int-to-float v2, v2

    cmpl-float v1, v1, v2

    if-lez v1, :cond_101

    .line 630
    :cond_13e
    invoke-virtual {p3}, Lorg/achartengine/renderer/XYSeriesRenderer;->getChartValuesFormat()Ljava/text/NumberFormat;

    move-result-object v1

    div-int/lit8 v2, v8, 0x2

    add-int v2, v2, p7

    invoke-virtual {p2, v2}, Lorg/achartengine/model/XYSeries;->getY(I)D

    move-result-wide v2

    invoke-virtual {p0, v1, v2, v3}, Lorg/achartengine/chart/XYChart;->getLabel(Ljava/text/NumberFormat;D)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p5

    invoke-interface {v0, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v4

    add-int/lit8 v1, v8, 0x1

    move-object/from16 v0, p5

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-virtual {p3}, Lorg/achartengine/renderer/XYSeriesRenderer;->getChartValuesSpacing()F

    move-result v2

    sub-float v5, v1, v2

    const/4 v7, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v6, p4

    invoke-virtual/range {v1 .. v7}, Lorg/achartengine/chart/XYChart;->drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;F)V

    .line 633
    move-object/from16 v0, p5

    invoke-interface {v0, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v9

    .line 634
    add-int/lit8 v1, v8, 0x1

    move-object/from16 v0, p5

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v10

    goto/16 :goto_101

    .line 639
    .end local v8    # "k":I
    .end local v9    # "previousPointX":F
    .end local v10    # "previousPointY":F
    :cond_191
    const/4 v8, 0x0

    .restart local v8    # "k":I
    :goto_192
    invoke-interface/range {p5 .. p5}, Ljava/util/List;->size()I

    move-result v1

    if-ge v8, v1, :cond_1d2

    .line 640
    invoke-virtual {p3}, Lorg/achartengine/renderer/XYSeriesRenderer;->getChartValuesFormat()Ljava/text/NumberFormat;

    move-result-object v1

    div-int/lit8 v2, v8, 0x2

    add-int v2, v2, p7

    invoke-virtual {p2, v2}, Lorg/achartengine/model/XYSeries;->getY(I)D

    move-result-wide v2

    invoke-virtual {p0, v1, v2, v3}, Lorg/achartengine/chart/XYChart;->getLabel(Ljava/text/NumberFormat;D)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p5

    invoke-interface {v0, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v4

    add-int/lit8 v1, v8, 0x1

    move-object/from16 v0, p5

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-virtual {p3}, Lorg/achartengine/renderer/XYSeriesRenderer;->getChartValuesSpacing()F

    move-result v2

    sub-float v5, v1, v2

    const/4 v7, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v6, p4

    invoke-virtual/range {v1 .. v7}, Lorg/achartengine/chart/XYChart;->drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;F)V

    .line 639
    add-int/lit8 v8, v8, 0x2

    goto :goto_192

    .line 645
    :cond_1d2
    return-void
.end method

.method protected drawPoints(Landroid/graphics/Canvas;Landroid/graphics/Paint;Ljava/util/List;Lorg/achartengine/renderer/XYSeriesRenderer;FII)V
    .registers 16
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "paint"    # Landroid/graphics/Paint;
    .param p4, "seriesRenderer"    # Lorg/achartengine/renderer/XYSeriesRenderer;
    .param p5, "yAxisValue"    # F
    .param p6, "seriesIndex"    # I
    .param p7, "startIndex"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Canvas;",
            "Landroid/graphics/Paint;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Float;",
            ">;",
            "Lorg/achartengine/renderer/XYSeriesRenderer;",
            "FII)V"
        }
    .end annotation

    .prologue
    .line 573
    .local p3, "pointsList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    invoke-virtual {p0, p4}, Lorg/achartengine/chart/XYChart;->isRenderPoints(Lorg/achartengine/renderer/SimpleSeriesRenderer;)Z

    move-result v1

    if-eqz v1, :cond_16

    .line 574
    invoke-virtual {p0}, Lorg/achartengine/chart/XYChart;->getPointsChart()Lorg/achartengine/chart/ScatterChart;

    move-result-object v0

    .line 575
    .local v0, "pointsChart":Lorg/achartengine/chart/ScatterChart;
    if-eqz v0, :cond_16

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move v5, p5

    move v6, p6

    move v7, p7

    .line 576
    invoke-virtual/range {v0 .. v7}, Lorg/achartengine/chart/ScatterChart;->drawSeries(Landroid/graphics/Canvas;Landroid/graphics/Paint;Ljava/util/List;Lorg/achartengine/renderer/XYSeriesRenderer;FII)V

    .line 580
    .end local v0    # "pointsChart":Lorg/achartengine/chart/ScatterChart;
    :cond_16
    return-void
.end method

.method public abstract drawSeries(Landroid/graphics/Canvas;Landroid/graphics/Paint;Ljava/util/List;Lorg/achartengine/renderer/XYSeriesRenderer;FII)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Canvas;",
            "Landroid/graphics/Paint;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Float;",
            ">;",
            "Lorg/achartengine/renderer/XYSeriesRenderer;",
            "FII)V"
        }
    .end annotation
.end method

.method protected drawSeries(Lorg/achartengine/model/XYSeries;Landroid/graphics/Canvas;Landroid/graphics/Paint;Ljava/util/List;Lorg/achartengine/renderer/XYSeriesRenderer;FILorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;I)V
    .registers 31
    .param p1, "series"    # Lorg/achartengine/model/XYSeries;
    .param p2, "canvas"    # Landroid/graphics/Canvas;
    .param p3, "paint"    # Landroid/graphics/Paint;
    .param p5, "seriesRenderer"    # Lorg/achartengine/renderer/XYSeriesRenderer;
    .param p6, "yAxisValue"    # F
    .param p7, "seriesIndex"    # I
    .param p8, "or"    # Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    .param p9, "startIndex"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/achartengine/model/XYSeries;",
            "Landroid/graphics/Canvas;",
            "Landroid/graphics/Paint;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Float;",
            ">;",
            "Lorg/achartengine/renderer/XYSeriesRenderer;",
            "FI",
            "Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;",
            "I)V"
        }
    .end annotation

    .prologue
    .line 527
    .local p4, "pointsList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    invoke-virtual/range {p5 .. p5}, Lorg/achartengine/renderer/XYSeriesRenderer;->getStroke()Lorg/achartengine/renderer/BasicStroke;

    move-result-object v19

    .line 528
    .local v19, "stroke":Lorg/achartengine/renderer/BasicStroke;
    invoke-virtual/range {p3 .. p3}, Landroid/graphics/Paint;->getStrokeCap()Landroid/graphics/Paint$Cap;

    move-result-object v15

    .line 529
    .local v15, "cap":Landroid/graphics/Paint$Cap;
    invoke-virtual/range {p3 .. p3}, Landroid/graphics/Paint;->getStrokeJoin()Landroid/graphics/Paint$Join;

    move-result-object v16

    .line 530
    .local v16, "join":Landroid/graphics/Paint$Join;
    invoke-virtual/range {p3 .. p3}, Landroid/graphics/Paint;->getStrokeMiter()F

    move-result v17

    .line 531
    .local v17, "miter":F
    invoke-virtual/range {p3 .. p3}, Landroid/graphics/Paint;->getPathEffect()Landroid/graphics/PathEffect;

    move-result-object v18

    .line 532
    .local v18, "pathEffect":Landroid/graphics/PathEffect;
    invoke-virtual/range {p3 .. p3}, Landroid/graphics/Paint;->getStyle()Landroid/graphics/Paint$Style;

    move-result-object v20

    .line 533
    .local v20, "style":Landroid/graphics/Paint$Style;
    if-eqz v19, :cond_43

    .line 534
    const/4 v6, 0x0

    .line 535
    .local v6, "effect":Landroid/graphics/PathEffect;
    invoke-virtual/range {v19 .. v19}, Lorg/achartengine/renderer/BasicStroke;->getIntervals()[F

    move-result-object v1

    if-eqz v1, :cond_2e

    .line 536
    new-instance v6, Landroid/graphics/DashPathEffect;

    .end local v6    # "effect":Landroid/graphics/PathEffect;
    invoke-virtual/range {v19 .. v19}, Lorg/achartengine/renderer/BasicStroke;->getIntervals()[F

    move-result-object v1

    invoke-virtual/range {v19 .. v19}, Lorg/achartengine/renderer/BasicStroke;->getPhase()F

    move-result v2

    invoke-direct {v6, v1, v2}, Landroid/graphics/DashPathEffect;-><init>([FF)V

    .line 538
    .restart local v6    # "effect":Landroid/graphics/PathEffect;
    :cond_2e
    invoke-virtual/range {v19 .. v19}, Lorg/achartengine/renderer/BasicStroke;->getCap()Landroid/graphics/Paint$Cap;

    move-result-object v2

    invoke-virtual/range {v19 .. v19}, Lorg/achartengine/renderer/BasicStroke;->getJoin()Landroid/graphics/Paint$Join;

    move-result-object v3

    invoke-virtual/range {v19 .. v19}, Lorg/achartengine/renderer/BasicStroke;->getMiter()F

    move-result v4

    sget-object v5, Landroid/graphics/Paint$Style;->FILL_AND_STROKE:Landroid/graphics/Paint$Style;

    move-object/from16 v1, p0

    move-object/from16 v7, p3

    invoke-direct/range {v1 .. v7}, Lorg/achartengine/chart/XYChart;->setStroke(Landroid/graphics/Paint$Cap;Landroid/graphics/Paint$Join;FLandroid/graphics/Paint$Style;Landroid/graphics/PathEffect;Landroid/graphics/Paint;)V

    .end local v6    # "effect":Landroid/graphics/PathEffect;
    :cond_43
    move-object/from16 v7, p0

    move-object/from16 v8, p2

    move-object/from16 v9, p3

    move-object/from16 v10, p4

    move-object/from16 v11, p5

    move/from16 v12, p6

    move/from16 v13, p7

    move/from16 v14, p9

    .line 542
    invoke-virtual/range {v7 .. v14}, Lorg/achartengine/chart/XYChart;->drawSeries(Landroid/graphics/Canvas;Landroid/graphics/Paint;Ljava/util/List;Lorg/achartengine/renderer/XYSeriesRenderer;FII)V

    move-object/from16 v7, p0

    move-object/from16 v8, p2

    move-object/from16 v9, p3

    move-object/from16 v10, p4

    move-object/from16 v11, p5

    move/from16 v12, p6

    move/from16 v13, p7

    move/from16 v14, p9

    .line 543
    invoke-virtual/range {v7 .. v14}, Lorg/achartengine/chart/XYChart;->drawPoints(Landroid/graphics/Canvas;Landroid/graphics/Paint;Ljava/util/List;Lorg/achartengine/renderer/XYSeriesRenderer;FII)V

    .line 544
    invoke-virtual/range {p5 .. p5}, Lorg/achartengine/renderer/XYSeriesRenderer;->getChartValuesTextSize()F

    move-result v1

    move-object/from16 v0, p3

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 545
    sget-object v1, Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;->HORIZONTAL:Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;

    move-object/from16 v0, p8

    if-ne v0, v1, :cond_b4

    .line 546
    sget-object v1, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    move-object/from16 v0, p3

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 550
    :goto_7f
    invoke-virtual/range {p5 .. p5}, Lorg/achartengine/renderer/XYSeriesRenderer;->isDisplayChartValues()Z

    move-result v1

    if-eqz v1, :cond_a1

    .line 551
    invoke-virtual/range {p5 .. p5}, Lorg/achartengine/renderer/XYSeriesRenderer;->getChartValuesTextAlign()Landroid/graphics/Paint$Align;

    move-result-object v1

    move-object/from16 v0, p3

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    move-object/from16 v7, p0

    move-object/from16 v8, p2

    move-object/from16 v9, p1

    move-object/from16 v10, p5

    move-object/from16 v11, p3

    move-object/from16 v12, p4

    move/from16 v13, p7

    move/from16 v14, p9

    .line 552
    invoke-virtual/range {v7 .. v14}, Lorg/achartengine/chart/XYChart;->drawChartValuesText(Landroid/graphics/Canvas;Lorg/achartengine/model/XYSeries;Lorg/achartengine/renderer/XYSeriesRenderer;Landroid/graphics/Paint;Ljava/util/List;II)V

    .line 555
    :cond_a1
    if-eqz v19, :cond_b3

    move-object/from16 v7, p0

    move-object v8, v15

    move-object/from16 v9, v16

    move/from16 v10, v17

    move-object/from16 v11, v20

    move-object/from16 v12, v18

    move-object/from16 v13, p3

    .line 556
    invoke-direct/range {v7 .. v13}, Lorg/achartengine/chart/XYChart;->setStroke(Landroid/graphics/Paint$Cap;Landroid/graphics/Paint$Join;FLandroid/graphics/Paint$Style;Landroid/graphics/PathEffect;Landroid/graphics/Paint;)V

    .line 558
    :cond_b3
    return-void

    .line 548
    :cond_b4
    sget-object v1, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    move-object/from16 v0, p3

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    goto :goto_7f
.end method

.method protected drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;F)V
    .registers 10
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "text"    # Ljava/lang/String;
    .param p3, "x"    # F
    .param p4, "y"    # F
    .param p5, "paint"    # Landroid/graphics/Paint;
    .param p6, "extraAngle"    # F

    .prologue
    const/4 v2, 0x0

    .line 660
    iget-object v1, p0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getOrientation()Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;

    move-result-object v1

    invoke-virtual {v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;->getAngle()I

    move-result v1

    neg-int v1, v1

    int-to-float v1, v1

    add-float v0, v1, p6

    .line 661
    .local v0, "angle":F
    cmpl-float v1, v0, v2

    if-eqz v1, :cond_16

    .line 663
    invoke-virtual {p1, v0, p3, p4}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 665
    :cond_16
    invoke-virtual/range {p0 .. p5}, Lorg/achartengine/chart/XYChart;->drawString(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 666
    cmpl-float v1, v0, v2

    if-eqz v1, :cond_21

    .line 667
    neg-float v1, v0

    invoke-virtual {p1, v1, p3, p4}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 670
    :cond_21
    return-void
.end method

.method protected drawXLabels(Ljava/util/List;[Ljava/lang/Double;Landroid/graphics/Canvas;Landroid/graphics/Paint;IIIDDD)V
    .registers 40
    .param p2, "xTextLabelLocations"    # [Ljava/lang/Double;
    .param p3, "canvas"    # Landroid/graphics/Canvas;
    .param p4, "paint"    # Landroid/graphics/Paint;
    .param p5, "left"    # I
    .param p6, "top"    # I
    .param p7, "bottom"    # I
    .param p8, "xPixelsPerUnit"    # D
    .param p10, "minX"    # D
    .param p12, "maxX"    # D
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Double;",
            ">;[",
            "Ljava/lang/Double;",
            "Landroid/graphics/Canvas;",
            "Landroid/graphics/Paint;",
            "IIIDDD)V"
        }
    .end annotation

    .prologue
    .line 708
    .local p1, "xLabels":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    move-result v22

    .line 709
    .local v22, "length":I
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v3}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isShowLabels()Z

    move-result v24

    .line 710
    .local v24, "showLabels":Z
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v3}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isShowGridY()Z

    move-result v23

    .line 711
    .local v23, "showGridY":Z
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v3}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isShowTickMarks()Z

    move-result v25

    .line 712
    .local v25, "showTickMarks":Z
    const/16 v19, 0x0

    .local v19, "i":I
    :goto_1e
    move/from16 v0, v19

    move/from16 v1, v22

    if-ge v0, v1, :cond_c7

    .line 713
    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Double;

    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v20

    .line 714
    .local v20, "label":D
    move/from16 v0, p5

    int-to-double v5, v0

    sub-double v7, v20, p10

    mul-double v7, v7, p8

    add-double/2addr v5, v7

    double-to-float v4, v5

    .line 715
    .local v4, "xLabel":F
    if-eqz v24, :cond_a5

    .line 716
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v3}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getXLabelsColor()I

    move-result v3

    move-object/from16 v0, p4

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 717
    if-eqz v25, :cond_67

    .line 718
    move/from16 v0, p7

    int-to-float v5, v0

    move/from16 v0, p7

    int-to-float v3, v0

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v6}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getLabelsTextSize()F

    move-result v6

    const/high16 v7, 0x40400000    # 3.0f

    div-float/2addr v6, v7

    add-float v7, v3, v6

    move-object/from16 v3, p3

    move v6, v4

    move-object/from16 v8, p4

    invoke-virtual/range {v3 .. v8}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 721
    :cond_67
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v3}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getXLabelFormat()Ljava/text/NumberFormat;

    move-result-object v3

    move-object/from16 v0, p0

    move-wide/from16 v1, v20

    invoke-virtual {v0, v3, v1, v2}, Lorg/achartengine/chart/XYChart;->getLabel(Ljava/text/NumberFormat;D)Ljava/lang/String;

    move-result-object v7

    move/from16 v0, p7

    int-to-float v3, v0

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v5}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getLabelsTextSize()F

    move-result v5

    const/high16 v6, 0x40800000    # 4.0f

    mul-float/2addr v5, v6

    const/high16 v6, 0x40400000    # 3.0f

    div-float/2addr v5, v6

    add-float/2addr v3, v5

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v5}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getXLabelsPadding()F

    move-result v5

    add-float v9, v3, v5

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v3}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getXLabelsAngle()F

    move-result v11

    move-object/from16 v5, p0

    move-object/from16 v6, p3

    move v8, v4

    move-object/from16 v10, p4

    invoke-virtual/range {v5 .. v11}, Lorg/achartengine/chart/XYChart;->drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;F)V

    .line 725
    :cond_a5
    if-eqz v23, :cond_c3

    .line 726
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    const/4 v5, 0x0

    invoke-virtual {v3, v5}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getGridColor(I)I

    move-result v3

    move-object/from16 v0, p4

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 727
    move/from16 v0, p7

    int-to-float v5, v0

    move/from16 v0, p6

    int-to-float v7, v0

    move-object/from16 v3, p3

    move v6, v4

    move-object/from16 v8, p4

    invoke-virtual/range {v3 .. v8}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 712
    :cond_c3
    add-int/lit8 v19, v19, 0x1

    goto/16 :goto_1e

    .end local v4    # "xLabel":F
    .end local v20    # "label":D
    :cond_c7
    move-object/from16 v5, p0

    move-object/from16 v6, p2

    move-object/from16 v7, p3

    move-object/from16 v8, p4

    move/from16 v9, v24

    move/from16 v10, p5

    move/from16 v11, p6

    move/from16 v12, p7

    move-wide/from16 v13, p8

    move-wide/from16 v15, p10

    move-wide/from16 v17, p12

    .line 730
    invoke-virtual/range {v5 .. v18}, Lorg/achartengine/chart/XYChart;->drawXTextLabels([Ljava/lang/Double;Landroid/graphics/Canvas;Landroid/graphics/Paint;ZIIIDDD)V

    .line 732
    return-void
.end method

.method protected drawXTextLabels([Ljava/lang/Double;Landroid/graphics/Canvas;Landroid/graphics/Paint;ZIIIDDD)V
    .registers 30
    .param p1, "xTextLabelLocations"    # [Ljava/lang/Double;
    .param p2, "canvas"    # Landroid/graphics/Canvas;
    .param p3, "paint"    # Landroid/graphics/Paint;
    .param p4, "showLabels"    # Z
    .param p5, "left"    # I
    .param p6, "top"    # I
    .param p7, "bottom"    # I
    .param p8, "xPixelsPerUnit"    # D
    .param p10, "minX"    # D
    .param p12, "maxX"    # D

    .prologue
    .line 824
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isShowCustomTextGridX()Z

    move-result v14

    .line 825
    .local v14, "showCustomTextGridX":Z
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isShowTickMarks()Z

    move-result v15

    .line 826
    .local v15, "showTickMarks":Z
    if-eqz p4, :cond_c6

    .line 827
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getXLabelsColor()I

    move-result v1

    move-object/from16 v0, p3

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 828
    move-object/from16 v10, p1

    .local v10, "arr$":[Ljava/lang/Double;
    array-length v12, v10

    .local v12, "len$":I
    const/4 v11, 0x0

    .local v11, "i$":I
    :goto_23
    if-ge v11, v12, :cond_c6

    aget-object v13, v10, v11

    .line 829
    .local v13, "location":Ljava/lang/Double;
    invoke-virtual {v13}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v3

    cmpg-double v1, p10, v3

    if-gtz v1, :cond_c2

    invoke-virtual {v13}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v3

    cmpg-double v1, v3, p12

    if-gtz v1, :cond_c2

    .line 830
    move/from16 v0, p5

    int-to-double v3, v0

    invoke-virtual {v13}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v5

    sub-double v5, v5, p10

    mul-double v5, v5, p8

    add-double/2addr v3, v5

    double-to-float v2, v3

    .line 831
    .local v2, "xLabel":F
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getXLabelsColor()I

    move-result v1

    move-object/from16 v0, p3

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 832
    if-eqz v15, :cond_6e

    .line 833
    move/from16 v0, p7

    int-to-float v3, v0

    move/from16 v0, p7

    int-to-float v1, v0

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getLabelsTextSize()F

    move-result v4

    const/high16 v5, 0x40400000    # 3.0f

    div-float/2addr v4, v5

    add-float v5, v1, v4

    move-object/from16 v1, p2

    move v4, v2

    move-object/from16 v6, p3

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 836
    :cond_6e
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1, v13}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getXTextLabel(Ljava/lang/Double;)Ljava/lang/String;

    move-result-object v5

    move/from16 v0, p7

    int-to-float v1, v0

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v3}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getLabelsTextSize()F

    move-result v3

    const/high16 v4, 0x40800000    # 4.0f

    mul-float/2addr v3, v4

    const/high16 v4, 0x40400000    # 3.0f

    div-float/2addr v3, v4

    add-float/2addr v1, v3

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v3}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getXLabelsPadding()F

    move-result v3

    add-float v7, v1, v3

    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getXLabelsAngle()F

    move-result v9

    move-object/from16 v3, p0

    move-object/from16 v4, p2

    move v6, v2

    move-object/from16 v8, p3

    invoke-virtual/range {v3 .. v9}, Lorg/achartengine/chart/XYChart;->drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;F)V

    .line 839
    if-eqz v14, :cond_c2

    .line 840
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getGridColor(I)I

    move-result v1

    move-object/from16 v0, p3

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 841
    move/from16 v0, p7

    int-to-float v3, v0

    move/from16 v0, p6

    int-to-float v5, v0

    move-object/from16 v1, p2

    move v4, v2

    move-object/from16 v6, p3

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 828
    .end local v2    # "xLabel":F
    :cond_c2
    add-int/lit8 v11, v11, 0x1

    goto/16 :goto_23

    .line 846
    .end local v10    # "arr$":[Ljava/lang/Double;
    .end local v11    # "i$":I
    .end local v12    # "len$":I
    .end local v13    # "location":Ljava/lang/Double;
    :cond_c6
    return-void
.end method

.method protected drawYLabels(Ljava/util/Map;Landroid/graphics/Canvas;Landroid/graphics/Paint;IIII[D[D)V
    .registers 33
    .param p2, "canvas"    # Landroid/graphics/Canvas;
    .param p3, "paint"    # Landroid/graphics/Paint;
    .param p4, "maxScaleNumber"    # I
    .param p5, "left"    # I
    .param p6, "right"    # I
    .param p7, "bottom"    # I
    .param p8, "yPixelsPerUnit"    # [D
    .param p9, "minY"    # [D
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Double;",
            ">;>;",
            "Landroid/graphics/Canvas;",
            "Landroid/graphics/Paint;",
            "IIII[D[D)V"
        }
    .end annotation

    .prologue
    .line 749
    .local p1, "allYLabels":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Ljava/lang/Double;>;>;"
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getOrientation()Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;

    move-result-object v17

    .line 750
    .local v17, "or":Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isShowGridX()Z

    move-result v18

    .line 751
    .local v18, "showGridX":Z
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isShowLabels()Z

    move-result v19

    .line 752
    .local v19, "showLabels":Z
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isShowTickMarks()Z

    move-result v20

    .line 753
    .local v20, "showTickMarks":Z
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_21
    move/from16 v0, p4

    if-ge v12, v0, :cond_1d8

    .line 754
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1, v12}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYLabelsAlign(I)Landroid/graphics/Paint$Align;

    move-result-object v1

    move-object/from16 v0, p3

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 755
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    move-object/from16 v0, p1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Ljava/util/List;

    .line 756
    .local v22, "yLabels":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    invoke-interface/range {v22 .. v22}, Ljava/util/List;->size()I

    move-result v16

    .line 757
    .local v16, "length":I
    const/4 v13, 0x0

    .local v13, "j":I
    :goto_43
    move/from16 v0, v16

    if-ge v13, v0, :cond_1d4

    .line 758
    move-object/from16 v0, v22

    invoke-interface {v0, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Double;

    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v14

    .line 759
    .local v14, "label":D
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1, v12}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYAxisAlign(I)Landroid/graphics/Paint$Align;

    move-result-object v11

    .line 760
    .local v11, "axisAlign":Landroid/graphics/Paint$Align;
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-static {v14, v15}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v1, v2, v12}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYTextLabel(Ljava/lang/Double;I)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_ff

    const/16 v21, 0x1

    .line 761
    .local v21, "textLabel":Z
    :goto_6b
    move/from16 v0, p7

    int-to-double v1, v0

    aget-wide v4, p8, v12

    aget-wide v6, p9, v12

    sub-double v6, v14, v6

    mul-double/2addr v4, v6

    sub-double/2addr v1, v4

    double-to-float v3, v1

    .line 762
    .local v3, "yLabel":F
    sget-object v1, Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;->HORIZONTAL:Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;

    move-object/from16 v0, v17

    if-ne v0, v1, :cond_150

    .line 763
    if-eqz v19, :cond_de

    if-nez v21, :cond_de

    .line 764
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1, v12}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYLabelsColor(I)I

    move-result v1

    move-object/from16 v0, p3

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 765
    sget-object v1, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    if-ne v11, v1, :cond_103

    .line 766
    if-eqz v20, :cond_a8

    .line 767
    move-object/from16 v0, p0

    invoke-direct {v0, v11}, Lorg/achartengine/chart/XYChart;->getLabelLinePos(Landroid/graphics/Paint$Align;)I

    move-result v1

    add-int v1, v1, p5

    int-to-float v2, v1

    move/from16 v0, p5

    int-to-float v4, v0

    move-object/from16 v1, p2

    move v5, v3

    move-object/from16 v6, p3

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 769
    :cond_a8
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1, v12}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYLabelFormat(I)Ljava/text/NumberFormat;

    move-result-object v1

    move-object/from16 v0, p0

    invoke-virtual {v0, v1, v14, v15}, Lorg/achartengine/chart/XYChart;->getLabel(Ljava/text/NumberFormat;D)Ljava/lang/String;

    move-result-object v6

    move/from16 v0, p5

    int-to-float v1, v0

    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v2}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYLabelsPadding()F

    move-result v2

    sub-float v7, v1, v2

    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYLabelsVerticalPadding()F

    move-result v1

    sub-float v8, v3, v1

    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYLabelsAngle()F

    move-result v10

    move-object/from16 v4, p0

    move-object/from16 v5, p2

    move-object/from16 v9, p3

    invoke-virtual/range {v4 .. v10}, Lorg/achartengine/chart/XYChart;->drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;F)V

    .line 783
    :cond_de
    :goto_de
    if-eqz v18, :cond_fb

    .line 784
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1, v12}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getGridColor(I)I

    move-result v1

    move-object/from16 v0, p3

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 785
    move/from16 v0, p5

    int-to-float v2, v0

    move/from16 v0, p6

    int-to-float v4, v0

    move-object/from16 v1, p2

    move v5, v3

    move-object/from16 v6, p3

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 757
    :cond_fb
    :goto_fb
    add-int/lit8 v13, v13, 0x1

    goto/16 :goto_43

    .line 760
    .end local v3    # "yLabel":F
    .end local v21    # "textLabel":Z
    :cond_ff
    const/16 v21, 0x0

    goto/16 :goto_6b

    .line 774
    .restart local v3    # "yLabel":F
    .restart local v21    # "textLabel":Z
    :cond_103
    if-eqz v20, :cond_119

    .line 775
    move/from16 v0, p6

    int-to-float v2, v0

    move-object/from16 v0, p0

    invoke-direct {v0, v11}, Lorg/achartengine/chart/XYChart;->getLabelLinePos(Landroid/graphics/Paint$Align;)I

    move-result v1

    add-int v1, v1, p6

    int-to-float v4, v1

    move-object/from16 v1, p2

    move v5, v3

    move-object/from16 v6, p3

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 777
    :cond_119
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1, v12}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYLabelFormat(I)Ljava/text/NumberFormat;

    move-result-object v1

    move-object/from16 v0, p0

    invoke-virtual {v0, v1, v14, v15}, Lorg/achartengine/chart/XYChart;->getLabel(Ljava/text/NumberFormat;D)Ljava/lang/String;

    move-result-object v6

    move/from16 v0, p6

    int-to-float v1, v0

    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v2}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYLabelsPadding()F

    move-result v2

    add-float v7, v1, v2

    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYLabelsVerticalPadding()F

    move-result v1

    sub-float v8, v3, v1

    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYLabelsAngle()F

    move-result v10

    move-object/from16 v4, p0

    move-object/from16 v5, p2

    move-object/from16 v9, p3

    invoke-virtual/range {v4 .. v10}, Lorg/achartengine/chart/XYChart;->drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;F)V

    goto :goto_de

    .line 787
    :cond_150
    sget-object v1, Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;->VERTICAL:Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;

    move-object/from16 v0, v17

    if-ne v0, v1, :cond_fb

    .line 788
    if-eqz v19, :cond_1b3

    if-nez v21, :cond_1b3

    .line 789
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1, v12}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYLabelsColor(I)I

    move-result v1

    move-object/from16 v0, p3

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 790
    if-eqz v20, :cond_17d

    .line 791
    move-object/from16 v0, p0

    invoke-direct {v0, v11}, Lorg/achartengine/chart/XYChart;->getLabelLinePos(Landroid/graphics/Paint$Align;)I

    move-result v1

    sub-int v1, p6, v1

    int-to-float v2, v1

    move/from16 v0, p6

    int-to-float v4, v0

    move-object/from16 v1, p2

    move v5, v3

    move-object/from16 v6, p3

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 793
    :cond_17d
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getLabelFormat()Ljava/text/NumberFormat;

    move-result-object v1

    move-object/from16 v0, p0

    invoke-virtual {v0, v1, v14, v15}, Lorg/achartengine/chart/XYChart;->getLabel(Ljava/text/NumberFormat;D)Ljava/lang/String;

    move-result-object v6

    add-int/lit8 v1, p6, 0xa

    int-to-float v1, v1

    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v2}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYLabelsPadding()F

    move-result v2

    add-float v7, v1, v2

    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYLabelsVerticalPadding()F

    move-result v1

    sub-float v8, v3, v1

    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYLabelsAngle()F

    move-result v10

    move-object/from16 v4, p0

    move-object/from16 v5, p2

    move-object/from16 v9, p3

    invoke-virtual/range {v4 .. v10}, Lorg/achartengine/chart/XYChart;->drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;F)V

    .line 797
    :cond_1b3
    if-eqz v18, :cond_fb

    .line 798
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1, v12}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getGridColor(I)I

    move-result v1

    move-object/from16 v0, p3

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 799
    if-eqz v20, :cond_fb

    .line 800
    move/from16 v0, p6

    int-to-float v2, v0

    move/from16 v0, p5

    int-to-float v4, v0

    move-object/from16 v1, p2

    move v5, v3

    move-object/from16 v6, p3

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_fb

    .line 753
    .end local v3    # "yLabel":F
    .end local v11    # "axisAlign":Landroid/graphics/Paint$Align;
    .end local v14    # "label":D
    .end local v21    # "textLabel":Z
    :cond_1d4
    add-int/lit8 v12, v12, 0x1

    goto/16 :goto_21

    .line 806
    .end local v13    # "j":I
    .end local v16    # "length":I
    .end local v22    # "yLabels":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    :cond_1d8
    return-void
.end method

.method public getCalcRange(I)[D
    .registers 4
    .param p1, "scale"    # I

    .prologue
    .line 858
    iget-object v0, p0, Lorg/achartengine/chart/XYChart;->mCalcRange:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [D

    return-object v0
.end method

.method public abstract getChartType()Ljava/lang/String;
.end method

.method public getDataset()Lorg/achartengine/model/XYMultipleSeriesDataset;
    .registers 2

    .prologue
    .line 854
    iget-object v0, p0, Lorg/achartengine/chart/XYChart;->mDataset:Lorg/achartengine/model/XYMultipleSeriesDataset;

    return-object v0
.end method

.method public getDefaultMinimum()D
    .registers 3

    .prologue
    .line 1010
    const-wide v0, 0x7fefffffffffffffL    # Double.MAX_VALUE

    return-wide v0
.end method

.method public getPointsChart()Lorg/achartengine/chart/ScatterChart;
    .registers 2

    .prologue
    .line 1019
    const/4 v0, 0x0

    return-object v0
.end method

.method public getRenderer()Lorg/achartengine/renderer/XYMultipleSeriesRenderer;
    .registers 2

    .prologue
    .line 850
    iget-object v0, p0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    return-object v0
.end method

.method protected getScreenR()Landroid/graphics/Rect;
    .registers 2

    .prologue
    .line 494
    iget-object v0, p0, Lorg/achartengine/chart/XYChart;->mScreenR:Landroid/graphics/Rect;

    return-object v0
.end method

.method public getSeriesAndPointForScreenCoordinate(Lorg/achartengine/model/Point;)Lorg/achartengine/model/SeriesSelection;
    .registers 12
    .param p1, "screenPoint"    # Lorg/achartengine/model/Point;

    .prologue
    .line 936
    iget-object v0, p0, Lorg/achartengine/chart/XYChart;->clickableAreas:Ljava/util/Map;

    if-eqz v0, :cond_61

    .line 937
    iget-object v0, p0, Lorg/achartengine/chart/XYChart;->clickableAreas:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    add-int/lit8 v1, v0, -0x1

    .local v1, "seriesIndex":I
    :goto_c
    if-ltz v1, :cond_61

    .line 942
    const/4 v2, 0x0

    .line 943
    .local v2, "pointIndex":I
    iget-object v0, p0, Lorg/achartengine/chart/XYChart;->clickableAreas:Ljava/util/Map;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_5e

    .line 945
    iget-object v0, p0, Lorg/achartengine/chart/XYChart;->clickableAreas:Ljava/util/Map;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, "i$":Ljava/util/Iterator;
    :goto_2b
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5e

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/achartengine/chart/ClickableArea;

    .line 946
    .local v7, "area":Lorg/achartengine/chart/ClickableArea;
    if-eqz v7, :cond_5b

    .line 947
    invoke-virtual {v7}, Lorg/achartengine/chart/ClickableArea;->getRect()Landroid/graphics/RectF;

    move-result-object v9

    .line 948
    .local v9, "rectangle":Landroid/graphics/RectF;
    if-eqz v9, :cond_5b

    invoke-virtual {p1}, Lorg/achartengine/model/Point;->getX()F

    move-result v0

    invoke-virtual {p1}, Lorg/achartengine/model/Point;->getY()F

    move-result v3

    invoke-virtual {v9, v0, v3}, Landroid/graphics/RectF;->contains(FF)Z

    move-result v0

    if-eqz v0, :cond_5b

    .line 949
    new-instance v0, Lorg/achartengine/model/SeriesSelection;

    invoke-virtual {v7}, Lorg/achartengine/chart/ClickableArea;->getX()D

    move-result-wide v3

    invoke-virtual {v7}, Lorg/achartengine/chart/ClickableArea;->getY()D

    move-result-wide v5

    invoke-direct/range {v0 .. v6}, Lorg/achartengine/model/SeriesSelection;-><init>(IIDD)V

    .line 956
    .end local v1    # "seriesIndex":I
    .end local v2    # "pointIndex":I
    .end local v7    # "area":Lorg/achartengine/chart/ClickableArea;
    .end local v8    # "i$":Ljava/util/Iterator;
    .end local v9    # "rectangle":Landroid/graphics/RectF;
    :goto_5a
    return-object v0

    .line 952
    .restart local v1    # "seriesIndex":I
    .restart local v2    # "pointIndex":I
    .restart local v7    # "area":Lorg/achartengine/chart/ClickableArea;
    .restart local v8    # "i$":Ljava/util/Iterator;
    :cond_5b
    add-int/lit8 v2, v2, 0x1

    .line 953
    goto :goto_2b

    .line 937
    .end local v7    # "area":Lorg/achartengine/chart/ClickableArea;
    .end local v8    # "i$":Ljava/util/Iterator;
    :cond_5e
    add-int/lit8 v1, v1, -0x1

    goto :goto_c

    .line 956
    .end local v1    # "seriesIndex":I
    .end local v2    # "pointIndex":I
    :cond_61
    invoke-super {p0, p1}, Lorg/achartengine/chart/AbstractChart;->getSeriesAndPointForScreenCoordinate(Lorg/achartengine/model/Point;)Lorg/achartengine/model/SeriesSelection;

    move-result-object v0

    goto :goto_5a
.end method

.method protected getXLabels(DDI)Ljava/util/List;
    .registers 7
    .param p1, "min"    # D
    .param p3, "max"    # D
    .param p5, "count"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(DDI)",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation

    .prologue
    .line 481
    invoke-static {p1, p2, p3, p4, p5}, Lorg/achartengine/util/MathHelper;->getLabels(DDI)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method protected getYLabels([D[DI)Ljava/util/Map;
    .registers 12
    .param p1, "minY"    # [D
    .param p2, "maxY"    # [D
    .param p3, "maxScaleNumber"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([D[DI)",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Double;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 485
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 486
    .local v0, "allYLabels":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Ljava/lang/Double;>;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_6
    if-ge v1, p3, :cond_24

    .line 487
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aget-wide v3, p1, v1

    aget-wide v5, p2, v1

    iget-object v7, p0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v7}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYLabels()I

    move-result v7

    invoke-static {v3, v4, v5, v6, v7}, Lorg/achartengine/util/MathHelper;->getLabels(DDI)Ljava/util/List;

    move-result-object v3

    invoke-direct {p0, v3}, Lorg/achartengine/chart/XYChart;->getValidLabels(Ljava/util/List;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 486
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 490
    :cond_24
    return-object v0
.end method

.method protected isRenderNullValues()Z
    .registers 2

    .prologue
    .line 992
    const/4 v0, 0x0

    return v0
.end method

.method public isRenderPoints(Lorg/achartengine/renderer/SimpleSeriesRenderer;)Z
    .registers 3
    .param p1, "renderer"    # Lorg/achartengine/renderer/SimpleSeriesRenderer;

    .prologue
    .line 1001
    const/4 v0, 0x0

    return v0
.end method

.method public setCalcRange([DI)V
    .registers 5
    .param p1, "range"    # [D
    .param p2, "scale"    # I

    .prologue
    .line 862
    iget-object v0, p0, Lorg/achartengine/chart/XYChart;->mCalcRange:Ljava/util/Map;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 863
    return-void
.end method

.method protected setDatasetRenderer(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V
    .registers 3
    .param p1, "dataset"    # Lorg/achartengine/model/XYMultipleSeriesDataset;
    .param p2, "renderer"    # Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    .prologue
    .line 93
    iput-object p1, p0, Lorg/achartengine/chart/XYChart;->mDataset:Lorg/achartengine/model/XYMultipleSeriesDataset;

    .line 94
    iput-object p2, p0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    .line 95
    return-void
.end method

.method protected setScreenR(Landroid/graphics/Rect;)V
    .registers 2
    .param p1, "screenR"    # Landroid/graphics/Rect;

    .prologue
    .line 498
    iput-object p1, p0, Lorg/achartengine/chart/XYChart;->mScreenR:Landroid/graphics/Rect;

    .line 499
    return-void
.end method

.method public toRealPoint(FF)[D
    .registers 4
    .param p1, "screenX"    # F
    .param p2, "screenY"    # F

    .prologue
    .line 866
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/achartengine/chart/XYChart;->toRealPoint(FFI)[D

    move-result-object v0

    return-object v0
.end method

.method public toRealPoint(FFI)[D
    .registers 21
    .param p1, "screenX"    # F
    .param p2, "screenY"    # F
    .param p3, "scale"    # I

    .prologue
    .line 889
    move-object/from16 v0, p0

    iget-object v11, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    move/from16 v0, p3

    invoke-virtual {v11, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getXAxisMin(I)D

    move-result-wide v7

    .line 890
    .local v7, "realMinX":D
    move-object/from16 v0, p0

    iget-object v11, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    move/from16 v0, p3

    invoke-virtual {v11, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getXAxisMax(I)D

    move-result-wide v3

    .line 891
    .local v3, "realMaxX":D
    move-object/from16 v0, p0

    iget-object v11, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    move/from16 v0, p3

    invoke-virtual {v11, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYAxisMin(I)D

    move-result-wide v9

    .line 892
    .local v9, "realMinY":D
    move-object/from16 v0, p0

    iget-object v11, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    move/from16 v0, p3

    invoke-virtual {v11, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYAxisMax(I)D

    move-result-wide v5

    .line 893
    .local v5, "realMaxY":D
    move-object/from16 v0, p0

    iget-object v11, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    move/from16 v0, p3

    invoke-virtual {v11, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isMinXSet(I)Z

    move-result v11

    if-eqz v11, :cond_58

    move-object/from16 v0, p0

    iget-object v11, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    move/from16 v0, p3

    invoke-virtual {v11, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isMaxXSet(I)Z

    move-result v11

    if-eqz v11, :cond_58

    move-object/from16 v0, p0

    iget-object v11, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    move/from16 v0, p3

    invoke-virtual {v11, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isMinYSet(I)Z

    move-result v11

    if-eqz v11, :cond_58

    move-object/from16 v0, p0

    iget-object v11, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    move/from16 v0, p3

    invoke-virtual {v11, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isMaxYSet(I)Z

    move-result v11

    if-nez v11, :cond_6e

    .line 895
    :cond_58
    move-object/from16 v0, p0

    move/from16 v1, p3

    invoke-virtual {v0, v1}, Lorg/achartengine/chart/XYChart;->getCalcRange(I)[D

    move-result-object v2

    .line 896
    .local v2, "calcRange":[D
    if-eqz v2, :cond_6e

    .line 897
    const/4 v11, 0x0

    aget-wide v7, v2, v11

    .line 898
    const/4 v11, 0x1

    aget-wide v3, v2, v11

    .line 899
    const/4 v11, 0x2

    aget-wide v9, v2, v11

    .line 900
    const/4 v11, 0x3

    aget-wide v5, v2, v11

    .line 903
    .end local v2    # "calcRange":[D
    :cond_6e
    move-object/from16 v0, p0

    iget-object v11, v0, Lorg/achartengine/chart/XYChart;->mScreenR:Landroid/graphics/Rect;

    if-eqz v11, :cond_b7

    .line 904
    const/4 v11, 0x2

    new-array v11, v11, [D

    const/4 v12, 0x0

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/achartengine/chart/XYChart;->mScreenR:Landroid/graphics/Rect;

    iget v13, v13, Landroid/graphics/Rect;->left:I

    int-to-float v13, v13

    sub-float v13, p1, v13

    float-to-double v13, v13

    sub-double v15, v3, v7

    mul-double/2addr v13, v15

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/achartengine/chart/XYChart;->mScreenR:Landroid/graphics/Rect;

    invoke-virtual {v15}, Landroid/graphics/Rect;->width()I

    move-result v15

    int-to-double v15, v15

    div-double/2addr v13, v15

    add-double/2addr v13, v7

    aput-wide v13, v11, v12

    const/4 v12, 0x1

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/achartengine/chart/XYChart;->mScreenR:Landroid/graphics/Rect;

    iget v13, v13, Landroid/graphics/Rect;->top:I

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/achartengine/chart/XYChart;->mScreenR:Landroid/graphics/Rect;

    invoke-virtual {v14}, Landroid/graphics/Rect;->height()I

    move-result v14

    add-int/2addr v13, v14

    int-to-float v13, v13

    sub-float v13, v13, p2

    float-to-double v13, v13

    sub-double v15, v5, v9

    mul-double/2addr v13, v15

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/achartengine/chart/XYChart;->mScreenR:Landroid/graphics/Rect;

    invoke-virtual {v15}, Landroid/graphics/Rect;->height()I

    move-result v15

    int-to-double v15, v15

    div-double/2addr v13, v15

    add-double/2addr v13, v9

    aput-wide v13, v11, v12

    .line 909
    :goto_b6
    return-object v11

    :cond_b7
    const/4 v11, 0x2

    new-array v11, v11, [D

    const/4 v12, 0x0

    move/from16 v0, p1

    float-to-double v13, v0

    aput-wide v13, v11, v12

    const/4 v12, 0x1

    move/from16 v0, p2

    float-to-double v13, v0

    aput-wide v13, v11, v12

    goto :goto_b6
.end method

.method public toScreenPoint([D)[D
    .registers 3
    .param p1, "realPoint"    # [D

    .prologue
    .line 870
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/achartengine/chart/XYChart;->toScreenPoint([DI)[D

    move-result-object v0

    return-object v0
.end method

.method public toScreenPoint([DI)[D
    .registers 20
    .param p1, "realPoint"    # [D
    .param p2, "scale"    # I

    .prologue
    .line 914
    move-object/from16 v0, p0

    iget-object v11, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    move/from16 v0, p2

    invoke-virtual {v11, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getXAxisMin(I)D

    move-result-wide v7

    .line 915
    .local v7, "realMinX":D
    move-object/from16 v0, p0

    iget-object v11, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    move/from16 v0, p2

    invoke-virtual {v11, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getXAxisMax(I)D

    move-result-wide v3

    .line 916
    .local v3, "realMaxX":D
    move-object/from16 v0, p0

    iget-object v11, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    move/from16 v0, p2

    invoke-virtual {v11, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYAxisMin(I)D

    move-result-wide v9

    .line 917
    .local v9, "realMinY":D
    move-object/from16 v0, p0

    iget-object v11, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    move/from16 v0, p2

    invoke-virtual {v11, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getYAxisMax(I)D

    move-result-wide v5

    .line 918
    .local v5, "realMaxY":D
    move-object/from16 v0, p0

    iget-object v11, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    move/from16 v0, p2

    invoke-virtual {v11, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isMinXSet(I)Z

    move-result v11

    if-eqz v11, :cond_58

    move-object/from16 v0, p0

    iget-object v11, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    move/from16 v0, p2

    invoke-virtual {v11, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isMaxXSet(I)Z

    move-result v11

    if-eqz v11, :cond_58

    move-object/from16 v0, p0

    iget-object v11, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    move/from16 v0, p2

    invoke-virtual {v11, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isMinYSet(I)Z

    move-result v11

    if-eqz v11, :cond_58

    move-object/from16 v0, p0

    iget-object v11, v0, Lorg/achartengine/chart/XYChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    move/from16 v0, p2

    invoke-virtual {v11, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isMaxYSet(I)Z

    move-result v11

    if-nez v11, :cond_6c

    .line 920
    :cond_58
    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-virtual {v0, v1}, Lorg/achartengine/chart/XYChart;->getCalcRange(I)[D

    move-result-object v2

    .line 921
    .local v2, "calcRange":[D
    const/4 v11, 0x0

    aget-wide v7, v2, v11

    .line 922
    const/4 v11, 0x1

    aget-wide v3, v2, v11

    .line 923
    const/4 v11, 0x2

    aget-wide v9, v2, v11

    .line 924
    const/4 v11, 0x3

    aget-wide v5, v2, v11

    .line 926
    .end local v2    # "calcRange":[D
    :cond_6c
    move-object/from16 v0, p0

    iget-object v11, v0, Lorg/achartengine/chart/XYChart;->mScreenR:Landroid/graphics/Rect;

    if-eqz v11, :cond_b0

    .line 927
    const/4 v11, 0x2

    new-array v11, v11, [D

    const/4 v12, 0x0

    const/4 v13, 0x0

    aget-wide v13, p1, v13

    sub-double/2addr v13, v7

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/achartengine/chart/XYChart;->mScreenR:Landroid/graphics/Rect;

    invoke-virtual {v15}, Landroid/graphics/Rect;->width()I

    move-result v15

    int-to-double v15, v15

    mul-double/2addr v13, v15

    sub-double v15, v3, v7

    div-double/2addr v13, v15

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/achartengine/chart/XYChart;->mScreenR:Landroid/graphics/Rect;

    iget v15, v15, Landroid/graphics/Rect;->left:I

    int-to-double v15, v15

    add-double/2addr v13, v15

    aput-wide v13, v11, v12

    const/4 v12, 0x1

    const/4 v13, 0x1

    aget-wide v13, p1, v13

    sub-double v13, v5, v13

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/achartengine/chart/XYChart;->mScreenR:Landroid/graphics/Rect;

    invoke-virtual {v15}, Landroid/graphics/Rect;->height()I

    move-result v15

    int-to-double v15, v15

    mul-double/2addr v13, v15

    sub-double v15, v5, v9

    div-double/2addr v13, v15

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/achartengine/chart/XYChart;->mScreenR:Landroid/graphics/Rect;

    iget v15, v15, Landroid/graphics/Rect;->top:I

    int-to-double v15, v15

    add-double/2addr v13, v15

    aput-wide v13, v11, v12

    move-object/from16 p1, v11

    .line 931
    .end local p1    # "realPoint":[D
    :cond_b0
    return-object p1
.end method
