.class Lcom/jjoe64/graphview/Viewport$1;
.super Ljava/lang/Object;
.source "Viewport.java"

# interfaces
.implements Landroid/view/ScaleGestureDetector$OnScaleGestureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jjoe64/graphview/Viewport;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/jjoe64/graphview/Viewport;


# direct methods
.method constructor <init>(Lcom/jjoe64/graphview/Viewport;)V
    .registers 2
    .param p1, "this$0"    # Lcom/jjoe64/graphview/Viewport;

    .prologue
    .line 58
    iput-object p1, p0, Lcom/jjoe64/graphview/Viewport$1;->this$0:Lcom/jjoe64/graphview/Viewport;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onScale(Landroid/view/ScaleGestureDetector;)Z
    .registers 13
    .param p1, "detector"    # Landroid/view/ScaleGestureDetector;

    .prologue
    const/high16 v8, 0x40000000    # 2.0f

    const/4 v10, 0x1

    .line 66
    iget-object v6, p0, Lcom/jjoe64/graphview/Viewport$1;->this$0:Lcom/jjoe64/graphview/Viewport;

    iget-object v6, v6, Lcom/jjoe64/graphview/Viewport;->mCurrentViewport:Landroid/graphics/RectF;

    invoke-virtual {v6}, Landroid/graphics/RectF;->width()F

    move-result v5

    .line 67
    .local v5, "viewportWidth":F
    iget-object v6, p0, Lcom/jjoe64/graphview/Viewport$1;->this$0:Lcom/jjoe64/graphview/Viewport;

    iget-object v6, v6, Lcom/jjoe64/graphview/Viewport;->mCurrentViewport:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->left:F

    div-float v7, v5, v8

    add-float v0, v6, v7

    .line 68
    .local v0, "center":F
    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getScaleFactor()F

    move-result v6

    div-float/2addr v5, v6

    .line 69
    iget-object v6, p0, Lcom/jjoe64/graphview/Viewport$1;->this$0:Lcom/jjoe64/graphview/Viewport;

    iget-object v6, v6, Lcom/jjoe64/graphview/Viewport;->mCurrentViewport:Landroid/graphics/RectF;

    div-float v7, v5, v8

    sub-float v7, v0, v7

    iput v7, v6, Landroid/graphics/RectF;->left:F

    .line 70
    iget-object v6, p0, Lcom/jjoe64/graphview/Viewport$1;->this$0:Lcom/jjoe64/graphview/Viewport;

    iget-object v6, v6, Lcom/jjoe64/graphview/Viewport;->mCurrentViewport:Landroid/graphics/RectF;

    iget-object v7, p0, Lcom/jjoe64/graphview/Viewport$1;->this$0:Lcom/jjoe64/graphview/Viewport;

    iget-object v7, v7, Lcom/jjoe64/graphview/Viewport;->mCurrentViewport:Landroid/graphics/RectF;

    iget v7, v7, Landroid/graphics/RectF;->left:F

    add-float/2addr v7, v5

    iput v7, v6, Landroid/graphics/RectF;->right:F

    .line 73
    iget-object v6, p0, Lcom/jjoe64/graphview/Viewport$1;->this$0:Lcom/jjoe64/graphview/Viewport;

    invoke-virtual {v6, v10}, Lcom/jjoe64/graphview/Viewport;->getMinX(Z)D

    move-result-wide v6

    double-to-float v2, v6

    .line 74
    .local v2, "minX":F
    iget-object v6, p0, Lcom/jjoe64/graphview/Viewport$1;->this$0:Lcom/jjoe64/graphview/Viewport;

    iget-object v6, v6, Lcom/jjoe64/graphview/Viewport;->mCurrentViewport:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->left:F

    cmpg-float v6, v6, v2

    if-gez v6, :cond_55

    .line 75
    iget-object v6, p0, Lcom/jjoe64/graphview/Viewport$1;->this$0:Lcom/jjoe64/graphview/Viewport;

    iget-object v6, v6, Lcom/jjoe64/graphview/Viewport;->mCurrentViewport:Landroid/graphics/RectF;

    iput v2, v6, Landroid/graphics/RectF;->left:F

    .line 76
    iget-object v6, p0, Lcom/jjoe64/graphview/Viewport$1;->this$0:Lcom/jjoe64/graphview/Viewport;

    iget-object v6, v6, Lcom/jjoe64/graphview/Viewport;->mCurrentViewport:Landroid/graphics/RectF;

    iget-object v7, p0, Lcom/jjoe64/graphview/Viewport$1;->this$0:Lcom/jjoe64/graphview/Viewport;

    iget-object v7, v7, Lcom/jjoe64/graphview/Viewport;->mCurrentViewport:Landroid/graphics/RectF;

    iget v7, v7, Landroid/graphics/RectF;->left:F

    add-float/2addr v7, v5

    iput v7, v6, Landroid/graphics/RectF;->right:F

    .line 80
    :cond_55
    iget-object v6, p0, Lcom/jjoe64/graphview/Viewport$1;->this$0:Lcom/jjoe64/graphview/Viewport;

    invoke-virtual {v6, v10}, Lcom/jjoe64/graphview/Viewport;->getMaxX(Z)D

    move-result-wide v6

    double-to-float v1, v6

    .line 81
    .local v1, "maxX":F
    const/4 v6, 0x0

    cmpl-float v6, v5, v6

    if-nez v6, :cond_67

    .line 82
    iget-object v6, p0, Lcom/jjoe64/graphview/Viewport$1;->this$0:Lcom/jjoe64/graphview/Viewport;

    iget-object v6, v6, Lcom/jjoe64/graphview/Viewport;->mCurrentViewport:Landroid/graphics/RectF;

    iput v1, v6, Landroid/graphics/RectF;->right:F

    .line 84
    :cond_67
    iget-object v6, p0, Lcom/jjoe64/graphview/Viewport$1;->this$0:Lcom/jjoe64/graphview/Viewport;

    iget-object v6, v6, Lcom/jjoe64/graphview/Viewport;->mCurrentViewport:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->left:F

    add-float/2addr v6, v5

    sub-float/2addr v6, v1

    float-to-double v3, v6

    .line 85
    .local v3, "overlap":D
    const-wide/16 v6, 0x0

    cmpl-double v6, v3, v6

    if-lez v6, :cond_9b

    .line 87
    iget-object v6, p0, Lcom/jjoe64/graphview/Viewport$1;->this$0:Lcom/jjoe64/graphview/Viewport;

    iget-object v6, v6, Lcom/jjoe64/graphview/Viewport;->mCurrentViewport:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->left:F

    float-to-double v6, v6

    sub-double/2addr v6, v3

    float-to-double v8, v2

    cmpl-double v6, v6, v8

    if-lez v6, :cond_af

    .line 88
    iget-object v6, p0, Lcom/jjoe64/graphview/Viewport$1;->this$0:Lcom/jjoe64/graphview/Viewport;

    iget-object v6, v6, Lcom/jjoe64/graphview/Viewport;->mCurrentViewport:Landroid/graphics/RectF;

    iget v7, v6, Landroid/graphics/RectF;->left:F

    float-to-double v7, v7

    sub-double/2addr v7, v3

    double-to-float v7, v7

    iput v7, v6, Landroid/graphics/RectF;->left:F

    .line 89
    iget-object v6, p0, Lcom/jjoe64/graphview/Viewport$1;->this$0:Lcom/jjoe64/graphview/Viewport;

    iget-object v6, v6, Lcom/jjoe64/graphview/Viewport;->mCurrentViewport:Landroid/graphics/RectF;

    iget-object v7, p0, Lcom/jjoe64/graphview/Viewport$1;->this$0:Lcom/jjoe64/graphview/Viewport;

    iget-object v7, v7, Lcom/jjoe64/graphview/Viewport;->mCurrentViewport:Landroid/graphics/RectF;

    iget v7, v7, Landroid/graphics/RectF;->left:F

    add-float/2addr v7, v5

    iput v7, v6, Landroid/graphics/RectF;->right:F

    .line 98
    :cond_9b
    :goto_9b
    iget-object v6, p0, Lcom/jjoe64/graphview/Viewport$1;->this$0:Lcom/jjoe64/graphview/Viewport;

    # getter for: Lcom/jjoe64/graphview/Viewport;->mGraphView:Lcom/jjoe64/graphview/GraphView;
    invoke-static {v6}, Lcom/jjoe64/graphview/Viewport;->access$000(Lcom/jjoe64/graphview/Viewport;)Lcom/jjoe64/graphview/GraphView;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v6, v10, v7}, Lcom/jjoe64/graphview/GraphView;->onDataChanged(ZZ)V

    .line 100
    iget-object v6, p0, Lcom/jjoe64/graphview/Viewport$1;->this$0:Lcom/jjoe64/graphview/Viewport;

    # getter for: Lcom/jjoe64/graphview/Viewport;->mGraphView:Lcom/jjoe64/graphview/GraphView;
    invoke-static {v6}, Lcom/jjoe64/graphview/Viewport;->access$000(Lcom/jjoe64/graphview/Viewport;)Lcom/jjoe64/graphview/GraphView;

    move-result-object v6

    invoke-static {v6}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    .line 102
    return v10

    .line 92
    :cond_af
    iget-object v6, p0, Lcom/jjoe64/graphview/Viewport$1;->this$0:Lcom/jjoe64/graphview/Viewport;

    iget-object v6, v6, Lcom/jjoe64/graphview/Viewport;->mCurrentViewport:Landroid/graphics/RectF;

    iput v2, v6, Landroid/graphics/RectF;->left:F

    .line 93
    iget-object v6, p0, Lcom/jjoe64/graphview/Viewport$1;->this$0:Lcom/jjoe64/graphview/Viewport;

    iget-object v6, v6, Lcom/jjoe64/graphview/Viewport;->mCurrentViewport:Landroid/graphics/RectF;

    iput v1, v6, Landroid/graphics/RectF;->right:F

    goto :goto_9b
