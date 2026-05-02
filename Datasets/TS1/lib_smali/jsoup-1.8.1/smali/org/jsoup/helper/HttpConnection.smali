.class public Lorg/jsoup/helper/HttpConnection;
.super Ljava/lang/Object;
.source "HttpConnection.java"

# interfaces
.implements Lorg/jsoup/Connection;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jsoup/helper/HttpConnection$1;,
        Lorg/jsoup/helper/HttpConnection$KeyVal;,
        Lorg/jsoup/helper/HttpConnection$Response;,
        Lorg/jsoup/helper/HttpConnection$Request;,
        Lorg/jsoup/helper/HttpConnection$Base;
    }
.end annotation


# static fields
.field private static final HTTP_TEMP_REDIR:I = 0x133


# instance fields
.field private req:Lorg/jsoup/Connection$Request;

.field private res:Lorg/jsoup/Connection$Response;


# direct methods
.method private constructor <init>()V
    .registers 3

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    new-instance v0, Lorg/jsoup/helper/HttpConnection$Request;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/jsoup/helper/HttpConnection$Request;-><init>(Lorg/jsoup/helper/HttpConnection$1;)V

    iput-object v0, p0, Lorg/jsoup/helper/HttpConnection;->req:Lorg/jsoup/Connection$Request;

    .line 51
    new-instance v0, Lorg/jsoup/helper/HttpConnection$Response;

    invoke-direct {v0}, Lorg/jsoup/helper/HttpConnection$Response;-><init>()V

    iput-object v0, p0, Lorg/jsoup/helper/HttpConnection;->res:Lorg/jsoup/Connection$Response;

    .line 52
    return-void
.end method

