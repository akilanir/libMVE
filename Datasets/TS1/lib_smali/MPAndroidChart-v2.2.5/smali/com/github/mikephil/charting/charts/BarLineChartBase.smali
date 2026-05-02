.class public abstract Lcom/github/mikephil/charting/charts/BarLineChartBase;
.super Lcom/github/mikephil/charting/charts/Chart;
.source "BarLineChartBase.java"

# interfaces
.implements Lcom/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider;


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "RtlHardcoded"
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/github/mikephil/charting/charts/BarLineChartBase$2;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData",
        "<+",
        "Lcom/github/mikephil/charting/interfaces/datasets/IBarLineScatterCandleBubbleDataSet",
        "<+",
        "Lcom/github/mikephil/charting/data/Entry;",
        ">;>;>",
        "Lcom/github/mikephil/charting/charts/Chart",
        "<TT;>;",
        "Lcom/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider;"
    }
.end annotation


# instance fields
.field private drawCycles:J

.field private mAutoScaleLastHighestVisibleXIndex:Ljava/lang/Integer;

.field private mAutoScaleLastLowestVisibleXIndex:Ljava/lang/Integer;

.field private mAutoScaleMinMaxEnabled:Z

.field protected mAxisLeft:Lcom/github/mikephil/charting/components/YAxis;

.field protected mAxisRendererLeft:Lcom/github/mikephil/charting/renderer/YAxisRenderer;

.field protected mAxisRendererRight:Lcom/github/mikephil/charting/renderer/YAxisRenderer;

.field protected mAxisRight:Lcom/github/mikephil/charting/components/YAxis;

.field protected mBorderPaint:Landroid/graphics/Paint;

.field private mCustomViewPortEnabled:Z

.field protected mDoubleTapToZoomEnabled:Z

.field private mDragEnabled:Z

.field protected mDrawBorders:Z

.field protected mDrawGridBackground:Z

.field protected mDrawListener:Lcom/github/mikephil/charting/listener/OnDrawListener;

.field protected mGridBackgroundPaint:Landroid/graphics/Paint;

.field protected mHighlightFullBarEnabled:Z

.field protected mHighlightPerDragEnabled:Z

.field protected mKeepPositionOnRotation:Z

.field protected mLeftAxisTransformer:Lcom/github/mikephil/charting/utils/Transformer;

.field protected mMaxVisibleCount:I

.field protected mMinOffset:F

.field private mOffsetsBuffer:Landroid/graphics/RectF;

.field protected mPinchZoomEnabled:Z

.field protected mRightAxisTransformer:Lcom/github/mikephil/charting/utils/Transformer;

.field private mScaleXEnabled:Z

.field private mScaleYEnabled:Z

.field protected mXAxisRenderer:Lcom/github/mikephil/charting/renderer/XAxisRenderer;

.field private totalTime:J


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    const-wide/16 v4, 0x0

    const/4 v3, 0x0

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 155
    invoke-direct {p0, p1}, Lcom/github/mikephil/charting/charts/Chart;-><init>(Landroid/content/Context;)V

    .line 56
    const/16 v0, 0x64

    iput v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mMaxVisibleCount:I

    .line 61
    iput-boolean v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAutoScaleMinMaxEnabled:Z

    .line 62
    iput-object v3, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAutoScaleLastLowestVisibleXIndex:Ljava/lang/Integer;

    .line 63
    iput-object v3, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAutoScaleLastHighestVisibleXIndex:Ljava/lang/Integer;

    .line 70
    iput-boolean v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mPinchZoomEnabled:Z

    .line 75
    iput-boolean v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mDoubleTapToZoomEnabled:Z

    .line 81
    iput-boolean v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mHighlightPerDragEnabled:Z

    .line 86
    iput-boolean v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mHighlightFullBarEnabled:Z

    .line 91
    iput-boolean v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mDragEnabled:Z

    .line 93
    iput-boolean v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mScaleXEnabled:Z

    .line 94
    iput-boolean v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mScaleYEnabled:Z

    .line 106
    iput-boolean v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mDrawGridBackground:Z

    .line 108
    iput-boolean v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mDrawBorders:Z

    .line 113
    const/high16 v0, 0x41700000    # 15.0f

    iput v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mMinOffset:F

    .line 118
    iput-boolean v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mKeepPositionOnRotation:Z

    .line 190
    iput-wide v4, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->totalTime:J

    .line 191
    iput-wide v4, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->drawCycles:J

    .line 456
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mOffsetsBuffer:Landroid/graphics/RectF;

    .line 978
    iput-boolean v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mCustomViewPortEnabled:Z

    .line 156
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    const-wide/16 v4, 0x0

    const/4 v3, 0x0

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 151
    invoke-direct {p0, p1, p2}, Lcom/github/mikephil/charting/charts/Chart;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 56
    const/16 v0, 0x64

    iput v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mMaxVisibleCount:I

    .line 61
    iput-boolean v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAutoScaleMinMaxEnabled:Z

    .line 62
    iput-object v3, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAutoScaleLastLowestVisibleXIndex:Ljava/lang/Integer;

    .line 63
    iput-object v3, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAutoScaleLastHighestVisibleXIndex:Ljava/lang/Integer;

    .line 70
    iput-boolean v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mPinchZoomEnabled:Z

    .line 75
    iput-boolean v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mDoubleTapToZoomEnabled:Z

    .line 81
    iput-boolean v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mHighlightPerDragEnabled:Z

    .line 86
    iput-boolean v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mHighlightFullBarEnabled:Z

    .line 91
    iput-boolean v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mDragEnabled:Z

    .line 93
    iput-boolean v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mScaleXEnabled:Z

    .line 94
    iput-boolean v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mScaleYEnabled:Z

    .line 106
    iput-boolean v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mDrawGridBackground:Z

    .line 108
    iput-boolean v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mDrawBorders:Z

    .line 113
    const/high16 v0, 0x41700000    # 15.0f

    iput v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mMinOffset:F

    .line 118
    iput-boolean v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mKeepPositionOnRotation:Z

    .line 190
    iput-wide v4, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->totalTime:J

    .line 191
    iput-wide v4, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->drawCycles:J

    .line 456
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mOffsetsBuffer:Landroid/graphics/RectF;

    .line 978
    iput-boolean v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mCustomViewPortEnabled:Z

    .line 152
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 10
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    const-wide/16 v4, 0x0

    const/4 v3, 0x0

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 147
    invoke-direct {p0, p1, p2, p3}, Lcom/github/mikephil/charting/charts/Chart;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 56
    const/16 v0, 0x64

    iput v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mMaxVisibleCount:I

    .line 61
    iput-boolean v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAutoScaleMinMaxEnabled:Z

    .line 62
    iput-object v3, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAutoScaleLastLowestVisibleXIndex:Ljava/lang/Integer;

    .line 63
    iput-object v3, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAutoScaleLastHighestVisibleXIndex:Ljava/lang/Integer;

    .line 70
    iput-boolean v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mPinchZoomEnabled:Z

    .line 75
    iput-boolean v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mDoubleTapToZoomEnabled:Z

    .line 81
    iput-boolean v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mHighlightPerDragEnabled:Z

    .line 86
    iput-boolean v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mHighlightFullBarEnabled:Z

    .line 91
    iput-boolean v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mDragEnabled:Z

    .line 93
    iput-boolean v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mScaleXEnabled:Z

    .line 94
    iput-boolean v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mScaleYEnabled:Z

    .line 106
    iput-boolean v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mDrawGridBackground:Z

    .line 108
    iput-boolean v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mDrawBorders:Z

    .line 113
    const/high16 v0, 0x41700000    # 15.0f

    iput v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mMinOffset:F

    .line 118
    iput-boolean v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mKeepPositionOnRotation:Z

    .line 190
    iput-wide v4, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->totalTime:J

    .line 191
    iput-wide v4, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->drawCycles:J

    .line 456
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mOffsetsBuffer:Landroid/graphics/RectF;

    .line 978
    iput-boolean v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mCustomViewPortEnabled:Z

    .line 148
    return-void
.end method


# virtual methods
.method protected calcMinMax()V
    .registers 5

    .prologue
    .line 361
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iget-boolean v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAutoScaleMinMaxEnabled:Z

    if-eqz v0, :cond_13

    .line 362
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mData:Lcom/github/mikephil/charting/data/ChartData;

    check-cast v0, Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;

    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getLowestVisibleXIndex()I

    move-result v1

    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getHighestVisibleXIndex()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;->calcMinMax(II)V

    .line 365
    :cond_13
    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mData:Lcom/github/mikephil/charting/data/ChartData;

    check-cast v0, Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;->getXVals()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    int-to-float v0, v0

    iput v0, v1, Lcom/github/mikephil/charting/components/XAxis;->mAxisMaximum:F

    .line 366
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget v1, v1, Lcom/github/mikephil/charting/components/XAxis;->mAxisMaximum:F

    iget-object v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget v2, v2, Lcom/github/mikephil/charting/components/XAxis;->mAxisMinimum:F

    sub-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    iput v1, v0, Lcom/github/mikephil/charting/components/XAxis;->mAxisRange:F

    .line 369
    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisLeft:Lcom/github/mikephil/charting/components/YAxis;

    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mData:Lcom/github/mikephil/charting/data/ChartData;

    check-cast v0, Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;

    sget-object v2, Lcom/github/mikephil/charting/components/YAxis$AxisDependency;->LEFT:Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    invoke-virtual {v0, v2}, Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;->getYMin(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)F

    move-result v2

    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mData:Lcom/github/mikephil/charting/data/ChartData;

    check-cast v0, Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;

    sget-object v3, Lcom/github/mikephil/charting/components/YAxis$AxisDependency;->LEFT:Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    invoke-virtual {v0, v3}, Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;->getYMax(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)F

    move-result v0

    invoke-virtual {v1, v2, v0}, Lcom/github/mikephil/charting/components/YAxis;->calculate(FF)V

    .line 370
    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisRight:Lcom/github/mikephil/charting/components/YAxis;

    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mData:Lcom/github/mikephil/charting/data/ChartData;

    check-cast v0, Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;

    sget-object v2, Lcom/github/mikephil/charting/components/YAxis$AxisDependency;->RIGHT:Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    invoke-virtual {v0, v2}, Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;->getYMin(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)F

    move-result v2

    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mData:Lcom/github/mikephil/charting/data/ChartData;

    check-cast v0, Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;

    sget-object v3, Lcom/github/mikephil/charting/components/YAxis$AxisDependency;->RIGHT:Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    invoke-virtual {v0, v3}, Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;->getYMax(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)F

    move-result v0

    invoke-virtual {v1, v2, v0}, Lcom/github/mikephil/charting/components/YAxis;->calculate(FF)V

    .line 372
    return-void
.end method

