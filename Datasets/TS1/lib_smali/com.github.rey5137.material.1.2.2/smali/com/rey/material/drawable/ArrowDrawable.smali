.class public Lcom/rey/material/drawable/ArrowDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "ArrowDrawable.java"

# interfaces
.implements Landroid/graphics/drawable/Animatable;


# static fields
.field public static MODE_DOWN:I

.field public static MODE_UP:I


# instance fields
.field private mAnimDuration:I

.field private mAnimProgress:F

.field private mClockwise:Z

.field private mColorStateList:Landroid/content/res/ColorStateList;

.field private mCurColor:I

.field private mInterpolator:Landroid/view/animation/Interpolator;

.field private mMode:I

.field private mPaint:Landroid/graphics/Paint;

.field private mPath:Landroid/graphics/Path;

.field private mRunning:Z

.field private mSize:I

.field private mStartTime:J

.field private final mUpdater:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 34
    const/4 v0, 0x0

    sput v0, Lcom/rey/material/drawable/ArrowDrawable;->MODE_DOWN:I

    .line 35
    const/4 v0, 0x1

    sput v0, Lcom/rey/material/drawable/ArrowDrawable;->MODE_UP:I

    return-void
.end method

.method public constructor <init>(IILandroid/content/res/ColorStateList;ILandroid/view/animation/Interpolator;Z)V
    .registers 9
    .param p1, "mode"    # I
    .param p2, "size"    # I
    .param p3, "colorStateList"    # Landroid/content/res/ColorStateList;
    .param p4, "animDuration"    # I
    .param p5, "interpolator"    # Landroid/view/animation/Interpolator;
    .param p6, "clockwise"    # Z

    .prologue
    const/4 v1, 0x1

    .line 39
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 20
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/rey/material/drawable/ArrowDrawable;->mRunning:Z

    .line 37
    iput-boolean v1, p0, Lcom/rey/material/drawable/ArrowDrawable;->mClockwise:Z

    .line 204
    new-instance v0, Lcom/rey/material/drawable/ArrowDrawable$1;

    invoke-direct {v0, p0}, Lcom/rey/material/drawable/ArrowDrawable$1;-><init>(Lcom/rey/material/drawable/ArrowDrawable;)V

    iput-object v0, p0, Lcom/rey/material/drawable/ArrowDrawable;->mUpdater:Ljava/lang/Runnable;

    .line 40
    iput p2, p0, Lcom/rey/material/drawable/ArrowDrawable;->mSize:I

    .line 41
    iput p4, p0, Lcom/rey/material/drawable/ArrowDrawable;->mAnimDuration:I

    .line 42
    iput p1, p0, Lcom/rey/material/drawable/ArrowDrawable;->mMode:I

    .line 43
    iput-object p5, p0, Lcom/rey/material/drawable/ArrowDrawable;->mInterpolator:Landroid/view/animation/Interpolator;

    .line 44
    iget-object v0, p0, Lcom/rey/material/drawable/ArrowDrawable;->mInterpolator:Landroid/view/animation/Interpolator;

    if-nez v0, :cond_23

    .line 45
    new-instance v0, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    iput-object v0, p0, Lcom/rey/material/drawable/ArrowDrawable;->mInterpolator:Landroid/view/animation/Interpolator;

    .line 46
    :cond_23
    iput-boolean p6, p0, Lcom/rey/material/drawable/ArrowDrawable;->mClockwise:Z

    .line 48
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/rey/material/drawable/ArrowDrawable;->mPaint:Landroid/graphics/Paint;

    .line 49
    iget-object v0, p0, Lcom/rey/material/drawable/ArrowDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 50
    iget-object v0, p0, Lcom/rey/material/drawable/ArrowDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 52
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/rey/material/drawable/ArrowDrawable;->mPath:Landroid/graphics/Path;

    .line 54
    invoke-virtual {p0, p3}, Lcom/rey/material/drawable/ArrowDrawable;->setColor(Landroid/content/res/ColorStateList;)V

    .line 55
    return-void
