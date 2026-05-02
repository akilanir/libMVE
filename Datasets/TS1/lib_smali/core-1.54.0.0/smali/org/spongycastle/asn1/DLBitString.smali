.class public Lorg/spongycastle/asn1/DLBitString;
.super Lorg/spongycastle/asn1/ASN1BitString;
.source "DLBitString.java"


# direct methods
.method protected constructor <init>(BI)V
    .registers 4
    .param p1, "data"    # B
    .param p2, "padBits"    # I

    .prologue
    .line 63
    invoke-static {p1}, Lorg/spongycastle/asn1/DLBitString;->toByteArray(B)[B

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lorg/spongycastle/asn1/DLBitString;-><init>([BI)V

    .line 64
    return-void
.end method

.method public constructor <init>(I)V
    .registers 4
    .param p1, "value"    # I

    .prologue
    .line 95
    invoke-static {p1}, Lorg/spongycastle/asn1/DLBitString;->getBytes(I)[B

    move-result-object v0

    invoke-static {p1}, Lorg/spongycastle/asn1/DLBitString;->getPadBits(I)I

    move-result v1

    invoke-direct {p0, v0, v1}, Lorg/spongycastle/asn1/ASN1BitString;-><init>([BI)V

    .line 96
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/ASN1Encodable;)V
    .registers 4
    .param p1, "obj"    # Lorg/spongycastle/asn1/ASN1Encodable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 102
    invoke-interface {p1}, Lorg/spongycastle/asn1/ASN1Encodable;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    const-string v1, "DER"

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1Primitive;->getEncoded(Ljava/lang/String;)[B

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lorg/spongycastle/asn1/ASN1BitString;-><init>([BI)V

    .line 103
    return-void
.end method

.method public constructor <init>([B)V
    .registers 3
    .param p1, "data"    # [B

    .prologue
    .line 89
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/spongycastle/asn1/DLBitString;-><init>([BI)V

    .line 90
    return-void
.end method

.method public constructor <init>([BI)V
    .registers 3
    .param p1, "data"    # [B
    .param p2, "padBits"    # I

    .prologue
    .line 83
    invoke-direct {p0, p1, p2}, Lorg/spongycastle/asn1/ASN1BitString;-><init>([BI)V

    .line 84
    return-void
.end method

.method static fromOctetString([B)Lorg/spongycastle/asn1/DLBitString;
    .registers 6
    .param p0, "bytes"    # [B

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 130
    array-length v2, p0

    if-ge v2, v4, :cond_d

    .line 132
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "truncated BIT STRING detected"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 135
    :cond_d
    aget-byte v1, p0, v3

    .line 136
    .local v1, "padBits":I
    array-length v2, p0

    add-int/lit8 v2, v2, -0x1

    new-array v0, v2, [B

    .line 138
    .local v0, "data":[B
    array-length v2, v0

    if-eqz v2, :cond_1d

    .line 140
    array-length v2, p0

    add-int/lit8 v2, v2, -0x1

    invoke-static {p0, v4, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 143
    :cond_1d
    new-instance v2, Lorg/spongycastle/asn1/DLBitString;

    invoke-direct {v2, v0, v1}, Lorg/spongycastle/asn1/DLBitString;-><init>([BI)V

    return-object v2
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1BitString;
    .registers 4
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 21
    if-eqz p0, :cond_6

    instance-of v0, p0, Lorg/spongycastle/asn1/DLBitString;

    if-eqz v0, :cond_9

    .line 23
    :cond_6
    check-cast p0, Lorg/spongycastle/asn1/DLBitString;

    .line 27
    .end local p0    # "obj":Ljava/lang/Object;
    :goto_8
    return-object p0

    .line 25
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_9
    instance-of v0, p0, Lorg/spongycastle/asn1/DERBitString;

    if-eqz v0, :cond_10

    .line 27
    check-cast p0, Lorg/spongycastle/asn1/DERBitString;

    goto :goto_8

    .line 30
    :cond_10
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "illegal object in getInstance: "

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

.method public static getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1BitString;
    .registers 4
    .param p0, "obj"    # Lorg/spongycastle/asn1/ASN1TaggedObject;
    .param p1, "explicit"    # Z

    .prologue
    .line 47
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    .line 49
    .local v0, "o":Lorg/spongycastle/asn1/ASN1Primitive;
    if-nez p1, :cond_a

    instance-of v1, v0, Lorg/spongycastle/asn1/DLBitString;

    if-eqz v1, :cond_f

    .line 51
    :cond_a
    invoke-static {v0}, Lorg/spongycastle/asn1/DLBitString;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1BitString;

    move-result-object v1

    .line 55
    .end local v0    # "o":Lorg/spongycastle/asn1/ASN1Primitive;
    :goto_e
    return-object v1

    .restart local v0    # "o":Lorg/spongycastle/asn1/ASN1Primitive;
    :cond_f
    check-cast v0, Lorg/spongycastle/asn1/ASN1OctetString;

    .end local v0    # "o":Lorg/spongycastle/asn1/ASN1Primitive;
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v1

    invoke-static {v1}, Lorg/spongycastle/asn1/DLBitString;->fromOctetString([B)Lorg/spongycastle/asn1/DLBitString;

    move-result-object v1

    goto :goto_e
.end method

.method private static toByteArray(B)[B
    .registers 3
    .param p0, "data"    # B

    .prologue
    .line 68
    const/4 v1, 0x1

    new-array v0, v1, [B

    .line 70
    .local v0, "rv":[B
    const/4 v1, 0x0

    aput-byte p0, v0, v1

    .line 72
    return-object v0
.end method


# virtual methods
.method encode(Lorg/spongycastle/asn1/ASN1OutputStream;)V
    .registers 7
    .param p1, "out"    # Lorg/spongycastle/asn1/ASN1OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 119
    iget-object v1, p0, Lorg/spongycastle/asn1/DLBitString;->data:[B

    .line 120
    .local v1, "string":[B
    array-length v2, v1

    add-int/lit8 v2, v2, 0x1

    new-array v0, v2, [B

    .line 122
    .local v0, "bytes":[B
    invoke-virtual {p0}, Lorg/spongycastle/asn1/DLBitString;->getPadBits()I

    move-result v2

    int-to-byte v2, v2

    aput-byte v2, v0, v4

    .line 123
    const/4 v2, 0x1

    array-length v3, v0

    add-int/lit8 v3, v3, -0x1

    invoke-static {v1, v4, v0, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 125
    const/4 v2, 0x3

    invoke-virtual {p1, v2, v0}, Lorg/spongycastle/asn1/ASN1OutputStream;->writeEncoded(I[B)V

    .line 126
    return-void
.end method

.method encodedLength()I
    .registers 3

    .prologue
    .line 112
    iget-object v0, p0, Lorg/spongycastle/asn1/DLBitString;->data:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x1

    invoke-static {v0}, Lorg/spongycastle/asn1/StreamUtil;->calculateBodyLength(I)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lorg/spongycastle/asn1/DLBitString;->data:[B

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    return v0
.end method

.method isConstructed()Z
    .registers 2

    .prologue
    .line 107
    const/4 v0, 0x0

    return v0
.end method
