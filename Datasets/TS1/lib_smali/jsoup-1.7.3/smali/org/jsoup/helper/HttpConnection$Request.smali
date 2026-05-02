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

    .line 322
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/jsoup/helper/HttpConnection$Base;-><init>(Lorg/jsoup/helper/HttpConnection$1;)V

    .line 318
    iput-boolean v1, p0, Lorg/jsoup/helper/HttpConnection$Request;->ignoreHttpErrors:Z

    .line 319
    iput-boolean v1, p0, Lorg/jsoup/helper/HttpConnection$Request;->ignoreContentType:Z

    .line 323
    const/16 v0, 0xbb8

    iput v0, p0, Lorg/jsoup/helper/HttpConnection$Request;->timeoutMilliseconds:I

    .line 324
    const/high16 v0, 0x100000

    iput v0, p0, Lorg/jsoup/helper/HttpConnection$Request;->maxBodySizeBytes:I

    .line 325
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/jsoup/helper/HttpConnection$Request;->followRedirects:Z

    .line 326
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jsoup/helper/HttpConnection$Request;->data:Ljava/util/Collection;

    .line 327
    sget-object v0, Lorg/jsoup/Connection$Method;->GET:Lorg/jsoup/Connection$Method;

    iput-object v0, p0, Lorg/jsoup/helper/HttpConnection$Request;->method:Lorg/jsoup/Connection$Method;

    .line 328
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection$Request;->headers:Ljava/util/Map;

    const-string v1, "Accept-Encoding"

    const-string v2, "gzip"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 329
    invoke-static {}, Lorg/jsoup/parser/Parser;->htmlParser()Lorg/jsoup/parser/Parser;

    move-result-object v0

    iput-object v0, p0, Lorg/jsoup/helper/HttpConnection$Request;->parser:Lorg/jsoup/parser/Parser;

    .line 330
    return-void
.end method

