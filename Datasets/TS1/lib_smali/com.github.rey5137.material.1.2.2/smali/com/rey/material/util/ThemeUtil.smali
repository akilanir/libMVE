.class public Lcom/rey/material/util/ThemeUtil;
.super Ljava/lang/Object;
.source "ThemeUtil.java"


# static fields
.field private static value:Landroid/util/TypedValue;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static colorAccent(Landroid/content/Context;I)I
    .registers 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "defaultValue"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 72
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_e

    .line 73
    const v0, 0x1010435

    invoke-static {p0, v0, p1}, Lcom/rey/material/util/ThemeUtil;->getColor(Landroid/content/Context;II)I

    move-result v0

    .line 75
    :goto_d
    return v0

    :cond_e
    sget v0, Lcom/rey/material/R$attr;->colorAccent:I

    invoke-static {p0, v0, p1}, Lcom/rey/material/util/ThemeUtil;->getColor(Landroid/content/Context;II)I

    move-result v0

    goto :goto_d
.end method

.method public static colorButtonNormal(Landroid/content/Context;I)I
    .registers 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "defaultValue"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 104
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_e

    .line 105
    const v0, 0x101042b

    invoke-static {p0, v0, p1}, Lcom/rey/material/util/ThemeUtil;->getColor(Landroid/content/Context;II)I

    move-result v0

    .line 107
    :goto_d
    return v0

    :cond_e
    sget v0, Lcom/rey/material/R$attr;->colorButtonNormal:I

    invoke-static {p0, v0, p1}, Lcom/rey/material/util/ThemeUtil;->getColor(Landroid/content/Context;II)I

    move-result v0

    goto :goto_d
.end method

.method public static colorControlActivated(Landroid/content/Context;I)I
    .registers 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "defaultValue"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 88
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_e

    .line 89
    const v0, 0x101042a

    invoke-static {p0, v0, p1}, Lcom/rey/material/util/ThemeUtil;->getColor(Landroid/content/Context;II)I

    move-result v0

    .line 91
    :goto_d
    return v0

    :cond_e
    sget v0, Lcom/rey/material/R$attr;->colorControlActivated:I

    invoke-static {p0, v0, p1}, Lcom/rey/material/util/ThemeUtil;->getColor(Landroid/content/Context;II)I

    move-result v0

    goto :goto_d
.end method

.method public static colorControlHighlight(Landroid/content/Context;I)I
    .registers 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "defaultValue"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 96
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_e

    .line 97
    const v0, 0x101042c

    invoke-static {p0, v0, p1}, Lcom/rey/material/util/ThemeUtil;->getColor(Landroid/content/Context;II)I

    move-result v0

    .line 99
    :goto_d
    return v0

    :cond_e
    sget v0, Lcom/rey/material/R$attr;->colorControlHighlight:I

    invoke-static {p0, v0, p1}, Lcom/rey/material/util/ThemeUtil;->getColor(Landroid/content/Context;II)I

    move-result v0

    goto :goto_d
.end method

.method public static colorControlNormal(Landroid/content/Context;I)I
    .registers 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "defaultValue"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 80
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_e

    .line 81
    const v0, 0x1010429

    invoke-static {p0, v0, p1}, Lcom/rey/material/util/ThemeUtil;->getColor(Landroid/content/Context;II)I

    move-result v0

    .line 83
    :goto_d
    return v0

    :cond_e
    sget v0, Lcom/rey/material/R$attr;->colorControlNormal:I

    invoke-static {p0, v0, p1}, Lcom/rey/material/util/ThemeUtil;->getColor(Landroid/content/Context;II)I

    move-result v0

    goto :goto_d
.end method

.method public static colorPrimary(Landroid/content/Context;I)I
    .registers 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "defaultValue"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 56
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_e

    .line 57
    const v0, 0x1010433

    invoke-static {p0, v0, p1}, Lcom/rey/material/util/ThemeUtil;->getColor(Landroid/content/Context;II)I

    move-result v0

    .line 59
    :goto_d
    return v0

    :cond_e
    sget v0, Lcom/rey/material/R$attr;->colorPrimary:I

    invoke-static {p0, v0, p1}, Lcom/rey/material/util/ThemeUtil;->getColor(Landroid/content/Context;II)I

    move-result v0

    goto :goto_d
.end method

.method public static colorPrimaryDark(Landroid/content/Context;I)I
    .registers 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "defaultValue"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 64
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_e

    .line 65
    const v0, 0x1010434

    invoke-static {p0, v0, p1}, Lcom/rey/material/util/ThemeUtil;->getColor(Landroid/content/Context;II)I

    move-result v0

    .line 67
    :goto_d
    return v0

    :cond_e
    sget v0, Lcom/rey/material/R$attr;->colorPrimaryDark:I

    invoke-static {p0, v0, p1}, Lcom/rey/material/util/ThemeUtil;->getColor(Landroid/content/Context;II)I

    move-result v0

    goto :goto_d
.end method

.method public static colorSwitchThumbNormal(Landroid/content/Context;I)I
    .registers 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "defaultValue"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 112
    sget v0, Lcom/rey/material/R$attr;->colorSwitchThumbNormal:I

    invoke-static {p0, v0, p1}, Lcom/rey/material/util/ThemeUtil;->getColor(Landroid/content/Context;II)I

    move-result v0

    return v0
.end method

.method public static dpToPx(Landroid/content/Context;I)I
    .registers 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "dp"    # I

    .prologue
    .line 17
    const/4 v0, 0x1

    int-to-float v1, p1

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    invoke-static {v0, v1, v2}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v0

    const/high16 v1, 0x3f000000    # 0.5f

    add-float/2addr v0, v1

    float-to-int v0, v0

    return v0
.end method

