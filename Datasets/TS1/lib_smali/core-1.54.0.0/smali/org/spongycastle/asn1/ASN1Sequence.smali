.class public abstract Lorg/spongycastle/asn1/ASN1Sequence;
.super Lorg/spongycastle/asn1/ASN1Primitive;
.source "ASN1Sequence.java"

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
.field protected seq:Ljava/util/Vector;


# direct methods
.method protected constructor <init>()V
    .registers 2

    .prologue
    .line 169
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Primitive;-><init>()V

    .line 61
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/asn1/ASN1Sequence;->seq:Ljava/util/Vector;

    .line 170
    return-void
.end method

.method protected constructor <init>(Lorg/spongycastle/asn1/ASN1Encodable;)V
    .registers 3
    .param p1, "obj"    # Lorg/spongycastle/asn1/ASN1Encodable;

    .prologue
    .line 178
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Primitive;-><init>()V

    .line 61
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/asn1/ASN1Sequence;->seq:Ljava/util/Vector;

    .line 179
    iget-object v0, p0, Lorg/spongycastle/asn1/ASN1Sequence;->seq:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 180
    return-void
.end method

.method protected constructor <init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V
    .registers 5
    .param p1, "v"    # Lorg/spongycastle/asn1/ASN1EncodableVector;

    .prologue
    .line 188
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Primitive;-><init>()V

    .line 61
    new-instance v1, Ljava/util/Vector;

    invoke-direct {v1}, Ljava/util/Vector;-><init>()V

    iput-object v1, p0, Lorg/spongycastle/asn1/ASN1Sequence;->seq:Ljava/util/Vector;

    .line 189
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_b
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->size()I

    move-result v1

    if-eq v0, v1, :cond_1d

    .line 191
    iget-object v1, p0, Lorg/spongycastle/asn1/ASN1Sequence;->seq:Ljava/util/Vector;

    invoke-virtual {p1, v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;->get(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 189
    add-int/lit8 v0, v0, 0x1

    goto :goto_b

    .line 193
    :cond_1d
    return-void
.end method

.method protected constructor <init>([Lorg/spongycastle/asn1/ASN1Encodable;)V
    .registers 5
    .param p1, "array"    # [Lorg/spongycastle/asn1/ASN1Encodable;

    .prologue
    .line 200
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Primitive;-><init>()V

    .line 61
    new-instance v1, Ljava/util/Vector;

    invoke-direct {v1}, Ljava/util/Vector;-><init>()V

    iput-object v1, p0, Lorg/spongycastle/asn1/ASN1Sequence;->seq:Ljava/util/Vector;

    .line 201
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_b
    array-length v1, p1

    if-eq v0, v1, :cond_18

    .line 203
    iget-object v1, p0, Lorg/spongycastle/asn1/ASN1Sequence;->seq:Ljava/util/Vector;

    aget-object v2, p1, v0

    invoke-virtual {v1, v2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 201
    add-int/lit8 v0, v0, 0x1

    goto :goto_b

    .line 205
    :cond_18
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;
    .registers 6
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 73
    if-eqz p0, :cond_6

    instance-of v2, p0, Lorg/spongycastle/asn1/ASN1Sequence;

    if-eqz v2, :cond_a

    .line 75
    :cond_6
    check-cast p0, Lorg/spongycastle/asn1/ASN1Sequence;

    .end local p0    # "obj":Ljava/lang/Object;
    move-object v1, p0

    .line 98
    .restart local p0    # "obj":Ljava/lang/Object;
    :goto_9
    return-object v1

    .line 77
    :cond_a
    instance-of v2, p0, Lorg/spongycastle/asn1/ASN1SequenceParser;

    if-eqz v2, :cond_19

    .line 79
    check-cast p0, Lorg/spongycastle/asn1/ASN1SequenceParser;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-interface {p0}, Lorg/spongycastle/asn1/ASN1SequenceParser;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v2

    invoke-static {v2}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v1

    goto :goto_9

    .line 81
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_19
    instance-of v2, p0, [B

    if-eqz v2, :cond_48

    .line 85
    :try_start_1d
    check-cast p0, [B

    .end local p0    # "obj":Ljava/lang/Object;
    check-cast p0, [B

    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->fromByteArray([B)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v2

    invoke-static {v2}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;
    :try_end_28
    .catch Ljava/io/IOException; {:try_start_1d .. :try_end_28} :catch_2a

    move-result-object v1

    goto :goto_9

    .line 87
    :catch_2a
    move-exception v0

    .line 89
    .local v0, "e":Ljava/io/IOException;
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "failed to construct sequence from byte[]: "

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

    .line 92
    .end local v0    # "e":Ljava/io/IOException;
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_48
    instance-of v2, p0, Lorg/spongycastle/asn1/ASN1Encodable;

    if-eqz v2, :cond_5a

    move-object v2, p0

    .line 94
    check-cast v2, Lorg/spongycastle/asn1/ASN1Encodable;

    invoke-interface {v2}, Lorg/spongycastle/asn1/ASN1Encodable;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v1

    .line 96
    .local v1, "primitive":Lorg/spongycastle/asn1/ASN1Primitive;
    instance-of v2, v1, Lorg/spongycastle/asn1/ASN1Sequence;

    if-eqz v2, :cond_5a

    .line 98
    check-cast v1, Lorg/spongycastle/asn1/ASN1Sequence;

    goto :goto_9

    .line 102
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

.method public static getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1Sequence;
    .registers 5
    .param p0, "obj"    # Lorg/spongycastle/asn1/ASN1TaggedObject;
    .param p1, "explicit"    # Z

    .prologue
    .line 126
    if-eqz p1, :cond_1d

    .line 128
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1TaggedObject;->isExplicit()Z

    move-result v0

    if-nez v0, :cond_10

    .line 130
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "object implicit - explicit expected."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 133
    :cond_10
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1Primitive;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v0

    .line 157
    :goto_1c
    return-object v0

    .line 142
    :cond_1d
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1TaggedObject;->isExplicit()Z

    move-result v0

    if-eqz v0, :cond_3b

    .line 144
    instance-of v0, p0, Lorg/spongycastle/asn1/BERTaggedObject;

    if-eqz v0, :cond_31

    .line 146
    new-instance v0, Lorg/spongycastle/asn1/BERSequence;

    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/BERSequence;-><init>(Lorg/spongycastle/asn1/ASN1Encodable;)V

    goto :goto_1c

    .line 150
    :cond_31
    new-instance v0, Lorg/spongycastle/asn1/DLSequence;

    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/DLSequence;-><init>(Lorg/spongycastle/asn1/ASN1Encodable;)V

    goto :goto_1c

    .line 155
    :cond_3b
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    instance-of v0, v0, Lorg/spongycastle/asn1/ASN1Sequence;

    if-eqz v0, :cond_4a

    .line 157
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/asn1/ASN1Sequence;

    goto :goto_1c

    .line 162
    :cond_4a
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unknown object in getInstance: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private getNext(Ljava/util/Enumeration;)Lorg/spongycastle/asn1/ASN1Encodable;
    .registers 3
    .param p1, "e"    # Ljava/util/Enumeration;

    .prologue
    .line 343
    invoke-interface {p1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/asn1/ASN1Encodable;

    .line 345
    .local v0, "encObj":Lorg/spongycastle/asn1/ASN1Encodable;
    return-object v0
.end method


# virtual methods
.method asn1Equals(Lorg/spongycastle/asn1/ASN1Primitive;)Z
    .registers 12
    .param p1, "o"    # Lorg/spongycastle/asn1/ASN1Primitive;

    .prologue
    const/4 v7, 0x0

    .line 307
    instance-of v8, p1, Lorg/spongycastle/asn1/ASN1Sequence;

    if-nez v8, :cond_6

    .line 338
    :cond_5
    :goto_5
    return v7

    :cond_6
    move-object v4, p1

    .line 312
    check-cast v4, Lorg/spongycastle/asn1/ASN1Sequence;

    .line 314
    .local v4, "other":Lorg/spongycastle/asn1/ASN1Sequence;
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v8

    invoke-virtual {v4}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v9

    if-ne v8, v9, :cond_5

    .line 319
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjects()Ljava/util/Enumeration;

    move-result-object v5

    .line 320
    .local v5, "s1":Ljava/util/Enumeration;
    invoke-virtual {v4}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjects()Ljava/util/Enumeration;

    move-result-object v6

    .line 322
    .local v6, "s2":Ljava/util/Enumeration;
    :cond_1b
    :goto_1b
    invoke-interface {v5}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v8

    if-eqz v8, :cond_3a

    .line 324
    invoke-direct {p0, v5}, Lorg/spongycastle/asn1/ASN1Sequence;->getNext(Ljava/util/Enumeration;)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v2

    .line 325
    .local v2, "obj1":Lorg/spongycastle/asn1/ASN1Encodable;
    invoke-direct {p0, v6}, Lorg/spongycastle/asn1/ASN1Sequence;->getNext(Ljava/util/Enumeration;)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v3

    .line 327
    .local v3, "obj2":Lorg/spongycastle/asn1/ASN1Encodable;
    invoke-interface {v2}, Lorg/spongycastle/asn1/ASN1Encodable;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    .line 328
    .local v0, "o1":Lorg/spongycastle/asn1/ASN1Primitive;
    invoke-interface {v3}, Lorg/spongycastle/asn1/ASN1Encodable;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v1

    .line 330
    .local v1, "o2":Lorg/spongycastle/asn1/ASN1Primitive;
    if-eq v0, v1, :cond_1b

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1Primitive;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_5

    goto :goto_1b

    .line 338
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
    .line 275
    iget-object v0, p0, Lorg/spongycastle/asn1/ASN1Sequence;->seq:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/asn1/ASN1Encodable;

    return-object v0
.end method

.method public getObjects()Ljava/util/Enumeration;
    .registers 2

    .prologue
    .line 221
    iget-object v0, p0, Lorg/spongycastle/asn1/ASN1Sequence;->seq:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .registers 5

    .prologue
    .line 290
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjects()Ljava/util/Enumeration;

    move-result-object v0

    .line 291
    .local v0, "e":Ljava/util/Enumeration;
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v1

    .line 293
    .local v1, "hashCode":I
    :goto_8
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_1a

    .line 295
    invoke-direct {p0, v0}, Lorg/spongycastle/asn1/ASN1Sequence;->getNext(Ljava/util/Enumeration;)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v2

    .line 296
    .local v2, "o":Lorg/spongycastle/asn1/ASN1Encodable;
    mul-int/lit8 v1, v1, 0x11

    .line 298
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v3

    xor-int/2addr v1, v3

    .line 299
    goto :goto_8

    .line 301
    .end local v2    # "o":Lorg/spongycastle/asn1/ASN1Encodable;
    :cond_1a
    return v1
.end method

.method isConstructed()Z
    .registers 2

    .prologue
    .line 376
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
    .line 389
    new-instance v0, Lorg/spongycastle/util/Arrays$Iterator;

    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->toArray()[Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/util/Arrays$Iterator;-><init>([Ljava/lang/Object;)V

    return-object v0
.end method

.method public parser()Lorg/spongycastle/asn1/ASN1SequenceParser;
    .registers 3

    .prologue
    .line 226
    move-object v0, p0

    .line 228
    .local v0, "outer":Lorg/spongycastle/asn1/ASN1Sequence;
    new-instance v1, Lorg/spongycastle/asn1/ASN1Sequence$1;

    invoke-direct {v1, p0, v0}, Lorg/spongycastle/asn1/ASN1Sequence$1;-><init>(Lorg/spongycastle/asn1/ASN1Sequence;Lorg/spongycastle/asn1/ASN1Sequence;)V

    return-object v1
.end method

.method public size()I
    .registers 2

    .prologue
    .line 285
    iget-object v0, p0, Lorg/spongycastle/asn1/ASN1Sequence;->seq:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    return v0
.end method

.method public toArray()[Lorg/spongycastle/asn1/ASN1Encodable;
    .registers 4

    .prologue
    .line 209
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v2

    new-array v1, v2, [Lorg/spongycastle/asn1/ASN1Encodable;

    .line 211
    .local v1, "values":[Lorg/spongycastle/asn1/ASN1Encodable;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_7
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v2

    if-eq v0, v2, :cond_16

    .line 213
    invoke-virtual {p0, v0}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v2

    aput-object v2, v1, v0

    .line 211
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 216
    :cond_16
    return-object v1
.end method

.method toDERObject()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 3

    .prologue
    .line 354
    new-instance v0, Lorg/spongycastle/asn1/DERSequence;

    invoke-direct {v0}, Lorg/spongycastle/asn1/DERSequence;-><init>()V

    .line 356
    .local v0, "derSeq":Lorg/spongycastle/asn1/ASN1Sequence;
    iget-object v1, p0, Lorg/spongycastle/asn1/ASN1Sequence;->seq:Ljava/util/Vector;

    iput-object v1, v0, Lorg/spongycastle/asn1/ASN1Sequence;->seq:Ljava/util/Vector;

    .line 358
    return-object v0
.end method

.method toDLObject()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 3

    .prologue
    .line 367
    new-instance v0, Lorg/spongycastle/asn1/DLSequence;

    invoke-direct {v0}, Lorg/spongycastle/asn1/DLSequence;-><init>()V

    .line 369
    .local v0, "dlSeq":Lorg/spongycastle/asn1/ASN1Sequence;
    iget-object v1, p0, Lorg/spongycastle/asn1/ASN1Sequence;->seq:Ljava/util/Vector;

    iput-object v1, v0, Lorg/spongycastle/asn1/ASN1Sequence;->seq:Ljava/util/Vector;

    .line 371
    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 384
    iget-object v0, p0, Lorg/spongycastle/asn1/ASN1Sequence;->seq:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
