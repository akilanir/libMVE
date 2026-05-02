.class final Lcom/github/mikephil/charting/animation/Easing$EasingFunctions$24;
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
    .line 585
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getInterpolation(F)F
    .registers 8
    .param p1, "input"    # F

    .prologue
    const/high16 v5, 0x3f800000    # 1.0f

    .line 596
    const v1, 0x3fd9cd60

    .line 597
    .local v1, "s":F
    move v0, p1

    .line 598
    .local v0, "position":F
    sub-float/2addr v0, v5

    .line 599
    mul-float v2, v0, v0

    const v3, 0x402ce6b0

    mul-float/2addr v3, v0

    const v4, 0x3fd9cd60

    add-float/2addr v3, v4

    mul-float/2addr v2, v3

    add-float/2addr v2, v5

    return v2
.end method
