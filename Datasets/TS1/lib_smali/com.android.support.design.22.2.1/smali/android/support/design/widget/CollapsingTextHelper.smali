.class final Landroid/support/design/widget/CollapsingTextHelper;
.super Ljava/lang/Object;
.source "CollapsingTextHelper.java"


# static fields
.field private static final DEBUG_DRAW:Z

.field private static final DEBUG_DRAW_PAINT:Landroid/graphics/Paint;

.field private static final USE_SCALING_TEXTURE:Z


# instance fields
.field private final mCollapsedBounds:Landroid/graphics/Rect;

.field private mCollapsedTextColor:I

.field private mCollapsedTextSize:F

.field private mCollapsedTextVerticalGravity:I

.field private mCollapsedTop:F

.field private mCurrentLeft:F

.field private mCurrentRight:F

.field private mCurrentTextSize:F

.field private mCurrentTop:F

.field private final mExpandedBounds:Landroid/graphics/Rect;

.field private mExpandedFraction:F

.field private mExpandedTextColor:I

.field private mExpandedTextSize:F

.field private mExpandedTextVerticalGravity:I

.field private mExpandedTitleTexture:Landroid/graphics/Bitmap;

.field private mExpandedTop:F

.field private mIsRtl:Z

.field private mPositionInterpolator:Landroid/view/animation/Interpolator;

.field private mScale:F

.field private mText:Ljava/lang/CharSequence;

.field private final mTextPaint:Landroid/text/TextPaint;

.field private mTextSizeInterpolator:Landroid/view/animation/Interpolator;

.field private mTextToDraw:Ljava/lang/CharSequence;

.field private mTextWidth:F

.field private mTextureAscent:F

.field private mTextureDescent:F

.field private mTexturePaint:Landroid/graphics/Paint;

.field private mUseTexture:Z

.field private final mView:Landroid/view/View;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    const/4 v1, 0x1

    .line 39
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x12

    if-ge v0, v2, :cond_1f

    move v0, v1

    :goto_8
    sput-boolean v0, Landroid/support/design/widget/CollapsingTextHelper;->USE_SCALING_TEXTURE:Z

    .line 44
    const/4 v0, 0x0

    sput-object v0, Landroid/support/design/widget/CollapsingTextHelper;->DEBUG_DRAW_PAINT:Landroid/graphics/Paint;

    .line 45
    sget-object v0, Landroid/support/design/widget/CollapsingTextHelper;->DEBUG_DRAW_PAINT:Landroid/graphics/Paint;

    if-eqz v0, :cond_1e

    .line 46
    sget-object v0, Landroid/support/design/widget/CollapsingTextHelper;->DEBUG_DRAW_PAINT:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 47
    sget-object v0, Landroid/support/design/widget/CollapsingTextHelper;->DEBUG_DRAW_PAINT:Landroid/graphics/Paint;

    const v1, -0xff01

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 49
    :cond_1e
    return-void

    .line 39
    :cond_1f
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public constructor <init>(Landroid/view/View;)V
    .registers 4
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const/16 v0, 0x10

    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    iput v0, p0, Landroid/support/design/widget/CollapsingTextHelper;->mExpandedTextVerticalGravity:I

    .line 58
    iput v0, p0, Landroid/support/design/widget/CollapsingTextHelper;->mCollapsedTextVerticalGravity:I

    .line 90
    iput-object p1, p0, Landroid/support/design/widget/CollapsingTextHelper;->mView:Landroid/view/View;

    .line 92
    new-instance v0, Landroid/text/TextPaint;

    invoke-direct {v0}, Landroid/text/TextPaint;-><init>()V

    iput-object v0, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTextPaint:Landroid/text/TextPaint;

    .line 93
    iget-object v0, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTextPaint:Landroid/text/TextPaint;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->setAntiAlias(Z)V

    .line 95
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroid/support/design/widget/CollapsingTextHelper;->mCollapsedBounds:Landroid/graphics/Rect;

    .line 96
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroid/support/design/widget/CollapsingTextHelper;->mExpandedBounds:Landroid/graphics/Rect;

    .line 97
    return-void
.end method

.method private static blendColors(IIF)I
    .registers 12
    .param p0, "color1"    # I
    .param p1, "color2"    # I
    .param p2, "ratio"    # F

    .prologue
    .line 483
    const/high16 v5, 0x3f800000    # 1.0f

    sub-float v3, v5, p2

    .line 484
    .local v3, "inverseRatio":F
    invoke-static {p0}, Landroid/graphics/Color;->alpha(I)I

    move-result v5

    int-to-float v5, v5

    mul-float/2addr v5, v3

    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    move-result v6

    int-to-float v6, v6

    mul-float/2addr v6, p2

    add-float v0, v5, v6

    .line 485
    .local v0, "a":F
    invoke-static {p0}, Landroid/graphics/Color;->red(I)I

    move-result v5

    int-to-float v5, v5

    mul-float/2addr v5, v3

    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    move-result v6

    int-to-float v6, v6

    mul-float/2addr v6, p2

    add-float v4, v5, v6

    .line 486
    .local v4, "r":F
    invoke-static {p0}, Landroid/graphics/Color;->green(I)I

    move-result v5

    int-to-float v5, v5

    mul-float/2addr v5, v3

    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    move-result v6

    int-to-float v6, v6

    mul-float/2addr v6, p2

    add-float v2, v5, v6

    .line 487
    .local v2, "g":F
    invoke-static {p0}, Landroid/graphics/Color;->blue(I)I

    move-result v5

    int-to-float v5, v5

    mul-float/2addr v5, v3

    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    move-result v6

    int-to-float v6, v6

    mul-float/2addr v6, p2

    add-float v1, v5, v6

    .line 488
    .local v1, "b":F
    float-to-int v5, v0

    float-to-int v6, v4

    float-to-int v7, v2

    float-to-int v8, v1

    invoke-static {v5, v6, v7, v8}, Landroid/graphics/Color;->argb(IIII)I

    move-result v5

    return v5
