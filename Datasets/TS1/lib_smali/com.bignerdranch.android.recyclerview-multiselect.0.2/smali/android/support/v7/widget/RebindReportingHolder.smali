.class public abstract Landroid/support/v7/widget/RebindReportingHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "RebindReportingHolder.java"


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 2
    .param p1, "itemView"    # Landroid/view/View;

    .prologue
    .line 22
    invoke-direct {p0, p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 23
    return-void
.end method

.method private checkFlags(I)V
    .registers 3
    .param p1, "setFlags"    # I

    .prologue
    .line 44
    invoke-static {p1}, Landroid/support/v7/widget/RebindReportingHolder;->isRelevantFlagSet(I)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 45
    invoke-virtual {p0}, Landroid/support/v7/widget/RebindReportingHolder;->onRebind()V

    .line 47
    :cond_9
    return-void
.end method

.method private static isRelevantFlagSet(I)Z
    .registers 8
    .param p0, "flag"    # I

    .prologue
    const/4 v1, 0x0

    .line 55
    const/4 v2, 0x4

    new-array v3, v2, [I

    fill-array-data v3, :array_22

    array-length v4, v3

    move v2, v1

    :goto_9
    if-ge v2, v4, :cond_1d

    aget v5, v3, v2

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 56
    .local v0, "value":Ljava/lang/Integer;
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v5

    and-int/2addr v5, p0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-ne v5, v6, :cond_1e

    .line 57
    const/4 v1, 0x1

    .line 61
    .end local v0    # "value":Ljava/lang/Integer;
    :cond_1d
    return v1

    .line 55
    .restart local v0    # "value":Ljava/lang/Integer;
    :cond_1e
    add-int/lit8 v2, v2, 0x1

    goto :goto_9

    nop

    :array_22
    .array-data 4
        0x1
        0x40
        0x2
        0x20
    .end array-data
.end method


# virtual methods
.method addFlags(I)V
    .registers 2
    .param p1, "flags"    # I

    .prologue
    .line 39
    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->addFlags(I)V

    .line 40
    invoke-direct {p0, p1}, Landroid/support/v7/widget/RebindReportingHolder;->checkFlags(I)V

    .line 41
    return-void
.end method

.method offsetPosition(IZ)V
    .registers 3
    .param p1, "offset"    # I
    .param p2, "applyToPreLayout"    # Z

    .prologue
    .line 66
    invoke-super {p0, p1, p2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->offsetPosition(IZ)V

    .line 67
    invoke-virtual {p0}, Landroid/support/v7/widget/RebindReportingHolder;->onRebind()V

    .line 68
    return-void
.end method

.method protected abstract onRebind()V
.end method

.method setFlags(II)V
    .registers 4
    .param p1, "flags"    # I
    .param p2, "mask"    # I

    .prologue
    .line 32
    invoke-super {p0, p1, p2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->setFlags(II)V

    .line 33
    and-int v0, p2, p1

    .line 34
    .local v0, "setFlags":I
    invoke-direct {p0, v0}, Landroid/support/v7/widget/RebindReportingHolder;->checkFlags(I)V

    .line 35
    return-void
.end method
