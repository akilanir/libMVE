.class public Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;
.super Lcom/github/mikephil/charting/listener/ChartTouchListener;
.source "BarLineChartTouchListener.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/github/mikephil/charting/listener/ChartTouchListener",
        "<",
        "Lcom/github/mikephil/charting/charts/BarLineChartBase",
        "<+",
        "Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData",
        "<+",
        "Lcom/github/mikephil/charting/interfaces/datasets/IBarLineScatterCandleBubbleDataSet",
        "<+",
        "Lcom/github/mikephil/charting/data/Entry;",
        ">;>;>;>;"
    }
.end annotation


# instance fields
.field private mClosestDataSetToTouch:Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

.field private mDecelerationCurrentPoint:Landroid/graphics/PointF;

.field private mDecelerationLastTime:J

.field private mDecelerationVelocity:Landroid/graphics/PointF;

.field private mDragTriggerDist:F

.field private mMatrix:Landroid/graphics/Matrix;

.field private mMinScalePointerDistance:F

.field private mSavedDist:F

.field private mSavedMatrix:Landroid/graphics/Matrix;

.field private mSavedXDist:F

.field private mSavedYDist:F

.field private mTouchPointCenter:Landroid/graphics/PointF;

.field private mTouchStartPoint:Landroid/graphics/PointF;

.field private mVelocityTracker:Landroid/view/VelocityTracker;


# direct methods
.method public constructor <init>(Lcom/github/mikephil/charting/charts/BarLineChartBase;Landroid/graphics/Matrix;)V
    .registers 5
    .param p2, "touchMatrix"    # Landroid/graphics/Matrix;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/github/mikephil/charting/charts/BarLineChartBase",
            "<+",
            "Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData",
            "<+",
            "Lcom/github/mikephil/charting/interfaces/datasets/IBarLineScatterCandleBubbleDataSet",
            "<+",
            "Lcom/github/mikephil/charting/data/Entry;",
            ">;>;>;",
            "Landroid/graphics/Matrix;",
            ")V"
        }
    .end annotation

    .prologue
    .local p1, "chart":Lcom/github/mikephil/charting/charts/BarLineChartBase;, "Lcom/github/mikephil/charting/charts/BarLineChartBase<+Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleData<+Lcom/github/mikephil/charting/interfaces/datasets/IBarLineScatterCandleBubbleDataSet<+Lcom/github/mikephil/charting/data/Entry;>;>;>;"
    const/high16 v1, 0x3f800000    # 1.0f

    .line 77
    invoke-direct {p0, p1}, Lcom/github/mikephil/charting/listener/ChartTouchListener;-><init>(Lcom/github/mikephil/charting/charts/Chart;)V

    .line 34
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mMatrix:Landroid/graphics/Matrix;

    .line 39
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mSavedMatrix:Landroid/graphics/Matrix;

    .line 44
    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mTouchStartPoint:Landroid/graphics/PointF;

    .line 49
    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mTouchPointCenter:Landroid/graphics/PointF;

    .line 51
    iput v1, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mSavedXDist:F

    .line 52
    iput v1, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mSavedYDist:F

    .line 53
    iput v1, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mSavedDist:F

    .line 62
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mDecelerationLastTime:J

    .line 63
    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mDecelerationCurrentPoint:Landroid/graphics/PointF;

    .line 64
    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mDecelerationVelocity:Landroid/graphics/PointF;

    .line 78
    iput-object p2, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mMatrix:Landroid/graphics/Matrix;

    .line 81
    const/high16 v0, 0x40400000    # 3.0f

    invoke-static {v0}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mDragTriggerDist:F

    .line 83
    const/high16 v0, 0x40600000    # 3.5f

    invoke-static {v0}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mMinScalePointerDistance:F

    .line 84
    return-void
.end method

.method private static getXDist(Landroid/view/MotionEvent;)F
    .registers 4
    .param p0, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 460
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v1

    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v2

    sub-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v0

    .line 461
    .local v0, "x":F
    return v0
.end method

.method private static getYDist(Landroid/view/MotionEvent;)F
    .registers 4
    .param p0, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 472
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v1

    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result v2

    sub-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v0

    .line 473
    .local v0, "y":F
    return v0
.end method

.method private static midPoint(Landroid/graphics/PointF;Landroid/view/MotionEvent;)V
    .registers 9
    .param p0, "point"    # Landroid/graphics/PointF;
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    const/high16 v4, 0x40000000    # 2.0f

    .line 435
    invoke-virtual {p1, v5}, Landroid/view/MotionEvent;->getX(I)F

    move-result v2

    invoke-virtual {p1, v6}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    add-float v0, v2, v3

    .line 436
    .local v0, "x":F
    invoke-virtual {p1, v5}, Landroid/view/MotionEvent;->getY(I)F

    move-result v2

    invoke-virtual {p1, v6}, Landroid/view/MotionEvent;->getY(I)F

    move-result v3

    add-float v1, v2, v3

    .line 437
    .local v1, "y":F
    div-float v2, v0, v4

    div-float v3, v1, v4

    invoke-virtual {p0, v2, v3}, Landroid/graphics/PointF;->set(FF)V

    .line 438
    return-void
.end method

