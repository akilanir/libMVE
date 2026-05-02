.class public final Lokhttp3/CertificatePinner$Builder;
.super Ljava/lang/Object;
.source "CertificatePinner.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lokhttp3/CertificatePinner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


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

.field private trustRootIndex:Lokhttp3/internal/tls/TrustRootIndex;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 243
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 240
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lokhttp3/CertificatePinner$Builder;->hostnameToPins:Ljava/util/Map;

    .line 244
    return-void
.end method

.method constructor <init>(Lokhttp3/CertificatePinner;)V
    .registers 4
    .param p1, "certificatePinner"    # Lokhttp3/CertificatePinner;

    .prologue
    .line 246
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 240
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lokhttp3/CertificatePinner$Builder;->hostnameToPins:Ljava/util/Map;

    .line 247
    iget-object v0, p0, Lokhttp3/CertificatePinner$Builder;->hostnameToPins:Ljava/util/Map;

    # getter for: Lokhttp3/CertificatePinner;->hostnameToPins:Ljava/util/Map;
    invoke-static {p1}, Lokhttp3/CertificatePinner;->access$200(Lokhttp3/CertificatePinner;)Ljava/util/Map;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 248
    # getter for: Lokhttp3/CertificatePinner;->trustRootIndex:Lokhttp3/internal/tls/TrustRootIndex;
    invoke-static {p1}, Lokhttp3/CertificatePinner;->access$300(Lokhttp3/CertificatePinner;)Lokhttp3/internal/tls/TrustRootIndex;

    move-result-object v0

    iput-object v0, p0, Lokhttp3/CertificatePinner$Builder;->trustRootIndex:Lokhttp3/internal/tls/TrustRootIndex;

    .line 249
    return-void
.end method

.method static synthetic access$000(Lokhttp3/CertificatePinner$Builder;)Ljava/util/Map;
    .registers 2
    .param p0, "x0"    # Lokhttp3/CertificatePinner$Builder;

    .prologue
    .line 239
    iget-object v0, p0, Lokhttp3/CertificatePinner$Builder;->hostnameToPins:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$100(Lokhttp3/CertificatePinner$Builder;)Lokhttp3/internal/tls/TrustRootIndex;
    .registers 2
    .param p0, "x0"    # Lokhttp3/CertificatePinner$Builder;

    .prologue
    .line 239
    iget-object v0, p0, Lokhttp3/CertificatePinner$Builder;->trustRootIndex:Lokhttp3/internal/tls/TrustRootIndex;

    return-object v0
.end method


# virtual methods
.method public varargs add(Ljava/lang/String;[Ljava/lang/String;)Lokhttp3/CertificatePinner$Builder;
    .registers 10
    .param p1, "hostname"    # Ljava/lang/String;
    .param p2, "pins"    # [Ljava/lang/String;

    .prologue
    .line 264
    if-nez p1, :cond_a

    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "hostname == null"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 266
    :cond_a
    new-instance v1, Ljava/util/LinkedHashSet;

    invoke-direct {v1}, Ljava/util/LinkedHashSet;-><init>()V

    .line 267
    .local v1, "hostPins":Ljava/util/Set;, "Ljava/util/Set<Lokio/ByteString;>;"
    iget-object v4, p0, Lokhttp3/CertificatePinner$Builder;->hostnameToPins:Ljava/util/Map;

    invoke-static {v1}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v5

    invoke-interface {v4, p1, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Set;

    .line 268
    .local v3, "previousPins":Ljava/util/Set;, "Ljava/util/Set<Lokio/ByteString;>;"
    if-eqz v3, :cond_20

    .line 269
    invoke-interface {v1, v3}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 272
    :cond_20
    array-length v5, p2

    const/4 v4, 0x0

    :goto_22
    if-ge v4, v5, :cond_76

    aget-object v2, p2, v4

    .line 273
    .local v2, "pin":Ljava/lang/String;
    const-string v6, "sha1/"

    invoke-virtual {v2, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_47

    .line 274
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "pins must start with \'sha1/\': "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 276
    :cond_47
    const-string v6, "sha1/"

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    invoke-virtual {v2, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lokio/ByteString;->decodeBase64(Ljava/lang/String;)Lokio/ByteString;

    move-result-object v0

    .line 277
    .local v0, "decodedPin":Lokio/ByteString;
    if-nez v0, :cond_70

    .line 278
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "pins must be base64: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 280
    :cond_70
    invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 272
    add-int/lit8 v4, v4, 0x1

    goto :goto_22

    .line 283
    .end local v0    # "decodedPin":Lokio/ByteString;
    .end local v2    # "pin":Ljava/lang/String;
    :cond_76
    return-object p0
.end method

.method public build()Lokhttp3/CertificatePinner;
    .registers 3

    .prologue
    .line 287
    new-instance v0, Lokhttp3/CertificatePinner;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lokhttp3/CertificatePinner;-><init>(Lokhttp3/CertificatePinner$Builder;Lokhttp3/CertificatePinner$1;)V

    return-object v0
.end method

.method public trustRootIndex(Lokhttp3/internal/tls/TrustRootIndex;)Lokhttp3/CertificatePinner$Builder;
    .registers 2
    .param p1, "trustRootIndex"    # Lokhttp3/internal/tls/TrustRootIndex;

    .prologue
    .line 252
    iput-object p1, p0, Lokhttp3/CertificatePinner$Builder;->trustRootIndex:Lokhttp3/internal/tls/TrustRootIndex;

    .line 253
    return-object p0
.end method
