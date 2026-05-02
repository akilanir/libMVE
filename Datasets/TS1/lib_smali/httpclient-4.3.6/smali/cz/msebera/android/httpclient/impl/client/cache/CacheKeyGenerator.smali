.class Lcz/msebera/android/httpclient/impl/client/cache/CacheKeyGenerator;
.super Ljava/lang/Object;
.source "CacheKeyGenerator.java"


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/Immutable;
.end annotation


# static fields
.field private static final BASE_URI:Ljava/net/URI;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 54
    const-string v0, "http://example.com/"

    invoke-static {v0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v0

    sput-object v0, Lcz/msebera/android/httpclient/impl/client/cache/CacheKeyGenerator;->BASE_URI:Ljava/net/URI;

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private canonicalizePort(ILjava/lang/String;)I
    .registers 5
    .param p1, "port"    # I
    .param p2, "protocol"    # Ljava/lang/String;

    .prologue
    const/4 v1, -0x1

    .line 91
    if-ne p1, v1, :cond_e

    const-string v0, "http"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 92
    const/16 p1, 0x50

    .line 96
    .end local p1    # "port":I
    :cond_d
    :goto_d
    return p1

    .line 93
    .restart local p1    # "port":I
    :cond_e
    if-ne p1, v1, :cond_d

    const-string v0, "https"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 94
    const/16 p1, 0x1bb

    goto :goto_d
.end method

.method private isRelativeRequest(Lcz/msebera/android/httpclient/HttpRequest;)Z
    .registers 4
    .param p1, "req"    # Lcz/msebera/android/httpclient/HttpRequest;

    .prologue
    .line 100
    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpRequest;->getRequestLine()Lcz/msebera/android/httpclient/RequestLine;

    move-result-object v1

    invoke-interface {v1}, Lcz/msebera/android/httpclient/RequestLine;->getUri()Ljava/lang/String;

    move-result-object v0

    .line 101
    .local v0, "requestUri":Ljava/lang/String;
    const-string v1, "*"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_18

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1a

    :cond_18
    const/4 v1, 0x1

    :goto_19
    return v1

    :cond_1a
    const/4 v1, 0x0

    goto :goto_19
.end method


# virtual methods
.method public canonicalizeUri(Ljava/lang/String;)Ljava/lang/String;
    .registers 14
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 73
    :try_start_0
    sget-object v10, Lcz/msebera/android/httpclient/impl/client/cache/CacheKeyGenerator;->BASE_URI:Ljava/net/URI;

    invoke-static {v10, p1}, Lcz/msebera/android/httpclient/client/utils/URIUtils;->resolve(Ljava/net/URI;Ljava/lang/String;)Ljava/net/URI;

    move-result-object v3

    .line 74
    .local v3, "normalized":Ljava/net/URI;
    new-instance v9, Ljava/net/URL;

    invoke-virtual {v3}, Ljava/net/URI;->toASCIIString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 75
    .local v9, "u":Ljava/net/URL;
    invoke-virtual {v9}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v7

    .line 76
    .local v7, "protocol":Ljava/lang/String;
    invoke-virtual {v9}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v2

    .line 77
    .local v2, "hostname":Ljava/lang/String;
    invoke-virtual {v9}, Ljava/net/URL;->getPort()I

    move-result v10

    invoke-direct {p0, v10, v7}, Lcz/msebera/android/httpclient/impl/client/cache/CacheKeyGenerator;->canonicalizePort(ILjava/lang/String;)I

    move-result v6

    .line 78
    .local v6, "port":I
    invoke-virtual {v9}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v5

    .line 79
    .local v5, "path":Ljava/lang/String;
    invoke-virtual {v9}, Ljava/net/URL;->getQuery()Ljava/lang/String;

    move-result-object v8

    .line 80
    .local v8, "query":Ljava/lang/String;
    if-eqz v8, :cond_4a

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "?"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 81
    .local v1, "file":Ljava/lang/String;
    :goto_40
    new-instance v4, Ljava/net/URL;

    invoke-direct {v4, v7, v2, v6, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    .line 82
    .local v4, "out":Ljava/net/URL;
    invoke-virtual {v4}, Ljava/net/URL;->toString()Ljava/lang/String;
    :try_end_48
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_48} :catch_4c
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_48} :catch_4e

    move-result-object p1

    .line 86
    .end local v1    # "file":Ljava/lang/String;
    .end local v2    # "hostname":Ljava/lang/String;
    .end local v3    # "normalized":Ljava/net/URI;
    .end local v4    # "out":Ljava/net/URL;
    .end local v5    # "path":Ljava/lang/String;
    .end local v6    # "port":I
    .end local v7    # "protocol":Ljava/lang/String;
    .end local v8    # "query":Ljava/lang/String;
    .end local v9    # "u":Ljava/net/URL;
    .end local p1    # "uri":Ljava/lang/String;
    :goto_49
    return-object p1

    .restart local v2    # "hostname":Ljava/lang/String;
    .restart local v3    # "normalized":Ljava/net/URI;
    .restart local v5    # "path":Ljava/lang/String;
    .restart local v6    # "port":I
    .restart local v7    # "protocol":Ljava/lang/String;
    .restart local v8    # "query":Ljava/lang/String;
    .restart local v9    # "u":Ljava/net/URL;
    .restart local p1    # "uri":Ljava/lang/String;
    :cond_4a
    move-object v1, v5

    .line 80
    goto :goto_40

    .line 83
    .end local v2    # "hostname":Ljava/lang/String;
    .end local v3    # "normalized":Ljava/net/URI;
    .end local v5    # "path":Ljava/lang/String;
    .end local v6    # "port":I
    .end local v7    # "protocol":Ljava/lang/String;
    .end local v8    # "query":Ljava/lang/String;
    .end local v9    # "u":Ljava/net/URL;
    :catch_4c
    move-exception v0

    .line 84
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    goto :goto_49

    .line 85
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :catch_4e
    move-exception v0

    .line 86
    .local v0, "e":Ljava/net/MalformedURLException;
    goto :goto_49
