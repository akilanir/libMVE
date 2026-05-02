.class public Lorg/spongycastle/asn1/DERBMPString;
.super Lorg/spongycastle/asn1/ASN1Primitive;
.source "DERBMPString.java"

# interfaces
.implements Lorg/spongycastle/asn1/ASN1String;


# instance fields
.field private final string:[C


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "string"    # Ljava/lang/String;

    .prologue
    .line 100
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Primitive;-><init>()V

    .line 101
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/asn1/DERBMPString;->string:[C

    .line 102
    return-void
.end method

.method constructor <init>([B)V
    .registers 6
    .param p1, "string"    # [B

    .prologue
    .line 78
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Primitive;-><init>()V

    .line 79
    array-length v2, p1

    div-int/lit8 v2, v2, 0x2

    new-array v0, v2, [C

    .line 81
    .local v0, "cs":[C
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_9
    array-length v2, v0

    if-eq v1, v2, :cond_21

    .line 83
    mul-int/lit8 v2, v1, 0x2

    aget-byte v2, p1, v2

    shl-int/lit8 v2, v2, 0x8

    mul-int/lit8 v3, v1, 0x2

    add-int/lit8 v3, v3, 0x1

    aget-byte v3, p1, v3

    and-int/lit16 v3, v3, 0xff

    or-int/2addr v2, v3

    int-to-char v2, v2

    aput-char v2, v0, v1

    .line 81
    add-int/lit8 v1, v1, 0x1

    goto :goto_9

    .line 86
    :cond_21
    iput-object v0, p0, Lorg/spongycastle/asn1/DERBMPString;->string:[C

    .line 87
    return-void
.end method

.method constructor <init>([C)V
    .registers 2
    .param p1, "string"    # [C

    .prologue
    .line 90
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Primitive;-><init>()V

    .line 91
    iput-object p1, p0, Lorg/spongycastle/asn1/DERBMPString;->string:[C

    .line 92
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/DERBMPString;
    .registers 5
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 26
    if-eqz p0, :cond_6

    instance-of v1, p0, Lorg/spongycastle/asn1/DERBMPString;

    if-eqz v1, :cond_a

    .line 28
    :cond_6
    check-cast p0, Lorg/spongycastle/asn1/DERBMPString;

    .end local p0    # "obj":Ljava/lang/Object;
    move-object v1, p0

    .line 35
    :goto_9
    return-object v1

    .line 31
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_a
    instance-of v1, p0, [B

    if-eqz v1, :cond_37

    .line 35
    :try_start_e
    check-cast p0, [B

    .end local p0    # "obj":Ljava/lang/Object;
    check-cast p0, [B

    invoke-static {p0}, Lorg/spongycastle/asn1/DERBMPString;->fromByteArray([B)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v1

    check-cast v1, Lorg/spongycastle/asn1/DERBMPString;
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_18} :catch_19

    goto :goto_9

    .line 37
    :catch_19
    move-exception v0

    .line 39
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

    .line 43
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

.method public static getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/DERBMPString;
    .registers 5
    .param p0, "obj"    # Lorg/spongycastle/asn1/ASN1TaggedObject;
    .param p1, "explicit"    # Z

    .prologue
    .line 60
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    .line 62
    .local v0, "o":Lorg/spongycastle/asn1/ASN1Primitive;
    if-nez p1, :cond_a

    instance-of v1, v0, Lorg/spongycastle/asn1/DERBMPString;

    if-eqz v1, :cond_f

    .line 64
    :cond_a
    invoke-static {v0}, Lorg/spongycastle/asn1/DERBMPString;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/DERBMPString;

    move-result-object v1

    .line 68
    :goto_e
    return-object v1

    :cond_f
    new-instance v1, Lorg/spongycastle/asn1/DERBMPString;

    invoke-static {v0}, Lorg/spongycastle/asn1/ASN1OctetString;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1OctetString;

    move-result-object v2

    invoke-virtual {v2}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/spongycastle/asn1/DERBMPString;-><init>([B)V

    goto :goto_e
.end method


# virtual methods
.method protected asn1Equals(Lorg/spongycastle/asn1/ASN1Primitive;)Z
    .registers 5
    .param p1, "o"    # Lorg/spongycastle/asn1/ASN1Primitive;

    .prologue
    .line 122
    instance-of v1, p1, Lorg/spongycastle/asn1/DERBMPString;

    if-nez v1, :cond_6

    .line 124
    const/4 v1, 0x0

    .line 129
    :goto_5
    return v1

    :cond_6
    move-object v0, p1

    .line 127
    check-cast v0, Lorg/spongycastle/asn1/DERBMPString;

    .line 129
    .local v0, "s":Lorg/spongycastle/asn1/DERBMPString;
    iget-object v1, p0, Lorg/spongycastle/asn1/DERBMPString;->string:[C

    iget-object v2, v0, Lorg/spongycastle/asn1/DERBMPString;->string:[C

    invoke-static {v1, v2}, Lorg/spongycastle/util/Arrays;->areEqual([C[C)Z

    move-result v1

    goto :goto_5
.end method

.method encode(Lorg/spongycastle/asn1/ASN1OutputStream;)V
    .registers 5
    .param p1, "out"    # Lorg/spongycastle/asn1/ASN1OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 146
    const/16 v2, 0x1e

    invoke-virtual {p1, v2}, Lorg/spongycastle/asn1/ASN1OutputStream;->write(I)V

    .line 147
    iget-object v2, p0, Lorg/spongycastle/asn1/DERBMPString;->string:[C

    array-length v2, v2

    mul-int/lit8 v2, v2, 0x2

    invoke-virtual {p1, v2}, Lorg/spongycastle/asn1/ASN1OutputStream;->writeLength(I)V

    .line 149
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_e
    iget-object v2, p0, Lorg/spongycastle/asn1/DERBMPString;->string:[C

    array-length v2, v2

    if-eq v1, v2, :cond_24

    .line 151
    iget-object v2, p0, Lorg/spongycastle/asn1/DERBMPString;->string:[C

    aget-char v0, v2, v1

    .line 153
    .local v0, "c":C
    shr-int/lit8 v2, v0, 0x8

    int-to-byte v2, v2

    invoke-virtual {p1, v2}, Lorg/spongycastle/asn1/ASN1OutputStream;->write(I)V

    .line 154
    int-to-byte v2, v0

    invoke-virtual {p1, v2}, Lorg/spongycastle/asn1/ASN1OutputStream;->write(I)V

    .line 149
    add-int/lit8 v1, v1, 0x1

    goto :goto_e

    .line 156
    .end local v0    # "c":C
    :cond_24
    return-void
.end method

.method encodedLength()I
    .registers 3

    .prologue
    .line 139
    iget-object v0, p0, Lorg/spongycastle/asn1/DERBMPString;->string:[C

    array-length v0, v0

    mul-int/lit8 v0, v0, 0x2

    invoke-static {v0}, Lorg/spongycastle/asn1/StreamUtil;->calculateBodyLength(I)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lorg/spongycastle/asn1/DERBMPString;->string:[C

    array-length v1, v1

    mul-int/lit8 v1, v1, 0x2

    add-int/2addr v0, v1

    return v0
.end method

.method public getString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 106
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lorg/spongycastle/asn1/DERBMPString;->string:[C

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([C)V

    return-object v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 116
    iget-object v0, p0, Lorg/spongycastle/asn1/DERBMPString;->string:[C

    invoke-static {v0}, Lorg/spongycastle/util/Arrays;->hashCode([C)I

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
    .line 111
    invoke-virtual {p0}, Lorg/spongycastle/asn1/DERBMPString;->getString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
