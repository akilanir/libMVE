.class Lme/zhanghai/android/materialprogressbar/SingleHorizontalProgressDrawable;
.super Lme/zhanghai/android/materialprogressbar/ProgressDrawableBase;
.source "SingleHorizontalProgressDrawable.java"


# static fields
.field private static final LEVEL_MAX:I = 0x2710

.field private static final PADDED_INTRINSIC_HEIGHT_DP:F = 16.0f

.field private static final PROGRESS_INTRINSIC_HEIGHT_DP:F = 3.2f

.field private static final RECT_BOUND:Landroid/graphics/RectF;

.field private static final RECT_PADDED_BOUND:Landroid/graphics/RectF;


# instance fields
.field private mPaddedIntrinsicHeight:I

.field private mProgressIntrinsicHeight:I

.field private mShowTrack:Z

.field private mTrackAlpha:F


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/high16 v4, 0x43340000    # 180.0f

    const/high16 v3, -0x3ccc0000    # -180.0f

    .line 19
    new-instance v0, Landroid/graphics/RectF;

    const/high16 v1, -0x40800000    # -1.0f

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-direct {v0, v3, v1, v4, v2}, Landroid/graphics/RectF;-><init>(FFFF)V

    sput-object v0, Lme/zhanghai/android/materialprogressbar/SingleHorizontalProgressDrawable;->RECT_BOUND:Landroid/graphics/RectF;

    .line 20
    new-instance v0, Landroid/graphics/RectF;

    const/high16 v1, -0x3f600000    # -5.0f

    const/high16 v2, 0x40a00000    # 5.0f

    invoke-direct {v0, v3, v1, v4, v2}, Landroid/graphics/RectF;-><init>(FFFF)V

    sput-object v0, Lme/zhanghai/android/materialprogressbar/SingleHorizontalProgressDrawable;->RECT_PADDED_BOUND:Landroid/graphics/RectF;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 29
    invoke-direct {p0, p1}, Lme/zhanghai/android/materialprogressbar/ProgressDrawableBase;-><init>(Landroid/content/Context;)V

    .line 25
    const/4 v1, 0x1

    iput-boolean v1, p0, Lme/zhanghai/android/materialprogressbar/SingleHorizontalProgressDrawable;->mShowTrack:Z

    .line 31
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v0, v1, Landroid/util/DisplayMetrics;->density:F

    .line 32
    .local v0, "density":F
    const v1, 0x404ccccd    # 3.2f

    mul-float/2addr v1, v0

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    iput v1, p0, Lme/zhanghai/android/materialprogressbar/SingleHorizontalProgressDrawable;->mProgressIntrinsicHeight:I

    .line 33
    const/high16 v1, 0x41800000    # 16.0f

    mul-float/2addr v1, v0

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    iput v1, p0, Lme/zhanghai/android/materialprogressbar/SingleHorizontalProgressDrawable;->mPaddedIntrinsicHeight:I

    .line 35
    const v1, 0x1010033

    invoke-static {v1, p1}, Lme/zhanghai/android/materialprogressbar/internal/ThemeUtils;->getFloatFromAttrRes(ILandroid/content/Context;)F

    move-result v1

    iput v1, p0, Lme/zhanghai/android/materialprogressbar/SingleHorizontalProgressDrawable;->mTrackAlpha:F

    .line 36
    return-void
.end method

.method private drawProgressRect(Landroid/graphics/Canvas;Landroid/graphics/Paint;)V
    .registers 9
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "paint"    # Landroid/graphics/Paint;

    .prologue
    .line 93
    invoke-virtual {p0}, Lme/zhanghai/android/materialprogressbar/SingleHorizontalProgressDrawable;->getLevel()I

    move-result v0

    .line 94
    .local v0, "level":I
    if-nez v0, :cond_7

    .line 104
    :goto_6
    return-void

    .line 98
    :cond_7
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v1

    .line 99
    .local v1, "saveCount":I
    int-to-float v2, v0

    const v3, 0x461c4000    # 10000.0f

    div-float/2addr v2, v3

    const/high16 v3, 0x3f800000    # 1.0f

    sget-object v4, Lme/zhanghai/android/materialprogressbar/SingleHorizontalProgressDrawable;->RECT_BOUND:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->left:F

    const/4 v5, 0x0

    invoke-virtual {p1, v2, v3, v4, v5}, Landroid/graphics/Canvas;->scale(FFFF)V

    .line 101
    sget-object v2, Lme/zhanghai/android/materialprogressbar/SingleHorizontalProgressDrawable;->RECT_BOUND:Landroid/graphics/RectF;

    invoke-virtual {p1, v2, p2}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 103
    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    goto :goto_6
.end method

.method private static drawTrackRect(Landroid/graphics/Canvas;Landroid/graphics/Paint;)V
    .registers 3
    .param p0, "canvas"    # Landroid/graphics/Canvas;
    .param p1, "paint"    # Landroid/graphics/Paint;

    .prologue
    .line 88
    sget-object v0, Lme/zhanghai/android/materialprogressbar/SingleHorizontalProgressDrawable;->RECT_BOUND:Landroid/graphics/RectF;

    invoke-virtual {p0, v0, p1}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 89
    return-void
.end method


