.class public Lcom/github/mikephil/charting/charts/PieChart;
.super Lcom/github/mikephil/charting/charts/PieRadarChartBase;
.source "PieChart.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/github/mikephil/charting/charts/PieRadarChartBase",
        "<",
        "Lcom/github/mikephil/charting/data/PieData;",
        ">;"
    }
.end annotation


# instance fields
.field private mAbsoluteAngles:[F

.field private mCenterText:Ljava/lang/CharSequence;

.field private mCenterTextRadiusPercent:F

.field private mCircleBox:Landroid/graphics/RectF;

.field private mDrawAngles:[F

.field private mDrawCenterText:Z

.field private mDrawHole:Z

.field private mDrawRoundedSlices:Z

.field private mDrawSlicesUnderHole:Z

.field private mDrawXLabels:Z

.field private mHoleRadiusPercent:F

.field protected mMaxAngle:F

.field protected mTransparentCircleRadiusPercent:F

.field private mUsePercentValues:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 97
    invoke-direct {p0, p1}, Lcom/github/mikephil/charting/charts/PieRadarChartBase;-><init>(Landroid/content/Context;)V

    .line 34
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/PieChart;->mCircleBox:Landroid/graphics/RectF;

    .line 39
    iput-boolean v2, p0, Lcom/github/mikephil/charting/charts/PieChart;->mDrawXLabels:Z

    .line 54
    iput-boolean v2, p0, Lcom/github/mikephil/charting/charts/PieChart;->mDrawHole:Z

    .line 59
    iput-boolean v1, p0, Lcom/github/mikephil/charting/charts/PieChart;->mDrawSlicesUnderHole:Z

    .line 64
    iput-boolean v1, p0, Lcom/github/mikephil/charting/charts/PieChart;->mUsePercentValues:Z

    .line 69
    iput-boolean v1, p0, Lcom/github/mikephil/charting/charts/PieChart;->mDrawRoundedSlices:Z

    .line 74
    const-string v0, ""

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/PieChart;->mCenterText:Ljava/lang/CharSequence;

    .line 80
    const/high16 v0, 0x42480000    # 50.0f

    iput v0, p0, Lcom/github/mikephil/charting/charts/PieChart;->mHoleRadiusPercent:F

    .line 85
    const/high16 v0, 0x425c0000    # 55.0f

    iput v0, p0, Lcom/github/mikephil/charting/charts/PieChart;->mTransparentCircleRadiusPercent:F

    .line 90
    iput-boolean v2, p0, Lcom/github/mikephil/charting/charts/PieChart;->mDrawCenterText:Z

    .line 92
    const/high16 v0, 0x42c80000    # 100.0f

    iput v0, p0, Lcom/github/mikephil/charting/charts/PieChart;->mCenterTextRadiusPercent:F

    .line 94
    const/high16 v0, 0x43b40000    # 360.0f

    iput v0, p0, Lcom/github/mikephil/charting/charts/PieChart;->mMaxAngle:F

    .line 98
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 101
    invoke-direct {p0, p1, p2}, Lcom/github/mikephil/charting/charts/PieRadarChartBase;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 34
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/PieChart;->mCircleBox:Landroid/graphics/RectF;

    .line 39
    iput-boolean v2, p0, Lcom/github/mikephil/charting/charts/PieChart;->mDrawXLabels:Z

    .line 54
    iput-boolean v2, p0, Lcom/github/mikephil/charting/charts/PieChart;->mDrawHole:Z

    .line 59
    iput-boolean v1, p0, Lcom/github/mikephil/charting/charts/PieChart;->mDrawSlicesUnderHole:Z

    .line 64
    iput-boolean v1, p0, Lcom/github/mikephil/charting/charts/PieChart;->mUsePercentValues:Z

    .line 69
    iput-boolean v1, p0, Lcom/github/mikephil/charting/charts/PieChart;->mDrawRoundedSlices:Z

    .line 74
    const-string v0, ""

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/PieChart;->mCenterText:Ljava/lang/CharSequence;

    .line 80
    const/high16 v0, 0x42480000    # 50.0f

    iput v0, p0, Lcom/github/mikephil/charting/charts/PieChart;->mHoleRadiusPercent:F

    .line 85
    const/high16 v0, 0x425c0000    # 55.0f

    iput v0, p0, Lcom/github/mikephil/charting/charts/PieChart;->mTransparentCircleRadiusPercent:F

    .line 90
    iput-boolean v2, p0, Lcom/github/mikephil/charting/charts/PieChart;->mDrawCenterText:Z

    .line 92
    const/high16 v0, 0x42c80000    # 100.0f

    iput v0, p0, Lcom/github/mikephil/charting/charts/PieChart;->mCenterTextRadiusPercent:F

    .line 94
    const/high16 v0, 0x43b40000    # 360.0f

    iput v0, p0, Lcom/github/mikephil/charting/charts/PieChart;->mMaxAngle:F

    .line 102
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 105
    invoke-direct {p0, p1, p2, p3}, Lcom/github/mikephil/charting/charts/PieRadarChartBase;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 34
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/PieChart;->mCircleBox:Landroid/graphics/RectF;

    .line 39
    iput-boolean v2, p0, Lcom/github/mikephil/charting/charts/PieChart;->mDrawXLabels:Z

    .line 54
    iput-boolean v2, p0, Lcom/github/mikephil/charting/charts/PieChart;->mDrawHole:Z

    .line 59
    iput-boolean v1, p0, Lcom/github/mikephil/charting/charts/PieChart;->mDrawSlicesUnderHole:Z

    .line 64
    iput-boolean v1, p0, Lcom/github/mikephil/charting/charts/PieChart;->mUsePercentValues:Z

    .line 69
    iput-boolean v1, p0, Lcom/github/mikephil/charting/charts/PieChart;->mDrawRoundedSlices:Z

    .line 74
    const-string v0, ""

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/PieChart;->mCenterText:Ljava/lang/CharSequence;

    .line 80
    const/high16 v0, 0x42480000    # 50.0f

    iput v0, p0, Lcom/github/mikephil/charting/charts/PieChart;->mHoleRadiusPercent:F

    .line 85
    const/high16 v0, 0x425c0000    # 55.0f

    iput v0, p0, Lcom/github/mikephil/charting/charts/PieChart;->mTransparentCircleRadiusPercent:F

    .line 90
    iput-boolean v2, p0, Lcom/github/mikephil/charting/charts/PieChart;->mDrawCenterText:Z

    .line 92
    const/high16 v0, 0x42c80000    # 100.0f

    iput v0, p0, Lcom/github/mikephil/charting/charts/PieChart;->mCenterTextRadiusPercent:F

    .line 94
    const/high16 v0, 0x43b40000    # 360.0f

    iput v0, p0, Lcom/github/mikephil/charting/charts/PieChart;->mMaxAngle:F

    .line 106
    return-void
.end method

.method private calcAngle(F)F
    .registers 3
    .param p1, "value"    # F

    .prologue
    .line 265
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/PieChart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    check-cast v0, Lcom/github/mikephil/charting/data/PieData;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/PieData;->getYValueSum()F

    move-result v0

    invoke-direct {p0, p1, v0}, Lcom/github/mikephil/charting/charts/PieChart;->calcAngle(FF)F

    move-result v0

    return v0
.end method

.method private calcAngle(FF)F
    .registers 5
    .param p1, "value"    # F
    .param p2, "yValueSum"    # F

    .prologue
    .line 276
    div-float v0, p1, p2

    iget v1, p0, Lcom/github/mikephil/charting/charts/PieChart;->mMaxAngle:F

    mul-float/2addr v0, v1

    return v0
.end method

.method private calcAngles()V
    .registers 10

    .prologue
    .line 205
    iget-object v6, p0, Lcom/github/mikephil/charting/charts/PieChart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    check-cast v6, Lcom/github/mikephil/charting/data/PieData;

    invoke-virtual {v6}, Lcom/github/mikephil/charting/data/PieData;->getYValCount()I

    move-result v6

    new-array v6, v6, [F

    iput-object v6, p0, Lcom/github/mikephil/charting/charts/PieChart;->mDrawAngles:[F

    .line 206
    iget-object v6, p0, Lcom/github/mikephil/charting/charts/PieChart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    check-cast v6, Lcom/github/mikephil/charting/data/PieData;

    invoke-virtual {v6}, Lcom/github/mikephil/charting/data/PieData;->getYValCount()I

    move-result v6

    new-array v6, v6, [F

    iput-object v6, p0, Lcom/github/mikephil/charting/charts/PieChart;->mAbsoluteAngles:[F

    .line 208
    iget-object v6, p0, Lcom/github/mikephil/charting/charts/PieChart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    check-cast v6, Lcom/github/mikephil/charting/data/PieData;

    invoke-virtual {v6}, Lcom/github/mikephil/charting/data/PieData;->getYValueSum()F

    move-result v5

    .line 210
    .local v5, "yValueSum":F
    iget-object v6, p0, Lcom/github/mikephil/charting/charts/PieChart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    check-cast v6, Lcom/github/mikephil/charting/data/PieData;

    invoke-virtual {v6}, Lcom/github/mikephil/charting/data/PieData;->getDataSets()Ljava/util/List;

    move-result-object v1

    .line 212
    .local v1, "dataSets":Ljava/util/List;, "Ljava/util/List<Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;>;"
    const/4 v0, 0x0

    .line 214
    .local v0, "cnt":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2a
    iget-object v6, p0, Lcom/github/mikephil/charting/charts/PieChart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    check-cast v6, Lcom/github/mikephil/charting/data/PieData;

    invoke-virtual {v6}, Lcom/github/mikephil/charting/data/PieData;->getDataSetCount()I

    move-result v6

    if-ge v2, v6, :cond_77

    .line 216
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;

    .line 218
    .local v4, "set":Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_3b
    invoke-interface {v4}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getEntryCount()I

    move-result v6

    if-ge v3, v6, :cond_74

    .line 220
    iget-object v6, p0, Lcom/github/mikephil/charting/charts/PieChart;->mDrawAngles:[F

    invoke-interface {v4, v3}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v7

    invoke-virtual {v7}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v7

    invoke-static {v7}, Ljava/lang/Math;->abs(F)F

    move-result v7

    invoke-direct {p0, v7, v5}, Lcom/github/mikephil/charting/charts/PieChart;->calcAngle(FF)F

    move-result v7

    aput v7, v6, v0

    .line 222
    if-nez v0, :cond_64

    .line 223
    iget-object v6, p0, Lcom/github/mikephil/charting/charts/PieChart;->mAbsoluteAngles:[F

    iget-object v7, p0, Lcom/github/mikephil/charting/charts/PieChart;->mDrawAngles:[F

    aget v7, v7, v0

    aput v7, v6, v0

    .line 228
    :goto_5f
    add-int/lit8 v0, v0, 0x1

    .line 218
    add-int/lit8 v3, v3, 0x1

    goto :goto_3b

    .line 225
    :cond_64
    iget-object v6, p0, Lcom/github/mikephil/charting/charts/PieChart;->mAbsoluteAngles:[F

    iget-object v7, p0, Lcom/github/mikephil/charting/charts/PieChart;->mAbsoluteAngles:[F

    add-int/lit8 v8, v0, -0x1

    aget v7, v7, v8

    iget-object v8, p0, Lcom/github/mikephil/charting/charts/PieChart;->mDrawAngles:[F

    aget v8, v8, v0

    add-float/2addr v7, v8

    aput v7, v6, v0

    goto :goto_5f

    .line 214
    :cond_74
    add-int/lit8 v2, v2, 0x1

    goto :goto_2a

    .line 232
    .end local v3    # "j":I
    .end local v4    # "set":Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;
    :cond_77
    return-void
.end method


# virtual methods
.method protected calcMinMax()V
    .registers 1

    .prologue
    .line 165
    invoke-direct {p0}, Lcom/github/mikephil/charting/charts/PieChart;->calcAngles()V

    .line 166
    return-void
.end method

.method public calculateOffsets()V
    .registers 10

    .prologue
    .line 141
    invoke-super {p0}, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->calculateOffsets()V

    .line 144
    iget-object v4, p0, Lcom/github/mikephil/charting/charts/PieChart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    if-nez v4, :cond_8

    .line 160
    :goto_7
    return-void

    .line 147
    :cond_8
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/PieChart;->getDiameter()F

    move-result v1

    .line 148
    .local v1, "diameter":F
    const/high16 v4, 0x40000000    # 2.0f

    div-float v2, v1, v4

    .line 150
    .local v2, "radius":F
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/PieChart;->getCenterOffsets()Landroid/graphics/PointF;

    move-result-object v0

    .line 152
    .local v0, "c":Landroid/graphics/PointF;
    iget-object v4, p0, Lcom/github/mikephil/charting/charts/PieChart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    check-cast v4, Lcom/github/mikephil/charting/data/PieData;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/data/PieData;->getDataSet()Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;

    move-result-object v4

    invoke-interface {v4}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getSelectionShift()F

    move-result v3

    .line 156
    .local v3, "shift":F
    iget-object v4, p0, Lcom/github/mikephil/charting/charts/PieChart;->mCircleBox:Landroid/graphics/RectF;

    iget v5, v0, Landroid/graphics/PointF;->x:F

    sub-float/2addr v5, v2

    add-float/2addr v5, v3

    iget v6, v0, Landroid/graphics/PointF;->y:F

    sub-float/2addr v6, v2

    add-float/2addr v6, v3

    iget v7, v0, Landroid/graphics/PointF;->x:F

    add-float/2addr v7, v2

    sub-float/2addr v7, v3

    iget v8, v0, Landroid/graphics/PointF;->y:F

    add-float/2addr v8, v2

    sub-float/2addr v8, v3

    invoke-virtual {v4, v5, v6, v7, v8}, Landroid/graphics/RectF;->set(FFFF)V

    goto :goto_7
.end method

.method public getAbsoluteAngles()[F
    .registers 2

    .prologue
    .line 340
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/PieChart;->mAbsoluteAngles:[F

    return-object v0
.end method

.method public getCenterCircleBox()Landroid/graphics/PointF;
    .registers 4

    .prologue
    .line 462
    new-instance v0, Landroid/graphics/PointF;

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/PieChart;->mCircleBox:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->centerX()F

    move-result v1

    iget-object v2, p0, Lcom/github/mikephil/charting/charts/PieChart;->mCircleBox:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->centerY()F

    move-result v2

    invoke-direct {v0, v1, v2}, Landroid/graphics/PointF;-><init>(FF)V

    return-object v0
.end method

.method public getCenterText()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 407
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/PieChart;->mCenterText:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getCenterTextRadiusPercent()F
    .registers 2

    .prologue
    .line 624
    iget v0, p0, Lcom/github/mikephil/charting/charts/PieChart;->mCenterTextRadiusPercent:F

    return v0
.end method

.method public getCircleBox()Landroid/graphics/RectF;
    .registers 2

    .prologue
    .line 453
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/PieChart;->mCircleBox:Landroid/graphics/RectF;

    return-object v0
.end method

.method public getDataSetIndexForIndex(I)I
    .registers 5
    .param p1, "xIndex"    # I

    .prologue
    .line 312
    iget-object v2, p0, Lcom/github/mikephil/charting/charts/PieChart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    check-cast v2, Lcom/github/mikephil/charting/data/PieData;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/data/PieData;->getDataSets()Ljava/util/List;

    move-result-object v0

    .line 314
    .local v0, "dataSets":Ljava/util/List;, "Ljava/util/List<Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_9
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_1f

    .line 315
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;

    invoke-interface {v2, p1}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getEntryForXIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v2

    if-eqz v2, :cond_1c

    .line 319
    .end local v1    # "i":I
    :goto_1b
    return v1

    .line 314
    .restart local v1    # "i":I
    :cond_1c
    add-int/lit8 v1, v1, 0x1

    goto :goto_9

    .line 319
    :cond_1f
    const/4 v1, -0x1

    goto :goto_1b
.end method

.method public getDrawAngles()[F
    .registers 2

    .prologue
    .line 330
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/PieChart;->mDrawAngles:[F

    return-object v0
.end method

.method public getHoleRadius()F
    .registers 2

    .prologue
    .line 518
    iget v0, p0, Lcom/github/mikephil/charting/charts/PieChart;->mHoleRadiusPercent:F

    return v0
.end method

.method public getIndexForAngle(F)I
    .registers 5
    .param p1, "angle"    # F

    .prologue
    .line 294
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/PieChart;->getRotationAngle()F

    move-result v2

    sub-float v2, p1, v2

    invoke-static {v2}, Lcom/github/mikephil/charting/utils/Utils;->getNormalizedAngle(F)F

    move-result v0

    .line 296
    .local v0, "a":F
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_b
    iget-object v2, p0, Lcom/github/mikephil/charting/charts/PieChart;->mAbsoluteAngles:[F

    array-length v2, v2

    if-ge v1, v2, :cond_1c

    .line 297
    iget-object v2, p0, Lcom/github/mikephil/charting/charts/PieChart;->mAbsoluteAngles:[F

    aget v2, v2, v1

    cmpl-float v2, v2, v0

    if-lez v2, :cond_19

    .line 301
    .end local v1    # "i":I
    :goto_18
    return v1

    .line 296
    .restart local v1    # "i":I
    :cond_19
    add-int/lit8 v1, v1, 0x1

    goto :goto_b

    .line 301
    :cond_1c
    const/4 v1, -0x1

    goto :goto_18
.end method

.method protected getMarkerPosition(Lcom/github/mikephil/charting/data/Entry;Lcom/github/mikephil/charting/highlight/Highlight;)[F
    .registers 15
    .param p1, "e"    # Lcom/github/mikephil/charting/data/Entry;
    .param p2, "highlight"    # Lcom/github/mikephil/charting/highlight/Highlight;

    .prologue
    const/high16 v10, 0x40000000    # 2.0f

    .line 171
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/PieChart;->getCenterCircleBox()Landroid/graphics/PointF;

    move-result-object v0

    .line 172
    .local v0, "center":Landroid/graphics/PointF;
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/PieChart;->getRadius()F

    move-result v4

    .line 174
    .local v4, "r":F
    const/high16 v8, 0x41200000    # 10.0f

    div-float v8, v4, v8

    const v9, 0x40666666    # 3.6f

    mul-float v2, v8, v9

    .line 176
    .local v2, "off":F
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/PieChart;->isDrawHoleEnabled()Z

    move-result v8

    if-eqz v8, :cond_26

    .line 177
    const/high16 v8, 0x42c80000    # 100.0f

    div-float v8, v4, v8

    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/PieChart;->getHoleRadius()F

    move-result v9

    mul-float/2addr v8, v9

    sub-float v8, v4, v8

    div-float v2, v8, v10

    .line 180
    :cond_26
    sub-float/2addr v4, v2

    .line 182
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/PieChart;->getRotationAngle()F

    move-result v5

    .line 184
    .local v5, "rotationAngle":F
    invoke-virtual {p1}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v1

    .line 187
    .local v1, "i":I
    iget-object v8, p0, Lcom/github/mikephil/charting/charts/PieChart;->mDrawAngles:[F

    aget v8, v8, v1

    div-float v3, v8, v10

    .line 190
    .local v3, "offset":F
    float-to-double v8, v4

    iget-object v10, p0, Lcom/github/mikephil/charting/charts/PieChart;->mAbsoluteAngles:[F

    aget v10, v10, v1

    add-float/2addr v10, v5

    sub-float/2addr v10, v3

    iget-object v11, p0, Lcom/github/mikephil/charting/charts/PieChart;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v11}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseY()F

    move-result v11

    mul-float/2addr v10, v11

    float-to-double v10, v10

    invoke-static {v10, v11}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/Math;->cos(D)D

    move-result-wide v10

    mul-double/2addr v8, v10

    iget v10, v0, Landroid/graphics/PointF;->x:F

    float-to-double v10, v10

    add-double/2addr v8, v10

    double-to-float v6, v8

    .line 193
    .local v6, "x":F
    float-to-double v8, v4

    iget-object v10, p0, Lcom/github/mikephil/charting/charts/PieChart;->mAbsoluteAngles:[F

    aget v10, v10, v1

    add-float/2addr v10, v5

    sub-float/2addr v10, v3

    iget-object v11, p0, Lcom/github/mikephil/charting/charts/PieChart;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v11}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseY()F

    move-result v11

    mul-float/2addr v10, v11

    float-to-double v10, v10

    invoke-static {v10, v11}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/Math;->sin(D)D

    move-result-wide v10

    mul-double/2addr v8, v10

    iget v10, v0, Landroid/graphics/PointF;->y:F

    float-to-double v10, v10

    add-double/2addr v8, v10

    double-to-float v7, v8

    .line 197
    .local v7, "y":F
    const/4 v8, 0x2

    new-array v8, v8, [F

    const/4 v9, 0x0

    aput v6, v8, v9

    const/4 v9, 0x1

    aput v7, v8, v9

    return-object v8
.end method

.method public getMaxAngle()F
    .registers 2

    .prologue
    .line 628
    iget v0, p0, Lcom/github/mikephil/charting/charts/PieChart;->mMaxAngle:F

    return v0
.end method

.method public getRadius()F
    .registers 4

    .prologue
    const/high16 v2, 0x40000000    # 2.0f

    .line 441
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/PieChart;->mCircleBox:Landroid/graphics/RectF;

    if-nez v0, :cond_8

    .line 442
    const/4 v0, 0x0

    .line 444
    :goto_7
    return v0

    :cond_8
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/PieChart;->mCircleBox:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    div-float/2addr v0, v2

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/PieChart;->mCircleBox:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v1

    div-float/2addr v1, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    goto :goto_7
.end method

.method protected getRequiredBaseOffset()F
    .registers 2

    .prologue
    .line 436
    const/4 v0, 0x0

    return v0
.end method

.method protected getRequiredLegendOffset()F
    .registers 3

    .prologue
    .line 431
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/PieChart;->mLegendRenderer:Lcom/github/mikephil/charting/renderer/LegendRenderer;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/renderer/LegendRenderer;->getLabelPaint()Landroid/graphics/Paint;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Paint;->getTextSize()F

    move-result v0

    const/high16 v1, 0x40000000    # 2.0f

    mul-float/2addr v0, v1

    return v0
.end method

.method public getTransparentCircleRadius()F
    .registers 2

    .prologue
    .line 547
    iget v0, p0, Lcom/github/mikephil/charting/charts/PieChart;->mTransparentCircleRadiusPercent:F

    return v0
.end method

.method public getXAxis()Lcom/github/mikephil/charting/components/XAxis;
    .registers 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 287
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "PieChart has no XAxis"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected init()V
    .registers 4

    .prologue
    .line 110
    invoke-super {p0}, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->init()V

    .line 112
    new-instance v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/PieChart;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    iget-object v2, p0, Lcom/github/mikephil/charting/charts/PieChart;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-direct {v0, p0, v1, v2}, Lcom/github/mikephil/charting/renderer/PieChartRenderer;-><init>(Lcom/github/mikephil/charting/charts/PieChart;Lcom/github/mikephil/charting/animation/ChartAnimator;Lcom/github/mikephil/charting/utils/ViewPortHandler;)V

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/PieChart;->mRenderer:Lcom/github/mikephil/charting/renderer/DataRenderer;

    .line 113
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/PieChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    .line 114
    return-void
.end method

.method public isDrawCenterTextEnabled()Z
    .registers 2

    .prologue
    .line 426
    iget-boolean v0, p0, Lcom/github/mikephil/charting/charts/PieChart;->mDrawCenterText:Z

    return v0
.end method

.method public isDrawHoleEnabled()Z
    .registers 2

    .prologue
    .line 386
    iget-boolean v0, p0, Lcom/github/mikephil/charting/charts/PieChart;->mDrawHole:Z

    return v0
.end method

.method public isDrawRoundedSlicesEnabled()Z
    .registers 2

    .prologue
    .line 586
    iget-boolean v0, p0, Lcom/github/mikephil/charting/charts/PieChart;->mDrawRoundedSlices:Z

    return v0
.end method

.method public isDrawSliceTextEnabled()Z
    .registers 2

    .prologue
    .line 576
    iget-boolean v0, p0, Lcom/github/mikephil/charting/charts/PieChart;->mDrawXLabels:Z

    return v0
.end method

.method public isDrawSlicesUnderHoleEnabled()Z
    .registers 2

    .prologue
    .line 367
    iget-boolean v0, p0, Lcom/github/mikephil/charting/charts/PieChart;->mDrawSlicesUnderHole:Z

    return v0
.end method

.method public isUsePercentValuesEnabled()Z
    .registers 2

    .prologue
    .line 606
    iget-boolean v0, p0, Lcom/github/mikephil/charting/charts/PieChart;->mUsePercentValues:Z

    return v0
.end method

.method public needsHighlight(II)Z
    .registers 6
    .param p1, "xIndex"    # I
    .param p2, "dataSetIndex"    # I

    .prologue
    const/4 v1, 0x0

    .line 245
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/PieChart;->valuesToHighlight()Z

    move-result v2

    if-eqz v2, :cond_9

    if-gez p2, :cond_a

    .line 255
    :cond_9
    :goto_9
    return v1

    .line 248
    :cond_a
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_b
    iget-object v2, p0, Lcom/github/mikephil/charting/charts/PieChart;->mIndicesToHighlight:[Lcom/github/mikephil/charting/highlight/Highlight;

    array-length v2, v2

    if-ge v0, v2, :cond_9

    .line 251
    iget-object v2, p0, Lcom/github/mikephil/charting/charts/PieChart;->mIndicesToHighlight:[Lcom/github/mikephil/charting/highlight/Highlight;

    aget-object v2, v2, v0

    invoke-virtual {v2}, Lcom/github/mikephil/charting/highlight/Highlight;->getXIndex()I

    move-result v2

    if-ne v2, p1, :cond_26

    iget-object v2, p0, Lcom/github/mikephil/charting/charts/PieChart;->mIndicesToHighlight:[Lcom/github/mikephil/charting/highlight/Highlight;

    aget-object v2, v2, v0

    invoke-virtual {v2}, Lcom/github/mikephil/charting/highlight/Highlight;->getDataSetIndex()I

    move-result v2

    if-ne v2, p2, :cond_26

    .line 253
    const/4 v1, 0x1

    goto :goto_9

    .line 248
    :cond_26
    add-int/lit8 v0, v0, 0x1

    goto :goto_b
.end method

.method protected onDetachedFromWindow()V
    .registers 2

    .prologue
    .line 651
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/PieChart;->mRenderer:Lcom/github/mikephil/charting/renderer/DataRenderer;

    if-eqz v0, :cond_11

    iget-object v0, p0, Lcom/github/mikephil/charting/charts/PieChart;->mRenderer:Lcom/github/mikephil/charting/renderer/DataRenderer;

    instance-of v0, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;

    if-eqz v0, :cond_11

    .line 652
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/PieChart;->mRenderer:Lcom/github/mikephil/charting/renderer/DataRenderer;

    check-cast v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->releaseBitmap()V

    .line 654
    :cond_11
    invoke-super {p0}, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->onDetachedFromWindow()V

    .line 655
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 4
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 118
    invoke-super {p0, p1}, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->onDraw(Landroid/graphics/Canvas;)V

    .line 120
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/PieChart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    if-nez v0, :cond_8

    .line 137
    :goto_7
    return-void

    .line 123
    :cond_8
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/PieChart;->mRenderer:Lcom/github/mikephil/charting/renderer/DataRenderer;

    invoke-virtual {v0, p1}, Lcom/github/mikephil/charting/renderer/DataRenderer;->drawData(Landroid/graphics/Canvas;)V

    .line 125
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/PieChart;->valuesToHighlight()Z

    move-result v0

    if-eqz v0, :cond_1a

    .line 126
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/PieChart;->mRenderer:Lcom/github/mikephil/charting/renderer/DataRenderer;

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/PieChart;->mIndicesToHighlight:[Lcom/github/mikephil/charting/highlight/Highlight;

    invoke-virtual {v0, p1, v1}, Lcom/github/mikephil/charting/renderer/DataRenderer;->drawHighlighted(Landroid/graphics/Canvas;[Lcom/github/mikephil/charting/highlight/Highlight;)V

    .line 128
    :cond_1a
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/PieChart;->mRenderer:Lcom/github/mikephil/charting/renderer/DataRenderer;

    invoke-virtual {v0, p1}, Lcom/github/mikephil/charting/renderer/DataRenderer;->drawExtras(Landroid/graphics/Canvas;)V

    .line 130
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/PieChart;->mRenderer:Lcom/github/mikephil/charting/renderer/DataRenderer;

    invoke-virtual {v0, p1}, Lcom/github/mikephil/charting/renderer/DataRenderer;->drawValues(Landroid/graphics/Canvas;)V

    .line 132
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/PieChart;->mLegendRenderer:Lcom/github/mikephil/charting/renderer/LegendRenderer;

    invoke-virtual {v0, p1}, Lcom/github/mikephil/charting/renderer/LegendRenderer;->renderLegend(Landroid/graphics/Canvas;)V

    .line 134
    invoke-virtual {p0, p1}, Lcom/github/mikephil/charting/charts/PieChart;->drawDescription(Landroid/graphics/Canvas;)V

    .line 136
    invoke-virtual {p0, p1}, Lcom/github/mikephil/charting/charts/PieChart;->drawMarkers(Landroid/graphics/Canvas;)V

    goto :goto_7
.end method

.method public setCenterText(Ljava/lang/CharSequence;)V
    .registers 3
    .param p1, "text"    # Ljava/lang/CharSequence;

    .prologue
    .line 395
    if-nez p1, :cond_7

    .line 396
    const-string v0, ""

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/PieChart;->mCenterText:Ljava/lang/CharSequence;

    .line 399
    :goto_6
    return-void

    .line 398
    :cond_7
    iput-object p1, p0, Lcom/github/mikephil/charting/charts/PieChart;->mCenterText:Ljava/lang/CharSequence;

    goto :goto_6
.end method

.method public setCenterTextColor(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 499
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/PieChart;->mRenderer:Lcom/github/mikephil/charting/renderer/DataRenderer;

    check-cast v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->getPaintCenterText()Landroid/text/TextPaint;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/text/TextPaint;->setColor(I)V

    .line 500
    return-void
.end method

.method public setCenterTextRadiusPercent(F)V
    .registers 2
    .param p1, "percent"    # F

    .prologue
    .line 615
    iput p1, p0, Lcom/github/mikephil/charting/charts/PieChart;->mCenterTextRadiusPercent:F

    .line 616
    return-void
.end method

.method public setCenterTextSize(F)V
    .registers 4
    .param p1, "sizeDp"    # F

    .prologue
    .line 480
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/PieChart;->mRenderer:Lcom/github/mikephil/charting/renderer/DataRenderer;

    check-cast v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->getPaintCenterText()Landroid/text/TextPaint;

    move-result-object v0

    invoke-static {p1}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v1

    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 482
    return-void
.end method

.method public setCenterTextSizePixels(F)V
    .registers 3
    .param p1, "sizePixels"    # F

    .prologue
    .line 490
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/PieChart;->mRenderer:Lcom/github/mikephil/charting/renderer/DataRenderer;

    check-cast v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->getPaintCenterText()Landroid/text/TextPaint;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 491
    return-void
.end method

.method public setCenterTextTypeface(Landroid/graphics/Typeface;)V
    .registers 3
    .param p1, "t"    # Landroid/graphics/Typeface;

    .prologue
    .line 471
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/PieChart;->mRenderer:Lcom/github/mikephil/charting/renderer/DataRenderer;

    check-cast v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->getPaintCenterText()Landroid/text/TextPaint;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 472
    return-void
.end method

.method public setDrawCenterText(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 417
    iput-boolean p1, p0, Lcom/github/mikephil/charting/charts/PieChart;->mDrawCenterText:Z

    .line 418
    return-void
.end method

.method public setDrawHoleEnabled(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 376
    iput-boolean p1, p0, Lcom/github/mikephil/charting/charts/PieChart;->mDrawHole:Z

    .line 377
    return-void
.end method

.method public setDrawSliceText(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 567
    iput-boolean p1, p0, Lcom/github/mikephil/charting/charts/PieChart;->mDrawXLabels:Z

    .line 568
    return-void
.end method

.method public setDrawSlicesUnderHole(Z)V
    .registers 2
    .param p1, "enable"    # Z

    .prologue
    .line 357
    iput-boolean p1, p0, Lcom/github/mikephil/charting/charts/PieChart;->mDrawSlicesUnderHole:Z

    .line 358
    return-void
.end method

.method public setHoleColor(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 350
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/PieChart;->mRenderer:Lcom/github/mikephil/charting/renderer/DataRenderer;

    check-cast v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->getPaintHole()Landroid/graphics/Paint;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 351
    return-void
.end method

.method public setHoleRadius(F)V
    .registers 2
    .param p1, "percent"    # F

    .prologue
    .line 509
    iput p1, p0, Lcom/github/mikephil/charting/charts/PieChart;->mHoleRadiusPercent:F

    .line 510
    return-void
.end method

.method public setMaxAngle(F)V
    .registers 3
    .param p1, "maxangle"    # F

    .prologue
    .line 639
    const/high16 v0, 0x43b40000    # 360.0f

    cmpl-float v0, p1, v0

    if-lez v0, :cond_8

    .line 640
    const/high16 p1, 0x43b40000    # 360.0f

    .line 642
    :cond_8
    const/high16 v0, 0x42b40000    # 90.0f

    cmpg-float v0, p1, v0

    if-gez v0, :cond_10

    .line 643
    const/high16 p1, 0x42b40000    # 90.0f

    .line 645
    :cond_10
    iput p1, p0, Lcom/github/mikephil/charting/charts/PieChart;->mMaxAngle:F

    .line 646
    return-void
.end method

.method public setTransparentCircleAlpha(I)V
    .registers 3
    .param p1, "alpha"    # I

    .prologue
    .line 558
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/PieChart;->mRenderer:Lcom/github/mikephil/charting/renderer/DataRenderer;

    check-cast v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->getPaintTransparentCircle()Landroid/graphics/Paint;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 559
    return-void
.end method

.method public setTransparentCircleColor(I)V
    .registers 5
    .param p1, "color"    # I

    .prologue
    .line 528
    iget-object v2, p0, Lcom/github/mikephil/charting/charts/PieChart;->mRenderer:Lcom/github/mikephil/charting/renderer/DataRenderer;

    check-cast v2, Lcom/github/mikephil/charting/renderer/PieChartRenderer;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->getPaintTransparentCircle()Landroid/graphics/Paint;

    move-result-object v1

    .line 529
    .local v1, "p":Landroid/graphics/Paint;
    invoke-virtual {v1}, Landroid/graphics/Paint;->getAlpha()I

    move-result v0

    .line 530
    .local v0, "alpha":I
    invoke-virtual {v1, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 531
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 532
    return-void
.end method

.method public setTransparentCircleRadius(F)V
    .registers 2
    .param p1, "percent"    # F

    .prologue
    .line 543
    iput p1, p0, Lcom/github/mikephil/charting/charts/PieChart;->mTransparentCircleRadiusPercent:F

    .line 544
    return-void
.end method

.method public setUsePercentValues(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 597
    iput-boolean p1, p0, Lcom/github/mikephil/charting/charts/PieChart;->mUsePercentValues:Z

    .line 598
    return-void
.end method
