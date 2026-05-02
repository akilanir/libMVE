.class public abstract Lcom/melnykov/fab/ScrollDirectionDetector;
.super Ljava/lang/Object;
.source "ScrollDirectionDetector.java"

# interfaces
.implements Landroid/widget/AbsListView$OnScrollListener;


# instance fields
.field public mLastChangeY:I

.field private mListView:Landroid/widget/AbsListView;

.field private mMinSignificantScroll:I

.field private mPreviousFirstVisibleItem:I

.field private mPreviousScrollY:I

.field private mScrollDirectionListener:Lcom/melnykov/fab/ScrollDirectionListener;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private estimateScrollY()I
    .registers 4

    .prologue
    const/4 v1, 0x0

    .line 99
    iget-object v2, p0, Lcom/melnykov/fab/ScrollDirectionDetector;->mListView:Landroid/widget/AbsListView;

    if-eqz v2, :cond_d

    iget-object v2, p0, Lcom/melnykov/fab/ScrollDirectionDetector;->mListView:Landroid/widget/AbsListView;

    invoke-virtual {v2, v1}, Landroid/widget/AbsListView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    if-nez v2, :cond_e

    .line 101
    :cond_d
    :goto_d
    return v1

    .line 100
    :cond_e
    iget-object v2, p0, Lcom/melnykov/fab/ScrollDirectionDetector;->mListView:Landroid/widget/AbsListView;

    invoke-virtual {v2, v1}, Landroid/widget/AbsListView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 101
    .local v0, "topChild":Landroid/view/View;
    iget-object v1, p0, Lcom/melnykov/fab/ScrollDirectionDetector;->mListView:Landroid/widget/AbsListView;

    invoke-virtual {v1}, Landroid/widget/AbsListView;->getFirstVisiblePosition()I

    move-result v1

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v2

    mul-int/2addr v1, v2

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v2

    sub-int/2addr v1, v2

    goto :goto_d
.end method

.method private isSameRow(I)Z
    .registers 4
    .param p1, "firstVisibleItem"    # I

    .prologue
    .line 85
    iget v1, p0, Lcom/melnykov/fab/ScrollDirectionDetector;->mPreviousFirstVisibleItem:I

    if-ne p1, v1, :cond_8

    const/4 v0, 0x1

    .line 86
    .local v0, "rowsChanged":Z
    :goto_5
    iput p1, p0, Lcom/melnykov/fab/ScrollDirectionDetector;->mPreviousFirstVisibleItem:I

    .line 87
    return v0

    .line 85
    .end local v0    # "rowsChanged":Z
    :cond_8
    const/4 v0, 0x0

    goto :goto_5
.end method

.method private isScrollUp(I)Z
    .registers 4
    .param p1, "newScrollY"    # I

    .prologue
    .line 54
    iget v1, p0, Lcom/melnykov/fab/ScrollDirectionDetector;->mPreviousScrollY:I

    if-le p1, v1, :cond_8

    const/4 v0, 0x1

    .line 55
    .local v0, "scrollUp":Z
    :goto_5
    iput p1, p0, Lcom/melnykov/fab/ScrollDirectionDetector;->mPreviousScrollY:I

    .line 56
    return v0

    .line 54
    .end local v0    # "scrollUp":Z
    :cond_8
    const/4 v0, 0x0

    goto :goto_5
.end method

.method private isSignificantDelta(I)Z
    .registers 5
    .param p1, "newScrollY"    # I

    .prologue
    .line 66
    iget v1, p0, Lcom/melnykov/fab/ScrollDirectionDetector;->mLastChangeY:I

    sub-int/2addr v1, p1

    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    iget v2, p0, Lcom/melnykov/fab/ScrollDirectionDetector;->mMinSignificantScroll:I

    if-le v1, v2, :cond_11

    const/4 v0, 0x1

    .line 67
    .local v0, "isSignificantDelta":Z
    :goto_c
    if-eqz v0, :cond_10

    .line 68
    iput p1, p0, Lcom/melnykov/fab/ScrollDirectionDetector;->mLastChangeY:I

    .line 69
    :cond_10
    return v0

    .line 66
    .end local v0    # "isSignificantDelta":Z
    :cond_11
    const/4 v0, 0x0

    goto :goto_c
