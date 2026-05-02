.class public Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter$ReflectionBasedItemFactory;
.super Ljava/lang/Object;
.source "GenericItemAdapter.java"

# interfaces
.implements Lcom/mikepenz/fastadapter/utils/Function;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "ReflectionBasedItemFactory"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Model:",
        "Ljava/lang/Object;",
        "Item:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/mikepenz/fastadapter/utils/Function",
        "<TModel;TItem;>;"
    }
.end annotation


# instance fields
.field private final itemClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<+TItem;>;"
        }
    .end annotation
.end field

.field private final modelClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<+TModel;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Class;Ljava/lang/Class;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+TModel;>;",
            "Ljava/lang/Class",
            "<+TItem;>;)V"
        }
    .end annotation

    .prologue
    .line 198
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter$ReflectionBasedItemFactory;, "Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter$ReflectionBasedItemFactory<TModel;TItem;>;"
    .local p1, "modelClass":Ljava/lang/Class;, "Ljava/lang/Class<+TModel;>;"
    .local p2, "itemClass":Ljava/lang/Class;, "Ljava/lang/Class<+TItem;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 199
    iput-object p1, p0, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter$ReflectionBasedItemFactory;->modelClass:Ljava/lang/Class;

    .line 200
    iput-object p2, p0, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter$ReflectionBasedItemFactory;->itemClass:Ljava/lang/Class;

    .line 201
    return-void
.end method


# virtual methods
.method public apply(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TModel;)TItem;"
        }
    .end annotation

    .prologue
    .line 206
    .local p0, "this":Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter$ReflectionBasedItemFactory;, "Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter$ReflectionBasedItemFactory<TModel;TItem;>;"
    .local p1, "model":Ljava/lang/Object;, "TModel;"
    :try_start_0
    iget-object v2, p0, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter$ReflectionBasedItemFactory;->itemClass:Ljava/lang/Class;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/mikepenz/fastadapter/adapters/GenericItemAdapter$ReflectionBasedItemFactory;->modelClass:Ljava/lang/Class;

    aput-object v5, v3, v4

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 207
    .local v0, "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<+TItem;>;"
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V

    .line 208
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_1b} :catch_1d

    move-result-object v2

    return-object v2

    .line 209
    .end local v0    # "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<+TItem;>;"
    :catch_1d
    move-exception v1

    .line 210
    .local v1, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "Please provide a constructor that takes a model as an argument"

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2
.end method
