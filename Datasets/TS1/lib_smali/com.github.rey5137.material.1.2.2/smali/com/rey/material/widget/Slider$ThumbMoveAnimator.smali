.class Lcom/rey/material/widget/Slider$ThumbMoveAnimator;
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
    name = "ThumbMoveAnimator"
.end annotation


# instance fields
.field mDuration:I

.field mFillPercent:F

.field mPosition:F

.field mRunning:Z

.field mStartFillPercent:F

.field mStartPosition:F

.field mStartRadius:F

.field mStartTime:J

.field final synthetic this$0:Lcom/rey/material/widget/Slider;


# direct methods
.method constructor <init>(Lcom/rey/material/widget/Slider;)V
    .registers 3

    .prologue
    .line 1080
    iput-object p1, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->this$0:Lcom/rey/material/widget/Slider;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1082
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->mRunning:Z

    return-void
.end method


# virtual methods
.method public getPosition()F
    .registers 2

    .prologue
    .line 1096
    iget v0, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->mPosition:F

    return v0
.end method

.method public isRunning()Z
    .registers 2

    .prologue
    .line 1092
    iget-boolean v0, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->mRunning:Z

    return v0
.end method

.method public resetAnimation()V
    .registers 4

    .prologue
    const/4 v0, 0x0

    .line 1100
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    iput-wide v1, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->mStartTime:J

    .line 1101
    iget-object v1, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->this$0:Lcom/rey/material/widget/Slider;

    # getter for: Lcom/rey/material/widget/Slider;->mThumbPosition:F
    invoke-static {v1}, Lcom/rey/material/widget/Slider;->access$500(Lcom/rey/material/widget/Slider;)F

    move-result v1

    iput v1, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->mStartPosition:F

    .line 1102
    iget-object v1, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->this$0:Lcom/rey/material/widget/Slider;

    # getter for: Lcom/rey/material/widget/Slider;->mThumbFillPercent:F
    invoke-static {v1}, Lcom/rey/material/widget/Slider;->access$300(Lcom/rey/material/widget/Slider;)F

    move-result v1

    iput v1, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->mStartFillPercent:F

    .line 1103
    iget-object v1, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->this$0:Lcom/rey/material/widget/Slider;

    # getter for: Lcom/rey/material/widget/Slider;->mThumbCurrentRadius:F
    invoke-static {v1}, Lcom/rey/material/widget/Slider;->access$000(Lcom/rey/material/widget/Slider;)F

    move-result v1

    iput v1, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->mStartRadius:F

    .line 1104
    iget v1, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->mPosition:F

    cmpl-float v1, v1, v0

    if-nez v1, :cond_49

    :goto_25
    iput v0, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->mFillPercent:F

    .line 1105
    iget-object v0, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->this$0:Lcom/rey/material/widget/Slider;

    # getter for: Lcom/rey/material/widget/Slider;->mDiscreteMode:Z
    invoke-static {v0}, Lcom/rey/material/widget/Slider;->access$600(Lcom/rey/material/widget/Slider;)Z

    move-result v0

    if-eqz v0, :cond_4c

    iget-object v0, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->this$0:Lcom/rey/material/widget/Slider;

    # getter for: Lcom/rey/material/widget/Slider;->mIsDragging:Z
    invoke-static {v0}, Lcom/rey/material/widget/Slider;->access$700(Lcom/rey/material/widget/Slider;)Z

    move-result v0

    if-nez v0, :cond_4c

    iget-object v0, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->this$0:Lcom/rey/material/widget/Slider;

    # getter for: Lcom/rey/material/widget/Slider;->mTransformAnimationDuration:I
    invoke-static {v0}, Lcom/rey/material/widget/Slider;->access$100(Lcom/rey/material/widget/Slider;)I

    move-result v0

    mul-int/lit8 v0, v0, 0x2

    iget-object v1, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->this$0:Lcom/rey/material/widget/Slider;

    # getter for: Lcom/rey/material/widget/Slider;->mTravelAnimationDuration:I
    invoke-static {v1}, Lcom/rey/material/widget/Slider;->access$800(Lcom/rey/material/widget/Slider;)I

    move-result v1

    add-int/2addr v0, v1

    :goto_46
    iput v0, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->mDuration:I

    .line 1106
    return-void

    .line 1104
    :cond_49
    const/high16 v0, 0x3f800000    # 1.0f

    goto :goto_25

    .line 1105
    :cond_4c
    iget-object v0, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->this$0:Lcom/rey/material/widget/Slider;

    # getter for: Lcom/rey/material/widget/Slider;->mTravelAnimationDuration:I
    invoke-static {v0}, Lcom/rey/material/widget/Slider;->access$800(Lcom/rey/material/widget/Slider;)I

    move-result v0

    goto :goto_46
