.class public Lorg/achartengine/chart/BarChart;
.super Lorg/achartengine/chart/XYChart;
.source "BarChart.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/achartengine/chart/BarChart$Type;
    }
.end annotation


# static fields
.field private static final SHAPE_WIDTH:I = 0xc

.field public static final TYPE:Ljava/lang/String; = "Bar"


# instance fields
.field private mPreviousSeriesPoints:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field protected mType:Lorg/achartengine/chart/BarChart$Type;


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 54
    invoke-direct {p0}, Lorg/achartengine/chart/XYChart;-><init>()V

    .line 43
    sget-object v0, Lorg/achartengine/chart/BarChart$Type;->DEFAULT:Lorg/achartengine/chart/BarChart$Type;

    iput-object v0, p0, Lorg/achartengine/chart/BarChart;->mType:Lorg/achartengine/chart/BarChart$Type;

    .line 55
    return-void
.end method

.method constructor <init>(Lorg/achartengine/chart/BarChart$Type;)V
    .registers 3
    .param p1, "type"    # Lorg/achartengine/chart/BarChart$Type;

    .prologue
    .line 57
    invoke-direct {p0}, Lorg/achartengine/chart/XYChart;-><init>()V

    .line 43
    sget-object v0, Lorg/achartengine/chart/BarChart$Type;->DEFAULT:Lorg/achartengine/chart/BarChart$Type;

    iput-object v0, p0, Lorg/achartengine/chart/BarChart;->mType:Lorg/achartengine/chart/BarChart$Type;

    .line 58
    iput-object p1, p0, Lorg/achartengine/chart/BarChart;->mType:Lorg/achartengine/chart/BarChart$Type;

    .line 59
    return-void
.end method

.method public constructor <init>(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;Lorg/achartengine/chart/BarChart$Type;)V
    .registers 5
    .param p1, "dataset"    # Lorg/achartengine/model/XYMultipleSeriesDataset;
    .param p2, "renderer"    # Lorg/achartengine/renderer/XYMultipleSeriesRenderer;
    .param p3, "type"    # Lorg/achartengine/chart/BarChart$Type;

    .prologue
    .line 69
    invoke-direct {p0, p1, p2}, Lorg/achartengine/chart/XYChart;-><init>(Lorg/achartengine/model/XYMultipleSeriesDataset;Lorg/achartengine/renderer/XYMultipleSeriesRenderer;)V

    .line 43
    sget-object v0, Lorg/achartengine/chart/BarChart$Type;->DEFAULT:Lorg/achartengine/chart/BarChart$Type;

    iput-object v0, p0, Lorg/achartengine/chart/BarChart;->mType:Lorg/achartengine/chart/BarChart$Type;

    .line 70
    iput-object p3, p0, Lorg/achartengine/chart/BarChart;->mType:Lorg/achartengine/chart/BarChart$Type;

    .line 71
    return-void
.end method


