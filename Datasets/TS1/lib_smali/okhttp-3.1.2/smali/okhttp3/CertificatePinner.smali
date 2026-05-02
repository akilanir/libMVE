.class public final Lokhttp3/CertificatePinner;
.super Ljava/lang/Object;
.source "CertificatePinner.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lokhttp3/CertificatePinner$Builder;
    }
.end annotation


# static fields
.field public static final DEFAULT:Lokhttp3/CertificatePinner;


# instance fields
.field private final hostnameToPins:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/Set",
            "<",
            "Lokio/ByteString;",
            ">;>;"
        }
    .end annotation
.end field

.field private final trustRootIndex:Lokhttp3/internal/tls/TrustRootIndex;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 130
    new-instance v0, Lokhttp3/CertificatePinner$Builder;

    invoke-direct {v0}, Lokhttp3/CertificatePinner$Builder;-><init>()V

    invoke-virtual {v0}, Lokhttp3/CertificatePinner$Builder;->build()Lokhttp3/CertificatePinner;

    move-result-object v0

    sput-object v0, Lokhttp3/CertificatePinner;->DEFAULT:Lokhttp3/CertificatePinner;

    return-void
.end method

.method private constructor <init>(Lokhttp3/CertificatePinner$Builder;)V
    .registers 3
    .param p1, "builder"    # Lokhttp3/CertificatePinner$Builder;

    .prologue
    .line 135
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 136
    # getter for: Lokhttp3/CertificatePinner$Builder;->hostnameToPins:Ljava/util/Map;
    invoke-static {p1}, Lokhttp3/CertificatePinner$Builder;->access$000(Lokhttp3/CertificatePinner$Builder;)Ljava/util/Map;

    move-result-object v0

    invoke-static {v0}, Lokhttp3/internal/Util;->immutableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lokhttp3/CertificatePinner;->hostnameToPins:Ljava/util/Map;

    .line 137
    # getter for: Lokhttp3/CertificatePinner$Builder;->trustRootIndex:Lokhttp3/internal/tls/TrustRootIndex;
    invoke-static {p1}, Lokhttp3/CertificatePinner$Builder;->access$100(Lokhttp3/CertificatePinner$Builder;)Lokhttp3/internal/tls/TrustRootIndex;

    move-result-object v0

    iput-object v0, p0, Lokhttp3/CertificatePinner;->trustRootIndex:Lokhttp3/internal/tls/TrustRootIndex;

    .line 138
    return-void
.end method

.method synthetic constructor <init>(Lokhttp3/CertificatePinner$Builder;Lokhttp3/CertificatePinner$1;)V
    .registers 3
    .param p1, "x0"    # Lokhttp3/CertificatePinner$Builder;
    .param p2, "x1"    # Lokhttp3/CertificatePinner$1;

    .prologue
    .line 129
    invoke-direct {p0, p1}, Lokhttp3/CertificatePinner;-><init>(Lokhttp3/CertificatePinner$Builder;)V

    return-void
.end method

.method static synthetic access$200(Lokhttp3/CertificatePinner;)Ljava/util/Map;
    .registers 2
    .param p0, "x0"    # Lokhttp3/CertificatePinner;

    .prologue
    .line 129
    iget-object v0, p0, Lokhttp3/CertificatePinner;->hostnameToPins:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$300(Lokhttp3/CertificatePinner;)Lokhttp3/internal/tls/TrustRootIndex;
    .registers 2
    .param p0, "x0"    # Lokhttp3/CertificatePinner;

    .prologue
    .line 129
    iget-object v0, p0, Lokhttp3/CertificatePinner;->trustRootIndex:Lokhttp3/internal/tls/TrustRootIndex;

    return-object v0
.end method

