.class public Lcom/mikepenz/materialdrawer/util/UIUtils;
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
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static convertDpToPixel(FLandroid/content/Context;)F
    .registers 7
    .param p0, "dp"    # F
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 272
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 273
    .local v2, "resources":Landroid/content/res/Resources;
    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    .line 274
    .local v0, "metrics":Landroid/util/DisplayMetrics;
    iget v3, v0, Landroid/util/DisplayMetrics;->densityDpi:I

    int-to-float v3, v3

    const/high16 v4, 0x43200000    # 160.0f

    div-float/2addr v3, v4

    mul-float v1, p0, v3

    .line 275
    .local v1, "px":F
    return v1
.end method

.method public static convertPixelsToDp(FLandroid/content/Context;)F
    .registers 7
    .param p0, "px"    # F
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 286
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 287
    .local v2, "resources":Landroid/content/res/Resources;
    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    .line 288
    .local v1, "metrics":Landroid/util/DisplayMetrics;
    iget v3, v1, Landroid/util/DisplayMetrics;->densityDpi:I

    int-to-float v3, v3

    const/high16 v4, 0x43200000    # 160.0f

    div-float/2addr v3, v4

    div-float v0, p0, v3

    .line 289
    .local v0, "dp":F
    return v0
.end method

.method public static decideColor(Landroid/content/Context;IIII)I
    .registers 6
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "color"    # I
    .param p2, "colorRes"    # I
    .param p3, "defStyle"    # I
    .param p4, "defColor"    # I

    .prologue
    .line 316
    if-nez p1, :cond_e

    const/4 v0, -0x1

    if-eq p2, v0, :cond_e

    .line 317
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/content/res/Resources;->getColor(I)I

    move-result p1

    .line 321
    :cond_d
    :goto_d
    return p1

    .line 318
    :cond_e
    if-nez p1, :cond_d

    .line 319
    invoke-static {p0, p3, p4}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getThemeColorFromAttrOrRes(Landroid/content/Context;II)I

    move-result p1

    goto :goto_d
.end method

