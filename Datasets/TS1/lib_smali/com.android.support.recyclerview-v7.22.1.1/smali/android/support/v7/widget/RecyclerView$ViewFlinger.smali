.class Landroid/support/v7/widget/RecyclerView$ViewFlinger;
.super Ljava/lang/Object;
.source "RecyclerView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/widget/RecyclerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ViewFlinger"
.end annotation


# instance fields
.field private mEatRunOnAnimationRequest:Z

.field private mInterpolator:Landroid/view/animation/Interpolator;

.field private mLastFlingX:I

.field private mLastFlingY:I

.field private mReSchedulePostAnimationCallback:Z

.field private mScroller:Landroid/support/v4/widget/ScrollerCompat;

.field final synthetic this$0:Landroid/support/v7/widget/RecyclerView;


# direct methods
.method public constructor <init>(Landroid/support/v7/widget/RecyclerView;)V
    .registers 4

    .prologue
    const/4 v1, 0x0

    .line 3427
    iput-object p1, p0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3418
    # getter for: Landroid/support/v7/widget/RecyclerView;->sQuinticInterpolator:Landroid/view/animation/Interpolator;
    invoke-static {}, Landroid/support/v7/widget/RecyclerView;->access$2000()Landroid/view/animation/Interpolator;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->mInterpolator:Landroid/view/animation/Interpolator;

    .line 3422
    iput-boolean v1, p0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->mEatRunOnAnimationRequest:Z

    .line 3425
    iput-boolean v1, p0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->mReSchedulePostAnimationCallback:Z

    .line 3428
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getContext()Landroid/content/Context;

    move-result-object v0

    # getter for: Landroid/support/v7/widget/RecyclerView;->sQuinticInterpolator:Landroid/view/animation/Interpolator;
    invoke-static {}, Landroid/support/v7/widget/RecyclerView;->access$2000()Landroid/view/animation/Interpolator;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/support/v4/widget/ScrollerCompat;->create(Landroid/content/Context;Landroid/view/animation/Interpolator;)Landroid/support/v4/widget/ScrollerCompat;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->mScroller:Landroid/support/v4/widget/ScrollerCompat;

    .line 3429
    return-void
.end method

