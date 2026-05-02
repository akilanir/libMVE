.class public Lorg/jsoup/helper/HttpConnection$Response;
.super Lorg/jsoup/helper/HttpConnection$Base;
.source "HttpConnection.java"

# interfaces
.implements Lorg/jsoup/Connection$Response;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jsoup/helper/HttpConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Response"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/jsoup/helper/HttpConnection$Base",
        "<",
        "Lorg/jsoup/Connection$Response;",
        ">;",
        "Lorg/jsoup/Connection$Response;"
    }
.end annotation


# static fields
.field private static final MAX_REDIRECTS:I = 0x14

.field private static final xmlContentTypeRxp:Ljava/util/regex/Pattern;


# instance fields
.field private byteData:Ljava/nio/ByteBuffer;

.field private charset:Ljava/lang/String;

.field private contentType:Ljava/lang/String;

.field private executed:Z

.field private numRedirects:I

.field private req:Lorg/jsoup/Connection$Request;

.field private statusCode:I

.field private statusMessage:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 418
    const-string v0, "application/\\w+\\+xml.*"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/jsoup/helper/HttpConnection$Response;->xmlContentTypeRxp:Ljava/util/regex/Pattern;

    return-void
.end method

.method constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 421
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/jsoup/helper/HttpConnection$Base;-><init>(Lorg/jsoup/helper/HttpConnection$1;)V

    .line 409
    iput-boolean v1, p0, Lorg/jsoup/helper/HttpConnection$Response;->executed:Z

    .line 410
    iput v1, p0, Lorg/jsoup/helper/HttpConnection$Response;->numRedirects:I

    .line 422
    return-void
.end method

.method private constructor <init>(Lorg/jsoup/helper/HttpConnection$Response;)V
    .registers 7
    .param p1, "previousResponse"    # Lorg/jsoup/helper/HttpConnection$Response;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 425
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/jsoup/helper/HttpConnection$Base;-><init>(Lorg/jsoup/helper/HttpConnection$1;)V

    .line 409
    iput-boolean v4, p0, Lorg/jsoup/helper/HttpConnection$Response;->executed:Z

    .line 410
    iput v4, p0, Lorg/jsoup/helper/HttpConnection$Response;->numRedirects:I

    .line 426
    if-eqz p1, :cond_2c

    .line 427
    iget v0, p1, Lorg/jsoup/helper/HttpConnection$Response;->numRedirects:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/jsoup/helper/HttpConnection$Response;->numRedirects:I

    .line 428
    iget v0, p0, Lorg/jsoup/helper/HttpConnection$Response;->numRedirects:I

    const/16 v1, 0x14

    if-lt v0, v1, :cond_2c

    .line 429
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Too many redirects occurred trying to load URL %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {p1}, Lorg/jsoup/helper/HttpConnection$Response;->url()Ljava/net/URL;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 431
    :cond_2c
    return-void
.end method

