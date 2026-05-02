.class abstract Lcom/melnykov/fab/RecyclerViewScrollDetector;
.super Landroid/support/v7/widget/RecyclerView$OnScrollListener;
.source "RecyclerViewScrollDetector.java"


# instance fields
.field private mScrollThreshold:I


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 5
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$OnScrollListener;-><init>()V

    return-void
.end method


# virtual methods
.method abstract onScrollDown()V
.end method

.method abstract onScrollUp()V
.end method

.method public onScrolled(Landroid/support/v7/widget/RecyclerView;II)V
    .registers 7
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "dx"    # I
    .param p3, "dy"    # I

    .prologue
    .line 14
    invoke-static {p3}, Ljava/lang/Math;->abs(I)I

    move-result v1

    iget v2, p0, Lcom/melnykov/fab/RecyclerViewScrollDetector;->mScrollThreshold:I

    if-le v1, v2, :cond_11

    const/4 v0, 0x1

    .line 15
    .local v0, "isSignificantDelta":Z
    :goto_9
    if-eqz v0, :cond_10

    .line 16
    if-lez p3, :cond_13

    .line 17
    invoke-virtual {p0}, Lcom/melnykov/fab/RecyclerViewScrollDetector;->onScrollUp()V

    .line 22
    :cond_10
    :goto_10
    return-void

    .line 14
    .end local v0    # "isSignificantDelta":Z
    :cond_11
    const/4 v0, 0x0

    goto :goto_9

    .line 19
    .restart local v0    # "isSignificantDelta":Z
    :cond_13
    invoke-virtual {p0}, Lcom/melnykov/fab/RecyclerViewScrollDetector;->onScrollDown()V

    goto :goto_10
.end method

.method public setScrollThreshold(I)V
    .registers 2
    .param p1, "scrollThreshold"    # I

    .prologue
    .line 25
    iput p1, p0, Lcom/melnykov/fab/RecyclerViewScrollDetector;->mScrollThreshold:I

    .line 26
    return-void
.end method
