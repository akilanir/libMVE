.class public Lcom/github/mikephil/charting/renderer/PieChartRenderer;
.super Lcom/github/mikephil/charting/renderer/DataRenderer;
.source "PieChartRenderer.java"


# instance fields
.field protected mBitmapCanvas:Landroid/graphics/Canvas;

.field private mCenterTextLastBounds:Landroid/graphics/RectF;

.field private mCenterTextLastValue:Ljava/lang/CharSequence;

.field private mCenterTextLayout:Landroid/text/StaticLayout;

.field private mCenterTextPaint:Landroid/text/TextPaint;

.field protected mChart:Lcom/github/mikephil/charting/charts/PieChart;

.field protected mDrawBitmap:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field private mHoleCirclePath:Landroid/graphics/Path;

.field protected mHolePaint:Landroid/graphics/Paint;

.field private mInnerRectBuffer:Landroid/graphics/RectF;

.field private mPathBuffer:Landroid/graphics/Path;

.field private mRectBuffer:[Landroid/graphics/RectF;

.field protected mTransparentCirclePaint:Landroid/graphics/Paint;

.field protected mValueLinePaint:Landroid/graphics/Paint;


# direct methods
.method public constructor <init>(Lcom/github/mikephil/charting/charts/PieChart;Lcom/github/mikephil/charting/animation/ChartAnimator;Lcom/github/mikephil/charting/utils/ViewPortHandler;)V
    .registers 9
    .param p1, "chart"    # Lcom/github/mikephil/charting/charts/PieChart;
    .param p2, "animator"    # Lcom/github/mikephil/charting/animation/ChartAnimator;
    .param p3, "viewPortHandler"    # Lcom/github/mikephil/charting/utils/ViewPortHandler;

    .prologue
    const/4 v4, -0x1

    const/4 v3, 0x1

    .line 66
    invoke-direct {p0, p2, p3}, Lcom/github/mikephil/charting/renderer/DataRenderer;-><init>(Lcom/github/mikephil/charting/animation/ChartAnimator;Lcom/github/mikephil/charting/utils/ViewPortHandler;)V

    .line 54
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mCenterTextLastBounds:Landroid/graphics/RectF;

    .line 55
    const/4 v0, 0x3

    new-array v0, v0, [Landroid/graphics/RectF;

    const/4 v1, 0x0

    new-instance v2, Landroid/graphics/RectF;

    invoke-direct {v2}, Landroid/graphics/RectF;-><init>()V

    aput-object v2, v0, v1

    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    aput-object v1, v0, v3

    const/4 v1, 0x2

    new-instance v2, Landroid/graphics/RectF;

    invoke-direct {v2}, Landroid/graphics/RectF;-><init>()V

    aput-object v2, v0, v1

    iput-object v0, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mRectBuffer:[Landroid/graphics/RectF;

    .line 136
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mPathBuffer:Landroid/graphics/Path;

    .line 137
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mInnerRectBuffer:Landroid/graphics/RectF;

    .line 568
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mHoleCirclePath:Landroid/graphics/Path;

    .line 67
    iput-object p1, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    .line 69
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v3}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mHolePaint:Landroid/graphics/Paint;

    .line 70
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mHolePaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 71
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mHolePaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 73
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v3}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mTransparentCirclePaint:Landroid/graphics/Paint;

    .line 74
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mTransparentCirclePaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 75
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mTransparentCirclePaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 76
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mTransparentCirclePaint:Landroid/graphics/Paint;

    const/16 v1, 0x69

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 78
    new-instance v0, Landroid/text/TextPaint;

    invoke-direct {v0, v3}, Landroid/text/TextPaint;-><init>(I)V

    iput-object v0, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mCenterTextPaint:Landroid/text/TextPaint;

    .line 79
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mCenterTextPaint:Landroid/text/TextPaint;

    const/high16 v1, -0x1000000

    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->setColor(I)V

    .line 80
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mCenterTextPaint:Landroid/text/TextPaint;

    const/high16 v1, 0x41400000    # 12.0f

    invoke-static {v1}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v1

    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 82
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mValuePaint:Landroid/graphics/Paint;

    const/high16 v1, 0x41500000    # 13.0f

    invoke-static {v1}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 83
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mValuePaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 84
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mValuePaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 86
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v3}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mValueLinePaint:Landroid/graphics/Paint;

    .line 87
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mValueLinePaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 88
    return-void
.end method


# virtual methods
.method protected calculateMinimumRadiusForSpacedSlice(Landroid/graphics/PointF;FFFFFF)F
    .registers 26
    .param p1, "center"    # Landroid/graphics/PointF;
    .param p2, "radius"    # F
    .param p3, "angle"    # F
    .param p4, "arcStartPointX"    # F
    .param p5, "arcStartPointY"    # F
    .param p6, "startAngle"    # F
    .param p7, "sweepAngle"    # F

    .prologue
    .line 148
    const/high16 v10, 0x40000000    # 2.0f

    div-float v10, p7, v10

    add-float v1, p6, v10

    .line 151
    .local v1, "angleMiddle":F
    move-object/from16 v0, p1

    iget v10, v0, Landroid/graphics/PointF;->x:F

    add-float v11, p6, p7

    const v12, 0x3c8efa35

    mul-float/2addr v11, v12

    float-to-double v11, v11

    invoke-static {v11, v12}, Ljava/lang/Math;->cos(D)D

    move-result-wide v11

    double-to-float v11, v11

    mul-float v11, v11, p2

    add-float v2, v10, v11

    .line 152
    .local v2, "arcEndPointX":F
    move-object/from16 v0, p1

    iget v10, v0, Landroid/graphics/PointF;->y:F

    add-float v11, p6, p7

    const v12, 0x3c8efa35

    mul-float/2addr v11, v12

    float-to-double v11, v11

    invoke-static {v11, v12}, Ljava/lang/Math;->sin(D)D

    move-result-wide v11

    double-to-float v11, v11

    mul-float v11, v11, p2

    add-float v3, v10, v11

    .line 155
    .local v3, "arcEndPointY":F
    move-object/from16 v0, p1

    iget v10, v0, Landroid/graphics/PointF;->x:F

    const v11, 0x3c8efa35

    mul-float/2addr v11, v1

    float-to-double v11, v11

    invoke-static {v11, v12}, Ljava/lang/Math;->cos(D)D

    move-result-wide v11

    double-to-float v11, v11

    mul-float v11, v11, p2

    add-float v4, v10, v11

    .line 156
    .local v4, "arcMidPointX":F
    move-object/from16 v0, p1

    iget v10, v0, Landroid/graphics/PointF;->y:F

    const v11, 0x3c8efa35

    mul-float/2addr v11, v1

    float-to-double v11, v11

    invoke-static {v11, v12}, Ljava/lang/Math;->sin(D)D

    move-result-wide v11

    double-to-float v11, v11

    mul-float v11, v11, p2

    add-float v5, v10, v11

    .line 159
    .local v5, "arcMidPointY":F
    sub-float v10, v2, p4

    float-to-double v10, v10

    const-wide/high16 v12, 0x4000000000000000L    # 2.0

    invoke-static {v10, v11, v12, v13}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v10

    sub-float v12, v3, p5

    float-to-double v12, v12

    const-wide/high16 v14, 0x4000000000000000L    # 2.0

    invoke-static {v12, v13, v14, v15}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v12

    add-double/2addr v10, v12

    invoke-static {v10, v11}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v6

    .line 166
    .local v6, "basePointsDistance":D
    const-wide/high16 v10, 0x4000000000000000L    # 2.0

    div-double v10, v6, v10

    const-wide v12, 0x4066800000000000L    # 180.0

    move/from16 v0, p3

    float-to-double v14, v0

    sub-double/2addr v12, v14

    const-wide/high16 v14, 0x4000000000000000L    # 2.0

    div-double/2addr v12, v14

    const-wide v14, 0x3f91df46a2529d39L    # 0.017453292519943295

    mul-double/2addr v12, v14

    invoke-static {v12, v13}, Ljava/lang/Math;->tan(D)D

    move-result-wide v12

    mul-double/2addr v10, v12

    double-to-float v8, v10

    .line 170
    .local v8, "containedTriangleHeight":F
    sub-float v9, p2, v8

    .line 173
    .local v9, "spacedRadius":F
    float-to-double v10, v9

    add-float v12, v2, p4

    const/high16 v13, 0x40000000    # 2.0f

    div-float/2addr v12, v13

    sub-float v12, v4, v12

    float-to-double v12, v12

    const-wide/high16 v14, 0x4000000000000000L    # 2.0

    invoke-static {v12, v13, v14, v15}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v12

    add-float v14, v3, p5

    const/high16 v15, 0x40000000    # 2.0f

    div-float/2addr v14, v15

    sub-float v14, v5, v14

    float-to-double v14, v14

    const-wide/high16 v16, 0x4000000000000000L    # 2.0

    invoke-static/range {v14 .. v17}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v14

    add-double/2addr v12, v14

    invoke-static {v12, v13}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v12

    sub-double/2addr v10, v12

    double-to-float v9, v10

    .line 177
    return v9
.end method

