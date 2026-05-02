.class public Lcom/jjoe64/graphview/series/LineGraphSeries;
.super Lcom/jjoe64/graphview/series/BaseSeries;
.source "LineGraphSeries.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;
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
.field private mCustomPaint:Landroid/graphics/Paint;

.field private mPaint:Landroid/graphics/Paint;

.field private mPaintBackground:Landroid/graphics/Paint;

.field private mPath:Landroid/graphics/Path;

.field private mPathBackground:Landroid/graphics/Path;

.field private mStyles:Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/jjoe64/graphview/series/LineGraphSeries",
            "<TE;>.Styles;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 116
    .local p0, "this":Lcom/jjoe64/graphview/series/LineGraphSeries;, "Lcom/jjoe64/graphview/series/LineGraphSeries<TE;>;"
    invoke-direct {p0}, Lcom/jjoe64/graphview/series/BaseSeries;-><init>()V

    .line 117
    invoke-virtual {p0}, Lcom/jjoe64/graphview/series/LineGraphSeries;->init()V

    .line 118
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
    .line 126
    .local p0, "this":Lcom/jjoe64/graphview/series/LineGraphSeries;, "Lcom/jjoe64/graphview/series/LineGraphSeries<TE;>;"
    .local p1, "data":[Lcom/jjoe64/graphview/series/DataPointInterface;, "[TE;"
    invoke-direct {p0, p1}, Lcom/jjoe64/graphview/series/BaseSeries;-><init>([Lcom/jjoe64/graphview/series/DataPointInterface;)V

    .line 127
    invoke-virtual {p0}, Lcom/jjoe64/graphview/series/LineGraphSeries;->init()V

    .line 128
    return-void
.end method


# virtual methods
.method public draw(Lcom/jjoe64/graphview/GraphView;Landroid/graphics/Canvas;Z)V
    .registers 63
    .param p1, "graphView"    # Lcom/jjoe64/graphview/GraphView;
    .param p2, "canvas"    # Landroid/graphics/Canvas;
    .param p3, "isSecondScale"    # Z

    .prologue
    .line 155
    .local p0, "this":Lcom/jjoe64/graphview/series/LineGraphSeries;, "Lcom/jjoe64/graphview/series/LineGraphSeries<TE;>;"
    invoke-virtual/range {p0 .. p0}, Lcom/jjoe64/graphview/series/LineGraphSeries;->resetDataPoints()V

    .line 158
    invoke-virtual/range {p1 .. p1}, Lcom/jjoe64/graphview/GraphView;->getViewport()Lcom/jjoe64/graphview/Viewport;

    move-result-object v55

    const/16 v56, 0x0

    invoke-virtual/range {v55 .. v56}, Lcom/jjoe64/graphview/Viewport;->getMaxX(Z)D

    move-result-wide v26

    .line 159
    .local v26, "maxX":D
    invoke-virtual/range {p1 .. p1}, Lcom/jjoe64/graphview/GraphView;->getViewport()Lcom/jjoe64/graphview/Viewport;

    move-result-object v55

    const/16 v56, 0x0

    invoke-virtual/range {v55 .. v56}, Lcom/jjoe64/graphview/Viewport;->getMinX(Z)D

    move-result-wide v30

    .line 163
    .local v30, "minX":D
    if-eqz p3, :cond_24d

    .line 164
    invoke-virtual/range {p1 .. p1}, Lcom/jjoe64/graphview/GraphView;->getSecondScale()Lcom/jjoe64/graphview/SecondScale;

    move-result-object v55

    invoke-virtual/range {v55 .. v55}, Lcom/jjoe64/graphview/SecondScale;->getMaxY()D

    move-result-wide v28

    .line 165
    .local v28, "maxY":D
    invoke-virtual/range {p1 .. p1}, Lcom/jjoe64/graphview/GraphView;->getSecondScale()Lcom/jjoe64/graphview/SecondScale;

    move-result-object v55

    invoke-virtual/range {v55 .. v55}, Lcom/jjoe64/graphview/SecondScale;->getMinY()D

    move-result-wide v32

    .line 171
    .local v32, "minY":D
    :goto_29
    move-object/from16 v0, p0

    move-wide/from16 v1, v30

    move-wide/from16 v3, v26

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/jjoe64/graphview/series/LineGraphSeries;->getValues(DD)Ljava/util/Iterator;

    move-result-object v50

    .line 174
    .local v50, "values":Ljava/util/Iterator;, "Ljava/util/Iterator<TE;>;"
    const-wide/16 v22, 0x0

    .line 175
    .local v22, "lastEndY":D
    const-wide/16 v20, 0x0

    .line 178
    .local v20, "lastEndX":D
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/series/LineGraphSeries;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v55, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/series/LineGraphSeries;->mStyles:Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;

    move-object/from16 v56, v0

    # getter for: Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;->thickness:I
    invoke-static/range {v56 .. v56}, Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;->access$100(Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;)I

    move-result v56

    move/from16 v0, v56

    int-to-float v0, v0

    move/from16 v56, v0

    invoke-virtual/range {v55 .. v56}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 179
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/series/LineGraphSeries;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v55, v0

    invoke-virtual/range {p0 .. p0}, Lcom/jjoe64/graphview/series/LineGraphSeries;->getColor()I

    move-result v56

    invoke-virtual/range {v55 .. v56}, Landroid/graphics/Paint;->setColor(I)V

    .line 180
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/series/LineGraphSeries;->mPaintBackground:Landroid/graphics/Paint;

    move-object/from16 v55, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/series/LineGraphSeries;->mStyles:Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;

    move-object/from16 v56, v0

    # getter for: Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;->backgroundColor:I
    invoke-static/range {v56 .. v56}, Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;->access$200(Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;)I

    move-result v56

    invoke-virtual/range {v55 .. v56}, Landroid/graphics/Paint;->setColor(I)V

    .line 183
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/series/LineGraphSeries;->mCustomPaint:Landroid/graphics/Paint;

    move-object/from16 v55, v0

    if-eqz v55, :cond_263

    .line 184
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/series/LineGraphSeries;->mCustomPaint:Landroid/graphics/Paint;

    move-object/from16 v38, v0

    .line 189
    .local v38, "paint":Landroid/graphics/Paint;
    :goto_7d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/series/LineGraphSeries;->mStyles:Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;

    move-object/from16 v55, v0

    # getter for: Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;->drawBackground:Z
    invoke-static/range {v55 .. v55}, Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;->access$300(Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;)Z

    move-result v55

    if-eqz v55, :cond_92

    .line 190
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/series/LineGraphSeries;->mPathBackground:Landroid/graphics/Path;

    move-object/from16 v55, v0

    invoke-virtual/range {v55 .. v55}, Landroid/graphics/Path;->reset()V

    .line 193
    :cond_92
    sub-double v9, v28, v32

    .line 194
    .local v9, "diffY":D
    sub-double v7, v26, v30

    .line 196
    .local v7, "diffX":D
    invoke-virtual/range {p1 .. p1}, Lcom/jjoe64/graphview/GraphView;->getGraphContentHeight()I

    move-result v55

    move/from16 v0, v55

    int-to-float v15, v0

    .line 197
    .local v15, "graphHeight":F
    invoke-virtual/range {p1 .. p1}, Lcom/jjoe64/graphview/GraphView;->getGraphContentWidth()I

    move-result v55

    move/from16 v0, v55

    int-to-float v0, v0

    move/from16 v18, v0

    .line 198
    .local v18, "graphWidth":F
    invoke-virtual/range {p1 .. p1}, Lcom/jjoe64/graphview/GraphView;->getGraphContentLeft()I

    move-result v55

    move/from16 v0, v55

    int-to-float v0, v0

    move/from16 v16, v0

    .line 199
    .local v16, "graphLeft":F
    invoke-virtual/range {p1 .. p1}, Lcom/jjoe64/graphview/GraphView;->getGraphContentTop()I

    move-result v55

    move/from16 v0, v55

    int-to-float v0, v0

    move/from16 v17, v0

    .line 201
    .local v17, "graphTop":F
    const-wide/16 v22, 0x0

    .line 202
    const-wide/16 v20, 0x0

    .line 203
    const-wide/16 v24, 0x0

    .line 204
    .local v24, "lastUsedEndX":D
    const/4 v13, 0x0

    .line 205
    .local v13, "firstX":F
    const/16 v19, 0x0

    .line 206
    .local v19, "i":I
    :goto_c1
    invoke-interface/range {v50 .. v50}, Ljava/util/Iterator;->hasNext()Z

    move-result v55

    if-eqz v55, :cond_291

    .line 207
    invoke-interface/range {v50 .. v50}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v49

    check-cast v49, Lcom/jjoe64/graphview/series/DataPointInterface;

    .line 209
    .local v49, "value":Lcom/jjoe64/graphview/series/DataPointInterface;, "TE;"
    invoke-interface/range {v49 .. v49}, Lcom/jjoe64/graphview/series/DataPointInterface;->getY()D

    move-result-wide v55

    sub-double v47, v55, v32

    .line 210
    .local v47, "valY":D
    div-double v41, v47, v9

    .line 211
    .local v41, "ratY":D
    float-to-double v0, v15

    move-wide/from16 v55, v0

    mul-double v53, v55, v41

    .line 213
    .local v53, "y":D
    invoke-interface/range {v49 .. v49}, Lcom/jjoe64/graphview/series/DataPointInterface;->getX()D

    move-result-wide v55

    sub-double v45, v55, v30

    .line 214
    .local v45, "valX":D
    div-double v39, v45, v7

    .line 215
    .local v39, "ratX":D
    move/from16 v0, v18

    float-to-double v0, v0

    move-wide/from16 v55, v0

    mul-double v51, v55, v39

    .line 217
    .local v51, "x":D
    move-wide/from16 v34, v51

    .line 218
    .local v34, "orgX":D
    move-wide/from16 v36, v53

    .line 220
    .local v36, "orgY":D
    if-lez v19, :cond_26b

    .line 222
    move/from16 v0, v18

    float-to-double v0, v0

    move-wide/from16 v55, v0

    cmpl-double v55, v51, v55

    if-lez v55, :cond_10e

    .line 223
    move/from16 v0, v18

    float-to-double v0, v0

    move-wide/from16 v55, v0

    sub-double v55, v55, v20

    sub-double v57, v53, v22

    mul-double v55, v55, v57

    sub-double v57, v51, v20

    div-double v5, v55, v57

    .line 224
    .local v5, "b":D
    add-double v53, v22, v5

    .line 225
    move/from16 v0, v18

    float-to-double v0, v0

    move-wide/from16 v51, v0

    .line 227
    .end local v5    # "b":D
    :cond_10e
    const-wide/16 v55, 0x0

    cmpg-double v55, v53, v55

    if-gez v55, :cond_124

    .line 228
    const-wide/16 v55, 0x0

    sub-double v55, v55, v22

    sub-double v57, v51, v20

    mul-double v55, v55, v57

    sub-double v57, v53, v22

    div-double v5, v55, v57

    .line 229
    .restart local v5    # "b":D
    add-double v51, v20, v5

    .line 230
    const-wide/16 v53, 0x0

    .line 232
    .end local v5    # "b":D
    :cond_124
    float-to-double v0, v15

    move-wide/from16 v55, v0

    cmpl-double v55, v53, v55

    if-lez v55, :cond_13d

    .line 233
    float-to-double v0, v15

    move-wide/from16 v55, v0

    sub-double v55, v55, v22

    sub-double v57, v51, v20

    mul-double v55, v55, v57

    sub-double v57, v53, v22

    div-double v5, v55, v57

    .line 234
    .restart local v5    # "b":D
    add-double v51, v20, v5

    .line 235
    float-to-double v0, v15

    move-wide/from16 v53, v0

    .line 237
    .end local v5    # "b":D
    :cond_13d
    const-wide/16 v55, 0x0

    cmpg-double v55, v22, v55

    if-gez v55, :cond_153

    .line 238
    const-wide/16 v55, 0x0

    sub-double v55, v55, v53

    sub-double v57, v51, v20

    mul-double v55, v55, v57

    sub-double v57, v22, v53

    div-double v5, v55, v57

    .line 239
    .restart local v5    # "b":D
    sub-double v20, v51, v5

    .line 240
    const-wide/16 v22, 0x0

    .line 242
    .end local v5    # "b":D
    :cond_153
    const-wide/16 v55, 0x0

    cmpg-double v55, v20, v55

    if-gez v55, :cond_169

    .line 243
    const-wide/16 v55, 0x0

    sub-double v55, v55, v51

    sub-double v57, v53, v22

    mul-double v55, v55, v57

    sub-double v57, v20, v51

    div-double v5, v55, v57

    .line 244
    .restart local v5    # "b":D
    sub-double v22, v53, v5

    .line 245
    const-wide/16 v20, 0x0

    .line 247
    .end local v5    # "b":D
    :cond_169
    float-to-double v0, v15

    move-wide/from16 v55, v0

    cmpl-double v55, v22, v55

    if-lez v55, :cond_182

    .line 248
    float-to-double v0, v15

    move-wide/from16 v55, v0

    sub-double v55, v55, v53

    sub-double v57, v51, v20

    mul-double v55, v55, v57

    sub-double v57, v22, v53

    div-double v5, v55, v57

    .line 249
    .restart local v5    # "b":D
    sub-double v20, v51, v5

    .line 250
    float-to-double v0, v15

    move-wide/from16 v22, v0

    .line 253
    .end local v5    # "b":D
    :cond_182
    move-wide/from16 v0, v20

    double-to-float v0, v0

    move/from16 v55, v0

    const/high16 v56, 0x3f800000    # 1.0f

    add-float v56, v56, v16

    add-float v43, v55, v56

    .line 254
    .local v43, "startX":F
    move/from16 v0, v17

    float-to-double v0, v0

    move-wide/from16 v55, v0

    sub-double v55, v55, v22

    move-wide/from16 v0, v55

    double-to-float v0, v0

    move/from16 v55, v0

    add-float v44, v55, v15

    .line 255
    .local v44, "startY":F
    move-wide/from16 v0, v51

    double-to-float v0, v0

    move/from16 v55, v0

    const/high16 v56, 0x3f800000    # 1.0f

    add-float v56, v56, v16

    add-float v11, v55, v56

    .line 256
    .local v11, "endX":F
    move/from16 v0, v17

    float-to-double v0, v0

    move-wide/from16 v55, v0

    sub-double v55, v55, v53

    move-wide/from16 v0, v55

    double-to-float v0, v0

    move/from16 v55, v0

    add-float v12, v55, v15

    .line 259
    .local v12, "endY":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/series/LineGraphSeries;->mStyles:Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;

    move-object/from16 v55, v0

    # getter for: Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;->drawDataPoints:Z
    invoke-static/range {v55 .. v55}, Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;->access$400(Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;)Z

    move-result v55

    if-eqz v55, :cond_1d9

    .line 261
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/series/LineGraphSeries;->mStyles:Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;

    move-object/from16 v55, v0

    # getter for: Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;->dataPointsRadius:F
    invoke-static/range {v55 .. v55}, Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;->access$500(Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;)F

    move-result v55

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/series/LineGraphSeries;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v56, v0

    move-object/from16 v0, p2

    move/from16 v1, v55

    move-object/from16 v2, v56

    invoke-virtual {v0, v11, v12, v1, v2}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 263
    :cond_1d9
    move-object/from16 v0, p0

    move-object/from16 v1, v49

    invoke-virtual {v0, v11, v12, v1}, Lcom/jjoe64/graphview/series/LineGraphSeries;->registerDataPoint(FFLcom/jjoe64/graphview/series/DataPointInterface;)V

    .line 265
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/series/LineGraphSeries;->mPath:Landroid/graphics/Path;

    move-object/from16 v55, v0

    invoke-virtual/range {v55 .. v55}, Landroid/graphics/Path;->reset()V

    .line 266
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/series/LineGraphSeries;->mPath:Landroid/graphics/Path;

    move-object/from16 v55, v0

    move-object/from16 v0, v55

    move/from16 v1, v43

    move/from16 v2, v44

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->moveTo(FF)V

    .line 267
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/series/LineGraphSeries;->mPath:Landroid/graphics/Path;

    move-object/from16 v55, v0

    move-object/from16 v0, v55

    invoke-virtual {v0, v11, v12}, Landroid/graphics/Path;->lineTo(FF)V

    .line 268
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/series/LineGraphSeries;->mPath:Landroid/graphics/Path;

    move-object/from16 v55, v0

    move-object/from16 v0, p2

    move-object/from16 v1, v55

    move-object/from16 v2, v38

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 269
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/series/LineGraphSeries;->mStyles:Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;

    move-object/from16 v55, v0

    # getter for: Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;->drawBackground:Z
    invoke-static/range {v55 .. v55}, Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;->access$300(Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;)Z

    move-result v55

    if-eqz v55, :cond_242

    .line 270
    const/16 v55, 0x1

    move/from16 v0, v19

    move/from16 v1, v55

    if-ne v0, v1, :cond_237

    .line 271
    move/from16 v13, v43

    .line 272
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/series/LineGraphSeries;->mPathBackground:Landroid/graphics/Path;

    move-object/from16 v55, v0

    move-object/from16 v0, v55

    move/from16 v1, v43

    move/from16 v2, v44

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->moveTo(FF)V

    .line 274
    :cond_237
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/series/LineGraphSeries;->mPathBackground:Landroid/graphics/Path;

    move-object/from16 v55, v0

    move-object/from16 v0, v55

    invoke-virtual {v0, v11, v12}, Landroid/graphics/Path;->lineTo(FF)V

    .line 276
    :cond_242
    float-to-double v0, v11

    move-wide/from16 v24, v0

    .line 283
    .end local v11    # "endX":F
    .end local v12    # "endY":F
    .end local v43    # "startX":F
    .end local v44    # "startY":F
    :cond_245
    :goto_245
    move-wide/from16 v22, v36

    .line 284
    move-wide/from16 v20, v34

    .line 285
    add-int/lit8 v19, v19, 0x1

    .line 286
    goto/16 :goto_c1

    .line 167
    .end local v7    # "diffX":D
    .end local v9    # "diffY":D
    .end local v13    # "firstX":F
    .end local v15    # "graphHeight":F
    .end local v16    # "graphLeft":F
    .end local v17    # "graphTop":F
    .end local v18    # "graphWidth":F
    .end local v19    # "i":I
    .end local v20    # "lastEndX":D
    .end local v22    # "lastEndY":D
    .end local v24    # "lastUsedEndX":D
    .end local v28    # "maxY":D
    .end local v32    # "minY":D
    .end local v34    # "orgX":D
    .end local v36    # "orgY":D
    .end local v38    # "paint":Landroid/graphics/Paint;
    .end local v39    # "ratX":D
    .end local v41    # "ratY":D
    .end local v45    # "valX":D
    .end local v47    # "valY":D
    .end local v49    # "value":Lcom/jjoe64/graphview/series/DataPointInterface;, "TE;"
    .end local v50    # "values":Ljava/util/Iterator;, "Ljava/util/Iterator<TE;>;"
    .end local v51    # "x":D
    .end local v53    # "y":D
    :cond_24d
    invoke-virtual/range {p1 .. p1}, Lcom/jjoe64/graphview/GraphView;->getViewport()Lcom/jjoe64/graphview/Viewport;

    move-result-object v55

    const/16 v56, 0x0

    invoke-virtual/range {v55 .. v56}, Lcom/jjoe64/graphview/Viewport;->getMaxY(Z)D

    move-result-wide v28

    .line 168
    .restart local v28    # "maxY":D
    invoke-virtual/range {p1 .. p1}, Lcom/jjoe64/graphview/GraphView;->getViewport()Lcom/jjoe64/graphview/Viewport;

    move-result-object v55

    const/16 v56, 0x0

    invoke-virtual/range {v55 .. v56}, Lcom/jjoe64/graphview/Viewport;->getMinY(Z)D

    move-result-wide v32

    .restart local v32    # "minY":D
    goto/16 :goto_29

    .line 186
    .restart local v20    # "lastEndX":D
    .restart local v22    # "lastEndY":D
    .restart local v50    # "values":Ljava/util/Iterator;, "Ljava/util/Iterator<TE;>;"
    :cond_263
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/series/LineGraphSeries;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v38, v0

    .restart local v38    # "paint":Landroid/graphics/Paint;
    goto/16 :goto_7d

    .line 277
    .restart local v7    # "diffX":D
    .restart local v9    # "diffY":D
    .restart local v13    # "firstX":F
    .restart local v15    # "graphHeight":F
    .restart local v16    # "graphLeft":F
    .restart local v17    # "graphTop":F
    .restart local v18    # "graphWidth":F
    .restart local v19    # "i":I
    .restart local v24    # "lastUsedEndX":D
    .restart local v34    # "orgX":D
    .restart local v36    # "orgY":D
    .restart local v39    # "ratX":D
    .restart local v41    # "ratY":D
    .restart local v45    # "valX":D
    .restart local v47    # "valY":D
    .restart local v49    # "value":Lcom/jjoe64/graphview/series/DataPointInterface;, "TE;"
    .restart local v51    # "x":D
    .restart local v53    # "y":D
    :cond_26b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/series/LineGraphSeries;->mStyles:Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;

    move-object/from16 v55, v0

    # getter for: Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;->drawDataPoints:Z
    invoke-static/range {v55 .. v55}, Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;->access$400(Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;)Z

    move-result v55

    if-eqz v55, :cond_245

    .line 279
    move-wide/from16 v0, v51

    double-to-float v0, v0

    move/from16 v55, v0

    const/high16 v56, 0x3f800000    # 1.0f

    add-float v56, v56, v16

    add-float v14, v55, v56

    .line 280
    .local v14, "first_X":F
    move/from16 v0, v17

    float-to-double v0, v0

    move-wide/from16 v55, v0

    sub-double v55, v55, v53

    move-wide/from16 v0, v55

    double-to-float v0, v0

    move/from16 v55, v0

    add-float v55, v55, v15

    goto :goto_245

    .line 288
    .end local v14    # "first_X":F
    .end local v34    # "orgX":D
    .end local v36    # "orgY":D
    .end local v39    # "ratX":D
    .end local v41    # "ratY":D
    .end local v45    # "valX":D
    .end local v47    # "valY":D
    .end local v49    # "value":Lcom/jjoe64/graphview/series/DataPointInterface;, "TE;"
    .end local v51    # "x":D
    .end local v53    # "y":D
    :cond_291
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/series/LineGraphSeries;->mStyles:Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;

    move-object/from16 v55, v0

    # getter for: Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;->drawBackground:Z
    invoke-static/range {v55 .. v55}, Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;->access$300(Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;)Z

    move-result v55

    if-eqz v55, :cond_2da

    .line 290
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/series/LineGraphSeries;->mPathBackground:Landroid/graphics/Path;

    move-object/from16 v55, v0

    move-wide/from16 v0, v24

    double-to-float v0, v0

    move/from16 v56, v0

    add-float v57, v15, v17

    invoke-virtual/range {v55 .. v57}, Landroid/graphics/Path;->lineTo(FF)V

    .line 291
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/series/LineGraphSeries;->mPathBackground:Landroid/graphics/Path;

    move-object/from16 v55, v0

    add-float v56, v15, v17

    move-object/from16 v0, v55

    move/from16 v1, v56

    invoke-virtual {v0, v13, v1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 292
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/series/LineGraphSeries;->mPathBackground:Landroid/graphics/Path;

    move-object/from16 v55, v0

    invoke-virtual/range {v55 .. v55}, Landroid/graphics/Path;->close()V

    .line 293
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/series/LineGraphSeries;->mPathBackground:Landroid/graphics/Path;

    move-object/from16 v55, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/series/LineGraphSeries;->mPaintBackground:Landroid/graphics/Paint;

    move-object/from16 v56, v0

    move-object/from16 v0, p2

    move-object/from16 v1, v55

    move-object/from16 v2, v56

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 296
    :cond_2da
    return-void
.end method

.method public getBackgroundColor()I
    .registers 2

    .prologue
    .line 388
    .local p0, "this":Lcom/jjoe64/graphview/series/LineGraphSeries;, "Lcom/jjoe64/graphview/series/LineGraphSeries<TE;>;"
    iget-object v0, p0, Lcom/jjoe64/graphview/series/LineGraphSeries;->mStyles:Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;

    # getter for: Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;->backgroundColor:I
    invoke-static {v0}, Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;->access$200(Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;)I

    move-result v0

    return v0
.end method

.method public getDataPointsRadius()F
    .registers 2

    .prologue
    .line 371
    .local p0, "this":Lcom/jjoe64/graphview/series/LineGraphSeries;, "Lcom/jjoe64/graphview/series/LineGraphSeries<TE;>;"
    iget-object v0, p0, Lcom/jjoe64/graphview/series/LineGraphSeries;->mStyles:Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;

    # getter for: Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;->dataPointsRadius:F
    invoke-static {v0}, Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;->access$500(Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;)F

    move-result v0

    return v0
.end method

.method public getThickness()I
    .registers 2

    .prologue
    .line 306
    .local p0, "this":Lcom/jjoe64/graphview/series/LineGraphSeries;, "Lcom/jjoe64/graphview/series/LineGraphSeries<TE;>;"
    iget-object v0, p0, Lcom/jjoe64/graphview/series/LineGraphSeries;->mStyles:Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;

    # getter for: Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;->thickness:I
    invoke-static {v0}, Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;->access$100(Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;)I

    move-result v0

    return v0
.end method

.method protected init()V
    .registers 3

    .prologue
    .line 135
    .local p0, "this":Lcom/jjoe64/graphview/series/LineGraphSeries;, "Lcom/jjoe64/graphview/series/LineGraphSeries<TE;>;"
    new-instance v0, Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;-><init>(Lcom/jjoe64/graphview/series/LineGraphSeries;Lcom/jjoe64/graphview/series/LineGraphSeries$1;)V

    iput-object v0, p0, Lcom/jjoe64/graphview/series/LineGraphSeries;->mStyles:Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;

    .line 136
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/jjoe64/graphview/series/LineGraphSeries;->mPaint:Landroid/graphics/Paint;

    .line 137
    iget-object v0, p0, Lcom/jjoe64/graphview/series/LineGraphSeries;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 138
    iget-object v0, p0, Lcom/jjoe64/graphview/series/LineGraphSeries;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 139
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/jjoe64/graphview/series/LineGraphSeries;->mPaintBackground:Landroid/graphics/Paint;

    .line 141
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/jjoe64/graphview/series/LineGraphSeries;->mPathBackground:Landroid/graphics/Path;

    .line 142
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/jjoe64/graphview/series/LineGraphSeries;->mPath:Landroid/graphics/Path;

    .line 143
    return-void
.end method

.method public isDrawBackground()Z
    .registers 2

    .prologue
    .line 329
    .local p0, "this":Lcom/jjoe64/graphview/series/LineGraphSeries;, "Lcom/jjoe64/graphview/series/LineGraphSeries<TE;>;"
    iget-object v0, p0, Lcom/jjoe64/graphview/series/LineGraphSeries;->mStyles:Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;

    # getter for: Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;->drawBackground:Z
    invoke-static {v0}, Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;->access$300(Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;)Z

    move-result v0

    return v0
.end method

.method public isDrawDataPoints()Z
    .registers 2

    .prologue
    .line 352
    .local p0, "this":Lcom/jjoe64/graphview/series/LineGraphSeries;, "Lcom/jjoe64/graphview/series/LineGraphSeries<TE;>;"
    iget-object v0, p0, Lcom/jjoe64/graphview/series/LineGraphSeries;->mStyles:Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;

    # getter for: Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;->drawDataPoints:Z
    invoke-static {v0}, Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;->access$400(Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;)Z

    move-result v0

    return v0
.end method

.method public setBackgroundColor(I)V
    .registers 3
    .param p1, "backgroundColor"    # I

    .prologue
    .line 397
    .local p0, "this":Lcom/jjoe64/graphview/series/LineGraphSeries;, "Lcom/jjoe64/graphview/series/LineGraphSeries<TE;>;"
    iget-object v0, p0, Lcom/jjoe64/graphview/series/LineGraphSeries;->mStyles:Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;

    # setter for: Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;->backgroundColor:I
    invoke-static {v0, p1}, Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;->access$202(Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;I)I

    .line 398
    return-void
.end method

.method public setCustomPaint(Landroid/graphics/Paint;)V
    .registers 2
    .param p1, "customPaint"    # Landroid/graphics/Paint;

    .prologue
    .line 407
    .local p0, "this":Lcom/jjoe64/graphview/series/LineGraphSeries;, "Lcom/jjoe64/graphview/series/LineGraphSeries<TE;>;"
    iput-object p1, p0, Lcom/jjoe64/graphview/series/LineGraphSeries;->mCustomPaint:Landroid/graphics/Paint;

    .line 408
    return-void
.end method

.method public setDataPointsRadius(F)V
    .registers 3
    .param p1, "dataPointsRadius"    # F

    .prologue
    .line 379
    .local p0, "this":Lcom/jjoe64/graphview/series/LineGraphSeries;, "Lcom/jjoe64/graphview/series/LineGraphSeries<TE;>;"
    iget-object v0, p0, Lcom/jjoe64/graphview/series/LineGraphSeries;->mStyles:Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;

    # setter for: Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;->dataPointsRadius:F
    invoke-static {v0, p1}, Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;->access$502(Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;F)F

    .line 380
    return-void
.end method

.method public setDrawBackground(Z)V
    .registers 3
    .param p1, "drawBackground"    # Z

    .prologue
    .line 341
    .local p0, "this":Lcom/jjoe64/graphview/series/LineGraphSeries;, "Lcom/jjoe64/graphview/series/LineGraphSeries<TE;>;"
    iget-object v0, p0, Lcom/jjoe64/graphview/series/LineGraphSeries;->mStyles:Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;

    # setter for: Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;->drawBackground:Z
    invoke-static {v0, p1}, Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;->access$302(Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;Z)Z

    .line 342
    return-void
.end method

.method public setDrawDataPoints(Z)V
    .registers 3
    .param p1, "drawDataPoints"    # Z

    .prologue
    .line 363
    .local p0, "this":Lcom/jjoe64/graphview/series/LineGraphSeries;, "Lcom/jjoe64/graphview/series/LineGraphSeries<TE;>;"
    iget-object v0, p0, Lcom/jjoe64/graphview/series/LineGraphSeries;->mStyles:Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;

    # setter for: Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;->drawDataPoints:Z
    invoke-static {v0, p1}, Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;->access$402(Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;Z)Z

    .line 364
    return-void
.end method

.method public setThickness(I)V
    .registers 3
    .param p1, "thickness"    # I

    .prologue
    .line 317
    .local p0, "this":Lcom/jjoe64/graphview/series/LineGraphSeries;, "Lcom/jjoe64/graphview/series/LineGraphSeries<TE;>;"
    iget-object v0, p0, Lcom/jjoe64/graphview/series/LineGraphSeries;->mStyles:Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;

    # setter for: Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;->thickness:I
    invoke-static {v0, p1}, Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;->access$102(Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;I)I

    .line 318
    return-void
.end method
