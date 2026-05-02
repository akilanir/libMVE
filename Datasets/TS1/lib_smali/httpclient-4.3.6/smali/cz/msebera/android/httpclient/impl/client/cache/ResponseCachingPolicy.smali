.class Lcz/msebera/android/httpclient/impl/client/cache/ResponseCachingPolicy;
.super Ljava/lang/Object;
.source "ResponseCachingPolicy.java"


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/Immutable;
.end annotation


# static fields
.field private static final AUTH_CACHEABLE_PARAMS:[Ljava/lang/String;

.field private static final cacheableStatuses:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

.field private final maxObjectSizeBytes:J

.field private final neverCache1_0ResponsesWithQueryString:Z

.field private final sharedCache:Z

.field private final uncacheableStatuses:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 7

    .prologue
    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 56
    new-array v0, v6, [Ljava/lang/String;

    const-string v1, "s-maxage"

    aput-object v1, v0, v3

    const-string v1, "must-revalidate"

    aput-object v1, v0, v4

    const-string v1, "public"

    aput-object v1, v0, v5

    sput-object v0, Lcz/msebera/android/httpclient/impl/client/cache/ResponseCachingPolicy;->AUTH_CACHEABLE_PARAMS:[Ljava/lang/String;

    .line 63
    new-instance v0, Ljava/util/HashSet;

    const/4 v1, 0x5

    new-array v1, v1, [Ljava/lang/Integer;

    const/16 v2, 0xc8

    .line 64
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v3

    const/16 v2, 0xcb

    .line 65
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v4

    const/16 v2, 0x12c

    .line 66
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v5

    const/16 v2, 0x12d

    .line 67
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v6

    const/4 v2, 0x4

    const/16 v3, 0x19a

    .line 68
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    .line 64
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    sput-object v0, Lcz/msebera/android/httpclient/impl/client/cache/ResponseCachingPolicy;->cacheableStatuses:Ljava/util/Set;

    .line 63
    return-void
.end method

.method public constructor <init>(JZZZ)V
    .registers 11
    .param p1, "maxObjectSizeBytes"    # J
    .param p3, "sharedCache"    # Z
    .param p4, "neverCache1_0ResponsesWithQueryString"    # Z
    .param p5, "allow303Caching"    # Z

    .prologue
    const/16 v2, 0xce

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 84
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    new-instance v0, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-direct {v0, v1}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/ResponseCachingPolicy;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    .line 85
    iput-wide p1, p0, Lcz/msebera/android/httpclient/impl/client/cache/ResponseCachingPolicy;->maxObjectSizeBytes:J

    .line 86
    iput-boolean p3, p0, Lcz/msebera/android/httpclient/impl/client/cache/ResponseCachingPolicy;->sharedCache:Z

    .line 87
    iput-boolean p4, p0, Lcz/msebera/android/httpclient/impl/client/cache/ResponseCachingPolicy;->neverCache1_0ResponsesWithQueryString:Z

    .line 88
    if-eqz p5, :cond_2e

    .line 89
    new-instance v0, Ljava/util/HashSet;

    new-array v1, v4, [Ljava/lang/Integer;

    .line 90
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/ResponseCachingPolicy;->uncacheableStatuses:Ljava/util/Set;

    .line 95
    :goto_2d
    return-void

    .line 92
    :cond_2e
    new-instance v0, Ljava/util/HashSet;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Integer;

    .line 93
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v3

    const/16 v2, 0x12f

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v4

    .line 92
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/ResponseCachingPolicy;->uncacheableStatuses:Ljava/util/Set;

    goto :goto_2d
.end method

.method private expiresHeaderLessOrEqualToDateHeaderAndNoCacheControl(Lcz/msebera/android/httpclient/HttpResponse;)Z
    .registers 8
    .param p1, "response"    # Lcz/msebera/android/httpclient/HttpResponse;

    .prologue
    const/4 v4, 0x0

    .line 276
    const-string v5, "Cache-Control"

    invoke-interface {p1, v5}, Lcz/msebera/android/httpclient/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v5

    if-eqz v5, :cond_a

    .line 289
    :cond_9
    :goto_9
    return v4

    .line 279
    :cond_a
    const-string v5, "Expires"

    invoke-interface {p1, v5}, Lcz/msebera/android/httpclient/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v3

    .line 280
    .local v3, "expiresHdr":Lcz/msebera/android/httpclient/Header;
    const-string v5, "Date"

    invoke-interface {p1, v5}, Lcz/msebera/android/httpclient/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v1

    .line 281
    .local v1, "dateHdr":Lcz/msebera/android/httpclient/Header;
    if-eqz v3, :cond_9

    if-eqz v1, :cond_9

    .line 284
    invoke-interface {v3}, Lcz/msebera/android/httpclient/Header;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcz/msebera/android/httpclient/client/utils/DateUtils;->parseDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v2

    .line 285
    .local v2, "expires":Ljava/util/Date;
    invoke-interface {v1}, Lcz/msebera/android/httpclient/Header;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcz/msebera/android/httpclient/client/utils/DateUtils;->parseDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    .line 286
    .local v0, "date":Ljava/util/Date;
    if-eqz v2, :cond_9

    if-eqz v0, :cond_9

    .line 289
    invoke-virtual {v2, v0}, Ljava/util/Date;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3a

    invoke-virtual {v2, v0}, Ljava/util/Date;->before(Ljava/util/Date;)Z

    move-result v5

    if-eqz v5, :cond_9

    :cond_3a
    const/4 v4, 0x1

    goto :goto_9
.end method

.method private from1_0Origin(Lcz/msebera/android/httpclient/HttpResponse;)Z
    .registers 8
    .param p1, "response"    # Lcz/msebera/android/httpclient/HttpResponse;

    .prologue
    const/4 v5, 0x0

    .line 293
    const-string v3, "Via"

    invoke-interface {p1, v3}, Lcz/msebera/android/httpclient/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v2

    .line 294
    .local v2, "via":Lcz/msebera/android/httpclient/Header;
    if-eqz v2, :cond_34

    .line 295
    invoke-interface {v2}, Lcz/msebera/android/httpclient/Header;->getElements()[Lcz/msebera/android/httpclient/HeaderElement;

    move-result-object v3

    array-length v4, v3

    if-ge v5, v4, :cond_34

    aget-object v0, v3, v5

    .line 296
    .local v0, "elt":Lcz/msebera/android/httpclient/HeaderElement;
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "\\s"

    invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    aget-object v1, v3, v5

    .line 297
    .local v1, "proto":Ljava/lang/String;
    const-string v3, "/"

    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_2d

    .line 298
    const-string v3, "HTTP/1.0"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    .line 304
    .end local v0    # "elt":Lcz/msebera/android/httpclient/HeaderElement;
    .end local v1    # "proto":Ljava/lang/String;
    :goto_2c
    return v3

    .line 300
    .restart local v0    # "elt":Lcz/msebera/android/httpclient/HeaderElement;
    .restart local v1    # "proto":Ljava/lang/String;
    :cond_2d
    const-string v3, "1.0"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    goto :goto_2c

    .line 304
    .end local v0    # "elt":Lcz/msebera/android/httpclient/HeaderElement;
    .end local v1    # "proto":Ljava/lang/String;
    :cond_34
    sget-object v3, Lcz/msebera/android/httpclient/HttpVersion;->HTTP_1_0:Lcz/msebera/android/httpclient/HttpVersion;

    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpResponse;->getProtocolVersion()Lcz/msebera/android/httpclient/ProtocolVersion;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcz/msebera/android/httpclient/HttpVersion;->equals(Ljava/lang/Object;)Z

    move-result v3

    goto :goto_2c
.end method

.method private requestProtocolGreaterThanAccepted(Lcz/msebera/android/httpclient/HttpRequest;)Z
    .registers 4
    .param p1, "req"    # Lcz/msebera/android/httpclient/HttpRequest;

    .prologue
    .line 308
    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpRequest;->getProtocolVersion()Lcz/msebera/android/httpclient/ProtocolVersion;

    move-result-object v0

    sget-object v1, Lcz/msebera/android/httpclient/HttpVersion;->HTTP_1_1:Lcz/msebera/android/httpclient/HttpVersion;

    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/ProtocolVersion;->compareToVersion(Lcz/msebera/android/httpclient/ProtocolVersion;)I

    move-result v0

    if-lez v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method private unknownStatusCode(I)Z
    .registers 4
    .param p1, "status"    # I

    .prologue
    const/4 v0, 0x0

    .line 171
    const/16 v1, 0x64

    if-lt p1, v1, :cond_a

    const/16 v1, 0x65

    if-gt p1, v1, :cond_a

    .line 186
    :cond_9
    :goto_9
    return v0

    .line 174
    :cond_a
    const/16 v1, 0xc8

    if-lt p1, v1, :cond_12

    const/16 v1, 0xce

    if-le p1, v1, :cond_9

    .line 177
    :cond_12
    const/16 v1, 0x12c

    if-lt p1, v1, :cond_1a

    const/16 v1, 0x133

    if-le p1, v1, :cond_9

    .line 180
    :cond_1a
    const/16 v1, 0x190

    if-lt p1, v1, :cond_22

    const/16 v1, 0x1a1

    if-le p1, v1, :cond_9

    .line 183
    :cond_22
    const/16 v1, 0x1f4

    if-lt p1, v1, :cond_2a

    const/16 v1, 0x1f9

    if-le p1, v1, :cond_9

    .line 186
    :cond_2a
    const/4 v0, 0x1

    goto :goto_9
.end method


# virtual methods
.method protected hasCacheControlParameterFrom(Lcz/msebera/android/httpclient/HttpMessage;[Ljava/lang/String;)Z
    .registers 16
    .param p1, "msg"    # Lcz/msebera/android/httpclient/HttpMessage;
    .param p2, "params"    # [Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 204
    const-string v5, "Cache-Control"

    invoke-interface {p1, v5}, Lcz/msebera/android/httpclient/HttpMessage;->getHeaders(Ljava/lang/String;)[Lcz/msebera/android/httpclient/Header;

    move-result-object v0

    .line 205
    .local v0, "cacheControlHeaders":[Lcz/msebera/android/httpclient/Header;
    array-length v8, v0

    move v7, v4

    :goto_9
    if-ge v7, v8, :cond_28

    aget-object v2, v0, v7

    .line 206
    .local v2, "header":Lcz/msebera/android/httpclient/Header;
    invoke-interface {v2}, Lcz/msebera/android/httpclient/Header;->getElements()[Lcz/msebera/android/httpclient/HeaderElement;

    move-result-object v9

    array-length v10, v9

    move v6, v4

    :goto_13
    if-ge v6, v10, :cond_30

    aget-object v1, v9, v6

    .line 207
    .local v1, "elem":Lcz/msebera/android/httpclient/HeaderElement;
    array-length v11, p2

    move v5, v4

    :goto_19
    if-ge v5, v11, :cond_2c

    aget-object v3, p2, v5

    .line 208
    .local v3, "param":Ljava/lang/String;
    invoke-interface {v1}, Lcz/msebera/android/httpclient/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v3, v12}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_29

    .line 209
    const/4 v4, 0x1

    .line 214
    .end local v1    # "elem":Lcz/msebera/android/httpclient/HeaderElement;
    .end local v2    # "header":Lcz/msebera/android/httpclient/Header;
    .end local v3    # "param":Ljava/lang/String;
    :cond_28
    return v4

    .line 207
    .restart local v1    # "elem":Lcz/msebera/android/httpclient/HeaderElement;
    .restart local v2    # "header":Lcz/msebera/android/httpclient/Header;
    .restart local v3    # "param":Ljava/lang/String;
    :cond_29
    add-int/lit8 v5, v5, 0x1

    goto :goto_19

    .line 206
    .end local v3    # "param":Ljava/lang/String;
    :cond_2c
    add-int/lit8 v5, v6, 0x1

    move v6, v5

    goto :goto_13

    .line 205
    .end local v1    # "elem":Lcz/msebera/android/httpclient/HeaderElement;
    :cond_30
    add-int/lit8 v5, v7, 0x1

    move v7, v5

    goto :goto_9
.end method

.method protected isExplicitlyCacheable(Lcz/msebera/android/httpclient/HttpResponse;)Z
    .registers 6
    .param p1, "response"    # Lcz/msebera/android/httpclient/HttpResponse;

    .prologue
    const/4 v1, 0x1

    .line 218
    const-string v2, "Expires"

    invoke-interface {p1, v2}, Lcz/msebera/android/httpclient/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v2

    if-eqz v2, :cond_a

    .line 226
    :goto_9
    return v1

    .line 221
    :cond_a
    const/4 v2, 0x5

    new-array v0, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "max-age"

    aput-object v3, v0, v2

    const-string v2, "s-maxage"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "must-revalidate"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "proxy-revalidate"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "public"

    aput-object v2, v0, v1

    .line 226
    .local v0, "cacheableParams":[Ljava/lang/String;
    invoke-virtual {p0, p1, v0}, Lcz/msebera/android/httpclient/impl/client/cache/ResponseCachingPolicy;->hasCacheControlParameterFrom(Lcz/msebera/android/httpclient/HttpMessage;[Ljava/lang/String;)Z

    move-result v1

    goto :goto_9
.end method

.method protected isExplicitlyNonCacheable(Lcz/msebera/android/httpclient/HttpResponse;)Z
    .registers 13
    .param p1, "response"    # Lcz/msebera/android/httpclient/HttpResponse;

    .prologue
    const/4 v3, 0x0

    .line 190
    const-string v4, "Cache-Control"

    invoke-interface {p1, v4}, Lcz/msebera/android/httpclient/HttpResponse;->getHeaders(Ljava/lang/String;)[Lcz/msebera/android/httpclient/Header;

    move-result-object v0

    .line 191
    .local v0, "cacheControlHeaders":[Lcz/msebera/android/httpclient/Header;
    array-length v6, v0

    move v5, v3

    :goto_9
    if-ge v5, v6, :cond_40

    aget-object v2, v0, v5

    .line 192
    .local v2, "header":Lcz/msebera/android/httpclient/Header;
    invoke-interface {v2}, Lcz/msebera/android/httpclient/Header;->getElements()[Lcz/msebera/android/httpclient/HeaderElement;

    move-result-object v7

    array-length v8, v7

    move v4, v3

    :goto_13
    if-ge v4, v8, :cond_44

    aget-object v1, v7, v4

    .line 193
    .local v1, "elem":Lcz/msebera/android/httpclient/HeaderElement;
    const-string v9, "no-store"

    invoke-interface {v1}, Lcz/msebera/android/httpclient/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_3f

    const-string v9, "no-cache"

    .line 194
    invoke-interface {v1}, Lcz/msebera/android/httpclient/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_3f

    iget-boolean v9, p0, Lcz/msebera/android/httpclient/impl/client/cache/ResponseCachingPolicy;->sharedCache:Z

    if-eqz v9, :cond_41

    const-string v9, "private"

    .line 195
    invoke-interface {v1}, Lcz/msebera/android/httpclient/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_41

    .line 196
    :cond_3f
    const/4 v3, 0x1

    .line 200
    .end local v1    # "elem":Lcz/msebera/android/httpclient/HeaderElement;
    .end local v2    # "header":Lcz/msebera/android/httpclient/Header;
    :cond_40
    return v3

    .line 192
    .restart local v1    # "elem":Lcz/msebera/android/httpclient/HeaderElement;
    .restart local v2    # "header":Lcz/msebera/android/httpclient/Header;
    :cond_41
    add-int/lit8 v4, v4, 0x1

    goto :goto_13

    .line 191
    .end local v1    # "elem":Lcz/msebera/android/httpclient/HeaderElement;
    :cond_44
    add-int/lit8 v4, v5, 0x1

    move v5, v4

    goto :goto_9
.end method

.method public isResponseCacheable(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/HttpResponse;)Z
    .registers 9
    .param p1, "request"    # Lcz/msebera/android/httpclient/HttpRequest;
    .param p2, "response"    # Lcz/msebera/android/httpclient/HttpResponse;

    .prologue
    const/4 v3, 0x0

    .line 238
    invoke-direct {p0, p1}, Lcz/msebera/android/httpclient/impl/client/cache/ResponseCachingPolicy;->requestProtocolGreaterThanAccepted(Lcz/msebera/android/httpclient/HttpRequest;)Z

    move-result v4

    if-eqz v4, :cond_f

    .line 239
    iget-object v4, p0, Lcz/msebera/android/httpclient/impl/client/cache/ResponseCachingPolicy;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v5, "Response was not cacheable."

    invoke-virtual {v4, v5}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 271
    :cond_e
    :goto_e
    return v3

    .line 243
    :cond_f
    const/4 v4, 0x1

    new-array v2, v4, [Ljava/lang/String;

    const-string v4, "no-store"

    aput-object v4, v2, v3

    .line 244
    .local v2, "uncacheableRequestDirectives":[Ljava/lang/String;
    invoke-virtual {p0, p1, v2}, Lcz/msebera/android/httpclient/impl/client/cache/ResponseCachingPolicy;->hasCacheControlParameterFrom(Lcz/msebera/android/httpclient/HttpMessage;[Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_e

    .line 248
    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpRequest;->getRequestLine()Lcz/msebera/android/httpclient/RequestLine;

    move-result-object v4

    invoke-interface {v4}, Lcz/msebera/android/httpclient/RequestLine;->getUri()Ljava/lang/String;

    move-result-object v4

    const-string v5, "?"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_4c

    .line 249
    iget-boolean v4, p0, Lcz/msebera/android/httpclient/impl/client/cache/ResponseCachingPolicy;->neverCache1_0ResponsesWithQueryString:Z

    if-eqz v4, :cond_3e

    invoke-direct {p0, p2}, Lcz/msebera/android/httpclient/impl/client/cache/ResponseCachingPolicy;->from1_0Origin(Lcz/msebera/android/httpclient/HttpResponse;)Z

    move-result v4

    if-eqz v4, :cond_3e

    .line 250
    iget-object v4, p0, Lcz/msebera/android/httpclient/impl/client/cache/ResponseCachingPolicy;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v5, "Response was not cacheable as it had a query string."

    invoke-virtual {v4, v5}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    goto :goto_e

    .line 252
    :cond_3e
    invoke-virtual {p0, p2}, Lcz/msebera/android/httpclient/impl/client/cache/ResponseCachingPolicy;->isExplicitlyCacheable(Lcz/msebera/android/httpclient/HttpResponse;)Z

    move-result v4

    if-nez v4, :cond_4c

    .line 253
    iget-object v4, p0, Lcz/msebera/android/httpclient/impl/client/cache/ResponseCachingPolicy;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v5, "Response was not cacheable as it is missing explicit caching headers."

    invoke-virtual {v4, v5}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    goto :goto_e

    .line 258
    :cond_4c
    invoke-direct {p0, p2}, Lcz/msebera/android/httpclient/impl/client/cache/ResponseCachingPolicy;->expiresHeaderLessOrEqualToDateHeaderAndNoCacheControl(Lcz/msebera/android/httpclient/HttpResponse;)Z

    move-result v4

    if-nez v4, :cond_e

    .line 262
    iget-boolean v4, p0, Lcz/msebera/android/httpclient/impl/client/cache/ResponseCachingPolicy;->sharedCache:Z

    if-eqz v4, :cond_69

    .line 263
    const-string v4, "Authorization"

    invoke-interface {p1, v4}, Lcz/msebera/android/httpclient/HttpRequest;->getHeaders(Ljava/lang/String;)[Lcz/msebera/android/httpclient/Header;

    move-result-object v0

    .line 264
    .local v0, "authNHeaders":[Lcz/msebera/android/httpclient/Header;
    if-eqz v0, :cond_69

    array-length v4, v0

    if-lez v4, :cond_69

    sget-object v4, Lcz/msebera/android/httpclient/impl/client/cache/ResponseCachingPolicy;->AUTH_CACHEABLE_PARAMS:[Ljava/lang/String;

    .line 265
    invoke-virtual {p0, p2, v4}, Lcz/msebera/android/httpclient/impl/client/cache/ResponseCachingPolicy;->hasCacheControlParameterFrom(Lcz/msebera/android/httpclient/HttpMessage;[Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_e

    .line 270
    .end local v0    # "authNHeaders":[Lcz/msebera/android/httpclient/Header;
    :cond_69
    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpRequest;->getRequestLine()Lcz/msebera/android/httpclient/RequestLine;

    move-result-object v3

    invoke-interface {v3}, Lcz/msebera/android/httpclient/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object v1

    .line 271
    .local v1, "method":Ljava/lang/String;
    invoke-virtual {p0, v1, p2}, Lcz/msebera/android/httpclient/impl/client/cache/ResponseCachingPolicy;->isResponseCacheable(Ljava/lang/String;Lcz/msebera/android/httpclient/HttpResponse;)Z

    move-result v3

    goto :goto_e
.end method

.method public isResponseCacheable(Ljava/lang/String;Lcz/msebera/android/httpclient/HttpResponse;)Z
    .registers 23
    .param p1, "httpMethod"    # Ljava/lang/String;
    .param p2, "response"    # Lcz/msebera/android/httpclient/HttpResponse;

    .prologue
    .line 105
    const/4 v3, 0x0

    .line 107
    .local v3, "cacheable":Z
    const-string v12, "GET"

    move-object/from16 v0, p1

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_16

    .line 108
    move-object/from16 v0, p0

    iget-object v12, v0, Lcz/msebera/android/httpclient/impl/client/cache/ResponseCachingPolicy;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v13, "Response was not cacheable."

    invoke-virtual {v12, v13}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 109
    const/4 v12, 0x0

    .line 167
    :goto_15
    return v12

    .line 112
    :cond_16
    invoke-interface/range {p2 .. p2}, Lcz/msebera/android/httpclient/HttpResponse;->getStatusLine()Lcz/msebera/android/httpclient/StatusLine;

    move-result-object v12

    invoke-interface {v12}, Lcz/msebera/android/httpclient/StatusLine;->getStatusCode()I

    move-result v10

    .line 113
    .local v10, "status":I
    sget-object v12, Lcz/msebera/android/httpclient/impl/client/cache/ResponseCachingPolicy;->cacheableStatuses:Ljava/util/Set;

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-interface {v12, v13}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_48

    .line 115
    const/4 v3, 0x1

    .line 124
    :cond_2b
    const-string v12, "Content-Length"

    move-object/from16 v0, p2

    invoke-interface {v0, v12}, Lcz/msebera/android/httpclient/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v4

    .line 125
    .local v4, "contentLength":Lcz/msebera/android/httpclient/Header;
    if-eqz v4, :cond_62

    .line 126
    invoke-interface {v4}, Lcz/msebera/android/httpclient/Header;->getValue()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    .line 127
    .local v5, "contentLengthValue":I
    int-to-long v12, v5

    move-object/from16 v0, p0

    iget-wide v14, v0, Lcz/msebera/android/httpclient/impl/client/cache/ResponseCachingPolicy;->maxObjectSizeBytes:J

    cmp-long v12, v12, v14

    if-lez v12, :cond_62

    .line 128
    const/4 v12, 0x0

    goto :goto_15

    .line 116
    .end local v4    # "contentLength":Lcz/msebera/android/httpclient/Header;
    .end local v5    # "contentLengthValue":I
    :cond_48
    move-object/from16 v0, p0

    iget-object v12, v0, Lcz/msebera/android/httpclient/impl/client/cache/ResponseCachingPolicy;->uncacheableStatuses:Ljava/util/Set;

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-interface {v12, v13}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_58

    .line 117
    const/4 v12, 0x0

    goto :goto_15

    .line 118
    :cond_58
    move-object/from16 v0, p0

    invoke-direct {v0, v10}, Lcz/msebera/android/httpclient/impl/client/cache/ResponseCachingPolicy;->unknownStatusCode(I)Z

    move-result v12

    if-eqz v12, :cond_2b

    .line 121
    const/4 v12, 0x0

    goto :goto_15

    .line 132
    .restart local v4    # "contentLength":Lcz/msebera/android/httpclient/Header;
    :cond_62
    const-string v12, "Age"

    move-object/from16 v0, p2

    invoke-interface {v0, v12}, Lcz/msebera/android/httpclient/HttpResponse;->getHeaders(Ljava/lang/String;)[Lcz/msebera/android/httpclient/Header;

    move-result-object v2

    .line 134
    .local v2, "ageHeaders":[Lcz/msebera/android/httpclient/Header;
    array-length v12, v2

    const/4 v13, 0x1

    if-le v12, v13, :cond_70

    .line 135
    const/4 v12, 0x0

    goto :goto_15

    .line 138
    :cond_70
    const-string v12, "Expires"

    move-object/from16 v0, p2

    invoke-interface {v0, v12}, Lcz/msebera/android/httpclient/HttpResponse;->getHeaders(Ljava/lang/String;)[Lcz/msebera/android/httpclient/Header;

    move-result-object v9

    .line 140
    .local v9, "expiresHeaders":[Lcz/msebera/android/httpclient/Header;
    array-length v12, v9

    const/4 v13, 0x1

    if-le v12, v13, :cond_7e

    .line 141
    const/4 v12, 0x0

    goto :goto_15

    .line 144
    :cond_7e
    const-string v12, "Date"

    move-object/from16 v0, p2

    invoke-interface {v0, v12}, Lcz/msebera/android/httpclient/HttpResponse;->getHeaders(Ljava/lang/String;)[Lcz/msebera/android/httpclient/Header;

    move-result-object v7

    .line 146
    .local v7, "dateHeaders":[Lcz/msebera/android/httpclient/Header;
    array-length v12, v7

    const/4 v13, 0x1

    if-eq v12, v13, :cond_8c

    .line 147
    const/4 v12, 0x0

    goto :goto_15

    .line 150
    :cond_8c
    const/4 v12, 0x0

    aget-object v12, v7, v12

    invoke-interface {v12}, Lcz/msebera/android/httpclient/Header;->getValue()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Lcz/msebera/android/httpclient/client/utils/DateUtils;->parseDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v6

    .line 151
    .local v6, "date":Ljava/util/Date;
    if-nez v6, :cond_9c

    .line 152
    const/4 v12, 0x0

    goto/16 :goto_15

    .line 155
    :cond_9c
    const-string v12, "Vary"

    move-object/from16 v0, p2

    invoke-interface {v0, v12}, Lcz/msebera/android/httpclient/HttpResponse;->getHeaders(Ljava/lang/String;)[Lcz/msebera/android/httpclient/Header;

    move-result-object v14

    array-length v15, v14

    const/4 v12, 0x0

    move v13, v12

    :goto_a7
    if-ge v13, v15, :cond_d1

    aget-object v11, v14, v13

    .line 156
    .local v11, "varyHdr":Lcz/msebera/android/httpclient/Header;
    invoke-interface {v11}, Lcz/msebera/android/httpclient/Header;->getElements()[Lcz/msebera/android/httpclient/HeaderElement;

    move-result-object v16

    move-object/from16 v0, v16

    array-length v0, v0

    move/from16 v17, v0

    const/4 v12, 0x0

    :goto_b5
    move/from16 v0, v17

    if-ge v12, v0, :cond_cd

    aget-object v8, v16, v12

    .line 157
    .local v8, "elem":Lcz/msebera/android/httpclient/HeaderElement;
    const-string v18, "*"

    invoke-interface {v8}, Lcz/msebera/android/httpclient/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_ca

    .line 158
    const/4 v12, 0x0

    goto/16 :goto_15

    .line 156
    :cond_ca
    add-int/lit8 v12, v12, 0x1

    goto :goto_b5

    .line 155
    .end local v8    # "elem":Lcz/msebera/android/httpclient/HeaderElement;
    :cond_cd
    add-int/lit8 v12, v13, 0x1

    move v13, v12

    goto :goto_a7

    .line 163
    .end local v11    # "varyHdr":Lcz/msebera/android/httpclient/Header;
    :cond_d1
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/impl/client/cache/ResponseCachingPolicy;->isExplicitlyNonCacheable(Lcz/msebera/android/httpclient/HttpResponse;)Z

    move-result v12

    if-eqz v12, :cond_de

    .line 164
    const/4 v12, 0x0

    goto/16 :goto_15

    .line 167
    :cond_de
    if-nez v3, :cond_ea

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/impl/client/cache/ResponseCachingPolicy;->isExplicitlyCacheable(Lcz/msebera/android/httpclient/HttpResponse;)Z

    move-result v12

    if-eqz v12, :cond_ed

    :cond_ea
    const/4 v12, 0x1

    goto/16 :goto_15

    :cond_ed
    const/4 v12, 0x0

    goto/16 :goto_15
.end method
