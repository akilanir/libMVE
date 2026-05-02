.class public final Lokhttp3/internal/tls/CertificateChainCleaner;
.super Ljava/lang/Object;
.source "CertificateChainCleaner.java"


# instance fields
.field private final trustRootIndex:Lokhttp3/internal/tls/TrustRootIndex;


# direct methods
.method public constructor <init>(Lokhttp3/internal/tls/TrustRootIndex;)V
    .registers 2
    .param p1, "trustRootIndex"    # Lokhttp3/internal/tls/TrustRootIndex;

    .prologue
    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    iput-object p1, p0, Lokhttp3/internal/tls/CertificateChainCleaner;->trustRootIndex:Lokhttp3/internal/tls/TrustRootIndex;

    .line 47
    return-void
.end method

.method private verifySignature(Ljava/security/cert/X509Certificate;Ljava/security/cert/X509Certificate;)Z
    .registers 5
    .param p1, "toVerify"    # Ljava/security/cert/X509Certificate;
    .param p2, "signingCert"    # Ljava/security/cert/X509Certificate;

    .prologue
    .line 95
    :try_start_0
    invoke-virtual {p2}, Ljava/security/cert/X509Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/security/cert/X509Certificate;->verify(Ljava/security/PublicKey;)V
    :try_end_7
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_7} :catch_9

    .line 96
    const/4 v1, 0x1

    .line 98
    :goto_8
    return v1

    .line 97
    :catch_9
    move-exception v0

    .line 98
    .local v0, "verifyFailed":Ljava/security/GeneralSecurityException;
    const/4 v1, 0x0

    goto :goto_8
.end method


# virtual methods
.method public clean(Ljava/util/List;)Ljava/util/List;
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/security/cert/Certificate;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Ljava/security/cert/Certificate;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLPeerUnverifiedException;
        }
    .end annotation

    .prologue
    .line 57
    .local p1, "chain":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/Certificate;>;"
    new-instance v2, Ljava/util/ArrayDeque;

    invoke-direct {v2, p1}, Ljava/util/ArrayDeque;-><init>(Ljava/util/Collection;)V

    .line 58
    .local v2, "queue":Ljava/util/Deque;, "Ljava/util/Deque<Ljava/security/cert/Certificate;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 59
    .local v3, "result":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/Certificate;>;"
    invoke-interface {v2}, Ljava/util/Deque;->removeFirst()Ljava/lang/Object;

    move-result-object v6

    invoke-interface {v3, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 63
    :goto_11
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    invoke-interface {v3, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/security/cert/X509Certificate;

    .line 68
    .local v5, "toVerify":Ljava/security/cert/X509Certificate;
    iget-object v6, p0, Lokhttp3/internal/tls/CertificateChainCleaner;->trustRootIndex:Lokhttp3/internal/tls/TrustRootIndex;

    invoke-interface {v6, v5}, Lokhttp3/internal/tls/TrustRootIndex;->findByIssuerAndSignature(Ljava/security/cert/X509Certificate;)Ljava/security/cert/X509Certificate;

    move-result-object v0

    .line 69
    .local v0, "caCert":Ljava/security/cert/X509Certificate;
    if-eqz v0, :cond_36

    .line 70
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v6

    const/4 v7, 0x1

    if-gt v6, v7, :cond_32

    invoke-virtual {v5, v0}, Ljava/security/cert/X509Certificate;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_35

    .line 71
    :cond_32
    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 73
    :cond_35
    return-object v3

    .line 78
    :cond_36
    invoke-interface {v2}, Ljava/util/Deque;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/security/cert/Certificate;>;"
    :cond_3a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_61

    .line 79
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/security/cert/X509Certificate;

    .line 80
    .local v4, "signingCert":Ljava/security/cert/X509Certificate;
    invoke-virtual {v5}, Ljava/security/cert/X509Certificate;->getIssuerDN()Ljava/security/Principal;

    move-result-object v6

    invoke-virtual {v4}, Ljava/security/cert/X509Certificate;->getSubjectDN()Ljava/security/Principal;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/security/Principal;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3a

    .line 81
    invoke-direct {p0, v5, v4}, Lokhttp3/internal/tls/CertificateChainCleaner;->verifySignature(Ljava/security/cert/X509Certificate;Ljava/security/cert/X509Certificate;)Z

    move-result v6

    if-eqz v6, :cond_3a

    .line 82
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    .line 83
    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_11

    .line 88
    .end local v4    # "signingCert":Ljava/security/cert/X509Certificate;
    :cond_61
    new-instance v6, Ljavax/net/ssl/SSLPeerUnverifiedException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Failed to find a cert that signed "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljavax/net/ssl/SSLPeerUnverifiedException;-><init>(Ljava/lang/String;)V

    throw v6
.end method
