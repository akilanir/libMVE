.class public Lcom/github/paolorotolo/appintro/ScrollerCustomDuration;
.super Landroid/widget/Scroller;
.source "ScrollerCustomDuration.java"


# instance fields
.field private mScrollFactor:D


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 13
    invoke-direct {p0, p1}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;)V

    .line 10
    const-wide/high16 v0, 0x4018000000000000L    # 6.0

    iput-wide v0, p0, Lcom/github/paolorotolo/appintro/ScrollerCustomDuration;->mScrollFactor:D

    .line 14
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/view/animation/Interpolator;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "interpolator"    # Landroid/view/animation/Interpolator;

    .prologue
    .line 17
    invoke-direct {p0, p1, p2}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;Landroid/view/animation/Interpolator;)V

    .line 10
    const-wide/high16 v0, 0x4018000000000000L    # 6.0

    iput-wide v0, p0, Lcom/github/paolorotolo/appintro/ScrollerCustomDuration;->mScrollFactor:D

    .line 18
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/view/animation/Interpolator;Z)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "interpolator"    # Landroid/view/animation/Interpolator;
    .param p3, "flywheel"    # Z
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    .line 22
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;Landroid/view/animation/Interpolator;Z)V

    .line 10
    const-wide/high16 v0, 0x4018000000000000L    # 6.0

    iput-wide v0, p0, Lcom/github/paolorotolo/appintro/ScrollerCustomDuration;->mScrollFactor:D

    .line 23
    return-void
.end method


# virtual methods
.method public setScrollDurationFactor(D)V
    .registers 3
    .param p1, "scrollFactor"    # D

    .prologue
    .line 29
    iput-wide p1, p0, Lcom/github/paolorotolo/appintro/ScrollerCustomDuration;->mScrollFactor:D

    .line 30
    return-void
.end method

.method public startScroll(IIIII)V
    .registers 12
    .param p1, "startX"    # I
    .param p2, "startY"    # I
    .param p3, "dx"    # I
    .param p4, "dy"    # I
    .param p5, "duration"    # I

    .prologue
    .line 34
    int-to-double v0, p5

    iget-wide v2, p0, Lcom/github/paolorotolo/appintro/ScrollerCustomDuration;->mScrollFactor:D

    mul-double/2addr v0, v2

    double-to-int v5, v0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    invoke-super/range {v0 .. v5}, Landroid/widget/Scroller;->startScroll(IIIII)V

    .line 35
    return-void
.end method