.end method

.method public onScaleBegin(Landroid/view/ScaleGestureDetector;)Z
    .registers 5
    .param p1, "detector"    # Landroid/view/ScaleGestureDetector;

    .prologue
    const/4 v0, 0x1

    .line 113
    iget-object v1, p0, Lcom/jjoe64/graphview/Viewport$1;->this$0:Lcom/jjoe64/graphview/Viewport;

    # getter for: Lcom/jjoe64/graphview/Viewport;->mIsScalable:Z
    invoke-static {v1}, Lcom/jjoe64/graphview/Viewport;->access$100(Lcom/jjoe64/graphview/Viewport;)Z

    move-result v1

    if-eqz v1, :cond_24

    .line 114
    iget-object v1, p0, Lcom/jjoe64/graphview/Viewport$1;->this$0:Lcom/jjoe64/graphview/Viewport;

    iget-object v2, p0, Lcom/jjoe64/graphview/Viewport$1;->this$0:Lcom/jjoe64/graphview/Viewport;

    iget-object v2, v2, Lcom/jjoe64/graphview/Viewport;->mCurrentViewport:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v2

    iput v2, v1, Lcom/jjoe64/graphview/Viewport;->mScalingBeginWidth:F

    .line 115
    iget-object v1, p0, Lcom/jjoe64/graphview/Viewport$1;->this$0:Lcom/jjoe64/graphview/Viewport;

    iget-object v2, p0, Lcom/jjoe64/graphview/Viewport$1;->this$0:Lcom/jjoe64/graphview/Viewport;

    iget-object v2, v2, Lcom/jjoe64/graphview/Viewport;->mCurrentViewport:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->left:F

    iput v2, v1, Lcom/jjoe64/graphview/Viewport;->mScalingBeginLeft:F

    .line 116
    iget-object v1, p0, Lcom/jjoe64/graphview/Viewport$1;->this$0:Lcom/jjoe64/graphview/Viewport;

    iput-boolean v0, v1, Lcom/jjoe64/graphview/Viewport;->mScalingActive:Z

    .line 119
    :goto_23
    return v0

    :cond_24
    const/4 v0, 0x0

    goto :goto_23
