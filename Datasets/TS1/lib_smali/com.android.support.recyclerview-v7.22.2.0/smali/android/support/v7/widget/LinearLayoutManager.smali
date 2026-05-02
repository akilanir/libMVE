.class public Landroid/support/v7/widget/LinearLayoutManager;
.super Landroid/support/v7/widget/RecyclerView$LayoutManager;
.source "LinearLayoutManager.java"

# interfaces
.implements Landroid/support/v7/widget/helper/ItemTouchHelper$ViewDropHandler;


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
    .line 144
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 145
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;IZ)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "orientation"    # I
    .param p3, "reverseLayout"    # Z

    .prologue
    const/4 v0, 0x0

    .line 153
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$LayoutManager;-><init>()V

    .line 94
    iput-boolean v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mReverseLayout:Z

    .line 101
    iput-boolean v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mShouldReverseLayout:Z

    .line 108
    iput-boolean v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mStackFromEnd:Z

    .line 114
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mSmoothScrollbarEnabled:Z

    .line 120
    const/4 v0, -0x1

    iput v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingScrollPosition:I

    .line 126
    const/high16 v0, -0x80000000

    iput v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingScrollPositionOffset:I

    .line 130
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/LinearLayoutManager$SavedState;

    .line 136
    new-instance v0, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;

    invoke-direct {v0, p0}, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;-><init>(Landroid/support/v7/widget/LinearLayoutManager;)V

    iput-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mAnchorInfo:Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;

    .line 154
    invoke-virtual {p0, p2}, Landroid/support/v7/widget/LinearLayoutManager;->setOrientation(I)V

    .line 155
    invoke-virtual {p0, p3}, Landroid/support/v7/widget/LinearLayoutManager;->setReverseLayout(Z)V

    .line 156
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    const/4 v1, 0x0

    .line 167
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$LayoutManager;-><init>()V

    .line 94
    iput-boolean v1, p0, Landroid/support/v7/widget/LinearLayoutManager;->mReverseLayout:Z

    .line 101
    iput-boolean v1, p0, Landroid/support/v7/widget/LinearLayoutManager;->mShouldReverseLayout:Z

    .line 108
    iput-boolean v1, p0, Landroid/support/v7/widget/LinearLayoutManager;->mStackFromEnd:Z

    .line 114
    const/4 v1, 0x1

    iput-boolean v1, p0, Landroid/support/v7/widget/LinearLayoutManager;->mSmoothScrollbarEnabled:Z

    .line 120
    const/4 v1, -0x1

    iput v1, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingScrollPosition:I

    .line 126
    const/high16 v1, -0x80000000

    iput v1, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingScrollPositionOffset:I

    .line 130
    const/4 v1, 0x0

    iput-object v1, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/LinearLayoutManager$SavedState;

    .line 136
    new-instance v1, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;

    invoke-direct {v1, p0}, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;-><init>(Landroid/support/v7/widget/LinearLayoutManager;)V

    iput-object v1, p0, Landroid/support/v7/widget/LinearLayoutManager;->mAnchorInfo:Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;

    .line 168
    invoke-static {p1, p2, p3, p4}, Landroid/support/v7/widget/LinearLayoutManager;->getProperties(Landroid/content/Context;Landroid/util/AttributeSet;II)Landroid/support/v7/widget/RecyclerView$LayoutManager$Properties;

    move-result-object v0

    .line 169
    .local v0, "properties":Landroid/support/v7/widget/RecyclerView$LayoutManager$Properties;
    iget v1, v0, Landroid/support/v7/widget/RecyclerView$LayoutManager$Properties;->orientation:I

    invoke-virtual {p0, v1}, Landroid/support/v7/widget/LinearLayoutManager;->setOrientation(I)V

    .line 170
    iget-boolean v1, v0, Landroid/support/v7/widget/RecyclerView$LayoutManager$Properties;->reverseLayout:Z

    invoke-virtual {p0, v1}, Landroid/support/v7/widget/LinearLayoutManager;->setReverseLayout(Z)V

    .line 171
    iget-boolean v1, v0, Landroid/support/v7/widget/RecyclerView$LayoutManager$Properties;->stackFromEnd:Z

    invoke-virtual {p0, v1}, Landroid/support/v7/widget/LinearLayoutManager;->setStackFromEnd(Z)V

    .line 172
    return-void
.end method

.method private computeScrollExtent(Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 8
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 1052
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildCount()I

    move-result v0

    if-nez v0, :cond_9

    .line 1056
    :goto_8
    return v4

    .line 1055
    :cond_9
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->ensureLayoutState()V

    .line 1056
    iget-object v1, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    iget-boolean v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mSmoothScrollbarEnabled:Z

    if-nez v0, :cond_29

    move v0, v3

    :goto_13
    invoke-direct {p0, v0, v3}, Landroid/support/v7/widget/LinearLayoutManager;->findFirstVisibleChildClosestToStart(ZZ)Landroid/view/View;

    move-result-object v2

    iget-boolean v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mSmoothScrollbarEnabled:Z

    if-nez v0, :cond_1c

    move v4, v3

    :cond_1c
    invoke-direct {p0, v4, v3}, Landroid/support/v7/widget/LinearLayoutManager;->findFirstVisibleChildClosestToEnd(ZZ)Landroid/view/View;

    move-result-object v3

    iget-boolean v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mSmoothScrollbarEnabled:Z

    move-object v0, p1

    move-object v4, p0

    invoke-static/range {v0 .. v5}, Landroid/support/v7/widget/ScrollbarHelper;->computeScrollExtent(Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/OrientationHelper;Landroid/view/View;Landroid/view/View;Landroid/support/v7/widget/RecyclerView$LayoutManager;Z)I

    move-result v4

    goto :goto_8

    :cond_29
    move v0, v4

    goto :goto_13
.end method

.method private computeScrollOffset(Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 9
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 1041
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildCount()I

    move-result v0

    if-nez v0, :cond_9

    .line 1045
    :goto_8
    return v4

    .line 1044
    :cond_9
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->ensureLayoutState()V

    .line 1045
    iget-object v1, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    iget-boolean v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mSmoothScrollbarEnabled:Z

    if-nez v0, :cond_2b

    move v0, v3

    :goto_13
    invoke-direct {p0, v0, v3}, Landroid/support/v7/widget/LinearLayoutManager;->findFirstVisibleChildClosestToStart(ZZ)Landroid/view/View;

    move-result-object v2

    iget-boolean v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mSmoothScrollbarEnabled:Z

    if-nez v0, :cond_1c

    move v4, v3

    :cond_1c
    invoke-direct {p0, v4, v3}, Landroid/support/v7/widget/LinearLayoutManager;->findFirstVisibleChildClosestToEnd(ZZ)Landroid/view/View;

    move-result-object v3

    iget-boolean v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mSmoothScrollbarEnabled:Z

    iget-boolean v6, p0, Landroid/support/v7/widget/LinearLayoutManager;->mShouldReverseLayout:Z

    move-object v0, p1

    move-object v4, p0

    invoke-static/range {v0 .. v6}, Landroid/support/v7/widget/ScrollbarHelper;->computeScrollOffset(Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/OrientationHelper;Landroid/view/View;Landroid/view/View;Landroid/support/v7/widget/RecyclerView$LayoutManager;ZZ)I

    move-result v4

    goto :goto_8

    :cond_2b
    move v0, v4

    goto :goto_13
.end method

.method private computeScrollRange(Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 8
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 1063
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildCount()I

    move-result v0

    if-nez v0, :cond_9

    .line 1067
    :goto_8
    return v4

    .line 1066
    :cond_9
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->ensureLayoutState()V

    .line 1067
    iget-object v1, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    iget-boolean v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mSmoothScrollbarEnabled:Z

    if-nez v0, :cond_29

    move v0, v3

    :goto_13
    invoke-direct {p0, v0, v3}, Landroid/support/v7/widget/LinearLayoutManager;->findFirstVisibleChildClosestToStart(ZZ)Landroid/view/View;

    move-result-object v2

    iget-boolean v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mSmoothScrollbarEnabled:Z

    if-nez v0, :cond_1c

    move v4, v3

    :cond_1c
    invoke-direct {p0, v4, v3}, Landroid/support/v7/widget/LinearLayoutManager;->findFirstVisibleChildClosestToEnd(ZZ)Landroid/view/View;

    move-result-object v3

    iget-boolean v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mSmoothScrollbarEnabled:Z

    move-object v0, p1

    move-object v4, p0

    invoke-static/range {v0 .. v5}, Landroid/support/v7/widget/ScrollbarHelper;->computeScrollRange(Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/OrientationHelper;Landroid/view/View;Landroid/view/View;Landroid/support/v7/widget/RecyclerView$LayoutManager;Z)I

    move-result v4

    goto :goto_8

    :cond_29
    move v0, v4

    goto :goto_13
.end method

.method private convertFocusDirectionToLayoutDirection(I)I
    .registers 6
    .param p1, "focusDirection"    # I

    .prologue
    const/4 v0, -0x1

    const/4 v2, 0x1

    const/high16 v1, -0x80000000

    .line 1442
    sparse-switch p1, :sswitch_data_26

    move v0, v1

    .line 1463
    :cond_8
    :goto_8
    :sswitch_8
    return v0

    :sswitch_9
    move v0, v2

    .line 1446
    goto :goto_8

    .line 1448
    :sswitch_b
    iget v3, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientation:I

    if-eq v3, v2, :cond_8

    move v0, v1

    goto :goto_8

    .line 1451
    :sswitch_11
    iget v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientation:I

    if-ne v0, v2, :cond_16

    move v1, v2

    :cond_16
    move v0, v1

    goto :goto_8

    .line 1454
    :sswitch_18
    iget v2, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientation:I

    if-eqz v2, :cond_8

    move v0, v1

    goto :goto_8

    .line 1457
    :sswitch_1e
    iget v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientation:I

    if-nez v0, :cond_24

    :goto_22
    move v0, v2

    goto :goto_8

    :cond_24
    move v2, v1

    goto :goto_22

    .line 1442
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
    .line 1557
    const/4 v0, 0x0

    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildCount()I

    move-result v1

    invoke-virtual {p0, v0, v1, p1}, Landroid/support/v7/widget/LinearLayoutManager;->findReferenceChild(III)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method private findFirstVisibleChildClosestToEnd(ZZ)Landroid/view/View;
    .registers 5
    .param p1, "completelyVisible"    # Z
    .param p2, "acceptPartiallyVisible"    # Z

    .prologue
    .line 1515
    iget-boolean v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mShouldReverseLayout:Z

    if-eqz v0, :cond_e

    .line 1516
    const/4 v0, 0x0

    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildCount()I

    move-result v1

    invoke-virtual {p0, v0, v1, p1, p2}, Landroid/support/v7/widget/LinearLayoutManager;->findOneVisibleChild(IIZZ)Landroid/view/View;

    move-result-object v0

    .line 1519
    :goto_d
    return-object v0

    :cond_e
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    const/4 v1, -0x1

    invoke-virtual {p0, v0, v1, p1, p2}, Landroid/support/v7/widget/LinearLayoutManager;->findOneVisibleChild(IIZZ)Landroid/view/View;

    move-result-object v0

    goto :goto_d
.end method

.method private findFirstVisibleChildClosestToStart(ZZ)Landroid/view/View;
    .registers 5
    .param p1, "completelyVisible"    # Z
    .param p2, "acceptPartiallyVisible"    # Z

    .prologue
    .line 1497
    iget-boolean v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mShouldReverseLayout:Z

    if-eqz v0, :cond_10

    .line 1498
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    const/4 v1, -0x1

    invoke-virtual {p0, v0, v1, p1, p2}, Landroid/support/v7/widget/LinearLayoutManager;->findOneVisibleChild(IIZZ)Landroid/view/View;

    move-result-object v0

    .line 1501
    :goto_f
    return-object v0

    :cond_10
    const/4 v0, 0x0

    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildCount()I

    move-result v1

    invoke-virtual {p0, v0, v1, p1, p2}, Landroid/support/v7/widget/LinearLayoutManager;->findOneVisibleChild(IIZZ)Landroid/view/View;

    move-result-object v0

    goto :goto_f
.end method

.method private findLastReferenceChild(I)Landroid/view/View;
    .registers 4
    .param p1, "itemCount"    # I

    .prologue
    .line 1561
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    const/4 v1, -0x1

    invoke-virtual {p0, v0, v1, p1}, Landroid/support/v7/widget/LinearLayoutManager;->findReferenceChild(III)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method private findReferenceChildClosestToEnd(Landroid/support/v7/widget/RecyclerView$State;)Landroid/view/View;
    .registers 3
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 1536
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
    .line 1552
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
    .line 837
    iget-object v2, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v2}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v2

    sub-int v1, v2, p1

    .line 838
    .local v1, "gap":I
    const/4 v0, 0x0

    .line 839
    .local v0, "fixOffset":I
    if-lez v1, :cond_26

    .line 840
    neg-int v2, v1

    invoke-virtual {p0, v2, p2, p3}, Landroid/support/v7/widget/LinearLayoutManager;->scrollBy(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v2

    neg-int v0, v2

    .line 845
    add-int/2addr p1, v0

    .line 846
    if-eqz p4, :cond_28

    .line 848
    iget-object v2, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v2}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v2

    sub-int v1, v2, p1

    .line 849
    if-lez v1, :cond_28

    .line 850
    iget-object v2, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v2, v1}, Landroid/support/v7/widget/OrientationHelper;->offsetChildren(I)V

    .line 851
    add-int v2, v1, v0

    .line 854
    :goto_25
    return v2

    .line 842
    :cond_26
    const/4 v2, 0x0

    goto :goto_25

    :cond_28
    move v2, v0

    .line 854
    goto :goto_25
.end method

.method private fixLayoutStartGap(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;Z)I
    .registers 9
    .param p1, "startOffset"    # I
    .param p2, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p3, "state"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p4, "canOffsetChildren"    # Z

    .prologue
    .line 862
    iget-object v2, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v2}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v2

    sub-int v1, p1, v2

    .line 863
    .local v1, "gap":I
    const/4 v0, 0x0

    .line 864
    .local v0, "fixOffset":I
    if-lez v1, :cond_26

    .line 866
    invoke-virtual {p0, v1, p2, p3}, Landroid/support/v7/widget/LinearLayoutManager;->scrollBy(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v2

    neg-int v0, v2

    .line 870
    add-int/2addr p1, v0

    .line 871
    if-eqz p4, :cond_28

    .line 873
    iget-object v2, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v2}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v2

    sub-int v1, p1, v2

    .line 874
    if-lez v1, :cond_28

    .line 875
    iget-object v2, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    neg-int v3, v1

    invoke-virtual {v2, v3}, Landroid/support/v7/widget/OrientationHelper;->offsetChildren(I)V

    .line 876
    sub-int v2, v0, v1

    .line 879
    :goto_25
    return v2

    .line 868
    :cond_26
    const/4 v2, 0x0

    goto :goto_25

    :cond_28
    move v2, v0

    .line 879
    goto :goto_25
