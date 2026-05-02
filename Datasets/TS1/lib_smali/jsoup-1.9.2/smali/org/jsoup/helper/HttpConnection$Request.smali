.class public Lorg/jsoup/helper/HttpConnection$Request;
.super Lorg/jsoup/helper/HttpConnection$Base;
.source "HttpConnection.java"

# interfaces
.implements Lorg/jsoup/Connection$Request;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jsoup/helper/HttpConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Request"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/jsoup/helper/HttpConnection$Base",
        "<",
        "Lorg/jsoup/Connection$Request;",
        ">;",
        "Lorg/jsoup/Connection$Request;"
    }
.end annotation


# instance fields
.field private body:Ljava/lang/String;

.field private data:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Lorg/jsoup/Connection$KeyVal;",
            ">;"
        }
    .end annotation
.end field

.field private followRedirects:Z

.field private ignoreContentType:Z

.field private ignoreHttpErrors:Z

.field private maxBodySizeBytes:I

.field private parser:Lorg/jsoup/parser/Parser;

.field private parserDefined:Z

.field private postDataCharset:Ljava/lang/String;

.field private proxy:Ljava/net/Proxy;

.field private timeoutMilliseconds:I

.field private validateTSLCertificates:Z


# direct methods
.method private constructor <init>()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 388
    invoke-direct {p0, v2}, Lorg/jsoup/helper/HttpConnection$Base;-><init>(Lorg/jsoup/helper/HttpConnection$1;)V

    .line 380
    iput-object v2, p0, Lorg/jsoup/helper/HttpConnection$Request;->body:Ljava/lang/String;

    .line 381
    iput-boolean v0, p0, Lorg/jsoup/helper/HttpConnection$Request;->ignoreHttpErrors:Z

    .line 382
    iput-boolean v0, p0, Lorg/jsoup/helper/HttpConnection$Request;->ignoreContentType:Z

    .line 384
    iput-boolean v0, p0, Lorg/jsoup/helper/HttpConnection$Request;->parserDefined:Z

    .line 385
    iput-boolean v1, p0, Lorg/jsoup/helper/HttpConnection$Request;->validateTSLCertificates:Z

    .line 386
    const-string v0, "UTF-8"

    iput-object v0, p0, Lorg/jsoup/helper/HttpConnection$Request;->postDataCharset:Ljava/lang/String;

    .line 389
    const/16 v0, 0xbb8

    iput v0, p0, Lorg/jsoup/helper/HttpConnection$Request;->timeoutMilliseconds:I

    .line 390
    const/high16 v0, 0x100000

    iput v0, p0, Lorg/jsoup/helper/HttpConnection$Request;->maxBodySizeBytes:I

    .line 391
    iput-boolean v1, p0, Lorg/jsoup/helper/HttpConnection$Request;->followRedirects:Z

    .line 392
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jsoup/helper/HttpConnection$Request;->data:Ljava/util/Collection;

    .line 393
    sget-object v0, Lorg/jsoup/Connection$Method;->GET:Lorg/jsoup/Connection$Method;

    iput-object v0, p0, Lorg/jsoup/helper/HttpConnection$Request;->method:Lorg/jsoup/Connection$Method;

    .line 394
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection$Request;->headers:Ljava/util/Map;

    const-string v1, "Accept-Encoding"

    const-string v2, "gzip"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 395
    invoke-static {}, Lorg/jsoup/parser/Parser;->htmlParser()Lorg/jsoup/parser/Parser;

    move-result-object v0

    iput-object v0, p0, Lorg/jsoup/helper/HttpConnection$Request;->parser:Lorg/jsoup/parser/Parser;

    .line 396
    return-void
.end method

.method synthetic constructor <init>(Lorg/jsoup/helper/HttpConnection$1;)V
    .registers 2
    .param p1, "x0"    # Lorg/jsoup/helper/HttpConnection$1;

    .prologue
    .line 374
    invoke-direct {p0}, Lorg/jsoup/helper/HttpConnection$Request;-><init>()V

    return-void
.end method

