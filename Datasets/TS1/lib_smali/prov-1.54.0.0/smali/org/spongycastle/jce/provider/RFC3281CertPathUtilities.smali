.class Lorg/spongycastle/jce/provider/RFC3281CertPathUtilities;
.super Ljava/lang/Object;
.source "RFC3281CertPathUtilities.java"


# static fields
.field private static final AUTHORITY_INFO_ACCESS:Ljava/lang/String;

.field private static final CRL_DISTRIBUTION_POINTS:Ljava/lang/String;

.field private static final NO_REV_AVAIL:Ljava/lang/String;

.field private static final TARGET_INFORMATION:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 57
    sget-object v0, Lorg/spongycastle/asn1/x509/X509Extensions;->TargetInformation:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 58
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/spongycastle/jce/provider/RFC3281CertPathUtilities;->TARGET_INFORMATION:Ljava/lang/String;

    .line 60
    sget-object v0, Lorg/spongycastle/asn1/x509/X509Extensions;->NoRevAvail:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 61
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/spongycastle/jce/provider/RFC3281CertPathUtilities;->NO_REV_AVAIL:Ljava/lang/String;

    .line 63
    sget-object v0, Lorg/spongycastle/asn1/x509/X509Extensions;->CRLDistributionPoints:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 64
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/spongycastle/jce/provider/RFC3281CertPathUtilities;->CRL_DISTRIBUTION_POINTS:Ljava/lang/String;

    .line 66
    sget-object v0, Lorg/spongycastle/asn1/x509/X509Extensions;->AuthorityInfoAccess:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 67
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/spongycastle/jce/provider/RFC3281CertPathUtilities;->AUTHORITY_INFO_ACCESS:Ljava/lang/String;

    .line 66
    return-void
.end method

