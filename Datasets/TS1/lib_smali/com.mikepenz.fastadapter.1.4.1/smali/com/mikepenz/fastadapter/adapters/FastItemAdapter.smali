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
.field private final mItemAdapter:Lcom/mikepenz/fastadapter/adapters/ItemAdapter;
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
.method public add(ILcom/mikepenz/fastadapter/IItem;)Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;
    .registers 6
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITItem;)",
            "Lcom/mikepenz/fastadapter/adapters/FastItemAdapter",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 224
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/FastItemAdapter<TItem;>;"
    .local p2, "item":Lcom/mikepenz/fastadapter/IItem;, "TItem;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;->mItemAdapter:Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/mikepenz/fastadapter/IItem;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    invoke-virtual {v0, p1, v1}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->add(I[Lcom/mikepenz/fastadapter/IItem;)Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    .line 225
    return-object p0
.end method

.method public add(ILjava/util/List;)Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;
    .registers 4
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List",
            "<TItem;>;)",
            "Lcom/mikepenz/fastadapter/adapters/FastItemAdapter",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 192
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/FastItemAdapter<TItem;>;"
    .local p2, "items":Ljava/util/List;, "Ljava/util/List<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;->mItemAdapter:Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    invoke-virtual {v0, p1, p2}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->add(ILjava/util/List;)Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    .line 193
    return-object p0
.end method

.method public final varargs add(I[Lcom/mikepenz/fastadapter/IItem;)Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;
    .registers 4
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I[TItem;)",
            "Lcom/mikepenz/fastadapter/adapters/FastItemAdapter",
            "<TItem;>;"
        }
    .end annotation

    .annotation runtime Ljava/lang/SafeVarargs;
    .end annotation

    .prologue
    .line 181
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/FastItemAdapter<TItem;>;"
    .local p2, "items":[Lcom/mikepenz/fastadapter/IItem;, "[TItem;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;->mItemAdapter:Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    invoke-virtual {v0, p1, p2}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->add(I[Lcom/mikepenz/fastadapter/IItem;)Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    .line 182
    return-object p0
.end method

.method public add(Lcom/mikepenz/fastadapter/IItem;)Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TItem;)",
            "Lcom/mikepenz/fastadapter/adapters/FastItemAdapter",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 213
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/FastItemAdapter<TItem;>;"
    .local p1, "item":Lcom/mikepenz/fastadapter/IItem;, "TItem;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;->mItemAdapter:Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/mikepenz/fastadapter/IItem;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->add([Lcom/mikepenz/fastadapter/IItem;)Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    .line 214
    return-object p0
.end method

.method public add(Ljava/util/List;)Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<TItem;>;)",
            "Lcom/mikepenz/fastadapter/adapters/FastItemAdapter",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 169
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/FastItemAdapter<TItem;>;"
    .local p1, "items":Ljava/util/List;, "Ljava/util/List<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;->mItemAdapter:Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    invoke-virtual {v0, p1}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->add(Ljava/util/List;)Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    .line 170
    return-object p0
.end method

.method public final varargs add([Lcom/mikepenz/fastadapter/IItem;)Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TItem;)",
            "Lcom/mikepenz/fastadapter/adapters/FastItemAdapter",
            "<TItem;>;"
        }
    .end annotation

    .annotation runtime Ljava/lang/SafeVarargs;
    .end annotation

    .prologue
    .line 159
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/FastItemAdapter<TItem;>;"
    .local p1, "items":[Lcom/mikepenz/fastadapter/IItem;, "[TItem;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;->mItemAdapter:Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    invoke-virtual {v0, p1}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->add([Lcom/mikepenz/fastadapter/IItem;)Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    .line 160
    return-object p0
.end method

.method public clear()Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/mikepenz/fastadapter/adapters/FastItemAdapter",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 265
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/FastItemAdapter<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;->mItemAdapter:Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    invoke-virtual {v0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->clear()Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    .line 266
    return-object p0
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

.method public move(II)Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;
    .registers 4
    .param p1, "fromPosition"    # I
    .param p2, "toPosition"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Lcom/mikepenz/fastadapter/adapters/FastItemAdapter",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 236
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/FastItemAdapter<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;->mItemAdapter:Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    invoke-virtual {v0, p1, p2}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->move(II)Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    .line 237
    return-object p0
.end method

.method public remove(I)Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;
    .registers 3
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/mikepenz/fastadapter/adapters/FastItemAdapter",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 246
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/FastItemAdapter<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;->mItemAdapter:Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    invoke-virtual {v0, p1}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->remove(I)Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    .line 247
    return-object p0
.end method

.method public removeItemRange(II)Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;
    .registers 4
    .param p1, "position"    # I
    .param p2, "itemCount"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Lcom/mikepenz/fastadapter/adapters/FastItemAdapter",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 257
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/FastItemAdapter<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;->mItemAdapter:Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    invoke-virtual {v0, p1, p2}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->removeRange(II)Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    .line 258
    return-object p0
.end method

.method public set(ILcom/mikepenz/fastadapter/IItem;)Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;
    .registers 4
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITItem;)",
            "Lcom/mikepenz/fastadapter/adapters/FastItemAdapter",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 203
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/FastItemAdapter<TItem;>;"
    .local p2, "item":Lcom/mikepenz/fastadapter/IItem;, "TItem;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;->mItemAdapter:Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    invoke-virtual {v0, p1, p2}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->set(ILcom/mikepenz/fastadapter/IItem;)Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    .line 204
    return-object p0
.end method

.method public set(Ljava/util/List;)Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<TItem;>;)",
            "Lcom/mikepenz/fastadapter/adapters/FastItemAdapter",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 138
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/FastItemAdapter<TItem;>;"
    .local p1, "items":Ljava/util/List;, "Ljava/util/List<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;->mItemAdapter:Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    invoke-virtual {v0, p1}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->set(Ljava/util/List;)Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    .line 139
    return-object p0
.end method

.method public setNewList(Ljava/util/List;)Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<TItem;>;)",
            "Lcom/mikepenz/fastadapter/adapters/FastItemAdapter",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 148
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/FastItemAdapter<TItem;>;"
    .local p1, "items":Ljava/util/List;, "Ljava/util/List<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;->mItemAdapter:Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    invoke-virtual {v0, p1}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->setNewList(Ljava/util/List;)Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    .line 149
    return-object p0
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
