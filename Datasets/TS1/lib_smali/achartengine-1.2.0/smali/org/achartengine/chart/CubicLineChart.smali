.class public Lorg/achartengine/chart/CubicLineChart;
.super Lorg/achartengine/chart/LineChart;
.source "CubicLineChart.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "Cubic"


# instance fields
.field private mFirstMultiplier:F

.field private mPathMeasure:Landroid/graphics/PathMeasure;

.field private mSecondMultiplier:F


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 43
    invoke-direct {p0}, Lorg/achartengine/chart/LineChart;-><init>()V

    .line 45
    const v0, 0x3ea8f5c3    # 0.33f

    iput v0, p0, Lorg/achartengine/chart/CubicLineChart;->mFirstMultiplier:F

    .line 47
    const/high16 v0, 0x3f800000    # 1.0f

    iget v1, p0, Lorg/achartengine/chart/CubicLineChart;->mFirstMultiplier:F

    sub-float/2addr v0, v1

    iput v0, p0, Lorg/achartengine/chart/CubicLineChart;->mSecondMultiplier:F

    .line 48
    return-void
.end method

.method public constructor <init>(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;F)V
    .registers 6
    .param p1, "dataset"    # Lorg/achartengine/model/XYMultipleSeriesDataset;
    .param p2, "renderer"    # Lorg/achartengine/renderer/XYMultipleSeriesRenderer;
    .param p3, "smoothness"    # F

    .prologue
    .line 63
    invoke-direct {p0, p1, p2}, Lorg/achartengine/chart/LineChart;-><init>(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V

    .line 64
    iput p3, p0, Lorg/achartengine/chart/CubicLineChart;->mFirstMultiplier:F

    .line 65
    const/high16 v0, 0x3f800000    # 1.0f

    iget v1, p0, Lorg/achartengine/chart/CubicLineChart;->mFirstMultiplier:F

    sub-float/2addr v0, v1

    iput v0, p0, Lorg/achartengine/chart/CubicLineChart;->mSecondMultiplier:F

    .line 66
    return-void
.end method

.method private calc(Ljava/util/List;Lorg/achartengine/model/Point;IIF)V
    .registers 13
    .param p2, "result"    # Lorg/achartengine/model/Point;
    .param p3, "index1"    # I
    .param p4, "index2"    # I
    .param p5, "multiplier"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Float;",
            ">;",
            "Lorg/achartengine/model/Point;",
            "IIF)V"
        }
    .end annotation

    .prologue
    .line 104
    .local p1, "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    invoke-interface {p1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Float;

    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    move-result v2

    .line 105
    .local v2, "p1x":F
    add-int/lit8 v6, p3, 0x1

    invoke-interface {p1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Float;

    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    move-result v3

    .line 106
    .local v3, "p1y":F
    invoke-interface {p1, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Float;

    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    move-result v4

    .line 107
    .local v4, "p2x":F
    add-int/lit8 v6, p4, 0x1

    invoke-interface {p1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Float;

    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    move-result v5

    .line 109
    .local v5, "p2y":F
    sub-float v0, v4, v2

    .line 110
    .local v0, "diffX":F
    sub-float v1, v5, v3

    .line 111
    .local v1, "diffY":F
    mul-float v6, v0, p5

    add-float/2addr v6, v2

    invoke-virtual {p2, v6}, Lorg/achartengine/model/Point;->setX(F)V

    .line 112
    mul-float v6, v1, p5

    add-float/2addr v6, v3

    invoke-virtual {p2, v6}, Lorg/achartengine/model/Point;->setY(F)V

    .line 113
    return-void
.end method


# virtual methods
.method protected drawPath(Landroid/graphics/Canvas;Ljava/util/List;Landroid/graphics/Paint;Z)V
    .registers 30
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p3, "paint"    # Landroid/graphics/Paint;
    .param p4, "circular"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Canvas;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Float;",
            ">;",
            "Landroid/graphics/Paint;",
            "Z)V"
        }
    .end annotation

    .prologue
    .line 70
    .local p2, "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    new-instance v21, Landroid/graphics/Path;

    invoke-direct/range {v21 .. v21}, Landroid/graphics/Path;-><init>()V

    .line 71
    .local v21, "p":Landroid/graphics/Path;
    const/4 v3, 0x0

    move-object/from16 v0, p2

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v23

    .line 72
    .local v23, "x":F
    const/4 v3, 0x1

    move-object/from16 v0, p2

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v24

    .line 73
    .local v24, "y":F
    move-object/from16 v0, v21

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->moveTo(FF)V

    .line 75
    invoke-interface/range {p2 .. p2}, Ljava/util/List;->size()I

    move-result v20

    .line 76
    .local v20, "length":I
    if-eqz p4, :cond_30

    .line 77
    add-int/lit8 v20, v20, -0x4

    .line 80
    :cond_30
    new-instance v5, Lorg/achartengine/model/Point;

    invoke-direct {v5}, Lorg/achartengine/model/Point;-><init>()V

    .line 81
    .local v5, "p1":Lorg/achartengine/model/Point;
    new-instance v22, Lorg/achartengine/model/Point;

    invoke-direct/range {v22 .. v22}, Lorg/achartengine/model/Point;-><init>()V

    .line 82
    .local v22, "p2":Lorg/achartengine/model/Point;
    new-instance v10, Lorg/achartengine/model/Point;

    invoke-direct {v10}, Lorg/achartengine/model/Point;-><init>()V

    .line 83
    .local v10, "p3":Lorg/achartengine/model/Point;
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_40
    move/from16 v0, v20

    if-ge v6, v0, :cond_b3

    .line 84
    add-int/lit8 v3, v6, 0x2

    move/from16 v0, v20

    if-ge v3, v0, :cond_af

    add-int/lit8 v7, v6, 0x2

    .line 85
    .local v7, "nextIndex":I
    :goto_4c
    add-int/lit8 v3, v6, 0x4

    move/from16 v0, v20

    if-ge v3, v0, :cond_b1

    add-int/lit8 v12, v6, 0x4

    .line 86
    .local v12, "nextNextIndex":I
    :goto_54
    move-object/from16 v0, p0

    iget v8, v0, Lorg/achartengine/chart/CubicLineChart;->mSecondMultiplier:F

    move-object/from16 v3, p0

    move-object/from16 v4, p2

    invoke-direct/range {v3 .. v8}, Lorg/achartengine/chart/CubicLineChart;->calc(Ljava/util/List;Lorg/achartengine/model/Point;IIF)V

    .line 87
    move-object/from16 v0, p2

    invoke-interface {v0, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    move-object/from16 v0, v22

    invoke-virtual {v0, v3}, Lorg/achartengine/model/Point;->setX(F)V

    .line 88
    add-int/lit8 v3, v7, 0x1

    move-object/from16 v0, p2

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    move-object/from16 v0, v22

    invoke-virtual {v0, v3}, Lorg/achartengine/model/Point;->setY(F)V

    .line 89
    move-object/from16 v0, p0

    iget v13, v0, Lorg/achartengine/chart/CubicLineChart;->mFirstMultiplier:F

    move-object/from16 v8, p0

    move-object/from16 v9, p2

    move v11, v7

    invoke-direct/range {v8 .. v13}, Lorg/achartengine/chart/CubicLineChart;->calc(Ljava/util/List;Lorg/achartengine/model/Point;IIF)V

    .line 91
    invoke-virtual {v5}, Lorg/achartengine/model/Point;->getX()F

    move-result v14

    invoke-virtual {v5}, Lorg/achartengine/model/Point;->getY()F

    move-result v15

    invoke-virtual/range {v22 .. v22}, Lorg/achartengine/model/Point;->getX()F

    move-result v16

    invoke-virtual/range {v22 .. v22}, Lorg/achartengine/model/Point;->getY()F

    move-result v17

    invoke-virtual {v10}, Lorg/achartengine/model/Point;->getX()F

    move-result v18

    invoke-virtual {v10}, Lorg/achartengine/model/Point;->getY()F

    move-result v19

    move-object/from16 v13, v21

    invoke-virtual/range {v13 .. v19}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 83
    add-int/lit8 v6, v6, 0x2

    goto :goto_40

    .end local v7    # "nextIndex":I
    .end local v12    # "nextNextIndex":I
    :cond_af
    move v7, v6

    .line 84
    goto :goto_4c

    .restart local v7    # "nextIndex":I
    :cond_b1
    move v12, v7

    .line 85
    goto :goto_54

    .line 93
    .end local v7    # "nextIndex":I
    :cond_b3
    new-instance v3, Landroid/graphics/PathMeasure;

    const/4 v4, 0x0

    move-object/from16 v0, v21

    invoke-direct {v3, v0, v4}, Landroid/graphics/PathMeasure;-><init>(Landroid/graphics/Path;Z)V

    move-object/from16 v0, p0

    iput-object v3, v0, Lorg/achartengine/chart/CubicLineChart;->mPathMeasure:Landroid/graphics/PathMeasure;

    .line 94
    if-eqz p4, :cond_108

    .line 95
    move/from16 v6, v20

    :goto_c3
    add-int/lit8 v3, v20, 0x4

    if-ge v6, v3, :cond_e9

    .line 96
    move-object/from16 v0, p2

    invoke-interface {v0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v4

    add-int/lit8 v3, v6, 0x1

    move-object/from16 v0, p2

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    move-object/from16 v0, v21

    invoke-virtual {v0, v4, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 95
    add-int/lit8 v6, v6, 0x2

    goto :goto_c3

    .line 98
    :cond_e9
    const/4 v3, 0x0

    move-object/from16 v0, p2

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v4

    const/4 v3, 0x1

    move-object/from16 v0, p2

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    move-object/from16 v0, v21

    invoke-virtual {v0, v4, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 100
    :cond_108
    move-object/from16 v0, p1

    move-object/from16 v1, v21

    move-object/from16 v2, p3

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 101
    return-void
.end method

.method protected drawPoints(Landroid/graphics/Canvas;Landroid/graphics/Paint;Ljava/util/List;Lorg/achartengine/renderer/XYSeriesRenderer;FII)V
    .registers 28
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
    .line 128
    .local p3, "pointsList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-virtual {v0, v1}, Lorg/achartengine/chart/CubicLineChart;->isRenderPoints(Lorg/achartengine/renderer/SimpleSeriesRenderer;)Z

    move-result v3

    if-eqz v3, :cond_85

    .line 129
    invoke-virtual/range {p0 .. p0}, Lorg/achartengine/chart/CubicLineChart;->getPointsChart()Lorg/achartengine/chart/ScatterChart;

    move-result-object v2

    .line 130
    .local v2, "pointsChart":Lorg/achartengine/chart/ScatterChart;
    if-eqz v2, :cond_85

    .line 131
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/achartengine/chart/CubicLineChart;->mPathMeasure:Landroid/graphics/PathMeasure;

    invoke-virtual {v3}, Landroid/graphics/PathMeasure;->getLength()F

    move-result v3

    float-to-int v15, v3

    .line 132
    .local v15, "length":I
    invoke-interface/range {p3 .. p3}, Ljava/util/List;->size()I

    move-result v17

    .line 133
    .local v17, "pointsLength":I
    const/4 v3, 0x2

    new-array v10, v3, [F

    .line 134
    .local v10, "coords":[F
    const/4 v13, 0x0

    .local v13, "i":I
    :goto_21
    if-ge v13, v15, :cond_74

    .line 135
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/achartengine/chart/CubicLineChart;->mPathMeasure:Landroid/graphics/PathMeasure;

    int-to-float v4, v13

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v10, v5}, Landroid/graphics/PathMeasure;->getPosTan(F[F[F)Z

    .line 136
    const-wide v18, 0x7fefffffffffffffL    # Double.MAX_VALUE

    .line 137
    .local v18, "prevDiff":D
    const/16 v16, 0x1

    .line 138
    .local v16, "ok":Z
    const/4 v14, 0x0

    .local v14, "j":I
    :goto_34
    move/from16 v0, v17

    if-ge v14, v0, :cond_71

    if-eqz v16, :cond_71

    .line 139
    move-object/from16 v0, p3

    invoke-interface {v0, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    const/4 v4, 0x0

    aget v4, v10, v4

    sub-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    float-to-double v11, v3

    .line 140
    .local v11, "diff":D
    const-wide/high16 v3, 0x3ff0000000000000L    # 1.0

    cmpg-double v3, v11, v3

    if-gez v3, :cond_65

    .line 141
    add-int/lit8 v3, v14, 0x1

    const/4 v4, 0x1

    aget v4, v10, v4

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    move-object/from16 v0, p3

    invoke-interface {v0, v3, v4}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 142
    move-wide/from16 v18, v11

    .line 144
    :cond_65
    cmpl-double v3, v18, v11

    if-lez v3, :cond_6e

    const/16 v16, 0x1

    .line 138
    :goto_6b
    add-int/lit8 v14, v14, 0x2

    goto :goto_34

    .line 144
    :cond_6e
    const/16 v16, 0x0

    goto :goto_6b

    .line 134
    .end local v11    # "diff":D
    :cond_71
    add-int/lit8 v13, v13, 0x1

    goto :goto_21

    .end local v14    # "j":I
    .end local v16    # "ok":Z
    .end local v18    # "prevDiff":D
    :cond_74
    move-object/from16 v3, p1

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    move/from16 v7, p5

    move/from16 v8, p6

    move/from16 v9, p7

    .line 147
    invoke-virtual/range {v2 .. v9}, Lorg/achartengine/chart/ScatterChart;->drawSeries(Landroid/graphics/Canvas;Landroid/graphics/Paint;Ljava/util/List;Lorg/achartengine/renderer/XYSeriesRenderer;FII)V

    .line 151
    .end local v2    # "pointsChart":Lorg/achartengine/chart/ScatterChart;
    .end local v10    # "coords":[F
    .end local v13    # "i":I
    .end local v15    # "length":I
    .end local v17    # "pointsLength":I
    :cond_85
    return-void
.end method

.method public getChartType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 159
    const-string v0, "Cubic"

    return-object v0
.end method
