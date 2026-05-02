.class public Lcom/github/mikephil/charting/charts/BubbleChart;
.super Lcom/github/mikephil/charting/charts/BarLineChartBase;
.source "BubbleChart.java"

# interfaces
.implements Lcom/github/mikephil/charting/interfaces/dataprovider/BubbleDataProvider;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/github/mikephil/charting/charts/BarLineChartBase",
        "<",
        "Lcom/github/mikephil/charting/data/BubbleData;",
        ">;",
        "Lcom/github/mikephil/charting/interfaces/dataprovider/BubbleDataProvider;"
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 23
    invoke-direct {p0, p1}, Lcom/github/mikephil/charting/charts/BarLineChartBase;-><init>(Landroid/content/Context;)V

    .line 24
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 27
    invoke-direct {p0, p1, p2}, Lcom/github/mikephil/charting/charts/BarLineChartBase;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 28
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 31
    invoke-direct {p0, p1, p2, p3}, Lcom/github/mikephil/charting/charts/BarLineChartBase;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 32
    return-void
.end method


# virtual methods
.method protected calcMinMax()V
    .registers 8

    .prologue
    .line 43
    invoke-super {p0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->calcMinMax()V

    .line 45
    iget-object v4, p0, Lcom/github/mikephil/charting/charts/BubbleChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget v4, v4, Lcom/github/mikephil/charting/components/XAxis;->mAxisRange:F

    const/4 v5, 0x0

    cmpl-float v4, v4, v5

    if-nez v4, :cond_1c

    iget-object v4, p0, Lcom/github/mikephil/charting/charts/BubbleChart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    check-cast v4, Lcom/github/mikephil/charting/data/BubbleData;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/data/BubbleData;->getYValCount()I

    move-result v4

    if-lez v4, :cond_1c

    .line 46
    iget-object v4, p0, Lcom/github/mikephil/charting/charts/BubbleChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    const/high16 v5, 0x3f800000    # 1.0f

    iput v5, v4, Lcom/github/mikephil/charting/components/XAxis;->mAxisRange:F

    .line 48
    :cond_1c
    iget-object v4, p0, Lcom/github/mikephil/charting/charts/BubbleChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    const/high16 v5, -0x41000000    # -0.5f

    iput v5, v4, Lcom/github/mikephil/charting/components/XAxis;->mAxisMinimum:F

    .line 49
    iget-object v5, p0, Lcom/github/mikephil/charting/charts/BubbleChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget-object v4, p0, Lcom/github/mikephil/charting/charts/BubbleChart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    check-cast v4, Lcom/github/mikephil/charting/data/BubbleData;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/data/BubbleData;->getXValCount()I

    move-result v4

    int-to-float v4, v4

    const/high16 v6, 0x3f000000    # 0.5f

    sub-float/2addr v4, v6

    iput v4, v5, Lcom/github/mikephil/charting/components/XAxis;->mAxisMaximum:F

    .line 51
    iget-object v4, p0, Lcom/github/mikephil/charting/charts/BubbleChart;->mRenderer:Lcom/github/mikephil/charting/renderer/DataRenderer;

    if-eqz v4, :cond_6f

    .line 52
    iget-object v4, p0, Lcom/github/mikephil/charting/charts/BubbleChart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    check-cast v4, Lcom/github/mikephil/charting/data/BubbleData;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/data/BubbleData;->getDataSets()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_42
    :goto_42
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_6f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;

    .line 54
    .local v1, "set":Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;
    invoke-interface {v1}, Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;->getXMin()F

    move-result v3

    .line 55
    .local v3, "xmin":F
    invoke-interface {v1}, Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;->getXMax()F

    move-result v2

    .line 57
    .local v2, "xmax":F
    iget-object v4, p0, Lcom/github/mikephil/charting/charts/BubbleChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget v4, v4, Lcom/github/mikephil/charting/components/XAxis;->mAxisMinimum:F

    cmpg-float v4, v3, v4

    if-gez v4, :cond_62

    .line 58
    iget-object v4, p0, Lcom/github/mikephil/charting/charts/BubbleChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iput v3, v4, Lcom/github/mikephil/charting/components/XAxis;->mAxisMinimum:F

    .line 60
    :cond_62
    iget-object v4, p0, Lcom/github/mikephil/charting/charts/BubbleChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget v4, v4, Lcom/github/mikephil/charting/components/XAxis;->mAxisMaximum:F

    cmpl-float v4, v2, v4

    if-lez v4, :cond_42

    .line 61
    iget-object v4, p0, Lcom/github/mikephil/charting/charts/BubbleChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iput v2, v4, Lcom/github/mikephil/charting/components/XAxis;->mAxisMaximum:F

    goto :goto_42

    .line 65
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "set":Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;
    .end local v2    # "xmax":F
    .end local v3    # "xmin":F
    :cond_6f
    iget-object v4, p0, Lcom/github/mikephil/charting/charts/BubbleChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget-object v5, p0, Lcom/github/mikephil/charting/charts/BubbleChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget v5, v5, Lcom/github/mikephil/charting/components/XAxis;->mAxisMaximum:F

    iget-object v6, p0, Lcom/github/mikephil/charting/charts/BubbleChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget v6, v6, Lcom/github/mikephil/charting/components/XAxis;->mAxisMinimum:F

    sub-float/2addr v5, v6

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    iput v5, v4, Lcom/github/mikephil/charting/components/XAxis;->mAxisRange:F

    .line 66
    return-void
.end method

.method public getBubbleData()Lcom/github/mikephil/charting/data/BubbleData;
    .registers 2

    .prologue
    .line 69
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BubbleChart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    check-cast v0, Lcom/github/mikephil/charting/data/BubbleData;

    return-object v0
.end method

.method protected init()V
    .registers 4

    .prologue
    .line 36
    invoke-super {p0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->init()V

    .line 38
    new-instance v0, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BubbleChart;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    iget-object v2, p0, Lcom/github/mikephil/charting/charts/BubbleChart;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-direct {v0, p0, v1, v2}, Lcom/github/mikephil/charting/renderer/BubbleChartRenderer;-><init>(Lcom/github/mikephil/charting/interfaces/dataprovider/BubbleDataProvider;Lcom/github/mikephil/charting/animation/ChartAnimator;Lcom/github/mikephil/charting/utils/ViewPortHandler;)V

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/BubbleChart;->mRenderer:Lcom/github/mikephil/charting/renderer/DataRenderer;

    .line 39
    return-void
.end method
