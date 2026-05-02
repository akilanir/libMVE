.class public Lcom/joanzapata/iconify/IconDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "IconDrawable.java"


# static fields
.field public static final ANDROID_ACTIONBAR_ICON_SIZE_DP:I = 0x18


# instance fields
.field private alpha:I

.field private context:Landroid/content/Context;

.field private icon:Lcom/joanzapata/iconify/Icon;

.field private paint:Landroid/text/TextPaint;

.field private size:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/joanzapata/iconify/Icon;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "icon"    # Lcom/joanzapata/iconify/Icon;

    .prologue
    .line 56
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 33
    const/4 v0, -0x1

    iput v0, p0, Lcom/joanzapata/iconify/IconDrawable;->size:I

    .line 35
    const/16 v0, 0xff

    iput v0, p0, Lcom/joanzapata/iconify/IconDrawable;->alpha:I

    .line 57
    invoke-direct {p0, p1, p2}, Lcom/joanzapata/iconify/IconDrawable;->init(Landroid/content/Context;Lcom/joanzapata/iconify/Icon;)V

    .line 58
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "iconKey"    # Ljava/lang/String;

    .prologue
    .line 43
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 33
    const/4 v1, -0x1

    iput v1, p0, Lcom/joanzapata/iconify/IconDrawable;->size:I

    .line 35
    const/16 v1, 0xff

    iput v1, p0, Lcom/joanzapata/iconify/IconDrawable;->alpha:I

    .line 44
    invoke-static {p2}, Lcom/joanzapata/iconify/Iconify;->findIconForKey(Ljava/lang/String;)Lcom/joanzapata/iconify/Icon;

    move-result-object v0

    .line 45
    .local v0, "icon":Lcom/joanzapata/iconify/Icon;
    if-nez v0, :cond_2f

    .line 46
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "No icon with that key \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\"."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 48
    :cond_2f
    invoke-direct {p0, p1, v0}, Lcom/joanzapata/iconify/IconDrawable;->init(Landroid/content/Context;Lcom/joanzapata/iconify/Icon;)V

    .line 49
    return-void
.end method

.method private convertDpToPx(Landroid/content/Context;F)I
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "dp"    # F

    .prologue
    .line 224
    const/4 v0, 0x1

    .line 226
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    .line 224
    invoke-static {v0, p2, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v0

    float-to-int v0, v0

    return v0
.end method

.method private init(Landroid/content/Context;Lcom/joanzapata/iconify/Icon;)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "icon"    # Lcom/joanzapata/iconify/Icon;

    .prologue
    .line 61
    iput-object p1, p0, Lcom/joanzapata/iconify/IconDrawable;->context:Landroid/content/Context;

    .line 62
    iput-object p2, p0, Lcom/joanzapata/iconify/IconDrawable;->icon:Lcom/joanzapata/iconify/Icon;

    .line 63
    new-instance v1, Landroid/text/TextPaint;

    invoke-direct {v1}, Landroid/text/TextPaint;-><init>()V

    iput-object v1, p0, Lcom/joanzapata/iconify/IconDrawable;->paint:Landroid/text/TextPaint;

    .line 64
    invoke-static {p2}, Lcom/joanzapata/iconify/Iconify;->findTypefaceOf(Lcom/joanzapata/iconify/Icon;)Lcom/joanzapata/iconify/internal/IconFontDescriptorWrapper;

    move-result-object v0

    .line 65
    .local v0, "descriptor":Lcom/joanzapata/iconify/internal/IconFontDescriptorWrapper;
    if-nez v0, :cond_3a

    .line 66
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unable to find the module associated with icon "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 67
    invoke-interface {p2}, Lcom/joanzapata/iconify/Icon;->key()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", have you registered the module "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "you are trying to use with Iconify.with(...) in your Application?"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 70
    :cond_3a
    iget-object v1, p0, Lcom/joanzapata/iconify/IconDrawable;->paint:Landroid/text/TextPaint;

    invoke-virtual {v0, p1}, Lcom/joanzapata/iconify/internal/IconFontDescriptorWrapper;->getTypeface(Landroid/content/Context;)Landroid/graphics/Typeface;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 71
    iget-object v1, p0, Lcom/joanzapata/iconify/IconDrawable;->paint:Landroid/text/TextPaint;

    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/text/TextPaint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 72
    iget-object v1, p0, Lcom/joanzapata/iconify/IconDrawable;->paint:Landroid/text/TextPaint;

    sget-object v2, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v1, v2}, Landroid/text/TextPaint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 73
    iget-object v1, p0, Lcom/joanzapata/iconify/IconDrawable;->paint:Landroid/text/TextPaint;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/text/TextPaint;->setUnderlineText(Z)V

    .line 74
    iget-object v1, p0, Lcom/joanzapata/iconify/IconDrawable;->paint:Landroid/text/TextPaint;

    const/high16 v2, -0x1000000

    invoke-virtual {v1, v2}, Landroid/text/TextPaint;->setColor(I)V

    .line 75
    iget-object v1, p0, Lcom/joanzapata/iconify/IconDrawable;->paint:Landroid/text/TextPaint;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/text/TextPaint;->setAntiAlias(Z)V

    .line 76
    return-void
