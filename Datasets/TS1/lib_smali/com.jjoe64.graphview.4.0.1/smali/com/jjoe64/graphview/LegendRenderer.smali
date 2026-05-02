.class public Lcom/jjoe64/graphview/LegendRenderer;
.super Ljava/lang/Object;
.source "LegendRenderer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/jjoe64/graphview/LegendRenderer$LegendAlign;,
        Lcom/jjoe64/graphview/LegendRenderer$Styles;
    }
.end annotation


# instance fields
.field private cachedLegendWidth:I

.field private final mGraphView:Lcom/jjoe64/graphview/GraphView;

.field private mIsVisible:Z

.field private mPaint:Landroid/graphics/Paint;

.field private mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;


# direct methods
.method public constructor <init>(Lcom/jjoe64/graphview/GraphView;)V
    .registers 5
    .param p1, "graphView"    # Lcom/jjoe64/graphview/GraphView;

    .prologue
    const/4 v2, 0x0

    .line 111
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 112
    iput-object p1, p0, Lcom/jjoe64/graphview/LegendRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    .line 113
    iput-boolean v2, p0, Lcom/jjoe64/graphview/LegendRenderer;->mIsVisible:Z

    .line 114
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/jjoe64/graphview/LegendRenderer;->mPaint:Landroid/graphics/Paint;

    .line 115
    iget-object v0, p0, Lcom/jjoe64/graphview/LegendRenderer;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 116
    new-instance v0, Lcom/jjoe64/graphview/LegendRenderer$Styles;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/jjoe64/graphview/LegendRenderer$Styles;-><init>(Lcom/jjoe64/graphview/LegendRenderer;Lcom/jjoe64/graphview/LegendRenderer$1;)V

    iput-object v0, p0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    .line 117
    iput v2, p0, Lcom/jjoe64/graphview/LegendRenderer;->cachedLegendWidth:I

    .line 118
    invoke-virtual {p0}, Lcom/jjoe64/graphview/LegendRenderer;->resetStyles()V

    .line 119
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 28
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 161
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/jjoe64/graphview/LegendRenderer;->mIsVisible:Z

    move/from16 v17, v0

    if-nez v17, :cond_9

    .line 231
    :cond_8
    return-void

    .line 163
    :cond_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget v0, v0, Lcom/jjoe64/graphview/LegendRenderer$Styles;->textSize:F

    move/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 165
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget v0, v0, Lcom/jjoe64/graphview/LegendRenderer$Styles;->textSize:F

    move/from16 v17, v0

    move/from16 v0, v17

    float-to-double v0, v0

    move-wide/from16 v17, v0

    const-wide v19, 0x3fe999999999999aL    # 0.8

    mul-double v17, v17, v19

    move-wide/from16 v0, v17

    double-to-int v15, v0

    .line 167
    .local v15, "shapeSize":I
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 168
    .local v5, "allSeries":Ljava/util/List;, "Ljava/util/List<Lcom/jjoe64/graphview/series/Series;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/jjoe64/graphview/GraphView;->getSeries()Ljava/util/List;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-interface {v5, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 169
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/jjoe64/graphview/GraphView;->mSecondScale:Lcom/jjoe64/graphview/SecondScale;

    move-object/from16 v17, v0

    if-eqz v17, :cond_6e

    .line 170
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/jjoe64/graphview/GraphView;->getSecondScale()Lcom/jjoe64/graphview/SecondScale;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Lcom/jjoe64/graphview/SecondScale;->getSeries()Ljava/util/List;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-interface {v5, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 174
    :cond_6e
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget v12, v0, Lcom/jjoe64/graphview/LegendRenderer$Styles;->width:I

    .line 175
    .local v12, "legendWidth":I
    if-nez v12, :cond_ee

    .line 177
    move-object/from16 v0, p0

    iget v12, v0, Lcom/jjoe64/graphview/LegendRenderer;->cachedLegendWidth:I

    .line 179
    if-nez v12, :cond_ee

    .line 180
    new-instance v16, Landroid/graphics/Rect;

    invoke-direct/range {v16 .. v16}, Landroid/graphics/Rect;-><init>()V

    .line 181
    .local v16, "textBounds":Landroid/graphics/Rect;
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v17

    :cond_89
    :goto_89
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_c7

    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/jjoe64/graphview/series/Series;

    .line 182
    .local v13, "s":Lcom/jjoe64/graphview/series/Series;
    invoke-interface {v13}, Lcom/jjoe64/graphview/series/Series;->getTitle()Ljava/lang/String;

    move-result-object v18

    if-eqz v18, :cond_89

    .line 183
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v18, v0

    invoke-interface {v13}, Lcom/jjoe64/graphview/series/Series;->getTitle()Ljava/lang/String;

    move-result-object v19

    const/16 v20, 0x0

    invoke-interface {v13}, Lcom/jjoe64/graphview/series/Series;->getTitle()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/String;->length()I

    move-result v21

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    move/from16 v2, v20

    move/from16 v3, v21

    move-object/from16 v4, v16

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 184
    invoke-virtual/range {v16 .. v16}, Landroid/graphics/Rect;->width()I

    move-result v18

    move/from16 v0, v18

    invoke-static {v12, v0}, Ljava/lang/Math;->max(II)I

    move-result v12

    goto :goto_89

    .line 187
    .end local v13    # "s":Lcom/jjoe64/graphview/series/Series;
    :cond_c7
    if-nez v12, :cond_ca

    const/4 v12, 0x1

    .line 190
    :cond_ca
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget v0, v0, Lcom/jjoe64/graphview/LegendRenderer$Styles;->padding:I

    move/from16 v17, v0

    mul-int/lit8 v17, v17, 0x2

    add-int v17, v17, v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget v0, v0, Lcom/jjoe64/graphview/LegendRenderer$Styles;->spacing:I

    move/from16 v18, v0

    add-int v17, v17, v18

    add-int v12, v12, v17

    .line 191
    move-object/from16 v0, p0

    iput v12, v0, Lcom/jjoe64/graphview/LegendRenderer;->cachedLegendWidth:I

    .line 196
    .end local v16    # "textBounds":Landroid/graphics/Rect;
    :cond_ee
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget v0, v0, Lcom/jjoe64/graphview/LegendRenderer$Styles;->textSize:F

    move/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget v0, v0, Lcom/jjoe64/graphview/LegendRenderer$Styles;->spacing:I

    move/from16 v18, v0

    move/from16 v0, v18

    int-to-float v0, v0

    move/from16 v18, v0

    add-float v17, v17, v18

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v18

    move/from16 v0, v18

    int-to-float v0, v0

    move/from16 v18, v0

    mul-float v17, v17, v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget v0, v0, Lcom/jjoe64/graphview/LegendRenderer$Styles;->spacing:I

    move/from16 v18, v0

    move/from16 v0, v18

    int-to-float v0, v0

    move/from16 v18, v0

    sub-float v11, v17, v18

    .line 199
    .local v11, "legendHeight":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer$Styles;->fixedPosition:Landroid/graphics/Point;

    move-object/from16 v17, v0

    if-eqz v17, :cond_362

    .line 201
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/jjoe64/graphview/GraphView;->getGraphContentLeft()I

    move-result v17

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget v0, v0, Lcom/jjoe64/graphview/LegendRenderer$Styles;->margin:I

    move/from16 v18, v0

    add-int v17, v17, v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer$Styles;->fixedPosition:Landroid/graphics/Point;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget v0, v0, Landroid/graphics/Point;->x:I

    move/from16 v18, v0

    add-int v17, v17, v18

    move/from16 v0, v17

    int-to-float v8, v0

    .line 202
    .local v8, "lLeft":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/jjoe64/graphview/GraphView;->getGraphContentTop()I

    move-result v17

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget v0, v0, Lcom/jjoe64/graphview/LegendRenderer$Styles;->margin:I

    move/from16 v18, v0

    add-int v17, v17, v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer$Styles;->fixedPosition:Landroid/graphics/Point;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget v0, v0, Landroid/graphics/Point;->y:I

    move/from16 v18, v0

    add-int v17, v17, v18

    move/from16 v0, v17

    int-to-float v10, v0

    .line 216
    .local v10, "lTop":F
    :goto_197
    int-to-float v0, v12

    move/from16 v17, v0

    add-float v9, v8, v17

    .line 217
    .local v9, "lRight":F
    add-float v17, v10, v11

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget v0, v0, Lcom/jjoe64/graphview/LegendRenderer$Styles;->padding:I

    move/from16 v18, v0

    mul-int/lit8 v18, v18, 0x2

    move/from16 v0, v18

    int-to-float v0, v0

    move/from16 v18, v0

    add-float v7, v17, v18

    .line 218
    .local v7, "lBottom":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget v0, v0, Lcom/jjoe64/graphview/LegendRenderer$Styles;->backgroundColor:I

    move/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Landroid/graphics/Paint;->setColor(I)V

    .line 219
    new-instance v17, Landroid/graphics/RectF;

    move-object/from16 v0, v17

    invoke-direct {v0, v8, v10, v9, v7}, Landroid/graphics/RectF;-><init>(FFFF)V

    const/high16 v18, 0x41000000    # 8.0f

    const/high16 v19, 0x41000000    # 8.0f

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v20, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    move/from16 v2, v18

    move/from16 v3, v19

    move-object/from16 v4, v20

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 221
    const/4 v6, 0x0

    .line 222
    .local v6, "i":I
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v17

    :goto_1eb
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_8

    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/jjoe64/graphview/series/Series;

    .line 223
    .local v14, "series":Lcom/jjoe64/graphview/series/Series;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v18, v0

    invoke-interface {v14}, Lcom/jjoe64/graphview/series/Series;->getColor()I

    move-result v19

    invoke-virtual/range {v18 .. v19}, Landroid/graphics/Paint;->setColor(I)V

    .line 224
    new-instance v18, Landroid/graphics/RectF;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget v0, v0, Lcom/jjoe64/graphview/LegendRenderer$Styles;->padding:I

    move/from16 v19, v0

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    add-float v19, v19, v8

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget v0, v0, Lcom/jjoe64/graphview/LegendRenderer$Styles;->padding:I

    move/from16 v20, v0

    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v20, v0

    add-float v20, v20, v10

    int-to-float v0, v6

    move/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget v0, v0, Lcom/jjoe64/graphview/LegendRenderer$Styles;->textSize:F

    move/from16 v22, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget v0, v0, Lcom/jjoe64/graphview/LegendRenderer$Styles;->spacing:I

    move/from16 v23, v0

    move/from16 v0, v23

    int-to-float v0, v0

    move/from16 v23, v0

    add-float v22, v22, v23

    mul-float v21, v21, v22

    add-float v20, v20, v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget v0, v0, Lcom/jjoe64/graphview/LegendRenderer$Styles;->padding:I

    move/from16 v21, v0

    move/from16 v0, v21

    int-to-float v0, v0

    move/from16 v21, v0

    add-float v21, v21, v8

    int-to-float v0, v15

    move/from16 v22, v0

    add-float v21, v21, v22

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget v0, v0, Lcom/jjoe64/graphview/LegendRenderer$Styles;->padding:I

    move/from16 v22, v0

    move/from16 v0, v22

    int-to-float v0, v0

    move/from16 v22, v0

    add-float v22, v22, v10

    int-to-float v0, v6

    move/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget v0, v0, Lcom/jjoe64/graphview/LegendRenderer$Styles;->textSize:F

    move/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget v0, v0, Lcom/jjoe64/graphview/LegendRenderer$Styles;->spacing:I

    move/from16 v25, v0

    move/from16 v0, v25

    int-to-float v0, v0

    move/from16 v25, v0

    add-float v24, v24, v25

    mul-float v23, v23, v24

    add-float v22, v22, v23

    int-to-float v0, v15

    move/from16 v23, v0

    add-float v22, v22, v23

    invoke-direct/range {v18 .. v22}, Landroid/graphics/RectF;-><init>(FFFF)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v19, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 225
    invoke-interface {v14}, Lcom/jjoe64/graphview/series/Series;->getTitle()Ljava/lang/String;

    move-result-object v18

    if-eqz v18, :cond_35e

    .line 226
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget v0, v0, Lcom/jjoe64/graphview/LegendRenderer$Styles;->textColor:I

    move/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Landroid/graphics/Paint;->setColor(I)V

    .line 227
    invoke-interface {v14}, Lcom/jjoe64/graphview/series/Series;->getTitle()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget v0, v0, Lcom/jjoe64/graphview/LegendRenderer$Styles;->padding:I

    move/from16 v19, v0

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    add-float v19, v19, v8

    int-to-float v0, v15

    move/from16 v20, v0

    add-float v19, v19, v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget v0, v0, Lcom/jjoe64/graphview/LegendRenderer$Styles;->spacing:I

    move/from16 v20, v0

    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v20, v0

    add-float v19, v19, v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget v0, v0, Lcom/jjoe64/graphview/LegendRenderer$Styles;->padding:I

    move/from16 v20, v0

    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v20, v0

    add-float v20, v20, v10

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget v0, v0, Lcom/jjoe64/graphview/LegendRenderer$Styles;->textSize:F

    move/from16 v21, v0

    add-float v20, v20, v21

    int-to-float v0, v6

    move/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget v0, v0, Lcom/jjoe64/graphview/LegendRenderer$Styles;->textSize:F

    move/from16 v22, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget v0, v0, Lcom/jjoe64/graphview/LegendRenderer$Styles;->spacing:I

    move/from16 v23, v0

    move/from16 v0, v23

    int-to-float v0, v0

    move/from16 v23, v0

    add-float v22, v22, v23

    mul-float v21, v21, v22

    add-float v20, v20, v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v21, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    move/from16 v2, v19

    move/from16 v3, v20

    move-object/from16 v4, v21

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 229
    :cond_35e
    add-int/lit8 v6, v6, 0x1

    .line 230
    goto/16 :goto_1eb

    .line 204
    .end local v6    # "i":I
    .end local v7    # "lBottom":F
    .end local v8    # "lLeft":F
    .end local v9    # "lRight":F
    .end local v10    # "lTop":F
    .end local v14    # "series":Lcom/jjoe64/graphview/series/Series;
    :cond_362
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/jjoe64/graphview/GraphView;->getGraphContentLeft()I

    move-result v17

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/jjoe64/graphview/GraphView;->getGraphContentWidth()I

    move-result v18

    add-int v17, v17, v18

    sub-int v17, v17, v12

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget v0, v0, Lcom/jjoe64/graphview/LegendRenderer$Styles;->margin:I

    move/from16 v18, v0

    sub-int v17, v17, v18

    move/from16 v0, v17

    int-to-float v8, v0

    .line 205
    .restart local v8    # "lLeft":F
    sget-object v17, Lcom/jjoe64/graphview/LegendRenderer$1;->$SwitchMap$com$jjoe64$graphview$LegendRenderer$LegendAlign:[I

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer$Styles;->align:Lcom/jjoe64/graphview/LegendRenderer$LegendAlign;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/jjoe64/graphview/LegendRenderer$LegendAlign;->ordinal()I

    move-result v18

    aget v17, v17, v18

    packed-switch v17, :pswitch_data_41a

    .line 213
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/jjoe64/graphview/GraphView;->getGraphContentTop()I

    move-result v17

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/jjoe64/graphview/GraphView;->getGraphContentHeight()I

    move-result v18

    add-int v17, v17, v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget v0, v0, Lcom/jjoe64/graphview/LegendRenderer$Styles;->margin:I

    move/from16 v18, v0

    sub-int v17, v17, v18

    move/from16 v0, v17

    int-to-float v0, v0

    move/from16 v17, v0

    sub-float v17, v17, v11

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget v0, v0, Lcom/jjoe64/graphview/LegendRenderer$Styles;->padding:I

    move/from16 v18, v0

    mul-int/lit8 v18, v18, 0x2

    move/from16 v0, v18

    int-to-float v0, v0

    move/from16 v18, v0

    sub-float v10, v17, v18

    .restart local v10    # "lTop":F
    goto/16 :goto_197

    .line 207
    .end local v10    # "lTop":F
    :pswitch_3e4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/jjoe64/graphview/GraphView;->getGraphContentTop()I

    move-result v17

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget v0, v0, Lcom/jjoe64/graphview/LegendRenderer$Styles;->margin:I

    move/from16 v18, v0

    add-int v17, v17, v18

    move/from16 v0, v17

    int-to-float v10, v0

    .line 208
    .restart local v10    # "lTop":F
    goto/16 :goto_197

    .line 210
    .end local v10    # "lTop":F
    :pswitch_401
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/jjoe64/graphview/GraphView;->getHeight()I

    move-result v17

    div-int/lit8 v17, v17, 0x2

    move/from16 v0, v17

    int-to-float v0, v0

    move/from16 v17, v0

    const/high16 v18, 0x40000000    # 2.0f

    div-float v18, v11, v18

    sub-float v10, v17, v18

    .line 211
    .restart local v10    # "lTop":F
    goto/16 :goto_197

    .line 205
    :pswitch_data_41a
    .packed-switch 0x1
        :pswitch_3e4
        :pswitch_401
    .end packed-switch
.end method

.method public getAlign()Lcom/jjoe64/graphview/LegendRenderer$LegendAlign;
    .registers 2

    .prologue
    .line 360
    iget-object v0, p0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    iget-object v0, v0, Lcom/jjoe64/graphview/LegendRenderer$Styles;->align:Lcom/jjoe64/graphview/LegendRenderer$LegendAlign;

    return-object v0
.end method

.method public getBackgroundColor()I
    .registers 2

    .prologue
    .line 328
    iget-object v0, p0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    iget v0, v0, Lcom/jjoe64/graphview/LegendRenderer$Styles;->backgroundColor:I

    return v0
.end method

.method public getMargin()I
    .registers 2

    .prologue
    .line 345
    iget-object v0, p0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    iget v0, v0, Lcom/jjoe64/graphview/LegendRenderer$Styles;->margin:I

    return v0
.end method

.method public getPadding()I
    .registers 2

    .prologue
    .line 290
    iget-object v0, p0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    iget v0, v0, Lcom/jjoe64/graphview/LegendRenderer$Styles;->padding:I

    return v0
.end method

.method public getSpacing()I
    .registers 2

    .prologue
    .line 271
    iget-object v0, p0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    iget v0, v0, Lcom/jjoe64/graphview/LegendRenderer$Styles;->spacing:I

    return v0
.end method

.method public getTextColor()I
    .registers 2

    .prologue
    .line 374
    iget-object v0, p0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    iget v0, v0, Lcom/jjoe64/graphview/LegendRenderer$Styles;->textColor:I

    return v0
.end method

.method public getTextSize()F
    .registers 2

    .prologue
    .line 253
    iget-object v0, p0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    iget v0, v0, Lcom/jjoe64/graphview/LegendRenderer$Styles;->textSize:F

    return v0
.end method

.method public getWidth()I
    .registers 2

    .prologue
    .line 310
    iget-object v0, p0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    iget v0, v0, Lcom/jjoe64/graphview/LegendRenderer$Styles;->width:I

    return v0
.end method

.method public isVisible()Z
    .registers 2

    .prologue
    .line 237
    iget-boolean v0, p0, Lcom/jjoe64/graphview/LegendRenderer;->mIsVisible:Z

    return v0
.end method

.method public resetStyles()V
    .registers 12

    .prologue
    const/4 v10, 0x1

    const/high16 v8, 0x40a00000    # 5.0f

    const/16 v7, 0x64

    const/4 v9, 0x0

    .line 126
    iget-object v4, p0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    sget-object v5, Lcom/jjoe64/graphview/LegendRenderer$LegendAlign;->MIDDLE:Lcom/jjoe64/graphview/LegendRenderer$LegendAlign;

    iput-object v5, v4, Lcom/jjoe64/graphview/LegendRenderer$Styles;->align:Lcom/jjoe64/graphview/LegendRenderer$LegendAlign;

    .line 127
    iget-object v4, p0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    iget-object v5, p0, Lcom/jjoe64/graphview/LegendRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    invoke-virtual {v5}, Lcom/jjoe64/graphview/GraphView;->getGridLabelRenderer()Lcom/jjoe64/graphview/GridLabelRenderer;

    move-result-object v5

    invoke-virtual {v5}, Lcom/jjoe64/graphview/GridLabelRenderer;->getTextSize()F

    move-result v5

    iput v5, v4, Lcom/jjoe64/graphview/LegendRenderer$Styles;->textSize:F

    .line 128
    iget-object v4, p0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    iget-object v5, p0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    iget v5, v5, Lcom/jjoe64/graphview/LegendRenderer$Styles;->textSize:F

    div-float/2addr v5, v8

    float-to-int v5, v5

    iput v5, v4, Lcom/jjoe64/graphview/LegendRenderer$Styles;->spacing:I

    .line 129
    iget-object v4, p0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    iget-object v5, p0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    iget v5, v5, Lcom/jjoe64/graphview/LegendRenderer$Styles;->textSize:F

    const/high16 v6, 0x40000000    # 2.0f

    div-float/2addr v5, v6

    float-to-int v5, v5

    iput v5, v4, Lcom/jjoe64/graphview/LegendRenderer$Styles;->padding:I

    .line 130
    iget-object v4, p0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    iput v9, v4, Lcom/jjoe64/graphview/LegendRenderer$Styles;->width:I

    .line 131
    iget-object v4, p0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    const/16 v5, 0xb4

    invoke-static {v5, v7, v7, v7}, Landroid/graphics/Color;->argb(IIII)I

    move-result v5

    iput v5, v4, Lcom/jjoe64/graphview/LegendRenderer$Styles;->backgroundColor:I

    .line 132
    iget-object v4, p0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    iget-object v5, p0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    iget v5, v5, Lcom/jjoe64/graphview/LegendRenderer$Styles;->textSize:F

    div-float/2addr v5, v8

    float-to-int v5, v5

    iput v5, v4, Lcom/jjoe64/graphview/LegendRenderer$Styles;->margin:I

    .line 135
    new-instance v3, Landroid/util/TypedValue;

    invoke-direct {v3}, Landroid/util/TypedValue;-><init>()V

    .line 136
    .local v3, "typedValue":Landroid/util/TypedValue;
    iget-object v4, p0, Lcom/jjoe64/graphview/LegendRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    invoke-virtual {v4}, Lcom/jjoe64/graphview/GraphView;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v4

    const v5, 0x1010042

    invoke-virtual {v4, v5, v3, v10}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 141
    :try_start_5d
    iget-object v4, p0, Lcom/jjoe64/graphview/LegendRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    invoke-virtual {v4}, Lcom/jjoe64/graphview/GraphView;->getContext()Landroid/content/Context;

    move-result-object v4

    iget v5, v3, Landroid/util/TypedValue;->data:I

    const/4 v6, 0x1

    new-array v6, v6, [I

    const/4 v7, 0x0

    const v8, 0x1010036

    aput v8, v6, v7

    invoke-virtual {v4, v5, v6}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 143
    .local v0, "array":Landroid/content/res/TypedArray;
    const/4 v4, 0x0

    const/high16 v5, -0x1000000

    invoke-virtual {v0, v4, v5}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    .line 144
    .local v1, "color1":I
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V
    :try_end_7c
    .catch Ljava/lang/Exception; {:try_start_5d .. :try_end_7c} :catch_83

    .line 149
    .end local v0    # "array":Landroid/content/res/TypedArray;
    :goto_7c
    iget-object v4, p0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    iput v1, v4, Lcom/jjoe64/graphview/LegendRenderer$Styles;->textColor:I

    .line 151
    iput v9, p0, Lcom/jjoe64/graphview/LegendRenderer;->cachedLegendWidth:I

    .line 152
    return-void

    .line 145
    .end local v1    # "color1":I
    :catch_83
    move-exception v2

    .line 146
    .local v2, "e":Ljava/lang/Exception;
    const/high16 v1, -0x1000000

    .restart local v1    # "color1":I
    goto :goto_7c
.end method

.method public setAlign(Lcom/jjoe64/graphview/LegendRenderer$LegendAlign;)V
    .registers 3
    .param p1, "align"    # Lcom/jjoe64/graphview/LegendRenderer$LegendAlign;

    .prologue
    .line 367
    iget-object v0, p0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    iput-object p1, v0, Lcom/jjoe64/graphview/LegendRenderer$Styles;->align:Lcom/jjoe64/graphview/LegendRenderer$LegendAlign;

    .line 368
    return-void
.end method

.method public setBackgroundColor(I)V
    .registers 3
    .param p1, "backgroundColor"    # I

    .prologue
    .line 337
    iget-object v0, p0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    iput p1, v0, Lcom/jjoe64/graphview/LegendRenderer$Styles;->backgroundColor:I

    .line 338
    return-void
.end method

.method public setFixedPosition(II)V
    .registers 5
    .param p1, "x"    # I
    .param p2, "y"    # I

    .prologue
    .line 392
    iget-object v0, p0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    new-instance v1, Landroid/graphics/Point;

    invoke-direct {v1, p1, p2}, Landroid/graphics/Point;-><init>(II)V

    iput-object v1, v0, Lcom/jjoe64/graphview/LegendRenderer$Styles;->fixedPosition:Landroid/graphics/Point;

    .line 393
    return-void
.end method

.method public setMargin(I)V
    .registers 3
    .param p1, "margin"    # I

    .prologue
    .line 353
    iget-object v0, p0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    iput p1, v0, Lcom/jjoe64/graphview/LegendRenderer$Styles;->margin:I

    .line 354
    return-void
.end method

.method public setPadding(I)V
    .registers 3
    .param p1, "padding"    # I

    .prologue
    .line 300
    iget-object v0, p0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    iput p1, v0, Lcom/jjoe64/graphview/LegendRenderer$Styles;->padding:I

    .line 301
    return-void
.end method

.method public setSpacing(I)V
    .registers 3
    .param p1, "spacing"    # I

    .prologue
    .line 280
    iget-object v0, p0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    iput p1, v0, Lcom/jjoe64/graphview/LegendRenderer$Styles;->spacing:I

    .line 281
    return-void
.end method

.method public setTextColor(I)V
    .registers 3
    .param p1, "textColor"    # I

    .prologue
    .line 381
    iget-object v0, p0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    iput p1, v0, Lcom/jjoe64/graphview/LegendRenderer$Styles;->textColor:I

    .line 382
    return-void
.end method

.method public setTextSize(F)V
    .registers 3
    .param p1, "textSize"    # F

    .prologue
    .line 263
    iget-object v0, p0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    iput p1, v0, Lcom/jjoe64/graphview/LegendRenderer$Styles;->textSize:F

    .line 264
    const/4 v0, 0x0

    iput v0, p0, Lcom/jjoe64/graphview/LegendRenderer;->cachedLegendWidth:I

    .line 265
    return-void
.end method

.method public setVisible(Z)V
    .registers 2
    .param p1, "mIsVisible"    # Z

    .prologue
    .line 246
    iput-boolean p1, p0, Lcom/jjoe64/graphview/LegendRenderer;->mIsVisible:Z

    .line 247
    return-void
.end method

.method public setWidth(I)V
    .registers 3
    .param p1, "width"    # I

    .prologue
    .line 319
    iget-object v0, p0, Lcom/jjoe64/graphview/LegendRenderer;->mStyles:Lcom/jjoe64/graphview/LegendRenderer$Styles;

    iput p1, v0, Lcom/jjoe64/graphview/LegendRenderer$Styles;->width:I

    .line 320
    return-void
.end method
