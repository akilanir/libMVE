.class public Lorg/spongycastle/jcajce/provider/symmetric/util/IvAlgorithmParameters;
.super Lorg/spongycastle/jcajce/provider/symmetric/util/BaseAlgorithmParameters;
.source "IvAlgorithmParameters.java"


# instance fields
.field private iv:[B


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 14
    invoke-direct {p0}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseAlgorithmParameters;-><init>()V

    return-void
.end method


# virtual methods
.method protected engineGetEncoded()[B
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 22
    const-string v0, "ASN.1"

    invoke-virtual {p0, v0}, Lorg/spongycastle/jcajce/provider/symmetric/util/IvAlgorithmParameters;->engineGetEncoded(Ljava/lang/String;)[B

    move-result-object v0

    return-object v0
.end method

.method protected engineGetEncoded(Ljava/lang/String;)[B
    .registers 4
    .param p1, "format"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 29
    invoke-virtual {p0, p1}, Lorg/spongycastle/jcajce/provider/symmetric/util/IvAlgorithmParameters;->isASN1FormatString(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 31
    new-instance v0, Lorg/spongycastle/asn1/DEROctetString;

    const-string v1, "RAW"

    invoke-virtual {p0, v1}, Lorg/spongycastle/jcajce/provider/symmetric/util/IvAlgorithmParameters;->engineGetEncoded(Ljava/lang/String;)[B

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    invoke-virtual {v0}, Lorg/spongycastle/asn1/DEROctetString;->getEncoded()[B

    move-result-object v0

    .line 39
    :goto_15
    return-object v0

    .line 34
    :cond_16
    const-string v0, "RAW"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_25

    .line 36
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/IvAlgorithmParameters;->iv:[B

    invoke-static {v0}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    move-result-object v0

    goto :goto_15

    .line 39
    :cond_25
    const/4 v0, 0x0

    goto :goto_15
.end method

.method protected engineInit(Ljava/security/spec/AlgorithmParameterSpec;)V
    .registers 4
    .param p1, "paramSpec"    # Ljava/security/spec/AlgorithmParameterSpec;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/spec/InvalidParameterSpecException;
        }
    .end annotation

    .prologue
    .line 58
    instance-of v0, p1, Ljavax/crypto/spec/IvParameterSpec;

    if-nez v0, :cond_c

    .line 60
    new-instance v0, Ljava/security/spec/InvalidParameterSpecException;

    const-string v1, "IvParameterSpec required to initialise a IV parameters algorithm parameters object"

    invoke-direct {v0, v1}, Ljava/security/spec/InvalidParameterSpecException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 63
    :cond_c
    check-cast p1, Ljavax/crypto/spec/IvParameterSpec;

    .end local p1    # "paramSpec":Ljava/security/spec/AlgorithmParameterSpec;
    invoke-virtual {p1}, Ljavax/crypto/spec/IvParameterSpec;->getIV()[B

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/IvAlgorithmParameters;->iv:[B

    .line 64
    return-void
.end method

.method protected engineInit([B)V
    .registers 5
    .param p1, "params"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 73
    array-length v1, p1

    rem-int/lit8 v1, v1, 0x8

    if-eqz v1, :cond_1d

    const/4 v1, 0x0

    aget-byte v1, p1, v1

    const/4 v2, 0x4

    if-ne v1, v2, :cond_1d

    const/4 v1, 0x1

    aget-byte v1, p1, v1

    array-length v2, p1

    add-int/lit8 v2, v2, -0x2

    if-ne v1, v2, :cond_1d

    .line 76
    invoke-static {p1}, Lorg/spongycastle/asn1/ASN1Primitive;->fromByteArray([B)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/asn1/ASN1OctetString;

    .line 78
    .local v0, "oct":Lorg/spongycastle/asn1/ASN1OctetString;
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object p1

    .line 81
    .end local v0    # "oct":Lorg/spongycastle/asn1/ASN1OctetString;
    :cond_1d
    invoke-static {p1}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    move-result-object v1

    iput-object v1, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/IvAlgorithmParameters;->iv:[B

    .line 82
    return-void
.end method

.method protected engineInit([BLjava/lang/String;)V
    .registers 8
    .param p1, "params"    # [B
    .param p2, "format"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 89
    invoke-virtual {p0, p2}, Lorg/spongycastle/jcajce/provider/symmetric/util/IvAlgorithmParameters;->isASN1FormatString(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2e

    .line 93
    :try_start_6
    invoke-static {p1}, Lorg/spongycastle/asn1/ASN1Primitive;->fromByteArray([B)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v1

    check-cast v1, Lorg/spongycastle/asn1/ASN1OctetString;

    .line 95
    .local v1, "oct":Lorg/spongycastle/asn1/ASN1OctetString;
    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/spongycastle/jcajce/provider/symmetric/util/IvAlgorithmParameters;->engineInit([B)V
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_13} :catch_14

    .line 108
    .end local v1    # "oct":Lorg/spongycastle/asn1/ASN1OctetString;
    :goto_13
    return-void

    .line 97
    :catch_14
    move-exception v0

    .line 99
    .local v0, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Exception decoding: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 105
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_2e
    const-string v2, "RAW"

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3a

    .line 107
    invoke-virtual {p0, p1}, Lorg/spongycastle/jcajce/provider/symmetric/util/IvAlgorithmParameters;->engineInit([B)V

    goto :goto_13

    .line 111
    :cond_3a
    new-instance v2, Ljava/io/IOException;

    const-string v3, "Unknown parameters format in IV parameters object"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method protected engineToString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 116
    const-string v0, "IV Parameters"

    return-object v0
.end method

.method protected localEngineGetParameterSpec(Ljava/lang/Class;)Ljava/security/spec/AlgorithmParameterSpec;
    .registers 4
    .param p1, "paramSpec"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/spec/InvalidParameterSpecException;
        }
    .end annotation

    .prologue
    .line 46
    const-class v0, Ljavax/crypto/spec/IvParameterSpec;

    if-ne p1, v0, :cond_c

    .line 48
    new-instance v0, Ljavax/crypto/spec/IvParameterSpec;

    iget-object v1, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/IvAlgorithmParameters;->iv:[B

    invoke-direct {v0, v1}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    return-object v0

    .line 51
    :cond_c
    new-instance v0, Ljava/security/spec/InvalidParameterSpecException;

    const-string v1, "unknown parameter spec passed to IV parameters object."

    invoke-direct {v0, v1}, Ljava/security/spec/InvalidParameterSpecException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