.end method

.method private calculateBaselines()V
    .registers 6

    .prologue
    const/high16 v4, 0x40000000    # 2.0f

    .line 243
    iget-object v2, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTextPaint:Landroid/text/TextPaint;

    iget v3, p0, Landroid/support/design/widget/CollapsingTextHelper;->mCollapsedTextSize:F

    invoke-virtual {v2, v3}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 244
    iget v2, p0, Landroid/support/design/widget/CollapsingTextHelper;->mCollapsedTextVerticalGravity:I

    sparse-switch v2, :sswitch_data_a0

    .line 253
    iget-object v2, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTextPaint:Landroid/text/TextPaint;

    invoke-virtual {v2}, Landroid/text/TextPaint;->descent()F

    move-result v2

    iget-object v3, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTextPaint:Landroid/text/TextPaint;

    invoke-virtual {v3}, Landroid/text/TextPaint;->ascent()F

    move-result v3

    sub-float v0, v2, v3

    .line 254
    .local v0, "textHeight":F
    div-float v2, v0, v4

    iget-object v3, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTextPaint:Landroid/text/TextPaint;

    invoke-virtual {v3}, Landroid/text/TextPaint;->descent()F

    move-result v3

    sub-float v1, v2, v3

    .line 255
    .local v1, "textOffset":F
    iget-object v2, p0, Landroid/support/design/widget/CollapsingTextHelper;->mCollapsedBounds:Landroid/graphics/Rect;

    invoke-virtual {v2}, Landroid/graphics/Rect;->centerY()I

    move-result v2

    int-to-float v2, v2

    add-float/2addr v2, v1

    iput v2, p0, Landroid/support/design/widget/CollapsingTextHelper;->mCollapsedTop:F

    .line 259
    .end local v0    # "textHeight":F
    .end local v1    # "textOffset":F
    :goto_30
    iget-object v2, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTextPaint:Landroid/text/TextPaint;

    iget v3, p0, Landroid/support/design/widget/CollapsingTextHelper;->mExpandedTextSize:F

    invoke-virtual {v2, v3}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 260
    iget v2, p0, Landroid/support/design/widget/CollapsingTextHelper;->mExpandedTextVerticalGravity:I

    sparse-switch v2, :sswitch_data_aa

    .line 269
    iget-object v2, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTextPaint:Landroid/text/TextPaint;

    invoke-virtual {v2}, Landroid/text/TextPaint;->descent()F

    move-result v2

    iget-object v3, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTextPaint:Landroid/text/TextPaint;

    invoke-virtual {v3}, Landroid/text/TextPaint;->ascent()F

    move-result v3

    sub-float v0, v2, v3

    .line 270
    .restart local v0    # "textHeight":F
    div-float v2, v0, v4

    iget-object v3, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTextPaint:Landroid/text/TextPaint;

    invoke-virtual {v3}, Landroid/text/TextPaint;->descent()F

    move-result v3

    sub-float v1, v2, v3

    .line 271
    .restart local v1    # "textOffset":F
    iget-object v2, p0, Landroid/support/design/widget/CollapsingTextHelper;->mExpandedBounds:Landroid/graphics/Rect;

    invoke-virtual {v2}, Landroid/graphics/Rect;->centerY()I

    move-result v2

    int-to-float v2, v2

    add-float/2addr v2, v1

    iput v2, p0, Landroid/support/design/widget/CollapsingTextHelper;->mExpandedTop:F

    .line 274
    .end local v0    # "textHeight":F
    .end local v1    # "textOffset":F
    :goto_5e
    iget-object v2, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTextPaint:Landroid/text/TextPaint;

    invoke-virtual {v2}, Landroid/text/TextPaint;->ascent()F

    move-result v2

    iput v2, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTextureAscent:F

    .line 275
    iget-object v2, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTextPaint:Landroid/text/TextPaint;

    invoke-virtual {v2}, Landroid/text/TextPaint;->descent()F

    move-result v2

    iput v2, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTextureDescent:F

    .line 278
    invoke-direct {p0}, Landroid/support/design/widget/CollapsingTextHelper;->clearTexture()V

    .line 279
    return-void

    .line 246
    :sswitch_72
    iget-object v2, p0, Landroid/support/design/widget/CollapsingTextHelper;->mCollapsedBounds:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    int-to-float v2, v2

    iput v2, p0, Landroid/support/design/widget/CollapsingTextHelper;->mCollapsedTop:F

    goto :goto_30

    .line 249
    :sswitch_7a
    iget-object v2, p0, Landroid/support/design/widget/CollapsingTextHelper;->mCollapsedBounds:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->top:I

    int-to-float v2, v2

    iget-object v3, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTextPaint:Landroid/text/TextPaint;

    invoke-virtual {v3}, Landroid/text/TextPaint;->ascent()F

    move-result v3

    sub-float/2addr v2, v3

    iput v2, p0, Landroid/support/design/widget/CollapsingTextHelper;->mCollapsedTop:F

    goto :goto_30

    .line 262
    :sswitch_89
    iget-object v2, p0, Landroid/support/design/widget/CollapsingTextHelper;->mExpandedBounds:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    int-to-float v2, v2

    iput v2, p0, Landroid/support/design/widget/CollapsingTextHelper;->mExpandedTop:F

    goto :goto_5e

    .line 265
    :sswitch_91
    iget-object v2, p0, Landroid/support/design/widget/CollapsingTextHelper;->mExpandedBounds:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->top:I

    int-to-float v2, v2

    iget-object v3, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTextPaint:Landroid/text/TextPaint;

    invoke-virtual {v3}, Landroid/text/TextPaint;->ascent()F

    move-result v3

    sub-float/2addr v2, v3

    iput v2, p0, Landroid/support/design/widget/CollapsingTextHelper;->mExpandedTop:F

    goto :goto_5e

    .line 244
    :sswitch_data_a0
    .sparse-switch
        0x30 -> :sswitch_7a
        0x50 -> :sswitch_72
    .end sparse-switch

    .line 260
    :sswitch_data_aa
    .sparse-switch
        0x30 -> :sswitch_91
        0x50 -> :sswitch_89
    .end sparse-switch
