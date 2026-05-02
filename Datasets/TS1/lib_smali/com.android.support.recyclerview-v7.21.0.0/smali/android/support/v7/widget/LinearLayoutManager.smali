.class public Landroid/support/v7/widget/LinearLayoutManager;
.super Landroid/support/v7/widget/RecyclerView$LayoutManager;
.source "LinearLayoutManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/widget/LinearLayoutManager$LayoutChunkResult;,
        Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;,
        Landroid/support/v7/widget/LinearLayoutManager$SavedState;,
        Landroid/support/v7/widget/LinearLayoutManager$LayoutState;
    }
.end annotation


# static fields
.field private static final DEBUG:Z = false

.field public static final HORIZONTAL:I = 0x0

.field public static final INVALID_OFFSET:I = -0x80000000

.field private static final MAX_SCROLL_FACTOR:F = 0.33f

.field private static final TAG:Ljava/lang/String; = "LinearLayoutManager"

.field public static final VERTICAL:I = 0x1


# instance fields
.field final mAnchorInfo:Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;

.field private mLastStackFromEnd:Z

.field private mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

.field mOrientation:I

.field mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

.field mPendingSavedState:Landroid/support/v7/widget/LinearLayoutManager$SavedState;

.field mPendingScrollPosition:I

.field mPendingScrollPositionOffset:I

.field private mRecycleChildrenOnDetach:Z

.field private mReverseLayout:Z

.field mShouldReverseLayout:Z

.field private mSmoothScrollbarEnabled:Z

.field private mStackFromEnd:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 141
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 142
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;IZ)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "orientation"    # I
    .param p3, "reverseLayout"    # Z

    .prologue
    const/4 v0, 0x0

    .line 150
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$LayoutManager;-><init>()V

    .line 91
    iput-boolean v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mReverseLayout:Z

    .line 98
    iput-boolean v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mShouldReverseLayout:Z

    .line 105
    iput-boolean v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mStackFromEnd:Z

    .line 111
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mSmoothScrollbarEnabled:Z

    .line 117
    const/4 v0, -0x1

    iput v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingScrollPosition:I

    .line 123
    const/high16 v0, -0x80000000

    iput v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingScrollPositionOffset:I

    .line 127
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/LinearLayoutManager$SavedState;

    .line 151
    new-instance v0, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;

    invoke-direct {v0, p0}, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;-><init>(Landroid/support/v7/widget/LinearLayoutManager;)V

    iput-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mAnchorInfo:Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;

    .line 152
    invoke-virtual {p0, p2}, Landroid/support/v7/widget/LinearLayoutManager;->setOrientation(I)V

    .line 153
    invoke-virtual {p0, p3}, Landroid/support/v7/widget/LinearLayoutManager;->setReverseLayout(Z)V

    .line 154
    return-void
.end method

