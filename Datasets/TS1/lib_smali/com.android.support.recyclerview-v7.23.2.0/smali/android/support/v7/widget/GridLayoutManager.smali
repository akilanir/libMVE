.class public Landroid/support/v7/widget/GridLayoutManager;
.super Landroid/support/v7/widget/LinearLayoutManager;
.source "GridLayoutManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/widget/GridLayoutManager$LayoutParams;,
        Landroid/support/v7/widget/GridLayoutManager$DefaultSpanSizeLookup;,
        Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;
    }
.end annotation


# static fields
.field private static final DEBUG:Z = false

.field public static final DEFAULT_SPAN_COUNT:I = -0x1

.field private static final TAG:Ljava/lang/String; = "GridLayoutManager"


# instance fields
.field mCachedBorders:[I

.field final mDecorInsets:Landroid/graphics/Rect;

.field mPendingSpanCountChange:Z

.field final mPreLayoutSpanIndexCache:Landroid/util/SparseIntArray;

.field final mPreLayoutSpanSizeCache:Landroid/util/SparseIntArray;

.field mSet:[Landroid/view/View;

.field mSpanCount:I

.field mSpanSizeLookup:Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;


# direct methods
.method public constructor <init>(Landroid/content/Context;I)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "spanCount"    # I

    .prologue
    .line 83
    invoke-direct {p0, p1}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 43
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mPendingSpanCountChange:Z

    .line 44
    const/4 v0, -0x1

    iput v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanCount:I

    .line 55
    new-instance v0, Landroid/util/SparseIntArray;

    invoke-direct {v0}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mPreLayoutSpanSizeCache:Landroid/util/SparseIntArray;

    .line 56
    new-instance v0, Landroid/util/SparseIntArray;

    invoke-direct {v0}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mPreLayoutSpanIndexCache:Landroid/util/SparseIntArray;

    .line 57
    new-instance v0, Landroid/support/v7/widget/GridLayoutManager$DefaultSpanSizeLookup;

    invoke-direct {v0}, Landroid/support/v7/widget/GridLayoutManager$DefaultSpanSizeLookup;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanSizeLookup:Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;

    .line 59
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mDecorInsets:Landroid/graphics/Rect;

    .line 84
    invoke-virtual {p0, p2}, Landroid/support/v7/widget/GridLayoutManager;->setSpanCount(I)V

    .line 85
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;IIZ)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "spanCount"    # I
    .param p3, "orientation"    # I
    .param p4, "reverseLayout"    # Z

    .prologue
    .line 96
    invoke-direct {p0, p1, p3, p4}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 43
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mPendingSpanCountChange:Z

    .line 44
    const/4 v0, -0x1

    iput v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanCount:I

    .line 55
    new-instance v0, Landroid/util/SparseIntArray;

    invoke-direct {v0}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mPreLayoutSpanSizeCache:Landroid/util/SparseIntArray;

    .line 56
    new-instance v0, Landroid/util/SparseIntArray;

    invoke-direct {v0}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mPreLayoutSpanIndexCache:Landroid/util/SparseIntArray;

    .line 57
    new-instance v0, Landroid/support/v7/widget/GridLayoutManager$DefaultSpanSizeLookup;

    invoke-direct {v0}, Landroid/support/v7/widget/GridLayoutManager$DefaultSpanSizeLookup;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanSizeLookup:Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;

    .line 59
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mDecorInsets:Landroid/graphics/Rect;

    .line 97
    invoke-virtual {p0, p2}, Landroid/support/v7/widget/GridLayoutManager;->setSpanCount(I)V

    .line 98
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    .line 71
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 43
    const/4 v1, 0x0

    iput-boolean v1, p0, Landroid/support/v7/widget/GridLayoutManager;->mPendingSpanCountChange:Z

    .line 44
    const/4 v1, -0x1

    iput v1, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanCount:I

    .line 55
    new-instance v1, Landroid/util/SparseIntArray;

    invoke-direct {v1}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v1, p0, Landroid/support/v7/widget/GridLayoutManager;->mPreLayoutSpanSizeCache:Landroid/util/SparseIntArray;

    .line 56
    new-instance v1, Landroid/util/SparseIntArray;

    invoke-direct {v1}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v1, p0, Landroid/support/v7/widget/GridLayoutManager;->mPreLayoutSpanIndexCache:Landroid/util/SparseIntArray;

    .line 57
    new-instance v1, Landroid/support/v7/widget/GridLayoutManager$DefaultSpanSizeLookup;

    invoke-direct {v1}, Landroid/support/v7/widget/GridLayoutManager$DefaultSpanSizeLookup;-><init>()V

    iput-object v1, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanSizeLookup:Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;

    .line 59
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Landroid/support/v7/widget/GridLayoutManager;->mDecorInsets:Landroid/graphics/Rect;

    .line 72
    invoke-static {p1, p2, p3, p4}, Landroid/support/v7/widget/GridLayoutManager;->getProperties(Landroid/content/Context;Landroid/util/AttributeSet;II)Landroid/support/v7/widget/RecyclerView$LayoutManager$Properties;

    move-result-object v0

    .line 73
    .local v0, "properties":Landroid/support/v7/widget/RecyclerView$LayoutManager$Properties;
    iget v1, v0, Landroid/support/v7/widget/RecyclerView$LayoutManager$Properties;->spanCount:I

    invoke-virtual {p0, v1}, Landroid/support/v7/widget/GridLayoutManager;->setSpanCount(I)V

    .line 74
    return-void
.end method

.method private assignSpans(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;IIZ)V
    .registers 16
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p3, "count"    # I
    .param p4, "consumedSpanCount"    # I
    .param p5, "layingOutInPrimaryDirection"    # Z

    .prologue
    const/4 v9, 0x1

    .line 740
    if-eqz p5, :cond_49

    .line 741
    const/4 v6, 0x0

    .line 742
    .local v6, "start":I
    move v1, p3

    .line 743
    .local v1, "end":I
    const/4 v0, 0x1

    .line 749
    .local v0, "diff":I
    :goto_6
    iget v8, p0, Landroid/support/v7/widget/GridLayoutManager;->mOrientation:I

    if-ne v8, v9, :cond_4e

    invoke-virtual {p0}, Landroid/support/v7/widget/GridLayoutManager;->isLayoutRTL()Z

    move-result v8

    if-eqz v8, :cond_4e

    .line 750
    iget v8, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanCount:I

    add-int/lit8 v4, v8, -0x1

    .line 751
    .local v4, "span":I
    const/4 v5, -0x1

    .line 756
    .local v5, "spanDiff":I
    :goto_15
    move v2, v6

    .local v2, "i":I
    :goto_16
    if-eq v2, v1, :cond_55

    .line 757
    iget-object v8, p0, Landroid/support/v7/widget/GridLayoutManager;->mSet:[Landroid/view/View;

    aget-object v7, v8, v2

    .line 758
    .local v7, "view":Landroid/view/View;
    invoke-virtual {v7}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;

    .line 759
    .local v3, "params":Landroid/support/v7/widget/GridLayoutManager$LayoutParams;
    invoke-virtual {p0, v7}, Landroid/support/v7/widget/GridLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v8

    invoke-direct {p0, p1, p2, v8}, Landroid/support/v7/widget/GridLayoutManager;->getSpanSize(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;I)I

    move-result v8

    # setter for: Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->mSpanSize:I
    invoke-static {v3, v8}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->access$102(Landroid/support/v7/widget/GridLayoutManager$LayoutParams;I)I

    .line 760
    const/4 v8, -0x1

    if-ne v5, v8, :cond_51

    # getter for: Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->mSpanSize:I
    invoke-static {v3}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->access$100(Landroid/support/v7/widget/GridLayoutManager$LayoutParams;)I

    move-result v8

    if-le v8, v9, :cond_51

    .line 761
    # getter for: Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->mSpanSize:I
    invoke-static {v3}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->access$100(Landroid/support/v7/widget/GridLayoutManager$LayoutParams;)I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    sub-int v8, v4, v8

    # setter for: Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->mSpanIndex:I
    invoke-static {v3, v8}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->access$002(Landroid/support/v7/widget/GridLayoutManager$LayoutParams;I)I

    .line 765
    :goto_41
    # getter for: Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->mSpanSize:I
    invoke-static {v3}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->access$100(Landroid/support/v7/widget/GridLayoutManager$LayoutParams;)I

    move-result v8

    mul-int/2addr v8, v5

    add-int/2addr v4, v8

    .line 756
    add-int/2addr v2, v0

    goto :goto_16

    .line 745
    .end local v0    # "diff":I
    .end local v1    # "end":I
    .end local v2    # "i":I
    .end local v3    # "params":Landroid/support/v7/widget/GridLayoutManager$LayoutParams;
    .end local v4    # "span":I
    .end local v5    # "spanDiff":I
    .end local v6    # "start":I
    .end local v7    # "view":Landroid/view/View;
    :cond_49
    add-int/lit8 v6, p3, -0x1

    .line 746
    .restart local v6    # "start":I
    const/4 v1, -0x1

    .line 747
    .restart local v1    # "end":I
    const/4 v0, -0x1

    .restart local v0    # "diff":I
    goto :goto_6

    .line 753
    :cond_4e
    const/4 v4, 0x0

    .line 754
    .restart local v4    # "span":I
    const/4 v5, 0x1

    .restart local v5    # "spanDiff":I
    goto :goto_15

    .line 763
    .restart local v2    # "i":I
    .restart local v3    # "params":Landroid/support/v7/widget/GridLayoutManager$LayoutParams;
    .restart local v7    # "view":Landroid/view/View;
    :cond_51
    # setter for: Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->mSpanIndex:I
    invoke-static {v3, v4}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->access$002(Landroid/support/v7/widget/GridLayoutManager$LayoutParams;I)I

    goto :goto_41

    .line 767
    .end local v3    # "params":Landroid/support/v7/widget/GridLayoutManager$LayoutParams;
    .end local v7    # "view":Landroid/view/View;
    :cond_55
    return-void
.end method

.method private cachePreLayoutSpanMapping()V
    .registers 7

    .prologue
    .line 186
    invoke-virtual {p0}, Landroid/support/v7/widget/GridLayoutManager;->getChildCount()I

    move-result v0

    .line 187
    .local v0, "childCount":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_5
    if-ge v1, v0, :cond_2a

    .line 188
    invoke-virtual {p0, v1}, Landroid/support/v7/widget/GridLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;

    .line 189
    .local v2, "lp":Landroid/support/v7/widget/GridLayoutManager$LayoutParams;
    invoke-virtual {v2}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->getViewLayoutPosition()I

    move-result v3

    .line 190
    .local v3, "viewPosition":I
    iget-object v4, p0, Landroid/support/v7/widget/GridLayoutManager;->mPreLayoutSpanSizeCache:Landroid/util/SparseIntArray;

    invoke-virtual {v2}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->getSpanSize()I

    move-result v5

    invoke-virtual {v4, v3, v5}, Landroid/util/SparseIntArray;->put(II)V

    .line 191
    iget-object v4, p0, Landroid/support/v7/widget/GridLayoutManager;->mPreLayoutSpanIndexCache:Landroid/util/SparseIntArray;

    invoke-virtual {v2}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->getSpanIndex()I

    move-result v5

    invoke-virtual {v4, v3, v5}, Landroid/util/SparseIntArray;->put(II)V

    .line 187
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 193
    .end local v2    # "lp":Landroid/support/v7/widget/GridLayoutManager$LayoutParams;
    .end local v3    # "viewPosition":I
    :cond_2a
    return-void
.end method

.method private calculateItemBorders(I)V
    .registers 4
    .param p1, "totalSpace"    # I

    .prologue
    .line 306
    iget-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mCachedBorders:[I

    iget v1, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanCount:I

    invoke-static {v0, v1, p1}, Landroid/support/v7/widget/GridLayoutManager;->calculateItemBorders([III)[I

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mCachedBorders:[I

    .line 307
    return-void
.end method

.method static calculateItemBorders([III)[I
    .registers 12
    .param p0, "cachedBorders"    # [I
    .param p1, "spanCount"    # I
    .param p2, "totalSpace"    # I

    .prologue
    const/4 v8, 0x0

    .line 317
    if-eqz p0, :cond_f

    array-length v6, p0

    add-int/lit8 v7, p1, 0x1

    if-ne v6, v7, :cond_f

    array-length v6, p0

    add-int/lit8 v6, v6, -0x1

    aget v6, p0, v6

    if-eq v6, p2, :cond_13

    .line 319
    :cond_f
    add-int/lit8 v6, p1, 0x1

    new-array p0, v6, [I

    .line 321
    :cond_13
    aput v8, p0, v8

    .line 322
    div-int v4, p2, p1

    .line 323
    .local v4, "sizePerSpan":I
    rem-int v5, p2, p1

    .line 324
    .local v5, "sizePerSpanRemainder":I
    const/4 v1, 0x0

    .line 325
    .local v1, "consumedPixels":I
    const/4 v0, 0x0

    .line 326
    .local v0, "additionalSize":I
    const/4 v2, 0x1

    .local v2, "i":I
    :goto_1c
    if-gt v2, p1, :cond_2f

    .line 327
    move v3, v4

    .line 328
    .local v3, "itemSize":I
    add-int/2addr v0, v5

    .line 329
    if-lez v0, :cond_29

    sub-int v6, p1, v0

    if-ge v6, v5, :cond_29

    .line 330
    add-int/lit8 v3, v3, 0x1

    .line 331
    sub-int/2addr v0, p1

    .line 333
    :cond_29
    add-int/2addr v1, v3

    .line 334
    aput v1, p0, v2

    .line 326
    add-int/lit8 v2, v2, 0x1

    goto :goto_1c

    .line 336
    .end local v3    # "itemSize":I
    :cond_2f
    return-object p0
.end method

.method private clearPreLayoutSpanMappingCache()V
    .registers 2

    .prologue
    .line 181
    iget-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mPreLayoutSpanSizeCache:Landroid/util/SparseIntArray;

    invoke-virtual {v0}, Landroid/util/SparseIntArray;->clear()V

    .line 182
    iget-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mPreLayoutSpanIndexCache:Landroid/util/SparseIntArray;

    invoke-virtual {v0}, Landroid/util/SparseIntArray;->clear()V

    .line 183
    return-void
.end method

.method private ensureAnchorIsInCorrectSpan(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;I)V
    .registers 12
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p3, "anchorInfo"    # Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;
    .param p4, "itemDirection"    # I

    .prologue
    const/4 v2, 0x1

    .line 374
    if-ne p4, v2, :cond_1e

    .line 376
    .local v2, "layingOutInPrimaryDirection":Z
    :goto_3
    iget v6, p3, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mPosition:I

    invoke-direct {p0, p1, p2, v6}, Landroid/support/v7/widget/GridLayoutManager;->getSpanIndex(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;I)I

    move-result v5

    .line 377
    .local v5, "span":I
    if-eqz v2, :cond_20

    .line 379
    :goto_b
    if-lez v5, :cond_39

    iget v6, p3, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mPosition:I

    if-lez v6, :cond_39

    .line 380
    iget v6, p3, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mPosition:I

    add-int/lit8 v6, v6, -0x1

    iput v6, p3, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mPosition:I

    .line 381
    iget v6, p3, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mPosition:I

    invoke-direct {p0, p1, p2, v6}, Landroid/support/v7/widget/GridLayoutManager;->getSpanIndex(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;I)I

    move-result v5

    goto :goto_b

    .line 374
    .end local v2    # "layingOutInPrimaryDirection":Z
    .end local v5    # "span":I
    :cond_1e
    const/4 v2, 0x0

    goto :goto_3

    .line 385
    .restart local v2    # "layingOutInPrimaryDirection":Z
    .restart local v5    # "span":I
    :cond_20
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v6

    add-int/lit8 v1, v6, -0x1

    .line 386
    .local v1, "indexLimit":I
    iget v4, p3, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mPosition:I

    .line 387
    .local v4, "pos":I
    move v0, v5

    .line 388
    .local v0, "bestSpan":I
    :goto_29
    if-ge v4, v1, :cond_37

    .line 389
    add-int/lit8 v6, v4, 0x1

    invoke-direct {p0, p1, p2, v6}, Landroid/support/v7/widget/GridLayoutManager;->getSpanIndex(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;I)I

    move-result v3

    .line 390
    .local v3, "next":I
    if-le v3, v0, :cond_37

    .line 391
    add-int/lit8 v4, v4, 0x1

    .line 392
    move v0, v3

    .line 396
    goto :goto_29

    .line 397
    .end local v3    # "next":I
    :cond_37
    iput v4, p3, Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;->mPosition:I

    .line 399
    .end local v0    # "bestSpan":I
    .end local v1    # "indexLimit":I
    .end local v4    # "pos":I
    :cond_39
    return-void
.end method

.method private ensureViewSet()V
    .registers 3

    .prologue
    .line 351
    iget-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mSet:[Landroid/view/View;

    if-eqz v0, :cond_b

    iget-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mSet:[Landroid/view/View;

    array-length v0, v0

    iget v1, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanCount:I

    if-eq v0, v1, :cond_11

    .line 352
    :cond_b
    iget v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanCount:I

    new-array v0, v0, [Landroid/view/View;

    iput-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mSet:[Landroid/view/View;

    .line 354
    :cond_11
    return-void
.end method

.method private getSpanGroupIndex(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;I)I
    .registers 8
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p3, "viewPosition"    # I

    .prologue
    .line 437
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView$State;->isPreLayout()Z

    move-result v1

    if-nez v1, :cond_f

    .line 438
    iget-object v1, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanSizeLookup:Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;

    iget v2, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanCount:I

    invoke-virtual {v1, p3, v2}, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->getSpanGroupIndex(II)I

    move-result v1

    .line 449
    :goto_e
    return v1

    .line 440
    :cond_f
    invoke-virtual {p1, p3}, Landroid/support/v7/widget/RecyclerView$Recycler;->convertPreLayoutPositionToPostLayout(I)I

    move-result v0

    .line 441
    .local v0, "adapterPosition":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_30

    .line 446
    const-string v1, "GridLayoutManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Cannot find span size for pre layout position. "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 447
    const/4 v1, 0x0

    goto :goto_e

    .line 449
    :cond_30
    iget-object v1, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanSizeLookup:Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;

    iget v2, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanCount:I

    invoke-virtual {v1, v0, v2}, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->getSpanGroupIndex(II)I

    move-result v1

    goto :goto_e
.end method

.method private getSpanIndex(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;I)I
    .registers 9
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p3, "pos"    # I

    .prologue
    const/4 v3, -0x1

    .line 453
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView$State;->isPreLayout()Z

    move-result v2

    if-nez v2, :cond_10

    .line 454
    iget-object v2, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanSizeLookup:Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;

    iget v3, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanCount:I

    invoke-virtual {v2, p3, v3}, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->getCachedSpanIndex(II)I

    move-result v1

    .line 470
    :cond_f
    :goto_f
    return v1

    .line 456
    :cond_10
    iget-object v2, p0, Landroid/support/v7/widget/GridLayoutManager;->mPreLayoutSpanIndexCache:Landroid/util/SparseIntArray;

    invoke-virtual {v2, p3, v3}, Landroid/util/SparseIntArray;->get(II)I

    move-result v1

    .line 457
    .local v1, "cached":I
    if-ne v1, v3, :cond_f

    .line 460
    invoke-virtual {p1, p3}, Landroid/support/v7/widget/RecyclerView$Recycler;->convertPreLayoutPositionToPostLayout(I)I

    move-result v0

    .line 461
    .local v0, "adapterPosition":I
    if-ne v0, v3, :cond_38

    .line 466
    const-string v2, "GridLayoutManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Cannot find span size for pre layout position. It is not cached, not in the adapter. Pos:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 468
    const/4 v1, 0x0

    goto :goto_f

    .line 470
    :cond_38
    iget-object v2, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanSizeLookup:Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;

    iget v3, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanCount:I

    invoke-virtual {v2, v0, v3}, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->getCachedSpanIndex(II)I

    move-result v1

    goto :goto_f
.end method

.method private getSpanSize(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;I)I
    .registers 9
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p3, "pos"    # I

    .prologue
    const/4 v3, -0x1

    .line 474
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView$State;->isPreLayout()Z

    move-result v2

    if-nez v2, :cond_e

    .line 475
    iget-object v2, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanSizeLookup:Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;

    invoke-virtual {v2, p3}, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->getSpanSize(I)I

    move-result v1

    .line 491
    :cond_d
    :goto_d
    return v1

    .line 477
    :cond_e
    iget-object v2, p0, Landroid/support/v7/widget/GridLayoutManager;->mPreLayoutSpanSizeCache:Landroid/util/SparseIntArray;

    invoke-virtual {v2, p3, v3}, Landroid/util/SparseIntArray;->get(II)I

    move-result v1

    .line 478
    .local v1, "cached":I
    if-ne v1, v3, :cond_d

    .line 481
    invoke-virtual {p1, p3}, Landroid/support/v7/widget/RecyclerView$Recycler;->convertPreLayoutPositionToPostLayout(I)I

    move-result v0

    .line 482
    .local v0, "adapterPosition":I
    if-ne v0, v3, :cond_36

    .line 487
    const-string v2, "GridLayoutManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Cannot find span size for pre layout position. It is not cached, not in the adapter. Pos:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 489
    const/4 v1, 0x1

    goto :goto_d

    .line 491
    :cond_36
    iget-object v2, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanSizeLookup:Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;

    invoke-virtual {v2, v0}, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->getSpanSize(I)I

    move-result v1

    goto :goto_d
.end method

.method private guessMeasurement(FI)V
    .registers 5
    .param p1, "maxSizeInOther"    # F
    .param p2, "currentOtherDirSize"    # I

    .prologue
    .line 695
    iget v1, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanCount:I

    int-to-float v1, v1

    mul-float/2addr v1, p1

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v0

    .line 697
    .local v0, "contentSize":I
    invoke-static {v0, p2}, Ljava/lang/Math;->max(II)I

    move-result v1

    invoke-direct {p0, v1}, Landroid/support/v7/widget/GridLayoutManager;->calculateItemBorders(I)V

    .line 698
    return-void
.end method

.method private measureChildWithDecorationsAndMargin(Landroid/view/View;IIZZ)V
    .registers 11
    .param p1, "child"    # Landroid/view/View;
    .param p2, "widthSpec"    # I
    .param p3, "heightSpec"    # I
    .param p4, "capBothSpecs"    # Z
    .param p5, "alreadyMeasured"    # Z

    .prologue
    .line 702
    iget-object v2, p0, Landroid/support/v7/widget/GridLayoutManager;->mDecorInsets:Landroid/graphics/Rect;

    invoke-virtual {p0, p1, v2}, Landroid/support/v7/widget/GridLayoutManager;->calculateItemDecorationsForChild(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 703
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    .line 704
    .local v0, "lp":Landroid/support/v7/widget/RecyclerView$LayoutParams;
    if-nez p4, :cond_12

    iget v2, p0, Landroid/support/v7/widget/GridLayoutManager;->mOrientation:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_24

    .line 705
    :cond_12
    iget v2, v0, Landroid/support/v7/widget/RecyclerView$LayoutParams;->leftMargin:I

    iget-object v3, p0, Landroid/support/v7/widget/GridLayoutManager;->mDecorInsets:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->left:I

    add-int/2addr v2, v3

    iget v3, v0, Landroid/support/v7/widget/RecyclerView$LayoutParams;->rightMargin:I

    iget-object v4, p0, Landroid/support/v7/widget/GridLayoutManager;->mDecorInsets:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->right:I

    add-int/2addr v3, v4

    invoke-direct {p0, p2, v2, v3}, Landroid/support/v7/widget/GridLayoutManager;->updateSpecWithExtra(III)I

    move-result p2

    .line 708
    :cond_24
    if-nez p4, :cond_2a

    iget v2, p0, Landroid/support/v7/widget/GridLayoutManager;->mOrientation:I

    if-nez v2, :cond_3c

    .line 709
    :cond_2a
    iget v2, v0, Landroid/support/v7/widget/RecyclerView$LayoutParams;->topMargin:I

    iget-object v3, p0, Landroid/support/v7/widget/GridLayoutManager;->mDecorInsets:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->top:I

    add-int/2addr v2, v3

    iget v3, v0, Landroid/support/v7/widget/RecyclerView$LayoutParams;->bottomMargin:I

    iget-object v4, p0, Landroid/support/v7/widget/GridLayoutManager;->mDecorInsets:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v3, v4

    invoke-direct {p0, p3, v2, v3}, Landroid/support/v7/widget/GridLayoutManager;->updateSpecWithExtra(III)I

    move-result p3

    .line 713
    :cond_3c
    if-eqz p5, :cond_48

    .line 714
    invoke-virtual {p0, p1, p2, p3, v0}, Landroid/support/v7/widget/GridLayoutManager;->shouldReMeasureChild(Landroid/view/View;IILandroid/support/v7/widget/RecyclerView$LayoutParams;)Z

    move-result v1

    .line 718
    .local v1, "measure":Z
    :goto_42
    if-eqz v1, :cond_47

    .line 719
    invoke-virtual {p1, p2, p3}, Landroid/view/View;->measure(II)V

    .line 722
    :cond_47
    return-void

    .line 716
    .end local v1    # "measure":Z
    :cond_48
    invoke-virtual {p0, p1, p2, p3, v0}, Landroid/support/v7/widget/GridLayoutManager;->shouldMeasureChild(Landroid/view/View;IILandroid/support/v7/widget/RecyclerView$LayoutParams;)Z

    move-result v1

    .restart local v1    # "measure":Z
    goto :goto_42
.end method

.method private updateMeasurements()V
    .registers 4

    .prologue
    .line 272
    invoke-virtual {p0}, Landroid/support/v7/widget/GridLayoutManager;->getOrientation()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_1a

    .line 273
    invoke-virtual {p0}, Landroid/support/v7/widget/GridLayoutManager;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Landroid/support/v7/widget/GridLayoutManager;->getPaddingRight()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {p0}, Landroid/support/v7/widget/GridLayoutManager;->getPaddingLeft()I

    move-result v2

    sub-int v0, v1, v2

    .line 277
    .local v0, "totalSpace":I
    :goto_16
    invoke-direct {p0, v0}, Landroid/support/v7/widget/GridLayoutManager;->calculateItemBorders(I)V

    .line 278
    return-void

    .line 275
    .end local v0    # "totalSpace":I
    :cond_1a
    invoke-virtual {p0}, Landroid/support/v7/widget/GridLayoutManager;->getHeight()I

    move-result v1

    invoke-virtual {p0}, Landroid/support/v7/widget/GridLayoutManager;->getPaddingBottom()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {p0}, Landroid/support/v7/widget/GridLayoutManager;->getPaddingTop()I

    move-result v2

    sub-int v0, v1, v2

    .restart local v0    # "totalSpace":I
    goto :goto_16
.end method

.method private updateSpecWithExtra(III)I
    .registers 6
    .param p1, "spec"    # I
    .param p2, "startInset"    # I
    .param p3, "endInset"    # I

    .prologue
    .line 725
    if-nez p2, :cond_5

    if-nez p3, :cond_5

    .line 733
    .end local p1    # "spec":I
    :cond_4
    :goto_4
    return p1

    .line 728
    .restart local p1    # "spec":I
    :cond_5
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    .line 729
    .local v0, "mode":I
    const/high16 v1, -0x80000000

    if-eq v0, v1, :cond_11

    const/high16 v1, 0x40000000    # 2.0f

    if-ne v0, v1, :cond_4

    .line 730
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
.method public checkLayoutParams(Landroid/support/v7/widget/RecyclerView$LayoutParams;)Z
    .registers 3
    .param p1, "lp"    # Landroid/support/v7/widget/RecyclerView$LayoutParams;

    .prologue
    .line 248
    instance-of v0, p1, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;

    return v0
.end method

.method findReferenceChild(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;III)Landroid/view/View;
    .registers 16
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p3, "start"    # I
    .param p4, "end"    # I
    .param p5, "itemCount"    # I

    .prologue
    .line 404
    invoke-virtual {p0}, Landroid/support/v7/widget/GridLayoutManager;->ensureLayoutState()V

    .line 405
    const/4 v4, 0x0

    .line 406
    .local v4, "invalidMatch":Landroid/view/View;
    const/4 v5, 0x0

    .line 407
    .local v5, "outOfBoundsMatch":Landroid/view/View;
    iget-object v9, p0, Landroid/support/v7/widget/GridLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v9}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v1

    .line 408
    .local v1, "boundsStart":I
    iget-object v9, p0, Landroid/support/v7/widget/GridLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v9}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v0

    .line 409
    .local v0, "boundsEnd":I
    if-le p4, p3, :cond_2b

    const/4 v2, 0x1

    .line 410
    .local v2, "diff":I
    :goto_14
    move v3, p3

    .local v3, "i":I
    :goto_15
    if-eq v3, p4, :cond_51

    .line 411
    invoke-virtual {p0, v3}, Landroid/support/v7/widget/GridLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    .line 412
    .local v8, "view":Landroid/view/View;
    invoke-virtual {p0, v8}, Landroid/support/v7/widget/GridLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v6

    .line 413
    .local v6, "position":I
    if-ltz v6, :cond_29

    if-ge v6, p5, :cond_29

    .line 414
    invoke-direct {p0, p1, p2, v6}, Landroid/support/v7/widget/GridLayoutManager;->getSpanIndex(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;I)I

    move-result v7

    .line 415
    .local v7, "span":I
    if-eqz v7, :cond_2d

    .line 410
    .end local v7    # "span":I
    :cond_29
    :goto_29
    add-int/2addr v3, v2

    goto :goto_15

    .line 409
    .end local v2    # "diff":I
    .end local v3    # "i":I
    .end local v6    # "position":I
    .end local v8    # "view":Landroid/view/View;
    :cond_2b
    const/4 v2, -0x1

    goto :goto_14

    .line 418
    .restart local v2    # "diff":I
    .restart local v3    # "i":I
    .restart local v6    # "position":I
    .restart local v7    # "span":I
    .restart local v8    # "view":Landroid/view/View;
    :cond_2d
    invoke-virtual {v8}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v9

    check-cast v9, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    invoke-virtual {v9}, Landroid/support/v7/widget/RecyclerView$LayoutParams;->isItemRemoved()Z

    move-result v9

    if-eqz v9, :cond_3d

    .line 419
    if-nez v4, :cond_29

    .line 420
    move-object v4, v8

    goto :goto_29

    .line 422
    :cond_3d
    iget-object v9, p0, Landroid/support/v7/widget/GridLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v9, v8}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v9

    if-ge v9, v0, :cond_4d

    iget-object v9, p0, Landroid/support/v7/widget/GridLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v9, v8}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedEnd(Landroid/view/View;)I

    move-result v9

    if-ge v9, v1, :cond_54

    .line 424
    :cond_4d
    if-nez v5, :cond_29

    .line 425
    move-object v5, v8

    goto :goto_29

    .line 432
    .end local v6    # "position":I
    .end local v7    # "span":I
    .end local v8    # "view":Landroid/view/View;
    :cond_51
    if-eqz v5, :cond_55

    .end local v5    # "outOfBoundsMatch":Landroid/view/View;
    :goto_53
    move-object v8, v5

    :cond_54
    return-object v8

    .restart local v5    # "outOfBoundsMatch":Landroid/view/View;
    :cond_55
    move-object v5, v4

    goto :goto_53
.end method

.method public generateDefaultLayoutParams()Landroid/support/v7/widget/RecyclerView$LayoutParams;
    .registers 4

    .prologue
    const/4 v2, -0x1

    const/4 v1, -0x2

    .line 223
    iget v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mOrientation:I

    if-nez v0, :cond_c

    .line 224
    new-instance v0, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;

    invoke-direct {v0, v1, v2}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;-><init>(II)V

    .line 227
    :goto_b
    return-object v0

    :cond_c
    new-instance v0, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;

    invoke-direct {v0, v2, v1}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;-><init>(II)V

    goto :goto_b
.end method

.method public generateLayoutParams(Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/support/v7/widget/RecyclerView$LayoutParams;
    .registers 4
    .param p1, "c"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 234
    new-instance v0, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;

    invoke-direct {v0, p1, p2}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method public generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/support/v7/widget/RecyclerView$LayoutParams;
    .registers 3
    .param p1, "lp"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 239
    instance-of v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v0, :cond_c

    .line 240
    new-instance v0, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;

    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .end local p1    # "lp":Landroid/view/ViewGroup$LayoutParams;
    invoke-direct {v0, p1}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    .line 242
    :goto_b
    return-object v0

    .restart local p1    # "lp":Landroid/view/ViewGroup$LayoutParams;
    :cond_c
    new-instance v0, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;

    invoke-direct {v0, p1}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_b
.end method

.method public getColumnCountForAccessibility(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 5
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    const/4 v1, 0x1

    .line 131
    iget v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mOrientation:I

    if-ne v0, v1, :cond_8

    .line 132
    iget v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanCount:I

    .line 139
    :goto_7
    return v0

    .line 134
    :cond_8
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v0

    if-ge v0, v1, :cond_10

    .line 135
    const/4 v0, 0x0

    goto :goto_7

    .line 139
    :cond_10
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-direct {p0, p1, p2, v0}, Landroid/support/v7/widget/GridLayoutManager;->getSpanGroupIndex(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;I)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_7
.end method

.method public getRowCountForAccessibility(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 5
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 117
    iget v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mOrientation:I

    if-nez v0, :cond_7

    .line 118
    iget v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanCount:I

    .line 125
    :goto_6
    return v0

    .line 120
    :cond_7
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v0

    const/4 v1, 0x1

    if-ge v0, v1, :cond_10

    .line 121
    const/4 v0, 0x0

    goto :goto_6

    .line 125
    :cond_10
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-direct {p0, p1, p2, v0}, Landroid/support/v7/widget/GridLayoutManager;->getSpanGroupIndex(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;I)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_6
.end method

.method public getSpanCount()I
    .registers 2

    .prologue
    .line 776
    iget v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanCount:I

    return v0
.end method

.method public getSpanSizeLookup()Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;
    .registers 2

    .prologue
    .line 267
    iget-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanSizeLookup:Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;

    return-object v0
.end method

.method layoutChunk(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/LinearLayoutManager$LayoutState;Landroid/support/v7/widget/LinearLayoutManager$LayoutChunkResult;)V
    .registers 48
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p3, "layoutState"    # Landroid/support/v7/widget/LinearLayoutManager$LayoutState;
    .param p4, "result"    # Landroid/support/v7/widget/LinearLayoutManager$LayoutChunkResult;

    .prologue
    .line 497
    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/v7/widget/GridLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4}, Landroid/support/v7/widget/OrientationHelper;->getModeInOther()I

    move-result v34

    .line 498
    .local v34, "otherDirSpecMode":I
    const/high16 v4, 0x40000000    # 2.0f

    move/from16 v0, v34

    if-eq v0, v4, :cond_bc

    const/16 v26, 0x1

    .line 499
    .local v26, "flexibleInOtherDir":Z
    :goto_10
    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/GridLayoutManager;->getChildCount()I

    move-result v4

    if-lez v4, :cond_c0

    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/v7/widget/GridLayoutManager;->mCachedBorders:[I

    move-object/from16 v0, p0

    iget v5, v0, Landroid/support/v7/widget/GridLayoutManager;->mSpanCount:I

    aget v25, v4, v5

    .line 503
    .local v25, "currentOtherDirSize":I
    :goto_20
    if-eqz v26, :cond_25

    .line 504
    invoke-direct/range {p0 .. p0}, Landroid/support/v7/widget/GridLayoutManager;->updateMeasurements()V

    .line 506
    :cond_25
    move-object/from16 v0, p3

    iget v4, v0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mItemDirection:I

    const/4 v5, 0x1

    if-ne v4, v5, :cond_c4

    const/4 v9, 0x1

    .line 508
    .local v9, "layingOutInPrimaryDirection":Z
    :goto_2d
    const/4 v7, 0x0

    .line 509
    .local v7, "count":I
    const/4 v8, 0x0

    .line 510
    .local v8, "consumedSpanCount":I
    move-object/from16 v0, p0

    iget v0, v0, Landroid/support/v7/widget/GridLayoutManager;->mSpanCount:I

    move/from16 v38, v0

    .line 511
    .local v38, "remainingSpan":I
    if-nez v9, :cond_55

    .line 512
    move-object/from16 v0, p3

    iget v4, v0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mCurrentPosition:I

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-direct {v0, v1, v2, v4}, Landroid/support/v7/widget/GridLayoutManager;->getSpanIndex(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;I)I

    move-result v28

    .line 513
    .local v28, "itemSpanIndex":I
    move-object/from16 v0, p3

    iget v4, v0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mCurrentPosition:I

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-direct {v0, v1, v2, v4}, Landroid/support/v7/widget/GridLayoutManager;->getSpanSize(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;I)I

    move-result v29

    .line 514
    .local v29, "itemSpanSize":I
    add-int v38, v28, v29

    .line 516
    .end local v28    # "itemSpanIndex":I
    .end local v29    # "itemSpanSize":I
    :cond_55
    :goto_55
    move-object/from16 v0, p0

    iget v4, v0, Landroid/support/v7/widget/GridLayoutManager;->mSpanCount:I

    if-ge v7, v4, :cond_cb

    move-object/from16 v0, p3

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->hasMore(Landroid/support/v7/widget/RecyclerView$State;)Z

    move-result v4

    if-eqz v4, :cond_cb

    if-lez v38, :cond_cb

    .line 517
    move-object/from16 v0, p3

    iget v0, v0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mCurrentPosition:I

    move/from16 v37, v0

    .line 518
    .local v37, "pos":I
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move/from16 v3, v37

    invoke-direct {v0, v1, v2, v3}, Landroid/support/v7/widget/GridLayoutManager;->getSpanSize(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;I)I

    move-result v41

    .line 519
    .local v41, "spanSize":I
    move-object/from16 v0, p0

    iget v4, v0, Landroid/support/v7/widget/GridLayoutManager;->mSpanCount:I

    move/from16 v0, v41

    if-le v0, v4, :cond_c7

    .line 520
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Item at position "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move/from16 v0, v37

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " requires "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move/from16 v0, v41

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " spans but GridLayoutManager has only "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p0

    iget v6, v0, Landroid/support/v7/widget/GridLayoutManager;->mSpanCount:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " spans."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 498
    .end local v7    # "count":I
    .end local v8    # "consumedSpanCount":I
    .end local v9    # "layingOutInPrimaryDirection":Z
    .end local v25    # "currentOtherDirSize":I
    .end local v26    # "flexibleInOtherDir":Z
    .end local v37    # "pos":I
    .end local v38    # "remainingSpan":I
    .end local v41    # "spanSize":I
    :cond_bc
    const/16 v26, 0x0

    goto/16 :goto_10

    .line 499
    .restart local v26    # "flexibleInOtherDir":Z
    :cond_c0
    const/16 v25, 0x0

    goto/16 :goto_20

    .line 506
    .restart local v25    # "currentOtherDirSize":I
    :cond_c4
    const/4 v9, 0x0

    goto/16 :goto_2d

    .line 524
    .restart local v7    # "count":I
    .restart local v8    # "consumedSpanCount":I
    .restart local v9    # "layingOutInPrimaryDirection":Z
    .restart local v37    # "pos":I
    .restart local v38    # "remainingSpan":I
    .restart local v41    # "spanSize":I
    :cond_c7
    sub-int v38, v38, v41

    .line 525
    if-gez v38, :cond_d3

    .line 537
    .end local v37    # "pos":I
    .end local v41    # "spanSize":I
    :cond_cb
    if-nez v7, :cond_e9

    .line 538
    const/4 v4, 0x1

    move-object/from16 v0, p4

    iput-boolean v4, v0, Landroid/support/v7/widget/LinearLayoutManager$LayoutChunkResult;->mFinished:Z

    .line 682
    :goto_d2
    return-void

    .line 528
    .restart local v37    # "pos":I
    .restart local v41    # "spanSize":I
    :cond_d3
    move-object/from16 v0, p3

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->next(Landroid/support/v7/widget/RecyclerView$Recycler;)Landroid/view/View;

    move-result-object v11

    .line 529
    .local v11, "view":Landroid/view/View;
    if-eqz v11, :cond_cb

    .line 532
    add-int v8, v8, v41

    .line 533
    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/v7/widget/GridLayoutManager;->mSet:[Landroid/view/View;

    aput-object v11, v4, v7

    .line 534
    add-int/lit8 v7, v7, 0x1

    .line 535
    goto/16 :goto_55

    .line 542
    .end local v11    # "view":Landroid/view/View;
    .end local v37    # "pos":I
    .end local v41    # "spanSize":I
    :cond_e9
    const/16 v32, 0x0

    .line 543
    .local v32, "maxSize":I
    const/16 v33, 0x0

    .local v33, "maxSizeInOther":F
    move-object/from16 v4, p0

    move-object/from16 v5, p1

    move-object/from16 v6, p2

    .line 546
    invoke-direct/range {v4 .. v9}, Landroid/support/v7/widget/GridLayoutManager;->assignSpans(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;IIZ)V

    .line 547
    const/16 v27, 0x0

    .local v27, "i":I
    :goto_f8
    move/from16 v0, v27

    if-ge v0, v7, :cond_1d0

    .line 548
    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/v7/widget/GridLayoutManager;->mSet:[Landroid/view/View;

    aget-object v11, v4, v27

    .line 549
    .restart local v11    # "view":Landroid/view/View;
    move-object/from16 v0, p3

    iget-object v4, v0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mScrapList:Ljava/util/List;

    if-nez v4, :cond_1a6

    .line 550
    if-eqz v9, :cond_19e

    .line 551
    move-object/from16 v0, p0

    invoke-virtual {v0, v11}, Landroid/support/v7/widget/GridLayoutManager;->addView(Landroid/view/View;)V

    .line 563
    :goto_10f
    invoke-virtual {v11}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v31

    check-cast v31, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;

    .line 564
    .local v31, "lp":Landroid/support/v7/widget/GridLayoutManager$LayoutParams;
    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/v7/widget/GridLayoutManager;->mCachedBorders:[I

    # getter for: Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->mSpanIndex:I
    invoke-static/range {v31 .. v31}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->access$000(Landroid/support/v7/widget/GridLayoutManager$LayoutParams;)I

    move-result v5

    # getter for: Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->mSpanSize:I
    invoke-static/range {v31 .. v31}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->access$100(Landroid/support/v7/widget/GridLayoutManager$LayoutParams;)I

    move-result v6

    add-int/2addr v5, v6

    aget v4, v4, v5

    move-object/from16 v0, p0

    iget-object v5, v0, Landroid/support/v7/widget/GridLayoutManager;->mCachedBorders:[I

    # getter for: Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->mSpanIndex:I
    invoke-static/range {v31 .. v31}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->access$000(Landroid/support/v7/widget/GridLayoutManager$LayoutParams;)I

    move-result v6

    aget v5, v5, v6

    sub-int v5, v4, v5

    const/4 v6, 0x0

    move-object/from16 v0, p0

    iget v4, v0, Landroid/support/v7/widget/GridLayoutManager;->mOrientation:I

    if-nez v4, :cond_1b7

    move-object/from16 v0, v31

    iget v4, v0, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->height:I

    :goto_13b
    const/4 v10, 0x0

    move/from16 v0, v34

    invoke-static {v5, v0, v6, v4, v10}, Landroid/support/v7/widget/GridLayoutManager;->getChildMeasureSpec(IIIIZ)I

    move-result v12

    .line 568
    .local v12, "spec":I
    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/v7/widget/GridLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4}, Landroid/support/v7/widget/OrientationHelper;->getTotalSpace()I

    move-result v5

    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/v7/widget/GridLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4}, Landroid/support/v7/widget/OrientationHelper;->getMode()I

    move-result v6

    const/4 v10, 0x0

    move-object/from16 v0, p0

    iget v4, v0, Landroid/support/v7/widget/GridLayoutManager;->mOrientation:I

    const/4 v14, 0x1

    if-ne v4, v14, :cond_1bc

    move-object/from16 v0, v31

    iget v4, v0, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->height:I

    :goto_15e
    const/4 v14, 0x1

    invoke-static {v5, v6, v10, v4, v14}, Landroid/support/v7/widget/GridLayoutManager;->getChildMeasureSpec(IIIIZ)I

    move-result v13

    .line 571
    .local v13, "mainSpec":I
    move-object/from16 v0, p0

    iget v4, v0, Landroid/support/v7/widget/GridLayoutManager;->mOrientation:I

    const/4 v5, 0x1

    if-ne v4, v5, :cond_1c1

    .line 572
    const/4 v14, 0x0

    const/4 v15, 0x0

    move-object/from16 v10, p0

    invoke-direct/range {v10 .. v15}, Landroid/support/v7/widget/GridLayoutManager;->measureChildWithDecorationsAndMargin(Landroid/view/View;IIZZ)V

    .line 576
    :goto_171
    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/v7/widget/GridLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4, v11}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedMeasurement(Landroid/view/View;)I

    move-result v40

    .line 577
    .local v40, "size":I
    move/from16 v0, v40

    move/from16 v1, v32

    if-le v0, v1, :cond_181

    .line 578
    move/from16 v32, v40

    .line 580
    :cond_181
    const/high16 v4, 0x3f800000    # 1.0f

    move-object/from16 v0, p0

    iget-object v5, v0, Landroid/support/v7/widget/GridLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v5, v11}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedMeasurementInOther(Landroid/view/View;)I

    move-result v5

    int-to-float v5, v5

    mul-float/2addr v4, v5

    # getter for: Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->mSpanSize:I
    invoke-static/range {v31 .. v31}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->access$100(Landroid/support/v7/widget/GridLayoutManager$LayoutParams;)I

    move-result v5

    int-to-float v5, v5

    div-float v35, v4, v5

    .line 582
    .local v35, "otherSize":F
    cmpl-float v4, v35, v33

    if-lez v4, :cond_19a

    .line 583
    move/from16 v33, v35

    .line 547
    :cond_19a
    add-int/lit8 v27, v27, 0x1

    goto/16 :goto_f8

    .line 553
    .end local v12    # "spec":I
    .end local v13    # "mainSpec":I
    .end local v31    # "lp":Landroid/support/v7/widget/GridLayoutManager$LayoutParams;
    .end local v35    # "otherSize":F
    .end local v40    # "size":I
    :cond_19e
    const/4 v4, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v11, v4}, Landroid/support/v7/widget/GridLayoutManager;->addView(Landroid/view/View;I)V

    goto/16 :goto_10f

    .line 556
    :cond_1a6
    if-eqz v9, :cond_1af

    .line 557
    move-object/from16 v0, p0

    invoke-virtual {v0, v11}, Landroid/support/v7/widget/GridLayoutManager;->addDisappearingView(Landroid/view/View;)V

    goto/16 :goto_10f

    .line 559
    :cond_1af
    const/4 v4, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v11, v4}, Landroid/support/v7/widget/GridLayoutManager;->addDisappearingView(Landroid/view/View;I)V

    goto/16 :goto_10f

    .line 564
    .restart local v31    # "lp":Landroid/support/v7/widget/GridLayoutManager$LayoutParams;
    :cond_1b7
    move-object/from16 v0, v31

    iget v4, v0, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->width:I

    goto :goto_13b

    .line 568
    .restart local v12    # "spec":I
    :cond_1bc
    move-object/from16 v0, v31

    iget v4, v0, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->width:I

    goto :goto_15e

    .line 574
    .restart local v13    # "mainSpec":I
    :cond_1c1
    const/16 v18, 0x0

    const/16 v19, 0x0

    move-object/from16 v14, p0

    move-object v15, v11

    move/from16 v16, v13

    move/from16 v17, v12

    invoke-direct/range {v14 .. v19}, Landroid/support/v7/widget/GridLayoutManager;->measureChildWithDecorationsAndMargin(Landroid/view/View;IIZZ)V

    goto :goto_171

    .line 586
    .end local v11    # "view":Landroid/view/View;
    .end local v12    # "spec":I
    .end local v13    # "mainSpec":I
    .end local v31    # "lp":Landroid/support/v7/widget/GridLayoutManager$LayoutParams;
    :cond_1d0
    if-eqz v26, :cond_277

    .line 588
    move-object/from16 v0, p0

    move/from16 v1, v33

    move/from16 v2, v25

    invoke-direct {v0, v1, v2}, Landroid/support/v7/widget/GridLayoutManager;->guessMeasurement(FI)V

    .line 590
    const/16 v32, 0x0

    .line 591
    const/16 v27, 0x0

    :goto_1df
    move/from16 v0, v27

    if-ge v0, v7, :cond_277

    .line 592
    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/v7/widget/GridLayoutManager;->mSet:[Landroid/view/View;

    aget-object v11, v4, v27

    .line 593
    .restart local v11    # "view":Landroid/view/View;
    invoke-virtual {v11}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v31

    check-cast v31, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;

    .line 594
    .restart local v31    # "lp":Landroid/support/v7/widget/GridLayoutManager$LayoutParams;
    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/v7/widget/GridLayoutManager;->mCachedBorders:[I

    # getter for: Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->mSpanIndex:I
    invoke-static/range {v31 .. v31}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->access$000(Landroid/support/v7/widget/GridLayoutManager$LayoutParams;)I

    move-result v5

    # getter for: Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->mSpanSize:I
    invoke-static/range {v31 .. v31}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->access$100(Landroid/support/v7/widget/GridLayoutManager$LayoutParams;)I

    move-result v6

    add-int/2addr v5, v6

    aget v4, v4, v5

    move-object/from16 v0, p0

    iget-object v5, v0, Landroid/support/v7/widget/GridLayoutManager;->mCachedBorders:[I

    # getter for: Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->mSpanIndex:I
    invoke-static/range {v31 .. v31}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->access$000(Landroid/support/v7/widget/GridLayoutManager$LayoutParams;)I

    move-result v6

    aget v5, v5, v6

    sub-int v5, v4, v5

    const/high16 v6, 0x40000000    # 2.0f

    const/4 v10, 0x0

    move-object/from16 v0, p0

    iget v4, v0, Landroid/support/v7/widget/GridLayoutManager;->mOrientation:I

    if-nez v4, :cond_25e

    move-object/from16 v0, v31

    iget v4, v0, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->height:I

    :goto_217
    const/4 v14, 0x0

    invoke-static {v5, v6, v10, v4, v14}, Landroid/support/v7/widget/GridLayoutManager;->getChildMeasureSpec(IIIIZ)I

    move-result v12

    .line 597
    .restart local v12    # "spec":I
    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/v7/widget/GridLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4}, Landroid/support/v7/widget/OrientationHelper;->getTotalSpace()I

    move-result v5

    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/v7/widget/GridLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4}, Landroid/support/v7/widget/OrientationHelper;->getMode()I

    move-result v6

    const/4 v10, 0x0

    move-object/from16 v0, p0

    iget v4, v0, Landroid/support/v7/widget/GridLayoutManager;->mOrientation:I

    const/4 v14, 0x1

    if-ne v4, v14, :cond_263

    move-object/from16 v0, v31

    iget v4, v0, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->height:I

    :goto_238
    const/4 v14, 0x1

    invoke-static {v5, v6, v10, v4, v14}, Landroid/support/v7/widget/GridLayoutManager;->getChildMeasureSpec(IIIIZ)I

    move-result v13

    .line 600
    .restart local v13    # "mainSpec":I
    move-object/from16 v0, p0

    iget v4, v0, Landroid/support/v7/widget/GridLayoutManager;->mOrientation:I

    const/4 v5, 0x1

    if-ne v4, v5, :cond_268

    .line 601
    const/4 v14, 0x0

    const/4 v15, 0x1

    move-object/from16 v10, p0

    invoke-direct/range {v10 .. v15}, Landroid/support/v7/widget/GridLayoutManager;->measureChildWithDecorationsAndMargin(Landroid/view/View;IIZZ)V

    .line 605
    :goto_24b
    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/v7/widget/GridLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4, v11}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedMeasurement(Landroid/view/View;)I

    move-result v40

    .line 606
    .restart local v40    # "size":I
    move/from16 v0, v40

    move/from16 v1, v32

    if-le v0, v1, :cond_25b

    .line 607
    move/from16 v32, v40

    .line 591
    :cond_25b
    add-int/lit8 v27, v27, 0x1

    goto :goto_1df

    .line 594
    .end local v12    # "spec":I
    .end local v13    # "mainSpec":I
    .end local v40    # "size":I
    :cond_25e
    move-object/from16 v0, v31

    iget v4, v0, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->width:I

    goto :goto_217

    .line 597
    .restart local v12    # "spec":I
    :cond_263
    move-object/from16 v0, v31

    iget v4, v0, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->width:I

    goto :goto_238

    .line 603
    .restart local v13    # "mainSpec":I
    :cond_268
    const/16 v18, 0x0

    const/16 v19, 0x1

    move-object/from16 v14, p0

    move-object v15, v11

    move/from16 v16, v13

    move/from16 v17, v12

    invoke-direct/range {v14 .. v19}, Landroid/support/v7/widget/GridLayoutManager;->measureChildWithDecorationsAndMargin(Landroid/view/View;IIZZ)V

    goto :goto_24b

    .line 613
    .end local v11    # "view":Landroid/view/View;
    .end local v12    # "spec":I
    .end local v13    # "mainSpec":I
    .end local v31    # "lp":Landroid/support/v7/widget/GridLayoutManager$LayoutParams;
    :cond_277
    const/high16 v4, 0x40000000    # 2.0f

    move/from16 v0, v32

    invoke-static {v0, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v17

    .line 615
    .local v17, "maxMeasureSpec":I
    const/16 v27, 0x0

    :goto_281
    move/from16 v0, v27

    if-ge v0, v7, :cond_2f3

    .line 616
    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/v7/widget/GridLayoutManager;->mSet:[Landroid/view/View;

    aget-object v11, v4, v27

    .line 617
    .restart local v11    # "view":Landroid/view/View;
    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/v7/widget/GridLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4, v11}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedMeasurement(Landroid/view/View;)I

    move-result v4

    move/from16 v0, v32

    if-eq v4, v0, :cond_2dd

    .line 618
    invoke-virtual {v11}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v31

    check-cast v31, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;

    .line 619
    .restart local v31    # "lp":Landroid/support/v7/widget/GridLayoutManager$LayoutParams;
    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/v7/widget/GridLayoutManager;->mCachedBorders:[I

    # getter for: Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->mSpanIndex:I
    invoke-static/range {v31 .. v31}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->access$000(Landroid/support/v7/widget/GridLayoutManager$LayoutParams;)I

    move-result v5

    # getter for: Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->mSpanSize:I
    invoke-static/range {v31 .. v31}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->access$100(Landroid/support/v7/widget/GridLayoutManager$LayoutParams;)I

    move-result v6

    add-int/2addr v5, v6

    aget v4, v4, v5

    move-object/from16 v0, p0

    iget-object v5, v0, Landroid/support/v7/widget/GridLayoutManager;->mCachedBorders:[I

    # getter for: Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->mSpanIndex:I
    invoke-static/range {v31 .. v31}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->access$000(Landroid/support/v7/widget/GridLayoutManager$LayoutParams;)I

    move-result v6

    aget v5, v5, v6

    sub-int v5, v4, v5

    const/high16 v6, 0x40000000    # 2.0f

    const/4 v10, 0x0

    move-object/from16 v0, p0

    iget v4, v0, Landroid/support/v7/widget/GridLayoutManager;->mOrientation:I

    if-nez v4, :cond_2e0

    move-object/from16 v0, v31

    iget v4, v0, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->height:I

    :goto_2c5
    const/4 v14, 0x0

    invoke-static {v5, v6, v10, v4, v14}, Landroid/support/v7/widget/GridLayoutManager;->getChildMeasureSpec(IIIIZ)I

    move-result v12

    .line 622
    .restart local v12    # "spec":I
    move-object/from16 v0, p0

    iget v4, v0, Landroid/support/v7/widget/GridLayoutManager;->mOrientation:I

    const/4 v5, 0x1

    if-ne v4, v5, :cond_2e5

    .line 623
    const/16 v18, 0x1

    const/16 v19, 0x1

    move-object/from16 v14, p0

    move-object v15, v11

    move/from16 v16, v12

    invoke-direct/range {v14 .. v19}, Landroid/support/v7/widget/GridLayoutManager;->measureChildWithDecorationsAndMargin(Landroid/view/View;IIZZ)V

    .line 615
    .end local v12    # "spec":I
    .end local v31    # "lp":Landroid/support/v7/widget/GridLayoutManager$LayoutParams;
    :cond_2dd
    :goto_2dd
    add-int/lit8 v27, v27, 0x1

    goto :goto_281

    .line 619
    .restart local v31    # "lp":Landroid/support/v7/widget/GridLayoutManager$LayoutParams;
    :cond_2e0
    move-object/from16 v0, v31

    iget v4, v0, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->width:I

    goto :goto_2c5

    .line 625
    .restart local v12    # "spec":I
    :cond_2e5
    const/16 v19, 0x1

    const/16 v20, 0x1

    move-object/from16 v15, p0

    move-object/from16 v16, v11

    move/from16 v18, v12

    invoke-direct/range {v15 .. v20}, Landroid/support/v7/widget/GridLayoutManager;->measureChildWithDecorationsAndMargin(Landroid/view/View;IIZZ)V

    goto :goto_2dd

    .line 630
    .end local v11    # "view":Landroid/view/View;
    .end local v12    # "spec":I
    .end local v31    # "lp":Landroid/support/v7/widget/GridLayoutManager$LayoutParams;
    :cond_2f3
    move/from16 v0, v32

    move-object/from16 v1, p4

    iput v0, v1, Landroid/support/v7/widget/LinearLayoutManager$LayoutChunkResult;->mConsumed:I

    .line 632
    const/16 v30, 0x0

    .local v30, "left":I
    const/16 v39, 0x0

    .local v39, "right":I
    const/16 v42, 0x0

    .local v42, "top":I
    const/16 v24, 0x0

    .line 633
    .local v24, "bottom":I
    move-object/from16 v0, p0

    iget v4, v0, Landroid/support/v7/widget/GridLayoutManager;->mOrientation:I

    const/4 v5, 0x1

    if-ne v4, v5, :cond_39f

    .line 634
    move-object/from16 v0, p3

    iget v4, v0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mLayoutDirection:I

    const/4 v5, -0x1

    if-ne v4, v5, :cond_395

    .line 635
    move-object/from16 v0, p3

    iget v0, v0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mOffset:I

    move/from16 v24, v0

    .line 636
    sub-int v42, v24, v32

    .line 650
    :goto_317
    const/16 v27, 0x0

    :goto_319
    move/from16 v0, v27

    if-ge v0, v7, :cond_3f1

    .line 651
    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/v7/widget/GridLayoutManager;->mSet:[Landroid/view/View;

    aget-object v11, v4, v27

    .line 652
    .restart local v11    # "view":Landroid/view/View;
    invoke-virtual {v11}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v36

    check-cast v36, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;

    .line 653
    .local v36, "params":Landroid/support/v7/widget/GridLayoutManager$LayoutParams;
    move-object/from16 v0, p0

    iget v4, v0, Landroid/support/v7/widget/GridLayoutManager;->mOrientation:I

    const/4 v5, 0x1

    if-ne v4, v5, :cond_3d5

    .line 654
    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/GridLayoutManager;->isLayoutRTL()Z

    move-result v4

    if-eqz v4, :cond_3ba

    .line 655
    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/GridLayoutManager;->getPaddingLeft()I

    move-result v4

    move-object/from16 v0, p0

    iget-object v5, v0, Landroid/support/v7/widget/GridLayoutManager;->mCachedBorders:[I

    # getter for: Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->mSpanIndex:I
    invoke-static/range {v36 .. v36}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->access$000(Landroid/support/v7/widget/GridLayoutManager$LayoutParams;)I

    move-result v6

    # getter for: Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->mSpanSize:I
    invoke-static/range {v36 .. v36}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->access$100(Landroid/support/v7/widget/GridLayoutManager$LayoutParams;)I

    move-result v10

    add-int/2addr v6, v10

    aget v5, v5, v6

    add-int v39, v4, v5

    .line 656
    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/v7/widget/GridLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4, v11}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedMeasurementInOther(Landroid/view/View;)I

    move-result v4

    sub-int v30, v39, v4

    .line 667
    :goto_355
    move-object/from16 v0, v36

    iget v4, v0, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->leftMargin:I

    add-int v20, v30, v4

    move-object/from16 v0, v36

    iget v4, v0, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->topMargin:I

    add-int v21, v42, v4

    move-object/from16 v0, v36

    iget v4, v0, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->rightMargin:I

    sub-int v22, v39, v4

    move-object/from16 v0, v36

    iget v4, v0, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->bottomMargin:I

    sub-int v23, v24, v4

    move-object/from16 v18, p0

    move-object/from16 v19, v11

    invoke-virtual/range {v18 .. v23}, Landroid/support/v7/widget/GridLayoutManager;->layoutDecorated(Landroid/view/View;IIII)V

    .line 676
    invoke-virtual/range {v36 .. v36}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->isItemRemoved()Z

    move-result v4

    if-nez v4, :cond_380

    invoke-virtual/range {v36 .. v36}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->isItemChanged()Z

    move-result v4

    if-eqz v4, :cond_385

    .line 677
    :cond_380
    const/4 v4, 0x1

    move-object/from16 v0, p4

    iput-boolean v4, v0, Landroid/support/v7/widget/LinearLayoutManager$LayoutChunkResult;->mIgnoreConsumed:Z

    .line 679
    :cond_385
    move-object/from16 v0, p4

    iget-boolean v4, v0, Landroid/support/v7/widget/LinearLayoutManager$LayoutChunkResult;->mFocusable:Z

    invoke-virtual {v11}, Landroid/view/View;->isFocusable()Z

    move-result v5

    or-int/2addr v4, v5

    move-object/from16 v0, p4

    iput-boolean v4, v0, Landroid/support/v7/widget/LinearLayoutManager$LayoutChunkResult;->mFocusable:Z

    .line 650
    add-int/lit8 v27, v27, 0x1

    goto :goto_319

    .line 638
    .end local v11    # "view":Landroid/view/View;
    .end local v36    # "params":Landroid/support/v7/widget/GridLayoutManager$LayoutParams;
    :cond_395
    move-object/from16 v0, p3

    iget v0, v0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mOffset:I

    move/from16 v42, v0

    .line 639
    add-int v24, v42, v32

    goto/16 :goto_317

    .line 642
    :cond_39f
    move-object/from16 v0, p3

    iget v4, v0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mLayoutDirection:I

    const/4 v5, -0x1

    if-ne v4, v5, :cond_3b0

    .line 643
    move-object/from16 v0, p3

    iget v0, v0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mOffset:I

    move/from16 v39, v0

    .line 644
    sub-int v30, v39, v32

    goto/16 :goto_317

    .line 646
    :cond_3b0
    move-object/from16 v0, p3

    iget v0, v0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mOffset:I

    move/from16 v30, v0

    .line 647
    add-int v39, v30, v32

    goto/16 :goto_317

    .line 658
    .restart local v11    # "view":Landroid/view/View;
    .restart local v36    # "params":Landroid/support/v7/widget/GridLayoutManager$LayoutParams;
    :cond_3ba
    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/GridLayoutManager;->getPaddingLeft()I

    move-result v4

    move-object/from16 v0, p0

    iget-object v5, v0, Landroid/support/v7/widget/GridLayoutManager;->mCachedBorders:[I

    # getter for: Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->mSpanIndex:I
    invoke-static/range {v36 .. v36}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->access$000(Landroid/support/v7/widget/GridLayoutManager$LayoutParams;)I

    move-result v6

    aget v5, v5, v6

    add-int v30, v4, v5

    .line 659
    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/v7/widget/GridLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4, v11}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedMeasurementInOther(Landroid/view/View;)I

    move-result v4

    add-int v39, v30, v4

    goto :goto_355

    .line 662
    :cond_3d5
    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/GridLayoutManager;->getPaddingTop()I

    move-result v4

    move-object/from16 v0, p0

    iget-object v5, v0, Landroid/support/v7/widget/GridLayoutManager;->mCachedBorders:[I

    # getter for: Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->mSpanIndex:I
    invoke-static/range {v36 .. v36}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->access$000(Landroid/support/v7/widget/GridLayoutManager$LayoutParams;)I

    move-result v6

    aget v5, v5, v6

    add-int v42, v4, v5

    .line 663
    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/v7/widget/GridLayoutManager;->mOrientationHelper:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4, v11}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedMeasurementInOther(Landroid/view/View;)I

    move-result v4

    add-int v24, v42, v4

    goto/16 :goto_355

    .line 681
    .end local v11    # "view":Landroid/view/View;
    .end local v36    # "params":Landroid/support/v7/widget/GridLayoutManager$LayoutParams;
    :cond_3f1
    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/v7/widget/GridLayoutManager;->mSet:[Landroid/view/View;

    const/4 v5, 0x0

    invoke-static {v4, v5}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    goto/16 :goto_d2
.end method

.method onAnchorReady(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;I)V
    .registers 6
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p3, "anchorInfo"    # Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;
    .param p4, "itemDirection"    # I

    .prologue
    .line 342
    invoke-super {p0, p1, p2, p3, p4}, Landroid/support/v7/widget/LinearLayoutManager;->onAnchorReady(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;I)V

    .line 343
    invoke-direct {p0}, Landroid/support/v7/widget/GridLayoutManager;->updateMeasurements()V

    .line 344
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v0

    if-lez v0, :cond_15

    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView$State;->isPreLayout()Z

    move-result v0

    if-nez v0, :cond_15

    .line 345
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/support/v7/widget/GridLayoutManager;->ensureAnchorIsInCorrectSpan(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/LinearLayoutManager$AnchorInfo;I)V

    .line 347
    :cond_15
    invoke-direct {p0}, Landroid/support/v7/widget/GridLayoutManager;->ensureViewSet()V

    .line 348
    return-void
.end method

.method public onFocusSearchFailed(Landroid/view/View;ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)Landroid/view/View;
    .registers 32
    .param p1, "focused"    # Landroid/view/View;
    .param p2, "focusDirection"    # I
    .param p3, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p4, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 973
    invoke-virtual/range {p0 .. p1}, Landroid/support/v7/widget/GridLayoutManager;->findContainingItemView(Landroid/view/View;)Landroid/view/View;

    move-result-object v17

    .line 974
    .local v17, "prevFocusedChild":Landroid/view/View;
    if-nez v17, :cond_8

    .line 975
    const/4 v4, 0x0

    .line 1039
    :cond_7
    :goto_7
    return-object v4

    .line 977
    :cond_8
    invoke-virtual/range {v17 .. v17}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v12

    check-cast v12, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;

    .line 978
    .local v12, "lp":Landroid/support/v7/widget/GridLayoutManager$LayoutParams;
    # getter for: Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->mSpanIndex:I
    invoke-static {v12}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->access$000(Landroid/support/v7/widget/GridLayoutManager$LayoutParams;)I

    move-result v19

    .line 979
    .local v19, "prevSpanStart":I
    # getter for: Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->mSpanIndex:I
    invoke-static {v12}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->access$000(Landroid/support/v7/widget/GridLayoutManager$LayoutParams;)I

    move-result v25

    # getter for: Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->mSpanSize:I
    invoke-static {v12}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->access$100(Landroid/support/v7/widget/GridLayoutManager$LayoutParams;)I

    move-result v26

    add-int v18, v25, v26

    .line 980
    .local v18, "prevSpanEnd":I
    invoke-super/range {p0 .. p4}, Landroid/support/v7/widget/LinearLayoutManager;->onFocusSearchFailed(Landroid/view/View;ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)Landroid/view/View;

    move-result-object v21

    .line 981
    .local v21, "view":Landroid/view/View;
    if-nez v21, :cond_24

    .line 982
    const/4 v4, 0x0

    goto :goto_7

    .line 986
    :cond_24
    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/GridLayoutManager;->convertFocusDirectionToLayoutDirection(I)I

    move-result v10

    .line 987
    .local v10, "layoutDir":I
    const/16 v25, 0x1

    move/from16 v0, v25

    if-ne v10, v0, :cond_78

    const/16 v25, 0x1

    :goto_34
    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/support/v7/widget/GridLayoutManager;->mShouldReverseLayout:Z

    move/from16 v26, v0

    move/from16 v0, v25

    move/from16 v1, v26

    if-eq v0, v1, :cond_7b

    const/4 v2, 0x1

    .line 989
    .local v2, "ascend":Z
    :goto_41
    if-eqz v2, :cond_7d

    .line 990
    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/GridLayoutManager;->getChildCount()I

    move-result v25

    add-int/lit8 v20, v25, -0x1

    .line 991
    .local v20, "start":I
    const/4 v9, -0x1

    .line 992
    .local v9, "inc":I
    const/4 v11, -0x1

    .line 998
    .local v11, "limit":I
    :goto_4b
    move-object/from16 v0, p0

    iget v0, v0, Landroid/support/v7/widget/GridLayoutManager;->mOrientation:I

    move/from16 v25, v0

    const/16 v26, 0x1

    move/from16 v0, v25

    move/from16 v1, v26

    if-ne v0, v1, :cond_85

    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/GridLayoutManager;->isLayoutRTL()Z

    move-result v25

    if-eqz v25, :cond_85

    const/16 v16, 0x1

    .line 999
    .local v16, "preferLastSpan":Z
    :goto_61
    const/16 v22, 0x0

    .line 1000
    .local v22, "weakCandidate":Landroid/view/View;
    const/16 v24, -0x1

    .line 1001
    .local v24, "weakCandidateSpanIndex":I
    const/16 v23, 0x0

    .line 1003
    .local v23, "weakCandidateOverlap":I
    move/from16 v8, v20

    .local v8, "i":I
    :goto_69
    if-eq v8, v11, :cond_75

    .line 1004
    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Landroid/support/v7/widget/GridLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 1005
    .local v4, "candidate":Landroid/view/View;
    move-object/from16 v0, v17

    if-ne v4, v0, :cond_88

    .end local v4    # "candidate":Landroid/view/View;
    :cond_75
    move-object/from16 v4, v22

    .line 1039
    goto :goto_7

    .line 987
    .end local v2    # "ascend":Z
    .end local v8    # "i":I
    .end local v9    # "inc":I
    .end local v11    # "limit":I
    .end local v16    # "preferLastSpan":Z
    .end local v20    # "start":I
    .end local v22    # "weakCandidate":Landroid/view/View;
    .end local v23    # "weakCandidateOverlap":I
    .end local v24    # "weakCandidateSpanIndex":I
    :cond_78
    const/16 v25, 0x0

    goto :goto_34

    :cond_7b
    const/4 v2, 0x0

    goto :goto_41

    .line 994
    .restart local v2    # "ascend":Z
    :cond_7d
    const/16 v20, 0x0

    .line 995
    .restart local v20    # "start":I
    const/4 v9, 0x1

    .line 996
    .restart local v9    # "inc":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/GridLayoutManager;->getChildCount()I

    move-result v11

    .restart local v11    # "limit":I
    goto :goto_4b

    .line 998
    :cond_85
    const/16 v16, 0x0

    goto :goto_61

    .line 1008
    .restart local v4    # "candidate":Landroid/view/View;
    .restart local v8    # "i":I
    .restart local v16    # "preferLastSpan":Z
    .restart local v22    # "weakCandidate":Landroid/view/View;
    .restart local v23    # "weakCandidateOverlap":I
    .restart local v24    # "weakCandidateSpanIndex":I
    :cond_88
    invoke-virtual {v4}, Landroid/view/View;->isFocusable()Z

    move-result v25

    if-nez v25, :cond_90

    .line 1003
    :cond_8e
    :goto_8e
    add-int/2addr v8, v9

    goto :goto_69

    .line 1011
    :cond_90
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    check-cast v6, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;

    .line 1012
    .local v6, "candidateLp":Landroid/support/v7/widget/GridLayoutManager$LayoutParams;
    # getter for: Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->mSpanIndex:I
    invoke-static {v6}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->access$000(Landroid/support/v7/widget/GridLayoutManager$LayoutParams;)I

    move-result v7

    .line 1013
    .local v7, "candidateStart":I
    # getter for: Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->mSpanIndex:I
    invoke-static {v6}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->access$000(Landroid/support/v7/widget/GridLayoutManager$LayoutParams;)I

    move-result v25

    # getter for: Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->mSpanSize:I
    invoke-static {v6}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->access$100(Landroid/support/v7/widget/GridLayoutManager$LayoutParams;)I

    move-result v26

    add-int v5, v25, v26

    .line 1014
    .local v5, "candidateEnd":I
    move/from16 v0, v19

    if-ne v7, v0, :cond_ac

    move/from16 v0, v18

    if-eq v5, v0, :cond_7

    .line 1017
    :cond_ac
    const/4 v3, 0x0

    .line 1018
    .local v3, "assignAsWeek":Z
    if-nez v22, :cond_c7

    .line 1019
    const/4 v3, 0x1

    .line 1032
    :cond_b0
    :goto_b0
    if-eqz v3, :cond_8e

    .line 1033
    move-object/from16 v22, v4

    .line 1034
    # getter for: Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->mSpanIndex:I
    invoke-static {v6}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->access$000(Landroid/support/v7/widget/GridLayoutManager$LayoutParams;)I

    move-result v24

    .line 1035
    move/from16 v0, v18

    invoke-static {v5, v0}, Ljava/lang/Math;->min(II)I

    move-result v25

    move/from16 v0, v19

    invoke-static {v7, v0}, Ljava/lang/Math;->max(II)I

    move-result v26

    sub-int v23, v25, v26

    goto :goto_8e

    .line 1021
    :cond_c7
    move/from16 v0, v19

    invoke-static {v7, v0}, Ljava/lang/Math;->max(II)I

    move-result v13

    .line 1022
    .local v13, "maxStart":I
    move/from16 v0, v18

    invoke-static {v5, v0}, Ljava/lang/Math;->min(II)I

    move-result v14

    .line 1023
    .local v14, "minEnd":I
    sub-int v15, v14, v13

    .line 1024
    .local v15, "overlap":I
    move/from16 v0, v23

    if-le v15, v0, :cond_db

    .line 1025
    const/4 v3, 0x1

    goto :goto_b0

    .line 1026
    :cond_db
    move/from16 v0, v23

    if-ne v15, v0, :cond_b0

    move/from16 v0, v24

    if-le v7, v0, :cond_ed

    const/16 v25, 0x1

    :goto_e5
    move/from16 v0, v16

    move/from16 v1, v25

    if-ne v0, v1, :cond_b0

    .line 1028
    const/4 v3, 0x1

    goto :goto_b0

    .line 1026
    :cond_ed
    const/16 v25, 0x0

    goto :goto_e5
.end method

.method public onInitializeAccessibilityNodeInfoForItem(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;Landroid/view/View;Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;)V
    .registers 15
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p3, "host"    # Landroid/view/View;
    .param p4, "info"    # Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;

    .prologue
    .line 145
    invoke-virtual {p3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v9

    .line 146
    .local v9, "lp":Landroid/view/ViewGroup$LayoutParams;
    instance-of v0, v9, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;

    if-nez v0, :cond_c

    .line 147
    invoke-super {p0, p3, p4}, Landroid/support/v7/widget/LinearLayoutManager;->onInitializeAccessibilityNodeInfoForItem(Landroid/view/View;Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;)V

    .line 163
    :goto_b
    return-void

    :cond_c
    move-object v8, v9

    .line 150
    check-cast v8, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;

    .line 151
    .local v8, "glp":Landroid/support/v7/widget/GridLayoutManager$LayoutParams;
    invoke-virtual {v8}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->getViewLayoutPosition()I

    move-result v0

    invoke-direct {p0, p1, p2, v0}, Landroid/support/v7/widget/GridLayoutManager;->getSpanGroupIndex(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;I)I

    move-result v2

    .line 152
    .local v2, "spanGroupIndex":I
    iget v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mOrientation:I

    if-nez v0, :cond_3d

    .line 153
    invoke-virtual {v8}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->getSpanIndex()I

    move-result v0

    invoke-virtual {v8}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->getSpanSize()I

    move-result v1

    const/4 v3, 0x1

    iget v4, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanCount:I

    const/4 v5, 0x1

    if-le v4, v5, :cond_3b

    invoke-virtual {v8}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->getSpanSize()I

    move-result v4

    iget v5, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanCount:I

    if-ne v4, v5, :cond_3b

    const/4 v4, 0x1

    :goto_32
    const/4 v5, 0x0

    invoke-static/range {v0 .. v5}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$CollectionItemInfoCompat;->obtain(IIIIZZ)Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$CollectionItemInfoCompat;

    move-result-object v0

    invoke-virtual {p4, v0}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->setCollectionItemInfo(Ljava/lang/Object;)V

    goto :goto_b

    :cond_3b
    const/4 v4, 0x0

    goto :goto_32

    .line 158
    :cond_3d
    const/4 v3, 0x1

    invoke-virtual {v8}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->getSpanIndex()I

    move-result v4

    invoke-virtual {v8}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->getSpanSize()I

    move-result v5

    iget v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanCount:I

    const/4 v1, 0x1

    if-le v0, v1, :cond_5d

    invoke-virtual {v8}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->getSpanSize()I

    move-result v0

    iget v1, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanCount:I

    if-ne v0, v1, :cond_5d

    const/4 v6, 0x1

    :goto_54
    const/4 v7, 0x0

    invoke-static/range {v2 .. v7}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$CollectionItemInfoCompat;->obtain(IIIIZZ)Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$CollectionItemInfoCompat;

    move-result-object v0

    invoke-virtual {p4, v0}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->setCollectionItemInfo(Ljava/lang/Object;)V

    goto :goto_b

    :cond_5d
    const/4 v6, 0x0

    goto :goto_54
.end method

.method public onItemsAdded(Landroid/support/v7/widget/RecyclerView;II)V
    .registers 5
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "positionStart"    # I
    .param p3, "itemCount"    # I

    .prologue
    .line 197
    iget-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanSizeLookup:Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;

    invoke-virtual {v0}, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->invalidateSpanIndexCache()V

    .line 198
    return-void
.end method

.method public onItemsChanged(Landroid/support/v7/widget/RecyclerView;)V
    .registers 3
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;

    .prologue
    .line 202
    iget-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanSizeLookup:Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;

    invoke-virtual {v0}, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->invalidateSpanIndexCache()V

    .line 203
    return-void
.end method

.method public onItemsMoved(Landroid/support/v7/widget/RecyclerView;III)V
    .registers 6
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "from"    # I
    .param p3, "to"    # I
    .param p4, "itemCount"    # I

    .prologue
    .line 218
    iget-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanSizeLookup:Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;

    invoke-virtual {v0}, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->invalidateSpanIndexCache()V

    .line 219
    return-void
.end method

.method public onItemsRemoved(Landroid/support/v7/widget/RecyclerView;II)V
    .registers 5
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "positionStart"    # I
    .param p3, "itemCount"    # I

    .prologue
    .line 207
    iget-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanSizeLookup:Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;

    invoke-virtual {v0}, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->invalidateSpanIndexCache()V

    .line 208
    return-void
.end method

.method public onItemsUpdated(Landroid/support/v7/widget/RecyclerView;IILjava/lang/Object;)V
    .registers 6
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "positionStart"    # I
    .param p3, "itemCount"    # I
    .param p4, "payload"    # Ljava/lang/Object;

    .prologue
    .line 213
    iget-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanSizeLookup:Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;

    invoke-virtual {v0}, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->invalidateSpanIndexCache()V

    .line 214
    return-void
.end method

.method public onLayoutChildren(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)V
    .registers 4
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 167
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView$State;->isPreLayout()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 168
    invoke-direct {p0}, Landroid/support/v7/widget/GridLayoutManager;->cachePreLayoutSpanMapping()V

    .line 170
    :cond_9
    invoke-super {p0, p1, p2}, Landroid/support/v7/widget/LinearLayoutManager;->onLayoutChildren(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)V

    .line 174
    invoke-direct {p0}, Landroid/support/v7/widget/GridLayoutManager;->clearPreLayoutSpanMappingCache()V

    .line 175
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView$State;->isPreLayout()Z

    move-result v0

    if-nez v0, :cond_18

    .line 176
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mPendingSpanCountChange:Z

    .line 178
    :cond_18
    return-void
.end method

.method public scrollHorizontallyBy(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 5
    .param p1, "dx"    # I
    .param p2, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p3, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 359
    invoke-direct {p0}, Landroid/support/v7/widget/GridLayoutManager;->updateMeasurements()V

    .line 360
    invoke-direct {p0}, Landroid/support/v7/widget/GridLayoutManager;->ensureViewSet()V

    .line 361
    invoke-super {p0, p1, p2, p3}, Landroid/support/v7/widget/LinearLayoutManager;->scrollHorizontallyBy(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v0

    return v0
.end method

.method public scrollVerticallyBy(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 5
    .param p1, "dy"    # I
    .param p2, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;
    .param p3, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 367
    invoke-direct {p0}, Landroid/support/v7/widget/GridLayoutManager;->updateMeasurements()V

    .line 368
    invoke-direct {p0}, Landroid/support/v7/widget/GridLayoutManager;->ensureViewSet()V

    .line 369
    invoke-super {p0, p1, p2, p3}, Landroid/support/v7/widget/LinearLayoutManager;->scrollVerticallyBy(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v0

    return v0
.end method

.method public setMeasuredDimension(Landroid/graphics/Rect;II)V
    .registers 12
    .param p1, "childrenBounds"    # Landroid/graphics/Rect;
    .param p2, "wSpec"    # I
    .param p3, "hSpec"    # I

    .prologue
    .line 282
    iget-object v6, p0, Landroid/support/v7/widget/GridLayoutManager;->mCachedBorders:[I

    if-nez v6, :cond_7

    .line 283
    invoke-super {p0, p1, p2, p3}, Landroid/support/v7/widget/LinearLayoutManager;->setMeasuredDimension(Landroid/graphics/Rect;II)V

    .line 286
    :cond_7
    invoke-virtual {p0}, Landroid/support/v7/widget/GridLayoutManager;->getPaddingLeft()I

    move-result v6

    invoke-virtual {p0}, Landroid/support/v7/widget/GridLayoutManager;->getPaddingRight()I

    move-result v7

    add-int v1, v6, v7

    .line 287
    .local v1, "horizontalPadding":I
    invoke-virtual {p0}, Landroid/support/v7/widget/GridLayoutManager;->getPaddingTop()I

    move-result v6

    invoke-virtual {p0}, Landroid/support/v7/widget/GridLayoutManager;->getPaddingBottom()I

    move-result v7

    add-int v4, v6, v7

    .line 288
    .local v4, "verticalPadding":I
    iget v6, p0, Landroid/support/v7/widget/GridLayoutManager;->mOrientation:I

    const/4 v7, 0x1

    if-ne v6, v7, :cond_44

    .line 289
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v6

    add-int v2, v6, v4

    .line 290
    .local v2, "usedHeight":I
    invoke-virtual {p0}, Landroid/support/v7/widget/GridLayoutManager;->getMinimumHeight()I

    move-result v6

    invoke-static {p3, v2, v6}, Landroid/support/v7/widget/GridLayoutManager;->chooseSize(III)I

    move-result v0

    .line 291
    .local v0, "height":I
    iget-object v6, p0, Landroid/support/v7/widget/GridLayoutManager;->mCachedBorders:[I

    iget-object v7, p0, Landroid/support/v7/widget/GridLayoutManager;->mCachedBorders:[I

    array-length v7, v7

    add-int/lit8 v7, v7, -0x1

    aget v6, v6, v7

    add-int/2addr v6, v1

    invoke-virtual {p0}, Landroid/support/v7/widget/GridLayoutManager;->getMinimumWidth()I

    move-result v7

    invoke-static {p2, v6, v7}, Landroid/support/v7/widget/GridLayoutManager;->chooseSize(III)I

    move-result v5

    .line 299
    .end local v2    # "usedHeight":I
    .local v5, "width":I
    :goto_40
    invoke-virtual {p0, v5, v0}, Landroid/support/v7/widget/GridLayoutManager;->setMeasuredDimension(II)V

    .line 300
    return-void

    .line 294
    .end local v0    # "height":I
    .end local v5    # "width":I
    :cond_44
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v6

    add-int v3, v6, v1

    .line 295
    .local v3, "usedWidth":I
    invoke-virtual {p0}, Landroid/support/v7/widget/GridLayoutManager;->getMinimumWidth()I

    move-result v6

    invoke-static {p2, v3, v6}, Landroid/support/v7/widget/GridLayoutManager;->chooseSize(III)I

    move-result v5

    .line 296
    .restart local v5    # "width":I
    iget-object v6, p0, Landroid/support/v7/widget/GridLayoutManager;->mCachedBorders:[I

    iget-object v7, p0, Landroid/support/v7/widget/GridLayoutManager;->mCachedBorders:[I

    array-length v7, v7

    add-int/lit8 v7, v7, -0x1

    aget v6, v6, v7

    add-int/2addr v6, v4

    invoke-virtual {p0}, Landroid/support/v7/widget/GridLayoutManager;->getMinimumHeight()I

    move-result v7

    invoke-static {p3, v6, v7}, Landroid/support/v7/widget/GridLayoutManager;->chooseSize(III)I

    move-result v0

    .restart local v0    # "height":I
    goto :goto_40
.end method

.method public setSpanCount(I)V
    .registers 5
    .param p1, "spanCount"    # I

    .prologue
    const/4 v1, 0x1

    .line 789
    iget v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanCount:I

    if-ne p1, v0, :cond_6

    .line 799
    :goto_5
    return-void

    .line 792
    :cond_6
    iput-boolean v1, p0, Landroid/support/v7/widget/GridLayoutManager;->mPendingSpanCountChange:Z

    .line 793
    if-ge p1, v1, :cond_23

    .line 794
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Span count should be at least 1. Provided "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 797
    :cond_23
    iput p1, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanCount:I

    .line 798
    iget-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanSizeLookup:Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;

    invoke-virtual {v0}, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->invalidateSpanIndexCache()V

    goto :goto_5
.end method

.method public setSpanSizeLookup(Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;)V
    .registers 2
    .param p1, "spanSizeLookup"    # Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;

    .prologue
    .line 258
    iput-object p1, p0, Landroid/support/v7/widget/GridLayoutManager;->mSpanSizeLookup:Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;

    .line 259
    return-void
.end method

.method public setStackFromEnd(Z)V
    .registers 4
    .param p1, "stackFromEnd"    # Z

    .prologue
    .line 106
    if-eqz p1, :cond_a

    .line 107
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "GridLayoutManager does not support stack from end. Consider using reverse layout"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 111
    :cond_a
    const/4 v0, 0x0

    invoke-super {p0, v0}, Landroid/support/v7/widget/LinearLayoutManager;->setStackFromEnd(Z)V

    .line 112
    return-void
.end method

.method public supportsPredictiveItemAnimations()Z
    .registers 2

    .prologue
    .line 1044
    iget-object v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/LinearLayoutManager$SavedState;

    if-nez v0, :cond_a

    iget-boolean v0, p0, Landroid/support/v7/widget/GridLayoutManager;->mPendingSpanCountChange:Z

    if-nez v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method
