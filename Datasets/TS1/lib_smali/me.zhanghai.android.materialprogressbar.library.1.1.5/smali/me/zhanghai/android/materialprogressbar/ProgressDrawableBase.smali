.class abstract Lme/zhanghai/android/materialprogressbar/ProgressDrawableBase;
.super Landroid/graphics/drawable/Drawable;
.source "ProgressDrawableBase.java"

# interfaces
.implements Lme/zhanghai/android/materialprogressbar/IntrinsicPaddingDrawable;
.implements Lme/zhanghai/android/materialprogressbar/TintableDrawable;


# instance fields
.field protected mAlpha:I

.field protected mAutoMirrored:Z

.field protected mColorFilter:Landroid/graphics/ColorFilter;

.field private mPaint:Landroid/graphics/Paint;

.field protected mTintFilter:Landroid/graphics/PorterDuffColorFilter;

.field protected mTintList:Landroid/content/res/ColorStateList;

.field protected mTintMode:Landroid/graphics/PorterDuff$Mode;

.field protected mUseIntrinsicPadding:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x1

    .line 40
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 30
    iput-boolean v2, p0, Lme/zhanghai/android/materialprogressbar/ProgressDrawableBase;->mUseIntrinsicPadding:Z

    .line 32
    const/16 v1, 0xff

    iput v1, p0, Lme/zhanghai/android/materialprogressbar/ProgressDrawableBase;->mAlpha:I

    .line 35
    sget-object v1, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    iput-object v1, p0, Lme/zhanghai/android/materialprogressbar/ProgressDrawableBase;->mTintMode:Landroid/graphics/PorterDuff$Mode;

    .line 41
    invoke-virtual {p0, v2}, Lme/zhanghai/android/materialprogressbar/ProgressDrawableBase;->setAutoMirrored(Z)V

    .line 42
    sget v1, Lme/zhanghai/android/materialprogressbar/R$attr;->colorControlActivated:I

    invoke-static {v1, p1}, Lme/zhanghai/android/materialprogressbar/internal/ThemeUtils;->getColorFromAttrRes(ILandroid/content/Context;)I

    move-result v0

    .line 46
    .local v0, "colorControlActivated":I
    invoke-virtual {p0, v0}, Lme/zhanghai/android/materialprogressbar/ProgressDrawableBase;->setTint(I)V

    .line 47
    return-void
.end method

