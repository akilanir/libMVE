.class public Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter;
.super Lcom/mikepenz/fastadapter/FastAdapter;
.source "GenericFastItemAdapter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Model:",
        "Ljava/lang/Object;",
        "Item:",
        "Lcom/mikepenz/fastadapter/items/GenericAbstractItem",
        "<TModel;TItem;*>;>",
        "Lcom/mikepenz/fastadapter/FastAdapter",
        "<TItem;>;"
    }
.end annotation


# instance fields
.field private final mItemAdapter:Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter",
            "<TModel;TItem;>;"
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
    .line 28
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter<TModel;TItem;>;"
    .local p1, "itemFactory":Lcom/mikepenz/fastadapter/utils/Function;, "Lcom/mikepenz/fastadapter/utils/Function<TModel;TItem;>;"
    invoke-direct {p0}, Lcom/mikepenz/fastadapter/FastAdapter;-><init>()V

    .line 29
    new-instance v0, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;

    invoke-direct {v0, p1}, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;-><init>(Lcom/mikepenz/fastadapter/utils/Function;)V

    iput-object v0, p0, Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter;->mItemAdapter:Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;

    .line 30
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter;->mItemAdapter:Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;

    invoke-virtual {v0, p0}, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;->wrap(Lcom/mikepenz/fastadapter/FastAdapter;)Lcom/mikepenz/fastadapter/AbstractAdapter;

    .line 31
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
    .line 20
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter<TModel;TItem;>;"
    .local p1, "itemClass":Ljava/lang/Class;, "Ljava/lang/Class<+TItem;>;"
    .local p2, "modelClass":Ljava/lang/Class;, "Ljava/lang/Class<+TModel;>;"
    invoke-direct {p0}, Lcom/mikepenz/fastadapter/FastAdapter;-><init>()V

    .line 21
    new-instance v0, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;

    invoke-direct {v0, p1, p2}, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    iput-object v0, p0, Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter;->mItemAdapter:Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;

    .line 22
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter;->mItemAdapter:Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;

    invoke-virtual {v0, p0}, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;->wrap(Lcom/mikepenz/fastadapter/FastAdapter;)Lcom/mikepenz/fastadapter/AbstractAdapter;

    .line 23
    return-void
.end method


# virtual methods
.method public addModel(ILjava/util/List;)Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter;
    .registers 4
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List",
            "<TModel;>;)",
            "Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter",
            "<TModel;TItem;>;"
        }
    .end annotation

    .prologue
    .line 111
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter<TModel;TItem;>;"
    .local p2, "models":Ljava/util/List;, "Ljava/util/List<TModel;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter;->mItemAdapter:Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;

    invoke-virtual {v0, p1, p2}, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;->addModel(ILjava/util/List;)Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;

    .line 112
    return-object p0
.end method

.method public final varargs addModel(I[Ljava/lang/Object;)Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter;
    .registers 4
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I[TModel;)",
            "Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter",
            "<TModel;TItem;>;"
        }
    .end annotation

    .annotation runtime Ljava/lang/SafeVarargs;
    .end annotation

    .prologue
    .line 100
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter<TModel;TItem;>;"
    .local p2, "models":[Ljava/lang/Object;, "[TModel;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter;->mItemAdapter:Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;

    invoke-virtual {v0, p1, p2}, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;->addModel(I[Ljava/lang/Object;)Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;

    .line 101
    return-object p0
.end method

.method public addModel(Ljava/util/List;)Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<TModel;>;)",
            "Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter",
            "<TModel;TItem;>;"
        }
    .end annotation

    .prologue
    .line 88
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter<TModel;TItem;>;"
    .local p1, "models":Ljava/util/List;, "Ljava/util/List<TModel;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter;->mItemAdapter:Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;

    invoke-virtual {v0, p1}, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;->addModel(Ljava/util/List;)Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;

    .line 89
    return-object p0
.end method

