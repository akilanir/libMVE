.class public Lcom/koushikdutta/ion/cookie/CookieMiddleware;
.super Lcom/koushikdutta/async/http/SimpleMiddleware;
.source "CookieMiddleware.java"


# instance fields
.field ion:Lcom/koushikdutta/ion/Ion;

.field manager:Ljava/net/CookieManager;

.field preferences:Landroid/content/SharedPreferences;


# direct methods
.method public constructor <init>(Lcom/koushikdutta/ion/Ion;)V
    .registers 2
    .param p1, "ion"    # Lcom/koushikdutta/ion/Ion;

    .prologue
    .line 42
    invoke-direct {p0}, Lcom/koushikdutta/async/http/SimpleMiddleware;-><init>()V

    .line 43
    iput-object p1, p0, Lcom/koushikdutta/ion/cookie/CookieMiddleware;->ion:Lcom/koushikdutta/ion/Ion;

    .line 44
    return-void
.end method

.method public static addCookies(Ljava/util/Map;Lcom/koushikdutta/async/http/Headers;)V
    .registers 6
    .param p1, "headers"    # Lcom/koushikdutta/async/http/Headers;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;",
            "Lcom/koushikdutta/async/http/Headers;",
            ")V"
        }
    .end annotation

    .prologue
    .line 74
    .local p0, "allCookieHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_8
    :goto_8
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_34

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 75
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 76
    .local v2, "key":Ljava/lang/String;
    const-string v3, "Cookie"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_2a

    const-string v3, "Cookie2"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 77
    :cond_2a
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    invoke-virtual {p1, v2, v3}, Lcom/koushikdutta/async/http/Headers;->addAll(Ljava/lang/String;Ljava/util/List;)Lcom/koushikdutta/async/http/Headers;

    goto :goto_8

    .line 80
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    .end local v2    # "key":Ljava/lang/String;
    :cond_34
    return-void
.end method

.method private maybeInit()V
    .registers 2

    .prologue
    .line 83
    iget-object v0, p0, Lcom/koushikdutta/ion/cookie/CookieMiddleware;->manager:Ljava/net/CookieManager;

    if-nez v0, :cond_7

    .line 84
    invoke-virtual {p0}, Lcom/koushikdutta/ion/cookie/CookieMiddleware;->reinit()V

    .line 85
    :cond_7
    return-void
.end method


# virtual methods
.method public clear()V
    .registers 2

    .prologue
    .line 31
    invoke-direct {p0}, Lcom/koushikdutta/ion/cookie/CookieMiddleware;->maybeInit()V

    .line 32
    invoke-virtual {p0}, Lcom/koushikdutta/ion/cookie/CookieMiddleware;->getCookieStore()Ljava/net/CookieStore;

    move-result-object v0

    invoke-interface {v0}, Ljava/net/CookieStore;->removeAll()Z

    .line 33
    iget-object v0, p0, Lcom/koushikdutta/ion/cookie/CookieMiddleware;->preferences:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 34
    return-void
.end method

.method public getCookieManager()Ljava/net/CookieManager;
    .registers 2

    .prologue
    .line 37
    invoke-direct {p0}, Lcom/koushikdutta/ion/cookie/CookieMiddleware;->maybeInit()V

    .line 38
    iget-object v0, p0, Lcom/koushikdutta/ion/cookie/CookieMiddleware;->manager:Ljava/net/CookieManager;

    return-object v0
.end method

.method public getCookieStore()Ljava/net/CookieStore;
    .registers 2

    .prologue
    .line 27
    iget-object v0, p0, Lcom/koushikdutta/ion/cookie/CookieMiddleware;->manager:Ljava/net/CookieManager;

    invoke-virtual {v0}, Ljava/net/CookieManager;->getCookieStore()Ljava/net/CookieStore;

    move-result-object v0

    return-object v0
.end method

