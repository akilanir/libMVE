.class public Landroid/support/v7/widget/StaggeredGridLayoutManager;
.super Landroid/support/v7/widget/RecyclerView$LayoutManager;
.source "StaggeredGridLayoutManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;,
        Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;,
        Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;,
        Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;,
        Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;
    }
.end annotation


# static fields
.field private static final DEBUG:Z = false

.field public static final GAP_HANDLING_LAZY:I = 0x1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final GAP_HANDLING_MOVE_ITEMS_BETWEEN_SPANS:I = 0x2

.field public static final GAP_HANDLING_NONE:I = 0x0

.field public static final HORIZONTAL:I = 0x0

.field private static final INVALID_OFFSET:I = -0x80000000

.field public static final TAG:Ljava/lang/String; = "StaggeredGridLayoutManager"

.field public static final VERTICAL:I = 0x1


# instance fields
.field private final checkForGapsRunnable:Ljava/lang/Runnable;

.field private final mAnchorInfo:Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;

.field private mFullSizeSpec:I

.field private mGapStrategy:I

.field private mHeightSpec:I

.field private mLaidOutInvalidFullSpan:Z

.field private mLastLayoutFromEnd:Z

.field private mLastLayoutRTL:Z

.field private mLayoutState:Landroid/support/v7/widget/LayoutState;

.field mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

.field private mOrientation:I

.field private mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

.field mPendingScrollPosition:I

.field mPendingScrollPositionOffset:I

.field mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

.field private mRemainingSpans:Ljava/util/BitSet;

.field private mReverseLayout:Z

.field mSecondaryOrientation:Landroid/support/v7/widget/OrientationHelper;

.field mShouldReverseLayout:Z

.field private mSizePerSpan:I

.field private mSmoothScrollbarEnabled:Z

.field private mSpanCount:I

.field private mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

.field private mWidthSpec:I


