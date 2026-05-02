.class public Lorg/spongycastle/crypto/tls/TlsServerProtocol;
.super Lorg/spongycastle/crypto/tls/TlsProtocol;
.source "TlsServerProtocol.java"


# instance fields
.field protected certificateRequest:Lorg/spongycastle/crypto/tls/CertificateRequest;

.field protected clientCertificateType:S

.field protected keyExchange:Lorg/spongycastle/crypto/tls/TlsKeyExchange;

.field protected prepareFinishHash:Lorg/spongycastle/crypto/tls/TlsHandshakeHash;

.field protected serverCredentials:Lorg/spongycastle/crypto/tls/TlsCredentials;

.field protected tlsServer:Lorg/spongycastle/crypto/tls/TlsServer;

.field tlsServerContext:Lorg/spongycastle/crypto/tls/TlsServerContextImpl;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;Ljava/io/OutputStream;Ljava/security/SecureRandom;)V
    .registers 6
    .param p1, "input"    # Ljava/io/InputStream;
    .param p2, "output"    # Ljava/io/OutputStream;
    .param p3, "secureRandom"    # Ljava/security/SecureRandom;

    .prologue
    const/4 v1, 0x0

    .line 36
    invoke-direct {p0, p1, p2, p3}, Lorg/spongycastle/crypto/tls/TlsProtocol;-><init>(Ljava/io/InputStream;Ljava/io/OutputStream;Ljava/security/SecureRandom;)V

    .line 18
    iput-object v1, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->tlsServer:Lorg/spongycastle/crypto/tls/TlsServer;

    .line 19
    iput-object v1, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->tlsServerContext:Lorg/spongycastle/crypto/tls/TlsServerContextImpl;

    .line 21
    iput-object v1, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->keyExchange:Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    .line 22
    iput-object v1, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->serverCredentials:Lorg/spongycastle/crypto/tls/TlsCredentials;

    .line 23
    iput-object v1, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->certificateRequest:Lorg/spongycastle/crypto/tls/CertificateRequest;

    .line 25
    const/4 v0, -0x1

    iput-short v0, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->clientCertificateType:S

    .line 26
    iput-object v1, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->prepareFinishHash:Lorg/spongycastle/crypto/tls/TlsHandshakeHash;

    .line 37
    return-void
.end method

.method public constructor <init>(Ljava/security/SecureRandom;)V
    .registers 4
    .param p1, "secureRandom"    # Ljava/security/SecureRandom;

    .prologue
    const/4 v1, 0x0

    .line 56
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/tls/TlsProtocol;-><init>(Ljava/security/SecureRandom;)V

    .line 18
    iput-object v1, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->tlsServer:Lorg/spongycastle/crypto/tls/TlsServer;

    .line 19
    iput-object v1, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->tlsServerContext:Lorg/spongycastle/crypto/tls/TlsServerContextImpl;

    .line 21
    iput-object v1, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->keyExchange:Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    .line 22
    iput-object v1, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->serverCredentials:Lorg/spongycastle/crypto/tls/TlsCredentials;

    .line 23
    iput-object v1, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->certificateRequest:Lorg/spongycastle/crypto/tls/CertificateRequest;

    .line 25
    const/4 v0, -0x1

    iput-short v0, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->clientCertificateType:S

    .line 26
    iput-object v1, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->prepareFinishHash:Lorg/spongycastle/crypto/tls/TlsHandshakeHash;

    .line 57
    return-void
.end method


