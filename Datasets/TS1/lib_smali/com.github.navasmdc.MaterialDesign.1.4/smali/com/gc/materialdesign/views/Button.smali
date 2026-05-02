.class public abstract Lcom/gc/materialdesign/views/Button;
.super Lcom/gc/materialdesign/views/CustomView;
.source "Button.java"


# static fields
.field static final ANDROIDXML:Ljava/lang/String; = "http://schemas.android.com/apk/res/android"


# instance fields
.field background:I

.field backgroundColor:I

.field clickAfterRipple:Z

.field minHeight:I

.field minWidth:I

.field onClickListener:Landroid/view/View$OnClickListener;

.field radius:F

.field rippleColor:Ljava/lang/Integer;

.field rippleSize:I

.field rippleSpeed:F

.field x:F

.field y:F


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v2, 0x1

    const/high16 v1, -0x40800000    # -1.0f

    .line 35
    invoke-direct {p0, p1, p2}, Lcom/gc/materialdesign/views/CustomView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 27
    const/high16 v0, 0x41400000    # 12.0f

    iput v0, p0, Lcom/gc/materialdesign/views/Button;->rippleSpeed:F

    .line 28
    const/4 v0, 0x3

    iput v0, p0, Lcom/gc/materialdesign/views/Button;->rippleSize:I

    .line 31
    iput-boolean v2, p0, Lcom/gc/materialdesign/views/Button;->clickAfterRipple:Z

    .line 32
    const-string v0, "#1E88E5"

    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/gc/materialdesign/views/Button;->backgroundColor:I

    .line 59
    iput v1, p0, Lcom/gc/materialdesign/views/Button;->x:F

    iput v1, p0, Lcom/gc/materialdesign/views/Button;->y:F

    .line 60
    iput v1, p0, Lcom/gc/materialdesign/views/Button;->radius:F

    .line 36
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/Button;->setDefaultProperties()V

    .line 37
    const-string v0, "http://schemas.android.com/apk/res-auto"

    const-string v1, "animate"

    invoke-interface {p2, v0, v1, v2}, Landroid/util/AttributeSet;->getAttributeBooleanValue(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/gc/materialdesign/views/Button;->clickAfterRipple:Z

    .line 38
    invoke-virtual {p0, p2}, Lcom/gc/materialdesign/views/Button;->setAttributes(Landroid/util/AttributeSet;)V

    .line 39
    iget v0, p0, Lcom/gc/materialdesign/views/Button;->backgroundColor:I

    iput v0, p0, Lcom/gc/materialdesign/views/Button;->beforeBackground:I

    .line 40
    iget-object v0, p0, Lcom/gc/materialdesign/views/Button;->rippleColor:Ljava/lang/Integer;

    if-nez v0, :cond_3f

    .line 41
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/Button;->makePressColor()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/gc/materialdesign/views/Button;->rippleColor:Ljava/lang/Integer;

    .line 42
    :cond_3f
    return-void
.end method


# virtual methods
.method public getRippleSpeed()F
    .registers 2

    .prologue
    .line 182
    iget v0, p0, Lcom/gc/materialdesign/views/Button;->rippleSpeed:F

    return v0
.end method

.method public abstract getTextView()Landroid/widget/TextView;
.end method

.method public makeCircle()Landroid/graphics/Bitmap;
    .registers 10

    .prologue
    const/high16 v8, -0x40800000    # -1.0f

    const/4 v7, 0x0

    .line 118
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/Button;->getWidth()I

    move-result v3

    const/high16 v4, 0x40c00000    # 6.0f

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/Button;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/gc/materialdesign/utils/Utils;->dpToPx(FLandroid/content/res/Resources;)I

    move-result v4

    sub-int/2addr v3, v4

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/Button;->getHeight()I

    move-result v4

    const/high16 v5, 0x40e00000    # 7.0f

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/Button;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/gc/materialdesign/utils/Utils;->dpToPx(FLandroid/content/res/Resources;)I

    move-result v5

    sub-int/2addr v4, v5

    sget-object v5, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v3, v4, v5}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 121
    .local v1, "output":Landroid/graphics/Bitmap;
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 122
    .local v0, "canvas":Landroid/graphics/Canvas;
    invoke-virtual {v0, v7, v7, v7, v7}, Landroid/graphics/Canvas;->drawARGB(IIII)V

    .line 123
    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2}, Landroid/graphics/Paint;-><init>()V

    .line 124
    .local v2, "paint":Landroid/graphics/Paint;
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 125
    iget-object v3, p0, Lcom/gc/materialdesign/views/Button;->rippleColor:Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 126
    iget v3, p0, Lcom/gc/materialdesign/views/Button;->x:F

    iget v4, p0, Lcom/gc/materialdesign/views/Button;->y:F

    iget v5, p0, Lcom/gc/materialdesign/views/Button;->radius:F

    invoke-virtual {v0, v3, v4, v5, v2}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 127
    iget v3, p0, Lcom/gc/materialdesign/views/Button;->radius:F

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/Button;->getHeight()I

    move-result v4

    iget v5, p0, Lcom/gc/materialdesign/views/Button;->rippleSize:I

    div-int/2addr v4, v5

    int-to-float v4, v4

    cmpl-float v3, v3, v4

    if-lez v3, :cond_5f

    .line 128
    iget v3, p0, Lcom/gc/materialdesign/views/Button;->radius:F

    iget v4, p0, Lcom/gc/materialdesign/views/Button;->rippleSpeed:F

    add-float/2addr v3, v4

    iput v3, p0, Lcom/gc/materialdesign/views/Button;->radius:F

    .line 129
    :cond_5f
    iget v3, p0, Lcom/gc/materialdesign/views/Button;->radius:F

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/Button;->getWidth()I

    move-result v4

    int-to-float v4, v4

    cmpl-float v3, v3, v4

    if-ltz v3, :cond_85

    .line 130
    iput v8, p0, Lcom/gc/materialdesign/views/Button;->x:F

    .line 131
    iput v8, p0, Lcom/gc/materialdesign/views/Button;->y:F

    .line 132
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/Button;->getHeight()I

    move-result v3

    iget v4, p0, Lcom/gc/materialdesign/views/Button;->rippleSize:I

    div-int/2addr v3, v4

    int-to-float v3, v3

    iput v3, p0, Lcom/gc/materialdesign/views/Button;->radius:F

    .line 133
    iget-object v3, p0, Lcom/gc/materialdesign/views/Button;->onClickListener:Landroid/view/View$OnClickListener;

    if-eqz v3, :cond_85

    iget-boolean v3, p0, Lcom/gc/materialdesign/views/Button;->clickAfterRipple:Z

    if-eqz v3, :cond_85

    .line 134
    iget-object v3, p0, Lcom/gc/materialdesign/views/Button;->onClickListener:Landroid/view/View$OnClickListener;

    invoke-interface {v3, p0}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 136
    :cond_85
    return-object v1
