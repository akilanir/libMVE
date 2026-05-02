.class public Lorg/mozilla/javascript/typedarrays/NativeTypedArrayIterator;
.super Ljava/lang/Object;
.source "NativeTypedArrayIterator.java"

# interfaces
.implements Ljava/util/ListIterator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/ListIterator",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private lastPosition:I

.field private position:I

.field private final view:Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;I)V
    .registers 4
    .param p2, "start"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView",
            "<TT;>;I)V"
        }
    .end annotation

    .prologue
    .line 22
    .local p0, "this":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayIterator;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayIterator<TT;>;"
    .local p1, "view":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    const/4 v0, -0x1

    iput v0, p0, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayIterator;->lastPosition:I

    .line 23
    iput-object p1, p0, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayIterator;->view:Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;

    .line 24
    iput p2, p0, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayIterator;->position:I

    .line 25
    return-void
.end method


# virtual methods
.method public add(Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 92
    .local p0, "this":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayIterator;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayIterator<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public hasNext()Z
    .registers 3

    .prologue
    .line 30
    .local p0, "this":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayIterator;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayIterator<TT;>;"
    iget v0, p0, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayIterator;->position:I

    iget-object v1, p0, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayIterator;->view:Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;

    iget v1, v1, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->length:I

    if-ge v0, v1, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public hasPrevious()Z
    .registers 2

    .prologue
    .line 36
    .local p0, "this":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayIterator;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayIterator<TT;>;"
    iget v0, p0, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayIterator;->position:I

    if-lez v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public next()Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 54
    .local p0, "this":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayIterator;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayIterator<TT;>;"
    invoke-virtual {p0}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayIterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_19

    .line 55
    iget-object v1, p0, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayIterator;->view:Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;

    iget v2, p0, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayIterator;->position:I

    invoke-virtual {v1, v2}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 56
    .local v0, "ret":Ljava/lang/Object;, "TT;"
    iget v1, p0, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayIterator;->position:I

    iput v1, p0, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayIterator;->lastPosition:I

    .line 57
    iget v1, p0, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayIterator;->position:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayIterator;->position:I

    .line 58
    return-object v0

    .line 60
    .end local v0    # "ret":Ljava/lang/Object;, "TT;"
    :cond_19
    new-instance v1, Ljava/util/NoSuchElementException;

    invoke-direct {v1}, Ljava/util/NoSuchElementException;-><init>()V

    throw v1
.end method

.method public nextIndex()I
    .registers 2

    .prologue
    .line 42
    .local p0, "this":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayIterator;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayIterator<TT;>;"
    iget v0, p0, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayIterator;->position:I

    return v0
.end method

.method public previous()Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 66
    .local p0, "this":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayIterator;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayIterator<TT;>;"
    invoke-virtual {p0}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayIterator;->hasPrevious()Z

    move-result v0

    if-eqz v0, :cond_19

    .line 67
    iget v0, p0, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayIterator;->position:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayIterator;->position:I

    .line 68
    iget v0, p0, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayIterator;->position:I

    iput v0, p0, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayIterator;->lastPosition:I

    .line 69
    iget-object v0, p0, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayIterator;->view:Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;

    iget v1, p0, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayIterator;->position:I

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 71
    :cond_19
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method

.method public previousIndex()I
    .registers 2

    .prologue
    .line 48
    .local p0, "this":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayIterator;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayIterator<TT;>;"
    iget v0, p0, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayIterator;->position:I

    add-int/lit8 v0, v0, -0x1

    return v0
.end method

.method public remove()V
    .registers 2

    .prologue
    .line 86
    .local p0, "this":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayIterator;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayIterator<TT;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public set(Ljava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 77
    .local p0, "this":Lorg/mozilla/javascript/typedarrays/NativeTypedArrayIterator;, "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayIterator<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget v0, p0, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayIterator;->lastPosition:I

    if-gez v0, :cond_a

    .line 78
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 80
    :cond_a
    iget-object v0, p0, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayIterator;->view:Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;

    iget v1, p0, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayIterator;->lastPosition:I

    invoke-virtual {v0, v1, p1}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;->js_set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 81
    return-void
.end method
