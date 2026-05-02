.class public Lorg/spongycastle/asn1/DERIA5String;
.super Lorg/spongycastle/asn1/ASN1Primitive;
.source "DERIA5String.java"

# interfaces
.implements Lorg/spongycastle/asn1/ASN1String;


# instance fields
.field private final string:[B


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "string"    # Ljava/lang/String;

    .prologue
    .line 90
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/spongycastle/asn1/DERIA5String;-><init>(Ljava/lang/String;Z)V

    .line 91
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Z)V
    .registers 5
    .param p1, "string"    # Ljava/lang/String;
    .param p2, "validate"    # Z

    .prologue
    .line 104
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Primitive;-><init>()V

    .line 105
    if-nez p1, :cond_d

    .line 107
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "string cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 109
    :cond_d
    if-eqz p2, :cond_1d

    invoke-static {p1}, Lorg/spongycastle/asn1/DERIA5String;->isIA5String(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1d

    .line 111
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "string contains illegal characters"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 114
    :cond_1d
    invoke-static {p1}, Lorg/spongycastle/util/Strings;->toByteArray(Ljava/lang/String;)[B

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/asn1/DERIA5String;->string:[B

    .line 115
    return-void
.end method

.method constructor <init>([B)V
    .registers 2
    .param p1, "string"    # [B

    .prologue
    .line 79
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Primitive;-><init>()V

    .line 80
    iput-object p1, p0, Lorg/spongycastle/asn1/DERIA5String;->string:[B

    .line 81
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/DERIA5String;
    .registers 5
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 27
    if-eqz p0, :cond_6

    instance-of v1, p0, Lorg/spongycastle/asn1/DERIA5String;

    if-eqz v1, :cond_a

    .line 29
    :cond_6
    check-cast p0, Lorg/spongycastle/asn1/DERIA5String;

    .end local p0    # "obj":Ljava/lang/Object;
    move-object v1, p0

    .line 36
    :goto_9
    return-object v1

    .line 32
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_a
    instance-of v1, p0, [B

    if-eqz v1, :cond_37

    .line 36
    :try_start_e
    check-cast p0, [B

    .end local p0    # "obj":Ljava/lang/Object;
    check-cast p0, [B

    invoke-static {p0}, Lorg/spongycastle/asn1/DERIA5String;->fromByteArray([B)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v1

    check-cast v1, Lorg/spongycastle/asn1/DERIA5String;
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_18} :catch_19

    goto :goto_9

    .line 38
    :catch_19
    move-exception v0

    .line 40
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

    .line 44
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

.method public static getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/DERIA5String;
    .registers 5
    .param p0, "obj"    # Lorg/spongycastle/asn1/ASN1TaggedObject;
    .param p1, "explicit"    # Z

    .prologue
    .line 61
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    .line 63
    .local v0, "o":Lorg/spongycastle/asn1/ASN1Primitive;
    if-nez p1, :cond_a

    instance-of v1, v0, Lorg/spongycastle/asn1/DERIA5String;

    if-eqz v1, :cond_f

    .line 65
    :cond_a
    invoke-static {v0}, Lorg/spongycastle/asn1/DERIA5String;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/DERIA5String;

    move-result-object v1

    .line 69
    .end local v0    # "o":Lorg/spongycastle/asn1/ASN1Primitive;
    :goto_e
    return-object v1

    .restart local v0    # "o":Lorg/spongycastle/asn1/ASN1Primitive;
    :cond_f
    new-instance v1, Lorg/spongycastle/asn1/DERIA5String;

    check-cast v0, Lorg/spongycastle/asn1/ASN1OctetString;

    .end local v0    # "o":Lorg/spongycastle/asn1/ASN1Primitive;
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/spongycastle/asn1/DERIA5String;-><init>([B)V

    goto :goto_e
.end method

.method public static isIA5String(Ljava/lang/String;)Z
    .registers 4
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 177
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v1, v2, -0x1

    .local v1, "i":I
    :goto_6
    if-ltz v1, :cond_15

    .line 179
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 181
    .local v0, "ch":C
    const/16 v2, 0x7f

    if-le v0, v2, :cond_12

    .line 183
    const/4 v2, 0x0

    .line 187
    .end local v0    # "ch":C
    :goto_11
    return v2

    .line 177
    .restart local v0    # "ch":C
    :cond_12
    add-int/lit8 v1, v1, -0x1

    goto :goto_6

    .line 187
    .end local v0    # "ch":C
    :cond_15
    const/4 v2, 0x1

    goto :goto_11
.end method


# virtual methods
.method asn1Equals(Lorg/spongycastle/asn1/ASN1Primitive;)Z
    .registers 5
    .param p1, "o"    # Lorg/spongycastle/asn1/ASN1Primitive;

    .prologue
    .line 157
    instance-of v1, p1, Lorg/spongycastle/asn1/DERIA5String;

    if-nez v1, :cond_6

    .line 159
    const/4 v1, 0x0

    .line 164
    :goto_5
    return v1

    :cond_6
    move-object v0, p1

    .line 162
    check-cast v0, Lorg/spongycastle/asn1/DERIA5String;

    .line 164
    .local v0, "s":Lorg/spongycastle/asn1/DERIA5String;
    iget-object v1, p0, Lorg/spongycastle/asn1/DERIA5String;->string:[B

    iget-object v2, v0, Lorg/spongycastle/asn1/DERIA5String;->string:[B

    invoke-static {v1, v2}, Lorg/spongycastle/util/Arrays;->areEqual([B[B)Z

    move-result v1

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
    .line 146
    const/16 v0, 0x16

    iget-object v1, p0, Lorg/spongycastle/asn1/DERIA5String;->string:[B

    invoke-virtual {p1, v0, v1}, Lorg/spongycastle/asn1/ASN1OutputStream;->writeEncoded(I[B)V

    .line 147
    return-void
.end method

.method encodedLength()I
    .registers 3

    .prologue
    .line 139
    iget-object v0, p0, Lorg/spongycastle/asn1/DERIA5String;->string:[B

    array-length v0, v0

    invoke-static {v0}, Lorg/spongycastle/asn1/StreamUtil;->calculateBodyLength(I)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lorg/spongycastle/asn1/DERIA5String;->string:[B

    array-length v1, v1

    add-int/2addr v0, v1

    return v0
.end method

.method public getOctets()[B
    .registers 2

    .prologue
    .line 129
    iget-object v0, p0, Lorg/spongycastle/asn1/DERIA5String;->string:[B

    invoke-static {v0}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    move-result-object v0

    return-object v0
.end method

.method public getString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 119
    iget-object v0, p0, Lorg/spongycastle/asn1/DERIA5String;->string:[B

    invoke-static {v0}, Lorg/spongycastle/util/Strings;->fromByteArray([B)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 151
    iget-object v0, p0, Lorg/spongycastle/asn1/DERIA5String;->string:[B

    invoke-static {v0}, Lorg/spongycastle/util/Arrays;->hashCode([B)I

    move-result v0

    return v0
.end method

.method isConstructed()Z
    .registers 2

    .prologue
    .line 134
    const/4 v0, 0x0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 124
    invoke-virtual {p0}, Lorg/spongycastle/asn1/DERIA5String;->getString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
