.class public Lcom/github/mikephil/charting/renderer/YAxisRenderer;
.super Lcom/github/mikephil/charting/renderer/AxisRenderer;
.source "YAxisRenderer.java"


# instance fields
.field protected mYAxis:Lcom/github/mikephil/charting/components/YAxis;

.field protected mZeroLinePaint:Landroid/graphics/Paint;


# direct methods
.method public constructor <init>(Lcom/github/mikephil/charting/utils/ViewPortHandler;Lcom/github/mikephil/charting/components/YAxis;Lcom/github/mikephil/charting/utils/Transformer;)V
    .registers 6
    .param p1, "viewPortHandler"    # Lcom/github/mikephil/charting/utils/ViewPortHandler;
    .param p2, "yAxis"    # Lcom/github/mikephil/charting/components/YAxis;
    .param p3, "trans"    # Lcom/github/mikephil/charting/utils/Transformer;

    .prologue
    .line 27
    invoke-direct {p0, p1, p3}, Lcom/github/mikephil/charting/renderer/AxisRenderer;-><init>(Lcom/github/mikephil/charting/utils/ViewPortHandler;Lcom/github/mikephil/charting/utils/Transformer;)V

    .line 29
    iput-object p2, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    .line 31
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mAxisLabelPaint:Landroid/graphics/Paint;

    const/high16 v1, -0x1000000

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 32
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mAxisLabelPaint:Landroid/graphics/Paint;

    const/high16 v1, 0x41200000    # 10.0f

    invoke-static {v1}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 34
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mZeroLinePaint:Landroid/graphics/Paint;

    .line 35
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mZeroLinePaint:Landroid/graphics/Paint;

    const v1, -0x777778

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 36
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mZeroLinePaint:Landroid/graphics/Paint;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 37
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mZeroLinePaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 38
    return-void
.end method


# virtual methods
.method public computeAxis(FF)V
    .registers 8
    .param p1, "yMin"    # F
    .param p2, "yMax"    # F

    .prologue
    .line 50
    iget-object v2, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentWidth()F

    move-result v2

    const/high16 v3, 0x41200000    # 10.0f

    cmpl-float v2, v2, v3

    if-lez v2, :cond_46

    iget-object v2, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isFullyZoomedOutY()Z

    move-result v2

    if-nez v2, :cond_46

    .line 52
    iget-object v2, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mTrans:Lcom/github/mikephil/charting/utils/Transformer;

    iget-object v3, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentLeft()F

    move-result v3

    iget-object v4, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentTop()F

    move-result v4

    invoke-virtual {v2, v3, v4}, Lcom/github/mikephil/charting/utils/Transformer;->getValuesByTouchPoint(FF)Lcom/github/mikephil/charting/utils/PointD;

    move-result-object v0

    .line 53
    .local v0, "p1":Lcom/github/mikephil/charting/utils/PointD;
    iget-object v2, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mTrans:Lcom/github/mikephil/charting/utils/Transformer;

    iget-object v3, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentLeft()F

    move-result v3

    iget-object v4, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentBottom()F

    move-result v4

    invoke-virtual {v2, v3, v4}, Lcom/github/mikephil/charting/utils/Transformer;->getValuesByTouchPoint(FF)Lcom/github/mikephil/charting/utils/PointD;

    move-result-object v1

    .line 55
    .local v1, "p2":Lcom/github/mikephil/charting/utils/PointD;
    iget-object v2, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/components/YAxis;->isInverted()Z

    move-result v2

    if-nez v2, :cond_4a

    .line 56
    iget-wide v2, v1, Lcom/github/mikephil/charting/utils/PointD;->y:D

    double-to-float p1, v2

    .line 57
    iget-wide v2, v0, Lcom/github/mikephil/charting/utils/PointD;->y:D

    double-to-float p2, v2

    .line 65
    .end local v0    # "p1":Lcom/github/mikephil/charting/utils/PointD;
    .end local v1    # "p2":Lcom/github/mikephil/charting/utils/PointD;
    :cond_46
    :goto_46
    invoke-virtual {p0, p1, p2}, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->computeAxisValues(FF)V

    .line 66
    return-void

    .line 60
    .restart local v0    # "p1":Lcom/github/mikephil/charting/utils/PointD;
    .restart local v1    # "p2":Lcom/github/mikephil/charting/utils/PointD;
    :cond_4a
    iget-wide v2, v0, Lcom/github/mikephil/charting/utils/PointD;->y:D

    double-to-float p1, v2

    .line 61
    iget-wide v2, v1, Lcom/github/mikephil/charting/utils/PointD;->y:D

    double-to-float p2, v2

    goto :goto_46
.end method

