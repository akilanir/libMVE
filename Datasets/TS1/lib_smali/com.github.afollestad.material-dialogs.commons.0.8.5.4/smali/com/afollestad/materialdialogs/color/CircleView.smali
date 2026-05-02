.class public Lcom/afollestad/materialdialogs/color/CircleView;
.super Landroid/widget/FrameLayout;
.source "CircleView.java"


# instance fields
.field private final borderWidthLarge:I

.field private final borderWidthSmall:I

.field private final innerPaint:Landroid/graphics/Paint;

.field private mSelected:Z

.field private final outerPaint:Landroid/graphics/Paint;

.field private final whitePaint:Landroid/graphics/Paint;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 40
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/afollestad/materialdialogs/color/CircleView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 41
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 44
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/afollestad/materialdialogs/color/CircleView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 45
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    const/4 v3, 0x1

    .line 48
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 49
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/color/CircleView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 50
    .local v0, "r":Landroid/content/res/Resources;
    const/high16 v1, 0x40400000    # 3.0f

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    invoke-static {v3, v1, v2}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v1

    float-to-int v1, v1

    iput v1, p0, Lcom/afollestad/materialdialogs/color/CircleView;->borderWidthSmall:I

    .line 51
    const/high16 v1, 0x40a00000    # 5.0f

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    invoke-static {v3, v1, v2}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v1

    float-to-int v1, v1

    iput v1, p0, Lcom/afollestad/materialdialogs/color/CircleView;->borderWidthLarge:I

    .line 53
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    iput-object v1, p0, Lcom/afollestad/materialdialogs/color/CircleView;->whitePaint:Landroid/graphics/Paint;

    .line 54
    iget-object v1, p0, Lcom/afollestad/materialdialogs/color/CircleView;->whitePaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 55
    iget-object v1, p0, Lcom/afollestad/materialdialogs/color/CircleView;->whitePaint:Landroid/graphics/Paint;

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 56
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    iput-object v1, p0, Lcom/afollestad/materialdialogs/color/CircleView;->innerPaint:Landroid/graphics/Paint;

    .line 57
    iget-object v1, p0, Lcom/afollestad/materialdialogs/color/CircleView;->innerPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 58
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    iput-object v1, p0, Lcom/afollestad/materialdialogs/color/CircleView;->outerPaint:Landroid/graphics/Paint;

    .line 59
    iget-object v1, p0, Lcom/afollestad/materialdialogs/color/CircleView;->outerPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 61
    const v1, -0xbbbbbc

    invoke-direct {p0, v1}, Lcom/afollestad/materialdialogs/color/CircleView;->update(I)V

    .line 62
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/afollestad/materialdialogs/color/CircleView;->setWillNotDraw(Z)V

    .line 63
    return-void
.end method