.method private computeScrollExtent(Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 8
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 999
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildCount()I

    move-result v0

    if-nez v0, :cond_8

    .line 1000
    const/4 v0, 0x0

    .line 1002
    :goto_7
    return v0

    :cond_8
    iget-object v1, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-direct {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildClosestToStart()Landroid/view/View;

    move-result-object v2

    invoke-direct {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildClosestToEnd()Landroid/view/View;

    move-result-object v3

    iget-boolean v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mSmoothScrollbarEnabled:Z

    move-object v0, p1

    move-object v4, p0

    invoke-static/range {v0 .. v5}, Landroid/support/v7/widget/ScrollbarHelper;->computeScrollExtent(Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/OrientationHelper;Landroid/view/View;Landroid/view/View;Landroid/support/v7/widget/RecyclerView$LayoutManager;Z)I

    move-result v0

    goto :goto_7
.end method

.method private computeScrollOffset(Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 9
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 990
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildCount()I

    move-result v0

    if-nez v0, :cond_8

    .line 991
    const/4 v0, 0x0

    .line 993
    :goto_7
    return v0

    :cond_8
    iget-object v1, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-direct {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildClosestToStart()Landroid/view/View;

    move-result-object v2

    invoke-direct {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildClosestToEnd()Landroid/view/View;

    move-result-object v3

    iget-boolean v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mSmoothScrollbarEnabled:Z

    iget-boolean v6, p0, Landroid/support/v7/widget/LinearLayoutManager;->mShouldReverseLayout:Z

    move-object v0, p1

    move-object v4, p0

    invoke-static/range {v0 .. v6}, Landroid/support/v7/widget/ScrollbarHelper;->computeScrollOffset(Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/OrientationHelper;Landroid/view/View;Landroid/view/View;Landroid/support/v7/widget/RecyclerView$LayoutManager;ZZ)I

    move-result v0

    goto :goto_7
.end method

.method private computeScrollRange(Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 8
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 1008
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildCount()I

    move-result v0

    if-nez v0, :cond_8

    .line 1009
    const/4 v0, 0x0

    .line 1011
    :goto_7
    return v0

    :cond_8
    iget-object v1, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-direct {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildClosestToStart()Landroid/view/View;

    move-result-object v2

    invoke-direct {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildClosestToEnd()Landroid/view/View;

    move-result-object v3

    iget-boolean v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mSmoothScrollbarEnabled:Z

    move-object v0, p1

    move-object v4, p0

    invoke-static/range {v0 .. v5}, Landroid/support/v7/widget/ScrollbarHelper;->computeScrollRange(Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/OrientationHelper;Landroid/view/View;Landroid/view/View;Landroid/support/v7/widget/RecyclerView$LayoutManager;Z)I

    move-result v0

    goto :goto_7
.end method

.method private convertFocusDirectionToLayoutDirection(I)I
    .registers 6
    .param p1, "focusDirection"    # I

    .prologue
    const/4 v0, -0x1

    const/4 v2, 0x1

    const/high16 v1, -0x80000000

    .line 1385
    sparse-switch p1, :sswitch_data_26

    move v0, v1

    .line 1406
    :cond_8
    :goto_8
    :sswitch_8
    return v0

    :sswitch_9
    move v0, v2

    .line 1389
    goto :goto_8

    .line 1391
    :sswitch_b
    iget v3, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientation:I

    if-eq v3, v2, :cond_8

    move v0, v1

    goto :goto_8

    .line 1394
    :sswitch_11
    iget v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientation:I

    if-ne v0, v2, :cond_16

    move v1, v2

    :cond_16
    move v0, v1

    goto :goto_8

    .line 1397
    :sswitch_18
    iget v2, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientation:I

    if-eqz v2, :cond_8

    move v0, v1

    goto :goto_8

    .line 1400
    :sswitch_1e
    iget v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientation:I

    if-nez v0, :cond_24

    :goto_22
    move v0, v2

    goto :goto_8

    :cond_24
    move v2, v1

    goto :goto_22

    .line 1385
    :sswitch_data_26
    .sparse-switch
        0x1 -> :sswitch_8
        0x2 -> :sswitch_9
        0x11 -> :sswitch_18
        0x21 -> :sswitch_b
        0x42 -> :sswitch_1e
        0x82 -> :sswitch_11
    .end sparse-switch
.end method

.method private findFirstReferenceChild(I)Landroid/view/View;
    .registers 4
    .param p1, "itemCount"    # I

    .prologue
    .line 1464
    const/4 v0, 0x0

    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildCount()I

    move-result v1

    invoke-direct {p0, v0, v1, p1}, Landroid/support/v7/widget/LinearLayoutManager;->findReferenceChild(III)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method private findLastReferenceChild(I)Landroid/view/View;
    .registers 4
    .param p1, "itemCount"    # I

    .prologue
    .line 1468
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    const/4 v1, -0x1

    invoke-direct {p0, v0, v1, p1}, Landroid/support/v7/widget/LinearLayoutManager;->findReferenceChild(III)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method private findReferenceChild(III)Landroid/view/View;
    .registers 13
    .param p1, "start"    # I
    .param p2, "end"    # I
    .param p3, "itemCount"    # I

    .prologue
    .line 1472
    const/4 v4, 0x0

    .line 1473
    .local v4, "invalidMatch":Landroid/view/View;
    const/4 v5, 0x0

    .line 1474
    .local v5, "outOfBoundsMatch":Landroid/view/View;
    iget-object v8, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v8}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v1

    .line 1475
    .local v1, "boundsStart":I
    iget-object v8, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v8}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v0

    .line 1476
    .local v0, "boundsEnd":I
    if-le p2, p1, :cond_31

    const/4 v2, 0x1

    .line 1477
    .local v2, "diff":I
    :goto_11
    move v3, p1

    .local v3, "i":I
    :goto_12
    if-eq v3, p2, :cond_47

    .line 1478
    invoke-virtual {p0, v3}, Landroid/support/v7/widget/LinearLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    .line 1479
    .local v7, "view":Landroid/view/View;
    invoke-virtual {p0, v7}, Landroid/support/v7/widget/LinearLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v6

    .line 1480
    .local v6, "position":I
    if-ltz v6, :cond_2f

    if-ge v6, p3, :cond_2f

    .line 1481
    invoke-virtual {v7}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v8

    check-cast v8, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    invoke-virtual {v8}, Landroid/support/v7/widget/RecyclerView$LayoutParams;->isItemRemoved()Z

    move-result v8

    if-eqz v8, :cond_33

    .line 1482
    if-nez v4, :cond_2f

    .line 1483
    move-object v4, v7

    .line 1477
    :cond_2f
    :goto_2f
    add-int/2addr v3, v2

    goto :goto_12

    .line 1476
    .end local v2    # "diff":I
    .end local v3    # "i":I
    .end local v6    # "position":I
    .end local v7    # "view":Landroid/view/View;
    :cond_31
    const/4 v2, -0x1

    goto :goto_11

    .line 1485
    .restart local v2    # "diff":I
    .restart local v3    # "i":I
    .restart local v6    # "position":I
    .restart local v7    # "view":Landroid/view/View;
    :cond_33
    iget-object v8, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v8, v7}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v8

    if-ge v8, v0, :cond_43

    iget-object v8, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v8, v7}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedEnd(Landroid/view/View;)I

    move-result v8

    if-ge v8, v1, :cond_4a

    .line 1487
    :cond_43
    if-nez v5, :cond_2f

    .line 1488
    move-object v5, v7

    goto :goto_2f

    .line 1495
    .end local v6    # "position":I
    .end local v7    # "view":Landroid/view/View;
    :cond_47
    if-eqz v5, :cond_4b

    .end local v5    # "outOfBoundsMatch":Landroid/view/View;
    :goto_49
    move-object v7, v5

    :cond_4a
    return-object v7

    .restart local v5    # "outOfBoundsMatch":Landroid/view/View;
    :cond_4b
    move-object v5, v4

    goto :goto_49
.end method

.method private findReferenceChildClosestToEnd(Landroid/support/v7/widget/RecyclerView$State;)Landroid/view/View;
    .registers 3
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 1443
    iget-boolean v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mShouldReverseLayout:Z

    if-eqz v0, :cond_d

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v0

    invoke-direct {p0, v0}, Landroid/support/v7/widget/LinearLayoutManager;->findFirstReferenceChild(I)Landroid/view/View;

    move-result-object v0

    :goto_c
    return-object v0

    :cond_d
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v0

    invoke-direct {p0, v0}, Landroid/support/v7/widget/LinearLayoutManager;->findLastReferenceChild(I)Landroid/view/View;

    move-result-object v0

    goto :goto_c
.end method

.method private findReferenceChildClosestToStart(Landroid/support/v7/widget/RecyclerView$State;)Landroid/view/View;
    .registers 3
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 1459
    iget-boolean v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mShouldReverseLayout:Z

    if-eqz v0, :cond_d

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v0

    invoke-direct {p0, v0}, Landroid/support/v7/widget/LinearLayoutManager;->findLastReferenceChild(I)Landroid/view/View;

    move-result-object v0

    :goto_c
    return-object v0

    :cond_d
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v0

    invoke-direct {p0, v0}, Landroid/support/v7/widget/LinearLayoutManager;->findFirstReferenceChild(I)Landroid/view/View;

    move-result-object v0

    goto :goto_c
.end method

.method private fixLayoutEndGap(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;Z)I
    .registers 8
    .param p1, "endOffset"    # I
    .param p2, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p3, "state"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p4, "canOffsetChildren"    # Z

    .prologue
    .line 794
    iget-object v2, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v2}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v2

    sub-int v1, v2, p1

    .line 795
    .local v1, "gap":I
    const/4 v0, 0x0

    .line 796
    .local v0, "fixOffset":I
    if-lez v1, :cond_26

    .line 797
    neg-int v2, v1

    invoke-virtual {p0, v2, p2, p3}, Landroid/support/v7/widget/LinearLayoutManager;->scrollBy(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v2

    neg-int v0, v2

    .line 802
    add-int/2addr p1, v0

    .line 803
    if-eqz p4, :cond_28

    .line 805
    iget-object v2, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v2}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v2

    sub-int v1, v2, p1

    .line 806
    if-lez v1, :cond_28

    .line 807
    iget-object v2, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v2, v1}, Landroid/support/v7/widget/OrientationHelper;->offsetChildren(I)V

    .line 808
    add-int v2, v1, v0

    .line 811
    :goto_25
    return v2

    .line 799
    :cond_26
    const/4 v2, 0x0

    goto :goto_25

    :cond_28
    move v2, v0

    .line 811
    goto :goto_25
.end method

.method private fixLayoutStartGap(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;Z)I
    .registers 9
    .param p1, "startOffset"    # I
    .param p2, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p3, "state"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p4, "canOffsetChildren"    # Z

    .prologue
    .line 819
    iget-object v2, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v2}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v2

    sub-int v1, p1, v2

    .line 820
    .local v1, "gap":I
    const/4 v0, 0x0

    .line 821
    .local v0, "fixOffset":I
    if-lez v1, :cond_26

    .line 823
    invoke-virtual {p0, v1, p2, p3}, Landroid/support/v7/widget/LinearLayoutManager;->scrollBy(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v2

    neg-int v0, v2

    .line 827
    add-int/2addr p1, v0

    .line 828
    if-eqz p4, :cond_28

    .line 830
    iget-object v2, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v2}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v2

    sub-int v1, p1, v2

    .line 831
    if-lez v1, :cond_28

    .line 832
    iget-object v2, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    neg-int v3, v1

    invoke-virtual {v2, v3}, Landroid/support/v7/widget/OrientationHelper;->offsetChildren(I)V

    .line 833
    sub-int v2, v0, v1

    .line 836
    :goto_25
    return v2

    .line 825
    :cond_26
    const/4 v2, 0x0

    goto :goto_25

    :cond_28
    move v2, v0

    .line 836
    goto :goto_25
.end method

.method private getChildClosestToEnd()Landroid/view/View;
    .registers 2

    .prologue
    .line 1428
    iget-boolean v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mShouldReverseLayout:Z

    if-eqz v0, :cond_a

    const/4 v0, 0x0

    :goto_5
    invoke-virtual {p0, v0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    return-object v0

    :cond_a
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    goto :goto_5
.end method

.method private getChildClosestToStart()Landroid/view/View;
    .registers 2

    .prologue
    .line 1418
    iget-boolean v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mShouldReverseLayout:Z

    if-eqz v0, :cond_f

    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_a
    invoke-virtual {p0, v0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    return-object v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_a
.end method

.method private layoutForPredictiveAnimations(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;II)V
    .registers 19
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p3, "startOffset"    # I
    .param p4, "endOffset"    # I

    .prologue
    .line 590
    invoke-virtual/range {p2 .. p2}, Landroid/support/v7/widget/RecyclerView$State;->willRunPredictiveAnimations()Z

    move-result v11

    if-eqz v11, :cond_18

    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildCount()I

    move-result v11

    if-eqz v11, :cond_18

    invoke-virtual/range {p2 .. p2}, Landroid/support/v7/widget/RecyclerView$State;->isPreLayout()Z

    move-result v11

    if-nez v11, :cond_18

    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->supportsPredictiveItemAnimations()Z

    move-result v11

    if-nez v11, :cond_19

    .line 635
    :cond_18
    :goto_18
    return-void

    .line 596
    :cond_19
    const/4 v8, 0x0

    .local v8, "scrapExtraStart":I
    const/4 v7, 0x0

    .line 597
    .local v7, "scrapExtraEnd":I
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$Recycler;->getScrapList()Ljava/util/List;

    move-result-object v9

    .line 598
    .local v9, "scrapList":Ljava/util/List;, "Ljava/util/List<Landroid/support/v7/widget/RecyclerView$ViewHolder;>;"
    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v10

    .line 599
    .local v10, "scrapSize":I
    const/4 v11, 0x0

    invoke-virtual {p0, v11}, Landroid/support/v7/widget/LinearLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v11

    invoke-virtual {p0, v11}, Landroid/support/v7/widget/LinearLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v3

    .line 600
    .local v3, "firstChildPos":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_2d
    if-ge v4, v10, :cond_5e

    .line 601
    invoke-interface {v9, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .line 602
    .local v6, "scrap":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    invoke-virtual {v6}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getPosition()I

    move-result v5

    .line 603
    .local v5, "position":I
    if-ge v5, v3, :cond_50

    const/4 v11, 0x1

    :goto_3c
    iget-boolean v12, p0, Landroid/support/v7/widget/LinearLayoutManager;->mShouldReverseLayout:Z

    if-eq v11, v12, :cond_52

    const/4 v2, -0x1

    .line 605
    .local v2, "direction":I
    :goto_41
    const/4 v11, -0x1

    if-ne v2, v11, :cond_54

    .line 606
    iget-object v11, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    iget-object v12, v6, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v11, v12}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedMeasurement(Landroid/view/View;)I

    move-result v11

    add-int/2addr v8, v11

    .line 600
    :goto_4d
    add-int/lit8 v4, v4, 0x1

    goto :goto_2d

    .line 603
    .end local v2    # "direction":I
    :cond_50
    const/4 v11, 0x0

    goto :goto_3c

    :cond_52
    const/4 v2, 0x1

    goto :goto_41

    .line 608
    .restart local v2    # "direction":I
    :cond_54
    iget-object v11, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    iget-object v12, v6, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v11, v12}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedMeasurement(Landroid/view/View;)I

    move-result v11

    add-int/2addr v7, v11

    goto :goto_4d

    .line 616
    .end local v2    # "direction":I
    .end local v5    # "position":I
    .end local v6    # "scrap":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    :cond_5e
    iget-object v11, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iput-object v9, v11, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mScrapList:Ljava/util/List;

    .line 617
    if-lez v8, :cond_8e

    .line 618
    invoke-direct {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildClosestToStart()Landroid/view/View;

    move-result-object v1

    .line 619
    .local v1, "anchor":Landroid/view/View;
    invoke-virtual {p0, v1}, Landroid/support/v7/widget/LinearLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v11

    move/from16 v0, p3

    invoke-direct {p0, v11, v0}, Landroid/support/v7/widget/LinearLayoutManager;->updateLayoutStateToFillStart(II)V

    .line 620
    iget-object v11, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iput v8, v11, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mExtra:I

    .line 621
    iget-object v11, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    const/4 v12, 0x0

    iput v12, v11, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mAvailable:I

    .line 622
    iget-object v12, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget v13, v12, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mCurrentPosition:I

    iget-boolean v11, p0, Landroid/support/v7/widget/LinearLayoutManager;->mShouldReverseLayout:Z

    if-eqz v11, :cond_c1

    const/4 v11, 0x1

    :goto_83
    add-int/2addr v11, v13

    iput v11, v12, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mCurrentPosition:I

    .line 623
    iget-object v11, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    const/4 v12, 0x0

    move-object/from16 v0, p2

    invoke-virtual {p0, p1, v11, v0, v12}, Landroid/support/v7/widget/LinearLayoutManager;->fill(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/LinearLayoutManager$LayoutState;Landroid/support/v7/widget/RecyclerView$State;Z)I

    .line 626
    .end local v1    # "anchor":Landroid/view/View;
    :cond_8e
    if-lez v7, :cond_ba

    .line 627
    invoke-direct {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildClosestToEnd()Landroid/view/View;

    move-result-object v1

    .line 628
    .restart local v1    # "anchor":Landroid/view/View;
    invoke-virtual {p0, v1}, Landroid/support/v7/widget/LinearLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v11

    move/from16 v0, p4

    invoke-direct {p0, v11, v0}, Landroid/support/v7/widget/LinearLayoutManager;->updateLayoutStateToFillEnd(II)V

    .line 629
    iget-object v11, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iput v7, v11, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mExtra:I

    .line 630
    iget-object v11, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    const/4 v12, 0x0

    iput v12, v11, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mAvailable:I

    .line 631
    iget-object v12, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget v13, v12, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mCurrentPosition:I

    iget-boolean v11, p0, Landroid/support/v7/widget/LinearLayoutManager;->mShouldReverseLayout:Z

    if-eqz v11, :cond_c3

    const/4 v11, -0x1

    :goto_af
    add-int/2addr v11, v13

    iput v11, v12, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mCurrentPosition:I

    .line 632
    iget-object v11, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    const/4 v12, 0x0

    move-object/from16 v0, p2

    invoke-virtual {p0, p1, v11, v0, v12}, Landroid/support/v7/widget/LinearLayoutManager;->fill(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/LinearLayoutManager$LayoutState;Landroid/support/v7/widget/RecyclerView$State;Z)I

    .line 634
    .end local v1    # "anchor":Landroid/view/View;
    :cond_ba
    iget-object v11, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    const/4 v12, 0x0

    iput-object v12, v11, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mScrapList:Ljava/util/List;

    goto/16 :goto_18

    .line 622
    .restart local v1    # "anchor":Landroid/view/View;
    :cond_c1
    const/4 v11, -0x1

    goto :goto_83

    .line 631
    :cond_c3
    const/4 v11, 0x1

    goto :goto_af
.end method

.method private logChildren()V
    .registers 6

    .prologue
    .line 1643
    const-string v2, "LinearLayoutManager"

    const-string v3, "internal representation of views on the screen"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1644
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_8
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_41

    .line 1645
    invoke-virtual {p0, v1}, Landroid/support/v7/widget/LinearLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 1646
    .local v0, "child":Landroid/view/View;
    const-string v2, "LinearLayoutManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "item "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/LinearLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", coord:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4, v0}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1644
    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    .line 1649
    .end local v0    # "child":Landroid/view/View;
    :cond_41
    const-string v2, "LinearLayoutManager"

    const-string v3, "=============="

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1650
    return-void
.end method

.method private recycleByLayoutState(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/LinearLayoutManager$LayoutState;)V
    .registers 5
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "layoutState"    # Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    .prologue
    .line 1229
    iget-boolean v0, p2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mRecycle:Z

    if-nez v0, :cond_5

    .line 1237
    :goto_4
    return-void

    .line 1232
    :cond_5
    iget v0, p2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mLayoutDirection:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_10

    .line 1233
    iget v0, p2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mScrollingOffset:I

    invoke-direct {p0, p1, v0}, Landroid/support/v7/widget/LinearLayoutManager;->recycleViewsFromEnd(Landroid/support/v7/widget/RecyclerView$Recycler;I)V

    goto :goto_4

    .line 1235
    :cond_10
    iget v0, p2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mScrollingOffset:I

    invoke-direct {p0, p1, v0}, Landroid/support/v7/widget/LinearLayoutManager;->recycleViewsFromStart(Landroid/support/v7/widget/RecyclerView$Recycler;I)V

    goto :goto_4
.end method

.method private recycleChildren(Landroid/support/v7/widget/RecyclerView$Recycler;II)V
    .registers 5
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "startIndex"    # I
    .param p3, "endIndex"    # I

    .prologue
    .line 1122
    if-ne p2, p3, :cond_3

    .line 1137
    :cond_2
    return-void

    .line 1128
    :cond_3
    if-le p3, p2, :cond_f

    .line 1129
    add-int/lit8 v0, p3, -0x1

    .local v0, "i":I
    :goto_7
    if-lt v0, p2, :cond_2

    .line 1130
    invoke-virtual {p0, v0, p1}, Landroid/support/v7/widget/LinearLayoutManager;->removeAndRecycleViewAt(ILandroid/support/v7/widget/RecyclerView$Recycler;)V

    .line 1129
    add-int/lit8 v0, v0, -0x1

    goto :goto_7

    .line 1133
    .end local v0    # "i":I
    :cond_f
    move v0, p2

    .restart local v0    # "i":I
    :goto_10
    if-le v0, p3, :cond_2

    .line 1134
    invoke-virtual {p0, v0, p1}, Landroid/support/v7/widget/LinearLayoutManager;->removeAndRecycleViewAt(ILandroid/support/v7/widget/RecyclerView$Recycler;)V

    .line 1133
    add-int/lit8 v0, v0, -0x1

    goto :goto_10
.end method

.method private recycleViewsFromEnd(Landroid/support/v7/widget/RecyclerView$Recycler;I)V
    .registers 8
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "dt"    # I

    .prologue
    .line 1188
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildCount()I

    move-result v1

    .line 1189
    .local v1, "childCount":I
    if-gez p2, :cond_7

    .line 1215
    :cond_6
    :goto_6
    return-void

    .line 1196
    :cond_7
    iget-object v4, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4}, Landroid/support/v7/widget/OrientationHelper;->getEnd()I

    move-result v4

    sub-int v3, v4, p2

    .line 1197
    .local v3, "limit":I
    iget-boolean v4, p0, Landroid/support/v7/widget/LinearLayoutManager;->mShouldReverseLayout:Z

    if-eqz v4, :cond_2a

    .line 1198
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_14
    if-ge v2, v1, :cond_6

    .line 1199
    invoke-virtual {p0, v2}, Landroid/support/v7/widget/LinearLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 1200
    .local v0, "child":Landroid/view/View;
    iget-object v4, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4, v0}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v4

    if-ge v4, v3, :cond_27

    .line 1201
    const/4 v4, 0x0

    invoke-direct {p0, p1, v4, v2}, Landroid/support/v7/widget/LinearLayoutManager;->recycleChildren(Landroid/support/v7/widget/RecyclerView$Recycler;II)V

    goto :goto_6

    .line 1198
    :cond_27
    add-int/lit8 v2, v2, 0x1

    goto :goto_14

    .line 1206
    .end local v0    # "child":Landroid/view/View;
    .end local v2    # "i":I
    :cond_2a
    add-int/lit8 v2, v1, -0x1

    .restart local v2    # "i":I
    :goto_2c
    if-ltz v2, :cond_6

    .line 1207
    invoke-virtual {p0, v2}, Landroid/support/v7/widget/LinearLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 1208
    .restart local v0    # "child":Landroid/view/View;
    iget-object v4, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4, v0}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v4

    if-ge v4, v3, :cond_40

    .line 1209
    add-int/lit8 v4, v1, -0x1

    invoke-direct {p0, p1, v4, v2}, Landroid/support/v7/widget/LinearLayoutManager;->recycleChildren(Landroid/support/v7/widget/RecyclerView$Recycler;II)V

    goto :goto_6

    .line 1206
    :cond_40
    add-int/lit8 v2, v2, -0x1

    goto :goto_2c
.end method

.method private recycleViewsFromStart(Landroid/support/v7/widget/RecyclerView$Recycler;I)V
    .registers 8
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "dt"    # I

    .prologue
    .line 1149
    if-gez p2, :cond_3

    .line 1176
    :cond_2
    :goto_2
    return-void

    .line 1157
    :cond_3
    move v3, p2

    .line 1158
    .local v3, "limit":I
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildCount()I

    move-result v1

    .line 1159
    .local v1, "childCount":I
    iget-boolean v4, p0, Landroid/support/v7/widget/LinearLayoutManager;->mShouldReverseLayout:Z

    if-eqz v4, :cond_25

    .line 1160
    add-int/lit8 v2, v1, -0x1

    .local v2, "i":I
    :goto_e
    if-ltz v2, :cond_2

    .line 1161
    invoke-virtual {p0, v2}, Landroid/support/v7/widget/LinearLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 1162
    .local v0, "child":Landroid/view/View;
    iget-object v4, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4, v0}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedEnd(Landroid/view/View;)I

    move-result v4

    if-le v4, v3, :cond_22

    .line 1163
    add-int/lit8 v4, v1, -0x1

    invoke-direct {p0, p1, v4, v2}, Landroid/support/v7/widget/LinearLayoutManager;->recycleChildren(Landroid/support/v7/widget/RecyclerView$Recycler;II)V

    goto :goto_2

    .line 1160
    :cond_22
    add-int/lit8 v2, v2, -0x1

    goto :goto_e

    .line 1168
    .end local v0    # "child":Landroid/view/View;
    .end local v2    # "i":I
    :cond_25
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_26
    if-ge v2, v1, :cond_2

    .line 1169
    invoke-virtual {p0, v2}, Landroid/support/v7/widget/LinearLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 1170
    .restart local v0    # "child":Landroid/view/View;
    iget-object v4, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4, v0}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedEnd(Landroid/view/View;)I

    move-result v4

    if-le v4, v3, :cond_39

    .line 1171
    const/4 v4, 0x0

    invoke-direct {p0, p1, v4, v2}, Landroid/support/v7/widget/LinearLayoutManager;->recycleChildren(Landroid/support/v7/widget/RecyclerView$Recycler;II)V

    goto :goto_2

    .line 1168
    :cond_39
    add-int/lit8 v2, v2, 0x1

    goto :goto_26
