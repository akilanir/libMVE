.class public Lorg/spongycastle/crypto/tls/DTLSServerProtocol;
.super Lorg/spongycastle/crypto/tls/DTLSProtocol;
.source "DTLSServerProtocol.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;
    }
.end annotation


# instance fields
.field protected verifyRequests:Z


# direct methods
.method public constructor <init>(Ljava/security/SecureRandom;)V
    .registers 3
    .param p1, "secureRandom"    # Ljava/security/SecureRandom;

    .prologue
    .line 22
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/tls/DTLSProtocol;-><init>(Ljava/security/SecureRandom;)V

    .line 18
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/spongycastle/crypto/tls/DTLSServerProtocol;->verifyRequests:Z

    .line 23
    return-void
.end method


# virtual methods
.method public accept(Lorg/spongycastle/crypto/tls/TlsServer;Lorg/spongycastle/crypto/tls/DatagramTransport;)Lorg/spongycastle/crypto/tls/DTLSTransport;
    .registers 11
    .param p1, "server"    # Lorg/spongycastle/crypto/tls/TlsServer;
    .param p2, "transport"    # Lorg/spongycastle/crypto/tls/DatagramTransport;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v7, 0x50

    .line 38
    if-nez p1, :cond_c

    .line 40
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "\'server\' cannot be null"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 42
    :cond_c
    if-nez p2, :cond_16

    .line 44
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "\'transport\' cannot be null"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 47
    :cond_16
    new-instance v3, Lorg/spongycastle/crypto/tls/SecurityParameters;

    invoke-direct {v3}, Lorg/spongycastle/crypto/tls/SecurityParameters;-><init>()V

    .line 48
    .local v3, "securityParameters":Lorg/spongycastle/crypto/tls/SecurityParameters;
    const/4 v5, 0x0

    iput v5, v3, Lorg/spongycastle/crypto/tls/SecurityParameters;->entity:I

    .line 50
    new-instance v4, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;

    invoke-direct {v4}, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;-><init>()V

    .line 51
    .local v4, "state":Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;
    iput-object p1, v4, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->server:Lorg/spongycastle/crypto/tls/TlsServer;

    .line 52
    new-instance v5, Lorg/spongycastle/crypto/tls/TlsServerContextImpl;

    iget-object v6, p0, Lorg/spongycastle/crypto/tls/DTLSServerProtocol;->secureRandom:Ljava/security/SecureRandom;

    invoke-direct {v5, v6, v3}, Lorg/spongycastle/crypto/tls/TlsServerContextImpl;-><init>(Ljava/security/SecureRandom;Lorg/spongycastle/crypto/tls/SecurityParameters;)V

    iput-object v5, v4, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->serverContext:Lorg/spongycastle/crypto/tls/TlsServerContextImpl;

    .line 54
    invoke-interface {p1}, Lorg/spongycastle/crypto/tls/TlsServer;->shouldUseGMTUnixTime()Z

    move-result v5

    iget-object v6, v4, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->serverContext:Lorg/spongycastle/crypto/tls/TlsServerContextImpl;

    .line 55
    invoke-virtual {v6}, Lorg/spongycastle/crypto/tls/TlsServerContextImpl;->getNonceRandomGenerator()Lorg/spongycastle/crypto/prng/RandomGenerator;

    move-result-object v6

    .line 54
    invoke-static {v5, v6}, Lorg/spongycastle/crypto/tls/TlsProtocol;->createRandomBlock(ZLorg/spongycastle/crypto/prng/RandomGenerator;)[B

    move-result-object v5

    iput-object v5, v3, Lorg/spongycastle/crypto/tls/SecurityParameters;->serverRandom:[B

    .line 57
    iget-object v5, v4, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->serverContext:Lorg/spongycastle/crypto/tls/TlsServerContextImpl;

    invoke-interface {p1, v5}, Lorg/spongycastle/crypto/tls/TlsServer;->init(Lorg/spongycastle/crypto/tls/TlsServerContext;)V

    .line 59
    new-instance v2, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;

    iget-object v5, v4, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->serverContext:Lorg/spongycastle/crypto/tls/TlsServerContextImpl;

    const/16 v6, 0x16

    invoke-direct {v2, p2, v5, p1, v6}, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;-><init>(Lorg/spongycastle/crypto/tls/DatagramTransport;Lorg/spongycastle/crypto/tls/TlsContext;Lorg/spongycastle/crypto/tls/TlsPeer;S)V

    .line 65
    .local v2, "recordLayer":Lorg/spongycastle/crypto/tls/DTLSRecordLayer;
    :try_start_4c
    invoke-virtual {p0, v4, v2}, Lorg/spongycastle/crypto/tls/DTLSServerProtocol;->serverHandshake(Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;Lorg/spongycastle/crypto/tls/DTLSRecordLayer;)Lorg/spongycastle/crypto/tls/DTLSTransport;
    :try_end_4f
    .catch Lorg/spongycastle/crypto/tls/TlsFatalAlert; {:try_start_4c .. :try_end_4f} :catch_51
    .catch Ljava/io/IOException; {:try_start_4c .. :try_end_4f} :catch_5a
    .catch Ljava/lang/RuntimeException; {:try_start_4c .. :try_end_4f} :catch_5f

    move-result-object v5

    return-object v5

    .line 67
    :catch_51
    move-exception v1

    .line 69
    .local v1, "fatalAlert":Lorg/spongycastle/crypto/tls/TlsFatalAlert;
    invoke-virtual {v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;->getAlertDescription()S

    move-result v5

    invoke-virtual {v2, v5}, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->fail(S)V

    .line 70
    throw v1

    .line 72
    .end local v1    # "fatalAlert":Lorg/spongycastle/crypto/tls/TlsFatalAlert;
    :catch_5a
    move-exception v0

    .line 74
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v2, v7}, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->fail(S)V

    .line 75
    throw v0

    .line 77
    .end local v0    # "e":Ljava/io/IOException;
    :catch_5f
    move-exception v0

    .line 79
    .local v0, "e":Ljava/lang/RuntimeException;
    invoke-virtual {v2, v7}, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->fail(S)V

    .line 80
    new-instance v5, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    invoke-direct {v5, v7, v0}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(SLjava/lang/Throwable;)V

    throw v5
.end method

.method protected expectCertificateVerifyMessage(Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;)Z
    .registers 3
    .param p1, "state"    # Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;

    .prologue
    .line 687
    iget-short v0, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->clientCertificateType:S

    if-ltz v0, :cond_e

    iget-short v0, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->clientCertificateType:S

    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->hasSigningCapability(S)Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method protected generateCertificateRequest(Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;Lorg/spongycastle/crypto/tls/CertificateRequest;)[B
    .registers 5
    .param p1, "state"    # Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;
    .param p2, "certificateRequest"    # Lorg/spongycastle/crypto/tls/CertificateRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 284
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 285
    .local v0, "buf":Ljava/io/ByteArrayOutputStream;
    invoke-virtual {p2, v0}, Lorg/spongycastle/crypto/tls/CertificateRequest;->encode(Ljava/io/OutputStream;)V

    .line 286
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    return-object v1
.end method

.method protected generateCertificateStatus(Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;Lorg/spongycastle/crypto/tls/CertificateStatus;)[B
    .registers 5
    .param p1, "state"    # Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;
    .param p2, "certificateStatus"    # Lorg/spongycastle/crypto/tls/CertificateStatus;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 292
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 293
    .local v0, "buf":Ljava/io/ByteArrayOutputStream;
    invoke-virtual {p2, v0}, Lorg/spongycastle/crypto/tls/CertificateStatus;->encode(Ljava/io/OutputStream;)V

    .line 294
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    return-object v1
.end method

.method protected generateNewSessionTicket(Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;Lorg/spongycastle/crypto/tls/NewSessionTicket;)[B
    .registers 5
    .param p1, "state"    # Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;
    .param p2, "newSessionTicket"    # Lorg/spongycastle/crypto/tls/NewSessionTicket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 300
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 301
    .local v0, "buf":Ljava/io/ByteArrayOutputStream;
    invoke-virtual {p2, v0}, Lorg/spongycastle/crypto/tls/NewSessionTicket;->encode(Ljava/io/OutputStream;)V

    .line 302
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    return-object v1
.end method

.method protected generateServerHello(Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;)[B
    .registers 15
    .param p1, "state"    # Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x1

    const/4 v9, 0x0

    const/16 v12, 0x50

    .line 308
    iget-object v7, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->serverContext:Lorg/spongycastle/crypto/tls/TlsServerContextImpl;

    invoke-virtual {v7}, Lorg/spongycastle/crypto/tls/TlsServerContextImpl;->getSecurityParameters()Lorg/spongycastle/crypto/tls/SecurityParameters;

    move-result-object v3

    .line 310
    .local v3, "securityParameters":Lorg/spongycastle/crypto/tls/SecurityParameters;
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 313
    .local v0, "buf":Ljava/io/ByteArrayOutputStream;
    iget-object v7, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->server:Lorg/spongycastle/crypto/tls/TlsServer;

    invoke-interface {v7}, Lorg/spongycastle/crypto/tls/TlsServer;->getServerVersion()Lorg/spongycastle/crypto/tls/ProtocolVersion;

    move-result-object v6

    .line 314
    .local v6, "server_version":Lorg/spongycastle/crypto/tls/ProtocolVersion;
    iget-object v7, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->serverContext:Lorg/spongycastle/crypto/tls/TlsServerContextImpl;

    invoke-virtual {v7}, Lorg/spongycastle/crypto/tls/TlsServerContextImpl;->getClientVersion()Lorg/spongycastle/crypto/tls/ProtocolVersion;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->isEqualOrEarlierVersionOf(Lorg/spongycastle/crypto/tls/ProtocolVersion;)Z

    move-result v7

    if-nez v7, :cond_27

    .line 316
    new-instance v7, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    invoke-direct {v7, v12}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v7

    .line 323
    :cond_27
    iget-object v7, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->serverContext:Lorg/spongycastle/crypto/tls/TlsServerContextImpl;

    invoke-virtual {v7, v6}, Lorg/spongycastle/crypto/tls/TlsServerContextImpl;->setServerVersion(Lorg/spongycastle/crypto/tls/ProtocolVersion;)V

    .line 325
    iget-object v7, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->serverContext:Lorg/spongycastle/crypto/tls/TlsServerContextImpl;

    invoke-virtual {v7}, Lorg/spongycastle/crypto/tls/TlsServerContextImpl;->getServerVersion()Lorg/spongycastle/crypto/tls/ProtocolVersion;

    move-result-object v7

    invoke-static {v7, v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeVersion(Lorg/spongycastle/crypto/tls/ProtocolVersion;Ljava/io/OutputStream;)V

    .line 328
    invoke-virtual {v3}, Lorg/spongycastle/crypto/tls/SecurityParameters;->getServerRandom()[B

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 334
    sget-object v7, Lorg/spongycastle/crypto/tls/TlsUtils;->EMPTY_BYTES:[B

    invoke-static {v7, v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeOpaque8([BLjava/io/OutputStream;)V

    .line 336
    iget-object v7, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->server:Lorg/spongycastle/crypto/tls/TlsServer;

    invoke-interface {v7}, Lorg/spongycastle/crypto/tls/TlsServer;->getSelectedCipherSuite()I

    move-result v4

    .line 337
    .local v4, "selectedCipherSuite":I
    iget-object v7, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->offeredCipherSuites:[I

    invoke-static {v7, v4}, Lorg/spongycastle/util/Arrays;->contains([II)Z

    move-result v7

    if-eqz v7, :cond_63

    if-eqz v4, :cond_63

    .line 339
    invoke-static {v4}, Lorg/spongycastle/crypto/tls/CipherSuite;->isSCSV(I)Z

    move-result v7

    if-nez v7, :cond_63

    iget-object v7, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->serverContext:Lorg/spongycastle/crypto/tls/TlsServerContextImpl;

    .line 340
    invoke-virtual {v7}, Lorg/spongycastle/crypto/tls/TlsServerContextImpl;->getServerVersion()Lorg/spongycastle/crypto/tls/ProtocolVersion;

    move-result-object v7

    invoke-static {v4, v7}, Lorg/spongycastle/crypto/tls/TlsUtils;->isValidCipherSuiteForVersion(ILorg/spongycastle/crypto/tls/ProtocolVersion;)Z

    move-result v7

    if-nez v7, :cond_69

    .line 342
    :cond_63
    new-instance v7, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    invoke-direct {v7, v12}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v7

    .line 344
    :cond_69
    invoke-static {v4, v12}, Lorg/spongycastle/crypto/tls/DTLSServerProtocol;->validateSelectedCipherSuite(IS)V

    .line 345
    iput v4, v3, Lorg/spongycastle/crypto/tls/SecurityParameters;->cipherSuite:I

    .line 347
    iget-object v7, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->server:Lorg/spongycastle/crypto/tls/TlsServer;

    invoke-interface {v7}, Lorg/spongycastle/crypto/tls/TlsServer;->getSelectedCompressionMethod()S

    move-result v5

    .line 348
    .local v5, "selectedCompressionMethod":S
    iget-object v7, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->offeredCompressionMethods:[S

    invoke-static {v7, v5}, Lorg/spongycastle/util/Arrays;->contains([SS)Z

    move-result v7

    if-nez v7, :cond_82

    .line 350
    new-instance v7, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    invoke-direct {v7, v12}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v7

    .line 352
    :cond_82
    iput-short v5, v3, Lorg/spongycastle/crypto/tls/SecurityParameters;->compressionAlgorithm:S

    .line 354
    invoke-static {v4, v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint16(ILjava/io/OutputStream;)V

    .line 355
    invoke-static {v5, v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint8(SLjava/io/OutputStream;)V

    .line 357
    iget-object v7, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->server:Lorg/spongycastle/crypto/tls/TlsServer;

    invoke-interface {v7}, Lorg/spongycastle/crypto/tls/TlsServer;->getServerExtensions()Ljava/util/Hashtable;

    move-result-object v7

    iput-object v7, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->serverExtensions:Ljava/util/Hashtable;

    .line 362
    iget-boolean v7, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->secure_renegotiation:Z

    if-eqz v7, :cond_b8

    .line 364
    iget-object v7, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->serverExtensions:Ljava/util/Hashtable;

    sget-object v10, Lorg/spongycastle/crypto/tls/TlsProtocol;->EXT_RenegotiationInfo:Ljava/lang/Integer;

    invoke-static {v7, v10}, Lorg/spongycastle/crypto/tls/TlsUtils;->getExtensionData(Ljava/util/Hashtable;Ljava/lang/Integer;)[B

    move-result-object v2

    .line 365
    .local v2, "renegExtData":[B
    if-nez v2, :cond_124

    move v1, v8

    .line 367
    .local v1, "noRenegExt":Z
    :goto_a1
    if-eqz v1, :cond_b8

    .line 381
    iget-object v7, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->serverExtensions:Ljava/util/Hashtable;

    invoke-static {v7}, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->ensureExtensionsInitialised(Ljava/util/Hashtable;)Ljava/util/Hashtable;

    move-result-object v7

    iput-object v7, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->serverExtensions:Ljava/util/Hashtable;

    .line 382
    iget-object v7, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->serverExtensions:Ljava/util/Hashtable;

    sget-object v10, Lorg/spongycastle/crypto/tls/TlsProtocol;->EXT_RenegotiationInfo:Ljava/lang/Integer;

    sget-object v11, Lorg/spongycastle/crypto/tls/TlsUtils;->EMPTY_BYTES:[B

    .line 383
    invoke-static {v11}, Lorg/spongycastle/crypto/tls/TlsProtocol;->createRenegotiationInfo([B)[B

    move-result-object v11

    .line 382
    invoke-virtual {v7, v10, v11}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 387
    .end local v1    # "noRenegExt":Z
    .end local v2    # "renegExtData":[B
    :cond_b8
    iget-boolean v7, v3, Lorg/spongycastle/crypto/tls/SecurityParameters;->extendedMasterSecret:Z

    if-eqz v7, :cond_c9

    .line 389
    iget-object v7, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->serverExtensions:Ljava/util/Hashtable;

    invoke-static {v7}, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->ensureExtensionsInitialised(Ljava/util/Hashtable;)Ljava/util/Hashtable;

    move-result-object v7

    iput-object v7, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->serverExtensions:Ljava/util/Hashtable;

    .line 390
    iget-object v7, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->serverExtensions:Ljava/util/Hashtable;

    invoke-static {v7}, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->addExtendedMasterSecretExtension(Ljava/util/Hashtable;)V

    .line 399
    :cond_c9
    iget-object v7, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->serverExtensions:Ljava/util/Hashtable;

    if-eqz v7, :cond_10f

    .line 401
    iget-object v7, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->serverExtensions:Ljava/util/Hashtable;

    invoke-static {v7}, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->hasEncryptThenMACExtension(Ljava/util/Hashtable;)Z

    move-result v7

    iput-boolean v7, v3, Lorg/spongycastle/crypto/tls/SecurityParameters;->encryptThenMAC:Z

    .line 403
    iget-boolean v7, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->resumedSession:Z

    iget-object v10, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->clientExtensions:Ljava/util/Hashtable;

    iget-object v11, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->serverExtensions:Ljava/util/Hashtable;

    invoke-static {v7, v10, v11, v12}, Lorg/spongycastle/crypto/tls/DTLSServerProtocol;->evaluateMaxFragmentLengthExtension(ZLjava/util/Hashtable;Ljava/util/Hashtable;S)S

    move-result v7

    iput-short v7, v3, Lorg/spongycastle/crypto/tls/SecurityParameters;->maxFragmentLength:S

    .line 406
    iget-object v7, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->serverExtensions:Ljava/util/Hashtable;

    invoke-static {v7}, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->hasTruncatedHMacExtension(Ljava/util/Hashtable;)Z

    move-result v7

    iput-boolean v7, v3, Lorg/spongycastle/crypto/tls/SecurityParameters;->truncatedHMac:Z

    .line 412
    iget-boolean v7, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->resumedSession:Z

    if-nez v7, :cond_127

    iget-object v7, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->serverExtensions:Ljava/util/Hashtable;

    sget-object v10, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->EXT_status_request:Ljava/lang/Integer;

    .line 413
    invoke-static {v7, v10, v12}, Lorg/spongycastle/crypto/tls/TlsUtils;->hasExpectedEmptyExtensionData(Ljava/util/Hashtable;Ljava/lang/Integer;S)Z

    move-result v7

    if-eqz v7, :cond_127

    move v7, v8

    :goto_f8
    iput-boolean v7, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->allowCertificateStatus:Z

    .line 416
    iget-boolean v7, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->resumedSession:Z

    if-nez v7, :cond_129

    iget-object v7, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->serverExtensions:Ljava/util/Hashtable;

    sget-object v10, Lorg/spongycastle/crypto/tls/TlsProtocol;->EXT_SessionTicket:Ljava/lang/Integer;

    .line 417
    invoke-static {v7, v10, v12}, Lorg/spongycastle/crypto/tls/TlsUtils;->hasExpectedEmptyExtensionData(Ljava/util/Hashtable;Ljava/lang/Integer;S)Z

    move-result v7

    if-eqz v7, :cond_129

    :goto_108
    iput-boolean v8, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->expectSessionTicket:Z

    .line 420
    iget-object v7, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->serverExtensions:Ljava/util/Hashtable;

    invoke-static {v0, v7}, Lorg/spongycastle/crypto/tls/TlsProtocol;->writeExtensions(Ljava/io/OutputStream;Ljava/util/Hashtable;)V

    .line 423
    :cond_10f
    iget-object v7, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->serverContext:Lorg/spongycastle/crypto/tls/TlsServerContextImpl;

    .line 424
    invoke-virtual {v3}, Lorg/spongycastle/crypto/tls/SecurityParameters;->getCipherSuite()I

    move-result v8

    .line 423
    invoke-static {v7, v8}, Lorg/spongycastle/crypto/tls/TlsProtocol;->getPRFAlgorithm(Lorg/spongycastle/crypto/tls/TlsContext;I)I

    move-result v7

    iput v7, v3, Lorg/spongycastle/crypto/tls/SecurityParameters;->prfAlgorithm:I

    .line 430
    const/16 v7, 0xc

    iput v7, v3, Lorg/spongycastle/crypto/tls/SecurityParameters;->verifyDataLength:I

    .line 432
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v7

    return-object v7

    .restart local v2    # "renegExtData":[B
    :cond_124
    move v1, v9

    .line 365
    goto/16 :goto_a1

    .end local v2    # "renegExtData":[B
    :cond_127
    move v7, v9

    .line 413
    goto :goto_f8

    :cond_129
    move v8, v9

    .line 417
    goto :goto_108
.end method

.method public getVerifyRequests()Z
    .registers 2

    .prologue
    .line 27
    iget-boolean v0, p0, Lorg/spongycastle/crypto/tls/DTLSServerProtocol;->verifyRequests:Z

    return v0
.end method

.method protected notifyClientCertificate(Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;Lorg/spongycastle/crypto/tls/Certificate;)V
    .registers 5
    .param p1, "state"    # Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;
    .param p2, "clientCertificate"    # Lorg/spongycastle/crypto/tls/Certificate;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 438
    iget-object v0, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->certificateRequest:Lorg/spongycastle/crypto/tls/CertificateRequest;

    if-nez v0, :cond_a

    .line 440
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 443
    :cond_a
    iget-object v0, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->clientCertificate:Lorg/spongycastle/crypto/tls/Certificate;

    if-eqz v0, :cond_16

    .line 445
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v0

    .line 448
    :cond_16
    iput-object p2, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->clientCertificate:Lorg/spongycastle/crypto/tls/Certificate;

    .line 450
    invoke-virtual {p2}, Lorg/spongycastle/crypto/tls/Certificate;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_29

    .line 452
    iget-object v0, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->keyExchange:Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    invoke-interface {v0}, Lorg/spongycastle/crypto/tls/TlsKeyExchange;->skipClientCredentials()V

    .line 477
    :goto_23
    iget-object v0, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->server:Lorg/spongycastle/crypto/tls/TlsServer;

    invoke-interface {v0, p2}, Lorg/spongycastle/crypto/tls/TlsServer;->notifyClientCertificate(Lorg/spongycastle/crypto/tls/Certificate;)V

    .line 478
    return-void

    .line 463
    :cond_29
    iget-object v0, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->serverCredentials:Lorg/spongycastle/crypto/tls/TlsCredentials;

    .line 464
    invoke-interface {v0}, Lorg/spongycastle/crypto/tls/TlsCredentials;->getCertificate()Lorg/spongycastle/crypto/tls/Certificate;

    move-result-object v0

    .line 463
    invoke-static {p2, v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->getClientCertificateType(Lorg/spongycastle/crypto/tls/Certificate;Lorg/spongycastle/crypto/tls/Certificate;)S

    move-result v0

    iput-short v0, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->clientCertificateType:S

    .line 466
    iget-object v0, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->keyExchange:Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    invoke-interface {v0, p2}, Lorg/spongycastle/crypto/tls/TlsKeyExchange;->processClientCertificate(Lorg/spongycastle/crypto/tls/Certificate;)V

    goto :goto_23
.end method

.method protected processCertificateVerify(Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;[BLorg/spongycastle/crypto/tls/TlsHandshakeHash;)V
    .registers 16
    .param p1, "state"    # Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;
    .param p2, "body"    # [B
    .param p3, "prepareFinishHash"    # Lorg/spongycastle/crypto/tls/TlsHandshakeHash;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 495
    iget-object v10, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->certificateRequest:Lorg/spongycastle/crypto/tls/CertificateRequest;

    if-nez v10, :cond_a

    .line 497
    new-instance v10, Ljava/lang/IllegalStateException;

    invoke-direct {v10}, Ljava/lang/IllegalStateException;-><init>()V

    throw v10

    .line 500
    :cond_a
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 502
    .local v0, "buf":Ljava/io/ByteArrayInputStream;
    iget-object v2, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->serverContext:Lorg/spongycastle/crypto/tls/TlsServerContextImpl;

    .line 503
    .local v2, "context":Lorg/spongycastle/crypto/tls/TlsServerContextImpl;
    invoke-static {v2, v0}, Lorg/spongycastle/crypto/tls/DigitallySigned;->parse(Lorg/spongycastle/crypto/tls/TlsContext;Ljava/io/InputStream;)Lorg/spongycastle/crypto/tls/DigitallySigned;

    move-result-object v1

    .line 505
    .local v1, "clientCertificateVerify":Lorg/spongycastle/crypto/tls/DigitallySigned;
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsProtocol;->assertEmpty(Ljava/io/ByteArrayInputStream;)V

    .line 510
    :try_start_18
    invoke-virtual {v1}, Lorg/spongycastle/crypto/tls/DigitallySigned;->getAlgorithm()Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;

    move-result-object v7

    .line 513
    .local v7, "signatureAlgorithm":Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;
    invoke-static {v2}, Lorg/spongycastle/crypto/tls/TlsUtils;->isTLSv12(Lorg/spongycastle/crypto/tls/TlsContext;)Z

    move-result v10

    if-eqz v10, :cond_5f

    .line 515
    iget-object v10, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->certificateRequest:Lorg/spongycastle/crypto/tls/CertificateRequest;

    invoke-virtual {v10}, Lorg/spongycastle/crypto/tls/CertificateRequest;->getSupportedSignatureAlgorithms()Ljava/util/Vector;

    move-result-object v10

    invoke-static {v10, v7}, Lorg/spongycastle/crypto/tls/TlsUtils;->verifySupportedSignatureAlgorithm(Ljava/util/Vector;Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;)V

    .line 516
    invoke-virtual {v7}, Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;->getHash()S

    move-result v10

    invoke-interface {p3, v10}, Lorg/spongycastle/crypto/tls/TlsHandshakeHash;->getFinalHash(S)[B

    move-result-object v4

    .line 523
    .local v4, "hash":[B
    :goto_33
    iget-object v10, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->clientCertificate:Lorg/spongycastle/crypto/tls/Certificate;

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Lorg/spongycastle/crypto/tls/Certificate;->getCertificateAt(I)Lorg/spongycastle/asn1/x509/Certificate;

    move-result-object v9

    .line 524
    .local v9, "x509Cert":Lorg/spongycastle/asn1/x509/Certificate;
    invoke-virtual {v9}, Lorg/spongycastle/asn1/x509/Certificate;->getSubjectPublicKeyInfo()Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;

    move-result-object v5

    .line 525
    .local v5, "keyInfo":Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;
    invoke-static {v5}, Lorg/spongycastle/crypto/util/PublicKeyFactory;->createKey(Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;)Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    move-result-object v6

    .line 527
    .local v6, "publicKey":Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;
    iget-short v10, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->clientCertificateType:S

    invoke-static {v10}, Lorg/spongycastle/crypto/tls/TlsUtils;->createTlsSigner(S)Lorg/spongycastle/crypto/tls/TlsSigner;

    move-result-object v8

    .line 528
    .local v8, "tlsSigner":Lorg/spongycastle/crypto/tls/TlsSigner;
    invoke-interface {v8, v2}, Lorg/spongycastle/crypto/tls/TlsSigner;->init(Lorg/spongycastle/crypto/tls/TlsContext;)V

    .line 529
    invoke-virtual {v1}, Lorg/spongycastle/crypto/tls/DigitallySigned;->getSignature()[B

    move-result-object v10

    invoke-interface {v8, v7, v10, v6, v4}, Lorg/spongycastle/crypto/tls/TlsSigner;->verifyRawSignature(Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;[BLorg/spongycastle/crypto/params/AsymmetricKeyParameter;[B)Z

    move-result v10

    if-nez v10, :cond_71

    .line 531
    new-instance v10, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v11, 0x33

    invoke-direct {v10, v11}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v10
    :try_end_5d
    .catch Lorg/spongycastle/crypto/tls/TlsFatalAlert; {:try_start_18 .. :try_end_5d} :catch_5d
    .catch Ljava/lang/Exception; {:try_start_18 .. :try_end_5d} :catch_68

    .line 534
    .end local v4    # "hash":[B
    .end local v5    # "keyInfo":Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;
    .end local v6    # "publicKey":Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;
    .end local v7    # "signatureAlgorithm":Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;
    .end local v8    # "tlsSigner":Lorg/spongycastle/crypto/tls/TlsSigner;
    .end local v9    # "x509Cert":Lorg/spongycastle/asn1/x509/Certificate;
    :catch_5d
    move-exception v3

    .line 536
    .local v3, "e":Lorg/spongycastle/crypto/tls/TlsFatalAlert;
    throw v3

    .line 520
    .end local v3    # "e":Lorg/spongycastle/crypto/tls/TlsFatalAlert;
    .restart local v7    # "signatureAlgorithm":Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;
    :cond_5f
    :try_start_5f
    invoke-virtual {v2}, Lorg/spongycastle/crypto/tls/TlsServerContextImpl;->getSecurityParameters()Lorg/spongycastle/crypto/tls/SecurityParameters;

    move-result-object v10

    invoke-virtual {v10}, Lorg/spongycastle/crypto/tls/SecurityParameters;->getSessionHash()[B
    :try_end_66
    .catch Lorg/spongycastle/crypto/tls/TlsFatalAlert; {:try_start_5f .. :try_end_66} :catch_5d
    .catch Ljava/lang/Exception; {:try_start_5f .. :try_end_66} :catch_68

    move-result-object v4

    .restart local v4    # "hash":[B
    goto :goto_33

    .line 538
    .end local v4    # "hash":[B
    .end local v7    # "signatureAlgorithm":Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;
    :catch_68
    move-exception v3

    .line 540
    .local v3, "e":Ljava/lang/Exception;
    new-instance v10, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v11, 0x33

    invoke-direct {v10, v11, v3}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(SLjava/lang/Throwable;)V

    throw v10

    .line 542
    .end local v3    # "e":Ljava/lang/Exception;
    .restart local v4    # "hash":[B
    .restart local v5    # "keyInfo":Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;
    .restart local v6    # "publicKey":Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;
    .restart local v7    # "signatureAlgorithm":Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;
    .restart local v8    # "tlsSigner":Lorg/spongycastle/crypto/tls/TlsSigner;
    .restart local v9    # "x509Cert":Lorg/spongycastle/asn1/x509/Certificate;
    :cond_71
    return-void
.end method

.method protected processClientCertificate(Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;[B)V
    .registers 5
    .param p1, "state"    # Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;
    .param p2, "body"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 483
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 485
    .local v0, "buf":Ljava/io/ByteArrayInputStream;
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/Certificate;->parse(Ljava/io/InputStream;)Lorg/spongycastle/crypto/tls/Certificate;

    move-result-object v1

    .line 487
    .local v1, "clientCertificate":Lorg/spongycastle/crypto/tls/Certificate;
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsProtocol;->assertEmpty(Ljava/io/ByteArrayInputStream;)V

    .line 489
    invoke-virtual {p0, p1, v1}, Lorg/spongycastle/crypto/tls/DTLSServerProtocol;->notifyClientCertificate(Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;Lorg/spongycastle/crypto/tls/Certificate;)V

    .line 490
    return-void
.end method

.method protected processClientHello(Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;[B)V
    .registers 16
    .param p1, "state"    # Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;
    .param p2, "body"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 547
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 550
    .local v0, "buf":Ljava/io/ByteArrayInputStream;
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->readVersion(Ljava/io/InputStream;)Lorg/spongycastle/crypto/tls/ProtocolVersion;

    move-result-object v3

    .line 551
    .local v3, "client_version":Lorg/spongycastle/crypto/tls/ProtocolVersion;
    invoke-virtual {v3}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->isDTLS()Z

    move-result v10

    if-nez v10, :cond_17

    .line 553
    new-instance v10, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v11, 0x2f

    invoke-direct {v10, v11}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v10

    .line 559
    :cond_17
    const/16 v10, 0x20

    invoke-static {v10, v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->readFully(ILjava/io/InputStream;)[B

    move-result-object v2

    .line 561
    .local v2, "client_random":[B
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->readOpaque8(Ljava/io/InputStream;)[B

    move-result-object v9

    .line 562
    .local v9, "sessionID":[B
    array-length v10, v9

    const/16 v11, 0x20

    if-le v10, v11, :cond_2e

    .line 564
    new-instance v10, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v11, 0x2f

    invoke-direct {v10, v11}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v10

    .line 568
    :cond_2e
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->readOpaque8(Ljava/io/InputStream;)[B

    move-result-object v6

    .line 570
    .local v6, "cookie":[B
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint16(Ljava/io/InputStream;)I

    move-result v1

    .line 571
    .local v1, "cipher_suites_length":I
    const/4 v10, 0x2

    if-lt v1, v10, :cond_3d

    and-int/lit8 v10, v1, 0x1

    if-eqz v10, :cond_45

    .line 573
    :cond_3d
    new-instance v10, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v11, 0x32

    invoke-direct {v10, v11}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v10

    .line 580
    :cond_45
    div-int/lit8 v10, v1, 0x2

    invoke-static {v10, v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint16Array(ILjava/io/InputStream;)[I

    move-result-object v10

    iput-object v10, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->offeredCipherSuites:[I

    .line 582
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint8(Ljava/io/InputStream;)S

    move-result v4

    .line 583
    .local v4, "compression_methods_length":I
    const/4 v10, 0x1

    if-ge v4, v10, :cond_5c

    .line 585
    new-instance v10, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v11, 0x2f

    invoke-direct {v10, v11}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v10

    .line 588
    :cond_5c
    invoke-static {v4, v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint8Array(ILjava/io/InputStream;)[S

    move-result-object v10

    iput-object v10, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->offeredCompressionMethods:[S

    .line 595
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsProtocol;->readExtensions(Ljava/io/ByteArrayInputStream;)Ljava/util/Hashtable;

    move-result-object v10

    iput-object v10, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->clientExtensions:Ljava/util/Hashtable;

    .line 597
    iget-object v5, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->serverContext:Lorg/spongycastle/crypto/tls/TlsServerContextImpl;

    .line 598
    .local v5, "context":Lorg/spongycastle/crypto/tls/TlsServerContextImpl;
    invoke-virtual {v5}, Lorg/spongycastle/crypto/tls/TlsServerContextImpl;->getSecurityParameters()Lorg/spongycastle/crypto/tls/SecurityParameters;

    move-result-object v8

    .line 606
    .local v8, "securityParameters":Lorg/spongycastle/crypto/tls/SecurityParameters;
    iget-object v10, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->clientExtensions:Ljava/util/Hashtable;

    invoke-static {v10}, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->hasExtendedMasterSecretExtension(Ljava/util/Hashtable;)Z

    move-result v10

    iput-boolean v10, v8, Lorg/spongycastle/crypto/tls/SecurityParameters;->extendedMasterSecret:Z

    .line 608
    invoke-virtual {v5, v3}, Lorg/spongycastle/crypto/tls/TlsServerContextImpl;->setClientVersion(Lorg/spongycastle/crypto/tls/ProtocolVersion;)V

    .line 610
    iget-object v10, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->server:Lorg/spongycastle/crypto/tls/TlsServer;

    invoke-interface {v10, v3}, Lorg/spongycastle/crypto/tls/TlsServer;->notifyClientVersion(Lorg/spongycastle/crypto/tls/ProtocolVersion;)V

    .line 611
    iget-object v10, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->server:Lorg/spongycastle/crypto/tls/TlsServer;

    iget-object v11, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->offeredCipherSuites:[I

    const/16 v12, 0x5600

    invoke-static {v11, v12}, Lorg/spongycastle/util/Arrays;->contains([II)Z

    move-result v11

    invoke-interface {v10, v11}, Lorg/spongycastle/crypto/tls/TlsServer;->notifyFallback(Z)V

    .line 613
    iput-object v2, v8, Lorg/spongycastle/crypto/tls/SecurityParameters;->clientRandom:[B

    .line 615
    iget-object v10, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->server:Lorg/spongycastle/crypto/tls/TlsServer;

    iget-object v11, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->offeredCipherSuites:[I

    invoke-interface {v10, v11}, Lorg/spongycastle/crypto/tls/TlsServer;->notifyOfferedCipherSuites([I)V

    .line 616
    iget-object v10, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->server:Lorg/spongycastle/crypto/tls/TlsServer;

    iget-object v11, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->offeredCompressionMethods:[S

    invoke-interface {v10, v11}, Lorg/spongycastle/crypto/tls/TlsServer;->notifyOfferedCompressionMethods([S)V

    .line 633
    iget-object v10, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->offeredCipherSuites:[I

    const/16 v11, 0xff

    invoke-static {v10, v11}, Lorg/spongycastle/util/Arrays;->contains([II)Z

    move-result v10

    if-eqz v10, :cond_a8

    .line 635
    const/4 v10, 0x1

    iput-boolean v10, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->secure_renegotiation:Z

    .line 642
    :cond_a8
    iget-object v10, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->clientExtensions:Ljava/util/Hashtable;

    sget-object v11, Lorg/spongycastle/crypto/tls/TlsProtocol;->EXT_RenegotiationInfo:Ljava/lang/Integer;

    invoke-static {v10, v11}, Lorg/spongycastle/crypto/tls/TlsUtils;->getExtensionData(Ljava/util/Hashtable;Ljava/lang/Integer;)[B

    move-result-object v7

    .line 643
    .local v7, "renegExtData":[B
    if-eqz v7, :cond_c9

    .line 650
    const/4 v10, 0x1

    iput-boolean v10, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->secure_renegotiation:Z

    .line 652
    sget-object v10, Lorg/spongycastle/crypto/tls/TlsUtils;->EMPTY_BYTES:[B

    invoke-static {v10}, Lorg/spongycastle/crypto/tls/TlsProtocol;->createRenegotiationInfo([B)[B

    move-result-object v10

    invoke-static {v7, v10}, Lorg/spongycastle/util/Arrays;->constantTimeAreEqual([B[B)Z

    move-result v10

    if-nez v10, :cond_c9

    .line 654
    new-instance v10, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v11, 0x28

    invoke-direct {v10, v11}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v10

    .line 659
    :cond_c9
    iget-object v10, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->server:Lorg/spongycastle/crypto/tls/TlsServer;

    iget-boolean v11, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->secure_renegotiation:Z

    invoke-interface {v10, v11}, Lorg/spongycastle/crypto/tls/TlsServer;->notifySecureRenegotiation(Z)V

    .line 661
    iget-object v10, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->clientExtensions:Ljava/util/Hashtable;

    if-eqz v10, :cond_db

    .line 663
    iget-object v10, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->server:Lorg/spongycastle/crypto/tls/TlsServer;

    iget-object v11, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->clientExtensions:Ljava/util/Hashtable;

    invoke-interface {v10, v11}, Lorg/spongycastle/crypto/tls/TlsServer;->processClientExtensions(Ljava/util/Hashtable;)V

    .line 665
    :cond_db
    return-void
.end method

.method protected processClientKeyExchange(Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;[B)V
    .registers 5
    .param p1, "state"    # Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;
    .param p2, "body"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 670
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 672
    .local v0, "buf":Ljava/io/ByteArrayInputStream;
    iget-object v1, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->keyExchange:Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    invoke-interface {v1, v0}, Lorg/spongycastle/crypto/tls/TlsKeyExchange;->processClientKeyExchange(Ljava/io/InputStream;)V

    .line 674
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsProtocol;->assertEmpty(Ljava/io/ByteArrayInputStream;)V

    .line 675
    return-void
.end method

.method protected processClientSupplementalData(Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;[B)V
    .registers 6
    .param p1, "state"    # Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;
    .param p2, "body"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 680
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 681
    .local v0, "buf":Ljava/io/ByteArrayInputStream;
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsProtocol;->readSupplementalDataMessage(Ljava/io/ByteArrayInputStream;)Ljava/util/Vector;

    move-result-object v1

    .line 682
    .local v1, "clientSupplementalData":Ljava/util/Vector;
    iget-object v2, p1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->server:Lorg/spongycastle/crypto/tls/TlsServer;

    invoke-interface {v2, v1}, Lorg/spongycastle/crypto/tls/TlsServer;->processClientSupplementalData(Ljava/util/Vector;)V

    .line 683
    return-void
.end method

.method protected serverHandshake(Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;Lorg/spongycastle/crypto/tls/DTLSRecordLayer;)Lorg/spongycastle/crypto/tls/DTLSTransport;
    .registers 30
    .param p1, "state"    # Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;
    .param p2, "recordLayer"    # Lorg/spongycastle/crypto/tls/DTLSRecordLayer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 87
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->serverContext:Lorg/spongycastle/crypto/tls/TlsServerContextImpl;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lorg/spongycastle/crypto/tls/TlsServerContextImpl;->getSecurityParameters()Lorg/spongycastle/crypto/tls/SecurityParameters;

    move-result-object v15

    .line 88
    .local v15, "securityParameters":Lorg/spongycastle/crypto/tls/SecurityParameters;
    new-instance v10, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;

    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->serverContext:Lorg/spongycastle/crypto/tls/TlsServerContextImpl;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    move-object/from16 v1, p2

    invoke-direct {v10, v0, v1}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;-><init>(Lorg/spongycastle/crypto/tls/TlsContext;Lorg/spongycastle/crypto/tls/DTLSRecordLayer;)V

    .line 90
    .local v10, "handshake":Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;
    invoke-virtual {v10}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->receiveMessage()Lorg/spongycastle/crypto/tls/DTLSReliableHandshake$Message;

    move-result-object v8

    .line 95
    .local v8, "clientMessage":Lorg/spongycastle/crypto/tls/DTLSReliableHandshake$Message;
    invoke-virtual {v8}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake$Message;->getType()S

    move-result v22

    const/16 v23, 0x1

    move/from16 v0, v22

    move/from16 v1, v23

    if-ne v0, v1, :cond_14e

    .line 97
    invoke-virtual {v8}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake$Message;->getBody()[B

    move-result-object v22

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Lorg/spongycastle/crypto/tls/DTLSServerProtocol;->processClientHello(Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;[B)V

    .line 105
    invoke-virtual/range {p0 .. p1}, Lorg/spongycastle/crypto/tls/DTLSServerProtocol;->generateServerHello(Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;)[B

    move-result-object v17

    .line 107
    .local v17, "serverHelloBody":[B
    iget-short v0, v15, Lorg/spongycastle/crypto/tls/SecurityParameters;->maxFragmentLength:S

    move/from16 v22, v0

    move-object/from16 v0, p2

    move/from16 v1, v22

    invoke-static {v0, v1}, Lorg/spongycastle/crypto/tls/DTLSServerProtocol;->applyMaxFragmentLengthExtension(Lorg/spongycastle/crypto/tls/DTLSRecordLayer;S)V

    .line 109
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->serverContext:Lorg/spongycastle/crypto/tls/TlsServerContextImpl;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lorg/spongycastle/crypto/tls/TlsServerContextImpl;->getServerVersion()Lorg/spongycastle/crypto/tls/ProtocolVersion;

    move-result-object v14

    .line 110
    .local v14, "recordLayerVersion":Lorg/spongycastle/crypto/tls/ProtocolVersion;
    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->setReadVersion(Lorg/spongycastle/crypto/tls/ProtocolVersion;)V

    .line 111
    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->setWriteVersion(Lorg/spongycastle/crypto/tls/ProtocolVersion;)V

    .line 113
    const/16 v22, 0x2

    move/from16 v0, v22

    move-object/from16 v1, v17

    invoke-virtual {v10, v0, v1}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->sendMessage(S[B)V

    .line 116
    invoke-virtual {v10}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->notifyHelloComplete()V

    .line 118
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->server:Lorg/spongycastle/crypto/tls/TlsServer;

    move-object/from16 v22, v0

    invoke-interface/range {v22 .. v22}, Lorg/spongycastle/crypto/tls/TlsServer;->getServerSupplementalData()Ljava/util/Vector;

    move-result-object v19

    .line 119
    .local v19, "serverSupplementalData":Ljava/util/Vector;
    if-eqz v19, :cond_7e

    .line 121
    invoke-static/range {v19 .. v19}, Lorg/spongycastle/crypto/tls/DTLSServerProtocol;->generateSupplementalData(Ljava/util/Vector;)[B

    move-result-object v21

    .line 122
    .local v21, "supplementalDataBody":[B
    const/16 v22, 0x17

    move/from16 v0, v22

    move-object/from16 v1, v21

    invoke-virtual {v10, v0, v1}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->sendMessage(S[B)V

    .line 125
    .end local v21    # "supplementalDataBody":[B
    :cond_7e
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->server:Lorg/spongycastle/crypto/tls/TlsServer;

    move-object/from16 v22, v0

    invoke-interface/range {v22 .. v22}, Lorg/spongycastle/crypto/tls/TlsServer;->getKeyExchange()Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, p1

    iput-object v0, v1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->keyExchange:Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    .line 126
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->keyExchange:Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    move-object/from16 v22, v0

    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->serverContext:Lorg/spongycastle/crypto/tls/TlsServerContextImpl;

    move-object/from16 v23, v0

    invoke-interface/range {v22 .. v23}, Lorg/spongycastle/crypto/tls/TlsKeyExchange;->init(Lorg/spongycastle/crypto/tls/TlsContext;)V

    .line 128
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->server:Lorg/spongycastle/crypto/tls/TlsServer;

    move-object/from16 v22, v0

    invoke-interface/range {v22 .. v22}, Lorg/spongycastle/crypto/tls/TlsServer;->getCredentials()Lorg/spongycastle/crypto/tls/TlsCredentials;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, p1

    iput-object v0, v1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->serverCredentials:Lorg/spongycastle/crypto/tls/TlsCredentials;

    .line 130
    const/16 v16, 0x0

    .line 132
    .local v16, "serverCertificate":Lorg/spongycastle/crypto/tls/Certificate;
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->serverCredentials:Lorg/spongycastle/crypto/tls/TlsCredentials;

    move-object/from16 v22, v0

    if-nez v22, :cond_156

    .line 134
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->keyExchange:Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    move-object/from16 v22, v0

    invoke-interface/range {v22 .. v22}, Lorg/spongycastle/crypto/tls/TlsKeyExchange;->skipServerCredentials()V

    .line 146
    :goto_c0
    if-eqz v16, :cond_c8

    invoke-virtual/range {v16 .. v16}, Lorg/spongycastle/crypto/tls/Certificate;->isEmpty()Z

    move-result v22

    if-eqz v22, :cond_d0

    .line 148
    :cond_c8
    const/16 v22, 0x0

    move/from16 v0, v22

    move-object/from16 v1, p1

    iput-boolean v0, v1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->allowCertificateStatus:Z

    .line 151
    :cond_d0
    move-object/from16 v0, p1

    iget-boolean v0, v0, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->allowCertificateStatus:Z

    move/from16 v22, v0

    if-eqz v22, :cond_f3

    .line 153
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->server:Lorg/spongycastle/crypto/tls/TlsServer;

    move-object/from16 v22, v0

    invoke-interface/range {v22 .. v22}, Lorg/spongycastle/crypto/tls/TlsServer;->getCertificateStatus()Lorg/spongycastle/crypto/tls/CertificateStatus;

    move-result-object v5

    .line 154
    .local v5, "certificateStatus":Lorg/spongycastle/crypto/tls/CertificateStatus;
    if-eqz v5, :cond_f3

    .line 156
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v5}, Lorg/spongycastle/crypto/tls/DTLSServerProtocol;->generateCertificateStatus(Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;Lorg/spongycastle/crypto/tls/CertificateStatus;)[B

    move-result-object v6

    .line 157
    .local v6, "certificateStatusBody":[B
    const/16 v22, 0x16

    move/from16 v0, v22

    invoke-virtual {v10, v0, v6}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->sendMessage(S[B)V

    .line 161
    .end local v5    # "certificateStatus":Lorg/spongycastle/crypto/tls/CertificateStatus;
    .end local v6    # "certificateStatusBody":[B
    :cond_f3
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->keyExchange:Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    move-object/from16 v22, v0

    invoke-interface/range {v22 .. v22}, Lorg/spongycastle/crypto/tls/TlsKeyExchange;->generateServerKeyExchange()[B

    move-result-object v18

    .line 162
    .local v18, "serverKeyExchange":[B
    if-eqz v18, :cond_108

    .line 164
    const/16 v22, 0xc

    move/from16 v0, v22

    move-object/from16 v1, v18

    invoke-virtual {v10, v0, v1}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->sendMessage(S[B)V

    .line 167
    :cond_108
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->serverCredentials:Lorg/spongycastle/crypto/tls/TlsCredentials;

    move-object/from16 v22, v0

    if-eqz v22, :cond_1b6

    .line 169
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->server:Lorg/spongycastle/crypto/tls/TlsServer;

    move-object/from16 v22, v0

    invoke-interface/range {v22 .. v22}, Lorg/spongycastle/crypto/tls/TlsServer;->getCertificateRequest()Lorg/spongycastle/crypto/tls/CertificateRequest;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, p1

    iput-object v0, v1, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->certificateRequest:Lorg/spongycastle/crypto/tls/CertificateRequest;

    .line 170
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->certificateRequest:Lorg/spongycastle/crypto/tls/CertificateRequest;

    move-object/from16 v22, v0

    if-eqz v22, :cond_1b6

    .line 172
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->serverContext:Lorg/spongycastle/crypto/tls/TlsServerContextImpl;

    move-object/from16 v22, v0

    invoke-static/range {v22 .. v22}, Lorg/spongycastle/crypto/tls/TlsUtils;->isTLSv12(Lorg/spongycastle/crypto/tls/TlsContext;)Z

    move-result v23

    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->certificateRequest:Lorg/spongycastle/crypto/tls/CertificateRequest;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lorg/spongycastle/crypto/tls/CertificateRequest;->getSupportedSignatureAlgorithms()Ljava/util/Vector;

    move-result-object v22

    if-eqz v22, :cond_17c

    const/16 v22, 0x1

    :goto_140
    move/from16 v0, v23

    move/from16 v1, v22

    if-eq v0, v1, :cond_17f

    .line 174
    new-instance v22, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v23, 0x50

    invoke-direct/range {v22 .. v23}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v22

    .line 101
    .end local v14    # "recordLayerVersion":Lorg/spongycastle/crypto/tls/ProtocolVersion;
    .end local v16    # "serverCertificate":Lorg/spongycastle/crypto/tls/Certificate;
    .end local v17    # "serverHelloBody":[B
    .end local v18    # "serverKeyExchange":[B
    .end local v19    # "serverSupplementalData":Ljava/util/Vector;
    :cond_14e
    new-instance v22, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v23, 0xa

    invoke-direct/range {v22 .. v23}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v22

    .line 138
    .restart local v14    # "recordLayerVersion":Lorg/spongycastle/crypto/tls/ProtocolVersion;
    .restart local v16    # "serverCertificate":Lorg/spongycastle/crypto/tls/Certificate;
    .restart local v17    # "serverHelloBody":[B
    .restart local v19    # "serverSupplementalData":Ljava/util/Vector;
    :cond_156
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->keyExchange:Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    move-object/from16 v22, v0

    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->serverCredentials:Lorg/spongycastle/crypto/tls/TlsCredentials;

    move-object/from16 v23, v0

    invoke-interface/range {v22 .. v23}, Lorg/spongycastle/crypto/tls/TlsKeyExchange;->processServerCredentials(Lorg/spongycastle/crypto/tls/TlsCredentials;)V

    .line 140
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->serverCredentials:Lorg/spongycastle/crypto/tls/TlsCredentials;

    move-object/from16 v22, v0

    invoke-interface/range {v22 .. v22}, Lorg/spongycastle/crypto/tls/TlsCredentials;->getCertificate()Lorg/spongycastle/crypto/tls/Certificate;

    move-result-object v16

    .line 141
    invoke-static/range {v16 .. v16}, Lorg/spongycastle/crypto/tls/DTLSServerProtocol;->generateCertificate(Lorg/spongycastle/crypto/tls/Certificate;)[B

    move-result-object v3

    .line 142
    .local v3, "certificateBody":[B
    const/16 v22, 0xb

    move/from16 v0, v22

    invoke-virtual {v10, v0, v3}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->sendMessage(S[B)V

    goto/16 :goto_c0

    .line 172
    .end local v3    # "certificateBody":[B
    .restart local v18    # "serverKeyExchange":[B
    :cond_17c
    const/16 v22, 0x0

    goto :goto_140

    .line 177
    :cond_17f
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->keyExchange:Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    move-object/from16 v22, v0

    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->certificateRequest:Lorg/spongycastle/crypto/tls/CertificateRequest;

    move-object/from16 v23, v0

    invoke-interface/range {v22 .. v23}, Lorg/spongycastle/crypto/tls/TlsKeyExchange;->validateCertificateRequest(Lorg/spongycastle/crypto/tls/CertificateRequest;)V

    .line 179
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->certificateRequest:Lorg/spongycastle/crypto/tls/CertificateRequest;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Lorg/spongycastle/crypto/tls/DTLSServerProtocol;->generateCertificateRequest(Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;Lorg/spongycastle/crypto/tls/CertificateRequest;)[B

    move-result-object v4

    .line 180
    .local v4, "certificateRequestBody":[B
    const/16 v22, 0xd

    move/from16 v0, v22

    invoke-virtual {v10, v0, v4}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->sendMessage(S[B)V

    .line 182
    invoke-virtual {v10}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->getHandshakeHash()Lorg/spongycastle/crypto/tls/TlsHandshakeHash;

    move-result-object v22

    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->certificateRequest:Lorg/spongycastle/crypto/tls/CertificateRequest;

    move-object/from16 v23, v0

    .line 183
    invoke-virtual/range {v23 .. v23}, Lorg/spongycastle/crypto/tls/CertificateRequest;->getSupportedSignatureAlgorithms()Ljava/util/Vector;

    move-result-object v23

    .line 182
    invoke-static/range {v22 .. v23}, Lorg/spongycastle/crypto/tls/TlsUtils;->trackHashAlgorithms(Lorg/spongycastle/crypto/tls/TlsHandshakeHash;Ljava/util/Vector;)V

    .line 187
    .end local v4    # "certificateRequestBody":[B
    :cond_1b6
    const/16 v22, 0xe

    sget-object v23, Lorg/spongycastle/crypto/tls/TlsUtils;->EMPTY_BYTES:[B

    move/from16 v0, v22

    move-object/from16 v1, v23

    invoke-virtual {v10, v0, v1}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->sendMessage(S[B)V

    .line 189
    invoke-virtual {v10}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->getHandshakeHash()Lorg/spongycastle/crypto/tls/TlsHandshakeHash;

    move-result-object v22

    invoke-interface/range {v22 .. v22}, Lorg/spongycastle/crypto/tls/TlsHandshakeHash;->sealHashAlgorithms()V

    .line 191
    invoke-virtual {v10}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->receiveMessage()Lorg/spongycastle/crypto/tls/DTLSReliableHandshake$Message;

    move-result-object v8

    .line 193
    invoke-virtual {v8}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake$Message;->getType()S

    move-result v22

    const/16 v23, 0x17

    move/from16 v0, v22

    move/from16 v1, v23

    if-ne v0, v1, :cond_2e7

    .line 195
    invoke-virtual {v8}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake$Message;->getBody()[B

    move-result-object v22

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Lorg/spongycastle/crypto/tls/DTLSServerProtocol;->processClientSupplementalData(Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;[B)V

    .line 196
    invoke-virtual {v10}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->receiveMessage()Lorg/spongycastle/crypto/tls/DTLSReliableHandshake$Message;

    move-result-object v8

    .line 203
    :goto_1e9
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->certificateRequest:Lorg/spongycastle/crypto/tls/CertificateRequest;

    move-object/from16 v22, v0

    if-nez v22, :cond_2f4

    .line 205
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->keyExchange:Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    move-object/from16 v22, v0

    invoke-interface/range {v22 .. v22}, Lorg/spongycastle/crypto/tls/TlsKeyExchange;->skipClientCredentials()V

    .line 231
    :goto_1fa
    invoke-virtual {v8}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake$Message;->getType()S

    move-result v22

    const/16 v23, 0x10

    move/from16 v0, v22

    move/from16 v1, v23

    if-ne v0, v1, :cond_334

    .line 233
    invoke-virtual {v8}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake$Message;->getBody()[B

    move-result-object v22

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Lorg/spongycastle/crypto/tls/DTLSServerProtocol;->processClientKeyExchange(Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;[B)V

    .line 240
    invoke-virtual {v10}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->prepareToFinish()Lorg/spongycastle/crypto/tls/TlsHandshakeHash;

    move-result-object v13

    .line 241
    .local v13, "prepareFinishHash":Lorg/spongycastle/crypto/tls/TlsHandshakeHash;
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->serverContext:Lorg/spongycastle/crypto/tls/TlsServerContextImpl;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    invoke-static {v0, v13, v1}, Lorg/spongycastle/crypto/tls/TlsProtocol;->getCurrentPRFHash(Lorg/spongycastle/crypto/tls/TlsContext;Lorg/spongycastle/crypto/tls/TlsHandshakeHash;[B)[B

    move-result-object v22

    move-object/from16 v0, v22

    iput-object v0, v15, Lorg/spongycastle/crypto/tls/SecurityParameters;->sessionHash:[B

    .line 243
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->serverContext:Lorg/spongycastle/crypto/tls/TlsServerContextImpl;

    move-object/from16 v22, v0

    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->keyExchange:Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    move-object/from16 v23, v0

    invoke-static/range {v22 .. v23}, Lorg/spongycastle/crypto/tls/TlsProtocol;->establishMasterSecret(Lorg/spongycastle/crypto/tls/TlsContext;Lorg/spongycastle/crypto/tls/TlsKeyExchange;)V

    .line 244
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->server:Lorg/spongycastle/crypto/tls/TlsServer;

    move-object/from16 v22, v0

    invoke-interface/range {v22 .. v22}, Lorg/spongycastle/crypto/tls/TlsServer;->getCipher()Lorg/spongycastle/crypto/tls/TlsCipher;

    move-result-object v22

    move-object/from16 v0, p2

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->initPendingEpoch(Lorg/spongycastle/crypto/tls/TlsCipher;)V

    .line 251
    invoke-virtual/range {p0 .. p1}, Lorg/spongycastle/crypto/tls/DTLSServerProtocol;->expectCertificateVerifyMessage(Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;)Z

    move-result v22

    if-eqz v22, :cond_260

    .line 253
    const/16 v22, 0xf

    move/from16 v0, v22

    invoke-virtual {v10, v0}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->receiveMessageBody(S)[B

    move-result-object v7

    .line 254
    .local v7, "certificateVerifyBody":[B
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v7, v13}, Lorg/spongycastle/crypto/tls/DTLSServerProtocol;->processCertificateVerify(Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;[BLorg/spongycastle/crypto/tls/TlsHandshakeHash;)V

    .line 258
    .end local v7    # "certificateVerifyBody":[B
    :cond_260
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->serverContext:Lorg/spongycastle/crypto/tls/TlsServerContextImpl;

    move-object/from16 v22, v0

    const-string v23, "client finished"

    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->serverContext:Lorg/spongycastle/crypto/tls/TlsServerContextImpl;

    move-object/from16 v24, v0

    .line 259
    invoke-virtual {v10}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->getHandshakeHash()Lorg/spongycastle/crypto/tls/TlsHandshakeHash;

    move-result-object v25

    const/16 v26, 0x0

    invoke-static/range {v24 .. v26}, Lorg/spongycastle/crypto/tls/TlsProtocol;->getCurrentPRFHash(Lorg/spongycastle/crypto/tls/TlsContext;Lorg/spongycastle/crypto/tls/TlsHandshakeHash;[B)[B

    move-result-object v24

    .line 258
    invoke-static/range {v22 .. v24}, Lorg/spongycastle/crypto/tls/TlsUtils;->calculateVerifyData(Lorg/spongycastle/crypto/tls/TlsContext;Ljava/lang/String;[B)[B

    move-result-object v9

    .line 260
    .local v9, "expectedClientVerifyData":[B
    const/16 v22, 0x14

    move/from16 v0, v22

    invoke-virtual {v10, v0}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->receiveMessageBody(S)[B

    move-result-object v22

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-virtual {v0, v1, v9}, Lorg/spongycastle/crypto/tls/DTLSServerProtocol;->processFinished([B[B)V

    .line 262
    move-object/from16 v0, p1

    iget-boolean v0, v0, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->expectSessionTicket:Z

    move/from16 v22, v0

    if-eqz v22, :cond_2ac

    .line 264
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->server:Lorg/spongycastle/crypto/tls/TlsServer;

    move-object/from16 v22, v0

    invoke-interface/range {v22 .. v22}, Lorg/spongycastle/crypto/tls/TlsServer;->getNewSessionTicket()Lorg/spongycastle/crypto/tls/NewSessionTicket;

    move-result-object v11

    .line 265
    .local v11, "newSessionTicket":Lorg/spongycastle/crypto/tls/NewSessionTicket;
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v11}, Lorg/spongycastle/crypto/tls/DTLSServerProtocol;->generateNewSessionTicket(Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;Lorg/spongycastle/crypto/tls/NewSessionTicket;)[B

    move-result-object v12

    .line 266
    .local v12, "newSessionTicketBody":[B
    const/16 v22, 0x4

    move/from16 v0, v22

    invoke-virtual {v10, v0, v12}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->sendMessage(S[B)V

    .line 270
    .end local v11    # "newSessionTicket":Lorg/spongycastle/crypto/tls/NewSessionTicket;
    .end local v12    # "newSessionTicketBody":[B
    :cond_2ac
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->serverContext:Lorg/spongycastle/crypto/tls/TlsServerContextImpl;

    move-object/from16 v22, v0

    const-string v23, "server finished"

    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->serverContext:Lorg/spongycastle/crypto/tls/TlsServerContextImpl;

    move-object/from16 v24, v0

    .line 271
    invoke-virtual {v10}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->getHandshakeHash()Lorg/spongycastle/crypto/tls/TlsHandshakeHash;

    move-result-object v25

    const/16 v26, 0x0

    invoke-static/range {v24 .. v26}, Lorg/spongycastle/crypto/tls/TlsProtocol;->getCurrentPRFHash(Lorg/spongycastle/crypto/tls/TlsContext;Lorg/spongycastle/crypto/tls/TlsHandshakeHash;[B)[B

    move-result-object v24

    .line 270
    invoke-static/range {v22 .. v24}, Lorg/spongycastle/crypto/tls/TlsUtils;->calculateVerifyData(Lorg/spongycastle/crypto/tls/TlsContext;Ljava/lang/String;[B)[B

    move-result-object v20

    .line 272
    .local v20, "serverVerifyData":[B
    const/16 v22, 0x14

    move/from16 v0, v22

    move-object/from16 v1, v20

    invoke-virtual {v10, v0, v1}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->sendMessage(S[B)V

    .line 274
    invoke-virtual {v10}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->finish()V

    .line 276
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->server:Lorg/spongycastle/crypto/tls/TlsServer;

    move-object/from16 v22, v0

    invoke-interface/range {v22 .. v22}, Lorg/spongycastle/crypto/tls/TlsServer;->notifyHandshakeComplete()V

    .line 278
    new-instance v22, Lorg/spongycastle/crypto/tls/DTLSTransport;

    move-object/from16 v0, v22

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/DTLSTransport;-><init>(Lorg/spongycastle/crypto/tls/DTLSRecordLayer;)V

    return-object v22

    .line 200
    .end local v9    # "expectedClientVerifyData":[B
    .end local v13    # "prepareFinishHash":Lorg/spongycastle/crypto/tls/TlsHandshakeHash;
    .end local v20    # "serverVerifyData":[B
    :cond_2e7
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->server:Lorg/spongycastle/crypto/tls/TlsServer;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    invoke-interface/range {v22 .. v23}, Lorg/spongycastle/crypto/tls/TlsServer;->processClientSupplementalData(Ljava/util/Vector;)V

    goto/16 :goto_1e9

    .line 209
    :cond_2f4
    invoke-virtual {v8}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake$Message;->getType()S

    move-result v22

    const/16 v23, 0xb

    move/from16 v0, v22

    move/from16 v1, v23

    if-ne v0, v1, :cond_313

    .line 211
    invoke-virtual {v8}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake$Message;->getBody()[B

    move-result-object v22

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Lorg/spongycastle/crypto/tls/DTLSServerProtocol;->processClientCertificate(Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;[B)V

    .line 212
    invoke-virtual {v10}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->receiveMessage()Lorg/spongycastle/crypto/tls/DTLSReliableHandshake$Message;

    move-result-object v8

    goto/16 :goto_1fa

    .line 216
    :cond_313
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;->serverContext:Lorg/spongycastle/crypto/tls/TlsServerContextImpl;

    move-object/from16 v22, v0

    invoke-static/range {v22 .. v22}, Lorg/spongycastle/crypto/tls/TlsUtils;->isTLSv12(Lorg/spongycastle/crypto/tls/TlsContext;)Z

    move-result v22

    if-eqz v22, :cond_327

    .line 224
    new-instance v22, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v23, 0xa

    invoke-direct/range {v22 .. v23}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v22

    .line 227
    :cond_327
    sget-object v22, Lorg/spongycastle/crypto/tls/Certificate;->EMPTY_CHAIN:Lorg/spongycastle/crypto/tls/Certificate;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Lorg/spongycastle/crypto/tls/DTLSServerProtocol;->notifyClientCertificate(Lorg/spongycastle/crypto/tls/DTLSServerProtocol$ServerHandshakeState;Lorg/spongycastle/crypto/tls/Certificate;)V

    goto/16 :goto_1fa

    .line 237
    :cond_334
    new-instance v22, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v23, 0xa

    invoke-direct/range {v22 .. v23}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v22
.end method

.method public setVerifyRequests(Z)V
    .registers 2
    .param p1, "verifyRequests"    # Z

    .prologue
    .line 32
    iput-boolean p1, p0, Lorg/spongycastle/crypto/tls/DTLSServerProtocol;->verifyRequests:Z

    .line 33
    return-void
.end method
