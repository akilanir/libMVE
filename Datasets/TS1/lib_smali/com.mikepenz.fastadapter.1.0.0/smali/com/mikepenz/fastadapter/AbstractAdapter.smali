.class public abstract Lcom/mikepenz/fastadapter/AbstractAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "AbstractAdapter.java"

# interfaces
.implements Lcom/mikepenz/fastadapter/IAdapter;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Item::",
        "Lcom/mikepenz/fastadapter/IItem;",
        ">",
        "Landroid/support/v7/widget/RecyclerView$Adapter;",
        "Lcom/mikepenz/fastadapter/IAdapter",
        "<TItem;>;"
    }
.end annotation


# instance fields
.field private mFastAdapter:Lcom/mikepenz/fastadapter/FastAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/mikepenz/fastadapter/FastAdapter",
            "<TItem;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 11
    .local p0, "this":Lcom/mikepenz/fastadapter/AbstractAdapter;, "Lcom/mikepenz/fastadapter/AbstractAdapter<TItem;>;"
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    return-void
.end method


# virtual methods
.method public getFastAdapter()Lcom/mikepenz/fastadapter/FastAdapter;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/mikepenz/fastadapter/FastAdapter",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 95
    .local p0, "this":Lcom/mikepenz/fastadapter/AbstractAdapter;, "Lcom/mikepenz/fastadapter/AbstractAdapter<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/AbstractAdapter;->mFastAdapter:Lcom/mikepenz/fastadapter/FastAdapter;

    return-object v0
.end method

.method public getItem(I)Lcom/mikepenz/fastadapter/IItem;
    .registers 3
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TItem;"
        }
    .end annotation

    .prologue
    .line 106
    .local p0, "this":Lcom/mikepenz/fastadapter/AbstractAdapter;, "Lcom/mikepenz/fastadapter/AbstractAdapter<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/AbstractAdapter;->mFastAdapter:Lcom/mikepenz/fastadapter/FastAdapter;

    invoke-virtual {v0, p1}, Lcom/mikepenz/fastadapter/FastAdapter;->getItem(I)Lcom/mikepenz/fastadapter/IItem;

    move-result-object v0

    return-object v0
.end method

.method public getItemCount()I
    .registers 2

    .prologue
    .line 116
    .local p0, "this":Lcom/mikepenz/fastadapter/AbstractAdapter;, "Lcom/mikepenz/fastadapter/AbstractAdapter<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/AbstractAdapter;->mFastAdapter:Lcom/mikepenz/fastadapter/FastAdapter;

    invoke-virtual {v0}, Lcom/mikepenz/fastadapter/FastAdapter;->getItemCount()I

    move-result v0

    return v0
.end method

.method public getItemId(I)J
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 87
    .local p0, "this":Lcom/mikepenz/fastadapter/AbstractAdapter;, "Lcom/mikepenz/fastadapter/AbstractAdapter<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/AbstractAdapter;->mFastAdapter:Lcom/mikepenz/fastadapter/FastAdapter;

    invoke-virtual {v0, p1}, Lcom/mikepenz/fastadapter/FastAdapter;->getItemId(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getItemViewType(I)I
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 76
    .local p0, "this":Lcom/mikepenz/fastadapter/AbstractAdapter;, "Lcom/mikepenz/fastadapter/AbstractAdapter<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/AbstractAdapter;->mFastAdapter:Lcom/mikepenz/fastadapter/FastAdapter;

    invoke-virtual {v0, p1}, Lcom/mikepenz/fastadapter/FastAdapter;->getItemViewType(I)I

    move-result v0

    return v0
.end method

.method public mapPossibleType(Lcom/mikepenz/fastadapter/IItem;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TItem;)V"
        }
    .end annotation

    .prologue
    .line 244
    .local p0, "this":Lcom/mikepenz/fastadapter/AbstractAdapter;, "Lcom/mikepenz/fastadapter/AbstractAdapter<TItem;>;"
    .local p1, "item":Lcom/mikepenz/fastadapter/IItem;, "TItem;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/AbstractAdapter;->mFastAdapter:Lcom/mikepenz/fastadapter/FastAdapter;

    invoke-virtual {v0, p1}, Lcom/mikepenz/fastadapter/FastAdapter;->registerTypeInstance(Lcom/mikepenz/fastadapter/IItem;)V

    .line 245
    return-void
.end method

.method public mapPossibleTypes(Ljava/lang/Iterable;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<TItem;>;)V"
        }
    .end annotation

    .prologue
    .line 231
    .local p0, "this":Lcom/mikepenz/fastadapter/AbstractAdapter;, "Lcom/mikepenz/fastadapter/AbstractAdapter<TItem;>;"
    .local p1, "items":Ljava/lang/Iterable;, "Ljava/lang/Iterable<TItem;>;"
    if-eqz p1, :cond_16

    .line 232
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_16

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/fastadapter/IItem;

    .line 233
    .local v0, "item":Lcom/mikepenz/fastadapter/IItem;, "TItem;"
    invoke-virtual {p0, v0}, Lcom/mikepenz/fastadapter/AbstractAdapter;->mapPossibleType(Lcom/mikepenz/fastadapter/IItem;)V

    goto :goto_6

    .line 236
    .end local v0    # "item":Lcom/mikepenz/fastadapter/IItem;, "TItem;"
    :cond_16
    return-void
