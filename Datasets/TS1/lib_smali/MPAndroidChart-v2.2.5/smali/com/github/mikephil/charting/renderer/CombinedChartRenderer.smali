.class public Lcom/github/mikephil/charting/renderer/CombinedChartRenderer;
.super Lcom/github/mikephil/charting/renderer/DataRenderer;
.source "CombinedChartRenderer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/github/mikephil/charting/renderer/CombinedChartRenderer$1;
    }
.end annotation


# instance fields
.field protected mChart:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/github/mikephil/charting/charts/Chart;",
            ">;"
        }
    .end annotation
.end field

.field protected mRenderers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/github/mikephil/charting/renderer/DataRenderer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/github/mikephil/charting/charts/CombinedChart;Lcom/github/mikephil/charting/animation/ChartAnimator;Lcom/github/mikephil/charting/utils/ViewPortHandler;)V
    .registers 5
    .param p1, "chart"    # Lcom/github/mikephil/charting/charts/CombinedChart;
    .param p2, "animator"    # Lcom/github/mikephil/charting/animation/ChartAnimator;
    .param p3, "viewPortHandler"    # Lcom/github/mikephil/charting/utils/ViewPortHandler;

    .prologue
    .line 32
    invoke-direct {p0, p2, p3}, Lcom/github/mikephil/charting/renderer/DataRenderer;-><init>(Lcom/github/mikephil/charting/animation/ChartAnimator;Lcom/github/mikephil/charting/utils/ViewPortHandler;)V

    .line 33
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/github/mikephil/charting/renderer/CombinedChartRenderer;->mChart:Ljava/lang/ref/WeakReference;

    .line 34
    invoke-virtual {p0, p1, p2, p3}, Lcom/github/mikephil/charting/renderer/CombinedChartRenderer;->createRenderers(Lcom/github/mikephil/charting/charts/CombinedChart;Lcom/github/mikephil/charting/animation/ChartAnimator;Lcom/github/mikephil/charting/utils/ViewPortHandler;)V

    .line 35
    return-void
.end method


# virtual methods
.method public calcXBounds(Lcom/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider;I)V
    .registers 6
    .param p1, "chart"    # Lcom/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider;
    .param p2, "xAxisModulus"    # I

    .prologue
    .line 143
    iget-object v2, p0, Lcom/github/mikephil/charting/renderer/CombinedChartRenderer;->mRenderers:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_16

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/github/mikephil/charting/renderer/DataRenderer;

    .line 144
    .local v1, "renderer":Lcom/github/mikephil/charting/renderer/DataRenderer;
    invoke-virtual {v1, p1, p2}, Lcom/github/mikephil/charting/renderer/DataRenderer;->calcXBounds(Lcom/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider;I)V

    goto :goto_6

    .line 145
    .end local v1    # "renderer":Lcom/github/mikephil/charting/renderer/DataRenderer;
    :cond_16
    return-void
.end method