.method static synthetic access$200(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 25
    invoke-static {p0}, Lorg/jsoup/helper/HttpConnection;->encodeUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static connect(Ljava/lang/String;)Lorg/jsoup/Connection;
    .registers 2
    .param p0, "url"    # Ljava/lang/String;

    .prologue
    .line 29
    new-instance v0, Lorg/jsoup/helper/HttpConnection;

    invoke-direct {v0}, Lorg/jsoup/helper/HttpConnection;-><init>()V

    .line 30
    .local v0, "con":Lorg/jsoup/Connection;
    invoke-interface {v0, p0}, Lorg/jsoup/Connection;->url(Ljava/lang/String;)Lorg/jsoup/Connection;

    .line 31
    return-object v0
.end method

.method public static connect(Ljava/net/URL;)Lorg/jsoup/Connection;
    .registers 2
    .param p0, "url"    # Ljava/net/URL;

    .prologue
    .line 35
    new-instance v0, Lorg/jsoup/helper/HttpConnection;

    invoke-direct {v0}, Lorg/jsoup/helper/HttpConnection;-><init>()V

    .line 36
    .local v0, "con":Lorg/jsoup/Connection;
    invoke-interface {v0, p0}, Lorg/jsoup/Connection;->url(Ljava/net/URL;)Lorg/jsoup/Connection;

    .line 37
    return-object v0
.end method

.method private static encodeUrl(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "url"    # Ljava/lang/String;

    .prologue
    .line 41
    if-nez p0, :cond_4

    .line 42
    const/4 v0, 0x0

    .line 43
    :goto_3
    return-object v0

    :cond_4
    const-string v0, " "

    const-string v1, "%20"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_3
.end method


# virtual methods
.method public cookie(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/Connection;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 151
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection;->req:Lorg/jsoup/Connection$Request;

    invoke-interface {v0, p1, p2}, Lorg/jsoup/Connection$Request;->cookie(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/Connection$Base;

    .line 152
    return-object p0
.end method

.method public cookies(Ljava/util/Map;)Lorg/jsoup/Connection;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lorg/jsoup/Connection;"
        }
    .end annotation

    .prologue
    .line 156
    .local p1, "cookies":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v2, "Cookie map must not be null"

    invoke-static {p1, v2}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 157
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2b

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 158
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v4, p0, Lorg/jsoup/helper/HttpConnection;->req:Lorg/jsoup/Connection$Request;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v4, v2, v3}, Lorg/jsoup/Connection$Request;->cookie(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/Connection$Base;

    goto :goto_d

    .line 160
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_2b
    return-object p0
.end method

.method public data(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/Connection;
    .registers 5
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 112
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection;->req:Lorg/jsoup/Connection$Request;

    invoke-static {p1, p2}, Lorg/jsoup/helper/HttpConnection$KeyVal;->create(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/helper/HttpConnection$KeyVal;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/jsoup/Connection$Request;->data(Lorg/jsoup/Connection$KeyVal;)Lorg/jsoup/Connection$Request;

    .line 113
    return-object p0
.end method

.method public data(Ljava/util/Collection;)Lorg/jsoup/Connection;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lorg/jsoup/Connection$KeyVal;",
            ">;)",
            "Lorg/jsoup/Connection;"
        }
    .end annotation

    .prologue
    .line 138
    .local p1, "data":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/jsoup/Connection$KeyVal;>;"
    const-string v2, "Data collection must not be null"

    invoke-static {p1, v2}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 139
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_9
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1b

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/Connection$KeyVal;

    .line 140
    .local v0, "entry":Lorg/jsoup/Connection$KeyVal;
    iget-object v2, p0, Lorg/jsoup/helper/HttpConnection;->req:Lorg/jsoup/Connection$Request;

    invoke-interface {v2, v0}, Lorg/jsoup/Connection$Request;->data(Lorg/jsoup/Connection$KeyVal;)Lorg/jsoup/Connection$Request;

    goto :goto_9

    .line 142
    .end local v0    # "entry":Lorg/jsoup/Connection$KeyVal;
    :cond_1b
    return-object p0
.end method

.method public data(Ljava/util/Map;)Lorg/jsoup/Connection;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lorg/jsoup/Connection;"
        }
    .end annotation

    .prologue
    .line 117
    .local p1, "data":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v2, "Data map must not be null"

    invoke-static {p1, v2}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 118
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2f

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 119
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v4, p0, Lorg/jsoup/helper/HttpConnection;->req:Lorg/jsoup/Connection$Request;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v2, v3}, Lorg/jsoup/helper/HttpConnection$KeyVal;->create(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/helper/HttpConnection$KeyVal;

    move-result-object v2

    invoke-interface {v4, v2}, Lorg/jsoup/Connection$Request;->data(Lorg/jsoup/Connection$KeyVal;)Lorg/jsoup/Connection$Request;

    goto :goto_d

    .line 121
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_2f
    return-object p0
.end method

.method public varargs data([Ljava/lang/String;)Lorg/jsoup/Connection;
    .registers 7
    .param p1, "keyvals"    # [Ljava/lang/String;

    .prologue
    .line 125
    const-string v3, "Data key value pairs must not be null"

    invoke-static {p1, v3}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 126
    array-length v3, p1

    rem-int/lit8 v3, v3, 0x2

    if-nez v3, :cond_30

    const/4 v3, 0x1

    :goto_b
    const-string v4, "Must supply an even number of key value pairs"

    invoke-static {v3, v4}, Lorg/jsoup/helper/Validate;->isTrue(ZLjava/lang/String;)V

    .line 127
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_11
    array-length v3, p1

    if-ge v0, v3, :cond_32

    .line 128
    aget-object v1, p1, v0

    .line 129
    .local v1, "key":Ljava/lang/String;
    add-int/lit8 v3, v0, 0x1

    aget-object v2, p1, v3

    .line 130
    .local v2, "value":Ljava/lang/String;
    const-string v3, "Data key must not be empty"

    invoke-static {v1, v3}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;Ljava/lang/String;)V

    .line 131
    const-string v3, "Data value must not be null"

    invoke-static {v2, v3}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 132
    iget-object v3, p0, Lorg/jsoup/helper/HttpConnection;->req:Lorg/jsoup/Connection$Request;

    invoke-static {v1, v2}, Lorg/jsoup/helper/HttpConnection$KeyVal;->create(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/helper/HttpConnection$KeyVal;

    move-result-object v4

    invoke-interface {v3, v4}, Lorg/jsoup/Connection$Request;->data(Lorg/jsoup/Connection$KeyVal;)Lorg/jsoup/Connection$Request;

    .line 127
    add-int/lit8 v0, v0, 0x2

    goto :goto_11

    .line 126
    .end local v0    # "i":I
    .end local v1    # "key":Ljava/lang/String;
    .end local v2    # "value":Ljava/lang/String;
    :cond_30
    const/4 v3, 0x0

    goto :goto_b

    .line 134
    .restart local v0    # "i":I
    :cond_32
    return-object p0
.end method

.method public execute()Lorg/jsoup/Connection$Response;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 181
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection;->req:Lorg/jsoup/Connection$Request;

    invoke-static {v0}, Lorg/jsoup/helper/HttpConnection$Response;->execute(Lorg/jsoup/Connection$Request;)Lorg/jsoup/helper/HttpConnection$Response;

    move-result-object v0

    iput-object v0, p0, Lorg/jsoup/helper/HttpConnection;->res:Lorg/jsoup/Connection$Response;

    .line 182
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection;->res:Lorg/jsoup/Connection$Response;

    return-object v0
.end method

.method public followRedirects(Z)Lorg/jsoup/Connection;
    .registers 3
    .param p1, "followRedirects"    # Z

    .prologue
    .line 86
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection;->req:Lorg/jsoup/Connection$Request;

    invoke-interface {v0, p1}, Lorg/jsoup/Connection$Request;->followRedirects(Z)Lorg/jsoup/Connection$Request;

    .line 87
    return-object p0
.end method

.method public get()Lorg/jsoup/nodes/Document;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 169
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection;->req:Lorg/jsoup/Connection$Request;

    sget-object v1, Lorg/jsoup/Connection$Method;->GET:Lorg/jsoup/Connection$Method;

    invoke-interface {v0, v1}, Lorg/jsoup/Connection$Request;->method(Lorg/jsoup/Connection$Method;)Lorg/jsoup/Connection$Base;

    .line 170
    invoke-virtual {p0}, Lorg/jsoup/helper/HttpConnection;->execute()Lorg/jsoup/Connection$Response;

    .line 171
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection;->res:Lorg/jsoup/Connection$Response;

    invoke-interface {v0}, Lorg/jsoup/Connection$Response;->parse()Lorg/jsoup/nodes/Document;

    move-result-object v0

    return-object v0
.end method

.method public header(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/Connection;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 146
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection;->req:Lorg/jsoup/Connection$Request;

    invoke-interface {v0, p1, p2}, Lorg/jsoup/Connection$Request;->header(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/Connection$Base;

    .line 147
    return-object p0
.end method

.method public ignoreContentType(Z)Lorg/jsoup/Connection;
    .registers 3
    .param p1, "ignoreContentType"    # Z

    .prologue
    .line 107
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection;->req:Lorg/jsoup/Connection$Request;

    invoke-interface {v0, p1}, Lorg/jsoup/Connection$Request;->ignoreContentType(Z)Lorg/jsoup/Connection$Request;

    .line 108
    return-object p0
.end method

.method public ignoreHttpErrors(Z)Lorg/jsoup/Connection;
    .registers 3
    .param p1, "ignoreHttpErrors"    # Z

    .prologue
    .line 102
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection;->req:Lorg/jsoup/Connection$Request;

    invoke-interface {v0, p1}, Lorg/jsoup/Connection$Request;->ignoreHttpErrors(Z)Lorg/jsoup/Connection$Request;

    .line 103
    return-object p0
.end method

.method public maxBodySize(I)Lorg/jsoup/Connection;
    .registers 3
    .param p1, "bytes"    # I

    .prologue
    .line 81
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection;->req:Lorg/jsoup/Connection$Request;

    invoke-interface {v0, p1}, Lorg/jsoup/Connection$Request;->maxBodySize(I)Lorg/jsoup/Connection$Request;

    .line 82
    return-object p0
.end method

.method public method(Lorg/jsoup/Connection$Method;)Lorg/jsoup/Connection;
    .registers 3
    .param p1, "method"    # Lorg/jsoup/Connection$Method;

    .prologue
    .line 97
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection;->req:Lorg/jsoup/Connection$Request;

    invoke-interface {v0, p1}, Lorg/jsoup/Connection$Request;->method(Lorg/jsoup/Connection$Method;)Lorg/jsoup/Connection$Base;

    .line 98
    return-object p0
.end method

.method public parser(Lorg/jsoup/parser/Parser;)Lorg/jsoup/Connection;
    .registers 3
    .param p1, "parser"    # Lorg/jsoup/parser/Parser;

    .prologue
    .line 164
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection;->req:Lorg/jsoup/Connection$Request;

    invoke-interface {v0, p1}, Lorg/jsoup/Connection$Request;->parser(Lorg/jsoup/parser/Parser;)Lorg/jsoup/Connection$Request;

    .line 165
    return-object p0
.end method

.method public post()Lorg/jsoup/nodes/Document;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 175
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection;->req:Lorg/jsoup/Connection$Request;

    sget-object v1, Lorg/jsoup/Connection$Method;->POST:Lorg/jsoup/Connection$Method;

    invoke-interface {v0, v1}, Lorg/jsoup/Connection$Request;->method(Lorg/jsoup/Connection$Method;)Lorg/jsoup/Connection$Base;

    .line 176
    invoke-virtual {p0}, Lorg/jsoup/helper/HttpConnection;->execute()Lorg/jsoup/Connection$Response;

    .line 177
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection;->res:Lorg/jsoup/Connection$Response;

    invoke-interface {v0}, Lorg/jsoup/Connection$Response;->parse()Lorg/jsoup/nodes/Document;

    move-result-object v0

    return-object v0
.end method

.method public referrer(Ljava/lang/String;)Lorg/jsoup/Connection;
    .registers 4
    .param p1, "referrer"    # Ljava/lang/String;

    .prologue
    .line 91
    const-string v0, "Referrer must not be null"

    invoke-static {p1, v0}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 92
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection;->req:Lorg/jsoup/Connection$Request;

    const-string v1, "Referer"

    invoke-interface {v0, v1, p1}, Lorg/jsoup/Connection$Request;->header(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/Connection$Base;

    .line 93
    return-object p0
.end method

.method public request()Lorg/jsoup/Connection$Request;
    .registers 2

    .prologue
    .line 186
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection;->req:Lorg/jsoup/Connection$Request;

    return-object v0
.end method

.method public request(Lorg/jsoup/Connection$Request;)Lorg/jsoup/Connection;
    .registers 2
    .param p1, "request"    # Lorg/jsoup/Connection$Request;

    .prologue
    .line 190
    iput-object p1, p0, Lorg/jsoup/helper/HttpConnection;->req:Lorg/jsoup/Connection$Request;

    .line 191
    return-object p0
.end method

.method public response()Lorg/jsoup/Connection$Response;
    .registers 2

    .prologue
    .line 195
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection;->res:Lorg/jsoup/Connection$Response;

    return-object v0
.end method

.method public response(Lorg/jsoup/Connection$Response;)Lorg/jsoup/Connection;
    .registers 2
    .param p1, "response"    # Lorg/jsoup/Connection$Response;

    .prologue
    .line 199
    iput-object p1, p0, Lorg/jsoup/helper/HttpConnection;->res:Lorg/jsoup/Connection$Response;

    .line 200
    return-object p0
.end method

.method public timeout(I)Lorg/jsoup/Connection;
    .registers 3
    .param p1, "millis"    # I

    .prologue
    .line 76
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection;->req:Lorg/jsoup/Connection$Request;

    invoke-interface {v0, p1}, Lorg/jsoup/Connection$Request;->timeout(I)Lorg/jsoup/Connection$Request;

    .line 77
    return-object p0
.end method

.method public url(Ljava/lang/String;)Lorg/jsoup/Connection;
    .registers 6
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 60
    const-string v1, "Must supply a valid URL"

    invoke-static {p1, v1}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    :try_start_5
    iget-object v1, p0, Lorg/jsoup/helper/HttpConnection;->req:Lorg/jsoup/Connection$Request;

    new-instance v2, Ljava/net/URL;

    invoke-static {p1}, Lorg/jsoup/helper/HttpConnection;->encodeUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-interface {v1, v2}, Lorg/jsoup/Connection$Request;->url(Ljava/net/URL;)Lorg/jsoup/Connection$Base;
    :try_end_13
    .catch Ljava/net/MalformedURLException; {:try_start_5 .. :try_end_13} :catch_14

    .line 66
    return-object p0

    .line 63
    :catch_14
    move-exception v0

    .line 64
    .local v0, "e":Ljava/net/MalformedURLException;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Malformed URL: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public url(Ljava/net/URL;)Lorg/jsoup/Connection;
    .registers 3
    .param p1, "url"    # Ljava/net/URL;

    .prologue
    .line 55
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection;->req:Lorg/jsoup/Connection$Request;

    invoke-interface {v0, p1}, Lorg/jsoup/Connection$Request;->url(Ljava/net/URL;)Lorg/jsoup/Connection$Base;

    .line 56
    return-object p0
.end method

.method public userAgent(Ljava/lang/String;)Lorg/jsoup/Connection;
    .registers 4
    .param p1, "userAgent"    # Ljava/lang/String;

    .prologue
    .line 70
    const-string v0, "User agent must not be null"

    invoke-static {p1, v0}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 71
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection;->req:Lorg/jsoup/Connection$Request;

    const-string v1, "User-Agent"

    invoke-interface {v0, v1, p1}, Lorg/jsoup/Connection$Request;->header(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/Connection$Base;

    .line 72
    return-object p0
.end method
