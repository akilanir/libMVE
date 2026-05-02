.class public Lcom/jjoe64/graphview/series/PointsGraphSeries;
.super Lcom/jjoe64/graphview/series/BaseSeries;
.source "PointsGraphSeries.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/jjoe64/graphview/series/PointsGraphSeries$Styles;,
        Lcom/jjoe64/graphview/series/PointsGraphSeries$Shape;,
        Lcom/jjoe64/graphview/series/PointsGraphSeries$CustomShape;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E::",
        "Lcom/jjoe64/graphview/series/DataPointInterface;",
        ">",
        "Lcom/jjoe64/graphview/series/BaseSeries",
        "<TE;>;"
    }
.end annotation


# instance fields
.field private mCustomShape:Lcom/jjoe64/graphview/series/PointsGraphSeries$CustomShape;

.field private mPaint:Landroid/graphics/Paint;

.field private mStyles:Lcom/jjoe64/graphview/series/PointsGraphSeries$Styles;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/jjoe64/graphview/series/PointsGraphSeries",
            "<TE;>.Styles;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 117
    .local p0, "this":Lcom/jjoe64/graphview/series/PointsGraphSeries;, "Lcom/jjoe64/graphview/series/PointsGraphSeries<TE;>;"
    invoke-direct {p0}, Lcom/jjoe64/graphview/series/BaseSeries;-><init>()V

    .line 118
    invoke-virtual {p0}, Lcom/jjoe64/graphview/series/PointsGraphSeries;->init()V

    .line 119
    return-void
.end method

