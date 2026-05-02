.class public Lcom/jjoe64/graphview/series/BarGraphSeries;
.super Lcom/jjoe64/graphview/series/BaseSeries;
.source "BarGraphSeries.java"


# annotations
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
.field private mDataPoints:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Landroid/graphics/RectF;",
            "TE;>;"
        }
    .end annotation
.end field

.field private mDrawValuesOnTop:Z

.field private mPaint:Landroid/graphics/Paint;

.field private mSpacing:I

.field private mValueDependentColor:Lcom/jjoe64/graphview/ValueDependentColor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/jjoe64/graphview/ValueDependentColor",
            "<TE;>;"
        }
    .end annotation
.end field

.field private mValuesOnTopColor:I

.field private mValuesOnTopSize:F


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 90
    .local p0, "this":Lcom/jjoe64/graphview/series/BarGraphSeries;, "Lcom/jjoe64/graphview/series/BarGraphSeries<TE;>;"
    invoke-direct {p0}, Lcom/jjoe64/graphview/series/BaseSeries;-><init>()V

    .line 85
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/jjoe64/graphview/series/BarGraphSeries;->mDataPoints:Ljava/util/Map;

    .line 91
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/jjoe64/graphview/series/BarGraphSeries;->mPaint:Landroid/graphics/Paint;

    .line 92
    return-void
.end method

