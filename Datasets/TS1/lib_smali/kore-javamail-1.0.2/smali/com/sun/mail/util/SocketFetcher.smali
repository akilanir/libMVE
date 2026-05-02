.class public Lcom/sun/mail/util/SocketFetcher;
.super Ljava/lang/Object;
.source "SocketFetcher.java"


# static fields
.field private static logger:Lcom/sun/mail/util/MailLogger;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .prologue
    .line 67
    new-instance v0, Lcom/sun/mail/util/MailLogger;

    const-class v1, Lcom/sun/mail/util/SocketFetcher;

    const-string v2, "socket"

    const-string v3, "DEBUG SocketFetcher"

    const-string v4, "mail.socket.debug"

    const/4 v5, 0x0

    .line 71
    invoke-static {v4, v5}, Lcom/sun/mail/util/PropUtil;->getBooleanSystemProperty(Ljava/lang/String;Z)Z

    move-result v4

    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-direct/range {v0 .. v5}, Lcom/sun/mail/util/MailLogger;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;ZLjava/io/PrintStream;)V

    sput-object v0, Lcom/sun/mail/util/SocketFetcher;->logger:Lcom/sun/mail/util/MailLogger;

    .line 67
    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    return-void
.end method

.method private static checkServerIdentity(Ljava/lang/String;Ljavax/net/ssl/SSLSocket;)V
    .registers 8
    .param p0, "server"    # Ljava/lang/String;
    .param p1, "sslSocket"    # Ljavax/net/ssl/SSLSocket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 577
    .line 578
    :try_start_0
    invoke-virtual {p1}, Ljavax/net/ssl/SSLSocket;->getSession()Ljavax/net/ssl/SSLSession;

    move-result-object v3

    invoke-interface {v3}, Ljavax/net/ssl/SSLSession;->getPeerCertificates()[Ljava/security/cert/Certificate;

    move-result-object v0

    .line 579
    .local v0, "certChain":[Ljava/security/cert/Certificate;
    if-eqz v0, :cond_40

    array-length v3, v0

    if-lez v3, :cond_40

    const/4 v3, 0x0

    aget-object v3, v0, v3

    instance-of v3, v3, Ljava/security/cert/X509Certificate;

    if-eqz v3, :cond_40

    const/4 v3, 0x0

    aget-object v3, v0, v3

    check-cast v3, Ljava/security/cert/X509Certificate;

    .line 581
    invoke-static {p0, v3}, Lcom/sun/mail/util/SocketFetcher;->matchCert(Ljava/lang/String;Ljava/security/cert/X509Certificate;)Z
    :try_end_1c
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_0 .. :try_end_1c} :catch_20

    move-result v3

    if-eqz v3, :cond_40

    .line 582
    return-void

    .line 583
    .end local v0    # "certChain":[Ljava/security/cert/Certificate;
    :catch_20
    move-exception v1

    .line 584
    .local v1, "e":Ljavax/net/ssl/SSLPeerUnverifiedException;
    invoke-virtual {p1}, Ljavax/net/ssl/SSLSocket;->close()V

    .line 585
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Can\'t verify identity of server: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 587
    .local v2, "ioex":Ljava/io/IOException;
    invoke-virtual {v2, v1}, Ljava/io/IOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 588
    throw v2

    .line 592
    .end local v1    # "e":Ljavax/net/ssl/SSLPeerUnverifiedException;
    .end local v2    # "ioex":Ljava/io/IOException;
    .restart local v0    # "certChain":[Ljava/security/cert/Certificate;
    :cond_40
    invoke-virtual {p1}, Ljavax/net/ssl/SSLSocket;->close()V

    .line 593
    new-instance v3, Ljava/io/IOException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Can\'t verify identity of server: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method private static configureSSLSocket(Ljava/net/Socket;Ljava/lang/String;Ljava/util/Properties;Ljava/lang/String;Ljavax/net/SocketFactory;)V
    .registers 14
    .param p0, "socket"    # Ljava/net/Socket;
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "props"    # Ljava/util/Properties;
    .param p3, "prefix"    # Ljava/lang/String;
    .param p4, "sf"    # Ljavax/net/SocketFactory;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    const/4 v8, 0x0

    .line 512
    instance-of v5, p0, Ljavax/net/ssl/SSLSocket;

    if-nez v5, :cond_7

    .line 562
    :cond_6
    return-void

    :cond_7
    move-object v4, p0

    .line 514
    check-cast v4, Ljavax/net/ssl/SSLSocket;

    .line 516
    .local v4, "sslsocket":Ljavax/net/ssl/SSLSocket;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ".ssl.protocols"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p2, v5, v7}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 517
    .local v3, "protocols":Ljava/lang/String;
    if-eqz v3, :cond_dc

    .line 518
    invoke-static {v3}, Lcom/sun/mail/util/SocketFetcher;->stringArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljavax/net/ssl/SSLSocket;->setEnabledProtocols([Ljava/lang/String;)V

    .line 528
    :goto_2a
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ".ssl.ciphersuites"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p2, v5, v7}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 529
    .local v0, "ciphers":Ljava/lang/String;
    if-eqz v0, :cond_4a

    .line 530
    invoke-static {v0}, Lcom/sun/mail/util/SocketFetcher;->stringArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljavax/net/ssl/SSLSocket;->setEnabledCipherSuites([Ljava/lang/String;)V

    .line 531
    :cond_4a
    sget-object v5, Lcom/sun/mail/util/SocketFetcher;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v6, Ljava/util/logging/Level;->FINER:Ljava/util/logging/Level;

    invoke-virtual {v5, v6}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v5

    if-eqz v5, :cond_94

    .line 532
    sget-object v5, Lcom/sun/mail/util/SocketFetcher;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "SSL protocols after "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 533
    invoke-virtual {v4}, Ljavax/net/ssl/SSLSocket;->getEnabledProtocols()[Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 532
    invoke-virtual {v5, v6}, Lcom/sun/mail/util/MailLogger;->finer(Ljava/lang/String;)V

    .line 534
    sget-object v5, Lcom/sun/mail/util/SocketFetcher;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "SSL ciphers after "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 535
    invoke-virtual {v4}, Ljavax/net/ssl/SSLSocket;->getEnabledCipherSuites()[Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 534
    invoke-virtual {v5, v6}, Lcom/sun/mail/util/MailLogger;->finer(Ljava/lang/String;)V

    .line 543
    :cond_94
    invoke-virtual {v4}, Ljavax/net/ssl/SSLSocket;->startHandshake()V

    .line 548
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ".ssl.checkserveridentity"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {p2, v5, v8}, Lcom/sun/mail/util/PropUtil;->getBooleanProperty(Ljava/util/Properties;Ljava/lang/String;Z)Z

    move-result v1

    .line 550
    .local v1, "idCheck":Z
    if-eqz v1, :cond_b3

    .line 551
    invoke-static {p1, v4}, Lcom/sun/mail/util/SocketFetcher;->checkServerIdentity(Ljava/lang/String;Ljavax/net/ssl/SSLSocket;)V

    .line 552
    :cond_b3
    instance-of v5, p4, Lcom/sun/mail/util/MailSSLSocketFactory;

    if-eqz v5, :cond_6

    move-object v2, p4

    .line 553
    check-cast v2, Lcom/sun/mail/util/MailSSLSocketFactory;

    .line 554
    .local v2, "msf":Lcom/sun/mail/util/MailSSLSocketFactory;
    invoke-virtual {v2, p1, v4}, Lcom/sun/mail/util/MailSSLSocketFactory;->isServerTrusted(Ljava/lang/String;Ljavax/net/ssl/SSLSocket;)Z

    move-result v5

    if-nez v5, :cond_6

    .line 556
    :try_start_c0
    invoke-virtual {v4}, Ljavax/net/ssl/SSLSocket;->close()V
    :try_end_c3
    .catchall {:try_start_c0 .. :try_end_c3} :catchall_e8

    .line 558
    new-instance v5, Ljava/io/IOException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Server is not trusted: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 526
    .end local v0    # "ciphers":Ljava/lang/String;
    .end local v1    # "idCheck":Z
    .end local v2    # "msf":Lcom/sun/mail/util/MailSSLSocketFactory;
    :cond_dc
    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const-string v6, "TLSv1"

    aput-object v6, v5, v8

    invoke-virtual {v4, v5}, Ljavax/net/ssl/SSLSocket;->setEnabledProtocols([Ljava/lang/String;)V

    goto/16 :goto_2a

    .line 558
    .restart local v0    # "ciphers":Ljava/lang/String;
    .restart local v1    # "idCheck":Z
    .restart local v2    # "msf":Lcom/sun/mail/util/MailSSLSocketFactory;
    :catchall_e8
    move-exception v5

    new-instance v5, Ljava/io/IOException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Server is not trusted: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5
.end method

.method private static createSocket(Ljava/net/InetAddress;ILjava/lang/String;IIILjava/util/Properties;Ljava/lang/String;Ljavax/net/SocketFactory;Z)Ljava/net/Socket;
    .registers 31
    .param p0, "localaddr"    # Ljava/net/InetAddress;
    .param p1, "localport"    # I
    .param p2, "host"    # Ljava/lang/String;
    .param p3, "port"    # I
    .param p4, "cto"    # I
    .param p5, "to"    # I
    .param p6, "props"    # Ljava/util/Properties;
    .param p7, "prefix"    # Ljava/lang/String;
    .param p8, "sf"    # Ljavax/net/SocketFactory;
    .param p9, "useSSL"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 264
    const/4 v14, 0x0

    .line 266
    .local v14, "socket":Ljava/net/Socket;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p7

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v7, ".socks.host"

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v7, 0x0

    move-object/from16 v0, p6

    invoke-virtual {v0, v4, v7}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 267
    .local v16, "socksHost":Ljava/lang/String;
    const/16 v17, 0x438

    .line 268
    .local v17, "socksPort":I
    const/4 v5, 0x0

    .line 269
    .local v5, "err":Ljava/lang/String;
    if-eqz v16, :cond_ad

    .line 270
    const/16 v4, 0x3a

    move-object/from16 v0, v16

    invoke-virtual {v0, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v11

    .line 271
    .local v11, "i":I
    if-ltz v11, :cond_3f

    .line 272
    const/4 v4, 0x0

    move-object/from16 v0, v16

    invoke-virtual {v0, v4, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v16

    .line 274
    add-int/lit8 v4, v11, 0x1

    :try_start_35
    move-object/from16 v0, v16

    invoke-virtual {v0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_3e
    .catch Ljava/lang/NumberFormatException; {:try_start_35 .. :try_end_3e} :catch_1de

    move-result v17

    .line 279
    :cond_3f
    :goto_3f
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p7

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v7, ".socks.port"

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p6

    move/from16 v1, v17

    invoke-static {v0, v4, v1}, Lcom/sun/mail/util/PropUtil;->getIntProperty(Ljava/util/Properties;Ljava/lang/String;I)I

    move-result v17

    .line 281
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Using SOCKS host, port: "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v16

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v7, ", "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 282
    sget-object v4, Lcom/sun/mail/util/SocketFetcher;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v7, Ljava/util/logging/Level;->FINER:Ljava/util/logging/Level;

    invoke-virtual {v4, v7}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v4

    if-eqz v4, :cond_ad

    .line 283
    sget-object v4, Lcom/sun/mail/util/SocketFetcher;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "socks host "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, v16

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", port "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move/from16 v0, v17

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Lcom/sun/mail/util/MailLogger;->finer(Ljava/lang/String;)V

    .line 286
    .end local v11    # "i":I
    :cond_ad
    if-eqz p8, :cond_b3

    .line 287
    invoke-virtual/range {p8 .. p8}, Ljavax/net/SocketFactory;->createSocket()Ljava/net/Socket;

    move-result-object v14

    .line 288
    :cond_b3
    if-nez v14, :cond_1e4

    .line 289
    if-eqz v16, :cond_16b

    .line 290
    new-instance v14, Ljava/net/Socket;

    .end local v14    # "socket":Ljava/net/Socket;
    new-instance v4, Ljava/net/Proxy;

    sget-object v7, Ljava/net/Proxy$Type;->SOCKS:Ljava/net/Proxy$Type;

    new-instance v8, Ljava/net/InetSocketAddress;

    move-object/from16 v0, v16

    move/from16 v1, v17

    invoke-direct {v8, v0, v1}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    invoke-direct {v4, v7, v8}, Ljava/net/Proxy;-><init>(Ljava/net/Proxy$Type;Ljava/net/SocketAddress;)V

    invoke-direct {v14, v4}, Ljava/net/Socket;-><init>(Ljava/net/Proxy;)V

    .restart local v14    # "socket":Ljava/net/Socket;
    move-object v15, v14

    .line 300
    .end local v14    # "socket":Ljava/net/Socket;
    .local v15, "socket":Ljava/net/Socket;
    :goto_cd
    if-ltz p5, :cond_d4

    .line 301
    move/from16 v0, p5

    invoke-virtual {v15, v0}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 302
    :cond_d4
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p7

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v7, ".writetimeout"

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v7, -0x1

    move-object/from16 v0, p6

    invoke-static {v0, v4, v7}, Lcom/sun/mail/util/PropUtil;->getIntProperty(Ljava/util/Properties;Ljava/lang/String;I)I

    move-result v20

    .line 304
    .local v20, "writeTimeout":I
    const/4 v4, -0x1

    move/from16 v0, v20

    if-eq v0, v4, :cond_1e1

    .line 305
    new-instance v14, Lcom/sun/mail/util/WriteTimeoutSocket;

    move/from16 v0, v20

    invoke-direct {v14, v15, v0}, Lcom/sun/mail/util/WriteTimeoutSocket;-><init>(Ljava/net/Socket;I)V

    .line 306
    .end local v15    # "socket":Ljava/net/Socket;
    .restart local v14    # "socket":Ljava/net/Socket;
    :goto_fc
    if-eqz p0, :cond_10a

    .line 307
    new-instance v4, Ljava/net/InetSocketAddress;

    move-object/from16 v0, p0

    move/from16 v1, p1

    invoke-direct {v4, v0, v1}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    invoke-virtual {v14, v4}, Ljava/net/Socket;->bind(Ljava/net/SocketAddress;)V

    .line 309
    :cond_10a
    if-ltz p4, :cond_1a3

    .line 310
    :try_start_10c
    new-instance v4, Ljava/net/InetSocketAddress;

    move-object/from16 v0, p2

    move/from16 v1, p3

    invoke-direct {v4, v0, v1}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    move/from16 v0, p4

    invoke-virtual {v14, v4, v0}, Ljava/net/Socket;->connect(Ljava/net/SocketAddress;I)V
    :try_end_11a
    .catch Ljava/io/IOException; {:try_start_10c .. :try_end_11a} :catch_1b1

    .line 321
    :goto_11a
    if-eqz p9, :cond_15f

    instance-of v4, v14, Ljavax/net/ssl/SSLSocket;

    if-nez v4, :cond_15f

    .line 324
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p7

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v7, ".ssl.trust"

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p6

    invoke-virtual {v0, v4}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    .local v19, "trusted":Ljava/lang/String;
    if-eqz v19, :cond_1d6

    .line 326
    :try_start_13d
    new-instance v13, Lcom/sun/mail/util/MailSSLSocketFactory;

    invoke-direct {v13}, Lcom/sun/mail/util/MailSSLSocketFactory;-><init>()V

    .line 327
    .local v13, "msf":Lcom/sun/mail/util/MailSSLSocketFactory;
    const-string v4, "*"

    move-object/from16 v0, v19

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1be

    .line 328
    const/4 v4, 0x1

    invoke-virtual {v13, v4}, Lcom/sun/mail/util/MailSSLSocketFactory;->setTrustAllHosts(Z)V
    :try_end_150
    .catch Ljava/security/GeneralSecurityException; {:try_start_13d .. :try_end_150} :catch_1ca

    .line 331
    :goto_150
    move-object/from16 v18, v13

    .line 340
    .end local v13    # "msf":Lcom/sun/mail/util/MailSSLSocketFactory;
    .local v18, "ssf":Ljavax/net/ssl/SSLSocketFactory;
    :goto_152
    const/4 v4, 0x1

    move-object/from16 v0, v18

    move-object/from16 v1, p2

    move/from16 v2, p3

    invoke-virtual {v0, v14, v1, v2, v4}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/net/Socket;Ljava/lang/String;IZ)Ljava/net/Socket;

    move-result-object v14

    .line 341
    move-object/from16 p8, v18

    .line 348
    .end local v18    # "ssf":Ljavax/net/ssl/SSLSocketFactory;
    .end local v19    # "trusted":Ljava/lang/String;
    :cond_15f
    move-object/from16 v0, p2

    move-object/from16 v1, p6

    move-object/from16 v2, p7

    move-object/from16 v3, p8

    invoke-static {v14, v0, v1, v2, v3}, Lcom/sun/mail/util/SocketFetcher;->configureSSLSocket(Ljava/net/Socket;Ljava/lang/String;Ljava/util/Properties;Ljava/lang/String;Ljavax/net/SocketFactory;)V

    .line 350
    return-object v14

    .line 293
    .end local v20    # "writeTimeout":I
    :cond_16b
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p7

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v7, ".usesocketchannels"

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v7, 0x0

    move-object/from16 v0, p6

    invoke-static {v0, v4, v7}, Lcom/sun/mail/util/PropUtil;->getBooleanProperty(Ljava/util/Properties;Ljava/lang/String;Z)Z

    move-result v4

    if-eqz v4, :cond_19b

    .line 295
    sget-object v4, Lcom/sun/mail/util/SocketFetcher;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v7, "using SocketChannels"

    invoke-virtual {v4, v7}, Lcom/sun/mail/util/MailLogger;->finer(Ljava/lang/String;)V

    .line 296
    invoke-static {}, Ljava/nio/channels/SocketChannel;->open()Ljava/nio/channels/SocketChannel;

    move-result-object v4

    invoke-virtual {v4}, Ljava/nio/channels/SocketChannel;->socket()Ljava/net/Socket;

    move-result-object v14

    move-object v15, v14

    .end local v14    # "socket":Ljava/net/Socket;
    .restart local v15    # "socket":Ljava/net/Socket;
    goto/16 :goto_cd

    .line 298
    .end local v15    # "socket":Ljava/net/Socket;
    .restart local v14    # "socket":Ljava/net/Socket;
    :cond_19b
    new-instance v14, Ljava/net/Socket;

    .end local v14    # "socket":Ljava/net/Socket;
    invoke-direct {v14}, Ljava/net/Socket;-><init>()V

    .restart local v14    # "socket":Ljava/net/Socket;
    move-object v15, v14

    .end local v14    # "socket":Ljava/net/Socket;
    .restart local v15    # "socket":Ljava/net/Socket;
    goto/16 :goto_cd

    .line 312
    .end local v15    # "socket":Ljava/net/Socket;
    .restart local v14    # "socket":Ljava/net/Socket;
    .restart local v20    # "writeTimeout":I
    :cond_1a3
    :try_start_1a3
    new-instance v4, Ljava/net/InetSocketAddress;

    move-object/from16 v0, p2

    move/from16 v1, p3

    invoke-direct {v4, v0, v1}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v14, v4}, Ljava/net/Socket;->connect(Ljava/net/SocketAddress;)V
    :try_end_1af
    .catch Ljava/io/IOException; {:try_start_1a3 .. :try_end_1af} :catch_1b1

    goto/16 :goto_11a

    .line 313
    :catch_1b1
    move-exception v6

    .line 314
    .local v6, "ex":Ljava/io/IOException;
    new-instance v4, Lcom/sun/mail/util/SocketConnectException;

    move-object/from16 v7, p2

    move/from16 v8, p3

    move/from16 v9, p4

    invoke-direct/range {v4 .. v9}, Lcom/sun/mail/util/SocketConnectException;-><init>(Ljava/lang/String;Ljava/lang/Exception;Ljava/lang/String;II)V

    throw v4

    .line 330
    .end local v6    # "ex":Ljava/io/IOException;
    .restart local v13    # "msf":Lcom/sun/mail/util/MailSSLSocketFactory;
    .restart local v19    # "trusted":Ljava/lang/String;
    :cond_1be
    :try_start_1be
    const-string v4, "\\s+"

    move-object/from16 v0, v19

    invoke-virtual {v0, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v13, v4}, Lcom/sun/mail/util/MailSSLSocketFactory;->setTrustedHosts([Ljava/lang/String;)V
    :try_end_1c9
    .catch Ljava/security/GeneralSecurityException; {:try_start_1be .. :try_end_1c9} :catch_1ca

    goto :goto_150

    .line 332
    .end local v13    # "msf":Lcom/sun/mail/util/MailSSLSocketFactory;
    :catch_1ca
    move-exception v10

    .line 333
    .local v10, "gex":Ljava/security/GeneralSecurityException;
    new-instance v12, Ljava/io/IOException;

    const-string v4, "Can\'t create MailSSLSocketFactory"

    invoke-direct {v12, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 335
    .local v12, "ioex":Ljava/io/IOException;
    invoke-virtual {v12, v10}, Ljava/io/IOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 336
    throw v12

    .line 339
    .end local v10    # "gex":Ljava/security/GeneralSecurityException;
    .end local v12    # "ioex":Ljava/io/IOException;
    :cond_1d6
    invoke-static {}, Ljavax/net/ssl/SSLSocketFactory;->getDefault()Ljavax/net/SocketFactory;

    move-result-object v18

    check-cast v18, Ljavax/net/ssl/SSLSocketFactory;

    .restart local v18    # "ssf":Ljavax/net/ssl/SSLSocketFactory;
    goto/16 :goto_152

    .line 275
    .end local v18    # "ssf":Ljavax/net/ssl/SSLSocketFactory;
    .end local v19    # "trusted":Ljava/lang/String;
    .end local v20    # "writeTimeout":I
    .restart local v11    # "i":I
    :catch_1de
    move-exception v4

    goto/16 :goto_3f

    .end local v11    # "i":I
    .end local v14    # "socket":Ljava/net/Socket;
    .restart local v15    # "socket":Ljava/net/Socket;
    .restart local v20    # "writeTimeout":I
    :cond_1e1
    move-object v14, v15

    .end local v15    # "socket":Ljava/net/Socket;
    .restart local v14    # "socket":Ljava/net/Socket;
    goto/16 :goto_fc

    .end local v20    # "writeTimeout":I
    :cond_1e4
    move-object v15, v14

    .end local v14    # "socket":Ljava/net/Socket;
    .restart local v15    # "socket":Ljava/net/Socket;
    goto/16 :goto_cd
.end method

.method private static getContextClassLoader()Ljava/lang/ClassLoader;
    .registers 1

    .prologue
    .line 726
    new-instance v0, Lcom/sun/mail/util/SocketFetcher$1;

    invoke-direct {v0}, Lcom/sun/mail/util/SocketFetcher$1;-><init>()V

    .line 727
    invoke-static {v0}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedAction;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ClassLoader;

    return-object v0
.end method

.method public static getSocket(Ljava/lang/String;ILjava/util/Properties;Ljava/lang/String;)Ljava/net/Socket;
    .registers 5
    .param p0, "host"    # Ljava/lang/String;
    .param p1, "port"    # I
    .param p2, "props"    # Ljava/util/Properties;
    .param p3, "prefix"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 249
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, p3, v0}, Lcom/sun/mail/util/SocketFetcher;->getSocket(Ljava/lang/String;ILjava/util/Properties;Ljava/lang/String;Z)Ljava/net/Socket;

    move-result-object v0

    return-object v0
.end method

.method public static getSocket(Ljava/lang/String;ILjava/util/Properties;Ljava/lang/String;Z)Ljava/net/Socket;
    .registers 37
    .param p0, "host"    # Ljava/lang/String;
    .param p1, "port"    # I
    .param p2, "props"    # Ljava/util/Properties;
    .param p3, "prefix"    # Ljava/lang/String;
    .param p4, "useSSL"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 147
    sget-object v3, Lcom/sun/mail/util/SocketFetcher;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v7, Ljava/util/logging/Level;->FINER:Ljava/util/logging/Level;

    invoke-virtual {v3, v7}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v3

    if-eqz v3, :cond_48

    .line 148
    sget-object v3, Lcom/sun/mail/util/SocketFetcher;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "getSocket, host "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, p0

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", port "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move/from16 v0, p1

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", prefix "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, p3

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", useSSL "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move/from16 v0, p4

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v7}, Lcom/sun/mail/util/MailLogger;->finer(Ljava/lang/String;)V

    .line 150
    :cond_48
    if-nez p3, :cond_4c

    .line 151
    const-string p3, "socket"

    .line 152
    :cond_4c
    if-nez p2, :cond_53

    .line 153
    new-instance p2, Ljava/util/Properties;

    .end local p2    # "props":Ljava/util/Properties;
    invoke-direct/range {p2 .. p2}, Ljava/util/Properties;-><init>()V

    .line 154
    .restart local p2    # "props":Ljava/util/Properties;
    :cond_53
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v7, ".connectiontimeout"

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v7, -0x1

    move-object/from16 v0, p2

    invoke-static {v0, v3, v7}, Lcom/sun/mail/util/PropUtil;->getIntProperty(Ljava/util/Properties;Ljava/lang/String;I)I

    move-result v5

    .line 156
    .local v5, "cto":I
    const/16 v30, 0x0

    .line 157
    .local v30, "socket":Ljava/net/Socket;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v7, ".localaddress"

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v7, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v3, v7}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v24

    .line 158
    .local v24, "localaddrstr":Ljava/lang/String;
    const/4 v1, 0x0

    .line 159
    .local v1, "localaddr":Ljava/net/InetAddress;
    if-eqz v24, :cond_94

    .line 160
    invoke-static/range {v24 .. v24}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v1

    .line 161
    :cond_94
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v7, ".localport"

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v7, 0x0

    move-object/from16 v0, p2

    invoke-static {v0, v3, v7}, Lcom/sun/mail/util/PropUtil;->getIntProperty(Ljava/util/Properties;Ljava/lang/String;I)I

    move-result v2

    .line 164
    .local v2, "localport":I
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v7, ".socketFactory.fallback"

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v7, 0x1

    move-object/from16 v0, p2

    invoke-static {v0, v3, v7}, Lcom/sun/mail/util/PropUtil;->getBooleanProperty(Ljava/util/Properties;Ljava/lang/String;Z)Z

    move-result v23

    .line 167
    .local v23, "fb":Z
    const/4 v4, -0x1

    .line 168
    .local v4, "sfPort":I
    const-string v27, "unknown socket factory"

    .line 169
    .local v27, "sfErr":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v7, ".timeout"

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v7, -0x1

    move-object/from16 v0, p2

    invoke-static {v0, v3, v7}, Lcom/sun/mail/util/PropUtil;->getIntProperty(Ljava/util/Properties;Ljava/lang/String;I)I

    move-result v6

    .line 175
    .local v6, "to":I
    const/4 v9, 0x0

    .line 176
    .local v9, "sf":Ljavax/net/SocketFactory;
    const/16 v28, 0x0

    .line 177
    .local v28, "sfPortName":Ljava/lang/String;
    if-eqz p4, :cond_161

    .line 178
    :try_start_f0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v7, ".ssl.socketFactory"

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Ljava/util/Properties;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v29

    .line 179
    .local v29, "sfo":Ljava/lang/Object;
    move-object/from16 v0, v29

    instance-of v3, v0, Ljavax/net/SocketFactory;

    if-eqz v3, :cond_129

    .line 180
    move-object/from16 v0, v29

    check-cast v0, Ljavax/net/SocketFactory;

    move-object v9, v0

    .line 181
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "SSL socket factory instance "

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    .line 183
    :cond_129
    if-nez v9, :cond_15f

    .line 184
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v7, ".ssl.socketFactory.class"

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 185
    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    .line 186
    .local v26, "sfClass":Ljava/lang/String;
    invoke-static/range {v26 .. v26}, Lcom/sun/mail/util/SocketFetcher;->getSocketFactory(Ljava/lang/String;)Ljavax/net/SocketFactory;

    move-result-object v9

    .line 187
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "SSL socket factory class "

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v26

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    .line 189
    .end local v26    # "sfClass":Ljava/lang/String;
    :cond_15f
    const-string v28, ".ssl.socketFactory.port"

    .line 192
    .end local v29    # "sfo":Ljava/lang/Object;
    :cond_161
    if-nez v9, :cond_1d4

    .line 193
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v7, ".socketFactory"

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Ljava/util/Properties;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v29

    .line 194
    .restart local v29    # "sfo":Ljava/lang/Object;
    move-object/from16 v0, v29

    instance-of v3, v0, Ljavax/net/SocketFactory;

    if-eqz v3, :cond_19c

    .line 195
    move-object/from16 v0, v29

    check-cast v0, Ljavax/net/SocketFactory;

    move-object v9, v0

    .line 196
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "socket factory instance "

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    .line 198
    :cond_19c
    if-nez v9, :cond_1d2

    .line 199
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v7, ".socketFactory.class"

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 200
    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    .line 201
    .restart local v26    # "sfClass":Ljava/lang/String;
    invoke-static/range {v26 .. v26}, Lcom/sun/mail/util/SocketFetcher;->getSocketFactory(Ljava/lang/String;)Ljavax/net/SocketFactory;

    move-result-object v9

    .line 202
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "socket factory class "

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v26

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    .line 204
    .end local v26    # "sfClass":Ljava/lang/String;
    :cond_1d2
    const-string v28, ".socketFactory.port"

    .line 208
    .end local v29    # "sfo":Ljava/lang/Object;
    :cond_1d4
    if-eqz v9, :cond_203

    .line 209
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v28

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v7, -0x1

    move-object/from16 v0, p2

    invoke-static {v0, v3, v7}, Lcom/sun/mail/util/PropUtil;->getIntProperty(Ljava/util/Properties;Ljava/lang/String;I)I

    move-result v4

    .line 213
    const/4 v3, -0x1

    if-ne v4, v3, :cond_1f7

    .line 214
    move/from16 v4, p1

    :cond_1f7
    move-object/from16 v3, p0

    move-object/from16 v7, p2

    move-object/from16 v8, p3

    move/from16 v10, p4

    .line 215
    invoke-static/range {v1 .. v10}, Lcom/sun/mail/util/SocketFetcher;->createSocket(Ljava/net/InetAddress;ILjava/lang/String;IIILjava/util/Properties;Ljava/lang/String;Ljavax/net/SocketFactory;Z)Ljava/net/Socket;
    :try_end_202
    .catch Ljava/net/SocketTimeoutException; {:try_start_f0 .. :try_end_202} :catch_21c
    .catch Ljava/lang/Exception; {:try_start_f0 .. :try_end_202} :catch_21e

    move-result-object v30

    .line 235
    :cond_203
    if-nez v30, :cond_25c

    .line 236
    const/16 v21, 0x0

    move-object v13, v1

    move v14, v2

    move-object/from16 v15, p0

    move/from16 v16, p1

    move/from16 v17, v5

    move/from16 v18, v6

    move-object/from16 v19, p2

    move-object/from16 v20, p3

    move/from16 v22, p4

    invoke-static/range {v13 .. v22}, Lcom/sun/mail/util/SocketFetcher;->createSocket(Ljava/net/InetAddress;ILjava/lang/String;IIILjava/util/Properties;Ljava/lang/String;Ljavax/net/SocketFactory;Z)Ljava/net/Socket;

    move-result-object v30

    .line 244
    :cond_21b
    :goto_21b
    return-object v30

    .line 218
    :catch_21c
    move-exception v25

    .line 219
    .local v25, "sex":Ljava/net/SocketTimeoutException;
    throw v25

    .line 220
    .end local v25    # "sex":Ljava/net/SocketTimeoutException;
    :catch_21e
    move-exception v12

    .line 221
    .local v12, "ex":Ljava/lang/Exception;
    if-nez v23, :cond_203

    .line 222
    instance-of v3, v12, Ljava/lang/reflect/InvocationTargetException;

    if-eqz v3, :cond_236

    move-object v3, v12

    .line 223
    check-cast v3, Ljava/lang/reflect/InvocationTargetException;

    .line 224
    invoke-virtual {v3}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object v31

    .line 225
    .local v31, "t":Ljava/lang/Throwable;
    move-object/from16 v0, v31

    instance-of v3, v0, Ljava/lang/Exception;

    if-eqz v3, :cond_236

    move-object/from16 v12, v31

    .line 226
    check-cast v12, Ljava/lang/Exception;

    .line 228
    .end local v31    # "t":Ljava/lang/Throwable;
    :cond_236
    instance-of v3, v12, Ljava/io/IOException;

    if-eqz v3, :cond_23d

    .line 229
    check-cast v12, Ljava/io/IOException;

    .end local v12    # "ex":Ljava/lang/Exception;
    throw v12

    .line 230
    .restart local v12    # "ex":Ljava/lang/Exception;
    :cond_23d
    new-instance v10, Lcom/sun/mail/util/SocketConnectException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Using "

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v27

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    move-object/from16 v13, p0

    move v14, v4

    move v15, v5

    invoke-direct/range {v10 .. v15}, Lcom/sun/mail/util/SocketConnectException;-><init>(Ljava/lang/String;Ljava/lang/Exception;Ljava/lang/String;II)V

    throw v10

    .line 240
    .end local v12    # "ex":Ljava/lang/Exception;
    :cond_25c
    if-ltz v6, :cond_21b

    .line 241
    move-object/from16 v0, v30

    invoke-virtual {v0, v6}, Ljava/net/Socket;->setSoTimeout(I)V

    goto :goto_21b
.end method

.method private static getSocketFactory(Ljava/lang/String;)Ljavax/net/SocketFactory;
    .registers 8
    .param p0, "sfClass"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;,
            Ljava/lang/NoSuchMethodException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 361
    if-eqz p0, :cond_9

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_b

    .line 362
    :cond_9
    const/4 v3, 0x0

    .line 380
    :goto_a
    return-object v3

    .line 366
    :cond_b
    invoke-static {}, Lcom/sun/mail/util/SocketFetcher;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 367
    .local v0, "cl":Ljava/lang/ClassLoader;
    const/4 v1, 0x0

    .line 368
    .local v1, "clsSockFact":Ljava/lang/Class;
    if-eqz v0, :cond_17

    .line 370
    const/4 v4, 0x0

    :try_start_13
    invoke-static {p0, v4, v0}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;
    :try_end_16
    .catch Ljava/lang/ClassNotFoundException; {:try_start_13 .. :try_end_16} :catch_33

    move-result-object v1

    .line 373
    :cond_17
    :goto_17
    if-nez v1, :cond_1d

    .line 374
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 376
    :cond_1d
    const-string v4, "getDefault"

    new-array v5, v6, [Ljava/lang/Class;

    invoke-virtual {v1, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 378
    .local v2, "mthGetDefault":Ljava/lang/reflect/Method;
    new-instance v4, Ljava/lang/Object;

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    new-array v5, v6, [Ljava/lang/Object;

    .line 379
    invoke-virtual {v2, v4, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljavax/net/SocketFactory;

    .line 380
    .local v3, "sf":Ljavax/net/SocketFactory;
    goto :goto_a

    .line 371
    .end local v2    # "mthGetDefault":Ljava/lang/reflect/Method;
    .end local v3    # "sf":Ljavax/net/SocketFactory;
    :catch_33
    move-exception v4

    goto :goto_17
.end method

.method private static matchCert(Ljava/lang/String;Ljava/security/cert/X509Certificate;)Z
    .registers 23
    .param p0, "server"    # Ljava/lang/String;
    .param p1, "cert"    # Ljava/security/cert/X509Certificate;

    .prologue
    .line 604
    sget-object v17, Lcom/sun/mail/util/SocketFetcher;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v18, Ljava/util/logging/Level;->FINER:Ljava/util/logging/Level;

    invoke-virtual/range {v17 .. v18}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v17

    if-eqz v17, :cond_34

    .line 605
    sget-object v17, Lcom/sun/mail/util/SocketFetcher;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "matchCert server "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, ", cert "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Lcom/sun/mail/util/MailLogger;->finer(Ljava/lang/String;)V

    .line 615
    :cond_34
    :try_start_34
    const-string v17, "sun.security.util.HostnameChecker"

    invoke-static/range {v17 .. v17}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    .line 619
    .local v7, "hnc":Ljava/lang/Class;
    const-string v17, "getInstance"

    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    sget-object v20, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    aput-object v20, v18, v19

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v7, v0, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    .line 621
    .local v6, "getInstance":Ljava/lang/reflect/Method;
    new-instance v17, Ljava/lang/Object;

    invoke-direct/range {v17 .. v17}, Ljava/lang/Object;-><init>()V

    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    const/16 v20, 0x2

    .line 622
    invoke-static/range {v20 .. v20}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v20

    aput-object v20, v18, v19

    .line 621
    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v6, v0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    .line 625
    .local v8, "hostnameChecker":Ljava/lang/Object;
    sget-object v17, Lcom/sun/mail/util/SocketFetcher;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v18, Ljava/util/logging/Level;->FINER:Ljava/util/logging/Level;

    invoke-virtual/range {v17 .. v18}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v17

    if-eqz v17, :cond_82

    .line 626
    sget-object v17, Lcom/sun/mail/util/SocketFetcher;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v18, "using sun.security.util.HostnameChecker"

    invoke-virtual/range {v17 .. v18}, Lcom/sun/mail/util/MailLogger;->finer(Ljava/lang/String;)V

    .line 627
    :cond_82
    const-string v17, "match"

    const/16 v18, 0x2

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    const-class v20, Ljava/lang/String;

    aput-object v20, v18, v19

    const/16 v19, 0x1

    const-class v20, Ljava/security/cert/X509Certificate;

    aput-object v20, v18, v19

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v7, v0, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_9f
    .catch Ljava/lang/Exception; {:try_start_34 .. :try_end_9f} :catch_cb

    move-result-object v11

    .line 630
    .local v11, "match":Ljava/lang/reflect/Method;
    const/16 v17, 0x2

    :try_start_a2
    move/from16 v0, v17

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    aput-object p0, v17, v18

    const/16 v18, 0x1

    aput-object p1, v17, v18

    move-object/from16 v0, v17

    invoke-virtual {v11, v8, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_b5
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_a2 .. :try_end_b5} :catch_b8
    .catch Ljava/lang/Exception; {:try_start_a2 .. :try_end_b5} :catch_cb

    .line 631
    const/16 v17, 0x1

    .line 680
    .end local v6    # "getInstance":Ljava/lang/reflect/Method;
    .end local v7    # "hnc":Ljava/lang/Class;
    .end local v8    # "hostnameChecker":Ljava/lang/Object;
    .end local v11    # "match":Ljava/lang/reflect/Method;
    :goto_b7
    return v17

    .line 632
    .restart local v6    # "getInstance":Ljava/lang/reflect/Method;
    .restart local v7    # "hnc":Ljava/lang/Class;
    .restart local v8    # "hostnameChecker":Ljava/lang/Object;
    .restart local v11    # "match":Ljava/lang/reflect/Method;
    :catch_b8
    move-exception v3

    .line 633
    .local v3, "cex":Ljava/lang/reflect/InvocationTargetException;
    :try_start_b9
    sget-object v17, Lcom/sun/mail/util/SocketFetcher;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v18, Ljava/util/logging/Level;->FINER:Ljava/util/logging/Level;

    const-string v19, "FAIL"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-virtual {v0, v1, v2, v3}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_c8
    .catch Ljava/lang/Exception; {:try_start_b9 .. :try_end_c8} :catch_cb

    .line 634
    const/16 v17, 0x0

    goto :goto_b7

    .line 636
    .end local v3    # "cex":Ljava/lang/reflect/InvocationTargetException;
    .end local v6    # "getInstance":Ljava/lang/reflect/Method;
    .end local v7    # "hnc":Ljava/lang/Class;
    .end local v8    # "hostnameChecker":Ljava/lang/Object;
    .end local v11    # "match":Ljava/lang/reflect/Method;
    :catch_cb
    move-exception v4

    .line 637
    .local v4, "ex":Ljava/lang/Exception;
    sget-object v17, Lcom/sun/mail/util/SocketFetcher;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v18, Ljava/util/logging/Level;->FINER:Ljava/util/logging/Level;

    const-string v19, "NO sun.security.util.HostnameChecker"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-virtual {v0, v1, v2, v4}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 651
    :try_start_db
    invoke-virtual/range {p1 .. p1}, Ljava/security/cert/X509Certificate;->getSubjectAlternativeNames()Ljava/util/Collection;

    move-result-object v14

    .line 652
    .local v14, "names":Ljava/util/Collection;
    if-eqz v14, :cond_14a

    .line 653
    const/4 v5, 0x0

    .line 654
    .local v5, "foundName":Z
    invoke-interface {v14}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .local v9, "it":Ljava/util/Iterator;
    :cond_e6
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_143

    .line 655
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/util/List;

    .line 656
    .local v13, "nameEnt":Ljava/util/List;
    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-interface {v13, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/lang/Integer;

    .line 657
    .local v16, "type":Ljava/lang/Integer;
    invoke-virtual/range {v16 .. v16}, Ljava/lang/Integer;->intValue()I

    move-result v17

    const/16 v18, 0x2

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_e6

    .line 658
    const/4 v5, 0x1

    .line 659
    const/16 v17, 0x1

    move/from16 v0, v17

    invoke-interface {v13, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    .line 660
    .local v12, "name":Ljava/lang/String;
    sget-object v17, Lcom/sun/mail/util/SocketFetcher;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v18, Ljava/util/logging/Level;->FINER:Ljava/util/logging/Level;

    invoke-virtual/range {v17 .. v18}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v17

    if-eqz v17, :cond_137

    .line 661
    sget-object v17, Lcom/sun/mail/util/SocketFetcher;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "found name: "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Lcom/sun/mail/util/MailLogger;->finer(Ljava/lang/String;)V

    .line 662
    :cond_137
    move-object/from16 v0, p0

    invoke-static {v0, v12}, Lcom/sun/mail/util/SocketFetcher;->matchServer(Ljava/lang/String;Ljava/lang/String;)Z
    :try_end_13c
    .catch Ljava/security/cert/CertificateParsingException; {:try_start_db .. :try_end_13c} :catch_149

    move-result v17

    if-eqz v17, :cond_e6

    .line 663
    const/16 v17, 0x1

    goto/16 :goto_b7

    .line 666
    .end local v12    # "name":Ljava/lang/String;
    .end local v13    # "nameEnt":Ljava/util/List;
    .end local v16    # "type":Ljava/lang/Integer;
    :cond_143
    if-eqz v5, :cond_14a

    .line 667
    const/16 v17, 0x0

    goto/16 :goto_b7

    .line 669
    .end local v5    # "foundName":Z
    .end local v9    # "it":Ljava/util/Iterator;
    .end local v14    # "names":Ljava/util/Collection;
    :catch_149
    move-exception v17

    .line 675
    :cond_14a
    const-string v17, "CN=([^,]*)"

    invoke-static/range {v17 .. v17}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v15

    .line 676
    .local v15, "p":Ljava/util/regex/Pattern;
    invoke-virtual/range {p1 .. p1}, Ljava/security/cert/X509Certificate;->getSubjectX500Principal()Ljavax/security/auth/x500/X500Principal;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljavax/security/auth/x500/X500Principal;->getName()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v10

    .line 677
    .local v10, "m":Ljava/util/regex/Matcher;
    invoke-virtual {v10}, Ljava/util/regex/Matcher;->find()Z

    move-result v17

    if-eqz v17, :cond_17e

    const/16 v17, 0x1

    move/from16 v0, v17

    invoke-virtual {v10, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-static {v0, v1}, Lcom/sun/mail/util/SocketFetcher;->matchServer(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v17

    if-eqz v17, :cond_17e

    .line 678
    const/16 v17, 0x1

    goto/16 :goto_b7

    .line 680
    :cond_17e
    const/16 v17, 0x0

    goto/16 :goto_b7
.end method

.method private static matchServer(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 9
    .param p0, "server"    # Ljava/lang/String;
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x1

    const/4 v4, 0x0

    .line 691
    sget-object v0, Lcom/sun/mail/util/SocketFetcher;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v5, Ljava/util/logging/Level;->FINER:Ljava/util/logging/Level;

    invoke-virtual {v0, v5}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v0

    if-eqz v0, :cond_2e

    .line 692
    sget-object v0, Lcom/sun/mail/util/SocketFetcher;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "match server "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " with "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Lcom/sun/mail/util/MailLogger;->finer(Ljava/lang/String;)V

    .line 693
    :cond_2e
    const-string v0, "*."

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_67

    .line 695
    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 696
    .local v3, "tail":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_42

    .line 705
    .end local v3    # "tail":Ljava/lang/String;
    :cond_41
    :goto_41
    return v4

    .line 698
    .restart local v3    # "tail":Ljava/lang/String;
    :cond_42
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    sub-int v2, v0, v5

    .line 699
    .local v2, "off":I
    if-lt v2, v1, :cond_41

    .line 702
    add-int/lit8 v0, v2, -0x1

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v5, 0x2e

    if-ne v0, v5, :cond_65

    .line 703
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z

    move-result v0

    if-eqz v0, :cond_65

    :goto_63
    move v4, v1

    goto :goto_41

    :cond_65
    move v1, v4

    goto :goto_63

    .line 705
    .end local v2    # "off":I
    .end local v3    # "tail":Ljava/lang/String;
    :cond_67
    invoke-virtual {p0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    goto :goto_41
.end method

.method public static startTLS(Ljava/net/Socket;)Ljava/net/Socket;
    .registers 3
    .param p0, "socket"    # Ljava/net/Socket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 390
    new-instance v0, Ljava/util/Properties;

    invoke-direct {v0}, Ljava/util/Properties;-><init>()V

    const-string v1, "socket"

    invoke-static {p0, v0, v1}, Lcom/sun/mail/util/SocketFetcher;->startTLS(Ljava/net/Socket;Ljava/util/Properties;Ljava/lang/String;)Ljava/net/Socket;

    move-result-object v0

    return-object v0
.end method

.method public static startTLS(Ljava/net/Socket;Ljava/lang/String;Ljava/util/Properties;Ljava/lang/String;)Ljava/net/Socket;
    .registers 23
    .param p0, "socket"    # Ljava/net/Socket;
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "props"    # Ljava/util/Properties;
    .param p3, "prefix"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 412
    invoke-virtual/range {p0 .. p0}, Ljava/net/Socket;->getPort()I

    move-result v8

    .line 413
    .local v8, "port":I
    sget-object v16, Lcom/sun/mail/util/SocketFetcher;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v17, Ljava/util/logging/Level;->FINER:Ljava/util/logging/Level;

    invoke-virtual/range {v16 .. v17}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v16

    if-eqz v16, :cond_36

    .line 414
    sget-object v16, Lcom/sun/mail/util/SocketFetcher;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "startTLS host "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, ", port "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Lcom/sun/mail/util/MailLogger;->finer(Ljava/lang/String;)V

    .line 416
    :cond_36
    const-string v11, "unknown socket factory"

    .line 418
    .local v11, "sfErr":Ljava/lang/String;
    const/4 v13, 0x0

    .line 419
    .local v13, "ssf":Ljavax/net/ssl/SSLSocketFactory;
    const/4 v9, 0x0

    .line 422
    .local v9, "sf":Ljavax/net/SocketFactory;
    :try_start_3a
    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v16

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, ".ssl.socketFactory"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/Properties;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    .line 423
    .local v12, "sfo":Ljava/lang/Object;
    instance-of v0, v12, Ljavax/net/SocketFactory;

    move/from16 v16, v0

    if-eqz v16, :cond_78

    .line 424
    move-object v0, v12

    check-cast v0, Ljavax/net/SocketFactory;

    move-object v9, v0

    .line 425
    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "SSL socket factory instance "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 427
    :cond_78
    if-nez v9, :cond_b2

    .line 428
    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v16

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, ".ssl.socketFactory.class"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    .line 429
    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 430
    .local v10, "sfClass":Ljava/lang/String;
    invoke-static {v10}, Lcom/sun/mail/util/SocketFetcher;->getSocketFactory(Ljava/lang/String;)Ljavax/net/SocketFactory;

    move-result-object v9

    .line 431
    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "SSL socket factory class "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 433
    .end local v10    # "sfClass":Ljava/lang/String;
    :cond_b2
    if-eqz v9, :cond_be

    instance-of v0, v9, Ljavax/net/ssl/SSLSocketFactory;

    move/from16 v16, v0

    if-eqz v16, :cond_be

    .line 434
    move-object v0, v9

    check-cast v0, Ljavax/net/ssl/SSLSocketFactory;

    move-object v13, v0

    .line 438
    :cond_be
    if-nez v13, :cond_144

    .line 439
    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v16

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, ".socketFactory"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/Properties;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    .line 440
    instance-of v0, v12, Ljavax/net/SocketFactory;

    move/from16 v16, v0

    if-eqz v16, :cond_fe

    .line 441
    move-object v0, v12

    check-cast v0, Ljavax/net/SocketFactory;

    move-object v9, v0

    .line 442
    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "socket factory instance "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 444
    :cond_fe
    if-nez v9, :cond_138

    .line 445
    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v16

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, ".socketFactory.class"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    .line 446
    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 447
    .restart local v10    # "sfClass":Ljava/lang/String;
    invoke-static {v10}, Lcom/sun/mail/util/SocketFetcher;->getSocketFactory(Ljava/lang/String;)Ljavax/net/SocketFactory;

    move-result-object v9

    .line 448
    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "socket factory class "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 450
    .end local v10    # "sfClass":Ljava/lang/String;
    :cond_138
    if-eqz v9, :cond_144

    instance-of v0, v9, Ljavax/net/ssl/SSLSocketFactory;

    move/from16 v16, v0

    if-eqz v16, :cond_144

    .line 451
    move-object v0, v9

    check-cast v0, Ljavax/net/ssl/SSLSocketFactory;

    move-object v13, v0

    .line 455
    :cond_144
    if-nez v13, :cond_17e

    .line 457
    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v16

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, ".ssl.trust"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;
    :try_end_164
    .catch Ljava/lang/Exception; {:try_start_3a .. :try_end_164} :catch_1b0

    move-result-object v15

    .local v15, "trusted":Ljava/lang/String;
    if-eqz v15, :cond_1d1

    .line 460
    :try_start_167
    new-instance v7, Lcom/sun/mail/util/MailSSLSocketFactory;

    invoke-direct {v7}, Lcom/sun/mail/util/MailSSLSocketFactory;-><init>()V

    .line 461
    .local v7, "msf":Lcom/sun/mail/util/MailSSLSocketFactory;
    const-string v16, "*"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v16

    if-eqz v16, :cond_196

    .line 462
    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v7, v0}, Lcom/sun/mail/util/MailSSLSocketFactory;->setTrustAllHosts(Z)V

    .line 465
    :goto_17b
    move-object v13, v7

    .line 466
    const-string v11, "mail SSL socket factory"
    :try_end_17e
    .catch Ljava/security/GeneralSecurityException; {:try_start_167 .. :try_end_17e} :catch_1a2
    .catch Ljava/lang/Exception; {:try_start_167 .. :try_end_17e} :catch_1b0

    .line 479
    .end local v7    # "msf":Lcom/sun/mail/util/MailSSLSocketFactory;
    .end local v15    # "trusted":Ljava/lang/String;
    :cond_17e
    :goto_17e
    const/16 v16, 0x1

    :try_start_180
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v16

    invoke-virtual {v13, v0, v1, v8, v2}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/net/Socket;Ljava/lang/String;IZ)Ljava/net/Socket;

    move-result-object p0

    .line 480
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    invoke-static {v0, v1, v2, v3, v13}, Lcom/sun/mail/util/SocketFetcher;->configureSSLSocket(Ljava/net/Socket;Ljava/lang/String;Ljava/util/Properties;Ljava/lang/String;Ljavax/net/SocketFactory;)V
    :try_end_195
    .catch Ljava/lang/Exception; {:try_start_180 .. :try_end_195} :catch_1b0

    .line 499
    return-object p0

    .line 464
    .restart local v7    # "msf":Lcom/sun/mail/util/MailSSLSocketFactory;
    .restart local v15    # "trusted":Ljava/lang/String;
    :cond_196
    :try_start_196
    const-string v16, "\\s+"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v7, v0}, Lcom/sun/mail/util/MailSSLSocketFactory;->setTrustedHosts([Ljava/lang/String;)V
    :try_end_1a1
    .catch Ljava/security/GeneralSecurityException; {:try_start_196 .. :try_end_1a1} :catch_1a2
    .catch Ljava/lang/Exception; {:try_start_196 .. :try_end_1a1} :catch_1b0

    goto :goto_17b

    .line 467
    .end local v7    # "msf":Lcom/sun/mail/util/MailSSLSocketFactory;
    :catch_1a2
    move-exception v5

    .line 468
    .local v5, "gex":Ljava/security/GeneralSecurityException;
    :try_start_1a3
    new-instance v6, Ljava/io/IOException;

    const-string v16, "Can\'t create MailSSLSocketFactory"

    move-object/from16 v0, v16

    invoke-direct {v6, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 470
    .local v6, "ioex":Ljava/io/IOException;
    invoke-virtual {v6, v5}, Ljava/io/IOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 471
    throw v6
    :try_end_1b0
    .catch Ljava/lang/Exception; {:try_start_1a3 .. :try_end_1b0} :catch_1b0

    .line 481
    .end local v5    # "gex":Ljava/security/GeneralSecurityException;
    .end local v6    # "ioex":Ljava/io/IOException;
    .end local v12    # "sfo":Ljava/lang/Object;
    .end local v15    # "trusted":Ljava/lang/String;
    :catch_1b0
    move-exception v4

    .line 482
    .local v4, "ex":Ljava/lang/Exception;
    instance-of v0, v4, Ljava/lang/reflect/InvocationTargetException;

    move/from16 v16, v0

    if-eqz v16, :cond_1c8

    move-object/from16 v16, v4

    .line 483
    check-cast v16, Ljava/lang/reflect/InvocationTargetException;

    .line 484
    invoke-virtual/range {v16 .. v16}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object v14

    .line 485
    .local v14, "t":Ljava/lang/Throwable;
    instance-of v0, v14, Ljava/lang/Exception;

    move/from16 v16, v0

    if-eqz v16, :cond_1c8

    move-object v4, v14

    .line 486
    check-cast v4, Ljava/lang/Exception;

    .line 488
    .end local v14    # "t":Ljava/lang/Throwable;
    :cond_1c8
    instance-of v0, v4, Ljava/io/IOException;

    move/from16 v16, v0

    if-eqz v16, :cond_1dd

    .line 489
    check-cast v4, Ljava/io/IOException;

    .end local v4    # "ex":Ljava/lang/Exception;
    throw v4

    .line 474
    .restart local v12    # "sfo":Ljava/lang/Object;
    .restart local v15    # "trusted":Ljava/lang/String;
    :cond_1d1
    :try_start_1d1
    invoke-static {}, Ljavax/net/ssl/SSLSocketFactory;->getDefault()Ljavax/net/SocketFactory;

    move-result-object v16

    move-object/from16 v0, v16

    check-cast v0, Ljavax/net/ssl/SSLSocketFactory;

    move-object v13, v0

    .line 475
    const-string v11, "default SSL socket factory"
    :try_end_1dc
    .catch Ljava/lang/Exception; {:try_start_1d1 .. :try_end_1dc} :catch_1b0

    goto :goto_17e

    .line 491
    .end local v12    # "sfo":Ljava/lang/Object;
    .end local v15    # "trusted":Ljava/lang/String;
    .restart local v4    # "ex":Ljava/lang/Exception;
    :cond_1dd
    new-instance v6, Ljava/io/IOException;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "Exception in startTLS using "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, ": host, port: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, ", "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, "; Exception: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v6, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 496
    .restart local v6    # "ioex":Ljava/io/IOException;
    invoke-virtual {v6, v4}, Ljava/io/IOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 497
    throw v6
.end method

.method public static startTLS(Ljava/net/Socket;Ljava/util/Properties;Ljava/lang/String;)Ljava/net/Socket;
    .registers 6
    .param p0, "socket"    # Ljava/net/Socket;
    .param p1, "props"    # Ljava/util/Properties;
    .param p2, "prefix"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 401
    invoke-virtual {p0}, Ljava/net/Socket;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v0

    .line 402
    .local v0, "a":Ljava/net/InetAddress;
    invoke-virtual {v0}, Ljava/net/InetAddress;->getHostName()Ljava/lang/String;

    move-result-object v1

    .line 403
    .local v1, "host":Ljava/lang/String;
    invoke-static {p0, v1, p1, p2}, Lcom/sun/mail/util/SocketFetcher;->startTLS(Ljava/net/Socket;Ljava/lang/String;Ljava/util/Properties;Ljava/lang/String;)Ljava/net/Socket;

    move-result-object v2

    return-object v2
.end method

.method private static stringArray(Ljava/lang/String;)[Ljava/lang/String;
    .registers 4
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 713
    new-instance v0, Ljava/util/StringTokenizer;

    invoke-direct {v0, p0}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;)V

    .line 714
    .local v0, "st":Ljava/util/StringTokenizer;
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 715
    .local v1, "tokens":Ljava/util/List;
    :goto_a
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v2

    if-eqz v2, :cond_18

    .line 716
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_a

    .line 717
    :cond_18
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    new-array v2, v2, [Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/String;

    check-cast v2, [Ljava/lang/String;

    return-object v2
.end method
