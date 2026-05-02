.class public Lcom/github/mikephil/charting/renderer/XAxisRenderer;
.super Lcom/github/mikephil/charting/renderer/AxisRenderer;
.source "XAxisRenderer.java"


# instance fields
.field private mLimitLinePath:Landroid/graphics/Path;

.field mLimitLineSegmentsBuffer:[F

.field protected mXAxis:Lcom/github/mikephil/charting/components/XAxis;


# direct methods
.method public constructor <init>(Lcom/github/mikephil/charting/utils/ViewPortHandler;Lcom/github/mikephil/charting/components/XAxis;Lcom/github/mikephil/charting/utils/Transformer;)V
    .registers 6
    .param p1, "viewPortHandler"    # Lcom/github/mikephil/charting/utils/ViewPortHandler;
    .param p2, "xAxis"    # Lcom/github/mikephil/charting/components/XAxis;
    .param p3, "trans"    # Lcom/github/mikephil/charting/utils/Transformer;

    .prologue
    .line 26
    invoke-direct {p0, p1, p3}, Lcom/github/mikephil/charting/renderer/AxisRenderer;-><init>(Lcom/github/mikephil/charting/utils/ViewPortHandler;Lcom/github/mikephil/charting/utils/Transformer;)V

    .line 262
    const/4 v0, 0x4

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mLimitLineSegmentsBuffer:[F

    .line 263
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mLimitLinePath:Landroid/graphics/Path;

    .line 28
    iput-object p2, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    .line 30
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mAxisLabelPaint:Landroid/graphics/Paint;

    const/high16 v1, -0x1000000

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 31
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mAxisLabelPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 32
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mAxisLabelPaint:Landroid/graphics/Paint;

    const/high16 v1, 0x41200000    # 10.0f

    invoke-static {v1}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 33
    return-void
.end method


# virtual methods
.method public computeAxis(FLjava/util/List;)V
    .registers 16
    .param p1, "xValMaximumLength"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p2, "xValues":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/16 v12, 0x68

    .line 37
    iget-object v10, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mAxisLabelPaint:Landroid/graphics/Paint;

    iget-object v11, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v11}, Lcom/github/mikephil/charting/components/XAxis;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 38
    iget-object v10, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mAxisLabelPaint:Landroid/graphics/Paint;

    iget-object v11, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v11}, Lcom/github/mikephil/charting/components/XAxis;->getTextSize()F

    move-result v11

    invoke-virtual {v10, v11}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 40
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 42
    .local v7, "widthText":Ljava/lang/StringBuilder;
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result v8

    .line 44
    .local v8, "xValChars":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_22
    if-ge v0, v8, :cond_2a

    .line 45
    invoke-virtual {v7, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 44
    add-int/lit8 v0, v0, 0x1

    goto :goto_22

    .line 48
    :cond_2a
    iget-object v10, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mAxisLabelPaint:Landroid/graphics/Paint;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/github/mikephil/charting/utils/Utils;->calcTextSize(Landroid/graphics/Paint;Ljava/lang/String;)Lcom/github/mikephil/charting/utils/FSize;

    move-result-object v3

    .line 50
    .local v3, "labelSize":Lcom/github/mikephil/charting/utils/FSize;
    iget v4, v3, Lcom/github/mikephil/charting/utils/FSize;->width:F

    .line 51
    .local v4, "labelWidth":F
    iget-object v10, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mAxisLabelPaint:Landroid/graphics/Paint;

    const-string v11, "Q"

    invoke-static {v10, v11}, Lcom/github/mikephil/charting/utils/Utils;->calcTextHeight(Landroid/graphics/Paint;Ljava/lang/String;)I

    move-result v10

    int-to-float v1, v10

    .line 53
    .local v1, "labelHeight":F
    iget-object v10, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v10}, Lcom/github/mikephil/charting/components/XAxis;->getLabelRotationAngle()F

    move-result v10

    invoke-static {v4, v1, v10}, Lcom/github/mikephil/charting/utils/Utils;->getSizeOfRotatedRectangleByDegrees(FFF)Lcom/github/mikephil/charting/utils/FSize;

    move-result-object v2

    .line 58
    .local v2, "labelRotatedSize":Lcom/github/mikephil/charting/utils/FSize;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 59
    .local v5, "space":Ljava/lang/StringBuilder;
    iget-object v10, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v10}, Lcom/github/mikephil/charting/components/XAxis;->getSpaceBetweenLabels()I

    move-result v9

    .line 61
    .local v9, "xValSpaceChars":I
    const/4 v0, 0x0

    :goto_55
    if-ge v0, v9, :cond_5d

    .line 62
    invoke-virtual {v5, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 61
    add-int/lit8 v0, v0, 0x1

    goto :goto_55

    .line 65
    :cond_5d
    iget-object v10, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mAxisLabelPaint:Landroid/graphics/Paint;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/github/mikephil/charting/utils/Utils;->calcTextSize(Landroid/graphics/Paint;Ljava/lang/String;)Lcom/github/mikephil/charting/utils/FSize;

    move-result-object v6

    .line 67
    .local v6, "spaceSize":Lcom/github/mikephil/charting/utils/FSize;
    iget-object v10, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget v11, v6, Lcom/github/mikephil/charting/utils/FSize;->width:F

    add-float/2addr v11, v4

    invoke-static {v11}, Ljava/lang/Math;->round(F)I

    move-result v11

    iput v11, v10, Lcom/github/mikephil/charting/components/XAxis;->mLabelWidth:I

    .line 68
    iget-object v10, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v11

    iput v11, v10, Lcom/github/mikephil/charting/components/XAxis;->mLabelHeight:I

    .line 69
    iget-object v10, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget v11, v2, Lcom/github/mikephil/charting/utils/FSize;->width:F

    iget v12, v6, Lcom/github/mikephil/charting/utils/FSize;->width:F

    add-float/2addr v11, v12

    invoke-static {v11}, Ljava/lang/Math;->round(F)I

    move-result v11

    iput v11, v10, Lcom/github/mikephil/charting/components/XAxis;->mLabelRotatedWidth:I

    .line 70
    iget-object v10, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget v11, v2, Lcom/github/mikephil/charting/utils/FSize;->height:F

    invoke-static {v11}, Ljava/lang/Math;->round(F)I

    move-result v11

    iput v11, v10, Lcom/github/mikephil/charting/components/XAxis;->mLabelRotatedHeight:I

    .line 72
    iget-object v10, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v10, p2}, Lcom/github/mikephil/charting/components/XAxis;->setValues(Ljava/util/List;)V

    .line 73
    return-void