.method public static decideIcon(Landroid/content/Context;Landroid/graphics/drawable/Drawable;Lcom/mikepenz/iconics/typeface/IIcon;IIZ)Landroid/graphics/drawable/Drawable;
    .registers 8
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "icon"    # Landroid/graphics/drawable/Drawable;
    .param p2, "iicon"    # Lcom/mikepenz/iconics/typeface/IIcon;
    .param p3, "iconRes"    # I
    .param p4, "iconColor"    # I
    .param p5, "tint"    # Z

    .prologue
    .line 336
    if-nez p1, :cond_26

    if-eqz p2, :cond_26

    .line 337
    new-instance v0, Lcom/mikepenz/iconics/IconicsDrawable;

    invoke-direct {v0, p0, p2}, Lcom/mikepenz/iconics/IconicsDrawable;-><init>(Landroid/content/Context;Lcom/mikepenz/iconics/typeface/IIcon;)V

    invoke-virtual {v0, p4}, Lcom/mikepenz/iconics/IconicsDrawable;->color(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mikepenz/iconics/IconicsDrawable;->actionBarSize()Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/mikepenz/iconics/IconicsDrawable;->paddingDp(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object p1

    .line 343
    :cond_16
    :goto_16
    if-eqz p1, :cond_25

    if-eqz p5, :cond_25

    if-nez p2, :cond_25

    .line 344
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    .line 345
    sget-object v0, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {p1, p4, v0}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 349
    :cond_25
    return-object p1

    .line 338
    :cond_26
    if-nez p1, :cond_16

    const/4 v0, -0x1

    if-le p3, v0, :cond_16

    .line 339
    invoke-static {p0, p3}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getCompatDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    goto :goto_16
.end method

.method public static getActionBarHeight(Landroid/content/Context;)I
    .registers 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 223
    const v1, 0x10102eb

    invoke-static {p0, v1}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getThemeAttributeDimensionSize(Landroid/content/Context;I)I

    move-result v0

    .line 224
    .local v0, "actionBarHeight":I
    if-nez v0, :cond_13

    .line 225
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/mikepenz/materialdrawer/R$dimen;->abc_action_bar_default_height_material:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 227
    :cond_13
    return v0
.end method

.method public static getCompatDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;
    .registers 5
    .param p0, "c"    # Landroid/content/Context;
    .param p1, "drawableRes"    # I

    .prologue
    .line 146
    const/4 v0, 0x0

    .line 148
    .local v0, "d":Landroid/graphics/drawable/Drawable;
    :try_start_1
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-ge v1, v2, :cond_10

    .line 149
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 155
    :goto_f
    return-object v0

    .line 151
    :cond_10
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v2

    invoke-virtual {v1, p1, v2}, Landroid/content/res/Resources;->getDrawable(ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1b} :catch_1d

    move-result-object v0

    goto :goto_f

    .line 153
    :catch_1d
    move-exception v1

    goto :goto_f
.end method

.method public static getDrawerItemBackground(I)Landroid/graphics/drawable/StateListDrawable;
    .registers 6
    .param p0, "selected_color"    # I

    .prologue
    .line 49
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v0, p0}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 50
    .local v0, "clrActive":Landroid/graphics/drawable/ColorDrawable;
    new-instance v1, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v1}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    .line 51
    .local v1, "states":Landroid/graphics/drawable/StateListDrawable;
    const/4 v2, 0x1

    new-array v2, v2, [I

    const/4 v3, 0x0

    const v4, 0x10102fe

    aput v4, v2, v3

    invoke-virtual {v1, v2, v0}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 52
    return-object v1
.end method

.method public static getIconStateList(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/StateListDrawable;
    .registers 6
    .param p0, "icon"    # Landroid/graphics/drawable/Drawable;
    .param p1, "selectedIcon"    # Landroid/graphics/drawable/Drawable;

    .prologue
    const/4 v3, 0x0

    .line 42
    new-instance v0, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    .line 43
    .local v0, "iconStateListDrawable":Landroid/graphics/drawable/StateListDrawable;
    const/4 v1, 0x1

    new-array v1, v1, [I

    const v2, 0x10102fe

    aput v2, v1, v3

    invoke-virtual {v0, v1, p1}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 44
    new-array v1, v3, [I

    invoke-virtual {v0, v1, p0}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 45
    return-object v0
.end method

.method public static getNavigationBarHeight(Landroid/content/Context;)I
    .registers 6
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 208
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 209
    .local v1, "resources":Landroid/content/res/Resources;
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v2

    iget v2, v2, Landroid/content/res/Configuration;->orientation:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_22

    const-string v2, "navigation_bar_height"

    :goto_13
    const-string v3, "dimen"

    const-string v4, "android"

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 210
    .local v0, "id":I
    if-lez v0, :cond_25

    .line 211
    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    .line 213
    :goto_21
    return v2

    .line 209
    .end local v0    # "id":I
    :cond_22
    const-string v2, "navigation_bar_height_landscape"

    goto :goto_13

    .line 213
    .restart local v0    # "id":I
    :cond_25
    const/4 v2, 0x0

    goto :goto_21
.end method

.method public static getOptimalDrawerWidth(Landroid/content/Context;)I
    .registers 5
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 195
    invoke-static {p0}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getScreenWidth(Landroid/content/Context;)I

    move-result v2

    invoke-static {p0}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getActionBarHeight(Landroid/content/Context;)I

    move-result v3

    sub-int v1, v2, v3

    .line 196
    .local v1, "possibleMinDrawerWidth":I
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lcom/mikepenz/materialdrawer/R$dimen;->material_drawer_width:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 197
    .local v0, "maxDrawerWidth":I
    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    move-result v2

    return v2
.end method

.method public static getPlaceHolder(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;
    .registers 5
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    const/4 v3, 0x2

    .line 300
    sget v1, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_primary_text:I

    sget v2, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_primary_text:I

    invoke-static {p0, v1, v2}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getThemeColorFromAttrOrRes(Landroid/content/Context;II)I

    move-result v0

    .line 301
    .local v0, "textColor":I
    new-instance v1, Lcom/mikepenz/iconics/IconicsDrawable;

    sget-object v2, Lcom/mikepenz/google_material_typeface_library/GoogleMaterial$Icon;->gmd_person:Lcom/mikepenz/google_material_typeface_library/GoogleMaterial$Icon;

    invoke-direct {v1, p0, v2}, Lcom/mikepenz/iconics/IconicsDrawable;-><init>(Landroid/content/Context;Lcom/mikepenz/iconics/typeface/IIcon;)V

    invoke-virtual {v1, v0}, Lcom/mikepenz/iconics/IconicsDrawable;->color(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v1

    sget v2, Lcom/mikepenz/materialdrawer/R$color;->primary:I

    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->backgroundColorRes(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v1

    invoke-virtual {v1, v3}, Lcom/mikepenz/iconics/IconicsDrawable;->iconOffsetYDp(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v1

    invoke-virtual {v1, v3}, Lcom/mikepenz/iconics/IconicsDrawable;->paddingDp(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v1

    const/16 v2, 0x38

    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->sizeDp(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v1

    return-object v1
.end method

.method public static getScreenWidth(Landroid/content/Context;)I
    .registers 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 165
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    .line 166
    .local v0, "metrics":Landroid/util/DisplayMetrics;
    iget v1, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    return v1
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

    .line 80
    .local v0, "outValue":Landroid/util/TypedValue;
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    sget v2, Lcom/mikepenz/materialdrawer/R$attr;->selectableItemBackground:I

    invoke-virtual {v1, v2, v0, v3}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 81
    iget v1, v0, Landroid/util/TypedValue;->resourceId:I

    .line 85
    :goto_17
    return v1

    .line 83
    .end local v0    # "outValue":Landroid/util/TypedValue;
    :cond_18
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 84
    .restart local v0    # "outValue":Landroid/util/TypedValue;
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const v2, 0x1010130

    invoke-virtual {v1, v2, v0, v3}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 85
    iget v1, v0, Landroid/util/TypedValue;->resourceId:I

    goto :goto_17
.end method

.method public static getSelectableBackground(Landroid/content/Context;I)Landroid/graphics/drawable/StateListDrawable;
    .registers 5
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "selected_color"    # I

    .prologue
    .line 64
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getDrawerItemBackground(I)Landroid/graphics/drawable/StateListDrawable;

    move-result-object v0

    .line 65
    .local v0, "states":Landroid/graphics/drawable/StateListDrawable;
    const/4 v1, 0x0

    new-array v1, v1, [I

    invoke-static {p0}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getSelectableBackground(Landroid/content/Context;)I

    move-result v2

    invoke-static {p0, v2}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getCompatDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 66
    return-object v0
.end method

.method public static getStatusBarHeight(Landroid/content/Context;)I
    .registers 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 237
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getStatusBarHeight(Landroid/content/Context;Z)I

    move-result v0

    return v0
.end method

.method public static getStatusBarHeight(Landroid/content/Context;Z)I
    .registers 9
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "force"    # Z

    .prologue
    .line 248
    const/4 v2, 0x0

    .line 249
    .local v2, "result":I
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const-string v4, "status_bar_height"

    const-string v5, "dimen"

    const-string v6, "android"

    invoke-virtual {v3, v4, v5, v6}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 250
    .local v1, "resourceId":I
    if-lez v1, :cond_19

    .line 251
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    .line 254
    :cond_19
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    sget v4, Lcom/mikepenz/materialdrawer/R$dimen;->tool_bar_top_padding:I

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 256
    .local v0, "dimenResult":I
    if-nez v0, :cond_29

    if-nez p1, :cond_29

    .line 257
    const/4 v0, 0x0

    .line 260
    .end local v0    # "dimenResult":I
    :cond_28
    :goto_28
    return v0

    .restart local v0    # "dimenResult":I
    :cond_29
    if-eqz v2, :cond_28

    move v0, v2

    goto :goto_28
.end method

.method public static getTextColorStateList(II)Landroid/content/res/ColorStateList;
    .registers 9
    .param p0, "text_color"    # I
    .param p1, "selected_text_color"    # I

    .prologue
    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 29
    new-instance v0, Landroid/content/res/ColorStateList;

    new-array v1, v6, [[I

    new-array v2, v5, [I

    const v3, 0x10102fe

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

.method public static getThemeAttributeDimensionSize(Landroid/content/Context;I)I
    .registers 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "attr"    # I

    .prologue
    .line 177
    const/4 v0, 0x0

    .line 179
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

    .line 180
    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I
    :try_end_14
    .catchall {:try_start_1 .. :try_end_14} :catchall_1b

    move-result v1

    .line 182
    if-eqz v0, :cond_1a

    .line 183
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    :cond_1a
    return v1

    .line 182
    :catchall_1b
    move-exception v1

    if-eqz v0, :cond_21

    .line 183
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    :cond_21
    throw v1
.end method

.method public static getThemeColor(Landroid/content/Context;I)I
    .registers 5
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "attr"    # I

    .prologue
    .line 90
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 91
    .local v0, "tv":Landroid/util/TypedValue;
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, p1, v0, v2}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result v1

    if-eqz v1, :cond_13

    .line 92
    iget v1, v0, Landroid/util/TypedValue;->data:I

    .line 94
    :goto_12
    return v1

    :cond_13
    const/4 v1, 0x0

    goto :goto_12
.end method

.method public static getThemeColorFromAttrOrRes(Landroid/content/Context;II)I
    .registers 5
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "attr"    # I
    .param p2, "res"    # I

    .prologue
    .line 106
    invoke-static {p0, p1}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getThemeColor(Landroid/content/Context;I)I

    move-result v0

    .line 107
    .local v0, "color":I
    if-nez v0, :cond_e

    .line 108
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    .line 110
    :cond_e
    return v0
.end method

.method public static setBackground(Landroid/view/View;I)V
    .registers 3
    .param p0, "v"    # Landroid/view/View;
    .param p1, "drawableRes"    # I

    .prologue
    .line 135
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getCompatDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/mikepenz/materialdrawer/util/UIUtils;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 136
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
    .line 121
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-ge v0, v1, :cond_a

    .line 122
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 126
    :goto_9
    return-void

    .line 124
    :cond_a
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_9
.end method
