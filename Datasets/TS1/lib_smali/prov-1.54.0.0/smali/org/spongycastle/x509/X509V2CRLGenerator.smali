.class public Lorg/spongycastle/x509/X509V2CRLGenerator;
.super Ljava/lang/Object;
.source "X509V2CRLGenerator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/spongycastle/x509/X509V2CRLGenerator$ExtCRLException;
    }
.end annotation


# instance fields
.field private extGenerator:Lorg/spongycastle/asn1/x509/X509ExtensionsGenerator;

.field private sigAlgId:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

.field private sigOID:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field private signatureAlgorithm:Ljava/lang/String;

.field private tbsGen:Lorg/spongycastle/asn1/x509/V2TBSCertListGenerator;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    new-instance v0, Lorg/spongycastle/asn1/x509/V2TBSCertListGenerator;

    invoke-direct {v0}, Lorg/spongycastle/asn1/x509/V2TBSCertListGenerator;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/x509/X509V2CRLGenerator;->tbsGen:Lorg/spongycastle/asn1/x509/V2TBSCertListGenerator;

    .line 57
    new-instance v0, Lorg/spongycastle/asn1/x509/X509ExtensionsGenerator;

    invoke-direct {v0}, Lorg/spongycastle/asn1/x509/X509ExtensionsGenerator;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/x509/X509V2CRLGenerator;->extGenerator:Lorg/spongycastle/asn1/x509/X509ExtensionsGenerator;

    .line 58
    return-void
.end method

.method private generateCertList()Lorg/spongycastle/asn1/x509/TBSCertList;
    .registers 3

    .prologue
    .line 404
    iget-object v0, p0, Lorg/spongycastle/x509/X509V2CRLGenerator;->extGenerator:Lorg/spongycastle/asn1/x509/X509ExtensionsGenerator;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/X509ExtensionsGenerator;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_13

    .line 406
    iget-object v0, p0, Lorg/spongycastle/x509/X509V2CRLGenerator;->tbsGen:Lorg/spongycastle/asn1/x509/V2TBSCertListGenerator;

    iget-object v1, p0, Lorg/spongycastle/x509/X509V2CRLGenerator;->extGenerator:Lorg/spongycastle/asn1/x509/X509ExtensionsGenerator;

    invoke-virtual {v1}, Lorg/spongycastle/asn1/x509/X509ExtensionsGenerator;->generate()Lorg/spongycastle/asn1/x509/X509Extensions;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/x509/V2TBSCertListGenerator;->setExtensions(Lorg/spongycastle/asn1/x509/X509Extensions;)V

    .line 409
    :cond_13
    iget-object v0, p0, Lorg/spongycastle/x509/X509V2CRLGenerator;->tbsGen:Lorg/spongycastle/asn1/x509/V2TBSCertListGenerator;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/V2TBSCertListGenerator;->generateTBSCertList()Lorg/spongycastle/asn1/x509/TBSCertList;

    move-result-object v0

    return-object v0
.end method

