.class final Lcom/github/mikephil/charting/animation/Easing$EasingFunctions$21;
.super Ljava/lang/Object;
.source "Easing.java"

# interfaces
.implements Lcom/github/mikephil/charting/animation/EasingFunction;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/github/mikephil/charting/animation/Easing$EasingFunctions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 464
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getInterpolation(F)F
    .registers 11
    .param p1, "input"    # F

    .prologue
    const/4 v3, 0x0

    const/high16 v4, 0x3f800000    # 1.0f

    .line 488
    cmpl-float v5, p1, v3

    if-nez v5, :cond_8

    .line 501
    :goto_7
    return v3

    .line 493
    :cond_8
    move v1, p1

    .line 494
    .local v1, "position":F
    cmpl-float v3, v1, v4

    if-nez v3, :cond_f

    move v3, v4

    .line 496
    goto :goto_7

    .line 499
    :cond_f
    const v0, 0x3e99999a    # 0.3f

    .line 500
    .local v0, "p":F
    const v3, 0x40c90fdb

    div-float v3, v0, v3

    const-wide/high16 v5, 0x3ff0000000000000L    # 1.0

    invoke-static {v5, v6}, Ljava/lang/Math;->asin(D)D

    move-result-wide v5

    double-to-float v5, v5

    mul-float v2, v3, v5

    .line 501
    .local v2, "s":F
    const-wide/high16 v5, 0x4000000000000000L    # 2.0

    const/high16 v3, -0x3ee00000    # -10.0f

    mul-float/2addr v3, v1

    float-to-double v7, v3

    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v5

    double-to-float v3, v5

    sub-float v5, v1, v2

    float-to-double v5, v5

    const-wide v7, 0x401921fb54442d18L    # 6.283185307179586

    mul-double/2addr v5, v7

    float-to-double v7, v0

    div-double/2addr v5, v7

    invoke-static {v5, v6}, Ljava/lang/Math;->sin(D)D

    move-result-wide v5

    double-to-float v5, v5

    mul-float/2addr v3, v5

    add-float/2addr v3, v4

    goto :goto_7
.end method
