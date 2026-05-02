.class public Lcom/mikepenz/fastadapter/utils/FastAdapterUIUtils;
.super Ljava/lang/Object;
.source "FastAdapterUIUtils.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static adjustAlpha(II)I
    .registers 4
    .param p0, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param
    .param p1, "alpha"    # I

    .prologue
    .line 66
    shl-int/lit8 v0, p1, 0x18

    const v1, 0xffffff

    and-int/2addr v1, p0

    or-int/2addr v0, v1

    return v0
.end method

.method public static getSelectableBackground(Landroid/content/Context;)I
    .registers 5
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    const/4 v3, 0x1

    .line 76
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xb

    if-lt v1, v2, :cond_18

    .line 79
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 81
    .local v0, "outValue":Landroid/util/TypedValue;
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    sget v2, Lcom/mikepenz/fastadapter/R$attr;->selectableItemBackground:I

    invoke-virtual {v1, v2, v0, v3}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 82
    iget v1, v0, Landroid/util/TypedValue;->resourceId:I

    .line 86
    :goto_17
    return v1

    .line 84
    .end local v0    # "outValue":Landroid/util/TypedValue;
    :cond_18
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 85
    .restart local v0    # "outValue":Landroid/util/TypedValue;
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const v2, 0x1010130

    invoke-virtual {v1, v2, v0, v3}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 86
    iget v1, v0, Landroid/util/TypedValue;->resourceId:I

    goto :goto_17
.end method

.method public static getSelectableBackground(Landroid/content/Context;IZ)Landroid/graphics/drawable/StateListDrawable;
    .registers 9
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "selected_color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param
    .param p2, "animate"    # Z

    .prologue
    const/4 v5, 0x0

    .line 27
    new-instance v2, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v2}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    .line 29
    .local v2, "states":Landroid/graphics/drawable/StateListDrawable;
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v0, p1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 30
    .local v0, "clrActive":Landroid/graphics/drawable/ColorDrawable;
    const/4 v3, 0x1

    new-array v3, v3, [I

    const v4, 0x10100a1

    aput v4, v3, v5

    invoke-virtual {v2, v3, v0}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 32
    new-array v3, v5, [I

    invoke-static {p0}, Lcom/mikepenz/fastadapter/utils/FastAdapterUIUtils;->getSelectableBackground(Landroid/content/Context;)I

    move-result v4

    invoke-static {p0, v4}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 34
    if-eqz p2, :cond_3b

    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0xb

    if-lt v3, v4, :cond_3b

    .line 35
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const/high16 v4, 0x10e0000

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    .line 36
    .local v1, "duration":I
    invoke-virtual {v2, v1}, Landroid/graphics/drawable/StateListDrawable;->setEnterFadeDuration(I)V

    .line 37
    invoke-virtual {v2, v1}, Landroid/graphics/drawable/StateListDrawable;->setExitFadeDuration(I)V

    .line 39
    .end local v1    # "duration":I
    :cond_3b
    return-object v2
.end method

.method public static getSelectablePressedBackground(Landroid/content/Context;IIZ)Landroid/graphics/drawable/StateListDrawable;
    .registers 9
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "selected_color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param
    .param p2, "pressed_alpha"    # I
    .param p3, "animate"    # Z

    .prologue
    .line 52
    invoke-static {p0, p1, p3}, Lcom/mikepenz/fastadapter/utils/FastAdapterUIUtils;->getSelectableBackground(Landroid/content/Context;IZ)Landroid/graphics/drawable/StateListDrawable;

    move-result-object v1

    .line 53
    .local v1, "states":Landroid/graphics/drawable/StateListDrawable;
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    invoke-static {p1, p2}, Lcom/mikepenz/fastadapter/utils/FastAdapterUIUtils;->adjustAlpha(II)I

    move-result v2

    invoke-direct {v0, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 54
    .local v0, "clrPressed":Landroid/graphics/drawable/ColorDrawable;
    const/4 v2, 0x1

    new-array v2, v2, [I

    const/4 v3, 0x0

    const v4, 0x10100a7

    aput v4, v2, v3

    invoke-virtual {v1, v2, v0}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 55
    return-object v1
.end method