.end method

.method private resolveShouldLayoutReverse()V
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 321
    iget v1, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientation:I

    if-eq v1, v0, :cond_b

    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->isLayoutRTL()Z

    move-result v1

    if-nez v1, :cond_10

    .line 322
    :cond_b
    iget-boolean v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mReverseLayout:Z

    iput-boolean v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mShouldReverseLayout:Z

    .line 326
    :goto_f
    return-void

    .line 324
    :cond_10
    iget-boolean v1, p0, Landroid/support/v7/widget/LinearLayoutManager;->mReverseLayout:Z

    if-nez v1, :cond_17

    :goto_14
    iput-boolean v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mShouldReverseLayout:Z

    goto :goto_f

    :cond_17
    const/4 v0, 0x0

    goto :goto_14
.end method

.method private updateAnchorFromChildren(Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;)Z
    .registers 10
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p2, "anchorInfo"    # Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 665
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildCount()I

    move-result v5

    if-nez v5, :cond_9

    .line 701
    :cond_8
    :goto_8
    return v3

    .line 668
    :cond_9
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getFocusedChild()Landroid/view/View;

    move-result-object v0

    .line 669
    .local v0, "focused":Landroid/view/View;
    if-eqz v0, :cond_17

    invoke-virtual {p2, v0, p1}, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->assignFromViewIfValid(Landroid/view/View;Landroid/support/v7/widget/RecyclerView$State;)Z

    move-result v5

    if-eqz v5, :cond_17

    move v3, v4

    .line 673
    goto :goto_8

    .line 676
    :cond_17
    iget-boolean v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLastStackFromEnd:Z

    iget-boolean v6, p0, Landroid/support/v7/widget/LinearLayoutManager;->mStackFromEnd:Z

    if-ne v5, v6, :cond_8

    .line 680
    iget-boolean v5, p2, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mLayoutFromEnd:Z

    if-eqz v5, :cond_63

    invoke-direct {p0, p1}, Landroid/support/v7/widget/LinearLayoutManager;->findReferenceChildClosestToEnd(Landroid/support/v7/widget/RecyclerView$State;)Landroid/view/View;

    move-result-object v2

    .line 682
    .local v2, "referenceChild":Landroid/view/View;
    :goto_25
    if-eqz v2, :cond_8

    .line 683
    invoke-virtual {p2, v2}, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->assignFromView(Landroid/view/View;)V

    .line 686
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$State;->isPreLayout()Z

    move-result v5

    if-nez v5, :cond_61

    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->supportsPredictiveItemAnimations()Z

    move-result v5

    if-eqz v5, :cond_61

    .line 688
    iget-object v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v5, v2}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v5

    iget-object v6, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v6}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v6

    if-ge v5, v6, :cond_52

    iget-object v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v5, v2}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedEnd(Landroid/view/View;)I

    move-result v5

    iget-object v6, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v6}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v6

    if-ge v5, v6, :cond_68

    :cond_52
    move v1, v4

    .line 693
    .local v1, "notVisible":Z
    :goto_53
    if-eqz v1, :cond_61

    .line 694
    iget-boolean v3, p2, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mLayoutFromEnd:Z

    if-eqz v3, :cond_6a

    iget-object v3, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v3}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v3

    :goto_5f
    iput v3, p2, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mCoordinate:I

    .end local v1    # "notVisible":Z
    :cond_61
    move v3, v4

    .line 699
    goto :goto_8

    .line 680
    .end local v2    # "referenceChild":Landroid/view/View;
    :cond_63
    invoke-direct {p0, p1}, Landroid/support/v7/widget/LinearLayoutManager;->findReferenceChildClosestToStart(Landroid/support/v7/widget/RecyclerView$State;)Landroid/view/View;

    move-result-object v2

    goto :goto_25

    .restart local v2    # "referenceChild":Landroid/view/View;
    :cond_68
    move v1, v3

    .line 688
    goto :goto_53

    .line 694
    .restart local v1    # "notVisible":Z
    :cond_6a
    iget-object v3, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v3}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v3

    goto :goto_5f
.end method

.method private updateAnchorFromPendingData(Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;)Z
    .registers 14
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p2, "anchorInfo"    # Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;

    .prologue
    const/4 v10, -0x1

    const/high16 v9, -0x80000000

    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 709
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$State;->isPreLayout()Z

    move-result v5

    if-nez v5, :cond_f

    iget v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingScrollPosition:I

    if-ne v5, v10, :cond_11

    :cond_f
    move v6, v7

    .line 786
    :goto_10
    return v6

    .line 713
    :cond_11
    iget v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingScrollPosition:I

    if-ltz v5, :cond_1d

    iget v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingScrollPosition:I

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v8

    if-lt v5, v8, :cond_23

    .line 714
    :cond_1d
    iput v10, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingScrollPosition:I

    .line 715
    iput v9, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingScrollPositionOffset:I

    move v6, v7

    .line 719
    goto :goto_10

    .line 724
    :cond_23
    iget v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingScrollPosition:I

    iput v5, p2, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mPosition:I

    .line 725
    iget-object v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/LinearLayoutManager$SavedState;

    if-eqz v5, :cond_59

    iget-object v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/LinearLayoutManager$SavedState;

    invoke-virtual {v5}, Landroid/support/v7/widget/LinearLayoutManager$SavedState;->hasValidAnchor()Z

    move-result v5

    if-eqz v5, :cond_59

    .line 728
    iget-object v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/LinearLayoutManager$SavedState;

    iget-boolean v5, v5, Landroid/support/v7/widget/LinearLayoutManager$SavedState;->mAnchorLayoutFromEnd:Z

    iput-boolean v5, p2, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mLayoutFromEnd:Z

    .line 729
    iget-boolean v5, p2, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mLayoutFromEnd:Z

    if-eqz v5, :cond_4b

    .line 730
    iget-object v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v5}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v5

    iget-object v7, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/LinearLayoutManager$SavedState;

    iget v7, v7, Landroid/support/v7/widget/LinearLayoutManager$SavedState;->mAnchorOffset:I

    sub-int/2addr v5, v7

    iput v5, p2, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mCoordinate:I

    goto :goto_10

    .line 733
    :cond_4b
    iget-object v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v5}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v5

    iget-object v7, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/LinearLayoutManager$SavedState;

    iget v7, v7, Landroid/support/v7/widget/LinearLayoutManager$SavedState;->mAnchorOffset:I

    add-int/2addr v5, v7

    iput v5, p2, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mCoordinate:I

    goto :goto_10

    .line 739
    :cond_59
    iget v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingScrollPositionOffset:I

    if-ne v5, v9, :cond_ec

    .line 740
    iget v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingScrollPosition:I

    invoke-virtual {p0, v5}, Landroid/support/v7/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;

    move-result-object v0

    .line 741
    .local v0, "child":Landroid/view/View;
    if-eqz v0, :cond_cb

    .line 742
    iget-object v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v5, v0}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedMeasurement(Landroid/view/View;)I

    move-result v1

    .line 743
    .local v1, "childSize":I
    iget-object v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v5}, Landroid/support/v7/widget/OrientationHelper;->getTotalSpace()I

    move-result v5

    if-le v1, v5, :cond_77

    .line 745
    invoke-virtual {p2}, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->assignCoordinateFromPadding()V

    goto :goto_10

    .line 748
    :cond_77
    iget-object v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v5, v0}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v5

    iget-object v8, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v8}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v8

    sub-int v4, v5, v8

    .line 750
    .local v4, "startGap":I
    if-gez v4, :cond_93

    .line 751
    iget-object v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v5}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v5

    iput v5, p2, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mCoordinate:I

    .line 752
    iput-boolean v7, p2, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mLayoutFromEnd:Z

    goto/16 :goto_10

    .line 755
    :cond_93
    iget-object v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v5}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v5

    iget-object v7, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v7, v0}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedEnd(Landroid/view/View;)I

    move-result v7

    sub-int v2, v5, v7

    .line 757
    .local v2, "endGap":I
    if-gez v2, :cond_af

    .line 758
    iget-object v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v5}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v5

    iput v5, p2, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mCoordinate:I

    .line 759
    iput-boolean v6, p2, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mLayoutFromEnd:Z

    goto/16 :goto_10

    .line 762
    :cond_af
    iget-boolean v5, p2, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mLayoutFromEnd:Z

    if-eqz v5, :cond_c4

    iget-object v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v5, v0}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedEnd(Landroid/view/View;)I

    move-result v5

    iget-object v7, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v7}, Landroid/support/v7/widget/OrientationHelper;->getTotalSpaceChange()I

    move-result v7

    add-int/2addr v5, v7

    :goto_c0
    iput v5, p2, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mCoordinate:I

    goto/16 :goto_10

    :cond_c4
    iget-object v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v5, v0}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v5

    goto :goto_c0

    .line 767
    .end local v1    # "childSize":I
    .end local v2    # "endGap":I
    .end local v4    # "startGap":I
    :cond_cb
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildCount()I

    move-result v5

    if-lez v5, :cond_e5

    .line 769
    invoke-virtual {p0, v7}, Landroid/support/v7/widget/LinearLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    invoke-virtual {p0, v5}, Landroid/support/v7/widget/LinearLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v3

    .line 770
    .local v3, "pos":I
    iget v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingScrollPosition:I

    if-ge v5, v3, :cond_ea

    move v5, v6

    :goto_de
    iget-boolean v8, p0, Landroid/support/v7/widget/LinearLayoutManager;->mShouldReverseLayout:Z

    if-ne v5, v8, :cond_e3

    move v7, v6

    :cond_e3
    iput-boolean v7, p2, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mLayoutFromEnd:Z

    .line 773
    .end local v3    # "pos":I
    :cond_e5
    invoke-virtual {p2}, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->assignCoordinateFromPadding()V

    goto/16 :goto_10

    .restart local v3    # "pos":I
    :cond_ea
    move v5, v7

    .line 770
    goto :goto_de

    .line 778
    .end local v0    # "child":Landroid/view/View;
    .end local v3    # "pos":I
    :cond_ec
    iget-boolean v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mShouldReverseLayout:Z

    iput-boolean v5, p2, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mLayoutFromEnd:Z

    .line 779
    iget-boolean v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mShouldReverseLayout:Z

    if-eqz v5, :cond_101

    .line 780
    iget-object v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v5}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v5

    iget v7, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingScrollPositionOffset:I

    sub-int/2addr v5, v7

    iput v5, p2, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mCoordinate:I

    goto/16 :goto_10

    .line 783
    :cond_101
    iget-object v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v5}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v5

    iget v7, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingScrollPositionOffset:I

    add-int/2addr v5, v7

    iput v5, p2, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mCoordinate:I

    goto/16 :goto_10
.end method

