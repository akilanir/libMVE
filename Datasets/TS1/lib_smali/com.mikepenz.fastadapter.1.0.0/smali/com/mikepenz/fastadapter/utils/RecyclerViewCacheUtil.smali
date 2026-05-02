.class public Lcom/mikepenz/fastadapter/utils/RecyclerViewCacheUtil;
.super Ljava/lang/Object;
.source "RecyclerViewCacheUtil.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Item::",
        "Lcom/mikepenz/fastadapter/IItem;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private mCacheSize:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 15
    .local p0, "this":Lcom/mikepenz/fastadapter/utils/RecyclerViewCacheUtil;, "Lcom/mikepenz/fastadapter/utils/RecyclerViewCacheUtil<TItem;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    const/4 v0, 0x2

    iput v0, p0, Lcom/mikepenz/fastadapter/utils/RecyclerViewCacheUtil;->mCacheSize:I

    return-void
.end method


# virtual methods
.method public apply(Landroid/support/v7/widget/RecyclerView;Ljava/lang/Iterable;)V
    .registers 12
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v7/widget/RecyclerView;",
            "Ljava/lang/Iterable",
            "<TItem;>;)V"
        }
    .end annotation

    .prologue
    .line 36
    .local p0, "this":Lcom/mikepenz/fastadapter/utils/RecyclerViewCacheUtil;, "Lcom/mikepenz/fastadapter/utils/RecyclerViewCacheUtil<TItem;>;"
    .local p2, "items":Ljava/lang/Iterable;, "Ljava/lang/Iterable<TItem;>;"
    if-eqz p2, :cond_b9

    .line 38
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 39
    .local v0, "cache":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/Integer;Ljava/util/Stack<Landroid/support/v7/widget/RecyclerView$ViewHolder;>;>;"
    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_b
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_b9

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mikepenz/fastadapter/IItem;

    .line 40
    .local v1, "d":Lcom/mikepenz/fastadapter/IItem;, "TItem;"
    invoke-interface {v1}, Lcom/mikepenz/fastadapter/IItem;->getType()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_35

    .line 41
    invoke-interface {v1}, Lcom/mikepenz/fastadapter/IItem;->getType()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    new-instance v7, Ljava/util/Stack;

    invoke-direct {v7}, Ljava/util/Stack;-><init>()V

    invoke-virtual {v0, v5, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    :cond_35
    iget v5, p0, Lcom/mikepenz/fastadapter/utils/RecyclerViewCacheUtil;->mCacheSize:I

    const/4 v7, -0x1

    if-eq v5, v7, :cond_50

    invoke-interface {v1}, Lcom/mikepenz/fastadapter/IItem;->getType()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Stack;

    invoke-virtual {v5}, Ljava/util/Stack;->size()I

    move-result v5

    iget v7, p0, Lcom/mikepenz/fastadapter/utils/RecyclerViewCacheUtil;->mCacheSize:I

    if-gt v5, v7, :cond_65

    .line 45
    :cond_50
    invoke-interface {v1}, Lcom/mikepenz/fastadapter/IItem;->getType()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Stack;

    invoke-interface {v1, p1}, Lcom/mikepenz/fastadapter/IItem;->getViewHolder(Landroid/view/ViewGroup;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    :cond_65
    new-instance v4, Landroid/support/v7/widget/RecyclerView$RecycledViewPool;

    invoke-direct {v4}, Landroid/support/v7/widget/RecyclerView$RecycledViewPool;-><init>()V

    .line 51
    .local v4, "recyclerViewPool":Landroid/support/v7/widget/RecyclerView$RecycledViewPool;
    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_72
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_b1

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 52
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/util/Stack<Landroid/support/v7/widget/RecyclerView$ViewHolder;>;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    iget v8, p0, Lcom/mikepenz/fastadapter/utils/RecyclerViewCacheUtil;->mCacheSize:I

    invoke-virtual {v4, v5, v8}, Landroid/support/v7/widget/RecyclerView$RecycledViewPool;->setMaxRecycledViews(II)V

    .line 54
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Stack;

    invoke-virtual {v5}, Ljava/util/Stack;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_97
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_a7

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .line 55
    .local v3, "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    invoke-virtual {v4, v3}, Landroid/support/v7/widget/RecyclerView$RecycledViewPool;->putRecycledView(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    goto :goto_97

    .line 59
    .end local v3    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    :cond_a7
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Stack;

    invoke-virtual {v5}, Ljava/util/Stack;->clear()V

    goto :goto_72

    .line 63
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/util/Stack<Landroid/support/v7/widget/RecyclerView$ViewHolder;>;>;"
    :cond_b1
    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 65
    invoke-virtual {p1, v4}, Landroid/support/v7/widget/RecyclerView;->setRecycledViewPool(Landroid/support/v7/widget/RecyclerView$RecycledViewPool;)V

    goto/16 :goto_b

    .line 68
    .end local v0    # "cache":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/Integer;Ljava/util/Stack<Landroid/support/v7/widget/RecyclerView$ViewHolder;>;>;"
    .end local v1    # "d":Lcom/mikepenz/fastadapter/IItem;, "TItem;"
    .end local v4    # "recyclerViewPool":Landroid/support/v7/widget/RecyclerView$RecycledViewPool;
    :cond_b9
    return-void
.end method

.method public withCacheSize(I)Lcom/mikepenz/fastadapter/utils/RecyclerViewCacheUtil;
    .registers 2
    .param p1, "cacheSize"    # I

    .prologue
    .line 25
    .local p0, "this":Lcom/mikepenz/fastadapter/utils/RecyclerViewCacheUtil;, "Lcom/mikepenz/fastadapter/utils/RecyclerViewCacheUtil<TItem;>;"
    iput p1, p0, Lcom/mikepenz/fastadapter/utils/RecyclerViewCacheUtil;->mCacheSize:I

    .line 26
    return-object p0
.end method
