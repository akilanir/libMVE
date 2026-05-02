.class public Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;
.super Lcom/github/mikephil/charting/renderer/LineScatterCandleRadarRenderer;
.source "CandleStickChartRenderer.java"


# instance fields
.field private mBodyBuffers:[F

.field protected mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/CandleDataProvider;

.field private mCloseBuffers:[F

.field private mOpenBuffers:[F

.field private mRangeBuffers:[F

.field private mShadowBuffers:[F


# direct methods
.method public constructor <init>(Lcom/github/mikephil/charting/interfaces/dataprovider/CandleDataProvider;Lcom/github/mikephil/charting/animation/ChartAnimator;Lcom/github/mikephil/charting/utils/ViewPortHandler;)V
    .registers 6
    .param p1, "chart"    # Lcom/github/mikephil/charting/interfaces/dataprovider/CandleDataProvider;
    .param p2, "animator"    # Lcom/github/mikephil/charting/animation/ChartAnimator;
    .param p3, "viewPortHandler"    # Lcom/github/mikephil/charting/utils/ViewPortHandler;

    .prologue
    const/4 v1, 0x4

    .line 32
    invoke-direct {p0, p2, p3}, Lcom/github/mikephil/charting/renderer/LineScatterCandleRadarRenderer;-><init>(Lcom/github/mikephil/charting/animation/ChartAnimator;Lcom/github/mikephil/charting/utils/ViewPortHandler;)V

    .line 24
    const/16 v0, 0x8

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mShadowBuffers:[F

    .line 25
    new-array v0, v1, [F

    iput-object v0, p0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mBodyBuffers:[F

    .line 26
    new-array v0, v1, [F

    iput-object v0, p0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mRangeBuffers:[F

    .line 27
    new-array v0, v1, [F

    iput-object v0, p0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mOpenBuffers:[F

    .line 28
    new-array v0, v1, [F

    iput-object v0, p0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mCloseBuffers:[F

    .line 33
    iput-object p1, p0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/CandleDataProvider;

    .line 34
    return-void
.end method


# virtual methods
.method public drawData(Landroid/graphics/Canvas;)V
    .registers 6
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    .line 44
    iget-object v3, p0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/CandleDataProvider;

    invoke-interface {v3}, Lcom/github/mikephil/charting/interfaces/dataprovider/CandleDataProvider;->getCandleData()Lcom/github/mikephil/charting/data/CandleData;

    move-result-object v0

    .line 46
    .local v0, "candleData":Lcom/github/mikephil/charting/data/CandleData;
    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/CandleData;->getDataSets()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_e
    :goto_e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;

    .line 48
    .local v2, "set":Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;
    invoke-interface {v2}, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;->isVisible()Z

    move-result v3

    if-eqz v3, :cond_e

    invoke-interface {v2}, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;->getEntryCount()I

    move-result v3

    if-lez v3, :cond_e

    .line 49
    invoke-virtual {p0, p1, v2}, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->drawDataSet(Landroid/graphics/Canvas;Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;)V

    goto :goto_e

    .line 51
    .end local v2    # "set":Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;
    :cond_2a
    return-void
.end method

.method protected drawDataSet(Landroid/graphics/Canvas;Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;)V
    .registers 27
    .param p1, "c"    # Landroid/graphics/Canvas;
    .param p2, "dataSet"    # Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;

    .prologue
    .line 56
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/CandleDataProvider;

    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;->getAxisDependency()Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/github/mikephil/charting/interfaces/dataprovider/CandleDataProvider;->getTransformer(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/Transformer;

    move-result-object v22

    .line 58
    .local v22, "trans":Lcom/github/mikephil/charting/utils/Transformer;
    const/4 v2, 0x0

    const/high16 v3, 0x3f800000    # 1.0f

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseX()F

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(FF)F

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(FF)F

    move-result v19

    .line 59
    .local v19, "phaseX":F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseY()F

    move-result v20

    .line 60
    .local v20, "phaseY":F
    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;->getBarSpace()F

    move-result v9

    .line 61
    .local v9, "barSpace":F
    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;->getShowCandleBar()Z

    move-result v21

    .line 63
    .local v21, "showCandleBar":Z
    move-object/from16 v0, p0

    iget v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mMinX:I

    const/4 v3, 0x0

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v17

    .line 64
    .local v17, "minx":I
    move-object/from16 v0, p0

    iget v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mMaxX:I

    add-int/lit8 v2, v2, 0x1

    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;->getEntryCount()I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v16

    .line 66
    .local v16, "maxx":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;->getShadowWidth()F

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 69
    move/from16 v14, v17

    .line 70
    .local v14, "j":I
    sub-int v2, v16, v17

    int-to-float v2, v2

    mul-float v2, v2, v19

    move/from16 v0, v17

    int-to-float v3, v0

    add-float/2addr v2, v3

    float-to-double v2, v2

    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v2

    double-to-int v11, v2

    .line 71
    .local v11, "count":I
    :goto_62
    if-ge v14, v11, :cond_45c

    .line 75
    move-object/from16 v0, p2

    invoke-interface {v0, v14}, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v12

    check-cast v12, Lcom/github/mikephil/charting/data/CandleEntry;

    .line 77
    .local v12, "e":Lcom/github/mikephil/charting/data/CandleEntry;
    invoke-virtual {v12}, Lcom/github/mikephil/charting/data/CandleEntry;->getXIndex()I

    move-result v23

    .line 79
    .local v23, "xIndex":I
    move/from16 v0, v23

    move/from16 v1, v17

    if-lt v0, v1, :cond_7c

    move/from16 v0, v23

    move/from16 v1, v16

    if-lt v0, v1, :cond_7f

    .line 72
    :cond_7c
    :goto_7c
    add-int/lit8 v14, v14, 0x1

    goto :goto_62

    .line 82
    :cond_7f
    invoke-virtual {v12}, Lcom/github/mikephil/charting/data/CandleEntry;->getOpen()F

    move-result v18

    .line 83
    .local v18, "open":F
    invoke-virtual {v12}, Lcom/github/mikephil/charting/data/CandleEntry;->getClose()F

    move-result v10

    .line 84
    .local v10, "close":F
    invoke-virtual {v12}, Lcom/github/mikephil/charting/data/CandleEntry;->getHigh()F

    move-result v13

    .line 85
    .local v13, "high":F
    invoke-virtual {v12}, Lcom/github/mikephil/charting/data/CandleEntry;->getLow()F

    move-result v15

    .line 87
    .local v15, "low":F
    if-eqz v21, :cond_307

    .line 90
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mShadowBuffers:[F

    const/4 v3, 0x0

    move/from16 v0, v23

    int-to-float v4, v0

    aput v4, v2, v3

    .line 91
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mShadowBuffers:[F

    const/4 v3, 0x2

    move/from16 v0, v23

    int-to-float v4, v0

    aput v4, v2, v3

    .line 92
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mShadowBuffers:[F

    const/4 v3, 0x4

    move/from16 v0, v23

    int-to-float v4, v0

    aput v4, v2, v3

    .line 93
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mShadowBuffers:[F

    const/4 v3, 0x6

    move/from16 v0, v23

    int-to-float v4, v0

    aput v4, v2, v3

    .line 95
    cmpl-float v2, v18, v10

    if-lez v2, :cond_1a3

    .line 96
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mShadowBuffers:[F

    const/4 v3, 0x1

    mul-float v4, v13, v20

    aput v4, v2, v3

    .line 97
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mShadowBuffers:[F

    const/4 v3, 0x3

    mul-float v4, v18, v20

    aput v4, v2, v3

    .line 98
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mShadowBuffers:[F

    const/4 v3, 0x5

    mul-float v4, v15, v20

    aput v4, v2, v3

    .line 99
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mShadowBuffers:[F

    const/4 v3, 0x7

    mul-float v4, v10, v20

    aput v4, v2, v3

    .line 112
    :goto_e1
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mShadowBuffers:[F

    move-object/from16 v0, v22

    invoke-virtual {v0, v2}, Lcom/github/mikephil/charting/utils/Transformer;->pointValuesToPixel([F)V

    .line 116
    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;->getShadowColorSameAsCandle()Z

    move-result v2

    if-eqz v2, :cond_23c

    .line 118
    cmpl-float v2, v18, v10

    if-lez v2, :cond_1fe

    .line 119
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;->getDecreasingColor()I

    move-result v2

    const v4, 0x112233

    if-ne v2, v4, :cond_1f8

    move-object/from16 v0, p2

    invoke-interface {v0, v14}, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;->getColor(I)I

    move-result v2

    :goto_107
    invoke-virtual {v3, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 147
    :goto_10a
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 149
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mShadowBuffers:[F

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Canvas;->drawLines([FLandroid/graphics/Paint;)V

    .line 153
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mBodyBuffers:[F

    const/4 v3, 0x0

    move/from16 v0, v23

    int-to-float v4, v0

    const/high16 v5, 0x3f000000    # 0.5f

    sub-float/2addr v4, v5

    add-float/2addr v4, v9

    aput v4, v2, v3

    .line 154
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mBodyBuffers:[F

    const/4 v3, 0x1

    mul-float v4, v10, v20

    aput v4, v2, v3

    .line 155
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mBodyBuffers:[F

    const/4 v3, 0x2

    move/from16 v0, v23

    int-to-float v4, v0

    const/high16 v5, 0x3f000000    # 0.5f

    add-float/2addr v4, v5

    sub-float/2addr v4, v9

    aput v4, v2, v3

    .line 156
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mBodyBuffers:[F

    const/4 v3, 0x3

    mul-float v4, v18, v20

    aput v4, v2, v3

    .line 158
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mBodyBuffers:[F

    move-object/from16 v0, v22

    invoke-virtual {v0, v2}, Lcom/github/mikephil/charting/utils/Transformer;->pointValuesToPixel([F)V

    .line 161
    cmpl-float v2, v18, v10

    if-lez v2, :cond_266

    .line 163
    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;->getDecreasingColor()I

    move-result v2

    const v3, 0x112233

    if-ne v2, v3, :cond_259

    .line 164
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p2

    invoke-interface {v0, v14}, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;->getColor(I)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 169
    :goto_171
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;->getDecreasingPaintStyle()Landroid/graphics/Paint$Style;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 171
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mBodyBuffers:[F

    const/4 v3, 0x0

    aget v3, v2, v3

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mBodyBuffers:[F

    const/4 v4, 0x3

    aget v4, v2, v4

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mBodyBuffers:[F

    const/4 v5, 0x2

    aget v5, v2, v5

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mBodyBuffers:[F

    const/4 v6, 0x1

    aget v6, v2, v6

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_7c

    .line 100
    :cond_1a3
    cmpg-float v2, v18, v10

    if-gez v2, :cond_1cd

    .line 101
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mShadowBuffers:[F

    const/4 v3, 0x1

    mul-float v4, v13, v20

    aput v4, v2, v3

    .line 102
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mShadowBuffers:[F

    const/4 v3, 0x3

    mul-float v4, v10, v20

    aput v4, v2, v3

    .line 103
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mShadowBuffers:[F

    const/4 v3, 0x5

    mul-float v4, v15, v20

    aput v4, v2, v3

    .line 104
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mShadowBuffers:[F

    const/4 v3, 0x7

    mul-float v4, v18, v20

    aput v4, v2, v3

    goto/16 :goto_e1

    .line 106
    :cond_1cd
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mShadowBuffers:[F

    const/4 v3, 0x1

    mul-float v4, v13, v20

    aput v4, v2, v3

    .line 107
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mShadowBuffers:[F

    const/4 v3, 0x3

    mul-float v4, v18, v20

    aput v4, v2, v3

    .line 108
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mShadowBuffers:[F

    const/4 v3, 0x5

    mul-float v4, v15, v20

    aput v4, v2, v3

    .line 109
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mShadowBuffers:[F

    const/4 v3, 0x7

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mShadowBuffers:[F

    const/4 v5, 0x3

    aget v4, v4, v5

    aput v4, v2, v3

    goto/16 :goto_e1

    .line 119
    :cond_1f8
    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;->getDecreasingColor()I

    move-result v2

    goto/16 :goto_107

    .line 125
    :cond_1fe
    cmpg-float v2, v18, v10

    if-gez v2, :cond_21f

    .line 126
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;->getIncreasingColor()I

    move-result v2

    const v4, 0x112233

    if-ne v2, v4, :cond_21a

    move-object/from16 v0, p2

    invoke-interface {v0, v14}, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;->getColor(I)I

    move-result v2

    :goto_215
    invoke-virtual {v3, v2}, Landroid/graphics/Paint;->setColor(I)V

    goto/16 :goto_10a

    :cond_21a
    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;->getIncreasingColor()I

    move-result v2

    goto :goto_215

    .line 133
    :cond_21f
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;->getNeutralColor()I

    move-result v2

    const v4, 0x112233

    if-ne v2, v4, :cond_237

    move-object/from16 v0, p2

    invoke-interface {v0, v14}, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;->getColor(I)I

    move-result v2

    :goto_232
    invoke-virtual {v3, v2}, Landroid/graphics/Paint;->setColor(I)V

    goto/16 :goto_10a

    :cond_237
    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;->getNeutralColor()I

    move-result v2

    goto :goto_232

    .line 140
    :cond_23c
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;->getShadowColor()I

    move-result v2

    const v4, 0x112233

    if-ne v2, v4, :cond_254

    move-object/from16 v0, p2

    invoke-interface {v0, v14}, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;->getColor(I)I

    move-result v2

    :goto_24f
    invoke-virtual {v3, v2}, Landroid/graphics/Paint;->setColor(I)V

    goto/16 :goto_10a

    :cond_254
    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;->getShadowColor()I

    move-result v2

    goto :goto_24f

    .line 166
    :cond_259
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;->getDecreasingColor()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    goto/16 :goto_171

    .line 176
    :cond_266
    cmpg-float v2, v18, v10

    if-gez v2, :cond_2be

    .line 178
    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;->getIncreasingColor()I

    move-result v2

    const v3, 0x112233

    if-ne v2, v3, :cond_2b2

    .line 179
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p2

    invoke-interface {v0, v14}, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;->getColor(I)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 184
    :goto_280
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;->getIncreasingPaintStyle()Landroid/graphics/Paint$Style;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 186
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mBodyBuffers:[F

    const/4 v3, 0x0

    aget v3, v2, v3

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mBodyBuffers:[F

    const/4 v4, 0x1

    aget v4, v2, v4

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mBodyBuffers:[F

    const/4 v5, 0x2

    aget v5, v2, v5

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mBodyBuffers:[F

    const/4 v6, 0x3

    aget v6, v2, v6

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_7c

    .line 181
    :cond_2b2
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;->getIncreasingColor()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    goto :goto_280

    .line 192
    :cond_2be
    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;->getNeutralColor()I

    move-result v2

    const v3, 0x112233

    if-ne v2, v3, :cond_2fb

    .line 193
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p2

    invoke-interface {v0, v14}, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;->getColor(I)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 198
    :goto_2d4
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mBodyBuffers:[F

    const/4 v3, 0x0

    aget v3, v2, v3

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mBodyBuffers:[F

    const/4 v4, 0x1

    aget v4, v2, v4

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mBodyBuffers:[F

    const/4 v5, 0x2

    aget v5, v2, v5

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mBodyBuffers:[F

    const/4 v6, 0x3

    aget v6, v2, v6

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_7c

    .line 195
    :cond_2fb
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;->getNeutralColor()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    goto :goto_2d4

    .line 205
    :cond_307
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mRangeBuffers:[F

    const/4 v3, 0x0

    move/from16 v0, v23

    int-to-float v4, v0

    aput v4, v2, v3

    .line 206
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mRangeBuffers:[F

    const/4 v3, 0x1

    mul-float v4, v13, v20

    aput v4, v2, v3

    .line 207
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mRangeBuffers:[F

    const/4 v3, 0x2

    move/from16 v0, v23

    int-to-float v4, v0

    aput v4, v2, v3

    .line 208
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mRangeBuffers:[F

    const/4 v3, 0x3

    mul-float v4, v15, v20

    aput v4, v2, v3

    .line 210
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mOpenBuffers:[F

    const/4 v3, 0x0

    move/from16 v0, v23

    int-to-float v4, v0

    const/high16 v5, 0x3f000000    # 0.5f

    sub-float/2addr v4, v5

    add-float/2addr v4, v9

    aput v4, v2, v3

    .line 211
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mOpenBuffers:[F

    const/4 v3, 0x1

    mul-float v4, v18, v20

    aput v4, v2, v3

    .line 212
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mOpenBuffers:[F

    const/4 v3, 0x2

    move/from16 v0, v23

    int-to-float v4, v0

    aput v4, v2, v3

    .line 213
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mOpenBuffers:[F

    const/4 v3, 0x3

    mul-float v4, v18, v20

    aput v4, v2, v3

    .line 215
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mCloseBuffers:[F

    const/4 v3, 0x0

    move/from16 v0, v23

    int-to-float v4, v0

    const/high16 v5, 0x3f000000    # 0.5f

    add-float/2addr v4, v5

    sub-float/2addr v4, v9

    aput v4, v2, v3

    .line 216
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mCloseBuffers:[F

    const/4 v3, 0x1

    mul-float v4, v10, v20

    aput v4, v2, v3

    .line 217
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mCloseBuffers:[F

    const/4 v3, 0x2

    move/from16 v0, v23

    int-to-float v4, v0

    aput v4, v2, v3

    .line 218
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mCloseBuffers:[F

    const/4 v3, 0x3

    mul-float v4, v10, v20

    aput v4, v2, v3

    .line 220
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mRangeBuffers:[F

    move-object/from16 v0, v22

    invoke-virtual {v0, v2}, Lcom/github/mikephil/charting/utils/Transformer;->pointValuesToPixel([F)V

    .line 221
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mOpenBuffers:[F

    move-object/from16 v0, v22

    invoke-virtual {v0, v2}, Lcom/github/mikephil/charting/utils/Transformer;->pointValuesToPixel([F)V

    .line 222
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mCloseBuffers:[F

    move-object/from16 v0, v22

    invoke-virtual {v0, v2}, Lcom/github/mikephil/charting/utils/Transformer;->pointValuesToPixel([F)V

    .line 227
    cmpl-float v2, v18, v10

    if-lez v2, :cond_42c

    .line 228
    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;->getDecreasingColor()I

    move-result v2

    const v3, 0x112233

    if-ne v2, v3, :cond_427

    move-object/from16 v0, p2

    invoke-interface {v0, v14}, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;->getColor(I)I

    move-result v8

    .line 240
    .local v8, "barColor":I
    :goto_3af
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    invoke-virtual {v2, v8}, Landroid/graphics/Paint;->setColor(I)V

    .line 241
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mRangeBuffers:[F

    const/4 v3, 0x0

    aget v3, v2, v3

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mRangeBuffers:[F

    const/4 v4, 0x1

    aget v4, v2, v4

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mRangeBuffers:[F

    const/4 v5, 0x2

    aget v5, v2, v5

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mRangeBuffers:[F

    const/4 v6, 0x3

    aget v6, v2, v6

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 245
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mOpenBuffers:[F

    const/4 v3, 0x0

    aget v3, v2, v3

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mOpenBuffers:[F

    const/4 v4, 0x1

    aget v4, v2, v4

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mOpenBuffers:[F

    const/4 v5, 0x2

    aget v5, v2, v5

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mOpenBuffers:[F

    const/4 v6, 0x3

    aget v6, v2, v6

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 249
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mCloseBuffers:[F

    const/4 v3, 0x0

    aget v3, v2, v3

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mCloseBuffers:[F

    const/4 v4, 0x1

    aget v4, v2, v4

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mCloseBuffers:[F

    const/4 v5, 0x2

    aget v5, v2, v5

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mCloseBuffers:[F

    const/4 v6, 0x3

    aget v6, v2, v6

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_7c

    .line 228
    .end local v8    # "barColor":I
    :cond_427
    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;->getDecreasingColor()I

    move-result v8

    goto :goto_3af

    .line 231
    :cond_42c
    cmpg-float v2, v18, v10

    if-gez v2, :cond_446

    .line 232
    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;->getIncreasingColor()I

    move-result v2

    const v3, 0x112233

    if-ne v2, v3, :cond_441

    move-object/from16 v0, p2

    invoke-interface {v0, v14}, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;->getColor(I)I

    move-result v8

    .restart local v8    # "barColor":I
    :goto_43f
    goto/16 :goto_3af

    .end local v8    # "barColor":I
    :cond_441
    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;->getIncreasingColor()I

    move-result v8

    goto :goto_43f

    .line 236
    :cond_446
    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;->getNeutralColor()I

    move-result v2

    const v3, 0x112233

    if-ne v2, v3, :cond_457

    move-object/from16 v0, p2

    invoke-interface {v0, v14}, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;->getColor(I)I

    move-result v8

    .restart local v8    # "barColor":I
    :goto_455
    goto/16 :goto_3af

    .end local v8    # "barColor":I
    :cond_457
    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;->getNeutralColor()I

    move-result v8

    goto :goto_455

    .line 256
    .end local v10    # "close":F
    .end local v12    # "e":Lcom/github/mikephil/charting/data/CandleEntry;
    .end local v13    # "high":F
    .end local v15    # "low":F
    .end local v18    # "open":F
    .end local v23    # "xIndex":I
    :cond_45c
    return-void
.end method

.method public drawExtras(Landroid/graphics/Canvas;)V
    .registers 2
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    .line 308
    return-void
.end method

.method public drawHighlighted(Landroid/graphics/Canvas;[Lcom/github/mikephil/charting/highlight/Highlight;)V
    .registers 22
    .param p1, "c"    # Landroid/graphics/Canvas;
    .param p2, "indices"    # [Lcom/github/mikephil/charting/highlight/Highlight;

    .prologue
    .line 313
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/CandleDataProvider;

    move-object/from16 v17, v0

    invoke-interface/range {v17 .. v17}, Lcom/github/mikephil/charting/interfaces/dataprovider/CandleDataProvider;->getCandleData()Lcom/github/mikephil/charting/data/CandleData;

    move-result-object v3

    .line 315
    .local v3, "candleData":Lcom/github/mikephil/charting/data/CandleData;
    move-object/from16 v2, p2

    .local v2, "arr$":[Lcom/github/mikephil/charting/highlight/Highlight;
    array-length v9, v2

    .local v9, "len$":I
    const/4 v8, 0x0

    .local v8, "i$":I
    :goto_e
    if-ge v8, v9, :cond_ce

    aget-object v6, v2, v8

    .line 317
    .local v6, "high":Lcom/github/mikephil/charting/highlight/Highlight;
    invoke-virtual {v6}, Lcom/github/mikephil/charting/highlight/Highlight;->getDataSetIndex()I

    move-result v17

    const/16 v18, -0x1

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_3c

    const/4 v12, 0x0

    .line 320
    .local v12, "minDataSetIndex":I
    :goto_1f
    invoke-virtual {v6}, Lcom/github/mikephil/charting/highlight/Highlight;->getDataSetIndex()I

    move-result v17

    const/16 v18, -0x1

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_41

    invoke-virtual {v3}, Lcom/github/mikephil/charting/data/CandleData;->getDataSetCount()I

    move-result v11

    .line 323
    .local v11, "maxDataSetIndex":I
    :goto_2f
    sub-int v17, v11, v12

    const/16 v18, 0x1

    move/from16 v0, v17

    move/from16 v1, v18

    if-ge v0, v1, :cond_48

    .line 315
    :cond_39
    add-int/lit8 v8, v8, 0x1

    goto :goto_e

    .line 317
    .end local v11    # "maxDataSetIndex":I
    .end local v12    # "minDataSetIndex":I
    :cond_3c
    invoke-virtual {v6}, Lcom/github/mikephil/charting/highlight/Highlight;->getDataSetIndex()I

    move-result v12

    goto :goto_1f

    .line 320
    .restart local v12    # "minDataSetIndex":I
    :cond_41
    invoke-virtual {v6}, Lcom/github/mikephil/charting/highlight/Highlight;->getDataSetIndex()I

    move-result v17

    add-int/lit8 v11, v17, 0x1

    goto :goto_2f

    .line 325
    .restart local v11    # "maxDataSetIndex":I
    :cond_48
    move v4, v12

    .line 326
    .local v4, "dataSetIndex":I
    :goto_49
    if-ge v4, v11, :cond_39

    .line 329
    invoke-virtual {v6}, Lcom/github/mikephil/charting/highlight/Highlight;->getXIndex()I

    move-result v15

    .line 332
    .local v15, "xIndex":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/CandleDataProvider;

    move-object/from16 v17, v0

    invoke-interface/range {v17 .. v17}, Lcom/github/mikephil/charting/interfaces/dataprovider/CandleDataProvider;->getCandleData()Lcom/github/mikephil/charting/data/CandleData;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v4}, Lcom/github/mikephil/charting/data/CandleData;->getDataSetByIndex(I)Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    move-result-object v14

    check-cast v14, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;

    .line 334
    .local v14, "set":Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;
    if-eqz v14, :cond_69

    invoke-interface {v14}, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;->isHighlightEnabled()Z

    move-result v17

    if-nez v17, :cond_6c

    .line 327
    :cond_69
    :goto_69
    add-int/lit8 v4, v4, 0x1

    goto :goto_49

    .line 337
    :cond_6c
    invoke-interface {v14, v15}, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;->getEntryForXIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v5

    check-cast v5, Lcom/github/mikephil/charting/data/CandleEntry;

    .line 339
    .local v5, "e":Lcom/github/mikephil/charting/data/CandleEntry;
    if-eqz v5, :cond_69

    invoke-virtual {v5}, Lcom/github/mikephil/charting/data/CandleEntry;->getXIndex()I

    move-result v17

    move/from16 v0, v17

    if-ne v0, v15, :cond_69

    .line 342
    invoke-virtual {v5}, Lcom/github/mikephil/charting/data/CandleEntry;->getLow()F

    move-result v17

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseY()F

    move-result v18

    mul-float v10, v17, v18

    .line 343
    .local v10, "lowValue":F
    invoke-virtual {v5}, Lcom/github/mikephil/charting/data/CandleEntry;->getHigh()F

    move-result v17

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseY()F

    move-result v18

    mul-float v7, v17, v18

    .line 344
    .local v7, "highValue":F
    add-float v17, v10, v7

    const/high16 v18, 0x40000000    # 2.0f

    div-float v16, v17, v18

    .line 346
    .local v16, "y":F
    const/16 v17, 0x2

    move/from16 v0, v17

    new-array v13, v0, [F

    const/16 v17, 0x0

    int-to-float v0, v15

    move/from16 v18, v0

    aput v18, v13, v17

    const/16 v17, 0x1

    aput v16, v13, v17

    .line 350
    .local v13, "pts":[F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/CandleDataProvider;

    move-object/from16 v17, v0

    invoke-interface {v14}, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;->getAxisDependency()Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    move-result-object v18

    invoke-interface/range {v17 .. v18}, Lcom/github/mikephil/charting/interfaces/dataprovider/CandleDataProvider;->getTransformer(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/Transformer;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v13}, Lcom/github/mikephil/charting/utils/Transformer;->pointValuesToPixel([F)V

    .line 353
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v13, v14}, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->drawHighlightLines(Landroid/graphics/Canvas;[FLcom/github/mikephil/charting/interfaces/datasets/ILineScatterCandleRadarDataSet;)V

    goto :goto_69

    .line 356
    .end local v4    # "dataSetIndex":I
    .end local v5    # "e":Lcom/github/mikephil/charting/data/CandleEntry;
    .end local v6    # "high":Lcom/github/mikephil/charting/highlight/Highlight;
    .end local v7    # "highValue":F
    .end local v10    # "lowValue":F
    .end local v11    # "maxDataSetIndex":I
    .end local v12    # "minDataSetIndex":I
    .end local v13    # "pts":[F
    .end local v14    # "set":Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;
    .end local v15    # "xIndex":I
    .end local v16    # "y":F
    :cond_ce
    return-void
.end method

.method public drawValues(Landroid/graphics/Canvas;)V
    .registers 23
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    .line 262
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/CandleDataProvider;

    invoke-interface {v3}, Lcom/github/mikephil/charting/interfaces/dataprovider/CandleDataProvider;->getCandleData()Lcom/github/mikephil/charting/data/CandleData;

    move-result-object v3

    invoke-virtual {v3}, Lcom/github/mikephil/charting/data/CandleData;->getYValCount()I

    move-result v3

    int-to-float v3, v3

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/CandleDataProvider;

    invoke-interface {v4}, Lcom/github/mikephil/charting/interfaces/dataprovider/CandleDataProvider;->getMaxVisibleCount()I

    move-result v4

    int-to-float v4, v4

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v7}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getScaleX()F

    move-result v7

    mul-float/2addr v4, v7

    cmpg-float v3, v3, v4

    if-gez v3, :cond_e2

    .line 265
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/CandleDataProvider;

    invoke-interface {v3}, Lcom/github/mikephil/charting/interfaces/dataprovider/CandleDataProvider;->getCandleData()Lcom/github/mikephil/charting/data/CandleData;

    move-result-object v3

    invoke-virtual {v3}, Lcom/github/mikephil/charting/data/CandleData;->getDataSets()Ljava/util/List;

    move-result-object v16

    .line 267
    .local v16, "dataSets":Ljava/util/List;, "Ljava/util/List<Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;>;"
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_30
    invoke-interface/range {v16 .. v16}, Ljava/util/List;->size()I

    move-result v3

    if-ge v12, v3, :cond_e2

    .line 269
    move-object/from16 v0, v16

    invoke-interface {v0, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;

    .line 271
    .local v2, "dataSet":Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;
    invoke-interface {v2}, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;->isDrawValuesEnabled()Z

    move-result v3

    if-eqz v3, :cond_4a

    invoke-interface {v2}, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;->getEntryCount()I

    move-result v3

    if-nez v3, :cond_4d

    .line 267
    :cond_4a
    add-int/lit8 v12, v12, 0x1

    goto :goto_30

    .line 275
    :cond_4d
    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->applyValueTextStyle(Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;)V

    .line 277
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/CandleDataProvider;

    invoke-interface {v2}, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;->getAxisDependency()Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    move-result-object v4

    invoke-interface {v3, v4}, Lcom/github/mikephil/charting/interfaces/dataprovider/CandleDataProvider;->getTransformer(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/Transformer;

    move-result-object v1

    .line 279
    .local v1, "trans":Lcom/github/mikephil/charting/utils/Transformer;
    move-object/from16 v0, p0

    iget v3, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mMinX:I

    const/4 v4, 0x0

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v5

    .line 280
    .local v5, "minx":I
    move-object/from16 v0, p0

    iget v3, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mMaxX:I

    add-int/lit8 v3, v3, 0x1

    invoke-interface {v2}, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;->getEntryCount()I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v6

    .line 282
    .local v6, "maxx":I
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseX()F

    move-result v3

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseY()F

    move-result v4

    invoke-virtual/range {v1 .. v6}, Lcom/github/mikephil/charting/utils/Transformer;->generateTransformedValuesCandle(Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;FFII)[F

    move-result-object v18

    .line 285
    .local v18, "positions":[F
    const/high16 v3, 0x40a00000    # 5.0f

    invoke-static {v3}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v20

    .line 287
    .local v20, "yOffset":F
    const/16 v17, 0x0

    .local v17, "j":I
    :goto_91
    move-object/from16 v0, v18

    array-length v3, v0

    move/from16 v0, v17

    if-ge v0, v3, :cond_4a

    .line 289
    aget v13, v18, v17

    .line 290
    .local v13, "x":F
    add-int/lit8 v3, v17, 0x1

    aget v19, v18, v3

    .line 292
    .local v19, "y":F
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v3, v13}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsRight(F)Z

    move-result v3

    if-eqz v3, :cond_4a

    .line 295
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v3, v13}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsLeft(F)Z

    move-result v3

    if-eqz v3, :cond_be

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    move/from16 v0, v19

    invoke-virtual {v3, v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsY(F)Z

    move-result v3

    if-nez v3, :cond_c1

    .line 287
    :cond_be
    :goto_be
    add-int/lit8 v17, v17, 0x2

    goto :goto_91

    .line 298
    :cond_c1
    div-int/lit8 v3, v17, 0x2

    add-int/2addr v3, v5

    invoke-interface {v2, v3}, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v11

    check-cast v11, Lcom/github/mikephil/charting/data/CandleEntry;

    .line 300
    .local v11, "entry":Lcom/github/mikephil/charting/data/CandleEntry;
    invoke-interface {v2}, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;->getValueFormatter()Lcom/github/mikephil/charting/formatter/ValueFormatter;

    move-result-object v9

    invoke-virtual {v11}, Lcom/github/mikephil/charting/data/CandleEntry;->getHigh()F

    move-result v10

    sub-float v14, v19, v20

    div-int/lit8 v3, v17, 0x2

    invoke-interface {v2, v3}, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;->getValueTextColor(I)I

    move-result v15

    move-object/from16 v7, p0

    move-object/from16 v8, p1

    invoke-virtual/range {v7 .. v15}, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->drawValue(Landroid/graphics/Canvas;Lcom/github/mikephil/charting/formatter/ValueFormatter;FLcom/github/mikephil/charting/data/Entry;IFFI)V

    goto :goto_be

    .line 304
    .end local v1    # "trans":Lcom/github/mikephil/charting/utils/Transformer;
    .end local v2    # "dataSet":Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;
    .end local v5    # "minx":I
    .end local v6    # "maxx":I
    .end local v11    # "entry":Lcom/github/mikephil/charting/data/CandleEntry;
    .end local v12    # "i":I
    .end local v13    # "x":F
    .end local v16    # "dataSets":Ljava/util/List;, "Ljava/util/List<Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;>;"
    .end local v17    # "j":I
    .end local v18    # "positions":[F
    .end local v19    # "y":F
    .end local v20    # "yOffset":F
    :cond_e2
    return-void
.end method

.method public initBuffers()V
    .registers 1

    .prologue
    .line 39
    return-void
.end method
