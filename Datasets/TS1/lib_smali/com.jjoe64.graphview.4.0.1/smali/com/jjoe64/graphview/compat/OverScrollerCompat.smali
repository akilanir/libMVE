.class public Lcom/jjoe64/graphview/compat/OverScrollerCompat;
.super Ljava/lang/Object;
.source "OverScrollerCompat.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    return-void
.end method

.method public static getCurrVelocity(Landroid/widget/OverScroller;)F
    .registers 3
    .param p0, "overScroller"    # Landroid/widget/OverScroller;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xe
    .end annotation

    .prologue
    .line 40
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-lt v0, v1, :cond_b

    .line 41
    invoke-virtual {p0}, Landroid/widget/OverScroller;->getCurrVelocity()F

    move-result v0

    .line 43
    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method
