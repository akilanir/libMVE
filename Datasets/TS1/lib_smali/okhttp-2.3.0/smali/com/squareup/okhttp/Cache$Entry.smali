.class final Lcom/squareup/okhttp/Cache$Entry;
.super Ljava/lang/Object;
.source "Cache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/okhttp/Cache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Entry"
.end annotation


# instance fields
.field private final code:I

.field private final handshake:Lcom/squareup/okhttp/Handshake;

.field private final message:Ljava/lang/String;

.field private final protocol:Lcom/squareup/okhttp/Protocol;

.field private final requestMethod:Ljava/lang/String;

.field private final responseHeaders:Lcom/squareup/okhttp/Headers;

.field private final url:Ljava/lang/String;

.field private final varyHeaders:Lcom/squareup/okhttp/Headers;


# direct methods
.method public constructor <init>(Lcom/squareup/okhttp/Response;)V
    .registers 3
    .param p1, "response"    # Lcom/squareup/okhttp/Response;

    .prologue
    .line 545
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 546
    invoke-virtual {p1}, Lcom/squareup/okhttp/Response;->request()Lcom/squareup/okhttp/Request;

    move-result-object v0

    invoke-virtual {v0}, Lcom/squareup/okhttp/Request;->urlString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/Cache$Entry;->url:Ljava/lang/String;

    .line 547
    invoke-static {p1}, Lcom/squareup/okhttp/internal/http/OkHeaders;->varyHeaders(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Headers;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/Cache$Entry;->varyHeaders:Lcom/squareup/okhttp/Headers;

    .line 548
    invoke-virtual {p1}, Lcom/squareup/okhttp/Response;->request()Lcom/squareup/okhttp/Request;

    move-result-object v0

    invoke-virtual {v0}, Lcom/squareup/okhttp/Request;->method()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/Cache$Entry;->requestMethod:Ljava/lang/String;

    .line 549
    invoke-virtual {p1}, Lcom/squareup/okhttp/Response;->protocol()Lcom/squareup/okhttp/Protocol;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/Cache$Entry;->protocol:Lcom/squareup/okhttp/Protocol;

    .line 550
    invoke-virtual {p1}, Lcom/squareup/okhttp/Response;->code()I

    move-result v0

    iput v0, p0, Lcom/squareup/okhttp/Cache$Entry;->code:I

    .line 551
    invoke-virtual {p1}, Lcom/squareup/okhttp/Response;->message()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/Cache$Entry;->message:Ljava/lang/String;

    .line 552
    invoke-virtual {p1}, Lcom/squareup/okhttp/Response;->headers()Lcom/squareup/okhttp/Headers;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/Cache$Entry;->responseHeaders:Lcom/squareup/okhttp/Headers;

    .line 553
    invoke-virtual {p1}, Lcom/squareup/okhttp/Response;->handshake()Lcom/squareup/okhttp/Handshake;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/Cache$Entry;->handshake:Lcom/squareup/okhttp/Handshake;

    .line 554
    return-void
.end method

.method public constructor <init>(Lokio/Source;)V
    .registers 16
    .param p1, "in"    # Lokio/Source;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 505
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 507
    :try_start_3
    invoke-static {p1}, Lokio/Okio;->buffer(Lokio/Source;)Lokio/BufferedSource;

    move-result-object v7

    .line 508
    .local v7, "source":Lokio/BufferedSource;
    invoke-interface {v7}, Lokio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    move-result-object v11

    iput-object v11, p0, Lcom/squareup/okhttp/Cache$Entry;->url:Ljava/lang/String;

    .line 509
    invoke-interface {v7}, Lokio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    move-result-object v11

    iput-object v11, p0, Lcom/squareup/okhttp/Cache$Entry;->requestMethod:Ljava/lang/String;

    .line 510
    new-instance v9, Lcom/squareup/okhttp/Headers$Builder;

    invoke-direct {v9}, Lcom/squareup/okhttp/Headers$Builder;-><init>()V

    .line 511
    .local v9, "varyHeadersBuilder":Lcom/squareup/okhttp/Headers$Builder;
    # invokes: Lcom/squareup/okhttp/Cache;->readInt(Lokio/BufferedSource;)I
    invoke-static {v7}, Lcom/squareup/okhttp/Cache;->access$1000(Lokio/BufferedSource;)I

    move-result v10

    .line 512
    .local v10, "varyRequestHeaderLineCount":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1d
    if-ge v2, v10, :cond_29

    .line 513
    invoke-interface {v7}, Lokio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v9, v11}, Lcom/squareup/okhttp/Headers$Builder;->addLenient(Ljava/lang/String;)Lcom/squareup/okhttp/Headers$Builder;

    .line 512
    add-int/lit8 v2, v2, 0x1

    goto :goto_1d

    .line 515
    :cond_29
    invoke-virtual {v9}, Lcom/squareup/okhttp/Headers$Builder;->build()Lcom/squareup/okhttp/Headers;

    move-result-object v11

    iput-object v11, p0, Lcom/squareup/okhttp/Cache$Entry;->varyHeaders:Lcom/squareup/okhttp/Headers;

    .line 517
    invoke-interface {v7}, Lokio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Lcom/squareup/okhttp/internal/http/StatusLine;->parse(Ljava/lang/String;)Lcom/squareup/okhttp/internal/http/StatusLine;

    move-result-object v8

    .line 518
    .local v8, "statusLine":Lcom/squareup/okhttp/internal/http/StatusLine;
    iget-object v11, v8, Lcom/squareup/okhttp/internal/http/StatusLine;->protocol:Lcom/squareup/okhttp/Protocol;

    iput-object v11, p0, Lcom/squareup/okhttp/Cache$Entry;->protocol:Lcom/squareup/okhttp/Protocol;

    .line 519
    iget v11, v8, Lcom/squareup/okhttp/internal/http/StatusLine;->code:I

    iput v11, p0, Lcom/squareup/okhttp/Cache$Entry;->code:I

    .line 520
    iget-object v11, v8, Lcom/squareup/okhttp/internal/http/StatusLine;->message:Ljava/lang/String;

    iput-object v11, p0, Lcom/squareup/okhttp/Cache$Entry;->message:Ljava/lang/String;

    .line 521
    new-instance v6, Lcom/squareup/okhttp/Headers$Builder;

    invoke-direct {v6}, Lcom/squareup/okhttp/Headers$Builder;-><init>()V

    .line 522
    .local v6, "responseHeadersBuilder":Lcom/squareup/okhttp/Headers$Builder;
    # invokes: Lcom/squareup/okhttp/Cache;->readInt(Lokio/BufferedSource;)I
    invoke-static {v7}, Lcom/squareup/okhttp/Cache;->access$1000(Lokio/BufferedSource;)I

    move-result v5

    .line 523
    .local v5, "responseHeaderLineCount":I
    const/4 v2, 0x0

    :goto_4d
    if-ge v2, v5, :cond_59

    .line 524
    invoke-interface {v7}, Lokio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v6, v11}, Lcom/squareup/okhttp/Headers$Builder;->addLenient(Ljava/lang/String;)Lcom/squareup/okhttp/Headers$Builder;

    .line 523
    add-int/lit8 v2, v2, 0x1

    goto :goto_4d

    .line 526
    :cond_59
    invoke-virtual {v6}, Lcom/squareup/okhttp/Headers$Builder;->build()Lcom/squareup/okhttp/Headers;

    move-result-object v11

    iput-object v11, p0, Lcom/squareup/okhttp/Cache$Entry;->responseHeaders:Lcom/squareup/okhttp/Headers;

    .line 528
    invoke-direct {p0}, Lcom/squareup/okhttp/Cache$Entry;->isHttps()Z

    move-result v11

    if-eqz v11, :cond_a9

    .line 529
    invoke-interface {v7}, Lokio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    move-result-object v0

    .line 530
    .local v0, "blank":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v11

    if-lez v11, :cond_93

    .line 531
    new-instance v11, Ljava/io/IOException;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "expected \"\" but was \""

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "\""

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v11
    :try_end_8e
    .catchall {:try_start_3 .. :try_end_8e} :catchall_8e

    .line 541
    .end local v0    # "blank":Ljava/lang/String;
    .end local v2    # "i":I
    .end local v5    # "responseHeaderLineCount":I
    .end local v6    # "responseHeadersBuilder":Lcom/squareup/okhttp/Headers$Builder;
    .end local v7    # "source":Lokio/BufferedSource;
    .end local v8    # "statusLine":Lcom/squareup/okhttp/internal/http/StatusLine;
    .end local v9    # "varyHeadersBuilder":Lcom/squareup/okhttp/Headers$Builder;
    .end local v10    # "varyRequestHeaderLineCount":I
    :catchall_8e
    move-exception v11

    invoke-interface {p1}, Lokio/Source;->close()V

    throw v11

    .line 533
    .restart local v0    # "blank":Ljava/lang/String;
    .restart local v2    # "i":I
    .restart local v5    # "responseHeaderLineCount":I
    .restart local v6    # "responseHeadersBuilder":Lcom/squareup/okhttp/Headers$Builder;
    .restart local v7    # "source":Lokio/BufferedSource;
    .restart local v8    # "statusLine":Lcom/squareup/okhttp/internal/http/StatusLine;
    .restart local v9    # "varyHeadersBuilder":Lcom/squareup/okhttp/Headers$Builder;
    .restart local v10    # "varyRequestHeaderLineCount":I
    :cond_93
    :try_start_93
    invoke-interface {v7}, Lokio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    move-result-object v1

    .line 534
    .local v1, "cipherSuite":Ljava/lang/String;
    invoke-direct {p0, v7}, Lcom/squareup/okhttp/Cache$Entry;->readCertificateList(Lokio/BufferedSource;)Ljava/util/List;

    move-result-object v4

    .line 535
    .local v4, "peerCertificates":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/Certificate;>;"
    invoke-direct {p0, v7}, Lcom/squareup/okhttp/Cache$Entry;->readCertificateList(Lokio/BufferedSource;)Ljava/util/List;

    move-result-object v3

    .line 536
    .local v3, "localCertificates":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/Certificate;>;"
    invoke-static {v1, v4, v3}, Lcom/squareup/okhttp/Handshake;->get(Ljava/lang/String;Ljava/util/List;Ljava/util/List;)Lcom/squareup/okhttp/Handshake;

    move-result-object v11

    iput-object v11, p0, Lcom/squareup/okhttp/Cache$Entry;->handshake:Lcom/squareup/okhttp/Handshake;
    :try_end_a5
    .catchall {:try_start_93 .. :try_end_a5} :catchall_8e

    .line 541
    .end local v0    # "blank":Ljava/lang/String;
    .end local v1    # "cipherSuite":Ljava/lang/String;
    .end local v3    # "localCertificates":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/Certificate;>;"
    .end local v4    # "peerCertificates":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/Certificate;>;"
    :goto_a5
    invoke-interface {p1}, Lokio/Source;->close()V

    .line 543
    return-void

    .line 538
    :cond_a9
    const/4 v11, 0x0

    :try_start_aa
    iput-object v11, p0, Lcom/squareup/okhttp/Cache$Entry;->handshake:Lcom/squareup/okhttp/Handshake;
    :try_end_ac
    .catchall {:try_start_aa .. :try_end_ac} :catchall_8e

    goto :goto_a5