.method public static pin(Ljava/security/cert/Certificate;)Ljava/lang/String;
    .registers 3
    .param p0, "certificate"    # Ljava/security/cert/Certificate;

    .prologue
    .line 228
    instance-of v0, p0, Ljava/security/cert/X509Certificate;

    if-nez v0, :cond_c

    .line 229
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Certificate pinning requires X509 certificates"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 231
    :cond_c
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "sha1/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    check-cast p0, Ljava/security/cert/X509Certificate;

    .end local p0    # "certificate":Ljava/security/cert/Certificate;
    invoke-static {p0}, Lokhttp3/CertificatePinner;->sha1(Ljava/security/cert/X509Certificate;)Lokio/ByteString;

    move-result-object v1

    invoke-virtual {v1}, Lokio/ByteString;->base64()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static sha1(Ljava/security/cert/X509Certificate;)Lokio/ByteString;
    .registers 2
    .param p0, "x509Certificate"    # Ljava/security/cert/X509Certificate;

    .prologue
    .line 235
    invoke-virtual {p0}, Ljava/security/cert/X509Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v0

    invoke-interface {v0}, Ljava/security/PublicKey;->getEncoded()[B

    move-result-object v0

    invoke-static {v0}, Lokio/ByteString;->of([B)Lokio/ByteString;

    move-result-object v0

    invoke-static {v0}, Lokhttp3/internal/Util;->sha1(Lokio/ByteString;)Lokio/ByteString;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public check(Ljava/lang/String;Ljava/util/List;)V
    .registers 12
    .param p1, "hostname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/security/cert/Certificate;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLPeerUnverifiedException;
        }
    .end annotation

    .prologue
    .line 150
    .local p2, "peerCertificates":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/Certificate;>;"
    invoke-virtual {p0, p1}, Lokhttp3/CertificatePinner;->findMatchingPins(Ljava/lang/String;)Ljava/util/Set;

    move-result-object v3

    .line 152
    .local v3, "pins":Ljava/util/Set;, "Ljava/util/Set<Lokio/ByteString;>;"
    if-nez v3, :cond_7

    .line 160
    :cond_6
    return-void

    .line 154
    :cond_7
    iget-object v6, p0, Lokhttp3/CertificatePinner;->trustRootIndex:Lokhttp3/internal/tls/TrustRootIndex;

    if-eqz v6, :cond_16

    .line 155
    new-instance v6, Lokhttp3/internal/tls/CertificateChainCleaner;

    iget-object v7, p0, Lokhttp3/CertificatePinner;->trustRootIndex:Lokhttp3/internal/tls/TrustRootIndex;

    invoke-direct {v6, v7}, Lokhttp3/internal/tls/CertificateChainCleaner;-><init>(Lokhttp3/internal/tls/TrustRootIndex;)V

    invoke-virtual {v6, p2}, Lokhttp3/internal/tls/CertificateChainCleaner;->clean(Ljava/util/List;)Ljava/util/List;

    move-result-object p2

    .line 158
    :cond_16
    const/4 v0, 0x0

    .local v0, "i":I
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v4

    .local v4, "size":I
    :goto_1b
    if-ge v0, v4, :cond_30

    .line 159
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/security/cert/X509Certificate;

    .line 160
    .local v5, "x509Certificate":Ljava/security/cert/X509Certificate;
    invoke-static {v5}, Lokhttp3/CertificatePinner;->sha1(Ljava/security/cert/X509Certificate;)Lokio/ByteString;

    move-result-object v6

    invoke-interface {v3, v6}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_6

    .line 158
    add-int/lit8 v0, v0, 0x1

    goto :goto_1b

    .line 164
    .end local v5    # "x509Certificate":Ljava/security/cert/X509Certificate;
    :cond_30
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Certificate pinning failure!"

    .line 165
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\n  Peer certificate chain:"

    .line 166
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 167
    .local v1, "message":Ljava/lang/StringBuilder;
    const/4 v0, 0x0

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v4

    :goto_46
    if-ge v0, v4, :cond_70

    .line 168
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/security/cert/X509Certificate;

    .line 169
    .restart local v5    # "x509Certificate":Ljava/security/cert/X509Certificate;
    const-string v6, "\n    "

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-static {v5}, Lokhttp3/CertificatePinner;->pin(Ljava/security/cert/Certificate;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ": "

    .line 170
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v5}, Ljava/security/cert/X509Certificate;->getSubjectDN()Ljava/security/Principal;

    move-result-object v7

    invoke-interface {v7}, Ljava/security/Principal;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    add-int/lit8 v0, v0, 0x1

    goto :goto_46

    .line 172
    .end local v5    # "x509Certificate":Ljava/security/cert/X509Certificate;
    :cond_70
    const-string v6, "\n  Pinned certificates for "

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ":"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 173
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_83
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_9d

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lokio/ByteString;

    .line 174
    .local v2, "pin":Lokio/ByteString;
    const-string v7, "\n    sha1/"

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v2}, Lokio/ByteString;->base64()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_83

    .line 176
    .end local v2    # "pin":Lokio/ByteString;
    :cond_9d
    new-instance v6, Ljavax/net/ssl/SSLPeerUnverifiedException;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljavax/net/ssl/SSLPeerUnverifiedException;-><init>(Ljava/lang/String;)V

    throw v6
