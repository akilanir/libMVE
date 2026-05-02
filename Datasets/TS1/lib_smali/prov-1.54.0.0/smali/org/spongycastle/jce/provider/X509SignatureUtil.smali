.class Lorg/spongycastle/jce/provider/X509SignatureUtil;
.super Ljava/lang/Object;
.source "X509SignatureUtil.java"


# static fields
.field private static final derNull:Lorg/spongycastle/asn1/ASN1Null;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 28
    sget-object v0, Lorg/spongycastle/asn1/DERNull;->INSTANCE:Lorg/spongycastle/asn1/DERNull;

    sput-object v0, Lorg/spongycastle/jce/provider/X509SignatureUtil;->derNull:Lorg/spongycastle/asn1/ASN1Null;

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getDigestAlgName(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Ljava/lang/String;
    .registers 2
    .param p0, "digestAlgOID"    # Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .prologue
    .line 93
    sget-object v0, Lorg/spongycastle/asn1/pkcs/PKCSObjectIdentifiers;->md5:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0, p0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 95
    const-string v0, "MD5"

    .line 135
    :goto_a
    return-object v0

    .line 97
    :cond_b
    sget-object v0, Lorg/spongycastle/asn1/oiw/OIWObjectIdentifiers;->idSHA1:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0, p0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 99
    const-string v0, "SHA1"

    goto :goto_a

    .line 101
    :cond_16
    sget-object v0, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->id_sha224:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0, p0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_21

    .line 103
    const-string v0, "SHA224"

    goto :goto_a

    .line 105
    :cond_21
    sget-object v0, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->id_sha256:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0, p0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2c

    .line 107
    const-string v0, "SHA256"

    goto :goto_a

    .line 109
    :cond_2c
    sget-object v0, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->id_sha384:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0, p0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_37

    .line 111
    const-string v0, "SHA384"

    goto :goto_a

    .line 113
    :cond_37
    sget-object v0, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->id_sha512:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0, p0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_42

    .line 115
    const-string v0, "SHA512"

    goto :goto_a

    .line 117
    :cond_42
    sget-object v0, Lorg/spongycastle/asn1/teletrust/TeleTrusTObjectIdentifiers;->ripemd128:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0, p0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4d

    .line 119
    const-string v0, "RIPEMD128"

    goto :goto_a

    .line 121
    :cond_4d
    sget-object v0, Lorg/spongycastle/asn1/teletrust/TeleTrusTObjectIdentifiers;->ripemd160:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0, p0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_58

    .line 123
    const-string v0, "RIPEMD160"

    goto :goto_a

    .line 125
    :cond_58
    sget-object v0, Lorg/spongycastle/asn1/teletrust/TeleTrusTObjectIdentifiers;->ripemd256:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0, p0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_63

    .line 127
    const-string v0, "RIPEMD256"

    goto :goto_a

    .line 129
    :cond_63
    sget-object v0, Lorg/spongycastle/asn1/cryptopro/CryptoProObjectIdentifiers;->gostR3411:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0, p0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6e

    .line 131
    const-string v0, "GOST3411"

    goto :goto_a

    .line 135
    :cond_6e
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v0

    goto :goto_a
.end method

.method static getSignatureName(Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;)Ljava/lang/String;
    .registers 6
    .param p0, "sigAlgId"    # Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    .prologue
    .line 65
    invoke-virtual {p0}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->getParameters()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v1

    .line 67
    .local v1, "params":Lorg/spongycastle/asn1/ASN1Encodable;
    if-eqz v1, :cond_6f

    sget-object v3, Lorg/spongycastle/jce/provider/X509SignatureUtil;->derNull:Lorg/spongycastle/asn1/ASN1Null;

    invoke-virtual {v3, v1}, Lorg/spongycastle/asn1/ASN1Null;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_6f

    .line 69
    invoke-virtual {p0}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->getAlgorithm()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v3

    sget-object v4, Lorg/spongycastle/asn1/pkcs/PKCSObjectIdentifiers;->id_RSASSA_PSS:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v3, v4}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3e

    .line 71
    invoke-static {v1}, Lorg/spongycastle/asn1/pkcs/RSASSAPSSparams;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/pkcs/RSASSAPSSparams;

    move-result-object v2

    .line 73
    .local v2, "rsaParams":Lorg/spongycastle/asn1/pkcs/RSASSAPSSparams;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Lorg/spongycastle/asn1/pkcs/RSASSAPSSparams;->getHashAlgorithm()Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    move-result-object v4

    invoke-virtual {v4}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->getAlgorithm()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v4

    invoke-static {v4}, Lorg/spongycastle/jce/provider/X509SignatureUtil;->getDigestAlgName(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "withRSAandMGF1"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 83
    .end local v2    # "rsaParams":Lorg/spongycastle/asn1/pkcs/RSASSAPSSparams;
    :goto_3d
    return-object v3

    .line 75
    :cond_3e
    invoke-virtual {p0}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->getAlgorithm()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v3

    sget-object v4, Lorg/spongycastle/asn1/x9/X9ObjectIdentifiers;->ecdsa_with_SHA2:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v3, v4}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6f

    .line 77
    invoke-static {v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v0

    .line 79
    .local v0, "ecDsaParams":Lorg/spongycastle/asn1/ASN1Sequence;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v4, 0x0

    invoke-virtual {v0, v4}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v4

    invoke-static {v4}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v4

    invoke-static {v4}, Lorg/spongycastle/jce/provider/X509SignatureUtil;->getDigestAlgName(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "withECDSA"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_3d

    .line 83
    .end local v0    # "ecDsaParams":Lorg/spongycastle/asn1/ASN1Sequence;
    :cond_6f
    invoke-virtual {p0}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->getAlgorithm()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v3

    invoke-virtual {v3}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v3

    goto :goto_3d
.end method

.method static setSignatureParameters(Ljava/security/Signature;Lorg/spongycastle/asn1/ASN1Encodable;)V
    .registers 7
    .param p0, "signature"    # Ljava/security/Signature;
    .param p1, "params"    # Lorg/spongycastle/asn1/ASN1Encodable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/SignatureException;,
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .prologue
    .line 35
    if-eqz p1, :cond_36

    sget-object v2, Lorg/spongycastle/jce/provider/X509SignatureUtil;->derNull:Lorg/spongycastle/asn1/ASN1Null;

    invoke-virtual {v2, p1}, Lorg/spongycastle/asn1/ASN1Null;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_36

    .line 37
    invoke-virtual {p0}, Ljava/security/Signature;->getAlgorithm()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Ljava/security/Signature;->getProvider()Ljava/security/Provider;

    move-result-object v3

    invoke-static {v2, v3}, Ljava/security/AlgorithmParameters;->getInstance(Ljava/lang/String;Ljava/security/Provider;)Ljava/security/AlgorithmParameters;

    move-result-object v1

    .line 41
    .local v1, "sigParams":Ljava/security/AlgorithmParameters;
    :try_start_16
    invoke-interface {p1}, Lorg/spongycastle/asn1/ASN1Encodable;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v2

    invoke-virtual {v2}, Lorg/spongycastle/asn1/ASN1Primitive;->getEncoded()[B

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/security/AlgorithmParameters;->init([B)V
    :try_end_21
    .catch Ljava/io/IOException; {:try_start_16 .. :try_end_21} :catch_37

    .line 48
    invoke-virtual {p0}, Ljava/security/Signature;->getAlgorithm()Ljava/lang/String;

    move-result-object v2

    const-string v3, "MGF1"

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_36

    .line 52
    :try_start_2d
    const-class v2, Ljava/security/spec/PSSParameterSpec;

    invoke-virtual {v1, v2}, Ljava/security/AlgorithmParameters;->getParameterSpec(Ljava/lang/Class;)Ljava/security/spec/AlgorithmParameterSpec;

    move-result-object v2

    invoke-virtual {p0, v2}, Ljava/security/Signature;->setParameter(Ljava/security/spec/AlgorithmParameterSpec;)V
    :try_end_36
    .catch Ljava/security/GeneralSecurityException; {:try_start_2d .. :try_end_36} :catch_55

    .line 60
    .end local v1    # "sigParams":Ljava/security/AlgorithmParameters;
    :cond_36
    return-void

    .line 43
    .restart local v1    # "sigParams":Ljava/security/AlgorithmParameters;
    :catch_37
    move-exception v0

    .line 45
    .local v0, "e":Ljava/io/IOException;
    new-instance v2, Ljava/security/SignatureException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "IOException decoding parameters: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/security/SignatureException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 54
    .end local v0    # "e":Ljava/io/IOException;
    :catch_55
    move-exception v0

    .line 56
    .local v0, "e":Ljava/security/GeneralSecurityException;
    new-instance v2, Ljava/security/SignatureException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Exception extracting parameters: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/security/GeneralSecurityException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/security/SignatureException;-><init>(Ljava/lang/String;)V

    throw v2
.end method
