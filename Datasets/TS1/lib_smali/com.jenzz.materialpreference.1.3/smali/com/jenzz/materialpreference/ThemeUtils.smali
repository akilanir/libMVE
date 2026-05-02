.class final Lcom/jenzz/materialpreference/ThemeUtils;
.super Ljava/lang/Object;
.source "ThemeUtils.java"


# static fields
.field static final FALLBACK_COLOR:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 15
    const-string v0, "#009688"

    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/jenzz/materialpreference/ThemeUtils;->FALLBACK_COLOR:I

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    return-void
.end method

.method static isAtLeastL()Z
    .registers 2

    .prologue
    .line 22
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method static resolveAccentColor(Landroid/content/Context;)I
    .registers 9
    .param p0, "context"    # Landroid/content/Context;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 27
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v2

    .line 32
    .local v2, "theme":Landroid/content/res/Resources$Theme;
    invoke-static {}, Lcom/jenzz/materialpreference/ThemeUtils;->isAtLeastL()Z

    move-result v4

    if-eqz v4, :cond_2a

    const v1, 0x1010435

    .line 33
    .local v1, "attr":I
    :goto_f
    const/4 v4, 0x2

    new-array v4, v4, [I

    aput v1, v4, v6

    sget v5, Lcom/jenzz/materialpreference/R$attr;->mp_colorAccent:I

    aput v5, v4, v7

    invoke-virtual {v2, v4}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v3

    .line 35
    .local v3, "typedArray":Landroid/content/res/TypedArray;
    sget v4, Lcom/jenzz/materialpreference/ThemeUtils;->FALLBACK_COLOR:I

    invoke-virtual {v3, v6, v4}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v0

    .line 36
    .local v0, "accentColor":I
    invoke-virtual {v3, v7, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v0

    .line 37
    invoke-virtual {v3}, Landroid/content/res/TypedArray;->recycle()V

    .line 39
    return v0

    .line 32
    .end local v0    # "accentColor":I
    .end local v1    # "attr":I
    .end local v3    # "typedArray":Landroid/content/res/TypedArray;
    :cond_2a
    sget v1, Lcom/jenzz/materialpreference/R$attr;->colorAccent:I

    goto :goto_f
.end method
