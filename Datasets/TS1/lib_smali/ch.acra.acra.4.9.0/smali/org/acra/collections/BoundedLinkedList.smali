.class public final Lorg/acra/collections/BoundedLinkedList;
.super Ljava/util/LinkedList;
.source "BoundedLinkedList.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/LinkedList",
        "<TE;>;"
    }
.end annotation


# instance fields
.field private final maxSize:I


# direct methods
.method public constructor <init>(I)V
    .registers 2
    .param p1, "maxSize"    # I

    .prologue
    .line 35
    .local p0, "this":Lorg/acra/collections/BoundedLinkedList;, "Lorg/acra/collections/BoundedLinkedList<TE;>;"
    invoke-direct {p0}, Ljava/util/LinkedList;-><init>()V

    .line 36
    iput p1, p0, Lorg/acra/collections/BoundedLinkedList;->maxSize:I

    .line 37
    return-void
.end method


# virtual methods
.method public add(ILjava/lang/Object;)V
    .registers 5
    .param p1, "location"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITE;)V"
        }
    .end annotation

    .prologue
    .line 59
    .local p0, "this":Lorg/acra/collections/BoundedLinkedList;, "Lorg/acra/collections/BoundedLinkedList<TE;>;"
    .local p2, "object":Ljava/lang/Object;, "TE;"
    invoke-virtual {p0}, Lorg/acra/collections/BoundedLinkedList;->size()I

    move-result v0

    iget v1, p0, Lorg/acra/collections/BoundedLinkedList;->maxSize:I

    if-ne v0, v1, :cond_b

    .line 60
    invoke-virtual {p0}, Lorg/acra/collections/BoundedLinkedList;->removeFirst()Ljava/lang/Object;

    .line 62
    :cond_b
    invoke-super {p0, p1, p2}, Ljava/util/LinkedList;->add(ILjava/lang/Object;)V

    .line 63
    return-void
.end method

.method public add(Ljava/lang/Object;)Z
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)Z"
        }
    .end annotation

    .prologue
    .line 46
    .local p0, "this":Lorg/acra/collections/BoundedLinkedList;, "Lorg/acra/collections/BoundedLinkedList<TE;>;"
    .local p1, "object":Ljava/lang/Object;, "TE;"
    invoke-virtual {p0}, Lorg/acra/collections/BoundedLinkedList;->size()I

    move-result v0

    iget v1, p0, Lorg/acra/collections/BoundedLinkedList;->maxSize:I

    if-ne v0, v1, :cond_b

    .line 47
    invoke-virtual {p0}, Lorg/acra/collections/BoundedLinkedList;->removeFirst()Ljava/lang/Object;

    .line 49
    :cond_b
    invoke-super {p0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public addAll(ILjava/util/Collection;)Z
    .registers 4
    .param p1, "location"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/Collection",
            "<+TE;>;)Z"
        }
    .end annotation

    .prologue
    .line 101
    .local p0, "this":Lorg/acra/collections/BoundedLinkedList;, "Lorg/acra/collections/BoundedLinkedList<TE;>;"
    .local p2, "collection":Ljava/util/Collection;, "Ljava/util/Collection<+TE;>;"
    invoke-virtual {p0}, Lorg/acra/collections/BoundedLinkedList;->size()I

    move-result v0

    if-ne p1, v0, :cond_b

    .line 102
    invoke-super {p0, p1, p2}, Ljava/util/LinkedList;->addAll(ILjava/util/Collection;)Z

    move-result v0

    return v0

    .line 104
    :cond_b
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public addAll(Ljava/util/Collection;)Z
    .registers 9
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
    .line 72
    .local p0, "this":Lorg/acra/collections/BoundedLinkedList;, "Lorg/acra/collections/BoundedLinkedList<TE;>;"
    .local p1, "collection":Ljava/util/Collection;, "Ljava/util/Collection<+TE;>;"
    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v3

    .line 73
    .local v3, "size":I
    iget v5, p0, Lorg/acra/collections/BoundedLinkedList;->maxSize:I

    if-le v3, v5, :cond_1b

    .line 74
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1, p1}, Ljava/util/LinkedList;-><init>(Ljava/util/Collection;)V

    .line 75
    .local v1, "list":Ljava/util/LinkedList;, "Ljava/util/LinkedList<+TE;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_e
    iget v5, p0, Lorg/acra/collections/BoundedLinkedList;->maxSize:I

    sub-int v5, v3, v5

    if-ge v0, v5, :cond_1a

    .line 76
    invoke-virtual {v1}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    .line 75
    add-int/lit8 v0, v0, 0x1

    goto :goto_e

    .line 78
    :cond_1a
    move-object p1, v1

    .line 80
    .end local v0    # "i":I
    .end local v1    # "list":Ljava/util/LinkedList;, "Ljava/util/LinkedList<+TE;>;"
    :cond_1b
    invoke-virtual {p0}, Lorg/acra/collections/BoundedLinkedList;->size()I

    move-result v5

    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v6

    add-int v4, v5, v6

    .line 81
    .local v4, "totalNeededSize":I
    iget v5, p0, Lorg/acra/collections/BoundedLinkedList;->maxSize:I

    sub-int v2, v4, v5

    .line 82
    .local v2, "overhead":I
    if-lez v2, :cond_2f

    .line 83
    const/4 v5, 0x0

    invoke-virtual {p0, v5, v2}, Lorg/acra/collections/BoundedLinkedList;->removeRange(II)V

    .line 85
    :cond_2f
    invoke-super {p0, p1}, Ljava/util/LinkedList;->addAll(Ljava/util/Collection;)Z

    move-result v5

    return v5