.method private static getColor(Landroid/content/Context;II)I
    .registers 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "id"    # I
    .param p2, "defaultValue"    # I

    .prologue
    .line 25
    sget-object v1, Lcom/rey/material/util/ThemeUtil;->value:Landroid/util/TypedValue;

    if-nez v1, :cond_b

    .line 26
    new-instance v1, Landroid/util/TypedValue;

    invoke-direct {v1}, Landroid/util/TypedValue;-><init>()V

    sput-object v1, Lcom/rey/material/util/ThemeUtil;->value:Landroid/util/TypedValue;

    .line 29
    :cond_b
    :try_start_b
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v0

    .line 30
    .local v0, "theme":Landroid/content/res/Resources$Theme;
    if-eqz v0, :cond_2e

    sget-object v1, Lcom/rey/material/util/ThemeUtil;->value:Landroid/util/TypedValue;

    const/4 v2, 0x1

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result v1

    if-eqz v1, :cond_2e

    .line 31
    sget-object v1, Lcom/rey/material/util/ThemeUtil;->value:Landroid/util/TypedValue;

    iget v1, v1, Landroid/util/TypedValue;->type:I

    const/16 v2, 0x10

    if-lt v1, v2, :cond_2f

    sget-object v1, Lcom/rey/material/util/ThemeUtil;->value:Landroid/util/TypedValue;

    iget v1, v1, Landroid/util/TypedValue;->type:I

    const/16 v2, 0x1f

    if-gt v1, v2, :cond_2f

    .line 32
    sget-object v1, Lcom/rey/material/util/ThemeUtil;->value:Landroid/util/TypedValue;

    iget p2, v1, Landroid/util/TypedValue;->data:I

    .line 39
    .end local v0    # "theme":Landroid/content/res/Resources$Theme;
    .end local p2    # "defaultValue":I
    :cond_2e
    :goto_2e
    return p2

    .line 33
    .restart local v0    # "theme":Landroid/content/res/Resources$Theme;
    .restart local p2    # "defaultValue":I
    :cond_2f
    sget-object v1, Lcom/rey/material/util/ThemeUtil;->value:Landroid/util/TypedValue;

    iget v1, v1, Landroid/util/TypedValue;->type:I

    const/4 v2, 0x3

    if-ne v1, v2, :cond_2e

    .line 34
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget-object v2, Lcom/rey/material/util/ThemeUtil;->value:Landroid/util/TypedValue;

    iget v2, v2, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I
    :try_end_41
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_41} :catch_43

    move-result p2

    goto :goto_2e

    .line 37
    .end local v0    # "theme":Landroid/content/res/Resources$Theme;
    :catch_43
    move-exception v1

    goto :goto_2e
.end method

.method public static getString(Landroid/content/res/TypedArray;ILjava/lang/CharSequence;)Ljava/lang/CharSequence;
    .registers 4
    .param p0, "array"    # Landroid/content/res/TypedArray;
    .param p1, "index"    # I
    .param p2, "defaultValue"    # Ljava/lang/CharSequence;

    .prologue
    .line 125
    invoke-virtual {p0, p1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 126
    .local v0, "result":Ljava/lang/String;
    if-nez v0, :cond_7

    .end local p2    # "defaultValue":Ljava/lang/CharSequence;
    :goto_6
    return-object p2

    .restart local p2    # "defaultValue":Ljava/lang/CharSequence;
    :cond_7
    move-object p2, v0

    goto :goto_6
.end method

.method public static getType(Landroid/content/res/TypedArray;I)I
    .registers 5
    .param p0, "array"    # Landroid/content/res/TypedArray;
    .param p1, "index"    # I

    .prologue
    .line 116
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v1, v2, :cond_b

    .line 117
    invoke-virtual {p0, p1}, Landroid/content/res/TypedArray;->getType(I)I

    move-result v1

    .line 120
    :goto_a
    return v1

    .line 119
    :cond_b
    invoke-virtual {p0, p1}, Landroid/content/res/TypedArray;->peekValue(I)Landroid/util/TypedValue;

    move-result-object v0

    .line 120
    .local v0, "value":Landroid/util/TypedValue;
    if-nez v0, :cond_13

    const/4 v1, 0x0

    goto :goto_a

    :cond_13
    iget v1, v0, Landroid/util/TypedValue;->type:I

    goto :goto_a
.end method

.method public static spToPx(Landroid/content/Context;I)I
    .registers 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "sp"    # I

    .prologue
    .line 21
    const/4 v0, 0x2

    int-to-float v1, p1

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    invoke-static {v0, v1, v2}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v0

    const/high16 v1, 0x3f000000    # 0.5f

    add-float/2addr v0, v1

    float-to-int v0, v0

    return v0
.end method

.method public static textColorPrimary(Landroid/content/Context;I)I
    .registers 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "defaultValue"    # I

    .prologue
    .line 47
    const v0, 0x1010036

    invoke-static {p0, v0, p1}, Lcom/rey/material/util/ThemeUtil;->getColor(Landroid/content/Context;II)I

    move-result v0

    return v0
.end method

.method public static textColorSecondary(Landroid/content/Context;I)I
    .registers 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "defaultValue"    # I

    .prologue
    .line 51
    const v0, 0x1010038

    invoke-static {p0, v0, p1}, Lcom/rey/material/util/ThemeUtil;->getColor(Landroid/content/Context;II)I

    move-result v0

    return v0
.end method

.method public static windowBackground(Landroid/content/Context;I)I
    .registers 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "defaultValue"    # I

    .prologue
    .line 43
    const v0, 0x1010054

    invoke-static {p0, v0, p1}, Lcom/rey/material/util/ThemeUtil;->getColor(Landroid/content/Context;II)I

    move-result v0

    return v0
.end method
