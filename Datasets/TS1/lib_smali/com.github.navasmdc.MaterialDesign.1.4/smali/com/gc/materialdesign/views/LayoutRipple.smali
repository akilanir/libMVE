.class public Lcom/gc/materialdesign/views/LayoutRipple;
.super Lcom/gc/materialdesign/views/CustomView;
.source "LayoutRipple.java"


# instance fields
.field background:I

.field backgroundColor:I

.field onClickListener:Landroid/view/View$OnClickListener;

.field radius:F

.field rippleColor:Ljava/lang/Integer;

.field rippleSize:I

.field rippleSpeed:F

.field x:F

.field xRippleOrigin:Ljava/lang/Float;

.field y:F

.field yRippleOrigin:Ljava/lang/Float;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/high16 v1, -0x40800000    # -1.0f

    .line 27
    invoke-direct {p0, p1, p2}, Lcom/gc/materialdesign/views/CustomView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 16
    const/high16 v0, 0x41200000    # 10.0f

    iput v0, p0, Lcom/gc/materialdesign/views/LayoutRipple;->rippleSpeed:F

    .line 17
    const/4 v0, 0x3

    iput v0, p0, Lcom/gc/materialdesign/views/LayoutRipple;->rippleSize:I

    .line 20
    const-string v0, "#FFFFFF"

    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/gc/materialdesign/views/LayoutRipple;->backgroundColor:I

    .line 81
    iput v1, p0, Lcom/gc/materialdesign/views/LayoutRipple;->x:F

    iput v1, p0, Lcom/gc/materialdesign/views/LayoutRipple;->y:F

    .line 82
    iput v1, p0, Lcom/gc/materialdesign/views/LayoutRipple;->radius:F

    .line 28
    invoke-virtual {p0, p2}, Lcom/gc/materialdesign/views/LayoutRipple;->setAttributes(Landroid/util/AttributeSet;)V

    .line 29
    return-void
.end method