.method protected drawCenterText(Landroid/graphics/Canvas;)V
    .registers 22
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    .line 616
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/charts/PieChart;->getCenterText()Ljava/lang/CharSequence;

    move-result-object v3

    .line 618
    .local v3, "centerText":Ljava/lang/CharSequence;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/charts/PieChart;->isDrawCenterTextEnabled()Z

    move-result v2

    if-eqz v2, :cond_131

    if-eqz v3, :cond_131

    .line 620
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/charts/PieChart;->getCenterCircleBox()Landroid/graphics/PointF;

    move-result-object v13

    .line 622
    .local v13, "center":Landroid/graphics/PointF;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/charts/PieChart;->isDrawHoleEnabled()Z

    move-result v2

    if-eqz v2, :cond_132

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/charts/PieChart;->isDrawSlicesUnderHoleEnabled()Z

    move-result v2

    if-nez v2, :cond_132

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/charts/PieChart;->getRadius()F

    move-result v2

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/charts/PieChart;->getHoleRadius()F

    move-result v4

    const/high16 v5, 0x42c80000    # 100.0f

    div-float/2addr v4, v5

    mul-float v15, v2, v4

    .line 626
    .local v15, "innerRadius":F
    :goto_45
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mRectBuffer:[Landroid/graphics/RectF;

    const/4 v4, 0x0

    aget-object v14, v2, v4

    .line 627
    .local v14, "holeRect":Landroid/graphics/RectF;
    iget v2, v13, Landroid/graphics/PointF;->x:F

    sub-float/2addr v2, v15

    iput v2, v14, Landroid/graphics/RectF;->left:F

    .line 628
    iget v2, v13, Landroid/graphics/PointF;->y:F

    sub-float/2addr v2, v15

    iput v2, v14, Landroid/graphics/RectF;->top:F

    .line 629
    iget v2, v13, Landroid/graphics/PointF;->x:F

    add-float/2addr v2, v15

    iput v2, v14, Landroid/graphics/RectF;->right:F

    .line 630
    iget v2, v13, Landroid/graphics/PointF;->y:F

    add-float/2addr v2, v15

    iput v2, v14, Landroid/graphics/RectF;->bottom:F

    .line 631
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mRectBuffer:[Landroid/graphics/RectF;

    const/4 v4, 0x1

    aget-object v12, v2, v4

    .line 632
    .local v12, "boundingRect":Landroid/graphics/RectF;
    invoke-virtual {v12, v14}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 634
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/charts/PieChart;->getCenterTextRadiusPercent()F

    move-result v2

    const/high16 v4, 0x42c80000    # 100.0f

    div-float v18, v2, v4

    .line 635
    .local v18, "radiusPercent":F
    move/from16 v0, v18

    float-to-double v4, v0

    const-wide/16 v6, 0x0

    cmpl-double v2, v4, v6

    if-lez v2, :cond_9e

    .line 636
    invoke-virtual {v12}, Landroid/graphics/RectF;->width()F

    move-result v2

    invoke-virtual {v12}, Landroid/graphics/RectF;->width()F

    move-result v4

    mul-float v4, v4, v18

    sub-float/2addr v2, v4

    const/high16 v4, 0x40000000    # 2.0f

    div-float/2addr v2, v4

    invoke-virtual {v12}, Landroid/graphics/RectF;->height()F

    move-result v4

    invoke-virtual {v12}, Landroid/graphics/RectF;->height()F

    move-result v5

    mul-float v5, v5, v18

    sub-float/2addr v4, v5

    const/high16 v5, 0x40000000    # 2.0f

    div-float/2addr v4, v5

    invoke-virtual {v12, v2, v4}, Landroid/graphics/RectF;->inset(FF)V

    .line 642
    :cond_9e
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mCenterTextLastValue:Ljava/lang/CharSequence;

    invoke-virtual {v3, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b2

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mCenterTextLastBounds:Landroid/graphics/RectF;

    invoke-virtual {v12, v2}, Landroid/graphics/RectF;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_eb

    .line 645
    :cond_b2
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mCenterTextLastBounds:Landroid/graphics/RectF;

    invoke-virtual {v2, v12}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 646
    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mCenterTextLastValue:Ljava/lang/CharSequence;

    .line 648
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mCenterTextLastBounds:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v19

    .line 651
    .local v19, "width":F
    new-instance v2, Landroid/text/StaticLayout;

    const/4 v4, 0x0

    invoke-interface {v3}, Ljava/lang/CharSequence;->length()I

    move-result v5

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mCenterTextPaint:Landroid/text/TextPaint;

    move/from16 v0, v19

    float-to-double v7, v0

    invoke-static {v7, v8}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v7

    const-wide/high16 v9, 0x3ff0000000000000L    # 1.0

    invoke-static {v7, v8, v9, v10}, Ljava/lang/Math;->max(DD)D

    move-result-wide v7

    double-to-int v7, v7

    sget-object v8, Landroid/text/Layout$Alignment;->ALIGN_CENTER:Landroid/text/Layout$Alignment;

    const/high16 v9, 0x3f800000    # 1.0f

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-direct/range {v2 .. v11}, Landroid/text/StaticLayout;-><init>(Ljava/lang/CharSequence;IILandroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZ)V

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mCenterTextLayout:Landroid/text/StaticLayout;

    .line 658
    .end local v19    # "width":F
    :cond_eb
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mCenterTextLayout:Landroid/text/StaticLayout;

    invoke-virtual {v2}, Landroid/text/StaticLayout;->getHeight()I

    move-result v2

    int-to-float v0, v2

    move/from16 v16, v0

    .line 660
    .local v16, "layoutHeight":F
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    .line 661
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x12

    if-lt v2, v4, :cond_112

    .line 662
    new-instance v17, Landroid/graphics/Path;

    invoke-direct/range {v17 .. v17}, Landroid/graphics/Path;-><init>()V

    .line 663
    .local v17, "path":Landroid/graphics/Path;
    sget-object v2, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    move-object/from16 v0, v17

    invoke-virtual {v0, v14, v2}, Landroid/graphics/Path;->addOval(Landroid/graphics/RectF;Landroid/graphics/Path$Direction;)V

    .line 664
    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    .line 667
    .end local v17    # "path":Landroid/graphics/Path;
    :cond_112
    iget v2, v12, Landroid/graphics/RectF;->left:F

    iget v4, v12, Landroid/graphics/RectF;->top:F

    invoke-virtual {v12}, Landroid/graphics/RectF;->height()F

    move-result v5

    sub-float v5, v5, v16

    const/high16 v6, 0x40000000    # 2.0f

    div-float/2addr v5, v6

    add-float/2addr v4, v5

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v4}, Landroid/graphics/Canvas;->translate(FF)V

    .line 668
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mCenterTextLayout:Landroid/text/StaticLayout;

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Landroid/text/StaticLayout;->draw(Landroid/graphics/Canvas;)V

    .line 670
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->restore()V

    .line 672
    .end local v12    # "boundingRect":Landroid/graphics/RectF;
    .end local v13    # "center":Landroid/graphics/PointF;
    .end local v14    # "holeRect":Landroid/graphics/RectF;
    .end local v15    # "innerRadius":F
    .end local v16    # "layoutHeight":F
    .end local v18    # "radiusPercent":F
    :cond_131
    return-void

    .line 622
    .restart local v13    # "center":Landroid/graphics/PointF;
    :cond_132
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/charts/PieChart;->getRadius()F

    move-result v15

    goto/16 :goto_45
.end method

.method public drawData(Landroid/graphics/Canvas;)V
    .registers 9
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    .line 110
    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v5}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getChartWidth()F

    move-result v5

    float-to-int v4, v5

    .line 111
    .local v4, "width":I
    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v5}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getChartHeight()F

    move-result v5

    float-to-int v0, v5

    .line 113
    .local v0, "height":I
    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mDrawBitmap:Ljava/lang/ref/WeakReference;

    if-eqz v5, :cond_2e

    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mDrawBitmap:Ljava/lang/ref/WeakReference;

    invoke-virtual {v5}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/graphics/Bitmap;

    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    if-ne v5, v4, :cond_2e

    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mDrawBitmap:Ljava/lang/ref/WeakReference;

    invoke-virtual {v5}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/graphics/Bitmap;

    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    if-eq v5, v0, :cond_4e

    .line 117
    :cond_2e
    if-lez v4, :cond_86

    if-lez v0, :cond_86

    .line 119
    new-instance v5, Ljava/lang/ref/WeakReference;

    sget-object v6, Landroid/graphics/Bitmap$Config;->ARGB_4444:Landroid/graphics/Bitmap$Config;

    invoke-static {v4, v0, v6}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v5, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mDrawBitmap:Ljava/lang/ref/WeakReference;

    .line 120
    new-instance v6, Landroid/graphics/Canvas;

    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mDrawBitmap:Ljava/lang/ref/WeakReference;

    invoke-virtual {v5}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/graphics/Bitmap;

    invoke-direct {v6, v5}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    iput-object v6, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mBitmapCanvas:Landroid/graphics/Canvas;

    .line 125
    :cond_4e
    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mDrawBitmap:Ljava/lang/ref/WeakReference;

    invoke-virtual {v5}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/graphics/Bitmap;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Landroid/graphics/Bitmap;->eraseColor(I)V

    .line 127
    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v5}, Lcom/github/mikephil/charting/charts/PieChart;->getData()Lcom/github/mikephil/charting/data/ChartData;

    move-result-object v2

    check-cast v2, Lcom/github/mikephil/charting/data/PieData;

    .line 129
    .local v2, "pieData":Lcom/github/mikephil/charting/data/PieData;
    invoke-virtual {v2}, Lcom/github/mikephil/charting/data/PieData;->getDataSets()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_6a
    :goto_6a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_86

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;

    .line 131
    .local v3, "set":Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;
    invoke-interface {v3}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->isVisible()Z

    move-result v5

    if-eqz v5, :cond_6a

    invoke-interface {v3}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getEntryCount()I

    move-result v5

    if-lez v5, :cond_6a

    .line 132
    invoke-virtual {p0, p1, v3}, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->drawDataSet(Landroid/graphics/Canvas;Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;)V

    goto :goto_6a

    .line 134
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "pieData":Lcom/github/mikephil/charting/data/PieData;
    .end local v3    # "set":Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;
    :cond_86
    return-void
.end method

