.class public Lcz/msebera/android/httpclient/client/protocol/ResponseProcessCookies;
.super Ljava/lang/Object;
.source "ResponseProcessCookies.java"

# interfaces
.implements Lcz/msebera/android/httpclient/HttpResponseInterceptor;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/Immutable;
.end annotation


# instance fields
.field public log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    new-instance v0, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-direct {v0, v1}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcz/msebera/android/httpclient/client/protocol/ResponseProcessCookies;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    .line 63
    return-void
.end method

.method private static formatCooke(Lcz/msebera/android/httpclient/cookie/Cookie;)Ljava/lang/String;
    .registers 6
    .param p0, "cookie"    # Lcz/msebera/android/httpclient/cookie/Cookie;

    .prologue
    const/16 v4, 0x64

    .line 136
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 137
    .local v0, "buf":Ljava/lang/StringBuilder;
    invoke-interface {p0}, Lcz/msebera/android/httpclient/cookie/Cookie;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    const-string v2, "=\""

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    invoke-interface {p0}, Lcz/msebera/android/httpclient/cookie/Cookie;->getValue()Ljava/lang/String;

    move-result-object v1

    .line 140
    .local v1, "v":Ljava/lang/String;
    if-eqz v1, :cond_3a

    .line 141
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-le v2, v4, :cond_37

    .line 142
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v3, 0x0

    invoke-virtual {v1, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "..."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 144
    :cond_37
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    :cond_3a
    const-string v2, "\""

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    const-string v2, ", version:"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 148
    invoke-interface {p0}, Lcz/msebera/android/httpclient/cookie/Cookie;->getVersion()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 149
    const-string v2, ", domain:"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    invoke-interface {p0}, Lcz/msebera/android/httpclient/cookie/Cookie;->getDomain()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    const-string v2, ", path:"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    invoke-interface {p0}, Lcz/msebera/android/httpclient/cookie/Cookie;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    const-string v2, ", expiry:"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    invoke-interface {p0}, Lcz/msebera/android/httpclient/cookie/Cookie;->getExpiryDate()Ljava/util/Date;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 155
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private processCookies(Lcz/msebera/android/httpclient/HeaderIterator;Lcz/msebera/android/httpclient/cookie/CookieSpec;Lcz/msebera/android/httpclient/cookie/CookieOrigin;Lcz/msebera/android/httpclient/client/CookieStore;)V
    .registers 13
    .param p1, "iterator"    # Lcz/msebera/android/httpclient/HeaderIterator;
    .param p2, "cookieSpec"    # Lcz/msebera/android/httpclient/cookie/CookieSpec;
    .param p3, "cookieOrigin"    # Lcz/msebera/android/httpclient/cookie/CookieOrigin;
    .param p4, "cookieStore"    # Lcz/msebera/android/httpclient/client/CookieStore;

    .prologue
    .line 107
    :cond_0
    :goto_0
    invoke-interface {p1}, Lcz/msebera/android/httpclient/HeaderIterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_b4

    .line 108
    invoke-interface {p1}, Lcz/msebera/android/httpclient/HeaderIterator;->nextHeader()Lcz/msebera/android/httpclient/Header;

    move-result-object v3

    .line 110
    .local v3, "header":Lcz/msebera/android/httpclient/Header;
    :try_start_a
    invoke-interface {p2, v3, p3}, Lcz/msebera/android/httpclient/cookie/CookieSpec;->parse(Lcz/msebera/android/httpclient/Header;Lcz/msebera/android/httpclient/cookie/CookieOrigin;)Ljava/util/List;

    move-result-object v1

    .line 111
    .local v1, "cookies":Ljava/util/List;, "Ljava/util/List<Lcz/msebera/android/httpclient/cookie/Cookie;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_12
    :goto_12
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcz/msebera/android/httpclient/cookie/Cookie;
    :try_end_1e
    .catch Lcz/msebera/android/httpclient/cookie/MalformedCookieException; {:try_start_a .. :try_end_1e} :catch_83

    .line 113
    .local v0, "cookie":Lcz/msebera/android/httpclient/cookie/Cookie;
    :try_start_1e
    invoke-interface {p2, v0, p3}, Lcz/msebera/android/httpclient/cookie/CookieSpec;->validate(Lcz/msebera/android/httpclient/cookie/Cookie;Lcz/msebera/android/httpclient/cookie/CookieOrigin;)V

    .line 114
    invoke-interface {p4, v0}, Lcz/msebera/android/httpclient/client/CookieStore;->addCookie(Lcz/msebera/android/httpclient/cookie/Cookie;)V

    .line 116
    iget-object v5, p0, Lcz/msebera/android/httpclient/client/protocol/ResponseProcessCookies;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {v5}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isDebugEnabled()Z

    move-result v5

    if-eqz v5, :cond_12

    .line 117
    iget-object v5, p0, Lcz/msebera/android/httpclient/client/protocol/ResponseProcessCookies;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Cookie accepted ["

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-static {v0}, Lcz/msebera/android/httpclient/client/protocol/ResponseProcessCookies;->formatCooke(Lcz/msebera/android/httpclient/cookie/Cookie;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "]"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V
    :try_end_4e
    .catch Lcz/msebera/android/httpclient/cookie/MalformedCookieException; {:try_start_1e .. :try_end_4e} :catch_4f

    goto :goto_12

    .line 119
    :catch_4f
    move-exception v2

    .line 120
    .local v2, "ex":Lcz/msebera/android/httpclient/cookie/MalformedCookieException;
    :try_start_50
    iget-object v5, p0, Lcz/msebera/android/httpclient/client/protocol/ResponseProcessCookies;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {v5}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isWarnEnabled()Z

    move-result v5

    if-eqz v5, :cond_12

    .line 121
    iget-object v5, p0, Lcz/msebera/android/httpclient/client/protocol/ResponseProcessCookies;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Cookie rejected ["

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-static {v0}, Lcz/msebera/android/httpclient/client/protocol/ResponseProcessCookies;->formatCooke(Lcz/msebera/android/httpclient/cookie/Cookie;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "] "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 122
    invoke-virtual {v2}, Lcz/msebera/android/httpclient/cookie/MalformedCookieException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 121
    invoke-virtual {v5, v6}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->warn(Ljava/lang/Object;)V
    :try_end_82
    .catch Lcz/msebera/android/httpclient/cookie/MalformedCookieException; {:try_start_50 .. :try_end_82} :catch_83

    goto :goto_12

    .line 126
    .end local v0    # "cookie":Lcz/msebera/android/httpclient/cookie/Cookie;
    .end local v1    # "cookies":Ljava/util/List;, "Ljava/util/List<Lcz/msebera/android/httpclient/cookie/Cookie;>;"
    .end local v2    # "ex":Lcz/msebera/android/httpclient/cookie/MalformedCookieException;
    :catch_83
    move-exception v2

    .line 127
    .restart local v2    # "ex":Lcz/msebera/android/httpclient/cookie/MalformedCookieException;
    iget-object v4, p0, Lcz/msebera/android/httpclient/client/protocol/ResponseProcessCookies;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {v4}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isWarnEnabled()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 128
    iget-object v4, p0, Lcz/msebera/android/httpclient/client/protocol/ResponseProcessCookies;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Invalid cookie header: \""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\". "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 129
    invoke-virtual {v2}, Lcz/msebera/android/httpclient/cookie/MalformedCookieException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 128
    invoke-virtual {v4, v5}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->warn(Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 133
    .end local v2    # "ex":Lcz/msebera/android/httpclient/cookie/MalformedCookieException;
    .end local v3    # "header":Lcz/msebera/android/httpclient/Header;
    :cond_b4
    return-void
.end method


# virtual methods
.method public process(Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/protocol/HttpContext;)V
    .registers 10
    .param p1, "response"    # Lcz/msebera/android/httpclient/HttpResponse;
    .param p2, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 67
    const-string v5, "HTTP request"

    invoke-static {p1, v5}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 68
    const-string v5, "HTTP context"

    invoke-static {p2, v5}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 70
    invoke-static {p2}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->adapt(Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;

    move-result-object v0

    .line 73
    .local v0, "clientContext":Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;
    invoke-virtual {v0}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->getCookieSpec()Lcz/msebera/android/httpclient/cookie/CookieSpec;

    move-result-object v2

    .line 74
    .local v2, "cookieSpec":Lcz/msebera/android/httpclient/cookie/CookieSpec;
    if-nez v2, :cond_1c

    .line 75
    iget-object v5, p0, Lcz/msebera/android/httpclient/client/protocol/ResponseProcessCookies;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v6, "Cookie spec not specified in HTTP context"

    invoke-virtual {v5, v6}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 100
    :cond_1b
    :goto_1b
    return-void

    .line 79
    :cond_1c
    invoke-virtual {v0}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->getCookieStore()Lcz/msebera/android/httpclient/client/CookieStore;

    move-result-object v3

    .line 80
    .local v3, "cookieStore":Lcz/msebera/android/httpclient/client/CookieStore;
    if-nez v3, :cond_2a

    .line 81
    iget-object v5, p0, Lcz/msebera/android/httpclient/client/protocol/ResponseProcessCookies;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v6, "Cookie store not specified in HTTP context"

    invoke-virtual {v5, v6}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    goto :goto_1b

    .line 85
    :cond_2a
    invoke-virtual {v0}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->getCookieOrigin()Lcz/msebera/android/httpclient/cookie/CookieOrigin;

    move-result-object v1

    .line 86
    .local v1, "cookieOrigin":Lcz/msebera/android/httpclient/cookie/CookieOrigin;
    if-nez v1, :cond_38

    .line 87
    iget-object v5, p0, Lcz/msebera/android/httpclient/client/protocol/ResponseProcessCookies;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v6, "Cookie origin not specified in HTTP context"

    invoke-virtual {v5, v6}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    goto :goto_1b

    .line 90
    :cond_38
    const-string v5, "Set-Cookie"

    invoke-interface {p1, v5}, Lcz/msebera/android/httpclient/HttpResponse;->headerIterator(Ljava/lang/String;)Lcz/msebera/android/httpclient/HeaderIterator;

    move-result-object v4

    .line 91
    .local v4, "it":Lcz/msebera/android/httpclient/HeaderIterator;
    invoke-direct {p0, v4, v2, v1, v3}, Lcz/msebera/android/httpclient/client/protocol/ResponseProcessCookies;->processCookies(Lcz/msebera/android/httpclient/HeaderIterator;Lcz/msebera/android/httpclient/cookie/CookieSpec;Lcz/msebera/android/httpclient/cookie/CookieOrigin;Lcz/msebera/android/httpclient/client/CookieStore;)V

    .line 94
    invoke-interface {v2}, Lcz/msebera/android/httpclient/cookie/CookieSpec;->getVersion()I

    move-result v5

    if-lez v5, :cond_1b

    .line 97
    const-string v5, "Set-Cookie2"

    invoke-interface {p1, v5}, Lcz/msebera/android/httpclient/HttpResponse;->headerIterator(Ljava/lang/String;)Lcz/msebera/android/httpclient/HeaderIterator;

    move-result-object v4

    .line 98
    invoke-direct {p0, v4, v2, v1, v3}, Lcz/msebera/android/httpclient/client/protocol/ResponseProcessCookies;->processCookies(Lcz/msebera/android/httpclient/HeaderIterator;Lcz/msebera/android/httpclient/cookie/CookieSpec;Lcz/msebera/android/httpclient/cookie/CookieOrigin;Lcz/msebera/android/httpclient/client/CookieStore;)V

    goto :goto_1b
.end method
