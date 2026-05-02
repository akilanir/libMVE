.class public Lcom/github/mikephil/charting/charts/CombinedChart;
.super Lcom/github/mikephil/charting/charts/BarLineChartBase;
.source "CombinedChart.java"

# interfaces
.implements Lcom/github/mikephil/charting/interfaces/dataprovider/LineDataProvider;
.implements Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;
.implements Lcom/github/mikephil/charting/interfaces/dataprovider/ScatterDataProvider;
.implements Lcom/github/mikephil/charting/interfaces/dataprovider/CandleDataProvider;
.implements Lcom/github/mikephil/charting/interfaces/dataprovider/BubbleDataProvider;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/github/mikephil/charting/charts/CombinedChart$DrawOrder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/github/mikephil/charting/charts/BarLineChartBase",
        "<",
        "Lcom/github/mikephil/charting/data/CombinedData;",
        ">;",
        "Lcom/github/mikephil/charting/interfaces/dataprovider/LineDataProvider;",
        "Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;",
        "Lcom/github/mikephil/charting/interfaces/dataprovider/ScatterDataProvider;",
        "Lcom/github/mikephil/charting/interfaces/dataprovider/CandleDataProvider;",
        "Lcom/github/mikephil/charting/interfaces/dataprovider/BubbleDataProvider;"
    }
.end annotation


# instance fields
.field private mDrawBarShadow:Z

.field private mDrawHighlightArrow:Z