.method private makeTintFilter(Landroid/content/res/ColorStateList;Landroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuffColorFilter;
    .registers 6
    .param p1, "tint"    # Landroid/content/res/ColorStateList;
    .param p2, "tintMode"    # Landroid/graphics/PorterDuff$Mode;

    .prologue
    .line 150
    if-eqz p1, :cond_4

    if-nez p2, :cond_6

    .line 151
    :cond_4
    const/4 v1, 0x0

    .line 156
    :goto_5
    return-object v1

    .line 154
    :cond_6
    invoke-virtual {p0}, Lme/zhanghai/android/materialprogressbar/ProgressDrawableBase;->getState()[I

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v0

    .line 156
    .local v0, "color":I
    new-instance v1, Landroid/graphics/PorterDuffColorFilter;

    invoke-direct {v1, v0, p2}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    goto :goto_5
.end method

.method private needMirroring()Z
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 203
    iget-boolean v1, p0, Lme/zhanghai/android/materialprogressbar/ProgressDrawableBase;->mAutoMirrored:Z

    if-eqz v1, :cond_c

    invoke-static {p0}, Landroid/support/v4/graphics/drawable/DrawableCompat;->getLayoutDirection(Landroid/graphics/drawable/Drawable;)I

    move-result v1

    if-ne v1, v0, :cond_c

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 8
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 174
    invoke-virtual {p0}, Lme/zhanghai/android/materialprogressbar/ProgressDrawableBase;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    .line 175
    .local v0, "bounds":Landroid/graphics/Rect;
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v3

    if-eqz v3, :cond_10

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v3

    if-nez v3, :cond_11

    .line 200
    :cond_10
    :goto_10
    return-void

    .line 179
    :cond_11
    iget-object v3, p0, Lme/zhanghai/android/materialprogressbar/ProgressDrawableBase;->mPaint:Landroid/graphics/Paint;

    if-nez v3, :cond_2e

    .line 180
    new-instance v3, Landroid/graphics/Paint;

    invoke-direct {v3}, Landroid/graphics/Paint;-><init>()V

    iput-object v3, p0, Lme/zhanghai/android/materialprogressbar/ProgressDrawableBase;->mPaint:Landroid/graphics/Paint;

    .line 181
    iget-object v3, p0, Lme/zhanghai/android/materialprogressbar/ProgressDrawableBase;->mPaint:Landroid/graphics/Paint;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 182
    iget-object v3, p0, Lme/zhanghai/android/materialprogressbar/ProgressDrawableBase;->mPaint:Landroid/graphics/Paint;

    const/high16 v4, -0x1000000

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 183
    iget-object v3, p0, Lme/zhanghai/android/materialprogressbar/ProgressDrawableBase;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p0, v3}, Lme/zhanghai/android/materialprogressbar/ProgressDrawableBase;->onPreparePaint(Landroid/graphics/Paint;)V

    .line 185
    :cond_2e
    iget-object v3, p0, Lme/zhanghai/android/materialprogressbar/ProgressDrawableBase;->mPaint:Landroid/graphics/Paint;

    iget v4, p0, Lme/zhanghai/android/materialprogressbar/ProgressDrawableBase;->mAlpha:I

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 186
    iget-object v3, p0, Lme/zhanghai/android/materialprogressbar/ProgressDrawableBase;->mColorFilter:Landroid/graphics/ColorFilter;

    if-eqz v3, :cond_74

    iget-object v1, p0, Lme/zhanghai/android/materialprogressbar/ProgressDrawableBase;->mColorFilter:Landroid/graphics/ColorFilter;

    .line 187
    .local v1, "colorFilter":Landroid/graphics/ColorFilter;
    :goto_3b
    iget-object v3, p0, Lme/zhanghai/android/materialprogressbar/ProgressDrawableBase;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v3, v1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 189
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v2

    .line 191
    .local v2, "saveCount":I
    iget v3, v0, Landroid/graphics/Rect;->left:I

    int-to-float v3, v3

    iget v4, v0, Landroid/graphics/Rect;->top:I

    int-to-float v4, v4

    invoke-virtual {p1, v3, v4}, Landroid/graphics/Canvas;->translate(FF)V

    .line 192
    invoke-direct {p0}, Lme/zhanghai/android/materialprogressbar/ProgressDrawableBase;->needMirroring()Z

    move-result v3

    if-eqz v3, :cond_63

    .line 193
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v3

    int-to-float v3, v3

    const/4 v4, 0x0

    invoke-virtual {p1, v3, v4}, Landroid/graphics/Canvas;->translate(FF)V

    .line 194
    const/high16 v3, -0x40800000    # -1.0f

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-virtual {p1, v3, v4}, Landroid/graphics/Canvas;->scale(FF)V

    .line 197
    :cond_63
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v3

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v4

    iget-object v5, p0, Lme/zhanghai/android/materialprogressbar/ProgressDrawableBase;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p0, p1, v3, v4, v5}, Lme/zhanghai/android/materialprogressbar/ProgressDrawableBase;->onDraw(Landroid/graphics/Canvas;IILandroid/graphics/Paint;)V

    .line 199
    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->restoreToCount(I)V

    goto :goto_10

    .line 186
    .end local v1    # "colorFilter":Landroid/graphics/ColorFilter;
    .end local v2    # "saveCount":I
    :cond_74
    iget-object v1, p0, Lme/zhanghai/android/materialprogressbar/ProgressDrawableBase;->mTintFilter:Landroid/graphics/PorterDuffColorFilter;

    goto :goto_3b
.end method

.method public getAlpha()I
    .registers 2

    .prologue
    .line 89
    iget v0, p0, Lme/zhanghai/android/materialprogressbar/ProgressDrawableBase;->mAlpha:I

    return v0
.end method

.method public getColorFilter()Landroid/graphics/ColorFilter;
    .registers 2

    .prologue
    .line 108
    iget-object v0, p0, Lme/zhanghai/android/materialprogressbar/ProgressDrawableBase;->mColorFilter:Landroid/graphics/ColorFilter;

    return-object v0
.end method

.method public getOpacity()I
    .registers 2

    .prologue
    .line 165
    const/4 v0, -0x3

    return v0
.end method

.method public getUseIntrinsicPadding()Z
    .registers 2

    .prologue
    .line 54
    iget-boolean v0, p0, Lme/zhanghai/android/materialprogressbar/ProgressDrawableBase;->mUseIntrinsicPadding:Z

    return v0
.end method

.method public isAutoMirrored()Z
    .registers 2

    .prologue
    .line 73
    iget-boolean v0, p0, Lme/zhanghai/android/materialprogressbar/ProgressDrawableBase;->mAutoMirrored:Z

    return v0
.end method

.method protected abstract onDraw(Landroid/graphics/Canvas;IILandroid/graphics/Paint;)V
.end method

.method protected abstract onPreparePaint(Landroid/graphics/Paint;)V
.end method

.method public setAlpha(I)V
    .registers 3
    .param p1, "alpha"    # I

    .prologue
    .line 97
    iget v0, p0, Lme/zhanghai/android/materialprogressbar/ProgressDrawableBase;->mAlpha:I

    if-eq v0, p1, :cond_9

    .line 98
    iput p1, p0, Lme/zhanghai/android/materialprogressbar/ProgressDrawableBase;->mAlpha:I

    .line 99
    invoke-virtual {p0}, Lme/zhanghai/android/materialprogressbar/ProgressDrawableBase;->invalidateSelf()V

    .line 101
    :cond_9
    return-void