.method private updateAnchorInfoForLayout(Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;)V
    .registers 4
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p2, "anchorInfo"    # Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;

    .prologue
    .line 638
    invoke-direct {p0, p1, p2}, Landroid/support/v7/widget/LinearLayoutManager;->updateAnchorFromPendingData(Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 656
    :cond_6
    :goto_6
    return-void

    .line 645
    :cond_7
    invoke-direct {p0, p1, p2}, Landroid/support/v7/widget/LinearLayoutManager;->updateAnchorFromChildren(Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;)Z

    move-result v0

    if-nez v0, :cond_6

    .line 654
    invoke-virtual {p2}, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->assignCoordinateFromPadding()V

    .line 655
    iget-boolean v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mStackFromEnd:Z

    if-eqz v0, :cond_1d

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_1a
    iput v0, p2, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mPosition:I

    goto :goto_6

    :cond_1d
    const/4 v0, 0x0

    goto :goto_1a
.end method

.method private updateLayoutState(IIZLandroid/support/v7/widget/RecyclerView$State;)V
    .registers 12
    .param p1, "layoutDirection"    # I
    .param p2, "requiredSpace"    # I
    .param p3, "canUseExistingSpace"    # Z
    .param p4, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    const/4 v2, -0x1

    const/4 v3, 0x1

    .line 1050
    iget-object v4, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    invoke-virtual {p0, p4}, Landroid/support/v7/widget/LinearLayoutManager;->getExtraLayoutSpace(Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v5

    iput v5, v4, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mExtra:I

    .line 1051
    iget-object v4, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iput p1, v4, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mLayoutDirection:I

    .line 1053
    if-ne p1, v3, :cond_62

    .line 1054
    iget-object v4, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget v5, v4, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mExtra:I

    iget-object v6, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v6}, Landroid/support/v7/widget/OrientationHelper;->getEndPadding()I

    move-result v6

    add-int/2addr v5, v6

    iput v5, v4, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mExtra:I

    .line 1056
    invoke-direct {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildClosestToEnd()Landroid/view/View;

    move-result-object v0

    .line 1058
    .local v0, "child":Landroid/view/View;
    iget-object v4, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget-boolean v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mShouldReverseLayout:Z

    if-eqz v5, :cond_60

    :goto_27
    iput v2, v4, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mItemDirection:I

    .line 1060
    iget-object v2, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/LinearLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v3

    iget-object v4, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget v4, v4, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mItemDirection:I

    add-int/2addr v3, v4

    iput v3, v2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mCurrentPosition:I

    .line 1061
    iget-object v2, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget-object v3, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v3, v0}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedEnd(Landroid/view/View;)I

    move-result v3

    iput v3, v2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mOffset:I

    .line 1063
    iget-object v2, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v2, v0}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedEnd(Landroid/view/View;)I

    move-result v2

    iget-object v3, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v3}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v3

    sub-int v1, v2, v3

    .line 1076
    .local v1, "fastScrollSpace":I
    :goto_4e
    iget-object v2, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iput p2, v2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mAvailable:I

    .line 1077
    if-eqz p3, :cond_5b

    .line 1078
    iget-object v2, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget v3, v2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mAvailable:I

    sub-int/2addr v3, v1

    iput v3, v2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mAvailable:I

    .line 1080
    :cond_5b
    iget-object v2, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iput v1, v2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mScrollingOffset:I

    .line 1081
    return-void

    .end local v1    # "fastScrollSpace":I
    :cond_60
    move v2, v3

    .line 1058
    goto :goto_27

    .line 1067
    .end local v0    # "child":Landroid/view/View;
    :cond_62
    invoke-direct {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildClosestToStart()Landroid/view/View;

    move-result-object v0

    .line 1068
    .restart local v0    # "child":Landroid/view/View;
    iget-object v4, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget v5, v4, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mExtra:I

    iget-object v6, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v6}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v6

    add-int/2addr v5, v6

    iput v5, v4, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mExtra:I

    .line 1069
    iget-object v4, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget-boolean v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mShouldReverseLayout:Z

    if-eqz v5, :cond_a2

    :goto_79
    iput v3, v4, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mItemDirection:I

    .line 1071
    iget-object v2, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/LinearLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v3

    iget-object v4, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget v4, v4, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mItemDirection:I

    add-int/2addr v3, v4

    iput v3, v2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mCurrentPosition:I

    .line 1072
    iget-object v2, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget-object v3, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v3, v0}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v3

    iput v3, v2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mOffset:I

    .line 1073
    iget-object v2, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v2, v0}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v2

    neg-int v2, v2

    iget-object v3, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v3}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v3

    add-int v1, v2, v3

    .restart local v1    # "fastScrollSpace":I
    goto :goto_4e

    .end local v1    # "fastScrollSpace":I
    :cond_a2
    move v3, v2

    .line 1069
    goto :goto_79
.end method

.method private updateLayoutStateToFillEnd(II)V
    .registers 6
    .param p1, "itemPosition"    # I
    .param p2, "offset"    # I

    .prologue
    const/4 v1, 0x1

    .line 844
    iget-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget-object v2, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v2}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v2

    sub-int/2addr v2, p2

    iput v2, v0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mAvailable:I

    .line 845
    iget-object v2, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget-boolean v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mShouldReverseLayout:Z

    if-eqz v0, :cond_28

    const/4 v0, -0x1

    :goto_13
    iput v0, v2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mItemDirection:I

    .line 847
    iget-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iput p1, v0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mCurrentPosition:I

    .line 848
    iget-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iput v1, v0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mLayoutDirection:I

    .line 849
    iget-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iput p2, v0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mOffset:I

    .line 850
    iget-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    const/high16 v1, -0x80000000

    iput v1, v0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mScrollingOffset:I

    .line 851
    return-void

    :cond_28
    move v0, v1

    .line 845
    goto :goto_13
.end method

.method private updateLayoutStateToFillEnd(Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;)V
    .registers 4
    .param p1, "anchorInfo"    # Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;

    .prologue
    .line 840
    iget v0, p1, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mPosition:I

    iget v1, p1, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mCoordinate:I

    invoke-direct {p0, v0, v1}, Landroid/support/v7/widget/LinearLayoutManager;->updateLayoutStateToFillEnd(II)V

    .line 841
    return-void
.end method

.method private updateLayoutStateToFillStart(II)V
    .registers 6
    .param p1, "itemPosition"    # I
    .param p2, "offset"    # I

    .prologue
    const/4 v1, -0x1

    .line 858
    iget-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget-object v2, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v2}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v2

    sub-int v2, p2, v2

    iput v2, v0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mAvailable:I

    .line 859
    iget-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iput p1, v0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mCurrentPosition:I

    .line 860
    iget-object v2, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget-boolean v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mShouldReverseLayout:Z

    if-eqz v0, :cond_29

    const/4 v0, 0x1

    :goto_18
    iput v0, v2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mItemDirection:I

    .line 862
    iget-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iput v1, v0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mLayoutDirection:I

    .line 863
    iget-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iput p2, v0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mOffset:I

    .line 864
    iget-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    const/high16 v1, -0x80000000

    iput v1, v0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mScrollingOffset:I

    .line 866
    return-void

    :cond_29
    move v0, v1

    .line 860
    goto :goto_18
.end method

.method private updateLayoutStateToFillStart(Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;)V
    .registers 4
    .param p1, "anchorInfo"    # Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;

    .prologue
    .line 854
    iget v0, p1, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mPosition:I

    iget v1, p1, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mCoordinate:I

    invoke-direct {p0, v0, v1}, Landroid/support/v7/widget/LinearLayoutManager;->updateLayoutStateToFillStart(II)V

    .line 855
    return-void
.end method


# virtual methods
.method public assertNotInLayoutOrScroll(Ljava/lang/String;)V
    .registers 3
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 1110
    iget-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/LinearLayoutManager$SavedState;

    if-nez v0, :cond_7

    .line 1111
    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->assertNotInLayoutOrScroll(Ljava/lang/String;)V

    .line 1113
    :cond_7
    return-void
.end method

