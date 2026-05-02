.class public Lcom/koushikdutta/async/AsyncSSLSocketWrapper;
.super Ljava/lang/Object;
.source "AsyncSSLSocketWrapper.java"

# interfaces
.implements Lcom/koushikdutta/async/wrapper/AsyncSocketWrapper;
.implements Lcom/koushikdutta/async/AsyncSSLSocket;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/koushikdutta/async/AsyncSSLSocketWrapper$HandshakeCallback;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field static defaultSSLContext:Ljavax/net/ssl/SSLContext;


# instance fields
.field clientMode:Z

.field final dataCallback:Lcom/koushikdutta/async/callback/DataCallback;

.field engine:Ljavax/net/ssl/SSLEngine;

.field finishedHandshake:Z

.field handshakeCallback:Lcom/koushikdutta/async/AsyncSSLSocketWrapper$HandshakeCallback;

.field hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

.field mDataCallback:Lcom/koushikdutta/async/callback/DataCallback;

.field mEndCallback:Lcom/koushikdutta/async/callback/CompletedCallback;

.field mEndException:Ljava/lang/Exception;

.field mEnded:Z

.field private mHost:Ljava/lang/String;

.field private mPort:I

.field mSink:Lcom/koushikdutta/async/BufferedDataSink;

.field mSocket:Lcom/koushikdutta/async/AsyncSocket;

.field mUnwrapping:Z

.field private mWrapping:Z

.field mWriteableCallback:Lcom/koushikdutta/async/callback/WritableCallback;

