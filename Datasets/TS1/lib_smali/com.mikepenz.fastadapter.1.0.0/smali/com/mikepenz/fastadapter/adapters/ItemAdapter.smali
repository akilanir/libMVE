.class public Lcom/mikepenz/fastadapter/adapters/ItemAdapter;
.super Lcom/mikepenz/fastadapter/AbstractAdapter;
.source "ItemAdapter.java"

# interfaces
.implements Lcom/mikepenz/fastadapter/IItemAdapter;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilter;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Item::",
        "Lcom/mikepenz/fastadapter/IItem;",
        ">",
        "Lcom/mikepenz/fastadapter/AbstractAdapter",
        "<TItem;>;",
        "Lcom/mikepenz/fastadapter/IItemAdapter",
        "<TItem;>;"
    }
.end annotation


# instance fields
.field private mFilterPredicate:Lcom/mikepenz/fastadapter/IItemAdapter$Predicate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/mikepenz/fastadapter/IItemAdapter$Predicate",
            "<TItem;>;"
        }
    .end annotation
.end field

.field private mItemFilter:Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/mikepenz/fastadapter/adapters/ItemAdapter",
            "<TItem;>.ItemFilter;"
        }
    .end annotation
.end field

.field private mItems:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<TItem;>;"
        }
    .end annotation
.end field