# virtual methods
.method public accept(Lorg/spongycastle/crypto/tls/TlsServer;)V
    .registers 6
    .param p1, "tlsServer"    # Lorg/spongycastle/crypto/tls/TlsServer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 72
    if-nez p1, :cond_b

    .line 74
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'tlsServer\' cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 76
    :cond_b
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->tlsServer:Lorg/spongycastle/crypto/tls/TlsServer;

    if-eqz v0, :cond_17

    .line 78
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "\'accept\' can only be called once"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 81
    :cond_17
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->tlsServer:Lorg/spongycastle/crypto/tls/TlsServer;

    .line 83
    new-instance v0, Lorg/spongycastle/crypto/tls/SecurityParameters;

    invoke-direct {v0}, Lorg/spongycastle/crypto/tls/SecurityParameters;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->securityParameters:Lorg/spongycastle/crypto/tls/SecurityParameters;

    .line 84
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->securityParameters:Lorg/spongycastle/crypto/tls/SecurityParameters;

    iput v3, v0, Lorg/spongycastle/crypto/tls/SecurityParameters;->entity:I

    .line 86
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsServerContextImpl;

    iget-object v1, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->secureRandom:Ljava/security/SecureRandom;

    iget-object v2, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->securityParameters:Lorg/spongycastle/crypto/tls/SecurityParameters;

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/crypto/tls/TlsServerContextImpl;-><init>(Ljava/security/SecureRandom;Lorg/spongycastle/crypto/tls/SecurityParameters;)V

    iput-object v0, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->tlsServerContext:Lorg/spongycastle/crypto/tls/TlsServerContextImpl;

    .line 88
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->securityParameters:Lorg/spongycastle/crypto/tls/SecurityParameters;

    invoke-interface {p1}, Lorg/spongycastle/crypto/tls/TlsServer;->shouldUseGMTUnixTime()Z

    move-result v1

    iget-object v2, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->tlsServerContext:Lorg/spongycastle/crypto/tls/TlsServerContextImpl;

    .line 89
    invoke-virtual {v2}, Lorg/spongycastle/crypto/tls/TlsServerContextImpl;->getNonceRandomGenerator()Lorg/spongycastle/crypto/prng/RandomGenerator;

    move-result-object v2

    .line 88
    invoke-static {v1, v2}, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->createRandomBlock(ZLorg/spongycastle/crypto/prng/RandomGenerator;)[B

    move-result-object v1

    iput-object v1, v0, Lorg/spongycastle/crypto/tls/SecurityParameters;->serverRandom:[B

    .line 91
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->tlsServer:Lorg/spongycastle/crypto/tls/TlsServer;

    iget-object v1, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->tlsServerContext:Lorg/spongycastle/crypto/tls/TlsServerContextImpl;

    invoke-interface {v0, v1}, Lorg/spongycastle/crypto/tls/TlsServer;->init(Lorg/spongycastle/crypto/tls/TlsServerContext;)V

    .line 92
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->recordStream:Lorg/spongycastle/crypto/tls/RecordStream;

    iget-object v1, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->tlsServerContext:Lorg/spongycastle/crypto/tls/TlsServerContextImpl;

    invoke-virtual {v0, v1}, Lorg/spongycastle/crypto/tls/RecordStream;->init(Lorg/spongycastle/crypto/tls/TlsContext;)V

    .line 94
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->recordStream:Lorg/spongycastle/crypto/tls/RecordStream;

    invoke-virtual {v0, v3}, Lorg/spongycastle/crypto/tls/RecordStream;->setRestrictReadVersion(Z)V

    .line 96
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->blockForHandshake()V

    .line 97
    return-void
.end method

.method protected cleanupHandshake()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 101
    invoke-super {p0}, Lorg/spongycastle/crypto/tls/TlsProtocol;->cleanupHandshake()V

    .line 103
    iput-object v0, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->keyExchange:Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    .line 104
    iput-object v0, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->serverCredentials:Lorg/spongycastle/crypto/tls/TlsCredentials;

    .line 105
    iput-object v0, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->certificateRequest:Lorg/spongycastle/crypto/tls/CertificateRequest;

    .line 106
    iput-object v0, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->prepareFinishHash:Lorg/spongycastle/crypto/tls/TlsHandshakeHash;

    .line 107
    return-void
.end method

.method protected expectCertificateVerifyMessage()Z
    .registers 2

    .prologue
    .line 849
    iget-short v0, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->clientCertificateType:S

    if-ltz v0, :cond_e

    iget-short v0, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->clientCertificateType:S

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

.method protected getContext()Lorg/spongycastle/crypto/tls/TlsContext;
    .registers 2

    .prologue
    .line 111
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->tlsServerContext:Lorg/spongycastle/crypto/tls/TlsServerContextImpl;

    return-object v0
.end method

.method getContextAdmin()Lorg/spongycastle/crypto/tls/AbstractTlsContext;
    .registers 2

    .prologue
    .line 116
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->tlsServerContext:Lorg/spongycastle/crypto/tls/TlsServerContextImpl;

    return-object v0
.end method

.method protected getPeer()Lorg/spongycastle/crypto/tls/TlsPeer;
    .registers 2

    .prologue
    .line 121
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->tlsServer:Lorg/spongycastle/crypto/tls/TlsServer;

    return-object v0
.end method

.method protected handleHandshakeMessage(S[B)V
    .registers 12
    .param p1, "type"    # S
    .param p2, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    const/4 v5, 0x1

    const/4 v6, 0x0

    const/16 v8, 0xa

    .line 127
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 129
    .local v0, "buf":Ljava/io/ByteArrayInputStream;
    sparse-switch p1, :sswitch_data_1e2

    .line 394
    new-instance v5, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    invoke-direct {v5, v8}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v5

    .line 133
    :sswitch_13
    iget-short v7, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->connection_state:S

    sparse-switch v7, :sswitch_data_1fc

    .line 229
    new-instance v5, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    invoke-direct {v5, v8}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v5

    .line 137
    :sswitch_1e
    invoke-virtual {p0, v0}, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->receiveClientHelloMessage(Ljava/io/ByteArrayInputStream;)V

    .line 138
    iput-short v5, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->connection_state:S

    .line 140
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->sendServerHelloMessage()V

    .line 141
    const/4 v7, 0x2

    iput-short v7, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->connection_state:S

    .line 143
    iget-object v7, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->recordStream:Lorg/spongycastle/crypto/tls/RecordStream;

    invoke-virtual {v7}, Lorg/spongycastle/crypto/tls/RecordStream;->notifyHelloComplete()V

    .line 145
    iget-object v7, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->tlsServer:Lorg/spongycastle/crypto/tls/TlsServer;

    invoke-interface {v7}, Lorg/spongycastle/crypto/tls/TlsServer;->getServerSupplementalData()Ljava/util/Vector;

    move-result-object v4

    .line 146
    .local v4, "serverSupplementalData":Ljava/util/Vector;
    if-eqz v4, :cond_39

    .line 148
    invoke-virtual {p0, v4}, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->sendSupplementalDataMessage(Ljava/util/Vector;)V

    .line 150
    :cond_39
    const/4 v7, 0x3

    iput-short v7, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->connection_state:S

    .line 152
    iget-object v7, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->tlsServer:Lorg/spongycastle/crypto/tls/TlsServer;

    invoke-interface {v7}, Lorg/spongycastle/crypto/tls/TlsServer;->getKeyExchange()Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    move-result-object v7

    iput-object v7, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->keyExchange:Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    .line 153
    iget-object v7, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->keyExchange:Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->getContext()Lorg/spongycastle/crypto/tls/TlsContext;

    move-result-object v8

    invoke-interface {v7, v8}, Lorg/spongycastle/crypto/tls/TlsKeyExchange;->init(Lorg/spongycastle/crypto/tls/TlsContext;)V

    .line 155
    iget-object v7, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->tlsServer:Lorg/spongycastle/crypto/tls/TlsServer;

    invoke-interface {v7}, Lorg/spongycastle/crypto/tls/TlsServer;->getCredentials()Lorg/spongycastle/crypto/tls/TlsCredentials;

    move-result-object v7

    iput-object v7, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->serverCredentials:Lorg/spongycastle/crypto/tls/TlsCredentials;

    .line 157
    const/4 v2, 0x0

    .line 159
    .local v2, "serverCertificate":Lorg/spongycastle/crypto/tls/Certificate;
    iget-object v7, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->serverCredentials:Lorg/spongycastle/crypto/tls/TlsCredentials;

    if-nez v7, :cond_b6

    .line 161
    iget-object v7, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->keyExchange:Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    invoke-interface {v7}, Lorg/spongycastle/crypto/tls/TlsKeyExchange;->skipServerCredentials()V

    .line 170
    :goto_5f
    const/4 v7, 0x4

    iput-short v7, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->connection_state:S

    .line 173
    if-eqz v2, :cond_6a

    invoke-virtual {v2}, Lorg/spongycastle/crypto/tls/Certificate;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_6c

    .line 175
    :cond_6a
    iput-boolean v6, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->allowCertificateStatus:Z

    .line 178
    :cond_6c
    iget-boolean v7, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->allowCertificateStatus:Z

    if-eqz v7, :cond_7b

    .line 180
    iget-object v7, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->tlsServer:Lorg/spongycastle/crypto/tls/TlsServer;

    invoke-interface {v7}, Lorg/spongycastle/crypto/tls/TlsServer;->getCertificateStatus()Lorg/spongycastle/crypto/tls/CertificateStatus;

    move-result-object v1

    .line 181
    .local v1, "certificateStatus":Lorg/spongycastle/crypto/tls/CertificateStatus;
    if-eqz v1, :cond_7b

    .line 183
    invoke-virtual {p0, v1}, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->sendCertificateStatusMessage(Lorg/spongycastle/crypto/tls/CertificateStatus;)V

    .line 187
    .end local v1    # "certificateStatus":Lorg/spongycastle/crypto/tls/CertificateStatus;
    :cond_7b
    const/4 v7, 0x5

    iput-short v7, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->connection_state:S

    .line 189
    iget-object v7, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->keyExchange:Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    invoke-interface {v7}, Lorg/spongycastle/crypto/tls/TlsKeyExchange;->generateServerKeyExchange()[B

    move-result-object v3

    .line 190
    .local v3, "serverKeyExchange":[B
    if-eqz v3, :cond_89

    .line 192
    invoke-virtual {p0, v3}, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->sendServerKeyExchangeMessage([B)V

    .line 194
    :cond_89
    const/4 v7, 0x6

    iput-short v7, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->connection_state:S

    .line 196
    iget-object v7, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->serverCredentials:Lorg/spongycastle/crypto/tls/TlsCredentials;

    if-eqz v7, :cond_e4

    .line 198
    iget-object v7, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->tlsServer:Lorg/spongycastle/crypto/tls/TlsServer;

    invoke-interface {v7}, Lorg/spongycastle/crypto/tls/TlsServer;->getCertificateRequest()Lorg/spongycastle/crypto/tls/CertificateRequest;

    move-result-object v7

    iput-object v7, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->certificateRequest:Lorg/spongycastle/crypto/tls/CertificateRequest;

    .line 199
    iget-object v7, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->certificateRequest:Lorg/spongycastle/crypto/tls/CertificateRequest;

    if-eqz v7, :cond_e4

    .line 201
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->getContext()Lorg/spongycastle/crypto/tls/TlsContext;

    move-result-object v7

    invoke-static {v7}, Lorg/spongycastle/crypto/tls/TlsUtils;->isTLSv12(Lorg/spongycastle/crypto/tls/TlsContext;)Z

    move-result v7

    iget-object v8, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->certificateRequest:Lorg/spongycastle/crypto/tls/CertificateRequest;

    invoke-virtual {v8}, Lorg/spongycastle/crypto/tls/CertificateRequest;->getSupportedSignatureAlgorithms()Ljava/util/Vector;

    move-result-object v8

    if-eqz v8, :cond_c7

    :goto_ac
    if-eq v7, v5, :cond_c9

    .line 203
    new-instance v5, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v6, 0x50

    invoke-direct {v5, v6}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v5

    .line 165
    .end local v3    # "serverKeyExchange":[B
    :cond_b6
    iget-object v7, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->keyExchange:Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    iget-object v8, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->serverCredentials:Lorg/spongycastle/crypto/tls/TlsCredentials;

    invoke-interface {v7, v8}, Lorg/spongycastle/crypto/tls/TlsKeyExchange;->processServerCredentials(Lorg/spongycastle/crypto/tls/TlsCredentials;)V

    .line 167
    iget-object v7, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->serverCredentials:Lorg/spongycastle/crypto/tls/TlsCredentials;

    invoke-interface {v7}, Lorg/spongycastle/crypto/tls/TlsCredentials;->getCertificate()Lorg/spongycastle/crypto/tls/Certificate;

    move-result-object v2

    .line 168
    invoke-virtual {p0, v2}, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->sendCertificateMessage(Lorg/spongycastle/crypto/tls/Certificate;)V

    goto :goto_5f

    .restart local v3    # "serverKeyExchange":[B
    :cond_c7
    move v5, v6

    .line 201
    goto :goto_ac

    .line 206
    :cond_c9
    iget-object v5, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->keyExchange:Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    iget-object v6, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->certificateRequest:Lorg/spongycastle/crypto/tls/CertificateRequest;

    invoke-interface {v5, v6}, Lorg/spongycastle/crypto/tls/TlsKeyExchange;->validateCertificateRequest(Lorg/spongycastle/crypto/tls/CertificateRequest;)V

    .line 208
    iget-object v5, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->certificateRequest:Lorg/spongycastle/crypto/tls/CertificateRequest;

    invoke-virtual {p0, v5}, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->sendCertificateRequestMessage(Lorg/spongycastle/crypto/tls/CertificateRequest;)V

    .line 210
    iget-object v5, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->recordStream:Lorg/spongycastle/crypto/tls/RecordStream;

    invoke-virtual {v5}, Lorg/spongycastle/crypto/tls/RecordStream;->getHandshakeHash()Lorg/spongycastle/crypto/tls/TlsHandshakeHash;

    move-result-object v5

    iget-object v6, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->certificateRequest:Lorg/spongycastle/crypto/tls/CertificateRequest;

    .line 211
    invoke-virtual {v6}, Lorg/spongycastle/crypto/tls/CertificateRequest;->getSupportedSignatureAlgorithms()Ljava/util/Vector;

    move-result-object v6

    .line 210
    invoke-static {v5, v6}, Lorg/spongycastle/crypto/tls/TlsUtils;->trackHashAlgorithms(Lorg/spongycastle/crypto/tls/TlsHandshakeHash;Ljava/util/Vector;)V

    .line 214
    :cond_e4
    const/4 v5, 0x7

    iput-short v5, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->connection_state:S

    .line 216
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->sendServerHelloDoneMessage()V

    .line 217
    const/16 v5, 0x8

    iput-short v5, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->connection_state:S

    .line 219
    iget-object v5, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->recordStream:Lorg/spongycastle/crypto/tls/RecordStream;

    invoke-virtual {v5}, Lorg/spongycastle/crypto/tls/RecordStream;->getHandshakeHash()Lorg/spongycastle/crypto/tls/TlsHandshakeHash;

    move-result-object v5

    invoke-interface {v5}, Lorg/spongycastle/crypto/tls/TlsHandshakeHash;->sealHashAlgorithms()V

    .line 396
    .end local v2    # "serverCertificate":Lorg/spongycastle/crypto/tls/Certificate;
    .end local v3    # "serverKeyExchange":[B
    .end local v4    # "serverSupplementalData":Ljava/util/Vector;
    :goto_f7
    return-void

    .line 225
    :sswitch_f8
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->refuseRenegotiation()V

    goto :goto_f7

    .line 235
    :sswitch_fc
    iget-short v5, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->connection_state:S

    packed-switch v5, :pswitch_data_206

    .line 244
    new-instance v5, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    invoke-direct {v5, v8}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v5

    .line 239
    :pswitch_107
    iget-object v5, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->tlsServer:Lorg/spongycastle/crypto/tls/TlsServer;

    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->readSupplementalDataMessage(Ljava/io/ByteArrayInputStream;)Ljava/util/Vector;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/spongycastle/crypto/tls/TlsServer;->processClientSupplementalData(Ljava/util/Vector;)V

    .line 240
    const/16 v5, 0x9

    iput-short v5, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->connection_state:S

    goto :goto_f7

    .line 250
    :sswitch_115
    iget-short v5, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->connection_state:S

    packed-switch v5, :pswitch_data_20c

    .line 268
    new-instance v5, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    invoke-direct {v5, v8}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v5

    .line 254
    :pswitch_120
    iget-object v5, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->tlsServer:Lorg/spongycastle/crypto/tls/TlsServer;

    invoke-interface {v5, v7}, Lorg/spongycastle/crypto/tls/TlsServer;->processClientSupplementalData(Ljava/util/Vector;)V

    .line 259
    :pswitch_125
    iget-object v5, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->certificateRequest:Lorg/spongycastle/crypto/tls/CertificateRequest;

    if-nez v5, :cond_12f

    .line 261
    new-instance v5, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    invoke-direct {v5, v8}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v5

    .line 263
    :cond_12f
    invoke-virtual {p0, v0}, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->receiveCertificateMessage(Ljava/io/ByteArrayInputStream;)V

    .line 264
    iput-short v8, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->connection_state:S

    goto :goto_f7

    .line 274
    :sswitch_135
    iget-short v5, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->connection_state:S

    packed-switch v5, :pswitch_data_214

    .line 320
    new-instance v5, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    invoke-direct {v5, v8}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v5

    .line 278
    :pswitch_140
    iget-object v5, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->tlsServer:Lorg/spongycastle/crypto/tls/TlsServer;

    invoke-interface {v5, v7}, Lorg/spongycastle/crypto/tls/TlsServer;->processClientSupplementalData(Ljava/util/Vector;)V

    .line 283
    :pswitch_145
    iget-object v5, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->certificateRequest:Lorg/spongycastle/crypto/tls/CertificateRequest;

    if-nez v5, :cond_156

    .line 285
    iget-object v5, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->keyExchange:Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    invoke-interface {v5}, Lorg/spongycastle/crypto/tls/TlsKeyExchange;->skipClientCredentials()V

    .line 315
    :cond_14e
    :goto_14e
    :pswitch_14e
    invoke-virtual {p0, v0}, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->receiveClientKeyExchangeMessage(Ljava/io/ByteArrayInputStream;)V

    .line 316
    const/16 v5, 0xb

    iput-short v5, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->connection_state:S

    goto :goto_f7

    .line 289
    :cond_156
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->getContext()Lorg/spongycastle/crypto/tls/TlsContext;

    move-result-object v5

    invoke-static {v5}, Lorg/spongycastle/crypto/tls/TlsUtils;->isTLSv12(Lorg/spongycastle/crypto/tls/TlsContext;)Z

    move-result v5

    if-eqz v5, :cond_166

    .line 297
    new-instance v5, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    invoke-direct {v5, v8}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v5

    .line 299
    :cond_166
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->getContext()Lorg/spongycastle/crypto/tls/TlsContext;

    move-result-object v5

    invoke-static {v5}, Lorg/spongycastle/crypto/tls/TlsUtils;->isSSL(Lorg/spongycastle/crypto/tls/TlsContext;)Z

    move-result v5

    if-eqz v5, :cond_17a

    .line 301
    iget-object v5, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->peerCertificate:Lorg/spongycastle/crypto/tls/Certificate;

    if-nez v5, :cond_14e

    .line 303
    new-instance v5, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    invoke-direct {v5, v8}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v5

    .line 308
    :cond_17a
    sget-object v5, Lorg/spongycastle/crypto/tls/Certificate;->EMPTY_CHAIN:Lorg/spongycastle/crypto/tls/Certificate;

    invoke-virtual {p0, v5}, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->notifyClientCertificate(Lorg/spongycastle/crypto/tls/Certificate;)V

    goto :goto_14e

    .line 326
    :sswitch_180
    iget-short v5, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->connection_state:S

    packed-switch v5, :pswitch_data_21e

    .line 346
    new-instance v5, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    invoke-direct {v5, v8}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v5

    .line 335
    :pswitch_18b
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->expectCertificateVerifyMessage()Z

    move-result v5

    if-nez v5, :cond_197

    .line 337
    new-instance v5, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    invoke-direct {v5, v8}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v5

    .line 340
    :cond_197
    invoke-virtual {p0, v0}, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->receiveCertificateVerifyMessage(Ljava/io/ByteArrayInputStream;)V

    .line 341
    const/16 v5, 0xc

    iput-short v5, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->connection_state:S

    goto/16 :goto_f7

    .line 352
    :sswitch_1a0
    iget-short v5, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->connection_state:S

    packed-switch v5, :pswitch_data_224

    .line 382
    new-instance v5, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    invoke-direct {v5, v8}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v5

    .line 356
    :pswitch_1ab
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->expectCertificateVerifyMessage()Z

    move-result v5

    if-eqz v5, :cond_1b7

    .line 358
    new-instance v5, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    invoke-direct {v5, v8}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v5

    .line 364
    :cond_1b7
    :pswitch_1b7
    invoke-virtual {p0, v0}, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->processFinishedMessage(Ljava/io/ByteArrayInputStream;)V

    .line 365
    const/16 v5, 0xd

    iput-short v5, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->connection_state:S

    .line 367
    iget-boolean v5, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->expectSessionTicket:Z

    if-eqz v5, :cond_1ce

    .line 369
    iget-object v5, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->tlsServer:Lorg/spongycastle/crypto/tls/TlsServer;

    invoke-interface {v5}, Lorg/spongycastle/crypto/tls/TlsServer;->getNewSessionTicket()Lorg/spongycastle/crypto/tls/NewSessionTicket;

    move-result-object v5

    invoke-virtual {p0, v5}, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->sendNewSessionTicketMessage(Lorg/spongycastle/crypto/tls/NewSessionTicket;)V

    .line 370
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->sendChangeCipherSpecMessage()V

    .line 372
    :cond_1ce
    const/16 v5, 0xe

    iput-short v5, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->connection_state:S

    .line 374
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->sendFinishedMessage()V

    .line 375
    const/16 v5, 0xf

    iput-short v5, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->connection_state:S

    .line 376
    const/16 v5, 0x10

    iput-short v5, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->connection_state:S

    .line 378
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->completeHandshake()V

    goto/16 :goto_f7

    .line 129
    :sswitch_data_1e2
    .sparse-switch
        0x1 -> :sswitch_13
        0xb -> :sswitch_115
        0xf -> :sswitch_180
        0x10 -> :sswitch_135
        0x14 -> :sswitch_1a0
        0x17 -> :sswitch_fc
    .end sparse-switch

    .line 133
    :sswitch_data_1fc
    .sparse-switch
        0x0 -> :sswitch_1e
        0x10 -> :sswitch_f8
    .end sparse-switch

    .line 235
    :pswitch_data_206
    .packed-switch 0x8
        :pswitch_107
    .end packed-switch

    .line 250
    :pswitch_data_20c
    .packed-switch 0x8
        :pswitch_120
        :pswitch_125
    .end packed-switch

    .line 274
    :pswitch_data_214
    .packed-switch 0x8
        :pswitch_140
        :pswitch_145
        :pswitch_14e
    .end packed-switch

    .line 326
    :pswitch_data_21e
    .packed-switch 0xb
        :pswitch_18b
    .end packed-switch

    .line 352
    :pswitch_data_224
    .packed-switch 0xb
        :pswitch_1ab
        :pswitch_1b7
    .end packed-switch
.end method

.method protected handleWarningMessage(S)V
    .registers 3
    .param p1, "description"    # S
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 401
    packed-switch p1, :pswitch_data_1c

    .line 417
    invoke-super {p0, p1}, Lorg/spongycastle/crypto/tls/TlsProtocol;->handleWarningMessage(S)V

    .line 421
    :cond_6
    :goto_6
    return-void

    .line 409
    :pswitch_7
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->getContext()Lorg/spongycastle/crypto/tls/TlsContext;

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->isSSL(Lorg/spongycastle/crypto/tls/TlsContext;)Z

    move-result v0

    if-eqz v0, :cond_6

    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->certificateRequest:Lorg/spongycastle/crypto/tls/CertificateRequest;

    if-eqz v0, :cond_6

    .line 411
    sget-object v0, Lorg/spongycastle/crypto/tls/Certificate;->EMPTY_CHAIN:Lorg/spongycastle/crypto/tls/Certificate;

    invoke-virtual {p0, v0}, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->notifyClientCertificate(Lorg/spongycastle/crypto/tls/Certificate;)V

    goto :goto_6

    .line 401
    nop

    :pswitch_data_1c
    .packed-switch 0x29
        :pswitch_7
    .end packed-switch
.end method

.method protected notifyClientCertificate(Lorg/spongycastle/crypto/tls/Certificate;)V
    .registers 4
    .param p1, "clientCertificate"    # Lorg/spongycastle/crypto/tls/Certificate;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 426
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->certificateRequest:Lorg/spongycastle/crypto/tls/CertificateRequest;

    if-nez v0, :cond_a

    .line 428
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 431
    :cond_a
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->peerCertificate:Lorg/spongycastle/crypto/tls/Certificate;

    if-eqz v0, :cond_16

    .line 433
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v0

    .line 436
    :cond_16
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->peerCertificate:Lorg/spongycastle/crypto/tls/Certificate;

    .line 438
    invoke-virtual {p1}, Lorg/spongycastle/crypto/tls/Certificate;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_29

    .line 440
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->keyExchange:Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    invoke-interface {v0}, Lorg/spongycastle/crypto/tls/TlsKeyExchange;->skipClientCredentials()V

    .line 465
    :goto_23
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->tlsServer:Lorg/spongycastle/crypto/tls/TlsServer;

    invoke-interface {v0, p1}, Lorg/spongycastle/crypto/tls/TlsServer;->notifyClientCertificate(Lorg/spongycastle/crypto/tls/Certificate;)V

    .line 466
    return-void

    .line 451
    :cond_29
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->serverCredentials:Lorg/spongycastle/crypto/tls/TlsCredentials;

    .line 452
    invoke-interface {v0}, Lorg/spongycastle/crypto/tls/TlsCredentials;->getCertificate()Lorg/spongycastle/crypto/tls/Certificate;

    move-result-object v0

    .line 451
    invoke-static {p1, v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->getClientCertificateType(Lorg/spongycastle/crypto/tls/Certificate;Lorg/spongycastle/crypto/tls/Certificate;)S

    move-result v0

    iput-short v0, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->clientCertificateType:S

    .line 454
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->keyExchange:Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    invoke-interface {v0, p1}, Lorg/spongycastle/crypto/tls/TlsKeyExchange;->processClientCertificate(Lorg/spongycastle/crypto/tls/Certificate;)V

    goto :goto_23
.end method

.method protected receiveCertificateMessage(Ljava/io/ByteArrayInputStream;)V
    .registers 3
    .param p1, "buf"    # Ljava/io/ByteArrayInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 471
    invoke-static {p1}, Lorg/spongycastle/crypto/tls/Certificate;->parse(Ljava/io/InputStream;)Lorg/spongycastle/crypto/tls/Certificate;

    move-result-object v0

    .line 473
    .local v0, "clientCertificate":Lorg/spongycastle/crypto/tls/Certificate;
    invoke-static {p1}, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->assertEmpty(Ljava/io/ByteArrayInputStream;)V

    .line 475
    invoke-virtual {p0, v0}, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->notifyClientCertificate(Lorg/spongycastle/crypto/tls/Certificate;)V

    .line 476
    return-void
.end method

.method protected receiveCertificateVerifyMessage(Ljava/io/ByteArrayInputStream;)V
    .registers 13
    .param p1, "buf"    # Ljava/io/ByteArrayInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v10, 0x33

    .line 481
    iget-object v8, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->certificateRequest:Lorg/spongycastle/crypto/tls/CertificateRequest;

    if-nez v8, :cond_c

    .line 483
    new-instance v8, Ljava/lang/IllegalStateException;

    invoke-direct {v8}, Ljava/lang/IllegalStateException;-><init>()V

    throw v8

    .line 486
    :cond_c
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->getContext()Lorg/spongycastle/crypto/tls/TlsContext;

    move-result-object v8

    invoke-static {v8, p1}, Lorg/spongycastle/crypto/tls/DigitallySigned;->parse(Lorg/spongycastle/crypto/tls/TlsContext;Ljava/io/InputStream;)Lorg/spongycastle/crypto/tls/DigitallySigned;

    move-result-object v0

    .line 488
    .local v0, "clientCertificateVerify":Lorg/spongycastle/crypto/tls/DigitallySigned;
    invoke-static {p1}, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->assertEmpty(Ljava/io/ByteArrayInputStream;)V

    .line 493
    :try_start_17
    invoke-virtual {v0}, Lorg/spongycastle/crypto/tls/DigitallySigned;->getAlgorithm()Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;

    move-result-object v5

    .line 496
    .local v5, "signatureAlgorithm":Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->getContext()Lorg/spongycastle/crypto/tls/TlsContext;

    move-result-object v8

    invoke-static {v8}, Lorg/spongycastle/crypto/tls/TlsUtils;->isTLSv12(Lorg/spongycastle/crypto/tls/TlsContext;)Z

    move-result v8

    if-eqz v8, :cond_68

    .line 498
    iget-object v8, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->certificateRequest:Lorg/spongycastle/crypto/tls/CertificateRequest;

    invoke-virtual {v8}, Lorg/spongycastle/crypto/tls/CertificateRequest;->getSupportedSignatureAlgorithms()Ljava/util/Vector;

    move-result-object v8

    invoke-static {v8, v5}, Lorg/spongycastle/crypto/tls/TlsUtils;->verifySupportedSignatureAlgorithm(Ljava/util/Vector;Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;)V

    .line 499
    iget-object v8, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->prepareFinishHash:Lorg/spongycastle/crypto/tls/TlsHandshakeHash;

    invoke-virtual {v5}, Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;->getHash()S

    move-result v9

    invoke-interface {v8, v9}, Lorg/spongycastle/crypto/tls/TlsHandshakeHash;->getFinalHash(S)[B

    move-result-object v2

    .line 506
    .local v2, "hash":[B
    :goto_38
    iget-object v8, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->peerCertificate:Lorg/spongycastle/crypto/tls/Certificate;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Lorg/spongycastle/crypto/tls/Certificate;->getCertificateAt(I)Lorg/spongycastle/asn1/x509/Certificate;

    move-result-object v7

    .line 507
    .local v7, "x509Cert":Lorg/spongycastle/asn1/x509/Certificate;
    invoke-virtual {v7}, Lorg/spongycastle/asn1/x509/Certificate;->getSubjectPublicKeyInfo()Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;

    move-result-object v3

    .line 508
    .local v3, "keyInfo":Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;
    invoke-static {v3}, Lorg/spongycastle/crypto/util/PublicKeyFactory;->createKey(Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;)Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    move-result-object v4

    .line 510
    .local v4, "publicKey":Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;
    iget-short v8, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->clientCertificateType:S

    invoke-static {v8}, Lorg/spongycastle/crypto/tls/TlsUtils;->createTlsSigner(S)Lorg/spongycastle/crypto/tls/TlsSigner;

    move-result-object v6

    .line 511
    .local v6, "tlsSigner":Lorg/spongycastle/crypto/tls/TlsSigner;
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->getContext()Lorg/spongycastle/crypto/tls/TlsContext;

    move-result-object v8

    invoke-interface {v6, v8}, Lorg/spongycastle/crypto/tls/TlsSigner;->init(Lorg/spongycastle/crypto/tls/TlsContext;)V

    .line 512
    invoke-virtual {v0}, Lorg/spongycastle/crypto/tls/DigitallySigned;->getSignature()[B

    move-result-object v8

    invoke-interface {v6, v5, v8, v4, v2}, Lorg/spongycastle/crypto/tls/TlsSigner;->verifyRawSignature(Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;[BLorg/spongycastle/crypto/params/AsymmetricKeyParameter;[B)Z

    move-result v8

    if-nez v8, :cond_76

    .line 514
    new-instance v8, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v9, 0x33

    invoke-direct {v8, v9}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v8
    :try_end_66
    .catch Lorg/spongycastle/crypto/tls/TlsFatalAlert; {:try_start_17 .. :try_end_66} :catch_66
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_66} :catch_6f

    .line 517
    .end local v2    # "hash":[B
    .end local v3    # "keyInfo":Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;
    .end local v4    # "publicKey":Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;
    .end local v5    # "signatureAlgorithm":Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;
    .end local v6    # "tlsSigner":Lorg/spongycastle/crypto/tls/TlsSigner;
    .end local v7    # "x509Cert":Lorg/spongycastle/asn1/x509/Certificate;
    :catch_66
    move-exception v1

    .line 519
    .local v1, "e":Lorg/spongycastle/crypto/tls/TlsFatalAlert;
    throw v1

    .line 503
    .end local v1    # "e":Lorg/spongycastle/crypto/tls/TlsFatalAlert;
    .restart local v5    # "signatureAlgorithm":Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;
    :cond_68
    :try_start_68
    iget-object v8, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->securityParameters:Lorg/spongycastle/crypto/tls/SecurityParameters;

    invoke-virtual {v8}, Lorg/spongycastle/crypto/tls/SecurityParameters;->getSessionHash()[B
    :try_end_6d
    .catch Lorg/spongycastle/crypto/tls/TlsFatalAlert; {:try_start_68 .. :try_end_6d} :catch_66
    .catch Ljava/lang/Exception; {:try_start_68 .. :try_end_6d} :catch_6f

    move-result-object v2

    .restart local v2    # "hash":[B
    goto :goto_38

    .line 521
    .end local v2    # "hash":[B
    .end local v5    # "signatureAlgorithm":Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;
    :catch_6f
    move-exception v1

    .line 523
    .local v1, "e":Ljava/lang/Exception;
    new-instance v8, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    invoke-direct {v8, v10, v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(SLjava/lang/Throwable;)V

    throw v8

    .line 525
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v2    # "hash":[B
    .restart local v3    # "keyInfo":Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;
    .restart local v4    # "publicKey":Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;
    .restart local v5    # "signatureAlgorithm":Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;
    .restart local v6    # "tlsSigner":Lorg/spongycastle/crypto/tls/TlsSigner;
    .restart local v7    # "x509Cert":Lorg/spongycastle/asn1/x509/Certificate;
    :cond_76
    return-void
.end method

.method protected receiveClientHelloMessage(Ljava/io/ByteArrayInputStream;)V
    .registers 12
    .param p1, "buf"    # Ljava/io/ByteArrayInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v8, 0x20

    const/16 v7, 0x2f

    const/4 v9, 0x1

    .line 530
    invoke-static {p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->readVersion(Ljava/io/InputStream;)Lorg/spongycastle/crypto/tls/ProtocolVersion;

    move-result-object v2

    .line 531
    .local v2, "client_version":Lorg/spongycastle/crypto/tls/ProtocolVersion;
    iget-object v6, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->recordStream:Lorg/spongycastle/crypto/tls/RecordStream;

    invoke-virtual {v6, v2}, Lorg/spongycastle/crypto/tls/RecordStream;->setWriteVersion(Lorg/spongycastle/crypto/tls/ProtocolVersion;)V

    .line 533
    invoke-virtual {v2}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->isDTLS()Z

    move-result v6

    if-eqz v6, :cond_1a

    .line 535
    new-instance v6, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    invoke-direct {v6, v7}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v6

    .line 538
    :cond_1a
    invoke-static {v8, p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->readFully(ILjava/io/InputStream;)[B

    move-result-object v1

    .line 544
    .local v1, "client_random":[B
    invoke-static {p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->readOpaque8(Ljava/io/InputStream;)[B

    move-result-object v5

    .line 545
    .local v5, "sessionID":[B
    array-length v6, v5

    if-le v6, v8, :cond_2b

    .line 547
    new-instance v6, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    invoke-direct {v6, v7}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v6

    .line 555
    :cond_2b
    invoke-static {p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint16(Ljava/io/InputStream;)I

    move-result v0

    .line 556
    .local v0, "cipher_suites_length":I
    const/4 v6, 0x2

    if-lt v0, v6, :cond_36

    and-int/lit8 v6, v0, 0x1

    if-eqz v6, :cond_3e

    .line 558
    :cond_36
    new-instance v6, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v7, 0x32

    invoke-direct {v6, v7}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v6

    .line 560
    :cond_3e
    div-int/lit8 v6, v0, 0x2

    invoke-static {v6, p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint16Array(ILjava/io/InputStream;)[I

    move-result-object v6

    iput-object v6, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->offeredCipherSuites:[I

    .line 566
    invoke-static {p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint8(Ljava/io/InputStream;)S

    move-result v3

    .line 567
    .local v3, "compression_methods_length":I
    if-ge v3, v9, :cond_52

    .line 569
    new-instance v6, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    invoke-direct {v6, v7}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v6

    .line 571
    :cond_52
    invoke-static {v3, p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint8Array(ILjava/io/InputStream;)[S

    move-result-object v6

    iput-object v6, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->offeredCompressionMethods:[S

    .line 578
    invoke-static {p1}, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->readExtensions(Ljava/io/ByteArrayInputStream;)Ljava/util/Hashtable;

    move-result-object v6

    iput-object v6, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->clientExtensions:Ljava/util/Hashtable;

    .line 586
    iget-object v6, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->securityParameters:Lorg/spongycastle/crypto/tls/SecurityParameters;

    iget-object v7, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->clientExtensions:Ljava/util/Hashtable;

    invoke-static {v7}, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->hasExtendedMasterSecretExtension(Ljava/util/Hashtable;)Z

    move-result v7

    iput-boolean v7, v6, Lorg/spongycastle/crypto/tls/SecurityParameters;->extendedMasterSecret:Z

    .line 588
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->getContextAdmin()Lorg/spongycastle/crypto/tls/AbstractTlsContext;

    move-result-object v6

    invoke-virtual {v6, v2}, Lorg/spongycastle/crypto/tls/AbstractTlsContext;->setClientVersion(Lorg/spongycastle/crypto/tls/ProtocolVersion;)V

    .line 590
    iget-object v6, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->tlsServer:Lorg/spongycastle/crypto/tls/TlsServer;

    invoke-interface {v6, v2}, Lorg/spongycastle/crypto/tls/TlsServer;->notifyClientVersion(Lorg/spongycastle/crypto/tls/ProtocolVersion;)V

    .line 591
    iget-object v6, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->tlsServer:Lorg/spongycastle/crypto/tls/TlsServer;

    iget-object v7, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->offeredCipherSuites:[I

    const/16 v8, 0x5600

    invoke-static {v7, v8}, Lorg/spongycastle/util/Arrays;->contains([II)Z

    move-result v7

    invoke-interface {v6, v7}, Lorg/spongycastle/crypto/tls/TlsServer;->notifyFallback(Z)V

    .line 593
    iget-object v6, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->securityParameters:Lorg/spongycastle/crypto/tls/SecurityParameters;

    iput-object v1, v6, Lorg/spongycastle/crypto/tls/SecurityParameters;->clientRandom:[B

    .line 595
    iget-object v6, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->tlsServer:Lorg/spongycastle/crypto/tls/TlsServer;

    iget-object v7, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->offeredCipherSuites:[I

    invoke-interface {v6, v7}, Lorg/spongycastle/crypto/tls/TlsServer;->notifyOfferedCipherSuites([I)V

    .line 596
    iget-object v6, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->tlsServer:Lorg/spongycastle/crypto/tls/TlsServer;

    iget-object v7, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->offeredCompressionMethods:[S

    invoke-interface {v6, v7}, Lorg/spongycastle/crypto/tls/TlsServer;->notifyOfferedCompressionMethods([S)V

    .line 613
    iget-object v6, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->offeredCipherSuites:[I

    const/16 v7, 0xff

    invoke-static {v6, v7}, Lorg/spongycastle/util/Arrays;->contains([II)Z

    move-result v6

    if-eqz v6, :cond_9f

    .line 615
    iput-boolean v9, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->secure_renegotiation:Z

    .line 622
    :cond_9f
    iget-object v6, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->clientExtensions:Ljava/util/Hashtable;

    sget-object v7, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->EXT_RenegotiationInfo:Ljava/lang/Integer;

    invoke-static {v6, v7}, Lorg/spongycastle/crypto/tls/TlsUtils;->getExtensionData(Ljava/util/Hashtable;Ljava/lang/Integer;)[B

    move-result-object v4

    .line 623
    .local v4, "renegExtData":[B
    if-eqz v4, :cond_bf

    .line 630
    iput-boolean v9, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->secure_renegotiation:Z

    .line 632
    sget-object v6, Lorg/spongycastle/crypto/tls/TlsUtils;->EMPTY_BYTES:[B

    invoke-static {v6}, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->createRenegotiationInfo([B)[B

    move-result-object v6

    invoke-static {v4, v6}, Lorg/spongycastle/util/Arrays;->constantTimeAreEqual([B[B)Z

    move-result v6

    if-nez v6, :cond_bf

    .line 634
    new-instance v6, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v7, 0x28

    invoke-direct {v6, v7}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v6

    .line 639
    :cond_bf
    iget-object v6, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->tlsServer:Lorg/spongycastle/crypto/tls/TlsServer;

    iget-boolean v7, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->secure_renegotiation:Z

    invoke-interface {v6, v7}, Lorg/spongycastle/crypto/tls/TlsServer;->notifySecureRenegotiation(Z)V

    .line 641
    iget-object v6, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->clientExtensions:Ljava/util/Hashtable;

    if-eqz v6, :cond_d1

    .line 643
    iget-object v6, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->tlsServer:Lorg/spongycastle/crypto/tls/TlsServer;

    iget-object v7, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->clientExtensions:Ljava/util/Hashtable;

    invoke-interface {v6, v7}, Lorg/spongycastle/crypto/tls/TlsServer;->processClientExtensions(Ljava/util/Hashtable;)V

    .line 645
    :cond_d1
    return-void
.end method

.method protected receiveClientKeyExchangeMessage(Ljava/io/ByteArrayInputStream;)V
    .registers 6
    .param p1, "buf"    # Ljava/io/ByteArrayInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 650
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->keyExchange:Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    invoke-interface {v0, p1}, Lorg/spongycastle/crypto/tls/TlsKeyExchange;->processClientKeyExchange(Ljava/io/InputStream;)V

    .line 652
    invoke-static {p1}, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->assertEmpty(Ljava/io/ByteArrayInputStream;)V

    .line 654
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->recordStream:Lorg/spongycastle/crypto/tls/RecordStream;

    invoke-virtual {v0}, Lorg/spongycastle/crypto/tls/RecordStream;->prepareToFinish()Lorg/spongycastle/crypto/tls/TlsHandshakeHash;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->prepareFinishHash:Lorg/spongycastle/crypto/tls/TlsHandshakeHash;

    .line 655
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->securityParameters:Lorg/spongycastle/crypto/tls/SecurityParameters;

    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->getContext()Lorg/spongycastle/crypto/tls/TlsContext;

    move-result-object v1

    iget-object v2, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->prepareFinishHash:Lorg/spongycastle/crypto/tls/TlsHandshakeHash;

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->getCurrentPRFHash(Lorg/spongycastle/crypto/tls/TlsContext;Lorg/spongycastle/crypto/tls/TlsHandshakeHash;[B)[B

    move-result-object v1

    iput-object v1, v0, Lorg/spongycastle/crypto/tls/SecurityParameters;->sessionHash:[B

    .line 657
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->getContext()Lorg/spongycastle/crypto/tls/TlsContext;

    move-result-object v0

    iget-object v1, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->keyExchange:Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    invoke-static {v0, v1}, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->establishMasterSecret(Lorg/spongycastle/crypto/tls/TlsContext;Lorg/spongycastle/crypto/tls/TlsKeyExchange;)V

    .line 658
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->recordStream:Lorg/spongycastle/crypto/tls/RecordStream;

    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->getPeer()Lorg/spongycastle/crypto/tls/TlsPeer;

    move-result-object v1

    invoke-interface {v1}, Lorg/spongycastle/crypto/tls/TlsPeer;->getCompression()Lorg/spongycastle/crypto/tls/TlsCompression;

    move-result-object v1

    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->getPeer()Lorg/spongycastle/crypto/tls/TlsPeer;

    move-result-object v2

    invoke-interface {v2}, Lorg/spongycastle/crypto/tls/TlsPeer;->getCipher()Lorg/spongycastle/crypto/tls/TlsCipher;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/spongycastle/crypto/tls/RecordStream;->setPendingConnectionState(Lorg/spongycastle/crypto/tls/TlsCompression;Lorg/spongycastle/crypto/tls/TlsCipher;)V

    .line 660
    iget-boolean v0, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->expectSessionTicket:Z

    if-nez v0, :cond_44

    .line 662
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->sendChangeCipherSpecMessage()V

    .line 664
    :cond_44
    return-void
.end method

.method protected sendCertificateRequestMessage(Lorg/spongycastle/crypto/tls/CertificateRequest;)V
    .registers 4
    .param p1, "certificateRequest"    # Lorg/spongycastle/crypto/tls/CertificateRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 669
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsProtocol$HandshakeMessage;

    const/16 v1, 0xd

    invoke-direct {v0, p0, v1}, Lorg/spongycastle/crypto/tls/TlsProtocol$HandshakeMessage;-><init>(Lorg/spongycastle/crypto/tls/TlsProtocol;S)V

    .line 671
    .local v0, "message":Lorg/spongycastle/crypto/tls/TlsProtocol$HandshakeMessage;
    invoke-virtual {p1, v0}, Lorg/spongycastle/crypto/tls/CertificateRequest;->encode(Ljava/io/OutputStream;)V

    .line 673
    invoke-virtual {v0}, Lorg/spongycastle/crypto/tls/TlsProtocol$HandshakeMessage;->writeToRecordStream()V

    .line 674
    return-void
.end method

.method protected sendCertificateStatusMessage(Lorg/spongycastle/crypto/tls/CertificateStatus;)V
    .registers 4
    .param p1, "certificateStatus"    # Lorg/spongycastle/crypto/tls/CertificateStatus;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 679
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsProtocol$HandshakeMessage;

    const/16 v1, 0x16

    invoke-direct {v0, p0, v1}, Lorg/spongycastle/crypto/tls/TlsProtocol$HandshakeMessage;-><init>(Lorg/spongycastle/crypto/tls/TlsProtocol;S)V

    .line 681
    .local v0, "message":Lorg/spongycastle/crypto/tls/TlsProtocol$HandshakeMessage;
    invoke-virtual {p1, v0}, Lorg/spongycastle/crypto/tls/CertificateStatus;->encode(Ljava/io/OutputStream;)V

    .line 683
    invoke-virtual {v0}, Lorg/spongycastle/crypto/tls/TlsProtocol$HandshakeMessage;->writeToRecordStream()V

    .line 684
    return-void
.end method

.method protected sendNewSessionTicketMessage(Lorg/spongycastle/crypto/tls/NewSessionTicket;)V
    .registers 5
    .param p1, "newSessionTicket"    # Lorg/spongycastle/crypto/tls/NewSessionTicket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 689
    if-nez p1, :cond_a

    .line 691
    new-instance v1, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v2, 0x50

    invoke-direct {v1, v2}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v1

    .line 694
    :cond_a
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsProtocol$HandshakeMessage;

    const/4 v1, 0x4

    invoke-direct {v0, p0, v1}, Lorg/spongycastle/crypto/tls/TlsProtocol$HandshakeMessage;-><init>(Lorg/spongycastle/crypto/tls/TlsProtocol;S)V

    .line 696
    .local v0, "message":Lorg/spongycastle/crypto/tls/TlsProtocol$HandshakeMessage;
    invoke-virtual {p1, v0}, Lorg/spongycastle/crypto/tls/NewSessionTicket;->encode(Ljava/io/OutputStream;)V

    .line 698
    invoke-virtual {v0}, Lorg/spongycastle/crypto/tls/TlsProtocol$HandshakeMessage;->writeToRecordStream()V

    .line 699
    return-void
.end method

.method protected sendServerHelloDoneMessage()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 830
    const/4 v1, 0x4

    new-array v0, v1, [B

    .line 831
    .local v0, "message":[B
    const/16 v1, 0xe

    invoke-static {v1, v0, v2}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint8(S[BI)V

    .line 832
    const/4 v1, 0x1

    invoke-static {v2, v0, v1}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint24(I[BI)V

    .line 834
    array-length v1, v0

    invoke-virtual {p0, v0, v2, v1}, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->writeHandshakeMessage([BII)V

    .line 835
    return-void
.end method

.method protected sendServerHelloMessage()V
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x1

    const/16 v11, 0x50

    .line 704
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsProtocol$HandshakeMessage;

    const/4 v6, 0x2

    invoke-direct {v0, p0, v6}, Lorg/spongycastle/crypto/tls/TlsProtocol$HandshakeMessage;-><init>(Lorg/spongycastle/crypto/tls/TlsProtocol;S)V

    .line 707
    .local v0, "message":Lorg/spongycastle/crypto/tls/TlsProtocol$HandshakeMessage;
    iget-object v6, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->tlsServer:Lorg/spongycastle/crypto/tls/TlsServer;

    invoke-interface {v6}, Lorg/spongycastle/crypto/tls/TlsServer;->getServerVersion()Lorg/spongycastle/crypto/tls/ProtocolVersion;

    move-result-object v5

    .line 708
    .local v5, "server_version":Lorg/spongycastle/crypto/tls/ProtocolVersion;
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->getContext()Lorg/spongycastle/crypto/tls/TlsContext;

    move-result-object v6

    invoke-interface {v6}, Lorg/spongycastle/crypto/tls/TlsContext;->getClientVersion()Lorg/spongycastle/crypto/tls/ProtocolVersion;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->isEqualOrEarlierVersionOf(Lorg/spongycastle/crypto/tls/ProtocolVersion;)Z

    move-result v6

    if-nez v6, :cond_24

    .line 710
    new-instance v6, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    invoke-direct {v6, v11}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v6

    .line 713
    :cond_24
    iget-object v6, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->recordStream:Lorg/spongycastle/crypto/tls/RecordStream;

    invoke-virtual {v6, v5}, Lorg/spongycastle/crypto/tls/RecordStream;->setReadVersion(Lorg/spongycastle/crypto/tls/ProtocolVersion;)V

    .line 714
    iget-object v6, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->recordStream:Lorg/spongycastle/crypto/tls/RecordStream;

    invoke-virtual {v6, v5}, Lorg/spongycastle/crypto/tls/RecordStream;->setWriteVersion(Lorg/spongycastle/crypto/tls/ProtocolVersion;)V

    .line 715
    iget-object v6, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->recordStream:Lorg/spongycastle/crypto/tls/RecordStream;

    invoke-virtual {v6, v7}, Lorg/spongycastle/crypto/tls/RecordStream;->setRestrictReadVersion(Z)V

    .line 716
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->getContextAdmin()Lorg/spongycastle/crypto/tls/AbstractTlsContext;

    move-result-object v6

    invoke-virtual {v6, v5}, Lorg/spongycastle/crypto/tls/AbstractTlsContext;->setServerVersion(Lorg/spongycastle/crypto/tls/ProtocolVersion;)V

    .line 718
    invoke-static {v5, v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeVersion(Lorg/spongycastle/crypto/tls/ProtocolVersion;Ljava/io/OutputStream;)V

    .line 721
    iget-object v6, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->securityParameters:Lorg/spongycastle/crypto/tls/SecurityParameters;

    iget-object v6, v6, Lorg/spongycastle/crypto/tls/SecurityParameters;->serverRandom:[B

    invoke-virtual {v0, v6}, Lorg/spongycastle/crypto/tls/TlsProtocol$HandshakeMessage;->write([B)V

    .line 727
    sget-object v6, Lorg/spongycastle/crypto/tls/TlsUtils;->EMPTY_BYTES:[B

    invoke-static {v6, v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeOpaque8([BLjava/io/OutputStream;)V

    .line 729
    iget-object v6, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->tlsServer:Lorg/spongycastle/crypto/tls/TlsServer;

    invoke-interface {v6}, Lorg/spongycastle/crypto/tls/TlsServer;->getSelectedCipherSuite()I

    move-result v3

    .line 730
    .local v3, "selectedCipherSuite":I
    iget-object v6, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->offeredCipherSuites:[I

    invoke-static {v6, v3}, Lorg/spongycastle/util/Arrays;->contains([II)Z

    move-result v6

    if-eqz v6, :cond_6d

    if-eqz v3, :cond_6d

    .line 732
    invoke-static {v3}, Lorg/spongycastle/crypto/tls/CipherSuite;->isSCSV(I)Z

    move-result v6

    if-nez v6, :cond_6d

    .line 733
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->getContext()Lorg/spongycastle/crypto/tls/TlsContext;

    move-result-object v6

    invoke-interface {v6}, Lorg/spongycastle/crypto/tls/TlsContext;->getServerVersion()Lorg/spongycastle/crypto/tls/ProtocolVersion;

    move-result-object v6

    invoke-static {v3, v6}, Lorg/spongycastle/crypto/tls/TlsUtils;->isValidCipherSuiteForVersion(ILorg/spongycastle/crypto/tls/ProtocolVersion;)Z

    move-result v6

    if-nez v6, :cond_73

    .line 735
    :cond_6d
    new-instance v6, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    invoke-direct {v6, v11}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v6

    .line 737
    :cond_73
    iget-object v6, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->securityParameters:Lorg/spongycastle/crypto/tls/SecurityParameters;

    iput v3, v6, Lorg/spongycastle/crypto/tls/SecurityParameters;->cipherSuite:I

    .line 739
    iget-object v6, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->tlsServer:Lorg/spongycastle/crypto/tls/TlsServer;

    invoke-interface {v6}, Lorg/spongycastle/crypto/tls/TlsServer;->getSelectedCompressionMethod()S

    move-result v4

    .line 740
    .local v4, "selectedCompressionMethod":S
    iget-object v6, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->offeredCompressionMethods:[S

    invoke-static {v6, v4}, Lorg/spongycastle/util/Arrays;->contains([SS)Z

    move-result v6

    if-nez v6, :cond_8b

    .line 742
    new-instance v6, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    invoke-direct {v6, v11}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v6

    .line 744
    :cond_8b
    iget-object v6, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->securityParameters:Lorg/spongycastle/crypto/tls/SecurityParameters;

    iput-short v4, v6, Lorg/spongycastle/crypto/tls/SecurityParameters;->compressionAlgorithm:S

    .line 746
    invoke-static {v3, v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint16(ILjava/io/OutputStream;)V

    .line 747
    invoke-static {v4, v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint8(SLjava/io/OutputStream;)V

    .line 749
    iget-object v6, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->tlsServer:Lorg/spongycastle/crypto/tls/TlsServer;

    invoke-interface {v6}, Lorg/spongycastle/crypto/tls/TlsServer;->getServerExtensions()Ljava/util/Hashtable;

    move-result-object v6

    iput-object v6, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->serverExtensions:Ljava/util/Hashtable;

    .line 754
    iget-boolean v6, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->secure_renegotiation:Z

    if-eqz v6, :cond_c3

    .line 756
    iget-object v6, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->serverExtensions:Ljava/util/Hashtable;

    sget-object v9, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->EXT_RenegotiationInfo:Ljava/lang/Integer;

    invoke-static {v6, v9}, Lorg/spongycastle/crypto/tls/TlsUtils;->getExtensionData(Ljava/util/Hashtable;Ljava/lang/Integer;)[B

    move-result-object v2

    .line 757
    .local v2, "renegExtData":[B
    if-nez v2, :cond_13f

    move v1, v7

    .line 759
    .local v1, "noRenegExt":Z
    :goto_ac
    if-eqz v1, :cond_c3

    .line 773
    iget-object v6, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->serverExtensions:Ljava/util/Hashtable;

    invoke-static {v6}, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->ensureExtensionsInitialised(Ljava/util/Hashtable;)Ljava/util/Hashtable;

    move-result-object v6

    iput-object v6, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->serverExtensions:Ljava/util/Hashtable;

    .line 774
    iget-object v6, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->serverExtensions:Ljava/util/Hashtable;

    sget-object v9, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->EXT_RenegotiationInfo:Ljava/lang/Integer;

    sget-object v10, Lorg/spongycastle/crypto/tls/TlsUtils;->EMPTY_BYTES:[B

    invoke-static {v10}, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->createRenegotiationInfo([B)[B

    move-result-object v10

    invoke-virtual {v6, v9, v10}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 778
    .end local v1    # "noRenegExt":Z
    .end local v2    # "renegExtData":[B
    :cond_c3
    iget-object v6, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->securityParameters:Lorg/spongycastle/crypto/tls/SecurityParameters;

    iget-boolean v6, v6, Lorg/spongycastle/crypto/tls/SecurityParameters;->extendedMasterSecret:Z

    if-eqz v6, :cond_d6

    .line 780
    iget-object v6, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->serverExtensions:Ljava/util/Hashtable;

    invoke-static {v6}, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->ensureExtensionsInitialised(Ljava/util/Hashtable;)Ljava/util/Hashtable;

    move-result-object v6

    iput-object v6, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->serverExtensions:Ljava/util/Hashtable;

    .line 781
    iget-object v6, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->serverExtensions:Ljava/util/Hashtable;

    invoke-static {v6}, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->addExtendedMasterSecretExtension(Ljava/util/Hashtable;)V

    .line 790
    :cond_d6
    iget-object v6, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->serverExtensions:Ljava/util/Hashtable;

    if-eqz v6, :cond_120

    .line 792
    iget-object v6, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->securityParameters:Lorg/spongycastle/crypto/tls/SecurityParameters;

    iget-object v9, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->serverExtensions:Ljava/util/Hashtable;

    invoke-static {v9}, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->hasEncryptThenMACExtension(Ljava/util/Hashtable;)Z

    move-result v9

    iput-boolean v9, v6, Lorg/spongycastle/crypto/tls/SecurityParameters;->encryptThenMAC:Z

    .line 794
    iget-object v6, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->securityParameters:Lorg/spongycastle/crypto/tls/SecurityParameters;

    iget-object v9, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->clientExtensions:Ljava/util/Hashtable;

    iget-object v10, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->serverExtensions:Ljava/util/Hashtable;

    invoke-virtual {p0, v9, v10, v11}, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->processMaxFragmentLengthExtension(Ljava/util/Hashtable;Ljava/util/Hashtable;S)S

    move-result v9

    iput-short v9, v6, Lorg/spongycastle/crypto/tls/SecurityParameters;->maxFragmentLength:S

    .line 797
    iget-object v6, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->securityParameters:Lorg/spongycastle/crypto/tls/SecurityParameters;

    iget-object v9, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->serverExtensions:Ljava/util/Hashtable;

    invoke-static {v9}, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->hasTruncatedHMacExtension(Ljava/util/Hashtable;)Z

    move-result v9

    iput-boolean v9, v6, Lorg/spongycastle/crypto/tls/SecurityParameters;->truncatedHMac:Z

    .line 803
    iget-boolean v6, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->resumedSession:Z

    if-nez v6, :cond_142

    iget-object v6, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->serverExtensions:Ljava/util/Hashtable;

    sget-object v9, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->EXT_status_request:Ljava/lang/Integer;

    .line 804
    invoke-static {v6, v9, v11}, Lorg/spongycastle/crypto/tls/TlsUtils;->hasExpectedEmptyExtensionData(Ljava/util/Hashtable;Ljava/lang/Integer;S)Z

    move-result v6

    if-eqz v6, :cond_142

    move v6, v7

    :goto_109
    iput-boolean v6, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->allowCertificateStatus:Z

    .line 807
    iget-boolean v6, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->resumedSession:Z

    if-nez v6, :cond_144

    iget-object v6, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->serverExtensions:Ljava/util/Hashtable;

    sget-object v9, Lorg/spongycastle/crypto/tls/TlsProtocol;->EXT_SessionTicket:Ljava/lang/Integer;

    .line 808
    invoke-static {v6, v9, v11}, Lorg/spongycastle/crypto/tls/TlsUtils;->hasExpectedEmptyExtensionData(Ljava/util/Hashtable;Ljava/lang/Integer;S)Z

    move-result v6

    if-eqz v6, :cond_144

    :goto_119
    iput-boolean v7, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->expectSessionTicket:Z

    .line 811
    iget-object v6, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->serverExtensions:Ljava/util/Hashtable;

    invoke-static {v0, v6}, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->writeExtensions(Ljava/io/OutputStream;Ljava/util/Hashtable;)V

    .line 814
    :cond_120
    iget-object v6, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->securityParameters:Lorg/spongycastle/crypto/tls/SecurityParameters;

    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->getContext()Lorg/spongycastle/crypto/tls/TlsContext;

    move-result-object v7

    iget-object v8, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->securityParameters:Lorg/spongycastle/crypto/tls/SecurityParameters;

    invoke-virtual {v8}, Lorg/spongycastle/crypto/tls/SecurityParameters;->getCipherSuite()I

    move-result v8

    invoke-static {v7, v8}, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->getPRFAlgorithm(Lorg/spongycastle/crypto/tls/TlsContext;I)I

    move-result v7

    iput v7, v6, Lorg/spongycastle/crypto/tls/SecurityParameters;->prfAlgorithm:I

    .line 820
    iget-object v6, p0, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->securityParameters:Lorg/spongycastle/crypto/tls/SecurityParameters;

    const/16 v7, 0xc

    iput v7, v6, Lorg/spongycastle/crypto/tls/SecurityParameters;->verifyDataLength:I

    .line 822
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsServerProtocol;->applyMaxFragmentLengthExtension()V

    .line 824
    invoke-virtual {v0}, Lorg/spongycastle/crypto/tls/TlsProtocol$HandshakeMessage;->writeToRecordStream()V

    .line 825
    return-void

    .restart local v2    # "renegExtData":[B
    :cond_13f
    move v1, v8

    .line 757
    goto/16 :goto_ac

    .end local v2    # "renegExtData":[B
    :cond_142
    move v6, v8

    .line 804
    goto :goto_109

    :cond_144
    move v7, v8

    .line 808
    goto :goto_119
.end method

.method protected sendServerKeyExchangeMessage([B)V
    .registers 5
    .param p1, "serverKeyExchange"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 840
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsProtocol$HandshakeMessage;

    const/16 v1, 0xc

    array-length v2, p1

    invoke-direct {v0, p0, v1, v2}, Lorg/spongycastle/crypto/tls/TlsProtocol$HandshakeMessage;-><init>(Lorg/spongycastle/crypto/tls/TlsProtocol;SI)V

    .line 842
    .local v0, "message":Lorg/spongycastle/crypto/tls/TlsProtocol$HandshakeMessage;
    invoke-virtual {v0, p1}, Lorg/spongycastle/crypto/tls/TlsProtocol$HandshakeMessage;->write([B)V

    .line 844
    invoke-virtual {v0}, Lorg/spongycastle/crypto/tls/TlsProtocol$HandshakeMessage;->writeToRecordStream()V

    .line 845
    return-void
.end method