.end method

.method private calculateIsRtl(Ljava/lang/CharSequence;)Z
    .registers 6
    .param p1, "text"    # Ljava/lang/CharSequence;

    .prologue
    const/4 v0, 0x1

    const/4 v2, 0x0

    .line 336
    iget-object v1, p0, Landroid/support/design/widget/CollapsingTextHelper;->mView:Landroid/view/View;

    invoke-static {v1}, Landroid/support/v4/view/ViewCompat;->getLayoutDirection(Landroid/view/View;)I

    move-result v1

    if-ne v1, v0, :cond_17

    .line 338
    .local v0, "defaultIsRtl":Z
    :goto_a
    if-eqz v0, :cond_19

    sget-object v1, Landroid/support/v4/text/TextDirectionHeuristicsCompat;->FIRSTSTRONG_RTL:Landroid/support/v4/text/TextDirectionHeuristicCompat;

    :goto_e
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v3

    invoke-interface {v1, p1, v2, v3}, Landroid/support/v4/text/TextDirectionHeuristicCompat;->isRtl(Ljava/lang/CharSequence;II)Z

    move-result v1

    return v1

    .end local v0    # "defaultIsRtl":Z
    :cond_17
    move v0, v2

    .line 336
    goto :goto_a

    .line 338
    .restart local v0    # "defaultIsRtl":Z
    :cond_19
    sget-object v1, Landroid/support/v4/text/TextDirectionHeuristicsCompat;->FIRSTSTRONG_LTR:Landroid/support/v4/text/TextDirectionHeuristicCompat;

    goto :goto_e
.end method

.method private calculateOffsets()V
    .registers 5

    .prologue
    .line 220
    iget v0, p0, Landroid/support/design/widget/CollapsingTextHelper;->mExpandedFraction:F

    .line 222
    .local v0, "fraction":F
    iget-object v1, p0, Landroid/support/design/widget/CollapsingTextHelper;->mExpandedBounds:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->left:I

    int-to-float v1, v1

    iget-object v2, p0, Landroid/support/design/widget/CollapsingTextHelper;->mCollapsedBounds:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->left:I

    int-to-float v2, v2

    iget-object v3, p0, Landroid/support/design/widget/CollapsingTextHelper;->mPositionInterpolator:Landroid/view/animation/Interpolator;

    invoke-static {v1, v2, v0, v3}, Landroid/support/design/widget/CollapsingTextHelper;->interpolate(FFFLandroid/view/animation/Interpolator;)F

    move-result v1

    iput v1, p0, Landroid/support/design/widget/CollapsingTextHelper;->mCurrentLeft:F

    .line 224
    iget v1, p0, Landroid/support/design/widget/CollapsingTextHelper;->mExpandedTop:F

    iget v2, p0, Landroid/support/design/widget/CollapsingTextHelper;->mCollapsedTop:F

    iget-object v3, p0, Landroid/support/design/widget/CollapsingTextHelper;->mPositionInterpolator:Landroid/view/animation/Interpolator;

    invoke-static {v1, v2, v0, v3}, Landroid/support/design/widget/CollapsingTextHelper;->interpolate(FFFLandroid/view/animation/Interpolator;)F

    move-result v1

    iput v1, p0, Landroid/support/design/widget/CollapsingTextHelper;->mCurrentTop:F

    .line 225
    iget-object v1, p0, Landroid/support/design/widget/CollapsingTextHelper;->mExpandedBounds:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->right:I

    int-to-float v1, v1

    iget-object v2, p0, Landroid/support/design/widget/CollapsingTextHelper;->mCollapsedBounds:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->right:I

    int-to-float v2, v2

    iget-object v3, p0, Landroid/support/design/widget/CollapsingTextHelper;->mPositionInterpolator:Landroid/view/animation/Interpolator;

    invoke-static {v1, v2, v0, v3}, Landroid/support/design/widget/CollapsingTextHelper;->interpolate(FFFLandroid/view/animation/Interpolator;)F

    move-result v1

    iput v1, p0, Landroid/support/design/widget/CollapsingTextHelper;->mCurrentRight:F

    .line 227
    iget v1, p0, Landroid/support/design/widget/CollapsingTextHelper;->mExpandedTextSize:F

    iget v2, p0, Landroid/support/design/widget/CollapsingTextHelper;->mCollapsedTextSize:F

    iget-object v3, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTextSizeInterpolator:Landroid/view/animation/Interpolator;

    invoke-static {v1, v2, v0, v3}, Landroid/support/design/widget/CollapsingTextHelper;->interpolate(FFFLandroid/view/animation/Interpolator;)F

    move-result v1

    invoke-direct {p0, v1}, Landroid/support/design/widget/CollapsingTextHelper;->setInterpolatedTextSize(F)V

    .line 230
    iget v1, p0, Landroid/support/design/widget/CollapsingTextHelper;->mCollapsedTextColor:I

    iget v2, p0, Landroid/support/design/widget/CollapsingTextHelper;->mExpandedTextColor:I

    if-eq v1, v2, :cond_58

    .line 233
    iget-object v1, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTextPaint:Landroid/text/TextPaint;

    iget v2, p0, Landroid/support/design/widget/CollapsingTextHelper;->mExpandedTextColor:I

    iget v3, p0, Landroid/support/design/widget/CollapsingTextHelper;->mCollapsedTextColor:I

    invoke-static {v2, v3, v0}, Landroid/support/design/widget/CollapsingTextHelper;->blendColors(IIF)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/text/TextPaint;->setColor(I)V

    .line 238
    :goto_52
    iget-object v1, p0, Landroid/support/design/widget/CollapsingTextHelper;->mView:Landroid/view/View;

    invoke-static {v1}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    .line 239
    return-void

    .line 235
    :cond_58
    iget-object v1, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTextPaint:Landroid/text/TextPaint;

    iget v2, p0, Landroid/support/design/widget/CollapsingTextHelper;->mCollapsedTextColor:I

    invoke-virtual {v1, v2}, Landroid/text/TextPaint;->setColor(I)V

    goto :goto_52