.method protected calcModulus()V
    .registers 7

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    const/4 v5, 0x1

    .line 532
    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    if-eqz v1, :cond_d

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/components/XAxis;->isEnabled()Z

    move-result v1

    if-nez v1, :cond_e

    .line 554
    :cond_d
    :goto_d
    return-void

    .line 535
    :cond_e
    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/components/XAxis;->isAxisModulusCustom()Z

    move-result v1

    if-nez v1, :cond_46

    .line 537
    const/16 v1, 0x9

    new-array v0, v1, [F

    .line 538
    .local v0, "values":[F
    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getMatrixTouch()Landroid/graphics/Matrix;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/graphics/Matrix;->getValues([F)V

    .line 540
    iget-object v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mData:Lcom/github/mikephil/charting/data/ChartData;

    check-cast v1, Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;->getXValCount()I

    move-result v1

    iget-object v3, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget v3, v3, Lcom/github/mikephil/charting/components/XAxis;->mLabelRotatedWidth:I

    mul-int/2addr v1, v3

    int-to-float v1, v1

    iget-object v3, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentWidth()F

    move-result v3

    const/4 v4, 0x0

    aget v4, v0, v4

    mul-float/2addr v3, v4

    div-float/2addr v1, v3

    float-to-double v3, v1

    invoke-static {v3, v4}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v3

    double-to-int v1, v3

    iput v1, v2, Lcom/github/mikephil/charting/components/XAxis;->mAxisLabelModulus:I

    .line 546
    .end local v0    # "values":[F
    :cond_46
    iget-boolean v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mLogEnabled:Z

    if-eqz v1, :cond_92

    .line 547
    const-string v1, "MPAndroidChart"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "X-Axis modulus: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget v3, v3, Lcom/github/mikephil/charting/components/XAxis;->mAxisLabelModulus:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", x-axis label width: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget v3, v3, Lcom/github/mikephil/charting/components/XAxis;->mLabelWidth:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", x-axis label rotated width: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget v3, v3, Lcom/github/mikephil/charting/components/XAxis;->mLabelRotatedWidth:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", content width: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentWidth()F

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 552
    :cond_92
    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget v1, v1, Lcom/github/mikephil/charting/components/XAxis;->mAxisLabelModulus:I

    if-ge v1, v5, :cond_d

    .line 553
    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iput v5, v1, Lcom/github/mikephil/charting/components/XAxis;->mAxisLabelModulus:I

    goto/16 :goto_d
.end method

.method protected calculateLegendOffsets(Landroid/graphics/RectF;)V
    .registers 6
    .param p1, "offsets"    # Landroid/graphics/RectF;

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    const/4 v0, 0x0

    .line 376
    iput v0, p1, Landroid/graphics/RectF;->left:F

    .line 377
    iput v0, p1, Landroid/graphics/RectF;->right:F

    .line 378
    iput v0, p1, Landroid/graphics/RectF;->top:F

    .line 379
    iput v0, p1, Landroid/graphics/RectF;->bottom:F

    .line 382
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    if-eqz v0, :cond_2e

    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/components/Legend;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_2e

    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/components/Legend;->isDrawInsideEnabled()Z

    move-result v0

    if-nez v0, :cond_2e

    .line 383
    sget-object v0, Lcom/github/mikephil/charting/charts/BarLineChartBase$2;->$SwitchMap$com$github$mikephil$charting$components$Legend$LegendOrientation:[I

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/components/Legend;->getOrientation()Lcom/github/mikephil/charting/components/Legend$LegendOrientation;

    move-result-object v1

    invoke-virtual {v1}, Lcom/github/mikephil/charting/components/Legend$LegendOrientation;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_1b6

    .line 454
    :cond_2e
    :goto_2e
    return-void

    .line 386
    :pswitch_2f
    sget-object v0, Lcom/github/mikephil/charting/charts/BarLineChartBase$2;->$SwitchMap$com$github$mikephil$charting$components$Legend$LegendHorizontalAlignment:[I

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/components/Legend;->getHorizontalAlignment()Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;

    move-result-object v1

    invoke-virtual {v1}, Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_1be

    goto :goto_2e

    .line 388
    :pswitch_41
    iget v0, p1, Landroid/graphics/RectF;->left:F

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    iget v1, v1, Lcom/github/mikephil/charting/components/Legend;->mNeededWidth:F

    iget-object v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getChartWidth()F

    move-result v2

    iget-object v3, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/components/Legend;->getMaxSizePercent()F

    move-result v3

    mul-float/2addr v2, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    move-result v1

    iget-object v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/components/Legend;->getXOffset()F

    move-result v2

    add-float/2addr v1, v2

    add-float/2addr v0, v1

    iput v0, p1, Landroid/graphics/RectF;->left:F

    goto :goto_2e

    .line 394
    :pswitch_63
    iget v0, p1, Landroid/graphics/RectF;->right:F

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    iget v1, v1, Lcom/github/mikephil/charting/components/Legend;->mNeededWidth:F

    iget-object v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getChartWidth()F

    move-result v2

    iget-object v3, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/components/Legend;->getMaxSizePercent()F

    move-result v3

    mul-float/2addr v2, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    move-result v1

    iget-object v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/components/Legend;->getXOffset()F

    move-result v2

    add-float/2addr v1, v2

    add-float/2addr v0, v1

    iput v0, p1, Landroid/graphics/RectF;->right:F

    goto :goto_2e

    .line 401
    :pswitch_85
    sget-object v0, Lcom/github/mikephil/charting/charts/BarLineChartBase$2;->$SwitchMap$com$github$mikephil$charting$components$Legend$LegendVerticalAlignment:[I

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/components/Legend;->getVerticalAlignment()Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;

    move-result-object v1

    invoke-virtual {v1}, Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_1c8

    goto :goto_2e

    .line 403
    :pswitch_97
    iget v0, p1, Landroid/graphics/RectF;->top:F

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    iget v1, v1, Lcom/github/mikephil/charting/components/Legend;->mNeededHeight:F

    iget-object v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getChartHeight()F

    move-result v2

    iget-object v3, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/components/Legend;->getMaxSizePercent()F

    move-result v3

    mul-float/2addr v2, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    move-result v1

    iget-object v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/components/Legend;->getYOffset()F

    move-result v2

    add-float/2addr v1, v2

    add-float/2addr v0, v1

    iput v0, p1, Landroid/graphics/RectF;->top:F

    .line 407
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getXAxis()Lcom/github/mikephil/charting/components/XAxis;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/mikephil/charting/components/XAxis;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_2e

    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getXAxis()Lcom/github/mikephil/charting/components/XAxis;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/mikephil/charting/components/XAxis;->isDrawLabelsEnabled()Z

    move-result v0

    if-eqz v0, :cond_2e

    .line 408
    iget v0, p1, Landroid/graphics/RectF;->top:F

    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getXAxis()Lcom/github/mikephil/charting/components/XAxis;

    move-result-object v1

    iget v1, v1, Lcom/github/mikephil/charting/components/XAxis;->mLabelRotatedHeight:I

    int-to-float v1, v1

    add-float/2addr v0, v1

    iput v0, p1, Landroid/graphics/RectF;->top:F

    goto/16 :goto_2e

    .line 412
    :pswitch_da
    iget v0, p1, Landroid/graphics/RectF;->bottom:F

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    iget v1, v1, Lcom/github/mikephil/charting/components/Legend;->mNeededHeight:F

    iget-object v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getChartHeight()F

    move-result v2

    iget-object v3, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/components/Legend;->getMaxSizePercent()F

    move-result v3

    mul-float/2addr v2, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    move-result v1

    iget-object v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/components/Legend;->getYOffset()F

    move-result v2

    add-float/2addr v1, v2

    add-float/2addr v0, v1

    iput v0, p1, Landroid/graphics/RectF;->bottom:F

    .line 416
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getXAxis()Lcom/github/mikephil/charting/components/XAxis;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/mikephil/charting/components/XAxis;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_2e

    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getXAxis()Lcom/github/mikephil/charting/components/XAxis;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/mikephil/charting/components/XAxis;->isDrawLabelsEnabled()Z

    move-result v0

    if-eqz v0, :cond_2e

    .line 417
    iget v0, p1, Landroid/graphics/RectF;->bottom:F

    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getXAxis()Lcom/github/mikephil/charting/components/XAxis;

    move-result-object v1

    iget v1, v1, Lcom/github/mikephil/charting/components/XAxis;->mLabelRotatedHeight:I

    int-to-float v1, v1

    add-float/2addr v0, v1

    iput v0, p1, Landroid/graphics/RectF;->bottom:F

    goto/16 :goto_2e

    .line 429
    :pswitch_11d
    sget-object v0, Lcom/github/mikephil/charting/charts/BarLineChartBase$2;->$SwitchMap$com$github$mikephil$charting$components$Legend$LegendVerticalAlignment:[I

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/components/Legend;->getVerticalAlignment()Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;

    move-result-object v1

    invoke-virtual {v1}, Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_1d0

    goto/16 :goto_2e

    .line 431
    :pswitch_130
    iget v0, p1, Landroid/graphics/RectF;->top:F

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    iget v1, v1, Lcom/github/mikephil/charting/components/Legend;->mNeededHeight:F

    iget-object v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getChartHeight()F

    move-result v2

    iget-object v3, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/components/Legend;->getMaxSizePercent()F

    move-result v3

    mul-float/2addr v2, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    move-result v1

    iget-object v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/components/Legend;->getYOffset()F

    move-result v2

    add-float/2addr v1, v2

    add-float/2addr v0, v1

    iput v0, p1, Landroid/graphics/RectF;->top:F

    .line 435
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getXAxis()Lcom/github/mikephil/charting/components/XAxis;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/mikephil/charting/components/XAxis;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_2e

    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getXAxis()Lcom/github/mikephil/charting/components/XAxis;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/mikephil/charting/components/XAxis;->isDrawLabelsEnabled()Z

    move-result v0

    if-eqz v0, :cond_2e

    .line 436
    iget v0, p1, Landroid/graphics/RectF;->top:F

    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getXAxis()Lcom/github/mikephil/charting/components/XAxis;

    move-result-object v1

    iget v1, v1, Lcom/github/mikephil/charting/components/XAxis;->mLabelRotatedHeight:I

    int-to-float v1, v1

    add-float/2addr v0, v1

    iput v0, p1, Landroid/graphics/RectF;->top:F

    goto/16 :goto_2e

    .line 440
    :pswitch_173
    iget v0, p1, Landroid/graphics/RectF;->bottom:F

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    iget v1, v1, Lcom/github/mikephil/charting/components/Legend;->mNeededHeight:F

    iget-object v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getChartHeight()F

    move-result v2

    iget-object v3, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/components/Legend;->getMaxSizePercent()F

    move-result v3

    mul-float/2addr v2, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    move-result v1

    iget-object v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/components/Legend;->getYOffset()F

    move-result v2

    add-float/2addr v1, v2

    add-float/2addr v0, v1

    iput v0, p1, Landroid/graphics/RectF;->bottom:F

    .line 444
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getXAxis()Lcom/github/mikephil/charting/components/XAxis;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/mikephil/charting/components/XAxis;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_2e

    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getXAxis()Lcom/github/mikephil/charting/components/XAxis;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/mikephil/charting/components/XAxis;->isDrawLabelsEnabled()Z

    move-result v0

    if-eqz v0, :cond_2e

    .line 445
    iget v0, p1, Landroid/graphics/RectF;->bottom:F

    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getXAxis()Lcom/github/mikephil/charting/components/XAxis;

    move-result-object v1

    iget v1, v1, Lcom/github/mikephil/charting/components/XAxis;->mLabelRotatedHeight:I

    int-to-float v1, v1

    add-float/2addr v0, v1

    iput v0, p1, Landroid/graphics/RectF;->bottom:F

    goto/16 :goto_2e

    .line 383
    :pswitch_data_1b6
    .packed-switch 0x1
        :pswitch_2f
        :pswitch_11d
    .end packed-switch

    .line 386
    :pswitch_data_1be
    .packed-switch 0x1
        :pswitch_41
        :pswitch_63
        :pswitch_85
    .end packed-switch

    .line 401
    :pswitch_data_1c8
    .packed-switch 0x1
        :pswitch_97
        :pswitch_da
    .end packed-switch

    .line 429
    :pswitch_data_1d0
    .packed-switch 0x1
        :pswitch_130
        :pswitch_173
    .end packed-switch
.end method

.method public calculateOffsets()V
    .registers 12

    .prologue
    .line 461
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iget-boolean v6, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mCustomViewPortEnabled:Z

    if-nez v6, :cond_fe

    .line 463
    const/4 v2, 0x0

    .local v2, "offsetLeft":F
    const/4 v3, 0x0

    .local v3, "offsetRight":F
    const/4 v4, 0x0

    .local v4, "offsetTop":F
    const/4 v1, 0x0

    .line 465
    .local v1, "offsetBottom":F
    iget-object v6, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mOffsetsBuffer:Landroid/graphics/RectF;

    invoke-virtual {p0, v6}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->calculateLegendOffsets(Landroid/graphics/RectF;)V

    .line 467
    iget-object v6, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mOffsetsBuffer:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->left:F

    add-float/2addr v2, v6

    .line 468
    iget-object v6, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mOffsetsBuffer:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->top:F

    add-float/2addr v4, v6

    .line 469
    iget-object v6, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mOffsetsBuffer:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->right:F

    add-float/2addr v3, v6

    .line 470
    iget-object v6, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mOffsetsBuffer:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->bottom:F

    add-float/2addr v1, v6

    .line 473
    iget-object v6, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisLeft:Lcom/github/mikephil/charting/components/YAxis;

    invoke-virtual {v6}, Lcom/github/mikephil/charting/components/YAxis;->needsOffset()Z

    move-result v6

    if-eqz v6, :cond_36

    .line 474
    iget-object v6, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisLeft:Lcom/github/mikephil/charting/components/YAxis;

    iget-object v7, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisRendererLeft:Lcom/github/mikephil/charting/renderer/YAxisRenderer;

    invoke-virtual {v7}, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->getPaintAxisLabels()Landroid/graphics/Paint;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/github/mikephil/charting/components/YAxis;->getRequiredWidthSpace(Landroid/graphics/Paint;)F

    move-result v6

    add-float/2addr v2, v6

    .line 478
    :cond_36
    iget-object v6, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisRight:Lcom/github/mikephil/charting/components/YAxis;

    invoke-virtual {v6}, Lcom/github/mikephil/charting/components/YAxis;->needsOffset()Z

    move-result v6

    if-eqz v6, :cond_4b

    .line 479
    iget-object v6, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisRight:Lcom/github/mikephil/charting/components/YAxis;

    iget-object v7, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisRendererRight:Lcom/github/mikephil/charting/renderer/YAxisRenderer;

    invoke-virtual {v7}, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->getPaintAxisLabels()Landroid/graphics/Paint;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/github/mikephil/charting/components/YAxis;->getRequiredWidthSpace(Landroid/graphics/Paint;)F

    move-result v6

    add-float/2addr v3, v6

    .line 483
    :cond_4b
    iget-object v6, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v6}, Lcom/github/mikephil/charting/components/XAxis;->isEnabled()Z

    move-result v6

    if-eqz v6, :cond_73

    iget-object v6, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v6}, Lcom/github/mikephil/charting/components/XAxis;->isDrawLabelsEnabled()Z

    move-result v6

    if-eqz v6, :cond_73

    .line 485
    iget-object v6, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget v6, v6, Lcom/github/mikephil/charting/components/XAxis;->mLabelRotatedHeight:I

    int-to-float v6, v6

    iget-object v7, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v7}, Lcom/github/mikephil/charting/components/XAxis;->getYOffset()F

    move-result v7

    add-float v5, v6, v7

    .line 488
    .local v5, "xlabelheight":F
    iget-object v6, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v6}, Lcom/github/mikephil/charting/components/XAxis;->getPosition()Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;

    move-result-object v6

    sget-object v7, Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;->BOTTOM:Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;

    if-ne v6, v7, :cond_105

    .line 490
    add-float/2addr v1, v5

    .line 503
    .end local v5    # "xlabelheight":F
    :cond_73
    :goto_73
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getExtraTopOffset()F

    move-result v6

    add-float/2addr v4, v6

    .line 504
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getExtraRightOffset()F

    move-result v6

    add-float/2addr v3, v6

    .line 505
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getExtraBottomOffset()F

    move-result v6

    add-float/2addr v1, v6

    .line 506
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getExtraLeftOffset()F

    move-result v6

    add-float/2addr v2, v6

    .line 508
    iget v6, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mMinOffset:F

    invoke-static {v6}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v0

    .line 510
    .local v0, "minOffset":F
    iget-object v6, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-static {v0, v2}, Ljava/lang/Math;->max(FF)F

    move-result v7

    invoke-static {v0, v4}, Ljava/lang/Math;->max(FF)F

    move-result v8

    invoke-static {v0, v3}, Ljava/lang/Math;->max(FF)F

    move-result v9

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v10

    invoke-virtual {v6, v7, v8, v9, v10}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->restrainViewPort(FFFF)V

    .line 516
    iget-boolean v6, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mLogEnabled:Z

    if-eqz v6, :cond_fe

    .line 517
    const-string v6, "MPAndroidChart"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "offsetLeft: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", offsetTop: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", offsetRight: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", offsetBottom: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 519
    const-string v6, "MPAndroidChart"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Content: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v8}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getContentRect()Landroid/graphics/RectF;

    move-result-object v8

    invoke-virtual {v8}, Landroid/graphics/RectF;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 523
    .end local v0    # "minOffset":F
    .end local v1    # "offsetBottom":F
    .end local v2    # "offsetLeft":F
    .end local v3    # "offsetRight":F
    .end local v4    # "offsetTop":F
    :cond_fe
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->prepareOffsetMatrix()V

    .line 524
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->prepareValuePxMatrix()V

    .line 525
    return-void

    .line 492
    .restart local v1    # "offsetBottom":F
    .restart local v2    # "offsetLeft":F
    .restart local v3    # "offsetRight":F
    .restart local v4    # "offsetTop":F
    .restart local v5    # "xlabelheight":F
    :cond_105
    iget-object v6, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v6}, Lcom/github/mikephil/charting/components/XAxis;->getPosition()Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;

    move-result-object v6

    sget-object v7, Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;->TOP:Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;

    if-ne v6, v7, :cond_112

    .line 494
    add-float/2addr v4, v5

    goto/16 :goto_73

    .line 496
    :cond_112
    iget-object v6, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v6}, Lcom/github/mikephil/charting/components/XAxis;->getPosition()Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;

    move-result-object v6

    sget-object v7, Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;->BOTH_SIDED:Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;

    if-ne v6, v7, :cond_73

    .line 498
    add-float/2addr v1, v5

    .line 499
    add-float/2addr v4, v5

    goto/16 :goto_73