# virtual methods
.method protected clickableAreasForPoints(Ljava/util/List;Ljava/util/List;FII)[Lorg/achartengine/chart/ClickableArea;
    .registers 23
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
    .line 76
    .local p1, "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    .local p2, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/achartengine/chart/BarChart;->mDataset:Lorg/achartengine/model/XYMultipleSeriesDataset;

    invoke-virtual {v2}, Lorg/achartengine/model/XYMultipleSeriesDataset;->getSeriesCount()I

    move-result v12

    .line 77
    .local v12, "seriesNr":I
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    move-result v10

    .line 78
    .local v10, "length":I
    div-int/lit8 v2, v10, 0x2

    new-array v11, v2, [Lorg/achartengine/chart/ClickableArea;

    .line 79
    .local v11, "ret":[Lorg/achartengine/chart/ClickableArea;
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v10, v12}, Lorg/achartengine/chart/BarChart;->getHalfDiffX(Ljava/util/List;II)F

    move-result v8

    .line 80
    .local v8, "halfDiffX":F
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_19
    if-ge v9, v10, :cond_c3

    .line 81
    move-object/from16 v0, p1

    invoke-interface {v0, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v14

    .line 82
    .local v14, "x":F
    add-int/lit8 v2, v9, 0x1

    move-object/from16 v0, p1

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v15

    .line 83
    .local v15, "y":F
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/achartengine/chart/BarChart;->mType:Lorg/achartengine/chart/BarChart$Type;

    sget-object v3, Lorg/achartengine/chart/BarChart$Type;->STACKED:Lorg/achartengine/chart/BarChart$Type;

    if-eq v2, v3, :cond_45

    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/achartengine/chart/BarChart;->mType:Lorg/achartengine/chart/BarChart$Type;

    sget-object v3, Lorg/achartengine/chart/BarChart$Type;->HEAPED:Lorg/achartengine/chart/BarChart$Type;

    if-ne v2, v3, :cond_80

    .line 84
    :cond_45
    div-int/lit8 v16, v9, 0x2

    new-instance v2, Lorg/achartengine/chart/ClickableArea;

    new-instance v3, Landroid/graphics/RectF;

    sub-float v4, v14, v8

    move/from16 v0, p3

    invoke-static {v15, v0}, Ljava/lang/Math;->min(FF)F

    move-result v5

    add-float v6, v14, v8

    move/from16 v0, p3

    invoke-static {v15, v0}, Ljava/lang/Math;->max(FF)F

    move-result v7

    invoke-direct {v3, v4, v5, v6, v7}, Landroid/graphics/RectF;-><init>(FFFF)V

    move-object/from16 v0, p2

    invoke-interface {v0, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Double;

    invoke-virtual {v4}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v4

    add-int/lit8 v6, v9, 0x1

    move-object/from16 v0, p2

    invoke-interface {v0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Double;

    invoke-virtual {v6}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    invoke-direct/range {v2 .. v7}, Lorg/achartengine/chart/ClickableArea;-><init>(Landroid/graphics/RectF;DD)V

    aput-object v2, v11, v16

    .line 80
    :goto_7d
    add-int/lit8 v9, v9, 0x2

    goto :goto_19

    .line 87
    :cond_80
    int-to-float v2, v12

    mul-float/2addr v2, v8

    sub-float v2, v14, v2

    mul-int/lit8 v3, p4, 0x2

    int-to-float v3, v3

    mul-float/2addr v3, v8

    add-float v13, v2, v3

    .line 88
    .local v13, "startX":F
    div-int/lit8 v16, v9, 0x2

    new-instance v2, Lorg/achartengine/chart/ClickableArea;

    new-instance v3, Landroid/graphics/RectF;

    move/from16 v0, p3

    invoke-static {v15, v0}, Ljava/lang/Math;->min(FF)F

    move-result v4

    const/high16 v5, 0x40000000    # 2.0f

    mul-float/2addr v5, v8

    add-float/2addr v5, v13

    move/from16 v0, p3

    invoke-static {v15, v0}, Ljava/lang/Math;->max(FF)F

    move-result v6

    invoke-direct {v3, v13, v4, v5, v6}, Landroid/graphics/RectF;-><init>(FFFF)V

    move-object/from16 v0, p2

    invoke-interface {v0, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Double;

    invoke-virtual {v4}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v4

    add-int/lit8 v6, v9, 0x1

    move-object/from16 v0, p2

    invoke-interface {v0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Double;

    invoke-virtual {v6}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    invoke-direct/range {v2 .. v7}, Lorg/achartengine/chart/ClickableArea;-><init>(Landroid/graphics/RectF;DD)V

    aput-object v2, v11, v16

    goto :goto_7d

    .line 92
    .end local v13    # "startX":F
    .end local v14    # "x":F
    .end local v15    # "y":F
    :cond_c3
    return-object v11
.end method

.method protected drawBar(Landroid/graphics/Canvas;FFFFFIILandroid/graphics/Paint;)V
    .registers 20
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "xMin"    # F
    .param p3, "yMin"    # F
    .param p4, "xMax"    # F
    .param p5, "yMax"    # F
    .param p6, "halfDiffX"    # F
    .param p7, "seriesNr"    # I
    .param p8, "seriesIndex"    # I
    .param p9, "paint"    # Landroid/graphics/Paint;

    .prologue
    .line 146
    iget-object v1, p0, Lorg/achartengine/chart/BarChart;->mDataset:Lorg/achartengine/model/XYMultipleSeriesDataset;

    move/from16 v0, p8

    invoke-virtual {v1, v0}, Lorg/achartengine/model/XYMultipleSeriesDataset;->getSeriesAt(I)Lorg/achartengine/model/XYSeries;

    move-result-object v1

    invoke-virtual {v1}, Lorg/achartengine/model/XYSeries;->getScaleNumber()I

    move-result v7

    .line 147
    .local v7, "scale":I
    iget-object v1, p0, Lorg/achartengine/chart/BarChart;->mType:Lorg/achartengine/chart/BarChart$Type;

    sget-object v2, Lorg/achartengine/chart/BarChart$Type;->STACKED:Lorg/achartengine/chart/BarChart$Type;

    if-eq v1, v2, :cond_18

    iget-object v1, p0, Lorg/achartengine/chart/BarChart;->mType:Lorg/achartengine/chart/BarChart$Type;

    sget-object v2, Lorg/achartengine/chart/BarChart$Type;->HEAPED:Lorg/achartengine/chart/BarChart$Type;

    if-ne v1, v2, :cond_28

    .line 148
    :cond_18
    sub-float v3, p2, p6

    add-float v5, p4, p6

    move-object v1, p0

    move-object v2, p1

    move v4, p5

    move v6, p3

    move/from16 v8, p8

    move-object/from16 v9, p9

    invoke-virtual/range {v1 .. v9}, Lorg/achartengine/chart/BarChart;->drawBar(Landroid/graphics/Canvas;FFFFIILandroid/graphics/Paint;)V

    .line 153
    :goto_27
    return-void

    .line 150
    :cond_28
    move/from16 v0, p7

    int-to-float v1, v0

    mul-float v1, v1, p6

    sub-float v1, p2, v1

    mul-int/lit8 v2, p8, 0x2

    int-to-float v2, v2

    mul-float v2, v2, p6

    add-float v3, v1, v2

    .line 151
    .local v3, "startX":F
    const/high16 v1, 0x40000000    # 2.0f

    mul-float v1, v1, p6

    add-float v5, v3, v1

    move-object v1, p0

    move-object v2, p1

    move v4, p5

    move v6, p3

    move/from16 v8, p8

    move-object/from16 v9, p9

    invoke-virtual/range {v1 .. v9}, Lorg/achartengine/chart/BarChart;->drawBar(Landroid/graphics/Canvas;FFFFIILandroid/graphics/Paint;)V

    goto :goto_27
.end method

.method protected drawBar(Landroid/graphics/Canvas;FFFFIILandroid/graphics/Paint;)V
    .registers 28
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "xMin"    # F
    .param p3, "yMin"    # F
    .param p4, "xMax"    # F
    .param p5, "yMax"    # F
    .param p6, "scale"    # I
    .param p7, "seriesIndex"    # I
    .param p8, "paint"    # Landroid/graphics/Paint;

    .prologue
    .line 171
    cmpl-float v2, p2, p4

    if-lez v2, :cond_a

    .line 172
    move/from16 v18, p2

    .line 173
    .local v18, "temp":F
    move/from16 p2, p4

    .line 174
    move/from16 p4, v18

    .line 176
    .end local v18    # "temp":F
    :cond_a
    cmpl-float v2, p3, p5

    if-lez v2, :cond_14

    .line 177
    move/from16 v18, p3

    .line 178
    .restart local v18    # "temp":F
    move/from16 p3, p5

    .line 179
    move/from16 p5, v18

    .line 182
    .end local v18    # "temp":F
    :cond_14
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/achartengine/chart/BarChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    move/from16 v0, p7

    invoke-virtual {v2, v0}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getSeriesRendererAt(I)Lorg/achartengine/renderer/SimpleSeriesRenderer;

    move-result-object v17

    .line 183
    .local v17, "renderer":Lorg/achartengine/renderer/SimpleSeriesRenderer;
    invoke-virtual/range {v17 .. v17}, Lorg/achartengine/renderer/SimpleSeriesRenderer;->isGradientEnabled()Z

    move-result v2

    if-eqz v2, :cond_109

    .line 184
    const/4 v2, 0x2

    new-array v2, v2, [D

    const/4 v3, 0x0

    const-wide/16 v4, 0x0

    aput-wide v4, v2, v3

    const/4 v3, 0x1

    invoke-virtual/range {v17 .. v17}, Lorg/achartengine/renderer/SimpleSeriesRenderer;->getGradientStopValue()D

    move-result-wide v4

    aput-wide v4, v2, v3

    move-object/from16 v0, p0

    move/from16 v1, p6

    invoke-virtual {v0, v2, v1}, Lorg/achartengine/chart/BarChart;->toScreenPoint([DI)[D

    move-result-object v2

    const/4 v3, 0x1

    aget-wide v2, v2, v3

    double-to-float v0, v2

    move/from16 v16, v0

    .line 185
    .local v16, "minY":F
    const/4 v2, 0x2

    new-array v2, v2, [D

    const/4 v3, 0x0

    const-wide/16 v4, 0x0

    aput-wide v4, v2, v3

    const/4 v3, 0x1

    invoke-virtual/range {v17 .. v17}, Lorg/achartengine/renderer/SimpleSeriesRenderer;->getGradientStartValue()D

    move-result-wide v4

    aput-wide v4, v2, v3

    move-object/from16 v0, p0

    move/from16 v1, p6

    invoke-virtual {v0, v2, v1}, Lorg/achartengine/chart/BarChart;->toScreenPoint([DI)[D

    move-result-object v2

    const/4 v3, 0x1

    aget-wide v2, v2, v3

    double-to-float v15, v2

    .line 187
    .local v15, "maxY":F
    move/from16 v0, p3

    move/from16 v1, p5

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v2

    move/from16 v0, v16

    invoke-static {v0, v2}, Ljava/lang/Math;->max(FF)F

    move-result v12

    .line 188
    .local v12, "gradientMinY":F
    move/from16 v0, p3

    move/from16 v1, p5

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v2

    invoke-static {v15, v2}, Ljava/lang/Math;->min(FF)F

    move-result v10

    .line 189
    .local v10, "gradientMaxY":F
    invoke-virtual/range {v17 .. v17}, Lorg/achartengine/renderer/SimpleSeriesRenderer;->getGradientStopColor()I

    move-result v11

    .line 190
    .local v11, "gradientMinColor":I
    invoke-virtual/range {v17 .. v17}, Lorg/achartengine/renderer/SimpleSeriesRenderer;->getGradientStartColor()I

    move-result v9

    .line 191
    .local v9, "gradientMaxColor":I
    move v13, v9

    .line 192
    .local v13, "gradientStartColor":I
    move v14, v11

    .line 194
    .local v14, "gradientStopColor":I
    cmpg-float v2, p3, v16

    if-gez v2, :cond_f1

    .line 195
    move-object/from16 v0, p8

    invoke-virtual {v0, v11}, Landroid/graphics/Paint;->setColor(I)V

    .line 196
    invoke-static/range {p2 .. p2}, Ljava/lang/Math;->round(F)I

    move-result v2

    int-to-float v3, v2

    invoke-static/range {p3 .. p3}, Ljava/lang/Math;->round(F)I

    move-result v2

    int-to-float v4, v2

    invoke-static/range {p4 .. p4}, Ljava/lang/Math;->round(F)I

    move-result v2

    int-to-float v5, v2

    invoke-static {v12}, Ljava/lang/Math;->round(F)I

    move-result v2

    int-to-float v6, v2

    move-object/from16 v2, p1

    move-object/from16 v7, p8

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 202
    :goto_a4
    cmpl-float v2, p5, v15

    if-lez v2, :cond_fd

    .line 203
    move-object/from16 v0, p8

    invoke-virtual {v0, v9}, Landroid/graphics/Paint;->setColor(I)V

    .line 204
    invoke-static/range {p2 .. p2}, Ljava/lang/Math;->round(F)I

    move-result v2

    int-to-float v3, v2

    invoke-static {v10}, Ljava/lang/Math;->round(F)I

    move-result v2

    int-to-float v4, v2

    invoke-static/range {p4 .. p4}, Ljava/lang/Math;->round(F)I

    move-result v2

    int-to-float v5, v2

    invoke-static/range {p5 .. p5}, Ljava/lang/Math;->round(F)I

    move-result v2

    int-to-float v6, v2

    move-object/from16 v2, p1

    move-object/from16 v7, p8

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 210
    :goto_c8
    new-instance v8, Landroid/graphics/drawable/GradientDrawable;

    sget-object v2, Landroid/graphics/drawable/GradientDrawable$Orientation;->BOTTOM_TOP:Landroid/graphics/drawable/GradientDrawable$Orientation;

    const/4 v3, 0x2

    new-array v3, v3, [I

    const/4 v4, 0x0

    aput v13, v3, v4

    const/4 v4, 0x1

    aput v14, v3, v4

    invoke-direct {v8, v2, v3}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    .line 212
    .local v8, "gradient":Landroid/graphics/drawable/GradientDrawable;
    invoke-static/range {p2 .. p2}, Ljava/lang/Math;->round(F)I

    move-result v2

    invoke-static {v12}, Ljava/lang/Math;->round(F)I

    move-result v3

    invoke-static/range {p4 .. p4}, Ljava/lang/Math;->round(F)I

    move-result v4

    invoke-static {v10}, Ljava/lang/Math;->round(F)I

    move-result v5

    invoke-virtual {v8, v2, v3, v4, v5}, Landroid/graphics/drawable/GradientDrawable;->setBounds(IIII)V

    .line 214
    move-object/from16 v0, p1

    invoke-virtual {v8, v0}, Landroid/graphics/drawable/GradientDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 226
    .end local v8    # "gradient":Landroid/graphics/drawable/GradientDrawable;
    .end local v9    # "gradientMaxColor":I
    .end local v10    # "gradientMaxY":F
    .end local v11    # "gradientMinColor":I
    .end local v12    # "gradientMinY":F
    .end local v13    # "gradientStartColor":I
    .end local v14    # "gradientStopColor":I
    .end local v15    # "maxY":F
    .end local v16    # "minY":F
    :goto_f0
    return-void

    .line 199
    .restart local v9    # "gradientMaxColor":I
    .restart local v10    # "gradientMaxY":F
    .restart local v11    # "gradientMinColor":I
    .restart local v12    # "gradientMinY":F
    .restart local v13    # "gradientStartColor":I
    .restart local v14    # "gradientStopColor":I
    .restart local v15    # "maxY":F
    .restart local v16    # "minY":F
    :cond_f1
    sub-float v2, v15, v12

    sub-float v3, v15, v16

    div-float/2addr v2, v3

    move-object/from16 v0, p0

    invoke-virtual {v0, v11, v9, v2}, Lorg/achartengine/chart/BarChart;->getGradientPartialColor(IIF)I

    move-result v14

    goto :goto_a4

    .line 207
    :cond_fd
    sub-float v2, v10, v16

    sub-float v3, v15, v16

    div-float/2addr v2, v3

    move-object/from16 v0, p0

    invoke-virtual {v0, v9, v11, v2}, Lorg/achartengine/chart/BarChart;->getGradientPartialColor(IIF)I

    move-result v13

    goto :goto_c8

    .line 216
    .end local v9    # "gradientMaxColor":I
    .end local v10    # "gradientMaxY":F
    .end local v11    # "gradientMinColor":I
    .end local v12    # "gradientMinY":F
    .end local v13    # "gradientStartColor":I
    .end local v14    # "gradientStopColor":I
    .end local v15    # "maxY":F
    .end local v16    # "minY":F
    :cond_109
    sub-float v2, p3, p5

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    const/high16 v3, 0x3f800000    # 1.0f

    cmpg-float v2, v2, v3

    if-gez v2, :cond_11d

    .line 217
    cmpg-float v2, p3, p5

    if-gez v2, :cond_139

    .line 218
    const/high16 v2, 0x3f800000    # 1.0f

    add-float p5, p3, v2

    .line 223
    :cond_11d
    :goto_11d
    invoke-static/range {p2 .. p2}, Ljava/lang/Math;->round(F)I

    move-result v2

    int-to-float v3, v2

    invoke-static/range {p3 .. p3}, Ljava/lang/Math;->round(F)I

    move-result v2

    int-to-float v4, v2

    invoke-static/range {p4 .. p4}, Ljava/lang/Math;->round(F)I

    move-result v2

    int-to-float v5, v2

    invoke-static/range {p5 .. p5}, Ljava/lang/Math;->round(F)I

    move-result v2

    int-to-float v6, v2

    move-object/from16 v2, p1

    move-object/from16 v7, p8

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    goto :goto_f0

    .line 220
    :cond_139
    const/high16 v2, 0x3f800000    # 1.0f

    sub-float p5, p3, v2

    goto :goto_11d
.end method

.method protected drawChartValuesText(Landroid/graphics/Canvas;Lorg/achartengine/model/XYSeries;Lorg/achartengine/renderer/XYSeriesRenderer;Landroid/graphics/Paint;Ljava/util/List;II)V
    .registers 23
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
    .line 250
    .local p5, "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    iget-object v1, p0, Lorg/achartengine/chart/BarChart;->mDataset:Lorg/achartengine/model/XYMultipleSeriesDataset;

    invoke-virtual {v1}, Lorg/achartengine/model/XYMultipleSeriesDataset;->getSeriesCount()I

    move-result v12

    .line 251
    .local v12, "seriesNr":I
    invoke-interface/range {p5 .. p5}, Ljava/util/List;->size()I

    move-result v11

    .line 252
    .local v11, "length":I
    move-object/from16 v0, p5

    invoke-virtual {p0, v0, v11, v12}, Lorg/achartengine/chart/BarChart;->getHalfDiffX(Ljava/util/List;II)F

    move-result v8

    .line 253
    .local v8, "halfDiffX":F
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_11
    if-ge v9, v11, :cond_9c

    .line 254
    div-int/lit8 v1, v9, 0x2

    add-int v10, p7, v1

    .line 255
    .local v10, "index":I
    move-object/from16 v0, p2

    invoke-virtual {v0, v10}, Lorg/achartengine/model/XYSeries;->getY(I)D

    move-result-wide v13

    .line 256
    .local v13, "value":D
    invoke-virtual {p0, v13, v14}, Lorg/achartengine/chart/BarChart;->isNullValue(D)Z

    move-result v1

    if-nez v1, :cond_6b

    .line 257
    move-object/from16 v0, p5

    invoke-interface {v0, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v4

    .line 258
    .local v4, "x":F
    iget-object v1, p0, Lorg/achartengine/chart/BarChart;->mType:Lorg/achartengine/chart/BarChart$Type;

    sget-object v2, Lorg/achartengine/chart/BarChart$Type;->DEFAULT:Lorg/achartengine/chart/BarChart$Type;

    if-ne v1, v2, :cond_40

    .line 259
    mul-int/lit8 v1, p6, 0x2

    int-to-float v1, v1

    mul-float/2addr v1, v8

    int-to-float v2, v12

    const/high16 v3, 0x3fc00000    # 1.5f

    sub-float/2addr v2, v3

    mul-float/2addr v2, v8

    sub-float/2addr v1, v2

    add-float/2addr v4, v1

    .line 261
    :cond_40
    const-wide/16 v1, 0x0

    cmpl-double v1, v13, v1

    if-ltz v1, :cond_6e

    .line 262
    invoke-virtual/range {p3 .. p3}, Lorg/achartengine/renderer/XYSeriesRenderer;->getChartValuesFormat()Ljava/text/NumberFormat;

    move-result-object v1

    invoke-virtual {p0, v1, v13, v14}, Lorg/achartengine/chart/BarChart;->getLabel(Ljava/text/NumberFormat;D)Ljava/lang/String;

    move-result-object v3

    add-int/lit8 v1, v9, 0x1

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

    move-object/from16 v2, p1

    move-object/from16 v6, p4

    invoke-virtual/range {v1 .. v7}, Lorg/achartengine/chart/BarChart;->drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;F)V

    .line 253
    .end local v4    # "x":F
    :cond_6b
    :goto_6b
    add-int/lit8 v9, v9, 0x2

    goto :goto_11

    .line 265
    .restart local v4    # "x":F
    :cond_6e
    invoke-virtual/range {p3 .. p3}, Lorg/achartengine/renderer/XYSeriesRenderer;->getChartValuesFormat()Ljava/text/NumberFormat;

    move-result-object v1

    invoke-virtual {p0, v1, v13, v14}, Lorg/achartengine/chart/BarChart;->getLabel(Ljava/text/NumberFormat;D)Ljava/lang/String;

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

    move-object/from16 v2, p1

    move-object/from16 v6, p4

    invoke-virtual/range {v1 .. v7}, Lorg/achartengine/chart/BarChart;->drawText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;F)V

    goto :goto_6b

    .line 270
    .end local v4    # "x":F
    .end local v10    # "index":I
    .end local v13    # "value":D
    :cond_9c
    return-void
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
    .line 294
    const/high16 v6, 0x40c00000    # 6.0f

    .line 295
    .local v6, "halfShapeWidth":F
    sub-float v2, p4, v6

    const/high16 v0, 0x41400000    # 12.0f

    add-float v3, p3, v0

    add-float v4, p4, v6

    move-object v0, p1

    move v1, p3

    move-object v5, p6

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 296
    return-void
.end method

.method public drawSeries(Landroid/graphics/Canvas;Landroid/graphics/Paint;Ljava/util/List;Lorg/achartengine/renderer/XYSeriesRenderer;FII)V
    .registers 31
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
    .line 109
    .local p3, "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/achartengine/chart/BarChart;->mDataset:Lorg/achartengine/model/XYMultipleSeriesDataset;

    invoke-virtual {v3}, Lorg/achartengine/model/XYMultipleSeriesDataset;->getSeriesCount()I

    move-result v10

    .line 110
    .local v10, "seriesNr":I
    invoke-interface/range {p3 .. p3}, Ljava/util/List;->size()I

    move-result v22

    .line 111
    .local v22, "length":I
    invoke-virtual/range {p4 .. p4}, Lorg/achartengine/renderer/XYSeriesRenderer;->getColor()I

    move-result v3

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 112
    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 113
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move/from16 v2, v22

    invoke-virtual {v0, v1, v2, v10}, Lorg/achartengine/chart/BarChart;->getHalfDiffX(Ljava/util/List;II)F

    move-result v9

    .line 114
    .local v9, "halfDiffX":F
    const/16 v21, 0x0

    .local v21, "i":I
    :goto_28
    move/from16 v0, v21

    move/from16 v1, v22

    if-ge v0, v1, :cond_97

    .line 115
    move-object/from16 v0, p3

    move/from16 v1, v21

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v5

    .line 116
    .local v5, "x":F
    add-int/lit8 v3, v21, 0x1

    move-object/from16 v0, p3

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v8

    .line 118
    .local v8, "y":F
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/achartengine/chart/BarChart;->mType:Lorg/achartengine/chart/BarChart$Type;

    sget-object v4, Lorg/achartengine/chart/BarChart$Type;->HEAPED:Lorg/achartengine/chart/BarChart$Type;

    if-ne v3, v4, :cond_81

    if-lez p6, :cond_81

    .line 119
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/achartengine/chart/BarChart;->mPreviousSeriesPoints:Ljava/util/List;

    add-int/lit8 v4, v21, 0x1

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v6

    .line 120
    .local v6, "lastY":F
    sub-float v3, v6, p5

    add-float/2addr v8, v3

    .line 121
    add-int/lit8 v3, v21, 0x1

    invoke-static {v8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    move-object/from16 v0, p3

    invoke-interface {v0, v3, v4}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    move-object/from16 v3, p0

    move-object/from16 v4, p1

    move v7, v5

    move/from16 v11, p6

    move-object/from16 v12, p2

    .line 122
    invoke-virtual/range {v3 .. v12}, Lorg/achartengine/chart/BarChart;->drawBar(Landroid/graphics/Canvas;FFFFFIILandroid/graphics/Paint;)V

    .line 114
    .end local v6    # "lastY":F
    :goto_7e
    add-int/lit8 v21, v21, 0x2

    goto :goto_28

    :cond_81
    move-object/from16 v11, p0

    move-object/from16 v12, p1

    move v13, v5

    move/from16 v14, p5

    move v15, v5

    move/from16 v16, v8

    move/from16 v17, v9

    move/from16 v18, v10

    move/from16 v19, p6

    move-object/from16 v20, p2

    .line 124
    invoke-virtual/range {v11 .. v20}, Lorg/achartengine/chart/BarChart;->drawBar(Landroid/graphics/Canvas;FFFFFIILandroid/graphics/Paint;)V

    goto :goto_7e

    .line 127
    .end local v5    # "x":F
    .end local v8    # "y":F
    :cond_97
    invoke-virtual/range {p4 .. p4}, Lorg/achartengine/renderer/XYSeriesRenderer;->getColor()I

    move-result v3

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 128
    move-object/from16 v0, p3

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/achartengine/chart/BarChart;->mPreviousSeriesPoints:Ljava/util/List;

    .line 129
    return-void
.end method

.method public getChartType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 360
    const-string v0, "Bar"

    return-object v0
.end method

.method protected getCoeficient()F
    .registers 2

    .prologue
    .line 333
    const/high16 v0, 0x3f800000    # 1.0f

    return v0
.end method

.method public getDefaultMinimum()D
    .registers 3

    .prologue
    .line 351
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method protected getGradientPartialColor(IIF)I
    .registers 12
    .param p1, "minColor"    # I
    .param p2, "maxColor"    # I
    .param p3, "fraction"    # F

    .prologue
    const/high16 v7, 0x3f800000    # 1.0f

    .line 229
    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    move-result v4

    int-to-float v4, v4

    mul-float/2addr v4, p3

    sub-float v5, v7, p3

    invoke-static {p2}, Landroid/graphics/Color;->alpha(I)I

    move-result v6

    int-to-float v6, v6

    mul-float/2addr v5, v6

    add-float/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v0

    .line 231
    .local v0, "alpha":I
    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    move-result v4

    int-to-float v4, v4

    mul-float/2addr v4, p3

    sub-float v5, v7, p3

    invoke-static {p2}, Landroid/graphics/Color;->red(I)I

    move-result v6

    int-to-float v6, v6

    mul-float/2addr v5, v6

    add-float/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v3

    .line 232
    .local v3, "r":I
    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    move-result v4

    int-to-float v4, v4

    mul-float/2addr v4, p3

    sub-float v5, v7, p3

    invoke-static {p2}, Landroid/graphics/Color;->green(I)I

    move-result v6

    int-to-float v6, v6

    mul-float/2addr v5, v6

    add-float/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v2

    .line 233
    .local v2, "g":I
    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    move-result v4

    int-to-float v4, v4

    mul-float/2addr v4, p3

    sub-float v5, v7, p3

    invoke-static {p2}, Landroid/graphics/Color;->blue(I)I

    move-result v6

    int-to-float v6, v6

    mul-float/2addr v5, v6

    add-float/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v1

    .line 234
    .local v1, "b":I
    invoke-static {v0, v3, v2, v1}, Landroid/graphics/Color;->argb(IIII)I

    move-result v4

    return v4
.end method

.method protected getHalfDiffX(Ljava/util/List;II)F
    .registers 15
    .param p2, "length"    # I
    .param p3, "seriesNr"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Float;",
            ">;II)F"
        }
    .end annotation

    .prologue
    .local p1, "points":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    const/4 v5, 0x0

    .line 308
    iget-object v3, p0, Lorg/achartengine/chart/BarChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v3}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getBarWidth()F

    move-result v0

    .line 309
    .local v0, "barWidth":F
    cmpl-float v3, v0, v5

    if-lez v3, :cond_10

    .line 310
    const/high16 v3, 0x40000000    # 2.0f

    div-float v3, v0, v3

    .line 324
    :goto_f
    return v3

    .line 312
    :cond_10
    move v1, p2

    .line 313
    .local v1, "div":I
    const/4 v3, 0x2

    if-le p2, v3, :cond_16

    .line 314
    add-int/lit8 v1, p2, -0x2

    .line 316
    :cond_16
    add-int/lit8 v3, p2, -0x2

    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v4

    const/4 v3, 0x0

    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    sub-float v3, v4, v3

    int-to-float v4, v1

    div-float v2, v3, v4

    .line 317
    .local v2, "halfDiffX":F
    cmpl-float v3, v2, v5

    if-nez v3, :cond_38

    .line 318
    const/high16 v2, 0x41200000    # 10.0f

    .line 321
    :cond_38
    iget-object v3, p0, Lorg/achartengine/chart/BarChart;->mType:Lorg/achartengine/chart/BarChart$Type;

    sget-object v4, Lorg/achartengine/chart/BarChart$Type;->STACKED:Lorg/achartengine/chart/BarChart$Type;

    if-eq v3, v4, :cond_46

    iget-object v3, p0, Lorg/achartengine/chart/BarChart;->mType:Lorg/achartengine/chart/BarChart$Type;

    sget-object v4, Lorg/achartengine/chart/BarChart$Type;->HEAPED:Lorg/achartengine/chart/BarChart$Type;

    if-eq v3, v4, :cond_46

    .line 322
    int-to-float v3, p3

    div-float/2addr v2, v3

    .line 324
    :cond_46
    float-to-double v3, v2

    invoke-virtual {p0}, Lorg/achartengine/chart/BarChart;->getCoeficient()F

    move-result v5

    float-to-double v5, v5

    const-wide/high16 v7, 0x3ff0000000000000L    # 1.0

    iget-object v9, p0, Lorg/achartengine/chart/BarChart;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v9}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getBarSpacing()D

    move-result-wide v9

    add-double/2addr v7, v9

    mul-double/2addr v5, v7

    div-double/2addr v3, v5

    double-to-float v3, v3

    goto :goto_f
.end method

.method public getLegendShapeWidth(I)I
    .registers 3
    .param p1, "seriesIndex"    # I

    .prologue
    .line 279
    const/16 v0, 0xc

    return v0
.end method

.method protected isRenderNullValues()Z
    .registers 2

    .prologue
    .line 342
    const/4 v0, 0x1

    return v0
.end method
