.class public Lorg/achartengine/chart/BubbleChart;
.super Lorg/achartengine/chart/XYChart;
.source "BubbleChart.java"


# static fields
.field private static final MAX_BUBBLE_SIZE:I = 0x14

.field private static final MIN_BUBBLE_SIZE:I = 0x2

.field private static final SHAPE_WIDTH:I = 0xa

.field public static final TYPE:Ljava/lang/String; = "Bubble"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 44
    invoke-direct {p0}, Lorg/achartengine/chart/XYChart;-><init>()V

    .line 45
    return-void
.end method

.method public constructor <init>(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V
    .registers 3
    .param p1, "dataset"    # Lorg/achartengine/model/XYMultipleSeriesDataset;
    .param p2, "renderer"    # Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    .prologue
    .line 54
    invoke-direct {p0, p1, p2}, Lorg/achartengine/chart/XYChart;-><init>(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V

    .line 55
    return-void
.end method

.method private drawCircle(Landroid/graphics/Canvas;Landroid/graphics/Paint;FFF)V
    .registers 6
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "paint"    # Landroid/graphics/Paint;
    .param p3, "x"    # F
    .param p4, "y"    # F
    .param p5, "radius"    # F

    .prologue
    .line 136
    invoke-virtual {p1, p3, p4, p5, p2}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 137
    return-void
.end method


# virtual methods
.method protected clickableAreasForPoints(Ljava/util/List;Ljava/util/List;FII)[Lorg/achartengine/chart/ClickableArea;
    .registers 25
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
    .line 86
    .local p1, "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    .local p2, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    move-result v10

    .line 87
    .local v10, "length":I
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/achartengine/chart/BubbleChart;->mDataset:Lorg/achartengine/model/XYMultipleSeriesDataset;

    move/from16 v0, p4

    invoke-virtual {v1, v0}, Lorg/achartengine/model/XYMultipleSeriesDataset;->getSeriesAt(I)Lorg/achartengine/model/XYSeries;

    move-result-object v14

    check-cast v14, Lorg/achartengine/model/XYValueSeries;

    .line 88
    .local v14, "series":Lorg/achartengine/model/XYValueSeries;
    invoke-virtual {v14}, Lorg/achartengine/model/XYValueSeries;->getMaxValue()D

    move-result-wide v11

    .line 89
    .local v11, "max":D
    const-wide/high16 v1, 0x4034000000000000L    # 20.0

    div-double v7, v1, v11

    .line 90
    .local v7, "coef":D
    div-int/lit8 v1, v10, 0x2

    new-array v13, v1, [Lorg/achartengine/chart/ClickableArea;

    .line 91
    .local v13, "ret":[Lorg/achartengine/chart/ClickableArea;
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_1d
    if-ge v9, v10, :cond_98

    .line 92
    div-int/lit8 v1, v9, 0x2

    add-int v1, v1, p5

    invoke-virtual {v14, v1}, Lorg/achartengine/model/XYValueSeries;->getValue(I)D

    move-result-wide v1

    mul-double/2addr v1, v7

    const-wide/high16 v3, 0x4000000000000000L    # 2.0

    add-double v15, v1, v3

    .line 93
    .local v15, "size":D
    div-int/lit8 v17, v9, 0x2

    new-instance v1, Lorg/achartengine/chart/ClickableArea;

    new-instance v2, Landroid/graphics/RectF;

    move-object/from16 v0, p1

    invoke-interface {v0, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    double-to-float v4, v15

    sub-float v4, v3, v4

    add-int/lit8 v3, v9, 0x1

    move-object/from16 v0, p1

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    double-to-float v5, v15

    sub-float v5, v3, v5

    move-object/from16 v0, p1

    invoke-interface {v0, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    double-to-float v6, v15

    add-float/2addr v6, v3

    add-int/lit8 v3, v9, 0x1

    move-object/from16 v0, p1

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    double-to-float v0, v15

    move/from16 v18, v0

    add-float v3, v3, v18

    invoke-direct {v2, v4, v5, v6, v3}, Landroid/graphics/RectF;-><init>(FFFF)V

    move-object/from16 v0, p2

    invoke-interface {v0, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Double;

    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v3

    add-int/lit8 v5, v9, 0x1

    move-object/from16 v0, p2

    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Double;

    invoke-virtual {v5}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v5

    invoke-direct/range {v1 .. v6}, Lorg/achartengine/chart/ClickableArea;-><init>(Landroid/graphics/RectF;DD)V

    aput-object v1, v13, v17

    .line 91
    add-int/lit8 v9, v9, 0x2

    goto :goto_1d

    .line 97
    .end local v15    # "size":D
    :cond_98
    return-object v13
.end method

.method public drawLegendShape(Landroid/graphics/Canvas;Lorg/achartengine/renderer/SimpleSeriesRenderer;FFILandroid/graphics/Paint;)V
    .registers 13
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "renderer"    # Lorg/achartengine/renderer/SimpleSeriesRenderer;
    .param p3, "x"    # F
    .param p4, "y"    # F
    .param p5, "seriesIndex"    # I
    .param p6, "paint"    # Landroid/graphics/Paint;

    .prologue
    .line 122
    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p6, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 123
    const/high16 v0, 0x41200000    # 10.0f

    add-float v3, p3, v0

    const/high16 v5, 0x40400000    # 3.0f

    move-object v0, p0

    move-object v1, p1

    move-object v2, p6

    move v4, p4

    invoke-direct/range {v0 .. v5}, Lorg/achartengine/chart/BubbleChart;->drawCircle(Landroid/graphics/Canvas;Landroid/graphics/Paint;FFF)V

    .line 124
    return-void
.end method

.method public drawSeries(Landroid/graphics/Canvas;Landroid/graphics/Paint;Ljava/util/List;Lorg/achartengine/renderer/XYSeriesRenderer;FII)V
    .registers 24
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "paint"    # Landroid/graphics/Paint;
    .param p4, "renderer"    # Lorg/achartengine/renderer/XYSeriesRenderer;
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
    .line 71
    .local p3, "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    invoke-virtual/range {p4 .. p4}, Lorg/achartengine/renderer/XYSeriesRenderer;->getColor()I

    move-result v1

    move-object/from16 v0, p2

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 72
    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    move-object/from16 v0, p2

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 73
    invoke-interface/range {p3 .. p3}, Ljava/util/List;->size()I

    move-result v10

    .line 74
    .local v10, "length":I
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/achartengine/chart/BubbleChart;->mDataset:Lorg/achartengine/model/XYMultipleSeriesDataset;

    move/from16 v0, p6

    invoke-virtual {v1, v0}, Lorg/achartengine/model/XYMultipleSeriesDataset;->getSeriesAt(I)Lorg/achartengine/model/XYSeries;

    move-result-object v13

    check-cast v13, Lorg/achartengine/model/XYValueSeries;

    .line 75
    .local v13, "series":Lorg/achartengine/model/XYValueSeries;
    invoke-virtual {v13}, Lorg/achartengine/model/XYValueSeries;->getMaxValue()D

    move-result-wide v11

    .line 76
    .local v11, "max":D
    const-wide/high16 v1, 0x4034000000000000L    # 20.0

    div-double v7, v1, v11

    .line 77
    .local v7, "coef":D
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_29
    if-ge v9, v10, :cond_5f

    .line 78
    div-int/lit8 v1, v9, 0x2

    add-int v1, v1, p7

    invoke-virtual {v13, v1}, Lorg/achartengine/model/XYValueSeries;->getValue(I)D

    move-result-wide v1

    mul-double/2addr v1, v7

    const-wide/high16 v3, 0x4000000000000000L    # 2.0

    add-double v14, v1, v3

    .line 79
    .local v14, "size":D
    move-object/from16 v0, p3

    invoke-interface {v0, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v4

    add-int/lit8 v1, v9, 0x1

    move-object/from16 v0, p3

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v5

    double-to-float v6, v14

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    invoke-direct/range {v1 .. v6}, Lorg/achartengine/chart/BubbleChart;->drawCircle(Landroid/graphics/Canvas;Landroid/graphics/Paint;FFF)V

    .line 77
    add-int/lit8 v9, v9, 0x2

    goto :goto_29

    .line 81
    .end local v14    # "size":D
    :cond_5f
    return-void
.end method

.method public getChartType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 145
    const-string v0, "Bubble"

    return-object v0
.end method

.method public getLegendShapeWidth(I)I
    .registers 3
    .param p1, "seriesIndex"    # I

    .prologue
    .line 107
    const/16 v0, 0xa

    return v0
.end method