.method private computeScrollDuration(IIII)I
    .registers 19
    .param p1, "dx"    # I
    .param p2, "dy"    # I
    .param p3, "vx"    # I
    .param p4, "vy"    # I

    .prologue
    .line 3598
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    .line 3599
    .local v1, "absDx":I
    invoke-static/range {p2 .. p2}, Ljava/lang/Math;->abs(I)I

    move-result v2

    .line 3600
    .local v2, "absDy":I
    if-le v1, v2, :cond_59

    const/4 v9, 0x1

    .line 3601
    .local v9, "horizontal":Z
    :goto_b
    mul-int v11, p3, p3

    mul-int v12, p4, p4

    add-int/2addr v11, v12

    int-to-double v11, v11

    invoke-static {v11, v12}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v11

    double-to-int v10, v11

    .line 3602
    .local v10, "velocity":I
    mul-int v11, p1, p1

    mul-int v12, p2, p2

    add-int/2addr v11, v12

    int-to-double v11, v11

    invoke-static {v11, v12}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v11

    double-to-int v4, v11

    .line 3603
    .local v4, "delta":I
    if-eqz v9, :cond_5b

    iget-object v11, p0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v11}, Landroid/support/v7/widget/RecyclerView;->getWidth()I

    move-result v3

    .line 3604
    .local v3, "containerSize":I
    :goto_29
    div-int/lit8 v8, v3, 0x2

    .line 3605
    .local v8, "halfContainerSize":I
    const/high16 v11, 0x3f800000    # 1.0f

    const/high16 v12, 0x3f800000    # 1.0f

    int-to-float v13, v4

    mul-float/2addr v12, v13

    int-to-float v13, v3

    div-float/2addr v12, v13

    invoke-static {v11, v12}, Ljava/lang/Math;->min(FF)F

    move-result v6

    .line 3606
    .local v6, "distanceRatio":F
    int-to-float v11, v8

    int-to-float v12, v8

    invoke-direct {p0, v6}, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->distanceInfluenceForSnapDuration(F)F

    move-result v13

    mul-float/2addr v12, v13

    add-float v5, v11, v12

    .line 3610
    .local v5, "distance":F
    if-lez v10, :cond_62

    .line 3611
    const/high16 v11, 0x447a0000    # 1000.0f

    int-to-float v12, v10

    div-float v12, v5, v12

    invoke-static {v12}, Ljava/lang/Math;->abs(F)F

    move-result v12

    mul-float/2addr v11, v12

    invoke-static {v11}, Ljava/lang/Math;->round(F)I

    move-result v11

    mul-int/lit8 v7, v11, 0x4

    .line 3616
    .end local v1    # "absDx":I
    .local v7, "duration":I
    :goto_52
    const/16 v11, 0x7d0

    invoke-static {v7, v11}, Ljava/lang/Math;->min(II)I

    move-result v11

    return v11

    .line 3600
    .end local v3    # "containerSize":I
    .end local v4    # "delta":I
    .end local v5    # "distance":F
    .end local v6    # "distanceRatio":F
    .end local v7    # "duration":I
    .end local v8    # "halfContainerSize":I
    .end local v9    # "horizontal":Z
    .end local v10    # "velocity":I
    .restart local v1    # "absDx":I
    :cond_59
    const/4 v9, 0x0

    goto :goto_b

    .line 3603
    .restart local v4    # "delta":I
    .restart local v9    # "horizontal":Z
    .restart local v10    # "velocity":I
    :cond_5b
    iget-object v11, p0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v11}, Landroid/support/v7/widget/RecyclerView;->getHeight()I

    move-result v3

    goto :goto_29

    .line 3613
    .restart local v3    # "containerSize":I
    .restart local v5    # "distance":F
    .restart local v6    # "distanceRatio":F
    .restart local v8    # "halfContainerSize":I
    :cond_62
    if-eqz v9, :cond_70

    .end local v1    # "absDx":I
    :goto_64
    int-to-float v0, v1

    .line 3614
    .local v0, "absDelta":F
    int-to-float v11, v3

    div-float v11, v0, v11

    const/high16 v12, 0x3f800000    # 1.0f

    add-float/2addr v11, v12

    const/high16 v12, 0x43960000    # 300.0f

    mul-float/2addr v11, v12

    float-to-int v7, v11

    .restart local v7    # "duration":I
    goto :goto_52

    .end local v0    # "absDelta":F
    .end local v7    # "duration":I
    .restart local v1    # "absDx":I
    :cond_70
    move v1, v2

    .line 3613
    goto :goto_64
.end method

.method private disableRunOnAnimationRequests()V
    .registers 2

    .prologue
    .line 3555
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->mReSchedulePostAnimationCallback:Z

    .line 3556
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->mEatRunOnAnimationRequest:Z

    .line 3557
    return-void
.end method

.method private distanceInfluenceForSnapDuration(F)F
    .registers 6
    .param p1, "f"    # F

    .prologue
    .line 3592
    const/high16 v0, 0x3f000000    # 0.5f

    sub-float/2addr p1, v0

    .line 3593
    float-to-double v0, p1

    const-wide v2, 0x3fde28c7460698c7L    # 0.4712389167638204

    mul-double/2addr v0, v2

    double-to-float p1, v0

    .line 3594
    float-to-double v0, p1

    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    move-result-wide v0

    double-to-float v0, v0

    return v0
.end method

.method private enableRunOnAnimationRequests()V
    .registers 2

    .prologue
    .line 3560
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->mEatRunOnAnimationRequest:Z

    .line 3561
    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->mReSchedulePostAnimationCallback:Z

    if-eqz v0, :cond_a

    .line 3562
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->postOnAnimation()V

    .line 3564
    :cond_a
    return-void
.end method


