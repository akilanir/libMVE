.class public Lcom/github/mikephil/charting/renderer/BarChartRenderer;
.super Lcom/github/mikephil/charting/renderer/DataRenderer;
.source "BarChartRenderer.java"


# instance fields
.field protected mBarBorderPaint:Landroid/graphics/Paint;

.field protected mBarBuffers:[Lcom/github/mikephil/charting/buffer/BarBuffer;

.field protected mBarRect:Landroid/graphics/RectF;

.field protected mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

.field protected mShadowPaint:Landroid/graphics/Paint;


# direct methods
.method public constructor <init>(Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;Lcom/github/mikephil/charting/animation/ChartAnimator;Lcom/github/mikephil/charting/utils/ViewPortHandler;)V
    .registers 8
    .param p1, "chart"    # Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;
    .param p2, "animator"    # Lcom/github/mikephil/charting/animation/ChartAnimator;
    .param p3, "viewPortHandler"    # Lcom/github/mikephil/charting/utils/ViewPortHandler;

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 38
    invoke-direct {p0, p2, p3}, Lcom/github/mikephil/charting/renderer/DataRenderer;-><init>(Lcom/github/mikephil/charting/animation/ChartAnimator;Lcom/github/mikephil/charting/utils/ViewPortHandler;)V

    .line 29
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mBarRect:Landroid/graphics/RectF;

    .line 39
    iput-object p1, p0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    .line 41
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v3}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mHighlightPaint:Landroid/graphics/Paint;

    .line 42
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mHighlightPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 43
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mHighlightPaint:Landroid/graphics/Paint;

    invoke-static {v2, v2, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 45
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mHighlightPaint:Landroid/graphics/Paint;

    const/16 v1, 0x78

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 47
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v3}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mShadowPaint:Landroid/graphics/Paint;

    .line 48
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mShadowPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 50
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v3}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mBarBorderPaint:Landroid/graphics/Paint;

    .line 51
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mBarBorderPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 52
    return-void
.end method


# virtual methods
.method public drawData(Landroid/graphics/Canvas;)V
    .registers 6
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    .line 71
    iget-object v3, p0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    invoke-interface {v3}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->getBarData()Lcom/github/mikephil/charting/data/BarData;

    move-result-object v0

    .line 73
    .local v0, "barData":Lcom/github/mikephil/charting/data/BarData;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_7
    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/BarData;->getDataSetCount()I

    move-result v3

    if-ge v1, v3, :cond_25

    .line 75
    invoke-virtual {v0, v1}, Lcom/github/mikephil/charting/data/BarData;->getDataSetByIndex(I)Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    move-result-object v2

    check-cast v2, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;

    .line 77
    .local v2, "set":Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;
    invoke-interface {v2}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->isVisible()Z

    move-result v3

    if-eqz v3, :cond_22

    invoke-interface {v2}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getEntryCount()I

    move-result v3

    if-lez v3, :cond_22

    .line 78
    invoke-virtual {p0, p1, v2, v1}, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->drawDataSet(Landroid/graphics/Canvas;Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;I)V

    .line 73
    :cond_22
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    .line 81
    .end local v2    # "set":Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;
    :cond_25
    return-void
.end method