.end method

.method public run()V
    .registers 14

    .prologue
    const/high16 v12, 0x40a00000    # 5.0f

    const/high16 v7, 0x3f800000    # 1.0f

    .line 1140
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 1141
    .local v0, "curTime":J
    iget-wide v8, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->mStartTime:J

    sub-long v8, v0, v8

    long-to-float v6, v8

    iget v8, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->mDuration:I

    int-to-float v8, v8

    div-float/2addr v6, v8

    invoke-static {v7, v6}, Ljava/lang/Math;->min(FF)F

    move-result v4

    .line 1142
    .local v4, "progress":F
    iget-object v6, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->this$0:Lcom/rey/material/widget/Slider;

    # getter for: Lcom/rey/material/widget/Slider;->mInterpolator:Landroid/view/animation/Interpolator;
    invoke-static {v6}, Lcom/rey/material/widget/Slider;->access$200(Lcom/rey/material/widget/Slider;)Landroid/view/animation/Interpolator;

    move-result-object v6

    invoke-interface {v6, v4}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v5

    .line 1144
    .local v5, "value":F
    iget-object v6, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->this$0:Lcom/rey/material/widget/Slider;

    # getter for: Lcom/rey/material/widget/Slider;->mDiscreteMode:Z
    invoke-static {v6}, Lcom/rey/material/widget/Slider;->access$600(Lcom/rey/material/widget/Slider;)Z

    move-result v6

    if-eqz v6, :cond_f7

    .line 1145
    iget-object v6, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->this$0:Lcom/rey/material/widget/Slider;

    # getter for: Lcom/rey/material/widget/Slider;->mIsDragging:Z
    invoke-static {v6}, Lcom/rey/material/widget/Slider;->access$700(Lcom/rey/material/widget/Slider;)Z

    move-result v6

    if-eqz v6, :cond_7e

    .line 1146
    iget-object v6, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->this$0:Lcom/rey/material/widget/Slider;

    iget v8, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->mPosition:F

    iget v9, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->mStartPosition:F

    sub-float/2addr v8, v9

    mul-float/2addr v8, v5

    iget v9, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->mStartPosition:F

    add-float/2addr v8, v9

    # setter for: Lcom/rey/material/widget/Slider;->mThumbPosition:F
    invoke-static {v6, v8}, Lcom/rey/material/widget/Slider;->access$502(Lcom/rey/material/widget/Slider;F)F

    .line 1147
    iget-object v8, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->this$0:Lcom/rey/material/widget/Slider;

    iget-object v6, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->this$0:Lcom/rey/material/widget/Slider;

    # getter for: Lcom/rey/material/widget/Slider;->mAlwaysFillThumb:Z
    invoke-static {v6}, Lcom/rey/material/widget/Slider;->access$400(Lcom/rey/material/widget/Slider;)Z

    move-result v6

    if-eqz v6, :cond_74

    move v6, v7

    :goto_48
    # setter for: Lcom/rey/material/widget/Slider;->mThumbFillPercent:F
    invoke-static {v8, v6}, Lcom/rey/material/widget/Slider;->access$302(Lcom/rey/material/widget/Slider;F)F

    .line 1174
    :cond_4b
    :goto_4b
    cmpl-float v6, v4, v7

    if-nez v6, :cond_52

    .line 1175
    invoke-virtual {p0}, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->stopAnimation()V

    .line 1177
    :cond_52
    iget-boolean v6, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->mRunning:Z

    if-eqz v6, :cond_6e

    .line 1178
    iget-object v6, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->this$0:Lcom/rey/material/widget/Slider;

    invoke-virtual {v6}, Lcom/rey/material/widget/Slider;->getHandler()Landroid/os/Handler;

    move-result-object v6

    if-eqz v6, :cond_16e

    .line 1179
    iget-object v6, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->this$0:Lcom/rey/material/widget/Slider;

    invoke-virtual {v6}, Lcom/rey/material/widget/Slider;->getHandler()Landroid/os/Handler;

    move-result-object v6

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v7

    const-wide/16 v9, 0x10

    add-long/2addr v7, v9

    invoke-virtual {v6, p0, v7, v8}, Landroid/os/Handler;->postAtTime(Ljava/lang/Runnable;J)Z

    .line 1184
    :cond_6e
    :goto_6e
    iget-object v6, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->this$0:Lcom/rey/material/widget/Slider;

    invoke-virtual {v6}, Lcom/rey/material/widget/Slider;->invalidate()V

    .line 1185
    return-void

    .line 1147
    :cond_74
    iget v6, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->mFillPercent:F

    iget v9, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->mStartFillPercent:F

    sub-float/2addr v6, v9

    mul-float/2addr v6, v5

    iget v9, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->mStartFillPercent:F

    add-float/2addr v6, v9

    goto :goto_48

    .line 1150
    :cond_7e
    iget-object v6, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->this$0:Lcom/rey/material/widget/Slider;

    # getter for: Lcom/rey/material/widget/Slider;->mTravelAnimationDuration:I
    invoke-static {v6}, Lcom/rey/material/widget/Slider;->access$800(Lcom/rey/material/widget/Slider;)I

    move-result v6

    int-to-float v6, v6

    iget v8, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->mDuration:I

    int-to-float v8, v8

    div-float v2, v6, v8

    .line 1151
    .local v2, "p1":F
    iget-object v6, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->this$0:Lcom/rey/material/widget/Slider;

    # getter for: Lcom/rey/material/widget/Slider;->mTravelAnimationDuration:I
    invoke-static {v6}, Lcom/rey/material/widget/Slider;->access$800(Lcom/rey/material/widget/Slider;)I

    move-result v6

    iget-object v8, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->this$0:Lcom/rey/material/widget/Slider;

    # getter for: Lcom/rey/material/widget/Slider;->mTransformAnimationDuration:I
    invoke-static {v8}, Lcom/rey/material/widget/Slider;->access$100(Lcom/rey/material/widget/Slider;)I

    move-result v8

    add-int/2addr v6, v8

    int-to-float v6, v6

    iget v8, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->mDuration:I

    int-to-float v8, v8

    div-float v3, v6, v8

    .line 1152
    .local v3, "p2":F
    cmpg-float v6, v4, v2

    if-gez v6, :cond_df

    .line 1153
    iget-object v6, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->this$0:Lcom/rey/material/widget/Slider;

    # getter for: Lcom/rey/material/widget/Slider;->mInterpolator:Landroid/view/animation/Interpolator;
    invoke-static {v6}, Lcom/rey/material/widget/Slider;->access$200(Lcom/rey/material/widget/Slider;)Landroid/view/animation/Interpolator;

    move-result-object v6

    div-float v8, v4, v2

    invoke-interface {v6, v8}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v5

    .line 1154
    iget-object v6, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->this$0:Lcom/rey/material/widget/Slider;

    iget v8, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->mStartRadius:F

    sub-float v9, v7, v5

    mul-float/2addr v8, v9

    # setter for: Lcom/rey/material/widget/Slider;->mThumbCurrentRadius:F
    invoke-static {v6, v8}, Lcom/rey/material/widget/Slider;->access$002(Lcom/rey/material/widget/Slider;F)F

    .line 1155
    iget-object v6, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->this$0:Lcom/rey/material/widget/Slider;

    iget v8, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->mPosition:F

    iget v9, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->mStartPosition:F

    sub-float/2addr v8, v9

    mul-float/2addr v8, v5

    iget v9, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->mStartPosition:F

    add-float/2addr v8, v9

    # setter for: Lcom/rey/material/widget/Slider;->mThumbPosition:F
    invoke-static {v6, v8}, Lcom/rey/material/widget/Slider;->access$502(Lcom/rey/material/widget/Slider;F)F

    .line 1156
    iget-object v8, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->this$0:Lcom/rey/material/widget/Slider;

    iget-object v6, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->this$0:Lcom/rey/material/widget/Slider;

    # getter for: Lcom/rey/material/widget/Slider;->mAlwaysFillThumb:Z
    invoke-static {v6}, Lcom/rey/material/widget/Slider;->access$400(Lcom/rey/material/widget/Slider;)Z

    move-result v6

    if-eqz v6, :cond_d5

    move v6, v7

    :goto_d0
    # setter for: Lcom/rey/material/widget/Slider;->mThumbFillPercent:F
    invoke-static {v8, v6}, Lcom/rey/material/widget/Slider;->access$302(Lcom/rey/material/widget/Slider;F)F

    goto/16 :goto_4b

    :cond_d5
    iget v6, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->mFillPercent:F

    iget v9, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->mStartFillPercent:F

    sub-float/2addr v6, v9

    mul-float/2addr v6, v5

    iget v9, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->mStartFillPercent:F

    add-float/2addr v6, v9

    goto :goto_d0

    .line 1158
    :cond_df
    cmpl-float v6, v4, v3

    if-lez v6, :cond_4b

    .line 1159
    iget-object v6, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->this$0:Lcom/rey/material/widget/Slider;

    iget-object v8, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->this$0:Lcom/rey/material/widget/Slider;

    # getter for: Lcom/rey/material/widget/Slider;->mThumbRadius:I
    invoke-static {v8}, Lcom/rey/material/widget/Slider;->access$900(Lcom/rey/material/widget/Slider;)I

    move-result v8

    int-to-float v8, v8

    sub-float v9, v4, v3

    mul-float/2addr v8, v9

    sub-float v9, v7, v3

    div-float/2addr v8, v9

    # setter for: Lcom/rey/material/widget/Slider;->mThumbCurrentRadius:F
    invoke-static {v6, v8}, Lcom/rey/material/widget/Slider;->access$002(Lcom/rey/material/widget/Slider;F)F

    goto/16 :goto_4b

    .line 1164
    .end local v2    # "p1":F
    .end local v3    # "p2":F
    :cond_f7
    iget-object v6, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->this$0:Lcom/rey/material/widget/Slider;

    iget v8, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->mPosition:F

    iget v9, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->mStartPosition:F

    sub-float/2addr v8, v9

    mul-float/2addr v8, v5

    iget v9, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->mStartPosition:F

    add-float/2addr v8, v9

    # setter for: Lcom/rey/material/widget/Slider;->mThumbPosition:F
    invoke-static {v6, v8}, Lcom/rey/material/widget/Slider;->access$502(Lcom/rey/material/widget/Slider;F)F

    .line 1165
    iget-object v8, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->this$0:Lcom/rey/material/widget/Slider;

    iget-object v6, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->this$0:Lcom/rey/material/widget/Slider;

    # getter for: Lcom/rey/material/widget/Slider;->mAlwaysFillThumb:Z
    invoke-static {v6}, Lcom/rey/material/widget/Slider;->access$400(Lcom/rey/material/widget/Slider;)Z

    move-result v6

    if-eqz v6, :cond_13f

    move v6, v7

    :goto_110
    # setter for: Lcom/rey/material/widget/Slider;->mThumbFillPercent:F
    invoke-static {v8, v6}, Lcom/rey/material/widget/Slider;->access$302(Lcom/rey/material/widget/Slider;F)F

    .line 1167
    float-to-double v8, v4

    const-wide v10, 0x3fc999999999999aL    # 0.2

    cmpg-double v6, v8, v10

    if-gez v6, :cond_149

    .line 1168
    iget-object v6, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->this$0:Lcom/rey/material/widget/Slider;

    iget-object v8, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->this$0:Lcom/rey/material/widget/Slider;

    # getter for: Lcom/rey/material/widget/Slider;->mThumbRadius:I
    invoke-static {v8}, Lcom/rey/material/widget/Slider;->access$900(Lcom/rey/material/widget/Slider;)I

    move-result v8

    int-to-float v8, v8

    iget-object v9, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->this$0:Lcom/rey/material/widget/Slider;

    # getter for: Lcom/rey/material/widget/Slider;->mThumbBorderSize:I
    invoke-static {v9}, Lcom/rey/material/widget/Slider;->access$1000(Lcom/rey/material/widget/Slider;)I

    move-result v9

    int-to-float v9, v9

    mul-float/2addr v9, v4

    mul-float/2addr v9, v12

    add-float/2addr v8, v9

    iget-object v9, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->this$0:Lcom/rey/material/widget/Slider;

    # getter for: Lcom/rey/material/widget/Slider;->mThumbCurrentRadius:F
    invoke-static {v9}, Lcom/rey/material/widget/Slider;->access$000(Lcom/rey/material/widget/Slider;)F

    move-result v9

    invoke-static {v8, v9}, Ljava/lang/Math;->max(FF)F

    move-result v8

    # setter for: Lcom/rey/material/widget/Slider;->mThumbCurrentRadius:F
    invoke-static {v6, v8}, Lcom/rey/material/widget/Slider;->access$002(Lcom/rey/material/widget/Slider;F)F

    goto/16 :goto_4b

    .line 1165
    :cond_13f
    iget v6, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->mFillPercent:F

    iget v9, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->mStartFillPercent:F

    sub-float/2addr v6, v9

    mul-float/2addr v6, v5

    iget v9, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->mStartFillPercent:F

    add-float/2addr v6, v9

    goto :goto_110

    .line 1169
    :cond_149
    float-to-double v8, v4

    const-wide v10, 0x3fe999999999999aL    # 0.8

    cmpl-double v6, v8, v10

    if-ltz v6, :cond_4b

    .line 1170
    iget-object v6, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->this$0:Lcom/rey/material/widget/Slider;

    iget-object v8, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->this$0:Lcom/rey/material/widget/Slider;

    # getter for: Lcom/rey/material/widget/Slider;->mThumbRadius:I
    invoke-static {v8}, Lcom/rey/material/widget/Slider;->access$900(Lcom/rey/material/widget/Slider;)I

    move-result v8

    int-to-float v8, v8

    iget-object v9, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->this$0:Lcom/rey/material/widget/Slider;

    # getter for: Lcom/rey/material/widget/Slider;->mThumbBorderSize:I
    invoke-static {v9}, Lcom/rey/material/widget/Slider;->access$1000(Lcom/rey/material/widget/Slider;)I

    move-result v9

    int-to-float v9, v9

    mul-float v10, v4, v12

    sub-float v10, v12, v10

    mul-float/2addr v9, v10

    add-float/2addr v8, v9

    # setter for: Lcom/rey/material/widget/Slider;->mThumbCurrentRadius:F
    invoke-static {v6, v8}, Lcom/rey/material/widget/Slider;->access$002(Lcom/rey/material/widget/Slider;F)F

    goto/16 :goto_4b

    .line 1181
    :cond_16e
    invoke-virtual {p0}, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->stopAnimation()V

    goto/16 :goto_6e
