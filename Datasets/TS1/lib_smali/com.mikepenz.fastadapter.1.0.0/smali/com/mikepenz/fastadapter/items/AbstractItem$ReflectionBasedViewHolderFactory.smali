.class public Lcom/mikepenz/fastadapter/items/AbstractItem$ReflectionBasedViewHolderFactory;
.super Ljava/lang/Object;
.source "AbstractItem.java"

# interfaces
.implements Lcom/mikepenz/fastadapter/utils/ViewHolderFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mikepenz/fastadapter/items/AbstractItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "ReflectionBasedViewHolderFactory"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<VH:",
        "Landroid/support/v7/widget/RecyclerView$ViewHolder;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/mikepenz/fastadapter/utils/ViewHolderFactory",
        "<TVH;>;"
    }
.end annotation


# instance fields
.field private final clazz:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<+TVH;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Class;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+TVH;>;)V"
        }
    .end annotation

    .prologue
    .line 276
    .local p0, "this":Lcom/mikepenz/fastadapter/items/AbstractItem$ReflectionBasedViewHolderFactory;, "Lcom/mikepenz/fastadapter/items/AbstractItem$ReflectionBasedViewHolderFactory<TVH;>;"
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<+TVH;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 277
    iput-object p1, p0, Lcom/mikepenz/fastadapter/items/AbstractItem$ReflectionBasedViewHolderFactory;->clazz:Ljava/lang/Class;

    .line 278
    return-void
.end method


# virtual methods
.method public create(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .registers 8
    .param p1, "v"    # Landroid/view/View;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            ")TVH;"
        }
    .end annotation

    .prologue
    .line 284
    .local p0, "this":Lcom/mikepenz/fastadapter/items/AbstractItem$ReflectionBasedViewHolderFactory;, "Lcom/mikepenz/fastadapter/items/AbstractItem$ReflectionBasedViewHolderFactory<TVH;>;"
    :try_start_0
    iget-object v2, p0, Lcom/mikepenz/fastadapter/items/AbstractItem$ReflectionBasedViewHolderFactory;->clazz:Ljava/lang/Class;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    const-class v5, Landroid/view/View;

    aput-object v5, v3, v4

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 286
    .local v0, "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<+TVH;>;"
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V

    .line 287
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/RecyclerView$ViewHolder;
    :try_end_1e
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_1e} :catch_1f
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_1e} :catch_29

    .line 290
    .end local v0    # "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<+TVH;>;"
    :goto_1e
    return-object v2

    .line 288
    :catch_1f
    move-exception v1

    .line 290
    .local v1, "e":Ljava/lang/NoSuchMethodException;
    :try_start_20
    iget-object v2, p0, Lcom/mikepenz/fastadapter/items/AbstractItem$ReflectionBasedViewHolderFactory;->clazz:Ljava/lang/Class;

    invoke-virtual {v2}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/RecyclerView$ViewHolder;
    :try_end_28
    .catch Ljava/lang/Exception; {:try_start_20 .. :try_end_28} :catch_29

    goto :goto_1e

    .line 292
    .end local v1    # "e":Ljava/lang/NoSuchMethodException;
    :catch_29
    move-exception v1

    .line 294
    .local v1, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "Please provide a constructor that takes a view or a no-arg constructor"

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2
.end method