.end method

.method private isHttps()Z
    .registers 3

    .prologue
    .line 594
    iget-object v0, p0, Lcom/squareup/okhttp/Cache$Entry;->url:Ljava/lang/String;

    const-string v1, "https://"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private readCertificateList(Lokio/BufferedSource;)Ljava/util/List;
    .registers 11
    .param p1, "source"    # Lokio/BufferedSource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lokio/BufferedSource;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/security/cert/Certificate;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 598
    # invokes: Lcom/squareup/okhttp/Cache;->readInt(Lokio/BufferedSource;)I
    invoke-static {p1}, Lcom/squareup/okhttp/Cache;->access$1000(Lokio/BufferedSource;)I

    move-result v4

    .line 599
    .local v4, "length":I
    const/4 v7, -0x1

    if-ne v4, v7, :cond_c

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v6

    .line 610
    :cond_b
    return-object v6

    .line 602
    :cond_c
    :try_start_c
    const-string v7, "X.509"

    invoke-static {v7}, Ljava/security/cert/CertificateFactory;->getInstance(Ljava/lang/String;)Ljava/security/cert/CertificateFactory;

    move-result-object v1

    .line 603
    .local v1, "certificateFactory":Ljava/security/cert/CertificateFactory;
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 604
    .local v6, "result":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/Certificate;>;"
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_18
    if-ge v3, v4, :cond_b

    .line 605
    invoke-interface {p1}, Lokio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    move-result-object v5

    .line 606
    .local v5, "line":Ljava/lang/String;
    new-instance v0, Lokio/Buffer;

    invoke-direct {v0}, Lokio/Buffer;-><init>()V

    .line 607
    .local v0, "bytes":Lokio/Buffer;
    invoke-static {v5}, Lokio/ByteString;->decodeBase64(Ljava/lang/String;)Lokio/ByteString;

    move-result-object v7

    invoke-virtual {v0, v7}, Lokio/Buffer;->write(Lokio/ByteString;)Lokio/Buffer;

    .line 608
    invoke-virtual {v0}, Lokio/Buffer;->inputStream()Ljava/io/InputStream;

    move-result-object v7

    invoke-virtual {v1, v7}, Ljava/security/cert/CertificateFactory;->generateCertificate(Ljava/io/InputStream;)Ljava/security/cert/Certificate;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_35
    .catch Ljava/security/cert/CertificateException; {:try_start_c .. :try_end_35} :catch_38

    .line 604
    add-int/lit8 v3, v3, 0x1

    goto :goto_18

    .line 611
    .end local v0    # "bytes":Lokio/Buffer;
    .end local v1    # "certificateFactory":Ljava/security/cert/CertificateFactory;
    .end local v3    # "i":I
    .end local v5    # "line":Ljava/lang/String;
    .end local v6    # "result":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/Certificate;>;"
    :catch_38
    move-exception v2

    .line 612
    .local v2, "e":Ljava/security/cert/CertificateException;
    new-instance v7, Ljava/io/IOException;

    invoke-virtual {v2}, Ljava/security/cert/CertificateException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v7