.end method

.method public startAnimation(F)Z
    .registers 8
    .param p1, "position"    # F

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 1109
    iget-object v2, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->this$0:Lcom/rey/material/widget/Slider;

    # getter for: Lcom/rey/material/widget/Slider;->mThumbPosition:F
    invoke-static {v2}, Lcom/rey/material/widget/Slider;->access$500(Lcom/rey/material/widget/Slider;)F

    move-result v2

    cmpl-float v2, v2, p1

    if-nez v2, :cond_d

    .line 1124
    :goto_c
    return v0

    .line 1112
    :cond_d
    iput p1, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->mPosition:F

    .line 1114
    iget-object v2, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->this$0:Lcom/rey/material/widget/Slider;

    invoke-virtual {v2}, Lcom/rey/material/widget/Slider;->getHandler()Landroid/os/Handler;

    move-result-object v2

    if-eqz v2, :cond_33

    .line 1115
    invoke-virtual {p0}, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->resetAnimation()V

    .line 1116
    iput-boolean v1, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->mRunning:Z

    .line 1117
    iget-object v0, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->this$0:Lcom/rey/material/widget/Slider;

    invoke-virtual {v0}, Lcom/rey/material/widget/Slider;->getHandler()Landroid/os/Handler;

    move-result-object v0

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    const-wide/16 v4, 0x10

    add-long/2addr v2, v4

    invoke-virtual {v0, p0, v2, v3}, Landroid/os/Handler;->postAtTime(Ljava/lang/Runnable;J)Z

    .line 1118
    iget-object v0, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->this$0:Lcom/rey/material/widget/Slider;

    invoke-virtual {v0}, Lcom/rey/material/widget/Slider;->invalidate()V

    move v0, v1

    .line 1119
    goto :goto_c

    .line 1122
    :cond_33
    iget-object v1, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->this$0:Lcom/rey/material/widget/Slider;

    # setter for: Lcom/rey/material/widget/Slider;->mThumbPosition:F
    invoke-static {v1, p1}, Lcom/rey/material/widget/Slider;->access$502(Lcom/rey/material/widget/Slider;F)F

    .line 1123
    iget-object v1, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->this$0:Lcom/rey/material/widget/Slider;

    invoke-virtual {v1}, Lcom/rey/material/widget/Slider;->invalidate()V

    goto :goto_c