.end method

.method private clearTexture()V
    .registers 2

    .prologue
    .line 454
    iget-object v0, p0, Landroid/support/design/widget/CollapsingTextHelper;->mExpandedTitleTexture:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_c

    .line 455
    iget-object v0, p0, Landroid/support/design/widget/CollapsingTextHelper;->mExpandedTitleTexture:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 456
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/design/widget/CollapsingTextHelper;->mExpandedTitleTexture:Landroid/graphics/Bitmap;

    .line 458
    :cond_c
    return-void
.end method

.method private ensureExpandedTexture()V
    .registers 11

    .prologue
    const/4 v9, 0x1

    const/4 v2, 0x0

    .line 397
    iget-object v1, p0, Landroid/support/design/widget/CollapsingTextHelper;->mExpandedTitleTexture:Landroid/graphics/Bitmap;

    if-nez v1, :cond_16

    iget-object v1, p0, Landroid/support/design/widget/CollapsingTextHelper;->mExpandedBounds:Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_16

    iget-object v1, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTextToDraw:Ljava/lang/CharSequence;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_17

    .line 424
    :cond_16
    :goto_16
    return-void

    .line 402
    :cond_17
    iget-object v1, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTextPaint:Landroid/text/TextPaint;

    iget v3, p0, Landroid/support/design/widget/CollapsingTextHelper;->mExpandedTextSize:F

    invoke-virtual {v1, v3}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 403
    iget-object v1, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTextPaint:Landroid/text/TextPaint;

    iget v3, p0, Landroid/support/design/widget/CollapsingTextHelper;->mExpandedTextColor:I

    invoke-virtual {v1, v3}, Landroid/text/TextPaint;->setColor(I)V

    .line 405
    iget-object v1, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTextPaint:Landroid/text/TextPaint;

    iget-object v3, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTextToDraw:Ljava/lang/CharSequence;

    iget-object v4, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTextToDraw:Ljava/lang/CharSequence;

    invoke-interface {v4}, Ljava/lang/CharSequence;->length()I

    move-result v4

    invoke-virtual {v1, v3, v2, v4}, Landroid/text/TextPaint;->measureText(Ljava/lang/CharSequence;II)F

    move-result v1

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v8

    .line 406
    .local v8, "w":I
    iget-object v1, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTextPaint:Landroid/text/TextPaint;

    invoke-virtual {v1}, Landroid/text/TextPaint;->descent()F

    move-result v1

    iget-object v3, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTextPaint:Landroid/text/TextPaint;

    invoke-virtual {v3}, Landroid/text/TextPaint;->ascent()F

    move-result v3

    sub-float/2addr v1, v3

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v7

    .line 407
    .local v7, "h":I
    int-to-float v1, v8

    iput v1, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTextWidth:F

    .line 409
    if-gtz v8, :cond_4f

    if-lez v7, :cond_16

    .line 413
    :cond_4f
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v8, v7, v1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, p0, Landroid/support/design/widget/CollapsingTextHelper;->mExpandedTitleTexture:Landroid/graphics/Bitmap;

    .line 415
    new-instance v0, Landroid/graphics/Canvas;

    iget-object v1, p0, Landroid/support/design/widget/CollapsingTextHelper;->mExpandedTitleTexture:Landroid/graphics/Bitmap;

    invoke-direct {v0, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 416
    .local v0, "c":Landroid/graphics/Canvas;
    iget-object v1, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTextToDraw:Ljava/lang/CharSequence;

    iget-object v3, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTextToDraw:Ljava/lang/CharSequence;

    invoke-interface {v3}, Ljava/lang/CharSequence;->length()I

    move-result v3

    const/4 v4, 0x0

    int-to-float v5, v7

    iget-object v6, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTextPaint:Landroid/text/TextPaint;

    invoke-virtual {v6}, Landroid/text/TextPaint;->descent()F

    move-result v6

    sub-float/2addr v5, v6

    iget-object v6, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTextPaint:Landroid/text/TextPaint;

    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Canvas;->drawText(Ljava/lang/CharSequence;IIFFLandroid/graphics/Paint;)V

    .line 418
    iget-object v1, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTexturePaint:Landroid/graphics/Paint;

    if-nez v1, :cond_16

    .line 420
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    iput-object v1, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTexturePaint:Landroid/graphics/Paint;

    .line 421
    iget-object v1, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTexturePaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v9}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 422
    iget-object v1, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTexturePaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v9}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    goto :goto_16
.end method

.method private static interpolate(FFFLandroid/view/animation/Interpolator;)F
    .registers 5
    .param p0, "startValue"    # F
    .param p1, "endValue"    # F
    .param p2, "fraction"    # F
    .param p3, "interpolator"    # Landroid/view/animation/Interpolator;

    .prologue
    .line 493
    if-eqz p3, :cond_6

    .line 494
    invoke-interface {p3, p2}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result p2

    .line 496
    :cond_6
    invoke-static {p0, p1, p2}, Landroid/support/design/widget/AnimationUtils;->lerp(FFF)F

    move-result v0

    return v0
.end method

.method private static isClose(FF)Z
    .registers 4
    .param p0, "value"    # F
    .param p1, "targetValue"    # F

    .prologue
    .line 465
    sub-float v0, p0, p1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    const v1, 0x3a83126f    # 0.001f

    cmpg-float v0, v0, v1

    if-gez v0, :cond_f

    const/4 v0, 0x1

    :goto_e
    return v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method

