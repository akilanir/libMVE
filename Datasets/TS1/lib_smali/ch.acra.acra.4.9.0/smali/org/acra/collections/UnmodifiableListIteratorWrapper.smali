.class Lorg/acra/collections/UnmodifiableListIteratorWrapper;
.super Ljava/lang/Object;
.source "UnmodifiableListIteratorWrapper.java"

# interfaces
.implements Ljava/util/ListIterator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/ListIterator",
        "<TE;>;"
    }
.end annotation


# instance fields
.field private final mIterator:Ljava/util/ListIterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ListIterator",
            "<TE;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/ListIterator;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ListIterator",
            "<TE;>;)V"
        }
    .end annotation

    .prologue
    .line 29
    .local p0, "this":Lorg/acra/collections/UnmodifiableListIteratorWrapper;, "Lorg/acra/collections/UnmodifiableListIteratorWrapper<TE;>;"
    .local p1, "mIterator":Ljava/util/ListIterator;, "Ljava/util/ListIterator<TE;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p1, p0, Lorg/acra/collections/UnmodifiableListIteratorWrapper;->mIterator:Ljava/util/ListIterator;

    .line 31
    return-void
.end method


# virtual methods
.method public add(Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    .prologue
    .line 35
    .local p0, "this":Lorg/acra/collections/UnmodifiableListIteratorWrapper;, "Lorg/acra/collections/UnmodifiableListIteratorWrapper<TE;>;"
    .local p1, "object":Ljava/lang/Object;, "TE;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public hasNext()Z
    .registers 2

    .prologue
    .line 40
    .local p0, "this":Lorg/acra/collections/UnmodifiableListIteratorWrapper;, "Lorg/acra/collections/UnmodifiableListIteratorWrapper<TE;>;"
    iget-object v0, p0, Lorg/acra/collections/UnmodifiableListIteratorWrapper;->mIterator:Ljava/util/ListIterator;

    invoke-interface {v0}, Ljava/util/ListIterator;->hasNext()Z

    move-result v0

    return v0
.end method

.method public hasPrevious()Z
    .registers 2

    .prologue
    .line 45
    .local p0, "this":Lorg/acra/collections/UnmodifiableListIteratorWrapper;, "Lorg/acra/collections/UnmodifiableListIteratorWrapper<TE;>;"
    iget-object v0, p0, Lorg/acra/collections/UnmodifiableListIteratorWrapper;->mIterator:Ljava/util/ListIterator;

    invoke-interface {v0}, Ljava/util/ListIterator;->hasPrevious()Z

    move-result v0

    return v0
.end method

.method public next()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .prologue
    .line 50
    .local p0, "this":Lorg/acra/collections/UnmodifiableListIteratorWrapper;, "Lorg/acra/collections/UnmodifiableListIteratorWrapper<TE;>;"
    iget-object v0, p0, Lorg/acra/collections/UnmodifiableListIteratorWrapper;->mIterator:Ljava/util/ListIterator;

    invoke-interface {v0}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public nextIndex()I
    .registers 2

    .prologue
    .line 55
    .local p0, "this":Lorg/acra/collections/UnmodifiableListIteratorWrapper;, "Lorg/acra/collections/UnmodifiableListIteratorWrapper<TE;>;"
    iget-object v0, p0, Lorg/acra/collections/UnmodifiableListIteratorWrapper;->mIterator:Ljava/util/ListIterator;

    invoke-interface {v0}, Ljava/util/ListIterator;->nextIndex()I

    move-result v0

    return v0
.end method

.method public previous()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .prologue
    .line 60
    .local p0, "this":Lorg/acra/collections/UnmodifiableListIteratorWrapper;, "Lorg/acra/collections/UnmodifiableListIteratorWrapper<TE;>;"
    iget-object v0, p0, Lorg/acra/collections/UnmodifiableListIteratorWrapper;->mIterator:Ljava/util/ListIterator;

    invoke-interface {v0}, Ljava/util/ListIterator;->previous()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public previousIndex()I
    .registers 2

    .prologue
    .line 65
    .local p0, "this":Lorg/acra/collections/UnmodifiableListIteratorWrapper;, "Lorg/acra/collections/UnmodifiableListIteratorWrapper<TE;>;"
    iget-object v0, p0, Lorg/acra/collections/UnmodifiableListIteratorWrapper;->mIterator:Ljava/util/ListIterator;

    invoke-interface {v0}, Ljava/util/ListIterator;->previousIndex()I

    move-result v0

    return v0
.end method

.method public remove()V
    .registers 2

    .prologue
    .line 70
    .local p0, "this":Lorg/acra/collections/UnmodifiableListIteratorWrapper;, "Lorg/acra/collections/UnmodifiableListIteratorWrapper<TE;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public set(Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    .prologue
    .line 75
    .local p0, "this":Lorg/acra/collections/UnmodifiableListIteratorWrapper;, "Lorg/acra/collections/UnmodifiableListIteratorWrapper<TE;>;"
    .local p1, "object":Ljava/lang/Object;, "TE;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