.method private createSelector(I)Landroid/graphics/drawable/Drawable;
    .registers 7
    .param p1, "color"    # I

    .prologue
    .line 173
    new-instance v0, Landroid/graphics/drawable/ShapeDrawable;

    new-instance v2, Landroid/graphics/drawable/shapes/OvalShape;

    invoke-direct {v2}, Landroid/graphics/drawable/shapes/OvalShape;-><init>()V

    invoke-direct {v0, v2}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    .line 174
    .local v0, "darkerCircle":Landroid/graphics/drawable/ShapeDrawable;
    invoke-virtual {v0}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    move-result-object v2

    invoke-static {p1}, Lcom/afollestad/materialdialogs/color/CircleView;->shiftColorUp(I)I

    move-result v3

    invoke-static {v3}, Lcom/afollestad/materialdialogs/color/CircleView;->translucentColor(I)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 175
    new-instance v1, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v1}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    .line 176
    .local v1, "stateListDrawable":Landroid/graphics/drawable/StateListDrawable;
    const/4 v2, 0x1

    new-array v2, v2, [I

    const/4 v3, 0x0

    const v4, 0x10100a7

    aput v4, v2, v3

    invoke-virtual {v1, v2, v0}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 177
    return-object v1
.end method

.method public static shiftColor(IF)I
    .registers 5
    .param p0, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param
    .param p1, "by"    # F
        .annotation build Landroid/support/annotation/FloatRange;
            from = 0.0
            to = 2.0
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/ColorInt;
    .end annotation

    .prologue
    .line 182
    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v1, p1, v1

    if-nez v1, :cond_7

    .line 186
    .end local p0    # "color":I
    :goto_6
    return p0

    .line 183
    .restart local p0    # "color":I
    :cond_7
    const/4 v1, 0x3

    new-array v0, v1, [F

    .line 184
    .local v0, "hsv":[F
    invoke-static {p0, v0}, Landroid/graphics/Color;->colorToHSV(I[F)V

    .line 185
    const/4 v1, 0x2

    aget v2, v0, v1

    mul-float/2addr v2, p1

    aput v2, v0, v1

    .line 186
    invoke-static {v0}, Landroid/graphics/Color;->HSVToColor([F)I

    move-result p0

    goto :goto_6
.end method

.method public static shiftColorDown(I)I
    .registers 2
    .param p0, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/ColorInt;
    .end annotation

    .prologue
    .line 191
    const v0, 0x3f666666    # 0.9f

    invoke-static {p0, v0}, Lcom/afollestad/materialdialogs/color/CircleView;->shiftColor(IF)I

    move-result v0

    return v0
.end method

.method public static shiftColorUp(I)I
    .registers 2
    .param p0, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/ColorInt;
    .end annotation

    .prologue
    .line 196
    const v0, 0x3f8ccccd    # 1.1f

    invoke-static {p0, v0}, Lcom/afollestad/materialdialogs/color/CircleView;->shiftColor(IF)I

    move-result v0

    return v0
.end method

.method private static translucentColor(I)I
    .registers 8
    .param p0, "color"    # I
    .annotation build Landroid/support/annotation/ColorInt;
    .end annotation

    .prologue
    .line 164
    const v2, 0x3f333333    # 0.7f

    .line 165
    .local v2, "factor":F
    invoke-static {p0}, Landroid/graphics/Color;->alpha(I)I

    move-result v5

    int-to-float v5, v5

    const v6, 0x3f333333    # 0.7f

    mul-float/2addr v5, v6

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v0

    .line 166
    .local v0, "alpha":I
    invoke-static {p0}, Landroid/graphics/Color;->red(I)I

    move-result v4

    .line 167
    .local v4, "red":I
    invoke-static {p0}, Landroid/graphics/Color;->green(I)I

    move-result v3

    .line 168
    .local v3, "green":I
    invoke-static {p0}, Landroid/graphics/Color;->blue(I)I

    move-result v1

    .line 169
    .local v1, "blue":I
    invoke-static {v0, v4, v3, v1}, Landroid/graphics/Color;->argb(IIII)I

    move-result v5

    return v5
.end method

.method private update(I)V
    .registers 10
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 66
    iget-object v4, p0, Lcom/afollestad/materialdialogs/color/CircleView;->innerPaint:Landroid/graphics/Paint;

    invoke-virtual {v4, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 67
    iget-object v4, p0, Lcom/afollestad/materialdialogs/color/CircleView;->outerPaint:Landroid/graphics/Paint;

    invoke-static {p1}, Lcom/afollestad/materialdialogs/color/CircleView;->shiftColorDown(I)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 69
    invoke-direct {p0, p1}, Lcom/afollestad/materialdialogs/color/CircleView;->createSelector(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 70
    .local v2, "selector":Landroid/graphics/drawable/Drawable;
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x15

    if-lt v4, v5, :cond_3c

    .line 71
    new-array v3, v7, [[I

    new-array v4, v7, [I

    const v5, 0x10100a7

    aput v5, v4, v6

    aput-object v4, v3, v6

    .line 74
    .local v3, "states":[[I
    new-array v0, v7, [I

    invoke-static {p1}, Lcom/afollestad/materialdialogs/color/CircleView;->shiftColorUp(I)I

    move-result v4

    aput v4, v0, v6

    .line 75
    .local v0, "colors":[I
    new-instance v1, Landroid/content/res/ColorStateList;

    invoke-direct {v1, v3, v0}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    .line 76
    .local v1, "rippleColors":Landroid/content/res/ColorStateList;
    new-instance v4, Landroid/graphics/drawable/RippleDrawable;

    const/4 v5, 0x0

    invoke-direct {v4, v1, v2, v5}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0, v4}, Lcom/afollestad/materialdialogs/color/CircleView;->setForeground(Landroid/graphics/drawable/Drawable;)V

    .line 80
    .end local v0    # "colors":[I
    .end local v1    # "rippleColors":Landroid/content/res/ColorStateList;
    .end local v3    # "states":[[I
    :goto_3b
    return-void

    .line 78
    :cond_3c
    invoke-virtual {p0, v2}, Lcom/afollestad/materialdialogs/color/CircleView;->setForeground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_3b
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 9
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 137
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onDraw(Landroid/graphics/Canvas;)V

    .line 138
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/color/CircleView;->getMeasuredWidth()I

    move-result v3

    div-int/lit8 v1, v3, 0x2

    .line 139
    .local v1, "outerRadius":I
    iget-boolean v3, p0, Lcom/afollestad/materialdialogs/color/CircleView;->mSelected:Z

    if-eqz v3, :cond_52

    .line 140
    iget v3, p0, Lcom/afollestad/materialdialogs/color/CircleView;->borderWidthLarge:I

    sub-int v2, v1, v3

    .line 141
    .local v2, "whiteRadius":I
    iget v3, p0, Lcom/afollestad/materialdialogs/color/CircleView;->borderWidthSmall:I

    sub-int v0, v2, v3

    .line 142
    .local v0, "innerRadius":I
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/color/CircleView;->getMeasuredWidth()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    int-to-float v3, v3

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/color/CircleView;->getMeasuredHeight()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    int-to-float v4, v4

    int-to-float v5, v1

    iget-object v6, p0, Lcom/afollestad/materialdialogs/color/CircleView;->outerPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v3, v4, v5, v6}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 146
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/color/CircleView;->getMeasuredWidth()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    int-to-float v3, v3

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/color/CircleView;->getMeasuredHeight()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    int-to-float v4, v4

    int-to-float v5, v2

    iget-object v6, p0, Lcom/afollestad/materialdialogs/color/CircleView;->whitePaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v3, v4, v5, v6}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 150
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/color/CircleView;->getMeasuredWidth()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    int-to-float v3, v3

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/color/CircleView;->getMeasuredHeight()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    int-to-float v4, v4

    int-to-float v5, v0

    iget-object v6, p0, Lcom/afollestad/materialdialogs/color/CircleView;->innerPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v3, v4, v5, v6}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 160
    .end local v0    # "innerRadius":I
    .end local v2    # "whiteRadius":I
    :goto_51
    return-void

    .line 155
    :cond_52
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/color/CircleView;->getMeasuredWidth()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    int-to-float v3, v3

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/color/CircleView;->getMeasuredHeight()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    int-to-float v4, v4

    int-to-float v5, v1

    iget-object v6, p0, Lcom/afollestad/materialdialogs/color/CircleView;->innerPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v3, v4, v5, v6}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto :goto_51
.end method

.method protected onMeasure(II)V
    .registers 5
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 131
    invoke-super {p0, p1, p1}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 132
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/color/CircleView;->getMeasuredWidth()I

    move-result v0

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/color/CircleView;->getMeasuredWidth()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/afollestad/materialdialogs/color/CircleView;->setMeasuredDimension(II)V

    .line 133
    return-void
.end method

.method public setActivated(Z)V
    .registers 4
    .param p1, "activated"    # Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 120
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot use setActivated() on CircleView."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setBackground(Landroid/graphics/drawable/Drawable;)V
    .registers 4
    .param p1, "background"    # Landroid/graphics/drawable/Drawable;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 100
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot use setBackground() on CircleView."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setBackgroundColor(I)V
    .registers 2
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 84
    invoke-direct {p0, p1}, Lcom/afollestad/materialdialogs/color/CircleView;->update(I)V

    .line 85
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/color/CircleView;->requestLayout()V

    .line 86
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/color/CircleView;->invalidate()V

    .line 87
    return-void
.end method

.method public setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 4
    .param p1, "background"    # Landroid/graphics/drawable/Drawable;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 110
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot use setBackgroundDrawable() on CircleView."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setBackgroundResource(I)V
    .registers 3
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param

    .prologue
    .line 91
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/color/CircleView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/afollestad/materialdialogs/util/DialogUtils;->getColor(Landroid/content/Context;I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/color/CircleView;->setBackgroundColor(I)V

    .line 92
    return-void
.end method

.method public setSelected(Z)V
    .registers 2
    .param p1, "selected"    # Z

    .prologue
    .line 124
    iput-boolean p1, p0, Lcom/afollestad/materialdialogs/color/CircleView;->mSelected:Z

    .line 125
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/color/CircleView;->requestLayout()V

    .line 126
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/color/CircleView;->invalidate()V

    .line 127
    return-void
.end method

.method public showHint(I)V
    .registers 16
    .param p1, "color"    # I

    .prologue
    const/4 v13, 0x1

    const/4 v12, 0x0

    .line 200
    const/4 v9, 0x2

    new-array v6, v9, [I

    .line 201
    .local v6, "screenPos":[I
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    .line 202
    .local v2, "displayFrame":Landroid/graphics/Rect;
    invoke-virtual {p0, v6}, Lcom/afollestad/materialdialogs/color/CircleView;->getLocationOnScreen([I)V

    .line 203
    invoke-virtual {p0, v2}, Lcom/afollestad/materialdialogs/color/CircleView;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    .line 204
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/color/CircleView;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 205
    .local v1, "context":Landroid/content/Context;
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/color/CircleView;->getWidth()I

    move-result v8

    .line 206
    .local v8, "width":I
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/color/CircleView;->getHeight()I

    move-result v3

    .line 207
    .local v3, "height":I
    aget v9, v6, v13

    div-int/lit8 v10, v3, 0x2

    add-int v4, v9, v10

    .line 208
    .local v4, "midy":I
    aget v9, v6, v12

    div-int/lit8 v10, v8, 0x2

    add-int v5, v9, v10

    .line 209
    .local v5, "referenceX":I
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->getLayoutDirection(Landroid/view/View;)I

    move-result v9

    if-nez v9, :cond_3a

    .line 210
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v9

    iget v7, v9, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 211
    .local v7, "screenWidth":I
    sub-int v5, v7, v5

    .line 213
    .end local v7    # "screenWidth":I
    :cond_3a
    const-string v9, "#%06X"

    new-array v10, v13, [Ljava/lang/Object;

    const v11, 0xffffff

    and-int/2addr v11, p1

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v10, v12

    invoke-static {v9, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v1, v9, v12}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 214
    .local v0, "cheatSheet":Landroid/widget/Toast;
    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v9

    if-ge v4, v9, :cond_66

    .line 216
    const v9, 0x800035

    aget v10, v6, v13

    add-int/2addr v10, v3

    iget v11, v2, Landroid/graphics/Rect;->top:I

    sub-int/2addr v10, v11

    invoke-virtual {v0, v9, v5, v10}, Landroid/widget/Toast;->setGravity(III)V

    .line 222
    :goto_62
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 223
    return-void

    .line 220
    :cond_66
    const/16 v9, 0x51

    invoke-virtual {v0, v9, v12, v3}, Landroid/widget/Toast;->setGravity(III)V

    goto :goto_62
.end method
