.class public abstract Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;
.super Ljava/lang/Object;
.source "GridLayoutManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/widget/GridLayoutManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "SpanSizeLookup"
.end annotation


# instance fields
.field private mCacheSpanIndices:Z

.field final mSpanIndexCache:Landroid/util/SparseIntArray;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 653
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 655
    new-instance v0, Landroid/util/SparseIntArray;

    invoke-direct {v0}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->mSpanIndexCache:Landroid/util/SparseIntArray;

    .line 657
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->mCacheSpanIndices:Z

    return-void
.end method


# virtual methods
.method findReferenceIndexFromCache(I)I
    .registers 8
    .param p1, "position"    # I

    .prologue
    .line 763
    const/4 v2, 0x0

    .line 764
    .local v2, "lo":I
    iget-object v5, p0, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->mSpanIndexCache:Landroid/util/SparseIntArray;

    invoke-virtual {v5}, Landroid/util/SparseIntArray;->size()I

    move-result v5

    add-int/lit8 v0, v5, -0x1

    .line 766
    .local v0, "hi":I
    :goto_9
    if-gt v2, v0, :cond_1d

    .line 767
    add-int v5, v2, v0

    ushr-int/lit8 v3, v5, 0x1

    .line 768
    .local v3, "mid":I
    iget-object v5, p0, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->mSpanIndexCache:Landroid/util/SparseIntArray;

    invoke-virtual {v5, v3}, Landroid/util/SparseIntArray;->keyAt(I)I

    move-result v4

    .line 769
    .local v4, "midVal":I
    if-ge v4, p1, :cond_1a

    .line 770
    add-int/lit8 v2, v3, 0x1

    goto :goto_9

    .line 772
    :cond_1a
    add-int/lit8 v0, v3, -0x1

    goto :goto_9

    .line 775
    .end local v3    # "mid":I
    .end local v4    # "midVal":I
    :cond_1d
    add-int/lit8 v1, v2, -0x1

    .line 776
    .local v1, "index":I
    if-ltz v1, :cond_30

    iget-object v5, p0, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->mSpanIndexCache:Landroid/util/SparseIntArray;

    invoke-virtual {v5}, Landroid/util/SparseIntArray;->size()I

    move-result v5

    if-ge v1, v5, :cond_30

    .line 777
    iget-object v5, p0, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->mSpanIndexCache:Landroid/util/SparseIntArray;

    invoke-virtual {v5, v1}, Landroid/util/SparseIntArray;->keyAt(I)I

    move-result v5

    .line 779
    :goto_2f
    return v5

    :cond_30
    const/4 v5, -0x1

    goto :goto_2f
.end method

.method getCachedSpanIndex(II)I
    .registers 7
    .param p1, "position"    # I
    .param p2, "spanCount"    # I

    .prologue
    const/4 v3, -0x1

    .line 696
    iget-boolean v2, p0, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->mCacheSpanIndices:Z

    if-nez v2, :cond_a

    .line 697
    invoke-virtual {p0, p1, p2}, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->getSpanIndex(II)I

    move-result v0

    .line 705
    :cond_9
    :goto_9
    return v0

    .line 699
    :cond_a
    iget-object v2, p0, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->mSpanIndexCache:Landroid/util/SparseIntArray;

    invoke-virtual {v2, p1, v3}, Landroid/util/SparseIntArray;->get(II)I

    move-result v0

    .line 700
    .local v0, "existing":I
    if-ne v0, v3, :cond_9

    .line 703
    invoke-virtual {p0, p1, p2}, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->getSpanIndex(II)I

    move-result v1

    .line 704
    .local v1, "value":I
    iget-object v2, p0, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->mSpanIndexCache:Landroid/util/SparseIntArray;

    invoke-virtual {v2, p1, v1}, Landroid/util/SparseIntArray;->put(II)V

    move v0, v1

    .line 705
    goto :goto_9
.end method