.field private mUseIdDistributor:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 21
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>;"
    invoke-direct {p0}, Lcom/mikepenz/fastadapter/AbstractAdapter;-><init>()V

    .line 23
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItems:Ljava/util/List;

    .line 26
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mUseIdDistributor:Z

    .line 40
    new-instance v0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilter;

    invoke-direct {v0, p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilter;-><init>(Lcom/mikepenz/fastadapter/adapters/ItemAdapter;)V

    iput-object v0, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItemFilter:Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilter;

    .line 318
    return-void
.end method

.method static synthetic access$000(Lcom/mikepenz/fastadapter/adapters/ItemAdapter;)Ljava/util/List;
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    .prologue
    .line 21
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItems:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$100(Lcom/mikepenz/fastadapter/adapters/ItemAdapter;)Lcom/mikepenz/fastadapter/IItemAdapter$Predicate;
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    .prologue
    .line 21
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mFilterPredicate:Lcom/mikepenz/fastadapter/IItemAdapter$Predicate;

    return-object v0
.end method


# virtual methods
.method public add(ILjava/util/List;)V
    .registers 6
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List",
            "<TItem;>;)V"
        }
    .end annotation

    .prologue
    .line 251
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>;"
    .local p2, "items":Ljava/util/List;, "Ljava/util/List<TItem;>;"
    iget-boolean v0, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mUseIdDistributor:Z

    if-eqz v0, :cond_7

    .line 252
    invoke-static {p2}, Lcom/mikepenz/fastadapter/utils/IdDistributor;->checkIds(Ljava/util/List;)Ljava/util/List;

    .line 254
    :cond_7
    if-eqz p2, :cond_2a

    .line 255
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItems:Ljava/util/List;

    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getFastAdapter()Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v1

    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getOrder()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/mikepenz/fastadapter/FastAdapter;->getItemCount(I)I

    move-result v1

    sub-int v1, p1, v1

    invoke-interface {v0, v1, p2}, Ljava/util/List;->addAll(ILjava/util/Collection;)Z

    .line 256
    invoke-virtual {p0, p2}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mapPossibleTypes(Ljava/lang/Iterable;)V

    .line 257
    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getFastAdapter()Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v0

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {v0, p1, v1}, Lcom/mikepenz/fastadapter/FastAdapter;->notifyAdapterItemRangeInserted(II)V

    .line 259
    :cond_2a
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
    .line 241
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>;"
    .local p2, "items":[Lcom/mikepenz/fastadapter/IItem;, "[TItem;"
    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->add(ILjava/util/List;)V

    .line 242
    return-void
.end method

.method public add(Ljava/util/List;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<TItem;>;)V"
        }
    .end annotation

    .prologue
    .line 225
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>;"
    .local p1, "items":Ljava/util/List;, "Ljava/util/List<TItem;>;"
    iget-boolean v0, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mUseIdDistributor:Z

    if-eqz v0, :cond_7

    .line 226
    invoke-static {p1}, Lcom/mikepenz/fastadapter/utils/IdDistributor;->checkIds(Ljava/util/List;)Ljava/util/List;

    .line 228
    :cond_7
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItems:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 229
    invoke-virtual {p0, p1}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mapPossibleTypes(Ljava/lang/Iterable;)V

    .line 230
    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getFastAdapter()Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v0

    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getFastAdapter()Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v1

    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getOrder()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/mikepenz/fastadapter/FastAdapter;->getItemCount(I)I

    move-result v1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/mikepenz/fastadapter/FastAdapter;->notifyAdapterItemRangeInserted(II)V

    .line 231
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
    .line 216
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>;"
    .local p1, "items":[Lcom/mikepenz/fastadapter/IItem;, "[TItem;"
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->add(Ljava/util/List;)V

    .line 217
    return-void
.end method

.method public clear()V
    .registers 5

    .prologue
    .line 309
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>;"
    iget-object v1, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItems:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v0

    .line 310
    .local v0, "count":I
    iget-object v1, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItems:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 311
    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getFastAdapter()Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v1

    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getFastAdapter()Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v2

    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getOrder()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/mikepenz/fastadapter/FastAdapter;->getItemCount(I)I

    move-result v2

    invoke-virtual {v1, v2, v0}, Lcom/mikepenz/fastadapter/FastAdapter;->notifyAdapterItemRangeRemoved(II)V

    .line 312
    return-void
.end method

.method public filter(Ljava/lang/CharSequence;)V
    .registers 3
    .param p1, "constraint"    # Ljava/lang/CharSequence;

    .prologue
    .line 69
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItemFilter:Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilter;

    invoke-virtual {v0, p1}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilter;->filter(Ljava/lang/CharSequence;)V

    .line 70
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
    .line 128
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItems:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/fastadapter/IItem;

    return-object v0
.end method

.method public getAdapterItemCount()I
    .registers 2

    .prologue
    .line 85
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItems:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

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
    .line 93
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItems:Ljava/util/List;

    return-object v0
.end method

.method public getAdapterPosition(Lcom/mikepenz/fastadapter/IItem;)I
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TItem;)I"
        }
    .end annotation

    .prologue
    .line 104
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>;"
    .local p1, "item":Lcom/mikepenz/fastadapter/IItem;, "TItem;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v1, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItems:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_21

    .line 105
    iget-object v1, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItems:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mikepenz/fastadapter/IItem;

    invoke-interface {v1}, Lcom/mikepenz/fastadapter/IItem;->getIdentifier()J

    move-result-wide v1

    invoke-interface {p1}, Lcom/mikepenz/fastadapter/IItem;->getIdentifier()J

    move-result-wide v3

    cmp-long v1, v1, v3

    if-nez v1, :cond_1e

    .line 109
    .end local v0    # "i":I
    :goto_1d
    return v0

    .line 104
    .restart local v0    # "i":I
    :cond_1e
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 109
    :cond_21
    const/4 v0, -0x1

    goto :goto_1d
.end method

.method public getGlobalPosition(I)I
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 119
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>;"
    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getFastAdapter()Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v0

    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getOrder()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/mikepenz/fastadapter/FastAdapter;->getItemCount(I)I

    move-result v0

    add-int/2addr v0, p1

    return v0
.end method

.method public getItemFilter()Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilter;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/mikepenz/fastadapter/adapters/ItemAdapter",
            "<TItem;>.ItemFilter;"
        }
    .end annotation

    .prologue
    .line 46
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItemFilter:Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilter;

    return-object v0
.end method

.method public getOrder()I
    .registers 2

    .prologue
    .line 77
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>;"
    const/16 v0, 0x1f4

    return v0
.end method

.method public remove(I)V
    .registers 5
    .param p1, "position"    # I

    .prologue
    .line 282
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItems:Ljava/util/List;

    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getFastAdapter()Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v1

    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getOrder()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/mikepenz/fastadapter/FastAdapter;->getItemCount(I)I

    move-result v1

    sub-int v1, p1, v1

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 283
    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getFastAdapter()Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/mikepenz/fastadapter/FastAdapter;->notifyAdapterItemRemoved(I)V

    .line 284
    return-void