.method public onHeadersReceived(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnHeadersReceivedDataOnRequestSentData;)V
    .registers 4
    .param p1, "data"    # Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnHeadersReceivedDataOnRequestSentData;

    .prologue
    .line 103
    invoke-direct {p0}, Lcom/koushikdutta/ion/cookie/CookieMiddleware;->maybeInit()V

    .line 105
    :try_start_3
    iget-object v0, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnHeadersReceivedDataOnRequestSentData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-virtual {v0}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getUri()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v0

    iget-object v1, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnHeadersReceivedDataOnRequestSentData;->response:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    invoke-interface {v1}, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;->headers()Lcom/koushikdutta/async/http/Headers;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/koushikdutta/ion/cookie/CookieMiddleware;->put(Ljava/net/URI;Lcom/koushikdutta/async/http/Headers;)V
    :try_end_1a
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_1a} :catch_1b

    .line 109
    :goto_1a
    return-void

    .line 107
    :catch_1b
    move-exception v0

    goto :goto_1a
.end method

.method public onRequest(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnRequestData;)V
    .registers 6
    .param p1, "data"    # Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnRequestData;

    .prologue
    .line 89
    invoke-direct {p0}, Lcom/koushikdutta/ion/cookie/CookieMiddleware;->maybeInit()V

    .line 91
    :try_start_3
    iget-object v1, p0, Lcom/koushikdutta/ion/cookie/CookieMiddleware;->manager:Ljava/net/CookieManager;

    iget-object v2, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnRequestData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    .line 93
    invoke-virtual {v2}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getUri()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    .line 92
    invoke-static {v2}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v2

    iget-object v3, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnRequestData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    .line 94
    invoke-virtual {v3}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getHeaders()Lcom/koushikdutta/async/http/Headers;

    move-result-object v3

    invoke-virtual {v3}, Lcom/koushikdutta/async/http/Headers;->getMultiMap()Lcom/koushikdutta/async/http/Multimap;

    move-result-object v3

    .line 91
    invoke-virtual {v1, v2, v3}, Ljava/net/CookieManager;->get(Ljava/net/URI;Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    .line 95
    .local v0, "cookies":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    iget-object v1, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnRequestData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-virtual {v1}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getHeaders()Lcom/koushikdutta/async/http/Headers;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/koushikdutta/ion/cookie/CookieMiddleware;->addCookies(Ljava/util/Map;Lcom/koushikdutta/async/http/Headers;)V
    :try_end_2a
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_2a} :catch_2b

    .line 99
    .end local v0    # "cookies":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    :goto_2a
    return-void

    .line 97
    :catch_2b
    move-exception v1

    goto :goto_2a
.end method

