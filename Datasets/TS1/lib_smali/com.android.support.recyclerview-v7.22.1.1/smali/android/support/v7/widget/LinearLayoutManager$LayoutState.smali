.class Landroid/support/v7/widget/LinearLayoutManager$LayoutState;
.super Ljava/lang/Object;
.source "LinearLayoutManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/widget/LinearLayoutManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "LayoutState"
.end annotation


# static fields
.field static final INVALID_LAYOUT:I = -0x80000000

.field static final ITEM_DIRECTION_HEAD:I = -0x1

.field static final ITEM_DIRECTION_TAIL:I = 0x1

.field static final LAYOUT_END:I = 0x1

.field static final LAYOUT_START:I = -0x1

.field static final SCOLLING_OFFSET_NaN:I = -0x80000000

.field static final TAG:Ljava/lang/String; = "LinearLayoutManager#LayoutState"


# instance fields
.field mAvailable:I

.field mCurrentPosition:I

.field mExtra:I

.field mIsPreLayout:Z

.field mItemDirection:I

.field mLastScrollDelta:I

.field mLayoutDirection:I

.field mOffset:I

.field mRecycle:Z

.field mScrapList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/support/v7/widget/RecyclerView$ViewHolder;",
            ">;"
        }
    .end annotation
.end field

.field mScrollingOffset:I


# direct methods
.method constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 1795
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1814
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mRecycle:Z

    .line 1855
    iput v1, p0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mExtra:I

    .line 1862
    iput-boolean v1, p0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mIsPreLayout:Z

    .line 1873
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mScrapList:Ljava/util/List;

    return-void
.end method

.method private nextViewFromScrapList()Landroid/view/View;
    .registers 6

    .prologue
    .line 1905
    iget-object v3, p0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mScrapList:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v1

    .line 1906
    .local v1, "size":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_7
    if-ge v0, v1, :cond_28

    .line 1907
    iget-object v3, p0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mScrapList:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .line 1908
    .local v2, "viewHolder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->isRemoved()Z

    move-result v3

    if-eqz v3, :cond_1a

    .line 1906
    :cond_17
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 1911
    :cond_1a
    iget v3, p0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mCurrentPosition:I

    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getLayoutPosition()I

    move-result v4

    if-ne v3, v4, :cond_17

    .line 1912
    invoke-virtual {p0, v2}, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->assignPositionFromScrapList(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 1913
    iget-object v3, v2, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 1916
    .end local v2    # "viewHolder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    :goto_27
    return-object v3

    :cond_28
    const/4 v3, 0x0

    goto :goto_27
.end method


# virtual methods
.method public assignPositionFromScrapList()V
    .registers 2

    .prologue
    .line 1920
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->assignPositionFromScrapList(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 1921
    return-void
.end method

.method public assignPositionFromScrapList(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 4
    .param p1, "ignore"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 1924
    invoke-virtual {p0, p1}, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->nextViewHolderInLimitedList(Landroid/support/v7/widget/RecyclerView$ViewHolder;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v0

    .line 1925
    .local v0, "closest":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    if-nez v0, :cond_a

    const/4 v1, -0x1

    :goto_7
    iput v1, p0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mCurrentPosition:I

    .line 1927
    return-void

    .line 1925
    :cond_a
    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getLayoutPosition()I

    move-result v1

    goto :goto_7
.end method

.method hasMore(Landroid/support/v7/widget/RecyclerView$State;)Z
    .registers 4
    .param p1, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 1879
    iget v0, p0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mCurrentPosition:I

    if-ltz v0, :cond_e

    iget v0, p0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mCurrentPosition:I

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v1

    if-ge v0, v1, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method log()V
    .registers 4

    .prologue
    .line 1958
    const-string v0, "LinearLayoutManager#LayoutState"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "avail:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mAvailable:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", ind:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mCurrentPosition:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", dir:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mItemDirection:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", offset:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mOffset:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", layoutDir:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mLayoutDirection:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1960
    return-void
.end method

.method next(Landroid/support/v7/widget/RecyclerView$Recycler;)Landroid/view/View;
    .registers 5
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;

    .prologue
    .line 1889
    iget-object v1, p0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mScrapList:Ljava/util/List;

    if-eqz v1, :cond_9

    .line 1890
    invoke-direct {p0}, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->nextViewFromScrapList()Landroid/view/View;

    move-result-object v0

    .line 1894
    :goto_8
    return-object v0

    .line 1892
    :cond_9
    iget v1, p0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mCurrentPosition:I

    invoke-virtual {p1, v1}, Landroid/support/v7/widget/RecyclerView$Recycler;->getViewForPosition(I)Landroid/view/View;

    move-result-object v0

    .line 1893
    .local v0, "view":Landroid/view/View;
    iget v1, p0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mCurrentPosition:I

    iget v2, p0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mItemDirection:I

    add-int/2addr v1, v2

    iput v1, p0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mCurrentPosition:I

    goto :goto_8
.end method

.method public nextViewHolderInLimitedList(Landroid/support/v7/widget/RecyclerView$ViewHolder;)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .registers 10
    .param p1, "ignore"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 1930
    iget-object v6, p0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mScrapList:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v4

    .line 1931
    .local v4, "size":I
    const/4 v0, 0x0

    .line 1932
    .local v0, "closest":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    const v1, 0x7fffffff

    .line 1936
    .local v1, "closestDistance":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_b
    if-ge v3, v4, :cond_33

    .line 1937
    iget-object v6, p0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mScrapList:Ljava/util/List;

    invoke-interface {v6, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .line 1938
    .local v5, "viewHolder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    if-eq v5, p1, :cond_1d

    invoke-virtual {v5}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->isRemoved()Z

    move-result v6

    if-eqz v6, :cond_20

    .line 1936
    :cond_1d
    add-int/lit8 v3, v3, 0x1

    goto :goto_b

    .line 1941
    :cond_20
    invoke-virtual {v5}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getLayoutPosition()I

    move-result v6

    iget v7, p0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mCurrentPosition:I

    sub-int/2addr v6, v7

    iget v7, p0, Landroid/support/v7/widget/LinearLayoutManager$LayoutState;->mItemDirection:I

    mul-int v2, v6, v7

    .line 1943
    .local v2, "distance":I
    if-ltz v2, :cond_1d

    .line 1946
    if-ge v2, v1, :cond_1d

    .line 1947
    move-object v0, v5

    .line 1948
    move v1, v2

    .line 1949
    if-nez v2, :cond_1d

    .line 1954
    .end local v2    # "distance":I
    .end local v5    # "viewHolder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    :cond_33
    return-object v0
.end method