.end method

.method protected drawLabel(Landroid/graphics/Canvas;Ljava/lang/String;IFFLandroid/graphics/PointF;F)V
    .registers 15
    .param p1, "c"    # Landroid/graphics/Canvas;
    .param p2, "label"    # Ljava/lang/String;
    .param p3, "xIndex"    # I
    .param p4, "x"    # F
    .param p5, "y"    # F
    .param p6, "anchor"    # Landroid/graphics/PointF;
    .param p7, "angleDegrees"    # F

    .prologue
    .line 190
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/components/XAxis;->getValueFormatter()Lcom/github/mikephil/charting/formatter/XAxisValueFormatter;

    move-result-object v0

    iget-object v2, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-interface {v0, p2, p3, v2}, Lcom/github/mikephil/charting/formatter/XAxisValueFormatter;->getXValue(Ljava/lang/String;ILcom/github/mikephil/charting/utils/ViewPortHandler;)Ljava/lang/String;

    move-result-object v1

    .line 191
    .local v1, "formattedLabel":Ljava/lang/String;
    iget-object v4, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mAxisLabelPaint:Landroid/graphics/Paint;

    move-object v0, p1

    move v2, p4

    move v3, p5

    move-object v5, p6

    move v6, p7

    invoke-static/range {v0 .. v6}, Lcom/github/mikephil/charting/utils/Utils;->drawXAxisValue(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;Landroid/graphics/PointF;F)V

    .line 192
    return-void
.end method