.method private setInterpolatedTextSize(F)V
    .registers 12
    .param p1, "textSize"    # F

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    const/high16 v9, 0x3f800000    # 1.0f

    .line 344
    iget-object v6, p0, Landroid/support/design/widget/CollapsingTextHelper;->mText:Ljava/lang/CharSequence;

    if-nez v6, :cond_9

    .line 394
    :goto_8
    return-void

    .line 348
    :cond_9
    const/4 v3, 0x0

    .line 350
    .local v3, "updateDrawText":Z
    iget v6, p0, Landroid/support/design/widget/CollapsingTextHelper;->mCollapsedTextSize:F

    invoke-static {p1, v6}, Landroid/support/design/widget/CollapsingTextHelper;->isClose(FF)Z

    move-result v6

    if-eqz v6, :cond_81

    .line 351
    iget-object v6, p0, Landroid/support/design/widget/CollapsingTextHelper;->mCollapsedBounds:Landroid/graphics/Rect;

    invoke-virtual {v6}, Landroid/graphics/Rect;->width()I

    move-result v6

    int-to-float v0, v6

    .line 352
    .local v0, "availableWidth":F
    iget v1, p0, Landroid/support/design/widget/CollapsingTextHelper;->mCollapsedTextSize:F

    .line 353
    .local v1, "newTextSize":F
    iput v9, p0, Landroid/support/design/widget/CollapsingTextHelper;->mScale:F

    .line 367
    :goto_1d
    const/4 v6, 0x0

    cmpl-float v6, v0, v6

    if-lez v6, :cond_2b

    .line 368
    iget v6, p0, Landroid/support/design/widget/CollapsingTextHelper;->mCurrentTextSize:F

    cmpl-float v6, v6, v1

    if-eqz v6, :cond_9c

    move v3, v4

    .line 369
    :goto_29
    iput v1, p0, Landroid/support/design/widget/CollapsingTextHelper;->mCurrentTextSize:F

    .line 372
    :cond_2b
    iget-object v6, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTextToDraw:Ljava/lang/CharSequence;

    if-eqz v6, :cond_31

    if-eqz v3, :cond_68

    .line 373
    :cond_31
    iget-object v6, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTextPaint:Landroid/text/TextPaint;

    iget v7, p0, Landroid/support/design/widget/CollapsingTextHelper;->mCurrentTextSize:F

    invoke-virtual {v6, v7}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 376
    iget-object v6, p0, Landroid/support/design/widget/CollapsingTextHelper;->mText:Ljava/lang/CharSequence;

    iget-object v7, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTextPaint:Landroid/text/TextPaint;

    sget-object v8, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-static {v6, v7, v0, v8}, Landroid/text/TextUtils;->ellipsize(Ljava/lang/CharSequence;Landroid/text/TextPaint;FLandroid/text/TextUtils$TruncateAt;)Ljava/lang/CharSequence;

    move-result-object v2

    .line 378
    .local v2, "title":Ljava/lang/CharSequence;
    iget-object v6, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTextToDraw:Ljava/lang/CharSequence;

    if-eqz v6, :cond_4e

    iget-object v6, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTextToDraw:Ljava/lang/CharSequence;

    invoke-virtual {v6, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_50

    .line 379
    :cond_4e
    iput-object v2, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTextToDraw:Ljava/lang/CharSequence;

    .line 381
    :cond_50
    iget-object v6, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTextToDraw:Ljava/lang/CharSequence;

    invoke-direct {p0, v6}, Landroid/support/design/widget/CollapsingTextHelper;->calculateIsRtl(Ljava/lang/CharSequence;)Z

    move-result v6

    iput-boolean v6, p0, Landroid/support/design/widget/CollapsingTextHelper;->mIsRtl:Z

    .line 382
    iget-object v6, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTextPaint:Landroid/text/TextPaint;

    iget-object v7, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTextToDraw:Ljava/lang/CharSequence;

    iget-object v8, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTextToDraw:Ljava/lang/CharSequence;

    invoke-interface {v8}, Ljava/lang/CharSequence;->length()I

    move-result v8

    invoke-virtual {v6, v7, v5, v8}, Landroid/text/TextPaint;->measureText(Ljava/lang/CharSequence;II)F

    move-result v6

    iput v6, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTextWidth:F

    .line 386
    .end local v2    # "title":Ljava/lang/CharSequence;
    :cond_68
    sget-boolean v6, Landroid/support/design/widget/CollapsingTextHelper;->USE_SCALING_TEXTURE:Z

    if-eqz v6, :cond_9e

    iget v6, p0, Landroid/support/design/widget/CollapsingTextHelper;->mScale:F

    cmpl-float v6, v6, v9

    if-eqz v6, :cond_9e

    :goto_72
    iput-boolean v4, p0, Landroid/support/design/widget/CollapsingTextHelper;->mUseTexture:Z

    .line 388
    iget-boolean v4, p0, Landroid/support/design/widget/CollapsingTextHelper;->mUseTexture:Z

    if-eqz v4, :cond_7b

    .line 390
    invoke-direct {p0}, Landroid/support/design/widget/CollapsingTextHelper;->ensureExpandedTexture()V

    .line 393
    :cond_7b
    iget-object v4, p0, Landroid/support/design/widget/CollapsingTextHelper;->mView:Landroid/view/View;

    invoke-static {v4}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    goto :goto_8

    .line 355
    .end local v0    # "availableWidth":F
    .end local v1    # "newTextSize":F
    :cond_81
    iget-object v6, p0, Landroid/support/design/widget/CollapsingTextHelper;->mExpandedBounds:Landroid/graphics/Rect;

    invoke-virtual {v6}, Landroid/graphics/Rect;->width()I

    move-result v6

    int-to-float v0, v6

    .line 356
    .restart local v0    # "availableWidth":F
    iget v1, p0, Landroid/support/design/widget/CollapsingTextHelper;->mExpandedTextSize:F

    .line 358
    .restart local v1    # "newTextSize":F
    iget v6, p0, Landroid/support/design/widget/CollapsingTextHelper;->mExpandedTextSize:F

    invoke-static {p1, v6}, Landroid/support/design/widget/CollapsingTextHelper;->isClose(FF)Z

    move-result v6

    if-eqz v6, :cond_95

    .line 360
    iput v9, p0, Landroid/support/design/widget/CollapsingTextHelper;->mScale:F

    goto :goto_1d

    .line 363
    :cond_95
    iget v6, p0, Landroid/support/design/widget/CollapsingTextHelper;->mExpandedTextSize:F

    div-float v6, p1, v6

    iput v6, p0, Landroid/support/design/widget/CollapsingTextHelper;->mScale:F

    goto :goto_1d

    :cond_9c
    move v3, v5

    .line 368
    goto :goto_29

    :cond_9e
    move v4, v5

    .line 386
    goto :goto_72
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 14
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v2, 0x0

    .line 282
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v11

    .line 284
    .local v11, "saveCount":I
    iget-object v0, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTextToDraw:Ljava/lang/CharSequence;

    if-eqz v0, :cond_4f

    .line 285
    iget-boolean v10, p0, Landroid/support/design/widget/CollapsingTextHelper;->mIsRtl:Z

    .line 287
    .local v10, "isRtl":Z
    if-eqz v10, :cond_53

    iget v4, p0, Landroid/support/design/widget/CollapsingTextHelper;->mCurrentRight:F

    .line 288
    .local v4, "x":F
    :goto_f
    iget v5, p0, Landroid/support/design/widget/CollapsingTextHelper;->mCurrentTop:F

    .line 290
    .local v5, "y":F
    iget-boolean v0, p0, Landroid/support/design/widget/CollapsingTextHelper;->mUseTexture:Z

    if-eqz v0, :cond_56

    iget-object v0, p0, Landroid/support/design/widget/CollapsingTextHelper;->mExpandedTitleTexture:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_56

    const/4 v9, 0x1

    .line 296
    .local v9, "drawTexture":Z
    :goto_1a
    iget-object v0, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTextPaint:Landroid/text/TextPaint;

    iget v1, p0, Landroid/support/design/widget/CollapsingTextHelper;->mCurrentTextSize:F

    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 298
    if-eqz v9, :cond_58

    .line 299
    iget v0, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTextureAscent:F

    iget v1, p0, Landroid/support/design/widget/CollapsingTextHelper;->mScale:F

    mul-float v7, v0, v1

    .line 300
    .local v7, "ascent":F
    iget v0, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTextureDescent:F

    iget v1, p0, Landroid/support/design/widget/CollapsingTextHelper;->mScale:F

    mul-float v8, v0, v1

    .line 312
    .local v8, "descent":F
    :goto_2f
    if-eqz v9, :cond_32

    .line 313
    add-float/2addr v5, v7

    .line 316
    :cond_32
    iget v0, p0, Landroid/support/design/widget/CollapsingTextHelper;->mScale:F

    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_41

    .line 317
    iget v0, p0, Landroid/support/design/widget/CollapsingTextHelper;->mScale:F

    iget v1, p0, Landroid/support/design/widget/CollapsingTextHelper;->mScale:F

    invoke-virtual {p1, v0, v1, v4, v5}, Landroid/graphics/Canvas;->scale(FFFF)V

    .line 320
    :cond_41
    if-eqz v10, :cond_46

    .line 321
    iget v0, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTextWidth:F

    sub-float/2addr v4, v0

    .line 324
    :cond_46
    if-eqz v9, :cond_6d

    .line 326
    iget-object v0, p0, Landroid/support/design/widget/CollapsingTextHelper;->mExpandedTitleTexture:Landroid/graphics/Bitmap;

    iget-object v1, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTexturePaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v4, v5, v1}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 332
    .end local v4    # "x":F
    .end local v5    # "y":F
    .end local v7    # "ascent":F
    .end local v8    # "descent":F
    .end local v9    # "drawTexture":Z
    .end local v10    # "isRtl":Z
    :cond_4f
    :goto_4f
    invoke-virtual {p1, v11}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 333
    return-void

    .line 287
    .restart local v10    # "isRtl":Z
    :cond_53
    iget v4, p0, Landroid/support/design/widget/CollapsingTextHelper;->mCurrentLeft:F

    goto :goto_f

    .restart local v4    # "x":F
    .restart local v5    # "y":F
    :cond_56
    move v9, v2

    .line 290
    goto :goto_1a

    .line 302
    .restart local v9    # "drawTexture":Z
    :cond_58
    iget-object v0, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTextPaint:Landroid/text/TextPaint;

    invoke-virtual {v0}, Landroid/text/TextPaint;->ascent()F

    move-result v0

    iget v1, p0, Landroid/support/design/widget/CollapsingTextHelper;->mScale:F

    mul-float v7, v0, v1

    .line 303
    .restart local v7    # "ascent":F
    iget-object v0, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTextPaint:Landroid/text/TextPaint;

    invoke-virtual {v0}, Landroid/text/TextPaint;->descent()F

    move-result v0

    iget v1, p0, Landroid/support/design/widget/CollapsingTextHelper;->mScale:F

    mul-float v8, v0, v1

    .restart local v8    # "descent":F
    goto :goto_2f

    .line 328
    :cond_6d
    iget-object v1, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTextToDraw:Ljava/lang/CharSequence;

    iget-object v0, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTextToDraw:Ljava/lang/CharSequence;

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v3

    iget-object v6, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTextPaint:Landroid/text/TextPaint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Canvas;->drawText(Ljava/lang/CharSequence;IIFFLandroid/graphics/Paint;)V

    goto :goto_4f