.end method

.method protected makePressColor()I
    .registers 6

    .prologue
    const/4 v3, 0x0

    .line 145
    iget v4, p0, Lcom/gc/materialdesign/views/Button;->backgroundColor:I

    shr-int/lit8 v4, v4, 0x10

    and-int/lit16 v2, v4, 0xff

    .line 146
    .local v2, "r":I
    iget v4, p0, Lcom/gc/materialdesign/views/Button;->backgroundColor:I

    shr-int/lit8 v4, v4, 0x8

    and-int/lit16 v1, v4, 0xff

    .line 147
    .local v1, "g":I
    iget v4, p0, Lcom/gc/materialdesign/views/Button;->backgroundColor:I

    shr-int/lit8 v4, v4, 0x0

    and-int/lit16 v0, v4, 0xff

    .line 148
    .local v0, "b":I
    add-int/lit8 v4, v2, -0x1e

    if-gez v4, :cond_27

    move v2, v3

    .line 149
    :goto_18
    add-int/lit8 v4, v1, -0x1e

    if-gez v4, :cond_2a

    move v1, v3

    .line 150
    :goto_1d
    add-int/lit8 v4, v0, -0x1e

    if-gez v4, :cond_2d

    move v0, v3

    .line 151
    :goto_22
    invoke-static {v2, v1, v0}, Landroid/graphics/Color;->rgb(III)I

    move-result v3

    return v3

    .line 148
    :cond_27
    add-int/lit8 v2, v2, -0x1e

    goto :goto_18

    .line 149
    :cond_2a
    add-int/lit8 v1, v1, -0x1e

    goto :goto_1d

    .line 150
    :cond_2d
    add-int/lit8 v0, v0, -0x1e

    goto :goto_22
.end method

