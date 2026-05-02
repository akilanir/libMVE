.class public abstract Lorg/spongycastle/asn1/ASN1Set;
.super Lorg/spongycastle/asn1/ASN1Primitive;
.source "ASN1Set.java"

# interfaces
.implements Lorg/spongycastle/util/Iterable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/spongycastle/asn1/ASN1Primitive;",
        "Lorg/spongycastle/util/Iterable",
        "<",
        "Lorg/spongycastle/asn1/ASN1Encodable;",
        ">;"
    }
.end annotation


# instance fields
.field private isSorted:Z

.field private set:Ljava/util/Vector;


# direct methods
.method protected constructor <init>()V
    .registers 2

    .prologue
    .line 225
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Primitive;-><init>()V

    .line 101
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/asn1/ASN1Set;->set:Ljava/util/Vector;

    .line 102
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/spongycastle/asn1/ASN1Set;->isSorted:Z

    .line 226
    return-void
.end method

.method protected constructor <init>(Lorg/spongycastle/asn1/ASN1Encodable;)V
    .registers 3
    .param p1, "obj"    # Lorg/spongycastle/asn1/ASN1Encodable;

    .prologue
    .line 234
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Primitive;-><init>()V

    .line 101
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/asn1/ASN1Set;->set:Ljava/util/Vector;

    .line 102
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/spongycastle/asn1/ASN1Set;->isSorted:Z

    .line 235
    iget-object v0, p0, Lorg/spongycastle/asn1/ASN1Set;->set:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 236
    return-void
.end method