.end method

.method private getChildClosestToEnd()Landroid/view/View;
    .registers 2

    .prologue
    .line 1485
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
    .line 1475
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
    .registers 18
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p3, "startOffset"    # I
    .param p4, "endOffset"    # I

    .prologue
    .line 634
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView$State;->willRunPredictiveAnimations()Z

    move-result v11

    if-eqz v11, :cond_18

    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildCount()I

    move-result v11

    if-eqz v11, :cond_18

    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView$State;->isPreLayout()Z

    move-result v11

    if-nez v11, :cond_18

    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->supportsPredictiveItemAnimations()Z

    move-result v11

    if-nez v11, :cond_19

    .line 681
    :cond_18
    :goto_18
    return-void

    .line 639
    :cond_19
    const/4 v8, 0x0

    .local v8, "scrapExtraStart":I
    const/4 v7, 0x0

    .line 640
    .local v7, "scrapExtraEnd":I
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$Recycler;->getScrapList()Ljava/util/List;

    move-result-object v9

    .line 641
    .local v9, "scrapList":Ljava/util/List;, "Ljava/util/List<Landroid/support/v7/widget/RecyclerView$ViewHolder;>;"
    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v10

    .line 642
    .local v10, "scrapSize":I
    const/4 v11, 0x0

    invoke-virtual {p0, v11}, Landroid/support/v7/widget/LinearLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v11

    invoke-virtual {p0, v11}, Landroid/support/v7/widget/LinearLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v3

    .line 643
    .local v3, "firstChildPos":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_2d
    if-ge v4, v10, :cond_65

    .line 644
    invoke-interface {v9, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .line 645
    .local v6, "scrap":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    invoke-virtual {v6}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->isRemoved()Z

    move-result v11

    if-eqz v11, :cond_3e

    .line 643
    :goto_3b
    add-int/lit8 v4, v4, 0x1

    goto :goto_2d

    .line 648
    :cond_3e
    invoke-virtual {v6}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getLayoutPosition()I

    move-result v5

    .line 649
    .local v5, "position":I
    if-ge v5, v3, :cond_57

    const/4 v11, 0x1

    :goto_45
    iget-boolean v12, p0, Landroid/support/v7/widget/LinearLayoutManager;->mShouldReverseLayout:Z

    if-eq v11, v12, :cond_59

    const/4 v2, -0x1

    .line 651
    .local v2, "direction":I
    :goto_4a
    const/4 v11, -0x1

    if-ne v2, v11, :cond_5b

    .line 652
    iget-object v11, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    iget-object v12, v6, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v11, v12}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedMeasurement(Landroid/view/View;)I

    move-result v11

    add-int/2addr v8, v11

    goto :goto_3b

    .line 649
    .end local v2    # "direction":I
    :cond_57
    const/4 v11, 0x0

    goto :goto_45

    :cond_59
    const/4 v2, 0x1

    goto :goto_4a

    .line 654
    .restart local v2    # "direction":I
    :cond_5b
    iget-object v11, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    iget-object v12, v6, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v11, v12}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedMeasurement(Landroid/view/View;)I

    move-result v11

    add-int/2addr v7, v11

    goto :goto_3b

    .line 662
    .end local v2    # "direction":I
    .end local v5    # "position":I
    .end local v6    # "scrap":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    :cond_65
    iget-object v11, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iput-object v9, v11, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mScrapList:Ljava/util/List;

    .line 663
    if-lez v8, :cond_8c

    .line 664
    invoke-direct {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildClosestToStart()Landroid/view/View;

    move-result-object v1

    .line 665
    .local v1, "anchor":Landroid/view/View;
    invoke-virtual {p0, v1}, Landroid/support/v7/widget/LinearLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v11

    move/from16 v0, p3

    invoke-direct {p0, v11, v0}, Landroid/support/v7/widget/LinearLayoutManager;->updateLayoutStateToFillStart(II)V

    .line 666
    iget-object v11, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iput v8, v11, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mExtra:I

    .line 667
    iget-object v11, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    const/4 v12, 0x0

    iput v12, v11, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mAvailable:I

    .line 668
    iget-object v11, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    invoke-virtual {v11}, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->assignPositionFromScrapList()V

    .line 669
    iget-object v11, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    const/4 v12, 0x0

    invoke-virtual {p0, p1, v11, p2, v12}, Landroid/support/v7/widget/LinearLayoutManager;->fill(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/LinearLayoutManager$LayoutState;Landroid/support/v7/widget/RecyclerView$State;Z)I

    .line 672
    .end local v1    # "anchor":Landroid/view/View;
    :cond_8c
    if-lez v7, :cond_af

    .line 673
    invoke-direct {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildClosestToEnd()Landroid/view/View;

    move-result-object v1

    .line 674
    .restart local v1    # "anchor":Landroid/view/View;
    invoke-virtual {p0, v1}, Landroid/support/v7/widget/LinearLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v11

    move/from16 v0, p4

    invoke-direct {p0, v11, v0}, Landroid/support/v7/widget/LinearLayoutManager;->updateLayoutStateToFillEnd(II)V

    .line 675
    iget-object v11, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iput v7, v11, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mExtra:I

    .line 676
    iget-object v11, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    const/4 v12, 0x0

    iput v12, v11, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mAvailable:I

    .line 677
    iget-object v11, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    invoke-virtual {v11}, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->assignPositionFromScrapList()V

    .line 678
    iget-object v11, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    const/4 v12, 0x0

    invoke-virtual {p0, p1, v11, p2, v12}, Landroid/support/v7/widget/LinearLayoutManager;->fill(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/LinearLayoutManager$LayoutState;Landroid/support/v7/widget/RecyclerView$State;Z)I

    .line 680
    .end local v1    # "anchor":Landroid/view/View;
    :cond_af
    iget-object v11, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    const/4 v12, 0x0

    iput-object v12, v11, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mScrapList:Ljava/util/List;

    goto/16 :goto_18
.end method

.method private logChildren()V
    .registers 6

    .prologue
    .line 1748
    const-string v2, "LinearLayoutManager"

    const-string v3, "internal representation of views on the screen"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1749
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_8
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_41

    .line 1750
    invoke-virtual {p0, v1}, Landroid/support/v7/widget/LinearLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 1751
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

    .line 1749
    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    .line 1754
    .end local v0    # "child":Landroid/view/View;
    :cond_41
    const-string v2, "LinearLayoutManager"

    const-string v3, "=============="

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1755
    return-void
.end method

.method private recycleByLayoutState(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/LinearLayoutManager$LayoutState;)V
    .registers 5
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "layoutState"    # Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    .prologue
    .line 1286
    iget-boolean v0, p2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mRecycle:Z

    if-nez v0, :cond_5

    .line 1294
    :goto_4
    return-void

    .line 1289
    :cond_5
    iget v0, p2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mLayoutDirection:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_10

    .line 1290
    iget v0, p2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mScrollingOffset:I

    invoke-direct {p0, p1, v0}, Landroid/support/v7/widget/LinearLayoutManager;->recycleViewsFromEnd(Landroid/support/v7/widget/RecyclerView$Recycler;I)V

    goto :goto_4

    .line 1292
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
    .line 1180
    if-ne p2, p3, :cond_3

    .line 1195
    :cond_2
    return-void

    .line 1186
    :cond_3
    if-le p3, p2, :cond_f

    .line 1187
    add-int/lit8 v0, p3, -0x1

    .local v0, "i":I
    :goto_7
    if-lt v0, p2, :cond_2

    .line 1188
    invoke-virtual {p0, v0, p1}, Landroid/support/v7/widget/LinearLayoutManager;->removeAndRecycleViewAt(ILandroid/support/v7/widget/RecyclerView$Recycler;)V

    .line 1187
    add-int/lit8 v0, v0, -0x1

    goto :goto_7

    .line 1191
    .end local v0    # "i":I
    :cond_f
    move v0, p2

    .restart local v0    # "i":I
    :goto_10
    if-le v0, p3, :cond_2

    .line 1192
    invoke-virtual {p0, v0, p1}, Landroid/support/v7/widget/LinearLayoutManager;->removeAndRecycleViewAt(ILandroid/support/v7/widget/RecyclerView$Recycler;)V

    .line 1191
    add-int/lit8 v0, v0, -0x1

    goto :goto_10
.end method

.method private recycleViewsFromEnd(Landroid/support/v7/widget/RecyclerView$Recycler;I)V
    .registers 8
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "dt"    # I

    .prologue
    .line 1245
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildCount()I

    move-result v1

    .line 1246
    .local v1, "childCount":I
    if-gez p2, :cond_7

    .line 1272
    :cond_6
    :goto_6
    return-void

    .line 1253
    :cond_7
    iget-object v4, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4}, Landroid/support/v7/widget/OrientationHelper;->getEnd()I

    move-result v4

    sub-int v3, v4, p2

    .line 1254
    .local v3, "limit":I
    iget-boolean v4, p0, Landroid/support/v7/widget/LinearLayoutManager;->mShouldReverseLayout:Z

    if-eqz v4, :cond_2a

    .line 1255
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_14
    if-ge v2, v1, :cond_6

    .line 1256
    invoke-virtual {p0, v2}, Landroid/support/v7/widget/LinearLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 1257
    .local v0, "child":Landroid/view/View;
    iget-object v4, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4, v0}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v4

    if-ge v4, v3, :cond_27

    .line 1258
    const/4 v4, 0x0

    invoke-direct {p0, p1, v4, v2}, Landroid/support/v7/widget/LinearLayoutManager;->recycleChildren(Landroid/support/v7/widget/RecyclerView$Recycler;II)V

    goto :goto_6

    .line 1255
    :cond_27
    add-int/lit8 v2, v2, 0x1

    goto :goto_14

    .line 1263
    .end local v0    # "child":Landroid/view/View;
    .end local v2    # "i":I
    :cond_2a
    add-int/lit8 v2, v1, -0x1

    .restart local v2    # "i":I
    :goto_2c
    if-ltz v2, :cond_6

    .line 1264
    invoke-virtual {p0, v2}, Landroid/support/v7/widget/LinearLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 1265
    .restart local v0    # "child":Landroid/view/View;
    iget-object v4, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4, v0}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v4

    if-ge v4, v3, :cond_40

    .line 1266
    add-int/lit8 v4, v1, -0x1

    invoke-direct {p0, p1, v4, v2}, Landroid/support/v7/widget/LinearLayoutManager;->recycleChildren(Landroid/support/v7/widget/RecyclerView$Recycler;II)V

    goto :goto_6

    .line 1263
    :cond_40
    add-int/lit8 v2, v2, -0x1

    goto :goto_2c
.end method

