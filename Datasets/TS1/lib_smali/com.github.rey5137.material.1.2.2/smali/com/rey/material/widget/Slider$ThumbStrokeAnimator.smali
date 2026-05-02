.class Lcom/rey/material/widget/Slider$ThumbStrokeAnimator;
.super Ljava/lang/Object;
.source "Slider.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/widget/Slider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ThumbStrokeAnimator"
.end annotation


# instance fields
.field mFillPercent:I

.field mRunning:Z

.field mStartFillPercent:F

.field mStartTime:J

.field final synthetic this$0:Lcom/rey/material/widget/Slider;


# direct methods
.method constructor <init>(Lcom/rey/material/widget/Slider;)V
    .registers 3

    .prologue
    .line 1017
    iput-object p1, p0, Lcom/rey/material/widget/Slider$ThumbStrokeAnimator;->this$0:Lcom/rey/material/widget/Slider;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1019
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/rey/material/widget/Slider$ThumbStrokeAnimator;->mRunning:Z

    return-void
.end method


# virtual methods
.method public resetAnimation()V
    .registers 3

    .prologue
    .line 1025
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/rey/material/widget/Slider$ThumbStrokeAnimator;->mStartTime:J

    .line 1026
    iget-object v0, p0, Lcom/rey/material/widget/Slider$ThumbStrokeAnimator;->this$0:Lcom/rey/material/widget/Slider;

    # getter for: Lcom/rey/material/widget/Slider;->mThumbFillPercent:F
    invoke-static {v0}, Lcom/rey/material/widget/Slider;->access$300(Lcom/rey/material/widget/Slider;)F

    move-result v0

    iput v0, p0, Lcom/rey/material/widget/Slider$ThumbStrokeAnimator;->mStartFillPercent:F

    .line 1027
    return-void
.end method

.method public run()V
    .registers 10

    .prologue
    const/high16 v5, 0x3f800000    # 1.0f

    .line 1059
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 1060
    .local v0, "curTime":J
    iget-wide v6, p0, Lcom/rey/material/widget/Slider$ThumbStrokeAnimator;->mStartTime:J

    sub-long v6, v0, v6

    long-to-float v4, v6

    iget-object v6, p0, Lcom/rey/material/widget/Slider$ThumbStrokeAnimator;->this$0:Lcom/rey/material/widget/Slider;

    # getter for: Lcom/rey/material/widget/Slider;->mTransformAnimationDuration:I
    invoke-static {v6}, Lcom/rey/material/widget/Slider;->access$100(Lcom/rey/material/widget/Slider;)I

    move-result v6

    int-to-float v6, v6

    div-float/2addr v4, v6

    invoke-static {v5, v4}, Ljava/lang/Math;->min(FF)F

    move-result v2

    .line 1061
    .local v2, "progress":F
    iget-object v4, p0, Lcom/rey/material/widget/Slider$ThumbStrokeAnimator;->this$0:Lcom/rey/material/widget/Slider;

    # getter for: Lcom/rey/material/widget/Slider;->mInterpolator:Landroid/view/animation/Interpolator;
    invoke-static {v4}, Lcom/rey/material/widget/Slider;->access$200(Lcom/rey/material/widget/Slider;)Landroid/view/animation/Interpolator;

    move-result-object v4

    invoke-interface {v4, v2}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v3

    .line 1063
    .local v3, "value":F
    iget-object v6, p0, Lcom/rey/material/widget/Slider$ThumbStrokeAnimator;->this$0:Lcom/rey/material/widget/Slider;

    iget-object v4, p0, Lcom/rey/material/widget/Slider$ThumbStrokeAnimator;->this$0:Lcom/rey/material/widget/Slider;

    # getter for: Lcom/rey/material/widget/Slider;->mAlwaysFillThumb:Z
    invoke-static {v4}, Lcom/rey/material/widget/Slider;->access$400(Lcom/rey/material/widget/Slider;)Z

    move-result v4

    if-eqz v4, :cond_58

    move v4, v5

    :goto_2c
    # setter for: Lcom/rey/material/widget/Slider;->mThumbFillPercent:F
    invoke-static {v6, v4}, Lcom/rey/material/widget/Slider;->access$302(Lcom/rey/material/widget/Slider;F)F

    .line 1065
    cmpl-float v4, v2, v5

    if-nez v4, :cond_36

    .line 1066
    invoke-virtual {p0}, Lcom/rey/material/widget/Slider$ThumbStrokeAnimator;->stopAnimation()V

    .line 1068
    :cond_36
    iget-boolean v4, p0, Lcom/rey/material/widget/Slider$ThumbStrokeAnimator;->mRunning:Z

    if-eqz v4, :cond_52

    .line 1069
    iget-object v4, p0, Lcom/rey/material/widget/Slider$ThumbStrokeAnimator;->this$0:Lcom/rey/material/widget/Slider;

    invoke-virtual {v4}, Lcom/rey/material/widget/Slider;->getHandler()Landroid/os/Handler;

    move-result-object v4

    if-eqz v4, :cond_63

    .line 1070
    iget-object v4, p0, Lcom/rey/material/widget/Slider$ThumbStrokeAnimator;->this$0:Lcom/rey/material/widget/Slider;

    invoke-virtual {v4}, Lcom/rey/material/widget/Slider;->getHandler()Landroid/os/Handler;

    move-result-object v4

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v5

    const-wide/16 v7, 0x10

    add-long/2addr v5, v7

    invoke-virtual {v4, p0, v5, v6}, Landroid/os/Handler;->postAtTime(Ljava/lang/Runnable;J)Z

    .line 1075
    :cond_52
    :goto_52
    iget-object v4, p0, Lcom/rey/material/widget/Slider$ThumbStrokeAnimator;->this$0:Lcom/rey/material/widget/Slider;

    invoke-virtual {v4}, Lcom/rey/material/widget/Slider;->invalidate()V

    .line 1076
    return-void

    .line 1063
    :cond_58
    iget v4, p0, Lcom/rey/material/widget/Slider$ThumbStrokeAnimator;->mFillPercent:I

    int-to-float v4, v4

    iget v7, p0, Lcom/rey/material/widget/Slider$ThumbStrokeAnimator;->mStartFillPercent:F

    sub-float/2addr v4, v7

    mul-float/2addr v4, v3

    iget v7, p0, Lcom/rey/material/widget/Slider$ThumbStrokeAnimator;->mStartFillPercent:F

    add-float/2addr v4, v7

    goto :goto_2c

    .line 1072
    :cond_63
    invoke-virtual {p0}, Lcom/rey/material/widget/Slider$ThumbStrokeAnimator;->stopAnimation()V

    goto :goto_52