.method public constructor <init>([Lcom/jjoe64/graphview/series/DataPointInterface;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TE;)V"
        }
    .end annotation

    .prologue
    .line 100
    .local p0, "this":Lcom/jjoe64/graphview/series/BarGraphSeries;, "Lcom/jjoe64/graphview/series/BarGraphSeries<TE;>;"
    .local p1, "data":[Lcom/jjoe64/graphview/series/DataPointInterface;, "[TE;"
    invoke-direct {p0, p1}, Lcom/jjoe64/graphview/series/BaseSeries;-><init>([Lcom/jjoe64/graphview/series/DataPointInterface;)V

    .line 85
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/jjoe64/graphview/series/BarGraphSeries;->mDataPoints:Ljava/util/Map;

    .line 101
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/jjoe64/graphview/series/BarGraphSeries;->mPaint:Landroid/graphics/Paint;

    .line 102
    return-void
.end method


# virtual methods
.method public draw(Lcom/jjoe64/graphview/GraphView;Landroid/graphics/Canvas;Z)V
    .registers 76
    .param p1, "graphView"    # Lcom/jjoe64/graphview/GraphView;
    .param p2, "canvas"    # Landroid/graphics/Canvas;
    .param p3, "isSecondScale"    # Z

    .prologue
    .line 113
    .local p0, "this":Lcom/jjoe64/graphview/series/BarGraphSeries;, "Lcom/jjoe64/graphview/series/BarGraphSeries<TE;>;"
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/jjoe64/graphview/series/BarGraphSeries;->mPaint:Landroid/graphics/Paint;

    sget-object v10, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v5, v10}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 114
    move-object/from16 v0, p0

    iget v5, v0, Lcom/jjoe64/graphview/series/BarGraphSeries;->mValuesOnTopSize:F

    const/4 v10, 0x0

    cmpl-float v5, v5, v10

    if-nez v5, :cond_1e

    .line 115
    invoke-virtual/range {p1 .. p1}, Lcom/jjoe64/graphview/GraphView;->getGridLabelRenderer()Lcom/jjoe64/graphview/GridLabelRenderer;

    move-result-object v5

    invoke-virtual {v5}, Lcom/jjoe64/graphview/GridLabelRenderer;->getTextSize()F

    move-result v5

    move-object/from16 v0, p0

    iput v5, v0, Lcom/jjoe64/graphview/series/BarGraphSeries;->mValuesOnTopSize:F

    .line 117
    :cond_1e
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/jjoe64/graphview/series/BarGraphSeries;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget v10, v0, Lcom/jjoe64/graphview/series/BarGraphSeries;->mValuesOnTopSize:F

    invoke-virtual {v5, v10}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 120
    invoke-virtual/range {p1 .. p1}, Lcom/jjoe64/graphview/GraphView;->getViewport()Lcom/jjoe64/graphview/Viewport;

    move-result-object v5

    const/4 v10, 0x0

    invoke-virtual {v5, v10}, Lcom/jjoe64/graphview/Viewport;->getMaxX(Z)D

    move-result-wide v30

    .line 121
    .local v30, "maxX":D
    invoke-virtual/range {p1 .. p1}, Lcom/jjoe64/graphview/GraphView;->getViewport()Lcom/jjoe64/graphview/Viewport;

    move-result-object v5

    const/4 v10, 0x0

    invoke-virtual {v5, v10}, Lcom/jjoe64/graphview/Viewport;->getMinX(Z)D

    move-result-wide v36

    .line 125
    .local v36, "minX":D
    if-eqz p3, :cond_c5

    .line 126
    invoke-virtual/range {p1 .. p1}, Lcom/jjoe64/graphview/GraphView;->getSecondScale()Lcom/jjoe64/graphview/SecondScale;

    move-result-object v5

    invoke-virtual {v5}, Lcom/jjoe64/graphview/SecondScale;->getMaxY()D

    move-result-wide v32

    .line 127
    .local v32, "maxY":D
    invoke-virtual/range {p1 .. p1}, Lcom/jjoe64/graphview/GraphView;->getSecondScale()Lcom/jjoe64/graphview/SecondScale;

    move-result-object v5

    invoke-virtual {v5}, Lcom/jjoe64/graphview/SecondScale;->getMinY()D

    move-result-wide v38

    .line 136
    .local v38, "minY":D
    :goto_4d
    const/16 v40, 0x0

    .line 137
    .local v40, "numBarSeries":I
    const/16 v21, 0x0

    .line 138
    .local v21, "currentSeriesOrder":I
    const/16 v42, 0x0

    .line 140
    .local v42, "numValues":I
    new-instance v63, Ljava/util/TreeSet;

    invoke-direct/range {v63 .. v63}, Ljava/util/TreeSet;-><init>()V

    .line 141
    .local v63, "xVals":Ljava/util/SortedSet;, "Ljava/util/SortedSet<Ljava/lang/Double;>;"
    invoke-virtual/range {p1 .. p1}, Lcom/jjoe64/graphview/GraphView;->getSeries()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :cond_60
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_dc

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v27

    check-cast v27, Lcom/jjoe64/graphview/series/Series;

    .line 142
    .local v27, "inspectedSeries":Lcom/jjoe64/graphview/series/Series;
    move-object/from16 v0, v27

    instance-of v5, v0, Lcom/jjoe64/graphview/series/BarGraphSeries;

    if-eqz v5, :cond_60

    .line 143
    move-object/from16 v0, v27

    move-object/from16 v1, p0

    if-ne v0, v1, :cond_d9

    const/16 v28, 0x1

    .line 144
    .local v28, "isCurrentSeries":Z
    :goto_7a
    if-eqz v28, :cond_7e

    .line 145
    move/from16 v21, v40

    .line 147
    :cond_7e
    add-int/lit8 v40, v40, 0x1

    .line 154
    move-object/from16 v0, v27

    move-wide/from16 v1, v36

    move-wide/from16 v3, v30

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/jjoe64/graphview/series/Series;->getValues(DD)Ljava/util/Iterator;

    move-result-object v20

    .line 155
    .local v20, "curValues":Ljava/util/Iterator;, "Ljava/util/Iterator<TE;>;"
    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_60

    .line 156
    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/jjoe64/graphview/series/DataPointInterface;

    invoke-interface {v5}, Lcom/jjoe64/graphview/series/DataPointInterface;->getX()D

    move-result-wide v68

    invoke-static/range {v68 .. v69}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    move-object/from16 v0, v63

    invoke-interface {v0, v5}, Ljava/util/SortedSet;->add(Ljava/lang/Object;)Z

    .line 157
    if-eqz v28, :cond_a7

    add-int/lit8 v42, v42, 0x1

    .line 158
    :cond_a7
    :goto_a7
    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_60

    .line 159
    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/jjoe64/graphview/series/DataPointInterface;

    invoke-interface {v5}, Lcom/jjoe64/graphview/series/DataPointInterface;->getX()D

    move-result-wide v68

    invoke-static/range {v68 .. v69}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    move-object/from16 v0, v63

    invoke-interface {v0, v5}, Ljava/util/SortedSet;->add(Ljava/lang/Object;)Z

    .line 160
    if-eqz v28, :cond_a7

    add-int/lit8 v42, v42, 0x1

    goto :goto_a7

    .line 129
    .end local v20    # "curValues":Ljava/util/Iterator;, "Ljava/util/Iterator<TE;>;"
    .end local v21    # "currentSeriesOrder":I
    .end local v27    # "inspectedSeries":Lcom/jjoe64/graphview/series/Series;
    .end local v28    # "isCurrentSeries":Z
    .end local v32    # "maxY":D
    .end local v38    # "minY":D
    .end local v40    # "numBarSeries":I
    .end local v42    # "numValues":I
    .end local v63    # "xVals":Ljava/util/SortedSet;, "Ljava/util/SortedSet<Ljava/lang/Double;>;"
    :cond_c5
    invoke-virtual/range {p1 .. p1}, Lcom/jjoe64/graphview/GraphView;->getViewport()Lcom/jjoe64/graphview/Viewport;

    move-result-object v5

    const/4 v10, 0x0

    invoke-virtual {v5, v10}, Lcom/jjoe64/graphview/Viewport;->getMaxY(Z)D

    move-result-wide v32

    .line 130
    .restart local v32    # "maxY":D
    invoke-virtual/range {p1 .. p1}, Lcom/jjoe64/graphview/GraphView;->getViewport()Lcom/jjoe64/graphview/Viewport;

    move-result-object v5

    const/4 v10, 0x0

    invoke-virtual {v5, v10}, Lcom/jjoe64/graphview/Viewport;->getMinY(Z)D

    move-result-wide v38

    .restart local v38    # "minY":D
    goto/16 :goto_4d

    .line 143
    .restart local v21    # "currentSeriesOrder":I
    .restart local v27    # "inspectedSeries":Lcom/jjoe64/graphview/series/Series;
    .restart local v40    # "numBarSeries":I
    .restart local v42    # "numValues":I
    .restart local v63    # "xVals":Ljava/util/SortedSet;, "Ljava/util/SortedSet<Ljava/lang/Double;>;"
    :cond_d9
    const/16 v28, 0x0

    goto :goto_7a

    .line 165
    .end local v27    # "inspectedSeries":Lcom/jjoe64/graphview/series/Series;
    :cond_dc
    if-nez v42, :cond_df

    .line 270
    :cond_de
    return-void

    .line 169
    :cond_df
    const/16 v29, 0x0

    .line 170
    .local v29, "lastVal":Ljava/lang/Double;
    const-wide/16 v34, 0x0

    .line 171
    .local v34, "minGap":D
    invoke-interface/range {v63 .. v63}, Ljava/util/SortedSet;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_e7
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_118

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/lang/Double;

    .line 172
    .local v19, "curVal":Ljava/lang/Double;
    if-eqz v29, :cond_115

    .line 173
    invoke-virtual/range {v19 .. v19}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v68

    invoke-virtual/range {v29 .. v29}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v70

    sub-double v68, v68, v70

    invoke-static/range {v68 .. v69}, Ljava/lang/Math;->abs(D)D

    move-result-wide v17

    .line 174
    .local v17, "curGap":D
    const-wide/16 v68, 0x0

    cmpl-double v10, v34, v68

    if-eqz v10, :cond_113

    const-wide/16 v68, 0x0

    cmpl-double v10, v17, v68

    if-lez v10, :cond_115

    cmpg-double v10, v17, v34

    if-gez v10, :cond_115

    .line 175
    :cond_113
    move-wide/from16 v34, v17

    .line 178
    .end local v17    # "curGap":D
    :cond_115
    move-object/from16 v29, v19

    .line 179
    goto :goto_e7

    .line 181
    .end local v19    # "curVal":Ljava/lang/Double;
    :cond_118
    const-wide/16 v68, 0x0

    cmpl-double v5, v34, v68

    if-nez v5, :cond_294

    const/16 v41, 0x1

    .line 183
    .local v41, "numBarSlots":I
    :goto_120
    move-object/from16 v0, p0

    move-wide/from16 v1, v36

    move-wide/from16 v3, v30

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/jjoe64/graphview/series/BarGraphSeries;->getValues(DD)Ljava/util/Iterator;

    move-result-object v60

    .line 187
    .local v60, "values":Ljava/util/Iterator;, "Ljava/util/Iterator<TE;>;"
    const/4 v5, 0x1

    move/from16 v0, v41

    if-ne v0, v5, :cond_2a3

    .line 188
    invoke-virtual/range {p1 .. p1}, Lcom/jjoe64/graphview/GraphView;->getGraphContentWidth()I

    move-result v5

    int-to-float v11, v5

    .line 190
    .local v11, "barSlotWidth":F
    :goto_134
    const-string v5, "BarGraphSeries"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v68, "numBars="

    move-object/from16 v0, v68

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    move/from16 v0, v41

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v5, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 193
    move-object/from16 v0, p0

    iget v5, v0, Lcom/jjoe64/graphview/series/BarGraphSeries;->mSpacing:I

    int-to-float v5, v5

    mul-float/2addr v5, v11

    const/high16 v10, 0x42c80000    # 100.0f

    div-float/2addr v5, v10

    const v10, 0x3f7ae148    # 0.98f

    mul-float/2addr v10, v11

    invoke-static {v5, v10}, Ljava/lang/Math;->min(FF)F

    move-result v51

    .line 195
    .local v51, "spacing":F
    sub-float v5, v11, v51

    move/from16 v0, v40

    int-to-float v10, v0

    div-float v12, v5, v10

    .line 197
    .local v12, "barWidth":F
    const/high16 v5, 0x40000000    # 2.0f

    div-float v43, v11, v5

    .line 199
    .local v43, "offset":F
    sub-double v24, v32, v38

    .line 200
    .local v24, "diffY":D
    sub-double v22, v30, v36

    .line 201
    .local v22, "diffX":D
    invoke-virtual/range {p1 .. p1}, Lcom/jjoe64/graphview/GraphView;->getGraphContentHeight()I

    move-result v5

    int-to-float v13, v5

    .line 202
    .local v13, "contentHeight":F
    invoke-virtual/range {p1 .. p1}, Lcom/jjoe64/graphview/GraphView;->getGraphContentWidth()I

    move-result v5

    int-to-float v0, v5

    move/from16 v16, v0

    .line 203
    .local v16, "contentWidth":F
    invoke-virtual/range {p1 .. p1}, Lcom/jjoe64/graphview/GraphView;->getGraphContentLeft()I

    move-result v5

    int-to-float v14, v5

    .line 204
    .local v14, "contentLeft":F
    invoke-virtual/range {p1 .. p1}, Lcom/jjoe64/graphview/GraphView;->getGraphContentTop()I

    move-result v5

    int-to-float v15, v5

    .line 207
    .local v15, "contentTop":F
    const/16 v26, 0x0

    .line 208
    .local v26, "i":I
    :goto_188
    invoke-interface/range {v60 .. v60}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_de

    .line 209
    invoke-interface/range {v60 .. v60}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v59

    check-cast v59, Lcom/jjoe64/graphview/series/DataPointInterface;

    .line 211
    .local v59, "value":Lcom/jjoe64/graphview/series/DataPointInterface;, "TE;"
    invoke-interface/range {v59 .. v59}, Lcom/jjoe64/graphview/series/DataPointInterface;->getY()D

    move-result-wide v68

    sub-double v55, v68, v38

    .line 212
    .local v55, "valY":D
    div-double v46, v55, v24

    .line 213
    .local v46, "ratY":D
    float-to-double v0, v13

    move-wide/from16 v68, v0

    mul-double v64, v68, v46

    .line 215
    .local v64, "y":D
    const-wide/16 v68, 0x0

    sub-double v57, v68, v38

    .line 216
    .local v57, "valY0":D
    div-double v48, v57, v24

    .line 217
    .local v48, "ratY0":D
    float-to-double v0, v13

    move-wide/from16 v68, v0

    mul-double v66, v68, v48

    .line 219
    .local v66, "y0":D
    invoke-interface/range {v59 .. v59}, Lcom/jjoe64/graphview/series/DataPointInterface;->getX()D

    move-result-wide v68

    sub-double v53, v68, v36

    .line 220
    .local v53, "valX":D
    div-double v44, v53, v22

    .line 221
    .local v44, "ratX":D
    move/from16 v0, v16

    float-to-double v0, v0

    move-wide/from16 v68, v0

    mul-double v61, v68, v44

    .line 224
    .local v61, "x":D
    invoke-virtual/range {p0 .. p0}, Lcom/jjoe64/graphview/series/BarGraphSeries;->getValueDependentColor()Lcom/jjoe64/graphview/ValueDependentColor;

    move-result-object v5

    if-eqz v5, :cond_2ad

    .line 225
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/jjoe64/graphview/series/BarGraphSeries;->mPaint:Landroid/graphics/Paint;

    invoke-virtual/range {p0 .. p0}, Lcom/jjoe64/graphview/series/BarGraphSeries;->getValueDependentColor()Lcom/jjoe64/graphview/ValueDependentColor;

    move-result-object v10

    move-object/from16 v0, v59

    invoke-interface {v10, v0}, Lcom/jjoe64/graphview/ValueDependentColor;->get(Lcom/jjoe64/graphview/series/DataPointInterface;)I

    move-result v10

    invoke-virtual {v5, v10}, Landroid/graphics/Paint;->setColor(I)V

    .line 230
    :goto_1d2
    move-wide/from16 v0, v61

    double-to-float v5, v0

    add-float/2addr v5, v14

    sub-float v5, v5, v43

    const/high16 v10, 0x40000000    # 2.0f

    div-float v10, v51, v10

    add-float/2addr v5, v10

    move/from16 v0, v21

    int-to-float v10, v0

    mul-float/2addr v10, v12

    add-float v6, v5, v10

    .line 231
    .local v6, "left":F
    move-wide/from16 v0, v64

    double-to-float v5, v0

    sub-float v5, v15, v5

    add-float v7, v5, v13

    .line 232
    .local v7, "top":F
    add-float v8, v6, v12

    .line 233
    .local v8, "right":F
    move-wide/from16 v0, v66

    double-to-float v5, v0

    sub-float v5, v15, v5

    add-float v10, v5, v13

    invoke-virtual/range {p1 .. p1}, Lcom/jjoe64/graphview/GraphView;->getGridLabelRenderer()Lcom/jjoe64/graphview/GridLabelRenderer;

    move-result-object v5

    invoke-virtual {v5}, Lcom/jjoe64/graphview/GridLabelRenderer;->isHighlightZeroLines()Z

    move-result v5

    if-eqz v5, :cond_2ba

    const/4 v5, 0x4

    :goto_1fe
    int-to-float v5, v5

    sub-float v9, v10, v5

    .line 235
    .local v9, "bottom":F
    cmpl-float v5, v7, v9

    if-lez v5, :cond_2bd

    const/16 v50, 0x1

    .line 236
    .local v50, "reverse":Z
    :goto_207
    if-eqz v50, :cond_21b

    .line 237
    move/from16 v52, v7

    .line 238
    .local v52, "tmp":F
    invoke-virtual/range {p1 .. p1}, Lcom/jjoe64/graphview/GraphView;->getGridLabelRenderer()Lcom/jjoe64/graphview/GridLabelRenderer;

    move-result-object v5

    invoke-virtual {v5}, Lcom/jjoe64/graphview/GridLabelRenderer;->isHighlightZeroLines()Z

    move-result v5

    if-eqz v5, :cond_2c1

    const/4 v5, 0x4

    :goto_216
    int-to-float v5, v5

    add-float v7, v9, v5

    .line 239
    move/from16 v9, v52

    .line 243
    .end local v52    # "tmp":F
    :cond_21b
    invoke-static {v6, v14}, Ljava/lang/Math;->max(FF)F

    move-result v6

    .line 244
    add-float v5, v14, v16

    invoke-static {v8, v5}, Ljava/lang/Math;->min(FF)F

    move-result v8

    .line 245
    add-float v5, v15, v13

    invoke-static {v9, v5}, Ljava/lang/Math;->min(FF)F

    move-result v9

    .line 246
    invoke-static {v7, v15}, Ljava/lang/Math;->max(FF)F

    move-result v7

    .line 248
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/jjoe64/graphview/series/BarGraphSeries;->mDataPoints:Ljava/util/Map;

    new-instance v10, Landroid/graphics/RectF;

    invoke-direct {v10, v6, v7, v8, v9}, Landroid/graphics/RectF;-><init>(FFFF)V

    move-object/from16 v0, v59

    invoke-interface {v5, v10, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 250
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/jjoe64/graphview/series/BarGraphSeries;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v5, p2

    invoke-virtual/range {v5 .. v10}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 253
    move-object/from16 v0, p0

    iget-boolean v5, v0, Lcom/jjoe64/graphview/series/BarGraphSeries;->mDrawValuesOnTop:Z

    if-eqz v5, :cond_290

    .line 254
    if-eqz v50, :cond_2c4

    .line 255
    move-object/from16 v0, p0

    iget v5, v0, Lcom/jjoe64/graphview/series/BarGraphSeries;->mValuesOnTopSize:F

    add-float/2addr v5, v9

    const/high16 v10, 0x40800000    # 4.0f

    add-float v7, v5, v10

    .line 256
    add-float v5, v15, v13

    cmpl-float v5, v7, v5

    if-lez v5, :cond_25f

    add-float v7, v15, v13

    .line 262
    :cond_25f
    :goto_25f
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/jjoe64/graphview/series/BarGraphSeries;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget v10, v0, Lcom/jjoe64/graphview/series/BarGraphSeries;->mValuesOnTopColor:I

    invoke-virtual {v5, v10}, Landroid/graphics/Paint;->setColor(I)V

    .line 264
    invoke-virtual/range {p1 .. p1}, Lcom/jjoe64/graphview/GraphView;->getGridLabelRenderer()Lcom/jjoe64/graphview/GridLabelRenderer;

    move-result-object v5

    invoke-virtual {v5}, Lcom/jjoe64/graphview/GridLabelRenderer;->getLabelFormatter()Lcom/jjoe64/graphview/LabelFormatter;

    move-result-object v5

    invoke-interface/range {v59 .. v59}, Lcom/jjoe64/graphview/series/DataPointInterface;->getY()D

    move-result-wide v68

    const/4 v10, 0x0

    move-wide/from16 v0, v68

    invoke-interface {v5, v0, v1, v10}, Lcom/jjoe64/graphview/LabelFormatter;->formatLabel(DZ)Ljava/lang/String;

    move-result-object v5

    add-float v10, v6, v8

    const/high16 v68, 0x40000000    # 2.0f

    div-float v10, v10, v68

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/series/BarGraphSeries;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v68, v0

    .line 263
    move-object/from16 v0, p2

    move-object/from16 v1, v68

    invoke-virtual {v0, v5, v10, v7, v1}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 268
    :cond_290
    add-int/lit8 v26, v26, 0x1

    .line 269
    goto/16 :goto_188

    .line 181
    .end local v6    # "left":F
    .end local v7    # "top":F
    .end local v8    # "right":F
    .end local v9    # "bottom":F
    .end local v11    # "barSlotWidth":F
    .end local v12    # "barWidth":F
    .end local v13    # "contentHeight":F
    .end local v14    # "contentLeft":F
    .end local v15    # "contentTop":F
    .end local v16    # "contentWidth":F
    .end local v22    # "diffX":D
    .end local v24    # "diffY":D
    .end local v26    # "i":I
    .end local v41    # "numBarSlots":I
    .end local v43    # "offset":F
    .end local v44    # "ratX":D
    .end local v46    # "ratY":D
    .end local v48    # "ratY0":D
    .end local v50    # "reverse":Z
    .end local v51    # "spacing":F
    .end local v53    # "valX":D
    .end local v55    # "valY":D
    .end local v57    # "valY0":D
    .end local v59    # "value":Lcom/jjoe64/graphview/series/DataPointInterface;, "TE;"
    .end local v60    # "values":Ljava/util/Iterator;, "Ljava/util/Iterator<TE;>;"
    .end local v61    # "x":D
    .end local v64    # "y":D
    .end local v66    # "y0":D
    :cond_294
    sub-double v68, v30, v36

    div-double v68, v68, v34

    invoke-static/range {v68 .. v69}, Ljava/lang/Math;->round(D)J

    move-result-wide v68

    move-wide/from16 v0, v68

    long-to-int v5, v0

    add-int/lit8 v41, v5, 0x1

    goto/16 :goto_120

    .line 189
    .restart local v41    # "numBarSlots":I
    .restart local v60    # "values":Ljava/util/Iterator;, "Ljava/util/Iterator<TE;>;"
    :cond_2a3
    invoke-virtual/range {p1 .. p1}, Lcom/jjoe64/graphview/GraphView;->getGraphContentWidth()I

    move-result v5

    add-int/lit8 v10, v41, -0x1

    div-int/2addr v5, v10

    int-to-float v11, v5

    goto/16 :goto_134

    .line 227
    .restart local v11    # "barSlotWidth":F
    .restart local v12    # "barWidth":F
    .restart local v13    # "contentHeight":F
    .restart local v14    # "contentLeft":F
    .restart local v15    # "contentTop":F
    .restart local v16    # "contentWidth":F
    .restart local v22    # "diffX":D
    .restart local v24    # "diffY":D
    .restart local v26    # "i":I
    .restart local v43    # "offset":F
    .restart local v44    # "ratX":D
    .restart local v46    # "ratY":D
    .restart local v48    # "ratY0":D
    .restart local v51    # "spacing":F
    .restart local v53    # "valX":D
    .restart local v55    # "valY":D
    .restart local v57    # "valY0":D
    .restart local v59    # "value":Lcom/jjoe64/graphview/series/DataPointInterface;, "TE;"
    .restart local v61    # "x":D
    .restart local v64    # "y":D
    .restart local v66    # "y0":D
    :cond_2ad
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/jjoe64/graphview/series/BarGraphSeries;->mPaint:Landroid/graphics/Paint;

    invoke-virtual/range {p0 .. p0}, Lcom/jjoe64/graphview/series/BarGraphSeries;->getColor()I

    move-result v10

    invoke-virtual {v5, v10}, Landroid/graphics/Paint;->setColor(I)V

    goto/16 :goto_1d2

    .line 233
    .restart local v6    # "left":F
    .restart local v7    # "top":F
    .restart local v8    # "right":F
    :cond_2ba
    const/4 v5, 0x1

    goto/16 :goto_1fe

    .line 235
    .restart local v9    # "bottom":F
    :cond_2bd
    const/16 v50, 0x0

    goto/16 :goto_207

    .line 238
    .restart local v50    # "reverse":Z
    .restart local v52    # "tmp":F
    :cond_2c1
    const/4 v5, 0x1

    goto/16 :goto_216

    .line 258
    .end local v52    # "tmp":F
    :cond_2c4
    const/high16 v5, 0x40800000    # 4.0f

    sub-float/2addr v7, v5

    .line 259
    cmpg-float v5, v7, v15

    if-gtz v5, :cond_25f

    const/high16 v5, 0x40800000    # 4.0f

    add-float/2addr v5, v15

    add-float/2addr v7, v5

    goto :goto_25f
.end method

.method protected findDataPoint(FF)Lcom/jjoe64/graphview/series/DataPointInterface;
    .registers 6
    .param p1, "x"    # F
    .param p2, "y"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(FF)TE;"
        }
    .end annotation

    .prologue
    .line 371
    .local p0, "this":Lcom/jjoe64/graphview/series/BarGraphSeries;, "Lcom/jjoe64/graphview/series/BarGraphSeries<TE;>;"
    iget-object v1, p0, Lcom/jjoe64/graphview/series/BarGraphSeries;->mDataPoints:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_a
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4d

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 372
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroid/graphics/RectF;TE;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->left:F

    cmpl-float v1, p1, v1

    if-ltz v1, :cond_a

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->right:F

    cmpg-float v1, p1, v1

    if-gtz v1, :cond_a

    .line 373
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->top:F

    cmpl-float v1, p2, v1

    if-ltz v1, :cond_a

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->bottom:F

    cmpg-float v1, p2, v1

    if-gtz v1, :cond_a

    .line 374
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/jjoe64/graphview/series/DataPointInterface;

    .line 377
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroid/graphics/RectF;TE;>;"
    :goto_4c
    return-object v1

    :cond_4d
    const/4 v1, 0x0

    goto :goto_4c
.end method

.method public getSpacing()I
    .registers 2

    .prologue
    .line 294
    .local p0, "this":Lcom/jjoe64/graphview/series/BarGraphSeries;, "Lcom/jjoe64/graphview/series/BarGraphSeries<TE;>;"
    iget v0, p0, Lcom/jjoe64/graphview/series/BarGraphSeries;->mSpacing:I

    return v0
.end method

.method public getValueDependentColor()Lcom/jjoe64/graphview/ValueDependentColor;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/jjoe64/graphview/ValueDependentColor",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 276
    .local p0, "this":Lcom/jjoe64/graphview/series/BarGraphSeries;, "Lcom/jjoe64/graphview/series/BarGraphSeries<TE;>;"
    iget-object v0, p0, Lcom/jjoe64/graphview/series/BarGraphSeries;->mValueDependentColor:Lcom/jjoe64/graphview/ValueDependentColor;

    return-object v0
.end method

.method public getValuesOnTopColor()I
    .registers 2

    .prologue
    .line 326
    .local p0, "this":Lcom/jjoe64/graphview/series/BarGraphSeries;, "Lcom/jjoe64/graphview/series/BarGraphSeries<TE;>;"
    iget v0, p0, Lcom/jjoe64/graphview/series/BarGraphSeries;->mValuesOnTopColor:I

    return v0
.end method

.method public getValuesOnTopSize()F
    .registers 2

    .prologue
    .line 342
    .local p0, "this":Lcom/jjoe64/graphview/series/BarGraphSeries;, "Lcom/jjoe64/graphview/series/BarGraphSeries<TE;>;"
    iget v0, p0, Lcom/jjoe64/graphview/series/BarGraphSeries;->mValuesOnTopSize:F

    return v0
.end method

.method public isDrawValuesOnTop()Z
    .registers 2

    .prologue
    .line 310
    .local p0, "this":Lcom/jjoe64/graphview/series/BarGraphSeries;, "Lcom/jjoe64/graphview/series/BarGraphSeries<TE;>;"
    iget-boolean v0, p0, Lcom/jjoe64/graphview/series/BarGraphSeries;->mDrawValuesOnTop:Z

    return v0
.end method

.method protected resetDataPoints()V
    .registers 2

    .prologue
    .line 358
    .local p0, "this":Lcom/jjoe64/graphview/series/BarGraphSeries;, "Lcom/jjoe64/graphview/series/BarGraphSeries<TE;>;"
    iget-object v0, p0, Lcom/jjoe64/graphview/series/BarGraphSeries;->mDataPoints:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 359
    return-void
.end method

.method public setDrawValuesOnTop(Z)V
    .registers 2
    .param p1, "mDrawValuesOnTop"    # Z

    .prologue
    .line 318
    .local p0, "this":Lcom/jjoe64/graphview/series/BarGraphSeries;, "Lcom/jjoe64/graphview/series/BarGraphSeries<TE;>;"
    iput-boolean p1, p0, Lcom/jjoe64/graphview/series/BarGraphSeries;->mDrawValuesOnTop:Z

    .line 319
    return-void
.end method

.method public setSpacing(I)V
    .registers 2
    .param p1, "mSpacing"    # I

    .prologue
    .line 303
    .local p0, "this":Lcom/jjoe64/graphview/series/BarGraphSeries;, "Lcom/jjoe64/graphview/series/BarGraphSeries<TE;>;"
    iput p1, p0, Lcom/jjoe64/graphview/series/BarGraphSeries;->mSpacing:I

    .line 304
    return-void
.end method

.method public setValueDependentColor(Lcom/jjoe64/graphview/ValueDependentColor;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/jjoe64/graphview/ValueDependentColor",
            "<TE;>;)V"
        }
    .end annotation

    .prologue
    .line 287
    .local p0, "this":Lcom/jjoe64/graphview/series/BarGraphSeries;, "Lcom/jjoe64/graphview/series/BarGraphSeries<TE;>;"
    .local p1, "mValueDependentColor":Lcom/jjoe64/graphview/ValueDependentColor;, "Lcom/jjoe64/graphview/ValueDependentColor<TE;>;"
    iput-object p1, p0, Lcom/jjoe64/graphview/series/BarGraphSeries;->mValueDependentColor:Lcom/jjoe64/graphview/ValueDependentColor;

    .line 288
    return-void
.end method

.method public setValuesOnTopColor(I)V
    .registers 2
    .param p1, "mValuesOnTopColor"    # I

    .prologue
    .line 334
    .local p0, "this":Lcom/jjoe64/graphview/series/BarGraphSeries;, "Lcom/jjoe64/graphview/series/BarGraphSeries<TE;>;"
    iput p1, p0, Lcom/jjoe64/graphview/series/BarGraphSeries;->mValuesOnTopColor:I

    .line 335
    return-void
.end method

.method public setValuesOnTopSize(F)V
    .registers 2
    .param p1, "mValuesOnTopSize"    # F

    .prologue
    .line 350
    .local p0, "this":Lcom/jjoe64/graphview/series/BarGraphSeries;, "Lcom/jjoe64/graphview/series/BarGraphSeries<TE;>;"
    iput p1, p0, Lcom/jjoe64/graphview/series/BarGraphSeries;->mValuesOnTopSize:F

    .line 351
    return-void
.end method
