.class public Lcom/rey/material/drawable/CircleDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "CircleDrawable.java"

# interfaces
.implements Landroid/graphics/drawable/Animatable;


# instance fields
.field private mAnimDuration:I

.field private mAnimEnable:Z

.field private mAnimProgress:F

.field private mInEditMode:Z

.field private mInInterpolator:Landroid/view/animation/Interpolator;

.field private mOutInterpolator:Landroid/view/animation/Interpolator;

.field private mPaint:Landroid/graphics/Paint;

.field private mRadius:F

.field private mRunning:Z

.field private mStartTime:J

.field private final mUpdater:Ljava/lang/Runnable;

.field private mVisible:Z

.field private mX:F

.field private mY:F


# direct methods
.method public constructor <init>()V
    .registers 4

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 38
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 21
    iput-boolean v1, p0, Lcom/rey/material/drawable/CircleDrawable;->mRunning:Z

    .line 24
    const/16 v0, 0x3e8

    iput v0, p0, Lcom/rey/material/drawable/CircleDrawable;->mAnimDuration:I

    .line 25
    new-instance v0, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    iput-object v0, p0, Lcom/rey/material/drawable/CircleDrawable;->mInInterpolator:Landroid/view/animation/Interpolator;

    .line 26
    new-instance v0, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    iput-object v0, p0, Lcom/rey/material/drawable/CircleDrawable;->mOutInterpolator:Landroid/view/animation/Interpolator;

    .line 35
    iput-boolean v1, p0, Lcom/rey/material/drawable/CircleDrawable;->mInEditMode:Z

    .line 36
    iput-boolean v2, p0, Lcom/rey/material/drawable/CircleDrawable;->mAnimEnable:Z

    .line 147
    new-instance v0, Lcom/rey/material/drawable/CircleDrawable$1;

    invoke-direct {v0, p0}, Lcom/rey/material/drawable/CircleDrawable$1;-><init>(Lcom/rey/material/drawable/CircleDrawable;)V

    iput-object v0, p0, Lcom/rey/material/drawable/CircleDrawable;->mUpdater:Ljava/lang/Runnable;

    .line 39
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/rey/material/drawable/CircleDrawable;->mPaint:Landroid/graphics/Paint;

    .line 40
    iget-object v0, p0, Lcom/rey/material/drawable/CircleDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 41
    return-void
.end method

.method static synthetic access$000(Lcom/rey/material/drawable/CircleDrawable;)V
    .registers 1
    .param p0, "x0"    # Lcom/rey/material/drawable/CircleDrawable;

    .prologue
    .line 19
    invoke-direct {p0}, Lcom/rey/material/drawable/CircleDrawable;->update()V

    return-void
.end method

.method private resetAnimation()V
    .registers 3

    .prologue
    .line 118
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/rey/material/drawable/CircleDrawable;->mStartTime:J

    .line 119
    const/4 v0, 0x0

    iput v0, p0, Lcom/rey/material/drawable/CircleDrawable;->mAnimProgress:F

    .line 120
    return-void
.end method