.end method

.method public varargs check(Ljava/lang/String;[Ljava/security/cert/Certificate;)V
    .registers 4
    .param p1, "hostname"    # Ljava/lang/String;
    .param p2, "peerCertificates"    # [Ljava/security/cert/Certificate;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLPeerUnverifiedException;
        }
    .end annotation

    .prologue
    .line 182
    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lokhttp3/CertificatePinner;->check(Ljava/lang/String;Ljava/util/List;)V

    .line 183
    return-void
.end method

.method findMatchingPins(Ljava/lang/String;)Ljava/util/Set;
    .registers 10
    .param p1, "hostname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Set",
            "<",
            "Lokio/ByteString;",
            ">;"
        }
    .end annotation

    .prologue
    const/16 v6, 0x2e

    .line 190
    iget-object v5, p0, Lokhttp3/CertificatePinner;->hostnameToPins:Ljava/util/Map;

    invoke-interface {v5, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    .line 191
    .local v0, "directPins":Ljava/util/Set;, "Ljava/util/Set<Lokio/ByteString;>;"
    const/4 v4, 0x0

    .line 193
    .local v4, "wildcardPins":Ljava/util/Set;, "Ljava/util/Set<Lokio/ByteString;>;"
    invoke-virtual {p1, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 194
    .local v1, "indexOfFirstDot":I
    invoke-virtual {p1, v6}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    .line 199
    .local v2, "indexOfLastDot":I
    if-eq v1, v2, :cond_36

    .line 201
    iget-object v5, p0, Lokhttp3/CertificatePinner;->hostnameToPins:Ljava/util/Map;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "*."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    add-int/lit8 v7, v1, 0x1

    invoke-virtual {p1, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .end local v4    # "wildcardPins":Ljava/util/Set;, "Ljava/util/Set<Lokio/ByteString;>;"
    check-cast v4, Ljava/util/Set;

    .line 204
    .restart local v4    # "wildcardPins":Ljava/util/Set;, "Ljava/util/Set<Lokio/ByteString;>;"
    :cond_36
    if-nez v0, :cond_3c

    if-nez v4, :cond_3c

    const/4 v3, 0x0

    .line 215
    :goto_3b
    return-object v3

    .line 206
    :cond_3c
    if-eqz v0, :cond_4c

    if-eqz v4, :cond_4c

    .line 207
    new-instance v3, Ljava/util/LinkedHashSet;

    invoke-direct {v3}, Ljava/util/LinkedHashSet;-><init>()V

    .line 208
    .local v3, "pins":Ljava/util/Set;, "Ljava/util/Set<Lokio/ByteString;>;"
    invoke-interface {v3, v0}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 209
    invoke-interface {v3, v4}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    goto :goto_3b

    .line 213
    .end local v3    # "pins":Ljava/util/Set;, "Ljava/util/Set<Lokio/ByteString;>;"
    :cond_4c
    if-eqz v0, :cond_50

    move-object v3, v0

    goto :goto_3b

    :cond_50
    move-object v3, v4

    .line 215
    goto :goto_3b
.end method

.method newBuilder()Lokhttp3/CertificatePinner$Builder;
    .registers 2

    .prologue
    .line 219
    new-instance v0, Lokhttp3/CertificatePinner$Builder;

    invoke-direct {v0, p0}, Lokhttp3/CertificatePinner$Builder;-><init>(Lokhttp3/CertificatePinner;)V

    return-object v0
.end method