.method protected drawDataSet(Landroid/graphics/Canvas;Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;I)V
    .registers 16
    .param p1, "c"    # Landroid/graphics/Canvas;
    .param p2, "dataSet"    # Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;
    .param p3, "index"    # I

    .prologue
    .line 85
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    invoke-interface {p2}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getAxisDependency()Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->getTransformer(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/Transformer;

    move-result-object v11

    .line 87
    .local v11, "trans":Lcom/github/mikephil/charting/utils/Transformer;
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mShadowPaint:Landroid/graphics/Paint;

    invoke-interface {p2}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getBarShadowColor()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 88
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mBarBorderPaint:Landroid/graphics/Paint;

    invoke-interface {p2}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getBarBorderColor()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 89
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mBarBorderPaint:Landroid/graphics/Paint;

    invoke-interface {p2}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getBarBorderWidth()F

    move-result v1

    invoke-static {v1}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 91
    invoke-interface {p2}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getBarBorderWidth()F

    move-result v0

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_85

    const/4 v7, 0x1

    .line 93
    .local v7, "drawBorder":Z
    :goto_33
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseX()F

    move-result v9

    .line 94
    .local v9, "phaseX":F
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseY()F

    move-result v10

    .line 97
    .local v10, "phaseY":F
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mBarBuffers:[Lcom/github/mikephil/charting/buffer/BarBuffer;

    aget-object v6, v0, p3

    .line 98
    .local v6, "buffer":Lcom/github/mikephil/charting/buffer/BarBuffer;
    invoke-virtual {v6, v9, v10}, Lcom/github/mikephil/charting/buffer/BarBuffer;->setPhases(FF)V

    .line 99
    invoke-interface {p2}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getBarSpace()F

    move-result v0

    invoke-virtual {v6, v0}, Lcom/github/mikephil/charting/buffer/BarBuffer;->setBarSpace(F)V

    .line 100
    invoke-virtual {v6, p3}, Lcom/github/mikephil/charting/buffer/BarBuffer;->setDataSet(I)V

    .line 101
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    invoke-interface {p2}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getAxisDependency()Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->isInverted(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Z

    move-result v0

    invoke-virtual {v6, v0}, Lcom/github/mikephil/charting/buffer/BarBuffer;->setInverted(Z)V

    .line 103
    invoke-virtual {v6, p2}, Lcom/github/mikephil/charting/buffer/BarBuffer;->feed(Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;)V

    .line 105
    iget-object v0, v6, Lcom/github/mikephil/charting/buffer/BarBuffer;->buffer:[F

    invoke-virtual {v11, v0}, Lcom/github/mikephil/charting/utils/Transformer;->pointValuesToPixel([F)V

    .line 108
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    invoke-interface {v0}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->isDrawBarShadowEnabled()Z

    move-result v0

    if-eqz v0, :cond_93

    .line 110
    const/4 v8, 0x0

    .local v8, "j":I
    :goto_6e
    invoke-virtual {v6}, Lcom/github/mikephil/charting/buffer/BarBuffer;->size()I

    move-result v0

    if-ge v8, v0, :cond_93

    .line 112
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    iget-object v1, v6, Lcom/github/mikephil/charting/buffer/BarBuffer;->buffer:[F

    add-int/lit8 v2, v8, 0x2

    aget v1, v1, v2

    invoke-virtual {v0, v1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsLeft(F)Z

    move-result v0

    if-nez v0, :cond_87

    .line 110
    :goto_82
    add-int/lit8 v8, v8, 0x4

    goto :goto_6e

    .line 91
    .end local v6    # "buffer":Lcom/github/mikephil/charting/buffer/BarBuffer;
    .end local v7    # "drawBorder":Z
    .end local v8    # "j":I
    .end local v9    # "phaseX":F
    .end local v10    # "phaseY":F
    :cond_85
    const/4 v7, 0x0

    goto :goto_33

    .line 115
    .restart local v6    # "buffer":Lcom/github/mikephil/charting/buffer/BarBuffer;
    .restart local v7    # "drawBorder":Z
    .restart local v8    # "j":I
    .restart local v9    # "phaseX":F
    .restart local v10    # "phaseY":F
    :cond_87
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    iget-object v1, v6, Lcom/github/mikephil/charting/buffer/BarBuffer;->buffer:[F

    aget v1, v1, v8

    invoke-virtual {v0, v1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsRight(F)Z

    move-result v0

    if-nez v0, :cond_b6

    .line 125
    .end local v8    # "j":I
    :cond_93
    invoke-interface {p2}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getColors()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_126

    .line 127
    const/4 v8, 0x0

    .restart local v8    # "j":I
    :goto_9f
    invoke-virtual {v6}, Lcom/github/mikephil/charting/buffer/BarBuffer;->size()I

    move-result v0

    if-ge v8, v0, :cond_df

    .line 129
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    iget-object v1, v6, Lcom/github/mikephil/charting/buffer/BarBuffer;->buffer:[F

    add-int/lit8 v2, v8, 0x2

    aget v1, v1, v2

    invoke-virtual {v0, v1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsLeft(F)Z

    move-result v0

    if-nez v0, :cond_d3

    .line 127
    :cond_b3
    :goto_b3
    add-int/lit8 v8, v8, 0x4

    goto :goto_9f

    .line 118
    :cond_b6
    iget-object v0, v6, Lcom/github/mikephil/charting/buffer/BarBuffer;->buffer:[F

    aget v1, v0, v8

    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentTop()F

    move-result v2

    iget-object v0, v6, Lcom/github/mikephil/charting/buffer/BarBuffer;->buffer:[F

    add-int/lit8 v3, v8, 0x2

    aget v3, v0, v3

    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentBottom()F

    move-result v4

    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mShadowPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    goto :goto_82

    .line 132
    :cond_d3
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    iget-object v1, v6, Lcom/github/mikephil/charting/buffer/BarBuffer;->buffer:[F

    aget v1, v1, v8

    invoke-virtual {v0, v1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsRight(F)Z

    move-result v0

    if-nez v0, :cond_e0

    .line 167
    :cond_df
    return-void

    .line 137
    :cond_e0
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    div-int/lit8 v1, v8, 0x4

    invoke-interface {p2, v1}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 138
    iget-object v0, v6, Lcom/github/mikephil/charting/buffer/BarBuffer;->buffer:[F

    aget v1, v0, v8

    iget-object v0, v6, Lcom/github/mikephil/charting/buffer/BarBuffer;->buffer:[F

    add-int/lit8 v2, v8, 0x1

    aget v2, v0, v2

    iget-object v0, v6, Lcom/github/mikephil/charting/buffer/BarBuffer;->buffer:[F

    add-int/lit8 v3, v8, 0x2

    aget v3, v0, v3

    iget-object v0, v6, Lcom/github/mikephil/charting/buffer/BarBuffer;->buffer:[F

    add-int/lit8 v4, v8, 0x3

    aget v4, v0, v4

    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 141
    if-eqz v7, :cond_b3

    .line 142
    iget-object v0, v6, Lcom/github/mikephil/charting/buffer/BarBuffer;->buffer:[F

    aget v1, v0, v8

    iget-object v0, v6, Lcom/github/mikephil/charting/buffer/BarBuffer;->buffer:[F

    add-int/lit8 v2, v8, 0x1

    aget v2, v0, v2

    iget-object v0, v6, Lcom/github/mikephil/charting/buffer/BarBuffer;->buffer:[F

    add-int/lit8 v3, v8, 0x2

    aget v3, v0, v3

    iget-object v0, v6, Lcom/github/mikephil/charting/buffer/BarBuffer;->buffer:[F

    add-int/lit8 v4, v8, 0x3

    aget v4, v0, v4

    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mBarBorderPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    goto :goto_b3

    .line 148
    .end local v8    # "j":I
    :cond_126
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    invoke-interface {p2}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getColor()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 150
    const/4 v8, 0x0

    .restart local v8    # "j":I
    :goto_130
    invoke-virtual {v6}, Lcom/github/mikephil/charting/buffer/BarBuffer;->size()I

    move-result v0

    if-ge v8, v0, :cond_df

    .line 152
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    iget-object v1, v6, Lcom/github/mikephil/charting/buffer/BarBuffer;->buffer:[F

    add-int/lit8 v2, v8, 0x2

    aget v1, v1, v2

    invoke-virtual {v0, v1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsLeft(F)Z

    move-result v0

    if-nez v0, :cond_147

    .line 150
    :cond_144
    :goto_144
    add-int/lit8 v8, v8, 0x4

    goto :goto_130

    .line 155
    :cond_147
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    iget-object v1, v6, Lcom/github/mikephil/charting/buffer/BarBuffer;->buffer:[F

    aget v1, v1, v8

    invoke-virtual {v0, v1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsRight(F)Z

    move-result v0

    if-eqz v0, :cond_df

    .line 158
    iget-object v0, v6, Lcom/github/mikephil/charting/buffer/BarBuffer;->buffer:[F

    aget v1, v0, v8

    iget-object v0, v6, Lcom/github/mikephil/charting/buffer/BarBuffer;->buffer:[F

    add-int/lit8 v2, v8, 0x1

    aget v2, v0, v2

    iget-object v0, v6, Lcom/github/mikephil/charting/buffer/BarBuffer;->buffer:[F

    add-int/lit8 v3, v8, 0x2

    aget v3, v0, v3

    iget-object v0, v6, Lcom/github/mikephil/charting/buffer/BarBuffer;->buffer:[F

    add-int/lit8 v4, v8, 0x3

    aget v4, v0, v4

    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 161
    if-eqz v7, :cond_144

    .line 162
    iget-object v0, v6, Lcom/github/mikephil/charting/buffer/BarBuffer;->buffer:[F

    aget v1, v0, v8

    iget-object v0, v6, Lcom/github/mikephil/charting/buffer/BarBuffer;->buffer:[F

    add-int/lit8 v2, v8, 0x1

    aget v2, v0, v2

    iget-object v0, v6, Lcom/github/mikephil/charting/buffer/BarBuffer;->buffer:[F

    add-int/lit8 v3, v8, 0x2

    aget v3, v0, v3

    iget-object v0, v6, Lcom/github/mikephil/charting/buffer/BarBuffer;->buffer:[F

    add-int/lit8 v4, v8, 0x3

    aget v4, v0, v4

    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mBarBorderPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    goto :goto_144
.end method

.method public drawExtras(Landroid/graphics/Canvas;)V
    .registers 2
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    .line 433
    return-void
.end method

.method public drawHighlighted(Landroid/graphics/Canvas;[Lcom/github/mikephil/charting/highlight/Highlight;)V
    .registers 34
    .param p1, "c"    # Landroid/graphics/Canvas;
    .param p2, "indices"    # [Lcom/github/mikephil/charting/highlight/Highlight;

    .prologue
    .line 328
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    invoke-interface {v2}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->getBarData()Lcom/github/mikephil/charting/data/BarData;

    move-result-object v12

    .line 329
    .local v12, "barData":Lcom/github/mikephil/charting/data/BarData;
    invoke-virtual {v12}, Lcom/github/mikephil/charting/data/BarData;->getDataSetCount()I

    move-result v25

    .line 331
    .local v25, "setCount":I
    move-object/from16 v8, p2

    .local v8, "arr$":[Lcom/github/mikephil/charting/highlight/Highlight;
    array-length v0, v8

    move/from16 v20, v0

    .local v20, "len$":I
    const/16 v17, 0x0

    .local v17, "i$":I
    :goto_13
    move/from16 v0, v17

    move/from16 v1, v20

    if-ge v0, v1, :cond_1b0

    aget-object v16, v8, v17

    .line 333
    .local v16, "high":Lcom/github/mikephil/charting/highlight/Highlight;
    invoke-virtual/range {v16 .. v16}, Lcom/github/mikephil/charting/highlight/Highlight;->getDataSetIndex()I

    move-result v2

    const/16 v29, -0x1

    move/from16 v0, v29

    if-ne v2, v0, :cond_40

    const/16 v22, 0x0

    .line 336
    .local v22, "minDataSetIndex":I
    :goto_27
    invoke-virtual/range {v16 .. v16}, Lcom/github/mikephil/charting/highlight/Highlight;->getDataSetIndex()I

    move-result v2

    const/16 v29, -0x1

    move/from16 v0, v29

    if-ne v2, v0, :cond_45

    invoke-virtual {v12}, Lcom/github/mikephil/charting/data/BarData;->getDataSetCount()I

    move-result v21

    .line 339
    .local v21, "maxDataSetIndex":I
    :goto_35
    sub-int v2, v21, v22

    const/16 v29, 0x1

    move/from16 v0, v29

    if-ge v2, v0, :cond_4c

    .line 331
    :cond_3d
    add-int/lit8 v17, v17, 0x1

    goto :goto_13

    .line 333
    .end local v21    # "maxDataSetIndex":I
    .end local v22    # "minDataSetIndex":I
    :cond_40
    invoke-virtual/range {v16 .. v16}, Lcom/github/mikephil/charting/highlight/Highlight;->getDataSetIndex()I

    move-result v22

    goto :goto_27

    .line 336
    .restart local v22    # "minDataSetIndex":I
    :cond_45
    invoke-virtual/range {v16 .. v16}, Lcom/github/mikephil/charting/highlight/Highlight;->getDataSetIndex()I

    move-result v2

    add-int/lit8 v21, v2, 0x1

    goto :goto_35

    .line 341
    .restart local v21    # "maxDataSetIndex":I
    :cond_4c
    move/from16 v13, v22

    .line 342
    .local v13, "dataSetIndex":I
    :goto_4e
    move/from16 v0, v21

    if-ge v13, v0, :cond_3d

    .line 345
    invoke-virtual {v12, v13}, Lcom/github/mikephil/charting/data/BarData;->getDataSetByIndex(I)Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    move-result-object v24

    check-cast v24, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;

    .line 347
    .local v24, "set":Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;
    if-eqz v24, :cond_60

    invoke-interface/range {v24 .. v24}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->isHighlightEnabled()Z

    move-result v2

    if-nez v2, :cond_63

    .line 343
    :cond_60
    :goto_60
    add-int/lit8 v13, v13, 0x1

    goto :goto_4e

    .line 350
    :cond_63
    invoke-interface/range {v24 .. v24}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getBarSpace()F

    move-result v2

    const/high16 v29, 0x40000000    # 2.0f

    div-float v6, v2, v29

    .line 352
    .local v6, "barspaceHalf":F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    invoke-interface/range {v24 .. v24}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getAxisDependency()Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    move-result-object v29

    move-object/from16 v0, v29

    invoke-interface {v2, v0}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->getTransformer(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/Transformer;

    move-result-object v7

    .line 354
    .local v7, "trans":Lcom/github/mikephil/charting/utils/Transformer;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mHighlightPaint:Landroid/graphics/Paint;

    invoke-interface/range {v24 .. v24}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getHighLightColor()I

    move-result v29

    move/from16 v0, v29

    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 355
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mHighlightPaint:Landroid/graphics/Paint;

    invoke-interface/range {v24 .. v24}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getHighLightAlpha()I

    move-result v29

    move/from16 v0, v29

    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 357
    invoke-virtual/range {v16 .. v16}, Lcom/github/mikephil/charting/highlight/Highlight;->getXIndex()I

    move-result v18

    .line 360
    .local v18, "index":I
    if-ltz v18, :cond_60

    move/from16 v0, v18

    int-to-float v2, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    move-object/from16 v29, v0

    invoke-interface/range {v29 .. v29}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->getXChartMax()F

    move-result v29

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseX()F

    move-result v30

    mul-float v29, v29, v30

    move/from16 v0, v25

    int-to-float v0, v0

    move/from16 v30, v0

    div-float v29, v29, v30

    cmpg-float v2, v2, v29

    if-gez v2, :cond_60

    .line 363
    move-object/from16 v0, v24

    move/from16 v1, v18

    invoke-interface {v0, v1}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getEntryForXIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v14

    check-cast v14, Lcom/github/mikephil/charting/data/BarEntry;

    .line 365
    .local v14, "e":Lcom/github/mikephil/charting/data/BarEntry;
    if-eqz v14, :cond_60

    invoke-virtual {v14}, Lcom/github/mikephil/charting/data/BarEntry;->getXIndex()I

    move-result v2

    move/from16 v0, v18

    if-ne v2, v0, :cond_60

    .line 368
    invoke-virtual {v12}, Lcom/github/mikephil/charting/data/BarData;->getGroupSpace()F

    move-result v15

    .line 369
    .local v15, "groupspace":F
    invoke-virtual/range {v16 .. v16}, Lcom/github/mikephil/charting/highlight/Highlight;->getStackIndex()I

    move-result v2

    if-gez v2, :cond_1a5

    const/16 v19, 0x0

    .line 372
    .local v19, "isStack":Z
    :goto_dd
    mul-int v2, v18, v25

    add-int/2addr v2, v13

    int-to-float v2, v2

    const/high16 v29, 0x40000000    # 2.0f

    div-float v29, v15, v29

    add-float v2, v2, v29

    move/from16 v0, v18

    int-to-float v0, v0

    move/from16 v29, v0

    mul-float v29, v29, v15

    add-float v3, v2, v29

    .line 378
    .local v3, "x":F
    if-eqz v19, :cond_1a9

    .line 379
    invoke-virtual/range {v16 .. v16}, Lcom/github/mikephil/charting/highlight/Highlight;->getRange()Lcom/github/mikephil/charting/highlight/Range;

    move-result-object v2

    iget v4, v2, Lcom/github/mikephil/charting/highlight/Range;->from:F

    .line 380
    .local v4, "y1":F
    invoke-virtual/range {v16 .. v16}, Lcom/github/mikephil/charting/highlight/Highlight;->getRange()Lcom/github/mikephil/charting/highlight/Range;

    move-result-object v2

    iget v5, v2, Lcom/github/mikephil/charting/highlight/Range;->to:F

    .local v5, "y2":F
    :goto_fe
    move-object/from16 v2, p0

    .line 386
    invoke-virtual/range {v2 .. v7}, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->prepareBarHighlight(FFFFLcom/github/mikephil/charting/utils/Transformer;)V

    .line 388
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mBarRect:Landroid/graphics/RectF;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mHighlightPaint:Landroid/graphics/Paint;

    move-object/from16 v29, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v29

    invoke-virtual {v0, v2, v1}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 390
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    invoke-interface {v2}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->isDrawHighlightArrowEnabled()Z

    move-result v2

    if-eqz v2, :cond_60

    .line 392
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mHighlightPaint:Landroid/graphics/Paint;

    const/16 v29, 0xff

    move/from16 v0, v29

    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 395
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseY()F

    move-result v2

    const v29, 0x3d8f5c29    # 0.07f

    mul-float v23, v2, v29

    .line 397
    .local v23, "offsetY":F
    const/16 v2, 0x9

    new-array v0, v2, [F

    move-object/from16 v26, v0

    .line 398
    .local v26, "values":[F
    invoke-virtual {v7}, Lcom/github/mikephil/charting/utils/Transformer;->getPixelToValueMatrix()Landroid/graphics/Matrix;

    move-result-object v2

    move-object/from16 v0, v26

    invoke-virtual {v2, v0}, Landroid/graphics/Matrix;->getValues([F)V

    .line 399
    const/4 v2, 0x4

    aget v2, v26, v2

    const/16 v29, 0x0

    aget v29, v26, v29

    div-float v2, v2, v29

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v27

    .line 402
    .local v27, "xToYRel":F
    invoke-interface/range {v24 .. v24}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getBarSpace()F

    move-result v2

    const/high16 v29, 0x40000000    # 2.0f

    div-float v11, v2, v29

    .line 403
    .local v11, "arrowWidth":F
    mul-float v10, v11, v27

    .line 405
    .local v10, "arrowHeight":F
    neg-float v2, v5

    cmpl-float v2, v4, v2

    if-lez v2, :cond_161

    :cond_161
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseY()F

    move-result v2

    mul-float v28, v4, v2

    .line 407
    .local v28, "yArrow":F
    new-instance v9, Landroid/graphics/Path;

    invoke-direct {v9}, Landroid/graphics/Path;-><init>()V

    .line 408
    .local v9, "arrow":Landroid/graphics/Path;
    const v2, 0x3ecccccd    # 0.4f

    add-float/2addr v2, v3

    add-float v29, v28, v23

    move/from16 v0, v29

    invoke-virtual {v9, v2, v0}, Landroid/graphics/Path;->moveTo(FF)V

    .line 409
    const v2, 0x3ecccccd    # 0.4f

    add-float/2addr v2, v3

    add-float/2addr v2, v11

    add-float v29, v28, v23

    sub-float v29, v29, v10

    move/from16 v0, v29

    invoke-virtual {v9, v2, v0}, Landroid/graphics/Path;->lineTo(FF)V

    .line 410
    const v2, 0x3ecccccd    # 0.4f

    add-float/2addr v2, v3

    add-float/2addr v2, v11

    add-float v29, v28, v23

    add-float v29, v29, v10

    move/from16 v0, v29

    invoke-virtual {v9, v2, v0}, Landroid/graphics/Path;->lineTo(FF)V

    .line 412
    invoke-virtual {v7, v9}, Lcom/github/mikephil/charting/utils/Transformer;->pathValueToPixel(Landroid/graphics/Path;)V

    .line 413
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mHighlightPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v9, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    goto/16 :goto_60

    .line 369
    .end local v3    # "x":F
    .end local v4    # "y1":F
    .end local v5    # "y2":F
    .end local v9    # "arrow":Landroid/graphics/Path;
    .end local v10    # "arrowHeight":F
    .end local v11    # "arrowWidth":F
    .end local v19    # "isStack":Z
    .end local v23    # "offsetY":F
    .end local v26    # "values":[F
    .end local v27    # "xToYRel":F
    .end local v28    # "yArrow":F
    :cond_1a5
    const/16 v19, 0x1

    goto/16 :goto_dd

    .line 382
    .restart local v3    # "x":F
    .restart local v19    # "isStack":Z
    :cond_1a9
    invoke-virtual {v14}, Lcom/github/mikephil/charting/data/BarEntry;->getVal()F

    move-result v4

    .line 383
    .restart local v4    # "y1":F
    const/4 v5, 0x0

    .restart local v5    # "y2":F
    goto/16 :goto_fe

    .line 418
    .end local v3    # "x":F
    .end local v4    # "y1":F
    .end local v5    # "y2":F
    .end local v6    # "barspaceHalf":F
    .end local v7    # "trans":Lcom/github/mikephil/charting/utils/Transformer;
    .end local v13    # "dataSetIndex":I
    .end local v14    # "e":Lcom/github/mikephil/charting/data/BarEntry;
    .end local v15    # "groupspace":F
    .end local v16    # "high":Lcom/github/mikephil/charting/highlight/Highlight;
    .end local v18    # "index":I
    .end local v19    # "isStack":Z
    .end local v21    # "maxDataSetIndex":I
    .end local v22    # "minDataSetIndex":I
    .end local v24    # "set":Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;
    :cond_1b0
    return-void
.end method

.method public drawValues(Landroid/graphics/Canvas;)V
    .registers 38
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    .line 196
    invoke-virtual/range {p0 .. p0}, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->passesCheck()Z

    move-result v3

    if-eqz v3, :cond_239

    .line 198
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    invoke-interface {v3}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->getBarData()Lcom/github/mikephil/charting/data/BarData;

    move-result-object v3

    invoke-virtual {v3}, Lcom/github/mikephil/charting/data/BarData;->getDataSets()Ljava/util/List;

    move-result-object v19

    .line 200
    .local v19, "dataSets":Ljava/util/List;, "Ljava/util/List<Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;>;"
    const/high16 v3, 0x40900000    # 4.5f

    invoke-static {v3}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v33

    .line 201
    .local v33, "valueOffsetPlus":F
    const/16 v27, 0x0

    .line 202
    .local v27, "posOffset":F
    const/16 v25, 0x0

    .line 203
    .local v25, "negOffset":F
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    invoke-interface {v3}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->isDrawValueAboveBarEnabled()Z

    move-result v20

    .line 205
    .local v20, "drawValueAboveBar":Z
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_25
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    invoke-interface {v3}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->getBarData()Lcom/github/mikephil/charting/data/BarData;

    move-result-object v3

    invoke-virtual {v3}, Lcom/github/mikephil/charting/data/BarData;->getDataSetCount()I

    move-result v3

    if-ge v8, v3, :cond_239

    .line 207
    move-object/from16 v0, v19

    invoke-interface {v0, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;

    .line 209
    .local v18, "dataSet":Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;
    invoke-interface/range {v18 .. v18}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->isDrawValuesEnabled()Z

    move-result v3

    if-eqz v3, :cond_47

    invoke-interface/range {v18 .. v18}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getEntryCount()I

    move-result v3

    if-nez v3, :cond_4a

    .line 205
    :cond_47
    add-int/lit8 v8, v8, 0x1

    goto :goto_25

    .line 213
    :cond_4a
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->applyValueTextStyle(Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;)V

    .line 215
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    invoke-interface/range {v18 .. v18}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getAxisDependency()Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    move-result-object v4

    invoke-interface {v3, v4}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->isInverted(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Z

    move-result v22

    .line 219
    .local v22, "isInverted":Z
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mValuePaint:Landroid/graphics/Paint;

    const-string v4, "8"

    invoke-static {v3, v4}, Lcom/github/mikephil/charting/utils/Utils;->calcTextHeight(Landroid/graphics/Paint;Ljava/lang/String;)I

    move-result v3

    int-to-float v0, v3

    move/from16 v35, v0

    .line 220
    .local v35, "valueTextHeight":F
    if-eqz v20, :cond_dc

    move/from16 v0, v33

    neg-float v0, v0

    move/from16 v27, v0

    .line 221
    :goto_71
    if-eqz v20, :cond_df

    add-float v25, v35, v33

    .line 223
    :goto_75
    if-eqz v22, :cond_81

    .line 224
    move/from16 v0, v27

    neg-float v3, v0

    sub-float v27, v3, v35

    .line 225
    move/from16 v0, v25

    neg-float v3, v0

    sub-float v25, v3, v35

    .line 228
    :cond_81
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    invoke-interface/range {v18 .. v18}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getAxisDependency()Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    move-result-object v4

    invoke-interface {v3, v4}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->getTransformer(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/Transformer;

    move-result-object v29

    .line 230
    .local v29, "trans":Lcom/github/mikephil/charting/utils/Transformer;
    move-object/from16 v0, p0

    move-object/from16 v1, v29

    move-object/from16 v2, v18

    invoke-virtual {v0, v1, v2, v8}, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->getTransformedValues(Lcom/github/mikephil/charting/utils/Transformer;Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;I)[F

    move-result-object v34

    .line 233
    .local v34, "valuePoints":[F
    invoke-interface/range {v18 .. v18}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->isStacked()Z

    move-result v3

    if-nez v3, :cond_119

    .line 235
    const/16 v23, 0x0

    .local v23, "j":I
    :goto_9f
    move/from16 v0, v23

    int-to-float v3, v0

    move-object/from16 v0, v34

    array-length v4, v0

    int-to-float v4, v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v5}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseX()F

    move-result v5

    mul-float/2addr v4, v5

    cmpg-float v3, v3, v4

    if-gez v3, :cond_47

    .line 237
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    aget v4, v34, v23

    invoke-virtual {v3, v4}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsRight(F)Z

    move-result v3

    if-eqz v3, :cond_47

    .line 240
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    add-int/lit8 v4, v23, 0x1

    aget v4, v34, v4

    invoke-virtual {v3, v4}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsY(F)Z

    move-result v3

    if-eqz v3, :cond_d9

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    aget v4, v34, v23

    invoke-virtual {v3, v4}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsLeft(F)Z

    move-result v3

    if-nez v3, :cond_e5

    .line 235
    :cond_d9
    :goto_d9
    add-int/lit8 v23, v23, 0x2

    goto :goto_9f

    .line 220
    .end local v23    # "j":I
    .end local v29    # "trans":Lcom/github/mikephil/charting/utils/Transformer;
    .end local v34    # "valuePoints":[F
    :cond_dc
    add-float v27, v35, v33

    goto :goto_71

    .line 221
    :cond_df
    move/from16 v0, v33

    neg-float v0, v0

    move/from16 v25, v0

    goto :goto_75

    .line 244
    .restart local v23    # "j":I
    .restart local v29    # "trans":Lcom/github/mikephil/charting/utils/Transformer;
    .restart local v34    # "valuePoints":[F
    :cond_e5
    div-int/lit8 v3, v23, 0x2

    move-object/from16 v0, v18

    invoke-interface {v0, v3}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v7

    check-cast v7, Lcom/github/mikephil/charting/data/BarEntry;

    .line 245
    .local v7, "entry":Lcom/github/mikephil/charting/data/BarEntry;
    invoke-virtual {v7}, Lcom/github/mikephil/charting/data/BarEntry;->getVal()F

    move-result v6

    .line 247
    .local v6, "val":F
    invoke-interface/range {v18 .. v18}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getValueFormatter()Lcom/github/mikephil/charting/formatter/ValueFormatter;

    move-result-object v5

    aget v9, v34, v23

    add-int/lit8 v3, v23, 0x1

    aget v4, v34, v3

    const/4 v3, 0x0

    cmpl-float v3, v6, v3

    if-ltz v3, :cond_116

    move/from16 v3, v27

    :goto_104
    add-float v10, v4, v3

    div-int/lit8 v3, v23, 0x2

    move-object/from16 v0, v18

    invoke-interface {v0, v3}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getValueTextColor(I)I

    move-result v11

    move-object/from16 v3, p0

    move-object/from16 v4, p1

    invoke-virtual/range {v3 .. v11}, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->drawValue(Landroid/graphics/Canvas;Lcom/github/mikephil/charting/formatter/ValueFormatter;FLcom/github/mikephil/charting/data/Entry;IFFI)V

    goto :goto_d9

    :cond_116
    move/from16 v3, v25

    goto :goto_104

    .line 254
    .end local v6    # "val":F
    .end local v7    # "entry":Lcom/github/mikephil/charting/data/BarEntry;
    .end local v23    # "j":I
    :cond_119
    const/16 v23, 0x0

    .restart local v23    # "j":I
    :goto_11b
    move/from16 v0, v23

    int-to-float v3, v0

    move-object/from16 v0, v34

    array-length v4, v0

    add-int/lit8 v4, v4, -0x1

    int-to-float v4, v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v5}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseX()F

    move-result v5

    mul-float/2addr v4, v5

    cmpg-float v3, v3, v4

    if-gez v3, :cond_47

    .line 256
    div-int/lit8 v3, v23, 0x2

    move-object/from16 v0, v18

    invoke-interface {v0, v3}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v7

    check-cast v7, Lcom/github/mikephil/charting/data/BarEntry;

    .line 258
    .restart local v7    # "entry":Lcom/github/mikephil/charting/data/BarEntry;
    invoke-virtual {v7}, Lcom/github/mikephil/charting/data/BarEntry;->getVals()[F

    move-result-object v31

    .line 263
    .local v31, "vals":[F
    if-nez v31, :cond_19a

    .line 265
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    aget v4, v34, v23

    invoke-virtual {v3, v4}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsRight(F)Z

    move-result v3

    if-eqz v3, :cond_47

    .line 268
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    add-int/lit8 v4, v23, 0x1

    aget v4, v34, v4

    invoke-virtual {v3, v4}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsY(F)Z

    move-result v3

    if-eqz v3, :cond_167

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    aget v4, v34, v23

    invoke-virtual {v3, v4}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsLeft(F)Z

    move-result v3

    if-nez v3, :cond_16a

    .line 254
    :cond_167
    :goto_167
    add-int/lit8 v23, v23, 0x2

    goto :goto_11b

    .line 272
    :cond_16a
    invoke-interface/range {v18 .. v18}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getValueFormatter()Lcom/github/mikephil/charting/formatter/ValueFormatter;

    move-result-object v11

    invoke-virtual {v7}, Lcom/github/mikephil/charting/data/BarEntry;->getVal()F

    move-result v12

    aget v15, v34, v23

    add-int/lit8 v3, v23, 0x1

    aget v4, v34, v3

    invoke-virtual {v7}, Lcom/github/mikephil/charting/data/BarEntry;->getVal()F

    move-result v3

    const/4 v5, 0x0

    cmpl-float v3, v3, v5

    if-ltz v3, :cond_197

    move/from16 v3, v27

    :goto_183
    add-float v16, v4, v3

    div-int/lit8 v3, v23, 0x2

    move-object/from16 v0, v18

    invoke-interface {v0, v3}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getValueTextColor(I)I

    move-result v17

    move-object/from16 v9, p0

    move-object/from16 v10, p1

    move-object v13, v7

    move v14, v8

    invoke-virtual/range {v9 .. v17}, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->drawValue(Landroid/graphics/Canvas;Lcom/github/mikephil/charting/formatter/ValueFormatter;FLcom/github/mikephil/charting/data/Entry;IFFI)V

    goto :goto_167

    :cond_197
    move/from16 v3, v25

    goto :goto_183

    .line 278
    :cond_19a
    div-int/lit8 v3, v23, 0x2

    move-object/from16 v0, v18

    invoke-interface {v0, v3}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getValueTextColor(I)I

    move-result v17

    .line 280
    .local v17, "color":I
    move-object/from16 v0, v31

    array-length v3, v0

    mul-int/lit8 v3, v3, 0x2

    new-array v0, v3, [F

    move-object/from16 v30, v0

    .line 282
    .local v30, "transformed":[F
    const/16 v28, 0x0

    .line 283
    .local v28, "posY":F
    invoke-virtual {v7}, Lcom/github/mikephil/charting/data/BarEntry;->getNegativeSum()F

    move-result v3

    neg-float v0, v3

    move/from16 v26, v0

    .line 285
    .local v26, "negY":F
    const/16 v24, 0x0

    .local v24, "k":I
    const/16 v21, 0x0

    .local v21, "idx":I
    :goto_1b8
    move-object/from16 v0, v30

    array-length v3, v0

    move/from16 v0, v24

    if-ge v0, v3, :cond_1e2

    .line 287
    aget v32, v31, v21

    .line 290
    .local v32, "value":F
    const/4 v3, 0x0

    cmpl-float v3, v32, v3

    if-ltz v3, :cond_1dd

    .line 291
    add-float v28, v28, v32

    .line 292
    move/from16 v16, v28

    .line 298
    .local v16, "y":F
    :goto_1ca
    add-int/lit8 v3, v24, 0x1

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseY()F

    move-result v4

    mul-float v4, v4, v16

    aput v4, v30, v3

    .line 285
    add-int/lit8 v24, v24, 0x2

    add-int/lit8 v21, v21, 0x1

    goto :goto_1b8

    .line 294
    .end local v16    # "y":F
    :cond_1dd
    move/from16 v16, v26

    .line 295
    .restart local v16    # "y":F
    sub-float v26, v26, v32

    goto :goto_1ca

    .line 301
    .end local v16    # "y":F
    .end local v32    # "value":F
    :cond_1e2
    invoke-virtual/range {v29 .. v30}, Lcom/github/mikephil/charting/utils/Transformer;->pointValuesToPixel([F)V

    .line 303
    const/16 v24, 0x0

    :goto_1e7
    move-object/from16 v0, v30

    array-length v3, v0

    move/from16 v0, v24

    if-ge v0, v3, :cond_167

    .line 305
    aget v15, v34, v23

    .line 306
    .local v15, "x":F
    add-int/lit8 v3, v24, 0x1

    aget v4, v30, v3

    div-int/lit8 v3, v24, 0x2

    aget v3, v31, v3

    const/4 v5, 0x0

    cmpl-float v3, v3, v5

    if-ltz v3, :cond_224

    move/from16 v3, v27

    :goto_1ff
    add-float v16, v4, v3

    .line 309
    .restart local v16    # "y":F
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v3, v15}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsRight(F)Z

    move-result v3

    if-eqz v3, :cond_167

    .line 312
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    move/from16 v0, v16

    invoke-virtual {v3, v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsY(F)Z

    move-result v3

    if-eqz v3, :cond_221

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v3, v15}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsLeft(F)Z

    move-result v3

    if-nez v3, :cond_227

    .line 303
    :cond_221
    :goto_221
    add-int/lit8 v24, v24, 0x2

    goto :goto_1e7

    .end local v16    # "y":F
    :cond_224
    move/from16 v3, v25

    .line 306
    goto :goto_1ff

    .line 316
    .restart local v16    # "y":F
    :cond_227
    invoke-interface/range {v18 .. v18}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getValueFormatter()Lcom/github/mikephil/charting/formatter/ValueFormatter;

    move-result-object v11

    div-int/lit8 v3, v24, 0x2

    aget v12, v31, v3

    move-object/from16 v9, p0

    move-object/from16 v10, p1

    move-object v13, v7

    move v14, v8

    invoke-virtual/range {v9 .. v17}, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->drawValue(Landroid/graphics/Canvas;Lcom/github/mikephil/charting/formatter/ValueFormatter;FLcom/github/mikephil/charting/data/Entry;IFFI)V

    goto :goto_221

    .line 323
    .end local v7    # "entry":Lcom/github/mikephil/charting/data/BarEntry;
    .end local v8    # "i":I
    .end local v15    # "x":F
    .end local v16    # "y":F
    .end local v17    # "color":I
    .end local v18    # "dataSet":Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;
    .end local v19    # "dataSets":Ljava/util/List;, "Ljava/util/List<Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;>;"
    .end local v20    # "drawValueAboveBar":Z
    .end local v21    # "idx":I
    .end local v22    # "isInverted":Z
    .end local v23    # "j":I
    .end local v24    # "k":I
    .end local v25    # "negOffset":F
    .end local v26    # "negY":F
    .end local v27    # "posOffset":F
    .end local v28    # "posY":F
    .end local v29    # "trans":Lcom/github/mikephil/charting/utils/Transformer;
    .end local v30    # "transformed":[F
    .end local v31    # "vals":[F
    .end local v33    # "valueOffsetPlus":F
    .end local v34    # "valuePoints":[F
    .end local v35    # "valueTextHeight":F
    :cond_239
    return-void
.end method

.method public getTransformedValues(Lcom/github/mikephil/charting/utils/Transformer;Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;I)[F
    .registers 6
    .param p1, "trans"    # Lcom/github/mikephil/charting/utils/Transformer;
    .param p2, "data"    # Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;
    .param p3, "dataSetIndex"    # I

    .prologue
    .line 422
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    invoke-interface {v0}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->getBarData()Lcom/github/mikephil/charting/data/BarData;

    move-result-object v0

    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseY()F

    move-result v1

    invoke-virtual {p1, p2, p3, v0, v1}, Lcom/github/mikephil/charting/utils/Transformer;->generateTransformedValuesBarChart(Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;ILcom/github/mikephil/charting/data/BarData;F)[F

    move-result-object v0

    return-object v0
.end method

.method public initBuffers()V
    .registers 10

    .prologue
    .line 57
    iget-object v3, p0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    invoke-interface {v3}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->getBarData()Lcom/github/mikephil/charting/data/BarData;

    move-result-object v0

    .line 58
    .local v0, "barData":Lcom/github/mikephil/charting/data/BarData;
    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/BarData;->getDataSetCount()I

    move-result v3

    new-array v3, v3, [Lcom/github/mikephil/charting/buffer/BarBuffer;

    iput-object v3, p0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mBarBuffers:[Lcom/github/mikephil/charting/buffer/BarBuffer;

    .line 60
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_f
    iget-object v3, p0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mBarBuffers:[Lcom/github/mikephil/charting/buffer/BarBuffer;

    array-length v3, v3

    if-ge v1, v3, :cond_45

    .line 61
    invoke-virtual {v0, v1}, Lcom/github/mikephil/charting/data/BarData;->getDataSetByIndex(I)Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    move-result-object v2

    check-cast v2, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;

    .line 62
    .local v2, "set":Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;
    iget-object v4, p0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mBarBuffers:[Lcom/github/mikephil/charting/buffer/BarBuffer;

    new-instance v5, Lcom/github/mikephil/charting/buffer/BarBuffer;

    invoke-interface {v2}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getEntryCount()I

    move-result v3

    mul-int/lit8 v6, v3, 0x4

    invoke-interface {v2}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->isStacked()Z

    move-result v3

    if-eqz v3, :cond_43

    invoke-interface {v2}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getStackSize()I

    move-result v3

    :goto_2e
    mul-int/2addr v3, v6

    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/BarData;->getGroupSpace()F

    move-result v6

    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/BarData;->getDataSetCount()I

    move-result v7

    invoke-interface {v2}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->isStacked()Z

    move-result v8

    invoke-direct {v5, v3, v6, v7, v8}, Lcom/github/mikephil/charting/buffer/BarBuffer;-><init>(IFIZ)V

    aput-object v5, v4, v1

    .line 60
    add-int/lit8 v1, v1, 0x1

    goto :goto_f

    .line 62
    :cond_43
    const/4 v3, 0x1

    goto :goto_2e

    .line 66
    .end local v2    # "set":Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;
    :cond_45
    return-void
.end method

.method protected passesCheck()Z
    .registers 4

    .prologue
    .line 428
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    invoke-interface {v0}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->getBarData()Lcom/github/mikephil/charting/data/BarData;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/BarData;->getYValCount()I

    move-result v0

    int-to-float v0, v0

    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    invoke-interface {v1}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->getMaxVisibleCount()I

    move-result v1

    int-to-float v1, v1

    iget-object v2, p0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getScaleX()F

    move-result v2

    mul-float/2addr v1, v2

    cmpg-float v0, v0, v1

    if-gez v0, :cond_1f

    const/4 v0, 0x1

    :goto_1e
    return v0

    :cond_1f
    const/4 v0, 0x0

    goto :goto_1e
.end method

.method protected prepareBarHighlight(FFFFLcom/github/mikephil/charting/utils/Transformer;)V
    .registers 13
    .param p1, "x"    # F
    .param p2, "y1"    # F
    .param p3, "y2"    # F
    .param p4, "barspaceHalf"    # F
    .param p5, "trans"    # Lcom/github/mikephil/charting/utils/Transformer;

    .prologue
    .line 181
    const/high16 v0, 0x3f000000    # 0.5f

    .line 183
    .local v0, "barWidth":F
    sub-float v5, p1, v0

    add-float v2, v5, p4

    .line 184
    .local v2, "left":F
    add-float v5, p1, v0

    sub-float v3, v5, p4

    .line 185
    .local v3, "right":F
    move v4, p2

    .line 186
    .local v4, "top":F
    move v1, p3

    .line 188
    .local v1, "bottom":F
    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mBarRect:Landroid/graphics/RectF;

    invoke-virtual {v5, v2, v4, v3, v1}, Landroid/graphics/RectF;->set(FFFF)V

    .line 190
    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mBarRect:Landroid/graphics/RectF;

    iget-object v6, p0, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v6}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseY()F

    move-result v6

    invoke-virtual {p5, v5, v6}, Lcom/github/mikephil/charting/utils/Transformer;->rectValueToPixel(Landroid/graphics/RectF;F)V

    .line 191
    return-void
.end method