# virtual methods
.method public makeCircle()Landroid/graphics/Bitmap;
    .registers 9

    .prologue
    const/high16 v7, -0x40800000    # -1.0f

    const/4 v6, 0x0

    .line 137
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/LayoutRipple;->getWidth()I

    move-result v3

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/LayoutRipple;->getHeight()I

    move-result v4

    sget-object v5, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v3, v4, v5}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 139
    .local v1, "output":Landroid/graphics/Bitmap;
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 140
    .local v0, "canvas":Landroid/graphics/Canvas;
    invoke-virtual {v0, v6, v6, v6, v6}, Landroid/graphics/Canvas;->drawARGB(IIII)V

    .line 141
    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2}, Landroid/graphics/Paint;-><init>()V

    .line 142
    .local v2, "paint":Landroid/graphics/Paint;
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 143
    iget-object v3, p0, Lcom/gc/materialdesign/views/LayoutRipple;->rippleColor:Ljava/lang/Integer;

    if-nez v3, :cond_30

    .line 144
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/LayoutRipple;->makePressColor()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    iput-object v3, p0, Lcom/gc/materialdesign/views/LayoutRipple;->rippleColor:Ljava/lang/Integer;

    .line 145
    :cond_30
    iget-object v3, p0, Lcom/gc/materialdesign/views/LayoutRipple;->rippleColor:Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 146
    iget-object v3, p0, Lcom/gc/materialdesign/views/LayoutRipple;->xRippleOrigin:Ljava/lang/Float;

    if-nez v3, :cond_8a

    iget v3, p0, Lcom/gc/materialdesign/views/LayoutRipple;->x:F

    :goto_3f
    iput v3, p0, Lcom/gc/materialdesign/views/LayoutRipple;->x:F

    .line 147
    iget-object v3, p0, Lcom/gc/materialdesign/views/LayoutRipple;->yRippleOrigin:Ljava/lang/Float;

    if-nez v3, :cond_91

    iget v3, p0, Lcom/gc/materialdesign/views/LayoutRipple;->y:F

    :goto_47
    iput v3, p0, Lcom/gc/materialdesign/views/LayoutRipple;->y:F

    .line 148
    iget v3, p0, Lcom/gc/materialdesign/views/LayoutRipple;->x:F

    iget v4, p0, Lcom/gc/materialdesign/views/LayoutRipple;->y:F

    iget v5, p0, Lcom/gc/materialdesign/views/LayoutRipple;->radius:F

    invoke-virtual {v0, v3, v4, v5, v2}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 149
    iget v3, p0, Lcom/gc/materialdesign/views/LayoutRipple;->radius:F

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/LayoutRipple;->getHeight()I

    move-result v4

    iget v5, p0, Lcom/gc/materialdesign/views/LayoutRipple;->rippleSize:I

    div-int/2addr v4, v5

    int-to-float v4, v4

    cmpl-float v3, v3, v4

    if-lez v3, :cond_67

    .line 150
    iget v3, p0, Lcom/gc/materialdesign/views/LayoutRipple;->radius:F

    iget v4, p0, Lcom/gc/materialdesign/views/LayoutRipple;->rippleSpeed:F

    add-float/2addr v3, v4

    iput v3, p0, Lcom/gc/materialdesign/views/LayoutRipple;->radius:F

    .line 151
    :cond_67
    iget v3, p0, Lcom/gc/materialdesign/views/LayoutRipple;->radius:F

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/LayoutRipple;->getWidth()I

    move-result v4

    int-to-float v4, v4

    cmpl-float v3, v3, v4

    if-ltz v3, :cond_89

    .line 152
    iput v7, p0, Lcom/gc/materialdesign/views/LayoutRipple;->x:F

    .line 153
    iput v7, p0, Lcom/gc/materialdesign/views/LayoutRipple;->y:F

    .line 154
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/LayoutRipple;->getHeight()I

    move-result v3

    iget v4, p0, Lcom/gc/materialdesign/views/LayoutRipple;->rippleSize:I

    div-int/2addr v3, v4

    int-to-float v3, v3

    iput v3, p0, Lcom/gc/materialdesign/views/LayoutRipple;->radius:F

    .line 155
    iget-object v3, p0, Lcom/gc/materialdesign/views/LayoutRipple;->onClickListener:Landroid/view/View$OnClickListener;

    if-eqz v3, :cond_89

    .line 156
    iget-object v3, p0, Lcom/gc/materialdesign/views/LayoutRipple;->onClickListener:Landroid/view/View$OnClickListener;

    invoke-interface {v3, p0}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 158
    :cond_89
    return-object v1

    .line 146
    :cond_8a
    iget-object v3, p0, Lcom/gc/materialdesign/views/LayoutRipple;->xRippleOrigin:Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    goto :goto_3f

    .line 147
    :cond_91
    iget-object v3, p0, Lcom/gc/materialdesign/views/LayoutRipple;->yRippleOrigin:Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    goto :goto_47
.end method

