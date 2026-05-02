.class public Lcom/github/mikephil/charting/renderer/XAxisRendererRadarChart;
.super Lcom/github/mikephil/charting/renderer/XAxisRenderer;
.source "XAxisRendererRadarChart.java"


# instance fields
.field private mChart:Lcom/github/mikephil/charting/charts/RadarChart;


# direct methods
.method public constructor <init>(Lcom/github/mikephil/charting/utils/ViewPortHandler;Lcom/github/mikephil/charting/components/XAxis;Lcom/github/mikephil/charting/charts/RadarChart;)V
    .registers 5
    .param p1, "viewPortHandler"    # Lcom/github/mikephil/charting/utils/ViewPortHandler;
    .param p2, "xAxis"    # Lcom/github/mikephil/charting/components/XAxis;
    .param p3, "chart"    # Lcom/github/mikephil/charting/charts/RadarChart;

    .prologue
    .line 17
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/github/mikephil/charting/renderer/XAxisRenderer;-><init>(Lcom/github/mikephil/charting/utils/ViewPortHandler;Lcom/github/mikephil/charting/components/XAxis;Lcom/github/mikephil/charting/utils/Transformer;)V

    .line 19
    iput-object p3, p0, Lcom/github/mikephil/charting/renderer/XAxisRendererRadarChart;->mChart:Lcom/github/mikephil/charting/charts/RadarChart;

    .line 20
    return-void
.end method


# virtual methods
.method public renderAxisLabels(Landroid/graphics/Canvas;)V
    .registers 16
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    .line 25
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRendererRadarChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/components/XAxis;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_10

    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRendererRadarChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/components/XAxis;->isDrawLabelsEnabled()Z

    move-result v0

    if-nez v0, :cond_11

    .line 55
    :cond_10
    return-void

    .line 28
    :cond_11
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRendererRadarChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/components/XAxis;->getLabelRotationAngle()F

    move-result v7

    .line 29
    .local v7, "labelRotationAngleDegrees":F
    new-instance v6, Landroid/graphics/PointF;

    const/high16 v0, 0x3f000000    # 0.5f

    const/4 v1, 0x0

    invoke-direct {v6, v0, v1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 31
    .local v6, "drawLabelAnchor":Landroid/graphics/PointF;
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRendererRadarChart;->mAxisLabelPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/XAxisRendererRadarChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/components/XAxis;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 32
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRendererRadarChart;->mAxisLabelPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/XAxisRendererRadarChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/components/XAxis;->getTextSize()F

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 33
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRendererRadarChart;->mAxisLabelPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/XAxisRendererRadarChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/components/XAxis;->getTextColor()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 35
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRendererRadarChart;->mChart:Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/charts/RadarChart;->getSliceAngle()F

    move-result v13

    .line 39
    .local v13, "sliceangle":F
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRendererRadarChart;->mChart:Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/charts/RadarChart;->getFactor()F

    move-result v10

    .line 41
    .local v10, "factor":F
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRendererRadarChart;->mChart:Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/charts/RadarChart;->getCenterOffsets()Landroid/graphics/PointF;

    move-result-object v9

    .line 43
    .local v9, "center":Landroid/graphics/PointF;
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRendererRadarChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget v11, v0, Lcom/github/mikephil/charting/components/XAxis;->mAxisLabelModulus:I

    .line 44
    .local v11, "mod":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_57
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRendererRadarChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/components/XAxis;->getValues()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge v3, v0, :cond_10

    .line 45
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRendererRadarChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/components/XAxis;->getValues()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 47
    .local v2, "label":Ljava/lang/String;
    int-to-float v0, v3

    mul-float/2addr v0, v13

    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/XAxisRendererRadarChart;->mChart:Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/charts/RadarChart;->getRotationAngle()F

    move-result v1

    add-float/2addr v0, v1

    const/high16 v1, 0x43b40000    # 360.0f

    rem-float v8, v0, v1

    .line 49
    .local v8, "angle":F
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/XAxisRendererRadarChart;->mChart:Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/charts/RadarChart;->getYRange()F

    move-result v0

    mul-float/2addr v0, v10

    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/XAxisRendererRadarChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget v1, v1, Lcom/github/mikephil/charting/components/XAxis;->mLabelRotatedWidth:I

    int-to-float v1, v1

    const/high16 v4, 0x40000000    # 2.0f

    div-float/2addr v1, v4

    add-float/2addr v0, v1

    invoke-static {v9, v0, v8}, Lcom/github/mikephil/charting/utils/Utils;->getPosition(Landroid/graphics/PointF;FF)Landroid/graphics/PointF;

    move-result-object v12

    .line 52
    .local v12, "p":Landroid/graphics/PointF;
    iget v4, v12, Landroid/graphics/PointF;->x:F

    iget v0, v12, Landroid/graphics/PointF;->y:F

    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/XAxisRendererRadarChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget v1, v1, Lcom/github/mikephil/charting/components/XAxis;->mLabelRotatedHeight:I

    int-to-float v1, v1

    const/high16 v5, 0x40000000    # 2.0f

    div-float/2addr v1, v5

    sub-float v5, v0, v1

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v7}, Lcom/github/mikephil/charting/renderer/XAxisRendererRadarChart;->drawLabel(Landroid/graphics/Canvas;Ljava/lang/String;IFFLandroid/graphics/PointF;F)V

    .line 44
    add-int/2addr v3, v11

    goto :goto_57
.end method

.method public renderLimitLines(Landroid/graphics/Canvas;)V
    .registers 2
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    .line 65
    return-void
.end method
