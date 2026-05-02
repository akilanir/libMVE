.class final Lcom/github/mikephil/charting/animation/Easing$EasingFunctions$22;
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
    .line 508
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getInterpolation(F)F
    .registers 14
    .param p1, "input"    # F

    .prologue
    const/high16 v11, 0x3f000000    # 0.5f

    const/4 v3, 0x0

    const-wide v9, 0x401921fb54442d18L    # 6.283185307179586

    const-wide/high16 v7, 0x4000000000000000L    # 2.0

    const/high16 v4, 0x3f800000    # 1.0f

    .line 541
    cmpl-float v5, p1, v3

    if-nez v5, :cond_11

    .line 560
    :goto_10
    return v3

    .line 546
    :cond_11
    div-float v1, p1, v11

    .line 547
    .local v1, "position":F
    const/high16 v3, 0x40000000    # 2.0f

    cmpl-float v3, v1, v3

    if-nez v3, :cond_1b

    move v3, v4

    .line 549
    goto :goto_10

    .line 552
    :cond_1b
    const v0, 0x3ee66667    # 0.45000002f

    .line 553
    .local v0, "p":F
    const v3, 0x40c90fdb

    div-float v3, v0, v3

    const-wide/high16 v5, 0x3ff0000000000000L    # 1.0

    invoke-static {v5, v6}, Ljava/lang/Math;->asin(D)D

    move-result-wide v5

    double-to-float v5, v5

    mul-float v2, v3, v5

    .line 554
    .local v2, "s":F
    cmpg-float v3, v1, v4

    if-gez v3, :cond_4a

    .line 556
    const/high16 v3, -0x41000000    # -0.5f

    const/high16 v5, 0x41200000    # 10.0f

    sub-float/2addr v1, v4

    mul-float/2addr v5, v1

    float-to-double v5, v5

    invoke-static {v7, v8, v5, v6}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v5

    double-to-float v5, v5

    mul-float/2addr v4, v1

    sub-float/2addr v4, v2

    float-to-double v6, v4

    mul-double/2addr v6, v9

    float-to-double v8, v0

    div-double/2addr v6, v8

    invoke-static {v6, v7}, Ljava/lang/Math;->sin(D)D

    move-result-wide v6

    double-to-float v4, v6

    mul-float/2addr v4, v5

    mul-float/2addr v3, v4

    goto :goto_10

    .line 560
    :cond_4a
    const/high16 v3, -0x3ee00000    # -10.0f

    sub-float/2addr v1, v4

    mul-float/2addr v3, v1

    float-to-double v5, v3

    invoke-static {v7, v8, v5, v6}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v5

    double-to-float v3, v5

    mul-float v5, v1, v4

    sub-float/2addr v5, v2

    float-to-double v5, v5

    mul-double/2addr v5, v9

    float-to-double v7, v0

    div-double/2addr v5, v7

    invoke-static {v5, v6}, Ljava/lang/Math;->sin(D)D

    move-result-wide v5

    double-to-float v5, v5

    mul-float/2addr v3, v5

    mul-float/2addr v3, v11

    add-float/2addr v3, v4

    goto :goto_10
.end method