.method private recycleViewsFromStart(Landroid/support/v7/widget/RecyclerView$Recycler;I)V
    .registers 8
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "dt"    # I

    .prologue
    .line 1206
    if-gez p2, :cond_3

    .line 1233
    :cond_2
    :goto_2
    return-void

    .line 1214
    :cond_3
    move v3, p2

    .line 1215
    .local v3, "limit":I
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildCount()I

    move-result v1

    .line 1216
    .local v1, "childCount":I
    iget-boolean v4, p0, Landroid/support/v7/widget/LinearLayoutManager;->mShouldReverseLayout:Z

    if-eqz v4, :cond_25

    .line 1217
    add-int/lit8 v2, v1, -0x1

    .local v2, "i":I
    :goto_e
    if-ltz v2, :cond_2

    .line 1218
    invoke-virtual {p0, v2}, Landroid/support/v7/widget/LinearLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 1219
    .local v0, "child":Landroid/view/View;
    iget-object v4, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4, v0}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedEnd(Landroid/view/View;)I

    move-result v4

    if-le v4, v3, :cond_22

    .line 1220
    add-int/lit8 v4, v1, -0x1

    invoke-direct {p0, p1, v4, v2}, Landroid/support/v7/widget/LinearLayoutManager;->recycleChildren(Landroid/support/v7/widget/RecyclerView$Recycler;II)V

    goto :goto_2

    .line 1217
    :cond_22
    add-int/lit8 v2, v2, -0x1

    goto :goto_e

    .line 1225
    .end local v0    # "child":Landroid/view/View;
    .end local v2    # "i":I
    :cond_25
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_26
    if-ge v2, v1, :cond_2

    .line 1226
    invoke-virtual {p0, v2}, Landroid/support/v7/widget/LinearLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 1227
    .restart local v0    # "child":Landroid/view/View;
    iget-object v4, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4, v0}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedEnd(Landroid/view/View;)I

    move-result v4

    if-le v4, v3, :cond_39

    .line 1228
    const/4 v4, 0x0

    invoke-direct {p0, p1, v4, v2}, Landroid/support/v7/widget/LinearLayoutManager;->recycleChildren(Landroid/support/v7/widget/RecyclerView$Recycler;II)V

    goto :goto_2

    .line 1225
    :cond_39
    add-int/lit8 v2, v2, 0x1

    goto :goto_26
.end method

.method private resolveShouldLayoutReverse()V
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 340
    iget v1, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientation:I

    if-eq v1, v0, :cond_b

    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->isLayoutRTL()Z

    move-result v1

    if-nez v1, :cond_10

    .line 341
    :cond_b
    iget-boolean v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mReverseLayout:Z

    iput-boolean v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mShouldReverseLayout:Z

    .line 345
    :goto_f
    return-void

    .line 343
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

    .line 711
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildCount()I

    move-result v5

    if-nez v5, :cond_9

    .line 743
    :cond_8
    :goto_8
    return v3

    .line 714
    :cond_9
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getFocusedChild()Landroid/view/View;

    move-result-object v0

    .line 715
    .local v0, "focused":Landroid/view/View;
    if-eqz v0, :cond_1a

    # invokes: Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->isViewValidAsAnchor(Landroid/view/View;Landroid/support/v7/widget/RecyclerView$State;)Z
    invoke-static {p2, v0, p1}, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->access$000(Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;Landroid/view/View;Landroid/support/v7/widget/RecyclerView$State;)Z

    move-result v5

    if-eqz v5, :cond_1a

    .line 716
    invoke-virtual {p2, v0}, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->assignFromViewAndKeepVisibleRect(Landroid/view/View;)V

    move v3, v4

    .line 717
    goto :goto_8

    .line 719
    :cond_1a
    iget-boolean v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLastStackFromEnd:Z

    iget-boolean v6, p0, Landroid/support/v7/widget/LinearLayoutManager;->mStackFromEnd:Z

    if-ne v5, v6, :cond_8

    .line 722
    iget-boolean v5, p2, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mLayoutFromEnd:Z

    if-eqz v5, :cond_66

    invoke-direct {p0, p1}, Landroid/support/v7/widget/LinearLayoutManager;->findReferenceChildClosestToEnd(Landroid/support/v7/widget/RecyclerView$State;)Landroid/view/View;

    move-result-object v2

    .line 724
    .local v2, "referenceChild":Landroid/view/View;
    :goto_28
    if-eqz v2, :cond_8

    .line 725
    invoke-virtual {p2, v2}, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->assignFromView(Landroid/view/View;)V

    .line 728
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$State;->isPreLayout()Z

    move-result v5

    if-nez v5, :cond_64

    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->supportsPredictiveItemAnimations()Z

    move-result v5

    if-eqz v5, :cond_64

    .line 730
    iget-object v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v5, v2}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v5

    iget-object v6, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v6}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v6

    if-ge v5, v6, :cond_55

    iget-object v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v5, v2}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedEnd(Landroid/view/View;)I

    move-result v5

    iget-object v6, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v6}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v6

    if-ge v5, v6, :cond_6b

    :cond_55
    move v1, v4

    .line 735
    .local v1, "notVisible":Z
    :goto_56
    if-eqz v1, :cond_64

    .line 736
    iget-boolean v3, p2, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mLayoutFromEnd:Z

    if-eqz v3, :cond_6d

    iget-object v3, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v3}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v3

    :goto_62
    iput v3, p2, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mCoordinate:I

    .end local v1    # "notVisible":Z
    :cond_64
    move v3, v4

    .line 741
    goto :goto_8

    .line 722
    .end local v2    # "referenceChild":Landroid/view/View;
    :cond_66
    invoke-direct {p0, p1}, Landroid/support/v7/widget/LinearLayoutManager;->findReferenceChildClosestToStart(Landroid/support/v7/widget/RecyclerView$State;)Landroid/view/View;

    move-result-object v2

    goto :goto_28

    .restart local v2    # "referenceChild":Landroid/view/View;
    :cond_6b
    move v1, v3

    .line 730
    goto :goto_56

    .line 736
    .restart local v1    # "notVisible":Z
    :cond_6d
    iget-object v3, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v3}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v3

    goto :goto_62
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

    .line 751
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$State;->isPreLayout()Z

    move-result v5

    if-nez v5, :cond_f

    iget v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingScrollPosition:I

    if-ne v5, v10, :cond_11

    :cond_f
    move v6, v7

    .line 829
    :goto_10
    return v6

    .line 755
    :cond_11
    iget v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingScrollPosition:I

    if-ltz v5, :cond_1d

    iget v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingScrollPosition:I

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v8

    if-lt v5, v8, :cond_23

    .line 756
    :cond_1d
    iput v10, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingScrollPosition:I

    .line 757
    iput v9, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingScrollPositionOffset:I

    move v6, v7

    .line 761
    goto :goto_10

    .line 766
    :cond_23
    iget v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingScrollPosition:I

    iput v5, p2, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mPosition:I

    .line 767
    iget-object v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/LinearLayoutManager$SavedState;

    if-eqz v5, :cond_59

    iget-object v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/LinearLayoutManager$SavedState;

    invoke-virtual {v5}, Landroid/support/v7/widget/LinearLayoutManager$SavedState;->hasValidAnchor()Z

    move-result v5

    if-eqz v5, :cond_59

    .line 770
    iget-object v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/LinearLayoutManager$SavedState;

    iget-boolean v5, v5, Landroid/support/v7/widget/LinearLayoutManager$SavedState;->mAnchorLayoutFromEnd:Z

    iput-boolean v5, p2, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mLayoutFromEnd:Z

    .line 771
    iget-boolean v5, p2, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mLayoutFromEnd:Z

    if-eqz v5, :cond_4b

    .line 772
    iget-object v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v5}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v5

    iget-object v7, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/LinearLayoutManager$SavedState;

    iget v7, v7, Landroid/support/v7/widget/LinearLayoutManager$SavedState;->mAnchorOffset:I

    sub-int/2addr v5, v7

    iput v5, p2, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mCoordinate:I

    goto :goto_10

    .line 775
    :cond_4b
    iget-object v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v5}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v5

    iget-object v7, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/LinearLayoutManager$SavedState;

    iget v7, v7, Landroid/support/v7/widget/LinearLayoutManager$SavedState;->mAnchorOffset:I

    add-int/2addr v5, v7

    iput v5, p2, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mCoordinate:I

    goto :goto_10

    .line 781
    :cond_59
    iget v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingScrollPositionOffset:I

    if-ne v5, v9, :cond_ec

    .line 782
    iget v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingScrollPosition:I

    invoke-virtual {p0, v5}, Landroid/support/v7/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;

    move-result-object v0

    .line 783
    .local v0, "child":Landroid/view/View;
    if-eqz v0, :cond_cb

    .line 784
    iget-object v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v5, v0}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedMeasurement(Landroid/view/View;)I

    move-result v1

    .line 785
    .local v1, "childSize":I
    iget-object v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v5}, Landroid/support/v7/widget/OrientationHelper;->getTotalSpace()I

    move-result v5

    if-le v1, v5, :cond_77

    .line 787
    invoke-virtual {p2}, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->assignCoordinateFromPadding()V

    goto :goto_10

    .line 790
    :cond_77
    iget-object v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v5, v0}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v5

    iget-object v8, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v8}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v8

    sub-int v4, v5, v8

    .line 792
    .local v4, "startGap":I
    if-gez v4, :cond_93

    .line 793
    iget-object v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v5}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v5

    iput v5, p2, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mCoordinate:I

    .line 794
    iput-boolean v7, p2, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mLayoutFromEnd:Z

    goto/16 :goto_10

    .line 797
    :cond_93
    iget-object v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v5}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v5

    iget-object v7, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v7, v0}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedEnd(Landroid/view/View;)I

    move-result v7

    sub-int v2, v5, v7

    .line 799
    .local v2, "endGap":I
    if-gez v2, :cond_af

    .line 800
    iget-object v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v5}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v5

    iput v5, p2, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mCoordinate:I

    .line 801
    iput-boolean v6, p2, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mLayoutFromEnd:Z

    goto/16 :goto_10

    .line 804
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

    .line 809
    .end local v1    # "childSize":I
    .end local v2    # "endGap":I
    .end local v4    # "startGap":I
    :cond_cb
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildCount()I

    move-result v5

    if-lez v5, :cond_e5

    .line 811
    invoke-virtual {p0, v7}, Landroid/support/v7/widget/LinearLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    invoke-virtual {p0, v5}, Landroid/support/v7/widget/LinearLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v3

    .line 812
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

    .line 815
    .end local v3    # "pos":I
    :cond_e5
    invoke-virtual {p2}, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->assignCoordinateFromPadding()V

    goto/16 :goto_10

    .restart local v3    # "pos":I
    :cond_ea
    move v5, v7

    .line 812
    goto :goto_de

    .line 820
    .end local v0    # "child":Landroid/view/View;
    .end local v3    # "pos":I
    :cond_ec
    iget-boolean v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mShouldReverseLayout:Z

    iput-boolean v5, p2, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mLayoutFromEnd:Z

    .line 822
    iget-boolean v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mShouldReverseLayout:Z

    if-eqz v5, :cond_101

    .line 823
    iget-object v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v5}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v5

    iget v7, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingScrollPositionOffset:I

    sub-int/2addr v5, v7

    iput v5, p2, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mCoordinate:I

    goto/16 :goto_10

    .line 826
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
    .line 684
    invoke-direct {p0, p1, p2}, Landroid/support/v7/widget/LinearLayoutManager;->updateAnchorFromPendingData(Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 702
    :cond_6
    :goto_6
    return-void

    .line 691
    :cond_7
    invoke-direct {p0, p1, p2}, Landroid/support/v7/widget/LinearLayoutManager;->updateAnchorFromChildren(Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;)Z

    move-result v0

    if-nez v0, :cond_6

    .line 700
    invoke-virtual {p2}, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->assignCoordinateFromPadding()V

    .line 701
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

    .line 1107
    iget-object v4, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    invoke-virtual {p0, p4}, Landroid/support/v7/widget/LinearLayoutManager;->getExtraLayoutSpace(Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v5

    iput v5, v4, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mExtra:I

    .line 1108
    iget-object v4, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iput p1, v4, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mLayoutDirection:I

    .line 1110
    if-ne p1, v3, :cond_62

    .line 1111
    iget-object v4, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget v5, v4, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mExtra:I

    iget-object v6, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v6}, Landroid/support/v7/widget/OrientationHelper;->getEndPadding()I

    move-result v6

    add-int/2addr v5, v6

    iput v5, v4, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mExtra:I

    .line 1113
    invoke-direct {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildClosestToEnd()Landroid/view/View;

    move-result-object v0

    .line 1115
    .local v0, "child":Landroid/view/View;
    iget-object v4, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget-boolean v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mShouldReverseLayout:Z

    if-eqz v5, :cond_60

    :goto_27
    iput v2, v4, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mItemDirection:I

    .line 1117
    iget-object v2, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/LinearLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v3

    iget-object v4, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget v4, v4, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mItemDirection:I

    add-int/2addr v3, v4

    iput v3, v2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mCurrentPosition:I

    .line 1118
    iget-object v2, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget-object v3, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v3, v0}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedEnd(Landroid/view/View;)I

    move-result v3

    iput v3, v2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mOffset:I

    .line 1120
    iget-object v2, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v2, v0}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedEnd(Landroid/view/View;)I

    move-result v2

    iget-object v3, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v3}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v3

    sub-int v1, v2, v3

    .line 1133
    .local v1, "fastScrollSpace":I
    :goto_4e
    iget-object v2, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iput p2, v2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mAvailable:I

    .line 1134
    if-eqz p3, :cond_5b

    .line 1135
    iget-object v2, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget v3, v2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mAvailable:I

    sub-int/2addr v3, v1

    iput v3, v2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mAvailable:I

    .line 1137
    :cond_5b
    iget-object v2, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iput v1, v2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mScrollingOffset:I

    .line 1138
    return-void

    .end local v1    # "fastScrollSpace":I
    :cond_60
    move v2, v3

    .line 1115
    goto :goto_27

    .line 1124
    .end local v0    # "child":Landroid/view/View;
    :cond_62
    invoke-direct {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildClosestToStart()Landroid/view/View;

    move-result-object v0

    .line 1125
    .restart local v0    # "child":Landroid/view/View;
    iget-object v4, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget v5, v4, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mExtra:I

    iget-object v6, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v6}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v6

    add-int/2addr v5, v6

    iput v5, v4, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mExtra:I

    .line 1126
    iget-object v4, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget-boolean v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mShouldReverseLayout:Z

    if-eqz v5, :cond_a2

    :goto_79
    iput v3, v4, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mItemDirection:I

    .line 1128
    iget-object v2, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/LinearLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v3

    iget-object v4, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget v4, v4, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mItemDirection:I

    add-int/2addr v3, v4

    iput v3, v2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mCurrentPosition:I

    .line 1129
    iget-object v2, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget-object v3, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v3, v0}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v3

    iput v3, v2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mOffset:I

    .line 1130
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

    .line 1126
    goto :goto_79
