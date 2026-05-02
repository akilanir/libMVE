.class public Lcom/github/mikephil/charting/highlight/CombinedHighlighter;
.super Lcom/github/mikephil/charting/highlight/ChartHighlighter;
.source "CombinedHighlighter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/github/mikephil/charting/highlight/ChartHighlighter",
        "<",
        "Lcom/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider;)V
    .registers 2
    .param p1, "chart"    # Lcom/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider;

    .prologue
    .line 18
    invoke-direct {p0, p1}, Lcom/github/mikephil/charting/highlight/ChartHighlighter;-><init>(Lcom/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider;)V

    .line 19
    return-void
.end method


# virtual methods
.method protected getSelectionDetailsAtIndex(II)Ljava/util/List;
    .registers 17
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
    .line 30
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 31
    .local v12, "vals":Ljava/util/List;, "Ljava/util/List<Lcom/github/mikephil/charting/utils/SelectionDetail;>;"
    const/4 v0, 0x2

    new-array v11, v0, [F

    .line 33
    .local v11, "pts":[F
    iget-object v0, p0, Lcom/github/mikephil/charting/highlight/CombinedHighlighter;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider;

    invoke-interface {v0}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider;->getData()Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;

    move-result-object v7

    check-cast v7, Lcom/github/mikephil/charting/data/CombinedData;

    .line 36
    .local v7, "data":Lcom/github/mikephil/charting/data/CombinedData;
    invoke-virtual {v7}, Lcom/github/mikephil/charting/data/CombinedData;->getAllData()Ljava/util/List;

    move-result-object v8

    .line 38
    .local v8, "dataObjects":Ljava/util/List;, "Ljava/util/List<Lcom/github/mikephil/charting/data/ChartData;>;"
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_15
    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v0

    if-ge v3, v0, :cond_70

    .line 40
    const/4 v4, 0x0

    .local v4, "j":I
    :goto_1c
    invoke-interface {v8, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/github/mikephil/charting/data/ChartData;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/ChartData;->getDataSetCount()I

    move-result v0

    if-ge v4, v0, :cond_6d

    .line 42
    invoke-interface {v8, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/github/mikephil/charting/data/ChartData;

    invoke-virtual {v0, v4}, Lcom/github/mikephil/charting/data/ChartData;->getDataSetByIndex(I)Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    move-result-object v5

    .line 45
    .local v5, "dataSet":Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;
    invoke-interface {v5}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->isHighlightEnabled()Z

    move-result v0

    if-nez v0, :cond_3b

    .line 40
    :cond_38
    add-int/lit8 v4, v4, 0x1

    goto :goto_1c

    .line 49
    :cond_3b
    invoke-interface {v5, p1}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getYValsForXIndex(I)[F

    move-result-object v13

    .line 50
    .local v13, "yVals":[F
    move-object v6, v13

    .local v6, "arr$":[F
    array-length v10, v6

    .local v10, "len$":I
    const/4 v9, 0x0

    .local v9, "i$":I
    :goto_42
    if-ge v9, v10, :cond_38

    aget v2, v6, v9

    .line 51
    .local v2, "yVal":F
    const/4 v0, 0x1

    aput v2, v11, v0

    .line 53
    iget-object v0, p0, Lcom/github/mikephil/charting/highlight/CombinedHighlighter;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider;

    invoke-interface {v5}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getAxisDependency()Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider;->getTransformer(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/Transformer;

    move-result-object v0

    invoke-virtual {v0, v11}, Lcom/github/mikephil/charting/utils/Transformer;->pointValuesToPixel([F)V

    .line 55
    const/4 v0, 0x1

    aget v0, v11, v0

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_6a

    .line 56
    new-instance v0, Lcom/github/mikephil/charting/utils/SelectionDetail;

    const/4 v1, 0x1

    aget v1, v11, v1

    invoke-direct/range {v0 .. v5}, Lcom/github/mikephil/charting/utils/SelectionDetail;-><init>(FFIILcom/github/mikephil/charting/interfaces/datasets/IDataSet;)V

    invoke-interface {v12, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 50
    :cond_6a
    add-int/lit8 v9, v9, 0x1

    goto :goto_42

    .line 38
    .end local v2    # "yVal":F
    .end local v5    # "dataSet":Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;
    .end local v6    # "arr$":[F
    .end local v9    # "i$":I
    .end local v10    # "len$":I
    .end local v13    # "yVals":[F
    :cond_6d
    add-int/lit8 v3, v3, 0x1

    goto :goto_15

    .line 62
    .end local v4    # "j":I
    :cond_70
    return-object v12
.end method
