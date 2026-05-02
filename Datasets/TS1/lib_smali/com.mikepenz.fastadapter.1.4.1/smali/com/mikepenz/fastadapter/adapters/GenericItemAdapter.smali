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


# direct methods
.method public constructor <init>(Lcom/mikepenz/fastadapter/utils/Function;)V
    .registers 2
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
.method public addModel(ILjava/util/List;)Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;
    .registers 4
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List",
            "<TModel;>;)",
            "Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter",
            "<TModel;TItem;>;"
        }
    .end annotation

    .prologue
    .line 109
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter<TModel;TItem;>;"
    .local p2, "models":Ljava/util/List;, "Ljava/util/List<TModel;>;"
    invoke-virtual {p0, p2}, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;->toItems(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    invoke-super {p0, p1, v0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->add(ILjava/util/List;)Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    .line 110
    return-object p0
.end method

.method public final varargs addModel(I[Ljava/lang/Object;)Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;
    .registers 4
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I[TModel;)",
            "Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter",
            "<TModel;TItem;>;"
        }
    .end annotation

    .annotation runtime Ljava/lang/SafeVarargs;
    .end annotation

    .prologue
    .line 98
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter<TModel;TItem;>;"
    .local p2, "models":[Ljava/lang/Object;, "[TModel;"
    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;->addModel(ILjava/util/List;)Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;

    .line 99
    return-object p0
.end method

.method public addModel(Ljava/util/List;)Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<TModel;>;)",
            "Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter",
            "<TModel;TItem;>;"
        }
    .end annotation

    .prologue
    .line 86
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter<TModel;TItem;>;"
    .local p1, "models":Ljava/util/List;, "Ljava/util/List<TModel;>;"
    invoke-virtual {p0, p1}, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;->toItems(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    invoke-super {p0, v0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->add(Ljava/util/List;)Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    .line 87
    return-object p0
.end method

.method public final varargs addModel([Ljava/lang/Object;)Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TModel;)",
            "Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter",
            "<TModel;TItem;>;"
        }
    .end annotation

    .annotation runtime Ljava/lang/SafeVarargs;
    .end annotation

    .prologue
    .line 76
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter<TModel;TItem;>;"
    .local p1, "models":[Ljava/lang/Object;, "[TModel;"
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;->addModel(Ljava/util/List;)Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;

    .line 77
    return-object p0
.end method

.method public clearModel()Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter",
            "<TModel;TItem;>;"
        }
    .end annotation

    .prologue
    .line 128
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter<TModel;TItem;>;"
    invoke-super {p0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->clear()Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    .line 129
    return-object p0
.end method

.method public getModels()Ljava/util/List;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<TModel;>;"
        }
    .end annotation

    .prologue
    .line 42
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter<TModel;TItem;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 43
    .local v1, "models":Ljava/util/List;, "Ljava/util/List<TModel;>;"
    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;->getAdapterItems()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_21

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/fastadapter/items/GenericAbstractItem;

    .line 44
    .local v0, "item":Lcom/mikepenz/fastadapter/items/GenericAbstractItem;, "TItem;"
    invoke-virtual {v0}, Lcom/mikepenz/fastadapter/items/GenericAbstractItem;->getModel()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_d

    .line 46
    .end local v0    # "item":Lcom/mikepenz/fastadapter/items/GenericAbstractItem;, "TItem;"
    :cond_21
    return-object v1
.end method

.method public moveModel(II)Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;
    .registers 3
    .param p1, "fromPosition"    # I
    .param p2, "toPosition"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter",
            "<TModel;TItem;>;"
        }
    .end annotation

    .prologue
    .line 140
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter<TModel;TItem;>;"
    invoke-super {p0, p1, p2}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->move(II)Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    .line 141
    return-object p0
.end method

.method public removeModel(I)Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;
    .registers 2
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter",
            "<TModel;TItem;>;"
        }
    .end annotation

    .prologue
    .line 162
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter<TModel;TItem;>;"
    invoke-super {p0, p1}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->remove(I)Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    .line 163
    return-object p0
.end method

.method public removeModelRange(II)Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;
    .registers 3
    .param p1, "position"    # I
    .param p2, "itemCount"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter",
            "<TModel;TItem;>;"
        }
    .end annotation

    .prologue
    .line 152
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter<TModel;TItem;>;"
    invoke-super {p0, p1, p2}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->removeRange(II)Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    .line 153
    return-object p0
.end method

.method public setModel(ILjava/lang/Object;)Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;
    .registers 4
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITModel;)",
            "Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter",
            "<TModel;TItem;>;"
        }
    .end annotation

    .prologue
    .line 120
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter<TModel;TItem;>;"
    .local p2, "model":Ljava/lang/Object;, "TModel;"
    invoke-virtual {p0, p2}, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;->toItem(Ljava/lang/Object;)Lcom/mikepenz/fastadapter/items/GenericAbstractItem;

    move-result-object v0

    invoke-super {p0, p1, v0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->set(ILcom/mikepenz/fastadapter/IItem;)Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    .line 121
    return-object p0
.end method

.method public setModel(Ljava/util/List;)Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<TModel;>;)",
            "Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter",
            "<TModel;TItem;>;"
        }
    .end annotation

    .prologue
    .line 55
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter<TModel;TItem;>;"
    .local p1, "models":Ljava/util/List;, "Ljava/util/List<TModel;>;"
    invoke-virtual {p0, p1}, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;->toItems(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    invoke-super {p0, v0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->set(Ljava/util/List;)Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    .line 56
    return-object p0
.end method

.method public setNewModel(Ljava/util/List;)Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<TModel;>;)",
            "Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter",
            "<TModel;TItem;>;"
        }
    .end annotation

    .prologue
    .line 65
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter<TModel;TItem;>;"
    .local p1, "models":Ljava/util/List;, "Ljava/util/List<TModel;>;"
    invoke-virtual {p0, p1}, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;->toItems(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    invoke-super {p0, v0}, Lcom/mikepenz/fastadapter/adapters/ItemAdapter;->setNewList(Ljava/util/List;)Lcom/mikepenz/fastadapter/adapters/ItemAdapter;

    .line 66
    return-object p0
.end method

.method protected toItem(Ljava/lang/Object;)Lcom/mikepenz/fastadapter/items/GenericAbstractItem;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TModel;)TItem;"
        }
    .end annotation

    .prologue
    .line 191
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
    .line 173
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter<TModel;TItem;>;"
    .local p1, "models":Ljava/util/List;, "Ljava/util/List<TModel;>;"
    if-nez p1, :cond_7

    .line 174
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    .line 181
    :cond_6
    return-object v0

    .line 177
    :cond_7
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 178
    .local v0, "items":Ljava/util/List;, "Ljava/util/List<TItem;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_14
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_6

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 179
    .local v1, "model":Ljava/lang/Object;, "TModel;"
    invoke-virtual {p0, v1}, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;->toItem(Ljava/lang/Object;)Lcom/mikepenz/fastadapter/items/GenericAbstractItem;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_14
.end method
