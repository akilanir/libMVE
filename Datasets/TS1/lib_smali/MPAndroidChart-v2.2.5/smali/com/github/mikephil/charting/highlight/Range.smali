.class public final Lcom/github/mikephil/charting/highlight/Range;
.super Ljava/lang/Object;
.source "Range.java"


# instance fields
.field public from:F

.field public to:F


# direct methods
.method public constructor <init>(FF)V
    .registers 3
    .param p1, "from"    # F
    .param p2, "to"    # F

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput p1, p0, Lcom/github/mikephil/charting/highlight/Range;->from:F

    .line 14
    iput p2, p0, Lcom/github/mikephil/charting/highlight/Range;->to:F

    .line 15
    return-void
.end method


# virtual methods
.method public contains(F)Z
    .registers 3
    .param p1, "value"    # F

    .prologue
    .line 25
    iget v0, p0, Lcom/github/mikephil/charting/highlight/Range;->from:F

    cmpl-float v0, p1, v0

    if-lez v0, :cond_e

    iget v0, p0, Lcom/github/mikephil/charting/highlight/Range;->to:F

    cmpg-float v0, p1, v0

    if-gtz v0, :cond_e

    .line 26
    const/4 v0, 0x1

    .line 28
    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public isLarger(F)Z
    .registers 3
    .param p1, "value"    # F

    .prologue
    .line 32
    iget v0, p0, Lcom/github/mikephil/charting/highlight/Range;->to:F

    cmpl-float v0, p1, v0

    if-lez v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isSmaller(F)Z
    .registers 3
    .param p1, "value"    # F

    .prologue
    .line 36
    iget v0, p0, Lcom/github/mikephil/charting/highlight/Range;->from:F

    cmpg-float v0, p1, v0

    if-gez v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method
