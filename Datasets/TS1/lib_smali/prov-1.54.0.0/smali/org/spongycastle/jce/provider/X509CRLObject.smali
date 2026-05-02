.class public Lorg/spongycastle/jce/provider/X509CRLObject;
.super Ljava/security/cert/X509CRL;
.source "X509CRLObject.java"


# instance fields
.field private c:Lorg/spongycastle/asn1/x509/CertificateList;

.field private hashCodeValue:I

.field private isHashCodeSet:Z

.field private isIndirect:Z

.field private sigAlgName:Ljava/lang/String;

.field private sigAlgParams:[B


# direct methods
.method public constructor <init>(Lorg/spongycastle/asn1/x509/CertificateList;)V
    .registers 6
    .param p1, "c"    # Lorg/spongycastle/asn1/x509/CertificateList;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CRLException;
        }
    .end annotation

    .prologue
    .line 86
    invoke-direct {p0}, Ljava/security/cert/X509CRL;-><init>()V

    .line 64
    const/4 v1, 0x0

    iput-boolean v1, p0, Lorg/spongycastle/jce/provider/X509CRLObject;->isHashCodeSet:Z

    .line 87
    iput-object p1, p0, Lorg/spongycastle/jce/provider/X509CRLObject;->c:Lorg/spongycastle/asn1/x509/CertificateList;

    .line 91
    :try_start_8
    invoke-virtual {p1}, Lorg/spongycastle/asn1/x509/CertificateList;->getSignatureAlgorithm()Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    move-result-object v1

    invoke-static {v1}, Lorg/spongycastle/jce/provider/X509SignatureUtil;->getSignatureName(Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/spongycastle/jce/provider/X509CRLObject;->sigAlgName:Ljava/lang/String;

    .line 93
    invoke-virtual {p1}, Lorg/spongycastle/asn1/x509/CertificateList;->getSignatureAlgorithm()Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    move-result-object v1

    invoke-virtual {v1}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->getParameters()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v1

    if-eqz v1, :cond_37

    .line 95
    invoke-virtual {p1}, Lorg/spongycastle/asn1/x509/CertificateList;->getSignatureAlgorithm()Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    move-result-object v1

    invoke-virtual {v1}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->getParameters()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v1

    invoke-interface {v1}, Lorg/spongycastle/asn1/ASN1Encodable;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v1

    const-string v2, "DER"

    invoke-virtual {v1, v2}, Lorg/spongycastle/asn1/ASN1Primitive;->getEncoded(Ljava/lang/String;)[B

    move-result-object v1

    iput-object v1, p0, Lorg/spongycastle/jce/provider/X509CRLObject;->sigAlgParams:[B

    .line 102
    :goto_30
    invoke-static {p0}, Lorg/spongycastle/jce/provider/X509CRLObject;->isIndirectCRL(Ljava/security/cert/X509CRL;)Z

    move-result v1

    iput-boolean v1, p0, Lorg/spongycastle/jce/provider/X509CRLObject;->isIndirect:Z

    .line 108
    return-void

    .line 99
    :cond_37
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/spongycastle/jce/provider/X509CRLObject;->sigAlgParams:[B
    :try_end_3a
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_3a} :catch_3b

    goto :goto_30

    .line 104
    :catch_3b
    move-exception v0

    .line 106
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/security/cert/CRLException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "CRL contents invalid: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/security/cert/CRLException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private doVerify(Ljava/security/PublicKey;Ljava/security/Signature;)V
    .registers 5
    .param p1, "key"    # Ljava/security/PublicKey;
    .param p2, "sig"    # Ljava/security/Signature;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CRLException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/InvalidKeyException;,
            Ljava/security/SignatureException;
        }
    .end annotation

    .prologue
    .line 263
    iget-object v0, p0, Lorg/spongycastle/jce/provider/X509CRLObject;->c:Lorg/spongycastle/asn1/x509/CertificateList;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/CertificateList;->getSignatureAlgorithm()Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    move-result-object v0

    iget-object v1, p0, Lorg/spongycastle/jce/provider/X509CRLObject;->c:Lorg/spongycastle/asn1/x509/CertificateList;

    invoke-virtual {v1}, Lorg/spongycastle/asn1/x509/CertificateList;->getTBSCertList()Lorg/spongycastle/asn1/x509/TBSCertList;

    move-result-object v1

    invoke-virtual {v1}, Lorg/spongycastle/asn1/x509/TBSCertList;->getSignature()Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1e

    .line 265
    new-instance v0, Ljava/security/cert/CRLException;

    const-string v1, "Signature algorithm on CertificateList does not match TBSCertList."

    invoke-direct {v0, v1}, Ljava/security/cert/CRLException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 268
    :cond_1e
    invoke-virtual {p2, p1}, Ljava/security/Signature;->initVerify(Ljava/security/PublicKey;)V

    .line 269
    invoke-virtual {p0}, Lorg/spongycastle/jce/provider/X509CRLObject;->getTBSCertList()[B

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/security/Signature;->update([B)V

    .line 271
    invoke-virtual {p0}, Lorg/spongycastle/jce/provider/X509CRLObject;->getSignature()[B

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/security/Signature;->verify([B)Z

    move-result v0

    if-nez v0, :cond_3a

    .line 273
    new-instance v0, Ljava/security/SignatureException;

    const-string v1, "CRL does not verify with supplied public key."

    invoke-direct {v0, v1}, Ljava/security/SignatureException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 275
    :cond_3a
    return-void
.end method

.method private getExtensionOIDs(Z)Ljava/util/Set;
    .registers 9
    .param p1, "critical"    # Z

    .prologue
    .line 131
    invoke-virtual {p0}, Lorg/spongycastle/jce/provider/X509CRLObject;->getVersion()I

    move-result v5

    const/4 v6, 0x2

    if-ne v5, v6, :cond_3a

    .line 133
    iget-object v5, p0, Lorg/spongycastle/jce/provider/X509CRLObject;->c:Lorg/spongycastle/asn1/x509/CertificateList;

    invoke-virtual {v5}, Lorg/spongycastle/asn1/x509/CertificateList;->getTBSCertList()Lorg/spongycastle/asn1/x509/TBSCertList;

    move-result-object v5

    invoke-virtual {v5}, Lorg/spongycastle/asn1/x509/TBSCertList;->getExtensions()Lorg/spongycastle/asn1/x509/Extensions;

    move-result-object v2

    .line 135
    .local v2, "extensions":Lorg/spongycastle/asn1/x509/Extensions;
    if-eqz v2, :cond_3a

    .line 137
    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    .line 138
    .local v4, "set":Ljava/util/Set;
    invoke-virtual {v2}, Lorg/spongycastle/asn1/x509/Extensions;->oids()Ljava/util/Enumeration;

    move-result-object v0

    .line 140
    .local v0, "e":Ljava/util/Enumeration;
    :cond_1c
    :goto_1c
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    if-eqz v5, :cond_3b

    .line 142
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 143
    .local v3, "oid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    invoke-virtual {v2, v3}, Lorg/spongycastle/asn1/x509/Extensions;->getExtension(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Lorg/spongycastle/asn1/x509/Extension;

    move-result-object v1

    .line 145
    .local v1, "ext":Lorg/spongycastle/asn1/x509/Extension;
    invoke-virtual {v1}, Lorg/spongycastle/asn1/x509/Extension;->isCritical()Z

    move-result v5

    if-ne p1, v5, :cond_1c

    .line 147
    invoke-virtual {v3}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_1c

    .line 155
    .end local v0    # "e":Ljava/util/Enumeration;
    .end local v1    # "ext":Lorg/spongycastle/asn1/x509/Extension;
    .end local v2    # "extensions":Lorg/spongycastle/asn1/x509/Extensions;
    .end local v3    # "oid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .end local v4    # "set":Ljava/util/Set;
    :cond_3a
    const/4 v4, 0x0

    :cond_3b
    return-object v4
.end method

.method public static isIndirectCRL(Ljava/security/cert/X509CRL;)Z
    .registers 5
    .param p0, "crl"    # Ljava/security/cert/X509CRL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CRLException;
        }
    .end annotation

    .prologue
    .line 72
    :try_start_0
    sget-object v2, Lorg/spongycastle/asn1/x509/Extension;->issuingDistributionPoint:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Ljava/security/cert/X509CRL;->getExtensionValue(Ljava/lang/String;)[B

    move-result-object v1

    .line 73
    .local v1, "idp":[B
    if-eqz v1, :cond_20

    .line 74
    invoke-static {v1}, Lorg/spongycastle/asn1/ASN1OctetString;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1OctetString;

    move-result-object v2

    invoke-virtual {v2}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v2

    invoke-static {v2}, Lorg/spongycastle/asn1/x509/IssuingDistributionPoint;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/IssuingDistributionPoint;

    move-result-object v2

    invoke-virtual {v2}, Lorg/spongycastle/asn1/x509/IssuingDistributionPoint;->isIndirectCRL()Z
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_1b} :catch_22

    move-result v2

    if-eqz v2, :cond_20

    const/4 v2, 0x1

    :goto_1f
    return v2

    :cond_20
    const/4 v2, 0x0

    goto :goto_1f

    .line 76
    .end local v1    # "idp":[B
    :catch_22
    move-exception v0

    .line 78
    .local v0, "e":Ljava/lang/Exception;
    new-instance v2, Lorg/spongycastle/jce/provider/ExtCRLException;

    const-string v3, "Exception reading IssuingDistributionPoint"

    invoke-direct {v2, v3, v0}, Lorg/spongycastle/jce/provider/ExtCRLException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method private loadCRLEntries()Ljava/util/Set;
    .registers 9

    .prologue
    .line 316
    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    .line 317
    .local v4, "entrySet":Ljava/util/Set;
    iget-object v6, p0, Lorg/spongycastle/jce/provider/X509CRLObject;->c:Lorg/spongycastle/asn1/x509/CertificateList;

    invoke-virtual {v6}, Lorg/spongycastle/asn1/x509/CertificateList;->getRevokedCertificateEnumeration()Ljava/util/Enumeration;

    move-result-object v0

    .line 319
    .local v0, "certs":Ljava/util/Enumeration;
    const/4 v5, 0x0

    .line 320
    .local v5, "previousCertificateIssuer":Lorg/spongycastle/asn1/x500/X500Name;
    :cond_c
    :goto_c
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v6

    if-eqz v6, :cond_50

    .line 322
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/spongycastle/asn1/x509/TBSCertList$CRLEntry;

    .line 323
    .local v3, "entry":Lorg/spongycastle/asn1/x509/TBSCertList$CRLEntry;
    new-instance v1, Lorg/spongycastle/jce/provider/X509CRLEntryObject;

    iget-boolean v6, p0, Lorg/spongycastle/jce/provider/X509CRLObject;->isIndirect:Z

    invoke-direct {v1, v3, v6, v5}, Lorg/spongycastle/jce/provider/X509CRLEntryObject;-><init>(Lorg/spongycastle/asn1/x509/TBSCertList$CRLEntry;ZLorg/spongycastle/asn1/x500/X500Name;)V

    .line 324
    .local v1, "crlEntry":Lorg/spongycastle/jce/provider/X509CRLEntryObject;
    invoke-interface {v4, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 325
    iget-boolean v6, p0, Lorg/spongycastle/jce/provider/X509CRLObject;->isIndirect:Z

    if-eqz v6, :cond_c

    invoke-virtual {v3}, Lorg/spongycastle/asn1/x509/TBSCertList$CRLEntry;->hasExtensions()Z

    move-result v6

    if-eqz v6, :cond_c

    .line 327
    invoke-virtual {v3}, Lorg/spongycastle/asn1/x509/TBSCertList$CRLEntry;->getExtensions()Lorg/spongycastle/asn1/x509/Extensions;

    move-result-object v6

    sget-object v7, Lorg/spongycastle/asn1/x509/Extension;->certificateIssuer:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v6, v7}, Lorg/spongycastle/asn1/x509/Extensions;->getExtension(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Lorg/spongycastle/asn1/x509/Extension;

    move-result-object v2

    .line 329
    .local v2, "currentCaName":Lorg/spongycastle/asn1/x509/Extension;
    if-eqz v2, :cond_c

    .line 331
    invoke-virtual {v2}, Lorg/spongycastle/asn1/x509/Extension;->getParsedValue()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v6

    invoke-static {v6}, Lorg/spongycastle/asn1/x509/GeneralNames;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/GeneralNames;

    move-result-object v6

    invoke-virtual {v6}, Lorg/spongycastle/asn1/x509/GeneralNames;->getNames()[Lorg/spongycastle/asn1/x509/GeneralName;

    move-result-object v6

    const/4 v7, 0x0

    aget-object v6, v6, v7

    invoke-virtual {v6}, Lorg/spongycastle/asn1/x509/GeneralName;->getName()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v6

    invoke-static {v6}, Lorg/spongycastle/asn1/x500/X500Name;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x500/X500Name;

    move-result-object v5

    goto :goto_c

    .line 336
    .end local v1    # "crlEntry":Lorg/spongycastle/jce/provider/X509CRLEntryObject;
    .end local v2    # "currentCaName":Lorg/spongycastle/asn1/x509/Extension;
    .end local v3    # "entry":Lorg/spongycastle/asn1/x509/TBSCertList$CRLEntry;
    :cond_50
    return-object v4
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "other"    # Ljava/lang/Object;

    .prologue
    const/4 v2, 0x0

    .line 620
    if-ne p0, p1, :cond_5

    .line 622
    const/4 v2, 0x1

    .line 649
    :cond_4
    :goto_4
    return v2

    .line 625
    :cond_5
    instance-of v3, p1, Ljava/security/cert/X509CRL;

    if-eqz v3, :cond_4

    .line 630
    instance-of v3, p1, Lorg/spongycastle/jce/provider/X509CRLObject;

    if-eqz v3, :cond_27

    move-object v0, p1

    .line 632
    check-cast v0, Lorg/spongycastle/jce/provider/X509CRLObject;

    .line 634
    .local v0, "crlObject":Lorg/spongycastle/jce/provider/X509CRLObject;
    iget-boolean v3, p0, Lorg/spongycastle/jce/provider/X509CRLObject;->isHashCodeSet:Z

    if-eqz v3, :cond_1e

    .line 636
    iget-boolean v1, v0, Lorg/spongycastle/jce/provider/X509CRLObject;->isHashCodeSet:Z

    .line 637
    .local v1, "otherIsHashCodeSet":Z
    if-eqz v1, :cond_1e

    .line 639
    iget v3, v0, Lorg/spongycastle/jce/provider/X509CRLObject;->hashCodeValue:I

    iget v4, p0, Lorg/spongycastle/jce/provider/X509CRLObject;->hashCodeValue:I

    if-ne v3, v4, :cond_4

    .line 646
    .end local v1    # "otherIsHashCodeSet":Z
    :cond_1e
    iget-object v2, p0, Lorg/spongycastle/jce/provider/X509CRLObject;->c:Lorg/spongycastle/asn1/x509/CertificateList;

    iget-object v3, v0, Lorg/spongycastle/jce/provider/X509CRLObject;->c:Lorg/spongycastle/asn1/x509/CertificateList;

    invoke-virtual {v2, v3}, Lorg/spongycastle/asn1/x509/CertificateList;->equals(Ljava/lang/Object;)Z

    move-result v2

    goto :goto_4

    .line 649
    .end local v0    # "crlObject":Lorg/spongycastle/jce/provider/X509CRLObject;
    :cond_27
    invoke-super {p0, p1}, Ljava/security/cert/X509CRL;->equals(Ljava/lang/Object;)Z

    move-result v2

    goto :goto_4
.end method

.method public getCriticalExtensionOIDs()Ljava/util/Set;
    .registers 2

    .prologue
    .line 160
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lorg/spongycastle/jce/provider/X509CRLObject;->getExtensionOIDs(Z)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getEncoded()[B
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CRLException;
        }
    .end annotation

    .prologue
    .line 197
    :try_start_0
    iget-object v1, p0, Lorg/spongycastle/jce/provider/X509CRLObject;->c:Lorg/spongycastle/asn1/x509/CertificateList;

    const-string v2, "DER"

    invoke-virtual {v1, v2}, Lorg/spongycastle/asn1/x509/CertificateList;->getEncoded(Ljava/lang/String;)[B
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_7} :catch_9

    move-result-object v1

    return-object v1

    .line 199
    :catch_9
    move-exception v0

    .line 201
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/security/cert/CRLException;

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/security/cert/CRLException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getExtensionValue(Ljava/lang/String;)[B
    .registers 8
    .param p1, "oid"    # Ljava/lang/String;

    .prologue
    .line 170
    iget-object v3, p0, Lorg/spongycastle/jce/provider/X509CRLObject;->c:Lorg/spongycastle/asn1/x509/CertificateList;

    invoke-virtual {v3}, Lorg/spongycastle/asn1/x509/CertificateList;->getTBSCertList()Lorg/spongycastle/asn1/x509/TBSCertList;

    move-result-object v3

    invoke-virtual {v3}, Lorg/spongycastle/asn1/x509/TBSCertList;->getExtensions()Lorg/spongycastle/asn1/x509/Extensions;

    move-result-object v2

    .line 172
    .local v2, "exts":Lorg/spongycastle/asn1/x509/Extensions;
    if-eqz v2, :cond_3e

    .line 174
    new-instance v3, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-direct {v3, p1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Lorg/spongycastle/asn1/x509/Extensions;->getExtension(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Lorg/spongycastle/asn1/x509/Extension;

    move-result-object v1

    .line 176
    .local v1, "ext":Lorg/spongycastle/asn1/x509/Extension;
    if-eqz v1, :cond_3e

    .line 180
    :try_start_17
    invoke-virtual {v1}, Lorg/spongycastle/asn1/x509/Extension;->getExtnValue()Lorg/spongycastle/asn1/ASN1OctetString;

    move-result-object v3

    invoke-virtual {v3}, Lorg/spongycastle/asn1/ASN1OctetString;->getEncoded()[B
    :try_end_1e
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_1e} :catch_20

    move-result-object v3

    .line 189
    .end local v1    # "ext":Lorg/spongycastle/asn1/x509/Extension;
    :goto_1f
    return-object v3

    .line 182
    .restart local v1    # "ext":Lorg/spongycastle/asn1/x509/Extension;
    :catch_20
    move-exception v0

    .line 184
    .local v0, "e":Ljava/lang/Exception;
    new-instance v3, Ljava/lang/IllegalStateException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "error parsing "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 189
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "ext":Lorg/spongycastle/asn1/x509/Extension;
    :cond_3e
    const/4 v3, 0x0

    goto :goto_1f
.end method

.method public getIssuerDN()Ljava/security/Principal;
    .registers 3

    .prologue
    .line 284
    new-instance v0, Lorg/spongycastle/jce/X509Principal;

    iget-object v1, p0, Lorg/spongycastle/jce/provider/X509CRLObject;->c:Lorg/spongycastle/asn1/x509/CertificateList;

    invoke-virtual {v1}, Lorg/spongycastle/asn1/x509/CertificateList;->getIssuer()Lorg/spongycastle/asn1/x500/X500Name;

    move-result-object v1

    invoke-virtual {v1}, Lorg/spongycastle/asn1/x500/X500Name;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v1

    invoke-static {v1}, Lorg/spongycastle/asn1/x500/X500Name;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x500/X500Name;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/jce/X509Principal;-><init>(Lorg/spongycastle/asn1/x500/X500Name;)V

    return-object v0
.end method

.method public getIssuerX500Principal()Ljavax/security/auth/x500/X500Principal;
    .registers 4

    .prologue
    .line 291
    :try_start_0
    new-instance v1, Ljavax/security/auth/x500/X500Principal;

    iget-object v2, p0, Lorg/spongycastle/jce/provider/X509CRLObject;->c:Lorg/spongycastle/asn1/x509/CertificateList;

    invoke-virtual {v2}, Lorg/spongycastle/asn1/x509/CertificateList;->getIssuer()Lorg/spongycastle/asn1/x500/X500Name;

    move-result-object v2

    invoke-virtual {v2}, Lorg/spongycastle/asn1/x500/X500Name;->getEncoded()[B

    move-result-object v2

    invoke-direct {v1, v2}, Ljavax/security/auth/x500/X500Principal;-><init>([B)V
    :try_end_f
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_f} :catch_10

    return-object v1

    .line 293
    :catch_10
    move-exception v0

    .line 295
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "can\'t encode issuer DN"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getNextUpdate()Ljava/util/Date;
    .registers 2

    .prologue
    .line 306
    iget-object v0, p0, Lorg/spongycastle/jce/provider/X509CRLObject;->c:Lorg/spongycastle/asn1/x509/CertificateList;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/CertificateList;->getNextUpdate()Lorg/spongycastle/asn1/x509/Time;

    move-result-object v0

    if-eqz v0, :cond_13

    .line 308
    iget-object v0, p0, Lorg/spongycastle/jce/provider/X509CRLObject;->c:Lorg/spongycastle/asn1/x509/CertificateList;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/CertificateList;->getNextUpdate()Lorg/spongycastle/asn1/x509/Time;

    move-result-object v0

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/Time;->getDate()Ljava/util/Date;

    move-result-object v0

    .line 311
    :goto_12
    return-object v0

    :cond_13
    const/4 v0, 0x0

    goto :goto_12
.end method

.method public getNonCriticalExtensionOIDs()Ljava/util/Set;
    .registers 2

    .prologue
    .line 165
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/spongycastle/jce/provider/X509CRLObject;->getExtensionOIDs(Z)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getRevokedCertificate(Ljava/math/BigInteger;)Ljava/security/cert/X509CRLEntry;
    .registers 8
    .param p1, "serialNumber"    # Ljava/math/BigInteger;

    .prologue
    .line 341
    iget-object v4, p0, Lorg/spongycastle/jce/provider/X509CRLObject;->c:Lorg/spongycastle/asn1/x509/CertificateList;

    invoke-virtual {v4}, Lorg/spongycastle/asn1/x509/CertificateList;->getRevokedCertificateEnumeration()Ljava/util/Enumeration;

    move-result-object v0

    .line 343
    .local v0, "certs":Ljava/util/Enumeration;
    const/4 v3, 0x0

    .line 344
    .local v3, "previousCertificateIssuer":Lorg/spongycastle/asn1/x500/X500Name;
    :cond_7
    :goto_7
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-eqz v4, :cond_57

    .line 346
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/spongycastle/asn1/x509/TBSCertList$CRLEntry;

    .line 348
    .local v2, "entry":Lorg/spongycastle/asn1/x509/TBSCertList$CRLEntry;
    invoke-virtual {v2}, Lorg/spongycastle/asn1/x509/TBSCertList$CRLEntry;->getUserCertificate()Lorg/spongycastle/asn1/ASN1Integer;

    move-result-object v4

    invoke-virtual {v4}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_29

    .line 350
    new-instance v4, Lorg/spongycastle/jce/provider/X509CRLEntryObject;

    iget-boolean v5, p0, Lorg/spongycastle/jce/provider/X509CRLObject;->isIndirect:Z

    invoke-direct {v4, v2, v5, v3}, Lorg/spongycastle/jce/provider/X509CRLEntryObject;-><init>(Lorg/spongycastle/asn1/x509/TBSCertList$CRLEntry;ZLorg/spongycastle/asn1/x500/X500Name;)V

    .line 364
    .end local v2    # "entry":Lorg/spongycastle/asn1/x509/TBSCertList$CRLEntry;
    :goto_28
    return-object v4

    .line 353
    .restart local v2    # "entry":Lorg/spongycastle/asn1/x509/TBSCertList$CRLEntry;
    :cond_29
    iget-boolean v4, p0, Lorg/spongycastle/jce/provider/X509CRLObject;->isIndirect:Z

    if-eqz v4, :cond_7

    invoke-virtual {v2}, Lorg/spongycastle/asn1/x509/TBSCertList$CRLEntry;->hasExtensions()Z

    move-result v4

    if-eqz v4, :cond_7

    .line 355
    invoke-virtual {v2}, Lorg/spongycastle/asn1/x509/TBSCertList$CRLEntry;->getExtensions()Lorg/spongycastle/asn1/x509/Extensions;

    move-result-object v4

    sget-object v5, Lorg/spongycastle/asn1/x509/Extension;->certificateIssuer:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v4, v5}, Lorg/spongycastle/asn1/x509/Extensions;->getExtension(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Lorg/spongycastle/asn1/x509/Extension;

    move-result-object v1

    .line 357
    .local v1, "currentCaName":Lorg/spongycastle/asn1/x509/Extension;
    if-eqz v1, :cond_7

    .line 359
    invoke-virtual {v1}, Lorg/spongycastle/asn1/x509/Extension;->getParsedValue()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v4

    invoke-static {v4}, Lorg/spongycastle/asn1/x509/GeneralNames;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/GeneralNames;

    move-result-object v4

    invoke-virtual {v4}, Lorg/spongycastle/asn1/x509/GeneralNames;->getNames()[Lorg/spongycastle/asn1/x509/GeneralName;

    move-result-object v4

    const/4 v5, 0x0

    aget-object v4, v4, v5

    invoke-virtual {v4}, Lorg/spongycastle/asn1/x509/GeneralName;->getName()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v4

    invoke-static {v4}, Lorg/spongycastle/asn1/x500/X500Name;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x500/X500Name;

    move-result-object v3

    goto :goto_7

    .line 364
    .end local v1    # "currentCaName":Lorg/spongycastle/asn1/x509/Extension;
    .end local v2    # "entry":Lorg/spongycastle/asn1/x509/TBSCertList$CRLEntry;
    :cond_57
    const/4 v4, 0x0

    goto :goto_28
.end method

.method public getRevokedCertificates()Ljava/util/Set;
    .registers 3

    .prologue
    .line 369
    invoke-direct {p0}, Lorg/spongycastle/jce/provider/X509CRLObject;->loadCRLEntries()Ljava/util/Set;

    move-result-object v0

    .line 371
    .local v0, "entrySet":Ljava/util/Set;
    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_f

    .line 373
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v1

    .line 376
    :goto_e
    return-object v1

    :cond_f
    const/4 v1, 0x0

    goto :goto_e
.end method

.method public getSigAlgName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 399
    iget-object v0, p0, Lorg/spongycastle/jce/provider/X509CRLObject;->sigAlgName:Ljava/lang/String;

    return-object v0
.end method

.method public getSigAlgOID()Ljava/lang/String;
    .registers 2

    .prologue
    .line 404
    iget-object v0, p0, Lorg/spongycastle/jce/provider/X509CRLObject;->c:Lorg/spongycastle/asn1/x509/CertificateList;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/CertificateList;->getSignatureAlgorithm()Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    move-result-object v0

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->getAlgorithm()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v0

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSigAlgParams()[B
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 409
    iget-object v1, p0, Lorg/spongycastle/jce/provider/X509CRLObject;->sigAlgParams:[B

    if-eqz v1, :cond_11

    .line 411
    iget-object v1, p0, Lorg/spongycastle/jce/provider/X509CRLObject;->sigAlgParams:[B

    array-length v1, v1

    new-array v0, v1, [B

    .line 413
    .local v0, "tmp":[B
    iget-object v1, p0, Lorg/spongycastle/jce/provider/X509CRLObject;->sigAlgParams:[B

    array-length v2, v0

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 418
    .end local v0    # "tmp":[B
    :goto_10
    return-object v0

    :cond_11
    const/4 v0, 0x0

    goto :goto_10
.end method

.method public getSignature()[B
    .registers 2

    .prologue
    .line 394
    iget-object v0, p0, Lorg/spongycastle/jce/provider/X509CRLObject;->c:Lorg/spongycastle/asn1/x509/CertificateList;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/CertificateList;->getSignature()Lorg/spongycastle/asn1/DERBitString;

    move-result-object v0

    invoke-virtual {v0}, Lorg/spongycastle/asn1/DERBitString;->getOctets()[B

    move-result-object v0

    return-object v0
.end method

.method public getTBSCertList()[B
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CRLException;
        }
    .end annotation

    .prologue
    .line 384
    :try_start_0
    iget-object v1, p0, Lorg/spongycastle/jce/provider/X509CRLObject;->c:Lorg/spongycastle/asn1/x509/CertificateList;

    invoke-virtual {v1}, Lorg/spongycastle/asn1/x509/CertificateList;->getTBSCertList()Lorg/spongycastle/asn1/x509/TBSCertList;

    move-result-object v1

    const-string v2, "DER"

    invoke-virtual {v1, v2}, Lorg/spongycastle/asn1/x509/TBSCertList;->getEncoded(Ljava/lang/String;)[B
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_b} :catch_d

    move-result-object v1

    return-object v1

    .line 386
    :catch_d
    move-exception v0

    .line 388
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/security/cert/CRLException;

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/security/cert/CRLException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getThisUpdate()Ljava/util/Date;
    .registers 2

    .prologue
    .line 301
    iget-object v0, p0, Lorg/spongycastle/jce/provider/X509CRLObject;->c:Lorg/spongycastle/asn1/x509/CertificateList;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/CertificateList;->getThisUpdate()Lorg/spongycastle/asn1/x509/Time;

    move-result-object v0

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/Time;->getDate()Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public getVersion()I
    .registers 2

    .prologue
    .line 279
    iget-object v0, p0, Lorg/spongycastle/jce/provider/X509CRLObject;->c:Lorg/spongycastle/asn1/x509/CertificateList;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/CertificateList;->getVersionNumber()I

    move-result v0

    return v0
.end method

.method public hasUnsupportedCriticalExtension()Z
    .registers 4

    .prologue
    const/4 v1, 0x0

    .line 116
    invoke-virtual {p0}, Lorg/spongycastle/jce/provider/X509CRLObject;->getCriticalExtensionOIDs()Ljava/util/Set;

    move-result-object v0

    .line 118
    .local v0, "extns":Ljava/util/Set;
    if-nez v0, :cond_8

    .line 126
    :cond_7
    :goto_7
    return v1

    .line 123
    :cond_8
    sget-object v2, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->ISSUING_DISTRIBUTION_POINT:Ljava/lang/String;

    invoke-interface {v0, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 124
    sget-object v2, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->DELTA_CRL_INDICATOR:Ljava/lang/String;

    invoke-interface {v0, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 126
    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_7

    const/4 v1, 0x1

    goto :goto_7
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 654
    iget-boolean v0, p0, Lorg/spongycastle/jce/provider/X509CRLObject;->isHashCodeSet:Z

    if-nez v0, :cond_d

    .line 656
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/spongycastle/jce/provider/X509CRLObject;->isHashCodeSet:Z

    .line 657
    invoke-super {p0}, Ljava/security/cert/X509CRL;->hashCode()I

    move-result v0

    iput v0, p0, Lorg/spongycastle/jce/provider/X509CRLObject;->hashCodeValue:I

    .line 660
    :cond_d
    iget v0, p0, Lorg/spongycastle/jce/provider/X509CRLObject;->hashCodeValue:I

    return v0
.end method

.method public isRevoked(Ljava/security/cert/Certificate;)Z
    .registers 12
    .param p1, "cert"    # Ljava/security/cert/Certificate;

    .prologue
    const/4 v8, 0x0

    .line 558
    invoke-virtual {p1}, Ljava/security/cert/Certificate;->getType()Ljava/lang/String;

    move-result-object v7

    const-string v9, "X.509"

    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_15

    .line 560
    new-instance v7, Ljava/lang/RuntimeException;

    const-string v8, "X.509 CRL used with non X.509 Cert"

    invoke-direct {v7, v8}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 563
    :cond_15
    iget-object v7, p0, Lorg/spongycastle/jce/provider/X509CRLObject;->c:Lorg/spongycastle/asn1/x509/CertificateList;

    invoke-virtual {v7}, Lorg/spongycastle/asn1/x509/CertificateList;->getRevokedCertificateEnumeration()Ljava/util/Enumeration;

    move-result-object v1

    .line 565
    .local v1, "certs":Ljava/util/Enumeration;
    iget-object v7, p0, Lorg/spongycastle/jce/provider/X509CRLObject;->c:Lorg/spongycastle/asn1/x509/CertificateList;

    invoke-virtual {v7}, Lorg/spongycastle/asn1/x509/CertificateList;->getIssuer()Lorg/spongycastle/asn1/x500/X500Name;

    move-result-object v0

    .line 567
    .local v0, "caName":Lorg/spongycastle/asn1/x500/X500Name;
    if-eqz v1, :cond_a4

    move-object v7, p1

    .line 569
    check-cast v7, Ljava/security/cert/X509Certificate;

    invoke-virtual {v7}, Ljava/security/cert/X509Certificate;->getSerialNumber()Ljava/math/BigInteger;

    move-result-object v6

    .line 571
    .local v6, "serial":Ljava/math/BigInteger;
    :cond_2a
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v7

    if-eqz v7, :cond_a4

    .line 573
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v7

    invoke-static {v7}, Lorg/spongycastle/asn1/x509/TBSCertList$CRLEntry;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/TBSCertList$CRLEntry;

    move-result-object v4

    .line 575
    .local v4, "entry":Lorg/spongycastle/asn1/x509/TBSCertList$CRLEntry;
    iget-boolean v7, p0, Lorg/spongycastle/jce/provider/X509CRLObject;->isIndirect:Z

    if-eqz v7, :cond_64

    invoke-virtual {v4}, Lorg/spongycastle/asn1/x509/TBSCertList$CRLEntry;->hasExtensions()Z

    move-result v7

    if-eqz v7, :cond_64

    .line 577
    invoke-virtual {v4}, Lorg/spongycastle/asn1/x509/TBSCertList$CRLEntry;->getExtensions()Lorg/spongycastle/asn1/x509/Extensions;

    move-result-object v7

    sget-object v9, Lorg/spongycastle/asn1/x509/Extension;->certificateIssuer:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v7, v9}, Lorg/spongycastle/asn1/x509/Extensions;->getExtension(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Lorg/spongycastle/asn1/x509/Extension;

    move-result-object v2

    .line 579
    .local v2, "currentCaName":Lorg/spongycastle/asn1/x509/Extension;
    if-eqz v2, :cond_64

    .line 581
    invoke-virtual {v2}, Lorg/spongycastle/asn1/x509/Extension;->getParsedValue()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v7

    invoke-static {v7}, Lorg/spongycastle/asn1/x509/GeneralNames;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/GeneralNames;

    move-result-object v7

    invoke-virtual {v7}, Lorg/spongycastle/asn1/x509/GeneralNames;->getNames()[Lorg/spongycastle/asn1/x509/GeneralName;

    move-result-object v7

    aget-object v7, v7, v8

    invoke-virtual {v7}, Lorg/spongycastle/asn1/x509/GeneralName;->getName()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v7

    invoke-static {v7}, Lorg/spongycastle/asn1/x500/X500Name;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x500/X500Name;

    move-result-object v0

    .line 585
    .end local v2    # "currentCaName":Lorg/spongycastle/asn1/x509/Extension;
    :cond_64
    invoke-virtual {v4}, Lorg/spongycastle/asn1/x509/TBSCertList$CRLEntry;->getUserCertificate()Lorg/spongycastle/asn1/ASN1Integer;

    move-result-object v7

    invoke-virtual {v7}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2a

    .line 589
    instance-of v7, p1, Ljava/security/cert/X509Certificate;

    if-eqz v7, :cond_8c

    .line 591
    check-cast p1, Ljava/security/cert/X509Certificate;

    .end local p1    # "cert":Ljava/security/cert/Certificate;
    invoke-virtual {p1}, Ljava/security/cert/X509Certificate;->getIssuerX500Principal()Ljavax/security/auth/x500/X500Principal;

    move-result-object v7

    invoke-virtual {v7}, Ljavax/security/auth/x500/X500Principal;->getEncoded()[B

    move-result-object v7

    invoke-static {v7}, Lorg/spongycastle/asn1/x500/X500Name;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x500/X500Name;

    move-result-object v5

    .line 605
    .local v5, "issuer":Lorg/spongycastle/asn1/x500/X500Name;
    :goto_84
    invoke-virtual {v0, v5}, Lorg/spongycastle/asn1/x500/X500Name;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_a2

    move v7, v8

    .line 615
    .end local v4    # "entry":Lorg/spongycastle/asn1/x509/TBSCertList$CRLEntry;
    .end local v5    # "issuer":Lorg/spongycastle/asn1/x500/X500Name;
    .end local v6    # "serial":Ljava/math/BigInteger;
    :goto_8b
    return v7

    .line 597
    .restart local v4    # "entry":Lorg/spongycastle/asn1/x509/TBSCertList$CRLEntry;
    .restart local v6    # "serial":Ljava/math/BigInteger;
    .restart local p1    # "cert":Ljava/security/cert/Certificate;
    :cond_8c
    :try_start_8c
    invoke-virtual {p1}, Ljava/security/cert/Certificate;->getEncoded()[B

    move-result-object v7

    invoke-static {v7}, Lorg/spongycastle/asn1/x509/Certificate;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/Certificate;

    move-result-object v7

    invoke-virtual {v7}, Lorg/spongycastle/asn1/x509/Certificate;->getIssuer()Lorg/spongycastle/asn1/x500/X500Name;
    :try_end_97
    .catch Ljava/security/cert/CertificateEncodingException; {:try_start_8c .. :try_end_97} :catch_99

    move-result-object v5

    .restart local v5    # "issuer":Lorg/spongycastle/asn1/x500/X500Name;
    goto :goto_84

    .line 599
    .end local v5    # "issuer":Lorg/spongycastle/asn1/x500/X500Name;
    :catch_99
    move-exception v3

    .line 601
    .local v3, "e":Ljava/security/cert/CertificateEncodingException;
    new-instance v7, Ljava/lang/RuntimeException;

    const-string v8, "Cannot process certificate"

    invoke-direct {v7, v8}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 610
    .end local v3    # "e":Ljava/security/cert/CertificateEncodingException;
    .end local p1    # "cert":Ljava/security/cert/Certificate;
    .restart local v5    # "issuer":Lorg/spongycastle/asn1/x500/X500Name;
    :cond_a2
    const/4 v7, 0x1

    goto :goto_8b

    .end local v4    # "entry":Lorg/spongycastle/asn1/x509/TBSCertList$CRLEntry;
    .end local v5    # "issuer":Lorg/spongycastle/asn1/x500/X500Name;
    .end local v6    # "serial":Ljava/math/BigInteger;
    .restart local p1    # "cert":Ljava/security/cert/Certificate;
    :cond_a4
    move v7, v8

    .line 615
    goto :goto_8b
.end method

.method public toString()Ljava/lang/String;
    .registers 20

    .prologue
    .line 428
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 429
    .local v2, "buf":Ljava/lang/StringBuffer;
    invoke-static {}, Lorg/spongycastle/util/Strings;->lineSeparator()Ljava/lang/String;

    move-result-object v10

    .line 431
    .local v10, "nl":Ljava/lang/String;
    const-string v15, "              Version: "

    invoke-virtual {v2, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual/range {p0 .. p0}, Lorg/spongycastle/jce/provider/X509CRLObject;->getVersion()I

    move-result v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual {v15, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 433
    const-string v15, "             IssuerDN: "

    invoke-virtual {v2, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual/range {p0 .. p0}, Lorg/spongycastle/jce/provider/X509CRLObject;->getIssuerDN()Ljava/security/Principal;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v15

    .line 434
    invoke-virtual {v15, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 435
    const-string v15, "          This update: "

    invoke-virtual {v2, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual/range {p0 .. p0}, Lorg/spongycastle/jce/provider/X509CRLObject;->getThisUpdate()Ljava/util/Date;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v15

    .line 436
    invoke-virtual {v15, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 437
    const-string v15, "          Next update: "

    invoke-virtual {v2, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual/range {p0 .. p0}, Lorg/spongycastle/jce/provider/X509CRLObject;->getNextUpdate()Ljava/util/Date;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v15

    .line 438
    invoke-virtual {v15, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 439
    const-string v15, "  Signature Algorithm: "

    invoke-virtual {v2, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual/range {p0 .. p0}, Lorg/spongycastle/jce/provider/X509CRLObject;->getSigAlgName()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    .line 440
    invoke-virtual {v15, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 442
    invoke-virtual/range {p0 .. p0}, Lorg/spongycastle/jce/provider/X509CRLObject;->getSignature()[B

    move-result-object v14

    .line 444
    .local v14, "sig":[B
    const-string v15, "            Signature: "

    invoke-virtual {v2, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    new-instance v16, Ljava/lang/String;

    const/16 v17, 0x0

    const/16 v18, 0x14

    .line 445
    move/from16 v0, v17

    move/from16 v1, v18

    invoke-static {v14, v0, v1}, Lorg/spongycastle/util/encoders/Hex;->encode([BII)[B

    move-result-object v17

    invoke-direct/range {v16 .. v17}, Ljava/lang/String;-><init>([B)V

    .line 444
    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    .line 445
    invoke-virtual {v15, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 446
    const/16 v8, 0x14

    .local v8, "i":I
    :goto_82
    array-length v15, v14

    if-ge v8, v15, :cond_c5

    .line 448
    array-length v15, v14

    add-int/lit8 v15, v15, -0x14

    if-ge v8, v15, :cond_a7

    .line 450
    const-string v15, "                       "

    invoke-virtual {v2, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    new-instance v16, Ljava/lang/String;

    const/16 v17, 0x14

    .line 451
    move/from16 v0, v17

    invoke-static {v14, v8, v0}, Lorg/spongycastle/util/encoders/Hex;->encode([BII)[B

    move-result-object v17

    invoke-direct/range {v16 .. v17}, Ljava/lang/String;-><init>([B)V

    .line 450
    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    .line 451
    invoke-virtual {v15, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 446
    :goto_a4
    add-int/lit8 v8, v8, 0x14

    goto :goto_82

    .line 455
    :cond_a7
    const-string v15, "                       "

    invoke-virtual {v2, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    new-instance v16, Ljava/lang/String;

    array-length v0, v14

    move/from16 v17, v0

    sub-int v17, v17, v8

    .line 456
    move/from16 v0, v17

    invoke-static {v14, v8, v0}, Lorg/spongycastle/util/encoders/Hex;->encode([BII)[B

    move-result-object v17

    invoke-direct/range {v16 .. v17}, Ljava/lang/String;-><init>([B)V

    .line 455
    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    .line 456
    invoke-virtual {v15, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_a4

    .line 460
    :cond_c5
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/spongycastle/jce/provider/X509CRLObject;->c:Lorg/spongycastle/asn1/x509/CertificateList;

    invoke-virtual {v15}, Lorg/spongycastle/asn1/x509/CertificateList;->getTBSCertList()Lorg/spongycastle/asn1/x509/TBSCertList;

    move-result-object v15

    invoke-virtual {v15}, Lorg/spongycastle/asn1/x509/TBSCertList;->getExtensions()Lorg/spongycastle/asn1/x509/Extensions;

    move-result-object v7

    .line 462
    .local v7, "extensions":Lorg/spongycastle/asn1/x509/Extensions;
    if-eqz v7, :cond_1f8

    .line 464
    invoke-virtual {v7}, Lorg/spongycastle/asn1/x509/Extensions;->oids()Ljava/util/Enumeration;

    move-result-object v4

    .line 466
    .local v4, "e":Ljava/util/Enumeration;
    invoke-interface {v4}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v15

    if-eqz v15, :cond_e6

    .line 468
    const-string v15, "           Extensions: "

    invoke-virtual {v2, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual {v15, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 471
    :cond_e6
    :goto_e6
    invoke-interface {v4}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v15

    if-eqz v15, :cond_1f8

    .line 473
    invoke-interface {v4}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 474
    .local v12, "oid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    invoke-virtual {v7, v12}, Lorg/spongycastle/asn1/x509/Extensions;->getExtension(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Lorg/spongycastle/asn1/x509/Extension;

    move-result-object v6

    .line 476
    .local v6, "ext":Lorg/spongycastle/asn1/x509/Extension;
    invoke-virtual {v6}, Lorg/spongycastle/asn1/x509/Extension;->getExtnValue()Lorg/spongycastle/asn1/ASN1OctetString;

    move-result-object v15

    if-eqz v15, :cond_1f3

    .line 478
    invoke-virtual {v6}, Lorg/spongycastle/asn1/x509/Extension;->getExtnValue()Lorg/spongycastle/asn1/ASN1OctetString;

    move-result-object v15

    invoke-virtual {v15}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v11

    .line 479
    .local v11, "octs":[B
    new-instance v3, Lorg/spongycastle/asn1/ASN1InputStream;

    invoke-direct {v3, v11}, Lorg/spongycastle/asn1/ASN1InputStream;-><init>([B)V

    .line 480
    .local v3, "dIn":Lorg/spongycastle/asn1/ASN1InputStream;
    const-string v15, "                       critical("

    invoke-virtual {v2, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    .line 481
    invoke-virtual {v6}, Lorg/spongycastle/asn1/x509/Extension;->isCritical()Z

    move-result v16

    .line 480
    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Z)Ljava/lang/StringBuffer;

    move-result-object v15

    const-string v16, ") "

    .line 481
    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 484
    :try_start_11c
    sget-object v15, Lorg/spongycastle/asn1/x509/Extension;->cRLNumber:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v12, v15}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_155

    .line 486
    new-instance v15, Lorg/spongycastle/asn1/x509/CRLNumber;

    .line 488
    invoke-virtual {v3}, Lorg/spongycastle/asn1/ASN1InputStream;->readObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v16

    .line 487
    invoke-static/range {v16 .. v16}, Lorg/spongycastle/asn1/ASN1Integer;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Integer;

    move-result-object v16

    .line 488
    invoke-virtual/range {v16 .. v16}, Lorg/spongycastle/asn1/ASN1Integer;->getPositiveValue()Ljava/math/BigInteger;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Lorg/spongycastle/asn1/x509/CRLNumber;-><init>(Ljava/math/BigInteger;)V

    .line 486
    invoke-virtual {v2, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v15

    .line 489
    invoke-virtual {v15, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_13c
    .catch Ljava/lang/Exception; {:try_start_11c .. :try_end_13c} :catch_13d

    goto :goto_e6

    .line 524
    :catch_13d
    move-exception v5

    .line 526
    .local v5, "ex":Ljava/lang/Exception;
    invoke-virtual {v12}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v2, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 527
    const-string v15, " value = "

    invoke-virtual {v2, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    const-string v16, "*****"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual {v15, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_e6

    .line 491
    .end local v5    # "ex":Ljava/lang/Exception;
    :cond_155
    :try_start_155
    sget-object v15, Lorg/spongycastle/asn1/x509/Extension;->deltaCRLIndicator:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v12, v15}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_18a

    .line 493
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Base CRL: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    new-instance v16, Lorg/spongycastle/asn1/x509/CRLNumber;

    .line 496
    invoke-virtual {v3}, Lorg/spongycastle/asn1/ASN1InputStream;->readObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v17

    .line 495
    invoke-static/range {v17 .. v17}, Lorg/spongycastle/asn1/ASN1Integer;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Integer;

    move-result-object v17

    .line 496
    invoke-virtual/range {v17 .. v17}, Lorg/spongycastle/asn1/ASN1Integer;->getPositiveValue()Ljava/math/BigInteger;

    move-result-object v17

    invoke-direct/range {v16 .. v17}, Lorg/spongycastle/asn1/x509/CRLNumber;-><init>(Ljava/math/BigInteger;)V

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    .line 493
    invoke-virtual {v2, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    .line 497
    invoke-virtual {v15, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_e6

    .line 499
    :cond_18a
    sget-object v15, Lorg/spongycastle/asn1/x509/Extension;->issuingDistributionPoint:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 500
    invoke-virtual {v12, v15}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_1a3

    .line 503
    invoke-virtual {v3}, Lorg/spongycastle/asn1/ASN1InputStream;->readObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v15

    invoke-static {v15}, Lorg/spongycastle/asn1/x509/IssuingDistributionPoint;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/IssuingDistributionPoint;

    move-result-object v15

    .line 502
    invoke-virtual {v2, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v15

    .line 503
    invoke-virtual {v15, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_e6

    .line 505
    :cond_1a3
    sget-object v15, Lorg/spongycastle/asn1/x509/Extension;->cRLDistributionPoints:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 506
    invoke-virtual {v12, v15}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_1bc

    .line 509
    invoke-virtual {v3}, Lorg/spongycastle/asn1/ASN1InputStream;->readObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v15

    invoke-static {v15}, Lorg/spongycastle/asn1/x509/CRLDistPoint;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/CRLDistPoint;

    move-result-object v15

    .line 508
    invoke-virtual {v2, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v15

    .line 509
    invoke-virtual {v15, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_e6

    .line 511
    :cond_1bc
    sget-object v15, Lorg/spongycastle/asn1/x509/Extension;->freshestCRL:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v12, v15}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_1d5

    .line 514
    invoke-virtual {v3}, Lorg/spongycastle/asn1/ASN1InputStream;->readObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v15

    invoke-static {v15}, Lorg/spongycastle/asn1/x509/CRLDistPoint;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/CRLDistPoint;

    move-result-object v15

    .line 513
    invoke-virtual {v2, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v15

    .line 514
    invoke-virtual {v15, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_e6

    .line 518
    :cond_1d5
    invoke-virtual {v12}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v2, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 519
    const-string v15, " value = "

    invoke-virtual {v2, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    .line 520
    invoke-virtual {v3}, Lorg/spongycastle/asn1/ASN1InputStream;->readObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v16

    invoke-static/range {v16 .. v16}, Lorg/spongycastle/asn1/util/ASN1Dump;->dumpAsString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    .line 519
    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    .line 521
    invoke-virtual {v15, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_1f1
    .catch Ljava/lang/Exception; {:try_start_155 .. :try_end_1f1} :catch_13d

    goto/16 :goto_e6

    .line 532
    .end local v3    # "dIn":Lorg/spongycastle/asn1/ASN1InputStream;
    .end local v11    # "octs":[B
    :cond_1f3
    invoke-virtual {v2, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_e6

    .line 536
    .end local v4    # "e":Ljava/util/Enumeration;
    .end local v6    # "ext":Lorg/spongycastle/asn1/x509/Extension;
    .end local v12    # "oid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    :cond_1f8
    invoke-virtual/range {p0 .. p0}, Lorg/spongycastle/jce/provider/X509CRLObject;->getRevokedCertificates()Ljava/util/Set;

    move-result-object v13

    .line 537
    .local v13, "set":Ljava/util/Set;
    if-eqz v13, :cond_213

    .line 539
    invoke-interface {v13}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .line 540
    .local v9, "it":Ljava/util/Iterator;
    :goto_202
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_213

    .line 542
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    invoke-virtual {v2, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 543
    invoke-virtual {v2, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_202

    .line 546
    .end local v9    # "it":Ljava/util/Iterator;
    :cond_213
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v15

    return-object v15
.end method

.method public verify(Ljava/security/PublicKey;)V
    .registers 6
    .param p1, "key"    # Ljava/security/PublicKey;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CRLException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/InvalidKeyException;,
            Ljava/security/NoSuchProviderException;,
            Ljava/security/SignatureException;
        }
    .end annotation

    .prologue
    .line 213
    :try_start_0
    invoke-virtual {p0}, Lorg/spongycastle/jce/provider/X509CRLObject;->getSigAlgName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "SC"

    invoke-static {v2, v3}, Ljava/security/Signature;->getInstance(Ljava/lang/String;Ljava/lang/String;)Ljava/security/Signature;
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_9} :catch_e

    move-result-object v1

    .line 220
    .local v1, "sig":Ljava/security/Signature;
    :goto_a
    invoke-direct {p0, p1, v1}, Lorg/spongycastle/jce/provider/X509CRLObject;->doVerify(Ljava/security/PublicKey;Ljava/security/Signature;)V

    .line 221
    return-void

    .line 215
    .end local v1    # "sig":Ljava/security/Signature;
    :catch_e
    move-exception v0

    .line 217
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {p0}, Lorg/spongycastle/jce/provider/X509CRLObject;->getSigAlgName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/security/Signature;->getInstance(Ljava/lang/String;)Ljava/security/Signature;

    move-result-object v1

    .restart local v1    # "sig":Ljava/security/Signature;
    goto :goto_a
.end method

.method public verify(Ljava/security/PublicKey;Ljava/lang/String;)V
    .registers 5
    .param p1, "key"    # Ljava/security/PublicKey;
    .param p2, "sigProvider"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CRLException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/InvalidKeyException;,
            Ljava/security/NoSuchProviderException;,
            Ljava/security/SignatureException;
        }
    .end annotation

    .prologue
    .line 229
    if-eqz p2, :cond_e

    .line 231
    invoke-virtual {p0}, Lorg/spongycastle/jce/provider/X509CRLObject;->getSigAlgName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, p2}, Ljava/security/Signature;->getInstance(Ljava/lang/String;Ljava/lang/String;)Ljava/security/Signature;

    move-result-object v0

    .line 238
    .local v0, "sig":Ljava/security/Signature;
    :goto_a
    invoke-direct {p0, p1, v0}, Lorg/spongycastle/jce/provider/X509CRLObject;->doVerify(Ljava/security/PublicKey;Ljava/security/Signature;)V

    .line 239
    return-void

    .line 235
    .end local v0    # "sig":Ljava/security/Signature;
    :cond_e
    invoke-virtual {p0}, Lorg/spongycastle/jce/provider/X509CRLObject;->getSigAlgName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/security/Signature;->getInstance(Ljava/lang/String;)Ljava/security/Signature;

    move-result-object v0

    .restart local v0    # "sig":Ljava/security/Signature;
    goto :goto_a
.end method

.method public verify(Ljava/security/PublicKey;Ljava/security/Provider;)V
    .registers 5
    .param p1, "key"    # Ljava/security/PublicKey;
    .param p2, "sigProvider"    # Ljava/security/Provider;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CRLException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/InvalidKeyException;,
            Ljava/security/SignatureException;
        }
    .end annotation

    .prologue
    .line 247
    if-eqz p2, :cond_e

    .line 249
    invoke-virtual {p0}, Lorg/spongycastle/jce/provider/X509CRLObject;->getSigAlgName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, p2}, Ljava/security/Signature;->getInstance(Ljava/lang/String;Ljava/security/Provider;)Ljava/security/Signature;

    move-result-object v0

    .line 256
    .local v0, "sig":Ljava/security/Signature;
    :goto_a
    invoke-direct {p0, p1, v0}, Lorg/spongycastle/jce/provider/X509CRLObject;->doVerify(Ljava/security/PublicKey;Ljava/security/Signature;)V

    .line 257
    return-void

    .line 253
    .end local v0    # "sig":Ljava/security/Signature;
    :cond_e
    invoke-virtual {p0}, Lorg/spongycastle/jce/provider/X509CRLObject;->getSigAlgName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/security/Signature;->getInstance(Ljava/lang/String;)Ljava/security/Signature;

    move-result-object v0

    .restart local v0    # "sig":Ljava/security/Signature;
    goto :goto_a
.end method