.method public put(Ljava/net/URI;Lcom/koushikdutta/async/http/Headers;)V
    .registers 11
    .param p1, "uri"    # Ljava/net/URI;
    .param p2, "headers"    # Lcom/koushikdutta/async/http/Headers;

    .prologue
    .line 112
    invoke-direct {p0}, Lcom/koushikdutta/ion/cookie/CookieMiddleware;->maybeInit()V

    .line 114
    :try_start_3
    iget-object v5, p0, Lcom/koushikdutta/ion/cookie/CookieMiddleware;->manager:Ljava/net/CookieManager;

    invoke-virtual {p2}, Lcom/koushikdutta/async/http/Headers;->getMultiMap()Lcom/koushikdutta/async/http/Multimap;

    move-result-object v6

    invoke-virtual {v5, p1, v6}, Ljava/net/CookieManager;->put(Ljava/net/URI;Ljava/util/Map;)V

    .line 117
    const-string v5, "Set-Cookie"

    invoke-virtual {p2, v5}, Lcom/koushikdutta/async/http/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_15

    .line 132
    :goto_14
    return-void

    .line 120
    :cond_15
    iget-object v5, p0, Lcom/koushikdutta/ion/cookie/CookieMiddleware;->manager:Ljava/net/CookieManager;

    invoke-virtual {v5}, Ljava/net/CookieManager;->getCookieStore()Ljava/net/CookieStore;

    move-result-object v5

    invoke-interface {v5, p1}, Ljava/net/CookieStore;->get(Ljava/net/URI;)Ljava/util/List;

    move-result-object v1

    .line 122
    .local v1, "cookies":Ljava/util/List;, "Ljava/util/List<Ljava/net/HttpCookie;>;"
    new-instance v2, Lcom/koushikdutta/async/http/Headers;

    invoke-direct {v2}, Lcom/koushikdutta/async/http/Headers;-><init>()V

    .line 123
    .local v2, "dump":Lcom/koushikdutta/async/http/Headers;
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_28
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_69

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/HttpCookie;

    .line 124
    .local v0, "cookie":Ljava/net/HttpCookie;
    const-string v5, "Set-Cookie"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/net/HttpCookie;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v0}, Ljava/net/HttpCookie;->getValue()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "; path="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v0}, Ljava/net/HttpCookie;->getPath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Lcom/koushikdutta/async/http/Headers;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/async/http/Headers;

    goto :goto_28

    .line 130
    .end local v0    # "cookie":Ljava/net/HttpCookie;
    .end local v1    # "cookies":Ljava/util/List;, "Ljava/util/List<Ljava/net/HttpCookie;>;"
    .end local v2    # "dump":Lcom/koushikdutta/async/http/Headers;
    .end local v3    # "i$":Ljava/util/Iterator;
    :catch_67
    move-exception v5

    goto :goto_14

    .line 127
    .restart local v1    # "cookies":Ljava/util/List;, "Ljava/util/List<Ljava/net/HttpCookie;>;"
    .restart local v2    # "dump":Lcom/koushikdutta/async/http/Headers;
    .restart local v3    # "i$":Ljava/util/Iterator;
    :cond_69
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "://"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1}, Ljava/net/URI;->getAuthority()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 128
    .local v4, "key":Ljava/lang/String;
    iget-object v5, p0, Lcom/koushikdutta/ion/cookie/CookieMiddleware;->preferences:Landroid/content/SharedPreferences;

    invoke-interface {v5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    const-string v6, "HTTP/1.1 200 OK"

    invoke-virtual {v2, v6}, Lcom/koushikdutta/async/http/Headers;->toPrefixString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v4, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_9b
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_9b} :catch_67

    goto/16 :goto_14
.end method

