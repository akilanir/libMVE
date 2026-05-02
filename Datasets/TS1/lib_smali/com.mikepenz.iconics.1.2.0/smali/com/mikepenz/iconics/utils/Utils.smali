.class public Lcom/mikepenz/iconics/utils/Utils;
.super Ljava/lang/Object;
.source "Utils.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    return-void
.end method

.method public static convertDpToPx(Landroid/content/Context;F)I
    .registers 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "dp"    # F

    .prologue
    .line 30
    const/4 v0, 0x1

    .line 31
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    .line 30
    invoke-static {v0, p1, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v0

    float-to-int v0, v0

    return v0
.end method

.method public static isEnabled([I)Z
    .registers 6
    .param p0, "stateSet"    # [I

    .prologue
    const/4 v1, 0x0

    .line 35
    array-length v3, p0

    move v2, v1

    :goto_3
    if-ge v2, v3, :cond_d

    aget v0, p0, v2

    .line 36
    .local v0, "state":I
    const v4, 0x101009e

    if-ne v0, v4, :cond_e

    .line 37
    const/4 v1, 0x1

    .line 38
    .end local v0    # "state":I
    :cond_d
    return v1

    .line 35
    .restart local v0    # "state":I
    :cond_e
    add-int/lit8 v2, v2, 0x1

    goto :goto_3
.end method
