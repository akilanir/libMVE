.class final Lcom/koushikdutta/async/AsyncSSLSocketWrapper$1;
.super Ljava/lang/Object;
.source "AsyncSSLSocketWrapper.java"

# interfaces
.implements Ljavax/net/ssl/X509TrustManager;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/koushikdutta/async/AsyncSSLSocketWrapper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public checkClientTrusted([Ljava/security/cert/X509Certificate;Ljava/lang/String;)V
    .registers 3
    .param p1, "certs"    # [Ljava/security/cert/X509Certificate;
    .param p2, "authType"    # Ljava/lang/String;

    .prologue
    .line 74
    return-void
.end method

.method public checkServerTrusted([Ljava/security/cert/X509Certificate;Ljava/lang/String;)V
    .registers 9
    .param p1, "certs"    # [Ljava/security/cert/X509Certificate;
    .param p2, "authType"    # Ljava/lang/String;

    .prologue
    .line 77
    move-object v0, p1

    .local v0, "arr$":[Ljava/security/cert/X509Certificate;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_3
    if-ge v2, v3, :cond_1b

    aget-object v1, v0, v2

    .line 78
    .local v1, "cert":Ljava/security/cert/X509Certificate;
    if-eqz v1, :cond_18

    invoke-virtual {v1}, Ljava/security/cert/X509Certificate;->getCriticalExtensionOIDs()Ljava/util/Set;

    move-result-object v4

    if-eqz v4, :cond_18

    .line 79
    invoke-virtual {v1}, Ljava/security/cert/X509Certificate;->getCriticalExtensionOIDs()Ljava/util/Set;

    move-result-object v4

    const-string v5, "2.5.29.15"

    invoke-interface {v4, v5}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 77
    :cond_18
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 81
    .end local v1    # "cert":Ljava/security/cert/X509Certificate;
    :cond_1b
    return-void
.end method

.method public getAcceptedIssuers()[Ljava/security/cert/X509Certificate;
    .registers 2

    .prologue
    .line 70
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/security/cert/X509Certificate;

    return-object v0
.end method
