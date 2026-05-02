.class Lcz/msebera/android/httpclient/impl/client/cache/CachedHttpResponseGenerator;
.super Ljava/lang/Object;
.source "CachedHttpResponseGenerator.java"


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/Immutable;
.end annotation


# instance fields
.field private final validityStrategy:Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 61
    new-instance v0, Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;

    invoke-direct {v0}, Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;-><init>()V

    invoke-direct {p0, v0}, Lcz/msebera/android/httpclient/impl/client/cache/CachedHttpResponseGenerator;-><init>(Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;)V

    .line 62
    return-void
.end method

.method constructor <init>(Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;)V
    .registers 2
    .param p1, "validityStrategy"    # Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;

    .prologue
    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachedHttpResponseGenerator;->validityStrategy:Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;

    .line 58
    return-void
.end method

.method private addMissingContentLengthHeader(Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/HttpEntity;)V
    .registers 7
    .param p1, "response"    # Lcz/msebera/android/httpclient/HttpResponse;
    .param p2, "entity"    # Lcz/msebera/android/httpclient/HttpEntity;

    .prologue
    .line 150
    invoke-direct {p0, p1}, Lcz/msebera/android/httpclient/impl/client/cache/CachedHttpResponseGenerator;->transferEncodingIsPresent(Lcz/msebera/android/httpclient/HttpResponse;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 160
    :cond_6
    :goto_6
    return-void

    .line 154
    :cond_7
    const-string v1, "Content-Length"

    invoke-interface {p1, v1}, Lcz/msebera/android/httpclient/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v0

    .line 155
    .local v0, "contentLength":Lcz/msebera/android/httpclient/Header;
    if-nez v0, :cond_6

    .line 156
    new-instance v0, Lcz/msebera/android/httpclient/message/BasicHeader;

    .end local v0    # "contentLength":Lcz/msebera/android/httpclient/Header;
    const-string v1, "Content-Length"

    .line 157
    invoke-interface {p2}, Lcz/msebera/android/httpclient/HttpEntity;->getContentLength()J

    move-result-wide v2

    .line 156
    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcz/msebera/android/httpclient/message/BasicHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 158
    .restart local v0    # "contentLength":Lcz/msebera/android/httpclient/Header;
    invoke-interface {p1, v0}, Lcz/msebera/android/httpclient/HttpResponse;->setHeader(Lcz/msebera/android/httpclient/Header;)V

    goto :goto_6
.end method

.method private transferEncodingIsPresent(Lcz/msebera/android/httpclient/HttpResponse;)Z
    .registers 4
    .param p1, "response"    # Lcz/msebera/android/httpclient/HttpResponse;

    .prologue
    .line 163
    const-string v1, "Transfer-Encoding"

    invoke-interface {p1, v1}, Lcz/msebera/android/httpclient/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v0

    .line 164
    .local v0, "hdr":Lcz/msebera/android/httpclient/Header;
    if-eqz v0, :cond_a

    const/4 v1, 0x1

    :goto_9
    return v1

    :cond_a
    const/4 v1, 0x0

    goto :goto_9
.end method


# virtual methods
.method generateNotModifiedResponse(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    .registers 12
    .param p1, "entry"    # Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;

    .prologue
    .line 103
    new-instance v5, Lcz/msebera/android/httpclient/message/BasicHttpResponse;

    sget-object v7, Lcz/msebera/android/httpclient/HttpVersion;->HTTP_1_1:Lcz/msebera/android/httpclient/HttpVersion;

    const/16 v8, 0x130

    const-string v9, "Not Modified"

    invoke-direct {v5, v7, v8, v9}, Lcz/msebera/android/httpclient/message/BasicHttpResponse;-><init>(Lcz/msebera/android/httpclient/ProtocolVersion;ILjava/lang/String;)V

    .line 110
    .local v5, "response":Lcz/msebera/android/httpclient/HttpResponse;
    const-string v7, "Date"

    invoke-virtual {p1, v7}, Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;->getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v2

    .line 111
    .local v2, "dateHeader":Lcz/msebera/android/httpclient/Header;
    if-nez v2, :cond_23

    .line 112
    new-instance v2, Lcz/msebera/android/httpclient/message/BasicHeader;

    .end local v2    # "dateHeader":Lcz/msebera/android/httpclient/Header;
    const-string v7, "Date"

    new-instance v8, Ljava/util/Date;

    invoke-direct {v8}, Ljava/util/Date;-><init>()V

    invoke-static {v8}, Lcz/msebera/android/httpclient/client/utils/DateUtils;->formatDate(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v2, v7, v8}, Lcz/msebera/android/httpclient/message/BasicHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    .restart local v2    # "dateHeader":Lcz/msebera/android/httpclient/Header;
    :cond_23
    invoke-interface {v5, v2}, Lcz/msebera/android/httpclient/HttpResponse;->addHeader(Lcz/msebera/android/httpclient/Header;)V

    .line 118
    const-string v7, "ETag"

    invoke-virtual {p1, v7}, Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;->getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v3

    .line 119
    .local v3, "etagHeader":Lcz/msebera/android/httpclient/Header;
    if-eqz v3, :cond_31

    .line 120
    invoke-interface {v5, v3}, Lcz/msebera/android/httpclient/HttpResponse;->addHeader(Lcz/msebera/android/httpclient/Header;)V

    .line 123
    :cond_31
    const-string v7, "Content-Location"

    invoke-virtual {p1, v7}, Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;->getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v1

    .line 124
    .local v1, "contentLocationHeader":Lcz/msebera/android/httpclient/Header;
    if-eqz v1, :cond_3c

    .line 125
    invoke-interface {v5, v1}, Lcz/msebera/android/httpclient/HttpResponse;->addHeader(Lcz/msebera/android/httpclient/Header;)V

    .line 131
    :cond_3c
    const-string v7, "Expires"

    invoke-virtual {p1, v7}, Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;->getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v4

    .line 132
    .local v4, "expiresHeader":Lcz/msebera/android/httpclient/Header;
    if-eqz v4, :cond_47

    .line 133
    invoke-interface {v5, v4}, Lcz/msebera/android/httpclient/HttpResponse;->addHeader(Lcz/msebera/android/httpclient/Header;)V

    .line 136
    :cond_47
    const-string v7, "Cache-Control"

    invoke-virtual {p1, v7}, Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;->getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v0

    .line 137
    .local v0, "cacheControlHeader":Lcz/msebera/android/httpclient/Header;
    if-eqz v0, :cond_52

    .line 138
    invoke-interface {v5, v0}, Lcz/msebera/android/httpclient/HttpResponse;->addHeader(Lcz/msebera/android/httpclient/Header;)V

    .line 141
    :cond_52
    const-string v7, "Vary"

    invoke-virtual {p1, v7}, Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;->getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v6

    .line 142
    .local v6, "varyHeader":Lcz/msebera/android/httpclient/Header;
    if-eqz v6, :cond_5d

    .line 143
    invoke-interface {v5, v6}, Lcz/msebera/android/httpclient/HttpResponse;->addHeader(Lcz/msebera/android/httpclient/Header;)V

    .line 146
    :cond_5d
    invoke-static {v5}, Lcz/msebera/android/httpclient/impl/client/cache/Proxies;->enhanceResponse(Lcz/msebera/android/httpclient/HttpResponse;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;

    move-result-object v7

    return-object v7
.end method

.method generateResponse(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    .registers 10
    .param p1, "entry"    # Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;

    .prologue
    .line 73
    new-instance v3, Ljava/util/Date;

    invoke-direct {v3}, Ljava/util/Date;-><init>()V

    .line 74
    .local v3, "now":Ljava/util/Date;
    new-instance v4, Lcz/msebera/android/httpclient/message/BasicHttpResponse;

    sget-object v5, Lcz/msebera/android/httpclient/HttpVersion;->HTTP_1_1:Lcz/msebera/android/httpclient/HttpVersion;

    .line 75
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;->getStatusCode()I

    move-result v6

    invoke-virtual {p1}, Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;->getReasonPhrase()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v4, v5, v6, v7}, Lcz/msebera/android/httpclient/message/BasicHttpResponse;-><init>(Lcz/msebera/android/httpclient/ProtocolVersion;ILjava/lang/String;)V

    .line 77
    .local v4, "response":Lcz/msebera/android/httpclient/HttpResponse;
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;->getAllHeaders()[Lcz/msebera/android/httpclient/Header;

    move-result-object v5

    invoke-interface {v4, v5}, Lcz/msebera/android/httpclient/HttpResponse;->setHeaders([Lcz/msebera/android/httpclient/Header;)V

    .line 79
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;->getResource()Lcz/msebera/android/httpclient/client/cache/Resource;

    move-result-object v5

    if-eqz v5, :cond_2c

    .line 80
    new-instance v2, Lcz/msebera/android/httpclient/impl/client/cache/CacheEntity;

    invoke-direct {v2, p1}, Lcz/msebera/android/httpclient/impl/client/cache/CacheEntity;-><init>(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)V

    .line 81
    .local v2, "entity":Lcz/msebera/android/httpclient/HttpEntity;
    invoke-direct {p0, v4, v2}, Lcz/msebera/android/httpclient/impl/client/cache/CachedHttpResponseGenerator;->addMissingContentLengthHeader(Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/HttpEntity;)V

    .line 82
    invoke-interface {v4, v2}, Lcz/msebera/android/httpclient/HttpResponse;->setEntity(Lcz/msebera/android/httpclient/HttpEntity;)V

    .line 85
    .end local v2    # "entity":Lcz/msebera/android/httpclient/HttpEntity;
    :cond_2c
    iget-object v5, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachedHttpResponseGenerator;->validityStrategy:Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;

    invoke-virtual {v5, p1, v3}, Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;->getCurrentAgeSecs(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;Ljava/util/Date;)J

    move-result-wide v0

    .line 86
    .local v0, "age":J
    const-wide/16 v5, 0x0

    cmp-long v5, v0, v5

    if-lez v5, :cond_46

    .line 87
    const-wide/32 v5, 0x7fffffff

    cmp-long v5, v0, v5

    if-ltz v5, :cond_4b

    .line 88
    const-string v5, "Age"

    const-string v6, "2147483648"

    invoke-interface {v4, v5, v6}, Lcz/msebera/android/httpclient/HttpResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    :cond_46
    :goto_46
    invoke-static {v4}, Lcz/msebera/android/httpclient/impl/client/cache/Proxies;->enhanceResponse(Lcz/msebera/android/httpclient/HttpResponse;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;

    move-result-object v5

    return-object v5

    .line 90
    :cond_4b
    const-string v5, "Age"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, ""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    long-to-int v7, v0

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v4, v5, v6}, Lcz/msebera/android/httpclient/HttpResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_46
.end method