.method protected drawDataSet(Landroid/graphics/Canvas;Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;)V
    .registers 44
    .param p1, "c"    # Landroid/graphics/Canvas;
    .param p2, "dataSet"    # Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;

    .prologue
    .line 182
    const/4 v12, 0x0

    .line 183
    .local v12, "angle":F
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/charts/PieChart;->getRotationAngle()F

    move-result v27

    .line 185
    .local v27, "rotationAngle":F
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseX()F

    move-result v25

    .line 186
    .local v25, "phaseX":F
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseY()F

    move-result v26

    .line 188
    .local v26, "phaseY":F
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/charts/PieChart;->getCircleBox()Landroid/graphics/RectF;

    move-result-object v16

    .line 190
    .local v16, "circleBox":Landroid/graphics/RectF;
    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getEntryCount()I

    move-result v21

    .line 191
    .local v21, "entryCount":I
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/charts/PieChart;->getDrawAngles()[F

    move-result-object v17

    .line 192
    .local v17, "drawAngles":[F
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/charts/PieChart;->getCenterCircleBox()Landroid/graphics/PointF;

    move-result-object v4

    .line 193
    .local v4, "center":Landroid/graphics/PointF;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/charts/PieChart;->getRadius()F

    move-result v5

    .line 194
    .local v5, "radius":F
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/charts/PieChart;->isDrawHoleEnabled()Z

    move-result v3

    if-eqz v3, :cond_8d

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/charts/PieChart;->isDrawSlicesUnderHoleEnabled()Z

    move-result v3

    if-nez v3, :cond_8d

    const/16 v18, 0x1

    .line 195
    .local v18, "drawInnerArc":Z
    :goto_53
    if-eqz v18, :cond_90

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/charts/PieChart;->getHoleRadius()F

    move-result v3

    const/high16 v6, 0x42c80000    # 100.0f

    div-float/2addr v3, v6

    mul-float v35, v5, v3

    .line 199
    .local v35, "userInnerRadius":F
    :goto_62
    const/16 v36, 0x0

    .line 200
    .local v36, "visibleAngleCount":I
    const/16 v23, 0x0

    .local v23, "j":I
    :goto_66
    move/from16 v0, v23

    move/from16 v1, v21

    if-ge v0, v1, :cond_93

    .line 202
    move-object/from16 v0, p2

    move/from16 v1, v23

    invoke-interface {v0, v1}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v3

    invoke-virtual {v3}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v3

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    float-to-double v0, v3

    move-wide/from16 v37, v0

    const-wide v39, 0x3eb0c6f7a0b5ed8dL    # 1.0E-6

    cmpl-double v3, v37, v39

    if-lez v3, :cond_8a

    .line 203
    add-int/lit8 v36, v36, 0x1

    .line 200
    :cond_8a
    add-int/lit8 v23, v23, 0x1

    goto :goto_66

    .line 194
    .end local v18    # "drawInnerArc":Z
    .end local v23    # "j":I
    .end local v35    # "userInnerRadius":F
    .end local v36    # "visibleAngleCount":I
    :cond_8d
    const/16 v18, 0x0

    goto :goto_53

    .line 195
    .restart local v18    # "drawInnerArc":Z
    :cond_90
    const/16 v35, 0x0

    goto :goto_62

    .line 207
    .restart local v23    # "j":I
    .restart local v35    # "userInnerRadius":F
    .restart local v36    # "visibleAngleCount":I
    :cond_93
    const/4 v3, 0x1

    move/from16 v0, v36

    if-gt v0, v3, :cond_1e5

    const/16 v29, 0x0

    .line 209
    .local v29, "sliceSpace":F
    :goto_9a
    const/16 v23, 0x0

    :goto_9c
    move/from16 v0, v23

    move/from16 v1, v21

    if-ge v0, v1, :cond_2e5

    .line 211
    aget v28, v17, v23

    .line 212
    .local v28, "sliceAngle":F
    move/from16 v22, v35

    .line 214
    .local v22, "innerRadius":F
    move-object/from16 v0, p2

    move/from16 v1, v23

    invoke-interface {v0, v1}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v19

    .line 217
    .local v19, "e":Lcom/github/mikephil/charting/data/Entry;
    invoke-virtual/range {v19 .. v19}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v3

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    float-to-double v0, v3

    move-wide/from16 v37, v0

    const-wide v39, 0x3eb0c6f7a0b5ed8dL    # 1.0E-6

    cmpl-double v3, v37, v39

    if-lez v3, :cond_1de

    .line 219
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual/range {v19 .. v19}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v37

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/charts/PieChart;->getData()Lcom/github/mikephil/charting/data/ChartData;

    move-result-object v3

    check-cast v3, Lcom/github/mikephil/charting/data/PieData;

    move-object/from16 v0, p2

    invoke-virtual {v3, v0}, Lcom/github/mikephil/charting/data/PieData;->getIndexOfDataSet(Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;)I

    move-result v3

    move/from16 v0, v37

    invoke-virtual {v6, v0, v3}, Lcom/github/mikephil/charting/charts/PieChart;->needsHighlight(II)Z

    move-result v3

    if-nez v3, :cond_1de

    .line 222
    const/4 v3, 0x0

    cmpl-float v3, v29, v3

    if-lez v3, :cond_1eb

    const/high16 v3, 0x43340000    # 180.0f

    cmpg-float v3, v28, v3

    if-gtz v3, :cond_1eb

    const/4 v11, 0x1

    .line 224
    .local v11, "accountForSliceSpacing":Z
    :goto_ee
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p2

    move/from16 v1, v23

    invoke-interface {v0, v1}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getColor(I)I

    move-result v6

    invoke-virtual {v3, v6}, Landroid/graphics/Paint;->setColor(I)V

    .line 226
    const/4 v3, 0x1

    move/from16 v0, v36

    if-ne v0, v3, :cond_1ee

    const/16 v31, 0x0

    .line 229
    .local v31, "sliceSpaceAngleOuter":F
    :goto_104
    const/high16 v3, 0x40000000    # 2.0f

    div-float v3, v31, v3

    add-float/2addr v3, v12

    mul-float v3, v3, v26

    add-float v9, v27, v3

    .line 230
    .local v9, "startAngleOuter":F
    sub-float v3, v28, v31

    mul-float v10, v3, v26

    .line 231
    .local v10, "sweepAngleOuter":F
    const/4 v3, 0x0

    cmpg-float v3, v10, v3

    if-gez v3, :cond_117

    .line 233
    const/4 v10, 0x0

    .line 236
    :cond_117
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mPathBuffer:Landroid/graphics/Path;

    invoke-virtual {v3}, Landroid/graphics/Path;->reset()V

    .line 238
    const/4 v7, 0x0

    .local v7, "arcStartPointX":F
    const/4 v8, 0x0

    .line 240
    .local v8, "arcStartPointY":F
    const/high16 v3, 0x43b40000    # 360.0f

    rem-float v3, v10, v3

    const/4 v6, 0x0

    cmpl-float v3, v3, v6

    if-nez v3, :cond_1f6

    .line 242
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mPathBuffer:Landroid/graphics/Path;

    iget v6, v4, Landroid/graphics/PointF;->x:F

    iget v0, v4, Landroid/graphics/PointF;->y:F

    move/from16 v37, v0

    sget-object v38, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    move/from16 v0, v37

    move-object/from16 v1, v38

    invoke-virtual {v3, v6, v0, v5, v1}, Landroid/graphics/Path;->addCircle(FFFLandroid/graphics/Path$Direction;)V

    .line 258
    :goto_13c
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mInnerRectBuffer:Landroid/graphics/RectF;

    iget v6, v4, Landroid/graphics/PointF;->x:F

    sub-float v6, v6, v22

    iget v0, v4, Landroid/graphics/PointF;->y:F

    move/from16 v37, v0

    sub-float v37, v37, v22

    iget v0, v4, Landroid/graphics/PointF;->x:F

    move/from16 v38, v0

    add-float v38, v38, v22

    iget v0, v4, Landroid/graphics/PointF;->y:F

    move/from16 v39, v0

    add-float v39, v39, v22

    move/from16 v0, v37

    move/from16 v1, v38

    move/from16 v2, v39

    invoke-virtual {v3, v6, v0, v1, v2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 264
    if-eqz v18, :cond_28a

    const/4 v3, 0x0

    cmpl-float v3, v22, v3

    if-gtz v3, :cond_168

    if-eqz v11, :cond_28a

    .line 267
    :cond_168
    if-eqz v11, :cond_184

    .line 268
    mul-float v6, v28, v26

    move-object/from16 v3, p0

    invoke-virtual/range {v3 .. v10}, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->calculateMinimumRadiusForSpacedSlice(Landroid/graphics/PointF;FFFFFF)F

    move-result v24

    .line 276
    .local v24, "minSpacedRadius":F
    const/4 v3, 0x0

    cmpg-float v3, v24, v3

    if-gez v3, :cond_17c

    .line 277
    move/from16 v0, v24

    neg-float v0, v0

    move/from16 v24, v0

    .line 279
    :cond_17c
    move/from16 v0, v22

    move/from16 v1, v24

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v22

    .line 282
    .end local v24    # "minSpacedRadius":F
    :cond_184
    const/4 v3, 0x1

    move/from16 v0, v36

    if-eq v0, v3, :cond_18e

    const/4 v3, 0x0

    cmpl-float v3, v22, v3

    if-nez v3, :cond_22e

    :cond_18e
    const/16 v30, 0x0

    .line 285
    .local v30, "sliceSpaceAngleInner":F
    :goto_190
    const/high16 v3, 0x40000000    # 2.0f

    div-float v3, v30, v3

    add-float/2addr v3, v12

    mul-float v3, v3, v26

    add-float v33, v27, v3

    .line 286
    .local v33, "startAngleInner":F
    sub-float v3, v28, v30

    mul-float v34, v3, v26

    .line 287
    .local v34, "sweepAngleInner":F
    const/4 v3, 0x0

    cmpg-float v3, v34, v3

    if-gez v3, :cond_1a4

    .line 289
    const/16 v34, 0x0

    .line 291
    :cond_1a4
    add-float v20, v33, v34

    .line 293
    .local v20, "endAngleInner":F
    const/high16 v3, 0x43b40000    # 360.0f

    rem-float v3, v10, v3

    const/4 v6, 0x0

    cmpl-float v3, v3, v6

    if-nez v3, :cond_237

    .line 295
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mPathBuffer:Landroid/graphics/Path;

    iget v6, v4, Landroid/graphics/PointF;->x:F

    iget v0, v4, Landroid/graphics/PointF;->y:F

    move/from16 v37, v0

    sget-object v38, Landroid/graphics/Path$Direction;->CCW:Landroid/graphics/Path$Direction;

    move/from16 v0, v37

    move/from16 v1, v22

    move-object/from16 v2, v38

    invoke-virtual {v3, v6, v0, v1, v2}, Landroid/graphics/Path;->addCircle(FFFLandroid/graphics/Path$Direction;)V

    .line 344
    .end local v20    # "endAngleInner":F
    .end local v30    # "sliceSpaceAngleInner":F
    .end local v33    # "startAngleInner":F
    .end local v34    # "sweepAngleInner":F
    :cond_1c4
    :goto_1c4
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mPathBuffer:Landroid/graphics/Path;

    invoke-virtual {v3}, Landroid/graphics/Path;->close()V

    .line 346
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mBitmapCanvas:Landroid/graphics/Canvas;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mPathBuffer:Landroid/graphics/Path;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    move-object/from16 v37, v0

    move-object/from16 v0, v37

    invoke-virtual {v3, v6, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 350
    .end local v7    # "arcStartPointX":F
    .end local v8    # "arcStartPointY":F
    .end local v9    # "startAngleOuter":F
    .end local v10    # "sweepAngleOuter":F
    .end local v11    # "accountForSliceSpacing":Z
    .end local v31    # "sliceSpaceAngleOuter":F
    :cond_1de
    mul-float v3, v28, v25

    add-float/2addr v12, v3

    .line 209
    add-int/lit8 v23, v23, 0x1

    goto/16 :goto_9c

    .line 207
    .end local v19    # "e":Lcom/github/mikephil/charting/data/Entry;
    .end local v22    # "innerRadius":F
    .end local v28    # "sliceAngle":F
    .end local v29    # "sliceSpace":F
    :cond_1e5
    invoke-interface/range {p2 .. p2}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getSliceSpace()F

    move-result v29

    goto/16 :goto_9a

    .line 222
    .restart local v19    # "e":Lcom/github/mikephil/charting/data/Entry;
    .restart local v22    # "innerRadius":F
    .restart local v28    # "sliceAngle":F
    .restart local v29    # "sliceSpace":F
    :cond_1eb
    const/4 v11, 0x0

    goto/16 :goto_ee

    .line 226
    .restart local v11    # "accountForSliceSpacing":Z
    :cond_1ee
    const v3, 0x3c8efa35

    mul-float/2addr v3, v5

    div-float v31, v29, v3

    goto/16 :goto_104

    .line 245
    .restart local v7    # "arcStartPointX":F
    .restart local v8    # "arcStartPointY":F
    .restart local v9    # "startAngleOuter":F
    .restart local v10    # "sweepAngleOuter":F
    .restart local v31    # "sliceSpaceAngleOuter":F
    :cond_1f6
    iget v3, v4, Landroid/graphics/PointF;->x:F

    const v6, 0x3c8efa35

    mul-float/2addr v6, v9

    float-to-double v0, v6

    move-wide/from16 v37, v0

    invoke-static/range {v37 .. v38}, Ljava/lang/Math;->cos(D)D

    move-result-wide v37

    move-wide/from16 v0, v37

    double-to-float v6, v0

    mul-float/2addr v6, v5

    add-float v7, v3, v6

    .line 246
    iget v3, v4, Landroid/graphics/PointF;->y:F

    const v6, 0x3c8efa35

    mul-float/2addr v6, v9

    float-to-double v0, v6

    move-wide/from16 v37, v0

    invoke-static/range {v37 .. v38}, Ljava/lang/Math;->sin(D)D

    move-result-wide v37

    move-wide/from16 v0, v37

    double-to-float v6, v0

    mul-float/2addr v6, v5

    add-float v8, v3, v6

    .line 248
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mPathBuffer:Landroid/graphics/Path;

    invoke-virtual {v3, v7, v8}, Landroid/graphics/Path;->moveTo(FF)V

    .line 250
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mPathBuffer:Landroid/graphics/Path;

    move-object/from16 v0, v16

    invoke-virtual {v3, v0, v9, v10}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    goto/16 :goto_13c

    .line 282
    :cond_22e
    const v3, 0x3c8efa35

    mul-float v3, v3, v22

    div-float v30, v29, v3

    goto/16 :goto_190

    .line 298
    .restart local v20    # "endAngleInner":F
    .restart local v30    # "sliceSpaceAngleInner":F
    .restart local v33    # "startAngleInner":F
    .restart local v34    # "sweepAngleInner":F
    :cond_237
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mPathBuffer:Landroid/graphics/Path;

    iget v6, v4, Landroid/graphics/PointF;->x:F

    const v37, 0x3c8efa35

    mul-float v37, v37, v20

    move/from16 v0, v37

    float-to-double v0, v0

    move-wide/from16 v37, v0

    invoke-static/range {v37 .. v38}, Ljava/lang/Math;->cos(D)D

    move-result-wide v37

    move-wide/from16 v0, v37

    double-to-float v0, v0

    move/from16 v37, v0

    mul-float v37, v37, v22

    add-float v6, v6, v37

    iget v0, v4, Landroid/graphics/PointF;->y:F

    move/from16 v37, v0

    const v38, 0x3c8efa35

    mul-float v38, v38, v20

    move/from16 v0, v38

    float-to-double v0, v0

    move-wide/from16 v38, v0

    invoke-static/range {v38 .. v39}, Ljava/lang/Math;->sin(D)D

    move-result-wide v38

    move-wide/from16 v0, v38

    double-to-float v0, v0

    move/from16 v38, v0

    mul-float v38, v38, v22

    add-float v37, v37, v38

    move/from16 v0, v37

    invoke-virtual {v3, v6, v0}, Landroid/graphics/Path;->lineTo(FF)V

    .line 302
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mPathBuffer:Landroid/graphics/Path;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mInnerRectBuffer:Landroid/graphics/RectF;

    move/from16 v0, v34

    neg-float v0, v0

    move/from16 v37, v0

    move/from16 v0, v20

    move/from16 v1, v37

    invoke-virtual {v3, v6, v0, v1}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    goto/16 :goto_1c4

    .line 311
    .end local v20    # "endAngleInner":F
    .end local v30    # "sliceSpaceAngleInner":F
    .end local v33    # "startAngleInner":F
    .end local v34    # "sweepAngleInner":F
    :cond_28a
    const/high16 v3, 0x43b40000    # 360.0f

    rem-float v3, v10, v3

    const/4 v6, 0x0

    cmpl-float v3, v3, v6

    if-eqz v3, :cond_1c4

    .line 312
    if-eqz v11, :cond_2d4

    .line 314
    const/high16 v3, 0x40000000    # 2.0f

    div-float v3, v10, v3

    add-float v13, v9, v3

    .line 316
    .local v13, "angleMiddle":F
    mul-float v6, v28, v26

    move-object/from16 v3, p0

    invoke-virtual/range {v3 .. v10}, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->calculateMinimumRadiusForSpacedSlice(Landroid/graphics/PointF;FFFFFF)F

    move-result v32

    .line 326
    .local v32, "sliceSpaceOffset":F
    iget v3, v4, Landroid/graphics/PointF;->x:F

    const v6, 0x3c8efa35

    mul-float/2addr v6, v13

    float-to-double v0, v6

    move-wide/from16 v37, v0

    invoke-static/range {v37 .. v38}, Ljava/lang/Math;->cos(D)D

    move-result-wide v37

    move-wide/from16 v0, v37

    double-to-float v6, v0

    mul-float v6, v6, v32

    add-float v14, v3, v6

    .line 328
    .local v14, "arcEndPointX":F
    iget v3, v4, Landroid/graphics/PointF;->y:F

    const v6, 0x3c8efa35

    mul-float/2addr v6, v13

    float-to-double v0, v6

    move-wide/from16 v37, v0

    invoke-static/range {v37 .. v38}, Ljava/lang/Math;->sin(D)D

    move-result-wide v37

    move-wide/from16 v0, v37

    double-to-float v6, v0

    mul-float v6, v6, v32

    add-float v15, v3, v6

    .line 331
    .local v15, "arcEndPointY":F
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mPathBuffer:Landroid/graphics/Path;

    invoke-virtual {v3, v14, v15}, Landroid/graphics/Path;->lineTo(FF)V

    goto/16 :goto_1c4

    .line 336
    .end local v13    # "angleMiddle":F
    .end local v14    # "arcEndPointX":F
    .end local v15    # "arcEndPointY":F
    .end local v32    # "sliceSpaceOffset":F
    :cond_2d4
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mPathBuffer:Landroid/graphics/Path;

    iget v6, v4, Landroid/graphics/PointF;->x:F

    iget v0, v4, Landroid/graphics/PointF;->y:F

    move/from16 v37, v0

    move/from16 v0, v37

    invoke-virtual {v3, v6, v0}, Landroid/graphics/Path;->lineTo(FF)V

    goto/16 :goto_1c4

    .line 352
    .end local v7    # "arcStartPointX":F
    .end local v8    # "arcStartPointY":F
    .end local v9    # "startAngleOuter":F
    .end local v10    # "sweepAngleOuter":F
    .end local v11    # "accountForSliceSpacing":Z
    .end local v19    # "e":Lcom/github/mikephil/charting/data/Entry;
    .end local v22    # "innerRadius":F
    .end local v28    # "sliceAngle":F
    .end local v31    # "sliceSpaceAngleOuter":F
    :cond_2e5
    return-void
.end method

.method public drawExtras(Landroid/graphics/Canvas;)V
    .registers 5
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v2, 0x0

    .line 563
    invoke-virtual {p0, p1}, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->drawHole(Landroid/graphics/Canvas;)V

    .line 564
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mDrawBitmap:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v2, v2, v1}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 565
    invoke-virtual {p0, p1}, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->drawCenterText(Landroid/graphics/Canvas;)V

    .line 566
    return-void
.end method

.method public drawHighlighted(Landroid/graphics/Canvas;[Lcom/github/mikephil/charting/highlight/Highlight;)V
    .registers 50
    .param p1, "c"    # Landroid/graphics/Canvas;
    .param p2, "indices"    # [Lcom/github/mikephil/charting/highlight/Highlight;

    .prologue
    .line 677
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseX()F

    move-result v27

    .line 678
    .local v27, "phaseX":F
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseY()F

    move-result v28

    .line 681
    .local v28, "phaseY":F
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/charts/PieChart;->getRotationAngle()F

    move-result v29

    .line 683
    .local v29, "rotationAngle":F
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/charts/PieChart;->getDrawAngles()[F

    move-result-object v17

    .line 684
    .local v17, "drawAngles":[F
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/charts/PieChart;->getAbsoluteAngles()[F

    move-result-object v11

    .line 685
    .local v11, "absoluteAngles":[F
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/charts/PieChart;->getCenterCircleBox()Landroid/graphics/PointF;

    move-result-object v4

    .line 686
    .local v4, "center":Landroid/graphics/PointF;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/charts/PieChart;->getRadius()F

    move-result v5

    .line 687
    .local v5, "radius":F
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/charts/PieChart;->isDrawHoleEnabled()Z

    move-result v3

    if-eqz v3, :cond_7b

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/charts/PieChart;->isDrawSlicesUnderHoleEnabled()Z

    move-result v3

    if-nez v3, :cond_7b

    const/16 v18, 0x1

    .line 688
    .local v18, "drawInnerArc":Z
    :goto_4e
    if-eqz v18, :cond_7e

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/charts/PieChart;->getHoleRadius()F

    move-result v3

    const/high16 v6, 0x42c80000    # 100.0f

    div-float/2addr v3, v6

    mul-float v42, v5, v3

    .line 692
    .local v42, "userInnerRadius":F
    :goto_5d
    new-instance v21, Landroid/graphics/RectF;

    invoke-direct/range {v21 .. v21}, Landroid/graphics/RectF;-><init>()V

    .line 694
    .local v21, "highlightedCircleBox":Landroid/graphics/RectF;
    const/16 v23, 0x0

    .local v23, "i":I
    :goto_64
    move-object/from16 v0, p2

    array-length v3, v0

    move/from16 v0, v23

    if-ge v0, v3, :cond_308

    .line 697
    aget-object v3, p2, v23

    invoke-virtual {v3}, Lcom/github/mikephil/charting/highlight/Highlight;->getXIndex()I

    move-result v44

    .line 698
    .local v44, "xIndex":I
    move-object/from16 v0, v17

    array-length v3, v0

    move/from16 v0, v44

    if-lt v0, v3, :cond_81

    .line 694
    :cond_78
    :goto_78
    add-int/lit8 v23, v23, 0x1

    goto :goto_64

    .line 687
    .end local v18    # "drawInnerArc":Z
    .end local v21    # "highlightedCircleBox":Landroid/graphics/RectF;
    .end local v23    # "i":I
    .end local v42    # "userInnerRadius":F
    .end local v44    # "xIndex":I
    :cond_7b
    const/16 v18, 0x0

    goto :goto_4e

    .line 688
    .restart local v18    # "drawInnerArc":Z
    :cond_7e
    const/16 v42, 0x0

    goto :goto_5d

    .line 701
    .restart local v21    # "highlightedCircleBox":Landroid/graphics/RectF;
    .restart local v23    # "i":I
    .restart local v42    # "userInnerRadius":F
    .restart local v44    # "xIndex":I
    :cond_81
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/charts/PieChart;->getData()Lcom/github/mikephil/charting/data/ChartData;

    move-result-object v3

    check-cast v3, Lcom/github/mikephil/charting/data/PieData;

    aget-object v6, p2, v23

    invoke-virtual {v6}, Lcom/github/mikephil/charting/highlight/Highlight;->getDataSetIndex()I

    move-result v6

    invoke-virtual {v3, v6}, Lcom/github/mikephil/charting/data/PieData;->getDataSetByIndex(I)Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;

    move-result-object v30

    .line 705
    .local v30, "set":Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;
    if-eqz v30, :cond_78

    invoke-interface/range {v30 .. v30}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->isHighlightEnabled()Z

    move-result v3

    if-eqz v3, :cond_78

    .line 708
    invoke-interface/range {v30 .. v30}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getEntryCount()I

    move-result v20

    .line 709
    .local v20, "entryCount":I
    const/16 v43, 0x0

    .line 710
    .local v43, "visibleAngleCount":I
    const/16 v25, 0x0

    .local v25, "j":I
    :goto_a5
    move/from16 v0, v25

    move/from16 v1, v20

    if-ge v0, v1, :cond_ca

    .line 712
    move-object/from16 v0, v30

    move/from16 v1, v25

    invoke-interface {v0, v1}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v3

    invoke-virtual {v3}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v3

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    float-to-double v6, v3

    const-wide v45, 0x3eb0c6f7a0b5ed8dL    # 1.0E-6

    cmpl-double v3, v6, v45

    if-lez v3, :cond_c7

    .line 713
    add-int/lit8 v43, v43, 0x1

    .line 710
    :cond_c7
    add-int/lit8 v25, v25, 0x1

    goto :goto_a5

    .line 717
    :cond_ca
    if-nez v44, :cond_21d

    .line 718
    const/4 v13, 0x0

    .line 722
    .local v13, "angle":F
    :goto_cd
    const/4 v3, 0x1

    move/from16 v0, v43

    if-gt v0, v3, :cond_225

    const/16 v33, 0x0

    .line 724
    .local v33, "sliceSpace":F
    :goto_d4
    aget v32, v17, v44

    .line 725
    .local v32, "sliceAngle":F
    move/from16 v24, v42

    .line 727
    .local v24, "innerRadius":F
    invoke-interface/range {v30 .. v30}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getSelectionShift()F

    move-result v31

    .line 728
    .local v31, "shift":F
    add-float v22, v5, v31

    .line 729
    .local v22, "highlightedRadius":F
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/charts/PieChart;->getCircleBox()Landroid/graphics/RectF;

    move-result-object v3

    move-object/from16 v0, v21

    invoke-virtual {v0, v3}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 730
    move/from16 v0, v31

    neg-float v3, v0

    move/from16 v0, v31

    neg-float v6, v0

    move-object/from16 v0, v21

    invoke-virtual {v0, v3, v6}, Landroid/graphics/RectF;->inset(FF)V

    .line 732
    const/4 v3, 0x0

    cmpl-float v3, v33, v3

    if-lez v3, :cond_22b

    const/high16 v3, 0x43340000    # 180.0f

    cmpg-float v3, v32, v3

    if-gtz v3, :cond_22b

    const/4 v12, 0x1

    .line 734
    .local v12, "accountForSliceSpacing":Z
    :goto_102
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    move-object/from16 v0, v30

    move/from16 v1, v44

    invoke-interface {v0, v1}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getColor(I)I

    move-result v6

    invoke-virtual {v3, v6}, Landroid/graphics/Paint;->setColor(I)V

    .line 736
    const/4 v3, 0x1

    move/from16 v0, v43

    if-ne v0, v3, :cond_22e

    const/16 v35, 0x0

    .line 740
    .local v35, "sliceSpaceAngleOuter":F
    :goto_118
    const/4 v3, 0x1

    move/from16 v0, v43

    if-ne v0, v3, :cond_236

    const/16 v36, 0x0

    .line 744
    .local v36, "sliceSpaceAngleShifted":F
    :goto_11f
    const/high16 v3, 0x40000000    # 2.0f

    div-float v3, v35, v3

    add-float/2addr v3, v13

    mul-float v3, v3, v28

    add-float v9, v29, v3

    .line 745
    .local v9, "startAngleOuter":F
    sub-float v3, v32, v35

    mul-float v10, v3, v28

    .line 746
    .local v10, "sweepAngleOuter":F
    const/4 v3, 0x0

    cmpg-float v3, v10, v3

    if-gez v3, :cond_132

    .line 748
    const/4 v10, 0x0

    .line 751
    :cond_132
    const/high16 v3, 0x40000000    # 2.0f

    div-float v3, v36, v3

    add-float/2addr v3, v13

    mul-float v3, v3, v28

    add-float v39, v29, v3

    .line 752
    .local v39, "startAngleShifted":F
    sub-float v3, v32, v36

    mul-float v41, v3, v28

    .line 753
    .local v41, "sweepAngleShifted":F
    const/4 v3, 0x0

    cmpg-float v3, v41, v3

    if-gez v3, :cond_146

    .line 755
    const/16 v41, 0x0

    .line 758
    :cond_146
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mPathBuffer:Landroid/graphics/Path;

    invoke-virtual {v3}, Landroid/graphics/Path;->reset()V

    .line 760
    const/high16 v3, 0x43b40000    # 360.0f

    rem-float v3, v10, v3

    const/4 v6, 0x0

    cmpl-float v3, v3, v6

    if-nez v3, :cond_23f

    .line 762
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mPathBuffer:Landroid/graphics/Path;

    iget v6, v4, Landroid/graphics/PointF;->x:F

    iget v7, v4, Landroid/graphics/PointF;->y:F

    sget-object v8, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    move/from16 v0, v22

    invoke-virtual {v3, v6, v7, v0, v8}, Landroid/graphics/Path;->addCircle(FFFLandroid/graphics/Path$Direction;)V

    .line 776
    :goto_165
    const/16 v37, 0x0

    .line 777
    .local v37, "sliceSpaceRadius":F
    if-eqz v12, :cond_191

    .line 778
    mul-float v6, v32, v28

    iget v3, v4, Landroid/graphics/PointF;->x:F

    const v7, 0x3c8efa35

    mul-float/2addr v7, v9

    float-to-double v7, v7

    invoke-static {v7, v8}, Ljava/lang/Math;->cos(D)D

    move-result-wide v7

    double-to-float v7, v7

    mul-float/2addr v7, v5

    add-float/2addr v7, v3

    iget v3, v4, Landroid/graphics/PointF;->y:F

    const v8, 0x3c8efa35

    mul-float/2addr v8, v9

    float-to-double v0, v8

    move-wide/from16 v45, v0

    invoke-static/range {v45 .. v46}, Ljava/lang/Math;->sin(D)D

    move-result-wide v45

    move-wide/from16 v0, v45

    double-to-float v8, v0

    mul-float/2addr v8, v5

    add-float/2addr v8, v3

    move-object/from16 v3, p0

    invoke-virtual/range {v3 .. v10}, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->calculateMinimumRadiusForSpacedSlice(Landroid/graphics/PointF;FFFFFF)F

    move-result v37

    .line 789
    :cond_191
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mInnerRectBuffer:Landroid/graphics/RectF;

    iget v6, v4, Landroid/graphics/PointF;->x:F

    sub-float v6, v6, v24

    iget v7, v4, Landroid/graphics/PointF;->y:F

    sub-float v7, v7, v24

    iget v8, v4, Landroid/graphics/PointF;->x:F

    add-float v8, v8, v24

    iget v0, v4, Landroid/graphics/PointF;->y:F

    move/from16 v45, v0

    add-float v45, v45, v24

    move/from16 v0, v45

    invoke-virtual {v3, v6, v7, v8, v0}, Landroid/graphics/RectF;->set(FFFF)V

    .line 795
    if-eqz v18, :cond_2bf

    const/4 v3, 0x0

    cmpl-float v3, v24, v3

    if-gtz v3, :cond_1b5

    if-eqz v12, :cond_2bf

    .line 798
    :cond_1b5
    if-eqz v12, :cond_1cb

    .line 799
    move/from16 v26, v37

    .line 801
    .local v26, "minSpacedRadius":F
    const/4 v3, 0x0

    cmpg-float v3, v26, v3

    if-gez v3, :cond_1c3

    .line 802
    move/from16 v0, v26

    neg-float v0, v0

    move/from16 v26, v0

    .line 804
    :cond_1c3
    move/from16 v0, v24

    move/from16 v1, v26

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v24

    .line 807
    .end local v26    # "minSpacedRadius":F
    :cond_1cb
    const/4 v3, 0x1

    move/from16 v0, v43

    if-eq v0, v3, :cond_1d5

    const/4 v3, 0x0

    cmpl-float v3, v24, v3

    if-nez v3, :cond_279

    :cond_1d5
    const/16 v34, 0x0

    .line 810
    .local v34, "sliceSpaceAngleInner":F
    :goto_1d7
    const/high16 v3, 0x40000000    # 2.0f

    div-float v3, v34, v3

    add-float/2addr v3, v13

    mul-float v3, v3, v28

    add-float v38, v29, v3

    .line 811
    .local v38, "startAngleInner":F
    sub-float v3, v32, v34

    mul-float v40, v3, v28

    .line 812
    .local v40, "sweepAngleInner":F
    const/4 v3, 0x0

    cmpg-float v3, v40, v3

    if-gez v3, :cond_1eb

    .line 814
    const/16 v40, 0x0

    .line 816
    :cond_1eb
    add-float v19, v38, v40

    .line 818
    .local v19, "endAngleInner":F
    const/high16 v3, 0x43b40000    # 360.0f

    rem-float v3, v10, v3

    const/4 v6, 0x0

    cmpl-float v3, v3, v6

    if-nez v3, :cond_282

    .line 820
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mPathBuffer:Landroid/graphics/Path;

    iget v6, v4, Landroid/graphics/PointF;->x:F

    iget v7, v4, Landroid/graphics/PointF;->y:F

    sget-object v8, Landroid/graphics/Path$Direction;->CCW:Landroid/graphics/Path$Direction;

    move/from16 v0, v24

    invoke-virtual {v3, v6, v7, v0, v8}, Landroid/graphics/Path;->addCircle(FFFLandroid/graphics/Path$Direction;)V

    .line 861
    .end local v19    # "endAngleInner":F
    .end local v34    # "sliceSpaceAngleInner":F
    .end local v38    # "startAngleInner":F
    .end local v40    # "sweepAngleInner":F
    :cond_205
    :goto_205
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mPathBuffer:Landroid/graphics/Path;

    invoke-virtual {v3}, Landroid/graphics/Path;->close()V

    .line 863
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mBitmapCanvas:Landroid/graphics/Canvas;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mPathBuffer:Landroid/graphics/Path;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    invoke-virtual {v3, v6, v7}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    goto/16 :goto_78

    .line 720
    .end local v9    # "startAngleOuter":F
    .end local v10    # "sweepAngleOuter":F
    .end local v12    # "accountForSliceSpacing":Z
    .end local v13    # "angle":F
    .end local v22    # "highlightedRadius":F
    .end local v24    # "innerRadius":F
    .end local v31    # "shift":F
    .end local v32    # "sliceAngle":F
    .end local v33    # "sliceSpace":F
    .end local v35    # "sliceSpaceAngleOuter":F
    .end local v36    # "sliceSpaceAngleShifted":F
    .end local v37    # "sliceSpaceRadius":F
    .end local v39    # "startAngleShifted":F
    .end local v41    # "sweepAngleShifted":F
    :cond_21d
    add-int/lit8 v3, v44, -0x1

    aget v3, v11, v3

    mul-float v13, v3, v27

    .restart local v13    # "angle":F
    goto/16 :goto_cd

    .line 722
    :cond_225
    invoke-interface/range {v30 .. v30}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getSliceSpace()F

    move-result v33

    goto/16 :goto_d4

    .line 732
    .restart local v22    # "highlightedRadius":F
    .restart local v24    # "innerRadius":F
    .restart local v31    # "shift":F
    .restart local v32    # "sliceAngle":F
    .restart local v33    # "sliceSpace":F
    :cond_22b
    const/4 v12, 0x0

    goto/16 :goto_102

    .line 736
    .restart local v12    # "accountForSliceSpacing":Z
    :cond_22e
    const v3, 0x3c8efa35

    mul-float/2addr v3, v5

    div-float v35, v33, v3

    goto/16 :goto_118

    .line 740
    .restart local v35    # "sliceSpaceAngleOuter":F
    :cond_236
    const v3, 0x3c8efa35

    mul-float v3, v3, v22

    div-float v36, v33, v3

    goto/16 :goto_11f

    .line 765
    .restart local v9    # "startAngleOuter":F
    .restart local v10    # "sweepAngleOuter":F
    .restart local v36    # "sliceSpaceAngleShifted":F
    .restart local v39    # "startAngleShifted":F
    .restart local v41    # "sweepAngleShifted":F
    :cond_23f
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mPathBuffer:Landroid/graphics/Path;

    iget v6, v4, Landroid/graphics/PointF;->x:F

    const v7, 0x3c8efa35

    mul-float v7, v7, v39

    float-to-double v7, v7

    invoke-static {v7, v8}, Ljava/lang/Math;->cos(D)D

    move-result-wide v7

    double-to-float v7, v7

    mul-float v7, v7, v22

    add-float/2addr v6, v7

    iget v7, v4, Landroid/graphics/PointF;->y:F

    const v8, 0x3c8efa35

    mul-float v8, v8, v39

    float-to-double v0, v8

    move-wide/from16 v45, v0

    invoke-static/range {v45 .. v46}, Ljava/lang/Math;->sin(D)D

    move-result-wide v45

    move-wide/from16 v0, v45

    double-to-float v8, v0

    mul-float v8, v8, v22

    add-float/2addr v7, v8

    invoke-virtual {v3, v6, v7}, Landroid/graphics/Path;->moveTo(FF)V

    .line 769
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mPathBuffer:Landroid/graphics/Path;

    move-object/from16 v0, v21

    move/from16 v1, v39

    move/from16 v2, v41

    invoke-virtual {v3, v0, v1, v2}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    goto/16 :goto_165

    .line 807
    .restart local v37    # "sliceSpaceRadius":F
    :cond_279
    const v3, 0x3c8efa35

    mul-float v3, v3, v24

    div-float v34, v33, v3

    goto/16 :goto_1d7

    .line 823
    .restart local v19    # "endAngleInner":F
    .restart local v34    # "sliceSpaceAngleInner":F
    .restart local v38    # "startAngleInner":F
    .restart local v40    # "sweepAngleInner":F
    :cond_282
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mPathBuffer:Landroid/graphics/Path;

    iget v6, v4, Landroid/graphics/PointF;->x:F

    const v7, 0x3c8efa35

    mul-float v7, v7, v19

    float-to-double v7, v7

    invoke-static {v7, v8}, Ljava/lang/Math;->cos(D)D

    move-result-wide v7

    double-to-float v7, v7

    mul-float v7, v7, v24

    add-float/2addr v6, v7

    iget v7, v4, Landroid/graphics/PointF;->y:F

    const v8, 0x3c8efa35

    mul-float v8, v8, v19

    float-to-double v0, v8

    move-wide/from16 v45, v0

    invoke-static/range {v45 .. v46}, Ljava/lang/Math;->sin(D)D

    move-result-wide v45

    move-wide/from16 v0, v45

    double-to-float v8, v0

    mul-float v8, v8, v24

    add-float/2addr v7, v8

    invoke-virtual {v3, v6, v7}, Landroid/graphics/Path;->lineTo(FF)V

    .line 827
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mPathBuffer:Landroid/graphics/Path;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mInnerRectBuffer:Landroid/graphics/RectF;

    move/from16 v0, v40

    neg-float v7, v0

    move/from16 v0, v19

    invoke-virtual {v3, v6, v0, v7}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    goto/16 :goto_205

    .line 836
    .end local v19    # "endAngleInner":F
    .end local v34    # "sliceSpaceAngleInner":F
    .end local v38    # "startAngleInner":F
    .end local v40    # "sweepAngleInner":F
    :cond_2bf
    const/high16 v3, 0x43b40000    # 360.0f

    rem-float v3, v10, v3

    const/4 v6, 0x0

    cmpl-float v3, v3, v6

    if-eqz v3, :cond_205

    .line 838
    if-eqz v12, :cond_2fb

    .line 839
    const/high16 v3, 0x40000000    # 2.0f

    div-float v3, v10, v3

    add-float v14, v9, v3

    .line 841
    .local v14, "angleMiddle":F
    iget v3, v4, Landroid/graphics/PointF;->x:F

    const v6, 0x3c8efa35

    mul-float/2addr v6, v14

    float-to-double v6, v6

    invoke-static {v6, v7}, Ljava/lang/Math;->cos(D)D

    move-result-wide v6

    double-to-float v6, v6

    mul-float v6, v6, v37

    add-float v15, v3, v6

    .line 843
    .local v15, "arcEndPointX":F
    iget v3, v4, Landroid/graphics/PointF;->y:F

    const v6, 0x3c8efa35

    mul-float/2addr v6, v14

    float-to-double v6, v6

    invoke-static {v6, v7}, Ljava/lang/Math;->sin(D)D

    move-result-wide v6

    double-to-float v6, v6

    mul-float v6, v6, v37

    add-float v16, v3, v6

    .line 846
    .local v16, "arcEndPointY":F
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mPathBuffer:Landroid/graphics/Path;

    move/from16 v0, v16

    invoke-virtual {v3, v15, v0}, Landroid/graphics/Path;->lineTo(FF)V

    goto/16 :goto_205

    .line 852
    .end local v14    # "angleMiddle":F
    .end local v15    # "arcEndPointX":F
    .end local v16    # "arcEndPointY":F
    :cond_2fb
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mPathBuffer:Landroid/graphics/Path;

    iget v6, v4, Landroid/graphics/PointF;->x:F

    iget v7, v4, Landroid/graphics/PointF;->y:F

    invoke-virtual {v3, v6, v7}, Landroid/graphics/Path;->lineTo(FF)V

    goto/16 :goto_205

    .line 865
    .end local v9    # "startAngleOuter":F
    .end local v10    # "sweepAngleOuter":F
    .end local v12    # "accountForSliceSpacing":Z
    .end local v13    # "angle":F
    .end local v20    # "entryCount":I
    .end local v22    # "highlightedRadius":F
    .end local v24    # "innerRadius":F
    .end local v25    # "j":I
    .end local v30    # "set":Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;
    .end local v31    # "shift":F
    .end local v32    # "sliceAngle":F
    .end local v33    # "sliceSpace":F
    .end local v35    # "sliceSpaceAngleOuter":F
    .end local v36    # "sliceSpaceAngleShifted":F
    .end local v37    # "sliceSpaceRadius":F
    .end local v39    # "startAngleShifted":F
    .end local v41    # "sweepAngleShifted":F
    .end local v43    # "visibleAngleCount":I
    .end local v44    # "xIndex":I
    :cond_308
    return-void
.end method

.method protected drawHole(Landroid/graphics/Canvas;)V
    .registers 12
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    const/high16 v9, 0x42c80000    # 100.0f

    .line 576
    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v5}, Lcom/github/mikephil/charting/charts/PieChart;->isDrawHoleEnabled()Z

    move-result v5

    if-eqz v5, :cond_9f

    .line 578
    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v5}, Lcom/github/mikephil/charting/charts/PieChart;->getRadius()F

    move-result v3

    .line 579
    .local v3, "radius":F
    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v5}, Lcom/github/mikephil/charting/charts/PieChart;->getHoleRadius()F

    move-result v5

    div-float/2addr v5, v9

    mul-float v2, v3, v5

    .line 580
    .local v2, "holeRadius":F
    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v5}, Lcom/github/mikephil/charting/charts/PieChart;->getCenterCircleBox()Landroid/graphics/PointF;

    move-result-object v1

    .line 582
    .local v1, "center":Landroid/graphics/PointF;
    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mHolePaint:Landroid/graphics/Paint;

    invoke-virtual {v5}, Landroid/graphics/Paint;->getColor()I

    move-result v5

    invoke-static {v5}, Landroid/graphics/Color;->alpha(I)I

    move-result v5

    if-lez v5, :cond_36

    .line 584
    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mBitmapCanvas:Landroid/graphics/Canvas;

    iget v6, v1, Landroid/graphics/PointF;->x:F

    iget v7, v1, Landroid/graphics/PointF;->y:F

    iget-object v8, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mHolePaint:Landroid/graphics/Paint;

    invoke-virtual {v5, v6, v7, v2, v8}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 590
    :cond_36
    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mTransparentCirclePaint:Landroid/graphics/Paint;

    invoke-virtual {v5}, Landroid/graphics/Paint;->getColor()I

    move-result v5

    invoke-static {v5}, Landroid/graphics/Color;->alpha(I)I

    move-result v5

    if-lez v5, :cond_9f

    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v5}, Lcom/github/mikephil/charting/charts/PieChart;->getTransparentCircleRadius()F

    move-result v5

    iget-object v6, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v6}, Lcom/github/mikephil/charting/charts/PieChart;->getHoleRadius()F

    move-result v6

    cmpl-float v5, v5, v6

    if-lez v5, :cond_9f

    .line 593
    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mTransparentCirclePaint:Landroid/graphics/Paint;

    invoke-virtual {v5}, Landroid/graphics/Paint;->getAlpha()I

    move-result v0

    .line 594
    .local v0, "alpha":I
    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v5}, Lcom/github/mikephil/charting/charts/PieChart;->getTransparentCircleRadius()F

    move-result v5

    div-float/2addr v5, v9

    mul-float v4, v3, v5

    .line 596
    .local v4, "secondHoleRadius":F
    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mTransparentCirclePaint:Landroid/graphics/Paint;

    int-to-float v6, v0

    iget-object v7, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v7}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseX()F

    move-result v7

    mul-float/2addr v6, v7

    iget-object v7, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v7}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseY()F

    move-result v7

    mul-float/2addr v6, v7

    float-to-int v6, v6

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 599
    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mHoleCirclePath:Landroid/graphics/Path;

    invoke-virtual {v5}, Landroid/graphics/Path;->reset()V

    .line 600
    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mHoleCirclePath:Landroid/graphics/Path;

    iget v6, v1, Landroid/graphics/PointF;->x:F

    iget v7, v1, Landroid/graphics/PointF;->y:F

    sget-object v8, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    invoke-virtual {v5, v6, v7, v4, v8}, Landroid/graphics/Path;->addCircle(FFFLandroid/graphics/Path$Direction;)V

    .line 601
    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mHoleCirclePath:Landroid/graphics/Path;

    iget v6, v1, Landroid/graphics/PointF;->x:F

    iget v7, v1, Landroid/graphics/PointF;->y:F

    sget-object v8, Landroid/graphics/Path$Direction;->CCW:Landroid/graphics/Path$Direction;

    invoke-virtual {v5, v6, v7, v2, v8}, Landroid/graphics/Path;->addCircle(FFFLandroid/graphics/Path$Direction;)V

    .line 602
    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mBitmapCanvas:Landroid/graphics/Canvas;

    iget-object v6, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mHoleCirclePath:Landroid/graphics/Path;

    iget-object v7, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mTransparentCirclePaint:Landroid/graphics/Paint;

    invoke-virtual {v5, v6, v7}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 605
    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mTransparentCirclePaint:Landroid/graphics/Paint;

    invoke-virtual {v5, v0}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 608
    .end local v0    # "alpha":I
    .end local v1    # "center":Landroid/graphics/PointF;
    .end local v2    # "holeRadius":F
    .end local v3    # "radius":F
    .end local v4    # "secondHoleRadius":F
    :cond_9f
    return-void