.end method

.method public onAttachedToRecyclerView(Landroid/support/v7/widget/RecyclerView;)V
    .registers 3
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;

    .prologue
    .line 212
    .local p0, "this":Lcom/mikepenz/fastadapter/AbstractAdapter;, "Lcom/mikepenz/fastadapter/AbstractAdapter<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/AbstractAdapter;->mFastAdapter:Lcom/mikepenz/fastadapter/FastAdapter;

    invoke-virtual {v0, p1}, Lcom/mikepenz/fastadapter/FastAdapter;->onAttachedToRecyclerView(Landroid/support/v7/widget/RecyclerView;)V

    .line 213
    return-void
.end method

.method public onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .registers 4
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "position"    # I

    .prologue
    .line 139
    .local p0, "this":Lcom/mikepenz/fastadapter/AbstractAdapter;, "Lcom/mikepenz/fastadapter/AbstractAdapter<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/AbstractAdapter;->mFastAdapter:Lcom/mikepenz/fastadapter/FastAdapter;

    invoke-virtual {v0, p1, p2}, Lcom/mikepenz/fastadapter/FastAdapter;->onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V

    .line 140
    return-void
.end method

.method public onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;ILjava/util/List;)V
    .registers 5
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "position"    # I
    .param p3, "payloads"    # Ljava/util/List;

    .prologue
    .line 151
    .local p0, "this":Lcom/mikepenz/fastadapter/AbstractAdapter;, "Lcom/mikepenz/fastadapter/AbstractAdapter<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/AbstractAdapter;->mFastAdapter:Lcom/mikepenz/fastadapter/FastAdapter;

    invoke-virtual {v0, p1, p2, p3}, Lcom/mikepenz/fastadapter/FastAdapter;->onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;ILjava/util/List;)V

    .line 152
    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .registers 4
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 128
    .local p0, "this":Lcom/mikepenz/fastadapter/AbstractAdapter;, "Lcom/mikepenz/fastadapter/AbstractAdapter<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/AbstractAdapter;->mFastAdapter:Lcom/mikepenz/fastadapter/FastAdapter;

    invoke-virtual {v0, p1, p2}, Lcom/mikepenz/fastadapter/FastAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public onDetachedFromRecyclerView(Landroid/support/v7/widget/RecyclerView;)V
    .registers 3
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;

    .prologue
    .line 222
    .local p0, "this":Lcom/mikepenz/fastadapter/AbstractAdapter;, "Lcom/mikepenz/fastadapter/AbstractAdapter<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/AbstractAdapter;->mFastAdapter:Lcom/mikepenz/fastadapter/FastAdapter;

    invoke-virtual {v0, p1}, Lcom/mikepenz/fastadapter/FastAdapter;->onDetachedFromRecyclerView(Landroid/support/v7/widget/RecyclerView;)V

    .line 223
    return-void
.end method

.method public onFailedToRecycleView(Landroid/support/v7/widget/RecyclerView$ViewHolder;)Z
    .registers 3
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 182
    .local p0, "this":Lcom/mikepenz/fastadapter/AbstractAdapter;, "Lcom/mikepenz/fastadapter/AbstractAdapter<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/AbstractAdapter;->mFastAdapter:Lcom/mikepenz/fastadapter/FastAdapter;

    invoke-virtual {v0, p1}, Lcom/mikepenz/fastadapter/FastAdapter;->onFailedToRecycleView(Landroid/support/v7/widget/RecyclerView$ViewHolder;)Z

    move-result v0

    return v0
.end method