# virtual methods
.method public fling(II)V
    .registers 12
    .param p1, "velocityX"    # I
    .param p2, "velocityY"    # I

    .prologue
    const v6, 0x7fffffff

    const/high16 v5, -0x80000000

    const/4 v1, 0x0

    .line 3576
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    const/4 v2, 0x2

    # invokes: Landroid/support/v7/widget/RecyclerView;->setScrollState(I)V
    invoke-static {v0, v2}, Landroid/support/v7/widget/RecyclerView;->access$3000(Landroid/support/v7/widget/RecyclerView;I)V

    .line 3577
    iput v1, p0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->mLastFlingY:I

    iput v1, p0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->mLastFlingX:I

    .line 3578
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->mScroller:Landroid/support/v4/widget/ScrollerCompat;

    move v2, v1

    move v3, p1

    move v4, p2

    move v7, v5

    move v8, v6

    invoke-virtual/range {v0 .. v8}, Landroid/support/v4/widget/ScrollerCompat;->fling(IIIIIIII)V

    .line 3580
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->postOnAnimation()V

    .line 3581
    return-void
.end method

.method postOnAnimation()V
    .registers 2

    .prologue
    .line 3567
    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->mEatRunOnAnimationRequest:Z

    if-eqz v0, :cond_8

    .line 3568
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->mReSchedulePostAnimationCallback:Z

    .line 3573
    :goto_7
    return-void

    .line 3570
    :cond_8
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0, p0}, Landroid/support/v7/widget/RecyclerView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 3571
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    invoke-static {v0, p0}, Landroid/support/v4/view/ViewCompat;->postOnAnimation(Landroid/view/View;Ljava/lang/Runnable;)V

    goto :goto_7
.end method