.field protected mDrawOrder:[Lcom/github/mikephil/charting/charts/CombinedChart$DrawOrder;

.field private mDrawValueAboveBar:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 61
    invoke-direct {p0, p1}, Lcom/github/mikephil/charting/charts/BarLineChartBase;-><init>(Landroid/content/Context;)V

    .line 34
    iput-boolean v2, p0, Lcom/github/mikephil/charting/charts/CombinedChart;->mDrawHighlightArrow:Z

    .line 40
    iput-boolean v3, p0, Lcom/github/mikephil/charting/charts/CombinedChart;->mDrawValueAboveBar:Z

    .line 46
    iput-boolean v2, p0, Lcom/github/mikephil/charting/charts/CombinedChart;->mDrawBarShadow:Z

    .line 48
    const/4 v0, 0x5

    new-array v0, v0, [Lcom/github/mikephil/charting/charts/CombinedChart$DrawOrder;

    sget-object v1, Lcom/github/mikephil/charting/charts/CombinedChart$DrawOrder;->BAR:Lcom/github/mikephil/charting/charts/CombinedChart$DrawOrder;

    aput-object v1, v0, v2

    sget-object v1, Lcom/github/mikephil/charting/charts/CombinedChart$DrawOrder;->BUBBLE:Lcom/github/mikephil/charting/charts/CombinedChart$DrawOrder;

    aput-object v1, v0, v3

    const/4 v1, 0x2

    sget-object v2, Lcom/github/mikephil/charting/charts/CombinedChart$DrawOrder;->LINE:Lcom/github/mikephil/charting/charts/CombinedChart$DrawOrder;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    sget-object v2, Lcom/github/mikephil/charting/charts/CombinedChart$DrawOrder;->CANDLE:Lcom/github/mikephil/charting/charts/CombinedChart$DrawOrder;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    sget-object v2, Lcom/github/mikephil/charting/charts/CombinedChart$DrawOrder;->SCATTER:Lcom/github/mikephil/charting/charts/CombinedChart$DrawOrder;

    aput-object v2, v0, v1

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/CombinedChart;->mDrawOrder:[Lcom/github/mikephil/charting/charts/CombinedChart$DrawOrder;

    .line 62
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 65
    invoke-direct {p0, p1, p2}, Lcom/github/mikephil/charting/charts/BarLineChartBase;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 34
    iput-boolean v2, p0, Lcom/github/mikephil/charting/charts/CombinedChart;->mDrawHighlightArrow:Z

    .line 40
    iput-boolean v3, p0, Lcom/github/mikephil/charting/charts/CombinedChart;->mDrawValueAboveBar:Z

    .line 46
    iput-boolean v2, p0, Lcom/github/mikephil/charting/charts/CombinedChart;->mDrawBarShadow:Z

    .line 48
    const/4 v0, 0x5

    new-array v0, v0, [Lcom/github/mikephil/charting/charts/CombinedChart$DrawOrder;

    sget-object v1, Lcom/github/mikephil/charting/charts/CombinedChart$DrawOrder;->BAR:Lcom/github/mikephil/charting/charts/CombinedChart$DrawOrder;

    aput-object v1, v0, v2

    sget-object v1, Lcom/github/mikephil/charting/charts/CombinedChart$DrawOrder;->BUBBLE:Lcom/github/mikephil/charting/charts/CombinedChart$DrawOrder;

    aput-object v1, v0, v3

    const/4 v1, 0x2

    sget-object v2, Lcom/github/mikephil/charting/charts/CombinedChart$DrawOrder;->LINE:Lcom/github/mikephil/charting/charts/CombinedChart$DrawOrder;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    sget-object v2, Lcom/github/mikephil/charting/charts/CombinedChart$DrawOrder;->CANDLE:Lcom/github/mikephil/charting/charts/CombinedChart$DrawOrder;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    sget-object v2, Lcom/github/mikephil/charting/charts/CombinedChart$DrawOrder;->SCATTER:Lcom/github/mikephil/charting/charts/CombinedChart$DrawOrder;

    aput-object v2, v0, v1

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/CombinedChart;->mDrawOrder:[Lcom/github/mikephil/charting/charts/CombinedChart$DrawOrder;

    .line 66
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 69
    invoke-direct {p0, p1, p2, p3}, Lcom/github/mikephil/charting/charts/BarLineChartBase;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 34
    iput-boolean v2, p0, Lcom/github/mikephil/charting/charts/CombinedChart;->mDrawHighlightArrow:Z

    .line 40
    iput-boolean v3, p0, Lcom/github/mikephil/charting/charts/CombinedChart;->mDrawValueAboveBar:Z

    .line 46
    iput-boolean v2, p0, Lcom/github/mikephil/charting/charts/CombinedChart;->mDrawBarShadow:Z

    .line 48
    const/4 v0, 0x5

    new-array v0, v0, [Lcom/github/mikephil/charting/charts/CombinedChart$DrawOrder;

    sget-object v1, Lcom/github/mikephil/charting/charts/CombinedChart$DrawOrder;->BAR:Lcom/github/mikephil/charting/charts/CombinedChart$DrawOrder;

    aput-object v1, v0, v2

    sget-object v1, Lcom/github/mikephil/charting/charts/CombinedChart$DrawOrder;->BUBBLE:Lcom/github/mikephil/charting/charts/CombinedChart$DrawOrder;

    aput-object v1, v0, v3

    const/4 v1, 0x2

    sget-object v2, Lcom/github/mikephil/charting/charts/CombinedChart$DrawOrder;->LINE:Lcom/github/mikephil/charting/charts/CombinedChart$DrawOrder;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    sget-object v2, Lcom/github/mikephil/charting/charts/CombinedChart$DrawOrder;->CANDLE:Lcom/github/mikephil/charting/charts/CombinedChart$DrawOrder;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    sget-object v2, Lcom/github/mikephil/charting/charts/CombinedChart$DrawOrder;->SCATTER:Lcom/github/mikephil/charting/charts/CombinedChart$DrawOrder;

    aput-object v2, v0, v1

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/CombinedChart;->mDrawOrder:[Lcom/github/mikephil/charting/charts/CombinedChart$DrawOrder;

    .line 70
    return-void
.end method


# virtual methods
.method protected calcMinMax()V
    .registers 8

    .prologue
    .line 87
    invoke-super {p0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->calcMinMax()V

    .line 89
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/CombinedChart;->getBarData()Lcom/github/mikephil/charting/data/BarData;

    move-result-object v4

    if-nez v4, :cond_15

    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/CombinedChart;->getCandleData()Lcom/github/mikephil/charting/data/CandleData;

    move-result-object v4

    if-nez v4, :cond_15

    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/CombinedChart;->getBubbleData()Lcom/github/mikephil/charting/data/BubbleData;

    move-result-object v4

    if-eqz v4, :cond_6e

    .line 90
    :cond_15
    iget-object v4, p0, Lcom/github/mikephil/charting/charts/CombinedChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    const/high16 v5, -0x41000000    # -0.5f

    iput v5, v4, Lcom/github/mikephil/charting/components/XAxis;->mAxisMinimum:F

    .line 91
    iget-object v5, p0, Lcom/github/mikephil/charting/charts/CombinedChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget-object v4, p0, Lcom/github/mikephil/charting/charts/CombinedChart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    check-cast v4, Lcom/github/mikephil/charting/data/CombinedData;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/data/CombinedData;->getXVals()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    int-to-float v4, v4

    const/high16 v6, 0x3f000000    # 0.5f

    sub-float/2addr v4, v6

    iput v4, v5, Lcom/github/mikephil/charting/components/XAxis;->mAxisMaximum:F

    .line 93
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/CombinedChart;->getBubbleData()Lcom/github/mikephil/charting/data/BubbleData;

    move-result-object v4

    if-eqz v4, :cond_6e

    .line 95
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/CombinedChart;->getBubbleData()Lcom/github/mikephil/charting/data/BubbleData;

    move-result-object v4

    invoke-virtual {v4}, Lcom/github/mikephil/charting/data/BubbleData;->getDataSets()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_41
    :goto_41
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_6e

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;

    .line 97
    .local v1, "set":Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;
    invoke-interface {v1}, Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;->getXMin()F

    move-result v3

    .line 98
    .local v3, "xmin":F
    invoke-interface {v1}, Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;->getXMax()F

    move-result v2

    .line 100
    .local v2, "xmax":F
    iget-object v4, p0, Lcom/github/mikephil/charting/charts/CombinedChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget v4, v4, Lcom/github/mikephil/charting/components/XAxis;->mAxisMinimum:F

    cmpg-float v4, v3, v4

    if-gez v4, :cond_61

    .line 101
    iget-object v4, p0, Lcom/github/mikephil/charting/charts/CombinedChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iput v3, v4, Lcom/github/mikephil/charting/components/XAxis;->mAxisMinimum:F

    .line 103
    :cond_61
    iget-object v4, p0, Lcom/github/mikephil/charting/charts/CombinedChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget v4, v4, Lcom/github/mikephil/charting/components/XAxis;->mAxisMaximum:F

    cmpl-float v4, v2, v4

    if-lez v4, :cond_41

    .line 104
    iget-object v4, p0, Lcom/github/mikephil/charting/charts/CombinedChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iput v2, v4, Lcom/github/mikephil/charting/components/XAxis;->mAxisMaximum:F

    goto :goto_41

    .line 109
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "set":Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;
    .end local v2    # "xmax":F
    .end local v3    # "xmin":F
    :cond_6e
    iget-object v4, p0, Lcom/github/mikephil/charting/charts/CombinedChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget-object v5, p0, Lcom/github/mikephil/charting/charts/CombinedChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget v5, v5, Lcom/github/mikephil/charting/components/XAxis;->mAxisMaximum:F

    iget-object v6, p0, Lcom/github/mikephil/charting/charts/CombinedChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget v6, v6, Lcom/github/mikephil/charting/components/XAxis;->mAxisMinimum:F

    sub-float/2addr v5, v6

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    iput v5, v4, Lcom/github/mikephil/charting/components/XAxis;->mAxisRange:F

    .line 111
    iget-object v4, p0, Lcom/github/mikephil/charting/charts/CombinedChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget v4, v4, Lcom/github/mikephil/charting/components/XAxis;->mAxisRange:F

    const/4 v5, 0x0

    cmpl-float v4, v4, v5

    if-nez v4, :cond_9e

    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/CombinedChart;->getLineData()Lcom/github/mikephil/charting/data/LineData;

    move-result-object v4

    if-eqz v4, :cond_9e

    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/CombinedChart;->getLineData()Lcom/github/mikephil/charting/data/LineData;

    move-result-object v4

    invoke-virtual {v4}, Lcom/github/mikephil/charting/data/LineData;->getYValCount()I

    move-result v4

    if-lez v4, :cond_9e

    .line 112
    iget-object v4, p0, Lcom/github/mikephil/charting/charts/CombinedChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    const/high16 v5, 0x3f800000    # 1.0f

    iput v5, v4, Lcom/github/mikephil/charting/components/XAxis;->mAxisRange:F

    .line 114
    :cond_9e
    return-void
.end method

.method public getBarData()Lcom/github/mikephil/charting/data/BarData;
    .registers 2

    .prologue
    .line 134
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/CombinedChart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    if-nez v0, :cond_6

    .line 135
    const/4 v0, 0x0

    .line 136
    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/CombinedChart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    check-cast v0, Lcom/github/mikephil/charting/data/CombinedData;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/CombinedData;->getBarData()Lcom/github/mikephil/charting/data/BarData;

    move-result-object v0

    goto :goto_5
.end method

.method public getBubbleData()Lcom/github/mikephil/charting/data/BubbleData;
    .registers 2

    .prologue
    .line 155
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/CombinedChart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    if-nez v0, :cond_6

    .line 156
    const/4 v0, 0x0

    .line 157
    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/CombinedChart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    check-cast v0, Lcom/github/mikephil/charting/data/CombinedData;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/CombinedData;->getBubbleData()Lcom/github/mikephil/charting/data/BubbleData;

    move-result-object v0

    goto :goto_5
.end method

.method public getCandleData()Lcom/github/mikephil/charting/data/CandleData;
    .registers 2

    .prologue
    .line 148
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/CombinedChart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    if-nez v0, :cond_6

    .line 149
    const/4 v0, 0x0

    .line 150
    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/CombinedChart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    check-cast v0, Lcom/github/mikephil/charting/data/CombinedData;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/CombinedData;->getCandleData()Lcom/github/mikephil/charting/data/CandleData;

    move-result-object v0

    goto :goto_5
.end method

.method public getDrawOrder()[Lcom/github/mikephil/charting/charts/CombinedChart$DrawOrder;
    .registers 2

    .prologue
    .line 211
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/CombinedChart;->mDrawOrder:[Lcom/github/mikephil/charting/charts/CombinedChart$DrawOrder;

    return-object v0
.end method

.method public getLineData()Lcom/github/mikephil/charting/data/LineData;
    .registers 2

    .prologue
    .line 127
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/CombinedChart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    if-nez v0, :cond_6

    .line 128
    const/4 v0, 0x0

    .line 129
    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/CombinedChart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    check-cast v0, Lcom/github/mikephil/charting/data/CombinedData;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/CombinedData;->getLineData()Lcom/github/mikephil/charting/data/LineData;

    move-result-object v0

    goto :goto_5
.end method

.method public getScatterData()Lcom/github/mikephil/charting/data/ScatterData;
    .registers 2

    .prologue
    .line 141
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/CombinedChart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    if-nez v0, :cond_6

    .line 142
    const/4 v0, 0x0

    .line 143
    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/CombinedChart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    check-cast v0, Lcom/github/mikephil/charting/data/CombinedData;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/CombinedData;->getScatterData()Lcom/github/mikephil/charting/data/ScatterData;

    move-result-object v0

    goto :goto_5
.end method

.method protected init()V
    .registers 2

    .prologue
    .line 74
    invoke-super {p0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->init()V

    .line 76
    new-instance v0, Lcom/github/mikephil/charting/highlight/CombinedHighlighter;

    invoke-direct {v0, p0}, Lcom/github/mikephil/charting/highlight/CombinedHighlighter;-><init>(Lcom/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider;)V

    invoke-virtual {p0, v0}, Lcom/github/mikephil/charting/charts/CombinedChart;->setHighlighter(Lcom/github/mikephil/charting/highlight/ChartHighlighter;)V

    .line 79
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/github/mikephil/charting/charts/CombinedChart;->setHighlightFullBarEnabled(Z)V

    .line 83
    return-void
.end method

.method public isDrawBarShadowEnabled()Z
    .registers 2

    .prologue
    .line 162
    iget-boolean v0, p0, Lcom/github/mikephil/charting/charts/CombinedChart;->mDrawBarShadow:Z

    return v0
.end method

.method public isDrawHighlightArrowEnabled()Z
    .registers 2

    .prologue
    .line 172
    iget-boolean v0, p0, Lcom/github/mikephil/charting/charts/CombinedChart;->mDrawHighlightArrow:Z

    return v0
.end method

.method public isDrawValueAboveBarEnabled()Z
    .registers 2

    .prologue
    .line 167
    iget-boolean v0, p0, Lcom/github/mikephil/charting/charts/CombinedChart;->mDrawValueAboveBar:Z

    return v0
.end method

.method public bridge synthetic setData(Lcom/github/mikephil/charting/data/ChartData;)V
    .registers 2
    .param p1, "x0"    # Lcom/github/mikephil/charting/data/ChartData;

    .prologue
    .line 28
    check-cast p1, Lcom/github/mikephil/charting/data/CombinedData;

    .end local p1    # "x0":Lcom/github/mikephil/charting/data/ChartData;
    invoke-virtual {p0, p1}, Lcom/github/mikephil/charting/charts/CombinedChart;->setData(Lcom/github/mikephil/charting/data/CombinedData;)V

    return-void
.end method

.method public setData(Lcom/github/mikephil/charting/data/CombinedData;)V
    .registers 5
    .param p1, "data"    # Lcom/github/mikephil/charting/data/CombinedData;

    .prologue
    const/4 v0, 0x0

    .line 118
    iput-object v0, p0, Lcom/github/mikephil/charting/charts/CombinedChart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    .line 119
    iput-object v0, p0, Lcom/github/mikephil/charting/charts/CombinedChart;->mRenderer:Lcom/github/mikephil/charting/renderer/DataRenderer;

    .line 120
    invoke-super {p0, p1}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->setData(Lcom/github/mikephil/charting/data/ChartData;)V

    .line 121
    new-instance v0, Lcom/github/mikephil/charting/renderer/CombinedChartRenderer;

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/CombinedChart;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    iget-object v2, p0, Lcom/github/mikephil/charting/charts/CombinedChart;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-direct {v0, p0, v1, v2}, Lcom/github/mikephil/charting/renderer/CombinedChartRenderer;-><init>(Lcom/github/mikephil/charting/charts/CombinedChart;Lcom/github/mikephil/charting/animation/ChartAnimator;Lcom/github/mikephil/charting/utils/ViewPortHandler;)V

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/CombinedChart;->mRenderer:Lcom/github/mikephil/charting/renderer/DataRenderer;

    .line 122
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/CombinedChart;->mRenderer:Lcom/github/mikephil/charting/renderer/DataRenderer;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/renderer/DataRenderer;->initBuffers()V

    .line 123
    return-void
.end method

.method public setDrawBarShadow(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 202
    iput-boolean p1, p0, Lcom/github/mikephil/charting/charts/CombinedChart;->mDrawBarShadow:Z

    .line 203
    return-void
.end method

.method public setDrawHighlightArrow(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 181
    iput-boolean p1, p0, Lcom/github/mikephil/charting/charts/CombinedChart;->mDrawHighlightArrow:Z

    .line 182
    return-void
.end method

.method public setDrawOrder([Lcom/github/mikephil/charting/charts/CombinedChart$DrawOrder;)V
    .registers 3
    .param p1, "order"    # [Lcom/github/mikephil/charting/charts/CombinedChart$DrawOrder;

    .prologue
    .line 223
    if-eqz p1, :cond_5

    array-length v0, p1

    if-gtz v0, :cond_6

    .line 226
    :cond_5
    :goto_5
    return-void

    .line 225
    :cond_6
    iput-object p1, p0, Lcom/github/mikephil/charting/charts/CombinedChart;->mDrawOrder:[Lcom/github/mikephil/charting/charts/CombinedChart$DrawOrder;

    goto :goto_5
.end method

.method public setDrawValueAboveBar(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 191
    iput-boolean p1, p0, Lcom/github/mikephil/charting/charts/CombinedChart;->mDrawValueAboveBar:Z

    .line 192
    return-void
.end method
