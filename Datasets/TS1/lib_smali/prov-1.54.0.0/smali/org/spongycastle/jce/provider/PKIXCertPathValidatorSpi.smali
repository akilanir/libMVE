.class public Lorg/spongycastle/jce/provider/PKIXCertPathValidatorSpi;
.super Ljava/security/cert/CertPathValidatorSpi;
.source "PKIXCertPathValidatorSpi.java"


# instance fields
.field private final helper:Lorg/spongycastle/jcajce/util/JcaJceHelper;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/security/cert/CertPathValidatorSpi;-><init>()V

    .line 40
    new-instance v0, Lorg/spongycastle/jcajce/util/BCJcaJceHelper;

    invoke-direct {v0}, Lorg/spongycastle/jcajce/util/BCJcaJceHelper;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/jce/provider/PKIXCertPathValidatorSpi;->helper:Lorg/spongycastle/jcajce/util/JcaJceHelper;

    .line 44
    return-void
.end method


# virtual methods
.method public engineValidate(Ljava/security/cert/CertPath;Ljava/security/cert/CertPathParameters;)Ljava/security/cert/CertPathValidatorResult;
    .registers 52
    .param p1, "certPath"    # Ljava/security/cert/CertPath;
    .param p2, "params"    # Ljava/security/cert/CertPathParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertPathValidatorException;,
            Ljava/security/InvalidAlgorithmParameterException;
        }
    .end annotation

    .prologue
    .line 53
    move-object/from16 v0, p2

    instance-of v4, v0, Ljava/security/cert/PKIXParameters;

    if-eqz v4, :cond_3f

    .line 55
    new-instance v42, Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;

    move-object/from16 v4, p2

    check-cast v4, Ljava/security/cert/PKIXParameters;

    move-object/from16 v0, v42

    invoke-direct {v0, v4}, Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;-><init>(Ljava/security/cert/PKIXParameters;)V

    .line 57
    .local v42, "paramsPKIXBldr":Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;
    move-object/from16 v0, p2

    instance-of v4, v0, Lorg/spongycastle/x509/ExtendedPKIXParameters;

    if-eqz v4, :cond_2d

    move-object/from16 v35, p2

    .line 59
    check-cast v35, Lorg/spongycastle/x509/ExtendedPKIXParameters;

    .line 61
    .local v35, "extPKIX":Lorg/spongycastle/x509/ExtendedPKIXParameters;
    invoke-virtual/range {v35 .. v35}, Lorg/spongycastle/x509/ExtendedPKIXParameters;->isUseDeltasEnabled()Z

    move-result v4

    move-object/from16 v0, v42

    invoke-virtual {v0, v4}, Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;->setUseDeltasEnabled(Z)Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;

    .line 62
    invoke-virtual/range {v35 .. v35}, Lorg/spongycastle/x509/ExtendedPKIXParameters;->getValidityModel()I

    move-result v4

    move-object/from16 v0, v42

    invoke-virtual {v0, v4}, Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;->setValidityModel(I)Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;

    .line 65
    .end local v35    # "extPKIX":Lorg/spongycastle/x509/ExtendedPKIXParameters;
    :cond_2d
    invoke-virtual/range {v42 .. v42}, Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;->build()Lorg/spongycastle/jcajce/PKIXExtendedParameters;

    move-result-object v21

    .line 80
    .end local v42    # "paramsPKIXBldr":Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;
    .end local p2    # "params":Ljava/security/cert/CertPathParameters;
    .local v21, "paramsPKIX":Lorg/spongycastle/jcajce/PKIXExtendedParameters;
    :goto_31
    invoke-virtual/range {v21 .. v21}, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->getTrustAnchors()Ljava/util/Set;

    move-result-object v4

    if-nez v4, :cond_7c

    .line 82
    new-instance v4, Ljava/security/InvalidAlgorithmParameterException;

    const-string v5, "trustAnchors is null, this is not allowed for certification path validation."

    invoke-direct {v4, v5}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 67
    .end local v21    # "paramsPKIX":Lorg/spongycastle/jcajce/PKIXExtendedParameters;
    .restart local p2    # "params":Ljava/security/cert/CertPathParameters;
    :cond_3f
    move-object/from16 v0, p2

    instance-of v4, v0, Lorg/spongycastle/jcajce/PKIXExtendedBuilderParameters;

    if-eqz v4, :cond_4c

    .line 69
    check-cast p2, Lorg/spongycastle/jcajce/PKIXExtendedBuilderParameters;

    .end local p2    # "params":Ljava/security/cert/CertPathParameters;
    invoke-virtual/range {p2 .. p2}, Lorg/spongycastle/jcajce/PKIXExtendedBuilderParameters;->getBaseParameters()Lorg/spongycastle/jcajce/PKIXExtendedParameters;

    move-result-object v21

    .restart local v21    # "paramsPKIX":Lorg/spongycastle/jcajce/PKIXExtendedParameters;
    goto :goto_31

    .line 71
    .end local v21    # "paramsPKIX":Lorg/spongycastle/jcajce/PKIXExtendedParameters;
    .restart local p2    # "params":Ljava/security/cert/CertPathParameters;
    :cond_4c
    move-object/from16 v0, p2

    instance-of v4, v0, Lorg/spongycastle/jcajce/PKIXExtendedParameters;

    if-eqz v4, :cond_57

    move-object/from16 v21, p2

    .line 73
    check-cast v21, Lorg/spongycastle/jcajce/PKIXExtendedParameters;

    .restart local v21    # "paramsPKIX":Lorg/spongycastle/jcajce/PKIXExtendedParameters;
    goto :goto_31

    .line 77
    .end local v21    # "paramsPKIX":Lorg/spongycastle/jcajce/PKIXExtendedParameters;
    :cond_57
    new-instance v4, Ljava/security/InvalidAlgorithmParameterException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Parameters must be a "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-class v7, Ljava/security/cert/PKIXParameters;

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, " instance."

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 93
    .end local p2    # "params":Ljava/security/cert/CertPathParameters;
    .restart local v21    # "paramsPKIX":Lorg/spongycastle/jcajce/PKIXExtendedParameters;
    :cond_7c
    invoke-virtual/range {p1 .. p1}, Ljava/security/cert/CertPath;->getCertificates()Ljava/util/List;

    move-result-object v29

    .line 94
    .local v29, "certs":Ljava/util/List;
    invoke-interface/range {v29 .. v29}, Ljava/util/List;->size()I

    move-result v40

    .line 96
    .local v40, "n":I
    invoke-interface/range {v29 .. v29}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_96

    .line 98
    new-instance v4, Ljava/security/cert/CertPathValidatorException;

    const-string v5, "Certification path is empty."

    const/4 v7, 0x0

    const/4 v8, -0x1

    move-object/from16 v0, p1

    invoke-direct {v4, v5, v7, v0, v8}, Ljava/security/cert/CertPathValidatorException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Ljava/security/cert/CertPath;I)V

    throw v4

    .line 109
    :cond_96
    invoke-virtual/range {v21 .. v21}, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->getInitialPolicies()Ljava/util/Set;

    move-result-object v22

    .line 117
    .local v22, "userInitialPolicySet":Ljava/util/Set;
    :try_start_9a
    invoke-interface/range {v29 .. v29}, Ljava/util/List;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    move-object/from16 v0, v29

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/security/cert/X509Certificate;

    .line 118
    invoke-virtual/range {v21 .. v21}, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->getTrustAnchors()Ljava/util/Set;

    move-result-object v5

    invoke-virtual/range {v21 .. v21}, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->getSigProvider()Ljava/lang/String;

    move-result-object v7

    .line 117
    invoke-static {v4, v5, v7}, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->findTrustAnchor(Ljava/security/cert/X509Certificate;Ljava/util/Set;Ljava/lang/String;)Ljava/security/cert/TrustAnchor;
    :try_end_b3
    .catch Lorg/spongycastle/jce/provider/AnnotatedException; {:try_start_9a .. :try_end_b3} :catch_c2

    move-result-object v45

    .line 125
    .local v45, "trust":Ljava/security/cert/TrustAnchor;
    if-nez v45, :cond_d7

    .line 127
    new-instance v4, Ljava/security/cert/CertPathValidatorException;

    const-string v5, "Trust anchor for certification path not found."

    const/4 v7, 0x0

    const/4 v8, -0x1

    move-object/from16 v0, p1

    invoke-direct {v4, v5, v7, v0, v8}, Ljava/security/cert/CertPathValidatorException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Ljava/security/cert/CertPath;I)V

    throw v4

    .line 120
    .end local v45    # "trust":Ljava/security/cert/TrustAnchor;
    :catch_c2
    move-exception v32

    .line 122
    .local v32, "e":Lorg/spongycastle/jce/provider/AnnotatedException;
    new-instance v4, Ljava/security/cert/CertPathValidatorException;

    invoke-virtual/range {v32 .. v32}, Lorg/spongycastle/jce/provider/AnnotatedException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-interface/range {v29 .. v29}, Ljava/util/List;->size()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    move-object/from16 v0, v32

    move-object/from16 v1, p1

    invoke-direct {v4, v5, v0, v1, v7}, Ljava/security/cert/CertPathValidatorException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Ljava/security/cert/CertPath;I)V

    throw v4

    .line 131
    .end local v32    # "e":Lorg/spongycastle/jce/provider/AnnotatedException;
    .restart local v45    # "trust":Ljava/security/cert/TrustAnchor;
    :cond_d7
    new-instance v4, Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;

    move-object/from16 v0, v21

    invoke-direct {v4, v0}, Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;-><init>(Lorg/spongycastle/jcajce/PKIXExtendedParameters;)V

    move-object/from16 v0, v45

    invoke-virtual {v4, v0}, Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;->setTrustAnchor(Ljava/security/cert/TrustAnchor;)Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;

    move-result-object v4

    invoke-virtual {v4}, Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;->build()Lorg/spongycastle/jcajce/PKIXExtendedParameters;

    move-result-object v21

    .line 137
    const/4 v9, 0x0

    .line 148
    .local v9, "index":I
    add-int/lit8 v4, v40, 0x1

    new-array v0, v4, [Ljava/util/ArrayList;

    move-object/from16 v18, v0

    .line 149
    .local v18, "policyNodes":[Ljava/util/List;
    const/16 v38, 0x0

    .local v38, "j":I
    :goto_f1
    move-object/from16 v0, v18

    array-length v4, v0

    move/from16 v0, v38

    if-ge v0, v4, :cond_102

    .line 151
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    aput-object v4, v18, v38

    .line 149
    add-int/lit8 v38, v38, 0x1

    goto :goto_f1

    .line 154
    :cond_102
    new-instance v6, Ljava/util/HashSet;

    invoke-direct {v6}, Ljava/util/HashSet;-><init>()V

    .line 156
    .local v6, "policySet":Ljava/util/Set;
    const-string v4, "2.5.29.32.0"

    invoke-interface {v6, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 158
    new-instance v3, Lorg/spongycastle/jce/provider/PKIXPolicyNode;

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    const/4 v5, 0x0

    const/4 v7, 0x0

    new-instance v8, Ljava/util/HashSet;

    invoke-direct {v8}, Ljava/util/HashSet;-><init>()V

    const-string v9, "2.5.29.32.0"

    .end local v9    # "index":I
    const/4 v10, 0x0

    invoke-direct/range {v3 .. v10}, Lorg/spongycastle/jce/provider/PKIXPolicyNode;-><init>(Ljava/util/List;ILjava/util/Set;Ljava/security/cert/PolicyNode;Ljava/util/Set;Ljava/lang/String;Z)V

    .line 161
    .local v3, "validPolicyTree":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    const/4 v4, 0x0

    aget-object v4, v18, v4

    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 166
    new-instance v41, Lorg/spongycastle/jce/provider/PKIXNameConstraintValidator;

    invoke-direct/range {v41 .. v41}, Lorg/spongycastle/jce/provider/PKIXNameConstraintValidator;-><init>()V

    .line 171
    .local v41, "nameConstraintValidator":Lorg/spongycastle/jce/provider/PKIXNameConstraintValidator;
    new-instance v16, Ljava/util/HashSet;

    invoke-direct/range {v16 .. v16}, Ljava/util/HashSet;-><init>()V

    .line 173
    .local v16, "acceptablePolicies":Ljava/util/Set;
    invoke-virtual/range {v21 .. v21}, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->isExplicitPolicyRequired()Z

    move-result v4

    if-eqz v4, :cond_18b

    .line 175
    const/16 v34, 0x0

    .line 187
    .local v34, "explicitPolicy":I
    :goto_138
    invoke-virtual/range {v21 .. v21}, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->isAnyPolicyInhibited()Z

    move-result v4

    if-eqz v4, :cond_18e

    .line 189
    const/16 v19, 0x0

    .line 201
    .local v19, "inhibitAnyPolicy":I
    :goto_140
    invoke-virtual/range {v21 .. v21}, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->isPolicyMappingInhibited()Z

    move-result v4

    if-eqz v4, :cond_191

    .line 203
    const/16 v44, 0x0

    .line 216
    .local v44, "policyMapping":I
    :goto_148
    invoke-virtual/range {v45 .. v45}, Ljava/security/cert/TrustAnchor;->getTrustedCert()Ljava/security/cert/X509Certificate;

    move-result-object v13

    .line 219
    .local v13, "sign":Ljava/security/cert/X509Certificate;
    if-eqz v13, :cond_194

    .line 221
    :try_start_14e
    invoke-static {v13}, Lorg/spongycastle/jce/provider/PrincipalUtils;->getSubjectPrincipal(Ljava/security/cert/X509Certificate;)Lorg/spongycastle/asn1/x500/X500Name;

    move-result-object v12

    .line 222
    .local v12, "workingIssuerName":Lorg/spongycastle/asn1/x500/X500Name;
    invoke-virtual {v13}, Ljava/security/cert/X509Certificate;->getPublicKey()Ljava/security/PublicKey;
    :try_end_155
    .catch Ljava/lang/IllegalArgumentException; {:try_start_14e .. :try_end_155} :catch_19d

    move-result-object v10

    .line 236
    .local v10, "workingPublicKey":Ljava/security/PublicKey;
    :goto_156
    const/16 v46, 0x0

    .line 239
    .local v46, "workingAlgId":Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;
    :try_start_158
    invoke-static {v10}, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->getAlgorithmIdentifier(Ljava/security/PublicKey;)Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;
    :try_end_15b
    .catch Ljava/security/cert/CertPathValidatorException; {:try_start_158 .. :try_end_15b} :catch_1ab

    move-result-object v46

    .line 246
    invoke-virtual/range {v46 .. v46}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->getAlgorithm()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v47

    .line 247
    .local v47, "workingPublicKeyAlgorithm":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    invoke-virtual/range {v46 .. v46}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->getParameters()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v48

    .line 252
    .local v48, "workingPublicKeyParameters":Lorg/spongycastle/asn1/ASN1Encodable;
    move/from16 v39, v40

    .line 258
    .local v39, "maxPathLength":I
    invoke-virtual/range {v21 .. v21}, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->getTargetConstraints()Lorg/spongycastle/jcajce/PKIXCertStoreSelector;

    move-result-object v4

    if-eqz v4, :cond_1b9

    .line 259
    invoke-virtual/range {v21 .. v21}, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->getTargetConstraints()Lorg/spongycastle/jcajce/PKIXCertStoreSelector;

    move-result-object v5

    const/4 v4, 0x0

    move-object/from16 v0, v29

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/security/cert/X509Certificate;

    invoke-virtual {v5, v4}, Lorg/spongycastle/jcajce/PKIXCertStoreSelector;->match(Ljava/security/cert/Certificate;)Z

    move-result v4

    if-nez v4, :cond_1b9

    .line 261
    new-instance v4, Lorg/spongycastle/jce/exception/ExtCertPathValidatorException;

    const-string v5, "Target certificate in certification path does not match targetConstraints."

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object/from16 v0, p1

    invoke-direct {v4, v5, v7, v0, v8}, Lorg/spongycastle/jce/exception/ExtCertPathValidatorException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Ljava/security/cert/CertPath;I)V

    throw v4

    .line 179
    .end local v10    # "workingPublicKey":Ljava/security/PublicKey;
    .end local v12    # "workingIssuerName":Lorg/spongycastle/asn1/x500/X500Name;
    .end local v13    # "sign":Ljava/security/cert/X509Certificate;
    .end local v19    # "inhibitAnyPolicy":I
    .end local v34    # "explicitPolicy":I
    .end local v39    # "maxPathLength":I
    .end local v44    # "policyMapping":I
    .end local v46    # "workingAlgId":Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;
    .end local v47    # "workingPublicKeyAlgorithm":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .end local v48    # "workingPublicKeyParameters":Lorg/spongycastle/asn1/ASN1Encodable;
    :cond_18b
    add-int/lit8 v34, v40, 0x1

    .restart local v34    # "explicitPolicy":I
    goto :goto_138

    .line 193
    :cond_18e
    add-int/lit8 v19, v40, 0x1

    .restart local v19    # "inhibitAnyPolicy":I
    goto :goto_140

    .line 207
    :cond_191
    add-int/lit8 v44, v40, 0x1

    .restart local v44    # "policyMapping":I
    goto :goto_148

    .line 226
    .restart local v13    # "sign":Ljava/security/cert/X509Certificate;
    :cond_194
    :try_start_194
    invoke-static/range {v45 .. v45}, Lorg/spongycastle/jce/provider/PrincipalUtils;->getCA(Ljava/security/cert/TrustAnchor;)Lorg/spongycastle/asn1/x500/X500Name;

    move-result-object v12

    .line 227
    .restart local v12    # "workingIssuerName":Lorg/spongycastle/asn1/x500/X500Name;
    invoke-virtual/range {v45 .. v45}, Ljava/security/cert/TrustAnchor;->getCAPublicKey()Ljava/security/PublicKey;
    :try_end_19b
    .catch Ljava/lang/IllegalArgumentException; {:try_start_194 .. :try_end_19b} :catch_19d

    move-result-object v10

    .restart local v10    # "workingPublicKey":Ljava/security/PublicKey;
    goto :goto_156

    .line 230
    .end local v10    # "workingPublicKey":Ljava/security/PublicKey;
    .end local v12    # "workingIssuerName":Lorg/spongycastle/asn1/x500/X500Name;
    :catch_19d
    move-exception v33

    .line 232
    .local v33, "ex":Ljava/lang/IllegalArgumentException;
    new-instance v4, Lorg/spongycastle/jce/exception/ExtCertPathValidatorException;

    const-string v5, "Subject of trust anchor could not be (re)encoded."

    const/4 v7, -0x1

    move-object/from16 v0, v33

    move-object/from16 v1, p1

    invoke-direct {v4, v5, v0, v1, v7}, Lorg/spongycastle/jce/exception/ExtCertPathValidatorException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Ljava/security/cert/CertPath;I)V

    throw v4

    .line 241
    .end local v33    # "ex":Ljava/lang/IllegalArgumentException;
    .restart local v10    # "workingPublicKey":Ljava/security/PublicKey;
    .restart local v12    # "workingIssuerName":Lorg/spongycastle/asn1/x500/X500Name;
    .restart local v46    # "workingAlgId":Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;
    :catch_1ab
    move-exception v32

    .line 243
    .local v32, "e":Ljava/security/cert/CertPathValidatorException;
    new-instance v4, Lorg/spongycastle/jce/exception/ExtCertPathValidatorException;

    const-string v5, "Algorithm identifier of public key of trust anchor could not be read."

    const/4 v7, -0x1

    move-object/from16 v0, v32

    move-object/from16 v1, p1

    invoke-direct {v4, v5, v0, v1, v7}, Lorg/spongycastle/jce/exception/ExtCertPathValidatorException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Ljava/security/cert/CertPath;I)V

    throw v4

    .line 268
    .end local v32    # "e":Ljava/security/cert/CertPathValidatorException;
    .restart local v39    # "maxPathLength":I
    .restart local v47    # "workingPublicKeyAlgorithm":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .restart local v48    # "workingPublicKeyParameters":Lorg/spongycastle/asn1/ASN1Encodable;
    :cond_1b9
    invoke-virtual/range {v21 .. v21}, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->getCertPathCheckers()Ljava/util/List;

    move-result-object v43

    .line 269
    .local v43, "pathCheckers":Ljava/util/List;
    invoke-interface/range {v43 .. v43}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v28

    .line 270
    .local v28, "certIter":Ljava/util/Iterator;
    :goto_1c1
    invoke-interface/range {v28 .. v28}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1d2

    .line 272
    invoke-interface/range {v28 .. v28}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/security/cert/PKIXCertPathChecker;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Ljava/security/cert/PKIXCertPathChecker;->init(Z)V

    goto :goto_1c1

    .line 275
    :cond_1d2
    const/16 v27, 0x0

    .line 277
    .local v27, "cert":Ljava/security/cert/X509Certificate;
    invoke-interface/range {v29 .. v29}, Ljava/util/List;->size()I

    move-result v4

    add-int/lit8 v9, v4, -0x1

    .restart local v9    # "index":I
    :goto_1da
    if-ltz v9, :cond_328

    .line 284
    sub-int v36, v40, v9

    .line 292
    .local v36, "i":I
    move-object/from16 v0, v29

    invoke-interface {v0, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v27

    .end local v27    # "cert":Ljava/security/cert/X509Certificate;
    check-cast v27, Ljava/security/cert/X509Certificate;

    .line 293
    .restart local v27    # "cert":Ljava/security/cert/X509Certificate;
    invoke-interface/range {v29 .. v29}, Ljava/util/List;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    if-ne v9, v4, :cond_231

    const/4 v11, 0x1

    .line 299
    .local v11, "verificationAlreadyPerformed":Z
    :goto_1ef
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/spongycastle/jce/provider/PKIXCertPathValidatorSpi;->helper:Lorg/spongycastle/jcajce/util/JcaJceHelper;

    move-object/from16 v7, p1

    move-object/from16 v8, v21

    invoke-static/range {v7 .. v14}, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->processCertA(Ljava/security/cert/CertPath;Lorg/spongycastle/jcajce/PKIXExtendedParameters;ILjava/security/PublicKey;ZLorg/spongycastle/asn1/x500/X500Name;Ljava/security/cert/X509Certificate;Lorg/spongycastle/jcajce/util/JcaJceHelper;)V

    .line 302
    move-object/from16 v0, p1

    move-object/from16 v1, v41

    invoke-static {v0, v9, v1}, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->processCertBC(Ljava/security/cert/CertPath;ILorg/spongycastle/jce/provider/PKIXNameConstraintValidator;)V

    move-object/from16 v14, p1

    move v15, v9

    move-object/from16 v17, v3

    .line 304
    invoke-static/range {v14 .. v19}, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->processCertD(Ljava/security/cert/CertPath;ILjava/util/Set;Lorg/spongycastle/jce/provider/PKIXPolicyNode;[Ljava/util/List;I)Lorg/spongycastle/jce/provider/PKIXPolicyNode;

    move-result-object v3

    .line 307
    move-object/from16 v0, p1

    invoke-static {v0, v9, v3}, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->processCertE(Ljava/security/cert/CertPath;ILorg/spongycastle/jce/provider/PKIXPolicyNode;)Lorg/spongycastle/jce/provider/PKIXPolicyNode;

    move-result-object v3

    .line 309
    move-object/from16 v0, p1

    move/from16 v1, v34

    invoke-static {v0, v9, v3, v1}, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->processCertF(Ljava/security/cert/CertPath;ILorg/spongycastle/jce/provider/PKIXPolicyNode;I)V

    .line 315
    move/from16 v0, v36

    move/from16 v1, v40

    if-eq v0, v1, :cond_311

    .line 317
    if-eqz v27, :cond_233

    invoke-virtual/range {v27 .. v27}, Ljava/security/cert/X509Certificate;->getVersion()I

    move-result v4

    const/4 v5, 0x1

    if-ne v4, v5, :cond_233

    .line 319
    new-instance v4, Ljava/security/cert/CertPathValidatorException;

    const-string v5, "Version 1 certificates can\'t be used as CA ones."

    const/4 v7, 0x0

    move-object/from16 v0, p1

    invoke-direct {v4, v5, v7, v0, v9}, Ljava/security/cert/CertPathValidatorException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Ljava/security/cert/CertPath;I)V

    throw v4

    .line 293
    .end local v11    # "verificationAlreadyPerformed":Z
    :cond_231
    const/4 v11, 0x0

    goto :goto_1ef

    .line 323
    .restart local v11    # "verificationAlreadyPerformed":Z
    :cond_233
    move-object/from16 v0, p1

    invoke-static {v0, v9}, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->prepareNextCertA(Ljava/security/cert/CertPath;I)V

    .line 325
    move-object/from16 v0, p1

    move-object/from16 v1, v18

    move/from16 v2, v44

    invoke-static {v0, v9, v1, v3, v2}, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->prepareCertB(Ljava/security/cert/CertPath;I[Ljava/util/List;Lorg/spongycastle/jce/provider/PKIXPolicyNode;I)Lorg/spongycastle/jce/provider/PKIXPolicyNode;

    move-result-object v3

    .line 328
    move-object/from16 v0, p1

    move-object/from16 v1, v41

    invoke-static {v0, v9, v1}, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->prepareNextCertG(Ljava/security/cert/CertPath;ILorg/spongycastle/jce/provider/PKIXNameConstraintValidator;)V

    .line 331
    move-object/from16 v0, p1

    move/from16 v1, v34

    invoke-static {v0, v9, v1}, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->prepareNextCertH1(Ljava/security/cert/CertPath;II)I

    move-result v34

    .line 332
    move-object/from16 v0, p1

    move/from16 v1, v44

    invoke-static {v0, v9, v1}, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->prepareNextCertH2(Ljava/security/cert/CertPath;II)I

    move-result v44

    .line 333
    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-static {v0, v9, v1}, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->prepareNextCertH3(Ljava/security/cert/CertPath;II)I

    move-result v19

    .line 338
    move-object/from16 v0, p1

    move/from16 v1, v34

    invoke-static {v0, v9, v1}, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->prepareNextCertI1(Ljava/security/cert/CertPath;II)I

    move-result v34

    .line 339
    move-object/from16 v0, p1

    move/from16 v1, v44

    invoke-static {v0, v9, v1}, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->prepareNextCertI2(Ljava/security/cert/CertPath;II)I

    move-result v44

    .line 342
    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-static {v0, v9, v1}, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->prepareNextCertJ(Ljava/security/cert/CertPath;II)I

    move-result v19

    .line 345
    move-object/from16 v0, p1

    invoke-static {v0, v9}, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->prepareNextCertK(Ljava/security/cert/CertPath;I)V

    .line 348
    move-object/from16 v0, p1

    move/from16 v1, v39

    invoke-static {v0, v9, v1}, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->prepareNextCertL(Ljava/security/cert/CertPath;II)I

    move-result v39

    .line 351
    move-object/from16 v0, p1

    move/from16 v1, v39

    invoke-static {v0, v9, v1}, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->prepareNextCertM(Ljava/security/cert/CertPath;II)I

    move-result v39

    .line 354
    move-object/from16 v0, p1

    invoke-static {v0, v9}, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->prepareNextCertN(Ljava/security/cert/CertPath;I)V

    .line 356
    invoke-virtual/range {v27 .. v27}, Ljava/security/cert/X509Certificate;->getCriticalExtensionOIDs()Ljava/util/Set;

    move-result-object v30

    .line 357
    .local v30, "criticalExtensions":Ljava/util/Set;
    if-eqz v30, :cond_315

    .line 359
    new-instance v31, Ljava/util/HashSet;

    move-object/from16 v0, v31

    move-object/from16 v1, v30

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 362
    .end local v30    # "criticalExtensions":Ljava/util/Set;
    .local v31, "criticalExtensions":Ljava/util/Set;
    sget-object v4, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->KEY_USAGE:Ljava/lang/String;

    move-object/from16 v0, v31

    invoke-interface {v0, v4}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 363
    sget-object v4, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->CERTIFICATE_POLICIES:Ljava/lang/String;

    move-object/from16 v0, v31

    invoke-interface {v0, v4}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 364
    sget-object v4, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->POLICY_MAPPINGS:Ljava/lang/String;

    move-object/from16 v0, v31

    invoke-interface {v0, v4}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 365
    sget-object v4, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->INHIBIT_ANY_POLICY:Ljava/lang/String;

    move-object/from16 v0, v31

    invoke-interface {v0, v4}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 366
    sget-object v4, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->ISSUING_DISTRIBUTION_POINT:Ljava/lang/String;

    move-object/from16 v0, v31

    invoke-interface {v0, v4}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 367
    sget-object v4, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->DELTA_CRL_INDICATOR:Ljava/lang/String;

    move-object/from16 v0, v31

    invoke-interface {v0, v4}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 368
    sget-object v4, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->POLICY_CONSTRAINTS:Ljava/lang/String;

    move-object/from16 v0, v31

    invoke-interface {v0, v4}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 369
    sget-object v4, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->BASIC_CONSTRAINTS:Ljava/lang/String;

    move-object/from16 v0, v31

    invoke-interface {v0, v4}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 370
    sget-object v4, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->SUBJECT_ALTERNATIVE_NAME:Ljava/lang/String;

    move-object/from16 v0, v31

    invoke-interface {v0, v4}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 371
    sget-object v4, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->NAME_CONSTRAINTS:Ljava/lang/String;

    move-object/from16 v0, v31

    invoke-interface {v0, v4}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-object/from16 v30, v31

    .line 379
    .end local v31    # "criticalExtensions":Ljava/util/Set;
    .restart local v30    # "criticalExtensions":Ljava/util/Set;
    :goto_2ea
    move-object/from16 v0, p1

    move-object/from16 v1, v30

    move-object/from16 v2, v43

    invoke-static {v0, v9, v1, v2}, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->prepareNextCertO(Ljava/security/cert/CertPath;ILjava/util/Set;Ljava/util/List;)V

    .line 382
    move-object/from16 v13, v27

    .line 385
    invoke-static {v13}, Lorg/spongycastle/jce/provider/PrincipalUtils;->getSubjectPrincipal(Ljava/security/cert/X509Certificate;)Lorg/spongycastle/asn1/x500/X500Name;

    move-result-object v12

    .line 390
    :try_start_2f9
    invoke-virtual/range {p1 .. p1}, Ljava/security/cert/CertPath;->getCertificates()Ljava/util/List;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/spongycastle/jce/provider/PKIXCertPathValidatorSpi;->helper:Lorg/spongycastle/jcajce/util/JcaJceHelper;

    invoke-static {v4, v9, v5}, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->getNextWorkingKey(Ljava/util/List;ILorg/spongycastle/jcajce/util/JcaJceHelper;)Ljava/security/PublicKey;
    :try_end_304
    .catch Ljava/security/cert/CertPathValidatorException; {:try_start_2f9 .. :try_end_304} :catch_31b

    move-result-object v10

    .line 397
    invoke-static {v10}, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->getAlgorithmIdentifier(Ljava/security/PublicKey;)Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    move-result-object v46

    .line 399
    invoke-virtual/range {v46 .. v46}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->getAlgorithm()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v47

    .line 401
    invoke-virtual/range {v46 .. v46}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->getParameters()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v48

    .line 277
    .end local v30    # "criticalExtensions":Ljava/util/Set;
    :cond_311
    add-int/lit8 v9, v9, -0x1

    goto/16 :goto_1da

    .line 375
    .restart local v30    # "criticalExtensions":Ljava/util/Set;
    :cond_315
    new-instance v30, Ljava/util/HashSet;

    .end local v30    # "criticalExtensions":Ljava/util/Set;
    invoke-direct/range {v30 .. v30}, Ljava/util/HashSet;-><init>()V

    .restart local v30    # "criticalExtensions":Ljava/util/Set;
    goto :goto_2ea

    .line 392
    :catch_31b
    move-exception v32

    .line 394
    .restart local v32    # "e":Ljava/security/cert/CertPathValidatorException;
    new-instance v4, Ljava/security/cert/CertPathValidatorException;

    const-string v5, "Next working key could not be retrieved."

    move-object/from16 v0, v32

    move-object/from16 v1, p1

    invoke-direct {v4, v5, v0, v1, v9}, Ljava/security/cert/CertPathValidatorException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Ljava/security/cert/CertPath;I)V

    throw v4

    .line 409
    .end local v11    # "verificationAlreadyPerformed":Z
    .end local v30    # "criticalExtensions":Ljava/util/Set;
    .end local v32    # "e":Ljava/security/cert/CertPathValidatorException;
    .end local v36    # "i":I
    :cond_328
    move/from16 v0, v34

    move-object/from16 v1, v27

    invoke-static {v0, v1}, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->wrapupCertA(ILjava/security/cert/X509Certificate;)I

    move-result v34

    .line 411
    add-int/lit8 v4, v9, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v34

    invoke-static {v0, v4, v1}, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->wrapupCertB(Ljava/security/cert/CertPath;II)I

    move-result v34

    .line 420
    invoke-virtual/range {v27 .. v27}, Ljava/security/cert/X509Certificate;->getCriticalExtensionOIDs()Ljava/util/Set;

    move-result-object v30

    .line 422
    .restart local v30    # "criticalExtensions":Ljava/util/Set;
    if-eqz v30, :cond_3ce

    .line 424
    new-instance v31, Ljava/util/HashSet;

    move-object/from16 v0, v31

    move-object/from16 v1, v30

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 426
    .end local v30    # "criticalExtensions":Ljava/util/Set;
    .restart local v31    # "criticalExtensions":Ljava/util/Set;
    sget-object v4, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->KEY_USAGE:Ljava/lang/String;

    move-object/from16 v0, v31

    invoke-interface {v0, v4}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 427
    sget-object v4, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->CERTIFICATE_POLICIES:Ljava/lang/String;

    move-object/from16 v0, v31

    invoke-interface {v0, v4}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 428
    sget-object v4, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->POLICY_MAPPINGS:Ljava/lang/String;

    move-object/from16 v0, v31

    invoke-interface {v0, v4}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 429
    sget-object v4, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->INHIBIT_ANY_POLICY:Ljava/lang/String;

    move-object/from16 v0, v31

    invoke-interface {v0, v4}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 430
    sget-object v4, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->ISSUING_DISTRIBUTION_POINT:Ljava/lang/String;

    move-object/from16 v0, v31

    invoke-interface {v0, v4}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 431
    sget-object v4, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->DELTA_CRL_INDICATOR:Ljava/lang/String;

    move-object/from16 v0, v31

    invoke-interface {v0, v4}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 432
    sget-object v4, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->POLICY_CONSTRAINTS:Ljava/lang/String;

    move-object/from16 v0, v31

    invoke-interface {v0, v4}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 433
    sget-object v4, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->BASIC_CONSTRAINTS:Ljava/lang/String;

    move-object/from16 v0, v31

    invoke-interface {v0, v4}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 434
    sget-object v4, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->SUBJECT_ALTERNATIVE_NAME:Ljava/lang/String;

    move-object/from16 v0, v31

    invoke-interface {v0, v4}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 435
    sget-object v4, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->NAME_CONSTRAINTS:Ljava/lang/String;

    move-object/from16 v0, v31

    invoke-interface {v0, v4}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 436
    sget-object v4, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->CRL_DISTRIBUTION_POINTS:Ljava/lang/String;

    move-object/from16 v0, v31

    invoke-interface {v0, v4}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 437
    sget-object v4, Lorg/spongycastle/asn1/x509/Extension;->extendedKeyUsage:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v4}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v31

    invoke-interface {v0, v4}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-object/from16 v30, v31

    .line 444
    .end local v31    # "criticalExtensions":Ljava/util/Set;
    .restart local v30    # "criticalExtensions":Ljava/util/Set;
    :goto_3a3
    add-int/lit8 v4, v9, 0x1

    move-object/from16 v0, p1

    move-object/from16 v1, v43

    move-object/from16 v2, v30

    invoke-static {v0, v4, v1, v2}, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->wrapupCertF(Ljava/security/cert/CertPath;ILjava/util/List;Ljava/util/Set;)V

    .line 446
    add-int/lit8 v23, v9, 0x1

    move-object/from16 v20, p1

    move-object/from16 v24, v18

    move-object/from16 v25, v3

    move-object/from16 v26, v16

    invoke-static/range {v20 .. v26}, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->wrapupCertG(Ljava/security/cert/CertPath;Lorg/spongycastle/jcajce/PKIXExtendedParameters;Ljava/util/Set;I[Ljava/util/List;Lorg/spongycastle/jce/provider/PKIXPolicyNode;Ljava/util/Set;)Lorg/spongycastle/jce/provider/PKIXPolicyNode;

    move-result-object v37

    .line 449
    .local v37, "intersection":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    if-gtz v34, :cond_3c0

    if-eqz v37, :cond_3d4

    .line 451
    :cond_3c0
    new-instance v4, Ljava/security/cert/PKIXCertPathValidatorResult;

    invoke-virtual/range {v27 .. v27}, Ljava/security/cert/X509Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v5

    move-object/from16 v0, v45

    move-object/from16 v1, v37

    invoke-direct {v4, v0, v1, v5}, Ljava/security/cert/PKIXCertPathValidatorResult;-><init>(Ljava/security/cert/TrustAnchor;Ljava/security/cert/PolicyNode;Ljava/security/PublicKey;)V

    return-object v4

    .line 441
    .end local v37    # "intersection":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    :cond_3ce
    new-instance v30, Ljava/util/HashSet;

    .end local v30    # "criticalExtensions":Ljava/util/Set;
    invoke-direct/range {v30 .. v30}, Ljava/util/HashSet;-><init>()V

    .restart local v30    # "criticalExtensions":Ljava/util/Set;
    goto :goto_3a3

    .line 454
    .restart local v37    # "intersection":Lorg/spongycastle/jce/provider/PKIXPolicyNode;
    :cond_3d4
    new-instance v4, Ljava/security/cert/CertPathValidatorException;

    const-string v5, "Path processing failed on policy."

    const/4 v7, 0x0

    move-object/from16 v0, p1

    invoke-direct {v4, v5, v7, v0, v9}, Ljava/security/cert/CertPathValidatorException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Ljava/security/cert/CertPath;I)V

    throw v4
.end method