.method public getSpanGroupIndex(II)I
    .registers 9
    .param p1, "adapterPosition"    # I
    .param p2, "spanCount"    # I

    .prologue
    .line 793
    const/4 v4, 0x0

    .line 794
    .local v4, "span":I
    const/4 v0, 0x0

    .line 795
    .local v0, "group":I
    invoke-virtual {p0, p1}, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->getSpanSize(I)I

    move-result v2

    .line 796
    .local v2, "positionSpanSize":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_7
    if-ge v1, p1, :cond_1c

    .line 797
    invoke-virtual {p0, v1}, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->getSpanSize(I)I

    move-result v3

    .line 798
    .local v3, "size":I
    add-int/2addr v4, v3

    .line 799
    if-ne v4, p2, :cond_16

    .line 800
    const/4 v4, 0x0

    .line 801
    add-int/lit8 v0, v0, 0x1

    .line 796
    :cond_13
    :goto_13
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    .line 802
    :cond_16
    if-le v4, p2, :cond_13

    .line 804
    move v4, v3

    .line 805
    add-int/lit8 v0, v0, 0x1

    goto :goto_13

    .line 808
    .end local v3    # "size":I
    :cond_1c
    add-int v5, v4, v2

    if-le v5, p2, :cond_22

    .line 809
    add-int/lit8 v0, v0, 0x1

    .line 811
    :cond_22
    return v0
.end method

.method public getSpanIndex(II)I
    .registers 12
    .param p1, "position"    # I
    .param p2, "spanCount"    # I

    .prologue
    const/4 v6, 0x0

    .line 732
    invoke-virtual {p0, p1}, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->getSpanSize(I)I

    move-result v1

    .line 733
    .local v1, "positionSpanSize":I
    if-ne v1, p2, :cond_9

    move v4, v6

    .line 759
    :cond_8
    :goto_8
    return v4

    .line 736
    :cond_9
    const/4 v4, 0x0

    .line 737
    .local v4, "span":I
    const/4 v5, 0x0

    .line 739
    .local v5, "startPos":I
    iget-boolean v7, p0, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->mCacheSpanIndices:Z

    if-eqz v7, :cond_2b

    iget-object v7, p0, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->mSpanIndexCache:Landroid/util/SparseIntArray;

    invoke-virtual {v7}, Landroid/util/SparseIntArray;->size()I

    move-result v7

    if-lez v7, :cond_2b

    .line 740
    invoke-virtual {p0, p1}, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->findReferenceIndexFromCache(I)I

    move-result v2

    .line 741
    .local v2, "prevKey":I
    if-ltz v2, :cond_2b

    .line 742
    iget-object v7, p0, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->mSpanIndexCache:Landroid/util/SparseIntArray;

    invoke-virtual {v7, v2}, Landroid/util/SparseIntArray;->get(I)I

    move-result v7

    invoke-virtual {p0, v2}, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->getSpanSize(I)I

    move-result v8

    add-int v4, v7, v8

    .line 743
    add-int/lit8 v5, v2, 0x1

    .line 746
    .end local v2    # "prevKey":I
    :cond_2b
    move v0, v5

    .local v0, "i":I
    :goto_2c
    if-ge v0, p1, :cond_3d

    .line 747
    invoke-virtual {p0, v0}, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->getSpanSize(I)I

    move-result v3

    .line 748
    .local v3, "size":I
    add-int/2addr v4, v3

    .line 749
    if-ne v4, p2, :cond_39

    .line 750
    const/4 v4, 0x0

    .line 746
    :cond_36
    :goto_36
    add-int/lit8 v0, v0, 0x1

    goto :goto_2c

    .line 751
    :cond_39
    if-le v4, p2, :cond_36

    .line 753
    move v4, v3

    goto :goto_36

    .line 756
    .end local v3    # "size":I
    :cond_3d
    add-int v7, v4, v1

    if-le v7, p2, :cond_8

    move v4, v6

    .line 759
    goto :goto_8
.end method

.method public abstract getSpanSize(I)I
.end method

.method public invalidateSpanIndexCache()V
    .registers 2

    .prologue
    .line 683
    iget-object v0, p0, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->mSpanIndexCache:Landroid/util/SparseIntArray;

    invoke-virtual {v0}, Landroid/util/SparseIntArray;->clear()V

    .line 684
    return-void
.end method

.method public isSpanIndexCacheEnabled()Z
    .registers 2

    .prologue
    .line 692
    iget-boolean v0, p0, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->mCacheSpanIndices:Z

    return v0
.end method

.method public setSpanIndexCacheEnabled(Z)V
    .registers 2
    .param p1, "cacheSpanIndices"    # Z

    .prologue
    .line 675
    iput-boolean p1, p0, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->mCacheSpanIndices:Z

    .line 676
    return-void
.end method
