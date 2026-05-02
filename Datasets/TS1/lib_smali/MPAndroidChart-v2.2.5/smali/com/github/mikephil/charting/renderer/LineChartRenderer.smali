.class public Lcom/github/mikephil/charting/renderer/LineChartRenderer;
.super Lcom/github/mikephil/charting/renderer/LineRadarRenderer;
.source "LineChartRenderer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/github/mikephil/charting/renderer/LineChartRenderer$1;
    }
.end annotation


# instance fields
.field protected cubicFillPath:Landroid/graphics/Path;

.field protected cubicPath:Landroid/graphics/Path;

.field protected mBitmapCanvas:Landroid/graphics/Canvas;

.field protected mBitmapConfig:Landroid/graphics/Bitmap$Config;

.field protected mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/LineDataProvider;

.field protected mCirclePaintInner:Landroid/graphics/Paint;

.field private mCirclePathBuffer:Landroid/graphics/Path;

.field protected mDrawBitmap:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field private mLineBuffer:[F


# direct methods
.method public constructor <init>(Lcom/github/mikephil/charting/interfaces/dataprovider/LineDataProvider;Lcom/github/mikephil/charting/animation/ChartAnimator;Lcom/github/mikephil/charting/utils/ViewPortHandler;)V
    .registers 6
    .param p1, "chart"    # Lcom/github/mikephil/charting/interfaces/dataprovider/LineDataProvider;
    .param p2, "animator"    # Lcom/github/mikephil/charting/animation/ChartAnimator;
    .param p3, "viewPortHandler"    # Lcom/github/mikephil/charting/utils/ViewPortHandler;

    .prologue
    .line 58
    invoke-direct {p0, p2, p3}, Lcom/github/mikephil/charting/renderer/LineRadarRenderer;-><init>(Lcom/github/mikephil/charting/animation/ChartAnimator;Lcom/github/mikephil/charting/utils/ViewPortHandler;)V

    .line 51
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    iput-object v0, p0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mBitmapConfig:Landroid/graphics/Bitmap$Config;

    .line 53
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->cubicPath:Landroid/graphics/Path;

    .line 54
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->cubicFillPath:Landroid/graphics/Path;

    .line 309
    const/4 v0, 0x4

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mLineBuffer:[F

    .line 601
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mCirclePathBuffer:Landroid/graphics/Path;

    .line 59
    iput-object p1, p0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/LineDataProvider;

    .line 61
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mCirclePaintInner:Landroid/graphics/Paint;

    .line 62
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mCirclePaintInner:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 63
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mCirclePaintInner:Landroid/graphics/Paint;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 64
    return-void
.end method

.method private generateFilledPath(Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;II)Landroid/graphics/Path;
    .registers 17
    .param p1, "dataSet"    # Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;
    .param p2, "from"    # I
    .param p3, "to"    # I

    .prologue
    .line 496
    invoke-interface {p1}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getFillFormatter()Lcom/github/mikephil/charting/formatter/FillFormatter;

    move-result-object v10

    iget-object v11, p0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/LineDataProvider;

    invoke-interface {v10, p1, v11}, Lcom/github/mikephil/charting/formatter/FillFormatter;->getFillLinePosition(Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;Lcom/github/mikephil/charting/interfaces/dataprovider/LineDataProvider;)F

    move-result v4

    .line 497
    .local v4, "fillMin":F
    const/4 v10, 0x0

    const/high16 v11, 0x3f800000    # 1.0f

    iget-object v12, p0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v12}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseX()F

    move-result v12

    invoke-static {v11, v12}, Ljava/lang/Math;->min(FF)F

    move-result v11

    invoke-static {v10, v11}, Ljava/lang/Math;->max(FF)F

    move-result v7

    .line 498
    .local v7, "phaseX":F
    iget-object v10, p0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v10}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseY()F

    move-result v8

    .line 499
    .local v8, "phaseY":F
    invoke-interface {p1}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->isDrawSteppedEnabled()Z

    move-result v6

    .line 501
    .local v6, "isDrawSteppedEnabled":Z
    new-instance v5, Landroid/graphics/Path;

    invoke-direct {v5}, Landroid/graphics/Path;-><init>()V

    .line 502
    .local v5, "filled":Landroid/graphics/Path;
    invoke-interface {p1, p2}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v3

    .line 504
    .local v3, "entry":Lcom/github/mikephil/charting/data/Entry;
    invoke-virtual {v3}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v10

    int-to-float v10, v10

    invoke-virtual {v5, v10, v4}, Landroid/graphics/Path;->moveTo(FF)V

    .line 505
    invoke-virtual {v3}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v10

    int-to-float v10, v10

    invoke-virtual {v3}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v11

    mul-float/2addr v11, v8

    invoke-virtual {v5, v10, v11}, Landroid/graphics/Path;->lineTo(FF)V

    .line 508
    add-int/lit8 v9, p2, 0x1

    .local v9, "x":I
    sub-int v10, p3, p2

    int-to-float v10, v10

    mul-float/2addr v10, v7

    int-to-float v11, p2

    add-float/2addr v10, v11

    float-to-double v10, v10

    invoke-static {v10, v11}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v10

    double-to-int v0, v10

    .local v0, "count":I
    :goto_51
    if-ge v9, v0, :cond_7f

    .line 510
    invoke-interface {p1, v9}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v1

    .line 512
    .local v1, "e":Lcom/github/mikephil/charting/data/Entry;
    if-eqz v6, :cond_71

    .line 513
    add-int/lit8 v10, v9, -0x1

    invoke-interface {p1, v10}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v2

    .line 514
    .local v2, "ePrev":Lcom/github/mikephil/charting/data/Entry;
    if-nez v2, :cond_64

    .line 508
    .end local v2    # "ePrev":Lcom/github/mikephil/charting/data/Entry;
    :goto_61
    add-int/lit8 v9, v9, 0x1

    goto :goto_51

    .line 516
    .restart local v2    # "ePrev":Lcom/github/mikephil/charting/data/Entry;
    :cond_64
    invoke-virtual {v1}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v10

    int-to-float v10, v10

    invoke-virtual {v2}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v11

    mul-float/2addr v11, v8

    invoke-virtual {v5, v10, v11}, Landroid/graphics/Path;->lineTo(FF)V

    .line 519
    .end local v2    # "ePrev":Lcom/github/mikephil/charting/data/Entry;
    :cond_71
    invoke-virtual {v1}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v10

    int-to-float v10, v10

    invoke-virtual {v1}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v11

    mul-float/2addr v11, v8

    invoke-virtual {v5, v10, v11}, Landroid/graphics/Path;->lineTo(FF)V

    goto :goto_61

    .line 523
    .end local v1    # "e":Lcom/github/mikephil/charting/data/Entry;
    :cond_7f
    sub-int v10, p3, p2

    int-to-float v10, v10

    mul-float/2addr v10, v7

    int-to-float v11, p2

    add-float/2addr v10, v11

    float-to-double v10, v10

    invoke-static {v10, v11}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v10

    double-to-int v10, v10

    add-int/lit8 v10, v10, -0x1

    invoke-interface {p1}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getEntryCount()I

    move-result v11

    add-int/lit8 v11, v11, -0x1

    invoke-static {v10, v11}, Ljava/lang/Math;->min(II)I

    move-result v10

    const/4 v11, 0x0

    invoke-static {v10, v11}, Ljava/lang/Math;->max(II)I

    move-result v10

    invoke-interface {p1, v10}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v10

    invoke-virtual {v10}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v10

    int-to-float v10, v10

    invoke-virtual {v5, v10, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 529
    invoke-virtual {v5}, Landroid/graphics/Path;->close()V

    .line 531
    return-object v5
.end method


# virtual methods
.method protected drawCircles(Landroid/graphics/Canvas;)V
    .registers 30
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    .line 605
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    move-object/from16 v24, v0

    sget-object v25, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual/range {v24 .. v25}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 607
    const/16 v24, 0x0

    const/high16 v25, 0x3f800000    # 1.0f

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseX()F

    move-result v26

    invoke-static/range {v25 .. v26}, Ljava/lang/Math;->min(FF)F

    move-result v25

    invoke-static/range {v24 .. v25}, Ljava/lang/Math;->max(FF)F

    move-result v21

    .line 608
    .local v21, "phaseX":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseY()F

    move-result v22

    .line 610
    .local v22, "phaseY":F
    const/16 v24, 0x2

    move/from16 v0, v24

    new-array v6, v0, [F

    .line 612
    .local v6, "circlesBuffer":[F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/LineDataProvider;

    move-object/from16 v24, v0

    invoke-interface/range {v24 .. v24}, Lcom/github/mikephil/charting/interfaces/dataprovider/LineDataProvider;->getLineData()Lcom/github/mikephil/charting/data/LineData;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Lcom/github/mikephil/charting/data/LineData;->getDataSets()Ljava/util/List;

    move-result-object v9

    .line 614
    .local v9, "dataSets":Ljava/util/List;, "Ljava/util/List<Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;>;"
    const/16 v17, 0x0

    .local v17, "i":I
    :goto_41
    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v24

    move/from16 v0, v17

    move/from16 v1, v24

    if-ge v0, v1, :cond_22d

    .line 616
    move/from16 v0, v17

    invoke-interface {v9, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;

    .line 618
    .local v8, "dataSet":Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;
    invoke-interface {v8}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->isVisible()Z

    move-result v24

    if-eqz v24, :cond_65

    invoke-interface {v8}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->isDrawCirclesEnabled()Z

    move-result v24

    if-eqz v24, :cond_65

    invoke-interface {v8}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getEntryCount()I

    move-result v24

    if-nez v24, :cond_68

    .line 614
    :cond_65
    add-int/lit8 v17, v17, 0x1

    goto :goto_41

    .line 622
    :cond_68
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mCirclePaintInner:Landroid/graphics/Paint;

    move-object/from16 v24, v0

    invoke-interface {v8}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getCircleHoleColor()I

    move-result v25

    invoke-virtual/range {v24 .. v25}, Landroid/graphics/Paint;->setColor(I)V

    .line 624
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/LineDataProvider;

    move-object/from16 v24, v0

    invoke-interface {v8}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getAxisDependency()Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    move-result-object v25

    invoke-interface/range {v24 .. v25}, Lcom/github/mikephil/charting/interfaces/dataprovider/LineDataProvider;->getTransformer(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/Transformer;

    move-result-object v23

    .line 626
    .local v23, "trans":Lcom/github/mikephil/charting/utils/Transformer;
    invoke-interface {v8}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getEntryCount()I

    move-result v14

    .line 628
    .local v14, "entryCount":I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mMinX:I

    move/from16 v24, v0

    if-gez v24, :cond_180

    const/16 v24, 0x0

    :goto_91
    sget-object v25, Lcom/github/mikephil/charting/data/DataSet$Rounding;->DOWN:Lcom/github/mikephil/charting/data/DataSet$Rounding;

    move/from16 v0, v24

    move-object/from16 v1, v25

    invoke-interface {v8, v0, v1}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getEntryForXIndex(ILcom/github/mikephil/charting/data/DataSet$Rounding;)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v15

    .line 630
    .local v15, "entryFrom":Lcom/github/mikephil/charting/data/Entry;
    move-object/from16 v0, p0

    iget v0, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mMaxX:I

    move/from16 v24, v0

    sget-object v25, Lcom/github/mikephil/charting/data/DataSet$Rounding;->UP:Lcom/github/mikephil/charting/data/DataSet$Rounding;

    move/from16 v0, v24

    move-object/from16 v1, v25

    invoke-interface {v8, v0, v1}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getEntryForXIndex(ILcom/github/mikephil/charting/data/DataSet$Rounding;)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v16

    .line 632
    .local v16, "entryTo":Lcom/github/mikephil/charting/data/Entry;
    move-object/from16 v0, v16

    if-ne v15, v0, :cond_188

    const/4 v10, 0x1

    .line 633
    .local v10, "diff":I
    :goto_b0
    invoke-interface {v8}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getMode()Lcom/github/mikephil/charting/data/LineDataSet$Mode;

    move-result-object v24

    sget-object v25, Lcom/github/mikephil/charting/data/LineDataSet$Mode;->CUBIC_BEZIER:Lcom/github/mikephil/charting/data/LineDataSet$Mode;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    if-ne v0, v1, :cond_be

    .line 634
    add-int/lit8 v10, v10, 0x1

    .line 636
    :cond_be
    invoke-interface {v8, v15}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getEntryIndex(Lcom/github/mikephil/charting/data/Entry;)I

    move-result v24

    sub-int v24, v24, v10

    const/16 v25, 0x0

    invoke-static/range {v24 .. v25}, Ljava/lang/Math;->max(II)I

    move-result v20

    .line 637
    .local v20, "minx":I
    add-int/lit8 v24, v20, 0x2

    move-object/from16 v0, v16

    invoke-interface {v8, v0}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getEntryIndex(Lcom/github/mikephil/charting/data/Entry;)I

    move-result v25

    add-int/lit8 v25, v25, 0x1

    invoke-static/range {v24 .. v25}, Ljava/lang/Math;->max(II)I

    move-result v24

    move/from16 v0, v24

    invoke-static {v0, v14}, Ljava/lang/Math;->min(II)I

    move-result v19

    .line 639
    .local v19, "maxx":I
    invoke-interface {v8}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getCircleRadius()F

    move-result v5

    .line 640
    .local v5, "circleRadius":F
    invoke-interface {v8}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getCircleHoleRadius()F

    move-result v4

    .line 641
    .local v4, "circleHoleRadius":F
    invoke-interface {v8}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->isDrawCircleHoleEnabled()Z

    move-result v24

    if-eqz v24, :cond_18b

    cmpg-float v24, v4, v5

    if-gez v24, :cond_18b

    const/16 v24, 0x0

    cmpl-float v24, v4, v24

    if-lez v24, :cond_18b

    const/4 v11, 0x1

    .line 644
    .local v11, "drawCircleHole":Z
    :goto_f7
    if-eqz v11, :cond_18e

    invoke-interface {v8}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getCircleHoleColor()I

    move-result v24

    const v25, 0x112233

    move/from16 v0, v24

    move/from16 v1, v25

    if-ne v0, v1, :cond_18e

    const/4 v12, 0x1

    .line 647
    .local v12, "drawTransparentCircleHole":Z
    :goto_107
    move/from16 v18, v20

    .line 648
    .local v18, "j":I
    sub-int v24, v19, v20

    move/from16 v0, v24

    int-to-float v0, v0

    move/from16 v24, v0

    mul-float v24, v24, v21

    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v25, v0

    add-float v24, v24, v25

    move/from16 v0, v24

    float-to-double v0, v0

    move-wide/from16 v24, v0

    invoke-static/range {v24 .. v25}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v24

    move-wide/from16 v0, v24

    double-to-int v7, v0

    .line 649
    .local v7, "count":I
    :goto_125
    move/from16 v0, v18

    if-ge v0, v7, :cond_65

    .line 652
    move/from16 v0, v18

    invoke-interface {v8, v0}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v13

    .line 654
    .local v13, "e":Lcom/github/mikephil/charting/data/Entry;
    if-eqz v13, :cond_65

    .line 656
    const/16 v24, 0x0

    invoke-virtual {v13}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v25

    move/from16 v0, v25

    int-to-float v0, v0

    move/from16 v25, v0

    aput v25, v6, v24

    .line 657
    const/16 v24, 0x1

    invoke-virtual {v13}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v25

    mul-float v25, v25, v22

    aput v25, v6, v24

    .line 659
    move-object/from16 v0, v23

    invoke-virtual {v0, v6}, Lcom/github/mikephil/charting/utils/Transformer;->pointValuesToPixel([F)V

    .line 661
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    aget v25, v6, v25

    invoke-virtual/range {v24 .. v25}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsRight(F)Z

    move-result v24

    if-eqz v24, :cond_65

    .line 666
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    aget v25, v6, v25

    invoke-virtual/range {v24 .. v25}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsLeft(F)Z

    move-result v24

    if-eqz v24, :cond_17d

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    move-object/from16 v24, v0

    const/16 v25, 0x1

    aget v25, v6, v25

    invoke-virtual/range {v24 .. v25}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsY(F)Z

    move-result v24

    if-nez v24, :cond_191

    .line 650
    :cond_17d
    :goto_17d
    add-int/lit8 v18, v18, 0x1

    goto :goto_125

    .line 628
    .end local v4    # "circleHoleRadius":F
    .end local v5    # "circleRadius":F
    .end local v7    # "count":I
    .end local v10    # "diff":I
    .end local v11    # "drawCircleHole":Z
    .end local v12    # "drawTransparentCircleHole":Z
    .end local v13    # "e":Lcom/github/mikephil/charting/data/Entry;
    .end local v15    # "entryFrom":Lcom/github/mikephil/charting/data/Entry;
    .end local v16    # "entryTo":Lcom/github/mikephil/charting/data/Entry;
    .end local v18    # "j":I
    .end local v19    # "maxx":I
    .end local v20    # "minx":I
    :cond_180
    move-object/from16 v0, p0

    iget v0, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mMinX:I

    move/from16 v24, v0

    goto/16 :goto_91

    .line 632
    .restart local v15    # "entryFrom":Lcom/github/mikephil/charting/data/Entry;
    .restart local v16    # "entryTo":Lcom/github/mikephil/charting/data/Entry;
    :cond_188
    const/4 v10, 0x0

    goto/16 :goto_b0

    .line 641
    .restart local v4    # "circleHoleRadius":F
    .restart local v5    # "circleRadius":F
    .restart local v10    # "diff":I
    .restart local v19    # "maxx":I
    .restart local v20    # "minx":I
    :cond_18b
    const/4 v11, 0x0

    goto/16 :goto_f7

    .line 644
    .restart local v11    # "drawCircleHole":Z
    :cond_18e
    const/4 v12, 0x0

    goto/16 :goto_107

    .line 670
    .restart local v7    # "count":I
    .restart local v12    # "drawTransparentCircleHole":Z
    .restart local v13    # "e":Lcom/github/mikephil/charting/data/Entry;
    .restart local v18    # "j":I
    :cond_191
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    move-object/from16 v24, v0

    move/from16 v0, v18

    invoke-interface {v8, v0}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getCircleColor(I)I

    move-result v25

    invoke-virtual/range {v24 .. v25}, Landroid/graphics/Paint;->setColor(I)V

    .line 672
    if-eqz v12, :cond_1f7

    .line 675
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mCirclePathBuffer:Landroid/graphics/Path;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Landroid/graphics/Path;->reset()V

    .line 677
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mCirclePathBuffer:Landroid/graphics/Path;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    aget v25, v6, v25

    const/16 v26, 0x1

    aget v26, v6, v26

    sget-object v27, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    move-object/from16 v0, v24

    move/from16 v1, v25

    move/from16 v2, v26

    move-object/from16 v3, v27

    invoke-virtual {v0, v1, v2, v5, v3}, Landroid/graphics/Path;->addCircle(FFFLandroid/graphics/Path$Direction;)V

    .line 682
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mCirclePathBuffer:Landroid/graphics/Path;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    aget v25, v6, v25

    const/16 v26, 0x1

    aget v26, v6, v26

    sget-object v27, Landroid/graphics/Path$Direction;->CCW:Landroid/graphics/Path$Direction;

    move-object/from16 v0, v24

    move/from16 v1, v25

    move/from16 v2, v26

    move-object/from16 v3, v27

    invoke-virtual {v0, v1, v2, v4, v3}, Landroid/graphics/Path;->addCircle(FFFLandroid/graphics/Path$Direction;)V

    .line 687
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mCirclePathBuffer:Landroid/graphics/Path;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    move-object/from16 v25, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    goto :goto_17d

    .line 691
    :cond_1f7
    const/16 v24, 0x0

    aget v24, v6, v24

    const/16 v25, 0x1

    aget v25, v6, v25

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    move-object/from16 v26, v0

    move-object/from16 v0, p1

    move/from16 v1, v24

    move/from16 v2, v25

    move-object/from16 v3, v26

    invoke-virtual {v0, v1, v2, v5, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 695
    if-eqz v11, :cond_17d

    .line 696
    const/16 v24, 0x0

    aget v24, v6, v24

    const/16 v25, 0x1

    aget v25, v6, v25

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mCirclePaintInner:Landroid/graphics/Paint;

    move-object/from16 v26, v0

    move-object/from16 v0, p1

    move/from16 v1, v24

    move/from16 v2, v25

    move-object/from16 v3, v26

    invoke-virtual {v0, v1, v2, v4, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto/16 :goto_17d

    .line 703
    .end local v4    # "circleHoleRadius":F
    .end local v5    # "circleRadius":F
    .end local v7    # "count":I
    .end local v8    # "dataSet":Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;
    .end local v10    # "diff":I
    .end local v11    # "drawCircleHole":Z
    .end local v12    # "drawTransparentCircleHole":Z
    .end local v13    # "e":Lcom/github/mikephil/charting/data/Entry;
    .end local v14    # "entryCount":I
    .end local v15    # "entryFrom":Lcom/github/mikephil/charting/data/Entry;
    .end local v16    # "entryTo":Lcom/github/mikephil/charting/data/Entry;
    .end local v18    # "j":I
    .end local v19    # "maxx":I
    .end local v20    # "minx":I
    .end local v23    # "trans":Lcom/github/mikephil/charting/utils/Transformer;
    :cond_22d
    return-void
.end method

.method protected drawCubicBezier(Landroid/graphics/Canvas;Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;)V
    .registers 33
    .param p1, "c"    # Landroid/graphics/Canvas;
    .param p2, "dataSet"    # Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;

    .prologue
    .line 201
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/LineDataProvider;

    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getAxisDependency()Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/github/mikephil/charting/interfaces/dataprovider/LineDataProvider;->getTransformer(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/Transformer;

    move-result-object v29

    .line 203
    .local v29, "trans":Lcom/github/mikephil/charting/utils/Transformer;
    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getEntryCount()I

    move-result v14

    .line 205
    .local v14, "entryCount":I
    move-object/from16 v0, p0

    iget v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mMinX:I

    if-gez v2, :cond_14e

    const/4 v2, 0x0

    :goto_17
    sget-object v3, Lcom/github/mikephil/charting/data/DataSet$Rounding;->DOWN:Lcom/github/mikephil/charting/data/DataSet$Rounding;

    move-object/from16 v0, p2

    invoke-interface {v0, v2, v3}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getEntryForXIndex(ILcom/github/mikephil/charting/data/DataSet$Rounding;)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v15

    .line 206
    .local v15, "entryFrom":Lcom/github/mikephil/charting/data/Entry;
    move-object/from16 v0, p0

    iget v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mMaxX:I

    sget-object v3, Lcom/github/mikephil/charting/data/DataSet$Rounding;->UP:Lcom/github/mikephil/charting/data/DataSet$Rounding;

    move-object/from16 v0, p2

    invoke-interface {v0, v2, v3}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getEntryForXIndex(ILcom/github/mikephil/charting/data/DataSet$Rounding;)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v16

    .line 208
    .local v16, "entryTo":Lcom/github/mikephil/charting/data/Entry;
    move-object/from16 v0, v16

    if-ne v15, v0, :cond_154

    const/4 v13, 0x1

    .line 209
    .local v13, "diff":I
    :goto_30
    move-object/from16 v0, p2

    invoke-interface {v0, v15}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getEntryIndex(Lcom/github/mikephil/charting/data/Entry;)I

    move-result v2

    sub-int/2addr v2, v13

    add-int/lit8 v2, v2, -0x1

    const/4 v3, 0x0

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v20

    .line 210
    .local v20, "minx":I
    add-int/lit8 v2, v20, 0x2

    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-interface {v0, v1}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getEntryIndex(Lcom/github/mikephil/charting/data/Entry;)I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v2

    invoke-static {v2, v14}, Ljava/lang/Math;->min(II)I

    move-result v19

    .line 212
    .local v19, "maxx":I
    const/4 v2, 0x0

    const/high16 v3, 0x3f800000    # 1.0f

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseX()F

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(FF)F

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(FF)F

    move-result v22

    .line 213
    .local v22, "phaseX":F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseY()F

    move-result v23

    .line 215
    .local v23, "phaseY":F
    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getCubicIntensity()F

    move-result v17

    .line 217
    .local v17, "intensity":F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->cubicPath:Landroid/graphics/Path;

    invoke-virtual {v2}, Landroid/graphics/Path;->reset()V

    .line 219
    sub-int v2, v19, v20

    int-to-float v2, v2

    mul-float v2, v2, v22

    move/from16 v0, v20

    int-to-float v3, v0

    add-float/2addr v2, v3

    float-to-double v2, v2

    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v2

    double-to-int v0, v2

    move/from16 v28, v0

    .line 221
    .local v28, "size":I
    sub-int v2, v28, v20

    const/4 v3, 0x2

    if-lt v2, v3, :cond_15e

    .line 223
    const/16 v25, 0x0

    .line 224
    .local v25, "prevDx":F
    const/16 v26, 0x0

    .line 225
    .local v26, "prevDy":F
    const/4 v11, 0x0

    .line 226
    .local v11, "curDx":F
    const/4 v12, 0x0

    .line 228
    .local v12, "curDy":F
    move-object/from16 v0, p2

    move/from16 v1, v20

    invoke-interface {v0, v1}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v27

    .line 229
    .local v27, "prevPrev":Lcom/github/mikephil/charting/data/Entry;
    move-object/from16 v24, v27

    .line 230
    .local v24, "prev":Lcom/github/mikephil/charting/data/Entry;
    move-object/from16 v10, v24

    .line 231
    .local v10, "cur":Lcom/github/mikephil/charting/data/Entry;
    add-int/lit8 v2, v20, 0x1

    move-object/from16 v0, p2

    invoke-interface {v0, v2}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v21

    .line 234
    .local v21, "next":Lcom/github/mikephil/charting/data/Entry;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->cubicPath:Landroid/graphics/Path;

    invoke-virtual {v10}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v10}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v4

    mul-float v4, v4, v23

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Path;->moveTo(FF)V

    .line 236
    add-int/lit8 v18, v20, 0x1

    .local v18, "j":I
    move/from16 v0, v28

    invoke-static {v0, v14}, Ljava/lang/Math;->min(II)I

    move-result v9

    .local v9, "count":I
    :goto_c2
    move/from16 v0, v18

    if-ge v0, v9, :cond_15e

    .line 238
    const/4 v2, 0x1

    move/from16 v0, v18

    if-ne v0, v2, :cond_157

    const/4 v2, 0x0

    :goto_cc
    move-object/from16 v0, p2

    invoke-interface {v0, v2}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v27

    .line 239
    add-int/lit8 v2, v18, -0x1

    move-object/from16 v0, p2

    invoke-interface {v0, v2}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v24

    .line 240
    move-object/from16 v0, p2

    move/from16 v1, v18

    invoke-interface {v0, v1}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v10

    .line 241
    add-int/lit8 v2, v18, 0x1

    if-le v14, v2, :cond_15b

    add-int/lit8 v2, v18, 0x1

    move-object/from16 v0, p2

    invoke-interface {v0, v2}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v21

    .line 243
    :goto_ee
    invoke-virtual {v10}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v2

    invoke-virtual/range {v27 .. v27}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v3

    sub-int/2addr v2, v3

    int-to-float v2, v2

    mul-float v25, v2, v17

    .line 244
    invoke-virtual {v10}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v2

    invoke-virtual/range {v27 .. v27}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v3

    sub-float/2addr v2, v3

    mul-float v26, v2, v17

    .line 245
    invoke-virtual/range {v21 .. v21}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v2

    invoke-virtual/range {v24 .. v24}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v3

    sub-int/2addr v2, v3

    int-to-float v2, v2

    mul-float v11, v2, v17

    .line 246
    invoke-virtual/range {v21 .. v21}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v2

    invoke-virtual/range {v24 .. v24}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v3

    sub-float/2addr v2, v3

    mul-float v12, v2, v17

    .line 248
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->cubicPath:Landroid/graphics/Path;

    invoke-virtual/range {v24 .. v24}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v3

    int-to-float v3, v3

    add-float v3, v3, v25

    invoke-virtual/range {v24 .. v24}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v4

    add-float v4, v4, v26

    mul-float v4, v4, v23

    invoke-virtual {v10}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v5

    int-to-float v5, v5

    sub-float/2addr v5, v11

    invoke-virtual {v10}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v6

    sub-float/2addr v6, v12

    mul-float v6, v6, v23

    invoke-virtual {v10}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v7

    int-to-float v7, v7

    invoke-virtual {v10}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v8

    mul-float v8, v8, v23

    invoke-virtual/range {v2 .. v8}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 236
    add-int/lit8 v18, v18, 0x1

    goto/16 :goto_c2

    .line 205
    .end local v9    # "count":I
    .end local v10    # "cur":Lcom/github/mikephil/charting/data/Entry;
    .end local v11    # "curDx":F
    .end local v12    # "curDy":F
    .end local v13    # "diff":I
    .end local v15    # "entryFrom":Lcom/github/mikephil/charting/data/Entry;
    .end local v16    # "entryTo":Lcom/github/mikephil/charting/data/Entry;
    .end local v17    # "intensity":F
    .end local v18    # "j":I
    .end local v19    # "maxx":I
    .end local v20    # "minx":I
    .end local v21    # "next":Lcom/github/mikephil/charting/data/Entry;
    .end local v22    # "phaseX":F
    .end local v23    # "phaseY":F
    .end local v24    # "prev":Lcom/github/mikephil/charting/data/Entry;
    .end local v25    # "prevDx":F
    .end local v26    # "prevDy":F
    .end local v27    # "prevPrev":Lcom/github/mikephil/charting/data/Entry;
    .end local v28    # "size":I
    :cond_14e
    move-object/from16 v0, p0

    iget v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mMinX:I

    goto/16 :goto_17

    .line 208
    .restart local v15    # "entryFrom":Lcom/github/mikephil/charting/data/Entry;
    .restart local v16    # "entryTo":Lcom/github/mikephil/charting/data/Entry;
    :cond_154
    const/4 v13, 0x0

    goto/16 :goto_30

    .line 238
    .restart local v9    # "count":I
    .restart local v10    # "cur":Lcom/github/mikephil/charting/data/Entry;
    .restart local v11    # "curDx":F
    .restart local v12    # "curDy":F
    .restart local v13    # "diff":I
    .restart local v17    # "intensity":F
    .restart local v18    # "j":I
    .restart local v19    # "maxx":I
    .restart local v20    # "minx":I
    .restart local v21    # "next":Lcom/github/mikephil/charting/data/Entry;
    .restart local v22    # "phaseX":F
    .restart local v23    # "phaseY":F
    .restart local v24    # "prev":Lcom/github/mikephil/charting/data/Entry;
    .restart local v25    # "prevDx":F
    .restart local v26    # "prevDy":F
    .restart local v27    # "prevPrev":Lcom/github/mikephil/charting/data/Entry;
    .restart local v28    # "size":I
    :cond_157
    add-int/lit8 v2, v18, -0x2

    goto/16 :goto_cc

    :cond_15b
    move-object/from16 v21, v10

    .line 241
    goto :goto_ee

    .line 255
    .end local v9    # "count":I
    .end local v10    # "cur":Lcom/github/mikephil/charting/data/Entry;
    .end local v11    # "curDx":F
    .end local v12    # "curDy":F
    .end local v18    # "j":I
    .end local v21    # "next":Lcom/github/mikephil/charting/data/Entry;
    .end local v24    # "prev":Lcom/github/mikephil/charting/data/Entry;
    .end local v25    # "prevDx":F
    .end local v26    # "prevDy":F
    .end local v27    # "prevPrev":Lcom/github/mikephil/charting/data/Entry;
    :cond_15e
    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->isDrawFilledEnabled()Z

    move-result v2

    if-eqz v2, :cond_18b

    .line 257
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->cubicFillPath:Landroid/graphics/Path;

    invoke-virtual {v2}, Landroid/graphics/Path;->reset()V

    .line 258
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->cubicFillPath:Landroid/graphics/Path;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->cubicPath:Landroid/graphics/Path;

    invoke-virtual {v2, v3}, Landroid/graphics/Path;->addPath(Landroid/graphics/Path;)V

    .line 260
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mBitmapCanvas:Landroid/graphics/Canvas;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->cubicFillPath:Landroid/graphics/Path;

    move-object/from16 v2, p0

    move-object/from16 v4, p2

    move-object/from16 v6, v29

    move/from16 v7, v20

    move/from16 v8, v28

    invoke-virtual/range {v2 .. v8}, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->drawCubicFill(Landroid/graphics/Canvas;Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;Landroid/graphics/Path;Lcom/github/mikephil/charting/utils/Transformer;II)V

    .line 264
    :cond_18b
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getColor()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 266
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 268
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->cubicPath:Landroid/graphics/Path;

    move-object/from16 v0, v29

    invoke-virtual {v0, v2}, Lcom/github/mikephil/charting/utils/Transformer;->pathValueToPixel(Landroid/graphics/Path;)V

    .line 270
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mBitmapCanvas:Landroid/graphics/Canvas;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->cubicPath:Landroid/graphics/Path;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 272
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setPathEffect(Landroid/graphics/PathEffect;)Landroid/graphics/PathEffect;

    .line 273
    return-void
.end method

.method protected drawCubicFill(Landroid/graphics/Canvas;Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;Landroid/graphics/Path;Lcom/github/mikephil/charting/utils/Transformer;II)V
    .registers 15
    .param p1, "c"    # Landroid/graphics/Canvas;
    .param p2, "dataSet"    # Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;
    .param p3, "spline"    # Landroid/graphics/Path;
    .param p4, "trans"    # Lcom/github/mikephil/charting/utils/Transformer;
    .param p5, "from"    # I
    .param p6, "to"    # I

    .prologue
    const/4 v4, 0x0

    .line 278
    sub-int v6, p6, p5

    const/4 v7, 0x1

    if-gt v6, v7, :cond_7

    .line 307
    :goto_6
    return-void

    .line 281
    :cond_7
    invoke-interface {p2}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getFillFormatter()Lcom/github/mikephil/charting/formatter/FillFormatter;

    move-result-object v6

    iget-object v7, p0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/LineDataProvider;

    invoke-interface {v6, p2, v7}, Lcom/github/mikephil/charting/formatter/FillFormatter;->getFillLinePosition(Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;Lcom/github/mikephil/charting/interfaces/dataprovider/LineDataProvider;)F

    move-result v1

    .line 288
    .local v1, "fillMin":F
    add-int/lit8 v6, p6, -0x1

    invoke-interface {p2, v6}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v3

    .line 289
    .local v3, "toEntry":Lcom/github/mikephil/charting/data/Entry;
    invoke-interface {p2, p5}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v2

    .line 290
    .local v2, "fromEntry":Lcom/github/mikephil/charting/data/Entry;
    if-nez v3, :cond_36

    move v5, v4

    .line 291
    .local v5, "xTo":F
    :goto_1e
    if-nez v2, :cond_3c

    .line 293
    .local v4, "xFrom":F
    :goto_20
    invoke-virtual {p3, v5, v1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 294
    invoke-virtual {p3, v4, v1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 295
    invoke-virtual {p3}, Landroid/graphics/Path;->close()V

    .line 297
    invoke-virtual {p4, p3}, Lcom/github/mikephil/charting/utils/Transformer;->pathValueToPixel(Landroid/graphics/Path;)V

    .line 299
    invoke-interface {p2}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getFillDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 300
    .local v0, "drawable":Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_42

    .line 302
    invoke-virtual {p0, p1, p3, v0}, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->drawFilledPath(Landroid/graphics/Canvas;Landroid/graphics/Path;Landroid/graphics/drawable/Drawable;)V

    goto :goto_6

    .line 290
    .end local v0    # "drawable":Landroid/graphics/drawable/Drawable;
    .end local v4    # "xFrom":F
    .end local v5    # "xTo":F
    :cond_36
    invoke-virtual {v3}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v6

    int-to-float v5, v6

    goto :goto_1e

    .line 291
    .restart local v5    # "xTo":F
    :cond_3c
    invoke-virtual {v2}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v6

    int-to-float v4, v6

    goto :goto_20

    .line 305
    .restart local v0    # "drawable":Landroid/graphics/drawable/Drawable;
    .restart local v4    # "xFrom":F
    :cond_42
    invoke-interface {p2}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getFillColor()I

    move-result v6

    invoke-interface {p2}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getFillAlpha()I

    move-result v7

    invoke-virtual {p0, p1, p3, v6, v7}, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->drawFilledPath(Landroid/graphics/Canvas;Landroid/graphics/Path;II)V

    goto :goto_6
.end method

.method public drawData(Landroid/graphics/Canvas;)V
    .registers 10
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v7, 0x0

    .line 74
    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v5}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getChartWidth()F

    move-result v5

    float-to-int v4, v5

    .line 75
    .local v4, "width":I
    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v5}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getChartHeight()F

    move-result v5

    float-to-int v0, v5

    .line 77
    .local v0, "height":I
    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mDrawBitmap:Ljava/lang/ref/WeakReference;

    if-eqz v5, :cond_2f

    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mDrawBitmap:Ljava/lang/ref/WeakReference;

    invoke-virtual {v5}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/graphics/Bitmap;

    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    if-ne v5, v4, :cond_2f

    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mDrawBitmap:Ljava/lang/ref/WeakReference;

    invoke-virtual {v5}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/graphics/Bitmap;

    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    if-eq v5, v0, :cond_4f

    .line 81
    :cond_2f
    if-lez v4, :cond_92

    if-lez v0, :cond_92

    .line 83
    new-instance v5, Ljava/lang/ref/WeakReference;

    iget-object v6, p0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mBitmapConfig:Landroid/graphics/Bitmap$Config;

    invoke-static {v4, v0, v6}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v5, p0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mDrawBitmap:Ljava/lang/ref/WeakReference;

    .line 84
    new-instance v6, Landroid/graphics/Canvas;

    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mDrawBitmap:Ljava/lang/ref/WeakReference;

    invoke-virtual {v5}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/graphics/Bitmap;

    invoke-direct {v6, v5}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    iput-object v6, p0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mBitmapCanvas:Landroid/graphics/Canvas;

    .line 89
    :cond_4f
    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mDrawBitmap:Ljava/lang/ref/WeakReference;

    invoke-virtual {v5}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/graphics/Bitmap;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Landroid/graphics/Bitmap;->eraseColor(I)V

    .line 91
    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/LineDataProvider;

    invoke-interface {v5}, Lcom/github/mikephil/charting/interfaces/dataprovider/LineDataProvider;->getLineData()Lcom/github/mikephil/charting/data/LineData;

    move-result-object v2

    .line 93
    .local v2, "lineData":Lcom/github/mikephil/charting/data/LineData;
    invoke-virtual {v2}, Lcom/github/mikephil/charting/data/LineData;->getDataSets()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_69
    :goto_69
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_85

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;

    .line 95
    .local v3, "set":Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;
    invoke-interface {v3}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->isVisible()Z

    move-result v5

    if-eqz v5, :cond_69

    invoke-interface {v3}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getEntryCount()I

    move-result v5

    if-lez v5, :cond_69

    .line 96
    invoke-virtual {p0, p1, v3}, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->drawDataSet(Landroid/graphics/Canvas;Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;)V

    goto :goto_69

    .line 99
    .end local v3    # "set":Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;
    :cond_85
    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mDrawBitmap:Ljava/lang/ref/WeakReference;

    invoke-virtual {v5}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/graphics/Bitmap;

    iget-object v6, p0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v5, v7, v7, v6}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 100
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "lineData":Lcom/github/mikephil/charting/data/LineData;
    :cond_92
    return-void
.end method

.method protected drawDataSet(Landroid/graphics/Canvas;Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;)V
    .registers 5
    .param p1, "c"    # Landroid/graphics/Canvas;
    .param p2, "dataSet"    # Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;

    .prologue
    .line 104
    invoke-interface {p2}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getEntryCount()I

    move-result v0

    const/4 v1, 0x1

    if-ge v0, v1, :cond_8

    .line 127
    :goto_7
    return-void

    .line 107
    :cond_8
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    invoke-interface {p2}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getLineWidth()F

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 108
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    invoke-interface {p2}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getDashPathEffect()Landroid/graphics/DashPathEffect;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setPathEffect(Landroid/graphics/PathEffect;)Landroid/graphics/PathEffect;

    .line 110
    sget-object v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer$1;->$SwitchMap$com$github$mikephil$charting$data$LineDataSet$Mode:[I

    invoke-interface {p2}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getMode()Lcom/github/mikephil/charting/data/LineDataSet$Mode;

    move-result-object v1

    invoke-virtual {v1}, Lcom/github/mikephil/charting/data/LineDataSet$Mode;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_3c

    .line 114
    invoke-virtual {p0, p1, p2}, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->drawLinear(Landroid/graphics/Canvas;Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;)V

    .line 126
    :goto_2c
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setPathEffect(Landroid/graphics/PathEffect;)Landroid/graphics/PathEffect;

    goto :goto_7

    .line 118
    :pswitch_33
    invoke-virtual {p0, p1, p2}, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->drawCubicBezier(Landroid/graphics/Canvas;Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;)V

    goto :goto_2c

    .line 122
    :pswitch_37
    invoke-virtual {p0, p1, p2}, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->drawHorizontalBezier(Landroid/graphics/Canvas;Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;)V

    goto :goto_2c

    .line 110
    nop

    :pswitch_data_3c
    .packed-switch 0x3
        :pswitch_33
        :pswitch_37
    .end packed-switch
.end method

.method public drawExtras(Landroid/graphics/Canvas;)V
    .registers 2
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    .line 598
    invoke-virtual {p0, p1}, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->drawCircles(Landroid/graphics/Canvas;)V

    .line 599
    return-void
.end method

.method public drawHighlighted(Landroid/graphics/Canvas;[Lcom/github/mikephil/charting/highlight/Highlight;)V
    .registers 21
    .param p1, "c"    # Landroid/graphics/Canvas;
    .param p2, "indices"    # [Lcom/github/mikephil/charting/highlight/Highlight;

    .prologue
    .line 708
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/LineDataProvider;

    invoke-interface {v15}, Lcom/github/mikephil/charting/interfaces/dataprovider/LineDataProvider;->getLineData()Lcom/github/mikephil/charting/data/LineData;

    move-result-object v7

    .line 710
    .local v7, "lineData":Lcom/github/mikephil/charting/data/LineData;
    move-object/from16 v2, p2

    .local v2, "arr$":[Lcom/github/mikephil/charting/highlight/Highlight;
    array-length v6, v2

    .local v6, "len$":I
    const/4 v5, 0x0

    .local v5, "i$":I
    :goto_c
    if-ge v5, v6, :cond_aa

    aget-object v4, v2, v5

    .line 712
    .local v4, "high":Lcom/github/mikephil/charting/highlight/Highlight;
    invoke-virtual {v4}, Lcom/github/mikephil/charting/highlight/Highlight;->getDataSetIndex()I

    move-result v15

    const/16 v16, -0x1

    move/from16 v0, v16

    if-ne v15, v0, :cond_34

    const/4 v9, 0x0

    .line 715
    .local v9, "minDataSetIndex":I
    :goto_1b
    invoke-virtual {v4}, Lcom/github/mikephil/charting/highlight/Highlight;->getDataSetIndex()I

    move-result v15

    const/16 v16, -0x1

    move/from16 v0, v16

    if-ne v15, v0, :cond_39

    invoke-virtual {v7}, Lcom/github/mikephil/charting/data/LineData;->getDataSetCount()I

    move-result v8

    .line 718
    .local v8, "maxDataSetIndex":I
    :goto_29
    sub-int v15, v8, v9

    const/16 v16, 0x1

    move/from16 v0, v16

    if-ge v15, v0, :cond_40

    .line 710
    :cond_31
    add-int/lit8 v5, v5, 0x1

    goto :goto_c

    .line 712
    .end local v8    # "maxDataSetIndex":I
    .end local v9    # "minDataSetIndex":I
    :cond_34
    invoke-virtual {v4}, Lcom/github/mikephil/charting/highlight/Highlight;->getDataSetIndex()I

    move-result v9

    goto :goto_1b

    .line 715
    .restart local v9    # "minDataSetIndex":I
    :cond_39
    invoke-virtual {v4}, Lcom/github/mikephil/charting/highlight/Highlight;->getDataSetIndex()I

    move-result v15

    add-int/lit8 v8, v15, 0x1

    goto :goto_29

    .line 720
    .restart local v8    # "maxDataSetIndex":I
    :cond_40
    move v3, v9

    .line 721
    .local v3, "dataSetIndex":I
    :goto_41
    if-ge v3, v8, :cond_31

    .line 724
    invoke-virtual {v7, v3}, Lcom/github/mikephil/charting/data/LineData;->getDataSetByIndex(I)Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    move-result-object v11

    check-cast v11, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;

    .line 726
    .local v11, "set":Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;
    if-eqz v11, :cond_51

    invoke-interface {v11}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->isHighlightEnabled()Z

    move-result v15

    if-nez v15, :cond_54

    .line 722
    :cond_51
    :goto_51
    add-int/lit8 v3, v3, 0x1

    goto :goto_41

    .line 729
    :cond_54
    invoke-virtual {v4}, Lcom/github/mikephil/charting/highlight/Highlight;->getXIndex()I

    move-result v12

    .line 732
    .local v12, "xIndex":I
    int-to-float v15, v12

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/LineDataProvider;

    move-object/from16 v16, v0

    invoke-interface/range {v16 .. v16}, Lcom/github/mikephil/charting/interfaces/dataprovider/LineDataProvider;->getXChartMax()F

    move-result v16

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseX()F

    move-result v17

    mul-float v16, v16, v17

    cmpl-float v15, v15, v16

    if-gtz v15, :cond_51

    .line 735
    invoke-interface {v11, v12}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getYValForXIndex(I)F

    move-result v14

    .line 736
    .local v14, "yVal":F
    invoke-static {v14}, Ljava/lang/Float;->isNaN(F)Z

    move-result v15

    if-nez v15, :cond_51

    .line 739
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v15}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseY()F

    move-result v15

    mul-float v13, v14, v15

    .line 743
    .local v13, "y":F
    const/4 v15, 0x2

    new-array v10, v15, [F

    const/4 v15, 0x0

    int-to-float v0, v12

    move/from16 v16, v0

    aput v16, v10, v15

    const/4 v15, 0x1

    aput v13, v10, v15

    .line 747
    .local v10, "pts":[F
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/LineDataProvider;

    invoke-interface {v11}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getAxisDependency()Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    move-result-object v16

    invoke-interface/range {v15 .. v16}, Lcom/github/mikephil/charting/interfaces/dataprovider/LineDataProvider;->getTransformer(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/Transformer;

    move-result-object v15

    invoke-virtual {v15, v10}, Lcom/github/mikephil/charting/utils/Transformer;->pointValuesToPixel([F)V

    .line 750
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v10, v11}, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->drawHighlightLines(Landroid/graphics/Canvas;[FLcom/github/mikephil/charting/interfaces/datasets/ILineScatterCandleRadarDataSet;)V

    goto :goto_51

    .line 753
    .end local v3    # "dataSetIndex":I
    .end local v4    # "high":Lcom/github/mikephil/charting/highlight/Highlight;
    .end local v8    # "maxDataSetIndex":I
    .end local v9    # "minDataSetIndex":I
    .end local v10    # "pts":[F
    .end local v11    # "set":Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;
    .end local v12    # "xIndex":I
    .end local v13    # "y":F
    .end local v14    # "yVal":F
    :cond_aa
    return-void
.end method

.method protected drawHorizontalBezier(Landroid/graphics/Canvas;Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;)V
    .registers 26
    .param p1, "c"    # Landroid/graphics/Canvas;
    .param p2, "dataSet"    # Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;

    .prologue
    .line 137
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/LineDataProvider;

    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getAxisDependency()Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    move-result-object v4

    invoke-interface {v2, v4}, Lcom/github/mikephil/charting/interfaces/dataprovider/LineDataProvider;->getTransformer(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/Transformer;

    move-result-object v22

    .line 139
    .local v22, "trans":Lcom/github/mikephil/charting/utils/Transformer;
    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getEntryCount()I

    move-result v14

    .line 141
    .local v14, "entryCount":I
    move-object/from16 v0, p0

    iget v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mMinX:I

    if-gez v2, :cond_ee

    const/4 v2, 0x0

    :goto_17
    sget-object v4, Lcom/github/mikephil/charting/data/DataSet$Rounding;->DOWN:Lcom/github/mikephil/charting/data/DataSet$Rounding;

    move-object/from16 v0, p2

    invoke-interface {v0, v2, v4}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getEntryForXIndex(ILcom/github/mikephil/charting/data/DataSet$Rounding;)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v15

    .line 142
    .local v15, "entryFrom":Lcom/github/mikephil/charting/data/Entry;
    move-object/from16 v0, p0

    iget v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mMaxX:I

    sget-object v4, Lcom/github/mikephil/charting/data/DataSet$Rounding;->UP:Lcom/github/mikephil/charting/data/DataSet$Rounding;

    move-object/from16 v0, p2

    invoke-interface {v0, v2, v4}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getEntryForXIndex(ILcom/github/mikephil/charting/data/DataSet$Rounding;)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v16

    .line 144
    .local v16, "entryTo":Lcom/github/mikephil/charting/data/Entry;
    move-object/from16 v0, v16

    if-ne v15, v0, :cond_f4

    const/4 v13, 0x1

    .line 145
    .local v13, "diff":I
    :goto_30
    move-object/from16 v0, p2

    invoke-interface {v0, v15}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getEntryIndex(Lcom/github/mikephil/charting/data/Entry;)I

    move-result v2

    sub-int/2addr v2, v13

    const/4 v4, 0x0

    invoke-static {v2, v4}, Ljava/lang/Math;->max(II)I

    move-result v9

    .line 146
    .local v9, "minx":I
    add-int/lit8 v2, v9, 0x2

    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-interface {v0, v1}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getEntryIndex(Lcom/github/mikephil/charting/data/Entry;)I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    invoke-static {v2, v4}, Ljava/lang/Math;->max(II)I

    move-result v2

    invoke-static {v2, v14}, Ljava/lang/Math;->min(II)I

    move-result v18

    .line 148
    .local v18, "maxx":I
    const/4 v2, 0x0

    const/high16 v4, 0x3f800000    # 1.0f

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v5}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseX()F

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->min(FF)F

    move-result v4

    invoke-static {v2, v4}, Ljava/lang/Math;->max(FF)F

    move-result v19

    .line 149
    .local v19, "phaseX":F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseY()F

    move-result v20

    .line 151
    .local v20, "phaseY":F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->cubicPath:Landroid/graphics/Path;

    invoke-virtual {v2}, Landroid/graphics/Path;->reset()V

    .line 153
    sub-int v2, v18, v9

    int-to-float v2, v2

    mul-float v2, v2, v19

    int-to-float v4, v9

    add-float/2addr v2, v4

    float-to-double v4, v2

    invoke-static {v4, v5}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v4

    double-to-int v10, v4

    .line 155
    .local v10, "size":I
    sub-int v2, v10, v9

    const/4 v4, 0x2

    if-lt v2, v4, :cond_f7

    .line 157
    move-object/from16 v0, p2

    invoke-interface {v0, v9}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v21

    .line 158
    .local v21, "prev":Lcom/github/mikephil/charting/data/Entry;
    move-object/from16 v12, v21

    .line 161
    .local v12, "cur":Lcom/github/mikephil/charting/data/Entry;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->cubicPath:Landroid/graphics/Path;

    invoke-virtual {v12}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v12}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v5

    mul-float v5, v5, v20

    invoke-virtual {v2, v4, v5}, Landroid/graphics/Path;->moveTo(FF)V

    .line 163
    add-int/lit8 v17, v9, 0x1

    .local v17, "j":I
    invoke-static {v10, v14}, Ljava/lang/Math;->min(II)I

    move-result v11

    .local v11, "count":I
    :goto_a4
    move/from16 v0, v17

    if-ge v0, v11, :cond_f7

    .line 165
    add-int/lit8 v2, v17, -0x1

    move-object/from16 v0, p2

    invoke-interface {v0, v2}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v21

    .line 166
    move-object/from16 v0, p2

    move/from16 v1, v17

    invoke-interface {v0, v1}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v12

    .line 168
    invoke-virtual/range {v21 .. v21}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v12}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v4

    invoke-virtual/range {v21 .. v21}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v5

    sub-int/2addr v4, v5

    int-to-float v4, v4

    const/high16 v5, 0x40000000    # 2.0f

    div-float/2addr v4, v5

    add-float v3, v2, v4

    .line 171
    .local v3, "cpx":F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->cubicPath:Landroid/graphics/Path;

    invoke-virtual/range {v21 .. v21}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v4

    mul-float v4, v4, v20

    invoke-virtual {v12}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v5

    mul-float v6, v5, v20

    invoke-virtual {v12}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v5

    int-to-float v7, v5

    invoke-virtual {v12}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v5

    mul-float v8, v5, v20

    move v5, v3

    invoke-virtual/range {v2 .. v8}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 163
    add-int/lit8 v17, v17, 0x1

    goto :goto_a4

    .line 141
    .end local v3    # "cpx":F
    .end local v9    # "minx":I
    .end local v10    # "size":I
    .end local v11    # "count":I
    .end local v12    # "cur":Lcom/github/mikephil/charting/data/Entry;
    .end local v13    # "diff":I
    .end local v15    # "entryFrom":Lcom/github/mikephil/charting/data/Entry;
    .end local v16    # "entryTo":Lcom/github/mikephil/charting/data/Entry;
    .end local v17    # "j":I
    .end local v18    # "maxx":I
    .end local v19    # "phaseX":F
    .end local v20    # "phaseY":F
    .end local v21    # "prev":Lcom/github/mikephil/charting/data/Entry;
    :cond_ee
    move-object/from16 v0, p0

    iget v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mMinX:I

    goto/16 :goto_17

    .line 144
    .restart local v15    # "entryFrom":Lcom/github/mikephil/charting/data/Entry;
    .restart local v16    # "entryTo":Lcom/github/mikephil/charting/data/Entry;
    :cond_f4
    const/4 v13, 0x0

    goto/16 :goto_30

    .line 179
    .restart local v9    # "minx":I
    .restart local v10    # "size":I
    .restart local v13    # "diff":I
    .restart local v18    # "maxx":I
    .restart local v19    # "phaseX":F
    .restart local v20    # "phaseY":F
    :cond_f7
    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->isDrawFilledEnabled()Z

    move-result v2

    if-eqz v2, :cond_120

    .line 181
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->cubicFillPath:Landroid/graphics/Path;

    invoke-virtual {v2}, Landroid/graphics/Path;->reset()V

    .line 182
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->cubicFillPath:Landroid/graphics/Path;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->cubicPath:Landroid/graphics/Path;

    invoke-virtual {v2, v4}, Landroid/graphics/Path;->addPath(Landroid/graphics/Path;)V

    .line 184
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mBitmapCanvas:Landroid/graphics/Canvas;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->cubicFillPath:Landroid/graphics/Path;

    move-object/from16 v4, p0

    move-object/from16 v6, p2

    move-object/from16 v8, v22

    invoke-virtual/range {v4 .. v10}, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->drawCubicFill(Landroid/graphics/Canvas;Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;Landroid/graphics/Path;Lcom/github/mikephil/charting/utils/Transformer;II)V

    .line 188
    :cond_120
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getColor()I

    move-result v4

    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 190
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    sget-object v4, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 192
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->cubicPath:Landroid/graphics/Path;

    move-object/from16 v0, v22

    invoke-virtual {v0, v2}, Lcom/github/mikephil/charting/utils/Transformer;->pathValueToPixel(Landroid/graphics/Path;)V

    .line 194
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mBitmapCanvas:Landroid/graphics/Canvas;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->cubicPath:Landroid/graphics/Path;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    invoke-virtual {v2, v4, v5}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 196
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setPathEffect(Landroid/graphics/PathEffect;)Landroid/graphics/PathEffect;

    .line 197
    return-void
.end method

.method protected drawLinear(Landroid/graphics/Canvas;Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;)V
    .registers 29
    .param p1, "c"    # Landroid/graphics/Canvas;
    .param p2, "dataSet"    # Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;

    .prologue
    .line 319
    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getEntryCount()I

    move-result v14

    .line 321
    .local v14, "entryCount":I
    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->isDrawSteppedEnabled()Z

    move-result v17

    .line 322
    .local v17, "isDrawSteppedEnabled":Z
    if-eqz v17, :cond_d9

    const/16 v22, 0x4

    .line 324
    .local v22, "pointsPerEntryPair":I
    :goto_c
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/LineDataProvider;

    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getAxisDependency()Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/github/mikephil/charting/interfaces/dataprovider/LineDataProvider;->getTransformer(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/Transformer;

    move-result-object v7

    .line 326
    .local v7, "trans":Lcom/github/mikephil/charting/utils/Transformer;
    const/4 v2, 0x0

    const/high16 v3, 0x3f800000    # 1.0f

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseX()F

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(FF)F

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(FF)F

    move-result v20

    .line 327
    .local v20, "phaseX":F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseY()F

    move-result v21

    .line 329
    .local v21, "phaseY":F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 331
    const/4 v8, 0x0

    .line 334
    .local v8, "canvas":Landroid/graphics/Canvas;
    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->isDashedLineEnabled()Z

    move-result v2

    if-eqz v2, :cond_dd

    .line 335
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mBitmapCanvas:Landroid/graphics/Canvas;

    .line 340
    :goto_47
    move-object/from16 v0, p0

    iget v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mMinX:I

    if-gez v2, :cond_e1

    const/4 v2, 0x0

    :goto_4e
    sget-object v3, Lcom/github/mikephil/charting/data/DataSet$Rounding;->DOWN:Lcom/github/mikephil/charting/data/DataSet$Rounding;

    move-object/from16 v0, p2

    invoke-interface {v0, v2, v3}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getEntryForXIndex(ILcom/github/mikephil/charting/data/DataSet$Rounding;)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v15

    .line 341
    .local v15, "entryFrom":Lcom/github/mikephil/charting/data/Entry;
    move-object/from16 v0, p0

    iget v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mMaxX:I

    sget-object v3, Lcom/github/mikephil/charting/data/DataSet$Rounding;->UP:Lcom/github/mikephil/charting/data/DataSet$Rounding;

    move-object/from16 v0, p2

    invoke-interface {v0, v2, v3}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getEntryForXIndex(ILcom/github/mikephil/charting/data/DataSet$Rounding;)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v16

    .line 343
    .local v16, "entryTo":Lcom/github/mikephil/charting/data/Entry;
    move-object/from16 v0, v16

    if-ne v15, v0, :cond_e7

    const/4 v10, 0x1

    .line 344
    .local v10, "diff":I
    :goto_67
    move-object/from16 v0, p2

    invoke-interface {v0, v15}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getEntryIndex(Lcom/github/mikephil/charting/data/Entry;)I

    move-result v2

    sub-int/2addr v2, v10

    const/4 v3, 0x0

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v5

    .line 345
    .local v5, "minx":I
    add-int/lit8 v2, v5, 0x2

    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-interface {v0, v1}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getEntryIndex(Lcom/github/mikephil/charting/data/Entry;)I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v2

    invoke-static {v2, v14}, Ljava/lang/Math;->min(II)I

    move-result v6

    .line 347
    .local v6, "maxx":I
    sub-int v2, v6, v5

    int-to-float v2, v2

    mul-float v2, v2, v20

    int-to-float v3, v5

    add-float/2addr v2, v3

    float-to-double v2, v2

    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v2

    double-to-int v9, v2

    .line 350
    .local v9, "count":I
    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getColors()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x1

    if-le v2, v3, :cond_23d

    .line 352
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mLineBuffer:[F

    array-length v2, v2

    mul-int/lit8 v3, v22, 0x2

    if-eq v2, v3, :cond_b0

    .line 353
    mul-int/lit8 v2, v22, 0x2

    new-array v2, v2, [F

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mLineBuffer:[F

    .line 355
    :cond_b0
    move/from16 v18, v5

    .line 356
    .local v18, "j":I
    :goto_b2
    move/from16 v0, v18

    if-ge v0, v9, :cond_bf

    .line 359
    const/4 v2, 0x1

    if-le v9, v2, :cond_ea

    add-int/lit8 v2, v9, -0x1

    move/from16 v0, v18

    if-ne v0, v2, :cond_ea

    .line 461
    .end local v18    # "j":I
    :cond_bf
    :goto_bf
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setPathEffect(Landroid/graphics/PathEffect;)Landroid/graphics/PathEffect;

    .line 464
    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->isDrawFilledEnabled()Z

    move-result v2

    if-eqz v2, :cond_d8

    if-lez v14, :cond_d8

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    .line 465
    invoke-virtual/range {v2 .. v7}, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->drawLinearFill(Landroid/graphics/Canvas;Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;IILcom/github/mikephil/charting/utils/Transformer;)V

    .line 467
    :cond_d8
    return-void

    .line 322
    .end local v5    # "minx":I
    .end local v6    # "maxx":I
    .end local v7    # "trans":Lcom/github/mikephil/charting/utils/Transformer;
    .end local v8    # "canvas":Landroid/graphics/Canvas;
    .end local v9    # "count":I
    .end local v10    # "diff":I
    .end local v15    # "entryFrom":Lcom/github/mikephil/charting/data/Entry;
    .end local v16    # "entryTo":Lcom/github/mikephil/charting/data/Entry;
    .end local v20    # "phaseX":F
    .end local v21    # "phaseY":F
    .end local v22    # "pointsPerEntryPair":I
    :cond_d9
    const/16 v22, 0x2

    goto/16 :goto_c

    .line 337
    .restart local v7    # "trans":Lcom/github/mikephil/charting/utils/Transformer;
    .restart local v8    # "canvas":Landroid/graphics/Canvas;
    .restart local v20    # "phaseX":F
    .restart local v21    # "phaseY":F
    .restart local v22    # "pointsPerEntryPair":I
    :cond_dd
    move-object/from16 v8, p1

    goto/16 :goto_47

    .line 340
    :cond_e1
    move-object/from16 v0, p0

    iget v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mMinX:I

    goto/16 :goto_4e

    .line 343
    .restart local v15    # "entryFrom":Lcom/github/mikephil/charting/data/Entry;
    .restart local v16    # "entryTo":Lcom/github/mikephil/charting/data/Entry;
    :cond_e7
    const/4 v10, 0x0

    goto/16 :goto_67

    .line 364
    .restart local v5    # "minx":I
    .restart local v6    # "maxx":I
    .restart local v9    # "count":I
    .restart local v10    # "diff":I
    .restart local v18    # "j":I
    :cond_ea
    move-object/from16 v0, p2

    move/from16 v1, v18

    invoke-interface {v0, v1}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v11

    .line 365
    .local v11, "e":Lcom/github/mikephil/charting/data/Entry;
    if-nez v11, :cond_f7

    .line 357
    :cond_f4
    :goto_f4
    add-int/lit8 v18, v18, 0x1

    goto :goto_b2

    .line 367
    :cond_f7
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mLineBuffer:[F

    const/4 v3, 0x0

    invoke-virtual {v11}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v4

    int-to-float v4, v4

    aput v4, v2, v3

    .line 368
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mLineBuffer:[F

    const/4 v3, 0x1

    invoke-virtual {v11}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v4

    mul-float v4, v4, v21

    aput v4, v2, v3

    .line 370
    add-int/lit8 v2, v18, 0x1

    if-ge v2, v9, :cond_21d

    .line 372
    add-int/lit8 v2, v18, 0x1

    move-object/from16 v0, p2

    invoke-interface {v0, v2}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v11

    .line 374
    if-eqz v11, :cond_bf

    .line 376
    if-eqz v17, :cond_202

    .line 377
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mLineBuffer:[F

    const/4 v3, 0x2

    invoke-virtual {v11}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v4

    int-to-float v4, v4

    aput v4, v2, v3

    .line 378
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mLineBuffer:[F

    const/4 v3, 0x3

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mLineBuffer:[F

    const/16 v25, 0x1

    aget v4, v4, v25

    aput v4, v2, v3

    .line 379
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mLineBuffer:[F

    const/4 v3, 0x4

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mLineBuffer:[F

    const/16 v25, 0x2

    aget v4, v4, v25

    aput v4, v2, v3

    .line 380
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mLineBuffer:[F

    const/4 v3, 0x5

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mLineBuffer:[F

    const/16 v25, 0x3

    aget v4, v4, v25

    aput v4, v2, v3

    .line 381
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mLineBuffer:[F

    const/4 v3, 0x6

    invoke-virtual {v11}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v4

    int-to-float v4, v4

    aput v4, v2, v3

    .line 382
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mLineBuffer:[F

    const/4 v3, 0x7

    invoke-virtual {v11}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v4

    mul-float v4, v4, v21

    aput v4, v2, v3

    .line 393
    :goto_172
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mLineBuffer:[F

    invoke-virtual {v7, v2}, Lcom/github/mikephil/charting/utils/Transformer;->pointValuesToPixel([F)V

    .line 395
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mLineBuffer:[F

    const/4 v4, 0x0

    aget v3, v3, v4

    invoke-virtual {v2, v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsRight(F)Z

    move-result v2

    if-eqz v2, :cond_bf

    .line 400
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mLineBuffer:[F

    const/4 v4, 0x2

    aget v3, v3, v4

    invoke-virtual {v2, v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsLeft(F)Z

    move-result v2

    if-eqz v2, :cond_f4

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mLineBuffer:[F

    const/4 v4, 0x1

    aget v3, v3, v4

    invoke-virtual {v2, v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsTop(F)Z

    move-result v2

    if-nez v2, :cond_1bd

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mLineBuffer:[F

    const/4 v4, 0x3

    aget v3, v3, v4

    invoke-virtual {v2, v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsBottom(F)Z

    move-result v2

    if-eqz v2, :cond_f4

    :cond_1bd
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mLineBuffer:[F

    const/4 v4, 0x1

    aget v3, v3, v4

    invoke-virtual {v2, v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsTop(F)Z

    move-result v2

    if-nez v2, :cond_1df

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mLineBuffer:[F

    const/4 v4, 0x3

    aget v3, v3, v4

    invoke-virtual {v2, v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsBottom(F)Z

    move-result v2

    if-eqz v2, :cond_f4

    .line 408
    :cond_1df
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p2

    move/from16 v1, v18

    invoke-interface {v0, v1}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getColor(I)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 410
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mLineBuffer:[F

    const/4 v3, 0x0

    mul-int/lit8 v4, v22, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    invoke-virtual {v8, v2, v3, v4, v0}, Landroid/graphics/Canvas;->drawLines([FIILandroid/graphics/Paint;)V

    goto/16 :goto_f4

    .line 384
    :cond_202
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mLineBuffer:[F

    const/4 v3, 0x2

    invoke-virtual {v11}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v4

    int-to-float v4, v4

    aput v4, v2, v3

    .line 385
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mLineBuffer:[F

    const/4 v3, 0x3

    invoke-virtual {v11}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v4

    mul-float v4, v4, v21

    aput v4, v2, v3

    goto/16 :goto_172

    .line 389
    :cond_21d
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mLineBuffer:[F

    const/4 v3, 0x2

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mLineBuffer:[F

    const/16 v25, 0x0

    aget v4, v4, v25

    aput v4, v2, v3

    .line 390
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mLineBuffer:[F

    const/4 v3, 0x3

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mLineBuffer:[F

    const/16 v25, 0x1

    aget v4, v4, v25

    aput v4, v2, v3

    goto/16 :goto_172

    .line 415
    .end local v11    # "e":Lcom/github/mikephil/charting/data/Entry;
    .end local v18    # "j":I
    :cond_23d
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mLineBuffer:[F

    array-length v2, v2

    add-int/lit8 v3, v14, -0x1

    mul-int v3, v3, v22

    move/from16 v0, v22

    invoke-static {v3, v0}, Ljava/lang/Math;->max(II)I

    move-result v3

    mul-int/lit8 v3, v3, 0x2

    if-eq v2, v3, :cond_262

    .line 416
    add-int/lit8 v2, v14, -0x1

    mul-int v2, v2, v22

    move/from16 v0, v22

    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    move-result v2

    mul-int/lit8 v2, v2, 0x2

    new-array v2, v2, [F

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mLineBuffer:[F

    .line 420
    :cond_262
    move-object/from16 v0, p2

    invoke-interface {v0, v5}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v12

    .line 422
    .local v12, "e1":Lcom/github/mikephil/charting/data/Entry;
    if-eqz v12, :cond_bf

    .line 424
    const/16 v18, 0x0

    .line 425
    .restart local v18    # "j":I
    const/4 v2, 0x1

    if-le v9, v2, :cond_293

    add-int/lit8 v24, v5, 0x1

    .local v24, "x":I
    :goto_271
    move/from16 v19, v18

    .end local v18    # "j":I
    .local v19, "j":I
    :goto_273
    move/from16 v0, v24

    if-ge v0, v9, :cond_30a

    .line 427
    if-nez v24, :cond_296

    const/4 v2, 0x0

    :goto_27a
    move-object/from16 v0, p2

    invoke-interface {v0, v2}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v12

    .line 428
    move-object/from16 v0, p2

    move/from16 v1, v24

    invoke-interface {v0, v1}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v13

    .line 430
    .local v13, "e2":Lcom/github/mikephil/charting/data/Entry;
    if-eqz v12, :cond_33c

    if-nez v13, :cond_299

    move/from16 v18, v19

    .line 425
    .end local v19    # "j":I
    .restart local v18    # "j":I
    :goto_28e
    add-int/lit8 v24, v24, 0x1

    move/from16 v19, v18

    .end local v18    # "j":I
    .restart local v19    # "j":I
    goto :goto_273

    .end local v13    # "e2":Lcom/github/mikephil/charting/data/Entry;
    .end local v19    # "j":I
    .end local v24    # "x":I
    .restart local v18    # "j":I
    :cond_293
    move/from16 v24, v5

    goto :goto_271

    .line 427
    .end local v18    # "j":I
    .restart local v19    # "j":I
    .restart local v24    # "x":I
    :cond_296
    add-int/lit8 v2, v24, -0x1

    goto :goto_27a

    .line 432
    .restart local v13    # "e2":Lcom/github/mikephil/charting/data/Entry;
    :cond_299
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mLineBuffer:[F

    add-int/lit8 v18, v19, 0x1

    .end local v19    # "j":I
    .restart local v18    # "j":I
    invoke-virtual {v12}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v3

    int-to-float v3, v3

    aput v3, v2, v19

    .line 433
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mLineBuffer:[F

    add-int/lit8 v19, v18, 0x1

    .end local v18    # "j":I
    .restart local v19    # "j":I
    invoke-virtual {v12}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v3

    mul-float v3, v3, v21

    aput v3, v2, v18

    .line 435
    if-eqz v17, :cond_2ec

    .line 436
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mLineBuffer:[F

    add-int/lit8 v18, v19, 0x1

    .end local v19    # "j":I
    .restart local v18    # "j":I
    invoke-virtual {v13}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v3

    int-to-float v3, v3

    aput v3, v2, v19

    .line 437
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mLineBuffer:[F

    add-int/lit8 v19, v18, 0x1

    .end local v18    # "j":I
    .restart local v19    # "j":I
    invoke-virtual {v12}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v3

    mul-float v3, v3, v21

    aput v3, v2, v18

    .line 438
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mLineBuffer:[F

    add-int/lit8 v18, v19, 0x1

    .end local v19    # "j":I
    .restart local v18    # "j":I
    invoke-virtual {v13}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v3

    int-to-float v3, v3

    aput v3, v2, v19

    .line 439
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mLineBuffer:[F

    add-int/lit8 v19, v18, 0x1

    .end local v18    # "j":I
    .restart local v19    # "j":I
    invoke-virtual {v12}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v3

    mul-float v3, v3, v21

    aput v3, v2, v18

    :cond_2ec
    move/from16 v18, v19

    .line 442
    .end local v19    # "j":I
    .restart local v18    # "j":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mLineBuffer:[F

    add-int/lit8 v19, v18, 0x1

    .end local v18    # "j":I
    .restart local v19    # "j":I
    invoke-virtual {v13}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v3

    int-to-float v3, v3

    aput v3, v2, v18

    .line 443
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mLineBuffer:[F

    add-int/lit8 v18, v19, 0x1

    .end local v19    # "j":I
    .restart local v18    # "j":I
    invoke-virtual {v13}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v3

    mul-float v3, v3, v21

    aput v3, v2, v19

    goto :goto_28e

    .line 446
    .end local v13    # "e2":Lcom/github/mikephil/charting/data/Entry;
    .end local v18    # "j":I
    .restart local v19    # "j":I
    :cond_30a
    if-lez v19, :cond_bf

    .line 447
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mLineBuffer:[F

    invoke-virtual {v7, v2}, Lcom/github/mikephil/charting/utils/Transformer;->pointValuesToPixel([F)V

    .line 449
    sub-int v2, v9, v5

    add-int/lit8 v2, v2, -0x1

    mul-int v2, v2, v22

    move/from16 v0, v22

    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    move-result v2

    mul-int/lit8 v23, v2, 0x2

    .line 453
    .local v23, "size":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getColor()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 455
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mLineBuffer:[F

    const/4 v3, 0x0

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    move/from16 v0, v23

    invoke-virtual {v8, v2, v3, v0, v4}, Landroid/graphics/Canvas;->drawLines([FIILandroid/graphics/Paint;)V

    goto/16 :goto_bf

    .end local v23    # "size":I
    .restart local v13    # "e2":Lcom/github/mikephil/charting/data/Entry;
    :cond_33c
    move/from16 v18, v19

    .end local v19    # "j":I
    .restart local v18    # "j":I
    goto/16 :goto_28e
.end method

.method protected drawLinearFill(Landroid/graphics/Canvas;Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;IILcom/github/mikephil/charting/utils/Transformer;)V
    .registers 10
    .param p1, "c"    # Landroid/graphics/Canvas;
    .param p2, "dataSet"    # Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;
    .param p3, "minx"    # I
    .param p4, "maxx"    # I
    .param p5, "trans"    # Lcom/github/mikephil/charting/utils/Transformer;

    .prologue
    .line 473
    invoke-direct {p0, p2, p3, p4}, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->generateFilledPath(Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;II)Landroid/graphics/Path;

    move-result-object v1

    .line 476
    .local v1, "filled":Landroid/graphics/Path;
    invoke-virtual {p5, v1}, Lcom/github/mikephil/charting/utils/Transformer;->pathValueToPixel(Landroid/graphics/Path;)V

    .line 478
    invoke-interface {p2}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getFillDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 479
    .local v0, "drawable":Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_11

    .line 481
    invoke-virtual {p0, p1, v1, v0}, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->drawFilledPath(Landroid/graphics/Canvas;Landroid/graphics/Path;Landroid/graphics/drawable/Drawable;)V

    .line 486
    :goto_10
    return-void

    .line 484
    :cond_11
    invoke-interface {p2}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getFillColor()I

    move-result v2

    invoke-interface {p2}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getFillAlpha()I

    move-result v3

    invoke-virtual {p0, p1, v1, v2, v3}, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->drawFilledPath(Landroid/graphics/Canvas;Landroid/graphics/Path;II)V

    goto :goto_10
.end method

.method public drawValues(Landroid/graphics/Canvas;)V
    .registers 28
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    .line 537
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/LineDataProvider;

    invoke-interface {v4}, Lcom/github/mikephil/charting/interfaces/dataprovider/LineDataProvider;->getLineData()Lcom/github/mikephil/charting/data/LineData;

    move-result-object v4

    invoke-virtual {v4}, Lcom/github/mikephil/charting/data/LineData;->getYValCount()I

    move-result v4

    int-to-float v4, v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/LineDataProvider;

    invoke-interface {v5}, Lcom/github/mikephil/charting/interfaces/dataprovider/LineDataProvider;->getMaxVisibleCount()I

    move-result v5

    int-to-float v5, v5

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v8}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getScaleX()F

    move-result v8

    mul-float/2addr v5, v8

    cmpg-float v4, v4, v5

    if-gez v4, :cond_12f

    .line 540
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/LineDataProvider;

    invoke-interface {v4}, Lcom/github/mikephil/charting/interfaces/dataprovider/LineDataProvider;->getLineData()Lcom/github/mikephil/charting/data/LineData;

    move-result-object v4

    invoke-virtual {v4}, Lcom/github/mikephil/charting/data/LineData;->getDataSets()Ljava/util/List;

    move-result-object v17

    .line 542
    .local v17, "dataSets":Ljava/util/List;, "Ljava/util/List<Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;>;"
    const/4 v13, 0x0

    .local v13, "i":I
    :goto_30
    invoke-interface/range {v17 .. v17}, Ljava/util/List;->size()I

    move-result v4

    if-ge v13, v4, :cond_12f

    .line 544
    move-object/from16 v0, v17

    invoke-interface {v0, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;

    .line 546
    .local v3, "dataSet":Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;
    invoke-interface {v3}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->isDrawValuesEnabled()Z

    move-result v4

    if-eqz v4, :cond_4a

    invoke-interface {v3}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getEntryCount()I

    move-result v4

    if-nez v4, :cond_4d

    .line 542
    :cond_4a
    add-int/lit8 v13, v13, 0x1

    goto :goto_30

    .line 550
    :cond_4d
    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->applyValueTextStyle(Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;)V

    .line 552
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/LineDataProvider;

    invoke-interface {v3}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getAxisDependency()Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    move-result-object v5

    invoke-interface {v4, v5}, Lcom/github/mikephil/charting/interfaces/dataprovider/LineDataProvider;->getTransformer(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/Transformer;

    move-result-object v2

    .line 555
    .local v2, "trans":Lcom/github/mikephil/charting/utils/Transformer;
    invoke-interface {v3}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getCircleRadius()F

    move-result v4

    const/high16 v5, 0x3fe00000    # 1.75f

    mul-float/2addr v4, v5

    float-to-int v0, v4

    move/from16 v24, v0

    .line 557
    .local v24, "valOffset":I
    invoke-interface {v3}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->isDrawCirclesEnabled()Z

    move-result v4

    if-nez v4, :cond_70

    .line 558
    div-int/lit8 v24, v24, 0x2

    .line 560
    :cond_70
    invoke-interface {v3}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getEntryCount()I

    move-result v19

    .line 562
    .local v19, "entryCount":I
    move-object/from16 v0, p0

    iget v4, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mMinX:I

    if-gez v4, :cond_104

    const/4 v4, 0x0

    :goto_7b
    sget-object v5, Lcom/github/mikephil/charting/data/DataSet$Rounding;->DOWN:Lcom/github/mikephil/charting/data/DataSet$Rounding;

    invoke-interface {v3, v4, v5}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getEntryForXIndex(ILcom/github/mikephil/charting/data/DataSet$Rounding;)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v20

    .line 564
    .local v20, "entryFrom":Lcom/github/mikephil/charting/data/Entry;
    move-object/from16 v0, p0

    iget v4, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mMaxX:I

    sget-object v5, Lcom/github/mikephil/charting/data/DataSet$Rounding;->UP:Lcom/github/mikephil/charting/data/DataSet$Rounding;

    invoke-interface {v3, v4, v5}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getEntryForXIndex(ILcom/github/mikephil/charting/data/DataSet$Rounding;)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v21

    .line 566
    .local v21, "entryTo":Lcom/github/mikephil/charting/data/Entry;
    move-object/from16 v0, v20

    move-object/from16 v1, v21

    if-ne v0, v1, :cond_10a

    const/16 v18, 0x1

    .line 567
    .local v18, "diff":I
    :goto_93
    invoke-interface {v3}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getMode()Lcom/github/mikephil/charting/data/LineDataSet$Mode;

    move-result-object v4

    sget-object v5, Lcom/github/mikephil/charting/data/LineDataSet$Mode;->CUBIC_BEZIER:Lcom/github/mikephil/charting/data/LineDataSet$Mode;

    if-ne v4, v5, :cond_9d

    .line 568
    add-int/lit8 v18, v18, 0x1

    .line 570
    :cond_9d
    move-object/from16 v0, v20

    invoke-interface {v3, v0}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getEntryIndex(Lcom/github/mikephil/charting/data/Entry;)I

    move-result v4

    sub-int v4, v4, v18

    const/4 v5, 0x0

    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    move-result v6

    .line 571
    .local v6, "minx":I
    add-int/lit8 v4, v6, 0x2

    move-object/from16 v0, v21

    invoke-interface {v3, v0}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getEntryIndex(Lcom/github/mikephil/charting/data/Entry;)I

    move-result v5

    add-int/lit8 v5, v5, 0x1

    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    move-result v4

    move/from16 v0, v19

    invoke-static {v4, v0}, Ljava/lang/Math;->min(II)I

    move-result v7

    .line 573
    .local v7, "maxx":I
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseX()F

    move-result v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v5}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseY()F

    move-result v5

    invoke-virtual/range {v2 .. v7}, Lcom/github/mikephil/charting/utils/Transformer;->generateTransformedValuesLine(Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;FFII)[F

    move-result-object v23

    .line 576
    .local v23, "positions":[F
    const/16 v22, 0x0

    .local v22, "j":I
    :goto_d4
    move-object/from16 v0, v23

    array-length v4, v0

    move/from16 v0, v22

    if-ge v0, v4, :cond_4a

    .line 578
    aget v14, v23, v22

    .line 579
    .local v14, "x":F
    add-int/lit8 v4, v22, 0x1

    aget v25, v23, v4

    .line 581
    .local v25, "y":F
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v4, v14}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsRight(F)Z

    move-result v4

    if-eqz v4, :cond_4a

    .line 584
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v4, v14}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsLeft(F)Z

    move-result v4

    if-eqz v4, :cond_101

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    move/from16 v0, v25

    invoke-virtual {v4, v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsY(F)Z

    move-result v4

    if-nez v4, :cond_10d

    .line 576
    :cond_101
    :goto_101
    add-int/lit8 v22, v22, 0x2

    goto :goto_d4

    .line 562
    .end local v6    # "minx":I
    .end local v7    # "maxx":I
    .end local v14    # "x":F
    .end local v18    # "diff":I
    .end local v20    # "entryFrom":Lcom/github/mikephil/charting/data/Entry;
    .end local v21    # "entryTo":Lcom/github/mikephil/charting/data/Entry;
    .end local v22    # "j":I
    .end local v23    # "positions":[F
    .end local v25    # "y":F
    :cond_104
    move-object/from16 v0, p0

    iget v4, v0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mMinX:I

    goto/16 :goto_7b

    .line 566
    .restart local v20    # "entryFrom":Lcom/github/mikephil/charting/data/Entry;
    .restart local v21    # "entryTo":Lcom/github/mikephil/charting/data/Entry;
    :cond_10a
    const/16 v18, 0x0

    goto :goto_93

    .line 587
    .restart local v6    # "minx":I
    .restart local v7    # "maxx":I
    .restart local v14    # "x":F
    .restart local v18    # "diff":I
    .restart local v22    # "j":I
    .restart local v23    # "positions":[F
    .restart local v25    # "y":F
    :cond_10d
    div-int/lit8 v4, v22, 0x2

    add-int/2addr v4, v6

    invoke-interface {v3, v4}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v12

    .line 589
    .local v12, "entry":Lcom/github/mikephil/charting/data/Entry;
    invoke-interface {v3}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getValueFormatter()Lcom/github/mikephil/charting/formatter/ValueFormatter;

    move-result-object v10

    invoke-virtual {v12}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v11

    move/from16 v0, v24

    int-to-float v4, v0

    sub-float v15, v25, v4

    div-int/lit8 v4, v22, 0x2

    invoke-interface {v3, v4}, Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;->getValueTextColor(I)I

    move-result v16

    move-object/from16 v8, p0

    move-object/from16 v9, p1

    invoke-virtual/range {v8 .. v16}, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->drawValue(Landroid/graphics/Canvas;Lcom/github/mikephil/charting/formatter/ValueFormatter;FLcom/github/mikephil/charting/data/Entry;IFFI)V

    goto :goto_101

    .line 594
    .end local v2    # "trans":Lcom/github/mikephil/charting/utils/Transformer;
    .end local v3    # "dataSet":Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;
    .end local v6    # "minx":I
    .end local v7    # "maxx":I
    .end local v12    # "entry":Lcom/github/mikephil/charting/data/Entry;
    .end local v13    # "i":I
    .end local v14    # "x":F
    .end local v17    # "dataSets":Ljava/util/List;, "Ljava/util/List<Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;>;"
    .end local v18    # "diff":I
    .end local v19    # "entryCount":I
    .end local v20    # "entryFrom":Lcom/github/mikephil/charting/data/Entry;
    .end local v21    # "entryTo":Lcom/github/mikephil/charting/data/Entry;
    .end local v22    # "j":I
    .end local v23    # "positions":[F
    .end local v24    # "valOffset":I
    .end local v25    # "y":F
    :cond_12f
    return-void
.end method

.method public getBitmapConfig()Landroid/graphics/Bitmap$Config;
    .registers 2

    .prologue
    .line 773
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mBitmapConfig:Landroid/graphics/Bitmap$Config;

    return-object v0
.end method

.method public initBuffers()V
    .registers 1

    .prologue
    .line 69
    return-void
.end method

.method public releaseBitmap()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 780
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mBitmapCanvas:Landroid/graphics/Canvas;

    if-eqz v0, :cond_c

    .line 781
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mBitmapCanvas:Landroid/graphics/Canvas;

    invoke-virtual {v0, v1}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 782
    iput-object v1, p0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mBitmapCanvas:Landroid/graphics/Canvas;

    .line 784
    :cond_c
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mDrawBitmap:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_22

    .line 785
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mDrawBitmap:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 786
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mDrawBitmap:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->clear()V

    .line 787
    iput-object v1, p0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mDrawBitmap:Ljava/lang/ref/WeakReference;

    .line 789
    :cond_22
    return-void
.end method

.method public setBitmapConfig(Landroid/graphics/Bitmap$Config;)V
    .registers 2
    .param p1, "config"    # Landroid/graphics/Bitmap$Config;

    .prologue
    .line 763
    iput-object p1, p0, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mBitmapConfig:Landroid/graphics/Bitmap$Config;

    .line 764
    invoke-virtual {p0}, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->releaseBitmap()V

    .line 765
    return-void
.end method
