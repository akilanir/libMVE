.class public final Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;
.super Ljava/lang/Object;
.source "BeanPropertyMap.java"

# interfaces
.implements Ljava/lang/Iterable;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$IteratorImpl;,
        Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable",
        "<",
        "Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;",
        ">;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final _buckets:[Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;

.field private final _caseInsensitive:Z

.field private final _hashMask:I

.field private _nextBucketIndex:I

.field private final _size:I


# direct methods
.method public constructor <init>(Ljava/util/Collection;Z)V
    .registers 13
    .param p2, "caseInsensitivePropertyComparison"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .line 54
    .local p1, "properties":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    const/4 v6, 0x0

    iput v6, p0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->_nextBucketIndex:I

    .line 55
    iput-boolean p2, p0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->_caseInsensitive:Z

    .line 56
    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v6

    iput v6, p0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->_size:I

    .line 57
    iget v6, p0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->_size:I

    invoke-static {v6}, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->findSize(I)I

    move-result v0

    .line 58
    .local v0, "bucketCount":I
    add-int/lit8 v6, v0, -0x1

    iput v6, p0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->_hashMask:I

    .line 59
    new-array v1, v0, [Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;

    .line 60
    .local v1, "buckets":[Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_1e
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_46

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;

    .line 61
    .local v5, "property":Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;
    invoke-direct {p0, v5}, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->getPropertyName(Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;)Ljava/lang/String;

    move-result-object v4

    .line 62
    .local v4, "key":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    move-result v6

    iget v7, p0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->_hashMask:I

    and-int v3, v6, v7

    .line 63
    .local v3, "index":I
    new-instance v6, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;

    aget-object v7, v1, v3

    iget v8, p0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->_nextBucketIndex:I

    add-int/lit8 v9, v8, 0x1

    iput v9, p0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->_nextBucketIndex:I

    invoke-direct {v6, v7, v4, v5, v8}, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;-><init>(Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;Ljava/lang/String;Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;I)V

    aput-object v6, v1, v3

    goto :goto_1e

    .line 65
    .end local v3    # "index":I
    .end local v4    # "key":Ljava/lang/String;
    .end local v5    # "property":Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;
    :cond_46
    iput-object v1, p0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->_buckets:[Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;

    .line 66
    return-void
.end method

.method private constructor <init>([Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;IIZ)V
    .registers 6
    .param p1, "buckets"    # [Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;
    .param p2, "size"    # I
    .param p3, "index"    # I
    .param p4, "caseInsensitivePropertyComparison"    # Z

    .prologue
    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    const/4 v0, 0x0

    iput v0, p0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->_nextBucketIndex:I

    .line 70
    iput-object p1, p0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->_buckets:[Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;

    .line 71
    iput p2, p0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->_size:I

    .line 72
    array-length v0, p1

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->_hashMask:I

    .line 73
    iput p3, p0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->_nextBucketIndex:I

    .line 74
    iput-boolean p4, p0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->_caseInsensitive:Z

    .line 75
    return-void
.end method

.method private final _findDeserializeAndSet2(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/Object;Ljava/lang/String;I)Z
    .registers 10
    .param p1, "p"    # Lcom/fasterxml/jackson/core/JsonParser;
    .param p2, "ctxt"    # Lcom/fasterxml/jackson/databind/DeserializationContext;
    .param p3, "bean"    # Ljava/lang/Object;
    .param p4, "key"    # Ljava/lang/String;
    .param p5, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 297
    const/4 v2, 0x0

    .line 298
    .local v2, "prop":Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;
    iget-object v3, p0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->_buckets:[Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;

    aget-object v0, v3, p5

    .line 300
    .local v0, "bucket":Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;
    :cond_5
    iget-object v0, v0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;->next:Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;

    if-nez v0, :cond_11

    .line 301
    invoke-direct {p0, p4, p5}, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->_findWithEquals(Ljava/lang/String;I)Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;

    move-result-object v2

    .line 302
    if-nez v2, :cond_17

    .line 303
    const/4 v3, 0x0

    .line 317
    :goto_10
    return v3

    .line 307
    :cond_11
    iget-object v3, v0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;->key:Ljava/lang/String;

    if-ne v3, p4, :cond_5

    .line 308
    iget-object v2, v0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;->value:Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;

    .line 313
    :cond_17
    :try_start_17
    invoke-virtual {v2, p1, p2, p3}, Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;->deserializeAndSet(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/Object;)V
    :try_end_1a
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_1a} :catch_1c

    .line 317
    :goto_1a
    const/4 v3, 0x1

    goto :goto_10

    .line 314
    :catch_1c
    move-exception v1

    .line 315
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {p0, v1, p3, p4, p2}, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->wrapAndThrow(Ljava/lang/Throwable;Ljava/lang/Object;Ljava/lang/String;Lcom/fasterxml/jackson/databind/DeserializationContext;)V

    goto :goto_1a
.end method

.method private _findWithEquals(Ljava/lang/String;I)Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;
    .registers 5
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "index"    # I

    .prologue
    .line 403
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->_buckets:[Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;

    aget-object v0, v1, p2

    .line 404
    .local v0, "bucket":Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;
    :goto_4
    if-eqz v0, :cond_14

    .line 405
    iget-object v1, v0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;->key:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_11

    .line 406
    iget-object v1, v0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;->value:Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;

    .line 410
    :goto_10
    return-object v1

    .line 408
    :cond_11
    iget-object v0, v0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;->next:Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;

    goto :goto_4

    .line 410
    :cond_14
    const/4 v1, 0x0

    goto :goto_10
.end method

.method private static final findSize(I)I
    .registers 4
    .param p0, "size"    # I

    .prologue
    .line 156
    const/16 v2, 0x20

    if-gt p0, v2, :cond_b

    add-int v0, p0, p0

    .line 157
    .local v0, "needed":I
    :goto_6
    const/4 v1, 0x2

    .line 158
    .local v1, "result":I
    :goto_7
    if-ge v1, v0, :cond_10

    .line 159
    add-int/2addr v1, v1

    goto :goto_7

    .line 156
    .end local v0    # "needed":I
    .end local v1    # "result":I
    :cond_b
    shr-int/lit8 v2, p0, 0x2

    add-int v0, p0, v2

    goto :goto_6

    .line 161
    .restart local v0    # "needed":I
    .restart local v1    # "result":I
    :cond_10
    return v1
.end method

.method private getPropertyName(Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;)Ljava/lang/String;
    .registers 3
    .param p1, "prop"    # Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;

    .prologue
    .line 167
    iget-boolean v0, p0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->_caseInsensitive:Z

    if-eqz v0, :cond_d

    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    :goto_c
    return-object v0

    :cond_d
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_c
.end method


# virtual methods
.method public assignIndexes()Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;
    .registers 8

    .prologue
    .line 143
    const/4 v3, 0x0

    .line 144
    .local v3, "index":I
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->_buckets:[Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;

    .local v0, "arr$":[Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_5
    if-ge v2, v5, :cond_1b

    aget-object v1, v0, v2

    .local v1, "bucket":Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;
    move v4, v3

    .line 145
    .end local v3    # "index":I
    .local v4, "index":I
    :goto_a
    if-eqz v1, :cond_17

    .line 146
    iget-object v6, v1, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;->value:Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;

    add-int/lit8 v3, v4, 0x1

    .end local v4    # "index":I
    .restart local v3    # "index":I
    invoke-virtual {v6, v4}, Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;->assignIndex(I)V

    .line 147
    iget-object v1, v1, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;->next:Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;

    move v4, v3

    .end local v3    # "index":I
    .restart local v4    # "index":I
    goto :goto_a

    .line 144
    :cond_17
    add-int/lit8 v2, v2, 0x1

    move v3, v4

    .end local v4    # "index":I
    .restart local v3    # "index":I
    goto :goto_5

    .line 150
    .end local v1    # "bucket":Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;
    :cond_1b
    return-object p0
.end method

.method public find(I)Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;
    .registers 6
    .param p1, "propertyIndex"    # I

    .prologue
    .line 325
    const/4 v2, 0x0

    .local v2, "i":I
    iget-object v3, p0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->_buckets:[Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;

    array-length v1, v3

    .local v1, "end":I
    :goto_4
    if-ge v2, v1, :cond_19

    .line 326
    iget-object v3, p0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->_buckets:[Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;

    aget-object v0, v3, v2

    .local v0, "bucket":Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;
    :goto_a
    if-eqz v0, :cond_16

    .line 327
    iget v3, v0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;->index:I

    if-ne v3, p1, :cond_13

    .line 328
    iget-object v3, v0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;->value:Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;

    .line 332
    .end local v0    # "bucket":Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;
    :goto_12
    return-object v3

    .line 326
    .restart local v0    # "bucket":Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;
    :cond_13
    iget-object v0, v0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;->next:Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;

    goto :goto_a

    .line 325
    :cond_16
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 332
    .end local v0    # "bucket":Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;
    :cond_19
    const/4 v3, 0x0

    goto :goto_12
.end method

.method public find(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;
    .registers 6
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 236
    if-nez p1, :cond_a

    .line 237
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Can not pass null property name"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 239
    :cond_a
    iget-boolean v2, p0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->_caseInsensitive:Z

    if-eqz v2, :cond_12

    .line 240
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    .line 242
    :cond_12
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v2

    iget v3, p0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->_hashMask:I

    and-int v1, v2, v3

    .line 243
    .local v1, "index":I
    iget-object v2, p0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->_buckets:[Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;

    aget-object v0, v2, v1

    .line 245
    .local v0, "bucket":Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;
    if-nez v0, :cond_22

    .line 246
    const/4 v2, 0x0

    .line 258
    :goto_21
    return-object v2

    .line 249
    :cond_22
    iget-object v2, v0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;->key:Ljava/lang/String;

    if-ne v2, p1, :cond_29

    .line 250
    iget-object v2, v0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;->value:Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;

    goto :goto_21

    .line 252
    :cond_29
    iget-object v0, v0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;->next:Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;

    if-eqz v0, :cond_34

    .line 253
    iget-object v2, v0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;->key:Ljava/lang/String;

    if-ne v2, p1, :cond_29

    .line 254
    iget-object v2, v0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;->value:Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;

    goto :goto_21

    .line 258
    :cond_34
    invoke-direct {p0, p1, v1}, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->_findWithEquals(Ljava/lang/String;I)Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;

    move-result-object v2

    goto :goto_21
.end method

.method public findDeserializeAndSet(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/Object;Ljava/lang/String;)Z
    .registers 13
    .param p1, "p"    # Lcom/fasterxml/jackson/core/JsonParser;
    .param p2, "ctxt"    # Lcom/fasterxml/jackson/databind/DeserializationContext;
    .param p3, "bean"    # Ljava/lang/Object;
    .param p4, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 273
    iget-boolean v0, p0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->_caseInsensitive:Z

    if-eqz v0, :cond_8

    .line 274
    invoke-virtual {p4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p4

    .line 276
    :cond_8
    invoke-virtual {p4}, Ljava/lang/String;->hashCode()I

    move-result v0

    iget v1, p0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->_hashMask:I

    and-int v5, v0, v1

    .line 277
    .local v5, "index":I
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->_buckets:[Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;

    aget-object v6, v0, v5

    .line 279
    .local v6, "bucket":Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;
    if-nez v6, :cond_18

    .line 280
    const/4 v0, 0x0

    .line 291
    :goto_17
    return v0

    .line 283
    :cond_18
    iget-object v0, v6, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;->key:Ljava/lang/String;

    if-ne v0, p4, :cond_28

    .line 285
    :try_start_1c
    iget-object v0, v6, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;->value:Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;

    invoke-virtual {v0, p1, p2, p3}, Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;->deserializeAndSet(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/Object;)V
    :try_end_21
    .catch Ljava/lang/Exception; {:try_start_1c .. :try_end_21} :catch_23

    .line 289
    :goto_21
    const/4 v0, 0x1

    goto :goto_17

    .line 286
    :catch_23
    move-exception v7

    .line 287
    .local v7, "e":Ljava/lang/Exception;
    invoke-virtual {p0, v7, p3, p4, p2}, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->wrapAndThrow(Ljava/lang/Throwable;Ljava/lang/Object;Ljava/lang/String;Lcom/fasterxml/jackson/databind/DeserializationContext;)V

    goto :goto_21

    .end local v7    # "e":Ljava/lang/Exception;
    :cond_28
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    .line 291
    invoke-direct/range {v0 .. v5}, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->_findDeserializeAndSet2(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/Object;Ljava/lang/String;I)Z

    move-result v0

    goto :goto_17
.end method

.method public getPropertiesInInsertionOrder()[Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;
    .registers 10

    .prologue
    .line 216
    iget v3, p0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->_nextBucketIndex:I

    .line 217
    .local v3, "len":I
    new-array v5, v3, [Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;

    .line 218
    .local v5, "result":[Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->_buckets:[Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;

    .local v0, "arr$":[Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_8
    if-ge v2, v4, :cond_1b

    aget-object v6, v0, v2

    .line 219
    .local v6, "root":Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;
    move-object v1, v6

    .local v1, "bucket":Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;
    :goto_d
    if-eqz v1, :cond_18

    .line 220
    iget v7, v1, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;->index:I

    iget-object v8, v1, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;->value:Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;

    aput-object v8, v5, v7

    .line 219
    iget-object v1, v1, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;->next:Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;

    goto :goto_d

    .line 218
    :cond_18
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    .line 223
    .end local v1    # "bucket":Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;
    .end local v6    # "root":Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;
    :cond_1b
    return-object v5
.end method

.method public iterator()Ljava/util/Iterator;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;",
            ">;"
        }
    .end annotation

    .prologue
    .line 203
    new-instance v0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$IteratorImpl;

    iget-object v1, p0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->_buckets:[Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;

    invoke-direct {v0, v1}, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$IteratorImpl;-><init>([Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;)V

    return-object v0
.end method

.method public remove(Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;)V
    .registers 11
    .param p1, "property"    # Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;

    .prologue
    .line 376
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->getPropertyName(Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;)Ljava/lang/String;

    move-result-object v3

    .line 377
    .local v3, "name":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v6

    iget-object v7, p0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->_buckets:[Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;

    array-length v7, v7

    add-int/lit8 v7, v7, -0x1

    and-int v2, v6, v7

    .line 378
    .local v2, "index":I
    const/4 v4, 0x0

    .line 379
    .local v4, "tail":Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;
    const/4 v1, 0x0

    .line 381
    .local v1, "found":Z
    iget-object v6, p0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->_buckets:[Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;

    aget-object v0, v6, v2

    .local v0, "bucket":Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;
    move-object v5, v4

    .end local v4    # "tail":Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;
    .local v5, "tail":Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;
    :goto_16
    if-eqz v0, :cond_34

    .line 383
    if-nez v1, :cond_28

    iget-object v6, v0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;->key:Ljava/lang/String;

    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_28

    .line 384
    const/4 v1, 0x1

    move-object v4, v5

    .line 381
    .end local v5    # "tail":Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;
    .restart local v4    # "tail":Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;
    :goto_24
    iget-object v0, v0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;->next:Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;

    move-object v5, v4

    .end local v4    # "tail":Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;
    .restart local v5    # "tail":Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;
    goto :goto_16

    .line 386
    :cond_28
    new-instance v4, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;

    iget-object v6, v0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;->key:Ljava/lang/String;

    iget-object v7, v0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;->value:Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;

    iget v8, v0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;->index:I

    invoke-direct {v4, v5, v6, v7, v8}, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;-><init>(Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;Ljava/lang/String;Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;I)V

    .end local v5    # "tail":Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;
    .restart local v4    # "tail":Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;
    goto :goto_24

    .line 389
    .end local v4    # "tail":Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;
    .restart local v5    # "tail":Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;
    :cond_34
    if-nez v1, :cond_55

    .line 390
    new-instance v6, Ljava/util/NoSuchElementException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "No entry \'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\' found, can\'t remove"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 392
    :cond_55
    iget-object v6, p0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->_buckets:[Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;

    aput-object v5, v6, v2

    .line 393
    return-void
.end method

.method public renameAll(Lcom/fasterxml/jackson/databind/util/NameTransformer;)Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;
    .registers 10
    .param p1, "transformer"    # Lcom/fasterxml/jackson/databind/util/NameTransformer;

    .prologue
    .line 116
    if-eqz p1, :cond_6

    sget-object v6, Lcom/fasterxml/jackson/databind/util/NameTransformer;->NOP:Lcom/fasterxml/jackson/databind/util/NameTransformer;

    if-ne p1, v6, :cond_7

    .line 137
    .end local p0    # "this":Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;
    :cond_6
    :goto_6
    return-object p0

    .line 119
    .restart local p0    # "this":Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;
    :cond_7
    invoke-virtual {p0}, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 120
    .local v1, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;>;"
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 121
    .local v4, "newProps":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;>;"
    :goto_10
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3c

    .line 122
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;

    .line 123
    .local v5, "prop":Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;
    invoke-virtual {v5}, Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1, v6}, Lcom/fasterxml/jackson/databind/util/NameTransformer;->transform(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 124
    .local v3, "newName":Ljava/lang/String;
    invoke-virtual {v5, v3}, Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;->withSimpleName(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;

    move-result-object v5

    .line 125
    invoke-virtual {v5}, Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;->getValueDeserializer()Lcom/fasterxml/jackson/databind/JsonDeserializer;

    move-result-object v0

    .line 126
    .local v0, "deser":Lcom/fasterxml/jackson/databind/JsonDeserializer;, "Lcom/fasterxml/jackson/databind/JsonDeserializer<*>;"
    if-eqz v0, :cond_38

    .line 128
    invoke-virtual {v0, p1}, Lcom/fasterxml/jackson/databind/JsonDeserializer;->unwrappingDeserializer(Lcom/fasterxml/jackson/databind/util/NameTransformer;)Lcom/fasterxml/jackson/databind/JsonDeserializer;

    move-result-object v2

    .line 130
    .local v2, "newDeser":Lcom/fasterxml/jackson/databind/JsonDeserializer;, "Lcom/fasterxml/jackson/databind/JsonDeserializer<Ljava/lang/Object;>;"
    if-eq v2, v0, :cond_38

    .line 131
    invoke-virtual {v5, v2}, Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;->withValueDeserializer(Lcom/fasterxml/jackson/databind/JsonDeserializer;)Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;

    move-result-object v5

    .line 134
    .end local v2    # "newDeser":Lcom/fasterxml/jackson/databind/JsonDeserializer;, "Lcom/fasterxml/jackson/databind/JsonDeserializer<Ljava/lang/Object;>;"
    :cond_38
    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_10

    .line 137
    .end local v0    # "deser":Lcom/fasterxml/jackson/databind/JsonDeserializer;, "Lcom/fasterxml/jackson/databind/JsonDeserializer<*>;"
    .end local v3    # "newName":Ljava/lang/String;
    .end local v5    # "prop":Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;
    :cond_3c
    new-instance v6, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;

    iget-boolean v7, p0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->_caseInsensitive:Z

    invoke-direct {v6, v4, v7}, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;-><init>(Ljava/util/Collection;Z)V

    move-object p0, v6

    goto :goto_6
.end method

.method public replace(Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;)V
    .registers 11
    .param p1, "property"    # Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;

    .prologue
    .line 342
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->getPropertyName(Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;)Ljava/lang/String;

    move-result-object v3

    .line 343
    .local v3, "name":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v6

    iget-object v7, p0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->_buckets:[Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;

    array-length v7, v7

    add-int/lit8 v7, v7, -0x1

    and-int v2, v6, v7

    .line 348
    .local v2, "index":I
    const/4 v4, 0x0

    .line 349
    .local v4, "tail":Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;
    const/4 v1, -0x1

    .line 351
    .local v1, "foundIndex":I
    iget-object v6, p0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->_buckets:[Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;

    aget-object v0, v6, v2

    .local v0, "bucket":Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;
    move-object v5, v4

    .end local v4    # "tail":Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;
    .local v5, "tail":Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;
    :goto_16
    if-eqz v0, :cond_35

    .line 353
    if-gez v1, :cond_29

    iget-object v6, v0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;->key:Ljava/lang/String;

    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_29

    .line 354
    iget v1, v0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;->index:I

    move-object v4, v5

    .line 351
    .end local v5    # "tail":Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;
    .restart local v4    # "tail":Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;
    :goto_25
    iget-object v0, v0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;->next:Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;

    move-object v5, v4

    .end local v4    # "tail":Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;
    .restart local v5    # "tail":Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;
    goto :goto_16

    .line 356
    :cond_29
    new-instance v4, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;

    iget-object v6, v0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;->key:Ljava/lang/String;

    iget-object v7, v0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;->value:Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;

    iget v8, v0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;->index:I

    invoke-direct {v4, v5, v6, v7, v8}, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;-><init>(Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;Ljava/lang/String;Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;I)V

    .end local v5    # "tail":Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;
    .restart local v4    # "tail":Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;
    goto :goto_25

    .line 360
    .end local v4    # "tail":Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;
    .restart local v5    # "tail":Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;
    :cond_35
    if-gez v1, :cond_56

    .line 361
    new-instance v6, Ljava/util/NoSuchElementException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "No entry \'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\' found, can\'t replace"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 366
    :cond_56
    iget-object v6, p0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->_buckets:[Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;

    new-instance v7, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;

    invoke-direct {v7, v5, v3, p1, v1}, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;-><init>(Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;Ljava/lang/String;Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;I)V

    aput-object v7, v6, v2

    .line 367
    return-void
.end method

.method public size()I
    .registers 2

    .prologue
    .line 232
    iget v0, p0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->_size:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 9

    .prologue
    .line 179
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 180
    .local v6, "sb":Ljava/lang/StringBuilder;
    const-string v7, "Properties=["

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 181
    const/4 v1, 0x0

    .line 182
    .local v1, "count":I
    invoke-virtual {p0}, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->getPropertiesInInsertionOrder()[Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;

    move-result-object v0

    .local v0, "arr$":[Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    move v2, v1

    .end local v1    # "count":I
    .local v2, "count":I
    :goto_12
    if-ge v3, v4, :cond_3f

    aget-object v5, v0, v3

    .line 183
    .local v5, "prop":Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;
    if-nez v5, :cond_1d

    move v1, v2

    .line 182
    .end local v2    # "count":I
    .restart local v1    # "count":I
    :goto_19
    add-int/lit8 v3, v3, 0x1

    move v2, v1

    .end local v1    # "count":I
    .restart local v2    # "count":I
    goto :goto_12

    .line 186
    :cond_1d
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "count":I
    .restart local v1    # "count":I
    if-lez v2, :cond_26

    .line 187
    const-string v7, ", "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 189
    :cond_26
    invoke-virtual {v5}, Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 190
    const/16 v7, 0x28

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 191
    invoke-virtual {v5}, Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;->getType()Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 192
    const/16 v7, 0x29

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_19

    .line 194
    .end local v1    # "count":I
    .end local v5    # "prop":Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;
    .restart local v2    # "count":I
    :cond_3f
    const/16 v7, 0x5d

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 195
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    return-object v7
.end method

.method public withProperty(Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;)Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;
    .registers 12
    .param p1, "newProperty"    # Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;

    .prologue
    const/4 v7, 0x0

    .line 89
    iget-object v6, p0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->_buckets:[Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;

    array-length v0, v6

    .line 90
    .local v0, "bcount":I
    new-array v2, v0, [Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;

    .line 91
    .local v2, "newBuckets":[Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;
    iget-object v6, p0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->_buckets:[Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;

    invoke-static {v6, v7, v2, v7, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 92
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->getPropertyName(Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;)Ljava/lang/String;

    move-result-object v5

    .line 94
    .local v5, "propName":Ljava/lang/String;
    invoke-virtual {p0, v5}, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->find(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;

    move-result-object v4

    .line 95
    .local v4, "oldProp":Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;
    if-nez v4, :cond_3a

    .line 99
    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    move-result v6

    iget v7, p0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->_hashMask:I

    and-int v1, v6, v7

    .line 100
    .local v1, "index":I
    new-instance v6, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;

    aget-object v7, v2, v1

    iget v8, p0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->_nextBucketIndex:I

    add-int/lit8 v9, v8, 0x1

    iput v9, p0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->_nextBucketIndex:I

    invoke-direct {v6, v7, v5, p1, v8}, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;-><init>(Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;Ljava/lang/String;Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;I)V

    aput-object v6, v2, v1

    .line 102
    new-instance v3, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;

    iget v6, p0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->_size:I

    add-int/lit8 v6, v6, 0x1

    iget v7, p0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->_nextBucketIndex:I

    iget-boolean v8, p0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->_caseInsensitive:Z

    invoke-direct {v3, v2, v6, v7, v8}, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;-><init>([Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;IIZ)V

    .line 107
    .end local v1    # "index":I
    :goto_39
    return-object v3

    .line 105
    :cond_3a
    new-instance v3, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;

    iget v6, p0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->_nextBucketIndex:I

    iget-boolean v7, p0, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->_caseInsensitive:Z

    invoke-direct {v3, v2, v0, v6, v7}, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;-><init>([Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap$Bucket;IIZ)V

    .line 106
    .local v3, "newMap":Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;
    invoke-virtual {v3, p1}, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->replace(Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;)V

    goto :goto_39
.end method

.method protected wrapAndThrow(Ljava/lang/Throwable;Ljava/lang/Object;Ljava/lang/String;Lcom/fasterxml/jackson/databind/DeserializationContext;)V
    .registers 7
    .param p1, "t"    # Ljava/lang/Throwable;
    .param p2, "bean"    # Ljava/lang/Object;
    .param p3, "fieldName"    # Ljava/lang/String;
    .param p4, "ctxt"    # Lcom/fasterxml/jackson/databind/DeserializationContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 420
    :goto_0
    instance-of v1, p1, Ljava/lang/reflect/InvocationTargetException;

    if-eqz v1, :cond_f

    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_f

    .line 421
    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object p1

    goto :goto_0

    .line 424
    :cond_f
    instance-of v1, p1, Ljava/lang/Error;

    if-eqz v1, :cond_16

    .line 425
    check-cast p1, Ljava/lang/Error;

    .end local p1    # "t":Ljava/lang/Throwable;
    throw p1

    .line 428
    .restart local p1    # "t":Ljava/lang/Throwable;
    :cond_16
    if-eqz p4, :cond_20

    sget-object v1, Lcom/fasterxml/jackson/databind/DeserializationFeature;->WRAP_EXCEPTIONS:Lcom/fasterxml/jackson/databind/DeserializationFeature;

    invoke-virtual {p4, v1}, Lcom/fasterxml/jackson/databind/DeserializationContext;->isEnabled(Lcom/fasterxml/jackson/databind/DeserializationFeature;)Z

    move-result v1

    if-eqz v1, :cond_2e

    :cond_20
    const/4 v0, 0x1

    .line 430
    .local v0, "wrap":Z
    :goto_21
    instance-of v1, p1, Ljava/io/IOException;

    if-eqz v1, :cond_30

    .line 431
    if-eqz v0, :cond_2b

    instance-of v1, p1, Lcom/fasterxml/jackson/core/JsonProcessingException;

    if-nez v1, :cond_39

    .line 432
    :cond_2b
    check-cast p1, Ljava/io/IOException;

    .end local p1    # "t":Ljava/lang/Throwable;
    throw p1

    .line 428
    .end local v0    # "wrap":Z
    .restart local p1    # "t":Ljava/lang/Throwable;
    :cond_2e
    const/4 v0, 0x0

    goto :goto_21

    .line 434
    .restart local v0    # "wrap":Z
    :cond_30
    if-nez v0, :cond_39

    .line 435
    instance-of v1, p1, Ljava/lang/RuntimeException;

    if-eqz v1, :cond_39

    .line 436
    check-cast p1, Ljava/lang/RuntimeException;

    .end local p1    # "t":Ljava/lang/Throwable;
    throw p1

    .line 439
    .restart local p1    # "t":Ljava/lang/Throwable;
    :cond_39
    invoke-static {p1, p2, p3}, Lcom/fasterxml/jackson/databind/JsonMappingException;->wrapWithPath(Ljava/lang/Throwable;Ljava/lang/Object;Ljava/lang/String;)Lcom/fasterxml/jackson/databind/JsonMappingException;

    move-result-object v1

    throw v1
.end method
