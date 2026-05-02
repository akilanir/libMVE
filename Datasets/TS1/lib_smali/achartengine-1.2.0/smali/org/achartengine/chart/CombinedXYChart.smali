.class public Lorg/achartengine/chart/CombinedXYChart;
.super Lorg/achartengine/chart/XYChart;
.source "CombinedXYChart.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/achartengine/chart/CombinedXYChart$XYCombinedChartDef;
    }
.end annotation


# instance fields
.field private chartDefinitions:[Lorg/achartengine/chart/CombinedXYChart$XYCombinedChartDef;

.field private mCharts:[Lorg/achartengine/chart/XYChart;

.field private xyChartTypes:[Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;[Lorg/achartengine/chart/CombinedXYChart$XYCombinedChartDef;)V
    .registers 15
    .param p1, "dataset"    # Lorg/achartengine/model/XYMultipleSeriesDataset;
    .param p2, "renderer"    # Lorg/achartengine/renderer/XYMultipleSeriesRenderer;
    .param p3, "chartDefinitions"    # [Lorg/achartengine/chart/CombinedXYChart$XYCombinedChartDef;

    .prologue
    .line 55
    invoke-direct {p0, p1, p2}, Lorg/achartengine/chart/XYChart;-><init>(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V

    .line 42
    const/16 v8, 0x8

    new-array v8, v8, [Ljava/lang/Class;

    const/4 v9, 0x0

    const-class v10, Lorg/achartengine/chart/TimeChart;

    aput-object v10, v8, v9

    const/4 v9, 0x1

    const-class v10, Lorg/achartengine/chart/LineChart;

    aput-object v10, v8, v9

    const/4 v9, 0x2

    const-class v10, Lorg/achartengine/chart/CubicLineChart;

    aput-object v10, v8, v9

    const/4 v9, 0x3

    const-class v10, Lorg/achartengine/chart/BarChart;

    aput-object v10, v8, v9

    const/4 v9, 0x4

    const-class v10, Lorg/achartengine/chart/BubbleChart;

    aput-object v10, v8, v9

    const/4 v9, 0x5

    const-class v10, Lorg/achartengine/chart/ScatterChart;

    aput-object v10, v8, v9

    const/4 v9, 0x6

    const-class v10, Lorg/achartengine/chart/RangeBarChart;

    aput-object v10, v8, v9

    const/4 v9, 0x7

    const-class v10, Lorg/achartengine/chart/RangeStackedBarChart;

    aput-object v10, v8, v9

    iput-object v8, p0, Lorg/achartengine/chart/CombinedXYChart;->xyChartTypes:[Ljava/lang/Class;

    .line 56
    iput-object p3, p0, Lorg/achartengine/chart/CombinedXYChart;->chartDefinitions:[Lorg/achartengine/chart/CombinedXYChart$XYCombinedChartDef;

    .line 57
    array-length v4, p3

    .line 58
    .local v4, "length":I
    new-array v8, v4, [Lorg/achartengine/chart/XYChart;

    iput-object v8, p0, Lorg/achartengine/chart/CombinedXYChart;->mCharts:[Lorg/achartengine/chart/XYChart;

    .line 59
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_39
    if-ge v1, v4, :cond_ad

    .line 61
    :try_start_3b
    iget-object v8, p0, Lorg/achartengine/chart/CombinedXYChart;->mCharts:[Lorg/achartengine/chart/XYChart;

    aget-object v9, p3, v1

    invoke-virtual {v9}, Lorg/achartengine/chart/CombinedXYChart$XYCombinedChartDef;->getType()Ljava/lang/String;

    move-result-object v9

    invoke-direct {p0, v9}, Lorg/achartengine/chart/CombinedXYChart;->getXYChart(Ljava/lang/String;)Lorg/achartengine/chart/XYChart;

    move-result-object v9

    aput-object v9, v8, v1
    :try_end_49
    .catch Ljava/lang/Exception; {:try_start_3b .. :try_end_49} :catch_ae

    .line 65
    :goto_49
    iget-object v8, p0, Lorg/achartengine/chart/CombinedXYChart;->mCharts:[Lorg/achartengine/chart/XYChart;

    aget-object v8, v8, v1

    if-nez v8, :cond_6e

    .line 66
    new-instance v8, Ljava/lang/IllegalArgumentException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Unknown chart type "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    aget-object v10, p3, v1

    invoke-virtual {v10}, Lorg/achartengine/chart/CombinedXYChart$XYCombinedChartDef;->getType()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 68
    :cond_6e
    new-instance v5, Lorg/achartengine/model/XYMultipleSeriesDataset;

    invoke-direct {v5}, Lorg/achartengine/model/XYMultipleSeriesDataset;-><init>()V

    .line 69
    .local v5, "newDataset":Lorg/achartengine/model/XYMultipleSeriesDataset;
    new-instance v6, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-direct {v6}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;-><init>()V

    .line 70
    .local v6, "newRenderer":Lorg/achartengine/renderer/XYMultipleSeriesRenderer;
    aget-object v8, p3, v1

    invoke-virtual {v8}, Lorg/achartengine/chart/CombinedXYChart$XYCombinedChartDef;->getSeriesIndex()[I

    move-result-object v0

    .local v0, "arr$":[I
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_80
    if-ge v2, v3, :cond_95

    aget v7, v0, v2

    .line 71
    .local v7, "seriesIndex":I
    invoke-virtual {p1, v7}, Lorg/achartengine/model/XYMultipleSeriesDataset;->getSeriesAt(I)Lorg/achartengine/model/XYSeries;

    move-result-object v8

    invoke-virtual {v5, v8}, Lorg/achartengine/model/XYMultipleSeriesDataset;->addSeries(Lorg/achartengine/model/XYSeries;)V

    .line 72
    invoke-virtual {p2, v7}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getSeriesRendererAt(I)Lorg/achartengine/renderer/SimpleSeriesRenderer;

    move-result-object v8

    invoke-virtual {v6, v8}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->addSeriesRenderer(Lorg/achartengine/renderer/SimpleSeriesRenderer;)V

    .line 70
    add-int/lit8 v2, v2, 0x1

    goto :goto_80

    .line 74
    .end local v7    # "seriesIndex":I
    :cond_95
    invoke-virtual {p2}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getBarSpacing()D

    move-result-wide v8

    invoke-virtual {v6, v8, v9}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setBarSpacing(D)V

    .line 75
    invoke-virtual {p2}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getPointSize()F

    move-result v8

    invoke-virtual {v6, v8}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setPointSize(F)V

    .line 77
    iget-object v8, p0, Lorg/achartengine/chart/CombinedXYChart;->mCharts:[Lorg/achartengine/chart/XYChart;

    aget-object v8, v8, v1

    invoke-virtual {v8, v5, v6}, Lorg/achartengine/chart/XYChart;->setDatasetRenderer(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V

    .line 59
    add-int/lit8 v1, v1, 0x1

    goto :goto_39

    .line 80
    .end local v0    # "arr$":[I
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    .end local v5    # "newDataset":Lorg/achartengine/model/XYMultipleSeriesDataset;
    .end local v6    # "newRenderer":Lorg/achartengine/renderer/XYMultipleSeriesRenderer;
    :cond_ad
    return-void

    .line 62
    :catch_ae
    move-exception v8

    goto :goto_49
.end method

.method private getChartSeriesIndex(I)I
    .registers 6
    .param p1, "seriesIndex"    # I

    .prologue
    .line 188
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v1, p0, Lorg/achartengine/chart/CombinedXYChart;->chartDefinitions:[Lorg/achartengine/chart/CombinedXYChart$XYCombinedChartDef;

    array-length v1, v1

    if-ge v0, v1, :cond_1c

    .line 189
    iget-object v1, p0, Lorg/achartengine/chart/CombinedXYChart;->chartDefinitions:[Lorg/achartengine/chart/CombinedXYChart$XYCombinedChartDef;

    aget-object v1, v1, v0

    invoke-virtual {v1, p1}, Lorg/achartengine/chart/CombinedXYChart$XYCombinedChartDef;->containsSeries(I)Z

    move-result v1

    if-eqz v1, :cond_19

    .line 190
    iget-object v1, p0, Lorg/achartengine/chart/CombinedXYChart;->chartDefinitions:[Lorg/achartengine/chart/CombinedXYChart$XYCombinedChartDef;

    aget-object v1, v1, v0

    invoke-virtual {v1, p1}, Lorg/achartengine/chart/CombinedXYChart$XYCombinedChartDef;->getChartSeriesIndex(I)I

    move-result v1

    return v1

    .line 188
    :cond_19
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 193
    :cond_1c
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unknown series with index "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private getXYChart(I)Lorg/achartengine/chart/XYChart;
    .registers 6
    .param p1, "seriesIndex"    # I

    .prologue
    .line 179
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v1, p0, Lorg/achartengine/chart/CombinedXYChart;->chartDefinitions:[Lorg/achartengine/chart/CombinedXYChart$XYCombinedChartDef;

    array-length v1, v1

    if-ge v0, v1, :cond_18

    .line 180
    iget-object v1, p0, Lorg/achartengine/chart/CombinedXYChart;->chartDefinitions:[Lorg/achartengine/chart/CombinedXYChart$XYCombinedChartDef;

    aget-object v1, v1, v0

    invoke-virtual {v1, p1}, Lorg/achartengine/chart/CombinedXYChart$XYCombinedChartDef;->containsSeries(I)Z

    move-result v1

    if-eqz v1, :cond_15

    .line 181
    iget-object v1, p0, Lorg/achartengine/chart/CombinedXYChart;->mCharts:[Lorg/achartengine/chart/XYChart;

    aget-object v1, v1, v0

    return-object v1

    .line 179
    :cond_15
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 184
    :cond_18
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unknown series with index "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private getXYChart(Ljava/lang/String;)Lorg/achartengine/chart/XYChart;
    .registers 7
    .param p1, "type"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/InstantiationException;
        }
    .end annotation

    .prologue
    .line 91
    const/4 v0, 0x0

    .line 92
    .local v0, "chart":Lorg/achartengine/chart/XYChart;
    iget-object v4, p0, Lorg/achartengine/chart/CombinedXYChart;->xyChartTypes:[Ljava/lang/Class;

    array-length v2, v4

    .line 93
    .local v2, "length":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_5
    if-ge v1, v2, :cond_21

    if-nez v0, :cond_21

    .line 94
    iget-object v4, p0, Lorg/achartengine/chart/CombinedXYChart;->xyChartTypes:[Ljava/lang/Class;

    aget-object v4, v4, v1

    invoke-virtual {v4}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/achartengine/chart/XYChart;

    .line 95
    .local v3, "newChart":Lorg/achartengine/chart/XYChart;
    invoke-virtual {v3}, Lorg/achartengine/chart/XYChart;->getChartType()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1e

    .line 96
    move-object v0, v3

    .line 93
    :cond_1e
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 99
    .end local v3    # "newChart":Lorg/achartengine/chart/XYChart;
    :cond_21
    return-object v0
.end method


# virtual methods
.method protected clickableAreasForPoints(Ljava/util/List;Ljava/util/List;FII)[Lorg/achartengine/chart/ClickableArea;
    .registers 12
    .param p3, "yAxisValue"    # F
    .param p4, "seriesIndex"    # I
    .param p5, "startIndex"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Float;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Double;",
            ">;FII)[",
            "Lorg/achartengine/chart/ClickableArea;"
        }
    .end annotation

    .prologue
    .line 126
    .local p1, "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    .local p2, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    invoke-direct {p0, p4}, Lorg/achartengine/chart/CombinedXYChart;->getXYChart(I)Lorg/achartengine/chart/XYChart;

    move-result-object v0

    .line 127
    .local v0, "chart":Lorg/achartengine/chart/XYChart;
    invoke-direct {p0, p4}, Lorg/achartengine/chart/CombinedXYChart;->getChartSeriesIndex(I)I

    move-result v4

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v5, p5

    invoke-virtual/range {v0 .. v5}, Lorg/achartengine/chart/XYChart;->clickableAreasForPoints(Ljava/util/List;Ljava/util/List;FII)[Lorg/achartengine/chart/ClickableArea;

    move-result-object v1

    return-object v1
.end method

.method public drawLegendShape(Landroid/graphics/Canvas;Lorg/achartengine/renderer/SimpleSeriesRenderer;FFILandroid/graphics/Paint;)V
    .registers 14
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "renderer"    # Lorg/achartengine/renderer/SimpleSeriesRenderer;
    .param p3, "x"    # F
    .param p4, "y"    # F
    .param p5, "seriesIndex"    # I
    .param p6, "paint"    # Landroid/graphics/Paint;

    .prologue
    .line 165
    invoke-direct {p0, p5}, Lorg/achartengine/chart/CombinedXYChart;->getXYChart(I)Lorg/achartengine/chart/XYChart;

    move-result-object v0

    .line 166
    .local v0, "chart":Lorg/achartengine/chart/XYChart;
    invoke-direct {p0, p5}, Lorg/achartengine/chart/CombinedXYChart;->getChartSeriesIndex(I)I

    move-result v5

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    move-object v6, p6

    invoke-virtual/range {v0 .. v6}, Lorg/achartengine/chart/XYChart;->drawLegendShape(Landroid/graphics/Canvas;Lorg/achartengine/renderer/SimpleSeriesRenderer;FFILandroid/graphics/Paint;)V

    .line 167
    return-void
.end method

.method public drawSeries(Landroid/graphics/Canvas;Landroid/graphics/Paint;Ljava/util/List;Lorg/achartengine/renderer/XYSeriesRenderer;FII)V
    .registers 16
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "paint"    # Landroid/graphics/Paint;
    .param p4, "seriesRenderer"    # Lorg/achartengine/renderer/XYSeriesRenderer;
    .param p5, "yAxisValue"    # F
    .param p6, "seriesIndex"    # I
    .param p7, "startIndex"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Canvas;",
            "Landroid/graphics/Paint;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Float;",
            ">;",
            "Lorg/achartengine/renderer/XYSeriesRenderer;",
            "FII)V"
        }
    .end annotation

    .prologue
    .line 116
    .local p3, "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    invoke-direct {p0, p6}, Lorg/achartengine/chart/CombinedXYChart;->getXYChart(I)Lorg/achartengine/chart/XYChart;

    move-result-object v0

    .line 117
    .local v0, "chart":Lorg/achartengine/chart/XYChart;
    invoke-virtual {p0}, Lorg/achartengine/chart/CombinedXYChart;->getScreenR()Landroid/graphics/Rect;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/achartengine/chart/XYChart;->setScreenR(Landroid/graphics/Rect;)V

    .line 118
    iget-object v1, p0, Lorg/achartengine/chart/CombinedXYChart;->mDataset:Lorg/achartengine/model/XYMultipleSeriesDataset;

    invoke-virtual {v1, p6}, Lorg/achartengine/model/XYMultipleSeriesDataset;->getSeriesAt(I)Lorg/achartengine/model/XYSeries;

    move-result-object v1

    invoke-virtual {v1}, Lorg/achartengine/model/XYSeries;->getScaleNumber()I

    move-result v1

    invoke-virtual {p0, v1}, Lorg/achartengine/chart/CombinedXYChart;->getCalcRange(I)[D

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lorg/achartengine/chart/XYChart;->setCalcRange([DI)V

    .line 119
    invoke-direct {p0, p6}, Lorg/achartengine/chart/CombinedXYChart;->getChartSeriesIndex(I)I

    move-result v6

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move v5, p5

    move v7, p7

    invoke-virtual/range {v0 .. v7}, Lorg/achartengine/chart/XYChart;->drawSeries(Landroid/graphics/Canvas;Landroid/graphics/Paint;Ljava/util/List;Lorg/achartengine/renderer/XYSeriesRenderer;FII)V

    .line 121
    return-void
.end method

.method protected drawSeries(Lorg/achartengine/model/XYSeries;Landroid/graphics/Canvas;Landroid/graphics/Paint;Ljava/util/List;Lorg/achartengine/renderer/XYSeriesRenderer;FILorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;I)V
    .registers 21
    .param p1, "series"    # Lorg/achartengine/model/XYSeries;
    .param p2, "canvas"    # Landroid/graphics/Canvas;
    .param p3, "paint"    # Landroid/graphics/Paint;
    .param p5, "seriesRenderer"    # Lorg/achartengine/renderer/XYSeriesRenderer;
    .param p6, "yAxisValue"    # F
    .param p7, "seriesIndex"    # I
    .param p8, "or"    # Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;
    .param p9, "startIndex"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/achartengine/model/XYSeries;",
            "Landroid/graphics/Canvas;",
            "Landroid/graphics/Paint;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Float;",
            ">;",
            "Lorg/achartengine/renderer/XYSeriesRenderer;",
            "FI",
            "Lorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;",
            "I)V"
        }
    .end annotation

    .prologue
    .line 135
    .local p4, "pointsList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    move/from16 v0, p7

    invoke-direct {p0, v0}, Lorg/achartengine/chart/CombinedXYChart;->getXYChart(I)Lorg/achartengine/chart/XYChart;

    move-result-object v1

    .line 136
    .local v1, "chart":Lorg/achartengine/chart/XYChart;
    invoke-virtual {p0}, Lorg/achartengine/chart/CombinedXYChart;->getScreenR()Landroid/graphics/Rect;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/achartengine/chart/XYChart;->setScreenR(Landroid/graphics/Rect;)V

    .line 137
    iget-object v2, p0, Lorg/achartengine/chart/CombinedXYChart;->mDataset:Lorg/achartengine/model/XYMultipleSeriesDataset;

    move/from16 v0, p7

    invoke-virtual {v2, v0}, Lorg/achartengine/model/XYMultipleSeriesDataset;->getSeriesAt(I)Lorg/achartengine/model/XYSeries;

    move-result-object v2

    invoke-virtual {v2}, Lorg/achartengine/model/XYSeries;->getScaleNumber()I

    move-result v2

    invoke-virtual {p0, v2}, Lorg/achartengine/chart/CombinedXYChart;->getCalcRange(I)[D

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lorg/achartengine/chart/XYChart;->setCalcRange([DI)V

    .line 138
    move/from16 v0, p7

    invoke-direct {p0, v0}, Lorg/achartengine/chart/CombinedXYChart;->getChartSeriesIndex(I)I

    move-result v8

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object/from16 v6, p5

    move/from16 v7, p6

    move-object/from16 v9, p8

    move/from16 v10, p9

    invoke-virtual/range {v1 .. v10}, Lorg/achartengine/chart/XYChart;->drawSeries(Lorg/achartengine/model/XYSeries;Landroid/graphics/Canvas;Landroid/graphics/Paint;Ljava/util/List;Lorg/achartengine/renderer/XYSeriesRenderer;FILorg/achartengine/renderer/XYMultipleSeriesRenderer$Orientation;I)V

    .line 140
    return-void
.end method

.method public getChartType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 175
    const-string v0, "Combined"

    return-object v0
.end method

.method public getLegendShapeWidth(I)I
    .registers 4
    .param p1, "seriesIndex"    # I

    .prologue
    .line 149
    invoke-direct {p0, p1}, Lorg/achartengine/chart/CombinedXYChart;->getXYChart(I)Lorg/achartengine/chart/XYChart;

    move-result-object v0

    .line 150
    .local v0, "chart":Lorg/achartengine/chart/XYChart;
    invoke-direct {p0, p1}, Lorg/achartengine/chart/CombinedXYChart;->getChartSeriesIndex(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/achartengine/chart/XYChart;->getLegendShapeWidth(I)I

    move-result v1

    return v1
.end method
