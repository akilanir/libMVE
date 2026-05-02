.class public Lcom/mikepenz/aboutlibraries/util/UIUtils;
.super Ljava/lang/Object;
.source "UIUtils.java"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "InlinedApi"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static convertDpToPixel(FLandroid/content/Context;)F
    .registers 7
    .param p0, "dp"    # F
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 129
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 130
    .local v2, "resources":Landroid/content/res/Resources;
    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    .line 131
    .local v0, "metrics":Landroid/util/DisplayMetrics;
    iget v3, v0, Landroid/util/DisplayMetrics;->densityDpi:I

    int-to-float v3, v3

    const/high16 v4, 0x43200000    # 160.0f

    div-float/2addr v3, v4

    mul-float v1, p0, v3

    .line 132
    .local v1, "px":F
    return v1
.end method

.method public static convertPixelsToDp(FLandroid/content/Context;)F
    .registers 7
    .param p0, "px"    # F
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 143
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 144
    .local v2, "resources":Landroid/content/res/Resources;
    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    .line 145
    .local v1, "metrics":Landroid/util/DisplayMetrics;
    iget v3, v1, Landroid/util/DisplayMetrics;->densityDpi:I

    int-to-float v3, v3

    const/high16 v4, 0x43200000    # 160.0f

    div-float/2addr v3, v4

    div-float v0, p0, v3

    .line 146
    .local v0, "dp":F
    return v0
.end method

.method public static getCompatDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;
    .registers 3
    .param p0, "c"    # Landroid/content/Context;
    .param p1, "drawableRes"    # I

    .prologue
    .line 99
    invoke-static {p0, p1}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public static getSelectableBackground(Landroid/content/Context;)I
    .registers 5
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    const/4 v3, 0x1

    .line 29
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xb

    if-lt v1, v2, :cond_18

    .line 32
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 33
    .local v0, "outValue":Landroid/util/TypedValue;
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    sget v2, Lcom/mikepenz/aboutlibraries/R$attr;->selectableItemBackground:I

    invoke-virtual {v1, v2, v0, v3}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 34
    iget v1, v0, Landroid/util/TypedValue;->resourceId:I

    .line 38
    :goto_17
    return v1

    .line 36
    .end local v0    # "outValue":Landroid/util/TypedValue;
    :cond_18
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 37
    .restart local v0    # "outValue":Landroid/util/TypedValue;
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const v2, 0x1010130

    invoke-virtual {v1, v2, v0, v3}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 38
    iget v1, v0, Landroid/util/TypedValue;->resourceId:I

    goto :goto_17
.end method

.method public static getThemeAttributeDimensionSize(Landroid/content/Context;I)I
    .registers 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "attr"    # I

    .prologue
    .line 110
    const/4 v0, 0x0

    .line 112
    .local v0, "a":Landroid/content/res/TypedArray;
    :try_start_1
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [I

    const/4 v3, 0x0

    aput p1, v2, v3

    invoke-virtual {v1, v2}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 113
    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I
    :try_end_14
    .catchall {:try_start_1 .. :try_end_14} :catchall_1b

    move-result v1

    .line 115
    if-eqz v0, :cond_1a

    .line 116
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    :cond_1a
    return v1

    .line 115
    :catchall_1b
    move-exception v1

    if-eqz v0, :cond_21

    .line 116
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    :cond_21
    throw v1
.end method

.method public static getThemeColor(Landroid/content/Context;I)I
    .registers 5
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "attr"    # I

    .prologue
    .line 43
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 44
    .local v0, "tv":Landroid/util/TypedValue;
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, p1, v0, v2}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result v1

    if-eqz v1, :cond_13

    .line 45
    iget v1, v0, Landroid/util/TypedValue;->data:I

    .line 47
    :goto_12
    return v1

    :cond_13
    const/4 v1, 0x0

    goto :goto_12
.end method

.method public static getThemeColorFromAttrOrRes(Landroid/content/Context;II)I
    .registers 4
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "attr"    # I
    .param p2, "res"    # I

    .prologue
    .line 59
    invoke-static {p0, p1}, Lcom/mikepenz/aboutlibraries/util/UIUtils;->getThemeColor(Landroid/content/Context;I)I

    move-result v0

    .line 60
    .local v0, "color":I
    if-nez v0, :cond_a

    .line 61
    invoke-static {p0, p2}, Landroid/support/v4/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v0

    .line 63
    :cond_a
    return v0
.end method

.method public static setBackground(Landroid/view/View;I)V
    .registers 3
    .param p0, "v"    # Landroid/view/View;
    .param p1, "drawableRes"    # I

    .prologue
    .line 88
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/mikepenz/aboutlibraries/util/UIUtils;->getCompatDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/mikepenz/aboutlibraries/util/UIUtils;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 89
    return-void
.end method

.method public static setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V
    .registers 4
    .param p0, "v"    # Landroid/view/View;
    .param p1, "d"    # Landroid/graphics/drawable/Drawable;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    .line 74
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-ge v0, v1, :cond_a

    .line 75
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 79
    :goto_9
    return-void

    .line 77
    :cond_a
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_9
.end method
