.class public Lcom/github/mikephil/charting/renderer/RadarChartRenderer;
.super Lcom/github/mikephil/charting/renderer/LineRadarRenderer;
.source "RadarChartRenderer.java"


# instance fields
.field protected mChart:Lcom/github/mikephil/charting/charts/RadarChart;

.field protected mHighlightCirclePaint:Landroid/graphics/Paint;

.field protected mWebPaint:Landroid/graphics/Paint;


# direct methods
.method public constructor <init>(Lcom/github/mikephil/charting/charts/RadarChart;Lcom/github/mikephil/charting/animation/ChartAnimator;Lcom/github/mikephil/charting/utils/ViewPortHandler;)V
    .registers 9
    .param p1, "chart"    # Lcom/github/mikephil/charting/charts/RadarChart;
    .param p2, "animator"    # Lcom/github/mikephil/charting/animation/ChartAnimator;
    .param p3, "viewPortHandler"    # Lcom/github/mikephil/charting/utils/ViewPortHandler;

    .prologue
    const/4 v4, 0x1

    .line 33
    invoke-direct {p0, p2, p3}, Lcom/github/mikephil/charting/renderer/LineRadarRenderer;-><init>(Lcom/github/mikephil/charting/animation/ChartAnimator;Lcom/github/mikephil/charting/utils/ViewPortHandler;)V

    .line 34
    iput-object p1, p0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/RadarChart;

    .line 36
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v4}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mHighlightPaint:Landroid/graphics/Paint;

    .line 37
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mHighlightPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 38
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mHighlightPaint:Landroid/graphics/Paint;

    const/high16 v1, 0x40000000    # 2.0f

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 39
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mHighlightPaint:Landroid/graphics/Paint;

    const/16 v1, 0xff

    const/16 v2, 0xbb

    const/16 v3, 0x73

    invoke-static {v1, v2, v3}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 41
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v4}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mWebPaint:Landroid/graphics/Paint;

    .line 42
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mWebPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 44
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v4}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mHighlightCirclePaint:Landroid/graphics/Paint;

    .line 45
    return-void
.end method


# virtual methods
.method public drawData(Landroid/graphics/Canvas;)V
    .registers 7
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    .line 60
    iget-object v4, p0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/charts/RadarChart;->getData()Lcom/github/mikephil/charting/data/ChartData;

    move-result-object v2

    check-cast v2, Lcom/github/mikephil/charting/data/RadarData;

    .line 62
    .local v2, "radarData":Lcom/github/mikephil/charting/data/RadarData;
    const/4 v1, 0x0

    .line 64
    .local v1, "mostEntries":I
    invoke-virtual {v2}, Lcom/github/mikephil/charting/data/RadarData;->getDataSets()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_11
    :goto_11
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_28

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/github/mikephil/charting/interfaces/datasets/IRadarDataSet;

    .line 65
    .local v3, "set":Lcom/github/mikephil/charting/interfaces/datasets/IRadarDataSet;
    invoke-interface {v3}, Lcom/github/mikephil/charting/interfaces/datasets/IRadarDataSet;->getEntryCount()I

    move-result v4

    if-le v4, v1, :cond_11

    .line 66
    invoke-interface {v3}, Lcom/github/mikephil/charting/interfaces/datasets/IRadarDataSet;->getEntryCount()I

    move-result v1

    goto :goto_11

    .line 70
    .end local v3    # "set":Lcom/github/mikephil/charting/interfaces/datasets/IRadarDataSet;
    :cond_28
    invoke-virtual {v2}, Lcom/github/mikephil/charting/data/RadarData;->getDataSets()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_30
    :goto_30
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/github/mikephil/charting/interfaces/datasets/IRadarDataSet;

    .line 72
    .restart local v3    # "set":Lcom/github/mikephil/charting/interfaces/datasets/IRadarDataSet;
    invoke-interface {v3}, Lcom/github/mikephil/charting/interfaces/datasets/IRadarDataSet;->isVisible()Z

    move-result v4

    if-eqz v4, :cond_30

    invoke-interface {v3}, Lcom/github/mikephil/charting/interfaces/datasets/IRadarDataSet;->getEntryCount()I

    move-result v4

    if-lez v4, :cond_30

    .line 73
    invoke-virtual {p0, p1, v3, v1}, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->drawDataSet(Landroid/graphics/Canvas;Lcom/github/mikephil/charting/interfaces/datasets/IRadarDataSet;I)V

    goto :goto_30

    .line 76
    .end local v3    # "set":Lcom/github/mikephil/charting/interfaces/datasets/IRadarDataSet;
    :cond_4c
    return-void
