.class public Lcom/mikepenz/materialdrawer/view/BezelImageView;
.super Landroid/widget/ImageView;
.source "BezelImageView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mikepenz/materialdrawer/view/BezelImageView$CustomOutline;
    }
.end annotation


# instance fields
.field private isPressed:Z

.field private isSelected:Z

.field private mBlackPaint:Landroid/graphics/Paint;

.field private mBounds:Landroid/graphics/Rect;

.field private mBoundsF:Landroid/graphics/RectF;

.field private mCacheBitmap:Landroid/graphics/Bitmap;

.field private mCacheValid:Z

.field private mCachedHeight:I

.field private mCachedWidth:I

.field private mDesaturateColorFilter:Landroid/graphics/ColorMatrixColorFilter;

.field private mDrawCircularShadow:Z

.field private mMaskDrawable:Landroid/graphics/drawable/Drawable;

.field private mMaskedPaint:Landroid/graphics/Paint;

.field private mSelectorAlpha:I

.field private mSelectorColor:I

.field private mSelectorFilter:Landroid/graphics/ColorFilter;

.field private mTempDesaturateColorFilter:Landroid/graphics/ColorMatrixColorFilter;

.field private mTempSelectorFilter:Landroid/graphics/ColorFilter;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 84
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/mikepenz/materialdrawer/view/BezelImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 85
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 88
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/mikepenz/materialdrawer/view/BezelImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 89
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 11
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    const/4 v4, 0x0

    const/4 v5, 0x1

    .line 92
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 67
    iput-boolean v5, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mDrawCircularShadow:Z

    .line 71
    const/16 v2, 0x96

    iput v2, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mSelectorAlpha:I

    .line 75
    iput-boolean v4, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mCacheValid:Z

    .line 80
    iput-boolean v4, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->isPressed:Z

    .line 95
    sget-object v2, Lcom/mikepenz/materialdrawer/R$styleable;->BezelImageView:[I

    sget v3, Lcom/mikepenz/materialdrawer/R$style;->BezelImageView:I

    invoke-virtual {p1, p2, v2, p3, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 97
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v2, Lcom/mikepenz/materialdrawer/R$styleable;->BezelImageView_biv_maskDrawable:I

    invoke-virtual {v0, v2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    iput-object v2, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mMaskDrawable:Landroid/graphics/drawable/Drawable;

    .line 98
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mMaskDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v2, :cond_28

    .line 99
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mMaskDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2, p0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 102
    :cond_28
    sget v2, Lcom/mikepenz/materialdrawer/R$styleable;->BezelImageView_biv_drawCircularShadow:I

    invoke-virtual {v0, v2, v5}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v2

    iput-boolean v2, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mDrawCircularShadow:Z

    .line 104
    sget v2, Lcom/mikepenz/materialdrawer/R$styleable;->BezelImageView_biv_selectorOnPress:I

    invoke-virtual {v0, v2, v4}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v2

    iput v2, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mSelectorColor:I

    .line 106
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 109
    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2}, Landroid/graphics/Paint;-><init>()V

    iput-object v2, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mBlackPaint:Landroid/graphics/Paint;

    .line 110
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mBlackPaint:Landroid/graphics/Paint;

    const/high16 v3, -0x1000000

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 112
    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2}, Landroid/graphics/Paint;-><init>()V

    iput-object v2, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mMaskedPaint:Landroid/graphics/Paint;

    .line 113
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mMaskedPaint:Landroid/graphics/Paint;

    new-instance v3, Landroid/graphics/PorterDuffXfermode;

    sget-object v4, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v3, v4}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 116
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v5, v5, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v2

    iput-object v2, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mCacheBitmap:Landroid/graphics/Bitmap;

    .line 119
    new-instance v1, Landroid/graphics/ColorMatrix;

    invoke-direct {v1}, Landroid/graphics/ColorMatrix;-><init>()V

    .line 120
    .local v1, "cm":Landroid/graphics/ColorMatrix;
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/graphics/ColorMatrix;->setSaturation(F)V

    .line 121
    new-instance v2, Landroid/graphics/ColorMatrixColorFilter;

    invoke-direct {v2, v1}, Landroid/graphics/ColorMatrixColorFilter;-><init>(Landroid/graphics/ColorMatrix;)V

    iput-object v2, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mDesaturateColorFilter:Landroid/graphics/ColorMatrixColorFilter;

    .line 124
    iget v2, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mSelectorColor:I

    if-eqz v2, :cond_99

    .line 125
    new-instance v2, Landroid/graphics/PorterDuffColorFilter;

    iget v3, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mSelectorAlpha:I

    iget v4, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mSelectorColor:I

    invoke-static {v4}, Landroid/graphics/Color;->red(I)I

    move-result v4

    iget v5, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mSelectorColor:I

    invoke-static {v5}, Landroid/graphics/Color;->green(I)I

    move-result v5

    iget v6, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mSelectorColor:I

    invoke-static {v6}, Landroid/graphics/Color;->blue(I)I

    move-result v6

    invoke-static {v3, v4, v5, v6}, Landroid/graphics/Color;->argb(IIII)I

    move-result v3

    sget-object v4, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v2, v3, v4}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    iput-object v2, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mSelectorFilter:Landroid/graphics/ColorFilter;

    .line 127
    :cond_99
    return-void
