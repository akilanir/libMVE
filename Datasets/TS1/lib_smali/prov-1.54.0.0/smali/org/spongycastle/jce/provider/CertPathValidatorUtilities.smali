.class Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;
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

.field protected static final CRL_UTIL:Lorg/spongycastle/jce/provider/PKIXCRLUtil;

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
    .line 82
    new-instance v0, Lorg/spongycastle/jce/provider/PKIXCRLUtil;

    invoke-direct {v0}, Lorg/spongycastle/jce/provider/PKIXCRLUtil;-><init>()V

    sput-object v0, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->CRL_UTIL:Lorg/spongycastle/jce/provider/PKIXCRLUtil;

    .line 84
    sget-object v0, Lorg/spongycastle/asn1/x509/Extension;->certificatePolicies:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->CERTIFICATE_POLICIES:Ljava/lang/String;

    .line 85
    sget-object v0, Lorg/spongycastle/asn1/x509/Extension;->basicConstraints:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->BASIC_CONSTRAINTS:Ljava/lang/String;

    .line 86
    sget-object v0, Lorg/spongycastle/asn1/x509/Extension;->policyMappings:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->POLICY_MAPPINGS:Ljava/lang/String;

    .line 87
    sget-object v0, Lorg/spongycastle/asn1/x509/Extension;->subjectAlternativeName:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->SUBJECT_ALTERNATIVE_NAME:Ljava/lang/String;

    .line 88
    sget-object v0, Lorg/spongycastle/asn1/x509/Extension;->nameConstraints:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->NAME_CONSTRAINTS:Ljava/lang/String;

    .line 89
    sget-object v0, Lorg/spongycastle/asn1/x509/Extension;->keyUsage:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->KEY_USAGE:Ljava/lang/String;

    .line 90
    sget-object v0, Lorg/spongycastle/asn1/x509/Extension;->inhibitAnyPolicy:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->INHIBIT_ANY_POLICY:Ljava/lang/String;

    .line 91
    sget-object v0, Lorg/spongycastle/asn1/x509/Extension;->issuingDistributionPoint:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->ISSUING_DISTRIBUTION_POINT:Ljava/lang/String;

    .line 92
    sget-object v0, Lorg/spongycastle/asn1/x509/Extension;->deltaCRLIndicator:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->DELTA_CRL_INDICATOR:Ljava/lang/String;

    .line 93
    sget-object v0, Lorg/spongycastle/asn1/x509/Extension;->policyConstraints:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->POLICY_CONSTRAINTS:Ljava/lang/String;

    .line 94
    sget-object v0, Lorg/spongycastle/asn1/x509/Extension;->freshestCRL:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->FRESHEST_CRL:Ljava/lang/String;

    .line 95
    sget-object v0, Lorg/spongycastle/asn1/x509/Extension;->cRLDistributionPoints:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->CRL_DISTRIBUTION_POINTS:Ljava/lang/String;

    .line 96
    sget-object v0, Lorg/spongycastle/asn1/x509/Extension;->authorityKeyIdentifier:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->AUTHORITY_KEY_IDENTIFIER:Ljava/lang/String;

    .line 100
    sget-object v0, Lorg/spongycastle/asn1/x509/Extension;->cRLNumber:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->CRL_NUMBER:Ljava/lang/String;

    .line 108
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

    sput-object v0, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->crlReasons:[Ljava/lang/String;

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .prologue
    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static checkCRLsNotEmpty(Ljava/util/Set;Ljava/lang/Object;)V
    .registers 8
    .param p0, "crls"    # Ljava/util/Set;
    .param p1, "cert"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/jce/provider/AnnotatedException;
        }
    .end annotation

    .prologue
    .line 1341
    invoke-interface {p0}, Ljava/util/Set;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_63

    .line 1343
    instance-of v2, p1, Lorg/spongycastle/x509/X509AttributeCertificate;

    if-eqz v2, :cond_37

    move-object v0, p1

    .line 1345
    check-cast v0, Lorg/spongycastle/x509/X509AttributeCertificate;

    .line 1347
    .local v0, "aCert":Lorg/spongycastle/x509/X509AttributeCertificate;
    new-instance v2, Lorg/spongycastle/jce/provider/AnnotatedException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "No CRLs found for issuer \""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {v0}, Lorg/spongycastle/x509/X509AttributeCertificate;->getIssuer()Lorg/spongycastle/x509/AttributeCertificateIssuer;

    move-result-object v4

    invoke-virtual {v4}, Lorg/spongycastle/x509/AttributeCertificateIssuer;->getPrincipals()[Ljava/security/Principal;

    move-result-object v4

    const/4 v5, 0x0

    aget-object v4, v4, v5

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;)V

    throw v2

    .end local v0    # "aCert":Lorg/spongycastle/x509/X509AttributeCertificate;
    :cond_37
    move-object v1, p1

    .line 1351
    check-cast v1, Ljava/security/cert/X509Certificate;

    .line 1353
    .local v1, "xCert":Ljava/security/cert/X509Certificate;
    new-instance v2, Lorg/spongycastle/jce/provider/AnnotatedException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "No CRLs found for issuer \""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Lorg/spongycastle/asn1/x500/style/RFC4519Style;->INSTANCE:Lorg/spongycastle/asn1/x500/X500NameStyle;

    invoke-static {v1}, Lorg/spongycastle/jce/provider/PrincipalUtils;->getIssuerPrincipal(Ljava/security/cert/X509Certificate;)Lorg/spongycastle/asn1/x500/X500Name;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/spongycastle/asn1/x500/X500NameStyle;->toString(Lorg/spongycastle/asn1/x500/X500Name;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1356
    .end local v1    # "xCert":Ljava/security/cert/X509Certificate;
    :cond_63
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
    .line 651
    new-instance v1, Ljava/util/LinkedHashSet;

    invoke-direct {v1}, Ljava/util/LinkedHashSet;-><init>()V

    .line 652
    .local v1, "certs":Ljava/util/Set;
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 654
    .local v3, "iter":Ljava/util/Iterator;
    :goto_9
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3f

    .line 656
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    .line 658
    .local v4, "obj":Ljava/lang/Object;
    instance-of v5, v4, Lorg/spongycastle/util/Store;

    if-eqz v5, :cond_2b

    move-object v0, v4

    .line 660
    check-cast v0, Lorg/spongycastle/util/Store;

    .line 663
    .local v0, "certStore":Lorg/spongycastle/util/Store;
    :try_start_1a
    invoke-interface {v0, p0}, Lorg/spongycastle/util/Store;->getMatches(Lorg/spongycastle/util/Selector;)Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z
    :try_end_21
    .catch Lorg/spongycastle/util/StoreException; {:try_start_1a .. :try_end_21} :catch_22

    goto :goto_9

    .line 665
    :catch_22
    move-exception v2

    .line 667
    .local v2, "e":Lorg/spongycastle/util/StoreException;
    new-instance v5, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v6, "Problem while picking certificates from X.509 store."

    invoke-direct {v5, v6, v2}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5

    .end local v0    # "certStore":Lorg/spongycastle/util/Store;
    .end local v2    # "e":Lorg/spongycastle/util/StoreException;
    :cond_2b
    move-object v0, v4

    .line 673
    check-cast v0, Ljava/security/cert/CertStore;

    .line 677
    .local v0, "certStore":Ljava/security/cert/CertStore;
    :try_start_2e
    invoke-static {p0, v0}, Lorg/spongycastle/jcajce/PKIXCertStoreSelector;->getCertificates(Lorg/spongycastle/jcajce/PKIXCertStoreSelector;Ljava/security/cert/CertStore;)Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z
    :try_end_35
    .catch Ljava/security/cert/CertStoreException; {:try_start_2e .. :try_end_35} :catch_36

    goto :goto_9

    .line 679
    :catch_36
    move-exception v2

    .line 681
    .local v2, "e":Ljava/security/cert/CertStoreException;
    new-instance v5, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v6, "Problem while picking certificates from certificate store."

    invoke-direct {v5, v6, v2}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5

    .line 687
    .end local v0    # "certStore":Ljava/security/cert/CertStore;
    .end local v2    # "e":Ljava/security/cert/CertStoreException;
    .end local v4    # "obj":Ljava/lang/Object;
    :cond_3f
    return-object v1
.end method

.method static findIssuerCerts(Ljava/security/cert/X509Certificate;Ljava/util/List;Ljava/util/List;)Ljava/util/Collection;
    .registers 15
    .param p0, "cert"    # Ljava/security/cert/X509Certificate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/security/cert/X509Certificate;",
            "Ljava/util/List",
            "<",
            "Ljava/security/cert/CertStore;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lorg/spongycastle/jcajce/PKIXCertStore;",
            ">;)",
            "Ljava/util/Collection;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/jce/provider/AnnotatedException;
        }
    .end annotation

    .prologue
    .line 1264
    .local p1, "certStores":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/CertStore;>;"
    .local p2, "pkixCertStores":Ljava/util/List;, "Ljava/util/List<Lorg/spongycastle/jcajce/PKIXCertStore;>;"
    new-instance v9, Ljava/security/cert/X509CertSelector;

    invoke-direct {v9}, Ljava/security/cert/X509CertSelector;-><init>()V

    .line 1268
    .local v9, "selector":Ljava/security/cert/X509CertSelector;
    :try_start_5
    invoke-static {p0}, Lorg/spongycastle/jce/provider/PrincipalUtils;->getIssuerPrincipal(Ljava/security/cert/X509Certificate;)Lorg/spongycastle/asn1/x500/X500Name;

    move-result-object v10

    invoke-virtual {v10}, Lorg/spongycastle/asn1/x500/X500Name;->getEncoded()[B

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/security/cert/X509CertSelector;->setSubject([B)V
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_10} :catch_6c

    .line 1278
    :try_start_10
    sget-object v10, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->AUTHORITY_KEY_IDENTIFIER:Ljava/lang/String;

    invoke-virtual {p0, v10}, Ljava/security/cert/X509Certificate;->getExtensionValue(Ljava/lang/String;)[B

    move-result-object v1

    .line 1279
    .local v1, "akiExtensionValue":[B
    if-eqz v1, :cond_36

    .line 1281
    invoke-static {v1}, Lorg/spongycastle/asn1/ASN1OctetString;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1OctetString;

    move-result-object v0

    .line 1282
    .local v0, "aki":Lorg/spongycastle/asn1/ASN1OctetString;
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v10

    invoke-static {v10}, Lorg/spongycastle/asn1/x509/AuthorityKeyIdentifier;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/AuthorityKeyIdentifier;

    move-result-object v10

    invoke-virtual {v10}, Lorg/spongycastle/asn1/x509/AuthorityKeyIdentifier;->getKeyIdentifier()[B

    move-result-object v2

    .line 1283
    .local v2, "authorityKeyIdentifier":[B
    if-eqz v2, :cond_36

    .line 1285
    new-instance v10, Lorg/spongycastle/asn1/DEROctetString;

    invoke-direct {v10, v2}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    invoke-virtual {v10}, Lorg/spongycastle/asn1/DEROctetString;->getEncoded()[B

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/security/cert/X509CertSelector;->setSubjectKeyIdentifier([B)V
    :try_end_36
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_36} :catch_7f

    .line 1294
    .end local v0    # "aki":Lorg/spongycastle/asn1/ASN1OctetString;
    .end local v1    # "akiExtensionValue":[B
    .end local v2    # "authorityKeyIdentifier":[B
    :cond_36
    :goto_36
    new-instance v10, Lorg/spongycastle/jcajce/PKIXCertStoreSelector$Builder;

    invoke-direct {v10, v9}, Lorg/spongycastle/jcajce/PKIXCertStoreSelector$Builder;-><init>(Ljava/security/cert/CertSelector;)V

    invoke-virtual {v10}, Lorg/spongycastle/jcajce/PKIXCertStoreSelector$Builder;->build()Lorg/spongycastle/jcajce/PKIXCertStoreSelector;

    move-result-object v3

    .line 1295
    .local v3, "certSelect":Lorg/spongycastle/jcajce/PKIXCertStoreSelector;
    new-instance v4, Ljava/util/LinkedHashSet;

    invoke-direct {v4}, Ljava/util/LinkedHashSet;-><init>()V

    .line 1301
    .local v4, "certs":Ljava/util/Set;
    :try_start_44
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 1303
    .local v8, "matches":Ljava/util/List;
    invoke-static {v3, p1}, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->findCertificates(Lorg/spongycastle/jcajce/PKIXCertStoreSelector;Ljava/util/List;)Ljava/util/Collection;

    move-result-object v10

    invoke-interface {v8, v10}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 1304
    invoke-static {v3, p2}, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->findCertificates(Lorg/spongycastle/jcajce/PKIXCertStoreSelector;Ljava/util/List;)Ljava/util/Collection;

    move-result-object v10

    invoke-interface {v8, v10}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 1306
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;
    :try_end_5a
    .catch Lorg/spongycastle/jce/provider/AnnotatedException; {:try_start_44 .. :try_end_5a} :catch_75

    move-result-object v7

    .line 1313
    .local v7, "iter":Ljava/util/Iterator;
    const/4 v6, 0x0

    .line 1314
    .local v6, "issuer":Ljava/security/cert/X509Certificate;
    :goto_5c
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_7e

    .line 1316
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    .end local v6    # "issuer":Ljava/security/cert/X509Certificate;
    check-cast v6, Ljava/security/cert/X509Certificate;

    .line 1319
    .restart local v6    # "issuer":Ljava/security/cert/X509Certificate;
    invoke-interface {v4, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_5c

    .line 1270
    .end local v3    # "certSelect":Lorg/spongycastle/jcajce/PKIXCertStoreSelector;
    .end local v4    # "certs":Ljava/util/Set;
    .end local v6    # "issuer":Ljava/security/cert/X509Certificate;
    .end local v7    # "iter":Ljava/util/Iterator;
    .end local v8    # "matches":Ljava/util/List;
    :catch_6c
    move-exception v5

    .line 1272
    .local v5, "e":Ljava/io/IOException;
    new-instance v10, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v11, "Subject criteria for certificate selector to find issuer certificate could not be set."

    invoke-direct {v10, v11, v5}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v10

    .line 1308
    .end local v5    # "e":Ljava/io/IOException;
    .restart local v3    # "certSelect":Lorg/spongycastle/jcajce/PKIXCertStoreSelector;
    .restart local v4    # "certs":Ljava/util/Set;
    :catch_75
    move-exception v5

    .line 1310
    .local v5, "e":Lorg/spongycastle/jce/provider/AnnotatedException;
    new-instance v10, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v11, "Issuer certificate cannot be searched."

    invoke-direct {v10, v11, v5}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v10

    .line 1321
    .end local v5    # "e":Lorg/spongycastle/jce/provider/AnnotatedException;
    .restart local v6    # "issuer":Ljava/security/cert/X509Certificate;
    .restart local v7    # "iter":Ljava/util/Iterator;
    .restart local v8    # "matches":Ljava/util/List;
    :cond_7e
    return-object v4

    .line 1289
    .end local v3    # "certSelect":Lorg/spongycastle/jcajce/PKIXCertStoreSelector;
    .end local v4    # "certs":Ljava/util/Set;
    .end local v6    # "issuer":Ljava/security/cert/X509Certificate;
    .end local v7    # "iter":Ljava/util/Iterator;
    .end local v8    # "matches":Ljava/util/List;
    :catch_7f
    move-exception v10

    goto :goto_36
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
    .line 138
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->findTrustAnchor(Ljava/security/cert/X509Certificate;Ljava/util/Set;Ljava/lang/String;)Ljava/security/cert/TrustAnchor;

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
    .line 161
    const/4 v6, 0x0

    .line 162
    .local v6, "trust":Ljava/security/cert/TrustAnchor;
    const/4 v7, 0x0

    .line 163
    .local v7, "trustPublicKey":Ljava/security/PublicKey;
    const/4 v4, 0x0

    .line 165
    .local v4, "invalidKeyEx":Ljava/lang/Exception;
    new-instance v2, Ljava/security/cert/X509CertSelector;

    invoke-direct {v2}, Ljava/security/cert/X509CertSelector;-><init>()V

    .line 166
    .local v2, "certSelectX509":Ljava/security/cert/X509CertSelector;
    invoke-static {p0}, Lorg/spongycastle/jce/provider/PrincipalUtils;->getEncodedIssuerPrincipal(Ljava/lang/Object;)Lorg/spongycastle/asn1/x500/X500Name;

    move-result-object v1

    .line 170
    .local v1, "certIssuer":Lorg/spongycastle/asn1/x500/X500Name;
    :try_start_c
    invoke-virtual {v1}, Lorg/spongycastle/asn1/x500/X500Name;->getEncoded()[B

    move-result-object v8

    invoke-virtual {v2, v8}, Ljava/security/cert/X509CertSelector;->setSubject([B)V
    :try_end_13
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_13} :catch_48

    .line 177
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .line 178
    .local v5, "iter":Ljava/util/Iterator;
    :cond_17
    :goto_17
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_75

    if-nez v6, :cond_75

    .line 180
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    .end local v6    # "trust":Ljava/security/cert/TrustAnchor;
    check-cast v6, Ljava/security/cert/TrustAnchor;

    .line 181
    .restart local v6    # "trust":Ljava/security/cert/TrustAnchor;
    invoke-virtual {v6}, Ljava/security/cert/TrustAnchor;->getTrustedCert()Ljava/security/cert/X509Certificate;

    move-result-object v8

    if-eqz v8, :cond_53

    .line 183
    invoke-virtual {v6}, Ljava/security/cert/TrustAnchor;->getTrustedCert()Ljava/security/cert/X509Certificate;

    move-result-object v8

    invoke-virtual {v2, v8}, Ljava/security/cert/X509CertSelector;->match(Ljava/security/cert/Certificate;)Z

    move-result v8

    if-eqz v8, :cond_51

    .line 185
    invoke-virtual {v6}, Ljava/security/cert/TrustAnchor;->getTrustedCert()Ljava/security/cert/X509Certificate;

    move-result-object v8

    invoke-virtual {v8}, Ljava/security/cert/X509Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v7

    .line 217
    :goto_3d
    if-eqz v7, :cond_17

    .line 221
    :try_start_3f
    invoke-static {p0, v7, p2}, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->verifyX509Certificate(Ljava/security/cert/X509Certificate;Ljava/security/PublicKey;Ljava/lang/String;)V
    :try_end_42
    .catch Ljava/lang/Exception; {:try_start_3f .. :try_end_42} :catch_43

    goto :goto_17

    .line 223
    :catch_43
    move-exception v3

    .line 225
    .local v3, "ex":Ljava/lang/Exception;
    move-object v4, v3

    .line 226
    const/4 v6, 0x0

    .line 227
    const/4 v7, 0x0

    .line 228
    goto :goto_17

    .line 172
    .end local v3    # "ex":Ljava/lang/Exception;
    .end local v5    # "iter":Ljava/util/Iterator;
    :catch_48
    move-exception v3

    .line 174
    .local v3, "ex":Ljava/io/IOException;
    new-instance v8, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v9, "Cannot set subject search criteria for trust anchor."

    invoke-direct {v8, v9, v3}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v8

    .line 189
    .end local v3    # "ex":Ljava/io/IOException;
    .restart local v5    # "iter":Ljava/util/Iterator;
    :cond_51
    const/4 v6, 0x0

    goto :goto_3d

    .line 192
    :cond_53
    invoke-virtual {v6}, Ljava/security/cert/TrustAnchor;->getCAName()Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_73

    .line 193
    invoke-virtual {v6}, Ljava/security/cert/TrustAnchor;->getCAPublicKey()Ljava/security/PublicKey;

    move-result-object v8

    if-eqz v8, :cond_73

    .line 197
    :try_start_5f
    invoke-static {v6}, Lorg/spongycastle/jce/provider/PrincipalUtils;->getCA(Ljava/security/cert/TrustAnchor;)Lorg/spongycastle/asn1/x500/X500Name;

    move-result-object v0

    .line 198
    .local v0, "caName":Lorg/spongycastle/asn1/x500/X500Name;
    invoke-virtual {v1, v0}, Lorg/spongycastle/asn1/x500/X500Name;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_6e

    .line 200
    invoke-virtual {v6}, Ljava/security/cert/TrustAnchor;->getCAPublicKey()Ljava/security/PublicKey;
    :try_end_6c
    .catch Ljava/lang/IllegalArgumentException; {:try_start_5f .. :try_end_6c} :catch_70

    move-result-object v7

    goto :goto_3d

    .line 204
    :cond_6e
    const/4 v6, 0x0

    goto :goto_3d

    .line 207
    .end local v0    # "caName":Lorg/spongycastle/asn1/x500/X500Name;
    :catch_70
    move-exception v3

    .line 209
    .local v3, "ex":Ljava/lang/IllegalArgumentException;
    const/4 v6, 0x0

    .line 210
    goto :goto_3d

    .line 214
    .end local v3    # "ex":Ljava/lang/IllegalArgumentException;
    :cond_73
    const/4 v6, 0x0

    goto :goto_3d

    .line 232
    :cond_75
    if-nez v6, :cond_81

    if-eqz v4, :cond_81

    .line 234
    new-instance v8, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v9, "TrustAnchor found but certificate validation failed."

    invoke-direct {v8, v9, v4}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v8

    .line 237
    :cond_81
    return-object v6
.end method

.method static getAdditionalStoresFromAltNames([BLjava/util/Map;)Ljava/util/List;
    .registers 9
    .param p0, "issuerAlternativeName"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([B",
            "Ljava/util/Map",
            "<",
            "Lorg/spongycastle/asn1/x509/GeneralName;",
            "Lorg/spongycastle/jcajce/PKIXCertStore;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Lorg/spongycastle/jcajce/PKIXCertStore;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateParsingException;
        }
    .end annotation

    .prologue
    .line 247
    .local p1, "altNameCertStoreMap":Ljava/util/Map;, "Ljava/util/Map<Lorg/spongycastle/asn1/x509/GeneralName;Lorg/spongycastle/jcajce/PKIXCertStore;>;"
    if-eqz p0, :cond_2b

    .line 249
    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1OctetString;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1OctetString;

    move-result-object v6

    invoke-virtual {v6}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v6

    invoke-static {v6}, Lorg/spongycastle/asn1/x509/GeneralNames;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/GeneralNames;

    move-result-object v3

    .line 251
    .local v3, "issuerAltName":Lorg/spongycastle/asn1/x509/GeneralNames;
    invoke-virtual {v3}, Lorg/spongycastle/asn1/x509/GeneralNames;->getNames()[Lorg/spongycastle/asn1/x509/GeneralName;

    move-result-object v4

    .line 252
    .local v4, "names":[Lorg/spongycastle/asn1/x509/GeneralName;
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 254
    .local v5, "stores":Ljava/util/List;, "Ljava/util/List<Lorg/spongycastle/jcajce/PKIXCertStore;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_18
    array-length v6, v4

    if-eq v2, v6, :cond_2d

    .line 256
    aget-object v0, v4, v2

    .line 258
    .local v0, "altName":Lorg/spongycastle/asn1/x509/GeneralName;
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/spongycastle/jcajce/PKIXCertStore;

    .line 260
    .local v1, "altStore":Lorg/spongycastle/jcajce/PKIXCertStore;
    if-eqz v1, :cond_28

    .line 262
    invoke-interface {v5, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 254
    :cond_28
    add-int/lit8 v2, v2, 0x1

    goto :goto_18

    .line 270
    .end local v0    # "altName":Lorg/spongycastle/asn1/x509/GeneralName;
    .end local v1    # "altStore":Lorg/spongycastle/jcajce/PKIXCertStore;
    .end local v2    # "i":I
    .end local v3    # "issuerAltName":Lorg/spongycastle/asn1/x509/GeneralNames;
    .end local v4    # "names":[Lorg/spongycastle/asn1/x509/GeneralName;
    .end local v5    # "stores":Ljava/util/List;, "Ljava/util/List<Lorg/spongycastle/jcajce/PKIXCertStore;>;"
    :cond_2b
    sget-object v5, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    :cond_2d
    return-object v5
.end method

.method static getAdditionalStoresFromCRLDistributionPoint(Lorg/spongycastle/asn1/x509/CRLDistPoint;Ljava/util/Map;)Ljava/util/List;
    .registers 12
    .param p0, "crldp"    # Lorg/spongycastle/asn1/x509/CRLDistPoint;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/spongycastle/asn1/x509/CRLDistPoint;",
            "Ljava/util/Map",
            "<",
            "Lorg/spongycastle/asn1/x509/GeneralName;",
            "Lorg/spongycastle/jcajce/PKIXCRLStore;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Lorg/spongycastle/jcajce/PKIXCRLStore;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/jce/provider/AnnotatedException;
        }
    .end annotation

    .prologue
    .line 693
    .local p1, "namedCRLStoreMap":Ljava/util/Map;, "Ljava/util/Map<Lorg/spongycastle/asn1/x509/GeneralName;Lorg/spongycastle/jcajce/PKIXCRLStore;>;"
    if-eqz p0, :cond_4a

    .line 695
    const/4 v1, 0x0

    .line 698
    .local v1, "dps":[Lorg/spongycastle/asn1/x509/DistributionPoint;
    :try_start_3
    invoke-virtual {p0}, Lorg/spongycastle/asn1/x509/CRLDistPoint;->getDistributionPoints()[Lorg/spongycastle/asn1/x509/DistributionPoint;
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_6} :catch_3e

    move-result-object v1

    .line 705
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 707
    .local v7, "stores":Ljava/util/List;, "Ljava/util/List<Lorg/spongycastle/jcajce/PKIXCRLStore;>;"
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_d
    array-length v8, v1

    if-ge v4, v8, :cond_4c

    .line 709
    aget-object v8, v1, v4

    invoke-virtual {v8}, Lorg/spongycastle/asn1/x509/DistributionPoint;->getDistributionPoint()Lorg/spongycastle/asn1/x509/DistributionPointName;

    move-result-object v0

    .line 711
    .local v0, "dpn":Lorg/spongycastle/asn1/x509/DistributionPointName;
    if-eqz v0, :cond_47

    .line 713
    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/DistributionPointName;->getType()I

    move-result v8

    if-nez v8, :cond_47

    .line 716
    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/DistributionPointName;->getName()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v8

    .line 715
    invoke-static {v8}, Lorg/spongycastle/asn1/x509/GeneralNames;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/GeneralNames;

    move-result-object v8

    .line 716
    invoke-virtual {v8}, Lorg/spongycastle/asn1/x509/GeneralNames;->getNames()[Lorg/spongycastle/asn1/x509/GeneralName;

    move-result-object v3

    .line 718
    .local v3, "genNames":[Lorg/spongycastle/asn1/x509/GeneralName;
    const/4 v5, 0x0

    .local v5, "j":I
    :goto_2b
    array-length v8, v3

    if-ge v5, v8, :cond_47

    .line 720
    aget-object v8, v3, v5

    invoke-interface {p1, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/spongycastle/jcajce/PKIXCRLStore;

    .line 721
    .local v6, "store":Lorg/spongycastle/jcajce/PKIXCRLStore;
    if-eqz v6, :cond_3b

    .line 723
    invoke-interface {v7, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 718
    :cond_3b
    add-int/lit8 v5, v5, 0x1

    goto :goto_2b

    .line 700
    .end local v0    # "dpn":Lorg/spongycastle/asn1/x509/DistributionPointName;
    .end local v3    # "genNames":[Lorg/spongycastle/asn1/x509/GeneralName;
    .end local v4    # "i":I
    .end local v5    # "j":I
    .end local v6    # "store":Lorg/spongycastle/jcajce/PKIXCRLStore;
    .end local v7    # "stores":Ljava/util/List;, "Ljava/util/List<Lorg/spongycastle/jcajce/PKIXCRLStore;>;"
    :catch_3e
    move-exception v2

    .line 702
    .local v2, "e":Ljava/lang/Exception;
    new-instance v8, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v9, "Distribution points could not be read."

    invoke-direct {v8, v9, v2}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v8

    .line 707
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v0    # "dpn":Lorg/spongycastle/asn1/x509/DistributionPointName;
    .restart local v4    # "i":I
    .restart local v7    # "stores":Ljava/util/List;, "Ljava/util/List<Lorg/spongycastle/jcajce/PKIXCRLStore;>;"
    :cond_47
    add-int/lit8 v4, v4, 0x1

    goto :goto_d

    .line 734
    .end local v0    # "dpn":Lorg/spongycastle/asn1/x509/DistributionPointName;
    .end local v1    # "dps":[Lorg/spongycastle/asn1/x509/DistributionPoint;
    .end local v4    # "i":I
    .end local v7    # "stores":Ljava/util/List;, "Ljava/util/List<Lorg/spongycastle/jcajce/PKIXCRLStore;>;"
    :cond_4a
    sget-object v7, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    :cond_4c
    return-object v7
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
    .line 338
    :try_start_0
    new-instance v0, Lorg/spongycastle/asn1/ASN1InputStream;

    invoke-interface {p0}, Ljava/security/PublicKey;->getEncoded()[B

    move-result-object v3

    invoke-direct {v0, v3}, Lorg/spongycastle/asn1/ASN1InputStream;-><init>([B)V

    .line 340
    .local v0, "aIn":Lorg/spongycastle/asn1/ASN1InputStream;
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1InputStream;->readObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v3

    invoke-static {v3}, Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;

    move-result-object v2

    .line 342
    .local v2, "info":Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;
    invoke-virtual {v2}, Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;->getAlgorithm()Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_14} :catch_16

    move-result-object v3

    return-object v3

    .line 344
    .end local v0    # "aIn":Lorg/spongycastle/asn1/ASN1InputStream;
    .end local v2    # "info":Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;
    :catch_16
    move-exception v1

    .line 346
    .local v1, "e":Ljava/lang/Exception;
    new-instance v3, Lorg/spongycastle/jce/exception/ExtCertPathValidatorException;

    const-string v4, "Subject public key cannot be decoded."

    invoke-direct {v3, v4, v1}, Lorg/spongycastle/jce/exception/ExtCertPathValidatorException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method protected static getCRLIssuersFromDistributionPoint(Lorg/spongycastle/asn1/x509/DistributionPoint;Ljava/util/Collection;Ljava/security/cert/X509CRLSelector;)V
    .registers 11
    .param p0, "dp"    # Lorg/spongycastle/asn1/x509/DistributionPoint;
    .param p1, "issuerPrincipals"    # Ljava/util/Collection;
    .param p2, "selector"    # Ljava/security/cert/X509CRLSelector;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/jce/provider/AnnotatedException;
        }
    .end annotation

    .prologue
    .line 760
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 762
    .local v3, "issuers":Ljava/util/List;
    invoke-virtual {p0}, Lorg/spongycastle/asn1/x509/DistributionPoint;->getCRLIssuer()Lorg/spongycastle/asn1/x509/GeneralNames;

    move-result-object v6

    if-eqz v6, :cond_41

    .line 764
    invoke-virtual {p0}, Lorg/spongycastle/asn1/x509/DistributionPoint;->getCRLIssuer()Lorg/spongycastle/asn1/x509/GeneralNames;

    move-result-object v6

    invoke-virtual {v6}, Lorg/spongycastle/asn1/x509/GeneralNames;->getNames()[Lorg/spongycastle/asn1/x509/GeneralName;

    move-result-object v2

    .line 766
    .local v2, "genNames":[Lorg/spongycastle/asn1/x509/GeneralName;
    const/4 v5, 0x0

    .local v5, "j":I
    :goto_14
    array-length v6, v2

    if-ge v5, v6, :cond_61

    .line 768
    aget-object v6, v2, v5

    invoke-virtual {v6}, Lorg/spongycastle/asn1/x509/GeneralName;->getTagNo()I

    move-result v6

    const/4 v7, 0x4

    if-ne v6, v7, :cond_35

    .line 772
    :try_start_20
    aget-object v6, v2, v5

    invoke-virtual {v6}, Lorg/spongycastle/asn1/x509/GeneralName;->getName()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v6

    .line 773
    invoke-interface {v6}, Lorg/spongycastle/asn1/ASN1Encodable;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v6

    invoke-virtual {v6}, Lorg/spongycastle/asn1/ASN1Primitive;->getEncoded()[B

    move-result-object v6

    .line 772
    invoke-static {v6}, Lorg/spongycastle/asn1/x500/X500Name;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x500/X500Name;

    move-result-object v6

    invoke-interface {v3, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_35
    .catch Ljava/io/IOException; {:try_start_20 .. :try_end_35} :catch_38

    .line 766
    :cond_35
    add-int/lit8 v5, v5, 0x1

    goto :goto_14

    .line 775
    :catch_38
    move-exception v0

    .line 777
    .local v0, "e":Ljava/io/IOException;
    new-instance v6, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v7, "CRL issuer information from distribution point cannot be decoded."

    invoke-direct {v6, v7, v0}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 790
    .end local v0    # "e":Ljava/io/IOException;
    .end local v2    # "genNames":[Lorg/spongycastle/asn1/x509/GeneralName;
    .end local v5    # "j":I
    :cond_41
    invoke-virtual {p0}, Lorg/spongycastle/asn1/x509/DistributionPoint;->getDistributionPoint()Lorg/spongycastle/asn1/x509/DistributionPointName;

    move-result-object v6

    if-nez v6, :cond_4f

    .line 792
    new-instance v6, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v7, "CRL issuer is omitted from distribution point but no distributionPoint field present."

    invoke-direct {v6, v7}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 796
    :cond_4f
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "it":Ljava/util/Iterator;
    :goto_53
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_61

    .line 798
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    invoke-interface {v3, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_53

    .line 845
    .end local v4    # "it":Ljava/util/Iterator;
    :cond_61
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 846
    .restart local v4    # "it":Ljava/util/Iterator;
    :goto_65
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_82

    .line 850
    :try_start_6b
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/spongycastle/asn1/x500/X500Name;

    invoke-virtual {v6}, Lorg/spongycastle/asn1/x500/X500Name;->getEncoded()[B

    move-result-object v6

    invoke-virtual {p2, v6}, Ljava/security/cert/X509CRLSelector;->addIssuerName([B)V
    :try_end_78
    .catch Ljava/io/IOException; {:try_start_6b .. :try_end_78} :catch_79

    goto :goto_65

    .line 852
    :catch_79
    move-exception v1

    .line 854
    .local v1, "ex":Ljava/io/IOException;
    new-instance v6, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v7, "Cannot decode CRL issuer information."

    invoke-direct {v6, v7, v1}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 858
    .end local v1    # "ex":Ljava/io/IOException;
    :cond_82
    return-void
.end method

.method protected static getCertStatus(Ljava/util/Date;Ljava/security/cert/X509CRL;Ljava/lang/Object;Lorg/spongycastle/jce/provider/CertStatus;)V
    .registers 15
    .param p0, "validDate"    # Ljava/util/Date;
    .param p1, "crl"    # Ljava/security/cert/X509CRL;
    .param p2, "cert"    # Ljava/lang/Object;
    .param p3, "certStatus"    # Lorg/spongycastle/jce/provider/CertStatus;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/jce/provider/AnnotatedException;
        }
    .end annotation

    .prologue
    .line 873
    const/4 v2, 0x0

    .line 878
    .local v2, "crl_entry":Ljava/security/cert/X509CRLEntry;
    :try_start_1
    invoke-static {p1}, Lorg/spongycastle/jce/provider/X509CRLObject;->isIndirectCRL(Ljava/security/cert/X509CRL;)Z
    :try_end_4
    .catch Ljava/security/cert/CRLException; {:try_start_1 .. :try_end_4} :catch_12

    move-result v5

    .line 885
    .local v5, "isIndirect":Z
    if-eqz v5, :cond_a1

    .line 887
    invoke-static {p2}, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->getSerialNumber(Ljava/lang/Object;)Ljava/math/BigInteger;

    move-result-object v7

    invoke-virtual {p1, v7}, Ljava/security/cert/X509CRL;->getRevokedCertificate(Ljava/math/BigInteger;)Ljava/security/cert/X509CRLEntry;

    move-result-object v2

    .line 889
    if-nez v2, :cond_1b

    .line 965
    :cond_11
    :goto_11
    return-void

    .line 880
    .end local v5    # "isIndirect":Z
    :catch_12
    move-exception v4

    .line 882
    .local v4, "exception":Ljava/security/cert/CRLException;
    new-instance v7, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v8, "Failed check for indirect CRL."

    invoke-direct {v7, v8, v4}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v7

    .line 894
    .end local v4    # "exception":Ljava/security/cert/CRLException;
    .restart local v5    # "isIndirect":Z
    :cond_1b
    invoke-virtual {v2}, Ljava/security/cert/X509CRLEntry;->getCertificateIssuer()Ljavax/security/auth/x500/X500Principal;

    move-result-object v1

    .line 897
    .local v1, "certificateIssuer":Ljavax/security/auth/x500/X500Principal;
    if-nez v1, :cond_98

    .line 899
    invoke-static {p1}, Lorg/spongycastle/jce/provider/PrincipalUtils;->getIssuerPrincipal(Ljava/security/cert/X509CRL;)Lorg/spongycastle/asn1/x500/X500Name;

    move-result-object v0

    .line 906
    .local v0, "certIssuer":Lorg/spongycastle/asn1/x500/X500Name;
    :goto_25
    invoke-static {p2}, Lorg/spongycastle/jce/provider/PrincipalUtils;->getEncodedIssuerPrincipal(Ljava/lang/Object;)Lorg/spongycastle/asn1/x500/X500Name;

    move-result-object v7

    invoke-virtual {v7, v0}, Lorg/spongycastle/asn1/x500/X500Name;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_11

    .line 925
    .end local v0    # "certIssuer":Lorg/spongycastle/asn1/x500/X500Name;
    .end local v1    # "certificateIssuer":Ljavax/security/auth/x500/X500Principal;
    :cond_2f
    const/4 v6, 0x0

    .line 926
    .local v6, "reasonCode":Lorg/spongycastle/asn1/ASN1Enumerated;
    invoke-virtual {v2}, Ljava/security/cert/X509CRLEntry;->hasExtensions()Z

    move-result v7

    if-eqz v7, :cond_44

    .line 930
    :try_start_36
    sget-object v7, Lorg/spongycastle/asn1/x509/Extension;->reasonCode:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 933
    invoke-virtual {v7}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v7

    .line 932
    invoke-static {v2, v7}, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->getExtensionValue(Ljava/security/cert/X509Extension;Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v7

    .line 931
    invoke-static {v7}, Lorg/spongycastle/asn1/ASN1Enumerated;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Enumerated;
    :try_end_43
    .catch Ljava/lang/Exception; {:try_start_36 .. :try_end_43} :catch_bb

    move-result-object v6

    .line 945
    :cond_44
    invoke-virtual {p0}, Ljava/util/Date;->getTime()J

    move-result-wide v7

    invoke-virtual {v2}, Ljava/security/cert/X509CRLEntry;->getRevocationDate()Ljava/util/Date;

    move-result-object v9

    invoke-virtual {v9}, Ljava/util/Date;->getTime()J

    move-result-wide v9

    cmp-long v7, v7, v9

    if-gez v7, :cond_82

    if-eqz v6, :cond_82

    .line 947
    invoke-virtual {v6}, Lorg/spongycastle/asn1/ASN1Enumerated;->getValue()Ljava/math/BigInteger;

    move-result-object v7

    invoke-virtual {v7}, Ljava/math/BigInteger;->intValue()I

    move-result v7

    if-eqz v7, :cond_82

    .line 948
    invoke-virtual {v6}, Lorg/spongycastle/asn1/ASN1Enumerated;->getValue()Ljava/math/BigInteger;

    move-result-object v7

    invoke-virtual {v7}, Ljava/math/BigInteger;->intValue()I

    move-result v7

    const/4 v8, 0x1

    if-eq v7, v8, :cond_82

    .line 949
    invoke-virtual {v6}, Lorg/spongycastle/asn1/ASN1Enumerated;->getValue()Ljava/math/BigInteger;

    move-result-object v7

    invoke-virtual {v7}, Ljava/math/BigInteger;->intValue()I

    move-result v7

    const/4 v8, 0x2

    if-eq v7, v8, :cond_82

    .line 950
    invoke-virtual {v6}, Lorg/spongycastle/asn1/ASN1Enumerated;->getValue()Ljava/math/BigInteger;

    move-result-object v7

    invoke-virtual {v7}, Ljava/math/BigInteger;->intValue()I

    move-result v7

    const/16 v8, 0x8

    if-ne v7, v8, :cond_11

    .line 954
    :cond_82
    if-eqz v6, :cond_c4

    .line 956
    invoke-virtual {v6}, Lorg/spongycastle/asn1/ASN1Enumerated;->getValue()Ljava/math/BigInteger;

    move-result-object v7

    invoke-virtual {v7}, Ljava/math/BigInteger;->intValue()I

    move-result v7

    invoke-virtual {p3, v7}, Lorg/spongycastle/jce/provider/CertStatus;->setCertStatus(I)V

    .line 963
    :goto_8f
    invoke-virtual {v2}, Ljava/security/cert/X509CRLEntry;->getRevocationDate()Ljava/util/Date;

    move-result-object v7

    invoke-virtual {p3, v7}, Lorg/spongycastle/jce/provider/CertStatus;->setRevocationDate(Ljava/util/Date;)V

    goto/16 :goto_11

    .line 903
    .end local v6    # "reasonCode":Lorg/spongycastle/asn1/ASN1Enumerated;
    .restart local v1    # "certificateIssuer":Ljavax/security/auth/x500/X500Principal;
    :cond_98
    invoke-virtual {v1}, Ljavax/security/auth/x500/X500Principal;->getEncoded()[B

    move-result-object v7

    invoke-static {v7}, Lorg/spongycastle/asn1/x500/X500Name;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x500/X500Name;

    move-result-object v0

    .restart local v0    # "certIssuer":Lorg/spongycastle/asn1/x500/X500Name;
    goto :goto_25

    .line 911
    .end local v0    # "certIssuer":Lorg/spongycastle/asn1/x500/X500Name;
    .end local v1    # "certificateIssuer":Ljavax/security/auth/x500/X500Principal;
    :cond_a1
    invoke-static {p2}, Lorg/spongycastle/jce/provider/PrincipalUtils;->getEncodedIssuerPrincipal(Ljava/lang/Object;)Lorg/spongycastle/asn1/x500/X500Name;

    move-result-object v7

    invoke-static {p1}, Lorg/spongycastle/jce/provider/PrincipalUtils;->getIssuerPrincipal(Ljava/security/cert/X509CRL;)Lorg/spongycastle/asn1/x500/X500Name;

    move-result-object v8

    invoke-virtual {v7, v8}, Lorg/spongycastle/asn1/x500/X500Name;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_11

    .line 917
    invoke-static {p2}, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->getSerialNumber(Ljava/lang/Object;)Ljava/math/BigInteger;

    move-result-object v7

    invoke-virtual {p1, v7}, Ljava/security/cert/X509CRL;->getRevokedCertificate(Ljava/math/BigInteger;)Ljava/security/cert/X509CRLEntry;

    move-result-object v2

    .line 919
    if-nez v2, :cond_2f

    goto/16 :goto_11

    .line 935
    .restart local v6    # "reasonCode":Lorg/spongycastle/asn1/ASN1Enumerated;
    :catch_bb
    move-exception v3

    .line 937
    .local v3, "e":Ljava/lang/Exception;
    new-instance v7, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v8, "Reason code CRL entry extension could not be decoded."

    invoke-direct {v7, v8, v3}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v7

    .line 961
    .end local v3    # "e":Ljava/lang/Exception;
    :cond_c4
    const/4 v7, 0x0

    invoke-virtual {p3, v7}, Lorg/spongycastle/jce/provider/CertStatus;->setCertStatus(I)V

    goto :goto_8f
.end method

.method protected static getCompleteCRLs(Lorg/spongycastle/asn1/x509/DistributionPoint;Ljava/lang/Object;Ljava/util/Date;Lorg/spongycastle/jcajce/PKIXExtendedParameters;)Ljava/util/Set;
    .registers 13
    .param p0, "dp"    # Lorg/spongycastle/asn1/x509/DistributionPoint;
    .param p1, "cert"    # Ljava/lang/Object;
    .param p2, "currentDate"    # Ljava/util/Date;
    .param p3, "paramsPKIX"    # Lorg/spongycastle/jcajce/PKIXExtendedParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/jce/provider/AnnotatedException;
        }
    .end annotation

    .prologue
    .line 1084
    new-instance v0, Ljava/security/cert/X509CRLSelector;

    invoke-direct {v0}, Ljava/security/cert/X509CRLSelector;-><init>()V

    .line 1088
    .local v0, "baseCrlSelect":Ljava/security/cert/X509CRLSelector;
    :try_start_5
    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    .line 1090
    .local v4, "issuers":Ljava/util/Set;
    invoke-static {p1}, Lorg/spongycastle/jce/provider/PrincipalUtils;->getEncodedIssuerPrincipal(Ljava/lang/Object;)Lorg/spongycastle/asn1/x500/X500Name;

    move-result-object v6

    invoke-interface {v4, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1092
    invoke-static {p0, v4, v0}, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->getCRLIssuersFromDistributionPoint(Lorg/spongycastle/asn1/x509/DistributionPoint;Ljava/util/Collection;Ljava/security/cert/X509CRLSelector;)V
    :try_end_14
    .catch Lorg/spongycastle/jce/provider/AnnotatedException; {:try_start_5 .. :try_end_14} :catch_49

    .line 1100
    instance-of v6, p1, Ljava/security/cert/X509Certificate;

    if-eqz v6, :cond_1e

    move-object v6, p1

    .line 1102
    check-cast v6, Ljava/security/cert/X509Certificate;

    invoke-virtual {v0, v6}, Ljava/security/cert/X509CRLSelector;->setCertificateChecking(Ljava/security/cert/X509Certificate;)V

    .line 1105
    :cond_1e
    new-instance v6, Lorg/spongycastle/jcajce/PKIXCRLStoreSelector$Builder;

    invoke-direct {v6, v0}, Lorg/spongycastle/jcajce/PKIXCRLStoreSelector$Builder;-><init>(Ljava/security/cert/CRLSelector;)V

    const/4 v7, 0x1

    invoke-virtual {v6, v7}, Lorg/spongycastle/jcajce/PKIXCRLStoreSelector$Builder;->setCompleteCRLEnabled(Z)Lorg/spongycastle/jcajce/PKIXCRLStoreSelector$Builder;

    move-result-object v6

    invoke-virtual {v6}, Lorg/spongycastle/jcajce/PKIXCRLStoreSelector$Builder;->build()Lorg/spongycastle/jcajce/PKIXCRLStoreSelector;

    move-result-object v1

    .line 1107
    .local v1, "crlSelect":Lorg/spongycastle/jcajce/PKIXCRLStoreSelector;
    move-object v5, p2

    .line 1109
    .local v5, "validityDate":Ljava/util/Date;
    invoke-virtual {p3}, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->getDate()Ljava/util/Date;

    move-result-object v6

    if-eqz v6, :cond_37

    .line 1111
    invoke-virtual {p3}, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->getDate()Ljava/util/Date;

    move-result-object v5

    .line 1114
    :cond_37
    sget-object v6, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->CRL_UTIL:Lorg/spongycastle/jce/provider/PKIXCRLUtil;

    invoke-virtual {p3}, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->getCertStores()Ljava/util/List;

    move-result-object v7

    invoke-virtual {p3}, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->getCRLStores()Ljava/util/List;

    move-result-object v8

    invoke-virtual {v6, v1, v5, v7, v8}, Lorg/spongycastle/jce/provider/PKIXCRLUtil;->findCRLs(Lorg/spongycastle/jcajce/PKIXCRLStoreSelector;Ljava/util/Date;Ljava/util/List;Ljava/util/List;)Ljava/util/Set;

    move-result-object v2

    .line 1116
    .local v2, "crls":Ljava/util/Set;
    invoke-static {v2, p1}, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->checkCRLsNotEmpty(Ljava/util/Set;Ljava/lang/Object;)V

    .line 1118
    return-object v2

    .line 1094
    .end local v1    # "crlSelect":Lorg/spongycastle/jcajce/PKIXCRLStoreSelector;
    .end local v2    # "crls":Ljava/util/Set;
    .end local v4    # "issuers":Ljava/util/Set;
    .end local v5    # "validityDate":Ljava/util/Date;
    :catch_49
    move-exception v3

    .line 1096
    .local v3, "e":Lorg/spongycastle/jce/provider/AnnotatedException;
    new-instance v6, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v7, "Could not get issuer information from distribution point."

    invoke-direct {v6, v7, v3}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6
.end method

.method protected static getDeltaCRLs(Ljava/util/Date;Ljava/security/cert/X509CRL;Ljava/util/List;Ljava/util/List;)Ljava/util/Set;
    .registers 19
    .param p0, "validityDate"    # Ljava/util/Date;
    .param p1, "completeCRL"    # Ljava/security/cert/X509CRL;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Date;",
            "Ljava/security/cert/X509CRL;",
            "Ljava/util/List",
            "<",
            "Ljava/security/cert/CertStore;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lorg/spongycastle/jcajce/PKIXCRLStore;",
            ">;)",
            "Ljava/util/Set;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/jce/provider/AnnotatedException;
        }
    .end annotation

    .prologue
    .line 980
    .local p2, "certStores":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/CertStore;>;"
    .local p3, "pkixCrlStores":Ljava/util/List;, "Ljava/util/List<Lorg/spongycastle/jcajce/PKIXCRLStore;>;"
    new-instance v2, Ljava/security/cert/X509CRLSelector;

    invoke-direct {v2}, Ljava/security/cert/X509CRLSelector;-><init>()V

    .line 984
    .local v2, "baseDeltaSelect":Ljava/security/cert/X509CRLSelector;
    :try_start_5
    invoke-static/range {p1 .. p1}, Lorg/spongycastle/jce/provider/PrincipalUtils;->getIssuerPrincipal(Ljava/security/cert/X509CRL;)Lorg/spongycastle/asn1/x500/X500Name;

    move-result-object v13

    invoke-virtual {v13}, Lorg/spongycastle/asn1/x500/X500Name;->getEncoded()[B

    move-result-object v13

    invoke-virtual {v2, v13}, Ljava/security/cert/X509CRLSelector;->addIssuerName([B)V
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_10} :catch_6e

    .line 993
    const/4 v3, 0x0

    .line 996
    .local v3, "completeCRLNumber":Ljava/math/BigInteger;
    :try_start_11
    sget-object v13, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->CRL_NUMBER:Ljava/lang/String;

    move-object/from16 v0, p1

    invoke-static {v0, v13}, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->getExtensionValue(Ljava/security/cert/X509Extension;Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v6

    .line 998
    .local v6, "derObject":Lorg/spongycastle/asn1/ASN1Primitive;
    if-eqz v6, :cond_23

    .line 1000
    invoke-static {v6}, Lorg/spongycastle/asn1/ASN1Integer;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Integer;

    move-result-object v13

    invoke-virtual {v13}, Lorg/spongycastle/asn1/ASN1Integer;->getPositiveValue()Ljava/math/BigInteger;
    :try_end_22
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_22} :catch_77

    move-result-object v3

    .line 1010
    :cond_23
    const/4 v8, 0x0

    .line 1013
    .local v8, "idp":[B
    :try_start_24
    sget-object v13, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->ISSUING_DISTRIBUTION_POINT:Ljava/lang/String;

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Ljava/security/cert/X509CRL;->getExtensionValue(Ljava/lang/String;)[B
    :try_end_2b
    .catch Ljava/lang/Exception; {:try_start_24 .. :try_end_2b} :catch_80

    move-result-object v8

    .line 1024
    if-nez v3, :cond_89

    const/4 v13, 0x0

    :goto_2f
    invoke-virtual {v2, v13}, Ljava/security/cert/X509CRLSelector;->setMinCRLNumber(Ljava/math/BigInteger;)V

    .line 1027
    new-instance v11, Lorg/spongycastle/jcajce/PKIXCRLStoreSelector$Builder;

    invoke-direct {v11, v2}, Lorg/spongycastle/jcajce/PKIXCRLStoreSelector$Builder;-><init>(Ljava/security/cert/CRLSelector;)V

    .line 1029
    .local v11, "selBuilder":Lorg/spongycastle/jcajce/PKIXCRLStoreSelector$Builder;
    invoke-virtual {v11, v8}, Lorg/spongycastle/jcajce/PKIXCRLStoreSelector$Builder;->setIssuingDistributionPoint([B)V

    .line 1030
    const/4 v13, 0x1

    invoke-virtual {v11, v13}, Lorg/spongycastle/jcajce/PKIXCRLStoreSelector$Builder;->setIssuingDistributionPointEnabled(Z)V

    .line 1033
    invoke-virtual {v11, v3}, Lorg/spongycastle/jcajce/PKIXCRLStoreSelector$Builder;->setMaxBaseCRLNumber(Ljava/math/BigInteger;)V

    .line 1035
    invoke-virtual {v11}, Lorg/spongycastle/jcajce/PKIXCRLStoreSelector$Builder;->build()Lorg/spongycastle/jcajce/PKIXCRLStoreSelector;

    move-result-object v5

    .line 1038
    .local v5, "deltaSelect":Lorg/spongycastle/jcajce/PKIXCRLStoreSelector;
    sget-object v13, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->CRL_UTIL:Lorg/spongycastle/jce/provider/PKIXCRLUtil;

    move-object/from16 v0, p2

    move-object/from16 v1, p3

    invoke-virtual {v13, v5, p0, v0, v1}, Lorg/spongycastle/jce/provider/PKIXCRLUtil;->findCRLs(Lorg/spongycastle/jcajce/PKIXCRLStoreSelector;Ljava/util/Date;Ljava/util/List;Ljava/util/List;)Ljava/util/Set;

    move-result-object v12

    .line 1040
    .local v12, "temp":Ljava/util/Set;
    new-instance v10, Ljava/util/HashSet;

    invoke-direct {v10}, Ljava/util/HashSet;-><init>()V

    .line 1042
    .local v10, "result":Ljava/util/Set;
    invoke-interface {v12}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .local v9, "it":Ljava/util/Iterator;
    :cond_58
    :goto_58
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_94

    .line 1044
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/security/cert/X509CRL;

    .line 1046
    .local v4, "crl":Ljava/security/cert/X509CRL;
    invoke-static {v4}, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->isDeltaCRL(Ljava/security/cert/X509CRL;)Z

    move-result v13

    if-eqz v13, :cond_58

    .line 1048
    invoke-interface {v10, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_58

    .line 986
    .end local v3    # "completeCRLNumber":Ljava/math/BigInteger;
    .end local v4    # "crl":Ljava/security/cert/X509CRL;
    .end local v5    # "deltaSelect":Lorg/spongycastle/jcajce/PKIXCRLStoreSelector;
    .end local v6    # "derObject":Lorg/spongycastle/asn1/ASN1Primitive;
    .end local v8    # "idp":[B
    .end local v9    # "it":Ljava/util/Iterator;
    .end local v10    # "result":Ljava/util/Set;
    .end local v11    # "selBuilder":Lorg/spongycastle/jcajce/PKIXCRLStoreSelector$Builder;
    .end local v12    # "temp":Ljava/util/Set;
    :catch_6e
    move-exception v7

    .line 988
    .local v7, "e":Ljava/io/IOException;
    new-instance v13, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v14, "Cannot extract issuer from CRL."

    invoke-direct {v13, v14, v7}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v13

    .line 1003
    .end local v7    # "e":Ljava/io/IOException;
    .restart local v3    # "completeCRLNumber":Ljava/math/BigInteger;
    :catch_77
    move-exception v7

    .line 1005
    .local v7, "e":Ljava/lang/Exception;
    new-instance v13, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v14, "CRL number extension could not be extracted from CRL."

    invoke-direct {v13, v14, v7}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v13

    .line 1015
    .end local v7    # "e":Ljava/lang/Exception;
    .restart local v6    # "derObject":Lorg/spongycastle/asn1/ASN1Primitive;
    .restart local v8    # "idp":[B
    :catch_80
    move-exception v7

    .line 1017
    .restart local v7    # "e":Ljava/lang/Exception;
    new-instance v13, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v14, "Issuing distribution point extension value could not be read."

    invoke-direct {v13, v14, v7}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v13

    .line 1024
    .end local v7    # "e":Ljava/lang/Exception;
    :cond_89
    const-wide/16 v13, 0x1

    .line 1025
    invoke-static {v13, v14}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v13

    invoke-virtual {v3, v13}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v13

    goto :goto_2f

    .line 1052
    .restart local v5    # "deltaSelect":Lorg/spongycastle/jcajce/PKIXCRLStoreSelector;
    .restart local v9    # "it":Ljava/util/Iterator;
    .restart local v10    # "result":Ljava/util/Set;
    .restart local v11    # "selBuilder":Lorg/spongycastle/jcajce/PKIXCRLStoreSelector$Builder;
    .restart local v12    # "temp":Ljava/util/Set;
    :cond_94
    return-object v10
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
    .line 304
    invoke-interface {p0, p1}, Ljava/security/cert/X509Extension;->getExtensionValue(Ljava/lang/String;)[B

    move-result-object v0

    .line 305
    .local v0, "bytes":[B
    if-nez v0, :cond_8

    .line 307
    const/4 v1, 0x0

    .line 310
    :goto_7
    return-object v1

    :cond_8
    invoke-static {p1, v0}, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->getObject(Ljava/lang/String;[B)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v1

    goto :goto_7
.end method

.method protected static getNextWorkingKey(Ljava/util/List;ILorg/spongycastle/jcajce/util/JcaJceHelper;)Ljava/security/PublicKey;
    .registers 18
    .param p0, "certs"    # Ljava/util/List;
    .param p1, "index"    # I
    .param p2, "helper"    # Lorg/spongycastle/jcajce/util/JcaJceHelper;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertPathValidatorException;
        }
    .end annotation

    .prologue
    .line 1209
    invoke-interface/range {p0 .. p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/security/cert/Certificate;

    .line 1210
    .local v1, "cert":Ljava/security/cert/Certificate;
    invoke-virtual {v1}, Ljava/security/cert/Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v10

    .line 1211
    .local v10, "pubKey":Ljava/security/PublicKey;
    instance-of v11, v10, Ljava/security/interfaces/DSAPublicKey;

    if-nez v11, :cond_10

    move-object v3, v10

    .line 1240
    :cond_f
    :goto_f
    return-object v3

    :cond_10
    move-object v3, v10

    .line 1215
    check-cast v3, Ljava/security/interfaces/DSAPublicKey;

    .line 1216
    .local v3, "dsaPubKey":Ljava/security/interfaces/DSAPublicKey;
    invoke-interface {v3}, Ljava/security/interfaces/DSAPublicKey;->getParams()Ljava/security/interfaces/DSAParams;

    move-result-object v11

    if-nez v11, :cond_f

    .line 1220
    add-int/lit8 v6, p1, 0x1

    .local v6, "i":I
    :goto_1b
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v11

    if-ge v6, v11, :cond_74

    .line 1222
    invoke-interface {p0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/security/cert/X509Certificate;

    .line 1223
    .local v8, "parentCert":Ljava/security/cert/X509Certificate;
    invoke-virtual {v8}, Ljava/security/cert/X509Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v10

    .line 1224
    instance-of v11, v10, Ljava/security/interfaces/DSAPublicKey;

    if-nez v11, :cond_37

    .line 1226
    new-instance v11, Ljava/security/cert/CertPathValidatorException;

    const-string v12, "DSA parameters cannot be inherited from previous certificate."

    invoke-direct {v11, v12}, Ljava/security/cert/CertPathValidatorException;-><init>(Ljava/lang/String;)V

    throw v11

    :cond_37
    move-object v9, v10

    .line 1229
    check-cast v9, Ljava/security/interfaces/DSAPublicKey;

    .line 1230
    .local v9, "prevDSAPubKey":Ljava/security/interfaces/DSAPublicKey;
    invoke-interface {v9}, Ljava/security/interfaces/DSAPublicKey;->getParams()Ljava/security/interfaces/DSAParams;

    move-result-object v11

    if-nez v11, :cond_43

    .line 1220
    add-int/lit8 v6, v6, 0x1

    goto :goto_1b

    .line 1234
    :cond_43
    invoke-interface {v9}, Ljava/security/interfaces/DSAPublicKey;->getParams()Ljava/security/interfaces/DSAParams;

    move-result-object v2

    .line 1235
    .local v2, "dsaParams":Ljava/security/interfaces/DSAParams;
    new-instance v4, Ljava/security/spec/DSAPublicKeySpec;

    .line 1236
    invoke-interface {v3}, Ljava/security/interfaces/DSAPublicKey;->getY()Ljava/math/BigInteger;

    move-result-object v11

    invoke-interface {v2}, Ljava/security/interfaces/DSAParams;->getP()Ljava/math/BigInteger;

    move-result-object v12

    invoke-interface {v2}, Ljava/security/interfaces/DSAParams;->getQ()Ljava/math/BigInteger;

    move-result-object v13

    invoke-interface {v2}, Ljava/security/interfaces/DSAParams;->getG()Ljava/math/BigInteger;

    move-result-object v14

    invoke-direct {v4, v11, v12, v13, v14}, Ljava/security/spec/DSAPublicKeySpec;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    .line 1239
    .local v4, "dsaPubKeySpec":Ljava/security/spec/DSAPublicKeySpec;
    :try_start_5c
    const-string v11, "DSA"

    move-object/from16 v0, p2

    invoke-interface {v0, v11}, Lorg/spongycastle/jcajce/util/JcaJceHelper;->createKeyFactory(Ljava/lang/String;)Ljava/security/KeyFactory;

    move-result-object v7

    .line 1240
    .local v7, "keyFactory":Ljava/security/KeyFactory;
    invoke-virtual {v7, v4}, Ljava/security/KeyFactory;->generatePublic(Ljava/security/spec/KeySpec;)Ljava/security/PublicKey;
    :try_end_67
    .catch Ljava/lang/Exception; {:try_start_5c .. :try_end_67} :catch_69

    move-result-object v3

    goto :goto_f

    .line 1242
    .end local v7    # "keyFactory":Ljava/security/KeyFactory;
    :catch_69
    move-exception v5

    .line 1244
    .local v5, "exception":Ljava/lang/Exception;
    new-instance v11, Ljava/lang/RuntimeException;

    invoke-virtual {v5}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 1247
    .end local v2    # "dsaParams":Ljava/security/interfaces/DSAParams;
    .end local v4    # "dsaPubKeySpec":Ljava/security/spec/DSAPublicKeySpec;
    .end local v5    # "exception":Ljava/lang/Exception;
    .end local v8    # "parentCert":Ljava/security/cert/X509Certificate;
    .end local v9    # "prevDSAPubKey":Ljava/security/interfaces/DSAPublicKey;
    :cond_74
    new-instance v11, Ljava/security/cert/CertPathValidatorException;

    const-string v12, "DSA parameters cannot be inherited from previous certificate."

    invoke-direct {v11, v12}, Ljava/security/cert/CertPathValidatorException;-><init>(Ljava/lang/String;)V

    throw v11
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
    .line 320
    :try_start_0
    new-instance v0, Lorg/spongycastle/asn1/ASN1InputStream;

    invoke-direct {v0, p1}, Lorg/spongycastle/asn1/ASN1InputStream;-><init>([B)V

    .line 321
    .local v0, "aIn":Lorg/spongycastle/asn1/ASN1InputStream;
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1InputStream;->readObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v2

    check-cast v2, Lorg/spongycastle/asn1/ASN1OctetString;

    .line 323
    .local v2, "octs":Lorg/spongycastle/asn1/ASN1OctetString;
    new-instance v0, Lorg/spongycastle/asn1/ASN1InputStream;

    .end local v0    # "aIn":Lorg/spongycastle/asn1/ASN1InputStream;
    invoke-virtual {v2}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v3

    invoke-direct {v0, v3}, Lorg/spongycastle/asn1/ASN1InputStream;-><init>([B)V

    .line 324
    .restart local v0    # "aIn":Lorg/spongycastle/asn1/ASN1InputStream;
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1InputStream;->readObject()Lorg/spongycastle/asn1/ASN1Primitive;
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_17} :catch_19

    move-result-object v3

    return-object v3

    .line 326
    .end local v0    # "aIn":Lorg/spongycastle/asn1/ASN1InputStream;
    .end local v2    # "octs":Lorg/spongycastle/asn1/ASN1OctetString;
    :catch_19
    move-exception v1

    .line 328
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
    .line 360
    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    .line 362
    .local v4, "pq":Ljava/util/Set;
    if-nez p0, :cond_8

    .line 388
    :cond_7
    return-object v4

    .line 367
    :cond_8
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 368
    .local v1, "bOut":Ljava/io/ByteArrayOutputStream;
    new-instance v0, Lorg/spongycastle/asn1/ASN1OutputStream;

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1OutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 370
    .local v0, "aOut":Lorg/spongycastle/asn1/ASN1OutputStream;
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjects()Ljava/util/Enumeration;

    move-result-object v2

    .line 372
    .local v2, "e":Ljava/util/Enumeration;
    :goto_16
    invoke-interface {v2}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    if-eqz v5, :cond_7

    .line 376
    :try_start_1c
    invoke-interface {v2}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/spongycastle/asn1/ASN1Encodable;

    invoke-virtual {v0, v5}, Lorg/spongycastle/asn1/ASN1OutputStream;->writeObject(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 378
    new-instance v5, Ljava/security/cert/PolicyQualifierInfo;

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/security/cert/PolicyQualifierInfo;-><init>([B)V

    invoke-interface {v4, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_31
    .catch Ljava/io/IOException; {:try_start_1c .. :try_end_31} :catch_35

    .line 385
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->reset()V

    goto :goto_16

    .line 380
    :catch_35
    move-exception v3

    .line 382
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
    .line 863
    check-cast p0, Ljava/security/cert/X509Certificate;

    .end local p0    # "cert":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/security/cert/X509Certificate;->getSerialNumber()Ljava/math/BigInteger;

    move-result-object v0

    return-object v0
.end method

.method protected static getValidCertDateFromValidityModel(Lorg/spongycastle/jcajce/PKIXExtendedParameters;Ljava/security/cert/CertPath;I)Ljava/util/Date;
    .registers 8
    .param p0, "paramsPKIX"    # Lorg/spongycastle/jcajce/PKIXExtendedParameters;
    .param p1, "certPath"    # Ljava/security/cert/CertPath;
    .param p2, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/jce/provider/AnnotatedException;
        }
    .end annotation

    .prologue
    .line 1125
    invoke-virtual {p0}, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->getValidityModel()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_77

    .line 1128
    if-gtz p2, :cond_e

    .line 1130
    invoke-static {p0}, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->getValidDate(Lorg/spongycastle/jcajce/PKIXExtendedParameters;)Ljava/util/Date;

    move-result-object v3

    .line 1181
    :goto_d
    return-object v3

    .line 1135
    :cond_e
    add-int/lit8 v3, p2, -0x1

    if-nez v3, :cond_66

    .line 1137
    const/4 v0, 0x0

    .line 1140
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

    .line 1141
    .local v2, "extBytes":[B
    if-eqz v2, :cond_33

    .line 1143
    invoke-static {v2}, Lorg/spongycastle/asn1/ASN1Primitive;->fromByteArray([B)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v3

    invoke-static {v3}, Lorg/spongycastle/asn1/ASN1GeneralizedTime;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1GeneralizedTime;
    :try_end_32
    .catch Ljava/io/IOException; {:try_start_13 .. :try_end_32} :catch_3a
    .catch Ljava/lang/IllegalArgumentException; {:try_start_13 .. :try_end_32} :catch_43

    move-result-object v0

    .line 1156
    :cond_33
    if-eqz v0, :cond_55

    .line 1160
    :try_start_35
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1GeneralizedTime;->getDate()Ljava/util/Date;
    :try_end_38
    .catch Ljava/text/ParseException; {:try_start_35 .. :try_end_38} :catch_4c

    move-result-object v3

    goto :goto_d

    .line 1146
    .end local v2    # "extBytes":[B
    :catch_3a
    move-exception v1

    .line 1148
    .local v1, "e":Ljava/io/IOException;
    new-instance v3, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v4, "Date of cert gen extension could not be read."

    invoke-direct {v3, v4}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1151
    .end local v1    # "e":Ljava/io/IOException;
    :catch_43
    move-exception v1

    .line 1153
    .local v1, "e":Ljava/lang/IllegalArgumentException;
    new-instance v3, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v4, "Date of cert gen extension could not be read."

    invoke-direct {v3, v4}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1162
    .end local v1    # "e":Ljava/lang/IllegalArgumentException;
    .restart local v2    # "extBytes":[B
    :catch_4c
    move-exception v1

    .line 1164
    .local v1, "e":Ljava/text/ParseException;
    new-instance v3, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v4, "Date from date of cert gen extension could not be parsed."

    invoke-direct {v3, v4, v1}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 1169
    .end local v1    # "e":Ljava/text/ParseException;
    :cond_55
    invoke-virtual {p1}, Ljava/security/cert/CertPath;->getCertificates()Ljava/util/List;

    move-result-object v3

    add-int/lit8 v4, p2, -0x1

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/security/cert/X509Certificate;

    .line 1170
    invoke-virtual {v3}, Ljava/security/cert/X509Certificate;->getNotBefore()Ljava/util/Date;

    move-result-object v3

    goto :goto_d

    .line 1174
    .end local v0    # "dateOfCertgen":Lorg/spongycastle/asn1/ASN1GeneralizedTime;
    .end local v2    # "extBytes":[B
    :cond_66
    invoke-virtual {p1}, Ljava/security/cert/CertPath;->getCertificates()Ljava/util/List;

    move-result-object v3

    add-int/lit8 v4, p2, -0x1

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/security/cert/X509Certificate;

    .line 1175
    invoke-virtual {v3}, Ljava/security/cert/X509Certificate;->getNotBefore()Ljava/util/Date;

    move-result-object v3

    goto :goto_d

    .line 1181
    :cond_77
    invoke-static {p0}, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->getValidDate(Lorg/spongycastle/jcajce/PKIXExtendedParameters;)Ljava/util/Date;

    move-result-object v3

    goto :goto_d
.end method

.method protected static getValidDate(Lorg/spongycastle/jcajce/PKIXExtendedParameters;)Ljava/util/Date;
    .registers 2
    .param p0, "paramsPKIX"    # Lorg/spongycastle/jcajce/PKIXExtendedParameters;

    .prologue
    .line 276
    invoke-virtual {p0}, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->getDate()Ljava/util/Date;

    move-result-object v0

    .line 278
    .local v0, "validDate":Ljava/util/Date;
    if-nez v0, :cond_b

    .line 280
    new-instance v0, Ljava/util/Date;

    .end local v0    # "validDate":Ljava/util/Date;
    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    .line 283
    .restart local v0    # "validDate":Ljava/util/Date;
    :cond_b
    return-object v0
.end method

.method protected static isAnyPolicy(Ljava/util/Set;)Z
    .registers 2
    .param p0, "policySet"    # Ljava/util/Set;

    .prologue
    .line 633
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
    .line 1057
    invoke-virtual {p0}, Ljava/security/cert/X509CRL;->getCriticalExtensionOIDs()Ljava/util/Set;

    move-result-object v0

    .line 1059
    .local v0, "critical":Ljava/util/Set;
    if-nez v0, :cond_8

    .line 1061
    const/4 v1, 0x0

    .line 1064
    :goto_7
    return v1

    :cond_8
    sget-object v1, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->DELTA_CRL_INDICATOR:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_7
.end method

.method protected static isSelfIssued(Ljava/security/cert/X509Certificate;)Z
    .registers 3
    .param p0, "cert"    # Ljava/security/cert/X509Certificate;

    .prologue
    .line 288
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
    .line 514
    const/4 v12, 0x0

    .line 515
    .local v12, "idp_found":Z
    aget-object v3, p1, p0

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v14

    .line 516
    .local v14, "nodes_i":Ljava/util/Iterator;
    :cond_7
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2c

    .line 518
    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lorg/spongycastle/jce/provider/PKIXPolicyNode;

    .line 519
    .local v13, "node":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    invoke-virtual {v13}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;->getValidPolicy()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p2

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 521
    const/4 v12, 0x1

    .line 522
    move-object/from16 v0, p3

    move-object/from16 v1, p2

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Set;

    iput-object v3, v13, Lorg/spongycastle/jce/provider/PKIXPolicyNode;->expectedPolicies:Ljava/util/Set;

    .line 527
    .end local v13    # "node":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    :cond_2c
    if-nez v12, :cond_c9

    .line 529
    aget-object v3, p1, p0

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v14

    .line 530
    :cond_34
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_c9

    .line 532
    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lorg/spongycastle/jce/provider/PKIXPolicyNode;

    .line 533
    .restart local v13    # "node":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    const-string v3, "2.5.29.32.0"

    invoke-virtual {v13}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;->getValidPolicy()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_34

    .line 535
    const/4 v7, 0x0

    .line 536
    .local v7, "pq":Ljava/util/Set;
    const/16 v16, 0x0

    .line 539
    .local v16, "policies":Lorg/spongycastle/asn1/ASN1Sequence;
    :try_start_4f
    sget-object v3, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->CERTIFICATE_POLICIES:Ljava/lang/String;

    move-object/from16 v0, p4

    invoke-static {v0, v3}, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->getExtensionValue(Ljava/security/cert/X509Extension;Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v3

    invoke-static {v3}, Lorg/spongycastle/asn1/DERSequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;
    :try_end_5a
    .catch Ljava/lang/Exception; {:try_start_4f .. :try_end_5a} :catch_ca

    move-result-object v16

    .line 545
    invoke-virtual/range {v16 .. v16}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjects()Ljava/util/Enumeration;

    move-result-object v10

    .line 546
    .local v10, "e":Ljava/util/Enumeration;
    :cond_5f
    invoke-interface {v10}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_86

    .line 548
    const/4 v15, 0x0

    .line 552
    .local v15, "pinfo":Lorg/spongycastle/asn1/x509/PolicyInformation;
    :try_start_66
    invoke-interface {v10}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Lorg/spongycastle/asn1/x509/PolicyInformation;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/PolicyInformation;
    :try_end_6d
    .catch Ljava/lang/Exception; {:try_start_66 .. :try_end_6d} :catch_d3

    move-result-object v15

    .line 558
    const-string v3, "2.5.29.32.0"

    invoke-virtual {v15}, Lorg/spongycastle/asn1/x509/PolicyInformation;->getPolicyIdentifier()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v4

    invoke-virtual {v4}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5f

    .line 562
    :try_start_7e
    invoke-virtual {v15}, Lorg/spongycastle/asn1/x509/PolicyInformation;->getPolicyQualifiers()Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v3

    invoke-static {v3}, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->getQualifierSet(Lorg/spongycastle/asn1/ASN1Sequence;)Ljava/util/Set;
    :try_end_85
    .catch Ljava/security/cert/CertPathValidatorException; {:try_start_7e .. :try_end_85} :catch_dc

    move-result-object v7

    .line 572
    .end local v15    # "pinfo":Lorg/spongycastle/asn1/x509/PolicyInformation;
    :cond_86
    const/4 v9, 0x0

    .line 573
    .local v9, "ci":Z
    invoke-virtual/range {p4 .. p4}, Ljava/security/cert/X509Certificate;->getCriticalExtensionOIDs()Ljava/util/Set;

    move-result-object v3

    if-eqz v3, :cond_97

    .line 575
    invoke-virtual/range {p4 .. p4}, Ljava/security/cert/X509Certificate;->getCriticalExtensionOIDs()Ljava/util/Set;

    move-result-object v3

    sget-object v4, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->CERTIFICATE_POLICIES:Ljava/lang/String;

    invoke-interface {v3, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v9

    .line 578
    :cond_97
    invoke-virtual {v13}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;->getParent()Ljava/security/cert/PolicyNode;

    move-result-object v6

    check-cast v6, Lorg/spongycastle/jce/provider/PKIXPolicyNode;

    .line 579
    .local v6, "p_node":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    const-string v3, "2.5.29.32.0"

    invoke-virtual {v6}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;->getValidPolicy()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_c9

    .line 581
    new-instance v2, Lorg/spongycastle/jce/provider/PKIXPolicyNode;

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 583
    move-object/from16 v0, p3

    move-object/from16 v1, p2

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Set;

    move/from16 v4, p0

    move-object/from16 v8, p2

    invoke-direct/range {v2 .. v9}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;-><init>(Ljava/util/List;ILjava/util/Set;Ljava/security/cert/PolicyNode;Ljava/util/Set;Ljava/lang/String;Z)V

    .line 585
    .local v2, "c_node":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    invoke-virtual {v6, v2}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;->addChild(Lorg/spongycastle/jce/provider/PKIXPolicyNode;)V

    .line 586
    aget-object v3, p1, p0

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 592
    .end local v2    # "c_node":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    .end local v6    # "p_node":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    .end local v7    # "pq":Ljava/util/Set;
    .end local v9    # "ci":Z
    .end local v10    # "e":Ljava/util/Enumeration;
    .end local v13    # "node":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    .end local v16    # "policies":Lorg/spongycastle/asn1/ASN1Sequence;
    :cond_c9
    return-void

    .line 541
    .restart local v7    # "pq":Ljava/util/Set;
    .restart local v13    # "node":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    .restart local v16    # "policies":Lorg/spongycastle/asn1/ASN1Sequence;
    :catch_ca
    move-exception v10

    .line 543
    .local v10, "e":Ljava/lang/Exception;
    new-instance v3, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v4, "Certificate policies cannot be decoded."

    invoke-direct {v3, v4, v10}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 554
    .local v10, "e":Ljava/util/Enumeration;
    .restart local v15    # "pinfo":Lorg/spongycastle/asn1/x509/PolicyInformation;
    :catch_d3
    move-exception v11

    .line 556
    .local v11, "ex":Ljava/lang/Exception;
    new-instance v3, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v4, "Policy information cannot be decoded."

    invoke-direct {v3, v4, v11}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 564
    .end local v11    # "ex":Ljava/lang/Exception;
    :catch_dc
    move-exception v11

    .line 566
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
    .line 600
    aget-object v7, p1, p0

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .line 601
    .local v5, "nodes_i":Ljava/util/Iterator;
    :cond_6
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_4d

    .line 603
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/spongycastle/jce/provider/PKIXPolicyNode;

    .line 604
    .local v2, "node":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    invoke-virtual {v2}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;->getValidPolicy()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_6

    .line 606
    invoke-virtual {v2}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;->getParent()Ljava/security/cert/PolicyNode;

    move-result-object v6

    check-cast v6, Lorg/spongycastle/jce/provider/PKIXPolicyNode;

    .line 607
    .local v6, "p_node":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    invoke-virtual {v6, v2}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;->removeChild(Lorg/spongycastle/jce/provider/PKIXPolicyNode;)V

    .line 608
    invoke-interface {v5}, Ljava/util/Iterator;->remove()V

    .line 609
    add-int/lit8 v0, p0, -0x1

    .local v0, "k":I
    :goto_2a
    if-ltz v0, :cond_6

    .line 611
    aget-object v4, p1, v0

    .line 612
    .local v4, "nodes":Ljava/util/List;
    const/4 v1, 0x0

    .local v1, "l":I
    :goto_2f
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v7

    if-ge v1, v7, :cond_47

    .line 614
    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/spongycastle/jce/provider/PKIXPolicyNode;

    .line 615
    .local v3, "node2":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    invoke-virtual {v3}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;->hasChildren()Z

    move-result v7

    if-nez v7, :cond_4a

    .line 617
    invoke-static {p3, p1, v3}, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->removePolicyNode(Lorg/spongycastle/jce/provider/PKIXPolicyNode;[Ljava/util/List;Lorg/spongycastle/jce/provider/PKIXPolicyNode;)Lorg/spongycastle/jce/provider/PKIXPolicyNode;

    move-result-object p3

    .line 618
    if-nez p3, :cond_4a

    .line 609
    .end local v3    # "node2":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    :cond_47
    add-int/lit8 v0, v0, -0x1

    goto :goto_2a

    .line 612
    .restart local v3    # "node2":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    :cond_4a
    add-int/lit8 v1, v1, 0x1

    goto :goto_2f

    .line 627
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

    .line 445
    add-int/lit8 v1, p0, -0x1

    aget-object v10, p1, v1

    .line 447
    .local v10, "policyNodeVec":Ljava/util/List;
    const/4 v9, 0x0

    .local v9, "j":I
    :goto_6
    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v1

    if-ge v9, v1, :cond_45

    .line 449
    invoke-interface {v10, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/spongycastle/jce/provider/PKIXPolicyNode;

    .line 450
    .local v4, "node":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    invoke-virtual {v4}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;->getExpectedPolicies()Ljava/util/Set;

    move-result-object v8

    .line 452
    .local v8, "expectedPolicies":Ljava/util/Set;
    invoke-virtual {p2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v8, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_46

    .line 454
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 455
    .local v3, "childExpectedPolicies":Ljava/util/Set;
    invoke-virtual {p2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v3, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 457
    new-instance v0, Lorg/spongycastle/jce/provider/PKIXPolicyNode;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 462
    invoke-virtual {p2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v6

    move v2, p0

    move-object v5, p3

    invoke-direct/range {v0 .. v7}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;-><init>(Ljava/util/List;ILjava/util/Set;Ljava/security/cert/PolicyNode;Ljava/util/Set;Ljava/lang/String;Z)V

    .line 464
    .local v0, "child":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    invoke-virtual {v4, v0}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;->addChild(Lorg/spongycastle/jce/provider/PKIXPolicyNode;)V

    .line 465
    aget-object v1, p1, p0

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 467
    const/4 v7, 0x1

    .line 471
    .end local v0    # "child":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    .end local v3    # "childExpectedPolicies":Ljava/util/Set;
    .end local v4    # "node":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    .end local v8    # "expectedPolicies":Ljava/util/Set;
    :cond_45
    return v7

    .line 447
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
    .line 480
    add-int/lit8 v1, p0, -0x1

    aget-object v9, p1, v1

    .line 482
    .local v9, "policyNodeVec":Ljava/util/List;
    const/4 v8, 0x0

    .local v8, "j":I
    :goto_5
    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v1

    if-ge v8, v1, :cond_42

    .line 484
    invoke-interface {v9, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/spongycastle/jce/provider/PKIXPolicyNode;

    .line 486
    .local v4, "_node":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    const-string v1, "2.5.29.32.0"

    invoke-virtual {v4}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;->getValidPolicy()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_43

    .line 488
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 489
    .local v3, "_childExpectedPolicies":Ljava/util/Set;
    invoke-virtual {p2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v3, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 491
    new-instance v0, Lorg/spongycastle/jce/provider/PKIXPolicyNode;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 496
    invoke-virtual {p2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    move v2, p0

    move-object v5, p3

    invoke-direct/range {v0 .. v7}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;-><init>(Ljava/util/List;ILjava/util/Set;Ljava/security/cert/PolicyNode;Ljava/util/Set;Ljava/lang/String;Z)V

    .line 498
    .local v0, "_child":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    invoke-virtual {v4, v0}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;->addChild(Lorg/spongycastle/jce/provider/PKIXPolicyNode;)V

    .line 499
    aget-object v1, p1, p0

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 503
    .end local v0    # "_child":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    .end local v3    # "_childExpectedPolicies":Ljava/util/Set;
    .end local v4    # "_node":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    :cond_42
    return-void

    .line 482
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

    .line 396
    invoke-virtual {p2}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;->getParent()Ljava/security/cert/PolicyNode;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/jce/provider/PKIXPolicyNode;

    .line 398
    .local v0, "_parent":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    if-nez p0, :cond_b

    move-object p0, v2

    .line 417
    .end local p0    # "validPolicyTree":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    :goto_a
    return-object p0

    .line 403
    .restart local p0    # "validPolicyTree":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    :cond_b
    if-nez v0, :cond_1d

    .line 405
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_e
    array-length v3, p1

    if-ge v1, v3, :cond_1b

    .line 407
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    aput-object v3, p1, v1

    .line 405
    add-int/lit8 v1, v1, 0x1

    goto :goto_e

    :cond_1b
    move-object p0, v2

    .line 410
    goto :goto_a

    .line 414
    .end local v1    # "j":I
    :cond_1d
    invoke-virtual {v0, p2}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;->removeChild(Lorg/spongycastle/jce/provider/PKIXPolicyNode;)V

    .line 415
    invoke-static {p1, p2}, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->removePolicyNodeRecurse([Ljava/util/List;Lorg/spongycastle/jce/provider/PKIXPolicyNode;)V

    goto :goto_a
.end method

.method private static removePolicyNodeRecurse([Ljava/util/List;Lorg/spongycastle/jce/provider/PKIXPolicyNode;)V
    .registers 5
    .param p0, "policyNodes"    # [Ljava/util/List;
    .param p1, "_node"    # Lorg/spongycastle/jce/provider/PKIXPolicyNode;

    .prologue
    .line 425
    invoke-virtual {p1}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;->getDepth()I

    move-result v2

    aget-object v2, p0, v2

    invoke-interface {v2, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 427
    invoke-virtual {p1}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;->hasChildren()Z

    move-result v2

    if-eqz v2, :cond_23

    .line 429
    invoke-virtual {p1}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;->getChildren()Ljava/util/Iterator;

    move-result-object v1

    .line 430
    .local v1, "_iter":Ljava/util/Iterator;
    :goto_13
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_23

    .line 432
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/jce/provider/PKIXPolicyNode;

    .line 433
    .local v0, "_child":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    invoke-static {p0, v0}, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->removePolicyNodeRecurse([Ljava/util/List;Lorg/spongycastle/jce/provider/PKIXPolicyNode;)V

    goto :goto_13

    .line 436
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
    .line 1328
    if-nez p2, :cond_6

    .line 1330
    invoke-virtual {p0, p1}, Ljava/security/cert/X509Certificate;->verify(Ljava/security/PublicKey;)V

    .line 1336
    :goto_5
    return-void

    .line 1334
    :cond_6
    invoke-virtual {p0, p1, p2}, Ljava/security/cert/X509Certificate;->verify(Ljava/security/PublicKey;Ljava/lang/String;)V

    goto :goto_5
.end method