.end method

.method public setAutoMirrored(Z)V
    .registers 3
    .param p1, "mirrored"    # Z

    .prologue
    .line 81
    iget-boolean v0, p0, Lme/zhanghai/android/materialprogressbar/ProgressDrawableBase;->mAutoMirrored:Z

    if-eq v0, p1, :cond_9

    .line 82
    iput-boolean p1, p0, Lme/zhanghai/android/materialprogressbar/ProgressDrawableBase;->mAutoMirrored:Z

    .line 83
    invoke-virtual {p0}, Lme/zhanghai/android/materialprogressbar/ProgressDrawableBase;->invalidateSelf()V

    .line 85
    :cond_9
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 2
    .param p1, "colorFilter"    # Landroid/graphics/ColorFilter;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 116
    iput-object p1, p0, Lme/zhanghai/android/materialprogressbar/ProgressDrawableBase;->mColorFilter:Landroid/graphics/ColorFilter;

    .line 117
    invoke-virtual {p0}, Lme/zhanghai/android/materialprogressbar/ProgressDrawableBase;->invalidateSelf()V

    .line 118
    return-void
.end method

.method public setTint(I)V
    .registers 3
    .param p1, "tintColor"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 125
    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {p0, v0}, Lme/zhanghai/android/materialprogressbar/ProgressDrawableBase;->setTintList(Landroid/content/res/ColorStateList;)V

    .line 126
    return-void
.end method

.method public setTintList(Landroid/content/res/ColorStateList;)V
    .registers 4
    .param p1, "tint"    # Landroid/content/res/ColorStateList;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 133
    iput-object p1, p0, Lme/zhanghai/android/materialprogressbar/ProgressDrawableBase;->mTintList:Landroid/content/res/ColorStateList;

    .line 134
    iget-object v0, p0, Lme/zhanghai/android/materialprogressbar/ProgressDrawableBase;->mTintList:Landroid/content/res/ColorStateList;

    iget-object v1, p0, Lme/zhanghai/android/materialprogressbar/ProgressDrawableBase;->mTintMode:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {p0, v0, v1}, Lme/zhanghai/android/materialprogressbar/ProgressDrawableBase;->makeTintFilter(Landroid/content/res/ColorStateList;Landroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuffColorFilter;

    move-result-object v0

    iput-object v0, p0, Lme/zhanghai/android/materialprogressbar/ProgressDrawableBase;->mTintFilter:Landroid/graphics/PorterDuffColorFilter;

    .line 135
    invoke-virtual {p0}, Lme/zhanghai/android/materialprogressbar/ProgressDrawableBase;->invalidateSelf()V

    .line 136
    return-void
.end method

.method public setTintMode(Landroid/graphics/PorterDuff$Mode;)V
    .registers 4
    .param p1, "tintMode"    # Landroid/graphics/PorterDuff$Mode;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 143
    iput-object p1, p0, Lme/zhanghai/android/materialprogressbar/ProgressDrawableBase;->mTintMode:Landroid/graphics/PorterDuff$Mode;

    .line 144
    iget-object v0, p0, Lme/zhanghai/android/materialprogressbar/ProgressDrawableBase;->mTintList:Landroid/content/res/ColorStateList;

    iget-object v1, p0, Lme/zhanghai/android/materialprogressbar/ProgressDrawableBase;->mTintMode:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {p0, v0, v1}, Lme/zhanghai/android/materialprogressbar/ProgressDrawableBase;->makeTintFilter(Landroid/content/res/ColorStateList;Landroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuffColorFilter;

    move-result-object v0

    iput-object v0, p0, Lme/zhanghai/android/materialprogressbar/ProgressDrawableBase;->mTintFilter:Landroid/graphics/PorterDuffColorFilter;

    .line 145
    invoke-virtual {p0}, Lme/zhanghai/android/materialprogressbar/ProgressDrawableBase;->invalidateSelf()V

    .line 146
    return-void
.end method

.method public setUseIntrinsicPadding(Z)V
    .registers 3
    .param p1, "useIntrinsicPadding"    # Z

    .prologue
    .line 62
    iget-boolean v0, p0, Lme/zhanghai/android/materialprogressbar/ProgressDrawableBase;->mUseIntrinsicPadding:Z

    if-eq v0, p1, :cond_9

    .line 63
    iput-boolean p1, p0, Lme/zhanghai/android/materialprogressbar/ProgressDrawableBase;->mUseIntrinsicPadding:Z

    .line 64
    invoke-virtual {p0}, Lme/zhanghai/android/materialprogressbar/ProgressDrawableBase;->invalidateSelf()V

    .line 66
    :cond_9
    return-void
.end method