.end method

.method private isEnabled([I)Z
    .registers 7
    .param p1, "stateSet"    # [I

    .prologue
    const/4 v1, 0x0

    .line 216
    array-length v3, p1

    move v2, v1

    :goto_3
    if-ge v2, v3, :cond_d

    aget v0, p1, v2

    .line 217
    .local v0, "state":I
    const v4, 0x101009e

    if-ne v0, v4, :cond_e

    .line 218
    const/4 v1, 0x1

    .line 219
    .end local v0    # "state":I
    :cond_d
    return v1

    .line 216
    .restart local v0    # "state":I
    :cond_e
    add-int/lit8 v2, v2, 0x1

    goto :goto_3
.end method


# virtual methods
.method public actionBarSize()Lcom/joanzapata/iconify/IconDrawable;
    .registers 2

    .prologue
    .line 83
    const/16 v0, 0x18

    invoke-virtual {p0, v0}, Lcom/joanzapata/iconify/IconDrawable;->sizeDp(I)Lcom/joanzapata/iconify/IconDrawable;

    move-result-object v0

    return-object v0
.end method

.method public alpha(I)Lcom/joanzapata/iconify/IconDrawable;
    .registers 2
    .param p1, "alpha"    # I

    .prologue
    .line 144
    invoke-virtual {p0, p1}, Lcom/joanzapata/iconify/IconDrawable;->setAlpha(I)V

    .line 145
    invoke-virtual {p0}, Lcom/joanzapata/iconify/IconDrawable;->invalidateSelf()V

    .line 146
    return-object p0
.end method

.method public clearColorFilter()V
    .registers 3

    .prologue
    .line 198
    iget-object v0, p0, Lcom/joanzapata/iconify/IconDrawable;->paint:Landroid/text/TextPaint;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 199
    return-void
.end method

.method public color(I)Lcom/joanzapata/iconify/IconDrawable;
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 122
    iget-object v0, p0, Lcom/joanzapata/iconify/IconDrawable;->paint:Landroid/text/TextPaint;

    invoke-virtual {v0, p1}, Landroid/text/TextPaint;->setColor(I)V

    .line 123
    invoke-virtual {p0}, Lcom/joanzapata/iconify/IconDrawable;->invalidateSelf()V

    .line 124
    return-object p0
.end method

.method public colorRes(I)Lcom/joanzapata/iconify/IconDrawable;
    .registers 4
    .param p1, "colorRes"    # I

    .prologue
    .line 133
    iget-object v0, p0, Lcom/joanzapata/iconify/IconDrawable;->paint:Landroid/text/TextPaint;

    iget-object v1, p0, Lcom/joanzapata/iconify/IconDrawable;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->setColor(I)V

    .line 134
    invoke-virtual {p0}, Lcom/joanzapata/iconify/IconDrawable;->invalidateSelf()V

    .line 135
    return-object p0
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .registers 11
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 161
    invoke-virtual {p0}, Lcom/joanzapata/iconify/IconDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    .line 162
    .local v0, "bounds":Landroid/graphics/Rect;
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v1

    .line 163
    .local v1, "height":I
    iget-object v6, p0, Lcom/joanzapata/iconify/IconDrawable;->paint:Landroid/text/TextPaint;

    int-to-float v7, v1

    invoke-virtual {v6, v7}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 164
    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    .line 165
    .local v3, "textBounds":Landroid/graphics/Rect;
    iget-object v6, p0, Lcom/joanzapata/iconify/IconDrawable;->icon:Lcom/joanzapata/iconify/Icon;

    invoke-interface {v6}, Lcom/joanzapata/iconify/Icon;->character()C

    move-result v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v5

    .line 166
    .local v5, "textValue":Ljava/lang/String;
    iget-object v6, p0, Lcom/joanzapata/iconify/IconDrawable;->paint:Landroid/text/TextPaint;

    const/4 v7, 0x0

    const/4 v8, 0x1

    invoke-virtual {v6, v5, v7, v8, v3}, Landroid/text/TextPaint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 167
    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    move-result v4

    .line 168
    .local v4, "textHeight":I
    iget v6, v0, Landroid/graphics/Rect;->top:I

    int-to-float v6, v6

    sub-int v7, v1, v4

    int-to-float v7, v7

    const/high16 v8, 0x40000000    # 2.0f

    div-float/2addr v7, v8

    add-float/2addr v6, v7

    int-to-float v7, v4

    add-float/2addr v6, v7

    iget v7, v3, Landroid/graphics/Rect;->bottom:I

    int-to-float v7, v7

    sub-float v2, v6, v7

    .line 169
    .local v2, "textBottom":F
    invoke-virtual {v0}, Landroid/graphics/Rect;->exactCenterX()F

    move-result v6

    iget-object v7, p0, Lcom/joanzapata/iconify/IconDrawable;->paint:Landroid/text/TextPaint;

    invoke-virtual {p1, v5, v6, v2, v7}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 170
    return-void
.end method

.method public getIntrinsicHeight()I
    .registers 2

    .prologue
    .line 151
    iget v0, p0, Lcom/joanzapata/iconify/IconDrawable;->size:I

    return v0
.end method

.method public getIntrinsicWidth()I
    .registers 2

    .prologue
    .line 156
    iget v0, p0, Lcom/joanzapata/iconify/IconDrawable;->size:I

    return v0
.end method

.method public getOpacity()I
    .registers 2

    .prologue
    .line 203
    iget v0, p0, Lcom/joanzapata/iconify/IconDrawable;->alpha:I

    return v0
.end method

.method public isStateful()Z
    .registers 2

    .prologue
    .line 174
    const/4 v0, 0x1

    return v0
.end method

.method public setAlpha(I)V
    .registers 3
    .param p1, "alpha"    # I

    .prologue
    .line 187
    iput p1, p0, Lcom/joanzapata/iconify/IconDrawable;->alpha:I

    .line 188
    iget-object v0, p0, Lcom/joanzapata/iconify/IconDrawable;->paint:Landroid/text/TextPaint;

    invoke-virtual {v0, p1}, Landroid/text/TextPaint;->setAlpha(I)V

    .line 189
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3
    .param p1, "cf"    # Landroid/graphics/ColorFilter;

    .prologue
    .line 193
    iget-object v0, p0, Lcom/joanzapata/iconify/IconDrawable;->paint:Landroid/text/TextPaint;

    invoke-virtual {v0, p1}, Landroid/text/TextPaint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 194
    return-void
.end method

.method public setState([I)Z
    .registers 5
    .param p1, "stateSet"    # [I

    .prologue
    .line 179
    iget-object v2, p0, Lcom/joanzapata/iconify/IconDrawable;->paint:Landroid/text/TextPaint;

    invoke-virtual {v2}, Landroid/text/TextPaint;->getAlpha()I

    move-result v1

    .line 180
    .local v1, "oldValue":I
    invoke-direct {p0, p1}, Lcom/joanzapata/iconify/IconDrawable;->isEnabled([I)Z

    move-result v2

    if-eqz v2, :cond_17

    iget v0, p0, Lcom/joanzapata/iconify/IconDrawable;->alpha:I

    .line 181
    .local v0, "newValue":I
    :goto_e
    iget-object v2, p0, Lcom/joanzapata/iconify/IconDrawable;->paint:Landroid/text/TextPaint;

    invoke-virtual {v2, v0}, Landroid/text/TextPaint;->setAlpha(I)V

    .line 182
    if-eq v1, v0, :cond_1c

    const/4 v2, 0x1

    :goto_16
    return v2

    .line 180
    .end local v0    # "newValue":I
    :cond_17
    iget v2, p0, Lcom/joanzapata/iconify/IconDrawable;->alpha:I

    div-int/lit8 v0, v2, 0x2

    goto :goto_e

    .line 182
    .restart local v0    # "newValue":I
    :cond_1c
    const/4 v2, 0x0

    goto :goto_16
.end method

.method public setStyle(Landroid/graphics/Paint$Style;)V
    .registers 3
    .param p1, "style"    # Landroid/graphics/Paint$Style;

    .prologue
    .line 211
    iget-object v0, p0, Lcom/joanzapata/iconify/IconDrawable;->paint:Landroid/text/TextPaint;

    invoke-virtual {v0, p1}, Landroid/text/TextPaint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 212
    return-void
.end method

.method public sizeDp(I)Lcom/joanzapata/iconify/IconDrawable;
    .registers 4
    .param p1, "size"    # I

    .prologue
    .line 101
    iget-object v0, p0, Lcom/joanzapata/iconify/IconDrawable;->context:Landroid/content/Context;

    int-to-float v1, p1

    invoke-direct {p0, v0, v1}, Lcom/joanzapata/iconify/IconDrawable;->convertDpToPx(Landroid/content/Context;F)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/joanzapata/iconify/IconDrawable;->sizePx(I)Lcom/joanzapata/iconify/IconDrawable;

    move-result-object v0

    return-object v0
.end method

.method public sizePx(I)Lcom/joanzapata/iconify/IconDrawable;
    .registers 3
    .param p1, "size"    # I

    .prologue
    const/4 v0, 0x0

    .line 110
    iput p1, p0, Lcom/joanzapata/iconify/IconDrawable;->size:I

    .line 111
    invoke-virtual {p0, v0, v0, p1, p1}, Lcom/joanzapata/iconify/IconDrawable;->setBounds(IIII)V

    .line 112
    invoke-virtual {p0}, Lcom/joanzapata/iconify/IconDrawable;->invalidateSelf()V

    .line 113
    return-object p0
.end method

.method public sizeRes(I)Lcom/joanzapata/iconify/IconDrawable;
    .registers 3
    .param p1, "dimenRes"    # I

    .prologue
    .line 92
    iget-object v0, p0, Lcom/joanzapata/iconify/IconDrawable;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/joanzapata/iconify/IconDrawable;->sizePx(I)Lcom/joanzapata/iconify/IconDrawable;

    move-result-object v0

    return-object v0
.end method
