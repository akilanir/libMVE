.class Lcom/jjoe64/graphview/Viewport$2;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "Viewport.java"


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
    .line 149
    iput-object p1, p0, Lcom/jjoe64/graphview/Viewport$2;->this$0:Lcom/jjoe64/graphview/Viewport;

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onDown(Landroid/view/MotionEvent;)Z
    .registers 5
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v0, 0x1

    .line 152
    iget-object v1, p0, Lcom/jjoe64/graphview/Viewport$2;->this$0:Lcom/jjoe64/graphview/Viewport;

    # getter for: Lcom/jjoe64/graphview/Viewport;->mIsScrollable:Z
    invoke-static {v1}, Lcom/jjoe64/graphview/Viewport;->access$300(Lcom/jjoe64/graphview/Viewport;)Z

    move-result v1

    if-eqz v1, :cond_f

    iget-object v1, p0, Lcom/jjoe64/graphview/Viewport$2;->this$0:Lcom/jjoe64/graphview/Viewport;

    iget-boolean v1, v1, Lcom/jjoe64/graphview/Viewport;->mScalingActive:Z

    if-eqz v1, :cond_11

    :cond_f
    const/4 v0, 0x0

    .line 160
    :goto_10
    return v0

    .line 155
    :cond_11
    iget-object v1, p0, Lcom/jjoe64/graphview/Viewport$2;->this$0:Lcom/jjoe64/graphview/Viewport;

    # invokes: Lcom/jjoe64/graphview/Viewport;->releaseEdgeEffects()V
    invoke-static {v1}, Lcom/jjoe64/graphview/Viewport;->access$400(Lcom/jjoe64/graphview/Viewport;)V

    .line 156
    iget-object v1, p0, Lcom/jjoe64/graphview/Viewport$2;->this$0:Lcom/jjoe64/graphview/Viewport;

    # getter for: Lcom/jjoe64/graphview/Viewport;->mScrollerStartViewport:Landroid/graphics/RectF;
    invoke-static {v1}, Lcom/jjoe64/graphview/Viewport;->access$500(Lcom/jjoe64/graphview/Viewport;)Landroid/graphics/RectF;

    move-result-object v1

    iget-object v2, p0, Lcom/jjoe64/graphview/Viewport$2;->this$0:Lcom/jjoe64/graphview/Viewport;

    iget-object v2, v2, Lcom/jjoe64/graphview/Viewport;->mCurrentViewport:Landroid/graphics/RectF;

    invoke-virtual {v1, v2}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 158
    iget-object v1, p0, Lcom/jjoe64/graphview/Viewport$2;->this$0:Lcom/jjoe64/graphview/Viewport;

    iget-object v1, v1, Lcom/jjoe64/graphview/Viewport;->mScroller:Landroid/widget/OverScroller;

    invoke-virtual {v1, v0}, Landroid/widget/OverScroller;->forceFinished(Z)V

    .line 159
    iget-object v1, p0, Lcom/jjoe64/graphview/Viewport$2;->this$0:Lcom/jjoe64/graphview/Viewport;

    # getter for: Lcom/jjoe64/graphview/Viewport;->mGraphView:Lcom/jjoe64/graphview/GraphView;
    invoke-static {v1}, Lcom/jjoe64/graphview/Viewport;->access$000(Lcom/jjoe64/graphview/Viewport;)Lcom/jjoe64/graphview/GraphView;

    move-result-object v1

    invoke-static {v1}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    goto :goto_10
.end method

