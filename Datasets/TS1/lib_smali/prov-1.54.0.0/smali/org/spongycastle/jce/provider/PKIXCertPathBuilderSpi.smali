.class public Lorg/spongycastle/jce/provider/PKIXCertPathBuilderSpi;
.super Ljava/security/cert/CertPathBuilderSpi;
.source "PKIXCertPathBuilderSpi.java"


# instance fields
.field private certPathException:Ljava/lang/Exception;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/security/cert/CertPathBuilderSpi;-><init>()V

    return-void
.end method


# virtual methods
.method protected build(Ljava/security/cert/X509Certificate;Lorg/spongycastle/jcajce/PKIXExtendedBuilderParameters;Ljava/util/List;)Ljava/security/cert/CertPathBuilderResult;
    .registers 21
    .param p1, "tbvCert"    # Ljava/security/cert/X509Certificate;
    .param p2, "pkixParams"    # Lorg/spongycastle/jcajce/PKIXExtendedBuilderParameters;
    .param p3, "tbvPath"    # Ljava/util/List;

    .prologue
    .line 151
    move-object/from16 v0, p3

    move-object/from16 v1, p1

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_c

    .line 153
    const/4 v3, 0x0

    .line 278
    :cond_b
    :goto_b
    return-object v3

    .line 157
    :cond_c
    invoke-virtual/range {p2 .. p2}, Lorg/spongycastle/jcajce/PKIXExtendedBuilderParameters;->getExcludedCerts()Ljava/util/Set;

    move-result-object v13

    move-object/from16 v0, p1

    invoke-interface {v13, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_1a

    .line 159
    const/4 v3, 0x0

    goto :goto_b

    .line 162
    :cond_1a
    invoke-virtual/range {p2 .. p2}, Lorg/spongycastle/jcajce/PKIXExtendedBuilderParameters;->getMaxPathLength()I

    move-result v13

    const/4 v14, -0x1

    if-eq v13, v14, :cond_2f

    .line 164
    invoke-interface/range {p3 .. p3}, Ljava/util/List;->size()I

    move-result v13

    add-int/lit8 v13, v13, -0x1

    invoke-virtual/range {p2 .. p2}, Lorg/spongycastle/jcajce/PKIXExtendedBuilderParameters;->getMaxPathLength()I

    move-result v14

    if-le v13, v14, :cond_2f

    .line 166
    const/4 v3, 0x0

    goto :goto_b

    .line 170
    :cond_2f
    move-object/from16 v0, p3

    move-object/from16 v1, p1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 174
    const/4 v3, 0x0

    .line 178
    .local v3, "builderResult":Ljava/security/cert/CertPathBuilderResult;
    :try_start_37
    new-instance v4, Lorg/spongycastle/jcajce/provider/asymmetric/x509/CertificateFactory;

    invoke-direct {v4}, Lorg/spongycastle/jcajce/provider/asymmetric/x509/CertificateFactory;-><init>()V

    .line 179
    .local v4, "cFact":Lorg/spongycastle/jcajce/provider/asymmetric/x509/CertificateFactory;
    new-instance v12, Lorg/spongycastle/jce/provider/PKIXCertPathValidatorSpi;

    invoke-direct {v12}, Lorg/spongycastle/jce/provider/PKIXCertPathValidatorSpi;-><init>()V
    :try_end_41
    .catch Ljava/lang/Exception; {:try_start_37 .. :try_end_41} :catch_7e

    .line 190
    .local v12, "validator":Lorg/spongycastle/jce/provider/PKIXCertPathValidatorSpi;
    :try_start_41
    invoke-virtual/range {p2 .. p2}, Lorg/spongycastle/jcajce/PKIXExtendedBuilderParameters;->getBaseParameters()Lorg/spongycastle/jcajce/PKIXExtendedParameters;

    move-result-object v13

    invoke-virtual {v13}, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->getTrustAnchors()Ljava/util/Set;

    move-result-object v13

    .line 191
    invoke-virtual/range {p2 .. p2}, Lorg/spongycastle/jcajce/PKIXExtendedBuilderParameters;->getBaseParameters()Lorg/spongycastle/jcajce/PKIXExtendedParameters;

    move-result-object v14

    invoke-virtual {v14}, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->getSigProvider()Ljava/lang/String;

    move-result-object v14

    .line 190
    move-object/from16 v0, p1

    invoke-static {v0, v13, v14}, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->findTrustAnchor(Ljava/security/cert/X509Certificate;Ljava/util/Set;Ljava/lang/String;)Ljava/security/cert/TrustAnchor;
    :try_end_56
    .catch Lorg/spongycastle/jce/provider/AnnotatedException; {:try_start_41 .. :try_end_56} :catch_90

    move-result-object v13

    if-eqz v13, :cond_a9

    .line 195
    const/4 v5, 0x0

    .line 196
    .local v5, "certPath":Ljava/security/cert/CertPath;
    const/4 v10, 0x0

    .line 199
    .local v10, "result":Ljava/security/cert/PKIXCertPathValidatorResult;
    :try_start_5b
    move-object/from16 v0, p3

    invoke-virtual {v4, v0}, Lorg/spongycastle/jcajce/provider/asymmetric/x509/CertificateFactory;->engineGenerateCertPath(Ljava/util/List;)Ljava/security/cert/CertPath;
    :try_end_60
    .catch Ljava/lang/Exception; {:try_start_5b .. :try_end_60} :catch_87
    .catch Lorg/spongycastle/jce/provider/AnnotatedException; {:try_start_5b .. :try_end_60} :catch_90

    move-result-object v5

    .line 210
    :try_start_61
    move-object/from16 v0, p2

    invoke-virtual {v12, v5, v0}, Lorg/spongycastle/jce/provider/PKIXCertPathValidatorSpi;->engineValidate(Ljava/security/cert/CertPath;Ljava/security/cert/CertPathParameters;)Ljava/security/cert/CertPathValidatorResult;

    move-result-object v10

    .end local v10    # "result":Ljava/security/cert/PKIXCertPathValidatorResult;
    check-cast v10, Ljava/security/cert/PKIXCertPathValidatorResult;
    :try_end_69
    .catch Ljava/lang/Exception; {:try_start_61 .. :try_end_69} :catch_a0
    .catch Lorg/spongycastle/jce/provider/AnnotatedException; {:try_start_61 .. :try_end_69} :catch_90

    .line 219
    .restart local v10    # "result":Ljava/security/cert/PKIXCertPathValidatorResult;
    :try_start_69
    new-instance v13, Ljava/security/cert/PKIXCertPathBuilderResult;

    .line 220
    invoke-virtual {v10}, Ljava/security/cert/PKIXCertPathValidatorResult;->getTrustAnchor()Ljava/security/cert/TrustAnchor;

    move-result-object v14

    invoke-virtual {v10}, Ljava/security/cert/PKIXCertPathValidatorResult;->getPolicyTree()Ljava/security/cert/PolicyNode;

    move-result-object v15

    .line 221
    invoke-virtual {v10}, Ljava/security/cert/PKIXCertPathValidatorResult;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v13, v5, v14, v15, v0}, Ljava/security/cert/PKIXCertPathBuilderResult;-><init>(Ljava/security/cert/CertPath;Ljava/security/cert/TrustAnchor;Ljava/security/cert/PolicyNode;Ljava/security/PublicKey;)V
    :try_end_7c
    .catch Lorg/spongycastle/jce/provider/AnnotatedException; {:try_start_69 .. :try_end_7c} :catch_90

    move-object v3, v13

    goto :goto_b

    .line 181
    .end local v4    # "cFact":Lorg/spongycastle/jcajce/provider/asymmetric/x509/CertificateFactory;
    .end local v5    # "certPath":Ljava/security/cert/CertPath;
    .end local v10    # "result":Ljava/security/cert/PKIXCertPathValidatorResult;
    .end local v12    # "validator":Lorg/spongycastle/jce/provider/PKIXCertPathValidatorSpi;
    :catch_7e
    move-exception v6

    .line 184
    .local v6, "e":Ljava/lang/Exception;
    new-instance v13, Ljava/lang/RuntimeException;

    const-string v14, "Exception creating support classes."

    invoke-direct {v13, v14}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 201
    .end local v6    # "e":Ljava/lang/Exception;
    .restart local v4    # "cFact":Lorg/spongycastle/jcajce/provider/asymmetric/x509/CertificateFactory;
    .restart local v5    # "certPath":Ljava/security/cert/CertPath;
    .restart local v10    # "result":Ljava/security/cert/PKIXCertPathValidatorResult;
    .restart local v12    # "validator":Lorg/spongycastle/jce/provider/PKIXCertPathValidatorSpi;
    :catch_87
    move-exception v6

    .line 203
    .restart local v6    # "e":Ljava/lang/Exception;
    :try_start_88
    new-instance v13, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v14, "Certification path could not be constructed from certificate list."

    invoke-direct {v13, v14, v6}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v13
    :try_end_90
    .catch Lorg/spongycastle/jce/provider/AnnotatedException; {:try_start_88 .. :try_end_90} :catch_90

    .line 270
    .end local v5    # "certPath":Ljava/security/cert/CertPath;
    .end local v6    # "e":Ljava/lang/Exception;
    .end local v10    # "result":Ljava/security/cert/PKIXCertPathValidatorResult;
    :catch_90
    move-exception v6

    .line 272
    .local v6, "e":Lorg/spongycastle/jce/provider/AnnotatedException;
    move-object/from16 v0, p0

    iput-object v6, v0, Lorg/spongycastle/jce/provider/PKIXCertPathBuilderSpi;->certPathException:Ljava/lang/Exception;

    .line 274
    .end local v6    # "e":Lorg/spongycastle/jce/provider/AnnotatedException;
    :cond_95
    if-nez v3, :cond_b

    .line 276
    move-object/from16 v0, p3

    move-object/from16 v1, p1

    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    goto/16 :goto_b

    .line 213
    .restart local v5    # "certPath":Ljava/security/cert/CertPath;
    :catch_a0
    move-exception v6

    .line 215
    .local v6, "e":Ljava/lang/Exception;
    :try_start_a1
    new-instance v13, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v14, "Certification path could not be validated."

    invoke-direct {v13, v14, v6}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v13

    .line 226
    .end local v5    # "certPath":Ljava/security/cert/CertPath;
    .end local v6    # "e":Ljava/lang/Exception;
    :cond_a9
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 229
    .local v11, "stores":Ljava/util/List;
    invoke-virtual/range {p2 .. p2}, Lorg/spongycastle/jcajce/PKIXExtendedBuilderParameters;->getBaseParameters()Lorg/spongycastle/jcajce/PKIXExtendedParameters;

    move-result-object v13

    invoke-virtual {v13}, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->getCertificateStores()Ljava/util/List;

    move-result-object v13

    invoke-interface {v11, v13}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z
    :try_end_b9
    .catch Lorg/spongycastle/jce/provider/AnnotatedException; {:try_start_a1 .. :try_end_b9} :catch_90

    .line 234
    :try_start_b9
    sget-object v13, Lorg/spongycastle/asn1/x509/Extension;->issuerAlternativeName:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 235
    invoke-virtual {v13}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Ljava/security/cert/X509Certificate;->getExtensionValue(Ljava/lang/String;)[B

    move-result-object v13

    invoke-virtual/range {p2 .. p2}, Lorg/spongycastle/jcajce/PKIXExtendedBuilderParameters;->getBaseParameters()Lorg/spongycastle/jcajce/PKIXExtendedParameters;

    move-result-object v14

    invoke-virtual {v14}, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->getNamedCertificateStoreMap()Ljava/util/Map;

    move-result-object v14

    .line 234
    invoke-static {v13, v14}, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->getAdditionalStoresFromAltNames([BLjava/util/Map;)Ljava/util/List;

    move-result-object v13

    invoke-interface {v11, v13}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z
    :try_end_d4
    .catch Ljava/security/cert/CertificateParsingException; {:try_start_b9 .. :try_end_d4} :catch_f8
    .catch Lorg/spongycastle/jce/provider/AnnotatedException; {:try_start_b9 .. :try_end_d4} :catch_90

    .line 243
    :try_start_d4
    new-instance v8, Ljava/util/HashSet;

    invoke-direct {v8}, Ljava/util/HashSet;-><init>()V
    :try_end_d9
    .catch Lorg/spongycastle/jce/provider/AnnotatedException; {:try_start_d4 .. :try_end_d9} :catch_90

    .line 248
    .local v8, "issuers":Ljava/util/Collection;
    :try_start_d9
    invoke-virtual/range {p2 .. p2}, Lorg/spongycastle/jcajce/PKIXExtendedBuilderParameters;->getBaseParameters()Lorg/spongycastle/jcajce/PKIXExtendedParameters;

    move-result-object v13

    invoke-virtual {v13}, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->getCertStores()Ljava/util/List;

    move-result-object v13

    move-object/from16 v0, p1

    invoke-static {v0, v13, v11}, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->findIssuerCerts(Ljava/security/cert/X509Certificate;Ljava/util/List;Ljava/util/List;)Ljava/util/Collection;

    move-result-object v13

    invoke-interface {v8, v13}, Ljava/util/Collection;->addAll(Ljava/util/Collection;)Z
    :try_end_ea
    .catch Lorg/spongycastle/jce/provider/AnnotatedException; {:try_start_d9 .. :try_end_ea} :catch_101

    .line 256
    :try_start_ea
    invoke-interface {v8}, Ljava/util/Collection;->isEmpty()Z

    move-result v13

    if-eqz v13, :cond_10a

    .line 258
    new-instance v13, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v14, "No issuer certificate for certificate in certification path found."

    invoke-direct {v13, v14}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 237
    .end local v8    # "issuers":Ljava/util/Collection;
    :catch_f8
    move-exception v6

    .line 239
    .local v6, "e":Ljava/security/cert/CertificateParsingException;
    new-instance v13, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v14, "No additional X.509 stores can be added from certificate locations."

    invoke-direct {v13, v14, v6}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v13

    .line 250
    .end local v6    # "e":Ljava/security/cert/CertificateParsingException;
    .restart local v8    # "issuers":Ljava/util/Collection;
    :catch_101
    move-exception v6

    .line 252
    .local v6, "e":Lorg/spongycastle/jce/provider/AnnotatedException;
    new-instance v13, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v14, "Cannot find issuer certificate for certificate in certification path."

    invoke-direct {v13, v14, v6}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v13

    .line 261
    .end local v6    # "e":Lorg/spongycastle/jce/provider/AnnotatedException;
    :cond_10a
    invoke-interface {v8}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .line 263
    .local v9, "it":Ljava/util/Iterator;
    :goto_10e
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_95

    if-nez v3, :cond_95

    .line 265
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/security/cert/X509Certificate;

    .line 266
    .local v7, "issuer":Ljava/security/cert/X509Certificate;
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    invoke-virtual {v0, v7, v1, v2}, Lorg/spongycastle/jce/provider/PKIXCertPathBuilderSpi;->build(Ljava/security/cert/X509Certificate;Lorg/spongycastle/jcajce/PKIXExtendedBuilderParameters;Ljava/util/List;)Ljava/security/cert/CertPathBuilderResult;
    :try_end_125
    .catch Lorg/spongycastle/jce/provider/AnnotatedException; {:try_start_ea .. :try_end_125} :catch_90

    move-result-object v3

    .line 267
    goto :goto_10e
.end method

.method public engineBuild(Ljava/security/cert/CertPathParameters;)Ljava/security/cert/CertPathBuilderResult;
    .registers 18
    .param p1, "params"    # Ljava/security/cert/CertPathParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertPathBuilderException;,
            Ljava/security/InvalidAlgorithmParameterException;
        }
    .end annotation

    .prologue
    .line 48
    move-object/from16 v0, p1

    instance-of v13, v0, Ljava/security/cert/PKIXBuilderParameters;

    if-eqz v13, :cond_8c

    .line 50
    new-instance v9, Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;

    move-object/from16 v13, p1

    check-cast v13, Ljava/security/cert/PKIXBuilderParameters;

    invoke-direct {v9, v13}, Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;-><init>(Ljava/security/cert/PKIXParameters;)V

    .line 53
    .local v9, "paramsPKIXBldr":Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;
    move-object/from16 v0, p1

    instance-of v13, v0, Lorg/spongycastle/x509/ExtendedPKIXParameters;

    if-eqz v13, :cond_82

    move-object/from16 v5, p1

    .line 55
    check-cast v5, Lorg/spongycastle/x509/ExtendedPKIXBuilderParameters;

    .line 58
    .local v5, "extPKIX":Lorg/spongycastle/x509/ExtendedPKIXBuilderParameters;
    invoke-virtual {v5}, Lorg/spongycastle/x509/ExtendedPKIXBuilderParameters;->getAdditionalStores()Ljava/util/List;

    move-result-object v13

    invoke-interface {v13}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "it":Ljava/util/Iterator;
    :goto_21
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_31

    .line 60
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lorg/spongycastle/jcajce/PKIXCertStore;

    invoke-virtual {v9, v13}, Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;->addCertificateStore(Lorg/spongycastle/jcajce/PKIXCertStore;)Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;

    goto :goto_21

    .line 62
    :cond_31
    new-instance v7, Lorg/spongycastle/jcajce/PKIXExtendedBuilderParameters$Builder;

    invoke-virtual {v9}, Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;->build()Lorg/spongycastle/jcajce/PKIXExtendedParameters;

    move-result-object v13

    invoke-direct {v7, v13}, Lorg/spongycastle/jcajce/PKIXExtendedBuilderParameters$Builder;-><init>(Lorg/spongycastle/jcajce/PKIXExtendedParameters;)V

    .line 64
    .local v7, "paramsBldrPKIXBldr":Lorg/spongycastle/jcajce/PKIXExtendedBuilderParameters$Builder;
    invoke-virtual {v5}, Lorg/spongycastle/x509/ExtendedPKIXBuilderParameters;->getExcludedCerts()Ljava/util/Set;

    move-result-object v13

    invoke-virtual {v7, v13}, Lorg/spongycastle/jcajce/PKIXExtendedBuilderParameters$Builder;->addExcludedCerts(Ljava/util/Set;)Lorg/spongycastle/jcajce/PKIXExtendedBuilderParameters$Builder;

    .line 65
    invoke-virtual {v5}, Lorg/spongycastle/x509/ExtendedPKIXBuilderParameters;->getMaxPathLength()I

    move-result v13

    invoke-virtual {v7, v13}, Lorg/spongycastle/jcajce/PKIXExtendedBuilderParameters$Builder;->setMaxPathLength(I)Lorg/spongycastle/jcajce/PKIXExtendedBuilderParameters$Builder;

    .line 72
    .end local v5    # "extPKIX":Lorg/spongycastle/x509/ExtendedPKIXBuilderParameters;
    .end local v6    # "it":Ljava/util/Iterator;
    .end local p1    # "params":Ljava/security/cert/CertPathParameters;
    :goto_48
    invoke-virtual {v7}, Lorg/spongycastle/jcajce/PKIXExtendedBuilderParameters$Builder;->build()Lorg/spongycastle/jcajce/PKIXExtendedBuilderParameters;

    move-result-object v8

    .line 88
    .end local v7    # "paramsBldrPKIXBldr":Lorg/spongycastle/jcajce/PKIXExtendedBuilderParameters$Builder;
    .end local v9    # "paramsPKIXBldr":Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;
    .local v8, "paramsPKIX":Lorg/spongycastle/jcajce/PKIXExtendedBuilderParameters;
    :goto_4c
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 93
    .local v2, "certPathList":Ljava/util/List;
    invoke-virtual {v8}, Lorg/spongycastle/jcajce/PKIXExtendedBuilderParameters;->getBaseParameters()Lorg/spongycastle/jcajce/PKIXExtendedParameters;

    move-result-object v13

    invoke-virtual {v13}, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->getTargetConstraints()Lorg/spongycastle/jcajce/PKIXCertStoreSelector;

    move-result-object v3

    .line 97
    .local v3, "certSelect":Lorg/spongycastle/jcajce/PKIXCertStoreSelector;
    :try_start_59
    invoke-virtual {v8}, Lorg/spongycastle/jcajce/PKIXExtendedBuilderParameters;->getBaseParameters()Lorg/spongycastle/jcajce/PKIXExtendedParameters;

    move-result-object v13

    invoke-virtual {v13}, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->getCertificateStores()Ljava/util/List;

    move-result-object v13

    invoke-static {v3, v13}, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->findCertificates(Lorg/spongycastle/jcajce/PKIXCertStoreSelector;Ljava/util/List;)Ljava/util/Collection;

    move-result-object v12

    .line 98
    .local v12, "targets":Ljava/util/Collection;
    invoke-virtual {v8}, Lorg/spongycastle/jcajce/PKIXExtendedBuilderParameters;->getBaseParameters()Lorg/spongycastle/jcajce/PKIXExtendedParameters;

    move-result-object v13

    invoke-virtual {v13}, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->getCertStores()Ljava/util/List;

    move-result-object v13

    invoke-static {v3, v13}, Lorg/spongycastle/jce/provider/CertPathValidatorUtilities;->findCertificates(Lorg/spongycastle/jcajce/PKIXCertStoreSelector;Ljava/util/List;)Ljava/util/Collection;

    move-result-object v13

    invoke-interface {v12, v13}, Ljava/util/Collection;->addAll(Ljava/util/Collection;)Z
    :try_end_74
    .catch Lorg/spongycastle/jce/provider/AnnotatedException; {:try_start_59 .. :try_end_74} :catch_cc

    .line 106
    invoke-interface {v12}, Ljava/util/Collection;->isEmpty()Z

    move-result v13

    if-eqz v13, :cond_d5

    .line 109
    new-instance v13, Ljava/security/cert/CertPathBuilderException;

    const-string v14, "No certificate found matching targetContraints."

    invoke-direct {v13, v14}, Ljava/security/cert/CertPathBuilderException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 69
    .end local v2    # "certPathList":Ljava/util/List;
    .end local v3    # "certSelect":Lorg/spongycastle/jcajce/PKIXCertStoreSelector;
    .end local v8    # "paramsPKIX":Lorg/spongycastle/jcajce/PKIXExtendedBuilderParameters;
    .end local v12    # "targets":Ljava/util/Collection;
    .restart local v9    # "paramsPKIXBldr":Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;
    .restart local p1    # "params":Ljava/security/cert/CertPathParameters;
    :cond_82
    new-instance v7, Lorg/spongycastle/jcajce/PKIXExtendedBuilderParameters$Builder;

    check-cast p1, Ljava/security/cert/PKIXBuilderParameters;

    .end local p1    # "params":Ljava/security/cert/CertPathParameters;
    move-object/from16 v0, p1

    invoke-direct {v7, v0}, Lorg/spongycastle/jcajce/PKIXExtendedBuilderParameters$Builder;-><init>(Ljava/security/cert/PKIXBuilderParameters;)V

    .restart local v7    # "paramsBldrPKIXBldr":Lorg/spongycastle/jcajce/PKIXExtendedBuilderParameters$Builder;
    goto :goto_48

    .line 74
    .end local v7    # "paramsBldrPKIXBldr":Lorg/spongycastle/jcajce/PKIXExtendedBuilderParameters$Builder;
    .end local v9    # "paramsPKIXBldr":Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;
    .restart local p1    # "params":Ljava/security/cert/CertPathParameters;
    :cond_8c
    move-object/from16 v0, p1

    instance-of v13, v0, Lorg/spongycastle/jcajce/PKIXExtendedBuilderParameters;

    if-eqz v13, :cond_97

    move-object/from16 v8, p1

    .line 76
    check-cast v8, Lorg/spongycastle/jcajce/PKIXExtendedBuilderParameters;

    .restart local v8    # "paramsPKIX":Lorg/spongycastle/jcajce/PKIXExtendedBuilderParameters;
    goto :goto_4c

    .line 80
    .end local v8    # "paramsPKIX":Lorg/spongycastle/jcajce/PKIXExtendedBuilderParameters;
    :cond_97
    new-instance v13, Ljava/security/InvalidAlgorithmParameterException;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Parameters must be an instance of "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-class v15, Ljava/security/cert/PKIXBuilderParameters;

    .line 82
    invoke-virtual {v15}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, " or "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-class v15, Lorg/spongycastle/jcajce/PKIXExtendedBuilderParameters;

    .line 83
    invoke-virtual {v15}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "."

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 100
    .end local p1    # "params":Ljava/security/cert/CertPathParameters;
    .restart local v2    # "certPathList":Ljava/util/List;
    .restart local v3    # "certSelect":Lorg/spongycastle/jcajce/PKIXCertStoreSelector;
    .restart local v8    # "paramsPKIX":Lorg/spongycastle/jcajce/PKIXExtendedBuilderParameters;
    :catch_cc
    move-exception v4

    .line 102
    .local v4, "e":Lorg/spongycastle/jce/provider/AnnotatedException;
    new-instance v13, Lorg/spongycastle/jce/exception/ExtCertPathBuilderException;

    const-string v14, "Error finding target certificate."

    invoke-direct {v13, v14, v4}, Lorg/spongycastle/jce/exception/ExtCertPathBuilderException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v13

    .line 113
    .end local v4    # "e":Lorg/spongycastle/jce/provider/AnnotatedException;
    .restart local v12    # "targets":Ljava/util/Collection;
    :cond_d5
    const/4 v10, 0x0

    .line 116
    .local v10, "result":Ljava/security/cert/CertPathBuilderResult;
    invoke-interface {v12}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v11

    .line 117
    .local v11, "targetIter":Ljava/util/Iterator;
    :goto_da
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_ef

    if-nez v10, :cond_ef

    .line 119
    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/security/cert/X509Certificate;

    .line 120
    .local v1, "cert":Ljava/security/cert/X509Certificate;
    move-object/from16 v0, p0

    invoke-virtual {v0, v1, v8, v2}, Lorg/spongycastle/jce/provider/PKIXCertPathBuilderSpi;->build(Ljava/security/cert/X509Certificate;Lorg/spongycastle/jcajce/PKIXExtendedBuilderParameters;Ljava/util/List;)Ljava/security/cert/CertPathBuilderResult;

    move-result-object v10

    goto :goto_da

    .line 123
    .end local v1    # "cert":Ljava/security/cert/X509Certificate;
    :cond_ef
    if-nez v10, :cond_121

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/spongycastle/jce/provider/PKIXCertPathBuilderSpi;->certPathException:Ljava/lang/Exception;

    if-eqz v13, :cond_121

    .line 125
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/spongycastle/jce/provider/PKIXCertPathBuilderSpi;->certPathException:Ljava/lang/Exception;

    instance-of v13, v13, Lorg/spongycastle/jce/provider/AnnotatedException;

    if-eqz v13, :cond_115

    .line 127
    new-instance v13, Ljava/security/cert/CertPathBuilderException;

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/spongycastle/jce/provider/PKIXCertPathBuilderSpi;->certPathException:Ljava/lang/Exception;

    invoke-virtual {v14}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/spongycastle/jce/provider/PKIXCertPathBuilderSpi;->certPathException:Ljava/lang/Exception;

    invoke-virtual {v15}, Ljava/lang/Exception;->getCause()Ljava/lang/Throwable;

    move-result-object v15

    invoke-direct {v13, v14, v15}, Ljava/security/cert/CertPathBuilderException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v13

    .line 129
    :cond_115
    new-instance v13, Ljava/security/cert/CertPathBuilderException;

    const-string v14, "Possible certificate chain could not be validated."

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/spongycastle/jce/provider/PKIXCertPathBuilderSpi;->certPathException:Ljava/lang/Exception;

    invoke-direct {v13, v14, v15}, Ljava/security/cert/CertPathBuilderException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v13

    .line 134
    :cond_121
    if-nez v10, :cond_131

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/spongycastle/jce/provider/PKIXCertPathBuilderSpi;->certPathException:Ljava/lang/Exception;

    if-nez v13, :cond_131

    .line 136
    new-instance v13, Ljava/security/cert/CertPathBuilderException;

    const-string v14, "Unable to find certificate chain."

    invoke-direct {v13, v14}, Ljava/security/cert/CertPathBuilderException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 140
    :cond_131
    return-object v10
.end method