.method public canScrollHorizontally()Z
    .registers 2

    .prologue
    .line 257
    iget v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientation:I

    if-nez v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public canScrollVertically()Z
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 265
    iget v1, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientation:I

    if-ne v1, v0, :cond_6

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public computeHorizontalScrollExtent(Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 3
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 971
    invoke-direct {p0, p1}, Landroid/support/v7/widget/LinearLayoutManager;->computeScrollExtent(Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v0

    return v0
.end method

.method public computeHorizontalScrollOffset(Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 3
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 961
    invoke-direct {p0, p1}, Landroid/support/v7/widget/LinearLayoutManager;->computeScrollOffset(Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v0

    return v0
.end method

.method public computeHorizontalScrollRange(Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 3
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 981
    invoke-direct {p0, p1}, Landroid/support/v7/widget/LinearLayoutManager;->computeScrollRange(Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v0

    return v0
.end method

.method public computeScrollVectorForPosition(I)Landroid/graphics/PointF;
    .registers 8
    .param p1, "targetPosition"    # I

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    const/4 v5, 0x0

    .line 414
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildCount()I

    move-result v4

    if-nez v4, :cond_b

    .line 415
    const/4 v2, 0x0

    .line 422
    :goto_a
    return-object v2

    .line 417
    :cond_b
    invoke-virtual {p0, v2}, Landroid/support/v7/widget/LinearLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {p0, v4}, Landroid/support/v7/widget/LinearLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v1

    .line 418
    .local v1, "firstChildPos":I
    if-ge p1, v1, :cond_16

    move v2, v3

    :cond_16
    iget-boolean v4, p0, Landroid/support/v7/widget/LinearLayoutManager;->mShouldReverseLayout:Z

    if-eq v2, v4, :cond_26

    const/4 v0, -0x1

    .line 419
    .local v0, "direction":I
    :goto_1b
    iget v2, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientation:I

    if-nez v2, :cond_28

    .line 420
    new-instance v2, Landroid/graphics/PointF;

    int-to-float v3, v0

    invoke-direct {v2, v3, v5}, Landroid/graphics/PointF;-><init>(FF)V

    goto :goto_a

    .end local v0    # "direction":I
    :cond_26
    move v0, v3

    .line 418
    goto :goto_1b

    .line 422
    .restart local v0    # "direction":I
    :cond_28
    new-instance v2, Landroid/graphics/PointF;

    int-to-float v3, v0

    invoke-direct {v2, v5, v3}, Landroid/graphics/PointF;-><init>(FF)V

    goto :goto_a
.end method

.method public computeVerticalScrollExtent(Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 3
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 976
    invoke-direct {p0, p1}, Landroid/support/v7/widget/LinearLayoutManager;->computeScrollExtent(Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v0

    return v0
.end method

.method public computeVerticalScrollOffset(Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 3
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 966
    invoke-direct {p0, p1}, Landroid/support/v7/widget/LinearLayoutManager;->computeScrollOffset(Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v0

    return v0
.end method

.method public computeVerticalScrollRange(Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 3
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 986
    invoke-direct {p0, p1}, Landroid/support/v7/widget/LinearLayoutManager;->computeScrollRange(Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v0

    return v0
.end method

.method ensureLayoutState()V
    .registers 2

    .prologue
    .line 873
    iget-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    if-nez v0, :cond_b

    .line 874
    new-instance v0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    invoke-direct {v0}, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    .line 876
    :cond_b
    iget-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    if-nez v0, :cond_17

    .line 877
    iget v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientation:I

    invoke-static {p0, v0}, Landroid/support/v7/widget/OrientationHelper;->createOrientationHelper(Landroid/support/v7/widget/RecyclerView$LayoutManager;I)Landroid/support/v7/widget/OrientationHelper;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    .line 879
    :cond_17
    return-void
.end method

.method fill(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/LinearLayoutManager$LayoutState;Landroid/support/v7/widget/RecyclerView$State;Z)I
    .registers 12
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "layoutState"    # Landroid/support/v7/widget/LinearLayoutManager$LayoutState;
    .param p3, "state"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p4, "stopOnFocusable"    # Z

    .prologue
    const/high16 v6, -0x80000000

    .line 1253
    iget v2, p2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mAvailable:I

    .line 1254
    .local v2, "start":I
    iget v3, p2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mScrollingOffset:I

    if-eq v3, v6, :cond_16

    .line 1256
    iget v3, p2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mAvailable:I

    if-gez v3, :cond_13

    .line 1257
    iget v3, p2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mScrollingOffset:I

    iget v4, p2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mAvailable:I

    add-int/2addr v3, v4

    iput v3, p2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mScrollingOffset:I

    .line 1259
    :cond_13
    invoke-direct {p0, p1, p2}, Landroid/support/v7/widget/LinearLayoutManager;->recycleByLayoutState(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/LinearLayoutManager$LayoutState;)V

    .line 1261
    :cond_16
    iget v3, p2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mAvailable:I

    iget v4, p2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mExtra:I

    add-int v1, v3, v4

    .line 1262
    .local v1, "remainingSpace":I
    new-instance v0, Landroid/support/v7/widget/LinearLayoutManager$LayoutChunkResult;

    invoke-direct {v0}, Landroid/support/v7/widget/LinearLayoutManager$LayoutChunkResult;-><init>()V

    .line 1263
    .local v0, "layoutChunkResult":Landroid/support/v7/widget/LinearLayoutManager$LayoutChunkResult;
    :cond_21
    if-lez v1, :cond_33

    invoke-virtual {p2, p3}, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->hasMore(Landroid/support/v7/widget/RecyclerView$State;)Z

    move-result v3

    if-eqz v3, :cond_33

    .line 1264
    invoke-virtual {v0}, Landroid/support/v7/widget/LinearLayoutManager$LayoutChunkResult;->resetInternal()V

    .line 1265
    invoke-virtual {p0, p1, p3, p2, v0}, Landroid/support/v7/widget/LinearLayoutManager;->layoutChunk(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/LinearLayoutManager$LayoutState;Landroid/support/v7/widget/LinearLayoutManager$LayoutChunkResult;)V

    .line 1266
    iget-boolean v3, v0, Landroid/support/v7/widget/LinearLayoutManager$LayoutChunkResult;->mFinished:Z

    if-eqz v3, :cond_38

    .line 1297
    :cond_33
    :goto_33
    iget v3, p2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mAvailable:I

    sub-int v3, v2, v3

    return v3

    .line 1269
    :cond_38
    iget v3, p2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mOffset:I

    iget v4, v0, Landroid/support/v7/widget/LinearLayoutManager$LayoutChunkResult;->mConsumed:I

    iget v5, p2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mLayoutDirection:I

    mul-int/2addr v4, v5

    add-int/2addr v3, v4

    iput v3, p2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mOffset:I

    .line 1276
    iget-boolean v3, v0, Landroid/support/v7/widget/LinearLayoutManager$LayoutChunkResult;->mIgnoreConsumed:Z

    if-eqz v3, :cond_52

    iget-object v3, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget-object v3, v3, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mScrapList:Ljava/util/List;

    if-nez v3, :cond_52

    invoke-virtual {p3}, Landroid/support/v7/widget/RecyclerView$State;->isPreLayout()Z

    move-result v3

    if-nez v3, :cond_5c

    .line 1278
    :cond_52
    iget v3, p2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mAvailable:I

    iget v4, v0, Landroid/support/v7/widget/LinearLayoutManager$LayoutChunkResult;->mConsumed:I

    sub-int/2addr v3, v4

    iput v3, p2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mAvailable:I

    .line 1280
    iget v3, v0, Landroid/support/v7/widget/LinearLayoutManager$LayoutChunkResult;->mConsumed:I

    sub-int/2addr v1, v3

    .line 1283
    :cond_5c
    iget v3, p2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mScrollingOffset:I

    if-eq v3, v6, :cond_75

    .line 1284
    iget v3, p2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mScrollingOffset:I

    iget v4, v0, Landroid/support/v7/widget/LinearLayoutManager$LayoutChunkResult;->mConsumed:I

    add-int/2addr v3, v4

    iput v3, p2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mScrollingOffset:I

    .line 1285
    iget v3, p2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mAvailable:I

    if-gez v3, :cond_72

    .line 1286
    iget v3, p2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mScrollingOffset:I

    iget v4, p2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mAvailable:I

    add-int/2addr v3, v4

    iput v3, p2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mScrollingOffset:I

    .line 1288
    :cond_72
    invoke-direct {p0, p1, p2}, Landroid/support/v7/widget/LinearLayoutManager;->recycleByLayoutState(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/LinearLayoutManager$LayoutState;)V

    .line 1290
    :cond_75
    if-eqz p4, :cond_21

    iget-boolean v3, v0, Landroid/support/v7/widget/LinearLayoutManager$LayoutChunkResult;->mFocusable:Z

    if-eqz v3, :cond_21

    goto :goto_33
.end method

.method public findFirstCompletelyVisibleItemPosition()I
    .registers 5

    .prologue
    .line 1532
    const/4 v1, 0x0

    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildCount()I

    move-result v2

    const/4 v3, 0x1

    invoke-virtual {p0, v1, v2, v3}, Landroid/support/v7/widget/LinearLayoutManager;->findOneVisibleChild(IIZ)Landroid/view/View;

    move-result-object v0

    .line 1533
    .local v0, "child":Landroid/view/View;
    if-nez v0, :cond_e

    const/4 v1, -0x1

    :goto_d
    return v1

    :cond_e
    invoke-virtual {p0, v0}, Landroid/support/v7/widget/LinearLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v1

    goto :goto_d
.end method

.method public findFirstVisibleItemPosition()I
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 1516
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildCount()I

    move-result v1

    invoke-virtual {p0, v2, v1, v2}, Landroid/support/v7/widget/LinearLayoutManager;->findOneVisibleChild(IIZ)Landroid/view/View;

    move-result-object v0

    .line 1517
    .local v0, "child":Landroid/view/View;
    if-nez v0, :cond_d

    const/4 v1, -0x1

    :goto_c
    return v1

    :cond_d
    invoke-virtual {p0, v0}, Landroid/support/v7/widget/LinearLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v1

    goto :goto_c
.end method

.method public findLastCompletelyVisibleItemPosition()I
    .registers 5

    .prologue
    const/4 v1, -0x1

    .line 1570
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    const/4 v3, 0x1

    invoke-virtual {p0, v2, v1, v3}, Landroid/support/v7/widget/LinearLayoutManager;->findOneVisibleChild(IIZ)Landroid/view/View;

    move-result-object v0

    .line 1571
    .local v0, "child":Landroid/view/View;
    if-nez v0, :cond_f

    :goto_e
    return v1

    :cond_f
    invoke-virtual {p0, v0}, Landroid/support/v7/widget/LinearLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v1

    goto :goto_e
.end method

.method public findLastVisibleItemPosition()I
    .registers 5

    .prologue
    const/4 v1, -0x1

    .line 1554
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v1, v3}, Landroid/support/v7/widget/LinearLayoutManager;->findOneVisibleChild(IIZ)Landroid/view/View;

    move-result-object v0

    .line 1555
    .local v0, "child":Landroid/view/View;
    if-nez v0, :cond_f

    :goto_e
    return v1

    :cond_f
    invoke-virtual {p0, v0}, Landroid/support/v7/widget/LinearLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v1

    goto :goto_e
.end method

.method findOneVisibleChild(IIZ)Landroid/view/View;
    .registers 12
    .param p1, "fromIndex"    # I
    .param p2, "toIndex"    # I
    .param p3, "completelyVisible"    # Z

    .prologue
    .line 1575
    iget-object v7, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v7}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v6

    .line 1576
    .local v6, "start":I
    iget-object v7, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v7}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v3

    .line 1577
    .local v3, "end":I
    if-le p2, p1, :cond_2d

    const/4 v5, 0x1

    .line 1578
    .local v5, "next":I
    :goto_f
    move v4, p1

    .local v4, "i":I
    :goto_10
    if-eq v4, p2, :cond_31

    .line 1579
    invoke-virtual {p0, v4}, Landroid/support/v7/widget/LinearLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 1580
    .local v0, "child":Landroid/view/View;
    iget-object v7, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v7, v0}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v2

    .line 1581
    .local v2, "childStart":I
    iget-object v7, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v7, v0}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedEnd(Landroid/view/View;)I

    move-result v1

    .line 1582
    .local v1, "childEnd":I
    if-ge v2, v3, :cond_2f

    if-le v1, v6, :cond_2f

    .line 1583
    if-eqz p3, :cond_2c

    .line 1584
    if-lt v2, v6, :cond_2f

    if-gt v1, v3, :cond_2f

    .line 1592
    .end local v0    # "child":Landroid/view/View;
    .end local v1    # "childEnd":I
    .end local v2    # "childStart":I
    :cond_2c
    :goto_2c
    return-object v0

    .line 1577
    .end local v4    # "i":I
    .end local v5    # "next":I
    :cond_2d
    const/4 v5, -0x1

    goto :goto_f

    .line 1578
    .restart local v0    # "child":Landroid/view/View;
    .restart local v1    # "childEnd":I
    .restart local v2    # "childStart":I
    .restart local v4    # "i":I
    .restart local v5    # "next":I
    :cond_2f
    add-int/2addr v4, v5

    goto :goto_10

    .line 1592
    .end local v0    # "child":Landroid/view/View;
    .end local v1    # "childEnd":I
    .end local v2    # "childStart":I
    :cond_31
    const/4 v0, 0x0

    goto :goto_2c
.end method

.method public findViewByPosition(I)Landroid/view/View;
    .registers 7
    .param p1, "position"    # I

    .prologue
    const/4 v3, 0x0

    .line 366
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildCount()I

    move-result v0

    .line 367
    .local v0, "childCount":I
    if-nez v0, :cond_8

    .line 375
    :cond_7
    :goto_7
    return-object v3

    .line 370
    :cond_8
    const/4 v4, 0x0

    invoke-virtual {p0, v4}, Landroid/support/v7/widget/LinearLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {p0, v4}, Landroid/support/v7/widget/LinearLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v1

    .line 371
    .local v1, "firstChild":I
    sub-int v2, p1, v1

    .line 372
    .local v2, "viewPosition":I
    if-ltz v2, :cond_7

    if-ge v2, v0, :cond_7

    .line 373
    invoke-virtual {p0, v2}, Landroid/support/v7/widget/LinearLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    goto :goto_7
.end method

.method public generateDefaultLayoutParams()Landroid/support/v7/widget/RecyclerView$LayoutParams;
    .registers 3

    .prologue
    const/4 v1, -0x2

    .line 161
    new-instance v0, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    invoke-direct {v0, v1, v1}, Landroid/support/v7/widget/RecyclerView$LayoutParams;-><init>(II)V

    return-object v0
.end method

.method protected getExtraLayoutSpace(Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 3
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 391
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$State;->hasTargetScrollPosition()Z

    move-result v0

    if-eqz v0, :cond_d

    .line 392
    iget-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/OrientationHelper;->getTotalSpace()I

    move-result v0

    .line 394
    :goto_c
    return v0

    :cond_d
    const/4 v0, 0x0

    goto :goto_c
.end method

.method public getOrientation()I
    .registers 2

    .prologue
    .line 292
    iget v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientation:I

    return v0
.end method

.method public getRecycleChildrenOnDetach()Z
    .registers 2

    .prologue
    .line 173
    iget-boolean v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mRecycleChildrenOnDetach:Z

    return v0
.end method

.method public getReverseLayout()Z
    .registers 2

    .prologue
    .line 335
    iget-boolean v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mReverseLayout:Z

    return v0
.end method

.method public getStackFromEnd()Z
    .registers 2

    .prologue
    .line 281
    iget-boolean v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mStackFromEnd:Z

    return v0
.end method

.method protected isLayoutRTL()Z
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 869
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getLayoutDirection()I

    move-result v1

    if-ne v1, v0, :cond_8

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isSmoothScrollbarEnabled()Z
    .registers 2

    .prologue
    .line 1045
    iget-boolean v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mSmoothScrollbarEnabled:Z

    return v0
.end method

.method layoutChunk(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/LinearLayoutManager$LayoutState;Landroid/support/v7/widget/LinearLayoutManager$LayoutChunkResult;)V
    .registers 16
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p3, "layoutState"    # Landroid/support/v7/widget/LinearLayoutManager$LayoutState;
    .param p4, "result"    # Landroid/support/v7/widget/LinearLayoutManager$LayoutChunkResult;

    .prologue
    .line 1302
    invoke-virtual {p3, p1}, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->next(Landroid/support/v7/widget/RecyclerView$Recycler;)Landroid/view/View;

    move-result-object v1

    .line 1303
    .local v1, "view":Landroid/view/View;
    if-nez v1, :cond_a

    .line 1309
    const/4 v0, 0x1

    iput-boolean v0, p4, Landroid/support/v7/widget/LinearLayoutManager$LayoutChunkResult;->mFinished:Z

    .line 1372
    :goto_9
    return-void

    .line 1312
    :cond_a
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v8

    check-cast v8, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    .line 1313
    .local v8, "params":Landroid/support/v7/widget/RecyclerView$LayoutParams;
    iget-object v0, p3, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mScrapList:Ljava/util/List;

    if-nez v0, :cond_89

    .line 1314
    iget-boolean v2, p0, Landroid/support/v7/widget/LinearLayoutManager;->mShouldReverseLayout:Z

    iget v0, p3, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mLayoutDirection:I

    const/4 v3, -0x1

    if-ne v0, v3, :cond_82

    const/4 v0, 0x1

    :goto_1c
    if-ne v2, v0, :cond_84

    .line 1316
    invoke-virtual {p0, v1}, Landroid/support/v7/widget/LinearLayoutManager;->addView(Landroid/view/View;)V

    .line 1328
    :goto_21
    const/4 v0, 0x0

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v0, v2}, Landroid/support/v7/widget/LinearLayoutManager;->measureChildWithMargins(Landroid/view/View;II)V

    .line 1329
    iget-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedMeasurement(Landroid/view/View;)I

    move-result v0

    iput v0, p4, Landroid/support/v7/widget/LinearLayoutManager$LayoutChunkResult;->mConsumed:I

    .line 1331
    iget v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientation:I

    const/4 v2, 0x1

    if-ne v0, v2, :cond_b4

    .line 1332
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->isLayoutRTL()Z

    move-result v0

    if-eqz v0, :cond_9e

    .line 1333
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getPaddingRight()I

    move-result v2

    sub-int v9, v0, v2

    .line 1334
    .local v9, "right":I
    iget-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedMeasurementInOther(Landroid/view/View;)I

    move-result v0

    sub-int v7, v9, v0

    .line 1339
    .local v7, "left":I
    :goto_4b
    iget v0, p3, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mLayoutDirection:I

    const/4 v2, -0x1

    if-ne v0, v2, :cond_ab

    .line 1340
    iget v6, p3, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mOffset:I

    .line 1341
    .local v6, "bottom":I
    iget v0, p3, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mOffset:I

    iget v2, p4, Landroid/support/v7/widget/LinearLayoutManager$LayoutChunkResult;->mConsumed:I

    sub-int v10, v0, v2

    .line 1360
    .local v10, "top":I
    :goto_58
    iget v0, v8, Landroid/support/v7/widget/RecyclerView$LayoutParams;->leftMargin:I

    add-int v2, v7, v0

    iget v0, v8, Landroid/support/v7/widget/RecyclerView$LayoutParams;->topMargin:I

    add-int v3, v10, v0

    iget v0, v8, Landroid/support/v7/widget/RecyclerView$LayoutParams;->rightMargin:I

    sub-int v4, v9, v0

    iget v0, v8, Landroid/support/v7/widget/RecyclerView$LayoutParams;->bottomMargin:I

    sub-int v5, v6, v0

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Landroid/support/v7/widget/LinearLayoutManager;->layoutDecorated(Landroid/view/View;IIII)V

    .line 1368
    invoke-virtual {v8}, Landroid/support/v7/widget/RecyclerView$LayoutParams;->isItemRemoved()Z

    move-result v0

    if-nez v0, :cond_78

    invoke-virtual {v8}, Landroid/support/v7/widget/RecyclerView$LayoutParams;->isItemChanged()Z

    move-result v0

    if-eqz v0, :cond_7b

    .line 1369
    :cond_78
    const/4 v0, 0x1

    iput-boolean v0, p4, Landroid/support/v7/widget/LinearLayoutManager$LayoutChunkResult;->mIgnoreConsumed:Z

    .line 1371
    :cond_7b
    invoke-virtual {v1}, Landroid/view/View;->isFocusable()Z

    move-result v0

    iput-boolean v0, p4, Landroid/support/v7/widget/LinearLayoutManager$LayoutChunkResult;->mFocusable:Z

    goto :goto_9

    .line 1314
    .end local v6    # "bottom":I
    .end local v7    # "left":I
    .end local v9    # "right":I
    .end local v10    # "top":I
    :cond_82
    const/4 v0, 0x0

    goto :goto_1c

    .line 1318
    :cond_84
    const/4 v0, 0x0

    invoke-virtual {p0, v1, v0}, Landroid/support/v7/widget/LinearLayoutManager;->addView(Landroid/view/View;I)V

    goto :goto_21

    .line 1321
    :cond_89
    iget-boolean v2, p0, Landroid/support/v7/widget/LinearLayoutManager;->mShouldReverseLayout:Z

    iget v0, p3, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mLayoutDirection:I

    const/4 v3, -0x1

    if-ne v0, v3, :cond_97

    const/4 v0, 0x1

    :goto_91
    if-ne v2, v0, :cond_99

    .line 1323
    invoke-virtual {p0, v1}, Landroid/support/v7/widget/LinearLayoutManager;->addDisappearingView(Landroid/view/View;)V

    goto :goto_21

    .line 1321
    :cond_97
    const/4 v0, 0x0

    goto :goto_91

    .line 1325
    :cond_99
    const/4 v0, 0x0

    invoke-virtual {p0, v1, v0}, Landroid/support/v7/widget/LinearLayoutManager;->addDisappearingView(Landroid/view/View;I)V

    goto :goto_21

    .line 1336
    :cond_9e
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getPaddingLeft()I

    move-result v7

    .line 1337
    .restart local v7    # "left":I
    iget-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedMeasurementInOther(Landroid/view/View;)I

    move-result v0

    add-int v9, v7, v0

    .restart local v9    # "right":I
    goto :goto_4b

    .line 1343
    :cond_ab
    iget v10, p3, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mOffset:I

    .line 1344
    .restart local v10    # "top":I
    iget v0, p3, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mOffset:I

    iget v2, p4, Landroid/support/v7/widget/LinearLayoutManager$LayoutChunkResult;->mConsumed:I

    add-int v6, v0, v2

    .restart local v6    # "bottom":I
    goto :goto_58

    .line 1347
    .end local v6    # "bottom":I
    .end local v7    # "left":I
    .end local v9    # "right":I
    .end local v10    # "top":I
    :cond_b4
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getPaddingTop()I

    move-result v10

    .line 1348
    .restart local v10    # "top":I
    iget-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedMeasurementInOther(Landroid/view/View;)I

    move-result v0

    add-int v6, v10, v0

    .line 1350
    .restart local v6    # "bottom":I
    iget v0, p3, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mLayoutDirection:I

    const/4 v2, -0x1

    if-ne v0, v2, :cond_ce

    .line 1351
    iget v9, p3, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mOffset:I

    .line 1352
    .restart local v9    # "right":I
    iget v0, p3, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mOffset:I

    iget v2, p4, Landroid/support/v7/widget/LinearLayoutManager$LayoutChunkResult;->mConsumed:I

    sub-int v7, v0, v2

    .restart local v7    # "left":I
    goto :goto_58

    .line 1354
    .end local v7    # "left":I
    .end local v9    # "right":I
    :cond_ce
    iget v7, p3, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mOffset:I

    .line 1355
    .restart local v7    # "left":I
    iget v0, p3, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mOffset:I

    iget v2, p4, Landroid/support/v7/widget/LinearLayoutManager$LayoutChunkResult;->mConsumed:I

    add-int v9, v0, v2

    .restart local v9    # "right":I
    goto :goto_58
.end method

.method onAnchorReady(Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;)V
    .registers 3
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p2, "anchorInfo"    # Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;

    .prologue
    .line 579
    return-void
.end method

.method public onDetachedFromWindow(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$Recycler;)V
    .registers 4
    .param p1, "view"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;

    .prologue
    .line 195
    invoke-super {p0, p1, p2}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->onDetachedFromWindow(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$Recycler;)V

    .line 196
    iget-boolean v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mRecycleChildrenOnDetach:Z

    if-eqz v0, :cond_d

    .line 197
    invoke-virtual {p0, p2}, Landroid/support/v7/widget/LinearLayoutManager;->removeAndRecycleAllViews(Landroid/support/v7/widget/RecyclerView$Recycler;)V

    .line 198
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView$Recycler;->clear()V

    .line 200
    :cond_d
    return-void
.end method

.method public onFocusSearchFailed(Landroid/view/View;ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)Landroid/view/View;
    .registers 15
    .param p1, "focused"    # Landroid/view/View;
    .param p2, "focusDirection"    # I
    .param p3, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p4, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    const/4 v9, 0x0

    const/4 v8, -0x1

    const/high16 v7, -0x80000000

    const/4 v4, 0x0

    .line 1598
    invoke-direct {p0}, Landroid/support/v7/widget/LinearLayoutManager;->resolveShouldLayoutReverse()V

    .line 1599
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildCount()I

    move-result v5

    if-nez v5, :cond_10

    move-object v2, v4

    .line 1635
    :cond_f
    :goto_f
    return-object v2

    .line 1603
    :cond_10
    invoke-direct {p0, p2}, Landroid/support/v7/widget/LinearLayoutManager;->convertFocusDirectionToLayoutDirection(I)I

    move-result v0

    .line 1604
    .local v0, "layoutDir":I
    if-ne v0, v7, :cond_18

    move-object v2, v4

    .line 1605
    goto :goto_f

    .line 1608
    :cond_18
    if-ne v0, v8, :cond_22

    .line 1609
    invoke-direct {p0, p4}, Landroid/support/v7/widget/LinearLayoutManager;->findReferenceChildClosestToStart(Landroid/support/v7/widget/RecyclerView$State;)Landroid/view/View;

    move-result-object v3

    .line 1613
    .local v3, "referenceChild":Landroid/view/View;
    :goto_1e
    if-nez v3, :cond_27

    move-object v2, v4

    .line 1618
    goto :goto_f

    .line 1611
    .end local v3    # "referenceChild":Landroid/view/View;
    :cond_22
    invoke-direct {p0, p4}, Landroid/support/v7/widget/LinearLayoutManager;->findReferenceChildClosestToEnd(Landroid/support/v7/widget/RecyclerView$State;)Landroid/view/View;

    move-result-object v3

    .restart local v3    # "referenceChild":Landroid/view/View;
    goto :goto_1e

    .line 1620
    :cond_27
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->ensureLayoutState()V

    .line 1621
    const v5, 0x3ea8f5c3    # 0.33f

    iget-object v6, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v6}, Landroid/support/v7/widget/OrientationHelper;->getTotalSpace()I

    move-result v6

    int-to-float v6, v6

    mul-float/2addr v5, v6

    float-to-int v1, v5

    .line 1622
    .local v1, "maxScroll":I
    invoke-direct {p0, v0, v1, v9, p4}, Landroid/support/v7/widget/LinearLayoutManager;->updateLayoutState(IIZLandroid/support/v7/widget/RecyclerView$State;)V

    .line 1623
    iget-object v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iput v7, v5, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mScrollingOffset:I

    .line 1624
    iget-object v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iput-boolean v9, v5, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mRecycle:Z

    .line 1625
    iget-object v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    const/4 v6, 0x1

    invoke-virtual {p0, p3, v5, p4, v6}, Landroid/support/v7/widget/LinearLayoutManager;->fill(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/LinearLayoutManager$LayoutState;Landroid/support/v7/widget/RecyclerView$State;Z)I

    .line 1627
    if-ne v0, v8, :cond_57

    .line 1628
    invoke-direct {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildClosestToStart()Landroid/view/View;

    move-result-object v2

    .line 1632
    .local v2, "nextFocus":Landroid/view/View;
    :goto_4d
    if-eq v2, v3, :cond_55

    invoke-virtual {v2}, Landroid/view/View;->isFocusable()Z

    move-result v5

    if-nez v5, :cond_f

    :cond_55
    move-object v2, v4

    .line 1633
    goto :goto_f

    .line 1630
    .end local v2    # "nextFocus":Landroid/view/View;
    :cond_57
    invoke-direct {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildClosestToEnd()Landroid/view/View;

    move-result-object v2

    .restart local v2    # "nextFocus":Landroid/view/View;
    goto :goto_4d
.end method

.method public onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V
    .registers 4
    .param p1, "event"    # Landroid/view/accessibility/AccessibilityEvent;

    .prologue
    .line 204
    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 205
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildCount()I

    move-result v1

    if-lez v1, :cond_1b

    .line 206
    invoke-static {p1}, Landroid/support/v4/view/accessibility/AccessibilityEventCompat;->asRecord(Landroid/view/accessibility/AccessibilityEvent;)Landroid/support/v4/view/accessibility/AccessibilityRecordCompat;

    move-result-object v0

    .line 208
    .local v0, "record":Landroid/support/v4/view/accessibility/AccessibilityRecordCompat;
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/support/v4/view/accessibility/AccessibilityRecordCompat;->setFromIndex(I)V

    .line 209
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->findLastVisibleItemPosition()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/support/v4/view/accessibility/AccessibilityRecordCompat;->setToIndex(I)V

    .line 211
    .end local v0    # "record":Landroid/support/v4/view/accessibility/AccessibilityRecordCompat;
    :cond_1b
    return-void
.end method

.method public onLayoutChildren(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)V
    .registers 16
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 441
    iget-object v10, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/LinearLayoutManager$SavedState;

    if-eqz v10, :cond_12

    iget-object v10, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/LinearLayoutManager$SavedState;

    invoke-virtual {v10}, Landroid/support/v7/widget/LinearLayoutManager$SavedState;->hasValidAnchor()Z

    move-result v10

    if-eqz v10, :cond_12

    .line 442
    iget-object v10, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/LinearLayoutManager$SavedState;

    iget v10, v10, Landroid/support/v7/widget/LinearLayoutManager$SavedState;->mAnchorPosition:I

    iput v10, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingScrollPosition:I

    .line 445
    :cond_12
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->ensureLayoutState()V

    .line 446
    iget-object v10, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    const/4 v11, 0x0

    iput-boolean v11, v10, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mRecycle:Z

    .line 448
    invoke-direct {p0}, Landroid/support/v7/widget/LinearLayoutManager;->resolveShouldLayoutReverse()V

    .line 450
    iget-object v10, p0, Landroid/support/v7/widget/LinearLayoutManager;->mAnchorInfo:Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;

    invoke-virtual {v10}, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->reset()V

    .line 451
    iget-object v10, p0, Landroid/support/v7/widget/LinearLayoutManager;->mAnchorInfo:Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;

    iget-boolean v11, p0, Landroid/support/v7/widget/LinearLayoutManager;->mShouldReverseLayout:Z

    iget-boolean v12, p0, Landroid/support/v7/widget/LinearLayoutManager;->mStackFromEnd:Z

    xor-int/2addr v11, v12

    iput-boolean v11, v10, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mLayoutFromEnd:Z

    .line 453
    iget-object v10, p0, Landroid/support/v7/widget/LinearLayoutManager;->mAnchorInfo:Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;

    invoke-direct {p0, p2, v10}, Landroid/support/v7/widget/LinearLayoutManager;->updateAnchorInfoForLayout(Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;)V

    .line 462
    invoke-virtual {p0, p2}, Landroid/support/v7/widget/LinearLayoutManager;->getExtraLayoutSpace(Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v4

    .line 463
    .local v4, "extra":I
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView$State;->getTargetScrollPosition()I

    move-result v10

    iget-object v11, p0, Landroid/support/v7/widget/LinearLayoutManager;->mAnchorInfo:Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;

    iget v11, v11, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mPosition:I

    if-ge v10, v11, :cond_10f

    const/4 v0, 0x1

    .line 464
    .local v0, "before":Z
    :goto_3f
    iget-boolean v10, p0, Landroid/support/v7/widget/LinearLayoutManager;->mShouldReverseLayout:Z

    if-ne v0, v10, :cond_112

    .line 465
    move v5, v4

    .line 466
    .local v5, "extraForEnd":I
    const/4 v6, 0x0

    .line 471
    .local v6, "extraForStart":I
    :goto_45
    iget-object v10, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v10}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v10

    add-int/2addr v6, v10

    .line 472
    iget-object v10, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v10}, Landroid/support/v7/widget/OrientationHelper;->getEndPadding()I

    move-result v10

    add-int/2addr v5, v10

    .line 473
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView$State;->isPreLayout()Z

    move-result v10

    if-eqz v10, :cond_85

    iget v10, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingScrollPosition:I

    const/4 v11, -0x1

    if-eq v10, v11, :cond_85

    iget v10, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingScrollPositionOffset:I

    const/high16 v11, -0x80000000

    if-eq v10, v11, :cond_85

    .line 478
    iget v10, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingScrollPosition:I

    invoke-virtual {p0, v10}, Landroid/support/v7/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;

    move-result-object v3

    .line 479
    .local v3, "existing":Landroid/view/View;
    if-eqz v3, :cond_85

    .line 482
    iget-boolean v10, p0, Landroid/support/v7/widget/LinearLayoutManager;->mShouldReverseLayout:Z

    if-eqz v10, :cond_116

    .line 483
    iget-object v10, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v10}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v10

    iget-object v11, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v11, v3}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedEnd(Landroid/view/View;)I

    move-result v11

    sub-int v1, v10, v11

    .line 485
    .local v1, "current":I
    iget v10, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingScrollPositionOffset:I

    sub-int v9, v1, v10

    .line 491
    .local v9, "upcomingOffset":I
    :goto_82
    if-lez v9, :cond_12a

    .line 492
    add-int/2addr v6, v9

    .line 500
    .end local v1    # "current":I
    .end local v3    # "existing":Landroid/view/View;
    .end local v9    # "upcomingOffset":I
    :cond_85
    :goto_85
    iget-object v10, p0, Landroid/support/v7/widget/LinearLayoutManager;->mAnchorInfo:Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;

    invoke-virtual {p0, p2, v10}, Landroid/support/v7/widget/LinearLayoutManager;->onAnchorReady(Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;)V

    .line 501
    invoke-virtual {p0, p1}, Landroid/support/v7/widget/LinearLayoutManager;->detachAndScrapAttachedViews(Landroid/support/v7/widget/RecyclerView$Recycler;)V

    .line 502
    iget-object v10, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView$State;->isPreLayout()Z

    move-result v11

    iput-boolean v11, v10, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mIsPreLayout:Z

    .line 503
    iget-object v10, p0, Landroid/support/v7/widget/LinearLayoutManager;->mAnchorInfo:Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;

    iget-boolean v10, v10, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mLayoutFromEnd:Z

    if-eqz v10, :cond_12d

    .line 505
    iget-object v10, p0, Landroid/support/v7/widget/LinearLayoutManager;->mAnchorInfo:Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;

    invoke-direct {p0, v10}, Landroid/support/v7/widget/LinearLayoutManager;->updateLayoutStateToFillStart(Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;)V

    .line 506
    iget-object v10, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iput v6, v10, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mExtra:I

    .line 507
    iget-object v10, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    const/4 v11, 0x0

    invoke-virtual {p0, p1, v10, p2, v11}, Landroid/support/v7/widget/LinearLayoutManager;->fill(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/LinearLayoutManager$LayoutState;Landroid/support/v7/widget/RecyclerView$State;Z)I

    .line 508
    iget-object v10, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget v8, v10, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mOffset:I

    .line 509
    .local v8, "startOffset":I
    iget-object v10, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget v10, v10, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mAvailable:I

    if-lez v10, :cond_b9

    .line 510
    iget-object v10, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget v10, v10, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mAvailable:I

    add-int/2addr v5, v10

    .line 513
    :cond_b9
    iget-object v10, p0, Landroid/support/v7/widget/LinearLayoutManager;->mAnchorInfo:Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;

    invoke-direct {p0, v10}, Landroid/support/v7/widget/LinearLayoutManager;->updateLayoutStateToFillEnd(Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;)V

    .line 514
    iget-object v10, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iput v5, v10, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mExtra:I

    .line 515
    iget-object v10, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget v11, v10, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mCurrentPosition:I

    iget-object v12, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget v12, v12, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mItemDirection:I

    add-int/2addr v11, v12

    iput v11, v10, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mCurrentPosition:I

    .line 516
    iget-object v10, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    const/4 v11, 0x0

    invoke-virtual {p0, p1, v10, p2, v11}, Landroid/support/v7/widget/LinearLayoutManager;->fill(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/LinearLayoutManager$LayoutState;Landroid/support/v7/widget/RecyclerView$State;Z)I

    .line 517
    iget-object v10, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget v2, v10, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mOffset:I

    .line 538
    .local v2, "endOffset":I
    :goto_d7
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildCount()I

    move-result v10

    if-lez v10, :cond_f2

    .line 542
    iget-boolean v10, p0, Landroid/support/v7/widget/LinearLayoutManager;->mShouldReverseLayout:Z

    iget-boolean v11, p0, Landroid/support/v7/widget/LinearLayoutManager;->mStackFromEnd:Z

    xor-int/2addr v10, v11

    if-eqz v10, :cond_16b

    .line 543
    const/4 v10, 0x1

    invoke-direct {p0, v2, p1, p2, v10}, Landroid/support/v7/widget/LinearLayoutManager;->fixLayoutEndGap(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;Z)I

    move-result v7

    .line 544
    .local v7, "fixOffset":I
    add-int/2addr v8, v7

    .line 545
    add-int/2addr v2, v7

    .line 546
    const/4 v10, 0x0

    invoke-direct {p0, v8, p1, p2, v10}, Landroid/support/v7/widget/LinearLayoutManager;->fixLayoutStartGap(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;Z)I

    move-result v7

    .line 547
    add-int/2addr v8, v7

    .line 548
    add-int/2addr v2, v7

    .line 558
    .end local v7    # "fixOffset":I
    :cond_f2
    :goto_f2
    invoke-direct {p0, p1, p2, v8, v2}, Landroid/support/v7/widget/LinearLayoutManager;->layoutForPredictiveAnimations(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;II)V

    .line 559
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView$State;->isPreLayout()Z

    move-result v10

    if-nez v10, :cond_107

    .line 560
    const/4 v10, -0x1

    iput v10, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingScrollPosition:I

    .line 561
    const/high16 v10, -0x80000000

    iput v10, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingScrollPositionOffset:I

    .line 562
    iget-object v10, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v10}, Landroid/support/v7/widget/OrientationHelper;->onLayoutComplete()V

    .line 564
    :cond_107
    iget-boolean v10, p0, Landroid/support/v7/widget/LinearLayoutManager;->mStackFromEnd:Z

    iput-boolean v10, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLastStackFromEnd:Z

    .line 565
    const/4 v10, 0x0

    iput-object v10, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/LinearLayoutManager$SavedState;

    .line 569
    return-void

    .line 463
    .end local v0    # "before":Z
    .end local v2    # "endOffset":I
    .end local v5    # "extraForEnd":I
    .end local v6    # "extraForStart":I
    .end local v8    # "startOffset":I
    :cond_10f
    const/4 v0, 0x0

    goto/16 :goto_3f

    .line 468
    .restart local v0    # "before":Z
    :cond_112
    move v6, v4

    .line 469
    .restart local v6    # "extraForStart":I
    const/4 v5, 0x0

    .restart local v5    # "extraForEnd":I
    goto/16 :goto_45

    .line 487
    .restart local v3    # "existing":Landroid/view/View;
    :cond_116
    iget-object v10, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v10, v3}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v10

    iget-object v11, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v11}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v11

    sub-int v1, v10, v11

    .line 489
    .restart local v1    # "current":I
    iget v10, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingScrollPositionOffset:I

    sub-int v9, v10, v1

    .restart local v9    # "upcomingOffset":I
    goto/16 :goto_82

    .line 494
    :cond_12a
    sub-int/2addr v5, v9

    goto/16 :goto_85

    .line 520
    .end local v1    # "current":I
    .end local v3    # "existing":Landroid/view/View;
    .end local v9    # "upcomingOffset":I
    :cond_12d
    iget-object v10, p0, Landroid/support/v7/widget/LinearLayoutManager;->mAnchorInfo:Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;

    invoke-direct {p0, v10}, Landroid/support/v7/widget/LinearLayoutManager;->updateLayoutStateToFillEnd(Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;)V

    .line 521
    iget-object v10, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iput v5, v10, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mExtra:I

    .line 522
    iget-object v10, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    const/4 v11, 0x0

    invoke-virtual {p0, p1, v10, p2, v11}, Landroid/support/v7/widget/LinearLayoutManager;->fill(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/LinearLayoutManager$LayoutState;Landroid/support/v7/widget/RecyclerView$State;Z)I

    .line 523
    iget-object v10, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget v2, v10, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mOffset:I

    .line 524
    .restart local v2    # "endOffset":I
    iget-object v10, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget v10, v10, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mAvailable:I

    if-lez v10, :cond_14b

    .line 525
    iget-object v10, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget v10, v10, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mAvailable:I

    add-int/2addr v6, v10

    .line 528
    :cond_14b
    iget-object v10, p0, Landroid/support/v7/widget/LinearLayoutManager;->mAnchorInfo:Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;

    invoke-direct {p0, v10}, Landroid/support/v7/widget/LinearLayoutManager;->updateLayoutStateToFillStart(Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;)V

    .line 529
    iget-object v10, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iput v6, v10, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mExtra:I

    .line 530
    iget-object v10, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget v11, v10, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mCurrentPosition:I

    iget-object v12, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget v12, v12, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mItemDirection:I

    add-int/2addr v11, v12

    iput v11, v10, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mCurrentPosition:I

    .line 531
    iget-object v10, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    const/4 v11, 0x0

    invoke-virtual {p0, p1, v10, p2, v11}, Landroid/support/v7/widget/LinearLayoutManager;->fill(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/LinearLayoutManager$LayoutState;Landroid/support/v7/widget/RecyclerView$State;Z)I

    .line 532
    iget-object v10, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget v8, v10, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mOffset:I

    .restart local v8    # "startOffset":I
    goto/16 :goto_d7

    .line 550
    :cond_16b
    const/4 v10, 0x1

    invoke-direct {p0, v8, p1, p2, v10}, Landroid/support/v7/widget/LinearLayoutManager;->fixLayoutStartGap(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;Z)I

    move-result v7

    .line 551
    .restart local v7    # "fixOffset":I
    add-int/2addr v8, v7

    .line 552
    add-int/2addr v2, v7

    .line 553
    const/4 v10, 0x0

    invoke-direct {p0, v2, p1, p2, v10}, Landroid/support/v7/widget/LinearLayoutManager;->fixLayoutEndGap(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;Z)I

    move-result v7

    .line 554
    add-int/2addr v8, v7

    .line 555
    add-int/2addr v2, v7

    goto/16 :goto_f2
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 3
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    .line 241
    instance-of v0, p1, Landroid/support/v7/widget/LinearLayoutManager$SavedState;

    if-eqz v0, :cond_b

    .line 242
    check-cast p1, Landroid/support/v7/widget/LinearLayoutManager$SavedState;

    .end local p1    # "state":Landroid/os/Parcelable;
    iput-object p1, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/LinearLayoutManager$SavedState;

    .line 243
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->requestLayout()V

    .line 250
    :cond_b
    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .registers 6

    .prologue
    .line 215
    iget-object v3, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/LinearLayoutManager$SavedState;

    if-eqz v3, :cond_c

    .line 216
    new-instance v2, Landroid/support/v7/widget/LinearLayoutManager$SavedState;

    iget-object v3, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/LinearLayoutManager$SavedState;

    invoke-direct {v2, v3}, Landroid/support/v7/widget/LinearLayoutManager$SavedState;-><init>(Landroid/support/v7/widget/LinearLayoutManager$SavedState;)V

    .line 236
    :goto_b
    return-object v2

    .line 218
    :cond_c
    new-instance v2, Landroid/support/v7/widget/LinearLayoutManager$SavedState;

    invoke-direct {v2}, Landroid/support/v7/widget/LinearLayoutManager$SavedState;-><init>()V

    .line 219
    .local v2, "state":Landroid/support/v7/widget/LinearLayoutManager$SavedState;
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildCount()I

    move-result v3

    if-lez v3, :cond_55

    .line 220
    iget-boolean v3, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLastStackFromEnd:Z

    iget-boolean v4, p0, Landroid/support/v7/widget/LinearLayoutManager;->mShouldReverseLayout:Z

    xor-int v0, v3, v4

    .line 221
    .local v0, "didLayoutFromEnd":Z
    iput-boolean v0, v2, Landroid/support/v7/widget/LinearLayoutManager$SavedState;->mAnchorLayoutFromEnd:Z

    .line 222
    if-eqz v0, :cond_3b

    .line 223
    invoke-direct {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildClosestToEnd()Landroid/view/View;

    move-result-object v1

    .line 224
    .local v1, "refChild":Landroid/view/View;
    iget-object v3, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v3}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v3

    iget-object v4, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4, v1}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedEnd(Landroid/view/View;)I

    move-result v4

    sub-int/2addr v3, v4

    iput v3, v2, Landroid/support/v7/widget/LinearLayoutManager$SavedState;->mAnchorOffset:I

    .line 226
    invoke-virtual {p0, v1}, Landroid/support/v7/widget/LinearLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v3

    iput v3, v2, Landroid/support/v7/widget/LinearLayoutManager$SavedState;->mAnchorPosition:I

    goto :goto_b

    .line 228
    .end local v1    # "refChild":Landroid/view/View;
    :cond_3b
    invoke-direct {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildClosestToStart()Landroid/view/View;

    move-result-object v1

    .line 229
    .restart local v1    # "refChild":Landroid/view/View;
    invoke-virtual {p0, v1}, Landroid/support/v7/widget/LinearLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v3

    iput v3, v2, Landroid/support/v7/widget/LinearLayoutManager$SavedState;->mAnchorPosition:I

    .line 230
    iget-object v3, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v3, v1}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v3

    iget-object v4, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v4

    sub-int/2addr v3, v4

    iput v3, v2, Landroid/support/v7/widget/LinearLayoutManager$SavedState;->mAnchorOffset:I

    goto :goto_b

    .line 234
    .end local v0    # "didLayoutFromEnd":Z
    .end local v1    # "refChild":Landroid/view/View;
    :cond_55
    invoke-virtual {v2}, Landroid/support/v7/widget/LinearLayoutManager$SavedState;->invalidateAnchor()V

    goto :goto_b
.end method

.method scrollBy(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 11
    .param p1, "dy"    # I
    .param p2, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p3, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 1084
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildCount()I

    move-result v6

    if-eqz v6, :cond_a

    if-nez p1, :cond_b

    .line 1105
    :cond_a
    :goto_a
    return v4

    .line 1087
    :cond_b
    iget-object v6, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iput-boolean v5, v6, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mRecycle:Z

    .line 1088
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->ensureLayoutState()V

    .line 1089
    if-lez p1, :cond_35

    move v3, v5

    .line 1090
    .local v3, "layoutDirection":I
    :goto_15
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result v0

    .line 1091
    .local v0, "absDy":I
    invoke-direct {p0, v3, v0, v5, p3}, Landroid/support/v7/widget/LinearLayoutManager;->updateLayoutState(IIZLandroid/support/v7/widget/RecyclerView$State;)V

    .line 1092
    iget-object v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget v2, v5, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mScrollingOffset:I

    .line 1093
    .local v2, "freeScroll":I
    iget-object v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    invoke-virtual {p0, p2, v5, p3, v4}, Landroid/support/v7/widget/LinearLayoutManager;->fill(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/LinearLayoutManager$LayoutState;Landroid/support/v7/widget/RecyclerView$State;Z)I

    move-result v5

    add-int v1, v2, v5

    .line 1094
    .local v1, "consumed":I
    if-ltz v1, :cond_a

    .line 1100
    if-le v0, v1, :cond_37

    mul-int v4, v3, v1

    .line 1101
    .local v4, "scrolled":I
    :goto_2e
    iget-object v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    neg-int v6, v4

    invoke-virtual {v5, v6}, Landroid/support/v7/widget/OrientationHelper;->offsetChildren(I)V

    goto :goto_a

    .line 1089
    .end local v0    # "absDy":I
    .end local v1    # "consumed":I
    .end local v2    # "freeScroll":I
    .end local v3    # "layoutDirection":I
    .end local v4    # "scrolled":I
    :cond_35
    const/4 v3, -0x1

    goto :goto_15

    .restart local v0    # "absDy":I
    .restart local v1    # "consumed":I
    .restart local v2    # "freeScroll":I
    .restart local v3    # "layoutDirection":I
    :cond_37
    move v4, p1

    .line 1100
    goto :goto_2e
.end method

.method public scrollHorizontallyBy(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 6
    .param p1, "dx"    # I
    .param p2, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p3, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 941
    iget v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientation:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_7

    .line 942
    const/4 v0, 0x0

    .line 944
    :goto_6
    return v0

    :cond_7
    invoke-virtual {p0, p1, p2, p3}, Landroid/support/v7/widget/LinearLayoutManager;->scrollBy(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v0

    goto :goto_6
.end method

.method public scrollToPosition(I)V
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 897
    iput p1, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingScrollPosition:I

    .line 898
    const/high16 v0, -0x80000000

    iput v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingScrollPositionOffset:I

    .line 899
    iget-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/LinearLayoutManager$SavedState;

    if-eqz v0, :cond_f

    .line 900
    iget-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/LinearLayoutManager$SavedState;

    invoke-virtual {v0}, Landroid/support/v7/widget/LinearLayoutManager$SavedState;->invalidateAnchor()V

    .line 902
    :cond_f
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->requestLayout()V

    .line 903
    return-void
.end method

.method public scrollToPositionWithOffset(II)V
    .registers 4
    .param p1, "position"    # I
    .param p2, "offset"    # I

    .prologue
    .line 926
    iput p1, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingScrollPosition:I

    .line 927
    iput p2, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingScrollPositionOffset:I

    .line 928
    iget-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/LinearLayoutManager$SavedState;

    if-eqz v0, :cond_d

    .line 929
    iget-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/LinearLayoutManager$SavedState;

    invoke-virtual {v0}, Landroid/support/v7/widget/LinearLayoutManager$SavedState;->invalidateAnchor()V

    .line 931
    :cond_d
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->requestLayout()V

    .line 932
    return-void
.end method

.method public scrollVerticallyBy(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 5
    .param p1, "dy"    # I
    .param p2, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p3, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 953
    iget v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientation:I

    if-nez v0, :cond_6

    .line 954
    const/4 v0, 0x0

    .line 956
    :goto_5
    return v0

    :cond_6
    invoke-virtual {p0, p1, p2, p3}, Landroid/support/v7/widget/LinearLayoutManager;->scrollBy(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v0

    goto :goto_5
.end method

.method public setOrientation(I)V
    .registers 5
    .param p1, "orientation"    # I

    .prologue
    const/4 v1, 0x0

    .line 302
    if-eqz p1, :cond_1f

    const/4 v0, 0x1

    if-eq p1, v0, :cond_1f

    .line 303
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "invalid orientation:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 305
    :cond_1f
    invoke-virtual {p0, v1}, Landroid/support/v7/widget/LinearLayoutManager;->assertNotInLayoutOrScroll(Ljava/lang/String;)V

    .line 306
    iget v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientation:I

    if-ne p1, v0, :cond_27

    .line 312
    :goto_26
    return-void

    .line 309
    :cond_27
    iput p1, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientation:I

    .line 310
    iput-object v1, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    .line 311
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->requestLayout()V

    goto :goto_26
.end method

.method public setRecycleChildrenOnDetach(Z)V
    .registers 2
    .param p1, "recycleChildrenOnDetach"    # Z

    .prologue
    .line 190
    iput-boolean p1, p0, Landroid/support/v7/widget/LinearLayoutManager;->mRecycleChildrenOnDetach:Z

    .line 191
    return-void
.end method

.method public setReverseLayout(Z)V
    .registers 3
    .param p1, "reverseLayout"    # Z

    .prologue
    .line 353
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/LinearLayoutManager;->assertNotInLayoutOrScroll(Ljava/lang/String;)V

    .line 354
    iget-boolean v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mReverseLayout:Z

    if-ne p1, v0, :cond_9

    .line 359
    :goto_8
    return-void

    .line 357
    :cond_9
    iput-boolean p1, p0, Landroid/support/v7/widget/LinearLayoutManager;->mReverseLayout:Z

    .line 358
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->requestLayout()V

    goto :goto_8
.end method

.method public setSmoothScrollbarEnabled(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 1034
    iput-boolean p1, p0, Landroid/support/v7/widget/LinearLayoutManager;->mSmoothScrollbarEnabled:Z

    .line 1035
    return-void
.end method

.method public setStackFromEnd(Z)V
    .registers 3
    .param p1, "stackFromEnd"    # Z

    .prologue
    .line 272
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/LinearLayoutManager;->assertNotInLayoutOrScroll(Ljava/lang/String;)V

    .line 273
    iget-boolean v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mStackFromEnd:Z

    if-ne v0, p1, :cond_9

    .line 278
    :goto_8
    return-void

    .line 276
    :cond_9
    iput-boolean p1, p0, Landroid/support/v7/widget/LinearLayoutManager;->mStackFromEnd:Z

    .line 277
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->requestLayout()V

    goto :goto_8
.end method

.method public smoothScrollToPosition(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;I)V
    .registers 6
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p3, "position"    # I

    .prologue
    .line 401
    new-instance v0, Landroid/support/v7/widget/LinearLayoutManager$1;

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Landroid/support/v7/widget/LinearLayoutManager$1;-><init>(Landroid/support/v7/widget/LinearLayoutManager;Landroid/content/Context;)V

    .line 409
    .local v0, "linearSmoothScroller":Landroid/support/v7/widget/LinearSmoothScroller;
    invoke-virtual {v0, p3}, Landroid/support/v7/widget/LinearSmoothScroller;->setTargetPosition(I)V

    .line 410
    invoke-virtual {p0, v0}, Landroid/support/v7/widget/LinearLayoutManager;->startSmoothScroll(Landroid/support/v7/widget/RecyclerView$SmoothScroller;)V

    .line 411
    return-void
.end method

.method public supportsPredictiveItemAnimations()Z
    .registers 3

    .prologue
    .line 1704
    iget-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/LinearLayoutManager$SavedState;

    if-nez v0, :cond_c

    iget-boolean v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLastStackFromEnd:Z

    iget-boolean v1, p0, Landroid/support/v7/widget/LinearLayoutManager;->mStackFromEnd:Z

    if-ne v0, v1, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method validateChildOrder()V
    .registers 12

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 1663
    const-string v8, "LinearLayoutManager"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "validating child count "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildCount()I

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1664
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildCount()I

    move-result v8

    if-ge v8, v6, :cond_25

    .line 1700
    :cond_24
    return-void

    .line 1667
    :cond_25
    invoke-virtual {p0, v7}, Landroid/support/v7/widget/LinearLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    invoke-virtual {p0, v8}, Landroid/support/v7/widget/LinearLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v2

    .line 1668
    .local v2, "lastPos":I
    iget-object v8, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {p0, v7}, Landroid/support/v7/widget/LinearLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v3

    .line 1669
    .local v3, "lastScreenLoc":I
    iget-boolean v8, p0, Landroid/support/v7/widget/LinearLayoutManager;->mShouldReverseLayout:Z

    if-eqz v8, :cond_82

    .line 1670
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_3c
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildCount()I

    move-result v8

    if-ge v1, v8, :cond_24

    .line 1671
    invoke-virtual {p0, v1}, Landroid/support/v7/widget/LinearLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 1672
    .local v0, "child":Landroid/view/View;
    invoke-virtual {p0, v0}, Landroid/support/v7/widget/LinearLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v4

    .line 1673
    .local v4, "pos":I
    iget-object v8, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v8, v0}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v5

    .line 1674
    .local v5, "screenLoc":I
    if-ge v4, v2, :cond_72

    .line 1675
    invoke-direct {p0}, Landroid/support/v7/widget/LinearLayoutManager;->logChildren()V

    .line 1676
    new-instance v8, Ljava/lang/RuntimeException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "detected invalid position. loc invalid? "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    if-ge v5, v3, :cond_70

    :goto_64
    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v8, v6}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v8

    :cond_70
    move v6, v7

    goto :goto_64

    .line 1679
    :cond_72
    if-le v5, v3, :cond_7f

    .line 1680
    invoke-direct {p0}, Landroid/support/v7/widget/LinearLayoutManager;->logChildren()V

    .line 1681
    new-instance v6, Ljava/lang/RuntimeException;

    const-string v7, "detected invalid location"

    invoke-direct {v6, v7}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 1670
    :cond_7f
    add-int/lit8 v1, v1, 0x1

    goto :goto_3c

    .line 1685
    .end local v0    # "child":Landroid/view/View;
    .end local v1    # "i":I
    .end local v4    # "pos":I
    .end local v5    # "screenLoc":I
    :cond_82
    const/4 v1, 0x1

    .restart local v1    # "i":I
    :goto_83
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildCount()I

    move-result v8

    if-ge v1, v8, :cond_24

    .line 1686
    invoke-virtual {p0, v1}, Landroid/support/v7/widget/LinearLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 1687
    .restart local v0    # "child":Landroid/view/View;
    invoke-virtual {p0, v0}, Landroid/support/v7/widget/LinearLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v4

    .line 1688
    .restart local v4    # "pos":I
    iget-object v8, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v8, v0}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v5

    .line 1689
    .restart local v5    # "screenLoc":I
    if-ge v4, v2, :cond_b9

    .line 1690
    invoke-direct {p0}, Landroid/support/v7/widget/LinearLayoutManager;->logChildren()V

    .line 1691
    new-instance v8, Ljava/lang/RuntimeException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "detected invalid position. loc invalid? "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    if-ge v5, v3, :cond_b7

    :goto_ab
    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v8, v6}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v8

    :cond_b7
    move v6, v7

    goto :goto_ab

    .line 1694
    :cond_b9
    if-ge v5, v3, :cond_c6

    .line 1695
    invoke-direct {p0}, Landroid/support/v7/widget/LinearLayoutManager;->logChildren()V

    .line 1696
    new-instance v6, Ljava/lang/RuntimeException;

    const-string v7, "detected invalid location"

    invoke-direct {v6, v7}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 1685
    :cond_c6
    add-int/lit8 v1, v1, 0x1

    goto :goto_83
.end method
