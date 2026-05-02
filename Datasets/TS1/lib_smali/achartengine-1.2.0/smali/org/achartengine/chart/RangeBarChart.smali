.class public Lorg/achartengine/chart/RangeBarChart;
.super Lorg/achartengine/chart/BarChart;
.source "RangeBarChart.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "RangeBar"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 36
    invoke-direct {p0}, Lorg/achartengine/chart/BarChart;-><init>()V

    .line 37
    return-void
.end method

.method constructor <init>(Lorg/achartengine/chart/BarChart$Type;)V
    .registers 2
    .param p1, "type"    # Lorg/achartengine/chart/BarChart$Type;

    .prologue
    .line 40
    invoke-direct {p0, p1}, Lorg/achartengine/chart/BarChart;-><init>(Lorg/achartengine/chart/BarChart$Type;)V

    .line 41
    return-void
.end method

.method public constructor <init>(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;Lorg/achartengine/chart/BarChart$Type;)V
    .registers 4
    .param p1, "dataset"    # Lorg/achartengine/model/XYMultipleSeriesDataset;
    .param p2, "renderer"    # Lorg/achartengine/renderer/XYMultipleSeriesRenderer;
    .param p3, "type"    # Lorg/achartengine/chart/BarChart$Type;

    .prologue
    .line 51
    invoke-direct {p0, p1, p2, p3}, Lorg/achartengine/chart/BarChart;-><init>(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;Lorg/achartengine/chart/BarChart$Type;)V

    .line 52
    return-void
.end method


# virtual methods
.method protected drawChartValuesText(Landroid/graphics/Canvas;Lorg/achartengine/model/XYSeries;Lorg/achartengine/renderer/XYSeriesRenderer;Landroid/graphics/Paint;Ljava/util/List;II)V
    .registers 21
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "series"    # Lorg/achartengine/model/XYSeries;
    .param p3, "renderer"    # Lorg/achartengine/renderer/XYSeriesRenderer;
    .param p4, "paint"    # Landroid/graphics/Paint;
    .param p6, "seriesIndex"    # I
    .param p7, "startIndex"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Canvas;",
            "Lorg/achartengine/model/XYSeries;",
            "Lorg/achartengine/renderer/XYSeriesRenderer;",
            "Landroid/graphics/Paint;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Float;",
            ">;II)V"
        }
    .end annotation

    .prologue
    .line 103
    .local p5, "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    iget-object v1, p0, Lorg/achartengine/chart/RangeBarChart;->mDataset:Lorg/achartengine/model/XYMultipleSeriesDataset;

    invoke-virtual {v1}, Lorg/achartengine/model/XYMultipleSeriesDataset;->getSeriesCount()I

    move-result v11

    .line 104
    .local v11, "seriesNr":I
    invoke-interface/range {p5 .. p5}, Ljava/util/List;->size()I

    move-result v1

    move-object/from16 v0, p5

    invoke-virtual {p0, v0, v1, v11}, Lorg/achartengine/chart/RangeBarChart;->getHalfDiffX(Ljava/util/List;II)F

    move-result v8

    .line 105
    .local v8, "halfDiffX":F
    const/4 v12, 0x0

    .line 106
    .local v12, "start":I
    if-lez p7, :cond_14

    .line 107
    const/4 v12, 0x2

    .line 109
    :cond_14
    move v9, v12

    .local v9, "i":I
    :goto_15
    invoke-interface/range {p5 .. p5}, Ljava/util/List;->size()I

    move-result v1

    if-ge v9, v1, :cond_c0

    .line 110
    div-int/lit8 v1, v9, 0x2

    add-int v10, p7, v1

    .line 111
    .local v10, "index":I
    move-object/from16 v0, p5

    invoke-interface {v0, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v4

    .line 112
    .local v4, "x":F
    iget-object v1, p0, Lorg/achartengine/chart/RangeBarChart;->mType:Lorg/achartengine/chart/BarChart$Type;

    sget-object v2, Lorg/achartengine/chart/BarChart$Type;->DEFAULT:Lorg/achartengine/chart/BarChart$Type;

    if-ne v1, v2, :cond_3c

    .line 113
    mul-int/lit8 v1, p6, 0x2

    int-to-float v1, v1

    mul-float/2addr v1, v8

    int-to-float v2, v11

    const/high16 v3, 0x3fc00000    # 1.5f

    sub-float/2addr v2, v3

    mul-float/2addr v2, v8

    sub-float/2addr v1, v2

    add-float/2addr v4, v1

    .line 116
    :cond_3c
    add-int/lit8 v1, v10, 0x1

    invoke-virtual {p2, v1}, Lorg/achartengine/model/XYSeries;->getY(I)D

    move-result-wide v1

    invoke-virtual {p0, v1, v2}, Lorg/achartengine/chart/RangeBarChart;->isNullValue(D)Z

    move-result v1

    if-nez v1, :cond_7a

    invoke-interface/range {p5 .. p5}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v2, v9, 0x3

    if-le v1, v2, :cond_7a

    .line 118
    invoke-virtual/range {p3 .. p3}, Lorg/achartengine/renderer/XYSeriesRenderer;->getChartValuesFormat()Ljava/text/NumberFormat;

    move-result-object v1

    add-int/lit8 v2, v10, 0x1

    invoke-virtual {p2, v2}, Lorg/achartengine/model/XYSeries;->getY(I)D

    move-result-wide v2

    invoke-virtual {p0, v1, v2, v3}, Lorg/achartengine/chart/RangeBarChart;->getLabel(Ljava/text/NumberFormat;D)Ljava/lang/String;

    move-result-object v3

    add-int/lit8 v1, v9, 0x3

    move-object/from16 v0, p5

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-virtual/range {p3 .. p3}, Lorg/achartengine/renderer/XYSeriesRenderer;->getChartValuesSpacing()F

    move-result v2

    sub-float v5, v1, v2

    const/4 v7, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object/from16 v6, p4

    invoke-virtual/range {v1 .. v7}, Lorg/achartengine/chart/RangeBarChart;->drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;F)V

    .line 121
    :cond_7a
    invoke-virtual {p2, v10}, Lorg/achartengine/model/XYSeries;->getY(I)D

    move-result-wide v1

    invoke-virtual {p0, v1, v2}, Lorg/achartengine/chart/RangeBarChart;->isNullValue(D)Z

    move-result v1

    if-nez v1, :cond_bc

    invoke-interface/range {p5 .. p5}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v2, v9, 0x1

    if-le v1, v2, :cond_bc

    .line 123
    invoke-virtual/range {p3 .. p3}, Lorg/achartengine/renderer/XYSeriesRenderer;->getChartValuesFormat()Ljava/text/NumberFormat;

    move-result-object v1

    invoke-virtual {p2, v10}, Lorg/achartengine/model/XYSeries;->getY(I)D

    move-result-wide v2

    invoke-virtual {p0, v1, v2, v3}, Lorg/achartengine/chart/RangeBarChart;->getLabel(Ljava/text/NumberFormat;D)Ljava/lang/String;

    move-result-object v3

    add-int/lit8 v1, v9, 0x1

    move-object/from16 v0, p5

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-virtual/range {p3 .. p3}, Lorg/achartengine/renderer/XYSeriesRenderer;->getChartValuesTextSize()F

    move-result v2

    add-float/2addr v1, v2

    invoke-virtual/range {p3 .. p3}, Lorg/achartengine/renderer/XYSeriesRenderer;->getChartValuesSpacing()F

    move-result v2

    add-float/2addr v1, v2

    const/high16 v2, 0x40400000    # 3.0f

    sub-float v5, v1, v2

    const/4 v7, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object/from16 v6, p4

    invoke-virtual/range {v1 .. v7}, Lorg/achartengine/chart/RangeBarChart;->drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;F)V

    .line 109
    :cond_bc
    add-int/lit8 v9, v9, 0x4

    goto/16 :goto_15

    .line 131
    .end local v4    # "x":F
    .end local v10    # "index":I
    :cond_c0
    return-void