.method public final varargs addModel([Ljava/lang/Object;)Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TModel;)",
            "Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter",
            "<TModel;TItem;>;"
        }
    .end annotation

    .annotation runtime Ljava/lang/SafeVarargs;
    .end annotation

    .prologue
    .line 78
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter<TModel;TItem;>;"
    .local p1, "models":[Ljava/lang/Object;, "[TModel;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter;->mItemAdapter:Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;

    invoke-virtual {v0, p1}, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;->addModel([Ljava/lang/Object;)Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;

    .line 79
    return-object p0
.end method

.method public clearModel()Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter",
            "<TModel;TItem;>;"
        }
    .end annotation

    .prologue
    .line 130
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter<TModel;TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter;->mItemAdapter:Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;

    invoke-virtual {v0}, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;->clearModel()Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;

    .line 131
    return-object p0
.end method

.method public getGenericItemAdapter()Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter",
            "<TModel;TItem;>;"
        }
    .end annotation

    .prologue
    .line 39
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter<TModel;TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter;->mItemAdapter:Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;

    return-object v0
.end method

.method public getModels()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<TModel;>;"
        }
    .end annotation

    .prologue
    .line 48
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter<TModel;TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter;->mItemAdapter:Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;

    invoke-virtual {v0}, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;->getModels()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public moveModel(II)Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter;
    .registers 4
    .param p1, "fromPosition"    # I
    .param p2, "toPosition"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter",
            "<TModel;TItem;>;"
        }
    .end annotation

    .prologue
    .line 142
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter<TModel;TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter;->mItemAdapter:Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;

    invoke-virtual {v0, p1, p2}, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;->moveModel(II)Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;

    .line 143
    return-object p0
.end method

.method public removeModel(I)Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter;
    .registers 3
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter",
            "<TModel;TItem;>;"
        }
    .end annotation

    .prologue
    .line 163
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter<TModel;TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter;->mItemAdapter:Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;

    invoke-virtual {v0, p1}, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;->removeModel(I)Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;

    .line 164
    return-object p0
.end method

.method public removeModelRange(II)Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter;
    .registers 4
    .param p1, "position"    # I
    .param p2, "itemCount"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter",
            "<TModel;TItem;>;"
        }
    .end annotation

    .prologue
    .line 153
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter<TModel;TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter;->mItemAdapter:Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;

    invoke-virtual {v0, p1, p2}, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;->removeModelRange(II)Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;

    .line 154
    return-object p0
.end method

.method public setModel(ILjava/lang/Object;)Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter;
    .registers 4
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITModel;)",
            "Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter",
            "<TModel;TItem;>;"
        }
    .end annotation

    .prologue
    .line 122
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter<TModel;TItem;>;"
    .local p2, "model":Ljava/lang/Object;, "TModel;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter;->mItemAdapter:Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;

    invoke-virtual {v0, p1, p2}, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;->setModel(ILjava/lang/Object;)Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;

    .line 123
    return-object p0
.end method

.method public setModel(Ljava/util/List;)Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<TModel;>;)",
            "Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter",
            "<TModel;TItem;>;"
        }
    .end annotation

    .prologue
    .line 57
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter<TModel;TItem;>;"
    .local p1, "models":Ljava/util/List;, "Ljava/util/List<TModel;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter;->mItemAdapter:Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;

    invoke-virtual {v0, p1}, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;->setModel(Ljava/util/List;)Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;

    .line 58
    return-object p0
.end method

.method public setNewModel(Ljava/util/List;)Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<TModel;>;)",
            "Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter",
            "<TModel;TItem;>;"
        }
    .end annotation

    .prologue
    .line 67
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter;, "Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter<TModel;TItem;>;"
    .local p1, "models":Ljava/util/List;, "Ljava/util/List<TModel;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/adapters/GenericFastItemAdapter;->mItemAdapter:Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;

    invoke-virtual {v0, p1}, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;->setNewModel(Ljava/util/List;)Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;

    .line 68
    return-object p0
.end method
