.class public Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;
.super Lcom/github/mikephil/charting/renderer/BarChartRenderer;
.source "HorizontalBarChartRenderer.java"


# direct methods
.method public constructor <init>(Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;Lcom/github/mikephil/charting/animation/ChartAnimator;Lcom/github/mikephil/charting/utils/ViewPortHandler;)V
    .registers 6
    .param p1, "chart"    # Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;
    .param p2, "animator"    # Lcom/github/mikephil/charting/animation/ChartAnimator;
    .param p3, "viewPortHandler"    # Lcom/github/mikephil/charting/utils/ViewPortHandler;

    .prologue
    .line 30
    invoke-direct {p0, p1, p2, p3}, Lcom/github/mikephil/charting/renderer/BarChartRenderer;-><init>(Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;Lcom/github/mikephil/charting/animation/ChartAnimator;Lcom/github/mikephil/charting/utils/ViewPortHandler;)V

    .line 32
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mValuePaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 33
    return-void
.end method


# virtual methods
.method protected drawDataSet(Landroid/graphics/Canvas;Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;I)V
    .registers 16
    .param p1, "c"    # Landroid/graphics/Canvas;
    .param p2, "dataSet"    # Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;
    .param p3, "index"    # I

    .prologue
    .line 52
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    invoke-interface {p2}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getAxisDependency()Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->getTransformer(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/Transformer;

    move-result-object v11

    .line 54
    .local v11, "trans":Lcom/github/mikephil/charting/utils/Transformer;
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mShadowPaint:Landroid/graphics/Paint;

    invoke-interface {p2}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getBarShadowColor()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 55
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mBarBorderPaint:Landroid/graphics/Paint;

    invoke-interface {p2}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getBarBorderColor()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 56
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mBarBorderPaint:Landroid/graphics/Paint;

    invoke-interface {p2}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getBarBorderWidth()F

    move-result v1

    invoke-static {v1}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 58
    invoke-interface {p2}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getBarBorderWidth()F

    move-result v0

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_7b

    const/4 v7, 0x1

    .line 60
    .local v7, "drawBorder":Z
    :goto_33
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseX()F

    move-result v9

    .line 61
    .local v9, "phaseX":F
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseY()F

    move-result v10

    .line 64
    .local v10, "phaseY":F
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mBarBuffers:[Lcom/github/mikephil/charting/buffer/BarBuffer;

    aget-object v6, v0, p3

    .line 65
    .local v6, "buffer":Lcom/github/mikephil/charting/buffer/BarBuffer;
    invoke-virtual {v6, v9, v10}, Lcom/github/mikephil/charting/buffer/BarBuffer;->setPhases(FF)V

    .line 66
    invoke-interface {p2}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getBarSpace()F

    move-result v0

    invoke-virtual {v6, v0}, Lcom/github/mikephil/charting/buffer/BarBuffer;->setBarSpace(F)V

    .line 67
    invoke-virtual {v6, p3}, Lcom/github/mikephil/charting/buffer/BarBuffer;->setDataSet(I)V

    .line 68
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    invoke-interface {p2}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getAxisDependency()Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->isInverted(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Z

    move-result v0

    invoke-virtual {v6, v0}, Lcom/github/mikephil/charting/buffer/BarBuffer;->setInverted(Z)V

    .line 70
    invoke-virtual {v6, p2}, Lcom/github/mikephil/charting/buffer/BarBuffer;->feed(Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;)V

    .line 72
    iget-object v0, v6, Lcom/github/mikephil/charting/buffer/BarBuffer;->buffer:[F

    invoke-virtual {v11, v0}, Lcom/github/mikephil/charting/utils/Transformer;->pointValuesToPixel([F)V

    .line 74
    const/4 v8, 0x0

    .local v8, "j":I
    :goto_66
    invoke-virtual {v6}, Lcom/github/mikephil/charting/buffer/BarBuffer;->size()I

    move-result v0

    if-ge v8, v0, :cond_7a

    .line 76
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    iget-object v1, v6, Lcom/github/mikephil/charting/buffer/BarBuffer;->buffer:[F

    add-int/lit8 v2, v8, 0x3

    aget v1, v1, v2

    invoke-virtual {v0, v1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsTop(F)Z

    move-result v0

    if-nez v0, :cond_7d

    .line 99
    :cond_7a
    return-void

    .line 58
    .end local v6    # "buffer":Lcom/github/mikephil/charting/buffer/BarBuffer;
    .end local v7    # "drawBorder":Z
    .end local v8    # "j":I
    .end local v9    # "phaseX":F
    .end local v10    # "phaseY":F
    :cond_7b
    const/4 v7, 0x0

    goto :goto_33

    .line 79
    .restart local v6    # "buffer":Lcom/github/mikephil/charting/buffer/BarBuffer;
    .restart local v7    # "drawBorder":Z
    .restart local v8    # "j":I
    .restart local v9    # "phaseX":F
    .restart local v10    # "phaseY":F
    :cond_7d
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    iget-object v1, v6, Lcom/github/mikephil/charting/buffer/BarBuffer;->buffer:[F

    add-int/lit8 v2, v8, 0x1

    aget v1, v1, v2

    invoke-virtual {v0, v1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsBottom(F)Z

    move-result v0

    if-nez v0, :cond_8e

    .line 74
    :cond_8b
    :goto_8b
    add-int/lit8 v8, v8, 0x4

    goto :goto_66

    .line 82
    :cond_8e
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    invoke-interface {v0}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->isDrawBarShadowEnabled()Z

    move-result v0

    if-eqz v0, :cond_b4

    .line 83
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentLeft()F

    move-result v1

    iget-object v0, v6, Lcom/github/mikephil/charting/buffer/BarBuffer;->buffer:[F

    add-int/lit8 v2, v8, 0x1

    aget v2, v0, v2

    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentRight()F

    move-result v3

    iget-object v0, v6, Lcom/github/mikephil/charting/buffer/BarBuffer;->buffer:[F

    add-int/lit8 v4, v8, 0x3

    aget v4, v0, v4

    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mShadowPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 90
    :cond_b4
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    div-int/lit8 v1, v8, 0x4

    invoke-interface {p2, v1}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 91
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

    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 94
    if-eqz v7, :cond_8b

    .line 95
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

    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mBarBorderPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    goto :goto_8b
.end method

.method protected drawValue(Landroid/graphics/Canvas;Ljava/lang/String;FFI)V
    .registers 7
    .param p1, "c"    # Landroid/graphics/Canvas;
    .param p2, "valueText"    # Ljava/lang/String;
    .param p3, "x"    # F
    .param p4, "y"    # F
    .param p5, "color"    # I

    .prologue
    .line 267
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mValuePaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p5}, Landroid/graphics/Paint;->setColor(I)V

    .line 268
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mValuePaint:Landroid/graphics/Paint;

    invoke-virtual {p1, p2, p3, p4, v0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 269
    return-void
.end method

.method public drawValues(Landroid/graphics/Canvas;)V
    .registers 34
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    .line 104
    invoke-virtual/range {p0 .. p0}, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->passesCheck()Z

    move-result v2

    if-eqz v2, :cond_2a3

    .line 106
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    invoke-interface {v2}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->getBarData()Lcom/github/mikephil/charting/data/BarData;

    move-result-object v2

    invoke-virtual {v2}, Lcom/github/mikephil/charting/data/BarData;->getDataSets()Ljava/util/List;

    move-result-object v9

    .line 108
    .local v9, "dataSets":Ljava/util/List;, "Ljava/util/List<Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;>;"
    const/high16 v2, 0x40a00000    # 5.0f

    invoke-static {v2}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v28

    .line 109
    .local v28, "valueOffsetPlus":F
    const/16 v21, 0x0

    .line 110
    .local v21, "posOffset":F
    const/16 v19, 0x0

    .line 111
    .local v19, "negOffset":F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    invoke-interface {v2}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->isDrawValueAboveBarEnabled()Z

    move-result v10

    .line 113
    .local v10, "drawValueAboveBar":Z
    const/4 v14, 0x0

    .local v14, "i":I
    :goto_25
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    invoke-interface {v2}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->getBarData()Lcom/github/mikephil/charting/data/BarData;

    move-result-object v2

    invoke-virtual {v2}, Lcom/github/mikephil/charting/data/BarData;->getDataSetCount()I

    move-result v2

    if-ge v14, v2, :cond_2a3

    .line 115
    invoke-interface {v9, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;

    .line 117
    .local v8, "dataSet":Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;
    invoke-interface {v8}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->isDrawValuesEnabled()Z

    move-result v2

    if-eqz v2, :cond_45

    invoke-interface {v8}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getEntryCount()I

    move-result v2

    if-nez v2, :cond_48

    .line 113
    :cond_45
    add-int/lit8 v14, v14, 0x1

    goto :goto_25

    .line 120
    :cond_48
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    invoke-interface {v8}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getAxisDependency()Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->isInverted(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Z

    move-result v16

    .line 123
    .local v16, "isInverted":Z
    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->applyValueTextStyle(Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;)V

    .line 124
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mValuePaint:Landroid/graphics/Paint;

    const-string v3, "10"

    invoke-static {v2, v3}, Lcom/github/mikephil/charting/utils/Utils;->calcTextHeight(Landroid/graphics/Paint;Ljava/lang/String;)I

    move-result v2

    int-to-float v2, v2

    const/high16 v3, 0x40000000    # 2.0f

    div-float v13, v2, v3

    .line 126
    .local v13, "halfTextHeight":F
    invoke-interface {v8}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getValueFormatter()Lcom/github/mikephil/charting/formatter/ValueFormatter;

    move-result-object v12

    .line 128
    .local v12, "formatter":Lcom/github/mikephil/charting/formatter/ValueFormatter;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    invoke-interface {v8}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getAxisDependency()Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->getTransformer(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/Transformer;

    move-result-object v23

    .line 130
    .local v23, "trans":Lcom/github/mikephil/charting/utils/Transformer;
    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-virtual {v0, v1, v8, v14}, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->getTransformedValues(Lcom/github/mikephil/charting/utils/Transformer;Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;I)[F

    move-result-object v29

    .line 133
    .local v29, "valuePoints":[F
    invoke-interface {v8}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->isStacked()Z

    move-result v2

    if-nez v2, :cond_12a

    .line 135
    const/16 v17, 0x0

    .local v17, "j":I
    :goto_88
    move/from16 v0, v17

    int-to-float v2, v0

    move-object/from16 v0, v29

    array-length v3, v0

    int-to-float v3, v3

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v6}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseX()F

    move-result v6

    mul-float/2addr v3, v6

    cmpg-float v2, v2, v3

    if-gez v2, :cond_45

    .line 137
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    add-int/lit8 v3, v17, 0x1

    aget v3, v29, v3

    invoke-virtual {v2, v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsTop(F)Z

    move-result v2

    if-eqz v2, :cond_45

    .line 140
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    aget v3, v29, v17

    invoke-virtual {v2, v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsX(F)Z

    move-result v2

    if-nez v2, :cond_b9

    .line 135
    :cond_b6
    :goto_b6
    add-int/lit8 v17, v17, 0x2

    goto :goto_88

    .line 143
    :cond_b9
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    add-int/lit8 v3, v17, 0x1

    aget v3, v29, v3

    invoke-virtual {v2, v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsBottom(F)Z

    move-result v2

    if-eqz v2, :cond_b6

    .line 146
    div-int/lit8 v2, v17, 0x2

    invoke-interface {v8, v2}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v11

    check-cast v11, Lcom/github/mikephil/charting/data/BarEntry;

    .line 147
    .local v11, "e":Lcom/github/mikephil/charting/data/BarEntry;
    invoke-virtual {v11}, Lcom/github/mikephil/charting/data/BarEntry;->getVal()F

    move-result v25

    .line 148
    .local v25, "val":F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    move/from16 v0, v25

    invoke-interface {v12, v0, v11, v14, v2}, Lcom/github/mikephil/charting/formatter/ValueFormatter;->getFormattedValue(FLcom/github/mikephil/charting/data/Entry;ILcom/github/mikephil/charting/utils/ViewPortHandler;)Ljava/lang/String;

    move-result-object v4

    .line 151
    .local v4, "formattedValue":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mValuePaint:Landroid/graphics/Paint;

    invoke-static {v2, v4}, Lcom/github/mikephil/charting/utils/Utils;->calcTextWidth(Landroid/graphics/Paint;Ljava/lang/String;)I

    move-result v2

    int-to-float v0, v2

    move/from16 v30, v0

    .line 152
    .local v30, "valueTextWidth":F
    if-eqz v10, :cond_11e

    move/from16 v21, v28

    .line 153
    :goto_ec
    if-eqz v10, :cond_124

    add-float v2, v30, v28

    neg-float v0, v2

    move/from16 v19, v0

    .line 155
    :goto_f3
    if-eqz v16, :cond_ff

    .line 156
    move/from16 v0, v21

    neg-float v2, v0

    sub-float v21, v2, v30

    .line 157
    move/from16 v0, v19

    neg-float v2, v0

    sub-float v19, v2, v30

    .line 160
    :cond_ff
    aget v3, v29, v17

    const/4 v2, 0x0

    cmpl-float v2, v25, v2

    if-ltz v2, :cond_127

    move/from16 v2, v21

    :goto_108
    add-float v5, v3, v2

    add-int/lit8 v2, v17, 0x1

    aget v2, v29, v2

    add-float v6, v2, v13

    div-int/lit8 v2, v17, 0x2

    invoke-interface {v8, v2}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getValueTextColor(I)I

    move-result v7

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    invoke-virtual/range {v2 .. v7}, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->drawValue(Landroid/graphics/Canvas;Ljava/lang/String;FFI)V

    goto :goto_b6

    .line 152
    :cond_11e
    add-float v2, v30, v28

    neg-float v0, v2

    move/from16 v21, v0

    goto :goto_ec

    :cond_124
    move/from16 v19, v28

    .line 153
    goto :goto_f3

    :cond_127
    move/from16 v2, v19

    .line 160
    goto :goto_108

    .line 167
    .end local v4    # "formattedValue":Ljava/lang/String;
    .end local v11    # "e":Lcom/github/mikephil/charting/data/BarEntry;
    .end local v17    # "j":I
    .end local v25    # "val":F
    .end local v30    # "valueTextWidth":F
    :cond_12a
    const/16 v17, 0x0

    .restart local v17    # "j":I
    :goto_12c
    move/from16 v0, v17

    int-to-float v2, v0

    move-object/from16 v0, v29

    array-length v3, v0

    add-int/lit8 v3, v3, -0x1

    int-to-float v3, v3

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v6}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseX()F

    move-result v6

    mul-float/2addr v3, v6

    cmpg-float v2, v2, v3

    if-gez v2, :cond_45

    .line 169
    div-int/lit8 v2, v17, 0x2

    invoke-interface {v8, v2}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v11

    check-cast v11, Lcom/github/mikephil/charting/data/BarEntry;

    .line 171
    .restart local v11    # "e":Lcom/github/mikephil/charting/data/BarEntry;
    invoke-virtual {v11}, Lcom/github/mikephil/charting/data/BarEntry;->getVals()[F

    move-result-object v26

    .line 176
    .local v26, "vals":[F
    if-nez v26, :cond_1da

    .line 178
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    add-int/lit8 v3, v17, 0x1

    aget v3, v29, v3

    invoke-virtual {v2, v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsTop(F)Z

    move-result v2

    if-eqz v2, :cond_45

    .line 181
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    aget v3, v29, v17

    invoke-virtual {v2, v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsX(F)Z

    move-result v2

    if-nez v2, :cond_16d

    .line 167
    :cond_16a
    :goto_16a
    add-int/lit8 v17, v17, 0x2

    goto :goto_12c

    .line 184
    :cond_16d
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    add-int/lit8 v3, v17, 0x1

    aget v3, v29, v3

    invoke-virtual {v2, v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsBottom(F)Z

    move-result v2

    if-eqz v2, :cond_16a

    .line 187
    invoke-virtual {v11}, Lcom/github/mikephil/charting/data/BarEntry;->getVal()F

    move-result v25

    .line 188
    .restart local v25    # "val":F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    move/from16 v0, v25

    invoke-interface {v12, v0, v11, v14, v2}, Lcom/github/mikephil/charting/formatter/ValueFormatter;->getFormattedValue(FLcom/github/mikephil/charting/data/Entry;ILcom/github/mikephil/charting/utils/ViewPortHandler;)Ljava/lang/String;

    move-result-object v4

    .line 191
    .restart local v4    # "formattedValue":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mValuePaint:Landroid/graphics/Paint;

    invoke-static {v2, v4}, Lcom/github/mikephil/charting/utils/Utils;->calcTextWidth(Landroid/graphics/Paint;Ljava/lang/String;)I

    move-result v2

    int-to-float v0, v2

    move/from16 v30, v0

    .line 192
    .restart local v30    # "valueTextWidth":F
    if-eqz v10, :cond_1ce

    move/from16 v21, v28

    .line 193
    :goto_198
    if-eqz v10, :cond_1d4

    add-float v2, v30, v28

    neg-float v0, v2

    move/from16 v19, v0

    .line 195
    :goto_19f
    if-eqz v16, :cond_1ab

    .line 196
    move/from16 v0, v21

    neg-float v2, v0

    sub-float v21, v2, v30

    .line 197
    move/from16 v0, v19

    neg-float v2, v0

    sub-float v19, v2, v30

    .line 200
    :cond_1ab
    aget v3, v29, v17

    invoke-virtual {v11}, Lcom/github/mikephil/charting/data/BarEntry;->getVal()F

    move-result v2

    const/4 v6, 0x0

    cmpl-float v2, v2, v6

    if-ltz v2, :cond_1d7

    move/from16 v2, v21

    :goto_1b8
    add-float v5, v3, v2

    add-int/lit8 v2, v17, 0x1

    aget v2, v29, v2

    add-float v6, v2, v13

    div-int/lit8 v2, v17, 0x2

    invoke-interface {v8, v2}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getValueTextColor(I)I

    move-result v7

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    invoke-virtual/range {v2 .. v7}, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->drawValue(Landroid/graphics/Canvas;Ljava/lang/String;FFI)V

    goto :goto_16a

    .line 192
    :cond_1ce
    add-float v2, v30, v28

    neg-float v0, v2

    move/from16 v21, v0

    goto :goto_198

    :cond_1d4
    move/from16 v19, v28

    .line 193
    goto :goto_19f

    :cond_1d7
    move/from16 v2, v19

    .line 200
    goto :goto_1b8

    .line 206
    .end local v4    # "formattedValue":Ljava/lang/String;
    .end local v25    # "val":F
    .end local v30    # "valueTextWidth":F
    :cond_1da
    move-object/from16 v0, v26

    array-length v2, v0

    mul-int/lit8 v2, v2, 0x2

    new-array v0, v2, [F

    move-object/from16 v24, v0

    .line 208
    .local v24, "transformed":[F
    const/16 v22, 0x0

    .line 209
    .local v22, "posY":F
    invoke-virtual {v11}, Lcom/github/mikephil/charting/data/BarEntry;->getNegativeSum()F

    move-result v2

    neg-float v0, v2

    move/from16 v20, v0

    .line 211
    .local v20, "negY":F
    const/16 v18, 0x0

    .local v18, "k":I
    const/4 v15, 0x0

    .local v15, "idx":I
    :goto_1ef
    move-object/from16 v0, v24

    array-length v2, v0

    move/from16 v0, v18

    if-ge v0, v2, :cond_217

    .line 213
    aget v27, v26, v15

    .line 216
    .local v27, "value":F
    const/4 v2, 0x0

    cmpl-float v2, v27, v2

    if-ltz v2, :cond_212

    .line 217
    add-float v22, v22, v27

    .line 218
    move/from16 v31, v22

    .line 224
    .local v31, "y":F
    :goto_201
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseY()F

    move-result v2

    mul-float v2, v2, v31

    aput v2, v24, v18

    .line 211
    add-int/lit8 v18, v18, 0x2

    add-int/lit8 v15, v15, 0x1

    goto :goto_1ef

    .line 220
    .end local v31    # "y":F
    :cond_212
    move/from16 v31, v20

    .line 221
    .restart local v31    # "y":F
    sub-float v20, v20, v27

    goto :goto_201

    .line 227
    .end local v27    # "value":F
    .end local v31    # "y":F
    :cond_217
    invoke-virtual/range {v23 .. v24}, Lcom/github/mikephil/charting/utils/Transformer;->pointValuesToPixel([F)V

    .line 229
    const/16 v18, 0x0

    :goto_21c
    move-object/from16 v0, v24

    array-length v2, v0

    move/from16 v0, v18

    if-ge v0, v2, :cond_16a

    .line 231
    div-int/lit8 v2, v18, 0x2

    aget v25, v26, v2

    .line 232
    .restart local v25    # "val":F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    move/from16 v0, v25

    invoke-interface {v12, v0, v11, v14, v2}, Lcom/github/mikephil/charting/formatter/ValueFormatter;->getFormattedValue(FLcom/github/mikephil/charting/data/Entry;ILcom/github/mikephil/charting/utils/ViewPortHandler;)Ljava/lang/String;

    move-result-object v4

    .line 235
    .restart local v4    # "formattedValue":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mValuePaint:Landroid/graphics/Paint;

    invoke-static {v2, v4}, Lcom/github/mikephil/charting/utils/Utils;->calcTextWidth(Landroid/graphics/Paint;Ljava/lang/String;)I

    move-result v2

    int-to-float v0, v2

    move/from16 v30, v0

    .line 236
    .restart local v30    # "valueTextWidth":F
    if-eqz v10, :cond_27b

    move/from16 v21, v28

    .line 237
    :goto_240
    if-eqz v10, :cond_281

    add-float v2, v30, v28

    neg-float v0, v2

    move/from16 v19, v0

    .line 239
    :goto_247
    if-eqz v16, :cond_253

    .line 240
    move/from16 v0, v21

    neg-float v2, v0

    sub-float v21, v2, v30

    .line 241
    move/from16 v0, v19

    neg-float v2, v0

    sub-float v19, v2, v30

    .line 244
    :cond_253
    aget v3, v24, v18

    const/4 v2, 0x0

    cmpl-float v2, v25, v2

    if-ltz v2, :cond_284

    move/from16 v2, v21

    :goto_25c
    add-float v5, v3, v2

    .line 246
    .local v5, "x":F
    add-int/lit8 v2, v17, 0x1

    aget v31, v29, v2

    .line 248
    .restart local v31    # "y":F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    move/from16 v0, v31

    invoke-virtual {v2, v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsTop(F)Z

    move-result v2

    if-eqz v2, :cond_16a

    .line 251
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v2, v5}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsX(F)Z

    move-result v2

    if-nez v2, :cond_287

    .line 229
    :cond_278
    :goto_278
    add-int/lit8 v18, v18, 0x2

    goto :goto_21c

    .line 236
    .end local v5    # "x":F
    .end local v31    # "y":F
    :cond_27b
    add-float v2, v30, v28

    neg-float v0, v2

    move/from16 v21, v0

    goto :goto_240

    :cond_281
    move/from16 v19, v28

    .line 237
    goto :goto_247

    :cond_284
    move/from16 v2, v19

    .line 244
    goto :goto_25c

    .line 254
    .restart local v5    # "x":F
    .restart local v31    # "y":F
    :cond_287
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    move/from16 v0, v31

    invoke-virtual {v2, v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsBottom(F)Z

    move-result v2

    if-eqz v2, :cond_278

    .line 257
    add-float v6, v31, v13

    div-int/lit8 v2, v17, 0x2

    invoke-interface {v8, v2}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getValueTextColor(I)I

    move-result v7

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    invoke-virtual/range {v2 .. v7}, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->drawValue(Landroid/graphics/Canvas;Ljava/lang/String;FFI)V

    goto :goto_278

    .line 264
    .end local v4    # "formattedValue":Ljava/lang/String;
    .end local v5    # "x":F
    .end local v8    # "dataSet":Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;
    .end local v9    # "dataSets":Ljava/util/List;, "Ljava/util/List<Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;>;"
    .end local v10    # "drawValueAboveBar":Z
    .end local v11    # "e":Lcom/github/mikephil/charting/data/BarEntry;
    .end local v12    # "formatter":Lcom/github/mikephil/charting/formatter/ValueFormatter;
    .end local v13    # "halfTextHeight":F
    .end local v14    # "i":I
    .end local v15    # "idx":I
    .end local v16    # "isInverted":Z
    .end local v17    # "j":I
    .end local v18    # "k":I
    .end local v19    # "negOffset":F
    .end local v20    # "negY":F
    .end local v21    # "posOffset":F
    .end local v22    # "posY":F
    .end local v23    # "trans":Lcom/github/mikephil/charting/utils/Transformer;
    .end local v24    # "transformed":[F
    .end local v25    # "val":F
    .end local v26    # "vals":[F
    .end local v28    # "valueOffsetPlus":F
    .end local v29    # "valuePoints":[F
    .end local v30    # "valueTextWidth":F
    .end local v31    # "y":F
    :cond_2a3
    return-void
.end method

.method public getTransformedValues(Lcom/github/mikephil/charting/utils/Transformer;Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;I)[F
    .registers 6
    .param p1, "trans"    # Lcom/github/mikephil/charting/utils/Transformer;
    .param p2, "data"    # Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;
    .param p3, "dataSetIndex"    # I

    .prologue
    .line 288
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    invoke-interface {v0}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->getBarData()Lcom/github/mikephil/charting/data/BarData;

    move-result-object v0

    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseY()F

    move-result v1

    invoke-virtual {p1, p2, p3, v0, v1}, Lcom/github/mikephil/charting/utils/Transformer;->generateTransformedValuesHorizontalBarChart(Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;ILcom/github/mikephil/charting/data/BarData;F)[F

    move-result-object v0

    return-object v0
.end method

.method public initBuffers()V
    .registers 10

    .prologue
    .line 38
    iget-object v3, p0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    invoke-interface {v3}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->getBarData()Lcom/github/mikephil/charting/data/BarData;

    move-result-object v0

    .line 39
    .local v0, "barData":Lcom/github/mikephil/charting/data/BarData;
    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/BarData;->getDataSetCount()I

    move-result v3

    new-array v3, v3, [Lcom/github/mikephil/charting/buffer/HorizontalBarBuffer;

    iput-object v3, p0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mBarBuffers:[Lcom/github/mikephil/charting/buffer/BarBuffer;

    .line 41
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_f
    iget-object v3, p0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mBarBuffers:[Lcom/github/mikephil/charting/buffer/BarBuffer;

    array-length v3, v3

    if-ge v1, v3, :cond_45

    .line 42
    invoke-virtual {v0, v1}, Lcom/github/mikephil/charting/data/BarData;->getDataSetByIndex(I)Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    move-result-object v2

    check-cast v2, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;

    .line 43
    .local v2, "set":Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;
    iget-object v4, p0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mBarBuffers:[Lcom/github/mikephil/charting/buffer/BarBuffer;

    new-instance v5, Lcom/github/mikephil/charting/buffer/HorizontalBarBuffer;

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

    invoke-direct {v5, v3, v6, v7, v8}, Lcom/github/mikephil/charting/buffer/HorizontalBarBuffer;-><init>(IFIZ)V

    aput-object v5, v4, v1

    .line 41
    add-int/lit8 v1, v1, 0x1

    goto :goto_f

    .line 43
    :cond_43
    const/4 v3, 0x1

    goto :goto_2e

    .line 47
    .end local v2    # "set":Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;
    :cond_45
    return-void
.end method

.method protected passesCheck()Z
    .registers 4

    .prologue
    .line 294
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    invoke-interface {v0}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->getBarData()Lcom/github/mikephil/charting/data/BarData;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/BarData;->getYValCount()I

    move-result v0

    int-to-float v0, v0

    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    invoke-interface {v1}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->getMaxVisibleCount()I

    move-result v1

    int-to-float v1, v1

    iget-object v2, p0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getScaleY()F

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
    .registers 12
    .param p1, "x"    # F
    .param p2, "y1"    # F
    .param p3, "y2"    # F
    .param p4, "barspaceHalf"    # F
    .param p5, "trans"    # Lcom/github/mikephil/charting/utils/Transformer;

    .prologue
    const/high16 v5, 0x3f000000    # 0.5f

    .line 275
    sub-float v4, p1, v5

    add-float v3, v4, p4

    .line 276
    .local v3, "top":F
    add-float v4, p1, v5

    sub-float v0, v4, p4

    .line 277
    .local v0, "bottom":F
    move v1, p2

    .line 278
    .local v1, "left":F
    move v2, p3

    .line 280
    .local v2, "right":F
    iget-object v4, p0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mBarRect:Landroid/graphics/RectF;

    invoke-virtual {v4, v1, v3, v2, v0}, Landroid/graphics/RectF;->set(FFFF)V

    .line 282
    iget-object v4, p0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mBarRect:Landroid/graphics/RectF;

    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v5}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseY()F

    move-result v5

    invoke-virtual {p5, v4, v5}, Lcom/github/mikephil/charting/utils/Transformer;->rectValueToPixelHorizontal(Landroid/graphics/RectF;F)V

    .line 283
    return-void
.end method
