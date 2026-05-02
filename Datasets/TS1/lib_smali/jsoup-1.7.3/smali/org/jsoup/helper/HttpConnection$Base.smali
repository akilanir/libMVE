.class abstract Lorg/jsoup/helper/HttpConnection$Base;
.super Ljava/lang/Object;
.source "HttpConnection.java"

# interfaces
.implements Lorg/jsoup/Connection$Base;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jsoup/helper/HttpConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40a
    name = "Base"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lorg/jsoup/Connection$Base;",
        ">",
        "Ljava/lang/Object;",
        "Lorg/jsoup/Connection$Base",
        "<TT;>;"
    }
.end annotation


# instance fields
.field cookies:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field headers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field method:Lorg/jsoup/Connection$Method;

.field url:Ljava/net/URL;


# direct methods
.method private constructor <init>()V
    .registers 2

    .prologue
    .line 207
    .local p0, "this":Lorg/jsoup/helper/HttpConnection$Base;, "Lorg/jsoup/helper/HttpConnection$Base<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 208
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lorg/jsoup/helper/HttpConnection$Base;->headers:Ljava/util/Map;

    .line 209
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lorg/jsoup/helper/HttpConnection$Base;->cookies:Ljava/util/Map;

    .line 210
    return-void
.end method

.method synthetic constructor <init>(Lorg/jsoup/helper/HttpConnection$1;)V
    .registers 2
    .param p1, "x0"    # Lorg/jsoup/helper/HttpConnection$1;

    .prologue
    .line 201
    .local p0, "this":Lorg/jsoup/helper/HttpConnection$Base;, "Lorg/jsoup/helper/HttpConnection$Base<TT;>;"
    invoke-direct {p0}, Lorg/jsoup/helper/HttpConnection$Base;-><init>()V

    return-void
.end method