.method public onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .registers 6
    .param p1, "e1"    # Landroid/view/MotionEvent;
    .param p2, "e2"    # Landroid/view/MotionEvent;
    .param p3, "velocityX"    # F
    .param p4, "velocityY"    # F

    .prologue
    .line 246
    const/4 v0, 0x1

    return v0
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .registers 18
    .param p1, "e1"    # Landroid/view/MotionEvent;
    .param p2, "e2"    # Landroid/view/MotionEvent;
    .param p3, "distanceX"    # F
    .param p4, "distanceY"    # F

    .prologue
    .line 165
    iget-object v10, p0, Lcom/jjoe64/graphview/Viewport$2;->this$0:Lcom/jjoe64/graphview/Viewport;

    # getter for: Lcom/jjoe64/graphview/Viewport;->mIsScrollable:Z
    invoke-static {v10}, Lcom/jjoe64/graphview/Viewport;->access$300(Lcom/jjoe64/graphview/Viewport;)Z

    move-result v10

    if-eqz v10, :cond_e

    iget-object v10, p0, Lcom/jjoe64/graphview/Viewport$2;->this$0:Lcom/jjoe64/graphview/Viewport;

    iget-boolean v10, v10, Lcom/jjoe64/graphview/Viewport;->mScalingActive:Z

    if-eqz v10, :cond_10

    :cond_e
    const/4 v10, 0x0

    .line 239
    :goto_f
    return v10

    .line 167
    :cond_10
    iget-object v10, p0, Lcom/jjoe64/graphview/Viewport$2;->this$0:Lcom/jjoe64/graphview/Viewport;

    iget v10, v10, Lcom/jjoe64/graphview/Viewport;->mScrollingReferenceX:F

    invoke-static {v10}, Ljava/lang/Float;->isNaN(F)Z

    move-result v10

    if-eqz v10, :cond_24

    .line 168
    iget-object v10, p0, Lcom/jjoe64/graphview/Viewport$2;->this$0:Lcom/jjoe64/graphview/Viewport;

    iget-object v11, p0, Lcom/jjoe64/graphview/Viewport$2;->this$0:Lcom/jjoe64/graphview/Viewport;

    iget-object v11, v11, Lcom/jjoe64/graphview/Viewport;->mCurrentViewport:Landroid/graphics/RectF;

    iget v11, v11, Landroid/graphics/RectF;->left:F

    iput v11, v10, Lcom/jjoe64/graphview/Viewport;->mScrollingReferenceX:F

    .line 179
    :cond_24
    iget-object v10, p0, Lcom/jjoe64/graphview/Viewport$2;->this$0:Lcom/jjoe64/graphview/Viewport;

    iget-object v10, v10, Lcom/jjoe64/graphview/Viewport;->mCurrentViewport:Landroid/graphics/RectF;

    invoke-virtual {v10}, Landroid/graphics/RectF;->width()F

    move-result v10

    mul-float v10, v10, p3

    iget-object v11, p0, Lcom/jjoe64/graphview/Viewport$2;->this$0:Lcom/jjoe64/graphview/Viewport;

    # getter for: Lcom/jjoe64/graphview/Viewport;->mGraphView:Lcom/jjoe64/graphview/GraphView;
    invoke-static {v11}, Lcom/jjoe64/graphview/Viewport;->access$000(Lcom/jjoe64/graphview/Viewport;)Lcom/jjoe64/graphview/GraphView;

    move-result-object v11

    invoke-virtual {v11}, Lcom/jjoe64/graphview/GraphView;->getGraphContentWidth()I

    move-result v11

    int-to-float v11, v11

    div-float v8, v10, v11

    .line 180
    .local v8, "viewportOffsetX":F
    move/from16 v0, p4

    neg-float v10, v0

    iget-object v11, p0, Lcom/jjoe64/graphview/Viewport$2;->this$0:Lcom/jjoe64/graphview/Viewport;

    iget-object v11, v11, Lcom/jjoe64/graphview/Viewport;->mCurrentViewport:Landroid/graphics/RectF;

    invoke-virtual {v11}, Landroid/graphics/RectF;->height()F

    move-result v11

    mul-float/2addr v10, v11

    iget-object v11, p0, Lcom/jjoe64/graphview/Viewport$2;->this$0:Lcom/jjoe64/graphview/Viewport;

    # getter for: Lcom/jjoe64/graphview/Viewport;->mGraphView:Lcom/jjoe64/graphview/GraphView;
    invoke-static {v11}, Lcom/jjoe64/graphview/Viewport;->access$000(Lcom/jjoe64/graphview/Viewport;)Lcom/jjoe64/graphview/GraphView;

    move-result-object v11

    invoke-virtual {v11}, Lcom/jjoe64/graphview/GraphView;->getGraphContentHeight()I

    move-result v11

    int-to-float v11, v11

    div-float v9, v10, v11

    .line 182
    .local v9, "viewportOffsetY":F
    iget-object v10, p0, Lcom/jjoe64/graphview/Viewport$2;->this$0:Lcom/jjoe64/graphview/Viewport;

    iget-object v10, v10, Lcom/jjoe64/graphview/Viewport;->mCompleteRange:Landroid/graphics/RectF;

    invoke-virtual {v10}, Landroid/graphics/RectF;->width()F

    move-result v10

    iget-object v11, p0, Lcom/jjoe64/graphview/Viewport$2;->this$0:Lcom/jjoe64/graphview/Viewport;

    iget-object v11, v11, Lcom/jjoe64/graphview/Viewport;->mCurrentViewport:Landroid/graphics/RectF;

    invoke-virtual {v11}, Landroid/graphics/RectF;->width()F

    move-result v11

    div-float/2addr v10, v11

    iget-object v11, p0, Lcom/jjoe64/graphview/Viewport$2;->this$0:Lcom/jjoe64/graphview/Viewport;

    # getter for: Lcom/jjoe64/graphview/Viewport;->mGraphView:Lcom/jjoe64/graphview/GraphView;
    invoke-static {v11}, Lcom/jjoe64/graphview/Viewport;->access$000(Lcom/jjoe64/graphview/Viewport;)Lcom/jjoe64/graphview/GraphView;

    move-result-object v11

    invoke-virtual {v11}, Lcom/jjoe64/graphview/GraphView;->getGraphContentWidth()I

    move-result v11

    int-to-float v11, v11

    mul-float/2addr v10, v11

    float-to-int v4, v10

    .line 183
    .local v4, "completeWidth":I
    iget-object v10, p0, Lcom/jjoe64/graphview/Viewport$2;->this$0:Lcom/jjoe64/graphview/Viewport;

    iget-object v10, v10, Lcom/jjoe64/graphview/Viewport;->mCompleteRange:Landroid/graphics/RectF;

    invoke-virtual {v10}, Landroid/graphics/RectF;->height()F

    move-result v10

    iget-object v11, p0, Lcom/jjoe64/graphview/Viewport$2;->this$0:Lcom/jjoe64/graphview/Viewport;

    iget-object v11, v11, Lcom/jjoe64/graphview/Viewport;->mCurrentViewport:Landroid/graphics/RectF;

    invoke-virtual {v11}, Landroid/graphics/RectF;->height()F

    move-result v11

    div-float/2addr v10, v11

    iget-object v11, p0, Lcom/jjoe64/graphview/Viewport$2;->this$0:Lcom/jjoe64/graphview/Viewport;

    # getter for: Lcom/jjoe64/graphview/Viewport;->mGraphView:Lcom/jjoe64/graphview/GraphView;
    invoke-static {v11}, Lcom/jjoe64/graphview/Viewport;->access$000(Lcom/jjoe64/graphview/Viewport;)Lcom/jjoe64/graphview/GraphView;

    move-result-object v11

    invoke-virtual {v11}, Lcom/jjoe64/graphview/GraphView;->getGraphContentHeight()I

    move-result v11

    int-to-float v11, v11

    mul-float/2addr v10, v11

    float-to-int v3, v10

    .line 185
    .local v3, "completeHeight":I
    int-to-float v10, v4

    iget-object v11, p0, Lcom/jjoe64/graphview/Viewport$2;->this$0:Lcom/jjoe64/graphview/Viewport;

    iget-object v11, v11, Lcom/jjoe64/graphview/Viewport;->mCurrentViewport:Landroid/graphics/RectF;

    iget v11, v11, Landroid/graphics/RectF;->left:F

    add-float/2addr v11, v8

    iget-object v12, p0, Lcom/jjoe64/graphview/Viewport$2;->this$0:Lcom/jjoe64/graphview/Viewport;

    iget-object v12, v12, Lcom/jjoe64/graphview/Viewport;->mCompleteRange:Landroid/graphics/RectF;

    iget v12, v12, Landroid/graphics/RectF;->left:F

    sub-float/2addr v11, v12

    mul-float/2addr v10, v11

    iget-object v11, p0, Lcom/jjoe64/graphview/Viewport$2;->this$0:Lcom/jjoe64/graphview/Viewport;

    iget-object v11, v11, Lcom/jjoe64/graphview/Viewport;->mCompleteRange:Landroid/graphics/RectF;

    .line 187
    invoke-virtual {v11}, Landroid/graphics/RectF;->width()F

    move-result v11

    div-float/2addr v10, v11

    float-to-int v5, v10

    .line 188
    .local v5, "scrolledX":I
    int-to-float v10, v3

    iget-object v11, p0, Lcom/jjoe64/graphview/Viewport$2;->this$0:Lcom/jjoe64/graphview/Viewport;

    iget-object v11, v11, Lcom/jjoe64/graphview/Viewport;->mCompleteRange:Landroid/graphics/RectF;

    iget v11, v11, Landroid/graphics/RectF;->bottom:F

    iget-object v12, p0, Lcom/jjoe64/graphview/Viewport$2;->this$0:Lcom/jjoe64/graphview/Viewport;

    iget-object v12, v12, Lcom/jjoe64/graphview/Viewport;->mCurrentViewport:Landroid/graphics/RectF;

    iget v12, v12, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v11, v12

    sub-float/2addr v11, v9

    mul-float/2addr v10, v11

    iget-object v11, p0, Lcom/jjoe64/graphview/Viewport$2;->this$0:Lcom/jjoe64/graphview/Viewport;

    iget-object v11, v11, Lcom/jjoe64/graphview/Viewport;->mCompleteRange:Landroid/graphics/RectF;

    .line 190
    invoke-virtual {v11}, Landroid/graphics/RectF;->height()F

    move-result v11

    div-float/2addr v10, v11

    float-to-int v6, v10

    .line 191
    .local v6, "scrolledY":I
    iget-object v10, p0, Lcom/jjoe64/graphview/Viewport$2;->this$0:Lcom/jjoe64/graphview/Viewport;

    iget-object v10, v10, Lcom/jjoe64/graphview/Viewport;->mCurrentViewport:Landroid/graphics/RectF;

    iget v10, v10, Landroid/graphics/RectF;->left:F

    iget-object v11, p0, Lcom/jjoe64/graphview/Viewport$2;->this$0:Lcom/jjoe64/graphview/Viewport;

    iget-object v11, v11, Lcom/jjoe64/graphview/Viewport;->mCompleteRange:Landroid/graphics/RectF;

    iget v11, v11, Landroid/graphics/RectF;->left:F

    cmpl-float v10, v10, v11

    if-gtz v10, :cond_e4

    iget-object v10, p0, Lcom/jjoe64/graphview/Viewport$2;->this$0:Lcom/jjoe64/graphview/Viewport;

    iget-object v10, v10, Lcom/jjoe64/graphview/Viewport;->mCurrentViewport:Landroid/graphics/RectF;

    iget v10, v10, Landroid/graphics/RectF;->right:F

    iget-object v11, p0, Lcom/jjoe64/graphview/Viewport$2;->this$0:Lcom/jjoe64/graphview/Viewport;

    iget-object v11, v11, Lcom/jjoe64/graphview/Viewport;->mCompleteRange:Landroid/graphics/RectF;

    iget v11, v11, Landroid/graphics/RectF;->right:F

    cmpg-float v10, v10, v11

    if-gez v10, :cond_1c6

    :cond_e4
    const/4 v1, 0x1

    .line 193
    .local v1, "canScrollX":Z
    :goto_e5
    iget-object v10, p0, Lcom/jjoe64/graphview/Viewport$2;->this$0:Lcom/jjoe64/graphview/Viewport;

    iget-object v10, v10, Lcom/jjoe64/graphview/Viewport;->mCurrentViewport:Landroid/graphics/RectF;

    iget v10, v10, Landroid/graphics/RectF;->bottom:F

    iget-object v11, p0, Lcom/jjoe64/graphview/Viewport$2;->this$0:Lcom/jjoe64/graphview/Viewport;

    iget-object v11, v11, Lcom/jjoe64/graphview/Viewport;->mCompleteRange:Landroid/graphics/RectF;

    iget v11, v11, Landroid/graphics/RectF;->bottom:F

    cmpl-float v10, v10, v11

    if-gtz v10, :cond_105

    iget-object v10, p0, Lcom/jjoe64/graphview/Viewport$2;->this$0:Lcom/jjoe64/graphview/Viewport;

    iget-object v10, v10, Lcom/jjoe64/graphview/Viewport;->mCurrentViewport:Landroid/graphics/RectF;

    iget v10, v10, Landroid/graphics/RectF;->top:F

    iget-object v11, p0, Lcom/jjoe64/graphview/Viewport$2;->this$0:Lcom/jjoe64/graphview/Viewport;

    iget-object v11, v11, Lcom/jjoe64/graphview/Viewport;->mCompleteRange:Landroid/graphics/RectF;

    iget v11, v11, Landroid/graphics/RectF;->top:F

    cmpg-float v10, v10, v11

    if-gez v10, :cond_1c9

    :cond_105
    const/4 v2, 0x1

    .line 196
    .local v2, "canScrollY":Z
    :goto_106
    if-eqz v1, :cond_134

    .line 197
    const/4 v10, 0x0

    cmpg-float v10, v8, v10

    if-gez v10, :cond_1cc

    .line 198
    iget-object v10, p0, Lcom/jjoe64/graphview/Viewport$2;->this$0:Lcom/jjoe64/graphview/Viewport;

    iget-object v10, v10, Lcom/jjoe64/graphview/Viewport;->mCurrentViewport:Landroid/graphics/RectF;

    iget v10, v10, Landroid/graphics/RectF;->left:F

    add-float/2addr v10, v8

    iget-object v11, p0, Lcom/jjoe64/graphview/Viewport$2;->this$0:Lcom/jjoe64/graphview/Viewport;

    iget-object v11, v11, Lcom/jjoe64/graphview/Viewport;->mCompleteRange:Landroid/graphics/RectF;

    iget v11, v11, Landroid/graphics/RectF;->left:F

    sub-float v7, v10, v11

    .line 199
    .local v7, "tooMuch":F
    const/4 v10, 0x0

    cmpg-float v10, v7, v10

    if-gez v10, :cond_122

    .line 200
    sub-float/2addr v8, v7

    .line 208
    :cond_122
    :goto_122
    iget-object v10, p0, Lcom/jjoe64/graphview/Viewport$2;->this$0:Lcom/jjoe64/graphview/Viewport;

    iget-object v10, v10, Lcom/jjoe64/graphview/Viewport;->mCurrentViewport:Landroid/graphics/RectF;

    iget v11, v10, Landroid/graphics/RectF;->left:F

    add-float/2addr v11, v8

    iput v11, v10, Landroid/graphics/RectF;->left:F

    .line 209
    iget-object v10, p0, Lcom/jjoe64/graphview/Viewport$2;->this$0:Lcom/jjoe64/graphview/Viewport;

    iget-object v10, v10, Lcom/jjoe64/graphview/Viewport;->mCurrentViewport:Landroid/graphics/RectF;

    iget v11, v10, Landroid/graphics/RectF;->right:F

    add-float/2addr v11, v8

    iput v11, v10, Landroid/graphics/RectF;->right:F

    .line 211
    .end local v7    # "tooMuch":F
    :cond_134
    if-eqz v2, :cond_136

    .line 216
    :cond_136
    if-eqz v1, :cond_156

    if-gez v5, :cond_156

    .line 217
    iget-object v10, p0, Lcom/jjoe64/graphview/Viewport$2;->this$0:Lcom/jjoe64/graphview/Viewport;

    # getter for: Lcom/jjoe64/graphview/Viewport;->mEdgeEffectLeft:Landroid/support/v4/widget/EdgeEffectCompat;
    invoke-static {v10}, Lcom/jjoe64/graphview/Viewport;->access$600(Lcom/jjoe64/graphview/Viewport;)Landroid/support/v4/widget/EdgeEffectCompat;

    move-result-object v10

    int-to-float v11, v5

    iget-object v12, p0, Lcom/jjoe64/graphview/Viewport$2;->this$0:Lcom/jjoe64/graphview/Viewport;

    # getter for: Lcom/jjoe64/graphview/Viewport;->mGraphView:Lcom/jjoe64/graphview/GraphView;
    invoke-static {v12}, Lcom/jjoe64/graphview/Viewport;->access$000(Lcom/jjoe64/graphview/Viewport;)Lcom/jjoe64/graphview/GraphView;

    move-result-object v12

    invoke-virtual {v12}, Lcom/jjoe64/graphview/GraphView;->getGraphContentWidth()I

    move-result v12

    int-to-float v12, v12

    div-float/2addr v11, v12

    invoke-virtual {v10, v11}, Landroid/support/v4/widget/EdgeEffectCompat;->onPull(F)Z

    .line 218
    iget-object v10, p0, Lcom/jjoe64/graphview/Viewport$2;->this$0:Lcom/jjoe64/graphview/Viewport;

    const/4 v11, 0x1

    # setter for: Lcom/jjoe64/graphview/Viewport;->mEdgeEffectLeftActive:Z
    invoke-static {v10, v11}, Lcom/jjoe64/graphview/Viewport;->access$702(Lcom/jjoe64/graphview/Viewport;Z)Z

    .line 220
    :cond_156
    if-eqz v2, :cond_176

    if-gez v6, :cond_176

    .line 221
    iget-object v10, p0, Lcom/jjoe64/graphview/Viewport$2;->this$0:Lcom/jjoe64/graphview/Viewport;

    # getter for: Lcom/jjoe64/graphview/Viewport;->mEdgeEffectBottom:Landroid/support/v4/widget/EdgeEffectCompat;
    invoke-static {v10}, Lcom/jjoe64/graphview/Viewport;->access$800(Lcom/jjoe64/graphview/Viewport;)Landroid/support/v4/widget/EdgeEffectCompat;

    move-result-object v10

    int-to-float v11, v6

    iget-object v12, p0, Lcom/jjoe64/graphview/Viewport$2;->this$0:Lcom/jjoe64/graphview/Viewport;

    # getter for: Lcom/jjoe64/graphview/Viewport;->mGraphView:Lcom/jjoe64/graphview/GraphView;
    invoke-static {v12}, Lcom/jjoe64/graphview/Viewport;->access$000(Lcom/jjoe64/graphview/Viewport;)Lcom/jjoe64/graphview/GraphView;

    move-result-object v12

    invoke-virtual {v12}, Lcom/jjoe64/graphview/GraphView;->getGraphContentHeight()I

    move-result v12

    int-to-float v12, v12

    div-float/2addr v11, v12

    invoke-virtual {v10, v11}, Landroid/support/v4/widget/EdgeEffectCompat;->onPull(F)Z

    .line 222
    iget-object v10, p0, Lcom/jjoe64/graphview/Viewport$2;->this$0:Lcom/jjoe64/graphview/Viewport;

    const/4 v11, 0x1

    # setter for: Lcom/jjoe64/graphview/Viewport;->mEdgeEffectBottomActive:Z
    invoke-static {v10, v11}, Lcom/jjoe64/graphview/Viewport;->access$902(Lcom/jjoe64/graphview/Viewport;Z)Z

    .line 224
    :cond_176
    if-eqz v1, :cond_1af

    iget-object v10, p0, Lcom/jjoe64/graphview/Viewport$2;->this$0:Lcom/jjoe64/graphview/Viewport;

    # getter for: Lcom/jjoe64/graphview/Viewport;->mGraphView:Lcom/jjoe64/graphview/GraphView;
    invoke-static {v10}, Lcom/jjoe64/graphview/Viewport;->access$000(Lcom/jjoe64/graphview/Viewport;)Lcom/jjoe64/graphview/GraphView;

    move-result-object v10

    invoke-virtual {v10}, Lcom/jjoe64/graphview/GraphView;->getGraphContentWidth()I

    move-result v10

    sub-int v10, v4, v10

    if-le v5, v10, :cond_1af

    .line 225
    iget-object v10, p0, Lcom/jjoe64/graphview/Viewport$2;->this$0:Lcom/jjoe64/graphview/Viewport;

    # getter for: Lcom/jjoe64/graphview/Viewport;->mEdgeEffectRight:Landroid/support/v4/widget/EdgeEffectCompat;
    invoke-static {v10}, Lcom/jjoe64/graphview/Viewport;->access$1000(Lcom/jjoe64/graphview/Viewport;)Landroid/support/v4/widget/EdgeEffectCompat;

    move-result-object v10

    sub-int v11, v5, v4

    iget-object v12, p0, Lcom/jjoe64/graphview/Viewport$2;->this$0:Lcom/jjoe64/graphview/Viewport;

    # getter for: Lcom/jjoe64/graphview/Viewport;->mGraphView:Lcom/jjoe64/graphview/GraphView;
    invoke-static {v12}, Lcom/jjoe64/graphview/Viewport;->access$000(Lcom/jjoe64/graphview/Viewport;)Lcom/jjoe64/graphview/GraphView;

    move-result-object v12

    invoke-virtual {v12}, Lcom/jjoe64/graphview/GraphView;->getGraphContentWidth()I

    move-result v12

    add-int/2addr v11, v12

    int-to-float v11, v11

    iget-object v12, p0, Lcom/jjoe64/graphview/Viewport$2;->this$0:Lcom/jjoe64/graphview/Viewport;

    .line 226
    # getter for: Lcom/jjoe64/graphview/Viewport;->mGraphView:Lcom/jjoe64/graphview/GraphView;
    invoke-static {v12}, Lcom/jjoe64/graphview/Viewport;->access$000(Lcom/jjoe64/graphview/Viewport;)Lcom/jjoe64/graphview/GraphView;

    move-result-object v12

    invoke-virtual {v12}, Lcom/jjoe64/graphview/GraphView;->getGraphContentWidth()I

    move-result v12

    int-to-float v12, v12

    div-float/2addr v11, v12

    .line 225
    invoke-virtual {v10, v11}, Landroid/support/v4/widget/EdgeEffectCompat;->onPull(F)Z

    .line 227
    iget-object v10, p0, Lcom/jjoe64/graphview/Viewport$2;->this$0:Lcom/jjoe64/graphview/Viewport;

    const/4 v11, 0x1

    # setter for: Lcom/jjoe64/graphview/Viewport;->mEdgeEffectRightActive:Z
    invoke-static {v10, v11}, Lcom/jjoe64/graphview/Viewport;->access$1102(Lcom/jjoe64/graphview/Viewport;Z)Z

    .line 236
    :cond_1af
    iget-object v10, p0, Lcom/jjoe64/graphview/Viewport$2;->this$0:Lcom/jjoe64/graphview/Viewport;

    # getter for: Lcom/jjoe64/graphview/Viewport;->mGraphView:Lcom/jjoe64/graphview/GraphView;
    invoke-static {v10}, Lcom/jjoe64/graphview/Viewport;->access$000(Lcom/jjoe64/graphview/Viewport;)Lcom/jjoe64/graphview/GraphView;

    move-result-object v10

    const/4 v11, 0x1

    const/4 v12, 0x0

    invoke-virtual {v10, v11, v12}, Lcom/jjoe64/graphview/GraphView;->onDataChanged(ZZ)V

    .line 238
    iget-object v10, p0, Lcom/jjoe64/graphview/Viewport$2;->this$0:Lcom/jjoe64/graphview/Viewport;

    # getter for: Lcom/jjoe64/graphview/Viewport;->mGraphView:Lcom/jjoe64/graphview/GraphView;
    invoke-static {v10}, Lcom/jjoe64/graphview/Viewport;->access$000(Lcom/jjoe64/graphview/Viewport;)Lcom/jjoe64/graphview/GraphView;

    move-result-object v10

    invoke-static {v10}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    .line 239
    const/4 v10, 0x1

    goto/16 :goto_f

    .line 191
    .end local v1    # "canScrollX":Z
    .end local v2    # "canScrollY":Z
    :cond_1c6
    const/4 v1, 0x0

    goto/16 :goto_e5

    .line 193
    .restart local v1    # "canScrollX":Z
    :cond_1c9
    const/4 v2, 0x0

    goto/16 :goto_106

    .line 203
    .restart local v2    # "canScrollY":Z
    :cond_1cc
    iget-object v10, p0, Lcom/jjoe64/graphview/Viewport$2;->this$0:Lcom/jjoe64/graphview/Viewport;

    iget-object v10, v10, Lcom/jjoe64/graphview/Viewport;->mCurrentViewport:Landroid/graphics/RectF;

    iget v10, v10, Landroid/graphics/RectF;->right:F

    add-float/2addr v10, v8

    iget-object v11, p0, Lcom/jjoe64/graphview/Viewport$2;->this$0:Lcom/jjoe64/graphview/Viewport;

    iget-object v11, v11, Lcom/jjoe64/graphview/Viewport;->mCompleteRange:Landroid/graphics/RectF;

    iget v11, v11, Landroid/graphics/RectF;->right:F

    sub-float v7, v10, v11

    .line 204
    .restart local v7    # "tooMuch":F
    const/4 v10, 0x0

    cmpl-float v10, v7, v10

    if-lez v10, :cond_122

    .line 205
    sub-float/2addr v8, v7

    goto/16 :goto_122
.end method
