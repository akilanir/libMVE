.class public Lcom/github/mikephil/charting/buffer/HorizontalBarBuffer;
.super Lcom/github/mikephil/charting/buffer/BarBuffer;
.source "HorizontalBarBuffer.java"


# direct methods
.method public constructor <init>(IFIZ)V
    .registers 5
    .param p1, "size"    # I
    .param p2, "groupspace"    # F
    .param p3, "dataSetCount"    # I
    .param p4, "containsStacks"    # Z

    .prologue
    .line 10
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/github/mikephil/charting/buffer/BarBuffer;-><init>(IFIZ)V

    .line 11
    return-void
.end method


# virtual methods
.method public feed(Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;)V
    .registers 25
    .param p1, "data"    # Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;

    .prologue
    .line 16
    invoke-interface/range {p1 .. p1}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getEntryCount()I

    move-result v20

    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v20, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/github/mikephil/charting/buffer/HorizontalBarBuffer;->phaseX:F

    move/from16 v21, v0

    mul-float v13, v20, v21

    .line 18
    .local v13, "size":F
    move-object/from16 v0, p0

    iget v0, v0, Lcom/github/mikephil/charting/buffer/HorizontalBarBuffer;->mDataSetCount:I

    move/from16 v20, v0

    add-int/lit8 v4, v20, -0x1

    .line 19
    .local v4, "dataSetOffset":I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/github/mikephil/charting/buffer/HorizontalBarBuffer;->mBarSpace:F

    move/from16 v20, v0

    const/high16 v21, 0x40000000    # 2.0f

    div-float v1, v20, v21

    .line 20
    .local v1, "barSpaceHalf":F
    move-object/from16 v0, p0

    iget v0, v0, Lcom/github/mikephil/charting/buffer/HorizontalBarBuffer;->mGroupSpace:F

    move/from16 v20, v0

    const/high16 v21, 0x40000000    # 2.0f

    div-float v6, v20, v21

    .line 21
    .local v6, "groupSpaceHalf":F
    const/high16 v2, 0x3f000000    # 0.5f

    .line 23
    .local v2, "barWidth":F
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_30
    int-to-float v0, v7

    move/from16 v20, v0

    cmpg-float v20, v20, v13

    if-gez v20, :cond_154

    .line 25
    move-object/from16 v0, p1

    invoke-interface {v0, v7}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v5

    check-cast v5, Lcom/github/mikephil/charting/data/BarEntry;

    .line 28
    .local v5, "e":Lcom/github/mikephil/charting/data/BarEntry;
    invoke-virtual {v5}, Lcom/github/mikephil/charting/data/BarEntry;->getXIndex()I

    move-result v20

    invoke-virtual {v5}, Lcom/github/mikephil/charting/data/BarEntry;->getXIndex()I

    move-result v21

    mul-int v21, v21, v4

    add-int v20, v20, v21

    move-object/from16 v0, p0

    iget v0, v0, Lcom/github/mikephil/charting/buffer/HorizontalBarBuffer;->mDataSetIndex:I

    move/from16 v21, v0

    add-int v20, v20, v21

    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v20, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/github/mikephil/charting/buffer/HorizontalBarBuffer;->mGroupSpace:F

    move/from16 v21, v0

    invoke-virtual {v5}, Lcom/github/mikephil/charting/data/BarEntry;->getXIndex()I

    move-result v22

    move/from16 v0, v22

    int-to-float v0, v0

    move/from16 v22, v0

    mul-float v21, v21, v22

    add-float v20, v20, v21

    add-float v17, v20, v6

    .line 30
    .local v17, "x":F
    invoke-virtual {v5}, Lcom/github/mikephil/charting/data/BarEntry;->getVal()F

    move-result v18

    .line 31
    .local v18, "y":F
    invoke-virtual {v5}, Lcom/github/mikephil/charting/data/BarEntry;->getVals()[F

    move-result-object v15

    .line 33
    .local v15, "vals":[F
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/github/mikephil/charting/buffer/HorizontalBarBuffer;->mContainsStacks:Z

    move/from16 v20, v0

    if-eqz v20, :cond_7f

    if-nez v15, :cond_d8

    .line 35
    :cond_7f
    sub-float v20, v17, v2

    add-float v3, v20, v1

    .line 36
    .local v3, "bottom":F
    add-float v20, v17, v2

    sub-float v14, v20, v1

    .line 38
    .local v14, "top":F
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/github/mikephil/charting/buffer/HorizontalBarBuffer;->mInverted:Z

    move/from16 v20, v0

    if-eqz v20, :cond_ba

    .line 39
    const/16 v20, 0x0

    cmpl-float v20, v18, v20

    if-ltz v20, :cond_b6

    move/from16 v9, v18

    .line 40
    .local v9, "left":F
    :goto_97
    const/16 v20, 0x0

    cmpg-float v20, v18, v20

    if-gtz v20, :cond_b8

    move/from16 v12, v18

    .line 47
    .local v12, "right":F
    :goto_9f
    const/16 v20, 0x0

    cmpl-float v20, v12, v20

    if-lez v20, :cond_cf

    .line 48
    move-object/from16 v0, p0

    iget v0, v0, Lcom/github/mikephil/charting/buffer/HorizontalBarBuffer;->phaseY:F

    move/from16 v20, v0

    mul-float v12, v12, v20

    .line 52
    :goto_ad
    move-object/from16 v0, p0

    invoke-virtual {v0, v9, v14, v12, v3}, Lcom/github/mikephil/charting/buffer/HorizontalBarBuffer;->addBar(FFFF)V

    .line 23
    .end local v3    # "bottom":F
    .end local v9    # "left":F
    .end local v12    # "right":F
    .end local v14    # "top":F
    :cond_b2
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_30

    .line 39
    .restart local v3    # "bottom":F
    .restart local v14    # "top":F
    :cond_b6
    const/4 v9, 0x0

    goto :goto_97

    .line 40
    .restart local v9    # "left":F
    :cond_b8
    const/4 v12, 0x0

    goto :goto_9f

    .line 42
    .end local v9    # "left":F
    :cond_ba
    const/16 v20, 0x0

    cmpl-float v20, v18, v20

    if-ltz v20, :cond_cb

    move/from16 v12, v18

    .line 43
    .restart local v12    # "right":F
    :goto_c2
    const/16 v20, 0x0

    cmpg-float v20, v18, v20

    if-gtz v20, :cond_cd

    move/from16 v9, v18

    .restart local v9    # "left":F
    :goto_ca
    goto :goto_9f

    .line 42
    .end local v9    # "left":F
    .end local v12    # "right":F
    :cond_cb
    const/4 v12, 0x0

    goto :goto_c2

    .line 43
    .restart local v12    # "right":F
    :cond_cd
    const/4 v9, 0x0

    goto :goto_ca

    .line 50
    .restart local v9    # "left":F
    :cond_cf
    move-object/from16 v0, p0

    iget v0, v0, Lcom/github/mikephil/charting/buffer/HorizontalBarBuffer;->phaseY:F

    move/from16 v20, v0

    mul-float v9, v9, v20

    goto :goto_ad

    .line 56
    .end local v3    # "bottom":F
    .end local v9    # "left":F
    .end local v12    # "right":F
    .end local v14    # "top":F
    :cond_d8
    const/4 v11, 0x0

    .line 57
    .local v11, "posY":F
    invoke-virtual {v5}, Lcom/github/mikephil/charting/data/BarEntry;->getNegativeSum()F

    move-result v20

    move/from16 v0, v20

    neg-float v10, v0

    .line 58
    .local v10, "negY":F
    const/16 v19, 0x0

    .line 61
    .local v19, "yStart":F
    const/4 v8, 0x0

    .local v8, "k":I
    :goto_e3
    array-length v0, v15

    move/from16 v20, v0

    move/from16 v0, v20

    if-ge v8, v0, :cond_b2

    .line 63
    aget v16, v15, v8

    .line 65
    .local v16, "value":F
    const/16 v20, 0x0

    cmpl-float v20, v16, v20

    if-ltz v20, :cond_12c

    .line 66
    move/from16 v18, v11

    .line 67
    add-float v19, v11, v16

    .line 68
    move/from16 v11, v19

    .line 75
    :goto_f8
    sub-float v20, v17, v2

    add-float v3, v20, v1

    .line 76
    .restart local v3    # "bottom":F
    add-float v20, v17, v2

    sub-float v14, v20, v1

    .line 78
    .restart local v14    # "top":F
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/github/mikephil/charting/buffer/HorizontalBarBuffer;->mInverted:Z

    move/from16 v20, v0

    if-eqz v20, :cond_141

    .line 79
    cmpl-float v20, v18, v19

    if-ltz v20, :cond_13b

    move/from16 v9, v18

    .line 80
    .restart local v9    # "left":F
    :goto_10e
    cmpg-float v20, v18, v19

    if-gtz v20, :cond_13e

    move/from16 v12, v18

    .line 87
    .restart local v12    # "right":F
    :goto_114
    move-object/from16 v0, p0

    iget v0, v0, Lcom/github/mikephil/charting/buffer/HorizontalBarBuffer;->phaseY:F

    move/from16 v20, v0

    mul-float v12, v12, v20

    .line 88
    move-object/from16 v0, p0

    iget v0, v0, Lcom/github/mikephil/charting/buffer/HorizontalBarBuffer;->phaseY:F

    move/from16 v20, v0

    mul-float v9, v9, v20

    .line 90
    move-object/from16 v0, p0

    invoke-virtual {v0, v9, v14, v12, v3}, Lcom/github/mikephil/charting/buffer/HorizontalBarBuffer;->addBar(FFFF)V

    .line 61
    add-int/lit8 v8, v8, 0x1

    goto :goto_e3

    .line 70
    .end local v3    # "bottom":F
    .end local v9    # "left":F
    .end local v12    # "right":F
    .end local v14    # "top":F
    :cond_12c
    move/from16 v18, v10

    .line 71
    invoke-static/range {v16 .. v16}, Ljava/lang/Math;->abs(F)F

    move-result v20

    add-float v19, v10, v20

    .line 72
    invoke-static/range {v16 .. v16}, Ljava/lang/Math;->abs(F)F

    move-result v20

    add-float v10, v10, v20

    goto :goto_f8

    .restart local v3    # "bottom":F
    .restart local v14    # "top":F
    :cond_13b
    move/from16 v9, v19

    .line 79
    goto :goto_10e

    .restart local v9    # "left":F
    :cond_13e
    move/from16 v12, v19

    .line 80
    goto :goto_114

    .line 82
    .end local v9    # "left":F
    :cond_141
    cmpl-float v20, v18, v19

    if-ltz v20, :cond_14e

    move/from16 v12, v18

    .line 83
    .restart local v12    # "right":F
    :goto_147
    cmpg-float v20, v18, v19

    if-gtz v20, :cond_151

    move/from16 v9, v18

    .restart local v9    # "left":F
    :goto_14d
    goto :goto_114

    .end local v9    # "left":F
    .end local v12    # "right":F
    :cond_14e
    move/from16 v12, v19

    .line 82
    goto :goto_147

    .restart local v12    # "right":F
    :cond_151
    move/from16 v9, v19

    .line 83
    goto :goto_14d

    .line 95
    .end local v3    # "bottom":F
    .end local v5    # "e":Lcom/github/mikephil/charting/data/BarEntry;
    .end local v8    # "k":I
    .end local v10    # "negY":F
    .end local v11    # "posY":F
    .end local v12    # "right":F
    .end local v14    # "top":F
    .end local v15    # "vals":[F
    .end local v16    # "value":F
    .end local v17    # "x":F
    .end local v18    # "y":F
    .end local v19    # "yStart":F
    :cond_154
    invoke-virtual/range {p0 .. p0}, Lcom/github/mikephil/charting/buffer/HorizontalBarBuffer;->reset()V

    .line 96
    return-void
.end method

.method public bridge synthetic feed(Ljava/lang/Object;)V
    .registers 2
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 7
    check-cast p1, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/github/mikephil/charting/buffer/HorizontalBarBuffer;->feed(Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;)V

    return-void
.end method
