.class public Lcom/github/mikephil/charting/renderer/XAxisRendererBarChart;
.super Lcom/github/mikephil/charting/renderer/XAxisRenderer;
.source "XAxisRendererBarChart.java"


# instance fields
.field protected mChart:Lcom/github/mikephil/charting/charts/BarChart;


# direct methods
.method public constructor <init>(Lcom/github/mikephil/charting/utils/ViewPortHandler;Lcom/github/mikephil/charting/components/XAxis;Lcom/github/mikephil/charting/utils/Transformer;Lcom/github/mikephil/charting/charts/BarChart;)V
    .registers 5
    .param p1, "viewPortHandler"    # Lcom/github/mikephil/charting/utils/ViewPortHandler;
    .param p2, "xAxis"    # Lcom/github/mikephil/charting/components/XAxis;
    .param p3, "trans"    # Lcom/github/mikephil/charting/utils/Transformer;
    .param p4, "chart"    # Lcom/github/mikephil/charting/charts/BarChart;

    .prologue
    .line 20
    invoke-direct {p0, p1, p2, p3}, Lcom/github/mikephil/charting/renderer/XAxisRenderer;-><init>(Lcom/github/mikephil/charting/utils/ViewPortHandler;Lcom/github/mikephil/charting/components/XAxis;Lcom/github/mikephil/charting/utils/Transformer;)V

    .line 22
    iput-object p4, p0, Lcom/github/mikephil/charting/renderer/XAxisRendererBarChart;->mChart:Lcom/github/mikephil/charting/charts/BarChart;

    .line 23
    return-void
.end method