.end method

.method getCollapsedTextColor()I
    .registers 2

    .prologue
    .line 473
    iget v0, p0, Landroid/support/design/widget/CollapsingTextHelper;->mCollapsedTextColor:I

    return v0
.end method

.method getCollapsedTextSize()F
    .registers 2

    .prologue
    .line 212
    iget v0, p0, Landroid/support/design/widget/CollapsingTextHelper;->mCollapsedTextSize:F

    return v0
.end method

.method getExpandedTextColor()I
    .registers 2

    .prologue
    .line 469
    iget v0, p0, Landroid/support/design/widget/CollapsingTextHelper;->mExpandedTextColor:I

    return v0
.end method

.method getExpandedTextSize()F
    .registers 2

    .prologue
    .line 216
    iget v0, p0, Landroid/support/design/widget/CollapsingTextHelper;->mExpandedTextSize:F

    return v0
.end method

.method getExpansionFraction()F
    .registers 2

    .prologue
    .line 208
    iget v0, p0, Landroid/support/design/widget/CollapsingTextHelper;->mExpandedFraction:F

    return v0
.end method

.method getText()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 450
    iget-object v0, p0, Landroid/support/design/widget/CollapsingTextHelper;->mText:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public recalculate()V
    .registers 2

    .prologue
    .line 427
    iget-object v0, p0, Landroid/support/design/widget/CollapsingTextHelper;->mView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    if-lez v0, :cond_16

    iget-object v0, p0, Landroid/support/design/widget/CollapsingTextHelper;->mView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v0

    if-lez v0, :cond_16

    .line 430
    invoke-direct {p0}, Landroid/support/design/widget/CollapsingTextHelper;->calculateBaselines()V

    .line 431
    invoke-direct {p0}, Landroid/support/design/widget/CollapsingTextHelper;->calculateOffsets()V

    .line 433
    :cond_16
    return-void
