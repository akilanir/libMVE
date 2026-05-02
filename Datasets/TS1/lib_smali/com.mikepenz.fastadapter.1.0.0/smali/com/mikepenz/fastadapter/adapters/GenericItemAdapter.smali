.class public Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;
.super Lcom/mikepenz/fastadapter/adapters/ItemAdapter;
.source "GenericItemAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter$ReflectionBasedItemFactory;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Model:",
        "Ljava/lang/Object;",
        "Item:",
        "Lcom/mikepenz/fastadapter/items/GenericAbstractItem",
        "<TModel;TItem;*>;>",
        "Lcom/mikepenz/fastadapter/adapters/ItemAdapter",
        "<TItem;>;"
    }
.end annotation


# instance fields
.field private final mItemFactory:Lcom/mikepenz/fastadapter/utils/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/mikepenz/fastadapter/utils/Function",
            "<TModel;TItem;>;"
        }
    .end annotation
.end field

.field private mItems:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<TModel;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/mikepenz/fastadapter/utils/Function;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mikepenz/fastadapter/utils/Function",
            "<TModel;TItem;>;)V"
        }
    .end annotation

    .prologue
    .line 32
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter<TModel;TItem;>;"
    .local p1, "itemFactory":Lcom/mikepenz/fastadapter/utils/Function;, "Lcom/mikepenz/fastadapter/utils/Function<TModel;TItem;>;"
    invoke-direct {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;-><init>()V

    .line 19
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;->mItems:Ljava/util/List;

    .line 33
    iput-object p1, p0, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;->mItemFactory:Lcom/mikepenz/fastadapter/utils/Function;

    .line 34
    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;Ljava/lang/Class;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+TItem;>;",
            "Ljava/lang/Class",
            "<+TModel;>;)V"
        }
    .end annotation

    .prologue
    .line 26
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter<TModel;TItem;>;"
    .local p1, "itemClass":Ljava/lang/Class;, "Ljava/lang/Class<+TItem;>;"
    .local p2, "modelClass":Ljava/lang/Class;, "Ljava/lang/Class<+TModel;>;"
    new-instance v0, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter$ReflectionBasedItemFactory;

    invoke-direct {v0, p2, p1}, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter$ReflectionBasedItemFactory;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    invoke-direct {p0, v0}, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;-><init>(Lcom/mikepenz/fastadapter/utils/Function;)V

    .line 27
    return-void
.end method


