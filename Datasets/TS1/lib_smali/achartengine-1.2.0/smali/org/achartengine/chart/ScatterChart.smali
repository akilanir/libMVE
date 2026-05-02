.class public Lorg/achartengine/chart/ScatterChart;
.super Lorg/achartengine/chart/XYChart;
.source "ScatterChart.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/achartengine/chart/ScatterChart$1;
    }
.end annotation


# static fields
.field private static final SHAPE_WIDTH:I = 0xa

.field private static final SIZE:F = 3.0f

.field public static final TYPE:Ljava/lang/String; = "Scatter"


# instance fields
.field private size:F


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 43
    invoke-direct {p0}, Lorg/achartengine/chart/XYChart;-><init>()V

    .line 41
    const/high16 v0, 0x40400000    # 3.0f

    iput v0, p0, Lorg/achartengine/chart/ScatterChart;->size:F

    .line 44
    return-void
.end method

.method public constructor <init>(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V
    .registers 4
    .param p1, "dataset"    # Lorg/achartengine/model/XYMultipleSeriesDataset;
    .param p2, "renderer"    # Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    .prologue
    .line 53
    invoke-direct {p0, p1, p2}, Lorg/achartengine/chart/XYChart;-><init>(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V

    .line 41
    const/high16 v0, 0x40400000    # 3.0f

    iput v0, p0, Lorg/achartengine/chart/ScatterChart;->size:F

    .line 54
    invoke-virtual {p2}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getPointSize()F

    move-result v0

    iput v0, p0, Lorg/achartengine/chart/ScatterChart;->size:F

    .line 55
    return-void
.end method

.method private drawCircle(Landroid/graphics/Canvas;Landroid/graphics/Paint;FF)V
    .registers 6
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "paint"    # Landroid/graphics/Paint;
    .param p3, "x"    # F
    .param p4, "y"    # F

    .prologue
    .line 210
    iget v0, p0, Lorg/achartengine/chart/ScatterChart;->size:F

    invoke-virtual {p1, p3, p4, v0, p2}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 211
    return-void
.end method

.method private drawDiamond(Landroid/graphics/Canvas;Landroid/graphics/Paint;[FFF)V
    .registers 9
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "paint"    # Landroid/graphics/Paint;
    .param p3, "path"    # [F
    .param p4, "x"    # F
    .param p5, "y"    # F

    .prologue
    const/4 v2, 0x1

    .line 254
    const/4 v0, 0x0

    aput p4, p3, v0

    .line 255
    iget v0, p0, Lorg/achartengine/chart/ScatterChart;->size:F

    sub-float v0, p5, v0

    aput v0, p3, v2

    .line 256
    const/4 v0, 0x2

    iget v1, p0, Lorg/achartengine/chart/ScatterChart;->size:F

    sub-float v1, p4, v1

    aput v1, p3, v0

    .line 257
    const/4 v0, 0x3

    aput p5, p3, v0

    .line 258
    const/4 v0, 0x4

    aput p4, p3, v0

    .line 259
    const/4 v0, 0x5

    iget v1, p0, Lorg/achartengine/chart/ScatterChart;->size:F

    add-float/2addr v1, p5

    aput v1, p3, v0

    .line 260
    const/4 v0, 0x6

    iget v1, p0, Lorg/achartengine/chart/ScatterChart;->size:F

    add-float/2addr v1, p4

    aput v1, p3, v0

    .line 261
    const/4 v0, 0x7

    aput p5, p3, v0

    .line 262
    invoke-virtual {p0, p1, p3, p2, v2}, Lorg/achartengine/chart/ScatterChart;->drawPath(Landroid/graphics/Canvas;[FLandroid/graphics/Paint;Z)V

    .line 263
    return-void
.end method

.method private drawSquare(Landroid/graphics/Canvas;Landroid/graphics/Paint;FF)V
    .registers 11
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "paint"    # Landroid/graphics/Paint;
    .param p3, "x"    # F
    .param p4, "y"    # F

    .prologue
    .line 241
    iget v0, p0, Lorg/achartengine/chart/ScatterChart;->size:F

    sub-float v1, p3, v0

    iget v0, p0, Lorg/achartengine/chart/ScatterChart;->size:F

    sub-float v2, p4, v0

    iget v0, p0, Lorg/achartengine/chart/ScatterChart;->size:F

    add-float v3, p3, v0

    iget v0, p0, Lorg/achartengine/chart/ScatterChart;->size:F

    add-float v4, p4, v0

    move-object v0, p1

    move-object v5, p2

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 242
    return-void
.end method

.method private drawTriangle(Landroid/graphics/Canvas;Landroid/graphics/Paint;[FFF)V
    .registers 11
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "paint"    # Landroid/graphics/Paint;
    .param p3, "path"    # [F
    .param p4, "x"    # F
    .param p5, "y"    # F

    .prologue
    const/4 v4, 0x3

    const/4 v3, 0x1

    .line 223
    const/4 v0, 0x0

    aput p4, p3, v0

    .line 224
    iget v0, p0, Lorg/achartengine/chart/ScatterChart;->size:F

    sub-float v0, p5, v0

    iget v1, p0, Lorg/achartengine/chart/ScatterChart;->size:F

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    sub-float/2addr v0, v1

    aput v0, p3, v3

    .line 225
    const/4 v0, 0x2

    iget v1, p0, Lorg/achartengine/chart/ScatterChart;->size:F

    sub-float v1, p4, v1

    aput v1, p3, v0

    .line 226
    iget v0, p0, Lorg/achartengine/chart/ScatterChart;->size:F

    add-float/2addr v0, p5

    aput v0, p3, v4

    .line 227
    const/4 v0, 0x4

    iget v1, p0, Lorg/achartengine/chart/ScatterChart;->size:F

    add-float/2addr v1, p4

    aput v1, p3, v0

    .line 228
    const/4 v0, 0x5

    aget v1, p3, v4

    aput v1, p3, v0

    .line 229
    invoke-virtual {p0, p1, p3, p2, v3}, Lorg/achartengine/chart/ScatterChart;->drawPath(Landroid/graphics/Canvas;[FLandroid/graphics/Paint;Z)V

    .line 230
    return-void
.end method

.method private drawX(Landroid/graphics/Canvas;Landroid/graphics/Paint;FF)V
    .registers 11
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "paint"    # Landroid/graphics/Paint;
    .param p3, "x"    # F
    .param p4, "y"    # F

    .prologue
    .line 197
    iget v0, p0, Lorg/achartengine/chart/ScatterChart;->size:F

    sub-float v1, p3, v0

    iget v0, p0, Lorg/achartengine/chart/ScatterChart;->size:F

    sub-float v2, p4, v0

    iget v0, p0, Lorg/achartengine/chart/ScatterChart;->size:F

    add-float v3, p3, v0

    iget v0, p0, Lorg/achartengine/chart/ScatterChart;->size:F

    add-float v4, p4, v0

    move-object v0, p1

    move-object v5, p2

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 198
    iget v0, p0, Lorg/achartengine/chart/ScatterChart;->size:F

    add-float v1, p3, v0

    iget v0, p0, Lorg/achartengine/chart/ScatterChart;->size:F

    sub-float v2, p4, v0

    iget v0, p0, Lorg/achartengine/chart/ScatterChart;->size:F

    sub-float v3, p3, v0

    iget v0, p0, Lorg/achartengine/chart/ScatterChart;->size:F

    add-float v4, p4, v0

    move-object v0, p1

    move-object v5, p2

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 199
    return-void
.end method


# virtual methods
.method protected clickableAreasForPoints(Ljava/util/List;Ljava/util/List;FII)[Lorg/achartengine/chart/ClickableArea;
    .registers 18
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
    .line 128
    .local p1, "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    .local p2, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v7

    .line 129
    .local v7, "length":I
    div-int/lit8 v0, v7, 0x2

    new-array v8, v0, [Lorg/achartengine/chart/ClickableArea;

    .line 130
    .local v8, "ret":[Lorg/achartengine/chart/ClickableArea;
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_9
    if-ge v6, v7, :cond_6e

    .line 131
    iget-object v0, p0, Lorg/achartengine/chart/ScatterChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getSelectableBuffer()I

    move-result v9

    .line 132
    .local v9, "selectableBuffer":I
    div-int/lit8 v10, v6, 0x2

    new-instance v0, Lorg/achartengine/chart/ClickableArea;

    new-instance v1, Landroid/graphics/RectF;

    invoke-interface {p1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    int-to-float v3, v9

    sub-float v3, v2, v3

    add-int/lit8 v2, v6, 0x1

    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    int-to-float v4, v9

    sub-float v4, v2, v4

    invoke-interface {p1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    int-to-float v5, v9

    add-float/2addr v5, v2

    add-int/lit8 v2, v6, 0x1

    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    int-to-float v11, v9

    add-float/2addr v2, v11

    invoke-direct {v1, v3, v4, v5, v2}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-interface {p2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Double;

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    add-int/lit8 v4, v6, 0x1

    invoke-interface {p2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Double;

    invoke-virtual {v4}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v4

    invoke-direct/range {v0 .. v5}, Lorg/achartengine/chart/ClickableArea;-><init>(Landroid/graphics/RectF;DD)V

    aput-object v0, v8, v10

    .line 130
    add-int/lit8 v6, v6, 0x2

    goto :goto_9

    .line 136
    .end local v9    # "selectableBuffer":I
    :cond_6e
    return-object v8
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
    const/high16 v2, 0x41200000    # 10.0f

    .line 161
    move-object v0, p2

    check-cast v0, Lorg/achartengine/renderer/XYSeriesRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/XYSeriesRenderer;->isFillPoints()Z

    move-result v0

    if-eqz v0, :cond_22

    .line 162
    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p6, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 166
    :goto_10
    sget-object v0, Lorg/achartengine/chart/ScatterChart$1;->$SwitchMap$org$achartengine$chart$PointStyle:[I

    check-cast p2, Lorg/achartengine/renderer/XYSeriesRenderer;

    .end local p2    # "renderer":Lorg/achartengine/renderer/SimpleSeriesRenderer;
    invoke-virtual {p2}, Lorg/achartengine/renderer/XYSeriesRenderer;->getPointStyle()Lorg/achartengine/chart/PointStyle;

    move-result-object v1

    invoke-virtual {v1}, Lorg/achartengine/chart/PointStyle;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_5c

    .line 186
    :goto_21
    return-void

    .line 164
    .restart local p2    # "renderer":Lorg/achartengine/renderer/SimpleSeriesRenderer;
    :cond_22
    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {p6, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    goto :goto_10

    .line 168
    .end local p2    # "renderer":Lorg/achartengine/renderer/SimpleSeriesRenderer;
    :pswitch_28
    add-float v0, p3, v2

    invoke-direct {p0, p1, p6, v0, p4}, Lorg/achartengine/chart/ScatterChart;->drawX(Landroid/graphics/Canvas;Landroid/graphics/Paint;FF)V

    goto :goto_21

    .line 171
    :pswitch_2e
    add-float v0, p3, v2

    invoke-direct {p0, p1, p6, v0, p4}, Lorg/achartengine/chart/ScatterChart;->drawCircle(Landroid/graphics/Canvas;Landroid/graphics/Paint;FF)V

    goto :goto_21

    .line 174
    :pswitch_34
    const/4 v0, 0x6

    new-array v3, v0, [F

    add-float v4, p3, v2

    move-object v0, p0

    move-object v1, p1

    move-object v2, p6

    move v5, p4

    invoke-direct/range {v0 .. v5}, Lorg/achartengine/chart/ScatterChart;->drawTriangle(Landroid/graphics/Canvas;Landroid/graphics/Paint;[FFF)V

    goto :goto_21

    .line 177
    :pswitch_41
    add-float v0, p3, v2

    invoke-direct {p0, p1, p6, v0, p4}, Lorg/achartengine/chart/ScatterChart;->drawSquare(Landroid/graphics/Canvas;Landroid/graphics/Paint;FF)V

    goto :goto_21

    .line 180
    :pswitch_47
    const/16 v0, 0x8

    new-array v3, v0, [F

    add-float v4, p3, v2

    move-object v0, p0

    move-object v1, p1

    move-object v2, p6

    move v5, p4

    invoke-direct/range {v0 .. v5}, Lorg/achartengine/chart/ScatterChart;->drawDiamond(Landroid/graphics/Canvas;Landroid/graphics/Paint;[FFF)V

    goto :goto_21

    .line 183
    :pswitch_55
    add-float v0, p3, v2

    invoke-virtual {p1, v0, p4, p6}, Landroid/graphics/Canvas;->drawPoint(FFLandroid/graphics/Paint;)V

    goto :goto_21

    .line 166
    nop

    :pswitch_data_5c
    .packed-switch 0x1
        :pswitch_28
        :pswitch_2e
        :pswitch_34
        :pswitch_41
        :pswitch_47
        :pswitch_55
    .end packed-switch
.end method

.method public drawSeries(Landroid/graphics/Canvas;Landroid/graphics/Paint;Ljava/util/List;Lorg/achartengine/renderer/XYSeriesRenderer;FII)V
    .registers 17
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
    .line 78
    .local p3, "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    invoke-virtual {p4}, Lorg/achartengine/renderer/XYSeriesRenderer;->getColor()I

    move-result v0

    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 79
    invoke-virtual {p2}, Landroid/graphics/Paint;->getStrokeWidth()F

    move-result v8

    .line 80
    .local v8, "stroke":F
    invoke-virtual {p4}, Lorg/achartengine/renderer/XYSeriesRenderer;->isFillPoints()Z

    move-result v0

    if-eqz v0, :cond_2d

    .line 81
    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 86
    :goto_16
    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v7

    .line 87
    .local v7, "length":I
    sget-object v0, Lorg/achartengine/chart/ScatterChart$1;->$SwitchMap$org$achartengine$chart$PointStyle:[I

    invoke-virtual {p4}, Lorg/achartengine/renderer/XYSeriesRenderer;->getPointStyle()Lorg/achartengine/chart/PointStyle;

    move-result-object v1

    invoke-virtual {v1}, Lorg/achartengine/chart/PointStyle;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_108

    .line 122
    :cond_29
    invoke-virtual {p2, v8}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 123
    return-void

    .line 83
    .end local v7    # "length":I
    :cond_2d
    invoke-virtual {p4}, Lorg/achartengine/renderer/XYSeriesRenderer;->getPointStrokeWidth()F

    move-result v0

    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 84
    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    goto :goto_16

    .line 89
    .restart local v7    # "length":I
    :pswitch_3a
    invoke-virtual {p4}, Lorg/achartengine/renderer/XYSeriesRenderer;->getPointStrokeWidth()F

    move-result v0

    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 90
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_42
    if-ge v6, v7, :cond_29

    .line 91
    invoke-interface {p3, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v1

    add-int/lit8 v0, v6, 0x1

    invoke-interface {p3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    invoke-direct {p0, p1, p2, v1, v0}, Lorg/achartengine/chart/ScatterChart;->drawX(Landroid/graphics/Canvas;Landroid/graphics/Paint;FF)V

    .line 90
    add-int/lit8 v6, v6, 0x2

    goto :goto_42

    .line 95
    .end local v6    # "i":I
    :pswitch_60
    const/4 v6, 0x0

    .restart local v6    # "i":I
    :goto_61
    if-ge v6, v7, :cond_29

    .line 96
    invoke-interface {p3, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v1

    add-int/lit8 v0, v6, 0x1

    invoke-interface {p3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    invoke-direct {p0, p1, p2, v1, v0}, Lorg/achartengine/chart/ScatterChart;->drawCircle(Landroid/graphics/Canvas;Landroid/graphics/Paint;FF)V

    .line 95
    add-int/lit8 v6, v6, 0x2

    goto :goto_61

    .line 100
    .end local v6    # "i":I
    :pswitch_7f
    const/4 v0, 0x6

    new-array v3, v0, [F

    .line 101
    .local v3, "path":[F
    const/4 v6, 0x0

    .restart local v6    # "i":I
    :goto_83
    if-ge v6, v7, :cond_29

    .line 102
    invoke-interface {p3, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v4

    add-int/lit8 v0, v6, 0x1

    invoke-interface {p3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v5

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-direct/range {v0 .. v5}, Lorg/achartengine/chart/ScatterChart;->drawTriangle(Landroid/graphics/Canvas;Landroid/graphics/Paint;[FFF)V

    .line 101
    add-int/lit8 v6, v6, 0x2

    goto :goto_83

    .line 106
    .end local v3    # "path":[F
    .end local v6    # "i":I
    :pswitch_a4
    const/4 v6, 0x0

    .restart local v6    # "i":I
    :goto_a5
    if-ge v6, v7, :cond_29

    .line 107
    invoke-interface {p3, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v1

    add-int/lit8 v0, v6, 0x1

    invoke-interface {p3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    invoke-direct {p0, p1, p2, v1, v0}, Lorg/achartengine/chart/ScatterChart;->drawSquare(Landroid/graphics/Canvas;Landroid/graphics/Paint;FF)V

    .line 106
    add-int/lit8 v6, v6, 0x2

    goto :goto_a5

    .line 111
    .end local v6    # "i":I
    :pswitch_c3
    const/16 v0, 0x8

    new-array v3, v0, [F

    .line 112
    .restart local v3    # "path":[F
    const/4 v6, 0x0

    .restart local v6    # "i":I
    :goto_c8
    if-ge v6, v7, :cond_29

    .line 113
    invoke-interface {p3, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v4

    add-int/lit8 v0, v6, 0x1

    invoke-interface {p3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v5

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-direct/range {v0 .. v5}, Lorg/achartengine/chart/ScatterChart;->drawDiamond(Landroid/graphics/Canvas;Landroid/graphics/Paint;[FFF)V

    .line 112
    add-int/lit8 v6, v6, 0x2

    goto :goto_c8

    .line 117
    .end local v3    # "path":[F
    .end local v6    # "i":I
    :pswitch_e9
    const/4 v6, 0x0

    .restart local v6    # "i":I
    :goto_ea
    if-ge v6, v7, :cond_29

    .line 118
    invoke-interface {p3, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v1

    add-int/lit8 v0, v6, 0x1

    invoke-interface {p3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    invoke-virtual {p1, v1, v0, p2}, Landroid/graphics/Canvas;->drawPoint(FFLandroid/graphics/Paint;)V

    .line 117
    add-int/lit8 v6, v6, 0x2

    goto :goto_ea

    .line 87
    :pswitch_data_108
    .packed-switch 0x1
        :pswitch_3a
        :pswitch_60
        :pswitch_7f
        :pswitch_a4
        :pswitch_c3
        :pswitch_e9
    .end packed-switch
.end method

.method public getChartType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 271
    const-string v0, "Scatter"

    return-object v0
.end method

.method public getLegendShapeWidth(I)I
    .registers 3
    .param p1, "seriesIndex"    # I

    .prologue
    .line 146
    const/16 v0, 0xa

    return v0
.end method

.method protected setDatasetRenderer(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V
    .registers 4
    .param p1, "dataset"    # Lorg/achartengine/model/XYMultipleSeriesDataset;
    .param p2, "renderer"    # Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    .prologue
    .line 60
    invoke-super {p0, p1, p2}, Lorg/achartengine/chart/XYChart;->setDatasetRenderer(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V

    .line 61
    invoke-virtual {p2}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getPointSize()F

    move-result v0

    iput v0, p0, Lorg/achartengine/chart/ScatterChart;->size:F

    .line 62
    return-void
.end method