.end method


# virtual methods
.method public getScrollDirectionListener()Lcom/melnykov/fab/ScrollDirectionListener;
    .registers 2

    .prologue
    .line 42
    iget-object v0, p0, Lcom/melnykov/fab/ScrollDirectionDetector;->mScrollDirectionListener:Lcom/melnykov/fab/ScrollDirectionListener;

    return-object v0
.end method

.method public onScroll(Landroid/widget/AbsListView;III)V
    .registers 7
    .param p1, "view"    # Landroid/widget/AbsListView;
    .param p2, "firstVisibleItem"    # I
    .param p3, "visibleItemCount"    # I
    .param p4, "totalItemCount"    # I

    .prologue
    .line 31
    invoke-direct {p0}, Lcom/melnykov/fab/ScrollDirectionDetector;->estimateScrollY()I

    move-result v0

    .line 32
    .local v0, "newScrollY":I
    iget-object v1, p0, Lcom/melnykov/fab/ScrollDirectionDetector;->mScrollDirectionListener:Lcom/melnykov/fab/ScrollDirectionListener;

    if-eqz v1, :cond_1f

    invoke-direct {p0, p2}, Lcom/melnykov/fab/ScrollDirectionDetector;->isSameRow(I)Z

    move-result v1

    if-eqz v1, :cond_1f

    invoke-direct {p0, v0}, Lcom/melnykov/fab/ScrollDirectionDetector;->isSignificantDelta(I)Z

    move-result v1

    if-eqz v1, :cond_1f

    .line 33
    invoke-direct {p0, v0}, Lcom/melnykov/fab/ScrollDirectionDetector;->isScrollUp(I)Z

    move-result v1

    if-eqz v1, :cond_20

    .line 34
    iget-object v1, p0, Lcom/melnykov/fab/ScrollDirectionDetector;->mScrollDirectionListener:Lcom/melnykov/fab/ScrollDirectionListener;

    invoke-interface {v1}, Lcom/melnykov/fab/ScrollDirectionListener;->onScrollUp()V

    .line 39
    :cond_1f
    :goto_1f
    return-void

    .line 36
    :cond_20
    iget-object v1, p0, Lcom/melnykov/fab/ScrollDirectionDetector;->mScrollDirectionListener:Lcom/melnykov/fab/ScrollDirectionListener;

    invoke-interface {v1}, Lcom/melnykov/fab/ScrollDirectionListener;->onScrollDown()V

    goto :goto_1f
.end method

.method public onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .registers 5
    .param p1, "view"    # Landroid/widget/AbsListView;
    .param p2, "scrollState"    # I

    .prologue
    .line 26
    invoke-virtual {p1}, Landroid/widget/AbsListView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/melnykov/fab/R$dimen;->fab_min_significant_scroll:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v0

    iput v0, p0, Lcom/melnykov/fab/ScrollDirectionDetector;->mMinSignificantScroll:I

    .line 27
    return-void
.end method

.method public setListView(Landroid/widget/AbsListView;)V
    .registers 2
    .param p1, "listView"    # Landroid/widget/AbsListView;

    .prologue
    .line 105
    iput-object p1, p0, Lcom/melnykov/fab/ScrollDirectionDetector;->mListView:Landroid/widget/AbsListView;

    .line 106
    return-void
.end method

.method public setScrollDirectionListener(Lcom/melnykov/fab/ScrollDirectionListener;)V
    .registers 2
    .param p1, "mScrollDirectionListener"    # Lcom/melnykov/fab/ScrollDirectionListener;

    .prologue
    .line 46
    iput-object p1, p0, Lcom/melnykov/fab/ScrollDirectionDetector;->mScrollDirectionListener:Lcom/melnykov/fab/ScrollDirectionListener;

    .line 47
    return-void
.end method