# virtual methods
.method public addModel(ILjava/util/List;)V
    .registers 6
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List",
            "<TModel;>;)V"
        }
    .end annotation

    .prologue
    .line 94
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter<TModel;TItem;>;"
    .local p2, "models":Ljava/util/List;, "Ljava/util/List<TModel;>;"
    invoke-virtual {p0, p2}, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;->toItems(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    invoke-super {p0, p1, v0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->add(ILjava/util/List;)V

    .line 95
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;->mItems:Ljava/util/List;

    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;->getFastAdapter()Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v1

    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;->getOrder()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/mikepenz/fastadapter/FastAdapter;->getItemCount(I)I

    move-result v1

    sub-int v1, p1, v1

    invoke-interface {v0, v1, p2}, Ljava/util/List;->addAll(ILjava/util/Collection;)Z

    .line 96
    return-void
.end method

.method public final varargs addModel(I[Ljava/lang/Object;)V
    .registers 4
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I[TModel;)V"
        }
    .end annotation

    .annotation runtime Ljava/lang/SafeVarargs;
    .end annotation

    .prologue
    .line 84
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter<TModel;TItem;>;"
    .local p2, "models":[Ljava/lang/Object;, "[TModel;"
    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;->addModel(ILjava/util/List;)V

    .line 85
    return-void
.end method

.method public addModel(Ljava/util/List;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<TModel;>;)V"
        }
    .end annotation

    .prologue
    .line 72
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter<TModel;TItem;>;"
    .local p1, "models":Ljava/util/List;, "Ljava/util/List<TModel;>;"
    invoke-virtual {p0, p1}, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;->toItems(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    invoke-super {p0, v0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->add(Ljava/util/List;)V

    .line 73
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;->mItems:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 74
    return-void
.end method

.method public final varargs addModel([Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TModel;)V"
        }
    .end annotation

    .annotation runtime Ljava/lang/SafeVarargs;
    .end annotation

    .prologue
    .line 63
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter<TModel;TItem;>;"
    .local p1, "models":[Ljava/lang/Object;, "[TModel;"
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;->addModel(Ljava/util/List;)V

    .line 64
    return-void
.end method

.method public clearModel()V
    .registers 2

    .prologue
    .line 113
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter<TModel;TItem;>;"
    invoke-super {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->clear()V

    .line 114
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;->mItems:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 115
    return-void
.end method

.method public removeModel(I)V
    .registers 5
    .param p1, "position"    # I

    .prologue
    .line 142
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter<TModel;TItem;>;"
    invoke-super {p0, p1}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->remove(I)V

    .line 143
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;->mItems:Ljava/util/List;

    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;->getFastAdapter()Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v1

    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;->getOrder()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/mikepenz/fastadapter/FastAdapter;->getItemCount(I)I

    move-result v1

    sub-int v1, p1, v1

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 144
    return-void
.end method

.method public removeModelRange(II)V
    .registers 9
    .param p1, "position"    # I
    .param p2, "itemCount"    # I

    .prologue
    .line 124
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter<TModel;TItem;>;"
    invoke-super {p0, p1, p2}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->removeRange(II)V

    .line 127
    iget-object v3, p0, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;->mItems:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v1

    .line 129
    .local v1, "length":I
    sub-int v3, v1, p1

    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;->getFastAdapter()Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v4

    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;->getOrder()I

    move-result v5

    invoke-virtual {v4, v5}, Lcom/mikepenz/fastadapter/FastAdapter;->getItemCount(I)I

    move-result v4

    add-int/2addr v3, v4

    invoke-static {p2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 131
    .local v2, "saveItemCount":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1d
    if-ge v0, v2, :cond_35

    .line 132
    iget-object v3, p0, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;->mItems:Ljava/util/List;

    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;->getFastAdapter()Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v4

    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;->getOrder()I

    move-result v5

    invoke-virtual {v4, v5}, Lcom/mikepenz/fastadapter/FastAdapter;->getItemCount(I)I

    move-result v4

    sub-int v4, p1, v4

    invoke-interface {v3, v4}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 131
    add-int/lit8 v0, v0, 0x1

    goto :goto_1d

    .line 134
    :cond_35
    return-void
.end method

.method public setModel(ILjava/lang/Object;)V
    .registers 6
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITModel;)V"
        }
    .end annotation

    .prologue
    .line 105
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter<TModel;TItem;>;"
    .local p2, "model":Ljava/lang/Object;, "TModel;"
    invoke-virtual {p0, p2}, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;->toItem(Ljava/lang/Object;)Lcom/mikepenz/fastadapter/items/GenericAbstractItem;

    move-result-object v0

    invoke-super {p0, p1, v0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->set(ILcom/mikepenz/fastadapter/IItem;)V

    .line 106
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;->mItems:Ljava/util/List;

    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;->getFastAdapter()Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v1

    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;->getOrder()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/mikepenz/fastadapter/FastAdapter;->getItemCount(I)I

    move-result v1

    sub-int v1, p1, v1

    invoke-interface {v0, v1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 107
    return-void
.end method

.method public setModel(Ljava/util/List;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<TModel;>;)V"
        }
    .end annotation

    .prologue
    .line 42
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter<TModel;TItem;>;"
    .local p1, "models":Ljava/util/List;, "Ljava/util/List<TModel;>;"
    invoke-virtual {p0, p1}, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;->toItems(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    invoke-super {p0, v0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->set(Ljava/util/List;)V

    .line 43
    iput-object p1, p0, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;->mItems:Ljava/util/List;

    .line 44
    return-void
.end method

.method public setNewModel(Ljava/util/List;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<TModel;>;)V"
        }
    .end annotation

    .prologue
    .line 52
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter<TModel;TItem;>;"
    .local p1, "models":Ljava/util/List;, "Ljava/util/List<TModel;>;"
    invoke-virtual {p0, p1}, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;->toItems(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    invoke-super {p0, v0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->setNewList(Ljava/util/List;)V

    .line 53
    iput-object p1, p0, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;->mItems:Ljava/util/List;

    .line 54
    return-void
.end method

.method protected toItem(Ljava/lang/Object;)Lcom/mikepenz/fastadapter/items/GenericAbstractItem;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TModel;)TItem;"
        }
    .end annotation

    .prologue
    .line 169
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter<TModel;TItem;>;"
    .local p1, "model":Ljava/lang/Object;, "TModel;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;->mItemFactory:Lcom/mikepenz/fastadapter/utils/Function;

    invoke-interface {v0, p1}, Lcom/mikepenz/fastadapter/utils/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/fastadapter/items/GenericAbstractItem;

    return-object v0
.end method

.method protected toItems(Ljava/util/List;)Ljava/util/List;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<TModel;>;)",
            "Ljava/util/List",
            "<TItem;>;"
        }
    .end annotation

    .prologue
    .line 153
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter<TModel;TItem;>;"
    .local p1, "models":Ljava/util/List;, "Ljava/util/List<TModel;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 154
    .local v0, "items":Ljava/util/List;, "Ljava/util/List<TItem;>;"
    if-eqz p1, :cond_1d

    .line 155
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_b
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1d

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 156
    .local v1, "model":Ljava/lang/Object;, "TModel;"
    invoke-virtual {p0, v1}, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;->toItem(Ljava/lang/Object;)Lcom/mikepenz/fastadapter/items/GenericAbstractItem;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_b

    .line 159
    .end local v1    # "model":Ljava/lang/Object;, "TModel;"
    :cond_1d
    return-object v0
.end method