.method constructor <init>()V
    .registers 1

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method protected static additionalChecks(Lorg/spongycastle/x509/X509AttributeCertificate;Ljava/util/Set;Ljava/util/Set;)V
    .registers 8
    .param p0, "attrCert"    # Lorg/spongycastle/x509/X509AttributeCertificate;
    .param p1, "prohibitedACAttributes"    # Ljava/util/Set;
    .param p2, "necessaryACAttributes"    # Ljava/util/Set;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertPathValidatorException;
        }
    .end annotation

    .prologue
    .line 304
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 305
    .local v0, "it":Ljava/util/Iterator;
    :cond_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_35

    .line 307
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 308
    .local v1, "oid":Ljava/lang/String;
    invoke-interface {p0, v1}, Lorg/spongycastle/x509/X509AttributeCertificate;->getAttributes(Ljava/lang/String;)[Lorg/spongycastle/x509/X509Attribute;

    move-result-object v2

    if-eqz v2, :cond_4

    .line 310
    new-instance v2, Ljava/security/cert/CertPathValidatorException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Attribute certificate contains prohibited attribute: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/security/cert/CertPathValidatorException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 315
    .end local v1    # "oid":Ljava/lang/String;
    :cond_35
    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 316
    :cond_39
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_6a

    .line 318
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 319
    .restart local v1    # "oid":Ljava/lang/String;
    invoke-interface {p0, v1}, Lorg/spongycastle/x509/X509AttributeCertificate;->getAttributes(Ljava/lang/String;)[Lorg/spongycastle/x509/X509Attribute;

    move-result-object v2

    if-nez v2, :cond_39

    .line 321
    new-instance v2, Ljava/security/cert/CertPathValidatorException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Attribute certificate does not contain necessary attribute: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/security/cert/CertPathValidatorException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 326
    .end local v1    # "oid":Ljava/lang/String;
    :cond_6a
    return-void
.end method

.method private static checkCRL(Lorg/spongycastle/asn1/x509/DistributionPoint;Lorg/spongycastle/x509/X509AttributeCertificate;Lorg/spongycastle/jcajce/PKIXExtendedParameters;Ljava/util/Date;Ljava/security/cert/X509Certificate;Lorg/spongycastle/jce/provider/CertStatus;Lorg/spongycastle/jce/provider/ReasonsMask;Ljava/util/List;Lorg/spongycastle/jcajce/util/JcaJceHelper;)V
    .registers 31
    .param p0, "dp"    # Lorg/spongycastle/asn1/x509/DistributionPoint;
    .param p1, "attrCert"    # Lorg/spongycastle/x509/X509AttributeCertificate;
    .param p2, "paramsPKIX"    # Lorg/spongycastle/jcajce/PKIXExtendedParameters;
    .param p3, "validDate"    # Ljava/util/Date;
    .param p4, "issuerCert"    # Ljava/security/cert/X509Certificate;
    .param p5, "certStatus"    # Lorg/spongycastle/jce/provider/CertStatus;
    .param p6, "reasonMask"    # Lorg/spongycastle/jce/provider/ReasonsMask;
    .param p7, "certPathCerts"    # Ljava/util/List;
    .param p8, "helper"    # Lorg/spongycastle/jcajce/util/JcaJceHelper;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/jce/provider/AnnotatedException;
        }
    .end annotation

    .prologue
    .line 592
    sget-object v5, Lorg/spongycastle/asn1/x509/X509Extensions;->NoRevAvail:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v5}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p1

    invoke-interface {v0, v5}, Lorg/spongycastle/x509/X509AttributeCertificate;->getExtensionValue(Ljava/lang/String;)[B

    move-result-object v5

    if-eqz v5, :cond_f

    .line 719
    :cond_e
    return-void

    .line 596
    :cond_f
    new-instance v13, Ljava/util/Date;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    invoke-direct {v13, v5, v6}, Ljava/util/Date;-><init>(J)V

    .line 597
    .local v13, "currentDate":Ljava/util/Date;
    invoke-virtual/range {p3 .. p3}, Ljava/util/Date;->getTime()J

    move-result-wide v5

    invoke-virtual {v13}, Ljava/util/Date;->getTime()J

    move-result-wide v7

    cmp-long v5, v5, v7

    if-lez v5, :cond_2c

    .line 599
    new-instance v5, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v6, "Validation time is in future."

    invoke-direct {v5, v6}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 610
    :cond_2c
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-static {v0, v1, v13, v2}, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->getCompleteCRLs(Lorg/spongycastle/asn1/x509/DistributionPoint;Ljava/lang/Object;Ljava/util/Date;Lorg/spongycastle/jcajce/PKIXExtendedParameters;)Ljava/util/Set;

    move-result-object v12

    .line 612
    .local v12, "crls":Ljava/util/Set;
    const/16 v21, 0x0

    .line 613
    .local v21, "validCrlFound":Z
    const/16 v20, 0x0

    .line 614
    .local v20, "lastException":Lorg/spongycastle/jce/provider/AnnotatedException;
    invoke-interface {v12}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v11

    .line 616
    .local v11, "crl_iter":Ljava/util/Iterator;
    :cond_3e
    :goto_3e
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_fd

    .line 617
    invoke-virtual/range {p5 .. p5}, Lorg/spongycastle/jce/provider/CertStatus;->getCertStatus()I

    move-result v5

    const/16 v6, 0xb

    if-ne v5, v6, :cond_fd

    .line 618
    invoke-virtual/range {p6 .. p6}, Lorg/spongycastle/jce/provider/ReasonsMask;->isAllReasons()Z

    move-result v5

    if-nez v5, :cond_fd

    .line 622
    :try_start_52
    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/security/cert/X509CRL;

    .line 626
    .local v4, "crl":Ljava/security/cert/X509CRL;
    move-object/from16 v0, p0

    invoke-static {v4, v0}, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->processCRLD(Ljava/security/cert/X509CRL;Lorg/spongycastle/asn1/x509/DistributionPoint;)Lorg/spongycastle/jce/provider/ReasonsMask;

    move-result-object v17

    .line 634
    .local v17, "interimReasonsMask":Lorg/spongycastle/jce/provider/ReasonsMask;
    move-object/from16 v0, v17

    move-object/from16 v1, p6

    invoke-virtual {v0, v1}, Lorg/spongycastle/jce/provider/ReasonsMask;->hasNewReasons(Lorg/spongycastle/jce/provider/ReasonsMask;)Z

    move-result v5

    if-eqz v5, :cond_3e

    .line 640
    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object/from16 v5, p1

    move-object/from16 v8, p2

    move-object/from16 v9, p7

    move-object/from16 v10, p8

    invoke-static/range {v4 .. v10}, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->processCRLF(Ljava/security/cert/X509CRL;Ljava/lang/Object;Ljava/security/cert/X509Certificate;Ljava/security/PublicKey;Lorg/spongycastle/jcajce/PKIXExtendedParameters;Ljava/util/List;Lorg/spongycastle/jcajce/util/JcaJceHelper;)Ljava/util/Set;

    move-result-object v19

    .line 642
    .local v19, "keys":Ljava/util/Set;
    move-object/from16 v0, v19

    invoke-static {v4, v0}, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->processCRLG(Ljava/security/cert/X509CRL;Ljava/util/Set;)Ljava/security/PublicKey;

    move-result-object v18

    .line 644
    .local v18, "key":Ljava/security/PublicKey;
    const/4 v14, 0x0

    .line 646
    .local v14, "deltaCRL":Ljava/security/cert/X509CRL;
    invoke-virtual/range {p2 .. p2}, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->isUseDeltasEnabled()Z

    move-result v5

    if-eqz v5, :cond_95

    .line 649
    invoke-virtual/range {p2 .. p2}, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->getCertStores()Ljava/util/List;

    move-result-object v5

    invoke-virtual/range {p2 .. p2}, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->getCRLStores()Ljava/util/List;

    move-result-object v6

    invoke-static {v13, v4, v5, v6}, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->getDeltaCRLs(Ljava/util/Date;Ljava/security/cert/X509CRL;Ljava/util/List;Ljava/util/List;)Ljava/util/Set;

    move-result-object v15

    .line 652
    .local v15, "deltaCRLs":Ljava/util/Set;
    move-object/from16 v0, v18

    invoke-static {v15, v0}, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->processCRLH(Ljava/util/Set;Ljava/security/PublicKey;)Ljava/security/cert/X509CRL;

    move-result-object v14

    .line 669
    .end local v15    # "deltaCRLs":Ljava/util/Set;
    :cond_95
    invoke-virtual/range {p2 .. p2}, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->getValidityModel()I

    move-result v5

    const/4 v6, 0x1

    if-eq v5, v6, :cond_bc

    .line 676
    invoke-interface/range {p1 .. p1}, Lorg/spongycastle/x509/X509AttributeCertificate;->getNotAfter()Ljava/util/Date;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/Date;->getTime()J

    move-result-wide v5

    invoke-virtual {v4}, Ljava/security/cert/X509CRL;->getThisUpdate()Ljava/util/Date;

    move-result-object v7

    .line 677
    invoke-virtual {v7}, Ljava/util/Date;->getTime()J

    move-result-wide v7

    cmp-long v5, v5, v7

    if-gez v5, :cond_bc

    .line 679
    new-instance v5, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v6, "No valid CRL for current time found."

    invoke-direct {v5, v6}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 710
    .end local v4    # "crl":Ljava/security/cert/X509CRL;
    .end local v14    # "deltaCRL":Ljava/security/cert/X509CRL;
    .end local v17    # "interimReasonsMask":Lorg/spongycastle/jce/provider/ReasonsMask;
    .end local v18    # "key":Ljava/security/PublicKey;
    .end local v19    # "keys":Ljava/util/Set;
    :catch_b8
    move-exception v16

    .line 712
    .local v16, "e":Lorg/spongycastle/jce/provider/AnnotatedException;
    move-object/from16 v20, v16

    .line 713
    goto :goto_3e

    .line 684
    .end local v16    # "e":Lorg/spongycastle/jce/provider/AnnotatedException;
    .restart local v4    # "crl":Ljava/security/cert/X509CRL;
    .restart local v14    # "deltaCRL":Ljava/security/cert/X509CRL;
    .restart local v17    # "interimReasonsMask":Lorg/spongycastle/jce/provider/ReasonsMask;
    .restart local v18    # "key":Ljava/security/PublicKey;
    .restart local v19    # "keys":Ljava/util/Set;
    :cond_bc
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-static {v0, v1, v4}, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->processCRLB1(Lorg/spongycastle/asn1/x509/DistributionPoint;Ljava/lang/Object;Ljava/security/cert/X509CRL;)V

    .line 687
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-static {v0, v1, v4}, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->processCRLB2(Lorg/spongycastle/asn1/x509/DistributionPoint;Ljava/lang/Object;Ljava/security/cert/X509CRL;)V

    .line 690
    move-object/from16 v0, p2

    invoke-static {v14, v4, v0}, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->processCRLC(Ljava/security/cert/X509CRL;Ljava/security/cert/X509CRL;Lorg/spongycastle/jcajce/PKIXExtendedParameters;)V

    .line 693
    move-object/from16 v0, p3

    move-object/from16 v1, p1

    move-object/from16 v2, p5

    move-object/from16 v3, p2

    invoke-static {v0, v14, v1, v2, v3}, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->processCRLI(Ljava/util/Date;Ljava/security/cert/X509CRL;Ljava/lang/Object;Lorg/spongycastle/jce/provider/CertStatus;Lorg/spongycastle/jcajce/PKIXExtendedParameters;)V

    .line 697
    move-object/from16 v0, p3

    move-object/from16 v1, p1

    move-object/from16 v2, p5

    invoke-static {v0, v4, v1, v2}, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->processCRLJ(Ljava/util/Date;Ljava/security/cert/X509CRL;Ljava/lang/Object;Lorg/spongycastle/jce/provider/CertStatus;)V

    .line 701
    invoke-virtual/range {p5 .. p5}, Lorg/spongycastle/jce/provider/CertStatus;->getCertStatus()I

    move-result v5

    const/16 v6, 0x8

    if-ne v5, v6, :cond_f2

    .line 703
    const/16 v5, 0xb

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Lorg/spongycastle/jce/provider/CertStatus;->setCertStatus(I)V

    .line 707
    :cond_f2
    move-object/from16 v0, p6

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/spongycastle/jce/provider/ReasonsMask;->addReasons(Lorg/spongycastle/jce/provider/ReasonsMask;)V
    :try_end_f9
    .catch Lorg/spongycastle/jce/provider/AnnotatedException; {:try_start_52 .. :try_end_f9} :catch_b8

    .line 708
    const/16 v21, 0x1

    goto/16 :goto_3e

    .line 715
    .end local v4    # "crl":Ljava/security/cert/X509CRL;
    .end local v14    # "deltaCRL":Ljava/security/cert/X509CRL;
    .end local v17    # "interimReasonsMask":Lorg/spongycastle/jce/provider/ReasonsMask;
    .end local v18    # "key":Ljava/security/PublicKey;
    .end local v19    # "keys":Ljava/util/Set;
    :cond_fd
    if-nez v21, :cond_e

    .line 717
    throw v20
.end method

.method protected static checkCRLs(Lorg/spongycastle/x509/X509AttributeCertificate;Lorg/spongycastle/jcajce/PKIXExtendedParameters;Ljava/security/cert/X509Certificate;Ljava/util/Date;Ljava/util/List;Lorg/spongycastle/jcajce/util/JcaJceHelper;)V
    .registers 27
    .param p0, "attrCert"    # Lorg/spongycastle/x509/X509AttributeCertificate;
    .param p1, "paramsPKIX"    # Lorg/spongycastle/jcajce/PKIXExtendedParameters;
    .param p2, "issuerCert"    # Ljava/security/cert/X509Certificate;
    .param p3, "validDate"    # Ljava/util/Date;
    .param p4, "certPathCerts"    # Ljava/util/List;
    .param p5, "helper"    # Lorg/spongycastle/jcajce/util/JcaJceHelper;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertPathValidatorException;
        }
    .end annotation

    .prologue
    .line 134
    invoke-virtual/range {p1 .. p1}, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->isRevocationEnabled()Z

    move-result v2

    if-eqz v2, :cond_1af

    .line 137
    sget-object v2, Lorg/spongycastle/jce/provider/RFC3281CertPathUtilities;->NO_REV_AVAIL:Ljava/lang/String;

    move-object/from16 v0, p0

    invoke-interface {v0, v2}, Lorg/spongycastle/x509/X509AttributeCertificate;->getExtensionValue(Ljava/lang/String;)[B

    move-result-object v2

    if-nez v2, :cond_193

    .line 139
    const/4 v12, 0x0

    .line 142
    .local v12, "crldp":Lorg/spongycastle/asn1/x509/CRLDistPoint;
    :try_start_11
    sget-object v2, Lorg/spongycastle/jce/provider/RFC3281CertPathUtilities;->CRL_DISTRIBUTION_POINTS:Ljava/lang/String;

    .line 143
    move-object/from16 v0, p0

    invoke-static {v0, v2}, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->getExtensionValue(Ljava/security/cert/X509Extension;Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v2

    .line 142
    invoke-static {v2}, Lorg/spongycastle/asn1/x509/CRLDistPoint;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/CRLDistPoint;
    :try_end_1c
    .catch Lorg/spongycastle/jce/provider/AnnotatedException; {:try_start_11 .. :try_end_1c} :catch_45

    move-result-object v12

    .line 152
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 156
    .local v11, "crlStores":Ljava/util/List;
    :try_start_22
    invoke-virtual/range {p1 .. p1}, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->getNamedCRLStoreMap()Ljava/util/Map;

    move-result-object v2

    invoke-static {v12, v2}, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->getAdditionalStoresFromCRLDistributionPoint(Lorg/spongycastle/asn1/x509/CRLDistPoint;Ljava/util/Map;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v11, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z
    :try_end_2d
    .catch Lorg/spongycastle/jce/provider/AnnotatedException; {:try_start_22 .. :try_end_2d} :catch_4e

    .line 165
    new-instance v10, Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;

    move-object/from16 v0, p1

    invoke-direct {v10, v0}, Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;-><init>(Lorg/spongycastle/jcajce/PKIXExtendedParameters;)V

    .line 167
    .local v10, "bldr":Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;
    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v17

    .local v17, "it":Ljava/util/Iterator;
    :goto_38
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_57

    move-object v2, v11

    .line 169
    check-cast v2, Lorg/spongycastle/jcajce/PKIXCRLStore;

    invoke-virtual {v10, v2}, Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;->addCRLStore(Lorg/spongycastle/jcajce/PKIXCRLStore;)Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;

    goto :goto_38

    .line 145
    .end local v10    # "bldr":Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;
    .end local v11    # "crlStores":Ljava/util/List;
    .end local v17    # "it":Ljava/util/Iterator;
    :catch_45
    move-exception v14

    .line 147
    .local v14, "e":Lorg/spongycastle/jce/provider/AnnotatedException;
    new-instance v2, Ljava/security/cert/CertPathValidatorException;

    const-string v4, "CRL distribution point extension could not be read."

    invoke-direct {v2, v4, v14}, Ljava/security/cert/CertPathValidatorException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 158
    .end local v14    # "e":Lorg/spongycastle/jce/provider/AnnotatedException;
    .restart local v11    # "crlStores":Ljava/util/List;
    :catch_4e
    move-exception v14

    .line 160
    .restart local v14    # "e":Lorg/spongycastle/jce/provider/AnnotatedException;
    new-instance v2, Ljava/security/cert/CertPathValidatorException;

    const-string v4, "No additional CRL locations could be decoded from CRL distribution point extension."

    invoke-direct {v2, v4, v14}, Ljava/security/cert/CertPathValidatorException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 172
    .end local v14    # "e":Lorg/spongycastle/jce/provider/AnnotatedException;
    .restart local v10    # "bldr":Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;
    .restart local v17    # "it":Ljava/util/Iterator;
    :cond_57
    invoke-virtual {v10}, Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;->build()Lorg/spongycastle/jcajce/PKIXExtendedParameters;

    move-result-object p1

    .line 174
    new-instance v6, Lorg/spongycastle/jce/provider/CertStatus;

    invoke-direct {v6}, Lorg/spongycastle/jce/provider/CertStatus;-><init>()V

    .line 175
    .local v6, "certStatus":Lorg/spongycastle/jce/provider/CertStatus;
    new-instance v7, Lorg/spongycastle/jce/provider/ReasonsMask;

    invoke-direct {v7}, Lorg/spongycastle/jce/provider/ReasonsMask;-><init>()V

    .line 177
    .local v7, "reasonsMask":Lorg/spongycastle/jce/provider/ReasonsMask;
    const/16 v18, 0x0

    .line 178
    .local v18, "lastException":Lorg/spongycastle/jce/provider/AnnotatedException;
    const/16 v20, 0x0

    .line 180
    .local v20, "validCrlFound":Z
    if-eqz v12, :cond_af

    .line 182
    const/4 v13, 0x0

    .line 185
    .local v13, "dps":[Lorg/spongycastle/asn1/x509/DistributionPoint;
    :try_start_6c
    invoke-virtual {v12}, Lorg/spongycastle/asn1/x509/CRLDistPoint;->getDistributionPoints()[Lorg/spongycastle/asn1/x509/DistributionPoint;
    :try_end_6f
    .catch Ljava/lang/Exception; {:try_start_6c .. :try_end_6f} :catch_9c

    move-result-object v13

    .line 194
    const/4 v15, 0x0

    .line 196
    .local v15, "i":I
    :goto_71
    :try_start_71
    array-length v2, v13

    if-ge v15, v2, :cond_af

    .line 195
    invoke-virtual {v6}, Lorg/spongycastle/jce/provider/CertStatus;->getCertStatus()I

    move-result v2

    const/16 v4, 0xb

    if-ne v2, v4, :cond_af

    .line 196
    invoke-virtual {v7}, Lorg/spongycastle/jce/provider/ReasonsMask;->isAllReasons()Z

    move-result v2

    if-nez v2, :cond_af

    .line 199
    invoke-virtual/range {p1 .. p1}, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->clone()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/spongycastle/jcajce/PKIXExtendedParameters;

    .line 201
    .local v3, "paramsPKIXClone":Lorg/spongycastle/jcajce/PKIXExtendedParameters;
    aget-object v1, v13, v15

    move-object/from16 v2, p0

    move-object/from16 v4, p3

    move-object/from16 v5, p2

    move-object/from16 v8, p4

    move-object/from16 v9, p5

    invoke-static/range {v1 .. v9}, Lorg/spongycastle/jce/provider/RFC3281CertPathUtilities;->checkCRL(Lorg/spongycastle/asn1/x509/DistributionPoint;Lorg/spongycastle/x509/X509AttributeCertificate;Lorg/spongycastle/jcajce/PKIXExtendedParameters;Ljava/util/Date;Ljava/security/cert/X509Certificate;Lorg/spongycastle/jce/provider/CertStatus;Lorg/spongycastle/jce/provider/ReasonsMask;Ljava/util/List;Lorg/spongycastle/jcajce/util/JcaJceHelper;)V
    :try_end_97
    .catch Lorg/spongycastle/jce/provider/AnnotatedException; {:try_start_71 .. :try_end_97} :catch_a5

    .line 204
    const/16 v20, 0x1

    .line 196
    add-int/lit8 v15, v15, 0x1

    goto :goto_71

    .line 187
    .end local v3    # "paramsPKIXClone":Lorg/spongycastle/jcajce/PKIXExtendedParameters;
    .end local v15    # "i":I
    :catch_9c
    move-exception v14

    .line 189
    .local v14, "e":Ljava/lang/Exception;
    new-instance v2, Lorg/spongycastle/jce/exception/ExtCertPathValidatorException;

    const-string v4, "Distribution points could not be read."

    invoke-direct {v2, v4, v14}, Lorg/spongycastle/jce/exception/ExtCertPathValidatorException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 207
    .end local v14    # "e":Ljava/lang/Exception;
    .restart local v15    # "i":I
    :catch_a5
    move-exception v14

    .line 209
    .local v14, "e":Lorg/spongycastle/jce/provider/AnnotatedException;
    new-instance v18, Lorg/spongycastle/jce/provider/AnnotatedException;

    .end local v18    # "lastException":Lorg/spongycastle/jce/provider/AnnotatedException;
    const-string v2, "No valid CRL for distribution point found."

    move-object/from16 v0, v18

    invoke-direct {v0, v2, v14}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 220
    .end local v13    # "dps":[Lorg/spongycastle/asn1/x509/DistributionPoint;
    .end local v14    # "e":Lorg/spongycastle/jce/provider/AnnotatedException;
    .end local v15    # "i":I
    .restart local v18    # "lastException":Lorg/spongycastle/jce/provider/AnnotatedException;
    :cond_af
    invoke-virtual {v6}, Lorg/spongycastle/jce/provider/CertStatus;->getCertStatus()I

    move-result v2

    const/16 v4, 0xb

    if-ne v2, v4, :cond_108

    .line 221
    invoke-virtual {v7}, Lorg/spongycastle/jce/provider/ReasonsMask;->isAllReasons()Z

    move-result v2

    if-nez v2, :cond_108

    .line 230
    const/16 v16, 0x0

    .line 234
    .local v16, "issuer":Lorg/spongycastle/asn1/ASN1Primitive;
    :try_start_bf
    new-instance v4, Lorg/spongycastle/asn1/ASN1InputStream;

    .line 235
    invoke-interface/range {p0 .. p0}, Lorg/spongycastle/x509/X509AttributeCertificate;->getIssuer()Lorg/spongycastle/x509/AttributeCertificateIssuer;

    move-result-object v2

    .line 236
    invoke-virtual {v2}, Lorg/spongycastle/x509/AttributeCertificateIssuer;->getPrincipals()[Ljava/security/Principal;

    move-result-object v2

    const/4 v5, 0x0

    aget-object v2, v2, v5

    check-cast v2, Ljavax/security/auth/x500/X500Principal;

    invoke-virtual {v2}, Ljavax/security/auth/x500/X500Principal;->getEncoded()[B

    move-result-object v2

    invoke-direct {v4, v2}, Lorg/spongycastle/asn1/ASN1InputStream;-><init>([B)V

    .line 237
    invoke-virtual {v4}, Lorg/spongycastle/asn1/ASN1InputStream;->readObject()Lorg/spongycastle/asn1/ASN1Primitive;
    :try_end_d8
    .catch Ljava/lang/Exception; {:try_start_bf .. :try_end_d8} :catch_114
    .catch Lorg/spongycastle/jce/provider/AnnotatedException; {:try_start_bf .. :try_end_d8} :catch_11d

    move-result-object v16

    .line 245
    :try_start_d9
    new-instance v1, Lorg/spongycastle/asn1/x509/DistributionPoint;

    new-instance v2, Lorg/spongycastle/asn1/x509/DistributionPointName;

    const/4 v4, 0x0

    new-instance v5, Lorg/spongycastle/asn1/x509/GeneralNames;

    new-instance v8, Lorg/spongycastle/asn1/x509/GeneralName;

    const/4 v9, 0x4

    move-object/from16 v0, v16

    invoke-direct {v8, v9, v0}, Lorg/spongycastle/asn1/x509/GeneralName;-><init>(ILorg/spongycastle/asn1/ASN1Encodable;)V

    invoke-direct {v5, v8}, Lorg/spongycastle/asn1/x509/GeneralNames;-><init>(Lorg/spongycastle/asn1/x509/GeneralName;)V

    invoke-direct {v2, v4, v5}, Lorg/spongycastle/asn1/x509/DistributionPointName;-><init>(ILorg/spongycastle/asn1/ASN1Encodable;)V

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-direct {v1, v2, v4, v5}, Lorg/spongycastle/asn1/x509/DistributionPoint;-><init>(Lorg/spongycastle/asn1/x509/DistributionPointName;Lorg/spongycastle/asn1/x509/ReasonFlags;Lorg/spongycastle/asn1/x509/GeneralNames;)V

    .line 250
    .local v1, "dp":Lorg/spongycastle/asn1/x509/DistributionPoint;
    invoke-virtual/range {p1 .. p1}, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->clone()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/spongycastle/jcajce/PKIXExtendedParameters;

    .restart local v3    # "paramsPKIXClone":Lorg/spongycastle/jcajce/PKIXExtendedParameters;
    move-object/from16 v2, p0

    move-object/from16 v4, p3

    move-object/from16 v5, p2

    move-object/from16 v8, p4

    move-object/from16 v9, p5

    .line 251
    invoke-static/range {v1 .. v9}, Lorg/spongycastle/jce/provider/RFC3281CertPathUtilities;->checkCRL(Lorg/spongycastle/asn1/x509/DistributionPoint;Lorg/spongycastle/x509/X509AttributeCertificate;Lorg/spongycastle/jcajce/PKIXExtendedParameters;Ljava/util/Date;Ljava/security/cert/X509Certificate;Lorg/spongycastle/jce/provider/CertStatus;Lorg/spongycastle/jce/provider/ReasonsMask;Ljava/util/List;Lorg/spongycastle/jcajce/util/JcaJceHelper;)V
    :try_end_106
    .catch Lorg/spongycastle/jce/provider/AnnotatedException; {:try_start_d9 .. :try_end_106} :catch_11d

    .line 253
    const/16 v20, 0x1

    .line 262
    .end local v1    # "dp":Lorg/spongycastle/asn1/x509/DistributionPoint;
    .end local v3    # "paramsPKIXClone":Lorg/spongycastle/jcajce/PKIXExtendedParameters;
    .end local v16    # "issuer":Lorg/spongycastle/asn1/ASN1Primitive;
    :cond_108
    :goto_108
    if-nez v20, :cond_128

    .line 264
    new-instance v2, Lorg/spongycastle/jce/exception/ExtCertPathValidatorException;

    const-string v4, "No valid CRL found."

    move-object/from16 v0, v18

    invoke-direct {v2, v4, v0}, Lorg/spongycastle/jce/exception/ExtCertPathValidatorException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 239
    .restart local v16    # "issuer":Lorg/spongycastle/asn1/ASN1Primitive;
    :catch_114
    move-exception v14

    .line 241
    .local v14, "e":Ljava/lang/Exception;
    :try_start_115
    new-instance v2, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v4, "Issuer from certificate for CRL could not be reencoded."

    invoke-direct {v2, v4, v14}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
    :try_end_11d
    .catch Lorg/spongycastle/jce/provider/AnnotatedException; {:try_start_115 .. :try_end_11d} :catch_11d

    .line 255
    .end local v14    # "e":Ljava/lang/Exception;
    :catch_11d
    move-exception v14

    .line 257
    .local v14, "e":Lorg/spongycastle/jce/provider/AnnotatedException;
    new-instance v18, Lorg/spongycastle/jce/provider/AnnotatedException;

    .end local v18    # "lastException":Lorg/spongycastle/jce/provider/AnnotatedException;
    const-string v2, "No valid CRL for distribution point found."

    move-object/from16 v0, v18

    invoke-direct {v0, v2, v14}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .restart local v18    # "lastException":Lorg/spongycastle/jce/provider/AnnotatedException;
    goto :goto_108

    .line 267
    .end local v14    # "e":Lorg/spongycastle/jce/provider/AnnotatedException;
    .end local v16    # "issuer":Lorg/spongycastle/asn1/ASN1Primitive;
    :cond_128
    invoke-virtual {v6}, Lorg/spongycastle/jce/provider/CertStatus;->getCertStatus()I

    move-result v2

    const/16 v4, 0xb

    if-eq v2, v4, :cond_170

    .line 269
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Attribute certificate revocation after "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 270
    invoke-virtual {v6}, Lorg/spongycastle/jce/provider/CertStatus;->getRevocationDate()Ljava/util/Date;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    .line 271
    .local v19, "message":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v19

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, ", reason: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v4, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->crlReasons:[Ljava/lang/String;

    .line 273
    invoke-virtual {v6}, Lorg/spongycastle/jce/provider/CertStatus;->getCertStatus()I

    move-result v5

    aget-object v4, v4, v5

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    .line 274
    new-instance v2, Ljava/security/cert/CertPathValidatorException;

    move-object/from16 v0, v19

    invoke-direct {v2, v0}, Ljava/security/cert/CertPathValidatorException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 276
    .end local v19    # "message":Ljava/lang/String;
    :cond_170
    invoke-virtual {v7}, Lorg/spongycastle/jce/provider/ReasonsMask;->isAllReasons()Z

    move-result v2

    if-nez v2, :cond_183

    .line 277
    invoke-virtual {v6}, Lorg/spongycastle/jce/provider/CertStatus;->getCertStatus()I

    move-result v2

    const/16 v4, 0xb

    if-ne v2, v4, :cond_183

    .line 279
    const/16 v2, 0xc

    invoke-virtual {v6, v2}, Lorg/spongycastle/jce/provider/CertStatus;->setCertStatus(I)V

    .line 281
    :cond_183
    invoke-virtual {v6}, Lorg/spongycastle/jce/provider/CertStatus;->getCertStatus()I

    move-result v2

    const/16 v4, 0xc

    if-ne v2, v4, :cond_1af

    .line 283
    new-instance v2, Ljava/security/cert/CertPathValidatorException;

    const-string v4, "Attribute certificate status could not be determined."

    invoke-direct {v2, v4}, Ljava/security/cert/CertPathValidatorException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 290
    .end local v6    # "certStatus":Lorg/spongycastle/jce/provider/CertStatus;
    .end local v7    # "reasonsMask":Lorg/spongycastle/jce/provider/ReasonsMask;
    .end local v10    # "bldr":Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;
    .end local v11    # "crlStores":Ljava/util/List;
    .end local v12    # "crldp":Lorg/spongycastle/asn1/x509/CRLDistPoint;
    .end local v17    # "it":Ljava/util/Iterator;
    .end local v18    # "lastException":Lorg/spongycastle/jce/provider/AnnotatedException;
    .end local v20    # "validCrlFound":Z
    :cond_193
    sget-object v2, Lorg/spongycastle/jce/provider/RFC3281CertPathUtilities;->CRL_DISTRIBUTION_POINTS:Ljava/lang/String;

    move-object/from16 v0, p0

    invoke-interface {v0, v2}, Lorg/spongycastle/x509/X509AttributeCertificate;->getExtensionValue(Ljava/lang/String;)[B

    move-result-object v2

    if-nez v2, :cond_1a7

    sget-object v2, Lorg/spongycastle/jce/provider/RFC3281CertPathUtilities;->AUTHORITY_INFO_ACCESS:Ljava/lang/String;

    .line 291
    move-object/from16 v0, p0

    invoke-interface {v0, v2}, Lorg/spongycastle/x509/X509AttributeCertificate;->getExtensionValue(Ljava/lang/String;)[B

    move-result-object v2

    if-eqz v2, :cond_1af

    .line 293
    :cond_1a7
    new-instance v2, Ljava/security/cert/CertPathValidatorException;

    const-string v4, "No rev avail extension is set, but also an AC revocation pointer."

    invoke-direct {v2, v4}, Ljava/security/cert/CertPathValidatorException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 298
    :cond_1af
    return-void
.end method

.method protected static processAttrCert1(Lorg/spongycastle/x509/X509AttributeCertificate;Lorg/spongycastle/jcajce/PKIXExtendedParameters;)Ljava/security/cert/CertPath;
    .registers 14
    .param p0, "attrCert"    # Lorg/spongycastle/x509/X509AttributeCertificate;
    .param p1, "pkixParams"    # Lorg/spongycastle/jcajce/PKIXExtendedParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertPathValidatorException;
        }
    .end annotation

    .prologue
    .line 443
    const/4 v8, 0x0

    .line 445
    .local v8, "result":Ljava/security/cert/CertPathBuilderResult;
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 446
    .local v2, "holderPKCs":Ljava/util/Set;
    invoke-interface {p0}, Lorg/spongycastle/x509/X509AttributeCertificate;->getHolder()Lorg/spongycastle/x509/AttributeCertificateHolder;

    move-result-object v10

    invoke-virtual {v10}, Lorg/spongycastle/x509/AttributeCertificateHolder;->getIssuer()[Ljava/security/Principal;

    move-result-object v10

    if-eqz v10, :cond_74

    .line 448
    new-instance v9, Ljava/security/cert/X509CertSelector;

    invoke-direct {v9}, Ljava/security/cert/X509CertSelector;-><init>()V

    .line 449
    .local v9, "selector":Ljava/security/cert/X509CertSelector;
    invoke-interface {p0}, Lorg/spongycastle/x509/X509AttributeCertificate;->getHolder()Lorg/spongycastle/x509/AttributeCertificateHolder;

    move-result-object v10

    invoke-virtual {v10}, Lorg/spongycastle/x509/AttributeCertificateHolder;->getSerialNumber()Ljava/math/BigInteger;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/security/cert/X509CertSelector;->setSerialNumber(Ljava/math/BigInteger;)V

    .line 450
    invoke-interface {p0}, Lorg/spongycastle/x509/X509AttributeCertificate;->getHolder()Lorg/spongycastle/x509/AttributeCertificateHolder;

    move-result-object v10

    invoke-virtual {v10}, Lorg/spongycastle/x509/AttributeCertificateHolder;->getIssuer()[Ljava/security/Principal;

    move-result-object v7

    .line 451
    .local v7, "principals":[Ljava/security/Principal;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_29
    array-length v10, v7

    if-ge v3, v10, :cond_66

    .line 455
    :try_start_2c
    aget-object v10, v7, v3

    instance-of v10, v10, Ljavax/security/auth/x500/X500Principal;

    if-eqz v10, :cond_3d

    .line 457
    aget-object v10, v7, v3

    check-cast v10, Ljavax/security/auth/x500/X500Principal;

    .line 458
    invoke-virtual {v10}, Ljavax/security/auth/x500/X500Principal;->getEncoded()[B

    move-result-object v10

    .line 457
    invoke-virtual {v9, v10}, Ljava/security/cert/X509CertSelector;->setIssuer([B)V

    .line 460
    :cond_3d
    new-instance v10, Lorg/spongycastle/jcajce/PKIXCertStoreSelector$Builder;

    invoke-direct {v10, v9}, Lorg/spongycastle/jcajce/PKIXCertStoreSelector$Builder;-><init>(Ljava/security/cert/CertSelector;)V

    .line 461
    invoke-virtual {v10}, Lorg/spongycastle/jcajce/PKIXCertStoreSelector$Builder;->build()Lorg/spongycastle/jcajce/PKIXCertStoreSelector;

    move-result-object v10

    invoke-virtual {p1}, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->getCertStores()Ljava/util/List;

    move-result-object v11

    invoke-static {v10, v11}, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->findCertificates(Lorg/spongycastle/jcajce/PKIXCertStoreSelector;Ljava/util/List;)Ljava/util/Collection;

    move-result-object v10

    .line 460
    invoke-interface {v2, v10}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z
    :try_end_51
    .catch Lorg/spongycastle/jce/provider/AnnotatedException; {:try_start_2c .. :try_end_51} :catch_54
    .catch Ljava/io/IOException; {:try_start_2c .. :try_end_51} :catch_5d

    .line 451
    add-int/lit8 v3, v3, 0x1

    goto :goto_29

    .line 463
    :catch_54
    move-exception v1

    .line 465
    .local v1, "e":Lorg/spongycastle/jce/provider/AnnotatedException;
    new-instance v10, Lorg/spongycastle/jce/exception/ExtCertPathValidatorException;

    const-string v11, "Public key certificate for attribute certificate cannot be searched."

    invoke-direct {v10, v11, v1}, Lorg/spongycastle/jce/exception/ExtCertPathValidatorException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v10

    .line 469
    .end local v1    # "e":Lorg/spongycastle/jce/provider/AnnotatedException;
    :catch_5d
    move-exception v1

    .line 471
    .local v1, "e":Ljava/io/IOException;
    new-instance v10, Lorg/spongycastle/jce/exception/ExtCertPathValidatorException;

    const-string v11, "Unable to encode X500 principal."

    invoke-direct {v10, v11, v1}, Lorg/spongycastle/jce/exception/ExtCertPathValidatorException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v10

    .line 475
    .end local v1    # "e":Ljava/io/IOException;
    :cond_66
    invoke-interface {v2}, Ljava/util/Set;->isEmpty()Z

    move-result v10

    if-eqz v10, :cond_74

    .line 477
    new-instance v10, Ljava/security/cert/CertPathValidatorException;

    const-string v11, "Public key certificate specified in base certificate ID for attribute certificate cannot be found."

    invoke-direct {v10, v11}, Ljava/security/cert/CertPathValidatorException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 481
    .end local v3    # "i":I
    .end local v7    # "principals":[Ljava/security/Principal;
    .end local v9    # "selector":Ljava/security/cert/X509CertSelector;
    :cond_74
    invoke-interface {p0}, Lorg/spongycastle/x509/X509AttributeCertificate;->getHolder()Lorg/spongycastle/x509/AttributeCertificateHolder;

    move-result-object v10

    invoke-virtual {v10}, Lorg/spongycastle/x509/AttributeCertificateHolder;->getEntityNames()[Ljava/security/Principal;

    move-result-object v10

    if-eqz v10, :cond_d7

    .line 483
    new-instance v9, Lorg/spongycastle/x509/X509CertStoreSelector;

    invoke-direct {v9}, Lorg/spongycastle/x509/X509CertStoreSelector;-><init>()V

    .line 484
    .local v9, "selector":Lorg/spongycastle/x509/X509CertStoreSelector;
    invoke-interface {p0}, Lorg/spongycastle/x509/X509AttributeCertificate;->getHolder()Lorg/spongycastle/x509/AttributeCertificateHolder;

    move-result-object v10

    invoke-virtual {v10}, Lorg/spongycastle/x509/AttributeCertificateHolder;->getEntityNames()[Ljava/security/Principal;

    move-result-object v7

    .line 485
    .restart local v7    # "principals":[Ljava/security/Principal;
    const/4 v3, 0x0

    .restart local v3    # "i":I
    :goto_8c
    array-length v10, v7

    if-ge v3, v10, :cond_c9

    .line 489
    :try_start_8f
    aget-object v10, v7, v3

    instance-of v10, v10, Ljavax/security/auth/x500/X500Principal;

    if-eqz v10, :cond_a0

    .line 491
    aget-object v10, v7, v3

    check-cast v10, Ljavax/security/auth/x500/X500Principal;

    .line 492
    invoke-virtual {v10}, Ljavax/security/auth/x500/X500Principal;->getEncoded()[B

    move-result-object v10

    .line 491
    invoke-virtual {v9, v10}, Lorg/spongycastle/x509/X509CertStoreSelector;->setIssuer([B)V

    .line 494
    :cond_a0
    new-instance v10, Lorg/spongycastle/jcajce/PKIXCertStoreSelector$Builder;

    invoke-direct {v10, v9}, Lorg/spongycastle/jcajce/PKIXCertStoreSelector$Builder;-><init>(Ljava/security/cert/CertSelector;)V

    .line 495
    invoke-virtual {v10}, Lorg/spongycastle/jcajce/PKIXCertStoreSelector$Builder;->build()Lorg/spongycastle/jcajce/PKIXCertStoreSelector;

    move-result-object v10

    invoke-virtual {p1}, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->getCertStores()Ljava/util/List;

    move-result-object v11

    invoke-static {v10, v11}, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->findCertificates(Lorg/spongycastle/jcajce/PKIXCertStoreSelector;Ljava/util/List;)Ljava/util/Collection;

    move-result-object v10

    .line 494
    invoke-interface {v2, v10}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z
    :try_end_b4
    .catch Lorg/spongycastle/jce/provider/AnnotatedException; {:try_start_8f .. :try_end_b4} :catch_b7
    .catch Ljava/io/IOException; {:try_start_8f .. :try_end_b4} :catch_c0

    .line 485
    add-int/lit8 v3, v3, 0x1

    goto :goto_8c

    .line 497
    :catch_b7
    move-exception v1

    .line 499
    .local v1, "e":Lorg/spongycastle/jce/provider/AnnotatedException;
    new-instance v10, Lorg/spongycastle/jce/exception/ExtCertPathValidatorException;

    const-string v11, "Public key certificate for attribute certificate cannot be searched."

    invoke-direct {v10, v11, v1}, Lorg/spongycastle/jce/exception/ExtCertPathValidatorException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v10

    .line 503
    .end local v1    # "e":Lorg/spongycastle/jce/provider/AnnotatedException;
    :catch_c0
    move-exception v1

    .line 505
    .local v1, "e":Ljava/io/IOException;
    new-instance v10, Lorg/spongycastle/jce/exception/ExtCertPathValidatorException;

    const-string v11, "Unable to encode X500 principal."

    invoke-direct {v10, v11, v1}, Lorg/spongycastle/jce/exception/ExtCertPathValidatorException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v10

    .line 509
    .end local v1    # "e":Ljava/io/IOException;
    :cond_c9
    invoke-interface {v2}, Ljava/util/Set;->isEmpty()Z

    move-result v10

    if-eqz v10, :cond_d7

    .line 511
    new-instance v10, Ljava/security/cert/CertPathValidatorException;

    const-string v11, "Public key certificate specified in entity name for attribute certificate cannot be found."

    invoke-direct {v10, v11}, Ljava/security/cert/CertPathValidatorException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 516
    .end local v3    # "i":I
    .end local v7    # "principals":[Ljava/security/Principal;
    .end local v9    # "selector":Lorg/spongycastle/x509/X509CertStoreSelector;
    :cond_d7
    new-instance v6, Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;

    invoke-direct {v6, p1}, Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;-><init>(Lorg/spongycastle/jcajce/PKIXExtendedParameters;)V

    .line 518
    .local v6, "paramsBldr":Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;
    const/4 v5, 0x0

    .line 519
    .local v5, "lastException":Ljava/security/cert/CertPathValidatorException;
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "it":Ljava/util/Iterator;
    :goto_e1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_142

    .line 521
    new-instance v9, Lorg/spongycastle/x509/X509CertStoreSelector;

    invoke-direct {v9}, Lorg/spongycastle/x509/X509CertStoreSelector;-><init>()V

    .line 522
    .restart local v9    # "selector":Lorg/spongycastle/x509/X509CertStoreSelector;
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/security/cert/X509Certificate;

    invoke-virtual {v9, v10}, Lorg/spongycastle/x509/X509CertStoreSelector;->setCertificate(Ljava/security/cert/X509Certificate;)V

    .line 523
    new-instance v10, Lorg/spongycastle/jcajce/PKIXCertStoreSelector$Builder;

    invoke-direct {v10, v9}, Lorg/spongycastle/jcajce/PKIXCertStoreSelector$Builder;-><init>(Ljava/security/cert/CertSelector;)V

    invoke-virtual {v10}, Lorg/spongycastle/jcajce/PKIXCertStoreSelector$Builder;->build()Lorg/spongycastle/jcajce/PKIXCertStoreSelector;

    move-result-object v10

    invoke-virtual {v6, v10}, Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;->setTargetConstraints(Lorg/spongycastle/jcajce/PKIXCertStoreSelector;)Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;

    .line 524
    const/4 v0, 0x0

    .line 527
    .local v0, "builder":Ljava/security/cert/CertPathBuilder;
    :try_start_102
    const-string v10, "PKIX"

    const-string v11, "SC"

    invoke-static {v10, v11}, Ljava/security/cert/CertPathBuilder;->getInstance(Ljava/lang/String;Ljava/lang/String;)Ljava/security/cert/CertPathBuilder;
    :try_end_109
    .catch Ljava/security/NoSuchProviderException; {:try_start_102 .. :try_end_109} :catch_11c
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_102 .. :try_end_109} :catch_125

    move-result-object v0

    .line 541
    :try_start_10a
    new-instance v10, Lorg/spongycastle/jcajce/PKIXExtendedBuilderParameters$Builder;

    invoke-virtual {v6}, Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;->build()Lorg/spongycastle/jcajce/PKIXExtendedParameters;

    move-result-object v11

    invoke-direct {v10, v11}, Lorg/spongycastle/jcajce/PKIXExtendedBuilderParameters$Builder;-><init>(Lorg/spongycastle/jcajce/PKIXExtendedParameters;)V

    invoke-virtual {v10}, Lorg/spongycastle/jcajce/PKIXExtendedBuilderParameters$Builder;->build()Lorg/spongycastle/jcajce/PKIXExtendedBuilderParameters;

    move-result-object v10

    invoke-virtual {v0, v10}, Ljava/security/cert/CertPathBuilder;->build(Ljava/security/cert/CertPathParameters;)Ljava/security/cert/CertPathBuilderResult;
    :try_end_11a
    .catch Ljava/security/cert/CertPathBuilderException; {:try_start_10a .. :try_end_11a} :catch_12e
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_10a .. :try_end_11a} :catch_137

    move-result-object v8

    goto :goto_e1

    .line 529
    :catch_11c
    move-exception v1

    .line 531
    .local v1, "e":Ljava/security/NoSuchProviderException;
    new-instance v10, Lorg/spongycastle/jce/exception/ExtCertPathValidatorException;

    const-string v11, "Support class could not be created."

    invoke-direct {v10, v11, v1}, Lorg/spongycastle/jce/exception/ExtCertPathValidatorException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v10

    .line 534
    .end local v1    # "e":Ljava/security/NoSuchProviderException;
    :catch_125
    move-exception v1

    .line 536
    .local v1, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v10, Lorg/spongycastle/jce/exception/ExtCertPathValidatorException;

    const-string v11, "Support class could not be created."

    invoke-direct {v10, v11, v1}, Lorg/spongycastle/jce/exception/ExtCertPathValidatorException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v10

    .line 543
    .end local v1    # "e":Ljava/security/NoSuchAlgorithmException;
    :catch_12e
    move-exception v1

    .line 545
    .local v1, "e":Ljava/security/cert/CertPathBuilderException;
    new-instance v5, Lorg/spongycastle/jce/exception/ExtCertPathValidatorException;

    .end local v5    # "lastException":Ljava/security/cert/CertPathValidatorException;
    const-string v10, "Certification path for public key certificate of attribute certificate could not be build."

    invoke-direct {v5, v10, v1}, Lorg/spongycastle/jce/exception/ExtCertPathValidatorException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 553
    .restart local v5    # "lastException":Ljava/security/cert/CertPathValidatorException;
    goto :goto_e1

    .line 549
    .end local v1    # "e":Ljava/security/cert/CertPathBuilderException;
    :catch_137
    move-exception v1

    .line 552
    .local v1, "e":Ljava/security/InvalidAlgorithmParameterException;
    new-instance v10, Ljava/lang/RuntimeException;

    invoke-virtual {v1}, Ljava/security/InvalidAlgorithmParameterException;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 555
    .end local v0    # "builder":Ljava/security/cert/CertPathBuilder;
    .end local v1    # "e":Ljava/security/InvalidAlgorithmParameterException;
    .end local v9    # "selector":Lorg/spongycastle/x509/X509CertStoreSelector;
    :cond_142
    if-eqz v5, :cond_145

    .line 557
    throw v5

    .line 559
    :cond_145
    invoke-interface {v8}, Ljava/security/cert/CertPathBuilderResult;->getCertPath()Ljava/security/cert/CertPath;

    move-result-object v10

    return-object v10
.end method

.method protected static processAttrCert2(Ljava/security/cert/CertPath;Lorg/spongycastle/jcajce/PKIXExtendedParameters;)Ljava/security/cert/CertPathValidatorResult;
    .registers 6
    .param p0, "certPath"    # Ljava/security/cert/CertPath;
    .param p1, "pkixParams"    # Lorg/spongycastle/jcajce/PKIXExtendedParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertPathValidatorException;
        }
    .end annotation

    .prologue
    .line 390
    const/4 v1, 0x0

    .line 393
    .local v1, "validator":Ljava/security/cert/CertPathValidator;
    :try_start_1
    const-string v2, "PKIX"

    const-string v3, "SC"

    invoke-static {v2, v3}, Ljava/security/cert/CertPathValidator;->getInstance(Ljava/lang/String;Ljava/lang/String;)Ljava/security/cert/CertPathValidator;
    :try_end_8
    .catch Ljava/security/NoSuchProviderException; {:try_start_1 .. :try_end_8} :catch_e
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_1 .. :try_end_8} :catch_17

    move-result-object v1

    .line 407
    :try_start_9
    invoke-virtual {v1, p0, p1}, Ljava/security/cert/CertPathValidator;->validate(Ljava/security/cert/CertPath;Ljava/security/cert/CertPathParameters;)Ljava/security/cert/CertPathValidatorResult;
    :try_end_c
    .catch Ljava/security/cert/CertPathValidatorException; {:try_start_9 .. :try_end_c} :catch_20
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_9 .. :try_end_c} :catch_29

    move-result-object v2

    return-object v2

    .line 395
    :catch_e
    move-exception v0

    .line 397
    .local v0, "e":Ljava/security/NoSuchProviderException;
    new-instance v2, Lorg/spongycastle/jce/exception/ExtCertPathValidatorException;

    const-string v3, "Support class could not be created."

    invoke-direct {v2, v3, v0}, Lorg/spongycastle/jce/exception/ExtCertPathValidatorException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 400
    .end local v0    # "e":Ljava/security/NoSuchProviderException;
    :catch_17
    move-exception v0

    .line 402
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v2, Lorg/spongycastle/jce/exception/ExtCertPathValidatorException;

    const-string v3, "Support class could not be created."

    invoke-direct {v2, v3, v0}, Lorg/spongycastle/jce/exception/ExtCertPathValidatorException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 409
    .end local v0    # "e":Ljava/security/NoSuchAlgorithmException;
    :catch_20
    move-exception v0

    .line 411
    .local v0, "e":Ljava/security/cert/CertPathValidatorException;
    new-instance v2, Lorg/spongycastle/jce/exception/ExtCertPathValidatorException;

    const-string v3, "Certification path for issuer certificate of attribute certificate could not be validated."

    invoke-direct {v2, v3, v0}, Lorg/spongycastle/jce/exception/ExtCertPathValidatorException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 415
    .end local v0    # "e":Ljava/security/cert/CertPathValidatorException;
    :catch_29
    move-exception v0

    .line 418
    .local v0, "e":Ljava/security/InvalidAlgorithmParameterException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-virtual {v0}, Ljava/security/InvalidAlgorithmParameterException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method protected static processAttrCert3(Ljava/security/cert/X509Certificate;Lorg/spongycastle/jcajce/PKIXExtendedParameters;)V
    .registers 4
    .param p0, "acIssuerCert"    # Ljava/security/cert/X509Certificate;
    .param p1, "pkixParams"    # Lorg/spongycastle/jcajce/PKIXExtendedParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertPathValidatorException;
        }
    .end annotation

    .prologue
    .line 373
    invoke-virtual {p0}, Ljava/security/cert/X509Certificate;->getKeyUsage()[Z

    move-result-object v0

    if-eqz v0, :cond_20

    .line 374
    invoke-virtual {p0}, Ljava/security/cert/X509Certificate;->getKeyUsage()[Z

    move-result-object v0

    const/4 v1, 0x0

    aget-boolean v0, v0, v1

    if-nez v0, :cond_20

    invoke-virtual {p0}, Ljava/security/cert/X509Certificate;->getKeyUsage()[Z

    move-result-object v0

    const/4 v1, 0x1

    aget-boolean v0, v0, v1

    if-nez v0, :cond_20

    .line 376
    new-instance v0, Ljava/security/cert/CertPathValidatorException;

    const-string v1, "Attribute certificate issuer public key cannot be used to validate digital signatures."

    invoke-direct {v0, v1}, Ljava/security/cert/CertPathValidatorException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 379
    :cond_20
    invoke-virtual {p0}, Ljava/security/cert/X509Certificate;->getBasicConstraints()I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_2f

    .line 381
    new-instance v0, Ljava/security/cert/CertPathValidatorException;

    const-string v1, "Attribute certificate issuer is also a public key certificate issuer."

    invoke-direct {v0, v1}, Ljava/security/cert/CertPathValidatorException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 384
    :cond_2f
    return-void
.end method

.method protected static processAttrCert4(Ljava/security/cert/X509Certificate;Ljava/util/Set;)V
    .registers 8
    .param p0, "acIssuerCert"    # Ljava/security/cert/X509Certificate;
    .param p1, "trustedACIssuers"    # Ljava/util/Set;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertPathValidatorException;
        }
    .end annotation

    .prologue
    .line 351
    move-object v2, p1

    .line 352
    .local v2, "set":Ljava/util/Set;
    const/4 v3, 0x0

    .line 353
    .local v3, "trusted":Z
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "it":Ljava/util/Iterator;
    :cond_6
    :goto_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_32

    .line 355
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/security/cert/TrustAnchor;

    .line 356
    .local v0, "anchor":Ljava/security/cert/TrustAnchor;
    invoke-virtual {p0}, Ljava/security/cert/X509Certificate;->getSubjectX500Principal()Ljavax/security/auth/x500/X500Principal;

    move-result-object v4

    const-string v5, "RFC2253"

    invoke-virtual {v4, v5}, Ljavax/security/auth/x500/X500Principal;->getName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 357
    invoke-virtual {v0}, Ljava/security/cert/TrustAnchor;->getCAName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_30

    .line 358
    invoke-virtual {v0}, Ljava/security/cert/TrustAnchor;->getTrustedCert()Ljava/security/cert/X509Certificate;

    move-result-object v4

    invoke-virtual {p0, v4}, Ljava/security/cert/X509Certificate;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 360
    :cond_30
    const/4 v3, 0x1

    goto :goto_6

    .line 363
    .end local v0    # "anchor":Ljava/security/cert/TrustAnchor;
    :cond_32
    if-nez v3, :cond_3c

    .line 365
    new-instance v4, Ljava/security/cert/CertPathValidatorException;

    const-string v5, "Attribute certificate issuer is not directly trusted."

    invoke-direct {v4, v5}, Ljava/security/cert/CertPathValidatorException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 368
    :cond_3c
    return-void
.end method

.method protected static processAttrCert5(Lorg/spongycastle/x509/X509AttributeCertificate;Lorg/spongycastle/jcajce/PKIXExtendedParameters;)V
    .registers 5
    .param p0, "attrCert"    # Lorg/spongycastle/x509/X509AttributeCertificate;
    .param p1, "pkixParams"    # Lorg/spongycastle/jcajce/PKIXExtendedParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertPathValidatorException;
        }
    .end annotation

    .prologue
    .line 333
    .line 334
    :try_start_0
    invoke-static {p1}, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->getValidDate(Lorg/spongycastle/jcajce/PKIXExtendedParameters;)Ljava/util/Date;

    move-result-object v1

    .line 333
    invoke-interface {p0, v1}, Lorg/spongycastle/x509/X509AttributeCertificate;->checkValidity(Ljava/util/Date;)V
    :try_end_7
    .catch Ljava/security/cert/CertificateExpiredException; {:try_start_0 .. :try_end_7} :catch_8
    .catch Ljava/security/cert/CertificateNotYetValidException; {:try_start_0 .. :try_end_7} :catch_11

    .line 346
    return-void

    .line 336
    :catch_8
    move-exception v0

    .line 338
    .local v0, "e":Ljava/security/cert/CertificateExpiredException;
    new-instance v1, Lorg/spongycastle/jce/exception/ExtCertPathValidatorException;

    const-string v2, "Attribute certificate is not valid."

    invoke-direct {v1, v2, v0}, Lorg/spongycastle/jce/exception/ExtCertPathValidatorException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 341
    .end local v0    # "e":Ljava/security/cert/CertificateExpiredException;
    :catch_11
    move-exception v0

    .line 343
    .local v0, "e":Ljava/security/cert/CertificateNotYetValidException;
    new-instance v1, Lorg/spongycastle/jce/exception/ExtCertPathValidatorException;

    const-string v2, "Attribute certificate is not valid."

    invoke-direct {v1, v2, v0}, Lorg/spongycastle/jce/exception/ExtCertPathValidatorException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method protected static processAttrCert7(Lorg/spongycastle/x509/X509AttributeCertificate;Ljava/security/cert/CertPath;Ljava/security/cert/CertPath;Lorg/spongycastle/jcajce/PKIXExtendedParameters;Ljava/util/Set;)V
    .registers 11
    .param p0, "attrCert"    # Lorg/spongycastle/x509/X509AttributeCertificate;
    .param p1, "certPath"    # Ljava/security/cert/CertPath;
    .param p2, "holderCertPath"    # Ljava/security/cert/CertPath;
    .param p3, "pkixParams"    # Lorg/spongycastle/jcajce/PKIXExtendedParameters;
    .param p4, "attrCertCheckers"    # Ljava/util/Set;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertPathValidatorException;
        }
    .end annotation

    .prologue
    .line 77
    invoke-interface {p0}, Lorg/spongycastle/x509/X509AttributeCertificate;->getCriticalExtensionOIDs()Ljava/util/Set;

    move-result-object v2

    .line 82
    .local v2, "set":Ljava/util/Set;
    sget-object v3, Lorg/spongycastle/jce/provider/RFC3281CertPathUtilities;->TARGET_INFORMATION:Ljava/lang/String;

    invoke-interface {v2, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_15

    .line 86
    :try_start_c
    sget-object v3, Lorg/spongycastle/jce/provider/RFC3281CertPathUtilities;->TARGET_INFORMATION:Ljava/lang/String;

    .line 87
    invoke-static {p0, v3}, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->getExtensionValue(Ljava/security/cert/X509Extension;Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v3

    .line 86
    invoke-static {v3}, Lorg/spongycastle/asn1/x509/TargetInformation;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/TargetInformation;
    :try_end_15
    .catch Lorg/spongycastle/jce/provider/AnnotatedException; {:try_start_c .. :try_end_15} :catch_2e
    .catch Ljava/lang/IllegalArgumentException; {:try_start_c .. :try_end_15} :catch_37

    .line 100
    :cond_15
    sget-object v3, Lorg/spongycastle/jce/provider/RFC3281CertPathUtilities;->TARGET_INFORMATION:Ljava/lang/String;

    invoke-interface {v2, v3}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 101
    invoke-interface {p4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 102
    .local v1, "it":Ljava/util/Iterator;
    :goto_1e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_40

    .line 104
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/spongycastle/x509/PKIXAttrCertChecker;

    invoke-virtual {v3, p0, p1, p2, v2}, Lorg/spongycastle/x509/PKIXAttrCertChecker;->check(Lorg/spongycastle/x509/X509AttributeCertificate;Ljava/security/cert/CertPath;Ljava/security/cert/CertPath;Ljava/util/Collection;)V

    goto :goto_1e

    .line 89
    .end local v1    # "it":Ljava/util/Iterator;
    :catch_2e
    move-exception v0

    .line 91
    .local v0, "e":Lorg/spongycastle/jce/provider/AnnotatedException;
    new-instance v3, Lorg/spongycastle/jce/exception/ExtCertPathValidatorException;

    const-string v4, "Target information extension could not be read."

    invoke-direct {v3, v4, v0}, Lorg/spongycastle/jce/exception/ExtCertPathValidatorException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 94
    .end local v0    # "e":Lorg/spongycastle/jce/provider/AnnotatedException;
    :catch_37
    move-exception v0

    .line 96
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    new-instance v3, Lorg/spongycastle/jce/exception/ExtCertPathValidatorException;

    const-string v4, "Target information extension could not be read."

    invoke-direct {v3, v4, v0}, Lorg/spongycastle/jce/exception/ExtCertPathValidatorException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 107
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    .restart local v1    # "it":Ljava/util/Iterator;
    :cond_40
    invoke-interface {v2}, Ljava/util/Set;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_5f

    .line 109
    new-instance v3, Ljava/security/cert/CertPathValidatorException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Attribute certificate contains unsupported critical extensions: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/security/cert/CertPathValidatorException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 113
    :cond_5f
    return-void
.end method
