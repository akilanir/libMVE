.class public Lcom/gc/materialdesign/views/ButtonFloat;
.super Lcom/gc/materialdesign/views/Button;
.source "ButtonFloat.java"


# instance fields
.field drawableIcon:Landroid/graphics/drawable/Drawable;

.field height:Ljava/lang/Integer;

.field hidePosition:F

.field icon:Landroid/widget/ImageView;

.field public isShow:Z

.field showPosition:F

.field sizeIcon:I

.field sizeRadius:I

.field width:Ljava/lang/Integer;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/16 v2, 0x1c

    .line 44
    invoke-direct {p0, p1, p2}, Lcom/gc/materialdesign/views/Button;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 29
    const/16 v1, 0x18

    iput v1, p0, Lcom/gc/materialdesign/views/ButtonFloat;->sizeIcon:I

    .line 30
    iput v2, p0, Lcom/gc/materialdesign/views/ButtonFloat;->sizeRadius:I

    .line 36
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/gc/materialdesign/views/ButtonFloat;->isShow:Z

    .line 45
    sget v1, Lcom/gc/materialdesign/R$drawable;->background_button_float:I

    invoke-virtual {p0, v1}, Lcom/gc/materialdesign/views/ButtonFloat;->setBackgroundResource(I)V

    .line 46
    iput v2, p0, Lcom/gc/materialdesign/views/ButtonFloat;->sizeRadius:I

    .line 47
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ButtonFloat;->setDefaultProperties()V

    .line 48
    new-instance v1, Landroid/widget/ImageView;

    invoke-direct {v1, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/gc/materialdesign/views/ButtonFloat;->icon:Landroid/widget/ImageView;

    .line 49
    iget-object v1, p0, Lcom/gc/materialdesign/views/ButtonFloat;->icon:Landroid/widget/ImageView;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setAdjustViewBounds(Z)V

    .line 50
    iget-object v1, p0, Lcom/gc/materialdesign/views/ButtonFloat;->icon:Landroid/widget/ImageView;

    sget-object v2, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 51
    iget-object v1, p0, Lcom/gc/materialdesign/views/ButtonFloat;->drawableIcon:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_37

    .line 52
    iget-object v1, p0, Lcom/gc/materialdesign/views/ButtonFloat;->icon:Landroid/widget/ImageView;

    iget-object v2, p0, Lcom/gc/materialdesign/views/ButtonFloat;->drawableIcon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 54
    :cond_37
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    iget v1, p0, Lcom/gc/materialdesign/views/ButtonFloat;->sizeIcon:I

    int-to-float v1, v1

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ButtonFloat;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/gc/materialdesign/utils/Utils;->dpToPx(FLandroid/content/res/Resources;)I

    move-result v1

    iget v2, p0, Lcom/gc/materialdesign/views/ButtonFloat;->sizeIcon:I

    int-to-float v2, v2

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ButtonFloat;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/gc/materialdesign/utils/Utils;->dpToPx(FLandroid/content/res/Resources;)I

    move-result v2

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 55
    .local v0, "params":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v1, 0xd

    const/4 v2, -0x1

    invoke-virtual {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 56
    iget-object v1, p0, Lcom/gc/materialdesign/views/ButtonFloat;->icon:Landroid/widget/ImageView;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 57
    iget-object v1, p0, Lcom/gc/materialdesign/views/ButtonFloat;->icon:Landroid/widget/ImageView;

    invoke-virtual {p0, v1}, Lcom/gc/materialdesign/views/ButtonFloat;->addView(Landroid/view/View;)V

    .line 59
    return-void
.end method


# virtual methods
.method public cropCircle(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .registers 11
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    const/4 v8, 0x0

    .line 157
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    sget-object v7, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v5, v6, v7}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 159
    .local v2, "output":Landroid/graphics/Bitmap;
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0, v2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 161
    .local v0, "canvas":Landroid/graphics/Canvas;
    const v1, -0xbdbdbe

    .line 162
    .local v1, "color":I
    new-instance v3, Landroid/graphics/Paint;

    invoke-direct {v3}, Landroid/graphics/Paint;-><init>()V

    .line 163
    .local v3, "paint":Landroid/graphics/Paint;
    new-instance v4, Landroid/graphics/Rect;

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    invoke-direct {v4, v8, v8, v5, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 165
    .local v4, "rect":Landroid/graphics/Rect;
    const/4 v5, 0x1

    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 166
    invoke-virtual {v0, v8, v8, v8, v8}, Landroid/graphics/Canvas;->drawARGB(IIII)V

    .line 167
    const v5, -0xbdbdbe

    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 168
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    div-int/lit8 v5, v5, 0x2

    int-to-float v5, v5

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    div-int/lit8 v6, v6, 0x2

    int-to-float v6, v6

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v7

    div-int/lit8 v7, v7, 0x2

    int-to-float v7, v7

    invoke-virtual {v0, v5, v6, v7, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 170
    new-instance v5, Landroid/graphics/PorterDuffXfermode;

    sget-object v6, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v5, v6}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 171
    invoke-virtual {v0, p1, v4, v4, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 172
    return-object v2
.end method

.method public getDrawableIcon()Landroid/graphics/drawable/Drawable;
    .registers 2

    .prologue
    .line 144
    iget-object v0, p0, Lcom/gc/materialdesign/views/ButtonFloat;->drawableIcon:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public getIcon()Landroid/widget/ImageView;
    .registers 2

    .prologue
    .line 136
    iget-object v0, p0, Lcom/gc/materialdesign/views/ButtonFloat;->icon:Landroid/widget/ImageView;

    return-object v0
.end method

.method public getTextView()Landroid/widget/TextView;
    .registers 2

    .prologue
    .line 177
    const/4 v0, 0x0

    return-object v0
.end method

.method public hide()V
    .registers 6

    .prologue
    const/4 v4, 0x0

    .line 194
    const-string v1, "y"

    const/4 v2, 0x1

    new-array v2, v2, [F

    iget v3, p0, Lcom/gc/materialdesign/views/ButtonFloat;->hidePosition:F

    aput v3, v2, v4

    invoke-static {p0, v1, v2}, Lcom/nineoldandroids/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Lcom/nineoldandroids/animation/ObjectAnimator;

    move-result-object v0

    .line 195
    .local v0, "animator":Lcom/nineoldandroids/animation/ObjectAnimator;
    new-instance v1, Landroid/view/animation/BounceInterpolator;

    invoke-direct {v1}, Landroid/view/animation/BounceInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Lcom/nineoldandroids/animation/ObjectAnimator;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 196
    const-wide/16 v1, 0x5dc

    invoke-virtual {v0, v1, v2}, Lcom/nineoldandroids/animation/ObjectAnimator;->setDuration(J)Lcom/nineoldandroids/animation/ObjectAnimator;

    .line 197
    invoke-virtual {v0}, Lcom/nineoldandroids/animation/ObjectAnimator;->start()V

    .line 199
    iput-boolean v4, p0, Lcom/gc/materialdesign/views/ButtonFloat;->isShow:Z

    .line 200
    return-void
.end method

.method public isShow()Z
    .registers 2

    .prologue
    .line 203
    iget-boolean v0, p0, Lcom/gc/materialdesign/views/ButtonFloat;->isShow:Z

    return v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 10
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v4, 0x0

    const/high16 v7, 0x40000000    # 2.0f

    const/high16 v6, 0x3f800000    # 1.0f

    .line 123
    invoke-super {p0, p1}, Lcom/gc/materialdesign/views/Button;->onDraw(Landroid/graphics/Canvas;)V

    .line 124
    iget v2, p0, Lcom/gc/materialdesign/views/ButtonFloat;->x:F

    const/high16 v3, -0x40800000    # -1.0f

    cmpl-float v2, v2, v3

    if-eqz v2, :cond_5b

    .line 125
    new-instance v1, Landroid/graphics/Rect;

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ButtonFloat;->getWidth()I

    move-result v2

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ButtonFloat;->getHeight()I

    move-result v3

    invoke-direct {v1, v4, v4, v2, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 126
    .local v1, "src":Landroid/graphics/Rect;
    new-instance v0, Landroid/graphics/Rect;

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ButtonFloat;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-static {v6, v2}, Lcom/gc/materialdesign/utils/Utils;->dpToPx(FLandroid/content/res/Resources;)I

    move-result v2

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ButtonFloat;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-static {v7, v3}, Lcom/gc/materialdesign/utils/Utils;->dpToPx(FLandroid/content/res/Resources;)I

    move-result v3

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ButtonFloat;->getWidth()I

    move-result v4

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ButtonFloat;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-static {v6, v5}, Lcom/gc/materialdesign/utils/Utils;->dpToPx(FLandroid/content/res/Resources;)I

    move-result v5

    sub-int/2addr v4, v5

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ButtonFloat;->getHeight()I

    move-result v5

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ButtonFloat;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-static {v7, v6}, Lcom/gc/materialdesign/utils/Utils;->dpToPx(FLandroid/content/res/Resources;)I

    move-result v6

    sub-int/2addr v5, v6

    invoke-direct {v0, v2, v3, v4, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 127
    .local v0, "dst":Landroid/graphics/Rect;
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ButtonFloat;->makeCircle()Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/gc/materialdesign/views/ButtonFloat;->cropCircle(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {p1, v2, v1, v0, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 128
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ButtonFloat;->invalidate()V

    .line 130
    .end local v0    # "dst":Landroid/graphics/Rect;
    .end local v1    # "src":Landroid/graphics/Rect;
    :cond_5b
    return-void
.end method

.method protected setAttributes(Landroid/util/AttributeSet;)V
    .registers 10
    .param p1, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v7, -0x1

    .line 75
    const-string v5, "http://schemas.android.com/apk/res/android"

    const-string v6, "background"

    invoke-interface {p1, v5, v6, v7}, Landroid/util/AttributeSet;->getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v1

    .line 76
    .local v1, "bacgroundColor":I
    if-eq v1, v7, :cond_51

    .line 77
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ButtonFloat;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    invoke-virtual {p0, v5}, Lcom/gc/materialdesign/views/ButtonFloat;->setBackgroundColor(I)V

    .line 87
    :cond_16
    :goto_16
    const-string v5, "http://schemas.android.com/apk/res-auto"

    const-string v6, "rippleColor"

    invoke-interface {p1, v5, v6, v7}, Landroid/util/AttributeSet;->getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v4

    .line 89
    .local v4, "rippleColor":I
    if-eq v4, v7, :cond_65

    .line 90
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ButtonFloat;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    invoke-virtual {p0, v5}, Lcom/gc/materialdesign/views/ButtonFloat;->setRippleColor(I)V

    .line 100
    :goto_2b
    const-string v5, "http://schemas.android.com/apk/res-auto"

    const-string v6, "iconDrawable"

    invoke-interface {p1, v5, v6, v7}, Landroid/util/AttributeSet;->getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v3

    .line 101
    .local v3, "iconResource":I
    if-eq v3, v7, :cond_3f

    .line 102
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ButtonFloat;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    iput-object v5, p0, Lcom/gc/materialdesign/views/ButtonFloat;->drawableIcon:Landroid/graphics/drawable/Drawable;

    .line 103
    :cond_3f
    const-string v5, "http://schemas.android.com/apk/res-auto"

    const-string v6, "animate"

    const/4 v7, 0x0

    invoke-interface {p1, v5, v6, v7}, Landroid/util/AttributeSet;->getAttributeBooleanValue(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    .line 104
    .local v0, "animate":Z
    new-instance v5, Lcom/gc/materialdesign/views/ButtonFloat$1;

    invoke-direct {v5, p0, v0}, Lcom/gc/materialdesign/views/ButtonFloat$1;-><init>(Lcom/gc/materialdesign/views/ButtonFloat;Z)V

    invoke-virtual {p0, v5}, Lcom/gc/materialdesign/views/ButtonFloat;->post(Ljava/lang/Runnable;)Z

    .line 117
    return-void

    .line 80
    .end local v0    # "animate":Z
    .end local v3    # "iconResource":I
    .end local v4    # "rippleColor":I
    :cond_51
    const-string v5, "http://schemas.android.com/apk/res/android"

    const-string v6, "background"

    invoke-interface {p1, v5, v6, v7}, Landroid/util/AttributeSet;->getAttributeIntValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v5

    iput v5, p0, Lcom/gc/materialdesign/views/ButtonFloat;->background:I

    .line 81
    iget v5, p0, Lcom/gc/materialdesign/views/ButtonFloat;->background:I

    if-eq v5, v7, :cond_16

    .line 82
    iget v5, p0, Lcom/gc/materialdesign/views/ButtonFloat;->background:I

    invoke-virtual {p0, v5}, Lcom/gc/materialdesign/views/ButtonFloat;->setBackgroundColor(I)V

    goto :goto_16

    .line 93
    .restart local v4    # "rippleColor":I
    :cond_65
    const-string v5, "http://schemas.android.com/apk/res-auto"

    const-string v6, "rippleColor"

    invoke-interface {p1, v5, v6, v7}, Landroid/util/AttributeSet;->getAttributeIntValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v2

    .line 94
    .local v2, "background":I
    if-eq v2, v7, :cond_73

    .line 95
    invoke-virtual {p0, v2}, Lcom/gc/materialdesign/views/ButtonFloat;->setRippleColor(I)V

    goto :goto_2b

    .line 97
    :cond_73
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ButtonFloat;->makePressColor()I

    move-result v5

    invoke-virtual {p0, v5}, Lcom/gc/materialdesign/views/ButtonFloat;->setRippleColor(I)V

    goto :goto_2b
.end method

.method protected setDefaultProperties()V
    .registers 3

    .prologue
    .line 62
    const/high16 v0, 0x40000000    # 2.0f

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ButtonFloat;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/gc/materialdesign/utils/Utils;->dpToPx(FLandroid/content/res/Resources;)I

    move-result v0

    int-to-float v0, v0

    iput v0, p0, Lcom/gc/materialdesign/views/ButtonFloat;->rippleSpeed:F

    .line 63
    const/high16 v0, 0x40a00000    # 5.0f

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ButtonFloat;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/gc/materialdesign/utils/Utils;->dpToPx(FLandroid/content/res/Resources;)I

    move-result v0

    iput v0, p0, Lcom/gc/materialdesign/views/ButtonFloat;->rippleSize:I

    .line 64
    iget v0, p0, Lcom/gc/materialdesign/views/ButtonFloat;->sizeRadius:I

    mul-int/lit8 v0, v0, 0x2

    int-to-float v0, v0

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ButtonFloat;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/gc/materialdesign/utils/Utils;->dpToPx(FLandroid/content/res/Resources;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/gc/materialdesign/views/ButtonFloat;->setMinimumWidth(I)V

    .line 65
    iget v0, p0, Lcom/gc/materialdesign/views/ButtonFloat;->sizeRadius:I

    mul-int/lit8 v0, v0, 0x2

    int-to-float v0, v0

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ButtonFloat;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/gc/materialdesign/utils/Utils;->dpToPx(FLandroid/content/res/Resources;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/gc/materialdesign/views/ButtonFloat;->setMinimumHeight(I)V

    .line 66
    sget v0, Lcom/gc/materialdesign/R$drawable;->background_button_float:I

    iput v0, p0, Lcom/gc/materialdesign/views/Button;->background:I

    .line 68
    return-void
.end method

.method public setDrawableIcon(Landroid/graphics/drawable/Drawable;)V
    .registers 4
    .param p1, "drawableIcon"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 148
    iput-object p1, p0, Lcom/gc/materialdesign/views/ButtonFloat;->drawableIcon:Landroid/graphics/drawable/Drawable;

    .line 150
    :try_start_2
    iget-object v1, p0, Lcom/gc/materialdesign/views/ButtonFloat;->icon:Landroid/widget/ImageView;

    invoke-virtual {v1, p1}, Landroid/widget/ImageView;->setBackground(Landroid/graphics/drawable/Drawable;)V
    :try_end_7
    .catch Ljava/lang/NoSuchMethodError; {:try_start_2 .. :try_end_7} :catch_8

    .line 154
    :goto_7
    return-void

    .line 151
    :catch_8
    move-exception v0

    .line 152
    .local v0, "e":Ljava/lang/NoSuchMethodError;
    iget-object v1, p0, Lcom/gc/materialdesign/views/ButtonFloat;->icon:Landroid/widget/ImageView;

    invoke-virtual {v1, p1}, Landroid/widget/ImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_7
.end method

.method public setIcon(Landroid/widget/ImageView;)V
    .registers 2
    .param p1, "icon"    # Landroid/widget/ImageView;

    .prologue
    .line 140
    iput-object p1, p0, Lcom/gc/materialdesign/views/ButtonFloat;->icon:Landroid/widget/ImageView;

    .line 141
    return-void
.end method

.method public setRippleColor(I)V
    .registers 3
    .param p1, "rippleColor"    # I

    .prologue
    .line 181
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/gc/materialdesign/views/ButtonFloat;->rippleColor:Ljava/lang/Integer;

    .line 182
    return-void
.end method

.method public show()V
    .registers 7

    .prologue
    const/4 v5, 0x1

    .line 185
    const-string v1, "y"

    new-array v2, v5, [F

    const/4 v3, 0x0

    iget v4, p0, Lcom/gc/materialdesign/views/ButtonFloat;->showPosition:F

    aput v4, v2, v3

    invoke-static {p0, v1, v2}, Lcom/nineoldandroids/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Lcom/nineoldandroids/animation/ObjectAnimator;

    move-result-object v0

    .line 186
    .local v0, "animator":Lcom/nineoldandroids/animation/ObjectAnimator;
    new-instance v1, Landroid/view/animation/BounceInterpolator;

    invoke-direct {v1}, Landroid/view/animation/BounceInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Lcom/nineoldandroids/animation/ObjectAnimator;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 187
    const-wide/16 v1, 0x5dc

    invoke-virtual {v0, v1, v2}, Lcom/nineoldandroids/animation/ObjectAnimator;->setDuration(J)Lcom/nineoldandroids/animation/ObjectAnimator;

    .line 188
    invoke-virtual {v0}, Lcom/nineoldandroids/animation/ObjectAnimator;->start()V

    .line 189
    iput-boolean v5, p0, Lcom/gc/materialdesign/views/ButtonFloat;->isShow:Z

    .line 190
    return-void
.end method
