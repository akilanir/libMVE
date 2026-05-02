.class Lorg/spongycastle/x509/PKIXCRLUtil;
.super Ljava/lang/Object;
.source "PKIXCRLUtil.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final findCRLs(Lorg/spongycastle/x509/X509CRLStoreSelector;Ljava/util/List;)Ljava/util/Collection;
    .registers 11
    .param p1, "crlSelect"    # Lorg/spongycastle/x509/X509CRLStoreSelector;
    .param p2, "crlStores"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/jce/provider/AnnotatedException;
        }
    .end annotation

    .prologue
    .line 105
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 106
    .local v0, "crls":Ljava/util/Set;
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 108
    .local v3, "iter":Ljava/util/Iterator;
    const/4 v4, 0x0

    .line 109
    .local v4, "lastException":Lorg/spongycastle/jce/provider/AnnotatedException;
    const/4 v2, 0x0

    .line 111
    .local v2, "foundValidStore":Z
    :goto_b
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_43

    .line 113
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    .line 115
    .local v5, "obj":Ljava/lang/Object;
    instance-of v7, v5, Lorg/spongycastle/x509/X509Store;

    if-eqz v7, :cond_2e

    move-object v6, v5

    .line 117
    check-cast v6, Lorg/spongycastle/x509/X509Store;

    .line 121
    .local v6, "store":Lorg/spongycastle/x509/X509Store;
    :try_start_1c
    invoke-virtual {v6, p1}, Lorg/spongycastle/x509/X509Store;->getMatches(Lorg/spongycastle/util/Selector;)Ljava/util/Collection;

    move-result-object v7

    invoke-interface {v0, v7}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z
    :try_end_23
    .catch Lorg/spongycastle/util/StoreException; {:try_start_1c .. :try_end_23} :catch_25

    .line 122
    const/4 v2, 0x1

    goto :goto_b

    .line 124
    :catch_25
    move-exception v1

    .line 126
    .local v1, "e":Lorg/spongycastle/util/StoreException;
    new-instance v4, Lorg/spongycastle/jce/provider/AnnotatedException;

    .end local v4    # "lastException":Lorg/spongycastle/jce/provider/AnnotatedException;
    const-string v7, "Exception searching in X.509 CRL store."

    invoke-direct {v4, v7, v1}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .restart local v4    # "lastException":Lorg/spongycastle/jce/provider/AnnotatedException;
    goto :goto_b

    .end local v1    # "e":Lorg/spongycastle/util/StoreException;
    .end local v6    # "store":Lorg/spongycastle/x509/X509Store;
    :cond_2e
    move-object v6, v5

    .line 132
    check-cast v6, Ljava/security/cert/CertStore;

    .line 136
    .local v6, "store":Ljava/security/cert/CertStore;
    :try_start_31
    invoke-virtual {v6, p1}, Ljava/security/cert/CertStore;->getCRLs(Ljava/security/cert/CRLSelector;)Ljava/util/Collection;

    move-result-object v7

    invoke-interface {v0, v7}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z
    :try_end_38
    .catch Ljava/security/cert/CertStoreException; {:try_start_31 .. :try_end_38} :catch_3a

    .line 137
    const/4 v2, 0x1

    goto :goto_b

    .line 139
    :catch_3a
    move-exception v1

    .line 141
    .local v1, "e":Ljava/security/cert/CertStoreException;
    new-instance v4, Lorg/spongycastle/jce/provider/AnnotatedException;

    .end local v4    # "lastException":Lorg/spongycastle/jce/provider/AnnotatedException;
    const-string v7, "Exception searching in X.509 CRL store."

    invoke-direct {v4, v7, v1}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .restart local v4    # "lastException":Lorg/spongycastle/jce/provider/AnnotatedException;
    goto :goto_b

    .line 146
    .end local v1    # "e":Ljava/security/cert/CertStoreException;
    .end local v5    # "obj":Ljava/lang/Object;
    .end local v6    # "store":Ljava/security/cert/CertStore;
    :cond_43
    if-nez v2, :cond_48

    if-eqz v4, :cond_48

    .line 148
    throw v4

    .line 150
    :cond_48
    return-object v0
.end method


