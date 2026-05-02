.class public Lcom/github/mikephil/charting/data/CombinedData;
.super Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;
.source "CombinedData.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData",
        "<",
        "Lcom/github/mikephil/charting/interfaces/datasets/IBarLineScatterCandleBubbleDataSet",
        "<*>;>;"
    }
.end annotation


# instance fields
.field private mBarData:Lcom/github/mikephil/charting/data/BarData;

.field private mBubbleData:Lcom/github/mikephil/charting/data/BubbleData;

.field private mCandleData:Lcom/github/mikephil/charting/data/CandleData;

.field private mLineData:Lcom/github/mikephil/charting/data/LineData;

.field private mScatterData:Lcom/github/mikephil/charting/data/ScatterData;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 25
    invoke-direct {p0}, Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;-><init>()V

    .line 26
    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 29
    .local p1, "xVals":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct {p0, p1}, Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;-><init>(Ljava/util/List;)V

    .line 30
    return-void
.end method

.method public constructor <init>([Ljava/lang/String;)V
    .registers 2
    .param p1, "xVals"    # [Ljava/lang/String;

    .prologue
    .line 33
    invoke-direct {p0, p1}, Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;-><init>([Ljava/lang/String;)V

    .line 34
    return-void
.end method


# virtual methods
.method public getAllData()Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/github/mikephil/charting/data/ChartData;",
            ">;"
        }
    .end annotation

    .prologue
    .line 92
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 93
    .local v0, "data":Ljava/util/List;, "Ljava/util/List<Lcom/github/mikephil/charting/data/ChartData;>;"
    iget-object v1, p0, Lcom/github/mikephil/charting/data/CombinedData;->mLineData:Lcom/github/mikephil/charting/data/LineData;

    if-eqz v1, :cond_e

    .line 94
    iget-object v1, p0, Lcom/github/mikephil/charting/data/CombinedData;->mLineData:Lcom/github/mikephil/charting/data/LineData;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 95
    :cond_e
    iget-object v1, p0, Lcom/github/mikephil/charting/data/CombinedData;->mBarData:Lcom/github/mikephil/charting/data/BarData;

    if-eqz v1, :cond_17

    .line 96
    iget-object v1, p0, Lcom/github/mikephil/charting/data/CombinedData;->mBarData:Lcom/github/mikephil/charting/data/BarData;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 97
    :cond_17
    iget-object v1, p0, Lcom/github/mikephil/charting/data/CombinedData;->mScatterData:Lcom/github/mikephil/charting/data/ScatterData;

    if-eqz v1, :cond_20

    .line 98
    iget-object v1, p0, Lcom/github/mikephil/charting/data/CombinedData;->mScatterData:Lcom/github/mikephil/charting/data/ScatterData;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 99
    :cond_20
    iget-object v1, p0, Lcom/github/mikephil/charting/data/CombinedData;->mCandleData:Lcom/github/mikephil/charting/data/CandleData;

    if-eqz v1, :cond_29

    .line 100
    iget-object v1, p0, Lcom/github/mikephil/charting/data/CombinedData;->mCandleData:Lcom/github/mikephil/charting/data/CandleData;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 101
    :cond_29
    iget-object v1, p0, Lcom/github/mikephil/charting/data/CombinedData;->mBubbleData:Lcom/github/mikephil/charting/data/BubbleData;

    if-eqz v1, :cond_32

    .line 102
    iget-object v1, p0, Lcom/github/mikephil/charting/data/CombinedData;->mBubbleData:Lcom/github/mikephil/charting/data/BubbleData;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 104
    :cond_32
    return-object v0
.end method

.method public getBarData()Lcom/github/mikephil/charting/data/BarData;
    .registers 2

    .prologue
    .line 75
    iget-object v0, p0, Lcom/github/mikephil/charting/data/CombinedData;->mBarData:Lcom/github/mikephil/charting/data/BarData;

    return-object v0
.end method

.method public getBubbleData()Lcom/github/mikephil/charting/data/BubbleData;
    .registers 2

    .prologue
    .line 67
    iget-object v0, p0, Lcom/github/mikephil/charting/data/CombinedData;->mBubbleData:Lcom/github/mikephil/charting/data/BubbleData;

    return-object v0
.end method

.method public getCandleData()Lcom/github/mikephil/charting/data/CandleData;
    .registers 2

    .prologue
    .line 83
    iget-object v0, p0, Lcom/github/mikephil/charting/data/CombinedData;->mCandleData:Lcom/github/mikephil/charting/data/CandleData;

    return-object v0
.end method

.method public getEntryForHighlight(Lcom/github/mikephil/charting/highlight/Highlight;)Lcom/github/mikephil/charting/data/Entry;
    .registers 10
    .param p1, "highlight"    # Lcom/github/mikephil/charting/highlight/Highlight;

    .prologue
    const/4 v6, 0x0

    .line 132
    invoke-virtual {p0}, Lcom/github/mikephil/charting/data/CombinedData;->getAllData()Ljava/util/List;

    move-result-object v1

    .line 134
    .local v1, "dataObjects":Ljava/util/List;, "Ljava/util/List<Lcom/github/mikephil/charting/data/ChartData;>;"
    invoke-virtual {p1}, Lcom/github/mikephil/charting/highlight/Highlight;->getDataIndex()I

    move-result v5

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v7

    if-lt v5, v7, :cond_11

    move-object v3, v6

    .line 152
    :goto_10
    return-object v3

    .line 137
    :cond_11
    invoke-virtual {p1}, Lcom/github/mikephil/charting/highlight/Highlight;->getDataIndex()I

    move-result v5

    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/github/mikephil/charting/data/ChartData;

    .line 139
    .local v0, "data":Lcom/github/mikephil/charting/data/ChartData;
    invoke-virtual {p1}, Lcom/github/mikephil/charting/highlight/Highlight;->getDataSetIndex()I

    move-result v5

    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/ChartData;->getDataSetCount()I

    move-result v7

    if-lt v5, v7, :cond_27

    move-object v3, v6

    .line 140
    goto :goto_10

    .line 145
    :cond_27
    invoke-virtual {p1}, Lcom/github/mikephil/charting/highlight/Highlight;->getDataSetIndex()I

    move-result v5

    invoke-virtual {v0, v5}, Lcom/github/mikephil/charting/data/ChartData;->getDataSetByIndex(I)Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    move-result-object v5

    invoke-virtual {p1}, Lcom/github/mikephil/charting/highlight/Highlight;->getXIndex()I

    move-result v7

    invoke-interface {v5, v7}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getEntriesForXIndex(I)Ljava/util/List;

    move-result-object v2

    .line 147
    .local v2, "entries":Ljava/util/List;, "Ljava/util/List<*>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :cond_3b
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_61

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .local v3, "entry":Ljava/lang/Object;
    move-object v5, v3

    .line 148
    check-cast v5, Lcom/github/mikephil/charting/data/Entry;

    invoke-virtual {v5}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v5

    invoke-virtual {p1}, Lcom/github/mikephil/charting/highlight/Highlight;->getValue()F

    move-result v7

    cmpl-float v5, v5, v7

    if-eqz v5, :cond_5e

    invoke-virtual {p1}, Lcom/github/mikephil/charting/highlight/Highlight;->getValue()F

    move-result v5

    invoke-static {v5}, Ljava/lang/Float;->isNaN(F)Z

    move-result v5

    if-eqz v5, :cond_3b

    .line 150
    :cond_5e
    check-cast v3, Lcom/github/mikephil/charting/data/Entry;

    goto :goto_10

    .end local v3    # "entry":Ljava/lang/Object;
    :cond_61
    move-object v3, v6

    .line 152
    goto :goto_10
.end method

.method public getLineData()Lcom/github/mikephil/charting/data/LineData;
    .registers 2

    .prologue
    .line 71
    iget-object v0, p0, Lcom/github/mikephil/charting/data/CombinedData;->mLineData:Lcom/github/mikephil/charting/data/LineData;

    return-object v0
.end method

.method public getScatterData()Lcom/github/mikephil/charting/data/ScatterData;
    .registers 2

    .prologue
    .line 79
    iget-object v0, p0, Lcom/github/mikephil/charting/data/CombinedData;->mScatterData:Lcom/github/mikephil/charting/data/ScatterData;

    return-object v0
.end method

.method public notifyDataChanged()V
    .registers 2

    .prologue
    .line 109
    iget-object v0, p0, Lcom/github/mikephil/charting/data/CombinedData;->mLineData:Lcom/github/mikephil/charting/data/LineData;

    if-eqz v0, :cond_9

    .line 110
    iget-object v0, p0, Lcom/github/mikephil/charting/data/CombinedData;->mLineData:Lcom/github/mikephil/charting/data/LineData;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/LineData;->notifyDataChanged()V

    .line 111
    :cond_9
    iget-object v0, p0, Lcom/github/mikephil/charting/data/CombinedData;->mBarData:Lcom/github/mikephil/charting/data/BarData;

    if-eqz v0, :cond_12

    .line 112
    iget-object v0, p0, Lcom/github/mikephil/charting/data/CombinedData;->mBarData:Lcom/github/mikephil/charting/data/BarData;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/BarData;->notifyDataChanged()V

    .line 113
    :cond_12
    iget-object v0, p0, Lcom/github/mikephil/charting/data/CombinedData;->mCandleData:Lcom/github/mikephil/charting/data/CandleData;

    if-eqz v0, :cond_1b

    .line 114
    iget-object v0, p0, Lcom/github/mikephil/charting/data/CombinedData;->mCandleData:Lcom/github/mikephil/charting/data/CandleData;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/CandleData;->notifyDataChanged()V

    .line 115
    :cond_1b
    iget-object v0, p0, Lcom/github/mikephil/charting/data/CombinedData;->mScatterData:Lcom/github/mikephil/charting/data/ScatterData;

    if-eqz v0, :cond_24

    .line 116
    iget-object v0, p0, Lcom/github/mikephil/charting/data/CombinedData;->mScatterData:Lcom/github/mikephil/charting/data/ScatterData;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/ScatterData;->notifyDataChanged()V

    .line 117
    :cond_24
    iget-object v0, p0, Lcom/github/mikephil/charting/data/CombinedData;->mBubbleData:Lcom/github/mikephil/charting/data/BubbleData;

    if-eqz v0, :cond_2d

    .line 118
    iget-object v0, p0, Lcom/github/mikephil/charting/data/CombinedData;->mBubbleData:Lcom/github/mikephil/charting/data/BubbleData;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/BubbleData;->notifyDataChanged()V

    .line 120
    :cond_2d
    invoke-virtual {p0}, Lcom/github/mikephil/charting/data/CombinedData;->init()V

    .line 121
    return-void
.end method

.method public setData(Lcom/github/mikephil/charting/data/BarData;)V
    .registers 4
    .param p1, "data"    # Lcom/github/mikephil/charting/data/BarData;

    .prologue
    .line 43
    iput-object p1, p0, Lcom/github/mikephil/charting/data/CombinedData;->mBarData:Lcom/github/mikephil/charting/data/BarData;

    .line 44
    iget-object v0, p0, Lcom/github/mikephil/charting/data/CombinedData;->mDataSets:Ljava/util/List;

    invoke-virtual {p1}, Lcom/github/mikephil/charting/data/BarData;->getDataSets()Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 45
    invoke-virtual {p0}, Lcom/github/mikephil/charting/data/CombinedData;->init()V

    .line 46
    return-void
.end method

.method public setData(Lcom/github/mikephil/charting/data/BubbleData;)V
    .registers 4
    .param p1, "data"    # Lcom/github/mikephil/charting/data/BubbleData;

    .prologue
    .line 61
    iput-object p1, p0, Lcom/github/mikephil/charting/data/CombinedData;->mBubbleData:Lcom/github/mikephil/charting/data/BubbleData;

    .line 62
    iget-object v0, p0, Lcom/github/mikephil/charting/data/CombinedData;->mDataSets:Ljava/util/List;

    invoke-virtual {p1}, Lcom/github/mikephil/charting/data/BubbleData;->getDataSets()Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 63
    invoke-virtual {p0}, Lcom/github/mikephil/charting/data/CombinedData;->init()V

    .line 64
    return-void
.end method

.method public setData(Lcom/github/mikephil/charting/data/CandleData;)V
    .registers 4
    .param p1, "data"    # Lcom/github/mikephil/charting/data/CandleData;

    .prologue
    .line 55
    iput-object p1, p0, Lcom/github/mikephil/charting/data/CombinedData;->mCandleData:Lcom/github/mikephil/charting/data/CandleData;

    .line 56
    iget-object v0, p0, Lcom/github/mikephil/charting/data/CombinedData;->mDataSets:Ljava/util/List;

    invoke-virtual {p1}, Lcom/github/mikephil/charting/data/CandleData;->getDataSets()Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 57
    invoke-virtual {p0}, Lcom/github/mikephil/charting/data/CombinedData;->init()V

    .line 58
    return-void
.end method

.method public setData(Lcom/github/mikephil/charting/data/LineData;)V
    .registers 4
    .param p1, "data"    # Lcom/github/mikephil/charting/data/LineData;

    .prologue
    .line 37
    iput-object p1, p0, Lcom/github/mikephil/charting/data/CombinedData;->mLineData:Lcom/github/mikephil/charting/data/LineData;

    .line 38
    iget-object v0, p0, Lcom/github/mikephil/charting/data/CombinedData;->mDataSets:Ljava/util/List;

    invoke-virtual {p1}, Lcom/github/mikephil/charting/data/LineData;->getDataSets()Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 39
    invoke-virtual {p0}, Lcom/github/mikephil/charting/data/CombinedData;->init()V

    .line 40
    return-void
.end method

.method public setData(Lcom/github/mikephil/charting/data/ScatterData;)V
    .registers 4
    .param p1, "data"    # Lcom/github/mikephil/charting/data/ScatterData;

    .prologue
    .line 49
    iput-object p1, p0, Lcom/github/mikephil/charting/data/CombinedData;->mScatterData:Lcom/github/mikephil/charting/data/ScatterData;

    .line 50
    iget-object v0, p0, Lcom/github/mikephil/charting/data/CombinedData;->mDataSets:Ljava/util/List;

    invoke-virtual {p1}, Lcom/github/mikephil/charting/data/ScatterData;->getDataSets()Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 51
    invoke-virtual {p0}, Lcom/github/mikephil/charting/data/CombinedData;->init()V

    .line 52
    return-void
.end method
