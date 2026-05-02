.class public Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;
.super Lcom/mikepenz/fastadapter/FastAdapter;
.source "FastItemAdapter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Item::",
        "Lcom/mikepenz/fastadapter/IItem;",
        ">",
        "Lcom/mikepenz/fastadapter/FastAdapter",
        "<TItem;>;"
    }
.end annotation


# instance fields
.field mItemAdapter:Lcom/mikepenz/fastadapter/adapters/ItemAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/mikepenz/fastadapter/adapters/ItemAdapter",
            "<TItem;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 19
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/FastItemAdapter<TItem;>;"
    invoke-direct {p0}, Lcom/mikepenz/fastadapter/FastAdapter;-><init>()V

    .line 14
    new-instance v0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    invoke-direct {v0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;->mItemAdapter:Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    .line 20
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;->mItemAdapter:Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    invoke-virtual {v0, p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->wrap(Lcom/mikepenz/fastadapter/FastAdapter;)Lcom/mikepenz/fastadapter/AbstractAdapter;

    .line 21
    return-void
.end method


# virtual methods
.method public add(ILcom/mikepenz/fastadapter/IItem;)V
    .registers 6
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITItem;)V"
        }
    .end annotation

    .prologue
    .line 216
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/FastItemAdapter<TItem;>;"
    .local p2, "item":Lcom/mikepenz/fastadapter/IItem;, "TItem;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;->mItemAdapter:Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/mikepenz/fastadapter/IItem;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    invoke-virtual {v0, p1, v1}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->add(I[Lcom/mikepenz/fastadapter/IItem;)V

    .line 217
    return-void
.end method

.method public add(ILjava/util/List;)V
    .registers 4
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List",
            "<TItem;>;)V"
        }
    .end annotation

    .prologue
    .line 187
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/FastItemAdapter<TItem;>;"
    .local p2, "items":Ljava/util/List;, "Ljava/util/List<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;->mItemAdapter:Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    invoke-virtual {v0, p1, p2}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->add(ILjava/util/List;)V

    .line 188
    return-void
.end method

.method public final varargs add(I[Lcom/mikepenz/fastadapter/IItem;)V
    .registers 4
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I[TItem;)V"
        }
    .end annotation

    .annotation runtime Ljava/lang/SafeVarargs;
    .end annotation

    .prologue
    .line 177
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/FastItemAdapter<TItem;>;"
    .local p2, "items":[Lcom/mikepenz/fastadapter/IItem;, "[TItem;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;->mItemAdapter:Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    invoke-virtual {v0, p1, p2}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->add(I[Lcom/mikepenz/fastadapter/IItem;)V

    .line 178
    return-void
.end method

.method public add(Lcom/mikepenz/fastadapter/IItem;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TItem;)V"
        }
    .end annotation

    .prologue
    .line 206
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/FastItemAdapter<TItem;>;"
    .local p1, "item":Lcom/mikepenz/fastadapter/IItem;, "TItem;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;->mItemAdapter:Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/mikepenz/fastadapter/IItem;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->add([Lcom/mikepenz/fastadapter/IItem;)V

    .line 207
    return-void
.end method

.method public add(Ljava/util/List;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<TItem;>;)V"
        }
    .end annotation

    .prologue
    .line 166
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/FastItemAdapter<TItem;>;"
    .local p1, "items":Ljava/util/List;, "Ljava/util/List<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;->mItemAdapter:Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    invoke-virtual {v0, p1}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->add(Ljava/util/List;)V

    .line 167
    return-void
.end method

