.class public Lcom/github/mikephil/charting/highlight/BarHighlighter;
.super Lcom/github/mikephil/charting/highlight/ChartHighlighter;
.source "BarHighlighter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/github/mikephil/charting/highlight/ChartHighlighter",
        "<",
        "Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;)V
    .registers 2
    .param p1, "chart"    # Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    .prologue
    .line 17
    invoke-direct {p0, p1}, Lcom/github/mikephil/charting/highlight/ChartHighlighter;-><init>(Lcom/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider;)V

    .line 18
    return-void
.end method


# virtual methods
.method protected getBase(F)F
    .registers 11
    .param p1, "x"    # F

    .prologue
    const/4 v8, 0x0

    .line 202
    const/4 v6, 0x2

    new-array v2, v6, [F

    .line 203
    .local v2, "pts":[F
    aput p1, v2, v8

    .line 206
    iget-object v6, p0, Lcom/github/mikephil/charting/highlight/BarHighlighter;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider;

    check-cast v6, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    sget-object v7, Lcom/github/mikephil/charting/components/YAxis$AxisDependency;->LEFT:Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    invoke-interface {v6, v7}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->getTransformer(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/Transformer;

    move-result-object v6

    invoke-virtual {v6, v2}, Lcom/github/mikephil/charting/utils/Transformer;->pixelsToValue([F)V

    .line 207
    aget v5, v2, v8

    .line 209
    .local v5, "xVal":F
    iget-object v6, p0, Lcom/github/mikephil/charting/highlight/BarHighlighter;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider;

    check-cast v6, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    invoke-interface {v6}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->getBarData()Lcom/github/mikephil/charting/data/BarData;

    move-result-object v6

    invoke-virtual {v6}, Lcom/github/mikephil/charting/data/BarData;->getDataSetCount()I

    move-result v3

    .line 212
    .local v3, "setCount":I
    int-to-float v7, v3

    iget-object v6, p0, Lcom/github/mikephil/charting/highlight/BarHighlighter;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider;

    check-cast v6, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    invoke-interface {v6}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->getBarData()Lcom/github/mikephil/charting/data/BarData;

    move-result-object v6

    invoke-virtual {v6}, Lcom/github/mikephil/charting/data/BarData;->getGroupSpace()F

    move-result v6

    add-float/2addr v6, v7

    div-float v6, v5, v6

    float-to-int v4, v6

    .line 214
    .local v4, "steps":I
    iget-object v6, p0, Lcom/github/mikephil/charting/highlight/BarHighlighter;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider;

    check-cast v6, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    invoke-interface {v6}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->getBarData()Lcom/github/mikephil/charting/data/BarData;

    move-result-object v6

    invoke-virtual {v6}, Lcom/github/mikephil/charting/data/BarData;->getGroupSpace()F

    move-result v6

    int-to-float v7, v4

    mul-float v1, v6, v7

    .line 216
    .local v1, "groupSpaceSum":F
    sub-float v0, v5, v1

    .line 217
    .local v0, "baseNoSpace":F
    return v0
.end method

.method protected getClosestStackIndex([Lcom/github/mikephil/charting/highlight/Range;F)I
    .registers 11
    .param p1, "ranges"    # [Lcom/github/mikephil/charting/highlight/Range;
    .param p2, "value"    # F

    .prologue
    const/4 v6, 0x0

    .line 161
    if-eqz p1, :cond_6

    array-length v7, p1

    if-nez v7, :cond_8

    :cond_6
    move v5, v6

    .line 175
    :cond_7
    :goto_7
    return v5

    .line 164
    :cond_8
    const/4 v5, 0x0

    .line 166
    .local v5, "stackIndex":I
    move-object v0, p1

    .local v0, "arr$":[Lcom/github/mikephil/charting/highlight/Range;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_c
    if-ge v1, v2, :cond_1b

    aget-object v4, v0, v1

    .line 167
    .local v4, "range":Lcom/github/mikephil/charting/highlight/Range;
    invoke-virtual {v4, p2}, Lcom/github/mikephil/charting/highlight/Range;->contains(F)Z

    move-result v7

    if-nez v7, :cond_7

    .line 170
    add-int/lit8 v5, v5, 0x1

    .line 166
    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    .line 173
    .end local v4    # "range":Lcom/github/mikephil/charting/highlight/Range;
    :cond_1b
    array-length v7, p1

    add-int/lit8 v7, v7, -0x1

    invoke-static {v7, v6}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 175
    .local v3, "length":I
    aget-object v7, p1, v3

    iget v7, v7, Lcom/github/mikephil/charting/highlight/Range;->to:F

    cmpl-float v7, p2, v7

    if-lez v7, :cond_2c

    .end local v3    # "length":I
    :goto_2a
    move v5, v3

    goto :goto_7

    .restart local v3    # "length":I
    :cond_2c
    move v3, v6

    goto :goto_2a
.end method

.method public getHighlight(FF)Lcom/github/mikephil/charting/highlight/Highlight;
    .registers 20
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    .line 23
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/highlight/BarHighlighter;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider;

    check-cast v2, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    invoke-interface {v2}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->getBarData()Lcom/github/mikephil/charting/data/BarData;

    move-result-object v12

    .line 25
    .local v12, "barData":Lcom/github/mikephil/charting/data/BarData;
    invoke-virtual/range {p0 .. p1}, Lcom/github/mikephil/charting/highlight/BarHighlighter;->getXIndex(F)I

    move-result v5

    .line 26
    .local v5, "xIndex":I
    invoke-virtual/range {p0 .. p1}, Lcom/github/mikephil/charting/highlight/BarHighlighter;->getBase(F)F

    move-result v13

    .line 27
    .local v13, "baseNoSpace":F
    invoke-virtual {v12}, Lcom/github/mikephil/charting/data/BarData;->getDataSetCount()I

    move-result v16

    .line 28
    .local v16, "setCount":I
    float-to-int v2, v13

    rem-int v14, v2, v16

    .line 30
    .local v14, "dataSetIndex":I
    if-gez v14, :cond_28

    .line 31
    const/4 v14, 0x0

    .line 36
    :cond_1c
    :goto_1c
    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-virtual {v0, v5, v1, v14}, Lcom/github/mikephil/charting/highlight/BarHighlighter;->getSelectionDetail(IFI)Lcom/github/mikephil/charting/utils/SelectionDetail;

    move-result-object v3

    .line 37
    .local v3, "selectionDetail":Lcom/github/mikephil/charting/utils/SelectionDetail;
    if-nez v3, :cond_2f

    .line 38
    const/4 v6, 0x0

    .line 55
    :goto_27
    return-object v6

    .line 32
    .end local v3    # "selectionDetail":Lcom/github/mikephil/charting/utils/SelectionDetail;
    :cond_28
    move/from16 v0, v16

    if-lt v14, v0, :cond_1c

    .line 33
    add-int/lit8 v14, v16, -0x1

    goto :goto_1c

    .line 40
    .restart local v3    # "selectionDetail":Lcom/github/mikephil/charting/utils/SelectionDetail;
    :cond_2f
    invoke-virtual {v12, v14}, Lcom/github/mikephil/charting/data/BarData;->getDataSetByIndex(I)Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    move-result-object v4

    check-cast v4, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;

    .line 41
    .local v4, "set":Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;
    invoke-interface {v4}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->isStacked()Z

    move-result v2

    if-eqz v2, :cond_5d

    .line 43
    const/4 v2, 0x2

    new-array v15, v2, [F

    .line 44
    .local v15, "pts":[F
    const/4 v2, 0x1

    aput p2, v15, v2

    .line 47
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/highlight/BarHighlighter;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider;

    check-cast v2, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    invoke-interface {v4}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getAxisDependency()Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    move-result-object v6

    invoke-interface {v2, v6}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->getTransformer(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/Transformer;

    move-result-object v2

    invoke-virtual {v2, v15}, Lcom/github/mikephil/charting/utils/Transformer;->pixelsToValue([F)V

    .line 49
    const/4 v2, 0x1

    aget v2, v15, v2

    float-to-double v6, v2

    move-object/from16 v2, p0

    invoke-virtual/range {v2 .. v7}, Lcom/github/mikephil/charting/highlight/BarHighlighter;->getStackedHighlight(Lcom/github/mikephil/charting/utils/SelectionDetail;Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;ID)Lcom/github/mikephil/charting/highlight/Highlight;

    move-result-object v6

    goto :goto_27

    .line 55
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

.method protected getRanges(Lcom/github/mikephil/charting/data/BarEntry;)[Lcom/github/mikephil/charting/highlight/Range;
    .registers 10
    .param p1, "entry"    # Lcom/github/mikephil/charting/data/BarEntry;

    .prologue
    .line 228
    invoke-virtual {p1}, Lcom/github/mikephil/charting/data/BarEntry;->getVals()[F

    move-result-object v5

    .line 230
    .local v5, "values":[F
    if-eqz v5, :cond_9

    array-length v6, v5

    if-nez v6, :cond_d

    .line 231
    :cond_9
    const/4 v6, 0x0

    new-array v3, v6, [Lcom/github/mikephil/charting/highlight/Range;

    .line 251
    :cond_c
    return-object v3

    .line 233
    :cond_d
    array-length v6, v5

    new-array v3, v6, [Lcom/github/mikephil/charting/highlight/Range;

    .line 235
    .local v3, "ranges":[Lcom/github/mikephil/charting/highlight/Range;
    invoke-virtual {p1}, Lcom/github/mikephil/charting/data/BarEntry;->getNegativeSum()F

    move-result v6

    neg-float v1, v6

    .line 236
    .local v1, "negRemain":F
    const/4 v2, 0x0

    .line 238
    .local v2, "posRemain":F
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_17
    array-length v6, v3

    if-ge v0, v6, :cond_c

    .line 240
    aget v4, v5, v0

    .line 242
    .local v4, "value":F
    const/4 v6, 0x0

    cmpg-float v6, v4, v6

    if-gez v6, :cond_35

    .line 243
    new-instance v6, Lcom/github/mikephil/charting/highlight/Range;

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v7

    add-float/2addr v7, v1

    invoke-direct {v6, v1, v7}, Lcom/github/mikephil/charting/highlight/Range;-><init>(FF)V

    aput-object v6, v3, v0

    .line 244
    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v6

    add-float/2addr v1, v6

    .line 238
    :goto_32
    add-int/lit8 v0, v0, 0x1

    goto :goto_17

    .line 246
    :cond_35
    new-instance v6, Lcom/github/mikephil/charting/highlight/Range;

    add-float v7, v2, v4

    invoke-direct {v6, v2, v7}, Lcom/github/mikephil/charting/highlight/Range;-><init>(FF)V

    aput-object v6, v3, v0

    .line 247
    add-float/2addr v2, v4

    goto :goto_32
.end method

.method protected getSelectionDetail(IFI)Lcom/github/mikephil/charting/utils/SelectionDetail;
    .registers 13
    .param p1, "xIndex"    # I
    .param p2, "y"    # F
    .param p3, "dataSetIndex"    # I

    .prologue
    const/4 v4, 0x0

    .line 89
    const/4 v3, 0x0

    invoke-static {p3, v3}, Ljava/lang/Math;->max(II)I

    move-result p3

    .line 91
    iget-object v3, p0, Lcom/github/mikephil/charting/highlight/BarHighlighter;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider;

    check-cast v3, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    invoke-interface {v3}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->getBarData()Lcom/github/mikephil/charting/data/BarData;

    move-result-object v0

    .line 92
    .local v0, "barData":Lcom/github/mikephil/charting/data/BarData;
    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/BarData;->getDataSetCount()I

    move-result v3

    if-le v3, p3, :cond_1f

    invoke-virtual {v0, p3}, Lcom/github/mikephil/charting/data/BarData;->getDataSetByIndex(I)Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    move-result-object v3

    check-cast v3, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;

    move-object v1, v3

    .line 95
    .local v1, "dataSet":Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;
    :goto_1b
    if-nez v1, :cond_21

    move-object v3, v4

    .line 102
    :goto_1e
    return-object v3

    .end local v1    # "dataSet":Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;
    :cond_1f
    move-object v1, v4

    .line 92
    goto :goto_1b

    .line 98
    .restart local v1    # "dataSet":Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;
    :cond_21
    invoke-interface {v1, p1}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getYValForXIndex(I)F

    move-result v2

    .line 100
    .local v2, "yValue":F
    float-to-double v5, v2

    const-wide/high16 v7, 0x7ff8000000000000L    # Double.NaN

    cmpl-double v3, v5, v7

    if-nez v3, :cond_2e

    move-object v3, v4

    goto :goto_1e

    .line 102
    :cond_2e
    new-instance v3, Lcom/github/mikephil/charting/utils/SelectionDetail;

    invoke-direct {v3, v2, p3, v1}, Lcom/github/mikephil/charting/utils/SelectionDetail;-><init>(FILcom/github/mikephil/charting/interfaces/datasets/IDataSet;)V

    goto :goto_1e
.end method

.method protected getStackedHighlight(Lcom/github/mikephil/charting/utils/SelectionDetail;Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;ID)Lcom/github/mikephil/charting/highlight/Highlight;
    .registers 15
    .param p1, "selectionDetail"    # Lcom/github/mikephil/charting/utils/SelectionDetail;
    .param p2, "set"    # Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;
    .param p3, "xIndex"    # I
    .param p4, "yValue"    # D

    .prologue
    const/4 v0, 0x0

    .line 123
    invoke-interface {p2, p3}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getEntryForXIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v7

    check-cast v7, Lcom/github/mikephil/charting/data/BarEntry;

    .line 125
    .local v7, "entry":Lcom/github/mikephil/charting/data/BarEntry;
    if-nez v7, :cond_a

    .line 148
    :cond_9
    :goto_9
    return-object v0

    .line 128
    :cond_a
    invoke-virtual {v7}, Lcom/github/mikephil/charting/data/BarEntry;->getVals()[F

    move-result-object v1

    if-nez v1, :cond_1e

    .line 129
    new-instance v0, Lcom/github/mikephil/charting/highlight/Highlight;

    invoke-virtual {v7}, Lcom/github/mikephil/charting/data/BarEntry;->getVal()F

    move-result v1

    iget v2, p1, Lcom/github/mikephil/charting/utils/SelectionDetail;->dataIndex:I

    iget v3, p1, Lcom/github/mikephil/charting/utils/SelectionDetail;->dataSetIndex:I

    invoke-direct {v0, p3, v1, v2, v3}, Lcom/github/mikephil/charting/highlight/Highlight;-><init>(IFII)V

    goto :goto_9

    .line 135
    :cond_1e
    invoke-virtual {p0, v7}, Lcom/github/mikephil/charting/highlight/BarHighlighter;->getRanges(Lcom/github/mikephil/charting/data/BarEntry;)[Lcom/github/mikephil/charting/highlight/Range;

    move-result-object v8

    .line 136
    .local v8, "ranges":[Lcom/github/mikephil/charting/highlight/Range;
    array-length v1, v8

    if-lez v1, :cond_9

    .line 137
    double-to-float v0, p4

    invoke-virtual {p0, v8, v0}, Lcom/github/mikephil/charting/highlight/BarHighlighter;->getClosestStackIndex([Lcom/github/mikephil/charting/highlight/Range;F)I

    move-result v5

    .line 138
    .local v5, "stackIndex":I
    new-instance v0, Lcom/github/mikephil/charting/highlight/Highlight;

    invoke-virtual {v7}, Lcom/github/mikephil/charting/data/BarEntry;->getPositiveSum()F

    move-result v1

    invoke-virtual {v7}, Lcom/github/mikephil/charting/data/BarEntry;->getNegativeSum()F

    move-result v2

    sub-float v2, v1, v2

    iget v3, p1, Lcom/github/mikephil/charting/utils/SelectionDetail;->dataIndex:I

    iget v4, p1, Lcom/github/mikephil/charting/utils/SelectionDetail;->dataSetIndex:I

    aget-object v6, v8, v5

    move v1, p3

    invoke-direct/range {v0 .. v6}, Lcom/github/mikephil/charting/highlight/Highlight;-><init>(IFIIILcom/github/mikephil/charting/highlight/Range;)V

    goto :goto_9
.end method

.method protected getXIndex(F)I
    .registers 7
    .param p1, "x"    # F

    .prologue
    .line 66
    iget-object v4, p0, Lcom/github/mikephil/charting/highlight/BarHighlighter;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider;

    check-cast v4, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    invoke-interface {v4}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->getBarData()Lcom/github/mikephil/charting/data/BarData;

    move-result-object v4

    invoke-virtual {v4}, Lcom/github/mikephil/charting/data/BarData;->isGrouped()Z

    move-result v4

    if-nez v4, :cond_13

    .line 67
    invoke-super {p0, p1}, Lcom/github/mikephil/charting/highlight/ChartHighlighter;->getXIndex(F)I

    move-result v3

    .line 82
    :cond_12
    :goto_12
    return v3

    .line 70
    :cond_13
    invoke-virtual {p0, p1}, Lcom/github/mikephil/charting/highlight/BarHighlighter;->getBase(F)F

    move-result v0

    .line 72
    .local v0, "baseNoSpace":F
    iget-object v4, p0, Lcom/github/mikephil/charting/highlight/BarHighlighter;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider;

    check-cast v4, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    invoke-interface {v4}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->getBarData()Lcom/github/mikephil/charting/data/BarData;

    move-result-object v4

    invoke-virtual {v4}, Lcom/github/mikephil/charting/data/BarData;->getDataSetCount()I

    move-result v1

    .line 73
    .local v1, "setCount":I
    float-to-int v4, v0

    div-int v3, v4, v1

    .line 75
    .local v3, "xIndex":I
    iget-object v4, p0, Lcom/github/mikephil/charting/highlight/BarHighlighter;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider;

    check-cast v4, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    invoke-interface {v4}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->getData()Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;

    move-result-object v4

    invoke-virtual {v4}, Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;->getXValCount()I

    move-result v2

    .line 77
    .local v2, "valCount":I
    if-gez v3, :cond_36

    .line 78
    const/4 v3, 0x0

    goto :goto_12

    .line 79
    :cond_36
    if-lt v3, v2, :cond_12

    .line 80
    add-int/lit8 v3, v2, -0x1

    goto :goto_12
.end method