.method public onViewAttachedToWindow(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 3
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 202
    .local p0, "this":Lcom/mikepenz/fastadapter/AbstractAdapter;, "Lcom/mikepenz/fastadapter/AbstractAdapter<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/AbstractAdapter;->mFastAdapter:Lcom/mikepenz/fastadapter/FastAdapter;

    invoke-virtual {v0, p1}, Lcom/mikepenz/fastadapter/FastAdapter;->onViewAttachedToWindow(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 203
    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 3
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 192
    .local p0, "this":Lcom/mikepenz/fastadapter/AbstractAdapter;, "Lcom/mikepenz/fastadapter/AbstractAdapter<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/AbstractAdapter;->mFastAdapter:Lcom/mikepenz/fastadapter/FastAdapter;

    invoke-virtual {v0, p1}, Lcom/mikepenz/fastadapter/FastAdapter;->onViewDetachedFromWindow(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 193
    return-void
.end method

.method public onViewRecycled(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 3
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 171
    .local p0, "this":Lcom/mikepenz/fastadapter/AbstractAdapter;, "Lcom/mikepenz/fastadapter/AbstractAdapter<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/AbstractAdapter;->mFastAdapter:Lcom/mikepenz/fastadapter/FastAdapter;

    invoke-virtual {v0, p1}, Lcom/mikepenz/fastadapter/FastAdapter;->onViewRecycled(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 172
    return-void
.end method

.method public registerAdapterDataObserver(Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;)V
    .registers 3
    .param p1, "observer"    # Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;

    .prologue
    .line 49
    .local p0, "this":Lcom/mikepenz/fastadapter/AbstractAdapter;, "Lcom/mikepenz/fastadapter/AbstractAdapter<TItem;>;"
    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->registerAdapterDataObserver(Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;)V

    .line 50
    iget-object v0, p0, Lcom/mikepenz/fastadapter/AbstractAdapter;->mFastAdapter:Lcom/mikepenz/fastadapter/FastAdapter;

    if-eqz v0, :cond_c

    .line 51
    iget-object v0, p0, Lcom/mikepenz/fastadapter/AbstractAdapter;->mFastAdapter:Lcom/mikepenz/fastadapter/FastAdapter;

    invoke-virtual {v0, p1}, Lcom/mikepenz/fastadapter/FastAdapter;->registerAdapterDataObserver(Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;)V

    .line 53
    :cond_c
    return-void
.end method

.method public setHasStableIds(Z)V
    .registers 3
    .param p1, "hasStableIds"    # Z

    .prologue
    .line 161
    .local p0, "this":Lcom/mikepenz/fastadapter/AbstractAdapter;, "Lcom/mikepenz/fastadapter/AbstractAdapter<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/AbstractAdapter;->mFastAdapter:Lcom/mikepenz/fastadapter/FastAdapter;

    invoke-virtual {v0, p1}, Lcom/mikepenz/fastadapter/FastAdapter;->setHasStableIds(Z)V

    .line 162
    return-void
.end method

.method public unregisterAdapterDataObserver(Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;)V
    .registers 3
    .param p1, "observer"    # Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;

    .prologue
    .line 62
    .local p0, "this":Lcom/mikepenz/fastadapter/AbstractAdapter;, "Lcom/mikepenz/fastadapter/AbstractAdapter<TItem;>;"
    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->unregisterAdapterDataObserver(Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;)V

    .line 63
    iget-object v0, p0, Lcom/mikepenz/fastadapter/AbstractAdapter;->mFastAdapter:Lcom/mikepenz/fastadapter/FastAdapter;

    if-eqz v0, :cond_c

    .line 64
    iget-object v0, p0, Lcom/mikepenz/fastadapter/AbstractAdapter;->mFastAdapter:Lcom/mikepenz/fastadapter/FastAdapter;

    invoke-virtual {v0, p1}, Lcom/mikepenz/fastadapter/FastAdapter;->unregisterAdapterDataObserver(Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;)V

    .line 66
    :cond_c
    return-void
.end method

.method public wrap(Lcom/mikepenz/fastadapter/AbstractAdapter;)Lcom/mikepenz/fastadapter/AbstractAdapter;
    .registers 3
    .param p1, "abstractAdapter"    # Lcom/mikepenz/fastadapter/AbstractAdapter;

    .prologue
    .line 37
    .local p0, "this":Lcom/mikepenz/fastadapter/AbstractAdapter;, "Lcom/mikepenz/fastadapter/AbstractAdapter<TItem;>;"
    invoke-virtual {p1}, Lcom/mikepenz/fastadapter/AbstractAdapter;->getFastAdapter()Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/fastadapter/AbstractAdapter;->mFastAdapter:Lcom/mikepenz/fastadapter/FastAdapter;

    .line 38
    iget-object v0, p0, Lcom/mikepenz/fastadapter/AbstractAdapter;->mFastAdapter:Lcom/mikepenz/fastadapter/FastAdapter;

    invoke-virtual {v0, p0}, Lcom/mikepenz/fastadapter/FastAdapter;->registerAdapter(Lcom/mikepenz/fastadapter/AbstractAdapter;)V

    .line 39
    return-object p0
.end method

.method public wrap(Lcom/mikepenz/fastadapter/FastAdapter;)Lcom/mikepenz/fastadapter/AbstractAdapter;
    .registers 3
    .param p1, "fastAdapter"    # Lcom/mikepenz/fastadapter/FastAdapter;

    .prologue
    .line 24
    .local p0, "this":Lcom/mikepenz/fastadapter/AbstractAdapter;, "Lcom/mikepenz/fastadapter/AbstractAdapter<TItem;>;"
    iput-object p1, p0, Lcom/mikepenz/fastadapter/AbstractAdapter;->mFastAdapter:Lcom/mikepenz/fastadapter/FastAdapter;

    .line 25
    iget-object v0, p0, Lcom/mikepenz/fastadapter/AbstractAdapter;->mFastAdapter:Lcom/mikepenz/fastadapter/FastAdapter;

    invoke-virtual {v0, p0}, Lcom/mikepenz/fastadapter/FastAdapter;->registerAdapter(Lcom/mikepenz/fastadapter/AbstractAdapter;)V

    .line 26
    return-object p0
.end method
