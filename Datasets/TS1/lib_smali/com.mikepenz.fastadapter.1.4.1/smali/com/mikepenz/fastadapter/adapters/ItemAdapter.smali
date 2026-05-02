.class public Lcom/mikepenz/fastadapter/adapters/ItemAdapter;
.super Lcom/mikepenz/fastadapter/AbstractAdapter;
.source "ItemAdapter.java"

# interfaces
.implements Lcom/mikepenz/fastadapter/IItemAdapter;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilter;,
        Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilterListener;
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
.field protected mComparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<TItem;>;"
        }
    .end annotation
.end field

.field private mFilterPredicate:Lcom/mikepenz/fastadapter/IItemAdapter$Predicate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/mikepenz/fastadapter/IItemAdapter$Predicate",
            "<TItem;>;"
        }
    .end annotation
.end field

.field private final mItemFilter:Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/mikepenz/fastadapter/adapters/ItemAdapter",
            "<TItem;>.ItemFilter;"
        }
    .end annotation
.end field

.field protected mItemFilterListener:Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilterListener;

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
    .line 23
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>;"
    invoke-direct {p0}, Lcom/mikepenz/fastadapter/AbstractAdapter;-><init>()V

    .line 25
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItems:Ljava/util/List;

    .line 28
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mUseIdDistributor:Z

    .line 42
    new-instance v0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilter;

    invoke-direct {v0, p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilter;-><init>(Lcom/mikepenz/fastadapter/adapters/ItemAdapter;)V

    iput-object v0, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItemFilter:Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilter;

    .line 429
    return-void
.end method

.method static synthetic access$000(Lcom/mikepenz/fastadapter/adapters/ItemAdapter;)Ljava/util/List;
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    .prologue
    .line 23
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItems:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$100(Lcom/mikepenz/fastadapter/adapters/ItemAdapter;)Lcom/mikepenz/fastadapter/IItemAdapter$Predicate;
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    .prologue
    .line 23
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mFilterPredicate:Lcom/mikepenz/fastadapter/IItemAdapter$Predicate;

    return-object v0
.end method


# virtual methods
.method public bridge synthetic add(ILjava/util/List;)Lcom/mikepenz/fastadapter/IItemAdapter;
    .registers 4

    .prologue
    .line 23
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>;"
    invoke-virtual {p0, p1, p2}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->add(ILjava/util/List;)Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic add(I[Lcom/mikepenz/fastadapter/IItem;)Lcom/mikepenz/fastadapter/IItemAdapter;
    .registers 4
    .annotation runtime Ljava/lang/SafeVarargs;
    .end annotation

    .prologue
    .line 23
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>;"
    invoke-virtual {p0, p1, p2}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->add(I[Lcom/mikepenz/fastadapter/IItem;)Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic add(Ljava/util/List;)Lcom/mikepenz/fastadapter/IItemAdapter;
    .registers 3

    .prologue
    .line 23
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>;"
    invoke-virtual {p0, p1}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->add(Ljava/util/List;)Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic add([Lcom/mikepenz/fastadapter/IItem;)Lcom/mikepenz/fastadapter/IItemAdapter;
    .registers 3
    .annotation runtime Ljava/lang/SafeVarargs;
    .end annotation

    .prologue
    .line 23
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>;"
    invoke-virtual {p0, p1}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->add([Lcom/mikepenz/fastadapter/IItem;)Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    move-result-object v0

    return-object v0
.end method

.method public add(ILjava/util/List;)Lcom/mikepenz/fastadapter/adapters/ItemAdapter;
    .registers 5
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List",
            "<TItem;>;)",
            "Lcom/mikepenz/fastadapter/adapters/ItemAdapter",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 338
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>;"
    .local p2, "items":Ljava/util/List;, "Ljava/util/List<TItem;>;"
    iget-boolean v0, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mUseIdDistributor:Z

    if-eqz v0, :cond_7

    .line 339
    invoke-static {p2}, Lcom/mikepenz/fastadapter/utils/IdDistributor;->checkIds(Ljava/util/List;)Ljava/util/List;

    .line 341
    :cond_7
    if-eqz p2, :cond_26

    .line 342
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItems:Ljava/util/List;

    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getFastAdapter()Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/mikepenz/fastadapter/FastAdapter;->getPreItemCount(I)I

    move-result v1

    sub-int v1, p1, v1

    invoke-interface {v0, v1, p2}, Ljava/util/List;->addAll(ILjava/util/Collection;)Z

    .line 343
    invoke-virtual {p0, p2}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mapPossibleTypes(Ljava/lang/Iterable;)V

    .line 345
    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getFastAdapter()Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v0

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {v0, p1, v1}, Lcom/mikepenz/fastadapter/FastAdapter;->notifyAdapterItemRangeInserted(II)V

    .line 347
    :cond_26
    return-object p0
.end method

.method public final varargs add(I[Lcom/mikepenz/fastadapter/IItem;)Lcom/mikepenz/fastadapter/adapters/ItemAdapter;
    .registers 4
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I[TItem;)",
            "Lcom/mikepenz/fastadapter/adapters/ItemAdapter",
            "<TItem;>;"
        }
    .end annotation

    .annotation runtime Ljava/lang/SafeVarargs;
    .end annotation

    .prologue
    .line 328
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>;"
    .local p2, "items":[Lcom/mikepenz/fastadapter/IItem;, "[TItem;"
    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->add(ILjava/util/List;)Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    move-result-object v0

    return-object v0
.end method

.method public add(Ljava/util/List;)Lcom/mikepenz/fastadapter/adapters/ItemAdapter;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<TItem;>;)",
            "Lcom/mikepenz/fastadapter/adapters/ItemAdapter",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 304
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>;"
    .local p1, "items":Ljava/util/List;, "Ljava/util/List<TItem;>;"
    iget-boolean v1, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mUseIdDistributor:Z

    if-eqz v1, :cond_7

    .line 305
    invoke-static {p1}, Lcom/mikepenz/fastadapter/utils/IdDistributor;->checkIds(Ljava/util/List;)Ljava/util/List;

    .line 307
    :cond_7
    iget-object v1, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItems:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v0

    .line 308
    .local v0, "countBefore":I
    iget-object v1, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItems:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 309
    invoke-virtual {p0, p1}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mapPossibleTypes(Ljava/lang/Iterable;)V

    .line 311
    iget-object v1, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mComparator:Ljava/util/Comparator;

    if-nez v1, :cond_32

    .line 312
    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getFastAdapter()Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v1

    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getFastAdapter()Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v2

    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getOrder()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/mikepenz/fastadapter/FastAdapter;->getPreItemCountByOrder(I)I

    move-result v2

    add-int/2addr v2, v0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    invoke-virtual {v1, v2, v3}, Lcom/mikepenz/fastadapter/FastAdapter;->notifyAdapterItemRangeInserted(II)V

    .line 317
    :goto_31
    return-object p0

    .line 314
    :cond_32
    iget-object v1, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItems:Ljava/util/List;

    iget-object v2, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mComparator:Ljava/util/Comparator;

    invoke-static {v1, v2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 315
    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getFastAdapter()Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mikepenz/fastadapter/FastAdapter;->notifyAdapterDataSetChanged()V

    goto :goto_31
.end method

.method public final varargs add([Lcom/mikepenz/fastadapter/IItem;)Lcom/mikepenz/fastadapter/adapters/ItemAdapter;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TItem;)",
            "Lcom/mikepenz/fastadapter/adapters/ItemAdapter",
            "<TItem;>;"
        }
    .end annotation

    .annotation runtime Ljava/lang/SafeVarargs;
    .end annotation

    .prologue
    .line 295
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>;"
    .local p1, "items":[Lcom/mikepenz/fastadapter/IItem;, "[TItem;"
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->add(Ljava/util/List;)Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/mikepenz/fastadapter/IItemAdapter;
    .registers 2

    .prologue
    .line 23
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>;"
    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->clear()Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    move-result-object v0

    return-object v0
.end method

.method public clear()Lcom/mikepenz/fastadapter/adapters/ItemAdapter;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/mikepenz/fastadapter/adapters/ItemAdapter",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 419
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>;"
    iget-object v1, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItems:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v0

    .line 420
    .local v0, "count":I
    iget-object v1, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItems:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 421
    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getFastAdapter()Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v1

    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getFastAdapter()Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v2

    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getOrder()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/mikepenz/fastadapter/FastAdapter;->getPreItemCountByOrder(I)I

    move-result v2

    invoke-virtual {v1, v2, v0}, Lcom/mikepenz/fastadapter/FastAdapter;->notifyAdapterItemRangeRemoved(II)V

    .line 422
    return-object p0
.end method

.method public filter(Ljava/lang/CharSequence;)V
    .registers 3
    .param p1, "constraint"    # Ljava/lang/CharSequence;

    .prologue
    .line 71
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItemFilter:Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilter;

    invoke-virtual {v0, p1}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilter;->filter(Ljava/lang/CharSequence;)V

    .line 72
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
    .line 192
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
    .line 148
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
    .line 156
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItems:Ljava/util/List;

    return-object v0
.end method

.method public getAdapterPosition(Lcom/mikepenz/fastadapter/IItem;)I
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TItem;)I"
        }
    .end annotation

    .prologue
    .line 167
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>;"
    .local p1, "item":Lcom/mikepenz/fastadapter/IItem;, "TItem;"
    iget-object v2, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItems:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v1

    .line 168
    .local v1, "length":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_7
    if-ge v0, v1, :cond_21

    .line 169
    iget-object v2, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItems:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mikepenz/fastadapter/IItem;

    invoke-interface {v2}, Lcom/mikepenz/fastadapter/IItem;->getIdentifier()J

    move-result-wide v2

    invoke-interface {p1}, Lcom/mikepenz/fastadapter/IItem;->getIdentifier()J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-nez v2, :cond_1e

    .line 173
    .end local v0    # "i":I
    :goto_1d
    return v0

    .line 168
    .restart local v0    # "i":I
    :cond_1e
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 173
    :cond_21
    const/4 v0, -0x1

    goto :goto_1d
.end method

.method public getComparator()Ljava/util/Comparator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Comparator",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 132
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mComparator:Ljava/util/Comparator;

    return-object v0
.end method

.method public getGlobalPosition(I)I
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 183
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>;"
    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getFastAdapter()Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v0

    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getOrder()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/mikepenz/fastadapter/FastAdapter;->getPreItemCountByOrder(I)I

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
    .line 48
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItemFilter:Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilter;

    return-object v0
.end method

.method public getOrder()I
    .registers 2

    .prologue
    .line 140
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>;"
    const/16 v0, 0x1f4

    return v0
.end method

.method public move(II)Lcom/mikepenz/fastadapter/adapters/ItemAdapter;
    .registers 7
    .param p1, "fromPosition"    # I
    .param p2, "toPosition"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Lcom/mikepenz/fastadapter/adapters/ItemAdapter",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 375
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>;"
    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getFastAdapter()Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/mikepenz/fastadapter/FastAdapter;->getPreItemCount(I)I

    move-result v1

    .line 376
    .local v1, "preItemCount":I
    iget-object v2, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItems:Ljava/util/List;

    sub-int v3, p1, v1

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/fastadapter/IItem;

    .line 377
    .local v0, "item":Lcom/mikepenz/fastadapter/IItem;, "TItem;"
    iget-object v2, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItems:Ljava/util/List;

    sub-int v3, p1, v1

    invoke-interface {v2, v3}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 378
    iget-object v2, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItems:Ljava/util/List;

    sub-int v3, p2, v1

    invoke-interface {v2, v3, v0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 379
    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getFastAdapter()Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v2

    invoke-virtual {v2, p1, p2}, Lcom/mikepenz/fastadapter/FastAdapter;->notifyAdapterItemMoved(II)V

    .line 380
    return-object p0
.end method

.method public bridge synthetic remove(I)Lcom/mikepenz/fastadapter/IItemAdapter;
    .registers 3

    .prologue
    .line 23
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>;"
    invoke-virtual {p0, p1}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->remove(I)Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    move-result-object v0

    return-object v0
.end method

.method public remove(I)Lcom/mikepenz/fastadapter/adapters/ItemAdapter;
    .registers 4
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/mikepenz/fastadapter/adapters/ItemAdapter",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 389
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItems:Ljava/util/List;

    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getFastAdapter()Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/mikepenz/fastadapter/FastAdapter;->getPreItemCount(I)I

    move-result v1

    sub-int v1, p1, v1

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 390
    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getFastAdapter()Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/mikepenz/fastadapter/FastAdapter;->notifyAdapterItemRemoved(I)V

    .line 391
    return-object p0
.end method

.method public bridge synthetic removeRange(II)Lcom/mikepenz/fastadapter/IItemAdapter;
    .registers 4

    .prologue
    .line 23
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>;"
    invoke-virtual {p0, p1, p2}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->removeRange(II)Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    move-result-object v0

    return-object v0
.end method

.method public removeRange(II)Lcom/mikepenz/fastadapter/adapters/ItemAdapter;
    .registers 9
    .param p1, "position"    # I
    .param p2, "itemCount"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Lcom/mikepenz/fastadapter/adapters/ItemAdapter",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 402
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>;"
    iget-object v4, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItems:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v1

    .line 403
    .local v1, "length":I
    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getFastAdapter()Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v4

    invoke-virtual {v4, p1}, Lcom/mikepenz/fastadapter/FastAdapter;->getPreItemCount(I)I

    move-result v2

    .line 405
    .local v2, "preItemCount":I
    sub-int v4, v1, p1

    add-int/2addr v4, v2

    invoke-static {p2, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 407
    .local v3, "saveItemCount":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_16
    if-ge v0, v3, :cond_22

    .line 408
    iget-object v4, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItems:Ljava/util/List;

    sub-int v5, p1, v2

    invoke-interface {v4, v5}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 407
    add-int/lit8 v0, v0, 0x1

    goto :goto_16

    .line 411
    :cond_22
    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getFastAdapter()Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v4

    invoke-virtual {v4, p1, v3}, Lcom/mikepenz/fastadapter/FastAdapter;->notifyAdapterItemRangeRemoved(II)V

    .line 412
    return-object p0
.end method

.method public bridge synthetic set(ILcom/mikepenz/fastadapter/IItem;)Lcom/mikepenz/fastadapter/IItemAdapter;
    .registers 4

    .prologue
    .line 23
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>;"
    invoke-virtual {p0, p1, p2}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->set(ILcom/mikepenz/fastadapter/IItem;)Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic set(Ljava/util/List;)Lcom/mikepenz/fastadapter/IItemAdapter;
    .registers 3

    .prologue
    .line 23
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>;"
    invoke-virtual {p0, p1}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->set(Ljava/util/List;)Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    move-result-object v0

    return-object v0
.end method

.method public set(ILcom/mikepenz/fastadapter/IItem;)Lcom/mikepenz/fastadapter/adapters/ItemAdapter;
    .registers 5
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITItem;)",
            "Lcom/mikepenz/fastadapter/adapters/ItemAdapter",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 357
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>;"
    .local p2, "item":Lcom/mikepenz/fastadapter/IItem;, "TItem;"
    iget-boolean v0, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mUseIdDistributor:Z

    if-eqz v0, :cond_7

    .line 358
    invoke-static {p2}, Lcom/mikepenz/fastadapter/utils/IdDistributor;->checkId(Lcom/mikepenz/fastadapter/IIdentifyable;)Lcom/mikepenz/fastadapter/IIdentifyable;

    .line 360
    :cond_7
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItems:Ljava/util/List;

    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getFastAdapter()Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/mikepenz/fastadapter/FastAdapter;->getPreItemCount(I)I

    move-result v1

    sub-int v1, p1, v1

    invoke-interface {v0, v1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 361
    invoke-virtual {p0, p2}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mapPossibleType(Lcom/mikepenz/fastadapter/IItem;)V

    .line 363
    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getFastAdapter()Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/mikepenz/fastadapter/FastAdapter;->notifyAdapterItemChanged(I)V

    .line 364
    return-object p0
.end method

.method public set(Ljava/util/List;)Lcom/mikepenz/fastadapter/adapters/ItemAdapter;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<TItem;>;)",
            "Lcom/mikepenz/fastadapter/adapters/ItemAdapter",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 218
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>;"
    .local p1, "items":Ljava/util/List;, "Ljava/util/List<TItem;>;"
    iget-boolean v3, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mUseIdDistributor:Z

    if-eqz v3, :cond_7

    .line 219
    invoke-static {p1}, Lcom/mikepenz/fastadapter/utils/IdDistributor;->checkIds(Ljava/util/List;)Ljava/util/List;

    .line 223
    :cond_7
    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getFastAdapter()Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/mikepenz/fastadapter/FastAdapter;->collapse(Z)V

    .line 226
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    .line 227
    .local v1, "newItemsCount":I
    iget-object v3, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItems:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v2

    .line 228
    .local v2, "previousItemsCount":I
    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getFastAdapter()Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v3

    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getOrder()I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/mikepenz/fastadapter/FastAdapter;->getPreItemCountByOrder(I)I

    move-result v0

    .line 231
    .local v0, "itemsBeforeThisAdapter":I
    iget-object v3, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItems:Ljava/util/List;

    if-eq p1, v3, :cond_3b

    .line 233
    iget-object v3, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItems:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_36

    .line 234
    iget-object v3, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItems:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->clear()V

    .line 238
    :cond_36
    iget-object v3, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItems:Ljava/util/List;

    invoke-interface {v3, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 242
    :cond_3b
    invoke-virtual {p0, p1}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mapPossibleTypes(Ljava/lang/Iterable;)V

    .line 245
    iget-object v3, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mComparator:Ljava/util/Comparator;

    if-eqz v3, :cond_49

    .line 246
    iget-object v3, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItems:Ljava/util/List;

    iget-object v4, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mComparator:Ljava/util/Comparator;

    invoke-static {v3, v4}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 250
    :cond_49
    if-le v1, v2, :cond_60

    .line 251
    if-lez v2, :cond_54

    .line 252
    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getFastAdapter()Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v3

    invoke-virtual {v3, v0, v2}, Lcom/mikepenz/fastadapter/FastAdapter;->notifyAdapterItemRangeChanged(II)V

    .line 254
    :cond_54
    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getFastAdapter()Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v3

    add-int v4, v0, v2

    sub-int v5, v1, v2

    invoke-virtual {v3, v4, v5}, Lcom/mikepenz/fastadapter/FastAdapter;->notifyAdapterItemRangeInserted(II)V

    .line 264
    :goto_5f
    return-object p0

    .line 255
    :cond_60
    if-lez v1, :cond_77

    if-ge v1, v2, :cond_77

    .line 256
    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getFastAdapter()Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v3

    invoke-virtual {v3, v0, v1}, Lcom/mikepenz/fastadapter/FastAdapter;->notifyAdapterItemRangeChanged(II)V

    .line 257
    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getFastAdapter()Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v3

    add-int v4, v0, v1

    sub-int v5, v2, v1

    invoke-virtual {v3, v4, v5}, Lcom/mikepenz/fastadapter/FastAdapter;->notifyAdapterItemRangeRemoved(II)V

    goto :goto_5f

    .line 258
    :cond_77
    if-nez v1, :cond_81

    .line 259
    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getFastAdapter()Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v3

    invoke-virtual {v3, v0, v2}, Lcom/mikepenz/fastadapter/FastAdapter;->notifyAdapterItemRangeRemoved(II)V

    goto :goto_5f

    .line 261
    :cond_81
    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getFastAdapter()Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mikepenz/fastadapter/FastAdapter;->notifyAdapterDataSetChanged()V

    goto :goto_5f
.end method

.method public bridge synthetic setNewList(Ljava/util/List;)Lcom/mikepenz/fastadapter/IItemAdapter;
    .registers 3

    .prologue
    .line 23
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>;"
    invoke-virtual {p0, p1}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->setNewList(Ljava/util/List;)Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    move-result-object v0

    return-object v0
.end method

.method public setNewList(Ljava/util/List;)Lcom/mikepenz/fastadapter/adapters/ItemAdapter;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<TItem;>;)",
            "Lcom/mikepenz/fastadapter/adapters/ItemAdapter",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 273
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>;"
    .local p1, "items":Ljava/util/List;, "Ljava/util/List<TItem;>;"
    iget-boolean v0, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mUseIdDistributor:Z

    if-eqz v0, :cond_7

    .line 274
    invoke-static {p1}, Lcom/mikepenz/fastadapter/utils/IdDistributor;->checkIds(Ljava/util/List;)Ljava/util/List;

    .line 276
    :cond_7
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItems:Ljava/util/List;

    .line 277
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItems:Ljava/util/List;

    invoke-virtual {p0, v0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mapPossibleTypes(Ljava/lang/Iterable;)V

    .line 279
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mComparator:Ljava/util/Comparator;

    if-eqz v0, :cond_1e

    .line 280
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItems:Ljava/util/List;

    iget-object v1, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mComparator:Ljava/util/Comparator;

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 283
    :cond_1e
    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getFastAdapter()Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mikepenz/fastadapter/FastAdapter;->notifyAdapterDataSetChanged()V

    .line 285
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
    .line 204
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>;"
    .local p1, "collapsible":Lcom/mikepenz/fastadapter/IExpandable;, "Lcom/mikepenz/fastadapter/IExpandable<TT;TItem;>;"
    .local p2, "subItems":Ljava/util/List;, "Ljava/util/List<TItem;>;"
    iget-boolean v0, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mUseIdDistributor:Z

    if-eqz v0, :cond_7

    .line 205
    invoke-static {p2}, Lcom/mikepenz/fastadapter/utils/IdDistributor;->checkIds(Ljava/util/List;)Ljava/util/List;

    .line 207
    :cond_7
    invoke-interface {p1, p2}, Lcom/mikepenz/fastadapter/IExpandable;->withSubItems(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public withComparator(Ljava/util/Comparator;)Lcom/mikepenz/fastadapter/adapters/ItemAdapter;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Comparator",
            "<TItem;>;)",
            "Lcom/mikepenz/fastadapter/adapters/ItemAdapter",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 104
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>;"
    .local p1, "comparator":Ljava/util/Comparator;, "Ljava/util/Comparator<TItem;>;"
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->withComparator(Ljava/util/Comparator;Z)Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    move-result-object v0

    return-object v0
.end method

.method public withComparator(Ljava/util/Comparator;Z)Lcom/mikepenz/fastadapter/adapters/ItemAdapter;
    .registers 5
    .param p2, "sortNow"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Comparator",
            "<TItem;>;Z)",
            "Lcom/mikepenz/fastadapter/adapters/ItemAdapter",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 116
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>;"
    .local p1, "comparator":Ljava/util/Comparator;, "Ljava/util/Comparator<TItem;>;"
    iput-object p1, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mComparator:Ljava/util/Comparator;

    .line 119
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItems:Ljava/util/List;

    if-eqz v0, :cond_1a

    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mComparator:Ljava/util/Comparator;

    if-eqz v0, :cond_1a

    if-eqz p2, :cond_1a

    .line 120
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItems:Ljava/util/List;

    iget-object v1, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mComparator:Ljava/util/Comparator;

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 121
    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->getFastAdapter()Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mikepenz/fastadapter/FastAdapter;->notifyAdapterDataSetChanged()V

    .line 124
    :cond_1a
    return-object p0
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
    .line 61
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>;"
    .local p1, "filterPredicate":Lcom/mikepenz/fastadapter/IItemAdapter$Predicate;, "Lcom/mikepenz/fastadapter/IItemAdapter$Predicate<TItem;>;"
    iput-object p1, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mFilterPredicate:Lcom/mikepenz/fastadapter/IItemAdapter$Predicate;

    .line 62
    return-object p0
.end method

.method public withItemFilterListener(Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilterListener;)Lcom/mikepenz/fastadapter/adapters/ItemAdapter;
    .registers 2
    .param p1, "listener"    # Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilterListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilterListener;",
            ")",
            "Lcom/mikepenz/fastadapter/adapters/ItemAdapter",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 79
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>;"
    iput-object p1, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mItemFilterListener:Lcom/mikepenz/fastadapter/adapters/ItemAdapter$ItemFilterListener;

    .line 80
    return-object p0
.end method

.method public withUseIdDistributor(Z)Lcom/mikepenz/fastadapter/adapters/ItemAdapter;
    .registers 2
    .param p1, "useIdDistributor"    # Z

    .prologue
    .line 37
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/ItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/ItemAdapter<TItem;>;"
    iput-boolean p1, p0, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->mUseIdDistributor:Z

    .line 38
    return-object p0
.end method