.method static synthetic access$300(Lorg/jsoup/helper/HttpConnection$Request;)Z
    .registers 2
    .param p0, "x0"    # Lorg/jsoup/helper/HttpConnection$Request;

    .prologue
    .line 374
    iget-boolean v0, p0, Lorg/jsoup/helper/HttpConnection$Request;->parserDefined:Z

    return v0
.end method


# virtual methods
.method public bridge synthetic cookie(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .prologue
    .line 374
    invoke-super {p0, p1}, Lorg/jsoup/helper/HttpConnection$Base;->cookie(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic cookies()Ljava/util/Map;
    .registers 2

    .prologue
    .line 374
    invoke-super {p0}, Lorg/jsoup/helper/HttpConnection$Base;->cookies()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public data()Ljava/util/Collection;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lorg/jsoup/Connection$KeyVal;",
            ">;"
        }
    .end annotation

    .prologue
    .line 474
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection$Request;->data:Ljava/util/Collection;

    return-object v0
.end method

.method public bridge synthetic data(Lorg/jsoup/Connection$KeyVal;)Lorg/jsoup/Connection$Request;
    .registers 3

    .prologue
    .line 374
    invoke-virtual {p0, p1}, Lorg/jsoup/helper/HttpConnection$Request;->data(Lorg/jsoup/Connection$KeyVal;)Lorg/jsoup/helper/HttpConnection$Request;

    move-result-object v0

    return-object v0
.end method

.method public data(Lorg/jsoup/Connection$KeyVal;)Lorg/jsoup/helper/HttpConnection$Request;
    .registers 3
    .param p1, "keyval"    # Lorg/jsoup/Connection$KeyVal;

    .prologue
    .line 468
    const-string v0, "Key val must not be null"

    invoke-static {p1, v0}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 469
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection$Request;->data:Ljava/util/Collection;

    invoke-interface {v0, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 470
    return-object p0
.end method

.method public followRedirects(Z)Lorg/jsoup/Connection$Request;
    .registers 2
    .param p1, "followRedirects"    # Z

    .prologue
    .line 437
    iput-boolean p1, p0, Lorg/jsoup/helper/HttpConnection$Request;->followRedirects:Z

    .line 438
    return-object p0
.end method

.method public followRedirects()Z
    .registers 2

    .prologue
    .line 433
    iget-boolean v0, p0, Lorg/jsoup/helper/HttpConnection$Request;->followRedirects:Z

    return v0
.end method

.method public bridge synthetic hasCookie(Ljava/lang/String;)Z
    .registers 3

    .prologue
    .line 374
    invoke-super {p0, p1}, Lorg/jsoup/helper/HttpConnection$Base;->hasCookie(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic hasHeader(Ljava/lang/String;)Z
    .registers 3

    .prologue
    .line 374
    invoke-super {p0, p1}, Lorg/jsoup/helper/HttpConnection$Base;->hasHeader(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic hasHeaderWithValue(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 4

    .prologue
    .line 374
    invoke-super {p0, p1, p2}, Lorg/jsoup/helper/HttpConnection$Base;->hasHeaderWithValue(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic header(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .prologue
    .line 374
    invoke-super {p0, p1}, Lorg/jsoup/helper/HttpConnection$Base;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic headers()Ljava/util/Map;
    .registers 2

    .prologue
    .line 374
    invoke-super {p0}, Lorg/jsoup/helper/HttpConnection$Base;->headers()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public ignoreContentType(Z)Lorg/jsoup/Connection$Request;
    .registers 2
    .param p1, "ignoreContentType"    # Z

    .prologue
    .line 463
    iput-boolean p1, p0, Lorg/jsoup/helper/HttpConnection$Request;->ignoreContentType:Z

    .line 464
    return-object p0
.end method

.method public ignoreContentType()Z
    .registers 2

    .prologue
    .line 459
    iget-boolean v0, p0, Lorg/jsoup/helper/HttpConnection$Request;->ignoreContentType:Z

    return v0
.end method

.method public ignoreHttpErrors(Z)Lorg/jsoup/Connection$Request;
    .registers 2
    .param p1, "ignoreHttpErrors"    # Z

    .prologue
    .line 454
    iput-boolean p1, p0, Lorg/jsoup/helper/HttpConnection$Request;->ignoreHttpErrors:Z

    .line 455
    return-object p0
.end method

.method public ignoreHttpErrors()Z
    .registers 2

    .prologue
    .line 442
    iget-boolean v0, p0, Lorg/jsoup/helper/HttpConnection$Request;->ignoreHttpErrors:Z

    return v0
.end method

.method public maxBodySize()I
    .registers 2

    .prologue
    .line 423
    iget v0, p0, Lorg/jsoup/helper/HttpConnection$Request;->maxBodySizeBytes:I

    return v0
.end method

.method public maxBodySize(I)Lorg/jsoup/Connection$Request;
    .registers 4
    .param p1, "bytes"    # I

    .prologue
    .line 427
    if-ltz p1, :cond_b

    const/4 v0, 0x1

    :goto_3
    const-string v1, "maxSize must be 0 (unlimited) or larger"

    invoke-static {v0, v1}, Lorg/jsoup/helper/Validate;->isTrue(ZLjava/lang/String;)V

    .line 428
    iput p1, p0, Lorg/jsoup/helper/HttpConnection$Request;->maxBodySizeBytes:I

    .line 429
    return-object p0

    .line 427
    :cond_b
    const/4 v0, 0x0

    goto :goto_3
.end method

.method public bridge synthetic method()Lorg/jsoup/Connection$Method;
    .registers 2

    .prologue
    .line 374
    invoke-super {p0}, Lorg/jsoup/helper/HttpConnection$Base;->method()Lorg/jsoup/Connection$Method;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic parser(Lorg/jsoup/parser/Parser;)Lorg/jsoup/Connection$Request;
    .registers 3

    .prologue
    .line 374
    invoke-virtual {p0, p1}, Lorg/jsoup/helper/HttpConnection$Request;->parser(Lorg/jsoup/parser/Parser;)Lorg/jsoup/helper/HttpConnection$Request;

    move-result-object v0

    return-object v0
.end method

.method public parser(Lorg/jsoup/parser/Parser;)Lorg/jsoup/helper/HttpConnection$Request;
    .registers 3
    .param p1, "parser"    # Lorg/jsoup/parser/Parser;

    .prologue
    .line 487
    iput-object p1, p0, Lorg/jsoup/helper/HttpConnection$Request;->parser:Lorg/jsoup/parser/Parser;

    .line 488
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/jsoup/helper/HttpConnection$Request;->parserDefined:Z

    .line 489
    return-object p0
.end method

.method public parser()Lorg/jsoup/parser/Parser;
    .registers 2

    .prologue
    .line 493
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection$Request;->parser:Lorg/jsoup/parser/Parser;

    return-object v0
.end method

.method public postDataCharset()Ljava/lang/String;
    .registers 2

    .prologue
    .line 504
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection$Request;->postDataCharset:Ljava/lang/String;

    return-object v0
.end method

.method public postDataCharset(Ljava/lang/String;)Lorg/jsoup/Connection$Request;
    .registers 3
    .param p1, "charset"    # Ljava/lang/String;

    .prologue
    .line 497
    const-string v0, "Charset must not be null"

    invoke-static {p1, v0}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 498
    invoke-static {p1}, Ljava/nio/charset/Charset;->isSupported(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_11

    new-instance v0, Ljava/nio/charset/IllegalCharsetNameException;

    invoke-direct {v0, p1}, Ljava/nio/charset/IllegalCharsetNameException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 499
    :cond_11
    iput-object p1, p0, Lorg/jsoup/helper/HttpConnection$Request;->postDataCharset:Ljava/lang/String;

    .line 500
    return-object p0
.end method

.method public proxy()Ljava/net/Proxy;
    .registers 2

    .prologue
    .line 399
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection$Request;->proxy:Ljava/net/Proxy;

    return-object v0
.end method

.method public bridge synthetic proxy(Ljava/lang/String;I)Lorg/jsoup/Connection$Request;
    .registers 4

    .prologue
    .line 374
    invoke-virtual {p0, p1, p2}, Lorg/jsoup/helper/HttpConnection$Request;->proxy(Ljava/lang/String;I)Lorg/jsoup/helper/HttpConnection$Request;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic proxy(Ljava/net/Proxy;)Lorg/jsoup/Connection$Request;
    .registers 3

    .prologue
    .line 374
    invoke-virtual {p0, p1}, Lorg/jsoup/helper/HttpConnection$Request;->proxy(Ljava/net/Proxy;)Lorg/jsoup/helper/HttpConnection$Request;

    move-result-object v0

    return-object v0
.end method

.method public proxy(Ljava/lang/String;I)Lorg/jsoup/helper/HttpConnection$Request;
    .registers 6
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I

    .prologue
    .line 408
    new-instance v0, Ljava/net/Proxy;

    sget-object v1, Ljava/net/Proxy$Type;->HTTP:Ljava/net/Proxy$Type;

    invoke-static {p1, p2}, Ljava/net/InetSocketAddress;->createUnresolved(Ljava/lang/String;I)Ljava/net/InetSocketAddress;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/net/Proxy;-><init>(Ljava/net/Proxy$Type;Ljava/net/SocketAddress;)V

    iput-object v0, p0, Lorg/jsoup/helper/HttpConnection$Request;->proxy:Ljava/net/Proxy;

    .line 409
    return-object p0
.end method

.method public proxy(Ljava/net/Proxy;)Lorg/jsoup/helper/HttpConnection$Request;
    .registers 2
    .param p1, "proxy"    # Ljava/net/Proxy;

    .prologue
    .line 403
    iput-object p1, p0, Lorg/jsoup/helper/HttpConnection$Request;->proxy:Ljava/net/Proxy;

    .line 404
    return-object p0
.end method

.method public requestBody()Ljava/lang/String;
    .registers 2

    .prologue
    .line 483
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection$Request;->body:Ljava/lang/String;

    return-object v0
.end method

.method public requestBody(Ljava/lang/String;)Lorg/jsoup/Connection$Request;
    .registers 2
    .param p1, "body"    # Ljava/lang/String;

    .prologue
    .line 478
    iput-object p1, p0, Lorg/jsoup/helper/HttpConnection$Request;->body:Ljava/lang/String;

    .line 479
    return-object p0
.end method

.method public timeout()I
    .registers 2

    .prologue
    .line 413
    iget v0, p0, Lorg/jsoup/helper/HttpConnection$Request;->timeoutMilliseconds:I

    return v0
.end method

.method public bridge synthetic timeout(I)Lorg/jsoup/Connection$Request;
    .registers 3

    .prologue
    .line 374
    invoke-virtual {p0, p1}, Lorg/jsoup/helper/HttpConnection$Request;->timeout(I)Lorg/jsoup/helper/HttpConnection$Request;

    move-result-object v0

    return-object v0
.end method

.method public timeout(I)Lorg/jsoup/helper/HttpConnection$Request;
    .registers 4
    .param p1, "millis"    # I

    .prologue
    .line 417
    if-ltz p1, :cond_b

    const/4 v0, 0x1

    :goto_3
    const-string v1, "Timeout milliseconds must be 0 (infinite) or greater"

    invoke-static {v0, v1}, Lorg/jsoup/helper/Validate;->isTrue(ZLjava/lang/String;)V

    .line 418
    iput p1, p0, Lorg/jsoup/helper/HttpConnection$Request;->timeoutMilliseconds:I

    .line 419
    return-object p0

    .line 417
    :cond_b
    const/4 v0, 0x0

    goto :goto_3
.end method

.method public bridge synthetic url()Ljava/net/URL;
    .registers 2

    .prologue
    .line 374
    invoke-super {p0}, Lorg/jsoup/helper/HttpConnection$Base;->url()Ljava/net/URL;

    move-result-object v0

    return-object v0
.end method

.method public validateTLSCertificates(Z)V
    .registers 2
    .param p1, "value"    # Z

    .prologue
    .line 450
    iput-boolean p1, p0, Lorg/jsoup/helper/HttpConnection$Request;->validateTSLCertificates:Z

    .line 451
    return-void
.end method

.method public validateTLSCertificates()Z
    .registers 2

    .prologue
    .line 446
    iget-boolean v0, p0, Lorg/jsoup/helper/HttpConnection$Request;->validateTSLCertificates:Z

    return v0
.end method
