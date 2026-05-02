.class public Lcom/gc/materialdesign/views/CheckBox;
.super Lcom/gc/materialdesign/views/CustomView;
.source "CheckBox.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/gc/materialdesign/views/CheckBox$OnCheckListener;,
        Lcom/gc/materialdesign/views/CheckBox$Check;
    }
.end annotation


# instance fields
.field backgroundColor:I

.field check:Z

.field checkView:Lcom/gc/materialdesign/views/CheckBox$Check;

.field onCheckListener:Lcom/gc/materialdesign/views/CheckBox$OnCheckListener;

.field press:Z

.field step:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v1, 0x0

    .line 32
    invoke-direct {p0, p1, p2}, Lcom/gc/materialdesign/views/CustomView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 22
    const-string v0, "#4CAF50"

    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/gc/materialdesign/views/CheckBox;->backgroundColor:I

    .line 26
    iput-boolean v1, p0, Lcom/gc/materialdesign/views/CheckBox;->press:Z

    .line 27
    iput-boolean v1, p0, Lcom/gc/materialdesign/views/CheckBox;->check:Z

    .line 180
    iput v1, p0, Lcom/gc/materialdesign/views/CheckBox;->step:I

    .line 33
    invoke-virtual {p0, p2}, Lcom/gc/materialdesign/views/CheckBox;->setAttributes(Landroid/util/AttributeSet;)V

    .line 34
    return-void
.end method

.method static synthetic access$000(Lcom/gc/materialdesign/views/CheckBox;I)V
    .registers 2
    .param p0, "x0"    # Lcom/gc/materialdesign/views/CheckBox;
    .param p1, "x1"    # I

    .prologue
    .line 20
    invoke-direct {p0, p1}, Lcom/gc/materialdesign/views/CheckBox;->changeBackgroundColor(I)V

    return-void
.end method

