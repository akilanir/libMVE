.class public Lcom/mikepenz/materialize/util/UIUtils;
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
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static convertDpToPixel(FLandroid/content/Context;)F
    .registers 7
    .param p0, "dp"    # F
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 190
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 191
    .local v2, "resources":Landroid/content/res/Resources;
    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    .line 192
    .local v0, "metrics":Landroid/util/DisplayMetrics;
    iget v3, v0, Landroid/util/DisplayMetrics;->densityDpi:I

    int-to-float v3, v3

    const/high16 v4, 0x43200000    # 160.0f

    div-float/2addr v3, v4

    mul-float v1, p0, v3

    .line 193
    .local v1, "px":F
    return v1
.end method

.method public static convertPixelsToDp(FLandroid/content/Context;)F
    .registers 7
    .param p0, "px"    # F
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 204
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 205
    .local v2, "resources":Landroid/content/res/Resources;
    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    .line 206
    .local v1, "metrics":Landroid/util/DisplayMetrics;
    iget v3, v1, Landroid/util/DisplayMetrics;->densityDpi:I

    int-to-float v3, v3

    const/high16 v4, 0x43200000    # 160.0f

    div-float/2addr v3, v4

    div-float v0, p0, v3

    .line 207
    .local v0, "dp":F
    return v0
.end method

.method public static getActionBarHeight(Landroid/content/Context;)I
    .registers 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 141
    const v1, 0x10102eb

    invoke-static {p0, v1}, Lcom/mikepenz/materialize/util/UIUtils;->getThemeAttributeDimensionSize(Landroid/content/Context;I)I

    move-result v0

    .line 142
    .local v0, "actionBarHeight":I
    if-nez v0, :cond_13

    .line 143
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/mikepenz/materialize/R$dimen;->abc_action_bar_default_height_material:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 145
    :cond_13
    return v0
.end method

.method public static getCompatDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;
    .registers 5
    .param p0, "c"    # Landroid/content/Context;
    .param p1, "drawableRes"    # I

    .prologue
    .line 88
    const/4 v0, 0x0

    .line 90
    .local v0, "d":Landroid/graphics/drawable/Drawable;
    :try_start_1
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-ge v1, v2, :cond_10

    .line 91
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 97
    :goto_f
    return-object v0

    .line 93
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

    .line 95
    :catch_1d
    move-exception v1

    goto :goto_f
.end method

.method public static getNavigationBarHeight(Landroid/content/Context;)I
    .registers 6
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 126
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 127
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

    .line 128
    .local v0, "id":I
    if-lez v0, :cond_25

    .line 129
    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    .line 131
    :goto_21
    return v2

    .line 127
    .end local v0    # "id":I
    :cond_22
    const-string v2, "navigation_bar_height_landscape"

    goto :goto_13

    .line 131
    .restart local v0    # "id":I
    :cond_25
    const/4 v2, 0x0

    goto :goto_21
.end method

.method public static getStatusBarHeight(Landroid/content/Context;)I
    .registers 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 155
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/mikepenz/materialize/util/UIUtils;->getStatusBarHeight(Landroid/content/Context;Z)I

    move-result v0

    return v0
.end method

.method public static getStatusBarHeight(Landroid/content/Context;Z)I
    .registers 9
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "force"    # Z

    .prologue
    .line 166
    const/4 v2, 0x0

    .line 167
    .local v2, "result":I
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const-string v4, "status_bar_height"

    const-string v5, "dimen"

    const-string v6, "android"

    invoke-virtual {v3, v4, v5, v6}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 168
    .local v1, "resourceId":I
    if-lez v1, :cond_19

    .line 169
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    .line 172
    :cond_19
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    sget v4, Lcom/mikepenz/materialize/R$dimen;->tool_bar_top_padding:I

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 174
    .local v0, "dimenResult":I
    if-nez v0, :cond_29

    if-nez p1, :cond_29

    .line 175
    const/4 v0, 0x0

    .line 178
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

.method public static getThemeAttributeDimensionSize(Landroid/content/Context;I)I
    .registers 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "attr"    # I

    .prologue
    .line 108
    const/4 v0, 0x0

    .line 110
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

    .line 111
    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I
    :try_end_14
    .catchall {:try_start_1 .. :try_end_14} :catchall_1b

    move-result v1

    .line 113
    if-eqz v0, :cond_1a

    .line 114
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    :cond_1a
    return v1

    .line 113
    :catchall_1b
    move-exception v1

    if-eqz v0, :cond_21

    .line 114
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    :cond_21
    throw v1
.end method

.method public static getThemeColor(Landroid/content/Context;I)I
    .registers 5
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "attr"    # I

    .prologue
    .line 32
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 33
    .local v0, "tv":Landroid/util/TypedValue;
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, p1, v0, v2}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result v1

    if-eqz v1, :cond_13

    .line 34
    iget v1, v0, Landroid/util/TypedValue;->data:I

    .line 36
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
    .line 48
    invoke-static {p0, p1}, Lcom/mikepenz/materialize/util/UIUtils;->getThemeColor(Landroid/content/Context;I)I

    move-result v0

    .line 49
    .local v0, "color":I
    if-nez v0, :cond_e

    .line 50
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    .line 52
    :cond_e
    return v0
.end method

.method public static setBackground(Landroid/view/View;I)V
    .registers 3
    .param p0, "v"    # Landroid/view/View;
    .param p1, "drawableRes"    # I

    .prologue
    .line 77
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/mikepenz/materialize/util/UIUtils;->getCompatDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/mikepenz/materialize/util/UIUtils;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 78
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
    .line 63
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-ge v0, v1, :cond_a

    .line 64
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 68
    :goto_9
    return-void

    .line 66
    :cond_a
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_9
.end method

.method public static setFlag(Landroid/app/Activity;IZ)V
    .registers 7
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "bits"    # I
    .param p2, "on"    # Z

    .prologue
    .line 239
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    .line 240
    .local v0, "win":Landroid/view/Window;
    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    .line 241
    .local v1, "winParams":Landroid/view/WindowManager$LayoutParams;
    if-eqz p2, :cond_13

    .line 242
    iget v2, v1, Landroid/view/WindowManager$LayoutParams;->flags:I

    or-int/2addr v2, p1

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 246
    :goto_f
    invoke-virtual {v0, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 247
    return-void

    .line 244
    :cond_13
    iget v2, v1, Landroid/view/WindowManager$LayoutParams;->flags:I

    xor-int/lit8 v3, p1, -0x1

    and-int/2addr v2, v3

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->flags:I

    goto :goto_f
.end method

.method public static setTranslucentNavigationFlag(Landroid/app/Activity;Z)V
    .registers 4
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "on"    # Z

    .prologue
    .line 227
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_b

    .line 228
    const/high16 v0, 0x8000000

    invoke-static {p0, v0, p1}, Lcom/mikepenz/materialize/util/UIUtils;->setFlag(Landroid/app/Activity;IZ)V

    .line 230
    :cond_b
    return-void
.end method

.method public static setTranslucentStatusFlag(Landroid/app/Activity;Z)V
    .registers 4
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "on"    # Z

    .prologue
    .line 216
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_b

    .line 217
    const/high16 v0, 0x4000000

    invoke-static {p0, v0, p1}, Lcom/mikepenz/materialize/util/UIUtils;->setFlag(Landroid/app/Activity;IZ)V

    .line 219
    :cond_b
    return-void
.end method