.method public constructor <init>([Lcom/jjoe64/graphview/series/DataPointInterface;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TE;)V"
        }
    .end annotation

    .prologue
    .line 127
    .local p0, "this":Lcom/jjoe64/graphview/series/PointsGraphSeries;, "Lcom/jjoe64/graphview/series/PointsGraphSeries<TE;>;"
    .local p1, "data":[Lcom/jjoe64/graphview/series/DataPointInterface;, "[TE;"
    invoke-direct {p0, p1}, Lcom/jjoe64/graphview/series/BaseSeries;-><init>([Lcom/jjoe64/graphview/series/DataPointInterface;)V

    .line 128
    invoke-virtual {p0}, Lcom/jjoe64/graphview/series/PointsGraphSeries;->init()V

    .line 129
    return-void
.end method

.method private drawArrows([Landroid/graphics/Point;Landroid/graphics/Canvas;Landroid/graphics/Paint;)V
    .registers 20
    .param p1, "point"    # [Landroid/graphics/Point;
    .param p2, "canvas"    # Landroid/graphics/Canvas;
    .param p3, "paint"    # Landroid/graphics/Paint;

    .prologue
    .line 249
    .local p0, "this":Lcom/jjoe64/graphview/series/PointsGraphSeries;, "Lcom/jjoe64/graphview/series/PointsGraphSeries<TE;>;"
    const/16 v2, 0x8

    new-array v5, v2, [F

    .line 250
    .local v5, "points":[F
    const/4 v2, 0x0

    const/4 v3, 0x0

    aget-object v3, p1, v3

    iget v3, v3, Landroid/graphics/Point;->x:I

    int-to-float v3, v3

    aput v3, v5, v2

    .line 251
    const/4 v2, 0x1

    const/4 v3, 0x0

    aget-object v3, p1, v3

    iget v3, v3, Landroid/graphics/Point;->y:I

    int-to-float v3, v3

    aput v3, v5, v2

    .line 252
    const/4 v2, 0x2

    const/4 v3, 0x1

    aget-object v3, p1, v3

    iget v3, v3, Landroid/graphics/Point;->x:I

    int-to-float v3, v3

    aput v3, v5, v2

    .line 253
    const/4 v2, 0x3

    const/4 v3, 0x1

    aget-object v3, p1, v3

    iget v3, v3, Landroid/graphics/Point;->y:I

    int-to-float v3, v3

    aput v3, v5, v2

    .line 254
    const/4 v2, 0x4

    const/4 v3, 0x2

    aget-object v3, p1, v3

    iget v3, v3, Landroid/graphics/Point;->x:I

    int-to-float v3, v3

    aput v3, v5, v2

    .line 255
    const/4 v2, 0x5

    const/4 v3, 0x2

    aget-object v3, p1, v3

    iget v3, v3, Landroid/graphics/Point;->y:I

    int-to-float v3, v3

    aput v3, v5, v2

    .line 256
    const/4 v2, 0x6

    const/4 v3, 0x0

    aget-object v3, p1, v3

    iget v3, v3, Landroid/graphics/Point;->x:I

    int-to-float v3, v3

    aput v3, v5, v2

    .line 257
    const/4 v2, 0x7

    const/4 v3, 0x0

    aget-object v3, p1, v3

    iget v3, v3, Landroid/graphics/Point;->y:I

    int-to-float v3, v3

    aput v3, v5, v2

    .line 259
    sget-object v3, Landroid/graphics/Canvas$VertexMode;->TRIANGLES:Landroid/graphics/Canvas$VertexMode;

    const/16 v4, 0x8

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    move-object/from16 v2, p2

    move-object/from16 v14, p3

    invoke-virtual/range {v2 .. v14}, Landroid/graphics/Canvas;->drawVertices(Landroid/graphics/Canvas$VertexMode;I[FI[FI[II[SIILandroid/graphics/Paint;)V

    .line 260
    new-instance v15, Landroid/graphics/Path;

    invoke-direct {v15}, Landroid/graphics/Path;-><init>()V

    .line 261
    .local v15, "path":Landroid/graphics/Path;
    const/4 v2, 0x0

    aget-object v2, p1, v2

    iget v2, v2, Landroid/graphics/Point;->x:I

    int-to-float v2, v2

    const/4 v3, 0x0

    aget-object v3, p1, v3

    iget v3, v3, Landroid/graphics/Point;->y:I

    int-to-float v3, v3

    invoke-virtual {v15, v2, v3}, Landroid/graphics/Path;->moveTo(FF)V

    .line 262
    const/4 v2, 0x1

    aget-object v2, p1, v2

    iget v2, v2, Landroid/graphics/Point;->x:I

    int-to-float v2, v2

    const/4 v3, 0x1

    aget-object v3, p1, v3

    iget v3, v3, Landroid/graphics/Point;->y:I

    int-to-float v3, v3

    invoke-virtual {v15, v2, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 263
    const/4 v2, 0x2

    aget-object v2, p1, v2

    iget v2, v2, Landroid/graphics/Point;->x:I

    int-to-float v2, v2

    const/4 v3, 0x2

    aget-object v3, p1, v3

    iget v3, v3, Landroid/graphics/Point;->y:I

    int-to-float v3, v3

    invoke-virtual {v15, v2, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 264
    move-object/from16 v0, p2

    move-object/from16 v1, p3

    invoke-virtual {v0, v15, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 265
    return-void
.end method


# virtual methods
.method public draw(Lcom/jjoe64/graphview/GraphView;Landroid/graphics/Canvas;Z)V
    .registers 62
    .param p1, "graphView"    # Lcom/jjoe64/graphview/GraphView;
    .param p2, "canvas"    # Landroid/graphics/Canvas;
    .param p3, "isSecondScale"    # Z

    .prologue
    .line 152
    .local p0, "this":Lcom/jjoe64/graphview/series/PointsGraphSeries;, "Lcom/jjoe64/graphview/series/PointsGraphSeries<TE;>;"
    invoke-virtual/range {p0 .. p0}, Lcom/jjoe64/graphview/series/PointsGraphSeries;->resetDataPoints()V

    .line 155
    invoke-virtual/range {p1 .. p1}, Lcom/jjoe64/graphview/GraphView;->getViewport()Lcom/jjoe64/graphview/Viewport;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Lcom/jjoe64/graphview/Viewport;->getMaxX(Z)D

    move-result-wide v31

    .line 156
    .local v31, "maxX":D
    invoke-virtual/range {p1 .. p1}, Lcom/jjoe64/graphview/GraphView;->getViewport()Lcom/jjoe64/graphview/Viewport;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Lcom/jjoe64/graphview/Viewport;->getMinX(Z)D

    move-result-wide v35

    .line 160
    .local v35, "minX":D
    if-eqz p3, :cond_dc

    .line 161
    invoke-virtual/range {p1 .. p1}, Lcom/jjoe64/graphview/GraphView;->getSecondScale()Lcom/jjoe64/graphview/SecondScale;

    move-result-object v5

    invoke-virtual {v5}, Lcom/jjoe64/graphview/SecondScale;->getMaxY()D

    move-result-wide v33

    .line 162
    .local v33, "maxY":D
    invoke-virtual/range {p1 .. p1}, Lcom/jjoe64/graphview/GraphView;->getSecondScale()Lcom/jjoe64/graphview/SecondScale;

    move-result-object v5

    invoke-virtual {v5}, Lcom/jjoe64/graphview/SecondScale;->getMinY()D

    move-result-wide v37

    .line 168
    .local v37, "minY":D
    :goto_27
    move-object/from16 v0, p0

    move-wide/from16 v1, v35

    move-wide/from16 v3, v31

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/jjoe64/graphview/series/PointsGraphSeries;->getValues(DD)Ljava/util/Iterator;

    move-result-object v53

    .line 171
    .local v53, "values":Ljava/util/Iterator;, "Ljava/util/Iterator<TE;>;"
    const-wide/16 v29, 0x0

    .line 172
    .local v29, "lastEndY":D
    const-wide/16 v27, 0x0

    .line 175
    .local v27, "lastEndX":D
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/jjoe64/graphview/series/PointsGraphSeries;->mPaint:Landroid/graphics/Paint;

    invoke-virtual/range {p0 .. p0}, Lcom/jjoe64/graphview/series/PointsGraphSeries;->getColor()I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setColor(I)V

    .line 177
    sub-double v19, v33, v37

    .line 178
    .local v19, "diffY":D
    sub-double v17, v31, v35

    .line 180
    .local v17, "diffX":D
    invoke-virtual/range {p1 .. p1}, Lcom/jjoe64/graphview/GraphView;->getGraphContentHeight()I

    move-result v5

    int-to-float v0, v5

    move/from16 v22, v0

    .line 181
    .local v22, "graphHeight":F
    invoke-virtual/range {p1 .. p1}, Lcom/jjoe64/graphview/GraphView;->getGraphContentWidth()I

    move-result v5

    int-to-float v0, v5

    move/from16 v25, v0

    .line 182
    .local v25, "graphWidth":F
    invoke-virtual/range {p1 .. p1}, Lcom/jjoe64/graphview/GraphView;->getGraphContentLeft()I

    move-result v5

    int-to-float v0, v5

    move/from16 v23, v0

    .line 183
    .local v23, "graphLeft":F
    invoke-virtual/range {p1 .. p1}, Lcom/jjoe64/graphview/GraphView;->getGraphContentTop()I

    move-result v5

    int-to-float v0, v5

    move/from16 v24, v0

    .line 185
    .local v24, "graphTop":F
    const-wide/16 v29, 0x0

    .line 186
    const-wide/16 v27, 0x0

    .line 187
    const/16 v21, 0x0

    .line 188
    .local v21, "firstX":F
    const/16 v26, 0x0

    .line 189
    .local v26, "i":I
    :goto_68
    invoke-interface/range {v53 .. v53}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1a7

    .line 190
    invoke-interface/range {v53 .. v53}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/jjoe64/graphview/series/DataPointInterface;

    .line 192
    .local v10, "value":Lcom/jjoe64/graphview/series/DataPointInterface;, "TE;"
    invoke-interface {v10}, Lcom/jjoe64/graphview/series/DataPointInterface;->getY()D

    move-result-wide v5

    sub-double v51, v5, v37

    .line 193
    .local v51, "valY":D
    div-double v47, v51, v19

    .line 194
    .local v47, "ratY":D
    move/from16 v0, v22

    float-to-double v5, v0

    mul-double v56, v5, v47

    .line 196
    .local v56, "y":D
    invoke-interface {v10}, Lcom/jjoe64/graphview/series/DataPointInterface;->getX()D

    move-result-wide v5

    sub-double v49, v5, v35

    .line 197
    .local v49, "valX":D
    div-double v45, v49, v17

    .line 198
    .local v45, "ratX":D
    move/from16 v0, v25

    float-to-double v5, v0

    mul-double v54, v5, v45

    .line 200
    .local v54, "x":D
    move-wide/from16 v39, v54

    .line 201
    .local v39, "orgX":D
    move-wide/from16 v41, v56

    .line 204
    .local v41, "orgY":D
    const/16 v43, 0x0

    .line 205
    .local v43, "overdraw":Z
    move/from16 v0, v25

    float-to-double v5, v0

    cmpl-double v5, v54, v5

    if-lez v5, :cond_9d

    .line 206
    const/16 v43, 0x1

    .line 208
    :cond_9d
    const-wide/16 v5, 0x0

    cmpg-double v5, v56, v5

    if-gez v5, :cond_a5

    .line 209
    const/16 v43, 0x1

    .line 211
    :cond_a5
    move/from16 v0, v22

    float-to-double v5, v0

    cmpl-double v5, v56, v5

    if-lez v5, :cond_ae

    .line 212
    const/16 v43, 0x1

    .line 215
    :cond_ae
    move-wide/from16 v0, v54

    double-to-float v5, v0

    const/high16 v6, 0x3f800000    # 1.0f

    add-float v6, v6, v23

    add-float v8, v5, v6

    .line 216
    .local v8, "endX":F
    move/from16 v0, v24

    float-to-double v5, v0

    sub-double v5, v5, v56

    double-to-float v5, v5

    add-float v9, v5, v22

    .line 217
    .local v9, "endY":F
    move-object/from16 v0, p0

    invoke-virtual {v0, v8, v9, v10}, Lcom/jjoe64/graphview/series/PointsGraphSeries;->registerDataPoint(FFLcom/jjoe64/graphview/series/DataPointInterface;)V

    .line 220
    if-nez v43, :cond_d9

    .line 221
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/jjoe64/graphview/series/PointsGraphSeries;->mCustomShape:Lcom/jjoe64/graphview/series/PointsGraphSeries$CustomShape;

    if-eqz v5, :cond_f0

    .line 222
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/jjoe64/graphview/series/PointsGraphSeries;->mCustomShape:Lcom/jjoe64/graphview/series/PointsGraphSeries$CustomShape;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/jjoe64/graphview/series/PointsGraphSeries;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v6, p2

    invoke-interface/range {v5 .. v10}, Lcom/jjoe64/graphview/series/PointsGraphSeries$CustomShape;->draw(Landroid/graphics/Canvas;Landroid/graphics/Paint;FFLcom/jjoe64/graphview/series/DataPointInterface;)V

    .line 236
    :cond_d9
    :goto_d9
    add-int/lit8 v26, v26, 0x1

    .line 237
    goto :goto_68

    .line 164
    .end local v8    # "endX":F
    .end local v9    # "endY":F
    .end local v10    # "value":Lcom/jjoe64/graphview/series/DataPointInterface;, "TE;"
    .end local v17    # "diffX":D
    .end local v19    # "diffY":D
    .end local v21    # "firstX":F
    .end local v22    # "graphHeight":F
    .end local v23    # "graphLeft":F
    .end local v24    # "graphTop":F
    .end local v25    # "graphWidth":F
    .end local v26    # "i":I
    .end local v27    # "lastEndX":D
    .end local v29    # "lastEndY":D
    .end local v33    # "maxY":D
    .end local v37    # "minY":D
    .end local v39    # "orgX":D
    .end local v41    # "orgY":D
    .end local v43    # "overdraw":Z
    .end local v45    # "ratX":D
    .end local v47    # "ratY":D
    .end local v49    # "valX":D
    .end local v51    # "valY":D
    .end local v53    # "values":Ljava/util/Iterator;, "Ljava/util/Iterator<TE;>;"
    .end local v54    # "x":D
    .end local v56    # "y":D
    :cond_dc
    invoke-virtual/range {p1 .. p1}, Lcom/jjoe64/graphview/GraphView;->getViewport()Lcom/jjoe64/graphview/Viewport;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Lcom/jjoe64/graphview/Viewport;->getMaxY(Z)D

    move-result-wide v33

    .line 165
    .restart local v33    # "maxY":D
    invoke-virtual/range {p1 .. p1}, Lcom/jjoe64/graphview/GraphView;->getViewport()Lcom/jjoe64/graphview/Viewport;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Lcom/jjoe64/graphview/Viewport;->getMinY(Z)D

    move-result-wide v37

    .restart local v37    # "minY":D
    goto/16 :goto_27

    .line 223
    .restart local v8    # "endX":F
    .restart local v9    # "endY":F
    .restart local v10    # "value":Lcom/jjoe64/graphview/series/DataPointInterface;, "TE;"
    .restart local v17    # "diffX":D
    .restart local v19    # "diffY":D
    .restart local v21    # "firstX":F
    .restart local v22    # "graphHeight":F
    .restart local v23    # "graphLeft":F
    .restart local v24    # "graphTop":F
    .restart local v25    # "graphWidth":F
    .restart local v26    # "i":I
    .restart local v27    # "lastEndX":D
    .restart local v29    # "lastEndY":D
    .restart local v39    # "orgX":D
    .restart local v41    # "orgY":D
    .restart local v43    # "overdraw":Z
    .restart local v45    # "ratX":D
    .restart local v47    # "ratY":D
    .restart local v49    # "valX":D
    .restart local v51    # "valY":D
    .restart local v53    # "values":Ljava/util/Iterator;, "Ljava/util/Iterator<TE;>;"
    .restart local v54    # "x":D
    .restart local v56    # "y":D
    :cond_f0
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/jjoe64/graphview/series/PointsGraphSeries;->mStyles:Lcom/jjoe64/graphview/series/PointsGraphSeries$Styles;

    iget-object v5, v5, Lcom/jjoe64/graphview/series/PointsGraphSeries$Styles;->shape:Lcom/jjoe64/graphview/series/PointsGraphSeries$Shape;

    sget-object v6, Lcom/jjoe64/graphview/series/PointsGraphSeries$Shape;->POINT:Lcom/jjoe64/graphview/series/PointsGraphSeries$Shape;

    if-ne v5, v6, :cond_10a

    .line 224
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/jjoe64/graphview/series/PointsGraphSeries;->mStyles:Lcom/jjoe64/graphview/series/PointsGraphSeries$Styles;

    iget v5, v5, Lcom/jjoe64/graphview/series/PointsGraphSeries$Styles;->size:F

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/jjoe64/graphview/series/PointsGraphSeries;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p2

    invoke-virtual {v0, v8, v9, v5, v6}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto :goto_d9

    .line 225
    :cond_10a
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/jjoe64/graphview/series/PointsGraphSeries;->mStyles:Lcom/jjoe64/graphview/series/PointsGraphSeries$Styles;

    iget-object v5, v5, Lcom/jjoe64/graphview/series/PointsGraphSeries$Styles;->shape:Lcom/jjoe64/graphview/series/PointsGraphSeries$Shape;

    sget-object v6, Lcom/jjoe64/graphview/series/PointsGraphSeries$Shape;->RECTANGLE:Lcom/jjoe64/graphview/series/PointsGraphSeries$Shape;

    if-ne v5, v6, :cond_140

    .line 226
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/jjoe64/graphview/series/PointsGraphSeries;->mStyles:Lcom/jjoe64/graphview/series/PointsGraphSeries$Styles;

    iget v5, v5, Lcom/jjoe64/graphview/series/PointsGraphSeries$Styles;->size:F

    sub-float v12, v8, v5

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/jjoe64/graphview/series/PointsGraphSeries;->mStyles:Lcom/jjoe64/graphview/series/PointsGraphSeries$Styles;

    iget v5, v5, Lcom/jjoe64/graphview/series/PointsGraphSeries$Styles;->size:F

    sub-float v13, v9, v5

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/jjoe64/graphview/series/PointsGraphSeries;->mStyles:Lcom/jjoe64/graphview/series/PointsGraphSeries$Styles;

    iget v5, v5, Lcom/jjoe64/graphview/series/PointsGraphSeries$Styles;->size:F

    add-float v14, v8, v5

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/jjoe64/graphview/series/PointsGraphSeries;->mStyles:Lcom/jjoe64/graphview/series/PointsGraphSeries$Styles;

    iget v5, v5, Lcom/jjoe64/graphview/series/PointsGraphSeries$Styles;->size:F

    add-float v15, v9, v5

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/series/PointsGraphSeries;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v16, v0

    move-object/from16 v11, p2

    invoke-virtual/range {v11 .. v16}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    goto :goto_d9

    .line 227
    :cond_140
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/jjoe64/graphview/series/PointsGraphSeries;->mStyles:Lcom/jjoe64/graphview/series/PointsGraphSeries$Styles;

    iget-object v5, v5, Lcom/jjoe64/graphview/series/PointsGraphSeries$Styles;->shape:Lcom/jjoe64/graphview/series/PointsGraphSeries$Shape;

    sget-object v6, Lcom/jjoe64/graphview/series/PointsGraphSeries$Shape;->TRIANGLE:Lcom/jjoe64/graphview/series/PointsGraphSeries$Shape;

    if-ne v5, v6, :cond_d9

    .line 228
    const/4 v5, 0x3

    new-array v0, v5, [Landroid/graphics/Point;

    move-object/from16 v44, v0

    .line 229
    .local v44, "points":[Landroid/graphics/Point;
    const/4 v5, 0x0

    new-instance v6, Landroid/graphics/Point;

    float-to-int v7, v8

    invoke-virtual/range {p0 .. p0}, Lcom/jjoe64/graphview/series/PointsGraphSeries;->getSize()F

    move-result v11

    sub-float v11, v9, v11

    float-to-int v11, v11

    invoke-direct {v6, v7, v11}, Landroid/graphics/Point;-><init>(II)V

    aput-object v6, v44, v5

    .line 230
    const/4 v5, 0x1

    new-instance v6, Landroid/graphics/Point;

    invoke-virtual/range {p0 .. p0}, Lcom/jjoe64/graphview/series/PointsGraphSeries;->getSize()F

    move-result v7

    add-float/2addr v7, v8

    float-to-int v7, v7

    float-to-double v11, v9

    invoke-virtual/range {p0 .. p0}, Lcom/jjoe64/graphview/series/PointsGraphSeries;->getSize()F

    move-result v13

    float-to-double v13, v13

    const-wide v15, 0x3fe570a3d70a3d71L    # 0.67

    mul-double/2addr v13, v15

    add-double/2addr v11, v13

    double-to-int v11, v11

    invoke-direct {v6, v7, v11}, Landroid/graphics/Point;-><init>(II)V

    aput-object v6, v44, v5

    .line 231
    const/4 v5, 0x2

    new-instance v6, Landroid/graphics/Point;

    invoke-virtual/range {p0 .. p0}, Lcom/jjoe64/graphview/series/PointsGraphSeries;->getSize()F

    move-result v7

    sub-float v7, v8, v7

    float-to-int v7, v7

    float-to-double v11, v9

    invoke-virtual/range {p0 .. p0}, Lcom/jjoe64/graphview/series/PointsGraphSeries;->getSize()F

    move-result v13

    float-to-double v13, v13

    const-wide v15, 0x3fe570a3d70a3d71L    # 0.67

    mul-double/2addr v13, v15

    add-double/2addr v11, v13

    double-to-int v11, v11

    invoke-direct {v6, v7, v11}, Landroid/graphics/Point;-><init>(II)V

    aput-object v6, v44, v5

    .line 232
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/jjoe64/graphview/series/PointsGraphSeries;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    move-object/from16 v1, v44

    move-object/from16 v2, p2

    invoke-direct {v0, v1, v2, v5}, Lcom/jjoe64/graphview/series/PointsGraphSeries;->drawArrows([Landroid/graphics/Point;Landroid/graphics/Canvas;Landroid/graphics/Paint;)V

    goto/16 :goto_d9

    .line 239
    .end local v8    # "endX":F
    .end local v9    # "endY":F
    .end local v10    # "value":Lcom/jjoe64/graphview/series/DataPointInterface;, "TE;"
    .end local v39    # "orgX":D
    .end local v41    # "orgY":D
    .end local v43    # "overdraw":Z
    .end local v44    # "points":[Landroid/graphics/Point;
    .end local v45    # "ratX":D
    .end local v47    # "ratY":D
    .end local v49    # "valX":D
    .end local v51    # "valY":D
    .end local v54    # "x":D
    .end local v56    # "y":D
    :cond_1a7
    return-void
.end method

.method public getShape()Lcom/jjoe64/graphview/series/PointsGraphSeries$Shape;
    .registers 2

    .prologue
    .line 293
    .local p0, "this":Lcom/jjoe64/graphview/series/PointsGraphSeries;, "Lcom/jjoe64/graphview/series/PointsGraphSeries<TE;>;"
    iget-object v0, p0, Lcom/jjoe64/graphview/series/PointsGraphSeries;->mStyles:Lcom/jjoe64/graphview/series/PointsGraphSeries$Styles;

    iget-object v0, v0, Lcom/jjoe64/graphview/series/PointsGraphSeries$Styles;->shape:Lcom/jjoe64/graphview/series/PointsGraphSeries$Shape;

    return-object v0
.end method

.method public getSize()F
    .registers 2

    .prologue
    .line 275
    .local p0, "this":Lcom/jjoe64/graphview/series/PointsGraphSeries;, "Lcom/jjoe64/graphview/series/PointsGraphSeries<TE;>;"
    iget-object v0, p0, Lcom/jjoe64/graphview/series/PointsGraphSeries;->mStyles:Lcom/jjoe64/graphview/series/PointsGraphSeries$Styles;

    iget v0, v0, Lcom/jjoe64/graphview/series/PointsGraphSeries$Styles;->size:F

    return v0
.end method

.method protected init()V
    .registers 3

    .prologue
    .line 136
    .local p0, "this":Lcom/jjoe64/graphview/series/PointsGraphSeries;, "Lcom/jjoe64/graphview/series/PointsGraphSeries<TE;>;"
    new-instance v0, Lcom/jjoe64/graphview/series/PointsGraphSeries$Styles;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/jjoe64/graphview/series/PointsGraphSeries$Styles;-><init>(Lcom/jjoe64/graphview/series/PointsGraphSeries;Lcom/jjoe64/graphview/series/PointsGraphSeries$1;)V

    iput-object v0, p0, Lcom/jjoe64/graphview/series/PointsGraphSeries;->mStyles:Lcom/jjoe64/graphview/series/PointsGraphSeries$Styles;

    .line 137
    iget-object v0, p0, Lcom/jjoe64/graphview/series/PointsGraphSeries;->mStyles:Lcom/jjoe64/graphview/series/PointsGraphSeries$Styles;

    const/high16 v1, 0x41a00000    # 20.0f

    iput v1, v0, Lcom/jjoe64/graphview/series/PointsGraphSeries$Styles;->size:F

    .line 138
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/jjoe64/graphview/series/PointsGraphSeries;->mPaint:Landroid/graphics/Paint;

    .line 139
    iget-object v0, p0, Lcom/jjoe64/graphview/series/PointsGraphSeries;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 140
    sget-object v0, Lcom/jjoe64/graphview/series/PointsGraphSeries$Shape;->POINT:Lcom/jjoe64/graphview/series/PointsGraphSeries$Shape;

    invoke-virtual {p0, v0}, Lcom/jjoe64/graphview/series/PointsGraphSeries;->setShape(Lcom/jjoe64/graphview/series/PointsGraphSeries$Shape;)V

    .line 141
    return-void
.end method

.method public setCustomShape(Lcom/jjoe64/graphview/series/PointsGraphSeries$CustomShape;)V
    .registers 2
    .param p1, "shape"    # Lcom/jjoe64/graphview/series/PointsGraphSeries$CustomShape;

    .prologue
    .line 310
    .local p0, "this":Lcom/jjoe64/graphview/series/PointsGraphSeries;, "Lcom/jjoe64/graphview/series/PointsGraphSeries<TE;>;"
    iput-object p1, p0, Lcom/jjoe64/graphview/series/PointsGraphSeries;->mCustomShape:Lcom/jjoe64/graphview/series/PointsGraphSeries$CustomShape;

    .line 311
    return-void
.end method

.method public setShape(Lcom/jjoe64/graphview/series/PointsGraphSeries$Shape;)V
    .registers 3
    .param p1, "s"    # Lcom/jjoe64/graphview/series/PointsGraphSeries$Shape;

    .prologue
    .line 300
    .local p0, "this":Lcom/jjoe64/graphview/series/PointsGraphSeries;, "Lcom/jjoe64/graphview/series/PointsGraphSeries<TE;>;"
    iget-object v0, p0, Lcom/jjoe64/graphview/series/PointsGraphSeries;->mStyles:Lcom/jjoe64/graphview/series/PointsGraphSeries$Styles;

    iput-object p1, v0, Lcom/jjoe64/graphview/series/PointsGraphSeries$Styles;->shape:Lcom/jjoe64/graphview/series/PointsGraphSeries$Shape;

    .line 301
    return-void
.end method

.method public setSize(F)V
    .registers 3
    .param p1, "radius"    # F

    .prologue
    .line 286
    .local p0, "this":Lcom/jjoe64/graphview/series/PointsGraphSeries;, "Lcom/jjoe64/graphview/series/PointsGraphSeries<TE;>;"
    iget-object v0, p0, Lcom/jjoe64/graphview/series/PointsGraphSeries;->mStyles:Lcom/jjoe64/graphview/series/PointsGraphSeries$Styles;

    iput p1, v0, Lcom/jjoe64/graphview/series/PointsGraphSeries$Styles;->size:F

    .line 287
    return-void
.end method
