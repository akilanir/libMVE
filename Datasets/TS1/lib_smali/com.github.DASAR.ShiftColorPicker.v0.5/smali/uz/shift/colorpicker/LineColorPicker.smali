.class public Luz/shift/colorpicker/LineColorPicker;
.super Landroid/view/View;
.source "LineColorPicker.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Luz/shift/colorpicker/LineColorPicker$1;,
        Luz/shift/colorpicker/LineColorPicker$SavedState;
    }
.end annotation


# static fields
.field public static final HORIZONTAL:I = 0x0

.field public static final VERTICAL:I = 0x1


# instance fields
.field private cellSize:I

.field colors:[I

.field private isClick:Z

.field isColorSelected:Z

.field private mOrientation:I

.field private onColorChanged:Luz/shift/colorpicker/OnColorChangedListener;

.field private paint:Landroid/graphics/Paint;

.field private rect:Landroid/graphics/Rect;

.field private screenH:I

.field private screenW:I

.field private selectedColor:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 12
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v8, -0x1

    const/4 v4, 0x0

    .line 44
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 22
    invoke-virtual {p0}, Luz/shift/colorpicker/LineColorPicker;->isInEditMode()Z

    move-result v6

    if-eqz v6, :cond_76

    .line 23
    sget-object v6, Luz/shift/colorpicker/Palette;->DEFAULT:[I

    iput-object v6, p0, Luz/shift/colorpicker/LineColorPicker;->colors:[I

    .line 30
    :goto_f
    new-instance v6, Landroid/graphics/Rect;

    invoke-direct {v6}, Landroid/graphics/Rect;-><init>()V

    iput-object v6, p0, Luz/shift/colorpicker/LineColorPicker;->rect:Landroid/graphics/Rect;

    .line 33
    iput-boolean v4, p0, Luz/shift/colorpicker/LineColorPicker;->isColorSelected:Z

    .line 35
    iget-object v6, p0, Luz/shift/colorpicker/LineColorPicker;->colors:[I

    aget v6, v6, v4

    iput v6, p0, Luz/shift/colorpicker/LineColorPicker;->selectedColor:I

    .line 41
    iput v4, p0, Luz/shift/colorpicker/LineColorPicker;->mOrientation:I

    .line 154
    iput-boolean v4, p0, Luz/shift/colorpicker/LineColorPicker;->isClick:Z

    .line 46
    new-instance v6, Landroid/graphics/Paint;

    invoke-direct {v6}, Landroid/graphics/Paint;-><init>()V

    iput-object v6, p0, Luz/shift/colorpicker/LineColorPicker;->paint:Landroid/graphics/Paint;

    .line 47
    iget-object v6, p0, Luz/shift/colorpicker/LineColorPicker;->paint:Landroid/graphics/Paint;

    sget-object v7, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 49
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v6

    sget-object v7, Luz/shift/colorpicker/R$styleable;->LineColorPicker:[I

    invoke-virtual {v6, p2, v7, v4, v4}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 52
    .local v0, "a":Landroid/content/res/TypedArray;
    :try_start_3a
    sget v6, Luz/shift/colorpicker/R$styleable;->LineColorPicker_orientation:I

    const/4 v7, 0x0

    invoke-virtual {v0, v6, v7}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v6

    iput v6, p0, Luz/shift/colorpicker/LineColorPicker;->mOrientation:I

    .line 54
    invoke-virtual {p0}, Luz/shift/colorpicker/LineColorPicker;->isInEditMode()Z

    move-result v6

    if-nez v6, :cond_5d

    .line 55
    sget v6, Luz/shift/colorpicker/R$styleable;->LineColorPicker_colors:I

    const/4 v7, -0x1

    invoke-virtual {v0, v6, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    .line 57
    .local v2, "colorsArrayResId":I
    if-lez v2, :cond_5d

    .line 58
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6, v2}, Landroid/content/res/Resources;->getIntArray(I)[I

    move-result-object v1

    .line 59
    .local v1, "colors":[I
    invoke-virtual {p0, v1}, Luz/shift/colorpicker/LineColorPicker;->setColors([I)V

    .line 63
    .end local v1    # "colors":[I
    .end local v2    # "colorsArrayResId":I
    :cond_5d
    sget v6, Luz/shift/colorpicker/R$styleable;->LineColorPicker_selectedColorIndex:I

    const/4 v7, -0x1

    invoke-virtual {v0, v6, v7}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v5

    .line 65
    .local v5, "selected":I
    if-eq v5, v8, :cond_72

    .line 66
    invoke-virtual {p0}, Luz/shift/colorpicker/LineColorPicker;->getColors()[I

    move-result-object v3

    .line 68
    .local v3, "currentColors":[I
    if-eqz v3, :cond_6d

    array-length v4, v3

    .line 70
    .local v4, "currentColorsLength":I
    :cond_6d
    if-ge v5, v4, :cond_72

    .line 71
    invoke-virtual {p0, v5}, Luz/shift/colorpicker/LineColorPicker;->setSelectedColorPosition(I)V
    :try_end_72
    .catchall {:try_start_3a .. :try_end_72} :catchall_7c

    .line 75
    .end local v3    # "currentColors":[I
    .end local v4    # "currentColorsLength":I
    :cond_72
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 77
    return-void

    .line 25
    .end local v0    # "a":Landroid/content/res/TypedArray;
    .end local v5    # "selected":I
    :cond_76
    const/4 v6, 0x1

    new-array v6, v6, [I

    iput-object v6, p0, Luz/shift/colorpicker/LineColorPicker;->colors:[I

    goto :goto_f

    .line 75
    .restart local v0    # "a":Landroid/content/res/TypedArray;
    :catchall_7c
    move-exception v6

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    throw v6
.end method

.method private containsColor([II)Z
    .registers 5
    .param p1, "colors"    # [I
    .param p2, "c"    # I

    .prologue
    .line 400
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v1, p1

    if-ge v0, v1, :cond_d

    .line 401
    aget v1, p1, v0

    if-ne v1, p2, :cond_a

    .line 402
    const/4 v1, 0x1

    .line 406
    :goto_9
    return v1

    .line 400
    :cond_a
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 406
    :cond_d
    const/4 v1, 0x0

    goto :goto_9
.end method

.method private drawHorizontalPicker(Landroid/graphics/Canvas;)V
    .registers 8
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v5, 0x0

    .line 121
    iget-object v2, p0, Luz/shift/colorpicker/LineColorPicker;->rect:Landroid/graphics/Rect;

    iput v5, v2, Landroid/graphics/Rect;->left:I

    .line 122
    iget-object v2, p0, Luz/shift/colorpicker/LineColorPicker;->rect:Landroid/graphics/Rect;

    iput v5, v2, Landroid/graphics/Rect;->top:I

    .line 123
    iget-object v2, p0, Luz/shift/colorpicker/LineColorPicker;->rect:Landroid/graphics/Rect;

    iput v5, v2, Landroid/graphics/Rect;->right:I

    .line 124
    iget-object v2, p0, Luz/shift/colorpicker/LineColorPicker;->rect:Landroid/graphics/Rect;

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v3

    iput v3, v2, Landroid/graphics/Rect;->bottom:I

    .line 127
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v2

    int-to-float v2, v2

    const v3, 0x3da3d70a    # 0.08f

    mul-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v1

    .line 129
    .local v1, "margin":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_23
    iget-object v2, p0, Luz/shift/colorpicker/LineColorPicker;->colors:[I

    array-length v2, v2

    if-ge v0, v2, :cond_72

    .line 131
    iget-object v2, p0, Luz/shift/colorpicker/LineColorPicker;->paint:Landroid/graphics/Paint;

    iget-object v3, p0, Luz/shift/colorpicker/LineColorPicker;->colors:[I

    aget v3, v3, v0

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 133
    iget-object v2, p0, Luz/shift/colorpicker/LineColorPicker;->rect:Landroid/graphics/Rect;

    iget-object v3, p0, Luz/shift/colorpicker/LineColorPicker;->rect:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->right:I

    iput v3, v2, Landroid/graphics/Rect;->left:I

    .line 134
    iget-object v2, p0, Luz/shift/colorpicker/LineColorPicker;->rect:Landroid/graphics/Rect;

    iget v3, v2, Landroid/graphics/Rect;->right:I

    iget v4, p0, Luz/shift/colorpicker/LineColorPicker;->cellSize:I

    add-int/2addr v3, v4

    iput v3, v2, Landroid/graphics/Rect;->right:I

    .line 136
    iget-boolean v2, p0, Luz/shift/colorpicker/LineColorPicker;->isColorSelected:Z

    if-eqz v2, :cond_64

    iget-object v2, p0, Luz/shift/colorpicker/LineColorPicker;->colors:[I

    aget v2, v2, v0

    iget v3, p0, Luz/shift/colorpicker/LineColorPicker;->selectedColor:I

    if-ne v2, v3, :cond_64

    .line 137
    iget-object v2, p0, Luz/shift/colorpicker/LineColorPicker;->rect:Landroid/graphics/Rect;

    iput v5, v2, Landroid/graphics/Rect;->top:I

    .line 138
    iget-object v2, p0, Luz/shift/colorpicker/LineColorPicker;->rect:Landroid/graphics/Rect;

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v3

    iput v3, v2, Landroid/graphics/Rect;->bottom:I

    .line 144
    :goto_5a
    iget-object v2, p0, Luz/shift/colorpicker/LineColorPicker;->rect:Landroid/graphics/Rect;

    iget-object v3, p0, Luz/shift/colorpicker/LineColorPicker;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v2, v3}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 129
    add-int/lit8 v0, v0, 0x1

    goto :goto_23

    .line 140
    :cond_64
    iget-object v2, p0, Luz/shift/colorpicker/LineColorPicker;->rect:Landroid/graphics/Rect;

    iput v1, v2, Landroid/graphics/Rect;->top:I

    .line 141
    iget-object v2, p0, Luz/shift/colorpicker/LineColorPicker;->rect:Landroid/graphics/Rect;

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v3

    sub-int/2addr v3, v1

    iput v3, v2, Landroid/graphics/Rect;->bottom:I

    goto :goto_5a

    .line 146
    :cond_72
    return-void
.end method

.method private drawVerticalPicker(Landroid/graphics/Canvas;)V
    .registers 8
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v5, 0x0

    .line 92
    iget-object v2, p0, Luz/shift/colorpicker/LineColorPicker;->rect:Landroid/graphics/Rect;

    iput v5, v2, Landroid/graphics/Rect;->left:I

    .line 93
    iget-object v2, p0, Luz/shift/colorpicker/LineColorPicker;->rect:Landroid/graphics/Rect;

    iput v5, v2, Landroid/graphics/Rect;->top:I

    .line 94
    iget-object v2, p0, Luz/shift/colorpicker/LineColorPicker;->rect:Landroid/graphics/Rect;

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v3

    iput v3, v2, Landroid/graphics/Rect;->right:I

    .line 95
    iget-object v2, p0, Luz/shift/colorpicker/LineColorPicker;->rect:Landroid/graphics/Rect;

    iput v5, v2, Landroid/graphics/Rect;->bottom:I

    .line 98
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v2

    int-to-float v2, v2

    const v3, 0x3da3d70a    # 0.08f

    mul-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v1

    .line 100
    .local v1, "margin":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_23
    iget-object v2, p0, Luz/shift/colorpicker/LineColorPicker;->colors:[I

    array-length v2, v2

    if-ge v0, v2, :cond_72

    .line 102
    iget-object v2, p0, Luz/shift/colorpicker/LineColorPicker;->paint:Landroid/graphics/Paint;

    iget-object v3, p0, Luz/shift/colorpicker/LineColorPicker;->colors:[I

    aget v3, v3, v0

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 104
    iget-object v2, p0, Luz/shift/colorpicker/LineColorPicker;->rect:Landroid/graphics/Rect;

    iget-object v3, p0, Luz/shift/colorpicker/LineColorPicker;->rect:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->bottom:I

    iput v3, v2, Landroid/graphics/Rect;->top:I

    .line 105
    iget-object v2, p0, Luz/shift/colorpicker/LineColorPicker;->rect:Landroid/graphics/Rect;

    iget v3, v2, Landroid/graphics/Rect;->bottom:I

    iget v4, p0, Luz/shift/colorpicker/LineColorPicker;->cellSize:I

    add-int/2addr v3, v4

    iput v3, v2, Landroid/graphics/Rect;->bottom:I

    .line 107
    iget-boolean v2, p0, Luz/shift/colorpicker/LineColorPicker;->isColorSelected:Z

    if-eqz v2, :cond_64

    iget-object v2, p0, Luz/shift/colorpicker/LineColorPicker;->colors:[I

    aget v2, v2, v0

    iget v3, p0, Luz/shift/colorpicker/LineColorPicker;->selectedColor:I

    if-ne v2, v3, :cond_64

    .line 108
    iget-object v2, p0, Luz/shift/colorpicker/LineColorPicker;->rect:Landroid/graphics/Rect;

    iput v5, v2, Landroid/graphics/Rect;->left:I

    .line 109
    iget-object v2, p0, Luz/shift/colorpicker/LineColorPicker;->rect:Landroid/graphics/Rect;

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v3

    iput v3, v2, Landroid/graphics/Rect;->right:I

    .line 115
    :goto_5a
    iget-object v2, p0, Luz/shift/colorpicker/LineColorPicker;->rect:Landroid/graphics/Rect;

    iget-object v3, p0, Luz/shift/colorpicker/LineColorPicker;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v2, v3}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 100
    add-int/lit8 v0, v0, 0x1

    goto :goto_23

    .line 111
    :cond_64
    iget-object v2, p0, Luz/shift/colorpicker/LineColorPicker;->rect:Landroid/graphics/Rect;

    iput v1, v2, Landroid/graphics/Rect;->left:I

    .line 112
    iget-object v2, p0, Luz/shift/colorpicker/LineColorPicker;->rect:Landroid/graphics/Rect;

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v3

    sub-int/2addr v3, v1

    iput v3, v2, Landroid/graphics/Rect;->right:I

    goto :goto_5a

    .line 118
    :cond_72
    return-void
.end method

.method private getColorAtXY(FF)I
    .registers 9
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    .line 208
    iget v5, p0, Luz/shift/colorpicker/LineColorPicker;->mOrientation:I

    if-nez v5, :cond_22

    .line 209
    const/4 v2, 0x0

    .line 210
    .local v2, "left":I
    const/4 v3, 0x0

    .line 212
    .local v3, "right":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_7
    iget-object v5, p0, Luz/shift/colorpicker/LineColorPicker;->colors:[I

    array-length v5, v5

    if-ge v1, v5, :cond_40

    .line 213
    move v2, v3

    .line 214
    iget v5, p0, Luz/shift/colorpicker/LineColorPicker;->cellSize:I

    add-int/2addr v3, v5

    .line 216
    int-to-float v5, v2

    cmpg-float v5, v5, p1

    if-gtz v5, :cond_1f

    int-to-float v5, v3

    cmpl-float v5, v5, p1

    if-ltz v5, :cond_1f

    .line 217
    iget-object v5, p0, Luz/shift/colorpicker/LineColorPicker;->colors:[I

    aget v5, v5, v1

    .line 235
    .end local v2    # "left":I
    .end local v3    # "right":I
    :goto_1e
    return v5

    .line 212
    .restart local v2    # "left":I
    .restart local v3    # "right":I
    :cond_1f
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    .line 222
    .end local v1    # "i":I
    .end local v2    # "left":I
    .end local v3    # "right":I
    :cond_22
    const/4 v4, 0x0

    .line 223
    .local v4, "top":I
    const/4 v0, 0x0

    .line 225
    .local v0, "bottom":I
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_25
    iget-object v5, p0, Luz/shift/colorpicker/LineColorPicker;->colors:[I

    array-length v5, v5

    if-ge v1, v5, :cond_40

    .line 226
    move v4, v0

    .line 227
    iget v5, p0, Luz/shift/colorpicker/LineColorPicker;->cellSize:I

    add-int/2addr v0, v5

    .line 229
    int-to-float v5, v4

    cmpl-float v5, p2, v5

    if-ltz v5, :cond_3d

    int-to-float v5, v0

    cmpg-float v5, p2, v5

    if-gtz v5, :cond_3d

    .line 230
    iget-object v5, p0, Luz/shift/colorpicker/LineColorPicker;->colors:[I

    aget v5, v5, v1

    goto :goto_1e

    .line 225
    :cond_3d
    add-int/lit8 v1, v1, 0x1

    goto :goto_25

    .line 235
    .end local v0    # "bottom":I
    .end local v4    # "top":I
    :cond_40
    iget v5, p0, Luz/shift/colorpicker/LineColorPicker;->selectedColor:I

    goto :goto_1e
.end method

.method private onColorChanged(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 149
    iget-object v0, p0, Luz/shift/colorpicker/LineColorPicker;->onColorChanged:Luz/shift/colorpicker/OnColorChangedListener;

    if-eqz v0, :cond_9

    .line 150
    iget-object v0, p0, Luz/shift/colorpicker/LineColorPicker;->onColorChanged:Luz/shift/colorpicker/OnColorChangedListener;

    invoke-interface {v0, p1}, Luz/shift/colorpicker/OnColorChangedListener;->onColorChanged(I)V

    .line 152
    :cond_9
    return-void
.end method

.method private recalcCellSize()I
    .registers 4

    .prologue
    const/high16 v2, 0x3f800000    # 1.0f

    .line 380
    iget v0, p0, Luz/shift/colorpicker/LineColorPicker;->mOrientation:I

    if-nez v0, :cond_18

    .line 381
    iget v0, p0, Luz/shift/colorpicker/LineColorPicker;->screenW:I

    int-to-float v0, v0

    iget-object v1, p0, Luz/shift/colorpicker/LineColorPicker;->colors:[I

    array-length v1, v1

    int-to-float v1, v1

    mul-float/2addr v1, v2

    div-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    iput v0, p0, Luz/shift/colorpicker/LineColorPicker;->cellSize:I

    .line 386
    :goto_15
    iget v0, p0, Luz/shift/colorpicker/LineColorPicker;->cellSize:I

    return v0

    .line 383
    :cond_18
    iget v0, p0, Luz/shift/colorpicker/LineColorPicker;->screenH:I

    int-to-float v0, v0

    iget-object v1, p0, Luz/shift/colorpicker/LineColorPicker;->colors:[I

    array-length v1, v1

    int-to-float v1, v1

    mul-float/2addr v1, v2

    div-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    iput v0, p0, Luz/shift/colorpicker/LineColorPicker;->cellSize:I

    goto :goto_15
.end method


# virtual methods
.method public getColor()I
    .registers 2

    .prologue
    .line 329
    iget v0, p0, Luz/shift/colorpicker/LineColorPicker;->selectedColor:I

    return v0
.end method

.method public getColors()[I
    .registers 2

    .prologue
    .line 393
    iget-object v0, p0, Luz/shift/colorpicker/LineColorPicker;->colors:[I

    return-object v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 3
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 81
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 83
    iget v0, p0, Luz/shift/colorpicker/LineColorPicker;->mOrientation:I

    if-nez v0, :cond_b

    .line 84
    invoke-direct {p0, p1}, Luz/shift/colorpicker/LineColorPicker;->drawHorizontalPicker(Landroid/graphics/Canvas;)V

    .line 89
    :goto_a
    return-void

    .line 86
    :cond_b
    invoke-direct {p0, p1}, Luz/shift/colorpicker/LineColorPicker;->drawVerticalPicker(Landroid/graphics/Canvas;)V

    goto :goto_a
.end method

.method protected onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 4
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    .line 255
    instance-of v1, p1, Luz/shift/colorpicker/LineColorPicker$SavedState;

    if-nez v1, :cond_8

    .line 256
    invoke-super {p0, p1}, Landroid/view/View;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 266
    :goto_7
    return-void

    :cond_8
    move-object v0, p1

    .line 260
    check-cast v0, Luz/shift/colorpicker/LineColorPicker$SavedState;

    .line 261
    .local v0, "ss":Luz/shift/colorpicker/LineColorPicker$SavedState;
    invoke-virtual {v0}, Luz/shift/colorpicker/LineColorPicker$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Landroid/view/View;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 264
    iget v1, v0, Luz/shift/colorpicker/LineColorPicker$SavedState;->selectedColor:I

    iput v1, p0, Luz/shift/colorpicker/LineColorPicker;->selectedColor:I

    .line 265
    iget-boolean v1, v0, Luz/shift/colorpicker/LineColorPicker$SavedState;->isColorSelected:Z

    iput-boolean v1, p0, Luz/shift/colorpicker/LineColorPicker;->isColorSelected:Z

    goto :goto_7
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .registers 4

    .prologue
    .line 241
    invoke-super {p0}, Landroid/view/View;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v1

    .line 243
    .local v1, "superState":Landroid/os/Parcelable;
    new-instance v0, Luz/shift/colorpicker/LineColorPicker$SavedState;

    invoke-direct {v0, v1}, Luz/shift/colorpicker/LineColorPicker$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 246
    .local v0, "ss":Luz/shift/colorpicker/LineColorPicker$SavedState;
    iget v2, p0, Luz/shift/colorpicker/LineColorPicker;->selectedColor:I

    iput v2, v0, Luz/shift/colorpicker/LineColorPicker$SavedState;->selectedColor:I

    .line 247
    iget-boolean v2, p0, Luz/shift/colorpicker/LineColorPicker;->isColorSelected:Z

    iput-boolean v2, v0, Luz/shift/colorpicker/LineColorPicker$SavedState;->isColorSelected:Z

    .line 249
    return-object v0
.end method

.method protected onSizeChanged(IIII)V
    .registers 5
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .prologue
    .line 309
    iput p1, p0, Luz/shift/colorpicker/LineColorPicker;->screenW:I

    .line 310
    iput p2, p0, Luz/shift/colorpicker/LineColorPicker;->screenH:I

    .line 312
    invoke-direct {p0}, Luz/shift/colorpicker/LineColorPicker;->recalcCellSize()I

    .line 314
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    .line 315
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 7
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v4, 0x1

    const/4 v2, 0x0

    .line 161
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 165
    .local v0, "actionId":I
    packed-switch v0, :pswitch_data_3a

    .line 198
    :cond_9
    :goto_9
    return v4

    .line 167
    :pswitch_a
    iput-boolean v4, p0, Luz/shift/colorpicker/LineColorPicker;->isClick:Z

    goto :goto_9

    .line 170
    :pswitch_d
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    invoke-direct {p0, v2, v3}, Luz/shift/colorpicker/LineColorPicker;->getColorAtXY(FF)I

    move-result v1

    .line 172
    .local v1, "newColor":I
    invoke-virtual {p0, v1}, Luz/shift/colorpicker/LineColorPicker;->setSelectedColor(I)V

    .line 174
    iget-boolean v2, p0, Luz/shift/colorpicker/LineColorPicker;->isClick:Z

    if-eqz v2, :cond_9

    .line 175
    invoke-virtual {p0}, Luz/shift/colorpicker/LineColorPicker;->performClick()Z

    goto :goto_9

    .line 181
    .end local v1    # "newColor":I
    :pswitch_24
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    invoke-direct {p0, v2, v3}, Luz/shift/colorpicker/LineColorPicker;->getColorAtXY(FF)I

    move-result v1

    .line 183
    .restart local v1    # "newColor":I
    invoke-virtual {p0, v1}, Luz/shift/colorpicker/LineColorPicker;->setSelectedColor(I)V

    goto :goto_9

    .line 187
    .end local v1    # "newColor":I
    :pswitch_34
    iput-boolean v2, p0, Luz/shift/colorpicker/LineColorPicker;->isClick:Z

    goto :goto_9

    .line 191
    :pswitch_37
    iput-boolean v2, p0, Luz/shift/colorpicker/LineColorPicker;->isClick:Z

    goto :goto_9

    .line 165
    :pswitch_data_3a
    .packed-switch 0x0
        :pswitch_a
        :pswitch_d
        :pswitch_24
        :pswitch_34
        :pswitch_37
    .end packed-switch
.end method

.method public performClick()Z
    .registers 2

    .prologue
    .line 303
    invoke-super {p0}, Landroid/view/View;->performClick()Z

    move-result v0

    return v0
.end method

.method public setColors([I)V
    .registers 3
    .param p1, "colors"    # [I

    .prologue
    .line 367
    iput-object p1, p0, Luz/shift/colorpicker/LineColorPicker;->colors:[I

    .line 369
    iget v0, p0, Luz/shift/colorpicker/LineColorPicker;->selectedColor:I

    invoke-direct {p0, p1, v0}, Luz/shift/colorpicker/LineColorPicker;->containsColor([II)Z

    move-result v0

    if-nez v0, :cond_f

    .line 370
    const/4 v0, 0x0

    aget v0, p1, v0

    iput v0, p0, Luz/shift/colorpicker/LineColorPicker;->selectedColor:I

    .line 373
    :cond_f
    invoke-direct {p0}, Luz/shift/colorpicker/LineColorPicker;->recalcCellSize()I

    .line 375
    invoke-virtual {p0}, Luz/shift/colorpicker/LineColorPicker;->invalidate()V

    .line 376
    return-void
.end method

.method public setOnColorChangedListener(Luz/shift/colorpicker/OnColorChangedListener;)V
    .registers 2
    .param p1, "l"    # Luz/shift/colorpicker/OnColorChangedListener;

    .prologue
    .line 415
    iput-object p1, p0, Luz/shift/colorpicker/LineColorPicker;->onColorChanged:Luz/shift/colorpicker/OnColorChangedListener;

    .line 416
    return-void
.end method

.method public setSelectedColor(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 338
    iget-object v0, p0, Luz/shift/colorpicker/LineColorPicker;->colors:[I

    invoke-direct {p0, v0, p1}, Luz/shift/colorpicker/LineColorPicker;->containsColor([II)Z

    move-result v0

    if-nez v0, :cond_9

    .line 352
    :cond_8
    :goto_8
    return-void

    .line 343
    :cond_9
    iget-boolean v0, p0, Luz/shift/colorpicker/LineColorPicker;->isColorSelected:Z

    if-eqz v0, :cond_11

    iget v0, p0, Luz/shift/colorpicker/LineColorPicker;->selectedColor:I

    if-eq v0, p1, :cond_8

    .line 344
    :cond_11
    iput p1, p0, Luz/shift/colorpicker/LineColorPicker;->selectedColor:I

    .line 346
    const/4 v0, 0x1

    iput-boolean v0, p0, Luz/shift/colorpicker/LineColorPicker;->isColorSelected:Z

    .line 348
    invoke-virtual {p0}, Luz/shift/colorpicker/LineColorPicker;->invalidate()V

    .line 350
    invoke-direct {p0, p1}, Luz/shift/colorpicker/LineColorPicker;->onColorChanged(I)V

    goto :goto_8
.end method

.method public setSelectedColorPosition(I)V
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 358
    iget-object v0, p0, Luz/shift/colorpicker/LineColorPicker;->colors:[I

    aget v0, v0, p1

    invoke-virtual {p0, v0}, Luz/shift/colorpicker/LineColorPicker;->setSelectedColor(I)V

    .line 359
    return-void
.end method
