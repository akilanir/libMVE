.class Lcom/rey/material/widget/Slider$ThumbRadiusAnimator;
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
    name = "ThumbRadiusAnimator"
.end annotation


# instance fields
.field mRadius:I

.field mRunning:Z

.field mStartRadius:F

.field mStartTime:J

.field final synthetic this$0:Lcom/rey/material/widget/Slider;


# direct methods
.method constructor <init>(Lcom/rey/material/widget/Slider;)V
    .registers 3

    .prologue
    .line 954
    iput-object p1, p0, Lcom/rey/material/widget/Slider$ThumbRadiusAnimator;->this$0:Lcom/rey/material/widget/Slider;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 956
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/rey/material/widget/Slider$ThumbRadiusAnimator;->mRunning:Z

    return-void
.end method


# virtual methods
.method public resetAnimation()V
    .registers 3

    .prologue
    .line 962
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/rey/material/widget/Slider$ThumbRadiusAnimator;->mStartTime:J

    .line 963
    iget-object v0, p0, Lcom/rey/material/widget/Slider$ThumbRadiusAnimator;->this$0:Lcom/rey/material/widget/Slider;

    # getter for: Lcom/rey/material/widget/Slider;->mThumbCurrentRadius:F
    invoke-static {v0}, Lcom/rey/material/widget/Slider;->access$000(Lcom/rey/material/widget/Slider;)F

    move-result v0

    iput v0, p0, Lcom/rey/material/widget/Slider$ThumbRadiusAnimator;->mStartRadius:F

    .line 964
    return-void
.end method

.method public run()V
    .registers 10

    .prologue
    const/high16 v7, 0x3f800000    # 1.0f

    .line 996
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 997
    .local v0, "curTime":J
    iget-wide v4, p0, Lcom/rey/material/widget/Slider$ThumbRadiusAnimator;->mStartTime:J

    sub-long v4, v0, v4

    long-to-float v4, v4

    iget-object v5, p0, Lcom/rey/material/widget/Slider$ThumbRadiusAnimator;->this$0:Lcom/rey/material/widget/Slider;

    # getter for: Lcom/rey/material/widget/Slider;->mTransformAnimationDuration:I
    invoke-static {v5}, Lcom/rey/material/widget/Slider;->access$100(Lcom/rey/material/widget/Slider;)I

    move-result v5

    int-to-float v5, v5

    div-float/2addr v4, v5

    invoke-static {v7, v4}, Ljava/lang/Math;->min(FF)F

    move-result v2

    .line 998
    .local v2, "progress":F
    iget-object v4, p0, Lcom/rey/material/widget/Slider$ThumbRadiusAnimator;->this$0:Lcom/rey/material/widget/Slider;

    # getter for: Lcom/rey/material/widget/Slider;->mInterpolator:Landroid/view/animation/Interpolator;
    invoke-static {v4}, Lcom/rey/material/widget/Slider;->access$200(Lcom/rey/material/widget/Slider;)Landroid/view/animation/Interpolator;

    move-result-object v4

    invoke-interface {v4, v2}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v3

    .line 1000
    .local v3, "value":F
    iget-object v4, p0, Lcom/rey/material/widget/Slider$ThumbRadiusAnimator;->this$0:Lcom/rey/material/widget/Slider;

    iget v5, p0, Lcom/rey/material/widget/Slider$ThumbRadiusAnimator;->mRadius:I

    int-to-float v5, v5

    iget v6, p0, Lcom/rey/material/widget/Slider$ThumbRadiusAnimator;->mStartRadius:F

    sub-float/2addr v5, v6

    mul-float/2addr v5, v3

    iget v6, p0, Lcom/rey/material/widget/Slider$ThumbRadiusAnimator;->mStartRadius:F

    add-float/2addr v5, v6

    # setter for: Lcom/rey/material/widget/Slider;->mThumbCurrentRadius:F
    invoke-static {v4, v5}, Lcom/rey/material/widget/Slider;->access$002(Lcom/rey/material/widget/Slider;F)F

    .line 1002
    cmpl-float v4, v2, v7

    if-nez v4, :cond_37

    .line 1003
    invoke-virtual {p0}, Lcom/rey/material/widget/Slider$ThumbRadiusAnimator;->stopAnimation()V

    .line 1005
    :cond_37
    iget-boolean v4, p0, Lcom/rey/material/widget/Slider$ThumbRadiusAnimator;->mRunning:Z

    if-eqz v4, :cond_53

    .line 1006
    iget-object v4, p0, Lcom/rey/material/widget/Slider$ThumbRadiusAnimator;->this$0:Lcom/rey/material/widget/Slider;

    invoke-virtual {v4}, Lcom/rey/material/widget/Slider;->getHandler()Landroid/os/Handler;

    move-result-object v4

    if-eqz v4, :cond_59

    .line 1007
    iget-object v4, p0, Lcom/rey/material/widget/Slider$ThumbRadiusAnimator;->this$0:Lcom/rey/material/widget/Slider;

    invoke-virtual {v4}, Lcom/rey/material/widget/Slider;->getHandler()Landroid/os/Handler;

    move-result-object v4

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v5

    const-wide/16 v7, 0x10

    add-long/2addr v5, v7

    invoke-virtual {v4, p0, v5, v6}, Landroid/os/Handler;->postAtTime(Ljava/lang/Runnable;J)Z

    .line 1012
    :cond_53
    :goto_53
    iget-object v4, p0, Lcom/rey/material/widget/Slider$ThumbRadiusAnimator;->this$0:Lcom/rey/material/widget/Slider;

    invoke-virtual {v4}, Lcom/rey/material/widget/Slider;->invalidate()V

    .line 1013
    return-void

    .line 1009
    :cond_59
    invoke-virtual {p0}, Lcom/rey/material/widget/Slider$ThumbRadiusAnimator;->stopAnimation()V

    goto :goto_53
