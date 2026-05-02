.class public Lcom/github/mikephil/charting/charts/HorizontalBarChart;
.super Lcom/github/mikephil/charting/charts/BarChart;
.source "HorizontalBarChart.java"


# instance fields
.field private mOffsetsBuffer:Landroid/graphics/RectF;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 33
    invoke-direct {p0, p1}, Lcom/github/mikephil/charting/charts/BarChart;-><init>(Landroid/content/Context;)V

    .line 59
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mOffsetsBuffer:Landroid/graphics/RectF;

    .line 34
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 37
    invoke-direct {p0, p1, p2}, Lcom/github/mikephil/charting/charts/BarChart;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 59
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mOffsetsBuffer:Landroid/graphics/RectF;

    .line 38
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 41
    invoke-direct {p0, p1, p2, p3}, Lcom/github/mikephil/charting/charts/BarChart;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 59
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mOffsetsBuffer:Landroid/graphics/RectF;

    .line 42
    return-void
.end method


# virtual methods
.method protected calcModulus()V
    .registers 7

    .prologue
    const/4 v5, 0x1

    .line 133
    const/16 v1, 0x9

    new-array v0, v1, [F

    .line 134
    .local v0, "values":[F
    iget-object v1, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getMatrixTouch()Landroid/graphics/Matrix;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/graphics/Matrix;->getValues([F)V

    .line 136
    iget-object v2, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    check-cast v1, Lcom/github/mikephil/charting/data/BarData;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/data/BarData;->getXValCount()I

    move-result v1

    iget-object v3, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget v3, v3, Lcom/github/mikephil/charting/components/XAxis;->mLabelRotatedHeight:I

    mul-int/2addr v1, v3

    int-to-float v1, v1

    iget-object v3, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentHeight()F

    move-result v3

    const/4 v4, 0x4

    aget v4, v0, v4

    mul-float/2addr v3, v4

    div-float/2addr v1, v3

    float-to-double v3, v1

    invoke-static {v3, v4}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v3

    double-to-int v1, v3

    iput v1, v2, Lcom/github/mikephil/charting/components/XAxis;->mAxisLabelModulus:I

    .line 140
    iget-object v1, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget v1, v1, Lcom/github/mikephil/charting/components/XAxis;->mAxisLabelModulus:I

    if-ge v1, v5, :cond_3b

    .line 141
    iget-object v1, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iput v5, v1, Lcom/github/mikephil/charting/components/XAxis;->mAxisLabelModulus:I

    .line 142
    :cond_3b
    return-void
.end method

.method public calculateOffsets()V
    .registers 12

    .prologue
    .line 64
    const/4 v2, 0x0

    .local v2, "offsetLeft":F
    const/4 v3, 0x0

    .local v3, "offsetRight":F
    const/4 v4, 0x0

    .local v4, "offsetTop":F
    const/4 v1, 0x0

    .line 66
    .local v1, "offsetBottom":F
    iget-object v6, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mOffsetsBuffer:Landroid/graphics/RectF;

    invoke-virtual {p0, v6}, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->calculateLegendOffsets(Landroid/graphics/RectF;)V

    .line 68
    iget-object v6, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mOffsetsBuffer:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->left:F

    add-float/2addr v2, v6

    .line 69
    iget-object v6, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mOffsetsBuffer:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->top:F

    add-float/2addr v4, v6

    .line 70
    iget-object v6, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mOffsetsBuffer:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->right:F

    add-float/2addr v3, v6

    .line 71
    iget-object v6, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mOffsetsBuffer:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->bottom:F

    add-float/2addr v1, v6

    .line 74
    iget-object v6, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mAxisLeft:Lcom/github/mikephil/charting/components/YAxis;

    invoke-virtual {v6}, Lcom/github/mikephil/charting/components/YAxis;->needsOffset()Z

    move-result v6

    if-eqz v6, :cond_32

    .line 75
    iget-object v6, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mAxisLeft:Lcom/github/mikephil/charting/components/YAxis;

    iget-object v7, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mAxisRendererLeft:Lcom/github/mikephil/charting/renderer/YAxisRenderer;

    invoke-virtual {v7}, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->getPaintAxisLabels()Landroid/graphics/Paint;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/github/mikephil/charting/components/YAxis;->getRequiredHeightSpace(Landroid/graphics/Paint;)F

    move-result v6

    add-float/2addr v4, v6

    .line 78
    :cond_32
    iget-object v6, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mAxisRight:Lcom/github/mikephil/charting/components/YAxis;

    invoke-virtual {v6}, Lcom/github/mikephil/charting/components/YAxis;->needsOffset()Z

    move-result v6

    if-eqz v6, :cond_47

    .line 79
    iget-object v6, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mAxisRight:Lcom/github/mikephil/charting/components/YAxis;

    iget-object v7, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mAxisRendererRight:Lcom/github/mikephil/charting/renderer/YAxisRenderer;

    invoke-virtual {v7}, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->getPaintAxisLabels()Landroid/graphics/Paint;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/github/mikephil/charting/components/YAxis;->getRequiredHeightSpace(Landroid/graphics/Paint;)F

    move-result v6

    add-float/2addr v1, v6

    .line 82
    :cond_47
    iget-object v6, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget v6, v6, Lcom/github/mikephil/charting/components/XAxis;->mLabelRotatedWidth:I

    int-to-float v5, v6

    .line 84
    .local v5, "xlabelwidth":F
    iget-object v6, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v6}, Lcom/github/mikephil/charting/components/XAxis;->isEnabled()Z

    move-result v6

    if-eqz v6, :cond_5f

    .line 87
    iget-object v6, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v6}, Lcom/github/mikephil/charting/components/XAxis;->getPosition()Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;

    move-result-object v6

    sget-object v7, Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;->BOTTOM:Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;

    if-ne v6, v7, :cond_f1

    .line 89
    add-float/2addr v2, v5

    .line 102
    :cond_5f
    :goto_5f
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->getExtraTopOffset()F

    move-result v6

    add-float/2addr v4, v6

    .line 103
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->getExtraRightOffset()F

    move-result v6

    add-float/2addr v3, v6

    .line 104
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->getExtraBottomOffset()F

    move-result v6

    add-float/2addr v1, v6

    .line 105
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->getExtraLeftOffset()F

    move-result v6

    add-float/2addr v2, v6

    .line 107
    iget v6, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mMinOffset:F

    invoke-static {v6}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v0

    .line 109
    .local v0, "minOffset":F
    iget-object v6, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-static {v0, v2}, Ljava/lang/Math;->max(FF)F

    move-result v7

    invoke-static {v0, v4}, Ljava/lang/Math;->max(FF)F

    move-result v8

    invoke-static {v0, v3}, Ljava/lang/Math;->max(FF)F

    move-result v9

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v10

    invoke-virtual {v6, v7, v8, v9, v10}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->restrainViewPort(FFFF)V

    .line 115
    iget-boolean v6, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mLogEnabled:Z

    if-eqz v6, :cond_ea

    .line 116
    const-string v6, "MPAndroidChart"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "offsetLeft: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", offsetTop: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", offsetRight: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", offsetBottom: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 118
    const-string v6, "MPAndroidChart"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Content: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v8}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getContentRect()Landroid/graphics/RectF;

    move-result-object v8

    invoke-virtual {v8}, Landroid/graphics/RectF;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 121
    :cond_ea
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->prepareOffsetMatrix()V

    .line 122
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->prepareValuePxMatrix()V

    .line 123
    return-void

    .line 91
    .end local v0    # "minOffset":F
    :cond_f1
    iget-object v6, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v6}, Lcom/github/mikephil/charting/components/XAxis;->getPosition()Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;

    move-result-object v6

    sget-object v7, Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;->TOP:Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;

    if-ne v6, v7, :cond_fe

    .line 93
    add-float/2addr v3, v5

    goto/16 :goto_5f

    .line 95
    :cond_fe
    iget-object v6, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v6}, Lcom/github/mikephil/charting/components/XAxis;->getPosition()Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;

    move-result-object v6

    sget-object v7, Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;->BOTH_SIDED:Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;

    if-ne v6, v7, :cond_5f

    .line 97
    add-float/2addr v2, v5

    .line 98
    add-float/2addr v3, v5

    goto/16 :goto_5f