.field peerCertificates:[Ljava/security/cert/X509Certificate;

.field final pending:Lcom/koushikdutta/async/ByteBufferList;

.field trustManagers:[Ljavax/net/ssl/TrustManager;

.field writeList:Lcom/koushikdutta/async/ByteBufferList;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 30
    const-class v5, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;

    invoke-virtual {v5}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v5

    if-nez v5, :cond_34

    :goto_a
    sput-boolean v3, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->$assertionsDisabled:Z

    .line 61
    :try_start_c
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0xf

    if-gt v3, v4, :cond_36

    .line 62
    new-instance v3, Ljava/lang/Exception;

    invoke-direct {v3}, Ljava/lang/Exception;-><init>()V

    throw v3
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_18} :catch_18

    .line 65
    :catch_18
    move-exception v0

    .line 67
    .local v0, "ex":Ljava/lang/Exception;
    :try_start_19
    const-string v3, "TLS"

    invoke-static {v3}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v3

    sput-object v3, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->defaultSSLContext:Ljavax/net/ssl/SSLContext;

    .line 68
    const/4 v3, 0x1

    new-array v2, v3, [Ljavax/net/ssl/TrustManager;

    const/4 v3, 0x0

    new-instance v4, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$1;

    invoke-direct {v4}, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$1;-><init>()V

    aput-object v4, v2, v3

    .line 83
    .local v2, "trustAllCerts":[Ljavax/net/ssl/TrustManager;
    sget-object v3, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->defaultSSLContext:Ljavax/net/ssl/SSLContext;

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v2, v5}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V
    :try_end_33
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_33} :catch_3f

    .line 90
    .end local v2    # "trustAllCerts":[Ljavax/net/ssl/TrustManager;
    :goto_33
    return-void

    .end local v0    # "ex":Ljava/lang/Exception;
    :cond_34
    move v3, v4

    .line 30
    goto :goto_a

    .line 63
    :cond_36
    :try_start_36
    const-string v3, "Default"

    invoke-static {v3}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v3

    sput-object v3, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->defaultSSLContext:Ljavax/net/ssl/SSLContext;
    :try_end_3e
    .catch Ljava/lang/Exception; {:try_start_36 .. :try_end_3e} :catch_18

    goto :goto_33

    .line 85
    .restart local v0    # "ex":Ljava/lang/Exception;
    :catch_3f
    move-exception v1

    .line 86
    .local v1, "ex2":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 87
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_33
.end method

.method private constructor <init>(Lcom/koushikdutta/async/AsyncSocket;Ljava/lang/String;ILjavax/net/ssl/SSLEngine;[Ljavax/net/ssl/TrustManager;Ljavax/net/ssl/HostnameVerifier;Z)V
    .registers 10
    .param p1, "socket"    # Lcom/koushikdutta/async/AsyncSocket;
    .param p2, "host"    # Ljava/lang/String;
    .param p3, "port"    # I
    .param p4, "sslEngine"    # Ljavax/net/ssl/SSLEngine;
    .param p5, "trustManagers"    # [Ljavax/net/ssl/TrustManager;
    .param p6, "verifier"    # Ljavax/net/ssl/HostnameVerifier;
    .param p7, "clientMode"    # Z

    .prologue
    .line 127
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 122
    new-instance v0, Lcom/koushikdutta/async/ByteBufferList;

    invoke-direct {v0}, Lcom/koushikdutta/async/ByteBufferList;-><init>()V

    iput-object v0, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->pending:Lcom/koushikdutta/async/ByteBufferList;

    .line 164
    new-instance v0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$5;

    invoke-direct {v0, p0}, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$5;-><init>(Lcom/koushikdutta/async/AsyncSSLSocketWrapper;)V

    iput-object v0, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->dataCallback:Lcom/koushikdutta/async/callback/DataCallback;

    .line 364
    new-instance v0, Lcom/koushikdutta/async/ByteBufferList;

    invoke-direct {v0}, Lcom/koushikdutta/async/ByteBufferList;-><init>()V

    iput-object v0, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->writeList:Lcom/koushikdutta/async/ByteBufferList;

    .line 128
    iput-object p1, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->mSocket:Lcom/koushikdutta/async/AsyncSocket;

    .line 129
    iput-object p6, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    .line 130
    iput-boolean p7, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->clientMode:Z

    .line 131
    iput-object p5, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->trustManagers:[Ljavax/net/ssl/TrustManager;

    .line 132
    iput-object p4, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->engine:Ljavax/net/ssl/SSLEngine;

    .line 134
    iput-object p2, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->mHost:Ljava/lang/String;

    .line 135
    iput p3, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->mPort:I

    .line 136
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v0, p7}, Ljavax/net/ssl/SSLEngine;->setUseClientMode(Z)V

    .line 137
    new-instance v0, Lcom/koushikdutta/async/BufferedDataSink;

    invoke-direct {v0, p1}, Lcom/koushikdutta/async/BufferedDataSink;-><init>(Lcom/koushikdutta/async/DataSink;)V

    iput-object v0, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->mSink:Lcom/koushikdutta/async/BufferedDataSink;

    .line 138
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->mSink:Lcom/koushikdutta/async/BufferedDataSink;

    new-instance v1, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$3;

    invoke-direct {v1, p0}, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$3;-><init>(Lcom/koushikdutta/async/AsyncSSLSocketWrapper;)V

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/BufferedDataSink;->setWriteableCallback(Lcom/koushikdutta/async/callback/WritableCallback;)V

    .line 149
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->mSocket:Lcom/koushikdutta/async/AsyncSocket;

    new-instance v1, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$4;

    invoke-direct {v1, p0}, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$4;-><init>(Lcom/koushikdutta/async/AsyncSSLSocketWrapper;)V

    invoke-interface {v0, v1}, Lcom/koushikdutta/async/AsyncSocket;->setEndCallback(Lcom/koushikdutta/async/callback/CompletedCallback;)V

    .line 161
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->mSocket:Lcom/koushikdutta/async/AsyncSocket;

    iget-object v1, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->dataCallback:Lcom/koushikdutta/async/callback/DataCallback;

    invoke-interface {v0, v1}, Lcom/koushikdutta/async/AsyncSocket;->setDataCallback(Lcom/koushikdutta/async/callback/DataCallback;)V

    .line 162
    return-void
.end method

.method static synthetic access$000(Lcom/koushikdutta/async/AsyncSSLSocketWrapper;Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;)V
    .registers 2
    .param p0, "x0"    # Lcom/koushikdutta/async/AsyncSSLSocketWrapper;
    .param p1, "x1"    # Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;

    .prologue
    .line 30
    invoke-direct {p0, p1}, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->handleHandshakeStatus(Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;)V

    return-void
.end method

.method static synthetic access$100(Lcom/koushikdutta/async/AsyncSSLSocketWrapper;Ljava/lang/Exception;)V
    .registers 2
    .param p0, "x0"    # Lcom/koushikdutta/async/AsyncSSLSocketWrapper;
    .param p1, "x1"    # Ljava/lang/Exception;

    .prologue
    .line 30
    invoke-direct {p0, p1}, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->report(Ljava/lang/Exception;)V

    return-void
.end method

.method public static getDefaultSSLContext()Ljavax/net/ssl/SSLContext;
    .registers 1

    .prologue
    .line 93
    sget-object v0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->defaultSSLContext:Ljavax/net/ssl/SSLContext;

    return-object v0
.end method

.method private handleHandshakeStatus(Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;)V
    .registers 20
    .param p1, "status"    # Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;

    .prologue
    .line 270
    sget-object v14, Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;->NEED_TASK:Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;

    move-object/from16 v0, p1

    if-ne v0, v14, :cond_11

    .line 271
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v14}, Ljavax/net/ssl/SSLEngine;->getDelegatedTask()Ljava/lang/Runnable;

    move-result-object v7

    .line 272
    .local v7, "task":Ljava/lang/Runnable;
    invoke-interface {v7}, Ljava/lang/Runnable;->run()V

    .line 275
    .end local v7    # "task":Ljava/lang/Runnable;
    :cond_11
    sget-object v14, Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;->NEED_WRAP:Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;

    move-object/from16 v0, p1

    if-ne v0, v14, :cond_20

    .line 276
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->writeList:Lcom/koushikdutta/async/ByteBufferList;

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->write(Lcom/koushikdutta/async/ByteBufferList;)V

    .line 279
    :cond_20
    sget-object v14, Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;->NEED_UNWRAP:Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;

    move-object/from16 v0, p1

    if-ne v0, v14, :cond_34

    .line 280
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->dataCallback:Lcom/koushikdutta/async/callback/DataCallback;

    new-instance v15, Lcom/koushikdutta/async/ByteBufferList;

    invoke-direct {v15}, Lcom/koushikdutta/async/ByteBufferList;-><init>()V

    move-object/from16 v0, p0

    invoke-interface {v14, v0, v15}, Lcom/koushikdutta/async/callback/DataCallback;->onDataAvailable(Lcom/koushikdutta/async/DataEmitter;Lcom/koushikdutta/async/ByteBufferList;)V

    .line 284
    :cond_34
    :try_start_34
    move-object/from16 v0, p0

    iget-boolean v14, v0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->finishedHandshake:Z

    if-nez v14, :cond_13a

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v14}, Ljavax/net/ssl/SSLEngine;->getHandshakeStatus()Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;

    move-result-object v14

    sget-object v15, Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;->NOT_HANDSHAKING:Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;

    if-eq v14, v15, :cond_52

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v14}, Ljavax/net/ssl/SSLEngine;->getHandshakeStatus()Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;

    move-result-object v14

    sget-object v15, Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;->FINISHED:Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;

    if-ne v14, v15, :cond_13a

    .line 285
    :cond_52
    move-object/from16 v0, p0

    iget-boolean v14, v0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->clientMode:Z

    if-eqz v14, :cond_10d

    .line 286
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->trustManagers:[Ljavax/net/ssl/TrustManager;

    .line 287
    .local v10, "trustManagers":[Ljavax/net/ssl/TrustManager;
    if-nez v10, :cond_70

    .line 288
    invoke-static {}, Ljavax/net/ssl/TrustManagerFactory;->getDefaultAlgorithm()Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Ljavax/net/ssl/TrustManagerFactory;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/TrustManagerFactory;

    move-result-object v9

    .line 289
    .local v9, "tmf":Ljavax/net/ssl/TrustManagerFactory;
    const/4 v14, 0x0

    check-cast v14, Ljava/security/KeyStore;

    invoke-virtual {v9, v14}, Ljavax/net/ssl/TrustManagerFactory;->init(Ljava/security/KeyStore;)V

    .line 290
    invoke-virtual {v9}, Ljavax/net/ssl/TrustManagerFactory;->getTrustManagers()[Ljavax/net/ssl/TrustManager;

    move-result-object v10

    .line 292
    .end local v9    # "tmf":Ljavax/net/ssl/TrustManagerFactory;
    :cond_70
    const/4 v11, 0x0

    .line 293
    .local v11, "trusted":Z
    const/4 v6, 0x0

    .line 294
    .local v6, "peerUnverifiedCause":Ljava/lang/Exception;
    move-object v1, v10

    .local v1, "arr$":[Ljavax/net/ssl/TrustManager;
    array-length v5, v1

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_75
    if-ge v4, v5, :cond_cf

    aget-object v8, v1, v4
    :try_end_79
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_34 .. :try_end_79} :catch_e7
    .catch Ljava/security/GeneralSecurityException; {:try_start_34 .. :try_end_79} :catch_13b
    .catch Lcom/koushikdutta/async/AsyncSSLException; {:try_start_34 .. :try_end_79} :catch_142

    .line 296
    .local v8, "tm":Ljavax/net/ssl/TrustManager;
    :try_start_79
    move-object v0, v8

    check-cast v0, Ljavax/net/ssl/X509TrustManager;

    move-object v13, v0

    .line 297
    .local v13, "xtm":Ljavax/net/ssl/X509TrustManager;
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v14}, Ljavax/net/ssl/SSLEngine;->getSession()Ljavax/net/ssl/SSLSession;

    move-result-object v14

    invoke-interface {v14}, Ljavax/net/ssl/SSLSession;->getPeerCertificates()[Ljava/security/cert/Certificate;

    move-result-object v14

    check-cast v14, [Ljava/security/cert/X509Certificate;

    check-cast v14, [Ljava/security/cert/X509Certificate;

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->peerCertificates:[Ljava/security/cert/X509Certificate;

    .line 298
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->peerCertificates:[Ljava/security/cert/X509Certificate;

    const-string v15, "SSL"

    invoke-interface {v13, v14, v15}, Ljavax/net/ssl/X509TrustManager;->checkServerTrusted([Ljava/security/cert/X509Certificate;Ljava/lang/String;)V

    .line 299
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->mHost:Ljava/lang/String;

    if-eqz v14, :cond_ce

    .line 300
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    if-nez v14, :cond_ee

    .line 301
    new-instance v12, Lorg/apache/http/conn/ssl/StrictHostnameVerifier;

    invoke-direct {v12}, Lorg/apache/http/conn/ssl/StrictHostnameVerifier;-><init>()V

    .line 302
    .local v12, "verifier":Lorg/apache/http/conn/ssl/StrictHostnameVerifier;
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->mHost:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->peerCertificates:[Ljava/security/cert/X509Certificate;

    const/16 v16, 0x0

    aget-object v15, v15, v16

    invoke-static {v15}, Lorg/apache/http/conn/ssl/StrictHostnameVerifier;->getCNs(Ljava/security/cert/X509Certificate;)[Ljava/lang/String;

    move-result-object v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->peerCertificates:[Ljava/security/cert/X509Certificate;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    aget-object v16, v16, v17

    invoke-static/range {v16 .. v16}, Lorg/apache/http/conn/ssl/StrictHostnameVerifier;->getDNSSubjectAlts(Ljava/security/cert/X509Certificate;)[Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v12, v14, v15, v0}, Lorg/apache/http/conn/ssl/StrictHostnameVerifier;->verify(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)V
    :try_end_ce
    .catch Ljava/security/GeneralSecurityException; {:try_start_79 .. :try_end_ce} :catch_104
    .catch Ljavax/net/ssl/SSLException; {:try_start_79 .. :try_end_ce} :catch_10a
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_79 .. :try_end_ce} :catch_e7
    .catch Lcom/koushikdutta/async/AsyncSSLException; {:try_start_79 .. :try_end_ce} :catch_142

    .line 308
    .end local v12    # "verifier":Lorg/apache/http/conn/ssl/StrictHostnameVerifier;
    :cond_ce
    :goto_ce
    const/4 v11, 0x1

    .line 318
    .end local v8    # "tm":Ljavax/net/ssl/TrustManager;
    .end local v13    # "xtm":Ljavax/net/ssl/X509TrustManager;
    :cond_cf
    const/4 v14, 0x1

    :try_start_d0
    move-object/from16 v0, p0

    iput-boolean v14, v0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->finishedHandshake:Z

    .line 319
    if-nez v11, :cond_112

    .line 320
    new-instance v2, Lcom/koushikdutta/async/AsyncSSLException;

    invoke-direct {v2, v6}, Lcom/koushikdutta/async/AsyncSSLException;-><init>(Ljava/lang/Throwable;)V

    .line 321
    .local v2, "e":Lcom/koushikdutta/async/AsyncSSLException;
    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->report(Ljava/lang/Exception;)V

    .line 322
    invoke-virtual {v2}, Lcom/koushikdutta/async/AsyncSSLException;->getIgnore()Z

    move-result v14

    if-nez v14, :cond_112

    .line 323
    throw v2
    :try_end_e7
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_d0 .. :try_end_e7} :catch_e7
    .catch Ljava/security/GeneralSecurityException; {:try_start_d0 .. :try_end_e7} :catch_13b
    .catch Lcom/koushikdutta/async/AsyncSSLException; {:try_start_d0 .. :try_end_e7} :catch_142

    .line 345
    .end local v1    # "arr$":[Ljavax/net/ssl/TrustManager;
    .end local v2    # "e":Lcom/koushikdutta/async/AsyncSSLException;
    .end local v4    # "i$":I
    .end local v5    # "len$":I
    .end local v6    # "peerUnverifiedCause":Ljava/lang/Exception;
    .end local v10    # "trustManagers":[Ljavax/net/ssl/TrustManager;
    .end local v11    # "trusted":Z
    :catch_e7
    move-exception v3

    .line 346
    .local v3, "ex":Ljava/security/NoSuchAlgorithmException;
    new-instance v14, Ljava/lang/RuntimeException;

    invoke-direct {v14, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v14

    .line 305
    .end local v3    # "ex":Ljava/security/NoSuchAlgorithmException;
    .restart local v1    # "arr$":[Ljavax/net/ssl/TrustManager;
    .restart local v4    # "i$":I
    .restart local v5    # "len$":I
    .restart local v6    # "peerUnverifiedCause":Ljava/lang/Exception;
    .restart local v8    # "tm":Ljavax/net/ssl/TrustManager;
    .restart local v10    # "trustManagers":[Ljavax/net/ssl/TrustManager;
    .restart local v11    # "trusted":Z
    .restart local v13    # "xtm":Ljavax/net/ssl/X509TrustManager;
    :cond_ee
    :try_start_ee
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->mHost:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->engine:Ljavax/net/ssl/SSLEngine;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Ljavax/net/ssl/SSLEngine;->getSession()Ljavax/net/ssl/SSLSession;

    move-result-object v16

    invoke-interface/range {v14 .. v16}, Ljavax/net/ssl/HostnameVerifier;->verify(Ljava/lang/String;Ljavax/net/ssl/SSLSession;)Z
    :try_end_103
    .catch Ljava/security/GeneralSecurityException; {:try_start_ee .. :try_end_103} :catch_104
    .catch Ljavax/net/ssl/SSLException; {:try_start_ee .. :try_end_103} :catch_10a
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_ee .. :try_end_103} :catch_e7
    .catch Lcom/koushikdutta/async/AsyncSSLException; {:try_start_ee .. :try_end_103} :catch_142

    goto :goto_ce

    .line 311
    .end local v13    # "xtm":Ljavax/net/ssl/X509TrustManager;
    :catch_104
    move-exception v3

    .line 312
    .local v3, "ex":Ljava/security/GeneralSecurityException;
    move-object v6, v3

    .line 294
    .end local v3    # "ex":Ljava/security/GeneralSecurityException;
    :goto_106
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_75

    .line 314
    :catch_10a
    move-exception v3

    .line 315
    .local v3, "ex":Ljavax/net/ssl/SSLException;
    move-object v6, v3

    goto :goto_106

    .line 327
    .end local v1    # "arr$":[Ljavax/net/ssl/TrustManager;
    .end local v3    # "ex":Ljavax/net/ssl/SSLException;
    .end local v4    # "i$":I
    .end local v5    # "len$":I
    .end local v6    # "peerUnverifiedCause":Ljava/lang/Exception;
    .end local v8    # "tm":Ljavax/net/ssl/TrustManager;
    .end local v10    # "trustManagers":[Ljavax/net/ssl/TrustManager;
    .end local v11    # "trusted":Z
    :cond_10d
    const/4 v14, 0x1

    :try_start_10e
    move-object/from16 v0, p0

    iput-boolean v14, v0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->finishedHandshake:Z

    .line 329
    :cond_112
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->handshakeCallback:Lcom/koushikdutta/async/AsyncSSLSocketWrapper$HandshakeCallback;

    const/4 v15, 0x0

    move-object/from16 v0, p0

    invoke-interface {v14, v15, v0}, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$HandshakeCallback;->onHandshakeCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/AsyncSSLSocket;)V

    .line 330
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->handshakeCallback:Lcom/koushikdutta/async/AsyncSSLSocketWrapper$HandshakeCallback;

    .line 332
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->mSocket:Lcom/koushikdutta/async/AsyncSocket;

    const/4 v15, 0x0

    invoke-interface {v14, v15}, Lcom/koushikdutta/async/AsyncSocket;->setClosedCallback(Lcom/koushikdutta/async/callback/CompletedCallback;)V

    .line 335
    invoke-virtual/range {p0 .. p0}, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->getServer()Lcom/koushikdutta/async/AsyncServer;

    move-result-object v14

    new-instance v15, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$6;

    move-object/from16 v0, p0

    invoke-direct {v15, v0}, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$6;-><init>(Lcom/koushikdutta/async/AsyncSSLSocketWrapper;)V

    invoke-virtual {v14, v15}, Lcom/koushikdutta/async/AsyncServer;->post(Ljava/lang/Runnable;)Ljava/lang/Object;

    .line 342
    invoke-virtual/range {p0 .. p0}, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->onDataAvailable()V
    :try_end_13a
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_10e .. :try_end_13a} :catch_e7
    .catch Ljava/security/GeneralSecurityException; {:try_start_10e .. :try_end_13a} :catch_13b
    .catch Lcom/koushikdutta/async/AsyncSSLException; {:try_start_10e .. :try_end_13a} :catch_142

    .line 354
    :cond_13a
    :goto_13a
    return-void

    .line 348
    :catch_13b
    move-exception v3

    .line 349
    .local v3, "ex":Ljava/security/GeneralSecurityException;
    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->report(Ljava/lang/Exception;)V

    goto :goto_13a

    .line 351
    .end local v3    # "ex":Ljava/security/GeneralSecurityException;
    :catch_142
    move-exception v3

    .line 352
    .local v3, "ex":Lcom/koushikdutta/async/AsyncSSLException;
    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->report(Ljava/lang/Exception;)V

    goto :goto_13a
.end method

.method public static handshake(Lcom/koushikdutta/async/AsyncSocket;Ljava/lang/String;ILjavax/net/ssl/SSLEngine;[Ljavax/net/ssl/TrustManager;Ljavax/net/ssl/HostnameVerifier;ZLcom/koushikdutta/async/AsyncSSLSocketWrapper$HandshakeCallback;)V
    .registers 18
    .param p0, "socket"    # Lcom/koushikdutta/async/AsyncSocket;
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "sslEngine"    # Ljavax/net/ssl/SSLEngine;
    .param p4, "trustManagers"    # [Ljavax/net/ssl/TrustManager;
    .param p5, "verifier"    # Ljavax/net/ssl/HostnameVerifier;
    .param p6, "clientMode"    # Z
    .param p7, "callback"    # Lcom/koushikdutta/async/AsyncSSLSocketWrapper$HandshakeCallback;

    .prologue
    .line 101
    new-instance v1, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;

    move-object v2, p0

    move-object v3, p1

    move v4, p2

    move-object v5, p3

    move-object v6, p4

    move-object v7, p5

    move/from16 v8, p6

    invoke-direct/range {v1 .. v8}, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;-><init>(Lcom/koushikdutta/async/AsyncSocket;Ljava/lang/String;ILjavax/net/ssl/SSLEngine;[Ljavax/net/ssl/TrustManager;Ljavax/net/ssl/HostnameVerifier;Z)V

    .line 102
    .local v1, "wrapper":Lcom/koushikdutta/async/AsyncSSLSocketWrapper;
    move-object/from16 v0, p7

    iput-object v0, v1, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->handshakeCallback:Lcom/koushikdutta/async/AsyncSSLSocketWrapper$HandshakeCallback;

    .line 103
    new-instance v2, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$2;

    move-object/from16 v0, p7

    invoke-direct {v2, v0}, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$2;-><init>(Lcom/koushikdutta/async/AsyncSSLSocketWrapper$HandshakeCallback;)V

    invoke-interface {p0, v2}, Lcom/koushikdutta/async/AsyncSocket;->setClosedCallback(Lcom/koushikdutta/async/callback/CompletedCallback;)V

    .line 113
    :try_start_1b
    iget-object v2, v1, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v2}, Ljavax/net/ssl/SSLEngine;->beginHandshake()V

    .line 114
    iget-object v2, v1, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v2}, Ljavax/net/ssl/SSLEngine;->getHandshakeStatus()Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->handleHandshakeStatus(Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;)V
    :try_end_29
    .catch Ljavax/net/ssl/SSLException; {:try_start_1b .. :try_end_29} :catch_2a

    .line 118
    :goto_29
    return-void

    .line 115
    :catch_2a
    move-exception v9

    .line 116
    .local v9, "e":Ljavax/net/ssl/SSLException;
    invoke-direct {v1, v9}, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->report(Ljava/lang/Exception;)V

    goto :goto_29
.end method

.method private report(Ljava/lang/Exception;)V
    .registers 7
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    const/4 v4, 0x0

    .line 422
    iget-object v1, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->handshakeCallback:Lcom/koushikdutta/async/AsyncSSLSocketWrapper$HandshakeCallback;

    .line 423
    .local v1, "hs":Lcom/koushikdutta/async/AsyncSSLSocketWrapper$HandshakeCallback;
    if-eqz v1, :cond_24

    .line 424
    iput-object v4, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->handshakeCallback:Lcom/koushikdutta/async/AsyncSSLSocketWrapper$HandshakeCallback;

    .line 425
    iget-object v2, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->mSocket:Lcom/koushikdutta/async/AsyncSocket;

    new-instance v3, Lcom/koushikdutta/async/callback/DataCallback$NullDataCallback;

    invoke-direct {v3}, Lcom/koushikdutta/async/callback/DataCallback$NullDataCallback;-><init>()V

    invoke-interface {v2, v3}, Lcom/koushikdutta/async/AsyncSocket;->setDataCallback(Lcom/koushikdutta/async/callback/DataCallback;)V

    .line 426
    iget-object v2, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->mSocket:Lcom/koushikdutta/async/AsyncSocket;

    invoke-interface {v2}, Lcom/koushikdutta/async/AsyncSocket;->end()V

    .line 428
    iget-object v2, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->mSocket:Lcom/koushikdutta/async/AsyncSocket;

    invoke-interface {v2, v4}, Lcom/koushikdutta/async/AsyncSocket;->setClosedCallback(Lcom/koushikdutta/async/callback/CompletedCallback;)V

    .line 429
    iget-object v2, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->mSocket:Lcom/koushikdutta/async/AsyncSocket;

    invoke-interface {v2}, Lcom/koushikdutta/async/AsyncSocket;->close()V

    .line 430
    invoke-interface {v1, p1, v4}, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$HandshakeCallback;->onHandshakeCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/AsyncSSLSocket;)V

    .line 437
    :cond_23
    :goto_23
    return-void

    .line 434
    :cond_24
    invoke-virtual {p0}, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->getEndCallback()Lcom/koushikdutta/async/callback/CompletedCallback;

    move-result-object v0

    .line 435
    .local v0, "cb":Lcom/koushikdutta/async/callback/CompletedCallback;
    if-eqz v0, :cond_23

    .line 436
    invoke-interface {v0, p1}, Lcom/koushikdutta/async/callback/CompletedCallback;->onCompleted(Ljava/lang/Exception;)V

    goto :goto_23
.end method


# virtual methods
.method addToPending(Lcom/koushikdutta/async/ByteBufferList;Ljava/nio/ByteBuffer;)V
    .registers 4
    .param p1, "out"    # Lcom/koushikdutta/async/ByteBufferList;
    .param p2, "mReadTmp"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 246
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 247
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v0

    if-eqz v0, :cond_d

    .line 248
    invoke-virtual {p1, p2}, Lcom/koushikdutta/async/ByteBufferList;->add(Ljava/nio/ByteBuffer;)Lcom/koushikdutta/async/ByteBufferList;

    .line 253
    :goto_c
    return-void

    .line 251
    :cond_d
    invoke-static {p2}, Lcom/koushikdutta/async/ByteBufferList;->reclaim(Ljava/nio/ByteBuffer;)V

    goto :goto_c
.end method

.method calculateAlloc(I)I
    .registers 4
    .param p1, "remaining"    # I

    .prologue
    .line 358
    mul-int/lit8 v1, p1, 0x3

    div-int/lit8 v0, v1, 0x2

    .line 359
    .local v0, "alloc":I
    if-nez v0, :cond_8

    .line 360
    const/16 v0, 0x2000

    .line 361
    :cond_8
    return v0
.end method

.method public charset()Ljava/lang/String;
    .registers 2

    .prologue
    .line 523
    const/4 v0, 0x0

    return-object v0
.end method

.method public close()V
    .registers 2

    .prologue
    .line 461
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->mSocket:Lcom/koushikdutta/async/AsyncSocket;

    invoke-interface {v0}, Lcom/koushikdutta/async/AsyncSocket;->close()V

    .line 462
    return-void
.end method

.method public end()V
    .registers 2

    .prologue
    .line 258
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->mSocket:Lcom/koushikdutta/async/AsyncSocket;

    invoke-interface {v0}, Lcom/koushikdutta/async/AsyncSocket;->end()V

    .line 259
    return-void
.end method

.method public getClosedCallback()Lcom/koushikdutta/async/callback/CompletedCallback;
    .registers 2

    .prologue
    .line 471
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->mSocket:Lcom/koushikdutta/async/AsyncSocket;

    invoke-interface {v0}, Lcom/koushikdutta/async/AsyncSocket;->getClosedCallback()Lcom/koushikdutta/async/callback/CompletedCallback;

    move-result-object v0

    return-object v0
.end method

.method public getDataCallback()Lcom/koushikdutta/async/callback/DataCallback;
    .registers 2

    .prologue
    .line 446
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->mDataCallback:Lcom/koushikdutta/async/callback/DataCallback;

    return-object v0
.end method

.method public getDataEmitter()Lcom/koushikdutta/async/DataEmitter;
    .registers 2

    .prologue
    .line 513
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->mSocket:Lcom/koushikdutta/async/AsyncSocket;

    return-object v0
.end method

.method public getEndCallback()Lcom/koushikdutta/async/callback/CompletedCallback;
    .registers 2

    .prologue
    .line 482
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->mEndCallback:Lcom/koushikdutta/async/callback/CompletedCallback;

    return-object v0
.end method

.method public getHost()Ljava/lang/String;
    .registers 2

    .prologue
    .line 262
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->mHost:Ljava/lang/String;

    return-object v0
.end method

.method public getPeerCertificates()[Ljava/security/cert/X509Certificate;
    .registers 2

    .prologue
    .line 518
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->peerCertificates:[Ljava/security/cert/X509Certificate;

    return-object v0
.end method

.method public getPort()I
    .registers 2

    .prologue
    .line 266
    iget v0, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->mPort:I

    return v0
.end method

.method public getSSLEngine()Ljavax/net/ssl/SSLEngine;
    .registers 2

    .prologue
    .line 242
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->engine:Ljavax/net/ssl/SSLEngine;

    return-object v0
.end method

.method public getServer()Lcom/koushikdutta/async/AsyncServer;
    .registers 2

    .prologue
    .line 503
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->mSocket:Lcom/koushikdutta/async/AsyncSocket;

    invoke-interface {v0}, Lcom/koushikdutta/async/AsyncSocket;->getServer()Lcom/koushikdutta/async/AsyncServer;

    move-result-object v0

    return-object v0
.end method

.method public getSocket()Lcom/koushikdutta/async/AsyncSocket;
    .registers 2

    .prologue
    .line 508
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->mSocket:Lcom/koushikdutta/async/AsyncSocket;

    return-object v0
.end method

.method public getWriteableCallback()Lcom/koushikdutta/async/callback/WritableCallback;
    .registers 2

    .prologue
    .line 418
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->mWriteableCallback:Lcom/koushikdutta/async/callback/WritableCallback;

    return-object v0
.end method

.method public isChunked()Z
    .registers 2

    .prologue
    .line 451
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->mSocket:Lcom/koushikdutta/async/AsyncSocket;

    invoke-interface {v0}, Lcom/koushikdutta/async/AsyncSocket;->isChunked()Z

    move-result v0

    return v0
.end method

.method public isOpen()Z
    .registers 2

    .prologue
    .line 456
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->mSocket:Lcom/koushikdutta/async/AsyncSocket;

    invoke-interface {v0}, Lcom/koushikdutta/async/AsyncSocket;->isOpen()Z

    move-result v0

    return v0
.end method

.method public isPaused()Z
    .registers 2

    .prologue
    .line 498
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->mSocket:Lcom/koushikdutta/async/AsyncSocket;

    invoke-interface {v0}, Lcom/koushikdutta/async/AsyncSocket;->isPaused()Z

    move-result v0

    return v0
.end method

.method public onDataAvailable()V
    .registers 3

    .prologue
    .line 233
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->pending:Lcom/koushikdutta/async/ByteBufferList;

    invoke-static {p0, v0}, Lcom/koushikdutta/async/Util;->emitAllData(Lcom/koushikdutta/async/DataEmitter;Lcom/koushikdutta/async/ByteBufferList;)V

    .line 235
    iget-boolean v0, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->mEnded:Z

    if-eqz v0, :cond_1c

    iget-object v0, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->pending:Lcom/koushikdutta/async/ByteBufferList;

    invoke-virtual {v0}, Lcom/koushikdutta/async/ByteBufferList;->hasRemaining()Z

    move-result v0

    if-nez v0, :cond_1c

    iget-object v0, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->mEndCallback:Lcom/koushikdutta/async/callback/CompletedCallback;

    if-eqz v0, :cond_1c

    .line 236
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->mEndCallback:Lcom/koushikdutta/async/callback/CompletedCallback;

    iget-object v1, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->mEndException:Ljava/lang/Exception;

    invoke-interface {v0, v1}, Lcom/koushikdutta/async/callback/CompletedCallback;->onCompleted(Ljava/lang/Exception;)V

    .line 237
    :cond_1c
    return-void
.end method

.method public pause()V
    .registers 2

    .prologue
    .line 487
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->mSocket:Lcom/koushikdutta/async/AsyncSocket;

    invoke-interface {v0}, Lcom/koushikdutta/async/AsyncSocket;->pause()V

    .line 488
    return-void
.end method

.method public resume()V
    .registers 2

    .prologue
    .line 492
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->mSocket:Lcom/koushikdutta/async/AsyncSocket;

    invoke-interface {v0}, Lcom/koushikdutta/async/AsyncSocket;->resume()V

    .line 493
    invoke-virtual {p0}, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->onDataAvailable()V

    .line 494
    return-void
.end method

.method public setClosedCallback(Lcom/koushikdutta/async/callback/CompletedCallback;)V
    .registers 3
    .param p1, "handler"    # Lcom/koushikdutta/async/callback/CompletedCallback;

    .prologue
    .line 466
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->mSocket:Lcom/koushikdutta/async/AsyncSocket;

    invoke-interface {v0, p1}, Lcom/koushikdutta/async/AsyncSocket;->setClosedCallback(Lcom/koushikdutta/async/callback/CompletedCallback;)V

    .line 467
    return-void
.end method

.method public setDataCallback(Lcom/koushikdutta/async/callback/DataCallback;)V
    .registers 2
    .param p1, "callback"    # Lcom/koushikdutta/async/callback/DataCallback;

    .prologue
    .line 441
    iput-object p1, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->mDataCallback:Lcom/koushikdutta/async/callback/DataCallback;

    .line 442
    return-void
.end method

.method public setEndCallback(Lcom/koushikdutta/async/callback/CompletedCallback;)V
    .registers 2
    .param p1, "callback"    # Lcom/koushikdutta/async/callback/CompletedCallback;

    .prologue
    .line 477
    iput-object p1, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->mEndCallback:Lcom/koushikdutta/async/callback/CompletedCallback;

    .line 478
    return-void
.end method

.method public setWriteableCallback(Lcom/koushikdutta/async/callback/WritableCallback;)V
    .registers 2
    .param p1, "handler"    # Lcom/koushikdutta/async/callback/WritableCallback;

    .prologue
    .line 413
    iput-object p1, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->mWriteableCallback:Lcom/koushikdutta/async/callback/WritableCallback;

    .line 414
    return-void
.end method

.method public write(Lcom/koushikdutta/async/ByteBufferList;)V
    .registers 10
    .param p1, "bb"    # Lcom/koushikdutta/async/ByteBufferList;

    .prologue
    .line 367
    iget-boolean v6, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->mWrapping:Z

    if-eqz v6, :cond_5

    .line 409
    :cond_4
    :goto_4
    return-void

    .line 369
    :cond_5
    iget-object v6, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->mSink:Lcom/koushikdutta/async/BufferedDataSink;

    invoke-virtual {v6}, Lcom/koushikdutta/async/BufferedDataSink;->remaining()I

    move-result v6

    if-gtz v6, :cond_4

    .line 371
    const/4 v6, 0x1

    iput-boolean v6, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->mWrapping:Z

    .line 373
    const/4 v4, 0x0

    .line 374
    .local v4, "res":Ljavax/net/ssl/SSLEngineResult;
    invoke-virtual {p1}, Lcom/koushikdutta/async/ByteBufferList;->remaining()I

    move-result v6

    invoke-virtual {p0, v6}, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->calculateAlloc(I)I

    move-result v6

    invoke-static {v6}, Lcom/koushikdutta/async/ByteBufferList;->obtain(I)Ljava/nio/ByteBuffer;

    move-result-object v5

    .line 379
    .local v5, "writeBuf":Ljava/nio/ByteBuffer;
    :cond_1d
    iget-boolean v6, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->finishedHandshake:Z

    if-eqz v6, :cond_2e

    invoke-virtual {p1}, Lcom/koushikdutta/async/ByteBufferList;->remaining()I

    move-result v6

    if-nez v6, :cond_2e

    .line 407
    :cond_27
    :goto_27
    const/4 v6, 0x0

    iput-boolean v6, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->mWrapping:Z

    .line 408
    invoke-static {v5}, Lcom/koushikdutta/async/ByteBufferList;->reclaim(Ljava/nio/ByteBuffer;)V

    goto :goto_4

    .line 381
    :cond_2e
    invoke-virtual {p1}, Lcom/koushikdutta/async/ByteBufferList;->remaining()I

    move-result v3

    .line 383
    .local v3, "remaining":I
    :try_start_32
    invoke-virtual {p1}, Lcom/koushikdutta/async/ByteBufferList;->getAllArray()[Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 384
    .local v0, "arr":[Ljava/nio/ByteBuffer;
    iget-object v6, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v6, v0, v5}, Ljavax/net/ssl/SSLEngine;->wrap([Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)Ljavax/net/ssl/SSLEngineResult;

    move-result-object v4

    .line 385
    invoke-virtual {p1, v0}, Lcom/koushikdutta/async/ByteBufferList;->addAll([Ljava/nio/ByteBuffer;)Lcom/koushikdutta/async/ByteBufferList;

    .line 386
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 387
    iget-object v6, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->writeList:Lcom/koushikdutta/async/ByteBufferList;

    invoke-virtual {v6, v5}, Lcom/koushikdutta/async/ByteBufferList;->add(Ljava/nio/ByteBuffer;)Lcom/koushikdutta/async/ByteBufferList;

    .line 388
    sget-boolean v6, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->$assertionsDisabled:Z

    if-nez v6, :cond_76

    iget-object v6, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->writeList:Lcom/koushikdutta/async/ByteBufferList;

    invoke-virtual {v6}, Lcom/koushikdutta/async/ByteBufferList;->hasRemaining()Z

    move-result v6

    if-eqz v6, :cond_76

    new-instance v6, Ljava/lang/AssertionError;

    invoke-direct {v6}, Ljava/lang/AssertionError;-><init>()V

    throw v6
    :try_end_59
    .catch Ljavax/net/ssl/SSLException; {:try_start_32 .. :try_end_59} :catch_59

    .line 402
    .end local v0    # "arr":[Ljava/nio/ByteBuffer;
    :catch_59
    move-exception v1

    .line 403
    .local v1, "e":Ljavax/net/ssl/SSLException;
    invoke-direct {p0, v1}, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->report(Ljava/lang/Exception;)V

    .line 406
    .end local v1    # "e":Ljavax/net/ssl/SSLException;
    :goto_5d
    invoke-virtual {p1}, Lcom/koushikdutta/async/ByteBufferList;->remaining()I

    move-result v6

    if-ne v3, v6, :cond_6d

    if-eqz v4, :cond_27

    invoke-virtual {v4}, Ljavax/net/ssl/SSLEngineResult;->getHandshakeStatus()Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;

    move-result-object v6

    sget-object v7, Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;->NEED_WRAP:Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;

    if-ne v6, v7, :cond_27

    :cond_6d
    iget-object v6, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->mSink:Lcom/koushikdutta/async/BufferedDataSink;

    invoke-virtual {v6}, Lcom/koushikdutta/async/BufferedDataSink;->remaining()I

    move-result v6

    if-eqz v6, :cond_1d

    goto :goto_27

    .line 389
    .restart local v0    # "arr":[Ljava/nio/ByteBuffer;
    :cond_76
    :try_start_76
    iget-object v6, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->writeList:Lcom/koushikdutta/async/ByteBufferList;

    invoke-virtual {v6}, Lcom/koushikdutta/async/ByteBufferList;->remaining()I

    move-result v6

    if-lez v6, :cond_85

    .line 390
    iget-object v6, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->mSink:Lcom/koushikdutta/async/BufferedDataSink;

    iget-object v7, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->writeList:Lcom/koushikdutta/async/ByteBufferList;

    invoke-virtual {v6, v7}, Lcom/koushikdutta/async/BufferedDataSink;->write(Lcom/koushikdutta/async/ByteBufferList;)V

    .line 391
    :cond_85
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v2

    .line 392
    .local v2, "previousCapacity":I
    const/4 v5, 0x0

    .line 393
    invoke-virtual {v4}, Ljavax/net/ssl/SSLEngineResult;->getStatus()Ljavax/net/ssl/SSLEngineResult$Status;

    move-result-object v6

    sget-object v7, Ljavax/net/ssl/SSLEngineResult$Status;->BUFFER_OVERFLOW:Ljavax/net/ssl/SSLEngineResult$Status;

    if-ne v6, v7, :cond_9a

    .line 394
    mul-int/lit8 v6, v2, 0x2

    invoke-static {v6}, Lcom/koushikdutta/async/ByteBufferList;->obtain(I)Ljava/nio/ByteBuffer;

    move-result-object v5

    .line 395
    const/4 v3, -0x1

    goto :goto_5d

    .line 398
    :cond_9a
    invoke-virtual {p1}, Lcom/koushikdutta/async/ByteBufferList;->remaining()I

    move-result v6

    invoke-virtual {p0, v6}, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->calculateAlloc(I)I

    move-result v6

    invoke-static {v6}, Lcom/koushikdutta/async/ByteBufferList;->obtain(I)Ljava/nio/ByteBuffer;

    move-result-object v5

    .line 399
    invoke-virtual {v4}, Ljavax/net/ssl/SSLEngineResult;->getHandshakeStatus()Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->handleHandshakeStatus(Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;)V
    :try_end_ad
    .catch Ljavax/net/ssl/SSLException; {:try_start_76 .. :try_end_ad} :catch_59

    goto :goto_5d
.end method
