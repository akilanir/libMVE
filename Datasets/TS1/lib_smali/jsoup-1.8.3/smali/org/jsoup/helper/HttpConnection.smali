.class public Lorg/jsoup/helper/HttpConnection;
.super Ljava/lang/Object;
.source "HttpConnection.java"

# interfaces
.implements Lorg/jsoup/Connection;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jsoup/helper/HttpConnection$KeyVal;,
        Lorg/jsoup/helper/HttpConnection$Response;,
        Lorg/jsoup/helper/HttpConnection$Request;,
        Lorg/jsoup/helper/HttpConnection$Base;
    }
.end annotation


# static fields
.field public static final CONTENT_ENCODING:Ljava/lang/String; = "Content-Encoding"

.field private static final CONTENT_TYPE:Ljava/lang/String; = "Content-Type"

.field private static final FORM_URL_ENCODED:Ljava/lang/String; = "application/x-www-form-urlencoded"

.field private static final MULTIPART_FORM_DATA:Ljava/lang/String; = "multipart/form-data"


# instance fields
.field private req:Lorg/jsoup/Connection$Request;

.field private res:Lorg/jsoup/Connection$Response;


# direct methods
.method private constructor <init>()V
    .registers 3

    .prologue
    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    new-instance v0, Lorg/jsoup/helper/HttpConnection$Request;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/jsoup/helper/HttpConnection$Request;-><init>(Lorg/jsoup/helper/HttpConnection$1;)V

    iput-object v0, p0, Lorg/jsoup/helper/HttpConnection;->req:Lorg/jsoup/Connection$Request;

    .line 65
    new-instance v0, Lorg/jsoup/helper/HttpConnection$Response;

    invoke-direct {v0}, Lorg/jsoup/helper/HttpConnection$Response;-><init>()V

    iput-object v0, p0, Lorg/jsoup/helper/HttpConnection;->res:Lorg/jsoup/Connection$Response;

    .line 66
    return-void
.end method