.end method

.method private writeCertList(Lokio/BufferedSink;Ljava/util/List;)V
    .registers 10
    .param p1, "sink"    # Lokio/BufferedSink;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lokio/BufferedSink;",
            "Ljava/util/List",
            "<",
            "Ljava/security/cert/Certificate;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 619
    .local p2, "certificates":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/Certificate;>;"
    :try_start_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v5

    int-to-long v5, v5

    invoke-interface {p1, v5, v6}, Lokio/BufferedSink;->writeDecimalLong(J)Lokio/BufferedSink;

    .line 620
    const/16 v5, 0xa

    invoke-interface {p1, v5}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 621
    const/4 v2, 0x0

    .local v2, "i":I
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v4

    .local v4, "size":I
    :goto_12
    if-ge v2, v4, :cond_3c

    .line 622
    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/security/cert/Certificate;

    invoke-virtual {v5}, Ljava/security/cert/Certificate;->getEncoded()[B

    move-result-object v0

    .line 623
    .local v0, "bytes":[B
    invoke-static {v0}, Lokio/ByteString;->of([B)Lokio/ByteString;

    move-result-object v5

    invoke-virtual {v5}, Lokio/ByteString;->base64()Ljava/lang/String;

    move-result-object v3

    .line 624
    .local v3, "line":Ljava/lang/String;
    invoke-interface {p1, v3}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    .line 625
    const/16 v5, 0xa

    invoke-interface {p1, v5}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;
    :try_end_2e
    .catch Ljava/security/cert/CertificateEncodingException; {:try_start_0 .. :try_end_2e} :catch_31

    .line 621
    add-int/lit8 v2, v2, 0x1

    goto :goto_12

    .line 627
    .end local v0    # "bytes":[B
    .end local v2    # "i":I
    .end local v3    # "line":Ljava/lang/String;
    .end local v4    # "size":I
    :catch_31
    move-exception v1

    .line 628
    .local v1, "e":Ljava/security/cert/CertificateEncodingException;
    new-instance v5, Ljava/io/IOException;

    invoke-virtual {v1}, Ljava/security/cert/CertificateEncodingException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 630
    .end local v1    # "e":Ljava/security/cert/CertificateEncodingException;
    .restart local v2    # "i":I
    .restart local v4    # "size":I
    :cond_3c
    return-void
.end method


# virtual methods
.method public matches(Lcom/squareup/okhttp/Request;Lcom/squareup/okhttp/Response;)Z
    .registers 5
    .param p1, "request"    # Lcom/squareup/okhttp/Request;
    .param p2, "response"    # Lcom/squareup/okhttp/Response;

    .prologue
    .line 633
    iget-object v0, p0, Lcom/squareup/okhttp/Cache$Entry;->url:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/squareup/okhttp/Request;->urlString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_22

    iget-object v0, p0, Lcom/squareup/okhttp/Cache$Entry;->requestMethod:Ljava/lang/String;

    .line 634
    invoke-virtual {p1}, Lcom/squareup/okhttp/Request;->method()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_22

    iget-object v0, p0, Lcom/squareup/okhttp/Cache$Entry;->varyHeaders:Lcom/squareup/okhttp/Headers;

    .line 635
    invoke-static {p2, v0, p1}, Lcom/squareup/okhttp/internal/http/OkHeaders;->varyMatches(Lcom/squareup/okhttp/Response;Lcom/squareup/okhttp/Headers;Lcom/squareup/okhttp/Request;)Z

    move-result v0

    if-eqz v0, :cond_22

    const/4 v0, 0x1

    :goto_21
    return v0

    :cond_22
    const/4 v0, 0x0

    goto :goto_21
.end method

.method public response(Lcom/squareup/okhttp/Request;Lcom/squareup/okhttp/internal/DiskLruCache$Snapshot;)Lcom/squareup/okhttp/Response;
    .registers 9
    .param p1, "request"    # Lcom/squareup/okhttp/Request;
    .param p2, "snapshot"    # Lcom/squareup/okhttp/internal/DiskLruCache$Snapshot;

    .prologue
    .line 639
    iget-object v3, p0, Lcom/squareup/okhttp/Cache$Entry;->responseHeaders:Lcom/squareup/okhttp/Headers;

    const-string v4, "Content-Type"

    invoke-virtual {v3, v4}, Lcom/squareup/okhttp/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 640
    .local v2, "contentType":Ljava/lang/String;
    iget-object v3, p0, Lcom/squareup/okhttp/Cache$Entry;->responseHeaders:Lcom/squareup/okhttp/Headers;

    const-string v4, "Content-Length"

    invoke-virtual {v3, v4}, Lcom/squareup/okhttp/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 641
    .local v1, "contentLength":Ljava/lang/String;
    new-instance v3, Lcom/squareup/okhttp/Request$Builder;

    invoke-direct {v3}, Lcom/squareup/okhttp/Request$Builder;-><init>()V

    iget-object v4, p0, Lcom/squareup/okhttp/Cache$Entry;->url:Ljava/lang/String;

    .line 642
    invoke-virtual {v3, v4}, Lcom/squareup/okhttp/Request$Builder;->url(Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    move-result-object v3

    iget-object v4, p0, Lcom/squareup/okhttp/Cache$Entry;->requestMethod:Ljava/lang/String;

    const/4 v5, 0x0

    .line 643
    invoke-virtual {v3, v4, v5}, Lcom/squareup/okhttp/Request$Builder;->method(Ljava/lang/String;Lcom/squareup/okhttp/RequestBody;)Lcom/squareup/okhttp/Request$Builder;

    move-result-object v3

    iget-object v4, p0, Lcom/squareup/okhttp/Cache$Entry;->varyHeaders:Lcom/squareup/okhttp/Headers;

    .line 644
    invoke-virtual {v3, v4}, Lcom/squareup/okhttp/Request$Builder;->headers(Lcom/squareup/okhttp/Headers;)Lcom/squareup/okhttp/Request$Builder;

    move-result-object v3

    .line 645
    invoke-virtual {v3}, Lcom/squareup/okhttp/Request$Builder;->build()Lcom/squareup/okhttp/Request;

    move-result-object v0

    .line 646
    .local v0, "cacheRequest":Lcom/squareup/okhttp/Request;
    new-instance v3, Lcom/squareup/okhttp/Response$Builder;

    invoke-direct {v3}, Lcom/squareup/okhttp/Response$Builder;-><init>()V

    .line 647
    invoke-virtual {v3, v0}, Lcom/squareup/okhttp/Response$Builder;->request(Lcom/squareup/okhttp/Request;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v3

    iget-object v4, p0, Lcom/squareup/okhttp/Cache$Entry;->protocol:Lcom/squareup/okhttp/Protocol;

    .line 648
    invoke-virtual {v3, v4}, Lcom/squareup/okhttp/Response$Builder;->protocol(Lcom/squareup/okhttp/Protocol;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v3

    iget v4, p0, Lcom/squareup/okhttp/Cache$Entry;->code:I

    .line 649
    invoke-virtual {v3, v4}, Lcom/squareup/okhttp/Response$Builder;->code(I)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v3

    iget-object v4, p0, Lcom/squareup/okhttp/Cache$Entry;->message:Ljava/lang/String;

    .line 650
    invoke-virtual {v3, v4}, Lcom/squareup/okhttp/Response$Builder;->message(Ljava/lang/String;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v3

    iget-object v4, p0, Lcom/squareup/okhttp/Cache$Entry;->responseHeaders:Lcom/squareup/okhttp/Headers;

    .line 651
    invoke-virtual {v3, v4}, Lcom/squareup/okhttp/Response$Builder;->headers(Lcom/squareup/okhttp/Headers;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v3

    new-instance v4, Lcom/squareup/okhttp/Cache$CacheResponseBody;

    invoke-direct {v4, p2, v2, v1}, Lcom/squareup/okhttp/Cache$CacheResponseBody;-><init>(Lcom/squareup/okhttp/internal/DiskLruCache$Snapshot;Ljava/lang/String;Ljava/lang/String;)V

    .line 652
    invoke-virtual {v3, v4}, Lcom/squareup/okhttp/Response$Builder;->body(Lcom/squareup/okhttp/ResponseBody;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v3

    iget-object v4, p0, Lcom/squareup/okhttp/Cache$Entry;->handshake:Lcom/squareup/okhttp/Handshake;

    .line 653
    invoke-virtual {v3, v4}, Lcom/squareup/okhttp/Response$Builder;->handshake(Lcom/squareup/okhttp/Handshake;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v3

    .line 654
    invoke-virtual {v3}, Lcom/squareup/okhttp/Response$Builder;->build()Lcom/squareup/okhttp/Response;

    move-result-object v3

    return-object v3
.end method

.method public writeTo(Lcom/squareup/okhttp/internal/DiskLruCache$Editor;)V
    .registers 10
    .param p1, "editor"    # Lcom/squareup/okhttp/internal/DiskLruCache$Editor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v7, 0xa

    .line 557
    const/4 v3, 0x0

    invoke-virtual {p1, v3}, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->newSink(I)Lokio/Sink;

    move-result-object v3

    invoke-static {v3}, Lokio/Okio;->buffer(Lokio/Sink;)Lokio/BufferedSink;

    move-result-object v1

    .line 559
    .local v1, "sink":Lokio/BufferedSink;
    iget-object v3, p0, Lcom/squareup/okhttp/Cache$Entry;->url:Ljava/lang/String;

    invoke-interface {v1, v3}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    .line 560
    invoke-interface {v1, v7}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 561
    iget-object v3, p0, Lcom/squareup/okhttp/Cache$Entry;->requestMethod:Ljava/lang/String;

    invoke-interface {v1, v3}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    .line 562
    invoke-interface {v1, v7}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 563
    iget-object v3, p0, Lcom/squareup/okhttp/Cache$Entry;->varyHeaders:Lcom/squareup/okhttp/Headers;

    invoke-virtual {v3}, Lcom/squareup/okhttp/Headers;->size()I

    move-result v3

    int-to-long v3, v3

    invoke-interface {v1, v3, v4}, Lokio/BufferedSink;->writeDecimalLong(J)Lokio/BufferedSink;

    .line 564
    invoke-interface {v1, v7}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 565
    const/4 v0, 0x0

    .local v0, "i":I
    iget-object v3, p0, Lcom/squareup/okhttp/Cache$Entry;->varyHeaders:Lcom/squareup/okhttp/Headers;

    invoke-virtual {v3}, Lcom/squareup/okhttp/Headers;->size()I

    move-result v2

    .local v2, "size":I
    :goto_2f
    if-ge v0, v2, :cond_4e

    .line 566
    iget-object v3, p0, Lcom/squareup/okhttp/Cache$Entry;->varyHeaders:Lcom/squareup/okhttp/Headers;

    invoke-virtual {v3, v0}, Lcom/squareup/okhttp/Headers;->name(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    .line 567
    const-string v3, ": "

    invoke-interface {v1, v3}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    .line 568
    iget-object v3, p0, Lcom/squareup/okhttp/Cache$Entry;->varyHeaders:Lcom/squareup/okhttp/Headers;

    invoke-virtual {v3, v0}, Lcom/squareup/okhttp/Headers;->value(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    .line 569
    invoke-interface {v1, v7}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 565
    add-int/lit8 v0, v0, 0x1

    goto :goto_2f

    .line 572
    :cond_4e
    new-instance v3, Lcom/squareup/okhttp/internal/http/StatusLine;

    iget-object v4, p0, Lcom/squareup/okhttp/Cache$Entry;->protocol:Lcom/squareup/okhttp/Protocol;

    iget v5, p0, Lcom/squareup/okhttp/Cache$Entry;->code:I

    iget-object v6, p0, Lcom/squareup/okhttp/Cache$Entry;->message:Ljava/lang/String;

    invoke-direct {v3, v4, v5, v6}, Lcom/squareup/okhttp/internal/http/StatusLine;-><init>(Lcom/squareup/okhttp/Protocol;ILjava/lang/String;)V

    invoke-virtual {v3}, Lcom/squareup/okhttp/internal/http/StatusLine;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    .line 573
    invoke-interface {v1, v7}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 574
    iget-object v3, p0, Lcom/squareup/okhttp/Cache$Entry;->responseHeaders:Lcom/squareup/okhttp/Headers;

    invoke-virtual {v3}, Lcom/squareup/okhttp/Headers;->size()I

    move-result v3

    int-to-long v3, v3

    invoke-interface {v1, v3, v4}, Lokio/BufferedSink;->writeDecimalLong(J)Lokio/BufferedSink;

    .line 575
    invoke-interface {v1, v7}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 576
    const/4 v0, 0x0

    iget-object v3, p0, Lcom/squareup/okhttp/Cache$Entry;->responseHeaders:Lcom/squareup/okhttp/Headers;

    invoke-virtual {v3}, Lcom/squareup/okhttp/Headers;->size()I

    move-result v2

    :goto_77
    if-ge v0, v2, :cond_96

    .line 577
    iget-object v3, p0, Lcom/squareup/okhttp/Cache$Entry;->responseHeaders:Lcom/squareup/okhttp/Headers;

    invoke-virtual {v3, v0}, Lcom/squareup/okhttp/Headers;->name(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    .line 578
    const-string v3, ": "

    invoke-interface {v1, v3}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    .line 579
    iget-object v3, p0, Lcom/squareup/okhttp/Cache$Entry;->responseHeaders:Lcom/squareup/okhttp/Headers;

    invoke-virtual {v3, v0}, Lcom/squareup/okhttp/Headers;->value(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    .line 580
    invoke-interface {v1, v7}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 576
    add-int/lit8 v0, v0, 0x1

    goto :goto_77

    .line 583
    :cond_96
    invoke-direct {p0}, Lcom/squareup/okhttp/Cache$Entry;->isHttps()Z

    move-result v3

    if-eqz v3, :cond_bd

    .line 584
    invoke-interface {v1, v7}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 585
    iget-object v3, p0, Lcom/squareup/okhttp/Cache$Entry;->handshake:Lcom/squareup/okhttp/Handshake;

    invoke-virtual {v3}, Lcom/squareup/okhttp/Handshake;->cipherSuite()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    .line 586
    invoke-interface {v1, v7}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 587
    iget-object v3, p0, Lcom/squareup/okhttp/Cache$Entry;->handshake:Lcom/squareup/okhttp/Handshake;

    invoke-virtual {v3}, Lcom/squareup/okhttp/Handshake;->peerCertificates()Ljava/util/List;

    move-result-object v3

    invoke-direct {p0, v1, v3}, Lcom/squareup/okhttp/Cache$Entry;->writeCertList(Lokio/BufferedSink;Ljava/util/List;)V

    .line 588
    iget-object v3, p0, Lcom/squareup/okhttp/Cache$Entry;->handshake:Lcom/squareup/okhttp/Handshake;

    invoke-virtual {v3}, Lcom/squareup/okhttp/Handshake;->localCertificates()Ljava/util/List;

    move-result-object v3

    invoke-direct {p0, v1, v3}, Lcom/squareup/okhttp/Cache$Entry;->writeCertList(Lokio/BufferedSink;Ljava/util/List;)V

    .line 590
    :cond_bd
    invoke-interface {v1}, Lokio/BufferedSink;->close()V

    .line 591
    return-void
.end method