.end method


# virtual methods
.method public disableTouchFeedback(Z)V
    .registers 4
    .param p1, "disable"    # Z

    .prologue
    const/4 v1, 0x0

    .line 335
    if-eqz p1, :cond_10

    .line 336
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mDesaturateColorFilter:Landroid/graphics/ColorMatrixColorFilter;

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mTempDesaturateColorFilter:Landroid/graphics/ColorMatrixColorFilter;

    .line 337
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mSelectorFilter:Landroid/graphics/ColorFilter;

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mTempSelectorFilter:Landroid/graphics/ColorFilter;

    .line 338
    iput-object v1, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mSelectorFilter:Landroid/graphics/ColorFilter;

    .line 339
    iput-object v1, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mDesaturateColorFilter:Landroid/graphics/ColorMatrixColorFilter;

    .line 348
    :cond_f
    :goto_f
    return-void

    .line 341
    :cond_10
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mTempDesaturateColorFilter:Landroid/graphics/ColorMatrixColorFilter;

    if-eqz v0, :cond_18

    .line 342
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mTempDesaturateColorFilter:Landroid/graphics/ColorMatrixColorFilter;

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mDesaturateColorFilter:Landroid/graphics/ColorMatrixColorFilter;

    .line 344
    :cond_18
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mTempSelectorFilter:Landroid/graphics/ColorFilter;

    if-eqz v0, :cond_f

    .line 345
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mTempSelectorFilter:Landroid/graphics/ColorFilter;

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mSelectorFilter:Landroid/graphics/ColorFilter;

    goto :goto_f
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 4
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v1, 0x0

    .line 245
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->isClickable()Z

    move-result v0

    if-nez v0, :cond_e

    .line 246
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->isSelected:Z

    .line 247
    invoke-super {p0, p1}, Landroid/widget/ImageView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    .line 265
    :goto_d
    return v0

    .line 251
    :cond_e
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    packed-switch v0, :pswitch_data_24

    .line 264
    :goto_15
    :pswitch_15
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->invalidate()V

    .line 265
    invoke-super {p0, p1}, Landroid/widget/ImageView;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    goto :goto_d

    .line 253
    :pswitch_1d
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->isSelected:Z

    goto :goto_15

    .line 259
    :pswitch_21
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->isSelected:Z

    goto :goto_15

    .line 251
    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_1d
        :pswitch_21
        :pswitch_15
        :pswitch_21
        :pswitch_21
        :pswitch_15
        :pswitch_15
        :pswitch_15
        :pswitch_21
    .end packed-switch
.end method