.method protected onFocusChanged(ZILandroid/graphics/Rect;)V
    .registers 5
    .param p1, "gainFocus"    # Z
    .param p2, "direction"    # I
    .param p3, "previouslyFocusedRect"    # Landroid/graphics/Rect;

    .prologue
    const/high16 v0, -0x40800000    # -1.0f

    .line 105
    if-nez p1, :cond_8

    .line 106
    iput v0, p0, Lcom/gc/materialdesign/views/Button;->x:F

    .line 107
    iput v0, p0, Lcom/gc/materialdesign/views/Button;->y:F

    .line 109
    :cond_8
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 3
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 114
    const/4 v0, 0x1

    return v0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 8
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    const/4 v3, 0x0

    const/high16 v2, -0x40800000    # -1.0f

    .line 64
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/Button;->invalidate()V

    .line 65
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/Button;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_2c

    .line 66
    iput-boolean v5, p0, Lcom/gc/materialdesign/views/Button;->isLastTouch:Z

    .line 67
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_2d

    .line 68
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/Button;->getHeight()I

    move-result v0

    iget v1, p0, Lcom/gc/materialdesign/views/Button;->rippleSize:I

    div-int/2addr v0, v1

    int-to-float v0, v0

    iput v0, p0, Lcom/gc/materialdesign/views/Button;->radius:F

    .line 69
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, p0, Lcom/gc/materialdesign/views/Button;->x:F

    .line 70
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    iput v0, p0, Lcom/gc/materialdesign/views/Button;->y:F

    .line 99
    :cond_2c
    :goto_2c
    return v5

    .line 71
    :cond_2d
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_7b

    .line 72
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/Button;->getHeight()I

    move-result v0

    iget v1, p0, Lcom/gc/materialdesign/views/Button;->rippleSize:I

    div-int/2addr v0, v1

    int-to-float v0, v0

    iput v0, p0, Lcom/gc/materialdesign/views/Button;->radius:F

    .line 73
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, p0, Lcom/gc/materialdesign/views/Button;->x:F

    .line 74
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    iput v0, p0, Lcom/gc/materialdesign/views/Button;->y:F

    .line 75
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/Button;->getWidth()I

    move-result v1

    int-to-float v1, v1

    cmpg-float v0, v0, v1

    if-gtz v0, :cond_74

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    cmpl-float v0, v0, v3

    if-ltz v0, :cond_74

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/Button;->getHeight()I

    move-result v1

    int-to-float v1, v1

    cmpg-float v0, v0, v1

    if-gtz v0, :cond_74

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    cmpl-float v0, v0, v3

    if-gez v0, :cond_2c

    .line 77
    :cond_74
    iput-boolean v4, p0, Lcom/gc/materialdesign/views/Button;->isLastTouch:Z

    .line 78
    iput v2, p0, Lcom/gc/materialdesign/views/Button;->x:F

    .line 79
    iput v2, p0, Lcom/gc/materialdesign/views/Button;->y:F

    goto :goto_2c

    .line 81
    :cond_7b
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-ne v0, v5, :cond_c9

    .line 82
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/Button;->getWidth()I

    move-result v1

    int-to-float v1, v1

    cmpg-float v0, v0, v1

    if-gtz v0, :cond_c1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    cmpl-float v0, v0, v3

    if-ltz v0, :cond_c1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/Button;->getHeight()I

    move-result v1

    int-to-float v1, v1

    cmpg-float v0, v0, v1

    if-gtz v0, :cond_c1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    cmpl-float v0, v0, v3

    if-ltz v0, :cond_c1

    .line 84
    iget v0, p0, Lcom/gc/materialdesign/views/Button;->radius:F

    const/high16 v1, 0x3f800000    # 1.0f

    add-float/2addr v0, v1

    iput v0, p0, Lcom/gc/materialdesign/views/Button;->radius:F

    .line 85
    iget-boolean v0, p0, Lcom/gc/materialdesign/views/Button;->clickAfterRipple:Z

    if-nez v0, :cond_2c

    iget-object v0, p0, Lcom/gc/materialdesign/views/Button;->onClickListener:Landroid/view/View$OnClickListener;

    if-eqz v0, :cond_2c

    .line 86
    iget-object v0, p0, Lcom/gc/materialdesign/views/Button;->onClickListener:Landroid/view/View$OnClickListener;

    invoke-interface {v0, p0}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    goto/16 :goto_2c

    .line 89
    :cond_c1
    iput-boolean v4, p0, Lcom/gc/materialdesign/views/Button;->isLastTouch:Z

    .line 90
    iput v2, p0, Lcom/gc/materialdesign/views/Button;->x:F

    .line 91
    iput v2, p0, Lcom/gc/materialdesign/views/Button;->y:F

    goto/16 :goto_2c

    .line 93
    :cond_c9
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_2c

    .line 94
    iput-boolean v4, p0, Lcom/gc/materialdesign/views/Button;->isLastTouch:Z

    .line 95
    iput v2, p0, Lcom/gc/materialdesign/views/Button;->x:F

    .line 96
    iput v2, p0, Lcom/gc/materialdesign/views/Button;->y:F

    goto/16 :goto_2c