.end method

.method static synthetic access$000(Lcom/rey/material/drawable/ArrowDrawable;)V
    .registers 1
    .param p0, "x0"    # Lcom/rey/material/drawable/ArrowDrawable;

    .prologue
    .line 18
    invoke-direct {p0}, Lcom/rey/material/drawable/ArrowDrawable;->update()V

    return-void
.end method

.method private resetAnimation()V
    .registers 3

    .prologue
    .line 175
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/rey/material/drawable/ArrowDrawable;->mStartTime:J

    .line 176
    const/4 v0, 0x0

    iput v0, p0, Lcom/rey/material/drawable/ArrowDrawable;->mAnimProgress:F

    .line 177
    return-void
.end method

.method private update()V
    .registers 8

    .prologue
    const/high16 v4, 0x3f800000    # 1.0f

    .line 214
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 215
    .local v0, "curTime":J
    iget-wide v2, p0, Lcom/rey/material/drawable/ArrowDrawable;->mStartTime:J

    sub-long v2, v0, v2

    long-to-float v2, v2

    iget v3, p0, Lcom/rey/material/drawable/ArrowDrawable;->mAnimDuration:I

    int-to-float v3, v3

    div-float/2addr v2, v3

    invoke-static {v4, v2}, Ljava/lang/Math;->min(FF)F

    move-result v2

    iput v2, p0, Lcom/rey/material/drawable/ArrowDrawable;->mAnimProgress:F

    .line 217
    iget v2, p0, Lcom/rey/material/drawable/ArrowDrawable;->mAnimProgress:F

    cmpl-float v2, v2, v4

    if-nez v2, :cond_1e

    .line 218
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/rey/material/drawable/ArrowDrawable;->mRunning:Z

    .line 220
    :cond_1e
    invoke-virtual {p0}, Lcom/rey/material/drawable/ArrowDrawable;->isRunning()Z

    move-result v2

    if-eqz v2, :cond_30

    .line 221
    iget-object v2, p0, Lcom/rey/material/drawable/ArrowDrawable;->mUpdater:Ljava/lang/Runnable;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    const-wide/16 v5, 0x10

    add-long/2addr v3, v5

    invoke-virtual {p0, v2, v3, v4}, Lcom/rey/material/drawable/ArrowDrawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    .line 223
    :cond_30
    invoke-virtual {p0}, Lcom/rey/material/drawable/ArrowDrawable;->invalidateSelf()V

    .line 224
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 11
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/high16 v8, 0x3f800000    # 1.0f

    const/high16 v7, -0x3ccc0000    # -180.0f

    const/high16 v6, 0x43340000    # 180.0f

    .line 109
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v2

    .line 110
    .local v2, "saveCount":I
    invoke-virtual {p0}, Lcom/rey/material/drawable/ArrowDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    .line 112
    .local v0, "bounds":Landroid/graphics/Rect;
    invoke-virtual {p0}, Lcom/rey/material/drawable/ArrowDrawable;->isRunning()Z

    move-result v4

    if-nez v4, :cond_37

    .line 113
    iget v4, p0, Lcom/rey/material/drawable/ArrowDrawable;->mMode:I

    sget v5, Lcom/rey/material/drawable/ArrowDrawable;->MODE_UP:I

    if-ne v4, v5, :cond_25

    .line 114
    invoke-virtual {v0}, Landroid/graphics/Rect;->exactCenterX()F

    move-result v4

    invoke-virtual {v0}, Landroid/graphics/Rect;->exactCenterY()F

    move-result v5

    invoke-virtual {p1, v6, v4, v5}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 136
    :cond_25
    :goto_25
    iget-object v4, p0, Lcom/rey/material/drawable/ArrowDrawable;->mPaint:Landroid/graphics/Paint;

    iget v5, p0, Lcom/rey/material/drawable/ArrowDrawable;->mCurColor:I

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 137
    iget-object v4, p0, Lcom/rey/material/drawable/ArrowDrawable;->mPath:Landroid/graphics/Path;

    iget-object v5, p0, Lcom/rey/material/drawable/ArrowDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v4, v5}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 139
    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 140
    return-void

    .line 117
    :cond_37
    iget-object v4, p0, Lcom/rey/material/drawable/ArrowDrawable;->mInterpolator:Landroid/view/animation/Interpolator;

    iget v5, p0, Lcom/rey/material/drawable/ArrowDrawable;->mAnimProgress:F

    invoke-interface {v4, v5}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v3

    .line 120
    .local v3, "value":F
    iget-boolean v4, p0, Lcom/rey/material/drawable/ArrowDrawable;->mClockwise:Z

    if-eqz v4, :cond_5c

    .line 121
    iget v4, p0, Lcom/rey/material/drawable/ArrowDrawable;->mMode:I

    sget v5, Lcom/rey/material/drawable/ArrowDrawable;->MODE_UP:I

    if-ne v4, v5, :cond_57

    .line 122
    mul-float v1, v6, v3

    .line 133
    .local v1, "degree":F
    :goto_4b
    invoke-virtual {v0}, Landroid/graphics/Rect;->exactCenterX()F

    move-result v4

    invoke-virtual {v0}, Landroid/graphics/Rect;->exactCenterY()F

    move-result v5

    invoke-virtual {p1, v1, v4, v5}, Landroid/graphics/Canvas;->rotate(FFF)V

    goto :goto_25

    .line 124
    .end local v1    # "degree":F
    :cond_57
    add-float v4, v8, v3

    mul-float v1, v6, v4

    .restart local v1    # "degree":F
    goto :goto_4b

    .line 127
    .end local v1    # "degree":F
    :cond_5c
    iget v4, p0, Lcom/rey/material/drawable/ArrowDrawable;->mMode:I

    sget v5, Lcom/rey/material/drawable/ArrowDrawable;->MODE_UP:I

    if-ne v4, v5, :cond_65

    .line 128
    mul-float v1, v7, v3

    .restart local v1    # "degree":F
    goto :goto_4b

    .line 130
    .end local v1    # "degree":F
    :cond_65
    add-float v4, v8, v3

    mul-float v1, v7, v4

    .restart local v1    # "degree":F
    goto :goto_4b
