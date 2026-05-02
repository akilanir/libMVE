.class public Lorg/spongycastle/x509/X509V1CertificateGenerator;
.super Ljava/lang/Object;
.source "X509V1CertificateGenerator.java"


# instance fields
.field private sigAlgId:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

.field private sigOID:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field private signatureAlgorithm:Ljava/lang/String;

.field private tbsGen:Lorg/spongycastle/asn1/x509/V1TBSCertificateGenerator;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    new-instance v0, Lorg/spongycastle/asn1/x509/V1TBSCertificateGenerator;

    invoke-direct {v0}, Lorg/spongycastle/asn1/x509/V1TBSCertificateGenerator;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/x509/X509V1CertificateGenerator;->tbsGen:Lorg/spongycastle/asn1/x509/V1TBSCertificateGenerator;

    .line 50
    return-void
.end method

.method private generateJcaObject(Lorg/spongycastle/asn1/x509/TBSCertificate;[B)Ljava/security/cert/X509Certificate;
    .registers 7
    .param p1, "tbsCert"    # Lorg/spongycastle/asn1/x509/TBSCertificate;
    .param p2, "signature"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateEncodingException;
        }
    .end annotation

    .prologue
    .line 348
    new-instance v1, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct {v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 350
    .local v1, "v":Lorg/spongycastle/asn1/ASN1EncodableVector;
    invoke-virtual {v1, p1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 351
    iget-object v2, p0, Lorg/spongycastle/x509/X509V1CertificateGenerator;->sigAlgId:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    invoke-virtual {v1, v2}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 352
    new-instance v2, Lorg/spongycastle/asn1/DERBitString;

    invoke-direct {v2, p2}, Lorg/spongycastle/asn1/DERBitString;-><init>([B)V

    invoke-virtual {v1, v2}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 356
    :try_start_15
    new-instance v2, Lorg/spongycastle/jce/provider/X509CertificateObject;

    new-instance v3, Lorg/spongycastle/asn1/DERSequence;

    invoke-direct {v3, v1}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    invoke-static {v3}, Lorg/spongycastle/asn1/x509/Certificate;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/Certificate;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/spongycastle/jce/provider/X509CertificateObject;-><init>(Lorg/spongycastle/asn1/x509/Certificate;)V
    :try_end_23
    .catch Ljava/security/cert/CertificateParsingException; {:try_start_15 .. :try_end_23} :catch_24

    return-object v2

    .line 358
    :catch_24
    move-exception v0

    .line 360
    .local v0, "e":Ljava/security/cert/CertificateParsingException;
    new-instance v2, Lorg/spongycastle/x509/ExtCertificateEncodingException;

    const-string v3, "exception producing certificate object"

    invoke-direct {v2, v3, v0}, Lorg/spongycastle/x509/ExtCertificateEncodingException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method


# virtual methods
.method public generate(Ljava/security/PrivateKey;)Ljava/security/cert/X509Certificate;
    .registers 3
    .param p1, "key"    # Ljava/security/PrivateKey;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateEncodingException;,
            Ljava/lang/IllegalStateException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/SignatureException;,
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .prologue
    .line 275
    const/4 v0, 0x0

    check-cast v0, Ljava/security/SecureRandom;

    invoke-virtual {p0, p1, v0}, Lorg/spongycastle/x509/X509V1CertificateGenerator;->generate(Ljava/security/PrivateKey;Ljava/security/SecureRandom;)Ljava/security/cert/X509Certificate;

    move-result-object v0

    return-object v0
.end method

.method public generate(Ljava/security/PrivateKey;Ljava/lang/String;)Ljava/security/cert/X509Certificate;
    .registers 4
    .param p1, "key"    # Ljava/security/PrivateKey;
    .param p2, "provider"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateEncodingException;,
            Ljava/lang/IllegalStateException;,
            Ljava/security/NoSuchProviderException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/SignatureException;,
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .prologue
    .line 316
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/spongycastle/x509/X509V1CertificateGenerator;->generate(Ljava/security/PrivateKey;Ljava/lang/String;Ljava/security/SecureRandom;)Ljava/security/cert/X509Certificate;

    move-result-object v0

    return-object v0
.end method

.method public generate(Ljava/security/PrivateKey;Ljava/lang/String;Ljava/security/SecureRandom;)Ljava/security/cert/X509Certificate;
    .registers 12
    .param p1, "key"    # Ljava/security/PrivateKey;
    .param p2, "provider"    # Ljava/lang/String;
    .param p3, "random"    # Ljava/security/SecureRandom;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateEncodingException;,
            Ljava/lang/IllegalStateException;,
            Ljava/security/NoSuchProviderException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/SignatureException;,
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .prologue
    .line 330
    iget-object v0, p0, Lorg/spongycastle/x509/X509V1CertificateGenerator;->tbsGen:Lorg/spongycastle/asn1/x509/V1TBSCertificateGenerator;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/V1TBSCertificateGenerator;->generateTBSCertificate()Lorg/spongycastle/asn1/x509/TBSCertificate;

    move-result-object v5

    .line 335
    .local v5, "tbsCert":Lorg/spongycastle/asn1/x509/TBSCertificate;
    :try_start_6
    iget-object v0, p0, Lorg/spongycastle/x509/X509V1CertificateGenerator;->sigOID:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    iget-object v1, p0, Lorg/spongycastle/x509/X509V1CertificateGenerator;->signatureAlgorithm:Ljava/lang/String;

    move-object v2, p2

    move-object v3, p1

    move-object v4, p3

    invoke-static/range {v0 .. v5}, Lorg/spongycastle/x509/X509Util;->calculateSignature(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Ljava/lang/String;Ljava/lang/String;Ljava/security/PrivateKey;Ljava/security/SecureRandom;Lorg/spongycastle/asn1/ASN1Encodable;)[B
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_10} :catch_16

    move-result-object v7

    .line 342
    .local v7, "signature":[B
    invoke-direct {p0, v5, v7}, Lorg/spongycastle/x509/X509V1CertificateGenerator;->generateJcaObject(Lorg/spongycastle/asn1/x509/TBSCertificate;[B)Ljava/security/cert/X509Certificate;

    move-result-object v0

    return-object v0

    .line 337
    .end local v7    # "signature":[B
    :catch_16
    move-exception v6

    .line 339
    .local v6, "e":Ljava/io/IOException;
    new-instance v0, Lorg/spongycastle/x509/ExtCertificateEncodingException;

    const-string v1, "exception encoding TBS cert"

    invoke-direct {v0, v1, v6}, Lorg/spongycastle/x509/ExtCertificateEncodingException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method

.method public generate(Ljava/security/PrivateKey;Ljava/security/SecureRandom;)Ljava/security/cert/X509Certificate;
    .registers 8
    .param p1, "key"    # Ljava/security/PrivateKey;
    .param p2, "random"    # Ljava/security/SecureRandom;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateEncodingException;,
            Ljava/lang/IllegalStateException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/SignatureException;,
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .prologue
    .line 291
    iget-object v3, p0, Lorg/spongycastle/x509/X509V1CertificateGenerator;->tbsGen:Lorg/spongycastle/asn1/x509/V1TBSCertificateGenerator;

    invoke-virtual {v3}, Lorg/spongycastle/asn1/x509/V1TBSCertificateGenerator;->generateTBSCertificate()Lorg/spongycastle/asn1/x509/TBSCertificate;

    move-result-object v2

    .line 296
    .local v2, "tbsCert":Lorg/spongycastle/asn1/x509/TBSCertificate;
    :try_start_6
    iget-object v3, p0, Lorg/spongycastle/x509/X509V1CertificateGenerator;->sigOID:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    iget-object v4, p0, Lorg/spongycastle/x509/X509V1CertificateGenerator;->signatureAlgorithm:Ljava/lang/String;

    invoke-static {v3, v4, p1, p2, v2}, Lorg/spongycastle/x509/X509Util;->calculateSignature(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Ljava/lang/String;Ljava/security/PrivateKey;Ljava/security/SecureRandom;Lorg/spongycastle/asn1/ASN1Encodable;)[B
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_d} :catch_13

    move-result-object v1

    .line 303
    .local v1, "signature":[B
    invoke-direct {p0, v2, v1}, Lorg/spongycastle/x509/X509V1CertificateGenerator;->generateJcaObject(Lorg/spongycastle/asn1/x509/TBSCertificate;[B)Ljava/security/cert/X509Certificate;

    move-result-object v3

    return-object v3

    .line 298
    .end local v1    # "signature":[B
    :catch_13
    move-exception v0

    .line 300
    .local v0, "e":Ljava/io/IOException;
    new-instance v3, Lorg/spongycastle/x509/ExtCertificateEncodingException;

    const-string v4, "exception encoding TBS cert"

    invoke-direct {v3, v4, v0}, Lorg/spongycastle/x509/ExtCertificateEncodingException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method public generateX509Certificate(Ljava/security/PrivateKey;)Ljava/security/cert/X509Certificate;
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
    .line 187
    :try_start_0
    const-string v1, "SC"

    const/4 v2, 0x0

    invoke-virtual {p0, p1, v1, v2}, Lorg/spongycastle/x509/X509V1CertificateGenerator;->generateX509Certificate(Ljava/security/PrivateKey;Ljava/lang/String;Ljava/security/SecureRandom;)Ljava/security/cert/X509Certificate;
    :try_end_6
    .catch Ljava/security/NoSuchProviderException; {:try_start_0 .. :try_end_6} :catch_8

    move-result-object v1

    return-object v1

    .line 189
    :catch_8
    move-exception v0

    .line 191
    .local v0, "e":Ljava/security/NoSuchProviderException;
    new-instance v1, Ljava/lang/SecurityException;

    const-string v2, "BC provider not installed!"

    invoke-direct {v1, v2}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public generateX509Certificate(Ljava/security/PrivateKey;Ljava/lang/String;)Ljava/security/cert/X509Certificate;
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
    .line 226
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/spongycastle/x509/X509V1CertificateGenerator;->generateX509Certificate(Ljava/security/PrivateKey;Ljava/lang/String;Ljava/security/SecureRandom;)Ljava/security/cert/X509Certificate;

    move-result-object v0

    return-object v0
.end method

.method public generateX509Certificate(Ljava/security/PrivateKey;Ljava/lang/String;Ljava/security/SecureRandom;)Ljava/security/cert/X509Certificate;
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
    .line 243
    :try_start_0
    invoke-virtual {p0, p1, p2, p3}, Lorg/spongycastle/x509/X509V1CertificateGenerator;->generate(Ljava/security/PrivateKey;Ljava/lang/String;Ljava/security/SecureRandom;)Ljava/security/cert/X509Certificate;
    :try_end_3
    .catch Ljava/security/NoSuchProviderException; {:try_start_0 .. :try_end_3} :catch_5
    .catch Ljava/security/SignatureException; {:try_start_0 .. :try_end_3} :catch_7
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_3} :catch_9
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_3} :catch_b

    move-result-object v1

    return-object v1

    .line 245
    :catch_5
    move-exception v0

    .line 247
    .local v0, "e":Ljava/security/NoSuchProviderException;
    throw v0

    .line 249
    .end local v0    # "e":Ljava/security/NoSuchProviderException;
    :catch_7
    move-exception v0

    .line 251
    .local v0, "e":Ljava/security/SignatureException;
    throw v0

    .line 253
    .end local v0    # "e":Ljava/security/SignatureException;
    :catch_9
    move-exception v0

    .line 255
    .local v0, "e":Ljava/security/InvalidKeyException;
    throw v0

    .line 257
    .end local v0    # "e":Ljava/security/InvalidKeyException;
    :catch_b
    move-exception v0

    .line 259
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

.method public generateX509Certificate(Ljava/security/PrivateKey;Ljava/security/SecureRandom;)Ljava/security/cert/X509Certificate;
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
    .line 207
    :try_start_0
    const-string v1, "SC"

    invoke-virtual {p0, p1, v1, p2}, Lorg/spongycastle/x509/X509V1CertificateGenerator;->generateX509Certificate(Ljava/security/PrivateKey;Ljava/lang/String;Ljava/security/SecureRandom;)Ljava/security/cert/X509Certificate;
    :try_end_5
    .catch Ljava/security/NoSuchProviderException; {:try_start_0 .. :try_end_5} :catch_7

    move-result-object v1

    return-object v1

    .line 209
    :catch_7
    move-exception v0

    .line 211
    .local v0, "e":Ljava/security/NoSuchProviderException;
    new-instance v1, Ljava/lang/SecurityException;

    const-string v2, "BC provider not installed!"

    invoke-direct {v1, v2}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getSignatureAlgNames()Ljava/util/Iterator;
    .registers 2

    .prologue
    .line 371
    invoke-static {}, Lorg/spongycastle/x509/X509Util;->getAlgNames()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public reset()V
    .registers 2

    .prologue
    .line 57
    new-instance v0, Lorg/spongycastle/asn1/x509/V1TBSCertificateGenerator;

    invoke-direct {v0}, Lorg/spongycastle/asn1/x509/V1TBSCertificateGenerator;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/x509/X509V1CertificateGenerator;->tbsGen:Lorg/spongycastle/asn1/x509/V1TBSCertificateGenerator;

    .line 58
    return-void
.end method

.method public setIssuerDN(Ljavax/security/auth/x500/X500Principal;)V
    .registers 6
    .param p1, "issuer"    # Ljavax/security/auth/x500/X500Principal;

    .prologue
    .line 83
    :try_start_0
    iget-object v1, p0, Lorg/spongycastle/x509/X509V1CertificateGenerator;->tbsGen:Lorg/spongycastle/asn1/x509/V1TBSCertificateGenerator;

    new-instance v2, Lorg/spongycastle/jce/X509Principal;

    invoke-virtual {p1}, Ljavax/security/auth/x500/X500Principal;->getEncoded()[B

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/spongycastle/jce/X509Principal;-><init>([B)V

    invoke-virtual {v1, v2}, Lorg/spongycastle/asn1/x509/V1TBSCertificateGenerator;->setIssuer(Lorg/spongycastle/asn1/x509/X509Name;)V
    :try_end_e
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_e} :catch_f

    .line 89
    return-void

    .line 85
    :catch_f
    move-exception v0

    .line 87
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
    .line 98
    iget-object v0, p0, Lorg/spongycastle/x509/X509V1CertificateGenerator;->tbsGen:Lorg/spongycastle/asn1/x509/V1TBSCertificateGenerator;

    invoke-virtual {v0, p1}, Lorg/spongycastle/asn1/x509/V1TBSCertificateGenerator;->setIssuer(Lorg/spongycastle/asn1/x509/X509Name;)V

    .line 99
    return-void
.end method

.method public setNotAfter(Ljava/util/Date;)V
    .registers 4
    .param p1, "date"    # Ljava/util/Date;

    .prologue
    .line 110
    iget-object v0, p0, Lorg/spongycastle/x509/X509V1CertificateGenerator;->tbsGen:Lorg/spongycastle/asn1/x509/V1TBSCertificateGenerator;

    new-instance v1, Lorg/spongycastle/asn1/x509/Time;

    invoke-direct {v1, p1}, Lorg/spongycastle/asn1/x509/Time;-><init>(Ljava/util/Date;)V

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/x509/V1TBSCertificateGenerator;->setEndDate(Lorg/spongycastle/asn1/x509/Time;)V

    .line 111
    return-void
.end method

.method public setNotBefore(Ljava/util/Date;)V
    .registers 4
    .param p1, "date"    # Ljava/util/Date;

    .prologue
    .line 104
    iget-object v0, p0, Lorg/spongycastle/x509/X509V1CertificateGenerator;->tbsGen:Lorg/spongycastle/asn1/x509/V1TBSCertificateGenerator;

    new-instance v1, Lorg/spongycastle/asn1/x509/Time;

    invoke-direct {v1, p1}, Lorg/spongycastle/asn1/x509/Time;-><init>(Ljava/util/Date;)V

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/x509/V1TBSCertificateGenerator;->setStartDate(Lorg/spongycastle/asn1/x509/Time;)V

    .line 105
    return-void
.end method

.method public setPublicKey(Ljava/security/PublicKey;)V
    .registers 6
    .param p1, "key"    # Ljava/security/PublicKey;

    .prologue
    .line 143
    :try_start_0
    iget-object v1, p0, Lorg/spongycastle/x509/X509V1CertificateGenerator;->tbsGen:Lorg/spongycastle/asn1/x509/V1TBSCertificateGenerator;

    invoke-interface {p1}, Ljava/security/PublicKey;->getEncoded()[B

    move-result-object v2

    invoke-static {v2}, Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/spongycastle/asn1/x509/V1TBSCertificateGenerator;->setSubjectPublicKeyInfo(Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;)V
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_d} :catch_e

    .line 149
    return-void

    .line 145
    :catch_e
    move-exception v0

    .line 147
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "unable to process key - "

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
.end method

.method public setSerialNumber(Ljava/math/BigInteger;)V
    .registers 4
    .param p1, "serialNumber"    # Ljava/math/BigInteger;

    .prologue
    .line 66
    sget-object v0, Ljava/math/BigInteger;->ZERO:Ljava/math/BigInteger;

    invoke-virtual {p1, v0}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v0

    if-gtz v0, :cond_10

    .line 68
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "serial number must be a positive integer"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 71
    :cond_10
    iget-object v0, p0, Lorg/spongycastle/x509/X509V1CertificateGenerator;->tbsGen:Lorg/spongycastle/asn1/x509/V1TBSCertificateGenerator;

    new-instance v1, Lorg/spongycastle/asn1/ASN1Integer;

    invoke-direct {v1, p1}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(Ljava/math/BigInteger;)V

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/x509/V1TBSCertificateGenerator;->setSerialNumber(Lorg/spongycastle/asn1/ASN1Integer;)V

    .line 72
    return-void
.end method

.method public setSignatureAlgorithm(Ljava/lang/String;)V
    .registers 5
    .param p1, "signatureAlgorithm"    # Ljava/lang/String;

    .prologue
    .line 160
    iput-object p1, p0, Lorg/spongycastle/x509/X509V1CertificateGenerator;->signatureAlgorithm:Ljava/lang/String;

    .line 164
    :try_start_2
    invoke-static {p1}, Lorg/spongycastle/x509/X509Util;->getAlgorithmOID(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v1

    iput-object v1, p0, Lorg/spongycastle/x509/X509V1CertificateGenerator;->sigOID:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_8} :catch_18

    .line 171
    iget-object v1, p0, Lorg/spongycastle/x509/X509V1CertificateGenerator;->sigOID:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-static {v1, p1}, Lorg/spongycastle/x509/X509Util;->getSigAlgID(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Ljava/lang/String;)Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    move-result-object v1

    iput-object v1, p0, Lorg/spongycastle/x509/X509V1CertificateGenerator;->sigAlgId:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    .line 173
    iget-object v1, p0, Lorg/spongycastle/x509/X509V1CertificateGenerator;->tbsGen:Lorg/spongycastle/asn1/x509/V1TBSCertificateGenerator;

    iget-object v2, p0, Lorg/spongycastle/x509/X509V1CertificateGenerator;->sigAlgId:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    invoke-virtual {v1, v2}, Lorg/spongycastle/asn1/x509/V1TBSCertificateGenerator;->setSignature(Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;)V

    .line 174
    return-void

    .line 166
    :catch_18
    move-exception v0

    .line 168
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Unknown signature type requested"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public setSubjectDN(Ljavax/security/auth/x500/X500Principal;)V
    .registers 6
    .param p1, "subject"    # Ljavax/security/auth/x500/X500Principal;

    .prologue
    .line 121
    :try_start_0
    iget-object v1, p0, Lorg/spongycastle/x509/X509V1CertificateGenerator;->tbsGen:Lorg/spongycastle/asn1/x509/V1TBSCertificateGenerator;

    new-instance v2, Lorg/spongycastle/jce/X509Principal;

    invoke-virtual {p1}, Ljavax/security/auth/x500/X500Principal;->getEncoded()[B

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/spongycastle/jce/X509Principal;-><init>([B)V

    invoke-virtual {v1, v2}, Lorg/spongycastle/asn1/x509/V1TBSCertificateGenerator;->setSubject(Lorg/spongycastle/asn1/x509/X509Name;)V
    :try_end_e
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_e} :catch_f

    .line 127
    return-void

    .line 123
    :catch_f
    move-exception v0

    .line 125
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

.method public setSubjectDN(Lorg/spongycastle/asn1/x509/X509Name;)V
    .registers 3
    .param p1, "subject"    # Lorg/spongycastle/asn1/x509/X509Name;

    .prologue
    .line 135
    iget-object v0, p0, Lorg/spongycastle/x509/X509V1CertificateGenerator;->tbsGen:Lorg/spongycastle/asn1/x509/V1TBSCertificateGenerator;

    invoke-virtual {v0, p1}, Lorg/spongycastle/asn1/x509/V1TBSCertificateGenerator;->setSubject(Lorg/spongycastle/asn1/x509/X509Name;)V

    .line 136
    return-void
.end method