.end method

.method public startAnimation(I)Z
    .registers 8
    .param p1, "fillPercent"    # I

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 1030
    iget-object v2, p0, Lcom/rey/material/widget/Slider$ThumbStrokeAnimator;->this$0:Lcom/rey/material/widget/Slider;

    # getter for: Lcom/rey/material/widget/Slider;->mThumbFillPercent:F
    invoke-static {v2}, Lcom/rey/material/widget/Slider;->access$300(Lcom/rey/material/widget/Slider;)F

    move-result v2

    int-to-float v3, p1

    cmpl-float v2, v2, v3

    if-nez v2, :cond_f

    move v0, v1

    .line 1045
    :goto_e
    return v0

    .line 1033
    :cond_f
    iput p1, p0, Lcom/rey/material/widget/Slider$ThumbStrokeAnimator;->mFillPercent:I

    .line 1035
    iget-object v2, p0, Lcom/rey/material/widget/Slider$ThumbStrokeAnimator;->this$0:Lcom/rey/material/widget/Slider;

    invoke-virtual {v2}, Lcom/rey/material/widget/Slider;->getHandler()Landroid/os/Handler;

    move-result-object v2

    if-eqz v2, :cond_34

    .line 1036
    invoke-virtual {p0}, Lcom/rey/material/widget/Slider$ThumbStrokeAnimator;->resetAnimation()V

    .line 1037
    iput-boolean v0, p0, Lcom/rey/material/widget/Slider$ThumbStrokeAnimator;->mRunning:Z

    .line 1038
    iget-object v1, p0, Lcom/rey/material/widget/Slider$ThumbStrokeAnimator;->this$0:Lcom/rey/material/widget/Slider;

    invoke-virtual {v1}, Lcom/rey/material/widget/Slider;->getHandler()Landroid/os/Handler;

    move-result-object v1

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    const-wide/16 v4, 0x10

    add-long/2addr v2, v4

    invoke-virtual {v1, p0, v2, v3}, Landroid/os/Handler;->postAtTime(Ljava/lang/Runnable;J)Z

    .line 1039
    iget-object v1, p0, Lcom/rey/material/widget/Slider$ThumbStrokeAnimator;->this$0:Lcom/rey/material/widget/Slider;

    invoke-virtual {v1}, Lcom/rey/material/widget/Slider;->invalidate()V

    goto :goto_e

    .line 1043
    :cond_34
    iget-object v2, p0, Lcom/rey/material/widget/Slider$ThumbStrokeAnimator;->this$0:Lcom/rey/material/widget/Slider;

    iget-object v0, p0, Lcom/rey/material/widget/Slider$ThumbStrokeAnimator;->this$0:Lcom/rey/material/widget/Slider;

    # getter for: Lcom/rey/material/widget/Slider;->mAlwaysFillThumb:Z
    invoke-static {v0}, Lcom/rey/material/widget/Slider;->access$400(Lcom/rey/material/widget/Slider;)Z

    move-result v0

    if-eqz v0, :cond_4a

    const/high16 v0, 0x3f800000    # 1.0f

    :goto_40
    # setter for: Lcom/rey/material/widget/Slider;->mThumbFillPercent:F
    invoke-static {v2, v0}, Lcom/rey/material/widget/Slider;->access$302(Lcom/rey/material/widget/Slider;F)F

    .line 1044
    iget-object v0, p0, Lcom/rey/material/widget/Slider$ThumbStrokeAnimator;->this$0:Lcom/rey/material/widget/Slider;

    invoke-virtual {v0}, Lcom/rey/material/widget/Slider;->invalidate()V

    move v0, v1

    .line 1045
    goto :goto_e

    .line 1043
    :cond_4a
    iget v0, p0, Lcom/rey/material/widget/Slider$ThumbStrokeAnimator;->mFillPercent:I

    int-to-float v0, v0

    goto :goto_40
