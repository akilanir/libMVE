.class Lorg/msgpack/type/SequentialMapValueImpl$ValueIterator;
.super Ljava/lang/Object;
.source "SequentialMapValueImpl.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/msgpack/type/SequentialMapValueImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ValueIterator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator",
        "<",
        "Lorg/msgpack/type/Value;",
        ">;"
    }
.end annotation


# instance fields
.field private array:[Lorg/msgpack/type/Value;

.field private pos:I


# direct methods
.method constructor <init>([Lorg/msgpack/type/Value;I)V
    .registers 3
    .param p1, "array"    # [Lorg/msgpack/type/Value;
    .param p2, "offset"    # I

    .prologue
    .line 184
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 185
    iput-object p1, p0, Lorg/msgpack/type/SequentialMapValueImpl$ValueIterator;->array:[Lorg/msgpack/type/Value;

    .line 186
    iput p2, p0, Lorg/msgpack/type/SequentialMapValueImpl$ValueIterator;->pos:I

    .line 187
    return-void
.end method


# virtual methods
.method public hasNext()Z
    .registers 3

    .prologue
    .line 191
    iget v0, p0, Lorg/msgpack/type/SequentialMapValueImpl$ValueIterator;->pos:I

    iget-object v1, p0, Lorg/msgpack/type/SequentialMapValueImpl$ValueIterator;->array:[Lorg/msgpack/type/Value;

    array-length v1, v1

    if-ge v0, v1, :cond_9

    const/4 v0, 0x1

    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 180
    invoke-virtual {p0}, Lorg/msgpack/type/SequentialMapValueImpl$ValueIterator;->next()Lorg/msgpack/type/Value;

    move-result-object v0

    return-object v0
.end method

.method public next()Lorg/msgpack/type/Value;
    .registers 4

    .prologue
    .line 196
    iget v1, p0, Lorg/msgpack/type/SequentialMapValueImpl$ValueIterator;->pos:I

    iget-object v2, p0, Lorg/msgpack/type/SequentialMapValueImpl$ValueIterator;->array:[Lorg/msgpack/type/Value;

    array-length v2, v2

    if-lt v1, v2, :cond_d

    .line 197
    new-instance v1, Ljava/util/NoSuchElementException;

    invoke-direct {v1}, Ljava/util/NoSuchElementException;-><init>()V

    throw v1

    .line 199
    :cond_d
    iget-object v1, p0, Lorg/msgpack/type/SequentialMapValueImpl$ValueIterator;->array:[Lorg/msgpack/type/Value;

    iget v2, p0, Lorg/msgpack/type/SequentialMapValueImpl$ValueIterator;->pos:I

    aget-object v0, v1, v2

    .line 200
    .local v0, "v":Lorg/msgpack/type/Value;
    iget v1, p0, Lorg/msgpack/type/SequentialMapValueImpl$ValueIterator;->pos:I

    add-int/lit8 v1, v1, 0x2

    iput v1, p0, Lorg/msgpack/type/SequentialMapValueImpl$ValueIterator;->pos:I

    .line 201
    return-object v0
.end method

.method public remove()V
    .registers 2

    .prologue
    .line 206
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