.method protected drawableStateChanged()V
    .registers 3

    .prologue
    .line 270
    invoke-super {p0}, Landroid/widget/ImageView;->drawableStateChanged()V

    .line 271
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mMaskDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_18

    iget-object v0, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mMaskDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result v0

    if-eqz v0, :cond_18

    .line 272
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mMaskDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->getDrawableState()[I

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 274
    :cond_18
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->isDuplicateParentStateEnabled()Z

    move-result v0

    if-eqz v0, :cond_21

    .line 275
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    .line 277
    :cond_21
    return-void
.end method

.method public invalidateDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 3
    .param p1, "who"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 281
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mMaskDrawable:Landroid/graphics/drawable/Drawable;

    if-ne p1, v0, :cond_8

    .line 282
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->invalidate()V

    .line 286
    :goto_7
    return-void

    .line 284
    :cond_8
    invoke-super {p0, p1}, Landroid/widget/ImageView;->invalidateDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_7
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 13
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v10, 0x0

    const/16 v9, 0xc

    const/4 v1, 0x0

    .line 174
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mBounds:Landroid/graphics/Rect;

    if-nez v2, :cond_9

    .line 239
    :cond_8
    :goto_8
    return-void

    .line 178
    :cond_9
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v8

    .line 179
    .local v8, "width":I
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v6

    .line 181
    .local v6, "height":I
    if-eqz v8, :cond_8

    if-eqz v6, :cond_8

    .line 185
    iget-boolean v2, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mCacheValid:Z

    if-eqz v2, :cond_2b

    iget v2, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mCachedWidth:I

    if-ne v8, v2, :cond_2b

    iget v2, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mCachedHeight:I

    if-ne v6, v2, :cond_2b

    iget-boolean v2, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->isSelected:Z

    iget-boolean v3, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->isPressed:Z

    if-eq v2, v3, :cond_69

    .line 187
    :cond_2b
    iget v2, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mCachedWidth:I

    if-ne v8, v2, :cond_7f

    iget v2, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mCachedHeight:I

    if-ne v6, v2, :cond_7f

    .line 189
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mCacheBitmap:Landroid/graphics/Bitmap;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/graphics/Bitmap;->eraseColor(I)V

    .line 199
    :goto_39
    new-instance v0, Landroid/graphics/Canvas;

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mCacheBitmap:Landroid/graphics/Bitmap;

    invoke-direct {v0, v2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 200
    .local v0, "cacheCanvas":Landroid/graphics/Canvas;
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mMaskDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v2, :cond_9f

    .line 201
    invoke-virtual {v0}, Landroid/graphics/Canvas;->save()I

    move-result v7

    .line 202
    .local v7, "sc":I
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mMaskDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 203
    iget-boolean v1, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->isSelected:Z

    if-eqz v1, :cond_99

    .line 204
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mSelectorFilter:Landroid/graphics/ColorFilter;

    if-eqz v1, :cond_91

    .line 205
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mMaskedPaint:Landroid/graphics/Paint;

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mSelectorFilter:Landroid/graphics/ColorFilter;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 213
    :goto_5c
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mBoundsF:Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mMaskedPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1, v2, v9}, Landroid/graphics/Canvas;->saveLayer(Landroid/graphics/RectF;Landroid/graphics/Paint;I)I

    .line 215
    invoke-super {p0, v0}, Landroid/widget/ImageView;->onDraw(Landroid/graphics/Canvas;)V

    .line 216
    invoke-virtual {v0, v7}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 235
    .end local v0    # "cacheCanvas":Landroid/graphics/Canvas;
    .end local v7    # "sc":I
    :cond_69
    :goto_69
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mCacheBitmap:Landroid/graphics/Bitmap;

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mBounds:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->left:I

    int-to-float v2, v2

    iget-object v3, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mBounds:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->top:I

    int-to-float v3, v3

    invoke-virtual {p1, v1, v2, v3, v10}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 238
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->isPressed()Z

    move-result v1

    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->isPressed:Z

    goto :goto_8

    .line 192
    :cond_7f
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mCacheBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->recycle()V

    .line 194
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v8, v6, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v2

    iput-object v2, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mCacheBitmap:Landroid/graphics/Bitmap;

    .line 195
    iput v8, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mCachedWidth:I

    .line 196
    iput v6, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mCachedHeight:I

    goto :goto_39

    .line 207
    .restart local v0    # "cacheCanvas":Landroid/graphics/Canvas;
    .restart local v7    # "sc":I
    :cond_91
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mMaskedPaint:Landroid/graphics/Paint;

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mDesaturateColorFilter:Landroid/graphics/ColorMatrixColorFilter;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    goto :goto_5c

    .line 211
    :cond_99
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mMaskedPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v10}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    goto :goto_5c

    .line 217
    .end local v7    # "sc":I
    :cond_9f
    iget-boolean v2, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->isSelected:Z

    if-eqz v2, :cond_d4

    .line 218
    invoke-virtual {v0}, Landroid/graphics/Canvas;->save()I

    move-result v7

    .line 219
    .restart local v7    # "sc":I
    iget v2, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mCachedWidth:I

    int-to-float v3, v2

    iget v2, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mCachedHeight:I

    int-to-float v4, v2

    iget-object v5, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mBlackPaint:Landroid/graphics/Paint;

    move v2, v1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 220
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mSelectorFilter:Landroid/graphics/ColorFilter;

    if-eqz v1, :cond_cc

    .line 221
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mMaskedPaint:Landroid/graphics/Paint;

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mSelectorFilter:Landroid/graphics/ColorFilter;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 225
    :goto_be
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mBoundsF:Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mMaskedPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1, v2, v9}, Landroid/graphics/Canvas;->saveLayer(Landroid/graphics/RectF;Landroid/graphics/Paint;I)I

    .line 227
    invoke-super {p0, v0}, Landroid/widget/ImageView;->onDraw(Landroid/graphics/Canvas;)V

    .line 228
    invoke-virtual {v0, v7}, Landroid/graphics/Canvas;->restoreToCount(I)V

    goto :goto_69

    .line 223
    :cond_cc
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mMaskedPaint:Landroid/graphics/Paint;

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mDesaturateColorFilter:Landroid/graphics/ColorMatrixColorFilter;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    goto :goto_be

    .line 230
    .end local v7    # "sc":I
    :cond_d4
    invoke-super {p0, v0}, Landroid/widget/ImageView;->onDraw(Landroid/graphics/Canvas;)V

    goto :goto_69