.end method

.method public stopAnimation()V
    .registers 3

    .prologue
    .line 1129
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->mRunning:Z

    .line 1130
    iget-object v1, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->this$0:Lcom/rey/material/widget/Slider;

    iget-object v0, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->this$0:Lcom/rey/material/widget/Slider;

    # getter for: Lcom/rey/material/widget/Slider;->mDiscreteMode:Z
    invoke-static {v0}, Lcom/rey/material/widget/Slider;->access$600(Lcom/rey/material/widget/Slider;)Z

    move-result v0

    if-eqz v0, :cond_46

    iget-object v0, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->this$0:Lcom/rey/material/widget/Slider;

    # getter for: Lcom/rey/material/widget/Slider;->mIsDragging:Z
    invoke-static {v0}, Lcom/rey/material/widget/Slider;->access$700(Lcom/rey/material/widget/Slider;)Z

    move-result v0

    if-eqz v0, :cond_46

    const/4 v0, 0x0

    :goto_16
    # setter for: Lcom/rey/material/widget/Slider;->mThumbCurrentRadius:F
    invoke-static {v1, v0}, Lcom/rey/material/widget/Slider;->access$002(Lcom/rey/material/widget/Slider;F)F

    .line 1131
    iget-object v1, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->this$0:Lcom/rey/material/widget/Slider;

    iget-object v0, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->this$0:Lcom/rey/material/widget/Slider;

    # getter for: Lcom/rey/material/widget/Slider;->mAlwaysFillThumb:Z
    invoke-static {v0}, Lcom/rey/material/widget/Slider;->access$400(Lcom/rey/material/widget/Slider;)Z

    move-result v0

    if-eqz v0, :cond_4e

    const/high16 v0, 0x3f800000    # 1.0f

    :goto_25
    # setter for: Lcom/rey/material/widget/Slider;->mThumbFillPercent:F
    invoke-static {v1, v0}, Lcom/rey/material/widget/Slider;->access$302(Lcom/rey/material/widget/Slider;F)F

    .line 1132
    iget-object v0, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->this$0:Lcom/rey/material/widget/Slider;

    iget v1, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->mPosition:F

    # setter for: Lcom/rey/material/widget/Slider;->mThumbPosition:F
    invoke-static {v0, v1}, Lcom/rey/material/widget/Slider;->access$502(Lcom/rey/material/widget/Slider;F)F

    .line 1133
    iget-object v0, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->this$0:Lcom/rey/material/widget/Slider;

    invoke-virtual {v0}, Lcom/rey/material/widget/Slider;->getHandler()Landroid/os/Handler;

    move-result-object v0

    if-eqz v0, :cond_40

    .line 1134
    iget-object v0, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->this$0:Lcom/rey/material/widget/Slider;

    invoke-virtual {v0}, Lcom/rey/material/widget/Slider;->getHandler()Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1135
    :cond_40
    iget-object v0, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->this$0:Lcom/rey/material/widget/Slider;

    invoke-virtual {v0}, Lcom/rey/material/widget/Slider;->invalidate()V

    .line 1136
    return-void

    .line 1130
    :cond_46
    iget-object v0, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->this$0:Lcom/rey/material/widget/Slider;

    # getter for: Lcom/rey/material/widget/Slider;->mThumbRadius:I
    invoke-static {v0}, Lcom/rey/material/widget/Slider;->access$900(Lcom/rey/material/widget/Slider;)I

    move-result v0

    int-to-float v0, v0

    goto :goto_16

    .line 1131
    :cond_4e
    iget v0, p0, Lcom/rey/material/widget/Slider$ThumbMoveAnimator;->mFillPercent:F

    goto :goto_25
.end method
