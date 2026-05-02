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
.field private static final LOCATION:Ljava/lang/String; = "Location"

.field private static final MAX_REDIRECTS:I = 0x14

.field private static sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

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
    .line 477
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

    .line 480
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/jsoup/helper/HttpConnection$Base;-><init>(Lorg/jsoup/helper/HttpConnection$1;)V

    .line 468
    iput-boolean v1, p0, Lorg/jsoup/helper/HttpConnection$Response;->executed:Z

    .line 469
    iput v1, p0, Lorg/jsoup/helper/HttpConnection$Response;->numRedirects:I

    .line 481
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

    .line 484
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/jsoup/helper/HttpConnection$Base;-><init>(Lorg/jsoup/helper/HttpConnection$1;)V

    .line 468
    iput-boolean v4, p0, Lorg/jsoup/helper/HttpConnection$Response;->executed:Z

    .line 469
    iput v4, p0, Lorg/jsoup/helper/HttpConnection$Response;->numRedirects:I

    .line 485
    if-eqz p1, :cond_2c

    .line 486
    iget v0, p1, Lorg/jsoup/helper/HttpConnection$Response;->numRedirects:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/jsoup/helper/HttpConnection$Response;->numRedirects:I

    .line 487
    iget v0, p0, Lorg/jsoup/helper/HttpConnection$Response;->numRedirects:I

    const/16 v1, 0x14

    if-lt v0, v1, :cond_2c

    .line 488
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

    .line 490
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
    .line 621
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->url()Ljava/net/URL;

    move-result-object v3

    invoke-virtual {v3}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    .line 623
    .local v0, "conn":Ljava/net/HttpURLConnection;
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->method()Lorg/jsoup/Connection$Method;

    move-result-object v3

    invoke-virtual {v3}, Lorg/jsoup/Connection$Method;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 624
    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    .line 625
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->timeout()I

    move-result v3

    invoke-virtual {v0, v3}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 626
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->timeout()I

    move-result v3

    invoke-virtual {v0, v3}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 628
    instance-of v3, v0, Ljavax/net/ssl/HttpsURLConnection;

    if-eqz v3, :cond_46

    .line 629
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->validateTLSCertificates()Z

    move-result v3

    if-nez v3, :cond_46

    .line 630
    invoke-static {}, Lorg/jsoup/helper/HttpConnection$Response;->initUnSecureTSL()V

    move-object v3, v0

    .line 631
    check-cast v3, Ljavax/net/ssl/HttpsURLConnection;

    sget-object v4, Lorg/jsoup/helper/HttpConnection$Response;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    invoke-virtual {v3, v4}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    move-object v3, v0

    .line 632
    check-cast v3, Ljavax/net/ssl/HttpsURLConnection;

    invoke-static {}, Lorg/jsoup/helper/HttpConnection$Response;->getInsecureVerifier()Ljavax/net/ssl/HostnameVerifier;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 636
    :cond_46
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->method()Lorg/jsoup/Connection$Method;

    move-result-object v3

    invoke-virtual {v3}, Lorg/jsoup/Connection$Method;->hasBody()Z

    move-result v3

    if-eqz v3, :cond_54

    .line 637
    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 638
    :cond_54
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->cookies()Ljava/util/Map;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Map;->size()I

    move-result v3

    if-lez v3, :cond_67

    .line 639
    const-string v3, "Cookie"

    invoke-static {p0}, Lorg/jsoup/helper/HttpConnection$Response;->getRequestCookieString(Lorg/jsoup/Connection$Request;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Ljava/net/HttpURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 640
    :cond_67
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->headers()Ljava/util/Map;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_73
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_8f

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 641
    .local v1, "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v0, v3, v4}, Ljava/net/HttpURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_73

    .line 643
    .end local v1    # "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_8f
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
    .line 493
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
    .line 497
    const-string v11, "Request must not be null"

    invoke-static {p0, v11}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 498
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->url()Ljava/net/URL;

    move-result-object v11

    invoke-virtual {v11}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v8

    .line 499
    .local v8, "protocol":Ljava/lang/String;
    const-string v11, "http"

    invoke-virtual {v8, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_25

    const-string v11, "https"

    invoke-virtual {v8, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_25

    .line 500
    new-instance v11, Ljava/net/MalformedURLException;

    const-string v12, "Only http & https protocols supported"

    invoke-direct {v11, v12}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 503
    :cond_25
    const/4 v7, 0x0

    .line 504
    .local v7, "mimeBoundary":Ljava/lang/String;
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->method()Lorg/jsoup/Connection$Method;

    move-result-object v11

    invoke-virtual {v11}, Lorg/jsoup/Connection$Method;->hasBody()Z

    move-result v11

    if-nez v11, :cond_d2

    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->data()Ljava/util/Collection;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/Collection;->size()I

    move-result v11

    if-lez v11, :cond_d2

    .line 505
    invoke-static {p0}, Lorg/jsoup/helper/HttpConnection$Response;->serialiseRequestUrl(Lorg/jsoup/Connection$Request;)V

    .line 509
    :cond_3d
    :goto_3d
    invoke-static {p0}, Lorg/jsoup/helper/HttpConnection$Response;->createConnection(Lorg/jsoup/Connection$Request;)Ljava/net/HttpURLConnection;

    move-result-object v1

    .line 512
    .local v1, "conn":Ljava/net/HttpURLConnection;
    :try_start_41
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->connect()V

    .line 513
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getDoOutput()Z

    move-result v11

    if-eqz v11, :cond_51

    .line 514
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v11

    invoke-static {p0, v11, v7}, Lorg/jsoup/helper/HttpConnection$Response;->writePost(Lorg/jsoup/Connection$Request;Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 516
    :cond_51
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v10

    .line 517
    .local v10, "status":I
    new-instance v9, Lorg/jsoup/helper/HttpConnection$Response;

    invoke-direct {v9, p1}, Lorg/jsoup/helper/HttpConnection$Response;-><init>(Lorg/jsoup/helper/HttpConnection$Response;)V

    .line 518
    .local v9, "res":Lorg/jsoup/helper/HttpConnection$Response;
    invoke-direct {v9, v1, p1}, Lorg/jsoup/helper/HttpConnection$Response;->setupFromConnection(Ljava/net/HttpURLConnection;Lorg/jsoup/Connection$Response;)V

    .line 519
    iput-object p0, v9, Lorg/jsoup/helper/HttpConnection$Response;->req:Lorg/jsoup/Connection$Request;

    .line 522
    const-string v11, "Location"

    invoke-virtual {v9, v11}, Lorg/jsoup/helper/HttpConnection$Response;->hasHeader(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_ea

    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->followRedirects()Z

    move-result v11

    if-eqz v11, :cond_ea

    .line 523
    sget-object v11, Lorg/jsoup/Connection$Method;->GET:Lorg/jsoup/Connection$Method;

    invoke-interface {p0, v11}, Lorg/jsoup/Connection$Request;->method(Lorg/jsoup/Connection$Method;)Lorg/jsoup/Connection$Base;

    .line 524
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->data()Ljava/util/Collection;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/Collection;->clear()V

    .line 526
    const-string v11, "Location"

    invoke-virtual {v9, v11}, Lorg/jsoup/helper/HttpConnection$Response;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 527
    .local v6, "location":Ljava/lang/String;
    if-eqz v6, :cond_97

    const-string v11, "http:/"

    invoke-virtual {v6, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_97

    const/4 v11, 0x6

    invoke-virtual {v6, v11}, Ljava/lang/String;->charAt(I)C

    move-result v11

    const/16 v12, 0x2f

    if-eq v11, v12, :cond_97

    .line 528
    const/4 v11, 0x6

    invoke-virtual {v6, v11}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    .line 529
    :cond_97
    new-instance v11, Ljava/net/URL;

    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->url()Ljava/net/URL;

    move-result-object v12

    # invokes: Lorg/jsoup/helper/HttpConnection;->encodeUrl(Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v6}, Lorg/jsoup/helper/HttpConnection;->access$200(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-direct {v11, v12, v13}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    invoke-interface {p0, v11}, Lorg/jsoup/Connection$Request;->url(Ljava/net/URL;)Lorg/jsoup/Connection$Base;

    .line 531
    iget-object v11, v9, Lorg/jsoup/helper/HttpConnection$Response;->cookies:Ljava/util/Map;

    invoke-interface {v11}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "i$":Ljava/util/Iterator;
    :goto_b1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_e2

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 532
    .local v3, "cookie":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    invoke-interface {p0, v11, v12}, Lorg/jsoup/Connection$Request;->cookie(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/Connection$Base;
    :try_end_cc
    .catchall {:try_start_41 .. :try_end_cc} :catchall_cd

    goto :goto_b1

    .line 571
    .end local v3    # "cookie":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v5    # "i$":Ljava/util/Iterator;
    .end local v6    # "location":Ljava/lang/String;
    .end local v9    # "res":Lorg/jsoup/helper/HttpConnection$Response;
    .end local v10    # "status":I
    :catchall_cd
    move-exception v11

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    throw v11

    .line 506
    .end local v1    # "conn":Ljava/net/HttpURLConnection;
    :cond_d2
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->method()Lorg/jsoup/Connection$Method;

    move-result-object v11

    invoke-virtual {v11}, Lorg/jsoup/Connection$Method;->hasBody()Z

    move-result v11

    if-eqz v11, :cond_3d

    .line 507
    invoke-static {p0}, Lorg/jsoup/helper/HttpConnection$Response;->setOutputContentType(Lorg/jsoup/Connection$Request;)Ljava/lang/String;

    move-result-object v7

    goto/16 :goto_3d

    .line 534
    .restart local v1    # "conn":Ljava/net/HttpURLConnection;
    .restart local v5    # "i$":Ljava/util/Iterator;
    .restart local v6    # "location":Ljava/lang/String;
    .restart local v9    # "res":Lorg/jsoup/helper/HttpConnection$Response;
    .restart local v10    # "status":I
    :cond_e2
    :try_start_e2
    invoke-static {p0, v9}, Lorg/jsoup/helper/HttpConnection$Response;->execute(Lorg/jsoup/Connection$Request;Lorg/jsoup/helper/HttpConnection$Response;)Lorg/jsoup/helper/HttpConnection$Response;
    :try_end_e5
    .catchall {:try_start_e2 .. :try_end_e5} :catchall_cd

    move-result-object v9

    .line 571
    .end local v9    # "res":Lorg/jsoup/helper/HttpConnection$Response;
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 575
    .end local v5    # "i$":Ljava/util/Iterator;
    .end local v6    # "location":Ljava/lang/String;
    :goto_e9
    return-object v9

    .line 536
    .restart local v9    # "res":Lorg/jsoup/helper/HttpConnection$Response;
    :cond_ea
    const/16 v11, 0xc8

    if-lt v10, v11, :cond_f2

    const/16 v11, 0x190

    if-lt v10, v11, :cond_108

    :cond_f2
    :try_start_f2
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->ignoreHttpErrors()Z

    move-result v11

    if-nez v11, :cond_108

    .line 537
    new-instance v11, Lorg/jsoup/HttpStatusException;

    const-string v12, "HTTP error fetching URL"

    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->url()Ljava/net/URL;

    move-result-object v13

    invoke-virtual {v13}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v11, v12, v10, v13}, Lorg/jsoup/HttpStatusException;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    throw v11

    .line 540
    :cond_108
    invoke-virtual {v9}, Lorg/jsoup/helper/HttpConnection$Response;->contentType()Ljava/lang/String;

    move-result-object v2

    .line 541
    .local v2, "contentType":Ljava/lang/String;
    if-eqz v2, :cond_140

    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->ignoreContentType()Z

    move-result v11

    if-nez v11, :cond_140

    const-string v11, "text/"

    invoke-virtual {v2, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_140

    const-string v11, "application/xml"

    invoke-virtual {v2, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_140

    sget-object v11, Lorg/jsoup/helper/HttpConnection$Response;->xmlContentTypeRxp:Ljava/util/regex/Pattern;

    invoke-virtual {v11, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v11

    invoke-virtual {v11}, Ljava/util/regex/Matcher;->matches()Z

    move-result v11

    if-nez v11, :cond_140

    .line 547
    new-instance v11, Lorg/jsoup/UnsupportedMimeTypeException;

    const-string v12, "Unhandled content type. Must be text/*, application/xml, or application/xhtml+xml"

    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->url()Ljava/net/URL;

    move-result-object v13

    invoke-virtual {v13}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v11, v12, v2, v13}, Lorg/jsoup/UnsupportedMimeTypeException;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    throw v11

    .line 550
    :cond_140
    iget-object v11, v9, Lorg/jsoup/helper/HttpConnection$Response;->contentType:Ljava/lang/String;

    invoke-static {v11}, Lorg/jsoup/helper/DataUtil;->getCharsetFromContentType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    iput-object v11, v9, Lorg/jsoup/helper/HttpConnection$Response;->charset:Ljava/lang/String;

    .line 551
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getContentLength()I
    :try_end_14b
    .catchall {:try_start_f2 .. :try_end_14b} :catchall_cd

    move-result v11

    if-eqz v11, :cond_1a3

    .line 552
    const/4 v0, 0x0

    .line 553
    .local v0, "bodyStream":Ljava/io/InputStream;
    const/4 v4, 0x0

    .line 555
    .local v4, "dataStream":Ljava/io/InputStream;
    :try_start_150
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object v11

    if-eqz v11, :cond_18b

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object v4

    .line 556
    :goto_15a
    const-string v11, "Content-Encoding"

    const-string v12, "gzip"

    invoke-virtual {v9, v11, v12}, Lorg/jsoup/helper/HttpConnection$Response;->hasHeaderWithValue(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_190

    new-instance v11, Ljava/io/BufferedInputStream;

    new-instance v12, Ljava/util/zip/GZIPInputStream;

    invoke-direct {v12, v4}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v11, v12}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    move-object v0, v11

    .line 560
    :goto_16f
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->maxBodySize()I

    move-result v11

    invoke-static {v0, v11}, Lorg/jsoup/helper/DataUtil;->readToByteBuffer(Ljava/io/InputStream;I)Ljava/nio/ByteBuffer;

    move-result-object v11

    iput-object v11, v9, Lorg/jsoup/helper/HttpConnection$Response;->byteData:Ljava/nio/ByteBuffer;
    :try_end_179
    .catchall {:try_start_150 .. :try_end_179} :catchall_197

    .line 562
    if-eqz v0, :cond_17e

    :try_start_17b
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 563
    :cond_17e
    if-eqz v4, :cond_183

    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_183
    .catchall {:try_start_17b .. :try_end_183} :catchall_cd

    .line 571
    .end local v0    # "bodyStream":Ljava/io/InputStream;
    .end local v4    # "dataStream":Ljava/io/InputStream;
    :cond_183
    :goto_183
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 574
    const/4 v11, 0x1

    iput-boolean v11, v9, Lorg/jsoup/helper/HttpConnection$Response;->executed:Z

    goto/16 :goto_e9

    .line 555
    .restart local v0    # "bodyStream":Ljava/io/InputStream;
    .restart local v4    # "dataStream":Ljava/io/InputStream;
    :cond_18b
    :try_start_18b
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v4

    goto :goto_15a

    .line 556
    :cond_190
    new-instance v11, Ljava/io/BufferedInputStream;

    invoke-direct {v11, v4}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_195
    .catchall {:try_start_18b .. :try_end_195} :catchall_197

    move-object v0, v11

    goto :goto_16f

    .line 562
    :catchall_197
    move-exception v11

    if-eqz v0, :cond_19d

    :try_start_19a
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 563
    :cond_19d
    if-eqz v4, :cond_1a2

    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    :cond_1a2
    throw v11

    .line 566
    .end local v0    # "bodyStream":Ljava/io/InputStream;
    .end local v4    # "dataStream":Ljava/io/InputStream;
    :cond_1a3
    invoke-static {}, Lorg/jsoup/helper/DataUtil;->emptyByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v11

    iput-object v11, v9, Lorg/jsoup/helper/HttpConnection$Response;->byteData:Ljava/nio/ByteBuffer;
    :try_end_1a9
    .catchall {:try_start_19a .. :try_end_1a9} :catchall_cd

    goto :goto_183
.end method

.method private static getInsecureVerifier()Ljavax/net/ssl/HostnameVerifier;
    .registers 1

    .prologue
    .line 654
    new-instance v0, Lorg/jsoup/helper/HttpConnection$Response$1;

    invoke-direct {v0}, Lorg/jsoup/helper/HttpConnection$Response$1;-><init>()V

    return-object v0
.end method

.method private static getRequestCookieString(Lorg/jsoup/Connection$Request;)Ljava/lang/String;
    .registers 7
    .param p0, "req"    # Lorg/jsoup/Connection$Request;

    .prologue
    .line 814
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 815
    .local v3, "sb":Ljava/lang/StringBuilder;
    const/4 v1, 0x1

    .line 816
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

    .line 817
    .local v0, "cookie":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    if-nez v1, :cond_3f

    .line 818
    const-string v4, "; "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 821
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

    .line 820
    :cond_3f
    const/4 v1, 0x0

    goto :goto_25

    .line 824
    .end local v0    # "cookie":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_41
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method private static declared-synchronized initUnSecureTSL()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 671
    const-class v4, Lorg/jsoup/helper/HttpConnection$Response;

    monitor-enter v4

    :try_start_3
    sget-object v3, Lorg/jsoup/helper/HttpConnection$Response;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    if-nez v3, :cond_27

    .line 673
    const/4 v3, 0x1

    new-array v2, v3, [Ljavax/net/ssl/TrustManager;

    const/4 v3, 0x0

    new-instance v5, Lorg/jsoup/helper/HttpConnection$Response$2;

    invoke-direct {v5}, Lorg/jsoup/helper/HttpConnection$Response$2;-><init>()V

    aput-object v5, v2, v3
    :try_end_12
    .catchall {:try_start_3 .. :try_end_12} :catchall_32

    .line 689
    .local v2, "trustAllCerts":[Ljavax/net/ssl/TrustManager;
    :try_start_12
    const-string v3, "SSL"

    invoke-static {v3}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v1

    .line 690
    .local v1, "sslContext":Ljavax/net/ssl/SSLContext;
    const/4 v3, 0x0

    new-instance v5, Ljava/security/SecureRandom;

    invoke-direct {v5}, Ljava/security/SecureRandom;-><init>()V

    invoke-virtual {v1, v3, v2, v5}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 692
    invoke-virtual {v1}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v3

    sput-object v3, Lorg/jsoup/helper/HttpConnection$Response;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;
    :try_end_27
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_12 .. :try_end_27} :catch_29
    .catch Ljava/security/KeyManagementException; {:try_start_12 .. :try_end_27} :catch_35
    .catchall {:try_start_12 .. :try_end_27} :catchall_32

    .line 700
    :cond_27
    monitor-exit v4

    return-void

    .line 693
    .end local v1    # "sslContext":Ljavax/net/ssl/SSLContext;
    :catch_29
    move-exception v0

    .line 694
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    :try_start_2a
    new-instance v3, Ljava/io/IOException;

    const-string v5, "Can\'t create unsecure trust manager"

    invoke-direct {v3, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_32
    .catchall {:try_start_2a .. :try_end_32} :catchall_32

    .line 671
    .end local v0    # "e":Ljava/security/NoSuchAlgorithmException;
    :catchall_32
    move-exception v3

    monitor-exit v4

    throw v3

    .line 695
    :catch_35
    move-exception v0

    .line 696
    .local v0, "e":Ljava/security/KeyManagementException;
    :try_start_36
    new-instance v3, Ljava/io/IOException;

    const-string v5, "Can\'t create unsecure trust manager"

    invoke-direct {v3, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_3e
    .catchall {:try_start_36 .. :try_end_3e} :catchall_32
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
    .line 829
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->url()Ljava/net/URL;

    move-result-object v2

    .line 830
    .local v2, "in":Ljava/net/URL;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 831
    .local v4, "url":Ljava/lang/StringBuilder;
    const/4 v0, 0x1

    .line 833
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

    .line 839
    invoke-virtual {v2}, Ljava/net/URL;->getQuery()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_3b

    .line 840
    invoke-virtual {v2}, Ljava/net/URL;->getQuery()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 841
    const/4 v0, 0x0

    .line 843
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

    .line 844
    .local v3, "keyVal":Lorg/jsoup/Connection$KeyVal;
    if-nez v0, :cond_78

    .line 845
    const/16 v5, 0x26

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 848
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

    .line 847
    :cond_78
    const/4 v0, 0x0

    goto :goto_56

    .line 853
    .end local v3    # "keyVal":Lorg/jsoup/Connection$KeyVal;
    :cond_7a
    new-instance v5, Ljava/net/URL;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-interface {p0, v5}, Lorg/jsoup/Connection$Request;->url(Ljava/net/URL;)Lorg/jsoup/Connection$Base;

    .line 854
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->data()Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Collection;->clear()V

    .line 855
    return-void
.end method

.method private static setOutputContentType(Lorg/jsoup/Connection$Request;)Ljava/lang/String;
    .registers 8
    .param p0, "req"    # Lorg/jsoup/Connection$Request;

    .prologue
    .line 750
    const/4 v3, 0x0

    .line 751
    .local v3, "needsMulti":Z
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->data()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_9
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1c

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jsoup/Connection$KeyVal;

    .line 752
    .local v2, "keyVal":Lorg/jsoup/Connection$KeyVal;
    invoke-interface {v2}, Lorg/jsoup/Connection$KeyVal;->hasInputStream()Z

    move-result v4

    if-eqz v4, :cond_9

    .line 753
    const/4 v3, 0x1

    .line 757
    .end local v2    # "keyVal":Lorg/jsoup/Connection$KeyVal;
    :cond_1c
    const/4 v0, 0x0

    .line 758
    .local v0, "bound":Ljava/lang/String;
    if-eqz v3, :cond_3c

    .line 759
    invoke-static {}, Lorg/jsoup/helper/DataUtil;->mimeBoundary()Ljava/lang/String;

    move-result-object v0

    .line 760
    const-string v4, "Content-Type"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "multipart/form-data; boundary="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {p0, v4, v5}, Lorg/jsoup/Connection$Request;->header(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/Connection$Base;

    .line 764
    :goto_3b
    return-object v0

    .line 762
    :cond_3c
    const-string v4, "Content-Type"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "application/x-www-form-urlencoded; charset="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->postDataCharset()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {p0, v4, v5}, Lorg/jsoup/Connection$Request;->header(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/Connection$Base;

    goto :goto_3b
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
    .line 704
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getRequestMethod()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lorg/jsoup/Connection$Method;->valueOf(Ljava/lang/String;)Lorg/jsoup/Connection$Method;

    move-result-object v3

    iput-object v3, p0, Lorg/jsoup/helper/HttpConnection$Response;->method:Lorg/jsoup/Connection$Method;

    .line 705
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getURL()Ljava/net/URL;

    move-result-object v3

    iput-object v3, p0, Lorg/jsoup/helper/HttpConnection$Response;->url:Ljava/net/URL;

    .line 706
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v3

    iput v3, p0, Lorg/jsoup/helper/HttpConnection$Response;->statusCode:I

    .line 707
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getResponseMessage()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lorg/jsoup/helper/HttpConnection$Response;->statusMessage:Ljava/lang/String;

    .line 708
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getContentType()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lorg/jsoup/helper/HttpConnection$Response;->contentType:Ljava/lang/String;

    .line 710
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getHeaderFields()Ljava/util/Map;

    move-result-object v2

    .line 711
    .local v2, "resHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-virtual {p0, v2}, Lorg/jsoup/helper/HttpConnection$Response;->processResponseHeaders(Ljava/util/Map;)V

    .line 714
    if-eqz p2, :cond_5f

    .line 715
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

    .line 716
    .local v1, "prevCookie":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {p0, v3}, Lorg/jsoup/helper/HttpConnection$Response;->hasCookie(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_37

    .line 717
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {p0, v3, v4}, Lorg/jsoup/helper/HttpConnection$Response;->cookie(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/Connection$Base;

    goto :goto_37

    .line 720
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "prevCookie":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_5f
    return-void
.end method

.method private static writePost(Lorg/jsoup/Connection$Request;Ljava/io/OutputStream;Ljava/lang/String;)V
    .registers 10
    .param p0, "req"    # Lorg/jsoup/Connection$Request;
    .param p1, "outputStream"    # Ljava/io/OutputStream;
    .param p2, "bound"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 768
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->data()Ljava/util/Collection;

    move-result-object v0

    .line 769
    .local v0, "data":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/jsoup/Connection$KeyVal;>;"
    new-instance v4, Ljava/io/BufferedWriter;

    new-instance v5, Ljava/io/OutputStreamWriter;

    const-string v6, "UTF-8"

    invoke-direct {v5, p1, v6}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    invoke-direct {v4, v5}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    .line 771
    .local v4, "w":Ljava/io/BufferedWriter;
    if-eqz p2, :cond_90

    .line 773
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_16
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_7f

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jsoup/Connection$KeyVal;

    .line 774
    .local v3, "keyVal":Lorg/jsoup/Connection$KeyVal;
    const-string v5, "--"

    invoke-virtual {v4, v5}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 775
    invoke-virtual {v4, p2}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 776
    const-string v5, "\r\n"

    invoke-virtual {v4, v5}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 777
    const-string v5, "Content-Disposition: form-data; name=\""

    invoke-virtual {v4, v5}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 778
    invoke-interface {v3}, Lorg/jsoup/Connection$KeyVal;->key()Ljava/lang/String;

    move-result-object v5

    # invokes: Lorg/jsoup/helper/HttpConnection;->encodeMimeName(Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v5}, Lorg/jsoup/helper/HttpConnection;->access$300(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 779
    const-string v5, "\""

    invoke-virtual {v4, v5}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 780
    invoke-interface {v3}, Lorg/jsoup/Connection$KeyVal;->hasInputStream()Z

    move-result v5

    if-eqz v5, :cond_72

    .line 781
    const-string v5, "; filename=\""

    invoke-virtual {v4, v5}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 782
    invoke-interface {v3}, Lorg/jsoup/Connection$KeyVal;->value()Ljava/lang/String;

    move-result-object v5

    # invokes: Lorg/jsoup/helper/HttpConnection;->encodeMimeName(Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v5}, Lorg/jsoup/helper/HttpConnection;->access$300(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 783
    const-string v5, "\"\r\nContent-Type: application/octet-stream\r\n\r\n"

    invoke-virtual {v4, v5}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 784
    invoke-virtual {v4}, Ljava/io/BufferedWriter;->flush()V

    .line 785
    invoke-interface {v3}, Lorg/jsoup/Connection$KeyVal;->inputStream()Ljava/io/InputStream;

    move-result-object v5

    invoke-static {v5, p1}, Lorg/jsoup/helper/DataUtil;->crossStreams(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 786
    invoke-virtual {p1}, Ljava/io/OutputStream;->flush()V

    .line 791
    :goto_6c
    const-string v5, "\r\n"

    invoke-virtual {v4, v5}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    goto :goto_16

    .line 788
    :cond_72
    const-string v5, "\r\n\r\n"

    invoke-virtual {v4, v5}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 789
    invoke-interface {v3}, Lorg/jsoup/Connection$KeyVal;->value()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    goto :goto_6c

    .line 793
    .end local v3    # "keyVal":Lorg/jsoup/Connection$KeyVal;
    :cond_7f
    const-string v5, "--"

    invoke-virtual {v4, v5}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 794
    invoke-virtual {v4, p2}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 795
    const-string v5, "--"

    invoke-virtual {v4, v5}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 810
    :cond_8c
    invoke-virtual {v4}, Ljava/io/BufferedWriter;->close()V

    .line 811
    return-void

    .line 798
    .end local v2    # "i$":Ljava/util/Iterator;
    :cond_90
    const/4 v1, 0x1

    .line 799
    .local v1, "first":Z
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .restart local v2    # "i$":Ljava/util/Iterator;
    :goto_95
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_8c

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jsoup/Connection$KeyVal;

    .line 800
    .restart local v3    # "keyVal":Lorg/jsoup/Connection$KeyVal;
    if-nez v1, :cond_cc

    .line 801
    const/16 v5, 0x26

    invoke-virtual {v4, v5}, Ljava/io/BufferedWriter;->append(C)Ljava/io/Writer;

    .line 805
    :goto_a8
    invoke-interface {v3}, Lorg/jsoup/Connection$KeyVal;->key()Ljava/lang/String;

    move-result-object v5

    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->postDataCharset()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 806
    const/16 v5, 0x3d

    invoke-virtual {v4, v5}, Ljava/io/BufferedWriter;->write(I)V

    .line 807
    invoke-interface {v3}, Lorg/jsoup/Connection$KeyVal;->value()Ljava/lang/String;

    move-result-object v5

    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->postDataCharset()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    goto :goto_95

    .line 803
    :cond_cc
    const/4 v1, 0x0

    goto :goto_a8
.end method


# virtual methods
.method public body()Ljava/lang/String;
    .registers 4

    .prologue
    .line 603
    iget-boolean v1, p0, Lorg/jsoup/helper/HttpConnection$Response;->executed:Z

    const-string v2, "Request must be executed (with .execute(), .get(), or .post() before getting response body"

    invoke-static {v1, v2}, Lorg/jsoup/helper/Validate;->isTrue(ZLjava/lang/String;)V

    .line 606
    iget-object v1, p0, Lorg/jsoup/helper/HttpConnection$Response;->charset:Ljava/lang/String;

    if-nez v1, :cond_21

    .line 607
    const-string v1, "UTF-8"

    invoke-static {v1}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v1

    iget-object v2, p0, Lorg/jsoup/helper/HttpConnection$Response;->byteData:Ljava/nio/ByteBuffer;

    invoke-virtual {v1, v2}, Ljava/nio/charset/Charset;->decode(Ljava/nio/ByteBuffer;)Ljava/nio/CharBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/CharBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 610
    .local v0, "body":Ljava/lang/String;
    :goto_1b
    iget-object v1, p0, Lorg/jsoup/helper/HttpConnection$Response;->byteData:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 611
    return-object v0

    .line 609
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
    .line 615
    iget-boolean v0, p0, Lorg/jsoup/helper/HttpConnection$Response;->executed:Z

    const-string v1, "Request must be executed (with .execute(), .get(), or .post() before getting response body"

    invoke-static {v0, v1}, Lorg/jsoup/helper/Validate;->isTrue(ZLjava/lang/String;)V

    .line 616
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection$Response;->byteData:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    return-object v0
.end method

.method public charset()Ljava/lang/String;
    .registers 2

    .prologue
    .line 587
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection$Response;->charset:Ljava/lang/String;

    return-object v0
.end method

.method public contentType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 591
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection$Response;->contentType:Ljava/lang/String;

    return-object v0
.end method

.method public bridge synthetic cookie(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 459
    invoke-super {p0, p1}, Lorg/jsoup/helper/HttpConnection$Base;->cookie(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic cookies()Ljava/util/Map;
    .registers 2

    .prologue
    .line 459
    invoke-super {p0}, Lorg/jsoup/helper/HttpConnection$Base;->cookies()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic hasCookie(Ljava/lang/String;)Z
    .registers 3
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 459
    invoke-super {p0, p1}, Lorg/jsoup/helper/HttpConnection$Base;->hasCookie(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic hasHeader(Ljava/lang/String;)Z
    .registers 3
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 459
    invoke-super {p0, p1}, Lorg/jsoup/helper/HttpConnection$Base;->hasHeader(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic hasHeaderWithValue(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 4
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Ljava/lang/String;

    .prologue
    .line 459
    invoke-super {p0, p1, p2}, Lorg/jsoup/helper/HttpConnection$Base;->hasHeaderWithValue(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic header(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 459
    invoke-super {p0, p1}, Lorg/jsoup/helper/HttpConnection$Base;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic headers()Ljava/util/Map;
    .registers 2

    .prologue
    .line 459
    invoke-super {p0}, Lorg/jsoup/helper/HttpConnection$Base;->headers()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic method()Lorg/jsoup/Connection$Method;
    .registers 2

    .prologue
    .line 459
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
    .line 595
    iget-boolean v1, p0, Lorg/jsoup/helper/HttpConnection$Response;->executed:Z

    const-string v2, "Request must be executed (with .execute(), .get(), or .post() before parsing response"

    invoke-static {v1, v2}, Lorg/jsoup/helper/Validate;->isTrue(ZLjava/lang/String;)V

    .line 596
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

    .line 597
    .local v0, "doc":Lorg/jsoup/nodes/Document;
    iget-object v1, p0, Lorg/jsoup/helper/HttpConnection$Response;->byteData:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 598
    invoke-virtual {v0}, Lorg/jsoup/nodes/Document;->outputSettings()Lorg/jsoup/nodes/Document$OutputSettings;

    move-result-object v1

    invoke-virtual {v1}, Lorg/jsoup/nodes/Document$OutputSettings;->charset()Ljava/nio/charset/Charset;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/jsoup/helper/HttpConnection$Response;->charset:Ljava/lang/String;

    .line 599
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
    .line 723
    .local p1, "resHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_8
    :goto_8
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_70

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 724
    .local v3, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 725
    .local v6, "name":Ljava/lang/String;
    if-eqz v6, :cond_8

    .line 728
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/List;

    .line 729
    .local v8, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v9, "Set-Cookie"

    invoke-virtual {v6, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_5f

    .line 730
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

    .line 731
    .local v7, "value":Ljava/lang/String;
    if-eqz v7, :cond_2e

    .line 733
    new-instance v0, Lorg/jsoup/parser/TokenQueue;

    invoke-direct {v0, v7}, Lorg/jsoup/parser/TokenQueue;-><init>(Ljava/lang/String;)V

    .line 734
    .local v0, "cd":Lorg/jsoup/parser/TokenQueue;
    const-string v9, "="

    invoke-virtual {v0, v9}, Lorg/jsoup/parser/TokenQueue;->chompTo(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 735
    .local v1, "cookieName":Ljava/lang/String;
    const-string v9, ";"

    invoke-virtual {v0, v9}, Lorg/jsoup/parser/TokenQueue;->consumeTo(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 738
    .local v2, "cookieVal":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v9

    if-lez v9, :cond_2e

    .line 739
    invoke-virtual {p0, v1, v2}, Lorg/jsoup/helper/HttpConnection$Response;->cookie(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/Connection$Base;

    goto :goto_2e

    .line 742
    .end local v0    # "cd":Lorg/jsoup/parser/TokenQueue;
    .end local v1    # "cookieName":Ljava/lang/String;
    .end local v2    # "cookieVal":Ljava/lang/String;
    .end local v5    # "i$":Ljava/util/Iterator;
    .end local v7    # "value":Ljava/lang/String;
    :cond_5f
    invoke-interface {v8}, Ljava/util/List;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_8

    .line 743
    const/4 v9, 0x0

    invoke-interface {v8, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    invoke-virtual {p0, v6, v9}, Lorg/jsoup/helper/HttpConnection$Response;->header(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/Connection$Base;

    goto :goto_8

    .line 746
    .end local v3    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    .end local v6    # "name":Ljava/lang/String;
    .end local v8    # "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_70
    return-void
.end method

.method public statusCode()I
    .registers 2

    .prologue
    .line 579
    iget v0, p0, Lorg/jsoup/helper/HttpConnection$Response;->statusCode:I

    return v0
.end method

.method public statusMessage()Ljava/lang/String;
    .registers 2

    .prologue
    .line 583
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection$Response;->statusMessage:Ljava/lang/String;

    return-object v0
.end method

.method public bridge synthetic url()Ljava/net/URL;
    .registers 2

    .prologue
    .line 459
    invoke-super {p0}, Lorg/jsoup/helper/HttpConnection$Base;->url()Ljava/net/URL;

    move-result-object v0

    return-object v0
.end method