.end method

.method private updateLayoutStateToFillEnd(II)V
    .registers 6
    .param p1, "itemPosition"    # I
    .param p2, "offset"    # I

    .prologue
    const/4 v1, 0x1

    .line 887
    iget-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget-object v2, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v2}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v2

    sub-int/2addr v2, p2

    iput v2, v0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mAvailable:I

    .line 888
    iget-object v2, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget-boolean v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mShouldReverseLayout:Z

    if-eqz v0, :cond_28

    const/4 v0, -0x1

    :goto_13
    iput v0, v2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mItemDirection:I

    .line 890
    iget-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iput p1, v0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mCurrentPosition:I

    .line 891
    iget-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iput v1, v0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mLayoutDirection:I

    .line 892
    iget-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iput p2, v0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mOffset:I

    .line 893
    iget-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    const/high16 v1, -0x80000000

    iput v1, v0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mScrollingOffset:I

    .line 894
    return-void

    :cond_28
    move v0, v1

    .line 888
    goto :goto_13
.end method

.method private updateLayoutStateToFillEnd(Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;)V
    .registers 4
    .param p1, "anchorInfo"    # Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;

    .prologue
    .line 883
    iget v0, p1, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mPosition:I

    iget v1, p1, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mCoordinate:I

    invoke-direct {p0, v0, v1}, Landroid/support/v7/widget/LinearLayoutManager;->updateLayoutStateToFillEnd(II)V

    .line 884
    return-void
.end method

.method private updateLayoutStateToFillStart(II)V
    .registers 6
    .param p1, "itemPosition"    # I
    .param p2, "offset"    # I

    .prologue
    const/4 v1, -0x1

    .line 901
    iget-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget-object v2, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v2}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v2

    sub-int v2, p2, v2

    iput v2, v0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mAvailable:I

    .line 902
    iget-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iput p1, v0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mCurrentPosition:I

    .line 903
    iget-object v2, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget-boolean v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mShouldReverseLayout:Z

    if-eqz v0, :cond_29

    const/4 v0, 0x1

    :goto_18
    iput v0, v2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mItemDirection:I

    .line 905
    iget-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iput v1, v0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mLayoutDirection:I

    .line 906
    iget-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iput p2, v0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mOffset:I

    .line 907
    iget-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    const/high16 v1, -0x80000000

    iput v1, v0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mScrollingOffset:I

    .line 909
    return-void

    :cond_29
    move v0, v1

    .line 903
    goto :goto_18
.end method

.method private updateLayoutStateToFillStart(Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;)V
    .registers 4
    .param p1, "anchorInfo"    # Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;

    .prologue
    .line 897
    iget v0, p1, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mPosition:I

    iget v1, p1, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mCoordinate:I

    invoke-direct {p0, v0, v1}, Landroid/support/v7/widget/LinearLayoutManager;->updateLayoutStateToFillStart(II)V

    .line 898
    return-void
.end method


# virtual methods
.method public assertNotInLayoutOrScroll(Ljava/lang/String;)V
    .registers 3
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 1168
    iget-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/LinearLayoutManager$SavedState;

    if-nez v0, :cond_7

    .line 1169
    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->assertNotInLayoutOrScroll(Ljava/lang/String;)V

    .line 1171
    :cond_7
    return-void
.end method