.end method

.method public removeRange(II)V
    .registers 9
    .param p1, "position"    # I
    .param p2, "itemCount"    # I

    .prologue
    .line 294
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>;"
    iget-object v3, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItems:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v1

    .line 296
    .local v1, "length":I
    sub-int v3, v1, p1

    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getFastAdapter()Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v4

    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getOrder()I

    move-result v5

    invoke-virtual {v4, v5}, Lcom/mikepenz/fastadapter/FastAdapter;->getItemCount(I)I

    move-result v4

    add-int/2addr v3, v4

    invoke-static {p2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 298
    .local v2, "saveItemCount":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1a
    if-ge v0, v2, :cond_32

    .line 299
    iget-object v3, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItems:Ljava/util/List;

    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getFastAdapter()Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v4

    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getOrder()I

    move-result v5

    invoke-virtual {v4, v5}, Lcom/mikepenz/fastadapter/FastAdapter;->getItemCount(I)I

    move-result v4

    sub-int v4, p1, v4

    invoke-interface {v3, v4}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 298
    add-int/lit8 v0, v0, 0x1

    goto :goto_1a

    .line 302
    :cond_32
    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getFastAdapter()Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v3

    invoke-virtual {v3, p1, v2}, Lcom/mikepenz/fastadapter/FastAdapter;->notifyAdapterItemRangeRemoved(II)V

    .line 303
    return-void
.end method

.method public set(ILcom/mikepenz/fastadapter/IItem;)V
    .registers 6
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITItem;)V"
        }
    .end annotation

    .prologue
    .line 268
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>;"
    .local p2, "item":Lcom/mikepenz/fastadapter/IItem;, "TItem;"
    iget-boolean v0, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mUseIdDistributor:Z

    if-eqz v0, :cond_7

    .line 269
    invoke-static {p2}, Lcom/mikepenz/fastadapter/utils/IdDistributor;->checkId(Lcom/mikepenz/fastadapter/IIdentifyable;)Lcom/mikepenz/fastadapter/IIdentifyable;

    .line 271
    :cond_7
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItems:Ljava/util/List;

    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getFastAdapter()Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v1

    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getOrder()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/mikepenz/fastadapter/FastAdapter;->getItemCount(I)I

    move-result v1

    sub-int v1, p1, v1

    invoke-interface {v0, v1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 272
    invoke-virtual {p0, p2}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mapPossibleType(Lcom/mikepenz/fastadapter/IItem;)V

    .line 273
    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getFastAdapter()Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/mikepenz/fastadapter/FastAdapter;->notifyAdapterItemChanged(I)V

    .line 274
    return-void
.end method

.method public set(Ljava/util/List;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<TItem;>;)V"
        }
    .end annotation

    .prologue
    .line 153
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>;"
    .local p1, "items":Ljava/util/List;, "Ljava/util/List<TItem;>;"
    iget-boolean v3, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mUseIdDistributor:Z

    if-eqz v3, :cond_7

    .line 154
    invoke-static {p1}, Lcom/mikepenz/fastadapter/utils/IdDistributor;->checkIds(Ljava/util/List;)Ljava/util/List;

    .line 158
    :cond_7
    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getFastAdapter()Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mikepenz/fastadapter/FastAdapter;->collapse()V

    .line 161
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    .line 162
    .local v1, "newItemsCount":I
    iget-object v3, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItems:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v2

    .line 163
    .local v2, "previousItemsCount":I
    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getFastAdapter()Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v3

    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getOrder()I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/mikepenz/fastadapter/FastAdapter;->getItemCount(I)I

    move-result v0

    .line 166
    .local v0, "itemsBeforeThisAdapter":I
    iget-object v3, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItems:Ljava/util/List;

    if-eq p1, v3, :cond_3a

    .line 168
    iget-object v3, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItems:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_35

    .line 169
    iget-object v3, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItems:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->clear()V

    .line 173
    :cond_35
    iget-object v3, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItems:Ljava/util/List;

    invoke-interface {v3, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 177
    :cond_3a
    invoke-virtual {p0, p1}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mapPossibleTypes(Ljava/lang/Iterable;)V

    .line 180
    if-le v1, v2, :cond_54

    .line 181
    if-lez v2, :cond_48

    .line 182
    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getFastAdapter()Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v3

    invoke-virtual {v3, v0, v2}, Lcom/mikepenz/fastadapter/FastAdapter;->notifyAdapterItemRangeChanged(II)V

    .line 184
    :cond_48
    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getFastAdapter()Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v3

    add-int v4, v0, v2

    sub-int v5, v1, v2

    invoke-virtual {v3, v4, v5}, Lcom/mikepenz/fastadapter/FastAdapter;->notifyAdapterItemRangeInserted(II)V

    .line 193
    :goto_53
    return-void

    .line 185
    :cond_54
    if-lez v1, :cond_6b

    if-ge v1, v2, :cond_6b

    .line 186
    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getFastAdapter()Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v3

    invoke-virtual {v3, v0, v1}, Lcom/mikepenz/fastadapter/FastAdapter;->notifyAdapterItemRangeChanged(II)V

    .line 187
    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getFastAdapter()Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v3

    add-int v4, v0, v1

    sub-int v5, v2, v1

    invoke-virtual {v3, v4, v5}, Lcom/mikepenz/fastadapter/FastAdapter;->notifyAdapterItemRangeRemoved(II)V

    goto :goto_53

    .line 188
    :cond_6b
    if-nez v1, :cond_75

    .line 189
    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getFastAdapter()Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v3

    invoke-virtual {v3, v0, v2}, Lcom/mikepenz/fastadapter/FastAdapter;->notifyAdapterItemRangeRemoved(II)V

    goto :goto_53

    .line 191
    :cond_75
    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getFastAdapter()Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mikepenz/fastadapter/FastAdapter;->notifyAdapterDataSetChanged()V

    goto :goto_53
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
    .line 201
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>;"
    .local p1, "items":Ljava/util/List;, "Ljava/util/List<TItem;>;"
    iget-boolean v0, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mUseIdDistributor:Z

    if-eqz v0, :cond_7

    .line 202
    invoke-static {p1}, Lcom/mikepenz/fastadapter/utils/IdDistributor;->checkIds(Ljava/util/List;)Ljava/util/List;

    .line 204
    :cond_7
    iput-object p1, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItems:Ljava/util/List;

    .line 205
    invoke-virtual {p0, p1}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mapPossibleTypes(Ljava/lang/Iterable;)V

    .line 206
    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getFastAdapter()Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mikepenz/fastadapter/FastAdapter;->notifyAdapterDataSetChanged()V

    .line 207
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
    .line 140
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>;"
    .local p1, "collapsible":Lcom/mikepenz/fastadapter/IExpandable;, "Lcom/mikepenz/fastadapter/IExpandable<TT;TItem;>;"
    .local p2, "subItems":Ljava/util/List;, "Ljava/util/List<TItem;>;"
    iget-boolean v0, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mUseIdDistributor:Z

    if-eqz v0, :cond_7

    .line 141
    invoke-static {p2}, Lcom/mikepenz/fastadapter/utils/IdDistributor;->checkIds(Ljava/util/List;)Ljava/util/List;

    .line 143
    :cond_7
    invoke-interface {p1, p2}, Lcom/mikepenz/fastadapter/IExpandable;->withSubItems(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public withFilterPredicate(Lcom/mikepenz/fastadapter/IItemAdapter$Predicate;)Lcom/mikepenz/fastadapter/adapters/ItemAdapter;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mikepenz/fastadapter/IItemAdapter$Predicate",
            "<TItem;>;)",
            "Lcom/mikepenz/fastadapter/adapters/ItemAdapter",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 59
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>;"
    .local p1, "filterPredicate":Lcom/mikepenz/fastadapter/IItemAdapter$Predicate;, "Lcom/mikepenz/fastadapter/IItemAdapter$Predicate<TItem;>;"
    iput-object p1, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mFilterPredicate:Lcom/mikepenz/fastadapter/IItemAdapter$Predicate;

    .line 60
    return-object p0
.end method

.method public withUseIdDistributor(Z)Lcom/mikepenz/fastadapter/adapters/ItemAdapter;
    .registers 2
    .param p1, "useIdDistributor"    # Z

    .prologue
    .line 35
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>;"
    iput-boolean p1, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mUseIdDistributor:Z

    .line 36
    return-object p0
.end method
