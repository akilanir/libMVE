.class final Lcom/github/mikephil/charting/animation/Easing$EasingFunctions$20;
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
    .line 419
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getInterpolation(F)F
    .registers 10
    .param p1, "input"    # F

    .prologue
    const/4 v3, 0x0

    const/high16 v4, 0x3f800000    # 1.0f

    .line 444
    cmpl-float v5, p1, v3

    if-nez v5, :cond_8

    .line 457
    :goto_7
    return v3

    .line 449
    :cond_8
    move v1, p1

    .line 450
    .local v1, "position":F
    cmpl-float v3, v1, v4

    if-nez v3, :cond_f

    move v3, v4

    .line 452
    goto :goto_7

    .line 455
    :cond_f
    const v0, 0x3e99999a    # 0.3f

    .line 456
    .local v0, "p":F
    const v3, 0x40c90fdb

    div-float v3, v0, v3

    const-wide/high16 v5, 0x3ff0000000000000L    # 1.0

    invoke-static {v5, v6}, Ljava/lang/Math;->asin(D)D

    move-result-wide v5

    double-to-float v5, v5

    mul-float v2, v3, v5

    .line 457
    .local v2, "s":F
    const-wide/high16 v5, 0x4000000000000000L    # 2.0

    const/high16 v3, 0x41200000    # 10.0f

    sub-float/2addr v1, v4

    mul-float/2addr v3, v1

    float-to-double v3, v3

    invoke-static {v5, v6, v3, v4}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v3

    double-to-float v3, v3

    sub-float v4, v1, v2

    float-to-double v4, v4

    const-wide v6, 0x401921fb54442d18L    # 6.283185307179586

    mul-double/2addr v4, v6

    float-to-double v6, v0

    div-double/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/Math;->sin(D)D

    move-result-wide v4

    double-to-float v4, v4

    mul-float/2addr v3, v4

    neg-float v3, v3

    goto :goto_7
.end method