# virtual methods
.method protected drawLabels(Landroid/graphics/Canvas;FLandroid/graphics/PointF;)V
    .registers 16
    .param p1, "c"    # Landroid/graphics/Canvas;
    .param p2, "pos"    # F
    .param p3, "anchor"    # Landroid/graphics/PointF;

    .prologue
    .line 33
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRendererBarChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/components/XAxis;->getLabelRotationAngle()F

    move-result v7

    .line 36
    .local v7, "labelRotationAngleDegrees":F
    const/4 v0, 0x2

    new-array v9, v0, [F

    fill-array-data v9, :array_e6

    .line 40
    .local v9, "position":[F
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRendererBarChart;->mChart:Lcom/github/mikephil/charting/charts/BarChart;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/charts/BarChart;->getData()Lcom/github/mikephil/charting/data/ChartData;

    move-result-object v8

    check-cast v8, Lcom/github/mikephil/charting/data/BarData;

    .line 41
    .local v8, "bd":Lcom/github/mikephil/charting/data/BarData;
    invoke-virtual {v8}, Lcom/github/mikephil/charting/data/BarData;->getDataSetCount()I

    move-result v10

    .line 43
    .local v10, "step":I
    iget v3, p0, Lcom/github/mikephil/charting/renderer/XAxisRendererBarChart;->mMinX:I

    .local v3, "i":I
    :goto_1a
    iget v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRendererBarChart;->mMaxX:I

    if-gt v3, v0, :cond_e5

    .line 45
    const/4 v0, 0x0

    mul-int v1, v3, v10

    int-to-float v1, v1

    int-to-float v4, v3

    invoke-virtual {v8}, Lcom/github/mikephil/charting/data/BarData;->getGroupSpace()F

    move-result v5

    mul-float/2addr v4, v5

    add-float/2addr v1, v4

    invoke-virtual {v8}, Lcom/github/mikephil/charting/data/BarData;->getGroupSpace()F

    move-result v4

    const/high16 v5, 0x40000000    # 2.0f

    div-float/2addr v4, v5

    add-float/2addr v1, v4

    aput v1, v9, v0

    .line 49
    const/4 v0, 0x1

    if-le v10, v0, :cond_43

    .line 50
    const/4 v0, 0x0

    aget v1, v9, v0

    int-to-float v4, v10

    const/high16 v5, 0x3f800000    # 1.0f

    sub-float/2addr v4, v5

    const/high16 v5, 0x40000000    # 2.0f

    div-float/2addr v4, v5

    add-float/2addr v1, v4

    aput v1, v9, v0

    .line 53
    :cond_43
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRendererBarChart;->mTrans:Lcom/github/mikephil/charting/utils/Transformer;

    invoke-virtual {v0, v9}, Lcom/github/mikephil/charting/utils/Transformer;->pointValuesToPixel([F)V

    .line 55
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRendererBarChart;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    const/4 v1, 0x0

    aget v1, v9, v1

    invoke-virtual {v0, v1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsX(F)Z

    move-result v0

    if-eqz v0, :cond_b4

    if-ltz v3, :cond_b4

    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRendererBarChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/components/XAxis;->getValues()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge v3, v0, :cond_b4

    .line 58
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRendererBarChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/components/XAxis;->getValues()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 60
    .local v2, "label":Ljava/lang/String;
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRendererBarChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/components/XAxis;->isAvoidFirstLastClippingEnabled()Z

    move-result v0

    if-eqz v0, :cond_aa

    .line 63
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRendererBarChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/components/XAxis;->getValues()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-ne v3, v0, :cond_bb

    .line 64
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRendererBarChart;->mAxisLabelPaint:Landroid/graphics/Paint;

    invoke-static {v0, v2}, Lcom/github/mikephil/charting/utils/Utils;->calcTextWidth(Landroid/graphics/Paint;Ljava/lang/String;)I

    move-result v0

    int-to-float v11, v0

    .line 66
    .local v11, "width":F
    const/4 v0, 0x0

    aget v0, v9, v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float v1, v11, v1

    add-float/2addr v0, v1

    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/XAxisRendererBarChart;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentRight()F

    move-result v1

    cmpl-float v0, v0, v1

    if-lez v0, :cond_aa

    .line 67
    const/4 v0, 0x0

    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/XAxisRendererBarChart;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentRight()F

    move-result v1

    const/high16 v4, 0x40000000    # 2.0f

    div-float v4, v11, v4

    sub-float/2addr v1, v4

    aput v1, v9, v0

    .line 79
    .end local v11    # "width":F
    :cond_aa
    :goto_aa
    const/4 v0, 0x0

    aget v4, v9, v0

    move-object v0, p0

    move-object v1, p1

    move v5, p2

    move-object v6, p3

    invoke-virtual/range {v0 .. v7}, Lcom/github/mikephil/charting/renderer/XAxisRendererBarChart;->drawLabel(Landroid/graphics/Canvas;Ljava/lang/String;IFFLandroid/graphics/PointF;F)V

    .line 43
    .end local v2    # "label":Ljava/lang/String;
    :cond_b4
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRendererBarChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget v0, v0, Lcom/github/mikephil/charting/components/XAxis;->mAxisLabelModulus:I

    add-int/2addr v3, v0

    goto/16 :goto_1a

    .line 70
    .restart local v2    # "label":Ljava/lang/String;
    :cond_bb
    if-nez v3, :cond_aa

    .line 72
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRendererBarChart;->mAxisLabelPaint:Landroid/graphics/Paint;

    invoke-static {v0, v2}, Lcom/github/mikephil/charting/utils/Utils;->calcTextWidth(Landroid/graphics/Paint;Ljava/lang/String;)I

    move-result v0

    int-to-float v11, v0

    .line 74
    .restart local v11    # "width":F
    const/4 v0, 0x0

    aget v0, v9, v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float v1, v11, v1

    sub-float/2addr v0, v1

    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/XAxisRendererBarChart;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentLeft()F

    move-result v1

    cmpg-float v0, v0, v1

    if-gez v0, :cond_aa

    .line 75
    const/4 v0, 0x0

    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/XAxisRendererBarChart;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentLeft()F

    move-result v1

    const/high16 v4, 0x40000000    # 2.0f

    div-float v4, v11, v4

    add-float/2addr v1, v4

    aput v1, v9, v0

    goto :goto_aa

    .line 82
    .end local v2    # "label":Ljava/lang/String;
    .end local v11    # "width":F
    :cond_e5
    return-void

    .line 36
    :array_e6
    .array-data 4
        0x0
        0x0
    .end array-data
.end method

.method public renderGridLines(Landroid/graphics/Canvas;)V
    .registers 13
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v10, 0x0

    .line 87
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRendererBarChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/components/XAxis;->isDrawGridLinesEnabled()Z

    move-result v0

    if-eqz v0, :cond_11

    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRendererBarChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/components/XAxis;->isEnabled()Z

    move-result v0

    if-nez v0, :cond_12

    .line 112
    :cond_11
    return-void

    .line 90
    :cond_12
    const/4 v0, 0x2

    new-array v8, v0, [F

    fill-array-data v8, :array_7a

    .line 94
    .local v8, "position":[F
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRendererBarChart;->mGridPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/XAxisRendererBarChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/components/XAxis;->getGridColor()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 95
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRendererBarChart;->mGridPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/XAxisRendererBarChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/components/XAxis;->getGridLineWidth()F

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 97
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRendererBarChart;->mChart:Lcom/github/mikephil/charting/charts/BarChart;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/charts/BarChart;->getData()Lcom/github/mikephil/charting/data/ChartData;

    move-result-object v6

    check-cast v6, Lcom/github/mikephil/charting/data/BarData;

    .line 98
    .local v6, "bd":Lcom/github/mikephil/charting/data/BarData;
    invoke-virtual {v6}, Lcom/github/mikephil/charting/data/BarData;->getDataSetCount()I

    move-result v9

    .line 100
    .local v9, "step":I
    iget v7, p0, Lcom/github/mikephil/charting/renderer/XAxisRendererBarChart;->mMinX:I

    .local v7, "i":I
    :goto_3c
    iget v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRendererBarChart;->mMaxX:I

    if-ge v7, v0, :cond_11

    .line 102
    mul-int v0, v7, v9

    int-to-float v0, v0

    int-to-float v1, v7

    invoke-virtual {v6}, Lcom/github/mikephil/charting/data/BarData;->getGroupSpace()F

    move-result v2

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    const/high16 v1, 0x3f000000    # 0.5f

    sub-float/2addr v0, v1

    aput v0, v8, v10

    .line 104
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRendererBarChart;->mTrans:Lcom/github/mikephil/charting/utils/Transformer;

    invoke-virtual {v0, v8}, Lcom/github/mikephil/charting/utils/Transformer;->pointValuesToPixel([F)V

    .line 106
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRendererBarChart;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    aget v1, v8, v10

    invoke-virtual {v0, v1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsX(F)Z

    move-result v0

    if-eqz v0, :cond_74

    .line 108
    aget v1, v8, v10

    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRendererBarChart;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->offsetTop()F

    move-result v2

    aget v3, v8, v10

    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRendererBarChart;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentBottom()F

    move-result v4

    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/XAxisRendererBarChart;->mGridPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 100
    :cond_74
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRendererBarChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget v0, v0, Lcom/github/mikephil/charting/components/XAxis;->mAxisLabelModulus:I

    add-int/2addr v7, v0

    goto :goto_3c

    .line 90
    :array_7a
    .array-data 4
        0x0
        0x0
    .end array-data
.end method
