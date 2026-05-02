.class Lcom/rey/material/widget/FloatingActionButton$SwitchIconAnimator;
.super Ljava/lang/Object;
.source "FloatingActionButton.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/widget/FloatingActionButton;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "SwitchIconAnimator"
.end annotation


# instance fields
.field mRunning:Z

.field mStartTime:J

.field final synthetic this$0:Lcom/rey/material/widget/FloatingActionButton;


# direct methods
.method constructor <init>(Lcom/rey/material/widget/FloatingActionButton;)V
    .registers 3

    .prologue
    .line 583
    iput-object p1, p0, Lcom/rey/material/widget/FloatingActionButton$SwitchIconAnimator;->this$0:Lcom/rey/material/widget/FloatingActionButton;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 585
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/rey/material/widget/FloatingActionButton$SwitchIconAnimator;->mRunning:Z

    return-void
.end method


# virtual methods
.method public resetAnimation()V
    .registers 3

    .prologue
    .line 589
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/rey/material/widget/FloatingActionButton$SwitchIconAnimator;->mStartTime:J

    .line 590
    iget-object v0, p0, Lcom/rey/material/widget/FloatingActionButton$SwitchIconAnimator;->this$0:Lcom/rey/material/widget/FloatingActionButton;

    # getter for: Lcom/rey/material/widget/FloatingActionButton;->mIcon:Landroid/graphics/drawable/Drawable;
    invoke-static {v0}, Lcom/rey/material/widget/FloatingActionButton;->access$100(Lcom/rey/material/widget/FloatingActionButton;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 591
    iget-object v0, p0, Lcom/rey/material/widget/FloatingActionButton$SwitchIconAnimator;->this$0:Lcom/rey/material/widget/FloatingActionButton;

    # getter for: Lcom/rey/material/widget/FloatingActionButton;->mPrevIcon:Landroid/graphics/drawable/Drawable;
    invoke-static {v0}, Lcom/rey/material/widget/FloatingActionButton;->access$200(Lcom/rey/material/widget/FloatingActionButton;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/16 v1, 0xff

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 592
    return-void
.end method

.method public run()V
    .registers 10

    .prologue
    const/high16 v7, 0x437f0000    # 255.0f

    const/high16 v6, 0x3f800000    # 1.0f

    .line 632
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 633
    .local v0, "curTime":J
    iget-wide v4, p0, Lcom/rey/material/widget/FloatingActionButton$SwitchIconAnimator;->mStartTime:J

    sub-long v4, v0, v4

    long-to-float v4, v4

    iget-object v5, p0, Lcom/rey/material/widget/FloatingActionButton$SwitchIconAnimator;->this$0:Lcom/rey/material/widget/FloatingActionButton;

    # getter for: Lcom/rey/material/widget/FloatingActionButton;->mAnimDuration:I
    invoke-static {v5}, Lcom/rey/material/widget/FloatingActionButton;->access$500(Lcom/rey/material/widget/FloatingActionButton;)I

    move-result v5

    int-to-float v5, v5

    div-float/2addr v4, v5

    invoke-static {v6, v4}, Ljava/lang/Math;->min(FF)F

    move-result v2

    .line 634
    .local v2, "progress":F
    iget-object v4, p0, Lcom/rey/material/widget/FloatingActionButton$SwitchIconAnimator;->this$0:Lcom/rey/material/widget/FloatingActionButton;

    # getter for: Lcom/rey/material/widget/FloatingActionButton;->mInterpolator:Landroid/view/animation/Interpolator;
    invoke-static {v4}, Lcom/rey/material/widget/FloatingActionButton;->access$600(Lcom/rey/material/widget/FloatingActionButton;)Landroid/view/animation/Interpolator;

    move-result-object v4

    invoke-interface {v4, v2}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v3

    .line 636
    .local v3, "value":F
    iget-object v4, p0, Lcom/rey/material/widget/FloatingActionButton$SwitchIconAnimator;->this$0:Lcom/rey/material/widget/FloatingActionButton;

    # getter for: Lcom/rey/material/widget/FloatingActionButton;->mIcon:Landroid/graphics/drawable/Drawable;
    invoke-static {v4}, Lcom/rey/material/widget/FloatingActionButton;->access$100(Lcom/rey/material/widget/FloatingActionButton;)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    mul-float v5, v7, v3

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 637
    iget-object v4, p0, Lcom/rey/material/widget/FloatingActionButton$SwitchIconAnimator;->this$0:Lcom/rey/material/widget/FloatingActionButton;

    # getter for: Lcom/rey/material/widget/FloatingActionButton;->mPrevIcon:Landroid/graphics/drawable/Drawable;
    invoke-static {v4}, Lcom/rey/material/widget/FloatingActionButton;->access$200(Lcom/rey/material/widget/FloatingActionButton;)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    sub-float v5, v6, v3

    mul-float/2addr v5, v7

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 639
    cmpl-float v4, v2, v6

    if-nez v4, :cond_49

    .line 640
    invoke-virtual {p0}, Lcom/rey/material/widget/FloatingActionButton$SwitchIconAnimator;->stopAnimation()V

    .line 642
    :cond_49
    iget-boolean v4, p0, Lcom/rey/material/widget/FloatingActionButton$SwitchIconAnimator;->mRunning:Z

    if-eqz v4, :cond_65

    .line 643
    iget-object v4, p0, Lcom/rey/material/widget/FloatingActionButton$SwitchIconAnimator;->this$0:Lcom/rey/material/widget/FloatingActionButton;

    invoke-virtual {v4}, Lcom/rey/material/widget/FloatingActionButton;->getHandler()Landroid/os/Handler;

    move-result-object v4

    if-eqz v4, :cond_6b

    .line 644
    iget-object v4, p0, Lcom/rey/material/widget/FloatingActionButton$SwitchIconAnimator;->this$0:Lcom/rey/material/widget/FloatingActionButton;

    invoke-virtual {v4}, Lcom/rey/material/widget/FloatingActionButton;->getHandler()Landroid/os/Handler;

    move-result-object v4

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v5

    const-wide/16 v7, 0x10

    add-long/2addr v5, v7

    invoke-virtual {v4, p0, v5, v6}, Landroid/os/Handler;->postAtTime(Ljava/lang/Runnable;J)Z

    .line 649
    :cond_65
    :goto_65
    iget-object v4, p0, Lcom/rey/material/widget/FloatingActionButton$SwitchIconAnimator;->this$0:Lcom/rey/material/widget/FloatingActionButton;

    invoke-virtual {v4}, Lcom/rey/material/widget/FloatingActionButton;->invalidate()V

    .line 650
    return-void

    .line 646
    :cond_6b
    invoke-virtual {p0}, Lcom/rey/material/widget/FloatingActionButton$SwitchIconAnimator;->stopAnimation()V

    goto :goto_65
.end method

.method public startAnimation(Landroid/graphics/drawable/Drawable;)Z
    .registers 10
    .param p1, "icon"    # Landroid/graphics/drawable/Drawable;

    .prologue
    const/4 v7, 0x0

    const/4 v1, 0x1

    .line 595
    iget-object v2, p0, Lcom/rey/material/widget/FloatingActionButton$SwitchIconAnimator;->this$0:Lcom/rey/material/widget/FloatingActionButton;

    # getter for: Lcom/rey/material/widget/FloatingActionButton;->mIcon:Landroid/graphics/drawable/Drawable;
    invoke-static {v2}, Lcom/rey/material/widget/FloatingActionButton;->access$100(Lcom/rey/material/widget/FloatingActionButton;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    if-ne v2, p1, :cond_c

    .line 596
    const/4 v1, 0x0

    .line 616
    :goto_b
    return v1

    .line 598
    :cond_c
    iget-object v2, p0, Lcom/rey/material/widget/FloatingActionButton$SwitchIconAnimator;->this$0:Lcom/rey/material/widget/FloatingActionButton;

    iget-object v3, p0, Lcom/rey/material/widget/FloatingActionButton$SwitchIconAnimator;->this$0:Lcom/rey/material/widget/FloatingActionButton;

    # getter for: Lcom/rey/material/widget/FloatingActionButton;->mIcon:Landroid/graphics/drawable/Drawable;
    invoke-static {v3}, Lcom/rey/material/widget/FloatingActionButton;->access$100(Lcom/rey/material/widget/FloatingActionButton;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    # setter for: Lcom/rey/material/widget/FloatingActionButton;->mPrevIcon:Landroid/graphics/drawable/Drawable;
    invoke-static {v2, v3}, Lcom/rey/material/widget/FloatingActionButton;->access$202(Lcom/rey/material/widget/FloatingActionButton;Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    .line 599
    iget-object v2, p0, Lcom/rey/material/widget/FloatingActionButton$SwitchIconAnimator;->this$0:Lcom/rey/material/widget/FloatingActionButton;

    # setter for: Lcom/rey/material/widget/FloatingActionButton;->mIcon:Landroid/graphics/drawable/Drawable;
    invoke-static {v2, p1}, Lcom/rey/material/widget/FloatingActionButton;->access$102(Lcom/rey/material/widget/FloatingActionButton;Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    .line 600
    iget-object v2, p0, Lcom/rey/material/widget/FloatingActionButton$SwitchIconAnimator;->this$0:Lcom/rey/material/widget/FloatingActionButton;

    # getter for: Lcom/rey/material/widget/FloatingActionButton;->mIconSize:I
    invoke-static {v2}, Lcom/rey/material/widget/FloatingActionButton;->access$300(Lcom/rey/material/widget/FloatingActionButton;)I

    move-result v2

    int-to-float v2, v2

    const/high16 v3, 0x40000000    # 2.0f

    div-float v0, v2, v3

    .line 601
    .local v0, "half":F
    iget-object v2, p0, Lcom/rey/material/widget/FloatingActionButton$SwitchIconAnimator;->this$0:Lcom/rey/material/widget/FloatingActionButton;

    # getter for: Lcom/rey/material/widget/FloatingActionButton;->mIcon:Landroid/graphics/drawable/Drawable;
    invoke-static {v2}, Lcom/rey/material/widget/FloatingActionButton;->access$100(Lcom/rey/material/widget/FloatingActionButton;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    iget-object v3, p0, Lcom/rey/material/widget/FloatingActionButton$SwitchIconAnimator;->this$0:Lcom/rey/material/widget/FloatingActionButton;

    # getter for: Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;
    invoke-static {v3}, Lcom/rey/material/widget/FloatingActionButton;->access$400(Lcom/rey/material/widget/FloatingActionButton;)Lcom/rey/material/drawable/OvalShadowDrawable;

    move-result-object v3

    invoke-virtual {v3}, Lcom/rey/material/drawable/OvalShadowDrawable;->getCenterX()F

    move-result v3

    sub-float/2addr v3, v0

    float-to-int v3, v3

    iget-object v4, p0, Lcom/rey/material/widget/FloatingActionButton$SwitchIconAnimator;->this$0:Lcom/rey/material/widget/FloatingActionButton;

    # getter for: Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;
    invoke-static {v4}, Lcom/rey/material/widget/FloatingActionButton;->access$400(Lcom/rey/material/widget/FloatingActionButton;)Lcom/rey/material/drawable/OvalShadowDrawable;

    move-result-object v4

    invoke-virtual {v4}, Lcom/rey/material/drawable/OvalShadowDrawable;->getCenterY()F

    move-result v4

    sub-float/2addr v4, v0

    float-to-int v4, v4

    iget-object v5, p0, Lcom/rey/material/widget/FloatingActionButton$SwitchIconAnimator;->this$0:Lcom/rey/material/widget/FloatingActionButton;

    # getter for: Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;
    invoke-static {v5}, Lcom/rey/material/widget/FloatingActionButton;->access$400(Lcom/rey/material/widget/FloatingActionButton;)Lcom/rey/material/drawable/OvalShadowDrawable;

    move-result-object v5

    invoke-virtual {v5}, Lcom/rey/material/drawable/OvalShadowDrawable;->getCenterX()F

    move-result v5

    add-float/2addr v5, v0

    float-to-int v5, v5

    iget-object v6, p0, Lcom/rey/material/widget/FloatingActionButton$SwitchIconAnimator;->this$0:Lcom/rey/material/widget/FloatingActionButton;

    # getter for: Lcom/rey/material/widget/FloatingActionButton;->mBackground:Lcom/rey/material/drawable/OvalShadowDrawable;
    invoke-static {v6}, Lcom/rey/material/widget/FloatingActionButton;->access$400(Lcom/rey/material/widget/FloatingActionButton;)Lcom/rey/material/drawable/OvalShadowDrawable;

    move-result-object v6

    invoke-virtual {v6}, Lcom/rey/material/drawable/OvalShadowDrawable;->getCenterY()F

    move-result v6

    add-float/2addr v6, v0

    float-to-int v6, v6

    invoke-virtual {v2, v3, v4, v5, v6}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 602
    iget-object v2, p0, Lcom/rey/material/widget/FloatingActionButton$SwitchIconAnimator;->this$0:Lcom/rey/material/widget/FloatingActionButton;

    # getter for: Lcom/rey/material/widget/FloatingActionButton;->mIcon:Landroid/graphics/drawable/Drawable;
    invoke-static {v2}, Lcom/rey/material/widget/FloatingActionButton;->access$100(Lcom/rey/material/widget/FloatingActionButton;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    iget-object v3, p0, Lcom/rey/material/widget/FloatingActionButton$SwitchIconAnimator;->this$0:Lcom/rey/material/widget/FloatingActionButton;

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 604
    iget-object v2, p0, Lcom/rey/material/widget/FloatingActionButton$SwitchIconAnimator;->this$0:Lcom/rey/material/widget/FloatingActionButton;

    invoke-virtual {v2}, Lcom/rey/material/widget/FloatingActionButton;->getHandler()Landroid/os/Handler;

    move-result-object v2

    if-eqz v2, :cond_8f

    .line 605
    invoke-virtual {p0}, Lcom/rey/material/widget/FloatingActionButton$SwitchIconAnimator;->resetAnimation()V

    .line 606
    iput-boolean v1, p0, Lcom/rey/material/widget/FloatingActionButton$SwitchIconAnimator;->mRunning:Z

    .line 607
    iget-object v2, p0, Lcom/rey/material/widget/FloatingActionButton$SwitchIconAnimator;->this$0:Lcom/rey/material/widget/FloatingActionButton;

    invoke-virtual {v2}, Lcom/rey/material/widget/FloatingActionButton;->getHandler()Landroid/os/Handler;

    move-result-object v2

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    const-wide/16 v5, 0x10

    add-long/2addr v3, v5

    invoke-virtual {v2, p0, v3, v4}, Landroid/os/Handler;->postAtTime(Ljava/lang/Runnable;J)Z

    .line 615
    :goto_88
    iget-object v2, p0, Lcom/rey/material/widget/FloatingActionButton$SwitchIconAnimator;->this$0:Lcom/rey/material/widget/FloatingActionButton;

    invoke-virtual {v2}, Lcom/rey/material/widget/FloatingActionButton;->invalidate()V

    goto/16 :goto_b

    .line 610
    :cond_8f
    iget-object v2, p0, Lcom/rey/material/widget/FloatingActionButton$SwitchIconAnimator;->this$0:Lcom/rey/material/widget/FloatingActionButton;

    # getter for: Lcom/rey/material/widget/FloatingActionButton;->mPrevIcon:Landroid/graphics/drawable/Drawable;
    invoke-static {v2}, Lcom/rey/material/widget/FloatingActionButton;->access$200(Lcom/rey/material/widget/FloatingActionButton;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v2, v7}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 611
    iget-object v2, p0, Lcom/rey/material/widget/FloatingActionButton$SwitchIconAnimator;->this$0:Lcom/rey/material/widget/FloatingActionButton;

    iget-object v3, p0, Lcom/rey/material/widget/FloatingActionButton$SwitchIconAnimator;->this$0:Lcom/rey/material/widget/FloatingActionButton;

    # getter for: Lcom/rey/material/widget/FloatingActionButton;->mPrevIcon:Landroid/graphics/drawable/Drawable;
    invoke-static {v3}, Lcom/rey/material/widget/FloatingActionButton;->access$200(Lcom/rey/material/widget/FloatingActionButton;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/rey/material/widget/FloatingActionButton;->unscheduleDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 612
    iget-object v2, p0, Lcom/rey/material/widget/FloatingActionButton$SwitchIconAnimator;->this$0:Lcom/rey/material/widget/FloatingActionButton;

    # setter for: Lcom/rey/material/widget/FloatingActionButton;->mPrevIcon:Landroid/graphics/drawable/Drawable;
    invoke-static {v2, v7}, Lcom/rey/material/widget/FloatingActionButton;->access$202(Lcom/rey/material/widget/FloatingActionButton;Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    goto :goto_88
.end method

.method public stopAnimation()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 620
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/rey/material/widget/FloatingActionButton$SwitchIconAnimator;->mRunning:Z

    .line 621
    iget-object v0, p0, Lcom/rey/material/widget/FloatingActionButton$SwitchIconAnimator;->this$0:Lcom/rey/material/widget/FloatingActionButton;

    # getter for: Lcom/rey/material/widget/FloatingActionButton;->mPrevIcon:Landroid/graphics/drawable/Drawable;
    invoke-static {v0}, Lcom/rey/material/widget/FloatingActionButton;->access$200(Lcom/rey/material/widget/FloatingActionButton;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 622
    iget-object v0, p0, Lcom/rey/material/widget/FloatingActionButton$SwitchIconAnimator;->this$0:Lcom/rey/material/widget/FloatingActionButton;

    iget-object v1, p0, Lcom/rey/material/widget/FloatingActionButton$SwitchIconAnimator;->this$0:Lcom/rey/material/widget/FloatingActionButton;

    # getter for: Lcom/rey/material/widget/FloatingActionButton;->mPrevIcon:Landroid/graphics/drawable/Drawable;
    invoke-static {v1}, Lcom/rey/material/widget/FloatingActionButton;->access$200(Lcom/rey/material/widget/FloatingActionButton;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/FloatingActionButton;->unscheduleDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 623
    iget-object v0, p0, Lcom/rey/material/widget/FloatingActionButton$SwitchIconAnimator;->this$0:Lcom/rey/material/widget/FloatingActionButton;

    # setter for: Lcom/rey/material/widget/FloatingActionButton;->mPrevIcon:Landroid/graphics/drawable/Drawable;
    invoke-static {v0, v2}, Lcom/rey/material/widget/FloatingActionButton;->access$202(Lcom/rey/material/widget/FloatingActionButton;Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    .line 624
    iget-object v0, p0, Lcom/rey/material/widget/FloatingActionButton$SwitchIconAnimator;->this$0:Lcom/rey/material/widget/FloatingActionButton;

    # getter for: Lcom/rey/material/widget/FloatingActionButton;->mIcon:Landroid/graphics/drawable/Drawable;
    invoke-static {v0}, Lcom/rey/material/widget/FloatingActionButton;->access$100(Lcom/rey/material/widget/FloatingActionButton;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/16 v1, 0xff

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 625
    iget-object v0, p0, Lcom/rey/material/widget/FloatingActionButton$SwitchIconAnimator;->this$0:Lcom/rey/material/widget/FloatingActionButton;

    invoke-virtual {v0}, Lcom/rey/material/widget/FloatingActionButton;->getHandler()Landroid/os/Handler;

    move-result-object v0

    if-eqz v0, :cond_39

    .line 626
    iget-object v0, p0, Lcom/rey/material/widget/FloatingActionButton$SwitchIconAnimator;->this$0:Lcom/rey/material/widget/FloatingActionButton;

    invoke-virtual {v0}, Lcom/rey/material/widget/FloatingActionButton;->getHandler()Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 627
    :cond_39
    iget-object v0, p0, Lcom/rey/material/widget/FloatingActionButton$SwitchIconAnimator;->this$0:Lcom/rey/material/widget/FloatingActionButton;

    invoke-virtual {v0}, Lcom/rey/material/widget/FloatingActionButton;->invalidate()V

    .line 628
    return-void
.end method
