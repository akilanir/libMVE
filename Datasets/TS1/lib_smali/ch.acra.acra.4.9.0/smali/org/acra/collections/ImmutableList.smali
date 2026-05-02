.class public final Lorg/acra/collections/ImmutableList;
.super Ljava/lang/Object;
.source "ImmutableList.java"

# interfaces
.implements Ljava/util/List;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/List",
        "<TE;>;",
        "Ljava/io/Serializable;"
    }
.end annotation


# instance fields
.field private final mList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<TE;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/Collection;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<TE;>;)V"
        }
    .end annotation

    .prologue
    .line 42
    .local p0, "this":Lorg/acra/collections/ImmutableList;, "Lorg/acra/collections/ImmutableList<TE;>;"
    .local p1, "collection":Ljava/util/Collection;, "Ljava/util/Collection<TE;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lorg/acra/collections/ImmutableList;->mList:Ljava/util/List;

    .line 44
    return-void
.end method

.method public varargs constructor <init>([Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TE;)V"
        }
    .end annotation

    .prologue
    .line 39
    .local p0, "this":Lorg/acra/collections/ImmutableList;, "Lorg/acra/collections/ImmutableList<TE;>;"
    .local p1, "elements":[Ljava/lang/Object;, "[TE;"
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/acra/collections/ImmutableList;-><init>(Ljava/util/Collection;)V

    .line 40
    return-void
.end method


# virtual methods
.method public add(ILjava/lang/Object;)V
    .registers 4
    .param p1, "location"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITE;)V"
        }
    .end annotation

    .prologue
    .line 48
    .local p0, "this":Lorg/acra/collections/ImmutableList;, "Lorg/acra/collections/ImmutableList<TE;>;"
    .local p2, "object":Ljava/lang/Object;, "TE;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public add(Ljava/lang/Object;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)Z"
        }
    .end annotation

    .prologue
    .line 53
    .local p0, "this":Lorg/acra/collections/ImmutableList;, "Lorg/acra/collections/ImmutableList<TE;>;"
    .local p1, "object":Ljava/lang/Object;, "TE;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public addAll(ILjava/util/Collection;)Z
    .registers 4
    .param p1, "location"    # I
    .param p2    # Ljava/util/Collection;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/Collection",
            "<+TE;>;)Z"
        }
    .end annotation

    .prologue
    .line 58
    .local p0, "this":Lorg/acra/collections/ImmutableList;, "Lorg/acra/collections/ImmutableList<TE;>;"
    .local p2, "collection":Ljava/util/Collection;, "Ljava/util/Collection<+TE;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public addAll(Ljava/util/Collection;)Z
    .registers 3
    .param p1    # Ljava/util/Collection;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<+TE;>;)Z"
        }
    .end annotation

    .prologue
    .line 63
    .local p0, "this":Lorg/acra/collections/ImmutableList;, "Lorg/acra/collections/ImmutableList<TE;>;"
    .local p1, "collection":Ljava/util/Collection;, "Ljava/util/Collection<+TE;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public clear()V
    .registers 2

    .prologue
    .line 68
    .local p0, "this":Lorg/acra/collections/ImmutableList;, "Lorg/acra/collections/ImmutableList<TE;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public contains(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 73
    .local p0, "this":Lorg/acra/collections/ImmutableList;, "Lorg/acra/collections/ImmutableList<TE;>;"
    iget-object v0, p0, Lorg/acra/collections/ImmutableList;->mList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public containsAll(Ljava/util/Collection;)Z
    .registers 3
    .param p1    # Ljava/util/Collection;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 78
    .local p0, "this":Lorg/acra/collections/ImmutableList;, "Lorg/acra/collections/ImmutableList<TE;>;"
    .local p1, "collection":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    iget-object v0, p0, Lorg/acra/collections/ImmutableList;->mList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->containsAll(Ljava/util/Collection;)Z

    move-result v0

    return v0
.end method

.method public get(I)Ljava/lang/Object;
    .registers 3
    .param p1, "location"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TE;"
        }
    .end annotation

    .prologue
    .line 83
    .local p0, "this":Lorg/acra/collections/ImmutableList;, "Lorg/acra/collections/ImmutableList<TE;>;"
    iget-object v0, p0, Lorg/acra/collections/ImmutableList;->mList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public indexOf(Ljava/lang/Object;)I
    .registers 3
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 88
    .local p0, "this":Lorg/acra/collections/ImmutableList;, "Lorg/acra/collections/ImmutableList<TE;>;"
    iget-object v0, p0, Lorg/acra/collections/ImmutableList;->mList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 93
    .local p0, "this":Lorg/acra/collections/ImmutableList;, "Lorg/acra/collections/ImmutableList<TE;>;"
    iget-object v0, p0, Lorg/acra/collections/ImmutableList;->mList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .registers 3
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 99
    .local p0, "this":Lorg/acra/collections/ImmutableList;, "Lorg/acra/collections/ImmutableList<TE;>;"
    new-instance v0, Lorg/acra/collections/UnmodifiableIteratorWrapper;

    iget-object v1, p0, Lorg/acra/collections/ImmutableList;->mList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/acra/collections/UnmodifiableIteratorWrapper;-><init>(Ljava/util/Iterator;)V

    return-object v0