.method private update()V
    .registers 8

    .prologue
    const/high16 v4, 0x3f800000    # 1.0f

    .line 157
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 158
    .local v0, "curTime":J
    iget-wide v2, p0, Lcom/rey/material/drawable/CircleDrawable;->mStartTime:J

    sub-long v2, v0, v2

    long-to-float v2, v2

    iget v3, p0, Lcom/rey/material/drawable/CircleDrawable;->mAnimDuration:I

    int-to-float v3, v3

    div-float/2addr v2, v3

    invoke-static {v4, v2}, Ljava/lang/Math;->min(FF)F

    move-result v2

    iput v2, p0, Lcom/rey/material/drawable/CircleDrawable;->mAnimProgress:F

    .line 160
    iget v2, p0, Lcom/rey/material/drawable/CircleDrawable;->mAnimProgress:F

    cmpl-float v2, v2, v4

    if-nez v2, :cond_1e

    .line 161
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/rey/material/drawable/CircleDrawable;->mRunning:Z

    .line 163
    :cond_1e
    invoke-virtual {p0}, Lcom/rey/material/drawable/CircleDrawable;->isRunning()Z

    move-result v2

    if-eqz v2, :cond_30

    .line 164
    iget-object v2, p0, Lcom/rey/material/drawable/CircleDrawable;->mUpdater:Ljava/lang/Runnable;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    const-wide/16 v5, 0x10

    add-long/2addr v3, v5

    invoke-virtual {p0, v2, v3, v4}, Lcom/rey/material/drawable/CircleDrawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    .line 166
    :cond_30
    invoke-virtual {p0}, Lcom/rey/material/drawable/CircleDrawable;->invalidateSelf()V

    .line 167
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 7
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 93
    iget-boolean v1, p0, Lcom/rey/material/drawable/CircleDrawable;->mRunning:Z

    if-nez v1, :cond_14

    .line 94
    iget-boolean v1, p0, Lcom/rey/material/drawable/CircleDrawable;->mVisible:Z

    if-eqz v1, :cond_13

    .line 95
    iget v1, p0, Lcom/rey/material/drawable/CircleDrawable;->mX:F

    iget v2, p0, Lcom/rey/material/drawable/CircleDrawable;->mY:F

    iget v3, p0, Lcom/rey/material/drawable/CircleDrawable;->mRadius:F

    iget-object v4, p0, Lcom/rey/material/drawable/CircleDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2, v3, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 100
    :cond_13
    :goto_13
    return-void

    .line 97
    :cond_14
    iget-boolean v1, p0, Lcom/rey/material/drawable/CircleDrawable;->mVisible:Z

    if-eqz v1, :cond_2e

    iget-object v1, p0, Lcom/rey/material/drawable/CircleDrawable;->mInInterpolator:Landroid/view/animation/Interpolator;

    iget v2, p0, Lcom/rey/material/drawable/CircleDrawable;->mAnimProgress:F

    invoke-interface {v1, v2}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v1

    iget v2, p0, Lcom/rey/material/drawable/CircleDrawable;->mRadius:F

    mul-float v0, v1, v2

    .line 98
    .local v0, "radius":F
    :goto_24
    iget v1, p0, Lcom/rey/material/drawable/CircleDrawable;->mX:F

    iget v2, p0, Lcom/rey/material/drawable/CircleDrawable;->mY:F

    iget-object v3, p0, Lcom/rey/material/drawable/CircleDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2, v0, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto :goto_13

    .line 97
    .end local v0    # "radius":F
    :cond_2e
    const/high16 v1, 0x3f800000    # 1.0f

    iget-object v2, p0, Lcom/rey/material/drawable/CircleDrawable;->mOutInterpolator:Landroid/view/animation/Interpolator;

    iget v3, p0, Lcom/rey/material/drawable/CircleDrawable;->mAnimProgress:F

    invoke-interface {v2, v3}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v2

    sub-float/2addr v1, v2

    iget v2, p0, Lcom/rey/material/drawable/CircleDrawable;->mRadius:F

    mul-float v0, v1, v2

    goto :goto_24
.end method

.method public getOpacity()I
    .registers 2

    .prologue
    .line 114
    const/4 v0, -0x3

    return v0
.end method

.method public isRunning()Z
    .registers 2

    .prologue
    .line 138
    iget-boolean v0, p0, Lcom/rey/material/drawable/CircleDrawable;->mRunning:Z

    return v0
.end method

.method public isStateful()Z
    .registers 2

    .prologue
    .line 67
    const/4 v0, 0x1

    return v0
.end method

.method protected onBoundsChange(Landroid/graphics/Rect;)V
    .registers 4
    .param p1, "bounds"    # Landroid/graphics/Rect;

    .prologue
    .line 86
    invoke-virtual {p1}, Landroid/graphics/Rect;->exactCenterX()F

    move-result v0

    iput v0, p0, Lcom/rey/material/drawable/CircleDrawable;->mX:F

    .line 87
    invoke-virtual {p1}, Landroid/graphics/Rect;->exactCenterY()F

    move-result v0

    iput v0, p0, Lcom/rey/material/drawable/CircleDrawable;->mY:F

    .line 88
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v0

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    iput v0, p0, Lcom/rey/material/drawable/CircleDrawable;->mRadius:F

    .line 89
    return-void
.end method

