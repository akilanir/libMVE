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
    .line 524
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

    .line 527
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/jsoup/helper/HttpConnection$Base;-><init>(Lorg/jsoup/helper/HttpConnection$1;)V

    .line 517
    iput-boolean v1, p0, Lorg/jsoup/helper/HttpConnection$Response;->executed:Z

    .line 518
    iput v1, p0, Lorg/jsoup/helper/HttpConnection$Response;->numRedirects:I

    .line 528
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

    .line 531
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/jsoup/helper/HttpConnection$Base;-><init>(Lorg/jsoup/helper/HttpConnection$1;)V

    .line 517
    iput-boolean v4, p0, Lorg/jsoup/helper/HttpConnection$Response;->executed:Z

    .line 518
    iput v4, p0, Lorg/jsoup/helper/HttpConnection$Response;->numRedirects:I

    .line 532
    if-eqz p1, :cond_2c

    .line 533
    iget v0, p1, Lorg/jsoup/helper/HttpConnection$Response;->numRedirects:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/jsoup/helper/HttpConnection$Response;->numRedirects:I

    .line 534
    iget v0, p0, Lorg/jsoup/helper/HttpConnection$Response;->numRedirects:I

    const/16 v1, 0x14

    if-lt v0, v1, :cond_2c

    .line 535
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

    .line 537
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
    .line 678
    .line 679
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->proxy()Ljava/net/Proxy;

    move-result-object v2

    if-nez v2, :cond_98

    .line 680
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->url()Ljava/net/URL;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v2

    .line 681
    :goto_e
    check-cast v2, Ljava/net/HttpURLConnection;

    move-object v0, v2

    check-cast v0, Ljava/net/HttpURLConnection;

    .line 684
    .local v0, "conn":Ljava/net/HttpURLConnection;
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->method()Lorg/jsoup/Connection$Method;

    move-result-object v2

    invoke-virtual {v2}, Lorg/jsoup/Connection$Method;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 685
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    .line 686
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->timeout()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 687
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->timeout()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 689
    instance-of v2, v0, Ljavax/net/ssl/HttpsURLConnection;

    if-eqz v2, :cond_4f

    .line 690
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->validateTLSCertificates()Z

    move-result v2

    if-nez v2, :cond_4f

    .line 691
    invoke-static {}, Lorg/jsoup/helper/HttpConnection$Response;->initUnSecureTSL()V

    move-object v2, v0

    .line 692
    check-cast v2, Ljavax/net/ssl/HttpsURLConnection;

    sget-object v3, Lorg/jsoup/helper/HttpConnection$Response;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    invoke-virtual {v2, v3}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    move-object v2, v0

    .line 693
    check-cast v2, Ljavax/net/ssl/HttpsURLConnection;

    invoke-static {}, Lorg/jsoup/helper/HttpConnection$Response;->getInsecureVerifier()Ljavax/net/ssl/HostnameVerifier;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 697
    :cond_4f
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->method()Lorg/jsoup/Connection$Method;

    move-result-object v2

    invoke-virtual {v2}, Lorg/jsoup/Connection$Method;->hasBody()Z

    move-result v2

    if-eqz v2, :cond_5d

    .line 698
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 699
    :cond_5d
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->cookies()Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v2

    if-lez v2, :cond_70

    .line 700
    const-string v2, "Cookie"

    invoke-static {p0}, Lorg/jsoup/helper/HttpConnection$Response;->getRequestCookieString(Lorg/jsoup/Connection$Request;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/net/HttpURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 701
    :cond_70
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->headers()Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_7c
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_a6

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 702
    .local v1, "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Ljava/net/HttpURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_7c

    .line 681
    .end local v0    # "conn":Ljava/net/HttpURLConnection;
    .end local v1    # "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_98
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->url()Ljava/net/URL;

    move-result-object v2

    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->proxy()Ljava/net/Proxy;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/net/URL;->openConnection(Ljava/net/Proxy;)Ljava/net/URLConnection;

    move-result-object v2

    goto/16 :goto_e

    .line 704
    .restart local v0    # "conn":Ljava/net/HttpURLConnection;
    :cond_a6
    return-object v0
.end method

.method private static createHeaderMap(Ljava/net/HttpURLConnection;)Ljava/util/LinkedHashMap;
    .registers 7
    .param p0, "conn"    # Ljava/net/HttpURLConnection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/HttpURLConnection;",
            ")",
            "Ljava/util/LinkedHashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 785
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 786
    .local v0, "headers":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    const/4 v1, 0x0

    .line 788
    .local v1, "i":I
    :cond_6
    :goto_6
    invoke-virtual {p0, v1}, Ljava/net/HttpURLConnection;->getHeaderFieldKey(I)Ljava/lang/String;

    move-result-object v2

    .line 789
    .local v2, "key":Ljava/lang/String;
    invoke-virtual {p0, v1}, Ljava/net/HttpURLConnection;->getHeaderField(I)Ljava/lang/String;

    move-result-object v3

    .line 790
    .local v3, "val":Ljava/lang/String;
    if-nez v2, :cond_13

    if-nez v3, :cond_13

    .line 804
    return-object v0

    .line 792
    :cond_13
    add-int/lit8 v1, v1, 0x1

    .line 793
    if-eqz v2, :cond_6

    if-eqz v3, :cond_6

    .line 796
    invoke-virtual {v0, v2}, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_29

    .line 797
    invoke-virtual {v0, v2}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    invoke-interface {v5, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_6

    .line 799
    :cond_29
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 800
    .local v4, "vals":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 801
    invoke-virtual {v0, v2, v4}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_6
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
    .line 540
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/jsoup/helper/HttpConnection$Response;->execute(Lorg/jsoup/Connection$Request;Lorg/jsoup/helper/HttpConnection$Response;)Lorg/jsoup/helper/HttpConnection$Response;

    move-result-object v0

    return-object v0
.end method

.method static execute(Lorg/jsoup/Connection$Request;Lorg/jsoup/helper/HttpConnection$Response;)Lorg/jsoup/helper/HttpConnection$Response;
    .registers 18
    .param p0, "req"    # Lorg/jsoup/Connection$Request;
    .param p1, "previousResponse"    # Lorg/jsoup/helper/HttpConnection$Response;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 544
    const-string v13, "Request must not be null"

    move-object/from16 v0, p0

    invoke-static {v0, v13}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 545
    invoke-interface/range {p0 .. p0}, Lorg/jsoup/Connection$Request;->url()Ljava/net/URL;

    move-result-object v13

    invoke-virtual {v13}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v10

    .line 546
    .local v10, "protocol":Ljava/lang/String;
    const-string v13, "http"

    invoke-virtual {v10, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_27

    const-string v13, "https"

    invoke-virtual {v10, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_27

    .line 547
    new-instance v13, Ljava/net/MalformedURLException;

    const-string v14, "Only http & https protocols supported"

    invoke-direct {v13, v14}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 548
    :cond_27
    invoke-interface/range {p0 .. p0}, Lorg/jsoup/Connection$Request;->method()Lorg/jsoup/Connection$Method;

    move-result-object v13

    invoke-virtual {v13}, Lorg/jsoup/Connection$Method;->hasBody()Z

    move-result v8

    .line 549
    .local v8, "methodHasBody":Z
    invoke-interface/range {p0 .. p0}, Lorg/jsoup/Connection$Request;->requestBody()Ljava/lang/String;

    move-result-object v13

    if-eqz v13, :cond_10a

    const/4 v6, 0x1

    .line 550
    .local v6, "hasRequestBody":Z
    :goto_36
    if-nez v8, :cond_52

    .line 551
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Cannot set a request body for HTTP method "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-interface/range {p0 .. p0}, Lorg/jsoup/Connection$Request;->method()Lorg/jsoup/Connection$Method;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v6, v13}, Lorg/jsoup/helper/Validate;->isFalse(ZLjava/lang/String;)V

    .line 554
    :cond_52
    const/4 v9, 0x0

    .line 555
    .local v9, "mimeBoundary":Ljava/lang/String;
    invoke-interface/range {p0 .. p0}, Lorg/jsoup/Connection$Request;->data()Ljava/util/Collection;

    move-result-object v13

    invoke-interface {v13}, Ljava/util/Collection;->size()I

    move-result v13

    if-lez v13, :cond_10d

    if-eqz v8, :cond_61

    if-eqz v6, :cond_10d

    .line 556
    :cond_61
    invoke-static/range {p0 .. p0}, Lorg/jsoup/helper/HttpConnection$Response;->serialiseRequestUrl(Lorg/jsoup/Connection$Request;)V

    .line 560
    :cond_64
    :goto_64
    invoke-static/range {p0 .. p0}, Lorg/jsoup/helper/HttpConnection$Response;->createConnection(Lorg/jsoup/Connection$Request;)Ljava/net/HttpURLConnection;

    move-result-object v3

    .line 563
    .local v3, "conn":Ljava/net/HttpURLConnection;
    :try_start_68
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->connect()V

    .line 564
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->getDoOutput()Z

    move-result v13

    if-eqz v13, :cond_7a

    .line 565
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v13

    move-object/from16 v0, p0

    invoke-static {v0, v13, v9}, Lorg/jsoup/helper/HttpConnection$Response;->writePost(Lorg/jsoup/Connection$Request;Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 567
    :cond_7a
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v12

    .line 568
    .local v12, "status":I
    new-instance v11, Lorg/jsoup/helper/HttpConnection$Response;

    move-object/from16 v0, p1

    invoke-direct {v11, v0}, Lorg/jsoup/helper/HttpConnection$Response;-><init>(Lorg/jsoup/helper/HttpConnection$Response;)V

    .line 569
    .local v11, "res":Lorg/jsoup/helper/HttpConnection$Response;
    move-object/from16 v0, p1

    invoke-direct {v11, v3, v0}, Lorg/jsoup/helper/HttpConnection$Response;->setupFromConnection(Ljava/net/HttpURLConnection;Lorg/jsoup/Connection$Response;)V

    .line 570
    move-object/from16 v0, p0

    iput-object v0, v11, Lorg/jsoup/helper/HttpConnection$Response;->req:Lorg/jsoup/Connection$Request;

    .line 573
    const-string v13, "Location"

    invoke-virtual {v11, v13}, Lorg/jsoup/helper/HttpConnection$Response;->hasHeader(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_11f

    invoke-interface/range {p0 .. p0}, Lorg/jsoup/Connection$Request;->followRedirects()Z

    move-result v13

    if-eqz v13, :cond_11f

    .line 574
    const/16 v13, 0x133

    if-eq v12, v13, :cond_ae

    .line 575
    sget-object v13, Lorg/jsoup/Connection$Method;->GET:Lorg/jsoup/Connection$Method;

    move-object/from16 v0, p0

    invoke-interface {v0, v13}, Lorg/jsoup/Connection$Request;->method(Lorg/jsoup/Connection$Method;)Lorg/jsoup/Connection$Base;

    .line 576
    invoke-interface/range {p0 .. p0}, Lorg/jsoup/Connection$Request;->data()Ljava/util/Collection;

    move-result-object v13

    invoke-interface {v13}, Ljava/util/Collection;->clear()V

    .line 579
    :cond_ae
    const-string v13, "Location"

    invoke-virtual {v11, v13}, Lorg/jsoup/helper/HttpConnection$Response;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 580
    .local v7, "location":Ljava/lang/String;
    if-eqz v7, :cond_cc

    const-string v13, "http:/"

    invoke-virtual {v7, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_cc

    const/4 v13, 0x6

    invoke-virtual {v7, v13}, Ljava/lang/String;->charAt(I)C

    move-result v13

    const/16 v14, 0x2f

    if-eq v13, v14, :cond_cc

    .line 581
    const/4 v13, 0x6

    invoke-virtual {v7, v13}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    .line 582
    :cond_cc
    invoke-interface/range {p0 .. p0}, Lorg/jsoup/Connection$Request;->url()Ljava/net/URL;

    move-result-object v13

    # invokes: Lorg/jsoup/helper/HttpConnection;->encodeUrl(Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v7}, Lorg/jsoup/helper/HttpConnection;->access$200(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lorg/jsoup/helper/StringUtil;->resolve(Ljava/net/URL;Ljava/lang/String;)Ljava/net/URL;

    move-result-object v13

    move-object/from16 v0, p0

    invoke-interface {v0, v13}, Lorg/jsoup/Connection$Request;->url(Ljava/net/URL;)Lorg/jsoup/Connection$Base;

    .line 584
    iget-object v13, v11, Lorg/jsoup/helper/HttpConnection$Response;->cookies:Ljava/util/Map;

    invoke-interface {v13}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v13

    invoke-interface {v13}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :goto_e7
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_115

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map$Entry;

    .line 585
    .local v5, "cookie":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    move-object/from16 v0, p0

    invoke-interface {v0, v13, v14}, Lorg/jsoup/Connection$Request;->cookie(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/Connection$Base;
    :try_end_104
    .catchall {:try_start_68 .. :try_end_104} :catchall_105

    goto :goto_e7

    .line 628
    .end local v5    # "cookie":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v7    # "location":Ljava/lang/String;
    .end local v11    # "res":Lorg/jsoup/helper/HttpConnection$Response;
    .end local v12    # "status":I
    :catchall_105
    move-exception v13

    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V

    throw v13

    .line 549
    .end local v3    # "conn":Ljava/net/HttpURLConnection;
    .end local v6    # "hasRequestBody":Z
    .end local v9    # "mimeBoundary":Ljava/lang/String;
    :cond_10a
    const/4 v6, 0x0

    goto/16 :goto_36

    .line 557
    .restart local v6    # "hasRequestBody":Z
    .restart local v9    # "mimeBoundary":Ljava/lang/String;
    :cond_10d
    if-eqz v8, :cond_64

    .line 558
    invoke-static/range {p0 .. p0}, Lorg/jsoup/helper/HttpConnection$Response;->setOutputContentType(Lorg/jsoup/Connection$Request;)Ljava/lang/String;

    move-result-object v9

    goto/16 :goto_64

    .line 587
    .restart local v3    # "conn":Ljava/net/HttpURLConnection;
    .restart local v7    # "location":Ljava/lang/String;
    .restart local v11    # "res":Lorg/jsoup/helper/HttpConnection$Response;
    .restart local v12    # "status":I
    :cond_115
    :try_start_115
    move-object/from16 v0, p0

    invoke-static {v0, v11}, Lorg/jsoup/helper/HttpConnection$Response;->execute(Lorg/jsoup/Connection$Request;Lorg/jsoup/helper/HttpConnection$Response;)Lorg/jsoup/helper/HttpConnection$Response;
    :try_end_11a
    .catchall {:try_start_115 .. :try_end_11a} :catchall_105

    move-result-object v11

    .line 628
    .end local v11    # "res":Lorg/jsoup/helper/HttpConnection$Response;
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 632
    .end local v7    # "location":Ljava/lang/String;
    :goto_11e
    return-object v11

    .line 589
    .restart local v11    # "res":Lorg/jsoup/helper/HttpConnection$Response;
    :cond_11f
    const/16 v13, 0xc8

    if-lt v12, v13, :cond_127

    const/16 v13, 0x190

    if-lt v12, v13, :cond_13d

    :cond_127
    :try_start_127
    invoke-interface/range {p0 .. p0}, Lorg/jsoup/Connection$Request;->ignoreHttpErrors()Z

    move-result v13

    if-nez v13, :cond_13d

    .line 590
    new-instance v13, Lorg/jsoup/HttpStatusException;

    const-string v14, "HTTP error fetching URL"

    invoke-interface/range {p0 .. p0}, Lorg/jsoup/Connection$Request;->url()Ljava/net/URL;

    move-result-object v15

    invoke-virtual {v15}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v13, v14, v12, v15}, Lorg/jsoup/HttpStatusException;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    throw v13

    .line 593
    :cond_13d
    invoke-virtual {v11}, Lorg/jsoup/helper/HttpConnection$Response;->contentType()Ljava/lang/String;

    move-result-object v4

    .line 594
    .local v4, "contentType":Ljava/lang/String;
    if-eqz v4, :cond_16d

    .line 595
    invoke-interface/range {p0 .. p0}, Lorg/jsoup/Connection$Request;->ignoreContentType()Z

    move-result v13

    if-nez v13, :cond_16d

    const-string v13, "text/"

    .line 596
    invoke-virtual {v4, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v13

    if-nez v13, :cond_16d

    sget-object v13, Lorg/jsoup/helper/HttpConnection$Response;->xmlContentTypeRxp:Ljava/util/regex/Pattern;

    .line 597
    invoke-virtual {v13, v4}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v13

    invoke-virtual {v13}, Ljava/util/regex/Matcher;->matches()Z

    move-result v13

    if-nez v13, :cond_16d

    .line 599
    new-instance v13, Lorg/jsoup/UnsupportedMimeTypeException;

    const-string v14, "Unhandled content type. Must be text/*, application/xml, or application/xhtml+xml"

    .line 600
    invoke-interface/range {p0 .. p0}, Lorg/jsoup/Connection$Request;->url()Ljava/net/URL;

    move-result-object v15

    invoke-virtual {v15}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v13, v14, v4, v15}, Lorg/jsoup/UnsupportedMimeTypeException;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    throw v13

    .line 603
    :cond_16d
    if-eqz v4, :cond_195

    sget-object v13, Lorg/jsoup/helper/HttpConnection$Response;->xmlContentTypeRxp:Ljava/util/regex/Pattern;

    invoke-virtual {v13, v4}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v13

    invoke-virtual {v13}, Ljava/util/regex/Matcher;->matches()Z

    move-result v13

    if-eqz v13, :cond_195

    .line 605
    move-object/from16 v0, p0

    instance-of v13, v0, Lorg/jsoup/helper/HttpConnection$Request;

    if-eqz v13, :cond_195

    move-object/from16 v0, p0

    check-cast v0, Lorg/jsoup/helper/HttpConnection$Request;

    move-object v13, v0

    # getter for: Lorg/jsoup/helper/HttpConnection$Request;->parserDefined:Z
    invoke-static {v13}, Lorg/jsoup/helper/HttpConnection$Request;->access$300(Lorg/jsoup/helper/HttpConnection$Request;)Z

    move-result v13

    if-nez v13, :cond_195

    .line 606
    invoke-static {}, Lorg/jsoup/parser/Parser;->xmlParser()Lorg/jsoup/parser/Parser;

    move-result-object v13

    move-object/from16 v0, p0

    invoke-interface {v0, v13}, Lorg/jsoup/Connection$Request;->parser(Lorg/jsoup/parser/Parser;)Lorg/jsoup/Connection$Request;

    .line 610
    :cond_195
    iget-object v13, v11, Lorg/jsoup/helper/HttpConnection$Response;->contentType:Ljava/lang/String;

    invoke-static {v13}, Lorg/jsoup/helper/DataUtil;->getCharsetFromContentType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    iput-object v13, v11, Lorg/jsoup/helper/HttpConnection$Response;->charset:Ljava/lang/String;

    .line 611
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->getContentLength()I

    move-result v13

    if-eqz v13, :cond_1e9

    invoke-interface/range {p0 .. p0}, Lorg/jsoup/Connection$Request;->method()Lorg/jsoup/Connection$Method;

    move-result-object v13

    sget-object v14, Lorg/jsoup/Connection$Method;->HEAD:Lorg/jsoup/Connection$Method;
    :try_end_1a9
    .catchall {:try_start_127 .. :try_end_1a9} :catchall_105

    if-eq v13, v14, :cond_1e9

    .line 612
    const/4 v1, 0x0

    .line 614
    .local v1, "bodyStream":Ljava/io/InputStream;
    :try_start_1ac
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object v13

    if-eqz v13, :cond_1dd

    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object v1

    .line 615
    :goto_1b6
    const-string v13, "Content-Encoding"

    const-string v14, "gzip"

    invoke-virtual {v11, v13, v14}, Lorg/jsoup/helper/HttpConnection$Response;->hasHeaderWithValue(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_1c6

    .line 616
    new-instance v2, Ljava/util/zip/GZIPInputStream;

    invoke-direct {v2, v1}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V

    .end local v1    # "bodyStream":Ljava/io/InputStream;
    .local v2, "bodyStream":Ljava/io/InputStream;
    move-object v1, v2

    .line 618
    .end local v2    # "bodyStream":Ljava/io/InputStream;
    :cond_1c6
    invoke-interface/range {p0 .. p0}, Lorg/jsoup/Connection$Request;->maxBodySize()I

    move-result v13

    invoke-static {v1, v13}, Lorg/jsoup/helper/DataUtil;->readToByteBuffer(Ljava/io/InputStream;I)Ljava/nio/ByteBuffer;

    move-result-object v13

    iput-object v13, v11, Lorg/jsoup/helper/HttpConnection$Response;->byteData:Ljava/nio/ByteBuffer;
    :try_end_1d0
    .catchall {:try_start_1ac .. :try_end_1d0} :catchall_1e2

    .line 620
    if-eqz v1, :cond_1d5

    :try_start_1d2
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_1d5
    .catchall {:try_start_1d2 .. :try_end_1d5} :catchall_105

    .line 628
    :cond_1d5
    :goto_1d5
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 631
    const/4 v13, 0x1

    iput-boolean v13, v11, Lorg/jsoup/helper/HttpConnection$Response;->executed:Z

    goto/16 :goto_11e

    .line 614
    .restart local v1    # "bodyStream":Ljava/io/InputStream;
    :cond_1dd
    :try_start_1dd
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;
    :try_end_1e0
    .catchall {:try_start_1dd .. :try_end_1e0} :catchall_1e2

    move-result-object v1

    goto :goto_1b6

    .line 620
    .end local v1    # "bodyStream":Ljava/io/InputStream;
    :catchall_1e2
    move-exception v13

    if-eqz v1, :cond_1e8

    :try_start_1e5
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    :cond_1e8
    throw v13

    .line 623
    :cond_1e9
    invoke-static {}, Lorg/jsoup/helper/DataUtil;->emptyByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v13

    iput-object v13, v11, Lorg/jsoup/helper/HttpConnection$Response;->byteData:Ljava/nio/ByteBuffer;
    :try_end_1ef
    .catchall {:try_start_1e5 .. :try_end_1ef} :catchall_105

    goto :goto_1d5
.end method

.method private static getInsecureVerifier()Ljavax/net/ssl/HostnameVerifier;
    .registers 1

    .prologue
    .line 715
    new-instance v0, Lorg/jsoup/helper/HttpConnection$Response$1;

    invoke-direct {v0}, Lorg/jsoup/helper/HttpConnection$Response$1;-><init>()V

    return-object v0
.end method

.method private static getRequestCookieString(Lorg/jsoup/Connection$Request;)Ljava/lang/String;
    .registers 7
    .param p0, "req"    # Lorg/jsoup/Connection$Request;

    .prologue
    .line 905
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 906
    .local v2, "sb":Ljava/lang/StringBuilder;
    const/4 v1, 0x1

    .line 907
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

    .line 908
    .local v0, "cookie":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    if-nez v1, :cond_3f

    .line 909
    const-string v3, "; "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 912
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

    .line 911
    :cond_3f
    const/4 v1, 0x0

    goto :goto_25

    .line 915
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
    .line 732
    const-class v4, Lorg/jsoup/helper/HttpConnection$Response;

    monitor-enter v4

    :try_start_3
    sget-object v3, Lorg/jsoup/helper/HttpConnection$Response;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    if-nez v3, :cond_27

    .line 734
    const/4 v3, 0x1

    new-array v2, v3, [Ljavax/net/ssl/TrustManager;

    const/4 v3, 0x0

    new-instance v5, Lorg/jsoup/helper/HttpConnection$Response$2;

    invoke-direct {v5}, Lorg/jsoup/helper/HttpConnection$Response$2;-><init>()V

    aput-object v5, v2, v3
    :try_end_12
    .catchall {:try_start_3 .. :try_end_12} :catchall_32

    .line 750
    .local v2, "trustAllCerts":[Ljavax/net/ssl/TrustManager;
    :try_start_12
    const-string v3, "SSL"

    invoke-static {v3}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v1

    .line 751
    .local v1, "sslContext":Ljavax/net/ssl/SSLContext;
    const/4 v3, 0x0

    new-instance v5, Ljava/security/SecureRandom;

    invoke-direct {v5}, Ljava/security/SecureRandom;-><init>()V

    invoke-virtual {v1, v3, v2, v5}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 753
    invoke-virtual {v1}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v3

    sput-object v3, Lorg/jsoup/helper/HttpConnection$Response;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;
    :try_end_27
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_12 .. :try_end_27} :catch_29
    .catch Ljava/security/KeyManagementException; {:try_start_12 .. :try_end_27} :catch_35
    .catchall {:try_start_12 .. :try_end_27} :catchall_32

    .line 761
    :cond_27
    monitor-exit v4

    return-void

    .line 754
    .end local v1    # "sslContext":Ljavax/net/ssl/SSLContext;
    :catch_29
    move-exception v0

    .line 755
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    :try_start_2a
    new-instance v3, Ljava/io/IOException;

    const-string v5, "Can\'t create unsecure trust manager"

    invoke-direct {v3, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_32
    .catchall {:try_start_2a .. :try_end_32} :catchall_32

    .line 732
    .end local v0    # "e":Ljava/security/NoSuchAlgorithmException;
    :catchall_32
    move-exception v3

    monitor-exit v4

    throw v3

    .line 756
    :catch_35
    move-exception v0

    .line 757
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
    .line 920
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->url()Ljava/net/URL;

    move-result-object v1

    .line 921
    .local v1, "in":Ljava/net/URL;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 922
    .local v3, "url":Ljava/lang/StringBuilder;
    const/4 v0, 0x1

    .line 925
    .local v0, "first":Z
    invoke-virtual {v1}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "://"

    .line 926
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 927
    invoke-virtual {v1}, Ljava/net/URL;->getAuthority()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 928
    invoke-virtual {v1}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "?"

    .line 929
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 930
    invoke-virtual {v1}, Ljava/net/URL;->getQuery()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_3b

    .line 931
    invoke-virtual {v1}, Ljava/net/URL;->getQuery()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 932
    const/4 v0, 0x0

    .line 934
    :cond_3b
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->data()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_43
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_83

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jsoup/Connection$KeyVal;

    .line 935
    .local v2, "keyVal":Lorg/jsoup/Connection$KeyVal;
    invoke-interface {v2}, Lorg/jsoup/Connection$KeyVal;->hasInputStream()Z

    move-result v5

    const-string v6, "InputStream data not supported in URL query string."

    invoke-static {v5, v6}, Lorg/jsoup/helper/Validate;->isFalse(ZLjava/lang/String;)V

    .line 936
    if-nez v0, :cond_81

    .line 937
    const/16 v5, 0x26

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 941
    :goto_5f
    invoke-interface {v2}, Lorg/jsoup/Connection$KeyVal;->key()Ljava/lang/String;

    move-result-object v5

    const-string v6, "UTF-8"

    invoke-static {v5, v6}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/16 v6, 0x3d

    .line 942
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 943
    invoke-interface {v2}, Lorg/jsoup/Connection$KeyVal;->value()Ljava/lang/String;

    move-result-object v6

    const-string v7, "UTF-8"

    invoke-static {v6, v7}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_43

    .line 939
    :cond_81
    const/4 v0, 0x0

    goto :goto_5f

    .line 945
    .end local v2    # "keyVal":Lorg/jsoup/Connection$KeyVal;
    :cond_83
    new-instance v4, Ljava/net/URL;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-interface {p0, v4}, Lorg/jsoup/Connection$Request;->url(Ljava/net/URL;)Lorg/jsoup/Connection$Base;

    .line 946
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->data()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->clear()V

    .line 947
    return-void
.end method

.method private static setOutputContentType(Lorg/jsoup/Connection$Request;)Ljava/lang/String;
    .registers 5
    .param p0, "req"    # Lorg/jsoup/Connection$Request;

    .prologue
    .line 844
    const/4 v0, 0x0

    .line 845
    .local v0, "bound":Ljava/lang/String;
    # invokes: Lorg/jsoup/helper/HttpConnection;->needsMultipart(Lorg/jsoup/Connection$Request;)Z
    invoke-static {p0}, Lorg/jsoup/helper/HttpConnection;->access$400(Lorg/jsoup/Connection$Request;)Z

    move-result v1

    if-eqz v1, :cond_24

    .line 846
    invoke-static {}, Lorg/jsoup/helper/DataUtil;->mimeBoundary()Ljava/lang/String;

    move-result-object v0

    .line 847
    const-string v1, "Content-Type"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "multipart/form-data; boundary="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p0, v1, v2}, Lorg/jsoup/Connection$Request;->header(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/Connection$Base;

    .line 851
    :goto_23
    return-object v0

    .line 849
    :cond_24
    const-string v1, "Content-Type"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "application/x-www-form-urlencoded; charset="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->postDataCharset()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p0, v1, v2}, Lorg/jsoup/Connection$Request;->header(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/Connection$Base;

    goto :goto_23
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
    .line 765
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getRequestMethod()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/jsoup/Connection$Method;->valueOf(Ljava/lang/String;)Lorg/jsoup/Connection$Method;

    move-result-object v2

    iput-object v2, p0, Lorg/jsoup/helper/HttpConnection$Response;->method:Lorg/jsoup/Connection$Method;

    .line 766
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getURL()Ljava/net/URL;

    move-result-object v2

    iput-object v2, p0, Lorg/jsoup/helper/HttpConnection$Response;->url:Ljava/net/URL;

    .line 767
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v2

    iput v2, p0, Lorg/jsoup/helper/HttpConnection$Response;->statusCode:I

    .line 768
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getResponseMessage()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lorg/jsoup/helper/HttpConnection$Response;->statusMessage:Ljava/lang/String;

    .line 769
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getContentType()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lorg/jsoup/helper/HttpConnection$Response;->contentType:Ljava/lang/String;

    .line 771
    invoke-static {p1}, Lorg/jsoup/helper/HttpConnection$Response;->createHeaderMap(Ljava/net/HttpURLConnection;)Ljava/util/LinkedHashMap;

    move-result-object v1

    .line 772
    .local v1, "resHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-virtual {p0, v1}, Lorg/jsoup/helper/HttpConnection$Response;->processResponseHeaders(Ljava/util/Map;)V

    .line 775
    if-eqz p2, :cond_5f

    .line 776
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

    .line 777
    .local v0, "prevCookie":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p0, v2}, Lorg/jsoup/helper/HttpConnection$Response;->hasCookie(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_37

    .line 778
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {p0, v2, v3}, Lorg/jsoup/helper/HttpConnection$Response;->cookie(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/Connection$Base;

    goto :goto_37

    .line 781
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
    .line 855
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->data()Ljava/util/Collection;

    move-result-object v0

    .line 856
    .local v0, "data":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/jsoup/Connection$KeyVal;>;"
    new-instance v3, Ljava/io/BufferedWriter;

    new-instance v4, Ljava/io/OutputStreamWriter;

    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->postDataCharset()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, p1, v5}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    invoke-direct {v3, v4}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    .line 858
    .local v3, "w":Ljava/io/BufferedWriter;
    if-eqz p2, :cond_92

    .line 860
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_18
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_81

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jsoup/Connection$KeyVal;

    .line 861
    .local v2, "keyVal":Lorg/jsoup/Connection$KeyVal;
    const-string v5, "--"

    invoke-virtual {v3, v5}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 862
    invoke-virtual {v3, p2}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 863
    const-string v5, "\r\n"

    invoke-virtual {v3, v5}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 864
    const-string v5, "Content-Disposition: form-data; name=\""

    invoke-virtual {v3, v5}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 865
    invoke-interface {v2}, Lorg/jsoup/Connection$KeyVal;->key()Ljava/lang/String;

    move-result-object v5

    # invokes: Lorg/jsoup/helper/HttpConnection;->encodeMimeName(Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v5}, Lorg/jsoup/helper/HttpConnection;->access$500(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 866
    const-string v5, "\""

    invoke-virtual {v3, v5}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 867
    invoke-interface {v2}, Lorg/jsoup/Connection$KeyVal;->hasInputStream()Z

    move-result v5

    if-eqz v5, :cond_74

    .line 868
    const-string v5, "; filename=\""

    invoke-virtual {v3, v5}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 869
    invoke-interface {v2}, Lorg/jsoup/Connection$KeyVal;->value()Ljava/lang/String;

    move-result-object v5

    # invokes: Lorg/jsoup/helper/HttpConnection;->encodeMimeName(Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v5}, Lorg/jsoup/helper/HttpConnection;->access$500(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 870
    const-string v5, "\"\r\nContent-Type: application/octet-stream\r\n\r\n"

    invoke-virtual {v3, v5}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 871
    invoke-virtual {v3}, Ljava/io/BufferedWriter;->flush()V

    .line 872
    invoke-interface {v2}, Lorg/jsoup/Connection$KeyVal;->inputStream()Ljava/io/InputStream;

    move-result-object v5

    invoke-static {v5, p1}, Lorg/jsoup/helper/DataUtil;->crossStreams(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 873
    invoke-virtual {p1}, Ljava/io/OutputStream;->flush()V

    .line 878
    :goto_6e
    const-string v5, "\r\n"

    invoke-virtual {v3, v5}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    goto :goto_18

    .line 875
    :cond_74
    const-string v5, "\r\n\r\n"

    invoke-virtual {v3, v5}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 876
    invoke-interface {v2}, Lorg/jsoup/Connection$KeyVal;->value()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    goto :goto_6e

    .line 880
    .end local v2    # "keyVal":Lorg/jsoup/Connection$KeyVal;
    :cond_81
    const-string v4, "--"

    invoke-virtual {v3, v4}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 881
    invoke-virtual {v3, p2}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 882
    const-string v4, "--"

    invoke-virtual {v3, v4}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 901
    :cond_8e
    :goto_8e
    invoke-virtual {v3}, Ljava/io/BufferedWriter;->close()V

    .line 902
    return-void

    .line 883
    :cond_92
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->requestBody()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_a0

    .line 885
    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->requestBody()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    goto :goto_8e

    .line 889
    :cond_a0
    const/4 v1, 0x1

    .line 890
    .local v1, "first":Z
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_a5
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_8e

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jsoup/Connection$KeyVal;

    .line 891
    .restart local v2    # "keyVal":Lorg/jsoup/Connection$KeyVal;
    if-nez v1, :cond_dc

    .line 892
    const/16 v5, 0x26

    invoke-virtual {v3, v5}, Ljava/io/BufferedWriter;->append(C)Ljava/io/Writer;

    .line 896
    :goto_b8
    invoke-interface {v2}, Lorg/jsoup/Connection$KeyVal;->key()Ljava/lang/String;

    move-result-object v5

    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->postDataCharset()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 897
    const/16 v5, 0x3d

    invoke-virtual {v3, v5}, Ljava/io/BufferedWriter;->write(I)V

    .line 898
    invoke-interface {v2}, Lorg/jsoup/Connection$KeyVal;->value()Ljava/lang/String;

    move-result-object v5

    invoke-interface {p0}, Lorg/jsoup/Connection$Request;->postDataCharset()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    goto :goto_a5

    .line 894
    :cond_dc
    const/4 v1, 0x0

    goto :goto_b8
.end method


# virtual methods
.method public body()Ljava/lang/String;
    .registers 4

    .prologue
    .line 660
    iget-boolean v1, p0, Lorg/jsoup/helper/HttpConnection$Response;->executed:Z

    const-string v2, "Request must be executed (with .execute(), .get(), or .post() before getting response body"

    invoke-static {v1, v2}, Lorg/jsoup/helper/Validate;->isTrue(ZLjava/lang/String;)V

    .line 663
    iget-object v1, p0, Lorg/jsoup/helper/HttpConnection$Response;->charset:Ljava/lang/String;

    if-nez v1, :cond_21

    .line 664
    const-string v1, "UTF-8"

    invoke-static {v1}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v1

    iget-object v2, p0, Lorg/jsoup/helper/HttpConnection$Response;->byteData:Ljava/nio/ByteBuffer;

    invoke-virtual {v1, v2}, Ljava/nio/charset/Charset;->decode(Ljava/nio/ByteBuffer;)Ljava/nio/CharBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/CharBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 667
    .local v0, "body":Ljava/lang/String;
    :goto_1b
    iget-object v1, p0, Lorg/jsoup/helper/HttpConnection$Response;->byteData:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 668
    return-object v0

    .line 666
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
    .line 672
    iget-boolean v0, p0, Lorg/jsoup/helper/HttpConnection$Response;->executed:Z

    const-string v1, "Request must be executed (with .execute(), .get(), or .post() before getting response body"

    invoke-static {v0, v1}, Lorg/jsoup/helper/Validate;->isTrue(ZLjava/lang/String;)V

    .line 673
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection$Response;->byteData:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    return-object v0
.end method

.method public charset()Ljava/lang/String;
    .registers 2

    .prologue
    .line 644
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection$Response;->charset:Ljava/lang/String;

    return-object v0
.end method

.method public contentType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 648
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection$Response;->contentType:Ljava/lang/String;

    return-object v0
.end method

.method public bridge synthetic cookie(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .prologue
    .line 508
    invoke-super {p0, p1}, Lorg/jsoup/helper/HttpConnection$Base;->cookie(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic cookies()Ljava/util/Map;
    .registers 2

    .prologue
    .line 508
    invoke-super {p0}, Lorg/jsoup/helper/HttpConnection$Base;->cookies()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic hasCookie(Ljava/lang/String;)Z
    .registers 3

    .prologue
    .line 508
    invoke-super {p0, p1}, Lorg/jsoup/helper/HttpConnection$Base;->hasCookie(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic hasHeader(Ljava/lang/String;)Z
    .registers 3

    .prologue
    .line 508
    invoke-super {p0, p1}, Lorg/jsoup/helper/HttpConnection$Base;->hasHeader(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic hasHeaderWithValue(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 4

    .prologue
    .line 508
    invoke-super {p0, p1, p2}, Lorg/jsoup/helper/HttpConnection$Base;->hasHeaderWithValue(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic header(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .prologue
    .line 508
    invoke-super {p0, p1}, Lorg/jsoup/helper/HttpConnection$Base;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic headers()Ljava/util/Map;
    .registers 2

    .prologue
    .line 508
    invoke-super {p0}, Lorg/jsoup/helper/HttpConnection$Base;->headers()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic method()Lorg/jsoup/Connection$Method;
    .registers 2

    .prologue
    .line 508
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
    .line 652
    iget-boolean v1, p0, Lorg/jsoup/helper/HttpConnection$Response;->executed:Z

    const-string v2, "Request must be executed (with .execute(), .get(), or .post() before parsing response"

    invoke-static {v1, v2}, Lorg/jsoup/helper/Validate;->isTrue(ZLjava/lang/String;)V

    .line 653
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

    .line 654
    .local v0, "doc":Lorg/jsoup/nodes/Document;
    iget-object v1, p0, Lorg/jsoup/helper/HttpConnection$Response;->byteData:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 655
    invoke-virtual {v0}, Lorg/jsoup/nodes/Document;->outputSettings()Lorg/jsoup/nodes/Document$OutputSettings;

    move-result-object v1

    invoke-virtual {v1}, Lorg/jsoup/nodes/Document$OutputSettings;->charset()Ljava/nio/charset/Charset;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/jsoup/helper/HttpConnection$Response;->charset:Ljava/lang/String;

    .line 656
    return-object v0
.end method

.method processResponseHeaders(Ljava/util/Map;)V
    .registers 16
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
    .local p1, "resHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    const/4 v13, 0x1

    .line 808
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :cond_9
    :goto_9
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_9f

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .line 809
    .local v4, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 810
    .local v6, "name":Ljava/lang/String;
    if-eqz v6, :cond_9

    .line 813
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/List;

    .line 814
    .local v9, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v10, "Set-Cookie"

    invoke-virtual {v6, v10}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_60

    .line 815
    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :cond_2f
    :goto_2f
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_9

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 816
    .local v8, "value":Ljava/lang/String;
    if-eqz v8, :cond_2f

    .line 818
    new-instance v1, Lorg/jsoup/parser/TokenQueue;

    invoke-direct {v1, v8}, Lorg/jsoup/parser/TokenQueue;-><init>(Ljava/lang/String;)V

    .line 819
    .local v1, "cd":Lorg/jsoup/parser/TokenQueue;
    const-string v12, "="

    invoke-virtual {v1, v12}, Lorg/jsoup/parser/TokenQueue;->chompTo(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 820
    .local v2, "cookieName":Ljava/lang/String;
    const-string v12, ";"

    invoke-virtual {v1, v12}, Lorg/jsoup/parser/TokenQueue;->consumeTo(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    .line 823
    .local v3, "cookieVal":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v12

    if-lez v12, :cond_2f

    .line 824
    invoke-virtual {p0, v2, v3}, Lorg/jsoup/helper/HttpConnection$Response;->cookie(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/Connection$Base;

    goto :goto_2f

    .line 827
    .end local v1    # "cd":Lorg/jsoup/parser/TokenQueue;
    .end local v2    # "cookieName":Ljava/lang/String;
    .end local v3    # "cookieVal":Ljava/lang/String;
    .end local v8    # "value":Ljava/lang/String;
    :cond_60
    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v10

    if-ne v10, v13, :cond_71

    .line 828
    const/4 v10, 0x0

    invoke-interface {v9, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    invoke-virtual {p0, v6, v10}, Lorg/jsoup/helper/HttpConnection$Response;->header(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/Connection$Base;

    goto :goto_9

    .line 829
    :cond_71
    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v10

    if-le v10, v13, :cond_9

    .line 830
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 831
    .local v0, "accum":Ljava/lang/StringBuilder;
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_7d
    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v10

    if-ge v5, v10, :cond_96

    .line 832
    invoke-interface {v9, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 833
    .local v7, "val":Ljava/lang/String;
    if-eqz v5, :cond_90

    .line 834
    const-string v10, ", "

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 835
    :cond_90
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 831
    add-int/lit8 v5, v5, 0x1

    goto :goto_7d

    .line 837
    .end local v7    # "val":Ljava/lang/String;
    :cond_96
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {p0, v6, v10}, Lorg/jsoup/helper/HttpConnection$Response;->header(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/Connection$Base;

    goto/16 :goto_9

    .line 841
    .end local v0    # "accum":Ljava/lang/StringBuilder;
    .end local v4    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    .end local v5    # "i":I
    .end local v6    # "name":Ljava/lang/String;
    .end local v9    # "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_9f
    return-void
.end method

.method public statusCode()I
    .registers 2

    .prologue
    .line 636
    iget v0, p0, Lorg/jsoup/helper/HttpConnection$Response;->statusCode:I

    return v0
.end method

.method public statusMessage()Ljava/lang/String;
    .registers 2

    .prologue
    .line 640
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection$Response;->statusMessage:Ljava/lang/String;

    return-object v0
.end method

.method public bridge synthetic url()Ljava/net/URL;
    .registers 2

    .prologue
    .line 508
    invoke-super {p0}, Lorg/jsoup/helper/HttpConnection$Base;->url()Ljava/net/URL;

    move-result-object v0

    return-object v0
.end method
