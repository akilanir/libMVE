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
    const-string v0, "(application|text)/\\w*\\+?xml.*"

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

    .line 470
    iput-boolean v1, p0, Lorg/jsoup/helper/HttpConnection$Response;->executed:Z

    .line 471
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

    .line 470
    iput-boolean v4, p0, Lorg/jsoup/helper/HttpConnection$Response;->executed:Z

    .line 471
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
    .line 628
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->url()Ljava/net/URL;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    .line 630
    .local v0, "conn":Ljava/net/HttpURLConnection;
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->method()Lorg/jsoup/Connection$Method;

    move-result-object v2

    invoke-virtual {v2}, Lorg/jsoup/Connection$Method;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 631
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    .line 632
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->timeout()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 633
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->timeout()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 635
    instance-of v2, v0, Ljavax/net/ssl/HttpsURLConnection;

    if-eqz v2, :cond_46

    .line 636
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->validateTLSCertificates()Z

    move-result v2

    if-nez v2, :cond_46

    .line 637
    invoke-static {}, Lorg/jsoup/helper/HttpConnection$Response;->initUnSecureTSL()V

    move-object v2, v0

    .line 638
    check-cast v2, Ljavax/net/ssl/HttpsURLConnection;

    sget-object v3, Lorg/jsoup/helper/HttpConnection$Response;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    invoke-virtual {v2, v3}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    move-object v2, v0

    .line 639
    check-cast v2, Ljavax/net/ssl/HttpsURLConnection;

    invoke-static {}, Lorg/jsoup/helper/HttpConnection$Response;->getInsecureVerifier()Ljavax/net/ssl/HostnameVerifier;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 643
    :cond_46
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->method()Lorg/jsoup/Connection$Method;

    move-result-object v2

    invoke-virtual {v2}, Lorg/jsoup/Connection$Method;->hasBody()Z

    move-result v2

    if-eqz v2, :cond_54

    .line 644
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 645
    :cond_54
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->cookies()Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v2

    if-lez v2, :cond_67

    .line 646
    const-string v2, "Cookie"

    invoke-static {p0}, Lorg/jsoup/helper/HttpConnection$Response;->getRequestCookieString(Lorg/jsoup/Connection$Request;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/net/HttpURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 647
    :cond_67
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->headers()Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_73
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_8f

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 648
    .local v1, "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Ljava/net/HttpURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_73

    .line 650
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

    if-nez v11, :cond_d1

    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->data()Ljava/util/Collection;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/Collection;->size()I

    move-result v11

    if-lez v11, :cond_d1

    .line 505
    invoke-static {p0}, Lorg/jsoup/helper/HttpConnection$Response;->serialiseRequestUrl(Lorg/jsoup/Connection$Request;)V

    .line 509
    :cond_3d
    :goto_3d
    invoke-static {p0}, Lorg/jsoup/helper/HttpConnection$Response;->createConnection(Lorg/jsoup/Connection$Request;)Ljava/net/HttpURLConnection;

    move-result-object v2

    .line 512
    .local v2, "conn":Ljava/net/HttpURLConnection;
    :try_start_41
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->connect()V

    .line 513
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getDoOutput()Z

    move-result v11

    if-eqz v11, :cond_51

    .line 514
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v11

    invoke-static {p0, v11, v7}, Lorg/jsoup/helper/HttpConnection$Response;->writePost(Lorg/jsoup/Connection$Request;Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 516
    :cond_51
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v10

    .line 517
    .local v10, "status":I
    new-instance v9, Lorg/jsoup/helper/HttpConnection$Response;

    invoke-direct {v9, p1}, Lorg/jsoup/helper/HttpConnection$Response;-><init>(Lorg/jsoup/helper/HttpConnection$Response;)V

    .line 518
    .local v9, "res":Lorg/jsoup/helper/HttpConnection$Response;
    invoke-direct {v9, v2, p1}, Lorg/jsoup/helper/HttpConnection$Response;->setupFromConnection(Ljava/net/HttpURLConnection;Lorg/jsoup/Connection$Response;)V

    .line 519
    iput-object p0, v9, Lorg/jsoup/helper/HttpConnection$Response;->req:Lorg/jsoup/Connection$Request;

    .line 522
    const-string v11, "Location"

    invoke-virtual {v9, v11}, Lorg/jsoup/helper/HttpConnection$Response;->hasHeader(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_e9

    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->followRedirects()Z

    move-result v11

    if-eqz v11, :cond_e9

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
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->url()Ljava/net/URL;

    move-result-object v11

    # invokes: Lorg/jsoup/helper/HttpConnection;->encodeUrl(Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v6}, Lorg/jsoup/helper/HttpConnection;->access$200(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lorg/jsoup/helper/StringUtil;->resolve(Ljava/net/URL;Ljava/lang/String;)Ljava/net/URL;

    move-result-object v11

    invoke-interface {p0, v11}, Lorg/jsoup/Connection$Request;->url(Ljava/net/URL;)Lorg/jsoup/Connection$Base;

    .line 531
    iget-object v11, v9, Lorg/jsoup/helper/HttpConnection$Response;->cookies:Ljava/util/Map;

    invoke-interface {v11}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :goto_b0
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_e1

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .line 532
    .local v4, "cookie":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    invoke-interface {p0, v11, v12}, Lorg/jsoup/Connection$Request;->cookie(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/Connection$Base;
    :try_end_cb
    .catchall {:try_start_41 .. :try_end_cb} :catchall_cc

    goto :goto_b0

    .line 578
    .end local v4    # "cookie":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v6    # "location":Ljava/lang/String;
    .end local v9    # "res":Lorg/jsoup/helper/HttpConnection$Response;
    .end local v10    # "status":I
    :catchall_cc
    move-exception v11

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    throw v11

    .line 506
    .end local v2    # "conn":Ljava/net/HttpURLConnection;
    :cond_d1
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
    .restart local v2    # "conn":Ljava/net/HttpURLConnection;
    .restart local v6    # "location":Ljava/lang/String;
    .restart local v9    # "res":Lorg/jsoup/helper/HttpConnection$Response;
    .restart local v10    # "status":I
    :cond_e1
    :try_start_e1
    invoke-static {p0, v9}, Lorg/jsoup/helper/HttpConnection$Response;->execute(Lorg/jsoup/Connection$Request;Lorg/jsoup/helper/HttpConnection$Response;)Lorg/jsoup/helper/HttpConnection$Response;
    :try_end_e4
    .catchall {:try_start_e1 .. :try_end_e4} :catchall_cc

    move-result-object v9

    .line 578
    .end local v9    # "res":Lorg/jsoup/helper/HttpConnection$Response;
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 582
    .end local v6    # "location":Ljava/lang/String;
    :goto_e8
    return-object v9

    .line 536
    .restart local v9    # "res":Lorg/jsoup/helper/HttpConnection$Response;
    :cond_e9
    const/16 v11, 0xc8

    if-lt v10, v11, :cond_f1

    const/16 v11, 0x190

    if-lt v10, v11, :cond_107

    :cond_f1
    :try_start_f1
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->ignoreHttpErrors()Z

    move-result v11

    if-nez v11, :cond_107

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
    :cond_107
    invoke-virtual {v9}, Lorg/jsoup/helper/HttpConnection$Response;->contentType()Ljava/lang/String;

    move-result-object v3

    .line 541
    .local v3, "contentType":Ljava/lang/String;
    if-eqz v3, :cond_137

    .line 542
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->ignoreContentType()Z

    move-result v11

    if-nez v11, :cond_137

    const-string v11, "text/"

    .line 543
    invoke-virtual {v3, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_137

    sget-object v11, Lorg/jsoup/helper/HttpConnection$Response;->xmlContentTypeRxp:Ljava/util/regex/Pattern;

    .line 544
    invoke-virtual {v11, v3}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v11

    invoke-virtual {v11}, Ljava/util/regex/Matcher;->matches()Z

    move-result v11

    if-nez v11, :cond_137

    .line 546
    new-instance v11, Lorg/jsoup/UnsupportedMimeTypeException;

    const-string v12, "Unhandled content type. Must be text/*, application/xml, or application/xhtml+xml"

    .line 547
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->url()Ljava/net/URL;

    move-result-object v13

    invoke-virtual {v13}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v11, v12, v3, v13}, Lorg/jsoup/UnsupportedMimeTypeException;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    throw v11

    .line 550
    :cond_137
    if-eqz v3, :cond_15a

    sget-object v11, Lorg/jsoup/helper/HttpConnection$Response;->xmlContentTypeRxp:Ljava/util/regex/Pattern;

    invoke-virtual {v11, v3}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v11

    invoke-virtual {v11}, Ljava/util/regex/Matcher;->matches()Z

    move-result v11

    if-eqz v11, :cond_15a

    .line 552
    instance-of v11, p0, Lorg/jsoup/helper/HttpConnection$Request;

    if-eqz v11, :cond_15a

    move-object v0, p0

    check-cast v0, Lorg/jsoup/helper/HttpConnection$Request;

    move-object v11, v0

    # getter for: Lorg/jsoup/helper/HttpConnection$Request;->parserDefined:Z
    invoke-static {v11}, Lorg/jsoup/helper/HttpConnection$Request;->access$300(Lorg/jsoup/helper/HttpConnection$Request;)Z

    move-result v11

    if-nez v11, :cond_15a

    .line 553
    invoke-static {}, Lorg/jsoup/parser/Parser;->xmlParser()Lorg/jsoup/parser/Parser;

    move-result-object v11

    invoke-interface {p0, v11}, Lorg/jsoup/Connection$Request;->parser(Lorg/jsoup/parser/Parser;)Lorg/jsoup/Connection$Request;

    .line 557
    :cond_15a
    iget-object v11, v9, Lorg/jsoup/helper/HttpConnection$Response;->contentType:Ljava/lang/String;

    invoke-static {v11}, Lorg/jsoup/helper/DataUtil;->getCharsetFromContentType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    iput-object v11, v9, Lorg/jsoup/helper/HttpConnection$Response;->charset:Ljava/lang/String;

    .line 558
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getContentLength()I
    :try_end_165
    .catchall {:try_start_f1 .. :try_end_165} :catchall_cc

    move-result v11

    if-eqz v11, :cond_1bd

    .line 559
    const/4 v1, 0x0

    .line 560
    .local v1, "bodyStream":Ljava/io/InputStream;
    const/4 v5, 0x0

    .line 562
    .local v5, "dataStream":Ljava/io/InputStream;
    :try_start_16a
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object v11

    if-eqz v11, :cond_1a5

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object v5

    .line 563
    :goto_174
    const-string v11, "Content-Encoding"

    const-string v12, "gzip"

    invoke-virtual {v9, v11, v12}, Lorg/jsoup/helper/HttpConnection$Response;->hasHeaderWithValue(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_1aa

    new-instance v11, Ljava/io/BufferedInputStream;

    new-instance v12, Ljava/util/zip/GZIPInputStream;

    invoke-direct {v12, v5}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v11, v12}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    move-object v1, v11

    .line 567
    :goto_189
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->maxBodySize()I

    move-result v11

    invoke-static {v1, v11}, Lorg/jsoup/helper/DataUtil;->readToByteBuffer(Ljava/io/InputStream;I)Ljava/nio/ByteBuffer;

    move-result-object v11

    iput-object v11, v9, Lorg/jsoup/helper/HttpConnection$Response;->byteData:Ljava/nio/ByteBuffer;
    :try_end_193
    .catchall {:try_start_16a .. :try_end_193} :catchall_1b1

    .line 569
    if-eqz v1, :cond_198

    :try_start_195
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 570
    :cond_198
    if-eqz v5, :cond_19d

    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_19d
    .catchall {:try_start_195 .. :try_end_19d} :catchall_cc

    .line 578
    .end local v1    # "bodyStream":Ljava/io/InputStream;
    .end local v5    # "dataStream":Ljava/io/InputStream;
    :cond_19d
    :goto_19d
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 581
    const/4 v11, 0x1

    iput-boolean v11, v9, Lorg/jsoup/helper/HttpConnection$Response;->executed:Z

    goto/16 :goto_e8

    .line 562
    .restart local v1    # "bodyStream":Ljava/io/InputStream;
    .restart local v5    # "dataStream":Ljava/io/InputStream;
    :cond_1a5
    :try_start_1a5
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v5

    goto :goto_174

    .line 563
    :cond_1aa
    new-instance v11, Ljava/io/BufferedInputStream;

    invoke-direct {v11, v5}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_1af
    .catchall {:try_start_1a5 .. :try_end_1af} :catchall_1b1

    move-object v1, v11

    goto :goto_189

    .line 569
    :catchall_1b1
    move-exception v11

    if-eqz v1, :cond_1b7

    :try_start_1b4
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 570
    :cond_1b7
    if-eqz v5, :cond_1bc

    invoke-virtual {v5}, Ljava/io/InputStream;->close()V

    :cond_1bc
    throw v11

    .line 573
    .end local v1    # "bodyStream":Ljava/io/InputStream;
    .end local v5    # "dataStream":Ljava/io/InputStream;
    :cond_1bd
    invoke-static {}, Lorg/jsoup/helper/DataUtil;->emptyByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v11

    iput-object v11, v9, Lorg/jsoup/helper/HttpConnection$Response;->byteData:Ljava/nio/ByteBuffer;
    :try_end_1c3
    .catchall {:try_start_1b4 .. :try_end_1c3} :catchall_cc

    goto :goto_19d
.end method

.method private static getInsecureVerifier()Ljavax/net/ssl/HostnameVerifier;
    .registers 1

    .prologue
    .line 661
    new-instance v0, Lorg/jsoup/helper/HttpConnection$Response$1;

    invoke-direct {v0}, Lorg/jsoup/helper/HttpConnection$Response$1;-><init>()V

    return-object v0
.end method

.method private static getRequestCookieString(Lorg/jsoup/Connection$Request;)Ljava/lang/String;
    .registers 7
    .param p0, "req"    # Lorg/jsoup/Connection$Request;

    .prologue
    .line 821
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 822
    .local v2, "sb":Ljava/lang/StringBuilder;
    const/4 v1, 0x1

    .line 823
    .local v1, "first":Z
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->cookies()Ljava/util/Map;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_12
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_41

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 824
    .local v0, "cookie":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    if-nez v1, :cond_3f

    .line 825
    const-string v3, "; "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 828
    :goto_25
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v5, 0x3d

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_12

    .line 827
    :cond_3f
    const/4 v1, 0x0

    goto :goto_25

    .line 831
    .end local v0    # "cookie":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_41
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method private static declared-synchronized initUnSecureTSL()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 678
    const-class v4, Lorg/jsoup/helper/HttpConnection$Response;

    monitor-enter v4

    :try_start_3
    sget-object v3, Lorg/jsoup/helper/HttpConnection$Response;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    if-nez v3, :cond_27

    .line 680
    const/4 v3, 0x1

    new-array v2, v3, [Ljavax/net/ssl/TrustManager;

    const/4 v3, 0x0

    new-instance v5, Lorg/jsoup/helper/HttpConnection$Response$2;

    invoke-direct {v5}, Lorg/jsoup/helper/HttpConnection$Response$2;-><init>()V

    aput-object v5, v2, v3
    :try_end_12
    .catchall {:try_start_3 .. :try_end_12} :catchall_32

    .line 696
    .local v2, "trustAllCerts":[Ljavax/net/ssl/TrustManager;
    :try_start_12
    const-string v3, "SSL"

    invoke-static {v3}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v1

    .line 697
    .local v1, "sslContext":Ljavax/net/ssl/SSLContext;
    const/4 v3, 0x0

    new-instance v5, Ljava/security/SecureRandom;

    invoke-direct {v5}, Ljava/security/SecureRandom;-><init>()V

    invoke-virtual {v1, v3, v2, v5}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 699
    invoke-virtual {v1}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v3

    sput-object v3, Lorg/jsoup/helper/HttpConnection$Response;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;
    :try_end_27
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_12 .. :try_end_27} :catch_29
    .catch Ljava/security/KeyManagementException; {:try_start_12 .. :try_end_27} :catch_35
    .catchall {:try_start_12 .. :try_end_27} :catchall_32

    .line 707
    :cond_27
    monitor-exit v4

    return-void

    .line 700
    .end local v1    # "sslContext":Ljavax/net/ssl/SSLContext;
    :catch_29
    move-exception v0

    .line 701
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    :try_start_2a
    new-instance v3, Ljava/io/IOException;

    const-string v5, "Can\'t create unsecure trust manager"

    invoke-direct {v3, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_32
    .catchall {:try_start_2a .. :try_end_32} :catchall_32

    .line 678
    .end local v0    # "e":Ljava/security/NoSuchAlgorithmException;
    :catchall_32
    move-exception v3

    monitor-exit v4

    throw v3

    .line 702
    :catch_35
    move-exception v0

    .line 703
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
    .line 836
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->url()Ljava/net/URL;

    move-result-object v1

    .line 837
    .local v1, "in":Ljava/net/URL;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 838
    .local v3, "url":Ljava/lang/StringBuilder;
    const/4 v0, 0x1

    .line 841
    .local v0, "first":Z
    invoke-virtual {v1}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "://"

    .line 842
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 843
    invoke-virtual {v1}, Ljava/net/URL;->getAuthority()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 844
    invoke-virtual {v1}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "?"

    .line 845
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 846
    invoke-virtual {v1}, Ljava/net/URL;->getQuery()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_3b

    .line 847
    invoke-virtual {v1}, Ljava/net/URL;->getQuery()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 848
    const/4 v0, 0x0

    .line 850
    :cond_3b
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->data()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_43
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_7a

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jsoup/Connection$KeyVal;

    .line 851
    .local v2, "keyVal":Lorg/jsoup/Connection$KeyVal;
    if-nez v0, :cond_78

    .line 852
    const/16 v5, 0x26

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 856
    :goto_56
    invoke-interface {v2}, Lorg/jsoup/Connection$KeyVal;->key()Ljava/lang/String;

    move-result-object v5

    const-string v6, "UTF-8"

    invoke-static {v5, v6}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/16 v6, 0x3d

    .line 857
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 858
    invoke-interface {v2}, Lorg/jsoup/Connection$KeyVal;->value()Ljava/lang/String;

    move-result-object v6

    const-string v7, "UTF-8"

    invoke-static {v6, v7}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_43

    .line 854
    :cond_78
    const/4 v0, 0x0

    goto :goto_56

    .line 860
    .end local v2    # "keyVal":Lorg/jsoup/Connection$KeyVal;
    :cond_7a
    new-instance v4, Ljava/net/URL;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-interface {p0, v4}, Lorg/jsoup/Connection$Request;->url(Ljava/net/URL;)Lorg/jsoup/Connection$Base;

    .line 861
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->data()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->clear()V

    .line 862
    return-void
.end method

.method private static setOutputContentType(Lorg/jsoup/Connection$Request;)Ljava/lang/String;
    .registers 7
    .param p0, "req"    # Lorg/jsoup/Connection$Request;

    .prologue
    .line 757
    const/4 v2, 0x0

    .line 758
    .local v2, "needsMulti":Z
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->data()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_9
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1c

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jsoup/Connection$KeyVal;

    .line 759
    .local v1, "keyVal":Lorg/jsoup/Connection$KeyVal;
    invoke-interface {v1}, Lorg/jsoup/Connection$KeyVal;->hasInputStream()Z

    move-result v4

    if-eqz v4, :cond_9

    .line 760
    const/4 v2, 0x1

    .line 764
    .end local v1    # "keyVal":Lorg/jsoup/Connection$KeyVal;
    :cond_1c
    const/4 v0, 0x0

    .line 765
    .local v0, "bound":Ljava/lang/String;
    if-eqz v2, :cond_3c

    .line 766
    invoke-static {}, Lorg/jsoup/helper/DataUtil;->mimeBoundary()Ljava/lang/String;

    move-result-object v0

    .line 767
    const-string v3, "Content-Type"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "multipart/form-data; boundary="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {p0, v3, v4}, Lorg/jsoup/Connection$Request;->header(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/Connection$Base;

    .line 771
    :goto_3b
    return-object v0

    .line 769
    :cond_3c
    const-string v3, "Content-Type"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "application/x-www-form-urlencoded; charset="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->postDataCharset()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {p0, v3, v4}, Lorg/jsoup/Connection$Request;->header(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/Connection$Base;

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
    .line 711
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getRequestMethod()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/jsoup/Connection$Method;->valueOf(Ljava/lang/String;)Lorg/jsoup/Connection$Method;

    move-result-object v2

    iput-object v2, p0, Lorg/jsoup/helper/HttpConnection$Response;->method:Lorg/jsoup/Connection$Method;

    .line 712
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getURL()Ljava/net/URL;

    move-result-object v2

    iput-object v2, p0, Lorg/jsoup/helper/HttpConnection$Response;->url:Ljava/net/URL;

    .line 713
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v2

    iput v2, p0, Lorg/jsoup/helper/HttpConnection$Response;->statusCode:I

    .line 714
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getResponseMessage()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lorg/jsoup/helper/HttpConnection$Response;->statusMessage:Ljava/lang/String;

    .line 715
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getContentType()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lorg/jsoup/helper/HttpConnection$Response;->contentType:Ljava/lang/String;

    .line 717
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getHeaderFields()Ljava/util/Map;

    move-result-object v1

    .line 718
    .local v1, "resHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-virtual {p0, v1}, Lorg/jsoup/helper/HttpConnection$Response;->processResponseHeaders(Ljava/util/Map;)V

    .line 721
    if-eqz p2, :cond_5f

    .line 722
    invoke-interface {p2}, Lorg/jsoup/Connection$Response;->cookies()Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_37
    :goto_37
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5f

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 723
    .local v0, "prevCookie":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p0, v2}, Lorg/jsoup/helper/HttpConnection$Response;->hasCookie(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_37

    .line 724
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {p0, v2, v3}, Lorg/jsoup/helper/HttpConnection$Response;->cookie(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/Connection$Base;

    goto :goto_37

    .line 727
    .end local v0    # "prevCookie":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
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
    .line 775
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->data()Ljava/util/Collection;

    move-result-object v0

    .line 776
    .local v0, "data":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/jsoup/Connection$KeyVal;>;"
    new-instance v3, Ljava/io/BufferedWriter;

    new-instance v4, Ljava/io/OutputStreamWriter;

    const-string v5, "UTF-8"

    invoke-direct {v4, p1, v5}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    invoke-direct {v3, v4}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    .line 778
    .local v3, "w":Ljava/io/BufferedWriter;
    if-eqz p2, :cond_90

    .line 780
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_16
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_7f

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jsoup/Connection$KeyVal;

    .line 781
    .local v2, "keyVal":Lorg/jsoup/Connection$KeyVal;
    const-string v5, "--"

    invoke-virtual {v3, v5}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 782
    invoke-virtual {v3, p2}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 783
    const-string v5, "\r\n"

    invoke-virtual {v3, v5}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 784
    const-string v5, "Content-Disposition: form-data; name=\""

    invoke-virtual {v3, v5}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 785
    invoke-interface {v2}, Lorg/jsoup/Connection$KeyVal;->key()Ljava/lang/String;

    move-result-object v5

    # invokes: Lorg/jsoup/helper/HttpConnection;->encodeMimeName(Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v5}, Lorg/jsoup/helper/HttpConnection;->access$400(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 786
    const-string v5, "\""

    invoke-virtual {v3, v5}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 787
    invoke-interface {v2}, Lorg/jsoup/Connection$KeyVal;->hasInputStream()Z

    move-result v5

    if-eqz v5, :cond_72

    .line 788
    const-string v5, "; filename=\""

    invoke-virtual {v3, v5}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 789
    invoke-interface {v2}, Lorg/jsoup/Connection$KeyVal;->value()Ljava/lang/String;

    move-result-object v5

    # invokes: Lorg/jsoup/helper/HttpConnection;->encodeMimeName(Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v5}, Lorg/jsoup/helper/HttpConnection;->access$400(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 790
    const-string v5, "\"\r\nContent-Type: application/octet-stream\r\n\r\n"

    invoke-virtual {v3, v5}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 791
    invoke-virtual {v3}, Ljava/io/BufferedWriter;->flush()V

    .line 792
    invoke-interface {v2}, Lorg/jsoup/Connection$KeyVal;->inputStream()Ljava/io/InputStream;

    move-result-object v5

    invoke-static {v5, p1}, Lorg/jsoup/helper/DataUtil;->crossStreams(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 793
    invoke-virtual {p1}, Ljava/io/OutputStream;->flush()V

    .line 798
    :goto_6c
    const-string v5, "\r\n"

    invoke-virtual {v3, v5}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    goto :goto_16

    .line 795
    :cond_72
    const-string v5, "\r\n\r\n"

    invoke-virtual {v3, v5}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 796
    invoke-interface {v2}, Lorg/jsoup/Connection$KeyVal;->value()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    goto :goto_6c

    .line 800
    .end local v2    # "keyVal":Lorg/jsoup/Connection$KeyVal;
    :cond_7f
    const-string v4, "--"

    invoke-virtual {v3, v4}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 801
    invoke-virtual {v3, p2}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 802
    const-string v4, "--"

    invoke-virtual {v3, v4}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 817
    :cond_8c
    invoke-virtual {v3}, Ljava/io/BufferedWriter;->close()V

    .line 818
    return-void

    .line 805
    :cond_90
    const/4 v1, 0x1

    .line 806
    .local v1, "first":Z
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_95
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_8c

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jsoup/Connection$KeyVal;

    .line 807
    .restart local v2    # "keyVal":Lorg/jsoup/Connection$KeyVal;
    if-nez v1, :cond_cc

    .line 808
    const/16 v5, 0x26

    invoke-virtual {v3, v5}, Ljava/io/BufferedWriter;->append(C)Ljava/io/Writer;

    .line 812
    :goto_a8
    invoke-interface {v2}, Lorg/jsoup/Connection$KeyVal;->key()Ljava/lang/String;

    move-result-object v5

    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->postDataCharset()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 813
    const/16 v5, 0x3d

    invoke-virtual {v3, v5}, Ljava/io/BufferedWriter;->write(I)V

    .line 814
    invoke-interface {v2}, Lorg/jsoup/Connection$KeyVal;->value()Ljava/lang/String;

    move-result-object v5

    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->postDataCharset()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    goto :goto_95

    .line 810
    :cond_cc
    const/4 v1, 0x0

    goto :goto_a8
.end method


# virtual methods
.method public body()Ljava/lang/String;
    .registers 4

    .prologue
    .line 610
    iget-boolean v1, p0, Lorg/jsoup/helper/HttpConnection$Response;->executed:Z

    const-string v2, "Request must be executed (with .execute(), .get(), or .post() before getting response body"

    invoke-static {v1, v2}, Lorg/jsoup/helper/Validate;->isTrue(ZLjava/lang/String;)V

    .line 613
    iget-object v1, p0, Lorg/jsoup/helper/HttpConnection$Response;->charset:Ljava/lang/String;

    if-nez v1, :cond_21

    .line 614
    const-string v1, "UTF-8"

    invoke-static {v1}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v1

    iget-object v2, p0, Lorg/jsoup/helper/HttpConnection$Response;->byteData:Ljava/nio/ByteBuffer;

    invoke-virtual {v1, v2}, Ljava/nio/charset/Charset;->decode(Ljava/nio/ByteBuffer;)Ljava/nio/CharBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/CharBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 617
    .local v0, "body":Ljava/lang/String;
    :goto_1b
    iget-object v1, p0, Lorg/jsoup/helper/HttpConnection$Response;->byteData:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 618
    return-object v0

    .line 616
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
    .line 622
    iget-boolean v0, p0, Lorg/jsoup/helper/HttpConnection$Response;->executed:Z

    const-string v1, "Request must be executed (with .execute(), .get(), or .post() before getting response body"

    invoke-static {v0, v1}, Lorg/jsoup/helper/Validate;->isTrue(ZLjava/lang/String;)V

    .line 623
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection$Response;->byteData:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    return-object v0
.end method

.method public charset()Ljava/lang/String;
    .registers 2

    .prologue
    .line 594
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection$Response;->charset:Ljava/lang/String;

    return-object v0
.end method

.method public contentType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 598
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection$Response;->contentType:Ljava/lang/String;

    return-object v0
.end method

.method public bridge synthetic cookie(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .prologue
    .line 461
    invoke-super {p0, p1}, Lorg/jsoup/helper/HttpConnection$Base;->cookie(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic cookies()Ljava/util/Map;
    .registers 2

    .prologue
    .line 461
    invoke-super {p0}, Lorg/jsoup/helper/HttpConnection$Base;->cookies()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic hasCookie(Ljava/lang/String;)Z
    .registers 3

    .prologue
    .line 461
    invoke-super {p0, p1}, Lorg/jsoup/helper/HttpConnection$Base;->hasCookie(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic hasHeader(Ljava/lang/String;)Z
    .registers 3

    .prologue
    .line 461
    invoke-super {p0, p1}, Lorg/jsoup/helper/HttpConnection$Base;->hasHeader(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic hasHeaderWithValue(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 4

    .prologue
    .line 461
    invoke-super {p0, p1, p2}, Lorg/jsoup/helper/HttpConnection$Base;->hasHeaderWithValue(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic header(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .prologue
    .line 461
    invoke-super {p0, p1}, Lorg/jsoup/helper/HttpConnection$Base;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic headers()Ljava/util/Map;
    .registers 2

    .prologue
    .line 461
    invoke-super {p0}, Lorg/jsoup/helper/HttpConnection$Base;->headers()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic method()Lorg/jsoup/Connection$Method;
    .registers 2

    .prologue
    .line 461
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
    .line 602
    iget-boolean v1, p0, Lorg/jsoup/helper/HttpConnection$Response;->executed:Z

    const-string v2, "Request must be executed (with .execute(), .get(), or .post() before parsing response"

    invoke-static {v1, v2}, Lorg/jsoup/helper/Validate;->isTrue(ZLjava/lang/String;)V

    .line 603
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

    .line 604
    .local v0, "doc":Lorg/jsoup/nodes/Document;
    iget-object v1, p0, Lorg/jsoup/helper/HttpConnection$Response;->byteData:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 605
    invoke-virtual {v0}, Lorg/jsoup/nodes/Document;->outputSettings()Lorg/jsoup/nodes/Document$OutputSettings;

    move-result-object v1

    invoke-virtual {v1}, Lorg/jsoup/nodes/Document$OutputSettings;->charset()Ljava/nio/charset/Charset;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/jsoup/helper/HttpConnection$Response;->charset:Ljava/lang/String;

    .line 606
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
    .line 730
    .local p1, "resHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_8
    :goto_8
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_70

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 731
    .local v3, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 732
    .local v4, "name":Ljava/lang/String;
    if-eqz v4, :cond_8

    .line 735
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    .line 736
    .local v6, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v7, "Set-Cookie"

    invoke-virtual {v4, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_5f

    .line 737
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_2e
    :goto_2e
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_8

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 738
    .local v5, "value":Ljava/lang/String;
    if-eqz v5, :cond_2e

    .line 740
    new-instance v0, Lorg/jsoup/parser/TokenQueue;

    invoke-direct {v0, v5}, Lorg/jsoup/parser/TokenQueue;-><init>(Ljava/lang/String;)V

    .line 741
    .local v0, "cd":Lorg/jsoup/parser/TokenQueue;
    const-string v9, "="

    invoke-virtual {v0, v9}, Lorg/jsoup/parser/TokenQueue;->chompTo(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 742
    .local v1, "cookieName":Ljava/lang/String;
    const-string v9, ";"

    invoke-virtual {v0, v9}, Lorg/jsoup/parser/TokenQueue;->consumeTo(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 745
    .local v2, "cookieVal":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v9

    if-lez v9, :cond_2e

    .line 746
    invoke-virtual {p0, v1, v2}, Lorg/jsoup/helper/HttpConnection$Response;->cookie(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/Connection$Base;

    goto :goto_2e

    .line 749
    .end local v0    # "cd":Lorg/jsoup/parser/TokenQueue;
    .end local v1    # "cookieName":Ljava/lang/String;
    .end local v2    # "cookieVal":Ljava/lang/String;
    .end local v5    # "value":Ljava/lang/String;
    :cond_5f
    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_8

    .line 750
    const/4 v7, 0x0

    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {p0, v4, v7}, Lorg/jsoup/helper/HttpConnection$Response;->header(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/Connection$Base;

    goto :goto_8

    .line 753
    .end local v3    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    .end local v4    # "name":Ljava/lang/String;
    .end local v6    # "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_70
    return-void
.end method

.method public statusCode()I
    .registers 2

    .prologue
    .line 586
    iget v0, p0, Lorg/jsoup/helper/HttpConnection$Response;->statusCode:I

    return v0
.end method

.method public statusMessage()Ljava/lang/String;
    .registers 2

    .prologue
    .line 590
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection$Response;->statusMessage:Ljava/lang/String;

    return-object v0
.end method

.method public bridge synthetic url()Ljava/net/URL;
    .registers 2

    .prologue
    .line 461
    invoke-super {p0}, Lorg/jsoup/helper/HttpConnection$Base;->url()Ljava/net/URL;

    move-result-object v0

    return-object v0
.end method
