.class Lorg/spongycastle/jce/provider/PKIXCRLUtil;
.super Ljava/lang/Object;
.source "PKIXCRLUtil.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final findCRLs(Lorg/spongycastle/jcajce/PKIXCRLStoreSelector;Ljava/util/List;)Ljava/util/Collection;
    .registers 11
    .param p1, "crlSelect"    # Lorg/spongycastle/jcajce/PKIXCRLStoreSelector;
    .param p2, "crlStores"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/jce/provider/AnnotatedException;
        }
    .end annotation

    .prologue
    .line 81
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 82
    .local v0, "crls":Ljava/util/Set;
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 84
    .local v3, "iter":Ljava/util/Iterator;
    const/4 v4, 0x0

    .line 85
    .local v4, "lastException":Lorg/spongycastle/jce/provider/AnnotatedException;
    const/4 v2, 0x0

    .line 87
    .local v2, "foundValidStore":Z
    :goto_b
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_43

    .line 89
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    .line 91
    .local v5, "obj":Ljava/lang/Object;
    instance-of v7, v5, Lorg/spongycastle/util/Store;

    if-eqz v7, :cond_2e

    move-object v6, v5

    .line 93
    check-cast v6, Lorg/spongycastle/util/Store;

    .line 97
    .local v6, "store":Lorg/spongycastle/util/Store;
    :try_start_1c
    invoke-interface {v6, p1}, Lorg/spongycastle/util/Store;->getMatches(Lorg/spongycastle/util/Selector;)Ljava/util/Collection;

    move-result-object v7

    invoke-interface {v0, v7}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z
    :try_end_23
    .catch Lorg/spongycastle/util/StoreException; {:try_start_1c .. :try_end_23} :catch_25

    .line 98
    const/4 v2, 0x1

    goto :goto_b

    .line 100
    :catch_25
    move-exception v1

    .line 102
    .local v1, "e":Lorg/spongycastle/util/StoreException;
    new-instance v4, Lorg/spongycastle/jce/provider/AnnotatedException;

    .end local v4    # "lastException":Lorg/spongycastle/jce/provider/AnnotatedException;
    const-string v7, "Exception searching in X.509 CRL store."

    invoke-direct {v4, v7, v1}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .restart local v4    # "lastException":Lorg/spongycastle/jce/provider/AnnotatedException;
    goto :goto_b

    .end local v1    # "e":Lorg/spongycastle/util/StoreException;
    .end local v6    # "store":Lorg/spongycastle/util/Store;
    :cond_2e
    move-object v6, v5

    .line 108
    check-cast v6, Ljava/security/cert/CertStore;

    .line 112
    .local v6, "store":Ljava/security/cert/CertStore;
    :try_start_31
    invoke-static {p1, v6}, Lorg/spongycastle/jcajce/PKIXCRLStoreSelector;->getCRLs(Lorg/spongycastle/jcajce/PKIXCRLStoreSelector;Ljava/security/cert/CertStore;)Ljava/util/Collection;

    move-result-object v7

    invoke-interface {v0, v7}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z
    :try_end_38
    .catch Ljava/security/cert/CertStoreException; {:try_start_31 .. :try_end_38} :catch_3a

    .line 113
    const/4 v2, 0x1

    goto :goto_b

    .line 115
    :catch_3a
    move-exception v1

    .line 117
    .local v1, "e":Ljava/security/cert/CertStoreException;
    new-instance v4, Lorg/spongycastle/jce/provider/AnnotatedException;

    .end local v4    # "lastException":Lorg/spongycastle/jce/provider/AnnotatedException;
    const-string v7, "Exception searching in X.509 CRL store."

    invoke-direct {v4, v7, v1}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .restart local v4    # "lastException":Lorg/spongycastle/jce/provider/AnnotatedException;
    goto :goto_b

    .line 122
    .end local v1    # "e":Ljava/security/cert/CertStoreException;
    .end local v5    # "obj":Ljava/lang/Object;
    .end local v6    # "store":Ljava/security/cert/CertStore;
    :cond_43
    if-nez v2, :cond_48

    if-eqz v4, :cond_48

    .line 124
    throw v4

    .line 126
    :cond_48
    return-object v0
.end method


