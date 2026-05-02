.class public Lcom/github/mikephil/charting/highlight/ChartHighlighter;
.super Ljava/lang/Object;
.source "ChartHighlighter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lcom/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field protected mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 20
    .local p0, "this":Lcom/github/mikephil/charting/highlight/ChartHighlighter;, "Lcom/github/mikephil/charting/highlight/ChartHighlighter<TT;>;"
    .local p1, "chart":Lcom/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider;, "TT;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-object p1, p0, Lcom/github/mikephil/charting/highlight/ChartHighlighter;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider;

    .line 22
    return-void
.end method


# virtual methods
.method public getHighlight(FF)Lcom/github/mikephil/charting/highlight/Highlight;
    .registers 9
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    .line 33
    .local p0, "this":Lcom/github/mikephil/charting/highlight/ChartHighlighter;, "Lcom/github/mikephil/charting/highlight/ChartHighlighter<TT;>;"
    invoke-virtual {p0, p1}, Lcom/github/mikephil/charting/highlight/ChartHighlighter;->getXIndex(F)I

    move-result v1

    .line 35
    .local v1, "xIndex":I
    const/4 v2, -0x1

    invoke-virtual {p0, v1, p2, v2}, Lcom/github/mikephil/charting/highlight/ChartHighlighter;->getSelectionDetail(IFI)Lcom/github/mikephil/charting/utils/SelectionDetail;

    move-result-object v0

    .line 36
    .local v0, "selectionDetail":Lcom/github/mikephil/charting/utils/SelectionDetail;
    if-nez v0, :cond_d

    .line 37
    const/4 v2, 0x0

    .line 39
    :goto_c
    return-object v2

    :cond_d
    new-instance v2, Lcom/github/mikephil/charting/highlight/Highlight;

    iget v3, v0, Lcom/github/mikephil/charting/utils/SelectionDetail;->value:F

    iget v4, v0, Lcom/github/mikephil/charting/utils/SelectionDetail;->dataIndex:I

    iget v5, v0, Lcom/github/mikephil/charting/utils/SelectionDetail;->dataSetIndex:I

    invoke-direct {v2, v1, v3, v4, v5}, Lcom/github/mikephil/charting/highlight/Highlight;-><init>(IFII)V

    goto :goto_c
.end method