.end method

.method public getMode()I
    .registers 2

    .prologue
    .line 92
    iget v0, p0, Lcom/rey/material/drawable/ArrowDrawable;->mMode:I

    return v0
.end method

.method public getOpacity()I
    .registers 2

    .prologue
    .line 154
    const/4 v0, -0x3

    return v0
.end method

.method public isRunning()Z
    .registers 2

    .prologue
    .line 195
    iget-boolean v0, p0, Lcom/rey/material/drawable/ArrowDrawable;->mRunning:Z

    return v0
.end method

.method public isStateful()Z
    .registers 2

    .prologue
    .line 159
    const/4 v0, 0x1

    return v0
.end method

.method protected onBoundsChange(Landroid/graphics/Rect;)V
    .registers 8
    .param p1, "bounds"    # Landroid/graphics/Rect;

    .prologue
    const/high16 v5, 0x40000000    # 2.0f

    .line 97
    invoke-virtual {p1}, Landroid/graphics/Rect;->exactCenterX()F

    move-result v0

    .line 98
    .local v0, "x":F
    invoke-virtual {p1}, Landroid/graphics/Rect;->exactCenterY()F

    move-result v1

    .line 100
    .local v1, "y":F
    iget-object v2, p0, Lcom/rey/material/drawable/ArrowDrawable;->mPath:Landroid/graphics/Path;

    invoke-virtual {v2}, Landroid/graphics/Path;->reset()V

    .line 101
    iget-object v2, p0, Lcom/rey/material/drawable/ArrowDrawable;->mPath:Landroid/graphics/Path;

    iget v3, p0, Lcom/rey/material/drawable/ArrowDrawable;->mSize:I

    int-to-float v3, v3

    div-float/2addr v3, v5

    add-float/2addr v3, v1

    invoke-virtual {v2, v0, v3}, Landroid/graphics/Path;->moveTo(FF)V

    .line 102
    iget-object v2, p0, Lcom/rey/material/drawable/ArrowDrawable;->mPath:Landroid/graphics/Path;

    iget v3, p0, Lcom/rey/material/drawable/ArrowDrawable;->mSize:I

    int-to-float v3, v3

    sub-float v3, v0, v3

    iget v4, p0, Lcom/rey/material/drawable/ArrowDrawable;->mSize:I

    int-to-float v4, v4

    div-float/2addr v4, v5

    sub-float v4, v1, v4

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 103
    iget-object v2, p0, Lcom/rey/material/drawable/ArrowDrawable;->mPath:Landroid/graphics/Path;

    iget v3, p0, Lcom/rey/material/drawable/ArrowDrawable;->mSize:I

    int-to-float v3, v3

    add-float/2addr v3, v0

    iget v4, p0, Lcom/rey/material/drawable/ArrowDrawable;->mSize:I

    int-to-float v4, v4

    div-float/2addr v4, v5

    sub-float v4, v1, v4

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 104
    iget-object v2, p0, Lcom/rey/material/drawable/ArrowDrawable;->mPath:Landroid/graphics/Path;

    invoke-virtual {v2}, Landroid/graphics/Path;->close()V

    .line 105
    return-void
