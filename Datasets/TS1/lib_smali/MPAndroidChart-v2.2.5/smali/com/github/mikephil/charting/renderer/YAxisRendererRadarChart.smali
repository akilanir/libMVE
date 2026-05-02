.class public Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;
.super Lcom/github/mikephil/charting/renderer/YAxisRenderer;
.source "YAxisRendererRadarChart.java"


# instance fields
.field private mChart:Lcom/github/mikephil/charting/charts/RadarChart;


# direct methods
.method public constructor <init>(Lcom/github/mikephil/charting/utils/ViewPortHandler;Lcom/github/mikephil/charting/components/YAxis;Lcom/github/mikephil/charting/charts/RadarChart;)V
    .registers 5
    .param p1, "viewPortHandler"    # Lcom/github/mikephil/charting/utils/ViewPortHandler;
    .param p2, "yAxis"    # Lcom/github/mikephil/charting/components/YAxis;
    .param p3, "chart"    # Lcom/github/mikephil/charting/charts/RadarChart;

    .prologue
    .line 20
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/github/mikephil/charting/renderer/YAxisRenderer;-><init>(Lcom/github/mikephil/charting/utils/ViewPortHandler;Lcom/github/mikephil/charting/components/YAxis;Lcom/github/mikephil/charting/utils/Transformer;)V

    .line 22
    iput-object p3, p0, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->mChart:Lcom/github/mikephil/charting/charts/RadarChart;

    .line 23
    return-void
.end method


# virtual methods
.method public computeAxis(FF)V
    .registers 3
    .param p1, "yMin"    # F
    .param p2, "yMax"    # F

    .prologue
    .line 27
    invoke-virtual {p0, p1, p2}, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->computeAxisValues(FF)V

    .line 28
    return-void
.end method