.method public final varargs add([Lcom/mikepenz/fastadapter/IItem;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TItem;)V"
        }
    .end annotation

    .annotation runtime Ljava/lang/SafeVarargs;
    .end annotation

    .prologue
    .line 157
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/FastItemAdapter<TItem;>;"
    .local p1, "items":[Lcom/mikepenz/fastadapter/IItem;, "[TItem;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;->mItemAdapter:Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    invoke-virtual {v0, p1}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->add([Lcom/mikepenz/fastadapter/IItem;)V

    .line 158
    return-void
.end method

.method public clear()V
    .registers 2

    .prologue
    .line 242
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/FastItemAdapter<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;->mItemAdapter:Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    invoke-virtual {v0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->clear()V

    .line 243
    return-void
.end method

.method public filter(Ljava/lang/CharSequence;)V
    .registers 3
    .param p1, "constraint"    # Ljava/lang/CharSequence;

    .prologue
    .line 67
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/FastItemAdapter<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;->mItemAdapter:Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    invoke-virtual {v0, p1}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->filter(Ljava/lang/CharSequence;)V

    .line 68
    return-void
.end method

.method public getAdapterItem(I)Lcom/mikepenz/fastadapter/IItem;
    .registers 3
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TItem;"
        }
    .end annotation

    .prologue
    .line 117
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/FastItemAdapter<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;->mItemAdapter:Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    invoke-virtual {v0, p1}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getAdapterItem(I)Lcom/mikepenz/fastadapter/IItem;

    move-result-object v0

    return-object v0
.end method

.method public getAdapterItemCount()I
    .registers 2

    .prologue
    .line 81
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/FastItemAdapter<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;->mItemAdapter:Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    invoke-virtual {v0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getAdapterItemCount()I

    move-result v0

    return v0
.end method

.method public getAdapterItems()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 89
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/FastItemAdapter<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;->mItemAdapter:Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    invoke-virtual {v0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getAdapterItems()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getAdapterPosition(Lcom/mikepenz/fastadapter/IItem;)I
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TItem;)I"
        }
    .end annotation

    .prologue
    .line 99
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/FastItemAdapter<TItem;>;"
    .local p1, "item":Lcom/mikepenz/fastadapter/IItem;, "TItem;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;->mItemAdapter:Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    invoke-virtual {v0, p1}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getAdapterPosition(Lcom/mikepenz/fastadapter/IItem;)I

    move-result v0

    return v0
.end method

.method public getGlobalPosition(I)I
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 109
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/FastItemAdapter<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;->mItemAdapter:Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    invoke-virtual {v0, p1}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getGlobalPosition(I)I

    move-result v0

    return v0
.end method

.method public getItemAdapter()Lcom/mikepenz/fastadapter/adapters/ItemAdapter;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/mikepenz/fastadapter/adapters/ItemAdapter",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 29
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/FastItemAdapter<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;->mItemAdapter:Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    return-object v0
.end method

.method public getItemFilter()Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilter;
    .registers 2

    .prologue
    .line 47
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/FastItemAdapter<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;->mItemAdapter:Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    invoke-virtual {v0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getItemFilter()Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilter;

    move-result-object v0

    return-object v0
.end method

.method public getOrder()I
    .registers 2

    .prologue
    .line 74
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/FastItemAdapter<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;->mItemAdapter:Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    invoke-virtual {v0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getOrder()I

    move-result v0

    return v0
.end method

.method public remove(I)V
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 225
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/FastItemAdapter<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;->mItemAdapter:Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    invoke-virtual {v0, p1}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->remove(I)V

    .line 226
    return-void
.end method

.method public removeItemRange(II)V
    .registers 4
    .param p1, "position"    # I
    .param p2, "itemCount"    # I

    .prologue
    .line 235
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/FastItemAdapter<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;->mItemAdapter:Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    invoke-virtual {v0, p1, p2}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->removeRange(II)V

    .line 236
    return-void
.end method

.method public set(ILcom/mikepenz/fastadapter/IItem;)V
    .registers 4
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITItem;)V"
        }
    .end annotation

    .prologue
    .line 197
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/FastItemAdapter<TItem;>;"
    .local p2, "item":Lcom/mikepenz/fastadapter/IItem;, "TItem;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;->mItemAdapter:Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    invoke-virtual {v0, p1, p2}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->set(ILcom/mikepenz/fastadapter/IItem;)V

    .line 198
    return-void
.end method

.method public set(Ljava/util/List;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<TItem;>;)V"
        }
    .end annotation

    .prologue
    .line 138
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/FastItemAdapter<TItem;>;"
    .local p1, "items":Ljava/util/List;, "Ljava/util/List<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;->mItemAdapter:Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    invoke-virtual {v0, p1}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->set(Ljava/util/List;)V

    .line 139
    return-void
.end method

.method public setNewList(Ljava/util/List;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<TItem;>;)V"
        }
    .end annotation

    .prologue
    .line 147
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/FastItemAdapter<TItem;>;"
    .local p1, "items":Ljava/util/List;, "Ljava/util/List<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;->mItemAdapter:Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    invoke-virtual {v0, p1}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->setNewList(Ljava/util/List;)V

    .line 148
    return-void
.end method

.method public setSubItems(Lcom/mikepenz/fastadapter/IExpandable;Ljava/util/List;)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/mikepenz/fastadapter/IExpandable",
            "<TT;TItem;>;",
            "Ljava/util/List",
            "<TItem;>;)TT;"
        }
    .end annotation

    .prologue
    .line 129
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/FastItemAdapter<TItem;>;"
    .local p1, "collapsible":Lcom/mikepenz/fastadapter/IExpandable;, "Lcom/mikepenz/fastadapter/IExpandable<TT;TItem;>;"
    .local p2, "subItems":Ljava/util/List;, "Ljava/util/List<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;->mItemAdapter:Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    invoke-virtual {v0, p1, p2}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->setSubItems(Lcom/mikepenz/fastadapter/IExpandable;Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public withFilterPredicate(Lcom/mikepenz/fastadapter/IItemAdapter$Predicate;)Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mikepenz/fastadapter/IItemAdapter$Predicate",
            "<TItem;>;)",
            "Lcom/mikepenz/fastadapter/adapters/FastItemAdapter",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 57
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/FastItemAdapter<TItem;>;"
    .local p1, "filterPredicate":Lcom/mikepenz/fastadapter/IItemAdapter$Predicate;, "Lcom/mikepenz/fastadapter/IItemAdapter$Predicate<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;->mItemAdapter:Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    invoke-virtual {v0, p1}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->withFilterPredicate(Lcom/mikepenz/fastadapter/IItemAdapter$Predicate;)Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    .line 58
    return-object p0
.end method

.method public withUseIdDistributor(Z)Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;
    .registers 3
    .param p1, "useIdDistributor"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Lcom/mikepenz/fastadapter/adapters/FastItemAdapter",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 39
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/FastItemAdapter<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;->mItemAdapter:Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    invoke-virtual {v0, p1}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->withUseIdDistributor(Z)Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    .line 40
    return-object p0
.end method