.end method

.method public onScaleEnd(Landroid/view/ScaleGestureDetector;)V
    .registers 5
    .param p1, "detector"    # Landroid/view/ScaleGestureDetector;

    .prologue
    const/4 v2, 0x0

    .line 131
    iget-object v0, p0, Lcom/jjoe64/graphview/Viewport$1;->this$0:Lcom/jjoe64/graphview/Viewport;

    iput-boolean v2, v0, Lcom/jjoe64/graphview/Viewport;->mScalingActive:Z

    .line 134
    iget-object v0, p0, Lcom/jjoe64/graphview/Viewport$1;->this$0:Lcom/jjoe64/graphview/Viewport;

    sget-object v1, Lcom/jjoe64/graphview/Viewport$AxisBoundsStatus;->READJUST_AFTER_SCALE:Lcom/jjoe64/graphview/Viewport$AxisBoundsStatus;

    # setter for: Lcom/jjoe64/graphview/Viewport;->mXAxisBoundsStatus:Lcom/jjoe64/graphview/Viewport$AxisBoundsStatus;
    invoke-static {v0, v1}, Lcom/jjoe64/graphview/Viewport;->access$202(Lcom/jjoe64/graphview/Viewport;Lcom/jjoe64/graphview/Viewport$AxisBoundsStatus;)Lcom/jjoe64/graphview/Viewport$AxisBoundsStatus;

    .line 136
    iget-object v0, p0, Lcom/jjoe64/graphview/Viewport$1;->this$0:Lcom/jjoe64/graphview/Viewport;

    const/high16 v1, 0x7fc00000    # Float.NaN

    iput v1, v0, Lcom/jjoe64/graphview/Viewport;->mScrollingReferenceX:F

    .line 139
    iget-object v0, p0, Lcom/jjoe64/graphview/Viewport$1;->this$0:Lcom/jjoe64/graphview/Viewport;

    # getter for: Lcom/jjoe64/graphview/Viewport;->mGraphView:Lcom/jjoe64/graphview/GraphView;
    invoke-static {v0}, Lcom/jjoe64/graphview/Viewport;->access$000(Lcom/jjoe64/graphview/Viewport;)Lcom/jjoe64/graphview/GraphView;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/jjoe64/graphview/GraphView;->onDataChanged(ZZ)V

    .line 141
    iget-object v0, p0, Lcom/jjoe64/graphview/Viewport$1;->this$0:Lcom/jjoe64/graphview/Viewport;

    # getter for: Lcom/jjoe64/graphview/Viewport;->mGraphView:Lcom/jjoe64/graphview/GraphView;
    invoke-static {v0}, Lcom/jjoe64/graphview/Viewport;->access$000(Lcom/jjoe64/graphview/Viewport;)Lcom/jjoe64/graphview/GraphView;

    move-result-object v0

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    .line 142
    return-void
.end method