.method static synthetic access$200(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 30
    invoke-static {p0}, Lorg/jsoup/helper/HttpConnection;->encodeUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 30
    invoke-static {p0}, Lorg/jsoup/helper/HttpConnection;->encodeMimeName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static connect(Ljava/lang/String;)Lorg/jsoup/Connection;
    .registers 2
    .param p0, "url"    # Ljava/lang/String;

    .prologue
    .line 37
    new-instance v0, Lorg/jsoup/helper/HttpConnection;

    invoke-direct {v0}, Lorg/jsoup/helper/HttpConnection;-><init>()V

    .line 38
    .local v0, "con":Lorg/jsoup/Connection;
    invoke-interface {v0, p0}, Lorg/jsoup/Connection;->url(Ljava/lang/String;)Lorg/jsoup/Connection;

    .line 39
    return-object v0
.end method

.method public static connect(Ljava/net/URL;)Lorg/jsoup/Connection;
    .registers 2
    .param p0, "url"    # Ljava/net/URL;

    .prologue
    .line 43
    new-instance v0, Lorg/jsoup/helper/HttpConnection;

    invoke-direct {v0}, Lorg/jsoup/helper/HttpConnection;-><init>()V

    .line 44
    .local v0, "con":Lorg/jsoup/Connection;
    invoke-interface {v0, p0}, Lorg/jsoup/Connection;->url(Ljava/net/URL;)Lorg/jsoup/Connection;

    .line 45
    return-object v0
.end method

.method private static encodeMimeName(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "val"    # Ljava/lang/String;

    .prologue
    .line 55
    if-nez p0, :cond_4

    .line 56
    const/4 v0, 0x0

    .line 57
    :goto_3
    return-object v0

    :cond_4
    const-string v0, "\""

    const-string v1, "%22"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_3
.end method

.method private static encodeUrl(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "url"    # Ljava/lang/String;

    .prologue
    .line 49
    if-nez p0, :cond_4

    .line 50
    const/4 v0, 0x0

    .line 51
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
    .line 175
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection;->req:Lorg/jsoup/Connection$Request;

    invoke-interface {v0, p1, p2}, Lorg/jsoup/Connection$Request;->cookie(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/Connection$Base;

    .line 176
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
    .line 180
    .local p1, "cookies":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v1, "Cookie map must not be null"

    invoke-static {p1, v1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 181
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_d
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2b

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 182
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v4, p0, Lorg/jsoup/helper/HttpConnection;->req:Lorg/jsoup/Connection$Request;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v4, v1, v2}, Lorg/jsoup/Connection$Request;->cookie(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/Connection$Base;

    goto :goto_d

    .line 184
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_2b
    return-object p0
.end method

.method public data(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/Connection;
    .registers 5
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 131
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection;->req:Lorg/jsoup/Connection$Request;

    invoke-static {p1, p2}, Lorg/jsoup/helper/HttpConnection$KeyVal;->create(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/helper/HttpConnection$KeyVal;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/jsoup/Connection$Request;->data(Lorg/jsoup/Connection$KeyVal;)Lorg/jsoup/Connection$Request;

    .line 132
    return-object p0
.end method

.method public data(Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)Lorg/jsoup/Connection;
    .registers 6
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "filename"    # Ljava/lang/String;
    .param p3, "inputStream"    # Ljava/io/InputStream;

    .prologue
    .line 136
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection;->req:Lorg/jsoup/Connection$Request;

    invoke-static {p1, p2, p3}, Lorg/jsoup/helper/HttpConnection$KeyVal;->create(Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)Lorg/jsoup/helper/HttpConnection$KeyVal;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/jsoup/Connection$Request;->data(Lorg/jsoup/Connection$KeyVal;)Lorg/jsoup/Connection$Request;

    .line 137
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
    .line 162
    .local p1, "data":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/jsoup/Connection$KeyVal;>;"
    const-string v1, "Data collection must not be null"

    invoke-static {p1, v1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 163
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_9
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1b

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/Connection$KeyVal;

    .line 164
    .local v0, "entry":Lorg/jsoup/Connection$KeyVal;
    iget-object v2, p0, Lorg/jsoup/helper/HttpConnection;->req:Lorg/jsoup/Connection$Request;

    invoke-interface {v2, v0}, Lorg/jsoup/Connection$Request;->data(Lorg/jsoup/Connection$KeyVal;)Lorg/jsoup/Connection$Request;

    goto :goto_9

    .line 166
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
    .line 141
    .local p1, "data":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v1, "Data map must not be null"

    invoke-static {p1, v1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 142
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_d
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2f

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 143
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v4, p0, Lorg/jsoup/helper/HttpConnection;->req:Lorg/jsoup/Connection$Request;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v1, v2}, Lorg/jsoup/helper/HttpConnection$KeyVal;->create(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/helper/HttpConnection$KeyVal;

    move-result-object v1

    invoke-interface {v4, v1}, Lorg/jsoup/Connection$Request;->data(Lorg/jsoup/Connection$KeyVal;)Lorg/jsoup/Connection$Request;

    goto :goto_d

    .line 145
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_2f
    return-object p0
.end method

.method public varargs data([Ljava/lang/String;)Lorg/jsoup/Connection;
    .registers 7
    .param p1, "keyvals"    # [Ljava/lang/String;

    .prologue
    .line 149
    const-string v3, "Data key value pairs must not be null"

    invoke-static {p1, v3}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 150
    array-length v3, p1

    rem-int/lit8 v3, v3, 0x2

    if-nez v3, :cond_30

    const/4 v3, 0x1

    :goto_b
    const-string v4, "Must supply an even number of key value pairs"

    invoke-static {v3, v4}, Lorg/jsoup/helper/Validate;->isTrue(ZLjava/lang/String;)V

    .line 151
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_11
    array-length v3, p1

    if-ge v0, v3, :cond_32

    .line 152
    aget-object v1, p1, v0

    .line 153
    .local v1, "key":Ljava/lang/String;
    add-int/lit8 v3, v0, 0x1

    aget-object v2, p1, v3

    .line 154
    .local v2, "value":Ljava/lang/String;
    const-string v3, "Data key must not be empty"

    invoke-static {v1, v3}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;Ljava/lang/String;)V

    .line 155
    const-string v3, "Data value must not be null"

    invoke-static {v2, v3}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 156
    iget-object v3, p0, Lorg/jsoup/helper/HttpConnection;->req:Lorg/jsoup/Connection$Request;

    invoke-static {v1, v2}, Lorg/jsoup/helper/HttpConnection$KeyVal;->create(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/helper/HttpConnection$KeyVal;

    move-result-object v4

    invoke-interface {v3, v4}, Lorg/jsoup/Connection$Request;->data(Lorg/jsoup/Connection$KeyVal;)Lorg/jsoup/Connection$Request;

    .line 151
    add-int/lit8 v0, v0, 0x2

    goto :goto_11

    .line 150
    .end local v0    # "i":I
    .end local v1    # "key":Ljava/lang/String;
    .end local v2    # "value":Ljava/lang/String;
    :cond_30
    const/4 v3, 0x0

    goto :goto_b

    .line 158
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
    .line 205
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection;->req:Lorg/jsoup/Connection$Request;

    invoke-static {v0}, Lorg/jsoup/helper/HttpConnection$Response;->execute(Lorg/jsoup/Connection$Request;)Lorg/jsoup/helper/HttpConnection$Response;

    move-result-object v0

    iput-object v0, p0, Lorg/jsoup/helper/HttpConnection;->res:Lorg/jsoup/Connection$Response;

    .line 206
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection;->res:Lorg/jsoup/Connection$Response;

    return-object v0
.end method

.method public followRedirects(Z)Lorg/jsoup/Connection;
    .registers 3
    .param p1, "followRedirects"    # Z

    .prologue
    .line 100
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection;->req:Lorg/jsoup/Connection$Request;

    invoke-interface {v0, p1}, Lorg/jsoup/Connection$Request;->followRedirects(Z)Lorg/jsoup/Connection$Request;

    .line 101
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
    .line 193
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection;->req:Lorg/jsoup/Connection$Request;

    sget-object v1, Lorg/jsoup/Connection$Method;->GET:Lorg/jsoup/Connection$Method;

    invoke-interface {v0, v1}, Lorg/jsoup/Connection$Request;->method(Lorg/jsoup/Connection$Method;)Lorg/jsoup/Connection$Base;

    .line 194
    invoke-virtual {p0}, Lorg/jsoup/helper/HttpConnection;->execute()Lorg/jsoup/Connection$Response;

    .line 195
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
    .line 170
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection;->req:Lorg/jsoup/Connection$Request;

    invoke-interface {v0, p1, p2}, Lorg/jsoup/Connection$Request;->header(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/Connection$Base;

    .line 171
    return-object p0
.end method

.method public ignoreContentType(Z)Lorg/jsoup/Connection;
    .registers 3
    .param p1, "ignoreContentType"    # Z

    .prologue
    .line 121
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection;->req:Lorg/jsoup/Connection$Request;

    invoke-interface {v0, p1}, Lorg/jsoup/Connection$Request;->ignoreContentType(Z)Lorg/jsoup/Connection$Request;

    .line 122
    return-object p0
.end method

.method public ignoreHttpErrors(Z)Lorg/jsoup/Connection;
    .registers 3
    .param p1, "ignoreHttpErrors"    # Z

    .prologue
    .line 116
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection;->req:Lorg/jsoup/Connection$Request;

    invoke-interface {v0, p1}, Lorg/jsoup/Connection$Request;->ignoreHttpErrors(Z)Lorg/jsoup/Connection$Request;

    .line 117
    return-object p0
.end method

.method public maxBodySize(I)Lorg/jsoup/Connection;
    .registers 3
    .param p1, "bytes"    # I

    .prologue
    .line 95
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection;->req:Lorg/jsoup/Connection$Request;

    invoke-interface {v0, p1}, Lorg/jsoup/Connection$Request;->maxBodySize(I)Lorg/jsoup/Connection$Request;

    .line 96
    return-object p0
.end method

.method public method(Lorg/jsoup/Connection$Method;)Lorg/jsoup/Connection;
    .registers 3
    .param p1, "method"    # Lorg/jsoup/Connection$Method;

    .prologue
    .line 111
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection;->req:Lorg/jsoup/Connection$Request;

    invoke-interface {v0, p1}, Lorg/jsoup/Connection$Request;->method(Lorg/jsoup/Connection$Method;)Lorg/jsoup/Connection$Base;

    .line 112
    return-object p0
.end method

.method public parser(Lorg/jsoup/parser/Parser;)Lorg/jsoup/Connection;
    .registers 3
    .param p1, "parser"    # Lorg/jsoup/parser/Parser;

    .prologue
    .line 188
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection;->req:Lorg/jsoup/Connection$Request;

    invoke-interface {v0, p1}, Lorg/jsoup/Connection$Request;->parser(Lorg/jsoup/parser/Parser;)Lorg/jsoup/Connection$Request;

    .line 189
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
    .line 199
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection;->req:Lorg/jsoup/Connection$Request;

    sget-object v1, Lorg/jsoup/Connection$Method;->POST:Lorg/jsoup/Connection$Method;

    invoke-interface {v0, v1}, Lorg/jsoup/Connection$Request;->method(Lorg/jsoup/Connection$Method;)Lorg/jsoup/Connection$Base;

    .line 200
    invoke-virtual {p0}, Lorg/jsoup/helper/HttpConnection;->execute()Lorg/jsoup/Connection$Response;

    .line 201
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection;->res:Lorg/jsoup/Connection$Response;

    invoke-interface {v0}, Lorg/jsoup/Connection$Response;->parse()Lorg/jsoup/nodes/Document;

    move-result-object v0

    return-object v0
.end method

.method public postDataCharset(Ljava/lang/String;)Lorg/jsoup/Connection;
    .registers 3
    .param p1, "charset"    # Ljava/lang/String;

    .prologue
    .line 228
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection;->req:Lorg/jsoup/Connection$Request;

    invoke-interface {v0, p1}, Lorg/jsoup/Connection$Request;->postDataCharset(Ljava/lang/String;)Lorg/jsoup/Connection$Request;

    .line 229
    return-object p0
.end method

.method public referrer(Ljava/lang/String;)Lorg/jsoup/Connection;
    .registers 4
    .param p1, "referrer"    # Ljava/lang/String;

    .prologue
    .line 105
    const-string v0, "Referrer must not be null"

    invoke-static {p1, v0}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 106
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection;->req:Lorg/jsoup/Connection$Request;

    const-string v1, "Referer"

    invoke-interface {v0, v1, p1}, Lorg/jsoup/Connection$Request;->header(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/Connection$Base;

    .line 107
    return-object p0
.end method

.method public request()Lorg/jsoup/Connection$Request;
    .registers 2

    .prologue
    .line 210
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection;->req:Lorg/jsoup/Connection$Request;

    return-object v0
.end method

.method public request(Lorg/jsoup/Connection$Request;)Lorg/jsoup/Connection;
    .registers 2
    .param p1, "request"    # Lorg/jsoup/Connection$Request;

    .prologue
    .line 214
    iput-object p1, p0, Lorg/jsoup/helper/HttpConnection;->req:Lorg/jsoup/Connection$Request;

    .line 215
    return-object p0
.end method

.method public response()Lorg/jsoup/Connection$Response;
    .registers 2

    .prologue
    .line 219
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection;->res:Lorg/jsoup/Connection$Response;

    return-object v0
.end method

.method public response(Lorg/jsoup/Connection$Response;)Lorg/jsoup/Connection;
    .registers 2
    .param p1, "response"    # Lorg/jsoup/Connection$Response;

    .prologue
    .line 223
    iput-object p1, p0, Lorg/jsoup/helper/HttpConnection;->res:Lorg/jsoup/Connection$Response;

    .line 224
    return-object p0
.end method

.method public timeout(I)Lorg/jsoup/Connection;
    .registers 3
    .param p1, "millis"    # I

    .prologue
    .line 90
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection;->req:Lorg/jsoup/Connection$Request;

    invoke-interface {v0, p1}, Lorg/jsoup/Connection$Request;->timeout(I)Lorg/jsoup/Connection$Request;

    .line 91
    return-object p0
.end method

.method public url(Ljava/lang/String;)Lorg/jsoup/Connection;
    .registers 6
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 74
    const-string v1, "Must supply a valid URL"

    invoke-static {p1, v1}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    :try_start_5
    iget-object v1, p0, Lorg/jsoup/helper/HttpConnection;->req:Lorg/jsoup/Connection$Request;

    new-instance v2, Ljava/net/URL;

    invoke-static {p1}, Lorg/jsoup/helper/HttpConnection;->encodeUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-interface {v1, v2}, Lorg/jsoup/Connection$Request;->url(Ljava/net/URL;)Lorg/jsoup/Connection$Base;
    :try_end_13
    .catch Ljava/net/MalformedURLException; {:try_start_5 .. :try_end_13} :catch_14

    .line 80
    return-object p0

    .line 77
    :catch_14
    move-exception v0

    .line 78
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
    .line 69
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection;->req:Lorg/jsoup/Connection$Request;

    invoke-interface {v0, p1}, Lorg/jsoup/Connection$Request;->url(Ljava/net/URL;)Lorg/jsoup/Connection$Base;

    .line 70
    return-object p0
.end method

.method public userAgent(Ljava/lang/String;)Lorg/jsoup/Connection;
    .registers 4
    .param p1, "userAgent"    # Ljava/lang/String;

    .prologue
    .line 84
    const-string v0, "User agent must not be null"

    invoke-static {p1, v0}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 85
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection;->req:Lorg/jsoup/Connection$Request;

    const-string v1, "User-Agent"

    invoke-interface {v0, v1, p1}, Lorg/jsoup/Connection$Request;->header(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/Connection$Base;

    .line 86
    return-object p0
.end method

.method public validateTLSCertificates(Z)Lorg/jsoup/Connection;
    .registers 3
    .param p1, "value"    # Z

    .prologue
    .line 126
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection;->req:Lorg/jsoup/Connection$Request;

    invoke-interface {v0, p1}, Lorg/jsoup/Connection$Request;->validateTLSCertificates(Z)V

    .line 127
    return-object p0
.end method