.end method

.method protected getFullHeaderValue([Lcz/msebera/android/httpclient/Header;)Ljava/lang/String;
    .registers 8
    .param p1, "headers"    # [Lcz/msebera/android/httpclient/Header;

    .prologue
    .line 105
    if-nez p1, :cond_5

    .line 106
    const-string v3, ""

    .line 119
    :goto_4
    return-object v3

    .line 109
    :cond_5
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v3, ""

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 110
    .local v0, "buf":Ljava/lang/StringBuilder;
    const/4 v1, 0x1

    .line 111
    .local v1, "first":Z
    array-length v4, p1

    const/4 v3, 0x0

    :goto_f
    if-ge v3, v4, :cond_29

    aget-object v2, p1, v3

    .line 112
    .local v2, "hdr":Lcz/msebera/android/httpclient/Header;
    if-nez v1, :cond_1a

    .line 113
    const-string v5, ", "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    :cond_1a
    invoke-interface {v2}, Lcz/msebera/android/httpclient/Header;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    const/4 v1, 0x0

    .line 111
    add-int/lit8 v3, v3, 0x1

    goto :goto_f

    .line 119
    .end local v2    # "hdr":Lcz/msebera/android/httpclient/Header;
    :cond_29
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_4
.end method

.method public getURI(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpRequest;)Ljava/lang/String;
    .registers 7
    .param p1, "host"    # Lcz/msebera/android/httpclient/HttpHost;
    .param p2, "req"    # Lcz/msebera/android/httpclient/HttpRequest;

    .prologue
    .line 65
    invoke-direct {p0, p2}, Lcz/msebera/android/httpclient/impl/client/cache/CacheKeyGenerator;->isRelativeRequest(Lcz/msebera/android/httpclient/HttpRequest;)Z

    move-result v0

    if-eqz v0, :cond_26

    .line 66
    const-string v0, "%s%s"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {p1}, Lcz/msebera/android/httpclient/HttpHost;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-interface {p2}, Lcz/msebera/android/httpclient/HttpRequest;->getRequestLine()Lcz/msebera/android/httpclient/RequestLine;

    move-result-object v3

    invoke-interface {v3}, Lcz/msebera/android/httpclient/RequestLine;->getUri()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcz/msebera/android/httpclient/impl/client/cache/CacheKeyGenerator;->canonicalizeUri(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 68
    :goto_25
    return-object v0

    :cond_26
    invoke-interface {p2}, Lcz/msebera/android/httpclient/HttpRequest;->getRequestLine()Lcz/msebera/android/httpclient/RequestLine;

    move-result-object v0

    invoke-interface {v0}, Lcz/msebera/android/httpclient/RequestLine;->getUri()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcz/msebera/android/httpclient/impl/client/cache/CacheKeyGenerator;->canonicalizeUri(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_25
.end method

.method public getVariantKey(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)Ljava/lang/String;
    .registers 18
    .param p1, "req"    # Lcz/msebera/android/httpclient/HttpRequest;
    .param p2, "entry"    # Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;

    .prologue
    .line 149
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 150
    .local v6, "variantHeaderNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v8, "Vary"

    move-object/from16 v0, p2

    invoke-virtual {v0, v8}, Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;->getHeaders(Ljava/lang/String;)[Lcz/msebera/android/httpclient/Header;

    move-result-object v10

    array-length v11, v10

    const/4 v8, 0x0

    move v9, v8

    :goto_10
    if-ge v9, v11, :cond_2c

    aget-object v7, v10, v9

    .line 151
    .local v7, "varyHdr":Lcz/msebera/android/httpclient/Header;
    invoke-interface {v7}, Lcz/msebera/android/httpclient/Header;->getElements()[Lcz/msebera/android/httpclient/HeaderElement;

    move-result-object v12

    array-length v13, v12

    const/4 v8, 0x0

    :goto_1a
    if-ge v8, v13, :cond_28

    aget-object v2, v12, v8

    .line 152
    .local v2, "elt":Lcz/msebera/android/httpclient/HeaderElement;
    invoke-interface {v2}, Lcz/msebera/android/httpclient/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v14

    invoke-interface {v6, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 151
    add-int/lit8 v8, v8, 0x1

    goto :goto_1a

    .line 150
    .end local v2    # "elt":Lcz/msebera/android/httpclient/HeaderElement;
    :cond_28
    add-int/lit8 v8, v9, 0x1

    move v9, v8

    goto :goto_10

    .line 155
    .end local v7    # "varyHdr":Lcz/msebera/android/httpclient/Header;
    :cond_2c
    invoke-static {v6}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 159
    :try_start_2f
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v8, "{"

    invoke-direct {v1, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 160
    .local v1, "buf":Ljava/lang/StringBuilder;
    const/4 v3, 0x1

    .line 161
    .local v3, "first":Z
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_3b
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_79

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 162
    .local v4, "headerName":Ljava/lang/String;
    if-nez v3, :cond_4e

    .line 163
    const-string v9, "&"

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 165
    :cond_4e
    sget-object v9, Lcz/msebera/android/httpclient/Consts;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v9}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v9

    invoke-static {v4, v9}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    const-string v9, "="

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    move-object/from16 v0, p1

    invoke-interface {v0, v4}, Lcz/msebera/android/httpclient/HttpRequest;->getHeaders(Ljava/lang/String;)[Lcz/msebera/android/httpclient/Header;

    move-result-object v9

    invoke-virtual {p0, v9}, Lcz/msebera/android/httpclient/impl/client/cache/CacheKeyGenerator;->getFullHeaderValue([Lcz/msebera/android/httpclient/Header;)Ljava/lang/String;

    move-result-object v9

    sget-object v10, Lcz/msebera/android/httpclient/Consts;->UTF_8:Ljava/nio/charset/Charset;

    .line 168
    invoke-virtual {v10}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v10

    .line 167
    invoke-static {v9, v10}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 169
    const/4 v3, 0x0

    .line 170
    goto :goto_3b

    .line 171
    .end local v4    # "headerName":Ljava/lang/String;
    :cond_79
    const-string v8, "}"

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_7e
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_2f .. :try_end_7e} :catch_83

    .line 175
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    return-object v8

    .line 172
    .end local v1    # "buf":Ljava/lang/StringBuilder;
    .end local v3    # "first":Z
    :catch_83
    move-exception v5

    .line 173
    .local v5, "uee":Ljava/io/UnsupportedEncodingException;
    new-instance v8, Ljava/lang/RuntimeException;

    const-string v9, "couldn\'t encode to UTF-8"

    invoke-direct {v8, v9, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v8
.end method

.method public getVariantURI(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)Ljava/lang/String;
    .registers 6
    .param p1, "host"    # Lcz/msebera/android/httpclient/HttpHost;
    .param p2, "req"    # Lcz/msebera/android/httpclient/HttpRequest;
    .param p3, "entry"    # Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;

    .prologue
    .line 133
    invoke-virtual {p3}, Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;->hasVariants()Z

    move-result v0

    if-nez v0, :cond_b

    .line 134
    invoke-virtual {p0, p1, p2}, Lcz/msebera/android/httpclient/impl/client/cache/CacheKeyGenerator;->getURI(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpRequest;)Ljava/lang/String;

    move-result-object v0

    .line 136
    :goto_a
    return-object v0

    :cond_b
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, p2, p3}, Lcz/msebera/android/httpclient/impl/client/cache/CacheKeyGenerator;->getVariantKey(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0, p1, p2}, Lcz/msebera/android/httpclient/impl/client/cache/CacheKeyGenerator;->getURI(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpRequest;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_a
.end method