# virtual methods
.method public findCRLs(Lorg/spongycastle/jcajce/PKIXCRLStoreSelector;Ljava/util/Date;Ljava/util/List;Ljava/util/List;)Ljava/util/Set;
    .registers 13
    .param p1, "crlselect"    # Lorg/spongycastle/jcajce/PKIXCRLStoreSelector;
    .param p2, "validityDate"    # Ljava/util/Date;
    .param p3, "certStores"    # Ljava/util/List;
    .param p4, "pkixCrlStores"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/jce/provider/AnnotatedException;
        }
    .end annotation

    .prologue
    .line 24
    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    .line 29
    .local v4, "initialSet":Ljava/util/Set;
    :try_start_5
    invoke-direct {p0, p1, p4}, Lorg/spongycastle/jce/provider/PKIXCRLUtil;->findCRLs(Lorg/spongycastle/jcajce/PKIXCRLStoreSelector;Ljava/util/List;)Ljava/util/Collection;

    move-result-object v6

    invoke-interface {v4, v6}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 30
    invoke-direct {p0, p1, p3}, Lorg/spongycastle/jce/provider/PKIXCRLUtil;->findCRLs(Lorg/spongycastle/jcajce/PKIXCRLStoreSelector;Ljava/util/List;)Ljava/util/Collection;

    move-result-object v6

    invoke-interface {v4, v6}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z
    :try_end_13
    .catch Lorg/spongycastle/jce/provider/AnnotatedException; {:try_start_5 .. :try_end_13} :catch_4a

    .line 37
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 40
    .local v3, "finalSet":Ljava/util/Set;
    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "it":Ljava/util/Iterator;
    :cond_1c
    :goto_1c
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_57

    .line 42
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/security/cert/X509CRL;

    .line 44
    .local v1, "crl":Ljava/security/cert/X509CRL;
    invoke-virtual {v1}, Ljava/security/cert/X509CRL;->getNextUpdate()Ljava/util/Date;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/util/Date;->after(Ljava/util/Date;)Z

    move-result v6

    if-eqz v6, :cond_1c

    .line 46
    invoke-virtual {p1}, Lorg/spongycastle/jcajce/PKIXCRLStoreSelector;->getCertificateChecking()Ljava/security/cert/X509Certificate;

    move-result-object v0

    .line 48
    .local v0, "cert":Ljava/security/cert/X509Certificate;
    if-eqz v0, :cond_53

    .line 50
    invoke-virtual {v1}, Ljava/security/cert/X509CRL;->getThisUpdate()Ljava/util/Date;

    move-result-object v6

    invoke-virtual {v0}, Ljava/security/cert/X509Certificate;->getNotAfter()Ljava/util/Date;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/util/Date;->before(Ljava/util/Date;)Z

    move-result v6

    if-eqz v6, :cond_1c

    .line 52
    invoke-interface {v3, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_1c

    .line 32
    .end local v0    # "cert":Ljava/security/cert/X509Certificate;
    .end local v1    # "crl":Ljava/security/cert/X509CRL;
    .end local v3    # "finalSet":Ljava/util/Set;
    .end local v5    # "it":Ljava/util/Iterator;
    :catch_4a
    move-exception v2

    .line 34
    .local v2, "e":Lorg/spongycastle/jce/provider/AnnotatedException;
    new-instance v6, Lorg/spongycastle/jce/provider/AnnotatedException;

    const-string v7, "Exception obtaining complete CRLs."

    invoke-direct {v6, v7, v2}, Lorg/spongycastle/jce/provider/AnnotatedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 57
    .end local v2    # "e":Lorg/spongycastle/jce/provider/AnnotatedException;
    .restart local v0    # "cert":Ljava/security/cert/X509Certificate;
    .restart local v1    # "crl":Ljava/security/cert/X509CRL;
    .restart local v3    # "finalSet":Ljava/util/Set;
    .restart local v5    # "it":Ljava/util/Iterator;
    :cond_53
    invoke-interface {v3, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_1c

    .line 62
    .end local v0    # "cert":Ljava/security/cert/X509Certificate;
    .end local v1    # "crl":Ljava/security/cert/X509CRL;
    :cond_57
    return-object v3
.end method
