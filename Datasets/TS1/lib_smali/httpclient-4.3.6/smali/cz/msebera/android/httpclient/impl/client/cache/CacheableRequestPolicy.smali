.class Lcz/msebera/android/httpclient/impl/client/cache/CacheableRequestPolicy;
.super Ljava/lang/Object;
.source "CacheableRequestPolicy.java"


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/Immutable;
.end annotation


# instance fields
.field public log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;


# direct methods
.method constructor <init>()V
    .registers 3

    .prologue
    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    new-instance v0, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-direct {v0, v1}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CacheableRequestPolicy;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    return-void
.end method


# virtual methods
.method public isServableFromCache(Lcz/msebera/android/httpclient/HttpRequest;)Z
    .registers 15
    .param p1, "request"    # Lcz/msebera/android/httpclient/HttpRequest;

    .prologue
    const/4 v5, 0x0

    .line 57
    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpRequest;->getRequestLine()Lcz/msebera/android/httpclient/RequestLine;

    move-result-object v6

    invoke-interface {v6}, Lcz/msebera/android/httpclient/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object v3

    .line 59
    .local v3, "method":Ljava/lang/String;
    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpRequest;->getRequestLine()Lcz/msebera/android/httpclient/RequestLine;

    move-result-object v6

    invoke-interface {v6}, Lcz/msebera/android/httpclient/RequestLine;->getProtocolVersion()Lcz/msebera/android/httpclient/ProtocolVersion;

    move-result-object v4

    .line 60
    .local v4, "pv":Lcz/msebera/android/httpclient/ProtocolVersion;
    sget-object v6, Lcz/msebera/android/httpclient/HttpVersion;->HTTP_1_1:Lcz/msebera/android/httpclient/HttpVersion;

    invoke-virtual {v6, v4}, Lcz/msebera/android/httpclient/HttpVersion;->compareToVersion(Lcz/msebera/android/httpclient/ProtocolVersion;)I

    move-result v6

    if-eqz v6, :cond_21

    .line 61
    iget-object v6, p0, Lcz/msebera/android/httpclient/impl/client/cache/CacheableRequestPolicy;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v7, "non-HTTP/1.1 request was not serveable from cache"

    invoke-virtual {v6, v7}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->trace(Ljava/lang/Object;)V

    .line 93
    :goto_20
    return v5

    .line 65
    :cond_21
    const-string v6, "GET"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_31

    .line 66
    iget-object v6, p0, Lcz/msebera/android/httpclient/impl/client/cache/CacheableRequestPolicy;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v7, "non-GET request was not serveable from cache"

    invoke-virtual {v6, v7}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->trace(Ljava/lang/Object;)V

    goto :goto_20

    .line 70
    :cond_31
    const-string v6, "Pragma"

    invoke-interface {p1, v6}, Lcz/msebera/android/httpclient/HttpRequest;->getHeaders(Ljava/lang/String;)[Lcz/msebera/android/httpclient/Header;

    move-result-object v6

    array-length v6, v6

    if-lez v6, :cond_42

    .line 71
    iget-object v6, p0, Lcz/msebera/android/httpclient/impl/client/cache/CacheableRequestPolicy;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v7, "request with Pragma header was not serveable from cache"

    invoke-virtual {v6, v7}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->trace(Ljava/lang/Object;)V

    goto :goto_20

    .line 75
    :cond_42
    const-string v6, "Cache-Control"

    invoke-interface {p1, v6}, Lcz/msebera/android/httpclient/HttpRequest;->getHeaders(Ljava/lang/String;)[Lcz/msebera/android/httpclient/Header;

    move-result-object v2

    .line 76
    .local v2, "cacheControlHeaders":[Lcz/msebera/android/httpclient/Header;
    array-length v8, v2

    move v7, v5

    :goto_4a
    if-ge v7, v8, :cond_87

    aget-object v0, v2, v7

    .line 77
    .local v0, "cacheControl":Lcz/msebera/android/httpclient/Header;
    invoke-interface {v0}, Lcz/msebera/android/httpclient/Header;->getElements()[Lcz/msebera/android/httpclient/HeaderElement;

    move-result-object v9

    array-length v10, v9

    move v6, v5

    :goto_54
    if-ge v6, v10, :cond_83

    aget-object v1, v9, v6

    .line 78
    .local v1, "cacheControlElement":Lcz/msebera/android/httpclient/HeaderElement;
    const-string v11, "no-store"

    .line 79
    invoke-interface {v1}, Lcz/msebera/android/httpclient/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v12

    .line 78
    invoke-virtual {v11, v12}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_6c

    .line 80
    iget-object v6, p0, Lcz/msebera/android/httpclient/impl/client/cache/CacheableRequestPolicy;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v7, "Request with no-store was not serveable from cache"

    invoke-virtual {v6, v7}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->trace(Ljava/lang/Object;)V

    goto :goto_20

    .line 84
    :cond_6c
    const-string v11, "no-cache"

    .line 85
    invoke-interface {v1}, Lcz/msebera/android/httpclient/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v12

    .line 84
    invoke-virtual {v11, v12}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_80

    .line 86
    iget-object v6, p0, Lcz/msebera/android/httpclient/impl/client/cache/CacheableRequestPolicy;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v7, "Request with no-cache was not serveable from cache"

    invoke-virtual {v6, v7}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->trace(Ljava/lang/Object;)V

    goto :goto_20

    .line 77
    :cond_80
    add-int/lit8 v6, v6, 0x1

    goto :goto_54

    .line 76
    .end local v1    # "cacheControlElement":Lcz/msebera/android/httpclient/HeaderElement;
    :cond_83
    add-int/lit8 v6, v7, 0x1

    move v7, v6

    goto :goto_4a

    .line 92
    .end local v0    # "cacheControl":Lcz/msebera/android/httpclient/Header;
    :cond_87
    iget-object v5, p0, Lcz/msebera/android/httpclient/impl/client/cache/CacheableRequestPolicy;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v6, "Request was serveable from cache"

    invoke-virtual {v5, v6}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->trace(Ljava/lang/Object;)V

    .line 93
    const/4 v5, 0x1

    goto :goto_20
.end method
