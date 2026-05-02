.class Lorg/msgpack/type/ArrayValueImpl;
.super Lorg/msgpack/type/AbstractArrayValue;
.source "ArrayValueImpl.java"


# static fields
.field private static emptyInstance:Lorg/msgpack/type/ArrayValueImpl;


# instance fields
.field private array:[Lorg/msgpack/type/Value;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 25
    new-instance v0, Lorg/msgpack/type/ArrayValueImpl;

    const/4 v1, 0x0

    new-array v1, v1, [Lorg/msgpack/type/Value;

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lorg/msgpack/type/ArrayValueImpl;-><init>([Lorg/msgpack/type/Value;Z)V

    sput-object v0, Lorg/msgpack/type/ArrayValueImpl;->emptyInstance:Lorg/msgpack/type/ArrayValueImpl;

    return-void
.end method

.method constructor <init>([Lorg/msgpack/type/Value;Z)V
    .registers 6
    .param p1, "array"    # [Lorg/msgpack/type/Value;
    .param p2, "gift"    # Z

    .prologue
    const/4 v2, 0x0

    .line 38
    invoke-direct {p0}, Lorg/msgpack/type/AbstractArrayValue;-><init>()V

    .line 39
    if-eqz p2, :cond_9

    .line 40
    iput-object p1, p0, Lorg/msgpack/type/ArrayValueImpl;->array:[Lorg/msgpack/type/Value;

    .line 45
    :goto_8
    return-void

    .line 42
    :cond_9
    array-length v0, p1

    new-array v0, v0, [Lorg/msgpack/type/Value;

    iput-object v0, p0, Lorg/msgpack/type/ArrayValueImpl;->array:[Lorg/msgpack/type/Value;

    .line 43
    iget-object v0, p0, Lorg/msgpack/type/ArrayValueImpl;->array:[Lorg/msgpack/type/Value;

    array-length v1, p1

    invoke-static {p1, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_8
.end method

.method private equals(Lorg/msgpack/type/ArrayValueImpl;)Z
    .registers 6
    .param p1, "o"    # Lorg/msgpack/type/ArrayValueImpl;

    .prologue
    const/4 v1, 0x0

    .line 129
    iget-object v2, p0, Lorg/msgpack/type/ArrayValueImpl;->array:[Lorg/msgpack/type/Value;

    array-length v2, v2

    iget-object v3, p1, Lorg/msgpack/type/ArrayValueImpl;->array:[Lorg/msgpack/type/Value;

    array-length v3, v3

    if-eq v2, v3, :cond_a

    .line 137
    :cond_9
    :goto_9
    return v1

    .line 132
    :cond_a
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_b
    iget-object v2, p0, Lorg/msgpack/type/ArrayValueImpl;->array:[Lorg/msgpack/type/Value;

    array-length v2, v2

    if-ge v0, v2, :cond_21

    .line 133
    iget-object v2, p0, Lorg/msgpack/type/ArrayValueImpl;->array:[Lorg/msgpack/type/Value;

    aget-object v2, v2, v0

    iget-object v3, p1, Lorg/msgpack/type/ArrayValueImpl;->array:[Lorg/msgpack/type/Value;

    aget-object v3, v3, v0

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 132
    add-int/lit8 v0, v0, 0x1

    goto :goto_b

    .line 137
    :cond_21
    const/4 v1, 0x1

    goto :goto_9
.end method

.method public static getEmptyInstance()Lorg/msgpack/type/ArrayValue;
    .registers 1

    .prologue
    .line 28
    sget-object v0, Lorg/msgpack/type/ArrayValueImpl;->emptyInstance:Lorg/msgpack/type/ArrayValueImpl;

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 9
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 102
    if-ne p1, p0, :cond_6

    move v4, v3

    .line 125
    :cond_5
    :goto_5
    return v4

    .line 105
    :cond_6
    instance-of v5, p1, Lorg/msgpack/type/Value;

    if-eqz v5, :cond_5

    move-object v2, p1

    .line 108
    check-cast v2, Lorg/msgpack/type/Value;

    .line 109
    .local v2, "v":Lorg/msgpack/type/Value;
    invoke-interface {v2}, Lorg/msgpack/type/Value;->isArrayValue()Z

    move-result v5

    if-eqz v5, :cond_5

    .line 113
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    const-class v6, Lorg/msgpack/type/ArrayValueImpl;

    if-ne v5, v6, :cond_22

    .line 114
    check-cast v2, Lorg/msgpack/type/ArrayValueImpl;

    .end local v2    # "v":Lorg/msgpack/type/Value;
    invoke-direct {p0, v2}, Lorg/msgpack/type/ArrayValueImpl;->equals(Lorg/msgpack/type/ArrayValueImpl;)Z

    move-result v4

    goto :goto_5

    .line 117
    .restart local v2    # "v":Lorg/msgpack/type/Value;
    :cond_22
    invoke-interface {v2}, Lorg/msgpack/type/Value;->asArrayValue()Lorg/msgpack/type/ArrayValue;

    move-result-object v5

    invoke-interface {v5}, Lorg/msgpack/type/ArrayValue;->listIterator()Ljava/util/ListIterator;

    move-result-object v1

    .line 118
    .local v1, "oi":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Lorg/msgpack/type/Value;>;"
    const/4 v0, 0x0

    .line 119
    .local v0, "i":I
    :goto_2b
    iget-object v5, p0, Lorg/msgpack/type/ArrayValueImpl;->array:[Lorg/msgpack/type/Value;

    array-length v5, v5

    if-ge v0, v5, :cond_47

    .line 120
    invoke-interface {v1}, Ljava/util/ListIterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_5

    iget-object v5, p0, Lorg/msgpack/type/ArrayValueImpl;->array:[Lorg/msgpack/type/Value;

    aget-object v5, v5, v0

    invoke-interface {v1}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 123
    add-int/lit8 v0, v0, 0x1

    goto :goto_2b

    .line 125
    :cond_47
    invoke-interface {v1}, Ljava/util/ListIterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_4f

    :goto_4d
    move v4, v3

    goto :goto_5

    :cond_4f
    move v3, v4

    goto :goto_4d
.end method

.method public bridge synthetic get(I)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # I

    .prologue
    .line 24
    invoke-virtual {p0, p1}, Lorg/msgpack/type/ArrayValueImpl;->get(I)Lorg/msgpack/type/Value;

    move-result-object v0

    return-object v0
.end method

.method public get(I)Lorg/msgpack/type/Value;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 59
    if-ltz p1, :cond_7

    iget-object v0, p0, Lorg/msgpack/type/ArrayValueImpl;->array:[Lorg/msgpack/type/Value;

    array-length v0, v0

    if-gt v0, p1, :cond_d

    .line 60
    :cond_7
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 62
    :cond_d
    iget-object v0, p0, Lorg/msgpack/type/ArrayValueImpl;->array:[Lorg/msgpack/type/Value;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public getElementArray()[Lorg/msgpack/type/Value;
    .registers 2

    .prologue
    .line 35
    iget-object v0, p0, Lorg/msgpack/type/ArrayValueImpl;->array:[Lorg/msgpack/type/Value;

    return-object v0
.end method

.method public hashCode()I
    .registers 6

    .prologue
    .line 144
    const/4 v0, 0x1

    .line 145
    .local v0, "h":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2
    iget-object v3, p0, Lorg/msgpack/type/ArrayValueImpl;->array:[Lorg/msgpack/type/Value;

    array-length v3, v3

    if-ge v1, v3, :cond_16

    .line 146
    iget-object v3, p0, Lorg/msgpack/type/ArrayValueImpl;->array:[Lorg/msgpack/type/Value;

    aget-object v2, v3, v1

    .line 147
    .local v2, "obj":Lorg/msgpack/type/Value;
    mul-int/lit8 v3, v0, 0x1f

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v4

    add-int v0, v3, v4

    .line 145
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 149
    .end local v2    # "obj":Lorg/msgpack/type/Value;
    :cond_16
    return v0
.end method

.method public indexOf(Ljava/lang/Object;)I
    .registers 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, -0x1

    .line 67
    if-nez p1, :cond_5

    move v0, v1

    .line 75
    :cond_4
    :goto_4
    return v0

    .line 70
    :cond_5
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_6
    iget-object v2, p0, Lorg/msgpack/type/ArrayValueImpl;->array:[Lorg/msgpack/type/Value;

    array-length v2, v2

    if-ge v0, v2, :cond_18

    .line 71
    iget-object v2, p0, Lorg/msgpack/type/ArrayValueImpl;->array:[Lorg/msgpack/type/Value;

    aget-object v2, v2, v0

    invoke-virtual {v2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 70
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    :cond_18
    move v0, v1

    .line 75
    goto :goto_4
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 54
    iget-object v0, p0, Lorg/msgpack/type/ArrayValueImpl;->array:[Lorg/msgpack/type/Value;

    array-length v0, v0

    if-nez v0, :cond_7

    const/4 v0, 0x1

    :goto_6
    return v0

    :cond_7
    const/4 v0, 0x0

    goto :goto_6
.end method

.method public lastIndexOf(Ljava/lang/Object;)I
    .registers 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, -0x1

    .line 80
    if-nez p1, :cond_5

    move v0, v1

    .line 88
    :cond_4
    :goto_4
    return v0

    .line 83
    :cond_5
    iget-object v2, p0, Lorg/msgpack/type/ArrayValueImpl;->array:[Lorg/msgpack/type/Value;

    array-length v2, v2

    add-int/lit8 v0, v2, -0x1

    .local v0, "i":I
    :goto_a
    if-ltz v0, :cond_19

    .line 84
    iget-object v2, p0, Lorg/msgpack/type/ArrayValueImpl;->array:[Lorg/msgpack/type/Value;

    aget-object v2, v2, v0

    invoke-virtual {v2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 83
    add-int/lit8 v0, v0, -0x1

    goto :goto_a

    :cond_19
    move v0, v1

    .line 88
    goto :goto_4
.end method

.method public size()I
    .registers 2

    .prologue
    .line 49
    iget-object v0, p0, Lorg/msgpack/type/ArrayValueImpl;->array:[Lorg/msgpack/type/Value;

    array-length v0, v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 154
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v0}, Lorg/msgpack/type/ArrayValueImpl;->toString(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toString(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .registers 5
    .param p1, "sb"    # Ljava/lang/StringBuilder;

    .prologue
    .line 159
    iget-object v1, p0, Lorg/msgpack/type/ArrayValueImpl;->array:[Lorg/msgpack/type/Value;

    array-length v1, v1

    if-nez v1, :cond_c

    .line 160
    const-string v1, "[]"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 169
    .end local p1    # "sb":Ljava/lang/StringBuilder;
    :goto_b
    return-object p1

    .line 162
    .restart local p1    # "sb":Ljava/lang/StringBuilder;
    :cond_c
    const-string v1, "["

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 163
    iget-object v1, p0, Lorg/msgpack/type/ArrayValueImpl;->array:[Lorg/msgpack/type/Value;

    const/4 v2, 0x0

    aget-object v1, v1, v2

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 164
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_1a
    iget-object v1, p0, Lorg/msgpack/type/ArrayValueImpl;->array:[Lorg/msgpack/type/Value;

    array-length v1, v1

    if-ge v0, v1, :cond_2e

    .line 165
    const-string v1, ","

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    iget-object v1, p0, Lorg/msgpack/type/ArrayValueImpl;->array:[Lorg/msgpack/type/Value;

    aget-object v1, v1, v0

    invoke-interface {v1, p1}, Lorg/msgpack/type/Value;->toString(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 164
    add-int/lit8 v0, v0, 0x1

    goto :goto_1a

    .line 168
    :cond_2e
    const-string v1, "]"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_b
.end method

.method public writeTo(Lorg/msgpack/packer/Packer;)V
    .registers 4
    .param p1, "pk"    # Lorg/msgpack/packer/Packer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 93
    iget-object v1, p0, Lorg/msgpack/type/ArrayValueImpl;->array:[Lorg/msgpack/type/Value;

    array-length v1, v1

    invoke-interface {p1, v1}, Lorg/msgpack/packer/Packer;->writeArrayBegin(I)Lorg/msgpack/packer/Packer;

    .line 94
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_7
    iget-object v1, p0, Lorg/msgpack/type/ArrayValueImpl;->array:[Lorg/msgpack/type/Value;

    array-length v1, v1

    if-ge v0, v1, :cond_16

    .line 95
    iget-object v1, p0, Lorg/msgpack/type/ArrayValueImpl;->array:[Lorg/msgpack/type/Value;

    aget-object v1, v1, v0

    invoke-interface {v1, p1}, Lorg/msgpack/type/Value;->writeTo(Lorg/msgpack/packer/Packer;)V

    .line 94
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 97
    :cond_16
    invoke-interface {p1}, Lorg/msgpack/packer/Packer;->writeArrayEnd()Lorg/msgpack/packer/Packer;

    .line 98
    return-void
.end method