.method private static createConnection(Lorg/jsoup/Connection$Request;)Ljava/net/HttpURLConnection;
    .registers 6
    .param p0, "req"    # Lorg/jsoup/Connection$Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 557
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->url()Ljava/net/URL;

    move-result-object v3

    invoke-virtual {v3}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    .line 558
    .local v0, "conn":Ljava/net/HttpURLConnection;
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->method()Lorg/jsoup/Connection$Method;

    move-result-object v3

    invoke-virtual {v3}, Lorg/jsoup/Connection$Method;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 559
    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    .line 560
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->timeout()I

    move-result v3

    invoke-virtual {v0, v3}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 561
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->timeout()I

    move-result v3

    invoke-virtual {v0, v3}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 562
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->method()Lorg/jsoup/Connection$Method;

    move-result-object v3

    sget-object v4, Lorg/jsoup/Connection$Method;->POST:Lorg/jsoup/Connection$Method;

    if-ne v3, v4, :cond_33

    .line 563
    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 564
    :cond_33
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->cookies()Ljava/util/Map;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Map;->size()I

    move-result v3

    if-lez v3, :cond_46

    .line 565
    const-string v3, "Cookie"

    invoke-static {p0}, Lorg/jsoup/helper/HttpConnection$Response;->getRequestCookieString(Lorg/jsoup/Connection$Request;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Ljava/net/HttpURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 566
    :cond_46
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->headers()Ljava/util/Map;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_52
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_6e

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 567
    .local v1, "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v0, v3, v4}, Ljava/net/HttpURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_52

    .line 569
    .end local v1    # "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_6e
    return-object v0
.end method

.method static execute(Lorg/jsoup/Connection$Request;)Lorg/jsoup/helper/HttpConnection$Response;
    .registers 2
    .param p0, "req"    # Lorg/jsoup/Connection$Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 434
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/jsoup/helper/HttpConnection$Response;->execute(Lorg/jsoup/Connection$Request;Lorg/jsoup/helper/HttpConnection$Response;)Lorg/jsoup/helper/HttpConnection$Response;

    move-result-object v0

    return-object v0
.end method

.method static execute(Lorg/jsoup/Connection$Request;Lorg/jsoup/helper/HttpConnection$Response;)Lorg/jsoup/helper/HttpConnection$Response;
    .registers 16
    .param p0, "req"    # Lorg/jsoup/Connection$Request;
    .param p1, "previousResponse"    # Lorg/jsoup/helper/HttpConnection$Response;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 438
    const-string v11, "Request must not be null"

    invoke-static {p0, v11}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 439
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->url()Ljava/net/URL;

    move-result-object v11

    invoke-virtual {v11}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v8

    .line 440
    .local v8, "protocol":Ljava/lang/String;
    const-string v11, "http"

    invoke-virtual {v8, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_25

    const-string v11, "https"

    invoke-virtual {v8, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_25

    .line 441
    new-instance v11, Ljava/net/MalformedURLException;

    const-string v12, "Only http & https protocols supported"

    invoke-direct {v11, v12}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 444
    :cond_25
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->method()Lorg/jsoup/Connection$Method;

    move-result-object v11

    sget-object v12, Lorg/jsoup/Connection$Method;->GET:Lorg/jsoup/Connection$Method;

    if-ne v11, v12, :cond_3a

    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->data()Ljava/util/Collection;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/Collection;->size()I

    move-result v11

    if-lez v11, :cond_3a

    .line 445
    invoke-static {p0}, Lorg/jsoup/helper/HttpConnection$Response;->serialiseRequestUrl(Lorg/jsoup/Connection$Request;)V

    .line 446
    :cond_3a
    invoke-static {p0}, Lorg/jsoup/helper/HttpConnection$Response;->createConnection(Lorg/jsoup/Connection$Request;)Ljava/net/HttpURLConnection;

    move-result-object v1

    .line 449
    .local v1, "conn":Ljava/net/HttpURLConnection;
    :try_start_3e
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->connect()V

    .line 450
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->method()Lorg/jsoup/Connection$Method;

    move-result-object v11

    sget-object v12, Lorg/jsoup/Connection$Method;->POST:Lorg/jsoup/Connection$Method;

    if-ne v11, v12, :cond_54

    .line 451
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->data()Ljava/util/Collection;

    move-result-object v11

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v12

    invoke-static {v11, v12}, Lorg/jsoup/helper/HttpConnection$Response;->writePost(Ljava/util/Collection;Ljava/io/OutputStream;)V

    .line 453
    :cond_54
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v10

    .line 454
    .local v10, "status":I
    const/4 v7, 0x0

    .line 455
    .local v7, "needsRedirect":Z
    const/16 v11, 0xc8

    if-eq v10, v11, :cond_6e

    .line 456
    const/16 v11, 0x12e

    if-eq v10, v11, :cond_6d

    const/16 v11, 0x12d

    if-eq v10, v11, :cond_6d

    const/16 v11, 0x12f

    if-eq v10, v11, :cond_6d

    const/16 v11, 0x133

    if-ne v10, v11, :cond_e3

    .line 457
    :cond_6d
    const/4 v7, 0x1

    .line 461
    :cond_6e
    new-instance v9, Lorg/jsoup/helper/HttpConnection$Response;

    invoke-direct {v9, p1}, Lorg/jsoup/helper/HttpConnection$Response;-><init>(Lorg/jsoup/helper/HttpConnection$Response;)V

    .line 462
    .local v9, "res":Lorg/jsoup/helper/HttpConnection$Response;
    invoke-direct {v9, v1, p1}, Lorg/jsoup/helper/HttpConnection$Response;->setupFromConnection(Ljava/net/HttpURLConnection;Lorg/jsoup/Connection$Response;)V

    .line 463
    if-eqz v7, :cond_101

    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->followRedirects()Z

    move-result v11

    if-eqz v11, :cond_101

    .line 464
    sget-object v11, Lorg/jsoup/Connection$Method;->GET:Lorg/jsoup/Connection$Method;

    invoke-interface {p0, v11}, Lorg/jsoup/Connection$Request;->method(Lorg/jsoup/Connection$Method;)Lorg/jsoup/Connection$Base;

    .line 465
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->data()Ljava/util/Collection;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/Collection;->clear()V

    .line 467
    const-string v11, "Location"

    invoke-virtual {v9, v11}, Lorg/jsoup/helper/HttpConnection$Response;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 468
    .local v6, "location":Ljava/lang/String;
    if-eqz v6, :cond_a8

    const-string v11, "http:/"

    invoke-virtual {v6, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_a8

    const/4 v11, 0x6

    invoke-virtual {v6, v11}, Ljava/lang/String;->charAt(I)C

    move-result v11

    const/16 v12, 0x2f

    if-eq v11, v12, :cond_a8

    .line 469
    const/4 v11, 0x6

    invoke-virtual {v6, v11}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    .line 470
    :cond_a8
    new-instance v11, Ljava/net/URL;

    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->url()Ljava/net/URL;

    move-result-object v12

    # invokes: Lorg/jsoup/helper/HttpConnection;->encodeUrl(Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v6}, Lorg/jsoup/helper/HttpConnection;->access$200(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-direct {v11, v12, v13}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    invoke-interface {p0, v11}, Lorg/jsoup/Connection$Request;->url(Ljava/net/URL;)Lorg/jsoup/Connection$Base;

    .line 472
    iget-object v11, v9, Lorg/jsoup/helper/HttpConnection$Response;->cookies:Ljava/util/Map;

    invoke-interface {v11}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "i$":Ljava/util/Iterator;
    :goto_c2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_f9

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 473
    .local v3, "cookie":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    invoke-interface {p0, v11, v12}, Lorg/jsoup/Connection$Request;->cookie(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/Connection$Base;
    :try_end_dd
    .catchall {:try_start_3e .. :try_end_dd} :catchall_de

    goto :goto_c2

    .line 507
    .end local v3    # "cookie":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v5    # "i$":Ljava/util/Iterator;
    .end local v6    # "location":Ljava/lang/String;
    .end local v7    # "needsRedirect":Z
    .end local v9    # "res":Lorg/jsoup/helper/HttpConnection$Response;
    .end local v10    # "status":I
    :catchall_de
    move-exception v11

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    throw v11

    .line 458
    .restart local v7    # "needsRedirect":Z
    .restart local v10    # "status":I
    :cond_e3
    :try_start_e3
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->ignoreHttpErrors()Z

    move-result v11

    if-nez v11, :cond_6e

    .line 459
    new-instance v11, Lorg/jsoup/HttpStatusException;

    const-string v12, "HTTP error fetching URL"

    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->url()Ljava/net/URL;

    move-result-object v13

    invoke-virtual {v13}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v11, v12, v10, v13}, Lorg/jsoup/HttpStatusException;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    throw v11

    .line 475
    .restart local v5    # "i$":Ljava/util/Iterator;
    .restart local v6    # "location":Ljava/lang/String;
    .restart local v9    # "res":Lorg/jsoup/helper/HttpConnection$Response;
    :cond_f9
    invoke-static {p0, v9}, Lorg/jsoup/helper/HttpConnection$Response;->execute(Lorg/jsoup/Connection$Request;Lorg/jsoup/helper/HttpConnection$Response;)Lorg/jsoup/helper/HttpConnection$Response;
    :try_end_fc
    .catchall {:try_start_e3 .. :try_end_fc} :catchall_de

    move-result-object v9

    .line 507
    .end local v9    # "res":Lorg/jsoup/helper/HttpConnection$Response;
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 511
    .end local v5    # "i$":Ljava/util/Iterator;
    .end local v6    # "location":Ljava/lang/String;
    :goto_100
    return-object v9

    .line 477
    .restart local v9    # "res":Lorg/jsoup/helper/HttpConnection$Response;
    :cond_101
    :try_start_101
    iput-object p0, v9, Lorg/jsoup/helper/HttpConnection$Response;->req:Lorg/jsoup/Connection$Request;

    .line 480
    invoke-virtual {v9}, Lorg/jsoup/helper/HttpConnection$Response;->contentType()Ljava/lang/String;

    move-result-object v2

    .line 481
    .local v2, "contentType":Ljava/lang/String;
    if-eqz v2, :cond_13b

    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->ignoreContentType()Z

    move-result v11

    if-nez v11, :cond_13b

    const-string v11, "text/"

    invoke-virtual {v2, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_13b

    const-string v11, "application/xml"

    invoke-virtual {v2, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_13b

    sget-object v11, Lorg/jsoup/helper/HttpConnection$Response;->xmlContentTypeRxp:Ljava/util/regex/Pattern;

    invoke-virtual {v11, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v11

    invoke-virtual {v11}, Ljava/util/regex/Matcher;->matches()Z

    move-result v11

    if-nez v11, :cond_13b

    .line 487
    new-instance v11, Lorg/jsoup/UnsupportedMimeTypeException;

    const-string v12, "Unhandled content type. Must be text/*, application/xml, or application/xhtml+xml"

    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->url()Ljava/net/URL;

    move-result-object v13

    invoke-virtual {v13}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v11, v12, v2, v13}, Lorg/jsoup/UnsupportedMimeTypeException;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    throw v11
    :try_end_13b
    .catchall {:try_start_101 .. :try_end_13b} :catchall_de

    .line 490
    :cond_13b
    const/4 v0, 0x0

    .line 491
    .local v0, "bodyStream":Ljava/io/InputStream;
    const/4 v4, 0x0

    .line 493
    .local v4, "dataStream":Ljava/io/InputStream;
    :try_start_13d
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object v11

    if-eqz v11, :cond_18c

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object v4

    .line 494
    :goto_147
    const-string v11, "Content-Encoding"

    invoke-virtual {v9, v11}, Lorg/jsoup/helper/HttpConnection$Response;->hasHeader(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_191

    const-string v11, "Content-Encoding"

    invoke-virtual {v9, v11}, Lorg/jsoup/helper/HttpConnection$Response;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const-string v12, "gzip"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_191

    new-instance v11, Ljava/io/BufferedInputStream;

    new-instance v12, Ljava/util/zip/GZIPInputStream;

    invoke-direct {v12, v4}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v11, v12}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    move-object v0, v11

    .line 498
    :goto_168
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->maxBodySize()I

    move-result v11

    invoke-static {v0, v11}, Lorg/jsoup/helper/DataUtil;->readToByteBuffer(Ljava/io/InputStream;I)Ljava/nio/ByteBuffer;

    move-result-object v11

    iput-object v11, v9, Lorg/jsoup/helper/HttpConnection$Response;->byteData:Ljava/nio/ByteBuffer;

    .line 499
    iget-object v11, v9, Lorg/jsoup/helper/HttpConnection$Response;->contentType:Ljava/lang/String;

    invoke-static {v11}, Lorg/jsoup/helper/DataUtil;->getCharsetFromContentType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    iput-object v11, v9, Lorg/jsoup/helper/HttpConnection$Response;->charset:Ljava/lang/String;
    :try_end_17a
    .catchall {:try_start_13d .. :try_end_17a} :catchall_198

    .line 501
    if-eqz v0, :cond_17f

    :try_start_17c
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 502
    :cond_17f
    if-eqz v4, :cond_184

    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_184
    .catchall {:try_start_17c .. :try_end_184} :catchall_de

    .line 507
    :cond_184
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 510
    const/4 v11, 0x1

    iput-boolean v11, v9, Lorg/jsoup/helper/HttpConnection$Response;->executed:Z

    goto/16 :goto_100

    .line 493
    :cond_18c
    :try_start_18c
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v4

    goto :goto_147

    .line 494
    :cond_191
    new-instance v11, Ljava/io/BufferedInputStream;

    invoke-direct {v11, v4}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_196
    .catchall {:try_start_18c .. :try_end_196} :catchall_198

    move-object v0, v11

    goto :goto_168

    .line 501
    :catchall_198
    move-exception v11

    if-eqz v0, :cond_19e

    :try_start_19b
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 502
    :cond_19e
    if-eqz v4, :cond_1a3

    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    :cond_1a3
    throw v11
    :try_end_1a4
    .catchall {:try_start_19b .. :try_end_1a4} :catchall_de
.end method

.method private static getRequestCookieString(Lorg/jsoup/Connection$Request;)Ljava/lang/String;
    .registers 7
    .param p0, "req"    # Lorg/jsoup/Connection$Request;

    .prologue
    .line 637
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 638
    .local v3, "sb":Ljava/lang/StringBuilder;
    const/4 v1, 0x1

    .line 639
    .local v1, "first":Z
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->cookies()Ljava/util/Map;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_12
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_41

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 640
    .local v0, "cookie":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    if-nez v1, :cond_3f

    .line 641
    const-string v4, "; "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 644
    :goto_25
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v5, 0x3d

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_12

    .line 643
    :cond_3f
    const/4 v1, 0x0

    goto :goto_25

    .line 647
    .end local v0    # "cookie":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_41
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method private static serialiseRequestUrl(Lorg/jsoup/Connection$Request;)V
    .registers 9
    .param p0, "req"    # Lorg/jsoup/Connection$Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 652
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->url()Ljava/net/URL;

    move-result-object v2

    .line 653
    .local v2, "in":Ljava/net/URL;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 654
    .local v4, "url":Ljava/lang/StringBuilder;
    const/4 v0, 0x1

    .line 656
    .local v0, "first":Z
    invoke-virtual {v2}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "://"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v2}, Ljava/net/URL;->getAuthority()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v2}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "?"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 662
    invoke-virtual {v2}, Ljava/net/URL;->getQuery()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_3b

    .line 663
    invoke-virtual {v2}, Ljava/net/URL;->getQuery()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 664
    const/4 v0, 0x0

    .line 666
    :cond_3b
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->data()Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_43
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_7a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jsoup/Connection$KeyVal;

    .line 667
    .local v3, "keyVal":Lorg/jsoup/Connection$KeyVal;
    if-nez v0, :cond_78

    .line 668
    const/16 v5, 0x26

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 671
    :goto_56
    invoke-interface {v3}, Lorg/jsoup/Connection$KeyVal;->key()Ljava/lang/String;

    move-result-object v5

    const-string v6, "UTF-8"

    invoke-static {v5, v6}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/16 v6, 0x3d

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface {v3}, Lorg/jsoup/Connection$KeyVal;->value()Ljava/lang/String;

    move-result-object v6

    const-string v7, "UTF-8"

    invoke-static {v6, v7}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_43

    .line 670
    :cond_78
    const/4 v0, 0x0

    goto :goto_56

    .line 676
    .end local v3    # "keyVal":Lorg/jsoup/Connection$KeyVal;
    :cond_7a
    new-instance v5, Ljava/net/URL;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-interface {p0, v5}, Lorg/jsoup/Connection$Request;->url(Ljava/net/URL;)Lorg/jsoup/Connection$Base;

    .line 677
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->data()Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Collection;->clear()V

    .line 678
    return-void
.end method

.method private setupFromConnection(Ljava/net/HttpURLConnection;Lorg/jsoup/Connection$Response;)V
    .registers 8
    .param p1, "conn"    # Ljava/net/HttpURLConnection;
    .param p2, "previousResponse"    # Lorg/jsoup/Connection$Response;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 574
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getRequestMethod()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lorg/jsoup/Connection$Method;->valueOf(Ljava/lang/String;)Lorg/jsoup/Connection$Method;

    move-result-object v3

    iput-object v3, p0, Lorg/jsoup/helper/HttpConnection$Response;->method:Lorg/jsoup/Connection$Method;

    .line 575
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getURL()Ljava/net/URL;

    move-result-object v3

    iput-object v3, p0, Lorg/jsoup/helper/HttpConnection$Response;->url:Ljava/net/URL;

    .line 576
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v3

    iput v3, p0, Lorg/jsoup/helper/HttpConnection$Response;->statusCode:I

    .line 577
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getResponseMessage()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lorg/jsoup/helper/HttpConnection$Response;->statusMessage:Ljava/lang/String;

    .line 578
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getContentType()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lorg/jsoup/helper/HttpConnection$Response;->contentType:Ljava/lang/String;

    .line 580
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getHeaderFields()Ljava/util/Map;

    move-result-object v2

    .line 581
    .local v2, "resHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-virtual {p0, v2}, Lorg/jsoup/helper/HttpConnection$Response;->processResponseHeaders(Ljava/util/Map;)V

    .line 584
    if-eqz p2, :cond_5f

    .line 585
    invoke-interface {p2}, Lorg/jsoup/Connection$Response;->cookies()Ljava/util/Map;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_37
    :goto_37
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 586
    .local v1, "prevCookie":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {p0, v3}, Lorg/jsoup/helper/HttpConnection$Response;->hasCookie(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_37

    .line 587
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {p0, v3, v4}, Lorg/jsoup/helper/HttpConnection$Response;->cookie(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/Connection$Base;

    goto :goto_37

    .line 590
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "prevCookie":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_5f
    return-void
.end method

.method private static writePost(Ljava/util/Collection;Ljava/io/OutputStream;)V
    .registers 8
    .param p1, "outputStream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lorg/jsoup/Connection$KeyVal;",
            ">;",
            "Ljava/io/OutputStream;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 621
    .local p0, "data":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/jsoup/Connection$KeyVal;>;"
    new-instance v3, Ljava/io/OutputStreamWriter;

    const-string v4, "UTF-8"

    invoke-direct {v3, p1, v4}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 622
    .local v3, "w":Ljava/io/OutputStreamWriter;
    const/4 v0, 0x1

    .line 623
    .local v0, "first":Z
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_c
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_41

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jsoup/Connection$KeyVal;

    .line 624
    .local v2, "keyVal":Lorg/jsoup/Connection$KeyVal;
    if-nez v0, :cond_3f

    .line 625
    const/16 v4, 0x26

    invoke-virtual {v3, v4}, Ljava/io/OutputStreamWriter;->append(C)Ljava/io/Writer;

    .line 629
    :goto_1f
    invoke-interface {v2}, Lorg/jsoup/Connection$KeyVal;->key()Ljava/lang/String;

    move-result-object v4

    const-string v5, "UTF-8"

    invoke-static {v4, v5}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 630
    const/16 v4, 0x3d

    invoke-virtual {v3, v4}, Ljava/io/OutputStreamWriter;->write(I)V

    .line 631
    invoke-interface {v2}, Lorg/jsoup/Connection$KeyVal;->value()Ljava/lang/String;

    move-result-object v4

    const-string v5, "UTF-8"

    invoke-static {v4, v5}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    goto :goto_c

    .line 627
    :cond_3f
    const/4 v0, 0x0

    goto :goto_1f

    .line 633
    .end local v2    # "keyVal":Lorg/jsoup/Connection$KeyVal;
    :cond_41
    invoke-virtual {v3}, Ljava/io/OutputStreamWriter;->close()V

    .line 634
    return-void
.end method


# virtual methods
.method public body()Ljava/lang/String;
    .registers 4

    .prologue
    .line 539
    iget-boolean v1, p0, Lorg/jsoup/helper/HttpConnection$Response;->executed:Z

    const-string v2, "Request must be executed (with .execute(), .get(), or .post() before getting response body"

    invoke-static {v1, v2}, Lorg/jsoup/helper/Validate;->isTrue(ZLjava/lang/String;)V

    .line 542
    iget-object v1, p0, Lorg/jsoup/helper/HttpConnection$Response;->charset:Ljava/lang/String;

    if-nez v1, :cond_21

    .line 543
    const-string v1, "UTF-8"

    invoke-static {v1}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v1

    iget-object v2, p0, Lorg/jsoup/helper/HttpConnection$Response;->byteData:Ljava/nio/ByteBuffer;

    invoke-virtual {v1, v2}, Ljava/nio/charset/Charset;->decode(Ljava/nio/ByteBuffer;)Ljava/nio/CharBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/CharBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 546
    .local v0, "body":Ljava/lang/String;
    :goto_1b
    iget-object v1, p0, Lorg/jsoup/helper/HttpConnection$Response;->byteData:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 547
    return-object v0

    .line 545
    .end local v0    # "body":Ljava/lang/String;
    :cond_21
    iget-object v1, p0, Lorg/jsoup/helper/HttpConnection$Response;->charset:Ljava/lang/String;

    invoke-static {v1}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v1

    iget-object v2, p0, Lorg/jsoup/helper/HttpConnection$Response;->byteData:Ljava/nio/ByteBuffer;

    invoke-virtual {v1, v2}, Ljava/nio/charset/Charset;->decode(Ljava/nio/ByteBuffer;)Ljava/nio/CharBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/CharBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "body":Ljava/lang/String;
    goto :goto_1b
.end method

.method public bodyAsBytes()[B
    .registers 3

    .prologue
    .line 551
    iget-boolean v0, p0, Lorg/jsoup/helper/HttpConnection$Response;->executed:Z

    const-string v1, "Request must be executed (with .execute(), .get(), or .post() before getting response body"

    invoke-static {v0, v1}, Lorg/jsoup/helper/Validate;->isTrue(ZLjava/lang/String;)V

    .line 552
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection$Response;->byteData:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    return-object v0
.end method

.method public charset()Ljava/lang/String;
    .registers 2

    .prologue
    .line 523
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection$Response;->charset:Ljava/lang/String;

    return-object v0
.end method

.method public contentType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 527
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection$Response;->contentType:Ljava/lang/String;

    return-object v0
.end method

.method public bridge synthetic cookie(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 402
    invoke-super {p0, p1}, Lorg/jsoup/helper/HttpConnection$Base;->cookie(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic cookies()Ljava/util/Map;
    .registers 2

    .prologue
    .line 402
    invoke-super {p0}, Lorg/jsoup/helper/HttpConnection$Base;->cookies()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic hasCookie(Ljava/lang/String;)Z
    .registers 3
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 402
    invoke-super {p0, p1}, Lorg/jsoup/helper/HttpConnection$Base;->hasCookie(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic hasHeader(Ljava/lang/String;)Z
    .registers 3
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 402
    invoke-super {p0, p1}, Lorg/jsoup/helper/HttpConnection$Base;->hasHeader(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic header(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 402
    invoke-super {p0, p1}, Lorg/jsoup/helper/HttpConnection$Base;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic headers()Ljava/util/Map;
    .registers 2

    .prologue
    .line 402
    invoke-super {p0}, Lorg/jsoup/helper/HttpConnection$Base;->headers()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic method()Lorg/jsoup/Connection$Method;
    .registers 2

    .prologue
    .line 402
    invoke-super {p0}, Lorg/jsoup/helper/HttpConnection$Base;->method()Lorg/jsoup/Connection$Method;

    move-result-object v0

    return-object v0
.end method

.method public parse()Lorg/jsoup/nodes/Document;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 531
    iget-boolean v1, p0, Lorg/jsoup/helper/HttpConnection$Response;->executed:Z

    const-string v2, "Request must be executed (with .execute(), .get(), or .post() before parsing response"

    invoke-static {v1, v2}, Lorg/jsoup/helper/Validate;->isTrue(ZLjava/lang/String;)V

    .line 532
    iget-object v1, p0, Lorg/jsoup/helper/HttpConnection$Response;->byteData:Ljava/nio/ByteBuffer;

    iget-object v2, p0, Lorg/jsoup/helper/HttpConnection$Response;->charset:Ljava/lang/String;

    iget-object v3, p0, Lorg/jsoup/helper/HttpConnection$Response;->url:Ljava/net/URL;

    invoke-virtual {v3}, Ljava/net/URL;->toExternalForm()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lorg/jsoup/helper/HttpConnection$Response;->req:Lorg/jsoup/Connection$Request;

    invoke-interface {v4}, Lorg/jsoup/Connection$Request;->parser()Lorg/jsoup/parser/Parser;

    move-result-object v4

    invoke-static {v1, v2, v3, v4}, Lorg/jsoup/helper/DataUtil;->parseByteData(Ljava/nio/ByteBuffer;Ljava/lang/String;Ljava/lang/String;Lorg/jsoup/parser/Parser;)Lorg/jsoup/nodes/Document;

    move-result-object v0

    .line 533
    .local v0, "doc":Lorg/jsoup/nodes/Document;
    iget-object v1, p0, Lorg/jsoup/helper/HttpConnection$Response;->byteData:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 534
    invoke-virtual {v0}, Lorg/jsoup/nodes/Document;->outputSettings()Lorg/jsoup/nodes/Document$OutputSettings;

    move-result-object v1

    invoke-virtual {v1}, Lorg/jsoup/nodes/Document$OutputSettings;->charset()Ljava/nio/charset/Charset;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/jsoup/helper/HttpConnection$Response;->charset:Ljava/lang/String;

    .line 535
    return-object v0
.end method

.method processResponseHeaders(Ljava/util/Map;)V
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 593
    .local p1, "resHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_8
    :goto_8
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_76

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 594
    .local v3, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 595
    .local v6, "name":Ljava/lang/String;
    if-eqz v6, :cond_8

    .line 598
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/List;

    .line 599
    .local v8, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v9, "Set-Cookie"

    invoke-virtual {v6, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_65

    .line 600
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "i$":Ljava/util/Iterator;
    :cond_2e
    :goto_2e
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_8

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 601
    .local v7, "value":Ljava/lang/String;
    if-eqz v7, :cond_2e

    .line 603
    new-instance v0, Lorg/jsoup/parser/TokenQueue;

    invoke-direct {v0, v7}, Lorg/jsoup/parser/TokenQueue;-><init>(Ljava/lang/String;)V

    .line 604
    .local v0, "cd":Lorg/jsoup/parser/TokenQueue;
    const-string v9, "="

    invoke-virtual {v0, v9}, Lorg/jsoup/parser/TokenQueue;->chompTo(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 605
    .local v1, "cookieName":Ljava/lang/String;
    const-string v9, ";"

    invoke-virtual {v0, v9}, Lorg/jsoup/parser/TokenQueue;->consumeTo(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 606
    .local v2, "cookieVal":Ljava/lang/String;
    if-nez v2, :cond_59

    .line 607
    const-string v2, ""

    .line 610
    :cond_59
    if-eqz v1, :cond_2e

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v9

    if-lez v9, :cond_2e

    .line 611
    invoke-virtual {p0, v1, v2}, Lorg/jsoup/helper/HttpConnection$Response;->cookie(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/Connection$Base;

    goto :goto_2e

    .line 614
    .end local v0    # "cd":Lorg/jsoup/parser/TokenQueue;
    .end local v1    # "cookieName":Ljava/lang/String;
    .end local v2    # "cookieVal":Ljava/lang/String;
    .end local v5    # "i$":Ljava/util/Iterator;
    .end local v7    # "value":Ljava/lang/String;
    :cond_65
    invoke-interface {v8}, Ljava/util/List;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_8

    .line 615
    const/4 v9, 0x0

    invoke-interface {v8, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    invoke-virtual {p0, v6, v9}, Lorg/jsoup/helper/HttpConnection$Response;->header(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/Connection$Base;

    goto :goto_8

    .line 618
    .end local v3    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    .end local v6    # "name":Ljava/lang/String;
    .end local v8    # "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_76
    return-void
.end method

.method public statusCode()I
    .registers 2

    .prologue
    .line 515
    iget v0, p0, Lorg/jsoup/helper/HttpConnection$Response;->statusCode:I

    return v0
.end method

.method public statusMessage()Ljava/lang/String;
    .registers 2

    .prologue
    .line 519
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection$Response;->statusMessage:Ljava/lang/String;

    return-object v0
.end method

.method public bridge synthetic url()Ljava/net/URL;
    .registers 2

    .prologue
    .line 402
    invoke-super {p0}, Lorg/jsoup/helper/HttpConnection$Base;->url()Ljava/net/URL;

    move-result-object v0

    return-object v0
.end method
