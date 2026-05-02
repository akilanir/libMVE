.class Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;
.super Landroid/widget/FrameLayout;
.source "BottomSheetDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/app/BottomSheetDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ContainerFrameLayout"
.end annotation


# instance fields
.field private mChildTop:I

.field private mClickOutside:Z

.field final synthetic this$0:Lcom/rey/material/app/BottomSheetDialog;


# direct methods
.method public constructor <init>(Lcom/rey/material/app/BottomSheetDialog;Landroid/content/Context;)V
    .registers 4
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 384
    iput-object p1, p0, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->this$0:Lcom/rey/material/app/BottomSheetDialog;

    .line 385
    invoke-direct {p0, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 381
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->mClickOutside:Z

    .line 382
    const/4 v0, -0x1

    iput v0, p0, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->mChildTop:I

    .line 386
    return-void
.end method

.method private isOutsideDialog(FF)Z
    .registers 8
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 464
    iget v3, p0, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->mChildTop:I

    int-to-float v3, v3

    cmpg-float v3, p2, v3

    if-gez v3, :cond_a

    .line 471
    :cond_9
    :goto_9
    return v1

    .line 467
    :cond_a
    invoke-virtual {p0, v2}, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 468
    .local v0, "child":Landroid/view/View;
    if-eqz v0, :cond_1c

    iget v3, p0, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->mChildTop:I

    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v4

    add-int/2addr v3, v4

    int-to-float v3, v3

    cmpl-float v3, p2, v3

    if-gtz v3, :cond_9

    :cond_1c
    move v1, v2

    .line 471
    goto :goto_9
.end method


# virtual methods
.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 3
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 476
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    if-nez v0, :cond_17

    iget-object v0, p0, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->this$0:Lcom/rey/material/app/BottomSheetDialog;

    # getter for: Lcom/rey/material/app/BottomSheetDialog;->mGestureDetector:Landroid/view/GestureDetector;
    invoke-static {v0}, Lcom/rey/material/app/BottomSheetDialog;->access$1000(Lcom/rey/material/app/BottomSheetDialog;)Landroid/view/GestureDetector;

    move-result-object v0

    if-eqz v0, :cond_17

    .line 477
    iget-object v0, p0, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->this$0:Lcom/rey/material/app/BottomSheetDialog;

    # getter for: Lcom/rey/material/app/BottomSheetDialog;->mGestureDetector:Landroid/view/GestureDetector;
    invoke-static {v0}, Lcom/rey/material/app/BottomSheetDialog;->access$1000(Lcom/rey/material/app/BottomSheetDialog;)Landroid/view/GestureDetector;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 478
    :cond_17
    const/4 v0, 0x1

    return v0
.end method

.method protected onLayout(ZIIII)V
    .registers 15
    .param p1, "changed"    # Z
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I

    .prologue
    const/4 v8, 0x0

    .line 419
    invoke-virtual {p0, v8}, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 421
    .local v0, "child":Landroid/view/View;
    if-eqz v0, :cond_b3

    .line 422
    iget v3, p0, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->mChildTop:I

    if-gez v3, :cond_f

    .line 423
    sub-int v3, p5, p3

    iput v3, p0, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->mChildTop:I

    .line 425
    :cond_f
    iget v3, p0, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->mChildTop:I

    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v4

    sub-int v5, p5, p3

    iget v6, p0, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->mChildTop:I

    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v7

    add-int/2addr v6, v7

    invoke-static {v5, v6}, Ljava/lang/Math;->max(II)I

    move-result v5

    invoke-virtual {v0, v8, v3, v4, v5}, Landroid/view/View;->layout(IIII)V

    .line 427
    iget-object v3, p0, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->this$0:Lcom/rey/material/app/BottomSheetDialog;

    # getter for: Lcom/rey/material/app/BottomSheetDialog;->mRunShowAnimation:Z
    invoke-static {v3}, Lcom/rey/material/app/BottomSheetDialog;->access$600(Lcom/rey/material/app/BottomSheetDialog;)Z

    move-result v3

    if-eqz v3, :cond_b3

    .line 428
    iget-object v3, p0, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->this$0:Lcom/rey/material/app/BottomSheetDialog;

    # setter for: Lcom/rey/material/app/BottomSheetDialog;->mRunShowAnimation:Z
    invoke-static {v3, v8}, Lcom/rey/material/app/BottomSheetDialog;->access$602(Lcom/rey/material/app/BottomSheetDialog;Z)Z

    .line 430
    iget-object v3, p0, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->this$0:Lcom/rey/material/app/BottomSheetDialog;

    # getter for: Lcom/rey/material/app/BottomSheetDialog;->mAnimation:Landroid/view/animation/Animation;
    invoke-static {v3}, Lcom/rey/material/app/BottomSheetDialog;->access$200(Lcom/rey/material/app/BottomSheetDialog;)Landroid/view/animation/Animation;

    move-result-object v3

    if-eqz v3, :cond_49

    .line 431
    iget-object v3, p0, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->this$0:Lcom/rey/material/app/BottomSheetDialog;

    # getter for: Lcom/rey/material/app/BottomSheetDialog;->mAnimation:Landroid/view/animation/Animation;
    invoke-static {v3}, Lcom/rey/material/app/BottomSheetDialog;->access$200(Lcom/rey/material/app/BottomSheetDialog;)Landroid/view/animation/Animation;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/animation/Animation;->cancel()V

    .line 432
    iget-object v3, p0, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->this$0:Lcom/rey/material/app/BottomSheetDialog;

    const/4 v4, 0x0

    # setter for: Lcom/rey/material/app/BottomSheetDialog;->mAnimation:Landroid/view/animation/Animation;
    invoke-static {v3, v4}, Lcom/rey/material/app/BottomSheetDialog;->access$202(Lcom/rey/material/app/BottomSheetDialog;Landroid/view/animation/Animation;)Landroid/view/animation/Animation;

    .line 435
    :cond_49
    iget-object v3, p0, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->this$0:Lcom/rey/material/app/BottomSheetDialog;

    # getter for: Lcom/rey/material/app/BottomSheetDialog;->mContentView:Landroid/view/View;
    invoke-static {v3}, Lcom/rey/material/app/BottomSheetDialog;->access$700(Lcom/rey/material/app/BottomSheetDialog;)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_b3

    .line 436
    iget v3, p0, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->mChildTop:I

    if-gez v3, :cond_b4

    invoke-virtual {p0}, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->getHeight()I

    move-result v2

    .line 437
    .local v2, "start":I
    :goto_59
    invoke-virtual {p0}, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->getMeasuredHeight()I

    move-result v3

    iget-object v4, p0, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->this$0:Lcom/rey/material/app/BottomSheetDialog;

    # getter for: Lcom/rey/material/app/BottomSheetDialog;->mContentView:Landroid/view/View;
    invoke-static {v4}, Lcom/rey/material/app/BottomSheetDialog;->access$700(Lcom/rey/material/app/BottomSheetDialog;)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/View;->getMeasuredHeight()I

    move-result v4

    sub-int v1, v3, v4

    .line 438
    .local v1, "end":I
    if-eq v2, v1, :cond_b3

    .line 439
    iget-object v3, p0, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->this$0:Lcom/rey/material/app/BottomSheetDialog;

    new-instance v4, Lcom/rey/material/app/BottomSheetDialog$SlideAnimation;

    iget-object v5, p0, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->this$0:Lcom/rey/material/app/BottomSheetDialog;

    invoke-direct {v4, v5, v2, v1}, Lcom/rey/material/app/BottomSheetDialog$SlideAnimation;-><init>(Lcom/rey/material/app/BottomSheetDialog;II)V

    # setter for: Lcom/rey/material/app/BottomSheetDialog;->mAnimation:Landroid/view/animation/Animation;
    invoke-static {v3, v4}, Lcom/rey/material/app/BottomSheetDialog;->access$202(Lcom/rey/material/app/BottomSheetDialog;Landroid/view/animation/Animation;)Landroid/view/animation/Animation;

    .line 440
    iget-object v3, p0, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->this$0:Lcom/rey/material/app/BottomSheetDialog;

    # getter for: Lcom/rey/material/app/BottomSheetDialog;->mAnimation:Landroid/view/animation/Animation;
    invoke-static {v3}, Lcom/rey/material/app/BottomSheetDialog;->access$200(Lcom/rey/material/app/BottomSheetDialog;)Landroid/view/animation/Animation;

    move-result-object v3

    iget-object v4, p0, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->this$0:Lcom/rey/material/app/BottomSheetDialog;

    # getter for: Lcom/rey/material/app/BottomSheetDialog;->mInDuration:I
    invoke-static {v4}, Lcom/rey/material/app/BottomSheetDialog;->access$800(Lcom/rey/material/app/BottomSheetDialog;)I

    move-result v4

    int-to-long v4, v4

    invoke-virtual {v3, v4, v5}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 441
    iget-object v3, p0, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->this$0:Lcom/rey/material/app/BottomSheetDialog;

    # getter for: Lcom/rey/material/app/BottomSheetDialog;->mAnimation:Landroid/view/animation/Animation;
    invoke-static {v3}, Lcom/rey/material/app/BottomSheetDialog;->access$200(Lcom/rey/material/app/BottomSheetDialog;)Landroid/view/animation/Animation;

    move-result-object v3

    iget-object v4, p0, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->this$0:Lcom/rey/material/app/BottomSheetDialog;

    # getter for: Lcom/rey/material/app/BottomSheetDialog;->mInInterpolator:Landroid/view/animation/Interpolator;
    invoke-static {v4}, Lcom/rey/material/app/BottomSheetDialog;->access$900(Lcom/rey/material/app/BottomSheetDialog;)Landroid/view/animation/Interpolator;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 442
    iget-object v3, p0, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->this$0:Lcom/rey/material/app/BottomSheetDialog;

    # getter for: Lcom/rey/material/app/BottomSheetDialog;->mAnimation:Landroid/view/animation/Animation;
    invoke-static {v3}, Lcom/rey/material/app/BottomSheetDialog;->access$200(Lcom/rey/material/app/BottomSheetDialog;)Landroid/view/animation/Animation;

    move-result-object v3

    new-instance v4, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout$1;

    invoke-direct {v4, p0}, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout$1;-><init>(Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;)V

    invoke-virtual {v3, v4}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 456
    iget-object v3, p0, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->this$0:Lcom/rey/material/app/BottomSheetDialog;

    # getter for: Lcom/rey/material/app/BottomSheetDialog;->mContentView:Landroid/view/View;
    invoke-static {v3}, Lcom/rey/material/app/BottomSheetDialog;->access$700(Lcom/rey/material/app/BottomSheetDialog;)Landroid/view/View;

    move-result-object v3

    iget-object v4, p0, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->this$0:Lcom/rey/material/app/BottomSheetDialog;

    # getter for: Lcom/rey/material/app/BottomSheetDialog;->mAnimation:Landroid/view/animation/Animation;
    invoke-static {v4}, Lcom/rey/material/app/BottomSheetDialog;->access$200(Lcom/rey/material/app/BottomSheetDialog;)Landroid/view/animation/Animation;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 461
    .end local v1    # "end":I
    .end local v2    # "start":I
    :cond_b3
    return-void

    .line 436
    :cond_b4
    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v2

    goto :goto_59
.end method

.method protected onMeasure(II)V
    .registers 9
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    const/high16 v5, 0x40000000    # 2.0f

    .line 397
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v2

    .line 398
    .local v2, "widthSize":I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    .line 400
    .local v1, "heightSize":I
    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 401
    .local v0, "child":Landroid/view/View;
    if-eqz v0, :cond_2f

    .line 402
    iget-object v3, p0, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->this$0:Lcom/rey/material/app/BottomSheetDialog;

    # getter for: Lcom/rey/material/app/BottomSheetDialog;->mLayoutHeight:I
    invoke-static {v3}, Lcom/rey/material/app/BottomSheetDialog;->access$500(Lcom/rey/material/app/BottomSheetDialog;)I

    move-result v3

    packed-switch v3, :pswitch_data_4e

    .line 410
    invoke-static {v2, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v3

    iget-object v4, p0, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->this$0:Lcom/rey/material/app/BottomSheetDialog;

    # getter for: Lcom/rey/material/app/BottomSheetDialog;->mLayoutHeight:I
    invoke-static {v4}, Lcom/rey/material/app/BottomSheetDialog;->access$500(Lcom/rey/material/app/BottomSheetDialog;)I

    move-result v4

    invoke-static {v4, v1}, Ljava/lang/Math;->min(II)I

    move-result v4

    invoke-static {v4, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v4

    invoke-virtual {v0, v3, v4}, Landroid/view/View;->measure(II)V

    .line 414
    :cond_2f
    :goto_2f
    invoke-virtual {p0, v2, v1}, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->setMeasuredDimension(II)V

    .line 415
    return-void

    .line 404
    :pswitch_33
    invoke-static {v2, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v3

    const/high16 v4, -0x80000000

    invoke-static {v1, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v4

    invoke-virtual {v0, v3, v4}, Landroid/view/View;->measure(II)V

    goto :goto_2f

    .line 407
    :pswitch_41
    invoke-static {v2, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v3

    invoke-static {v1, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v4

    invoke-virtual {v0, v3, v4}, Landroid/view/View;->measure(II)V

    goto :goto_2f

    .line 402
    nop

    :pswitch_data_4e
    .packed-switch -0x2
        :pswitch_33
        :pswitch_41
    .end packed-switch
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 7
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 483
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    .line 485
    .local v0, "handled":Z
    if-eqz v0, :cond_9

    .line 510
    :cond_8
    :goto_8
    return v1

    .line 488
    :cond_9
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v3

    packed-switch v3, :pswitch_data_58

    move v1, v2

    .line 510
    goto :goto_8

    .line 490
    :pswitch_12
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    invoke-direct {p0, v3, v4}, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->isOutsideDialog(FF)Z

    move-result v3

    if-eqz v3, :cond_23

    .line 491
    iput-boolean v1, p0, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->mClickOutside:Z

    goto :goto_8

    :cond_23
    move v1, v2

    .line 494
    goto :goto_8

    .line 496
    :pswitch_25
    iget-boolean v1, p0, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->mClickOutside:Z

    goto :goto_8

    .line 498
    :pswitch_28
    iput-boolean v2, p0, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->mClickOutside:Z

    move v1, v2

    .line 499
    goto :goto_8

    .line 501
    :pswitch_2c
    iget-boolean v3, p0, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->mClickOutside:Z

    if-eqz v3, :cond_56

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    invoke-direct {p0, v3, v4}, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->isOutsideDialog(FF)Z

    move-result v3

    if-eqz v3, :cond_56

    .line 502
    iput-boolean v2, p0, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->mClickOutside:Z

    .line 503
    iget-object v2, p0, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->this$0:Lcom/rey/material/app/BottomSheetDialog;

    # getter for: Lcom/rey/material/app/BottomSheetDialog;->mCancelable:Z
    invoke-static {v2}, Lcom/rey/material/app/BottomSheetDialog;->access$1100(Lcom/rey/material/app/BottomSheetDialog;)Z

    move-result v2

    if-eqz v2, :cond_8

    iget-object v2, p0, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->this$0:Lcom/rey/material/app/BottomSheetDialog;

    # getter for: Lcom/rey/material/app/BottomSheetDialog;->mCanceledOnTouchOutside:Z
    invoke-static {v2}, Lcom/rey/material/app/BottomSheetDialog;->access$1200(Lcom/rey/material/app/BottomSheetDialog;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 504
    iget-object v2, p0, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->this$0:Lcom/rey/material/app/BottomSheetDialog;

    invoke-virtual {v2}, Lcom/rey/material/app/BottomSheetDialog;->dismiss()V

    goto :goto_8

    :cond_56
    move v1, v2

    .line 507
    goto :goto_8

    .line 488
    :pswitch_data_58
    .packed-switch 0x0
        :pswitch_12
        :pswitch_2c
        :pswitch_25
        :pswitch_28
    .end packed-switch
.end method

.method public setChildTop(I)V
    .registers 5
    .param p1, "top"    # I

    .prologue
    .line 389
    iput p1, p0, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->mChildTop:I

    .line 390
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 391
    .local v0, "child":Landroid/view/View;
    if-eqz v0, :cond_13

    .line 392
    iget v1, p0, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->mChildTop:I

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {v0, v1}, Landroid/view/View;->offsetTopAndBottom(I)V

    .line 393
    :cond_13
    return-void
.end method