# virtual methods
.method public getIntrinsicHeight()I
    .registers 2

    .prologue
    .line 54
    iget-boolean v0, p0, Lme/zhanghai/android/materialprogressbar/SingleHorizontalProgressDrawable;->mUseIntrinsicPadding:Z

    if-eqz v0, :cond_7

    iget v0, p0, Lme/zhanghai/android/materialprogressbar/SingleHorizontalProgressDrawable;->mPaddedIntrinsicHeight:I

    :goto_6
    return v0

    :cond_7
    iget v0, p0, Lme/zhanghai/android/materialprogressbar/SingleHorizontalProgressDrawable;->mProgressIntrinsicHeight:I

    goto :goto_6
.end method

.method public getShowTrack()Z
    .registers 2

    .prologue
    .line 39
    iget-boolean v0, p0, Lme/zhanghai/android/materialprogressbar/SingleHorizontalProgressDrawable;->mShowTrack:Z

    return v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;IILandroid/graphics/Paint;)V
    .registers 9
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "width"    # I
    .param p3, "height"    # I
    .param p4, "paint"    # Landroid/graphics/Paint;

    .prologue
    const/high16 v3, 0x40000000    # 2.0f

    .line 71
    iget-boolean v0, p0, Lme/zhanghai/android/materialprogressbar/SingleHorizontalProgressDrawable;->mUseIntrinsicPadding:Z

    if-eqz v0, :cond_47

    .line 72
    int-to-float v0, p2

    sget-object v1, Lme/zhanghai/android/materialprogressbar/SingleHorizontalProgressDrawable;->RECT_PADDED_BOUND:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v1

    div-float/2addr v0, v1

    int-to-float v1, p3

    sget-object v2, Lme/zhanghai/android/materialprogressbar/SingleHorizontalProgressDrawable;->RECT_PADDED_BOUND:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    move-result v2

    div-float/2addr v1, v2

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->scale(FF)V

    .line 73
    sget-object v0, Lme/zhanghai/android/materialprogressbar/SingleHorizontalProgressDrawable;->RECT_PADDED_BOUND:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    div-float/2addr v0, v3

    sget-object v1, Lme/zhanghai/android/materialprogressbar/SingleHorizontalProgressDrawable;->RECT_PADDED_BOUND:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v1

    div-float/2addr v1, v3

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 79
    :goto_2a
    iget-boolean v0, p0, Lme/zhanghai/android/materialprogressbar/SingleHorizontalProgressDrawable;->mShowTrack:Z

    if-eqz v0, :cond_43

    .line 80
    iget v0, p0, Lme/zhanghai/android/materialprogressbar/SingleHorizontalProgressDrawable;->mAlpha:I

    int-to-float v0, v0

    iget v1, p0, Lme/zhanghai/android/materialprogressbar/SingleHorizontalProgressDrawable;->mTrackAlpha:F

    mul-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    invoke-virtual {p4, v0}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 81
    invoke-static {p1, p4}, Lme/zhanghai/android/materialprogressbar/SingleHorizontalProgressDrawable;->drawTrackRect(Landroid/graphics/Canvas;Landroid/graphics/Paint;)V

    .line 82
    iget v0, p0, Lme/zhanghai/android/materialprogressbar/SingleHorizontalProgressDrawable;->mAlpha:I

    invoke-virtual {p4, v0}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 84
    :cond_43
    invoke-direct {p0, p1, p4}, Lme/zhanghai/android/materialprogressbar/SingleHorizontalProgressDrawable;->drawProgressRect(Landroid/graphics/Canvas;Landroid/graphics/Paint;)V

    .line 85
    return-void

    .line 75
    :cond_47
    int-to-float v0, p2

    sget-object v1, Lme/zhanghai/android/materialprogressbar/SingleHorizontalProgressDrawable;->RECT_BOUND:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v1

    div-float/2addr v0, v1

    int-to-float v1, p3

    sget-object v2, Lme/zhanghai/android/materialprogressbar/SingleHorizontalProgressDrawable;->RECT_BOUND:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    move-result v2

    div-float/2addr v1, v2

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->scale(FF)V

    .line 76
    sget-object v0, Lme/zhanghai/android/materialprogressbar/SingleHorizontalProgressDrawable;->RECT_BOUND:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    div-float/2addr v0, v3

    sget-object v1, Lme/zhanghai/android/materialprogressbar/SingleHorizontalProgressDrawable;->RECT_BOUND:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v1

    div-float/2addr v1, v3

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    goto :goto_2a
.end method

.method protected onLevelChange(I)Z
    .registers 3
    .param p1, "level"    # I

    .prologue
    .line 59
    invoke-virtual {p0}, Lme/zhanghai/android/materialprogressbar/SingleHorizontalProgressDrawable;->invalidateSelf()V

    .line 60
    const/4 v0, 0x1

    return v0
.end method

.method protected onPreparePaint(Landroid/graphics/Paint;)V
    .registers 3
    .param p1, "paint"    # Landroid/graphics/Paint;

    .prologue
    .line 65
    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 66
    return-void
.end method

.method public setShowTrack(Z)V
    .registers 3
    .param p1, "showTrack"    # Z

    .prologue
    .line 43
    iget-boolean v0, p0, Lme/zhanghai/android/materialprogressbar/SingleHorizontalProgressDrawable;->mShowTrack:Z

    if-eq v0, p1, :cond_9

    .line 44
    iput-boolean p1, p0, Lme/zhanghai/android/materialprogressbar/SingleHorizontalProgressDrawable;->mShowTrack:Z

    .line 45
    invoke-virtual {p0}, Lme/zhanghai/android/materialprogressbar/SingleHorizontalProgressDrawable;->invalidateSelf()V

    .line 47
    :cond_9
    return-void
.end method
