.class public Lorg/spongycastle/jcajce/util/JcaJceUtils;
.super Ljava/lang/Object;
.source "JcaJceUtils.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    return-void
.end method

.method public static extractParameters(Ljava/security/AlgorithmParameters;)Lorg/spongycastle/asn1/ASN1Encodable;
    .registers 4
    .param p0, "params"    # Ljava/security/AlgorithmParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 40
    :try_start_0
    const-string v2, "ASN.1"

    invoke-virtual {p0, v2}, Ljava/security/AlgorithmParameters;->getEncoded(Ljava/lang/String;)[B

    move-result-object v2

    invoke-static {v2}, Lorg/spongycastle/asn1/ASN1Primitive;->fromByteArray([B)Lorg/spongycastle/asn1/ASN1Primitive;
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_9} :catch_b

    move-result-object v0

    .line 47
    .local v0, "asn1Params":Lorg/spongycastle/asn1/ASN1Encodable;
    :goto_a
    return-object v0

    .line 42
    .end local v0    # "asn1Params":Lorg/spongycastle/asn1/ASN1Encodable;
    :catch_b
    move-exception v1

    .line 44
    .local v1, "ex":Ljava/lang/Exception;
    invoke-virtual {p0}, Ljava/security/AlgorithmParameters;->getEncoded()[B

    move-result-object v2

    invoke-static {v2}, Lorg/spongycastle/asn1/ASN1Primitive;->fromByteArray([B)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    .restart local v0    # "asn1Params":Lorg/spongycastle/asn1/ASN1Encodable;
    goto :goto_a
.end method

.method public static getDigestAlgName(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Ljava/lang/String;
    .registers 2
    .param p0, "digestAlgOID"    # Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .prologue
    .line 82
    sget-object v0, Lorg/spongycastle/asn1/pkcs/PKCSObjectIdentifiers;->md5:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0, p0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 84
    const-string v0, "MD5"

    .line 124
    :goto_a
    return-object v0

    .line 86
    :cond_b
    sget-object v0, Lorg/spongycastle/asn1/oiw/OIWObjectIdentifiers;->idSHA1:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0, p0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 88
    const-string v0, "SHA1"

    goto :goto_a

    .line 90
    :cond_16
    sget-object v0, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->id_sha224:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0, p0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_21

    .line 92
    const-string v0, "SHA224"

    goto :goto_a

    .line 94
    :cond_21
    sget-object v0, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->id_sha256:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0, p0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2c

    .line 96
    const-string v0, "SHA256"

    goto :goto_a

    .line 98
    :cond_2c
    sget-object v0, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->id_sha384:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0, p0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_37

    .line 100
    const-string v0, "SHA384"

    goto :goto_a

    .line 102
    :cond_37
    sget-object v0, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->id_sha512:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0, p0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_42

    .line 104
    const-string v0, "SHA512"

    goto :goto_a

    .line 106
    :cond_42
    sget-object v0, Lorg/spongycastle/asn1/teletrust/TeleTrusTObjectIdentifiers;->ripemd128:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0, p0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4d

    .line 108
    const-string v0, "RIPEMD128"

    goto :goto_a

    .line 110
    :cond_4d
    sget-object v0, Lorg/spongycastle/asn1/teletrust/TeleTrusTObjectIdentifiers;->ripemd160:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0, p0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_58

    .line 112
    const-string v0, "RIPEMD160"

    goto :goto_a

    .line 114
    :cond_58
    sget-object v0, Lorg/spongycastle/asn1/teletrust/TeleTrusTObjectIdentifiers;->ripemd256:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0, p0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_63

    .line 116
    const-string v0, "RIPEMD256"

    goto :goto_a

    .line 118
    :cond_63
    sget-object v0, Lorg/spongycastle/asn1/cryptopro/CryptoProObjectIdentifiers;->gostR3411:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0, p0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6e

    .line 120
    const-string v0, "GOST3411"

    goto :goto_a

    .line 124
    :cond_6e
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v0

    goto :goto_a
.end method

.method public static loadParameters(Ljava/security/AlgorithmParameters;Lorg/spongycastle/asn1/ASN1Encodable;)V
    .registers 5
    .param p0, "params"    # Ljava/security/AlgorithmParameters;
    .param p1, "sParams"    # Lorg/spongycastle/asn1/ASN1Encodable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 64
    :try_start_0
    invoke-interface {p1}, Lorg/spongycastle/asn1/ASN1Encodable;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v1

    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1Primitive;->getEncoded()[B

    move-result-object v1

    const-string v2, "ASN.1"

    invoke-virtual {p0, v1, v2}, Ljava/security/AlgorithmParameters;->init([BLjava/lang/String;)V
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_d} :catch_e

    .line 70
    :goto_d
    return-void

    .line 66
    :catch_e
    move-exception v0

    .line 68
    .local v0, "ex":Ljava/lang/Exception;
    invoke-interface {p1}, Lorg/spongycastle/asn1/ASN1Encodable;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v1

    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1Primitive;->getEncoded()[B

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/security/AlgorithmParameters;->init([B)V

    goto :goto_d
.end method
