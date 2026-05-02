.class public Lorg/spongycastle/x509/AttributeCertificateHolder;
.super Ljava/lang/Object;
.source "AttributeCertificateHolder.java"

# interfaces
.implements Ljava/security/cert/CertSelector;
.implements Lorg/spongycastle/util/Selector;


# instance fields
.field final holder:Lorg/spongycastle/asn1/x509/Holder;


# direct methods
.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;[B)V
    .registers 10
    .param p1, "digestedObjectType"    # I
    .param p2, "digestAlgorithm"    # Ljava/lang/String;
    .param p3, "otherObjectTypeID"    # Ljava/lang/String;
    .param p4, "objectDigest"    # [B

    .prologue
    .line 127
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 128
    new-instance v0, Lorg/spongycastle/asn1/x509/Holder;

    new-instance v1, Lorg/spongycastle/asn1/x509/ObjectDigestInfo;

    new-instance v2, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-direct {v2, p3}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    new-instance v3, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    new-instance v4, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-direct {v4, p2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    invoke-direct {v3, v4}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V

    .line 130
    invoke-static {p4}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    move-result-object v4

    invoke-direct {v1, p1, v2, v3, v4}, Lorg/spongycastle/asn1/x509/ObjectDigestInfo;-><init>(ILorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;[B)V

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/x509/Holder;-><init>(Lorg/spongycastle/asn1/x509/ObjectDigestInfo;)V

    iput-object v0, p0, Lorg/spongycastle/x509/AttributeCertificateHolder;->holder:Lorg/spongycastle/asn1/x509/Holder;

    .line 131
    return-void
.end method

.method public constructor <init>(Ljava/security/cert/X509Certificate;)V
    .registers 9
    .param p1, "cert"    # Ljava/security/cert/X509Certificate;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateParsingException;
        }
    .end annotation

    .prologue
    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 81
    :try_start_3
    invoke-static {p1}, Lorg/spongycastle/jce/PrincipalUtil;->getIssuerX509Principal(Ljava/security/cert/X509Certificate;)Lorg/spongycastle/jce/X509Principal;
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_6} :catch_21

    move-result-object v1

    .line 88
    .local v1, "name":Lorg/spongycastle/jce/X509Principal;
    new-instance v2, Lorg/spongycastle/asn1/x509/Holder;

    new-instance v3, Lorg/spongycastle/asn1/x509/IssuerSerial;

    invoke-direct {p0, v1}, Lorg/spongycastle/x509/AttributeCertificateHolder;->generateGeneralNames(Lorg/spongycastle/jce/X509Principal;)Lorg/spongycastle/asn1/x509/GeneralNames;

    move-result-object v4

    new-instance v5, Lorg/spongycastle/asn1/ASN1Integer;

    .line 89
    invoke-virtual {p1}, Ljava/security/cert/X509Certificate;->getSerialNumber()Ljava/math/BigInteger;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(Ljava/math/BigInteger;)V

    invoke-direct {v3, v4, v5}, Lorg/spongycastle/asn1/x509/IssuerSerial;-><init>(Lorg/spongycastle/asn1/x509/GeneralNames;Lorg/spongycastle/asn1/ASN1Integer;)V

    invoke-direct {v2, v3}, Lorg/spongycastle/asn1/x509/Holder;-><init>(Lorg/spongycastle/asn1/x509/IssuerSerial;)V

    iput-object v2, p0, Lorg/spongycastle/x509/AttributeCertificateHolder;->holder:Lorg/spongycastle/asn1/x509/Holder;

    .line 90
    return-void

    .line 83
    .end local v1    # "name":Lorg/spongycastle/jce/X509Principal;
    :catch_21
    move-exception v0

    .line 85
    .local v0, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/security/cert/CertificateParsingException;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/security/cert/CertificateParsingException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public constructor <init>(Ljavax/security/auth/x500/X500Principal;)V
    .registers 3
    .param p1, "principal"    # Ljavax/security/auth/x500/X500Principal;

    .prologue
    .line 99
    invoke-static {p1}, Lorg/spongycastle/x509/X509Util;->convertPrincipal(Ljavax/security/auth/x500/X500Principal;)Lorg/spongycastle/jce/X509Principal;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/spongycastle/x509/AttributeCertificateHolder;-><init>(Lorg/spongycastle/jce/X509Principal;)V

    .line 100
    return-void