.end method

.method public lastIndexOf(Ljava/lang/Object;)I
    .registers 3
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 104
    .local p0, "this":Lorg/acra/collections/ImmutableList;, "Lorg/acra/collections/ImmutableList<TE;>;"
    iget-object v0, p0, Lorg/acra/collections/ImmutableList;->mList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->lastIndexOf(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public listIterator()Ljava/util/ListIterator;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ListIterator",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 109
    .local p0, "this":Lorg/acra/collections/ImmutableList;, "Lorg/acra/collections/ImmutableList<TE;>;"
    new-instance v0, Lorg/acra/collections/UnmodifiableListIteratorWrapper;

    iget-object v1, p0, Lorg/acra/collections/ImmutableList;->mList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/acra/collections/UnmodifiableListIteratorWrapper;-><init>(Ljava/util/ListIterator;)V

    return-object v0
.end method

.method public listIterator(I)Ljava/util/ListIterator;
    .registers 4
    .param p1, "location"    # I
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/ListIterator",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 115
    .local p0, "this":Lorg/acra/collections/ImmutableList;, "Lorg/acra/collections/ImmutableList<TE;>;"
    new-instance v0, Lorg/acra/collections/UnmodifiableListIteratorWrapper;

    iget-object v1, p0, Lorg/acra/collections/ImmutableList;->mList:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->listIterator(I)Ljava/util/ListIterator;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/acra/collections/UnmodifiableListIteratorWrapper;-><init>(Ljava/util/ListIterator;)V

    return-object v0
.end method

.method public remove(I)Ljava/lang/Object;
    .registers 3
    .param p1, "location"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TE;"
        }
    .end annotation

    .prologue
    .line 120
    .local p0, "this":Lorg/acra/collections/ImmutableList;, "Lorg/acra/collections/ImmutableList<TE;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public remove(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 125
    .local p0, "this":Lorg/acra/collections/ImmutableList;, "Lorg/acra/collections/ImmutableList<TE;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public removeAll(Ljava/util/Collection;)Z
    .registers 3
    .param p1    # Ljava/util/Collection;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 130
    .local p0, "this":Lorg/acra/collections/ImmutableList;, "Lorg/acra/collections/ImmutableList<TE;>;"
    .local p1, "collection":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public retainAll(Ljava/util/Collection;)Z
    .registers 3
    .param p1    # Ljava/util/Collection;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 135
    .local p0, "this":Lorg/acra/collections/ImmutableList;, "Lorg/acra/collections/ImmutableList<TE;>;"
    .local p1, "collection":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public set(ILjava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .param p1, "location"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITE;)TE;"
        }
    .end annotation

    .prologue
    .line 140
    .local p0, "this":Lorg/acra/collections/ImmutableList;, "Lorg/acra/collections/ImmutableList<TE;>;"
    .local p2, "object":Ljava/lang/Object;, "TE;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public size()I
    .registers 2

    .prologue
    .line 145
    .local p0, "this":Lorg/acra/collections/ImmutableList;, "Lorg/acra/collections/ImmutableList<TE;>;"
    iget-object v0, p0, Lorg/acra/collections/ImmutableList;->mList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public subList(II)Ljava/util/List;
    .registers 4
    .param p1, "start"    # I
    .param p2, "end"    # I
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Ljava/util/List",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 151
    .local p0, "this":Lorg/acra/collections/ImmutableList;, "Lorg/acra/collections/ImmutableList<TE;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public toArray()[Ljava/lang/Object;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 157
    .local p0, "this":Lorg/acra/collections/ImmutableList;, "Lorg/acra/collections/ImmutableList<TE;>;"
    iget-object v0, p0, Lorg/acra/collections/ImmutableList;->mList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    .registers 3
    .param p1    # [Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)[TT;"
        }
    .end annotation

    .prologue
    .line 164
    .local p0, "this":Lorg/acra/collections/ImmutableList;, "Lorg/acra/collections/ImmutableList<TE;>;"
    .local p1, "array":[Ljava/lang/Object;, "[TT;"
    iget-object v0, p0, Lorg/acra/collections/ImmutableList;->mList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