.end method

.method public stopAnimation()V
    .registers 3

    .prologue
    .line 1050
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/rey/material/widget/Slider$ThumbStrokeAnimator;->mRunning:Z

    .line 1051
    iget-object v1, p0, Lcom/rey/material/widget/Slider$ThumbStrokeAnimator;->this$0:Lcom/rey/material/widget/Slider;

    iget-object v0, p0, Lcom/rey/material/widget/Slider$ThumbStrokeAnimator;->this$0:Lcom/rey/material/widget/Slider;

    # getter for: Lcom/rey/material/widget/Slider;->mAlwaysFillThumb:Z
    invoke-static {v0}, Lcom/rey/material/widget/Slider;->access$400(Lcom/rey/material/widget/Slider;)Z

    move-result v0

    if-eqz v0, :cond_29

    const/high16 v0, 0x3f800000    # 1.0f

    :goto_f
    # setter for: Lcom/rey/material/widget/Slider;->mThumbFillPercent:F
    invoke-static {v1, v0}, Lcom/rey/material/widget/Slider;->access$302(Lcom/rey/material/widget/Slider;F)F

    .line 1052
    iget-object v0, p0, Lcom/rey/material/widget/Slider$ThumbStrokeAnimator;->this$0:Lcom/rey/material/widget/Slider;

    invoke-virtual {v0}, Lcom/rey/material/widget/Slider;->getHandler()Landroid/os/Handler;

    move-result-object v0

    if-eqz v0, :cond_23

    .line 1053
    iget-object v0, p0, Lcom/rey/material/widget/Slider$ThumbStrokeAnimator;->this$0:Lcom/rey/material/widget/Slider;

    invoke-virtual {v0}, Lcom/rey/material/widget/Slider;->getHandler()Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1054
    :cond_23
    iget-object v0, p0, Lcom/rey/material/widget/Slider$ThumbStrokeAnimator;->this$0:Lcom/rey/material/widget/Slider;

    invoke-virtual {v0}, Lcom/rey/material/widget/Slider;->invalidate()V

    .line 1055
    return-void

    .line 1051
    :cond_29
    iget v0, p0, Lcom/rey/material/widget/Slider$ThumbStrokeAnimator;->mFillPercent:I

    int-to-float v0, v0

    goto :goto_f
.end method