.method private getHeaderCaseInsensitive(Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 263
    .local p0, "this":Lorg/jsoup/helper/HttpConnection$Base;, "Lorg/jsoup/helper/HttpConnection$Base<TT;>;"
    const-string v2, "Header name must not be null"

    invoke-static {p1, v2}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 265
    iget-object v2, p0, Lorg/jsoup/helper/HttpConnection$Base;->headers:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 266
    .local v1, "value":Ljava/lang/String;
    if-nez v1, :cond_1b

    .line 267
    iget-object v2, p0, Lorg/jsoup/helper/HttpConnection$Base;->headers:Ljava/util/Map;

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "value":Ljava/lang/String;
    check-cast v1, Ljava/lang/String;

    .line 268
    .restart local v1    # "value":Ljava/lang/String;
    :cond_1b
    if-nez v1, :cond_29

    .line 269
    invoke-direct {p0, p1}, Lorg/jsoup/helper/HttpConnection$Base;->scanHeaders(Ljava/lang/String;)Ljava/util/Map$Entry;

    move-result-object v0

    .line 270
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz v0, :cond_29

    .line 271
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "value":Ljava/lang/String;
    check-cast v1, Ljava/lang/String;

    .line 273
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v1    # "value":Ljava/lang/String;
    :cond_29
    return-object v1
.end method

.method private scanHeaders(Ljava/lang/String;)Ljava/util/Map$Entry;
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map$Entry",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 277
    .local p0, "this":Lorg/jsoup/helper/HttpConnection$Base;, "Lorg/jsoup/helper/HttpConnection$Base<TT;>;"
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    .line 278
    .local v2, "lc":Ljava/lang/String;
    iget-object v3, p0, Lorg/jsoup/helper/HttpConnection$Base;->headers:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2b

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 279
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_e

    .line 282
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :goto_2a
    return-object v0

    :cond_2b
    const/4 v0, 0x0

    goto :goto_2a
.end method


# virtual methods
.method public cookie(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 286
    .local p0, "this":Lorg/jsoup/helper/HttpConnection$Base;, "Lorg/jsoup/helper/HttpConnection$Base<TT;>;"
    const-string v0, "Cookie name must not be null"

    invoke-static {p1, v0}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 287
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection$Base;->cookies:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public cookie(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/Connection$Base;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 291
    .local p0, "this":Lorg/jsoup/helper/HttpConnection$Base;, "Lorg/jsoup/helper/HttpConnection$Base<TT;>;"
    const-string v0, "Cookie name must not be empty"

    invoke-static {p1, v0}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;Ljava/lang/String;)V

    .line 292
    const-string v0, "Cookie value must not be null"

    invoke-static {p2, v0}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 293
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection$Base;->cookies:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 294
    return-object p0
.end method

.method public cookies()Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 309
    .local p0, "this":Lorg/jsoup/helper/HttpConnection$Base;, "Lorg/jsoup/helper/HttpConnection$Base<TT;>;"
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection$Base;->cookies:Ljava/util/Map;

    return-object v0
.end method

.method public hasCookie(Ljava/lang/String;)Z
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 298
    .local p0, "this":Lorg/jsoup/helper/HttpConnection$Base;, "Lorg/jsoup/helper/HttpConnection$Base<TT;>;"
    const-string v0, "Cookie name must not be empty"

    invoke-static {v0}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 299
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection$Base;->cookies:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public hasHeader(Ljava/lang/String;)Z
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 246
    .local p0, "this":Lorg/jsoup/helper/HttpConnection$Base;, "Lorg/jsoup/helper/HttpConnection$Base<TT;>;"
    const-string v0, "Header name must not be empty"

    invoke-static {p1, v0}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;Ljava/lang/String;)V

    .line 247
    invoke-direct {p0, p1}, Lorg/jsoup/helper/HttpConnection$Base;->getHeaderCaseInsensitive(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_d

    const/4 v0, 0x1

    :goto_c
    return v0

    :cond_d
    const/4 v0, 0x0

    goto :goto_c
.end method

.method public header(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 233
    .local p0, "this":Lorg/jsoup/helper/HttpConnection$Base;, "Lorg/jsoup/helper/HttpConnection$Base<TT;>;"
    const-string v0, "Header name must not be null"

    invoke-static {p1, v0}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 234
    invoke-direct {p0, p1}, Lorg/jsoup/helper/HttpConnection$Base;->getHeaderCaseInsensitive(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public header(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/Connection$Base;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 238
    .local p0, "this":Lorg/jsoup/helper/HttpConnection$Base;, "Lorg/jsoup/helper/HttpConnection$Base<TT;>;"
    const-string v0, "Header name must not be empty"

    invoke-static {p1, v0}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;Ljava/lang/String;)V

    .line 239
    const-string v0, "Header value must not be null"

    invoke-static {p2, v0}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 240
    invoke-virtual {p0, p1}, Lorg/jsoup/helper/HttpConnection$Base;->removeHeader(Ljava/lang/String;)Lorg/jsoup/Connection$Base;

    .line 241
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection$Base;->headers:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 242
    return-object p0
.end method

.method public headers()Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 259
    .local p0, "this":Lorg/jsoup/helper/HttpConnection$Base;, "Lorg/jsoup/helper/HttpConnection$Base<TT;>;"
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection$Base;->headers:Ljava/util/Map;

    return-object v0
.end method

.method public method(Lorg/jsoup/Connection$Method;)Lorg/jsoup/Connection$Base;
    .registers 3
    .param p1, "method"    # Lorg/jsoup/Connection$Method;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jsoup/Connection$Method;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 227
    .local p0, "this":Lorg/jsoup/helper/HttpConnection$Base;, "Lorg/jsoup/helper/HttpConnection$Base<TT;>;"
    const-string v0, "Method must not be null"

    invoke-static {p1, v0}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 228
    iput-object p1, p0, Lorg/jsoup/helper/HttpConnection$Base;->method:Lorg/jsoup/Connection$Method;

    .line 229
    return-object p0
.end method

.method public method()Lorg/jsoup/Connection$Method;
    .registers 2

    .prologue
    .line 223
    .local p0, "this":Lorg/jsoup/helper/HttpConnection$Base;, "Lorg/jsoup/helper/HttpConnection$Base<TT;>;"
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection$Base;->method:Lorg/jsoup/Connection$Method;

    return-object v0
.end method

.method public removeCookie(Ljava/lang/String;)Lorg/jsoup/Connection$Base;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 303
    .local p0, "this":Lorg/jsoup/helper/HttpConnection$Base;, "Lorg/jsoup/helper/HttpConnection$Base<TT;>;"
    const-string v0, "Cookie name must not be empty"

    invoke-static {v0}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 304
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection$Base;->cookies:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 305
    return-object p0
.end method

.method public removeHeader(Ljava/lang/String;)Lorg/jsoup/Connection$Base;
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 251
    .local p0, "this":Lorg/jsoup/helper/HttpConnection$Base;, "Lorg/jsoup/helper/HttpConnection$Base<TT;>;"
    const-string v1, "Header name must not be empty"

    invoke-static {p1, v1}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;Ljava/lang/String;)V

    .line 252
    invoke-direct {p0, p1}, Lorg/jsoup/helper/HttpConnection$Base;->scanHeaders(Ljava/lang/String;)Ljava/util/Map$Entry;

    move-result-object v0

    .line 253
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz v0, :cond_14

    .line 254
    iget-object v1, p0, Lorg/jsoup/helper/HttpConnection$Base;->headers:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 255
    :cond_14
    return-object p0
.end method

.method public url()Ljava/net/URL;
    .registers 2

    .prologue
    .line 213
    .local p0, "this":Lorg/jsoup/helper/HttpConnection$Base;, "Lorg/jsoup/helper/HttpConnection$Base<TT;>;"
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection$Base;->url:Ljava/net/URL;

    return-object v0
.end method

.method public url(Ljava/net/URL;)Lorg/jsoup/Connection$Base;
    .registers 3
    .param p1, "url"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/URL;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 217
    .local p0, "this":Lorg/jsoup/helper/HttpConnection$Base;, "Lorg/jsoup/helper/HttpConnection$Base<TT;>;"
    const-string v0, "URL must not be null"

    invoke-static {p1, v0}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 218
    iput-object p1, p0, Lorg/jsoup/helper/HttpConnection$Base;->url:Ljava/net/URL;

    .line 219
    return-object p0
.end method
