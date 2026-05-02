.class public abstract Lcom/github/mikephil/charting/renderer/Renderer;
.super Ljava/lang/Object;
.source "Renderer.java"


# instance fields
.field protected mMaxX:I

.field protected mMinX:I

.field protected mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;


# direct methods
.method public constructor <init>(Lcom/github/mikephil/charting/utils/ViewPortHandler;)V
    .registers 3
    .param p1, "viewPortHandler"    # Lcom/github/mikephil/charting/utils/ViewPortHandler;

    .prologue
    const/4 v0, 0x0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput v0, p0, Lcom/github/mikephil/charting/renderer/Renderer;->mMinX:I

    .line 23
    iput v0, p0, Lcom/github/mikephil/charting/renderer/Renderer;->mMaxX:I

    .line 26
    iput-object p1, p0, Lcom/github/mikephil/charting/renderer/Renderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    .line 27
    return-void
.end method


# virtual methods
.method public calcXBounds(Lcom/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider;I)V
    .registers 8
    .param p1, "dataProvider"    # Lcom/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider;
    .param p2, "xAxisModulus"    # I

    .prologue
    const/4 v3, 0x0

    .line 55
    invoke-interface {p1}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider;->getLowestVisibleXIndex()I

    move-result v1

    .line 56
    .local v1, "low":I
    invoke-interface {p1}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider;->getHighestVisibleXIndex()I

    move-result v0

    .line 58
    .local v0, "high":I
    rem-int v4, v1, p2

    if-nez v4, :cond_28

    move v2, p2

    .line 60
    .local v2, "subLow":I
    :goto_e
    div-int v4, v1, p2

    mul-int/2addr v4, p2

    sub-int/2addr v4, v2

    invoke-static {v4, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    iput v3, p0, Lcom/github/mikephil/charting/renderer/Renderer;->mMinX:I

    .line 61
    div-int v3, v0, p2

    mul-int/2addr v3, p2

    add-int/2addr v3, p2

    invoke-interface {p1}, Lcom/github/mikephil/charting/interfaces/dataprovider/BarLineScatterCandleBubbleDataProvider;->getXChartMax()F

    move-result v4

    float-to-int v4, v4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    iput v3, p0, Lcom/github/mikephil/charting/renderer/Renderer;->mMaxX:I

    .line 62
    return-void

    .end local v2    # "subLow":I
    :cond_28
    move v2, v3

    .line 58
    goto :goto_e
.end method

.method protected fitsBounds(FFF)Z
    .registers 5
    .param p1, "val"    # F
    .param p2, "min"    # F
    .param p3, "max"    # F

    .prologue
    .line 40
    cmpg-float v0, p1, p2

    if-ltz v0, :cond_8

    cmpl-float v0, p1, p3

    if-lez v0, :cond_a

    .line 41
    :cond_8
    const/4 v0, 0x0

    .line 43
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x1

    goto :goto_9
.end method
