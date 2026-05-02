.class public Lcom/github/mikephil/charting/charts/ScatterChart;
.super Lcom/github/mikephil/charting/charts/BarLineChartBase;
.source "ScatterChart.java"

# interfaces
.implements Lcom/github/mikephil/charting/interfaces/dataprovider/ScatterDataProvider;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/github/mikephil/charting/charts/ScatterChart$ScatterShape;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/github/mikephil/charting/charts/BarLineChartBase",
        "<",
        "Lcom/github/mikephil/charting/data/ScatterData;",
        ">;",
        "Lcom/github/mikephil/charting/interfaces/dataprovider/ScatterDataProvider;"
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 28
    invoke-direct {p0, p1}, Lcom/github/mikephil/charting/charts/BarLineChartBase;-><init>(Landroid/content/Context;)V

    .line 29
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 32
    invoke-direct {p0, p1, p2}, Lcom/github/mikephil/charting/charts/BarLineChartBase;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 33
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 36
    invoke-direct {p0, p1, p2, p3}, Lcom/github/mikephil/charting/charts/BarLineChartBase;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 37
    return-void
.end method

.method public static getAllPossibleShapes()[Lcom/github/mikephil/charting/charts/ScatterChart$ScatterShape;
    .registers 3

    .prologue
    .line 64
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/github/mikephil/charting/charts/ScatterChart$ScatterShape;

    const/4 v1, 0x0

    sget-object v2, Lcom/github/mikephil/charting/charts/ScatterChart$ScatterShape;->SQUARE:Lcom/github/mikephil/charting/charts/ScatterChart$ScatterShape;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lcom/github/mikephil/charting/charts/ScatterChart$ScatterShape;->CIRCLE:Lcom/github/mikephil/charting/charts/ScatterChart$ScatterShape;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    sget-object v2, Lcom/github/mikephil/charting/charts/ScatterChart$ScatterShape;->TRIANGLE:Lcom/github/mikephil/charting/charts/ScatterChart$ScatterShape;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    sget-object v2, Lcom/github/mikephil/charting/charts/ScatterChart$ScatterShape;->CROSS:Lcom/github/mikephil/charting/charts/ScatterChart$ScatterShape;

    aput-object v2, v0, v1

    return-object v0
.end method


# virtual methods
.method protected calcMinMax()V
    .registers 4

    .prologue
    .line 49
    invoke-super {p0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->calcMinMax()V

    .line 51
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/ScatterChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget v0, v0, Lcom/github/mikephil/charting/components/XAxis;->mAxisRange:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-nez v0, :cond_1c

    iget-object v0, p0, Lcom/github/mikephil/charting/charts/ScatterChart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    check-cast v0, Lcom/github/mikephil/charting/data/ScatterData;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/ScatterData;->getYValCount()I

    move-result v0

    if-lez v0, :cond_1c

    .line 52
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/ScatterChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    const/high16 v1, 0x3f800000    # 1.0f

    iput v1, v0, Lcom/github/mikephil/charting/components/XAxis;->mAxisRange:F

    .line 54
    :cond_1c
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/ScatterChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget v1, v0, Lcom/github/mikephil/charting/components/XAxis;->mAxisMaximum:F

    const/high16 v2, 0x3f000000    # 0.5f

    add-float/2addr v1, v2

    iput v1, v0, Lcom/github/mikephil/charting/components/XAxis;->mAxisMaximum:F

    .line 55
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/ScatterChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/ScatterChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget v1, v1, Lcom/github/mikephil/charting/components/XAxis;->mAxisMaximum:F

    iget-object v2, p0, Lcom/github/mikephil/charting/charts/ScatterChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget v2, v2, Lcom/github/mikephil/charting/components/XAxis;->mAxisMinimum:F

    sub-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    iput v1, v0, Lcom/github/mikephil/charting/components/XAxis;->mAxisRange:F

    .line 56
    return-void
.end method

.method public getScatterData()Lcom/github/mikephil/charting/data/ScatterData;
    .registers 2

    .prologue
    .line 70
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/ScatterChart;->mData:Lcom/github/mikephil/charting/data/ChartData;

    check-cast v0, Lcom/github/mikephil/charting/data/ScatterData;

    return-object v0
.end method

.method protected init()V
    .registers 4

    .prologue
    .line 41
    invoke-super {p0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->init()V

    .line 43
    new-instance v0, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/ScatterChart;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    iget-object v2, p0, Lcom/github/mikephil/charting/charts/ScatterChart;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-direct {v0, p0, v1, v2}, Lcom/github/mikephil/charting/renderer/ScatterChartRenderer;-><init>(Lcom/github/mikephil/charting/interfaces/dataprovider/ScatterDataProvider;Lcom/github/mikephil/charting/animation/ChartAnimator;Lcom/github/mikephil/charting/utils/ViewPortHandler;)V

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/ScatterChart;->mRenderer:Lcom/github/mikephil/charting/renderer/DataRenderer;

    .line 44
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/ScatterChart;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    const/high16 v1, -0x41000000    # -0.5f

    iput v1, v0, Lcom/github/mikephil/charting/components/XAxis;->mAxisMinimum:F

    .line 45
    return-void
.end method
