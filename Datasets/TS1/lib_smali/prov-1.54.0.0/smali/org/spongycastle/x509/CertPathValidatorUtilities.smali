.class Lorg/spongycastle/x509/CertPathValidatorUtilities;
.super Ljava/lang/Object;
.source "CertPathValidatorUtilities.java"


# static fields
.field protected static final ANY_POLICY:Ljava/lang/String; = "2.5.29.32.0"

.field protected static final AUTHORITY_KEY_IDENTIFIER:Ljava/lang/String;

.field protected static final BASIC_CONSTRAINTS:Ljava/lang/String;

.field protected static final CERTIFICATE_POLICIES:Ljava/lang/String;

.field protected static final CRL_DISTRIBUTION_POINTS:Ljava/lang/String;

.field protected static final CRL_NUMBER:Ljava/lang/String;

.field protected static final CRL_SIGN:I = 0x6

.field protected static final CRL_UTIL:Lorg/spongycastle/x509/PKIXCRLUtil;

.field protected static final DELTA_CRL_INDICATOR:Ljava/lang/String;

.field protected static final FRESHEST_CRL:Ljava/lang/String;

.field protected static final INHIBIT_ANY_POLICY:Ljava/lang/String;

.field protected static final ISSUING_DISTRIBUTION_POINT:Ljava/lang/String;

.field protected static final KEY_CERT_SIGN:I = 0x5

.field protected static final KEY_USAGE:Ljava/lang/String;

.field protected static final NAME_CONSTRAINTS:Ljava/lang/String;

.field protected static final POLICY_CONSTRAINTS:Ljava/lang/String;

.field protected static final POLICY_MAPPINGS:Ljava/lang/String;

.field protected static final SUBJECT_ALTERNATIVE_NAME:Ljava/lang/String;