.method protected drawLabels(Landroid/graphics/Canvas;FLandroid/graphics/PointF;)V
    .registers 16
    .param p1, "c"    # Landroid/graphics/Canvas;
    .param p2, "pos"    # F
    .param p3, "anchor"    # Landroid/graphics/PointF;

    .prologue
    const/high16 v11, 0x40000000    # 2.0f

    const/4 v10, 0x0

    .line 149
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/components/XAxis;->getLabelRotationAngle()F

    move-result v7

    .line 152
    .local v7, "labelRotationAngleDegrees":F
    const/4 v0, 0x2

    new-array v8, v0, [F

    fill-array-data v8, :array_9e

    .line 156
    .local v8, "position":[F
    iget v3, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mMinX:I

    .local v3, "i":I
    :goto_11
    iget v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mMaxX:I

    if-gt v3, v0, :cond_9c

    .line 158
    int-to-float v0, v3

    aput v0, v8, v10

    .line 160
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mTrans:Lcom/github/mikephil/charting/utils/Transformer;

    invoke-virtual {v0, v8}, Lcom/github/mikephil/charting/utils/Transformer;->pointValuesToPixel([F)V

    .line 162
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    aget v1, v8, v10

    invoke-virtual {v0, v1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsX(F)Z

    move-result v0

    if-eqz v0, :cond_85

    .line 164
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/components/XAxis;->getValues()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 166
    .local v2, "label":Ljava/lang/String;
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/components/XAxis;->isAvoidFirstLastClippingEnabled()Z

    move-result v0

    if-eqz v0, :cond_7c

    .line 169
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/components/XAxis;->getValues()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-ne v3, v0, :cond_8b

    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/components/XAxis;->getValues()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_8b

    .line 170
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mAxisLabelPaint:Landroid/graphics/Paint;

    invoke-static {v0, v2}, Lcom/github/mikephil/charting/utils/Utils;->calcTextWidth(Landroid/graphics/Paint;Ljava/lang/String;)I

    move-result v0

    int-to-float v9, v0

    .line 172
    .local v9, "width":F
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->offsetRight()F

    move-result v0

    mul-float/2addr v0, v11

    cmpl-float v0, v9, v0

    if-lez v0, :cond_7c

    aget v0, v8, v10

    add-float/2addr v0, v9

    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getChartWidth()F

    move-result v1

    cmpl-float v0, v0, v1

    if-lez v0, :cond_7c

    .line 174
    aget v0, v8, v10

    div-float v1, v9, v11

    sub-float/2addr v0, v1

    aput v0, v8, v10

    .line 184
    .end local v9    # "width":F
    :cond_7c
    :goto_7c
    aget v4, v8, v10

    move-object v0, p0

    move-object v1, p1

    move v5, p2

    move-object v6, p3

    invoke-virtual/range {v0 .. v7}, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->drawLabel(Landroid/graphics/Canvas;Ljava/lang/String;IFFLandroid/graphics/PointF;F)V

    .line 156
    .end local v2    # "label":Ljava/lang/String;
    :cond_85
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget v0, v0, Lcom/github/mikephil/charting/components/XAxis;->mAxisLabelModulus:I

    add-int/2addr v3, v0

    goto :goto_11

    .line 177
    .restart local v2    # "label":Ljava/lang/String;
    :cond_8b
    if-nez v3, :cond_7c

    .line 179
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mAxisLabelPaint:Landroid/graphics/Paint;

    invoke-static {v0, v2}, Lcom/github/mikephil/charting/utils/Utils;->calcTextWidth(Landroid/graphics/Paint;Ljava/lang/String;)I

    move-result v0

    int-to-float v9, v0

    .line 180
    .restart local v9    # "width":F
    aget v0, v8, v10

    div-float v1, v9, v11

    add-float/2addr v0, v1

    aput v0, v8, v10

    goto :goto_7c

    .line 187
    .end local v2    # "label":Ljava/lang/String;
    .end local v9    # "width":F
    :cond_9c
    return-void

    .line 152
    nop

    :array_9e
    .array-data 4
        0x0
        0x0
    .end array-data
.end method

.method public renderAxisLabels(Landroid/graphics/Canvas;)V
    .registers 8
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v4, 0x0

    const/high16 v3, 0x3f000000    # 0.5f

    .line 78
    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/components/XAxis;->isEnabled()Z

    move-result v1

    if-eqz v1, :cond_15

    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/components/XAxis;->isDrawLabelsEnabled()Z

    move-result v1

    if-nez v1, :cond_16

    .line 114
    :cond_15
    :goto_15
    return-void

    .line 81
    :cond_16
    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/components/XAxis;->getYOffset()F

    move-result v0

    .line 83
    .local v0, "yoffset":F
    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mAxisLabelPaint:Landroid/graphics/Paint;

    iget-object v2, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/components/XAxis;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 84
    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mAxisLabelPaint:Landroid/graphics/Paint;

    iget-object v2, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/components/XAxis;->getTextSize()F

    move-result v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 85
    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mAxisLabelPaint:Landroid/graphics/Paint;

    iget-object v2, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/components/XAxis;->getTextColor()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 87
    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/components/XAxis;->getPosition()Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;

    move-result-object v1

    sget-object v2, Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;->TOP:Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;

    if-ne v1, v2, :cond_57

    .line 89
    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentTop()F

    move-result v1

    sub-float/2addr v1, v0

    new-instance v2, Landroid/graphics/PointF;

    invoke-direct {v2, v3, v5}, Landroid/graphics/PointF;-><init>(FF)V

    invoke-virtual {p0, p1, v1, v2}, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->drawLabels(Landroid/graphics/Canvas;FLandroid/graphics/PointF;)V

    goto :goto_15

    .line 92
    :cond_57
    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/components/XAxis;->getPosition()Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;

    move-result-object v1

    sget-object v2, Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;->TOP_INSIDE:Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;

    if-ne v1, v2, :cond_77

    .line 94
    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentTop()F

    move-result v1

    add-float/2addr v1, v0

    iget-object v2, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget v2, v2, Lcom/github/mikephil/charting/components/XAxis;->mLabelRotatedHeight:I

    int-to-float v2, v2

    add-float/2addr v1, v2

    new-instance v2, Landroid/graphics/PointF;

    invoke-direct {v2, v3, v5}, Landroid/graphics/PointF;-><init>(FF)V

    invoke-virtual {p0, p1, v1, v2}, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->drawLabels(Landroid/graphics/Canvas;FLandroid/graphics/PointF;)V

    goto :goto_15

    .line 97
    :cond_77
    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/components/XAxis;->getPosition()Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;

    move-result-object v1

    sget-object v2, Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;->BOTTOM:Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;

    if-ne v1, v2, :cond_91

    .line 99
    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentBottom()F

    move-result v1

    add-float/2addr v1, v0

    new-instance v2, Landroid/graphics/PointF;

    invoke-direct {v2, v3, v4}, Landroid/graphics/PointF;-><init>(FF)V

    invoke-virtual {p0, p1, v1, v2}, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->drawLabels(Landroid/graphics/Canvas;FLandroid/graphics/PointF;)V

    goto :goto_15

    .line 102
    :cond_91
    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/components/XAxis;->getPosition()Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;

    move-result-object v1

    sget-object v2, Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;->BOTTOM_INSIDE:Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;

    if-ne v1, v2, :cond_b2

    .line 104
    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentBottom()F

    move-result v1

    sub-float/2addr v1, v0

    iget-object v2, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget v2, v2, Lcom/github/mikephil/charting/components/XAxis;->mLabelRotatedHeight:I

    int-to-float v2, v2

    sub-float/2addr v1, v2

    new-instance v2, Landroid/graphics/PointF;

    invoke-direct {v2, v3, v4}, Landroid/graphics/PointF;-><init>(FF)V

    invoke-virtual {p0, p1, v1, v2}, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->drawLabels(Landroid/graphics/Canvas;FLandroid/graphics/PointF;)V

    goto/16 :goto_15

    .line 109
    :cond_b2
    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentTop()F

    move-result v1

    sub-float/2addr v1, v0

    new-instance v2, Landroid/graphics/PointF;

    invoke-direct {v2, v3, v5}, Landroid/graphics/PointF;-><init>(FF)V

    invoke-virtual {p0, p1, v1, v2}, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->drawLabels(Landroid/graphics/Canvas;FLandroid/graphics/PointF;)V

    .line 111
    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentBottom()F

    move-result v1

    add-float/2addr v1, v0

    new-instance v2, Landroid/graphics/PointF;

    invoke-direct {v2, v3, v4}, Landroid/graphics/PointF;-><init>(FF)V

    invoke-virtual {p0, p1, v1, v2}, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->drawLabels(Landroid/graphics/Canvas;FLandroid/graphics/PointF;)V

    goto/16 :goto_15
.end method

.method public renderAxisLine(Landroid/graphics/Canvas;)V
    .registers 8
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    .line 119
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/components/XAxis;->isDrawAxisLineEnabled()Z

    move-result v0

    if-eqz v0, :cond_10

    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/components/XAxis;->isEnabled()Z

    move-result v0

    if-nez v0, :cond_11

    .line 140
    :cond_10
    :goto_10
    return-void

    .line 122
    :cond_11
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mAxisLinePaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/components/XAxis;->getAxisLineColor()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 123
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mAxisLinePaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/components/XAxis;->getAxisLineWidth()F

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 125
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/components/XAxis;->getPosition()Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;

    move-result-object v0

    sget-object v1, Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;->TOP:Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;

    if-eq v0, v1, :cond_45

    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/components/XAxis;->getPosition()Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;

    move-result-object v0

    sget-object v1, Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;->TOP_INSIDE:Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;

    if-eq v0, v1, :cond_45

    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/components/XAxis;->getPosition()Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;

    move-result-object v0

    sget-object v1, Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;->BOTH_SIDED:Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;

    if-ne v0, v1, :cond_63

    .line 128
    :cond_45
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentLeft()F

    move-result v1

    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentTop()F

    move-result v2

    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentRight()F

    move-result v3

    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentTop()F

    move-result v4

    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mAxisLinePaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 133
    :cond_63
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/components/XAxis;->getPosition()Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;

    move-result-object v0

    sget-object v1, Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;->BOTTOM:Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;

    if-eq v0, v1, :cond_81

    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/components/XAxis;->getPosition()Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;

    move-result-object v0

    sget-object v1, Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;->BOTTOM_INSIDE:Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;

    if-eq v0, v1, :cond_81

    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/components/XAxis;->getPosition()Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;

    move-result-object v0

    sget-object v1, Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;->BOTH_SIDED:Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;

    if-ne v0, v1, :cond_10

    .line 136
    :cond_81
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentLeft()F

    move-result v1

    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentBottom()F

    move-result v2

    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentRight()F

    move-result v3

    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentBottom()F

    move-result v4

    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mAxisLinePaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_10
.end method

.method public renderGridLines(Landroid/graphics/Canvas;)V
    .registers 8
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v5, 0x0

    .line 197
    iget-object v3, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/components/XAxis;->isDrawGridLinesEnabled()Z

    move-result v3

    if-eqz v3, :cond_11

    iget-object v3, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/components/XAxis;->isEnabled()Z

    move-result v3

    if-nez v3, :cond_12

    .line 228
    :cond_11
    return-void

    .line 201
    :cond_12
    const/4 v3, 0x2

    new-array v2, v3, [F

    fill-array-data v2, :array_88

    .line 205
    .local v2, "position":[F
    iget-object v3, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mGridPaint:Landroid/graphics/Paint;

    iget-object v4, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/components/XAxis;->getGridColor()I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 206
    iget-object v3, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mGridPaint:Landroid/graphics/Paint;

    iget-object v4, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/components/XAxis;->getGridLineWidth()F

    move-result v4

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 207
    iget-object v3, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mGridPaint:Landroid/graphics/Paint;

    iget-object v4, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/components/XAxis;->getGridDashPathEffect()Landroid/graphics/DashPathEffect;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setPathEffect(Landroid/graphics/PathEffect;)Landroid/graphics/PathEffect;

    .line 209
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 211
    .local v0, "gridLinePath":Landroid/graphics/Path;
    iget v1, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mMinX:I

    .local v1, "i":I
    :goto_40
    iget v3, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mMaxX:I

    if-gt v1, v3, :cond_11

    .line 213
    int-to-float v3, v1

    aput v3, v2, v5

    .line 214
    iget-object v3, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mTrans:Lcom/github/mikephil/charting/utils/Transformer;

    invoke-virtual {v3, v2}, Lcom/github/mikephil/charting/utils/Transformer;->pointValuesToPixel([F)V

    .line 216
    aget v3, v2, v5

    iget-object v4, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->offsetLeft()F

    move-result v4

    cmpl-float v3, v3, v4

    if-ltz v3, :cond_7f

    aget v3, v2, v5

    iget-object v4, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getChartWidth()F

    move-result v4

    cmpg-float v3, v3, v4

    if-gtz v3, :cond_7f

    .line 219
    aget v3, v2, v5

    iget-object v4, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentBottom()F

    move-result v4

    invoke-virtual {v0, v3, v4}, Landroid/graphics/Path;->moveTo(FF)V

    .line 220
    aget v3, v2, v5

    iget-object v4, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentTop()F

    move-result v4

    invoke-virtual {v0, v3, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 223
    iget-object v3, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mGridPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v3}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 226
    :cond_7f
    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 211
    iget-object v3, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget v3, v3, Lcom/github/mikephil/charting/components/XAxis;->mAxisLabelModulus:I

    add-int/2addr v1, v3

    goto :goto_40

    .line 201
    :array_88
    .array-data 4
        0x0
        0x0
    .end array-data
.end method

.method public renderLimitLineLabel(Landroid/graphics/Canvas;Lcom/github/mikephil/charting/components/LimitLine;[FF)V
    .registers 12
    .param p1, "c"    # Landroid/graphics/Canvas;
    .param p2, "limitLine"    # Lcom/github/mikephil/charting/components/LimitLine;
    .param p3, "position"    # [F
    .param p4, "yOffset"    # F

    .prologue
    const/4 v6, 0x0

    .line 286
    invoke-virtual {p2}, Lcom/github/mikephil/charting/components/LimitLine;->getLabel()Ljava/lang/String;

    move-result-object v0

    .line 289
    .local v0, "label":Ljava/lang/String;
    if-eqz v0, :cond_67

    const-string v4, ""

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_67

    .line 291
    iget-object v4, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mLimitLinePaint:Landroid/graphics/Paint;

    invoke-virtual {p2}, Lcom/github/mikephil/charting/components/LimitLine;->getTextStyle()Landroid/graphics/Paint$Style;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 292
    iget-object v4, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mLimitLinePaint:Landroid/graphics/Paint;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setPathEffect(Landroid/graphics/PathEffect;)Landroid/graphics/PathEffect;

    .line 293
    iget-object v4, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mLimitLinePaint:Landroid/graphics/Paint;

    invoke-virtual {p2}, Lcom/github/mikephil/charting/components/LimitLine;->getTextColor()I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 294
    iget-object v4, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mLimitLinePaint:Landroid/graphics/Paint;

    const/high16 v5, 0x3f000000    # 0.5f

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 295
    iget-object v4, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mLimitLinePaint:Landroid/graphics/Paint;

    invoke-virtual {p2}, Lcom/github/mikephil/charting/components/LimitLine;->getTextSize()F

    move-result v5

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 297
    invoke-virtual {p2}, Lcom/github/mikephil/charting/components/LimitLine;->getLineWidth()F

    move-result v4

    invoke-virtual {p2}, Lcom/github/mikephil/charting/components/LimitLine;->getXOffset()F

    move-result v5

    add-float v3, v4, v5

    .line 299
    .local v3, "xOffset":F
    invoke-virtual {p2}, Lcom/github/mikephil/charting/components/LimitLine;->getLabelPosition()Lcom/github/mikephil/charting/components/LimitLine$LimitLabelPosition;

    move-result-object v2

    .line 301
    .local v2, "labelPosition":Lcom/github/mikephil/charting/components/LimitLine$LimitLabelPosition;
    sget-object v4, Lcom/github/mikephil/charting/components/LimitLine$LimitLabelPosition;->RIGHT_TOP:Lcom/github/mikephil/charting/components/LimitLine$LimitLabelPosition;

    if-ne v2, v4, :cond_68

    .line 303
    iget-object v4, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mLimitLinePaint:Landroid/graphics/Paint;

    invoke-static {v4, v0}, Lcom/github/mikephil/charting/utils/Utils;->calcTextHeight(Landroid/graphics/Paint;Ljava/lang/String;)I

    move-result v4

    int-to-float v1, v4

    .line 304
    .local v1, "labelLineHeight":F
    iget-object v4, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mLimitLinePaint:Landroid/graphics/Paint;

    sget-object v5, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 305
    aget v4, p3, v6

    add-float/2addr v4, v3

    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v5}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentTop()F

    move-result v5

    add-float/2addr v5, p4

    add-float/2addr v5, v1

    iget-object v6, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mLimitLinePaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v4, v5, v6}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 321
    .end local v1    # "labelLineHeight":F
    .end local v2    # "labelPosition":Lcom/github/mikephil/charting/components/LimitLine$LimitLabelPosition;
    .end local v3    # "xOffset":F
    :cond_67
    :goto_67
    return-void

    .line 306
    .restart local v2    # "labelPosition":Lcom/github/mikephil/charting/components/LimitLine$LimitLabelPosition;
    .restart local v3    # "xOffset":F
    :cond_68
    sget-object v4, Lcom/github/mikephil/charting/components/LimitLine$LimitLabelPosition;->RIGHT_BOTTOM:Lcom/github/mikephil/charting/components/LimitLine$LimitLabelPosition;

    if-ne v2, v4, :cond_83

    .line 308
    iget-object v4, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mLimitLinePaint:Landroid/graphics/Paint;

    sget-object v5, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 309
    aget v4, p3, v6

    add-float/2addr v4, v3

    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v5}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentBottom()F

    move-result v5

    sub-float/2addr v5, p4

    iget-object v6, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mLimitLinePaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v4, v5, v6}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    goto :goto_67

    .line 310
    :cond_83
    sget-object v4, Lcom/github/mikephil/charting/components/LimitLine$LimitLabelPosition;->LEFT_TOP:Lcom/github/mikephil/charting/components/LimitLine$LimitLabelPosition;

    if-ne v2, v4, :cond_a6

    .line 312
    iget-object v4, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mLimitLinePaint:Landroid/graphics/Paint;

    sget-object v5, Landroid/graphics/Paint$Align;->RIGHT:Landroid/graphics/Paint$Align;

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 313
    iget-object v4, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mLimitLinePaint:Landroid/graphics/Paint;

    invoke-static {v4, v0}, Lcom/github/mikephil/charting/utils/Utils;->calcTextHeight(Landroid/graphics/Paint;Ljava/lang/String;)I

    move-result v4

    int-to-float v1, v4

    .line 314
    .restart local v1    # "labelLineHeight":F
    aget v4, p3, v6

    sub-float/2addr v4, v3

    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v5}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentTop()F

    move-result v5

    add-float/2addr v5, p4

    add-float/2addr v5, v1

    iget-object v6, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mLimitLinePaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v4, v5, v6}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    goto :goto_67

    .line 317
    .end local v1    # "labelLineHeight":F
    :cond_a6
    iget-object v4, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mLimitLinePaint:Landroid/graphics/Paint;

    sget-object v5, Landroid/graphics/Paint$Align;->RIGHT:Landroid/graphics/Paint$Align;

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 318
    aget v4, p3, v6

    sub-float/2addr v4, v3

    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v5}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentBottom()F

    move-result v5

    sub-float/2addr v5, p4

    iget-object v6, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mLimitLinePaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v4, v5, v6}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    goto :goto_67