# virtual methods
.method public findCRLs(Lorg/spongycastle/x509/X509CRLStoreSelector;Ljava/security/cert/PKIXParameters;)Ljava/util/Set;
    .registers 7
    .param p1, "crlselect"    # Lorg/spongycastle/x509/X509CRLStoreSelector;
    .param p2, "paramsPKIX"    # Ljava/security/cert/PKIXParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/jce/provider/AnnotatedException;
        }
    .end annotation

    .prologue
    .line 74
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 79
    .local v0, "completeSet":Ljava/util/Set;
    :try_start_5
    invoke-virtual {p2}, Ljava/security/cert/PKIXParameters;->getCertStores()Ljava/util/List;

    move-result-object v2

    invoke-direct {p0, p1, v2}, Lorg/spongycastle/x509/PKIXCRLUtil;->findCRLs(Lorg/spongycastle/x509/X509CRLStoreSelector;Ljava/util/List;)Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z
    :try_end_10
    .catch Lorg/spongycastle/jce/provider/AnnotatedException; {:try_start_5 .. :try_end_10} :catch_11

    .line 86
    return-object v0

    .line 81
    :catch_11
    move-exception v1

    .line 83
    .local v1, "e":Lorg/spongycastle/jce/provider/AnnotatedException;
    new-instance v2, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v3, "Exception obtaining complete CRLs."

    invoke-direct {v2, v3, v1}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method public findCRLs(Lorg/spongycastle/x509/X509CRLStoreSelector;Lorg/spongycastle/x509/ExtendedPKIXParameters;Ljava/util/Date;)Ljava/util/Set;
    .registers 13
    .param p1, "crlselect"    # Lorg/spongycastle/x509/X509CRLStoreSelector;
    .param p2, "paramsPKIX"    # Lorg/spongycastle/x509/ExtendedPKIXParameters;
    .param p3, "currentDate"    # Ljava/util/Date;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/jce/provider/AnnotatedException;
        }
    .end annotation

    .prologue
    .line 23
    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    .line 28
    .local v4, "initialSet":Ljava/util/Set;
    :try_start_5
    invoke-virtual {p2}, Lorg/spongycastle/x509/ExtendedPKIXParameters;->getAdditionalStores()Ljava/util/List;

    move-result-object v7

    invoke-direct {p0, p1, v7}, Lorg/spongycastle/x509/PKIXCRLUtil;->findCRLs(Lorg/spongycastle/x509/X509CRLStoreSelector;Ljava/util/List;)Ljava/util/Collection;

    move-result-object v7

    invoke-interface {v4, v7}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 29
    invoke-virtual {p2}, Lorg/spongycastle/x509/ExtendedPKIXParameters;->getStores()Ljava/util/List;

    move-result-object v7

    invoke-direct {p0, p1, v7}, Lorg/spongycastle/x509/PKIXCRLUtil;->findCRLs(Lorg/spongycastle/x509/X509CRLStoreSelector;Ljava/util/List;)Ljava/util/Collection;

    move-result-object v7

    invoke-interface {v4, v7}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 30
    invoke-virtual {p2}, Lorg/spongycastle/x509/ExtendedPKIXParameters;->getCertStores()Ljava/util/List;

    move-result-object v7

    invoke-direct {p0, p1, v7}, Lorg/spongycastle/x509/PKIXCRLUtil;->findCRLs(Lorg/spongycastle/x509/X509CRLStoreSelector;Ljava/util/List;)Ljava/util/Collection;

    move-result-object v7

    invoke-interface {v4, v7}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z
    :try_end_26
    .catch Lorg/spongycastle/jce/provider/AnnotatedException; {:try_start_5 .. :try_end_26} :catch_68

    .line 37
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 38
    .local v3, "finalSet":Ljava/util/Set;
    move-object v6, p3

    .line 40
    .local v6, "validityDate":Ljava/util/Date;
    invoke-virtual {p2}, Lorg/spongycastle/x509/ExtendedPKIXParameters;->getDate()Ljava/util/Date;

    move-result-object v7

    if-eqz v7, :cond_36

    .line 42
    invoke-virtual {p2}, Lorg/spongycastle/x509/ExtendedPKIXParameters;->getDate()Ljava/util/Date;

    move-result-object v6

    .line 46
    :cond_36
    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "it":Ljava/util/Iterator;
    :cond_3a
    :goto_3a
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_75

    .line 48
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/security/cert/X509CRL;

    .line 50
    .local v1, "crl":Ljava/security/cert/X509CRL;
    invoke-virtual {v1}, Ljava/security/cert/X509CRL;->getNextUpdate()Ljava/util/Date;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/util/Date;->after(Ljava/util/Date;)Z

    move-result v7

    if-eqz v7, :cond_3a

    .line 52
    invoke-virtual {p1}, Lorg/spongycastle/x509/X509CRLStoreSelector;->getCertificateChecking()Ljava/security/cert/X509Certificate;

    move-result-object v0

    .line 54
    .local v0, "cert":Ljava/security/cert/X509Certificate;
    if-eqz v0, :cond_71

    .line 56
    invoke-virtual {v1}, Ljava/security/cert/X509CRL;->getThisUpdate()Ljava/util/Date;

    move-result-object v7

    invoke-virtual {v0}, Ljava/security/cert/X509Certificate;->getNotAfter()Ljava/util/Date;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/util/Date;->before(Ljava/util/Date;)Z

    move-result v7

    if-eqz v7, :cond_3a

    .line 58
    invoke-interface {v3, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_3a

    .line 32
    .end local v0    # "cert":Ljava/security/cert/X509Certificate;
    .end local v1    # "crl":Ljava/security/cert/X509CRL;
    .end local v3    # "finalSet":Ljava/util/Set;
    .end local v5    # "it":Ljava/util/Iterator;
    .end local v6    # "validityDate":Ljava/util/Date;
    :catch_68
    move-exception v2

    .line 34
    .local v2, "e":Lorg/spongycastle/jce/provider/AnnotatedException;
    new-instance v7, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v8, "Exception obtaining complete CRLs."

    invoke-direct {v7, v8, v2}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v7

    .line 63
    .end local v2    # "e":Lorg/spongycastle/jce/provider/AnnotatedException;
    .restart local v0    # "cert":Ljava/security/cert/X509Certificate;
    .restart local v1    # "crl":Ljava/security/cert/X509CRL;
    .restart local v3    # "finalSet":Ljava/util/Set;
    .restart local v5    # "it":Ljava/util/Iterator;
    .restart local v6    # "validityDate":Ljava/util/Date;
    :cond_71
    invoke-interface {v3, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_3a

    .line 68
    .end local v0    # "cert":Ljava/security/cert/X509Certificate;
    .end local v1    # "crl":Ljava/security/cert/X509CRL;
    :cond_75
    return-object v3
.end method