.method protected computeAxisValues(FF)V
    .registers 33
    .param p1, "min"    # F
    .param p2, "max"    # F

    .prologue
    .line 32
    move/from16 v25, p1

    .line 33
    .local v25, "yMin":F
    move/from16 v24, p2

    .line 35
    .local v24, "yMax":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Lcom/github/mikephil/charting/components/YAxis;->getLabelCount()I

    move-result v12

    .line 36
    .local v12, "labelCount":I
    sub-float v26, v24, v25

    invoke-static/range {v26 .. v26}, Ljava/lang/Math;->abs(F)F

    move-result v26

    move/from16 v0, v26

    float-to-double v0, v0

    move-wide/from16 v16, v0

    .line 38
    .local v16, "range":D
    if-eqz v12, :cond_21

    const-wide/16 v26, 0x0

    cmpg-double v26, v16, v26

    if-gtz v26, :cond_44

    .line 39
    :cond_21
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    move/from16 v0, v27

    new-array v0, v0, [F

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    move-object/from16 v1, v26

    iput-object v0, v1, Lcom/github/mikephil/charting/components/YAxis;->mEntries:[F

    .line 40
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    move/from16 v0, v27

    move-object/from16 v1, v26

    iput v0, v1, Lcom/github/mikephil/charting/components/YAxis;->mEntryCount:I

    .line 130
    :goto_43
    return-void

    .line 44
    :cond_44
    int-to-double v0, v12

    move-wide/from16 v26, v0

    div-double v20, v16, v26

    .line 45
    .local v20, "rawInterval":D
    invoke-static/range {v20 .. v21}, Lcom/github/mikephil/charting/utils/Utils;->roundToNextSignificant(D)F

    move-result v26

    move/from16 v0, v26

    float-to-double v7, v0

    .line 46
    .local v7, "interval":D
    const-wide/high16 v26, 0x4024000000000000L    # 10.0

    invoke-static {v7, v8}, Ljava/lang/Math;->log10(D)D

    move-result-wide v28

    move-wide/from16 v0, v28

    double-to-int v0, v0

    move/from16 v28, v0

    move/from16 v0, v28

    int-to-double v0, v0

    move-wide/from16 v28, v0

    invoke-static/range {v26 .. v29}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v9

    .line 47
    .local v9, "intervalMagnitude":D
    div-double v26, v7, v9

    move-wide/from16 v0, v26

    double-to-int v11, v0

    .line 48
    .local v11, "intervalSigDigit":I
    const/16 v26, 0x5

    move/from16 v0, v26

    if-le v11, v0, :cond_77

    .line 51
    const-wide/high16 v26, 0x4024000000000000L    # 10.0

    mul-double v26, v26, v9

    invoke-static/range {v26 .. v27}, Ljava/lang/Math;->floor(D)D

    move-result-wide v7

    .line 55
    :cond_77
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Lcom/github/mikephil/charting/components/YAxis;->isForceLabelsEnabled()Z

    move-result v26

    if-eqz v26, :cond_d8

    .line 57
    move-wide/from16 v0, v16

    double-to-float v0, v0

    move/from16 v26, v0

    add-int/lit8 v27, v12, -0x1

    move/from16 v0, v27

    int-to-float v0, v0

    move/from16 v27, v0

    div-float v22, v26, v27

    .line 58
    .local v22, "step":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iput v12, v0, Lcom/github/mikephil/charting/components/YAxis;->mEntryCount:I

    .line 60
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/github/mikephil/charting/components/YAxis;->mEntries:[F

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    array-length v0, v0

    move/from16 v26, v0

    move/from16 v0, v26

    if-ge v0, v12, :cond_c0

    .line 62
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    move-object/from16 v26, v0

    new-array v0, v12, [F

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    move-object/from16 v1, v26

    iput-object v0, v1, Lcom/github/mikephil/charting/components/YAxis;->mEntries:[F

    .line 65
    :cond_c0
    move/from16 v23, p1

    .line 67
    .local v23, "v":F
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_c3
    if-ge v6, v12, :cond_126

    .line 68
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/github/mikephil/charting/components/YAxis;->mEntries:[F

    move-object/from16 v26, v0

    aput v23, v26, v6

    .line 69
    add-float v23, v23, v22

    .line 67
    add-int/lit8 v6, v6, 0x1

    goto :goto_c3

    .line 76
    .end local v6    # "i":I
    .end local v22    # "step":F
    .end local v23    # "v":F
    :cond_d8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Lcom/github/mikephil/charting/components/YAxis;->isShowOnlyMinMaxEnabled()Z

    move-result v26

    if-eqz v26, :cond_1ce

    .line 78
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    move-object/from16 v26, v0

    const/16 v27, 0x2

    move/from16 v0, v27

    move-object/from16 v1, v26

    iput v0, v1, Lcom/github/mikephil/charting/components/YAxis;->mEntryCount:I

    .line 79
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    move-object/from16 v26, v0

    const/16 v27, 0x2

    move/from16 v0, v27

    new-array v0, v0, [F

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    move-object/from16 v1, v26

    iput-object v0, v1, Lcom/github/mikephil/charting/components/YAxis;->mEntries:[F

    .line 80
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/github/mikephil/charting/components/YAxis;->mEntries:[F

    move-object/from16 v26, v0

    const/16 v27, 0x0

    aput v25, v26, v27

    .line 81
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/github/mikephil/charting/components/YAxis;->mEntries:[F

    move-object/from16 v26, v0

    const/16 v27, 0x1

    aput v24, v26, v27

    .line 116
    :cond_126
    const-wide/high16 v26, 0x3ff0000000000000L    # 1.0

    cmpg-double v26, v7, v26

    if-gez v26, :cond_261

    .line 117
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    move-object/from16 v26, v0

    invoke-static {v7, v8}, Ljava/lang/Math;->log10(D)D

    move-result-wide v27

    move-wide/from16 v0, v27

    neg-double v0, v0

    move-wide/from16 v27, v0

    invoke-static/range {v27 .. v28}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v27

    move-wide/from16 v0, v27

    double-to-int v0, v0

    move/from16 v27, v0

    move/from16 v0, v27

    move-object/from16 v1, v26

    iput v0, v1, Lcom/github/mikephil/charting/components/YAxis;->mDecimals:I

    .line 122
    :goto_14a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/github/mikephil/charting/components/YAxis;->mEntries:[F

    move-object/from16 v26, v0

    const/16 v27, 0x0

    aget v26, v26, v27

    cmpg-float v26, v26, v25

    if-gez v26, :cond_17a

    .line 125
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iget-object v0, v0, Lcom/github/mikephil/charting/components/YAxis;->mEntries:[F

    move-object/from16 v27, v0

    const/16 v28, 0x0

    aget v27, v27, v28

    move/from16 v0, v27

    move-object/from16 v1, v26

    iput v0, v1, Lcom/github/mikephil/charting/components/YAxis;->mAxisMinimum:F

    .line 128
    :cond_17a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iget-object v0, v0, Lcom/github/mikephil/charting/components/YAxis;->mEntries:[F

    move-object/from16 v27, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget v0, v0, Lcom/github/mikephil/charting/components/YAxis;->mEntryCount:I

    move/from16 v28, v0

    add-int/lit8 v28, v28, -0x1

    aget v27, v27, v28

    move/from16 v0, v27

    move-object/from16 v1, v26

    iput v0, v1, Lcom/github/mikephil/charting/components/YAxis;->mAxisMaximum:F

    .line 129
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iget v0, v0, Lcom/github/mikephil/charting/components/YAxis;->mAxisMaximum:F

    move/from16 v27, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget v0, v0, Lcom/github/mikephil/charting/components/YAxis;->mAxisMinimum:F

    move/from16 v28, v0

    sub-float v27, v27, v28

    invoke-static/range {v27 .. v27}, Ljava/lang/Math;->abs(F)F

    move-result v27

    move/from16 v0, v27

    move-object/from16 v1, v26

    iput v0, v1, Lcom/github/mikephil/charting/components/YAxis;->mAxisRange:F

    goto/16 :goto_43

    .line 85
    :cond_1ce
    move/from16 v0, v25

    float-to-double v0, v0

    move-wide/from16 v26, v0

    div-double v18, v26, v7

    .line 86
    .local v18, "rawCount":D
    const-wide/16 v26, 0x0

    cmpg-double v26, v18, v26

    if-gez v26, :cond_204

    invoke-static/range {v18 .. v19}, Ljava/lang/Math;->floor(D)D

    move-result-wide v26

    mul-double v4, v26, v7

    .line 88
    .local v4, "first":D
    :goto_1e1
    const-wide/16 v26, 0x0

    cmpl-double v26, v4, v26

    if-nez v26, :cond_1e9

    .line 89
    const-wide/16 v4, 0x0

    .line 91
    :cond_1e9
    move/from16 v0, v24

    float-to-double v0, v0

    move-wide/from16 v26, v0

    div-double v26, v26, v7

    invoke-static/range {v26 .. v27}, Ljava/lang/Math;->floor(D)D

    move-result-wide v26

    mul-double v26, v26, v7

    invoke-static/range {v26 .. v27}, Lcom/github/mikephil/charting/utils/Utils;->nextUp(D)D

    move-result-wide v13

    .line 95
    .local v13, "last":D
    const/4 v15, 0x0

    .line 96
    .local v15, "n":I
    move-wide v2, v4

    .local v2, "f":D
    :goto_1fc
    cmpg-double v26, v2, v13

    if-gtz v26, :cond_20b

    .line 97
    add-int/lit8 v15, v15, 0x1

    .line 96
    add-double/2addr v2, v7

    goto :goto_1fc

    .line 86
    .end local v2    # "f":D
    .end local v4    # "first":D
    .end local v13    # "last":D
    .end local v15    # "n":I
    :cond_204
    invoke-static/range {v18 .. v19}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v26

    mul-double v4, v26, v7

    goto :goto_1e1

    .line 100
    .restart local v2    # "f":D
    .restart local v4    # "first":D
    .restart local v13    # "last":D
    .restart local v15    # "n":I
    :cond_20b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Lcom/github/mikephil/charting/components/YAxis;->isAxisMaxCustom()Z

    move-result v26

    if-nez v26, :cond_219

    .line 101
    add-int/lit8 v15, v15, 0x1

    .line 103
    :cond_219
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iput v15, v0, Lcom/github/mikephil/charting/components/YAxis;->mEntryCount:I

    .line 105
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/github/mikephil/charting/components/YAxis;->mEntries:[F

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    array-length v0, v0

    move/from16 v26, v0

    move/from16 v0, v26

    if-ge v0, v15, :cond_248

    .line 107
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    move-object/from16 v26, v0

    new-array v0, v15, [F

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    move-object/from16 v1, v26

    iput-object v0, v1, Lcom/github/mikephil/charting/components/YAxis;->mEntries:[F

    .line 110
    :cond_248
    move-wide v2, v4

    const/4 v6, 0x0

    .restart local v6    # "i":I
    :goto_24a
    if-ge v6, v15, :cond_126

    .line 111
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/github/mikephil/charting/components/YAxis;->mEntries:[F

    move-object/from16 v26, v0

    double-to-float v0, v2

    move/from16 v27, v0

    aput v27, v26, v6

    .line 110
    add-double/2addr v2, v7

    add-int/lit8 v6, v6, 0x1

    goto :goto_24a

    .line 119
    .end local v2    # "f":D
    .end local v4    # "first":D
    .end local v6    # "i":I
    .end local v13    # "last":D
    .end local v15    # "n":I
    .end local v18    # "rawCount":D
    :cond_261
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    move/from16 v0, v27

    move-object/from16 v1, v26

    iput v0, v1, Lcom/github/mikephil/charting/components/YAxis;->mDecimals:I

    goto/16 :goto_14a
.end method

.method public renderAxisLabels(Landroid/graphics/Canvas;)V
    .registers 12
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    .line 135
    iget-object v7, p0, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    invoke-virtual {v7}, Lcom/github/mikephil/charting/components/YAxis;->isEnabled()Z

    move-result v7

    if-eqz v7, :cond_10

    iget-object v7, p0, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    invoke-virtual {v7}, Lcom/github/mikephil/charting/components/YAxis;->isDrawLabelsEnabled()Z

    move-result v7

    if-nez v7, :cond_11

    .line 160
    :cond_10
    return-void

    .line 138
    :cond_11
    iget-object v7, p0, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->mAxisLabelPaint:Landroid/graphics/Paint;

    iget-object v8, p0, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    invoke-virtual {v8}, Lcom/github/mikephil/charting/components/YAxis;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 139
    iget-object v7, p0, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->mAxisLabelPaint:Landroid/graphics/Paint;

    iget-object v8, p0, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    invoke-virtual {v8}, Lcom/github/mikephil/charting/components/YAxis;->getTextSize()F

    move-result v8

    invoke-virtual {v7, v8}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 140
    iget-object v7, p0, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->mAxisLabelPaint:Landroid/graphics/Paint;

    iget-object v8, p0, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    invoke-virtual {v8}, Lcom/github/mikephil/charting/components/YAxis;->getTextColor()I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/graphics/Paint;->setColor(I)V

    .line 142
    iget-object v7, p0, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->mChart:Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {v7}, Lcom/github/mikephil/charting/charts/RadarChart;->getCenterOffsets()Landroid/graphics/PointF;

    move-result-object v0

    .line 143
    .local v0, "center":Landroid/graphics/PointF;
    iget-object v7, p0, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->mChart:Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {v7}, Lcom/github/mikephil/charting/charts/RadarChart;->getFactor()F

    move-result v1

    .line 145
    .local v1, "factor":F
    iget-object v7, p0, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    iget v4, v7, Lcom/github/mikephil/charting/components/YAxis;->mEntryCount:I

    .line 147
    .local v4, "labelCount":I
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_43
    if-ge v2, v4, :cond_10

    .line 149
    add-int/lit8 v7, v4, -0x1

    if-ne v2, v7, :cond_51

    iget-object v7, p0, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    invoke-virtual {v7}, Lcom/github/mikephil/charting/components/YAxis;->isDrawTopYLabelEntryEnabled()Z

    move-result v7

    if-eqz v7, :cond_10

    .line 152
    :cond_51
    iget-object v7, p0, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    iget-object v7, v7, Lcom/github/mikephil/charting/components/YAxis;->mEntries:[F

    aget v7, v7, v2

    iget-object v8, p0, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    iget v8, v8, Lcom/github/mikephil/charting/components/YAxis;->mAxisMinimum:F

    sub-float/2addr v7, v8

    mul-float v6, v7, v1

    .line 154
    .local v6, "r":F
    iget-object v7, p0, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->mChart:Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {v7}, Lcom/github/mikephil/charting/charts/RadarChart;->getRotationAngle()F

    move-result v7

    invoke-static {v0, v6, v7}, Lcom/github/mikephil/charting/utils/Utils;->getPosition(Landroid/graphics/PointF;FF)Landroid/graphics/PointF;

    move-result-object v5

    .line 156
    .local v5, "p":Landroid/graphics/PointF;
    iget-object v7, p0, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    invoke-virtual {v7, v2}, Lcom/github/mikephil/charting/components/YAxis;->getFormattedLabel(I)Ljava/lang/String;

    move-result-object v3

    .line 158
    .local v3, "label":Ljava/lang/String;
    iget v7, v5, Landroid/graphics/PointF;->x:F

    const/high16 v8, 0x41200000    # 10.0f

    add-float/2addr v7, v8

    iget v8, v5, Landroid/graphics/PointF;->y:F

    iget-object v9, p0, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->mAxisLabelPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v3, v7, v8, v9}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 147
    add-int/lit8 v2, v2, 0x1

    goto :goto_43
.end method

.method public renderLimitLines(Landroid/graphics/Canvas;)V
    .registers 14
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    .line 165
    iget-object v10, p0, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->mYAxis:Lcom/github/mikephil/charting/components/YAxis;

    invoke-virtual {v10}, Lcom/github/mikephil/charting/components/YAxis;->getLimitLines()Ljava/util/List;

    move-result-object v5

    .line 167
    .local v5, "limitLines":Ljava/util/List;, "Ljava/util/List<Lcom/github/mikephil/charting/components/LimitLine;>;"
    if-nez v5, :cond_9

    .line 207
    :cond_8
    return-void

    .line 170
    :cond_9
    iget-object v10, p0, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->mChart:Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {v10}, Lcom/github/mikephil/charting/charts/RadarChart;->getSliceAngle()F

    move-result v9

    .line 174
    .local v9, "sliceangle":F
    iget-object v10, p0, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->mChart:Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {v10}, Lcom/github/mikephil/charting/charts/RadarChart;->getFactor()F

    move-result v1

    .line 176
    .local v1, "factor":F
    iget-object v10, p0, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->mChart:Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {v10}, Lcom/github/mikephil/charting/charts/RadarChart;->getCenterOffsets()Landroid/graphics/PointF;

    move-result-object v0

    .line 178
    .local v0, "center":Landroid/graphics/PointF;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1c
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v10

    if-ge v2, v10, :cond_8

    .line 180
    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/github/mikephil/charting/components/LimitLine;

    .line 182
    .local v4, "l":Lcom/github/mikephil/charting/components/LimitLine;
    invoke-virtual {v4}, Lcom/github/mikephil/charting/components/LimitLine;->isEnabled()Z

    move-result v10

    if-nez v10, :cond_31

    .line 178
    :goto_2e
    add-int/lit8 v2, v2, 0x1

    goto :goto_1c

    .line 185
    :cond_31
    iget-object v10, p0, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->mLimitLinePaint:Landroid/graphics/Paint;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/components/LimitLine;->getLineColor()I

    move-result v11

    invoke-virtual {v10, v11}, Landroid/graphics/Paint;->setColor(I)V

    .line 186
    iget-object v10, p0, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->mLimitLinePaint:Landroid/graphics/Paint;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/components/LimitLine;->getDashPathEffect()Landroid/graphics/DashPathEffect;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/graphics/Paint;->setPathEffect(Landroid/graphics/PathEffect;)Landroid/graphics/PathEffect;

    .line 187
    iget-object v10, p0, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->mLimitLinePaint:Landroid/graphics/Paint;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/components/LimitLine;->getLineWidth()F

    move-result v11

    invoke-virtual {v10, v11}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 189
    invoke-virtual {v4}, Lcom/github/mikephil/charting/components/LimitLine;->getLimit()F

    move-result v10

    iget-object v11, p0, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->mChart:Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {v11}, Lcom/github/mikephil/charting/charts/RadarChart;->getYChartMin()F

    move-result v11

    sub-float/2addr v10, v11

    mul-float v8, v10, v1

    .line 191
    .local v8, "r":F
    new-instance v6, Landroid/graphics/Path;

    invoke-direct {v6}, Landroid/graphics/Path;-><init>()V

    .line 193
    .local v6, "limitPath":Landroid/graphics/Path;
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_5f
    iget-object v10, p0, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->mChart:Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {v10}, Lcom/github/mikephil/charting/charts/RadarChart;->getData()Lcom/github/mikephil/charting/data/ChartData;

    move-result-object v10

    check-cast v10, Lcom/github/mikephil/charting/data/RadarData;

    invoke-virtual {v10}, Lcom/github/mikephil/charting/data/RadarData;->getXValCount()I

    move-result v10

    if-ge v3, v10, :cond_8e

    .line 195
    int-to-float v10, v3

    mul-float/2addr v10, v9

    iget-object v11, p0, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->mChart:Lcom/github/mikephil/charting/charts/RadarChart;

    invoke-virtual {v11}, Lcom/github/mikephil/charting/charts/RadarChart;->getRotationAngle()F

    move-result v11

    add-float/2addr v10, v11

    invoke-static {v0, v8, v10}, Lcom/github/mikephil/charting/utils/Utils;->getPosition(Landroid/graphics/PointF;FF)Landroid/graphics/PointF;

    move-result-object v7

    .line 197
    .local v7, "p":Landroid/graphics/PointF;
    if-nez v3, :cond_86

    .line 198
    iget v10, v7, Landroid/graphics/PointF;->x:F

    iget v11, v7, Landroid/graphics/PointF;->y:F

    invoke-virtual {v6, v10, v11}, Landroid/graphics/Path;->moveTo(FF)V

    .line 193
    :goto_83
    add-int/lit8 v3, v3, 0x1

    goto :goto_5f

    .line 200
    :cond_86
    iget v10, v7, Landroid/graphics/PointF;->x:F

    iget v11, v7, Landroid/graphics/PointF;->y:F

    invoke-virtual {v6, v10, v11}, Landroid/graphics/Path;->lineTo(FF)V

    goto :goto_83

    .line 203
    .end local v7    # "p":Landroid/graphics/PointF;
    :cond_8e
    invoke-virtual {v6}, Landroid/graphics/Path;->close()V

    .line 205
    iget-object v10, p0, Lcom/github/mikephil/charting/renderer/YAxisRendererRadarChart;->mLimitLinePaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v6, v10}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    goto :goto_2e
.end method