# direct methods
.method public constructor <init>(II)V
    .registers 6
    .param p1, "spanCount"    # I
    .param p2, "orientation"    # I

    .prologue
    const/4 v0, -0x1

    const/4 v2, 0x0

    .line 205
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$LayoutManager;-><init>()V

    .line 96
    iput v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    .line 116
    iput-boolean v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mReverseLayout:Z

    .line 121
    iput-boolean v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    .line 132
    iput v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPosition:I

    .line 138
    const/high16 v0, -0x80000000

    iput v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPositionOffset:I

    .line 144
    new-instance v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-direct {v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    .line 149
    const/4 v0, 0x2

    iput v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mGapStrategy:I

    .line 175
    new-instance v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;-><init>(Landroid/support/v7/widget/StaggeredGridLayoutManager;Landroid/support/v7/widget/StaggeredGridLayoutManager$1;)V

    iput-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mAnchorInfo:Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;

    .line 183
    iput-boolean v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLaidOutInvalidFullSpan:Z

    .line 189
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSmoothScrollbarEnabled:Z

    .line 191
    new-instance v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$1;

    invoke-direct {v0, p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$1;-><init>(Landroid/support/v7/widget/StaggeredGridLayoutManager;)V

    iput-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->checkForGapsRunnable:Ljava/lang/Runnable;

    .line 206
    iput p2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mOrientation:I

    .line 207
    invoke-virtual {p0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->setSpanCount(I)V

    .line 208
    return-void
.end method

.method static synthetic access$100(Landroid/support/v7/widget/StaggeredGridLayoutManager;)V
    .registers 1
    .param p0, "x0"    # Landroid/support/v7/widget/StaggeredGridLayoutManager;

    .prologue
    .line 53
    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->checkForGaps()V

    return-void
.end method

.method static synthetic access$400(Landroid/support/v7/widget/StaggeredGridLayoutManager;I)I
    .registers 3
    .param p0, "x0"    # Landroid/support/v7/widget/StaggeredGridLayoutManager;
    .param p1, "x1"    # I

    .prologue
    .line 53
    invoke-direct {p0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->calculateScrollDirectionForPosition(I)I

    move-result v0

    return v0
.end method

.method static synthetic access$500(Landroid/support/v7/widget/StaggeredGridLayoutManager;)I
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/widget/StaggeredGridLayoutManager;

    .prologue
    .line 53
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mOrientation:I

    return v0
.end method

.method static synthetic access$600(Landroid/support/v7/widget/StaggeredGridLayoutManager;)Z
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/widget/StaggeredGridLayoutManager;

    .prologue
    .line 53
    iget-boolean v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mReverseLayout:Z

    return v0
.end method

.method private appendViewToAllSpans(Landroid/view/View;)V
    .registers 4
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 1472
    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    add-int/lit8 v0, v1, -0x1

    .local v0, "i":I
    :goto_4
    if-ltz v0, :cond_10

    .line 1473
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v1, v1, v0

    invoke-virtual {v1, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->appendToSpan(Landroid/view/View;)V

    .line 1472
    add-int/lit8 v0, v0, -0x1

    goto :goto_4

    .line 1475
    :cond_10
    return-void
.end method

.method private applyPendingSavedState(Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;)V
    .registers 6
    .param p1, "anchorInfo"    # Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;

    .prologue
    .line 620
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget v2, v2, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mSpanOffsetsSize:I

    if-lez v2, :cond_50

    .line 621
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget v2, v2, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mSpanOffsetsSize:I

    iget v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ne v2, v3, :cond_43

    .line 622
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_f
    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v0, v2, :cond_50

    .line 623
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v2, v2, v0

    invoke-virtual {v2}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->clear()V

    .line 624
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget-object v2, v2, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mSpanOffsets:[I

    aget v1, v2, v0

    .line 625
    .local v1, "line":I
    const/high16 v2, -0x80000000

    if-eq v1, v2, :cond_31

    .line 626
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget-boolean v2, v2, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mAnchorLayoutFromEnd:Z

    if-eqz v2, :cond_3b

    .line 627
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v2}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v2

    add-int/2addr v1, v2

    .line 632
    :cond_31
    :goto_31
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v2, v2, v0

    invoke-virtual {v2, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->setLine(I)V

    .line 622
    add-int/lit8 v0, v0, 0x1

    goto :goto_f

    .line 629
    :cond_3b
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v2}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v2

    add-int/2addr v1, v2

    goto :goto_31

    .line 635
    .end local v0    # "i":I
    .end local v1    # "line":I
    :cond_43
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    invoke-virtual {v2}, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->invalidateSpanInfo()V

    .line 636
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget v3, v3, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mVisibleAnchorPosition:I

    iput v3, v2, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mAnchorPosition:I

    .line 639
    :cond_50
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget-boolean v2, v2, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mLastLayoutRTL:Z

    iput-boolean v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLastLayoutRTL:Z

    .line 640
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget-boolean v2, v2, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mReverseLayout:Z

    invoke-virtual {p0, v2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->setReverseLayout(Z)V

    .line 641
    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->resolveShouldLayoutReverse()V

    .line 643
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget v2, v2, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mAnchorPosition:I

    const/4 v3, -0x1

    if-eq v2, v3, :cond_8b

    .line 644
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget v2, v2, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mAnchorPosition:I

    iput v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPosition:I

    .line 645
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget-boolean v2, v2, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mAnchorLayoutFromEnd:Z

    iput-boolean v2, p1, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mLayoutFromEnd:Z

    .line 649
    :goto_73
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget v2, v2, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mSpanLookupSize:I

    const/4 v3, 0x1

    if-le v2, v3, :cond_8a

    .line 650
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget-object v3, v3, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mSpanLookup:[I

    iput-object v3, v2, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->mData:[I

    .line 651
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget-object v3, v3, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mFullSpanItems:Ljava/util/List;

    iput-object v3, v2, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->mFullSpanItems:Ljava/util/List;

    .line 653
    :cond_8a
    return-void

    .line 647
    :cond_8b
    iget-boolean v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    iput-boolean v2, p1, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mLayoutFromEnd:Z

    goto :goto_73
.end method

.method private attachViewToSpans(Landroid/view/View;Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;Landroid/support/v7/widget/LayoutState;)V
    .registers 6
    .param p1, "view"    # Landroid/view/View;
    .param p2, "lp"    # Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;
    .param p3, "layoutState"    # Landroid/support/v7/widget/LayoutState;

    .prologue
    .line 1440
    iget v0, p3, Landroid/support/v7/widget/LayoutState;->mLayoutDirection:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_13

    .line 1441
    iget-boolean v0, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mFullSpan:Z

    if-eqz v0, :cond_d

    .line 1442
    invoke-direct {p0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->appendViewToAllSpans(Landroid/view/View;)V

    .line 1453
    :goto_c
    return-void

    .line 1444
    :cond_d
    iget-object v0, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mSpan:Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->appendToSpan(Landroid/view/View;)V

    goto :goto_c

    .line 1447
    :cond_13
    iget-boolean v0, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mFullSpan:Z

    if-eqz v0, :cond_1b

    .line 1448
    invoke-direct {p0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->prependViewToAllSpans(Landroid/view/View;)V

    goto :goto_c

    .line 1450
    :cond_1b
    iget-object v0, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mSpan:Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->prependToSpan(Landroid/view/View;)V

    goto :goto_c
.end method

.method private calculateScrollDirectionForPosition(I)I
    .registers 7
    .param p1, "position"    # I

    .prologue
    const/4 v2, -0x1

    const/4 v1, 0x1

    .line 1684
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildCount()I

    move-result v3

    if-nez v3, :cond_f

    .line 1685
    iget-boolean v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    if-eqz v3, :cond_d

    .line 1688
    :goto_c
    return v1

    :cond_d
    move v1, v2

    .line 1685
    goto :goto_c

    .line 1687
    :cond_f
    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getFirstChildPosition()I

    move-result v0

    .line 1688
    .local v0, "firstChildPos":I
    if-ge p1, v0, :cond_1c

    move v3, v1

    :goto_16
    iget-boolean v4, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    if-eq v3, v4, :cond_1e

    :goto_1a
    move v1, v2

    goto :goto_c

    :cond_1c
    const/4 v3, 0x0

    goto :goto_16

    :cond_1e
    move v2, v1

    goto :goto_1a
.end method

.method private checkForGaps()V
    .registers 10

    .prologue
    .line 217
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildCount()I

    move-result v6

    if-eqz v6, :cond_a

    iget v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mGapStrategy:I

    if-nez v6, :cond_b

    .line 258
    :cond_a
    :goto_a
    return-void

    .line 221
    :cond_b
    iget-boolean v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    if-eqz v6, :cond_2b

    .line 222
    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getLastChildPosition()I

    move-result v4

    .line 223
    .local v4, "minPos":I
    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getFirstChildPosition()I

    move-result v3

    .line 228
    .local v3, "maxPos":I
    :goto_17
    if-nez v4, :cond_34

    .line 229
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->hasGapsToFix()Landroid/view/View;

    move-result-object v0

    .line 230
    .local v0, "gapView":Landroid/view/View;
    if-eqz v0, :cond_34

    .line 231
    iget-object v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-virtual {v6}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->clear()V

    .line 232
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->requestSimpleAnimationsInNextLayout()V

    .line 233
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->requestLayout()V

    goto :goto_a

    .line 225
    .end local v0    # "gapView":Landroid/view/View;
    .end local v3    # "maxPos":I
    .end local v4    # "minPos":I
    :cond_2b
    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getFirstChildPosition()I

    move-result v4

    .line 226
    .restart local v4    # "minPos":I
    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getLastChildPosition()I

    move-result v3

    .restart local v3    # "maxPos":I
    goto :goto_17

    .line 237
    :cond_34
    iget-boolean v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLaidOutInvalidFullSpan:Z

    if-eqz v6, :cond_a

    .line 240
    iget-boolean v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    if-eqz v6, :cond_52

    const/4 v2, -0x1

    .line 241
    .local v2, "invalidGapDir":I
    :goto_3d
    iget-object v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    add-int/lit8 v7, v3, 0x1

    invoke-virtual {v6, v4, v7, v2}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->getFirstFullSpanItemInRange(III)Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;

    move-result-object v1

    .line 243
    .local v1, "invalidFsi":Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;
    if-nez v1, :cond_54

    .line 244
    const/4 v6, 0x0

    iput-boolean v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLaidOutInvalidFullSpan:Z

    .line 245
    iget-object v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    add-int/lit8 v7, v3, 0x1

    invoke-virtual {v6, v7}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->forceInvalidateAfter(I)I

    goto :goto_a

    .line 240
    .end local v1    # "invalidFsi":Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;
    .end local v2    # "invalidGapDir":I
    :cond_52
    const/4 v2, 0x1

    goto :goto_3d

    .line 248
    .restart local v1    # "invalidFsi":Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;
    .restart local v2    # "invalidGapDir":I
    :cond_54
    iget-object v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    iget v7, v1, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->mPosition:I

    mul-int/lit8 v8, v2, -0x1

    invoke-virtual {v6, v4, v7, v8}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->getFirstFullSpanItemInRange(III)Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;

    move-result-object v5

    .line 251
    .local v5, "validFsi":Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;
    if-nez v5, :cond_6e

    .line 252
    iget-object v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    iget v7, v1, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->mPosition:I

    invoke-virtual {v6, v7}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->forceInvalidateAfter(I)I

    .line 256
    :goto_67
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->requestSimpleAnimationsInNextLayout()V

    .line 257
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->requestLayout()V

    goto :goto_a

    .line 254
    :cond_6e
    iget-object v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    iget v7, v5, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->mPosition:I

    add-int/lit8 v7, v7, 0x1

    invoke-virtual {v6, v7}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->forceInvalidateAfter(I)I

    goto :goto_67
.end method

.method private checkSpanForGap(Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;)Z
    .registers 5
    .param p1, "span"    # Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    .prologue
    const/4 v0, 0x1

    .line 344
    iget-boolean v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    if-eqz v1, :cond_12

    .line 345
    invoke-virtual {p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getEndLine()I

    move-result v1

    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v2}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v2

    if-ge v1, v2, :cond_1e

    .line 351
    :cond_11
    :goto_11
    return v0

    .line 348
    :cond_12
    invoke-virtual {p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getStartLine()I

    move-result v1

    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v2}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v2

    if-gt v1, v2, :cond_11

    .line 351
    :cond_1e
    const/4 v0, 0x0

    goto :goto_11
.end method

.method private computeScrollExtent(Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 8
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 933
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildCount()I

    move-result v0

    if-nez v0, :cond_9

    .line 936
    :goto_8
    return v4

    :cond_9
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    iget-boolean v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSmoothScrollbarEnabled:Z

    if-nez v0, :cond_25

    move v0, v3

    :goto_10
    invoke-virtual {p0, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->findFirstVisibleItemClosestToStart(Z)Landroid/view/View;

    move-result-object v2

    iget-boolean v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSmoothScrollbarEnabled:Z

    if-nez v0, :cond_27

    :goto_18
    invoke-virtual {p0, v3}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->findFirstVisibleItemClosestToEnd(Z)Landroid/view/View;

    move-result-object v3

    iget-boolean v5, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSmoothScrollbarEnabled:Z

    move-object v0, p1

    move-object v4, p0

    invoke-static/range {v0 .. v5}, Landroid/support/v7/widget/ScrollbarHelper;->computeScrollExtent(Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/OrientationHelper;Landroid/view/View;Landroid/view/View;Landroid/support/v7/widget/RecyclerView$LayoutManager;Z)I

    move-result v4

    goto :goto_8

    :cond_25
    move v0, v4

    goto :goto_10

    :cond_27
    move v3, v4

    goto :goto_18
.end method

.method private computeScrollOffset(Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 9
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 913
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildCount()I

    move-result v0

    if-nez v0, :cond_9

    .line 916
    :goto_8
    return v4

    :cond_9
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    iget-boolean v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSmoothScrollbarEnabled:Z

    if-nez v0, :cond_27

    move v0, v3

    :goto_10
    invoke-virtual {p0, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->findFirstVisibleItemClosestToStart(Z)Landroid/view/View;

    move-result-object v2

    iget-boolean v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSmoothScrollbarEnabled:Z

    if-nez v0, :cond_29

    :goto_18
    invoke-virtual {p0, v3}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->findFirstVisibleItemClosestToEnd(Z)Landroid/view/View;

    move-result-object v3

    iget-boolean v5, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSmoothScrollbarEnabled:Z

    iget-boolean v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    move-object v0, p1

    move-object v4, p0

    invoke-static/range {v0 .. v6}, Landroid/support/v7/widget/ScrollbarHelper;->computeScrollOffset(Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/OrientationHelper;Landroid/view/View;Landroid/view/View;Landroid/support/v7/widget/RecyclerView$LayoutManager;ZZ)I

    move-result v4

    goto :goto_8

    :cond_27
    move v0, v4

    goto :goto_10

    :cond_29
    move v3, v4

    goto :goto_18
.end method

.method private computeScrollRange(Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 8
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 953
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildCount()I

    move-result v0

    if-nez v0, :cond_9

    .line 956
    :goto_8
    return v4

    :cond_9
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    iget-boolean v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSmoothScrollbarEnabled:Z

    if-nez v0, :cond_25

    move v0, v3

    :goto_10
    invoke-virtual {p0, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->findFirstVisibleItemClosestToStart(Z)Landroid/view/View;

    move-result-object v2

    iget-boolean v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSmoothScrollbarEnabled:Z

    if-nez v0, :cond_27

    :goto_18
    invoke-virtual {p0, v3}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->findFirstVisibleItemClosestToEnd(Z)Landroid/view/View;

    move-result-object v3

    iget-boolean v5, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSmoothScrollbarEnabled:Z

    move-object v0, p1

    move-object v4, p0

    invoke-static/range {v0 .. v5}, Landroid/support/v7/widget/ScrollbarHelper;->computeScrollRange(Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/OrientationHelper;Landroid/view/View;Landroid/view/View;Landroid/support/v7/widget/RecyclerView$LayoutManager;Z)I

    move-result v4

    goto :goto_8

    :cond_25
    move v0, v4

    goto :goto_10

    :cond_27
    move v3, v4

    goto :goto_18
.end method

.method private createFullSpanItemFromEnd(I)Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;
    .registers 6
    .param p1, "newItemTop"    # I

    .prologue
    .line 1422
    new-instance v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;

    invoke-direct {v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;-><init>()V

    .line 1423
    .local v0, "fsi":Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;
    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    new-array v2, v2, [I

    iput-object v2, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->mGapPerSpan:[I

    .line 1424
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_c
    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v1, v2, :cond_21

    .line 1425
    iget-object v2, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->mGapPerSpan:[I

    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v3, v3, v1

    invoke-virtual {v3, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getEndLine(I)I

    move-result v3

    sub-int v3, p1, v3

    aput v3, v2, v1

    .line 1424
    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    .line 1427
    :cond_21
    return-object v0
.end method

.method private createFullSpanItemFromStart(I)Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;
    .registers 6
    .param p1, "newItemBottom"    # I

    .prologue
    .line 1431
    new-instance v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;

    invoke-direct {v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;-><init>()V

    .line 1432
    .local v0, "fsi":Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;
    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    new-array v2, v2, [I

    iput-object v2, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->mGapPerSpan:[I

    .line 1433
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_c
    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v1, v2, :cond_20

    .line 1434
    iget-object v2, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->mGapPerSpan:[I

    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v3, v3, v1

    invoke-virtual {v3, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getStartLine(I)I

    move-result v3

    sub-int/2addr v3, p1

    aput v3, v2, v1

    .line 1433
    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    .line 1436
    :cond_20
    return-object v0
.end method

.method private ensureOrientationHelper()V
    .registers 2

    .prologue
    .line 492
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    if-nez v0, :cond_1d

    .line 493
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mOrientation:I

    invoke-static {p0, v0}, Landroid/support/v7/widget/OrientationHelper;->createOrientationHelper(Landroid/support/v7/widget/RecyclerView$LayoutManager;I)Landroid/support/v7/widget/OrientationHelper;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    .line 494
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mOrientation:I

    rsub-int/lit8 v0, v0, 0x1

    invoke-static {p0, v0}, Landroid/support/v7/widget/OrientationHelper;->createOrientationHelper(Landroid/support/v7/widget/RecyclerView$LayoutManager;I)Landroid/support/v7/widget/OrientationHelper;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSecondaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    .line 496
    new-instance v0, Landroid/support/v7/widget/LayoutState;

    invoke-direct {v0}, Landroid/support/v7/widget/LayoutState;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    .line 498
    :cond_1d
    return-void
.end method

.method private fill(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/LayoutState;Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 31
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "layoutState"    # Landroid/support/v7/widget/LayoutState;
    .param p3, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 1304
    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mRemainingSpans:Ljava/util/BitSet;

    const/4 v10, 0x0

    move-object/from16 v0, p0

    iget v11, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    const/4 v12, 0x1

    invoke-virtual {v4, v10, v11, v12}, Ljava/util/BitSet;->set(IIZ)V

    .line 1314
    move-object/from16 v0, p2

    iget v4, v0, Landroid/support/v7/widget/LayoutState;->mLayoutDirection:I

    const/4 v10, 0x1

    if-ne v4, v10, :cond_15b

    .line 1316
    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v4

    move-object/from16 v0, p0

    iget-object v10, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iget v10, v10, Landroid/support/v7/widget/LayoutState;->mAvailable:I

    add-int v24, v4, v10

    .line 1317
    .local v24, "recycleLine":I
    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iget v4, v4, Landroid/support/v7/widget/LayoutState;->mExtra:I

    add-int v4, v4, v24

    move-object/from16 v0, p0

    iget-object v10, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v10}, Landroid/support/v7/widget/OrientationHelper;->getEndPadding()I

    move-result v10

    add-int v26, v4, v10

    .line 1325
    .local v26, "targetLine":I
    :goto_36
    move-object/from16 v0, p2

    iget v4, v0, Landroid/support/v7/widget/LayoutState;->mLayoutDirection:I

    move-object/from16 v0, p0

    move/from16 v1, v26

    invoke-direct {v0, v4, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->updateAllRemainingSpans(II)V

    .line 1328
    move-object/from16 v0, p0

    iget-boolean v4, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    if-eqz v4, :cond_17f

    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v18

    .line 1332
    .local v18, "defaultNewViewLine":I
    :goto_4f
    invoke-virtual/range {p2 .. p3}, Landroid/support/v7/widget/LayoutState;->hasMore(Landroid/support/v7/widget/RecyclerView$State;)Z

    move-result v4

    if-eqz v4, :cond_220

    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mRemainingSpans:Ljava/util/BitSet;

    invoke-virtual {v4}, Ljava/util/BitSet;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_220

    .line 1333
    move-object/from16 v0, p2

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/LayoutState;->next(Landroid/support/v7/widget/RecyclerView$Recycler;)Landroid/view/View;

    move-result-object v5

    .line 1334
    .local v5, "view":Landroid/view/View;
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v20

    check-cast v20, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    .line 1335
    .local v20, "lp":Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;
    move-object/from16 v0, p2

    iget v4, v0, Landroid/support/v7/widget/LayoutState;->mLayoutDirection:I

    const/4 v10, 0x1

    if-ne v4, v10, :cond_189

    .line 1336
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->addView(Landroid/view/View;)V

    .line 1340
    :goto_79
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-direct {v0, v5, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->measureChildWithDecorationsAndMargin(Landroid/view/View;Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;)V

    .line 1342
    invoke-virtual/range {v20 .. v20}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->getViewPosition()I

    move-result v23

    .line 1343
    .local v23, "position":I
    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    move/from16 v0, v23

    invoke-virtual {v4, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->getSpan(I)I

    move-result v25

    .line 1345
    .local v25, "spanIndex":I
    const/4 v4, -0x1

    move/from16 v0, v25

    if-ne v0, v4, :cond_191

    const/16 v16, 0x1

    .line 1346
    .local v16, "assignSpan":Z
    :goto_95
    if-eqz v16, :cond_19f

    .line 1347
    move-object/from16 v0, v20

    iget-boolean v4, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mFullSpan:Z

    if-eqz v4, :cond_195

    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    const/4 v10, 0x0

    aget-object v17, v4, v10

    .line 1348
    .local v17, "currentSpan":Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;
    :goto_a4
    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    move/from16 v0, v23

    move-object/from16 v1, v17

    invoke-virtual {v4, v0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->setSpan(ILandroid/support/v7/widget/StaggeredGridLayoutManager$Span;)V

    .line 1361
    :goto_af
    move-object/from16 v0, p2

    iget v4, v0, Landroid/support/v7/widget/LayoutState;->mLayoutDirection:I

    const/4 v10, 0x1

    if-ne v4, v10, :cond_1ad

    .line 1362
    move-object/from16 v0, v20

    iget-boolean v4, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mFullSpan:Z

    if-eqz v4, :cond_1a7

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-direct {v0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getMaxEnd(I)I

    move-result v7

    .line 1364
    .local v7, "start":I
    :goto_c4
    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4, v5}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedMeasurement(Landroid/view/View;)I

    move-result v4

    add-int v9, v7, v4

    .line 1365
    .local v9, "end":I
    if-eqz v16, :cond_f0

    move-object/from16 v0, v20

    iget-boolean v4, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mFullSpan:Z

    if-eqz v4, :cond_f0

    .line 1367
    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->createFullSpanItemFromEnd(I)Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;

    move-result-object v19

    .line 1368
    .local v19, "fullSpanItem":Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;
    const/4 v4, -0x1

    move-object/from16 v0, v19

    iput v4, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->mGapDir:I

    .line 1369
    move/from16 v0, v23

    move-object/from16 v1, v19

    iput v0, v1, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->mPosition:I

    .line 1370
    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->addFullSpanItem(Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;)V

    .line 1386
    .end local v19    # "fullSpanItem":Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;
    :cond_f0
    :goto_f0
    move-object/from16 v0, v20

    iget-boolean v4, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mFullSpan:Z

    if-eqz v4, :cond_104

    move-object/from16 v0, p2

    iget v4, v0, Landroid/support/v7/widget/LayoutState;->mItemDirection:I

    const/4 v10, -0x1

    if-ne v4, v10, :cond_104

    if-eqz v16, :cond_104

    .line 1387
    const/4 v4, 0x1

    move-object/from16 v0, p0

    iput-boolean v4, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLaidOutInvalidFullSpan:Z

    .line 1390
    :cond_104
    move-object/from16 v0, v17

    move-object/from16 v1, v20

    iput-object v0, v1, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mSpan:Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    .line 1391
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    move-object/from16 v2, p2

    invoke-direct {v0, v5, v1, v2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->attachViewToSpans(Landroid/view/View;Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;Landroid/support/v7/widget/LayoutState;)V

    .line 1392
    move-object/from16 v0, v20

    iget-boolean v4, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mFullSpan:Z

    if-eqz v4, :cond_1ee

    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSecondaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v6

    .line 1395
    .local v6, "otherStart":I
    :goto_121
    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSecondaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4, v5}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedMeasurement(Landroid/view/View;)I

    move-result v4

    add-int v8, v6, v4

    .line 1396
    .local v8, "otherEnd":I
    move-object/from16 v0, p0

    iget v4, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mOrientation:I

    const/4 v10, 0x1

    if-ne v4, v10, :cond_203

    move-object/from16 v4, p0

    .line 1397
    invoke-direct/range {v4 .. v9}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->layoutDecoratedWithMargins(Landroid/view/View;IIII)V

    .line 1402
    :goto_137
    move-object/from16 v0, v20

    iget-boolean v4, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mFullSpan:Z

    if-eqz v4, :cond_20f

    .line 1403
    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iget v4, v4, Landroid/support/v7/widget/LayoutState;->mLayoutDirection:I

    move-object/from16 v0, p0

    move/from16 v1, v26

    invoke-direct {v0, v4, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->updateAllRemainingSpans(II)V

    .line 1407
    :goto_14a
    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v17

    move/from16 v3, v24

    invoke-direct {v0, v1, v4, v2, v3}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->recycle(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/LayoutState;Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;I)V

    goto/16 :goto_4f

    .line 1321
    .end local v5    # "view":Landroid/view/View;
    .end local v6    # "otherStart":I
    .end local v7    # "start":I
    .end local v8    # "otherEnd":I
    .end local v9    # "end":I
    .end local v16    # "assignSpan":Z
    .end local v17    # "currentSpan":Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;
    .end local v18    # "defaultNewViewLine":I
    .end local v20    # "lp":Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;
    .end local v23    # "position":I
    .end local v24    # "recycleLine":I
    .end local v25    # "spanIndex":I
    .end local v26    # "targetLine":I
    :cond_15b
    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v4

    move-object/from16 v0, p0

    iget-object v10, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iget v10, v10, Landroid/support/v7/widget/LayoutState;->mAvailable:I

    sub-int v24, v4, v10

    .line 1322
    .restart local v24    # "recycleLine":I
    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iget v4, v4, Landroid/support/v7/widget/LayoutState;->mExtra:I

    sub-int v4, v24, v4

    move-object/from16 v0, p0

    iget-object v10, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v10}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v10

    sub-int v26, v4, v10

    .restart local v26    # "targetLine":I
    goto/16 :goto_36

    .line 1328
    :cond_17f
    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v18

    goto/16 :goto_4f

    .line 1338
    .restart local v5    # "view":Landroid/view/View;
    .restart local v18    # "defaultNewViewLine":I
    .restart local v20    # "lp":Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;
    :cond_189
    const/4 v4, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v4}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->addView(Landroid/view/View;I)V

    goto/16 :goto_79

    .line 1345
    .restart local v23    # "position":I
    .restart local v25    # "spanIndex":I
    :cond_191
    const/16 v16, 0x0

    goto/16 :goto_95

    .line 1347
    .restart local v16    # "assignSpan":Z
    :cond_195
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getNextSpan(Landroid/support/v7/widget/LayoutState;)Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    move-result-object v17

    goto/16 :goto_a4

    .line 1356
    :cond_19f
    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v17, v4, v25

    .restart local v17    # "currentSpan":Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;
    goto/16 :goto_af

    .line 1362
    :cond_1a7
    invoke-virtual/range {v17 .. v18}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getEndLine(I)I

    move-result v7

    goto/16 :goto_c4

    .line 1373
    :cond_1ad
    move-object/from16 v0, v20

    iget-boolean v4, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mFullSpan:Z

    if-eqz v4, :cond_1e9

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-direct {v0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getMinStart(I)I

    move-result v9

    .line 1375
    .restart local v9    # "end":I
    :goto_1bb
    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4, v5}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedMeasurement(Landroid/view/View;)I

    move-result v4

    sub-int v7, v9, v4

    .line 1376
    .restart local v7    # "start":I
    if-eqz v16, :cond_f0

    move-object/from16 v0, v20

    iget-boolean v4, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mFullSpan:Z

    if-eqz v4, :cond_f0

    .line 1378
    move-object/from16 v0, p0

    invoke-direct {v0, v9}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->createFullSpanItemFromStart(I)Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;

    move-result-object v19

    .line 1379
    .restart local v19    # "fullSpanItem":Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;
    const/4 v4, 0x1

    move-object/from16 v0, v19

    iput v4, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->mGapDir:I

    .line 1380
    move/from16 v0, v23

    move-object/from16 v1, v19

    iput v0, v1, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->mPosition:I

    .line 1381
    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->addFullSpanItem(Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;)V

    goto/16 :goto_f0

    .line 1373
    .end local v7    # "start":I
    .end local v9    # "end":I
    .end local v19    # "fullSpanItem":Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;
    :cond_1e9
    invoke-virtual/range {v17 .. v18}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getStartLine(I)I

    move-result v9

    goto :goto_1bb

    .line 1392
    .restart local v7    # "start":I
    .restart local v9    # "end":I
    :cond_1ee
    move-object/from16 v0, v17

    iget v4, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mIndex:I

    move-object/from16 v0, p0

    iget v10, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSizePerSpan:I

    mul-int/2addr v4, v10

    move-object/from16 v0, p0

    iget-object v10, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSecondaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v10}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v10

    add-int v6, v4, v10

    goto/16 :goto_121

    .restart local v6    # "otherStart":I
    .restart local v8    # "otherEnd":I
    :cond_203
    move-object/from16 v10, p0

    move-object v11, v5

    move v12, v7

    move v13, v6

    move v14, v9

    move v15, v8

    .line 1399
    invoke-direct/range {v10 .. v15}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->layoutDecoratedWithMargins(Landroid/view/View;IIII)V

    goto/16 :goto_137

    .line 1405
    :cond_20f
    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iget v4, v4, Landroid/support/v7/widget/LayoutState;->mLayoutDirection:I

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move/from16 v2, v26

    invoke-direct {v0, v1, v4, v2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->updateRemainingSpans(Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;II)V

    goto/16 :goto_14a

    .line 1412
    .end local v5    # "view":Landroid/view/View;
    .end local v6    # "otherStart":I
    .end local v7    # "start":I
    .end local v8    # "otherEnd":I
    .end local v9    # "end":I
    .end local v16    # "assignSpan":Z
    .end local v17    # "currentSpan":Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;
    .end local v20    # "lp":Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;
    .end local v23    # "position":I
    .end local v25    # "spanIndex":I
    :cond_220
    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iget v4, v4, Landroid/support/v7/widget/LayoutState;->mLayoutDirection:I

    const/4 v10, -0x1

    if-ne v4, v10, :cond_246

    .line 1413
    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v4

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getMinStart(I)I

    move-result v22

    .line 1414
    .local v22, "minStart":I
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iget-object v10, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iget v10, v10, Landroid/support/v7/widget/LayoutState;->mAvailable:I

    sub-int v11, v24, v22

    add-int/2addr v10, v11

    invoke-static {v4, v10}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 1417
    .end local v22    # "minStart":I
    :goto_245
    return v4

    .line 1416
    :cond_246
    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v4

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getMaxEnd(I)I

    move-result v21

    .line 1417
    .local v21, "max":I
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iget-object v10, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iget v10, v10, Landroid/support/v7/widget/LayoutState;->mAvailable:I

    sub-int v11, v21, v24

    add-int/2addr v10, v11

    invoke-static {v4, v10}, Ljava/lang/Math;->max(II)I

    move-result v4

    goto :goto_245
.end method

.method private findFirstReferenceChildPosition(I)I
    .registers 6
    .param p1, "itemCount"    # I

    .prologue
    .line 1797
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildCount()I

    move-result v1

    .line 1798
    .local v1, "limit":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_5
    if-ge v0, v1, :cond_17

    .line 1799
    invoke-virtual {p0, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 1800
    .local v3, "view":Landroid/view/View;
    invoke-virtual {p0, v3}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v2

    .line 1801
    .local v2, "position":I
    if-ltz v2, :cond_14

    if-ge v2, p1, :cond_14

    .line 1805
    .end local v2    # "position":I
    .end local v3    # "view":Landroid/view/View;
    :goto_13
    return v2

    .line 1798
    .restart local v2    # "position":I
    .restart local v3    # "view":Landroid/view/View;
    :cond_14
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 1805
    .end local v2    # "position":I
    .end local v3    # "view":Landroid/view/View;
    :cond_17
    const/4 v2, 0x0

    goto :goto_13
.end method

.method private findLastReferenceChildPosition(I)I
    .registers 6
    .param p1, "itemCount"    # I

    .prologue
    .line 1814
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildCount()I

    move-result v3

    add-int/lit8 v0, v3, -0x1

    .local v0, "i":I
    :goto_6
    if-ltz v0, :cond_18

    .line 1815
    invoke-virtual {p0, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 1816
    .local v2, "view":Landroid/view/View;
    invoke-virtual {p0, v2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v1

    .line 1817
    .local v1, "position":I
    if-ltz v1, :cond_15

    if-ge v1, p1, :cond_15

    .line 1821
    .end local v1    # "position":I
    .end local v2    # "view":Landroid/view/View;
    :goto_14
    return v1

    .line 1814
    .restart local v1    # "position":I
    .restart local v2    # "view":Landroid/view/View;
    :cond_15
    add-int/lit8 v0, v0, -0x1

    goto :goto_6

    .line 1821
    .end local v1    # "position":I
    .end local v2    # "view":Landroid/view/View;
    :cond_18
    const/4 v1, 0x0

    goto :goto_14
.end method

.method private fixEndGap(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;Z)V
    .registers 8
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p3, "canOffsetChildren"    # Z

    .prologue
    .line 1164
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v3}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v3

    invoke-direct {p0, v3}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getMaxEnd(I)I

    move-result v2

    .line 1165
    .local v2, "maxEndLine":I
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v3}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v3

    sub-int v1, v3, v2

    .line 1167
    .local v1, "gap":I
    if-lez v1, :cond_24

    .line 1168
    neg-int v3, v1

    invoke-virtual {p0, v3, p1, p2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->scrollBy(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v3

    neg-int v0, v3

    .line 1172
    .local v0, "fixOffset":I
    sub-int/2addr v1, v0

    .line 1173
    if-eqz p3, :cond_24

    if-lez v1, :cond_24

    .line 1174
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v3, v1}, Landroid/support/v7/widget/OrientationHelper;->offsetChildren(I)V

    .line 1176
    .end local v0    # "fixOffset":I
    :cond_24
    return-void
.end method

.method private fixStartGap(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;Z)V
    .registers 9
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p3, "canOffsetChildren"    # Z

    .prologue
    .line 1180
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v3}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v3

    invoke-direct {p0, v3}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getMinStart(I)I

    move-result v2

    .line 1181
    .local v2, "minStartLine":I
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v3}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v3

    sub-int v1, v2, v3

    .line 1183
    .local v1, "gap":I
    if-lez v1, :cond_23

    .line 1184
    invoke-virtual {p0, v1, p1, p2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->scrollBy(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v0

    .line 1188
    .local v0, "fixOffset":I
    sub-int/2addr v1, v0

    .line 1189
    if-eqz p3, :cond_23

    if-lez v1, :cond_23

    .line 1190
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    neg-int v4, v1

    invoke-virtual {v3, v4}, Landroid/support/v7/widget/OrientationHelper;->offsetChildren(I)V

    .line 1192
    .end local v0    # "fixOffset":I
    :cond_23
    return-void
.end method

.method private getFirstChildPosition()I
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 1787
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildCount()I

    move-result v0

    .line 1788
    .local v0, "childCount":I
    if-nez v0, :cond_8

    :goto_7
    return v1

    :cond_8
    invoke-virtual {p0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v1

    goto :goto_7
.end method

.method private getLastChildPosition()I
    .registers 3

    .prologue
    .line 1782
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildCount()I

    move-result v0

    .line 1783
    .local v0, "childCount":I
    if-nez v0, :cond_8

    const/4 v1, 0x0

    :goto_7
    return v1

    :cond_8
    add-int/lit8 v1, v0, -0x1

    invoke-virtual {p0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v1

    goto :goto_7
.end method

.method private getMaxEnd(I)I
    .registers 7
    .param p1, "def"    # I

    .prologue
    .line 1543
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    const/4 v4, 0x0

    aget-object v3, v3, v4

    invoke-virtual {v3, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getEndLine(I)I

    move-result v1

    .line 1544
    .local v1, "maxEnd":I
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_a
    iget v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v0, v3, :cond_1c

    .line 1545
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v3, v3, v0

    invoke-virtual {v3, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getEndLine(I)I

    move-result v2

    .line 1546
    .local v2, "spanEnd":I
    if-le v2, v1, :cond_19

    .line 1547
    move v1, v2

    .line 1544
    :cond_19
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .line 1550
    .end local v2    # "spanEnd":I
    :cond_1c
    return v1
.end method

.method private getMaxStart(I)I
    .registers 7
    .param p1, "def"    # I

    .prologue
    .line 1521
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    const/4 v4, 0x0

    aget-object v3, v3, v4

    invoke-virtual {v3, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getStartLine(I)I

    move-result v1

    .line 1522
    .local v1, "maxStart":I
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_a
    iget v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v0, v3, :cond_1c

    .line 1523
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v3, v3, v0

    invoke-virtual {v3, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getStartLine(I)I

    move-result v2

    .line 1524
    .local v2, "spanStart":I
    if-le v2, v1, :cond_19

    .line 1525
    move v1, v2

    .line 1522
    :cond_19
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .line 1528
    .end local v2    # "spanStart":I
    :cond_1c
    return v1
.end method

.method private getMinEnd(I)I
    .registers 7
    .param p1, "def"    # I

    .prologue
    .line 1554
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    const/4 v4, 0x0

    aget-object v3, v3, v4

    invoke-virtual {v3, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getEndLine(I)I

    move-result v1

    .line 1555
    .local v1, "minEnd":I
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_a
    iget v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v0, v3, :cond_1c

    .line 1556
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v3, v3, v0

    invoke-virtual {v3, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getEndLine(I)I

    move-result v2

    .line 1557
    .local v2, "spanEnd":I
    if-ge v2, v1, :cond_19

    .line 1558
    move v1, v2

    .line 1555
    :cond_19
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .line 1561
    .end local v2    # "spanEnd":I
    :cond_1c
    return v1
.end method

.method private getMinStart(I)I
    .registers 7
    .param p1, "def"    # I

    .prologue
    .line 1532
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    const/4 v4, 0x0

    aget-object v3, v3, v4

    invoke-virtual {v3, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getStartLine(I)I

    move-result v1

    .line 1533
    .local v1, "minStart":I
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_a
    iget v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v0, v3, :cond_1c

    .line 1534
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v3, v3, v0

    invoke-virtual {v3, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getStartLine(I)I

    move-result v2

    .line 1535
    .local v2, "spanStart":I
    if-ge v2, v1, :cond_19

    .line 1536
    move v1, v2

    .line 1533
    :cond_19
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .line 1539
    .end local v2    # "spanStart":I
    :cond_1c
    return v1
.end method

.method private getNextSpan(Landroid/support/v7/widget/LayoutState;)Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;
    .registers 16
    .param p1, "layoutState"    # Landroid/support/v7/widget/LayoutState;

    .prologue
    .line 1621
    iget v12, p1, Landroid/support/v7/widget/LayoutState;->mLayoutDirection:I

    invoke-direct {p0, v12}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->preferLastSpan(I)Z

    move-result v10

    .line 1623
    .local v10, "preferLastSpan":Z
    if-eqz v10, :cond_2e

    .line 1624
    iget v12, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    add-int/lit8 v11, v12, -0x1

    .line 1625
    .local v11, "startIndex":I
    const/4 v2, -0x1

    .line 1626
    .local v2, "endIndex":I
    const/4 v1, -0x1

    .line 1632
    .local v1, "diff":I
    :goto_e
    iget v12, p1, Landroid/support/v7/widget/LayoutState;->mLayoutDirection:I

    const/4 v13, 0x1

    if-ne v12, v13, :cond_33

    .line 1633
    const/4 v6, 0x0

    .line 1634
    .local v6, "min":Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;
    const v7, 0x7fffffff

    .line 1635
    .local v7, "minLine":I
    iget-object v12, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v12}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v0

    .line 1636
    .local v0, "defaultLine":I
    move v3, v11

    .local v3, "i":I
    :goto_1e
    if-eq v3, v2, :cond_4e

    .line 1637
    iget-object v12, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v8, v12, v3

    .line 1638
    .local v8, "other":Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;
    invoke-virtual {v8, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getEndLine(I)I

    move-result v9

    .line 1639
    .local v9, "otherLine":I
    if-ge v9, v7, :cond_2c

    .line 1640
    move-object v6, v8

    .line 1641
    move v7, v9

    .line 1636
    :cond_2c
    add-int/2addr v3, v1

    goto :goto_1e

    .line 1628
    .end local v0    # "defaultLine":I
    .end local v1    # "diff":I
    .end local v2    # "endIndex":I
    .end local v3    # "i":I
    .end local v6    # "min":Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;
    .end local v7    # "minLine":I
    .end local v8    # "other":Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;
    .end local v9    # "otherLine":I
    .end local v11    # "startIndex":I
    :cond_2e
    const/4 v11, 0x0

    .line 1629
    .restart local v11    # "startIndex":I
    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    .line 1630
    .restart local v2    # "endIndex":I
    const/4 v1, 0x1

    .restart local v1    # "diff":I
    goto :goto_e

    .line 1646
    :cond_33
    const/4 v4, 0x0

    .line 1647
    .local v4, "max":Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;
    const/high16 v5, -0x80000000

    .line 1648
    .local v5, "maxLine":I
    iget-object v12, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v12}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v0

    .line 1649
    .restart local v0    # "defaultLine":I
    move v3, v11

    .restart local v3    # "i":I
    :goto_3d
    if-eq v3, v2, :cond_4d

    .line 1650
    iget-object v12, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v8, v12, v3

    .line 1651
    .restart local v8    # "other":Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;
    invoke-virtual {v8, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getStartLine(I)I

    move-result v9

    .line 1652
    .restart local v9    # "otherLine":I
    if-le v9, v5, :cond_4b

    .line 1653
    move-object v4, v8

    .line 1654
    move v5, v9

    .line 1649
    :cond_4b
    add-int/2addr v3, v1

    goto :goto_3d

    .end local v8    # "other":Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;
    .end local v9    # "otherLine":I
    :cond_4d
    move-object v6, v4

    .line 1657
    .end local v4    # "max":Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;
    .end local v5    # "maxLine":I
    :cond_4e
    return-object v6
.end method

.method private handleUpdate(III)V
    .registers 8
    .param p1, "positionStart"    # I
    .param p2, "itemCountOrToPosition"    # I
    .param p3, "cmd"    # I

    .prologue
    const/4 v3, 0x1

    .line 1276
    iget-boolean v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    if-eqz v2, :cond_16

    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getLastChildPosition()I

    move-result v1

    .line 1277
    .local v1, "minPosition":I
    :goto_9
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-virtual {v2, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->invalidateAfter(I)I

    .line 1278
    packed-switch p3, :pswitch_data_46

    .line 1292
    :goto_11
    :pswitch_11
    add-int v2, p1, p2

    if-gt v2, v1, :cond_32

    .line 1300
    :cond_15
    :goto_15
    return-void

    .line 1276
    .end local v1    # "minPosition":I
    :cond_16
    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getFirstChildPosition()I

    move-result v1

    goto :goto_9

    .line 1280
    .restart local v1    # "minPosition":I
    :pswitch_1b
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-virtual {v2, p1, p2}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->offsetForAddition(II)V

    goto :goto_11

    .line 1283
    :pswitch_21
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-virtual {v2, p1, p2}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->offsetForRemoval(II)V

    goto :goto_11

    .line 1287
    :pswitch_27
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-virtual {v2, p1, v3}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->offsetForRemoval(II)V

    .line 1288
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-virtual {v2, p2, v3}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->offsetForAddition(II)V

    goto :goto_11

    .line 1296
    :cond_32
    iget-boolean v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    if-eqz v2, :cond_40

    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getFirstChildPosition()I

    move-result v0

    .line 1297
    .local v0, "maxPosition":I
    :goto_3a
    if-gt p1, v0, :cond_15

    .line 1298
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->requestLayout()V

    goto :goto_15

    .line 1296
    .end local v0    # "maxPosition":I
    :cond_40
    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getLastChildPosition()I

    move-result v0

    goto :goto_3a

    .line 1278
    nop

    :pswitch_data_46
    .packed-switch 0x0
        :pswitch_1b
        :pswitch_21
        :pswitch_11
        :pswitch_27
    .end packed-switch
.end method

.method private layoutDecoratedWithMargins(Landroid/view/View;IIII)V
    .registers 13
    .param p1, "child"    # Landroid/view/View;
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I

    .prologue
    .line 1485
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    check-cast v6, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    .line 1492
    .local v6, "lp":Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;
    iget v0, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->leftMargin:I

    add-int v2, p2, v0

    iget v0, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->topMargin:I

    add-int v3, p3, v0

    iget v0, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->rightMargin:I

    sub-int v4, p4, v0

    iget v0, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->bottomMargin:I

    sub-int v5, p5, v0

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->layoutDecorated(Landroid/view/View;IIII)V

    .line 1494
    return-void
.end method

.method private measureChildWithDecorationsAndMargin(Landroid/view/View;II)V
    .registers 9
    .param p1, "child"    # Landroid/view/View;
    .param p2, "widthSpec"    # I
    .param p3, "heightSpec"    # I

    .prologue
    .line 981
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v2, p1}, Landroid/support/v7/widget/RecyclerView;->getItemDecorInsetsForChild(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v0

    .line 982
    .local v0, "insets":Landroid/graphics/Rect;
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    .line 983
    .local v1, "lp":Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;
    iget v2, v1, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->leftMargin:I

    iget v3, v0, Landroid/graphics/Rect;->left:I

    add-int/2addr v2, v3

    iget v3, v1, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->rightMargin:I

    iget v4, v0, Landroid/graphics/Rect;->right:I

    add-int/2addr v3, v4

    invoke-direct {p0, p2, v2, v3}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->updateSpecWithExtra(III)I

    move-result p2

    .line 985
    iget v2, v1, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->topMargin:I

    iget v3, v0, Landroid/graphics/Rect;->top:I

    add-int/2addr v2, v3

    iget v3, v1, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->bottomMargin:I

    iget v4, v0, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v3, v4

    invoke-direct {p0, p3, v2, v3}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->updateSpecWithExtra(III)I

    move-result p3

    .line 987
    invoke-virtual {p1, p2, p3}, Landroid/view/View;->measure(II)V

    .line 988
    return-void
.end method

.method private measureChildWithDecorationsAndMargin(Landroid/view/View;Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;)V
    .registers 5
    .param p1, "child"    # Landroid/view/View;
    .param p2, "lp"    # Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    .prologue
    .line 968
    iget-boolean v0, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mFullSpan:Z

    if-eqz v0, :cond_19

    .line 969
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mOrientation:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_11

    .line 970
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mFullSizeSpec:I

    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mHeightSpec:I

    invoke-direct {p0, p1, v0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->measureChildWithDecorationsAndMargin(Landroid/view/View;II)V

    .line 977
    :goto_10
    return-void

    .line 972
    :cond_11
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mWidthSpec:I

    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mFullSizeSpec:I

    invoke-direct {p0, p1, v0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->measureChildWithDecorationsAndMargin(Landroid/view/View;II)V

    goto :goto_10

    .line 975
    :cond_19
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mWidthSpec:I

    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mHeightSpec:I

    invoke-direct {p0, p1, v0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->measureChildWithDecorationsAndMargin(Landroid/view/View;II)V

    goto :goto_10
.end method

.method private preferLastSpan(I)Z
    .registers 6
    .param p1, "layoutDir"    # I

    .prologue
    const/4 v3, -0x1

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 1611
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mOrientation:I

    if-nez v0, :cond_13

    .line 1612
    if-ne p1, v3, :cond_f

    move v0, v1

    :goto_a
    iget-boolean v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    if-eq v0, v3, :cond_11

    .line 1614
    :cond_e
    :goto_e
    return v1

    :cond_f
    move v0, v2

    .line 1612
    goto :goto_a

    :cond_11
    move v1, v2

    goto :goto_e

    .line 1614
    :cond_13
    if-ne p1, v3, :cond_23

    move v0, v1

    :goto_16
    iget-boolean v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    if-ne v0, v3, :cond_25

    move v0, v1

    :goto_1b
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->isLayoutRTL()Z

    move-result v3

    if-eq v0, v3, :cond_e

    move v1, v2

    goto :goto_e

    :cond_23
    move v0, v2

    goto :goto_16

    :cond_25
    move v0, v2

    goto :goto_1b
.end method

.method private prependViewToAllSpans(Landroid/view/View;)V
    .registers 4
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 1479
    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    add-int/lit8 v0, v1, -0x1

    .local v0, "i":I
    :goto_4
    if-ltz v0, :cond_10

    .line 1480
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v1, v1, v0

    invoke-virtual {v1, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->prependToSpan(Landroid/view/View;)V

    .line 1479
    add-int/lit8 v0, v0, -0x1

    goto :goto_4

    .line 1482
    :cond_10
    return-void
.end method

.method private recycle(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/LayoutState;Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;I)V
    .registers 10
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "layoutState"    # Landroid/support/v7/widget/LayoutState;
    .param p3, "updatedSpan"    # Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;
    .param p4, "recycleLine"    # I

    .prologue
    .line 1457
    iget v2, p2, Landroid/support/v7/widget/LayoutState;->mLayoutDirection:I

    const/4 v3, -0x1

    if-ne v2, v3, :cond_23

    .line 1459
    invoke-virtual {p3}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getStartLine()I

    move-result v2

    invoke-direct {p0, v2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getMaxStart(I)I

    move-result v0

    .line 1460
    .local v0, "maxStart":I
    invoke-static {p4, v0}, Ljava/lang/Math;->max(II)I

    move-result v2

    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v3}, Landroid/support/v7/widget/OrientationHelper;->getEnd()I

    move-result v3

    iget-object v4, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v4

    sub-int/2addr v3, v4

    add-int/2addr v2, v3

    invoke-direct {p0, p1, v2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->recycleFromEnd(Landroid/support/v7/widget/RecyclerView$Recycler;I)V

    .line 1468
    .end local v0    # "maxStart":I
    :goto_22
    return-void

    .line 1464
    :cond_23
    invoke-virtual {p3}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getEndLine()I

    move-result v2

    invoke-direct {p0, v2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getMinEnd(I)I

    move-result v1

    .line 1465
    .local v1, "minEnd":I
    invoke-static {p4, v1}, Ljava/lang/Math;->min(II)I

    move-result v2

    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v3}, Landroid/support/v7/widget/OrientationHelper;->getEnd()I

    move-result v3

    iget-object v4, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v4

    sub-int/2addr v3, v4

    sub-int/2addr v2, v3

    invoke-direct {p0, p1, v2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->recycleFromStart(Landroid/support/v7/widget/RecyclerView$Recycler;I)V

    goto :goto_22
.end method

.method private recycleFromEnd(Landroid/support/v7/widget/RecyclerView$Recycler;I)V
    .registers 9
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "line"    # I

    .prologue
    .line 1587
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildCount()I

    move-result v1

    .line 1589
    .local v1, "childCount":I
    add-int/lit8 v2, v1, -0x1

    .local v2, "i":I
    :goto_6
    if-ltz v2, :cond_38

    .line 1590
    invoke-virtual {p0, v2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 1591
    .local v0, "child":Landroid/view/View;
    iget-object v5, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v5, v0}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v5

    if-le v5, p2, :cond_38

    .line 1592
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    .line 1593
    .local v4, "lp":Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;
    iget-boolean v5, v4, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mFullSpan:Z

    if-eqz v5, :cond_2d

    .line 1594
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_1f
    iget v5, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v3, v5, :cond_32

    .line 1595
    iget-object v5, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v5, v5, v3

    invoke-virtual {v5}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->popEnd()V

    .line 1594
    add-int/lit8 v3, v3, 0x1

    goto :goto_1f

    .line 1598
    .end local v3    # "j":I
    :cond_2d
    iget-object v5, v4, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mSpan:Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    invoke-virtual {v5}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->popEnd()V

    .line 1600
    :cond_32
    invoke-virtual {p0, v0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->removeAndRecycleView(Landroid/view/View;Landroid/support/v7/widget/RecyclerView$Recycler;)V

    .line 1589
    add-int/lit8 v2, v2, -0x1

    goto :goto_6

    .line 1605
    .end local v0    # "child":Landroid/view/View;
    .end local v4    # "lp":Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;
    :cond_38
    return-void
.end method

.method private recycleFromStart(Landroid/support/v7/widget/RecyclerView$Recycler;I)V
    .registers 7
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "line"    # I

    .prologue
    .line 1568
    :goto_0
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildCount()I

    move-result v3

    if-lez v3, :cond_35

    .line 1569
    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 1570
    .local v0, "child":Landroid/view/View;
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v3, v0}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedEnd(Landroid/view/View;)I

    move-result v3

    if-ge v3, p2, :cond_35

    .line 1571
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    .line 1572
    .local v2, "lp":Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;
    iget-boolean v3, v2, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mFullSpan:Z

    if-eqz v3, :cond_2c

    .line 1573
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_1e
    iget v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v1, v3, :cond_31

    .line 1574
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v3, v3, v1

    invoke-virtual {v3}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->popStart()V

    .line 1573
    add-int/lit8 v1, v1, 0x1

    goto :goto_1e

    .line 1577
    .end local v1    # "j":I
    :cond_2c
    iget-object v3, v2, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mSpan:Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    invoke-virtual {v3}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->popStart()V

    .line 1579
    :cond_31
    invoke-virtual {p0, v0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->removeAndRecycleView(Landroid/view/View;Landroid/support/v7/widget/RecyclerView$Recycler;)V

    goto :goto_0

    .line 1584
    .end local v0    # "child":Landroid/view/View;
    .end local v2    # "lp":Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;
    :cond_35
    return-void
.end method

.method private resolveShouldLayoutReverse()V
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 507
    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mOrientation:I

    if-eq v1, v0, :cond_b

    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->isLayoutRTL()Z

    move-result v1

    if-nez v1, :cond_10

    .line 508
    :cond_b
    iget-boolean v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mReverseLayout:Z

    iput-boolean v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    .line 512
    :goto_f
    return-void

    .line 510
    :cond_10
    iget-boolean v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mReverseLayout:Z

    if-nez v1, :cond_17

    :goto_14
    iput-boolean v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    goto :goto_f

    :cond_17
    const/4 v0, 0x0

    goto :goto_14
.end method

.method private updateAllRemainingSpans(II)V
    .registers 5
    .param p1, "layoutDir"    # I
    .param p2, "targetLine"    # I

    .prologue
    .line 1497
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v0, v1, :cond_1e

    .line 1498
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v1, v1, v0

    # getter for: Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mViews:Ljava/util/ArrayList;
    invoke-static {v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->access$300(Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_16

    .line 1497
    :goto_13
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 1501
    :cond_16
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v1, v1, v0

    invoke-direct {p0, v1, p1, p2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->updateRemainingSpans(Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;II)V

    goto :goto_13

    .line 1503
    :cond_1e
    return-void
.end method

.method private updateAnchorFromChildren(Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;)Z
    .registers 4
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p2, "anchorInfo"    # Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;

    .prologue
    .line 674
    iget-boolean v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLastLayoutFromEnd:Z

    if-eqz v0, :cond_14

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v0

    invoke-direct {p0, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->findLastReferenceChildPosition(I)I

    move-result v0

    :goto_c
    iput v0, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mPosition:I

    .line 677
    const/high16 v0, -0x80000000

    iput v0, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mOffset:I

    .line 678
    const/4 v0, 0x1

    return v0

    .line 674
    :cond_14
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v0

    invoke-direct {p0, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->findFirstReferenceChildPosition(I)I

    move-result v0

    goto :goto_c
.end method

.method private updateLayoutStateToFillEnd(ILandroid/support/v7/widget/RecyclerView$State;)V
    .registers 8
    .param p1, "anchorPosition"    # I
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    const/4 v1, 0x1

    const/4 v3, 0x0

    .line 1213
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iput v3, v2, Landroid/support/v7/widget/LayoutState;->mAvailable:I

    .line 1214
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iput p1, v2, Landroid/support/v7/widget/LayoutState;->mCurrentPosition:I

    .line 1215
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->isSmoothScrolling()Z

    move-result v2

    if-eqz v2, :cond_3a

    .line 1216
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView$State;->getTargetScrollPosition()I

    move-result v0

    .line 1217
    .local v0, "targetPos":I
    iget-boolean v4, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    if-le v0, p1, :cond_2d

    move v2, v1

    :goto_19
    if-ne v4, v2, :cond_2f

    .line 1218
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iput v3, v2, Landroid/support/v7/widget/LayoutState;->mExtra:I

    .line 1225
    .end local v0    # "targetPos":I
    :goto_1f
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iput v1, v2, Landroid/support/v7/widget/LayoutState;->mLayoutDirection:I

    .line 1226
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iget-boolean v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    if-eqz v3, :cond_2a

    const/4 v1, -0x1

    :cond_2a
    iput v1, v2, Landroid/support/v7/widget/LayoutState;->mItemDirection:I

    .line 1228
    return-void

    .restart local v0    # "targetPos":I
    :cond_2d
    move v2, v3

    .line 1217
    goto :goto_19

    .line 1220
    :cond_2f
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v3}, Landroid/support/v7/widget/OrientationHelper;->getTotalSpace()I

    move-result v3

    iput v3, v2, Landroid/support/v7/widget/LayoutState;->mExtra:I

    goto :goto_1f

    .line 1223
    .end local v0    # "targetPos":I
    :cond_3a
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iput v3, v2, Landroid/support/v7/widget/LayoutState;->mExtra:I

    goto :goto_1f
.end method

.method private updateLayoutStateToFillStart(ILandroid/support/v7/widget/RecyclerView$State;)V
    .registers 9
    .param p1, "anchorPosition"    # I
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    const/4 v1, 0x1

    const/4 v2, -0x1

    const/4 v4, 0x0

    .line 1195
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iput v4, v3, Landroid/support/v7/widget/LayoutState;->mAvailable:I

    .line 1196
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iput p1, v3, Landroid/support/v7/widget/LayoutState;->mCurrentPosition:I

    .line 1197
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->isSmoothScrolling()Z

    move-result v3

    if-eqz v3, :cond_3a

    .line 1198
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView$State;->getTargetScrollPosition()I

    move-result v0

    .line 1199
    .local v0, "targetPos":I
    iget-boolean v5, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    if-ge v0, p1, :cond_2d

    move v3, v1

    :goto_1a
    if-ne v5, v3, :cond_2f

    .line 1200
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iput v4, v3, Landroid/support/v7/widget/LayoutState;->mExtra:I

    .line 1207
    .end local v0    # "targetPos":I
    :goto_20
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iput v2, v3, Landroid/support/v7/widget/LayoutState;->mLayoutDirection:I

    .line 1208
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iget-boolean v4, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    if-eqz v4, :cond_3f

    :goto_2a
    iput v1, v3, Landroid/support/v7/widget/LayoutState;->mItemDirection:I

    .line 1210
    return-void

    .restart local v0    # "targetPos":I
    :cond_2d
    move v3, v4

    .line 1199
    goto :goto_1a

    .line 1202
    :cond_2f
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iget-object v4, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4}, Landroid/support/v7/widget/OrientationHelper;->getTotalSpace()I

    move-result v4

    iput v4, v3, Landroid/support/v7/widget/LayoutState;->mExtra:I

    goto :goto_20

    .line 1205
    .end local v0    # "targetPos":I
    :cond_3a
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iput v4, v3, Landroid/support/v7/widget/LayoutState;->mExtra:I

    goto :goto_20

    :cond_3f
    move v1, v2

    .line 1208
    goto :goto_2a
.end method

.method private updateRemainingSpans(Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;II)V
    .registers 9
    .param p1, "span"    # Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;
    .param p2, "layoutDir"    # I
    .param p3, "targetLine"    # I

    .prologue
    const/4 v4, 0x0

    .line 1506
    invoke-virtual {p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getDeletedSize()I

    move-result v0

    .line 1507
    .local v0, "deletedSize":I
    const/4 v2, -0x1

    if-ne p2, v2, :cond_18

    .line 1508
    invoke-virtual {p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getStartLine()I

    move-result v1

    .line 1509
    .local v1, "line":I
    add-int v2, v1, v0

    if-ge v2, p3, :cond_17

    .line 1510
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mRemainingSpans:Ljava/util/BitSet;

    iget v3, p1, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mIndex:I

    invoke-virtual {v2, v3, v4}, Ljava/util/BitSet;->set(IZ)V

    .line 1518
    :cond_17
    :goto_17
    return-void

    .line 1513
    .end local v1    # "line":I
    :cond_18
    invoke-virtual {p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getEndLine()I

    move-result v1

    .line 1514
    .restart local v1    # "line":I
    sub-int v2, v1, v0

    if-le v2, p3, :cond_17

    .line 1515
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mRemainingSpans:Ljava/util/BitSet;

    iget v3, p1, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mIndex:I

    invoke-virtual {v2, v3, v4}, Ljava/util/BitSet;->set(IZ)V

    goto :goto_17
.end method

.method private updateSpecWithExtra(III)I
    .registers 6
    .param p1, "spec"    # I
    .param p2, "startInset"    # I
    .param p3, "endInset"    # I

    .prologue
    .line 991
    if-nez p2, :cond_5

    if-nez p3, :cond_5

    .line 999
    .end local p1    # "spec":I
    :cond_4
    :goto_4
    return p1

    .line 994
    .restart local p1    # "spec":I
    :cond_5
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    .line 995
    .local v0, "mode":I
    const/high16 v1, -0x80000000

    if-eq v0, v1, :cond_11

    const/high16 v1, 0x40000000    # 2.0f

    if-ne v0, v1, :cond_4

    .line 996
    :cond_11
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    sub-int/2addr v1, p2

    sub-int/2addr v1, p3

    invoke-static {v1, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p1

    goto :goto_4
.end method


# virtual methods
.method public assertNotInLayoutOrScroll(Ljava/lang/String;)V
    .registers 3
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 466
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    if-nez v0, :cond_7

    .line 467
    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->assertNotInLayoutOrScroll(Ljava/lang/String;)V

    .line 469
    :cond_7
    return-void
.end method

.method public canScrollHorizontally()Z
    .registers 2

    .prologue
    .line 1668
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mOrientation:I

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

    .line 1663
    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mOrientation:I

    if-ne v1, v0, :cond_6

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public checkLayoutParams(Landroid/support/v7/widget/RecyclerView$LayoutParams;)Z
    .registers 3
    .param p1, "lp"    # Landroid/support/v7/widget/RecyclerView$LayoutParams;

    .prologue
    .line 1846
    instance-of v0, p1, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    return v0
.end method

.method public computeHorizontalScrollExtent(Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 3
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 929
    invoke-direct {p0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->computeScrollExtent(Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v0

    return v0
.end method

.method public computeHorizontalScrollOffset(Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 3
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 909
    invoke-direct {p0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->computeScrollOffset(Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v0

    return v0
.end method

.method public computeHorizontalScrollRange(Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 3
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 949
    invoke-direct {p0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->computeScrollRange(Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v0

    return v0
.end method

.method public computeVerticalScrollExtent(Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 3
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 944
    invoke-direct {p0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->computeScrollExtent(Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v0

    return v0
.end method

.method public computeVerticalScrollOffset(Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 3
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 924
    invoke-direct {p0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->computeScrollOffset(Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v0

    return v0
.end method

.method public computeVerticalScrollRange(Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 3
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 964
    invoke-direct {p0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->computeScrollRange(Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v0

    return v0
.end method

.method public findFirstCompletelyVisibleItemPositions([I)[I
    .registers 6
    .param p1, "into"    # [I

    .prologue
    .line 831
    if-nez p1, :cond_18

    .line 832
    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    new-array p1, v1, [I

    .line 837
    :cond_6
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_7
    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v0, v1, :cond_43

    .line 838
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->findFirstCompletelyVisibleItemPosition()I

    move-result v1

    aput v1, p1, v0

    .line 837
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 833
    .end local v0    # "i":I
    :cond_18
    array-length v1, p1

    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v1, v2, :cond_6

    .line 834
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Provided int[]\'s size must be more than or equal to span count. Expected:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", array size:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    array-length v3, p1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 840
    .restart local v0    # "i":I
    :cond_43
    return-object p1
.end method

.method findFirstVisibleItemClosestToEnd(Z)Landroid/view/View;
    .registers 7
    .param p1, "fullyVisible"    # Z

    .prologue
    .line 1150
    iget-object v4, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v1

    .line 1151
    .local v1, "boundsStart":I
    iget-object v4, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v0

    .line 1152
    .local v0, "boundsEnd":I
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildCount()I

    move-result v4

    add-int/lit8 v3, v4, -0x1

    .local v3, "i":I
    :goto_12
    if-ltz v3, :cond_2e

    .line 1153
    invoke-virtual {p0, v3}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 1154
    .local v2, "child":Landroid/view/View;
    iget-object v4, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4, v2}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v4

    if-lt v4, v1, :cond_2b

    if-eqz p1, :cond_2a

    iget-object v4, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4, v2}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedEnd(Landroid/view/View;)I

    move-result v4

    if-gt v4, v0, :cond_2b

    .line 1159
    .end local v2    # "child":Landroid/view/View;
    :cond_2a
    :goto_2a
    return-object v2

    .line 1152
    .restart local v2    # "child":Landroid/view/View;
    :cond_2b
    add-int/lit8 v3, v3, -0x1

    goto :goto_12

    .line 1159
    .end local v2    # "child":Landroid/view/View;
    :cond_2e
    const/4 v2, 0x0

    goto :goto_2a
.end method

.method findFirstVisibleItemClosestToStart(Z)Landroid/view/View;
    .registers 8
    .param p1, "fullyVisible"    # Z

    .prologue
    .line 1136
    iget-object v5, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v5}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v1

    .line 1137
    .local v1, "boundsStart":I
    iget-object v5, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v5}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v0

    .line 1138
    .local v0, "boundsEnd":I
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildCount()I

    move-result v4

    .line 1139
    .local v4, "limit":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_11
    if-ge v3, v4, :cond_2d

    .line 1140
    invoke-virtual {p0, v3}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 1141
    .local v2, "child":Landroid/view/View;
    if-eqz p1, :cond_21

    iget-object v5, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v5, v2}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v5

    if-lt v5, v1, :cond_2a

    :cond_21
    iget-object v5, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v5, v2}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedEnd(Landroid/view/View;)I

    move-result v5

    if-gt v5, v0, :cond_2a

    .line 1146
    .end local v2    # "child":Landroid/view/View;
    :goto_29
    return-object v2

    .line 1139
    .restart local v2    # "child":Landroid/view/View;
    :cond_2a
    add-int/lit8 v3, v3, 0x1

    goto :goto_11

    .line 1146
    .end local v2    # "child":Landroid/view/View;
    :cond_2d
    const/4 v2, 0x0

    goto :goto_29
.end method

.method findFirstVisibleItemPositionInt()I
    .registers 4

    .prologue
    const/4 v2, 0x1

    .line 1112
    iget-boolean v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    if-eqz v1, :cond_d

    invoke-virtual {p0, v2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->findFirstVisibleItemClosestToEnd(Z)Landroid/view/View;

    move-result-object v0

    .line 1114
    .local v0, "first":Landroid/view/View;
    :goto_9
    if-nez v0, :cond_12

    const/4 v1, -0x1

    :goto_c
    return v1

    .line 1112
    .end local v0    # "first":Landroid/view/View;
    :cond_d
    invoke-virtual {p0, v2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->findFirstVisibleItemClosestToStart(Z)Landroid/view/View;

    move-result-object v0

    goto :goto_9

    .line 1114
    .restart local v0    # "first":Landroid/view/View;
    :cond_12
    invoke-virtual {p0, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v1

    goto :goto_c
.end method

.method public findFirstVisibleItemPositions([I)[I
    .registers 6
    .param p1, "into"    # [I

    .prologue
    .line 799
    if-nez p1, :cond_18

    .line 800
    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    new-array p1, v1, [I

    .line 805
    :cond_6
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_7
    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v0, v1, :cond_43

    .line 806
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->findFirstVisibleItemPosition()I

    move-result v1

    aput v1, p1, v0

    .line 805
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 801
    .end local v0    # "i":I
    :cond_18
    array-length v1, p1

    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v1, v2, :cond_6

    .line 802
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Provided int[]\'s size must be more than or equal to span count. Expected:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", array size:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    array-length v3, p1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 808
    .restart local v0    # "i":I
    :cond_43
    return-object p1
.end method

.method public findLastCompletelyVisibleItemPositions([I)[I
    .registers 6
    .param p1, "into"    # [I

    .prologue
    .line 895
    if-nez p1, :cond_18

    .line 896
    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    new-array p1, v1, [I

    .line 901
    :cond_6
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_7
    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v0, v1, :cond_43

    .line 902
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->findLastCompletelyVisibleItemPosition()I

    move-result v1

    aput v1, p1, v0

    .line 901
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 897
    .end local v0    # "i":I
    :cond_18
    array-length v1, p1

    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v1, v2, :cond_6

    .line 898
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Provided int[]\'s size must be more than or equal to span count. Expected:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", array size:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    array-length v3, p1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 904
    .restart local v0    # "i":I
    :cond_43
    return-object p1
.end method

.method public findLastVisibleItemPositions([I)[I
    .registers 6
    .param p1, "into"    # [I

    .prologue
    .line 863
    if-nez p1, :cond_18

    .line 864
    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    new-array p1, v1, [I

    .line 869
    :cond_6
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_7
    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v0, v1, :cond_43

    .line 870
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->findLastVisibleItemPosition()I

    move-result v1

    aput v1, p1, v0

    .line 869
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 865
    .end local v0    # "i":I
    :cond_18
    array-length v1, p1

    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v1, v2, :cond_6

    .line 866
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Provided int[]\'s size must be more than or equal to span count. Expected:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", array size:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    array-length v3, p1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 872
    .restart local v0    # "i":I
    :cond_43
    return-object p1
.end method

.method public generateDefaultLayoutParams()Landroid/support/v7/widget/RecyclerView$LayoutParams;
    .registers 3

    .prologue
    const/4 v1, -0x2

    .line 1826
    new-instance v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    invoke-direct {v0, v1, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;-><init>(II)V

    return-object v0
.end method

.method public generateLayoutParams(Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/support/v7/widget/RecyclerView$LayoutParams;
    .registers 4
    .param p1, "c"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 1832
    new-instance v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    invoke-direct {v0, p1, p2}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method public generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/support/v7/widget/RecyclerView$LayoutParams;
    .registers 3
    .param p1, "lp"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 1837
    instance-of v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v0, :cond_c

    .line 1838
    new-instance v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .end local p1    # "lp":Landroid/view/ViewGroup$LayoutParams;
    invoke-direct {v0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    .line 1840
    :goto_b
    return-object v0

    .restart local p1    # "lp":Landroid/view/ViewGroup$LayoutParams;
    :cond_c
    new-instance v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    invoke-direct {v0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_b
.end method

.method public getColumnCountForAccessibility(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 5
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 1129
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mOrientation:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_8

    .line 1130
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    .line 1132
    :goto_7
    return v0

    :cond_8
    invoke-super {p0, p1, p2}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getColumnCountForAccessibility(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v0

    goto :goto_7
.end method

.method public getGapStrategy()I
    .registers 2

    .prologue
    .line 438
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mGapStrategy:I

    return v0
.end method

.method public getOrientation()I
    .registers 2

    .prologue
    .line 1850
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mOrientation:I

    return v0
.end method

.method public getReverseLayout()Z
    .registers 2

    .prologue
    .line 527
    iget-boolean v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mReverseLayout:Z

    return v0
.end method

.method public getRowCountForAccessibility(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 4
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 1120
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mOrientation:I

    if-nez v0, :cond_7

    .line 1121
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    .line 1123
    :goto_6
    return v0

    :cond_7
    invoke-super {p0, p1, p2}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getRowCountForAccessibility(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v0

    goto :goto_6
.end method

.method public getSpanCount()I
    .registers 2

    .prologue
    .line 477
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    return v0
.end method

.method hasGapsToFix()Landroid/view/View;
    .registers 24

    .prologue
    .line 280
    const/16 v19, 0x0

    .line 281
    .local v19, "startChildIndex":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildCount()I

    move-result v20

    add-int/lit8 v6, v20, -0x1

    .line 282
    .local v6, "endChildIndex":I
    new-instance v10, Ljava/util/BitSet;

    move-object/from16 v0, p0

    iget v0, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    move/from16 v20, v0

    move/from16 v0, v20

    invoke-direct {v10, v0}, Ljava/util/BitSet;-><init>(I)V

    .line 283
    .local v10, "mSpansToCheck":Ljava/util/BitSet;
    const/16 v20, 0x0

    move-object/from16 v0, p0

    iget v0, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    move/from16 v21, v0

    const/16 v22, 0x1

    move/from16 v0, v20

    move/from16 v1, v21

    move/from16 v2, v22

    invoke-virtual {v10, v0, v1, v2}, Ljava/util/BitSet;->set(IIZ)V

    .line 286
    move-object/from16 v0, p0

    iget v0, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mOrientation:I

    move/from16 v20, v0

    const/16 v21, 0x1

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_7d

    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->isLayoutRTL()Z

    move-result v20

    if-eqz v20, :cond_7d

    const/16 v18, 0x1

    .line 288
    .local v18, "preferredSpanDir":I
    :goto_3e
    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    move/from16 v20, v0

    if-eqz v20, :cond_80

    .line 289
    add-int/lit8 v7, v6, -0x1

    .line 290
    .local v7, "firstChildIndex":I
    add-int/lit8 v4, v19, -0x1

    .line 295
    .local v4, "childLimit":I
    :goto_4a
    if-ge v7, v4, :cond_84

    const/4 v14, 0x1

    .line 296
    .local v14, "nextChildDiff":I
    :goto_4d
    move v8, v7

    .local v8, "i":I
    :goto_4e
    if-eq v8, v4, :cond_12f

    .line 297
    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 298
    .local v3, "child":Landroid/view/View;
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v9

    check-cast v9, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    .line 299
    .local v9, "lp":Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;
    iget-object v0, v9, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mSpan:Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget v0, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mIndex:I

    move/from16 v20, v0

    move/from16 v0, v20

    invoke-virtual {v10, v0}, Ljava/util/BitSet;->get(I)Z

    move-result v20

    if-eqz v20, :cond_95

    .line 300
    iget-object v0, v9, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mSpan:Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->checkSpanForGap(Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;)Z

    move-result v20

    if-eqz v20, :cond_86

    .line 340
    .end local v3    # "child":Landroid/view/View;
    .end local v9    # "lp":Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;
    :cond_7c
    :goto_7c
    return-object v3

    .line 286
    .end local v4    # "childLimit":I
    .end local v7    # "firstChildIndex":I
    .end local v8    # "i":I
    .end local v14    # "nextChildDiff":I
    .end local v18    # "preferredSpanDir":I
    :cond_7d
    const/16 v18, -0x1

    goto :goto_3e

    .line 292
    .restart local v18    # "preferredSpanDir":I
    :cond_80
    move/from16 v7, v19

    .line 293
    .restart local v7    # "firstChildIndex":I
    move v4, v6

    .restart local v4    # "childLimit":I
    goto :goto_4a

    .line 295
    :cond_84
    const/4 v14, -0x1

    goto :goto_4d

    .line 303
    .restart local v3    # "child":Landroid/view/View;
    .restart local v8    # "i":I
    .restart local v9    # "lp":Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;
    .restart local v14    # "nextChildDiff":I
    :cond_86
    iget-object v0, v9, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mSpan:Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget v0, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mIndex:I

    move/from16 v20, v0

    move/from16 v0, v20

    invoke-virtual {v10, v0}, Ljava/util/BitSet;->clear(I)V

    .line 305
    :cond_95
    iget-boolean v0, v9, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mFullSpan:Z

    move/from16 v20, v0

    if-eqz v20, :cond_9d

    .line 296
    :cond_9b
    add-int/2addr v8, v14

    goto :goto_4e

    .line 309
    :cond_9d
    add-int v20, v8, v14

    move/from16 v0, v20

    if-eq v0, v4, :cond_9b

    .line 310
    add-int v20, v8, v14

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v13

    .line 311
    .local v13, "nextChild":Landroid/view/View;
    const/4 v5, 0x0

    .line 312
    .local v5, "compareSpans":Z
    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    move/from16 v20, v0

    if-eqz v20, :cond_105

    .line 314
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedEnd(Landroid/view/View;)I

    move-result v11

    .line 315
    .local v11, "myEnd":I
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v13}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedEnd(Landroid/view/View;)I

    move-result v15

    .line 316
    .local v15, "nextEnd":I
    if-lt v11, v15, :cond_7c

    .line 318
    if-ne v11, v15, :cond_d3

    .line 319
    const/4 v5, 0x1

    .line 330
    .end local v11    # "myEnd":I
    .end local v15    # "nextEnd":I
    :cond_d3
    :goto_d3
    if-eqz v5, :cond_9b

    .line 332
    invoke-virtual {v13}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v16

    check-cast v16, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    .line 333
    .local v16, "nextLp":Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;
    iget-object v0, v9, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mSpan:Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget v0, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mIndex:I

    move/from16 v20, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mSpan:Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget v0, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mIndex:I

    move/from16 v21, v0

    sub-int v20, v20, v21

    if-gez v20, :cond_127

    const/16 v20, 0x1

    move/from16 v21, v20

    :goto_f9
    if-gez v18, :cond_12c

    const/16 v20, 0x1

    :goto_fd
    move/from16 v0, v21

    move/from16 v1, v20

    if-eq v0, v1, :cond_9b

    goto/16 :goto_7c

    .line 322
    .end local v16    # "nextLp":Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;
    :cond_105
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v12

    .line 323
    .local v12, "myStart":I
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v13}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v17

    .line 324
    .local v17, "nextStart":I
    move/from16 v0, v17

    if-gt v12, v0, :cond_7c

    .line 326
    move/from16 v0, v17

    if-ne v12, v0, :cond_d3

    .line 327
    const/4 v5, 0x1

    goto :goto_d3

    .line 333
    .end local v12    # "myStart":I
    .end local v17    # "nextStart":I
    .restart local v16    # "nextLp":Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;
    :cond_127
    const/16 v20, 0x0

    move/from16 v21, v20

    goto :goto_f9

    :cond_12c
    const/16 v20, 0x0

    goto :goto_fd

    .line 340
    .end local v3    # "child":Landroid/view/View;
    .end local v5    # "compareSpans":Z
    .end local v9    # "lp":Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;
    .end local v13    # "nextChild":Landroid/view/View;
    .end local v16    # "nextLp":Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;
    :cond_12f
    const/4 v3, 0x0

    goto/16 :goto_7c
.end method

.method public invalidateSpanAssignments()V
    .registers 2

    .prologue
    .line 487
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-virtual {v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->clear()V

    .line 488
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->requestLayout()V

    .line 489
    return-void
.end method

.method isLayoutRTL()Z
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 515
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getLayoutDirection()I

    move-result v1

    if-ne v1, v0, :cond_8

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public offsetChildrenHorizontal(I)V
    .registers 4
    .param p1, "dx"    # I

    .prologue
    .line 1232
    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->offsetChildrenHorizontal(I)V

    .line 1233
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_4
    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v0, v1, :cond_12

    .line 1234
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v1, v1, v0

    invoke-virtual {v1, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->onOffset(I)V

    .line 1233
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 1236
    :cond_12
    return-void
.end method

.method public offsetChildrenVertical(I)V
    .registers 4
    .param p1, "dy"    # I

    .prologue
    .line 1240
    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->offsetChildrenVertical(I)V

    .line 1241
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_4
    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v0, v1, :cond_12

    .line 1242
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v1, v1, v0

    invoke-virtual {v1, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->onOffset(I)V

    .line 1241
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 1244
    :cond_12
    return-void
.end method

.method public onDetachedFromWindow(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$Recycler;)V
    .registers 5
    .param p1, "view"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;

    .prologue
    .line 269
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v0, v1, :cond_f

    .line 270
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->clear()V

    .line 269
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 272
    :cond_f
    return-void
.end method

.method public onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V
    .registers 9
    .param p1, "event"    # Landroid/view/accessibility/AccessibilityEvent;

    .prologue
    const/4 v6, 0x0

    .line 1086
    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 1087
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildCount()I

    move-result v5

    if-lez v5, :cond_1a

    .line 1088
    invoke-static {p1}, Landroid/support/v4/view/accessibility/AccessibilityEventCompat;->asRecord(Landroid/view/accessibility/AccessibilityEvent;)Landroid/support/v4/view/accessibility/AccessibilityRecordCompat;

    move-result-object v2

    .line 1090
    .local v2, "record":Landroid/support/v4/view/accessibility/AccessibilityRecordCompat;
    invoke-virtual {p0, v6}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->findFirstVisibleItemClosestToStart(Z)Landroid/view/View;

    move-result-object v3

    .line 1091
    .local v3, "start":Landroid/view/View;
    invoke-virtual {p0, v6}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->findFirstVisibleItemClosestToEnd(Z)Landroid/view/View;

    move-result-object v0

    .line 1092
    .local v0, "end":Landroid/view/View;
    if-eqz v3, :cond_1a

    if-nez v0, :cond_1b

    .line 1105
    .end local v0    # "end":Landroid/view/View;
    .end local v2    # "record":Landroid/support/v4/view/accessibility/AccessibilityRecordCompat;
    .end local v3    # "start":Landroid/view/View;
    :cond_1a
    :goto_1a
    return-void

    .line 1095
    .restart local v0    # "end":Landroid/view/View;
    .restart local v2    # "record":Landroid/support/v4/view/accessibility/AccessibilityRecordCompat;
    .restart local v3    # "start":Landroid/view/View;
    :cond_1b
    invoke-virtual {p0, v3}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v4

    .line 1096
    .local v4, "startPos":I
    invoke-virtual {p0, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v1

    .line 1097
    .local v1, "endPos":I
    if-ge v4, v1, :cond_2c

    .line 1098
    invoke-virtual {v2, v4}, Landroid/support/v4/view/accessibility/AccessibilityRecordCompat;->setFromIndex(I)V

    .line 1099
    invoke-virtual {v2, v1}, Landroid/support/v4/view/accessibility/AccessibilityRecordCompat;->setToIndex(I)V

    goto :goto_1a

    .line 1101
    :cond_2c
    invoke-virtual {v2, v1}, Landroid/support/v4/view/accessibility/AccessibilityRecordCompat;->setFromIndex(I)V

    .line 1102
    invoke-virtual {v2, v4}, Landroid/support/v4/view/accessibility/AccessibilityRecordCompat;->setToIndex(I)V

    goto :goto_1a
.end method

.method public onInitializeAccessibilityNodeInfoForItem(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;Landroid/view/View;Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;)V
    .registers 13
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p3, "host"    # Landroid/view/View;
    .param p4, "info"    # Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;

    .prologue
    .line 1065
    invoke-virtual {p3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    .line 1066
    .local v6, "lp":Landroid/view/ViewGroup$LayoutParams;
    instance-of v0, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    if-nez v0, :cond_c

    .line 1067
    invoke-super {p0, p3, p4}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->onInitializeAccessibilityNodeInfoForItem(Landroid/view/View;Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;)V

    .line 1082
    :goto_b
    return-void

    :cond_c
    move-object v7, v6

    .line 1070
    check-cast v7, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    .line 1071
    .local v7, "sglp":Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mOrientation:I

    if-nez v0, :cond_2c

    .line 1072
    invoke-virtual {v7}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->getSpanIndex()I

    move-result v0

    iget-boolean v1, v7, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mFullSpan:Z

    if-eqz v1, :cond_2a

    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    :goto_1d
    const/4 v2, -0x1

    const/4 v3, -0x1

    iget-boolean v4, v7, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mFullSpan:Z

    const/4 v5, 0x0

    invoke-static/range {v0 .. v5}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$CollectionItemInfoCompat;->obtain(IIIIZZ)Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$CollectionItemInfoCompat;

    move-result-object v0

    invoke-virtual {p4, v0}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->setCollectionItemInfo(Ljava/lang/Object;)V

    goto :goto_b

    :cond_2a
    const/4 v1, 0x1

    goto :goto_1d

    .line 1077
    :cond_2c
    const/4 v0, -0x1

    const/4 v1, -0x1

    invoke-virtual {v7}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->getSpanIndex()I

    move-result v2

    iget-boolean v3, v7, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mFullSpan:Z

    if-eqz v3, :cond_43

    iget v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    :goto_38
    iget-boolean v4, v7, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mFullSpan:Z

    const/4 v5, 0x0

    invoke-static/range {v0 .. v5}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$CollectionItemInfoCompat;->obtain(IIIIZZ)Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$CollectionItemInfoCompat;

    move-result-object v0

    invoke-virtual {p4, v0}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->setCollectionItemInfo(Ljava/lang/Object;)V

    goto :goto_b

    :cond_43
    const/4 v3, 0x1

    goto :goto_38
.end method

.method public onItemsAdded(Landroid/support/v7/widget/RecyclerView;II)V
    .registers 5
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "positionStart"    # I
    .param p3, "itemCount"    # I

    .prologue
    .line 1253
    const/4 v0, 0x0

    invoke-direct {p0, p2, p3, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->handleUpdate(III)V

    .line 1254
    return-void
.end method

.method public onItemsChanged(Landroid/support/v7/widget/RecyclerView;)V
    .registers 3
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;

    .prologue
    .line 1258
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-virtual {v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->clear()V

    .line 1259
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->requestLayout()V

    .line 1260
    return-void
.end method

.method public onItemsMoved(Landroid/support/v7/widget/RecyclerView;III)V
    .registers 6
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "from"    # I
    .param p3, "to"    # I
    .param p4, "itemCount"    # I

    .prologue
    .line 1264
    const/4 v0, 0x3

    invoke-direct {p0, p2, p3, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->handleUpdate(III)V

    .line 1265
    return-void
.end method

.method public onItemsRemoved(Landroid/support/v7/widget/RecyclerView;II)V
    .registers 5
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "positionStart"    # I
    .param p3, "itemCount"    # I

    .prologue
    .line 1248
    const/4 v0, 0x1

    invoke-direct {p0, p2, p3, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->handleUpdate(III)V

    .line 1249
    return-void
.end method

.method public onItemsUpdated(Landroid/support/v7/widget/RecyclerView;II)V
    .registers 5
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "positionStart"    # I
    .param p3, "itemCount"    # I

    .prologue
    .line 1269
    const/4 v0, 0x2

    invoke-direct {p0, p2, p3, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->handleUpdate(III)V

    .line 1270
    return-void
.end method

.method public onLayoutChildren(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)V
    .registers 12
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    const/4 v8, -0x1

    const/high16 v7, -0x80000000

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 532
    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->ensureOrientationHelper()V

    .line 534
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v3

    iput v3, v2, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->mAdapterSize:I

    .line 536
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mAnchorInfo:Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;

    .line 537
    .local v0, "anchorInfo":Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;
    invoke-virtual {v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->reset()V

    .line 539
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    if-eqz v2, :cond_68

    .line 540
    invoke-direct {p0, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->applyPendingSavedState(Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;)V

    .line 546
    :goto_1c
    invoke-virtual {p0, p2, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->updateAnchorInfoForLayout(Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;)V

    .line 548
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    if-nez v2, :cond_38

    .line 549
    iget-boolean v2, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mLayoutFromEnd:Z

    iget-boolean v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLastLayoutFromEnd:Z

    if-ne v2, v3, :cond_31

    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->isLayoutRTL()Z

    move-result v2

    iget-boolean v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLastLayoutRTL:Z

    if-eq v2, v3, :cond_38

    .line 551
    :cond_31
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-virtual {v2}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->clear()V

    .line 552
    iput-boolean v6, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mInvalidateOffsets:Z

    .line 556
    :cond_38
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildCount()I

    move-result v2

    if-lez v2, :cond_83

    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    if-eqz v2, :cond_48

    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget v2, v2, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mSpanOffsetsSize:I

    if-ge v2, v6, :cond_83

    .line 558
    :cond_48
    iget-boolean v2, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mInvalidateOffsets:Z

    if-eqz v2, :cond_70

    .line 559
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_4d
    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v1, v2, :cond_83

    .line 561
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v2, v2, v1

    invoke-virtual {v2}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->clear()V

    .line 562
    iget v2, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mOffset:I

    if-eq v2, v7, :cond_65

    .line 563
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v2, v2, v1

    iget v3, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mOffset:I

    invoke-virtual {v2, v3}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->setLine(I)V

    .line 559
    :cond_65
    add-int/lit8 v1, v1, 0x1

    goto :goto_4d

    .line 542
    .end local v1    # "i":I
    :cond_68
    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->resolveShouldLayoutReverse()V

    .line 543
    iget-boolean v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    iput-boolean v2, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mLayoutFromEnd:Z

    goto :goto_1c

    .line 567
    :cond_70
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_71
    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v1, v2, :cond_83

    .line 568
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v2, v2, v1

    iget-boolean v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    iget v4, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mOffset:I

    invoke-virtual {v2, v3, v4}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->cacheReferenceLineAndClear(ZI)V

    .line 567
    add-int/lit8 v1, v1, 0x1

    goto :goto_71

    .line 572
    .end local v1    # "i":I
    :cond_83
    invoke-virtual {p0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->detachAndScrapAttachedViews(Landroid/support/v7/widget/RecyclerView$Recycler;)V

    .line 573
    iput-boolean v5, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLaidOutInvalidFullSpan:Z

    .line 574
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->updateMeasureSpecs()V

    .line 575
    iget-boolean v2, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mLayoutFromEnd:Z

    if-eqz v2, :cond_ed

    .line 577
    iget v2, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mPosition:I

    invoke-direct {p0, v2, p2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->updateLayoutStateToFillStart(ILandroid/support/v7/widget/RecyclerView$State;)V

    .line 578
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    invoke-direct {p0, p1, v2, p2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->fill(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/LayoutState;Landroid/support/v7/widget/RecyclerView$State;)I

    .line 580
    iget v2, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mPosition:I

    invoke-direct {p0, v2, p2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->updateLayoutStateToFillEnd(ILandroid/support/v7/widget/RecyclerView$State;)V

    .line 581
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iget v3, v2, Landroid/support/v7/widget/LayoutState;->mCurrentPosition:I

    iget-object v4, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iget v4, v4, Landroid/support/v7/widget/LayoutState;->mItemDirection:I

    add-int/2addr v3, v4

    iput v3, v2, Landroid/support/v7/widget/LayoutState;->mCurrentPosition:I

    .line 582
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    invoke-direct {p0, p1, v2, p2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->fill(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/LayoutState;Landroid/support/v7/widget/RecyclerView$State;)I

    .line 593
    :goto_ae
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildCount()I

    move-result v2

    if-lez v2, :cond_be

    .line 594
    iget-boolean v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    if-eqz v2, :cond_10d

    .line 595
    invoke-direct {p0, p1, p2, v6}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->fixEndGap(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;Z)V

    .line 596
    invoke-direct {p0, p1, p2, v5}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->fixStartGap(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;Z)V

    .line 603
    :cond_be
    :goto_be
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView$State;->isPreLayout()Z

    move-result v2

    if-nez v2, :cond_df

    .line 604
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildCount()I

    move-result v2

    if-lez v2, :cond_db

    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPosition:I

    if-eq v2, v8, :cond_db

    iget-boolean v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLaidOutInvalidFullSpan:Z

    if-eqz v2, :cond_db

    .line 606
    invoke-virtual {p0, v5}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->checkForGapsRunnable:Ljava/lang/Runnable;

    invoke-static {v2, v3}, Landroid/support/v4/view/ViewCompat;->postOnAnimation(Landroid/view/View;Ljava/lang/Runnable;)V

    .line 608
    :cond_db
    iput v8, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPosition:I

    .line 609
    iput v7, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPositionOffset:I

    .line 611
    :cond_df
    iget-boolean v2, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mLayoutFromEnd:Z

    iput-boolean v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLastLayoutFromEnd:Z

    .line 612
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->isLayoutRTL()Z

    move-result v2

    iput-boolean v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLastLayoutRTL:Z

    .line 613
    const/4 v2, 0x0

    iput-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    .line 614
    return-void

    .line 585
    :cond_ed
    iget v2, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mPosition:I

    invoke-direct {p0, v2, p2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->updateLayoutStateToFillEnd(ILandroid/support/v7/widget/RecyclerView$State;)V

    .line 586
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    invoke-direct {p0, p1, v2, p2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->fill(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/LayoutState;Landroid/support/v7/widget/RecyclerView$State;)I

    .line 588
    iget v2, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mPosition:I

    invoke-direct {p0, v2, p2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->updateLayoutStateToFillStart(ILandroid/support/v7/widget/RecyclerView$State;)V

    .line 589
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iget v3, v2, Landroid/support/v7/widget/LayoutState;->mCurrentPosition:I

    iget-object v4, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iget v4, v4, Landroid/support/v7/widget/LayoutState;->mItemDirection:I

    add-int/2addr v3, v4

    iput v3, v2, Landroid/support/v7/widget/LayoutState;->mCurrentPosition:I

    .line 590
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    invoke-direct {p0, p1, v2, p2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->fill(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/LayoutState;Landroid/support/v7/widget/RecyclerView$State;)I

    goto :goto_ae

    .line 598
    :cond_10d
    invoke-direct {p0, p1, p2, v6}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->fixStartGap(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;Z)V

    .line 599
    invoke-direct {p0, p1, p2, v5}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->fixEndGap(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;Z)V

    goto :goto_be
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 3
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    .line 1004
    instance-of v0, p1, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    if-eqz v0, :cond_b

    .line 1005
    check-cast p1, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    .end local p1    # "state":Landroid/os/Parcelable;
    iput-object p1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    .line 1006
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->requestLayout()V

    .line 1010
    :cond_b
    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .registers 8

    .prologue
    const/4 v6, 0x0

    const/4 v5, -0x1

    const/high16 v4, -0x80000000

    .line 1014
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    if-eqz v3, :cond_10

    .line 1015
    new-instance v2, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    invoke-direct {v2, v3}, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;-><init>(Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;)V

    .line 1059
    :cond_f
    :goto_f
    return-object v2

    .line 1017
    :cond_10
    new-instance v2, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    invoke-direct {v2}, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;-><init>()V

    .line 1018
    .local v2, "state":Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;
    iget-boolean v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mReverseLayout:Z

    iput-boolean v3, v2, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mReverseLayout:Z

    .line 1019
    iget-boolean v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLastLayoutFromEnd:Z

    iput-boolean v3, v2, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mAnchorLayoutFromEnd:Z

    .line 1020
    iget-boolean v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLastLayoutRTL:Z

    iput-boolean v3, v2, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mLastLayoutRTL:Z

    .line 1022
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    if-eqz v3, :cond_7d

    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    iget-object v3, v3, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->mData:[I

    if-eqz v3, :cond_7d

    .line 1023
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    iget-object v3, v3, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->mData:[I

    iput-object v3, v2, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mSpanLookup:[I

    .line 1024
    iget-object v3, v2, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mSpanLookup:[I

    array-length v3, v3

    iput v3, v2, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mSpanLookupSize:I

    .line 1025
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    iget-object v3, v3, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->mFullSpanItems:Ljava/util/List;

    iput-object v3, v2, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mFullSpanItems:Ljava/util/List;

    .line 1030
    :goto_3c
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildCount()I

    move-result v3

    if-lez v3, :cond_97

    .line 1031
    iget-boolean v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLastLayoutFromEnd:Z

    if-eqz v3, :cond_80

    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getLastChildPosition()I

    move-result v3

    :goto_4a
    iput v3, v2, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mAnchorPosition:I

    .line 1033
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->findFirstVisibleItemPositionInt()I

    move-result v3

    iput v3, v2, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mVisibleAnchorPosition:I

    .line 1034
    iget v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    iput v3, v2, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mSpanOffsetsSize:I

    .line 1035
    iget v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    new-array v3, v3, [I

    iput-object v3, v2, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mSpanOffsets:[I

    .line 1036
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_5d
    iget v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v0, v3, :cond_f

    .line 1038
    iget-boolean v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLastLayoutFromEnd:Z

    if-eqz v3, :cond_85

    .line 1039
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v3, v3, v0

    invoke-virtual {v3, v4}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getEndLine(I)I

    move-result v1

    .line 1040
    .local v1, "line":I
    if-eq v1, v4, :cond_76

    .line 1041
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v3}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v3

    sub-int/2addr v1, v3

    .line 1049
    :cond_76
    :goto_76
    iget-object v3, v2, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mSpanOffsets:[I

    aput v1, v3, v0

    .line 1036
    add-int/lit8 v0, v0, 0x1

    goto :goto_5d

    .line 1027
    .end local v0    # "i":I
    .end local v1    # "line":I
    :cond_7d
    iput v6, v2, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mSpanLookupSize:I

    goto :goto_3c

    .line 1031
    :cond_80
    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getFirstChildPosition()I

    move-result v3

    goto :goto_4a

    .line 1044
    .restart local v0    # "i":I
    :cond_85
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v3, v3, v0

    invoke-virtual {v3, v4}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getStartLine(I)I

    move-result v1

    .line 1045
    .restart local v1    # "line":I
    if-eq v1, v4, :cond_76

    .line 1046
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v3}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v3

    sub-int/2addr v1, v3

    goto :goto_76

    .line 1052
    .end local v0    # "i":I
    .end local v1    # "line":I
    :cond_97
    iput v5, v2, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mAnchorPosition:I

    .line 1053
    iput v5, v2, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mVisibleAnchorPosition:I

    .line 1054
    iput v6, v2, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mSpanOffsetsSize:I

    goto/16 :goto_f
.end method

.method public onScrollStateChanged(I)V
    .registers 2
    .param p1, "state"    # I

    .prologue
    .line 262
    if-nez p1, :cond_5

    .line 263
    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->checkForGaps()V

    .line 265
    :cond_5
    return-void
.end method

.method scrollBy(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 12
    .param p1, "dt"    # I
    .param p2, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p3, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    const/4 v5, 0x1

    const/4 v4, -0x1

    .line 1745
    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->ensureOrientationHelper()V

    .line 1747
    if-lez p1, :cond_4e

    .line 1748
    iget-object v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iput v5, v6, Landroid/support/v7/widget/LayoutState;->mLayoutDirection:I

    .line 1749
    iget-object v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iget-boolean v7, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    if-eqz v7, :cond_4c

    :goto_11
    iput v4, v6, Landroid/support/v7/widget/LayoutState;->mItemDirection:I

    .line 1751
    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getLastChildPosition()I

    move-result v2

    .line 1758
    .local v2, "referenceChildPosition":I
    :goto_17
    iget-object v4, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iget-object v5, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iget v5, v5, Landroid/support/v7/widget/LayoutState;->mItemDirection:I

    add-int/2addr v5, v2

    iput v5, v4, Landroid/support/v7/widget/LayoutState;->mCurrentPosition:I

    .line 1759
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result v0

    .line 1760
    .local v0, "absDt":I
    iget-object v4, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iput v0, v4, Landroid/support/v7/widget/LayoutState;->mAvailable:I

    .line 1761
    iget-object v5, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->isSmoothScrolling()Z

    move-result v4

    if-eqz v4, :cond_61

    iget-object v4, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4}, Landroid/support/v7/widget/OrientationHelper;->getTotalSpace()I

    move-result v4

    :goto_36
    iput v4, v5, Landroid/support/v7/widget/LayoutState;->mExtra:I

    .line 1762
    iget-object v4, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    invoke-direct {p0, p2, v4, p3}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->fill(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/LayoutState;Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v1

    .line 1764
    .local v1, "consumed":I
    if-ge v0, v1, :cond_63

    .line 1765
    move v3, p1

    .line 1775
    .local v3, "totalScroll":I
    :goto_41
    iget-object v4, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    neg-int v5, v3

    invoke-virtual {v4, v5}, Landroid/support/v7/widget/OrientationHelper;->offsetChildren(I)V

    .line 1777
    iget-boolean v4, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    iput-boolean v4, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLastLayoutFromEnd:Z

    .line 1778
    return v3

    .end local v0    # "absDt":I
    .end local v1    # "consumed":I
    .end local v2    # "referenceChildPosition":I
    .end local v3    # "totalScroll":I
    :cond_4c
    move v4, v5

    .line 1749
    goto :goto_11

    .line 1753
    :cond_4e
    iget-object v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iput v4, v6, Landroid/support/v7/widget/LayoutState;->mLayoutDirection:I

    .line 1754
    iget-object v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iget-boolean v7, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    if-eqz v7, :cond_5f

    :goto_58
    iput v5, v6, Landroid/support/v7/widget/LayoutState;->mItemDirection:I

    .line 1756
    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getFirstChildPosition()I

    move-result v2

    .restart local v2    # "referenceChildPosition":I
    goto :goto_17

    .end local v2    # "referenceChildPosition":I
    :cond_5f
    move v5, v4

    .line 1754
    goto :goto_58

    .line 1761
    .restart local v0    # "absDt":I
    .restart local v2    # "referenceChildPosition":I
    :cond_61
    const/4 v4, 0x0

    goto :goto_36

    .line 1766
    .restart local v1    # "consumed":I
    :cond_63
    if-gez p1, :cond_67

    .line 1767
    neg-int v3, v1

    .restart local v3    # "totalScroll":I
    goto :goto_41

    .line 1769
    .end local v3    # "totalScroll":I
    :cond_67
    move v3, v1

    .restart local v3    # "totalScroll":I
    goto :goto_41
.end method

.method public scrollHorizontallyBy(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 5
    .param p1, "dx"    # I
    .param p2, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p3, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 1674
    invoke-virtual {p0, p1, p2, p3}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->scrollBy(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v0

    return v0
.end method

.method public scrollToPosition(I)V
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 1714
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    if-eqz v0, :cond_f

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget v0, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mAnchorPosition:I

    if-eq v0, p1, :cond_f

    .line 1715
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    invoke-virtual {v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->invalidateAnchorPositionInfo()V

    .line 1717
    :cond_f
    iput p1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPosition:I

    .line 1718
    const/high16 v0, -0x80000000

    iput v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPositionOffset:I

    .line 1719
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->requestLayout()V

    .line 1720
    return-void
.end method

.method public scrollToPositionWithOffset(II)V
    .registers 4
    .param p1, "position"    # I
    .param p2, "offset"    # I

    .prologue
    .line 1736
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    if-eqz v0, :cond_9

    .line 1737
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    invoke-virtual {v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->invalidateAnchorPositionInfo()V

    .line 1739
    :cond_9
    iput p1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPosition:I

    .line 1740
    iput p2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPositionOffset:I

    .line 1741
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->requestLayout()V

    .line 1742
    return-void
.end method

.method public scrollVerticallyBy(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 5
    .param p1, "dy"    # I
    .param p2, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p3, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 1680
    invoke-virtual {p0, p1, p2, p3}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->scrollBy(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v0

    return v0
.end method

.method public setGapStrategy(I)V
    .registers 4
    .param p1, "gapStrategy"    # I

    .prologue
    .line 451
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->assertNotInLayoutOrScroll(Ljava/lang/String;)V

    .line 452
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mGapStrategy:I

    if-ne p1, v0, :cond_9

    .line 462
    :goto_8
    return-void

    .line 455
    :cond_9
    if-eqz p1, :cond_16

    const/4 v0, 0x2

    if-eq p1, v0, :cond_16

    .line 457
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "invalid gap strategy. Must be GAP_HANDLING_NONE or GAP_HANDLING_MOVE_ITEMS_BETWEEN_SPANS"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 460
    :cond_16
    iput p1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mGapStrategy:I

    .line 461
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->requestLayout()V

    goto :goto_8
.end method

.method public setOrientation(I)V
    .registers 5
    .param p1, "orientation"    # I

    .prologue
    .line 384
    if-eqz p1, :cond_d

    const/4 v1, 0x1

    if-eq p1, v1, :cond_d

    .line 385
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "invalid orientation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 387
    :cond_d
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->assertNotInLayoutOrScroll(Ljava/lang/String;)V

    .line 388
    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mOrientation:I

    if-ne p1, v1, :cond_16

    .line 399
    :goto_15
    return-void

    .line 391
    :cond_16
    iput p1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mOrientation:I

    .line 392
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    if-eqz v1, :cond_28

    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSecondaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    if-eqz v1, :cond_28

    .line 394
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    .line 395
    .local v0, "tmp":Landroid/support/v7/widget/OrientationHelper;
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSecondaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    iput-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    .line 396
    iput-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSecondaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    .line 398
    .end local v0    # "tmp":Landroid/support/v7/widget/OrientationHelper;
    :cond_28
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->requestLayout()V

    goto :goto_15
.end method

.method public setReverseLayout(Z)V
    .registers 3
    .param p1, "reverseLayout"    # Z

    .prologue
    .line 415
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->assertNotInLayoutOrScroll(Ljava/lang/String;)V

    .line 416
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    if-eqz v0, :cond_12

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget-boolean v0, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mReverseLayout:Z

    if-eq v0, p1, :cond_12

    .line 417
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iput-boolean p1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mReverseLayout:Z

    .line 419
    :cond_12
    iput-boolean p1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mReverseLayout:Z

    .line 420
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->requestLayout()V

    .line 421
    return-void
.end method

.method public setSpanCount(I)V
    .registers 6
    .param p1, "spanCount"    # I

    .prologue
    const/4 v3, 0x0

    .line 364
    invoke-virtual {p0, v3}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->assertNotInLayoutOrScroll(Ljava/lang/String;)V

    .line 365
    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-eq p1, v1, :cond_30

    .line 366
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->invalidateSpanAssignments()V

    .line 367
    iput p1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    .line 368
    new-instance v1, Ljava/util/BitSet;

    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    invoke-direct {v1, v2}, Ljava/util/BitSet;-><init>(I)V

    iput-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mRemainingSpans:Ljava/util/BitSet;

    .line 369
    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    new-array v1, v1, [Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    iput-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    .line 370
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1d
    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v0, v1, :cond_2d

    .line 371
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    new-instance v2, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    invoke-direct {v2, p0, v0, v3}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;-><init>(Landroid/support/v7/widget/StaggeredGridLayoutManager;ILandroid/support/v7/widget/StaggeredGridLayoutManager$1;)V

    aput-object v2, v1, v0

    .line 370
    add-int/lit8 v0, v0, 0x1

    goto :goto_1d

    .line 373
    :cond_2d
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->requestLayout()V

    .line 375
    .end local v0    # "i":I
    :cond_30
    return-void
.end method

.method public smoothScrollToPosition(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;I)V
    .registers 6
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p3, "position"    # I

    .prologue
    .line 1694
    new-instance v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$2;

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$2;-><init>(Landroid/support/v7/widget/StaggeredGridLayoutManager;Landroid/content/Context;)V

    .line 1708
    .local v0, "scroller":Landroid/support/v7/widget/LinearSmoothScroller;
    invoke-virtual {v0, p3}, Landroid/support/v7/widget/LinearSmoothScroller;->setTargetPosition(I)V

    .line 1709
    invoke-virtual {p0, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->startSmoothScroll(Landroid/support/v7/widget/RecyclerView$SmoothScroller;)V

    .line 1710
    return-void
.end method

.method public supportsPredictiveItemAnimations()Z
    .registers 2

    .prologue
    .line 776
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    if-nez v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method updateAnchorFromPendingData(Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;)Z
    .registers 15
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p2, "anchorInfo"    # Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;

    .prologue
    const/4 v6, 0x0

    const/4 v11, -0x1

    const/high16 v10, -0x80000000

    const/4 v7, 0x1

    .line 683
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$State;->isPreLayout()Z

    move-result v8

    if-nez v8, :cond_f

    iget v8, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPosition:I

    if-ne v8, v11, :cond_11

    :cond_f
    move v7, v6

    .line 758
    :goto_10
    return v7

    .line 687
    :cond_11
    iget v8, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPosition:I

    if-ltz v8, :cond_1d

    iget v8, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPosition:I

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v9

    if-lt v8, v9, :cond_23

    .line 688
    :cond_1d
    iput v11, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPosition:I

    .line 689
    iput v10, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPositionOffset:I

    move v7, v6

    .line 690
    goto :goto_10

    .line 693
    :cond_23
    iget-object v8, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    if-eqz v8, :cond_33

    iget-object v8, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget v8, v8, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mAnchorPosition:I

    if-eq v8, v11, :cond_33

    iget-object v8, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget v8, v8, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mSpanOffsetsSize:I

    if-ge v8, v7, :cond_ec

    .line 696
    :cond_33
    iget v8, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPosition:I

    invoke-virtual {p0, v8}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->findViewByPosition(I)Landroid/view/View;

    move-result-object v0

    .line 697
    .local v0, "child":Landroid/view/View;
    if-eqz v0, :cond_cc

    .line 700
    iget-boolean v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    if-eqz v6, :cond_62

    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getLastChildPosition()I

    move-result v6

    :goto_43
    iput v6, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mPosition:I

    .line 703
    iget v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPositionOffset:I

    if-eq v6, v10, :cond_7c

    .line 704
    iget-boolean v6, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mLayoutFromEnd:Z

    if-eqz v6, :cond_67

    .line 705
    iget-object v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v6}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v6

    iget v8, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPositionOffset:I

    sub-int v5, v6, v8

    .line 707
    .local v5, "target":I
    iget-object v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v6, v0}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedEnd(Landroid/view/View;)I

    move-result v6

    sub-int v6, v5, v6

    iput v6, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mOffset:I

    goto :goto_10

    .line 700
    .end local v5    # "target":I
    :cond_62
    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getFirstChildPosition()I

    move-result v6

    goto :goto_43

    .line 709
    :cond_67
    iget-object v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v6}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v6

    iget v8, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPositionOffset:I

    add-int v5, v6, v8

    .line 711
    .restart local v5    # "target":I
    iget-object v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v6, v0}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v6

    sub-int v6, v5, v6

    iput v6, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mOffset:I

    goto :goto_10

    .line 717
    .end local v5    # "target":I
    :cond_7c
    iget-object v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v6, v0}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedMeasurement(Landroid/view/View;)I

    move-result v1

    .line 718
    .local v1, "childSize":I
    iget-object v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v6}, Landroid/support/v7/widget/OrientationHelper;->getTotalSpace()I

    move-result v6

    if-le v1, v6, :cond_9f

    .line 720
    iget-boolean v6, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mLayoutFromEnd:Z

    if-eqz v6, :cond_98

    iget-object v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v6}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v6

    :goto_94
    iput v6, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mOffset:I

    goto/16 :goto_10

    :cond_98
    iget-object v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v6}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v6

    goto :goto_94

    .line 726
    :cond_9f
    iget-object v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v6, v0}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v6

    iget-object v8, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v8}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v8

    sub-int v4, v6, v8

    .line 728
    .local v4, "startGap":I
    if-gez v4, :cond_b4

    .line 729
    neg-int v6, v4

    iput v6, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mOffset:I

    goto/16 :goto_10

    .line 732
    :cond_b4
    iget-object v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v6}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v6

    iget-object v8, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v8, v0}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedEnd(Landroid/view/View;)I

    move-result v8

    sub-int v2, v6, v8

    .line 734
    .local v2, "endGap":I
    if-gez v2, :cond_c8

    .line 735
    iput v2, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mOffset:I

    goto/16 :goto_10

    .line 739
    :cond_c8
    iput v10, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mOffset:I

    goto/16 :goto_10

    .line 743
    .end local v1    # "childSize":I
    .end local v2    # "endGap":I
    .end local v4    # "startGap":I
    :cond_cc
    iget v8, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPosition:I

    iput v8, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mPosition:I

    .line 744
    iget v8, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPositionOffset:I

    if-ne v8, v10, :cond_e6

    .line 745
    iget v8, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mPosition:I

    invoke-direct {p0, v8}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->calculateScrollDirectionForPosition(I)I

    move-result v3

    .line 747
    .local v3, "position":I
    if-ne v3, v7, :cond_dd

    move v6, v7

    :cond_dd
    iput-boolean v6, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mLayoutFromEnd:Z

    .line 748
    invoke-virtual {p2}, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->assignCoordinateFromPadding()V

    .line 752
    .end local v3    # "position":I
    :goto_e2
    iput-boolean v7, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mInvalidateOffsets:Z

    goto/16 :goto_10

    .line 750
    :cond_e6
    iget v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPositionOffset:I

    invoke-virtual {p2, v6}, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->assignCoordinateFromPadding(I)V

    goto :goto_e2

    .line 755
    .end local v0    # "child":Landroid/view/View;
    :cond_ec
    iput v10, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mOffset:I

    .line 756
    iget v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPosition:I

    iput v6, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mPosition:I

    goto/16 :goto_10
.end method

.method updateAnchorInfoForLayout(Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;)V
    .registers 4
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p2, "anchorInfo"    # Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;

    .prologue
    .line 656
    invoke-virtual {p0, p1, p2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->updateAnchorFromPendingData(Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 667
    :cond_6
    :goto_6
    return-void

    .line 659
    :cond_7
    invoke-direct {p0, p1, p2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->updateAnchorFromChildren(Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;)Z

    move-result v0

    if-nez v0, :cond_6

    .line 665
    invoke-virtual {p2}, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->assignCoordinateFromPadding()V

    .line 666
    const/4 v0, 0x0

    iput v0, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mPosition:I

    goto :goto_6
.end method

.method updateMeasureSpecs()V
    .registers 5

    .prologue
    const/high16 v3, 0x40000000    # 2.0f

    const/4 v2, 0x0

    .line 762
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSecondaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/OrientationHelper;->getTotalSpace()I

    move-result v0

    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    div-int/2addr v0, v1

    iput v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSizePerSpan:I

    .line 763
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSecondaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/OrientationHelper;->getTotalSpace()I

    move-result v0

    invoke-static {v0, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    iput v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mFullSizeSpec:I

    .line 765
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mOrientation:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_2e

    .line 766
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSizePerSpan:I

    invoke-static {v0, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    iput v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mWidthSpec:I

    .line 767
    invoke-static {v2, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    iput v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mHeightSpec:I

    .line 772
    :goto_2d
    return-void

    .line 769
    :cond_2e
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSizePerSpan:I

    invoke-static {v0, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    iput v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mHeightSpec:I

    .line 770
    invoke-static {v2, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    iput v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mWidthSpec:I

    goto :goto_2d
.end method
