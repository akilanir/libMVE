.class public Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable;
.super Lme/zhanghai/android/materialprogressbar/IndeterminateProgressDrawableBase;
.source "IndeterminateHorizontalProgressDrawable.java"

# interfaces
.implements Lme/zhanghai/android/materialprogressbar/ShowTrackDrawable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable$RectTransformX;
    }
.end annotation


# static fields
.field private static final PADDED_INTRINSIC_HEIGHT_DP:F = 16.0f

.field private static final PROGRESS_INTRINSIC_HEIGHT_DP:F = 3.2f

.field private static final RECT_1_TRANSFORM_X:Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable$RectTransformX;

.field private static final RECT_2_TRANSFORM_X:Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable$RectTransformX;

.field private static final RECT_BOUND:Landroid/graphics/RectF;

.field private static final RECT_PADDED_BOUND:Landroid/graphics/RectF;

.field private static final RECT_PROGRESS:Landroid/graphics/RectF;


# instance fields
.field private mPaddedIntrinsicHeight:I

.field private mProgressIntrinsicHeight:I

.field private mRect1TransformX:Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable$RectTransformX;

.field private mRect2TransformX:Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable$RectTransformX;

.field private mShowTrack:Z

.field private mTrackAlpha:F


# direct methods
.method static constructor <clinit>()V
    .registers 8

    .prologue
    const/high16 v7, 0x43340000    # 180.0f

    const/high16 v6, 0x3f800000    # 1.0f

    const v5, 0x3dcccccd    # 0.1f

    const/high16 v4, -0x3ccc0000    # -180.0f

    const/high16 v3, -0x40800000    # -1.0f

    .line 25
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0, v4, v3, v7, v6}, Landroid/graphics/RectF;-><init>(FFFF)V

    sput-object v0, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable;->RECT_BOUND:Landroid/graphics/RectF;

    .line 26
    new-instance v0, Landroid/graphics/RectF;

    const/high16 v1, -0x3f600000    # -5.0f

    const/high16 v2, 0x40a00000    # 5.0f

    invoke-direct {v0, v4, v1, v7, v2}, Landroid/graphics/RectF;-><init>(FFFF)V

    sput-object v0, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable;->RECT_PADDED_BOUND:Landroid/graphics/RectF;

    .line 27
    new-instance v0, Landroid/graphics/RectF;

    const/high16 v1, -0x3cf00000    # -144.0f

    const/high16 v2, 0x43100000    # 144.0f

    invoke-direct {v0, v1, v3, v2, v6}, Landroid/graphics/RectF;-><init>(FFFF)V

    sput-object v0, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable;->RECT_PROGRESS:Landroid/graphics/RectF;

    .line 28
    new-instance v0, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable$RectTransformX;

    const v1, -0x3bfd599a    # -522.6f

    invoke-direct {v0, v1, v5}, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable$RectTransformX;-><init>(FF)V

    sput-object v0, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable;->RECT_1_TRANSFORM_X:Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable$RectTransformX;

    .line 29
    new-instance v0, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable$RectTransformX;

    const v1, -0x3cba6666    # -197.6f

    invoke-direct {v0, v1, v5}, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable$RectTransformX;-><init>(FF)V

    sput-object v0, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable;->RECT_2_TRANSFORM_X:Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable$RectTransformX;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v4, 0x1

    .line 45
    invoke-direct {p0, p1}, Lme/zhanghai/android/materialprogressbar/IndeterminateProgressDrawableBase;-><init>(Landroid/content/Context;)V

    .line 33
    iput-boolean v4, p0, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable;->mShowTrack:Z

    .line 36
    new-instance v1, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable$RectTransformX;

    sget-object v2, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable;->RECT_1_TRANSFORM_X:Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable$RectTransformX;

    invoke-direct {v1, v2}, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable$RectTransformX;-><init>(Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable$RectTransformX;)V

    iput-object v1, p0, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable;->mRect1TransformX:Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable$RectTransformX;

    .line 37
    new-instance v1, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable$RectTransformX;

    sget-object v2, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable;->RECT_2_TRANSFORM_X:Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable$RectTransformX;

    invoke-direct {v1, v2}, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable$RectTransformX;-><init>(Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable$RectTransformX;)V

    iput-object v1, p0, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable;->mRect2TransformX:Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable$RectTransformX;

    .line 47
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v0, v1, Landroid/util/DisplayMetrics;->density:F

    .line 48
    .local v0, "density":F
    const v1, 0x404ccccd    # 3.2f

    mul-float/2addr v1, v0

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    iput v1, p0, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable;->mProgressIntrinsicHeight:I

    .line 49
    const/high16 v1, 0x41800000    # 16.0f

    mul-float/2addr v1, v0

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    iput v1, p0, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable;->mPaddedIntrinsicHeight:I

    .line 51
    const v1, 0x1010033

    invoke-static {v1, p1}, Lme/zhanghai/android/materialprogressbar/internal/ThemeUtils;->getFloatFromAttrRes(ILandroid/content/Context;)F

    move-result v1

    iput v1, p0, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable;->mTrackAlpha:F

    .line 53
    const/4 v1, 0x2

    new-array v1, v1, [Landroid/animation/Animator;

    const/4 v2, 0x0

    iget-object v3, p0, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable;->mRect1TransformX:Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable$RectTransformX;

    invoke-static {v3}, Lme/zhanghai/android/materialprogressbar/Animators;->createIndeterminateHorizontalRect1(Ljava/lang/Object;)Landroid/animation/Animator;

    move-result-object v3

    aput-object v3, v1, v2

    iget-object v2, p0, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable;->mRect2TransformX:Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable$RectTransformX;

    invoke-static {v2}, Lme/zhanghai/android/materialprogressbar/Animators;->createIndeterminateHorizontalRect2(Ljava/lang/Object;)Landroid/animation/Animator;

    move-result-object v2

    aput-object v2, v1, v4

    iput-object v1, p0, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable;->mAnimators:[Landroid/animation/Animator;

    .line 57
    return-void
.end method

.method private static drawProgressRect(Landroid/graphics/Canvas;Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable$RectTransformX;Landroid/graphics/Paint;)V
    .registers 6
    .param p0, "canvas"    # Landroid/graphics/Canvas;
    .param p1, "transformX"    # Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable$RectTransformX;
    .param p2, "paint"    # Landroid/graphics/Paint;

    .prologue
    .line 117
    invoke-virtual {p0}, Landroid/graphics/Canvas;->save()I

    move-result v0

    .line 118
    .local v0, "saveCount":I
    iget v1, p1, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable$RectTransformX;->mTranslateX:F

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 119
    iget v1, p1, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable$RectTransformX;->mScaleX:F

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {p0, v1, v2}, Landroid/graphics/Canvas;->scale(FF)V

    .line 121
    sget-object v1, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable;->RECT_PROGRESS:Landroid/graphics/RectF;

    invoke-virtual {p0, v1, p2}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 123
    invoke-virtual {p0, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 124
    return-void
.end method

.method private static drawTrackRect(Landroid/graphics/Canvas;Landroid/graphics/Paint;)V
    .registers 3
    .param p0, "canvas"    # Landroid/graphics/Canvas;
    .param p1, "paint"    # Landroid/graphics/Paint;

    .prologue
    .line 112
    sget-object v0, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable;->RECT_BOUND:Landroid/graphics/RectF;

    invoke-virtual {p0, v0, p1}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 113
    return-void
.end method


# virtual methods
.method public bridge synthetic draw(Landroid/graphics/Canvas;)V
    .registers 2

    .prologue
    .line 20
    invoke-super {p0, p1}, Lme/zhanghai/android/materialprogressbar/IndeterminateProgressDrawableBase;->draw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public bridge synthetic getAlpha()I
    .registers 2

    .prologue
    .line 20
    invoke-super {p0}, Lme/zhanghai/android/materialprogressbar/IndeterminateProgressDrawableBase;->getAlpha()I

    move-result v0

    return v0
.end method

.method public bridge synthetic getColorFilter()Landroid/graphics/ColorFilter;
    .registers 2

    .prologue
    .line 20
    invoke-super {p0}, Lme/zhanghai/android/materialprogressbar/IndeterminateProgressDrawableBase;->getColorFilter()Landroid/graphics/ColorFilter;

    move-result-object v0

    return-object v0
.end method

.method public getIntrinsicHeight()I
    .registers 2

    .prologue
    .line 83
    iget-boolean v0, p0, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable;->mUseIntrinsicPadding:Z

    if-eqz v0, :cond_7

    iget v0, p0, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable;->mPaddedIntrinsicHeight:I

    :goto_6
    return v0

    :cond_7
    iget v0, p0, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable;->mProgressIntrinsicHeight:I

    goto :goto_6
.end method

.method public bridge synthetic getOpacity()I
    .registers 2

    .prologue
    .line 20
    invoke-super {p0}, Lme/zhanghai/android/materialprogressbar/IndeterminateProgressDrawableBase;->getOpacity()I

    move-result v0

    return v0
.end method

.method public getShowTrack()Z
    .registers 2

    .prologue
    .line 64
    iget-boolean v0, p0, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable;->mShowTrack:Z

    return v0
.end method

.method public bridge synthetic getUseIntrinsicPadding()Z
    .registers 2

    .prologue
    .line 20
    invoke-super {p0}, Lme/zhanghai/android/materialprogressbar/IndeterminateProgressDrawableBase;->getUseIntrinsicPadding()Z

    move-result v0

    return v0
.end method

.method public bridge synthetic isAutoMirrored()Z
    .registers 2

    .prologue
    .line 20
    invoke-super {p0}, Lme/zhanghai/android/materialprogressbar/IndeterminateProgressDrawableBase;->isAutoMirrored()Z

    move-result v0

    return v0
.end method

.method public bridge synthetic isRunning()Z
    .registers 2

    .prologue
    .line 20
    invoke-super {p0}, Lme/zhanghai/android/materialprogressbar/IndeterminateProgressDrawableBase;->isRunning()Z

    move-result v0

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

    .line 94
    iget-boolean v0, p0, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable;->mUseIntrinsicPadding:Z

    if-eqz v0, :cond_4e

    .line 95
    int-to-float v0, p2

    sget-object v1, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable;->RECT_PADDED_BOUND:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v1

    div-float/2addr v0, v1

    int-to-float v1, p3

    sget-object v2, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable;->RECT_PADDED_BOUND:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    move-result v2

    div-float/2addr v1, v2

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->scale(FF)V

    .line 96
    sget-object v0, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable;->RECT_PADDED_BOUND:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    div-float/2addr v0, v3

    sget-object v1, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable;->RECT_PADDED_BOUND:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v1

    div-float/2addr v1, v3

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 102
    :goto_2a
    iget-boolean v0, p0, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable;->mShowTrack:Z

    if-eqz v0, :cond_43

    .line 103
    iget v0, p0, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable;->mAlpha:I

    int-to-float v0, v0

    iget v1, p0, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable;->mTrackAlpha:F

    mul-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    invoke-virtual {p4, v0}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 104
    invoke-static {p1, p4}, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable;->drawTrackRect(Landroid/graphics/Canvas;Landroid/graphics/Paint;)V

    .line 105
    iget v0, p0, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable;->mAlpha:I

    invoke-virtual {p4, v0}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 107
    :cond_43
    iget-object v0, p0, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable;->mRect2TransformX:Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable$RectTransformX;

    invoke-static {p1, v0, p4}, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable;->drawProgressRect(Landroid/graphics/Canvas;Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable$RectTransformX;Landroid/graphics/Paint;)V

    .line 108
    iget-object v0, p0, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable;->mRect1TransformX:Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable$RectTransformX;

    invoke-static {p1, v0, p4}, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable;->drawProgressRect(Landroid/graphics/Canvas;Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable$RectTransformX;Landroid/graphics/Paint;)V

    .line 109
    return-void

    .line 98
    :cond_4e
    int-to-float v0, p2

    sget-object v1, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable;->RECT_BOUND:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v1

    div-float/2addr v0, v1

    int-to-float v1, p3

    sget-object v2, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable;->RECT_BOUND:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    move-result v2

    div-float/2addr v1, v2

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->scale(FF)V

    .line 99
    sget-object v0, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable;->RECT_BOUND:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    div-float/2addr v0, v3

    sget-object v1, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable;->RECT_BOUND:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v1

    div-float/2addr v1, v3

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    goto :goto_2a
.end method

.method protected onPreparePaint(Landroid/graphics/Paint;)V
    .registers 3
    .param p1, "paint"    # Landroid/graphics/Paint;

    .prologue
    .line 88
    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 89
    return-void
.end method

.method public bridge synthetic setAlpha(I)V
    .registers 2

    .prologue
    .line 20
    invoke-super {p0, p1}, Lme/zhanghai/android/materialprogressbar/IndeterminateProgressDrawableBase;->setAlpha(I)V

    return-void
.end method

.method public bridge synthetic setAutoMirrored(Z)V
    .registers 2

    .prologue
    .line 20
    invoke-super {p0, p1}, Lme/zhanghai/android/materialprogressbar/IndeterminateProgressDrawableBase;->setAutoMirrored(Z)V

    return-void
.end method

.method public bridge synthetic setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 2
    .param p1    # Landroid/graphics/ColorFilter;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 20
    invoke-super {p0, p1}, Lme/zhanghai/android/materialprogressbar/IndeterminateProgressDrawableBase;->setColorFilter(Landroid/graphics/ColorFilter;)V

    return-void
.end method

.method public setShowTrack(Z)V
    .registers 3
    .param p1, "showTrack"    # Z

    .prologue
    .line 72
    iget-boolean v0, p0, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable;->mShowTrack:Z

    if-eq v0, p1, :cond_9

    .line 73
    iput-boolean p1, p0, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable;->mShowTrack:Z

    .line 74
    invoke-virtual {p0}, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable;->invalidateSelf()V

    .line 76
    :cond_9
    return-void
.end method

.method public bridge synthetic setTint(I)V
    .registers 2
    .param p1    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 20
    invoke-super {p0, p1}, Lme/zhanghai/android/materialprogressbar/IndeterminateProgressDrawableBase;->setTint(I)V

    return-void
.end method

.method public bridge synthetic setTintList(Landroid/content/res/ColorStateList;)V
    .registers 2
    .param p1    # Landroid/content/res/ColorStateList;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 20
    invoke-super {p0, p1}, Lme/zhanghai/android/materialprogressbar/IndeterminateProgressDrawableBase;->setTintList(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public bridge synthetic setTintMode(Landroid/graphics/PorterDuff$Mode;)V
    .registers 2
    .param p1    # Landroid/graphics/PorterDuff$Mode;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 20
    invoke-super {p0, p1}, Lme/zhanghai/android/materialprogressbar/IndeterminateProgressDrawableBase;->setTintMode(Landroid/graphics/PorterDuff$Mode;)V

    return-void
.end method

.method public bridge synthetic setUseIntrinsicPadding(Z)V
    .registers 2

    .prologue
    .line 20
    invoke-super {p0, p1}, Lme/zhanghai/android/materialprogressbar/IndeterminateProgressDrawableBase;->setUseIntrinsicPadding(Z)V

    return-void
.end method

.method public bridge synthetic start()V
    .registers 1

    .prologue
    .line 20
    invoke-super {p0}, Lme/zhanghai/android/materialprogressbar/IndeterminateProgressDrawableBase;->start()V

    return-void
.end method

.method public bridge synthetic stop()V
    .registers 1

    .prologue
    .line 20
    invoke-super {p0}, Lme/zhanghai/android/materialprogressbar/IndeterminateProgressDrawableBase;->stop()V

    return-void
.end method