.end method

.method public constructor <init>(Ljavax/security/auth/x500/X500Principal;Ljava/math/BigInteger;)V
    .registers 4
    .param p1, "issuerName"    # Ljavax/security/auth/x500/X500Principal;
    .param p2, "serialNumber"    # Ljava/math/BigInteger;

    .prologue
    .line 71
    invoke-static {p1}, Lorg/spongycastle/x509/X509Util;->convertPrincipal(Ljavax/security/auth/x500/X500Principal;)Lorg/spongycastle/jce/X509Principal;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lorg/spongycastle/x509/AttributeCertificateHolder;-><init>(Lorg/spongycastle/jce/X509Principal;Ljava/math/BigInteger;)V

    .line 72
    return-void
.end method

.method constructor <init>(Lorg/spongycastle/asn1/ASN1Sequence;)V
    .registers 3
    .param p1, "seq"    # Lorg/spongycastle/asn1/ASN1Sequence;

    .prologue
    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    invoke-static {p1}, Lorg/spongycastle/asn1/x509/Holder;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/Holder;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/x509/AttributeCertificateHolder;->holder:Lorg/spongycastle/asn1/x509/Holder;

    .line 58
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/jce/X509Principal;)V
    .registers 4
    .param p1, "principal"    # Lorg/spongycastle/jce/X509Principal;

    .prologue
    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 94
    new-instance v0, Lorg/spongycastle/asn1/x509/Holder;

    invoke-direct {p0, p1}, Lorg/spongycastle/x509/AttributeCertificateHolder;->generateGeneralNames(Lorg/spongycastle/jce/X509Principal;)Lorg/spongycastle/asn1/x509/GeneralNames;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/x509/Holder;-><init>(Lorg/spongycastle/asn1/x509/GeneralNames;)V

    iput-object v0, p0, Lorg/spongycastle/x509/AttributeCertificateHolder;->holder:Lorg/spongycastle/asn1/x509/Holder;

    .line 95
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/jce/X509Principal;Ljava/math/BigInteger;)V
    .registers 7
    .param p1, "issuerName"    # Lorg/spongycastle/jce/X509Principal;
    .param p2, "serialNumber"    # Ljava/math/BigInteger;

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    new-instance v0, Lorg/spongycastle/asn1/x509/Holder;

    new-instance v1, Lorg/spongycastle/asn1/x509/IssuerSerial;

    new-instance v2, Lorg/spongycastle/asn1/DERSequence;

    new-instance v3, Lorg/spongycastle/asn1/x509/GeneralName;

    invoke-direct {v3, p1}, Lorg/spongycastle/asn1/x509/GeneralName;-><init>(Lorg/spongycastle/asn1/x509/X509Name;)V

    invoke-direct {v2, v3}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 64
    invoke-static {v2}, Lorg/spongycastle/asn1/x509/GeneralNames;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/GeneralNames;

    move-result-object v2

    new-instance v3, Lorg/spongycastle/asn1/ASN1Integer;

    invoke-direct {v3, p2}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(Ljava/math/BigInteger;)V

    invoke-direct {v1, v2, v3}, Lorg/spongycastle/asn1/x509/IssuerSerial;-><init>(Lorg/spongycastle/asn1/x509/GeneralNames;Lorg/spongycastle/asn1/ASN1Integer;)V

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/x509/Holder;-><init>(Lorg/spongycastle/asn1/x509/IssuerSerial;)V

    iput-object v0, p0, Lorg/spongycastle/x509/AttributeCertificateHolder;->holder:Lorg/spongycastle/asn1/x509/Holder;

    .line 66
    return-void
.end method

