.class public Lcom/mikepenz/materialdrawer/util/DrawerUIUtils;
.super Ljava/lang/Object;
.source "DrawerUIUtils.java"


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
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getDrawerItemBackground(I)Landroid/graphics/drawable/StateListDrawable;
    .registers 6
    .param p0, "selected_color"    # I

    .prologue
    .line 67
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v0, p0}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 68
    .local v0, "clrActive":Landroid/graphics/drawable/ColorDrawable;
    new-instance v1, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v1}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    .line 69
    .local v1, "states":Landroid/graphics/drawable/StateListDrawable;
    const/4 v2, 0x1

    new-array v2, v2, [I

    const/4 v3, 0x0

    const v4, 0x10100a1

    aput v4, v2, v3

    invoke-virtual {v1, v2, v0}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 70
    return-object v1
.end method

.method public static getIconStateList(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/StateListDrawable;
    .registers 6
    .param p0, "icon"    # Landroid/graphics/drawable/Drawable;
    .param p1, "selectedIcon"    # Landroid/graphics/drawable/Drawable;

    .prologue
    const/4 v3, 0x0

    .line 54
    new-instance v0, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    .line 55
    .local v0, "iconStateListDrawable":Landroid/graphics/drawable/StateListDrawable;
    const/4 v1, 0x1

    new-array v1, v1, [I

    const v2, 0x10100a1

    aput v2, v1, v3

    invoke-virtual {v0, v1, p1}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 56
    new-array v1, v3, [I

    invoke-virtual {v0, v1, p0}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 57
    return-object v0
.end method

.method public static getOptimalDrawerWidth(Landroid/content/Context;)I
    .registers 5
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 126
    invoke-static {p0}, Lcom/mikepenz/materialdrawer/util/DrawerUIUtils;->getScreenWidth(Landroid/content/Context;)I

    move-result v2

    invoke-static {p0}, Lcom/mikepenz/materialize/util/UIUtils;->getActionBarHeight(Landroid/content/Context;)I

    move-result v3

    sub-int v1, v2, v3

    .line 127
    .local v1, "possibleMinDrawerWidth":I
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lcom/mikepenz/materialdrawer/R$dimen;->material_drawer_width:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 128
    .local v0, "maxDrawerWidth":I
    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    move-result v2

    return v2
.end method

.method public static getPlaceHolder(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;
    .registers 3
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 139
    new-instance v0, Lcom/mikepenz/iconics/IconicsDrawable;

    sget-object v1, Lcom/mikepenz/materialdrawer/icons/MaterialDrawerFont$Icon;->mdf_person:Lcom/mikepenz/materialdrawer/icons/MaterialDrawerFont$Icon;

    invoke-direct {v0, p0, v1}, Lcom/mikepenz/iconics/IconicsDrawable;-><init>(Landroid/content/Context;Lcom/mikepenz/iconics/typeface/IIcon;)V

    sget v1, Lcom/mikepenz/materialdrawer/R$color;->accent:I

    invoke-virtual {v0, v1}, Lcom/mikepenz/iconics/IconicsDrawable;->colorRes(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v0

    sget v1, Lcom/mikepenz/materialdrawer/R$color;->primary:I

    invoke-virtual {v0, v1}, Lcom/mikepenz/iconics/IconicsDrawable;->backgroundColorRes(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v0

    const/16 v1, 0x38

    invoke-virtual {v0, v1}, Lcom/mikepenz/iconics/IconicsDrawable;->sizeDp(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v0

    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Lcom/mikepenz/iconics/IconicsDrawable;->paddingDp(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v0

    return-object v0
.end method

.method public static getScreenWidth(Landroid/content/Context;)I
    .registers 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 115
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    .line 116
    .local v0, "metrics":Landroid/util/DisplayMetrics;
    iget v1, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    return v1
.end method

.method public static getSelectableBackground(Landroid/content/Context;)I
    .registers 5
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    const/4 v3, 0x1

    .line 94
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xb

    if-lt v1, v2, :cond_18

    .line 97
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 98
    .local v0, "outValue":Landroid/util/TypedValue;
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    sget v2, Lcom/mikepenz/materialdrawer/R$attr;->selectableItemBackground:I

    invoke-virtual {v1, v2, v0, v3}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 99
    iget v1, v0, Landroid/util/TypedValue;->resourceId:I

    .line 103
    :goto_17
    return v1

    .line 101
    .end local v0    # "outValue":Landroid/util/TypedValue;
    :cond_18
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 102
    .restart local v0    # "outValue":Landroid/util/TypedValue;
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const v2, 0x1010130

    invoke-virtual {v1, v2, v0, v3}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 103
    iget v1, v0, Landroid/util/TypedValue;->resourceId:I

    goto :goto_17
.end method

.method public static getSelectableBackground(Landroid/content/Context;I)Landroid/graphics/drawable/StateListDrawable;
    .registers 5
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "selected_color"    # I

    .prologue
    .line 82
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/util/DrawerUIUtils;->getDrawerItemBackground(I)Landroid/graphics/drawable/StateListDrawable;

    move-result-object v0

    .line 83
    .local v0, "states":Landroid/graphics/drawable/StateListDrawable;
    const/4 v1, 0x0

    new-array v1, v1, [I

    invoke-static {p0}, Lcom/mikepenz/materialdrawer/util/DrawerUIUtils;->getSelectableBackground(Landroid/content/Context;)I

    move-result v2

    invoke-static {p0, v2}, Lcom/mikepenz/materialize/util/UIUtils;->getCompatDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 84
    return-object v0
.end method

.method public static getTextColorStateList(II)Landroid/content/res/ColorStateList;
    .registers 9
    .param p0, "text_color"    # I
    .param p1, "selected_text_color"    # I

    .prologue
    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 34
    new-instance v0, Landroid/content/res/ColorStateList;

    new-array v1, v6, [[I

    new-array v2, v5, [I

    const v3, 0x10100a1

    aput v3, v2, v4

    aput-object v2, v1, v4

    new-array v2, v4, [I

    aput-object v2, v1, v5

    new-array v2, v6, [I

    aput p1, v2, v4

    aput p0, v2, v5

    invoke-direct {v0, v1, v2}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    return-object v0
.end method

.method public static setDrawerVerticalPadding(Landroid/view/View;)V
    .registers 5
    .param p0, "v"    # Landroid/view/View;

    .prologue
    const/4 v3, 0x0

    .line 149
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/mikepenz/materialdrawer/R$dimen;->material_drawer_vertical_padding:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 150
    .local v0, "verticalPadding":I
    invoke-virtual {p0, v0, v3, v0, v3}, Landroid/view/View;->setPadding(IIII)V

    .line 151
    return-void
.end method