.end method

.method protected onStateChange([I)Z
    .registers 5
    .param p1, "state"    # [I

    .prologue
    .line 164
    iget-object v1, p0, Lcom/rey/material/drawable/ArrowDrawable;->mColorStateList:Landroid/content/res/ColorStateList;

    iget v2, p0, Lcom/rey/material/drawable/ArrowDrawable;->mCurColor:I

    invoke-virtual {v1, p1, v2}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v0

    .line 166
    .local v0, "color":I
    iget v1, p0, Lcom/rey/material/drawable/ArrowDrawable;->mCurColor:I

    if-eq v1, v0, :cond_10

    .line 167
    iput v0, p0, Lcom/rey/material/drawable/ArrowDrawable;->mCurColor:I

    .line 168
    const/4 v1, 0x1

    .line 171
    :goto_f
    return v1

    :cond_10
    const/4 v1, 0x0

    goto :goto_f
.end method

.method public scheduleSelf(Ljava/lang/Runnable;J)V
    .registers 5
    .param p1, "what"    # Ljava/lang/Runnable;
    .param p2, "when"    # J

    .prologue
    .line 200
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/rey/material/drawable/ArrowDrawable;->mRunning:Z

    .line 201
    invoke-super {p0, p1, p2, p3}, Landroid/graphics/drawable/Drawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    .line 202
    return-void
.end method

.method public setAlpha(I)V
    .registers 3
    .param p1, "alpha"    # I

    .prologue
    .line 144
    iget-object v0, p0, Lcom/rey/material/drawable/ArrowDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 145
    return-void
.end method

.method public setAnimationDuration(I)V
    .registers 2
    .param p1, "duration"    # I

    .prologue
    .line 63
    iput p1, p0, Lcom/rey/material/drawable/ArrowDrawable;->mAnimDuration:I

    .line 64
    return-void
.end method

.method public setArrowSize(I)V
    .registers 3
    .param p1, "size"    # I

    .prologue
    .line 75
    iget v0, p0, Lcom/rey/material/drawable/ArrowDrawable;->mSize:I

    if-eq v0, p1, :cond_9

    .line 76
    iput p1, p0, Lcom/rey/material/drawable/ArrowDrawable;->mSize:I

    .line 77
    invoke-virtual {p0}, Lcom/rey/material/drawable/ArrowDrawable;->invalidateSelf()V

    .line 79
    :cond_9
    return-void
.end method

.method public setClockwise(Z)V
    .registers 2
    .param p1, "clockwise"    # Z

    .prologue
    .line 71
    iput-boolean p1, p0, Lcom/rey/material/drawable/ArrowDrawable;->mClockwise:Z

    .line 72
    return-void
.end method

.method public setColor(Landroid/content/res/ColorStateList;)V
    .registers 3
    .param p1, "colorStateList"    # Landroid/content/res/ColorStateList;

    .prologue
    .line 58
    iput-object p1, p0, Lcom/rey/material/drawable/ArrowDrawable;->mColorStateList:Landroid/content/res/ColorStateList;

    .line 59
    invoke-virtual {p0}, Lcom/rey/material/drawable/ArrowDrawable;->getState()[I

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/rey/material/drawable/ArrowDrawable;->onStateChange([I)Z

    .line 60
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3
    .param p1, "cf"    # Landroid/graphics/ColorFilter;

    .prologue
    .line 149
    iget-object v0, p0, Lcom/rey/material/drawable/ArrowDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 150
    return-void
.end method

.method public setInterpolator(Landroid/view/animation/Interpolator;)V
    .registers 2
    .param p1, "interpolator"    # Landroid/view/animation/Interpolator;

    .prologue
    .line 67
    iput-object p1, p0, Lcom/rey/material/drawable/ArrowDrawable;->mInterpolator:Landroid/view/animation/Interpolator;

    .line 68
    return-void
.end method

.method public setMode(IZ)V
    .registers 4
    .param p1, "mode"    # I
    .param p2, "animation"    # Z

    .prologue
    .line 82
    iget v0, p0, Lcom/rey/material/drawable/ArrowDrawable;->mMode:I

    if-eq v0, p1, :cond_f

    .line 83
    iput p1, p0, Lcom/rey/material/drawable/ArrowDrawable;->mMode:I

    .line 84
    if-eqz p2, :cond_10

    iget v0, p0, Lcom/rey/material/drawable/ArrowDrawable;->mAnimDuration:I

    if-lez v0, :cond_10

    .line 85
    invoke-virtual {p0}, Lcom/rey/material/drawable/ArrowDrawable;->start()V

    .line 89
    :cond_f
    :goto_f
    return-void

    .line 87
    :cond_10
    invoke-virtual {p0}, Lcom/rey/material/drawable/ArrowDrawable;->invalidateSelf()V

    goto :goto_f
.end method

.method public start()V
    .registers 6

    .prologue
    .line 181
    invoke-direct {p0}, Lcom/rey/material/drawable/ArrowDrawable;->resetAnimation()V

    .line 182
    iget-object v0, p0, Lcom/rey/material/drawable/ArrowDrawable;->mUpdater:Ljava/lang/Runnable;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    const-wide/16 v3, 0x10

    add-long/2addr v1, v3

    invoke-virtual {p0, v0, v1, v2}, Lcom/rey/material/drawable/ArrowDrawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    .line 183
    invoke-virtual {p0}, Lcom/rey/material/drawable/ArrowDrawable;->invalidateSelf()V

    .line 184
    return-void
.end method

.method public stop()V
    .registers 2

    .prologue
    .line 188
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/rey/material/drawable/ArrowDrawable;->mRunning:Z

    .line 189
    iget-object v0, p0, Lcom/rey/material/drawable/ArrowDrawable;->mUpdater:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/rey/material/drawable/ArrowDrawable;->unscheduleSelf(Ljava/lang/Runnable;)V

    .line 190
    invoke-virtual {p0}, Lcom/rey/material/drawable/ArrowDrawable;->invalidateSelf()V

    .line 191
    return-void
.end method
