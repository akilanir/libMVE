.class public abstract Lorg/spongycastle/asn1/ASN1TaggedObject;
.super Lorg/spongycastle/asn1/ASN1Primitive;
.source "ASN1TaggedObject.java"

# interfaces
.implements Lorg/spongycastle/asn1/ASN1TaggedObjectParser;


# instance fields
.field empty:Z

.field explicit:Z

.field obj:Lorg/spongycastle/asn1/ASN1Encodable;

.field tagNo:I


# direct methods
.method public constructor <init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V
    .registers 7
    .param p1, "explicit"    # Z
    .param p2, "tagNo"    # I
    .param p3, "obj"    # Lorg/spongycastle/asn1/ASN1Encodable;

    .prologue
    const/4 v2, 0x1

    .line 67
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Primitive;-><init>()V

    .line 15
    const/4 v1, 0x0

    iput-boolean v1, p0, Lorg/spongycastle/asn1/ASN1TaggedObject;->empty:Z

    .line 16
    iput-boolean v2, p0, Lorg/spongycastle/asn1/ASN1TaggedObject;->explicit:Z

    .line 17
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/spongycastle/asn1/ASN1TaggedObject;->obj:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 68
    instance-of v1, p3, Lorg/spongycastle/asn1/ASN1Choice;

    if-eqz v1, :cond_1b

    .line 70
    iput-boolean v2, p0, Lorg/spongycastle/asn1/ASN1TaggedObject;->explicit:Z

    .line 77
    :goto_12
    iput p2, p0, Lorg/spongycastle/asn1/ASN1TaggedObject;->tagNo:I

    .line 79
    iget-boolean v1, p0, Lorg/spongycastle/asn1/ASN1TaggedObject;->explicit:Z

    if-eqz v1, :cond_1e

    .line 81
    iput-object p3, p0, Lorg/spongycastle/asn1/ASN1TaggedObject;->obj:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 94
    :goto_1a
    return-void

    .line 74
    :cond_1b
    iput-boolean p1, p0, Lorg/spongycastle/asn1/ASN1TaggedObject;->explicit:Z

    goto :goto_12

    .line 85
    :cond_1e
    invoke-interface {p3}, Lorg/spongycastle/asn1/ASN1Encodable;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    .line 87
    .local v0, "prim":Lorg/spongycastle/asn1/ASN1Primitive;
    instance-of v1, v0, Lorg/spongycastle/asn1/ASN1Set;

    if-eqz v1, :cond_26

    .line 92
    :cond_26
    iput-object p3, p0, Lorg/spongycastle/asn1/ASN1TaggedObject;->obj:Lorg/spongycastle/asn1/ASN1Encodable;

    goto :goto_1a
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1TaggedObject;
    .registers 5
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 34
    if-eqz p0, :cond_6

    instance-of v1, p0, Lorg/spongycastle/asn1/ASN1TaggedObject;

    if-eqz v1, :cond_9

    .line 36
    :cond_6
    check-cast p0, Lorg/spongycastle/asn1/ASN1TaggedObject;

    .line 42
    .end local p0    # "obj":Ljava/lang/Object;
    :goto_8
    return-object p0

    .line 38
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_9
    instance-of v1, p0, [B

    if-eqz v1, :cond_38

    .line 42
    :try_start_d
    check-cast p0, [B

    .end local p0    # "obj":Ljava/lang/Object;
    check-cast p0, [B

    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1TaggedObject;->fromByteArray([B)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v1

    invoke-static {v1}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1TaggedObject;
    :try_end_18
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_18} :catch_1a

    move-result-object p0

    goto :goto_8

    .line 44
    :catch_1a
    move-exception v0

    .line 46
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "failed to construct tagged object from byte[]: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 50
    .end local v0    # "e":Ljava/io/IOException;
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_38
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

.method public static getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1TaggedObject;
    .registers 4
    .param p0, "obj"    # Lorg/spongycastle/asn1/ASN1TaggedObject;
    .param p1, "explicit"    # Z

    .prologue
    .line 23
    if-eqz p1, :cond_9

    .line 25
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/asn1/ASN1TaggedObject;

    return-object v0

    .line 28
    :cond_9
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "implicitly tagged tagged object"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method asn1Equals(Lorg/spongycastle/asn1/ASN1Primitive;)Z
    .registers 6
    .param p1, "o"    # Lorg/spongycastle/asn1/ASN1Primitive;

    .prologue
    const/4 v1, 0x0

    .line 99
    instance-of v2, p1, Lorg/spongycastle/asn1/ASN1TaggedObject;

    if-nez v2, :cond_6

    .line 126
    :cond_5
    :goto_5
    return v1

    :cond_6
    move-object v0, p1

    .line 104
    check-cast v0, Lorg/spongycastle/asn1/ASN1TaggedObject;

    .line 106
    .local v0, "other":Lorg/spongycastle/asn1/ASN1TaggedObject;
    iget v2, p0, Lorg/spongycastle/asn1/ASN1TaggedObject;->tagNo:I

    iget v3, v0, Lorg/spongycastle/asn1/ASN1TaggedObject;->tagNo:I

    if-ne v2, v3, :cond_5

    iget-boolean v2, p0, Lorg/spongycastle/asn1/ASN1TaggedObject;->empty:Z

    iget-boolean v3, v0, Lorg/spongycastle/asn1/ASN1TaggedObject;->empty:Z

    if-ne v2, v3, :cond_5

    iget-boolean v2, p0, Lorg/spongycastle/asn1/ASN1TaggedObject;->explicit:Z

    iget-boolean v3, v0, Lorg/spongycastle/asn1/ASN1TaggedObject;->explicit:Z

    if-ne v2, v3, :cond_5

    .line 111
    iget-object v2, p0, Lorg/spongycastle/asn1/ASN1TaggedObject;->obj:Lorg/spongycastle/asn1/ASN1Encodable;

    if-nez v2, :cond_25

    .line 113
    iget-object v2, v0, Lorg/spongycastle/asn1/ASN1TaggedObject;->obj:Lorg/spongycastle/asn1/ASN1Encodable;

    if-nez v2, :cond_5

    .line 126
    :cond_23
    const/4 v1, 0x1

    goto :goto_5

    .line 120
    :cond_25
    iget-object v2, p0, Lorg/spongycastle/asn1/ASN1TaggedObject;->obj:Lorg/spongycastle/asn1/ASN1Encodable;

    invoke-interface {v2}, Lorg/spongycastle/asn1/ASN1Encodable;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v2

    iget-object v3, v0, Lorg/spongycastle/asn1/ASN1TaggedObject;->obj:Lorg/spongycastle/asn1/ASN1Encodable;

    invoke-interface {v3}, Lorg/spongycastle/asn1/ASN1Encodable;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/spongycastle/asn1/ASN1Primitive;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_23

    goto :goto_5
.end method

.method abstract encode(Lorg/spongycastle/asn1/ASN1OutputStream;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public getLoadedObject()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 2

    .prologue
    .line 217
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1TaggedObject;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    return-object v0
.end method

.method public getObject()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 2

    .prologue
    .line 179
    iget-object v0, p0, Lorg/spongycastle/asn1/ASN1TaggedObject;->obj:Lorg/spongycastle/asn1/ASN1Encodable;

    if-eqz v0, :cond_b

    .line 181
    iget-object v0, p0, Lorg/spongycastle/asn1/ASN1TaggedObject;->obj:Lorg/spongycastle/asn1/ASN1Encodable;

    invoke-interface {v0}, Lorg/spongycastle/asn1/ASN1Encodable;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    .line 184
    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public getObjectParser(IZ)Lorg/spongycastle/asn1/ASN1Encodable;
    .registers 6
    .param p1, "tag"    # I
    .param p2, "isExplicit"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 197
    sparse-switch p1, :sswitch_data_3e

    .line 207
    if-eqz p2, :cond_25

    .line 209
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    :goto_9
    return-object v0

    .line 200
    :sswitch_a
    invoke-static {p0, p2}, Lorg/spongycastle/asn1/ASN1Set;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1Set;

    move-result-object v0

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1Set;->parser()Lorg/spongycastle/asn1/ASN1SetParser;

    move-result-object v0

    goto :goto_9

    .line 202
    :sswitch_13
    invoke-static {p0, p2}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v0

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1Sequence;->parser()Lorg/spongycastle/asn1/ASN1SequenceParser;

    move-result-object v0

    goto :goto_9

    .line 204
    :sswitch_1c
    invoke-static {p0, p2}, Lorg/spongycastle/asn1/ASN1OctetString;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1OctetString;

    move-result-object v0

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1OctetString;->parser()Lorg/spongycastle/asn1/ASN1OctetStringParser;

    move-result-object v0

    goto :goto_9

    .line 212
    :cond_25
    new-instance v0, Lorg/spongycastle/asn1/ASN1Exception;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "implicit tagging not implemented for tag: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1Exception;-><init>(Ljava/lang/String;)V

    throw v0

    .line 197
    :sswitch_data_3e
    .sparse-switch
        0x4 -> :sswitch_1c
        0x10 -> :sswitch_13
        0x11 -> :sswitch_a
    .end sparse-switch
.end method

.method public getTagNo()I
    .registers 2

    .prologue
    .line 148
    iget v0, p0, Lorg/spongycastle/asn1/ASN1TaggedObject;->tagNo:I

    return v0
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 131
    iget v0, p0, Lorg/spongycastle/asn1/ASN1TaggedObject;->tagNo:I

    .line 138
    .local v0, "code":I
    iget-object v1, p0, Lorg/spongycastle/asn1/ASN1TaggedObject;->obj:Lorg/spongycastle/asn1/ASN1Encodable;

    if-eqz v1, :cond_d

    .line 140
    iget-object v1, p0, Lorg/spongycastle/asn1/ASN1TaggedObject;->obj:Lorg/spongycastle/asn1/ASN1Encodable;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    .line 143
    :cond_d
    return v0
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 167
    iget-boolean v0, p0, Lorg/spongycastle/asn1/ASN1TaggedObject;->empty:Z

    return v0
.end method

.method public isExplicit()Z
    .registers 2

    .prologue
    .line 162
    iget-boolean v0, p0, Lorg/spongycastle/asn1/ASN1TaggedObject;->explicit:Z

    return v0
.end method

.method toDERObject()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 5

    .prologue
    .line 222
    new-instance v0, Lorg/spongycastle/asn1/DERTaggedObject;

    iget-boolean v1, p0, Lorg/spongycastle/asn1/ASN1TaggedObject;->explicit:Z

    iget v2, p0, Lorg/spongycastle/asn1/ASN1TaggedObject;->tagNo:I

    iget-object v3, p0, Lorg/spongycastle/asn1/ASN1TaggedObject;->obj:Lorg/spongycastle/asn1/ASN1Encodable;

    invoke-direct {v0, v1, v2, v3}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    return-object v0
.end method

.method toDLObject()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 5

    .prologue
    .line 227
    new-instance v0, Lorg/spongycastle/asn1/DLTaggedObject;

    iget-boolean v1, p0, Lorg/spongycastle/asn1/ASN1TaggedObject;->explicit:Z

    iget v2, p0, Lorg/spongycastle/asn1/ASN1TaggedObject;->tagNo:I

    iget-object v3, p0, Lorg/spongycastle/asn1/ASN1TaggedObject;->obj:Lorg/spongycastle/asn1/ASN1Encodable;

    invoke-direct {v0, v1, v2, v3}, Lorg/spongycastle/asn1/DLTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 235
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lorg/spongycastle/asn1/ASN1TaggedObject;->tagNo:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/spongycastle/asn1/ASN1TaggedObject;->obj:Lorg/spongycastle/asn1/ASN1Encodable;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