.method private generateGeneralNames(Lorg/spongycastle/jce/X509Principal;)Lorg/spongycastle/asn1/x509/GeneralNames;
    .registers 4
    .param p1, "principal"    # Lorg/spongycastle/jce/X509Principal;

    .prologue
    .line 204
    new-instance v0, Lorg/spongycastle/asn1/DERSequence;

    new-instance v1, Lorg/spongycastle/asn1/x509/GeneralName;

    invoke-direct {v1, p1}, Lorg/spongycastle/asn1/x509/GeneralName;-><init>(Lorg/spongycastle/asn1/x509/X509Name;)V

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1Encodable;)V

    invoke-static {v0}, Lorg/spongycastle/asn1/x509/GeneralNames;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/GeneralNames;

    move-result-object v0

    return-object v0
.end method

.method private getNames([Lorg/spongycastle/asn1/x509/GeneralName;)[Ljava/lang/Object;
    .registers 7
    .param p1, "names"    # [Lorg/spongycastle/asn1/x509/GeneralName;

    .prologue
    .line 236
    new-instance v2, Ljava/util/ArrayList;

    array-length v3, p1

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 238
    .local v2, "l":Ljava/util/List;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_7
    array-length v3, p1

    if-eq v1, v3, :cond_35

    .line 240
    aget-object v3, p1, v1

    invoke-virtual {v3}, Lorg/spongycastle/asn1/x509/GeneralName;->getTagNo()I

    move-result v3

    const/4 v4, 0x4

    if-ne v3, v4, :cond_29

    .line 244
    :try_start_13
    new-instance v3, Ljavax/security/auth/x500/X500Principal;

    aget-object v4, p1, v1

    .line 245
    invoke-virtual {v4}, Lorg/spongycastle/asn1/x509/GeneralName;->getName()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v4

    invoke-interface {v4}, Lorg/spongycastle/asn1/ASN1Encodable;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v4

    invoke-virtual {v4}, Lorg/spongycastle/asn1/ASN1Primitive;->getEncoded()[B

    move-result-object v4

    invoke-direct {v3, v4}, Ljavax/security/auth/x500/X500Principal;-><init>([B)V

    .line 244
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_29
    .catch Ljava/io/IOException; {:try_start_13 .. :try_end_29} :catch_2c

    .line 238
    :cond_29
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    .line 247
    :catch_2c
    move-exception v0

    .line 249
    .local v0, "e":Ljava/io/IOException;
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "badly formed Name object"

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 254
    .end local v0    # "e":Ljava/io/IOException;
    :cond_35
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    new-array v3, v3, [Ljava/lang/Object;

    invoke-interface {v2, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    return-object v3
.end method

.method private getPrincipals(Lorg/spongycastle/asn1/x509/GeneralNames;)[Ljava/security/Principal;
    .registers 6
    .param p1, "names"    # Lorg/spongycastle/asn1/x509/GeneralNames;

    .prologue
    .line 259
    invoke-virtual {p1}, Lorg/spongycastle/asn1/x509/GeneralNames;->getNames()[Lorg/spongycastle/asn1/x509/GeneralName;

    move-result-object v3

    invoke-direct {p0, v3}, Lorg/spongycastle/x509/AttributeCertificateHolder;->getNames([Lorg/spongycastle/asn1/x509/GeneralName;)[Ljava/lang/Object;

    move-result-object v2

    .line 260
    .local v2, "p":[Ljava/lang/Object;
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 262
    .local v1, "l":Ljava/util/List;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_e
    array-length v3, v2

    if-eq v0, v3, :cond_1f

    .line 264
    aget-object v3, v2, v0

    instance-of v3, v3, Ljava/security/Principal;

    if-eqz v3, :cond_1c

    .line 266
    aget-object v3, v2, v0

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 262
    :cond_1c
    add-int/lit8 v0, v0, 0x1

    goto :goto_e

    .line 270
    :cond_1f
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    new-array v3, v3, [Ljava/security/Principal;

    invoke-interface {v1, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/security/Principal;

    check-cast v3, [Ljava/security/Principal;

    return-object v3
.end method

.method private matchesDN(Lorg/spongycastle/jce/X509Principal;Lorg/spongycastle/asn1/x509/GeneralNames;)Z
    .registers 8
    .param p1, "subject"    # Lorg/spongycastle/jce/X509Principal;
    .param p2, "targets"    # Lorg/spongycastle/asn1/x509/GeneralNames;

    .prologue
    .line 209
    invoke-virtual {p2}, Lorg/spongycastle/asn1/x509/GeneralNames;->getNames()[Lorg/spongycastle/asn1/x509/GeneralName;

    move-result-object v2

    .line 211
    .local v2, "names":[Lorg/spongycastle/asn1/x509/GeneralName;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_5
    array-length v3, v2

    if-eq v1, v3, :cond_2e

    .line 213
    aget-object v0, v2, v1

    .line 215
    .local v0, "gn":Lorg/spongycastle/asn1/x509/GeneralName;
    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/GeneralName;->getTagNo()I

    move-result v3

    const/4 v4, 0x4

    if-ne v3, v4, :cond_2b

    .line 219
    :try_start_11
    new-instance v3, Lorg/spongycastle/jce/X509Principal;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/GeneralName;->getName()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v4

    invoke-interface {v4}, Lorg/spongycastle/asn1/ASN1Encodable;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v4

    .line 220
    invoke-virtual {v4}, Lorg/spongycastle/asn1/ASN1Primitive;->getEncoded()[B

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/spongycastle/jce/X509Principal;-><init>([B)V

    invoke-virtual {v3, p1}, Lorg/spongycastle/jce/X509Principal;->equals(Ljava/lang/Object;)Z
    :try_end_25
    .catch Ljava/io/IOException; {:try_start_11 .. :try_end_25} :catch_2a

    move-result v3

    if-eqz v3, :cond_2b

    .line 222
    const/4 v3, 0x1

    .line 231
    .end local v0    # "gn":Lorg/spongycastle/asn1/x509/GeneralName;
    :goto_29
    return v3

    .line 225
    .restart local v0    # "gn":Lorg/spongycastle/asn1/x509/GeneralName;
    :catch_2a
    move-exception v3

    .line 211
    :cond_2b
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 231
    .end local v0    # "gn":Lorg/spongycastle/asn1/x509/GeneralName;
    :cond_2e
    const/4 v3, 0x0

    goto :goto_29
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .registers 3

    .prologue
    .line 324
    new-instance v1, Lorg/spongycastle/x509/AttributeCertificateHolder;

    iget-object v0, p0, Lorg/spongycastle/x509/AttributeCertificateHolder;->holder:Lorg/spongycastle/asn1/x509/Holder;

    .line 325
    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/Holder;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/asn1/ASN1Sequence;

    invoke-direct {v1, v0}, Lorg/spongycastle/x509/AttributeCertificateHolder;-><init>(Lorg/spongycastle/asn1/ASN1Sequence;)V

    return-object v1
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 5
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 391
    if-ne p1, p0, :cond_4

    .line 393
    const/4 v1, 0x1

    .line 403
    :goto_3
    return v1

    .line 396
    :cond_4
    instance-of v1, p1, Lorg/spongycastle/x509/AttributeCertificateHolder;

    if-nez v1, :cond_a

    .line 398
    const/4 v1, 0x0

    goto :goto_3

    :cond_a
    move-object v0, p1

    .line 401
    check-cast v0, Lorg/spongycastle/x509/AttributeCertificateHolder;

    .line 403
    .local v0, "other":Lorg/spongycastle/x509/AttributeCertificateHolder;
    iget-object v1, p0, Lorg/spongycastle/x509/AttributeCertificateHolder;->holder:Lorg/spongycastle/asn1/x509/Holder;

    iget-object v2, v0, Lorg/spongycastle/x509/AttributeCertificateHolder;->holder:Lorg/spongycastle/asn1/x509/Holder;

    invoke-virtual {v1, v2}, Lorg/spongycastle/asn1/x509/Holder;->equals(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_3
.end method

.method public getDigestAlgorithm()Ljava/lang/String;
    .registers 2

    .prologue
    .line 165
    iget-object v0, p0, Lorg/spongycastle/x509/AttributeCertificateHolder;->holder:Lorg/spongycastle/asn1/x509/Holder;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/Holder;->getObjectDigestInfo()Lorg/spongycastle/asn1/x509/ObjectDigestInfo;

    move-result-object v0

    if-eqz v0, :cond_1b

    .line 167
    iget-object v0, p0, Lorg/spongycastle/x509/AttributeCertificateHolder;->holder:Lorg/spongycastle/asn1/x509/Holder;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/Holder;->getObjectDigestInfo()Lorg/spongycastle/asn1/x509/ObjectDigestInfo;

    move-result-object v0

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/ObjectDigestInfo;->getDigestAlgorithm()Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    move-result-object v0

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->getAlgorithm()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v0

    .line 168
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v0

    .line 170
    :goto_1a
    return-object v0

    :cond_1b
    const/4 v0, 0x0

    goto :goto_1a
.end method

.method public getDigestedObjectType()I
    .registers 2

    .prologue
    .line 149
    iget-object v0, p0, Lorg/spongycastle/x509/AttributeCertificateHolder;->holder:Lorg/spongycastle/asn1/x509/Holder;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/Holder;->getObjectDigestInfo()Lorg/spongycastle/asn1/x509/ObjectDigestInfo;

    move-result-object v0

    if-eqz v0, :cond_1b

    .line 151
    iget-object v0, p0, Lorg/spongycastle/x509/AttributeCertificateHolder;->holder:Lorg/spongycastle/asn1/x509/Holder;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/Holder;->getObjectDigestInfo()Lorg/spongycastle/asn1/x509/ObjectDigestInfo;

    move-result-object v0

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/ObjectDigestInfo;->getDigestedObjectType()Lorg/spongycastle/asn1/ASN1Enumerated;

    move-result-object v0

    .line 152
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1Enumerated;->getValue()Ljava/math/BigInteger;

    move-result-object v0

    invoke-virtual {v0}, Ljava/math/BigInteger;->intValue()I

    move-result v0

    .line 154
    :goto_1a
    return v0

    :cond_1b
    const/4 v0, -0x1

    goto :goto_1a
.end method

.method public getEntityNames()[Ljava/security/Principal;
    .registers 2

    .prologue
    .line 282
    iget-object v0, p0, Lorg/spongycastle/x509/AttributeCertificateHolder;->holder:Lorg/spongycastle/asn1/x509/Holder;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/Holder;->getEntityName()Lorg/spongycastle/asn1/x509/GeneralNames;

    move-result-object v0

    if-eqz v0, :cond_13

    .line 284
    iget-object v0, p0, Lorg/spongycastle/x509/AttributeCertificateHolder;->holder:Lorg/spongycastle/asn1/x509/Holder;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/Holder;->getEntityName()Lorg/spongycastle/asn1/x509/GeneralNames;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/spongycastle/x509/AttributeCertificateHolder;->getPrincipals(Lorg/spongycastle/asn1/x509/GeneralNames;)[Ljava/security/Principal;

    move-result-object v0

    .line 287
    :goto_12
    return-object v0

    :cond_13
    const/4 v0, 0x0

    goto :goto_12
.end method

.method public getIssuer()[Ljava/security/Principal;
    .registers 2

    .prologue
    .line 297
    iget-object v0, p0, Lorg/spongycastle/x509/AttributeCertificateHolder;->holder:Lorg/spongycastle/asn1/x509/Holder;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/Holder;->getBaseCertificateID()Lorg/spongycastle/asn1/x509/IssuerSerial;

    move-result-object v0

    if-eqz v0, :cond_17

    .line 299
    iget-object v0, p0, Lorg/spongycastle/x509/AttributeCertificateHolder;->holder:Lorg/spongycastle/asn1/x509/Holder;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/Holder;->getBaseCertificateID()Lorg/spongycastle/asn1/x509/IssuerSerial;

    move-result-object v0

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/IssuerSerial;->getIssuer()Lorg/spongycastle/asn1/x509/GeneralNames;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/spongycastle/x509/AttributeCertificateHolder;->getPrincipals(Lorg/spongycastle/asn1/x509/GeneralNames;)[Ljava/security/Principal;

    move-result-object v0

    .line 302
    :goto_16
    return-object v0

    :cond_17
    const/4 v0, 0x0

    goto :goto_16
.end method

.method public getObjectDigest()[B
    .registers 2

    .prologue
    .line 180
    iget-object v0, p0, Lorg/spongycastle/x509/AttributeCertificateHolder;->holder:Lorg/spongycastle/asn1/x509/Holder;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/Holder;->getObjectDigestInfo()Lorg/spongycastle/asn1/x509/ObjectDigestInfo;

    move-result-object v0

    if-eqz v0, :cond_17

    .line 182
    iget-object v0, p0, Lorg/spongycastle/x509/AttributeCertificateHolder;->holder:Lorg/spongycastle/asn1/x509/Holder;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/Holder;->getObjectDigestInfo()Lorg/spongycastle/asn1/x509/ObjectDigestInfo;

    move-result-object v0

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/ObjectDigestInfo;->getObjectDigest()Lorg/spongycastle/asn1/DERBitString;

    move-result-object v0

    invoke-virtual {v0}, Lorg/spongycastle/asn1/DERBitString;->getBytes()[B

    move-result-object v0

    .line 184
    :goto_16
    return-object v0

    :cond_17
    const/4 v0, 0x0

    goto :goto_16
.end method

.method public getOtherObjectTypeID()Ljava/lang/String;
    .registers 2

    .prologue
    .line 195
    iget-object v0, p0, Lorg/spongycastle/x509/AttributeCertificateHolder;->holder:Lorg/spongycastle/asn1/x509/Holder;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/Holder;->getObjectDigestInfo()Lorg/spongycastle/asn1/x509/ObjectDigestInfo;

    move-result-object v0

    if-eqz v0, :cond_15

    .line 197
    iget-object v0, p0, Lorg/spongycastle/x509/AttributeCertificateHolder;->holder:Lorg/spongycastle/asn1/x509/Holder;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/Holder;->getObjectDigestInfo()Lorg/spongycastle/asn1/x509/ObjectDigestInfo;

    move-result-object v0

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/ObjectDigestInfo;->getOtherObjectTypeID()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v0

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    .line 199
    :cond_15
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSerialNumber()Ljava/math/BigInteger;
    .registers 2

    .prologue
    .line 314
    iget-object v0, p0, Lorg/spongycastle/x509/AttributeCertificateHolder;->holder:Lorg/spongycastle/asn1/x509/Holder;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/Holder;->getBaseCertificateID()Lorg/spongycastle/asn1/x509/IssuerSerial;

    move-result-object v0

    if-eqz v0, :cond_17

    .line 316
    iget-object v0, p0, Lorg/spongycastle/x509/AttributeCertificateHolder;->holder:Lorg/spongycastle/asn1/x509/Holder;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/Holder;->getBaseCertificateID()Lorg/spongycastle/asn1/x509/IssuerSerial;

    move-result-object v0

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/IssuerSerial;->getSerial()Lorg/spongycastle/asn1/ASN1Integer;

    move-result-object v0

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    move-result-object v0

    .line 319
    :goto_16
    return-object v0

    :cond_17
    const/4 v0, 0x0

    goto :goto_16
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 408
    iget-object v0, p0, Lorg/spongycastle/x509/AttributeCertificateHolder;->holder:Lorg/spongycastle/asn1/x509/Holder;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/Holder;->hashCode()I

    move-result v0

    return v0
.end method

.method public match(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 413
    instance-of v0, p1, Ljava/security/cert/X509Certificate;

    if-nez v0, :cond_6

    .line 415
    const/4 v0, 0x0

    .line 418
    .end local p1    # "obj":Ljava/lang/Object;
    :goto_5
    return v0

    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_6
    check-cast p1, Ljava/security/cert/Certificate;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/spongycastle/x509/AttributeCertificateHolder;->match(Ljava/security/cert/Certificate;)Z

    move-result v0

    goto :goto_5
.end method

.method public match(Ljava/security/cert/Certificate;)Z
    .registers 9
    .param p1, "cert"    # Ljava/security/cert/Certificate;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 330
    instance-of v5, p1, Ljava/security/cert/X509Certificate;

    if-nez v5, :cond_7

    .line 386
    :cond_6
    :goto_6
    return v4

    :cond_7
    move-object v2, p1

    .line 335
    check-cast v2, Ljava/security/cert/X509Certificate;

    .line 339
    .local v2, "x509Cert":Ljava/security/cert/X509Certificate;
    :try_start_a
    iget-object v5, p0, Lorg/spongycastle/x509/AttributeCertificateHolder;->holder:Lorg/spongycastle/asn1/x509/Holder;

    invoke-virtual {v5}, Lorg/spongycastle/asn1/x509/Holder;->getBaseCertificateID()Lorg/spongycastle/asn1/x509/IssuerSerial;

    move-result-object v5

    if-eqz v5, :cond_42

    .line 341
    iget-object v5, p0, Lorg/spongycastle/x509/AttributeCertificateHolder;->holder:Lorg/spongycastle/asn1/x509/Holder;

    invoke-virtual {v5}, Lorg/spongycastle/asn1/x509/Holder;->getBaseCertificateID()Lorg/spongycastle/asn1/x509/IssuerSerial;

    move-result-object v5

    invoke-virtual {v5}, Lorg/spongycastle/asn1/x509/IssuerSerial;->getSerial()Lorg/spongycastle/asn1/ASN1Integer;

    move-result-object v5

    invoke-virtual {v5}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    move-result-object v5

    invoke-virtual {v2}, Ljava/security/cert/X509Certificate;->getSerialNumber()Ljava/math/BigInteger;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_40

    .line 342
    invoke-static {v2}, Lorg/spongycastle/jce/PrincipalUtil;->getIssuerX509Principal(Ljava/security/cert/X509Certificate;)Lorg/spongycastle/jce/X509Principal;

    move-result-object v5

    iget-object v6, p0, Lorg/spongycastle/x509/AttributeCertificateHolder;->holder:Lorg/spongycastle/asn1/x509/Holder;

    invoke-virtual {v6}, Lorg/spongycastle/asn1/x509/Holder;->getBaseCertificateID()Lorg/spongycastle/asn1/x509/IssuerSerial;

    move-result-object v6

    invoke-virtual {v6}, Lorg/spongycastle/asn1/x509/IssuerSerial;->getIssuer()Lorg/spongycastle/asn1/x509/GeneralNames;

    move-result-object v6

    invoke-direct {p0, v5, v6}, Lorg/spongycastle/x509/AttributeCertificateHolder;->matchesDN(Lorg/spongycastle/jce/X509Principal;Lorg/spongycastle/asn1/x509/GeneralNames;)Z

    move-result v5

    if-eqz v5, :cond_40

    :goto_3e
    move v4, v3

    goto :goto_6

    :cond_40
    move v3, v4

    goto :goto_3e

    .line 345
    :cond_42
    iget-object v5, p0, Lorg/spongycastle/x509/AttributeCertificateHolder;->holder:Lorg/spongycastle/asn1/x509/Holder;

    invoke-virtual {v5}, Lorg/spongycastle/asn1/x509/Holder;->getEntityName()Lorg/spongycastle/asn1/x509/GeneralNames;

    move-result-object v5

    if-eqz v5, :cond_5c

    .line 347
    invoke-static {v2}, Lorg/spongycastle/jce/PrincipalUtil;->getSubjectX509Principal(Ljava/security/cert/X509Certificate;)Lorg/spongycastle/jce/X509Principal;

    move-result-object v5

    iget-object v6, p0, Lorg/spongycastle/x509/AttributeCertificateHolder;->holder:Lorg/spongycastle/asn1/x509/Holder;

    .line 348
    invoke-virtual {v6}, Lorg/spongycastle/asn1/x509/Holder;->getEntityName()Lorg/spongycastle/asn1/x509/GeneralNames;

    move-result-object v6

    .line 347
    invoke-direct {p0, v5, v6}, Lorg/spongycastle/x509/AttributeCertificateHolder;->matchesDN(Lorg/spongycastle/jce/X509Principal;Lorg/spongycastle/asn1/x509/GeneralNames;)Z

    move-result v5

    if-eqz v5, :cond_5c

    move v4, v3

    .line 350
    goto :goto_6

    .line 353
    :cond_5c
    iget-object v3, p0, Lorg/spongycastle/x509/AttributeCertificateHolder;->holder:Lorg/spongycastle/asn1/x509/Holder;

    invoke-virtual {v3}, Lorg/spongycastle/asn1/x509/Holder;->getObjectDigestInfo()Lorg/spongycastle/asn1/x509/ObjectDigestInfo;
    :try_end_61
    .catch Ljava/security/cert/CertificateEncodingException; {:try_start_a .. :try_end_61} :catch_93

    move-result-object v3

    if-eqz v3, :cond_6

    .line 355
    const/4 v1, 0x0

    .line 358
    .local v1, "md":Ljava/security/MessageDigest;
    :try_start_65
    invoke-virtual {p0}, Lorg/spongycastle/x509/AttributeCertificateHolder;->getDigestAlgorithm()Ljava/lang/String;

    move-result-object v3

    const-string v5, "SC"

    invoke-static {v3, v5}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;Ljava/lang/String;)Ljava/security/MessageDigest;
    :try_end_6e
    .catch Ljava/lang/Exception; {:try_start_65 .. :try_end_6e} :catch_85
    .catch Ljava/security/cert/CertificateEncodingException; {:try_start_65 .. :try_end_6e} :catch_93

    move-result-object v1

    .line 365
    :try_start_6f
    invoke-virtual {p0}, Lorg/spongycastle/x509/AttributeCertificateHolder;->getDigestedObjectType()I

    move-result v3

    packed-switch v3, :pswitch_data_9e

    .line 375
    :goto_76
    invoke-virtual {v1}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v3

    invoke-virtual {p0}, Lorg/spongycastle/x509/AttributeCertificateHolder;->getObjectDigest()[B

    move-result-object v5

    invoke-static {v3, v5}, Lorg/spongycastle/util/Arrays;->areEqual([B[B)Z

    move-result v3

    if-nez v3, :cond_6

    goto :goto_6

    .line 361
    :catch_85
    move-exception v0

    .line 363
    .local v0, "e":Ljava/lang/Exception;
    goto :goto_6

    .line 369
    .end local v0    # "e":Ljava/lang/Exception;
    :pswitch_87
    invoke-virtual {p1}, Ljava/security/cert/Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v3

    invoke-interface {v3}, Ljava/security/PublicKey;->getEncoded()[B

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/security/MessageDigest;->update([B)V

    goto :goto_76

    .line 381
    .end local v1    # "md":Ljava/security/MessageDigest;
    :catch_93
    move-exception v0

    .line 383
    .local v0, "e":Ljava/security/cert/CertificateEncodingException;
    goto/16 :goto_6

    .line 372
    .end local v0    # "e":Ljava/security/cert/CertificateEncodingException;
    .restart local v1    # "md":Ljava/security/MessageDigest;
    :pswitch_96
    invoke-virtual {p1}, Ljava/security/cert/Certificate;->getEncoded()[B

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/security/MessageDigest;->update([B)V
    :try_end_9d
    .catch Ljava/security/cert/CertificateEncodingException; {:try_start_6f .. :try_end_9d} :catch_93

    goto :goto_76

    .line 365
    :pswitch_data_9e
    .packed-switch 0x0
        :pswitch_87
        :pswitch_96
    .end packed-switch
.end method