.method protected onStateChange([I)Z
    .registers 6
    .param p1, "state"    # [I

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 72
    const v3, 0x10100a0

    invoke-static {p1, v3}, Lcom/rey/material/util/ViewUtil;->hasState([II)Z

    move-result v3

    if-nez v3, :cond_14

    const v3, 0x10100a7

    invoke-static {p1, v3}, Lcom/rey/material/util/ViewUtil;->hasState([II)Z

    move-result v3

    if-eqz v3, :cond_27

    :cond_14
    move v0, v2

    .line 74
    .local v0, "visible":Z
    :goto_15
    iget-boolean v3, p0, Lcom/rey/material/drawable/CircleDrawable;->mVisible:Z

    if-eq v3, v0, :cond_29

    .line 75
    iput-boolean v0, p0, Lcom/rey/material/drawable/CircleDrawable;->mVisible:Z

    .line 76
    iget-boolean v1, p0, Lcom/rey/material/drawable/CircleDrawable;->mInEditMode:Z

    if-nez v1, :cond_26

    iget-boolean v1, p0, Lcom/rey/material/drawable/CircleDrawable;->mAnimEnable:Z

    if-eqz v1, :cond_26

    .line 77
    invoke-virtual {p0}, Lcom/rey/material/drawable/CircleDrawable;->start()V

    .line 81
    :cond_26
    :goto_26
    return v2

    .end local v0    # "visible":Z
    :cond_27
    move v0, v1

    .line 72
    goto :goto_15

    .restart local v0    # "visible":Z
    :cond_29
    move v2, v1

    .line 81
    goto :goto_26
.end method

.method public scheduleSelf(Ljava/lang/Runnable;J)V
    .registers 5
    .param p1, "what"    # Ljava/lang/Runnable;
    .param p2, "when"    # J

    .prologue
    .line 143
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/rey/material/drawable/CircleDrawable;->mRunning:Z

    .line 144
    invoke-super {p0, p1, p2, p3}, Landroid/graphics/drawable/Drawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    .line 145
    return-void
.end method

.method public setAlpha(I)V
    .registers 3
    .param p1, "alpha"    # I

    .prologue
    .line 104
    iget-object v0, p0, Lcom/rey/material/drawable/CircleDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 105
    return-void
.end method

.method public setAnimDuration(I)V
    .registers 2
    .param p1, "duration"    # I

    .prologue
    .line 57
    iput p1, p0, Lcom/rey/material/drawable/CircleDrawable;->mAnimDuration:I

    .line 58
    return-void
.end method

.method public setAnimEnable(Z)V
    .registers 2
    .param p1, "b"    # Z

    .prologue
    .line 48
    iput-boolean p1, p0, Lcom/rey/material/drawable/CircleDrawable;->mAnimEnable:Z

    .line 49
    return-void
.end method

.method public setColor(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 52
    iget-object v0, p0, Lcom/rey/material/drawable/CircleDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 53
    invoke-virtual {p0}, Lcom/rey/material/drawable/CircleDrawable;->invalidateSelf()V

    .line 54
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3
    .param p1, "cf"    # Landroid/graphics/ColorFilter;

    .prologue
    .line 109
    iget-object v0, p0, Lcom/rey/material/drawable/CircleDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 110
    return-void
.end method

.method public setInEditMode(Z)V
    .registers 2
    .param p1, "b"    # Z

    .prologue
    .line 44
    iput-boolean p1, p0, Lcom/rey/material/drawable/CircleDrawable;->mInEditMode:Z

    .line 45
    return-void
.end method

.method public setInterpolator(Landroid/view/animation/Interpolator;Landroid/view/animation/Interpolator;)V
    .registers 3
    .param p1, "in"    # Landroid/view/animation/Interpolator;
    .param p2, "out"    # Landroid/view/animation/Interpolator;

    .prologue
    .line 61
    iput-object p1, p0, Lcom/rey/material/drawable/CircleDrawable;->mInInterpolator:Landroid/view/animation/Interpolator;

    .line 62
    iput-object p2, p0, Lcom/rey/material/drawable/CircleDrawable;->mOutInterpolator:Landroid/view/animation/Interpolator;

    .line 63
    return-void
.end method

.method public start()V
    .registers 6

    .prologue
    .line 124
    invoke-direct {p0}, Lcom/rey/material/drawable/CircleDrawable;->resetAnimation()V

    .line 125
    iget-object v0, p0, Lcom/rey/material/drawable/CircleDrawable;->mUpdater:Ljava/lang/Runnable;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    const-wide/16 v3, 0x10

    add-long/2addr v1, v3

    invoke-virtual {p0, v0, v1, v2}, Lcom/rey/material/drawable/CircleDrawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    .line 126
    invoke-virtual {p0}, Lcom/rey/material/drawable/CircleDrawable;->invalidateSelf()V

    .line 127
    return-void
.end method

.method public stop()V
    .registers 2

    .prologue
    .line 131
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/rey/material/drawable/CircleDrawable;->mRunning:Z

    .line 132
    iget-object v0, p0, Lcom/rey/material/drawable/CircleDrawable;->mUpdater:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/rey/material/drawable/CircleDrawable;->unscheduleSelf(Ljava/lang/Runnable;)V

    .line 133
    invoke-virtual {p0}, Lcom/rey/material/drawable/CircleDrawable;->invalidateSelf()V

    .line 134
    return-void
.end method
