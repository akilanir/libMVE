.class public Lcom/gc/materialdesign/utils/Utils;
.super Ljava/lang/Object;
.source "Utils.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static dpToPx(FLandroid/content/res/Resources;)I
    .registers 5
    .param p0, "dp"    # F
    .param p1, "resources"    # Landroid/content/res/Resources;

    .prologue
    .line 14
    const/4 v1, 0x1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    invoke-static {v1, p0, v2}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v0

    .line 15
    .local v0, "px":F
    float-to-int v1, v0

    return v1
.end method

.method public static getRelativeLeft(Landroid/view/View;)I
    .registers 3
    .param p0, "myView"    # Landroid/view/View;

    .prologue
    .line 28
    invoke-virtual {p0}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x1020002

    if-ne v0, v1, :cond_e

    .line 29
    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    move-result v0

    .line 31
    :goto_d
    return v0

    :cond_e
    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    move-result v1

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-static {v0}, Lcom/gc/materialdesign/utils/Utils;->getRelativeLeft(Landroid/view/View;)I

    move-result v0

    add-int/2addr v0, v1

    goto :goto_d
.end method

.method public static getRelativeTop(Landroid/view/View;)I
    .registers 3
    .param p0, "myView"    # Landroid/view/View;

    .prologue
    .line 20
    invoke-virtual {p0}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x1020002

    if-ne v0, v1, :cond_e

    .line 21
    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    move-result v0

    .line 23
    :goto_d
    return v0

    :cond_e
    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    move-result v1

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-static {v0}, Lcom/gc/materialdesign/utils/Utils;->getRelativeTop(Landroid/view/View;)I

    move-result v0

    add-int/2addr v0, v1

    goto :goto_d
.end method