.end method

.method protected onSizeChanged(IIII)V
    .registers 7
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "old_w"    # I
    .param p4, "old_h"    # I

    .prologue
    .line 131
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_12

    .line 132
    iget-boolean v0, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mDrawCircularShadow:Z

    if-eqz v0, :cond_12

    .line 133
    new-instance v0, Lcom/mikepenz/materialdrawer/view/BezelImageView$CustomOutline;

    invoke-direct {v0, p0, p1, p2}, Lcom/mikepenz/materialdrawer/view/BezelImageView$CustomOutline;-><init>(Lcom/mikepenz/materialdrawer/view/BezelImageView;II)V

    invoke-virtual {p0, v0}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 136
    :cond_12
    return-void
.end method

.method protected setFrame(IIII)Z
    .registers 10
    .param p1, "l"    # I
    .param p2, "t"    # I
    .param p3, "r"    # I
    .param p4, "b"    # I

    .prologue
    const/4 v4, 0x0

    .line 157
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/ImageView;->setFrame(IIII)Z

    move-result v0

    .line 158
    .local v0, "changed":Z
    new-instance v1, Landroid/graphics/Rect;

    sub-int v2, p3, p1

    sub-int v3, p4, p2

    invoke-direct {v1, v4, v4, v2, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object v1, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mBounds:Landroid/graphics/Rect;

    .line 159
    new-instance v1, Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mBounds:Landroid/graphics/Rect;

    invoke-direct {v1, v2}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    iput-object v1, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mBoundsF:Landroid/graphics/RectF;

    .line 161
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mMaskDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_24

    .line 162
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mMaskDrawable:Landroid/graphics/drawable/Drawable;

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 165
    :cond_24
    if-eqz v0, :cond_28

    .line 166
    iput-boolean v4, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mCacheValid:Z

    .line 169
    :cond_28
    return v0
.end method

.method public setImageBitmap(Landroid/graphics/Bitmap;)V
    .registers 2
    .param p1, "bm"    # Landroid/graphics/Bitmap;

    .prologue
    .line 319
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 320
    return-void
.end method

.method public setImageDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 2
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 309
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 310
    return-void
.end method

.method public setImageResource(I)V
    .registers 2
    .param p1, "resId"    # I

    .prologue
    .line 314
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 315
    return-void
.end method

.method public setImageURI(Landroid/net/Uri;)V
    .registers 4
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 324
    const-string v0, "http"

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_18

    const-string v0, "https"

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_21

    .line 325
    :cond_18
    invoke-static {}, Lcom/mikepenz/materialdrawer/util/DrawerImageLoader;->getInstance()Lcom/mikepenz/materialdrawer/util/DrawerImageLoader;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p0, p1, v1}, Lcom/mikepenz/materialdrawer/util/DrawerImageLoader;->setImage(Landroid/widget/ImageView;Landroid/net/Uri;Ljava/lang/String;)V

    .line 329
    :goto_20
    return-void

    .line 327
    :cond_21
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setImageURI(Landroid/net/Uri;)V

    goto :goto_20
.end method

.method public setSelectorColor(I)V
    .registers 7
    .param p1, "selectorColor"    # I

    .prologue
    .line 301
    iput p1, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mSelectorColor:I

    .line 302
    new-instance v0, Landroid/graphics/PorterDuffColorFilter;

    iget v1, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mSelectorAlpha:I

    iget v2, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mSelectorColor:I

    invoke-static {v2}, Landroid/graphics/Color;->red(I)I

    move-result v2

    iget v3, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mSelectorColor:I

    invoke-static {v3}, Landroid/graphics/Color;->green(I)I

    move-result v3

    iget v4, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mSelectorColor:I

    invoke-static {v4}, Landroid/graphics/Color;->blue(I)I

    move-result v4

    invoke-static {v1, v2, v3, v4}, Landroid/graphics/Color;->argb(IIII)I

    move-result v1

    sget-object v2, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v0, v1, v2}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mSelectorFilter:Landroid/graphics/ColorFilter;

    .line 303
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->invalidate()V

    .line 304
    return-void
.end method

.method protected verifyDrawable(Landroid/graphics/drawable/Drawable;)Z
    .registers 3
    .param p1, "who"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 290
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/view/BezelImageView;->mMaskDrawable:Landroid/graphics/drawable/Drawable;

    if-eq p1, v0, :cond_a

    invoke-super {p0, p1}, Landroid/widget/ImageView;->verifyDrawable(Landroid/graphics/drawable/Drawable;)Z

    move-result v0

    if-eqz v0, :cond_c

    :cond_a
    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method
