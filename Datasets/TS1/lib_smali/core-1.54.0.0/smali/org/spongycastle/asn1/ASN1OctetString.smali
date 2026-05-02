.class public abstract Lorg/spongycastle/asn1/ASN1OctetString;
.super Lorg/spongycastle/asn1/ASN1Primitive;
.source "ASN1OctetString.java"

# interfaces
.implements Lorg/spongycastle/asn1/ASN1OctetStringParser;


# instance fields
.field string:[B


# direct methods
.method public constructor <init>([B)V
    .registers 4
    .param p1, "string"    # [B

    .prologue
    .line 175
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Primitive;-><init>()V

    .line 176
    if-nez p1, :cond_d

    .line 178
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "string cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 180
    :cond_d
    iput-object p1, p0, Lorg/spongycastle/asn1/ASN1OctetString;->string:[B

    .line 181
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1OctetString;
    .registers 6
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 140
    if-eqz p0, :cond_6

    instance-of v2, p0, Lorg/spongycastle/asn1/ASN1OctetString;

    if-eqz v2, :cond_a

    .line 142
    :cond_6
    check-cast p0, Lorg/spongycastle/asn1/ASN1OctetString;

    .end local p0    # "obj":Ljava/lang/Object;
    move-object v1, p0

    .line 161
    .restart local p0    # "obj":Ljava/lang/Object;
    :goto_9
    return-object v1

    .line 144
    :cond_a
    instance-of v2, p0, [B

    if-eqz v2, :cond_39

    .line 148
    :try_start_e
    check-cast p0, [B

    .end local p0    # "obj":Ljava/lang/Object;
    check-cast p0, [B

    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1Primitive;->fromByteArray([B)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v2

    invoke-static {v2}, Lorg/spongycastle/asn1/ASN1OctetString;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1OctetString;
    :try_end_19
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_19} :catch_1b

    move-result-object v1

    goto :goto_9

    .line 150
    :catch_1b
    move-exception v0

    .line 152
    .local v0, "e":Ljava/io/IOException;
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "failed to construct OCTET STRING from byte[]: "

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

    .line 155
    .end local v0    # "e":Ljava/io/IOException;
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_39
    instance-of v2, p0, Lorg/spongycastle/asn1/ASN1Encodable;

    if-eqz v2, :cond_4b

    move-object v2, p0

    .line 157
    check-cast v2, Lorg/spongycastle/asn1/ASN1Encodable;

    invoke-interface {v2}, Lorg/spongycastle/asn1/ASN1Encodable;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v1

    .line 159
    .local v1, "primitive":Lorg/spongycastle/asn1/ASN1Primitive;
    instance-of v2, v1, Lorg/spongycastle/asn1/ASN1OctetString;

    if-eqz v2, :cond_4b

    .line 161
    check-cast v1, Lorg/spongycastle/asn1/ASN1OctetString;

    goto :goto_9

    .line 165
    .end local v1    # "primitive":Lorg/spongycastle/asn1/ASN1Primitive;
    :cond_4b
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "illegal object in getInstance: "

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

.method public static getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1OctetString;
    .registers 4
    .param p0, "obj"    # Lorg/spongycastle/asn1/ASN1TaggedObject;
    .param p1, "explicit"    # Z

    .prologue
    .line 119
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    .line 121
    .local v0, "o":Lorg/spongycastle/asn1/ASN1Primitive;
    if-nez p1, :cond_a

    instance-of v1, v0, Lorg/spongycastle/asn1/ASN1OctetString;

    if-eqz v1, :cond_f

    .line 123
    :cond_a
    invoke-static {v0}, Lorg/spongycastle/asn1/ASN1OctetString;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1OctetString;

    move-result-object v1

    .line 127
    :goto_e
    return-object v1

    :cond_f
    invoke-static {v0}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v1

    invoke-static {v1}, Lorg/spongycastle/asn1/BEROctetString;->fromSequence(Lorg/spongycastle/asn1/ASN1Sequence;)Lorg/spongycastle/asn1/BEROctetString;

    move-result-object v1

    goto :goto_e
.end method


# virtual methods
.method asn1Equals(Lorg/spongycastle/asn1/ASN1Primitive;)Z
    .registers 5
    .param p1, "o"    # Lorg/spongycastle/asn1/ASN1Primitive;

    .prologue
    .line 221
    instance-of v1, p1, Lorg/spongycastle/asn1/ASN1OctetString;

    if-nez v1, :cond_6

    .line 223
    const/4 v1, 0x0

    .line 228
    :goto_5
    return v1

    :cond_6
    move-object v0, p1

    .line 226
    check-cast v0, Lorg/spongycastle/asn1/ASN1OctetString;

    .line 228
    .local v0, "other":Lorg/spongycastle/asn1/ASN1OctetString;
    iget-object v1, p0, Lorg/spongycastle/asn1/ASN1OctetString;->string:[B

    iget-object v2, v0, Lorg/spongycastle/asn1/ASN1OctetString;->string:[B

    invoke-static {v1, v2}, Lorg/spongycastle/util/Arrays;->areEqual([B[B)Z

    move-result v1

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
    .line 233
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1OctetString;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    return-object v0
.end method

.method public getOctetStream()Ljava/io/InputStream;
    .registers 3

    .prologue
    .line 190
    new-instance v0, Ljava/io/ByteArrayInputStream;

    iget-object v1, p0, Lorg/spongycastle/asn1/ASN1OctetString;->string:[B

    invoke-direct {v0, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    return-object v0
.end method

.method public getOctets()[B
    .registers 2

    .prologue
    .line 210
    iget-object v0, p0, Lorg/spongycastle/asn1/ASN1OctetString;->string:[B

    return-object v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 215
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/util/Arrays;->hashCode([B)I

    move-result v0

    return v0
.end method

.method public parser()Lorg/spongycastle/asn1/ASN1OctetStringParser;
    .registers 1

    .prologue
    .line 200
    return-object p0
.end method

.method toDERObject()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 3

    .prologue
    .line 238
    new-instance v0, Lorg/spongycastle/asn1/DEROctetString;

    iget-object v1, p0, Lorg/spongycastle/asn1/ASN1OctetString;->string:[B

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    return-object v0
.end method

.method toDLObject()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 3

    .prologue
    .line 243
    new-instance v0, Lorg/spongycastle/asn1/DEROctetString;

    iget-object v1, p0, Lorg/spongycastle/asn1/ASN1OctetString;->string:[B

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 251
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "#"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    new-instance v1, Ljava/lang/String;

    iget-object v2, p0, Lorg/spongycastle/asn1/ASN1OctetString;->string:[B

    invoke-static {v2}, Lorg/spongycastle/util/encoders/Hex;->encode([B)[B

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