.method private generateJcaObject(Lorg/spongycastle/asn1/x509/TBSCertList;[B)Ljava/security/cert/X509CRL;
    .registers 7
    .param p1, "tbsCrl"    # Lorg/spongycastle/asn1/x509/TBSCertList;
    .param p2, "signature"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CRLException;
        }
    .end annotation

    .prologue
    .line 415
    new-instance v0, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 417
    .local v0, "v":Lorg/spongycastle/asn1/ASN1EncodableVector;
    invoke-virtual {v0, p1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 418
    iget-object v1, p0, Lorg/spongycastle/x509/X509V2CRLGenerator;->sigAlgId:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 419
    new-instance v1, Lorg/spongycastle/asn1/DERBitString;

    invoke-direct {v1, p2}, Lorg/spongycastle/asn1/DERBitString;-><init>([B)V

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 421
    new-instance v1, Lorg/spongycastle/jce/provider/X509CRLObject;

    new-instance v2, Lorg/spongycastle/asn1/x509/CertificateList;

    new-instance v3, Lorg/spongycastle/asn1/DERSequence;

    invoke-direct {v3, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    invoke-direct {v2, v3}, Lorg/spongycastle/asn1/x509/CertificateList;-><init>(Lorg/spongycastle/asn1/ASN1Sequence;)V

    invoke-direct {v1, v2}, Lorg/spongycastle/jce/provider/X509CRLObject;-><init>(Lorg/spongycastle/asn1/x509/CertificateList;)V

    return-object v1
.end method


# virtual methods
.method public addCRL(Ljava/security/cert/X509CRL;)V
    .registers 10
    .param p1, "other"    # Ljava/security/cert/X509CRL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CRLException;
        }
    .end annotation

    .prologue
    .line 143
    invoke-virtual {p1}, Ljava/security/cert/X509CRL;->getRevokedCertificates()Ljava/util/Set;

    move-result-object v4

    .line 145
    .local v4, "revocations":Ljava/util/Set;
    if-eqz v4, :cond_4b

    .line 147
    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 148
    .local v3, "it":Ljava/util/Iterator;
    :goto_a
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4b

    .line 150
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/security/cert/X509CRLEntry;

    .line 152
    .local v2, "entry":Ljava/security/cert/X509CRLEntry;
    new-instance v0, Lorg/spongycastle/asn1/ASN1InputStream;

    invoke-virtual {v2}, Ljava/security/cert/X509CRLEntry;->getEncoded()[B

    move-result-object v5

    invoke-direct {v0, v5}, Lorg/spongycastle/asn1/ASN1InputStream;-><init>([B)V

    .line 156
    .local v0, "aIn":Lorg/spongycastle/asn1/ASN1InputStream;
    :try_start_1f
    iget-object v5, p0, Lorg/spongycastle/x509/X509V2CRLGenerator;->tbsGen:Lorg/spongycastle/asn1/x509/V2TBSCertListGenerator;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1InputStream;->readObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v6

    invoke-static {v6}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/spongycastle/asn1/x509/V2TBSCertListGenerator;->addCRLEntry(Lorg/spongycastle/asn1/ASN1Sequence;)V
    :try_end_2c
    .catch Ljava/io/IOException; {:try_start_1f .. :try_end_2c} :catch_2d

    goto :goto_a

    .line 158
    :catch_2d
    move-exception v1

    .line 160
    .local v1, "e":Ljava/io/IOException;
    new-instance v5, Ljava/security/cert/CRLException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "exception processing encoding of CRL: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/security/cert/CRLException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 164
    .end local v0    # "aIn":Lorg/spongycastle/asn1/ASN1InputStream;
    .end local v1    # "e":Ljava/io/IOException;
    .end local v2    # "entry":Ljava/security/cert/X509CRLEntry;
    .end local v3    # "it":Ljava/util/Iterator;
    :cond_4b
    return-void
.end method

.method public addCRLEntry(Ljava/math/BigInteger;Ljava/util/Date;I)V
    .registers 7
    .param p1, "userCertificate"    # Ljava/math/BigInteger;
    .param p2, "revocationDate"    # Ljava/util/Date;
    .param p3, "reason"    # I

    .prologue
    .line 114
    iget-object v0, p0, Lorg/spongycastle/x509/X509V2CRLGenerator;->tbsGen:Lorg/spongycastle/asn1/x509/V2TBSCertListGenerator;

    new-instance v1, Lorg/spongycastle/asn1/ASN1Integer;

    invoke-direct {v1, p1}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(Ljava/math/BigInteger;)V

    new-instance v2, Lorg/spongycastle/asn1/x509/Time;

    invoke-direct {v2, p2}, Lorg/spongycastle/asn1/x509/Time;-><init>(Ljava/util/Date;)V

    invoke-virtual {v0, v1, v2, p3}, Lorg/spongycastle/asn1/x509/V2TBSCertListGenerator;->addCRLEntry(Lorg/spongycastle/asn1/ASN1Integer;Lorg/spongycastle/asn1/x509/Time;I)V

    .line 115
    return-void
.end method

.method public addCRLEntry(Ljava/math/BigInteger;Ljava/util/Date;ILjava/util/Date;)V
    .registers 9
    .param p1, "userCertificate"    # Ljava/math/BigInteger;
    .param p2, "revocationDate"    # Ljava/util/Date;
    .param p3, "reason"    # I
    .param p4, "invalidityDate"    # Ljava/util/Date;

    .prologue
    .line 124
    iget-object v0, p0, Lorg/spongycastle/x509/X509V2CRLGenerator;->tbsGen:Lorg/spongycastle/asn1/x509/V2TBSCertListGenerator;

    new-instance v1, Lorg/spongycastle/asn1/ASN1Integer;

    invoke-direct {v1, p1}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(Ljava/math/BigInteger;)V

    new-instance v2, Lorg/spongycastle/asn1/x509/Time;

    invoke-direct {v2, p2}, Lorg/spongycastle/asn1/x509/Time;-><init>(Ljava/util/Date;)V

    new-instance v3, Lorg/spongycastle/asn1/ASN1GeneralizedTime;

    invoke-direct {v3, p4}, Lorg/spongycastle/asn1/ASN1GeneralizedTime;-><init>(Ljava/util/Date;)V

    invoke-virtual {v0, v1, v2, p3, v3}, Lorg/spongycastle/asn1/x509/V2TBSCertListGenerator;->addCRLEntry(Lorg/spongycastle/asn1/ASN1Integer;Lorg/spongycastle/asn1/x509/Time;ILorg/spongycastle/asn1/ASN1GeneralizedTime;)V

    .line 125
    return-void
.end method

.method public addCRLEntry(Ljava/math/BigInteger;Ljava/util/Date;Lorg/spongycastle/asn1/x509/X509Extensions;)V
    .registers 8
    .param p1, "userCertificate"    # Ljava/math/BigInteger;
    .param p2, "revocationDate"    # Ljava/util/Date;
    .param p3, "extensions"    # Lorg/spongycastle/asn1/x509/X509Extensions;

    .prologue
    .line 132
    iget-object v0, p0, Lorg/spongycastle/x509/X509V2CRLGenerator;->tbsGen:Lorg/spongycastle/asn1/x509/V2TBSCertListGenerator;

    new-instance v1, Lorg/spongycastle/asn1/ASN1Integer;

    invoke-direct {v1, p1}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(Ljava/math/BigInteger;)V

    new-instance v2, Lorg/spongycastle/asn1/x509/Time;

    invoke-direct {v2, p2}, Lorg/spongycastle/asn1/x509/Time;-><init>(Ljava/util/Date;)V

    invoke-static {p3}, Lorg/spongycastle/asn1/x509/Extensions;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/Extensions;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Lorg/spongycastle/asn1/x509/V2TBSCertListGenerator;->addCRLEntry(Lorg/spongycastle/asn1/ASN1Integer;Lorg/spongycastle/asn1/x509/Time;Lorg/spongycastle/asn1/x509/Extensions;)V

    .line 133
    return-void
.end method

.method public addExtension(Ljava/lang/String;ZLorg/spongycastle/asn1/ASN1Encodable;)V
    .registers 5
    .param p1, "oid"    # Ljava/lang/String;
    .param p2, "critical"    # Z
    .param p3, "value"    # Lorg/spongycastle/asn1/ASN1Encodable;

    .prologue
    .line 199
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-direct {v0, p1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0, p2, p3}, Lorg/spongycastle/x509/X509V2CRLGenerator;->addExtension(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;ZLorg/spongycastle/asn1/ASN1Encodable;)V

    .line 200
    return-void
.end method

.method public addExtension(Ljava/lang/String;Z[B)V
    .registers 5
    .param p1, "oid"    # Ljava/lang/String;
    .param p2, "critical"    # Z
    .param p3, "value"    # [B

    .prologue
    .line 221
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-direct {v0, p1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0, p2, p3}, Lorg/spongycastle/x509/X509V2CRLGenerator;->addExtension(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Z[B)V

    .line 222
    return-void
.end method

.method public addExtension(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;ZLorg/spongycastle/asn1/ASN1Encodable;)V
    .registers 7
    .param p1, "oid"    # Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .param p2, "critical"    # Z
    .param p3, "value"    # Lorg/spongycastle/asn1/ASN1Encodable;

    .prologue
    .line 210
    iget-object v0, p0, Lorg/spongycastle/x509/X509V2CRLGenerator;->extGenerator:Lorg/spongycastle/asn1/x509/X509ExtensionsGenerator;

    new-instance v1, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, p2, p3}, Lorg/spongycastle/asn1/x509/X509ExtensionsGenerator;->addExtension(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;ZLorg/spongycastle/asn1/ASN1Encodable;)V

    .line 211
    return-void
.end method

.method public addExtension(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Z[B)V
    .registers 7
    .param p1, "oid"    # Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .param p2, "critical"    # Z
    .param p3, "value"    # [B

    .prologue
    .line 232
    iget-object v0, p0, Lorg/spongycastle/x509/X509V2CRLGenerator;->extGenerator:Lorg/spongycastle/asn1/x509/X509ExtensionsGenerator;

    new-instance v1, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, p2, p3}, Lorg/spongycastle/asn1/x509/X509ExtensionsGenerator;->addExtension(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Z[B)V

    .line 233
    return-void
.end method

.method public generate(Ljava/security/PrivateKey;)Ljava/security/cert/X509CRL;
    .registers 3
    .param p1, "key"    # Ljava/security/PrivateKey;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CRLException;,
            Ljava/lang/IllegalStateException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/SignatureException;,
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .prologue
    .line 333
    const/4 v0, 0x0

    check-cast v0, Ljava/security/SecureRandom;

    invoke-virtual {p0, p1, v0}, Lorg/spongycastle/x509/X509V2CRLGenerator;->generate(Ljava/security/PrivateKey;Ljava/security/SecureRandom;)Ljava/security/cert/X509CRL;

    move-result-object v0

    return-object v0
.end method

.method public generate(Ljava/security/PrivateKey;Ljava/lang/String;)Ljava/security/cert/X509CRL;
    .registers 4
    .param p1, "key"    # Ljava/security/PrivateKey;
    .param p2, "provider"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CRLException;,
            Ljava/lang/IllegalStateException;,
            Ljava/security/NoSuchProviderException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/SignatureException;,
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .prologue
    .line 374
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/spongycastle/x509/X509V2CRLGenerator;->generate(Ljava/security/PrivateKey;Ljava/lang/String;Ljava/security/SecureRandom;)Ljava/security/cert/X509CRL;

    move-result-object v0

    return-object v0
.end method

.method public generate(Ljava/security/PrivateKey;Ljava/lang/String;Ljava/security/SecureRandom;)Ljava/security/cert/X509CRL;
    .registers 12
    .param p1, "key"    # Ljava/security/PrivateKey;
    .param p2, "provider"    # Ljava/lang/String;
    .param p3, "random"    # Ljava/security/SecureRandom;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CRLException;,
            Ljava/lang/IllegalStateException;,
            Ljava/security/NoSuchProviderException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/SignatureException;,
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .prologue
    .line 387
    invoke-direct {p0}, Lorg/spongycastle/x509/X509V2CRLGenerator;->generateCertList()Lorg/spongycastle/asn1/x509/TBSCertList;

    move-result-object v5

    .line 392
    .local v5, "tbsCrl":Lorg/spongycastle/asn1/x509/TBSCertList;
    :try_start_4
    iget-object v0, p0, Lorg/spongycastle/x509/X509V2CRLGenerator;->sigOID:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    iget-object v1, p0, Lorg/spongycastle/x509/X509V2CRLGenerator;->signatureAlgorithm:Ljava/lang/String;

    move-object v2, p2

    move-object v3, p1

    move-object v4, p3

    invoke-static/range {v0 .. v5}, Lorg/spongycastle/x509/X509Util;->calculateSignature(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Ljava/lang/String;Ljava/lang/String;Ljava/security/PrivateKey;Ljava/security/SecureRandom;Lorg/spongycastle/asn1/ASN1Encodable;)[B
    :try_end_e
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_e} :catch_14

    move-result-object v7

    .line 399
    .local v7, "signature":[B
    invoke-direct {p0, v5, v7}, Lorg/spongycastle/x509/X509V2CRLGenerator;->generateJcaObject(Lorg/spongycastle/asn1/x509/TBSCertList;[B)Ljava/security/cert/X509CRL;

    move-result-object v0

    return-object v0

    .line 394
    .end local v7    # "signature":[B
    :catch_14
    move-exception v6

    .line 396
    .local v6, "e":Ljava/io/IOException;
    new-instance v0, Lorg/spongycastle/x509/X509V2CRLGenerator$ExtCRLException;

    const-string v1, "cannot generate CRL encoding"

    invoke-direct {v0, v1, v6}, Lorg/spongycastle/x509/X509V2CRLGenerator$ExtCRLException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method

.method public generate(Ljava/security/PrivateKey;Ljava/security/SecureRandom;)Ljava/security/cert/X509CRL;
    .registers 8
    .param p1, "key"    # Ljava/security/PrivateKey;
    .param p2, "random"    # Ljava/security/SecureRandom;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CRLException;,
            Ljava/lang/IllegalStateException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/SignatureException;,
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .prologue
    .line 350
    invoke-direct {p0}, Lorg/spongycastle/x509/X509V2CRLGenerator;->generateCertList()Lorg/spongycastle/asn1/x509/TBSCertList;

    move-result-object v2

    .line 355
    .local v2, "tbsCrl":Lorg/spongycastle/asn1/x509/TBSCertList;
    :try_start_4
    iget-object v3, p0, Lorg/spongycastle/x509/X509V2CRLGenerator;->sigOID:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    iget-object v4, p0, Lorg/spongycastle/x509/X509V2CRLGenerator;->signatureAlgorithm:Ljava/lang/String;

    invoke-static {v3, v4, p1, p2, v2}, Lorg/spongycastle/x509/X509Util;->calculateSignature(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Ljava/lang/String;Ljava/security/PrivateKey;Ljava/security/SecureRandom;Lorg/spongycastle/asn1/ASN1Encodable;)[B
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_b} :catch_11

    move-result-object v1

    .line 362
    .local v1, "signature":[B
    invoke-direct {p0, v2, v1}, Lorg/spongycastle/x509/X509V2CRLGenerator;->generateJcaObject(Lorg/spongycastle/asn1/x509/TBSCertList;[B)Ljava/security/cert/X509CRL;

    move-result-object v3

    return-object v3

    .line 357
    .end local v1    # "signature":[B
    :catch_11
    move-exception v0

    .line 359
    .local v0, "e":Ljava/io/IOException;
    new-instance v3, Lorg/spongycastle/x509/X509V2CRLGenerator$ExtCRLException;

    const-string v4, "cannot generate CRL encoding"

    invoke-direct {v3, v4, v0}, Lorg/spongycastle/x509/X509V2CRLGenerator$ExtCRLException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method public generateX509CRL(Ljava/security/PrivateKey;)Ljava/security/cert/X509CRL;
    .registers 5
    .param p1, "key"    # Ljava/security/PrivateKey;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/SecurityException;,
            Ljava/security/SignatureException;,
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .prologue
    .line 246
    :try_start_0
    const-string v1, "SC"

    const/4 v2, 0x0

    invoke-virtual {p0, p1, v1, v2}, Lorg/spongycastle/x509/X509V2CRLGenerator;->generateX509CRL(Ljava/security/PrivateKey;Ljava/lang/String;Ljava/security/SecureRandom;)Ljava/security/cert/X509CRL;
    :try_end_6
    .catch Ljava/security/NoSuchProviderException; {:try_start_0 .. :try_end_6} :catch_8

    move-result-object v1

    return-object v1

    .line 248
    :catch_8
    move-exception v0

    .line 250
    .local v0, "e":Ljava/security/NoSuchProviderException;
    new-instance v1, Ljava/lang/SecurityException;

    const-string v2, "BC provider not installed!"

    invoke-direct {v1, v2}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public generateX509CRL(Ljava/security/PrivateKey;Ljava/lang/String;)Ljava/security/cert/X509CRL;
    .registers 4
    .param p1, "key"    # Ljava/security/PrivateKey;
    .param p2, "provider"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchProviderException;,
            Ljava/lang/SecurityException;,
            Ljava/security/SignatureException;,
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .prologue
    .line 285
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/spongycastle/x509/X509V2CRLGenerator;->generateX509CRL(Ljava/security/PrivateKey;Ljava/lang/String;Ljava/security/SecureRandom;)Ljava/security/cert/X509CRL;

    move-result-object v0

    return-object v0
.end method

.method public generateX509CRL(Ljava/security/PrivateKey;Ljava/lang/String;Ljava/security/SecureRandom;)Ljava/security/cert/X509CRL;
    .registers 8
    .param p1, "key"    # Ljava/security/PrivateKey;
    .param p2, "provider"    # Ljava/lang/String;
    .param p3, "random"    # Ljava/security/SecureRandom;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchProviderException;,
            Ljava/lang/SecurityException;,
            Ljava/security/SignatureException;,
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .prologue
    .line 301
    :try_start_0
    invoke-virtual {p0, p1, p2, p3}, Lorg/spongycastle/x509/X509V2CRLGenerator;->generate(Ljava/security/PrivateKey;Ljava/lang/String;Ljava/security/SecureRandom;)Ljava/security/cert/X509CRL;
    :try_end_3
    .catch Ljava/security/NoSuchProviderException; {:try_start_0 .. :try_end_3} :catch_5
    .catch Ljava/security/SignatureException; {:try_start_0 .. :try_end_3} :catch_7
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_3} :catch_9
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_3} :catch_b

    move-result-object v1

    return-object v1

    .line 303
    :catch_5
    move-exception v0

    .line 305
    .local v0, "e":Ljava/security/NoSuchProviderException;
    throw v0

    .line 307
    .end local v0    # "e":Ljava/security/NoSuchProviderException;
    :catch_7
    move-exception v0

    .line 309
    .local v0, "e":Ljava/security/SignatureException;
    throw v0

    .line 311
    .end local v0    # "e":Ljava/security/SignatureException;
    :catch_9
    move-exception v0

    .line 313
    .local v0, "e":Ljava/security/InvalidKeyException;
    throw v0

    .line 315
    .end local v0    # "e":Ljava/security/InvalidKeyException;
    :catch_b
    move-exception v0

    .line 317
    .local v0, "e":Ljava/security/GeneralSecurityException;
    new-instance v1, Ljava/lang/SecurityException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "exception: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public generateX509CRL(Ljava/security/PrivateKey;Ljava/security/SecureRandom;)Ljava/security/cert/X509CRL;
    .registers 6
    .param p1, "key"    # Ljava/security/PrivateKey;
    .param p2, "random"    # Ljava/security/SecureRandom;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/SecurityException;,
            Ljava/security/SignatureException;,
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .prologue
    .line 267
    :try_start_0
    const-string v1, "SC"

    invoke-virtual {p0, p1, v1, p2}, Lorg/spongycastle/x509/X509V2CRLGenerator;->generateX509CRL(Ljava/security/PrivateKey;Ljava/lang/String;Ljava/security/SecureRandom;)Ljava/security/cert/X509CRL;
    :try_end_5
    .catch Ljava/security/NoSuchProviderException; {:try_start_0 .. :try_end_5} :catch_7

    move-result-object v1

    return-object v1

    .line 269
    :catch_7
    move-exception v0

    .line 271
    .local v0, "e":Ljava/security/NoSuchProviderException;
    new-instance v1, Ljava/lang/SecurityException;

    const-string v2, "BC provider not installed!"

    invoke-direct {v1, v2}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getSignatureAlgNames()Ljava/util/Iterator;
    .registers 2

    .prologue
    .line 431
    invoke-static {}, Lorg/spongycastle/x509/X509Util;->getAlgNames()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public reset()V
    .registers 2

    .prologue
    .line 65
    new-instance v0, Lorg/spongycastle/asn1/x509/V2TBSCertListGenerator;

    invoke-direct {v0}, Lorg/spongycastle/asn1/x509/V2TBSCertListGenerator;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/x509/X509V2CRLGenerator;->tbsGen:Lorg/spongycastle/asn1/x509/V2TBSCertListGenerator;

    .line 66
    iget-object v0, p0, Lorg/spongycastle/x509/X509V2CRLGenerator;->extGenerator:Lorg/spongycastle/asn1/x509/X509ExtensionsGenerator;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/X509ExtensionsGenerator;->reset()V

    .line 67
    return-void
.end method

.method public setIssuerDN(Ljavax/security/auth/x500/X500Principal;)V
    .registers 6
    .param p1, "issuer"    # Ljavax/security/auth/x500/X500Principal;

    .prologue
    .line 78
    :try_start_0
    iget-object v1, p0, Lorg/spongycastle/x509/X509V2CRLGenerator;->tbsGen:Lorg/spongycastle/asn1/x509/V2TBSCertListGenerator;

    new-instance v2, Lorg/spongycastle/jce/X509Principal;

    invoke-virtual {p1}, Ljavax/security/auth/x500/X500Principal;->getEncoded()[B

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/spongycastle/jce/X509Principal;-><init>([B)V

    invoke-virtual {v1, v2}, Lorg/spongycastle/asn1/x509/V2TBSCertListGenerator;->setIssuer(Lorg/spongycastle/asn1/x509/X509Name;)V
    :try_end_e
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_e} :catch_f

    .line 84
    return-void

    .line 80
    :catch_f
    move-exception v0

    .line 82
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "can\'t process principal: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public setIssuerDN(Lorg/spongycastle/asn1/x509/X509Name;)V
    .registers 3
    .param p1, "issuer"    # Lorg/spongycastle/asn1/x509/X509Name;

    .prologue
    .line 93
    iget-object v0, p0, Lorg/spongycastle/x509/X509V2CRLGenerator;->tbsGen:Lorg/spongycastle/asn1/x509/V2TBSCertListGenerator;

    invoke-virtual {v0, p1}, Lorg/spongycastle/asn1/x509/V2TBSCertListGenerator;->setIssuer(Lorg/spongycastle/asn1/x509/X509Name;)V

    .line 94
    return-void
.end method

.method public setNextUpdate(Ljava/util/Date;)V
    .registers 4
    .param p1, "date"    # Ljava/util/Date;

    .prologue
    .line 105
    iget-object v0, p0, Lorg/spongycastle/x509/X509V2CRLGenerator;->tbsGen:Lorg/spongycastle/asn1/x509/V2TBSCertListGenerator;

    new-instance v1, Lorg/spongycastle/asn1/x509/Time;

    invoke-direct {v1, p1}, Lorg/spongycastle/asn1/x509/Time;-><init>(Ljava/util/Date;)V

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/x509/V2TBSCertListGenerator;->setNextUpdate(Lorg/spongycastle/asn1/x509/Time;)V

    .line 106
    return-void
.end method

.method public setSignatureAlgorithm(Ljava/lang/String;)V
    .registers 5
    .param p1, "signatureAlgorithm"    # Ljava/lang/String;

    .prologue
    .line 175
    iput-object p1, p0, Lorg/spongycastle/x509/X509V2CRLGenerator;->signatureAlgorithm:Ljava/lang/String;

    .line 179
    :try_start_2
    invoke-static {p1}, Lorg/spongycastle/x509/X509Util;->getAlgorithmOID(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v1

    iput-object v1, p0, Lorg/spongycastle/x509/X509V2CRLGenerator;->sigOID:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_8} :catch_18

    .line 186
    iget-object v1, p0, Lorg/spongycastle/x509/X509V2CRLGenerator;->sigOID:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-static {v1, p1}, Lorg/spongycastle/x509/X509Util;->getSigAlgID(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Ljava/lang/String;)Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    move-result-object v1

    iput-object v1, p0, Lorg/spongycastle/x509/X509V2CRLGenerator;->sigAlgId:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    .line 188
    iget-object v1, p0, Lorg/spongycastle/x509/X509V2CRLGenerator;->tbsGen:Lorg/spongycastle/asn1/x509/V2TBSCertListGenerator;

    iget-object v2, p0, Lorg/spongycastle/x509/X509V2CRLGenerator;->sigAlgId:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    invoke-virtual {v1, v2}, Lorg/spongycastle/asn1/x509/V2TBSCertListGenerator;->setSignature(Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;)V

    .line 189
    return-void

    .line 181
    :catch_18
    move-exception v0

    .line 183
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Unknown signature type requested"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public setThisUpdate(Ljava/util/Date;)V
    .registers 4
    .param p1, "date"    # Ljava/util/Date;

    .prologue
    .line 99
    iget-object v0, p0, Lorg/spongycastle/x509/X509V2CRLGenerator;->tbsGen:Lorg/spongycastle/asn1/x509/V2TBSCertListGenerator;

    new-instance v1, Lorg/spongycastle/asn1/x509/Time;

    invoke-direct {v1, p1}, Lorg/spongycastle/asn1/x509/Time;-><init>(Ljava/util/Date;)V

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/x509/V2TBSCertListGenerator;->setThisUpdate(Lorg/spongycastle/asn1/x509/Time;)V

    .line 100
    return-void
.end method