.end method

.method protected abstract setAttributes(Landroid/util/AttributeSet;)V
.end method

.method public setBackgroundColor(I)V
    .registers 5
    .param p1, "color"    # I

    .prologue
    .line 161
    iput p1, p0, Lcom/gc/materialdesign/views/Button;->backgroundColor:I

    .line 162
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/Button;->isEnabled()Z

    move-result v2

    if-eqz v2, :cond_c

    .line 163
    iget v2, p0, Lcom/gc/materialdesign/views/Button;->backgroundColor:I

    iput v2, p0, Lcom/gc/materialdesign/views/Button;->beforeBackground:I

    .line 165
    :cond_c
    :try_start_c
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/Button;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/LayerDrawable;

    .line 166
    .local v0, "layer":Landroid/graphics/drawable/LayerDrawable;
    sget v2, Lcom/gc/materialdesign/R$id;->shape_bacground:I

    invoke-virtual {v0, v2}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    check-cast v1, Landroid/graphics/drawable/GradientDrawable;

    .line 168
    .local v1, "shape":Landroid/graphics/drawable/GradientDrawable;
    iget v2, p0, Lcom/gc/materialdesign/views/Button;->backgroundColor:I

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 169
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/Button;->makePressColor()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iput-object v2, p0, Lcom/gc/materialdesign/views/Button;->rippleColor:Ljava/lang/Integer;
    :try_end_29
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_29} :catch_2a

    .line 173
    .end local v0    # "layer":Landroid/graphics/drawable/LayerDrawable;
    .end local v1    # "shape":Landroid/graphics/drawable/GradientDrawable;
    :goto_29
    return-void

    .line 170
    :catch_2a
    move-exception v2

    goto :goto_29
.end method

.method protected setDefaultProperties()V
    .registers 3

    .prologue
    .line 46
    iget v0, p0, Lcom/gc/materialdesign/views/Button;->minHeight:I

    int-to-float v0, v0

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/Button;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/gc/materialdesign/utils/Utils;->dpToPx(FLandroid/content/res/Resources;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/gc/materialdesign/views/Button;->setMinimumHeight(I)V

    .line 47
    iget v0, p0, Lcom/gc/materialdesign/views/Button;->minWidth:I

    int-to-float v0, v0

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/Button;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/gc/materialdesign/utils/Utils;->dpToPx(FLandroid/content/res/Resources;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/gc/materialdesign/views/Button;->setMinimumWidth(I)V

    .line 49
    iget v0, p0, Lcom/gc/materialdesign/views/Button;->background:I

    invoke-virtual {p0, v0}, Lcom/gc/materialdesign/views/Button;->setBackgroundResource(I)V

    .line 50
    iget v0, p0, Lcom/gc/materialdesign/views/Button;->backgroundColor:I

    invoke-virtual {p0, v0}, Lcom/gc/materialdesign/views/Button;->setBackgroundColor(I)V

    .line 51
    return-void
.end method

.method public setOnClickListener(Landroid/view/View$OnClickListener;)V
    .registers 2
    .param p1, "l"    # Landroid/view/View$OnClickListener;

    .prologue
    .line 156
    iput-object p1, p0, Lcom/gc/materialdesign/views/Button;->onClickListener:Landroid/view/View$OnClickListener;

    .line 157
    return-void
.end method

.method public setRippleSpeed(F)V
    .registers 2
    .param p1, "rippleSpeed"    # F

    .prologue
    .line 178
    iput p1, p0, Lcom/gc/materialdesign/views/Button;->rippleSpeed:F

    .line 179
    return-void
.end method