.end method

.method public addFirst(Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    .prologue
    .line 115
    .local p0, "this":Lorg/acra/collections/BoundedLinkedList;, "Lorg/acra/collections/BoundedLinkedList<TE;>;"
    .local p1, "object":Ljava/lang/Object;, "TE;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public addLast(Ljava/lang/Object;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    .prologue
    .line 125
    .local p0, "this":Lorg/acra/collections/BoundedLinkedList;, "Lorg/acra/collections/BoundedLinkedList<TE;>;"
    .local p1, "object":Ljava/lang/Object;, "TE;"
    invoke-virtual {p0, p1}, Lorg/acra/collections/BoundedLinkedList;->add(Ljava/lang/Object;)Z

    .line 126
    return-void
.end method

.method public offer(Ljava/lang/Object;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)Z"
        }
    .end annotation

    .prologue
    .line 145
    .local p0, "this":Lorg/acra/collections/BoundedLinkedList;, "Lorg/acra/collections/BoundedLinkedList<TE;>;"
    .local p1, "o":Ljava/lang/Object;, "TE;"
    invoke-virtual {p0, p1}, Lorg/acra/collections/BoundedLinkedList;->add(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public offerFirst(Ljava/lang/Object;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)Z"
        }
    .end annotation

    .prologue
    .line 150
    .local p0, "this":Lorg/acra/collections/BoundedLinkedList;, "Lorg/acra/collections/BoundedLinkedList<TE;>;"
    .local p1, "e":Ljava/lang/Object;, "TE;"
    invoke-virtual {p0, p1}, Lorg/acra/collections/BoundedLinkedList;->addFirst(Ljava/lang/Object;)V

    .line 151
    const/4 v0, 0x1

    return v0
.end method

.method public offerLast(Ljava/lang/Object;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)Z"
        }
    .end annotation

    .prologue
    .line 156
    .local p0, "this":Lorg/acra/collections/BoundedLinkedList;, "Lorg/acra/collections/BoundedLinkedList<TE;>;"
    .local p1, "e":Ljava/lang/Object;, "TE;"
    invoke-virtual {p0, p1}, Lorg/acra/collections/BoundedLinkedList;->add(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public push(Ljava/lang/Object;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    .prologue
    .line 161
    .local p0, "this":Lorg/acra/collections/BoundedLinkedList;, "Lorg/acra/collections/BoundedLinkedList<TE;>;"
    .local p1, "e":Ljava/lang/Object;, "TE;"
    invoke-virtual {p0, p1}, Lorg/acra/collections/BoundedLinkedList;->add(Ljava/lang/Object;)Z

    .line 162
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 5
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 136
    .local p0, "this":Lorg/acra/collections/BoundedLinkedList;, "Lorg/acra/collections/BoundedLinkedList<TE;>;"
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 137
    .local v1, "result":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Lorg/acra/collections/BoundedLinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_9
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1b

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 138
    .local v0, "object":Ljava/lang/Object;, "TE;"
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_9

    .line 140
    .end local v0    # "object":Ljava/lang/Object;, "TE;"
    :cond_1b
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
