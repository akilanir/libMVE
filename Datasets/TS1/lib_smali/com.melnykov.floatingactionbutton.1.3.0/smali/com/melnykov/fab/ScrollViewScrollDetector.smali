.class abstract Lcom/melnykov/fab/ScrollViewScrollDetector;
.super Ljava/lang/Object;
.source "ScrollViewScrollDetector.java"

# interfaces
.implements Lcom/melnykov/fab/ObservableScrollView$OnScrollChangedListener;


# instance fields
.field private mLastScrollY:I

.field private mScrollThreshold:I


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onScrollChanged(Landroid/widget/ScrollView;IIII)V
    .registers 9
    .param p1, "who"    # Landroid/widget/ScrollView;
    .param p2, "l"    # I
    .param p3, "t"    # I
    .param p4, "oldl"    # I
    .param p5, "oldt"    # I

    .prologue
    .line 15
    iget v1, p0, Lcom/melnykov/fab/ScrollViewScrollDetector;->mLastScrollY:I

    sub-int v1, p3, v1

    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    iget v2, p0, Lcom/melnykov/fab/ScrollViewScrollDetector;->mScrollThreshold:I

    if-le v1, v2, :cond_19

    const/4 v0, 0x1

    .line 16
    .local v0, "isSignificantDelta":Z
    :goto_d
    if-eqz v0, :cond_16

    .line 17
    iget v1, p0, Lcom/melnykov/fab/ScrollViewScrollDetector;->mLastScrollY:I

    if-le p3, v1, :cond_1b

    .line 18
    invoke-virtual {p0}, Lcom/melnykov/fab/ScrollViewScrollDetector;->onScrollUp()V

    .line 23
    :cond_16
    :goto_16
    iput p3, p0, Lcom/melnykov/fab/ScrollViewScrollDetector;->mLastScrollY:I

    .line 24
    return-void

    .line 15
    .end local v0    # "isSignificantDelta":Z
    :cond_19
    const/4 v0, 0x0

    goto :goto_d

    .line 20
    .restart local v0    # "isSignificantDelta":Z
    :cond_1b
    invoke-virtual {p0}, Lcom/melnykov/fab/ScrollViewScrollDetector;->onScrollDown()V

    goto :goto_16
.end method

.method abstract onScrollDown()V
.end method

.method abstract onScrollUp()V
.end method

.method public setScrollThreshold(I)V
    .registers 2
    .param p1, "scrollThreshold"    # I

    .prologue
    .line 27
    iput p1, p0, Lcom/melnykov/fab/ScrollViewScrollDetector;->mScrollThreshold:I

    .line 28
    return-void
.end method
