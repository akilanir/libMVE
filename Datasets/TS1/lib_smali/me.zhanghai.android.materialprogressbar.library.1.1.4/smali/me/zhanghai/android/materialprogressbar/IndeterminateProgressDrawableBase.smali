.class abstract Lme/zhanghai/android/materialprogressbar/IndeterminateProgressDrawableBase;
.super Lme/zhanghai/android/materialprogressbar/ProgressDrawableBase;
.source "IndeterminateProgressDrawableBase.java"

# interfaces
.implements Landroid/graphics/drawable/Animatable;


# instance fields
.field protected mAnimators:[Landroid/animation/Animator;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 19
    invoke-direct {p0, p1}, Lme/zhanghai/android/materialprogressbar/ProgressDrawableBase;-><init>(Landroid/content/Context;)V

    .line 20
    return-void
.end method

.method private isStarted()Z
    .registers 7

    .prologue
    const/4 v1, 0x0

    .line 51
    iget-object v3, p0, Lme/zhanghai/android/materialprogressbar/IndeterminateProgressDrawableBase;->mAnimators:[Landroid/animation/Animator;

    array-length v4, v3

    move v2, v1

    :goto_5
    if-ge v2, v4, :cond_10

    aget-object v0, v3, v2

    .line 52
    .local v0, "animator":Landroid/animation/Animator;
    invoke-virtual {v0}, Landroid/animation/Animator;->isStarted()Z

    move-result v5

    if-eqz v5, :cond_11

    .line 53
    const/4 v1, 0x1

    .line 56
    .end local v0    # "animator":Landroid/animation/Animator;
    :cond_10
    return v1

    .line 51
    .restart local v0    # "animator":Landroid/animation/Animator;
    :cond_11
    add-int/lit8 v2, v2, 0x1

    goto :goto_5
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 3
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 27
    invoke-super {p0, p1}, Lme/zhanghai/android/materialprogressbar/ProgressDrawableBase;->draw(Landroid/graphics/Canvas;)V

    .line 29
    invoke-direct {p0}, Lme/zhanghai/android/materialprogressbar/IndeterminateProgressDrawableBase;->isStarted()Z

    move-result v0

    if-eqz v0, :cond_c

    .line 30
    invoke-virtual {p0}, Lme/zhanghai/android/materialprogressbar/IndeterminateProgressDrawableBase;->invalidateSelf()V

    .line 32
    :cond_c
    return-void
.end method

.method public isRunning()Z
    .registers 7

    .prologue
    const/4 v1, 0x0

    .line 74
    iget-object v3, p0, Lme/zhanghai/android/materialprogressbar/IndeterminateProgressDrawableBase;->mAnimators:[Landroid/animation/Animator;

    array-length v4, v3

    move v2, v1

    :goto_5
    if-ge v2, v4, :cond_10

    aget-object v0, v3, v2

    .line 75
    .local v0, "animator":Landroid/animation/Animator;
    invoke-virtual {v0}, Landroid/animation/Animator;->isRunning()Z

    move-result v5

    if-eqz v5, :cond_11

    .line 76
    const/4 v1, 0x1

    .line 79
    .end local v0    # "animator":Landroid/animation/Animator;
    :cond_10
    return v1

    .line 74
    .restart local v0    # "animator":Landroid/animation/Animator;
    :cond_11
    add-int/lit8 v2, v2, 0x1

    goto :goto_5
.end method

.method public start()V
    .registers 5

    .prologue
    .line 40
    invoke-direct {p0}, Lme/zhanghai/android/materialprogressbar/IndeterminateProgressDrawableBase;->isStarted()Z

    move-result v1

    if-eqz v1, :cond_7

    .line 48
    :goto_6
    return-void

    .line 44
    :cond_7
    iget-object v2, p0, Lme/zhanghai/android/materialprogressbar/IndeterminateProgressDrawableBase;->mAnimators:[Landroid/animation/Animator;

    array-length v3, v2

    const/4 v1, 0x0

    :goto_b
    if-ge v1, v3, :cond_15

    aget-object v0, v2, v1

    .line 45
    .local v0, "animator":Landroid/animation/Animator;
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 44
    add-int/lit8 v1, v1, 0x1

    goto :goto_b

    .line 47
    .end local v0    # "animator":Landroid/animation/Animator;
    :cond_15
    invoke-virtual {p0}, Lme/zhanghai/android/materialprogressbar/IndeterminateProgressDrawableBase;->invalidateSelf()V

    goto :goto_6
.end method

.method public stop()V
    .registers 5

    .prologue
    .line 64
    iget-object v2, p0, Lme/zhanghai/android/materialprogressbar/IndeterminateProgressDrawableBase;->mAnimators:[Landroid/animation/Animator;

    array-length v3, v2

    const/4 v1, 0x0

    :goto_4
    if-ge v1, v3, :cond_e

    aget-object v0, v2, v1

    .line 65
    .local v0, "animator":Landroid/animation/Animator;
    invoke-virtual {v0}, Landroid/animation/Animator;->end()V

    .line 64
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 67
    .end local v0    # "animator":Landroid/animation/Animator;
    :cond_e
    return-void
.end method
