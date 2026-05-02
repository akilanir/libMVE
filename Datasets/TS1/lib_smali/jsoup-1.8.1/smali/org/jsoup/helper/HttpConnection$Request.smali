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

.field private timeoutMilliseconds:I


# direct methods
.method private constructor <init>()V
    .registers 4

    .prologue
    const/4 v1, 0x0

    .line 325
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/jsoup/helper/HttpConnection$Base;-><init>(Lorg/jsoup/helper/HttpConnection$1;)V

    .line 321
    iput-boolean v1, p0, Lorg/jsoup/helper/HttpConnection$Request;->ignoreHttpErrors:Z

    .line 322
    iput-boolean v1, p0, Lorg/jsoup/helper/HttpConnection$Request;->ignoreContentType:Z

    .line 326
    const/16 v0, 0xbb8

    iput v0, p0, Lorg/jsoup/helper/HttpConnection$Request;->timeoutMilliseconds:I

    .line 327
    const/high16 v0, 0x100000

    iput v0, p0, Lorg/jsoup/helper/HttpConnection$Request;->maxBodySizeBytes:I

    .line 328
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/jsoup/helper/HttpConnection$Request;->followRedirects:Z

    .line 329
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jsoup/helper/HttpConnection$Request;->data:Ljava/util/Collection;

    .line 330
    sget-object v0, Lorg/jsoup/Connection$Method;->GET:Lorg/jsoup/Connection$Method;

    iput-object v0, p0, Lorg/jsoup/helper/HttpConnection$Request;->method:Lorg/jsoup/Connection$Method;

    .line 331
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection$Request;->headers:Ljava/util/Map;

    const-string v1, "Accept-Encoding"

    const-string v2, "gzip"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 332
    invoke-static {}, Lorg/jsoup/parser/Parser;->htmlParser()Lorg/jsoup/parser/Parser;

    move-result-object v0

    iput-object v0, p0, Lorg/jsoup/helper/HttpConnection$Request;->parser:Lorg/jsoup/parser/Parser;

    .line 333
    return-void
.end method

