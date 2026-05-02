.class public interface abstract Lcom/mikepenz/fastadapter/IItemAdapter;
.super Ljava/lang/Object;
.source "IItemAdapter.java"

# interfaces
.implements Lcom/mikepenz/fastadapter/IAdapter;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mikepenz/fastadapter/IItemAdapter$Predicate;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Item::",
        "Lcom/mikepenz/fastadapter/IItem;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/mikepenz/fastadapter/IAdapter",
        "<TItem;>;"
    }
.end annotation


# virtual methods
.method public abstract add(ILjava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List",
            "<TItem;>;)V"
        }
    .end annotation
.end method

.method public varargs abstract add(I[Lcom/mikepenz/fastadapter/IItem;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I[TItem;)V"
        }
    .end annotation
.end method

.method public abstract add(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<TItem;>;)V"
        }
    .end annotation
.end method

.method public varargs abstract add([Lcom/mikepenz/fastadapter/IItem;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TItem;)V"
        }
    .end annotation
.end method

.method public abstract clear()V
.end method

.method public abstract remove(I)V
.end method

.method public abstract removeRange(II)V
.end method

.method public abstract set(ILcom/mikepenz/fastadapter/IItem;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITItem;)V"
        }
    .end annotation
.end method

.method public abstract set(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<TItem;>;)V"
        }
    .end annotation
.end method

.method public abstract setNewList(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<TItem;>;)V"
        }
    .end annotation
.end method

.method public abstract setSubItems(Lcom/mikepenz/fastadapter/IExpandable;Ljava/util/List;)Ljava/lang/Object;
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
.end method