.method private performDrag(Landroid/view/MotionEvent;)V
    .registers 7
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 281
    sget-object v3, Lcom/github/mikephil/charting/listener/ChartTouchListener$ChartGesture;->DRAG:Lcom/github/mikephil/charting/listener/ChartTouchListener$ChartGesture;

    iput-object v3, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mLastGesture:Lcom/github/mikephil/charting/listener/ChartTouchListener$ChartGesture;

    .line 283
    iget-object v3, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mMatrix:Landroid/graphics/Matrix;

    iget-object v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mSavedMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v3, v4}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 285
    iget-object v3, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mChart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v3, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getOnChartGestureListener()Lcom/github/mikephil/charting/listener/OnChartGestureListener;

    move-result-object v2

    .line 290
    .local v2, "l":Lcom/github/mikephil/charting/listener/OnChartGestureListener;
    iget-object v3, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mChart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v3, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->isAnyAxisInverted()Z

    move-result v3

    if-eqz v3, :cond_6f

    iget-object v3, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mClosestDataSetToTouch:Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    if-eqz v3, :cond_6f

    iget-object v3, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mChart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v3, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    iget-object v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mClosestDataSetToTouch:Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    invoke-interface {v4}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getAxisDependency()Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getAxis(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Lcom/github/mikephil/charting/components/YAxis;

    move-result-object v3

    invoke-virtual {v3}, Lcom/github/mikephil/charting/components/YAxis;->isInverted()Z

    move-result v3

    if-eqz v3, :cond_6f

    .line 294
    iget-object v3, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mChart:Lcom/github/mikephil/charting/charts/Chart;

    instance-of v3, v3, Lcom/github/mikephil/charting/charts/HorizontalBarChart;

    if-eqz v3, :cond_5a

    .line 295
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    iget-object v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mTouchStartPoint:Landroid/graphics/PointF;

    iget v4, v4, Landroid/graphics/PointF;->x:F

    sub-float/2addr v3, v4

    neg-float v0, v3

    .line 296
    .local v0, "dX":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    iget-object v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mTouchStartPoint:Landroid/graphics/PointF;

    iget v4, v4, Landroid/graphics/PointF;->y:F

    sub-float v1, v3, v4

    .line 306
    .local v1, "dY":F
    :goto_4f
    iget-object v3, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v3, v0, v1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 308
    if-eqz v2, :cond_59

    .line 309
    invoke-interface {v2, p1, v0, v1}, Lcom/github/mikephil/charting/listener/OnChartGestureListener;->onChartTranslate(Landroid/view/MotionEvent;FF)V

    .line 310
    :cond_59
    return-void

    .line 298
    .end local v0    # "dX":F
    .end local v1    # "dY":F
    :cond_5a
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    iget-object v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mTouchStartPoint:Landroid/graphics/PointF;

    iget v4, v4, Landroid/graphics/PointF;->x:F

    sub-float v0, v3, v4

    .line 299
    .restart local v0    # "dX":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    iget-object v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mTouchStartPoint:Landroid/graphics/PointF;

    iget v4, v4, Landroid/graphics/PointF;->y:F

    sub-float/2addr v3, v4

    neg-float v1, v3

    .restart local v1    # "dY":F
    goto :goto_4f

    .line 302
    .end local v0    # "dX":F
    .end local v1    # "dY":F
    :cond_6f
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    iget-object v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mTouchStartPoint:Landroid/graphics/PointF;

    iget v4, v4, Landroid/graphics/PointF;->x:F

    sub-float v0, v3, v4

    .line 303
    .restart local v0    # "dX":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    iget-object v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mTouchStartPoint:Landroid/graphics/PointF;

    iget v4, v4, Landroid/graphics/PointF;->y:F

    sub-float v1, v3, v4

    .restart local v1    # "dY":F
    goto :goto_4f
.end method

.method private performHighlightDrag(Landroid/view/MotionEvent;)V
    .registers 6
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 414
    iget-object v1, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mChart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v1, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    invoke-virtual {v1, v2, v3}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getHighlightByTouchPoint(FF)Lcom/github/mikephil/charting/highlight/Highlight;

    move-result-object v0

    .line 416
    .local v0, "h":Lcom/github/mikephil/charting/highlight/Highlight;
    if-eqz v0, :cond_24

    iget-object v1, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mLastHighlighted:Lcom/github/mikephil/charting/highlight/Highlight;

    invoke-virtual {v0, v1}, Lcom/github/mikephil/charting/highlight/Highlight;->equalTo(Lcom/github/mikephil/charting/highlight/Highlight;)Z

    move-result v1

    if-nez v1, :cond_24

    .line 417
    iput-object v0, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mLastHighlighted:Lcom/github/mikephil/charting/highlight/Highlight;

    .line 418
    iget-object v1, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mChart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v1, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    const/4 v2, 0x1

    invoke-virtual {v1, v0, v2}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->highlightValue(Lcom/github/mikephil/charting/highlight/Highlight;Z)V

    .line 420
    :cond_24
    return-void
.end method

.method private performZoom(Landroid/view/MotionEvent;)V
    .registers 19
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 319
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v13

    const/4 v14, 0x2

    if-lt v13, v14, :cond_9a

    .line 321
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mChart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v13, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v13}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getOnChartGestureListener()Lcom/github/mikephil/charting/listener/OnChartGestureListener;

    move-result-object v5

    .line 324
    .local v5, "l":Lcom/github/mikephil/charting/listener/OnChartGestureListener;
    invoke-static/range {p1 .. p1}, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->spacing(Landroid/view/MotionEvent;)F

    move-result v10

    .line 326
    .local v10, "totalDist":F
    move-object/from16 v0, p0

    iget v13, v0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mMinScalePointerDistance:F

    cmpl-float v13, v10, v13

    if-lez v13, :cond_9a

    .line 329
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mTouchPointCenter:Landroid/graphics/PointF;

    iget v13, v13, Landroid/graphics/PointF;->x:F

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mTouchPointCenter:Landroid/graphics/PointF;

    iget v14, v14, Landroid/graphics/PointF;->y:F

    move-object/from16 v0, p0

    invoke-virtual {v0, v13, v14}, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->getTrans(FF)Landroid/graphics/PointF;

    move-result-object v9

    .line 330
    .local v9, "t":Landroid/graphics/PointF;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mChart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v13, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v13}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getViewPortHandler()Lcom/github/mikephil/charting/utils/ViewPortHandler;

    move-result-object v3

    .line 333
    .local v3, "h":Lcom/github/mikephil/charting/utils/ViewPortHandler;
    move-object/from16 v0, p0

    iget v13, v0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mTouchMode:I

    const/4 v14, 0x4

    if-ne v13, v14, :cond_ad

    .line 335
    sget-object v13, Lcom/github/mikephil/charting/listener/ChartTouchListener$ChartGesture;->PINCH_ZOOM:Lcom/github/mikephil/charting/listener/ChartTouchListener$ChartGesture;

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mLastGesture:Lcom/github/mikephil/charting/listener/ChartTouchListener$ChartGesture;

    .line 337
    move-object/from16 v0, p0

    iget v13, v0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mSavedDist:F

    div-float v6, v10, v13

    .line 339
    .local v6, "scale":F
    const/high16 v13, 0x3f800000    # 1.0f

    cmpg-float v13, v6, v13

    if-gez v13, :cond_9b

    const/4 v4, 0x1

    .line 341
    .local v4, "isZoomingOut":Z
    :goto_53
    if-eqz v4, :cond_9d

    invoke-virtual {v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->canZoomOutMoreX()Z

    move-result v1

    .line 345
    .local v1, "canZoomMoreX":Z
    :goto_59
    if-eqz v4, :cond_a2

    invoke-virtual {v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->canZoomOutMoreY()Z

    move-result v2

    .line 349
    .local v2, "canZoomMoreY":Z
    :goto_5f
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mChart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v13, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v13}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->isScaleXEnabled()Z

    move-result v13

    if-eqz v13, :cond_a7

    move v7, v6

    .line 350
    .local v7, "scaleX":F
    :goto_6c
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mChart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v13, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v13}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->isScaleYEnabled()Z

    move-result v13

    if-eqz v13, :cond_aa

    move v8, v6

    .line 352
    .local v8, "scaleY":F
    :goto_79
    if-nez v2, :cond_7d

    if-eqz v1, :cond_9a

    .line 354
    :cond_7d
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mMatrix:Landroid/graphics/Matrix;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mSavedMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v13, v14}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 355
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mMatrix:Landroid/graphics/Matrix;

    iget v14, v9, Landroid/graphics/PointF;->x:F

    iget v15, v9, Landroid/graphics/PointF;->y:F

    invoke-virtual {v13, v7, v8, v14, v15}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 357
    if-eqz v5, :cond_9a

    .line 358
    move-object/from16 v0, p1

    invoke-interface {v5, v0, v7, v8}, Lcom/github/mikephil/charting/listener/OnChartGestureListener;->onChartScale(Landroid/view/MotionEvent;FF)V

    .line 405
    .end local v1    # "canZoomMoreX":Z
    .end local v2    # "canZoomMoreY":Z
    .end local v3    # "h":Lcom/github/mikephil/charting/utils/ViewPortHandler;
    .end local v4    # "isZoomingOut":Z
    .end local v5    # "l":Lcom/github/mikephil/charting/listener/OnChartGestureListener;
    .end local v6    # "scale":F
    .end local v7    # "scaleX":F
    .end local v8    # "scaleY":F
    .end local v9    # "t":Landroid/graphics/PointF;
    .end local v10    # "totalDist":F
    :cond_9a
    :goto_9a
    return-void

    .line 339
    .restart local v3    # "h":Lcom/github/mikephil/charting/utils/ViewPortHandler;
    .restart local v5    # "l":Lcom/github/mikephil/charting/listener/OnChartGestureListener;
    .restart local v6    # "scale":F
    .restart local v9    # "t":Landroid/graphics/PointF;
    .restart local v10    # "totalDist":F
    :cond_9b
    const/4 v4, 0x0

    goto :goto_53

    .line 341
    .restart local v4    # "isZoomingOut":Z
    :cond_9d
    invoke-virtual {v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->canZoomInMoreX()Z

    move-result v1

    goto :goto_59

    .line 345
    .restart local v1    # "canZoomMoreX":Z
    :cond_a2
    invoke-virtual {v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->canZoomInMoreY()Z

    move-result v2

    goto :goto_5f

    .line 349
    .restart local v2    # "canZoomMoreY":Z
    :cond_a7
    const/high16 v7, 0x3f800000    # 1.0f

    goto :goto_6c

    .line 350
    .restart local v7    # "scaleX":F
    :cond_aa
    const/high16 v8, 0x3f800000    # 1.0f

    goto :goto_79

    .line 361
    .end local v1    # "canZoomMoreX":Z
    .end local v2    # "canZoomMoreY":Z
    .end local v4    # "isZoomingOut":Z
    .end local v6    # "scale":F
    .end local v7    # "scaleX":F
    :cond_ad
    move-object/from16 v0, p0

    iget v13, v0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mTouchMode:I

    const/4 v14, 0x2

    if-ne v13, v14, :cond_10c

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mChart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v13, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v13}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->isScaleXEnabled()Z

    move-result v13

    if-eqz v13, :cond_10c

    .line 363
    sget-object v13, Lcom/github/mikephil/charting/listener/ChartTouchListener$ChartGesture;->X_ZOOM:Lcom/github/mikephil/charting/listener/ChartTouchListener$ChartGesture;

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mLastGesture:Lcom/github/mikephil/charting/listener/ChartTouchListener$ChartGesture;

    .line 365
    invoke-static/range {p1 .. p1}, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->getXDist(Landroid/view/MotionEvent;)F

    move-result v11

    .line 366
    .local v11, "xDist":F
    move-object/from16 v0, p0

    iget v13, v0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mSavedXDist:F

    div-float v7, v11, v13

    .line 368
    .restart local v7    # "scaleX":F
    const/high16 v13, 0x3f800000    # 1.0f

    cmpg-float v13, v7, v13

    if-gez v13, :cond_105

    const/4 v4, 0x1

    .line 369
    .restart local v4    # "isZoomingOut":Z
    :goto_d7
    if-eqz v4, :cond_107

    invoke-virtual {v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->canZoomOutMoreX()Z

    move-result v1

    .line 373
    .restart local v1    # "canZoomMoreX":Z
    :goto_dd
    if-eqz v1, :cond_9a

    .line 375
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mMatrix:Landroid/graphics/Matrix;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mSavedMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v13, v14}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 376
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mMatrix:Landroid/graphics/Matrix;

    const/high16 v14, 0x3f800000    # 1.0f

    iget v15, v9, Landroid/graphics/PointF;->x:F

    iget v0, v9, Landroid/graphics/PointF;->y:F

    move/from16 v16, v0

    move/from16 v0, v16

    invoke-virtual {v13, v7, v14, v15, v0}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 378
    if-eqz v5, :cond_9a

    .line 379
    const/high16 v13, 0x3f800000    # 1.0f

    move-object/from16 v0, p1

    invoke-interface {v5, v0, v7, v13}, Lcom/github/mikephil/charting/listener/OnChartGestureListener;->onChartScale(Landroid/view/MotionEvent;FF)V

    goto :goto_9a

    .line 368
    .end local v1    # "canZoomMoreX":Z
    .end local v4    # "isZoomingOut":Z
    :cond_105
    const/4 v4, 0x0

    goto :goto_d7

    .line 369
    .restart local v4    # "isZoomingOut":Z
    :cond_107
    invoke-virtual {v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->canZoomInMoreX()Z

    move-result v1

    goto :goto_dd

    .line 382
    .end local v4    # "isZoomingOut":Z
    .end local v7    # "scaleX":F
    .end local v11    # "xDist":F
    :cond_10c
    move-object/from16 v0, p0

    iget v13, v0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mTouchMode:I

    const/4 v14, 0x3

    if-ne v13, v14, :cond_9a

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mChart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v13, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v13}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->isScaleYEnabled()Z

    move-result v13

    if-eqz v13, :cond_9a

    .line 384
    sget-object v13, Lcom/github/mikephil/charting/listener/ChartTouchListener$ChartGesture;->Y_ZOOM:Lcom/github/mikephil/charting/listener/ChartTouchListener$ChartGesture;

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mLastGesture:Lcom/github/mikephil/charting/listener/ChartTouchListener$ChartGesture;

    .line 386
    invoke-static/range {p1 .. p1}, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->getYDist(Landroid/view/MotionEvent;)F

    move-result v12

    .line 387
    .local v12, "yDist":F
    move-object/from16 v0, p0

    iget v13, v0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mSavedYDist:F

    div-float v8, v12, v13

    .line 389
    .restart local v8    # "scaleY":F
    const/high16 v13, 0x3f800000    # 1.0f

    cmpg-float v13, v8, v13

    if-gez v13, :cond_165

    const/4 v4, 0x1

    .line 390
    .restart local v4    # "isZoomingOut":Z
    :goto_136
    if-eqz v4, :cond_167

    invoke-virtual {v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->canZoomOutMoreY()Z

    move-result v2

    .line 394
    .restart local v2    # "canZoomMoreY":Z
    :goto_13c
    if-eqz v2, :cond_9a

    .line 396
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mMatrix:Landroid/graphics/Matrix;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mSavedMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v13, v14}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 397
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mMatrix:Landroid/graphics/Matrix;

    const/high16 v14, 0x3f800000    # 1.0f

    iget v15, v9, Landroid/graphics/PointF;->x:F

    iget v0, v9, Landroid/graphics/PointF;->y:F

    move/from16 v16, v0

    move/from16 v0, v16

    invoke-virtual {v13, v14, v8, v15, v0}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 399
    if-eqz v5, :cond_9a

    .line 400
    const/high16 v13, 0x3f800000    # 1.0f

    move-object/from16 v0, p1

    invoke-interface {v5, v0, v13, v8}, Lcom/github/mikephil/charting/listener/OnChartGestureListener;->onChartScale(Landroid/view/MotionEvent;FF)V

    goto/16 :goto_9a

    .line 389
    .end local v2    # "canZoomMoreY":Z
    .end local v4    # "isZoomingOut":Z
    :cond_165
    const/4 v4, 0x0

    goto :goto_136

    .line 390
    .restart local v4    # "isZoomingOut":Z
    :cond_167
    invoke-virtual {v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->canZoomInMoreY()Z

    move-result v2

    goto :goto_13c
.end method

.method private saveTouchStart(Landroid/view/MotionEvent;)V
    .registers 5
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 268
    iget-object v0, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mSavedMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 269
    iget-object v0, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mTouchStartPoint:Landroid/graphics/PointF;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/PointF;->set(FF)V

    .line 271
    iget-object v0, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mChart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v0, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getDataSetByTouchPoint(FF)Lcom/github/mikephil/charting/interfaces/datasets/IBarLineScatterCandleBubbleDataSet;

    move-result-object v0

    iput-object v0, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mClosestDataSetToTouch:Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    .line 272
    return-void
.end method

.method private static spacing(Landroid/view/MotionEvent;)F
    .registers 7
    .param p0, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 447
    invoke-virtual {p0, v4}, Landroid/view/MotionEvent;->getX(I)F

    move-result v2

    invoke-virtual {p0, v5}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    sub-float v0, v2, v3

    .line 448
    .local v0, "x":F
    invoke-virtual {p0, v4}, Landroid/view/MotionEvent;->getY(I)F

    move-result v2

    invoke-virtual {p0, v5}, Landroid/view/MotionEvent;->getY(I)F

    move-result v3

    sub-float v1, v2, v3

    .line 449
    .local v1, "y":F
    mul-float v2, v0, v0

    mul-float v3, v1, v1

    add-float/2addr v2, v3

    float-to-double v2, v2

    invoke-static {v2, v3}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v2

    double-to-float v2, v2

    return v2
.end method


# virtual methods
.method public computeScroll()V
    .registers 15

    .prologue
    const/4 v7, 0x0

    const/4 v3, 0x0

    const-wide v12, 0x3f847ae147ae147bL    # 0.01

    .line 612
    iget-object v2, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mDecelerationVelocity:Landroid/graphics/PointF;

    iget v2, v2, Landroid/graphics/PointF;->x:F

    cmpl-float v2, v2, v3

    if-nez v2, :cond_18

    iget-object v2, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mDecelerationVelocity:Landroid/graphics/PointF;

    iget v2, v2, Landroid/graphics/PointF;->y:F

    cmpl-float v2, v2, v3

    if-nez v2, :cond_18

    .line 646
    :goto_17
    return-void

    .line 615
    :cond_18
    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    move-result-wide v0

    .line 617
    .local v0, "currentTime":J
    iget-object v3, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mDecelerationVelocity:Landroid/graphics/PointF;

    iget v4, v3, Landroid/graphics/PointF;->x:F

    iget-object v2, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mChart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v2, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getDragDecelerationFrictionCoef()F

    move-result v2

    mul-float/2addr v2, v4

    iput v2, v3, Landroid/graphics/PointF;->x:F

    .line 618
    iget-object v3, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mDecelerationVelocity:Landroid/graphics/PointF;

    iget v4, v3, Landroid/graphics/PointF;->y:F

    iget-object v2, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mChart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v2, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getDragDecelerationFrictionCoef()F

    move-result v2

    mul-float/2addr v2, v4

    iput v2, v3, Landroid/graphics/PointF;->y:F

    .line 620
    iget-wide v2, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mDecelerationLastTime:J

    sub-long v2, v0, v2

    long-to-float v2, v2

    const/high16 v3, 0x447a0000    # 1000.0f

    div-float v11, v2, v3

    .line 622
    .local v11, "timeInterval":F
    iget-object v2, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mDecelerationVelocity:Landroid/graphics/PointF;

    iget v2, v2, Landroid/graphics/PointF;->x:F

    mul-float v8, v2, v11

    .line 623
    .local v8, "distanceX":F
    iget-object v2, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mDecelerationVelocity:Landroid/graphics/PointF;

    iget v2, v2, Landroid/graphics/PointF;->y:F

    mul-float v9, v2, v11

    .line 625
    .local v9, "distanceY":F
    iget-object v2, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mDecelerationCurrentPoint:Landroid/graphics/PointF;

    iget v3, v2, Landroid/graphics/PointF;->x:F

    add-float/2addr v3, v8

    iput v3, v2, Landroid/graphics/PointF;->x:F

    .line 626
    iget-object v2, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mDecelerationCurrentPoint:Landroid/graphics/PointF;

    iget v3, v2, Landroid/graphics/PointF;->y:F

    add-float/2addr v3, v9

    iput v3, v2, Landroid/graphics/PointF;->y:F

    .line 628
    const/4 v4, 0x2

    iget-object v2, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mDecelerationCurrentPoint:Landroid/graphics/PointF;

    iget v5, v2, Landroid/graphics/PointF;->x:F

    iget-object v2, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mDecelerationCurrentPoint:Landroid/graphics/PointF;

    iget v6, v2, Landroid/graphics/PointF;->y:F

    move-wide v2, v0

    invoke-static/range {v0 .. v7}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v10

    .line 629
    .local v10, "event":Landroid/view/MotionEvent;
    invoke-direct {p0, v10}, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->performDrag(Landroid/view/MotionEvent;)V

    .line 630
    invoke-virtual {v10}, Landroid/view/MotionEvent;->recycle()V

    .line 631
    iget-object v2, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mChart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v2, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getViewPortHandler()Lcom/github/mikephil/charting/utils/ViewPortHandler;

    move-result-object v2

    iget-object v3, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mMatrix:Landroid/graphics/Matrix;

    iget-object v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mChart:Lcom/github/mikephil/charting/charts/Chart;

    invoke-virtual {v2, v3, v4, v7}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->refresh(Landroid/graphics/Matrix;Landroid/view/View;Z)Landroid/graphics/Matrix;

    move-result-object v2

    iput-object v2, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mMatrix:Landroid/graphics/Matrix;

    .line 633
    iput-wide v0, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mDecelerationLastTime:J

    .line 635
    iget-object v2, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mDecelerationVelocity:Landroid/graphics/PointF;

    iget v2, v2, Landroid/graphics/PointF;->x:F

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    float-to-double v2, v2

    cmpl-double v2, v2, v12

    if-gez v2, :cond_9f

    iget-object v2, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mDecelerationVelocity:Landroid/graphics/PointF;

    iget v2, v2, Landroid/graphics/PointF;->y:F

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    float-to-double v2, v2

    cmpl-double v2, v2, v12

    if-ltz v2, :cond_a6

    .line 636
    :cond_9f
    iget-object v2, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mChart:Lcom/github/mikephil/charting/charts/Chart;

    invoke-static {v2}, Lcom/github/mikephil/charting/utils/Utils;->postInvalidateOnAnimation(Landroid/view/View;)V

    goto/16 :goto_17

    .line 641
    :cond_a6
    iget-object v2, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mChart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v2, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->calculateOffsets()V

    .line 642
    iget-object v2, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mChart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v2, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->postInvalidate()V

    .line 644
    invoke-virtual {p0}, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->stopDeceleration()V

    goto/16 :goto_17
.end method

.method public getMatrix()Landroid/graphics/Matrix;
    .registers 2

    .prologue
    .line 513
    iget-object v0, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mMatrix:Landroid/graphics/Matrix;

    return-object v0
.end method

.method public getTrans(FF)Landroid/graphics/PointF;
    .registers 8
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    .line 486
    iget-object v3, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mChart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v3, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getViewPortHandler()Lcom/github/mikephil/charting/utils/ViewPortHandler;

    move-result-object v0

    .line 488
    .local v0, "vph":Lcom/github/mikephil/charting/utils/ViewPortHandler;
    invoke-virtual {v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->offsetLeft()F

    move-result v3

    sub-float v1, p1, v3

    .line 489
    .local v1, "xTrans":F
    const/4 v2, 0x0

    .line 492
    .local v2, "yTrans":F
    iget-object v3, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mChart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v3, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->isAnyAxisInverted()Z

    move-result v3

    if-eqz v3, :cond_3a

    iget-object v3, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mClosestDataSetToTouch:Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    if-eqz v3, :cond_3a

    iget-object v3, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mChart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v3, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    iget-object v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mClosestDataSetToTouch:Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    invoke-interface {v4}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getAxisDependency()Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->isInverted(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)Z

    move-result v3

    if-eqz v3, :cond_3a

    .line 494
    invoke-virtual {v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->offsetTop()F

    move-result v3

    sub-float v3, p2, v3

    neg-float v2, v3

    .line 499
    :goto_34
    new-instance v3, Landroid/graphics/PointF;

    invoke-direct {v3, v1, v2}, Landroid/graphics/PointF;-><init>(FF)V

    return-object v3

    .line 496
    :cond_3a
    iget-object v3, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mChart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v3, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getMeasuredHeight()I

    move-result v3

    int-to-float v3, v3

    sub-float/2addr v3, p2

    invoke-virtual {v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->offsetBottom()F

    move-result v4

    sub-float/2addr v3, v4

    neg-float v2, v3

    goto :goto_34
.end method

.method public onDoubleTap(Landroid/view/MotionEvent;)Z
    .registers 9
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    const v5, 0x3fb33333    # 1.4f

    const/high16 v6, 0x3f800000    # 1.0f

    .line 519
    sget-object v2, Lcom/github/mikephil/charting/listener/ChartTouchListener$ChartGesture;->DOUBLE_TAP:Lcom/github/mikephil/charting/listener/ChartTouchListener$ChartGesture;

    iput-object v2, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mLastGesture:Lcom/github/mikephil/charting/listener/ChartTouchListener$ChartGesture;

    .line 521
    iget-object v2, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mChart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v2, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getOnChartGestureListener()Lcom/github/mikephil/charting/listener/OnChartGestureListener;

    move-result-object v0

    .line 523
    .local v0, "l":Lcom/github/mikephil/charting/listener/OnChartGestureListener;
    if-eqz v0, :cond_16

    .line 524
    invoke-interface {v0, p1}, Lcom/github/mikephil/charting/listener/OnChartGestureListener;->onChartDoubleTapped(Landroid/view/MotionEvent;)V

    .line 528
    :cond_16
    iget-object v2, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mChart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v2, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->isDoubleTapToZoomEnabled()Z

    move-result v2

    if-eqz v2, :cond_7c

    .line 530
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    invoke-virtual {p0, v2, v3}, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->getTrans(FF)Landroid/graphics/PointF;

    move-result-object v1

    .line 532
    .local v1, "trans":Landroid/graphics/PointF;
    iget-object v2, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mChart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v2, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    iget-object v3, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mChart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v3, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->isScaleXEnabled()Z

    move-result v3

    if-eqz v3, :cond_81

    move v4, v5

    :goto_3b
    iget-object v3, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mChart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v3, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->isScaleYEnabled()Z

    move-result v3

    if-eqz v3, :cond_83

    :goto_45
    iget v3, v1, Landroid/graphics/PointF;->x:F

    iget v6, v1, Landroid/graphics/PointF;->y:F

    invoke-virtual {v2, v4, v5, v3, v6}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->zoom(FFFF)V

    .line 534
    iget-object v2, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mChart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v2, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->isLogEnabled()Z

    move-result v2

    if-eqz v2, :cond_7c

    .line 535
    const-string v2, "BarlineChartTouch"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Double-Tap, Zooming In, x: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, v1, Landroid/graphics/PointF;->x:F

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", y: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, v1, Landroid/graphics/PointF;->y:F

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 539
    .end local v1    # "trans":Landroid/graphics/PointF;
    :cond_7c
    invoke-super {p0, p1}, Lcom/github/mikephil/charting/listener/ChartTouchListener;->onDoubleTap(Landroid/view/MotionEvent;)Z

    move-result v2

    return v2

    .restart local v1    # "trans":Landroid/graphics/PointF;
    :cond_81
    move v4, v6

    .line 532
    goto :goto_3b

    :cond_83
    move v5, v6

    goto :goto_45
.end method

.method public onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .registers 7
    .param p1, "e1"    # Landroid/view/MotionEvent;
    .param p2, "e2"    # Landroid/view/MotionEvent;
    .param p3, "velocityX"    # F
    .param p4, "velocityY"    # F

    .prologue
    .line 595
    sget-object v1, Lcom/github/mikephil/charting/listener/ChartTouchListener$ChartGesture;->FLING:Lcom/github/mikephil/charting/listener/ChartTouchListener$ChartGesture;

    iput-object v1, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mLastGesture:Lcom/github/mikephil/charting/listener/ChartTouchListener$ChartGesture;

    .line 597
    iget-object v1, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mChart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v1, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getOnChartGestureListener()Lcom/github/mikephil/charting/listener/OnChartGestureListener;

    move-result-object v0

    .line 599
    .local v0, "l":Lcom/github/mikephil/charting/listener/OnChartGestureListener;
    if-eqz v0, :cond_11

    .line 600
    invoke-interface {v0, p1, p2, p3, p4}, Lcom/github/mikephil/charting/listener/OnChartGestureListener;->onChartFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)V

    .line 603
    :cond_11
    invoke-super {p0, p1, p2, p3, p4}, Lcom/github/mikephil/charting/listener/ChartTouchListener;->onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z

    move-result v1

    return v1
.end method

.method public onLongPress(Landroid/view/MotionEvent;)V
    .registers 4
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 545
    sget-object v1, Lcom/github/mikephil/charting/listener/ChartTouchListener$ChartGesture;->LONG_PRESS:Lcom/github/mikephil/charting/listener/ChartTouchListener$ChartGesture;

    iput-object v1, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mLastGesture:Lcom/github/mikephil/charting/listener/ChartTouchListener$ChartGesture;

    .line 547
    iget-object v1, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mChart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v1, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getOnChartGestureListener()Lcom/github/mikephil/charting/listener/OnChartGestureListener;

    move-result-object v0

    .line 549
    .local v0, "l":Lcom/github/mikephil/charting/listener/OnChartGestureListener;
    if-eqz v0, :cond_11

    .line 551
    invoke-interface {v0, p1}, Lcom/github/mikephil/charting/listener/OnChartGestureListener;->onChartLongPressed(Landroid/view/MotionEvent;)V

    .line 553
    :cond_11
    return-void
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)Z
    .registers 7
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 558
    sget-object v2, Lcom/github/mikephil/charting/listener/ChartTouchListener$ChartGesture;->SINGLE_TAP:Lcom/github/mikephil/charting/listener/ChartTouchListener$ChartGesture;

    iput-object v2, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mLastGesture:Lcom/github/mikephil/charting/listener/ChartTouchListener$ChartGesture;

    .line 560
    iget-object v2, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mChart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v2, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getOnChartGestureListener()Lcom/github/mikephil/charting/listener/OnChartGestureListener;

    move-result-object v1

    .line 562
    .local v1, "l":Lcom/github/mikephil/charting/listener/OnChartGestureListener;
    if-eqz v1, :cond_11

    .line 563
    invoke-interface {v1, p1}, Lcom/github/mikephil/charting/listener/OnChartGestureListener;->onChartSingleTapped(Landroid/view/MotionEvent;)V

    .line 566
    :cond_11
    iget-object v2, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mChart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v2, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->isHighlightPerTapEnabled()Z

    move-result v2

    if-nez v2, :cond_1d

    .line 567
    const/4 v2, 0x0

    .line 574
    :goto_1c
    return v2

    .line 571
    :cond_1d
    iget-object v2, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mChart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v2, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    invoke-virtual {v2, v3, v4}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getHighlightByTouchPoint(FF)Lcom/github/mikephil/charting/highlight/Highlight;

    move-result-object v0

    .line 572
    .local v0, "h":Lcom/github/mikephil/charting/highlight/Highlight;
    invoke-virtual {p0, v0, p1}, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->performHighlight(Lcom/github/mikephil/charting/highlight/Highlight;Landroid/view/MotionEvent;)V

    .line 574
    invoke-super {p0, p1}, Lcom/github/mikephil/charting/listener/ChartTouchListener;->onSingleTapUp(Landroid/view/MotionEvent;)Z

    move-result v2

    goto :goto_1c
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 15
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    .prologue
    const/4 v11, 0x4

    const/4 v10, 0x0

    const/4 v9, 0x3

    const/4 v7, 0x2

    const/4 v8, 0x1

    .line 90
    iget-object v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-nez v4, :cond_f

    .line 91
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v4

    iput-object v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 93
    :cond_f
    iget-object v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v4, p2}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 95
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v4

    if-ne v4, v9, :cond_26

    .line 96
    iget-object v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v4, :cond_26

    .line 97
    iget-object v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v4}, Landroid/view/VelocityTracker;->recycle()V

    .line 98
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 102
    :cond_26
    iget v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mTouchMode:I

    if-nez v4, :cond_2f

    .line 103
    iget-object v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v4, p2}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 106
    :cond_2f
    iget-object v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mChart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v4, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->isDragEnabled()Z

    move-result v4

    if-nez v4, :cond_4e

    iget-object v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mChart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v4, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->isScaleXEnabled()Z

    move-result v4

    if-nez v4, :cond_4e

    iget-object v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mChart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v4, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->isScaleYEnabled()Z

    move-result v4

    if-nez v4, :cond_4e

    .line 253
    :goto_4d
    return v8

    .line 110
    :cond_4e
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v4

    and-int/lit16 v4, v4, 0xff

    packed-switch v4, :pswitch_data_210

    .line 251
    :cond_57
    :goto_57
    :pswitch_57
    iget-object v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mChart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v4, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->getViewPortHandler()Lcom/github/mikephil/charting/utils/ViewPortHandler;

    move-result-object v4

    iget-object v5, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mMatrix:Landroid/graphics/Matrix;

    iget-object v6, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mChart:Lcom/github/mikephil/charting/charts/Chart;

    invoke-virtual {v4, v5, v6, v8}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->refresh(Landroid/graphics/Matrix;Landroid/view/View;Z)Landroid/graphics/Matrix;

    move-result-object v4

    iput-object v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mMatrix:Landroid/graphics/Matrix;

    goto :goto_4d

    .line 114
    :pswitch_6a
    invoke-virtual {p0, p2}, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->startAction(Landroid/view/MotionEvent;)V

    .line 116
    invoke-virtual {p0}, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->stopDeceleration()V

    .line 118
    invoke-direct {p0, p2}, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->saveTouchStart(Landroid/view/MotionEvent;)V

    goto :goto_57

    .line 123
    :pswitch_74
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v4

    if-lt v4, v7, :cond_57

    .line 125
    iget-object v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mChart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v4, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->disableScroll()V

    .line 127
    invoke-direct {p0, p2}, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->saveTouchStart(Landroid/view/MotionEvent;)V

    .line 130
    invoke-static {p2}, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->getXDist(Landroid/view/MotionEvent;)F

    move-result v4

    iput v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mSavedXDist:F

    .line 133
    invoke-static {p2}, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->getYDist(Landroid/view/MotionEvent;)F

    move-result v4

    iput v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mSavedYDist:F

    .line 136
    invoke-static {p2}, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->spacing(Landroid/view/MotionEvent;)F

    move-result v4

    iput v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mSavedDist:F

    .line 138
    iget v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mSavedDist:F

    const/high16 v5, 0x41200000    # 10.0f

    cmpl-float v4, v4, v5

    if-lez v4, :cond_aa

    .line 140
    iget-object v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mChart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v4, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->isPinchZoomEnabled()Z

    move-result v4

    if-eqz v4, :cond_b0

    .line 141
    iput v11, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mTouchMode:I

    .line 151
    :cond_aa
    :goto_aa
    iget-object v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mTouchPointCenter:Landroid/graphics/PointF;

    invoke-static {v4, p2}, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->midPoint(Landroid/graphics/PointF;Landroid/view/MotionEvent;)V

    goto :goto_57

    .line 143
    :cond_b0
    iget v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mSavedXDist:F

    iget v5, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mSavedYDist:F

    cmpl-float v4, v4, v5

    if-lez v4, :cond_bb

    .line 144
    iput v7, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mTouchMode:I

    goto :goto_aa

    .line 146
    :cond_bb
    iput v9, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mTouchMode:I

    goto :goto_aa

    .line 156
    :pswitch_be
    iget v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mTouchMode:I

    if-ne v4, v8, :cond_cd

    .line 158
    iget-object v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mChart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v4, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->disableScroll()V

    .line 159
    invoke-direct {p0, p2}, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->performDrag(Landroid/view/MotionEvent;)V

    goto :goto_57

    .line 161
    :cond_cd
    iget v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mTouchMode:I

    if-eq v4, v7, :cond_d9

    iget v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mTouchMode:I

    if-eq v4, v9, :cond_d9

    iget v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mTouchMode:I

    if-ne v4, v11, :cond_f9

    .line 163
    :cond_d9
    iget-object v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mChart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v4, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->disableScroll()V

    .line 165
    iget-object v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mChart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v4, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->isScaleXEnabled()Z

    move-result v4

    if-nez v4, :cond_f4

    iget-object v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mChart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v4, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->isScaleYEnabled()Z

    move-result v4

    if-eqz v4, :cond_57

    .line 166
    :cond_f4
    invoke-direct {p0, p2}, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->performZoom(Landroid/view/MotionEvent;)V

    goto/16 :goto_57

    .line 168
    :cond_f9
    iget v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mTouchMode:I

    if-nez v4, :cond_57

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    iget-object v5, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mTouchStartPoint:Landroid/graphics/PointF;

    iget v5, v5, Landroid/graphics/PointF;->x:F

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v6

    iget-object v7, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mTouchStartPoint:Landroid/graphics/PointF;

    iget v7, v7, Landroid/graphics/PointF;->y:F

    invoke-static {v4, v5, v6, v7}, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->distance(FFFF)F

    move-result v4

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    iget v5, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mDragTriggerDist:F

    cmpl-float v4, v4, v5

    if-lez v4, :cond_57

    .line 172
    iget-object v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mChart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v4, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->hasNoDragOffset()Z

    move-result v4

    if-eqz v4, :cond_150

    .line 174
    iget-object v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mChart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v4, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->isFullyZoomedOut()Z

    move-result v4

    if-nez v4, :cond_13d

    iget-object v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mChart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v4, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->isDragEnabled()Z

    move-result v4

    if-eqz v4, :cond_13d

    .line 175
    iput v8, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mTouchMode:I

    goto/16 :goto_57

    .line 178
    :cond_13d
    sget-object v4, Lcom/github/mikephil/charting/listener/ChartTouchListener$ChartGesture;->DRAG:Lcom/github/mikephil/charting/listener/ChartTouchListener$ChartGesture;

    iput-object v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mLastGesture:Lcom/github/mikephil/charting/listener/ChartTouchListener$ChartGesture;

    .line 180
    iget-object v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mChart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v4, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->isHighlightPerDragEnabled()Z

    move-result v4

    if-eqz v4, :cond_57

    .line 181
    invoke-direct {p0, p2}, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->performHighlightDrag(Landroid/view/MotionEvent;)V

    goto/16 :goto_57

    .line 184
    :cond_150
    iget-object v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mChart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v4, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->isDragEnabled()Z

    move-result v4

    if-eqz v4, :cond_57

    .line 185
    sget-object v4, Lcom/github/mikephil/charting/listener/ChartTouchListener$ChartGesture;->DRAG:Lcom/github/mikephil/charting/listener/ChartTouchListener$ChartGesture;

    iput-object v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mLastGesture:Lcom/github/mikephil/charting/listener/ChartTouchListener$ChartGesture;

    .line 186
    iput v8, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mTouchMode:I

    goto/16 :goto_57

    .line 193
    :pswitch_162
    iget-object v1, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 194
    .local v1, "velocityTracker":Landroid/view/VelocityTracker;
    invoke-virtual {p2, v10}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v0

    .line 195
    .local v0, "pointerId":I
    const/16 v4, 0x3e8

    invoke-static {}, Lcom/github/mikephil/charting/utils/Utils;->getMaximumFlingVelocity()I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {v1, v4, v5}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 196
    invoke-virtual {v1, v0}, Landroid/view/VelocityTracker;->getYVelocity(I)F

    move-result v3

    .line 197
    .local v3, "velocityY":F
    invoke-virtual {v1, v0}, Landroid/view/VelocityTracker;->getXVelocity(I)F

    move-result v2

    .line 199
    .local v2, "velocityX":F
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v4

    invoke-static {}, Lcom/github/mikephil/charting/utils/Utils;->getMinimumFlingVelocity()I

    move-result v5

    int-to-float v5, v5

    cmpl-float v4, v4, v5

    if-gtz v4, :cond_194

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v4

    invoke-static {}, Lcom/github/mikephil/charting/utils/Utils;->getMinimumFlingVelocity()I

    move-result v5

    int-to-float v5, v5

    cmpl-float v4, v4, v5

    if-lez v4, :cond_1c6

    .line 202
    :cond_194
    iget v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mTouchMode:I

    if-ne v4, v8, :cond_1c6

    iget-object v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mChart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v4, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->isDragDecelerationEnabled()Z

    move-result v4

    if-eqz v4, :cond_1c6

    .line 204
    invoke-virtual {p0}, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->stopDeceleration()V

    .line 206
    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    move-result-wide v4

    iput-wide v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mDecelerationLastTime:J

    .line 207
    new-instance v4, Landroid/graphics/PointF;

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v6

    invoke-direct {v4, v5, v6}, Landroid/graphics/PointF;-><init>(FF)V

    iput-object v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mDecelerationCurrentPoint:Landroid/graphics/PointF;

    .line 208
    new-instance v4, Landroid/graphics/PointF;

    invoke-direct {v4, v2, v3}, Landroid/graphics/PointF;-><init>(FF)V

    iput-object v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mDecelerationVelocity:Landroid/graphics/PointF;

    .line 210
    iget-object v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mChart:Lcom/github/mikephil/charting/charts/Chart;

    invoke-static {v4}, Lcom/github/mikephil/charting/utils/Utils;->postInvalidateOnAnimation(Landroid/view/View;)V

    .line 214
    :cond_1c6
    iget v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mTouchMode:I

    if-eq v4, v7, :cond_1d7

    iget v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mTouchMode:I

    if-eq v4, v9, :cond_1d7

    iget v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mTouchMode:I

    if-eq v4, v11, :cond_1d7

    iget v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mTouchMode:I

    const/4 v5, 0x5

    if-ne v4, v5, :cond_1e5

    .line 222
    :cond_1d7
    iget-object v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mChart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v4, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->calculateOffsets()V

    .line 223
    iget-object v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mChart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v4, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->postInvalidate()V

    .line 226
    :cond_1e5
    iput v10, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mTouchMode:I

    .line 227
    iget-object v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mChart:Lcom/github/mikephil/charting/charts/Chart;

    check-cast v4, Lcom/github/mikephil/charting/charts/BarLineChartBase;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/charts/BarLineChartBase;->enableScroll()V

    .line 229
    iget-object v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v4, :cond_1fa

    .line 230
    iget-object v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v4}, Landroid/view/VelocityTracker;->recycle()V

    .line 231
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 234
    :cond_1fa
    invoke-virtual {p0, p2}, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->endAction(Landroid/view/MotionEvent;)V

    goto/16 :goto_57

    .line 238
    .end local v0    # "pointerId":I
    .end local v1    # "velocityTracker":Landroid/view/VelocityTracker;
    .end local v2    # "velocityX":F
    .end local v3    # "velocityY":F
    :pswitch_1ff
    iget-object v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-static {p2, v4}, Lcom/github/mikephil/charting/utils/Utils;->velocityTrackerPointerUpCleanUpIfNecessary(Landroid/view/MotionEvent;Landroid/view/VelocityTracker;)V

    .line 240
    const/4 v4, 0x5

    iput v4, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mTouchMode:I

    goto/16 :goto_57

    .line 245
    :pswitch_209
    iput v10, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mTouchMode:I

    .line 246
    invoke-virtual {p0, p2}, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->endAction(Landroid/view/MotionEvent;)V

    goto/16 :goto_57

    .line 110
    :pswitch_data_210
    .packed-switch 0x0
        :pswitch_6a
        :pswitch_162
        :pswitch_be
        :pswitch_209
        :pswitch_57
        :pswitch_74
        :pswitch_1ff
    .end packed-switch
.end method

.method public stopDeceleration()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 607
    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0, v1, v1}, Landroid/graphics/PointF;-><init>(FF)V

    iput-object v0, p0, Lcom/github/mikephil/charting/listener/BarLineChartTouchListener;->mDecelerationVelocity:Landroid/graphics/PointF;

    .line 608
    return-void
.end method