.method protected computeAxisValues(FF)V
    .registers 31
    .param p1, "min"    # F
    .param p2, "max"    # F

    .prologue
    .line 76
    move/from16 v23, p1

    .line 77
    .local v23, "yMin":F
    move/from16 v22, p2

    .line 79
    .local v22, "yMax":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lcom/github/mikephil/charting/components/YAxis;->getLabelCount()I

    move-result v12

    .line 80
    .local v12, "labelCount":I
    sub-float v24, v22, v23

    invoke-static/range {v24 .. v24}, Ljava/lang/Math;->abs(F)F

    move-result v24

    move/from16 v0, v24

    float-to-double v0, v0

    move-wide/from16 v16, v0

    .line 82
    .local v16, "range":D
    if-eqz v12, :cond_21

    const-wide/16 v24, 0x0

    cmpg-double v24, v16, v24

    if-gtz v24, :cond_44

    .line 83
    :cond_21
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    move/from16 v0, v25

    new-array v0, v0, [F

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    move-object/from16 v1, v24

    iput-object v0, v1, Lcom/github/mikephil/charting/components/YAxis;->mEntries:[F

    .line 84
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    move/from16 v0, v25

    move-object/from16 v1, v24

    iput v0, v1, Lcom/github/mikephil/charting/components/YAxis;->mEntryCount:I

    .line 172
    :goto_43
    return-void

    .line 89
    :cond_44
    int-to-double v0, v12

    move-wide/from16 v24, v0

    div-double v18, v16, v24

    .line 90
    .local v18, "rawInterval":D
    invoke-static/range {v18 .. v19}, Lcom/github/mikephil/charting/utils/Utils;->roundToNextSignificant(D)F

    move-result v24

    move/from16 v0, v24

    float-to-double v7, v0

    .line 94
    .local v7, "interval":D
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lcom/github/mikephil/charting/components/YAxis;->isGranularityEnabled()Z

    move-result v24

    if-eqz v24, :cond_7c

    .line 95
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lcom/github/mikephil/charting/components/YAxis;->getGranularity()F

    move-result v24

    move/from16 v0, v24

    float-to-double v0, v0

    move-wide/from16 v24, v0

    cmpg-double v24, v7, v24

    if-gez v24, :cond_7c

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lcom/github/mikephil/charting/components/YAxis;->getGranularity()F

    move-result v24

    move/from16 v0, v24

    float-to-double v7, v0

    .line 98
    :cond_7c
    const-wide/high16 v24, 0x4024000000000000L    # 10.0

    invoke-static {v7, v8}, Ljava/lang/Math;->log10(D)D

    move-result-wide v26

    move-wide/from16 v0, v26

    double-to-int v0, v0

    move/from16 v26, v0

    move/from16 v0, v26

    int-to-double v0, v0

    move-wide/from16 v26, v0

    invoke-static/range {v24 .. v27}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v24

    invoke-static/range {v24 .. v25}, Lcom/github/mikephil/charting/utils/Utils;->roundToNextSignificant(D)F

    move-result v24

    move/from16 v0, v24

    float-to-double v9, v0

    .line 99
    .local v9, "intervalMagnitude":D
    div-double v24, v7, v9

    move-wide/from16 v0, v24

    double-to-int v11, v0

    .line 100
    .local v11, "intervalSigDigit":I
    const/16 v24, 0x5

    move/from16 v0, v24

    if-le v11, v0, :cond_aa

    .line 103
    const-wide/high16 v24, 0x4024000000000000L    # 10.0

    mul-double v24, v24, v9

    invoke-static/range {v24 .. v25}, Ljava/lang/Math;->floor(D)D

    move-result-wide v7

    .line 107
    :cond_aa
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lcom/github/mikephil/charting/components/YAxis;->isForceLabelsEnabled()Z

    move-result v24

    if-eqz v24, :cond_10b

    .line 109
    move-wide/from16 v0, v16

    double-to-float v0, v0

    move/from16 v24, v0

    add-int/lit8 v25, v12, -0x1

    move/from16 v0, v25

    int-to-float v0, v0

    move/from16 v25, v0

    div-float v20, v24, v25

    .line 110
    .local v20, "step":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iput v12, v0, Lcom/github/mikephil/charting/components/YAxis;->mEntryCount:I

    .line 112
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget-object v0, v0, Lcom/github/mikephil/charting/components/YAxis;->mEntries:[F

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    array-length v0, v0

    move/from16 v24, v0

    move/from16 v0, v24

    if-ge v0, v12, :cond_f3

    .line 114
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    move-object/from16 v24, v0

    new-array v0, v12, [F

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    move-object/from16 v1, v24

    iput-object v0, v1, Lcom/github/mikephil/charting/components/YAxis;->mEntries:[F

    .line 117
    :cond_f3
    move/from16 v21, p1

    .line 119
    .local v21, "v":F
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_f6
    if-ge v6, v12, :cond_159

    .line 120
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget-object v0, v0, Lcom/github/mikephil/charting/components/YAxis;->mEntries:[F

    move-object/from16 v24, v0

    aput v21, v24, v6

    .line 121
    add-float v21, v21, v20

    .line 119
    add-int/lit8 v6, v6, 0x1

    goto :goto_f6

    .line 128
    .end local v6    # "i":I
    .end local v20    # "step":F
    .end local v21    # "v":F
    :cond_10b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lcom/github/mikephil/charting/components/YAxis;->isShowOnlyMinMaxEnabled()Z

    move-result v24

    if-eqz v24, :cond_17f

    .line 130
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    move-object/from16 v24, v0

    const/16 v25, 0x2

    move/from16 v0, v25

    move-object/from16 v1, v24

    iput v0, v1, Lcom/github/mikephil/charting/components/YAxis;->mEntryCount:I

    .line 131
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    move-object/from16 v24, v0

    const/16 v25, 0x2

    move/from16 v0, v25

    new-array v0, v0, [F

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    move-object/from16 v1, v24

    iput-object v0, v1, Lcom/github/mikephil/charting/components/YAxis;->mEntries:[F

    .line 132
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget-object v0, v0, Lcom/github/mikephil/charting/components/YAxis;->mEntries:[F

    move-object/from16 v24, v0

    const/16 v25, 0x0

    aput v23, v24, v25

    .line 133
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget-object v0, v0, Lcom/github/mikephil/charting/components/YAxis;->mEntries:[F

    move-object/from16 v24, v0

    const/16 v25, 0x1

    aput v22, v24, v25

    .line 167
    :cond_159
    const-wide/high16 v24, 0x3ff0000000000000L    # 1.0

    cmpg-double v24, v7, v24

    if-gez v24, :cond_20f

    .line 168
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    move-object/from16 v24, v0

    invoke-static {v7, v8}, Ljava/lang/Math;->log10(D)D

    move-result-wide v25

    move-wide/from16 v0, v25

    neg-double v0, v0

    move-wide/from16 v25, v0

    invoke-static/range {v25 .. v26}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v25

    move-wide/from16 v0, v25

    double-to-int v0, v0

    move/from16 v25, v0

    move/from16 v0, v25

    move-object/from16 v1, v24

    iput v0, v1, Lcom/github/mikephil/charting/components/YAxis;->mDecimals:I

    goto/16 :goto_43

    .line 137
    :cond_17f
    const-wide/16 v24, 0x0

    cmpl-double v24, v7, v24

    if-nez v24, :cond_19f

    const-wide/16 v4, 0x0

    .line 138
    .local v4, "first":D
    :goto_187
    const-wide/16 v24, 0x0

    cmpl-double v24, v7, v24

    if-nez v24, :cond_1ad

    const-wide/16 v13, 0x0

    .line 142
    .local v13, "last":D
    :goto_18f
    const/4 v15, 0x0

    .line 143
    .local v15, "n":I
    const-wide/16 v24, 0x0

    cmpl-double v24, v7, v24

    if-eqz v24, :cond_1bf

    .line 144
    move-wide v2, v4

    .local v2, "f":D
    :goto_197
    cmpg-double v24, v2, v13

    if-gtz v24, :cond_1bf

    .line 145
    add-int/lit8 v15, v15, 0x1

    .line 144
    add-double/2addr v2, v7

    goto :goto_197

    .line 137
    .end local v2    # "f":D
    .end local v4    # "first":D
    .end local v13    # "last":D
    .end local v15    # "n":I
    :cond_19f
    move/from16 v0, v23

    float-to-double v0, v0

    move-wide/from16 v24, v0

    div-double v24, v24, v7

    invoke-static/range {v24 .. v25}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v24

    mul-double v4, v24, v7

    goto :goto_187

    .line 138
    .restart local v4    # "first":D
    :cond_1ad
    move/from16 v0, v22

    float-to-double v0, v0

    move-wide/from16 v24, v0

    div-double v24, v24, v7

    invoke-static/range {v24 .. v25}, Ljava/lang/Math;->floor(D)D

    move-result-wide v24

    mul-double v24, v24, v7

    invoke-static/range {v24 .. v25}, Lcom/github/mikephil/charting/utils/Utils;->nextUp(D)D

    move-result-wide v13

    goto :goto_18f

    .line 149
    .restart local v13    # "last":D
    .restart local v15    # "n":I
    :cond_1bf
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iput v15, v0, Lcom/github/mikephil/charting/components/YAxis;->mEntryCount:I

    .line 151
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget-object v0, v0, Lcom/github/mikephil/charting/components/YAxis;->mEntries:[F

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    array-length v0, v0

    move/from16 v24, v0

    move/from16 v0, v24

    if-ge v0, v15, :cond_1ee

    .line 153
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    move-object/from16 v24, v0

    new-array v0, v15, [F

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    move-object/from16 v1, v24

    iput-object v0, v1, Lcom/github/mikephil/charting/components/YAxis;->mEntries:[F

    .line 156
    :cond_1ee
    move-wide v2, v4

    .restart local v2    # "f":D
    const/4 v6, 0x0

    .restart local v6    # "i":I
    :goto_1f0
    if-ge v6, v15, :cond_159

    .line 158
    const-wide/16 v24, 0x0

    cmpl-double v24, v2, v24

    if-nez v24, :cond_1fa

    .line 159
    const-wide/16 v2, 0x0

    .line 161
    :cond_1fa
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget-object v0, v0, Lcom/github/mikephil/charting/components/YAxis;->mEntries:[F

    move-object/from16 v24, v0

    double-to-float v0, v2

    move/from16 v25, v0

    aput v25, v24, v6

    .line 156
    add-double/2addr v2, v7

    add-int/lit8 v6, v6, 0x1

    goto :goto_1f0

    .line 170
    .end local v2    # "f":D
    .end local v4    # "first":D
    .end local v6    # "i":I
    .end local v13    # "last":D
    .end local v15    # "n":I
    :cond_20f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    move/from16 v0, v25

    move-object/from16 v1, v24

    iput v0, v1, Lcom/github/mikephil/charting/components/YAxis;->mDecimals:I

    goto/16 :goto_43
.end method

.method protected drawYLabels(Landroid/graphics/Canvas;F[FF)V
    .registers 9
    .param p1, "c"    # Landroid/graphics/Canvas;
    .param p2, "fixedPosition"    # F
    .param p3, "positions"    # [F
    .param p4, "offset"    # F

    .prologue
    .line 257
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v2, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    iget v2, v2, Lcom/github/mikephil/charting/components/YAxis;->mEntryCount:I

    if-ge v0, v2, :cond_1d

    .line 259
    iget-object v2, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    invoke-virtual {v2, v0}, Lcom/github/mikephil/charting/components/YAxis;->getFormattedLabel(I)Ljava/lang/String;

    move-result-object v1

    .line 261
    .local v1, "text":Ljava/lang/String;
    iget-object v2, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/components/YAxis;->isDrawTopYLabelEntryEnabled()Z

    move-result v2

    if-nez v2, :cond_1e

    iget-object v2, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    iget v2, v2, Lcom/github/mikephil/charting/components/YAxis;->mEntryCount:I

    add-int/lit8 v2, v2, -0x1

    if-lt v0, v2, :cond_1e

    .line 266
    .end local v1    # "text":Ljava/lang/String;
    :cond_1d
    return-void

    .line 264
    .restart local v1    # "text":Ljava/lang/String;
    :cond_1e
    mul-int/lit8 v2, v0, 0x2

    add-int/lit8 v2, v2, 0x1

    aget v2, p3, v2

    add-float/2addr v2, p4

    iget-object v3, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mAxisLabelPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, p2, v2, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 257
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method protected drawZeroLine(Landroid/graphics/Canvas;FFFF)V
    .registers 9
    .param p1, "c"    # Landroid/graphics/Canvas;
    .param p2, "x1"    # F
    .param p3, "x2"    # F
    .param p4, "y1"    # F
    .param p5, "y2"    # F

    .prologue
    .line 322
    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mZeroLinePaint:Landroid/graphics/Paint;

    iget-object v2, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/components/YAxis;->getZeroLineColor()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 323
    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mZeroLinePaint:Landroid/graphics/Paint;

    iget-object v2, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/components/YAxis;->getZeroLineWidth()F

    move-result v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 325
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 327
    .local v0, "zeroLinePath":Landroid/graphics/Path;
    invoke-virtual {v0, p2, p4}, Landroid/graphics/Path;->moveTo(FF)V

    .line 328
    invoke-virtual {v0, p3, p5}, Landroid/graphics/Path;->lineTo(FF)V

    .line 331
    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mZeroLinePaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 332
    return-void
.end method

.method public renderAxisLabels(Landroid/graphics/Canvas;)V
    .registers 12
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    .line 180
    iget-object v7, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    invoke-virtual {v7}, Lcom/github/mikephil/charting/components/YAxis;->isEnabled()Z

    move-result v7

    if-eqz v7, :cond_10

    iget-object v7, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    invoke-virtual {v7}, Lcom/github/mikephil/charting/components/YAxis;->isDrawLabelsEnabled()Z

    move-result v7

    if-nez v7, :cond_11

    .line 228
    :cond_10
    :goto_10
    return-void

    .line 183
    :cond_11
    iget-object v7, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    iget v7, v7, Lcom/github/mikephil/charting/components/YAxis;->mEntryCount:I

    mul-int/lit8 v7, v7, 0x2

    new-array v3, v7, [F

    .line 185
    .local v3, "positions":[F
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1a
    array-length v7, v3

    if-ge v1, v7, :cond_2c

    .line 189
    add-int/lit8 v7, v1, 0x1

    iget-object v8, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    iget-object v8, v8, Lcom/github/mikephil/charting/components/YAxis;->mEntries:[F

    div-int/lit8 v9, v1, 0x2

    aget v8, v8, v9

    aput v8, v3, v7

    .line 185
    add-int/lit8 v1, v1, 0x2

    goto :goto_1a

    .line 192
    :cond_2c
    iget-object v7, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mTrans:Lcom/github/mikephil/charting/utils/Transformer;

    invoke-virtual {v7, v3}, Lcom/github/mikephil/charting/utils/Transformer;->pointValuesToPixel([F)V

    .line 194
    iget-object v7, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mAxisLabelPaint:Landroid/graphics/Paint;

    iget-object v8, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    invoke-virtual {v8}, Lcom/github/mikephil/charting/components/YAxis;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 195
    iget-object v7, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mAxisLabelPaint:Landroid/graphics/Paint;

    iget-object v8, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    invoke-virtual {v8}, Lcom/github/mikephil/charting/components/YAxis;->getTextSize()F

    move-result v8

    invoke-virtual {v7, v8}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 196
    iget-object v7, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mAxisLabelPaint:Landroid/graphics/Paint;

    iget-object v8, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    invoke-virtual {v8}, Lcom/github/mikephil/charting/components/YAxis;->getTextColor()I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/graphics/Paint;->setColor(I)V

    .line 198
    iget-object v7, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    invoke-virtual {v7}, Lcom/github/mikephil/charting/components/YAxis;->getXOffset()F

    move-result v5

    .line 199
    .local v5, "xoffset":F
    iget-object v7, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mAxisLabelPaint:Landroid/graphics/Paint;

    const-string v8, "A"

    invoke-static {v7, v8}, Lcom/github/mikephil/charting/utils/Utils;->calcTextHeight(Landroid/graphics/Paint;Ljava/lang/String;)I

    move-result v7

    int-to-float v7, v7

    const/high16 v8, 0x40200000    # 2.5f

    div-float/2addr v7, v8

    iget-object v8, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    invoke-virtual {v8}, Lcom/github/mikephil/charting/components/YAxis;->getYOffset()F

    move-result v8

    add-float v6, v7, v8

    .line 201
    .local v6, "yoffset":F
    iget-object v7, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    invoke-virtual {v7}, Lcom/github/mikephil/charting/components/YAxis;->getAxisDependency()Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    move-result-object v0

    .line 202
    .local v0, "dependency":Lcom/github/mikephil/charting/components/YAxis$AxisDependency;
    iget-object v7, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    invoke-virtual {v7}, Lcom/github/mikephil/charting/components/YAxis;->getLabelPosition()Lcom/github/mikephil/charting/components/YAxis$YAxisLabelPosition;

    move-result-object v2

    .line 204
    .local v2, "labelPosition":Lcom/github/mikephil/charting/components/YAxis$YAxisLabelPosition;
    const/4 v4, 0x0

    .line 206
    .local v4, "xPos":F
    sget-object v7, Lcom/github/mikephil/charting/components/YAxis$AxisDependency;->LEFT:Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    if-ne v0, v7, :cond_a5

    .line 208
    sget-object v7, Lcom/github/mikephil/charting/components/YAxis$YAxisLabelPosition;->OUTSIDE_CHART:Lcom/github/mikephil/charting/components/YAxis$YAxisLabelPosition;

    if-ne v2, v7, :cond_95

    .line 209
    iget-object v7, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mAxisLabelPaint:Landroid/graphics/Paint;

    sget-object v8, Landroid/graphics/Paint$Align;->RIGHT:Landroid/graphics/Paint$Align;

    invoke-virtual {v7, v8}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 210
    iget-object v7, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v7}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->offsetLeft()F

    move-result v7

    sub-float v4, v7, v5

    .line 227
    :goto_90
    invoke-virtual {p0, p1, v4, v3, v6}, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->drawYLabels(Landroid/graphics/Canvas;F[FF)V

    goto/16 :goto_10

    .line 212
    :cond_95
    iget-object v7, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mAxisLabelPaint:Landroid/graphics/Paint;

    sget-object v8, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    invoke-virtual {v7, v8}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 213
    iget-object v7, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v7}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->offsetLeft()F

    move-result v7

    add-float v4, v7, v5

    goto :goto_90

    .line 218
    :cond_a5
    sget-object v7, Lcom/github/mikephil/charting/components/YAxis$YAxisLabelPosition;->OUTSIDE_CHART:Lcom/github/mikephil/charting/components/YAxis$YAxisLabelPosition;

    if-ne v2, v7, :cond_b9

    .line 219
    iget-object v7, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mAxisLabelPaint:Landroid/graphics/Paint;

    sget-object v8, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    invoke-virtual {v7, v8}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 220
    iget-object v7, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v7}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentRight()F

    move-result v7

    add-float v4, v7, v5

    goto :goto_90

    .line 222
    :cond_b9
    iget-object v7, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mAxisLabelPaint:Landroid/graphics/Paint;

    sget-object v8, Landroid/graphics/Paint$Align;->RIGHT:Landroid/graphics/Paint$Align;

    invoke-virtual {v7, v8}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 223
    iget-object v7, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v7}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentRight()F

    move-result v7

    sub-float v4, v7, v5

    goto :goto_90
.end method

.method public renderAxisLine(Landroid/graphics/Canvas;)V
    .registers 8
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    .line 233
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/components/YAxis;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_10

    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/components/YAxis;->isDrawAxisLineEnabled()Z

    move-result v0

    if-nez v0, :cond_11

    .line 246
    :cond_10
    :goto_10
    return-void

    .line 236
    :cond_11
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mAxisLinePaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/components/YAxis;->getAxisLineColor()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 237
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mAxisLinePaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/components/YAxis;->getAxisLineWidth()F

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 239
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/components/YAxis;->getAxisDependency()Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    move-result-object v0

    sget-object v1, Lcom/github/mikephil/charting/components/YAxis$AxisDependency;->LEFT:Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    if-ne v0, v1, :cond_50

    .line 240
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentLeft()F

    move-result v1

    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentTop()F

    move-result v2

    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentLeft()F

    move-result v3

    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentBottom()F

    move-result v4

    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mAxisLinePaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto :goto_10

    .line 243
    :cond_50
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentRight()F

    move-result v1

    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentTop()F

    move-result v2

    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentRight()F

    move-result v3

    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentBottom()F

    move-result v4

    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mAxisLinePaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto :goto_10
.end method

.method public renderGridLines(Landroid/graphics/Canvas;)V
    .registers 12
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    const/high16 v9, 0x3f800000    # 1.0f

    const/4 v5, 0x1

    .line 271
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/components/YAxis;->isEnabled()Z

    move-result v0

    if-nez v0, :cond_c

    .line 309
    :cond_b
    :goto_b
    return-void

    .line 275
    :cond_c
    const/4 v0, 0x2

    new-array v8, v0, [F

    .line 277
    .local v8, "position":[F
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/components/YAxis;->isDrawGridLinesEnabled()Z

    move-result v0

    if-eqz v0, :cond_72

    .line 279
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mGridPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/components/YAxis;->getGridColor()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 280
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mGridPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/components/YAxis;->getGridLineWidth()F

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 281
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mGridPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/components/YAxis;->getGridDashPathEffect()Landroid/graphics/DashPathEffect;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setPathEffect(Landroid/graphics/PathEffect;)Landroid/graphics/PathEffect;

    .line 283
    new-instance v6, Landroid/graphics/Path;

    invoke-direct {v6}, Landroid/graphics/Path;-><init>()V

    .line 286
    .local v6, "gridLinePath":Landroid/graphics/Path;
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_3e
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    iget v0, v0, Lcom/github/mikephil/charting/components/YAxis;->mEntryCount:I

    if-ge v7, v0, :cond_72

    .line 288
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    iget-object v0, v0, Lcom/github/mikephil/charting/components/YAxis;->mEntries:[F

    aget v0, v0, v7

    aput v0, v8, v5

    .line 289
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mTrans:Lcom/github/mikephil/charting/utils/Transformer;

    invoke-virtual {v0, v8}, Lcom/github/mikephil/charting/utils/Transformer;->pointValuesToPixel([F)V

    .line 291
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->offsetLeft()F

    move-result v0

    aget v1, v8, v5

    invoke-virtual {v6, v0, v1}, Landroid/graphics/Path;->moveTo(FF)V

    .line 292
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentRight()F

    move-result v0

    aget v1, v8, v5

    invoke-virtual {v6, v0, v1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 295
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mGridPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v6, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 297
    invoke-virtual {v6}, Landroid/graphics/Path;->reset()V

    .line 286
    add-int/lit8 v7, v7, 0x1

    goto :goto_3e

    .line 301
    .end local v6    # "gridLinePath":Landroid/graphics/Path;
    .end local v7    # "i":I
    :cond_72
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/components/YAxis;->isDrawZeroLineEnabled()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 304
    const/4 v0, 0x0

    aput v0, v8, v5

    .line 305
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mTrans:Lcom/github/mikephil/charting/utils/Transformer;

    invoke-virtual {v0, v8}, Lcom/github/mikephil/charting/utils/Transformer;->pointValuesToPixel([F)V

    .line 307
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->offsetLeft()F

    move-result v2

    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentRight()F

    move-result v3

    aget v0, v8, v5

    sub-float v4, v0, v9

    aget v0, v8, v5

    sub-float v5, v0, v9

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->drawZeroLine(Landroid/graphics/Canvas;FFFF)V

    goto/16 :goto_b
.end method

.method public renderLimitLines(Landroid/graphics/Canvas;)V
    .registers 16
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v13, 0x1

    .line 342
    iget-object v10, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    invoke-virtual {v10}, Lcom/github/mikephil/charting/components/YAxis;->getLimitLines()Ljava/util/List;

    move-result-object v5

    .line 344
    .local v5, "limitLines":Ljava/util/List;, "Ljava/util/List<Lcom/github/mikephil/charting/components/LimitLine;>;"
    if-eqz v5, :cond_f

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v10

    if-gtz v10, :cond_10

    .line 421
    :cond_f
    return-void

    .line 347
    :cond_10
    const/4 v10, 0x2

    new-array v7, v10, [F

    .line 348
    .local v7, "pts":[F
    new-instance v4, Landroid/graphics/Path;

    invoke-direct {v4}, Landroid/graphics/Path;-><init>()V

    .line 350
    .local v4, "limitLinePath":Landroid/graphics/Path;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_19
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v10

    if-ge v0, v10, :cond_f

    .line 352
    invoke-interface {v5, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/github/mikephil/charting/components/LimitLine;

    .line 354
    .local v1, "l":Lcom/github/mikephil/charting/components/LimitLine;
    invoke-virtual {v1}, Lcom/github/mikephil/charting/components/LimitLine;->isEnabled()Z

    move-result v10

    if-nez v10, :cond_2e

    .line 350
    :cond_2b
    :goto_2b
    add-int/lit8 v0, v0, 0x1

    goto :goto_19

    .line 357
    :cond_2e
    iget-object v10, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mLimitLinePaint:Landroid/graphics/Paint;

    sget-object v11, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v10, v11}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 358
    iget-object v10, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mLimitLinePaint:Landroid/graphics/Paint;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/components/LimitLine;->getLineColor()I

    move-result v11

    invoke-virtual {v10, v11}, Landroid/graphics/Paint;->setColor(I)V

    .line 359
    iget-object v10, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mLimitLinePaint:Landroid/graphics/Paint;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/components/LimitLine;->getLineWidth()F

    move-result v11

    invoke-virtual {v10, v11}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 360
    iget-object v10, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mLimitLinePaint:Landroid/graphics/Paint;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/components/LimitLine;->getDashPathEffect()Landroid/graphics/DashPathEffect;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/graphics/Paint;->setPathEffect(Landroid/graphics/PathEffect;)Landroid/graphics/PathEffect;

    .line 362
    invoke-virtual {v1}, Lcom/github/mikephil/charting/components/LimitLine;->getLimit()F

    move-result v10

    aput v10, v7, v13

    .line 364
    iget-object v10, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mTrans:Lcom/github/mikephil/charting/utils/Transformer;

    invoke-virtual {v10, v7}, Lcom/github/mikephil/charting/utils/Transformer;->pointValuesToPixel([F)V

    .line 366
    iget-object v10, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v10}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentLeft()F

    move-result v10

    aget v11, v7, v13

    invoke-virtual {v4, v10, v11}, Landroid/graphics/Path;->moveTo(FF)V

    .line 367
    iget-object v10, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v10}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentRight()F

    move-result v10

    aget v11, v7, v13

    invoke-virtual {v4, v10, v11}, Landroid/graphics/Path;->lineTo(FF)V

    .line 369
    iget-object v10, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mLimitLinePaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v4, v10}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 370
    invoke-virtual {v4}, Landroid/graphics/Path;->reset()V

    .line 373
    invoke-virtual {v1}, Lcom/github/mikephil/charting/components/LimitLine;->getLabel()Ljava/lang/String;

    move-result-object v2

    .line 376
    .local v2, "label":Ljava/lang/String;
    if-eqz v2, :cond_2b

    const-string v10, ""

    invoke-virtual {v2, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_2b

    .line 378
    iget-object v10, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mLimitLinePaint:Landroid/graphics/Paint;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/components/LimitLine;->getTextStyle()Landroid/graphics/Paint$Style;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 379
    iget-object v10, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mLimitLinePaint:Landroid/graphics/Paint;

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Landroid/graphics/Paint;->setPathEffect(Landroid/graphics/PathEffect;)Landroid/graphics/PathEffect;

    .line 380
    iget-object v10, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mLimitLinePaint:Landroid/graphics/Paint;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/components/LimitLine;->getTextColor()I

    move-result v11

    invoke-virtual {v10, v11}, Landroid/graphics/Paint;->setColor(I)V

    .line 381
    iget-object v10, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mLimitLinePaint:Landroid/graphics/Paint;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/components/LimitLine;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 382
    iget-object v10, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mLimitLinePaint:Landroid/graphics/Paint;

    const/high16 v11, 0x3f000000    # 0.5f

    invoke-virtual {v10, v11}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 383
    iget-object v10, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mLimitLinePaint:Landroid/graphics/Paint;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/components/LimitLine;->getTextSize()F

    move-result v11

    invoke-virtual {v10, v11}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 385
    iget-object v10, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mLimitLinePaint:Landroid/graphics/Paint;

    invoke-static {v10, v2}, Lcom/github/mikephil/charting/utils/Utils;->calcTextHeight(Landroid/graphics/Paint;Ljava/lang/String;)I

    move-result v10

    int-to-float v3, v10

    .line 386
    .local v3, "labelLineHeight":F
    const/high16 v10, 0x40800000    # 4.0f

    invoke-static {v10}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v10

    invoke-virtual {v1}, Lcom/github/mikephil/charting/components/LimitLine;->getXOffset()F

    move-result v11

    add-float v8, v10, v11

    .line 387
    .local v8, "xOffset":F
    invoke-virtual {v1}, Lcom/github/mikephil/charting/components/LimitLine;->getLineWidth()F

    move-result v10

    add-float/2addr v10, v3

    invoke-virtual {v1}, Lcom/github/mikephil/charting/components/LimitLine;->getYOffset()F

    move-result v11

    add-float v9, v10, v11

    .line 389
    .local v9, "yOffset":F
    invoke-virtual {v1}, Lcom/github/mikephil/charting/components/LimitLine;->getLabelPosition()Lcom/github/mikephil/charting/components/LimitLine$LimitLabelPosition;

    move-result-object v6

    .line 391
    .local v6, "position":Lcom/github/mikephil/charting/components/LimitLine$LimitLabelPosition;
    sget-object v10, Lcom/github/mikephil/charting/components/LimitLine$LimitLabelPosition;->RIGHT_TOP:Lcom/github/mikephil/charting/components/LimitLine$LimitLabelPosition;

    if-ne v6, v10, :cond_f7

    .line 393
    iget-object v10, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mLimitLinePaint:Landroid/graphics/Paint;

    sget-object v11, Landroid/graphics/Paint$Align;->RIGHT:Landroid/graphics/Paint$Align;

    invoke-virtual {v10, v11}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 394
    iget-object v10, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v10}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentRight()F

    move-result v10

    sub-float/2addr v10, v8

    aget v11, v7, v13

    sub-float/2addr v11, v9

    add-float/2addr v11, v3

    iget-object v12, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mLimitLinePaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v2, v10, v11, v12}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    goto/16 :goto_2b

    .line 398
    :cond_f7
    sget-object v10, Lcom/github/mikephil/charting/components/LimitLine$LimitLabelPosition;->RIGHT_BOTTOM:Lcom/github/mikephil/charting/components/LimitLine$LimitLabelPosition;

    if-ne v6, v10, :cond_113

    .line 400
    iget-object v10, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mLimitLinePaint:Landroid/graphics/Paint;

    sget-object v11, Landroid/graphics/Paint$Align;->RIGHT:Landroid/graphics/Paint$Align;

    invoke-virtual {v10, v11}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 401
    iget-object v10, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v10}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentRight()F

    move-result v10

    sub-float/2addr v10, v8

    aget v11, v7, v13

    add-float/2addr v11, v9

    iget-object v12, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mLimitLinePaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v2, v10, v11, v12}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    goto/16 :goto_2b

    .line 405
    :cond_113
    sget-object v10, Lcom/github/mikephil/charting/components/LimitLine$LimitLabelPosition;->LEFT_TOP:Lcom/github/mikephil/charting/components/LimitLine$LimitLabelPosition;

    if-ne v6, v10, :cond_130

    .line 407
    iget-object v10, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mLimitLinePaint:Landroid/graphics/Paint;

    sget-object v11, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    invoke-virtual {v10, v11}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 408
    iget-object v10, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v10}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentLeft()F

    move-result v10

    add-float/2addr v10, v8

    aget v11, v7, v13

    sub-float/2addr v11, v9

    add-float/2addr v11, v3

    iget-object v12, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mLimitLinePaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v2, v10, v11, v12}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    goto/16 :goto_2b

    .line 414
    :cond_130
    iget-object v10, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mLimitLinePaint:Landroid/graphics/Paint;

    sget-object v11, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    invoke-virtual {v10, v11}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 415
    iget-object v10, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v10}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->offsetLeft()F

    move-result v10

    add-float/2addr v10, v8

    aget v11, v7, v13

    add-float/2addr v11, v9

    iget-object v12, p0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->mLimitLinePaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v2, v10, v11, v12}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    goto/16 :goto_2b
.end method