.end method

.method public drawSeries(Landroid/graphics/Canvas;Landroid/graphics/Paint;Ljava/util/List;Lorg/achartengine/renderer/XYSeriesRenderer;FII)V
    .registers 22
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
    .line 68
    .local p3, "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    iget-object v1, p0, Lorg/achartengine/chart/RangeBarChart;->mDataset:Lorg/achartengine/model/XYMultipleSeriesDataset;

    invoke-virtual {v1}, Lorg/achartengine/model/XYMultipleSeriesDataset;->getSeriesCount()I

    move-result v8

    .line 69
    .local v8, "seriesNr":I
    invoke-interface/range {p3 .. p3}, Ljava/util/List;->size()I

    move-result v12

    .line 70
    .local v12, "length":I
    invoke-virtual/range {p4 .. p4}, Lorg/achartengine/renderer/XYSeriesRenderer;->getColor()I

    move-result v1

    move-object/from16 v0, p2

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 71
    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    move-object/from16 v0, p2

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 72
    move-object/from16 v0, p3

    invoke-virtual {p0, v0, v12, v8}, Lorg/achartengine/chart/RangeBarChart;->getHalfDiffX(Ljava/util/List;II)F

    move-result v7

    .line 73
    .local v7, "halfDiffX":F
    const/4 v13, 0x0

    .line 74
    .local v13, "start":I
    if-lez p7, :cond_24

    .line 75
    const/4 v13, 0x2

    .line 77
    :cond_24
    move v11, v13

    .local v11, "i":I
    :goto_25
    if-ge v11, v12, :cond_71

    .line 78
    invoke-interface/range {p3 .. p3}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v2, v11, 0x3

    if-le v1, v2, :cond_6e

    .line 79
    move-object/from16 v0, p3

    invoke-interface {v0, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v3

    .line 80
    .local v3, "xMin":F
    add-int/lit8 v1, v11, 0x1

    move-object/from16 v0, p3

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v4

    .line 82
    .local v4, "yMin":F
    add-int/lit8 v1, v11, 0x2

    move-object/from16 v0, p3

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v5

    .line 83
    .local v5, "xMax":F
    add-int/lit8 v1, v11, 0x3

    move-object/from16 v0, p3

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v6

    .local v6, "yMax":F
    move-object v1, p0

    move-object v2, p1

    move/from16 v9, p6

    move-object/from16 v10, p2

    .line 84
    invoke-virtual/range {v1 .. v10}, Lorg/achartengine/chart/RangeBarChart;->drawBar(Landroid/graphics/Canvas;FFFFFIILandroid/graphics/Paint;)V

    .line 77
    .end local v3    # "xMin":F
    .end local v4    # "yMin":F
    .end local v5    # "xMax":F
    .end local v6    # "yMax":F
    :cond_6e
    add-int/lit8 v11, v11, 0x4

    goto :goto_25

    .line 87
    :cond_71
    invoke-virtual/range {p4 .. p4}, Lorg/achartengine/renderer/XYSeriesRenderer;->getColor()I

    move-result v1

    move-object/from16 v0, p2

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 88
    return-void
.end method

.method public getChartType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 148
    const-string v0, "RangeBar"

    return-object v0
.end method

.method protected getCoeficient()F
    .registers 2

    .prologue
    .line 139
    const/high16 v0, 0x3f000000    # 0.5f

    return v0
.end method