.method public canScrollHorizontally()Z
    .registers 2

    .prologue
    .line 276
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

    .line 284
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
    .line 1022
    invoke-direct {p0, p1}, Landroid/support/v7/widget/LinearLayoutManager;->computeScrollExtent(Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v0

    return v0
.end method

.method public computeHorizontalScrollOffset(Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 3
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 1012
    invoke-direct {p0, p1}, Landroid/support/v7/widget/LinearLayoutManager;->computeScrollOffset(Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v0

    return v0
.end method

.method public computeHorizontalScrollRange(Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 3
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 1032
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

    .line 437
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildCount()I

    move-result v4

    if-nez v4, :cond_b

    .line 438
    const/4 v2, 0x0

    .line 445
    :goto_a
    return-object v2

    .line 440
    :cond_b
    invoke-virtual {p0, v2}, Landroid/support/v7/widget/LinearLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {p0, v4}, Landroid/support/v7/widget/LinearLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v1

    .line 441
    .local v1, "firstChildPos":I
    if-ge p1, v1, :cond_16

    move v2, v3

    :cond_16
    iget-boolean v4, p0, Landroid/support/v7/widget/LinearLayoutManager;->mShouldReverseLayout:Z

    if-eq v2, v4, :cond_26

    const/4 v0, -0x1

    .line 442
    .local v0, "direction":I
    :goto_1b
    iget v2, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientation:I

    if-nez v2, :cond_28

    .line 443
    new-instance v2, Landroid/graphics/PointF;

    int-to-float v3, v0

    invoke-direct {v2, v3, v5}, Landroid/graphics/PointF;-><init>(FF)V

    goto :goto_a

    .end local v0    # "direction":I
    :cond_26
    move v0, v3

    .line 441
    goto :goto_1b

    .line 445
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
    .line 1027
    invoke-direct {p0, p1}, Landroid/support/v7/widget/LinearLayoutManager;->computeScrollExtent(Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v0

    return v0
.end method

.method public computeVerticalScrollOffset(Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 3
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 1017
    invoke-direct {p0, p1}, Landroid/support/v7/widget/LinearLayoutManager;->computeScrollOffset(Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v0

    return v0
.end method

.method public computeVerticalScrollRange(Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 3
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 1037
    invoke-direct {p0, p1}, Landroid/support/v7/widget/LinearLayoutManager;->computeScrollRange(Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v0

    return v0
.end method

.method createLayoutState()Landroid/support/v7/widget/LinearLayoutManager$LayoutState;
    .registers 2

    .prologue
    .line 930
    new-instance v0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    invoke-direct {v0}, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;-><init>()V

    return-object v0
.end method

.method ensureLayoutState()V
    .registers 2

    .prologue
    .line 916
    iget-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    if-nez v0, :cond_a

    .line 917
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->createLayoutState()Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    .line 919
    :cond_a
    iget-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    if-nez v0, :cond_16

    .line 920
    iget v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientation:I

    invoke-static {p0, v0}, Landroid/support/v7/widget/OrientationHelper;->createOrientationHelper(Landroid/support/v7/widget/RecyclerView$LayoutManager;I)Landroid/support/v7/widget/OrientationHelper;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    .line 922
    :cond_16
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

    .line 1310
    iget v2, p2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mAvailable:I

    .line 1311
    .local v2, "start":I
    iget v3, p2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mScrollingOffset:I

    if-eq v3, v6, :cond_16

    .line 1313
    iget v3, p2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mAvailable:I

    if-gez v3, :cond_13

    .line 1314
    iget v3, p2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mScrollingOffset:I

    iget v4, p2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mAvailable:I

    add-int/2addr v3, v4

    iput v3, p2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mScrollingOffset:I

    .line 1316
    :cond_13
    invoke-direct {p0, p1, p2}, Landroid/support/v7/widget/LinearLayoutManager;->recycleByLayoutState(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/LinearLayoutManager$LayoutState;)V

    .line 1318
    :cond_16
    iget v3, p2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mAvailable:I

    iget v4, p2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mExtra:I

    add-int v1, v3, v4

    .line 1319
    .local v1, "remainingSpace":I
    new-instance v0, Landroid/support/v7/widget/LinearLayoutManager$LayoutChunkResult;

    invoke-direct {v0}, Landroid/support/v7/widget/LinearLayoutManager$LayoutChunkResult;-><init>()V

    .line 1320
    .local v0, "layoutChunkResult":Landroid/support/v7/widget/LinearLayoutManager$LayoutChunkResult;
    :cond_21
    if-lez v1, :cond_33

    invoke-virtual {p2, p3}, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->hasMore(Landroid/support/v7/widget/RecyclerView$State;)Z

    move-result v3

    if-eqz v3, :cond_33

    .line 1321
    invoke-virtual {v0}, Landroid/support/v7/widget/LinearLayoutManager$LayoutChunkResult;->resetInternal()V

    .line 1322
    invoke-virtual {p0, p1, p3, p2, v0}, Landroid/support/v7/widget/LinearLayoutManager;->layoutChunk(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/LinearLayoutManager$LayoutState;Landroid/support/v7/widget/LinearLayoutManager$LayoutChunkResult;)V

    .line 1323
    iget-boolean v3, v0, Landroid/support/v7/widget/LinearLayoutManager$LayoutChunkResult;->mFinished:Z

    if-eqz v3, :cond_38

    .line 1354
    :cond_33
    :goto_33
    iget v3, p2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mAvailable:I

    sub-int v3, v2, v3

    return v3

    .line 1326
    :cond_38
    iget v3, p2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mOffset:I

    iget v4, v0, Landroid/support/v7/widget/LinearLayoutManager$LayoutChunkResult;->mConsumed:I

    iget v5, p2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mLayoutDirection:I

    mul-int/2addr v4, v5

    add-int/2addr v3, v4

    iput v3, p2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mOffset:I

    .line 1333
    iget-boolean v3, v0, Landroid/support/v7/widget/LinearLayoutManager$LayoutChunkResult;->mIgnoreConsumed:Z

    if-eqz v3, :cond_52

    iget-object v3, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget-object v3, v3, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mScrapList:Ljava/util/List;

    if-nez v3, :cond_52

    invoke-virtual {p3}, Landroid/support/v7/widget/RecyclerView$State;->isPreLayout()Z

    move-result v3

    if-nez v3, :cond_5c

    .line 1335
    :cond_52
    iget v3, p2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mAvailable:I

    iget v4, v0, Landroid/support/v7/widget/LinearLayoutManager$LayoutChunkResult;->mConsumed:I

    sub-int/2addr v3, v4

    iput v3, p2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mAvailable:I

    .line 1337
    iget v3, v0, Landroid/support/v7/widget/LinearLayoutManager$LayoutChunkResult;->mConsumed:I

    sub-int/2addr v1, v3

    .line 1340
    :cond_5c
    iget v3, p2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mScrollingOffset:I

    if-eq v3, v6, :cond_75

    .line 1341
    iget v3, p2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mScrollingOffset:I

    iget v4, v0, Landroid/support/v7/widget/LinearLayoutManager$LayoutChunkResult;->mConsumed:I

    add-int/2addr v3, v4

    iput v3, p2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mScrollingOffset:I

    .line 1342
    iget v3, p2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mAvailable:I

    if-gez v3, :cond_72

    .line 1343
    iget v3, p2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mScrollingOffset:I

    iget v4, p2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mAvailable:I

    add-int/2addr v3, v4

    iput v3, p2, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mScrollingOffset:I

    .line 1345
    :cond_72
    invoke-direct {p0, p1, p2}, Landroid/support/v7/widget/LinearLayoutManager;->recycleByLayoutState(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/LinearLayoutManager$LayoutState;)V

    .line 1347
    :cond_75
    if-eqz p4, :cond_21

    iget-boolean v3, v0, Landroid/support/v7/widget/LinearLayoutManager$LayoutChunkResult;->mFocusable:Z

    if-eqz v3, :cond_21

    goto :goto_33
.end method

.method public findFirstCompletelyVisibleItemPosition()I
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 1629
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildCount()I

    move-result v1

    const/4 v2, 0x1

    invoke-virtual {p0, v3, v1, v2, v3}, Landroid/support/v7/widget/LinearLayoutManager;->findOneVisibleChild(IIZZ)Landroid/view/View;

    move-result-object v0

    .line 1630
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
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 1612
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildCount()I

    move-result v1

    const/4 v2, 0x1

    invoke-virtual {p0, v3, v1, v3, v2}, Landroid/support/v7/widget/LinearLayoutManager;->findOneVisibleChild(IIZZ)Landroid/view/View;

    move-result-object v0

    .line 1613
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

.method public findLastCompletelyVisibleItemPosition()I
    .registers 6

    .prologue
    const/4 v1, -0x1

    .line 1669
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-virtual {p0, v2, v1, v3, v4}, Landroid/support/v7/widget/LinearLayoutManager;->findOneVisibleChild(IIZZ)Landroid/view/View;

    move-result-object v0

    .line 1670
    .local v0, "child":Landroid/view/View;
    if-nez v0, :cond_10

    :goto_f
    return v1

    :cond_10
    invoke-virtual {p0, v0}, Landroid/support/v7/widget/LinearLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v1

    goto :goto_f
.end method

.method public findLastVisibleItemPosition()I
    .registers 6

    .prologue
    const/4 v1, -0x1

    .line 1652
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-virtual {p0, v2, v1, v3, v4}, Landroid/support/v7/widget/LinearLayoutManager;->findOneVisibleChild(IIZZ)Landroid/view/View;

    move-result-object v0

    .line 1653
    .local v0, "child":Landroid/view/View;
    if-nez v0, :cond_10

    :goto_f
    return v1

    :cond_10
    invoke-virtual {p0, v0}, Landroid/support/v7/widget/LinearLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v1

    goto :goto_f
.end method

.method findOneVisibleChild(IIZZ)Landroid/view/View;
    .registers 14
    .param p1, "fromIndex"    # I
    .param p2, "toIndex"    # I
    .param p3, "completelyVisible"    # Z
    .param p4, "acceptPartiallyVisible"    # Z

    .prologue
    .line 1675
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->ensureLayoutState()V

    .line 1676
    iget-object v8, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v8}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v7

    .line 1677
    .local v7, "start":I
    iget-object v8, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v8}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v3

    .line 1678
    .local v3, "end":I
    if-le p2, p1, :cond_31

    const/4 v5, 0x1

    .line 1679
    .local v5, "next":I
    :goto_12
    const/4 v6, 0x0

    .line 1680
    .local v6, "partiallyVisible":Landroid/view/View;
    move v4, p1

    .local v4, "i":I
    :goto_14
    if-eq v4, p2, :cond_3a

    .line 1681
    invoke-virtual {p0, v4}, Landroid/support/v7/widget/LinearLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 1682
    .local v0, "child":Landroid/view/View;
    iget-object v8, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v8, v0}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v2

    .line 1683
    .local v2, "childStart":I
    iget-object v8, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v8, v0}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedEnd(Landroid/view/View;)I

    move-result v1

    .line 1684
    .local v1, "childEnd":I
    if-ge v2, v3, :cond_38

    if-le v1, v7, :cond_38

    .line 1685
    if-eqz p3, :cond_30

    .line 1686
    if-lt v2, v7, :cond_33

    if-gt v1, v3, :cond_33

    .line 1696
    .end local v0    # "child":Landroid/view/View;
    .end local v1    # "childEnd":I
    .end local v2    # "childStart":I
    :cond_30
    :goto_30
    return-object v0

    .line 1678
    .end local v4    # "i":I
    .end local v5    # "next":I
    .end local v6    # "partiallyVisible":Landroid/view/View;
    :cond_31
    const/4 v5, -0x1

    goto :goto_12

    .line 1688
    .restart local v0    # "child":Landroid/view/View;
    .restart local v1    # "childEnd":I
    .restart local v2    # "childStart":I
    .restart local v4    # "i":I
    .restart local v5    # "next":I
    .restart local v6    # "partiallyVisible":Landroid/view/View;
    :cond_33
    if-eqz p4, :cond_38

    if-nez v6, :cond_38

    .line 1689
    move-object v6, v0

    .line 1680
    :cond_38
    add-int/2addr v4, v5

    goto :goto_14

    .end local v0    # "child":Landroid/view/View;
    .end local v1    # "childEnd":I
    .end local v2    # "childStart":I
    :cond_3a
    move-object v0, v6

    .line 1696
    goto :goto_30
.end method

.method findReferenceChild(III)Landroid/view/View;
    .registers 13
    .param p1, "start"    # I
    .param p2, "end"    # I
    .param p3, "itemCount"    # I

    .prologue
    .line 1566
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->ensureLayoutState()V

    .line 1567
    const/4 v4, 0x0

    .line 1568
    .local v4, "invalidMatch":Landroid/view/View;
    const/4 v5, 0x0

    .line 1569
    .local v5, "outOfBoundsMatch":Landroid/view/View;
    iget-object v8, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v8}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v1

    .line 1570
    .local v1, "boundsStart":I
    iget-object v8, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v8}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v0

    .line 1571
    .local v0, "boundsEnd":I
    if-le p2, p1, :cond_34

    const/4 v2, 0x1

    .line 1572
    .local v2, "diff":I
    :goto_14
    move v3, p1

    .local v3, "i":I
    :goto_15
    if-eq v3, p2, :cond_4a

    .line 1573
    invoke-virtual {p0, v3}, Landroid/support/v7/widget/LinearLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    .line 1574
    .local v7, "view":Landroid/view/View;
    invoke-virtual {p0, v7}, Landroid/support/v7/widget/LinearLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v6

    .line 1575
    .local v6, "position":I
    if-ltz v6, :cond_32

    if-ge v6, p3, :cond_32

    .line 1576
    invoke-virtual {v7}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v8

    check-cast v8, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    invoke-virtual {v8}, Landroid/support/v7/widget/RecyclerView$LayoutParams;->isItemRemoved()Z

    move-result v8

    if-eqz v8, :cond_36

    .line 1577
    if-nez v4, :cond_32

    .line 1578
    move-object v4, v7

    .line 1572
    :cond_32
    :goto_32
    add-int/2addr v3, v2

    goto :goto_15

    .line 1571
    .end local v2    # "diff":I
    .end local v3    # "i":I
    .end local v6    # "position":I
    .end local v7    # "view":Landroid/view/View;
    :cond_34
    const/4 v2, -0x1

    goto :goto_14

    .line 1580
    .restart local v2    # "diff":I
    .restart local v3    # "i":I
    .restart local v6    # "position":I
    .restart local v7    # "view":Landroid/view/View;
    :cond_36
    iget-object v8, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v8, v7}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v8

    if-ge v8, v0, :cond_46

    iget-object v8, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v8, v7}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedEnd(Landroid/view/View;)I

    move-result v8

    if-ge v8, v1, :cond_4d

    .line 1582
    :cond_46
    if-nez v5, :cond_32

    .line 1583
    move-object v5, v7

    goto :goto_32

    .line 1590
    .end local v6    # "position":I
    .end local v7    # "view":Landroid/view/View;
    :cond_4a
    if-eqz v5, :cond_4e

    .end local v5    # "outOfBoundsMatch":Landroid/view/View;
    :goto_4c
    move-object v7, v5

    :cond_4d
    return-object v7

    .restart local v5    # "outOfBoundsMatch":Landroid/view/View;
    :cond_4e
    move-object v5, v4

    goto :goto_4c
.end method

.method public findViewByPosition(I)Landroid/view/View;
    .registers 7
    .param p1, "position"    # I

    .prologue
    .line 385
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildCount()I

    move-result v1

    .line 386
    .local v1, "childCount":I
    if-nez v1, :cond_8

    .line 387
    const/4 v0, 0x0

    .line 398
    :cond_7
    :goto_7
    return-object v0

    .line 389
    :cond_8
    const/4 v4, 0x0

    invoke-virtual {p0, v4}, Landroid/support/v7/widget/LinearLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {p0, v4}, Landroid/support/v7/widget/LinearLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v2

    .line 390
    .local v2, "firstChild":I
    sub-int v3, p1, v2

    .line 391
    .local v3, "viewPosition":I
    if-ltz v3, :cond_21

    if-ge v3, v1, :cond_21

    .line 392
    invoke-virtual {p0, v3}, Landroid/support/v7/widget/LinearLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 393
    .local v0, "child":Landroid/view/View;
    invoke-virtual {p0, v0}, Landroid/support/v7/widget/LinearLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v4

    if-eq v4, p1, :cond_7

    .line 398
    .end local v0    # "child":Landroid/view/View;
    :cond_21
    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->findViewByPosition(I)Landroid/view/View;

    move-result-object v0

    goto :goto_7
.end method

.method public generateDefaultLayoutParams()Landroid/support/v7/widget/RecyclerView$LayoutParams;
    .registers 3

    .prologue
    const/4 v1, -0x2

    .line 179
    new-instance v0, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    invoke-direct {v0, v1, v1}, Landroid/support/v7/widget/RecyclerView$LayoutParams;-><init>(II)V

    return-object v0
.end method

.method protected getExtraLayoutSpace(Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 3
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 414
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$State;->hasTargetScrollPosition()Z

    move-result v0

    if-eqz v0, :cond_d

    .line 415
    iget-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/OrientationHelper;->getTotalSpace()I

    move-result v0

    .line 417
    :goto_c
    return v0

    :cond_d
    const/4 v0, 0x0

    goto :goto_c
.end method

.method public getOrientation()I
    .registers 2

    .prologue
    .line 311
    iget v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientation:I

    return v0
.end method

.method public getRecycleChildrenOnDetach()Z
    .registers 2

    .prologue
    .line 191
    iget-boolean v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mRecycleChildrenOnDetach:Z

    return v0
.end method

.method public getReverseLayout()Z
    .registers 2

    .prologue
    .line 354
    iget-boolean v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mReverseLayout:Z

    return v0
.end method

.method public getStackFromEnd()Z
    .registers 2

    .prologue
    .line 300
    iget-boolean v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mStackFromEnd:Z

    return v0
.end method

.method protected isLayoutRTL()Z
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 912
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
    .line 1102
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
    .line 1359
    invoke-virtual {p3, p1}, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->next(Landroid/support/v7/widget/RecyclerView$Recycler;)Landroid/view/View;

    move-result-object v1

    .line 1360
    .local v1, "view":Landroid/view/View;
    if-nez v1, :cond_a

    .line 1366
    const/4 v0, 0x1

    iput-boolean v0, p4, Landroid/support/v7/widget/LinearLayoutManager$LayoutChunkResult;->mFinished:Z

    .line 1429
    :goto_9
    return-void

    .line 1369
    :cond_a
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v8

    check-cast v8, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    .line 1370
    .local v8, "params":Landroid/support/v7/widget/RecyclerView$LayoutParams;
    iget-object v0, p3, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mScrapList:Ljava/util/List;

    if-nez v0, :cond_89

    .line 1371
    iget-boolean v2, p0, Landroid/support/v7/widget/LinearLayoutManager;->mShouldReverseLayout:Z

    iget v0, p3, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mLayoutDirection:I

    const/4 v3, -0x1

    if-ne v0, v3, :cond_82

    const/4 v0, 0x1

    :goto_1c
    if-ne v2, v0, :cond_84

    .line 1373
    invoke-virtual {p0, v1}, Landroid/support/v7/widget/LinearLayoutManager;->addView(Landroid/view/View;)V

    .line 1385
    :goto_21
    const/4 v0, 0x0

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v0, v2}, Landroid/support/v7/widget/LinearLayoutManager;->measureChildWithMargins(Landroid/view/View;II)V

    .line 1386
    iget-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedMeasurement(Landroid/view/View;)I

    move-result v0

    iput v0, p4, Landroid/support/v7/widget/LinearLayoutManager$LayoutChunkResult;->mConsumed:I

    .line 1388
    iget v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientation:I

    const/4 v2, 0x1

    if-ne v0, v2, :cond_b4

    .line 1389
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->isLayoutRTL()Z

    move-result v0

    if-eqz v0, :cond_9e

    .line 1390
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getPaddingRight()I

    move-result v2

    sub-int v9, v0, v2

    .line 1391
    .local v9, "right":I
    iget-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedMeasurementInOther(Landroid/view/View;)I

    move-result v0

    sub-int v7, v9, v0

    .line 1396
    .local v7, "left":I
    :goto_4b
    iget v0, p3, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mLayoutDirection:I

    const/4 v2, -0x1

    if-ne v0, v2, :cond_ab

    .line 1397
    iget v6, p3, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mOffset:I

    .line 1398
    .local v6, "bottom":I
    iget v0, p3, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mOffset:I

    iget v2, p4, Landroid/support/v7/widget/LinearLayoutManager$LayoutChunkResult;->mConsumed:I

    sub-int v10, v0, v2

    .line 1417
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

    .line 1425
    invoke-virtual {v8}, Landroid/support/v7/widget/RecyclerView$LayoutParams;->isItemRemoved()Z

    move-result v0

    if-nez v0, :cond_78

    invoke-virtual {v8}, Landroid/support/v7/widget/RecyclerView$LayoutParams;->isItemChanged()Z

    move-result v0

    if-eqz v0, :cond_7b

    .line 1426
    :cond_78
    const/4 v0, 0x1

    iput-boolean v0, p4, Landroid/support/v7/widget/LinearLayoutManager$LayoutChunkResult;->mIgnoreConsumed:Z

    .line 1428
    :cond_7b
    invoke-virtual {v1}, Landroid/view/View;->isFocusable()Z

    move-result v0

    iput-boolean v0, p4, Landroid/support/v7/widget/LinearLayoutManager$LayoutChunkResult;->mFocusable:Z

    goto :goto_9

    .line 1371
    .end local v6    # "bottom":I
    .end local v7    # "left":I
    .end local v9    # "right":I
    .end local v10    # "top":I
    :cond_82
    const/4 v0, 0x0

    goto :goto_1c

    .line 1375
    :cond_84
    const/4 v0, 0x0

    invoke-virtual {p0, v1, v0}, Landroid/support/v7/widget/LinearLayoutManager;->addView(Landroid/view/View;I)V

    goto :goto_21

    .line 1378
    :cond_89
    iget-boolean v2, p0, Landroid/support/v7/widget/LinearLayoutManager;->mShouldReverseLayout:Z

    iget v0, p3, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mLayoutDirection:I

    const/4 v3, -0x1

    if-ne v0, v3, :cond_97

    const/4 v0, 0x1

    :goto_91
    if-ne v2, v0, :cond_99

    .line 1380
    invoke-virtual {p0, v1}, Landroid/support/v7/widget/LinearLayoutManager;->addDisappearingView(Landroid/view/View;)V

    goto :goto_21

    .line 1378
    :cond_97
    const/4 v0, 0x0

    goto :goto_91

    .line 1382
    :cond_99
    const/4 v0, 0x0

    invoke-virtual {p0, v1, v0}, Landroid/support/v7/widget/LinearLayoutManager;->addDisappearingView(Landroid/view/View;I)V

    goto :goto_21

    .line 1393
    :cond_9e
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getPaddingLeft()I

    move-result v7

    .line 1394
    .restart local v7    # "left":I
    iget-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedMeasurementInOther(Landroid/view/View;)I

    move-result v0

    add-int v9, v7, v0

    .restart local v9    # "right":I
    goto :goto_4b

    .line 1400
    :cond_ab
    iget v10, p3, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mOffset:I

    .line 1401
    .restart local v10    # "top":I
    iget v0, p3, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mOffset:I

    iget v2, p4, Landroid/support/v7/widget/LinearLayoutManager$LayoutChunkResult;->mConsumed:I

    add-int v6, v0, v2

    .restart local v6    # "bottom":I
    goto :goto_58

    .line 1404
    .end local v6    # "bottom":I
    .end local v7    # "left":I
    .end local v9    # "right":I
    .end local v10    # "top":I
    :cond_b4
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getPaddingTop()I

    move-result v10

    .line 1405
    .restart local v10    # "top":I
    iget-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedMeasurementInOther(Landroid/view/View;)I

    move-result v0

    add-int v6, v10, v0

    .line 1407
    .restart local v6    # "bottom":I
    iget v0, p3, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mLayoutDirection:I

    const/4 v2, -0x1

    if-ne v0, v2, :cond_ce

    .line 1408
    iget v9, p3, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mOffset:I

    .line 1409
    .restart local v9    # "right":I
    iget v0, p3, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mOffset:I

    iget v2, p4, Landroid/support/v7/widget/LinearLayoutManager$LayoutChunkResult;->mConsumed:I

    sub-int v7, v0, v2

    .restart local v7    # "left":I
    goto :goto_58

    .line 1411
    .end local v7    # "left":I
    .end local v9    # "right":I
    :cond_ce
    iget v7, p3, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mOffset:I

    .line 1412
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
    .line 623
    return-void
.end method

.method public onDetachedFromWindow(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$Recycler;)V
    .registers 4
    .param p1, "view"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;

    .prologue
    .line 213
    invoke-super {p0, p1, p2}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->onDetachedFromWindow(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$Recycler;)V

    .line 214
    iget-boolean v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mRecycleChildrenOnDetach:Z

    if-eqz v0, :cond_d

    .line 215
    invoke-virtual {p0, p2}, Landroid/support/v7/widget/LinearLayoutManager;->removeAndRecycleAllViews(Landroid/support/v7/widget/RecyclerView$Recycler;)V

    .line 216
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView$Recycler;->clear()V

    .line 218
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

    .line 1702
    invoke-direct {p0}, Landroid/support/v7/widget/LinearLayoutManager;->resolveShouldLayoutReverse()V

    .line 1703
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildCount()I

    move-result v5

    if-nez v5, :cond_10

    move-object v2, v4

    .line 1740
    :cond_f
    :goto_f
    return-object v2

    .line 1707
    :cond_10
    invoke-direct {p0, p2}, Landroid/support/v7/widget/LinearLayoutManager;->convertFocusDirectionToLayoutDirection(I)I

    move-result v0

    .line 1708
    .local v0, "layoutDir":I
    if-ne v0, v7, :cond_18

    move-object v2, v4

    .line 1709
    goto :goto_f

    .line 1711
    :cond_18
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->ensureLayoutState()V

    .line 1713
    if-ne v0, v8, :cond_25

    .line 1714
    invoke-direct {p0, p4}, Landroid/support/v7/widget/LinearLayoutManager;->findReferenceChildClosestToStart(Landroid/support/v7/widget/RecyclerView$State;)Landroid/view/View;

    move-result-object v3

    .line 1718
    .local v3, "referenceChild":Landroid/view/View;
    :goto_21
    if-nez v3, :cond_2a

    move-object v2, v4

    .line 1723
    goto :goto_f

    .line 1716
    .end local v3    # "referenceChild":Landroid/view/View;
    :cond_25
    invoke-direct {p0, p4}, Landroid/support/v7/widget/LinearLayoutManager;->findReferenceChildClosestToEnd(Landroid/support/v7/widget/RecyclerView$State;)Landroid/view/View;

    move-result-object v3

    .restart local v3    # "referenceChild":Landroid/view/View;
    goto :goto_21

    .line 1725
    :cond_2a
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->ensureLayoutState()V

    .line 1726
    const v5, 0x3ea8f5c3    # 0.33f

    iget-object v6, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v6}, Landroid/support/v7/widget/OrientationHelper;->getTotalSpace()I

    move-result v6

    int-to-float v6, v6

    mul-float/2addr v5, v6

    float-to-int v1, v5

    .line 1727
    .local v1, "maxScroll":I
    invoke-direct {p0, v0, v1, v9, p4}, Landroid/support/v7/widget/LinearLayoutManager;->updateLayoutState(IIZLandroid/support/v7/widget/RecyclerView$State;)V

    .line 1728
    iget-object v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iput v7, v5, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mScrollingOffset:I

    .line 1729
    iget-object v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iput-boolean v9, v5, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mRecycle:Z

    .line 1730
    iget-object v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    const/4 v6, 0x1

    invoke-virtual {p0, p3, v5, p4, v6}, Landroid/support/v7/widget/LinearLayoutManager;->fill(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/LinearLayoutManager$LayoutState;Landroid/support/v7/widget/RecyclerView$State;Z)I

    .line 1732
    if-ne v0, v8, :cond_5a

    .line 1733
    invoke-direct {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildClosestToStart()Landroid/view/View;

    move-result-object v2

    .line 1737
    .local v2, "nextFocus":Landroid/view/View;
    :goto_50
    if-eq v2, v3, :cond_58

    invoke-virtual {v2}, Landroid/view/View;->isFocusable()Z

    move-result v5

    if-nez v5, :cond_f

    :cond_58
    move-object v2, v4

    .line 1738
    goto :goto_f

    .line 1735
    .end local v2    # "nextFocus":Landroid/view/View;
    :cond_5a
    invoke-direct {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildClosestToEnd()Landroid/view/View;

    move-result-object v2

    .restart local v2    # "nextFocus":Landroid/view/View;
    goto :goto_50
.end method

.method public onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V
    .registers 4
    .param p1, "event"    # Landroid/view/accessibility/AccessibilityEvent;

    .prologue
    .line 222
    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 223
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildCount()I

    move-result v1

    if-lez v1, :cond_1b

    .line 224
    invoke-static {p1}, Landroid/support/v4/view/accessibility/AccessibilityEventCompat;->asRecord(Landroid/view/accessibility/AccessibilityEvent;)Landroid/support/v4/view/accessibility/AccessibilityRecordCompat;

    move-result-object v0

    .line 226
    .local v0, "record":Landroid/support/v4/view/accessibility/AccessibilityRecordCompat;
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/support/v4/view/accessibility/AccessibilityRecordCompat;->setFromIndex(I)V

    .line 227
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->findLastVisibleItemPosition()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/support/v4/view/accessibility/AccessibilityRecordCompat;->setToIndex(I)V

    .line 229
    .end local v0    # "record":Landroid/support/v4/view/accessibility/AccessibilityRecordCompat;
    :cond_1b
    return-void
.end method

.method public onLayoutChildren(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)V
    .registers 20
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 464
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/LinearLayoutManager$SavedState;

    if-eqz v14, :cond_1a

    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/LinearLayoutManager$SavedState;

    invoke-virtual {v14}, Landroid/support/v7/widget/LinearLayoutManager$SavedState;->hasValidAnchor()Z

    move-result v14

    if-eqz v14, :cond_1a

    .line 465
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/LinearLayoutManager$SavedState;

    iget v14, v14, Landroid/support/v7/widget/LinearLayoutManager$SavedState;->mAnchorPosition:I

    move-object/from16 v0, p0

    iput v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingScrollPosition:I

    .line 468
    :cond_1a
    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/LinearLayoutManager;->ensureLayoutState()V

    .line 469
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    const/4 v15, 0x0

    iput-boolean v15, v14, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mRecycle:Z

    .line 471
    invoke-direct/range {p0 .. p0}, Landroid/support/v7/widget/LinearLayoutManager;->resolveShouldLayoutReverse()V

    .line 473
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mAnchorInfo:Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;

    invoke-virtual {v14}, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->reset()V

    .line 474
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mAnchorInfo:Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;

    move-object/from16 v0, p0

    iget-boolean v15, v0, Landroid/support/v7/widget/LinearLayoutManager;->mShouldReverseLayout:Z

    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/support/v7/widget/LinearLayoutManager;->mStackFromEnd:Z

    move/from16 v16, v0

    xor-int v15, v15, v16

    iput-boolean v15, v14, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mLayoutFromEnd:Z

    .line 476
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mAnchorInfo:Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1, v14}, Landroid/support/v7/widget/LinearLayoutManager;->updateAnchorInfoForLayout(Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;)V

    .line 485
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/LinearLayoutManager;->getExtraLayoutSpace(Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v6

    .line 488
    .local v6, "extra":I
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget v14, v14, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mLastScrollDelta:I

    if-ltz v14, :cond_1c9

    .line 489
    move v7, v6

    .line 490
    .local v7, "extraForEnd":I
    const/4 v8, 0x0

    .line 495
    .local v8, "extraForStart":I
    :goto_5d
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v14}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v14

    add-int/2addr v8, v14

    .line 496
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v14}, Landroid/support/v7/widget/OrientationHelper;->getEndPadding()I

    move-result v14

    add-int/2addr v7, v14

    .line 497
    invoke-virtual/range {p2 .. p2}, Landroid/support/v7/widget/RecyclerView$State;->isPreLayout()Z

    move-result v14

    if-eqz v14, :cond_b1

    move-object/from16 v0, p0

    iget v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingScrollPosition:I

    const/4 v15, -0x1

    if-eq v14, v15, :cond_b1

    move-object/from16 v0, p0

    iget v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingScrollPositionOffset:I

    const/high16 v15, -0x80000000

    if-eq v14, v15, :cond_b1

    .line 502
    move-object/from16 v0, p0

    iget v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingScrollPosition:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Landroid/support/v7/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;

    move-result-object v5

    .line 503
    .local v5, "existing":Landroid/view/View;
    if-eqz v5, :cond_b1

    .line 506
    move-object/from16 v0, p0

    iget-boolean v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mShouldReverseLayout:Z

    if-eqz v14, :cond_1cd

    .line 507
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v14}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v14

    move-object/from16 v0, p0

    iget-object v15, v0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v15, v5}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedEnd(Landroid/view/View;)I

    move-result v15

    sub-int v3, v14, v15

    .line 509
    .local v3, "current":I
    move-object/from16 v0, p0

    iget v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingScrollPositionOffset:I

    sub-int v13, v3, v14

    .line 515
    .local v13, "upcomingOffset":I
    :goto_ae
    if-lez v13, :cond_1e7

    .line 516
    add-int/2addr v8, v13

    .line 524
    .end local v3    # "current":I
    .end local v5    # "existing":Landroid/view/View;
    .end local v13    # "upcomingOffset":I
    :cond_b1
    :goto_b1
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mAnchorInfo:Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1, v14}, Landroid/support/v7/widget/LinearLayoutManager;->onAnchorReady(Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;)V

    .line 525
    invoke-virtual/range {p0 .. p1}, Landroid/support/v7/widget/LinearLayoutManager;->detachAndScrapAttachedViews(Landroid/support/v7/widget/RecyclerView$Recycler;)V

    .line 526
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    invoke-virtual/range {p2 .. p2}, Landroid/support/v7/widget/RecyclerView$State;->isPreLayout()Z

    move-result v15

    iput-boolean v15, v14, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mIsPreLayout:Z

    .line 527
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mAnchorInfo:Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;

    iget-boolean v14, v14, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mLayoutFromEnd:Z

    if-eqz v14, :cond_1ea

    .line 529
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mAnchorInfo:Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;

    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Landroid/support/v7/widget/LinearLayoutManager;->updateLayoutStateToFillStart(Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;)V

    .line 530
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iput v8, v14, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mExtra:I

    .line 531
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    const/4 v15, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-virtual {v0, v1, v14, v2, v15}, Landroid/support/v7/widget/LinearLayoutManager;->fill(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/LinearLayoutManager$LayoutState;Landroid/support/v7/widget/RecyclerView$State;Z)I

    .line 532
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget v12, v14, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mOffset:I

    .line 533
    .local v12, "startOffset":I
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget v9, v14, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mCurrentPosition:I

    .line 534
    .local v9, "firstElement":I
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget v14, v14, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mAvailable:I

    if-lez v14, :cond_109

    .line 535
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget v14, v14, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mAvailable:I

    add-int/2addr v7, v14

    .line 538
    :cond_109
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mAnchorInfo:Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;

    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Landroid/support/v7/widget/LinearLayoutManager;->updateLayoutStateToFillEnd(Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;)V

    .line 539
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iput v7, v14, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mExtra:I

    .line 540
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget v15, v14, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mCurrentPosition:I

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget v0, v0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mItemDirection:I

    move/from16 v16, v0

    add-int v15, v15, v16

    iput v15, v14, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mCurrentPosition:I

    .line 541
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    const/4 v15, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-virtual {v0, v1, v14, v2, v15}, Landroid/support/v7/widget/LinearLayoutManager;->fill(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/LinearLayoutManager$LayoutState;Landroid/support/v7/widget/RecyclerView$State;Z)I

    .line 542
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget v4, v14, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mOffset:I

    .line 544
    .local v4, "endOffset":I
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget v14, v14, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mAvailable:I

    if-lez v14, :cond_16f

    .line 546
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget v8, v14, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mAvailable:I

    .line 547
    move-object/from16 v0, p0

    invoke-direct {v0, v9, v12}, Landroid/support/v7/widget/LinearLayoutManager;->updateLayoutStateToFillStart(II)V

    .line 548
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iput v8, v14, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mExtra:I

    .line 549
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    const/4 v15, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-virtual {v0, v1, v14, v2, v15}, Landroid/support/v7/widget/LinearLayoutManager;->fill(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/LinearLayoutManager$LayoutState;Landroid/support/v7/widget/RecyclerView$State;Z)I

    .line 550
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget v12, v14, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mOffset:I

    .line 582
    .end local v9    # "firstElement":I
    :cond_16f
    :goto_16f
    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildCount()I

    move-result v14

    if-lez v14, :cond_19a

    .line 586
    move-object/from16 v0, p0

    iget-boolean v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mShouldReverseLayout:Z

    move-object/from16 v0, p0

    iget-boolean v15, v0, Landroid/support/v7/widget/LinearLayoutManager;->mStackFromEnd:Z

    xor-int/2addr v14, v15

    if-eqz v14, :cond_28a

    .line 587
    const/4 v14, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-direct {v0, v4, v1, v2, v14}, Landroid/support/v7/widget/LinearLayoutManager;->fixLayoutEndGap(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;Z)I

    move-result v10

    .line 588
    .local v10, "fixOffset":I
    add-int/2addr v12, v10

    .line 589
    add-int/2addr v4, v10

    .line 590
    const/4 v14, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-direct {v0, v12, v1, v2, v14}, Landroid/support/v7/widget/LinearLayoutManager;->fixLayoutStartGap(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;Z)I

    move-result v10

    .line 591
    add-int/2addr v12, v10

    .line 592
    add-int/2addr v4, v10

    .line 602
    .end local v10    # "fixOffset":I
    :cond_19a
    :goto_19a
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-direct {v0, v1, v2, v12, v4}, Landroid/support/v7/widget/LinearLayoutManager;->layoutForPredictiveAnimations(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;II)V

    .line 603
    invoke-virtual/range {p2 .. p2}, Landroid/support/v7/widget/RecyclerView$State;->isPreLayout()Z

    move-result v14

    if-nez v14, :cond_1bb

    .line 604
    const/4 v14, -0x1

    move-object/from16 v0, p0

    iput v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingScrollPosition:I

    .line 605
    const/high16 v14, -0x80000000

    move-object/from16 v0, p0

    iput v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingScrollPositionOffset:I

    .line 606
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v14}, Landroid/support/v7/widget/OrientationHelper;->onLayoutComplete()V

    .line 608
    :cond_1bb
    move-object/from16 v0, p0

    iget-boolean v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mStackFromEnd:Z

    move-object/from16 v0, p0

    iput-boolean v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mLastStackFromEnd:Z

    .line 609
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput-object v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/LinearLayoutManager$SavedState;

    .line 613
    return-void

    .line 492
    .end local v4    # "endOffset":I
    .end local v7    # "extraForEnd":I
    .end local v8    # "extraForStart":I
    .end local v12    # "startOffset":I
    :cond_1c9
    move v8, v6

    .line 493
    .restart local v8    # "extraForStart":I
    const/4 v7, 0x0

    .restart local v7    # "extraForEnd":I
    goto/16 :goto_5d

    .line 511
    .restart local v5    # "existing":Landroid/view/View;
    :cond_1cd
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v14, v5}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v14

    move-object/from16 v0, p0

    iget-object v15, v0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v15}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v15

    sub-int v3, v14, v15

    .line 513
    .restart local v3    # "current":I
    move-object/from16 v0, p0

    iget v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingScrollPositionOffset:I

    sub-int v13, v14, v3

    .restart local v13    # "upcomingOffset":I
    goto/16 :goto_ae

    .line 518
    :cond_1e7
    sub-int/2addr v7, v13

    goto/16 :goto_b1

    .line 554
    .end local v3    # "current":I
    .end local v5    # "existing":Landroid/view/View;
    .end local v13    # "upcomingOffset":I
    :cond_1ea
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mAnchorInfo:Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;

    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Landroid/support/v7/widget/LinearLayoutManager;->updateLayoutStateToFillEnd(Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;)V

    .line 555
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iput v7, v14, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mExtra:I

    .line 556
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    const/4 v15, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-virtual {v0, v1, v14, v2, v15}, Landroid/support/v7/widget/LinearLayoutManager;->fill(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/LinearLayoutManager$LayoutState;Landroid/support/v7/widget/RecyclerView$State;Z)I

    .line 557
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget v4, v14, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mOffset:I

    .line 558
    .restart local v4    # "endOffset":I
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget v11, v14, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mCurrentPosition:I

    .line 559
    .local v11, "lastElement":I
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget v14, v14, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mAvailable:I

    if-lez v14, :cond_222

    .line 560
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget v14, v14, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mAvailable:I

    add-int/2addr v8, v14

    .line 563
    :cond_222
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mAnchorInfo:Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;

    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Landroid/support/v7/widget/LinearLayoutManager;->updateLayoutStateToFillStart(Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;)V

    .line 564
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iput v8, v14, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mExtra:I

    .line 565
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget v15, v14, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mCurrentPosition:I

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget v0, v0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mItemDirection:I

    move/from16 v16, v0

    add-int v15, v15, v16

    iput v15, v14, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mCurrentPosition:I

    .line 566
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    const/4 v15, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-virtual {v0, v1, v14, v2, v15}, Landroid/support/v7/widget/LinearLayoutManager;->fill(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/LinearLayoutManager$LayoutState;Landroid/support/v7/widget/RecyclerView$State;Z)I

    .line 567
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget v12, v14, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mOffset:I

    .line 569
    .restart local v12    # "startOffset":I
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget v14, v14, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mAvailable:I

    if-lez v14, :cond_16f

    .line 570
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget v7, v14, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mAvailable:I

    .line 572
    move-object/from16 v0, p0

    invoke-direct {v0, v11, v4}, Landroid/support/v7/widget/LinearLayoutManager;->updateLayoutStateToFillEnd(II)V

    .line 573
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iput v7, v14, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mExtra:I

    .line 574
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    const/4 v15, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-virtual {v0, v1, v14, v2, v15}, Landroid/support/v7/widget/LinearLayoutManager;->fill(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/LinearLayoutManager$LayoutState;Landroid/support/v7/widget/RecyclerView$State;Z)I

    .line 575
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget v4, v14, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mOffset:I

    goto/16 :goto_16f

    .line 594
    .end local v11    # "lastElement":I
    :cond_28a
    const/4 v14, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-direct {v0, v12, v1, v2, v14}, Landroid/support/v7/widget/LinearLayoutManager;->fixLayoutStartGap(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;Z)I

    move-result v10

    .line 595
    .restart local v10    # "fixOffset":I
    add-int/2addr v12, v10

    .line 596
    add-int/2addr v4, v10

    .line 597
    const/4 v14, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-direct {v0, v4, v1, v2, v14}, Landroid/support/v7/widget/LinearLayoutManager;->fixLayoutEndGap(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;Z)I

    move-result v10

    .line 598
    add-int/2addr v12, v10

    .line 599
    add-int/2addr v4, v10

    goto/16 :goto_19a
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 3
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    .line 260
    instance-of v0, p1, Landroid/support/v7/widget/LinearLayoutManager$SavedState;

    if-eqz v0, :cond_b

    .line 261
    check-cast p1, Landroid/support/v7/widget/LinearLayoutManager$SavedState;

    .end local p1    # "state":Landroid/os/Parcelable;
    iput-object p1, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/LinearLayoutManager$SavedState;

    .line 262
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->requestLayout()V

    .line 269
    :cond_b
    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .registers 6

    .prologue
    .line 233
    iget-object v3, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/LinearLayoutManager$SavedState;

    if-eqz v3, :cond_c

    .line 234
    new-instance v2, Landroid/support/v7/widget/LinearLayoutManager$SavedState;

    iget-object v3, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/LinearLayoutManager$SavedState;

    invoke-direct {v2, v3}, Landroid/support/v7/widget/LinearLayoutManager$SavedState;-><init>(Landroid/support/v7/widget/LinearLayoutManager$SavedState;)V

    .line 255
    :goto_b
    return-object v2

    .line 236
    :cond_c
    new-instance v2, Landroid/support/v7/widget/LinearLayoutManager$SavedState;

    invoke-direct {v2}, Landroid/support/v7/widget/LinearLayoutManager$SavedState;-><init>()V

    .line 237
    .local v2, "state":Landroid/support/v7/widget/LinearLayoutManager$SavedState;
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildCount()I

    move-result v3

    if-lez v3, :cond_58

    .line 238
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->ensureLayoutState()V

    .line 239
    iget-boolean v3, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLastStackFromEnd:Z

    iget-boolean v4, p0, Landroid/support/v7/widget/LinearLayoutManager;->mShouldReverseLayout:Z

    xor-int v0, v3, v4

    .line 240
    .local v0, "didLayoutFromEnd":Z
    iput-boolean v0, v2, Landroid/support/v7/widget/LinearLayoutManager$SavedState;->mAnchorLayoutFromEnd:Z

    .line 241
    if-eqz v0, :cond_3e

    .line 242
    invoke-direct {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildClosestToEnd()Landroid/view/View;

    move-result-object v1

    .line 243
    .local v1, "refChild":Landroid/view/View;
    iget-object v3, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v3}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v3

    iget-object v4, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4, v1}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedEnd(Landroid/view/View;)I

    move-result v4

    sub-int/2addr v3, v4

    iput v3, v2, Landroid/support/v7/widget/LinearLayoutManager$SavedState;->mAnchorOffset:I

    .line 245
    invoke-virtual {p0, v1}, Landroid/support/v7/widget/LinearLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v3

    iput v3, v2, Landroid/support/v7/widget/LinearLayoutManager$SavedState;->mAnchorPosition:I

    goto :goto_b

    .line 247
    .end local v1    # "refChild":Landroid/view/View;
    :cond_3e
    invoke-direct {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildClosestToStart()Landroid/view/View;

    move-result-object v1

    .line 248
    .restart local v1    # "refChild":Landroid/view/View;
    invoke-virtual {p0, v1}, Landroid/support/v7/widget/LinearLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v3

    iput v3, v2, Landroid/support/v7/widget/LinearLayoutManager$SavedState;->mAnchorPosition:I

    .line 249
    iget-object v3, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v3, v1}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v3

    iget-object v4, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v4

    sub-int/2addr v3, v4

    iput v3, v2, Landroid/support/v7/widget/LinearLayoutManager$SavedState;->mAnchorOffset:I

    goto :goto_b

    .line 253
    .end local v0    # "didLayoutFromEnd":Z
    .end local v1    # "refChild":Landroid/view/View;
    :cond_58
    invoke-virtual {v2}, Landroid/support/v7/widget/LinearLayoutManager$SavedState;->invalidateAnchor()V

    goto :goto_b
