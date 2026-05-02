.class public Lorg/achartengine/chart/LineChart;
.super Lorg/achartengine/chart/XYChart;
.source "LineChart.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/achartengine/chart/LineChart$1;
    }
.end annotation


# static fields
.field private static final SHAPE_WIDTH:I = 0x1e

.field public static final TYPE:Ljava/lang/String; = "Line"


# instance fields
.field private pointsChart:Lorg/achartengine/chart/ScatterChart;


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 43
    invoke-direct {p0}, Lorg/achartengine/chart/XYChart;-><init>()V

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

    .line 54
    new-instance v0, Lorg/achartengine/chart/ScatterChart;

    invoke-direct {v0, p1, p2}, Lorg/achartengine/chart/ScatterChart;-><init>(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V

    iput-object v0, p0, Lorg/achartengine/chart/LineChart;->pointsChart:Lorg/achartengine/chart/ScatterChart;

    .line 55
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
    .line 196
    .local p1, "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    .local p2, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v7

    .line 197
    .local v7, "length":I
    div-int/lit8 v0, v7, 0x2

    new-array v8, v0, [Lorg/achartengine/chart/ClickableArea;

    .line 198
    .local v8, "ret":[Lorg/achartengine/chart/ClickableArea;
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_9
    if-ge v6, v7, :cond_6e

    .line 199
    iget-object v0, p0, Lorg/achartengine/chart/LineChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getSelectableBuffer()I

    move-result v9

    .line 200
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

    .line 198
    add-int/lit8 v6, v6, 0x2

    goto :goto_9

    .line 204
    .end local v9    # "selectableBuffer":I
    :cond_6e
    return-object v8
.end method

.method public drawLegendShape(Landroid/graphics/Canvas;Lorg/achartengine/renderer/SimpleSeriesRenderer;FFILandroid/graphics/Paint;)V
    .registers 15
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "renderer"    # Lorg/achartengine/renderer/SimpleSeriesRenderer;
    .param p3, "x"    # F
    .param p4, "y"    # F
    .param p5, "seriesIndex"    # I
    .param p6, "paint"    # Landroid/graphics/Paint;

    .prologue
    .line 229
    invoke-virtual {p6}, Landroid/graphics/Paint;->getStrokeWidth()F

    move-result v7

    .local v7, "oldWidth":F
    move-object v0, p2

    .line 230
    check-cast v0, Lorg/achartengine/renderer/XYSeriesRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/XYSeriesRenderer;->getLineWidth()F

    move-result v0

    invoke-virtual {p6, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 231
    const/high16 v0, 0x41f00000    # 30.0f

    add-float v3, p3, v0

    move-object v0, p1

    move v1, p3

    move v2, p4

    move v4, p4

    move-object v5, p6

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 232
    invoke-virtual {p6, v7}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 233
    invoke-virtual {p0, p2}, Lorg/achartengine/chart/LineChart;->isRenderPoints(Lorg/achartengine/renderer/SimpleSeriesRenderer;)Z

    move-result v0

    if-eqz v0, :cond_31

    .line 234
    iget-object v0, p0, Lorg/achartengine/chart/LineChart;->pointsChart:Lorg/achartengine/chart/ScatterChart;

    const/high16 v1, 0x40a00000    # 5.0f

    add-float v3, p3, v1

    move-object v1, p1

    move-object v2, p2

    move v4, p4

    move v5, p5

    move-object v6, p6

    invoke-virtual/range {v0 .. v6}, Lorg/achartengine/chart/ScatterChart;->drawLegendShape(Landroid/graphics/Canvas;Lorg/achartengine/renderer/SimpleSeriesRenderer;FFILandroid/graphics/Paint;)V

    .line 236
    :cond_31
    return-void
.end method

.method public drawSeries(Landroid/graphics/Canvas;Landroid/graphics/Paint;Ljava/util/List;Lorg/achartengine/renderer/XYSeriesRenderer;FII)V
    .registers 33
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
    .line 83
    .local p3, "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    invoke-virtual/range {p2 .. p2}, Landroid/graphics/Paint;->getStrokeWidth()F

    move-result v15

    .line 84
    .local v15, "lineWidth":F
    invoke-virtual/range {p4 .. p4}, Lorg/achartengine/renderer/XYSeriesRenderer;->getLineWidth()F

    move-result v22

    move-object/from16 v0, p2

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 85
    invoke-virtual/range {p4 .. p4}, Lorg/achartengine/renderer/XYSeriesRenderer;->getFillOutsideLine()[Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;

    move-result-object v9

    .line 87
    .local v9, "fillOutsideLine":[Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;
    move-object v6, v9

    .local v6, "arr$":[Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;
    array-length v13, v6

    .local v13, "len$":I
    const/4 v12, 0x0

    .local v12, "i$":I
    :goto_16
    if-ge v12, v13, :cond_2a3

    aget-object v8, v6, v12

    .line 88
    .local v8, "fill":Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;
    invoke-virtual {v8}, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;->getType()Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;

    move-result-object v22

    sget-object v23, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;->NONE:Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    if-eq v0, v1, :cond_29f

    .line 89
    invoke-virtual {v8}, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;->getColor()I

    move-result v22

    move-object/from16 v0, p2

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 91
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 92
    .local v10, "fillPoints":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    invoke-virtual {v8}, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;->getFillRange()[I

    move-result-object v18

    .line 93
    .local v18, "range":[I
    if-nez v18, :cond_58

    .line 94
    move-object/from16 v0, p3

    invoke-interface {v10, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 102
    :cond_41
    :goto_41
    sget-object v22, Lorg/achartengine/chart/LineChart$1;->$SwitchMap$org$achartengine$renderer$XYSeriesRenderer$FillOutsideLine$Type:[I

    invoke-virtual {v8}, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;->getType()Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;->ordinal()I

    move-result v23

    aget v22, v22, v23

    packed-switch v22, :pswitch_data_2cc

    .line 119
    new-instance v22, Ljava/lang/RuntimeException;

    const-string v23, "You have added a new type of filling but have not implemented."

    invoke-direct/range {v22 .. v23}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v22

    .line 96
    :cond_58
    invoke-interface/range {p3 .. p3}, Ljava/util/List;->size()I

    move-result v22

    const/16 v23, 0x0

    aget v23, v18, v23

    mul-int/lit8 v23, v23, 0x2

    move/from16 v0, v22

    move/from16 v1, v23

    if-le v0, v1, :cond_41

    invoke-interface/range {p3 .. p3}, Ljava/util/List;->size()I

    move-result v22

    const/16 v23, 0x1

    aget v23, v18, v23

    mul-int/lit8 v23, v23, 0x2

    move/from16 v0, v22

    move/from16 v1, v23

    if-le v0, v1, :cond_41

    .line 97
    const/16 v22, 0x0

    aget v22, v18, v22

    mul-int/lit8 v22, v22, 0x2

    const/16 v23, 0x1

    aget v23, v18, v23

    mul-int/lit8 v23, v23, 0x2

    move-object/from16 v0, p3

    move/from16 v1, v22

    move/from16 v2, v23

    invoke-interface {v0, v1, v2}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-interface {v10, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_41

    .line 104
    :pswitch_94
    move/from16 v19, p5

    .line 122
    .local v19, "referencePoint":F
    :goto_96
    invoke-virtual {v8}, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;->getType()Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;

    move-result-object v22

    sget-object v23, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;->BOUNDS_ABOVE:Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    if-eq v0, v1, :cond_ae

    invoke-virtual {v8}, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;->getType()Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;

    move-result-object v22

    sget-object v23, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;->BOUNDS_BELOW:Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    if-ne v0, v1, :cond_207

    .line 124
    :cond_ae
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 125
    .local v7, "boundsPoints":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    const/4 v5, 0x0

    .line 126
    .local v5, "add":Z
    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v14

    .line 127
    .local v14, "length":I
    if-lez v14, :cond_d8

    invoke-virtual {v8}, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;->getType()Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;

    move-result-object v22

    sget-object v23, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;->BOUNDS_ABOVE:Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    if-ne v0, v1, :cond_d8

    const/16 v22, 0x1

    move/from16 v0, v22

    invoke-interface {v10, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Ljava/lang/Float;

    invoke-virtual/range {v22 .. v22}, Ljava/lang/Float;->floatValue()F

    move-result v22

    cmpg-float v22, v22, v19

    if-ltz v22, :cond_f6

    :cond_d8
    invoke-virtual {v8}, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;->getType()Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;

    move-result-object v22

    sget-object v23, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;->BOUNDS_BELOW:Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    if-ne v0, v1, :cond_111

    const/16 v22, 0x1

    move/from16 v0, v22

    invoke-interface {v10, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Ljava/lang/Float;

    invoke-virtual/range {v22 .. v22}, Ljava/lang/Float;->floatValue()F

    move-result v22

    cmpl-float v22, v22, v19

    if-lez v22, :cond_111

    .line 131
    :cond_f6
    const/16 v22, 0x0

    move/from16 v0, v22

    invoke-interface {v10, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 132
    const/16 v22, 0x1

    move/from16 v0, v22

    invoke-interface {v10, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 133
    const/4 v5, 0x1

    .line 136
    :cond_111
    const/4 v11, 0x3

    .local v11, "i":I
    :goto_112
    if-ge v11, v14, :cond_201

    .line 137
    add-int/lit8 v22, v11, -0x2

    move/from16 v0, v22

    invoke-interface {v10, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Ljava/lang/Float;

    invoke-virtual/range {v22 .. v22}, Ljava/lang/Float;->floatValue()F

    move-result v16

    .line 138
    .local v16, "prevValue":F
    invoke-interface {v10, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Ljava/lang/Float;

    invoke-virtual/range {v22 .. v22}, Ljava/lang/Float;->floatValue()F

    move-result v20

    .line 140
    .local v20, "value":F
    cmpg-float v22, v16, v19

    if-gez v22, :cond_134

    cmpl-float v22, v20, v19

    if-gtz v22, :cond_13c

    :cond_134
    cmpl-float v22, v16, v19

    if-lez v22, :cond_1c8

    cmpg-float v22, v20, v19

    if-gez v22, :cond_1c8

    .line 142
    :cond_13c
    add-int/lit8 v22, v11, -0x3

    move/from16 v0, v22

    invoke-interface {v10, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Ljava/lang/Float;

    invoke-virtual/range {v22 .. v22}, Ljava/lang/Float;->floatValue()F

    move-result v17

    .line 143
    .local v17, "prevX":F
    add-int/lit8 v22, v11, -0x1

    move/from16 v0, v22

    invoke-interface {v10, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Ljava/lang/Float;

    invoke-virtual/range {v22 .. v22}, Ljava/lang/Float;->floatValue()F

    move-result v21

    .line 144
    .local v21, "x":F
    sub-float v22, v21, v17

    sub-float v23, v19, v16

    mul-float v22, v22, v23

    sub-float v23, v20, v16

    div-float v22, v22, v23

    add-float v22, v22, v17

    invoke-static/range {v22 .. v22}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 146
    invoke-static/range {v19 .. v19}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 147
    invoke-virtual {v8}, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;->getType()Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;

    move-result-object v22

    sget-object v23, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;->BOUNDS_ABOVE:Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    if-ne v0, v1, :cond_186

    cmpl-float v22, v20, v19

    if-gtz v22, :cond_196

    :cond_186
    invoke-virtual {v8}, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;->getType()Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;

    move-result-object v22

    sget-object v23, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;->BOUNDS_BELOW:Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    if-ne v0, v1, :cond_1b4

    cmpg-float v22, v20, v19

    if-gez v22, :cond_1b4

    .line 149
    :cond_196
    add-int/lit8 v11, v11, 0x2

    .line 150
    const/4 v5, 0x0

    .line 136
    .end local v17    # "prevX":F
    .end local v21    # "x":F
    :cond_199
    :goto_199
    add-int/lit8 v11, v11, 0x2

    goto/16 :goto_112

    .line 107
    .end local v5    # "add":Z
    .end local v7    # "boundsPoints":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    .end local v11    # "i":I
    .end local v14    # "length":I
    .end local v16    # "prevValue":F
    .end local v19    # "referencePoint":F
    .end local v20    # "value":F
    :pswitch_19d
    move/from16 v19, p5

    .line 108
    .restart local v19    # "referencePoint":F
    goto/16 :goto_96

    .line 110
    .end local v19    # "referencePoint":F
    :pswitch_1a1
    move/from16 v19, p5

    .line 111
    .restart local v19    # "referencePoint":F
    goto/16 :goto_96

    .line 113
    .end local v19    # "referencePoint":F
    :pswitch_1a5
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v22

    move/from16 v0, v22

    int-to-float v0, v0

    move/from16 v19, v0

    .line 114
    .restart local v19    # "referencePoint":F
    goto/16 :goto_96

    .line 116
    .end local v19    # "referencePoint":F
    :pswitch_1b0
    const/16 v19, 0x0

    .line 117
    .restart local v19    # "referencePoint":F
    goto/16 :goto_96

    .line 152
    .restart local v5    # "add":Z
    .restart local v7    # "boundsPoints":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    .restart local v11    # "i":I
    .restart local v14    # "length":I
    .restart local v16    # "prevValue":F
    .restart local v17    # "prevX":F
    .restart local v20    # "value":F
    .restart local v21    # "x":F
    :cond_1b4
    invoke-static/range {v21 .. v21}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 153
    invoke-static/range {v20 .. v20}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 154
    const/4 v5, 0x1

    goto :goto_199

    .line 157
    .end local v17    # "prevX":F
    .end local v21    # "x":F
    :cond_1c8
    if-nez v5, :cond_1ea

    invoke-virtual {v8}, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;->getType()Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;

    move-result-object v22

    sget-object v23, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;->BOUNDS_ABOVE:Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    if-ne v0, v1, :cond_1da

    cmpg-float v22, v20, v19

    if-ltz v22, :cond_1ea

    :cond_1da
    invoke-virtual {v8}, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;->getType()Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;

    move-result-object v22

    sget-object v23, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;->BOUNDS_BELOW:Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    if-ne v0, v1, :cond_199

    cmpl-float v22, v20, v19

    if-lez v22, :cond_199

    .line 160
    :cond_1ea
    add-int/lit8 v22, v11, -0x1

    move/from16 v0, v22

    invoke-interface {v10, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 161
    invoke-static/range {v20 .. v20}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_199

    .line 166
    .end local v16    # "prevValue":F
    .end local v20    # "value":F
    :cond_201
    invoke-interface {v10}, Ljava/util/List;->clear()V

    .line 167
    invoke-interface {v10, v7}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 169
    .end local v5    # "add":Z
    .end local v7    # "boundsPoints":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    .end local v11    # "i":I
    .end local v14    # "length":I
    :cond_207
    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v14

    .line 170
    .restart local v14    # "length":I
    if-lez v14, :cond_29f

    .line 171
    const/16 v23, 0x0

    const/16 v22, 0x0

    move/from16 v0, v22

    invoke-interface {v10, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Ljava/lang/Float;

    invoke-virtual/range {v22 .. v22}, Ljava/lang/Float;->floatValue()F

    move-result v22

    const/high16 v24, 0x3f800000    # 1.0f

    add-float v22, v22, v24

    invoke-static/range {v22 .. v22}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v22

    move/from16 v0, v23

    move-object/from16 v1, v22

    invoke-interface {v10, v0, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 172
    add-int/lit8 v22, v14, -0x2

    move/from16 v0, v22

    invoke-interface {v10, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-interface {v10, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 173
    invoke-static/range {v19 .. v19}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-interface {v10, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 174
    const/16 v22, 0x0

    move/from16 v0, v22

    invoke-interface {v10, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-interface {v10, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 175
    add-int/lit8 v22, v14, 0x1

    move/from16 v0, v22

    invoke-interface {v10, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-interface {v10, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 176
    const/4 v11, 0x0

    .restart local v11    # "i":I
    :goto_25d
    add-int/lit8 v22, v14, 0x4

    move/from16 v0, v22

    if-ge v11, v0, :cond_289

    .line 177
    add-int/lit8 v22, v11, 0x1

    move/from16 v0, v22

    invoke-interface {v10, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Ljava/lang/Float;

    invoke-virtual/range {v22 .. v22}, Ljava/lang/Float;->floatValue()F

    move-result v22

    const/16 v23, 0x0

    cmpg-float v22, v22, v23

    if-gez v22, :cond_286

    .line 178
    add-int/lit8 v22, v11, 0x1

    const/16 v23, 0x0

    invoke-static/range {v23 .. v23}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v23

    move/from16 v0, v22

    move-object/from16 v1, v23

    invoke-interface {v10, v0, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 176
    :cond_286
    add-int/lit8 v11, v11, 0x2

    goto :goto_25d

    .line 182
    :cond_289
    sget-object v22, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    move-object/from16 v0, p2

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 183
    const/16 v22, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move/from16 v3, v22

    invoke-virtual {v0, v1, v10, v2, v3}, Lorg/achartengine/chart/LineChart;->drawPath(Landroid/graphics/Canvas;Ljava/util/List;Landroid/graphics/Paint;Z)V

    .line 87
    .end local v10    # "fillPoints":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    .end local v11    # "i":I
    .end local v14    # "length":I
    .end local v18    # "range":[I
    .end local v19    # "referencePoint":F
    :cond_29f
    add-int/lit8 v12, v12, 0x1

    goto/16 :goto_16

    .line 187
    .end local v8    # "fill":Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;
    :cond_2a3
    invoke-virtual/range {p4 .. p4}, Lorg/achartengine/renderer/XYSeriesRenderer;->getColor()I

    move-result v22

    move-object/from16 v0, p2

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 188
    sget-object v22, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    move-object/from16 v0, p2

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 189
    const/16 v22, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p3

    move-object/from16 v3, p2

    move/from16 v4, v22

    invoke-virtual {v0, v1, v2, v3, v4}, Lorg/achartengine/chart/LineChart;->drawPath(Landroid/graphics/Canvas;Ljava/util/List;Landroid/graphics/Paint;Z)V

    .line 190
    move-object/from16 v0, p2

    invoke-virtual {v0, v15}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 191
    return-void

    .line 102
    :pswitch_data_2cc
    .packed-switch 0x1
        :pswitch_94
        :pswitch_19d
        :pswitch_1a1
        :pswitch_1a5
        :pswitch_1b0
    .end packed-switch
.end method

.method public getChartType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 262
    const-string v0, "Line"

    return-object v0
.end method

.method public getLegendShapeWidth(I)I
    .registers 3
    .param p1, "seriesIndex"    # I

    .prologue
    .line 214
    const/16 v0, 0x1e

    return v0
.end method

.method public getPointsChart()Lorg/achartengine/chart/ScatterChart;
    .registers 2

    .prologue
    .line 253
    iget-object v0, p0, Lorg/achartengine/chart/LineChart;->pointsChart:Lorg/achartengine/chart/ScatterChart;

    return-object v0
.end method

.method public isRenderPoints(Lorg/achartengine/renderer/SimpleSeriesRenderer;)Z
    .registers 4
    .param p1, "renderer"    # Lorg/achartengine/renderer/SimpleSeriesRenderer;

    .prologue
    .line 244
    check-cast p1, Lorg/achartengine/renderer/XYSeriesRenderer;

    .end local p1    # "renderer":Lorg/achartengine/renderer/SimpleSeriesRenderer;
    invoke-virtual {p1}, Lorg/achartengine/renderer/XYSeriesRenderer;->getPointStyle()Lorg/achartengine/chart/PointStyle;

    move-result-object v0

    sget-object v1, Lorg/achartengine/chart/PointStyle;->POINT:Lorg/achartengine/chart/PointStyle;

    if-eq v0, v1, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method protected setDatasetRenderer(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V
    .registers 4
    .param p1, "dataset"    # Lorg/achartengine/model/XYMultipleSeriesDataset;
    .param p2, "renderer"    # Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    .prologue
    .line 65
    invoke-super {p0, p1, p2}, Lorg/achartengine/chart/XYChart;->setDatasetRenderer(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V

    .line 66
    new-instance v0, Lorg/achartengine/chart/ScatterChart;

    invoke-direct {v0, p1, p2}, Lorg/achartengine/chart/ScatterChart;-><init>(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V

    iput-object v0, p0, Lorg/achartengine/chart/LineChart;->pointsChart:Lorg/achartengine/chart/ScatterChart;

    .line 67
    return-void
.end method