.method protected makePressColor()I
    .registers 6

    .prologue
    const/4 v3, 0x0

    .line 177
    iget v4, p0, Lcom/gc/materialdesign/views/LayoutRipple;->backgroundColor:I

    shr-int/lit8 v4, v4, 0x10

    and-int/lit16 v2, v4, 0xff

    .line 178
    .local v2, "r":I
    iget v4, p0, Lcom/gc/materialdesign/views/LayoutRipple;->backgroundColor:I

    shr-int/lit8 v4, v4, 0x8

    and-int/lit16 v1, v4, 0xff

    .line 179
    .local v1, "g":I
    iget v4, p0, Lcom/gc/materialdesign/views/LayoutRipple;->backgroundColor:I

    shr-int/lit8 v4, v4, 0x0

    and-int/lit16 v0, v4, 0xff

    .line 180
    .local v0, "b":I
    add-int/lit8 v4, v2, -0x1e

    if-gez v4, :cond_27

    move v2, v3

    .line 181
    :goto_18
    add-int/lit8 v4, v1, -0x1e

    if-gez v4, :cond_2a

    move v1, v3

    .line 182
    :goto_1d
    add-int/lit8 v4, v0, -0x1e

    if-gez v4, :cond_2d

    move v0, v3

    .line 183
    :goto_22
    invoke-static {v2, v1, v0}, Landroid/graphics/Color;->rgb(III)I

    move-result v3

    return v3

    .line 180
    :cond_27
    add-int/lit8 v2, v2, -0x1e

    goto :goto_18

    .line 181
    :cond_2a
    add-int/lit8 v1, v1, -0x1e

    goto :goto_1d

    .line 182
    :cond_2d
    add-int/lit8 v0, v0, -0x1e

    goto :goto_22
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 7
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v4, 0x0

    .line 162
    invoke-super {p0, p1}, Lcom/gc/materialdesign/views/CustomView;->onDraw(Landroid/graphics/Canvas;)V

    .line 163
    iget v2, p0, Lcom/gc/materialdesign/views/LayoutRipple;->x:F

    const/high16 v3, -0x40800000    # -1.0f

    cmpl-float v2, v2, v3

    if-eqz v2, :cond_31

    .line 164
    new-instance v1, Landroid/graphics/Rect;

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/LayoutRipple;->getWidth()I

    move-result v2

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/LayoutRipple;->getHeight()I

    move-result v3

    invoke-direct {v1, v4, v4, v2, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 165
    .local v1, "src":Landroid/graphics/Rect;
    new-instance v0, Landroid/graphics/Rect;

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/LayoutRipple;->getWidth()I

    move-result v2

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/LayoutRipple;->getHeight()I

    move-result v3

    invoke-direct {v0, v4, v4, v2, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 166
    .local v0, "dst":Landroid/graphics/Rect;
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/LayoutRipple;->makeCircle()Landroid/graphics/Bitmap;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {p1, v2, v1, v0, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 167
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/LayoutRipple;->invalidate()V

    .line 169
    .end local v0    # "dst":Landroid/graphics/Rect;
    .end local v1    # "src":Landroid/graphics/Rect;
    :cond_31
    return-void
.end method

.method protected onFocusChanged(ZILandroid/graphics/Rect;)V
    .registers 5
    .param p1, "gainFocus"    # Z
    .param p2, "direction"    # I
    .param p3, "previouslyFocusedRect"    # Landroid/graphics/Rect;

    .prologue
    const/high16 v0, -0x40800000    # -1.0f

    .line 124
    if-nez p1, :cond_8

    .line 125
    iput v0, p0, Lcom/gc/materialdesign/views/LayoutRipple;->x:F

    .line 126
    iput v0, p0, Lcom/gc/materialdesign/views/LayoutRipple;->y:F

    .line 128
    :cond_8
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 3
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 133
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

    .line 86
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/LayoutRipple;->invalidate()V

    .line 87
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/LayoutRipple;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_39

    .line 88
    iput-boolean v5, p0, Lcom/gc/materialdesign/views/LayoutRipple;->isLastTouch:Z

    .line 89
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_3a

    .line 90
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/LayoutRipple;->getHeight()I

    move-result v0

    iget v1, p0, Lcom/gc/materialdesign/views/LayoutRipple;->rippleSize:I

    div-int/2addr v0, v1

    int-to-float v0, v0

    iput v0, p0, Lcom/gc/materialdesign/views/LayoutRipple;->radius:F

    .line 91
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, p0, Lcom/gc/materialdesign/views/LayoutRipple;->x:F

    .line 92
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    iput v0, p0, Lcom/gc/materialdesign/views/LayoutRipple;->y:F

    .line 112
    :cond_2c
    :goto_2c
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_39

    .line 113
    iput-boolean v4, p0, Lcom/gc/materialdesign/views/LayoutRipple;->isLastTouch:Z

    .line 114
    iput v2, p0, Lcom/gc/materialdesign/views/LayoutRipple;->x:F

    .line 115
    iput v2, p0, Lcom/gc/materialdesign/views/LayoutRipple;->y:F

    .line 118
    :cond_39
    return v5

    .line 93
    :cond_3a
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_88

    .line 94
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/LayoutRipple;->getHeight()I

    move-result v0

    iget v1, p0, Lcom/gc/materialdesign/views/LayoutRipple;->rippleSize:I

    div-int/2addr v0, v1

    int-to-float v0, v0

    iput v0, p0, Lcom/gc/materialdesign/views/LayoutRipple;->radius:F

    .line 95
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, p0, Lcom/gc/materialdesign/views/LayoutRipple;->x:F

    .line 96
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    iput v0, p0, Lcom/gc/materialdesign/views/LayoutRipple;->y:F

    .line 97
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/LayoutRipple;->getWidth()I

    move-result v1

    int-to-float v1, v1

    cmpg-float v0, v0, v1

    if-gtz v0, :cond_81

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    cmpl-float v0, v0, v3

    if-ltz v0, :cond_81

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/LayoutRipple;->getHeight()I

    move-result v1

    int-to-float v1, v1

    cmpg-float v0, v0, v1

    if-gtz v0, :cond_81

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    cmpl-float v0, v0, v3

    if-gez v0, :cond_2c

    .line 99
    :cond_81
    iput-boolean v4, p0, Lcom/gc/materialdesign/views/LayoutRipple;->isLastTouch:Z

    .line 100
    iput v2, p0, Lcom/gc/materialdesign/views/LayoutRipple;->x:F

    .line 101
    iput v2, p0, Lcom/gc/materialdesign/views/LayoutRipple;->y:F

    goto :goto_2c

    .line 103
    :cond_88
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-ne v0, v5, :cond_2c

    .line 104
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/LayoutRipple;->getWidth()I

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

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/LayoutRipple;->getHeight()I

    move-result v1

    int-to-float v1, v1

    cmpg-float v0, v0, v1

    if-gtz v0, :cond_c1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    cmpl-float v0, v0, v3

    if-ltz v0, :cond_c1

    .line 106
    iget v0, p0, Lcom/gc/materialdesign/views/LayoutRipple;->radius:F

    const/high16 v1, 0x3f800000    # 1.0f

    add-float/2addr v0, v1

    iput v0, p0, Lcom/gc/materialdesign/views/LayoutRipple;->radius:F

    goto/16 :goto_2c

    .line 108
    :cond_c1
    iput-boolean v4, p0, Lcom/gc/materialdesign/views/LayoutRipple;->isLastTouch:Z

    .line 109
    iput v2, p0, Lcom/gc/materialdesign/views/LayoutRipple;->x:F

    .line 110
    iput v2, p0, Lcom/gc/materialdesign/views/LayoutRipple;->y:F

    goto/16 :goto_2c
.end method

.method protected setAttributes(Landroid/util/AttributeSet;)V
    .registers 8
    .param p1, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v5, -0x1

    .line 36
    const-string v3, "http://schemas.android.com/apk/res/android"

    const-string v4, "background"

    invoke-interface {p1, v3, v4, v5}, Landroid/util/AttributeSet;->getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    .line 38
    .local v0, "bacgroundColor":I
    if-eq v0, v5, :cond_38

    .line 39
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/LayoutRipple;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/gc/materialdesign/views/LayoutRipple;->setBackgroundColor(I)V

    .line 50
    :goto_16
    const-string v3, "http://schemas.android.com/apk/res-auto"

    const-string v4, "rippleColor"

    invoke-interface {p1, v3, v4, v5}, Landroid/util/AttributeSet;->getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v2

    .line 52
    .local v2, "rippleColor":I
    if-eq v2, v5, :cond_52

    .line 53
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/LayoutRipple;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/gc/materialdesign/views/LayoutRipple;->setRippleColor(I)V

    .line 63
    :goto_2b
    const-string v3, "http://schemas.android.com/apk/res-auto"

    const-string v4, "rippleSpeed"

    const/high16 v5, 0x41a00000    # 20.0f

    invoke-interface {p1, v3, v4, v5}, Landroid/util/AttributeSet;->getAttributeFloatValue(Ljava/lang/String;Ljava/lang/String;F)F

    move-result v3

    iput v3, p0, Lcom/gc/materialdesign/views/LayoutRipple;->rippleSpeed:F

    .line 65
    return-void

    .line 42
    .end local v2    # "rippleColor":I
    :cond_38
    const-string v3, "http://schemas.android.com/apk/res/android"

    const-string v4, "background"

    invoke-interface {p1, v3, v4, v5}, Landroid/util/AttributeSet;->getAttributeIntValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v3

    iput v3, p0, Lcom/gc/materialdesign/views/LayoutRipple;->background:I

    .line 43
    iget v3, p0, Lcom/gc/materialdesign/views/LayoutRipple;->background:I

    if-eq v3, v5, :cond_4c

    .line 44
    iget v3, p0, Lcom/gc/materialdesign/views/LayoutRipple;->background:I

    invoke-virtual {p0, v3}, Lcom/gc/materialdesign/views/LayoutRipple;->setBackgroundColor(I)V

    goto :goto_16

    .line 46
    :cond_4c
    iget v3, p0, Lcom/gc/materialdesign/views/LayoutRipple;->backgroundColor:I

    invoke-virtual {p0, v3}, Lcom/gc/materialdesign/views/LayoutRipple;->setBackgroundColor(I)V

    goto :goto_16

    .line 56
    .restart local v2    # "rippleColor":I
    :cond_52
    const-string v3, "http://schemas.android.com/apk/res-auto"

    const-string v4, "rippleColor"

    invoke-interface {p1, v3, v4, v5}, Landroid/util/AttributeSet;->getAttributeIntValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v1

    .line 57
    .local v1, "background":I
    if-eq v1, v5, :cond_60

    .line 58
    invoke-virtual {p0, v1}, Lcom/gc/materialdesign/views/LayoutRipple;->setRippleColor(I)V

    goto :goto_2b

    .line 60
    :cond_60
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/LayoutRipple;->makePressColor()I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/gc/materialdesign/views/LayoutRipple;->setRippleColor(I)V

    goto :goto_2b
.end method

.method public setBackgroundColor(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 69
    iput p1, p0, Lcom/gc/materialdesign/views/LayoutRipple;->backgroundColor:I

    .line 70
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/LayoutRipple;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_c

    .line 71
    iget v0, p0, Lcom/gc/materialdesign/views/LayoutRipple;->backgroundColor:I

    iput v0, p0, Lcom/gc/materialdesign/views/LayoutRipple;->beforeBackground:I

    .line 72
    :cond_c
    invoke-super {p0, p1}, Lcom/gc/materialdesign/views/CustomView;->setBackgroundColor(I)V

    .line 73
    return-void
.end method

.method public setOnClickListener(Landroid/view/View$OnClickListener;)V
    .registers 2
    .param p1, "l"    # Landroid/view/View$OnClickListener;

    .prologue
    .line 188
    iput-object p1, p0, Lcom/gc/materialdesign/views/LayoutRipple;->onClickListener:Landroid/view/View$OnClickListener;

    .line 189
    return-void
.end method

.method public setRippleColor(I)V
    .registers 3
    .param p1, "rippleColor"    # I

    .prologue
    .line 192
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/gc/materialdesign/views/LayoutRipple;->rippleColor:Ljava/lang/Integer;

    .line 193
    return-void
.end method

.method public setRippleSpeed(I)V
    .registers 3
    .param p1, "rippleSpeed"    # I

    .prologue
    .line 76
    int-to-float v0, p1

    iput v0, p0, Lcom/gc/materialdesign/views/LayoutRipple;->rippleSpeed:F

    .line 77
    return-void
.end method

.method public setxRippleOrigin(Ljava/lang/Float;)V
    .registers 2
    .param p1, "xRippleOrigin"    # Ljava/lang/Float;

    .prologue
    .line 196
    iput-object p1, p0, Lcom/gc/materialdesign/views/LayoutRipple;->xRippleOrigin:Ljava/lang/Float;

    .line 197
    return-void
.end method

.method public setyRippleOrigin(Ljava/lang/Float;)V
    .registers 2
    .param p1, "yRippleOrigin"    # Ljava/lang/Float;

    .prologue
    .line 200
    iput-object p1, p0, Lcom/gc/materialdesign/views/LayoutRipple;->yRippleOrigin:Ljava/lang/Float;

    .line 201
    return-void
.end method
