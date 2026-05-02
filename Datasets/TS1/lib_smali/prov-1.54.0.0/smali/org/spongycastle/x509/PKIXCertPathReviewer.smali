.class public Lorg/spongycastle/x509/PKIXCertPathReviewer;
.super Lorg/spongycastle/x509/CertPathValidatorUtilities;
.source "PKIXCertPathReviewer.java"


# static fields
.field private static final AUTH_INFO_ACCESS:Ljava/lang/String;

.field private static final CRL_DIST_POINTS:Ljava/lang/String;

.field private static final QC_STATEMENT:Ljava/lang/String;

.field private static final RESOURCE_NAME:Ljava/lang/String; = "org.spongycastle.x509.CertPathReviewerMessages"


# instance fields
.field protected certPath:Ljava/security/cert/CertPath;

.field protected certs:Ljava/util/List;

.field protected errors:[Ljava/util/List;

.field private initialized:Z

.field protected n:I

.field protected notifications:[Ljava/util/List;

.field protected pkixParams:Ljava/security/cert/PKIXParameters;

.field protected policyTree:Ljava/security/cert/PolicyNode;

.field protected subjectPublicKey:Ljava/security/PublicKey;

.field protected trustAnchor:Ljava/security/cert/TrustAnchor;

.field protected validDate:Ljava/util/Date;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 87
    sget-object v0, Lorg/spongycastle/asn1/x509/X509Extensions;->QCStatements:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->QC_STATEMENT:Ljava/lang/String;

    .line 88
    sget-object v0, Lorg/spongycastle/asn1/x509/X509Extensions;->CRLDistributionPoints:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->CRL_DIST_POINTS:Ljava/lang/String;

    .line 89
    sget-object v0, Lorg/spongycastle/asn1/x509/X509Extensions;->AuthorityInfoAccess:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->AUTH_INFO_ACCESS:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 189
    invoke-direct {p0}, Lorg/spongycastle/x509/CertPathValidatorUtilities;-><init>()V

    .line 191
    return-void
.end method

.method public constructor <init>(Ljava/security/cert/CertPath;Ljava/security/cert/PKIXParameters;)V
    .registers 3
    .param p1, "certPath"    # Ljava/security/cert/CertPath;
    .param p2, "params"    # Ljava/security/cert/PKIXParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/x509/CertPathReviewerException;
        }
    .end annotation

    .prologue
    .line 181
    invoke-direct {p0}, Lorg/spongycastle/x509/CertPathValidatorUtilities;-><init>()V

    .line 182
    invoke-virtual {p0, p1, p2}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->init(Ljava/security/cert/CertPath;Ljava/security/cert/PKIXParameters;)V

    .line 183
    return-void
.end method

.method private IPtoString([B)Ljava/lang/String;
    .registers 7
    .param p1, "ip"    # [B

    .prologue
    .line 1996
    :try_start_0
    invoke-static {p1}, Ljava/net/InetAddress;->getByAddress([B)Ljava/net/InetAddress;

    move-result-object v4

    invoke-virtual {v4}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_7} :catch_9

    move-result-object v3

    .line 2011
    .local v3, "result":Ljava/lang/String;
    :goto_8
    return-object v3

    .line 1998
    .end local v3    # "result":Ljava/lang/String;
    :catch_9
    move-exception v1

    .line 2000
    .local v1, "e":Ljava/lang/Exception;
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 2002
    .local v0, "b":Ljava/lang/StringBuffer;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_10
    array-length v4, p1

    if-eq v2, v4, :cond_26

    .line 2004
    aget-byte v4, p1, v2

    and-int/lit16 v4, v4, 0xff

    invoke-static {v4}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 2005
    const/16 v4, 0x20

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 2002
    add-int/lit8 v2, v2, 0x1

    goto :goto_10

    .line 2008
    :cond_26
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    .restart local v3    # "result":Ljava/lang/String;
    goto :goto_8
.end method

.method private checkCriticalExtensions()V
    .registers 19

    .prologue
    .line 1830
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->pkixParams:Ljava/security/cert/PKIXParameters;

    invoke-virtual {v12}, Ljava/security/cert/PKIXParameters;->getCertPathCheckers()Ljava/util/List;

    move-result-object v10

    .line 1831
    .local v10, "pathCheckers":Ljava/util/List;
    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 1837
    .local v2, "certIter":Ljava/util/Iterator;
    :goto_c
    :try_start_c
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_54

    .line 1839
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/security/cert/PKIXCertPathChecker;

    const/4 v13, 0x0

    invoke-virtual {v12, v13}, Ljava/security/cert/PKIXCertPathChecker;->init(Z)V
    :try_end_1c
    .catch Ljava/security/cert/CertPathValidatorException; {:try_start_c .. :try_end_1c} :catch_1d
    .catch Lorg/spongycastle/x509/CertPathReviewerException; {:try_start_c .. :try_end_1c} :catch_45

    goto :goto_c

    .line 1842
    :catch_1d
    move-exception v4

    .line 1844
    .local v4, "cpve":Ljava/security/cert/CertPathValidatorException;
    :try_start_1e
    new-instance v9, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v12, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v13, "CertPathReviewer.certPathCheckerError"

    const/4 v14, 0x3

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    .line 1845
    invoke-virtual {v4}, Ljava/security/cert/CertPathValidatorException;->getMessage()Ljava/lang/String;

    move-result-object v16

    aput-object v16, v14, v15

    const/4 v15, 0x1

    aput-object v4, v14, v15

    const/4 v15, 0x2

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v16

    aput-object v16, v14, v15

    invoke-direct {v9, v12, v13, v14}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1846
    .local v9, "msg":Lorg/spongycastle/i18n/ErrorBundle;
    new-instance v12, Lorg/spongycastle/x509/CertPathReviewerException;

    invoke-direct {v12, v9, v4}, Lorg/spongycastle/x509/CertPathReviewerException;-><init>(Lorg/spongycastle/i18n/ErrorBundle;Ljava/lang/Throwable;)V

    throw v12
    :try_end_45
    .catch Lorg/spongycastle/x509/CertPathReviewerException; {:try_start_1e .. :try_end_45} :catch_45

    .line 1914
    .end local v4    # "cpve":Ljava/security/cert/CertPathValidatorException;
    .end local v9    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    :catch_45
    move-exception v3

    .line 1916
    .local v3, "cpre":Lorg/spongycastle/x509/CertPathReviewerException;
    invoke-virtual {v3}, Lorg/spongycastle/x509/CertPathReviewerException;->getErrorMessage()Lorg/spongycastle/i18n/ErrorBundle;

    move-result-object v12

    invoke-virtual {v3}, Lorg/spongycastle/x509/CertPathReviewerException;->getIndex()I

    move-result v13

    move-object/from16 v0, p0

    invoke-virtual {v0, v12, v13}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->addError(Lorg/spongycastle/i18n/ErrorBundle;I)V

    .line 1918
    .end local v3    # "cpre":Lorg/spongycastle/x509/CertPathReviewerException;
    :cond_53
    return-void

    .line 1853
    :cond_54
    const/4 v1, 0x0

    .line 1857
    .local v1, "cert":Ljava/security/cert/X509Certificate;
    :try_start_55
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->certs:Ljava/util/List;

    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v12

    add-int/lit8 v7, v12, -0x1

    .local v7, "index":I
    :goto_5f
    if-ltz v7, :cond_53

    .line 1859
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->certs:Ljava/util/List;

    invoke-interface {v12, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "cert":Ljava/security/cert/X509Certificate;
    check-cast v1, Ljava/security/cert/X509Certificate;

    .line 1861
    .restart local v1    # "cert":Ljava/security/cert/X509Certificate;
    invoke-virtual {v1}, Ljava/security/cert/X509Certificate;->getCriticalExtensionOIDs()Ljava/util/Set;

    move-result-object v5

    .line 1862
    .local v5, "criticalExtensions":Ljava/util/Set;
    if-eqz v5, :cond_77

    invoke-interface {v5}, Ljava/util/Set;->isEmpty()Z

    move-result v12

    if-eqz v12, :cond_7a

    .line 1857
    :cond_77
    add-int/lit8 v7, v7, -0x1

    goto :goto_5f

    .line 1867
    :cond_7a
    sget-object v12, Lorg/spongycastle/x509/PKIXCertPathReviewer;->KEY_USAGE:Ljava/lang/String;

    invoke-interface {v5, v12}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 1868
    sget-object v12, Lorg/spongycastle/x509/PKIXCertPathReviewer;->CERTIFICATE_POLICIES:Ljava/lang/String;

    invoke-interface {v5, v12}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 1869
    sget-object v12, Lorg/spongycastle/x509/PKIXCertPathReviewer;->POLICY_MAPPINGS:Ljava/lang/String;

    invoke-interface {v5, v12}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 1870
    sget-object v12, Lorg/spongycastle/x509/PKIXCertPathReviewer;->INHIBIT_ANY_POLICY:Ljava/lang/String;

    invoke-interface {v5, v12}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 1871
    sget-object v12, Lorg/spongycastle/x509/PKIXCertPathReviewer;->ISSUING_DISTRIBUTION_POINT:Ljava/lang/String;

    invoke-interface {v5, v12}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 1872
    sget-object v12, Lorg/spongycastle/x509/PKIXCertPathReviewer;->DELTA_CRL_INDICATOR:Ljava/lang/String;

    invoke-interface {v5, v12}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 1873
    sget-object v12, Lorg/spongycastle/x509/PKIXCertPathReviewer;->POLICY_CONSTRAINTS:Ljava/lang/String;

    invoke-interface {v5, v12}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 1874
    sget-object v12, Lorg/spongycastle/x509/PKIXCertPathReviewer;->BASIC_CONSTRAINTS:Ljava/lang/String;

    invoke-interface {v5, v12}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 1875
    sget-object v12, Lorg/spongycastle/x509/PKIXCertPathReviewer;->SUBJECT_ALTERNATIVE_NAME:Ljava/lang/String;

    invoke-interface {v5, v12}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 1876
    sget-object v12, Lorg/spongycastle/x509/PKIXCertPathReviewer;->NAME_CONSTRAINTS:Ljava/lang/String;

    invoke-interface {v5, v12}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 1879
    sget-object v12, Lorg/spongycastle/x509/PKIXCertPathReviewer;->QC_STATEMENT:Ljava/lang/String;

    invoke-interface {v5, v12}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_c1

    .line 1881
    move-object/from16 v0, p0

    invoke-direct {v0, v1, v7}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->processQcStatements(Ljava/security/cert/X509Certificate;I)Z

    move-result v12

    if-eqz v12, :cond_c1

    .line 1883
    sget-object v12, Lorg/spongycastle/x509/PKIXCertPathReviewer;->QC_STATEMENT:Ljava/lang/String;

    invoke-interface {v5, v12}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 1887
    :cond_c1
    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    .line 1888
    .local v11, "tmpIter":Ljava/util/Iterator;
    :goto_c5
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z
    :try_end_c8
    .catch Lorg/spongycastle/x509/CertPathReviewerException; {:try_start_55 .. :try_end_c8} :catch_45

    move-result v12

    if-eqz v12, :cond_105

    .line 1892
    :try_start_cb
    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/security/cert/PKIXCertPathChecker;

    invoke-virtual {v12, v1, v5}, Ljava/security/cert/PKIXCertPathChecker;->check(Ljava/security/cert/Certificate;Ljava/util/Collection;)V
    :try_end_d4
    .catch Ljava/security/cert/CertPathValidatorException; {:try_start_cb .. :try_end_d4} :catch_d5
    .catch Lorg/spongycastle/x509/CertPathReviewerException; {:try_start_cb .. :try_end_d4} :catch_45

    goto :goto_c5

    .line 1894
    :catch_d5
    move-exception v6

    .line 1896
    .local v6, "e":Ljava/security/cert/CertPathValidatorException;
    :try_start_d6
    new-instance v9, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v12, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v13, "CertPathReviewer.criticalExtensionError"

    const/4 v14, 0x3

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    .line 1897
    invoke-virtual {v6}, Ljava/security/cert/CertPathValidatorException;->getMessage()Ljava/lang/String;

    move-result-object v16

    aput-object v16, v14, v15

    const/4 v15, 0x1

    aput-object v6, v14, v15

    const/4 v15, 0x2

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v16

    aput-object v16, v14, v15

    invoke-direct {v9, v12, v13, v14}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1898
    .restart local v9    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    new-instance v12, Lorg/spongycastle/x509/CertPathReviewerException;

    invoke-virtual {v6}, Ljava/security/cert/CertPathValidatorException;->getCause()Ljava/lang/Throwable;

    move-result-object v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->certPath:Ljava/security/cert/CertPath;

    invoke-direct {v12, v9, v13, v14, v7}, Lorg/spongycastle/x509/CertPathReviewerException;-><init>(Lorg/spongycastle/i18n/ErrorBundle;Ljava/lang/Throwable;Ljava/security/cert/CertPath;I)V

    throw v12

    .line 1901
    .end local v6    # "e":Ljava/security/cert/CertPathValidatorException;
    .end local v9    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    :cond_105
    invoke-interface {v5}, Ljava/util/Set;->isEmpty()Z

    move-result v12

    if-nez v12, :cond_77

    .line 1904
    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .line 1905
    .local v8, "it":Ljava/util/Iterator;
    :goto_10f
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_77

    .line 1907
    new-instance v9, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v13, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v14, "CertPathReviewer.unknownCriticalExt"

    const/4 v12, 0x1

    new-array v15, v12, [Ljava/lang/Object;

    const/16 v16, 0x0

    new-instance v17, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 1908
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    move-object/from16 v0, v17

    invoke-direct {v0, v12}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    aput-object v17, v15, v16

    invoke-direct {v9, v13, v14, v15}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1909
    .restart local v9    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    move-object/from16 v0, p0

    invoke-virtual {v0, v9, v7}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->addError(Lorg/spongycastle/i18n/ErrorBundle;I)V
    :try_end_137
    .catch Lorg/spongycastle/x509/CertPathReviewerException; {:try_start_d6 .. :try_end_137} :catch_45

    goto :goto_10f
.end method

.method private checkNameConstraints()V
    .registers 31

    .prologue
    .line 384
    const/4 v8, 0x0

    .line 391
    .local v8, "cert":Ljava/security/cert/X509Certificate;
    new-instance v19, Lorg/spongycastle/jce/provider/PKIXNameConstraintValidator;

    invoke-direct/range {v19 .. v19}, Lorg/spongycastle/jce/provider/PKIXNameConstraintValidator;-><init>()V

    .line 401
    .local v19, "nameConstraintValidator":Lorg/spongycastle/jce/provider/PKIXNameConstraintValidator;
    :try_start_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->certs:Ljava/util/List;

    move-object/from16 v24, v0

    invoke-interface/range {v24 .. v24}, Ljava/util/List;->size()I

    move-result v24

    add-int/lit8 v15, v24, -0x1

    .local v15, "index":I
    :goto_12
    if-lez v15, :cond_d5

    .line 403
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->n:I

    move/from16 v24, v0

    sub-int v14, v24, v15

    .line 409
    .local v14, "i":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->certs:Ljava/util/List;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    invoke-interface {v0, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v24

    move-object/from16 v0, v24

    check-cast v0, Ljava/security/cert/X509Certificate;

    move-object v8, v0

    .line 413
    invoke-static {v8}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->isSelfIssued(Ljava/security/cert/X509Certificate;)Z

    move-result v24

    if-nez v24, :cond_1a3

    .line 415
    invoke-static {v8}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->getSubjectPrincipal(Ljava/security/cert/X509Certificate;)Ljavax/security/auth/x500/X500Principal;

    move-result-object v23

    .line 416
    .local v23, "principal":Ljavax/security/auth/x500/X500Principal;
    new-instance v4, Lorg/spongycastle/asn1/ASN1InputStream;

    new-instance v24, Ljava/io/ByteArrayInputStream;

    invoke-virtual/range {v23 .. v23}, Ljavax/security/auth/x500/X500Principal;->getEncoded()[B

    move-result-object v25

    invoke-direct/range {v24 .. v25}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    move-object/from16 v0, v24

    invoke-direct {v4, v0}, Lorg/spongycastle/asn1/ASN1InputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_47
    .catch Lorg/spongycastle/x509/CertPathReviewerException; {:try_start_6 .. :try_end_47} :catch_c3

    .line 421
    .local v4, "aIn":Lorg/spongycastle/asn1/ASN1InputStream;
    :try_start_47
    invoke-virtual {v4}, Lorg/spongycastle/asn1/ASN1InputStream;->readObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v11

    check-cast v11, Lorg/spongycastle/asn1/ASN1Sequence;
    :try_end_4d
    .catch Ljava/io/IOException; {:try_start_47 .. :try_end_4d} :catch_8a
    .catch Lorg/spongycastle/x509/CertPathReviewerException; {:try_start_47 .. :try_end_4d} :catch_c3

    .line 432
    .local v11, "dns":Lorg/spongycastle/asn1/ASN1Sequence;
    :try_start_4d
    move-object/from16 v0, v19

    invoke-virtual {v0, v11}, Lorg/spongycastle/jce/provider/PKIXNameConstraintValidator;->checkPermittedDN(Lorg/spongycastle/asn1/ASN1Sequence;)V
    :try_end_52
    .catch Lorg/spongycastle/jce/provider/PKIXNameConstraintValidatorException; {:try_start_4d .. :try_end_52} :catch_d6
    .catch Lorg/spongycastle/x509/CertPathReviewerException; {:try_start_4d .. :try_end_52} :catch_c3

    .line 443
    :try_start_52
    move-object/from16 v0, v19

    invoke-virtual {v0, v11}, Lorg/spongycastle/jce/provider/PKIXNameConstraintValidator;->checkExcludedDN(Lorg/spongycastle/asn1/ASN1Sequence;)V
    :try_end_57
    .catch Lorg/spongycastle/jce/provider/PKIXNameConstraintValidatorException; {:try_start_52 .. :try_end_57} :catch_10f
    .catch Lorg/spongycastle/x509/CertPathReviewerException; {:try_start_52 .. :try_end_57} :catch_c3

    .line 455
    :try_start_57
    sget-object v24, Lorg/spongycastle/x509/PKIXCertPathReviewer;->SUBJECT_ALTERNATIVE_NAME:Ljava/lang/String;

    move-object/from16 v0, v24

    invoke-static {v8, v0}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->getExtensionValue(Ljava/security/cert/X509Extension;Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v6

    check-cast v6, Lorg/spongycastle/asn1/ASN1Sequence;
    :try_end_61
    .catch Lorg/spongycastle/jce/provider/AnnotatedException; {:try_start_57 .. :try_end_61} :catch_148
    .catch Lorg/spongycastle/x509/CertPathReviewerException; {:try_start_57 .. :try_end_61} :catch_c3

    .line 463
    .local v6, "altName":Lorg/spongycastle/asn1/ASN1Sequence;
    if-eqz v6, :cond_1a3

    .line 465
    const/16 v16, 0x0

    .local v16, "j":I
    :goto_65
    :try_start_65
    invoke-virtual {v6}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v24

    move/from16 v0, v16

    move/from16 v1, v24

    if-ge v0, v1, :cond_1a3

    .line 467
    move/from16 v0, v16

    invoke-virtual {v6, v0}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Lorg/spongycastle/asn1/x509/GeneralName;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/GeneralName;
    :try_end_78
    .catch Lorg/spongycastle/x509/CertPathReviewerException; {:try_start_65 .. :try_end_78} :catch_c3

    move-result-object v18

    .line 471
    .local v18, "name":Lorg/spongycastle/asn1/x509/GeneralName;
    :try_start_79
    move-object/from16 v0, v19

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/spongycastle/jce/provider/PKIXNameConstraintValidator;->checkPermitted(Lorg/spongycastle/asn1/x509/GeneralName;)V

    .line 472
    move-object/from16 v0, v19

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/spongycastle/jce/provider/PKIXNameConstraintValidator;->checkExcluded(Lorg/spongycastle/asn1/x509/GeneralName;)V
    :try_end_87
    .catch Lorg/spongycastle/jce/provider/PKIXNameConstraintValidatorException; {:try_start_79 .. :try_end_87} :catch_16a
    .catch Lorg/spongycastle/x509/CertPathReviewerException; {:try_start_79 .. :try_end_87} :catch_c3

    .line 465
    add-int/lit8 v16, v16, 0x1

    goto :goto_65

    .line 423
    .end local v6    # "altName":Lorg/spongycastle/asn1/ASN1Sequence;
    .end local v11    # "dns":Lorg/spongycastle/asn1/ASN1Sequence;
    .end local v16    # "j":I
    .end local v18    # "name":Lorg/spongycastle/asn1/x509/GeneralName;
    :catch_8a
    move-exception v12

    .line 425
    .local v12, "e":Ljava/io/IOException;
    :try_start_8b
    new-instance v17, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v24, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v25, "CertPathReviewer.ncSubjectNameError"

    const/16 v26, 0x1

    move/from16 v0, v26

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    new-instance v28, Lorg/spongycastle/i18n/filter/UntrustedInput;

    move-object/from16 v0, v28

    move-object/from16 v1, v23

    invoke-direct {v0, v1}, Lorg/spongycastle/i18n/filter/UntrustedInput;-><init>(Ljava/lang/Object;)V

    aput-object v28, v26, v27

    move-object/from16 v0, v17

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    move-object/from16 v3, v26

    invoke-direct {v0, v1, v2, v3}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 427
    .local v17, "msg":Lorg/spongycastle/i18n/ErrorBundle;
    new-instance v24, Lorg/spongycastle/x509/CertPathReviewerException;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->certPath:Ljava/security/cert/CertPath;

    move-object/from16 v25, v0

    move-object/from16 v0, v24

    move-object/from16 v1, v17

    move-object/from16 v2, v25

    invoke-direct {v0, v1, v12, v2, v15}, Lorg/spongycastle/x509/CertPathReviewerException;-><init>(Lorg/spongycastle/i18n/ErrorBundle;Ljava/lang/Throwable;Ljava/security/cert/CertPath;I)V

    throw v24
    :try_end_c3
    .catch Lorg/spongycastle/x509/CertPathReviewerException; {:try_start_8b .. :try_end_c3} :catch_c3

    .line 611
    .end local v4    # "aIn":Lorg/spongycastle/asn1/ASN1InputStream;
    .end local v12    # "e":Ljava/io/IOException;
    .end local v14    # "i":I
    .end local v15    # "index":I
    .end local v17    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    .end local v23    # "principal":Ljavax/security/auth/x500/X500Principal;
    :catch_c3
    move-exception v9

    .line 613
    .local v9, "cpre":Lorg/spongycastle/x509/CertPathReviewerException;
    invoke-virtual {v9}, Lorg/spongycastle/x509/CertPathReviewerException;->getErrorMessage()Lorg/spongycastle/i18n/ErrorBundle;

    move-result-object v24

    invoke-virtual {v9}, Lorg/spongycastle/x509/CertPathReviewerException;->getIndex()I

    move-result v25

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    move/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->addError(Lorg/spongycastle/i18n/ErrorBundle;I)V

    .line 616
    .end local v9    # "cpre":Lorg/spongycastle/x509/CertPathReviewerException;
    :cond_d5
    return-void

    .line 434
    .restart local v4    # "aIn":Lorg/spongycastle/asn1/ASN1InputStream;
    .restart local v11    # "dns":Lorg/spongycastle/asn1/ASN1Sequence;
    .restart local v14    # "i":I
    .restart local v15    # "index":I
    .restart local v23    # "principal":Ljavax/security/auth/x500/X500Principal;
    :catch_d6
    move-exception v10

    .line 436
    .local v10, "cpve":Lorg/spongycastle/jce/provider/PKIXNameConstraintValidatorException;
    :try_start_d7
    new-instance v17, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v24, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v25, "CertPathReviewer.notPermittedDN"

    const/16 v26, 0x1

    move/from16 v0, v26

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    new-instance v28, Lorg/spongycastle/i18n/filter/UntrustedInput;

    .line 437
    invoke-virtual/range {v23 .. v23}, Ljavax/security/auth/x500/X500Principal;->getName()Ljava/lang/String;

    move-result-object v29

    invoke-direct/range {v28 .. v29}, Lorg/spongycastle/i18n/filter/UntrustedInput;-><init>(Ljava/lang/Object;)V

    aput-object v28, v26, v27

    move-object/from16 v0, v17

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    move-object/from16 v3, v26

    invoke-direct {v0, v1, v2, v3}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 438
    .restart local v17    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    new-instance v24, Lorg/spongycastle/x509/CertPathReviewerException;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->certPath:Ljava/security/cert/CertPath;

    move-object/from16 v25, v0

    move-object/from16 v0, v24

    move-object/from16 v1, v17

    move-object/from16 v2, v25

    invoke-direct {v0, v1, v10, v2, v15}, Lorg/spongycastle/x509/CertPathReviewerException;-><init>(Lorg/spongycastle/i18n/ErrorBundle;Ljava/lang/Throwable;Ljava/security/cert/CertPath;I)V

    throw v24

    .line 445
    .end local v10    # "cpve":Lorg/spongycastle/jce/provider/PKIXNameConstraintValidatorException;
    .end local v17    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    :catch_10f
    move-exception v10

    .line 447
    .restart local v10    # "cpve":Lorg/spongycastle/jce/provider/PKIXNameConstraintValidatorException;
    new-instance v17, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v24, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v25, "CertPathReviewer.excludedDN"

    const/16 v26, 0x1

    move/from16 v0, v26

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    new-instance v28, Lorg/spongycastle/i18n/filter/UntrustedInput;

    .line 448
    invoke-virtual/range {v23 .. v23}, Ljavax/security/auth/x500/X500Principal;->getName()Ljava/lang/String;

    move-result-object v29

    invoke-direct/range {v28 .. v29}, Lorg/spongycastle/i18n/filter/UntrustedInput;-><init>(Ljava/lang/Object;)V

    aput-object v28, v26, v27

    move-object/from16 v0, v17

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    move-object/from16 v3, v26

    invoke-direct {v0, v1, v2, v3}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 449
    .restart local v17    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    new-instance v24, Lorg/spongycastle/x509/CertPathReviewerException;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->certPath:Ljava/security/cert/CertPath;

    move-object/from16 v25, v0

    move-object/from16 v0, v24

    move-object/from16 v1, v17

    move-object/from16 v2, v25

    invoke-direct {v0, v1, v10, v2, v15}, Lorg/spongycastle/x509/CertPathReviewerException;-><init>(Lorg/spongycastle/i18n/ErrorBundle;Ljava/lang/Throwable;Ljava/security/cert/CertPath;I)V

    throw v24

    .line 457
    .end local v10    # "cpve":Lorg/spongycastle/jce/provider/PKIXNameConstraintValidatorException;
    .end local v17    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    :catch_148
    move-exception v5

    .line 459
    .local v5, "ae":Lorg/spongycastle/jce/provider/AnnotatedException;
    new-instance v17, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v24, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v25, "CertPathReviewer.subjAltNameExtError"

    move-object/from16 v0, v17

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 460
    .restart local v17    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    new-instance v24, Lorg/spongycastle/x509/CertPathReviewerException;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->certPath:Ljava/security/cert/CertPath;

    move-object/from16 v25, v0

    move-object/from16 v0, v24

    move-object/from16 v1, v17

    move-object/from16 v2, v25

    invoke-direct {v0, v1, v5, v2, v15}, Lorg/spongycastle/x509/CertPathReviewerException;-><init>(Lorg/spongycastle/i18n/ErrorBundle;Ljava/lang/Throwable;Ljava/security/cert/CertPath;I)V

    throw v24

    .line 474
    .end local v5    # "ae":Lorg/spongycastle/jce/provider/AnnotatedException;
    .end local v17    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    .restart local v6    # "altName":Lorg/spongycastle/asn1/ASN1Sequence;
    .restart local v16    # "j":I
    .restart local v18    # "name":Lorg/spongycastle/asn1/x509/GeneralName;
    :catch_16a
    move-exception v10

    .line 476
    .restart local v10    # "cpve":Lorg/spongycastle/jce/provider/PKIXNameConstraintValidatorException;
    new-instance v17, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v24, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v25, "CertPathReviewer.notPermittedEmail"

    const/16 v26, 0x1

    move/from16 v0, v26

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    new-instance v28, Lorg/spongycastle/i18n/filter/UntrustedInput;

    move-object/from16 v0, v28

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lorg/spongycastle/i18n/filter/UntrustedInput;-><init>(Ljava/lang/Object;)V

    aput-object v28, v26, v27

    move-object/from16 v0, v17

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    move-object/from16 v3, v26

    invoke-direct {v0, v1, v2, v3}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 478
    .restart local v17    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    new-instance v24, Lorg/spongycastle/x509/CertPathReviewerException;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->certPath:Ljava/security/cert/CertPath;

    move-object/from16 v25, v0

    move-object/from16 v0, v24

    move-object/from16 v1, v17

    move-object/from16 v2, v25

    invoke-direct {v0, v1, v10, v2, v15}, Lorg/spongycastle/x509/CertPathReviewerException;-><init>(Lorg/spongycastle/i18n/ErrorBundle;Ljava/lang/Throwable;Ljava/security/cert/CertPath;I)V

    throw v24
    :try_end_1a3
    .catch Lorg/spongycastle/x509/CertPathReviewerException; {:try_start_d7 .. :try_end_1a3} :catch_c3

    .line 575
    .end local v4    # "aIn":Lorg/spongycastle/asn1/ASN1InputStream;
    .end local v6    # "altName":Lorg/spongycastle/asn1/ASN1Sequence;
    .end local v10    # "cpve":Lorg/spongycastle/jce/provider/PKIXNameConstraintValidatorException;
    .end local v11    # "dns":Lorg/spongycastle/asn1/ASN1Sequence;
    .end local v16    # "j":I
    .end local v17    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    .end local v18    # "name":Lorg/spongycastle/asn1/x509/GeneralName;
    .end local v23    # "principal":Ljavax/security/auth/x500/X500Principal;
    :cond_1a3
    :try_start_1a3
    sget-object v24, Lorg/spongycastle/x509/PKIXCertPathReviewer;->NAME_CONSTRAINTS:Ljava/lang/String;

    move-object/from16 v0, v24

    invoke-static {v8, v0}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->getExtensionValue(Ljava/security/cert/X509Extension;Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v21

    check-cast v21, Lorg/spongycastle/asn1/ASN1Sequence;
    :try_end_1ad
    .catch Lorg/spongycastle/jce/provider/AnnotatedException; {:try_start_1a3 .. :try_end_1ad} :catch_1da
    .catch Lorg/spongycastle/x509/CertPathReviewerException; {:try_start_1a3 .. :try_end_1ad} :catch_c3

    .line 583
    .local v21, "ncSeq":Lorg/spongycastle/asn1/ASN1Sequence;
    if-eqz v21, :cond_1fc

    .line 585
    :try_start_1af
    invoke-static/range {v21 .. v21}, Lorg/spongycastle/asn1/x509/NameConstraints;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/NameConstraints;

    move-result-object v20

    .line 590
    .local v20, "nc":Lorg/spongycastle/asn1/x509/NameConstraints;
    invoke-virtual/range {v20 .. v20}, Lorg/spongycastle/asn1/x509/NameConstraints;->getPermittedSubtrees()[Lorg/spongycastle/asn1/x509/GeneralSubtree;

    move-result-object v22

    .line 591
    .local v22, "permitted":[Lorg/spongycastle/asn1/x509/GeneralSubtree;
    if-eqz v22, :cond_1c0

    .line 593
    move-object/from16 v0, v19

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/spongycastle/jce/provider/PKIXNameConstraintValidator;->intersectPermittedSubtree([Lorg/spongycastle/asn1/x509/GeneralSubtree;)V

    .line 599
    :cond_1c0
    invoke-virtual/range {v20 .. v20}, Lorg/spongycastle/asn1/x509/NameConstraints;->getExcludedSubtrees()[Lorg/spongycastle/asn1/x509/GeneralSubtree;

    move-result-object v13

    .line 600
    .local v13, "excluded":[Lorg/spongycastle/asn1/x509/GeneralSubtree;
    if-eqz v13, :cond_1fc

    .line 602
    const/4 v7, 0x0

    .local v7, "c":I
    :goto_1c7
    array-length v0, v13

    move/from16 v24, v0

    move/from16 v0, v24

    if-eq v7, v0, :cond_1fc

    .line 604
    aget-object v24, v13, v7

    move-object/from16 v0, v19

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lorg/spongycastle/jce/provider/PKIXNameConstraintValidator;->addExcludedSubtree(Lorg/spongycastle/asn1/x509/GeneralSubtree;)V

    .line 602
    add-int/lit8 v7, v7, 0x1

    goto :goto_1c7

    .line 577
    .end local v7    # "c":I
    .end local v13    # "excluded":[Lorg/spongycastle/asn1/x509/GeneralSubtree;
    .end local v20    # "nc":Lorg/spongycastle/asn1/x509/NameConstraints;
    .end local v21    # "ncSeq":Lorg/spongycastle/asn1/ASN1Sequence;
    .end local v22    # "permitted":[Lorg/spongycastle/asn1/x509/GeneralSubtree;
    :catch_1da
    move-exception v5

    .line 579
    .restart local v5    # "ae":Lorg/spongycastle/jce/provider/AnnotatedException;
    new-instance v17, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v24, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v25, "CertPathReviewer.ncExtError"

    move-object/from16 v0, v17

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 580
    .restart local v17    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    new-instance v24, Lorg/spongycastle/x509/CertPathReviewerException;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->certPath:Ljava/security/cert/CertPath;

    move-object/from16 v25, v0

    move-object/from16 v0, v24

    move-object/from16 v1, v17

    move-object/from16 v2, v25

    invoke-direct {v0, v1, v5, v2, v15}, Lorg/spongycastle/x509/CertPathReviewerException;-><init>(Lorg/spongycastle/i18n/ErrorBundle;Ljava/lang/Throwable;Ljava/security/cert/CertPath;I)V

    throw v24
    :try_end_1fc
    .catch Lorg/spongycastle/x509/CertPathReviewerException; {:try_start_1af .. :try_end_1fc} :catch_c3

    .line 401
    .end local v5    # "ae":Lorg/spongycastle/jce/provider/AnnotatedException;
    .end local v17    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    .restart local v21    # "ncSeq":Lorg/spongycastle/asn1/ASN1Sequence;
    :cond_1fc
    add-int/lit8 v15, v15, -0x1

    goto/16 :goto_12
.end method

.method private checkPathLength()V
    .registers 16

    .prologue
    .line 624
    iget v7, p0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->n:I

    .line 625
    .local v7, "maxPathLength":I
    const/4 v9, 0x0

    .line 627
    .local v9, "totalPathLength":I
    const/4 v4, 0x0

    .line 630
    .local v4, "cert":Ljava/security/cert/X509Certificate;
    iget-object v10, p0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->certs:Ljava/util/List;

    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v10

    add-int/lit8 v6, v10, -0x1

    .local v6, "index":I
    :goto_c
    if-lez v6, :cond_5d

    .line 632
    iget v10, p0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->n:I

    sub-int v5, v10, v6

    .line 634
    .local v5, "i":I
    iget-object v10, p0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->certs:Ljava/util/List;

    invoke-interface {v10, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    .end local v4    # "cert":Ljava/security/cert/X509Certificate;
    check-cast v4, Ljava/security/cert/X509Certificate;

    .line 638
    .restart local v4    # "cert":Ljava/security/cert/X509Certificate;
    invoke-static {v4}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->isSelfIssued(Ljava/security/cert/X509Certificate;)Z

    move-result v10

    if-nez v10, :cond_32

    .line 640
    if-gtz v7, :cond_2e

    .line 642
    new-instance v8, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v10, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v11, "CertPathReviewer.pathLengthExtended"

    invoke-direct {v8, v10, v11}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 643
    .local v8, "msg":Lorg/spongycastle/i18n/ErrorBundle;
    invoke-virtual {p0, v8}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->addError(Lorg/spongycastle/i18n/ErrorBundle;)V

    .line 645
    .end local v8    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    :cond_2e
    add-int/lit8 v7, v7, -0x1

    .line 646
    add-int/lit8 v9, v9, 0x1

    .line 654
    :cond_32
    :try_start_32
    sget-object v10, Lorg/spongycastle/x509/PKIXCertPathReviewer;->BASIC_CONSTRAINTS:Ljava/lang/String;

    invoke-static {v4, v10}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->getExtensionValue(Ljava/security/cert/X509Extension;Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v10

    invoke-static {v10}, Lorg/spongycastle/asn1/x509/BasicConstraints;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/BasicConstraints;
    :try_end_3b
    .catch Lorg/spongycastle/jce/provider/AnnotatedException; {:try_start_32 .. :try_end_3b} :catch_4e

    move-result-object v3

    .line 664
    .local v3, "bc":Lorg/spongycastle/asn1/x509/BasicConstraints;
    :goto_3c
    if-eqz v3, :cond_4b

    .line 666
    invoke-virtual {v3}, Lorg/spongycastle/asn1/x509/BasicConstraints;->getPathLenConstraint()Ljava/math/BigInteger;

    move-result-object v0

    .line 668
    .local v0, "_pathLengthConstraint":Ljava/math/BigInteger;
    if-eqz v0, :cond_4b

    .line 670
    invoke-virtual {v0}, Ljava/math/BigInteger;->intValue()I

    move-result v1

    .line 672
    .local v1, "_plc":I
    if-ge v1, v7, :cond_4b

    .line 674
    move v7, v1

    .line 630
    .end local v0    # "_pathLengthConstraint":Ljava/math/BigInteger;
    .end local v1    # "_plc":I
    :cond_4b
    add-int/lit8 v6, v6, -0x1

    goto :goto_c

    .line 657
    .end local v3    # "bc":Lorg/spongycastle/asn1/x509/BasicConstraints;
    :catch_4e
    move-exception v2

    .line 659
    .local v2, "ae":Lorg/spongycastle/jce/provider/AnnotatedException;
    new-instance v8, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v10, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v11, "CertPathReviewer.processLengthConstError"

    invoke-direct {v8, v10, v11}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 660
    .restart local v8    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    invoke-virtual {p0, v8, v6}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->addError(Lorg/spongycastle/i18n/ErrorBundle;I)V

    .line 661
    const/4 v3, 0x0

    .restart local v3    # "bc":Lorg/spongycastle/asn1/x509/BasicConstraints;
    goto :goto_3c

    .line 681
    .end local v2    # "ae":Lorg/spongycastle/jce/provider/AnnotatedException;
    .end local v3    # "bc":Lorg/spongycastle/asn1/x509/BasicConstraints;
    .end local v5    # "i":I
    .end local v8    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    :cond_5d
    new-instance v8, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v10, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v11, "CertPathReviewer.totalPathLength"

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    .line 682
    invoke-static {v9}, Lorg/spongycastle/util/Integers;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v12, v13

    invoke-direct {v8, v10, v11, v12}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 684
    .restart local v8    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    invoke-virtual {p0, v8}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->addNotification(Lorg/spongycastle/i18n/ErrorBundle;)V

    .line 685
    return-void
.end method

.method private checkPolicy()V
    .registers 75

    .prologue
    .line 1112
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->pkixParams:Ljava/security/cert/PKIXParameters;

    invoke-virtual {v5}, Ljava/security/cert/PKIXParameters;->getInitialPolicies()Ljava/util/Set;

    move-result-object v73

    .line 1122
    .local v73, "userInitialPolicySet":Ljava/util/Set;
    move-object/from16 v0, p0

    iget v5, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->n:I

    add-int/lit8 v5, v5, 0x1

    new-array v0, v5, [Ljava/util/ArrayList;

    move-object/from16 v64, v0

    .line 1123
    .local v64, "policyNodes":[Ljava/util/List;
    const/16 v48, 0x0

    .local v48, "j":I
    :goto_14
    move-object/from16 v0, v64

    array-length v5, v0

    move/from16 v0, v48

    if-ge v0, v5, :cond_25

    .line 1125
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    aput-object v5, v64, v48

    .line 1123
    add-int/lit8 v48, v48, 0x1

    goto :goto_14

    .line 1128
    :cond_25
    new-instance v7, Ljava/util/HashSet;

    invoke-direct {v7}, Ljava/util/HashSet;-><init>()V

    .line 1130
    .local v7, "policySet":Ljava/util/Set;
    const-string v5, "2.5.29.32.0"

    invoke-interface {v7, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1132
    new-instance v4, Lorg/spongycastle/jce/provider/PKIXPolicyNode;

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    const/4 v6, 0x0

    const/4 v8, 0x0

    new-instance v9, Ljava/util/HashSet;

    invoke-direct {v9}, Ljava/util/HashSet;-><init>()V

    const-string v10, "2.5.29.32.0"

    const/4 v11, 0x0

    invoke-direct/range {v4 .. v11}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;-><init>(Ljava/util/List;ILjava/util/Set;Ljava/security/cert/PolicyNode;Ljava/util/Set;Ljava/lang/String;Z)V

    .line 1135
    .local v4, "validPolicyTree":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    const/4 v5, 0x0

    aget-object v5, v64, v5

    invoke-interface {v5, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1140
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->pkixParams:Ljava/security/cert/PKIXParameters;

    invoke-virtual {v5}, Ljava/security/cert/PKIXParameters;->isExplicitPolicyRequired()Z

    move-result v5

    if-eqz v5, :cond_fe

    .line 1142
    const/16 v39, 0x0

    .line 1152
    .local v39, "explicitPolicy":I
    :goto_55
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->pkixParams:Ljava/security/cert/PKIXParameters;

    invoke-virtual {v5}, Ljava/security/cert/PKIXParameters;->isAnyPolicyInhibited()Z

    move-result v5

    if-eqz v5, :cond_106

    .line 1154
    const/16 v43, 0x0

    .line 1164
    .local v43, "inhibitAnyPolicy":I
    :goto_61
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->pkixParams:Ljava/security/cert/PKIXParameters;

    invoke-virtual {v5}, Ljava/security/cert/PKIXParameters;->isPolicyMappingInhibited()Z

    move-result v5

    if-eqz v5, :cond_10e

    .line 1166
    const/16 v63, 0x0

    .line 1173
    .local v63, "policyMapping":I
    :goto_6d
    const/16 v29, 0x0

    .line 1179
    .local v29, "acceptablePolicies":Ljava/util/Set;
    const/16 v31, 0x0

    .line 1185
    .local v31, "cert":Ljava/security/cert/X509Certificate;
    :try_start_71
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->certs:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    add-int/lit8 v42, v5, -0x1

    .local v42, "index":I
    :goto_7b
    if-ltz v42, :cond_511

    .line 1188
    move-object/from16 v0, p0

    iget v5, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->n:I

    sub-int v10, v5, v42

    .line 1191
    .local v10, "i":I
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->certs:Ljava/util/List;

    move/from16 v0, v42

    invoke-interface {v5, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    move-object v0, v5

    check-cast v0, Ljava/security/cert/X509Certificate;

    move-object/from16 v31, v0
    :try_end_92
    .catch Lorg/spongycastle/x509/CertPathReviewerException; {:try_start_71 .. :try_end_92} :catch_ee

    .line 1198
    :try_start_92
    sget-object v5, Lorg/spongycastle/x509/PKIXCertPathReviewer;->CERTIFICATE_POLICIES:Ljava/lang/String;

    move-object/from16 v0, v31

    invoke-static {v0, v5}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->getExtensionValue(Ljava/security/cert/X509Extension;Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v32

    check-cast v32, Lorg/spongycastle/asn1/ASN1Sequence;
    :try_end_9c
    .catch Lorg/spongycastle/jce/provider/AnnotatedException; {:try_start_92 .. :try_end_9c} :catch_116
    .catch Lorg/spongycastle/x509/CertPathReviewerException; {:try_start_92 .. :try_end_9c} :catch_ee

    .line 1206
    .local v32, "certPolicies":Lorg/spongycastle/asn1/ASN1Sequence;
    if-eqz v32, :cond_2bb

    if-eqz v4, :cond_2bb

    .line 1211
    :try_start_a0
    invoke-virtual/range {v32 .. v32}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjects()Ljava/util/Enumeration;

    move-result-object v38

    .line 1212
    .local v38, "e":Ljava/util/Enumeration;
    new-instance v65, Ljava/util/HashSet;

    invoke-direct/range {v65 .. v65}, Ljava/util/HashSet;-><init>()V

    .line 1214
    .local v65, "pols":Ljava/util/Set;
    :cond_a9
    :goto_a9
    invoke-interface/range {v38 .. v38}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    if-eqz v5, :cond_14e

    .line 1216
    invoke-interface/range {v38 .. v38}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v5

    invoke-static {v5}, Lorg/spongycastle/asn1/x509/PolicyInformation;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/PolicyInformation;

    move-result-object v58

    .line 1217
    .local v58, "pInfo":Lorg/spongycastle/asn1/x509/PolicyInformation;
    invoke-virtual/range {v58 .. v58}, Lorg/spongycastle/asn1/x509/PolicyInformation;->getPolicyIdentifier()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v59

    .line 1219
    .local v59, "pOid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    invoke-virtual/range {v59 .. v59}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v65

    invoke-interface {v0, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1221
    const-string v5, "2.5.29.32.0"

    invoke-virtual/range {v59 .. v59}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_cd
    .catch Lorg/spongycastle/x509/CertPathReviewerException; {:try_start_a0 .. :try_end_cd} :catch_ee

    move-result v5

    if-nez v5, :cond_a9

    .line 1226
    :try_start_d0
    invoke-virtual/range {v58 .. v58}, Lorg/spongycastle/asn1/x509/PolicyInformation;->getPolicyQualifiers()Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v5

    invoke-static {v5}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->getQualifierSet(Lorg/spongycastle/asn1/ASN1Sequence;)Ljava/util/Set;
    :try_end_d7
    .catch Ljava/security/cert/CertPathValidatorException; {:try_start_d0 .. :try_end_d7} :catch_132
    .catch Lorg/spongycastle/x509/CertPathReviewerException; {:try_start_d0 .. :try_end_d7} :catch_ee

    move-result-object v66

    .line 1234
    .local v66, "pq":Ljava/util/Set;
    :try_start_d8
    move-object/from16 v0, v64

    move-object/from16 v1, v59

    move-object/from16 v2, v66

    invoke-static {v10, v0, v1, v2}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->processCertD1i(I[Ljava/util/List;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Ljava/util/Set;)Z

    move-result v53

    .line 1236
    .local v53, "match":Z
    if-nez v53, :cond_a9

    .line 1238
    move-object/from16 v0, v64

    move-object/from16 v1, v59

    move-object/from16 v2, v66

    invoke-static {v10, v0, v1, v2}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->processCertD1ii(I[Ljava/util/List;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Ljava/util/Set;)V
    :try_end_ed
    .catch Lorg/spongycastle/x509/CertPathReviewerException; {:try_start_d8 .. :try_end_ed} :catch_ee

    goto :goto_a9

    .line 1818
    .end local v10    # "i":I
    .end local v32    # "certPolicies":Lorg/spongycastle/asn1/ASN1Sequence;
    .end local v38    # "e":Ljava/util/Enumeration;
    .end local v42    # "index":I
    .end local v53    # "match":Z
    .end local v58    # "pInfo":Lorg/spongycastle/asn1/x509/PolicyInformation;
    .end local v59    # "pOid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .end local v65    # "pols":Ljava/util/Set;
    .end local v66    # "pq":Ljava/util/Set;
    :catch_ee
    move-exception v34

    .line 1820
    .local v34, "cpre":Lorg/spongycastle/x509/CertPathReviewerException;
    invoke-virtual/range {v34 .. v34}, Lorg/spongycastle/x509/CertPathReviewerException;->getErrorMessage()Lorg/spongycastle/i18n/ErrorBundle;

    move-result-object v5

    invoke-virtual/range {v34 .. v34}, Lorg/spongycastle/x509/CertPathReviewerException;->getIndex()I

    move-result v6

    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v6}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->addError(Lorg/spongycastle/i18n/ErrorBundle;I)V

    .line 1821
    const/4 v4, 0x0

    .line 1823
    .end local v34    # "cpre":Lorg/spongycastle/x509/CertPathReviewerException;
    :goto_fd
    return-void

    .line 1146
    .end local v29    # "acceptablePolicies":Ljava/util/Set;
    .end local v31    # "cert":Ljava/security/cert/X509Certificate;
    .end local v39    # "explicitPolicy":I
    .end local v43    # "inhibitAnyPolicy":I
    .end local v63    # "policyMapping":I
    :cond_fe
    move-object/from16 v0, p0

    iget v5, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->n:I

    add-int/lit8 v39, v5, 0x1

    .restart local v39    # "explicitPolicy":I
    goto/16 :goto_55

    .line 1158
    :cond_106
    move-object/from16 v0, p0

    iget v5, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->n:I

    add-int/lit8 v43, v5, 0x1

    .restart local v43    # "inhibitAnyPolicy":I
    goto/16 :goto_61

    .line 1170
    :cond_10e
    move-object/from16 v0, p0

    iget v5, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->n:I

    add-int/lit8 v63, v5, 0x1

    .restart local v63    # "policyMapping":I
    goto/16 :goto_6d

    .line 1201
    .restart local v10    # "i":I
    .restart local v29    # "acceptablePolicies":Ljava/util/Set;
    .restart local v31    # "cert":Ljava/security/cert/X509Certificate;
    .restart local v42    # "index":I
    :catch_116
    move-exception v30

    .line 1203
    .local v30, "ae":Lorg/spongycastle/jce/provider/AnnotatedException;
    :try_start_117
    new-instance v54, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v5, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v6, "CertPathReviewer.policyExtError"

    move-object/from16 v0, v54

    invoke-direct {v0, v5, v6}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1204
    .local v54, "msg":Lorg/spongycastle/i18n/ErrorBundle;
    new-instance v5, Lorg/spongycastle/x509/CertPathReviewerException;

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->certPath:Ljava/security/cert/CertPath;

    move-object/from16 v0, v54

    move-object/from16 v1, v30

    move/from16 v2, v42

    invoke-direct {v5, v0, v1, v6, v2}, Lorg/spongycastle/x509/CertPathReviewerException;-><init>(Lorg/spongycastle/i18n/ErrorBundle;Ljava/lang/Throwable;Ljava/security/cert/CertPath;I)V

    throw v5

    .line 1228
    .end local v30    # "ae":Lorg/spongycastle/jce/provider/AnnotatedException;
    .end local v54    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    .restart local v32    # "certPolicies":Lorg/spongycastle/asn1/ASN1Sequence;
    .restart local v38    # "e":Ljava/util/Enumeration;
    .restart local v58    # "pInfo":Lorg/spongycastle/asn1/x509/PolicyInformation;
    .restart local v59    # "pOid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .restart local v65    # "pols":Ljava/util/Set;
    :catch_132
    move-exception v35

    .line 1230
    .local v35, "cpve":Ljava/security/cert/CertPathValidatorException;
    new-instance v54, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v5, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v6, "CertPathReviewer.policyQualifierError"

    move-object/from16 v0, v54

    invoke-direct {v0, v5, v6}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1231
    .restart local v54    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    new-instance v5, Lorg/spongycastle/x509/CertPathReviewerException;

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->certPath:Ljava/security/cert/CertPath;

    move-object/from16 v0, v54

    move-object/from16 v1, v35

    move/from16 v2, v42

    invoke-direct {v5, v0, v1, v6, v2}, Lorg/spongycastle/x509/CertPathReviewerException;-><init>(Lorg/spongycastle/i18n/ErrorBundle;Ljava/lang/Throwable;Ljava/security/cert/CertPath;I)V

    throw v5

    .line 1243
    .end local v35    # "cpve":Ljava/security/cert/CertPathValidatorException;
    .end local v54    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    .end local v58    # "pInfo":Lorg/spongycastle/asn1/x509/PolicyInformation;
    .end local v59    # "pOid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    :cond_14e
    if-eqz v29, :cond_15a

    const-string v5, "2.5.29.32.0"

    move-object/from16 v0, v29

    invoke-interface {v0, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1e8

    .line 1245
    :cond_15a
    move-object/from16 v29, v65

    .line 1267
    :goto_15c
    if-gtz v43, :cond_16a

    move-object/from16 v0, p0

    iget v5, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->n:I

    if-ge v10, v5, :cond_25d

    invoke-static/range {v31 .. v31}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->isSelfIssued(Ljava/security/cert/X509Certificate;)Z

    move-result v5

    if-eqz v5, :cond_25d

    .line 1269
    :cond_16a
    invoke-virtual/range {v32 .. v32}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjects()Ljava/util/Enumeration;

    move-result-object v38

    .line 1271
    :cond_16e
    invoke-interface/range {v38 .. v38}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    if-eqz v5, :cond_25d

    .line 1273
    invoke-interface/range {v38 .. v38}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v5

    invoke-static {v5}, Lorg/spongycastle/asn1/x509/PolicyInformation;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/PolicyInformation;

    move-result-object v58

    .line 1275
    .restart local v58    # "pInfo":Lorg/spongycastle/asn1/x509/PolicyInformation;
    const-string v5, "2.5.29.32.0"

    invoke-virtual/range {v58 .. v58}, Lorg/spongycastle/asn1/x509/PolicyInformation;->getPolicyIdentifier()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v6

    invoke-virtual {v6}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_189
    .catch Lorg/spongycastle/x509/CertPathReviewerException; {:try_start_117 .. :try_end_189} :catch_ee

    move-result v5

    if-eqz v5, :cond_16e

    .line 1280
    :try_start_18c
    invoke-virtual/range {v58 .. v58}, Lorg/spongycastle/asn1/x509/PolicyInformation;->getPolicyQualifiers()Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v5

    invoke-static {v5}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->getQualifierSet(Lorg/spongycastle/asn1/ASN1Sequence;)Ljava/util/Set;
    :try_end_193
    .catch Ljava/security/cert/CertPathValidatorException; {:try_start_18c .. :try_end_193} :catch_211
    .catch Lorg/spongycastle/x509/CertPathReviewerException; {:try_start_18c .. :try_end_193} :catch_ee

    move-result-object v13

    .line 1287
    .local v13, "_apq":Ljava/util/Set;
    add-int/lit8 v5, v10, -0x1

    :try_start_196
    aget-object v23, v64, v5

    .line 1289
    .local v23, "_nodes":Ljava/util/List;
    const/16 v49, 0x0

    .local v49, "k":I
    :goto_19a
    invoke-interface/range {v23 .. v23}, Ljava/util/List;->size()I

    move-result v5

    move/from16 v0, v49

    if-ge v0, v5, :cond_25d

    .line 1291
    move-object/from16 v0, v23

    move/from16 v1, v49

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/spongycastle/jce/provider/PKIXPolicyNode;

    .line 1293
    .local v12, "_node":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    invoke-virtual {v12}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;->getExpectedPolicies()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v24

    .line 1294
    .local v24, "_policySetIter":Ljava/util/Iterator;
    :cond_1b4
    :goto_1b4
    invoke-interface/range {v24 .. v24}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_259

    .line 1296
    invoke-interface/range {v24 .. v24}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v25

    .line 1299
    .local v25, "_tmp":Ljava/lang/Object;
    move-object/from16 v0, v25

    instance-of v5, v0, Ljava/lang/String;

    if-eqz v5, :cond_22d

    .line 1301
    move-object/from16 v0, v25

    check-cast v0, Ljava/lang/String;

    move-object v14, v0

    .line 1312
    .end local v25    # "_tmp":Ljava/lang/Object;
    .local v14, "_policy":Ljava/lang/String;
    :goto_1c9
    const/16 v19, 0x0

    .line 1314
    .local v19, "_found":Z
    invoke-virtual {v12}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;->getChildren()Ljava/util/Iterator;

    move-result-object v18

    .line 1316
    .local v18, "_childrenIter":Ljava/util/Iterator;
    :cond_1cf
    :goto_1cf
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_23a

    .line 1318
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Lorg/spongycastle/jce/provider/PKIXPolicyNode;

    .line 1320
    .local v17, "_child":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    invoke-virtual/range {v17 .. v17}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;->getValidPolicy()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v14, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1cf

    .line 1322
    const/16 v19, 0x1

    goto :goto_1cf

    .line 1249
    .end local v12    # "_node":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    .end local v13    # "_apq":Ljava/util/Set;
    .end local v14    # "_policy":Ljava/lang/String;
    .end local v17    # "_child":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    .end local v18    # "_childrenIter":Ljava/util/Iterator;
    .end local v19    # "_found":Z
    .end local v23    # "_nodes":Ljava/util/List;
    .end local v24    # "_policySetIter":Ljava/util/Iterator;
    .end local v49    # "k":I
    .end local v58    # "pInfo":Lorg/spongycastle/asn1/x509/PolicyInformation;
    :cond_1e8
    invoke-interface/range {v29 .. v29}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v46

    .line 1250
    .local v46, "it":Ljava/util/Iterator;
    new-instance v70, Ljava/util/HashSet;

    invoke-direct/range {v70 .. v70}, Ljava/util/HashSet;-><init>()V

    .line 1252
    .local v70, "t1":Ljava/util/Set;
    :cond_1f1
    :goto_1f1
    invoke-interface/range {v46 .. v46}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_20d

    .line 1254
    invoke-interface/range {v46 .. v46}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v57

    .line 1256
    .local v57, "o":Ljava/lang/Object;
    move-object/from16 v0, v65

    move-object/from16 v1, v57

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1f1

    .line 1258
    move-object/from16 v0, v70

    move-object/from16 v1, v57

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_1f1

    .line 1262
    .end local v57    # "o":Ljava/lang/Object;
    :cond_20d
    move-object/from16 v29, v70

    goto/16 :goto_15c

    .line 1282
    .end local v46    # "it":Ljava/util/Iterator;
    .end local v70    # "t1":Ljava/util/Set;
    .restart local v58    # "pInfo":Lorg/spongycastle/asn1/x509/PolicyInformation;
    :catch_211
    move-exception v35

    .line 1284
    .restart local v35    # "cpve":Ljava/security/cert/CertPathValidatorException;
    new-instance v54, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v5, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v6, "CertPathReviewer.policyQualifierError"

    move-object/from16 v0, v54

    invoke-direct {v0, v5, v6}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1285
    .restart local v54    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    new-instance v5, Lorg/spongycastle/x509/CertPathReviewerException;

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->certPath:Ljava/security/cert/CertPath;

    move-object/from16 v0, v54

    move-object/from16 v1, v35

    move/from16 v2, v42

    invoke-direct {v5, v0, v1, v6, v2}, Lorg/spongycastle/x509/CertPathReviewerException;-><init>(Lorg/spongycastle/i18n/ErrorBundle;Ljava/lang/Throwable;Ljava/security/cert/CertPath;I)V

    throw v5

    .line 1303
    .end local v35    # "cpve":Ljava/security/cert/CertPathValidatorException;
    .end local v54    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    .restart local v12    # "_node":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    .restart local v13    # "_apq":Ljava/util/Set;
    .restart local v23    # "_nodes":Ljava/util/List;
    .restart local v24    # "_policySetIter":Ljava/util/Iterator;
    .restart local v25    # "_tmp":Ljava/lang/Object;
    .restart local v49    # "k":I
    :cond_22d
    move-object/from16 v0, v25

    instance-of v5, v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    if-eqz v5, :cond_1b4

    .line 1305
    check-cast v25, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .end local v25    # "_tmp":Ljava/lang/Object;
    invoke-virtual/range {v25 .. v25}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v14

    .restart local v14    # "_policy":Ljava/lang/String;
    goto :goto_1c9

    .line 1326
    .restart local v18    # "_childrenIter":Ljava/util/Iterator;
    .restart local v19    # "_found":Z
    :cond_23a
    if-nez v19, :cond_1b4

    .line 1328
    new-instance v11, Ljava/util/HashSet;

    invoke-direct {v11}, Ljava/util/HashSet;-><init>()V

    .line 1329
    .local v11, "_newChildExpectedPolicies":Ljava/util/Set;
    invoke-interface {v11, v14}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1331
    new-instance v8, Lorg/spongycastle/jce/provider/PKIXPolicyNode;

    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    const/4 v15, 0x0

    invoke-direct/range {v8 .. v15}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;-><init>(Ljava/util/List;ILjava/util/Set;Ljava/security/cert/PolicyNode;Ljava/util/Set;Ljava/lang/String;Z)V

    .line 1335
    .local v8, "_newChild":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    invoke-virtual {v12, v8}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;->addChild(Lorg/spongycastle/jce/provider/PKIXPolicyNode;)V

    .line 1336
    aget-object v5, v64, v10

    invoke-interface {v5, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1b4

    .line 1289
    .end local v8    # "_newChild":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    .end local v11    # "_newChildExpectedPolicies":Ljava/util/Set;
    .end local v14    # "_policy":Ljava/lang/String;
    .end local v18    # "_childrenIter":Ljava/util/Iterator;
    .end local v19    # "_found":Z
    :cond_259
    add-int/lit8 v49, v49, 0x1

    goto/16 :goto_19a

    .line 1348
    .end local v12    # "_node":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    .end local v13    # "_apq":Ljava/util/Set;
    .end local v23    # "_nodes":Ljava/util/List;
    .end local v24    # "_policySetIter":Ljava/util/Iterator;
    .end local v49    # "k":I
    .end local v58    # "pInfo":Lorg/spongycastle/asn1/x509/PolicyInformation;
    :cond_25d
    add-int/lit8 v48, v10, -0x1

    :goto_25f
    if-ltz v48, :cond_28d

    .line 1350
    aget-object v56, v64, v48

    .line 1352
    .local v56, "nodes":Ljava/util/List;
    const/16 v49, 0x0

    .restart local v49    # "k":I
    :goto_265
    invoke-interface/range {v56 .. v56}, Ljava/util/List;->size()I

    move-result v5

    move/from16 v0, v49

    if-ge v0, v5, :cond_287

    .line 1354
    move-object/from16 v0, v56

    move/from16 v1, v49

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v55

    check-cast v55, Lorg/spongycastle/jce/provider/PKIXPolicyNode;

    .line 1355
    .local v55, "node":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    invoke-virtual/range {v55 .. v55}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;->hasChildren()Z

    move-result v5

    if-nez v5, :cond_28a

    .line 1357
    move-object/from16 v0, v64

    move-object/from16 v1, v55

    invoke-static {v4, v0, v1}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->removePolicyNode(Lorg/spongycastle/jce/provider/PKIXPolicyNode;[Ljava/util/List;Lorg/spongycastle/jce/provider/PKIXPolicyNode;)Lorg/spongycastle/jce/provider/PKIXPolicyNode;

    move-result-object v4

    .line 1359
    if-nez v4, :cond_28a

    .line 1348
    .end local v55    # "node":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    :cond_287
    add-int/lit8 v48, v48, -0x1

    goto :goto_25f

    .line 1352
    .restart local v55    # "node":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    :cond_28a
    add-int/lit8 v49, v49, 0x1

    goto :goto_265

    .line 1370
    .end local v49    # "k":I
    .end local v55    # "node":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    .end local v56    # "nodes":Ljava/util/List;
    :cond_28d
    invoke-virtual/range {v31 .. v31}, Ljava/security/cert/X509Certificate;->getCriticalExtensionOIDs()Ljava/util/Set;

    move-result-object v37

    .line 1372
    .local v37, "criticalExtensionOids":Ljava/util/Set;
    if-eqz v37, :cond_2bb

    .line 1374
    sget-object v5, Lorg/spongycastle/x509/PKIXCertPathReviewer;->CERTIFICATE_POLICIES:Ljava/lang/String;

    move-object/from16 v0, v37

    invoke-interface {v0, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v36

    .line 1376
    .local v36, "critical":Z
    aget-object v56, v64, v10

    .line 1377
    .restart local v56    # "nodes":Ljava/util/List;
    const/16 v48, 0x0

    :goto_29f
    invoke-interface/range {v56 .. v56}, Ljava/util/List;->size()I

    move-result v5

    move/from16 v0, v48

    if-ge v0, v5, :cond_2bb

    .line 1379
    move-object/from16 v0, v56

    move/from16 v1, v48

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v55

    check-cast v55, Lorg/spongycastle/jce/provider/PKIXPolicyNode;

    .line 1380
    .restart local v55    # "node":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    move-object/from16 v0, v55

    move/from16 v1, v36

    invoke-virtual {v0, v1}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;->setCritical(Z)V

    .line 1377
    add-int/lit8 v48, v48, 0x1

    goto :goto_29f

    .line 1388
    .end local v36    # "critical":Z
    .end local v37    # "criticalExtensionOids":Ljava/util/Set;
    .end local v38    # "e":Ljava/util/Enumeration;
    .end local v55    # "node":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    .end local v56    # "nodes":Ljava/util/List;
    .end local v65    # "pols":Ljava/util/Set;
    :cond_2bb
    if-nez v32, :cond_2be

    .line 1390
    const/4 v4, 0x0

    .line 1395
    :cond_2be
    if-gtz v39, :cond_2d5

    if-nez v4, :cond_2d5

    .line 1397
    new-instance v54, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v5, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v6, "CertPathReviewer.noValidPolicyTree"

    move-object/from16 v0, v54

    invoke-direct {v0, v5, v6}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1398
    .restart local v54    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    new-instance v5, Lorg/spongycastle/x509/CertPathReviewerException;

    move-object/from16 v0, v54

    invoke-direct {v5, v0}, Lorg/spongycastle/x509/CertPathReviewerException;-><init>(Lorg/spongycastle/i18n/ErrorBundle;)V

    throw v5

    .line 1405
    .end local v54    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    :cond_2d5
    move-object/from16 v0, p0

    iget v5, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->n:I
    :try_end_2d9
    .catch Lorg/spongycastle/x509/CertPathReviewerException; {:try_start_196 .. :try_end_2d9} :catch_ee

    if-eq v10, v5, :cond_4f3

    .line 1413
    :try_start_2db
    sget-object v5, Lorg/spongycastle/x509/PKIXCertPathReviewer;->POLICY_MAPPINGS:Ljava/lang/String;

    move-object/from16 v0, v31

    invoke-static {v0, v5}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->getExtensionValue(Ljava/security/cert/X509Extension;Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1Primitive;
    :try_end_2e2
    .catch Lorg/spongycastle/jce/provider/AnnotatedException; {:try_start_2db .. :try_end_2e2} :catch_336
    .catch Lorg/spongycastle/x509/CertPathReviewerException; {:try_start_2db .. :try_end_2e2} :catch_ee

    move-result-object v61

    .line 1421
    .local v61, "pm":Lorg/spongycastle/asn1/ASN1Primitive;
    if-eqz v61, :cond_37b

    .line 1423
    :try_start_2e5
    move-object/from16 v0, v61

    check-cast v0, Lorg/spongycastle/asn1/ASN1Sequence;

    move-object/from16 v52, v0

    .line 1424
    .local v52, "mappings":Lorg/spongycastle/asn1/ASN1Sequence;
    const/16 v48, 0x0

    :goto_2ed
    invoke-virtual/range {v52 .. v52}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v5

    move/from16 v0, v48

    if-ge v0, v5, :cond_37b

    .line 1426
    move-object/from16 v0, v52

    move/from16 v1, v48

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v51

    check-cast v51, Lorg/spongycastle/asn1/ASN1Sequence;

    .line 1427
    .local v51, "mapping":Lorg/spongycastle/asn1/ASN1Sequence;
    const/4 v5, 0x0

    move-object/from16 v0, v51

    invoke-virtual {v0, v5}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v45

    check-cast v45, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 1428
    .local v45, "ip_id":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    const/4 v5, 0x1

    move-object/from16 v0, v51

    invoke-virtual {v0, v5}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v69

    check-cast v69, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 1429
    .local v69, "sp_id":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    const-string v5, "2.5.29.32.0"

    invoke-virtual/range {v45 .. v45}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_352

    .line 1431
    new-instance v54, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v5, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v6, "CertPathReviewer.invalidPolicyMapping"

    move-object/from16 v0, v54

    invoke-direct {v0, v5, v6}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1432
    .restart local v54    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    new-instance v5, Lorg/spongycastle/x509/CertPathReviewerException;

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->certPath:Ljava/security/cert/CertPath;

    move-object/from16 v0, v54

    move/from16 v1, v42

    invoke-direct {v5, v0, v6, v1}, Lorg/spongycastle/x509/CertPathReviewerException;-><init>(Lorg/spongycastle/i18n/ErrorBundle;Ljava/security/cert/CertPath;I)V

    throw v5

    .line 1415
    .end local v45    # "ip_id":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .end local v51    # "mapping":Lorg/spongycastle/asn1/ASN1Sequence;
    .end local v52    # "mappings":Lorg/spongycastle/asn1/ASN1Sequence;
    .end local v54    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    .end local v61    # "pm":Lorg/spongycastle/asn1/ASN1Primitive;
    .end local v69    # "sp_id":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    :catch_336
    move-exception v30

    .line 1417
    .restart local v30    # "ae":Lorg/spongycastle/jce/provider/AnnotatedException;
    new-instance v54, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v5, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v6, "CertPathReviewer.policyMapExtError"

    move-object/from16 v0, v54

    invoke-direct {v0, v5, v6}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1418
    .restart local v54    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    new-instance v5, Lorg/spongycastle/x509/CertPathReviewerException;

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->certPath:Ljava/security/cert/CertPath;

    move-object/from16 v0, v54

    move-object/from16 v1, v30

    move/from16 v2, v42

    invoke-direct {v5, v0, v1, v6, v2}, Lorg/spongycastle/x509/CertPathReviewerException;-><init>(Lorg/spongycastle/i18n/ErrorBundle;Ljava/lang/Throwable;Ljava/security/cert/CertPath;I)V

    throw v5

    .line 1434
    .end local v30    # "ae":Lorg/spongycastle/jce/provider/AnnotatedException;
    .end local v54    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    .restart local v45    # "ip_id":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .restart local v51    # "mapping":Lorg/spongycastle/asn1/ASN1Sequence;
    .restart local v52    # "mappings":Lorg/spongycastle/asn1/ASN1Sequence;
    .restart local v61    # "pm":Lorg/spongycastle/asn1/ASN1Primitive;
    .restart local v69    # "sp_id":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    :cond_352
    const-string v5, "2.5.29.32.0"

    invoke-virtual/range {v69 .. v69}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_377

    .line 1436
    new-instance v54, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v5, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v6, "CertPathReviewer.invalidPolicyMapping"

    move-object/from16 v0, v54

    invoke-direct {v0, v5, v6}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1437
    .restart local v54    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    new-instance v5, Lorg/spongycastle/x509/CertPathReviewerException;

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->certPath:Ljava/security/cert/CertPath;

    move-object/from16 v0, v54

    move/from16 v1, v42

    invoke-direct {v5, v0, v6, v1}, Lorg/spongycastle/x509/CertPathReviewerException;-><init>(Lorg/spongycastle/i18n/ErrorBundle;Ljava/security/cert/CertPath;I)V

    throw v5

    .line 1424
    .end local v54    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    :cond_377
    add-int/lit8 v48, v48, 0x1

    goto/16 :goto_2ed

    .line 1444
    .end local v45    # "ip_id":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .end local v51    # "mapping":Lorg/spongycastle/asn1/ASN1Sequence;
    .end local v52    # "mappings":Lorg/spongycastle/asn1/ASN1Sequence;
    .end local v69    # "sp_id":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    :cond_37b
    if-eqz v61, :cond_457

    .line 1446
    move-object/from16 v0, v61

    check-cast v0, Lorg/spongycastle/asn1/ASN1Sequence;

    move-object/from16 v52, v0

    .line 1447
    .restart local v52    # "mappings":Lorg/spongycastle/asn1/ASN1Sequence;
    new-instance v50, Ljava/util/HashMap;

    invoke-direct/range {v50 .. v50}, Ljava/util/HashMap;-><init>()V

    .line 1448
    .local v50, "m_idp":Ljava/util/Map;
    new-instance v67, Ljava/util/HashSet;

    invoke-direct/range {v67 .. v67}, Ljava/util/HashSet;-><init>()V

    .line 1450
    .local v67, "s_idp":Ljava/util/Set;
    const/16 v48, 0x0

    :goto_38f
    invoke-virtual/range {v52 .. v52}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v5

    move/from16 v0, v48

    if-ge v0, v5, :cond_3f6

    .line 1452
    move-object/from16 v0, v52

    move/from16 v1, v48

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v51

    check-cast v51, Lorg/spongycastle/asn1/ASN1Sequence;

    .line 1453
    .restart local v51    # "mapping":Lorg/spongycastle/asn1/ASN1Sequence;
    const/4 v5, 0x0

    move-object/from16 v0, v51

    invoke-virtual {v0, v5}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v5

    check-cast v5, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v5}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v41

    .line 1454
    .local v41, "id_p":Ljava/lang/String;
    const/4 v5, 0x1

    move-object/from16 v0, v51

    invoke-virtual {v0, v5}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v5

    check-cast v5, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v5}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v68

    .line 1457
    .local v68, "sd_p":Ljava/lang/String;
    move-object/from16 v0, v50

    move-object/from16 v1, v41

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3e4

    .line 1459
    new-instance v71, Ljava/util/HashSet;

    invoke-direct/range {v71 .. v71}, Ljava/util/HashSet;-><init>()V

    .line 1460
    .local v71, "tmp":Ljava/util/Set;
    move-object/from16 v0, v71

    move-object/from16 v1, v68

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1461
    move-object/from16 v0, v50

    move-object/from16 v1, v41

    move-object/from16 v2, v71

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1462
    move-object/from16 v0, v67

    move-object/from16 v1, v41

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1450
    :goto_3e1
    add-int/lit8 v48, v48, 0x1

    goto :goto_38f

    .line 1466
    .end local v71    # "tmp":Ljava/util/Set;
    :cond_3e4
    move-object/from16 v0, v50

    move-object/from16 v1, v41

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v71

    check-cast v71, Ljava/util/Set;

    .line 1467
    .restart local v71    # "tmp":Ljava/util/Set;
    move-object/from16 v0, v71

    move-object/from16 v1, v68

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_3e1

    .line 1471
    .end local v41    # "id_p":Ljava/lang/String;
    .end local v51    # "mapping":Lorg/spongycastle/asn1/ASN1Sequence;
    .end local v68    # "sd_p":Ljava/lang/String;
    .end local v71    # "tmp":Ljava/util/Set;
    :cond_3f6
    invoke-interface/range {v67 .. v67}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v47

    .line 1472
    .local v47, "it_idp":Ljava/util/Iterator;
    :cond_3fa
    :goto_3fa
    invoke-interface/range {v47 .. v47}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_457

    .line 1474
    invoke-interface/range {v47 .. v47}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v41

    check-cast v41, Ljava/lang/String;
    :try_end_406
    .catch Lorg/spongycastle/x509/CertPathReviewerException; {:try_start_2e5 .. :try_end_406} :catch_ee

    .line 1479
    .restart local v41    # "id_p":Ljava/lang/String;
    if-lez v63, :cond_44c

    .line 1483
    :try_start_408
    move-object/from16 v0, v64

    move-object/from16 v1, v41

    move-object/from16 v2, v50

    move-object/from16 v3, v31

    invoke-static {v10, v0, v1, v2, v3}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->prepareNextCertB1(I[Ljava/util/List;Ljava/lang/String;Ljava/util/Map;Ljava/security/cert/X509Certificate;)V
    :try_end_413
    .catch Lorg/spongycastle/jce/provider/AnnotatedException; {:try_start_408 .. :try_end_413} :catch_414
    .catch Ljava/security/cert/CertPathValidatorException; {:try_start_408 .. :try_end_413} :catch_430
    .catch Lorg/spongycastle/x509/CertPathReviewerException; {:try_start_408 .. :try_end_413} :catch_ee

    goto :goto_3fa

    .line 1485
    :catch_414
    move-exception v30

    .line 1488
    .restart local v30    # "ae":Lorg/spongycastle/jce/provider/AnnotatedException;
    :try_start_415
    new-instance v54, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v5, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v6, "CertPathReviewer.policyExtError"

    move-object/from16 v0, v54

    invoke-direct {v0, v5, v6}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1489
    .restart local v54    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    new-instance v5, Lorg/spongycastle/x509/CertPathReviewerException;

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->certPath:Ljava/security/cert/CertPath;

    move-object/from16 v0, v54

    move-object/from16 v1, v30

    move/from16 v2, v42

    invoke-direct {v5, v0, v1, v6, v2}, Lorg/spongycastle/x509/CertPathReviewerException;-><init>(Lorg/spongycastle/i18n/ErrorBundle;Ljava/lang/Throwable;Ljava/security/cert/CertPath;I)V

    throw v5

    .line 1491
    .end local v30    # "ae":Lorg/spongycastle/jce/provider/AnnotatedException;
    .end local v54    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    :catch_430
    move-exception v35

    .line 1494
    .restart local v35    # "cpve":Ljava/security/cert/CertPathValidatorException;
    new-instance v54, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v5, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v6, "CertPathReviewer.policyQualifierError"

    move-object/from16 v0, v54

    invoke-direct {v0, v5, v6}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1495
    .restart local v54    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    new-instance v5, Lorg/spongycastle/x509/CertPathReviewerException;

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->certPath:Ljava/security/cert/CertPath;

    move-object/from16 v0, v54

    move-object/from16 v1, v35

    move/from16 v2, v42

    invoke-direct {v5, v0, v1, v6, v2}, Lorg/spongycastle/x509/CertPathReviewerException;-><init>(Lorg/spongycastle/i18n/ErrorBundle;Ljava/lang/Throwable;Ljava/security/cert/CertPath;I)V

    throw v5

    .line 1502
    .end local v35    # "cpve":Ljava/security/cert/CertPathValidatorException;
    .end local v54    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    :cond_44c
    if-gtz v63, :cond_3fa

    .line 1504
    move-object/from16 v0, v64

    move-object/from16 v1, v41

    invoke-static {v10, v0, v1, v4}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->prepareNextCertB2(I[Ljava/util/List;Ljava/lang/String;Lorg/spongycastle/jce/provider/PKIXPolicyNode;)Lorg/spongycastle/jce/provider/PKIXPolicyNode;

    move-result-object v4

    goto :goto_3fa

    .line 1514
    .end local v41    # "id_p":Ljava/lang/String;
    .end local v47    # "it_idp":Ljava/util/Iterator;
    .end local v50    # "m_idp":Ljava/util/Map;
    .end local v52    # "mappings":Lorg/spongycastle/asn1/ASN1Sequence;
    .end local v67    # "s_idp":Ljava/util/Set;
    :cond_457
    invoke-static/range {v31 .. v31}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->isSelfIssued(Ljava/security/cert/X509Certificate;)Z
    :try_end_45a
    .catch Lorg/spongycastle/x509/CertPathReviewerException; {:try_start_415 .. :try_end_45a} :catch_ee

    move-result v5

    if-nez v5, :cond_469

    .line 1518
    if-eqz v39, :cond_461

    .line 1520
    add-int/lit8 v39, v39, -0x1

    .line 1524
    :cond_461
    if-eqz v63, :cond_465

    .line 1526
    add-int/lit8 v63, v63, -0x1

    .line 1530
    :cond_465
    if-eqz v43, :cond_469

    .line 1532
    add-int/lit8 v43, v43, -0x1

    .line 1543
    :cond_469
    :try_start_469
    sget-object v5, Lorg/spongycastle/x509/PKIXCertPathReviewer;->POLICY_CONSTRAINTS:Ljava/lang/String;

    move-object/from16 v0, v31

    invoke-static {v0, v5}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->getExtensionValue(Ljava/security/cert/X509Extension;Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v60

    check-cast v60, Lorg/spongycastle/asn1/ASN1Sequence;

    .line 1544
    .local v60, "pc":Lorg/spongycastle/asn1/ASN1Sequence;
    if-eqz v60, :cond_4d7

    .line 1546
    invoke-virtual/range {v60 .. v60}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjects()Ljava/util/Enumeration;

    move-result-object v62

    .line 1548
    .local v62, "policyConstraints":Ljava/util/Enumeration;
    :cond_479
    :goto_479
    invoke-interface/range {v62 .. v62}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    if-eqz v5, :cond_4d7

    .line 1550
    invoke-interface/range {v62 .. v62}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v33

    check-cast v33, Lorg/spongycastle/asn1/ASN1TaggedObject;

    .line 1553
    .local v33, "constraint":Lorg/spongycastle/asn1/ASN1TaggedObject;
    invoke-virtual/range {v33 .. v33}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getTagNo()I

    move-result v5

    packed-switch v5, :pswitch_data_736

    goto :goto_479

    .line 1556
    :pswitch_48d
    const/4 v5, 0x0

    move-object/from16 v0, v33

    invoke-static {v0, v5}, Lorg/spongycastle/asn1/ASN1Integer;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1Integer;

    move-result-object v5

    invoke-virtual {v5}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    move-result-object v5

    invoke-virtual {v5}, Ljava/math/BigInteger;->intValue()I

    move-result v72

    .line 1557
    .local v72, "tmpInt":I
    move/from16 v0, v72

    move/from16 v1, v39

    if-ge v0, v1, :cond_479

    .line 1559
    move/from16 v39, v72

    goto :goto_479

    .line 1563
    .end local v72    # "tmpInt":I
    :pswitch_4a5
    const/4 v5, 0x0

    move-object/from16 v0, v33

    invoke-static {v0, v5}, Lorg/spongycastle/asn1/ASN1Integer;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1Integer;

    move-result-object v5

    invoke-virtual {v5}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    move-result-object v5

    invoke-virtual {v5}, Ljava/math/BigInteger;->intValue()I
    :try_end_4b3
    .catch Lorg/spongycastle/jce/provider/AnnotatedException; {:try_start_469 .. :try_end_4b3} :catch_4bd
    .catch Lorg/spongycastle/x509/CertPathReviewerException; {:try_start_469 .. :try_end_4b3} :catch_ee

    move-result v72

    .line 1564
    .restart local v72    # "tmpInt":I
    move/from16 v0, v72

    move/from16 v1, v63

    if-ge v0, v1, :cond_479

    .line 1566
    move/from16 v63, v72

    goto :goto_479

    .line 1573
    .end local v33    # "constraint":Lorg/spongycastle/asn1/ASN1TaggedObject;
    .end local v60    # "pc":Lorg/spongycastle/asn1/ASN1Sequence;
    .end local v62    # "policyConstraints":Ljava/util/Enumeration;
    .end local v72    # "tmpInt":I
    :catch_4bd
    move-exception v30

    .line 1575
    .restart local v30    # "ae":Lorg/spongycastle/jce/provider/AnnotatedException;
    :try_start_4be
    new-instance v54, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v5, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v6, "CertPathReviewer.policyConstExtError"

    move-object/from16 v0, v54

    invoke-direct {v0, v5, v6}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1576
    .restart local v54    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    new-instance v5, Lorg/spongycastle/x509/CertPathReviewerException;

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->certPath:Ljava/security/cert/CertPath;

    move-object/from16 v0, v54

    move/from16 v1, v42

    invoke-direct {v5, v0, v6, v1}, Lorg/spongycastle/x509/CertPathReviewerException;-><init>(Lorg/spongycastle/i18n/ErrorBundle;Ljava/security/cert/CertPath;I)V

    throw v5
    :try_end_4d7
    .catch Lorg/spongycastle/x509/CertPathReviewerException; {:try_start_4be .. :try_end_4d7} :catch_ee

    .line 1585
    .end local v30    # "ae":Lorg/spongycastle/jce/provider/AnnotatedException;
    .end local v54    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    .restart local v60    # "pc":Lorg/spongycastle/asn1/ASN1Sequence;
    :cond_4d7
    :try_start_4d7
    sget-object v5, Lorg/spongycastle/x509/PKIXCertPathReviewer;->INHIBIT_ANY_POLICY:Ljava/lang/String;

    move-object/from16 v0, v31

    invoke-static {v0, v5}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->getExtensionValue(Ljava/security/cert/X509Extension;Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v40

    check-cast v40, Lorg/spongycastle/asn1/ASN1Integer;

    .line 1587
    .local v40, "iap":Lorg/spongycastle/asn1/ASN1Integer;
    if-eqz v40, :cond_4f3

    .line 1589
    invoke-virtual/range {v40 .. v40}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    move-result-object v5

    invoke-virtual {v5}, Ljava/math/BigInteger;->intValue()I
    :try_end_4ea
    .catch Lorg/spongycastle/jce/provider/AnnotatedException; {:try_start_4d7 .. :try_end_4ea} :catch_4f7
    .catch Lorg/spongycastle/x509/CertPathReviewerException; {:try_start_4d7 .. :try_end_4ea} :catch_ee

    move-result v20

    .line 1591
    .local v20, "_inhibitAnyPolicy":I
    move/from16 v0, v20

    move/from16 v1, v43

    if-ge v0, v1, :cond_4f3

    .line 1593
    move/from16 v43, v20

    .line 1185
    .end local v20    # "_inhibitAnyPolicy":I
    .end local v40    # "iap":Lorg/spongycastle/asn1/ASN1Integer;
    .end local v60    # "pc":Lorg/spongycastle/asn1/ASN1Sequence;
    .end local v61    # "pm":Lorg/spongycastle/asn1/ASN1Primitive;
    :cond_4f3
    add-int/lit8 v42, v42, -0x1

    goto/16 :goto_7b

    .line 1597
    .restart local v60    # "pc":Lorg/spongycastle/asn1/ASN1Sequence;
    .restart local v61    # "pm":Lorg/spongycastle/asn1/ASN1Primitive;
    :catch_4f7
    move-exception v30

    .line 1599
    .restart local v30    # "ae":Lorg/spongycastle/jce/provider/AnnotatedException;
    :try_start_4f8
    new-instance v54, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v5, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v6, "CertPathReviewer.policyInhibitExtError"

    move-object/from16 v0, v54

    invoke-direct {v0, v5, v6}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1600
    .restart local v54    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    new-instance v5, Lorg/spongycastle/x509/CertPathReviewerException;

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->certPath:Ljava/security/cert/CertPath;

    move-object/from16 v0, v54

    move/from16 v1, v42

    invoke-direct {v5, v0, v6, v1}, Lorg/spongycastle/x509/CertPathReviewerException;-><init>(Lorg/spongycastle/i18n/ErrorBundle;Ljava/security/cert/CertPath;I)V

    throw v5

    .line 1614
    .end local v10    # "i":I
    .end local v30    # "ae":Lorg/spongycastle/jce/provider/AnnotatedException;
    .end local v32    # "certPolicies":Lorg/spongycastle/asn1/ASN1Sequence;
    .end local v54    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    .end local v60    # "pc":Lorg/spongycastle/asn1/ASN1Sequence;
    .end local v61    # "pm":Lorg/spongycastle/asn1/ASN1Primitive;
    :cond_511
    invoke-static/range {v31 .. v31}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->isSelfIssued(Ljava/security/cert/X509Certificate;)Z
    :try_end_514
    .catch Lorg/spongycastle/x509/CertPathReviewerException; {:try_start_4f8 .. :try_end_514} :catch_ee

    move-result v5

    if-nez v5, :cond_51b

    if-lez v39, :cond_51b

    .line 1616
    add-int/lit8 v39, v39, -0x1

    .line 1625
    :cond_51b
    :try_start_51b
    sget-object v5, Lorg/spongycastle/x509/PKIXCertPathReviewer;->POLICY_CONSTRAINTS:Ljava/lang/String;

    move-object/from16 v0, v31

    invoke-static {v0, v5}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->getExtensionValue(Ljava/security/cert/X509Extension;Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v60

    check-cast v60, Lorg/spongycastle/asn1/ASN1Sequence;

    .line 1626
    .restart local v60    # "pc":Lorg/spongycastle/asn1/ASN1Sequence;
    if-eqz v60, :cond_56d

    .line 1628
    invoke-virtual/range {v60 .. v60}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjects()Ljava/util/Enumeration;

    move-result-object v62

    .line 1630
    .restart local v62    # "policyConstraints":Ljava/util/Enumeration;
    :cond_52b
    :goto_52b
    invoke-interface/range {v62 .. v62}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    if-eqz v5, :cond_56d

    .line 1632
    invoke-interface/range {v62 .. v62}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v33

    check-cast v33, Lorg/spongycastle/asn1/ASN1TaggedObject;

    .line 1633
    .restart local v33    # "constraint":Lorg/spongycastle/asn1/ASN1TaggedObject;
    invoke-virtual/range {v33 .. v33}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getTagNo()I

    move-result v5

    packed-switch v5, :pswitch_data_73e

    goto :goto_52b

    .line 1636
    :pswitch_53f
    const/4 v5, 0x0

    move-object/from16 v0, v33

    invoke-static {v0, v5}, Lorg/spongycastle/asn1/ASN1Integer;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1Integer;

    move-result-object v5

    invoke-virtual {v5}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    move-result-object v5

    invoke-virtual {v5}, Ljava/math/BigInteger;->intValue()I
    :try_end_54d
    .catch Lorg/spongycastle/jce/provider/AnnotatedException; {:try_start_51b .. :try_end_54d} :catch_553
    .catch Lorg/spongycastle/x509/CertPathReviewerException; {:try_start_51b .. :try_end_54d} :catch_ee

    move-result v72

    .line 1637
    .restart local v72    # "tmpInt":I
    if-nez v72, :cond_52b

    .line 1639
    const/16 v39, 0x0

    goto :goto_52b

    .line 1646
    .end local v33    # "constraint":Lorg/spongycastle/asn1/ASN1TaggedObject;
    .end local v60    # "pc":Lorg/spongycastle/asn1/ASN1Sequence;
    .end local v62    # "policyConstraints":Ljava/util/Enumeration;
    .end local v72    # "tmpInt":I
    :catch_553
    move-exception v38

    .line 1648
    .local v38, "e":Lorg/spongycastle/jce/provider/AnnotatedException;
    :try_start_554
    new-instance v54, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v5, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v6, "CertPathReviewer.policyConstExtError"

    move-object/from16 v0, v54

    invoke-direct {v0, v5, v6}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1649
    .restart local v54    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    new-instance v5, Lorg/spongycastle/x509/CertPathReviewerException;

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->certPath:Ljava/security/cert/CertPath;

    move-object/from16 v0, v54

    move/from16 v1, v42

    invoke-direct {v5, v0, v6, v1}, Lorg/spongycastle/x509/CertPathReviewerException;-><init>(Lorg/spongycastle/i18n/ErrorBundle;Ljava/security/cert/CertPath;I)V

    throw v5

    .line 1662
    .end local v38    # "e":Lorg/spongycastle/jce/provider/AnnotatedException;
    .end local v54    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    .restart local v60    # "pc":Lorg/spongycastle/asn1/ASN1Sequence;
    :cond_56d
    if-nez v4, :cond_5ab

    .line 1664
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->pkixParams:Ljava/security/cert/PKIXParameters;

    invoke-virtual {v5}, Ljava/security/cert/PKIXParameters;->isExplicitPolicyRequired()Z

    move-result v5

    if-eqz v5, :cond_592

    .line 1666
    new-instance v54, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v5, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v6, "CertPathReviewer.explicitPolicy"

    move-object/from16 v0, v54

    invoke-direct {v0, v5, v6}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1667
    .restart local v54    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    new-instance v5, Lorg/spongycastle/x509/CertPathReviewerException;

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->certPath:Ljava/security/cert/CertPath;

    move-object/from16 v0, v54

    move/from16 v1, v42

    invoke-direct {v5, v0, v6, v1}, Lorg/spongycastle/x509/CertPathReviewerException;-><init>(Lorg/spongycastle/i18n/ErrorBundle;Ljava/security/cert/CertPath;I)V

    throw v5

    .line 1669
    .end local v54    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    :cond_592
    const/16 v44, 0x0

    .line 1810
    .local v44, "intersection":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    :goto_594
    if-gtz v39, :cond_732

    if-nez v44, :cond_732

    .line 1812
    new-instance v54, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v5, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v6, "CertPathReviewer.invalidPolicy"

    move-object/from16 v0, v54

    invoke-direct {v0, v5, v6}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1813
    .restart local v54    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    new-instance v5, Lorg/spongycastle/x509/CertPathReviewerException;

    move-object/from16 v0, v54

    invoke-direct {v5, v0}, Lorg/spongycastle/x509/CertPathReviewerException;-><init>(Lorg/spongycastle/i18n/ErrorBundle;)V

    throw v5

    .line 1671
    .end local v44    # "intersection":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    .end local v54    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    :cond_5ab
    invoke-static/range {v73 .. v73}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->isAnyPolicy(Ljava/util/Set;)Z

    move-result v5

    if-eqz v5, :cond_67b

    .line 1673
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->pkixParams:Ljava/security/cert/PKIXParameters;

    invoke-virtual {v5}, Ljava/security/cert/PKIXParameters;->isExplicitPolicyRequired()Z

    move-result v5

    if-eqz v5, :cond_677

    .line 1675
    invoke-interface/range {v29 .. v29}, Ljava/util/Set;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_5da

    .line 1677
    new-instance v54, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v5, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v6, "CertPathReviewer.explicitPolicy"

    move-object/from16 v0, v54

    invoke-direct {v0, v5, v6}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1678
    .restart local v54    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    new-instance v5, Lorg/spongycastle/x509/CertPathReviewerException;

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->certPath:Ljava/security/cert/CertPath;

    move-object/from16 v0, v54

    move/from16 v1, v42

    invoke-direct {v5, v0, v6, v1}, Lorg/spongycastle/x509/CertPathReviewerException;-><init>(Lorg/spongycastle/i18n/ErrorBundle;Ljava/security/cert/CertPath;I)V

    throw v5

    .line 1682
    .end local v54    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    :cond_5da
    new-instance v27, Ljava/util/HashSet;

    invoke-direct/range {v27 .. v27}, Ljava/util/HashSet;-><init>()V

    .line 1684
    .local v27, "_validPolicyNodeSet":Ljava/util/Set;
    const/16 v48, 0x0

    :goto_5e1
    move-object/from16 v0, v64

    array-length v5, v0

    move/from16 v0, v48

    if-ge v0, v5, :cond_624

    .line 1686
    aget-object v22, v64, v48

    .line 1688
    .local v22, "_nodeDepth":Ljava/util/List;
    const/16 v49, 0x0

    .restart local v49    # "k":I
    :goto_5ec
    invoke-interface/range {v22 .. v22}, Ljava/util/List;->size()I

    move-result v5

    move/from16 v0, v49

    if-ge v0, v5, :cond_621

    .line 1690
    move-object/from16 v0, v22

    move/from16 v1, v49

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/spongycastle/jce/provider/PKIXPolicyNode;

    .line 1692
    .restart local v12    # "_node":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    const-string v5, "2.5.29.32.0"

    invoke-virtual {v12}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;->getValidPolicy()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_61e

    .line 1694
    invoke-virtual {v12}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;->getChildren()Ljava/util/Iterator;

    move-result-object v21

    .line 1695
    .local v21, "_iter":Ljava/util/Iterator;
    :goto_60e
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_61e

    .line 1697
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    move-object/from16 v0, v27

    invoke-interface {v0, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_60e

    .line 1688
    .end local v21    # "_iter":Ljava/util/Iterator;
    :cond_61e
    add-int/lit8 v49, v49, 0x1

    goto :goto_5ec

    .line 1684
    .end local v12    # "_node":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    :cond_621
    add-int/lit8 v48, v48, 0x1

    goto :goto_5e1

    .line 1703
    .end local v22    # "_nodeDepth":Ljava/util/List;
    .end local v49    # "k":I
    :cond_624
    invoke-interface/range {v27 .. v27}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v28

    .line 1704
    .local v28, "_vpnsIter":Ljava/util/Iterator;
    :cond_628
    :goto_628
    invoke-interface/range {v28 .. v28}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_643

    .line 1706
    invoke-interface/range {v28 .. v28}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/spongycastle/jce/provider/PKIXPolicyNode;

    .line 1707
    .restart local v12    # "_node":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    invoke-virtual {v12}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;->getValidPolicy()Ljava/lang/String;

    move-result-object v26

    .line 1709
    .local v26, "_validPolicy":Ljava/lang/String;
    move-object/from16 v0, v29

    move-object/from16 v1, v26

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_628

    goto :goto_628

    .line 1714
    .end local v12    # "_node":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    .end local v26    # "_validPolicy":Ljava/lang/String;
    :cond_643
    if-eqz v4, :cond_677

    .line 1716
    move-object/from16 v0, p0

    iget v5, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->n:I

    add-int/lit8 v48, v5, -0x1

    :goto_64b
    if-ltz v48, :cond_677

    .line 1718
    aget-object v56, v64, v48

    .line 1720
    .restart local v56    # "nodes":Ljava/util/List;
    const/16 v49, 0x0

    .restart local v49    # "k":I
    :goto_651
    invoke-interface/range {v56 .. v56}, Ljava/util/List;->size()I

    move-result v5

    move/from16 v0, v49

    if-ge v0, v5, :cond_674

    .line 1722
    move-object/from16 v0, v56

    move/from16 v1, v49

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v55

    check-cast v55, Lorg/spongycastle/jce/provider/PKIXPolicyNode;

    .line 1723
    .restart local v55    # "node":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    invoke-virtual/range {v55 .. v55}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;->hasChildren()Z

    move-result v5

    if-nez v5, :cond_671

    .line 1725
    move-object/from16 v0, v64

    move-object/from16 v1, v55

    invoke-static {v4, v0, v1}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->removePolicyNode(Lorg/spongycastle/jce/provider/PKIXPolicyNode;[Ljava/util/List;Lorg/spongycastle/jce/provider/PKIXPolicyNode;)Lorg/spongycastle/jce/provider/PKIXPolicyNode;

    move-result-object v4

    .line 1720
    :cond_671
    add-int/lit8 v49, v49, 0x1

    goto :goto_651

    .line 1716
    .end local v55    # "node":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    :cond_674
    add-int/lit8 v48, v48, -0x1

    goto :goto_64b

    .line 1733
    .end local v27    # "_validPolicyNodeSet":Ljava/util/Set;
    .end local v28    # "_vpnsIter":Ljava/util/Iterator;
    .end local v49    # "k":I
    .end local v56    # "nodes":Ljava/util/List;
    :cond_677
    move-object/from16 v44, v4

    .restart local v44    # "intersection":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    goto/16 :goto_594

    .line 1747
    .end local v44    # "intersection":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    :cond_67b
    new-instance v27, Ljava/util/HashSet;

    invoke-direct/range {v27 .. v27}, Ljava/util/HashSet;-><init>()V

    .line 1749
    .restart local v27    # "_validPolicyNodeSet":Ljava/util/Set;
    const/16 v48, 0x0

    :goto_682
    move-object/from16 v0, v64

    array-length v5, v0

    move/from16 v0, v48

    if-ge v0, v5, :cond_6d5

    .line 1751
    aget-object v22, v64, v48

    .line 1753
    .restart local v22    # "_nodeDepth":Ljava/util/List;
    const/16 v49, 0x0

    .restart local v49    # "k":I
    :goto_68d
    invoke-interface/range {v22 .. v22}, Ljava/util/List;->size()I

    move-result v5

    move/from16 v0, v49

    if-ge v0, v5, :cond_6d2

    .line 1755
    move-object/from16 v0, v22

    move/from16 v1, v49

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/spongycastle/jce/provider/PKIXPolicyNode;

    .line 1757
    .restart local v12    # "_node":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    const-string v5, "2.5.29.32.0"

    invoke-virtual {v12}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;->getValidPolicy()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6cf

    .line 1759
    invoke-virtual {v12}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;->getChildren()Ljava/util/Iterator;

    move-result-object v21

    .line 1760
    .restart local v21    # "_iter":Ljava/util/Iterator;
    :cond_6af
    :goto_6af
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_6cf

    .line 1762
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lorg/spongycastle/jce/provider/PKIXPolicyNode;

    .line 1763
    .local v16, "_c_node":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    const-string v5, "2.5.29.32.0"

    invoke-virtual/range {v16 .. v16}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;->getValidPolicy()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_6af

    .line 1765
    move-object/from16 v0, v27

    move-object/from16 v1, v16

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_6af

    .line 1753
    .end local v16    # "_c_node":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    .end local v21    # "_iter":Ljava/util/Iterator;
    :cond_6cf
    add-int/lit8 v49, v49, 0x1

    goto :goto_68d

    .line 1749
    .end local v12    # "_node":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    :cond_6d2
    add-int/lit8 v48, v48, 0x1

    goto :goto_682

    .line 1775
    .end local v22    # "_nodeDepth":Ljava/util/List;
    .end local v49    # "k":I
    :cond_6d5
    invoke-interface/range {v27 .. v27}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v28

    .line 1776
    .restart local v28    # "_vpnsIter":Ljava/util/Iterator;
    :cond_6d9
    :goto_6d9
    invoke-interface/range {v28 .. v28}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_6fa

    .line 1778
    invoke-interface/range {v28 .. v28}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/spongycastle/jce/provider/PKIXPolicyNode;

    .line 1779
    .restart local v12    # "_node":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    invoke-virtual {v12}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;->getValidPolicy()Ljava/lang/String;

    move-result-object v26

    .line 1781
    .restart local v26    # "_validPolicy":Ljava/lang/String;
    move-object/from16 v0, v73

    move-object/from16 v1, v26

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_6d9

    .line 1783
    move-object/from16 v0, v64

    invoke-static {v4, v0, v12}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->removePolicyNode(Lorg/spongycastle/jce/provider/PKIXPolicyNode;[Ljava/util/List;Lorg/spongycastle/jce/provider/PKIXPolicyNode;)Lorg/spongycastle/jce/provider/PKIXPolicyNode;

    move-result-object v4

    goto :goto_6d9

    .line 1790
    .end local v12    # "_node":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    .end local v26    # "_validPolicy":Ljava/lang/String;
    :cond_6fa
    if-eqz v4, :cond_72e

    .line 1792
    move-object/from16 v0, p0

    iget v5, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->n:I

    add-int/lit8 v48, v5, -0x1

    :goto_702
    if-ltz v48, :cond_72e

    .line 1794
    aget-object v56, v64, v48

    .line 1796
    .restart local v56    # "nodes":Ljava/util/List;
    const/16 v49, 0x0

    .restart local v49    # "k":I
    :goto_708
    invoke-interface/range {v56 .. v56}, Ljava/util/List;->size()I

    move-result v5

    move/from16 v0, v49

    if-ge v0, v5, :cond_72b

    .line 1798
    move-object/from16 v0, v56

    move/from16 v1, v49

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v55

    check-cast v55, Lorg/spongycastle/jce/provider/PKIXPolicyNode;

    .line 1799
    .restart local v55    # "node":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    invoke-virtual/range {v55 .. v55}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;->hasChildren()Z

    move-result v5

    if-nez v5, :cond_728

    .line 1801
    move-object/from16 v0, v64

    move-object/from16 v1, v55

    invoke-static {v4, v0, v1}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->removePolicyNode(Lorg/spongycastle/jce/provider/PKIXPolicyNode;[Ljava/util/List;Lorg/spongycastle/jce/provider/PKIXPolicyNode;)Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    :try_end_727
    .catch Lorg/spongycastle/x509/CertPathReviewerException; {:try_start_554 .. :try_end_727} :catch_ee

    move-result-object v4

    .line 1796
    :cond_728
    add-int/lit8 v49, v49, 0x1

    goto :goto_708

    .line 1792
    .end local v55    # "node":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    :cond_72b
    add-int/lit8 v48, v48, -0x1

    goto :goto_702

    .line 1807
    .end local v49    # "k":I
    .end local v56    # "nodes":Ljava/util/List;
    :cond_72e
    move-object/from16 v44, v4

    .restart local v44    # "intersection":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    goto/16 :goto_594

    .line 1816
    .end local v27    # "_validPolicyNodeSet":Ljava/util/Set;
    .end local v28    # "_vpnsIter":Ljava/util/Iterator;
    :cond_732
    move-object/from16 v4, v44

    goto/16 :goto_fd

    .line 1553
    :pswitch_data_736
    .packed-switch 0x0
        :pswitch_48d
        :pswitch_4a5
    .end packed-switch

    .line 1633
    :pswitch_data_73e
    .packed-switch 0x0
        :pswitch_53f
    .end packed-switch
.end method

.method private checkSignatures()V
    .registers 47

    .prologue
    .line 697
    const/16 v33, 0x0

    .line 698
    .local v33, "trust":Ljava/security/cert/TrustAnchor;
    const/16 v35, 0x0

    .line 702
    .local v35, "trustPrincipal":Ljavax/security/auth/x500/X500Principal;
    new-instance v29, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v2, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v3, "CertPathReviewer.certPathValidDate"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/16 v43, 0x0

    new-instance v44, Lorg/spongycastle/i18n/filter/TrustedInput;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->validDate:Ljava/util/Date;

    move-object/from16 v45, v0

    invoke-direct/range {v44 .. v45}, Lorg/spongycastle/i18n/filter/TrustedInput;-><init>(Ljava/lang/Object;)V

    aput-object v44, v5, v43

    const/16 v43, 0x1

    new-instance v44, Lorg/spongycastle/i18n/filter/TrustedInput;

    new-instance v45, Ljava/util/Date;

    invoke-direct/range {v45 .. v45}, Ljava/util/Date;-><init>()V

    invoke-direct/range {v44 .. v45}, Lorg/spongycastle/i18n/filter/TrustedInput;-><init>(Ljava/lang/Object;)V

    aput-object v44, v5, v43

    move-object/from16 v0, v29

    invoke-direct {v0, v2, v3, v5}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 704
    .local v29, "msg":Lorg/spongycastle/i18n/ErrorBundle;
    move-object/from16 v0, p0

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->addNotification(Lorg/spongycastle/i18n/ErrorBundle;)V

    .line 710
    :try_start_36
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->certs:Ljava/util/List;

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->certs:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/security/cert/X509Certificate;

    .line 711
    .local v4, "cert":Ljava/security/cert/X509Certificate;
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->pkixParams:Ljava/security/cert/PKIXParameters;

    invoke-virtual {v2}, Ljava/security/cert/PKIXParameters;->getTrustAnchors()Ljava/util/Set;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-virtual {v0, v4, v2}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->getTrustAnchors(Ljava/security/cert/X509Certificate;Ljava/util/Set;)Ljava/util/Collection;

    move-result-object v34

    .line 712
    .local v34, "trustColl":Ljava/util/Collection;
    invoke-interface/range {v34 .. v34}, Ljava/util/Collection;->size()I

    move-result v2

    const/4 v3, 0x1

    if-le v2, v3, :cond_16b

    .line 715
    new-instance v29, Lorg/spongycastle/i18n/ErrorBundle;

    .end local v29    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    const-string v2, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v3, "CertPathReviewer.conflictingTrustAnchors"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/16 v43, 0x0

    .line 717
    invoke-interface/range {v34 .. v34}, Ljava/util/Collection;->size()I

    move-result v44

    invoke-static/range {v44 .. v44}, Lorg/spongycastle/util/Integers;->valueOf(I)Ljava/lang/Integer;

    move-result-object v44

    aput-object v44, v5, v43

    const/16 v43, 0x1

    new-instance v44, Lorg/spongycastle/i18n/filter/UntrustedInput;

    .line 718
    invoke-virtual {v4}, Ljava/security/cert/X509Certificate;->getIssuerX500Principal()Ljavax/security/auth/x500/X500Principal;

    move-result-object v45

    invoke-direct/range {v44 .. v45}, Lorg/spongycastle/i18n/filter/UntrustedInput;-><init>(Ljava/lang/Object;)V

    aput-object v44, v5, v43

    move-object/from16 v0, v29

    invoke-direct {v0, v2, v3, v5}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 719
    .restart local v29    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    move-object/from16 v0, p0

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->addError(Lorg/spongycastle/i18n/ErrorBundle;)V
    :try_end_8d
    .catch Lorg/spongycastle/x509/CertPathReviewerException; {:try_start_36 .. :try_end_8d} :catch_1ab
    .catch Ljava/lang/Throwable; {:try_start_36 .. :try_end_8d} :catch_1f6

    .line 769
    .end local v4    # "cert":Ljava/security/cert/X509Certificate;
    .end local v29    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    .end local v34    # "trustColl":Ljava/util/Collection;
    :goto_8d
    if-eqz v33, :cond_b8

    .line 772
    invoke-virtual/range {v33 .. v33}, Ljava/security/cert/TrustAnchor;->getTrustedCert()Ljava/security/cert/X509Certificate;

    move-result-object v6

    .line 775
    .local v6, "sign":Ljava/security/cert/X509Certificate;
    if-eqz v6, :cond_22d

    .line 777
    :try_start_95
    invoke-static {v6}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->getSubjectPrincipal(Ljava/security/cert/X509Certificate;)Ljavax/security/auth/x500/X500Principal;
    :try_end_98
    .catch Ljava/lang/IllegalArgumentException; {:try_start_95 .. :try_end_98} :catch_23c

    move-result-object v35

    .line 792
    :goto_99
    if-eqz v6, :cond_b8

    .line 794
    invoke-virtual {v6}, Ljava/security/cert/X509Certificate;->getKeyUsage()[Z

    move-result-object v28

    .line 795
    .local v28, "ku":[Z
    if-eqz v28, :cond_b8

    const/4 v2, 0x5

    aget-boolean v2, v28, v2

    if-nez v2, :cond_b8

    .line 797
    new-instance v29, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v2, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v3, "CertPathReviewer.trustKeyUsage"

    move-object/from16 v0, v29

    invoke-direct {v0, v2, v3}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 798
    .restart local v29    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    move-object/from16 v0, p0

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->addNotification(Lorg/spongycastle/i18n/ErrorBundle;)V

    .line 805
    .end local v6    # "sign":Ljava/security/cert/X509Certificate;
    .end local v28    # "ku":[Z
    .end local v29    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    :cond_b8
    const/4 v7, 0x0

    .line 806
    .local v7, "workingPublicKey":Ljava/security/PublicKey;
    move-object/from16 v40, v35

    .line 808
    .local v40, "workingIssuerName":Ljavax/security/auth/x500/X500Principal;
    const/4 v6, 0x0

    .line 810
    .restart local v6    # "sign":Ljava/security/cert/X509Certificate;
    const/16 v39, 0x0

    .line 811
    .local v39, "workingAlgId":Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;
    const/16 v41, 0x0

    .line 812
    .local v41, "workingPublicKeyAlgorithm":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    const/16 v42, 0x0

    .line 814
    .local v42, "workingPublicKeyParameters":Lorg/spongycastle/asn1/ASN1Encodable;
    if-eqz v33, :cond_da

    .line 816
    invoke-virtual/range {v33 .. v33}, Ljava/security/cert/TrustAnchor;->getTrustedCert()Ljava/security/cert/X509Certificate;

    move-result-object v6

    .line 818
    if-eqz v6, :cond_261

    .line 820
    invoke-virtual {v6}, Ljava/security/cert/X509Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v7

    .line 829
    :goto_ce
    :try_start_ce
    invoke-static {v7}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->getAlgorithmIdentifier(Ljava/security/PublicKey;)Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    move-result-object v39

    .line 830
    invoke-virtual/range {v39 .. v39}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->getAlgorithm()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v41

    .line 831
    invoke-virtual/range {v39 .. v39}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->getParameters()Lorg/spongycastle/asn1/ASN1Encodable;
    :try_end_d9
    .catch Ljava/security/cert/CertPathValidatorException; {:try_start_ce .. :try_end_d9} :catch_267

    move-result-object v42

    .line 844
    :cond_da
    :goto_da
    const/4 v4, 0x0

    .line 847
    .restart local v4    # "cert":Ljava/security/cert/X509Certificate;
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->certs:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v10, v2, -0x1

    .local v10, "index":I
    :goto_e5
    if-ltz v10, :cond_532

    .line 852
    move-object/from16 v0, p0

    iget v2, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->n:I

    sub-int v26, v2, v10

    .line 860
    .local v26, "i":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->certs:Ljava/util/List;

    invoke-interface {v2, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    .end local v4    # "cert":Ljava/security/cert/X509Certificate;
    check-cast v4, Ljava/security/cert/X509Certificate;

    .line 863
    .restart local v4    # "cert":Ljava/security/cert/X509Certificate;
    if-eqz v7, :cond_2ae

    .line 867
    :try_start_f9
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->pkixParams:Ljava/security/cert/PKIXParameters;

    .line 868
    invoke-virtual {v2}, Ljava/security/cert/PKIXParameters;->getSigProvider()Ljava/lang/String;

    move-result-object v2

    .line 867
    invoke-static {v4, v7, v2}, Lorg/spongycastle/x509/CertPathValidatorUtilities;->verifyX509Certificate(Ljava/security/cert/X509Certificate;Ljava/security/PublicKey;Ljava/lang/String;)V
    :try_end_104
    .catch Ljava/security/GeneralSecurityException; {:try_start_f9 .. :try_end_104} :catch_27e

    .line 928
    :goto_104
    :try_start_104
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->validDate:Ljava/util/Date;

    invoke-virtual {v4, v2}, Ljava/security/cert/X509Certificate;->checkValidity(Ljava/util/Date;)V
    :try_end_10b
    .catch Ljava/security/cert/CertificateNotYetValidException; {:try_start_104 .. :try_end_10b} :catch_37f
    .catch Ljava/security/cert/CertificateExpiredException; {:try_start_104 .. :try_end_10b} :catch_3a4

    .line 944
    :goto_10b
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->pkixParams:Ljava/security/cert/PKIXParameters;

    invoke-virtual {v2}, Ljava/security/cert/PKIXParameters;->isRevocationEnabled()Z

    move-result v2

    if-eqz v2, :cond_42d

    .line 947
    const/16 v21, 0x0

    .line 950
    .local v21, "crlDistPoints":Lorg/spongycastle/asn1/x509/CRLDistPoint;
    :try_start_117
    sget-object v2, Lorg/spongycastle/x509/PKIXCertPathReviewer;->CRL_DIST_POINTS:Ljava/lang/String;

    invoke-static {v4, v2}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->getExtensionValue(Ljava/security/cert/X509Extension;Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v22

    .line 951
    .local v22, "crl_dp":Lorg/spongycastle/asn1/ASN1Primitive;
    if-eqz v22, :cond_123

    .line 953
    invoke-static/range {v22 .. v22}, Lorg/spongycastle/asn1/x509/CRLDistPoint;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/CRLDistPoint;
    :try_end_122
    .catch Lorg/spongycastle/jce/provider/AnnotatedException; {:try_start_117 .. :try_end_122} :catch_3c9

    move-result-object v21

    .line 963
    .end local v22    # "crl_dp":Lorg/spongycastle/asn1/ASN1Primitive;
    :cond_123
    :goto_123
    const/4 v15, 0x0

    .line 966
    .local v15, "authInfoAcc":Lorg/spongycastle/asn1/x509/AuthorityInformationAccess;
    :try_start_124
    sget-object v2, Lorg/spongycastle/x509/PKIXCertPathReviewer;->AUTH_INFO_ACCESS:Ljava/lang/String;

    invoke-static {v4, v2}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->getExtensionValue(Ljava/security/cert/X509Extension;Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v16

    .line 967
    .local v16, "auth_info_acc":Lorg/spongycastle/asn1/ASN1Primitive;
    if-eqz v16, :cond_130

    .line 969
    invoke-static/range {v16 .. v16}, Lorg/spongycastle/asn1/x509/AuthorityInformationAccess;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/AuthorityInformationAccess;
    :try_end_12f
    .catch Lorg/spongycastle/jce/provider/AnnotatedException; {:try_start_124 .. :try_end_12f} :catch_3de

    move-result-object v15

    .line 978
    .end local v16    # "auth_info_acc":Lorg/spongycastle/asn1/ASN1Primitive;
    :cond_130
    :goto_130
    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->getCRLDistUrls(Lorg/spongycastle/asn1/x509/CRLDistPoint;)Ljava/util/Vector;

    move-result-object v8

    .line 979
    .local v8, "crlDistPointUrls":Ljava/util/Vector;
    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->getOCSPUrls(Lorg/spongycastle/asn1/x509/AuthorityInformationAccess;)Ljava/util/Vector;

    move-result-object v9

    .line 984
    .local v9, "ocspUrls":Ljava/util/Vector;
    invoke-virtual {v8}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v38

    .line 985
    .local v38, "urlIt":Ljava/util/Iterator;
    :goto_142
    invoke-interface/range {v38 .. v38}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3f3

    .line 987
    new-instance v29, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v2, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v3, "CertPathReviewer.crlDistPoint"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/16 v43, 0x0

    new-instance v44, Lorg/spongycastle/i18n/filter/UntrustedUrlInput;

    .line 988
    invoke-interface/range {v38 .. v38}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v45

    invoke-direct/range {v44 .. v45}, Lorg/spongycastle/i18n/filter/UntrustedUrlInput;-><init>(Ljava/lang/Object;)V

    aput-object v44, v5, v43

    move-object/from16 v0, v29

    invoke-direct {v0, v2, v3, v5}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 989
    .restart local v29    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    move-object/from16 v0, p0

    move-object/from16 v1, v29

    invoke-virtual {v0, v1, v10}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->addNotification(Lorg/spongycastle/i18n/ErrorBundle;I)V

    goto :goto_142

    .line 721
    .end local v6    # "sign":Ljava/security/cert/X509Certificate;
    .end local v7    # "workingPublicKey":Ljava/security/PublicKey;
    .end local v8    # "crlDistPointUrls":Ljava/util/Vector;
    .end local v9    # "ocspUrls":Ljava/util/Vector;
    .end local v10    # "index":I
    .end local v15    # "authInfoAcc":Lorg/spongycastle/asn1/x509/AuthorityInformationAccess;
    .end local v21    # "crlDistPoints":Lorg/spongycastle/asn1/x509/CRLDistPoint;
    .end local v26    # "i":I
    .end local v38    # "urlIt":Ljava/util/Iterator;
    .end local v39    # "workingAlgId":Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;
    .end local v40    # "workingIssuerName":Ljavax/security/auth/x500/X500Principal;
    .end local v41    # "workingPublicKeyAlgorithm":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .end local v42    # "workingPublicKeyParameters":Lorg/spongycastle/asn1/ASN1Encodable;
    .restart local v34    # "trustColl":Ljava/util/Collection;
    :cond_16b
    :try_start_16b
    invoke-interface/range {v34 .. v34}, Ljava/util/Collection;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1b7

    .line 723
    new-instance v29, Lorg/spongycastle/i18n/ErrorBundle;

    .end local v29    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    const-string v2, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v3, "CertPathReviewer.noTrustAnchorFound"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/16 v43, 0x0

    new-instance v44, Lorg/spongycastle/i18n/filter/UntrustedInput;

    .line 725
    invoke-virtual {v4}, Ljava/security/cert/X509Certificate;->getIssuerX500Principal()Ljavax/security/auth/x500/X500Principal;

    move-result-object v45

    invoke-direct/range {v44 .. v45}, Lorg/spongycastle/i18n/filter/UntrustedInput;-><init>(Ljava/lang/Object;)V

    aput-object v44, v5, v43

    const/16 v43, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->pkixParams:Ljava/security/cert/PKIXParameters;

    move-object/from16 v44, v0

    .line 726
    invoke-virtual/range {v44 .. v44}, Ljava/security/cert/PKIXParameters;->getTrustAnchors()Ljava/util/Set;

    move-result-object v44

    invoke-interface/range {v44 .. v44}, Ljava/util/Set;->size()I

    move-result v44

    invoke-static/range {v44 .. v44}, Lorg/spongycastle/util/Integers;->valueOf(I)Ljava/lang/Integer;

    move-result-object v44

    aput-object v44, v5, v43

    move-object/from16 v0, v29

    invoke-direct {v0, v2, v3, v5}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 727
    .restart local v29    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    move-object/from16 v0, p0

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->addError(Lorg/spongycastle/i18n/ErrorBundle;)V
    :try_end_1a9
    .catch Lorg/spongycastle/x509/CertPathReviewerException; {:try_start_16b .. :try_end_1a9} :catch_1ab
    .catch Ljava/lang/Throwable; {:try_start_16b .. :try_end_1a9} :catch_1f6

    goto/16 :goto_8d

    .line 757
    .end local v4    # "cert":Ljava/security/cert/X509Certificate;
    .end local v29    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    .end local v34    # "trustColl":Ljava/util/Collection;
    :catch_1ab
    move-exception v20

    .line 759
    .local v20, "cpre":Lorg/spongycastle/x509/CertPathReviewerException;
    invoke-virtual/range {v20 .. v20}, Lorg/spongycastle/x509/CertPathReviewerException;->getErrorMessage()Lorg/spongycastle/i18n/ErrorBundle;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->addError(Lorg/spongycastle/i18n/ErrorBundle;)V

    goto/16 :goto_8d

    .line 732
    .end local v20    # "cpre":Lorg/spongycastle/x509/CertPathReviewerException;
    .restart local v4    # "cert":Ljava/security/cert/X509Certificate;
    .restart local v29    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    .restart local v34    # "trustColl":Ljava/util/Collection;
    :cond_1b7
    :try_start_1b7
    invoke-interface/range {v34 .. v34}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v0, v2

    check-cast v0, Ljava/security/cert/TrustAnchor;

    move-object/from16 v33, v0

    .line 733
    invoke-virtual/range {v33 .. v33}, Ljava/security/cert/TrustAnchor;->getTrustedCert()Ljava/security/cert/X509Certificate;

    move-result-object v2

    if-eqz v2, :cond_228

    .line 735
    invoke-virtual/range {v33 .. v33}, Ljava/security/cert/TrustAnchor;->getTrustedCert()Ljava/security/cert/X509Certificate;

    move-result-object v2

    invoke-virtual {v2}, Ljava/security/cert/X509Certificate;->getPublicKey()Ljava/security/PublicKey;
    :try_end_1d1
    .catch Lorg/spongycastle/x509/CertPathReviewerException; {:try_start_1b7 .. :try_end_1d1} :catch_1ab
    .catch Ljava/lang/Throwable; {:try_start_1b7 .. :try_end_1d1} :catch_1f6

    move-result-object v37

    .line 743
    .local v37, "trustPublicKey":Ljava/security/PublicKey;
    :goto_1d2
    :try_start_1d2
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->pkixParams:Ljava/security/cert/PKIXParameters;

    .line 744
    invoke-virtual {v2}, Ljava/security/cert/PKIXParameters;->getSigProvider()Ljava/lang/String;

    move-result-object v2

    .line 743
    move-object/from16 v0, v37

    invoke-static {v4, v0, v2}, Lorg/spongycastle/x509/CertPathValidatorUtilities;->verifyX509Certificate(Ljava/security/cert/X509Certificate;Ljava/security/PublicKey;Ljava/lang/String;)V
    :try_end_1df
    .catch Ljava/security/SignatureException; {:try_start_1d2 .. :try_end_1df} :catch_1e1
    .catch Ljava/lang/Exception; {:try_start_1d2 .. :try_end_1df} :catch_540
    .catch Lorg/spongycastle/x509/CertPathReviewerException; {:try_start_1d2 .. :try_end_1df} :catch_1ab
    .catch Ljava/lang/Throwable; {:try_start_1d2 .. :try_end_1df} :catch_1f6

    goto/16 :goto_8d

    .line 746
    :catch_1e1
    move-exception v23

    .line 748
    .local v23, "e":Ljava/security/SignatureException;
    :try_start_1e2
    new-instance v29, Lorg/spongycastle/i18n/ErrorBundle;

    .end local v29    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    const-string v2, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v3, "CertPathReviewer.trustButInvalidCert"

    move-object/from16 v0, v29

    invoke-direct {v0, v2, v3}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 749
    .restart local v29    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    move-object/from16 v0, p0

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->addError(Lorg/spongycastle/i18n/ErrorBundle;)V
    :try_end_1f4
    .catch Lorg/spongycastle/x509/CertPathReviewerException; {:try_start_1e2 .. :try_end_1f4} :catch_1ab
    .catch Ljava/lang/Throwable; {:try_start_1e2 .. :try_end_1f4} :catch_1f6

    goto/16 :goto_8d

    .line 761
    .end local v4    # "cert":Ljava/security/cert/X509Certificate;
    .end local v23    # "e":Ljava/security/SignatureException;
    .end local v29    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    .end local v34    # "trustColl":Ljava/util/Collection;
    .end local v37    # "trustPublicKey":Ljava/security/PublicKey;
    :catch_1f6
    move-exception v32

    .line 763
    .local v32, "t":Ljava/lang/Throwable;
    new-instance v29, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v2, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v3, "CertPathReviewer.unknown"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/16 v43, 0x0

    new-instance v44, Lorg/spongycastle/i18n/filter/UntrustedInput;

    .line 765
    invoke-virtual/range {v32 .. v32}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v45

    invoke-direct/range {v44 .. v45}, Lorg/spongycastle/i18n/filter/UntrustedInput;-><init>(Ljava/lang/Object;)V

    aput-object v44, v5, v43

    const/16 v43, 0x1

    new-instance v44, Lorg/spongycastle/i18n/filter/UntrustedInput;

    move-object/from16 v0, v44

    move-object/from16 v1, v32

    invoke-direct {v0, v1}, Lorg/spongycastle/i18n/filter/UntrustedInput;-><init>(Ljava/lang/Object;)V

    aput-object v44, v5, v43

    move-object/from16 v0, v29

    invoke-direct {v0, v2, v3, v5}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 766
    .restart local v29    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    move-object/from16 v0, p0

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->addError(Lorg/spongycastle/i18n/ErrorBundle;)V

    goto/16 :goto_8d

    .line 739
    .end local v32    # "t":Ljava/lang/Throwable;
    .restart local v4    # "cert":Ljava/security/cert/X509Certificate;
    .restart local v34    # "trustColl":Ljava/util/Collection;
    :cond_228
    :try_start_228
    invoke-virtual/range {v33 .. v33}, Ljava/security/cert/TrustAnchor;->getCAPublicKey()Ljava/security/PublicKey;
    :try_end_22b
    .catch Lorg/spongycastle/x509/CertPathReviewerException; {:try_start_228 .. :try_end_22b} :catch_1ab
    .catch Ljava/lang/Throwable; {:try_start_228 .. :try_end_22b} :catch_1f6

    move-result-object v37

    .restart local v37    # "trustPublicKey":Ljava/security/PublicKey;
    goto :goto_1d2

    .line 781
    .end local v4    # "cert":Ljava/security/cert/X509Certificate;
    .end local v29    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    .end local v34    # "trustColl":Ljava/util/Collection;
    .end local v37    # "trustPublicKey":Ljava/security/PublicKey;
    .restart local v6    # "sign":Ljava/security/cert/X509Certificate;
    :cond_22d
    :try_start_22d
    new-instance v36, Ljavax/security/auth/x500/X500Principal;

    invoke-virtual/range {v33 .. v33}, Ljava/security/cert/TrustAnchor;->getCAName()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v36

    invoke-direct {v0, v2}, Ljavax/security/auth/x500/X500Principal;-><init>(Ljava/lang/String;)V
    :try_end_238
    .catch Ljava/lang/IllegalArgumentException; {:try_start_22d .. :try_end_238} :catch_23c

    .end local v35    # "trustPrincipal":Ljavax/security/auth/x500/X500Principal;
    .local v36, "trustPrincipal":Ljavax/security/auth/x500/X500Principal;
    move-object/from16 v35, v36

    .end local v36    # "trustPrincipal":Ljavax/security/auth/x500/X500Principal;
    .restart local v35    # "trustPrincipal":Ljavax/security/auth/x500/X500Principal;
    goto/16 :goto_99

    .line 784
    :catch_23c
    move-exception v24

    .line 786
    .local v24, "ex":Ljava/lang/IllegalArgumentException;
    new-instance v29, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v2, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v3, "CertPathReviewer.trustDNInvalid"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/16 v43, 0x0

    new-instance v44, Lorg/spongycastle/i18n/filter/UntrustedInput;

    .line 787
    invoke-virtual/range {v33 .. v33}, Ljava/security/cert/TrustAnchor;->getCAName()Ljava/lang/String;

    move-result-object v45

    invoke-direct/range {v44 .. v45}, Lorg/spongycastle/i18n/filter/UntrustedInput;-><init>(Ljava/lang/Object;)V

    aput-object v44, v5, v43

    move-object/from16 v0, v29

    invoke-direct {v0, v2, v3, v5}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 788
    .restart local v29    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    move-object/from16 v0, p0

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->addError(Lorg/spongycastle/i18n/ErrorBundle;)V

    goto/16 :goto_99

    .line 824
    .end local v24    # "ex":Ljava/lang/IllegalArgumentException;
    .end local v29    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    .restart local v7    # "workingPublicKey":Ljava/security/PublicKey;
    .restart local v39    # "workingAlgId":Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;
    .restart local v40    # "workingIssuerName":Ljavax/security/auth/x500/X500Principal;
    .restart local v41    # "workingPublicKeyAlgorithm":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .restart local v42    # "workingPublicKeyParameters":Lorg/spongycastle/asn1/ASN1Encodable;
    :cond_261
    invoke-virtual/range {v33 .. v33}, Ljava/security/cert/TrustAnchor;->getCAPublicKey()Ljava/security/PublicKey;

    move-result-object v7

    goto/16 :goto_ce

    .line 833
    :catch_267
    move-exception v24

    .line 835
    .local v24, "ex":Ljava/security/cert/CertPathValidatorException;
    new-instance v29, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v2, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v3, "CertPathReviewer.trustPubKeyError"

    move-object/from16 v0, v29

    invoke-direct {v0, v2, v3}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 836
    .restart local v29    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    move-object/from16 v0, p0

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->addError(Lorg/spongycastle/i18n/ErrorBundle;)V

    .line 837
    const/16 v39, 0x0

    goto/16 :goto_da

    .line 870
    .end local v24    # "ex":Ljava/security/cert/CertPathValidatorException;
    .end local v29    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    .restart local v4    # "cert":Ljava/security/cert/X509Certificate;
    .restart local v10    # "index":I
    .restart local v26    # "i":I
    :catch_27e
    move-exception v24

    .line 872
    .local v24, "ex":Ljava/security/GeneralSecurityException;
    new-instance v29, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v2, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v3, "CertPathReviewer.signatureNotVerified"

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/16 v43, 0x0

    .line 873
    invoke-virtual/range {v24 .. v24}, Ljava/security/GeneralSecurityException;->getMessage()Ljava/lang/String;

    move-result-object v44

    aput-object v44, v5, v43

    const/16 v43, 0x1

    aput-object v24, v5, v43

    const/16 v43, 0x2

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v44

    invoke-virtual/range {v44 .. v44}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v44

    aput-object v44, v5, v43

    move-object/from16 v0, v29

    invoke-direct {v0, v2, v3, v5}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 874
    .restart local v29    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    move-object/from16 v0, p0

    move-object/from16 v1, v29

    invoke-virtual {v0, v1, v10}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->addError(Lorg/spongycastle/i18n/ErrorBundle;I)V

    goto/16 :goto_104

    .line 877
    .end local v24    # "ex":Ljava/security/GeneralSecurityException;
    .end local v29    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    :cond_2ae
    invoke-static {v4}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->isSelfIssued(Ljava/security/cert/X509Certificate;)Z

    move-result v2

    if-eqz v2, :cond_307

    .line 881
    :try_start_2b4
    invoke-virtual {v4}, Ljava/security/cert/X509Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->pkixParams:Ljava/security/cert/PKIXParameters;

    .line 882
    invoke-virtual {v3}, Ljava/security/cert/PKIXParameters;->getSigProvider()Ljava/lang/String;

    move-result-object v3

    .line 881
    invoke-static {v4, v2, v3}, Lorg/spongycastle/x509/CertPathValidatorUtilities;->verifyX509Certificate(Ljava/security/cert/X509Certificate;Ljava/security/PublicKey;Ljava/lang/String;)V

    .line 883
    new-instance v29, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v2, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v3, "CertPathReviewer.rootKeyIsValidButNotATrustAnchor"

    move-object/from16 v0, v29

    invoke-direct {v0, v2, v3}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 884
    .restart local v29    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    move-object/from16 v0, p0

    move-object/from16 v1, v29

    invoke-virtual {v0, v1, v10}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->addError(Lorg/spongycastle/i18n/ErrorBundle;I)V
    :try_end_2d5
    .catch Ljava/security/GeneralSecurityException; {:try_start_2b4 .. :try_end_2d5} :catch_2d7

    goto/16 :goto_104

    .line 886
    .end local v29    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    :catch_2d7
    move-exception v24

    .line 888
    .restart local v24    # "ex":Ljava/security/GeneralSecurityException;
    new-instance v29, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v2, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v3, "CertPathReviewer.signatureNotVerified"

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/16 v43, 0x0

    .line 889
    invoke-virtual/range {v24 .. v24}, Ljava/security/GeneralSecurityException;->getMessage()Ljava/lang/String;

    move-result-object v44

    aput-object v44, v5, v43

    const/16 v43, 0x1

    aput-object v24, v5, v43

    const/16 v43, 0x2

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v44

    invoke-virtual/range {v44 .. v44}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v44

    aput-object v44, v5, v43

    move-object/from16 v0, v29

    invoke-direct {v0, v2, v3, v5}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 890
    .restart local v29    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    move-object/from16 v0, p0

    move-object/from16 v1, v29

    invoke-virtual {v0, v1, v10}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->addError(Lorg/spongycastle/i18n/ErrorBundle;I)V

    goto/16 :goto_104

    .line 895
    .end local v24    # "ex":Ljava/security/GeneralSecurityException;
    .end local v29    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    :cond_307
    new-instance v29, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v2, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v3, "CertPathReviewer.NoIssuerPublicKey"

    move-object/from16 v0, v29

    invoke-direct {v0, v2, v3}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 897
    .restart local v29    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    sget-object v2, Lorg/spongycastle/asn1/x509/X509Extensions;->AuthorityKeyIdentifier:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Ljava/security/cert/X509Certificate;->getExtensionValue(Ljava/lang/String;)[B

    move-result-object v14

    .line 898
    .local v14, "akiBytes":[B
    if-eqz v14, :cond_376

    .line 903
    :try_start_31e
    invoke-static {v14}, Lorg/spongycastle/x509/extension/X509ExtensionUtil;->fromExtensionValue([B)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v2

    .line 902
    invoke-static {v2}, Lorg/spongycastle/asn1/x509/AuthorityKeyIdentifier;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/AuthorityKeyIdentifier;

    move-result-object v13

    .line 904
    .local v13, "aki":Lorg/spongycastle/asn1/x509/AuthorityKeyIdentifier;
    invoke-virtual {v13}, Lorg/spongycastle/asn1/x509/AuthorityKeyIdentifier;->getAuthorityCertIssuer()Lorg/spongycastle/asn1/x509/GeneralNames;

    move-result-object v27

    .line 905
    .local v27, "issuerNames":Lorg/spongycastle/asn1/x509/GeneralNames;
    if-eqz v27, :cond_376

    .line 907
    invoke-virtual/range {v27 .. v27}, Lorg/spongycastle/asn1/x509/GeneralNames;->getNames()[Lorg/spongycastle/asn1/x509/GeneralName;

    move-result-object v2

    const/4 v3, 0x0

    aget-object v30, v2, v3

    .line 908
    .local v30, "name":Lorg/spongycastle/asn1/x509/GeneralName;
    invoke-virtual {v13}, Lorg/spongycastle/asn1/x509/AuthorityKeyIdentifier;->getAuthorityCertSerialNumber()Ljava/math/BigInteger;

    move-result-object v31

    .line 909
    .local v31, "serial":Ljava/math/BigInteger;
    if-eqz v31, :cond_376

    .line 911
    const/4 v2, 0x7

    new-array v0, v2, [Ljava/lang/Object;

    move-object/from16 v25, v0

    const/4 v2, 0x0

    new-instance v3, Lorg/spongycastle/i18n/LocaleString;

    const-string v5, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v43, "missingIssuer"

    move-object/from16 v0, v43

    invoke-direct {v3, v5, v0}, Lorg/spongycastle/i18n/LocaleString;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    aput-object v3, v25, v2

    const/4 v2, 0x1

    const-string v3, " \""

    aput-object v3, v25, v2

    const/4 v2, 0x2

    aput-object v30, v25, v2

    const/4 v2, 0x3

    const-string v3, "\" "

    aput-object v3, v25, v2

    const/4 v2, 0x4

    new-instance v3, Lorg/spongycastle/i18n/LocaleString;

    const-string v5, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v43, "missingSerial"

    move-object/from16 v0, v43

    invoke-direct {v3, v5, v0}, Lorg/spongycastle/i18n/LocaleString;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    aput-object v3, v25, v2

    const/4 v2, 0x5

    const-string v3, " "

    aput-object v3, v25, v2

    const/4 v2, 0x6

    aput-object v31, v25, v2

    .line 913
    .local v25, "extraArgs":[Ljava/lang/Object;
    move-object/from16 v0, v29

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lorg/spongycastle/i18n/ErrorBundle;->setExtraArguments([Ljava/lang/Object;)V
    :try_end_376
    .catch Ljava/io/IOException; {:try_start_31e .. :try_end_376} :catch_53d

    .line 922
    .end local v13    # "aki":Lorg/spongycastle/asn1/x509/AuthorityKeyIdentifier;
    .end local v25    # "extraArgs":[Ljava/lang/Object;
    .end local v27    # "issuerNames":Lorg/spongycastle/asn1/x509/GeneralNames;
    .end local v30    # "name":Lorg/spongycastle/asn1/x509/GeneralName;
    .end local v31    # "serial":Ljava/math/BigInteger;
    :cond_376
    :goto_376
    move-object/from16 v0, p0

    move-object/from16 v1, v29

    invoke-virtual {v0, v1, v10}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->addError(Lorg/spongycastle/i18n/ErrorBundle;I)V

    goto/16 :goto_104

    .line 930
    .end local v14    # "akiBytes":[B
    .end local v29    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    :catch_37f
    move-exception v19

    .line 932
    .local v19, "cnve":Ljava/security/cert/CertificateNotYetValidException;
    new-instance v29, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v2, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v3, "CertPathReviewer.certificateNotYetValid"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/16 v43, 0x0

    new-instance v44, Lorg/spongycastle/i18n/filter/TrustedInput;

    .line 933
    invoke-virtual {v4}, Ljava/security/cert/X509Certificate;->getNotBefore()Ljava/util/Date;

    move-result-object v45

    invoke-direct/range {v44 .. v45}, Lorg/spongycastle/i18n/filter/TrustedInput;-><init>(Ljava/lang/Object;)V

    aput-object v44, v5, v43

    move-object/from16 v0, v29

    invoke-direct {v0, v2, v3, v5}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 934
    .restart local v29    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    move-object/from16 v0, p0

    move-object/from16 v1, v29

    invoke-virtual {v0, v1, v10}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->addError(Lorg/spongycastle/i18n/ErrorBundle;I)V

    goto/16 :goto_10b

    .line 936
    .end local v19    # "cnve":Ljava/security/cert/CertificateNotYetValidException;
    .end local v29    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    :catch_3a4
    move-exception v18

    .line 938
    .local v18, "cee":Ljava/security/cert/CertificateExpiredException;
    new-instance v29, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v2, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v3, "CertPathReviewer.certificateExpired"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/16 v43, 0x0

    new-instance v44, Lorg/spongycastle/i18n/filter/TrustedInput;

    .line 939
    invoke-virtual {v4}, Ljava/security/cert/X509Certificate;->getNotAfter()Ljava/util/Date;

    move-result-object v45

    invoke-direct/range {v44 .. v45}, Lorg/spongycastle/i18n/filter/TrustedInput;-><init>(Ljava/lang/Object;)V

    aput-object v44, v5, v43

    move-object/from16 v0, v29

    invoke-direct {v0, v2, v3, v5}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 940
    .restart local v29    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    move-object/from16 v0, p0

    move-object/from16 v1, v29

    invoke-virtual {v0, v1, v10}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->addError(Lorg/spongycastle/i18n/ErrorBundle;I)V

    goto/16 :goto_10b

    .line 956
    .end local v18    # "cee":Ljava/security/cert/CertificateExpiredException;
    .end local v29    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    .restart local v21    # "crlDistPoints":Lorg/spongycastle/asn1/x509/CRLDistPoint;
    :catch_3c9
    move-exception v12

    .line 958
    .local v12, "ae":Lorg/spongycastle/jce/provider/AnnotatedException;
    new-instance v29, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v2, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v3, "CertPathReviewer.crlDistPtExtError"

    move-object/from16 v0, v29

    invoke-direct {v0, v2, v3}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 959
    .restart local v29    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    move-object/from16 v0, p0

    move-object/from16 v1, v29

    invoke-virtual {v0, v1, v10}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->addError(Lorg/spongycastle/i18n/ErrorBundle;I)V

    goto/16 :goto_123

    .line 972
    .end local v12    # "ae":Lorg/spongycastle/jce/provider/AnnotatedException;
    .end local v29    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    .restart local v15    # "authInfoAcc":Lorg/spongycastle/asn1/x509/AuthorityInformationAccess;
    :catch_3de
    move-exception v12

    .line 974
    .restart local v12    # "ae":Lorg/spongycastle/jce/provider/AnnotatedException;
    new-instance v29, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v2, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v3, "CertPathReviewer.crlAuthInfoAccError"

    move-object/from16 v0, v29

    invoke-direct {v0, v2, v3}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 975
    .restart local v29    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    move-object/from16 v0, p0

    move-object/from16 v1, v29

    invoke-virtual {v0, v1, v10}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->addError(Lorg/spongycastle/i18n/ErrorBundle;I)V

    goto/16 :goto_130

    .line 993
    .end local v12    # "ae":Lorg/spongycastle/jce/provider/AnnotatedException;
    .end local v29    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    .restart local v8    # "crlDistPointUrls":Ljava/util/Vector;
    .restart local v9    # "ocspUrls":Ljava/util/Vector;
    .restart local v38    # "urlIt":Ljava/util/Iterator;
    :cond_3f3
    invoke-virtual {v9}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v38

    .line 994
    :goto_3f7
    invoke-interface/range {v38 .. v38}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_420

    .line 996
    new-instance v29, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v2, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v3, "CertPathReviewer.ocspLocation"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/16 v43, 0x0

    new-instance v44, Lorg/spongycastle/i18n/filter/UntrustedUrlInput;

    .line 997
    invoke-interface/range {v38 .. v38}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v45

    invoke-direct/range {v44 .. v45}, Lorg/spongycastle/i18n/filter/UntrustedUrlInput;-><init>(Ljava/lang/Object;)V

    aput-object v44, v5, v43

    move-object/from16 v0, v29

    invoke-direct {v0, v2, v3, v5}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 998
    .restart local v29    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    move-object/from16 v0, p0

    move-object/from16 v1, v29

    invoke-virtual {v0, v1, v10}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->addNotification(Lorg/spongycastle/i18n/ErrorBundle;I)V

    goto :goto_3f7

    .line 1005
    .end local v29    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    :cond_420
    :try_start_420
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->pkixParams:Ljava/security/cert/PKIXParameters;

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->validDate:Ljava/util/Date;

    move-object/from16 v2, p0

    invoke-virtual/range {v2 .. v10}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->checkRevocation(Ljava/security/cert/PKIXParameters;Ljava/security/cert/X509Certificate;Ljava/util/Date;Ljava/security/cert/X509Certificate;Ljava/security/PublicKey;Ljava/util/Vector;Ljava/util/Vector;I)V
    :try_end_42d
    .catch Lorg/spongycastle/x509/CertPathReviewerException; {:try_start_420 .. :try_end_42d} :catch_4e5

    .line 1014
    .end local v8    # "crlDistPointUrls":Ljava/util/Vector;
    .end local v9    # "ocspUrls":Ljava/util/Vector;
    .end local v15    # "authInfoAcc":Lorg/spongycastle/asn1/x509/AuthorityInformationAccess;
    .end local v21    # "crlDistPoints":Lorg/spongycastle/asn1/x509/CRLDistPoint;
    .end local v38    # "urlIt":Ljava/util/Iterator;
    :cond_42d
    :goto_42d
    if-eqz v40, :cond_464

    invoke-virtual {v4}, Ljava/security/cert/X509Certificate;->getIssuerX500Principal()Ljavax/security/auth/x500/X500Principal;

    move-result-object v2

    move-object/from16 v0, v40

    invoke-virtual {v2, v0}, Ljavax/security/auth/x500/X500Principal;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_464

    .line 1016
    new-instance v29, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v2, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v3, "CertPathReviewer.certWrongIssuer"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/16 v43, 0x0

    .line 1017
    invoke-virtual/range {v40 .. v40}, Ljavax/security/auth/x500/X500Principal;->getName()Ljava/lang/String;

    move-result-object v44

    aput-object v44, v5, v43

    const/16 v43, 0x1

    .line 1018
    invoke-virtual {v4}, Ljava/security/cert/X509Certificate;->getIssuerX500Principal()Ljavax/security/auth/x500/X500Principal;

    move-result-object v44

    invoke-virtual/range {v44 .. v44}, Ljavax/security/auth/x500/X500Principal;->getName()Ljava/lang/String;

    move-result-object v44

    aput-object v44, v5, v43

    move-object/from16 v0, v29

    invoke-direct {v0, v2, v3, v5}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1019
    .restart local v29    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    move-object/from16 v0, p0

    move-object/from16 v1, v29

    invoke-virtual {v0, v1, v10}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->addError(Lorg/spongycastle/i18n/ErrorBundle;I)V

    .line 1025
    .end local v29    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    :cond_464
    move-object/from16 v0, p0

    iget v2, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->n:I

    move/from16 v0, v26

    if-eq v0, v2, :cond_4c8

    .line 1028
    if-eqz v4, :cond_487

    invoke-virtual {v4}, Ljava/security/cert/X509Certificate;->getVersion()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_487

    .line 1030
    new-instance v29, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v2, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v3, "CertPathReviewer.noCACert"

    move-object/from16 v0, v29

    invoke-direct {v0, v2, v3}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1031
    .restart local v29    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    move-object/from16 v0, p0

    move-object/from16 v1, v29

    invoke-virtual {v0, v1, v10}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->addError(Lorg/spongycastle/i18n/ErrorBundle;I)V

    .line 1039
    .end local v29    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    :cond_487
    :try_start_487
    sget-object v2, Lorg/spongycastle/x509/PKIXCertPathReviewer;->BASIC_CONSTRAINTS:Ljava/lang/String;

    invoke-static {v4, v2}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->getExtensionValue(Ljava/security/cert/X509Extension;Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v2

    invoke-static {v2}, Lorg/spongycastle/asn1/x509/BasicConstraints;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/BasicConstraints;

    move-result-object v17

    .line 1041
    .local v17, "bc":Lorg/spongycastle/asn1/x509/BasicConstraints;
    if-eqz v17, :cond_4f1

    .line 1043
    invoke-virtual/range {v17 .. v17}, Lorg/spongycastle/asn1/x509/BasicConstraints;->isCA()Z

    move-result v2

    if-nez v2, :cond_4ab

    .line 1045
    new-instance v29, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v2, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v3, "CertPathReviewer.noCACert"

    move-object/from16 v0, v29

    invoke-direct {v0, v2, v3}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1046
    .restart local v29    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    move-object/from16 v0, p0

    move-object/from16 v1, v29

    invoke-virtual {v0, v1, v10}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->addError(Lorg/spongycastle/i18n/ErrorBundle;I)V
    :try_end_4ab
    .catch Lorg/spongycastle/jce/provider/AnnotatedException; {:try_start_487 .. :try_end_4ab} :catch_504

    .line 1063
    .end local v17    # "bc":Lorg/spongycastle/asn1/x509/BasicConstraints;
    .end local v29    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    :cond_4ab
    :goto_4ab
    invoke-virtual {v4}, Ljava/security/cert/X509Certificate;->getKeyUsage()[Z

    move-result-object v11

    .line 1065
    .local v11, "_usage":[Z
    if-eqz v11, :cond_4c8

    const/4 v2, 0x5

    aget-boolean v2, v11, v2

    if-nez v2, :cond_4c8

    .line 1067
    new-instance v29, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v2, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v3, "CertPathReviewer.noCertSign"

    move-object/from16 v0, v29

    invoke-direct {v0, v2, v3}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1068
    .restart local v29    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    move-object/from16 v0, p0

    move-object/from16 v1, v29

    invoke-virtual {v0, v1, v10}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->addError(Lorg/spongycastle/i18n/ErrorBundle;I)V

    .line 1074
    .end local v11    # "_usage":[Z
    .end local v29    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    :cond_4c8
    move-object v6, v4

    .line 1078
    invoke-virtual {v4}, Ljava/security/cert/X509Certificate;->getSubjectX500Principal()Ljavax/security/auth/x500/X500Principal;

    move-result-object v40

    .line 1084
    :try_start_4cd
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->certs:Ljava/util/List;

    invoke-static {v2, v10}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->getNextWorkingKey(Ljava/util/List;I)Ljava/security/PublicKey;

    move-result-object v7

    .line 1085
    invoke-static {v7}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->getAlgorithmIdentifier(Ljava/security/PublicKey;)Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    move-result-object v39

    .line 1086
    invoke-virtual/range {v39 .. v39}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->getAlgorithm()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v41

    .line 1087
    invoke-virtual/range {v39 .. v39}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->getParameters()Lorg/spongycastle/asn1/ASN1Encodable;
    :try_end_4e0
    .catch Ljava/security/cert/CertPathValidatorException; {:try_start_4cd .. :try_end_4e0} :catch_518

    move-result-object v42

    .line 847
    :goto_4e1
    add-int/lit8 v10, v10, -0x1

    goto/16 :goto_e5

    .line 1007
    .restart local v8    # "crlDistPointUrls":Ljava/util/Vector;
    .restart local v9    # "ocspUrls":Ljava/util/Vector;
    .restart local v15    # "authInfoAcc":Lorg/spongycastle/asn1/x509/AuthorityInformationAccess;
    .restart local v21    # "crlDistPoints":Lorg/spongycastle/asn1/x509/CRLDistPoint;
    .restart local v38    # "urlIt":Ljava/util/Iterator;
    :catch_4e5
    move-exception v20

    .line 1009
    .restart local v20    # "cpre":Lorg/spongycastle/x509/CertPathReviewerException;
    invoke-virtual/range {v20 .. v20}, Lorg/spongycastle/x509/CertPathReviewerException;->getErrorMessage()Lorg/spongycastle/i18n/ErrorBundle;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v10}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->addError(Lorg/spongycastle/i18n/ErrorBundle;I)V

    goto/16 :goto_42d

    .line 1051
    .end local v8    # "crlDistPointUrls":Ljava/util/Vector;
    .end local v9    # "ocspUrls":Ljava/util/Vector;
    .end local v15    # "authInfoAcc":Lorg/spongycastle/asn1/x509/AuthorityInformationAccess;
    .end local v20    # "cpre":Lorg/spongycastle/x509/CertPathReviewerException;
    .end local v21    # "crlDistPoints":Lorg/spongycastle/asn1/x509/CRLDistPoint;
    .end local v38    # "urlIt":Ljava/util/Iterator;
    .restart local v17    # "bc":Lorg/spongycastle/asn1/x509/BasicConstraints;
    :cond_4f1
    :try_start_4f1
    new-instance v29, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v2, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v3, "CertPathReviewer.noBasicConstraints"

    move-object/from16 v0, v29

    invoke-direct {v0, v2, v3}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1052
    .restart local v29    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    move-object/from16 v0, p0

    move-object/from16 v1, v29

    invoke-virtual {v0, v1, v10}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->addError(Lorg/spongycastle/i18n/ErrorBundle;I)V
    :try_end_503
    .catch Lorg/spongycastle/jce/provider/AnnotatedException; {:try_start_4f1 .. :try_end_503} :catch_504

    goto :goto_4ab

    .line 1055
    .end local v17    # "bc":Lorg/spongycastle/asn1/x509/BasicConstraints;
    .end local v29    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    :catch_504
    move-exception v12

    .line 1057
    .restart local v12    # "ae":Lorg/spongycastle/jce/provider/AnnotatedException;
    new-instance v29, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v2, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v3, "CertPathReviewer.errorProcesingBC"

    move-object/from16 v0, v29

    invoke-direct {v0, v2, v3}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1058
    .restart local v29    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    move-object/from16 v0, p0

    move-object/from16 v1, v29

    invoke-virtual {v0, v1, v10}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->addError(Lorg/spongycastle/i18n/ErrorBundle;I)V

    goto :goto_4ab

    .line 1089
    .end local v12    # "ae":Lorg/spongycastle/jce/provider/AnnotatedException;
    .end local v29    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    :catch_518
    move-exception v24

    .line 1091
    .local v24, "ex":Ljava/security/cert/CertPathValidatorException;
    new-instance v29, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v2, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v3, "CertPathReviewer.pubKeyError"

    move-object/from16 v0, v29

    invoke-direct {v0, v2, v3}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1092
    .restart local v29    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    move-object/from16 v0, p0

    move-object/from16 v1, v29

    invoke-virtual {v0, v1, v10}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->addError(Lorg/spongycastle/i18n/ErrorBundle;I)V

    .line 1093
    const/16 v39, 0x0

    .line 1094
    const/16 v41, 0x0

    .line 1095
    const/16 v42, 0x0

    goto :goto_4e1

    .line 1100
    .end local v24    # "ex":Ljava/security/cert/CertPathValidatorException;
    .end local v26    # "i":I
    .end local v29    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    :cond_532
    move-object/from16 v0, v33

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/spongycastle/x509/PKIXCertPathReviewer;->trustAnchor:Ljava/security/cert/TrustAnchor;

    .line 1101
    move-object/from16 v0, p0

    iput-object v7, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->subjectPublicKey:Ljava/security/PublicKey;

    .line 1102
    return-void

    .line 917
    .restart local v14    # "akiBytes":[B
    .restart local v26    # "i":I
    .restart local v29    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    :catch_53d
    move-exception v2

    goto/16 :goto_376

    .line 751
    .end local v6    # "sign":Ljava/security/cert/X509Certificate;
    .end local v7    # "workingPublicKey":Ljava/security/PublicKey;
    .end local v10    # "index":I
    .end local v14    # "akiBytes":[B
    .end local v26    # "i":I
    .end local v39    # "workingAlgId":Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;
    .end local v40    # "workingIssuerName":Ljavax/security/auth/x500/X500Principal;
    .end local v41    # "workingPublicKeyAlgorithm":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .end local v42    # "workingPublicKeyParameters":Lorg/spongycastle/asn1/ASN1Encodable;
    .restart local v34    # "trustColl":Ljava/util/Collection;
    .restart local v37    # "trustPublicKey":Ljava/security/PublicKey;
    :catch_540
    move-exception v2

    goto/16 :goto_8d
.end method

.method private getCRL(Ljava/lang/String;)Ljava/security/cert/X509CRL;
    .registers 14
    .param p1, "location"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/x509/CertPathReviewerException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 2456
    const/4 v4, 0x0

    .line 2459
    .local v4, "result":Ljava/security/cert/X509CRL;
    :try_start_3
    new-instance v5, Ljava/net/URL;

    invoke-direct {v5, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 2461
    .local v5, "url":Ljava/net/URL;
    invoke-virtual {v5}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v6

    const-string v7, "http"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_20

    invoke-virtual {v5}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v6

    const-string v7, "https"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4b

    .line 2463
    :cond_20
    invoke-virtual {v5}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v1

    check-cast v1, Ljava/net/HttpURLConnection;

    .line 2464
    .local v1, "conn":Ljava/net/HttpURLConnection;
    const/4 v6, 0x0

    invoke-virtual {v1, v6}, Ljava/net/HttpURLConnection;->setUseCaches(Z)V

    .line 2466
    const/4 v6, 0x1

    invoke-virtual {v1, v6}, Ljava/net/HttpURLConnection;->setDoInput(Z)V

    .line 2467
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->connect()V

    .line 2468
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v6

    const/16 v7, 0xc8

    if-ne v6, v7, :cond_4c

    .line 2470
    const-string v6, "X.509"

    const-string v7, "SC"

    invoke-static {v6, v7}, Ljava/security/cert/CertificateFactory;->getInstance(Ljava/lang/String;Ljava/lang/String;)Ljava/security/cert/CertificateFactory;

    move-result-object v0

    .line 2471
    .local v0, "cf":Ljava/security/cert/CertificateFactory;
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/security/cert/CertificateFactory;->generateCRL(Ljava/io/InputStream;)Ljava/security/cert/CRL;

    move-result-object v4

    .end local v4    # "result":Ljava/security/cert/X509CRL;
    check-cast v4, Ljava/security/cert/X509CRL;

    .line 2487
    .end local v0    # "cf":Ljava/security/cert/CertificateFactory;
    .end local v1    # "conn":Ljava/net/HttpURLConnection;
    .restart local v4    # "result":Ljava/security/cert/X509CRL;
    :cond_4b
    return-object v4

    .line 2475
    .restart local v1    # "conn":Ljava/net/HttpURLConnection;
    :cond_4c
    new-instance v6, Ljava/lang/Exception;

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_56
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_56} :catch_56

    .line 2479
    .end local v1    # "conn":Ljava/net/HttpURLConnection;
    .end local v4    # "result":Ljava/security/cert/X509CRL;
    .end local v5    # "url":Ljava/net/URL;
    :catch_56
    move-exception v2

    .line 2481
    .local v2, "e":Ljava/lang/Exception;
    new-instance v3, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v6, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v7, "CertPathReviewer.loadCrlDistPointError"

    const/4 v8, 0x4

    new-array v8, v8, [Ljava/lang/Object;

    new-instance v9, Lorg/spongycastle/i18n/filter/UntrustedInput;

    invoke-direct {v9, p1}, Lorg/spongycastle/i18n/filter/UntrustedInput;-><init>(Ljava/lang/Object;)V

    aput-object v9, v8, v10

    .line 2484
    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v8, v11

    const/4 v9, 0x2

    aput-object v2, v8, v9

    const/4 v9, 0x3

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-direct {v3, v6, v7, v8}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2485
    .local v3, "msg":Lorg/spongycastle/i18n/ErrorBundle;
    new-instance v6, Lorg/spongycastle/x509/CertPathReviewerException;

    invoke-direct {v6, v3}, Lorg/spongycastle/x509/CertPathReviewerException;-><init>(Lorg/spongycastle/i18n/ErrorBundle;)V

    throw v6
.end method

.method private processQcStatements(Ljava/security/cert/X509Certificate;I)Z
    .registers 21
    .param p1, "cert"    # Ljava/security/cert/X509Certificate;
    .param p2, "index"    # I

    .prologue
    .line 1926
    const/4 v9, 0x0

    .line 1928
    .local v9, "unknownStatement":Z
    :try_start_1
    sget-object v12, Lorg/spongycastle/x509/PKIXCertPathReviewer;->QC_STATEMENT:Ljava/lang/String;

    move-object/from16 v0, p1

    invoke-static {v0, v12}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->getExtensionValue(Ljava/security/cert/X509Extension;Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v7

    check-cast v7, Lorg/spongycastle/asn1/ASN1Sequence;

    .line 1929
    .local v7, "qcSt":Lorg/spongycastle/asn1/ASN1Sequence;
    const/4 v4, 0x0

    .local v4, "j":I
    :goto_c
    invoke-virtual {v7}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v12

    if-ge v4, v12, :cond_136

    .line 1931
    invoke-virtual {v7, v4}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v12

    invoke-static {v12}, Lorg/spongycastle/asn1/x509/qualified/QCStatement;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/qualified/QCStatement;

    move-result-object v8

    .line 1932
    .local v8, "stmt":Lorg/spongycastle/asn1/x509/qualified/QCStatement;
    sget-object v12, Lorg/spongycastle/asn1/x509/qualified/QCStatement;->id_etsi_qcs_QcCompliance:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v8}, Lorg/spongycastle/asn1/x509/qualified/QCStatement;->getStatementId()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v13

    invoke-virtual {v12, v13}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_39

    .line 1935
    new-instance v6, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v12, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v13, "CertPathReviewer.QcEuCompliance"

    invoke-direct {v6, v12, v13}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1936
    .local v6, "msg":Lorg/spongycastle/i18n/ErrorBundle;
    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-virtual {v0, v6, v1}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->addNotification(Lorg/spongycastle/i18n/ErrorBundle;I)V

    .line 1929
    .end local v6    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    :cond_36
    :goto_36
    add-int/lit8 v4, v4, 0x1

    goto :goto_c

    .line 1938
    :cond_39
    sget-object v12, Lorg/spongycastle/asn1/x509/qualified/QCStatement;->id_qcs_pkixQCSyntax_v1:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v8}, Lorg/spongycastle/asn1/x509/qualified/QCStatement;->getStatementId()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v13

    invoke-virtual {v12, v13}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_36

    .line 1942
    sget-object v12, Lorg/spongycastle/asn1/x509/qualified/QCStatement;->id_etsi_qcs_QcSSCD:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v8}, Lorg/spongycastle/asn1/x509/qualified/QCStatement;->getStatementId()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v13

    invoke-virtual {v12, v13}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_75

    .line 1945
    new-instance v6, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v12, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v13, "CertPathReviewer.QcSSCD"

    invoke-direct {v6, v12, v13}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1946
    .restart local v6    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-virtual {v0, v6, v1}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->addNotification(Lorg/spongycastle/i18n/ErrorBundle;I)V
    :try_end_61
    .catch Lorg/spongycastle/jce/provider/AnnotatedException; {:try_start_1 .. :try_end_61} :catch_62

    goto :goto_36

    .line 1982
    .end local v4    # "j":I
    .end local v6    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    .end local v7    # "qcSt":Lorg/spongycastle/asn1/ASN1Sequence;
    .end local v8    # "stmt":Lorg/spongycastle/asn1/x509/qualified/QCStatement;
    :catch_62
    move-exception v2

    .line 1984
    .local v2, "ae":Lorg/spongycastle/jce/provider/AnnotatedException;
    new-instance v6, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v12, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v13, "CertPathReviewer.QcStatementExtError"

    invoke-direct {v6, v12, v13}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1985
    .restart local v6    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-virtual {v0, v6, v1}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->addError(Lorg/spongycastle/i18n/ErrorBundle;I)V

    .line 1988
    const/4 v12, 0x0

    .end local v2    # "ae":Lorg/spongycastle/jce/provider/AnnotatedException;
    .end local v6    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    :goto_74
    return v12

    .line 1948
    .restart local v4    # "j":I
    .restart local v7    # "qcSt":Lorg/spongycastle/asn1/ASN1Sequence;
    .restart local v8    # "stmt":Lorg/spongycastle/asn1/x509/qualified/QCStatement;
    :cond_75
    :try_start_75
    sget-object v12, Lorg/spongycastle/asn1/x509/qualified/QCStatement;->id_etsi_qcs_LimiteValue:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v8}, Lorg/spongycastle/asn1/x509/qualified/QCStatement;->getStatementId()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v13

    invoke-virtual {v12, v13}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_10f

    .line 1951
    invoke-virtual {v8}, Lorg/spongycastle/asn1/x509/qualified/QCStatement;->getStatementInfo()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v12

    invoke-static {v12}, Lorg/spongycastle/asn1/x509/qualified/MonetaryValue;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/qualified/MonetaryValue;

    move-result-object v5

    .line 1952
    .local v5, "limit":Lorg/spongycastle/asn1/x509/qualified/MonetaryValue;
    invoke-virtual {v5}, Lorg/spongycastle/asn1/x509/qualified/MonetaryValue;->getCurrency()Lorg/spongycastle/asn1/x509/qualified/Iso4217CurrencyCode;

    move-result-object v3

    .line 1953
    .local v3, "currency":Lorg/spongycastle/asn1/x509/qualified/Iso4217CurrencyCode;
    invoke-virtual {v5}, Lorg/spongycastle/asn1/x509/qualified/MonetaryValue;->getAmount()Ljava/math/BigInteger;

    move-result-object v12

    invoke-virtual {v12}, Ljava/math/BigInteger;->doubleValue()D

    move-result-wide v12

    const-wide/high16 v14, 0x4024000000000000L    # 10.0

    invoke-virtual {v5}, Lorg/spongycastle/asn1/x509/qualified/MonetaryValue;->getExponent()Ljava/math/BigInteger;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/math/BigInteger;->doubleValue()D

    move-result-wide v16

    invoke-static/range {v14 .. v17}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v14

    mul-double v10, v12, v14

    .line 1955
    .local v10, "value":D
    invoke-virtual {v5}, Lorg/spongycastle/asn1/x509/qualified/MonetaryValue;->getCurrency()Lorg/spongycastle/asn1/x509/qualified/Iso4217CurrencyCode;

    move-result-object v12

    invoke-virtual {v12}, Lorg/spongycastle/asn1/x509/qualified/Iso4217CurrencyCode;->isAlphabetic()Z

    move-result v12

    if-eqz v12, :cond_e1

    .line 1957
    new-instance v6, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v12, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v13, "CertPathReviewer.QcLimitValueAlpha"

    const/4 v14, 0x3

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    .line 1958
    invoke-virtual {v5}, Lorg/spongycastle/asn1/x509/qualified/MonetaryValue;->getCurrency()Lorg/spongycastle/asn1/x509/qualified/Iso4217CurrencyCode;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Lorg/spongycastle/asn1/x509/qualified/Iso4217CurrencyCode;->getAlphabetic()Ljava/lang/String;

    move-result-object v16

    aput-object v16, v14, v15

    const/4 v15, 0x1

    new-instance v16, Lorg/spongycastle/i18n/filter/TrustedInput;

    new-instance v17, Ljava/lang/Double;

    move-object/from16 v0, v17

    invoke-direct {v0, v10, v11}, Ljava/lang/Double;-><init>(D)V

    invoke-direct/range {v16 .. v17}, Lorg/spongycastle/i18n/filter/TrustedInput;-><init>(Ljava/lang/Object;)V

    aput-object v16, v14, v15

    const/4 v15, 0x2

    aput-object v5, v14, v15

    invoke-direct {v6, v12, v13, v14}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1969
    .restart local v6    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    :goto_d8
    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-virtual {v0, v6, v1}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->addNotification(Lorg/spongycastle/i18n/ErrorBundle;I)V

    goto/16 :goto_36

    .line 1964
    .end local v6    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    :cond_e1
    new-instance v6, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v12, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v13, "CertPathReviewer.QcLimitValueNum"

    const/4 v14, 0x3

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    .line 1965
    invoke-virtual {v5}, Lorg/spongycastle/asn1/x509/qualified/MonetaryValue;->getCurrency()Lorg/spongycastle/asn1/x509/qualified/Iso4217CurrencyCode;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Lorg/spongycastle/asn1/x509/qualified/Iso4217CurrencyCode;->getNumeric()I

    move-result v16

    invoke-static/range {v16 .. v16}, Lorg/spongycastle/util/Integers;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v14, v15

    const/4 v15, 0x1

    new-instance v16, Lorg/spongycastle/i18n/filter/TrustedInput;

    new-instance v17, Ljava/lang/Double;

    move-object/from16 v0, v17

    invoke-direct {v0, v10, v11}, Ljava/lang/Double;-><init>(D)V

    invoke-direct/range {v16 .. v17}, Lorg/spongycastle/i18n/filter/TrustedInput;-><init>(Ljava/lang/Object;)V

    aput-object v16, v14, v15

    const/4 v15, 0x2

    aput-object v5, v14, v15

    invoke-direct {v6, v12, v13, v14}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .restart local v6    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    goto :goto_d8

    .line 1973
    .end local v3    # "currency":Lorg/spongycastle/asn1/x509/qualified/Iso4217CurrencyCode;
    .end local v5    # "limit":Lorg/spongycastle/asn1/x509/qualified/MonetaryValue;
    .end local v6    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    .end local v10    # "value":D
    :cond_10f
    new-instance v6, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v12, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v13, "CertPathReviewer.QcUnknownStatement"

    const/4 v14, 0x2

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    .line 1974
    invoke-virtual {v8}, Lorg/spongycastle/asn1/x509/qualified/QCStatement;->getStatementId()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v16

    aput-object v16, v14, v15

    const/4 v15, 0x1

    new-instance v16, Lorg/spongycastle/i18n/filter/UntrustedInput;

    move-object/from16 v0, v16

    invoke-direct {v0, v8}, Lorg/spongycastle/i18n/filter/UntrustedInput;-><init>(Ljava/lang/Object;)V

    aput-object v16, v14, v15

    invoke-direct {v6, v12, v13, v14}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1975
    .restart local v6    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-virtual {v0, v6, v1}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->addNotification(Lorg/spongycastle/i18n/ErrorBundle;I)V
    :try_end_133
    .catch Lorg/spongycastle/jce/provider/AnnotatedException; {:try_start_75 .. :try_end_133} :catch_62

    .line 1976
    const/4 v9, 0x1

    goto/16 :goto_36

    .line 1980
    .end local v6    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    .end local v8    # "stmt":Lorg/spongycastle/asn1/x509/qualified/QCStatement;
    :cond_136
    if-nez v9, :cond_13b

    const/4 v12, 0x1

    goto/16 :goto_74

    :cond_13b
    const/4 v12, 0x0

    goto/16 :goto_74
.end method


# virtual methods
.method protected addError(Lorg/spongycastle/i18n/ErrorBundle;)V
    .registers 4
    .param p1, "msg"    # Lorg/spongycastle/i18n/ErrorBundle;

    .prologue
    .line 334
    iget-object v0, p0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->errors:[Ljava/util/List;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 335
    return-void
.end method

.method protected addError(Lorg/spongycastle/i18n/ErrorBundle;I)V
    .registers 5
    .param p1, "msg"    # Lorg/spongycastle/i18n/ErrorBundle;
    .param p2, "index"    # I

    .prologue
    .line 339
    const/4 v0, -0x1

    if-lt p2, v0, :cond_7

    iget v0, p0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->n:I

    if-lt p2, v0, :cond_d

    .line 341
    :cond_7
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 343
    :cond_d
    iget-object v0, p0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->errors:[Ljava/util/List;

    add-int/lit8 v1, p2, 0x1

    aget-object v0, v0, v1

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 344
    return-void
.end method

.method protected addNotification(Lorg/spongycastle/i18n/ErrorBundle;)V
    .registers 4
    .param p1, "msg"    # Lorg/spongycastle/i18n/ErrorBundle;

    .prologue
    .line 320
    iget-object v0, p0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->notifications:[Ljava/util/List;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 321
    return-void
.end method

.method protected addNotification(Lorg/spongycastle/i18n/ErrorBundle;I)V
    .registers 5
    .param p1, "msg"    # Lorg/spongycastle/i18n/ErrorBundle;
    .param p2, "index"    # I

    .prologue
    .line 325
    const/4 v0, -0x1

    if-lt p2, v0, :cond_7

    iget v0, p0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->n:I

    if-lt p2, v0, :cond_d

    .line 327
    :cond_7
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 329
    :cond_d
    iget-object v0, p0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->notifications:[Ljava/util/List;

    add-int/lit8 v1, p2, 0x1

    aget-object v0, v0, v1

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 330
    return-void
.end method

.method protected checkCRLs(Ljava/security/cert/PKIXParameters;Ljava/security/cert/X509Certificate;Ljava/util/Date;Ljava/security/cert/X509Certificate;Ljava/security/PublicKey;Ljava/util/Vector;I)V
    .registers 46
    .param p1, "paramsPKIX"    # Ljava/security/cert/PKIXParameters;
    .param p2, "cert"    # Ljava/security/cert/X509Certificate;
    .param p3, "validDate"    # Ljava/util/Date;
    .param p4, "sign"    # Ljava/security/cert/X509Certificate;
    .param p5, "workingPublicKey"    # Ljava/security/PublicKey;
    .param p6, "crlDistPointUrls"    # Ljava/util/Vector;
    .param p7, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/x509/CertPathReviewerException;
        }
    .end annotation

    .prologue
    .line 2038
    new-instance v14, Lorg/spongycastle/x509/X509CRLStoreSelector;

    invoke-direct {v14}, Lorg/spongycastle/x509/X509CRLStoreSelector;-><init>()V

    .line 2042
    .local v14, "crlselect":Lorg/spongycastle/x509/X509CRLStoreSelector;
    :try_start_5
    invoke-static/range {p2 .. p2}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->getEncodedIssuerPrincipal(Ljava/lang/Object;)Ljavax/security/auth/x500/X500Principal;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljavax/security/auth/x500/X500Principal;->getEncoded()[B

    move-result-object v32

    move-object/from16 v0, v32

    invoke-virtual {v14, v0}, Lorg/spongycastle/x509/X509CRLStoreSelector;->addIssuerName([B)V
    :try_end_12
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_12} :catch_19c

    .line 2050
    move-object/from16 v0, p2

    invoke-virtual {v14, v0}, Lorg/spongycastle/x509/X509CRLStoreSelector;->setCertificateChecking(Ljava/security/cert/X509Certificate;)V

    .line 2055
    :try_start_17
    sget-object v32, Lorg/spongycastle/x509/PKIXCertPathReviewer;->CRL_UTIL:Lorg/spongycastle/x509/PKIXCRLUtil;

    move-object/from16 v0, v32

    move-object/from16 v1, p1

    invoke-virtual {v0, v14, v1}, Lorg/spongycastle/x509/PKIXCRLUtil;->findCRLs(Lorg/spongycastle/x509/X509CRLStoreSelector;Ljava/security/cert/PKIXParameters;)Ljava/util/Set;

    move-result-object v11

    .line 2056
    .local v11, "crl_coll":Ljava/util/Collection;
    invoke-interface {v11}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v13

    .line 2058
    .local v13, "crl_iter":Ljava/util/Iterator;
    invoke-interface {v11}, Ljava/util/Collection;->isEmpty()Z

    move-result v32

    if-eqz v32, :cond_ad

    .line 2061
    sget-object v32, Lorg/spongycastle/x509/PKIXCertPathReviewer;->CRL_UTIL:Lorg/spongycastle/x509/PKIXCRLUtil;

    new-instance v33, Lorg/spongycastle/x509/X509CRLStoreSelector;

    invoke-direct/range {v33 .. v33}, Lorg/spongycastle/x509/X509CRLStoreSelector;-><init>()V

    move-object/from16 v0, v32

    move-object/from16 v1, v33

    move-object/from16 v2, p1

    invoke-virtual {v0, v1, v2}, Lorg/spongycastle/x509/PKIXCRLUtil;->findCRLs(Lorg/spongycastle/x509/X509CRLStoreSelector;Ljava/security/cert/PKIXParameters;)Ljava/util/Set;

    move-result-object v11

    .line 2062
    invoke-interface {v11}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v19

    .line 2063
    .local v19, "it":Ljava/util/Iterator;
    new-instance v24, Ljava/util/ArrayList;

    invoke-direct/range {v24 .. v24}, Ljava/util/ArrayList;-><init>()V

    .line 2064
    .local v24, "nonMatchingCrlNames":Ljava/util/List;
    :goto_45
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->hasNext()Z

    move-result v32

    if-eqz v32, :cond_1b8

    .line 2066
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v32

    check-cast v32, Ljava/security/cert/X509CRL;

    invoke-virtual/range {v32 .. v32}, Ljava/security/cert/X509CRL;->getIssuerX500Principal()Ljavax/security/auth/x500/X500Principal;

    move-result-object v32

    move-object/from16 v0, v24

    move-object/from16 v1, v32

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_5c
    .catch Lorg/spongycastle/jce/provider/AnnotatedException; {:try_start_17 .. :try_end_5c} :catch_5d

    goto :goto_45

    .line 2078
    .end local v11    # "crl_coll":Ljava/util/Collection;
    .end local v13    # "crl_iter":Ljava/util/Iterator;
    .end local v19    # "it":Ljava/util/Iterator;
    .end local v24    # "nonMatchingCrlNames":Ljava/util/List;
    :catch_5d
    move-exception v4

    .line 2080
    .local v4, "ae":Lorg/spongycastle/jce/provider/AnnotatedException;
    new-instance v23, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v32, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v33, "CertPathReviewer.crlExtractionError"

    const/16 v34, 0x3

    move/from16 v0, v34

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v34, v0

    const/16 v35, 0x0

    .line 2081
    invoke-virtual {v4}, Lorg/spongycastle/jce/provider/AnnotatedException;->getCause()Ljava/lang/Throwable;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v36

    aput-object v36, v34, v35

    const/16 v35, 0x1

    invoke-virtual {v4}, Lorg/spongycastle/jce/provider/AnnotatedException;->getCause()Ljava/lang/Throwable;

    move-result-object v36

    aput-object v36, v34, v35

    const/16 v35, 0x2

    invoke-virtual {v4}, Lorg/spongycastle/jce/provider/AnnotatedException;->getCause()Ljava/lang/Throwable;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v36

    aput-object v36, v34, v35

    move-object/from16 v0, v23

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    move-object/from16 v3, v34

    invoke-direct {v0, v1, v2, v3}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2082
    .local v23, "msg":Lorg/spongycastle/i18n/ErrorBundle;
    move-object/from16 v0, p0

    move-object/from16 v1, v23

    move/from16 v2, p7

    invoke-virtual {v0, v1, v2}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->addError(Lorg/spongycastle/i18n/ErrorBundle;I)V

    .line 2083
    new-instance v32, Ljava/util/ArrayList;

    invoke-direct/range {v32 .. v32}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual/range {v32 .. v32}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v13

    .line 2085
    .end local v4    # "ae":Lorg/spongycastle/jce/provider/AnnotatedException;
    .end local v23    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    .restart local v13    # "crl_iter":Ljava/util/Iterator;
    :cond_ad
    :goto_ad
    const/16 v31, 0x0

    .line 2086
    .local v31, "validCrlFound":Z
    const/4 v10, 0x0

    .line 2087
    .local v10, "crl":Ljava/security/cert/X509CRL;
    :goto_b0
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v32

    if-eqz v32, :cond_10e

    .line 2089
    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    .end local v10    # "crl":Ljava/security/cert/X509CRL;
    check-cast v10, Ljava/security/cert/X509CRL;

    .line 2091
    .restart local v10    # "crl":Ljava/security/cert/X509CRL;
    invoke-virtual {v10}, Ljava/security/cert/X509CRL;->getNextUpdate()Ljava/util/Date;

    move-result-object v32

    if-eqz v32, :cond_d0

    .line 2092
    invoke-virtual/range {p1 .. p1}, Ljava/security/cert/PKIXParameters;->getDate()Ljava/util/Date;

    move-result-object v32

    invoke-virtual {v10}, Ljava/security/cert/X509CRL;->getNextUpdate()Ljava/util/Date;

    move-result-object v33

    invoke-virtual/range {v32 .. v33}, Ljava/util/Date;->before(Ljava/util/Date;)Z

    move-result v32

    if-eqz v32, :cond_202

    .line 2094
    :cond_d0
    const/16 v31, 0x1

    .line 2095
    new-instance v23, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v32, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v33, "CertPathReviewer.localValidCRL"

    const/16 v34, 0x2

    move/from16 v0, v34

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v34, v0

    const/16 v35, 0x0

    new-instance v36, Lorg/spongycastle/i18n/filter/TrustedInput;

    .line 2097
    invoke-virtual {v10}, Ljava/security/cert/X509CRL;->getThisUpdate()Ljava/util/Date;

    move-result-object v37

    invoke-direct/range {v36 .. v37}, Lorg/spongycastle/i18n/filter/TrustedInput;-><init>(Ljava/lang/Object;)V

    aput-object v36, v34, v35

    const/16 v35, 0x1

    new-instance v36, Lorg/spongycastle/i18n/filter/TrustedInput;

    invoke-virtual {v10}, Ljava/security/cert/X509CRL;->getNextUpdate()Ljava/util/Date;

    move-result-object v37

    invoke-direct/range {v36 .. v37}, Lorg/spongycastle/i18n/filter/TrustedInput;-><init>(Ljava/lang/Object;)V

    aput-object v36, v34, v35

    move-object/from16 v0, v23

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    move-object/from16 v3, v34

    invoke-direct {v0, v1, v2, v3}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2098
    .restart local v23    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    move-object/from16 v0, p0

    move-object/from16 v1, v23

    move/from16 v2, p7

    invoke-virtual {v0, v1, v2}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->addNotification(Lorg/spongycastle/i18n/ErrorBundle;I)V

    .line 2112
    .end local v23    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    :cond_10e
    if-nez v31, :cond_2a7

    .line 2114
    const/16 v26, 0x0

    .line 2115
    .local v26, "onlineCRL":Ljava/security/cert/X509CRL;
    invoke-virtual/range {p6 .. p6}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v30

    .line 2116
    .local v30, "urlIt":Ljava/util/Iterator;
    :cond_116
    :goto_116
    invoke-interface/range {v30 .. v30}, Ljava/util/Iterator;->hasNext()Z

    move-result v32

    if-eqz v32, :cond_2a7

    .line 2120
    :try_start_11c
    invoke-interface/range {v30 .. v30}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Ljava/lang/String;

    .line 2121
    .local v21, "location":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->getCRL(Ljava/lang/String;)Ljava/security/cert/X509CRL;

    move-result-object v26

    .line 2122
    if-eqz v26, :cond_116

    .line 2125
    invoke-virtual/range {p2 .. p2}, Ljava/security/cert/X509Certificate;->getIssuerX500Principal()Ljavax/security/auth/x500/X500Principal;

    move-result-object v32

    invoke-virtual/range {v26 .. v26}, Ljava/security/cert/X509CRL;->getIssuerX500Principal()Ljavax/security/auth/x500/X500Principal;

    move-result-object v33

    invoke-virtual/range {v32 .. v33}, Ljavax/security/auth/x500/X500Principal;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-nez v32, :cond_240

    .line 2127
    new-instance v23, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v32, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v33, "CertPathReviewer.onlineCRLWrongCA"

    const/16 v34, 0x3

    move/from16 v0, v34

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v34, v0

    const/16 v35, 0x0

    new-instance v36, Lorg/spongycastle/i18n/filter/UntrustedInput;

    .line 2129
    invoke-virtual/range {v26 .. v26}, Ljava/security/cert/X509CRL;->getIssuerX500Principal()Ljavax/security/auth/x500/X500Principal;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljavax/security/auth/x500/X500Principal;->getName()Ljava/lang/String;

    move-result-object v37

    invoke-direct/range {v36 .. v37}, Lorg/spongycastle/i18n/filter/UntrustedInput;-><init>(Ljava/lang/Object;)V

    aput-object v36, v34, v35

    const/16 v35, 0x1

    new-instance v36, Lorg/spongycastle/i18n/filter/UntrustedInput;

    .line 2130
    invoke-virtual/range {p2 .. p2}, Ljava/security/cert/X509Certificate;->getIssuerX500Principal()Ljavax/security/auth/x500/X500Principal;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljavax/security/auth/x500/X500Principal;->getName()Ljava/lang/String;

    move-result-object v37

    invoke-direct/range {v36 .. v37}, Lorg/spongycastle/i18n/filter/UntrustedInput;-><init>(Ljava/lang/Object;)V

    aput-object v36, v34, v35

    const/16 v35, 0x2

    new-instance v36, Lorg/spongycastle/i18n/filter/UntrustedUrlInput;

    move-object/from16 v0, v36

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Lorg/spongycastle/i18n/filter/UntrustedUrlInput;-><init>(Ljava/lang/Object;)V

    aput-object v36, v34, v35

    move-object/from16 v0, v23

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    move-object/from16 v3, v34

    invoke-direct {v0, v1, v2, v3}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2132
    .restart local v23    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    move-object/from16 v0, p0

    move-object/from16 v1, v23

    move/from16 v2, p7

    invoke-virtual {v0, v1, v2}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->addNotification(Lorg/spongycastle/i18n/ErrorBundle;I)V
    :try_end_18b
    .catch Lorg/spongycastle/x509/CertPathReviewerException; {:try_start_11c .. :try_end_18b} :catch_18c

    goto :goto_116

    .line 2160
    .end local v21    # "location":Ljava/lang/String;
    .end local v23    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    :catch_18c
    move-exception v9

    .line 2162
    .local v9, "cpre":Lorg/spongycastle/x509/CertPathReviewerException;
    invoke-virtual {v9}, Lorg/spongycastle/x509/CertPathReviewerException;->getErrorMessage()Lorg/spongycastle/i18n/ErrorBundle;

    move-result-object v32

    move-object/from16 v0, p0

    move-object/from16 v1, v32

    move/from16 v2, p7

    invoke-virtual {v0, v1, v2}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->addNotification(Lorg/spongycastle/i18n/ErrorBundle;I)V

    goto/16 :goto_116

    .line 2044
    .end local v9    # "cpre":Lorg/spongycastle/x509/CertPathReviewerException;
    .end local v10    # "crl":Ljava/security/cert/X509CRL;
    .end local v13    # "crl_iter":Ljava/util/Iterator;
    .end local v26    # "onlineCRL":Ljava/security/cert/X509CRL;
    .end local v30    # "urlIt":Ljava/util/Iterator;
    .end local v31    # "validCrlFound":Z
    :catch_19c
    move-exception v16

    .line 2046
    .local v16, "e":Ljava/io/IOException;
    new-instance v23, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v32, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v33, "CertPathReviewer.crlIssuerException"

    move-object/from16 v0, v23

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 2047
    .restart local v23    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    new-instance v32, Lorg/spongycastle/x509/CertPathReviewerException;

    move-object/from16 v0, v32

    move-object/from16 v1, v23

    move-object/from16 v2, v16

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/x509/CertPathReviewerException;-><init>(Lorg/spongycastle/i18n/ErrorBundle;Ljava/lang/Throwable;)V

    throw v32

    .line 2068
    .end local v16    # "e":Ljava/io/IOException;
    .end local v23    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    .restart local v11    # "crl_coll":Ljava/util/Collection;
    .restart local v13    # "crl_iter":Ljava/util/Iterator;
    .restart local v19    # "it":Ljava/util/Iterator;
    .restart local v24    # "nonMatchingCrlNames":Ljava/util/List;
    :cond_1b8
    :try_start_1b8
    invoke-interface/range {v24 .. v24}, Ljava/util/List;->size()I

    move-result v25

    .line 2069
    .local v25, "numbOfCrls":I
    new-instance v23, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v32, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v33, "CertPathReviewer.noCrlInCertstore"

    const/16 v34, 0x3

    move/from16 v0, v34

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v34, v0

    const/16 v35, 0x0

    new-instance v36, Lorg/spongycastle/i18n/filter/UntrustedInput;

    .line 2071
    invoke-virtual {v14}, Lorg/spongycastle/x509/X509CRLStoreSelector;->getIssuerNames()Ljava/util/Collection;

    move-result-object v37

    invoke-direct/range {v36 .. v37}, Lorg/spongycastle/i18n/filter/UntrustedInput;-><init>(Ljava/lang/Object;)V

    aput-object v36, v34, v35

    const/16 v35, 0x1

    new-instance v36, Lorg/spongycastle/i18n/filter/UntrustedInput;

    move-object/from16 v0, v36

    move-object/from16 v1, v24

    invoke-direct {v0, v1}, Lorg/spongycastle/i18n/filter/UntrustedInput;-><init>(Ljava/lang/Object;)V

    aput-object v36, v34, v35

    const/16 v35, 0x2

    .line 2073
    invoke-static/range {v25 .. v25}, Lorg/spongycastle/util/Integers;->valueOf(I)Ljava/lang/Integer;

    move-result-object v36

    aput-object v36, v34, v35

    move-object/from16 v0, v23

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    move-object/from16 v3, v34

    invoke-direct {v0, v1, v2, v3}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2074
    .restart local v23    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    move-object/from16 v0, p0

    move-object/from16 v1, v23

    move/from16 v2, p7

    invoke-virtual {v0, v1, v2}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->addNotification(Lorg/spongycastle/i18n/ErrorBundle;I)V
    :try_end_200
    .catch Lorg/spongycastle/jce/provider/AnnotatedException; {:try_start_1b8 .. :try_end_200} :catch_5d

    goto/16 :goto_ad

    .line 2103
    .end local v11    # "crl_coll":Ljava/util/Collection;
    .end local v19    # "it":Ljava/util/Iterator;
    .end local v23    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    .end local v24    # "nonMatchingCrlNames":Ljava/util/List;
    .end local v25    # "numbOfCrls":I
    .restart local v10    # "crl":Ljava/security/cert/X509CRL;
    .restart local v31    # "validCrlFound":Z
    :cond_202
    new-instance v23, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v32, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v33, "CertPathReviewer.localInvalidCRL"

    const/16 v34, 0x2

    move/from16 v0, v34

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v34, v0

    const/16 v35, 0x0

    new-instance v36, Lorg/spongycastle/i18n/filter/TrustedInput;

    .line 2105
    invoke-virtual {v10}, Ljava/security/cert/X509CRL;->getThisUpdate()Ljava/util/Date;

    move-result-object v37

    invoke-direct/range {v36 .. v37}, Lorg/spongycastle/i18n/filter/TrustedInput;-><init>(Ljava/lang/Object;)V

    aput-object v36, v34, v35

    const/16 v35, 0x1

    new-instance v36, Lorg/spongycastle/i18n/filter/TrustedInput;

    invoke-virtual {v10}, Ljava/security/cert/X509CRL;->getNextUpdate()Ljava/util/Date;

    move-result-object v37

    invoke-direct/range {v36 .. v37}, Lorg/spongycastle/i18n/filter/TrustedInput;-><init>(Ljava/lang/Object;)V

    aput-object v36, v34, v35

    move-object/from16 v0, v23

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    move-object/from16 v3, v34

    invoke-direct {v0, v1, v2, v3}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2106
    .restart local v23    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    move-object/from16 v0, p0

    move-object/from16 v1, v23

    move/from16 v2, p7

    invoke-virtual {v0, v1, v2}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->addNotification(Lorg/spongycastle/i18n/ErrorBundle;I)V

    goto/16 :goto_b0

    .line 2136
    .end local v23    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    .restart local v21    # "location":Ljava/lang/String;
    .restart local v26    # "onlineCRL":Ljava/security/cert/X509CRL;
    .restart local v30    # "urlIt":Ljava/util/Iterator;
    :cond_240
    :try_start_240
    invoke-virtual/range {v26 .. v26}, Ljava/security/cert/X509CRL;->getNextUpdate()Ljava/util/Date;

    move-result-object v32

    if-eqz v32, :cond_25a

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->pkixParams:Ljava/security/cert/PKIXParameters;

    move-object/from16 v32, v0

    .line 2137
    invoke-virtual/range {v32 .. v32}, Ljava/security/cert/PKIXParameters;->getDate()Ljava/util/Date;

    move-result-object v32

    invoke-virtual/range {v26 .. v26}, Ljava/security/cert/X509CRL;->getNextUpdate()Ljava/util/Date;

    move-result-object v33

    invoke-virtual/range {v32 .. v33}, Ljava/util/Date;->before(Ljava/util/Date;)Z

    move-result v32

    if-eqz v32, :cond_2dd

    .line 2139
    :cond_25a
    const/16 v31, 0x1

    .line 2140
    new-instance v23, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v32, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v33, "CertPathReviewer.onlineValidCRL"

    const/16 v34, 0x3

    move/from16 v0, v34

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v34, v0

    const/16 v35, 0x0

    new-instance v36, Lorg/spongycastle/i18n/filter/TrustedInput;

    .line 2142
    invoke-virtual/range {v26 .. v26}, Ljava/security/cert/X509CRL;->getThisUpdate()Ljava/util/Date;

    move-result-object v37

    invoke-direct/range {v36 .. v37}, Lorg/spongycastle/i18n/filter/TrustedInput;-><init>(Ljava/lang/Object;)V

    aput-object v36, v34, v35

    const/16 v35, 0x1

    new-instance v36, Lorg/spongycastle/i18n/filter/TrustedInput;

    .line 2143
    invoke-virtual/range {v26 .. v26}, Ljava/security/cert/X509CRL;->getNextUpdate()Ljava/util/Date;

    move-result-object v37

    invoke-direct/range {v36 .. v37}, Lorg/spongycastle/i18n/filter/TrustedInput;-><init>(Ljava/lang/Object;)V

    aput-object v36, v34, v35

    const/16 v35, 0x2

    new-instance v36, Lorg/spongycastle/i18n/filter/UntrustedUrlInput;

    move-object/from16 v0, v36

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Lorg/spongycastle/i18n/filter/UntrustedUrlInput;-><init>(Ljava/lang/Object;)V

    aput-object v36, v34, v35

    move-object/from16 v0, v23

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    move-object/from16 v3, v34

    invoke-direct {v0, v1, v2, v3}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2145
    .restart local v23    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    move-object/from16 v0, p0

    move-object/from16 v1, v23

    move/from16 v2, p7

    invoke-virtual {v0, v1, v2}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->addNotification(Lorg/spongycastle/i18n/ErrorBundle;I)V
    :try_end_2a5
    .catch Lorg/spongycastle/x509/CertPathReviewerException; {:try_start_240 .. :try_end_2a5} :catch_18c

    .line 2146
    move-object/from16 v10, v26

    .line 2169
    .end local v21    # "location":Ljava/lang/String;
    .end local v23    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    .end local v26    # "onlineCRL":Ljava/security/cert/X509CRL;
    .end local v30    # "urlIt":Ljava/util/Iterator;
    :cond_2a7
    if-eqz v10, :cond_678

    .line 2171
    if-eqz p4, :cond_328

    .line 2173
    invoke-virtual/range {p4 .. p4}, Ljava/security/cert/X509Certificate;->getKeyUsage()[Z

    move-result-object v20

    .line 2175
    .local v20, "keyusage":[Z
    if-eqz v20, :cond_328

    move-object/from16 v0, v20

    array-length v0, v0

    move/from16 v32, v0

    const/16 v33, 0x7

    move/from16 v0, v32

    move/from16 v1, v33

    if-lt v0, v1, :cond_2c4

    const/16 v32, 0x6

    aget-boolean v32, v20, v32

    if-nez v32, :cond_328

    .line 2178
    :cond_2c4
    new-instance v23, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v32, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v33, "CertPathReviewer.noCrlSigningPermited"

    move-object/from16 v0, v23

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 2179
    .restart local v23    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    new-instance v32, Lorg/spongycastle/x509/CertPathReviewerException;

    move-object/from16 v0, v32

    move-object/from16 v1, v23

    invoke-direct {v0, v1}, Lorg/spongycastle/x509/CertPathReviewerException;-><init>(Lorg/spongycastle/i18n/ErrorBundle;)V

    throw v32

    .line 2151
    .end local v20    # "keyusage":[Z
    .end local v23    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    .restart local v21    # "location":Ljava/lang/String;
    .restart local v26    # "onlineCRL":Ljava/security/cert/X509CRL;
    .restart local v30    # "urlIt":Ljava/util/Iterator;
    :cond_2dd
    :try_start_2dd
    new-instance v23, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v32, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v33, "CertPathReviewer.onlineInvalidCRL"

    const/16 v34, 0x3

    move/from16 v0, v34

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v34, v0

    const/16 v35, 0x0

    new-instance v36, Lorg/spongycastle/i18n/filter/TrustedInput;

    .line 2153
    invoke-virtual/range {v26 .. v26}, Ljava/security/cert/X509CRL;->getThisUpdate()Ljava/util/Date;

    move-result-object v37

    invoke-direct/range {v36 .. v37}, Lorg/spongycastle/i18n/filter/TrustedInput;-><init>(Ljava/lang/Object;)V

    aput-object v36, v34, v35

    const/16 v35, 0x1

    new-instance v36, Lorg/spongycastle/i18n/filter/TrustedInput;

    .line 2154
    invoke-virtual/range {v26 .. v26}, Ljava/security/cert/X509CRL;->getNextUpdate()Ljava/util/Date;

    move-result-object v37

    invoke-direct/range {v36 .. v37}, Lorg/spongycastle/i18n/filter/TrustedInput;-><init>(Ljava/lang/Object;)V

    aput-object v36, v34, v35

    const/16 v35, 0x2

    new-instance v36, Lorg/spongycastle/i18n/filter/UntrustedUrlInput;

    move-object/from16 v0, v36

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Lorg/spongycastle/i18n/filter/UntrustedUrlInput;-><init>(Ljava/lang/Object;)V

    aput-object v36, v34, v35

    move-object/from16 v0, v23

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    move-object/from16 v3, v34

    invoke-direct {v0, v1, v2, v3}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2156
    .restart local v23    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    move-object/from16 v0, p0

    move-object/from16 v1, v23

    move/from16 v2, p7

    invoke-virtual {v0, v1, v2}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->addNotification(Lorg/spongycastle/i18n/ErrorBundle;I)V
    :try_end_326
    .catch Lorg/spongycastle/x509/CertPathReviewerException; {:try_start_2dd .. :try_end_326} :catch_18c

    goto/16 :goto_116

    .line 2183
    .end local v21    # "location":Ljava/lang/String;
    .end local v23    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    .end local v26    # "onlineCRL":Ljava/security/cert/X509CRL;
    .end local v30    # "urlIt":Ljava/util/Iterator;
    :cond_328
    if-eqz p5, :cond_3d8

    .line 2187
    :try_start_32a
    const-string v32, "SC"

    move-object/from16 v0, p5

    move-object/from16 v1, v32

    invoke-virtual {v10, v0, v1}, Ljava/security/cert/X509CRL;->verify(Ljava/security/PublicKey;Ljava/lang/String;)V
    :try_end_333
    .catch Ljava/lang/Exception; {:try_start_32a .. :try_end_333} :catch_3bc

    .line 2201
    invoke-virtual/range {p2 .. p2}, Ljava/security/cert/X509Certificate;->getSerialNumber()Ljava/math/BigInteger;

    move-result-object v32

    move-object/from16 v0, v32

    invoke-virtual {v10, v0}, Ljava/security/cert/X509CRL;->getRevokedCertificate(Ljava/math/BigInteger;)Ljava/security/cert/X509CRLEntry;

    move-result-object v12

    .line 2202
    .local v12, "crl_entry":Ljava/security/cert/X509CRLEntry;
    if-eqz v12, :cond_518

    .line 2204
    const/16 v28, 0x0

    .line 2206
    .local v28, "reason":Ljava/lang/String;
    invoke-virtual {v12}, Ljava/security/cert/X509CRLEntry;->hasExtensions()Z

    move-result v32

    if-eqz v32, :cond_365

    .line 2211
    :try_start_347
    sget-object v32, Lorg/spongycastle/asn1/x509/X509Extensions;->ReasonCode:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual/range {v32 .. v32}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v32

    move-object/from16 v0, v32

    invoke-static {v12, v0}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->getExtensionValue(Ljava/security/cert/X509Extension;Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v32

    invoke-static/range {v32 .. v32}, Lorg/spongycastle/asn1/ASN1Enumerated;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Enumerated;
    :try_end_356
    .catch Lorg/spongycastle/jce/provider/AnnotatedException; {:try_start_347 .. :try_end_356} :catch_3f1

    move-result-object v29

    .line 2218
    .local v29, "reasonCode":Lorg/spongycastle/asn1/ASN1Enumerated;
    if-eqz v29, :cond_365

    .line 2220
    sget-object v32, Lorg/spongycastle/x509/PKIXCertPathReviewer;->crlReasons:[Ljava/lang/String;

    invoke-virtual/range {v29 .. v29}, Lorg/spongycastle/asn1/ASN1Enumerated;->getValue()Ljava/math/BigInteger;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/math/BigInteger;->intValue()I

    move-result v33

    aget-object v28, v32, v33

    .line 2224
    .end local v29    # "reasonCode":Lorg/spongycastle/asn1/ASN1Enumerated;
    :cond_365
    if-nez v28, :cond_36d

    .line 2226
    sget-object v32, Lorg/spongycastle/x509/PKIXCertPathReviewer;->crlReasons:[Ljava/lang/String;

    const/16 v33, 0x7

    aget-object v28, v32, v33

    .line 2230
    :cond_36d
    new-instance v22, Lorg/spongycastle/i18n/LocaleString;

    const-string v32, "org.spongycastle.x509.CertPathReviewerMessages"

    move-object/from16 v0, v22

    move-object/from16 v1, v32

    move-object/from16 v2, v28

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/i18n/LocaleString;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 2232
    .local v22, "ls":Lorg/spongycastle/i18n/LocaleString;
    invoke-virtual {v12}, Ljava/security/cert/X509CRLEntry;->getRevocationDate()Ljava/util/Date;

    move-result-object v32

    move-object/from16 v0, p3

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/util/Date;->before(Ljava/util/Date;)Z

    move-result v32

    if-nez v32, :cond_40b

    .line 2234
    new-instance v23, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v32, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v33, "CertPathReviewer.certRevoked"

    const/16 v34, 0x2

    move/from16 v0, v34

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v34, v0

    const/16 v35, 0x0

    new-instance v36, Lorg/spongycastle/i18n/filter/TrustedInput;

    .line 2235
    invoke-virtual {v12}, Ljava/security/cert/X509CRLEntry;->getRevocationDate()Ljava/util/Date;

    move-result-object v37

    invoke-direct/range {v36 .. v37}, Lorg/spongycastle/i18n/filter/TrustedInput;-><init>(Ljava/lang/Object;)V

    aput-object v36, v34, v35

    const/16 v35, 0x1

    aput-object v22, v34, v35

    move-object/from16 v0, v23

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    move-object/from16 v3, v34

    invoke-direct {v0, v1, v2, v3}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2236
    .restart local v23    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    new-instance v32, Lorg/spongycastle/x509/CertPathReviewerException;

    move-object/from16 v0, v32

    move-object/from16 v1, v23

    invoke-direct {v0, v1}, Lorg/spongycastle/x509/CertPathReviewerException;-><init>(Lorg/spongycastle/i18n/ErrorBundle;)V

    throw v32

    .line 2189
    .end local v12    # "crl_entry":Ljava/security/cert/X509CRLEntry;
    .end local v22    # "ls":Lorg/spongycastle/i18n/LocaleString;
    .end local v23    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    .end local v28    # "reason":Ljava/lang/String;
    :catch_3bc
    move-exception v16

    .line 2191
    .local v16, "e":Ljava/lang/Exception;
    new-instance v23, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v32, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v33, "CertPathReviewer.crlVerifyFailed"

    move-object/from16 v0, v23

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 2192
    .restart local v23    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    new-instance v32, Lorg/spongycastle/x509/CertPathReviewerException;

    move-object/from16 v0, v32

    move-object/from16 v1, v23

    move-object/from16 v2, v16

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/x509/CertPathReviewerException;-><init>(Lorg/spongycastle/i18n/ErrorBundle;Ljava/lang/Throwable;)V

    throw v32

    .line 2197
    .end local v16    # "e":Ljava/lang/Exception;
    .end local v23    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    :cond_3d8
    new-instance v23, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v32, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v33, "CertPathReviewer.crlNoIssuerPublicKey"

    move-object/from16 v0, v23

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 2198
    .restart local v23    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    new-instance v32, Lorg/spongycastle/x509/CertPathReviewerException;

    move-object/from16 v0, v32

    move-object/from16 v1, v23

    invoke-direct {v0, v1}, Lorg/spongycastle/x509/CertPathReviewerException;-><init>(Lorg/spongycastle/i18n/ErrorBundle;)V

    throw v32

    .line 2213
    .end local v23    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    .restart local v12    # "crl_entry":Ljava/security/cert/X509CRLEntry;
    .restart local v28    # "reason":Ljava/lang/String;
    :catch_3f1
    move-exception v4

    .line 2215
    .restart local v4    # "ae":Lorg/spongycastle/jce/provider/AnnotatedException;
    new-instance v23, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v32, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v33, "CertPathReviewer.crlReasonExtError"

    move-object/from16 v0, v23

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 2216
    .restart local v23    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    new-instance v32, Lorg/spongycastle/x509/CertPathReviewerException;

    move-object/from16 v0, v32

    move-object/from16 v1, v23

    invoke-direct {v0, v1, v4}, Lorg/spongycastle/x509/CertPathReviewerException;-><init>(Lorg/spongycastle/i18n/ErrorBundle;Ljava/lang/Throwable;)V

    throw v32

    .line 2240
    .end local v4    # "ae":Lorg/spongycastle/jce/provider/AnnotatedException;
    .end local v23    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    .restart local v22    # "ls":Lorg/spongycastle/i18n/LocaleString;
    :cond_40b
    new-instance v23, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v32, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v33, "CertPathReviewer.revokedAfterValidation"

    const/16 v34, 0x2

    move/from16 v0, v34

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v34, v0

    const/16 v35, 0x0

    new-instance v36, Lorg/spongycastle/i18n/filter/TrustedInput;

    .line 2241
    invoke-virtual {v12}, Ljava/security/cert/X509CRLEntry;->getRevocationDate()Ljava/util/Date;

    move-result-object v37

    invoke-direct/range {v36 .. v37}, Lorg/spongycastle/i18n/filter/TrustedInput;-><init>(Ljava/lang/Object;)V

    aput-object v36, v34, v35

    const/16 v35, 0x1

    aput-object v22, v34, v35

    move-object/from16 v0, v23

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    move-object/from16 v3, v34

    invoke-direct {v0, v1, v2, v3}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2242
    .restart local v23    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    move-object/from16 v0, p0

    move-object/from16 v1, v23

    move/from16 v2, p7

    invoke-virtual {v0, v1, v2}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->addNotification(Lorg/spongycastle/i18n/ErrorBundle;I)V

    .line 2254
    .end local v22    # "ls":Lorg/spongycastle/i18n/LocaleString;
    .end local v28    # "reason":Ljava/lang/String;
    :goto_43e
    invoke-virtual {v10}, Ljava/security/cert/X509CRL;->getNextUpdate()Ljava/util/Date;

    move-result-object v32

    if-eqz v32, :cond_487

    invoke-virtual {v10}, Ljava/security/cert/X509CRL;->getNextUpdate()Ljava/util/Date;

    move-result-object v32

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->pkixParams:Ljava/security/cert/PKIXParameters;

    move-object/from16 v33, v0

    invoke-virtual/range {v33 .. v33}, Ljava/security/cert/PKIXParameters;->getDate()Ljava/util/Date;

    move-result-object v33

    invoke-virtual/range {v32 .. v33}, Ljava/util/Date;->before(Ljava/util/Date;)Z

    move-result v32

    if-eqz v32, :cond_487

    .line 2256
    new-instance v23, Lorg/spongycastle/i18n/ErrorBundle;

    .end local v23    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    const-string v32, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v33, "CertPathReviewer.crlUpdateAvailable"

    const/16 v34, 0x1

    move/from16 v0, v34

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v34, v0

    const/16 v35, 0x0

    new-instance v36, Lorg/spongycastle/i18n/filter/TrustedInput;

    .line 2257
    invoke-virtual {v10}, Ljava/security/cert/X509CRL;->getNextUpdate()Ljava/util/Date;

    move-result-object v37

    invoke-direct/range {v36 .. v37}, Lorg/spongycastle/i18n/filter/TrustedInput;-><init>(Ljava/lang/Object;)V

    aput-object v36, v34, v35

    move-object/from16 v0, v23

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    move-object/from16 v3, v34

    invoke-direct {v0, v1, v2, v3}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2258
    .restart local v23    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    move-object/from16 v0, p0

    move-object/from16 v1, v23

    move/from16 v2, p7

    invoke-virtual {v0, v1, v2}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->addNotification(Lorg/spongycastle/i18n/ErrorBundle;I)V

    .line 2267
    :cond_487
    :try_start_487
    sget-object v32, Lorg/spongycastle/x509/PKIXCertPathReviewer;->ISSUING_DISTRIBUTION_POINT:Ljava/lang/String;

    move-object/from16 v0, v32

    invoke-static {v10, v0}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->getExtensionValue(Ljava/security/cert/X509Extension;Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1Primitive;
    :try_end_48e
    .catch Lorg/spongycastle/jce/provider/AnnotatedException; {:try_start_487 .. :try_end_48e} :catch_532

    move-result-object v18

    .line 2277
    .local v18, "idp":Lorg/spongycastle/asn1/ASN1Primitive;
    :try_start_48f
    sget-object v32, Lorg/spongycastle/x509/PKIXCertPathReviewer;->DELTA_CRL_INDICATOR:Ljava/lang/String;

    move-object/from16 v0, v32

    invoke-static {v10, v0}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->getExtensionValue(Ljava/security/cert/X509Extension;Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1Primitive;
    :try_end_496
    .catch Lorg/spongycastle/jce/provider/AnnotatedException; {:try_start_48f .. :try_end_496} :catch_54c

    move-result-object v15

    .line 2285
    .local v15, "dci":Lorg/spongycastle/asn1/ASN1Primitive;
    if-eqz v15, :cond_5dc

    .line 2287
    new-instance v7, Lorg/spongycastle/x509/X509CRLStoreSelector;

    invoke-direct {v7}, Lorg/spongycastle/x509/X509CRLStoreSelector;-><init>()V

    .line 2291
    .local v7, "baseSelect":Lorg/spongycastle/x509/X509CRLStoreSelector;
    :try_start_49e
    invoke-static {v10}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->getIssuerPrincipal(Ljava/security/cert/X509CRL;)Ljavax/security/auth/x500/X500Principal;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljavax/security/auth/x500/X500Principal;->getEncoded()[B

    move-result-object v32

    move-object/from16 v0, v32

    invoke-virtual {v7, v0}, Lorg/spongycastle/x509/X509CRLStoreSelector;->addIssuerName([B)V
    :try_end_4ab
    .catch Ljava/io/IOException; {:try_start_49e .. :try_end_4ab} :catch_566

    .line 2299
    check-cast v15, Lorg/spongycastle/asn1/ASN1Integer;

    .end local v15    # "dci":Lorg/spongycastle/asn1/ASN1Primitive;
    invoke-virtual {v15}, Lorg/spongycastle/asn1/ASN1Integer;->getPositiveValue()Ljava/math/BigInteger;

    move-result-object v32

    move-object/from16 v0, v32

    invoke-virtual {v7, v0}, Lorg/spongycastle/x509/X509CRLStoreSelector;->setMinCRLNumber(Ljava/math/BigInteger;)V

    .line 2302
    :try_start_4b6
    sget-object v32, Lorg/spongycastle/x509/PKIXCertPathReviewer;->CRL_NUMBER:Ljava/lang/String;

    move-object/from16 v0, v32

    invoke-static {v10, v0}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->getExtensionValue(Ljava/security/cert/X509Extension;Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v32

    check-cast v32, Lorg/spongycastle/asn1/ASN1Integer;

    invoke-virtual/range {v32 .. v32}, Lorg/spongycastle/asn1/ASN1Integer;->getPositiveValue()Ljava/math/BigInteger;

    move-result-object v32

    const-wide/16 v33, 0x1

    invoke-static/range {v33 .. v34}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v33

    invoke-virtual/range {v32 .. v33}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v32

    move-object/from16 v0, v32

    invoke-virtual {v7, v0}, Lorg/spongycastle/x509/X509CRLStoreSelector;->setMaxCRLNumber(Ljava/math/BigInteger;)V
    :try_end_4d3
    .catch Lorg/spongycastle/jce/provider/AnnotatedException; {:try_start_4b6 .. :try_end_4d3} :catch_582

    .line 2310
    const/16 v17, 0x0

    .line 2314
    .local v17, "foundBase":Z
    :try_start_4d5
    sget-object v32, Lorg/spongycastle/x509/PKIXCertPathReviewer;->CRL_UTIL:Lorg/spongycastle/x509/PKIXCRLUtil;

    move-object/from16 v0, v32

    move-object/from16 v1, p1

    invoke-virtual {v0, v7, v1}, Lorg/spongycastle/x509/PKIXCRLUtil;->findCRLs(Lorg/spongycastle/x509/X509CRLStoreSelector;Ljava/security/cert/PKIXParameters;)Ljava/util/Set;

    move-result-object v32

    invoke-interface/range {v32 .. v32}, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    :try_end_4e2
    .catch Lorg/spongycastle/jce/provider/AnnotatedException; {:try_start_4d5 .. :try_end_4e2} :catch_59c

    move-result-object v19

    .line 2321
    .restart local v19    # "it":Ljava/util/Iterator;
    :cond_4e3
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->hasNext()Z

    move-result v32

    if-eqz v32, :cond_4fd

    .line 2323
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/security/cert/X509CRL;

    .line 2328
    .local v5, "base":Ljava/security/cert/X509CRL;
    :try_start_4ef
    sget-object v32, Lorg/spongycastle/x509/PKIXCertPathReviewer;->ISSUING_DISTRIBUTION_POINT:Ljava/lang/String;

    move-object/from16 v0, v32

    invoke-static {v5, v0}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->getExtensionValue(Ljava/security/cert/X509Extension;Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1Primitive;
    :try_end_4f6
    .catch Lorg/spongycastle/jce/provider/AnnotatedException; {:try_start_4ef .. :try_end_4f6} :catch_5b6

    move-result-object v6

    .line 2336
    .local v6, "baseIdp":Lorg/spongycastle/asn1/ASN1Primitive;
    if-nez v18, :cond_5d0

    .line 2338
    if-nez v6, :cond_4e3

    .line 2340
    const/16 v17, 0x1

    .line 2354
    .end local v5    # "base":Ljava/security/cert/X509CRL;
    .end local v6    # "baseIdp":Lorg/spongycastle/asn1/ASN1Primitive;
    :cond_4fd
    :goto_4fd
    if-nez v17, :cond_5dc

    .line 2356
    new-instance v23, Lorg/spongycastle/i18n/ErrorBundle;

    .end local v23    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    const-string v32, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v33, "CertPathReviewer.noBaseCRL"

    move-object/from16 v0, v23

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 2357
    .restart local v23    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    new-instance v32, Lorg/spongycastle/x509/CertPathReviewerException;

    move-object/from16 v0, v32

    move-object/from16 v1, v23

    invoke-direct {v0, v1}, Lorg/spongycastle/x509/CertPathReviewerException;-><init>(Lorg/spongycastle/i18n/ErrorBundle;)V

    throw v32

    .line 2247
    .end local v7    # "baseSelect":Lorg/spongycastle/x509/X509CRLStoreSelector;
    .end local v17    # "foundBase":Z
    .end local v18    # "idp":Lorg/spongycastle/asn1/ASN1Primitive;
    .end local v19    # "it":Ljava/util/Iterator;
    .end local v23    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    :cond_518
    new-instance v23, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v32, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v33, "CertPathReviewer.notRevoked"

    move-object/from16 v0, v23

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 2248
    .restart local v23    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    move-object/from16 v0, p0

    move-object/from16 v1, v23

    move/from16 v2, p7

    invoke-virtual {v0, v1, v2}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->addNotification(Lorg/spongycastle/i18n/ErrorBundle;I)V

    goto/16 :goto_43e

    .line 2269
    :catch_532
    move-exception v4

    .line 2271
    .restart local v4    # "ae":Lorg/spongycastle/jce/provider/AnnotatedException;
    new-instance v23, Lorg/spongycastle/i18n/ErrorBundle;

    .end local v23    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    const-string v32, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v33, "CertPathReviewer.distrPtExtError"

    move-object/from16 v0, v23

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 2272
    .restart local v23    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    new-instance v32, Lorg/spongycastle/x509/CertPathReviewerException;

    move-object/from16 v0, v32

    move-object/from16 v1, v23

    invoke-direct {v0, v1}, Lorg/spongycastle/x509/CertPathReviewerException;-><init>(Lorg/spongycastle/i18n/ErrorBundle;)V

    throw v32

    .line 2279
    .end local v4    # "ae":Lorg/spongycastle/jce/provider/AnnotatedException;
    .restart local v18    # "idp":Lorg/spongycastle/asn1/ASN1Primitive;
    :catch_54c
    move-exception v4

    .line 2281
    .restart local v4    # "ae":Lorg/spongycastle/jce/provider/AnnotatedException;
    new-instance v23, Lorg/spongycastle/i18n/ErrorBundle;

    .end local v23    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    const-string v32, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v33, "CertPathReviewer.deltaCrlExtError"

    move-object/from16 v0, v23

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 2282
    .restart local v23    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    new-instance v32, Lorg/spongycastle/x509/CertPathReviewerException;

    move-object/from16 v0, v32

    move-object/from16 v1, v23

    invoke-direct {v0, v1}, Lorg/spongycastle/x509/CertPathReviewerException;-><init>(Lorg/spongycastle/i18n/ErrorBundle;)V

    throw v32

    .line 2293
    .end local v4    # "ae":Lorg/spongycastle/jce/provider/AnnotatedException;
    .restart local v7    # "baseSelect":Lorg/spongycastle/x509/X509CRLStoreSelector;
    .restart local v15    # "dci":Lorg/spongycastle/asn1/ASN1Primitive;
    :catch_566
    move-exception v16

    .line 2295
    .local v16, "e":Ljava/io/IOException;
    new-instance v23, Lorg/spongycastle/i18n/ErrorBundle;

    .end local v23    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    const-string v32, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v33, "CertPathReviewer.crlIssuerException"

    move-object/from16 v0, v23

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 2296
    .restart local v23    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    new-instance v32, Lorg/spongycastle/x509/CertPathReviewerException;

    move-object/from16 v0, v32

    move-object/from16 v1, v23

    move-object/from16 v2, v16

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/x509/CertPathReviewerException;-><init>(Lorg/spongycastle/i18n/ErrorBundle;Ljava/lang/Throwable;)V

    throw v32

    .line 2304
    .end local v15    # "dci":Lorg/spongycastle/asn1/ASN1Primitive;
    .end local v16    # "e":Ljava/io/IOException;
    :catch_582
    move-exception v4

    .line 2306
    .restart local v4    # "ae":Lorg/spongycastle/jce/provider/AnnotatedException;
    new-instance v23, Lorg/spongycastle/i18n/ErrorBundle;

    .end local v23    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    const-string v32, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v33, "CertPathReviewer.crlNbrExtError"

    move-object/from16 v0, v23

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 2307
    .restart local v23    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    new-instance v32, Lorg/spongycastle/x509/CertPathReviewerException;

    move-object/from16 v0, v32

    move-object/from16 v1, v23

    invoke-direct {v0, v1, v4}, Lorg/spongycastle/x509/CertPathReviewerException;-><init>(Lorg/spongycastle/i18n/ErrorBundle;Ljava/lang/Throwable;)V

    throw v32

    .line 2316
    .end local v4    # "ae":Lorg/spongycastle/jce/provider/AnnotatedException;
    .restart local v17    # "foundBase":Z
    :catch_59c
    move-exception v4

    .line 2318
    .restart local v4    # "ae":Lorg/spongycastle/jce/provider/AnnotatedException;
    new-instance v23, Lorg/spongycastle/i18n/ErrorBundle;

    .end local v23    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    const-string v32, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v33, "CertPathReviewer.crlExtractionError"

    move-object/from16 v0, v23

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 2319
    .restart local v23    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    new-instance v32, Lorg/spongycastle/x509/CertPathReviewerException;

    move-object/from16 v0, v32

    move-object/from16 v1, v23

    invoke-direct {v0, v1, v4}, Lorg/spongycastle/x509/CertPathReviewerException;-><init>(Lorg/spongycastle/i18n/ErrorBundle;Ljava/lang/Throwable;)V

    throw v32

    .line 2330
    .end local v4    # "ae":Lorg/spongycastle/jce/provider/AnnotatedException;
    .restart local v5    # "base":Ljava/security/cert/X509CRL;
    .restart local v19    # "it":Ljava/util/Iterator;
    :catch_5b6
    move-exception v4

    .line 2332
    .restart local v4    # "ae":Lorg/spongycastle/jce/provider/AnnotatedException;
    new-instance v23, Lorg/spongycastle/i18n/ErrorBundle;

    .end local v23    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    const-string v32, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v33, "CertPathReviewer.distrPtExtError"

    move-object/from16 v0, v23

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 2333
    .restart local v23    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    new-instance v32, Lorg/spongycastle/x509/CertPathReviewerException;

    move-object/from16 v0, v32

    move-object/from16 v1, v23

    invoke-direct {v0, v1, v4}, Lorg/spongycastle/x509/CertPathReviewerException;-><init>(Lorg/spongycastle/i18n/ErrorBundle;Ljava/lang/Throwable;)V

    throw v32

    .line 2346
    .end local v4    # "ae":Lorg/spongycastle/jce/provider/AnnotatedException;
    .restart local v6    # "baseIdp":Lorg/spongycastle/asn1/ASN1Primitive;
    :cond_5d0
    move-object/from16 v0, v18

    invoke-virtual {v0, v6}, Lorg/spongycastle/asn1/ASN1Primitive;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_4e3

    .line 2348
    const/16 v17, 0x1

    .line 2349
    goto/16 :goto_4fd

    .line 2361
    .end local v5    # "base":Ljava/security/cert/X509CRL;
    .end local v6    # "baseIdp":Lorg/spongycastle/asn1/ASN1Primitive;
    .end local v7    # "baseSelect":Lorg/spongycastle/x509/X509CRLStoreSelector;
    .end local v17    # "foundBase":Z
    .end local v19    # "it":Ljava/util/Iterator;
    :cond_5dc
    if-eqz v18, :cond_678

    .line 2363
    invoke-static/range {v18 .. v18}, Lorg/spongycastle/asn1/x509/IssuingDistributionPoint;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/IssuingDistributionPoint;

    move-result-object v27

    .line 2364
    .local v27, "p":Lorg/spongycastle/asn1/x509/IssuingDistributionPoint;
    const/4 v8, 0x0

    .line 2367
    .local v8, "bc":Lorg/spongycastle/asn1/x509/BasicConstraints;
    :try_start_5e3
    sget-object v32, Lorg/spongycastle/x509/PKIXCertPathReviewer;->BASIC_CONSTRAINTS:Ljava/lang/String;

    move-object/from16 v0, p2

    move-object/from16 v1, v32

    invoke-static {v0, v1}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->getExtensionValue(Ljava/security/cert/X509Extension;Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v32

    invoke-static/range {v32 .. v32}, Lorg/spongycastle/asn1/x509/BasicConstraints;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/BasicConstraints;
    :try_end_5f0
    .catch Lorg/spongycastle/jce/provider/AnnotatedException; {:try_start_5e3 .. :try_end_5f0} :catch_618

    move-result-object v8

    .line 2375
    invoke-virtual/range {v27 .. v27}, Lorg/spongycastle/asn1/x509/IssuingDistributionPoint;->onlyContainsUserCerts()Z

    move-result v32

    if-eqz v32, :cond_632

    if-eqz v8, :cond_632

    invoke-virtual {v8}, Lorg/spongycastle/asn1/x509/BasicConstraints;->isCA()Z

    move-result v32

    if-eqz v32, :cond_632

    .line 2377
    new-instance v23, Lorg/spongycastle/i18n/ErrorBundle;

    .end local v23    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    const-string v32, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v33, "CertPathReviewer.crlOnlyUserCert"

    move-object/from16 v0, v23

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 2378
    .restart local v23    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    new-instance v32, Lorg/spongycastle/x509/CertPathReviewerException;

    move-object/from16 v0, v32

    move-object/from16 v1, v23

    invoke-direct {v0, v1}, Lorg/spongycastle/x509/CertPathReviewerException;-><init>(Lorg/spongycastle/i18n/ErrorBundle;)V

    throw v32

    .line 2369
    :catch_618
    move-exception v4

    .line 2371
    .restart local v4    # "ae":Lorg/spongycastle/jce/provider/AnnotatedException;
    new-instance v23, Lorg/spongycastle/i18n/ErrorBundle;

    .end local v23    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    const-string v32, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v33, "CertPathReviewer.crlBCExtError"

    move-object/from16 v0, v23

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 2372
    .restart local v23    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    new-instance v32, Lorg/spongycastle/x509/CertPathReviewerException;

    move-object/from16 v0, v32

    move-object/from16 v1, v23

    invoke-direct {v0, v1, v4}, Lorg/spongycastle/x509/CertPathReviewerException;-><init>(Lorg/spongycastle/i18n/ErrorBundle;Ljava/lang/Throwable;)V

    throw v32

    .line 2381
    .end local v4    # "ae":Lorg/spongycastle/jce/provider/AnnotatedException;
    :cond_632
    invoke-virtual/range {v27 .. v27}, Lorg/spongycastle/asn1/x509/IssuingDistributionPoint;->onlyContainsCACerts()Z

    move-result v32

    if-eqz v32, :cond_659

    if-eqz v8, :cond_640

    invoke-virtual {v8}, Lorg/spongycastle/asn1/x509/BasicConstraints;->isCA()Z

    move-result v32

    if-nez v32, :cond_659

    .line 2383
    :cond_640
    new-instance v23, Lorg/spongycastle/i18n/ErrorBundle;

    .end local v23    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    const-string v32, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v33, "CertPathReviewer.crlOnlyCaCert"

    move-object/from16 v0, v23

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 2384
    .restart local v23    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    new-instance v32, Lorg/spongycastle/x509/CertPathReviewerException;

    move-object/from16 v0, v32

    move-object/from16 v1, v23

    invoke-direct {v0, v1}, Lorg/spongycastle/x509/CertPathReviewerException;-><init>(Lorg/spongycastle/i18n/ErrorBundle;)V

    throw v32

    .line 2387
    :cond_659
    invoke-virtual/range {v27 .. v27}, Lorg/spongycastle/asn1/x509/IssuingDistributionPoint;->onlyContainsAttributeCerts()Z

    move-result v32

    if-eqz v32, :cond_678

    .line 2389
    new-instance v23, Lorg/spongycastle/i18n/ErrorBundle;

    .end local v23    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    const-string v32, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v33, "CertPathReviewer.crlOnlyAttrCert"

    move-object/from16 v0, v23

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 2390
    .restart local v23    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    new-instance v32, Lorg/spongycastle/x509/CertPathReviewerException;

    move-object/from16 v0, v32

    move-object/from16 v1, v23

    invoke-direct {v0, v1}, Lorg/spongycastle/x509/CertPathReviewerException;-><init>(Lorg/spongycastle/i18n/ErrorBundle;)V

    throw v32

    .line 2395
    .end local v8    # "bc":Lorg/spongycastle/asn1/x509/BasicConstraints;
    .end local v12    # "crl_entry":Ljava/security/cert/X509CRLEntry;
    .end local v18    # "idp":Lorg/spongycastle/asn1/ASN1Primitive;
    .end local v23    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    .end local v27    # "p":Lorg/spongycastle/asn1/x509/IssuingDistributionPoint;
    :cond_678
    if-nez v31, :cond_693

    .line 2397
    new-instance v23, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v32, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v33, "CertPathReviewer.noValidCrlFound"

    move-object/from16 v0, v23

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 2398
    .restart local v23    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    new-instance v32, Lorg/spongycastle/x509/CertPathReviewerException;

    move-object/from16 v0, v32

    move-object/from16 v1, v23

    invoke-direct {v0, v1}, Lorg/spongycastle/x509/CertPathReviewerException;-><init>(Lorg/spongycastle/i18n/ErrorBundle;)V

    throw v32

    .line 2401
    .end local v23    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    :cond_693
    return-void
.end method

.method protected checkRevocation(Ljava/security/cert/PKIXParameters;Ljava/security/cert/X509Certificate;Ljava/util/Date;Ljava/security/cert/X509Certificate;Ljava/security/PublicKey;Ljava/util/Vector;Ljava/util/Vector;I)V
    .registers 17
    .param p1, "paramsPKIX"    # Ljava/security/cert/PKIXParameters;
    .param p2, "cert"    # Ljava/security/cert/X509Certificate;
    .param p3, "validDate"    # Ljava/util/Date;
    .param p4, "sign"    # Ljava/security/cert/X509Certificate;
    .param p5, "workingPublicKey"    # Ljava/security/PublicKey;
    .param p6, "crlDistPointUrls"    # Ljava/util/Vector;
    .param p7, "ocspUrls"    # Ljava/util/Vector;
    .param p8, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/x509/CertPathReviewerException;
        }
    .end annotation

    .prologue
    .line 2024
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    move/from16 v7, p8

    invoke-virtual/range {v0 .. v7}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->checkCRLs(Ljava/security/cert/PKIXParameters;Ljava/security/cert/X509Certificate;Ljava/util/Date;Ljava/security/cert/X509Certificate;Ljava/security/PublicKey;Ljava/util/Vector;I)V

    .line 2025
    return-void
.end method

.method protected doChecks()V
    .registers 4

    .prologue
    .line 348
    iget-boolean v1, p0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->initialized:Z

    if-nez v1, :cond_c

    .line 350
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Object not initialized. Call init() first."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 352
    :cond_c
    iget-object v1, p0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->notifications:[Ljava/util/List;

    if-nez v1, :cond_4a

    .line 355
    iget v1, p0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->n:I

    add-int/lit8 v1, v1, 0x1

    new-array v1, v1, [Ljava/util/List;

    iput-object v1, p0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->notifications:[Ljava/util/List;

    .line 356
    iget v1, p0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->n:I

    add-int/lit8 v1, v1, 0x1

    new-array v1, v1, [Ljava/util/List;

    iput-object v1, p0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->errors:[Ljava/util/List;

    .line 358
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_21
    iget-object v1, p0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->notifications:[Ljava/util/List;

    array-length v1, v1

    if-ge v0, v1, :cond_3b

    .line 360
    iget-object v1, p0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->notifications:[Ljava/util/List;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    aput-object v2, v1, v0

    .line 361
    iget-object v1, p0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->errors:[Ljava/util/List;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    aput-object v2, v1, v0

    .line 358
    add-int/lit8 v0, v0, 0x1

    goto :goto_21

    .line 365
    :cond_3b
    invoke-direct {p0}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->checkSignatures()V

    .line 368
    invoke-direct {p0}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->checkNameConstraints()V

    .line 371
    invoke-direct {p0}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->checkPathLength()V

    .line 374
    invoke-direct {p0}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->checkPolicy()V

    .line 377
    invoke-direct {p0}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->checkCriticalExtensions()V

    .line 380
    .end local v0    # "i":I
    :cond_4a
    return-void
.end method

.method protected getCRLDistUrls(Lorg/spongycastle/asn1/x509/CRLDistPoint;)Ljava/util/Vector;
    .registers 11
    .param p1, "crlDistPoints"    # Lorg/spongycastle/asn1/x509/CRLDistPoint;

    .prologue
    .line 2405
    new-instance v6, Ljava/util/Vector;

    invoke-direct {v6}, Ljava/util/Vector;-><init>()V

    .line 2407
    .local v6, "urls":Ljava/util/Vector;
    if-eqz p1, :cond_49

    .line 2409
    invoke-virtual {p1}, Lorg/spongycastle/asn1/x509/CRLDistPoint;->getDistributionPoints()[Lorg/spongycastle/asn1/x509/DistributionPoint;

    move-result-object v0

    .line 2410
    .local v0, "distPoints":[Lorg/spongycastle/asn1/x509/DistributionPoint;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_c
    array-length v7, v0

    if-ge v3, v7, :cond_49

    .line 2412
    aget-object v7, v0, v3

    invoke-virtual {v7}, Lorg/spongycastle/asn1/x509/DistributionPoint;->getDistributionPoint()Lorg/spongycastle/asn1/x509/DistributionPointName;

    move-result-object v1

    .line 2413
    .local v1, "dp_name":Lorg/spongycastle/asn1/x509/DistributionPointName;
    invoke-virtual {v1}, Lorg/spongycastle/asn1/x509/DistributionPointName;->getType()I

    move-result v7

    if-nez v7, :cond_46

    .line 2415
    invoke-virtual {v1}, Lorg/spongycastle/asn1/x509/DistributionPointName;->getName()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v7

    invoke-static {v7}, Lorg/spongycastle/asn1/x509/GeneralNames;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/GeneralNames;

    move-result-object v7

    invoke-virtual {v7}, Lorg/spongycastle/asn1/x509/GeneralNames;->getNames()[Lorg/spongycastle/asn1/x509/GeneralName;

    move-result-object v2

    .line 2416
    .local v2, "generalNames":[Lorg/spongycastle/asn1/x509/GeneralName;
    const/4 v4, 0x0

    .local v4, "j":I
    :goto_28
    array-length v7, v2

    if-ge v4, v7, :cond_46

    .line 2418
    aget-object v7, v2, v4

    invoke-virtual {v7}, Lorg/spongycastle/asn1/x509/GeneralName;->getTagNo()I

    move-result v7

    const/4 v8, 0x6

    if-ne v7, v8, :cond_43

    .line 2420
    aget-object v7, v2, v4

    invoke-virtual {v7}, Lorg/spongycastle/asn1/x509/GeneralName;->getName()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v7

    check-cast v7, Lorg/spongycastle/asn1/DERIA5String;

    invoke-virtual {v7}, Lorg/spongycastle/asn1/DERIA5String;->getString()Ljava/lang/String;

    move-result-object v5

    .line 2421
    .local v5, "url":Ljava/lang/String;
    invoke-virtual {v6, v5}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 2416
    .end local v5    # "url":Ljava/lang/String;
    :cond_43
    add-int/lit8 v4, v4, 0x1

    goto :goto_28

    .line 2410
    .end local v2    # "generalNames":[Lorg/spongycastle/asn1/x509/GeneralName;
    .end local v4    # "j":I
    :cond_46
    add-int/lit8 v3, v3, 0x1

    goto :goto_c

    .line 2427
    .end local v0    # "distPoints":[Lorg/spongycastle/asn1/x509/DistributionPoint;
    .end local v1    # "dp_name":Lorg/spongycastle/asn1/x509/DistributionPointName;
    .end local v3    # "i":I
    :cond_49
    return-object v6
.end method

.method public getCertPath()Ljava/security/cert/CertPath;
    .registers 2

    .prologue
    .line 199
    iget-object v0, p0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->certPath:Ljava/security/cert/CertPath;

    return-object v0
.end method

.method public getCertPathSize()I
    .registers 2

    .prologue
    .line 208
    iget v0, p0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->n:I

    return v0
.end method

.method public getErrors(I)Ljava/util/List;
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 234
    invoke-virtual {p0}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->doChecks()V

    .line 235
    iget-object v0, p0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->errors:[Ljava/util/List;

    add-int/lit8 v1, p1, 0x1

    aget-object v0, v0, v1

    return-object v0
.end method

.method public getErrors()[Ljava/util/List;
    .registers 2

    .prologue
    .line 221
    invoke-virtual {p0}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->doChecks()V

    .line 222
    iget-object v0, p0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->errors:[Ljava/util/List;

    return-object v0
.end method

.method public getNotifications(I)Ljava/util/List;
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 261
    invoke-virtual {p0}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->doChecks()V

    .line 262
    iget-object v0, p0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->notifications:[Ljava/util/List;

    add-int/lit8 v1, p1, 0x1

    aget-object v0, v0, v1

    return-object v0
.end method

.method public getNotifications()[Ljava/util/List;
    .registers 2

    .prologue
    .line 248
    invoke-virtual {p0}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->doChecks()V

    .line 249
    iget-object v0, p0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->notifications:[Ljava/util/List;

    return-object v0
.end method

.method protected getOCSPUrls(Lorg/spongycastle/asn1/x509/AuthorityInformationAccess;)Ljava/util/Vector;
    .registers 9
    .param p1, "authInfoAccess"    # Lorg/spongycastle/asn1/x509/AuthorityInformationAccess;

    .prologue
    .line 2432
    new-instance v4, Ljava/util/Vector;

    invoke-direct {v4}, Ljava/util/Vector;-><init>()V

    .line 2434
    .local v4, "urls":Ljava/util/Vector;
    if-eqz p1, :cond_3a

    .line 2436
    invoke-virtual {p1}, Lorg/spongycastle/asn1/x509/AuthorityInformationAccess;->getAccessDescriptions()[Lorg/spongycastle/asn1/x509/AccessDescription;

    move-result-object v0

    .line 2437
    .local v0, "ads":[Lorg/spongycastle/asn1/x509/AccessDescription;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_c
    array-length v5, v0

    if-ge v1, v5, :cond_3a

    .line 2439
    aget-object v5, v0, v1

    invoke-virtual {v5}, Lorg/spongycastle/asn1/x509/AccessDescription;->getAccessMethod()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v5

    sget-object v6, Lorg/spongycastle/asn1/x509/AccessDescription;->id_ad_ocsp:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v5, v6}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_37

    .line 2441
    aget-object v5, v0, v1

    invoke-virtual {v5}, Lorg/spongycastle/asn1/x509/AccessDescription;->getAccessLocation()Lorg/spongycastle/asn1/x509/GeneralName;

    move-result-object v2

    .line 2442
    .local v2, "name":Lorg/spongycastle/asn1/x509/GeneralName;
    invoke-virtual {v2}, Lorg/spongycastle/asn1/x509/GeneralName;->getTagNo()I

    move-result v5

    const/4 v6, 0x6

    if-ne v5, v6, :cond_37

    .line 2444
    invoke-virtual {v2}, Lorg/spongycastle/asn1/x509/GeneralName;->getName()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v5

    check-cast v5, Lorg/spongycastle/asn1/DERIA5String;

    invoke-virtual {v5}, Lorg/spongycastle/asn1/DERIA5String;->getString()Ljava/lang/String;

    move-result-object v3

    .line 2445
    .local v3, "url":Ljava/lang/String;
    invoke-virtual {v4, v3}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 2437
    .end local v2    # "name":Lorg/spongycastle/asn1/x509/GeneralName;
    .end local v3    # "url":Ljava/lang/String;
    :cond_37
    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    .line 2451
    .end local v0    # "ads":[Lorg/spongycastle/asn1/x509/AccessDescription;
    .end local v1    # "i":I
    :cond_3a
    return-object v4
.end method

.method public getPolicyTree()Ljava/security/cert/PolicyNode;
    .registers 2

    .prologue
    .line 272
    invoke-virtual {p0}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->doChecks()V

    .line 273
    iget-object v0, p0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->policyTree:Ljava/security/cert/PolicyNode;

    return-object v0
.end method

.method public getSubjectPublicKey()Ljava/security/PublicKey;
    .registers 2

    .prologue
    .line 283
    invoke-virtual {p0}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->doChecks()V

    .line 284
    iget-object v0, p0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->subjectPublicKey:Ljava/security/PublicKey;

    return-object v0
.end method

.method public getTrustAnchor()Ljava/security/cert/TrustAnchor;
    .registers 2

    .prologue
    .line 294
    invoke-virtual {p0}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->doChecks()V

    .line 295
    iget-object v0, p0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->trustAnchor:Ljava/security/cert/TrustAnchor;

    return-object v0
.end method

.method protected getTrustAnchors(Ljava/security/cert/X509Certificate;Ljava/util/Set;)Ljava/util/Collection;
    .registers 17
    .param p1, "cert"    # Ljava/security/cert/X509Certificate;
    .param p2, "trustanchors"    # Ljava/util/Set;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/x509/CertPathReviewerException;
        }
    .end annotation

    .prologue
    .line 2492
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 2493
    .local v11, "trustColl":Ljava/util/Collection;
    invoke-interface/range {p2 .. p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .line 2495
    .local v6, "it":Ljava/util/Iterator;
    new-instance v3, Ljava/security/cert/X509CertSelector;

    invoke-direct {v3}, Ljava/security/cert/X509CertSelector;-><init>()V

    .line 2499
    .local v3, "certSelectX509":Ljava/security/cert/X509CertSelector;
    :try_start_e
    invoke-static {p1}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->getEncodedIssuerPrincipal(Ljava/lang/Object;)Ljavax/security/auth/x500/X500Principal;

    move-result-object v12

    invoke-virtual {v12}, Ljavax/security/auth/x500/X500Principal;->getEncoded()[B

    move-result-object v12

    invoke-virtual {v3, v12}, Ljava/security/cert/X509CertSelector;->setSubject([B)V

    .line 2500
    sget-object v12, Lorg/spongycastle/asn1/x509/X509Extensions;->AuthorityKeyIdentifier:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v12}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {p1, v12}, Ljava/security/cert/X509Certificate;->getExtensionValue(Ljava/lang/String;)[B

    move-result-object v5

    .line 2502
    .local v5, "ext":[B
    if-eqz v5, :cond_50

    .line 2504
    invoke-static {v5}, Lorg/spongycastle/asn1/ASN1Primitive;->fromByteArray([B)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v9

    check-cast v9, Lorg/spongycastle/asn1/ASN1OctetString;

    .line 2505
    .local v9, "oct":Lorg/spongycastle/asn1/ASN1OctetString;
    invoke-virtual {v9}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v12

    invoke-static {v12}, Lorg/spongycastle/asn1/ASN1Primitive;->fromByteArray([B)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v12

    invoke-static {v12}, Lorg/spongycastle/asn1/x509/AuthorityKeyIdentifier;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/AuthorityKeyIdentifier;

    move-result-object v0

    .line 2507
    .local v0, "authID":Lorg/spongycastle/asn1/x509/AuthorityKeyIdentifier;
    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/AuthorityKeyIdentifier;->getAuthorityCertSerialNumber()Ljava/math/BigInteger;

    move-result-object v12

    invoke-virtual {v3, v12}, Ljava/security/cert/X509CertSelector;->setSerialNumber(Ljava/math/BigInteger;)V

    .line 2508
    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/AuthorityKeyIdentifier;->getKeyIdentifier()[B

    move-result-object v7

    .line 2509
    .local v7, "keyID":[B
    if-eqz v7, :cond_50

    .line 2511
    new-instance v12, Lorg/spongycastle/asn1/DEROctetString;

    invoke-direct {v12, v7}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    invoke-virtual {v12}, Lorg/spongycastle/asn1/DEROctetString;->getEncoded()[B

    move-result-object v12

    invoke-virtual {v3, v12}, Ljava/security/cert/X509CertSelector;->setSubjectKeyIdentifier([B)V
    :try_end_50
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_50} :catch_70

    .line 2521
    .end local v0    # "authID":Lorg/spongycastle/asn1/x509/AuthorityKeyIdentifier;
    .end local v7    # "keyID":[B
    .end local v9    # "oct":Lorg/spongycastle/asn1/ASN1OctetString;
    :cond_50
    :goto_50
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_a3

    .line 2523
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/security/cert/TrustAnchor;

    .line 2524
    .local v10, "trust":Ljava/security/cert/TrustAnchor;
    invoke-virtual {v10}, Ljava/security/cert/TrustAnchor;->getTrustedCert()Ljava/security/cert/X509Certificate;

    move-result-object v12

    if-eqz v12, :cond_80

    .line 2526
    invoke-virtual {v10}, Ljava/security/cert/TrustAnchor;->getTrustedCert()Ljava/security/cert/X509Certificate;

    move-result-object v12

    invoke-virtual {v3, v12}, Ljava/security/cert/X509CertSelector;->match(Ljava/security/cert/Certificate;)Z

    move-result v12

    if-eqz v12, :cond_50

    .line 2528
    invoke-interface {v11, v10}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_50

    .line 2515
    .end local v5    # "ext":[B
    .end local v10    # "trust":Ljava/security/cert/TrustAnchor;
    :catch_70
    move-exception v4

    .line 2517
    .local v4, "ex":Ljava/io/IOException;
    new-instance v8, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v12, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v13, "CertPathReviewer.trustAnchorIssuerError"

    invoke-direct {v8, v12, v13}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 2518
    .local v8, "msg":Lorg/spongycastle/i18n/ErrorBundle;
    new-instance v12, Lorg/spongycastle/x509/CertPathReviewerException;

    invoke-direct {v12, v8}, Lorg/spongycastle/x509/CertPathReviewerException;-><init>(Lorg/spongycastle/i18n/ErrorBundle;)V

    throw v12

    .line 2531
    .end local v4    # "ex":Ljava/io/IOException;
    .end local v8    # "msg":Lorg/spongycastle/i18n/ErrorBundle;
    .restart local v5    # "ext":[B
    .restart local v10    # "trust":Ljava/security/cert/TrustAnchor;
    :cond_80
    invoke-virtual {v10}, Ljava/security/cert/TrustAnchor;->getCAName()Ljava/lang/String;

    move-result-object v12

    if-eqz v12, :cond_50

    invoke-virtual {v10}, Ljava/security/cert/TrustAnchor;->getCAPublicKey()Ljava/security/PublicKey;

    move-result-object v12

    if-eqz v12, :cond_50

    .line 2533
    invoke-static {p1}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->getEncodedIssuerPrincipal(Ljava/lang/Object;)Ljavax/security/auth/x500/X500Principal;

    move-result-object v2

    .line 2534
    .local v2, "certIssuer":Ljavax/security/auth/x500/X500Principal;
    new-instance v1, Ljavax/security/auth/x500/X500Principal;

    invoke-virtual {v10}, Ljava/security/cert/TrustAnchor;->getCAName()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v1, v12}, Ljavax/security/auth/x500/X500Principal;-><init>(Ljava/lang/String;)V

    .line 2535
    .local v1, "caName":Ljavax/security/auth/x500/X500Principal;
    invoke-virtual {v2, v1}, Ljavax/security/auth/x500/X500Principal;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_50

    .line 2537
    invoke-interface {v11, v10}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_50

    .line 2541
    .end local v1    # "caName":Ljavax/security/auth/x500/X500Principal;
    .end local v2    # "certIssuer":Ljavax/security/auth/x500/X500Principal;
    .end local v10    # "trust":Ljava/security/cert/TrustAnchor;
    :cond_a3
    return-object v11
.end method

.method public init(Ljava/security/cert/CertPath;Ljava/security/cert/PKIXParameters;)V
    .registers 7
    .param p1, "certPath"    # Ljava/security/cert/CertPath;
    .param p2, "params"    # Ljava/security/cert/PKIXParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/x509/CertPathReviewerException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 127
    iget-boolean v0, p0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->initialized:Z

    if-eqz v0, :cond_d

    .line 129
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "object is already initialized!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 131
    :cond_d
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->initialized:Z

    .line 134
    if-nez p1, :cond_1a

    .line 136
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "certPath was null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 138
    :cond_1a
    iput-object p1, p0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->certPath:Ljava/security/cert/CertPath;

    .line 140
    invoke-virtual {p1}, Ljava/security/cert/CertPath;->getCertificates()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->certs:Ljava/util/List;

    .line 141
    iget-object v0, p0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->certs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iput v0, p0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->n:I

    .line 142
    iget-object v0, p0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->certs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_41

    .line 144
    new-instance v0, Lorg/spongycastle/x509/CertPathReviewerException;

    new-instance v1, Lorg/spongycastle/i18n/ErrorBundle;

    const-string v2, "org.spongycastle.x509.CertPathReviewerMessages"

    const-string v3, "CertPathReviewer.emptyCertPath"

    invoke-direct {v1, v2, v3}, Lorg/spongycastle/i18n/ErrorBundle;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/spongycastle/x509/CertPathReviewerException;-><init>(Lorg/spongycastle/i18n/ErrorBundle;)V

    throw v0

    .line 148
    :cond_41
    invoke-virtual {p2}, Ljava/security/cert/PKIXParameters;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/security/cert/PKIXParameters;

    iput-object v0, p0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->pkixParams:Ljava/security/cert/PKIXParameters;

    .line 156
    iget-object v0, p0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->pkixParams:Ljava/security/cert/PKIXParameters;

    invoke-static {v0}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->getValidDate(Ljava/security/cert/PKIXParameters;)Ljava/util/Date;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->validDate:Ljava/util/Date;

    .line 166
    iput-object v1, p0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->notifications:[Ljava/util/List;

    .line 167
    iput-object v1, p0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->errors:[Ljava/util/List;

    .line 168
    iput-object v1, p0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->trustAnchor:Ljava/security/cert/TrustAnchor;

    .line 169
    iput-object v1, p0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->subjectPublicKey:Ljava/security/PublicKey;

    .line 170
    iput-object v1, p0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->policyTree:Ljava/security/cert/PolicyNode;

    .line 171
    return-void
.end method

.method public isValidCertPath()Z
    .registers 4

    .prologue
    .line 305
    invoke-virtual {p0}, Lorg/spongycastle/x509/PKIXCertPathReviewer;->doChecks()V

    .line 306
    const/4 v1, 0x1

    .line 307
    .local v1, "valid":Z
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_5
    iget-object v2, p0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->errors:[Ljava/util/List;

    array-length v2, v2

    if-ge v0, v2, :cond_15

    .line 309
    iget-object v2, p0, Lorg/spongycastle/x509/PKIXCertPathReviewer;->errors:[Ljava/util/List;

    aget-object v2, v2, v0

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_16

    .line 311
    const/4 v1, 0x0

    .line 315
    :cond_15
    return v1

    .line 307
    :cond_16
    add-int/lit8 v0, v0, 0x1

    goto :goto_5
.end method