.end method

.method public prepareForDrop(Landroid/view/View;Landroid/view/View;II)V
    .registers 11
    .param p1, "view"    # Landroid/view/View;
    .param p2, "target"    # Landroid/view/View;
    .param p3, "x"    # I
    .param p4, "y"    # I

    .prologue
    const/4 v3, 0x1

    const/4 v4, -0x1

    .line 1817
    const-string v5, "Cannot drop a view during a scroll or layout calculation"

    invoke-virtual {p0, v5}, Landroid/support/v7/widget/LinearLayoutManager;->assertNotInLayoutOrScroll(Ljava/lang/String;)V

    .line 1818
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->ensureLayoutState()V

    .line 1819
    invoke-direct {p0}, Landroid/support/v7/widget/LinearLayoutManager;->resolveShouldLayoutReverse()V

    .line 1820
    invoke-virtual {p0, p1}, Landroid/support/v7/widget/LinearLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v1

    .line 1821
    .local v1, "myPos":I
    invoke-virtual {p0, p2}, Landroid/support/v7/widget/LinearLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v2

    .line 1822
    .local v2, "targetPos":I
    if-ge v1, v2, :cond_36

    move v0, v3

    .line 1824
    .local v0, "dropDirection":I
    :goto_18
    iget-boolean v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mShouldReverseLayout:Z

    if-eqz v5, :cond_49

    .line 1825
    if-ne v0, v3, :cond_38

    .line 1826
    iget-object v3, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v3}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v3

    iget-object v4, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4, p2}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v4

    iget-object v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v5, p1}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedMeasurement(Landroid/view/View;)I

    move-result v5

    add-int/2addr v4, v5

    sub-int/2addr v3, v4

    invoke-virtual {p0, v2, v3}, Landroid/support/v7/widget/LinearLayoutManager;->scrollToPositionWithOffset(II)V

    .line 1844
    :goto_35
    return-void

    .end local v0    # "dropDirection":I
    :cond_36
    move v0, v4

    .line 1822
    goto :goto_18

    .line 1831
    .restart local v0    # "dropDirection":I
    :cond_38
    iget-object v3, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v3}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v3

    iget-object v4, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4, p2}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedEnd(Landroid/view/View;)I

    move-result v4

    sub-int/2addr v3, v4

    invoke-virtual {p0, v2, v3}, Landroid/support/v7/widget/LinearLayoutManager;->scrollToPositionWithOffset(II)V

    goto :goto_35

    .line 1836
    :cond_49
    if-ne v0, v4, :cond_55

    .line 1837
    iget-object v3, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v3, p2}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v3

    invoke-virtual {p0, v2, v3}, Landroid/support/v7/widget/LinearLayoutManager;->scrollToPositionWithOffset(II)V

    goto :goto_35

    .line 1839
    :cond_55
    iget-object v3, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v3, p2}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedEnd(Landroid/view/View;)I

    move-result v3

    iget-object v4, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4, p1}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedMeasurement(Landroid/view/View;)I

    move-result v4

    sub-int/2addr v3, v4

    invoke-virtual {p0, v2, v3}, Landroid/support/v7/widget/LinearLayoutManager;->scrollToPositionWithOffset(II)V

    goto :goto_35