.method synthetic constructor <init>(Lorg/jsoup/helper/HttpConnection$1;)V
    .registers 2
    .param p1, "x0"    # Lorg/jsoup/helper/HttpConnection$1;

    .prologue
    .line 313
    invoke-direct {p0}, Lorg/jsoup/helper/HttpConnection$Request;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic cookie(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 313
    invoke-super {p0, p1}, Lorg/jsoup/helper/HttpConnection$Base;->cookie(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic cookies()Ljava/util/Map;
    .registers 2

    .prologue
    .line 313
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
    .line 386
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection$Request;->data:Ljava/util/Collection;

    return-object v0
.end method

.method public bridge synthetic data(Lorg/jsoup/Connection$KeyVal;)Lorg/jsoup/Connection$Request;
    .registers 3
    .param p1, "x0"    # Lorg/jsoup/Connection$KeyVal;

    .prologue
    .line 313
    invoke-virtual {p0, p1}, Lorg/jsoup/helper/HttpConnection$Request;->data(Lorg/jsoup/Connection$KeyVal;)Lorg/jsoup/helper/HttpConnection$Request;

    move-result-object v0

    return-object v0
.end method

.method public data(Lorg/jsoup/Connection$KeyVal;)Lorg/jsoup/helper/HttpConnection$Request;
    .registers 3
    .param p1, "keyval"    # Lorg/jsoup/Connection$KeyVal;

    .prologue
    .line 380
    const-string v0, "Key val must not be null"

    invoke-static {p1, v0}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 381
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection$Request;->data:Ljava/util/Collection;

    invoke-interface {v0, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 382
    return-object p0
.end method

.method public followRedirects(Z)Lorg/jsoup/Connection$Request;
    .registers 2
    .param p1, "followRedirects"    # Z

    .prologue
    .line 357
    iput-boolean p1, p0, Lorg/jsoup/helper/HttpConnection$Request;->followRedirects:Z

    .line 358
    return-object p0
.end method

.method public followRedirects()Z
    .registers 2

    .prologue
    .line 353
    iget-boolean v0, p0, Lorg/jsoup/helper/HttpConnection$Request;->followRedirects:Z

    return v0
.end method

.method public bridge synthetic hasCookie(Ljava/lang/String;)Z
    .registers 3
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 313
    invoke-super {p0, p1}, Lorg/jsoup/helper/HttpConnection$Base;->hasCookie(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic hasHeader(Ljava/lang/String;)Z
    .registers 3
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 313
    invoke-super {p0, p1}, Lorg/jsoup/helper/HttpConnection$Base;->hasHeader(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic header(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 313
    invoke-super {p0, p1}, Lorg/jsoup/helper/HttpConnection$Base;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic headers()Ljava/util/Map;
    .registers 2

    .prologue
    .line 313
    invoke-super {p0}, Lorg/jsoup/helper/HttpConnection$Base;->headers()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public ignoreContentType(Z)Lorg/jsoup/Connection$Request;
    .registers 2
    .param p1, "ignoreContentType"    # Z

    .prologue
    .line 375
    iput-boolean p1, p0, Lorg/jsoup/helper/HttpConnection$Request;->ignoreContentType:Z

    .line 376
    return-object p0
.end method

.method public ignoreContentType()Z
    .registers 2

    .prologue
    .line 371
    iget-boolean v0, p0, Lorg/jsoup/helper/HttpConnection$Request;->ignoreContentType:Z

    return v0
.end method

.method public ignoreHttpErrors(Z)Lorg/jsoup/Connection$Request;
    .registers 2
    .param p1, "ignoreHttpErrors"    # Z

    .prologue
    .line 366
    iput-boolean p1, p0, Lorg/jsoup/helper/HttpConnection$Request;->ignoreHttpErrors:Z

    .line 367
    return-object p0
.end method

.method public ignoreHttpErrors()Z
    .registers 2

    .prologue
    .line 362
    iget-boolean v0, p0, Lorg/jsoup/helper/HttpConnection$Request;->ignoreHttpErrors:Z

    return v0
.end method

.method public maxBodySize()I
    .registers 2

    .prologue
    .line 343
    iget v0, p0, Lorg/jsoup/helper/HttpConnection$Request;->maxBodySizeBytes:I

    return v0
.end method

.method public maxBodySize(I)Lorg/jsoup/Connection$Request;
    .registers 4
    .param p1, "bytes"    # I

    .prologue
    .line 347
    if-ltz p1, :cond_b

    const/4 v0, 0x1

    :goto_3
    const-string v1, "maxSize must be 0 (unlimited) or larger"

    invoke-static {v0, v1}, Lorg/jsoup/helper/Validate;->isTrue(ZLjava/lang/String;)V

    .line 348
    iput p1, p0, Lorg/jsoup/helper/HttpConnection$Request;->maxBodySizeBytes:I

    .line 349
    return-object p0

    .line 347
    :cond_b
    const/4 v0, 0x0

    goto :goto_3
.end method

.method public bridge synthetic method()Lorg/jsoup/Connection$Method;
    .registers 2

    .prologue
    .line 313
    invoke-super {p0}, Lorg/jsoup/helper/HttpConnection$Base;->method()Lorg/jsoup/Connection$Method;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic parser(Lorg/jsoup/parser/Parser;)Lorg/jsoup/Connection$Request;
    .registers 3
    .param p1, "x0"    # Lorg/jsoup/parser/Parser;

    .prologue
    .line 313
    invoke-virtual {p0, p1}, Lorg/jsoup/helper/HttpConnection$Request;->parser(Lorg/jsoup/parser/Parser;)Lorg/jsoup/helper/HttpConnection$Request;

    move-result-object v0

    return-object v0
.end method

.method public parser(Lorg/jsoup/parser/Parser;)Lorg/jsoup/helper/HttpConnection$Request;
    .registers 2
    .param p1, "parser"    # Lorg/jsoup/parser/Parser;

    .prologue
    .line 390
    iput-object p1, p0, Lorg/jsoup/helper/HttpConnection$Request;->parser:Lorg/jsoup/parser/Parser;

    .line 391
    return-object p0
.end method

.method public parser()Lorg/jsoup/parser/Parser;
    .registers 2

    .prologue
    .line 395
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection$Request;->parser:Lorg/jsoup/parser/Parser;

    return-object v0
.end method

.method public timeout()I
    .registers 2

    .prologue
    .line 333
    iget v0, p0, Lorg/jsoup/helper/HttpConnection$Request;->timeoutMilliseconds:I

    return v0
.end method

.method public bridge synthetic timeout(I)Lorg/jsoup/Connection$Request;
    .registers 3
    .param p1, "x0"    # I

    .prologue
    .line 313
    invoke-virtual {p0, p1}, Lorg/jsoup/helper/HttpConnection$Request;->timeout(I)Lorg/jsoup/helper/HttpConnection$Request;

    move-result-object v0

    return-object v0
.end method

.method public timeout(I)Lorg/jsoup/helper/HttpConnection$Request;
    .registers 4
    .param p1, "millis"    # I

    .prologue
    .line 337
    if-ltz p1, :cond_b

    const/4 v0, 0x1

    :goto_3
    const-string v1, "Timeout milliseconds must be 0 (infinite) or greater"

    invoke-static {v0, v1}, Lorg/jsoup/helper/Validate;->isTrue(ZLjava/lang/String;)V

    .line 338
    iput p1, p0, Lorg/jsoup/helper/HttpConnection$Request;->timeoutMilliseconds:I

    .line 339
    return-object p0

    .line 337
    :cond_b
    const/4 v0, 0x0

    goto :goto_3
.end method

.method public bridge synthetic url()Ljava/net/URL;
    .registers 2

    .prologue
    .line 313
    invoke-super {p0}, Lorg/jsoup/helper/HttpConnection$Base;->url()Ljava/net/URL;

    move-result-object v0

    return-object v0
.end method