.end method

.method public startAnimation(I)Z
    .registers 8
    .param p1, "radius"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 967
    iget-object v2, p0, Lcom/rey/material/widget/Slider$ThumbRadiusAnimator;->this$0:Lcom/rey/material/widget/Slider;

    # getter for: Lcom/rey/material/widget/Slider;->mThumbCurrentRadius:F
    invoke-static {v2}, Lcom/rey/material/widget/Slider;->access$000(Lcom/rey/material/widget/Slider;)F

    move-result v2

    int-to-float v3, p1

    cmpl-float v2, v2, v3

    if-nez v2, :cond_e

    .line 982
    :goto_d
    return v0

    .line 970
    :cond_e
    iput p1, p0, Lcom/rey/material/widget/Slider$ThumbRadiusAnimator;->mRadius:I

    .line 972
    iget-object v2, p0, Lcom/rey/material/widget/Slider$ThumbRadiusAnimator;->this$0:Lcom/rey/material/widget/Slider;

    invoke-virtual {v2}, Lcom/rey/material/widget/Slider;->getHandler()Landroid/os/Handler;

    move-result-object v2

    if-eqz v2, :cond_34

    .line 973
    invoke-virtual {p0}, Lcom/rey/material/widget/Slider$ThumbRadiusAnimator;->resetAnimation()V

    .line 974
    iput-boolean v1, p0, Lcom/rey/material/widget/Slider$ThumbRadiusAnimator;->mRunning:Z

    .line 975
    iget-object v0, p0, Lcom/rey/material/widget/Slider$ThumbRadiusAnimator;->this$0:Lcom/rey/material/widget/Slider;

    invoke-virtual {v0}, Lcom/rey/material/widget/Slider;->getHandler()Landroid/os/Handler;

    move-result-object v0

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    const-wide/16 v4, 0x10

    add-long/2addr v2, v4

    invoke-virtual {v0, p0, v2, v3}, Landroid/os/Handler;->postAtTime(Ljava/lang/Runnable;J)Z

    .line 976
    iget-object v0, p0, Lcom/rey/material/widget/Slider$ThumbRadiusAnimator;->this$0:Lcom/rey/material/widget/Slider;

    invoke-virtual {v0}, Lcom/rey/material/widget/Slider;->invalidate()V

    move v0, v1

    .line 977
    goto :goto_d

    .line 980
    :cond_34
    iget-object v1, p0, Lcom/rey/material/widget/Slider$ThumbRadiusAnimator;->this$0:Lcom/rey/material/widget/Slider;

    iget v2, p0, Lcom/rey/material/widget/Slider$ThumbRadiusAnimator;->mRadius:I

    int-to-float v2, v2

    # setter for: Lcom/rey/material/widget/Slider;->mThumbCurrentRadius:F
    invoke-static {v1, v2}, Lcom/rey/material/widget/Slider;->access$002(Lcom/rey/material/widget/Slider;F)F

    .line 981
    iget-object v1, p0, Lcom/rey/material/widget/Slider$ThumbRadiusAnimator;->this$0:Lcom/rey/material/widget/Slider;

    invoke-virtual {v1}, Lcom/rey/material/widget/Slider;->invalidate()V

    goto :goto_d
.end method

.method public stopAnimation()V
    .registers 3

    .prologue
    .line 987
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/rey/material/widget/Slider$ThumbRadiusAnimator;->mRunning:Z

    .line 988
    iget-object v0, p0, Lcom/rey/material/widget/Slider$ThumbRadiusAnimator;->this$0:Lcom/rey/material/widget/Slider;

    iget v1, p0, Lcom/rey/material/widget/Slider$ThumbRadiusAnimator;->mRadius:I

    int-to-float v1, v1

    # setter for: Lcom/rey/material/widget/Slider;->mThumbCurrentRadius:F
    invoke-static {v0, v1}, Lcom/rey/material/widget/Slider;->access$002(Lcom/rey/material/widget/Slider;F)F

    .line 989
    iget-object v0, p0, Lcom/rey/material/widget/Slider$ThumbRadiusAnimator;->this$0:Lcom/rey/material/widget/Slider;

    invoke-virtual {v0}, Lcom/rey/material/widget/Slider;->getHandler()Landroid/os/Handler;

    move-result-object v0

    if-eqz v0, :cond_1c

    .line 990
    iget-object v0, p0, Lcom/rey/material/widget/Slider$ThumbRadiusAnimator;->this$0:Lcom/rey/material/widget/Slider;

    invoke-virtual {v0}, Lcom/rey/material/widget/Slider;->getHandler()Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 991
    :cond_1c
    iget-object v0, p0, Lcom/rey/material/widget/Slider$ThumbRadiusAnimator;->this$0:Lcom/rey/material/widget/Slider;

    invoke-virtual {v0}, Lcom/rey/material/widget/Slider;->invalidate()V

    .line 992
    return-void
.end method
