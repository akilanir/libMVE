.class public abstract Lcom/mikepenz/fastadapter/items/GenericAbstractItem;
.super Lcom/mikepenz/fastadapter/items/AbstractItem;
.source "GenericAbstractItem.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Model:",
        "Ljava/lang/Object;",
        "Item:",
        "Lcom/mikepenz/fastadapter/items/GenericAbstractItem",
        "<***>;VH:",
        "Landroid/support/v7/widget/RecyclerView$ViewHolder;",
        ">",
        "Lcom/mikepenz/fastadapter/items/AbstractItem",
        "<TItem;TVH;>;"
    }
.end annotation


# instance fields
.field private mModel:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TModel;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TModel;)V"
        }
    .end annotation

    .prologue
    .line 18
    .local p0, "this":Lcom/mikepenz/fastadapter/items/GenericAbstractItem;, "Lcom/mikepenz/fastadapter/items/GenericAbstractItem<TModel;TItem;TVH;>;"
    .local p1, "model":Ljava/lang/Object;, "TModel;"
    invoke-direct {p0}, Lcom/mikepenz/fastadapter/items/AbstractItem;-><init>()V

    .line 19
    iput-object p1, p0, Lcom/mikepenz/fastadapter/items/GenericAbstractItem;->mModel:Ljava/lang/Object;

    .line 20
    return-void
.end method


# virtual methods
.method public getModel()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TModel;"
        }
    .end annotation

    .prologue
    .line 23
    .local p0, "this":Lcom/mikepenz/fastadapter/items/GenericAbstractItem;, "Lcom/mikepenz/fastadapter/items/GenericAbstractItem<TModel;TItem;TVH;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/items/GenericAbstractItem;->mModel:Ljava/lang/Object;

    return-object v0
.end method

.method public setModel(Ljava/lang/Object;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TModel;)V"
        }
    .end annotation

    .prologue
    .line 27
    .local p0, "this":Lcom/mikepenz/fastadapter/items/GenericAbstractItem;, "Lcom/mikepenz/fastadapter/items/GenericAbstractItem<TModel;TItem;TVH;>;"
    .local p1, "model":Ljava/lang/Object;, "TModel;"
    iput-object p1, p0, Lcom/mikepenz/fastadapter/items/GenericAbstractItem;->mModel:Ljava/lang/Object;

    .line 28
    return-void
.end method

.method protected viewHolderType()Ljava/lang/Class;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<+TVH;>;"
        }
    .end annotation

    .prologue
    .line 32
    .local p0, "this":Lcom/mikepenz/fastadapter/items/GenericAbstractItem;, "Lcom/mikepenz/fastadapter/items/GenericAbstractItem<TModel;TItem;TVH;>;"
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getGenericSuperclass()Ljava/lang/reflect/Type;

    move-result-object v0

    check-cast v0, Ljava/lang/reflect/ParameterizedType;

    invoke-interface {v0}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v0

    const/4 v1, 0x2

    aget-object v0, v0, v1

    check-cast v0, Ljava/lang/Class;

    return-object v0
.end method