.field protected static final crlReasons:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 81
    new-instance v0, Lorg/spongycastle/x509/PKIXCRLUtil;

    invoke-direct {v0}, Lorg/spongycastle/x509/PKIXCRLUtil;-><init>()V

    sput-object v0, Lorg/spongycastle/x509/CertPathValidatorUtilities;->CRL_UTIL:Lorg/spongycastle/x509/PKIXCRLUtil;

    .line 83
    sget-object v0, Lorg/spongycastle/asn1/x509/Extension;->certificatePolicies:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/spongycastle/x509/CertPathValidatorUtilities;->CERTIFICATE_POLICIES:Ljava/lang/String;

    .line 84
    sget-object v0, Lorg/spongycastle/asn1/x509/Extension;->basicConstraints:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/spongycastle/x509/CertPathValidatorUtilities;->BASIC_CONSTRAINTS:Ljava/lang/String;

    .line 85
    sget-object v0, Lorg/spongycastle/asn1/x509/Extension;->policyMappings:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/spongycastle/x509/CertPathValidatorUtilities;->POLICY_MAPPINGS:Ljava/lang/String;

    .line 86
    sget-object v0, Lorg/spongycastle/asn1/x509/Extension;->subjectAlternativeName:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/spongycastle/x509/CertPathValidatorUtilities;->SUBJECT_ALTERNATIVE_NAME:Ljava/lang/String;

    .line 87
    sget-object v0, Lorg/spongycastle/asn1/x509/Extension;->nameConstraints:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/spongycastle/x509/CertPathValidatorUtilities;->NAME_CONSTRAINTS:Ljava/lang/String;

    .line 88
    sget-object v0, Lorg/spongycastle/asn1/x509/Extension;->keyUsage:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/spongycastle/x509/CertPathValidatorUtilities;->KEY_USAGE:Ljava/lang/String;

    .line 89
    sget-object v0, Lorg/spongycastle/asn1/x509/Extension;->inhibitAnyPolicy:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/spongycastle/x509/CertPathValidatorUtilities;->INHIBIT_ANY_POLICY:Ljava/lang/String;

    .line 90
    sget-object v0, Lorg/spongycastle/asn1/x509/Extension;->issuingDistributionPoint:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/spongycastle/x509/CertPathValidatorUtilities;->ISSUING_DISTRIBUTION_POINT:Ljava/lang/String;

    .line 91
    sget-object v0, Lorg/spongycastle/asn1/x509/Extension;->deltaCRLIndicator:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/spongycastle/x509/CertPathValidatorUtilities;->DELTA_CRL_INDICATOR:Ljava/lang/String;

    .line 92
    sget-object v0, Lorg/spongycastle/asn1/x509/Extension;->policyConstraints:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/spongycastle/x509/CertPathValidatorUtilities;->POLICY_CONSTRAINTS:Ljava/lang/String;

    .line 93
    sget-object v0, Lorg/spongycastle/asn1/x509/Extension;->freshestCRL:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/spongycastle/x509/CertPathValidatorUtilities;->FRESHEST_CRL:Ljava/lang/String;

    .line 94
    sget-object v0, Lorg/spongycastle/asn1/x509/Extension;->cRLDistributionPoints:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/spongycastle/x509/CertPathValidatorUtilities;->CRL_DISTRIBUTION_POINTS:Ljava/lang/String;

    .line 95
    sget-object v0, Lorg/spongycastle/asn1/x509/Extension;->authorityKeyIdentifier:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/spongycastle/x509/CertPathValidatorUtilities;->AUTHORITY_KEY_IDENTIFIER:Ljava/lang/String;

    .line 99
    sget-object v0, Lorg/spongycastle/asn1/x509/Extension;->cRLNumber:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/spongycastle/x509/CertPathValidatorUtilities;->CRL_NUMBER:Ljava/lang/String;

    .line 107
    const/16 v0, 0xb

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "unspecified"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "keyCompromise"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "cACompromise"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "affiliationChanged"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "superseded"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "cessationOfOperation"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "certificateHold"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "unknown"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "removeFromCRL"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "privilegeWithdrawn"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "aACompromise"

    aput-object v2, v0, v1

    sput-object v0, Lorg/spongycastle/x509/CertPathValidatorUtilities;->crlReasons:[Ljava/lang/String;

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .prologue
    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method protected static addAdditionalStoreFromLocation(Ljava/lang/String;Lorg/spongycastle/x509/ExtendedPKIXParameters;)V
    .registers 9
    .param p0, "location"    # Ljava/lang/String;
    .param p1, "pkixParams"    # Lorg/spongycastle/x509/ExtendedPKIXParameters;

    .prologue
    .line 657
    invoke-virtual {p1}, Lorg/spongycastle/x509/ExtendedPKIXParameters;->isAdditionalLocationsEnabled()Z

    move-result v4

    if-eqz v4, :cond_7b

    .line 661
    :try_start_6
    const-string v4, "ldap://"

    invoke-virtual {p0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_7b

    .line 666
    const/4 v4, 0x7

    invoke-virtual {p0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 668
    const/4 v0, 0x0

    .line 669
    .local v0, "base":Ljava/lang/String;
    const/4 v3, 0x0

    .line 670
    .local v3, "url":Ljava/lang/String;
    const-string v4, "/"

    invoke-virtual {p0, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    const/4 v5, -0x1

    if-eq v4, v5, :cond_7c

    .line 672
    const-string v4, "/"

    invoke-virtual {p0, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {p0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 674
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "ldap://"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v5, 0x0

    const-string v6, "/"

    .line 675
    invoke-virtual {p0, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {p0, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 682
    :goto_46
    new-instance v4, Lorg/spongycastle/jce/X509LDAPCertStoreParameters$Builder;

    invoke-direct {v4, v3, v0}, Lorg/spongycastle/jce/X509LDAPCertStoreParameters$Builder;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 683
    invoke-virtual {v4}, Lorg/spongycastle/jce/X509LDAPCertStoreParameters$Builder;->build()Lorg/spongycastle/jce/X509LDAPCertStoreParameters;

    move-result-object v2

    .line 684
    .local v2, "params":Lorg/spongycastle/jce/X509LDAPCertStoreParameters;
    const-string v4, "CERTIFICATE/LDAP"

    const-string v5, "SC"

    invoke-static {v4, v2, v5}, Lorg/spongycastle/x509/X509Store;->getInstance(Ljava/lang/String;Lorg/spongycastle/x509/X509StoreParameters;Ljava/lang/String;)Lorg/spongycastle/x509/X509Store;

    move-result-object v4

    invoke-virtual {p1, v4}, Lorg/spongycastle/x509/ExtendedPKIXParameters;->addAdditionalStore(Lorg/spongycastle/util/Store;)V

    .line 686
    const-string v4, "CRL/LDAP"

    const-string v5, "SC"

    invoke-static {v4, v2, v5}, Lorg/spongycastle/x509/X509Store;->getInstance(Ljava/lang/String;Lorg/spongycastle/x509/X509StoreParameters;Ljava/lang/String;)Lorg/spongycastle/x509/X509Store;

    move-result-object v4

    invoke-virtual {p1, v4}, Lorg/spongycastle/x509/ExtendedPKIXParameters;->addAdditionalStore(Lorg/spongycastle/util/Store;)V

    .line 688
    const-string v4, "ATTRIBUTECERTIFICATE/LDAP"

    const-string v5, "SC"

    invoke-static {v4, v2, v5}, Lorg/spongycastle/x509/X509Store;->getInstance(Ljava/lang/String;Lorg/spongycastle/x509/X509StoreParameters;Ljava/lang/String;)Lorg/spongycastle/x509/X509Store;

    move-result-object v4

    invoke-virtual {p1, v4}, Lorg/spongycastle/x509/ExtendedPKIXParameters;->addAdditionalStore(Lorg/spongycastle/util/Store;)V

    .line 690
    const-string v4, "CERTIFICATEPAIR/LDAP"

    const-string v5, "SC"

    invoke-static {v4, v2, v5}, Lorg/spongycastle/x509/X509Store;->getInstance(Ljava/lang/String;Lorg/spongycastle/x509/X509StoreParameters;Ljava/lang/String;)Lorg/spongycastle/x509/X509Store;

    move-result-object v4

    invoke-virtual {p1, v4}, Lorg/spongycastle/x509/ExtendedPKIXParameters;->addAdditionalStore(Lorg/spongycastle/util/Store;)V

    .line 700
    .end local v0    # "base":Ljava/lang/String;
    .end local v2    # "params":Lorg/spongycastle/jce/X509LDAPCertStoreParameters;
    .end local v3    # "url":Ljava/lang/String;
    :cond_7b
    return-void

    .line 679
    .restart local v0    # "base":Ljava/lang/String;
    .restart local v3    # "url":Ljava/lang/String;
    :cond_7c
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "ldap://"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_8e
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_8e} :catch_90

    move-result-object v3

    goto :goto_46

    .line 694
    .end local v0    # "base":Ljava/lang/String;
    .end local v3    # "url":Ljava/lang/String;
    :catch_90
    move-exception v1

    .line 697
    .local v1, "e":Ljava/lang/Exception;
    new-instance v4, Ljava/lang/RuntimeException;

    const-string v5, "Exception adding X.509 stores."

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method protected static addAdditionalStoresFromAltNames(Ljava/security/cert/X509Certificate;Lorg/spongycastle/x509/ExtendedPKIXParameters;)V
    .registers 7
    .param p0, "cert"    # Ljava/security/cert/X509Certificate;
    .param p1, "pkixParams"    # Lorg/spongycastle/x509/ExtendedPKIXParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateParsingException;
        }
    .end annotation

    .prologue
    .line 246
    invoke-virtual {p0}, Ljava/security/cert/X509Certificate;->getIssuerAlternativeNames()Ljava/util/Collection;

    move-result-object v3

    if-eqz v3, :cond_35

    .line 248
    invoke-virtual {p0}, Ljava/security/cert/X509Certificate;->getIssuerAlternativeNames()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 249
    .local v0, "it":Ljava/util/Iterator;
    :cond_e
    :goto_e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_35

    .line 252
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 253
    .local v1, "list":Ljava/util/List;
    const/4 v3, 0x0

    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    const/4 v4, 0x6

    invoke-static {v4}, Lorg/spongycastle/util/Integers;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_e

    .line 256
    const/4 v3, 0x1

    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 257
    .local v2, "temp":Ljava/lang/String;
    invoke-static {v2, p1}, Lorg/spongycastle/x509/CertPathValidatorUtilities;->addAdditionalStoreFromLocation(Ljava/lang/String;Lorg/spongycastle/x509/ExtendedPKIXParameters;)V

    goto :goto_e

    .line 261
    .end local v0    # "it":Ljava/util/Iterator;
    .end local v1    # "list":Ljava/util/List;
    .end local v2    # "temp":Ljava/lang/String;
    :cond_35
    return-void
.end method

.method protected static addAdditionalStoresFromCRLDistributionPoint(Lorg/spongycastle/asn1/x509/CRLDistPoint;Lorg/spongycastle/x509/ExtendedPKIXParameters;)V
    .registers 11
    .param p0, "crldp"    # Lorg/spongycastle/asn1/x509/CRLDistPoint;
    .param p1, "pkixParams"    # Lorg/spongycastle/x509/ExtendedPKIXParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/jce/provider/AnnotatedException;
        }
    .end annotation

    .prologue
    .line 860
    if-eqz p0, :cond_52

    .line 862
    const/4 v1, 0x0

    .line 865
    .local v1, "dps":[Lorg/spongycastle/asn1/x509/DistributionPoint;
    :try_start_3
    invoke-virtual {p0}, Lorg/spongycastle/asn1/x509/CRLDistPoint;->getDistributionPoints()[Lorg/spongycastle/asn1/x509/DistributionPoint;
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_6} :catch_46

    move-result-object v1

    .line 872
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_8
    array-length v7, v1

    if-ge v4, v7, :cond_52

    .line 874
    aget-object v7, v1, v4

    invoke-virtual {v7}, Lorg/spongycastle/asn1/x509/DistributionPoint;->getDistributionPoint()Lorg/spongycastle/asn1/x509/DistributionPointName;

    move-result-object v0

    .line 876
    .local v0, "dpn":Lorg/spongycastle/asn1/x509/DistributionPointName;
    if-eqz v0, :cond_4f

    .line 878
    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/DistributionPointName;->getType()I

    move-result v7

    if-nez v7, :cond_4f

    .line 881
    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/DistributionPointName;->getName()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v7

    .line 880
    invoke-static {v7}, Lorg/spongycastle/asn1/x509/GeneralNames;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/GeneralNames;

    move-result-object v7

    .line 881
    invoke-virtual {v7}, Lorg/spongycastle/asn1/x509/GeneralNames;->getNames()[Lorg/spongycastle/asn1/x509/GeneralName;

    move-result-object v3

    .line 883
    .local v3, "genNames":[Lorg/spongycastle/asn1/x509/GeneralName;
    const/4 v5, 0x0

    .local v5, "j":I
    :goto_26
    array-length v7, v3

    if-ge v5, v7, :cond_4f

    .line 885
    aget-object v7, v3, v5

    invoke-virtual {v7}, Lorg/spongycastle/asn1/x509/GeneralName;->getTagNo()I

    move-result v7

    const/4 v8, 0x6

    if-ne v7, v8, :cond_43

    .line 887
    aget-object v7, v3, v5

    .line 888
    invoke-virtual {v7}, Lorg/spongycastle/asn1/x509/GeneralName;->getName()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v7

    .line 887
    invoke-static {v7}, Lorg/spongycastle/asn1/DERIA5String;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/DERIA5String;

    move-result-object v7

    .line 888
    invoke-virtual {v7}, Lorg/spongycastle/asn1/DERIA5String;->getString()Ljava/lang/String;

    move-result-object v6

    .line 890
    .local v6, "location":Ljava/lang/String;
    invoke-static {v6, p1}, Lorg/spongycastle/x509/CertPathValidatorUtilities;->addAdditionalStoreFromLocation(Ljava/lang/String;Lorg/spongycastle/x509/ExtendedPKIXParameters;)V

    .line 883
    .end local v6    # "location":Ljava/lang/String;
    :cond_43
    add-int/lit8 v5, v5, 0x1

    goto :goto_26

    .line 867
    .end local v0    # "dpn":Lorg/spongycastle/asn1/x509/DistributionPointName;
    .end local v3    # "genNames":[Lorg/spongycastle/asn1/x509/GeneralName;
    .end local v4    # "i":I
    .end local v5    # "j":I
    :catch_46
    move-exception v2

    .line 869
    .local v2, "e":Ljava/lang/Exception;
    new-instance v7, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v8, "Distribution points could not be read."

    invoke-direct {v7, v8, v2}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v7

    .line 872
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v0    # "dpn":Lorg/spongycastle/asn1/x509/DistributionPointName;
    .restart local v4    # "i":I
    :cond_4f
    add-int/lit8 v4, v4, 0x1

    goto :goto_8

    .line 898
    .end local v0    # "dpn":Lorg/spongycastle/asn1/x509/DistributionPointName;
    .end local v1    # "dps":[Lorg/spongycastle/asn1/x509/DistributionPoint;
    .end local v4    # "i":I
    :cond_52
    return-void
.end method

.method protected static findCertificates(Lorg/spongycastle/jcajce/PKIXCertStoreSelector;Ljava/util/List;)Ljava/util/Collection;
    .registers 9
    .param p0, "certSelect"    # Lorg/spongycastle/jcajce/PKIXCertStoreSelector;
    .param p1, "certStores"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/jce/provider/AnnotatedException;
        }
    .end annotation

    .prologue
    .line 789
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 790
    .local v1, "certs":Ljava/util/Set;
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 792
    .local v3, "iter":Ljava/util/Iterator;
    :goto_9
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3f

    .line 794
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    .line 796
    .local v4, "obj":Ljava/lang/Object;
    instance-of v5, v4, Lorg/spongycastle/util/Store;

    if-eqz v5, :cond_2b

    move-object v0, v4

    .line 798
    check-cast v0, Lorg/spongycastle/util/Store;

    .line 801
    .local v0, "certStore":Lorg/spongycastle/util/Store;
    :try_start_1a
    invoke-interface {v0, p0}, Lorg/spongycastle/util/Store;->getMatches(Lorg/spongycastle/util/Selector;)Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z
    :try_end_21
    .catch Lorg/spongycastle/util/StoreException; {:try_start_1a .. :try_end_21} :catch_22

    goto :goto_9

    .line 803
    :catch_22
    move-exception v2

    .line 805
    .local v2, "e":Lorg/spongycastle/util/StoreException;
    new-instance v5, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v6, "Problem while picking certificates from X.509 store."

    invoke-direct {v5, v6, v2}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5

    .end local v0    # "certStore":Lorg/spongycastle/util/Store;
    .end local v2    # "e":Lorg/spongycastle/util/StoreException;
    :cond_2b
    move-object v0, v4

    .line 811
    check-cast v0, Ljava/security/cert/CertStore;

    .line 815
    .local v0, "certStore":Ljava/security/cert/CertStore;
    :try_start_2e
    invoke-static {p0, v0}, Lorg/spongycastle/jcajce/PKIXCertStoreSelector;->getCertificates(Lorg/spongycastle/jcajce/PKIXCertStoreSelector;Ljava/security/cert/CertStore;)Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z
    :try_end_35
    .catch Ljava/security/cert/CertStoreException; {:try_start_2e .. :try_end_35} :catch_36

    goto :goto_9

    .line 817
    :catch_36
    move-exception v2

    .line 819
    .local v2, "e":Ljava/security/cert/CertStoreException;
    new-instance v5, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v6, "Problem while picking certificates from certificate store."

    invoke-direct {v5, v6, v2}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5

    .line 825
    .end local v0    # "certStore":Ljava/security/cert/CertStore;
    .end local v2    # "e":Ljava/security/cert/CertStoreException;
    .end local v4    # "obj":Ljava/lang/Object;
    :cond_3f
    return-object v1
.end method

.method protected static findCertificates(Lorg/spongycastle/x509/X509AttributeCertStoreSelector;Ljava/util/List;)Ljava/util/Collection;
    .registers 9
    .param p0, "certSelect"    # Lorg/spongycastle/x509/X509AttributeCertStoreSelector;
    .param p1, "certStores"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/jce/provider/AnnotatedException;
        }
    .end annotation

    .prologue
    .line 832
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 833
    .local v1, "certs":Ljava/util/Set;
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 835
    .local v3, "iter":Ljava/util/Iterator;
    :cond_9
    :goto_9
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2b

    .line 837
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    .line 839
    .local v4, "obj":Ljava/lang/Object;
    instance-of v5, v4, Lorg/spongycastle/x509/X509Store;

    if-eqz v5, :cond_9

    move-object v0, v4

    .line 841
    check-cast v0, Lorg/spongycastle/x509/X509Store;

    .line 844
    .local v0, "certStore":Lorg/spongycastle/x509/X509Store;
    :try_start_1a
    invoke-virtual {v0, p0}, Lorg/spongycastle/x509/X509Store;->getMatches(Lorg/spongycastle/util/Selector;)Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z
    :try_end_21
    .catch Lorg/spongycastle/util/StoreException; {:try_start_1a .. :try_end_21} :catch_22

    goto :goto_9

    .line 846
    :catch_22
    move-exception v2

    .line 848
    .local v2, "e":Lorg/spongycastle/util/StoreException;
    new-instance v5, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v6, "Problem while picking certificates from X.509 store."

    invoke-direct {v5, v6, v2}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5

    .line 853
    .end local v0    # "certStore":Lorg/spongycastle/x509/X509Store;
    .end local v2    # "e":Lorg/spongycastle/util/StoreException;
    .end local v4    # "obj":Ljava/lang/Object;
    :cond_2b
    return-object v1
.end method

.method protected static findCertificates(Lorg/spongycastle/x509/X509CertStoreSelector;Ljava/util/List;)Ljava/util/Collection;
    .registers 12
    .param p0, "certSelect"    # Lorg/spongycastle/x509/X509CertStoreSelector;
    .param p1, "certStores"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/jce/provider/AnnotatedException;
        }
    .end annotation

    .prologue
    .line 718
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 719
    .local v3, "certs":Ljava/util/Set;
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .line 720
    .local v6, "iter":Ljava/util/Iterator;
    new-instance v1, Lorg/spongycastle/jcajce/provider/asymmetric/x509/CertificateFactory;

    invoke-direct {v1}, Lorg/spongycastle/jcajce/provider/asymmetric/x509/CertificateFactory;-><init>()V

    .line 722
    .local v1, "certFact":Lorg/spongycastle/jcajce/provider/asymmetric/x509/CertificateFactory;
    :cond_e
    :goto_e
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_87

    .line 724
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    .line 726
    .local v7, "obj":Ljava/lang/Object;
    instance-of v8, v7, Lorg/spongycastle/util/Store;

    if-eqz v8, :cond_73

    move-object v2, v7

    .line 728
    check-cast v2, Lorg/spongycastle/util/Store;

    .line 731
    .local v2, "certStore":Lorg/spongycastle/util/Store;
    :try_start_1f
    invoke-interface {v2, p0}, Lorg/spongycastle/util/Store;->getMatches(Lorg/spongycastle/util/Selector;)Ljava/util/Collection;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "it":Ljava/util/Iterator;
    :goto_27
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_e

    .line 733
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 735
    .local v0, "cert":Ljava/lang/Object;
    instance-of v8, v0, Lorg/spongycastle/util/Encodable;

    if-eqz v8, :cond_51

    .line 737
    new-instance v8, Ljava/io/ByteArrayInputStream;

    check-cast v0, Lorg/spongycastle/util/Encodable;

    .end local v0    # "cert":Ljava/lang/Object;
    invoke-interface {v0}, Lorg/spongycastle/util/Encodable;->getEncoded()[B

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-virtual {v1, v8}, Lorg/spongycastle/jcajce/provider/asymmetric/x509/CertificateFactory;->engineGenerateCertificate(Ljava/io/InputStream;)Ljava/security/cert/Certificate;

    move-result-object v8

    invoke-interface {v3, v8}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_47
    .catch Lorg/spongycastle/util/StoreException; {:try_start_1f .. :try_end_47} :catch_48
    .catch Ljava/io/IOException; {:try_start_1f .. :try_end_47} :catch_59
    .catch Ljava/security/cert/CertificateException; {:try_start_1f .. :try_end_47} :catch_6a

    goto :goto_27

    .line 750
    .end local v5    # "it":Ljava/util/Iterator;
    :catch_48
    move-exception v4

    .line 752
    .local v4, "e":Lorg/spongycastle/util/StoreException;
    new-instance v8, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v9, "Problem while picking certificates from X.509 store."

    invoke-direct {v8, v9, v4}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v8

    .line 739
    .end local v4    # "e":Lorg/spongycastle/util/StoreException;
    .restart local v0    # "cert":Ljava/lang/Object;
    .restart local v5    # "it":Ljava/util/Iterator;
    :cond_51
    :try_start_51
    instance-of v8, v0, Ljava/security/cert/Certificate;

    if-eqz v8, :cond_62

    .line 741
    invoke-interface {v3, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_58
    .catch Lorg/spongycastle/util/StoreException; {:try_start_51 .. :try_end_58} :catch_48
    .catch Ljava/io/IOException; {:try_start_51 .. :try_end_58} :catch_59
    .catch Ljava/security/cert/CertificateException; {:try_start_51 .. :try_end_58} :catch_6a

    goto :goto_27

    .line 755
    .end local v0    # "cert":Ljava/lang/Object;
    .end local v5    # "it":Ljava/util/Iterator;
    :catch_59
    move-exception v4

    .line 757
    .local v4, "e":Ljava/io/IOException;
    new-instance v8, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v9, "Problem while extracting certificates from X.509 store."

    invoke-direct {v8, v9, v4}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v8

    .line 745
    .end local v4    # "e":Ljava/io/IOException;
    .restart local v0    # "cert":Ljava/lang/Object;
    .restart local v5    # "it":Ljava/util/Iterator;
    :cond_62
    :try_start_62
    new-instance v8, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v9, "Unknown object found in certificate store."

    invoke-direct {v8, v9}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;)V

    throw v8
    :try_end_6a
    .catch Lorg/spongycastle/util/StoreException; {:try_start_62 .. :try_end_6a} :catch_48
    .catch Ljava/io/IOException; {:try_start_62 .. :try_end_6a} :catch_59
    .catch Ljava/security/cert/CertificateException; {:try_start_62 .. :try_end_6a} :catch_6a

    .line 760
    .end local v0    # "cert":Ljava/lang/Object;
    .end local v5    # "it":Ljava/util/Iterator;
    :catch_6a
    move-exception v4

    .line 762
    .local v4, "e":Ljava/security/cert/CertificateException;
    new-instance v8, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v9, "Problem while extracting certificates from X.509 store."

    invoke-direct {v8, v9, v4}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v8

    .end local v2    # "certStore":Lorg/spongycastle/util/Store;
    .end local v4    # "e":Ljava/security/cert/CertificateException;
    :cond_73
    move-object v2, v7

    .line 768
    check-cast v2, Ljava/security/cert/CertStore;

    .line 772
    .local v2, "certStore":Ljava/security/cert/CertStore;
    :try_start_76
    invoke-virtual {v2, p0}, Ljava/security/cert/CertStore;->getCertificates(Ljava/security/cert/CertSelector;)Ljava/util/Collection;

    move-result-object v8

    invoke-interface {v3, v8}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z
    :try_end_7d
    .catch Ljava/security/cert/CertStoreException; {:try_start_76 .. :try_end_7d} :catch_7e

    goto :goto_e

    .line 774
    :catch_7e
    move-exception v4

    .line 776
    .local v4, "e":Ljava/security/cert/CertStoreException;
    new-instance v8, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v9, "Problem while picking certificates from certificate store."

    invoke-direct {v8, v9, v4}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v8

    .line 782
    .end local v2    # "certStore":Ljava/security/cert/CertStore;
    .end local v4    # "e":Ljava/security/cert/CertStoreException;
    .end local v7    # "obj":Ljava/lang/Object;
    :cond_87
    return-object v3
.end method

.method static findIssuerCerts(Ljava/security/cert/X509Certificate;Ljava/util/List;Ljava/util/List;)Ljava/util/Collection;
    .registers 12
    .param p0, "cert"    # Ljava/security/cert/X509Certificate;
    .param p1, "certStores"    # Ljava/util/List;
    .param p2, "pkixCertStores"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/jce/provider/AnnotatedException;
        }
    .end annotation

    .prologue
    .line 1446
    new-instance v6, Ljava/security/cert/X509CertSelector;

    invoke-direct {v6}, Ljava/security/cert/X509CertSelector;-><init>()V

    .line 1450
    .local v6, "selector":Ljava/security/cert/X509CertSelector;
    :try_start_5
    invoke-virtual {p0}, Ljava/security/cert/X509Certificate;->getIssuerX500Principal()Ljavax/security/auth/x500/X500Principal;

    move-result-object v7

    invoke-virtual {v7}, Ljavax/security/auth/x500/X500Principal;->getEncoded()[B

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/security/cert/X509CertSelector;->setSubject([B)V
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_10} :catch_46

    .line 1458
    new-instance v7, Lorg/spongycastle/jcajce/PKIXCertStoreSelector$Builder;

    invoke-direct {v7, v6}, Lorg/spongycastle/jcajce/PKIXCertStoreSelector$Builder;-><init>(Ljava/security/cert/CertSelector;)V

    invoke-virtual {v7}, Lorg/spongycastle/jcajce/PKIXCertStoreSelector$Builder;->build()Lorg/spongycastle/jcajce/PKIXCertStoreSelector;

    move-result-object v0

    .line 1459
    .local v0, "certSelect":Lorg/spongycastle/jcajce/PKIXCertStoreSelector;
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 1465
    .local v1, "certs":Ljava/util/Set;
    :try_start_1e
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 1467
    .local v5, "matches":Ljava/util/List;
    invoke-static {v0, p1}, Lorg/spongycastle/x509/CertPathValidatorUtilities;->findCertificates(Lorg/spongycastle/jcajce/PKIXCertStoreSelector;Ljava/util/List;)Ljava/util/Collection;

    move-result-object v7

    invoke-interface {v5, v7}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 1468
    invoke-static {v0, p2}, Lorg/spongycastle/x509/CertPathValidatorUtilities;->findCertificates(Lorg/spongycastle/jcajce/PKIXCertStoreSelector;Ljava/util/List;)Ljava/util/Collection;

    move-result-object v7

    invoke-interface {v5, v7}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 1470
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;
    :try_end_34
    .catch Lorg/spongycastle/jce/provider/AnnotatedException; {:try_start_1e .. :try_end_34} :catch_4f

    move-result-object v4

    .line 1477
    .local v4, "iter":Ljava/util/Iterator;
    const/4 v3, 0x0

    .line 1478
    .local v3, "issuer":Ljava/security/cert/X509Certificate;
    :goto_36
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_58

    .line 1480
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .end local v3    # "issuer":Ljava/security/cert/X509Certificate;
    check-cast v3, Ljava/security/cert/X509Certificate;

    .line 1483
    .restart local v3    # "issuer":Ljava/security/cert/X509Certificate;
    invoke-interface {v1, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_36

    .line 1452
    .end local v0    # "certSelect":Lorg/spongycastle/jcajce/PKIXCertStoreSelector;
    .end local v1    # "certs":Ljava/util/Set;
    .end local v3    # "issuer":Ljava/security/cert/X509Certificate;
    .end local v4    # "iter":Ljava/util/Iterator;
    .end local v5    # "matches":Ljava/util/List;
    :catch_46
    move-exception v2

    .line 1454
    .local v2, "e":Ljava/io/IOException;
    new-instance v7, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v8, "Subject criteria for certificate selector to find issuer certificate could not be set."

    invoke-direct {v7, v8, v2}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v7

    .line 1472
    .end local v2    # "e":Ljava/io/IOException;
    .restart local v0    # "certSelect":Lorg/spongycastle/jcajce/PKIXCertStoreSelector;
    .restart local v1    # "certs":Ljava/util/Set;
    :catch_4f
    move-exception v2

    .line 1474
    .local v2, "e":Lorg/spongycastle/jce/provider/AnnotatedException;
    new-instance v7, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v8, "Issuer certificate cannot be searched."

    invoke-direct {v7, v8, v2}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v7

    .line 1485
    .end local v2    # "e":Lorg/spongycastle/jce/provider/AnnotatedException;
    .restart local v3    # "issuer":Ljava/security/cert/X509Certificate;
    .restart local v4    # "iter":Ljava/util/Iterator;
    .restart local v5    # "matches":Ljava/util/List;
    :cond_58
    return-object v1
.end method

.method protected static findTrustAnchor(Ljava/security/cert/X509Certificate;Ljava/util/Set;)Ljava/security/cert/TrustAnchor;
    .registers 3
    .param p0, "cert"    # Ljava/security/cert/X509Certificate;
    .param p1, "trustAnchors"    # Ljava/util/Set;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/jce/provider/AnnotatedException;
        }
    .end annotation

    .prologue
    .line 137
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/spongycastle/x509/CertPathValidatorUtilities;->findTrustAnchor(Ljava/security/cert/X509Certificate;Ljava/util/Set;Ljava/lang/String;)Ljava/security/cert/TrustAnchor;

    move-result-object v0

    return-object v0
.end method

.method protected static findTrustAnchor(Ljava/security/cert/X509Certificate;Ljava/util/Set;Ljava/lang/String;)Ljava/security/cert/TrustAnchor;
    .registers 13
    .param p0, "cert"    # Ljava/security/cert/X509Certificate;
    .param p1, "trustAnchors"    # Ljava/util/Set;
    .param p2, "sigProvider"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/jce/provider/AnnotatedException;
        }
    .end annotation

    .prologue
    .line 160
    const/4 v6, 0x0

    .line 161
    .local v6, "trust":Ljava/security/cert/TrustAnchor;
    const/4 v7, 0x0

    .line 162
    .local v7, "trustPublicKey":Ljava/security/PublicKey;
    const/4 v4, 0x0

    .line 164
    .local v4, "invalidKeyEx":Ljava/lang/Exception;
    new-instance v2, Ljava/security/cert/X509CertSelector;

    invoke-direct {v2}, Ljava/security/cert/X509CertSelector;-><init>()V

    .line 165
    .local v2, "certSelectX509":Ljava/security/cert/X509CertSelector;
    invoke-static {p0}, Lorg/spongycastle/x509/CertPathValidatorUtilities;->getEncodedIssuerPrincipal(Ljava/lang/Object;)Ljavax/security/auth/x500/X500Principal;

    move-result-object v1

    .line 169
    .local v1, "certIssuer":Ljavax/security/auth/x500/X500Principal;
    :try_start_c
    invoke-virtual {v1}, Ljavax/security/auth/x500/X500Principal;->getEncoded()[B

    move-result-object v8

    invoke-virtual {v2, v8}, Ljava/security/cert/X509CertSelector;->setSubject([B)V
    :try_end_13
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_13} :catch_48

    .line 176
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .line 177
    .local v5, "iter":Ljava/util/Iterator;
    :cond_17
    :goto_17
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_7a

    if-nez v6, :cond_7a

    .line 179
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    .end local v6    # "trust":Ljava/security/cert/TrustAnchor;
    check-cast v6, Ljava/security/cert/TrustAnchor;

    .line 180
    .restart local v6    # "trust":Ljava/security/cert/TrustAnchor;
    invoke-virtual {v6}, Ljava/security/cert/TrustAnchor;->getTrustedCert()Ljava/security/cert/X509Certificate;

    move-result-object v8

    if-eqz v8, :cond_53

    .line 182
    invoke-virtual {v6}, Ljava/security/cert/TrustAnchor;->getTrustedCert()Ljava/security/cert/X509Certificate;

    move-result-object v8

    invoke-virtual {v2, v8}, Ljava/security/cert/X509CertSelector;->match(Ljava/security/cert/Certificate;)Z

    move-result v8

    if-eqz v8, :cond_51

    .line 184
    invoke-virtual {v6}, Ljava/security/cert/TrustAnchor;->getTrustedCert()Ljava/security/cert/X509Certificate;

    move-result-object v8

    invoke-virtual {v8}, Ljava/security/cert/X509Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v7

    .line 216
    :goto_3d
    if-eqz v7, :cond_17

    .line 220
    :try_start_3f
    invoke-static {p0, v7, p2}, Lorg/spongycastle/x509/CertPathValidatorUtilities;->verifyX509Certificate(Ljava/security/cert/X509Certificate;Ljava/security/PublicKey;Ljava/lang/String;)V
    :try_end_42
    .catch Ljava/lang/Exception; {:try_start_3f .. :try_end_42} :catch_43

    goto :goto_17

    .line 222
    :catch_43
    move-exception v3

    .line 224
    .local v3, "ex":Ljava/lang/Exception;
    move-object v4, v3

    .line 225
    const/4 v6, 0x0

    .line 226
    const/4 v7, 0x0

    .line 227
    goto :goto_17

    .line 171
    .end local v3    # "ex":Ljava/lang/Exception;
    .end local v5    # "iter":Ljava/util/Iterator;
    :catch_48
    move-exception v3

    .line 173
    .local v3, "ex":Ljava/io/IOException;
    new-instance v8, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v9, "Cannot set subject search criteria for trust anchor."

    invoke-direct {v8, v9, v3}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v8

    .line 188
    .end local v3    # "ex":Ljava/io/IOException;
    .restart local v5    # "iter":Ljava/util/Iterator;
    :cond_51
    const/4 v6, 0x0

    goto :goto_3d

    .line 191
    :cond_53
    invoke-virtual {v6}, Ljava/security/cert/TrustAnchor;->getCAName()Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_78

    .line 192
    invoke-virtual {v6}, Ljava/security/cert/TrustAnchor;->getCAPublicKey()Ljava/security/PublicKey;

    move-result-object v8

    if-eqz v8, :cond_78

    .line 196
    :try_start_5f
    new-instance v0, Ljavax/security/auth/x500/X500Principal;

    invoke-virtual {v6}, Ljava/security/cert/TrustAnchor;->getCAName()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v0, v8}, Ljavax/security/auth/x500/X500Principal;-><init>(Ljava/lang/String;)V

    .line 197
    .local v0, "caName":Ljavax/security/auth/x500/X500Principal;
    invoke-virtual {v1, v0}, Ljavax/security/auth/x500/X500Principal;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_73

    .line 199
    invoke-virtual {v6}, Ljava/security/cert/TrustAnchor;->getCAPublicKey()Ljava/security/PublicKey;
    :try_end_71
    .catch Ljava/lang/IllegalArgumentException; {:try_start_5f .. :try_end_71} :catch_75

    move-result-object v7

    goto :goto_3d

    .line 203
    :cond_73
    const/4 v6, 0x0

    goto :goto_3d

    .line 206
    .end local v0    # "caName":Ljavax/security/auth/x500/X500Principal;
    :catch_75
    move-exception v3

    .line 208
    .local v3, "ex":Ljava/lang/IllegalArgumentException;
    const/4 v6, 0x0

    .line 209
    goto :goto_3d

    .line 213
    .end local v3    # "ex":Ljava/lang/IllegalArgumentException;
    :cond_78
    const/4 v6, 0x0

    goto :goto_3d

    .line 231
    :cond_7a
    if-nez v6, :cond_86

    if-eqz v4, :cond_86

    .line 233
    new-instance v8, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v9, "TrustAnchor found but certificate validation failed."

    invoke-direct {v8, v9, v4}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v8

    .line 236
    :cond_86
    return-object v6
.end method

.method protected static getAlgorithmIdentifier(Ljava/security/PublicKey;)Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;
    .registers 6
    .param p0, "key"    # Ljava/security/PublicKey;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertPathValidatorException;
        }
    .end annotation

    .prologue
    .line 356
    :try_start_0
    new-instance v0, Lorg/spongycastle/asn1/ASN1InputStream;

    invoke-interface {p0}, Ljava/security/PublicKey;->getEncoded()[B

    move-result-object v3

    invoke-direct {v0, v3}, Lorg/spongycastle/asn1/ASN1InputStream;-><init>([B)V

    .line 358
    .local v0, "aIn":Lorg/spongycastle/asn1/ASN1InputStream;
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1InputStream;->readObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v3

    invoke-static {v3}, Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;

    move-result-object v2

    .line 360
    .local v2, "info":Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;
    invoke-virtual {v2}, Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;->getAlgorithmId()Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_14} :catch_16

    move-result-object v3

    return-object v3

    .line 362
    .end local v0    # "aIn":Lorg/spongycastle/asn1/ASN1InputStream;
    .end local v2    # "info":Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;
    :catch_16
    move-exception v1

    .line 364
    .local v1, "e":Ljava/lang/Exception;
    new-instance v3, Lorg/spongycastle/jce/exception/ExtCertPathValidatorException;

    const-string v4, "Subject public key cannot be decoded."

    invoke-direct {v3, v4, v1}, Lorg/spongycastle/jce/exception/ExtCertPathValidatorException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method protected static getCRLIssuersFromDistributionPoint(Lorg/spongycastle/asn1/x509/DistributionPoint;Ljava/util/Collection;Ljava/security/cert/X509CRLSelector;Lorg/spongycastle/x509/ExtendedPKIXParameters;)V
    .registers 12
    .param p0, "dp"    # Lorg/spongycastle/asn1/x509/DistributionPoint;
    .param p1, "issuerPrincipals"    # Ljava/util/Collection;
    .param p2, "selector"    # Ljava/security/cert/X509CRLSelector;
    .param p3, "pkixParams"    # Lorg/spongycastle/x509/ExtendedPKIXParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/jce/provider/AnnotatedException;
        }
    .end annotation

    .prologue
    .line 926
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 928
    .local v3, "issuers":Ljava/util/List;
    invoke-virtual {p0}, Lorg/spongycastle/asn1/x509/DistributionPoint;->getCRLIssuer()Lorg/spongycastle/asn1/x509/GeneralNames;

    move-result-object v6

    if-eqz v6, :cond_42

    .line 930
    invoke-virtual {p0}, Lorg/spongycastle/asn1/x509/DistributionPoint;->getCRLIssuer()Lorg/spongycastle/asn1/x509/GeneralNames;

    move-result-object v6

    invoke-virtual {v6}, Lorg/spongycastle/asn1/x509/GeneralNames;->getNames()[Lorg/spongycastle/asn1/x509/GeneralName;

    move-result-object v2

    .line 932
    .local v2, "genNames":[Lorg/spongycastle/asn1/x509/GeneralName;
    const/4 v5, 0x0

    .local v5, "j":I
    :goto_14
    array-length v6, v2

    if-ge v5, v6, :cond_64

    .line 934
    aget-object v6, v2, v5

    invoke-virtual {v6}, Lorg/spongycastle/asn1/x509/GeneralName;->getTagNo()I

    move-result v6

    const/4 v7, 0x4

    if-ne v6, v7, :cond_36

    .line 938
    :try_start_20
    new-instance v6, Ljavax/security/auth/x500/X500Principal;

    aget-object v7, v2, v5

    invoke-virtual {v7}, Lorg/spongycastle/asn1/x509/GeneralName;->getName()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v7

    .line 939
    invoke-interface {v7}, Lorg/spongycastle/asn1/ASN1Encodable;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v7

    invoke-virtual {v7}, Lorg/spongycastle/asn1/ASN1Primitive;->getEncoded()[B

    move-result-object v7

    invoke-direct {v6, v7}, Ljavax/security/auth/x500/X500Principal;-><init>([B)V

    .line 938
    invoke-interface {v3, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_36
    .catch Ljava/io/IOException; {:try_start_20 .. :try_end_36} :catch_39

    .line 932
    :cond_36
    add-int/lit8 v5, v5, 0x1

    goto :goto_14

    .line 941
    :catch_39
    move-exception v0

    .line 943
    .local v0, "e":Ljava/io/IOException;
    new-instance v6, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v7, "CRL issuer information from distribution point cannot be decoded."

    invoke-direct {v6, v7, v0}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 956
    .end local v0    # "e":Ljava/io/IOException;
    .end local v2    # "genNames":[Lorg/spongycastle/asn1/x509/GeneralName;
    .end local v5    # "j":I
    :cond_42
    invoke-virtual {p0}, Lorg/spongycastle/asn1/x509/DistributionPoint;->getDistributionPoint()Lorg/spongycastle/asn1/x509/DistributionPointName;

    move-result-object v6

    if-nez v6, :cond_50

    .line 958
    new-instance v6, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v7, "CRL issuer is omitted from distribution point but no distributionPoint field present."

    invoke-direct {v6, v7}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 962
    :cond_50
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "it":Ljava/util/Iterator;
    :goto_54
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_64

    .line 964
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljavax/security/auth/x500/X500Principal;

    invoke-interface {v3, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_54

    .line 1011
    .end local v4    # "it":Ljava/util/Iterator;
    :cond_64
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 1012
    .restart local v4    # "it":Ljava/util/Iterator;
    :goto_68
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_85

    .line 1016
    :try_start_6e
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljavax/security/auth/x500/X500Principal;

    invoke-virtual {v6}, Ljavax/security/auth/x500/X500Principal;->getEncoded()[B

    move-result-object v6

    invoke-virtual {p2, v6}, Ljava/security/cert/X509CRLSelector;->addIssuerName([B)V
    :try_end_7b
    .catch Ljava/io/IOException; {:try_start_6e .. :try_end_7b} :catch_7c

    goto :goto_68

    .line 1018
    :catch_7c
    move-exception v1

    .line 1020
    .local v1, "ex":Ljava/io/IOException;
    new-instance v6, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v7, "Cannot decode CRL issuer information."

    invoke-direct {v6, v7, v1}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 1024
    .end local v1    # "ex":Ljava/io/IOException;
    :cond_85
    return-void
.end method

.method protected static getCertStatus(Ljava/util/Date;Ljava/security/cert/X509CRL;Ljava/lang/Object;Lorg/spongycastle/x509/CertStatus;)V
    .registers 14
    .param p0, "validDate"    # Ljava/util/Date;
    .param p1, "crl"    # Ljava/security/cert/X509CRL;
    .param p2, "cert"    # Ljava/lang/Object;
    .param p3, "certStatus"    # Lorg/spongycastle/x509/CertStatus;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/jce/provider/AnnotatedException;
        }
    .end annotation

    .prologue
    .line 1046
    const/4 v1, 0x0

    .line 1051
    .local v1, "crl_entry":Ljava/security/cert/X509CRLEntry;
    :try_start_1
    invoke-static {p1}, Lorg/spongycastle/x509/CertPathValidatorUtilities;->isIndirectCRL(Ljava/security/cert/X509CRL;)Z
    :try_end_4
    .catch Ljava/security/cert/CRLException; {:try_start_1 .. :try_end_4} :catch_12

    move-result v4

    .line 1058
    .local v4, "isIndirect":Z
    if-eqz v4, :cond_98

    .line 1060
    invoke-static {p2}, Lorg/spongycastle/x509/CertPathValidatorUtilities;->getSerialNumber(Ljava/lang/Object;)Ljava/math/BigInteger;

    move-result-object v6

    invoke-virtual {p1, v6}, Ljava/security/cert/X509CRL;->getRevokedCertificate(Ljava/math/BigInteger;)Ljava/security/cert/X509CRLEntry;

    move-result-object v1

    .line 1062
    if-nez v1, :cond_1b

    .line 1133
    :cond_11
    :goto_11
    return-void

    .line 1053
    .end local v4    # "isIndirect":Z
    :catch_12
    move-exception v3

    .line 1055
    .local v3, "exception":Ljava/security/cert/CRLException;
    new-instance v6, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v7, "Failed check for indirect CRL."

    invoke-direct {v6, v7, v3}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 1067
    .end local v3    # "exception":Ljava/security/cert/CRLException;
    .restart local v4    # "isIndirect":Z
    :cond_1b
    invoke-virtual {v1}, Ljava/security/cert/X509CRLEntry;->getCertificateIssuer()Ljavax/security/auth/x500/X500Principal;

    move-result-object v0

    .line 1069
    .local v0, "certIssuer":Ljavax/security/auth/x500/X500Principal;
    if-nez v0, :cond_25

    .line 1071
    invoke-static {p1}, Lorg/spongycastle/x509/CertPathValidatorUtilities;->getIssuerPrincipal(Ljava/security/cert/X509CRL;)Ljavax/security/auth/x500/X500Principal;

    move-result-object v0

    .line 1074
    :cond_25
    invoke-static {p2}, Lorg/spongycastle/x509/CertPathValidatorUtilities;->getEncodedIssuerPrincipal(Ljava/lang/Object;)Ljavax/security/auth/x500/X500Principal;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljavax/security/auth/x500/X500Principal;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_11

    .line 1093
    .end local v0    # "certIssuer":Ljavax/security/auth/x500/X500Principal;
    :cond_2f
    const/4 v5, 0x0

    .line 1094
    .local v5, "reasonCode":Lorg/spongycastle/asn1/ASN1Enumerated;
    invoke-virtual {v1}, Ljava/security/cert/X509CRLEntry;->hasExtensions()Z

    move-result v6

    if-eqz v6, :cond_44

    .line 1098
    :try_start_36
    sget-object v6, Lorg/spongycastle/asn1/x509/X509Extension;->reasonCode:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 1101
    invoke-virtual {v6}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v6

    .line 1100
    invoke-static {v1, v6}, Lorg/spongycastle/x509/CertPathValidatorUtilities;->getExtensionValue(Ljava/security/cert/X509Extension;Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v6

    .line 1099
    invoke-static {v6}, Lorg/spongycastle/asn1/ASN1Enumerated;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Enumerated;
    :try_end_43
    .catch Ljava/lang/Exception; {:try_start_36 .. :try_end_43} :catch_b2

    move-result-object v5

    .line 1113
    :cond_44
    invoke-virtual {p0}, Ljava/util/Date;->getTime()J

    move-result-wide v6

    invoke-virtual {v1}, Ljava/security/cert/X509CRLEntry;->getRevocationDate()Ljava/util/Date;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/Date;->getTime()J

    move-result-wide v8

    cmp-long v6, v6, v8

    if-gez v6, :cond_82

    if-eqz v5, :cond_82

    .line 1115
    invoke-virtual {v5}, Lorg/spongycastle/asn1/ASN1Enumerated;->getValue()Ljava/math/BigInteger;

    move-result-object v6

    invoke-virtual {v6}, Ljava/math/BigInteger;->intValue()I

    move-result v6

    if-eqz v6, :cond_82

    .line 1116
    invoke-virtual {v5}, Lorg/spongycastle/asn1/ASN1Enumerated;->getValue()Ljava/math/BigInteger;

    move-result-object v6

    invoke-virtual {v6}, Ljava/math/BigInteger;->intValue()I

    move-result v6

    const/4 v7, 0x1

    if-eq v6, v7, :cond_82

    .line 1117
    invoke-virtual {v5}, Lorg/spongycastle/asn1/ASN1Enumerated;->getValue()Ljava/math/BigInteger;

    move-result-object v6

    invoke-virtual {v6}, Ljava/math/BigInteger;->intValue()I

    move-result v6

    const/4 v7, 0x2

    if-eq v6, v7, :cond_82

    .line 1118
    invoke-virtual {v5}, Lorg/spongycastle/asn1/ASN1Enumerated;->getValue()Ljava/math/BigInteger;

    move-result-object v6

    invoke-virtual {v6}, Ljava/math/BigInteger;->intValue()I

    move-result v6

    const/16 v7, 0x8

    if-ne v6, v7, :cond_11

    .line 1122
    :cond_82
    if-eqz v5, :cond_bb

    .line 1124
    invoke-virtual {v5}, Lorg/spongycastle/asn1/ASN1Enumerated;->getValue()Ljava/math/BigInteger;

    move-result-object v6

    invoke-virtual {v6}, Ljava/math/BigInteger;->intValue()I

    move-result v6

    invoke-virtual {p3, v6}, Lorg/spongycastle/x509/CertStatus;->setCertStatus(I)V

    .line 1131
    :goto_8f
    invoke-virtual {v1}, Ljava/security/cert/X509CRLEntry;->getRevocationDate()Ljava/util/Date;

    move-result-object v6

    invoke-virtual {p3, v6}, Lorg/spongycastle/x509/CertStatus;->setRevocationDate(Ljava/util/Date;)V

    goto/16 :goto_11

    .line 1079
    .end local v5    # "reasonCode":Lorg/spongycastle/asn1/ASN1Enumerated;
    :cond_98
    invoke-static {p2}, Lorg/spongycastle/x509/CertPathValidatorUtilities;->getEncodedIssuerPrincipal(Ljava/lang/Object;)Ljavax/security/auth/x500/X500Principal;

    move-result-object v6

    invoke-static {p1}, Lorg/spongycastle/x509/CertPathValidatorUtilities;->getIssuerPrincipal(Ljava/security/cert/X509CRL;)Ljavax/security/auth/x500/X500Principal;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljavax/security/auth/x500/X500Principal;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_11

    .line 1085
    invoke-static {p2}, Lorg/spongycastle/x509/CertPathValidatorUtilities;->getSerialNumber(Ljava/lang/Object;)Ljava/math/BigInteger;

    move-result-object v6

    invoke-virtual {p1, v6}, Ljava/security/cert/X509CRL;->getRevokedCertificate(Ljava/math/BigInteger;)Ljava/security/cert/X509CRLEntry;

    move-result-object v1

    .line 1087
    if-nez v1, :cond_2f

    goto/16 :goto_11

    .line 1103
    .restart local v5    # "reasonCode":Lorg/spongycastle/asn1/ASN1Enumerated;
    :catch_b2
    move-exception v2

    .line 1105
    .local v2, "e":Ljava/lang/Exception;
    new-instance v6, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v7, "Reason code CRL entry extension could not be decoded."

    invoke-direct {v6, v7, v2}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 1129
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_bb
    const/4 v6, 0x0

    invoke-virtual {p3, v6}, Lorg/spongycastle/x509/CertStatus;->setCertStatus(I)V

    goto :goto_8f
.end method

.method protected static getCompleteCRLs(Lorg/spongycastle/asn1/x509/DistributionPoint;Ljava/lang/Object;Ljava/util/Date;Lorg/spongycastle/x509/ExtendedPKIXParameters;)Ljava/util/Set;
    .registers 15
    .param p0, "dp"    # Lorg/spongycastle/asn1/x509/DistributionPoint;
    .param p1, "cert"    # Ljava/lang/Object;
    .param p2, "currentDate"    # Ljava/util/Date;
    .param p3, "paramsPKIX"    # Lorg/spongycastle/x509/ExtendedPKIXParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/jce/provider/AnnotatedException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x0

    .line 1251
    new-instance v3, Lorg/spongycastle/x509/X509CRLStoreSelector;

    invoke-direct {v3}, Lorg/spongycastle/x509/X509CRLStoreSelector;-><init>()V

    .line 1254
    .local v3, "crlselect":Lorg/spongycastle/x509/X509CRLStoreSelector;
    :try_start_6
    new-instance v5, Ljava/util/HashSet;

    invoke-direct {v5}, Ljava/util/HashSet;-><init>()V

    .line 1255
    .local v5, "issuers":Ljava/util/Set;
    instance-of v7, p1, Lorg/spongycastle/x509/X509AttributeCertificate;

    if-eqz v7, :cond_6e

    .line 1257
    move-object v0, p1

    check-cast v0, Lorg/spongycastle/x509/X509AttributeCertificate;

    move-object v7, v0

    .line 1258
    invoke-interface {v7}, Lorg/spongycastle/x509/X509AttributeCertificate;->getIssuer()Lorg/spongycastle/x509/AttributeCertificateIssuer;

    move-result-object v7

    invoke-virtual {v7}, Lorg/spongycastle/x509/AttributeCertificateIssuer;->getPrincipals()[Ljava/security/Principal;

    move-result-object v7

    const/4 v8, 0x0

    aget-object v7, v7, v8

    .line 1257
    invoke-interface {v5, v7}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1264
    :goto_21
    invoke-static {p0, v5, v3, p3}, Lorg/spongycastle/x509/CertPathValidatorUtilities;->getCRLIssuersFromDistributionPoint(Lorg/spongycastle/asn1/x509/DistributionPoint;Ljava/util/Collection;Ljava/security/cert/X509CRLSelector;Lorg/spongycastle/x509/ExtendedPKIXParameters;)V
    :try_end_24
    .catch Lorg/spongycastle/jce/provider/AnnotatedException; {:try_start_6 .. :try_end_24} :catch_76

    .line 1271
    instance-of v7, p1, Ljava/security/cert/X509Certificate;

    if-eqz v7, :cond_7f

    move-object v7, p1

    .line 1273
    check-cast v7, Ljava/security/cert/X509Certificate;

    invoke-virtual {v3, v7}, Lorg/spongycastle/x509/X509CRLStoreSelector;->setCertificateChecking(Ljava/security/cert/X509Certificate;)V

    .line 1281
    :cond_2e
    :goto_2e
    const/4 v7, 0x1

    invoke-virtual {v3, v7}, Lorg/spongycastle/x509/X509CRLStoreSelector;->setCompleteCRLEnabled(Z)V

    .line 1283
    sget-object v7, Lorg/spongycastle/x509/CertPathValidatorUtilities;->CRL_UTIL:Lorg/spongycastle/x509/PKIXCRLUtil;

    invoke-virtual {v7, v3, p3, p2}, Lorg/spongycastle/x509/PKIXCRLUtil;->findCRLs(Lorg/spongycastle/x509/X509CRLStoreSelector;Lorg/spongycastle/x509/ExtendedPKIXParameters;Ljava/util/Date;)Ljava/util/Set;

    move-result-object v2

    .line 1285
    .local v2, "crls":Ljava/util/Set;
    invoke-interface {v2}, Ljava/util/Set;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_b0

    .line 1287
    instance-of v7, p1, Lorg/spongycastle/x509/X509AttributeCertificate;

    if-eqz v7, :cond_8a

    move-object v1, p1

    .line 1289
    check-cast v1, Lorg/spongycastle/x509/X509AttributeCertificate;

    .line 1291
    .local v1, "aCert":Lorg/spongycastle/x509/X509AttributeCertificate;
    new-instance v7, Lorg/spongycastle/jce/provider/AnnotatedException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "No CRLs found for issuer \""

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-interface {v1}, Lorg/spongycastle/x509/X509AttributeCertificate;->getIssuer()Lorg/spongycastle/x509/AttributeCertificateIssuer;

    move-result-object v9

    invoke-virtual {v9}, Lorg/spongycastle/x509/AttributeCertificateIssuer;->getPrincipals()[Ljava/security/Principal;

    move-result-object v9

    aget-object v9, v9, v10

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "\""

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 1262
    .end local v1    # "aCert":Lorg/spongycastle/x509/X509AttributeCertificate;
    .end local v2    # "crls":Ljava/util/Set;
    :cond_6e
    :try_start_6e
    invoke-static {p1}, Lorg/spongycastle/x509/CertPathValidatorUtilities;->getEncodedIssuerPrincipal(Ljava/lang/Object;)Ljavax/security/auth/x500/X500Principal;

    move-result-object v7

    invoke-interface {v5, v7}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_75
    .catch Lorg/spongycastle/jce/provider/AnnotatedException; {:try_start_6e .. :try_end_75} :catch_76

    goto :goto_21

    .line 1266
    .end local v5    # "issuers":Ljava/util/Set;
    :catch_76
    move-exception v4

    .line 1268
    .local v4, "e":Lorg/spongycastle/jce/provider/AnnotatedException;
    new-instance v7, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v8, "Could not get issuer information from distribution point."

    invoke-direct {v7, v8, v4}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v7

    .line 1275
    .end local v4    # "e":Lorg/spongycastle/jce/provider/AnnotatedException;
    .restart local v5    # "issuers":Ljava/util/Set;
    :cond_7f
    instance-of v7, p1, Lorg/spongycastle/x509/X509AttributeCertificate;

    if-eqz v7, :cond_2e

    move-object v7, p1

    .line 1277
    check-cast v7, Lorg/spongycastle/x509/X509AttributeCertificate;

    invoke-virtual {v3, v7}, Lorg/spongycastle/x509/X509CRLStoreSelector;->setAttrCertificateChecking(Lorg/spongycastle/x509/X509AttributeCertificate;)V

    goto :goto_2e

    .restart local v2    # "crls":Ljava/util/Set;
    :cond_8a
    move-object v6, p1

    .line 1295
    check-cast v6, Ljava/security/cert/X509Certificate;

    .line 1297
    .local v6, "xCert":Ljava/security/cert/X509Certificate;
    new-instance v7, Lorg/spongycastle/jce/provider/AnnotatedException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "No CRLs found for issuer \""

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v6}, Ljava/security/cert/X509Certificate;->getIssuerX500Principal()Ljavax/security/auth/x500/X500Principal;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "\""

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 1300
    .end local v6    # "xCert":Ljava/security/cert/X509Certificate;
    :cond_b0
    return-object v2
.end method

.method protected static getDeltaCRLs(Ljava/util/Date;Lorg/spongycastle/x509/ExtendedPKIXParameters;Ljava/security/cert/X509CRL;)Ljava/util/Set;
    .registers 14
    .param p0, "currentDate"    # Ljava/util/Date;
    .param p1, "paramsPKIX"    # Lorg/spongycastle/x509/ExtendedPKIXParameters;
    .param p2, "completeCRL"    # Ljava/security/cert/X509CRL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/jce/provider/AnnotatedException;
        }
    .end annotation

    .prologue
    .line 1150
    new-instance v2, Lorg/spongycastle/x509/X509CRLStoreSelector;

    invoke-direct {v2}, Lorg/spongycastle/x509/X509CRLStoreSelector;-><init>()V

    .line 1156
    .local v2, "deltaSelect":Lorg/spongycastle/x509/X509CRLStoreSelector;
    :try_start_5
    invoke-static {p2}, Lorg/spongycastle/x509/CertPathValidatorUtilities;->getIssuerPrincipal(Ljava/security/cert/X509CRL;)Ljavax/security/auth/x500/X500Principal;

    move-result-object v9

    invoke-virtual {v9}, Ljavax/security/auth/x500/X500Principal;->getEncoded()[B

    move-result-object v9

    .line 1155
    invoke-virtual {v2, v9}, Lorg/spongycastle/x509/X509CRLStoreSelector;->addIssuerName([B)V
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_10} :catch_5d

    .line 1163
    const/4 v0, 0x0

    .line 1166
    .local v0, "completeCRLNumber":Ljava/math/BigInteger;
    :try_start_11
    sget-object v9, Lorg/spongycastle/x509/CertPathValidatorUtilities;->CRL_NUMBER:Ljava/lang/String;

    invoke-static {p2, v9}, Lorg/spongycastle/x509/CertPathValidatorUtilities;->getExtensionValue(Ljava/security/cert/X509Extension;Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v3

    .line 1168
    .local v3, "derObject":Lorg/spongycastle/asn1/ASN1Primitive;
    if-eqz v3, :cond_21

    .line 1170
    invoke-static {v3}, Lorg/spongycastle/asn1/ASN1Integer;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Integer;

    move-result-object v9

    invoke-virtual {v9}, Lorg/spongycastle/asn1/ASN1Integer;->getPositiveValue()Ljava/math/BigInteger;
    :try_end_20
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_20} :catch_66

    move-result-object v0

    .line 1180
    :cond_21
    const/4 v5, 0x0

    .line 1183
    .local v5, "idp":[B
    :try_start_22
    sget-object v9, Lorg/spongycastle/x509/CertPathValidatorUtilities;->ISSUING_DISTRIBUTION_POINT:Ljava/lang/String;

    invoke-virtual {p2, v9}, Ljava/security/cert/X509CRL;->getExtensionValue(Ljava/lang/String;)[B
    :try_end_27
    .catch Ljava/lang/Exception; {:try_start_22 .. :try_end_27} :catch_6f

    move-result-object v5

    .line 1194
    if-nez v0, :cond_78

    const/4 v9, 0x0

    :goto_2b
    invoke-virtual {v2, v9}, Lorg/spongycastle/x509/X509CRLStoreSelector;->setMinCRLNumber(Ljava/math/BigInteger;)V

    .line 1197
    invoke-virtual {v2, v5}, Lorg/spongycastle/x509/X509CRLStoreSelector;->setIssuingDistributionPoint([B)V

    .line 1198
    const/4 v9, 0x1

    invoke-virtual {v2, v9}, Lorg/spongycastle/x509/X509CRLStoreSelector;->setIssuingDistributionPointEnabled(Z)V

    .line 1201
    invoke-virtual {v2, v0}, Lorg/spongycastle/x509/X509CRLStoreSelector;->setMaxBaseCRLNumber(Ljava/math/BigInteger;)V

    .line 1204
    sget-object v9, Lorg/spongycastle/x509/CertPathValidatorUtilities;->CRL_UTIL:Lorg/spongycastle/x509/PKIXCRLUtil;

    invoke-virtual {v9, v2, p1, p0}, Lorg/spongycastle/x509/PKIXCRLUtil;->findCRLs(Lorg/spongycastle/x509/X509CRLStoreSelector;Lorg/spongycastle/x509/ExtendedPKIXParameters;Ljava/util/Date;)Ljava/util/Set;

    move-result-object v8

    .line 1206
    .local v8, "temp":Ljava/util/Set;
    new-instance v7, Ljava/util/HashSet;

    invoke-direct {v7}, Ljava/util/HashSet;-><init>()V

    .line 1208
    .local v7, "result":Ljava/util/Set;
    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "it":Ljava/util/Iterator;
    :cond_47
    :goto_47
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_83

    .line 1210
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/security/cert/X509CRL;

    .line 1212
    .local v1, "crl":Ljava/security/cert/X509CRL;
    invoke-static {v1}, Lorg/spongycastle/x509/CertPathValidatorUtilities;->isDeltaCRL(Ljava/security/cert/X509CRL;)Z

    move-result v9

    if-eqz v9, :cond_47

    .line 1214
    invoke-interface {v7, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_47

    .line 1158
    .end local v0    # "completeCRLNumber":Ljava/math/BigInteger;
    .end local v1    # "crl":Ljava/security/cert/X509CRL;
    .end local v3    # "derObject":Lorg/spongycastle/asn1/ASN1Primitive;
    .end local v5    # "idp":[B
    .end local v6    # "it":Ljava/util/Iterator;
    .end local v7    # "result":Ljava/util/Set;
    .end local v8    # "temp":Ljava/util/Set;
    :catch_5d
    move-exception v4

    .line 1160
    .local v4, "e":Ljava/io/IOException;
    new-instance v9, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v10, "Cannot extract issuer from CRL."

    invoke-direct {v9, v10, v4}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v9

    .line 1173
    .end local v4    # "e":Ljava/io/IOException;
    .restart local v0    # "completeCRLNumber":Ljava/math/BigInteger;
    :catch_66
    move-exception v4

    .line 1175
    .local v4, "e":Ljava/lang/Exception;
    new-instance v9, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v10, "CRL number extension could not be extracted from CRL."

    invoke-direct {v9, v10, v4}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v9

    .line 1185
    .end local v4    # "e":Ljava/lang/Exception;
    .restart local v3    # "derObject":Lorg/spongycastle/asn1/ASN1Primitive;
    .restart local v5    # "idp":[B
    :catch_6f
    move-exception v4

    .line 1187
    .restart local v4    # "e":Ljava/lang/Exception;
    new-instance v9, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v10, "Issuing distribution point extension value could not be read."

    invoke-direct {v9, v10, v4}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v9

    .line 1194
    .end local v4    # "e":Ljava/lang/Exception;
    :cond_78
    const-wide/16 v9, 0x1

    .line 1195
    invoke-static {v9, v10}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v9

    invoke-virtual {v0, v9}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v9

    goto :goto_2b

    .line 1218
    .restart local v6    # "it":Ljava/util/Iterator;
    .restart local v7    # "result":Ljava/util/Set;
    .restart local v8    # "temp":Ljava/util/Set;
    :cond_83
    return-object v7
.end method

.method protected static getEncodedIssuerPrincipal(Ljava/lang/Object;)Ljavax/security/auth/x500/X500Principal;
    .registers 3
    .param p0, "cert"    # Ljava/lang/Object;

    .prologue
    .line 272
    instance-of v0, p0, Ljava/security/cert/X509Certificate;

    if-eqz v0, :cond_b

    .line 274
    check-cast p0, Ljava/security/cert/X509Certificate;

    .end local p0    # "cert":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/security/cert/X509Certificate;->getIssuerX500Principal()Ljavax/security/auth/x500/X500Principal;

    move-result-object v0

    .line 278
    :goto_a
    return-object v0

    .restart local p0    # "cert":Ljava/lang/Object;
    :cond_b
    check-cast p0, Lorg/spongycastle/x509/X509AttributeCertificate;

    .end local p0    # "cert":Ljava/lang/Object;
    invoke-interface {p0}, Lorg/spongycastle/x509/X509AttributeCertificate;->getIssuer()Lorg/spongycastle/x509/AttributeCertificateIssuer;

    move-result-object v0

    invoke-virtual {v0}, Lorg/spongycastle/x509/AttributeCertificateIssuer;->getPrincipals()[Ljava/security/Principal;

    move-result-object v0

    const/4 v1, 0x0

    aget-object v0, v0, v1

    check-cast v0, Ljavax/security/auth/x500/X500Principal;

    goto :goto_a
.end method

.method protected static getExtensionValue(Ljava/security/cert/X509Extension;Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 4
    .param p0, "ext"    # Ljava/security/cert/X509Extension;
    .param p1, "oid"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/jce/provider/AnnotatedException;
        }
    .end annotation

    .prologue
    .line 317
    invoke-interface {p0, p1}, Ljava/security/cert/X509Extension;->getExtensionValue(Ljava/lang/String;)[B

    move-result-object v0

    .line 318
    .local v0, "bytes":[B
    if-nez v0, :cond_8

    .line 320
    const/4 v1, 0x0

    .line 323
    :goto_7
    return-object v1

    :cond_8
    invoke-static {p1, v0}, Lorg/spongycastle/x509/CertPathValidatorUtilities;->getObject(Ljava/lang/String;[B)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v1

    goto :goto_7
.end method

.method protected static getIssuerPrincipal(Ljava/security/cert/X509CRL;)Ljavax/security/auth/x500/X500Principal;
    .registers 2
    .param p0, "crl"    # Ljava/security/cert/X509CRL;

    .prologue
    .line 347
    invoke-virtual {p0}, Ljava/security/cert/X509CRL;->getIssuerX500Principal()Ljavax/security/auth/x500/X500Principal;

    move-result-object v0

    return-object v0
.end method

.method protected static getNextWorkingKey(Ljava/util/List;I)Ljava/security/PublicKey;
    .registers 16
    .param p0, "certs"    # Ljava/util/List;
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertPathValidatorException;
        }
    .end annotation

    .prologue
    .line 1391
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/security/cert/Certificate;

    .line 1392
    .local v0, "cert":Ljava/security/cert/Certificate;
    invoke-virtual {v0}, Ljava/security/cert/Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v9

    .line 1393
    .local v9, "pubKey":Ljava/security/PublicKey;
    instance-of v10, v9, Ljava/security/interfaces/DSAPublicKey;

    if-nez v10, :cond_10

    move-object v2, v9

    .line 1422
    :cond_f
    :goto_f
    return-object v2

    :cond_10
    move-object v2, v9

    .line 1397
    check-cast v2, Ljava/security/interfaces/DSAPublicKey;

    .line 1398
    .local v2, "dsaPubKey":Ljava/security/interfaces/DSAPublicKey;
    invoke-interface {v2}, Ljava/security/interfaces/DSAPublicKey;->getParams()Ljava/security/interfaces/DSAParams;

    move-result-object v10

    if-nez v10, :cond_f

    .line 1402
    add-int/lit8 v5, p1, 0x1

    .local v5, "i":I
    :goto_1b
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v10

    if-ge v5, v10, :cond_74

    .line 1404
    invoke-interface {p0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/security/cert/X509Certificate;

    .line 1405
    .local v7, "parentCert":Ljava/security/cert/X509Certificate;
    invoke-virtual {v7}, Ljava/security/cert/X509Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v9

    .line 1406
    instance-of v10, v9, Ljava/security/interfaces/DSAPublicKey;

    if-nez v10, :cond_37

    .line 1408
    new-instance v10, Ljava/security/cert/CertPathValidatorException;

    const-string v11, "DSA parameters cannot be inherited from previous certificate."

    invoke-direct {v10, v11}, Ljava/security/cert/CertPathValidatorException;-><init>(Ljava/lang/String;)V

    throw v10

    :cond_37
    move-object v8, v9

    .line 1411
    check-cast v8, Ljava/security/interfaces/DSAPublicKey;

    .line 1412
    .local v8, "prevDSAPubKey":Ljava/security/interfaces/DSAPublicKey;
    invoke-interface {v8}, Ljava/security/interfaces/DSAPublicKey;->getParams()Ljava/security/interfaces/DSAParams;

    move-result-object v10

    if-nez v10, :cond_43

    .line 1402
    add-int/lit8 v5, v5, 0x1

    goto :goto_1b

    .line 1416
    :cond_43
    invoke-interface {v8}, Ljava/security/interfaces/DSAPublicKey;->getParams()Ljava/security/interfaces/DSAParams;

    move-result-object v1

    .line 1417
    .local v1, "dsaParams":Ljava/security/interfaces/DSAParams;
    new-instance v3, Ljava/security/spec/DSAPublicKeySpec;

    .line 1418
    invoke-interface {v2}, Ljava/security/interfaces/DSAPublicKey;->getY()Ljava/math/BigInteger;

    move-result-object v10

    invoke-interface {v1}, Ljava/security/interfaces/DSAParams;->getP()Ljava/math/BigInteger;

    move-result-object v11

    invoke-interface {v1}, Ljava/security/interfaces/DSAParams;->getQ()Ljava/math/BigInteger;

    move-result-object v12

    invoke-interface {v1}, Ljava/security/interfaces/DSAParams;->getG()Ljava/math/BigInteger;

    move-result-object v13

    invoke-direct {v3, v10, v11, v12, v13}, Ljava/security/spec/DSAPublicKeySpec;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    .line 1421
    .local v3, "dsaPubKeySpec":Ljava/security/spec/DSAPublicKeySpec;
    :try_start_5c
    const-string v10, "DSA"

    const-string v11, "SC"

    invoke-static {v10, v11}, Ljava/security/KeyFactory;->getInstance(Ljava/lang/String;Ljava/lang/String;)Ljava/security/KeyFactory;

    move-result-object v6

    .line 1422
    .local v6, "keyFactory":Ljava/security/KeyFactory;
    invoke-virtual {v6, v3}, Ljava/security/KeyFactory;->generatePublic(Ljava/security/spec/KeySpec;)Ljava/security/PublicKey;
    :try_end_67
    .catch Ljava/lang/Exception; {:try_start_5c .. :try_end_67} :catch_69

    move-result-object v2

    goto :goto_f

    .line 1424
    .end local v6    # "keyFactory":Ljava/security/KeyFactory;
    :catch_69
    move-exception v4

    .line 1426
    .local v4, "exception":Ljava/lang/Exception;
    new-instance v10, Ljava/lang/RuntimeException;

    invoke-virtual {v4}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 1429
    .end local v1    # "dsaParams":Ljava/security/interfaces/DSAParams;
    .end local v3    # "dsaPubKeySpec":Ljava/security/spec/DSAPublicKeySpec;
    .end local v4    # "exception":Ljava/lang/Exception;
    .end local v7    # "parentCert":Ljava/security/cert/X509Certificate;
    .end local v8    # "prevDSAPubKey":Ljava/security/interfaces/DSAPublicKey;
    :cond_74
    new-instance v10, Ljava/security/cert/CertPathValidatorException;

    const-string v11, "DSA parameters cannot be inherited from previous certificate."

    invoke-direct {v10, v11}, Ljava/security/cert/CertPathValidatorException;-><init>(Ljava/lang/String;)V

    throw v10
.end method

.method private static getObject(Ljava/lang/String;[B)Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 8
    .param p0, "oid"    # Ljava/lang/String;
    .param p1, "ext"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/jce/provider/AnnotatedException;
        }
    .end annotation

    .prologue
    .line 333
    :try_start_0
    new-instance v0, Lorg/spongycastle/asn1/ASN1InputStream;

    invoke-direct {v0, p1}, Lorg/spongycastle/asn1/ASN1InputStream;-><init>([B)V

    .line 334
    .local v0, "aIn":Lorg/spongycastle/asn1/ASN1InputStream;
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1InputStream;->readObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v2

    check-cast v2, Lorg/spongycastle/asn1/ASN1OctetString;

    .line 336
    .local v2, "octs":Lorg/spongycastle/asn1/ASN1OctetString;
    new-instance v0, Lorg/spongycastle/asn1/ASN1InputStream;

    .end local v0    # "aIn":Lorg/spongycastle/asn1/ASN1InputStream;
    invoke-virtual {v2}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v3

    invoke-direct {v0, v3}, Lorg/spongycastle/asn1/ASN1InputStream;-><init>([B)V

    .line 337
    .restart local v0    # "aIn":Lorg/spongycastle/asn1/ASN1InputStream;
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1InputStream;->readObject()Lorg/spongycastle/asn1/ASN1Primitive;
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_17} :catch_19

    move-result-object v3

    return-object v3

    .line 339
    .end local v0    # "aIn":Lorg/spongycastle/asn1/ASN1InputStream;
    .end local v2    # "octs":Lorg/spongycastle/asn1/ASN1OctetString;
    :catch_19
    move-exception v1

    .line 341
    .local v1, "e":Ljava/lang/Exception;
    new-instance v3, Lorg/spongycastle/jce/provider/AnnotatedException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "exception processing extension "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v1}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method protected static final getQualifierSet(Lorg/spongycastle/asn1/ASN1Sequence;)Ljava/util/Set;
    .registers 8
    .param p0, "qualifiers"    # Lorg/spongycastle/asn1/ASN1Sequence;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertPathValidatorException;
        }
    .end annotation

    .prologue
    .line 378
    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    .line 380
    .local v4, "pq":Ljava/util/Set;
    if-nez p0, :cond_8

    .line 406
    :cond_7
    return-object v4

    .line 385
    :cond_8
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 386
    .local v1, "bOut":Ljava/io/ByteArrayOutputStream;
    new-instance v0, Lorg/spongycastle/asn1/ASN1OutputStream;

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1OutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 388
    .local v0, "aOut":Lorg/spongycastle/asn1/ASN1OutputStream;
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjects()Ljava/util/Enumeration;

    move-result-object v2

    .line 390
    .local v2, "e":Ljava/util/Enumeration;
    :goto_16
    invoke-interface {v2}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    if-eqz v5, :cond_7

    .line 394
    :try_start_1c
    invoke-interface {v2}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/spongycastle/asn1/ASN1Encodable;

    invoke-virtual {v0, v5}, Lorg/spongycastle/asn1/ASN1OutputStream;->writeObject(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 396
    new-instance v5, Ljava/security/cert/PolicyQualifierInfo;

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/security/cert/PolicyQualifierInfo;-><init>([B)V

    invoke-interface {v4, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_31
    .catch Ljava/io/IOException; {:try_start_1c .. :try_end_31} :catch_35

    .line 403
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->reset()V

    goto :goto_16

    .line 398
    :catch_35
    move-exception v3

    .line 400
    .local v3, "ex":Ljava/io/IOException;
    new-instance v5, Lorg/spongycastle/jce/exception/ExtCertPathValidatorException;

    const-string v6, "Policy qualifier info cannot be decoded."

    invoke-direct {v5, v6, v3}, Lorg/spongycastle/jce/exception/ExtCertPathValidatorException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5
.end method

.method private static getSerialNumber(Ljava/lang/Object;)Ljava/math/BigInteger;
    .registers 2
    .param p0, "cert"    # Ljava/lang/Object;

    .prologue
    .line 1029
    instance-of v0, p0, Ljava/security/cert/X509Certificate;

    if-eqz v0, :cond_b

    .line 1031
    check-cast p0, Ljava/security/cert/X509Certificate;

    .end local p0    # "cert":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/security/cert/X509Certificate;->getSerialNumber()Ljava/math/BigInteger;

    move-result-object v0

    .line 1035
    :goto_a
    return-object v0

    .restart local p0    # "cert":Ljava/lang/Object;
    :cond_b
    check-cast p0, Lorg/spongycastle/x509/X509AttributeCertificate;

    .end local p0    # "cert":Ljava/lang/Object;
    invoke-interface {p0}, Lorg/spongycastle/x509/X509AttributeCertificate;->getSerialNumber()Ljava/math/BigInteger;

    move-result-object v0

    goto :goto_a
.end method

.method protected static getSubjectPrincipal(Ljava/security/cert/X509Certificate;)Ljavax/security/auth/x500/X500Principal;
    .registers 2
    .param p0, "cert"    # Ljava/security/cert/X509Certificate;

    .prologue
    .line 296
    invoke-virtual {p0}, Ljava/security/cert/X509Certificate;->getSubjectX500Principal()Ljavax/security/auth/x500/X500Principal;

    move-result-object v0

    return-object v0
.end method

.method protected static getValidCertDateFromValidityModel(Lorg/spongycastle/x509/ExtendedPKIXParameters;Ljava/security/cert/CertPath;I)Ljava/util/Date;
    .registers 8
    .param p0, "paramsPKIX"    # Lorg/spongycastle/x509/ExtendedPKIXParameters;
    .param p1, "certPath"    # Ljava/security/cert/CertPath;
    .param p2, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/jce/provider/AnnotatedException;
        }
    .end annotation

    .prologue
    .line 1307
    invoke-virtual {p0}, Lorg/spongycastle/x509/ExtendedPKIXParameters;->getValidityModel()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_77

    .line 1310
    if-gtz p2, :cond_e

    .line 1312
    invoke-static {p0}, Lorg/spongycastle/x509/CertPathValidatorUtilities;->getValidDate(Ljava/security/cert/PKIXParameters;)Ljava/util/Date;

    move-result-object v3

    .line 1363
    :goto_d
    return-object v3

    .line 1317
    :cond_e
    add-int/lit8 v3, p2, -0x1

    if-nez v3, :cond_66

    .line 1319
    const/4 v0, 0x0

    .line 1322
    .local v0, "dateOfCertgen":Lorg/spongycastle/asn1/ASN1GeneralizedTime;
    :try_start_13
    invoke-virtual {p1}, Ljava/security/cert/CertPath;->getCertificates()Ljava/util/List;

    move-result-object v3

    add-int/lit8 v4, p2, -0x1

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/security/cert/X509Certificate;

    sget-object v4, Lorg/spongycastle/asn1/isismtt/ISISMTTObjectIdentifiers;->id_isismtt_at_dateOfCertGen:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v4}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/security/cert/X509Certificate;->getExtensionValue(Ljava/lang/String;)[B

    move-result-object v2

    .line 1323
    .local v2, "extBytes":[B
    if-eqz v2, :cond_33

    .line 1325
    invoke-static {v2}, Lorg/spongycastle/asn1/ASN1Primitive;->fromByteArray([B)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v3

    invoke-static {v3}, Lorg/spongycastle/asn1/ASN1GeneralizedTime;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1GeneralizedTime;
    :try_end_32
    .catch Ljava/io/IOException; {:try_start_13 .. :try_end_32} :catch_3a
    .catch Ljava/lang/IllegalArgumentException; {:try_start_13 .. :try_end_32} :catch_43

    move-result-object v0

    .line 1338
    :cond_33
    if-eqz v0, :cond_55

    .line 1342
    :try_start_35
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1GeneralizedTime;->getDate()Ljava/util/Date;
    :try_end_38
    .catch Ljava/text/ParseException; {:try_start_35 .. :try_end_38} :catch_4c

    move-result-object v3

    goto :goto_d

    .line 1328
    .end local v2    # "extBytes":[B
    :catch_3a
    move-exception v1

    .line 1330
    .local v1, "e":Ljava/io/IOException;
    new-instance v3, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v4, "Date of cert gen extension could not be read."

    invoke-direct {v3, v4}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1333
    .end local v1    # "e":Ljava/io/IOException;
    :catch_43
    move-exception v1

    .line 1335
    .local v1, "e":Ljava/lang/IllegalArgumentException;
    new-instance v3, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v4, "Date of cert gen extension could not be read."

    invoke-direct {v3, v4}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1344
    .end local v1    # "e":Ljava/lang/IllegalArgumentException;
    .restart local v2    # "extBytes":[B
    :catch_4c
    move-exception v1

    .line 1346
    .local v1, "e":Ljava/text/ParseException;
    new-instance v3, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v4, "Date from date of cert gen extension could not be parsed."

    invoke-direct {v3, v4, v1}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 1351
    .end local v1    # "e":Ljava/text/ParseException;
    :cond_55
    invoke-virtual {p1}, Ljava/security/cert/CertPath;->getCertificates()Ljava/util/List;

    move-result-object v3

    add-int/lit8 v4, p2, -0x1

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/security/cert/X509Certificate;

    .line 1352
    invoke-virtual {v3}, Ljava/security/cert/X509Certificate;->getNotBefore()Ljava/util/Date;

    move-result-object v3

    goto :goto_d

    .line 1356
    .end local v0    # "dateOfCertgen":Lorg/spongycastle/asn1/ASN1GeneralizedTime;
    .end local v2    # "extBytes":[B
    :cond_66
    invoke-virtual {p1}, Ljava/security/cert/CertPath;->getCertificates()Ljava/util/List;

    move-result-object v3

    add-int/lit8 v4, p2, -0x1

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/security/cert/X509Certificate;

    .line 1357
    invoke-virtual {v3}, Ljava/security/cert/X509Certificate;->getNotBefore()Ljava/util/Date;

    move-result-object v3

    goto :goto_d

    .line 1363
    :cond_77
    invoke-static {p0}, Lorg/spongycastle/x509/CertPathValidatorUtilities;->getValidDate(Ljava/security/cert/PKIXParameters;)Ljava/util/Date;

    move-result-object v3

    goto :goto_d
.end method

.method protected static getValidDate(Ljava/security/cert/PKIXParameters;)Ljava/util/Date;
    .registers 2
    .param p0, "paramsPKIX"    # Ljava/security/cert/PKIXParameters;

    .prologue
    .line 284
    invoke-virtual {p0}, Ljava/security/cert/PKIXParameters;->getDate()Ljava/util/Date;

    move-result-object v0

    .line 286
    .local v0, "validDate":Ljava/util/Date;
    if-nez v0, :cond_b

    .line 288
    new-instance v0, Ljava/util/Date;

    .end local v0    # "validDate":Ljava/util/Date;
    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    .line 291
    .restart local v0    # "validDate":Ljava/util/Date;
    :cond_b
    return-object v0
.end method

.method protected static isAnyPolicy(Ljava/util/Set;)Z
    .registers 2
    .param p0, "policySet"    # Ljava/util/Set;

    .prologue
    .line 651
    if-eqz p0, :cond_10

    const-string v0, "2.5.29.32.0"

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_10

    invoke-interface {p0}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_12

    :cond_10
    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method private static isDeltaCRL(Ljava/security/cert/X509CRL;)Z
    .registers 3
    .param p0, "crl"    # Ljava/security/cert/X509CRL;

    .prologue
    .line 1223
    invoke-virtual {p0}, Ljava/security/cert/X509CRL;->getCriticalExtensionOIDs()Ljava/util/Set;

    move-result-object v0

    .line 1225
    .local v0, "critical":Ljava/util/Set;
    if-nez v0, :cond_8

    .line 1227
    const/4 v1, 0x0

    .line 1230
    :goto_7
    return v1

    :cond_8
    sget-object v1, Lorg/spongycastle/asn1/x509/Extension;->deltaCRLIndicator:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_7
.end method

.method static isIndirectCRL(Ljava/security/cert/X509CRL;)Z
    .registers 6
    .param p0, "crl"    # Ljava/security/cert/X509CRL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CRLException;
        }
    .end annotation

    .prologue
    .line 1507
    :try_start_0
    sget-object v2, Lorg/spongycastle/asn1/x509/Extension;->issuingDistributionPoint:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Ljava/security/cert/X509CRL;->getExtensionValue(Ljava/lang/String;)[B

    move-result-object v1

    .line 1508
    .local v1, "idp":[B
    if-eqz v1, :cond_20

    .line 1509
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

    .line 1511
    .end local v1    # "idp":[B
    :catch_22
    move-exception v0

    .line 1513
    .local v0, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/security/cert/CRLException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Exception reading IssuingDistributionPoint: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/security/cert/CRLException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method protected static isSelfIssued(Ljava/security/cert/X509Certificate;)Z
    .registers 3
    .param p0, "cert"    # Ljava/security/cert/X509Certificate;

    .prologue
    .line 301
    invoke-virtual {p0}, Ljava/security/cert/X509Certificate;->getSubjectDN()Ljava/security/Principal;

    move-result-object v0

    invoke-virtual {p0}, Ljava/security/cert/X509Certificate;->getIssuerDN()Ljava/security/Principal;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/security/Principal;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method protected static prepareNextCertB1(I[Ljava/util/List;Ljava/lang/String;Ljava/util/Map;Ljava/security/cert/X509Certificate;)V
    .registers 22
    .param p0, "i"    # I
    .param p1, "policyNodes"    # [Ljava/util/List;
    .param p2, "id_p"    # Ljava/lang/String;
    .param p3, "m_idp"    # Ljava/util/Map;
    .param p4, "cert"    # Ljava/security/cert/X509Certificate;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/jce/provider/AnnotatedException;,
            Ljava/security/cert/CertPathValidatorException;
        }
    .end annotation

    .prologue
    .line 532
    const/4 v12, 0x0

    .line 533
    .local v12, "idp_found":Z
    aget-object v3, p1, p0

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v14

    .line 534
    .local v14, "nodes_i":Ljava/util/Iterator;
    :cond_7
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2d

    .line 536
    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lorg/spongycastle/jce/provider/PKIXPolicyNode;

    .line 537
    .local v13, "node":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    invoke-virtual {v13}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;->getValidPolicy()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p2

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 539
    const/4 v12, 0x1

    .line 540
    move-object/from16 v0, p3

    move-object/from16 v1, p2

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Set;

    invoke-virtual {v13, v3}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;->setExpectedPolicies(Ljava/util/Set;)V

    .line 545
    .end local v13    # "node":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    :cond_2d
    if-nez v12, :cond_ca

    .line 547
    aget-object v3, p1, p0

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v14

    .line 548
    :cond_35
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_ca

    .line 550
    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lorg/spongycastle/jce/provider/PKIXPolicyNode;

    .line 551
    .restart local v13    # "node":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    const-string v3, "2.5.29.32.0"

    invoke-virtual {v13}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;->getValidPolicy()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_35

    .line 553
    const/4 v7, 0x0

    .line 554
    .local v7, "pq":Ljava/util/Set;
    const/16 v16, 0x0

    .line 557
    .local v16, "policies":Lorg/spongycastle/asn1/ASN1Sequence;
    :try_start_50
    sget-object v3, Lorg/spongycastle/x509/CertPathValidatorUtilities;->CERTIFICATE_POLICIES:Ljava/lang/String;

    move-object/from16 v0, p4

    invoke-static {v0, v3}, Lorg/spongycastle/x509/CertPathValidatorUtilities;->getExtensionValue(Ljava/security/cert/X509Extension;Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v3

    invoke-static {v3}, Lorg/spongycastle/asn1/DERSequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;
    :try_end_5b
    .catch Ljava/lang/Exception; {:try_start_50 .. :try_end_5b} :catch_cb

    move-result-object v16

    .line 563
    invoke-virtual/range {v16 .. v16}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjects()Ljava/util/Enumeration;

    move-result-object v10

    .line 564
    .local v10, "e":Ljava/util/Enumeration;
    :cond_60
    invoke-interface {v10}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_87

    .line 566
    const/4 v15, 0x0

    .line 570
    .local v15, "pinfo":Lorg/spongycastle/asn1/x509/PolicyInformation;
    :try_start_67
    invoke-interface {v10}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Lorg/spongycastle/asn1/x509/PolicyInformation;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/PolicyInformation;
    :try_end_6e
    .catch Ljava/lang/Exception; {:try_start_67 .. :try_end_6e} :catch_d4

    move-result-object v15

    .line 576
    const-string v3, "2.5.29.32.0"

    invoke-virtual {v15}, Lorg/spongycastle/asn1/x509/PolicyInformation;->getPolicyIdentifier()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v4

    invoke-virtual {v4}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_60

    .line 580
    :try_start_7f
    invoke-virtual {v15}, Lorg/spongycastle/asn1/x509/PolicyInformation;->getPolicyQualifiers()Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v3

    invoke-static {v3}, Lorg/spongycastle/x509/CertPathValidatorUtilities;->getQualifierSet(Lorg/spongycastle/asn1/ASN1Sequence;)Ljava/util/Set;
    :try_end_86
    .catch Ljava/security/cert/CertPathValidatorException; {:try_start_7f .. :try_end_86} :catch_dd

    move-result-object v7

    .line 590
    .end local v15    # "pinfo":Lorg/spongycastle/asn1/x509/PolicyInformation;
    :cond_87
    const/4 v9, 0x0

    .line 591
    .local v9, "ci":Z
    invoke-virtual/range {p4 .. p4}, Ljava/security/cert/X509Certificate;->getCriticalExtensionOIDs()Ljava/util/Set;

    move-result-object v3

    if-eqz v3, :cond_98

    .line 593
    invoke-virtual/range {p4 .. p4}, Ljava/security/cert/X509Certificate;->getCriticalExtensionOIDs()Ljava/util/Set;

    move-result-object v3

    sget-object v4, Lorg/spongycastle/x509/CertPathValidatorUtilities;->CERTIFICATE_POLICIES:Ljava/lang/String;

    invoke-interface {v3, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v9

    .line 596
    :cond_98
    invoke-virtual {v13}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;->getParent()Ljava/security/cert/PolicyNode;

    move-result-object v6

    check-cast v6, Lorg/spongycastle/jce/provider/PKIXPolicyNode;

    .line 597
    .local v6, "p_node":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    const-string v3, "2.5.29.32.0"

    invoke-virtual {v6}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;->getValidPolicy()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_ca

    .line 599
    new-instance v2, Lorg/spongycastle/jce/provider/PKIXPolicyNode;

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 601
    move-object/from16 v0, p3

    move-object/from16 v1, p2

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Set;

    move/from16 v4, p0

    move-object/from16 v8, p2

    invoke-direct/range {v2 .. v9}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;-><init>(Ljava/util/List;ILjava/util/Set;Ljava/security/cert/PolicyNode;Ljava/util/Set;Ljava/lang/String;Z)V

    .line 603
    .local v2, "c_node":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    invoke-virtual {v6, v2}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;->addChild(Lorg/spongycastle/jce/provider/PKIXPolicyNode;)V

    .line 604
    aget-object v3, p1, p0

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 610
    .end local v2    # "c_node":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    .end local v6    # "p_node":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    .end local v7    # "pq":Ljava/util/Set;
    .end local v9    # "ci":Z
    .end local v10    # "e":Ljava/util/Enumeration;
    .end local v13    # "node":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    .end local v16    # "policies":Lorg/spongycastle/asn1/ASN1Sequence;
    :cond_ca
    return-void

    .line 559
    .restart local v7    # "pq":Ljava/util/Set;
    .restart local v13    # "node":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    .restart local v16    # "policies":Lorg/spongycastle/asn1/ASN1Sequence;
    :catch_cb
    move-exception v10

    .line 561
    .local v10, "e":Ljava/lang/Exception;
    new-instance v3, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v4, "Certificate policies cannot be decoded."

    invoke-direct {v3, v4, v10}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 572
    .local v10, "e":Ljava/util/Enumeration;
    .restart local v15    # "pinfo":Lorg/spongycastle/asn1/x509/PolicyInformation;
    :catch_d4
    move-exception v11

    .line 574
    .local v11, "ex":Ljava/lang/Exception;
    new-instance v3, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v4, "Policy information cannot be decoded."

    invoke-direct {v3, v4, v11}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 582
    .end local v11    # "ex":Ljava/lang/Exception;
    :catch_dd
    move-exception v11

    .line 584
    .local v11, "ex":Ljava/security/cert/CertPathValidatorException;
    new-instance v3, Lorg/spongycastle/jce/exception/ExtCertPathValidatorException;

    const-string v4, "Policy qualifier info set could not be built."

    invoke-direct {v3, v4, v11}, Lorg/spongycastle/jce/exception/ExtCertPathValidatorException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method protected static prepareNextCertB2(I[Ljava/util/List;Ljava/lang/String;Lorg/spongycastle/jce/provider/PKIXPolicyNode;)Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    .registers 12
    .param p0, "i"    # I
    .param p1, "policyNodes"    # [Ljava/util/List;
    .param p2, "id_p"    # Ljava/lang/String;
    .param p3, "validPolicyTree"    # Lorg/spongycastle/jce/provider/PKIXPolicyNode;

    .prologue
    .line 618
    aget-object v7, p1, p0

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .line 619
    .local v5, "nodes_i":Ljava/util/Iterator;
    :cond_6
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_4d

    .line 621
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/spongycastle/jce/provider/PKIXPolicyNode;

    .line 622
    .local v2, "node":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    invoke-virtual {v2}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;->getValidPolicy()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_6

    .line 624
    invoke-virtual {v2}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;->getParent()Ljava/security/cert/PolicyNode;

    move-result-object v6

    check-cast v6, Lorg/spongycastle/jce/provider/PKIXPolicyNode;

    .line 625
    .local v6, "p_node":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    invoke-virtual {v6, v2}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;->removeChild(Lorg/spongycastle/jce/provider/PKIXPolicyNode;)V

    .line 626
    invoke-interface {v5}, Ljava/util/Iterator;->remove()V

    .line 627
    add-int/lit8 v0, p0, -0x1

    .local v0, "k":I
    :goto_2a
    if-ltz v0, :cond_6

    .line 629
    aget-object v4, p1, v0

    .line 630
    .local v4, "nodes":Ljava/util/List;
    const/4 v1, 0x0

    .local v1, "l":I
    :goto_2f
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v7

    if-ge v1, v7, :cond_47

    .line 632
    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/spongycastle/jce/provider/PKIXPolicyNode;

    .line 633
    .local v3, "node2":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    invoke-virtual {v3}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;->hasChildren()Z

    move-result v7

    if-nez v7, :cond_4a

    .line 635
    invoke-static {p3, p1, v3}, Lorg/spongycastle/x509/CertPathValidatorUtilities;->removePolicyNode(Lorg/spongycastle/jce/provider/PKIXPolicyNode;[Ljava/util/List;Lorg/spongycastle/jce/provider/PKIXPolicyNode;)Lorg/spongycastle/jce/provider/PKIXPolicyNode;

    move-result-object p3

    .line 636
    if-nez p3, :cond_4a

    .line 627
    .end local v3    # "node2":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    :cond_47
    add-int/lit8 v0, v0, -0x1

    goto :goto_2a

    .line 630
    .restart local v3    # "node2":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    :cond_4a
    add-int/lit8 v1, v1, 0x1

    goto :goto_2f

    .line 645
    .end local v0    # "k":I
    .end local v1    # "l":I
    .end local v2    # "node":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    .end local v3    # "node2":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    .end local v4    # "nodes":Ljava/util/List;
    .end local v6    # "p_node":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    :cond_4d
    return-object p3
.end method

.method protected static processCertD1i(I[Ljava/util/List;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Ljava/util/Set;)Z
    .registers 15
    .param p0, "index"    # I
    .param p1, "policyNodes"    # [Ljava/util/List;
    .param p2, "pOid"    # Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .param p3, "pq"    # Ljava/util/Set;

    .prologue
    const/4 v7, 0x0

    .line 463
    add-int/lit8 v1, p0, -0x1

    aget-object v10, p1, v1

    .line 465
    .local v10, "policyNodeVec":Ljava/util/List;
    const/4 v9, 0x0

    .local v9, "j":I
    :goto_6
    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v1

    if-ge v9, v1, :cond_45

    .line 467
    invoke-interface {v10, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/spongycastle/jce/provider/PKIXPolicyNode;

    .line 468
    .local v4, "node":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    invoke-virtual {v4}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;->getExpectedPolicies()Ljava/util/Set;

    move-result-object v8

    .line 470
    .local v8, "expectedPolicies":Ljava/util/Set;
    invoke-virtual {p2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v8, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_46

    .line 472
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 473
    .local v3, "childExpectedPolicies":Ljava/util/Set;
    invoke-virtual {p2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v3, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 475
    new-instance v0, Lorg/spongycastle/jce/provider/PKIXPolicyNode;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 480
    invoke-virtual {p2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v6

    move v2, p0

    move-object v5, p3

    invoke-direct/range {v0 .. v7}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;-><init>(Ljava/util/List;ILjava/util/Set;Ljava/security/cert/PolicyNode;Ljava/util/Set;Ljava/lang/String;Z)V

    .line 482
    .local v0, "child":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    invoke-virtual {v4, v0}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;->addChild(Lorg/spongycastle/jce/provider/PKIXPolicyNode;)V

    .line 483
    aget-object v1, p1, p0

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 485
    const/4 v7, 0x1

    .line 489
    .end local v0    # "child":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    .end local v3    # "childExpectedPolicies":Ljava/util/Set;
    .end local v4    # "node":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    .end local v8    # "expectedPolicies":Ljava/util/Set;
    :cond_45
    return v7

    .line 465
    .restart local v4    # "node":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    .restart local v8    # "expectedPolicies":Ljava/util/Set;
    :cond_46
    add-int/lit8 v9, v9, 0x1

    goto :goto_6
.end method

.method protected static processCertD1ii(I[Ljava/util/List;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Ljava/util/Set;)V
    .registers 14
    .param p0, "index"    # I
    .param p1, "policyNodes"    # [Ljava/util/List;
    .param p2, "_poid"    # Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .param p3, "_pq"    # Ljava/util/Set;

    .prologue
    .line 498
    add-int/lit8 v1, p0, -0x1

    aget-object v9, p1, v1

    .line 500
    .local v9, "policyNodeVec":Ljava/util/List;
    const/4 v8, 0x0

    .local v8, "j":I
    :goto_5
    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v1

    if-ge v8, v1, :cond_42

    .line 502
    invoke-interface {v9, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/spongycastle/jce/provider/PKIXPolicyNode;

    .line 504
    .local v4, "_node":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    const-string v1, "2.5.29.32.0"

    invoke-virtual {v4}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;->getValidPolicy()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_43

    .line 506
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 507
    .local v3, "_childExpectedPolicies":Ljava/util/Set;
    invoke-virtual {p2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v3, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 509
    new-instance v0, Lorg/spongycastle/jce/provider/PKIXPolicyNode;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 514
    invoke-virtual {p2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    move v2, p0

    move-object v5, p3

    invoke-direct/range {v0 .. v7}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;-><init>(Ljava/util/List;ILjava/util/Set;Ljava/security/cert/PolicyNode;Ljava/util/Set;Ljava/lang/String;Z)V

    .line 516
    .local v0, "_child":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    invoke-virtual {v4, v0}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;->addChild(Lorg/spongycastle/jce/provider/PKIXPolicyNode;)V

    .line 517
    aget-object v1, p1, p0

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 521
    .end local v0    # "_child":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    .end local v3    # "_childExpectedPolicies":Ljava/util/Set;
    .end local v4    # "_node":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    :cond_42
    return-void

    .line 500
    .restart local v4    # "_node":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    :cond_43
    add-int/lit8 v8, v8, 0x1

    goto :goto_5
.end method

.method protected static removePolicyNode(Lorg/spongycastle/jce/provider/PKIXPolicyNode;[Ljava/util/List;Lorg/spongycastle/jce/provider/PKIXPolicyNode;)Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    .registers 7
    .param p0, "validPolicyTree"    # Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    .param p1, "policyNodes"    # [Ljava/util/List;
    .param p2, "_node"    # Lorg/spongycastle/jce/provider/PKIXPolicyNode;

    .prologue
    const/4 v2, 0x0

    .line 414
    invoke-virtual {p2}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;->getParent()Ljava/security/cert/PolicyNode;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/jce/provider/PKIXPolicyNode;

    .line 416
    .local v0, "_parent":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    if-nez p0, :cond_b

    move-object p0, v2

    .line 435
    .end local p0    # "validPolicyTree":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    :goto_a
    return-object p0

    .line 421
    .restart local p0    # "validPolicyTree":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    :cond_b
    if-nez v0, :cond_1d

    .line 423
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_e
    array-length v3, p1

    if-ge v1, v3, :cond_1b

    .line 425
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    aput-object v3, p1, v1

    .line 423
    add-int/lit8 v1, v1, 0x1

    goto :goto_e

    :cond_1b
    move-object p0, v2

    .line 428
    goto :goto_a

    .line 432
    .end local v1    # "j":I
    :cond_1d
    invoke-virtual {v0, p2}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;->removeChild(Lorg/spongycastle/jce/provider/PKIXPolicyNode;)V

    .line 433
    invoke-static {p1, p2}, Lorg/spongycastle/x509/CertPathValidatorUtilities;->removePolicyNodeRecurse([Ljava/util/List;Lorg/spongycastle/jce/provider/PKIXPolicyNode;)V

    goto :goto_a
.end method

.method private static removePolicyNodeRecurse([Ljava/util/List;Lorg/spongycastle/jce/provider/PKIXPolicyNode;)V
    .registers 5
    .param p0, "policyNodes"    # [Ljava/util/List;
    .param p1, "_node"    # Lorg/spongycastle/jce/provider/PKIXPolicyNode;

    .prologue
    .line 443
    invoke-virtual {p1}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;->getDepth()I

    move-result v2

    aget-object v2, p0, v2

    invoke-interface {v2, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 445
    invoke-virtual {p1}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;->hasChildren()Z

    move-result v2

    if-eqz v2, :cond_23

    .line 447
    invoke-virtual {p1}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;->getChildren()Ljava/util/Iterator;

    move-result-object v1

    .line 448
    .local v1, "_iter":Ljava/util/Iterator;
    :goto_13
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_23

    .line 450
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/jce/provider/PKIXPolicyNode;

    .line 451
    .local v0, "_child":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    invoke-static {p0, v0}, Lorg/spongycastle/x509/CertPathValidatorUtilities;->removePolicyNodeRecurse([Ljava/util/List;Lorg/spongycastle/jce/provider/PKIXPolicyNode;)V

    goto :goto_13

    .line 454
    .end local v0    # "_child":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    .end local v1    # "_iter":Ljava/util/Iterator;
    :cond_23
    return-void
.end method

.method protected static verifyX509Certificate(Ljava/security/cert/X509Certificate;Ljava/security/PublicKey;Ljava/lang/String;)V
    .registers 3
    .param p0, "cert"    # Ljava/security/cert/X509Certificate;
    .param p1, "publicKey"    # Ljava/security/PublicKey;
    .param p2, "sigProvider"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .prologue
    .line 1492
    if-nez p2, :cond_6

    .line 1494
    invoke-virtual {p0, p1}, Ljava/security/cert/X509Certificate;->verify(Ljava/security/PublicKey;)V

    .line 1500
    :goto_5
    return-void

    .line 1498
    :cond_6
    invoke-virtual {p0, p1, p2}, Ljava/security/cert/X509Certificate;->verify(Ljava/security/PublicKey;Ljava/lang/String;)V

    goto :goto_5
.end method