.end method

.method public renderLimitLineLine(Landroid/graphics/Canvas;Lcom/github/mikephil/charting/components/LimitLine;[F)V
    .registers 10
    .param p1, "c"    # Landroid/graphics/Canvas;
    .param p2, "limitLine"    # Lcom/github/mikephil/charting/components/LimitLine;
    .param p3, "position"    # [F

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 267
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mLimitLineSegmentsBuffer:[F

    aget v1, p3, v2

    aput v1, v0, v2

    .line 268
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mLimitLineSegmentsBuffer:[F

    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentTop()F

    move-result v1

    aput v1, v0, v3

    .line 269
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mLimitLineSegmentsBuffer:[F

    aget v1, p3, v2

    aput v1, v0, v4

    .line 270
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mLimitLineSegmentsBuffer:[F

    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentBottom()F

    move-result v1

    aput v1, v0, v5

    .line 272
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mLimitLinePath:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 273
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mLimitLinePath:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mLimitLineSegmentsBuffer:[F

    aget v1, v1, v2

    iget-object v2, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mLimitLineSegmentsBuffer:[F

    aget v2, v2, v3

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->moveTo(FF)V

    .line 274
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mLimitLinePath:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mLimitLineSegmentsBuffer:[F

    aget v1, v1, v4

    iget-object v2, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mLimitLineSegmentsBuffer:[F

    aget v2, v2, v5

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 276
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mLimitLinePaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 277
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mLimitLinePaint:Landroid/graphics/Paint;

    invoke-virtual {p2}, Lcom/github/mikephil/charting/components/LimitLine;->getLineColor()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 278
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mLimitLinePaint:Landroid/graphics/Paint;

    invoke-virtual {p2}, Lcom/github/mikephil/charting/components/LimitLine;->getLineWidth()F

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 279
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mLimitLinePaint:Landroid/graphics/Paint;

    invoke-virtual {p2}, Lcom/github/mikephil/charting/components/LimitLine;->getDashPathEffect()Landroid/graphics/DashPathEffect;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setPathEffect(Landroid/graphics/PathEffect;)Landroid/graphics/PathEffect;

    .line 281
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mLimitLinePath:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mLimitLinePaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 282
    return-void
.end method

.method public renderLimitLines(Landroid/graphics/Canvas;)V
    .registers 8
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    .line 238
    iget-object v4, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/components/XAxis;->getLimitLines()Ljava/util/List;

    move-result-object v2

    .line 240
    .local v2, "limitLines":Ljava/util/List;, "Ljava/util/List<Lcom/github/mikephil/charting/components/LimitLine;>;"
    if-eqz v2, :cond_e

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    if-gtz v4, :cond_f

    .line 260
    :cond_e
    return-void

    .line 243
    :cond_f
    const/4 v4, 0x2

    new-array v3, v4, [F

    .line 245
    .local v3, "position":[F
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_13
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    if-ge v0, v4, :cond_e

    .line 247
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/github/mikephil/charting/components/LimitLine;

    .line 249
    .local v1, "l":Lcom/github/mikephil/charting/components/LimitLine;
    invoke-virtual {v1}, Lcom/github/mikephil/charting/components/LimitLine;->isEnabled()Z

    move-result v4

    if-nez v4, :cond_28

    .line 245
    :goto_25
    add-int/lit8 v0, v0, 0x1

    goto :goto_13

    .line 252
    :cond_28
    const/4 v4, 0x0

    invoke-virtual {v1}, Lcom/github/mikephil/charting/components/LimitLine;->getLimit()F

    move-result v5

    aput v5, v3, v4

    .line 253
    const/4 v4, 0x1

    const/4 v5, 0x0

    aput v5, v3, v4

    .line 255
    iget-object v4, p0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->mTrans:Lcom/github/mikephil/charting/utils/Transformer;

    invoke-virtual {v4, v3}, Lcom/github/mikephil/charting/utils/Transformer;->pointValuesToPixel([F)V

    .line 257
    invoke-virtual {p0, p1, v1, v3}, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->renderLimitLineLine(Landroid/graphics/Canvas;Lcom/github/mikephil/charting/components/LimitLine;[F)V

    .line 258
    const/high16 v4, 0x40000000    # 2.0f

    invoke-virtual {v1}, Lcom/github/mikephil/charting/components/LimitLine;->getYOffset()F

    move-result v5

    add-float/2addr v4, v5

    invoke-virtual {p0, p1, v1, v3, v4}, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->renderLimitLineLabel(Landroid/graphics/Canvas;Lcom/github/mikephil/charting/components/LimitLine;[FF)V

    goto :goto_25
.end method
