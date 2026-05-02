.class public Lcom/rey/material/util/ColorUtil;
.super Ljava/lang/Object;
.source "ColorUtil.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getColor(IF)I
    .registers 5
    .param p0, "baseColor"    # I
    .param p1, "alphaPercent"    # F

    .prologue
    .line 29
    invoke-static {p0}, Landroid/graphics/Color;->alpha(I)I

    move-result v1

    int-to-float v1, v1

    mul-float/2addr v1, p1

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v0

    .line 31
    .local v0, "alpha":I
    const v1, 0xffffff

    and-int/2addr v1, p0

    shl-int/lit8 v2, v0, 0x18

    or-int/2addr v1, v2

    return v1
.end method

.method public static getMiddleColor(IIF)I
    .registers 9
    .param p0, "prevColor"    # I
    .param p1, "curColor"    # I
    .param p2, "factor"    # F

    .prologue
    .line 12
    if-ne p0, p1, :cond_3

    .line 25
    .end local p1    # "curColor":I
    :cond_2
    :goto_2
    return p1

    .line 15
    .restart local p1    # "curColor":I
    :cond_3
    const/4 v4, 0x0

    cmpl-float v4, p2, v4

    if-nez v4, :cond_a

    move p1, p0

    .line 16
    goto :goto_2

    .line 17
    :cond_a
    const/high16 v4, 0x3f800000    # 1.0f

    cmpl-float v4, p2, v4

    if-eqz v4, :cond_2

    .line 20
    invoke-static {p0}, Landroid/graphics/Color;->alpha(I)I

    move-result v4

    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    move-result v5

    invoke-static {v4, v5, p2}, Lcom/rey/material/util/ColorUtil;->getMiddleValue(IIF)I

    move-result v0

    .line 21
    .local v0, "a":I
    invoke-static {p0}, Landroid/graphics/Color;->red(I)I

    move-result v4

    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    move-result v5

    invoke-static {v4, v5, p2}, Lcom/rey/material/util/ColorUtil;->getMiddleValue(IIF)I

    move-result v3

    .line 22
    .local v3, "r":I
    invoke-static {p0}, Landroid/graphics/Color;->green(I)I

    move-result v4

    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    move-result v5

    invoke-static {v4, v5, p2}, Lcom/rey/material/util/ColorUtil;->getMiddleValue(IIF)I

    move-result v2

    .line 23
    .local v2, "g":I
    invoke-static {p0}, Landroid/graphics/Color;->blue(I)I

    move-result v4

    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    move-result v5

    invoke-static {v4, v5, p2}, Lcom/rey/material/util/ColorUtil;->getMiddleValue(IIF)I

    move-result v1

    .line 25
    .local v1, "b":I
    invoke-static {v0, v3, v2, v1}, Landroid/graphics/Color;->argb(IIII)I

    move-result p1

    goto :goto_2
.end method

.method private static getMiddleValue(IIF)I
    .registers 5
    .param p0, "prev"    # I
    .param p1, "next"    # I
    .param p2, "factor"    # F

    .prologue
    .line 8
    int-to-float v0, p0

    sub-int v1, p1, p0

    int-to-float v1, v1

    mul-float/2addr v1, p2

    add-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    return v0
.end method
