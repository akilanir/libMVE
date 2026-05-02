.class public Lorg/spongycastle/asn1/DERVisibleString;
.super Lorg/spongycastle/asn1/ASN1Primitive;
.source "DERVisibleString.java"

# interfaces
.implements Lorg/spongycastle/asn1/ASN1String;


# instance fields
.field private final string:[B


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "string"    # Ljava/lang/String;

    .prologue
    .line 92
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Primitive;-><init>()V

    .line 93
    invoke-static {p1}, Lorg/spongycastle/util/Strings;->toByteArray(Ljava/lang/String;)[B

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/asn1/DERVisibleString;->string:[B

    .line 94
    return-void
.end method

.method constructor <init>([B)V
    .registers 2
    .param p1, "string"    # [B

    .prologue
    .line 81
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Primitive;-><init>()V

    .line 82
    iput-object p1, p0, Lorg/spongycastle/asn1/DERVisibleString;->string:[B

    .line 83
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/DERVisibleString;
    .registers 5
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 30
    if-eqz p0, :cond_6

    instance-of v1, p0, Lorg/spongycastle/asn1/DERVisibleString;

    if-eqz v1, :cond_a

    .line 32
    :cond_6
    check-cast p0, Lorg/spongycastle/asn1/DERVisibleString;

    .end local p0    # "obj":Ljava/lang/Object;
    move-object v1, p0

    .line 39
    :goto_9
    return-object v1

    .line 35
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_a
    instance-of v1, p0, [B

    if-eqz v1, :cond_37

    .line 39
    :try_start_e
    check-cast p0, [B

    .end local p0    # "obj":Ljava/lang/Object;
    check-cast p0, [B

    invoke-static {p0}, Lorg/spongycastle/asn1/DERVisibleString;->fromByteArray([B)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v1

    check-cast v1, Lorg/spongycastle/asn1/DERVisibleString;
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_18} :catch_19

    goto :goto_9

    .line 41
    :catch_19
    move-exception v0

    .line 43
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "encoding error in getInstance: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 47
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_37
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "illegal object in getInstance: "

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

.method public static getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/DERVisibleString;
    .registers 5
    .param p0, "obj"    # Lorg/spongycastle/asn1/ASN1TaggedObject;
    .param p1, "explicit"    # Z

    .prologue
    .line 64
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    .line 66
    .local v0, "o":Lorg/spongycastle/asn1/ASN1Primitive;
    if-nez p1, :cond_a

    instance-of v1, v0, Lorg/spongycastle/asn1/DERVisibleString;

    if-eqz v1, :cond_f

    .line 68
    :cond_a
    invoke-static {v0}, Lorg/spongycastle/asn1/DERVisibleString;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/DERVisibleString;

    move-result-object v1

    .line 72
    :goto_e
    return-object v1

    :cond_f
    new-instance v1, Lorg/spongycastle/asn1/DERVisibleString;

    invoke-static {v0}, Lorg/spongycastle/asn1/ASN1OctetString;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1OctetString;

    move-result-object v2

    invoke-virtual {v2}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/spongycastle/asn1/DERVisibleString;-><init>([B)V

    goto :goto_e
.end method


# virtual methods
.method asn1Equals(Lorg/spongycastle/asn1/ASN1Primitive;)Z
    .registers 4
    .param p1, "o"    # Lorg/spongycastle/asn1/ASN1Primitive;

    .prologue
    .line 131
    instance-of v0, p1, Lorg/spongycastle/asn1/DERVisibleString;

    if-nez v0, :cond_6

    .line 133
    const/4 v0, 0x0

    .line 136
    .end local p1    # "o":Lorg/spongycastle/asn1/ASN1Primitive;
    :goto_5
    return v0

    .restart local p1    # "o":Lorg/spongycastle/asn1/ASN1Primitive;
    :cond_6
    iget-object v0, p0, Lorg/spongycastle/asn1/DERVisibleString;->string:[B

    check-cast p1, Lorg/spongycastle/asn1/DERVisibleString;

    .end local p1    # "o":Lorg/spongycastle/asn1/ASN1Primitive;
    iget-object v1, p1, Lorg/spongycastle/asn1/DERVisibleString;->string:[B

    invoke-static {v0, v1}, Lorg/spongycastle/util/Arrays;->areEqual([B[B)Z

    move-result v0

    goto :goto_5
.end method

.method encode(Lorg/spongycastle/asn1/ASN1OutputStream;)V
    .registers 4
    .param p1, "out"    # Lorg/spongycastle/asn1/ASN1OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 125
    const/16 v0, 0x1a

    iget-object v1, p0, Lorg/spongycastle/asn1/DERVisibleString;->string:[B

    invoke-virtual {p1, v0, v1}, Lorg/spongycastle/asn1/ASN1OutputStream;->writeEncoded(I[B)V

    .line 126
    return-void
.end method

.method encodedLength()I
    .registers 3

    .prologue
    .line 118
    iget-object v0, p0, Lorg/spongycastle/asn1/DERVisibleString;->string:[B

    array-length v0, v0

    invoke-static {v0}, Lorg/spongycastle/asn1/StreamUtil;->calculateBodyLength(I)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lorg/spongycastle/asn1/DERVisibleString;->string:[B

    array-length v1, v1

    add-int/2addr v0, v1

    return v0
.end method

.method public getOctets()[B
    .registers 2

    .prologue
    .line 108
    iget-object v0, p0, Lorg/spongycastle/asn1/DERVisibleString;->string:[B

    invoke-static {v0}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    move-result-object v0

    return-object v0
.end method

.method public getString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 98
    iget-object v0, p0, Lorg/spongycastle/asn1/DERVisibleString;->string:[B

    invoke-static {v0}, Lorg/spongycastle/util/Strings;->fromByteArray([B)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 141
    iget-object v0, p0, Lorg/spongycastle/asn1/DERVisibleString;->string:[B

    invoke-static {v0}, Lorg/spongycastle/util/Arrays;->hashCode([B)I

    move-result v0

    return v0
.end method

.method isConstructed()Z
    .registers 2

    .prologue
    .line 113
    const/4 v0, 0x0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 103
    invoke-virtual {p0}, Lorg/spongycastle/asn1/DERVisibleString;->getString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