.end method

.method public getBarBounds(Lcom/github/mikephil/charting/data/BarEntry;)Landroid/graphics/RectF;
    .registers 14
    .param p1, "e"    # Lcom/github/mikephil/charting/data/BarEntry;

    .prologue
    const/high16 v11, 0x3f000000    # 0.5f

    const/4 v4, 0x0

    .line 147
    iget-object v10, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    check-cast v10, Lcom/github/mikephil/charting/data/BarData;

    invoke-virtual {v10, p1}, Lcom/github/mikephil/charting/data/BarData;->getDataSetForEntry(Lcom/github/mikephil/charting/data/Entry;)Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    move-result-object v5

    check-cast v5, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;

    .line 149
    .local v5, "set":Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;
    if-nez v5, :cond_11

    .line 150
    const/4 v2, 0x0

    .line 167
    :goto_10
    return-object v2

    .line 152
    :cond_11
    invoke-interface {v5}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getBarSpace()F

    move-result v0

    .line 153
    .local v0, "barspace":F
    invoke-virtual {p1}, Lcom/github/mikephil/charting/data/BarEntry;->getVal()F

    move-result v9

    .line 154
    .local v9, "y":F
    invoke-virtual {p1}, Lcom/github/mikephil/charting/data/BarEntry;->getXIndex()I

    move-result v10

    int-to-float v8, v10

    .line 156
    .local v8, "x":F
    const/high16 v10, 0x40000000    # 2.0f

    div-float v6, v0, v10

    .line 158
    .local v6, "spaceHalf":F
    sub-float v10, v8, v11

    add-float v7, v10, v6

    .line 159
    .local v7, "top":F
    add-float v10, v8, v11

    sub-float v1, v10, v6

    .line 160
    .local v1, "bottom":F
    cmpl-float v10, v9, v4

    if-ltz v10, :cond_45

    move v3, v9

    .line 161
    .local v3, "left":F
    :goto_2f
    cmpg-float v10, v9, v4

    if-gtz v10, :cond_34

    move v4, v9

    .line 163
    .local v4, "right":F
    :cond_34
    new-instance v2, Landroid/graphics/RectF;

    invoke-direct {v2, v3, v7, v4, v1}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 165
    .local v2, "bounds":Landroid/graphics/RectF;
    invoke-interface {v5}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getAxisDependency()Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    move-result-object v10

    invoke-virtual {p0, v10}, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->getTransformer(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/Transformer;

    move-result-object v10

    invoke-virtual {v10, v2}, Lcom/github/mikephil/charting/utils/Transformer;->rectValueToPixel(Landroid/graphics/RectF;)V

    goto :goto_10

    .end local v2    # "bounds":Landroid/graphics/RectF;
    .end local v3    # "left":F
    .end local v4    # "right":F
    :cond_45
    move v3, v4

    .line 160
    goto :goto_2f
.end method

.method public getHighestVisibleXIndex()I
    .registers 7

    .prologue
    const/high16 v0, 0x3f800000    # 1.0f

    const/4 v5, 0x1

    .line 226
    iget-object v3, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    check-cast v3, Lcom/github/mikephil/charting/data/BarData;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/data/BarData;->getDataSetCount()I

    move-result v3

    int-to-float v2, v3

    .line 227
    .local v2, "step":F
    cmpg-float v3, v2, v0

    if-gtz v3, :cond_3e

    .line 229
    .local v0, "div":F
    :goto_10
    const/4 v3, 0x2

    new-array v1, v3, [F

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentLeft()F

    move-result v4

    aput v4, v1, v3

    iget-object v3, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentTop()F

    move-result v3

    aput v3, v1, v5

    .line 231
    .local v1, "pts":[F
    sget-object v3, Lcom/github/mikephil/charting/components/YAxis$AxisDependency;->LEFT:Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    invoke-virtual {p0, v3}, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->getTransformer(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/Transformer;

    move-result-object v3

    invoke-virtual {v3, v1}, Lcom/github/mikephil/charting/utils/Transformer;->pixelsToValue([F)V

    .line 232
    aget v3, v1, v5

    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->getXChartMax()F

    move-result v4

    cmpl-float v3, v3, v4

    if-ltz v3, :cond_49

    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->getXChartMax()F

    move-result v3

    div-float/2addr v3, v0

    :goto_3c
    float-to-int v3, v3

    return v3

    .line 227
    .end local v0    # "div":F
    .end local v1    # "pts":[F
    :cond_3e
    iget-object v3, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    check-cast v3, Lcom/github/mikephil/charting/data/BarData;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/data/BarData;->getGroupSpace()F

    move-result v3

    add-float v0, v2, v3

    goto :goto_10

    .line 232
    .restart local v0    # "div":F
    .restart local v1    # "pts":[F
    :cond_49
    aget v3, v1, v5

    div-float/2addr v3, v0

    goto :goto_3c
.end method

.method public getHighlightByTouchPoint(FF)Lcom/github/mikephil/charting/highlight/Highlight;
    .registers 5
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    .line 194
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    if-nez v0, :cond_d

    .line 195
    const-string v0, "MPAndroidChart"

    const-string v1, "Can\'t select by touch. No data set."

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 196
    const/4 v0, 0x0

    .line 198
    :goto_c
    return-object v0

    :cond_d
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->getHighlighter()Lcom/github/mikephil/charting/highlight/ChartHighlighter;

    move-result-object v0

    invoke-virtual {v0, p2, p1}, Lcom/github/mikephil/charting/highlight/ChartHighlighter;->getHighlight(FF)Lcom/github/mikephil/charting/highlight/Highlight;

    move-result-object v0

    goto :goto_c
.end method

.method public getLowestVisibleXIndex()I
    .registers 9

    .prologue
    const/4 v5, 0x0

    const/4 v7, 0x1

    const/high16 v4, 0x3f800000    # 1.0f

    .line 209
    iget-object v3, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    check-cast v3, Lcom/github/mikephil/charting/data/BarData;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/data/BarData;->getDataSetCount()I

    move-result v3

    int-to-float v2, v3

    .line 210
    .local v2, "step":F
    cmpg-float v3, v2, v4

    if-gtz v3, :cond_39

    move v0, v4

    .line 212
    .local v0, "div":F
    :goto_12
    const/4 v3, 0x2

    new-array v1, v3, [F

    const/4 v3, 0x0

    iget-object v6, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v6}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentLeft()F

    move-result v6

    aput v6, v1, v3

    iget-object v3, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentBottom()F

    move-result v3

    aput v3, v1, v7

    .line 214
    .local v1, "pts":[F
    sget-object v3, Lcom/github/mikephil/charting/components/YAxis$AxisDependency;->LEFT:Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    invoke-virtual {p0, v3}, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->getTransformer(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/Transformer;

    move-result-object v3

    invoke-virtual {v3, v1}, Lcom/github/mikephil/charting/utils/Transformer;->pixelsToValue([F)V

    .line 215
    aget v3, v1, v7

    cmpg-float v3, v3, v5

    if-gtz v3, :cond_44

    move v3, v5

    :goto_36
    add-float/2addr v3, v4

    float-to-int v3, v3

    return v3

    .line 210
    .end local v0    # "div":F
    .end local v1    # "pts":[F
    :cond_39
    iget-object v3, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    check-cast v3, Lcom/github/mikephil/charting/data/BarData;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/data/BarData;->getGroupSpace()F

    move-result v3

    add-float v0, v2, v3

    goto :goto_12

    .line 215
    .restart local v0    # "div":F
    .restart local v1    # "pts":[F
    :cond_44
    aget v3, v1, v7

    div-float/2addr v3, v0

    goto :goto_36
.end method

.method public getPosition(Lcom/github/mikephil/charting/data/Entry;Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Landroid/graphics/PointF;
    .registers 7
    .param p1, "e"    # Lcom/github/mikephil/charting/data/Entry;
    .param p2, "axis"    # Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 173
    if-nez p1, :cond_6

    .line 174
    const/4 v1, 0x0

    .line 180
    :goto_5
    return-object v1

    .line 176
    :cond_6
    const/4 v1, 0x2

    new-array v0, v1, [F

    invoke-virtual {p1}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v1

    aput v1, v0, v2

    invoke-virtual {p1}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v1

    int-to-float v1, v1

    aput v1, v0, v3

    .line 178
    .local v0, "vals":[F
    invoke-virtual {p0, p2}, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->getTransformer(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/Transformer;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/github/mikephil/charting/utils/Transformer;->pointValuesToPixel([F)V

    .line 180
    new-instance v1, Landroid/graphics/PointF;

    aget v2, v0, v2

    aget v3, v0, v3

    invoke-direct {v1, v2, v3}, Landroid/graphics/PointF;-><init>(FF)V

    goto :goto_5
.end method

.method protected init()V
    .registers 5

    .prologue
    .line 46
    invoke-super {p0}, Lcom/github/mikephil/charting/charts/BarChart;->init()V

    .line 48
    new-instance v0, Lcom/github/mikephil/charting/utils/TransformerHorizontalBarChart;

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-direct {v0, v1}, Lcom/github/mikephil/charting/utils/TransformerHorizontalBarChart;-><init>(Lcom/github/mikephil/charting/utils/ViewPortHandler;)V

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mLeftAxisTransformer:Lcom/github/mikephil/charting/utils/Transformer;

    .line 49
    new-instance v0, Lcom/github/mikephil/charting/utils/TransformerHorizontalBarChart;

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-direct {v0, v1}, Lcom/github/mikephil/charting/utils/TransformerHorizontalBarChart;-><init>(Lcom/github/mikephil/charting/utils/ViewPortHandler;)V

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mRightAxisTransformer:Lcom/github/mikephil/charting/utils/Transformer;

    .line 51
    new-instance v0, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    iget-object v2, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-direct {v0, p0, v1, v2}, Lcom/github/mikephil/charting/renderer/HorizontalBarChartRenderer;-><init>(Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;Lcom/github/mikephil/charting/animation/ChartAnimator;Lcom/github/mikephil/charting/utils/ViewPortHandler;)V

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mRenderer:Lcom/github/mikephil/charting/renderer/DataRenderer;

    .line 52
    new-instance v0, Lcom/github/mikephil/charting/highlight/HorizontalBarHighlighter;

    invoke-direct {v0, p0}, Lcom/github/mikephil/charting/highlight/HorizontalBarHighlighter;-><init>(Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;)V

    invoke-virtual {p0, v0}, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->setHighlighter(Lcom/github/mikephil/charting/highlight/ChartHighlighter;)V

    .line 54
    new-instance v0, Lcom/github/mikephil/charting/renderer/YAxisRendererHorizontalBarChart;

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    iget-object v2, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mAxisLeft:Lcom/github/mikephil/charting/components/YAxis;

    iget-object v3, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mLeftAxisTransformer:Lcom/github/mikephil/charting/utils/Transformer;

    invoke-direct {v0, v1, v2, v3}, Lcom/github/mikephil/charting/renderer/YAxisRendererHorizontalBarChart;-><init>(Lcom/github/mikephil/charting/utils/ViewPortHandler;Lcom/github/mikephil/charting/components/YAxis;Lcom/github/mikephil/charting/utils/Transformer;)V

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mAxisRendererLeft:Lcom/github/mikephil/charting/renderer/YAxisRenderer;

    .line 55
    new-instance v0, Lcom/github/mikephil/charting/renderer/YAxisRendererHorizontalBarChart;

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    iget-object v2, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mAxisRight:Lcom/github/mikephil/charting/components/YAxis;

    iget-object v3, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mRightAxisTransformer:Lcom/github/mikephil/charting/utils/Transformer;

    invoke-direct {v0, v1, v2, v3}, Lcom/github/mikephil/charting/renderer/YAxisRendererHorizontalBarChart;-><init>(Lcom/github/mikephil/charting/utils/ViewPortHandler;Lcom/github/mikephil/charting/components/YAxis;Lcom/github/mikephil/charting/utils/Transformer;)V

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mAxisRendererRight:Lcom/github/mikephil/charting/renderer/YAxisRenderer;

    .line 56
    new-instance v0, Lcom/github/mikephil/charting/renderer/XAxisRendererHorizontalBarChart;

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    iget-object v2, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget-object v3, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mLeftAxisTransformer:Lcom/github/mikephil/charting/utils/Transformer;

    invoke-direct {v0, v1, v2, v3, p0}, Lcom/github/mikephil/charting/renderer/XAxisRendererHorizontalBarChart;-><init>(Lcom/github/mikephil/charting/utils/ViewPortHandler;Lcom/github/mikephil/charting/components/XAxis;Lcom/github/mikephil/charting/utils/Transformer;Lcom/github/mikephil/charting/charts/BarChart;)V

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mXAxisRenderer:Lcom/github/mikephil/charting/renderer/XAxisRenderer;

    .line 57
    return-void
.end method

.method protected prepareValuePxMatrix()V
    .registers 6

    .prologue
    .line 127
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mRightAxisTransformer:Lcom/github/mikephil/charting/utils/Transformer;

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mAxisRight:Lcom/github/mikephil/charting/components/YAxis;

    iget v1, v1, Lcom/github/mikephil/charting/components/YAxis;->mAxisMinimum:F

    iget-object v2, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mAxisRight:Lcom/github/mikephil/charting/components/YAxis;

    iget v2, v2, Lcom/github/mikephil/charting/components/YAxis;->mAxisRange:F

    iget-object v3, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget v3, v3, Lcom/github/mikephil/charting/components/XAxis;->mAxisRange:F

    iget-object v4, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget v4, v4, Lcom/github/mikephil/charting/components/XAxis;->mAxisMinimum:F

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/github/mikephil/charting/utils/Transformer;->prepareMatrixValuePx(FFFF)V

    .line 128
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mLeftAxisTransformer:Lcom/github/mikephil/charting/utils/Transformer;

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mAxisLeft:Lcom/github/mikephil/charting/components/YAxis;

    iget v1, v1, Lcom/github/mikephil/charting/components/YAxis;->mAxisMinimum:F

    iget-object v2, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mAxisLeft:Lcom/github/mikephil/charting/components/YAxis;

    iget v2, v2, Lcom/github/mikephil/charting/components/YAxis;->mAxisRange:F

    iget-object v3, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget v3, v3, Lcom/github/mikephil/charting/components/XAxis;->mAxisRange:F

    iget-object v4, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget v4, v4, Lcom/github/mikephil/charting/components/XAxis;->mAxisMinimum:F

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/github/mikephil/charting/utils/Transformer;->prepareMatrixValuePx(FFFF)V

    .line 129
    return-void
.end method