.method protected constructor <init>(Lorg/spongycastle/asn1/ASN1EncodableVector;Z)V
    .registers 6
    .param p1, "v"    # Lorg/spongycastle/asn1/ASN1EncodableVector;
    .param p2, "doSort"    # Z

    .prologue
    .line 246
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Primitive;-><init>()V

    .line 101
    new-instance v1, Ljava/util/Vector;

    invoke-direct {v1}, Ljava/util/Vector;-><init>()V

    iput-object v1, p0, Lorg/spongycastle/asn1/ASN1Set;->set:Ljava/util/Vector;

    .line 102
    const/4 v1, 0x0

    iput-boolean v1, p0, Lorg/spongycastle/asn1/ASN1Set;->isSorted:Z

    .line 247
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_e
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->size()I

    move-result v1

    if-eq v0, v1, :cond_20

    .line 249
    iget-object v1, p0, Lorg/spongycastle/asn1/ASN1Set;->set:Ljava/util/Vector;

    invoke-virtual {p1, v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;->get(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 247
    add-int/lit8 v0, v0, 0x1

    goto :goto_e

    .line 252
    :cond_20
    if-eqz p2, :cond_25

    .line 254
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1Set;->sort()V

    .line 256
    :cond_25
    return-void
.end method

.method protected constructor <init>([Lorg/spongycastle/asn1/ASN1Encodable;Z)V
    .registers 6
    .param p1, "array"    # [Lorg/spongycastle/asn1/ASN1Encodable;
    .param p2, "doSort"    # Z

    .prologue
    .line 264
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Primitive;-><init>()V

    .line 101
    new-instance v1, Ljava/util/Vector;

    invoke-direct {v1}, Ljava/util/Vector;-><init>()V

    iput-object v1, p0, Lorg/spongycastle/asn1/ASN1Set;->set:Ljava/util/Vector;

    .line 102
    const/4 v1, 0x0

    iput-boolean v1, p0, Lorg/spongycastle/asn1/ASN1Set;->isSorted:Z

    .line 265
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_e
    array-length v1, p1

    if-eq v0, v1, :cond_1b

    .line 267
    iget-object v1, p0, Lorg/spongycastle/asn1/ASN1Set;->set:Ljava/util/Vector;

    aget-object v2, p1, v0

    invoke-virtual {v1, v2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 265
    add-int/lit8 v0, v0, 0x1

    goto :goto_e

    .line 270
    :cond_1b
    if-eqz p2, :cond_20

    .line 272
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1Set;->sort()V

    .line 274
    :cond_20
    return-void
.end method

.method private getDEREncoded(Lorg/spongycastle/asn1/ASN1Encodable;)[B
    .registers 5
    .param p1, "obj"    # Lorg/spongycastle/asn1/ASN1Encodable;

    .prologue
    .line 492
    :try_start_0
    invoke-interface {p1}, Lorg/spongycastle/asn1/ASN1Encodable;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v1

    const-string v2, "DER"

    invoke-virtual {v1, v2}, Lorg/spongycastle/asn1/ASN1Primitive;->getEncoded(Ljava/lang/String;)[B
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_9} :catch_b

    move-result-object v1

    return-object v1

    .line 494
    :catch_b
    move-exception v0

    .line 496
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "cannot encode object added to SET"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Set;
    .registers 6
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 114
    if-eqz p0, :cond_6

    instance-of v2, p0, Lorg/spongycastle/asn1/ASN1Set;

    if-eqz v2, :cond_a

    .line 116
    :cond_6
    check-cast p0, Lorg/spongycastle/asn1/ASN1Set;

    .end local p0    # "obj":Ljava/lang/Object;
    move-object v1, p0

    .line 139
    .restart local p0    # "obj":Ljava/lang/Object;
    :goto_9
    return-object v1

    .line 118
    :cond_a
    instance-of v2, p0, Lorg/spongycastle/asn1/ASN1SetParser;

    if-eqz v2, :cond_19

    .line 120
    check-cast p0, Lorg/spongycastle/asn1/ASN1SetParser;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-interface {p0}, Lorg/spongycastle/asn1/ASN1SetParser;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v2

    invoke-static {v2}, Lorg/spongycastle/asn1/ASN1Set;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Set;

    move-result-object v1

    goto :goto_9

    .line 122
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_19
    instance-of v2, p0, [B

    if-eqz v2, :cond_48

    .line 126
    :try_start_1d
    check-cast p0, [B

    .end local p0    # "obj":Ljava/lang/Object;
    check-cast p0, [B

    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1Primitive;->fromByteArray([B)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v2

    invoke-static {v2}, Lorg/spongycastle/asn1/ASN1Set;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Set;
    :try_end_28
    .catch Ljava/io/IOException; {:try_start_1d .. :try_end_28} :catch_2a

    move-result-object v1

    goto :goto_9

    .line 128
    :catch_2a
    move-exception v0

    .line 130
    .local v0, "e":Ljava/io/IOException;
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "failed to construct set from byte[]: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 133
    .end local v0    # "e":Ljava/io/IOException;
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_48
    instance-of v2, p0, Lorg/spongycastle/asn1/ASN1Encodable;

    if-eqz v2, :cond_5a

    move-object v2, p0

    .line 135
    check-cast v2, Lorg/spongycastle/asn1/ASN1Encodable;

    invoke-interface {v2}, Lorg/spongycastle/asn1/ASN1Encodable;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v1

    .line 137
    .local v1, "primitive":Lorg/spongycastle/asn1/ASN1Primitive;
    instance-of v2, v1, Lorg/spongycastle/asn1/ASN1Set;

    if-eqz v2, :cond_5a

    .line 139
    check-cast v1, Lorg/spongycastle/asn1/ASN1Set;

    goto :goto_9

    .line 143
    .end local v1    # "primitive":Lorg/spongycastle/asn1/ASN1Primitive;
    :cond_5a
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "unknown object in getInstance: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public static getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1Set;
    .registers 6
    .param p0, "obj"    # Lorg/spongycastle/asn1/ASN1TaggedObject;
    .param p1, "explicit"    # Z

    .prologue
    .line 167
    if-eqz p1, :cond_17

    .line 169
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1TaggedObject;->isExplicit()Z

    move-result v1

    if-nez v1, :cond_10

    .line 171
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "object implicit - explicit expected."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 174
    :cond_10
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v1

    check-cast v1, Lorg/spongycastle/asn1/ASN1Set;

    .line 215
    :goto_16
    return-object v1

    .line 183
    :cond_17
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1TaggedObject;->isExplicit()Z

    move-result v1

    if-eqz v1, :cond_35

    .line 185
    instance-of v1, p0, Lorg/spongycastle/asn1/BERTaggedObject;

    if-eqz v1, :cond_2b

    .line 187
    new-instance v1, Lorg/spongycastle/asn1/BERSet;

    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/spongycastle/asn1/BERSet;-><init>(Lorg/spongycastle/asn1/ASN1Encodable;)V

    goto :goto_16

    .line 191
    :cond_2b
    new-instance v1, Lorg/spongycastle/asn1/DLSet;

    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/spongycastle/asn1/DLSet;-><init>(Lorg/spongycastle/asn1/ASN1Encodable;)V

    goto :goto_16

    .line 196
    :cond_35
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v1

    instance-of v1, v1, Lorg/spongycastle/asn1/ASN1Set;

    if-eqz v1, :cond_44

    .line 198
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v1

    check-cast v1, Lorg/spongycastle/asn1/ASN1Set;

    goto :goto_16

    .line 205
    :cond_44
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v1

    instance-of v1, v1, Lorg/spongycastle/asn1/ASN1Sequence;

    if-eqz v1, :cond_6a

    .line 207
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/asn1/ASN1Sequence;

    .line 209
    .local v0, "s":Lorg/spongycastle/asn1/ASN1Sequence;
    instance-of v1, p0, Lorg/spongycastle/asn1/BERTaggedObject;

    if-eqz v1, :cond_60

    .line 211
    new-instance v1, Lorg/spongycastle/asn1/BERSet;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1Sequence;->toArray()[Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/spongycastle/asn1/BERSet;-><init>([Lorg/spongycastle/asn1/ASN1Encodable;)V

    goto :goto_16

    .line 215
    :cond_60
    new-instance v1, Lorg/spongycastle/asn1/DLSet;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1Sequence;->toArray()[Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/spongycastle/asn1/DLSet;-><init>([Lorg/spongycastle/asn1/ASN1Encodable;)V

    goto :goto_16

    .line 221
    .end local v0    # "s":Lorg/spongycastle/asn1/ASN1Sequence;
    :cond_6a
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "unknown object in getInstance: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private getNext(Ljava/util/Enumeration;)Lorg/spongycastle/asn1/ASN1Encodable;
    .registers 3
    .param p1, "e"    # Ljava/util/Enumeration;

    .prologue
    .line 458
    invoke-interface {p1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/asn1/ASN1Encodable;

    .line 461
    .local v0, "encObj":Lorg/spongycastle/asn1/ASN1Encodable;
    if-nez v0, :cond_a

    .line 463
    sget-object v0, Lorg/spongycastle/asn1/DERNull;->INSTANCE:Lorg/spongycastle/asn1/DERNull;

    .line 466
    .end local v0    # "encObj":Lorg/spongycastle/asn1/ASN1Encodable;
    :cond_a
    return-object v0
.end method

.method private lessThanOrEqual([B[B)Z
    .registers 9
    .param p1, "a"    # [B
    .param p2, "b"    # [B

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 476
    array-length v4, p1

    array-length v5, p2

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 477
    .local v1, "len":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_9
    if-eq v0, v1, :cond_21

    .line 479
    aget-byte v4, p1, v0

    aget-byte v5, p2, v0

    if-eq v4, v5, :cond_1e

    .line 481
    aget-byte v4, p1, v0

    and-int/lit16 v4, v4, 0xff

    aget-byte v5, p2, v0

    and-int/lit16 v5, v5, 0xff

    if-ge v4, v5, :cond_1c

    .line 484
    :cond_1b
    :goto_1b
    return v2

    :cond_1c
    move v2, v3

    .line 481
    goto :goto_1b

    .line 477
    :cond_1e
    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    .line 484
    :cond_21
    array-length v4, p1

    if-eq v1, v4, :cond_1b

    move v2, v3

    goto :goto_1b
.end method


# virtual methods
.method asn1Equals(Lorg/spongycastle/asn1/ASN1Primitive;)Z
    .registers 12
    .param p1, "o"    # Lorg/spongycastle/asn1/ASN1Primitive;

    .prologue
    const/4 v7, 0x0

    .line 422
    instance-of v8, p1, Lorg/spongycastle/asn1/ASN1Set;

    if-nez v8, :cond_6

    .line 453
    :cond_5
    :goto_5
    return v7

    :cond_6
    move-object v4, p1

    .line 427
    check-cast v4, Lorg/spongycastle/asn1/ASN1Set;

    .line 429
    .local v4, "other":Lorg/spongycastle/asn1/ASN1Set;
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1Set;->size()I

    move-result v8

    invoke-virtual {v4}, Lorg/spongycastle/asn1/ASN1Set;->size()I

    move-result v9

    if-ne v8, v9, :cond_5

    .line 434
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1Set;->getObjects()Ljava/util/Enumeration;

    move-result-object v5

    .line 435
    .local v5, "s1":Ljava/util/Enumeration;
    invoke-virtual {v4}, Lorg/spongycastle/asn1/ASN1Set;->getObjects()Ljava/util/Enumeration;

    move-result-object v6

    .line 437
    .local v6, "s2":Ljava/util/Enumeration;
    :cond_1b
    :goto_1b
    invoke-interface {v5}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v8

    if-eqz v8, :cond_3a

    .line 439
    invoke-direct {p0, v5}, Lorg/spongycastle/asn1/ASN1Set;->getNext(Ljava/util/Enumeration;)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v2

    .line 440
    .local v2, "obj1":Lorg/spongycastle/asn1/ASN1Encodable;
    invoke-direct {p0, v6}, Lorg/spongycastle/asn1/ASN1Set;->getNext(Ljava/util/Enumeration;)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v3

    .line 442
    .local v3, "obj2":Lorg/spongycastle/asn1/ASN1Encodable;
    invoke-interface {v2}, Lorg/spongycastle/asn1/ASN1Encodable;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    .line 443
    .local v0, "o1":Lorg/spongycastle/asn1/ASN1Primitive;
    invoke-interface {v3}, Lorg/spongycastle/asn1/ASN1Encodable;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v1

    .line 445
    .local v1, "o2":Lorg/spongycastle/asn1/ASN1Primitive;
    if-eq v0, v1, :cond_1b

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1Primitive;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_5

    goto :goto_1b

    .line 453
    .end local v0    # "o1":Lorg/spongycastle/asn1/ASN1Primitive;
    .end local v1    # "o2":Lorg/spongycastle/asn1/ASN1Primitive;
    .end local v2    # "obj1":Lorg/spongycastle/asn1/ASN1Encodable;
    .end local v3    # "obj2":Lorg/spongycastle/asn1/ASN1Encodable;
    :cond_3a
    const/4 v7, 0x1

    goto :goto_5
.end method

.method abstract encode(Lorg/spongycastle/asn1/ASN1OutputStream;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 290
    iget-object v0, p0, Lorg/spongycastle/asn1/ASN1Set;->set:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/asn1/ASN1Encodable;

    return-object v0
.end method

.method public getObjects()Ljava/util/Enumeration;
    .registers 2

    .prologue
    .line 278
    iget-object v0, p0, Lorg/spongycastle/asn1/ASN1Set;->set:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .registers 5

    .prologue
    .line 359
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1Set;->getObjects()Ljava/util/Enumeration;

    move-result-object v0

    .line 360
    .local v0, "e":Ljava/util/Enumeration;
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1Set;->size()I

    move-result v1

    .line 362
    .local v1, "hashCode":I
    :goto_8
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_1a

    .line 364
    invoke-direct {p0, v0}, Lorg/spongycastle/asn1/ASN1Set;->getNext(Ljava/util/Enumeration;)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v2

    .line 365
    .local v2, "o":Lorg/spongycastle/asn1/ASN1Encodable;
    mul-int/lit8 v1, v1, 0x11

    .line 367
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v3

    xor-int/2addr v1, v3

    .line 368
    goto :goto_8

    .line 370
    .end local v2    # "o":Lorg/spongycastle/asn1/ASN1Encodable;
    :cond_1a
    return v1
.end method

.method isConstructed()Z
    .registers 2

    .prologue
    .line 548
    const/4 v0, 0x1

    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lorg/spongycastle/asn1/ASN1Encodable;",
            ">;"
        }
    .end annotation

    .prologue
    .line 561
    new-instance v0, Lorg/spongycastle/util/Arrays$Iterator;

    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1Set;->toArray()[Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/util/Arrays$Iterator;-><init>([Ljava/lang/Object;)V

    return-object v0
.end method

.method public parser()Lorg/spongycastle/asn1/ASN1SetParser;
    .registers 3

    .prologue
    .line 317
    move-object v0, p0

    .line 319
    .local v0, "outer":Lorg/spongycastle/asn1/ASN1Set;
    new-instance v1, Lorg/spongycastle/asn1/ASN1Set$1;

    invoke-direct {v1, p0, v0}, Lorg/spongycastle/asn1/ASN1Set$1;-><init>(Lorg/spongycastle/asn1/ASN1Set;Lorg/spongycastle/asn1/ASN1Set;)V

    return-object v1
.end method

.method public size()I
    .registers 2

    .prologue
    .line 300
    iget-object v0, p0, Lorg/spongycastle/asn1/ASN1Set;->set:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    return v0
.end method

.method protected sort()V
    .registers 11

    .prologue
    const/4 v8, 0x1

    .line 502
    iget-boolean v7, p0, Lorg/spongycastle/asn1/ASN1Set;->isSorted:Z

    if-nez v7, :cond_63

    .line 504
    iput-boolean v8, p0, Lorg/spongycastle/asn1/ASN1Set;->isSorted:Z

    .line 505
    iget-object v7, p0, Lorg/spongycastle/asn1/ASN1Set;->set:Ljava/util/Vector;

    invoke-virtual {v7}, Ljava/util/Vector;->size()I

    move-result v7

    if-le v7, v8, :cond_63

    .line 507
    const/4 v6, 0x1

    .line 508
    .local v6, "swapped":Z
    iget-object v7, p0, Lorg/spongycastle/asn1/ASN1Set;->set:Ljava/util/Vector;

    invoke-virtual {v7}, Ljava/util/Vector;->size()I

    move-result v7

    add-int/lit8 v3, v7, -0x1

    .line 510
    .local v3, "lastSwap":I
    :goto_18
    if-eqz v6, :cond_63

    .line 512
    const/4 v2, 0x0

    .line 513
    .local v2, "index":I
    const/4 v5, 0x0

    .line 514
    .local v5, "swapIndex":I
    iget-object v7, p0, Lorg/spongycastle/asn1/ASN1Set;->set:Ljava/util/Vector;

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/spongycastle/asn1/ASN1Encodable;

    invoke-direct {p0, v7}, Lorg/spongycastle/asn1/ASN1Set;->getDEREncoded(Lorg/spongycastle/asn1/ASN1Encodable;)[B

    move-result-object v0

    .line 516
    .local v0, "a":[B
    const/4 v6, 0x0

    .line 518
    :goto_2a
    if-eq v2, v3, :cond_61

    .line 520
    iget-object v7, p0, Lorg/spongycastle/asn1/ASN1Set;->set:Ljava/util/Vector;

    add-int/lit8 v8, v2, 0x1

    invoke-virtual {v7, v8}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/spongycastle/asn1/ASN1Encodable;

    invoke-direct {p0, v7}, Lorg/spongycastle/asn1/ASN1Set;->getDEREncoded(Lorg/spongycastle/asn1/ASN1Encodable;)[B

    move-result-object v1

    .line 522
    .local v1, "b":[B
    invoke-direct {p0, v0, v1}, Lorg/spongycastle/asn1/ASN1Set;->lessThanOrEqual([B[B)Z

    move-result v7

    if-eqz v7, :cond_44

    .line 524
    move-object v0, v1

    .line 537
    :goto_41
    add-int/lit8 v2, v2, 0x1

    .line 538
    goto :goto_2a

    .line 528
    :cond_44
    iget-object v7, p0, Lorg/spongycastle/asn1/ASN1Set;->set:Ljava/util/Vector;

    invoke-virtual {v7, v2}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v4

    .line 530
    .local v4, "o":Ljava/lang/Object;
    iget-object v7, p0, Lorg/spongycastle/asn1/ASN1Set;->set:Ljava/util/Vector;

    iget-object v8, p0, Lorg/spongycastle/asn1/ASN1Set;->set:Ljava/util/Vector;

    add-int/lit8 v9, v2, 0x1

    invoke-virtual {v8, v9}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v7, v8, v2}, Ljava/util/Vector;->setElementAt(Ljava/lang/Object;I)V

    .line 531
    iget-object v7, p0, Lorg/spongycastle/asn1/ASN1Set;->set:Ljava/util/Vector;

    add-int/lit8 v8, v2, 0x1

    invoke-virtual {v7, v4, v8}, Ljava/util/Vector;->setElementAt(Ljava/lang/Object;I)V

    .line 533
    const/4 v6, 0x1

    .line 534
    move v5, v2

    goto :goto_41

    .line 540
    .end local v1    # "b":[B
    .end local v4    # "o":Ljava/lang/Object;
    :cond_61
    move v3, v5

    .line 541
    goto :goto_18

    .line 544
    .end local v0    # "a":[B
    .end local v2    # "index":I
    .end local v3    # "lastSwap":I
    .end local v5    # "swapIndex":I
    .end local v6    # "swapped":Z
    :cond_63
    return-void
.end method

.method public toArray()[Lorg/spongycastle/asn1/ASN1Encodable;
    .registers 4

    .prologue
    .line 305
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1Set;->size()I

    move-result v2

    new-array v1, v2, [Lorg/spongycastle/asn1/ASN1Encodable;

    .line 307
    .local v1, "values":[Lorg/spongycastle/asn1/ASN1Encodable;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_7
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1Set;->size()I

    move-result v2

    if-eq v0, v2, :cond_16

    .line 309
    invoke-virtual {p0, v0}, Lorg/spongycastle/asn1/ASN1Set;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v2

    aput-object v2, v1, v0

    .line 307
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 312
    :cond_16
    return-object v1
.end method

.method toDERObject()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 5

    .prologue
    .line 379
    iget-boolean v3, p0, Lorg/spongycastle/asn1/ASN1Set;->isSorted:Z

    if-eqz v3, :cond_e

    .line 381
    new-instance v0, Lorg/spongycastle/asn1/DERSet;

    invoke-direct {v0}, Lorg/spongycastle/asn1/DERSet;-><init>()V

    .line 383
    .local v0, "derSet":Lorg/spongycastle/asn1/ASN1Set;
    iget-object v3, p0, Lorg/spongycastle/asn1/ASN1Set;->set:Ljava/util/Vector;

    iput-object v3, v0, Lorg/spongycastle/asn1/ASN1Set;->set:Ljava/util/Vector;

    .line 402
    :goto_d
    return-object v0

    .line 389
    .end local v0    # "derSet":Lorg/spongycastle/asn1/ASN1Set;
    :cond_e
    new-instance v2, Ljava/util/Vector;

    invoke-direct {v2}, Ljava/util/Vector;-><init>()V

    .line 391
    .local v2, "v":Ljava/util/Vector;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_14
    iget-object v3, p0, Lorg/spongycastle/asn1/ASN1Set;->set:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v3

    if-eq v1, v3, :cond_28

    .line 393
    iget-object v3, p0, Lorg/spongycastle/asn1/ASN1Set;->set:Ljava/util/Vector;

    invoke-virtual {v3, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 391
    add-int/lit8 v1, v1, 0x1

    goto :goto_14

    .line 396
    :cond_28
    new-instance v0, Lorg/spongycastle/asn1/DERSet;

    invoke-direct {v0}, Lorg/spongycastle/asn1/DERSet;-><init>()V

    .line 398
    .restart local v0    # "derSet":Lorg/spongycastle/asn1/ASN1Set;
    iput-object v2, v0, Lorg/spongycastle/asn1/ASN1Set;->set:Ljava/util/Vector;

    .line 400
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1Set;->sort()V

    goto :goto_d
.end method

.method toDLObject()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 3

    .prologue
    .line 412
    new-instance v0, Lorg/spongycastle/asn1/DLSet;

    invoke-direct {v0}, Lorg/spongycastle/asn1/DLSet;-><init>()V

    .line 414
    .local v0, "derSet":Lorg/spongycastle/asn1/ASN1Set;
    iget-object v1, p0, Lorg/spongycastle/asn1/ASN1Set;->set:Ljava/util/Vector;

    iput-object v1, v0, Lorg/spongycastle/asn1/ASN1Set;->set:Ljava/util/Vector;

    .line 416
    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 556
    iget-object v0, p0, Lorg/spongycastle/asn1/ASN1Set;->set:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