.method public reinit()V
    .registers 16

    .prologue
    const/4 v13, 0x0

    .line 47
    new-instance v12, Ljava/net/CookieManager;

    invoke-direct {v12, v13, v13}, Ljava/net/CookieManager;-><init>(Ljava/net/CookieStore;Ljava/net/CookiePolicy;)V

    iput-object v12, p0, Lcom/koushikdutta/ion/cookie/CookieMiddleware;->manager:Ljava/net/CookieManager;

    .line 48
    iget-object v12, p0, Lcom/koushikdutta/ion/cookie/CookieMiddleware;->ion:Lcom/koushikdutta/ion/Ion;

    invoke-virtual {v12}, Lcom/koushikdutta/ion/Ion;->getContext()Landroid/content/Context;

    move-result-object v12

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v14, p0, Lcom/koushikdutta/ion/cookie/CookieMiddleware;->ion:Lcom/koushikdutta/ion/Ion;

    invoke-virtual {v14}, Lcom/koushikdutta/ion/Ion;->getName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "-cookies"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    const/4 v14, 0x0

    invoke-virtual {v12, v13, v14}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v12

    iput-object v12, p0, Lcom/koushikdutta/ion/cookie/CookieMiddleware;->preferences:Landroid/content/SharedPreferences;

    .line 50
    iget-object v12, p0, Lcom/koushikdutta/ion/cookie/CookieMiddleware;->preferences:Landroid/content/SharedPreferences;

    invoke-interface {v12}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object v0

    .line 51
    .local v0, "allPrefs":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;*>;"
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v12

    invoke-interface {v12}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_3c
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_89

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 53
    .local v7, "key":Ljava/lang/String;
    :try_start_48
    iget-object v12, p0, Lcom/koushikdutta/ion/cookie/CookieMiddleware;->preferences:Landroid/content/SharedPreferences;

    const/4 v13, 0x0

    invoke-interface {v12, v7, v13}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 54
    .local v11, "value":Ljava/lang/String;
    new-instance v4, Lcom/koushikdutta/async/http/Headers;

    invoke-direct {v4}, Lcom/koushikdutta/async/http/Headers;-><init>()V

    .line 55
    .local v4, "headers":Lcom/koushikdutta/async/http/Headers;
    const-string v12, "\n"

    invoke-virtual {v11, v12}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v10

    .line 56
    .local v10, "lines":[Ljava/lang/String;
    const/4 v3, 0x1

    .line 57
    .local v3, "first":Z
    move-object v1, v10

    .local v1, "arr$":[Ljava/lang/String;
    array-length v8, v1

    .local v8, "len$":I
    const/4 v6, 0x0

    .local v6, "i$":I
    :goto_5e
    if-ge v6, v8, :cond_7b

    aget-object v9, v1, v6

    .line 58
    .local v9, "line":Ljava/lang/String;
    if-eqz v3, :cond_68

    .line 59
    const/4 v3, 0x0

    .line 57
    :cond_65
    :goto_65
    add-int/lit8 v6, v6, 0x1

    goto :goto_5e

    .line 61
    :cond_68
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v12

    if-nez v12, :cond_65

    .line 62
    invoke-virtual {v4, v9}, Lcom/koushikdutta/async/http/Headers;->addLine(Ljava/lang/String;)Lcom/koushikdutta/async/http/Headers;
    :try_end_71
    .catch Ljava/lang/Exception; {:try_start_48 .. :try_end_71} :catch_72

    goto :goto_65

    .line 67
    .end local v1    # "arr$":[Ljava/lang/String;
    .end local v3    # "first":Z
    .end local v4    # "headers":Lcom/koushikdutta/async/http/Headers;
    .end local v6    # "i$":I
    .end local v8    # "len$":I
    .end local v9    # "line":Ljava/lang/String;
    .end local v10    # "lines":[Ljava/lang/String;
    .end local v11    # "value":Ljava/lang/String;
    :catch_72
    move-exception v2

    .line 68
    .local v2, "e":Ljava/lang/Exception;
    const-string v12, "Ion"

    const-string v13, "unable to load cookies"

    invoke-static {v12, v13, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_3c

    .line 65
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v1    # "arr$":[Ljava/lang/String;
    .restart local v3    # "first":Z
    .restart local v4    # "headers":Lcom/koushikdutta/async/http/Headers;
    .restart local v6    # "i$":I
    .restart local v8    # "len$":I
    .restart local v10    # "lines":[Ljava/lang/String;
    .restart local v11    # "value":Ljava/lang/String;
    :cond_7b
    :try_start_7b
    iget-object v12, p0, Lcom/koushikdutta/ion/cookie/CookieMiddleware;->manager:Ljava/net/CookieManager;

    invoke-static {v7}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v13

    invoke-virtual {v4}, Lcom/koushikdutta/async/http/Headers;->getMultiMap()Lcom/koushikdutta/async/http/Multimap;

    move-result-object v14

    invoke-virtual {v12, v13, v14}, Ljava/net/CookieManager;->put(Ljava/net/URI;Ljava/util/Map;)V
    :try_end_88
    .catch Ljava/lang/Exception; {:try_start_7b .. :try_end_88} :catch_72

    goto :goto_3c

    .line 71
    .end local v1    # "arr$":[Ljava/lang/String;
    .end local v3    # "first":Z
    .end local v4    # "headers":Lcom/koushikdutta/async/http/Headers;
    .end local v6    # "i$":I
    .end local v7    # "key":Ljava/lang/String;
    .end local v8    # "len$":I
    .end local v10    # "lines":[Ljava/lang/String;
    .end local v11    # "value":Ljava/lang/String;
    :cond_89
    return-void
.end method