.end method

.method protected drawDataSet(Landroid/graphics/Canvas;Lcom/github/mikephil/charting/interfaces/datasets/IRadarDataSet;I)V
    .registers 19
    .param p1, "c"    # Landroid/graphics/Canvas;
    .param p2, "dataSet"    # Lcom/github/mikephil/charting/interfaces/datasets/IRadarDataSet;
    .param p3, "mostEntries"    # I

    .prologue
    .line 87
    iget-object v12, p0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v12}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseX()F

    move-result v8

    .line 88
    .local v8, "phaseX":F
    iget-object v12, p0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v12}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseY()F

    move-result v9

    .line 90
    .local v9, "phaseY":F
    iget-object v12, p0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {v12}, Lcom/github/mikephil/charting/charts/RadarChart;->getSliceAngle()F

    move-result v10

    .line 94
    .local v10, "sliceangle":F
    iget-object v12, p0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {v12}, Lcom/github/mikephil/charting/charts/RadarChart;->getFactor()F

    move-result v4

    .line 96
    .local v4, "factor":F
    iget-object v12, p0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {v12}, Lcom/github/mikephil/charting/charts/RadarChart;->getCenterOffsets()Landroid/graphics/PointF;

    move-result-object v1

    .line 98
    .local v1, "center":Landroid/graphics/PointF;
    new-instance v11, Landroid/graphics/Path;

    invoke-direct {v11}, Landroid/graphics/Path;-><init>()V

    .line 100
    .local v11, "surface":Landroid/graphics/Path;
    const/4 v5, 0x0

    .line 102
    .local v5, "hasMovedToPoint":Z
    const/4 v6, 0x0

    .local v6, "j":I
    :goto_25
    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/IRadarDataSet;->getEntryCount()I

    move-result v12

    if-ge v6, v12, :cond_75

    .line 104
    iget-object v12, p0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p2

    invoke-interface {v0, v6}, Lcom/github/mikephil/charting/interfaces/datasets/IRadarDataSet;->getColor(I)I

    move-result v13

    invoke-virtual {v12, v13}, Landroid/graphics/Paint;->setColor(I)V

    .line 106
    move-object/from16 v0, p2

    invoke-interface {v0, v6}, Lcom/github/mikephil/charting/interfaces/datasets/IRadarDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v3

    .line 108
    .local v3, "e":Lcom/github/mikephil/charting/data/Entry;
    invoke-virtual {v3}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v12

    iget-object v13, p0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {v13}, Lcom/github/mikephil/charting/charts/RadarChart;->getYChartMin()F

    move-result v13

    sub-float/2addr v12, v13

    mul-float/2addr v12, v4

    mul-float/2addr v12, v9

    int-to-float v13, v6

    mul-float/2addr v13, v10

    mul-float/2addr v13, v8

    iget-object v14, p0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {v14}, Lcom/github/mikephil/charting/charts/RadarChart;->getRotationAngle()F

    move-result v14

    add-float/2addr v13, v14

    invoke-static {v1, v12, v13}, Lcom/github/mikephil/charting/utils/Utils;->getPosition(Landroid/graphics/PointF;FF)Landroid/graphics/PointF;

    move-result-object v7

    .line 113
    .local v7, "p":Landroid/graphics/PointF;
    iget v12, v7, Landroid/graphics/PointF;->x:F

    invoke-static {v12}, Ljava/lang/Float;->isNaN(F)Z

    move-result v12

    if-eqz v12, :cond_62

    .line 102
    :goto_5f
    add-int/lit8 v6, v6, 0x1

    goto :goto_25

    .line 116
    :cond_62
    if-nez v5, :cond_6d

    .line 117
    iget v12, v7, Landroid/graphics/PointF;->x:F

    iget v13, v7, Landroid/graphics/PointF;->y:F

    invoke-virtual {v11, v12, v13}, Landroid/graphics/Path;->moveTo(FF)V

    .line 118
    const/4 v5, 0x1

    goto :goto_5f

    .line 120
    :cond_6d
    iget v12, v7, Landroid/graphics/PointF;->x:F

    iget v13, v7, Landroid/graphics/PointF;->y:F

    invoke-virtual {v11, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    goto :goto_5f

    .line 123
    .end local v3    # "e":Lcom/github/mikephil/charting/data/Entry;
    .end local v7    # "p":Landroid/graphics/PointF;
    :cond_75
    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/IRadarDataSet;->getEntryCount()I

    move-result v12

    move/from16 v0, p3

    if-le v12, v0, :cond_84

    .line 125
    iget v12, v1, Landroid/graphics/PointF;->x:F

    iget v13, v1, Landroid/graphics/PointF;->y:F

    invoke-virtual {v11, v12, v13}, Landroid/graphics/Path;->lineTo(FF)V

    .line 128
    :cond_84
    invoke-virtual {v11}, Landroid/graphics/Path;->close()V

    .line 130
    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/IRadarDataSet;->isDrawFilledEnabled()Z

    move-result v12

    if-eqz v12, :cond_98

    .line 132
    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/IRadarDataSet;->getFillDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 133
    .local v2, "drawable":Landroid/graphics/drawable/Drawable;
    if-eqz v2, :cond_be

    .line 135
    move-object/from16 v0, p1

    invoke-virtual {p0, v0, v11, v2}, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->drawFilledPath(Landroid/graphics/Canvas;Landroid/graphics/Path;Landroid/graphics/drawable/Drawable;)V

    .line 142
    .end local v2    # "drawable":Landroid/graphics/drawable/Drawable;
    :cond_98
    :goto_98
    iget-object v12, p0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/IRadarDataSet;->getLineWidth()F

    move-result v13

    invoke-virtual {v12, v13}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 143
    iget-object v12, p0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    sget-object v13, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v12, v13}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 146
    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/IRadarDataSet;->isDrawFilledEnabled()Z

    move-result v12

    if-eqz v12, :cond_b6

    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/IRadarDataSet;->getFillAlpha()I

    move-result v12

    const/16 v13, 0xff

    if-ge v12, v13, :cond_bd

    .line 147
    :cond_b6
    iget-object v12, p0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v11, v12}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 156
    :cond_bd
    return-void

    .line 138
    .restart local v2    # "drawable":Landroid/graphics/drawable/Drawable;
    :cond_be
    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/IRadarDataSet;->getFillColor()I

    move-result v12

    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/IRadarDataSet;->getFillAlpha()I

    move-result v13

    move-object/from16 v0, p1

    invoke-virtual {p0, v0, v11, v12, v13}, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->drawFilledPath(Landroid/graphics/Canvas;Landroid/graphics/Path;II)V

    goto :goto_98
