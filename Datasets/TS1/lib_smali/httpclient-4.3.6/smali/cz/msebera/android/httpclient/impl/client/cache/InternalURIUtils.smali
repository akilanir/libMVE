.class Lcz/msebera/android/httpclient/impl/client/cache/InternalURIUtils;
.super Ljava/lang/Object;
.source "InternalURIUtils.java"


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/Immutable;
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    return-void
.end method

.method public static rewriteURIForRoute(Ljava/net/URI;Lcz/msebera/android/httpclient/conn/routing/RouteInfo;)Ljava/net/URI;
    .registers 6
    .param p0, "uri"    # Ljava/net/URI;
    .param p1, "route"    # Lcz/msebera/android/httpclient/conn/routing/RouteInfo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    const/4 v3, 0x1

    .line 41
    if-nez p0, :cond_5

    .line 57
    :goto_4
    return-object v1

    .line 44
    :cond_5
    invoke-interface {p1}, Lcz/msebera/android/httpclient/conn/routing/RouteInfo;->getProxyHost()Lcz/msebera/android/httpclient/HttpHost;

    move-result-object v2

    if-eqz v2, :cond_25

    invoke-interface {p1}, Lcz/msebera/android/httpclient/conn/routing/RouteInfo;->isTunnelled()Z

    move-result v2

    if-nez v2, :cond_25

    .line 46
    invoke-virtual {p0}, Ljava/net/URI;->isAbsolute()Z

    move-result v1

    if-nez v1, :cond_20

    .line 47
    invoke-interface {p1}, Lcz/msebera/android/httpclient/conn/routing/RouteInfo;->getTargetHost()Lcz/msebera/android/httpclient/HttpHost;

    move-result-object v0

    .line 48
    .local v0, "target":Lcz/msebera/android/httpclient/HttpHost;
    invoke-static {p0, v0, v3}, Lcz/msebera/android/httpclient/client/utils/URIUtils;->rewriteURI(Ljava/net/URI;Lcz/msebera/android/httpclient/HttpHost;Z)Ljava/net/URI;

    move-result-object v1

    goto :goto_4

    .line 50
    .end local v0    # "target":Lcz/msebera/android/httpclient/HttpHost;
    :cond_20
    invoke-static {p0}, Lcz/msebera/android/httpclient/client/utils/URIUtils;->rewriteURI(Ljava/net/URI;)Ljava/net/URI;

    move-result-object v1

    goto :goto_4

    .line 54
    :cond_25
    invoke-virtual {p0}, Ljava/net/URI;->isAbsolute()Z

    move-result v2

    if-eqz v2, :cond_30

    .line 55
    invoke-static {p0, v1, v3}, Lcz/msebera/android/httpclient/client/utils/URIUtils;->rewriteURI(Ljava/net/URI;Lcz/msebera/android/httpclient/HttpHost;Z)Ljava/net/URI;

    move-result-object v1

    goto :goto_4

    .line 57
    :cond_30
    invoke-static {p0}, Lcz/msebera/android/httpclient/client/utils/URIUtils;->rewriteURI(Ljava/net/URI;)Ljava/net/URI;

    move-result-object v1

    goto :goto_4
.end method