.end method

.method public centerViewTo(FFLcom/github/mikephil/charting/components/YAxis$AxisDependency;)V
    .registers 12
    .param p1, "xIndex"    # F
    .param p2, "yValue"    # F
    .param p3, "axis"    # Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    const/high16 v3, 0x40000000    # 2.0f

    .line 936
    invoke-virtual {p0, p3}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getDeltaY(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)F

    move-result v1

    iget-object v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getScaleY()F

    move-result v2

    div-float v6, v1, v2

    .line 937
    .local v6, "valsInView":F
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getXAxis()Lcom/github/mikephil/charting/components/XAxis;

    move-result-object v1

    invoke-virtual {v1}, Lcom/github/mikephil/charting/components/XAxis;->getValues()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    int-to-float v1, v1

    iget-object v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getScaleX()F

    move-result v2

    div-float v7, v1, v2

    .line 939
    .local v7, "xsInView":F
    new-instance v0, Lcom/github/mikephil/charting/jobs/MoveViewJob;

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    div-float v2, v7, v3

    sub-float v2, p1, v2

    div-float v3, v6, v3

    add-float/2addr v3, p2

    invoke-virtual {p0, p3}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getTransformer(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/Transformer;

    move-result-object v4

    move-object v5, p0

    invoke-direct/range {v0 .. v5}, Lcom/github/mikephil/charting/jobs/MoveViewJob;-><init>(Lcom/github/mikephil/charting/utils/ViewPortHandler;FFLcom/github/mikephil/charting/utils/Transformer;Landroid/view/View;)V

    .line 943
    .local v0, "job":Ljava/lang/Runnable;
    invoke-virtual {p0, v0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->addViewportJob(Ljava/lang/Runnable;)V

    .line 944
    return-void
.end method

.method public centerViewToAnimated(FFLcom/github/mikephil/charting/components/YAxis$AxisDependency;J)V
    .registers 20
    .param p1, "xIndex"    # F
    .param p2, "yValue"    # F
    .param p3, "axis"    # Lcom/github/mikephil/charting/components/YAxis$AxisDependency;
    .param p4, "duration"    # J
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 958
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xb

    if-lt v2, v3, :cond_61

    .line 960
    iget-object v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentLeft()F

    move-result v2

    iget-object v3, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentTop()F

    move-result v3

    move-object/from16 v0, p3

    invoke-virtual {p0, v2, v3, v0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getValuesByTouchPoint(FFLcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/PointD;

    move-result-object v11

    .line 962
    .local v11, "bounds":Lcom/github/mikephil/charting/utils/PointD;
    move-object/from16 v0, p3

    invoke-virtual {p0, v0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getDeltaY(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)F

    move-result v2

    iget-object v3, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getScaleY()F

    move-result v3

    div-float v12, v2, v3

    .line 963
    .local v12, "valsInView":F
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getXAxis()Lcom/github/mikephil/charting/components/XAxis;

    move-result-object v2

    invoke-virtual {v2}, Lcom/github/mikephil/charting/components/XAxis;->getValues()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    int-to-float v2, v2

    iget-object v3, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getScaleX()F

    move-result v3

    div-float v13, v2, v3

    .line 965
    .local v13, "xsInView":F
    new-instance v1, Lcom/github/mikephil/charting/jobs/AnimatedMoveViewJob;

    iget-object v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    const/high16 v3, 0x40000000    # 2.0f

    div-float v3, v13, v3

    sub-float v3, p1, v3

    const/high16 v4, 0x40000000    # 2.0f

    div-float v4, v12, v4

    add-float v4, v4, p2

    move-object/from16 v0, p3

    invoke-virtual {p0, v0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getTransformer(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/Transformer;

    move-result-object v5

    iget-wide v6, v11, Lcom/github/mikephil/charting/utils/PointD;->x:D

    double-to-float v7, v6

    iget-wide v8, v11, Lcom/github/mikephil/charting/utils/PointD;->y:D

    double-to-float v8, v8

    move-object v6, p0

    move-wide/from16 v9, p4

    invoke-direct/range {v1 .. v10}, Lcom/github/mikephil/charting/jobs/AnimatedMoveViewJob;-><init>(Lcom/github/mikephil/charting/utils/ViewPortHandler;FFLcom/github/mikephil/charting/utils/Transformer;Landroid/view/View;FFJ)V

    .line 969
    .local v1, "job":Ljava/lang/Runnable;
    invoke-virtual {p0, v1}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->addViewportJob(Ljava/lang/Runnable;)V

    .line 973
    .end local v1    # "job":Ljava/lang/Runnable;
    .end local v11    # "bounds":Lcom/github/mikephil/charting/utils/PointD;
    .end local v12    # "valsInView":F
    .end local v13    # "xsInView":F
    :goto_60
    return-void

    .line 971
    :cond_61
    const-string v2, "MPAndroidChart"

    const-string v3, "Unable to execute centerViewToAnimated(...) on API level < 11"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_60
.end method

.method public computeScroll()V
    .registers 2

    .prologue
    .line 662
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mChartTouchListener:Lcom/github/mikephil/charting/listener/ChartTouchListener;

    instance-of v0, v0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;

    if-eqz v0, :cond_d

    .line 663
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mChartTouchListener:Lcom/github/mikephil/charting/listener/ChartTouchListener;

    check-cast v0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->computeScroll()V

    .line 664
    :cond_d
    return-void
.end method

.method protected drawGridBackground(Landroid/graphics/Canvas;)V
    .registers 4
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    .line 620
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iget-boolean v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mDrawGridBackground:Z

    if-eqz v0, :cond_f

    .line 623
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getContentRect()Landroid/graphics/RectF;

    move-result-object v0

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mGridBackgroundPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 626
    :cond_f
    iget-boolean v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mDrawBorders:Z

    if-eqz v0, :cond_1e

    .line 627
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getContentRect()Landroid/graphics/RectF;

    move-result-object v0

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mBorderPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 629
    :cond_1e
    return-void
.end method

.method public fitScreen()V
    .registers 4

    .prologue
    .line 774
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->fitScreen()Landroid/graphics/Matrix;

    move-result-object v0

    .line 775
    .local v0, "save":Landroid/graphics/Matrix;
    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    const/4 v2, 0x0

    invoke-virtual {v1, v0, p0, v2}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->refresh(Landroid/graphics/Matrix;Landroid/view/View;Z)Landroid/graphics/Matrix;

    .line 777
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->calculateOffsets()V

    .line 778
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->postInvalidate()V

    .line 779
    return-void
.end method

.method public getAxis(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/components/YAxis;
    .registers 3
    .param p1, "axis"    # Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    .prologue
    .line 1450
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    sget-object v0, Lcom/github/mikephil/charting/components/YAxis$AxisDependency;->LEFT:Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    if-ne p1, v0, :cond_7

    .line 1451
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisLeft:Lcom/github/mikephil/charting/components/YAxis;

    .line 1453
    :goto_6
    return-object v0

    :cond_7
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisRight:Lcom/github/mikephil/charting/components/YAxis;

    goto :goto_6
.end method

.method public getAxisLeft()Lcom/github/mikephil/charting/components/YAxis;
    .registers 2

    .prologue
    .line 1429
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisLeft:Lcom/github/mikephil/charting/components/YAxis;

    return-object v0
.end method

.method public getAxisRight()Lcom/github/mikephil/charting/components/YAxis;
    .registers 2

    .prologue
    .line 1439
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisRight:Lcom/github/mikephil/charting/components/YAxis;

    return-object v0
.end method

.method public bridge synthetic getData()Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;
    .registers 2

    .prologue
    .line 48
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    invoke-super {p0}, Lcom/github/mikephil/charting/charts/Chart;->getData()Lcom/github/mikephil/charting/data/ChartData;

    move-result-object v0

    check-cast v0, Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;

    return-object v0
.end method

.method public getDataSetByTouchPoint(FF)Lcom/github/mikephil/charting/interfaces/datasets/IBarLineScatterCandleBubbleDataSet;
    .registers 6
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    .line 1356
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    invoke-virtual {p0, p1, p2}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getHighlightByTouchPoint(FF)Lcom/github/mikephil/charting/highlight/Highlight;

    move-result-object v0

    .line 1357
    .local v0, "h":Lcom/github/mikephil/charting/highlight/Highlight;
    if-eqz v0, :cond_15

    .line 1358
    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mData:Lcom/github/mikephil/charting/data/ChartData;

    check-cast v1, Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/highlight/Highlight;->getDataSetIndex()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;->getDataSetByIndex(I)Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    move-result-object v1

    check-cast v1, Lcom/github/mikephil/charting/interfaces/datasets/IBarLineScatterCandleBubbleDataSet;

    .line 1360
    :goto_14
    return-object v1

    :cond_15
    const/4 v1, 0x0

    goto :goto_14
.end method

.method public getDeltaY(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)F
    .registers 3
    .param p1, "axis"    # Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    .prologue
    .line 1029
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    sget-object v0, Lcom/github/mikephil/charting/components/YAxis$AxisDependency;->LEFT:Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    if-ne p1, v0, :cond_9

    .line 1030
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisLeft:Lcom/github/mikephil/charting/components/YAxis;

    iget v0, v0, Lcom/github/mikephil/charting/components/YAxis;->mAxisRange:F

    .line 1032
    :goto_8
    return v0

    :cond_9
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisRight:Lcom/github/mikephil/charting/components/YAxis;

    iget v0, v0, Lcom/github/mikephil/charting/components/YAxis;->mAxisRange:F

    goto :goto_8
.end method

.method public getDrawListener()Lcom/github/mikephil/charting/listener/OnDrawListener;
    .registers 2

    .prologue
    .line 1050
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mDrawListener:Lcom/github/mikephil/charting/listener/OnDrawListener;

    return-object v0
.end method

.method public getEntryByTouchPoint(FF)Lcom/github/mikephil/charting/data/Entry;
    .registers 5
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    .line 1341
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    invoke-virtual {p0, p1, p2}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getHighlightByTouchPoint(FF)Lcom/github/mikephil/charting/highlight/Highlight;

    move-result-object v0

    .line 1342
    .local v0, "h":Lcom/github/mikephil/charting/highlight/Highlight;
    if-eqz v0, :cond_f

    .line 1343
    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mData:Lcom/github/mikephil/charting/data/ChartData;

    check-cast v1, Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;

    invoke-virtual {v1, v0}, Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;->getEntryForHighlight(Lcom/github/mikephil/charting/highlight/Highlight;)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v1

    .line 1345
    :goto_e
    return-object v1

    :cond_f
    const/4 v1, 0x0

    goto :goto_e
.end method

.method public getHighestVisibleXIndex()I
    .registers 5

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    const/4 v3, 0x0

    .line 1386
    const/4 v1, 0x2

    new-array v0, v1, [F

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentRight()F

    move-result v1

    aput v1, v0, v3

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentBottom()F

    move-result v2

    aput v2, v0, v1

    .line 1389
    .local v0, "pts":[F
    sget-object v1, Lcom/github/mikephil/charting/components/YAxis$AxisDependency;->LEFT:Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    invoke-virtual {p0, v1}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getTransformer(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/Transformer;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/github/mikephil/charting/utils/Transformer;->pixelsToValue([F)V

    .line 1390
    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mData:Lcom/github/mikephil/charting/data/ChartData;

    check-cast v1, Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;->getXValCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    aget v2, v0, v3

    float-to-double v2, v2

    invoke-static {v2, v3}, Ljava/lang/Math;->floor(D)D

    move-result-wide v2

    double-to-int v2, v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    return v1
.end method

.method public getHighlightByTouchPoint(FF)Lcom/github/mikephil/charting/highlight/Highlight;
    .registers 5
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    .line 1270
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mData:Lcom/github/mikephil/charting/data/ChartData;

    if-nez v0, :cond_d

    .line 1271
    const-string v0, "MPAndroidChart"

    const-string v1, "Can\'t select by touch. No data set."

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1272
    const/4 v0, 0x0

    .line 1274
    :goto_c
    return-object v0

    :cond_d
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getHighlighter()Lcom/github/mikephil/charting/highlight/ChartHighlighter;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/github/mikephil/charting/highlight/ChartHighlighter;->getHighlight(FF)Lcom/github/mikephil/charting/highlight/Highlight;

    move-result-object v0

    goto :goto_c
.end method

.method public getLowestVisibleXIndex()I
    .registers 5

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    const/4 v1, 0x0

    .line 1371
    const/4 v2, 0x2

    new-array v0, v2, [F

    iget-object v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentLeft()F

    move-result v2

    aput v2, v0, v1

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentBottom()F

    move-result v3

    aput v3, v0, v2

    .line 1374
    .local v0, "pts":[F
    sget-object v2, Lcom/github/mikephil/charting/components/YAxis$AxisDependency;->LEFT:Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    invoke-virtual {p0, v2}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getTransformer(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/Transformer;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/github/mikephil/charting/utils/Transformer;->pixelsToValue([F)V

    .line 1375
    aget v2, v0, v1

    const/4 v3, 0x0

    cmpg-float v2, v2, v3

    if-gtz v2, :cond_26

    :goto_25
    return v1

    :cond_26
    aget v1, v0, v1

    float-to-double v1, v1

    invoke-static {v1, v2}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v1

    double-to-int v1, v1

    goto :goto_25
.end method

.method protected getMarkerPosition(Lcom/github/mikephil/charting/data/Entry;Lcom/github/mikephil/charting/highlight/Highlight;)[F
    .registers 16
    .param p1, "e"    # Lcom/github/mikephil/charting/data/Entry;
    .param p2, "highlight"    # Lcom/github/mikephil/charting/highlight/Highlight;

    .prologue
    .line 559
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    invoke-virtual {p2}, Lcom/github/mikephil/charting/highlight/Highlight;->getDataSetIndex()I

    move-result v1

    .line 560
    .local v1, "dataSetIndex":I
    invoke-virtual {p1}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v11

    int-to-float v8, v11

    .line 561
    .local v8, "xPos":F
    invoke-virtual {p1}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v10

    .line 563
    .local v10, "yPos":F
    instance-of v11, p0, Lcom/github/mikephil/charting/charts/BarChart;

    if-eqz v11, :cond_9f

    .line 565
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mData:Lcom/github/mikephil/charting/data/ChartData;

    check-cast v0, Lcom/github/mikephil/charting/data/BarData;

    .line 566
    .local v0, "bd":Lcom/github/mikephil/charting/data/BarData;
    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/BarData;->getGroupSpace()F

    move-result v6

    .line 567
    .local v6, "space":F
    iget-object v11, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mData:Lcom/github/mikephil/charting/data/ChartData;

    check-cast v11, Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;

    invoke-virtual {v11}, Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;->getDataSetCount()I

    move-result v5

    .line 568
    .local v5, "setCount":I
    invoke-virtual {p1}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v3

    .line 570
    .local v3, "i":I
    instance-of v11, p0, Lcom/github/mikephil/charting/charts/HorizontalBarChart;

    if-eqz v11, :cond_73

    .line 573
    add-int/lit8 v11, v5, -0x1

    mul-int/2addr v11, v3

    add-int/2addr v11, v3

    add-int/2addr v11, v1

    int-to-float v11, v11

    int-to-float v12, v3

    mul-float/2addr v12, v6

    add-float/2addr v11, v12

    const/high16 v12, 0x40000000    # 2.0f

    div-float v12, v6, v12

    add-float v9, v11, v12

    .line 575
    .local v9, "y":F
    move v10, v9

    move-object v2, p1

    .line 577
    check-cast v2, Lcom/github/mikephil/charting/data/BarEntry;

    .line 578
    .local v2, "entry":Lcom/github/mikephil/charting/data/BarEntry;
    invoke-virtual {v2}, Lcom/github/mikephil/charting/data/BarEntry;->getVals()[F

    move-result-object v11

    if-eqz v11, :cond_6e

    .line 579
    invoke-virtual {p2}, Lcom/github/mikephil/charting/highlight/Highlight;->getRange()Lcom/github/mikephil/charting/highlight/Range;

    move-result-object v11

    iget v8, v11, Lcom/github/mikephil/charting/highlight/Range;->to:F

    .line 584
    :goto_48
    iget-object v11, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v11}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseY()F

    move-result v11

    mul-float/2addr v8, v11

    .line 605
    .end local v0    # "bd":Lcom/github/mikephil/charting/data/BarData;
    .end local v2    # "entry":Lcom/github/mikephil/charting/data/BarEntry;
    .end local v3    # "i":I
    .end local v5    # "setCount":I
    .end local v6    # "space":F
    .end local v9    # "y":F
    :goto_4f
    const/4 v11, 0x2

    new-array v4, v11, [F

    const/4 v11, 0x0

    aput v8, v4, v11

    const/4 v11, 0x1

    aput v10, v4, v11

    .line 609
    .local v4, "pts":[F
    iget-object v11, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mData:Lcom/github/mikephil/charting/data/ChartData;

    check-cast v11, Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;

    invoke-virtual {v11, v1}, Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;->getDataSetByIndex(I)Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    move-result-object v11

    check-cast v11, Lcom/github/mikephil/charting/interfaces/datasets/IBarLineScatterCandleBubbleDataSet;

    invoke-interface {v11}, Lcom/github/mikephil/charting/interfaces/datasets/IBarLineScatterCandleBubbleDataSet;->getAxisDependency()Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    move-result-object v11

    invoke-virtual {p0, v11}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getTransformer(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/Transformer;

    move-result-object v11

    invoke-virtual {v11, v4}, Lcom/github/mikephil/charting/utils/Transformer;->pointValuesToPixel([F)V

    .line 612
    return-object v4

    .line 581
    .end local v4    # "pts":[F
    .restart local v0    # "bd":Lcom/github/mikephil/charting/data/BarData;
    .restart local v2    # "entry":Lcom/github/mikephil/charting/data/BarEntry;
    .restart local v3    # "i":I
    .restart local v5    # "setCount":I
    .restart local v6    # "space":F
    .restart local v9    # "y":F
    :cond_6e
    invoke-virtual {p1}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v8

    goto :goto_48

    .line 587
    .end local v2    # "entry":Lcom/github/mikephil/charting/data/BarEntry;
    .end local v9    # "y":F
    :cond_73
    add-int/lit8 v11, v5, -0x1

    mul-int/2addr v11, v3

    add-int/2addr v11, v3

    add-int/2addr v11, v1

    int-to-float v11, v11

    int-to-float v12, v3

    mul-float/2addr v12, v6

    add-float/2addr v11, v12

    const/high16 v12, 0x40000000    # 2.0f

    div-float v12, v6, v12

    add-float v7, v11, v12

    .line 589
    .local v7, "x":F
    move v8, v7

    move-object v2, p1

    .line 591
    check-cast v2, Lcom/github/mikephil/charting/data/BarEntry;

    .line 592
    .restart local v2    # "entry":Lcom/github/mikephil/charting/data/BarEntry;
    invoke-virtual {v2}, Lcom/github/mikephil/charting/data/BarEntry;->getVals()[F

    move-result-object v11

    if-eqz v11, :cond_9a

    .line 593
    invoke-virtual {p2}, Lcom/github/mikephil/charting/highlight/Highlight;->getRange()Lcom/github/mikephil/charting/highlight/Range;

    move-result-object v11

    iget v10, v11, Lcom/github/mikephil/charting/highlight/Range;->to:F

    .line 598
    :goto_92
    iget-object v11, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v11}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseY()F

    move-result v11

    mul-float/2addr v10, v11

    goto :goto_4f

    .line 595
    :cond_9a
    invoke-virtual {p1}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v10

    goto :goto_92

    .line 601
    .end local v0    # "bd":Lcom/github/mikephil/charting/data/BarData;
    .end local v2    # "entry":Lcom/github/mikephil/charting/data/BarEntry;
    .end local v3    # "i":I
    .end local v5    # "setCount":I
    .end local v6    # "space":F
    .end local v7    # "x":F
    :cond_9f
    iget-object v11, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v11}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseY()F

    move-result v11

    mul-float/2addr v10, v11

    goto :goto_4f
.end method

.method public getMaxVisibleCount()I
    .registers 2

    .prologue
    .line 1085
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mMaxVisibleCount:I

    return v0
.end method

.method public getMinOffset()F
    .registers 2

    .prologue
    .line 1235
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mMinOffset:F

    return v0
.end method

.method public getPaint(I)Landroid/graphics/Paint;
    .registers 3
    .param p1, "which"    # I

    .prologue
    .line 1604
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    invoke-super {p0, p1}, Lcom/github/mikephil/charting/charts/Chart;->getPaint(I)Landroid/graphics/Paint;

    move-result-object v0

    .line 1605
    .local v0, "p":Landroid/graphics/Paint;
    if-eqz v0, :cond_7

    .line 1613
    .end local v0    # "p":Landroid/graphics/Paint;
    :goto_6
    return-object v0

    .line 1608
    .restart local v0    # "p":Landroid/graphics/Paint;
    :cond_7
    packed-switch p1, :pswitch_data_10

    .line 1613
    const/4 v0, 0x0

    goto :goto_6

    .line 1610
    :pswitch_c
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mGridBackgroundPaint:Landroid/graphics/Paint;

    goto :goto_6

    .line 1608
    nop

    :pswitch_data_10
    .packed-switch 0x4
        :pswitch_c
    .end packed-switch
.end method

.method public getPixelsForValues(FFLcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/PointD;
    .registers 10
    .param p1, "x"    # F
    .param p2, "y"    # F
    .param p3, "axis"    # Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    const/4 v4, 0x1

    const/4 v2, 0x0

    .line 1312
    const/4 v1, 0x2

    new-array v0, v1, [F

    aput p1, v0, v2

    aput p2, v0, v4

    .line 1316
    .local v0, "pts":[F
    invoke-virtual {p0, p3}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getTransformer(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/Transformer;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/github/mikephil/charting/utils/Transformer;->pointValuesToPixel([F)V

    .line 1318
    new-instance v1, Lcom/github/mikephil/charting/utils/PointD;

    aget v2, v0, v2

    float-to-double v2, v2

    aget v4, v0, v4

    float-to-double v4, v4

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/github/mikephil/charting/utils/PointD;-><init>(DD)V

    return-object v1
.end method

.method public getPosition(Lcom/github/mikephil/charting/data/Entry;Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Landroid/graphics/PointF;
    .registers 7
    .param p1, "e"    # Lcom/github/mikephil/charting/data/Entry;
    .param p2, "axis"    # Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 1062
    if-nez p1, :cond_6

    .line 1063
    const/4 v1, 0x0

    .line 1071
    :goto_5
    return-object v1

    .line 1065
    :cond_6
    const/4 v1, 0x2

    new-array v0, v1, [F

    invoke-virtual {p1}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v1

    int-to-float v1, v1

    aput v1, v0, v2

    invoke-virtual {p1}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v1

    aput v1, v0, v3

    .line 1069
    .local v0, "vals":[F
    invoke-virtual {p0, p2}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getTransformer(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/Transformer;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/github/mikephil/charting/utils/Transformer;->pointValuesToPixel([F)V

    .line 1071
    new-instance v1, Landroid/graphics/PointF;

    aget v2, v0, v2

    aget v3, v0, v3

    invoke-direct {v1, v2, v3}, Landroid/graphics/PointF;-><init>(FF)V

    goto :goto_5
.end method

.method public getRendererLeftYAxis()Lcom/github/mikephil/charting/renderer/YAxisRenderer;
    .registers 2

    .prologue
    .line 1523
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisRendererLeft:Lcom/github/mikephil/charting/renderer/YAxisRenderer;

    return-object v0
.end method

.method public getRendererRightYAxis()Lcom/github/mikephil/charting/renderer/YAxisRenderer;
    .registers 2

    .prologue
    .line 1536
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisRendererRight:Lcom/github/mikephil/charting/renderer/YAxisRenderer;

    return-object v0
.end method

.method public getRendererXAxis()Lcom/github/mikephil/charting/renderer/XAxisRenderer;
    .registers 2

    .prologue
    .line 1510
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mXAxisRenderer:Lcom/github/mikephil/charting/renderer/XAxisRenderer;

    return-object v0
.end method

.method public getScaleX()F
    .registers 2

    .prologue
    .line 1397
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    if-nez v0, :cond_7

    .line 1398
    const/high16 v0, 0x3f800000    # 1.0f

    .line 1400
    :goto_6
    return v0

    :cond_7
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getScaleX()F

    move-result v0

    goto :goto_6
.end method

.method public getScaleY()F
    .registers 2

    .prologue
    .line 1407
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    if-nez v0, :cond_7

    .line 1408
    const/high16 v0, 0x3f800000    # 1.0f

    .line 1410
    :goto_6
    return v0

    :cond_7
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getScaleY()F

    move-result v0

    goto :goto_6
.end method

.method public getTransformer(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/Transformer;
    .registers 3
    .param p1, "which"    # Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    .prologue
    .line 639
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    sget-object v0, Lcom/github/mikephil/charting/components/YAxis$AxisDependency;->LEFT:Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    if-ne p1, v0, :cond_7

    .line 640
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mLeftAxisTransformer:Lcom/github/mikephil/charting/utils/Transformer;

    .line 642
    :goto_6
    return-object v0

    :cond_7
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mRightAxisTransformer:Lcom/github/mikephil/charting/utils/Transformer;

    goto :goto_6
.end method

.method public getValuesByTouchPoint(FFLcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/PointD;
    .registers 12
    .param p1, "x"    # F
    .param p2, "y"    # F
    .param p3, "axis"    # Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 1290
    const/4 v5, 0x2

    new-array v0, v5, [F

    .line 1291
    .local v0, "pts":[F
    aput p1, v0, v6

    .line 1292
    aput p2, v0, v7

    .line 1294
    invoke-virtual {p0, p3}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getTransformer(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/Transformer;

    move-result-object v5

    invoke-virtual {v5, v0}, Lcom/github/mikephil/charting/utils/Transformer;->pixelsToValue([F)V

    .line 1296
    aget v5, v0, v6

    float-to-double v1, v5

    .line 1297
    .local v1, "xTouchVal":D
    aget v5, v0, v7

    float-to-double v3, v5

    .line 1299
    .local v3, "yTouchVal":D
    new-instance v5, Lcom/github/mikephil/charting/utils/PointD;

    invoke-direct {v5, v1, v2, v3, v4}, Lcom/github/mikephil/charting/utils/PointD;-><init>(DD)V

    return-object v5
.end method

.method public getYChartMax()F
    .registers 3

    .prologue
    .line 1550
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisLeft:Lcom/github/mikephil/charting/components/YAxis;

    iget v0, v0, Lcom/github/mikephil/charting/components/YAxis;->mAxisMaximum:F

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisRight:Lcom/github/mikephil/charting/components/YAxis;

    iget v1, v1, Lcom/github/mikephil/charting/components/YAxis;->mAxisMaximum:F

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    return v0
.end method

.method public getYChartMin()F
    .registers 3

    .prologue
    .line 1555
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisLeft:Lcom/github/mikephil/charting/components/YAxis;

    iget v0, v0, Lcom/github/mikephil/charting/components/YAxis;->mAxisMinimum:F

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisRight:Lcom/github/mikephil/charting/components/YAxis;

    iget v1, v1, Lcom/github/mikephil/charting/components/YAxis;->mAxisMinimum:F

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    return v0
.end method

.method public getYValueByTouchPoint(FFLcom/github/mikephil/charting/components/YAxis$AxisDependency;)F
    .registers 6
    .param p1, "x"    # F
    .param p2, "y"    # F
    .param p3, "axis"    # Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    .prologue
    .line 1330
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    invoke-virtual {p0, p1, p2, p3}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getValuesByTouchPoint(FFLcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/PointD;

    move-result-object v0

    iget-wide v0, v0, Lcom/github/mikephil/charting/utils/PointD;->y:D

    double-to-float v0, v0

    return v0
.end method

.method public hasNoDragOffset()Z
    .registers 2

    .prologue
    .line 1506
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->hasNoDragOffset()Z

    move-result v0

    return v0
.end method

.method protected init()V
    .registers 6

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    const/16 v4, 0xf0

    .line 160
    invoke-super {p0}, Lcom/github/mikephil/charting/charts/Chart;->init()V

    .line 162
    new-instance v0, Lcom/github/mikephil/charting/components/YAxis;

    sget-object v1, Lcom/github/mikephil/charting/components/YAxis$AxisDependency;->LEFT:Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    invoke-direct {v0, v1}, Lcom/github/mikephil/charting/components/YAxis;-><init>(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)V

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisLeft:Lcom/github/mikephil/charting/components/YAxis;

    .line 163
    new-instance v0, Lcom/github/mikephil/charting/components/YAxis;

    sget-object v1, Lcom/github/mikephil/charting/components/YAxis$AxisDependency;->RIGHT:Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    invoke-direct {v0, v1}, Lcom/github/mikephil/charting/components/YAxis;-><init>(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)V

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisRight:Lcom/github/mikephil/charting/components/YAxis;

    .line 165
    new-instance v0, Lcom/github/mikephil/charting/utils/Transformer;

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-direct {v0, v1}, Lcom/github/mikephil/charting/utils/Transformer;-><init>(Lcom/github/mikephil/charting/utils/ViewPortHandler;)V

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mLeftAxisTransformer:Lcom/github/mikephil/charting/utils/Transformer;

    .line 166
    new-instance v0, Lcom/github/mikephil/charting/utils/Transformer;

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-direct {v0, v1}, Lcom/github/mikephil/charting/utils/Transformer;-><init>(Lcom/github/mikephil/charting/utils/ViewPortHandler;)V

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mRightAxisTransformer:Lcom/github/mikephil/charting/utils/Transformer;

    .line 168
    new-instance v0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    iget-object v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisLeft:Lcom/github/mikephil/charting/components/YAxis;

    iget-object v3, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mLeftAxisTransformer:Lcom/github/mikephil/charting/utils/Transformer;

    invoke-direct {v0, v1, v2, v3}, Lcom/github/mikephil/charting/renderer/YAxisRenderer;-><init>(Lcom/github/mikephil/charting/utils/ViewPortHandler;Lcom/github/mikephil/charting/components/YAxis;Lcom/github/mikephil/charting/utils/Transformer;)V

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisRendererLeft:Lcom/github/mikephil/charting/renderer/YAxisRenderer;

    .line 169
    new-instance v0, Lcom/github/mikephil/charting/renderer/YAxisRenderer;

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    iget-object v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisRight:Lcom/github/mikephil/charting/components/YAxis;

    iget-object v3, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mRightAxisTransformer:Lcom/github/mikephil/charting/utils/Transformer;

    invoke-direct {v0, v1, v2, v3}, Lcom/github/mikephil/charting/renderer/YAxisRenderer;-><init>(Lcom/github/mikephil/charting/utils/ViewPortHandler;Lcom/github/mikephil/charting/components/YAxis;Lcom/github/mikephil/charting/utils/Transformer;)V

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisRendererRight:Lcom/github/mikephil/charting/renderer/YAxisRenderer;

    .line 171
    new-instance v0, Lcom/github/mikephil/charting/renderer/XAxisRenderer;

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    iget-object v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget-object v3, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mLeftAxisTransformer:Lcom/github/mikephil/charting/utils/Transformer;

    invoke-direct {v0, v1, v2, v3}, Lcom/github/mikephil/charting/renderer/XAxisRenderer;-><init>(Lcom/github/mikephil/charting/utils/ViewPortHandler;Lcom/github/mikephil/charting/components/XAxis;Lcom/github/mikephil/charting/utils/Transformer;)V

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mXAxisRenderer:Lcom/github/mikephil/charting/renderer/XAxisRenderer;

    .line 173
    new-instance v0, Lcom/github/mikephil/charting/highlight/ChartHighlighter;

    invoke-direct {v0, p0}, Lcom/github/mikephil/charting/highlight/ChartHighlighter;-><init>(Lcom/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider;)V

    invoke-virtual {p0, v0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->setHighlighter(Lcom/github/mikephil/charting/highlight/ChartHighlighter;)V

    .line 175
    new-instance v0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getMatrixTouch()Landroid/graphics/Matrix;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;-><init>(Lcom/github/mikephil/charting/charts/BarLineChartBase;Landroid/graphics/Matrix;)V

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mChartTouchListener:Lcom/github/mikephil/charting/listener/ChartTouchListener;

    .line 177
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mGridBackgroundPaint:Landroid/graphics/Paint;

    .line 178
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mGridBackgroundPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 180
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mGridBackgroundPaint:Landroid/graphics/Paint;

    invoke-static {v4, v4, v4}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 183
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mBorderPaint:Landroid/graphics/Paint;

    .line 184
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mBorderPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 185
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mBorderPaint:Landroid/graphics/Paint;

    const/high16 v1, -0x1000000

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 186
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mBorderPaint:Landroid/graphics/Paint;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v1}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 187
    return-void
.end method

.method public isAnyAxisInverted()Z
    .registers 3

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    const/4 v0, 0x1

    .line 1564
    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisLeft:Lcom/github/mikephil/charting/components/YAxis;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/components/YAxis;->isInverted()Z

    move-result v1

    if-eqz v1, :cond_a

    .line 1568
    :cond_9
    :goto_9
    return v0

    .line 1566
    :cond_a
    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisRight:Lcom/github/mikephil/charting/components/YAxis;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/components/YAxis;->isInverted()Z

    move-result v1

    if-nez v1, :cond_9

    .line 1568
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public isAutoScaleMinMaxEnabled()Z
    .registers 2

    .prologue
    .line 1588
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iget-boolean v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAutoScaleMinMaxEnabled:Z

    return v0
.end method

.method public isDoubleTapToZoomEnabled()Z
    .registers 2

    .prologue
    .line 1191
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iget-boolean v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mDoubleTapToZoomEnabled:Z

    return v0
.end method

.method public isDragEnabled()Z
    .registers 2

    .prologue
    .line 1145
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iget-boolean v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mDragEnabled:Z

    return v0
.end method

.method public isFullyZoomedOut()Z
    .registers 2

    .prologue
    .line 1419
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isFullyZoomedOut()Z

    move-result v0

    return v0
.end method

.method public isHighlightFullBarEnabled()Z
    .registers 2

    .prologue
    .line 1116
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iget-boolean v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mHighlightFullBarEnabled:Z

    return v0
.end method

.method public isHighlightPerDragEnabled()Z
    .registers 2

    .prologue
    .line 1099
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iget-boolean v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mHighlightPerDragEnabled:Z

    return v0
.end method

.method public isInverted(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Z
    .registers 3
    .param p1, "axis"    # Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    .prologue
    .line 1458
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    invoke-virtual {p0, p1}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getAxis(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/components/YAxis;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/mikephil/charting/components/YAxis;->isInverted()Z

    move-result v0

    return v0
.end method

.method public isKeepPositionOnRotation()Z
    .registers 2

    .prologue
    .line 1249
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iget-boolean v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mKeepPositionOnRotation:Z

    return v0
.end method

.method public isPinchZoomEnabled()Z
    .registers 2

    .prologue
    .line 1477
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iget-boolean v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mPinchZoomEnabled:Z

    return v0
.end method

.method public isScaleXEnabled()Z
    .registers 2

    .prologue
    .line 1168
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iget-boolean v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mScaleXEnabled:Z

    return v0
.end method

.method public isScaleYEnabled()Z
    .registers 2

    .prologue
    .line 1172
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iget-boolean v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mScaleYEnabled:Z

    return v0
.end method

.method public moveViewTo(FFLcom/github/mikephil/charting/components/YAxis$AxisDependency;)V
    .registers 11
    .param p1, "xIndex"    # F
    .param p2, "yValue"    # F
    .param p3, "axis"    # Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    .prologue
    .line 889
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    invoke-virtual {p0, p3}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getDeltaY(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)F

    move-result v1

    iget-object v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getScaleY()F

    move-result v2

    div-float v6, v1, v2

    .line 891
    .local v6, "valsInView":F
    new-instance v0, Lcom/github/mikephil/charting/jobs/MoveViewJob;

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    const/high16 v2, 0x40000000    # 2.0f

    div-float v2, v6, v2

    add-float v3, p2, v2

    invoke-virtual {p0, p3}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getTransformer(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/Transformer;

    move-result-object v4

    move v2, p1

    move-object v5, p0

    invoke-direct/range {v0 .. v5}, Lcom/github/mikephil/charting/jobs/MoveViewJob;-><init>(Lcom/github/mikephil/charting/utils/ViewPortHandler;FFLcom/github/mikephil/charting/utils/Transformer;Landroid/view/View;)V

    .line 894
    .local v0, "job":Ljava/lang/Runnable;
    invoke-virtual {p0, v0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->addViewportJob(Ljava/lang/Runnable;)V

    .line 895
    return-void
.end method

.method public moveViewToAnimated(FFLcom/github/mikephil/charting/components/YAxis$AxisDependency;J)V
    .registers 18
    .param p1, "xIndex"    # F
    .param p2, "yValue"    # F
    .param p3, "axis"    # Lcom/github/mikephil/charting/components/YAxis$AxisDependency;
    .param p4, "duration"    # J
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 910
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xb

    if-lt v1, v2, :cond_41

    .line 912
    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentLeft()F

    move-result v1

    iget-object v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentTop()F

    move-result v2

    invoke-virtual {p0, v1, v2, p3}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getValuesByTouchPoint(FFLcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/PointD;

    move-result-object v10

    .line 914
    .local v10, "bounds":Lcom/github/mikephil/charting/utils/PointD;
    invoke-virtual {p0, p3}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getDeltaY(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)F

    move-result v1

    iget-object v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getScaleY()F

    move-result v2

    div-float v11, v1, v2

    .line 916
    .local v11, "valsInView":F
    new-instance v0, Lcom/github/mikephil/charting/jobs/AnimatedMoveViewJob;

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    const/high16 v2, 0x40000000    # 2.0f

    div-float v2, v11, v2

    add-float v3, p2, v2

    invoke-virtual {p0, p3}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getTransformer(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/Transformer;

    move-result-object v4

    iget-wide v5, v10, Lcom/github/mikephil/charting/utils/PointD;->x:D

    double-to-float v6, v5

    iget-wide v7, v10, Lcom/github/mikephil/charting/utils/PointD;->y:D

    double-to-float v7, v7

    move v2, p1

    move-object v5, p0

    move-wide/from16 v8, p4

    invoke-direct/range {v0 .. v9}, Lcom/github/mikephil/charting/jobs/AnimatedMoveViewJob;-><init>(Lcom/github/mikephil/charting/utils/ViewPortHandler;FFLcom/github/mikephil/charting/utils/Transformer;Landroid/view/View;FFJ)V

    .line 919
    .local v0, "job":Ljava/lang/Runnable;
    invoke-virtual {p0, v0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->addViewportJob(Ljava/lang/Runnable;)V

    .line 923
    .end local v0    # "job":Ljava/lang/Runnable;
    .end local v10    # "bounds":Lcom/github/mikephil/charting/utils/PointD;
    .end local v11    # "valsInView":F
    :goto_40
    return-void

    .line 921
    :cond_41
    const-string v1, "MPAndroidChart"

    const-string v2, "Unable to execute moveViewToAnimated(...) on API level < 11"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_40
.end method

.method public moveViewToX(F)V
    .registers 8
    .param p1, "xIndex"    # F

    .prologue
    .line 854
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    new-instance v0, Lcom/github/mikephil/charting/jobs/MoveViewJob;

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    const/4 v3, 0x0

    sget-object v2, Lcom/github/mikephil/charting/components/YAxis$AxisDependency;->LEFT:Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    invoke-virtual {p0, v2}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getTransformer(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/Transformer;

    move-result-object v4

    move v2, p1

    move-object v5, p0

    invoke-direct/range {v0 .. v5}, Lcom/github/mikephil/charting/jobs/MoveViewJob;-><init>(Lcom/github/mikephil/charting/utils/ViewPortHandler;FFLcom/github/mikephil/charting/utils/Transformer;Landroid/view/View;)V

    .line 857
    .local v0, "job":Ljava/lang/Runnable;
    invoke-virtual {p0, v0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->addViewportJob(Ljava/lang/Runnable;)V

    .line 858
    return-void
.end method

.method public moveViewToY(FLcom/github/mikephil/charting/components/YAxis$AxisDependency;)V
    .registers 10
    .param p1, "yValue"    # F
    .param p2, "axis"    # Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    .prologue
    .line 869
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    invoke-virtual {p0, p2}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getDeltaY(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)F

    move-result v1

    iget-object v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getScaleY()F

    move-result v2

    div-float v6, v1, v2

    .line 871
    .local v6, "valsInView":F
    new-instance v0, Lcom/github/mikephil/charting/jobs/MoveViewJob;

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    const/4 v2, 0x0

    const/high16 v3, 0x40000000    # 2.0f

    div-float v3, v6, v3

    add-float/2addr v3, p1

    invoke-virtual {p0, p2}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getTransformer(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/Transformer;

    move-result-object v4

    move-object v5, p0

    invoke-direct/range {v0 .. v5}, Lcom/github/mikephil/charting/jobs/MoveViewJob;-><init>(Lcom/github/mikephil/charting/utils/ViewPortHandler;FFLcom/github/mikephil/charting/utils/Transformer;Landroid/view/View;)V

    .line 874
    .local v0, "job":Ljava/lang/Runnable;
    invoke-virtual {p0, v0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->addViewportJob(Ljava/lang/Runnable;)V

    .line 875
    return-void
.end method

.method public notifyDataSetChanged()V
    .registers 4

    .prologue
    .line 333
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mData:Lcom/github/mikephil/charting/data/ChartData;

    if-nez v0, :cond_10

    .line 334
    iget-boolean v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mLogEnabled:Z

    if-eqz v0, :cond_f

    .line 335
    const-string v0, "MPAndroidChart"

    const-string v1, "Preparing... DATA NOT SET."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 356
    :cond_f
    :goto_f
    return-void

    .line 338
    :cond_10
    iget-boolean v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mLogEnabled:Z

    if-eqz v0, :cond_1b

    .line 339
    const-string v0, "MPAndroidChart"

    const-string v1, "Preparing..."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 342
    :cond_1b
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mRenderer:Lcom/github/mikephil/charting/renderer/DataRenderer;

    if-eqz v0, :cond_24

    .line 343
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mRenderer:Lcom/github/mikephil/charting/renderer/DataRenderer;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/renderer/DataRenderer;->initBuffers()V

    .line 345
    :cond_24
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->calcMinMax()V

    .line 347
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisRendererLeft:Lcom/github/mikephil/charting/renderer/YAxisRenderer;

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisLeft:Lcom/github/mikephil/charting/components/YAxis;

    iget v1, v1, Lcom/github/mikephil/charting/components/YAxis;->mAxisMinimum:F

    iget-object v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisLeft:Lcom/github/mikephil/charting/components/YAxis;

    iget v2, v2, Lcom/github/mikephil/charting/components/YAxis;->mAxisMaximum:F

    invoke-virtual {v0, v1, v2}, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->computeAxis(FF)V

    .line 348
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisRendererRight:Lcom/github/mikephil/charting/renderer/YAxisRenderer;

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisRight:Lcom/github/mikephil/charting/components/YAxis;

    iget v1, v1, Lcom/github/mikephil/charting/components/YAxis;->mAxisMinimum:F

    iget-object v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisRight:Lcom/github/mikephil/charting/components/YAxis;

    iget v2, v2, Lcom/github/mikephil/charting/components/YAxis;->mAxisMaximum:F

    invoke-virtual {v0, v1, v2}, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->computeAxis(FF)V

    .line 350
    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mXAxisRenderer:Lcom/github/mikephil/charting/renderer/XAxisRenderer;

    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mData:Lcom/github/mikephil/charting/data/ChartData;

    check-cast v0, Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;->getXValMaximumLength()F

    move-result v2

    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mData:Lcom/github/mikephil/charting/data/ChartData;

    check-cast v0, Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData;->getXVals()Ljava/util/List;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->computeAxis(FLjava/util/List;)V

    .line 352
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    if-eqz v0, :cond_61

    .line 353
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mLegendRenderer:Lcom/github/mikephil/charting/renderer/LegendRenderer;

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mData:Lcom/github/mikephil/charting/data/ChartData;

    invoke-virtual {v0, v1}, Lcom/github/mikephil/charting/renderer/LegendRenderer;->computeLegend(Lcom/github/mikephil/charting/data/ChartData;)V

    .line 355
    :cond_61
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->calculateOffsets()V

    goto :goto_f
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 15
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 195
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    invoke-super {p0, p1}, Lcom/github/mikephil/charting/charts/Chart;->onDraw(Landroid/graphics/Canvas;)V

    .line 197
    iget-object v9, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mData:Lcom/github/mikephil/charting/data/ChartData;

    if-nez v9, :cond_8

    .line 298
    :cond_7
    :goto_7
    return-void

    .line 200
    :cond_8
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    .line 201
    .local v7, "starttime":J
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->calcModulus()V

    .line 203
    iget-object v9, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mXAxisRenderer:Lcom/github/mikephil/charting/renderer/XAxisRenderer;

    iget-object v10, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget v10, v10, Lcom/github/mikephil/charting/components/XAxis;->mAxisLabelModulus:I

    invoke-virtual {v9, p0, v10}, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->calcXBounds(Lcom/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider;I)V

    .line 204
    iget-object v9, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mRenderer:Lcom/github/mikephil/charting/renderer/DataRenderer;

    iget-object v10, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget v10, v10, Lcom/github/mikephil/charting/components/XAxis;->mAxisLabelModulus:I

    invoke-virtual {v9, p0, v10}, Lcom/github/mikephil/charting/renderer/DataRenderer;->calcXBounds(Lcom/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider;I)V

    .line 207
    invoke-virtual {p0, p1}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->drawGridBackground(Landroid/graphics/Canvas;)V

    .line 209
    iget-object v9, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisLeft:Lcom/github/mikephil/charting/components/YAxis;

    invoke-virtual {v9}, Lcom/github/mikephil/charting/components/YAxis;->isEnabled()Z

    move-result v9

    if-eqz v9, :cond_39

    .line 210
    iget-object v9, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisRendererLeft:Lcom/github/mikephil/charting/renderer/YAxisRenderer;

    iget-object v10, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisLeft:Lcom/github/mikephil/charting/components/YAxis;

    iget v10, v10, Lcom/github/mikephil/charting/components/YAxis;->mAxisMinimum:F

    iget-object v11, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisLeft:Lcom/github/mikephil/charting/components/YAxis;

    iget v11, v11, Lcom/github/mikephil/charting/components/YAxis;->mAxisMaximum:F

    invoke-virtual {v9, v10, v11}, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->computeAxis(FF)V

    .line 211
    :cond_39
    iget-object v9, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisRight:Lcom/github/mikephil/charting/components/YAxis;

    invoke-virtual {v9}, Lcom/github/mikephil/charting/components/YAxis;->isEnabled()Z

    move-result v9

    if-eqz v9, :cond_4e

    .line 212
    iget-object v9, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisRendererRight:Lcom/github/mikephil/charting/renderer/YAxisRenderer;

    iget-object v10, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisRight:Lcom/github/mikephil/charting/components/YAxis;

    iget v10, v10, Lcom/github/mikephil/charting/components/YAxis;->mAxisMinimum:F

    iget-object v11, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisRight:Lcom/github/mikephil/charting/components/YAxis;

    iget v11, v11, Lcom/github/mikephil/charting/components/YAxis;->mAxisMaximum:F

    invoke-virtual {v9, v10, v11}, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->computeAxis(FF)V

    .line 214
    :cond_4e
    iget-object v9, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mXAxisRenderer:Lcom/github/mikephil/charting/renderer/XAxisRenderer;

    invoke-virtual {v9, p1}, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->renderAxisLine(Landroid/graphics/Canvas;)V

    .line 215
    iget-object v9, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisRendererLeft:Lcom/github/mikephil/charting/renderer/YAxisRenderer;

    invoke-virtual {v9, p1}, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->renderAxisLine(Landroid/graphics/Canvas;)V

    .line 216
    iget-object v9, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisRendererRight:Lcom/github/mikephil/charting/renderer/YAxisRenderer;

    invoke-virtual {v9, p1}, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->renderAxisLine(Landroid/graphics/Canvas;)V

    .line 218
    iget-boolean v9, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAutoScaleMinMaxEnabled:Z

    if-eqz v9, :cond_93

    .line 219
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getLowestVisibleXIndex()I

    move-result v6

    .line 220
    .local v6, "lowestVisibleXIndex":I
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getHighestVisibleXIndex()I

    move-result v5

    .line 222
    .local v5, "highestVisibleXIndex":I
    iget-object v9, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAutoScaleLastLowestVisibleXIndex:Ljava/lang/Integer;

    if-eqz v9, :cond_81

    iget-object v9, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAutoScaleLastLowestVisibleXIndex:Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    if-ne v9, v6, :cond_81

    iget-object v9, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAutoScaleLastHighestVisibleXIndex:Ljava/lang/Integer;

    if-eqz v9, :cond_81

    iget-object v9, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAutoScaleLastHighestVisibleXIndex:Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    if-eq v9, v5, :cond_93

    .line 227
    :cond_81
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->calcMinMax()V

    .line 228
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->calculateOffsets()V

    .line 230
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    iput-object v9, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAutoScaleLastLowestVisibleXIndex:Ljava/lang/Integer;

    .line 231
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    iput-object v9, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAutoScaleLastHighestVisibleXIndex:Ljava/lang/Integer;

    .line 237
    .end local v5    # "highestVisibleXIndex":I
    .end local v6    # "lowestVisibleXIndex":I
    :cond_93
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v2

    .line 238
    .local v2, "clipRestoreCount":I
    iget-object v9, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v9}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getContentRect()Landroid/graphics/RectF;

    move-result-object v9

    invoke-virtual {p1, v9}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/RectF;)Z

    .line 240
    iget-object v9, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mXAxisRenderer:Lcom/github/mikephil/charting/renderer/XAxisRenderer;

    invoke-virtual {v9, p1}, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->renderGridLines(Landroid/graphics/Canvas;)V

    .line 241
    iget-object v9, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisRendererLeft:Lcom/github/mikephil/charting/renderer/YAxisRenderer;

    invoke-virtual {v9, p1}, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->renderGridLines(Landroid/graphics/Canvas;)V

    .line 242
    iget-object v9, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisRendererRight:Lcom/github/mikephil/charting/renderer/YAxisRenderer;

    invoke-virtual {v9, p1}, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->renderGridLines(Landroid/graphics/Canvas;)V

    .line 244
    iget-object v9, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v9}, Lcom/github/mikephil/charting/components/XAxis;->isDrawLimitLinesBehindDataEnabled()Z

    move-result v9

    if-eqz v9, :cond_bc

    .line 245
    iget-object v9, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mXAxisRenderer:Lcom/github/mikephil/charting/renderer/XAxisRenderer;

    invoke-virtual {v9, p1}, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->renderLimitLines(Landroid/graphics/Canvas;)V

    .line 247
    :cond_bc
    iget-object v9, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisLeft:Lcom/github/mikephil/charting/components/YAxis;

    invoke-virtual {v9}, Lcom/github/mikephil/charting/components/YAxis;->isDrawLimitLinesBehindDataEnabled()Z

    move-result v9

    if-eqz v9, :cond_c9

    .line 248
    iget-object v9, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisRendererLeft:Lcom/github/mikephil/charting/renderer/YAxisRenderer;

    invoke-virtual {v9, p1}, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->renderLimitLines(Landroid/graphics/Canvas;)V

    .line 250
    :cond_c9
    iget-object v9, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisRight:Lcom/github/mikephil/charting/components/YAxis;

    invoke-virtual {v9}, Lcom/github/mikephil/charting/components/YAxis;->isDrawLimitLinesBehindDataEnabled()Z

    move-result v9

    if-eqz v9, :cond_d6

    .line 251
    iget-object v9, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisRendererRight:Lcom/github/mikephil/charting/renderer/YAxisRenderer;

    invoke-virtual {v9, p1}, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->renderLimitLines(Landroid/graphics/Canvas;)V

    .line 253
    :cond_d6
    iget-object v9, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mRenderer:Lcom/github/mikephil/charting/renderer/DataRenderer;

    invoke-virtual {v9, p1}, Lcom/github/mikephil/charting/renderer/DataRenderer;->drawData(Landroid/graphics/Canvas;)V

    .line 256
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->valuesToHighlight()Z

    move-result v9

    if-eqz v9, :cond_e8

    .line 257
    iget-object v9, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mRenderer:Lcom/github/mikephil/charting/renderer/DataRenderer;

    iget-object v10, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mIndicesToHighlight:[Lcom/github/mikephil/charting/highlight/Highlight;

    invoke-virtual {v9, p1, v10}, Lcom/github/mikephil/charting/renderer/DataRenderer;->drawHighlighted(Landroid/graphics/Canvas;[Lcom/github/mikephil/charting/highlight/Highlight;)V

    .line 260
    :cond_e8
    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 262
    iget-object v9, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mRenderer:Lcom/github/mikephil/charting/renderer/DataRenderer;

    invoke-virtual {v9, p1}, Lcom/github/mikephil/charting/renderer/DataRenderer;->drawExtras(Landroid/graphics/Canvas;)V

    .line 264
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v2

    .line 265
    iget-object v9, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v9}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getContentRect()Landroid/graphics/RectF;

    move-result-object v9

    invoke-virtual {p1, v9}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/RectF;)Z

    .line 267
    iget-object v9, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v9}, Lcom/github/mikephil/charting/components/XAxis;->isDrawLimitLinesBehindDataEnabled()Z

    move-result v9

    if-nez v9, :cond_10a

    .line 268
    iget-object v9, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mXAxisRenderer:Lcom/github/mikephil/charting/renderer/XAxisRenderer;

    invoke-virtual {v9, p1}, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->renderLimitLines(Landroid/graphics/Canvas;)V

    .line 270
    :cond_10a
    iget-object v9, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisLeft:Lcom/github/mikephil/charting/components/YAxis;

    invoke-virtual {v9}, Lcom/github/mikephil/charting/components/YAxis;->isDrawLimitLinesBehindDataEnabled()Z

    move-result v9

    if-nez v9, :cond_117

    .line 271
    iget-object v9, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisRendererLeft:Lcom/github/mikephil/charting/renderer/YAxisRenderer;

    invoke-virtual {v9, p1}, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->renderLimitLines(Landroid/graphics/Canvas;)V

    .line 273
    :cond_117
    iget-object v9, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisRight:Lcom/github/mikephil/charting/components/YAxis;

    invoke-virtual {v9}, Lcom/github/mikephil/charting/components/YAxis;->isDrawLimitLinesBehindDataEnabled()Z

    move-result v9

    if-nez v9, :cond_124

    .line 274
    iget-object v9, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisRendererRight:Lcom/github/mikephil/charting/renderer/YAxisRenderer;

    invoke-virtual {v9, p1}, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->renderLimitLines(Landroid/graphics/Canvas;)V

    .line 276
    :cond_124
    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 278
    iget-object v9, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mXAxisRenderer:Lcom/github/mikephil/charting/renderer/XAxisRenderer;

    invoke-virtual {v9, p1}, Lcom/github/mikephil/charting/renderer/XAxisRenderer;->renderAxisLabels(Landroid/graphics/Canvas;)V

    .line 279
    iget-object v9, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisRendererLeft:Lcom/github/mikephil/charting/renderer/YAxisRenderer;

    invoke-virtual {v9, p1}, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->renderAxisLabels(Landroid/graphics/Canvas;)V

    .line 280
    iget-object v9, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisRendererRight:Lcom/github/mikephil/charting/renderer/YAxisRenderer;

    invoke-virtual {v9, p1}, Lcom/github/mikephil/charting/renderer/YAxisRenderer;->renderAxisLabels(Landroid/graphics/Canvas;)V

    .line 282
    iget-object v9, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mRenderer:Lcom/github/mikephil/charting/renderer/DataRenderer;

    invoke-virtual {v9, p1}, Lcom/github/mikephil/charting/renderer/DataRenderer;->drawValues(Landroid/graphics/Canvas;)V

    .line 284
    iget-object v9, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mLegendRenderer:Lcom/github/mikephil/charting/renderer/LegendRenderer;

    invoke-virtual {v9, p1}, Lcom/github/mikephil/charting/renderer/LegendRenderer;->renderLegend(Landroid/graphics/Canvas;)V

    .line 286
    invoke-virtual {p0, p1}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->drawMarkers(Landroid/graphics/Canvas;)V

    .line 288
    invoke-virtual {p0, p1}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->drawDescription(Landroid/graphics/Canvas;)V

    .line 290
    iget-boolean v9, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mLogEnabled:Z

    if-eqz v9, :cond_7

    .line 291
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    sub-long v3, v9, v7

    .line 292
    .local v3, "drawtime":J
    iget-wide v9, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->totalTime:J

    add-long/2addr v9, v3

    iput-wide v9, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->totalTime:J

    .line 293
    iget-wide v9, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->drawCycles:J

    const-wide/16 v11, 0x1

    add-long/2addr v9, v11

    iput-wide v9, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->drawCycles:J

    .line 294
    iget-wide v9, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->totalTime:J

    iget-wide v11, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->drawCycles:J

    div-long v0, v9, v11

    .line 295
    .local v0, "average":J
    const-string v9, "MPAndroidChart"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Drawtime: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " ms, average: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " ms, cycles: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-wide v11, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->drawCycles:J

    invoke-virtual {v10, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_7
.end method

.method protected onSizeChanged(IIII)V
    .registers 9
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    const/4 v3, 0x1

    .line 1620
    const/4 v1, 0x2

    new-array v0, v1, [F

    .line 1621
    .local v0, "pts":[F
    iget-boolean v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mKeepPositionOnRotation:Z

    if-eqz v1, :cond_22

    .line 1622
    const/4 v1, 0x0

    iget-object v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentLeft()F

    move-result v2

    aput v2, v0, v1

    .line 1623
    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentTop()F

    move-result v1

    aput v1, v0, v3

    .line 1624
    sget-object v1, Lcom/github/mikephil/charting/components/YAxis$AxisDependency;->LEFT:Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    invoke-virtual {p0, v1}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getTransformer(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/Transformer;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/github/mikephil/charting/utils/Transformer;->pixelsToValue([F)V

    .line 1628
    :cond_22
    invoke-super {p0, p1, p2, p3, p4}, Lcom/github/mikephil/charting/charts/Chart;->onSizeChanged(IIII)V

    .line 1630
    iget-boolean v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mKeepPositionOnRotation:Z

    if-eqz v1, :cond_38

    .line 1633
    sget-object v1, Lcom/github/mikephil/charting/components/YAxis$AxisDependency;->LEFT:Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    invoke-virtual {p0, v1}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getTransformer(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/Transformer;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/github/mikephil/charting/utils/Transformer;->pointValuesToPixel([F)V

    .line 1634
    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v1, v0, p0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->centerViewPort([FLandroid/view/View;)V

    .line 1638
    :goto_37
    return-void

    .line 1636
    :cond_38
    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    iget-object v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getMatrixTouch()Landroid/graphics/Matrix;

    move-result-object v2

    invoke-virtual {v1, v2, p0, v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->refresh(Landroid/graphics/Matrix;Landroid/view/View;Z)Landroid/graphics/Matrix;

    goto :goto_37
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 4
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    const/4 v0, 0x0

    .line 647
    invoke-super {p0, p1}, Lcom/github/mikephil/charting/charts/Chart;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 649
    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mChartTouchListener:Lcom/github/mikephil/charting/listener/ChartTouchListener;

    if-eqz v1, :cond_c

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mData:Lcom/github/mikephil/charting/data/ChartData;

    if-nez v1, :cond_d

    .line 656
    :cond_c
    :goto_c
    return v0

    .line 653
    :cond_d
    iget-boolean v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mTouchEnabled:Z

    if-eqz v1, :cond_c

    .line 656
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mChartTouchListener:Lcom/github/mikephil/charting/listener/ChartTouchListener;

    invoke-virtual {v0, p0, p1}, Lcom/github/mikephil/charting/listener/ChartTouchListener;->onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result v0

    goto :goto_c
.end method

.method protected prepareOffsetMatrix()V
    .registers 3

    .prologue
    .line 326
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mRightAxisTransformer:Lcom/github/mikephil/charting/utils/Transformer;

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisRight:Lcom/github/mikephil/charting/components/YAxis;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/components/YAxis;->isInverted()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/github/mikephil/charting/utils/Transformer;->prepareMatrixOffset(Z)V

    .line 327
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mLeftAxisTransformer:Lcom/github/mikephil/charting/utils/Transformer;

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisLeft:Lcom/github/mikephil/charting/components/YAxis;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/components/YAxis;->isInverted()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/github/mikephil/charting/utils/Transformer;->prepareMatrixOffset(Z)V

    .line 328
    return-void
.end method

.method protected prepareValuePxMatrix()V
    .registers 6

    .prologue
    .line 310
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iget-boolean v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mLogEnabled:Z

    if-eqz v0, :cond_3c

    .line 311
    const-string v0, "MPAndroidChart"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Preparing Value-Px Matrix, xmin: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget v2, v2, Lcom/github/mikephil/charting/components/XAxis;->mAxisMinimum:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", xmax: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget v2, v2, Lcom/github/mikephil/charting/components/XAxis;->mAxisMaximum:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", xdelta: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget v2, v2, Lcom/github/mikephil/charting/components/XAxis;->mAxisRange:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 314
    :cond_3c
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mRightAxisTransformer:Lcom/github/mikephil/charting/utils/Transformer;

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget v1, v1, Lcom/github/mikephil/charting/components/XAxis;->mAxisMinimum:F

    iget-object v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget v2, v2, Lcom/github/mikephil/charting/components/XAxis;->mAxisRange:F

    iget-object v3, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisRight:Lcom/github/mikephil/charting/components/YAxis;

    iget v3, v3, Lcom/github/mikephil/charting/components/YAxis;->mAxisRange:F

    iget-object v4, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisRight:Lcom/github/mikephil/charting/components/YAxis;

    iget v4, v4, Lcom/github/mikephil/charting/components/YAxis;->mAxisMinimum:F

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/github/mikephil/charting/utils/Transformer;->prepareMatrixValuePx(FFFF)V

    .line 318
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mLeftAxisTransformer:Lcom/github/mikephil/charting/utils/Transformer;

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget v1, v1, Lcom/github/mikephil/charting/components/XAxis;->mAxisMinimum:F

    iget-object v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget v2, v2, Lcom/github/mikephil/charting/components/XAxis;->mAxisRange:F

    iget-object v3, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisLeft:Lcom/github/mikephil/charting/components/YAxis;

    iget v3, v3, Lcom/github/mikephil/charting/components/YAxis;->mAxisRange:F

    iget-object v4, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisLeft:Lcom/github/mikephil/charting/components/YAxis;

    iget v4, v4, Lcom/github/mikephil/charting/components/YAxis;->mAxisMinimum:F

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/github/mikephil/charting/utils/Transformer;->prepareMatrixValuePx(FFFF)V

    .line 322
    return-void
.end method

.method public resetTracking()V
    .registers 3

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    const-wide/16 v0, 0x0

    .line 304
    iput-wide v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->totalTime:J

    .line 305
    iput-wide v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->drawCycles:J

    .line 306
    return-void
.end method

.method public resetViewPortOffsets()V
    .registers 2

    .prologue
    .line 1013
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mCustomViewPortEnabled:Z

    .line 1014
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->calculateOffsets()V

    .line 1015
    return-void
.end method

.method public setAutoScaleMinMaxEnabled(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 1580
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iput-boolean p1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAutoScaleMinMaxEnabled:Z

    .line 1581
    return-void
.end method

.method public setBorderColor(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 1228
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mBorderPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 1229
    return-void
.end method

.method public setBorderWidth(F)V
    .registers 4
    .param p1, "width"    # F

    .prologue
    .line 1219
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mBorderPaint:Landroid/graphics/Paint;

    invoke-static {p1}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 1220
    return-void
.end method

.method public setDoubleTapToZoomEnabled(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 1182
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iput-boolean p1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mDoubleTapToZoomEnabled:Z

    .line 1183
    return-void
.end method

.method public setDragEnabled(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 1136
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iput-boolean p1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mDragEnabled:Z

    .line 1137
    return-void
.end method

.method public setDragOffsetX(F)V
    .registers 3
    .param p1, "offset"    # F

    .prologue
    .line 1487
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v0, p1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->setDragOffsetX(F)V

    .line 1488
    return-void
.end method

.method public setDragOffsetY(F)V
    .registers 3
    .param p1, "offset"    # F

    .prologue
    .line 1497
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v0, p1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->setDragOffsetY(F)V

    .line 1498
    return-void
.end method

.method public setDrawBorders(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 1210
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iput-boolean p1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mDrawBorders:Z

    .line 1211
    return-void
.end method

.method public setDrawGridBackground(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 1200
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iput-boolean p1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mDrawGridBackground:Z

    .line 1201
    return-void
.end method

.method public setGridBackgroundColor(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 1126
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mGridBackgroundPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 1127
    return-void
.end method

.method public setHighlightFullBarEnabled(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 1109
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iput-boolean p1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mHighlightFullBarEnabled:Z

    .line 1110
    return-void
.end method

.method public setHighlightPerDragEnabled(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 1095
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iput-boolean p1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mHighlightPerDragEnabled:Z

    .line 1096
    return-void
.end method

.method public setKeepPositionOnRotation(Z)V
    .registers 2
    .param p1, "keepPositionOnRotation"    # Z

    .prologue
    .line 1256
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iput-boolean p1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mKeepPositionOnRotation:Z

    .line 1257
    return-void
.end method

.method public setMaxVisibleValueCount(I)V
    .registers 2
    .param p1, "count"    # I

    .prologue
    .line 1081
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iput p1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mMaxVisibleCount:I

    .line 1082
    return-void
.end method

.method public setMinOffset(F)V
    .registers 2
    .param p1, "minOffset"    # F

    .prologue
    .line 1242
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iput p1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mMinOffset:F

    .line 1243
    return-void
.end method

.method public setOnDrawListener(Lcom/github/mikephil/charting/listener/OnDrawListener;)V
    .registers 2
    .param p1, "drawListener"    # Lcom/github/mikephil/charting/listener/OnDrawListener;

    .prologue
    .line 1041
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iput-object p1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mDrawListener:Lcom/github/mikephil/charting/listener/OnDrawListener;

    .line 1042
    return-void
.end method

.method public setPaint(Landroid/graphics/Paint;I)V
    .registers 3
    .param p1, "p"    # Landroid/graphics/Paint;
    .param p2, "which"    # I

    .prologue
    .line 1593
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    invoke-super {p0, p1, p2}, Lcom/github/mikephil/charting/charts/Chart;->setPaint(Landroid/graphics/Paint;I)V

    .line 1595
    packed-switch p2, :pswitch_data_a

    .line 1600
    :goto_6
    return-void

    .line 1597
    :pswitch_7
    iput-object p1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mGridBackgroundPaint:Landroid/graphics/Paint;

    goto :goto_6

    .line 1595
    :pswitch_data_a
    .packed-switch 0x4
        :pswitch_7
    .end packed-switch
.end method

.method public setPinchZoom(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 1468
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iput-boolean p1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mPinchZoomEnabled:Z

    .line 1469
    return-void
.end method

.method public setRendererLeftYAxis(Lcom/github/mikephil/charting/renderer/YAxisRenderer;)V
    .registers 2
    .param p1, "rendererLeftYAxis"    # Lcom/github/mikephil/charting/renderer/YAxisRenderer;

    .prologue
    .line 1532
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iput-object p1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisRendererLeft:Lcom/github/mikephil/charting/renderer/YAxisRenderer;

    .line 1533
    return-void
.end method

.method public setRendererRightYAxis(Lcom/github/mikephil/charting/renderer/YAxisRenderer;)V
    .registers 2
    .param p1, "rendererRightYAxis"    # Lcom/github/mikephil/charting/renderer/YAxisRenderer;

    .prologue
    .line 1545
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iput-object p1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mAxisRendererRight:Lcom/github/mikephil/charting/renderer/YAxisRenderer;

    .line 1546
    return-void
.end method

.method public setScaleEnabled(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 1155
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iput-boolean p1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mScaleXEnabled:Z

    .line 1156
    iput-boolean p1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mScaleYEnabled:Z

    .line 1157
    return-void
.end method

.method public setScaleMinima(FF)V
    .registers 4
    .param p1, "scaleX"    # F
    .param p2, "scaleY"    # F

    .prologue
    .line 789
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v0, p1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->setMinimumScaleX(F)V

    .line 790
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v0, p2}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->setMinimumScaleY(F)V

    .line 791
    return-void
.end method

.method public setScaleXEnabled(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 1160
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iput-boolean p1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mScaleXEnabled:Z

    .line 1161
    return-void
.end method

.method public setScaleYEnabled(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 1164
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iput-boolean p1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mScaleYEnabled:Z

    .line 1165
    return-void
.end method

.method public setViewPortOffsets(FFFF)V
    .registers 11
    .param p1, "left"    # F
    .param p2, "top"    # F
    .param p3, "right"    # F
    .param p4, "bottom"    # F

    .prologue
    .line 995
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mCustomViewPortEnabled:Z

    .line 996
    new-instance v0, Lcom/github/mikephil/charting/charts/BarLineChartBase$1;

    move-object v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/github/mikephil/charting/charts/BarLineChartBase$1;-><init>(Lcom/github/mikephil/charting/charts/BarLineChartBase;FFFF)V

    invoke-virtual {p0, v0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->post(Ljava/lang/Runnable;)Z

    .line 1006
    return-void
.end method

.method public setVisibleXRange(FF)V
    .registers 6
    .param p1, "minXRange"    # F
    .param p2, "maxXRange"    # F

    .prologue
    .line 829
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iget-object v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget v2, v2, Lcom/github/mikephil/charting/components/XAxis;->mAxisRange:F

    div-float v0, v2, p1

    .line 830
    .local v0, "maxScale":F
    iget-object v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget v2, v2, Lcom/github/mikephil/charting/components/XAxis;->mAxisRange:F

    div-float v1, v2, p2

    .line 831
    .local v1, "minScale":F
    iget-object v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v2, v1, v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->setMinMaxScaleX(FF)V

    .line 832
    return-void
.end method

.method public setVisibleXRangeMaximum(F)V
    .registers 4
    .param p1, "maxXRange"    # F

    .prologue
    .line 802
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget v1, v1, Lcom/github/mikephil/charting/components/XAxis;->mAxisRange:F

    div-float v0, v1, p1

    .line 803
    .local v0, "xScale":F
    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v1, v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->setMinimumScaleX(F)V

    .line 804
    return-void
.end method

.method public setVisibleXRangeMinimum(F)V
    .registers 4
    .param p1, "minXRange"    # F

    .prologue
    .line 815
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget v1, v1, Lcom/github/mikephil/charting/components/XAxis;->mAxisRange:F

    div-float v0, v1, p1

    .line 816
    .local v0, "xScale":F
    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v1, v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->setMaximumScaleX(F)V

    .line 817
    return-void
.end method

.method public setVisibleYRangeMaximum(FLcom/github/mikephil/charting/components/YAxis$AxisDependency;)V
    .registers 5
    .param p1, "maxYRange"    # F
    .param p2, "axis"    # Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    .prologue
    .line 842
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    invoke-virtual {p0, p2}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getDeltaY(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)F

    move-result v1

    div-float v0, v1, p1

    .line 843
    .local v0, "yScale":F
    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v1, v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->setMinimumScaleY(F)V

    .line 844
    return-void
.end method

.method public setXAxisRenderer(Lcom/github/mikephil/charting/renderer/XAxisRenderer;)V
    .registers 2
    .param p1, "xAxisRenderer"    # Lcom/github/mikephil/charting/renderer/XAxisRenderer;

    .prologue
    .line 1519
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iput-object p1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mXAxisRenderer:Lcom/github/mikephil/charting/renderer/XAxisRenderer;

    .line 1520
    return-void
.end method

.method public zoom(FFFF)V
    .registers 8
    .param p1, "scaleX"    # F
    .param p2, "scaleY"    # F
    .param p3, "x"    # F
    .param p4, "y"    # F

    .prologue
    .line 718
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v1, p1, p2, p3, p4}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->zoom(FFFF)Landroid/graphics/Matrix;

    move-result-object v0

    .line 719
    .local v0, "save":Landroid/graphics/Matrix;
    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    const/4 v2, 0x0

    invoke-virtual {v1, v0, p0, v2}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->refresh(Landroid/graphics/Matrix;Landroid/view/View;Z)Landroid/graphics/Matrix;

    .line 724
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->calculateOffsets()V

    .line 725
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->postInvalidate()V

    .line 726
    return-void
.end method

.method public zoom(FFFFLcom/github/mikephil/charting/components/YAxis$AxisDependency;)V
    .registers 15
    .param p1, "scaleX"    # F
    .param p2, "scaleY"    # F
    .param p3, "xValue"    # F
    .param p4, "yValue"    # F
    .param p5, "axis"    # Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    .prologue
    .line 740
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    new-instance v0, Lcom/github/mikephil/charting/jobs/ZoomJob;

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {p0, p5}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getTransformer(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/Transformer;

    move-result-object v6

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move-object v7, p5

    move-object v8, p0

    invoke-direct/range {v0 .. v8}, Lcom/github/mikephil/charting/jobs/ZoomJob;-><init>(Lcom/github/mikephil/charting/utils/ViewPortHandler;FFFFLcom/github/mikephil/charting/utils/Transformer;Lcom/github/mikephil/charting/components/YAxis$AxisDependency;Landroid/view/View;)V

    .line 741
    .local v0, "job":Ljava/lang/Runnable;
    invoke-virtual {p0, v0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->addViewportJob(Ljava/lang/Runnable;)V

    .line 742
    return-void
.end method

.method public zoomAndCenterAnimated(FFFFLcom/github/mikephil/charting/components/YAxis$AxisDependency;J)V
    .registers 27
    .param p1, "scaleX"    # F
    .param p2, "scaleY"    # F
    .param p3, "xValue"    # F
    .param p4, "yValue"    # F
    .param p5, "axis"    # Lcom/github/mikephil/charting/components/YAxis$AxisDependency;
    .param p6, "duration"    # J
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 757
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0xb

    if-lt v3, v4, :cond_70

    .line 759
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentLeft()F

    move-result v3

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentTop()F

    move-result v4

    move-object/from16 v0, p0

    move-object/from16 v1, p5

    invoke-virtual {v0, v3, v4, v1}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getValuesByTouchPoint(FFLcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/PointD;

    move-result-object v18

    .line 761
    .local v18, "origin":Lcom/github/mikephil/charting/utils/PointD;
    new-instance v2, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    move-object/from16 v0, p0

    move-object/from16 v1, p5

    invoke-virtual {v0, v1}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getTransformer(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/utils/Transformer;

    move-result-object v5

    move-object/from16 v0, p0

    move-object/from16 v1, p5

    invoke-virtual {v0, v1}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getAxis(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/components/YAxis;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/components/XAxis;->getValues()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    int-to-float v7, v4

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getScaleX()F

    move-result v10

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getScaleY()F

    move-result v11

    move-object/from16 v0, v18

    iget-wide v8, v0, Lcom/github/mikephil/charting/utils/PointD;->x:D

    double-to-float v14, v8

    move-object/from16 v0, v18

    iget-wide v8, v0, Lcom/github/mikephil/charting/utils/PointD;->y:D

    double-to-float v15, v8

    move-object/from16 v4, p0

    move/from16 v8, p1

    move/from16 v9, p2

    move/from16 v12, p3

    move/from16 v13, p4

    move-wide/from16 v16, p6

    invoke-direct/range {v2 .. v17}, Lcom/github/mikephil/charting/jobs/AnimatedZoomJob;-><init>(Lcom/github/mikephil/charting/utils/ViewPortHandler;Landroid/view/View;Lcom/github/mikephil/charting/utils/Transformer;Lcom/github/mikephil/charting/components/YAxis;FFFFFFFFFJ)V

    .line 762
    .local v2, "job":Ljava/lang/Runnable;
    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->addViewportJob(Ljava/lang/Runnable;)V

    .line 767
    .end local v2    # "job":Ljava/lang/Runnable;
    .end local v18    # "origin":Lcom/github/mikephil/charting/utils/PointD;
    :goto_6f
    return-void

    .line 765
    :cond_70
    const-string v3, "MPAndroidChart"

    const-string v4, "Unable to execute zoomAndCenterAnimated(...) on API level < 11"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_6f
.end method

.method public zoomIn()V
    .registers 6

    .prologue
    .line 679
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iget-object v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getContentCenter()Landroid/graphics/PointF;

    move-result-object v0

    .line 681
    .local v0, "center":Landroid/graphics/PointF;
    iget-object v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    iget v3, v0, Landroid/graphics/PointF;->x:F

    iget v4, v0, Landroid/graphics/PointF;->y:F

    neg-float v4, v4

    invoke-virtual {v2, v3, v4}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->zoomIn(FF)Landroid/graphics/Matrix;

    move-result-object v1

    .line 682
    .local v1, "save":Landroid/graphics/Matrix;
    iget-object v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    const/4 v3, 0x0

    invoke-virtual {v2, v1, p0, v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->refresh(Landroid/graphics/Matrix;Landroid/view/View;Z)Landroid/graphics/Matrix;

    .line 687
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->calculateOffsets()V

    .line 688
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->postInvalidate()V

    .line 689
    return-void
.end method

.method public zoomOut()V
    .registers 6

    .prologue
    .line 696
    .local p0, "this":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<TT;>;"
    iget-object v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getContentCenter()Landroid/graphics/PointF;

    move-result-object v0

    .line 698
    .local v0, "center":Landroid/graphics/PointF;
    iget-object v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    iget v3, v0, Landroid/graphics/PointF;->x:F

    iget v4, v0, Landroid/graphics/PointF;->y:F

    neg-float v4, v4

    invoke-virtual {v2, v3, v4}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->zoomOut(FF)Landroid/graphics/Matrix;

    move-result-object v1

    .line 699
    .local v1, "save":Landroid/graphics/Matrix;
    iget-object v2, p0, Lcom/github/mikephil/charting/charts/BarLineChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    const/4 v3, 0x0

    invoke-virtual {v2, v1, p0, v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->refresh(Landroid/graphics/Matrix;Landroid/view/View;Z)Landroid/graphics/Matrix;

    .line 704
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->calculateOffsets()V

    .line 705
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->postInvalidate()V

    .line 706
    return-void
.end method
