.class public Lorg/spongycastle/asn1/ASN1Integer;
.super Lorg/spongycastle/asn1/ASN1Primitive;
.source "ASN1Integer.java"


# instance fields
.field private final bytes:[B


# direct methods
.method public constructor <init>(J)V
    .registers 4
    .param p1, "value"    # J

    .prologue
    .line 74
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Primitive;-><init>()V

    .line 75
    invoke-static {p1, p2}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v0

    invoke-virtual {v0}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/asn1/ASN1Integer;->bytes:[B

    .line 76
    return-void
.end method

.method public constructor <init>(Ljava/math/BigInteger;)V
    .registers 3
    .param p1, "value"    # Ljava/math/BigInteger;

    .prologue
    .line 80
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Primitive;-><init>()V

    .line 81
    invoke-virtual {p1}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/asn1/ASN1Integer;->bytes:[B

    .line 82
    return-void
.end method

.method public constructor <init>([B)V
    .registers 3
    .param p1, "bytes"    # [B

    .prologue
    .line 87
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lorg/spongycastle/asn1/ASN1Integer;-><init>([BZ)V

    .line 88
    return-void
.end method

.method constructor <init>([BZ)V
    .registers 3
    .param p1, "bytes"    # [B
    .param p2, "clone"    # Z

    .prologue
    .line 91
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Primitive;-><init>()V

    .line 92
    if-eqz p2, :cond_9

    invoke-static {p1}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    move-result-object p1

    .end local p1    # "bytes":[B
    :cond_9
    iput-object p1, p0, Lorg/spongycastle/asn1/ASN1Integer;->bytes:[B

    .line 93
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Integer;
    .registers 5
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 26
    if-eqz p0, :cond_6

    instance-of v1, p0, Lorg/spongycastle/asn1/ASN1Integer;

    if-eqz v1, :cond_a

    .line 28
    :cond_6
    check-cast p0, Lorg/spongycastle/asn1/ASN1Integer;

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

    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1Integer;->fromByteArray([B)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v1

    check-cast v1, Lorg/spongycastle/asn1/ASN1Integer;
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

.method public static getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1Integer;
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

    instance-of v1, v0, Lorg/spongycastle/asn1/ASN1Integer;

    if-eqz v1, :cond_f

    .line 64
    :cond_a
    invoke-static {v0}, Lorg/spongycastle/asn1/ASN1Integer;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Integer;

    move-result-object v1

    .line 68
    :goto_e
    return-object v1

    :cond_f
    new-instance v1, Lorg/spongycastle/asn1/ASN1Integer;

    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v2

    invoke-static {v2}, Lorg/spongycastle/asn1/ASN1OctetString;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1OctetString;

    move-result-object v2

    invoke-virtual {v2}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/spongycastle/asn1/ASN1Integer;-><init>([B)V

    goto :goto_e
.end method


# virtual methods
.method asn1Equals(Lorg/spongycastle/asn1/ASN1Primitive;)Z
    .registers 5
    .param p1, "o"    # Lorg/spongycastle/asn1/ASN1Primitive;

    .prologue
    .line 142
    instance-of v1, p1, Lorg/spongycastle/asn1/ASN1Integer;

    if-nez v1, :cond_6

    .line 144
    const/4 v1, 0x0

    .line 149
    :goto_5
    return v1

    :cond_6
    move-object v0, p1

    .line 147
    check-cast v0, Lorg/spongycastle/asn1/ASN1Integer;

    .line 149
    .local v0, "other":Lorg/spongycastle/asn1/ASN1Integer;
    iget-object v1, p0, Lorg/spongycastle/asn1/ASN1Integer;->bytes:[B

    iget-object v2, v0, Lorg/spongycastle/asn1/ASN1Integer;->bytes:[B

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
    .line 124
    const/4 v0, 0x2

    iget-object v1, p0, Lorg/spongycastle/asn1/ASN1Integer;->bytes:[B

    invoke-virtual {p1, v0, v1}, Lorg/spongycastle/asn1/ASN1OutputStream;->writeEncoded(I[B)V

    .line 125
    return-void
.end method

.method encodedLength()I
    .registers 3

    .prologue
    .line 117
    iget-object v0, p0, Lorg/spongycastle/asn1/ASN1Integer;->bytes:[B

    array-length v0, v0

    invoke-static {v0}, Lorg/spongycastle/asn1/StreamUtil;->calculateBodyLength(I)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lorg/spongycastle/asn1/ASN1Integer;->bytes:[B

    array-length v1, v1

    add-int/2addr v0, v1

    return v0
.end method

.method public getPositiveValue()Ljava/math/BigInteger;
    .registers 4

    .prologue
    .line 107
    new-instance v0, Ljava/math/BigInteger;

    const/4 v1, 0x1

    iget-object v2, p0, Lorg/spongycastle/asn1/ASN1Integer;->bytes:[B

    invoke-direct {v0, v1, v2}, Ljava/math/BigInteger;-><init>(I[B)V

    return-object v0
.end method

.method public getValue()Ljava/math/BigInteger;
    .registers 3

    .prologue
    .line 97
    new-instance v0, Ljava/math/BigInteger;

    iget-object v1, p0, Lorg/spongycastle/asn1/ASN1Integer;->bytes:[B

    invoke-direct {v0, v1}, Ljava/math/BigInteger;-><init>([B)V

    return-object v0
.end method

.method public hashCode()I
    .registers 5

    .prologue
    .line 129
    const/4 v1, 0x0

    .line 131
    .local v1, "value":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2
    iget-object v2, p0, Lorg/spongycastle/asn1/ASN1Integer;->bytes:[B

    array-length v2, v2

    if-eq v0, v2, :cond_14

    .line 133
    iget-object v2, p0, Lorg/spongycastle/asn1/ASN1Integer;->bytes:[B

    aget-byte v2, v2, v0

    and-int/lit16 v2, v2, 0xff

    rem-int/lit8 v3, v0, 0x4

    shl-int/2addr v2, v3

    xor-int/2addr v1, v2

    .line 131
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 136
    :cond_14
    return v1
.end method

.method isConstructed()Z
    .registers 2

    .prologue
    .line 112
    const/4 v0, 0x0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 154
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    move-result-object v0

    invoke-virtual {v0}, Ljava/math/BigInteger;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