.method protected createRenderers(Lcom/github/mikephil/charting/charts/CombinedChart;Lcom/github/mikephil/charting/animation/ChartAnimator;Lcom/github/mikephil/charting/utils/ViewPortHandler;)V
    .registers 11
    .param p1, "chart"    # Lcom/github/mikephil/charting/charts/CombinedChart;
    .param p2, "animator"    # Lcom/github/mikephil/charting/animation/ChartAnimator;
    .param p3, "viewPortHandler"    # Lcom/github/mikephil/charting/utils/ViewPortHandler;

    .prologue
    .line 47
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iput-object v5, p0, Lcom/github/mikephil/charting/renderer/CombinedChartRenderer;->mRenderers:Ljava/util/List;

    .line 49
    invoke-virtual {p1}, Lcom/github/mikephil/charting/charts/CombinedChart;->getDrawOrder()[Lcom/github/mikephil/charting/charts/CombinedChart$DrawOrder;

    move-result-object v4

    .line 51
    .local v4, "orders":[Lcom/github/mikephil/charting/charts/CombinedChart$DrawOrder;
    move-object v0, v4

    .local v0, "arr$":[Lcom/github/mikephil/charting/charts/CombinedChart$DrawOrder;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_e
    if-ge v1, v2, :cond_75

    aget-object v3, v0, v1

    .line 53
    .local v3, "order":Lcom/github/mikephil/charting/charts/CombinedChart$DrawOrder;
    sget-object v5, Lcom/github/mikephil/charting/renderer/CombinedChartRenderer$1;->$SwitchMap$com$github$mikephil$charting$charts$CombinedChart$DrawOrder:[I

    invoke-virtual {v3}, Lcom/github/mikephil/charting/charts/CombinedChart$DrawOrder;->ordinal()I

    move-result v6

    aget v5, v5, v6

    packed-switch v5, :pswitch_data_76

    .line 51
    :cond_1d
    :goto_1d
    add-int/lit8 v1, v1, 0x1

    goto :goto_e

    .line 55
    :pswitch_20
    invoke-virtual {p1}, Lcom/github/mikephil/charting/charts/CombinedChart;->getBarData()Lcom/github/mikephil/charting/data/BarData;

    move-result-object v5

    if-eqz v5, :cond_1d

    .line 56
    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/CombinedChartRenderer;->mRenderers:Ljava/util/List;

    new-instance v6, Lcom/github/mikephil/charting/renderer/BarChartRenderer;

    invoke-direct {v6, p1, p2, p3}, Lcom/github/mikephil/charting/renderer/BarChartRenderer;-><init>(Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;Lcom/github/mikephil/charting/animation/ChartAnimator;Lcom/github/mikephil/charting/utils/ViewPortHandler;)V

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1d

    .line 59
    :pswitch_31
    invoke-virtual {p1}, Lcom/github/mikephil/charting/charts/CombinedChart;->getBubbleData()Lcom/github/mikephil/charting/data/BubbleData;

    move-result-object v5

    if-eqz v5, :cond_1d

    .line 60
    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/CombinedChartRenderer;->mRenderers:Ljava/util/List;

    new-instance v6, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;

    invoke-direct {v6, p1, p2, p3}, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;-><init>(Lcom/github/mikephil/charting/interfaces/dataprovider/BubbleDataProvider;Lcom/github/mikephil/charting/animation/ChartAnimator;Lcom/github/mikephil/charting/utils/ViewPortHandler;)V

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1d

    .line 63
    :pswitch_42
    invoke-virtual {p1}, Lcom/github/mikephil/charting/charts/CombinedChart;->getLineData()Lcom/github/mikephil/charting/data/LineData;

    move-result-object v5

    if-eqz v5, :cond_1d

    .line 64
    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/CombinedChartRenderer;->mRenderers:Ljava/util/List;

    new-instance v6, Lcom/github/mikephil/charting/renderer/LineChartRenderer;

    invoke-direct {v6, p1, p2, p3}, Lcom/github/mikephil/charting/renderer/LineChartRenderer;-><init>(Lcom/github/mikephil/charting/interfaces/dataprovider/LineDataProvider;Lcom/github/mikephil/charting/animation/ChartAnimator;Lcom/github/mikephil/charting/utils/ViewPortHandler;)V

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1d

    .line 67
    :pswitch_53
    invoke-virtual {p1}, Lcom/github/mikephil/charting/charts/CombinedChart;->getCandleData()Lcom/github/mikephil/charting/data/CandleData;

    move-result-object v5

    if-eqz v5, :cond_1d

    .line 68
    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/CombinedChartRenderer;->mRenderers:Ljava/util/List;

    new-instance v6, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;

    invoke-direct {v6, p1, p2, p3}, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;-><init>(Lcom/github/mikephil/charting/interfaces/dataprovider/CandleDataProvider;Lcom/github/mikephil/charting/animation/ChartAnimator;Lcom/github/mikephil/charting/utils/ViewPortHandler;)V

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1d

    .line 71
    :pswitch_64
    invoke-virtual {p1}, Lcom/github/mikephil/charting/charts/CombinedChart;->getScatterData()Lcom/github/mikephil/charting/data/ScatterData;

    move-result-object v5

    if-eqz v5, :cond_1d

    .line 72
    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/CombinedChartRenderer;->mRenderers:Ljava/util/List;

    new-instance v6, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;

    invoke-direct {v6, p1, p2, p3}, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;-><init>(Lcom/github/mikephil/charting/interfaces/dataprovider/ScatterDataProvider;Lcom/github/mikephil/charting/animation/ChartAnimator;Lcom/github/mikephil/charting/utils/ViewPortHandler;)V

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1d

    .line 76
    .end local v3    # "order":Lcom/github/mikephil/charting/charts/CombinedChart$DrawOrder;
    :cond_75
    return-void

    .line 53
    :pswitch_data_76
    .packed-switch 0x1
        :pswitch_20
        :pswitch_31
        :pswitch_42
        :pswitch_53
        :pswitch_64
    .end packed-switch
.end method

.method public drawData(Landroid/graphics/Canvas;)V
    .registers 5
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    .line 88
    iget-object v2, p0, Lcom/github/mikephil/charting/renderer/CombinedChartRenderer;->mRenderers:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_16

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/github/mikephil/charting/renderer/DataRenderer;

    .line 89
    .local v1, "renderer":Lcom/github/mikephil/charting/renderer/DataRenderer;
    invoke-virtual {v1, p1}, Lcom/github/mikephil/charting/renderer/DataRenderer;->drawData(Landroid/graphics/Canvas;)V

    goto :goto_6

    .line 90
    .end local v1    # "renderer":Lcom/github/mikephil/charting/renderer/DataRenderer;
    :cond_16
    return-void
.end method

.method public drawExtras(Landroid/graphics/Canvas;)V
    .registers 5
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    .line 102
    iget-object v2, p0, Lcom/github/mikephil/charting/renderer/CombinedChartRenderer;->mRenderers:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_16

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/github/mikephil/charting/renderer/DataRenderer;

    .line 103
    .local v1, "renderer":Lcom/github/mikephil/charting/renderer/DataRenderer;
    invoke-virtual {v1, p1}, Lcom/github/mikephil/charting/renderer/DataRenderer;->drawExtras(Landroid/graphics/Canvas;)V

    goto :goto_6

    .line 104
    .end local v1    # "renderer":Lcom/github/mikephil/charting/renderer/DataRenderer;
    :cond_16
    return-void
.end method

.method public drawHighlighted(Landroid/graphics/Canvas;[Lcom/github/mikephil/charting/highlight/Highlight;)V
    .registers 15
    .param p1, "c"    # Landroid/graphics/Canvas;
    .param p2, "indices"    # [Lcom/github/mikephil/charting/highlight/Highlight;

    .prologue
    const/4 v11, -0x1

    .line 109
    iget-object v10, p0, Lcom/github/mikephil/charting/renderer/CombinedChartRenderer;->mChart:Ljava/lang/ref/WeakReference;

    invoke-virtual {v10}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/github/mikephil/charting/charts/Chart;

    .line 110
    .local v1, "chart":Lcom/github/mikephil/charting/charts/Chart;
    if-nez v1, :cond_c

    .line 139
    :cond_b
    return-void

    .line 112
    :cond_c
    iget-object v10, p0, Lcom/github/mikephil/charting/renderer/CombinedChartRenderer;->mRenderers:Ljava/util/List;

    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_12
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_b

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/github/mikephil/charting/renderer/DataRenderer;

    .line 113
    .local v9, "renderer":Lcom/github/mikephil/charting/renderer/DataRenderer;
    const/4 v2, 0x0

    .line 115
    .local v2, "data":Lcom/github/mikephil/charting/data/ChartData;
    instance-of v10, v9, Lcom/github/mikephil/charting/renderer/BarChartRenderer;

    if-eqz v10, :cond_4d

    move-object v10, v9

    .line 116
    check-cast v10, Lcom/github/mikephil/charting/renderer/BarChartRenderer;

    iget-object v10, v10, Lcom/github/mikephil/charting/renderer/BarChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;

    invoke-interface {v10}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarDataProvider;->getBarData()Lcom/github/mikephil/charting/data/BarData;

    move-result-object v2

    .line 126
    :cond_2c
    :goto_2c
    if-nez v2, :cond_85

    move v3, v11

    .line 130
    .local v3, "dataIndex":I
    :goto_2f
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 131
    .local v4, "dataIndices":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/github/mikephil/charting/highlight/Highlight;>;"
    move-object v0, p2

    .local v0, "arr$":[Lcom/github/mikephil/charting/highlight/Highlight;
    array-length v8, v0

    .local v8, "len$":I
    const/4 v7, 0x0

    .local v7, "i$":I
    :goto_37
    if-ge v7, v8, :cond_94

    aget-object v5, v0, v7

    .line 132
    .local v5, "h":Lcom/github/mikephil/charting/highlight/Highlight;
    invoke-virtual {v5}, Lcom/github/mikephil/charting/highlight/Highlight;->getDataIndex()I

    move-result v10

    if-eq v10, v3, :cond_47

    invoke-virtual {v5}, Lcom/github/mikephil/charting/highlight/Highlight;->getDataIndex()I

    move-result v10

    if-ne v10, v11, :cond_4a

    .line 133
    :cond_47
    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 131
    :cond_4a
    add-int/lit8 v7, v7, 0x1

    goto :goto_37

    .line 117
    .end local v0    # "arr$":[Lcom/github/mikephil/charting/highlight/Highlight;
    .end local v3    # "dataIndex":I
    .end local v4    # "dataIndices":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/github/mikephil/charting/highlight/Highlight;>;"
    .end local v5    # "h":Lcom/github/mikephil/charting/highlight/Highlight;
    .end local v7    # "i$":I
    .end local v8    # "len$":I
    :cond_4d
    instance-of v10, v9, Lcom/github/mikephil/charting/renderer/LineChartRenderer;

    if-eqz v10, :cond_5b

    move-object v10, v9

    .line 118
    check-cast v10, Lcom/github/mikephil/charting/renderer/LineChartRenderer;

    iget-object v10, v10, Lcom/github/mikephil/charting/renderer/LineChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/LineDataProvider;

    invoke-interface {v10}, Lcom/github/mikephil/charting/interfaces/dataprovider/LineDataProvider;->getLineData()Lcom/github/mikephil/charting/data/LineData;

    move-result-object v2

    goto :goto_2c

    .line 119
    :cond_5b
    instance-of v10, v9, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;

    if-eqz v10, :cond_69

    move-object v10, v9

    .line 120
    check-cast v10, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;

    iget-object v10, v10, Lcom/github/mikephil/charting/renderer/CandleStickChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/CandleDataProvider;

    invoke-interface {v10}, Lcom/github/mikephil/charting/interfaces/dataprovider/CandleDataProvider;->getCandleData()Lcom/github/mikephil/charting/data/CandleData;

    move-result-object v2

    goto :goto_2c

    .line 121
    :cond_69
    instance-of v10, v9, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;

    if-eqz v10, :cond_77

    move-object v10, v9

    .line 122
    check-cast v10, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;

    iget-object v10, v10, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/ScatterDataProvider;

    invoke-interface {v10}, Lcom/github/mikephil/charting/interfaces/dataprovider/ScatterDataProvider;->getScatterData()Lcom/github/mikephil/charting/data/ScatterData;

    move-result-object v2

    goto :goto_2c

    .line 123
    :cond_77
    instance-of v10, v9, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;

    if-eqz v10, :cond_2c

    move-object v10, v9

    .line 124
    check-cast v10, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;

    iget-object v10, v10, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;->mChart:Lcom/github/mikephil/charting/interfaces/dataprovider/BubbleDataProvider;

    invoke-interface {v10}, Lcom/github/mikephil/charting/interfaces/dataprovider/BubbleDataProvider;->getBubbleData()Lcom/github/mikephil/charting/data/BubbleData;

    move-result-object v2

    goto :goto_2c

    .line 126
    :cond_85
    invoke-virtual {v1}, Lcom/github/mikephil/charting/charts/Chart;->getData()Lcom/github/mikephil/charting/data/ChartData;

    move-result-object v10

    check-cast v10, Lcom/github/mikephil/charting/data/CombinedData;

    invoke-virtual {v10}, Lcom/github/mikephil/charting/data/CombinedData;->getAllData()Ljava/util/List;

    move-result-object v10

    invoke-interface {v10, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v3

    goto :goto_2f

    .line 136
    .restart local v0    # "arr$":[Lcom/github/mikephil/charting/highlight/Highlight;
    .restart local v3    # "dataIndex":I
    .restart local v4    # "dataIndices":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/github/mikephil/charting/highlight/Highlight;>;"
    .restart local v7    # "i$":I
    .restart local v8    # "len$":I
    :cond_94
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v10

    new-array v10, v10, [Lcom/github/mikephil/charting/highlight/Highlight;

    invoke-virtual {v4, v10}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v10

    check-cast v10, [Lcom/github/mikephil/charting/highlight/Highlight;

    invoke-virtual {v9, p1, v10}, Lcom/github/mikephil/charting/renderer/DataRenderer;->drawHighlighted(Landroid/graphics/Canvas;[Lcom/github/mikephil/charting/highlight/Highlight;)V

    goto/16 :goto_12
.end method

.method public drawValues(Landroid/graphics/Canvas;)V
    .registers 5
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    .line 95
    iget-object v2, p0, Lcom/github/mikephil/charting/renderer/CombinedChartRenderer;->mRenderers:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_16

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/github/mikephil/charting/renderer/DataRenderer;

    .line 96
    .local v1, "renderer":Lcom/github/mikephil/charting/renderer/DataRenderer;
    invoke-virtual {v1, p1}, Lcom/github/mikephil/charting/renderer/DataRenderer;->drawValues(Landroid/graphics/Canvas;)V

    goto :goto_6

    .line 97
    .end local v1    # "renderer":Lcom/github/mikephil/charting/renderer/DataRenderer;
    :cond_16
    return-void
.end method

.method public getSubRenderer(I)Lcom/github/mikephil/charting/renderer/DataRenderer;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 154
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/CombinedChartRenderer;->mRenderers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge p1, v0, :cond_a

    if-gez p1, :cond_c

    .line 155
    :cond_a
    const/4 v0, 0x0

    .line 157
    :goto_b
    return-object v0

    :cond_c
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/CombinedChartRenderer;->mRenderers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/github/mikephil/charting/renderer/DataRenderer;

    goto :goto_b
.end method

.method public getSubRenderers()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/github/mikephil/charting/renderer/DataRenderer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 166
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/CombinedChartRenderer;->mRenderers:Ljava/util/List;

    return-object v0
.end method

.method public initBuffers()V
    .registers 4

    .prologue
    .line 81
    iget-object v2, p0, Lcom/github/mikephil/charting/renderer/CombinedChartRenderer;->mRenderers:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_16

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/github/mikephil/charting/renderer/DataRenderer;

    .line 82
    .local v1, "renderer":Lcom/github/mikephil/charting/renderer/DataRenderer;
    invoke-virtual {v1}, Lcom/github/mikephil/charting/renderer/DataRenderer;->initBuffers()V

    goto :goto_6

    .line 83
    .end local v1    # "renderer":Lcom/github/mikephil/charting/renderer/DataRenderer;
    :cond_16
    return-void
.end method

.method public setSubRenderers(Ljava/util/List;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/github/mikephil/charting/renderer/DataRenderer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 170
    .local p1, "renderers":Ljava/util/List;, "Ljava/util/List<Lcom/github/mikephil/charting/renderer/DataRenderer;>;"
    iput-object p1, p0, Lcom/github/mikephil/charting/renderer/CombinedChartRenderer;->mRenderers:Ljava/util/List;

    .line 171
    return-void
.end method