.method public run()V
    .registers 32

    .prologue
    .line 3433
    invoke-direct/range {p0 .. p0}, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->disableRunOnAnimationRequests()V

    .line 3434
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    move-object/from16 v28, v0

    # invokes: Landroid/support/v7/widget/RecyclerView;->consumePendingUpdateOperations()V
    invoke-static/range {v28 .. v28}, Landroid/support/v7/widget/RecyclerView;->access$2100(Landroid/support/v7/widget/RecyclerView;)V

    .line 3437
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->mScroller:Landroid/support/v4/widget/ScrollerCompat;

    move-object/from16 v17, v0

    .line 3438
    .local v17, "scroller":Landroid/support/v4/widget/ScrollerCompat;
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    move-object/from16 v28, v0

    # getter for: Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;
    invoke-static/range {v28 .. v28}, Landroid/support/v7/widget/RecyclerView;->access$1100(Landroid/support/v7/widget/RecyclerView;)Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v28

    move-object/from16 v0, v28

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView$LayoutManager;->mSmoothScroller:Landroid/support/v7/widget/RecyclerView$SmoothScroller;

    move-object/from16 v19, v0

    .line 3439
    .local v19, "smoothScroller":Landroid/support/v7/widget/RecyclerView$SmoothScroller;
    invoke-virtual/range {v17 .. v17}, Landroid/support/v4/widget/ScrollerCompat;->computeScrollOffset()Z

    move-result v28

    if-eqz v28, :cond_29f

    .line 3440
    invoke-virtual/range {v17 .. v17}, Landroid/support/v4/widget/ScrollerCompat;->getCurrX()I

    move-result v26

    .line 3441
    .local v26, "x":I
    invoke-virtual/range {v17 .. v17}, Landroid/support/v4/widget/ScrollerCompat;->getCurrY()I

    move-result v27

    .line 3442
    .local v27, "y":I
    move-object/from16 v0, p0

    iget v0, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->mLastFlingX:I

    move/from16 v28, v0

    sub-int v6, v26, v28

    .line 3443
    .local v6, "dx":I
    move-object/from16 v0, p0

    iget v0, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->mLastFlingY:I

    move/from16 v28, v0

    sub-int v7, v27, v28

    .line 3444
    .local v7, "dy":I
    const/4 v12, 0x0

    .line 3445
    .local v12, "hresult":I
    const/16 v25, 0x0

    .line 3446
    .local v25, "vresult":I
    move/from16 v0, v26

    move-object/from16 v1, p0

    iput v0, v1, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->mLastFlingX:I

    .line 3447
    move/from16 v0, v27

    move-object/from16 v1, p0

    iput v0, v1, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->mLastFlingY:I

    .line 3448
    const/4 v15, 0x0

    .local v15, "overscrollX":I
    const/16 v16, 0x0

    .line 3449
    .local v16, "overscrollY":I
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    move-object/from16 v28, v0

    # getter for: Landroid/support/v7/widget/RecyclerView;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;
    invoke-static/range {v28 .. v28}, Landroid/support/v7/widget/RecyclerView;->access$2200(Landroid/support/v7/widget/RecyclerView;)Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v28

    if-eqz v28, :cond_194

    .line 3450
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Landroid/support/v7/widget/RecyclerView;->eatRequestLayout()V

    .line 3451
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    move-object/from16 v28, v0

    # invokes: Landroid/support/v7/widget/RecyclerView;->onEnterLayoutOrScroll()V
    invoke-static/range {v28 .. v28}, Landroid/support/v7/widget/RecyclerView;->access$2300(Landroid/support/v7/widget/RecyclerView;)V

    .line 3452
    const-string v28, "RV Scroll"

    invoke-static/range {v28 .. v28}, Landroid/support/v4/os/TraceCompat;->beginSection(Ljava/lang/String;)V

    .line 3453
    if-eqz v6, :cond_a5

    .line 3454
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    move-object/from16 v28, v0

    # getter for: Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;
    invoke-static/range {v28 .. v28}, Landroid/support/v7/widget/RecyclerView;->access$1100(Landroid/support/v7/widget/RecyclerView;)Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v28

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView$Recycler;

    move-object/from16 v29, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    move-object/from16 v30, v0

    move-object/from16 v0, v28

    move-object/from16 v1, v29

    move-object/from16 v2, v30

    invoke-virtual {v0, v6, v1, v2}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->scrollHorizontallyBy(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v12

    .line 3455
    sub-int v15, v6, v12

    .line 3457
    :cond_a5
    if-eqz v7, :cond_d5

    .line 3458
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    move-object/from16 v28, v0

    # getter for: Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;
    invoke-static/range {v28 .. v28}, Landroid/support/v7/widget/RecyclerView;->access$1100(Landroid/support/v7/widget/RecyclerView;)Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v28

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView$Recycler;

    move-object/from16 v29, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    move-object/from16 v30, v0

    move-object/from16 v0, v28

    move-object/from16 v1, v29

    move-object/from16 v2, v30

    invoke-virtual {v0, v7, v1, v2}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->scrollVerticallyBy(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v25

    .line 3459
    sub-int v16, v7, v25

    .line 3461
    :cond_d5
    invoke-static {}, Landroid/support/v4/os/TraceCompat;->endSection()V

    .line 3462
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    move-object/from16 v28, v0

    # invokes: Landroid/support/v7/widget/RecyclerView;->supportsChangeAnimations()Z
    invoke-static/range {v28 .. v28}, Landroid/support/v7/widget/RecyclerView;->access$2400(Landroid/support/v7/widget/RecyclerView;)Z

    move-result v28

    if-eqz v28, :cond_15d

    .line 3464
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Landroid/support/v7/widget/ChildHelper;->getChildCount()I

    move-result v5

    .line 3465
    .local v5, "count":I
    const/4 v13, 0x0

    .local v13, "i":I
    :goto_f5
    if-ge v13, v5, :cond_15d

    .line 3466
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    invoke-virtual {v0, v13}, Landroid/support/v7/widget/ChildHelper;->getChildAt(I)Landroid/view/View;

    move-result-object v24

    .line 3467
    .local v24, "view":Landroid/view/View;
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolder(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v11

    .line 3468
    .local v11, "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    if-eqz v11, :cond_15a

    iget-object v0, v11, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mShadowingHolder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-object/from16 v28, v0

    if-eqz v28, :cond_15a

    .line 3469
    iget-object v0, v11, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mShadowingHolder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    move-object/from16 v18, v0

    .line 3470
    .local v18, "shadowingView":Landroid/view/View;
    invoke-virtual/range {v24 .. v24}, Landroid/view/View;->getLeft()I

    move-result v14

    .line 3471
    .local v14, "left":I
    invoke-virtual/range {v24 .. v24}, Landroid/view/View;->getTop()I

    move-result v20

    .line 3472
    .local v20, "top":I
    invoke-virtual/range {v18 .. v18}, Landroid/view/View;->getLeft()I

    move-result v28

    move/from16 v0, v28

    if-ne v14, v0, :cond_143

    invoke-virtual/range {v18 .. v18}, Landroid/view/View;->getTop()I

    move-result v28

    move/from16 v0, v20

    move/from16 v1, v28

    if-eq v0, v1, :cond_15a

    .line 3474
    :cond_143
    invoke-virtual/range {v18 .. v18}, Landroid/view/View;->getWidth()I

    move-result v28

    add-int v28, v28, v14

    invoke-virtual/range {v18 .. v18}, Landroid/view/View;->getHeight()I

    move-result v29

    add-int v29, v29, v20

    move-object/from16 v0, v18

    move/from16 v1, v20

    move/from16 v2, v28

    move/from16 v3, v29

    invoke-virtual {v0, v14, v1, v2, v3}, Landroid/view/View;->layout(IIII)V

    .line 3465
    .end local v14    # "left":I
    .end local v18    # "shadowingView":Landroid/view/View;
    .end local v20    # "top":I
    :cond_15a
    add-int/lit8 v13, v13, 0x1

    goto :goto_f5

    .line 3482
    .end local v5    # "count":I
    .end local v11    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .end local v13    # "i":I
    .end local v24    # "view":Landroid/view/View;
    :cond_15d
    if-eqz v19, :cond_180

    invoke-virtual/range {v19 .. v19}, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->isPendingInitialRun()Z

    move-result v28

    if-nez v28, :cond_180

    invoke-virtual/range {v19 .. v19}, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->isRunning()Z

    move-result v28

    if-eqz v28, :cond_180

    .line 3484
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v4

    .line 3485
    .local v4, "adapterSize":I
    if-nez v4, :cond_2b8

    .line 3486
    invoke-virtual/range {v19 .. v19}, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->stop()V

    .line 3494
    .end local v4    # "adapterSize":I
    :cond_180
    :goto_180
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    move-object/from16 v28, v0

    # invokes: Landroid/support/v7/widget/RecyclerView;->onExitLayoutOrScroll()V
    invoke-static/range {v28 .. v28}, Landroid/support/v7/widget/RecyclerView;->access$2600(Landroid/support/v7/widget/RecyclerView;)V

    .line 3495
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    move-object/from16 v28, v0

    const/16 v29, 0x0

    invoke-virtual/range {v28 .. v29}, Landroid/support/v7/widget/RecyclerView;->resumeRequestLayout(Z)V

    .line 3497
    :cond_194
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    move-object/from16 v28, v0

    # getter for: Landroid/support/v7/widget/RecyclerView;->mItemDecorations:Ljava/util/ArrayList;
    invoke-static/range {v28 .. v28}, Landroid/support/v7/widget/RecyclerView;->access$2700(Landroid/support/v7/widget/RecyclerView;)Ljava/util/ArrayList;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v28

    if-nez v28, :cond_1ad

    .line 3498
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Landroid/support/v7/widget/RecyclerView;->invalidate()V

    .line 3500
    :cond_1ad
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    move-object/from16 v28, v0

    invoke-static/range {v28 .. v28}, Landroid/support/v4/view/ViewCompat;->getOverScrollMode(Landroid/view/View;)I

    move-result v28

    const/16 v29, 0x2

    move/from16 v0, v28

    move/from16 v1, v29

    if-eq v0, v1, :cond_1ca

    .line 3502
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    # invokes: Landroid/support/v7/widget/RecyclerView;->considerReleasingGlowsOnScroll(II)V
    invoke-static {v0, v6, v7}, Landroid/support/v7/widget/RecyclerView;->access$2800(Landroid/support/v7/widget/RecyclerView;II)V

    .line 3504
    :cond_1ca
    if-nez v15, :cond_1ce

    if-eqz v16, :cond_231

    .line 3505
    :cond_1ce
    invoke-virtual/range {v17 .. v17}, Landroid/support/v4/widget/ScrollerCompat;->getCurrVelocity()F

    move-result v28

    move/from16 v0, v28

    float-to-int v0, v0

    move/from16 v21, v0

    .line 3507
    .local v21, "vel":I
    const/16 v22, 0x0

    .line 3508
    .local v22, "velX":I
    move/from16 v0, v26

    if-eq v15, v0, :cond_1e4

    .line 3509
    if-gez v15, :cond_2e7

    move/from16 v0, v21

    neg-int v0, v0

    move/from16 v22, v0

    .line 3512
    :cond_1e4
    :goto_1e4
    const/16 v23, 0x0

    .line 3513
    .local v23, "velY":I
    move/from16 v0, v16

    move/from16 v1, v27

    if-eq v0, v1, :cond_1f3

    .line 3514
    if-gez v16, :cond_2f1

    move/from16 v0, v21

    neg-int v0, v0

    move/from16 v23, v0

    .line 3517
    :cond_1f3
    :goto_1f3
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    move-object/from16 v28, v0

    invoke-static/range {v28 .. v28}, Landroid/support/v4/view/ViewCompat;->getOverScrollMode(Landroid/view/View;)I

    move-result v28

    const/16 v29, 0x2

    move/from16 v0, v28

    move/from16 v1, v29

    if-eq v0, v1, :cond_214

    .line 3519
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    move/from16 v1, v22

    move/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/widget/RecyclerView;->absorbGlows(II)V

    .line 3521
    :cond_214
    if-nez v22, :cond_220

    move/from16 v0, v26

    if-eq v15, v0, :cond_220

    invoke-virtual/range {v17 .. v17}, Landroid/support/v4/widget/ScrollerCompat;->getFinalX()I

    move-result v28

    if-nez v28, :cond_231

    :cond_220
    if-nez v23, :cond_22e

    move/from16 v0, v16

    move/from16 v1, v27

    if-eq v0, v1, :cond_22e

    invoke-virtual/range {v17 .. v17}, Landroid/support/v4/widget/ScrollerCompat;->getFinalY()I

    move-result v28

    if-nez v28, :cond_231

    .line 3523
    :cond_22e
    invoke-virtual/range {v17 .. v17}, Landroid/support/v4/widget/ScrollerCompat;->abortAnimation()V

    .line 3526
    .end local v21    # "vel":I
    .end local v22    # "velX":I
    .end local v23    # "velY":I
    :cond_231
    if-nez v12, :cond_235

    if-eqz v25, :cond_242

    .line 3527
    :cond_235
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    move/from16 v1, v25

    invoke-virtual {v0, v12, v1}, Landroid/support/v7/widget/RecyclerView;->dispatchOnScrolled(II)V

    .line 3530
    :cond_242
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    move-object/from16 v28, v0

    # invokes: Landroid/support/v7/widget/RecyclerView;->awakenScrollBars()Z
    invoke-static/range {v28 .. v28}, Landroid/support/v7/widget/RecyclerView;->access$2900(Landroid/support/v7/widget/RecyclerView;)Z

    move-result v28

    if-nez v28, :cond_257

    .line 3531
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Landroid/support/v7/widget/RecyclerView;->invalidate()V

    .line 3534
    :cond_257
    if-eqz v7, :cond_2fb

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    move-object/from16 v28, v0

    # getter for: Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;
    invoke-static/range {v28 .. v28}, Landroid/support/v7/widget/RecyclerView;->access$1100(Landroid/support/v7/widget/RecyclerView;)Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->canScrollVertically()Z

    move-result v28

    if-eqz v28, :cond_2fb

    move/from16 v0, v25

    if-ne v0, v7, :cond_2fb

    const/4 v10, 0x1

    .line 3536
    .local v10, "fullyConsumedVertical":Z
    :goto_26e
    if-eqz v6, :cond_2fe

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    move-object/from16 v28, v0

    # getter for: Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;
    invoke-static/range {v28 .. v28}, Landroid/support/v7/widget/RecyclerView;->access$1100(Landroid/support/v7/widget/RecyclerView;)Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->canScrollHorizontally()Z

    move-result v28

    if-eqz v28, :cond_2fe

    if-ne v12, v6, :cond_2fe

    const/4 v9, 0x1

    .line 3538
    .local v9, "fullyConsumedHorizontal":Z
    :goto_283
    if-nez v6, :cond_287

    if-eqz v7, :cond_28b

    :cond_287
    if-nez v9, :cond_28b

    if-eqz v10, :cond_300

    :cond_28b
    const/4 v8, 0x1

    .line 3541
    .local v8, "fullyConsumedAny":Z
    :goto_28c
    invoke-virtual/range {v17 .. v17}, Landroid/support/v4/widget/ScrollerCompat;->isFinished()Z

    move-result v28

    if-nez v28, :cond_294

    if-nez v8, :cond_302

    .line 3542
    :cond_294
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    move-object/from16 v28, v0

    const/16 v29, 0x0

    # invokes: Landroid/support/v7/widget/RecyclerView;->setScrollState(I)V
    invoke-static/range {v28 .. v29}, Landroid/support/v7/widget/RecyclerView;->access$3000(Landroid/support/v7/widget/RecyclerView;I)V

    .line 3548
    .end local v6    # "dx":I
    .end local v7    # "dy":I
    .end local v8    # "fullyConsumedAny":Z
    .end local v9    # "fullyConsumedHorizontal":Z
    .end local v10    # "fullyConsumedVertical":Z
    .end local v12    # "hresult":I
    .end local v15    # "overscrollX":I
    .end local v16    # "overscrollY":I
    .end local v25    # "vresult":I
    .end local v26    # "x":I
    .end local v27    # "y":I
    :cond_29f
    :goto_29f
    if-eqz v19, :cond_2b4

    invoke-virtual/range {v19 .. v19}, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->isPendingInitialRun()Z

    move-result v28

    if-eqz v28, :cond_2b4

    .line 3549
    const/16 v28, 0x0

    const/16 v29, 0x0

    move-object/from16 v0, v19

    move/from16 v1, v28

    move/from16 v2, v29

    # invokes: Landroid/support/v7/widget/RecyclerView$SmoothScroller;->onAnimation(II)V
    invoke-static {v0, v1, v2}, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->access$2500(Landroid/support/v7/widget/RecyclerView$SmoothScroller;II)V

    .line 3551
    :cond_2b4
    invoke-direct/range {p0 .. p0}, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->enableRunOnAnimationRequests()V

    .line 3552
    return-void

    .line 3487
    .restart local v4    # "adapterSize":I
    .restart local v6    # "dx":I
    .restart local v7    # "dy":I
    .restart local v12    # "hresult":I
    .restart local v15    # "overscrollX":I
    .restart local v16    # "overscrollY":I
    .restart local v25    # "vresult":I
    .restart local v26    # "x":I
    .restart local v27    # "y":I
    :cond_2b8
    invoke-virtual/range {v19 .. v19}, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->getTargetPosition()I

    move-result v28

    move/from16 v0, v28

    if-lt v0, v4, :cond_2d8

    .line 3488
    add-int/lit8 v28, v4, -0x1

    move-object/from16 v0, v19

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->setTargetPosition(I)V

    .line 3489
    sub-int v28, v6, v15

    sub-int v29, v7, v16

    move-object/from16 v0, v19

    move/from16 v1, v28

    move/from16 v2, v29

    # invokes: Landroid/support/v7/widget/RecyclerView$SmoothScroller;->onAnimation(II)V
    invoke-static {v0, v1, v2}, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->access$2500(Landroid/support/v7/widget/RecyclerView$SmoothScroller;II)V

    goto/16 :goto_180

    .line 3491
    :cond_2d8
    sub-int v28, v6, v15

    sub-int v29, v7, v16

    move-object/from16 v0, v19

    move/from16 v1, v28

    move/from16 v2, v29

    # invokes: Landroid/support/v7/widget/RecyclerView$SmoothScroller;->onAnimation(II)V
    invoke-static {v0, v1, v2}, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->access$2500(Landroid/support/v7/widget/RecyclerView$SmoothScroller;II)V

    goto/16 :goto_180

    .line 3509
    .end local v4    # "adapterSize":I
    .restart local v21    # "vel":I
    .restart local v22    # "velX":I
    :cond_2e7
    if-lez v15, :cond_2ed

    move/from16 v22, v21

    goto/16 :goto_1e4

    :cond_2ed
    const/16 v22, 0x0

    goto/16 :goto_1e4

    .line 3514
    .restart local v23    # "velY":I
    :cond_2f1
    if-lez v16, :cond_2f7

    move/from16 v23, v21

    goto/16 :goto_1f3

    :cond_2f7
    const/16 v23, 0x0

    goto/16 :goto_1f3

    .line 3534
    .end local v21    # "vel":I
    .end local v22    # "velX":I
    .end local v23    # "velY":I
    :cond_2fb
    const/4 v10, 0x0

    goto/16 :goto_26e

    .line 3536
    .restart local v10    # "fullyConsumedVertical":Z
    :cond_2fe
    const/4 v9, 0x0

    goto :goto_283

    .line 3538
    .restart local v9    # "fullyConsumedHorizontal":Z
    :cond_300
    const/4 v8, 0x0

    goto :goto_28c

    .line 3544
    .restart local v8    # "fullyConsumedAny":Z
    :cond_302
    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->postOnAnimation()V

    goto :goto_29f
.end method

.method public smoothScrollBy(II)V
    .registers 4
    .param p1, "dx"    # I
    .param p2, "dy"    # I

    .prologue
    const/4 v0, 0x0

    .line 3584
    invoke-virtual {p0, p1, p2, v0, v0}, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->smoothScrollBy(IIII)V

    .line 3585
    return-void
.end method

.method public smoothScrollBy(III)V
    .registers 5
    .param p1, "dx"    # I
    .param p2, "dy"    # I
    .param p3, "duration"    # I

    .prologue
    .line 3620
    # getter for: Landroid/support/v7/widget/RecyclerView;->sQuinticInterpolator:Landroid/view/animation/Interpolator;
    invoke-static {}, Landroid/support/v7/widget/RecyclerView;->access$2000()Landroid/view/animation/Interpolator;

    move-result-object v0

    invoke-virtual {p0, p1, p2, p3, v0}, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->smoothScrollBy(IIILandroid/view/animation/Interpolator;)V

    .line 3621
    return-void
.end method

.method public smoothScrollBy(IIII)V
    .registers 6
    .param p1, "dx"    # I
    .param p2, "dy"    # I
    .param p3, "vx"    # I
    .param p4, "vy"    # I

    .prologue
    .line 3588
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->computeScrollDuration(IIII)I

    move-result v0

    invoke-virtual {p0, p1, p2, v0}, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->smoothScrollBy(III)V

    .line 3589
    return-void
.end method

.method public smoothScrollBy(IIILandroid/view/animation/Interpolator;)V
    .registers 11
    .param p1, "dx"    # I
    .param p2, "dy"    # I
    .param p3, "duration"    # I
    .param p4, "interpolator"    # Landroid/view/animation/Interpolator;

    .prologue
    const/4 v1, 0x0

    .line 3624
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->mInterpolator:Landroid/view/animation/Interpolator;

    if-eq v0, p4, :cond_13

    .line 3625
    iput-object p4, p0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->mInterpolator:Landroid/view/animation/Interpolator;

    .line 3626
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p4}, Landroid/support/v4/widget/ScrollerCompat;->create(Landroid/content/Context;Landroid/view/animation/Interpolator;)Landroid/support/v4/widget/ScrollerCompat;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->mScroller:Landroid/support/v4/widget/ScrollerCompat;

    .line 3628
    :cond_13
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    const/4 v2, 0x2

    # invokes: Landroid/support/v7/widget/RecyclerView;->setScrollState(I)V
    invoke-static {v0, v2}, Landroid/support/v7/widget/RecyclerView;->access$3000(Landroid/support/v7/widget/RecyclerView;I)V

    .line 3629
    iput v1, p0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->mLastFlingY:I

    iput v1, p0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->mLastFlingX:I

    .line 3630
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->mScroller:Landroid/support/v4/widget/ScrollerCompat;

    move v2, v1

    move v3, p1

    move v4, p2

    move v5, p3

    invoke-virtual/range {v0 .. v5}, Landroid/support/v4/widget/ScrollerCompat;->startScroll(IIIII)V

    .line 3631
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->postOnAnimation()V

    .line 3632
    return-void
.end method

.method public stop()V
    .registers 2

    .prologue
    .line 3635
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0, p0}, Landroid/support/v7/widget/RecyclerView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 3636
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->mScroller:Landroid/support/v4/widget/ScrollerCompat;

    invoke-virtual {v0}, Landroid/support/v4/widget/ScrollerCompat;->abortAnimation()V

    .line 3637
    return-void
.end method