.end method

.method protected drawRoundedSlices(Landroid/graphics/Canvas;)V
    .registers 21
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    .line 874
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v15}, Lcom/github/mikephil/charting/charts/PieChart;->isDrawRoundedSlicesEnabled()Z

    move-result v15

    if-nez v15, :cond_b

    .line 916
    :cond_a
    return-void

    .line 877
    :cond_b
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v15}, Lcom/github/mikephil/charting/charts/PieChart;->getData()Lcom/github/mikephil/charting/data/ChartData;

    move-result-object v15

    check-cast v15, Lcom/github/mikephil/charting/data/PieData;

    invoke-virtual {v15}, Lcom/github/mikephil/charting/data/PieData;->getDataSet()Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;

    move-result-object v5

    .line 879
    .local v5, "dataSet":Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;
    invoke-interface {v5}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->isVisible()Z

    move-result v15

    if-eqz v15, :cond_a

    .line 882
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v15}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseX()F

    move-result v9

    .line 883
    .local v9, "phaseX":F
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v15}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseY()F

    move-result v10

    .line 885
    .local v10, "phaseY":F
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v15}, Lcom/github/mikephil/charting/charts/PieChart;->getCenterCircleBox()Landroid/graphics/PointF;

    move-result-object v3

    .line 886
    .local v3, "center":Landroid/graphics/PointF;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v15}, Lcom/github/mikephil/charting/charts/PieChart;->getRadius()F

    move-result v11

    .line 889
    .local v11, "r":F
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v15}, Lcom/github/mikephil/charting/charts/PieChart;->getHoleRadius()F

    move-result v15

    mul-float/2addr v15, v11

    const/high16 v16, 0x42c80000    # 100.0f

    div-float v15, v15, v16

    sub-float v15, v11, v15

    const/high16 v16, 0x40000000    # 2.0f

    div-float v4, v15, v16

    .line 891
    .local v4, "circleRadius":F
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v15}, Lcom/github/mikephil/charting/charts/PieChart;->getDrawAngles()[F

    move-result-object v6

    .line 892
    .local v6, "drawAngles":[F
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v15}, Lcom/github/mikephil/charting/charts/PieChart;->getRotationAngle()F

    move-result v2

    .line 894
    .local v2, "angle":F
    const/4 v8, 0x0

    .local v8, "j":I
    :goto_63
    invoke-interface {v5}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getEntryCount()I

    move-result v15

    if-ge v8, v15, :cond_a

    .line 896
    aget v12, v6, v8

    .line 898
    .local v12, "sliceAngle":F
    invoke-interface {v5, v8}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v7

    .line 901
    .local v7, "e":Lcom/github/mikephil/charting/data/Entry;
    invoke-virtual {v7}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v15

    invoke-static {v15}, Ljava/lang/Math;->abs(F)F

    move-result v15

    float-to-double v15, v15

    const-wide v17, 0x3eb0c6f7a0b5ed8dL    # 1.0E-6

    cmpl-double v15, v15, v17

    if-lez v15, :cond_df

    .line 903
    sub-float v15, v11, v4

    float-to-double v15, v15

    add-float v17, v2, v12

    mul-float v17, v17, v10

    move/from16 v0, v17

    float-to-double v0, v0

    move-wide/from16 v17, v0

    invoke-static/range {v17 .. v18}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v17

    invoke-static/range {v17 .. v18}, Ljava/lang/Math;->cos(D)D

    move-result-wide v17

    mul-double v15, v15, v17

    iget v0, v3, Landroid/graphics/PointF;->x:F

    move/from16 v17, v0

    move/from16 v0, v17

    float-to-double v0, v0

    move-wide/from16 v17, v0

    add-double v15, v15, v17

    double-to-float v13, v15

    .line 906
    .local v13, "x":F
    sub-float v15, v11, v4

    float-to-double v15, v15

    add-float v17, v2, v12

    mul-float v17, v17, v10

    move/from16 v0, v17

    float-to-double v0, v0

    move-wide/from16 v17, v0

    invoke-static/range {v17 .. v18}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v17

    invoke-static/range {v17 .. v18}, Ljava/lang/Math;->sin(D)D

    move-result-wide v17

    mul-double v15, v15, v17

    iget v0, v3, Landroid/graphics/PointF;->y:F

    move/from16 v17, v0

    move/from16 v0, v17

    float-to-double v0, v0

    move-wide/from16 v17, v0

    add-double v15, v15, v17

    double-to-float v14, v15

    .line 910
    .local v14, "y":F
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    invoke-interface {v5, v8}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getColor(I)I

    move-result v16

    invoke-virtual/range {v15 .. v16}, Landroid/graphics/Paint;->setColor(I)V

    .line 911
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mBitmapCanvas:Landroid/graphics/Canvas;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mRenderPaint:Landroid/graphics/Paint;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v15, v13, v14, v4, v0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 914
    .end local v13    # "x":F
    .end local v14    # "y":F
    :cond_df
    mul-float v15, v12, v9

    add-float/2addr v2, v15

    .line 894
    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_63
.end method

.method public drawValues(Landroid/graphics/Canvas;)V
    .registers 79
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    .line 357
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/charts/PieChart;->getCenterCircleBox()Landroid/graphics/PointF;

    move-result-object v40

    .line 360
    .local v40, "center":Landroid/graphics/PointF;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/charts/PieChart;->getRadius()F

    move-result v62

    .line 361
    .local v62, "radius":F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/charts/PieChart;->getRotationAngle()F

    move-result v63

    .line 362
    .local v63, "rotationAngle":F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/charts/PieChart;->getDrawAngles()[F

    move-result-object v44

    .line 363
    .local v44, "drawAngles":[F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/charts/PieChart;->getAbsoluteAngles()[F

    move-result-object v37

    .line 365
    .local v37, "absoluteAngles":[F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseX()F

    move-result v59

    .line 366
    .local v59, "phaseX":F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mAnimator:Lcom/github/mikephil/charting/animation/ChartAnimator;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/animation/ChartAnimator;->getPhaseY()F

    move-result v60

    .line 368
    .local v60, "phaseY":F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/charts/PieChart;->getHoleRadius()F

    move-result v2

    const/high16 v7, 0x42c80000    # 100.0f

    div-float v52, v2, v7

    .line 369
    .local v52, "holeRadiusPercent":F
    const/high16 v2, 0x41200000    # 10.0f

    div-float v2, v62, v2

    const v7, 0x40666666    # 3.6f

    mul-float v56, v2, v7

    .line 371
    .local v56, "labelRadiusOffset":F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/charts/PieChart;->isDrawHoleEnabled()Z

    move-result v2

    if-eqz v2, :cond_5f

    .line 372
    mul-float v2, v62, v52

    sub-float v2, v62, v2

    const/high16 v7, 0x40000000    # 2.0f

    div-float v56, v2, v7

    .line 375
    :cond_5f
    sub-float v55, v62, v56

    .line 377
    .local v55, "labelRadius":F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/charts/PieChart;->getData()Lcom/github/mikephil/charting/data/ChartData;

    move-result-object v41

    check-cast v41, Lcom/github/mikephil/charting/data/PieData;

    .line 378
    .local v41, "data":Lcom/github/mikephil/charting/data/PieData;
    invoke-virtual/range {v41 .. v41}, Lcom/github/mikephil/charting/data/PieData;->getDataSets()Ljava/util/List;

    move-result-object v43

    .line 380
    .local v43, "dataSets":Ljava/util/List;, "Ljava/util/List<Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;>;"
    invoke-virtual/range {v41 .. v41}, Lcom/github/mikephil/charting/data/PieData;->getYValueSum()F

    move-result v76

    .line 382
    .local v76, "yValueSum":F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/charts/PieChart;->isDrawSliceTextEnabled()Z

    move-result v47

    .line 385
    .local v47, "drawXVals":Z
    const/16 v73, 0x0

    .line 387
    .local v73, "xIndex":I
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    .line 389
    const/16 v53, 0x0

    .local v53, "i":I
    :goto_82
    invoke-interface/range {v43 .. v43}, Ljava/util/List;->size()I

    move-result v2

    move/from16 v0, v53

    if-ge v0, v2, :cond_3b7

    .line 391
    move-object/from16 v0, v43

    move/from16 v1, v53

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v42

    check-cast v42, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;

    .line 393
    .local v42, "dataSet":Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;
    invoke-interface/range {v42 .. v42}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->isDrawValuesEnabled()Z

    move-result v50

    .line 395
    .local v50, "drawYVals":Z
    if-nez v50, :cond_9f

    if-nez v47, :cond_9f

    .line 389
    :cond_9c
    add-int/lit8 v53, v53, 0x1

    goto :goto_82

    .line 398
    :cond_9f
    invoke-interface/range {v42 .. v42}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getXValuePosition()Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;

    move-result-object v74

    .line 399
    .local v74, "xValuePosition":Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;
    invoke-interface/range {v42 .. v42}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getYValuePosition()Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;

    move-result-object v75

    .line 402
    .local v75, "yValuePosition":Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;
    move-object/from16 v0, p0

    move-object/from16 v1, v42

    invoke-virtual {v0, v1}, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->applyValueTextStyle(Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;)V

    .line 404
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mValuePaint:Landroid/graphics/Paint;

    const-string v7, "Q"

    invoke-static {v2, v7}, Lcom/github/mikephil/charting/utils/Utils;->calcTextHeight(Landroid/graphics/Paint;Ljava/lang/String;)I

    move-result v2

    int-to-float v2, v2

    const/high16 v7, 0x40800000    # 4.0f

    invoke-static {v7}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v7

    add-float v58, v2, v7

    .line 407
    .local v58, "lineHeight":F
    invoke-interface/range {v42 .. v42}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getValueFormatter()Lcom/github/mikephil/charting/formatter/ValueFormatter;

    move-result-object v14

    .line 409
    .local v14, "formatter":Lcom/github/mikephil/charting/formatter/ValueFormatter;
    invoke-interface/range {v42 .. v42}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getEntryCount()I

    move-result v51

    .line 411
    .local v51, "entryCount":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mValueLinePaint:Landroid/graphics/Paint;

    invoke-interface/range {v42 .. v42}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getValueLineColor()I

    move-result v7

    invoke-virtual {v2, v7}, Landroid/graphics/Paint;->setColor(I)V

    .line 412
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mValueLinePaint:Landroid/graphics/Paint;

    invoke-interface/range {v42 .. v42}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getValueLineWidth()F

    move-result v7

    invoke-static {v7}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v7

    invoke-virtual {v2, v7}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 414
    const/16 v54, 0x0

    .local v54, "j":I
    :goto_e5
    move/from16 v0, v54

    move/from16 v1, v51

    if-ge v0, v1, :cond_9c

    .line 416
    move-object/from16 v0, v42

    move/from16 v1, v54

    invoke-interface {v0, v1}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v16

    .line 418
    .local v16, "entry":Lcom/github/mikephil/charting/data/Entry;
    if-nez v73, :cond_2c3

    .line 419
    const/16 v38, 0x0

    .line 423
    .local v38, "angle":F
    :goto_f7
    aget v64, v44, v73

    .line 424
    .local v64, "sliceAngle":F
    invoke-interface/range {v42 .. v42}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getSliceSpace()F

    move-result v65

    .line 425
    .local v65, "sliceSpace":F
    const v2, 0x3c8efa35

    mul-float v2, v2, v55

    div-float v66, v65, v2

    .line 428
    .local v66, "sliceSpaceMiddleAngle":F
    const/high16 v2, 0x40000000    # 2.0f

    div-float v2, v66, v2

    sub-float v2, v64, v2

    const/high16 v7, 0x40000000    # 2.0f

    div-float v39, v2, v7

    .line 430
    .local v39, "angleOffset":F
    add-float v38, v38, v39

    .line 432
    mul-float v2, v38, v60

    add-float v69, v63, v2

    .line 434
    .local v69, "transformedAngle":F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/charts/PieChart;->isUsePercentValuesEnabled()Z

    move-result v2

    if-eqz v2, :cond_2cb

    invoke-virtual/range {v16 .. v16}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v2

    div-float v2, v2, v76

    const/high16 v7, 0x42c80000    # 100.0f

    mul-float v15, v2, v7

    .line 437
    .local v15, "value":F
    :goto_128
    const v2, 0x3c8efa35

    mul-float v2, v2, v69

    float-to-double v7, v2

    invoke-static {v7, v8}, Ljava/lang/Math;->cos(D)D

    move-result-wide v7

    double-to-float v0, v7

    move/from16 v67, v0

    .line 438
    .local v67, "sliceXBase":F
    const v2, 0x3c8efa35

    mul-float v2, v2, v69

    float-to-double v7, v2

    invoke-static {v7, v8}, Ljava/lang/Math;->sin(D)D

    move-result-wide v7

    double-to-float v0, v7

    move/from16 v68, v0

    .line 440
    .local v68, "sliceYBase":F
    if-eqz v47, :cond_2d1

    sget-object v2, Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;->OUTSIDE_SLICE:Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;

    move-object/from16 v0, v74

    if-ne v0, v2, :cond_2d1

    const/16 v46, 0x1

    .line 442
    .local v46, "drawXOutside":Z
    :goto_14c
    if-eqz v50, :cond_2d5

    sget-object v2, Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;->OUTSIDE_SLICE:Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;

    move-object/from16 v0, v75

    if-ne v0, v2, :cond_2d5

    const/16 v49, 0x1

    .line 444
    .local v49, "drawYOutside":Z
    :goto_156
    if-eqz v47, :cond_2d9

    sget-object v2, Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;->INSIDE_SLICE:Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;

    move-object/from16 v0, v74

    if-ne v0, v2, :cond_2d9

    const/16 v45, 0x1

    .line 446
    .local v45, "drawXInside":Z
    :goto_160
    if-eqz v50, :cond_2dd

    sget-object v2, Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;->INSIDE_SLICE:Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;

    move-object/from16 v0, v75

    if-ne v0, v2, :cond_2dd

    const/16 v48, 0x1

    .line 449
    .local v48, "drawYInside":Z
    :goto_16a
    if-nez v46, :cond_16e

    if-eqz v49, :cond_264

    .line 451
    :cond_16e
    invoke-interface/range {v42 .. v42}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getValueLinePart1Length()F

    move-result v70

    .line 452
    .local v70, "valueLineLength1":F
    invoke-interface/range {v42 .. v42}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getValueLinePart2Length()F

    move-result v71

    .line 453
    .local v71, "valueLineLength2":F
    invoke-interface/range {v42 .. v42}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getValueLinePart1OffsetPercentage()F

    move-result v2

    const/high16 v7, 0x42c80000    # 100.0f

    div-float v72, v2, v7

    .line 460
    .local v72, "valueLinePart1OffsetPercentage":F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mChart:Lcom/github/mikephil/charting/charts/PieChart;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/charts/PieChart;->isDrawHoleEnabled()Z

    move-result v2

    if-eqz v2, :cond_2e1

    .line 461
    mul-float v2, v62, v52

    sub-float v2, v62, v2

    mul-float v2, v2, v72

    mul-float v7, v62, v52

    add-float v57, v2, v7

    .line 467
    .local v57, "line1Radius":F
    :goto_192
    invoke-interface/range {v42 .. v42}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->isValueLineVariableLength()Z

    move-result v2

    if-eqz v2, :cond_2e5

    mul-float v2, v55, v71

    const v7, 0x3c8efa35

    mul-float v7, v7, v69

    float-to-double v7, v7

    invoke-static {v7, v8}, Ljava/lang/Math;->sin(D)D

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Math;->abs(D)D

    move-result-wide v7

    double-to-float v7, v7

    mul-float v61, v2, v7

    .line 472
    .local v61, "polyline2Width":F
    :goto_1ab
    mul-float v2, v57, v67

    move-object/from16 v0, v40

    iget v7, v0, Landroid/graphics/PointF;->x:F

    add-float v3, v2, v7

    .line 473
    .local v3, "pt0x":F
    mul-float v2, v57, v68

    move-object/from16 v0, v40

    iget v7, v0, Landroid/graphics/PointF;->y:F

    add-float v4, v2, v7

    .line 475
    .local v4, "pt0y":F
    const/high16 v2, 0x3f800000    # 1.0f

    add-float v2, v2, v70

    mul-float v2, v2, v55

    mul-float v2, v2, v67

    move-object/from16 v0, v40

    iget v7, v0, Landroid/graphics/PointF;->x:F

    add-float v5, v2, v7

    .line 476
    .local v5, "pt1x":F
    const/high16 v2, 0x3f800000    # 1.0f

    add-float v2, v2, v70

    mul-float v2, v2, v55

    mul-float v2, v2, v68

    move-object/from16 v0, v40

    iget v7, v0, Landroid/graphics/PointF;->y:F

    add-float v6, v2, v7

    .line 478
    .local v6, "pt1y":F
    move/from16 v0, v69

    float-to-double v7, v0

    const-wide v12, 0x4076800000000000L    # 360.0

    rem-double/2addr v7, v12

    const-wide v12, 0x4056800000000000L    # 90.0

    cmpl-double v2, v7, v12

    if-ltz v2, :cond_2e9

    move/from16 v0, v69

    float-to-double v7, v0

    const-wide v12, 0x4076800000000000L    # 360.0

    rem-double/2addr v7, v12

    const-wide v12, 0x4070e00000000000L    # 270.0

    cmpg-double v2, v7, v12

    if-gtz v2, :cond_2e9

    .line 479
    sub-float v10, v5, v61

    .line 480
    .local v10, "pt2x":F
    move v11, v6

    .line 481
    .local v11, "pt2y":F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mValuePaint:Landroid/graphics/Paint;

    sget-object v7, Landroid/graphics/Paint$Align;->RIGHT:Landroid/graphics/Paint$Align;

    invoke-virtual {v2, v7}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 482
    const/high16 v2, 0x40a00000    # 5.0f

    invoke-static {v2}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v2

    sub-float v18, v10, v2

    .line 483
    .local v18, "labelPtx":F
    move/from16 v19, v11

    .line 492
    .local v19, "labelPty":F
    :goto_211
    invoke-interface/range {v42 .. v42}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getValueLineColor()I

    move-result v2

    const v7, 0x112233

    if-eq v2, v7, :cond_22e

    .line 493
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mValueLinePaint:Landroid/graphics/Paint;

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 494
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mValueLinePaint:Landroid/graphics/Paint;

    move-object/from16 v7, p1

    move v8, v5

    move v9, v6

    invoke-virtual/range {v7 .. v12}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 498
    :cond_22e
    if-eqz v46, :cond_301

    if-eqz v49, :cond_301

    .line 500
    const/16 v17, 0x0

    move-object/from16 v0, v42

    move/from16 v1, v54

    invoke-interface {v0, v1}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getValueTextColor(I)I

    move-result v20

    move-object/from16 v12, p0

    move-object/from16 v13, p1

    invoke-virtual/range {v12 .. v20}, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->drawValue(Landroid/graphics/Canvas;Lcom/github/mikephil/charting/formatter/ValueFormatter;FLcom/github/mikephil/charting/data/Entry;IFFI)V

    .line 509
    invoke-virtual/range {v41 .. v41}, Lcom/github/mikephil/charting/data/PieData;->getXValCount()I

    move-result v2

    move/from16 v0, v54

    if-ge v0, v2, :cond_264

    .line 510
    invoke-virtual/range {v41 .. v41}, Lcom/github/mikephil/charting/data/PieData;->getXVals()Ljava/util/List;

    move-result-object v2

    move/from16 v0, v54

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    add-float v7, v19, v58

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mValuePaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    move/from16 v1, v18

    invoke-virtual {v0, v2, v1, v7, v8}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 525
    .end local v3    # "pt0x":F
    .end local v4    # "pt0y":F
    .end local v5    # "pt1x":F
    .end local v6    # "pt1y":F
    .end local v10    # "pt2x":F
    .end local v11    # "pt2y":F
    .end local v18    # "labelPtx":F
    .end local v19    # "labelPty":F
    .end local v57    # "line1Radius":F
    .end local v61    # "polyline2Width":F
    .end local v70    # "valueLineLength1":F
    .end local v71    # "valueLineLength2":F
    .end local v72    # "valueLinePart1OffsetPercentage":F
    :cond_264
    :goto_264
    if-nez v45, :cond_268

    if-eqz v48, :cond_2bd

    .line 527
    :cond_268
    mul-float v2, v55, v67

    move-object/from16 v0, v40

    iget v7, v0, Landroid/graphics/PointF;->x:F

    add-float v26, v2, v7

    .line 528
    .local v26, "x":F
    mul-float v2, v55, v68

    move-object/from16 v0, v40

    iget v7, v0, Landroid/graphics/PointF;->y:F

    add-float v27, v2, v7

    .line 530
    .local v27, "y":F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mValuePaint:Landroid/graphics/Paint;

    sget-object v7, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v2, v7}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 533
    if-eqz v45, :cond_35c

    if-eqz v48, :cond_35c

    .line 535
    const/16 v25, 0x0

    move-object/from16 v0, v42

    move/from16 v1, v54

    invoke-interface {v0, v1}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getValueTextColor(I)I

    move-result v28

    move-object/from16 v20, p0

    move-object/from16 v21, p1

    move-object/from16 v22, v14

    move/from16 v23, v15

    move-object/from16 v24, v16

    invoke-virtual/range {v20 .. v28}, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->drawValue(Landroid/graphics/Canvas;Lcom/github/mikephil/charting/formatter/ValueFormatter;FLcom/github/mikephil/charting/data/Entry;IFFI)V

    .line 537
    invoke-virtual/range {v41 .. v41}, Lcom/github/mikephil/charting/data/PieData;->getXValCount()I

    move-result v2

    move/from16 v0, v54

    if-ge v0, v2, :cond_2bd

    .line 538
    invoke-virtual/range {v41 .. v41}, Lcom/github/mikephil/charting/data/PieData;->getXVals()Ljava/util/List;

    move-result-object v2

    move/from16 v0, v54

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    add-float v7, v27, v58

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mValuePaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    move/from16 v1, v26

    invoke-virtual {v0, v2, v1, v7, v8}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 553
    .end local v26    # "x":F
    .end local v27    # "y":F
    :cond_2bd
    :goto_2bd
    add-int/lit8 v73, v73, 0x1

    .line 414
    add-int/lit8 v54, v54, 0x1

    goto/16 :goto_e5

    .line 421
    .end local v15    # "value":F
    .end local v38    # "angle":F
    .end local v39    # "angleOffset":F
    .end local v45    # "drawXInside":Z
    .end local v46    # "drawXOutside":Z
    .end local v48    # "drawYInside":Z
    .end local v49    # "drawYOutside":Z
    .end local v64    # "sliceAngle":F
    .end local v65    # "sliceSpace":F
    .end local v66    # "sliceSpaceMiddleAngle":F
    .end local v67    # "sliceXBase":F
    .end local v68    # "sliceYBase":F
    .end local v69    # "transformedAngle":F
    :cond_2c3
    add-int/lit8 v2, v73, -0x1

    aget v2, v37, v2

    mul-float v38, v2, v59

    .restart local v38    # "angle":F
    goto/16 :goto_f7

    .line 434
    .restart local v39    # "angleOffset":F
    .restart local v64    # "sliceAngle":F
    .restart local v65    # "sliceSpace":F
    .restart local v66    # "sliceSpaceMiddleAngle":F
    .restart local v69    # "transformedAngle":F
    :cond_2cb
    invoke-virtual/range {v16 .. v16}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v15

    goto/16 :goto_128

    .line 440
    .restart local v15    # "value":F
    .restart local v67    # "sliceXBase":F
    .restart local v68    # "sliceYBase":F
    :cond_2d1
    const/16 v46, 0x0

    goto/16 :goto_14c

    .line 442
    .restart local v46    # "drawXOutside":Z
    :cond_2d5
    const/16 v49, 0x0

    goto/16 :goto_156

    .line 444
    .restart local v49    # "drawYOutside":Z
    :cond_2d9
    const/16 v45, 0x0

    goto/16 :goto_160

    .line 446
    .restart local v45    # "drawXInside":Z
    :cond_2dd
    const/16 v48, 0x0

    goto/16 :goto_16a

    .line 465
    .restart local v48    # "drawYInside":Z
    .restart local v70    # "valueLineLength1":F
    .restart local v71    # "valueLineLength2":F
    .restart local v72    # "valueLinePart1OffsetPercentage":F
    :cond_2e1
    mul-float v57, v62, v72

    .restart local v57    # "line1Radius":F
    goto/16 :goto_192

    .line 467
    :cond_2e5
    mul-float v61, v55, v71

    goto/16 :goto_1ab

    .line 485
    .restart local v3    # "pt0x":F
    .restart local v4    # "pt0y":F
    .restart local v5    # "pt1x":F
    .restart local v6    # "pt1y":F
    .restart local v61    # "polyline2Width":F
    :cond_2e9
    add-float v10, v5, v61

    .line 486
    .restart local v10    # "pt2x":F
    move v11, v6

    .line 487
    .restart local v11    # "pt2y":F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mValuePaint:Landroid/graphics/Paint;

    sget-object v7, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    invoke-virtual {v2, v7}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 488
    const/high16 v2, 0x40a00000    # 5.0f

    invoke-static {v2}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v2

    add-float v18, v10, v2

    .line 489
    .restart local v18    # "labelPtx":F
    move/from16 v19, v11

    .restart local v19    # "labelPty":F
    goto/16 :goto_211

    .line 514
    :cond_301
    if-eqz v46, :cond_339

    .line 515
    invoke-virtual/range {v41 .. v41}, Lcom/github/mikephil/charting/data/PieData;->getXValCount()I

    move-result v2

    move/from16 v0, v54

    if-ge v0, v2, :cond_264

    .line 516
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mValuePaint:Landroid/graphics/Paint;

    move-object/from16 v0, v42

    move/from16 v1, v54

    invoke-interface {v0, v1}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getValueTextColor(I)I

    move-result v7

    invoke-virtual {v2, v7}, Landroid/graphics/Paint;->setColor(I)V

    .line 517
    invoke-virtual/range {v41 .. v41}, Lcom/github/mikephil/charting/data/PieData;->getXVals()Ljava/util/List;

    move-result-object v2

    move/from16 v0, v54

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const/high16 v7, 0x40000000    # 2.0f

    div-float v7, v58, v7

    add-float v7, v7, v19

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mValuePaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    move/from16 v1, v18

    invoke-virtual {v0, v2, v1, v7, v8}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    goto/16 :goto_264

    .line 519
    :cond_339
    if-eqz v49, :cond_264

    .line 521
    const/16 v25, 0x0

    const/high16 v2, 0x40000000    # 2.0f

    div-float v2, v58, v2

    add-float v27, v19, v2

    move-object/from16 v0, v42

    move/from16 v1, v54

    invoke-interface {v0, v1}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getValueTextColor(I)I

    move-result v28

    move-object/from16 v20, p0

    move-object/from16 v21, p1

    move-object/from16 v22, v14

    move/from16 v23, v15

    move-object/from16 v24, v16

    move/from16 v26, v18

    invoke-virtual/range {v20 .. v28}, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->drawValue(Landroid/graphics/Canvas;Lcom/github/mikephil/charting/formatter/ValueFormatter;FLcom/github/mikephil/charting/data/Entry;IFFI)V

    goto/16 :goto_264

    .line 542
    .end local v3    # "pt0x":F
    .end local v4    # "pt0y":F
    .end local v5    # "pt1x":F
    .end local v6    # "pt1y":F
    .end local v10    # "pt2x":F
    .end local v11    # "pt2y":F
    .end local v18    # "labelPtx":F
    .end local v19    # "labelPty":F
    .end local v57    # "line1Radius":F
    .end local v61    # "polyline2Width":F
    .end local v70    # "valueLineLength1":F
    .end local v71    # "valueLineLength2":F
    .end local v72    # "valueLinePart1OffsetPercentage":F
    .restart local v26    # "x":F
    .restart local v27    # "y":F
    :cond_35c
    if-eqz v45, :cond_394

    .line 543
    invoke-virtual/range {v41 .. v41}, Lcom/github/mikephil/charting/data/PieData;->getXValCount()I

    move-result v2

    move/from16 v0, v54

    if-ge v0, v2, :cond_2bd

    .line 544
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mValuePaint:Landroid/graphics/Paint;

    move-object/from16 v0, v42

    move/from16 v1, v54

    invoke-interface {v0, v1}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getValueTextColor(I)I

    move-result v7

    invoke-virtual {v2, v7}, Landroid/graphics/Paint;->setColor(I)V

    .line 545
    invoke-virtual/range {v41 .. v41}, Lcom/github/mikephil/charting/data/PieData;->getXVals()Ljava/util/List;

    move-result-object v2

    move/from16 v0, v54

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const/high16 v7, 0x40000000    # 2.0f

    div-float v7, v58, v7

    add-float v7, v7, v27

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mValuePaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    move/from16 v1, v26

    invoke-virtual {v0, v2, v1, v7, v8}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    goto/16 :goto_2bd

    .line 547
    :cond_394
    if-eqz v48, :cond_2bd

    .line 549
    const/16 v33, 0x0

    const/high16 v2, 0x40000000    # 2.0f

    div-float v2, v58, v2

    add-float v35, v27, v2

    move-object/from16 v0, v42

    move/from16 v1, v54

    invoke-interface {v0, v1}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getValueTextColor(I)I

    move-result v36

    move-object/from16 v28, p0

    move-object/from16 v29, p1

    move-object/from16 v30, v14

    move/from16 v31, v15

    move-object/from16 v32, v16

    move/from16 v34, v26

    invoke-virtual/range {v28 .. v36}, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->drawValue(Landroid/graphics/Canvas;Lcom/github/mikephil/charting/formatter/ValueFormatter;FLcom/github/mikephil/charting/data/Entry;IFFI)V

    goto/16 :goto_2bd

    .line 557
    .end local v14    # "formatter":Lcom/github/mikephil/charting/formatter/ValueFormatter;
    .end local v15    # "value":F
    .end local v16    # "entry":Lcom/github/mikephil/charting/data/Entry;
    .end local v26    # "x":F
    .end local v27    # "y":F
    .end local v38    # "angle":F
    .end local v39    # "angleOffset":F
    .end local v42    # "dataSet":Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;
    .end local v45    # "drawXInside":Z
    .end local v46    # "drawXOutside":Z
    .end local v48    # "drawYInside":Z
    .end local v49    # "drawYOutside":Z
    .end local v50    # "drawYVals":Z
    .end local v51    # "entryCount":I
    .end local v54    # "j":I
    .end local v58    # "lineHeight":F
    .end local v64    # "sliceAngle":F
    .end local v65    # "sliceSpace":F
    .end local v66    # "sliceSpaceMiddleAngle":F
    .end local v67    # "sliceXBase":F
    .end local v68    # "sliceYBase":F
    .end local v69    # "transformedAngle":F
    .end local v74    # "xValuePosition":Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;
    .end local v75    # "yValuePosition":Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;
    :cond_3b7
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->restore()V

    .line 558
    return-void
.end method

.method public getPaintCenterText()Landroid/text/TextPaint;
    .registers 2

    .prologue
    .line 99
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mCenterTextPaint:Landroid/text/TextPaint;

    return-object v0
.end method

.method public getPaintHole()Landroid/graphics/Paint;
    .registers 2

    .prologue
    .line 91
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mHolePaint:Landroid/graphics/Paint;

    return-object v0
.end method

.method public getPaintTransparentCircle()Landroid/graphics/Paint;
    .registers 2

    .prologue
    .line 95
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mTransparentCirclePaint:Landroid/graphics/Paint;

    return-object v0
.end method

.method public initBuffers()V
    .registers 1

    .prologue
    .line 105
    return-void
.end method

.method public releaseBitmap()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 922
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mBitmapCanvas:Landroid/graphics/Canvas;

    if-eqz v0, :cond_c

    .line 923
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mBitmapCanvas:Landroid/graphics/Canvas;

    invoke-virtual {v0, v1}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 924
    iput-object v1, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mBitmapCanvas:Landroid/graphics/Canvas;

    .line 926
    :cond_c
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mDrawBitmap:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_22

    .line 927
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mDrawBitmap:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 928
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mDrawBitmap:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->clear()V

    .line 929
    iput-object v1, p0, Lcom/github/mikephil/charting/renderer/PieChartRenderer;->mDrawBitmap:Ljava/lang/ref/WeakReference;

    .line 931
    :cond_22
    return-void
.end method