.method synthetic constructor <init>(Lorg/jsoup/helper/HttpConnection$1;)V
    .registers 2
    .param p1, "x0"    # Lorg/jsoup/helper/HttpConnection$1;

    .prologue
    .line 316
    invoke-direct {p0}, Lorg/jsoup/helper/HttpConnection$Request;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic cookie(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 316
    invoke-super {p0, p1}, Lorg/jsoup/helper/HttpConnection$Base;->cookie(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic cookies()Ljava/util/Map;
    .registers 2

    .prologue
    .line 316
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
    .line 389
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection$Request;->data:Ljava/util/Collection;

    return-object v0
.end method

.method public bridge synthetic data(Lorg/jsoup/Connection$KeyVal;)Lorg/jsoup/Connection$Request;
    .registers 3
    .param p1, "x0"    # Lorg/jsoup/Connection$KeyVal;

    .prologue
    .line 316
    invoke-virtual {p0, p1}, Lorg/jsoup/helper/HttpConnection$Request;->data(Lorg/jsoup/Connection$KeyVal;)Lorg/jsoup/helper/HttpConnection$Request;

    move-result-object v0

    return-object v0
.end method

.method public data(Lorg/jsoup/Connection$KeyVal;)Lorg/jsoup/helper/HttpConnection$Request;
    .registers 3
    .param p1, "keyval"    # Lorg/jsoup/Connection$KeyVal;

    .prologue
    .line 383
    const-string v0, "Key val must not be null"

    invoke-static {p1, v0}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 384
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection$Request;->data:Ljava/util/Collection;

    invoke-interface {v0, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 385
    return-object p0
.end method

.method public followRedirects(Z)Lorg/jsoup/Connection$Request;
    .registers 2
    .param p1, "followRedirects"    # Z

    .prologue
    .line 360
    iput-boolean p1, p0, Lorg/jsoup/helper/HttpConnection$Request;->followRedirects:Z

    .line 361
    return-object p0
.end method

.method public followRedirects()Z
    .registers 2

    .prologue
    .line 356
    iget-boolean v0, p0, Lorg/jsoup/helper/HttpConnection$Request;->followRedirects:Z

    return v0
.end method

.method public bridge synthetic hasCookie(Ljava/lang/String;)Z
    .registers 3
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 316
    invoke-super {p0, p1}, Lorg/jsoup/helper/HttpConnection$Base;->hasCookie(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic hasHeader(Ljava/lang/String;)Z
    .registers 3
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 316
    invoke-super {p0, p1}, Lorg/jsoup/helper/HttpConnection$Base;->hasHeader(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic header(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 316
    invoke-super {p0, p1}, Lorg/jsoup/helper/HttpConnection$Base;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic headers()Ljava/util/Map;
    .registers 2

    .prologue
    .line 316
    invoke-super {p0}, Lorg/jsoup/helper/HttpConnection$Base;->headers()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public ignoreContentType(Z)Lorg/jsoup/Connection$Request;
    .registers 2
    .param p1, "ignoreContentType"    # Z

    .prologue
    .line 378
    iput-boolean p1, p0, Lorg/jsoup/helper/HttpConnection$Request;->ignoreContentType:Z

    .line 379
    return-object p0
.end method

.method public ignoreContentType()Z
    .registers 2

    .prologue
    .line 374
    iget-boolean v0, p0, Lorg/jsoup/helper/HttpConnection$Request;->ignoreContentType:Z

    return v0
.end method

.method public ignoreHttpErrors(Z)Lorg/jsoup/Connection$Request;
    .registers 2
    .param p1, "ignoreHttpErrors"    # Z

    .prologue
    .line 369
    iput-boolean p1, p0, Lorg/jsoup/helper/HttpConnection$Request;->ignoreHttpErrors:Z

    .line 370
    return-object p0
.end method

.method public ignoreHttpErrors()Z
    .registers 2

    .prologue
    .line 365
    iget-boolean v0, p0, Lorg/jsoup/helper/HttpConnection$Request;->ignoreHttpErrors:Z

    return v0
.end method

.method public maxBodySize()I
    .registers 2

    .prologue
    .line 346
    iget v0, p0, Lorg/jsoup/helper/HttpConnection$Request;->maxBodySizeBytes:I

    return v0
.end method

.method public maxBodySize(I)Lorg/jsoup/Connection$Request;
    .registers 4
    .param p1, "bytes"    # I

    .prologue
    .line 350
    if-ltz p1, :cond_b

    const/4 v0, 0x1

    :goto_3
    const-string v1, "maxSize must be 0 (unlimited) or larger"

    invoke-static {v0, v1}, Lorg/jsoup/helper/Validate;->isTrue(ZLjava/lang/String;)V

    .line 351
    iput p1, p0, Lorg/jsoup/helper/HttpConnection$Request;->maxBodySizeBytes:I

    .line 352
    return-object p0

    .line 350
    :cond_b
    const/4 v0, 0x0

    goto :goto_3
.end method

.method public bridge synthetic method()Lorg/jsoup/Connection$Method;
    .registers 2

    .prologue
    .line 316
    invoke-super {p0}, Lorg/jsoup/helper/HttpConnection$Base;->method()Lorg/jsoup/Connection$Method;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic parser(Lorg/jsoup/parser/Parser;)Lorg/jsoup/Connection$Request;
    .registers 3
    .param p1, "x0"    # Lorg/jsoup/parser/Parser;

    .prologue
    .line 316
    invoke-virtual {p0, p1}, Lorg/jsoup/helper/HttpConnection$Request;->parser(Lorg/jsoup/parser/Parser;)Lorg/jsoup/helper/HttpConnection$Request;

    move-result-object v0

    return-object v0
.end method

.method public parser(Lorg/jsoup/parser/Parser;)Lorg/jsoup/helper/HttpConnection$Request;
    .registers 2
    .param p1, "parser"    # Lorg/jsoup/parser/Parser;

    .prologue
    .line 393
    iput-object p1, p0, Lorg/jsoup/helper/HttpConnection$Request;->parser:Lorg/jsoup/parser/Parser;

    .line 394
    return-object p0
.end method

.method public parser()Lorg/jsoup/parser/Parser;
    .registers 2

    .prologue
    .line 398
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection$Request;->parser:Lorg/jsoup/parser/Parser;

    return-object v0
.end method

.method public timeout()I
    .registers 2

    .prologue
    .line 336
    iget v0, p0, Lorg/jsoup/helper/HttpConnection$Request;->timeoutMilliseconds:I

    return v0
.end method

.method public bridge synthetic timeout(I)Lorg/jsoup/Connection$Request;
    .registers 3
    .param p1, "x0"    # I

    .prologue
    .line 316
    invoke-virtual {p0, p1}, Lorg/jsoup/helper/HttpConnection$Request;->timeout(I)Lorg/jsoup/helper/HttpConnection$Request;

    move-result-object v0

    return-object v0
.end method

.method public timeout(I)Lorg/jsoup/helper/HttpConnection$Request;
    .registers 4
    .param p1, "millis"    # I

    .prologue
    .line 340
    if-ltz p1, :cond_b

    const/4 v0, 0x1

    :goto_3
    const-string v1, "Timeout milliseconds must be 0 (infinite) or greater"

    invoke-static {v0, v1}, Lorg/jsoup/helper/Validate;->isTrue(ZLjava/lang/String;)V

    .line 341
    iput p1, p0, Lorg/jsoup/helper/HttpConnection$Request;->timeoutMilliseconds:I

    .line 342
    return-object p0

    .line 340
    :cond_b
    const/4 v0, 0x0

    goto :goto_3
.end method

.method public bridge synthetic url()Ljava/net/URL;
    .registers 2

    .prologue
    .line 316
    invoke-super {p0}, Lorg/jsoup/helper/HttpConnection$Base;->url()Ljava/net/URL;

    move-result-object v0

    return-object v0
.end method
