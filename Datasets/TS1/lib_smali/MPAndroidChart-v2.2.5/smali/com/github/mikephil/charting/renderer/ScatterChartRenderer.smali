.class public Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;
.super Lcom/github/mikephil/charting/renderer/LineScatterCandleRadarRenderer;
.source "ScatterChartRenderer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/github/mikephil/charting/renderer/ScatterChartRenderer$1;
    }
.end annotation


# instance fields
.field protected mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/ScatterDataProvider;

.field protected mScatterBuffers:[Lcom/github/mikephil/charting/buffer/ScatterBuffer;


# direct methods
.method public constructor <init>(Lcom/github/mikephil/charting/interfaces/dataprovider/ScatterDataProvider;Lcom/github/mikephil/charting/animation/ChartAnimator;Lcom/github/mikephil/charting/utils/ViewPortHandler;)V
    .registers 4
    .param p1, "chart"    # Lcom/github/mikephil/charting/interfaces/dataprovider/ScatterDataProvider;
    .param p2, "animator"    # Lcom/github/mikephil/charting/animation/ChartAnimator;
    .param p3, "viewPortHandler"    # Lcom/github/mikephil/charting/utils/ViewPortHandler;

    .prologue
    .line 31
    invoke-direct {p0, p2, p3}, Lcom/github/mikephil/charting/renderer/LineScatterCandleRadarRenderer;-><init>(Lcom/github/mikephil/charting/animation/ChartAnimator;Lcom/github/mikephil/charting/utils/ViewPortHandler;)V

    .line 32
    iput-object p1, p0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/ScatterDataProvider;

    .line 33
    return-void
.end method


# virtual methods
.method public drawData(Landroid/graphics/Canvas;)V
    .registers 6
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    .line 51
    iget-object v3, p0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/ScatterDataProvider;

    invoke-interface {v3}, Lcom/github/mikephil/charting/interfaces/dataprovider/ScatterDataProvider;->getScatterData()Lcom/github/mikephil/charting/data/ScatterData;

    move-result-object v1

    .line 53
    .local v1, "scatterData":Lcom/github/mikephil/charting/data/ScatterData;
    invoke-virtual {v1}, Lcom/github/mikephil/charting/data/ScatterData;->getDataSets()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_e
    :goto_e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_24

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;

    .line 55
    .local v2, "set":Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;
    invoke-interface {v2}, Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;->isVisible()Z

    move-result v3

    if-eqz v3, :cond_e

    .line 56
    invoke-virtual {p0, p1, v2}, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->drawDataSet(Landroid/graphics/Canvas;Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;)V

    goto :goto_e

    .line 58
    .end local v2    # "set":Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;
    :cond_24
    return-void
.end method

.method protected drawDataSet(Landroid/graphics/Canvas;Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;)V
    .registers 25
    .param p1, "c"    # Landroid/graphics/Canvas;
    .param p2, "dataSet"    # Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;

    .prologue
    .line 62
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/ScatterDataProvider;

    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;->getAxisDependency()Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/github/mikephil/charting/interfaces/dataprovider/ScatterDataProvider;->getTransformer(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/Transformer;

    move-result-object v20

    .line 64
    .local v20, "trans":Lcom/github/mikephil/charting/utils/Transformer;
    const/4 v2, 0x0

    const/high16 v3, 0x3f800000    # 1.0f

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseX()F

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(FF)F

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(FF)F

    move-result v10

    .line 65
    .local v10, "phaseX":F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseY()F

    move-result v11

    .line 67
    .local v11, "phaseY":F
    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;->getScatterShapeSize()F

    move-result v2

    invoke-static {v2}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v17

    .line 68
    .local v17, "shapeSize":F
    const/high16 v2, 0x40000000    # 2.0f

    div-float v13, v17, v2

    .line 69
    .local v13, "shapeHalf":F
    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;->getScatterShapeHoleRadius()F

    move-result v2

    invoke-static {v2}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v16

    .line 70
    .local v16, "shapeHoleSizeHalf":F
    const/high16 v2, 0x40000000    # 2.0f

    mul-float v15, v16, v2

    .line 71
    .local v15, "shapeHoleSize":F
    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;->getScatterShapeHoleColor()I

    move-result v14

    .line 72
    .local v14, "shapeHoleColor":I
    sub-float v2, v17, v15

    const/high16 v3, 0x40000000    # 2.0f

    div-float v18, v2, v3

    .line 73
    .local v18, "shapeStrokeSize":F
    const/high16 v2, 0x40000000    # 2.0f

    div-float v19, v18, v2

    .line 75
    .local v19, "shapeStrokeSizeHalf":F
    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;->getScatterShape()Lcom/github/mikephil/charting/charts/ScatterChart$ScatterShape;

    move-result-object v12

    .line 77
    .local v12, "shape":Lcom/github/mikephil/charting/charts/ScatterChart$ScatterShape;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mScatterBuffers:[Lcom/github/mikephil/charting/buffer/ScatterBuffer;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/ScatterDataProvider;

    invoke-interface {v3}, Lcom/github/mikephil/charting/interfaces/dataprovider/ScatterDataProvider;->getScatterData()Lcom/github/mikephil/charting/data/ScatterData;

    move-result-object v3

    move-object/from16 v0, p2

    invoke-virtual {v3, v0}, Lcom/github/mikephil/charting/data/ScatterData;->getIndexOfDataSet(Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;)I

    move-result v3

    aget-object v8, v2, v3

    .line 79
    .local v8, "buffer":Lcom/github/mikephil/charting/buffer/ScatterBuffer;
    invoke-virtual {v8, v10, v11}, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->setPhases(FF)V

    .line 80
    move-object/from16 v0, p2

    invoke-virtual {v8, v0}, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->feed(Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;)V

    .line 82
    iget-object v2, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    move-object/from16 v0, v20

    invoke-virtual {v0, v2}, Lcom/github/mikephil/charting/utils/Transformer;->pointValuesToPixel([F)V

    .line 84
    sget-object v2, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer$1;->$SwitchMap$com$github$mikephil$charting$charts$ScatterChart$ScatterShape:[I

    invoke-virtual {v12}, Lcom/github/mikephil/charting/charts/ScatterChart$ScatterShape;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_4d8

    .line 326
    :cond_7f
    return-void

    .line 87
    :pswitch_80
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_81
    invoke-virtual {v8}, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->size()I

    move-result v2

    if-ge v9, v2, :cond_7f

    .line 89
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    iget-object v3, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    aget v3, v3, v9

    invoke-virtual {v2, v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsRight(F)Z

    move-result v2

    if-eqz v2, :cond_7f

    .line 92
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    iget-object v3, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    aget v3, v3, v9

    invoke-virtual {v2, v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsLeft(F)Z

    move-result v2

    if-eqz v2, :cond_b3

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    iget-object v3, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    add-int/lit8 v4, v9, 0x1

    aget v3, v3, v4

    invoke-virtual {v2, v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsY(F)Z

    move-result v2

    if-nez v2, :cond_b6

    .line 87
    :cond_b3
    :goto_b3
    add-int/lit8 v9, v9, 0x2

    goto :goto_81

    .line 96
    :cond_b6
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    div-int/lit8 v3, v9, 0x2

    move-object/from16 v0, p2

    invoke-interface {v0, v3}, Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;->getColor(I)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 98
    float-to-double v2, v15

    const-wide/16 v4, 0x0

    cmpl-double v2, v2, v4

    if-lez v2, :cond_147

    .line 99
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 100
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    move/from16 v0, v18

    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 102
    iget-object v2, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    aget v2, v2, v9

    sub-float v2, v2, v16

    sub-float v3, v2, v19

    iget-object v2, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    add-int/lit8 v4, v9, 0x1

    aget v2, v2, v4

    sub-float v2, v2, v16

    sub-float v4, v2, v19

    iget-object v2, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    aget v2, v2, v9

    add-float v2, v2, v16

    add-float v5, v2, v19

    iget-object v2, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    add-int/lit8 v6, v9, 0x1

    aget v2, v2, v6

    add-float v2, v2, v16

    add-float v6, v2, v19

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 108
    const v2, 0x112233

    if-eq v14, v2, :cond_b3

    .line 109
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 111
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    invoke-virtual {v2, v14}, Landroid/graphics/Paint;->setColor(I)V

    .line 112
    iget-object v2, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    aget v2, v2, v9

    sub-float v3, v2, v16

    iget-object v2, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    add-int/lit8 v4, v9, 0x1

    aget v2, v2, v4

    sub-float v4, v2, v16

    iget-object v2, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    aget v2, v2, v9

    add-float v5, v2, v16

    iget-object v2, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    add-int/lit8 v6, v9, 0x1

    aget v2, v2, v6

    add-float v6, v2, v16

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_b3

    .line 120
    :cond_147
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 122
    iget-object v2, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    aget v2, v2, v9

    sub-float v3, v2, v13

    iget-object v2, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    add-int/lit8 v4, v9, 0x1

    aget v2, v2, v4

    sub-float v4, v2, v13

    iget-object v2, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    aget v2, v2, v9

    add-float v5, v2, v13

    iget-object v2, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    add-int/lit8 v6, v9, 0x1

    aget v2, v2, v6

    add-float v6, v2, v13

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_b3

    .line 134
    .end local v9    # "i":I
    :pswitch_177
    const/4 v9, 0x0

    .restart local v9    # "i":I
    :goto_178
    invoke-virtual {v8}, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->size()I

    move-result v2

    if-ge v9, v2, :cond_7f

    .line 136
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    iget-object v3, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    aget v3, v3, v9

    invoke-virtual {v2, v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsRight(F)Z

    move-result v2

    if-eqz v2, :cond_7f

    .line 139
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    iget-object v3, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    aget v3, v3, v9

    invoke-virtual {v2, v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsLeft(F)Z

    move-result v2

    if-eqz v2, :cond_1aa

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    iget-object v3, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    add-int/lit8 v4, v9, 0x1

    aget v3, v3, v4

    invoke-virtual {v2, v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsY(F)Z

    move-result v2

    if-nez v2, :cond_1ad

    .line 134
    :cond_1aa
    :goto_1aa
    add-int/lit8 v9, v9, 0x2

    goto :goto_178

    .line 143
    :cond_1ad
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    div-int/lit8 v3, v9, 0x2

    move-object/from16 v0, p2

    invoke-interface {v0, v3}, Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;->getColor(I)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 145
    float-to-double v2, v15

    const-wide/16 v4, 0x0

    cmpl-double v2, v2, v4

    if-lez v2, :cond_215

    .line 146
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 147
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    move/from16 v0, v18

    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 149
    iget-object v2, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    aget v2, v2, v9

    iget-object v3, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    add-int/lit8 v4, v9, 0x1

    aget v3, v3, v4

    add-float v4, v16, v19

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v4, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 155
    const v2, 0x112233

    if-eq v14, v2, :cond_1aa

    .line 156
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 158
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    invoke-virtual {v2, v14}, Landroid/graphics/Paint;->setColor(I)V

    .line 159
    iget-object v2, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    aget v2, v2, v9

    iget-object v3, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    add-int/lit8 v4, v9, 0x1

    aget v3, v3, v4

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    move/from16 v1, v16

    invoke-virtual {v0, v2, v3, v1, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto :goto_1aa

    .line 166
    :cond_215
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 168
    iget-object v2, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    aget v2, v2, v9

    iget-object v3, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    add-int/lit8 v4, v9, 0x1

    aget v3, v3, v4

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v13, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto/16 :goto_1aa

    .line 179
    .end local v9    # "i":I
    :pswitch_233
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 182
    new-instance v21, Landroid/graphics/Path;

    invoke-direct/range {v21 .. v21}, Landroid/graphics/Path;-><init>()V

    .line 184
    .local v21, "tri":Landroid/graphics/Path;
    const/4 v9, 0x0

    .restart local v9    # "i":I
    :goto_242
    invoke-virtual {v8}, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->size()I

    move-result v2

    if-ge v9, v2, :cond_7f

    .line 186
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    iget-object v3, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    aget v3, v3, v9

    invoke-virtual {v2, v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsRight(F)Z

    move-result v2

    if-eqz v2, :cond_7f

    .line 189
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    iget-object v3, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    aget v3, v3, v9

    invoke-virtual {v2, v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsLeft(F)Z

    move-result v2

    if-eqz v2, :cond_274

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    iget-object v3, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    add-int/lit8 v4, v9, 0x1

    aget v3, v3, v4

    invoke-virtual {v2, v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsY(F)Z

    move-result v2

    if-nez v2, :cond_277

    .line 184
    :cond_274
    :goto_274
    add-int/lit8 v9, v9, 0x2

    goto :goto_242

    .line 193
    :cond_277
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    div-int/lit8 v3, v9, 0x2

    move-object/from16 v0, p2

    invoke-interface {v0, v3}, Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;->getColor(I)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 195
    iget-object v2, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    aget v2, v2, v9

    iget-object v3, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    add-int/lit8 v4, v9, 0x1

    aget v3, v3, v4

    sub-float/2addr v3, v13

    move-object/from16 v0, v21

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Path;->moveTo(FF)V

    .line 196
    iget-object v2, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    aget v2, v2, v9

    add-float/2addr v2, v13

    iget-object v3, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    add-int/lit8 v4, v9, 0x1

    aget v3, v3, v4

    add-float/2addr v3, v13

    move-object/from16 v0, v21

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 197
    iget-object v2, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    aget v2, v2, v9

    sub-float/2addr v2, v13

    iget-object v3, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    add-int/lit8 v4, v9, 0x1

    aget v3, v3, v4

    add-float/2addr v3, v13

    move-object/from16 v0, v21

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 199
    float-to-double v2, v15

    const-wide/16 v4, 0x0

    cmpl-double v2, v2, v4

    if-lez v2, :cond_320

    .line 200
    iget-object v2, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    aget v2, v2, v9

    iget-object v3, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    add-int/lit8 v4, v9, 0x1

    aget v3, v3, v4

    sub-float/2addr v3, v13

    move-object/from16 v0, v21

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 202
    iget-object v2, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    aget v2, v2, v9

    sub-float/2addr v2, v13

    add-float v2, v2, v18

    iget-object v3, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    add-int/lit8 v4, v9, 0x1

    aget v3, v3, v4

    add-float/2addr v3, v13

    sub-float v3, v3, v18

    move-object/from16 v0, v21

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Path;->moveTo(FF)V

    .line 204
    iget-object v2, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    aget v2, v2, v9

    add-float/2addr v2, v13

    sub-float v2, v2, v18

    iget-object v3, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    add-int/lit8 v4, v9, 0x1

    aget v3, v3, v4

    add-float/2addr v3, v13

    sub-float v3, v3, v18

    move-object/from16 v0, v21

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 206
    iget-object v2, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    aget v2, v2, v9

    iget-object v3, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    add-int/lit8 v4, v9, 0x1

    aget v3, v3, v4

    sub-float/2addr v3, v13

    add-float v3, v3, v18

    move-object/from16 v0, v21

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 208
    iget-object v2, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    aget v2, v2, v9

    sub-float/2addr v2, v13

    add-float v2, v2, v18

    iget-object v3, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    add-int/lit8 v4, v9, 0x1

    aget v3, v3, v4

    add-float/2addr v3, v13

    sub-float v3, v3, v18

    move-object/from16 v0, v21

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 212
    :cond_320
    invoke-virtual/range {v21 .. v21}, Landroid/graphics/Path;->close()V

    .line 214
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    move-object/from16 v1, v21

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 215
    invoke-virtual/range {v21 .. v21}, Landroid/graphics/Path;->reset()V

    .line 217
    float-to-double v2, v15

    const-wide/16 v4, 0x0

    cmpl-double v2, v2, v4

    if-lez v2, :cond_274

    const v2, 0x112233

    if-eq v14, v2, :cond_274

    .line 220
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    invoke-virtual {v2, v14}, Landroid/graphics/Paint;->setColor(I)V

    .line 222
    iget-object v2, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    aget v2, v2, v9

    iget-object v3, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    add-int/lit8 v4, v9, 0x1

    aget v3, v3, v4

    sub-float/2addr v3, v13

    add-float v3, v3, v18

    move-object/from16 v0, v21

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Path;->moveTo(FF)V

    .line 224
    iget-object v2, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    aget v2, v2, v9

    add-float/2addr v2, v13

    sub-float v2, v2, v18

    iget-object v3, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    add-int/lit8 v4, v9, 0x1

    aget v3, v3, v4

    add-float/2addr v3, v13

    sub-float v3, v3, v18

    move-object/from16 v0, v21

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 226
    iget-object v2, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    aget v2, v2, v9

    sub-float/2addr v2, v13

    add-float v2, v2, v18

    iget-object v3, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    add-int/lit8 v4, v9, 0x1

    aget v3, v3, v4

    add-float/2addr v3, v13

    sub-float v3, v3, v18

    move-object/from16 v0, v21

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 228
    invoke-virtual/range {v21 .. v21}, Landroid/graphics/Path;->close()V

    .line 230
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    move-object/from16 v1, v21

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 231
    invoke-virtual/range {v21 .. v21}, Landroid/graphics/Path;->reset()V

    goto/16 :goto_274

    .line 238
    .end local v9    # "i":I
    .end local v21    # "tri":Landroid/graphics/Path;
    :pswitch_393
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 239
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-static {v3}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 241
    const/4 v9, 0x0

    .restart local v9    # "i":I
    :goto_3aa
    invoke-virtual {v8}, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->size()I

    move-result v2

    if-ge v9, v2, :cond_7f

    .line 243
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    iget-object v3, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    aget v3, v3, v9

    invoke-virtual {v2, v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsRight(F)Z

    move-result v2

    if-eqz v2, :cond_7f

    .line 246
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    iget-object v3, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    aget v3, v3, v9

    invoke-virtual {v2, v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsLeft(F)Z

    move-result v2

    if-eqz v2, :cond_3dc

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    iget-object v3, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    add-int/lit8 v4, v9, 0x1

    aget v3, v3, v4

    invoke-virtual {v2, v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsY(F)Z

    move-result v2

    if-nez v2, :cond_3df

    .line 241
    :cond_3dc
    :goto_3dc
    add-int/lit8 v9, v9, 0x2

    goto :goto_3aa

    .line 250
    :cond_3df
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    div-int/lit8 v3, v9, 0x2

    move-object/from16 v0, p2

    invoke-interface {v0, v3}, Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;->getColor(I)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 252
    iget-object v2, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    aget v2, v2, v9

    sub-float v3, v2, v13

    iget-object v2, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    add-int/lit8 v4, v9, 0x1

    aget v4, v2, v4

    iget-object v2, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    aget v2, v2, v9

    add-float v5, v2, v13

    iget-object v2, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    add-int/lit8 v6, v9, 0x1

    aget v6, v2, v6

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 258
    iget-object v2, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    aget v3, v2, v9

    iget-object v2, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    add-int/lit8 v4, v9, 0x1

    aget v2, v2, v4

    sub-float v4, v2, v13

    iget-object v2, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    aget v5, v2, v9

    iget-object v2, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    add-int/lit8 v6, v9, 0x1

    aget v2, v2, v6

    add-float v6, v2, v13

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto :goto_3dc

    .line 269
    .end local v9    # "i":I
    :pswitch_431
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 270
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-static {v3}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 272
    const/4 v9, 0x0

    .restart local v9    # "i":I
    :goto_448
    invoke-virtual {v8}, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->size()I

    move-result v2

    if-ge v9, v2, :cond_7f

    .line 274
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    iget-object v3, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    aget v3, v3, v9

    invoke-virtual {v2, v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsRight(F)Z

    move-result v2

    if-eqz v2, :cond_7f

    .line 277
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    iget-object v3, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    aget v3, v3, v9

    invoke-virtual {v2, v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsLeft(F)Z

    move-result v2

    if-eqz v2, :cond_47a

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    iget-object v3, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    add-int/lit8 v4, v9, 0x1

    aget v3, v3, v4

    invoke-virtual {v2, v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsY(F)Z

    move-result v2

    if-nez v2, :cond_47d

    .line 272
    :cond_47a
    :goto_47a
    add-int/lit8 v9, v9, 0x2

    goto :goto_448

    .line 281
    :cond_47d
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    div-int/lit8 v3, v9, 0x2

    move-object/from16 v0, p2

    invoke-interface {v0, v3}, Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;->getColor(I)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 283
    iget-object v2, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    aget v2, v2, v9

    sub-float v3, v2, v13

    iget-object v2, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    add-int/lit8 v4, v9, 0x1

    aget v2, v2, v4

    sub-float v4, v2, v13

    iget-object v2, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    aget v2, v2, v9

    add-float v5, v2, v13

    iget-object v2, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    add-int/lit8 v6, v9, 0x1

    aget v2, v2, v6

    add-float v6, v2, v13

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 289
    iget-object v2, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    aget v2, v2, v9

    add-float v3, v2, v13

    iget-object v2, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    add-int/lit8 v4, v9, 0x1

    aget v2, v2, v4

    sub-float v4, v2, v13

    iget-object v2, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    aget v2, v2, v9

    sub-float v5, v2, v13

    iget-object v2, v8, Lcom/github/mikephil/charting/buffer/ScatterBuffer;->buffer:[F

    add-int/lit8 v6, v9, 0x1

    aget v2, v2, v6

    add-float v6, v2, v13

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto :goto_47a

    .line 84
    nop

    :pswitch_data_4d8
    .packed-switch 0x1
        :pswitch_80
        :pswitch_177
        :pswitch_233
        :pswitch_393
        :pswitch_431
    .end packed-switch
.end method

.method public drawExtras(Landroid/graphics/Canvas;)V
    .registers 2
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    .line 374
    return-void
.end method

.method public drawHighlighted(Landroid/graphics/Canvas;[Lcom/github/mikephil/charting/highlight/Highlight;)V
    .registers 21
    .param p1, "c"    # Landroid/graphics/Canvas;
    .param p2, "indices"    # [Lcom/github/mikephil/charting/highlight/Highlight;

    .prologue
    .line 379
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/ScatterDataProvider;

    invoke-interface {v15}, Lcom/github/mikephil/charting/interfaces/dataprovider/ScatterDataProvider;->getScatterData()Lcom/github/mikephil/charting/data/ScatterData;

    move-result-object v10

    .line 381
    .local v10, "scatterData":Lcom/github/mikephil/charting/data/ScatterData;
    move-object/from16 v2, p2

    .local v2, "arr$":[Lcom/github/mikephil/charting/highlight/Highlight;
    array-length v6, v2

    .local v6, "len$":I
    const/4 v5, 0x0

    .local v5, "i$":I
    :goto_c
    if-ge v5, v6, :cond_aa

    aget-object v4, v2, v5

    .line 383
    .local v4, "high":Lcom/github/mikephil/charting/highlight/Highlight;
    invoke-virtual {v4}, Lcom/github/mikephil/charting/highlight/Highlight;->getDataSetIndex()I

    move-result v15

    const/16 v16, -0x1

    move/from16 v0, v16

    if-ne v15, v0, :cond_34

    const/4 v8, 0x0

    .line 386
    .local v8, "minDataSetIndex":I
    :goto_1b
    invoke-virtual {v4}, Lcom/github/mikephil/charting/highlight/Highlight;->getDataSetIndex()I

    move-result v15

    const/16 v16, -0x1

    move/from16 v0, v16

    if-ne v15, v0, :cond_39

    invoke-virtual {v10}, Lcom/github/mikephil/charting/data/ScatterData;->getDataSetCount()I

    move-result v7

    .line 389
    .local v7, "maxDataSetIndex":I
    :goto_29
    sub-int v15, v7, v8

    const/16 v16, 0x1

    move/from16 v0, v16

    if-ge v15, v0, :cond_40

    .line 381
    :cond_31
    add-int/lit8 v5, v5, 0x1

    goto :goto_c

    .line 383
    .end local v7    # "maxDataSetIndex":I
    .end local v8    # "minDataSetIndex":I
    :cond_34
    invoke-virtual {v4}, Lcom/github/mikephil/charting/highlight/Highlight;->getDataSetIndex()I

    move-result v8

    goto :goto_1b

    .line 386
    .restart local v8    # "minDataSetIndex":I
    :cond_39
    invoke-virtual {v4}, Lcom/github/mikephil/charting/highlight/Highlight;->getDataSetIndex()I

    move-result v15

    add-int/lit8 v7, v15, 0x1

    goto :goto_29

    .line 391
    .restart local v7    # "maxDataSetIndex":I
    :cond_40
    move v3, v8

    .line 392
    .local v3, "dataSetIndex":I
    :goto_41
    if-ge v3, v7, :cond_31

    .line 395
    invoke-virtual {v10, v3}, Lcom/github/mikephil/charting/data/ScatterData;->getDataSetByIndex(I)Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    move-result-object v11

    check-cast v11, Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;

    .line 397
    .local v11, "set":Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;
    if-eqz v11, :cond_51

    invoke-interface {v11}, Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;->isHighlightEnabled()Z

    move-result v15

    if-nez v15, :cond_54

    .line 393
    :cond_51
    :goto_51
    add-int/lit8 v3, v3, 0x1

    goto :goto_41

    .line 400
    :cond_54
    invoke-virtual {v4}, Lcom/github/mikephil/charting/highlight/Highlight;->getXIndex()I

    move-result v12

    .line 404
    .local v12, "xIndex":I
    int-to-float v15, v12

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/ScatterDataProvider;

    move-object/from16 v16, v0

    invoke-interface/range {v16 .. v16}, Lcom/github/mikephil/charting/interfaces/dataprovider/ScatterDataProvider;->getXChartMax()F

    move-result v16

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseX()F

    move-result v17

    mul-float v16, v16, v17

    cmpl-float v15, v15, v16

    if-gtz v15, :cond_51

    .line 407
    invoke-interface {v11, v12}, Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;->getYValForXIndex(I)F

    move-result v14

    .line 408
    .local v14, "yVal":F
    invoke-static {v14}, Ljava/lang/Float;->isNaN(F)Z

    move-result v15

    if-nez v15, :cond_51

    .line 411
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v15}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseY()F

    move-result v15

    mul-float v13, v14, v15

    .line 413
    .local v13, "y":F
    const/4 v15, 0x2

    new-array v9, v15, [F

    const/4 v15, 0x0

    int-to-float v0, v12

    move/from16 v16, v0

    aput v16, v9, v15

    const/4 v15, 0x1

    aput v13, v9, v15

    .line 417
    .local v9, "pts":[F
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/ScatterDataProvider;

    invoke-interface {v11}, Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;->getAxisDependency()Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    move-result-object v16

    invoke-interface/range {v15 .. v16}, Lcom/github/mikephil/charting/interfaces/dataprovider/ScatterDataProvider;->getTransformer(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/Transformer;

    move-result-object v15

    invoke-virtual {v15, v9}, Lcom/github/mikephil/charting/utils/Transformer;->pointValuesToPixel([F)V

    .line 420
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v9, v11}, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->drawHighlightLines(Landroid/graphics/Canvas;[FLcom/github/mikephil/charting/interfaces/datasets/ILineScatterCandleRadarDataSet;)V

    goto :goto_51

    .line 423
    .end local v3    # "dataSetIndex":I
    .end local v4    # "high":Lcom/github/mikephil/charting/highlight/Highlight;
    .end local v7    # "maxDataSetIndex":I
    .end local v8    # "minDataSetIndex":I
    .end local v9    # "pts":[F
    .end local v11    # "set":Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;
    .end local v12    # "xIndex":I
    .end local v13    # "y":F
    .end local v14    # "yVal":F
    :cond_aa
    return-void
.end method

.method public drawValues(Landroid/graphics/Canvas;)V
    .registers 16
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    .line 332
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/ScatterDataProvider;

    invoke-interface {v0}, Lcom/github/mikephil/charting/interfaces/dataprovider/ScatterDataProvider;->getScatterData()Lcom/github/mikephil/charting/data/ScatterData;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/ScatterData;->getYValCount()I

    move-result v0

    int-to-float v0, v0

    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/ScatterDataProvider;

    invoke-interface {v1}, Lcom/github/mikephil/charting/interfaces/dataprovider/ScatterDataProvider;->getMaxVisibleCount()I

    move-result v1

    int-to-float v1, v1

    iget-object v2, p0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getScaleX()F

    move-result v2

    mul-float/2addr v1, v2

    cmpg-float v0, v0, v1

    if-gez v0, :cond_bc

    .line 335
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/ScatterDataProvider;

    invoke-interface {v0}, Lcom/github/mikephil/charting/interfaces/dataprovider/ScatterDataProvider;->getScatterData()Lcom/github/mikephil/charting/data/ScatterData;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/ScatterData;->getDataSets()Ljava/util/List;

    move-result-object v10

    .line 337
    .local v10, "dataSets":Ljava/util/List;, "Ljava/util/List<Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;>;"
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_28
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/ScatterDataProvider;

    invoke-interface {v0}, Lcom/github/mikephil/charting/interfaces/dataprovider/ScatterDataProvider;->getScatterData()Lcom/github/mikephil/charting/data/ScatterData;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/ScatterData;->getDataSetCount()I

    move-result v0

    if-ge v5, v0, :cond_bc

    .line 339
    invoke-interface {v10, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;

    .line 341
    .local v9, "dataSet":Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;
    invoke-interface {v9}, Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;->isDrawValuesEnabled()Z

    move-result v0

    if-eqz v0, :cond_46

    invoke-interface {v9}, Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;->getEntryCount()I

    move-result v0

    if-nez v0, :cond_49

    .line 337
    :cond_46
    add-int/lit8 v5, v5, 0x1

    goto :goto_28

    .line 345
    :cond_49
    invoke-virtual {p0, v9}, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->applyValueTextStyle(Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;)V

    .line 347
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/ScatterDataProvider;

    invoke-interface {v9}, Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;->getAxisDependency()Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/github/mikephil/charting/interfaces/dataprovider/ScatterDataProvider;->getTransformer(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/Transformer;

    move-result-object v0

    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseY()F

    move-result v1

    invoke-virtual {v0, v9, v1}, Lcom/github/mikephil/charting/utils/Transformer;->generateTransformedValuesScatter(Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;F)[F

    move-result-object v12

    .line 351
    .local v12, "positions":[F
    invoke-interface {v9}, Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;->getScatterShapeSize()F

    move-result v0

    invoke-static {v0}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v13

    .line 353
    .local v13, "shapeSize":F
    const/4 v11, 0x0

    .local v11, "j":I
    :goto_69
    int-to-float v0, v11

    array-length v1, v12

    int-to-float v1, v1

    iget-object v2, p0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseX()F

    move-result v2

    mul-float/2addr v1, v2

    cmpg-float v0, v0, v1

    if-gez v0, :cond_46

    .line 355
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    aget v1, v12, v11

    invoke-virtual {v0, v1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsRight(F)Z

    move-result v0

    if-eqz v0, :cond_46

    .line 359
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    aget v1, v12, v11

    invoke-virtual {v0, v1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsLeft(F)Z

    move-result v0

    if-eqz v0, :cond_97

    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    add-int/lit8 v1, v11, 0x1

    aget v1, v12, v1

    invoke-virtual {v0, v1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsY(F)Z

    move-result v0

    if-nez v0, :cond_9a

    .line 353
    :cond_97
    :goto_97
    add-int/lit8 v11, v11, 0x2

    goto :goto_69

    .line 363
    :cond_9a
    div-int/lit8 v0, v11, 0x2

    invoke-interface {v9, v0}, Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v4

    .line 365
    .local v4, "entry":Lcom/github/mikephil/charting/data/Entry;
    invoke-interface {v9}, Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;->getValueFormatter()Lcom/github/mikephil/charting/formatter/ValueFormatter;

    move-result-object v2

    invoke-virtual {v4}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v3

    aget v6, v12, v11

    add-int/lit8 v0, v11, 0x1

    aget v0, v12, v0

    sub-float v7, v0, v13

    div-int/lit8 v0, v11, 0x2

    invoke-interface {v9, v0}, Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;->getValueTextColor(I)I

    move-result v8

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v8}, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->drawValue(Landroid/graphics/Canvas;Lcom/github/mikephil/charting/formatter/ValueFormatter;FLcom/github/mikephil/charting/data/Entry;IFFI)V

    goto :goto_97

    .line 370
    .end local v4    # "entry":Lcom/github/mikephil/charting/data/Entry;
    .end local v5    # "i":I
    .end local v9    # "dataSet":Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;
    .end local v10    # "dataSets":Ljava/util/List;, "Ljava/util/List<Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;>;"
    .end local v11    # "j":I
    .end local v12    # "positions":[F
    .end local v13    # "shapeSize":F
    :cond_bc
    return-void
.end method

.method public initBuffers()V
    .registers 7

    .prologue
    .line 38
    iget-object v3, p0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/ScatterDataProvider;

    invoke-interface {v3}, Lcom/github/mikephil/charting/interfaces/dataprovider/ScatterDataProvider;->getScatterData()Lcom/github/mikephil/charting/data/ScatterData;

    move-result-object v1

    .line 40
    .local v1, "scatterData":Lcom/github/mikephil/charting/data/ScatterData;
    invoke-virtual {v1}, Lcom/github/mikephil/charting/data/ScatterData;->getDataSetCount()I

    move-result v3

    new-array v3, v3, [Lcom/github/mikephil/charting/buffer/ScatterBuffer;

    iput-object v3, p0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mScatterBuffers:[Lcom/github/mikephil/charting/buffer/ScatterBuffer;

    .line 42
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_f
    iget-object v3, p0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mScatterBuffers:[Lcom/github/mikephil/charting/buffer/ScatterBuffer;

    array-length v3, v3

    if-ge v0, v3, :cond_2c

    .line 43
    invoke-virtual {v1, v0}, Lcom/github/mikephil/charting/data/ScatterData;->getDataSetByIndex(I)Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    move-result-object v2

    check-cast v2, Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;

    .line 44
    .local v2, "set":Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;
    iget-object v3, p0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mScatterBuffers:[Lcom/github/mikephil/charting/buffer/ScatterBuffer;

    new-instance v4, Lcom/github/mikephil/charting/buffer/ScatterBuffer;

    invoke-interface {v2}, Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;->getEntryCount()I

    move-result v5

    mul-int/lit8 v5, v5, 0x2

    invoke-direct {v4, v5}, Lcom/github/mikephil/charting/buffer/ScatterBuffer;-><init>(I)V

    aput-object v4, v3, v0

    .line 42
    add-int/lit8 v0, v0, 0x1

    goto :goto_f

    .line 46
    .end local v2    # "set":Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;
    :cond_2c
    return-void
.end method