.end method

.method public drawExtras(Landroid/graphics/Canvas;)V
    .registers 2
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    .line 200
    invoke-virtual {p0, p1}, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->drawWeb(Landroid/graphics/Canvas;)V

    .line 201
    return-void
.end method

.method public drawHighlightCircle(Landroid/graphics/Canvas;Landroid/graphics/PointF;FFIIF)V
    .registers 13
    .param p1, "c"    # Landroid/graphics/Canvas;
    .param p2, "point"    # Landroid/graphics/PointF;
    .param p3, "innerRadius"    # F
    .param p4, "outerRadius"    # F
    .param p5, "fillColor"    # I
    .param p6, "strokeColor"    # I
    .param p7, "strokeWidth"    # F

    .prologue
    const v4, 0x112233

    .line 329
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 331
    invoke-static {p4}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result p4

    .line 332
    invoke-static {p3}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result p3

    .line 334
    if-eq p5, v4, :cond_3d

    .line 335
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 336
    .local v0, "p":Landroid/graphics/Path;
    iget v1, p2, Landroid/graphics/PointF;->x:F

    iget v2, p2, Landroid/graphics/PointF;->y:F

    sget-object v3, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    invoke-virtual {v0, v1, v2, p4, v3}, Landroid/graphics/Path;->addCircle(FFFLandroid/graphics/Path$Direction;)V

    .line 337
    const/4 v1, 0x0

    cmpl-float v1, p3, v1

    if-lez v1, :cond_2c

    .line 338
    iget v1, p2, Landroid/graphics/PointF;->x:F

    iget v2, p2, Landroid/graphics/PointF;->y:F

    sget-object v3, Landroid/graphics/Path$Direction;->CCW:Landroid/graphics/Path$Direction;

    invoke-virtual {v0, v1, v2, p3, v3}, Landroid/graphics/Path;->addCircle(FFFLandroid/graphics/Path$Direction;)V

    .line 340
    :cond_2c
    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mHighlightCirclePaint:Landroid/graphics/Paint;

    invoke-virtual {v1, p5}, Landroid/graphics/Paint;->setColor(I)V

    .line 341
    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mHighlightCirclePaint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 342
    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mHighlightCirclePaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 345
    .end local v0    # "p":Landroid/graphics/Path;
    :cond_3d
    if-eq p6, v4, :cond_5d

    .line 346
    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mHighlightCirclePaint:Landroid/graphics/Paint;

    invoke-virtual {v1, p6}, Landroid/graphics/Paint;->setColor(I)V

    .line 347
    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mHighlightCirclePaint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 348
    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mHighlightCirclePaint:Landroid/graphics/Paint;

    invoke-static {p7}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 349
    iget v1, p2, Landroid/graphics/PointF;->x:F

    iget v2, p2, Landroid/graphics/PointF;->y:F

    iget-object v3, p0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mHighlightCirclePaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2, p4, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 352
    :cond_5d
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 353
    return-void