.end method

.method scrollBy(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 11
    .param p1, "dy"    # I
    .param p2, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p3, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 1141
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildCount()I

    move-result v6

    if-eqz v6, :cond_a

    if-nez p1, :cond_b

    .line 1163
    :cond_a
    :goto_a
    return v4

    .line 1144
    :cond_b
    iget-object v6, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iput-boolean v5, v6, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mRecycle:Z

    .line 1145
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->ensureLayoutState()V

    .line 1146
    if-lez p1, :cond_39

    move v3, v5

    .line 1147
    .local v3, "layoutDirection":I
    :goto_15
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result v0

    .line 1148
    .local v0, "absDy":I
    invoke-direct {p0, v3, v0, v5, p3}, Landroid/support/v7/widget/LinearLayoutManager;->updateLayoutState(IIZLandroid/support/v7/widget/RecyclerView$State;)V

    .line 1149
    iget-object v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iget v2, v5, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mScrollingOffset:I

    .line 1150
    .local v2, "freeScroll":I
    iget-object v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    invoke-virtual {p0, p2, v5, p3, v4}, Landroid/support/v7/widget/LinearLayoutManager;->fill(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/LinearLayoutManager$LayoutState;Landroid/support/v7/widget/RecyclerView$State;Z)I

    move-result v5

    add-int v1, v2, v5

    .line 1151
    .local v1, "consumed":I
    if-ltz v1, :cond_a

    .line 1157
    if-le v0, v1, :cond_3b

    mul-int v4, v3, v1

    .line 1158
    .local v4, "scrolled":I
    :goto_2e
    iget-object v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    neg-int v6, v4

    invoke-virtual {v5, v6}, Landroid/support/v7/widget/OrientationHelper;->offsetChildren(I)V

    .line 1162
    iget-object v5, p0, Landroid/support/v7/widget/LinearLayoutManager;->mLayoutState:Landroid/support/v7/widget/LinearLayoutManager$LayoutState;

    iput v4, v5, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mLastScrollDelta:I

    goto :goto_a

    .line 1146
    .end local v0    # "absDy":I
    .end local v1    # "consumed":I
    .end local v2    # "freeScroll":I
    .end local v3    # "layoutDirection":I
    .end local v4    # "scrolled":I
    :cond_39
    const/4 v3, -0x1

    goto :goto_15

    .restart local v0    # "absDy":I
    .restart local v1    # "consumed":I
    .restart local v2    # "freeScroll":I
    .restart local v3    # "layoutDirection":I
    :cond_3b
    move v4, p1

    .line 1157
    goto :goto_2e
.end method

.method public scrollHorizontallyBy(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 6
    .param p1, "dx"    # I
    .param p2, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p3, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 992
    iget v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientation:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_7

    .line 993
    const/4 v0, 0x0

    .line 995
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
    .line 949
    iput p1, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingScrollPosition:I

    .line 950
    const/high16 v0, -0x80000000

    iput v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingScrollPositionOffset:I

    .line 951
    iget-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/LinearLayoutManager$SavedState;

    if-eqz v0, :cond_f

    .line 952
    iget-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/LinearLayoutManager$SavedState;

    invoke-virtual {v0}, Landroid/support/v7/widget/LinearLayoutManager$SavedState;->invalidateAnchor()V

    .line 954
    :cond_f
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->requestLayout()V

    .line 955
    return-void
.end method

.method public scrollToPositionWithOffset(II)V
    .registers 4
    .param p1, "position"    # I
    .param p2, "offset"    # I

    .prologue
    .line 977
    iput p1, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingScrollPosition:I

    .line 978
    iput p2, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingScrollPositionOffset:I

    .line 979
    iget-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/LinearLayoutManager$SavedState;

    if-eqz v0, :cond_d

    .line 980
    iget-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/LinearLayoutManager$SavedState;

    invoke-virtual {v0}, Landroid/support/v7/widget/LinearLayoutManager$SavedState;->invalidateAnchor()V

    .line 982
    :cond_d
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->requestLayout()V

    .line 983
    return-void
.end method

.method public scrollVerticallyBy(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 5
    .param p1, "dy"    # I
    .param p2, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p3, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 1004
    iget v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientation:I

    if-nez v0, :cond_6

    .line 1005
    const/4 v0, 0x0

    .line 1007
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

    .line 321
    if-eqz p1, :cond_1f

    const/4 v0, 0x1

    if-eq p1, v0, :cond_1f

    .line 322
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

    .line 324
    :cond_1f
    invoke-virtual {p0, v1}, Landroid/support/v7/widget/LinearLayoutManager;->assertNotInLayoutOrScroll(Ljava/lang/String;)V

    .line 325
    iget v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientation:I

    if-ne p1, v0, :cond_27

    .line 331
    :goto_26
    return-void

    .line 328
    :cond_27
    iput p1, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientation:I

    .line 329
    iput-object v1, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    .line 330
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->requestLayout()V

    goto :goto_26
.end method

.method public setRecycleChildrenOnDetach(Z)V
    .registers 2
    .param p1, "recycleChildrenOnDetach"    # Z

    .prologue
    .line 208
    iput-boolean p1, p0, Landroid/support/v7/widget/LinearLayoutManager;->mRecycleChildrenOnDetach:Z

    .line 209
    return-void
.end method

.method public setReverseLayout(Z)V
    .registers 3
    .param p1, "reverseLayout"    # Z

    .prologue
    .line 372
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/LinearLayoutManager;->assertNotInLayoutOrScroll(Ljava/lang/String;)V

    .line 373
    iget-boolean v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mReverseLayout:Z

    if-ne p1, v0, :cond_9

    .line 378
    :goto_8
    return-void

    .line 376
    :cond_9
    iput-boolean p1, p0, Landroid/support/v7/widget/LinearLayoutManager;->mReverseLayout:Z

    .line 377
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->requestLayout()V

    goto :goto_8
.end method

.method public setSmoothScrollbarEnabled(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 1091
    iput-boolean p1, p0, Landroid/support/v7/widget/LinearLayoutManager;->mSmoothScrollbarEnabled:Z

    .line 1092
    return-void
.end method

.method public setStackFromEnd(Z)V
    .registers 3
    .param p1, "stackFromEnd"    # Z

    .prologue
    .line 291
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/LinearLayoutManager;->assertNotInLayoutOrScroll(Ljava/lang/String;)V

    .line 292
    iget-boolean v0, p0, Landroid/support/v7/widget/LinearLayoutManager;->mStackFromEnd:Z

    if-ne v0, p1, :cond_9

    .line 297
    :goto_8
    return-void

    .line 295
    :cond_9
    iput-boolean p1, p0, Landroid/support/v7/widget/LinearLayoutManager;->mStackFromEnd:Z

    .line 296
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->requestLayout()V

    goto :goto_8
.end method

.method public smoothScrollToPosition(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;I)V
    .registers 6
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p3, "position"    # I

    .prologue
    .line 424
    new-instance v0, Landroid/support/v7/widget/LinearLayoutManager$1;

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Landroid/support/v7/widget/LinearLayoutManager$1;-><init>(Landroid/support/v7/widget/LinearLayoutManager;Landroid/content/Context;)V

    .line 432
    .local v0, "linearSmoothScroller":Landroid/support/v7/widget/LinearSmoothScroller;
    invoke-virtual {v0, p3}, Landroid/support/v7/widget/LinearSmoothScroller;->setTargetPosition(I)V

    .line 433
    invoke-virtual {p0, v0}, Landroid/support/v7/widget/LinearLayoutManager;->startSmoothScroll(Landroid/support/v7/widget/RecyclerView$SmoothScroller;)V

    .line 434
    return-void
.end method

.method public supportsPredictiveItemAnimations()Z
    .registers 3

    .prologue
    .line 1809
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

    .line 1768
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

    .line 1769
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildCount()I

    move-result v8

    if-ge v8, v6, :cond_25

    .line 1805
    :cond_24
    return-void

    .line 1772
    :cond_25
    invoke-virtual {p0, v7}, Landroid/support/v7/widget/LinearLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    invoke-virtual {p0, v8}, Landroid/support/v7/widget/LinearLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v2

    .line 1773
    .local v2, "lastPos":I
    iget-object v8, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {p0, v7}, Landroid/support/v7/widget/LinearLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v3

    .line 1774
    .local v3, "lastScreenLoc":I
    iget-boolean v8, p0, Landroid/support/v7/widget/LinearLayoutManager;->mShouldReverseLayout:Z

    if-eqz v8, :cond_82

    .line 1775
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_3c
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearLayoutManager;->getChildCount()I

    move-result v8

    if-ge v1, v8, :cond_24

    .line 1776
    invoke-virtual {p0, v1}, Landroid/support/v7/widget/LinearLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 1777
    .local v0, "child":Landroid/view/View;
    invoke-virtual {p0, v0}, Landroid/support/v7/widget/LinearLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v4

    .line 1778
    .local v4, "pos":I
    iget-object v8, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v8, v0}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v5

    .line 1779
    .local v5, "screenLoc":I
    if-ge v4, v2, :cond_72

    .line 1780
    invoke-direct {p0}, Landroid/support/v7/widget/LinearLayoutManager;->logChildren()V

    .line 1781
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

    .line 1784
    :cond_72
    if-le v5, v3, :cond_7f

    .line 1785
    invoke-direct {p0}, Landroid/support/v7/widget/LinearLayoutManager;->logChildren()V

    .line 1786
    new-instance v6, Ljava/lang/RuntimeException;

    const-string v7, "detected invalid location"

    invoke-direct {v6, v7}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 1775
    :cond_7f
    add-int/lit8 v1, v1, 0x1

    goto :goto_3c

    .line 1790
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

    .line 1791
    invoke-virtual {p0, v1}, Landroid/support/v7/widget/LinearLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 1792
    .restart local v0    # "child":Landroid/view/View;
    invoke-virtual {p0, v0}, Landroid/support/v7/widget/LinearLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v4

    .line 1793
    .restart local v4    # "pos":I
    iget-object v8, p0, Landroid/support/v7/widget/LinearLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v8, v0}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v5

    .line 1794
    .restart local v5    # "screenLoc":I
    if-ge v4, v2, :cond_b9

    .line 1795
    invoke-direct {p0}, Landroid/support/v7/widget/LinearLayoutManager;->logChildren()V

    .line 1796
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

    .line 1799
    :cond_b9
    if-ge v5, v3, :cond_c6

    .line 1800
    invoke-direct {p0}, Landroid/support/v7/widget/LinearLayoutManager;->logChildren()V

    .line 1801
    new-instance v6, Ljava/lang/RuntimeException;

    const-string v7, "detected invalid location"

    invoke-direct {v6, v7}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 1790
    :cond_c6
    add-int/lit8 v1, v1, 0x1

    goto :goto_83
.end method