.method protected getSelectionDetail(IFI)Lcom/github/mikephil/charting/utils/SelectionDetail;
    .registers 10
    .param p1, "xIndex"    # I
    .param p2, "y"    # F
    .param p3, "dataSetIndex"    # I

    .prologue
    .line 73
    .local p0, "this":Lcom/github/mikephil/charting/highlight/ChartHighlighter;, "Lcom/github/mikephil/charting/highlight/ChartHighlighter<TT;>;"
    invoke-virtual {p0, p1, p3}, Lcom/github/mikephil/charting/highlight/ChartHighlighter;->getSelectionDetailsAtIndex(II)Ljava/util/List;

    move-result-object v4

    .line 75
    .local v4, "valsAtIndex":Ljava/util/List;, "Ljava/util/List<Lcom/github/mikephil/charting/utils/SelectionDetail;>;"
    sget-object v5, Lcom/github/mikephil/charting/components/YAxis$AxisDependency;->LEFT:Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    invoke-static {v4, p2, v5}, Lcom/github/mikephil/charting/utils/Utils;->getMinimumDistance(Ljava/util/List;FLcom/github/mikephil/charting/components/YAxis$AxisDependency;)F

    move-result v2

    .line 76
    .local v2, "leftdist":F
    sget-object v5, Lcom/github/mikephil/charting/components/YAxis$AxisDependency;->RIGHT:Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    invoke-static {v4, p2, v5}, Lcom/github/mikephil/charting/utils/Utils;->getMinimumDistance(Ljava/util/List;FLcom/github/mikephil/charting/components/YAxis$AxisDependency;)F

    move-result v3

    .line 78
    .local v3, "rightdist":F
    cmpg-float v5, v2, v3

    if-gez v5, :cond_1b

    sget-object v0, Lcom/github/mikephil/charting/components/YAxis$AxisDependency;->LEFT:Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    .line 80
    .local v0, "axis":Lcom/github/mikephil/charting/components/YAxis$AxisDependency;
    :goto_16
    invoke-static {v4, p2, v0}, Lcom/github/mikephil/charting/utils/Utils;->getClosestSelectionDetailByPixelY(Ljava/util/List;FLcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/SelectionDetail;

    move-result-object v1

    .line 82
    .local v1, "detail":Lcom/github/mikephil/charting/utils/SelectionDetail;
    return-object v1

    .line 78
    .end local v0    # "axis":Lcom/github/mikephil/charting/components/YAxis$AxisDependency;
    .end local v1    # "detail":Lcom/github/mikephil/charting/utils/SelectionDetail;
    :cond_1b
    sget-object v0, Lcom/github/mikephil/charting/components/YAxis$AxisDependency;->RIGHT:Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    goto :goto_16
.end method

.method protected getSelectionDetailsAtIndex(II)Ljava/util/List;
    .registers 16
    .param p1, "xIndex"    # I
    .param p2, "dataSetIndex"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Ljava/util/List",
            "<",
            "Lcom/github/mikephil/charting/utils/SelectionDetail;",
            ">;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/highlight/ChartHighlighter;, "Lcom/github/mikephil/charting/highlight/ChartHighlighter<TT;>;"
    const/4 v12, 0x1

    .line 94
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 96
    .local v7, "vals":Ljava/util/List;, "Ljava/util/List<Lcom/github/mikephil/charting/utils/SelectionDetail;>;"
    iget-object v10, p0, Lcom/github/mikephil/charting/highlight/ChartHighlighter;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider;

    invoke-interface {v10}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider;->getData()Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;

    move-result-object v10

    if-nez v10, :cond_f

    .line 130
    :cond_e
    return-object v7

    .line 98
    :cond_f
    const/4 v10, 0x2

    new-array v6, v10, [F

    .line 100
    .local v6, "pts":[F
    const/4 v3, 0x0

    .local v3, "i":I
    iget-object v10, p0, Lcom/github/mikephil/charting/highlight/ChartHighlighter;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider;

    invoke-interface {v10}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider;->getData()Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;

    move-result-object v10

    invoke-virtual {v10}, Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;->getDataSetCount()I

    move-result v2

    .line 101
    .local v2, "dataSetCount":I
    :goto_1d
    if-ge v3, v2, :cond_e

    .line 104
    const/4 v10, -0x1

    if-le p2, v10, :cond_27

    if-eq p2, v3, :cond_27

    .line 102
    :cond_24
    add-int/lit8 v3, v3, 0x1

    goto :goto_1d

    .line 107
    :cond_27
    iget-object v10, p0, Lcom/github/mikephil/charting/highlight/ChartHighlighter;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider;

    invoke-interface {v10}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider;->getData()Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;

    move-result-object v10

    invoke-virtual {v10, v3}, Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;->getDataSetByIndex(I)Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    move-result-object v1

    .line 110
    .local v1, "dataSet":Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;
    invoke-interface {v1}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->isHighlightEnabled()Z

    move-result v10

    if-eqz v10, :cond_24

    .line 114
    invoke-interface {v1, p1}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getYValsForXIndex(I)[F

    move-result-object v9

    .line 115
    .local v9, "yVals":[F
    move-object v0, v9

    .local v0, "arr$":[F
    array-length v5, v0

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_3e
    if-ge v4, v5, :cond_24

    aget v8, v0, v4

    .line 116
    .local v8, "yVal":F
    invoke-static {v8}, Ljava/lang/Float;->isNaN(F)Z

    move-result v10

    if-eqz v10, :cond_4b

    .line 115
    :cond_48
    :goto_48
    add-int/lit8 v4, v4, 0x1

    goto :goto_3e

    .line 119
    :cond_4b
    aput v8, v6, v12

    .line 121
    iget-object v10, p0, Lcom/github/mikephil/charting/highlight/ChartHighlighter;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider;

    invoke-interface {v1}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getAxisDependency()Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    move-result-object v11

    invoke-interface {v10, v11}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider;->getTransformer(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/Transformer;

    move-result-object v10

    invoke-virtual {v10, v6}, Lcom/github/mikephil/charting/utils/Transformer;->pointValuesToPixel([F)V

    .line 123
    aget v10, v6, v12

    invoke-static {v10}, Ljava/lang/Float;->isNaN(F)Z

    move-result v10

    if-nez v10, :cond_48

    .line 125
    new-instance v10, Lcom/github/mikephil/charting/utils/SelectionDetail;

    aget v11, v6, v12

    invoke-direct {v10, v11, v8, v3, v1}, Lcom/github/mikephil/charting/utils/SelectionDetail;-><init>(FFILcom/github/mikephil/charting/interfaces/datasets/IDataSet;)V

    invoke-interface {v7, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_48
.end method

.method protected getXIndex(F)I
    .registers 6
    .param p1, "x"    # F

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/highlight/ChartHighlighter;, "Lcom/github/mikephil/charting/highlight/ChartHighlighter<TT;>;"
    const/4 v3, 0x0

    .line 54
    const/4 v1, 0x2

    new-array v0, v1, [F

    .line 55
    .local v0, "pts":[F
    aput p1, v0, v3

    .line 58
    iget-object v1, p0, Lcom/github/mikephil/charting/highlight/ChartHighlighter;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider;

    sget-object v2, Lcom/github/mikephil/charting/components/YAxis$AxisDependency;->LEFT:Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    invoke-interface {v1, v2}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider;->getTransformer(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/Transformer;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/github/mikephil/charting/utils/Transformer;->pixelsToValue([F)V

    .line 60
    aget v1, v0, v3

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    return v1
.end method