.end method

.method public drawHighlighted(Landroid/graphics/Canvas;[Lcom/github/mikephil/charting/highlight/Highlight;)V
    .registers 27
    .param p1, "c"    # Landroid/graphics/Canvas;
    .param p2, "indices"    # [Lcom/github/mikephil/charting/highlight/Highlight;

    .prologue
    .line 255
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseX()F

    move-result v17

    .line 256
    .local v17, "phaseX":F
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseY()F

    move-result v18

    .line 258
    .local v18, "phaseY":F
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/charts/RadarChart;->getSliceAngle()F

    move-result v21

    .line 259
    .local v21, "sliceangle":F
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/charts/RadarChart;->getFactor()F

    move-result v14

    .line 261
    .local v14, "factor":F
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/charts/RadarChart;->getCenterOffsets()Landroid/graphics/PointF;

    move-result-object v12

    .line 263
    .local v12, "center":Landroid/graphics/PointF;
    const/4 v15, 0x0

    .local v15, "i":I
    :goto_29
    move-object/from16 v0, p2

    array-length v4, v0

    if-ge v15, v4, :cond_104

    .line 265
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/charts/RadarChart;->getData()Lcom/github/mikephil/charting/data/ChartData;

    move-result-object v4

    check-cast v4, Lcom/github/mikephil/charting/data/RadarData;

    aget-object v5, p2, v15

    invoke-virtual {v5}, Lcom/github/mikephil/charting/highlight/Highlight;->getDataSetIndex()I

    move-result v5

    invoke-virtual {v4, v5}, Lcom/github/mikephil/charting/data/RadarData;->getDataSetByIndex(I)Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    move-result-object v20

    check-cast v20, Lcom/github/mikephil/charting/interfaces/datasets/IRadarDataSet;

    .line 269
    .local v20, "set":Lcom/github/mikephil/charting/interfaces/datasets/IRadarDataSet;
    if-eqz v20, :cond_4c

    invoke-interface/range {v20 .. v20}, Lcom/github/mikephil/charting/interfaces/datasets/IRadarDataSet;->isHighlightEnabled()Z

    move-result v4

    if-nez v4, :cond_4f

    .line 263
    :cond_4c
    :goto_4c
    add-int/lit8 v15, v15, 0x1

    goto :goto_29

    .line 273
    :cond_4f
    aget-object v4, p2, v15

    invoke-virtual {v4}, Lcom/github/mikephil/charting/highlight/Highlight;->getXIndex()I

    move-result v22

    .line 275
    .local v22, "xIndex":I
    move-object/from16 v0, v20

    move/from16 v1, v22

    invoke-interface {v0, v1}, Lcom/github/mikephil/charting/interfaces/datasets/IRadarDataSet;->getEntryForXIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v13

    .line 276
    .local v13, "e":Lcom/github/mikephil/charting/data/Entry;
    if-eqz v13, :cond_4c

    invoke-virtual {v13}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v4

    move/from16 v0, v22

    if-ne v4, v0, :cond_4c

    .line 279
    move-object/from16 v0, v20

    invoke-interface {v0, v13}, Lcom/github/mikephil/charting/interfaces/datasets/IRadarDataSet;->getEntryIndex(Lcom/github/mikephil/charting/data/Entry;)I

    move-result v16

    .line 280
    .local v16, "j":I
    invoke-virtual {v13}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {v5}, Lcom/github/mikephil/charting/charts/RadarChart;->getYChartMin()F

    move-result v5

    sub-float v23, v4, v5

    .line 282
    .local v23, "y":F
    invoke-static/range {v23 .. v23}, Ljava/lang/Float;->isNaN(F)Z

    move-result v4

    if-nez v4, :cond_4c

    .line 285
    mul-float v4, v23, v14

    mul-float v4, v4, v18

    move/from16 v0, v16

    int-to-float v5, v0

    mul-float v5, v5, v21

    mul-float v5, v5, v17

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {v7}, Lcom/github/mikephil/charting/charts/RadarChart;->getRotationAngle()F

    move-result v7

    add-float/2addr v5, v7

    invoke-static {v12, v4, v5}, Lcom/github/mikephil/charting/utils/Utils;->getPosition(Landroid/graphics/PointF;FF)Landroid/graphics/PointF;

    move-result-object v6

    .line 290
    .local v6, "p":Landroid/graphics/PointF;
    const/4 v4, 0x2

    new-array v0, v4, [F

    move-object/from16 v19, v0

    const/4 v4, 0x0

    iget v5, v6, Landroid/graphics/PointF;->x:F

    aput v5, v19, v4

    const/4 v4, 0x1

    iget v5, v6, Landroid/graphics/PointF;->y:F

    aput v5, v19, v4

    .line 295
    .local v19, "pts":[F
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v19

    move-object/from16 v3, v20

    invoke-virtual {v0, v1, v2, v3}, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->drawHighlightLines(Landroid/graphics/Canvas;[FLcom/github/mikephil/charting/interfaces/datasets/ILineScatterCandleRadarDataSet;)V

    .line 297
    invoke-interface/range {v20 .. v20}, Lcom/github/mikephil/charting/interfaces/datasets/IRadarDataSet;->isDrawHighlightCircleEnabled()Z

    move-result v4

    if-eqz v4, :cond_4c

    .line 299
    const/4 v4, 0x0

    aget v4, v19, v4

    invoke-static {v4}, Ljava/lang/Float;->isNaN(F)Z

    move-result v4

    if-nez v4, :cond_4c

    const/4 v4, 0x1

    aget v4, v19, v4

    invoke-static {v4}, Ljava/lang/Float;->isNaN(F)Z

    move-result v4

    if-nez v4, :cond_4c

    .line 301
    invoke-interface/range {v20 .. v20}, Lcom/github/mikephil/charting/interfaces/datasets/IRadarDataSet;->getHighlightCircleStrokeColor()I

    move-result v10

    .line 302
    .local v10, "strokeColor":I
    const v4, 0x112233

    if-ne v10, v4, :cond_db

    .line 303
    const/4 v4, 0x0

    move-object/from16 v0, v20

    invoke-interface {v0, v4}, Lcom/github/mikephil/charting/interfaces/datasets/IRadarDataSet;->getColor(I)I

    move-result v10

    .line 306
    :cond_db
    invoke-interface/range {v20 .. v20}, Lcom/github/mikephil/charting/interfaces/datasets/IRadarDataSet;->getHighlightCircleStrokeAlpha()I

    move-result v4

    const/16 v5, 0xff

    if-ge v4, v5, :cond_eb

    .line 307
    invoke-interface/range {v20 .. v20}, Lcom/github/mikephil/charting/interfaces/datasets/IRadarDataSet;->getHighlightCircleStrokeAlpha()I

    move-result v4

    invoke-static {v10, v4}, Lcom/github/mikephil/charting/utils/ColorTemplate;->getColorWithAlphaComponent(II)I

    move-result v10

    .line 310
    :cond_eb
    invoke-interface/range {v20 .. v20}, Lcom/github/mikephil/charting/interfaces/datasets/IRadarDataSet;->getHighlightCircleInnerRadius()F

    move-result v7

    invoke-interface/range {v20 .. v20}, Lcom/github/mikephil/charting/interfaces/datasets/IRadarDataSet;->getHighlightCircleOuterRadius()F

    move-result v8

    invoke-interface/range {v20 .. v20}, Lcom/github/mikephil/charting/interfaces/datasets/IRadarDataSet;->getHighlightCircleFillColor()I

    move-result v9

    invoke-interface/range {v20 .. v20}, Lcom/github/mikephil/charting/interfaces/datasets/IRadarDataSet;->getHighlightCircleStrokeWidth()F

    move-result v11

    move-object/from16 v4, p0

    move-object/from16 v5, p1

    invoke-virtual/range {v4 .. v11}, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->drawHighlightCircle(Landroid/graphics/Canvas;Landroid/graphics/PointF;FFIIF)V

    goto/16 :goto_4c

    .line 320
    .end local v6    # "p":Landroid/graphics/PointF;
    .end local v10    # "strokeColor":I
    .end local v13    # "e":Lcom/github/mikephil/charting/data/Entry;
    .end local v16    # "j":I
    .end local v19    # "pts":[F
    .end local v20    # "set":Lcom/github/mikephil/charting/interfaces/datasets/IRadarDataSet;
    .end local v22    # "xIndex":I
    .end local v23    # "y":F
    :cond_104
    return-void
.end method

.method public drawValues(Landroid/graphics/Canvas;)V
    .registers 21
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    .line 161
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseX()F

    move-result v15

    .line 162
    .local v15, "phaseX":F
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseY()F

    move-result v16

    .line 164
    .local v16, "phaseY":F
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/charts/RadarChart;->getSliceAngle()F

    move-result v17

    .line 168
    .local v17, "sliceangle":F
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/charts/RadarChart;->getFactor()F

    move-result v12

    .line 170
    .local v12, "factor":F
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/charts/RadarChart;->getCenterOffsets()Landroid/graphics/PointF;

    move-result-object v10

    .line 172
    .local v10, "center":Landroid/graphics/PointF;
    const/high16 v1, 0x40a00000    # 5.0f

    invoke-static {v1}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v18

    .line 174
    .local v18, "yoffset":F
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_2f
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/charts/RadarChart;->getData()Lcom/github/mikephil/charting/data/ChartData;

    move-result-object v1

    check-cast v1, Lcom/github/mikephil/charting/data/RadarData;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/data/RadarData;->getDataSetCount()I

    move-result v1

    if-ge v6, v1, :cond_ab

    .line 176
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/charts/RadarChart;->getData()Lcom/github/mikephil/charting/data/ChartData;

    move-result-object v1

    check-cast v1, Lcom/github/mikephil/charting/data/RadarData;

    invoke-virtual {v1, v6}, Lcom/github/mikephil/charting/data/RadarData;->getDataSetByIndex(I)Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    move-result-object v11

    check-cast v11, Lcom/github/mikephil/charting/interfaces/datasets/IRadarDataSet;

    .line 178
    .local v11, "dataSet":Lcom/github/mikephil/charting/interfaces/datasets/IRadarDataSet;
    invoke-interface {v11}, Lcom/github/mikephil/charting/interfaces/datasets/IRadarDataSet;->isDrawValuesEnabled()Z

    move-result v1

    if-eqz v1, :cond_5b

    invoke-interface {v11}, Lcom/github/mikephil/charting/interfaces/datasets/IRadarDataSet;->getEntryCount()I

    move-result v1

    if-nez v1, :cond_5e

    .line 174
    :cond_5b
    add-int/lit8 v6, v6, 0x1

    goto :goto_2f

    .line 182
    :cond_5e
    move-object/from16 v0, p0

    invoke-virtual {v0, v11}, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->applyValueTextStyle(Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;)V

    .line 184
    const/4 v13, 0x0

    .local v13, "j":I
    :goto_64
    invoke-interface {v11}, Lcom/github/mikephil/charting/interfaces/datasets/IRadarDataSet;->getEntryCount()I

    move-result v1

    if-ge v13, v1, :cond_5b

    .line 186
    invoke-interface {v11, v13}, Lcom/github/mikephil/charting/interfaces/datasets/IRadarDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v5

    .line 188
    .local v5, "entry":Lcom/github/mikephil/charting/data/Entry;
    invoke-virtual {v5}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v1

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/charts/RadarChart;->getYChartMin()F

    move-result v2

    sub-float/2addr v1, v2

    mul-float/2addr v1, v12

    mul-float v1, v1, v16

    int-to-float v2, v13

    mul-float v2, v2, v17

    mul-float/2addr v2, v15

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/charts/RadarChart;->getRotationAngle()F

    move-result v3

    add-float/2addr v2, v3

    invoke-static {v10, v1, v2}, Lcom/github/mikephil/charting/utils/Utils;->getPosition(Landroid/graphics/PointF;FF)Landroid/graphics/PointF;

    move-result-object v14

    .line 193
    .local v14, "p":Landroid/graphics/PointF;
    invoke-interface {v11}, Lcom/github/mikephil/charting/interfaces/datasets/IRadarDataSet;->getValueFormatter()Lcom/github/mikephil/charting/formatter/ValueFormatter;

    move-result-object v3

    invoke-virtual {v5}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v4

    iget v7, v14, Landroid/graphics/PointF;->x:F

    iget v1, v14, Landroid/graphics/PointF;->y:F

    sub-float v8, v1, v18

    invoke-interface {v11, v13}, Lcom/github/mikephil/charting/interfaces/datasets/IRadarDataSet;->getValueTextColor(I)I

    move-result v9

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    invoke-virtual/range {v1 .. v9}, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->drawValue(Landroid/graphics/Canvas;Lcom/github/mikephil/charting/formatter/ValueFormatter;FLcom/github/mikephil/charting/data/Entry;IFFI)V

    .line 184
    add-int/lit8 v13, v13, 0x1

    goto :goto_64

    .line 196
    .end local v5    # "entry":Lcom/github/mikephil/charting/data/Entry;
    .end local v11    # "dataSet":Lcom/github/mikephil/charting/interfaces/datasets/IRadarDataSet;
    .end local v13    # "j":I
    .end local v14    # "p":Landroid/graphics/PointF;
    :cond_ab
    return-void
.end method

.method protected drawWeb(Landroid/graphics/Canvas;)V
    .registers 21
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    .line 205
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/charts/RadarChart;->getSliceAngle()F

    move-result v17

    .line 209
    .local v17, "sliceangle":F
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/charts/RadarChart;->getFactor()F

    move-result v8

    .line 210
    .local v8, "factor":F
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/charts/RadarChart;->getRotationAngle()F

    move-result v16

    .line 212
    .local v16, "rotationangle":F
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/charts/RadarChart;->getCenterOffsets()Landroid/graphics/PointF;

    move-result-object v7

    .line 215
    .local v7, "center":Landroid/graphics/PointF;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mWebPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/charts/RadarChart;->getWebLineWidth()F

    move-result v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 216
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mWebPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/charts/RadarChart;->getWebColor()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 217
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mWebPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/charts/RadarChart;->getWebAlpha()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 219
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/charts/RadarChart;->getSkipWebLineCount()I

    move-result v1

    add-int/lit8 v18, v1, 0x1

    .line 221
    .local v18, "xIncrements":I
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_58
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/charts/RadarChart;->getData()Lcom/github/mikephil/charting/data/ChartData;

    move-result-object v1

    check-cast v1, Lcom/github/mikephil/charting/data/RadarData;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/data/RadarData;->getXValCount()I

    move-result v1

    if-ge v9, v1, :cond_8e

    .line 223
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/charts/RadarChart;->getYRange()F

    move-result v1

    mul-float/2addr v1, v8

    int-to-float v2, v9

    mul-float v2, v2, v17

    add-float v2, v2, v16

    invoke-static {v7, v1, v2}, Lcom/github/mikephil/charting/utils/Utils;->getPosition(Landroid/graphics/PointF;FF)Landroid/graphics/PointF;

    move-result-object v12

    .line 228
    .local v12, "p":Landroid/graphics/PointF;
    iget v2, v7, Landroid/graphics/PointF;->x:F

    iget v3, v7, Landroid/graphics/PointF;->y:F

    iget v4, v12, Landroid/graphics/PointF;->x:F

    iget v5, v12, Landroid/graphics/PointF;->y:F

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mWebPaint:Landroid/graphics/Paint;

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 221
    add-int v9, v9, v18

    goto :goto_58

    .line 232
    .end local v12    # "p":Landroid/graphics/PointF;
    :cond_8e
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mWebPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/charts/RadarChart;->getWebLineWidthInner()F

    move-result v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 233
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mWebPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/charts/RadarChart;->getWebColorInner()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 234
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mWebPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/charts/RadarChart;->getWebAlpha()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 236
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/charts/RadarChart;->getYAxis()Lcom/github/mikephil/charting/components/YAxis;

    move-result-object v1

    iget v11, v1, Lcom/github/mikephil/charting/components/YAxis;->mEntryCount:I

    .line 238
    .local v11, "labelCount":I
    const/4 v10, 0x0

    .local v10, "j":I
    :goto_c6
    if-ge v10, v11, :cond_11b

    .line 240
    const/4 v9, 0x0

    :goto_c9
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/charts/RadarChart;->getData()Lcom/github/mikephil/charting/data/ChartData;

    move-result-object v1

    check-cast v1, Lcom/github/mikephil/charting/data/RadarData;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/data/RadarData;->getXValCount()I

    move-result v1

    if-ge v9, v1, :cond_118

    .line 242
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/charts/RadarChart;->getYAxis()Lcom/github/mikephil/charting/components/YAxis;

    move-result-object v1

    iget-object v1, v1, Lcom/github/mikephil/charting/components/YAxis;->mEntries:[F

    aget v1, v1, v10

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/charts/RadarChart;->getYChartMin()F

    move-result v2

    sub-float/2addr v1, v2

    mul-float v15, v1, v8

    .line 244
    .local v15, "r":F
    int-to-float v1, v9

    mul-float v1, v1, v17

    add-float v1, v1, v16

    invoke-static {v7, v15, v1}, Lcom/github/mikephil/charting/utils/Utils;->getPosition(Landroid/graphics/PointF;FF)Landroid/graphics/PointF;

    move-result-object v13

    .line 245
    .local v13, "p1":Landroid/graphics/PointF;
    add-int/lit8 v1, v9, 0x1

    int-to-float v1, v1

    mul-float v1, v1, v17

    add-float v1, v1, v16

    invoke-static {v7, v15, v1}, Lcom/github/mikephil/charting/utils/Utils;->getPosition(Landroid/graphics/PointF;FF)Landroid/graphics/PointF;

    move-result-object v14

    .line 247
    .local v14, "p2":Landroid/graphics/PointF;
    iget v2, v13, Landroid/graphics/PointF;->x:F

    iget v3, v13, Landroid/graphics/PointF;->y:F

    iget v4, v14, Landroid/graphics/PointF;->x:F

    iget v5, v14, Landroid/graphics/PointF;->y:F

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mWebPaint:Landroid/graphics/Paint;

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 240
    add-int/lit8 v9, v9, 0x1

    goto :goto_c9

    .line 238
    .end local v13    # "p1":Landroid/graphics/PointF;
    .end local v14    # "p2":Landroid/graphics/PointF;
    .end local v15    # "r":F
    :cond_118
    add-int/lit8 v10, v10, 0x1

    goto :goto_c6

    .line 250
    :cond_11b
    return-void
.end method

.method public getWebPaint()Landroid/graphics/Paint;
    .registers 2

    .prologue
    .line 48
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/RadarChartRenderer;->mWebPaint:Landroid/graphics/Paint;

    return-object v0
.end method

.method public initBuffers()V
    .registers 1

    .prologue
    .line 55
    return-void
.end method