.end method

.method setCollapsedBounds(IIII)V
    .registers 6
    .param p1, "left"    # I
    .param p2, "top"    # I
    .param p3, "right"    # I
    .param p4, "bottom"    # I

    .prologue
    .line 142
    iget-object v0, p0, Landroid/support/design/widget/CollapsingTextHelper;->mCollapsedBounds:Landroid/graphics/Rect;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/graphics/Rect;->set(IIII)V

    .line 143
    return-void
.end method

.method setCollapsedTextAppearance(I)V
    .registers 6
    .param p1, "resId"    # I

    .prologue
    const/4 v3, 0x0

    .line 164
    iget-object v1, p0, Landroid/support/design/widget/CollapsingTextHelper;->mView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    sget-object v2, Landroid/support/design/R$styleable;->TextAppearance:[I

    invoke-virtual {v1, p1, v2}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 165
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v1, Landroid/support/design/R$styleable;->TextAppearance_android_textColor:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_1d

    .line 166
    sget v1, Landroid/support/design/R$styleable;->TextAppearance_android_textColor:I

    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    iput v1, p0, Landroid/support/design/widget/CollapsingTextHelper;->mCollapsedTextColor:I

    .line 168
    :cond_1d
    sget v1, Landroid/support/design/R$styleable;->TextAppearance_android_textSize:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_2e

    .line 169
    sget v1, Landroid/support/design/R$styleable;->TextAppearance_android_textSize:I

    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    int-to-float v1, v1

    iput v1, p0, Landroid/support/design/widget/CollapsingTextHelper;->mCollapsedTextSize:F

    .line 172
    :cond_2e
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 174
    invoke-virtual {p0}, Landroid/support/design/widget/CollapsingTextHelper;->recalculate()V

    .line 175
    return-void
.end method

.method setCollapsedTextColor(I)V
    .registers 3
    .param p1, "textColor"    # I

    .prologue
    .line 124
    iget v0, p0, Landroid/support/design/widget/CollapsingTextHelper;->mCollapsedTextColor:I

    if-eq v0, p1, :cond_9

    .line 125
    iput p1, p0, Landroid/support/design/widget/CollapsingTextHelper;->mCollapsedTextColor:I

    .line 126
    invoke-virtual {p0}, Landroid/support/design/widget/CollapsingTextHelper;->recalculate()V

    .line 128
    :cond_9
    return-void
.end method

.method setCollapsedTextSize(F)V
    .registers 3
    .param p1, "textSize"    # F

    .prologue
    .line 117
    iget v0, p0, Landroid/support/design/widget/CollapsingTextHelper;->mCollapsedTextSize:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_b

    .line 118
    iput p1, p0, Landroid/support/design/widget/CollapsingTextHelper;->mCollapsedTextSize:F

    .line 119
    invoke-virtual {p0}, Landroid/support/design/widget/CollapsingTextHelper;->recalculate()V

    .line 121
    :cond_b
    return-void
.end method

.method setCollapsedTextVerticalGravity(I)V
    .registers 3
    .param p1, "gravity"    # I

    .prologue
    .line 155
    and-int/lit8 p1, p1, 0x70

    .line 157
    iget v0, p0, Landroid/support/design/widget/CollapsingTextHelper;->mCollapsedTextVerticalGravity:I

    if-eq v0, p1, :cond_b

    .line 158
    iput p1, p0, Landroid/support/design/widget/CollapsingTextHelper;->mCollapsedTextVerticalGravity:I

    .line 159
    invoke-virtual {p0}, Landroid/support/design/widget/CollapsingTextHelper;->recalculate()V

    .line 161
    :cond_b
    return-void
.end method

.method setExpandedBounds(IIII)V
    .registers 6
    .param p1, "left"    # I
    .param p2, "top"    # I
    .param p3, "right"    # I
    .param p4, "bottom"    # I

    .prologue
    .line 138
    iget-object v0, p0, Landroid/support/design/widget/CollapsingTextHelper;->mExpandedBounds:Landroid/graphics/Rect;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/graphics/Rect;->set(IIII)V

    .line 139
    return-void
.end method

.method setExpandedTextAppearance(I)V
    .registers 6
    .param p1, "resId"    # I

    .prologue
    const/4 v3, 0x0

    .line 178
    iget-object v1, p0, Landroid/support/design/widget/CollapsingTextHelper;->mView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    sget-object v2, Landroid/support/design/R$styleable;->TextAppearance:[I

    invoke-virtual {v1, p1, v2}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 179
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v1, Landroid/support/design/R$styleable;->TextAppearance_android_textColor:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_1d

    .line 180
    sget v1, Landroid/support/design/R$styleable;->TextAppearance_android_textColor:I

    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    iput v1, p0, Landroid/support/design/widget/CollapsingTextHelper;->mExpandedTextColor:I

    .line 182
    :cond_1d
    sget v1, Landroid/support/design/R$styleable;->TextAppearance_android_textSize:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_2e

    .line 183
    sget v1, Landroid/support/design/R$styleable;->TextAppearance_android_textSize:I

    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    int-to-float v1, v1

    iput v1, p0, Landroid/support/design/widget/CollapsingTextHelper;->mExpandedTextSize:F

    .line 186
    :cond_2e
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 188
    invoke-virtual {p0}, Landroid/support/design/widget/CollapsingTextHelper;->recalculate()V

    .line 189
    return-void
.end method

.method setExpandedTextColor(I)V
    .registers 3
    .param p1, "textColor"    # I

    .prologue
    .line 131
    iget v0, p0, Landroid/support/design/widget/CollapsingTextHelper;->mExpandedTextColor:I

    if-eq v0, p1, :cond_9

    .line 132
    iput p1, p0, Landroid/support/design/widget/CollapsingTextHelper;->mExpandedTextColor:I

    .line 133
    invoke-virtual {p0}, Landroid/support/design/widget/CollapsingTextHelper;->recalculate()V

    .line 135
    :cond_9
    return-void
.end method

.method setExpandedTextSize(F)V
    .registers 3
    .param p1, "textSize"    # F

    .prologue
    .line 110
    iget v0, p0, Landroid/support/design/widget/CollapsingTextHelper;->mExpandedTextSize:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_b

    .line 111
    iput p1, p0, Landroid/support/design/widget/CollapsingTextHelper;->mExpandedTextSize:F

    .line 112
    invoke-virtual {p0}, Landroid/support/design/widget/CollapsingTextHelper;->recalculate()V

    .line 114
    :cond_b
    return-void
.end method

.method setExpandedTextVerticalGravity(I)V
    .registers 3
    .param p1, "gravity"    # I

    .prologue
    .line 146
    and-int/lit8 p1, p1, 0x70

    .line 148
    iget v0, p0, Landroid/support/design/widget/CollapsingTextHelper;->mExpandedTextVerticalGravity:I

    if-eq v0, p1, :cond_b

    .line 149
    iput p1, p0, Landroid/support/design/widget/CollapsingTextHelper;->mExpandedTextVerticalGravity:I

    .line 150
    invoke-virtual {p0}, Landroid/support/design/widget/CollapsingTextHelper;->recalculate()V

    .line 152
    :cond_b
    return-void
.end method

.method setExpansionFraction(F)V
    .registers 4
    .param p1, "fraction"    # F

    .prologue
    .line 199
    const/4 v0, 0x0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {p1, v0, v1}, Landroid/support/design/widget/MathUtils;->constrain(FFF)F

    move-result p1

    .line 201
    iget v0, p0, Landroid/support/design/widget/CollapsingTextHelper;->mExpandedFraction:F

    cmpl-float v0, p1, v0

    if-eqz v0, :cond_12

    .line 202
    iput p1, p0, Landroid/support/design/widget/CollapsingTextHelper;->mExpandedFraction:F

    .line 203
    invoke-direct {p0}, Landroid/support/design/widget/CollapsingTextHelper;->calculateOffsets()V

    .line 205
    :cond_12
    return-void
.end method

.method setPositionInterpolator(Landroid/view/animation/Interpolator;)V
    .registers 2
    .param p1, "interpolator"    # Landroid/view/animation/Interpolator;

    .prologue
    .line 105
    iput-object p1, p0, Landroid/support/design/widget/CollapsingTextHelper;->mPositionInterpolator:Landroid/view/animation/Interpolator;

    .line 106
    invoke-virtual {p0}, Landroid/support/design/widget/CollapsingTextHelper;->recalculate()V

    .line 107
    return-void
.end method

.method setText(Ljava/lang/CharSequence;)V
    .registers 3
    .param p1, "text"    # Ljava/lang/CharSequence;

    .prologue
    .line 441
    if-eqz p1, :cond_a

    iget-object v0, p0, Landroid/support/design/widget/CollapsingTextHelper;->mText:Ljava/lang/CharSequence;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_15

    .line 442
    :cond_a
    iput-object p1, p0, Landroid/support/design/widget/CollapsingTextHelper;->mText:Ljava/lang/CharSequence;

    .line 443
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTextToDraw:Ljava/lang/CharSequence;

    .line 444
    invoke-direct {p0}, Landroid/support/design/widget/CollapsingTextHelper;->clearTexture()V

    .line 445
    invoke-virtual {p0}, Landroid/support/design/widget/CollapsingTextHelper;->recalculate()V

    .line 447
    :cond_15
    return-void
.end method

.method setTextSizeInterpolator(Landroid/view/animation/Interpolator;)V
    .registers 2
    .param p1, "interpolator"    # Landroid/view/animation/Interpolator;

    .prologue
    .line 100
    iput-object p1, p0, Landroid/support/design/widget/CollapsingTextHelper;->mTextSizeInterpolator:Landroid/view/animation/Interpolator;

    .line 101
    invoke-virtual {p0}, Landroid/support/design/widget/CollapsingTextHelper;->recalculate()V

    .line 102
    return-void
.end method
