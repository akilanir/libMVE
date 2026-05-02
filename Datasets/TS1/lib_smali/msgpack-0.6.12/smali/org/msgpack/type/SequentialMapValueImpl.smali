.class Lorg/msgpack/type/SequentialMapValueImpl;
.super Lorg/msgpack/type/AbstractMapValue;
.source "SequentialMapValueImpl.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/msgpack/type/SequentialMapValueImpl$ValueIterator;,
        Lorg/msgpack/type/SequentialMapValueImpl$ValueCollection;,
        Lorg/msgpack/type/SequentialMapValueImpl$KeySet;,
        Lorg/msgpack/type/SequentialMapValueImpl$EntrySetIterator;,
        Lorg/msgpack/type/SequentialMapValueImpl$EntrySet;
    }
.end annotation


# static fields
.field private static emptyInstance:Lorg/msgpack/type/SequentialMapValueImpl;


# instance fields
.field private array:[Lorg/msgpack/type/Value;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 33
    new-instance v0, Lorg/msgpack/type/SequentialMapValueImpl;

    const/4 v1, 0x0

    new-array v1, v1, [Lorg/msgpack/type/Value;

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lorg/msgpack/type/SequentialMapValueImpl;-><init>([Lorg/msgpack/type/Value;Z)V

    sput-object v0, Lorg/msgpack/type/SequentialMapValueImpl;->emptyInstance:Lorg/msgpack/type/SequentialMapValueImpl;

    return-void
.end method

.method constructor <init>([Lorg/msgpack/type/Value;Z)V
    .registers 6
    .param p1, "array"    # [Lorg/msgpack/type/Value;
    .param p2, "gift"    # Z

    .prologue
    const/4 v2, 0x0

    .line 46
    invoke-direct {p0}, Lorg/msgpack/type/AbstractMapValue;-><init>()V

    .line 47
    array-length v0, p1

    rem-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_f

    .line 48
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 50
    :cond_f
    if-eqz p2, :cond_14

    .line 51
    iput-object p1, p0, Lorg/msgpack/type/SequentialMapValueImpl;->array:[Lorg/msgpack/type/Value;

    .line 56
    :goto_13
    return-void

    .line 53
    :cond_14
    array-length v0, p1

    new-array v0, v0, [Lorg/msgpack/type/Value;

    iput-object v0, p0, Lorg/msgpack/type/SequentialMapValueImpl;->array:[Lorg/msgpack/type/Value;

    .line 54
    iget-object v0, p0, Lorg/msgpack/type/SequentialMapValueImpl;->array:[Lorg/msgpack/type/Value;

    array-length v1, p1

    invoke-static {p1, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_13
.end method

.method public static getEmptyInstance()Lorg/msgpack/type/MapValue;
    .registers 1

    .prologue
    .line 36
    sget-object v0, Lorg/msgpack/type/SequentialMapValueImpl;->emptyInstance:Lorg/msgpack/type/SequentialMapValueImpl;

    return-object v0
.end method


# virtual methods
.method public entrySet()Ljava/util/Set;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/util/Map$Entry",
            "<",
            "Lorg/msgpack/type/Value;",
            "Lorg/msgpack/type/Value;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 212
    new-instance v0, Lorg/msgpack/type/SequentialMapValueImpl$EntrySet;

    iget-object v1, p0, Lorg/msgpack/type/SequentialMapValueImpl;->array:[Lorg/msgpack/type/Value;

    invoke-direct {v0, v1}, Lorg/msgpack/type/SequentialMapValueImpl$EntrySet;-><init>([Lorg/msgpack/type/Value;)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 12
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 236
    if-ne p1, p0, :cond_5

    .line 266
    :cond_4
    :goto_4
    return v6

    .line 239
    :cond_5
    instance-of v8, p1, Lorg/msgpack/type/Value;

    if-nez v8, :cond_b

    move v6, v7

    .line 240
    goto :goto_4

    :cond_b
    move-object v4, p1

    .line 242
    check-cast v4, Lorg/msgpack/type/Value;

    .line 243
    .local v4, "v":Lorg/msgpack/type/Value;
    invoke-interface {v4}, Lorg/msgpack/type/Value;->isMapValue()Z

    move-result v8

    if-nez v8, :cond_16

    move v6, v7

    .line 244
    goto :goto_4

    .line 247
    :cond_16
    invoke-interface {v4}, Lorg/msgpack/type/Value;->asMapValue()Lorg/msgpack/type/MapValue;

    move-result-object v3

    .line 248
    .local v3, "om":Ljava/util/Map;, "Ljava/util/Map<Lorg/msgpack/type/Value;Lorg/msgpack/type/Value;>;"
    invoke-interface {v3}, Ljava/util/Map;->size()I

    move-result v8

    iget-object v9, p0, Lorg/msgpack/type/SequentialMapValueImpl;->array:[Lorg/msgpack/type/Value;

    array-length v9, v9

    div-int/lit8 v9, v9, 0x2

    if-eq v8, v9, :cond_27

    move v6, v7

    .line 249
    goto :goto_4

    .line 253
    :cond_27
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_28
    :try_start_28
    iget-object v8, p0, Lorg/msgpack/type/SequentialMapValueImpl;->array:[Lorg/msgpack/type/Value;

    array-length v8, v8

    if-ge v1, v8, :cond_4

    .line 254
    iget-object v8, p0, Lorg/msgpack/type/SequentialMapValueImpl;->array:[Lorg/msgpack/type/Value;

    aget-object v2, v8, v1

    .line 255
    .local v2, "key":Lorg/msgpack/type/Value;
    iget-object v8, p0, Lorg/msgpack/type/SequentialMapValueImpl;->array:[Lorg/msgpack/type/Value;

    add-int/lit8 v9, v1, 0x1

    aget-object v5, v8, v9

    .line 256
    .local v5, "value":Lorg/msgpack/type/Value;
    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v5, v8}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z
    :try_end_3e
    .catch Ljava/lang/ClassCastException; {:try_start_28 .. :try_end_3e} :catch_46
    .catch Ljava/lang/NullPointerException; {:try_start_28 .. :try_end_3e} :catch_49

    move-result v8

    if-nez v8, :cond_43

    move v6, v7

    .line 257
    goto :goto_4

    .line 253
    :cond_43
    add-int/lit8 v1, v1, 0x2

    goto :goto_28

    .line 260
    .end local v2    # "key":Lorg/msgpack/type/Value;
    .end local v5    # "value":Lorg/msgpack/type/Value;
    :catch_46
    move-exception v0

    .local v0, "ex":Ljava/lang/ClassCastException;
    move v6, v7

    .line 261
    goto :goto_4

    .line 262
    .end local v0    # "ex":Ljava/lang/ClassCastException;
    :catch_49
    move-exception v0

    .local v0, "ex":Ljava/lang/NullPointerException;
    move v6, v7

    .line 263
    goto :goto_4
.end method

.method public bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 32
    invoke-virtual {p0, p1}, Lorg/msgpack/type/SequentialMapValueImpl;->get(Ljava/lang/Object;)Lorg/msgpack/type/Value;

    move-result-object v0

    return-object v0
.end method

.method public get(Ljava/lang/Object;)Lorg/msgpack/type/Value;
    .registers 5
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 60
    if-nez p1, :cond_4

    .line 68
    :cond_3
    :goto_3
    return-object v1

    .line 63
    :cond_4
    iget-object v2, p0, Lorg/msgpack/type/SequentialMapValueImpl;->array:[Lorg/msgpack/type/Value;

    array-length v2, v2

    add-int/lit8 v0, v2, -0x2

    .local v0, "i":I
    :goto_9
    if-ltz v0, :cond_3

    .line 64
    iget-object v2, p0, Lorg/msgpack/type/SequentialMapValueImpl;->array:[Lorg/msgpack/type/Value;

    aget-object v2, v2, v0

    invoke-virtual {v2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c

    .line 65
    iget-object v1, p0, Lorg/msgpack/type/SequentialMapValueImpl;->array:[Lorg/msgpack/type/Value;

    add-int/lit8 v2, v0, 0x1

    aget-object v1, v1, v2

    goto :goto_3

    .line 63
    :cond_1c
    add-int/lit8 v0, v0, -0x2

    goto :goto_9
.end method

.method public getKeyValueArray()[Lorg/msgpack/type/Value;
    .registers 2

    .prologue
    .line 43
    iget-object v0, p0, Lorg/msgpack/type/SequentialMapValueImpl;->array:[Lorg/msgpack/type/Value;

    return-object v0
.end method

.method public hashCode()I
    .registers 6

    .prologue
    .line 307
    const/4 v0, 0x0

    .line 308
    .local v0, "h":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2
    iget-object v2, p0, Lorg/msgpack/type/SequentialMapValueImpl;->array:[Lorg/msgpack/type/Value;

    array-length v2, v2

    if-ge v1, v2, :cond_1e

    .line 309
    iget-object v2, p0, Lorg/msgpack/type/SequentialMapValueImpl;->array:[Lorg/msgpack/type/Value;

    aget-object v2, v2, v1

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    iget-object v3, p0, Lorg/msgpack/type/SequentialMapValueImpl;->array:[Lorg/msgpack/type/Value;

    add-int/lit8 v4, v1, 0x1

    aget-object v3, v3, v4

    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    xor-int/2addr v2, v3

    add-int/2addr v0, v2

    .line 308
    add-int/lit8 v1, v1, 0x2

    goto :goto_2

    .line 311
    :cond_1e
    return v0
.end method

.method public keySet()Ljava/util/Set;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Lorg/msgpack/type/Value;",
            ">;"
        }
    .end annotation

    .prologue
    .line 217
    new-instance v0, Lorg/msgpack/type/SequentialMapValueImpl$KeySet;

    iget-object v1, p0, Lorg/msgpack/type/SequentialMapValueImpl;->array:[Lorg/msgpack/type/Value;

    invoke-direct {v0, v1}, Lorg/msgpack/type/SequentialMapValueImpl$KeySet;-><init>([Lorg/msgpack/type/Value;)V

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 316
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v0}, Lorg/msgpack/type/SequentialMapValueImpl;->toString(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toString(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .registers 5
    .param p1, "sb"    # Ljava/lang/StringBuilder;

    .prologue
    .line 321
    iget-object v1, p0, Lorg/msgpack/type/SequentialMapValueImpl;->array:[Lorg/msgpack/type/Value;

    array-length v1, v1

    if-nez v1, :cond_c

    .line 322
    const-string v1, "{}"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 335
    .end local p1    # "sb":Ljava/lang/StringBuilder;
    :goto_b
    return-object p1

    .line 324
    .restart local p1    # "sb":Ljava/lang/StringBuilder;
    :cond_c
    const-string v1, "{"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 325
    iget-object v1, p0, Lorg/msgpack/type/SequentialMapValueImpl;->array:[Lorg/msgpack/type/Value;

    const/4 v2, 0x0

    aget-object v1, v1, v2

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 326
    const-string v1, ":"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 327
    iget-object v1, p0, Lorg/msgpack/type/SequentialMapValueImpl;->array:[Lorg/msgpack/type/Value;

    const/4 v2, 0x1

    aget-object v1, v1, v2

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 328
    const/4 v0, 0x2

    .local v0, "i":I
    :goto_27
    iget-object v1, p0, Lorg/msgpack/type/SequentialMapValueImpl;->array:[Lorg/msgpack/type/Value;

    array-length v1, v1

    if-ge v0, v1, :cond_49

    .line 329
    const-string v1, ","

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 330
    iget-object v1, p0, Lorg/msgpack/type/SequentialMapValueImpl;->array:[Lorg/msgpack/type/Value;

    aget-object v1, v1, v0

    invoke-interface {v1, p1}, Lorg/msgpack/type/Value;->toString(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 331
    const-string v1, ":"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 332
    iget-object v1, p0, Lorg/msgpack/type/SequentialMapValueImpl;->array:[Lorg/msgpack/type/Value;

    add-int/lit8 v2, v0, 0x1

    aget-object v1, v1, v2

    invoke-interface {v1, p1}, Lorg/msgpack/type/Value;->toString(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 328
    add-int/lit8 v0, v0, 0x2

    goto :goto_27

    .line 334
    :cond_49
    const-string v1, "}"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_b
.end method

.method public values()Ljava/util/Collection;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lorg/msgpack/type/Value;",
            ">;"
        }
    .end annotation

    .prologue
    .line 222
    new-instance v0, Lorg/msgpack/type/SequentialMapValueImpl$ValueCollection;

    iget-object v1, p0, Lorg/msgpack/type/SequentialMapValueImpl;->array:[Lorg/msgpack/type/Value;

    invoke-direct {v0, v1}, Lorg/msgpack/type/SequentialMapValueImpl$ValueCollection;-><init>([Lorg/msgpack/type/Value;)V

    return-object v0
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
    .line 227
    iget-object v1, p0, Lorg/msgpack/type/SequentialMapValueImpl;->array:[Lorg/msgpack/type/Value;

    array-length v1, v1

    div-int/lit8 v1, v1, 0x2

    invoke-interface {p1, v1}, Lorg/msgpack/packer/Packer;->writeMapBegin(I)Lorg/msgpack/packer/Packer;

    .line 228
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_9
    iget-object v1, p0, Lorg/msgpack/type/SequentialMapValueImpl;->array:[Lorg/msgpack/type/Value;

    array-length v1, v1

    if-ge v0, v1, :cond_18

    .line 229
    iget-object v1, p0, Lorg/msgpack/type/SequentialMapValueImpl;->array:[Lorg/msgpack/type/Value;

    aget-object v1, v1, v0

    invoke-interface {v1, p1}, Lorg/msgpack/type/Value;->writeTo(Lorg/msgpack/packer/Packer;)V

    .line 228
    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    .line 231
    :cond_18
    invoke-interface {p1}, Lorg/msgpack/packer/Packer;->writeMapEnd()Lorg/msgpack/packer/Packer;

    .line 232
    return-void
.end method
