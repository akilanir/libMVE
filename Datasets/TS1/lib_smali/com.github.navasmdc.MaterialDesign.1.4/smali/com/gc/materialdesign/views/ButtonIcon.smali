.class public Lcom/gc/materialdesign/views/ButtonIcon;
.super Lcom/gc/materialdesign/views/ButtonFloat;
.source "ButtonIcon.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const v4, 0x106000d

    .line 17
    invoke-direct {p0, p1, p2}, Lcom/gc/materialdesign/views/ButtonFloat;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 19
    :try_start_6
    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ButtonIcon;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x106000d

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {p0, v1}, Lcom/gc/materialdesign/views/ButtonIcon;->setBackground(Landroid/graphics/drawable/Drawable;)V
    :try_end_19
    .catch Ljava/lang/NoSuchMethodError; {:try_start_6 .. :try_end_19} :catch_33

    .line 23
    :goto_19
    const/high16 v1, 0x40000000    # 2.0f

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ButtonIcon;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/gc/materialdesign/utils/Utils;->dpToPx(FLandroid/content/res/Resources;)I

    move-result v1

    int-to-float v1, v1

    iput v1, p0, Lcom/gc/materialdesign/views/ButtonIcon;->rippleSpeed:F

    .line 24
    const/high16 v1, 0x40a00000    # 5.0f

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ButtonIcon;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/gc/materialdesign/utils/Utils;->dpToPx(FLandroid/content/res/Resources;)I

    move-result v1

    iput v1, p0, Lcom/gc/materialdesign/views/ButtonIcon;->rippleSize:I

    .line 25
    return-void

    .line 20
    :catch_33
    move-exception v0

    .line 21
    .local v0, "e":Ljava/lang/NoSuchMethodError;
    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ButtonIcon;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {p0, v1}, Lcom/gc/materialdesign/views/ButtonIcon;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_19
.end method


# virtual methods
.method protected makePressColor()I
    .registers 2

    .prologue
    .line 59
    iget v0, p0, Lcom/gc/materialdesign/views/ButtonIcon;->backgroundColor:I

    return v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 7
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/high16 v4, -0x40800000    # -1.0f

    .line 39
    iget v1, p0, Lcom/gc/materialdesign/views/ButtonIcon;->x:F

    cmpl-float v1, v1, v4

    if-eqz v1, :cond_64

    .line 40
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 41
    .local v0, "paint":Landroid/graphics/Paint;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 42
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ButtonIcon;->makePressColor()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 43
    iget v1, p0, Lcom/gc/materialdesign/views/ButtonIcon;->x:F

    iget v2, p0, Lcom/gc/materialdesign/views/ButtonIcon;->y:F

    iget v3, p0, Lcom/gc/materialdesign/views/ButtonIcon;->radius:F

    invoke-virtual {p1, v1, v2, v3, v0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 44
    iget v1, p0, Lcom/gc/materialdesign/views/ButtonIcon;->radius:F

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ButtonIcon;->getHeight()I

    move-result v2

    iget v3, p0, Lcom/gc/materialdesign/views/ButtonIcon;->rippleSize:I

    div-int/2addr v2, v3

    int-to-float v2, v2

    cmpl-float v1, v1, v2

    if-lez v1, :cond_36

    .line 45
    iget v1, p0, Lcom/gc/materialdesign/views/ButtonIcon;->radius:F

    iget v2, p0, Lcom/gc/materialdesign/views/ButtonIcon;->rippleSpeed:F

    add-float/2addr v1, v2

    iput v1, p0, Lcom/gc/materialdesign/views/ButtonIcon;->radius:F

    .line 46
    :cond_36
    iget v1, p0, Lcom/gc/materialdesign/views/ButtonIcon;->radius:F

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ButtonIcon;->getWidth()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    int-to-float v2, v2

    iget v3, p0, Lcom/gc/materialdesign/views/ButtonIcon;->rippleSpeed:F

    sub-float/2addr v2, v3

    cmpl-float v1, v1, v2

    if-ltz v1, :cond_61

    .line 47
    iput v4, p0, Lcom/gc/materialdesign/views/ButtonIcon;->x:F

    .line 48
    iput v4, p0, Lcom/gc/materialdesign/views/ButtonIcon;->y:F

    .line 49
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ButtonIcon;->getHeight()I

    move-result v1

    iget v2, p0, Lcom/gc/materialdesign/views/ButtonIcon;->rippleSize:I

    div-int/2addr v1, v2

    int-to-float v1, v1

    iput v1, p0, Lcom/gc/materialdesign/views/ButtonIcon;->radius:F

    .line 50
    iget-object v1, p0, Lcom/gc/materialdesign/views/ButtonIcon;->onClickListener:Landroid/view/View$OnClickListener;

    if-eqz v1, :cond_61

    iget-boolean v1, p0, Lcom/gc/materialdesign/views/ButtonIcon;->clickAfterRipple:Z

    if-eqz v1, :cond_61

    .line 51
    iget-object v1, p0, Lcom/gc/materialdesign/views/ButtonIcon;->onClickListener:Landroid/view/View$OnClickListener;

    invoke-interface {v1, p0}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 53
    :cond_61
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ButtonIcon;->invalidate()V

    .line 55
    .end local v0    # "paint":Landroid/graphics/Paint;
    :cond_64
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 5
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 29
    invoke-super {p0, p1}, Lcom/gc/materialdesign/views/ButtonFloat;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    .line 30
    .local v0, "returnBool":Z
    iget v1, p0, Lcom/gc/materialdesign/views/ButtonIcon;->x:F

    const/high16 v2, -0x40800000    # -1.0f

    cmpl-float v1, v1, v2

    if-eqz v1, :cond_1e

    .line 31
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ButtonIcon;->getWidth()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    iput v1, p0, Lcom/gc/materialdesign/views/ButtonIcon;->x:F

    .line 32
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ButtonIcon;->getHeight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    iput v1, p0, Lcom/gc/materialdesign/views/ButtonIcon;->y:F

    .line 34
    :cond_1e
    return v0
.end method
