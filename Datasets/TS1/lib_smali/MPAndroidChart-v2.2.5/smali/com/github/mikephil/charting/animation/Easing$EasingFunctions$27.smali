.class final Lcom/github/mikephil/charting/animation/Easing$EasingFunctions$27;
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
    .line 648
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getInterpolation(F)F
    .registers 5
    .param p1, "input"    # F

    .prologue
    const/high16 v2, 0x40f20000    # 7.5625f

    .line 675
    move v0, p1

    .line 676
    .local v0, "position":F
    const v1, 0x3eba2e8c

    cmpg-float v1, v0, v1

    if-gez v1, :cond_e

    .line 678
    mul-float v1, v2, v0

    mul-float/2addr v1, v0

    .line 690
    :goto_d
    return v1

    .line 680
    :cond_e
    const v1, 0x3f3a2e8c

    cmpg-float v1, v0, v1

    if-gez v1, :cond_20

    .line 682
    const v1, 0x3f0ba2e9

    sub-float/2addr v0, v1

    mul-float v1, v2, v0

    mul-float/2addr v1, v0

    const/high16 v2, 0x3f400000    # 0.75f

    add-float/2addr v1, v2

    goto :goto_d

    .line 684
    :cond_20
    const v1, 0x3f68ba2f

    cmpg-float v1, v0, v1

    if-gez v1, :cond_32

    .line 686
    const v1, 0x3f51745d

    sub-float/2addr v0, v1

    mul-float v1, v2, v0

    mul-float/2addr v1, v0

    const/high16 v2, 0x3f700000    # 0.9375f

    add-float/2addr v1, v2

    goto :goto_d

    .line 690
    :cond_32
    const v1, 0x3f745d17

    sub-float/2addr v0, v1

    mul-float v1, v2, v0

    mul-float/2addr v1, v0

    const/high16 v2, 0x3f7c0000    # 0.984375f

    add-float/2addr v1, v2

    goto :goto_d
.end method
