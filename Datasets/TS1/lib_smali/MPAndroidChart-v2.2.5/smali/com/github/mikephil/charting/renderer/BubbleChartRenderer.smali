.class public Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;
.super Lcom/github/mikephil/charting/renderer/DataRenderer;
.source "BubbleChartRenderer.java"


# instance fields
.field private _hsvBuffer:[F

.field protected mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BubbleDataProvider;

.field private pointBuffer:[F

.field private sizeBuffer:[F


# direct methods
.method public constructor <init>(Lcom/github/mikephil/charting/interfaces/dataprovider/BubbleDataProvider;Lcom/github/mikephil/charting/animation/ChartAnimator;Lcom/github/mikephil/charting/utils/ViewPortHandler;)V
    .registers 6
    .param p1, "chart"    # Lcom/github/mikephil/charting/interfaces/dataprovider/BubbleDataProvider;
    .param p2, "animator"    # Lcom/github/mikephil/charting/animation/ChartAnimator;
    .param p3, "viewPortHandler"    # Lcom/github/mikephil/charting/utils/ViewPortHandler;

    .prologue
    .line 31
    invoke-direct {p0, p2, p3}, Lcom/github/mikephil/charting/renderer/DataRenderer;-><init>(Lcom/github/mikephil/charting/animation/ChartAnimator;Lcom/github/mikephil/charting/utils/ViewPortHandler;)V

    .line 57
    const/4 v0, 0x4

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->sizeBuffer:[F

    .line 58
    const/4 v0, 0x2

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->pointBuffer:[F

    .line 191
    const/4 v0, 0x3

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->_hsvBuffer:[F

    .line 32
    iput-object p1, p0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BubbleDataProvider;

    .line 34
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 36
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->mHighlightPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 37
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->mHighlightPaint:Landroid/graphics/Paint;

    const/high16 v1, 0x3fc00000    # 1.5f

    invoke-static {v1}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 38
    return-void
.end method


# virtual methods
.method public drawData(Landroid/graphics/Canvas;)V
    .registers 6
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    .line 48
    iget-object v3, p0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BubbleDataProvider;

    invoke-interface {v3}, Lcom/github/mikephil/charting/interfaces/dataprovider/BubbleDataProvider;->getBubbleData()Lcom/github/mikephil/charting/data/BubbleData;

    move-result-object v0

    .line 50
    .local v0, "bubbleData":Lcom/github/mikephil/charting/data/BubbleData;
    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/BubbleData;->getDataSets()Ljava/util/List;

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

    check-cast v2, Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;

    .line 52
    .local v2, "set":Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;
    invoke-interface {v2}, Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;->isVisible()Z

    move-result v3

    if-eqz v3, :cond_e

    invoke-interface {v2}, Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;->getEntryCount()I

    move-result v3

    if-lez v3, :cond_e

    .line 53
    invoke-virtual {p0, p1, v2}, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->drawDataSet(Landroid/graphics/Canvas;Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;)V

    goto :goto_e

    .line 55
    .end local v2    # "set":Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;
    :cond_2a
    return-void
.end method

.method protected drawDataSet(Landroid/graphics/Canvas;Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;)V
    .registers 27
    .param p1, "c"    # Landroid/graphics/Canvas;
    .param p2, "dataSet"    # Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;

    .prologue
    .line 73
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BubbleDataProvider;

    move-object/from16 v20, v0

    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;->getAxisDependency()Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    move-result-object v21

    invoke-interface/range {v20 .. v21}, Lcom/github/mikephil/charting/interfaces/dataprovider/BubbleDataProvider;->getTransformer(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/Transformer;

    move-result-object v19

    .line 75
    .local v19, "trans":Lcom/github/mikephil/charting/utils/Transformer;
    const/16 v20, 0x0

    const/high16 v21, 0x3f800000    # 1.0f

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseX()F

    move-result v22

    invoke-static/range {v21 .. v22}, Ljava/lang/Math;->min(FF)F

    move-result v21

    invoke-static/range {v20 .. v21}, Ljava/lang/Math;->max(FF)F

    move-result v15

    .line 76
    .local v15, "phaseX":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseY()F

    move-result v16

    .line 78
    .local v16, "phaseY":F
    move-object/from16 v0, p0

    iget v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->mMinX:I

    move/from16 v20, v0

    move-object/from16 v0, p2

    move/from16 v1, v20

    invoke-interface {v0, v1}, Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;->getEntryForXIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v7

    check-cast v7, Lcom/github/mikephil/charting/data/BubbleEntry;

    .line 79
    .local v7, "entryFrom":Lcom/github/mikephil/charting/data/BubbleEntry;
    move-object/from16 v0, p0

    iget v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->mMaxX:I

    move/from16 v20, v0

    move-object/from16 v0, p2

    move/from16 v1, v20

    invoke-interface {v0, v1}, Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;->getEntryForXIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v8

    check-cast v8, Lcom/github/mikephil/charting/data/BubbleEntry;

    .line 81
    .local v8, "entryTo":Lcom/github/mikephil/charting/data/BubbleEntry;
    move-object/from16 v0, p2

    invoke-interface {v0, v7}, Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;->getEntryIndex(Lcom/github/mikephil/charting/data/Entry;)I

    move-result v20

    const/16 v21, 0x0

    invoke-static/range {v20 .. v21}, Ljava/lang/Math;->max(II)I

    move-result v13

    .line 82
    .local v13, "minx":I
    move-object/from16 v0, p2

    invoke-interface {v0, v8}, Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;->getEntryIndex(Lcom/github/mikephil/charting/data/Entry;)I

    move-result v20

    add-int/lit8 v20, v20, 0x1

    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;->getEntryCount()I

    move-result v21

    invoke-static/range {v20 .. v21}, Ljava/lang/Math;->min(II)I

    move-result v12

    .line 84
    .local v12, "maxx":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->sizeBuffer:[F

    move-object/from16 v20, v0

    const/16 v21, 0x0

    const/16 v22, 0x0

    aput v22, v20, v21

    .line 85
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->sizeBuffer:[F

    move-object/from16 v20, v0

    const/16 v21, 0x2

    const/high16 v22, 0x3f800000    # 1.0f

    aput v22, v20, v21

    .line 87
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->sizeBuffer:[F

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Lcom/github/mikephil/charting/utils/Transformer;->pointValuesToPixel([F)V

    .line 89
    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;->isNormalizeSizeEnabled()Z

    move-result v14

    .line 92
    .local v14, "normalizeSize":Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->sizeBuffer:[F

    move-object/from16 v20, v0

    const/16 v21, 0x2

    aget v20, v20, v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->sizeBuffer:[F

    move-object/from16 v21, v0

    const/16 v22, 0x0

    aget v21, v21, v22

    sub-float v20, v20, v21

    invoke-static/range {v20 .. v20}, Ljava/lang/Math;->abs(F)F

    move-result v11

    .line 93
    .local v11, "maxBubbleWidth":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentBottom()F

    move-result v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentTop()F

    move-result v21

    sub-float v20, v20, v21

    invoke-static/range {v20 .. v20}, Ljava/lang/Math;->abs(F)F

    move-result v10

    .line 94
    .local v10, "maxBubbleHeight":F
    invoke-static {v10, v11}, Ljava/lang/Math;->min(FF)F

    move-result v17

    .line 96
    .local v17, "referenceSize":F
    move v9, v13

    .local v9, "j":I
    :goto_c8
    if-ge v9, v12, :cond_183

    .line 98
    move-object/from16 v0, p2

    invoke-interface {v0, v9}, Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v6

    check-cast v6, Lcom/github/mikephil/charting/data/BubbleEntry;

    .line 100
    .local v6, "entry":Lcom/github/mikephil/charting/data/BubbleEntry;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->pointBuffer:[F

    move-object/from16 v20, v0

    const/16 v21, 0x0

    invoke-virtual {v6}, Lcom/github/mikephil/charting/data/BubbleEntry;->getXIndex()I

    move-result v22

    sub-int v22, v22, v13

    move/from16 v0, v22

    int-to-float v0, v0

    move/from16 v22, v0

    mul-float v22, v22, v15

    int-to-float v0, v13

    move/from16 v23, v0

    add-float v22, v22, v23

    aput v22, v20, v21

    .line 101
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->pointBuffer:[F

    move-object/from16 v20, v0

    const/16 v21, 0x1

    invoke-virtual {v6}, Lcom/github/mikephil/charting/data/BubbleEntry;->getVal()F

    move-result v22

    mul-float v22, v22, v16

    aput v22, v20, v21

    .line 102
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->pointBuffer:[F

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Lcom/github/mikephil/charting/utils/Transformer;->pointValuesToPixel([F)V

    .line 104
    invoke-virtual {v6}, Lcom/github/mikephil/charting/data/BubbleEntry;->getSize()F

    move-result v20

    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;->getMaxSize()F

    move-result v21

    move-object/from16 v0, p0

    move/from16 v1, v20

    move/from16 v2, v21

    move/from16 v3, v17

    invoke-virtual {v0, v1, v2, v3, v14}, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->getShapeSize(FFFZ)F

    move-result v20

    const/high16 v21, 0x40000000    # 2.0f

    div-float v18, v20, v21

    .line 106
    .local v18, "shapeHalf":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->pointBuffer:[F

    move-object/from16 v21, v0

    const/16 v22, 0x1

    aget v21, v21, v22

    add-float v21, v21, v18

    invoke-virtual/range {v20 .. v21}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsTop(F)Z

    move-result v20

    if-eqz v20, :cond_14f

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->pointBuffer:[F

    move-object/from16 v21, v0

    const/16 v22, 0x1

    aget v21, v21, v22

    sub-float v21, v21, v18

    invoke-virtual/range {v20 .. v21}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsBottom(F)Z

    move-result v20

    if-nez v20, :cond_153

    .line 96
    :cond_14f
    :goto_14f
    add-int/lit8 v9, v9, 0x1

    goto/16 :goto_c8

    .line 110
    :cond_153
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->pointBuffer:[F

    move-object/from16 v21, v0

    const/16 v22, 0x0

    aget v21, v21, v22

    add-float v21, v21, v18

    invoke-virtual/range {v20 .. v21}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsLeft(F)Z

    move-result v20

    if-eqz v20, :cond_14f

    .line 113
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->pointBuffer:[F

    move-object/from16 v21, v0

    const/16 v22, 0x0

    aget v21, v21, v22

    sub-float v21, v21, v18

    invoke-virtual/range {v20 .. v21}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsRight(F)Z

    move-result v20

    if-nez v20, :cond_184

    .line 121
    .end local v6    # "entry":Lcom/github/mikephil/charting/data/BubbleEntry;
    .end local v18    # "shapeHalf":F
    :cond_183
    return-void

    .line 116
    .restart local v6    # "entry":Lcom/github/mikephil/charting/data/BubbleEntry;
    .restart local v18    # "shapeHalf":F
    :cond_184
    invoke-virtual {v6}, Lcom/github/mikephil/charting/data/BubbleEntry;->getXIndex()I

    move-result v20

    move-object/from16 v0, p2

    move/from16 v1, v20

    invoke-interface {v0, v1}, Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;->getColor(I)I

    move-result v5

    .line 118
    .local v5, "color":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 119
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->pointBuffer:[F

    move-object/from16 v20, v0

    const/16 v21, 0x0

    aget v20, v20, v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->pointBuffer:[F

    move-object/from16 v21, v0

    const/16 v22, 0x1

    aget v21, v21, v22

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    move-object/from16 v22, v0

    move-object/from16 v0, p1

    move/from16 v1, v20

    move/from16 v2, v21

    move/from16 v3, v18

    move-object/from16 v4, v22

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto :goto_14f
.end method

.method public drawExtras(Landroid/graphics/Canvas;)V
    .registers 2
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    .line 189
    return-void
.end method

.method public drawHighlighted(Landroid/graphics/Canvas;[Lcom/github/mikephil/charting/highlight/Highlight;)V
    .registers 36
    .param p1, "c"    # Landroid/graphics/Canvas;
    .param p2, "indices"    # [Lcom/github/mikephil/charting/highlight/Highlight;

    .prologue
    .line 196
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BubbleDataProvider;

    move-object/from16 v29, v0

    invoke-interface/range {v29 .. v29}, Lcom/github/mikephil/charting/interfaces/dataprovider/BubbleDataProvider;->getBubbleData()Lcom/github/mikephil/charting/data/BubbleData;

    move-result-object v6

    .line 198
    .local v6, "bubbleData":Lcom/github/mikephil/charting/data/BubbleData;
    const/16 v29, 0x0

    const/high16 v30, 0x3f800000    # 1.0f

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseX()F

    move-result v31

    invoke-static/range {v30 .. v31}, Ljava/lang/Math;->min(FF)F

    move-result v30

    invoke-static/range {v29 .. v30}, Ljava/lang/Math;->max(FF)F

    move-result v24

    .line 199
    .local v24, "phaseX":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseY()F

    move-result v25

    .line 201
    .local v25, "phaseY":F
    move-object/from16 v5, p2

    .local v5, "arr$":[Lcom/github/mikephil/charting/highlight/Highlight;
    array-length v15, v5

    .local v15, "len$":I
    const/4 v14, 0x0

    .local v14, "i$":I
    :goto_2e
    if-ge v14, v15, :cond_272

    aget-object v13, v5, v14

    .line 203
    .local v13, "high":Lcom/github/mikephil/charting/highlight/Highlight;
    invoke-virtual {v13}, Lcom/github/mikephil/charting/highlight/Highlight;->getDataSetIndex()I

    move-result v29

    const/16 v30, -0x1

    move/from16 v0, v29

    move/from16 v1, v30

    if-ne v0, v1, :cond_5d

    const/16 v20, 0x0

    .line 206
    .local v20, "minDataSetIndex":I
    :goto_40
    invoke-virtual {v13}, Lcom/github/mikephil/charting/highlight/Highlight;->getDataSetIndex()I

    move-result v29

    const/16 v30, -0x1

    move/from16 v0, v29

    move/from16 v1, v30

    if-ne v0, v1, :cond_62

    invoke-virtual {v6}, Lcom/github/mikephil/charting/data/BubbleData;->getDataSetCount()I

    move-result v18

    .line 209
    .local v18, "maxDataSetIndex":I
    :goto_50
    sub-int v29, v18, v20

    const/16 v30, 0x1

    move/from16 v0, v29

    move/from16 v1, v30

    if-ge v0, v1, :cond_69

    .line 201
    :cond_5a
    add-int/lit8 v14, v14, 0x1

    goto :goto_2e

    .line 203
    .end local v18    # "maxDataSetIndex":I
    .end local v20    # "minDataSetIndex":I
    :cond_5d
    invoke-virtual {v13}, Lcom/github/mikephil/charting/highlight/Highlight;->getDataSetIndex()I

    move-result v20

    goto :goto_40

    .line 206
    .restart local v20    # "minDataSetIndex":I
    :cond_62
    invoke-virtual {v13}, Lcom/github/mikephil/charting/highlight/Highlight;->getDataSetIndex()I

    move-result v29

    add-int/lit8 v18, v29, 0x1

    goto :goto_50

    .line 211
    .restart local v18    # "maxDataSetIndex":I
    :cond_69
    move/from16 v9, v20

    .line 212
    .local v9, "dataSetIndex":I
    :goto_6b
    move/from16 v0, v18

    if-ge v9, v0, :cond_5a

    .line 215
    invoke-virtual {v6, v9}, Lcom/github/mikephil/charting/data/BubbleData;->getDataSetByIndex(I)Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    move-result-object v8

    check-cast v8, Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;

    .line 217
    .local v8, "dataSet":Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;
    if-eqz v8, :cond_7d

    invoke-interface {v8}, Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;->isHighlightEnabled()Z

    move-result v29

    if-nez v29, :cond_80

    .line 213
    :cond_7d
    :goto_7d
    add-int/lit8 v9, v9, 0x1

    goto :goto_6b

    .line 220
    :cond_80
    invoke-virtual {v6, v13}, Lcom/github/mikephil/charting/data/BubbleData;->getEntryForHighlight(Lcom/github/mikephil/charting/highlight/Highlight;)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v10

    check-cast v10, Lcom/github/mikephil/charting/data/BubbleEntry;

    .line 221
    .local v10, "entry":Lcom/github/mikephil/charting/data/BubbleEntry;
    if-eqz v10, :cond_7d

    invoke-virtual {v10}, Lcom/github/mikephil/charting/data/BubbleEntry;->getXIndex()I

    move-result v29

    invoke-virtual {v13}, Lcom/github/mikephil/charting/highlight/Highlight;->getXIndex()I

    move-result v30

    move/from16 v0, v29

    move/from16 v1, v30

    if-ne v0, v1, :cond_7d

    .line 224
    move-object/from16 v0, p0

    iget v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->mMinX:I

    move/from16 v29, v0

    move/from16 v0, v29

    invoke-interface {v8, v0}, Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;->getEntryForXIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v11

    check-cast v11, Lcom/github/mikephil/charting/data/BubbleEntry;

    .line 225
    .local v11, "entryFrom":Lcom/github/mikephil/charting/data/BubbleEntry;
    move-object/from16 v0, p0

    iget v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->mMaxX:I

    move/from16 v29, v0

    move/from16 v0, v29

    invoke-interface {v8, v0}, Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;->getEntryForXIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v12

    check-cast v12, Lcom/github/mikephil/charting/data/BubbleEntry;

    .line 227
    .local v12, "entryTo":Lcom/github/mikephil/charting/data/BubbleEntry;
    invoke-interface {v8, v11}, Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;->getEntryIndex(Lcom/github/mikephil/charting/data/Entry;)I

    move-result v21

    .line 228
    .local v21, "minx":I
    invoke-interface {v8, v12}, Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;->getEntryIndex(Lcom/github/mikephil/charting/data/Entry;)I

    move-result v29

    add-int/lit8 v29, v29, 0x1

    invoke-interface {v8}, Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;->getEntryCount()I

    move-result v30

    invoke-static/range {v29 .. v30}, Ljava/lang/Math;->min(II)I

    move-result v19

    .line 230
    .local v19, "maxx":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BubbleDataProvider;

    move-object/from16 v29, v0

    invoke-interface {v8}, Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;->getAxisDependency()Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    move-result-object v30

    invoke-interface/range {v29 .. v30}, Lcom/github/mikephil/charting/interfaces/dataprovider/BubbleDataProvider;->getTransformer(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/Transformer;

    move-result-object v28

    .line 232
    .local v28, "trans":Lcom/github/mikephil/charting/utils/Transformer;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->sizeBuffer:[F

    move-object/from16 v29, v0

    const/16 v30, 0x0

    const/16 v31, 0x0

    aput v31, v29, v30

    .line 233
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->sizeBuffer:[F

    move-object/from16 v29, v0

    const/16 v30, 0x2

    const/high16 v31, 0x3f800000    # 1.0f

    aput v31, v29, v30

    .line 235
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->sizeBuffer:[F

    move-object/from16 v29, v0

    invoke-virtual/range {v28 .. v29}, Lcom/github/mikephil/charting/utils/Transformer;->pointValuesToPixel([F)V

    .line 237
    invoke-interface {v8}, Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;->isNormalizeSizeEnabled()Z

    move-result v22

    .line 240
    .local v22, "normalizeSize":Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->sizeBuffer:[F

    move-object/from16 v29, v0

    const/16 v30, 0x2

    aget v29, v29, v30

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->sizeBuffer:[F

    move-object/from16 v30, v0

    const/16 v31, 0x0

    aget v30, v30, v31

    sub-float v29, v29, v30

    invoke-static/range {v29 .. v29}, Ljava/lang/Math;->abs(F)F

    move-result v17

    .line 241
    .local v17, "maxBubbleWidth":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentBottom()F

    move-result v29

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentTop()F

    move-result v30

    sub-float v29, v29, v30

    invoke-static/range {v29 .. v29}, Ljava/lang/Math;->abs(F)F

    move-result v16

    .line 243
    .local v16, "maxBubbleHeight":F
    invoke-static/range {v16 .. v17}, Ljava/lang/Math;->min(FF)F

    move-result v26

    .line 245
    .local v26, "referenceSize":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->pointBuffer:[F

    move-object/from16 v29, v0

    const/16 v30, 0x0

    invoke-virtual {v10}, Lcom/github/mikephil/charting/data/BubbleEntry;->getXIndex()I

    move-result v31

    sub-int v31, v31, v21

    move/from16 v0, v31

    int-to-float v0, v0

    move/from16 v31, v0

    mul-float v31, v31, v24

    move/from16 v0, v21

    int-to-float v0, v0

    move/from16 v32, v0

    add-float v31, v31, v32

    aput v31, v29, v30

    .line 246
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->pointBuffer:[F

    move-object/from16 v29, v0

    const/16 v30, 0x1

    invoke-virtual {v10}, Lcom/github/mikephil/charting/data/BubbleEntry;->getVal()F

    move-result v31

    mul-float v31, v31, v25

    aput v31, v29, v30

    .line 247
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->pointBuffer:[F

    move-object/from16 v29, v0

    invoke-virtual/range {v28 .. v29}, Lcom/github/mikephil/charting/utils/Transformer;->pointValuesToPixel([F)V

    .line 249
    invoke-virtual {v10}, Lcom/github/mikephil/charting/data/BubbleEntry;->getSize()F

    move-result v29

    invoke-interface {v8}, Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;->getMaxSize()F

    move-result v30

    move-object/from16 v0, p0

    move/from16 v1, v29

    move/from16 v2, v30

    move/from16 v3, v26

    move/from16 v4, v22

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->getShapeSize(FFFZ)F

    move-result v29

    const/high16 v30, 0x40000000    # 2.0f

    div-float v27, v29, v30

    .line 254
    .local v27, "shapeHalf":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    move-object/from16 v29, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->pointBuffer:[F

    move-object/from16 v30, v0

    const/16 v31, 0x1

    aget v30, v30, v31

    add-float v30, v30, v27

    invoke-virtual/range {v29 .. v30}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsTop(F)Z

    move-result v29

    if-eqz v29, :cond_7d

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    move-object/from16 v29, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->pointBuffer:[F

    move-object/from16 v30, v0

    const/16 v31, 0x1

    aget v30, v30, v31

    sub-float v30, v30, v27

    invoke-virtual/range {v29 .. v30}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsBottom(F)Z

    move-result v29

    if-eqz v29, :cond_7d

    .line 258
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    move-object/from16 v29, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->pointBuffer:[F

    move-object/from16 v30, v0

    const/16 v31, 0x0

    aget v30, v30, v31

    add-float v30, v30, v27

    invoke-virtual/range {v29 .. v30}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsLeft(F)Z

    move-result v29

    if-eqz v29, :cond_7d

    .line 261
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    move-object/from16 v29, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->pointBuffer:[F

    move-object/from16 v30, v0

    const/16 v31, 0x0

    aget v30, v30, v31

    sub-float v30, v30, v27

    invoke-virtual/range {v29 .. v30}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsRight(F)Z

    move-result v29

    if-eqz v29, :cond_5a

    .line 264
    invoke-virtual {v13}, Lcom/github/mikephil/charting/highlight/Highlight;->getXIndex()I

    move-result v29

    move/from16 v0, v29

    move/from16 v1, v21

    if-lt v0, v1, :cond_7d

    invoke-virtual {v13}, Lcom/github/mikephil/charting/highlight/Highlight;->getXIndex()I

    move-result v29

    move/from16 v0, v29

    move/from16 v1, v19

    if-ge v0, v1, :cond_7d

    .line 267
    invoke-virtual {v10}, Lcom/github/mikephil/charting/data/BubbleEntry;->getXIndex()I

    move-result v29

    move/from16 v0, v29

    invoke-interface {v8, v0}, Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;->getColor(I)I

    move-result v23

    .line 269
    .local v23, "originalColor":I
    invoke-static/range {v23 .. v23}, Landroid/graphics/Color;->red(I)I

    move-result v29

    invoke-static/range {v23 .. v23}, Landroid/graphics/Color;->green(I)I

    move-result v30

    invoke-static/range {v23 .. v23}, Landroid/graphics/Color;->blue(I)I

    move-result v31

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->_hsvBuffer:[F

    move-object/from16 v32, v0

    invoke-static/range {v29 .. v32}, Landroid/graphics/Color;->RGBToHSV(III[F)V

    .line 271
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->_hsvBuffer:[F

    move-object/from16 v29, v0

    const/16 v30, 0x2

    aget v31, v29, v30

    const/high16 v32, 0x3f000000    # 0.5f

    mul-float v31, v31, v32

    aput v31, v29, v30

    .line 272
    invoke-static/range {v23 .. v23}, Landroid/graphics/Color;->alpha(I)I

    move-result v29

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->_hsvBuffer:[F

    move-object/from16 v30, v0

    invoke-static/range {v29 .. v30}, Landroid/graphics/Color;->HSVToColor(I[F)I

    move-result v7

    .line 274
    .local v7, "color":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->mHighlightPaint:Landroid/graphics/Paint;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    invoke-virtual {v0, v7}, Landroid/graphics/Paint;->setColor(I)V

    .line 275
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->mHighlightPaint:Landroid/graphics/Paint;

    move-object/from16 v29, v0

    invoke-interface {v8}, Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;->getHighlightCircleWidth()F

    move-result v30

    invoke-virtual/range {v29 .. v30}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 276
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->pointBuffer:[F

    move-object/from16 v29, v0

    const/16 v30, 0x0

    aget v29, v29, v30

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->pointBuffer:[F

    move-object/from16 v30, v0

    const/16 v31, 0x1

    aget v30, v30, v31

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->mHighlightPaint:Landroid/graphics/Paint;

    move-object/from16 v31, v0

    move-object/from16 v0, p1

    move/from16 v1, v29

    move/from16 v2, v30

    move/from16 v3, v27

    move-object/from16 v4, v31

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto/16 :goto_7d

    .line 279
    .end local v7    # "color":I
    .end local v8    # "dataSet":Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;
    .end local v9    # "dataSetIndex":I
    .end local v10    # "entry":Lcom/github/mikephil/charting/data/BubbleEntry;
    .end local v11    # "entryFrom":Lcom/github/mikephil/charting/data/BubbleEntry;
    .end local v12    # "entryTo":Lcom/github/mikephil/charting/data/BubbleEntry;
    .end local v13    # "high":Lcom/github/mikephil/charting/highlight/Highlight;
    .end local v16    # "maxBubbleHeight":F
    .end local v17    # "maxBubbleWidth":F
    .end local v18    # "maxDataSetIndex":I
    .end local v19    # "maxx":I
    .end local v20    # "minDataSetIndex":I
    .end local v21    # "minx":I
    .end local v22    # "normalizeSize":Z
    .end local v23    # "originalColor":I
    .end local v26    # "referenceSize":F
    .end local v27    # "shapeHalf":F
    .end local v28    # "trans":Lcom/github/mikephil/charting/utils/Transformer;
    :cond_272
    return-void
.end method

.method public drawValues(Landroid/graphics/Canvas;)V
    .registers 27
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    .line 126
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BubbleDataProvider;

    invoke-interface {v1}, Lcom/github/mikephil/charting/interfaces/dataprovider/BubbleDataProvider;->getBubbleData()Lcom/github/mikephil/charting/data/BubbleData;

    move-result-object v17

    .line 128
    .local v17, "bubbleData":Lcom/github/mikephil/charting/data/BubbleData;
    if-nez v17, :cond_b

    .line 185
    :cond_a
    return-void

    .line 132
    :cond_b
    invoke-virtual/range {v17 .. v17}, Lcom/github/mikephil/charting/data/BubbleData;->getYValCount()I

    move-result v1

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BubbleDataProvider;

    invoke-interface {v7}, Lcom/github/mikephil/charting/interfaces/dataprovider/BubbleDataProvider;->getMaxVisibleCount()I

    move-result v7

    int-to-float v7, v7

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v8}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getScaleX()F

    move-result v8

    mul-float/2addr v7, v8

    float-to-double v7, v7

    invoke-static {v7, v8}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v7

    double-to-int v7, v7

    if-ge v1, v7, :cond_a

    .line 135
    invoke-virtual/range {v17 .. v17}, Lcom/github/mikephil/charting/data/BubbleData;->getDataSets()Ljava/util/List;

    move-result-object v18

    .line 137
    .local v18, "dataSets":Ljava/util/List;, "Ljava/util/List<Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;>;"
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->mValuePaint:Landroid/graphics/Paint;

    const-string v7, "1"

    invoke-static {v1, v7}, Lcom/github/mikephil/charting/utils/Utils;->calcTextHeight(Landroid/graphics/Paint;Ljava/lang/String;)I

    move-result v1

    int-to-float v0, v1

    move/from16 v22, v0

    .line 139
    .local v22, "lineHeight":F
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_3b
    invoke-interface/range {v18 .. v18}, Ljava/util/List;->size()I

    move-result v1

    if-ge v12, v1, :cond_a

    .line 141
    move-object/from16 v0, v18

    invoke-interface {v0, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;

    .line 143
    .local v2, "dataSet":Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;
    invoke-interface {v2}, Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;->isDrawValuesEnabled()Z

    move-result v1

    if-eqz v1, :cond_55

    invoke-interface {v2}, Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;->getEntryCount()I

    move-result v1

    if-nez v1, :cond_58

    .line 139
    :cond_55
    add-int/lit8 v12, v12, 0x1

    goto :goto_3b

    .line 147
    :cond_58
    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->applyValueTextStyle(Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;)V

    .line 149
    const/4 v1, 0x0

    const/high16 v7, 0x3f800000    # 1.0f

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v8}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseX()F

    move-result v8

    invoke-static {v7, v8}, Ljava/lang/Math;->min(FF)F

    move-result v7

    invoke-static {v1, v7}, Ljava/lang/Math;->max(FF)F

    move-result v3

    .line 150
    .local v3, "phaseX":F
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseY()F

    move-result v4

    .line 152
    .local v4, "phaseY":F
    move-object/from16 v0, p0

    iget v1, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->mMinX:I

    invoke-interface {v2, v1}, Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;->getEntryForXIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v19

    check-cast v19, Lcom/github/mikephil/charting/data/BubbleEntry;

    .line 153
    .local v19, "entryFrom":Lcom/github/mikephil/charting/data/BubbleEntry;
    move-object/from16 v0, p0

    iget v1, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->mMaxX:I

    invoke-interface {v2, v1}, Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;->getEntryForXIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v20

    check-cast v20, Lcom/github/mikephil/charting/data/BubbleEntry;

    .line 155
    .local v20, "entryTo":Lcom/github/mikephil/charting/data/BubbleEntry;
    move-object/from16 v0, v19

    invoke-interface {v2, v0}, Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;->getEntryIndex(Lcom/github/mikephil/charting/data/Entry;)I

    move-result v5

    .line 156
    .local v5, "minx":I
    move-object/from16 v0, v20

    invoke-interface {v2, v0}, Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;->getEntryIndex(Lcom/github/mikephil/charting/data/Entry;)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-interface {v2}, Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;->getEntryCount()I

    move-result v7

    invoke-static {v1, v7}, Ljava/lang/Math;->min(II)I

    move-result v6

    .line 158
    .local v6, "maxx":I
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BubbleDataProvider;

    invoke-interface {v2}, Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;->getAxisDependency()Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    move-result-object v7

    invoke-interface {v1, v7}, Lcom/github/mikephil/charting/interfaces/dataprovider/BubbleDataProvider;->getTransformer(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/Transformer;

    move-result-object v1

    invoke-virtual/range {v1 .. v6}, Lcom/github/mikephil/charting/utils/Transformer;->generateTransformedValuesBubble(Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;FFII)[F

    move-result-object v23

    .line 161
    .local v23, "positions":[F
    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v1, v3, v1

    if-nez v1, :cond_10b

    move/from16 v16, v4

    .line 163
    .local v16, "alpha":F
    :goto_ba
    const/16 v21, 0x0

    .local v21, "j":I
    :goto_bc
    move-object/from16 v0, v23

    array-length v1, v0

    move/from16 v0, v21

    if-ge v0, v1, :cond_55

    .line 165
    div-int/lit8 v1, v21, 0x2

    add-int/2addr v1, v5

    invoke-interface {v2, v1}, Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;->getValueTextColor(I)I

    move-result v15

    .line 166
    .local v15, "valueTextColor":I
    const/high16 v1, 0x437f0000    # 255.0f

    mul-float v1, v1, v16

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    invoke-static {v15}, Landroid/graphics/Color;->red(I)I

    move-result v7

    invoke-static {v15}, Landroid/graphics/Color;->green(I)I

    move-result v8

    invoke-static {v15}, Landroid/graphics/Color;->blue(I)I

    move-result v9

    invoke-static {v1, v7, v8, v9}, Landroid/graphics/Color;->argb(IIII)I

    move-result v15

    .line 169
    aget v13, v23, v21

    .line 170
    .local v13, "x":F
    add-int/lit8 v1, v21, 0x1

    aget v24, v23, v1

    .line 172
    .local v24, "y":F
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v1, v13}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsRight(F)Z

    move-result v1

    if-eqz v1, :cond_55

    .line 175
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v1, v13}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsLeft(F)Z

    move-result v1

    if-eqz v1, :cond_108

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    move/from16 v0, v24

    invoke-virtual {v1, v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsY(F)Z

    move-result v1

    if-nez v1, :cond_10e

    .line 163
    :cond_108
    :goto_108
    add-int/lit8 v21, v21, 0x2

    goto :goto_bc

    .end local v13    # "x":F
    .end local v15    # "valueTextColor":I
    .end local v16    # "alpha":F
    .end local v21    # "j":I
    .end local v24    # "y":F
    :cond_10b
    move/from16 v16, v3

    .line 161
    goto :goto_ba

    .line 178
    .restart local v13    # "x":F
    .restart local v15    # "valueTextColor":I
    .restart local v16    # "alpha":F
    .restart local v21    # "j":I
    .restart local v24    # "y":F
    :cond_10e
    div-int/lit8 v1, v21, 0x2

    add-int/2addr v1, v5

    invoke-interface {v2, v1}, Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v11

    check-cast v11, Lcom/github/mikephil/charting/data/BubbleEntry;

    .line 180
    .local v11, "entry":Lcom/github/mikephil/charting/data/BubbleEntry;
    invoke-interface {v2}, Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;->getValueFormatter()Lcom/github/mikephil/charting/formatter/ValueFormatter;

    move-result-object v9

    invoke-virtual {v11}, Lcom/github/mikephil/charting/data/BubbleEntry;->getSize()F

    move-result v10

    const/high16 v1, 0x3f000000    # 0.5f

    mul-float v1, v1, v22

    add-float v14, v24, v1

    move-object/from16 v7, p0

    move-object/from16 v8, p1

    invoke-virtual/range {v7 .. v15}, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->drawValue(Landroid/graphics/Canvas;Lcom/github/mikephil/charting/formatter/ValueFormatter;FLcom/github/mikephil/charting/data/Entry;IFFI)V

    goto :goto_108
.end method

.method protected getShapeSize(FFFZ)F
    .registers 9
    .param p1, "entrySize"    # F
    .param p2, "maxSize"    # F
    .param p3, "reference"    # F
    .param p4, "normalizeSize"    # Z

    .prologue
    .line 64
    if-eqz p4, :cond_15

    const/4 v2, 0x0

    cmpl-float v2, p2, v2

    if-nez v2, :cond_c

    const/high16 v0, 0x3f800000    # 1.0f

    .line 67
    .local v0, "factor":F
    :goto_9
    mul-float v1, p3, v0

    .line 68
    .local v1, "shapeSize":F
    return v1

    .line 64
    .end local v0    # "factor":F
    .end local v1    # "shapeSize":F
    :cond_c
    div-float v2, p1, p2

    float-to-double v2, v2

    invoke-static {v2, v3}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v2

    double-to-float v0, v2

    goto :goto_9

    :cond_15
    move v0, p1

    goto :goto_9
.end method

.method public initBuffers()V
    .registers 1

    .prologue
    .line 43
    return-void
.end method
