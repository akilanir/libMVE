.class public Lcom/github/mikephil/charting/highlight/HorizontalBarHighlighter;
.super Lcom/github/mikephil/charting/highlight/BarHighlighter;
.source "HorizontalBarHighlighter.java"


# direct methods
.method public constructor <init>(Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;)V
    .registers 2
    .param p1, "chart"    # Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    .prologue
    .line 15
    invoke-direct {p0, p1}, Lcom/github/mikephil/charting/highlight/BarHighlighter;-><init>(Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;)V

    .line 16
    return-void
.end method


# virtual methods
.method protected getBase(F)F
    .registers 11
    .param p1, "y"    # F

    .prologue
    const/4 v8, 0x1

    .line 102
    const/4 v6, 0x2

    new-array v2, v6, [F

    .line 103
    .local v2, "pts":[F
    aput p1, v2, v8

    .line 106
    iget-object v6, p0, Lcom/github/mikephil/charting/highlight/HorizontalBarHighlighter;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider;

    check-cast v6, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    sget-object v7, Lcom/github/mikephil/charting/components/YAxis$AxisDependency;->LEFT:Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    invoke-interface {v6, v7}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->getTransformer(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/Transformer;

    move-result-object v6

    invoke-virtual {v6, v2}, Lcom/github/mikephil/charting/utils/Transformer;->pixelsToValue([F)V

    .line 107
    aget v5, v2, v8

    .line 109
    .local v5, "yVal":F
    iget-object v6, p0, Lcom/github/mikephil/charting/highlight/HorizontalBarHighlighter;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider;

    check-cast v6, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    invoke-interface {v6}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->getBarData()Lcom/github/mikephil/charting/data/BarData;

    move-result-object v6

    invoke-virtual {v6}, Lcom/github/mikephil/charting/data/BarData;->getDataSetCount()I

    move-result v3

    .line 112
    .local v3, "setCount":I
    int-to-float v7, v3

    iget-object v6, p0, Lcom/github/mikephil/charting/highlight/HorizontalBarHighlighter;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider;

    check-cast v6, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    invoke-interface {v6}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->getBarData()Lcom/github/mikephil/charting/data/BarData;

    move-result-object v6

    invoke-virtual {v6}, Lcom/github/mikephil/charting/data/BarData;->getGroupSpace()F

    move-result v6

    add-float/2addr v6, v7

    div-float v6, v5, v6

    float-to-int v4, v6

    .line 114
    .local v4, "steps":I
    iget-object v6, p0, Lcom/github/mikephil/charting/highlight/HorizontalBarHighlighter;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider;

    check-cast v6, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    invoke-interface {v6}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->getBarData()Lcom/github/mikephil/charting/data/BarData;

    move-result-object v6

    invoke-virtual {v6}, Lcom/github/mikephil/charting/data/BarData;->getGroupSpace()F

    move-result v6

    int-to-float v7, v4

    mul-float v1, v6, v7

    .line 116
    .local v1, "groupSpaceSum":F
    sub-float v0, v5, v1

    .line 117
    .local v0, "baseNoSpace":F
    return v0
.end method

.method public getHighlight(FF)Lcom/github/mikephil/charting/highlight/Highlight;
    .registers 20
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    .line 21
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/highlight/HorizontalBarHighlighter;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider;

    check-cast v2, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    invoke-interface {v2}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->getBarData()Lcom/github/mikephil/charting/data/BarData;

    move-result-object v12

    .line 23
    .local v12, "barData":Lcom/github/mikephil/charting/data/BarData;
    invoke-virtual/range {p0 .. p1}, Lcom/github/mikephil/charting/highlight/HorizontalBarHighlighter;->getXIndex(F)I

    move-result v5

    .line 24
    .local v5, "xIndex":I
    invoke-virtual/range {p0 .. p1}, Lcom/github/mikephil/charting/highlight/HorizontalBarHighlighter;->getBase(F)F

    move-result v13

    .line 25
    .local v13, "baseNoSpace":F
    invoke-virtual {v12}, Lcom/github/mikephil/charting/data/BarData;->getDataSetCount()I

    move-result v16

    .line 26
    .local v16, "setCount":I
    float-to-int v2, v13

    rem-int v14, v2, v16

    .line 28
    .local v14, "dataSetIndex":I
    if-gez v14, :cond_28

    .line 29
    const/4 v14, 0x0

    .line 34
    :cond_1c
    :goto_1c
    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-virtual {v0, v5, v1, v14}, Lcom/github/mikephil/charting/highlight/HorizontalBarHighlighter;->getSelectionDetail(IFI)Lcom/github/mikephil/charting/utils/SelectionDetail;

    move-result-object v3

    .line 35
    .local v3, "selectionDetail":Lcom/github/mikephil/charting/utils/SelectionDetail;
    if-nez v3, :cond_2f

    .line 36
    const/4 v6, 0x0

    .line 53
    :goto_27
    return-object v6

    .line 30
    .end local v3    # "selectionDetail":Lcom/github/mikephil/charting/utils/SelectionDetail;
    :cond_28
    move/from16 v0, v16

    if-lt v14, v0, :cond_1c

    .line 31
    add-int/lit8 v14, v16, -0x1

    goto :goto_1c

    .line 38
    .restart local v3    # "selectionDetail":Lcom/github/mikephil/charting/utils/SelectionDetail;
    :cond_2f
    invoke-virtual {v12, v14}, Lcom/github/mikephil/charting/data/BarData;->getDataSetByIndex(I)Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    move-result-object v4

    check-cast v4, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;

    .line 39
    .local v4, "set":Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;
    invoke-interface {v4}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->isStacked()Z

    move-result v2

    if-eqz v2, :cond_5d

    .line 41
    const/4 v2, 0x2

    new-array v15, v2, [F

    .line 42
    .local v15, "pts":[F
    const/4 v2, 0x0

    aput p2, v15, v2

    .line 45
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/highlight/HorizontalBarHighlighter;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider;

    check-cast v2, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    invoke-interface {v4}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getAxisDependency()Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    move-result-object v6

    invoke-interface {v2, v6}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->getTransformer(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/Transformer;

    move-result-object v2

    invoke-virtual {v2, v15}, Lcom/github/mikephil/charting/utils/Transformer;->pixelsToValue([F)V

    .line 47
    const/4 v2, 0x0

    aget v2, v15, v2

    float-to-double v6, v2

    move-object/from16 v2, p0

    invoke-virtual/range {v2 .. v7}, Lcom/github/mikephil/charting/highlight/HorizontalBarHighlighter;->getStackedHighlight(Lcom/github/mikephil/charting/utils/SelectionDetail;Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;ID)Lcom/github/mikephil/charting/highlight/Highlight;

    move-result-object v6

    goto :goto_27

    .line 53
    .end local v15    # "pts":[F
    :cond_5d
    new-instance v6, Lcom/github/mikephil/charting/highlight/Highlight;

    iget v8, v3, Lcom/github/mikephil/charting/utils/SelectionDetail;->value:F

    iget v9, v3, Lcom/github/mikephil/charting/utils/SelectionDetail;->dataIndex:I

    iget v10, v3, Lcom/github/mikephil/charting/utils/SelectionDetail;->dataSetIndex:I

    const/4 v11, -0x1

    move v7, v5

    invoke-direct/range {v6 .. v11}, Lcom/github/mikephil/charting/highlight/Highlight;-><init>(IFIII)V

    goto :goto_27
.end method

.method protected getXIndex(F)I
    .registers 10
    .param p1, "x"    # F

    .prologue
    const/4 v7, 0x1

    .line 64
    iget-object v5, p0, Lcom/github/mikephil/charting/highlight/HorizontalBarHighlighter;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider;

    check-cast v5, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    invoke-interface {v5}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->getBarData()Lcom/github/mikephil/charting/data/BarData;

    move-result-object v5

    invoke-virtual {v5}, Lcom/github/mikephil/charting/data/BarData;->isGrouped()Z

    move-result v5

    if-nez v5, :cond_28

    .line 67
    const/4 v5, 0x2

    new-array v1, v5, [F

    .line 68
    .local v1, "pts":[F
    aput p1, v1, v7

    .line 71
    iget-object v5, p0, Lcom/github/mikephil/charting/highlight/HorizontalBarHighlighter;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider;

    check-cast v5, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    sget-object v6, Lcom/github/mikephil/charting/components/YAxis$AxisDependency;->LEFT:Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    invoke-interface {v5, v6}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->getTransformer(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/Transformer;

    move-result-object v5

    invoke-virtual {v5, v1}, Lcom/github/mikephil/charting/utils/Transformer;->pixelsToValue([F)V

    .line 73
    aget v5, v1, v7

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v4

    .line 88
    .end local v1    # "pts":[F
    :cond_27
    :goto_27
    return v4

    .line 76
    :cond_28
    invoke-virtual {p0, p1}, Lcom/github/mikephil/charting/highlight/HorizontalBarHighlighter;->getBase(F)F

    move-result v0

    .line 78
    .local v0, "baseNoSpace":F
    iget-object v5, p0, Lcom/github/mikephil/charting/highlight/HorizontalBarHighlighter;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider;

    check-cast v5, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    invoke-interface {v5}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->getBarData()Lcom/github/mikephil/charting/data/BarData;

    move-result-object v5

    invoke-virtual {v5}, Lcom/github/mikephil/charting/data/BarData;->getDataSetCount()I

    move-result v2

    .line 79
    .local v2, "setCount":I
    float-to-int v5, v0

    div-int v4, v5, v2

    .line 81
    .local v4, "xIndex":I
    iget-object v5, p0, Lcom/github/mikephil/charting/highlight/HorizontalBarHighlighter;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider;

    check-cast v5, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    invoke-interface {v5}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->getData()Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;

    move-result-object v5

    invoke-virtual {v5}, Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;->getXValCount()I

    move-result v3

    .line 83
    .local v3, "valCount":I
    if-gez v4, :cond_4b

    .line 84
    const/4 v4, 0x0

    goto :goto_27

    .line 85
    :cond_4b
    if-lt v4, v3, :cond_27

    .line 86
    add-int/lit8 v4, v3, -0x1

    goto :goto_27
.end method