.method private changeBackgroundColor(I)V
    .registers 5
    .param p1, "color"    # I

    .prologue
    .line 132
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/CheckBox;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/LayerDrawable;

    .line 133
    .local v0, "layer":Landroid/graphics/drawable/LayerDrawable;
    sget v2, Lcom/gc/materialdesign/R$id;->shape_bacground:I

    invoke-virtual {v0, v2}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    check-cast v1, Landroid/graphics/drawable/GradientDrawable;

    .line 135
    .local v1, "shape":Landroid/graphics/drawable/GradientDrawable;
    invoke-virtual {v1, p1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 136
    return-void
.end method


# virtual methods
.method public invalidate()V
    .registers 2

    .prologue
    .line 83
    iget-object v0, p0, Lcom/gc/materialdesign/views/CheckBox;->checkView:Lcom/gc/materialdesign/views/CheckBox$Check;

    invoke-virtual {v0}, Lcom/gc/materialdesign/views/CheckBox$Check;->invalidate()V

    .line 84
    invoke-super {p0}, Lcom/gc/materialdesign/views/CustomView;->invalidate()V

    .line 85
    return-void
.end method

.method public isCheck()Z
    .registers 2

    .prologue
    .line 176
    iget-boolean v0, p0, Lcom/gc/materialdesign/views/CheckBox;->check:Z

    return v0
.end method

.method protected makePressColor()I
    .registers 6

    .prologue
    const/4 v3, 0x0

    .line 144
    iget v4, p0, Lcom/gc/materialdesign/views/CheckBox;->backgroundColor:I

    shr-int/lit8 v4, v4, 0x10

    and-int/lit16 v2, v4, 0xff

    .line 145
    .local v2, "r":I
    iget v4, p0, Lcom/gc/materialdesign/views/CheckBox;->backgroundColor:I

    shr-int/lit8 v4, v4, 0x8

    and-int/lit16 v1, v4, 0xff

    .line 146
    .local v1, "g":I
    iget v4, p0, Lcom/gc/materialdesign/views/CheckBox;->backgroundColor:I

    shr-int/lit8 v4, v4, 0x0

    and-int/lit16 v0, v4, 0xff

    .line 147
    .local v0, "b":I
    add-int/lit8 v4, v2, -0x1e

    if-gez v4, :cond_29

    move v2, v3

    .line 148
    :goto_18
    add-int/lit8 v4, v1, -0x1e

    if-gez v4, :cond_2c

    move v1, v3

    .line 149
    :goto_1d
    add-int/lit8 v4, v0, -0x1e

    if-gez v4, :cond_2f

    move v0, v3

    .line 150
    :goto_22
    const/16 v3, 0x46

    invoke-static {v3, v2, v1, v0}, Landroid/graphics/Color;->argb(IIII)I

    move-result v3

    return v3

    .line 147
    :cond_29
    add-int/lit8 v2, v2, -0x1e

    goto :goto_18

    .line 148
    :cond_2c
    add-int/lit8 v1, v1, -0x1e

    goto :goto_1d

    .line 149
    :cond_2f
    add-int/lit8 v0, v0, -0x1e

    goto :goto_22
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 6
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 119
    invoke-super {p0, p1}, Lcom/gc/materialdesign/views/CustomView;->onDraw(Landroid/graphics/Canvas;)V

    .line 120
    iget-boolean v1, p0, Lcom/gc/materialdesign/views/CheckBox;->press:Z

    if-eqz v1, :cond_36

    .line 121
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 122
    .local v0, "paint":Landroid/graphics/Paint;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 123
    iget-boolean v1, p0, Lcom/gc/materialdesign/views/CheckBox;->check:Z

    if-eqz v1, :cond_37

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/CheckBox;->makePressColor()I

    move-result v1

    :goto_18
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 125
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/CheckBox;->getWidth()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/CheckBox;->getHeight()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    int-to-float v2, v2

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/CheckBox;->getWidth()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    int-to-float v3, v3

    invoke-virtual {p1, v1, v2, v3, v0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 127
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/CheckBox;->invalidate()V

    .line 129
    .end local v0    # "paint":Landroid/graphics/Paint;
    :cond_36
    return-void

    .line 123
    .restart local v0    # "paint":Landroid/graphics/Paint;
    :cond_37
    const-string v1, "#446D6D6D"

    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v1

    goto :goto_18
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 7
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v4, 0x0

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 90
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/CheckBox;->invalidate()V

    .line 91
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/CheckBox;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_1f

    .line 92
    iput-boolean v1, p0, Lcom/gc/materialdesign/views/CheckBox;->isLastTouch:Z

    .line 93
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_27

    .line 94
    iget-boolean v0, p0, Lcom/gc/materialdesign/views/CheckBox;->check:Z

    if-eqz v0, :cond_20

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/CheckBox;->makePressColor()I

    move-result v0

    :goto_1c
    invoke-direct {p0, v0}, Lcom/gc/materialdesign/views/CheckBox;->changeBackgroundColor(I)V

    .line 114
    :cond_1f
    :goto_1f
    return v1

    .line 94
    :cond_20
    const-string v0, "#446D6D6D"

    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    goto :goto_1c

    .line 96
    :cond_27
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-ne v0, v1, :cond_1f

    .line 97
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/CheckBox;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v3, 0x106000d

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/gc/materialdesign/views/CheckBox;->changeBackgroundColor(I)V

    .line 99
    iput-boolean v2, p0, Lcom/gc/materialdesign/views/CheckBox;->press:Z

    .line 100
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/CheckBox;->getWidth()I

    move-result v3

    int-to-float v3, v3

    cmpg-float v0, v0, v3

    if-gtz v0, :cond_1f

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    cmpl-float v0, v0, v4

    if-ltz v0, :cond_1f

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/CheckBox;->getHeight()I

    move-result v3

    int-to-float v3, v3

    cmpg-float v0, v0, v3

    if-gtz v0, :cond_1f

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    cmpl-float v0, v0, v4

    if-ltz v0, :cond_1f

    .line 102
    iput-boolean v2, p0, Lcom/gc/materialdesign/views/CheckBox;->isLastTouch:Z

    .line 103
    iget-boolean v0, p0, Lcom/gc/materialdesign/views/CheckBox;->check:Z

    if-nez v0, :cond_8b

    move v0, v1

    :goto_6e
    iput-boolean v0, p0, Lcom/gc/materialdesign/views/CheckBox;->check:Z

    .line 104
    iget-object v0, p0, Lcom/gc/materialdesign/views/CheckBox;->onCheckListener:Lcom/gc/materialdesign/views/CheckBox$OnCheckListener;

    if-eqz v0, :cond_7b

    .line 105
    iget-object v0, p0, Lcom/gc/materialdesign/views/CheckBox;->onCheckListener:Lcom/gc/materialdesign/views/CheckBox$OnCheckListener;

    iget-boolean v3, p0, Lcom/gc/materialdesign/views/CheckBox;->check:Z

    invoke-interface {v0, v3}, Lcom/gc/materialdesign/views/CheckBox$OnCheckListener;->onCheck(Z)V

    .line 106
    :cond_7b
    iget-boolean v0, p0, Lcom/gc/materialdesign/views/CheckBox;->check:Z

    if-eqz v0, :cond_81

    .line 107
    iput v2, p0, Lcom/gc/materialdesign/views/CheckBox;->step:I

    .line 109
    :cond_81
    iget-boolean v0, p0, Lcom/gc/materialdesign/views/CheckBox;->check:Z

    if-eqz v0, :cond_1f

    .line 110
    iget-object v0, p0, Lcom/gc/materialdesign/views/CheckBox;->checkView:Lcom/gc/materialdesign/views/CheckBox$Check;

    invoke-virtual {v0}, Lcom/gc/materialdesign/views/CheckBox$Check;->changeBackground()V

    goto :goto_1f

    :cond_8b
    move v0, v2

    .line 103
    goto :goto_6e
.end method

.method protected setAttributes(Landroid/util/AttributeSet;)V
    .registers 11
    .param p1, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/high16 v5, 0x42400000    # 48.0f

    const/high16 v8, 0x41a00000    # 20.0f

    const/4 v7, -0x1

    .line 39
    sget v4, Lcom/gc/materialdesign/R$drawable;->background_checkbox:I

    invoke-virtual {p0, v4}, Lcom/gc/materialdesign/views/CheckBox;->setBackgroundResource(I)V

    .line 42
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/CheckBox;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-static {v5, v4}, Lcom/gc/materialdesign/utils/Utils;->dpToPx(FLandroid/content/res/Resources;)I

    move-result v4

    invoke-virtual {p0, v4}, Lcom/gc/materialdesign/views/CheckBox;->setMinimumHeight(I)V

    .line 43
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/CheckBox;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-static {v5, v4}, Lcom/gc/materialdesign/utils/Utils;->dpToPx(FLandroid/content/res/Resources;)I

    move-result v4

    invoke-virtual {p0, v4}, Lcom/gc/materialdesign/views/CheckBox;->setMinimumWidth(I)V

    .line 47
    const-string v4, "http://schemas.android.com/apk/res/android"

    const-string v5, "background"

    invoke-interface {p1, v4, v5, v7}, Landroid/util/AttributeSet;->getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    .line 49
    .local v0, "bacgroundColor":I
    if-eq v0, v7, :cond_76

    .line 50
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/CheckBox;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4, v0}, Landroid/content/res/Resources;->getColor(I)I

    move-result v4

    invoke-virtual {p0, v4}, Lcom/gc/materialdesign/views/CheckBox;->setBackgroundColor(I)V

    .line 59
    :cond_35
    :goto_35
    const-string v4, "http://schemas.android.com/apk/res-auto"

    const-string v5, "check"

    const/4 v6, 0x0

    invoke-interface {p1, v4, v5, v6}, Landroid/util/AttributeSet;->getAttributeBooleanValue(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v2

    .line 61
    .local v2, "check":Z
    new-instance v4, Lcom/gc/materialdesign/views/CheckBox$1;

    invoke-direct {v4, p0, v2}, Lcom/gc/materialdesign/views/CheckBox$1;-><init>(Lcom/gc/materialdesign/views/CheckBox;Z)V

    invoke-virtual {p0, v4}, Lcom/gc/materialdesign/views/CheckBox;->post(Ljava/lang/Runnable;)Z

    .line 72
    new-instance v4, Lcom/gc/materialdesign/views/CheckBox$Check;

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/CheckBox;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v4, p0, v5}, Lcom/gc/materialdesign/views/CheckBox$Check;-><init>(Lcom/gc/materialdesign/views/CheckBox;Landroid/content/Context;)V

    iput-object v4, p0, Lcom/gc/materialdesign/views/CheckBox;->checkView:Lcom/gc/materialdesign/views/CheckBox$Check;

    .line 73
    new-instance v3, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/CheckBox;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-static {v8, v4}, Lcom/gc/materialdesign/utils/Utils;->dpToPx(FLandroid/content/res/Resources;)I

    move-result v4

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/CheckBox;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-static {v8, v5}, Lcom/gc/materialdesign/utils/Utils;->dpToPx(FLandroid/content/res/Resources;)I

    move-result v5

    invoke-direct {v3, v4, v5}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 75
    .local v3, "params":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v4, 0xd

    invoke-virtual {v3, v4, v7}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 76
    iget-object v4, p0, Lcom/gc/materialdesign/views/CheckBox;->checkView:Lcom/gc/materialdesign/views/CheckBox$Check;

    invoke-virtual {v4, v3}, Lcom/gc/materialdesign/views/CheckBox$Check;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 77
    iget-object v4, p0, Lcom/gc/materialdesign/views/CheckBox;->checkView:Lcom/gc/materialdesign/views/CheckBox$Check;

    invoke-virtual {p0, v4}, Lcom/gc/materialdesign/views/CheckBox;->addView(Landroid/view/View;)V

    .line 79
    return-void

    .line 54
    .end local v2    # "check":Z
    .end local v3    # "params":Landroid/widget/RelativeLayout$LayoutParams;
    :cond_76
    const-string v4, "http://schemas.android.com/apk/res/android"

    const-string v5, "background"

    invoke-interface {p1, v4, v5, v7}, Landroid/util/AttributeSet;->getAttributeIntValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v1

    .line 55
    .local v1, "background":I
    if-eq v1, v7, :cond_35

    .line 56
    invoke-virtual {p0, v1}, Lcom/gc/materialdesign/views/CheckBox;->setBackgroundColor(I)V

    goto :goto_35
.end method

.method public setBackgroundColor(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 155
    iput p1, p0, Lcom/gc/materialdesign/views/CheckBox;->backgroundColor:I

    .line 156
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/CheckBox;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_c

    .line 157
    iget v0, p0, Lcom/gc/materialdesign/views/CheckBox;->backgroundColor:I

    iput v0, p0, Lcom/gc/materialdesign/views/CheckBox;->beforeBackground:I

    .line 158
    :cond_c
    invoke-direct {p0, p1}, Lcom/gc/materialdesign/views/CheckBox;->changeBackgroundColor(I)V

    .line 159
    return-void
.end method

.method public setChecked(Z)V
    .registers 5
    .param p1, "check"    # Z

    .prologue
    const/4 v2, 0x0

    .line 162
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/CheckBox;->invalidate()V

    .line 163
    iput-boolean p1, p0, Lcom/gc/materialdesign/views/CheckBox;->check:Z

    .line 164
    invoke-virtual {p0, v2}, Lcom/gc/materialdesign/views/CheckBox;->setPressed(Z)V

    .line 165
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/CheckBox;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x106000d

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/gc/materialdesign/views/CheckBox;->changeBackgroundColor(I)V

    .line 167
    if-eqz p1, :cond_1b

    .line 168
    iput v2, p0, Lcom/gc/materialdesign/views/CheckBox;->step:I

    .line 170
    :cond_1b
    if-eqz p1, :cond_22

    .line 171
    iget-object v0, p0, Lcom/gc/materialdesign/views/CheckBox;->checkView:Lcom/gc/materialdesign/views/CheckBox$Check;

    invoke-virtual {v0}, Lcom/gc/materialdesign/views/CheckBox$Check;->changeBackground()V

    .line 173
    :cond_22
    return-void
.end method

.method public setOncheckListener(Lcom/gc/materialdesign/views/CheckBox$OnCheckListener;)V
    .registers 2
    .param p1, "onCheckListener"    # Lcom/gc/materialdesign/views/CheckBox$OnCheckListener;

    .prologue
    .line 234
    iput-object p1, p0, Lcom/gc/materialdesign/views/CheckBox;->onCheckListener:Lcom/gc/materialdesign/views/CheckBox$OnCheckListener;

    .line 235
    return-void
.end method
