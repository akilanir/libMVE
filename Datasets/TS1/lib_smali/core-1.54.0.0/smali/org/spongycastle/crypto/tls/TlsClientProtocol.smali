.class public Lorg/spongycastle/crypto/tls/TlsClientProtocol;
.super Lorg/spongycastle/crypto/tls/TlsProtocol;
.source "TlsClientProtocol.java"


# instance fields
.field protected authentication:Lorg/spongycastle/crypto/tls/TlsAuthentication;

.field protected certificateRequest:Lorg/spongycastle/crypto/tls/CertificateRequest;

.field protected certificateStatus:Lorg/spongycastle/crypto/tls/CertificateStatus;

.field protected keyExchange:Lorg/spongycastle/crypto/tls/TlsKeyExchange;

.field protected selectedSessionID:[B

.field protected tlsClient:Lorg/spongycastle/crypto/tls/TlsClient;

.field tlsClientContext:Lorg/spongycastle/crypto/tls/TlsClientContextImpl;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;Ljava/io/OutputStream;Ljava/security/SecureRandom;)V
    .registers 5
    .param p1, "input"    # Ljava/io/InputStream;
    .param p2, "output"    # Ljava/io/OutputStream;
    .param p3, "secureRandom"    # Ljava/security/SecureRandom;

    .prologue
    const/4 v0, 0x0

    .line 36
    invoke-direct {p0, p1, p2, p3}, Lorg/spongycastle/crypto/tls/TlsProtocol;-><init>(Ljava/io/InputStream;Ljava/io/OutputStream;Ljava/security/SecureRandom;)V

    .line 17
    iput-object v0, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->tlsClient:Lorg/spongycastle/crypto/tls/TlsClient;

    .line 18
    iput-object v0, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->tlsClientContext:Lorg/spongycastle/crypto/tls/TlsClientContextImpl;

    .line 20
    iput-object v0, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->selectedSessionID:[B

    .line 22
    iput-object v0, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->keyExchange:Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    .line 23
    iput-object v0, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->authentication:Lorg/spongycastle/crypto/tls/TlsAuthentication;

    .line 25
    iput-object v0, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->certificateStatus:Lorg/spongycastle/crypto/tls/CertificateStatus;

    .line 26
    iput-object v0, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->certificateRequest:Lorg/spongycastle/crypto/tls/CertificateRequest;

    .line 37
    return-void
.end method

.method public constructor <init>(Ljava/security/SecureRandom;)V
    .registers 3
    .param p1, "secureRandom"    # Ljava/security/SecureRandom;

    .prologue
    const/4 v0, 0x0

    .line 56
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/tls/TlsProtocol;-><init>(Ljava/security/SecureRandom;)V

    .line 17
    iput-object v0, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->tlsClient:Lorg/spongycastle/crypto/tls/TlsClient;

    .line 18
    iput-object v0, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->tlsClientContext:Lorg/spongycastle/crypto/tls/TlsClientContextImpl;

    .line 20
    iput-object v0, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->selectedSessionID:[B

    .line 22
    iput-object v0, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->keyExchange:Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    .line 23
    iput-object v0, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->authentication:Lorg/spongycastle/crypto/tls/TlsAuthentication;

    .line 25
    iput-object v0, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->certificateStatus:Lorg/spongycastle/crypto/tls/CertificateStatus;

    .line 26
    iput-object v0, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->certificateRequest:Lorg/spongycastle/crypto/tls/CertificateRequest;

    .line 57
    return-void
.end method


# virtual methods
.method protected cleanupHandshake()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 112
    invoke-super {p0}, Lorg/spongycastle/crypto/tls/TlsProtocol;->cleanupHandshake()V

    .line 114
    iput-object v0, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->selectedSessionID:[B

    .line 115
    iput-object v0, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->keyExchange:Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    .line 116
    iput-object v0, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->authentication:Lorg/spongycastle/crypto/tls/TlsAuthentication;

    .line 117
    iput-object v0, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->certificateStatus:Lorg/spongycastle/crypto/tls/CertificateStatus;

    .line 118
    iput-object v0, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->certificateRequest:Lorg/spongycastle/crypto/tls/CertificateRequest;

    .line 119
    return-void
.end method

.method public connect(Lorg/spongycastle/crypto/tls/TlsClient;)V
    .registers 8
    .param p1, "tlsClient"    # Lorg/spongycastle/crypto/tls/TlsClient;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    .line 71
    if-nez p1, :cond_b

    .line 73
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "\'tlsClient\' cannot be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 75
    :cond_b
    iget-object v2, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->tlsClient:Lorg/spongycastle/crypto/tls/TlsClient;

    if-eqz v2, :cond_17

    .line 77
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "\'connect\' can only be called once"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 80
    :cond_17
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->tlsClient:Lorg/spongycastle/crypto/tls/TlsClient;

    .line 82
    new-instance v2, Lorg/spongycastle/crypto/tls/SecurityParameters;

    invoke-direct {v2}, Lorg/spongycastle/crypto/tls/SecurityParameters;-><init>()V

    iput-object v2, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->securityParameters:Lorg/spongycastle/crypto/tls/SecurityParameters;

    .line 83
    iget-object v2, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->securityParameters:Lorg/spongycastle/crypto/tls/SecurityParameters;

    iput v5, v2, Lorg/spongycastle/crypto/tls/SecurityParameters;->entity:I

    .line 85
    new-instance v2, Lorg/spongycastle/crypto/tls/TlsClientContextImpl;

    iget-object v3, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->secureRandom:Ljava/security/SecureRandom;

    iget-object v4, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->securityParameters:Lorg/spongycastle/crypto/tls/SecurityParameters;

    invoke-direct {v2, v3, v4}, Lorg/spongycastle/crypto/tls/TlsClientContextImpl;-><init>(Ljava/security/SecureRandom;Lorg/spongycastle/crypto/tls/SecurityParameters;)V

    iput-object v2, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->tlsClientContext:Lorg/spongycastle/crypto/tls/TlsClientContextImpl;

    .line 87
    iget-object v2, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->securityParameters:Lorg/spongycastle/crypto/tls/SecurityParameters;

    invoke-interface {p1}, Lorg/spongycastle/crypto/tls/TlsClient;->shouldUseGMTUnixTime()Z

    move-result v3

    iget-object v4, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->tlsClientContext:Lorg/spongycastle/crypto/tls/TlsClientContextImpl;

    .line 88
    invoke-virtual {v4}, Lorg/spongycastle/crypto/tls/TlsClientContextImpl;->getNonceRandomGenerator()Lorg/spongycastle/crypto/prng/RandomGenerator;

    move-result-object v4

    .line 87
    invoke-static {v3, v4}, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->createRandomBlock(ZLorg/spongycastle/crypto/prng/RandomGenerator;)[B

    move-result-object v3

    iput-object v3, v2, Lorg/spongycastle/crypto/tls/SecurityParameters;->clientRandom:[B

    .line 90
    iget-object v2, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->tlsClient:Lorg/spongycastle/crypto/tls/TlsClient;

    iget-object v3, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->tlsClientContext:Lorg/spongycastle/crypto/tls/TlsClientContextImpl;

    invoke-interface {v2, v3}, Lorg/spongycastle/crypto/tls/TlsClient;->init(Lorg/spongycastle/crypto/tls/TlsClientContext;)V

    .line 91
    iget-object v2, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->recordStream:Lorg/spongycastle/crypto/tls/RecordStream;

    iget-object v3, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->tlsClientContext:Lorg/spongycastle/crypto/tls/TlsClientContextImpl;

    invoke-virtual {v2, v3}, Lorg/spongycastle/crypto/tls/RecordStream;->init(Lorg/spongycastle/crypto/tls/TlsContext;)V

    .line 93
    invoke-interface {p1}, Lorg/spongycastle/crypto/tls/TlsClient;->getSessionToResume()Lorg/spongycastle/crypto/tls/TlsSession;

    move-result-object v1

    .line 94
    .local v1, "sessionToResume":Lorg/spongycastle/crypto/tls/TlsSession;
    if-eqz v1, :cond_65

    invoke-interface {v1}, Lorg/spongycastle/crypto/tls/TlsSession;->isResumable()Z

    move-result v2

    if-eqz v2, :cond_65

    .line 96
    invoke-interface {v1}, Lorg/spongycastle/crypto/tls/TlsSession;->exportSessionParameters()Lorg/spongycastle/crypto/tls/SessionParameters;

    move-result-object v0

    .line 97
    .local v0, "sessionParameters":Lorg/spongycastle/crypto/tls/SessionParameters;
    if-eqz v0, :cond_65

    .line 99
    iput-object v1, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->tlsSession:Lorg/spongycastle/crypto/tls/TlsSession;

    .line 100
    iput-object v0, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->sessionParameters:Lorg/spongycastle/crypto/tls/SessionParameters;

    .line 104
    .end local v0    # "sessionParameters":Lorg/spongycastle/crypto/tls/SessionParameters;
    :cond_65
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->sendClientHelloMessage()V

    .line 105
    iput-short v5, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->connection_state:S

    .line 107
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->blockForHandshake()V

    .line 108
    return-void
.end method

.method protected getContext()Lorg/spongycastle/crypto/tls/TlsContext;
    .registers 2

    .prologue
    .line 123
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->tlsClientContext:Lorg/spongycastle/crypto/tls/TlsClientContextImpl;

    return-object v0
.end method

.method getContextAdmin()Lorg/spongycastle/crypto/tls/AbstractTlsContext;
    .registers 2

    .prologue
    .line 128
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->tlsClientContext:Lorg/spongycastle/crypto/tls/TlsClientContextImpl;

    return-object v0
.end method

.method protected getPeer()Lorg/spongycastle/crypto/tls/TlsPeer;
    .registers 2

    .prologue
    .line 133
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->tlsClient:Lorg/spongycastle/crypto/tls/TlsClient;

    return-object v0
.end method

.method protected handleHandshakeMessage(S[B)V
    .registers 15
    .param p1, "type"    # S
    .param p2, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 139
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 141
    .local v0, "buf":Ljava/io/ByteArrayInputStream;
    iget-boolean v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->resumedSession:Z

    if-eqz v9, :cond_30

    .line 143
    const/16 v9, 0x14

    if-ne p1, v9, :cond_12

    iget-short v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->connection_state:S

    const/4 v10, 0x2

    if-eq v9, v10, :cond_1a

    .line 145
    :cond_12
    new-instance v9, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v10, 0xa

    invoke-direct {v9, v10}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v9

    .line 148
    :cond_1a
    invoke-virtual {p0, v0}, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->processFinishedMessage(Ljava/io/ByteArrayInputStream;)V

    .line 149
    const/16 v9, 0xf

    iput-short v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->connection_state:S

    .line 151
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->sendFinishedMessage()V

    .line 152
    const/16 v9, 0xd

    iput-short v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->connection_state:S

    .line 153
    const/16 v9, 0x10

    iput-short v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->connection_state:S

    .line 155
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->completeHandshake()V

    .line 564
    :cond_2f
    :goto_2f
    return-void

    .line 159
    :cond_30
    packed-switch p1, :pswitch_data_2c2

    .line 562
    :pswitch_33
    new-instance v9, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v10, 0xa

    invoke-direct {v9, v10}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v9

    .line 163
    :pswitch_3b
    iget-short v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->connection_state:S

    packed-switch v9, :pswitch_data_2f6

    .line 192
    new-instance v9, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v10, 0xa

    invoke-direct {v9, v10}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v9

    .line 167
    :pswitch_48
    const/4 v9, 0x0

    invoke-virtual {p0, v9}, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->handleSupplementalData(Ljava/util/Vector;)V

    .line 174
    :pswitch_4c
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/Certificate;->parse(Ljava/io/InputStream;)Lorg/spongycastle/crypto/tls/Certificate;

    move-result-object v9

    iput-object v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->peerCertificate:Lorg/spongycastle/crypto/tls/Certificate;

    .line 176
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->assertEmpty(Ljava/io/ByteArrayInputStream;)V

    .line 179
    iget-object v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->peerCertificate:Lorg/spongycastle/crypto/tls/Certificate;

    if-eqz v9, :cond_61

    iget-object v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->peerCertificate:Lorg/spongycastle/crypto/tls/Certificate;

    invoke-virtual {v9}, Lorg/spongycastle/crypto/tls/Certificate;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_64

    .line 181
    :cond_61
    const/4 v9, 0x0

    iput-boolean v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->allowCertificateStatus:Z

    .line 184
    :cond_64
    iget-object v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->keyExchange:Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    iget-object v10, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->peerCertificate:Lorg/spongycastle/crypto/tls/Certificate;

    invoke-interface {v9, v10}, Lorg/spongycastle/crypto/tls/TlsKeyExchange;->processServerCertificate(Lorg/spongycastle/crypto/tls/Certificate;)V

    .line 186
    iget-object v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->tlsClient:Lorg/spongycastle/crypto/tls/TlsClient;

    invoke-interface {v9}, Lorg/spongycastle/crypto/tls/TlsClient;->getAuthentication()Lorg/spongycastle/crypto/tls/TlsAuthentication;

    move-result-object v9

    iput-object v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->authentication:Lorg/spongycastle/crypto/tls/TlsAuthentication;

    .line 187
    iget-object v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->authentication:Lorg/spongycastle/crypto/tls/TlsAuthentication;

    iget-object v10, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->peerCertificate:Lorg/spongycastle/crypto/tls/Certificate;

    invoke-interface {v9, v10}, Lorg/spongycastle/crypto/tls/TlsAuthentication;->notifyServerCertificate(Lorg/spongycastle/crypto/tls/Certificate;)V

    .line 195
    const/4 v9, 0x4

    iput-short v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->connection_state:S

    goto :goto_2f

    .line 200
    :pswitch_7e
    iget-short v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->connection_state:S

    packed-switch v9, :pswitch_data_2fe

    .line 224
    new-instance v9, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v10, 0xa

    invoke-direct {v9, v10}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v9

    .line 204
    :pswitch_8b
    iget-boolean v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->allowCertificateStatus:Z

    if-nez v9, :cond_97

    .line 211
    new-instance v9, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v10, 0xa

    invoke-direct {v9, v10}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v9

    .line 214
    :cond_97
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/CertificateStatus;->parse(Ljava/io/InputStream;)Lorg/spongycastle/crypto/tls/CertificateStatus;

    move-result-object v9

    iput-object v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->certificateStatus:Lorg/spongycastle/crypto/tls/CertificateStatus;

    .line 216
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->assertEmpty(Ljava/io/ByteArrayInputStream;)V

    .line 220
    const/4 v9, 0x5

    iput-short v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->connection_state:S

    goto :goto_2f

    .line 230
    :pswitch_a4
    iget-short v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->connection_state:S

    packed-switch v9, :pswitch_data_304

    .line 255
    new-instance v9, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v10, 0xa

    invoke-direct {v9, v10}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v9

    .line 234
    :pswitch_b1
    iget-boolean v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->expectSessionTicket:Z

    if-eqz v9, :cond_bd

    .line 240
    new-instance v9, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v10, 0xa

    invoke-direct {v9, v10}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v9

    .line 247
    :cond_bd
    :pswitch_bd
    invoke-virtual {p0, v0}, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->processFinishedMessage(Ljava/io/ByteArrayInputStream;)V

    .line 248
    const/16 v9, 0xf

    iput-short v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->connection_state:S

    .line 249
    const/16 v9, 0x10

    iput-short v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->connection_state:S

    .line 251
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->completeHandshake()V

    goto/16 :goto_2f

    .line 261
    :pswitch_cd
    iget-short v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->connection_state:S

    packed-switch v9, :pswitch_data_30c

    .line 292
    new-instance v9, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v10, 0xa

    invoke-direct {v9, v10}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v9

    .line 265
    :pswitch_da
    invoke-virtual {p0, v0}, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->receiveServerHelloMessage(Ljava/io/ByteArrayInputStream;)V

    .line 266
    const/4 v9, 0x2

    iput-short v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->connection_state:S

    .line 268
    iget-object v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->recordStream:Lorg/spongycastle/crypto/tls/RecordStream;

    invoke-virtual {v9}, Lorg/spongycastle/crypto/tls/RecordStream;->notifyHelloComplete()V

    .line 270
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->applyMaxFragmentLengthExtension()V

    .line 272
    iget-boolean v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->resumedSession:Z

    if-eqz v9, :cond_114

    .line 274
    iget-object v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->securityParameters:Lorg/spongycastle/crypto/tls/SecurityParameters;

    iget-object v10, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->sessionParameters:Lorg/spongycastle/crypto/tls/SessionParameters;

    invoke-virtual {v10}, Lorg/spongycastle/crypto/tls/SessionParameters;->getMasterSecret()[B

    move-result-object v10

    invoke-static {v10}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    move-result-object v10

    iput-object v10, v9, Lorg/spongycastle/crypto/tls/SecurityParameters;->masterSecret:[B

    .line 275
    iget-object v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->recordStream:Lorg/spongycastle/crypto/tls/RecordStream;

    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->getPeer()Lorg/spongycastle/crypto/tls/TlsPeer;

    move-result-object v10

    invoke-interface {v10}, Lorg/spongycastle/crypto/tls/TlsPeer;->getCompression()Lorg/spongycastle/crypto/tls/TlsCompression;

    move-result-object v10

    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->getPeer()Lorg/spongycastle/crypto/tls/TlsPeer;

    move-result-object v11

    invoke-interface {v11}, Lorg/spongycastle/crypto/tls/TlsPeer;->getCipher()Lorg/spongycastle/crypto/tls/TlsCipher;

    move-result-object v11

    invoke-virtual {v9, v10, v11}, Lorg/spongycastle/crypto/tls/RecordStream;->setPendingConnectionState(Lorg/spongycastle/crypto/tls/TlsCompression;Lorg/spongycastle/crypto/tls/TlsCipher;)V

    .line 277
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->sendChangeCipherSpecMessage()V

    goto/16 :goto_2f

    .line 281
    :cond_114
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->invalidateSession()V

    .line 283
    iget-object v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->selectedSessionID:[B

    array-length v9, v9

    if-lez v9, :cond_2f

    .line 285
    new-instance v9, Lorg/spongycastle/crypto/tls/TlsSessionImpl;

    iget-object v10, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->selectedSessionID:[B

    const/4 v11, 0x0

    invoke-direct {v9, v10, v11}, Lorg/spongycastle/crypto/tls/TlsSessionImpl;-><init>([BLorg/spongycastle/crypto/tls/SessionParameters;)V

    iput-object v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->tlsSession:Lorg/spongycastle/crypto/tls/TlsSession;

    goto/16 :goto_2f

    .line 298
    :pswitch_128
    iget-short v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->connection_state:S

    packed-switch v9, :pswitch_data_312

    .line 306
    new-instance v9, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v10, 0xa

    invoke-direct {v9, v10}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v9

    .line 302
    :pswitch_135
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->readSupplementalDataMessage(Ljava/io/ByteArrayInputStream;)Ljava/util/Vector;

    move-result-object v9

    invoke-virtual {p0, v9}, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->handleSupplementalData(Ljava/util/Vector;)V

    goto/16 :goto_2f

    .line 312
    :pswitch_13e
    iget-short v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->connection_state:S

    packed-switch v9, :pswitch_data_318

    .line 427
    new-instance v9, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v10, 0x28

    invoke-direct {v9, v10}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v9

    .line 316
    :pswitch_14b
    const/4 v9, 0x0

    invoke-virtual {p0, v9}, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->handleSupplementalData(Ljava/util/Vector;)V

    .line 322
    :pswitch_14f
    iget-object v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->keyExchange:Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    invoke-interface {v9}, Lorg/spongycastle/crypto/tls/TlsKeyExchange;->skipServerCredentials()V

    .line 323
    const/4 v9, 0x0

    iput-object v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->authentication:Lorg/spongycastle/crypto/tls/TlsAuthentication;

    .line 331
    :pswitch_157
    iget-object v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->keyExchange:Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    invoke-interface {v9}, Lorg/spongycastle/crypto/tls/TlsKeyExchange;->skipServerKeyExchange()V

    .line 338
    :pswitch_15c
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->assertEmpty(Ljava/io/ByteArrayInputStream;)V

    .line 340
    const/16 v9, 0x8

    iput-short v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->connection_state:S

    .line 342
    iget-object v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->recordStream:Lorg/spongycastle/crypto/tls/RecordStream;

    invoke-virtual {v9}, Lorg/spongycastle/crypto/tls/RecordStream;->getHandshakeHash()Lorg/spongycastle/crypto/tls/TlsHandshakeHash;

    move-result-object v9

    invoke-interface {v9}, Lorg/spongycastle/crypto/tls/TlsHandshakeHash;->sealHashAlgorithms()V

    .line 344
    iget-object v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->tlsClient:Lorg/spongycastle/crypto/tls/TlsClient;

    invoke-interface {v9}, Lorg/spongycastle/crypto/tls/TlsClient;->getClientSupplementalData()Ljava/util/Vector;

    move-result-object v3

    .line 345
    .local v3, "clientSupplementalData":Ljava/util/Vector;
    if-eqz v3, :cond_177

    .line 347
    invoke-virtual {p0, v3}, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->sendSupplementalDataMessage(Ljava/util/Vector;)V

    .line 349
    :cond_177
    const/16 v9, 0x9

    iput-short v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->connection_state:S

    .line 351
    const/4 v2, 0x0

    .line 352
    .local v2, "clientCreds":Lorg/spongycastle/crypto/tls/TlsCredentials;
    iget-object v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->certificateRequest:Lorg/spongycastle/crypto/tls/CertificateRequest;

    if-nez v9, :cond_1f6

    .line 354
    iget-object v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->keyExchange:Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    invoke-interface {v9}, Lorg/spongycastle/crypto/tls/TlsKeyExchange;->skipClientCredentials()V

    .line 380
    :goto_185
    const/16 v9, 0xa

    iput-short v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->connection_state:S

    .line 386
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->sendClientKeyExchangeMessage()V

    .line 387
    const/16 v9, 0xb

    iput-short v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->connection_state:S

    .line 389
    iget-object v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->recordStream:Lorg/spongycastle/crypto/tls/RecordStream;

    invoke-virtual {v9}, Lorg/spongycastle/crypto/tls/RecordStream;->prepareToFinish()Lorg/spongycastle/crypto/tls/TlsHandshakeHash;

    move-result-object v5

    .line 390
    .local v5, "prepareFinishHash":Lorg/spongycastle/crypto/tls/TlsHandshakeHash;
    iget-object v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->securityParameters:Lorg/spongycastle/crypto/tls/SecurityParameters;

    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->getContext()Lorg/spongycastle/crypto/tls/TlsContext;

    move-result-object v10

    const/4 v11, 0x0

    invoke-static {v10, v5, v11}, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->getCurrentPRFHash(Lorg/spongycastle/crypto/tls/TlsContext;Lorg/spongycastle/crypto/tls/TlsHandshakeHash;[B)[B

    move-result-object v10

    iput-object v10, v9, Lorg/spongycastle/crypto/tls/SecurityParameters;->sessionHash:[B

    .line 392
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->getContext()Lorg/spongycastle/crypto/tls/TlsContext;

    move-result-object v9

    iget-object v10, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->keyExchange:Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    invoke-static {v9, v10}, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->establishMasterSecret(Lorg/spongycastle/crypto/tls/TlsContext;Lorg/spongycastle/crypto/tls/TlsKeyExchange;)V

    .line 393
    iget-object v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->recordStream:Lorg/spongycastle/crypto/tls/RecordStream;

    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->getPeer()Lorg/spongycastle/crypto/tls/TlsPeer;

    move-result-object v10

    invoke-interface {v10}, Lorg/spongycastle/crypto/tls/TlsPeer;->getCompression()Lorg/spongycastle/crypto/tls/TlsCompression;

    move-result-object v10

    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->getPeer()Lorg/spongycastle/crypto/tls/TlsPeer;

    move-result-object v11

    invoke-interface {v11}, Lorg/spongycastle/crypto/tls/TlsPeer;->getCipher()Lorg/spongycastle/crypto/tls/TlsCipher;

    move-result-object v11

    invoke-virtual {v9, v10, v11}, Lorg/spongycastle/crypto/tls/RecordStream;->setPendingConnectionState(Lorg/spongycastle/crypto/tls/TlsCompression;Lorg/spongycastle/crypto/tls/TlsCipher;)V

    .line 395
    if-eqz v2, :cond_1ea

    instance-of v9, v2, Lorg/spongycastle/crypto/tls/TlsSignerCredentials;

    if-eqz v9, :cond_1ea

    move-object v8, v2

    .line 397
    check-cast v8, Lorg/spongycastle/crypto/tls/TlsSignerCredentials;

    .line 403
    .local v8, "signerCredentials":Lorg/spongycastle/crypto/tls/TlsSignerCredentials;
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->getContext()Lorg/spongycastle/crypto/tls/TlsContext;

    move-result-object v9

    .line 402
    invoke-static {v9, v8}, Lorg/spongycastle/crypto/tls/TlsUtils;->getSignatureAndHashAlgorithm(Lorg/spongycastle/crypto/tls/TlsContext;Lorg/spongycastle/crypto/tls/TlsSignerCredentials;)Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;

    move-result-object v7

    .line 406
    .local v7, "signatureAndHashAlgorithm":Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;
    if-nez v7, :cond_21a

    .line 408
    iget-object v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->securityParameters:Lorg/spongycastle/crypto/tls/SecurityParameters;

    invoke-virtual {v9}, Lorg/spongycastle/crypto/tls/SecurityParameters;->getSessionHash()[B

    move-result-object v4

    .line 415
    .local v4, "hash":[B
    :goto_1da
    invoke-interface {v8, v4}, Lorg/spongycastle/crypto/tls/TlsSignerCredentials;->generateCertificateSignature([B)[B

    move-result-object v6

    .line 416
    .local v6, "signature":[B
    new-instance v1, Lorg/spongycastle/crypto/tls/DigitallySigned;

    invoke-direct {v1, v7, v6}, Lorg/spongycastle/crypto/tls/DigitallySigned;-><init>(Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;[B)V

    .line 417
    .local v1, "certificateVerify":Lorg/spongycastle/crypto/tls/DigitallySigned;
    invoke-virtual {p0, v1}, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->sendCertificateVerifyMessage(Lorg/spongycastle/crypto/tls/DigitallySigned;)V

    .line 419
    const/16 v9, 0xc

    iput-short v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->connection_state:S

    .line 422
    .end local v1    # "certificateVerify":Lorg/spongycastle/crypto/tls/DigitallySigned;
    .end local v4    # "hash":[B
    .end local v6    # "signature":[B
    .end local v7    # "signatureAndHashAlgorithm":Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;
    .end local v8    # "signerCredentials":Lorg/spongycastle/crypto/tls/TlsSignerCredentials;
    :cond_1ea
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->sendChangeCipherSpecMessage()V

    .line 423
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->sendFinishedMessage()V

    .line 430
    const/16 v9, 0xd

    iput-short v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->connection_state:S

    goto/16 :goto_2f

    .line 358
    .end local v5    # "prepareFinishHash":Lorg/spongycastle/crypto/tls/TlsHandshakeHash;
    :cond_1f6
    iget-object v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->authentication:Lorg/spongycastle/crypto/tls/TlsAuthentication;

    iget-object v10, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->certificateRequest:Lorg/spongycastle/crypto/tls/CertificateRequest;

    invoke-interface {v9, v10}, Lorg/spongycastle/crypto/tls/TlsAuthentication;->getClientCredentials(Lorg/spongycastle/crypto/tls/CertificateRequest;)Lorg/spongycastle/crypto/tls/TlsCredentials;

    move-result-object v2

    .line 360
    if-nez v2, :cond_20c

    .line 362
    iget-object v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->keyExchange:Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    invoke-interface {v9}, Lorg/spongycastle/crypto/tls/TlsKeyExchange;->skipClientCredentials()V

    .line 370
    sget-object v9, Lorg/spongycastle/crypto/tls/Certificate;->EMPTY_CHAIN:Lorg/spongycastle/crypto/tls/Certificate;

    invoke-virtual {p0, v9}, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->sendCertificateMessage(Lorg/spongycastle/crypto/tls/Certificate;)V

    goto/16 :goto_185

    .line 374
    :cond_20c
    iget-object v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->keyExchange:Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    invoke-interface {v9, v2}, Lorg/spongycastle/crypto/tls/TlsKeyExchange;->processClientCredentials(Lorg/spongycastle/crypto/tls/TlsCredentials;)V

    .line 376
    invoke-interface {v2}, Lorg/spongycastle/crypto/tls/TlsCredentials;->getCertificate()Lorg/spongycastle/crypto/tls/Certificate;

    move-result-object v9

    invoke-virtual {p0, v9}, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->sendCertificateMessage(Lorg/spongycastle/crypto/tls/Certificate;)V

    goto/16 :goto_185

    .line 412
    .restart local v5    # "prepareFinishHash":Lorg/spongycastle/crypto/tls/TlsHandshakeHash;
    .restart local v7    # "signatureAndHashAlgorithm":Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;
    .restart local v8    # "signerCredentials":Lorg/spongycastle/crypto/tls/TlsSignerCredentials;
    :cond_21a
    invoke-virtual {v7}, Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;->getHash()S

    move-result v9

    invoke-interface {v5, v9}, Lorg/spongycastle/crypto/tls/TlsHandshakeHash;->getFinalHash(S)[B

    move-result-object v4

    .restart local v4    # "hash":[B
    goto :goto_1da

    .line 435
    .end local v2    # "clientCreds":Lorg/spongycastle/crypto/tls/TlsCredentials;
    .end local v3    # "clientSupplementalData":Ljava/util/Vector;
    .end local v4    # "hash":[B
    .end local v5    # "prepareFinishHash":Lorg/spongycastle/crypto/tls/TlsHandshakeHash;
    .end local v7    # "signatureAndHashAlgorithm":Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;
    .end local v8    # "signerCredentials":Lorg/spongycastle/crypto/tls/TlsSignerCredentials;
    :pswitch_223
    iget-short v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->connection_state:S

    packed-switch v9, :pswitch_data_328

    .line 459
    new-instance v9, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v10, 0xa

    invoke-direct {v9, v10}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v9

    .line 439
    :pswitch_230
    const/4 v9, 0x0

    invoke-virtual {p0, v9}, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->handleSupplementalData(Ljava/util/Vector;)V

    .line 445
    :pswitch_234
    iget-object v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->keyExchange:Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    invoke-interface {v9}, Lorg/spongycastle/crypto/tls/TlsKeyExchange;->skipServerCredentials()V

    .line 446
    const/4 v9, 0x0

    iput-object v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->authentication:Lorg/spongycastle/crypto/tls/TlsAuthentication;

    .line 453
    :pswitch_23c
    iget-object v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->keyExchange:Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    invoke-interface {v9, v0}, Lorg/spongycastle/crypto/tls/TlsKeyExchange;->processServerKeyExchange(Ljava/io/InputStream;)V

    .line 455
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->assertEmpty(Ljava/io/ByteArrayInputStream;)V

    .line 462
    const/4 v9, 0x6

    iput-short v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->connection_state:S

    goto/16 :goto_2f

    .line 467
    :pswitch_249
    iget-short v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->connection_state:S

    packed-switch v9, :pswitch_data_334

    .line 504
    new-instance v9, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v10, 0xa

    invoke-direct {v9, v10}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v9

    .line 473
    :pswitch_256
    iget-object v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->keyExchange:Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    invoke-interface {v9}, Lorg/spongycastle/crypto/tls/TlsKeyExchange;->skipServerKeyExchange()V

    .line 479
    :pswitch_25b
    iget-object v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->authentication:Lorg/spongycastle/crypto/tls/TlsAuthentication;

    if-nez v9, :cond_267

    .line 485
    new-instance v9, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v10, 0x28

    invoke-direct {v9, v10}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v9

    .line 488
    :cond_267
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->getContext()Lorg/spongycastle/crypto/tls/TlsContext;

    move-result-object v9

    invoke-static {v9, v0}, Lorg/spongycastle/crypto/tls/CertificateRequest;->parse(Lorg/spongycastle/crypto/tls/TlsContext;Ljava/io/InputStream;)Lorg/spongycastle/crypto/tls/CertificateRequest;

    move-result-object v9

    iput-object v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->certificateRequest:Lorg/spongycastle/crypto/tls/CertificateRequest;

    .line 490
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->assertEmpty(Ljava/io/ByteArrayInputStream;)V

    .line 492
    iget-object v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->keyExchange:Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    iget-object v10, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->certificateRequest:Lorg/spongycastle/crypto/tls/CertificateRequest;

    invoke-interface {v9, v10}, Lorg/spongycastle/crypto/tls/TlsKeyExchange;->validateCertificateRequest(Lorg/spongycastle/crypto/tls/CertificateRequest;)V

    .line 498
    iget-object v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->recordStream:Lorg/spongycastle/crypto/tls/RecordStream;

    invoke-virtual {v9}, Lorg/spongycastle/crypto/tls/RecordStream;->getHandshakeHash()Lorg/spongycastle/crypto/tls/TlsHandshakeHash;

    move-result-object v9

    iget-object v10, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->certificateRequest:Lorg/spongycastle/crypto/tls/CertificateRequest;

    .line 499
    invoke-virtual {v10}, Lorg/spongycastle/crypto/tls/CertificateRequest;->getSupportedSignatureAlgorithms()Ljava/util/Vector;

    move-result-object v10

    .line 498
    invoke-static {v9, v10}, Lorg/spongycastle/crypto/tls/TlsUtils;->trackHashAlgorithms(Lorg/spongycastle/crypto/tls/TlsHandshakeHash;Ljava/util/Vector;)V

    .line 507
    const/4 v9, 0x7

    iput-short v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->connection_state:S

    goto/16 :goto_2f

    .line 512
    :pswitch_28f
    iget-short v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->connection_state:S

    packed-switch v9, :pswitch_data_33e

    .line 535
    new-instance v9, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v10, 0xa

    invoke-direct {v9, v10}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v9

    .line 516
    :pswitch_29c
    iget-boolean v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->expectSessionTicket:Z

    if-nez v9, :cond_2a8

    .line 522
    new-instance v9, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v10, 0xa

    invoke-direct {v9, v10}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v9

    .line 529
    :cond_2a8
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->invalidateSession()V

    .line 531
    invoke-virtual {p0, v0}, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->receiveNewSessionTicketMessage(Ljava/io/ByteArrayInputStream;)V

    .line 538
    const/16 v9, 0xe

    iput-short v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->connection_state:S

    goto/16 :goto_2f

    .line 543
    :pswitch_2b4
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->assertEmpty(Ljava/io/ByteArrayInputStream;)V

    .line 551
    iget-short v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->connection_state:S

    const/16 v10, 0x10

    if-ne v9, v10, :cond_2f

    .line 553
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->refuseRenegotiation()V

    goto/16 :goto_2f

    .line 159
    :pswitch_data_2c2
    .packed-switch 0x0
        :pswitch_2b4
        :pswitch_33
        :pswitch_cd
        :pswitch_33
        :pswitch_28f
        :pswitch_33
        :pswitch_33
        :pswitch_33
        :pswitch_33
        :pswitch_33
        :pswitch_33
        :pswitch_3b
        :pswitch_223
        :pswitch_249
        :pswitch_13e
        :pswitch_33
        :pswitch_33
        :pswitch_33
        :pswitch_33
        :pswitch_33
        :pswitch_a4
        :pswitch_33
        :pswitch_7e
        :pswitch_128
    .end packed-switch

    .line 163
    :pswitch_data_2f6
    .packed-switch 0x2
        :pswitch_48
        :pswitch_4c
    .end packed-switch

    .line 200
    :pswitch_data_2fe
    .packed-switch 0x4
        :pswitch_8b
    .end packed-switch

    .line 230
    :pswitch_data_304
    .packed-switch 0xd
        :pswitch_b1
        :pswitch_bd
    .end packed-switch

    .line 261
    :pswitch_data_30c
    .packed-switch 0x1
        :pswitch_da
    .end packed-switch

    .line 298
    :pswitch_data_312
    .packed-switch 0x2
        :pswitch_135
    .end packed-switch

    .line 312
    :pswitch_data_318
    .packed-switch 0x2
        :pswitch_14b
        :pswitch_14f
        :pswitch_157
        :pswitch_157
        :pswitch_15c
        :pswitch_15c
    .end packed-switch

    .line 435
    :pswitch_data_328
    .packed-switch 0x2
        :pswitch_230
        :pswitch_234
        :pswitch_23c
        :pswitch_23c
    .end packed-switch

    .line 467
    :pswitch_data_334
    .packed-switch 0x4
        :pswitch_256
        :pswitch_256
        :pswitch_25b
    .end packed-switch

    .line 512
    :pswitch_data_33e
    .packed-switch 0xd
        :pswitch_29c
    .end packed-switch
.end method

.method protected handleSupplementalData(Ljava/util/Vector;)V
    .registers 4
    .param p1, "serverSupplementalData"    # Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 569
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->tlsClient:Lorg/spongycastle/crypto/tls/TlsClient;

    invoke-interface {v0, p1}, Lorg/spongycastle/crypto/tls/TlsClient;->processServerSupplementalData(Ljava/util/Vector;)V

    .line 570
    const/4 v0, 0x3

    iput-short v0, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->connection_state:S

    .line 572
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->tlsClient:Lorg/spongycastle/crypto/tls/TlsClient;

    invoke-interface {v0}, Lorg/spongycastle/crypto/tls/TlsClient;->getKeyExchange()Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->keyExchange:Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    .line 573
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->keyExchange:Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->getContext()Lorg/spongycastle/crypto/tls/TlsContext;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/spongycastle/crypto/tls/TlsKeyExchange;->init(Lorg/spongycastle/crypto/tls/TlsContext;)V

    .line 574
    return-void
.end method

.method protected receiveNewSessionTicketMessage(Ljava/io/ByteArrayInputStream;)V
    .registers 4
    .param p1, "buf"    # Ljava/io/ByteArrayInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 579
    invoke-static {p1}, Lorg/spongycastle/crypto/tls/NewSessionTicket;->parse(Ljava/io/InputStream;)Lorg/spongycastle/crypto/tls/NewSessionTicket;

    move-result-object v0

    .line 581
    .local v0, "newSessionTicket":Lorg/spongycastle/crypto/tls/NewSessionTicket;
    invoke-static {p1}, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->assertEmpty(Ljava/io/ByteArrayInputStream;)V

    .line 583
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->tlsClient:Lorg/spongycastle/crypto/tls/TlsClient;

    invoke-interface {v1, v0}, Lorg/spongycastle/crypto/tls/TlsClient;->notifyNewSessionTicket(Lorg/spongycastle/crypto/tls/NewSessionTicket;)V

    .line 584
    return-void
.end method

.method protected receiveServerHelloMessage(Ljava/io/ByteArrayInputStream;)V
    .registers 15
    .param p1, "buf"    # Ljava/io/ByteArrayInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 590
    invoke-static {p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->readVersion(Ljava/io/InputStream;)Lorg/spongycastle/crypto/tls/ProtocolVersion;

    move-result-object v7

    .line 591
    .local v7, "server_version":Lorg/spongycastle/crypto/tls/ProtocolVersion;
    invoke-virtual {v7}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->isDTLS()Z

    move-result v10

    if-eqz v10, :cond_12

    .line 593
    new-instance v10, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v11, 0x2f

    invoke-direct {v10, v11}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v10

    .line 597
    :cond_12
    iget-object v10, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->recordStream:Lorg/spongycastle/crypto/tls/RecordStream;

    invoke-virtual {v10}, Lorg/spongycastle/crypto/tls/RecordStream;->getReadVersion()Lorg/spongycastle/crypto/tls/ProtocolVersion;

    move-result-object v10

    invoke-virtual {v7, v10}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->equals(Lorg/spongycastle/crypto/tls/ProtocolVersion;)Z

    move-result v10

    if-nez v10, :cond_26

    .line 599
    new-instance v10, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v11, 0x2f

    invoke-direct {v10, v11}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v10

    .line 602
    :cond_26
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->getContext()Lorg/spongycastle/crypto/tls/TlsContext;

    move-result-object v10

    invoke-interface {v10}, Lorg/spongycastle/crypto/tls/TlsContext;->getClientVersion()Lorg/spongycastle/crypto/tls/ProtocolVersion;

    move-result-object v0

    .line 603
    .local v0, "client_version":Lorg/spongycastle/crypto/tls/ProtocolVersion;
    invoke-virtual {v7, v0}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->isEqualOrEarlierVersionOf(Lorg/spongycastle/crypto/tls/ProtocolVersion;)Z

    move-result v10

    if-nez v10, :cond_3c

    .line 605
    new-instance v10, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v11, 0x2f

    invoke-direct {v10, v11}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v10

    .line 608
    :cond_3c
    iget-object v10, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->recordStream:Lorg/spongycastle/crypto/tls/RecordStream;

    invoke-virtual {v10, v7}, Lorg/spongycastle/crypto/tls/RecordStream;->setWriteVersion(Lorg/spongycastle/crypto/tls/ProtocolVersion;)V

    .line 609
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->getContextAdmin()Lorg/spongycastle/crypto/tls/AbstractTlsContext;

    move-result-object v10

    invoke-virtual {v10, v7}, Lorg/spongycastle/crypto/tls/AbstractTlsContext;->setServerVersion(Lorg/spongycastle/crypto/tls/ProtocolVersion;)V

    .line 610
    iget-object v10, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->tlsClient:Lorg/spongycastle/crypto/tls/TlsClient;

    invoke-interface {v10, v7}, Lorg/spongycastle/crypto/tls/TlsClient;->notifyServerVersion(Lorg/spongycastle/crypto/tls/ProtocolVersion;)V

    .line 616
    iget-object v10, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->securityParameters:Lorg/spongycastle/crypto/tls/SecurityParameters;

    const/16 v11, 0x20

    invoke-static {v11, p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->readFully(ILjava/io/InputStream;)[B

    move-result-object v11

    iput-object v11, v10, Lorg/spongycastle/crypto/tls/SecurityParameters;->serverRandom:[B

    .line 618
    invoke-static {p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->readOpaque8(Ljava/io/InputStream;)[B

    move-result-object v10

    iput-object v10, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->selectedSessionID:[B

    .line 619
    iget-object v10, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->selectedSessionID:[B

    array-length v10, v10

    const/16 v11, 0x20

    if-le v10, v11, :cond_6c

    .line 621
    new-instance v10, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v11, 0x2f

    invoke-direct {v10, v11}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v10

    .line 623
    :cond_6c
    iget-object v10, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->tlsClient:Lorg/spongycastle/crypto/tls/TlsClient;

    iget-object v11, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->selectedSessionID:[B

    invoke-interface {v10, v11}, Lorg/spongycastle/crypto/tls/TlsClient;->notifySessionID([B)V

    .line 624
    iget-object v10, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->selectedSessionID:[B

    array-length v10, v10

    if-lez v10, :cond_b7

    iget-object v10, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->tlsSession:Lorg/spongycastle/crypto/tls/TlsSession;

    if-eqz v10, :cond_b7

    iget-object v10, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->selectedSessionID:[B

    iget-object v11, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->tlsSession:Lorg/spongycastle/crypto/tls/TlsSession;

    .line 625
    invoke-interface {v11}, Lorg/spongycastle/crypto/tls/TlsSession;->getSessionID()[B

    move-result-object v11

    invoke-static {v10, v11}, Lorg/spongycastle/util/Arrays;->areEqual([B[B)Z

    move-result v10

    if-eqz v10, :cond_b7

    const/4 v10, 0x1

    :goto_8b
    iput-boolean v10, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->resumedSession:Z

    .line 631
    invoke-static {p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint16(Ljava/io/InputStream;)I

    move-result v4

    .line 632
    .local v4, "selectedCipherSuite":I
    iget-object v10, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->offeredCipherSuites:[I

    invoke-static {v10, v4}, Lorg/spongycastle/util/Arrays;->contains([II)Z

    move-result v10

    if-eqz v10, :cond_af

    if-eqz v4, :cond_af

    .line 634
    invoke-static {v4}, Lorg/spongycastle/crypto/tls/CipherSuite;->isSCSV(I)Z

    move-result v10

    if-nez v10, :cond_af

    .line 635
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->getContext()Lorg/spongycastle/crypto/tls/TlsContext;

    move-result-object v10

    invoke-interface {v10}, Lorg/spongycastle/crypto/tls/TlsContext;->getServerVersion()Lorg/spongycastle/crypto/tls/ProtocolVersion;

    move-result-object v10

    invoke-static {v4, v10}, Lorg/spongycastle/crypto/tls/TlsUtils;->isValidCipherSuiteForVersion(ILorg/spongycastle/crypto/tls/ProtocolVersion;)Z

    move-result v10

    if-nez v10, :cond_b9

    .line 637
    :cond_af
    new-instance v10, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v11, 0x2f

    invoke-direct {v10, v11}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v10

    .line 625
    .end local v4    # "selectedCipherSuite":I
    :cond_b7
    const/4 v10, 0x0

    goto :goto_8b

    .line 639
    .restart local v4    # "selectedCipherSuite":I
    :cond_b9
    iget-object v10, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->tlsClient:Lorg/spongycastle/crypto/tls/TlsClient;

    invoke-interface {v10, v4}, Lorg/spongycastle/crypto/tls/TlsClient;->notifySelectedCipherSuite(I)V

    .line 645
    invoke-static {p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint8(Ljava/io/InputStream;)S

    move-result v5

    .line 646
    .local v5, "selectedCompressionMethod":S
    iget-object v10, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->offeredCompressionMethods:[S

    invoke-static {v10, v5}, Lorg/spongycastle/util/Arrays;->contains([SS)Z

    move-result v10

    if-nez v10, :cond_d2

    .line 648
    new-instance v10, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v11, 0x2f

    invoke-direct {v10, v11}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v10

    .line 650
    :cond_d2
    iget-object v10, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->tlsClient:Lorg/spongycastle/crypto/tls/TlsClient;

    invoke-interface {v10, v5}, Lorg/spongycastle/crypto/tls/TlsClient;->notifySelectedCompressionMethod(S)V

    .line 660
    invoke-static {p1}, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->readExtensions(Ljava/io/ByteArrayInputStream;)Ljava/util/Hashtable;

    move-result-object v10

    iput-object v10, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->serverExtensions:Ljava/util/Hashtable;

    .line 669
    iget-object v10, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->serverExtensions:Ljava/util/Hashtable;

    if-eqz v10, :cond_110

    .line 671
    iget-object v10, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->serverExtensions:Ljava/util/Hashtable;

    invoke-virtual {v10}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v1

    .line 672
    .local v1, "e":Ljava/util/Enumeration;
    :cond_e7
    :goto_e7
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v10

    if-eqz v10, :cond_110

    .line 674
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    .line 683
    .local v2, "extType":Ljava/lang/Integer;
    sget-object v10, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->EXT_RenegotiationInfo:Ljava/lang/Integer;

    invoke-virtual {v2, v10}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_e7

    .line 695
    iget-object v10, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->clientExtensions:Ljava/util/Hashtable;

    invoke-static {v10, v2}, Lorg/spongycastle/crypto/tls/TlsUtils;->getExtensionData(Ljava/util/Hashtable;Ljava/lang/Integer;)[B

    move-result-object v10

    if-nez v10, :cond_10b

    .line 697
    new-instance v10, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v11, 0x6e

    invoke-direct {v10, v11}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v10

    .line 705
    :cond_10b
    iget-boolean v10, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->resumedSession:Z

    if-eqz v10, :cond_e7

    goto :goto_e7

    .line 723
    .end local v1    # "e":Ljava/util/Enumeration;
    .end local v2    # "extType":Ljava/lang/Integer;
    :cond_110
    iget-object v10, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->serverExtensions:Ljava/util/Hashtable;

    sget-object v11, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->EXT_RenegotiationInfo:Ljava/lang/Integer;

    invoke-static {v10, v11}, Lorg/spongycastle/crypto/tls/TlsUtils;->getExtensionData(Ljava/util/Hashtable;Ljava/lang/Integer;)[B

    move-result-object v3

    .line 724
    .local v3, "renegExtData":[B
    if-eqz v3, :cond_131

    .line 732
    const/4 v10, 0x1

    iput-boolean v10, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->secure_renegotiation:Z

    .line 734
    sget-object v10, Lorg/spongycastle/crypto/tls/TlsUtils;->EMPTY_BYTES:[B

    invoke-static {v10}, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->createRenegotiationInfo([B)[B

    move-result-object v10

    invoke-static {v3, v10}, Lorg/spongycastle/util/Arrays;->constantTimeAreEqual([B[B)Z

    move-result v10

    if-nez v10, :cond_131

    .line 736
    new-instance v10, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v11, 0x28

    invoke-direct {v10, v11}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v10

    .line 742
    :cond_131
    iget-object v10, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->tlsClient:Lorg/spongycastle/crypto/tls/TlsClient;

    iget-boolean v11, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->secure_renegotiation:Z

    invoke-interface {v10, v11}, Lorg/spongycastle/crypto/tls/TlsClient;->notifySecureRenegotiation(Z)V

    .line 744
    iget-object v8, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->clientExtensions:Ljava/util/Hashtable;

    .local v8, "sessionClientExtensions":Ljava/util/Hashtable;
    iget-object v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->serverExtensions:Ljava/util/Hashtable;

    .line 745
    .local v9, "sessionServerExtensions":Ljava/util/Hashtable;
    iget-boolean v10, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->resumedSession:Z

    if-eqz v10, :cond_15f

    .line 747
    iget-object v10, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->sessionParameters:Lorg/spongycastle/crypto/tls/SessionParameters;

    invoke-virtual {v10}, Lorg/spongycastle/crypto/tls/SessionParameters;->getCipherSuite()I

    move-result v10

    if-ne v4, v10, :cond_150

    iget-object v10, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->sessionParameters:Lorg/spongycastle/crypto/tls/SessionParameters;

    .line 748
    invoke-virtual {v10}, Lorg/spongycastle/crypto/tls/SessionParameters;->getCompressionAlgorithm()S

    move-result v10

    if-eq v5, v10, :cond_158

    .line 750
    :cond_150
    new-instance v10, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v11, 0x2f

    invoke-direct {v10, v11}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v10

    .line 753
    :cond_158
    const/4 v8, 0x0

    .line 754
    iget-object v10, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->sessionParameters:Lorg/spongycastle/crypto/tls/SessionParameters;

    invoke-virtual {v10}, Lorg/spongycastle/crypto/tls/SessionParameters;->readServerExtensions()Ljava/util/Hashtable;

    move-result-object v9

    .line 757
    :cond_15f
    iget-object v10, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->securityParameters:Lorg/spongycastle/crypto/tls/SecurityParameters;

    iput v4, v10, Lorg/spongycastle/crypto/tls/SecurityParameters;->cipherSuite:I

    .line 758
    iget-object v10, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->securityParameters:Lorg/spongycastle/crypto/tls/SecurityParameters;

    iput-short v5, v10, Lorg/spongycastle/crypto/tls/SecurityParameters;->compressionAlgorithm:S

    .line 760
    if-eqz v9, :cond_1bd

    .line 769
    invoke-static {v9}, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->hasEncryptThenMACExtension(Ljava/util/Hashtable;)Z

    move-result v6

    .line 770
    .local v6, "serverSentEncryptThenMAC":Z
    if-eqz v6, :cond_17d

    invoke-static {v4}, Lorg/spongycastle/crypto/tls/TlsUtils;->isBlockCipherSuite(I)Z

    move-result v10

    if-nez v10, :cond_17d

    .line 772
    new-instance v10, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v11, 0x2f

    invoke-direct {v10, v11}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v10

    .line 774
    :cond_17d
    iget-object v10, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->securityParameters:Lorg/spongycastle/crypto/tls/SecurityParameters;

    iput-boolean v6, v10, Lorg/spongycastle/crypto/tls/SecurityParameters;->encryptThenMAC:Z

    .line 777
    iget-object v10, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->securityParameters:Lorg/spongycastle/crypto/tls/SecurityParameters;

    invoke-static {v9}, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->hasExtendedMasterSecretExtension(Ljava/util/Hashtable;)Z

    move-result v11

    iput-boolean v11, v10, Lorg/spongycastle/crypto/tls/SecurityParameters;->extendedMasterSecret:Z

    .line 779
    iget-object v10, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->securityParameters:Lorg/spongycastle/crypto/tls/SecurityParameters;

    const/16 v11, 0x2f

    invoke-virtual {p0, v8, v9, v11}, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->processMaxFragmentLengthExtension(Ljava/util/Hashtable;Ljava/util/Hashtable;S)S

    move-result v11

    iput-short v11, v10, Lorg/spongycastle/crypto/tls/SecurityParameters;->maxFragmentLength:S

    .line 782
    iget-object v10, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->securityParameters:Lorg/spongycastle/crypto/tls/SecurityParameters;

    invoke-static {v9}, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->hasTruncatedHMacExtension(Ljava/util/Hashtable;)Z

    move-result v11

    iput-boolean v11, v10, Lorg/spongycastle/crypto/tls/SecurityParameters;->truncatedHMac:Z

    .line 788
    iget-boolean v10, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->resumedSession:Z

    if-nez v10, :cond_1dd

    sget-object v10, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->EXT_status_request:Ljava/lang/Integer;

    const/16 v11, 0x2f

    .line 789
    invoke-static {v9, v10, v11}, Lorg/spongycastle/crypto/tls/TlsUtils;->hasExpectedEmptyExtensionData(Ljava/util/Hashtable;Ljava/lang/Integer;S)Z

    move-result v10

    if-eqz v10, :cond_1dd

    const/4 v10, 0x1

    :goto_1aa
    iput-boolean v10, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->allowCertificateStatus:Z

    .line 792
    iget-boolean v10, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->resumedSession:Z

    if-nez v10, :cond_1df

    sget-object v10, Lorg/spongycastle/crypto/tls/TlsProtocol;->EXT_SessionTicket:Ljava/lang/Integer;

    const/16 v11, 0x2f

    .line 793
    invoke-static {v9, v10, v11}, Lorg/spongycastle/crypto/tls/TlsUtils;->hasExpectedEmptyExtensionData(Ljava/util/Hashtable;Ljava/lang/Integer;S)Z

    move-result v10

    if-eqz v10, :cond_1df

    const/4 v10, 0x1

    :goto_1bb
    iput-boolean v10, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->expectSessionTicket:Z

    .line 804
    .end local v6    # "serverSentEncryptThenMAC":Z
    :cond_1bd
    if-eqz v8, :cond_1c4

    .line 806
    iget-object v10, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->tlsClient:Lorg/spongycastle/crypto/tls/TlsClient;

    invoke-interface {v10, v9}, Lorg/spongycastle/crypto/tls/TlsClient;->processServerExtensions(Ljava/util/Hashtable;)V

    .line 809
    :cond_1c4
    iget-object v10, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->securityParameters:Lorg/spongycastle/crypto/tls/SecurityParameters;

    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->getContext()Lorg/spongycastle/crypto/tls/TlsContext;

    move-result-object v11

    iget-object v12, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->securityParameters:Lorg/spongycastle/crypto/tls/SecurityParameters;

    .line 810
    invoke-virtual {v12}, Lorg/spongycastle/crypto/tls/SecurityParameters;->getCipherSuite()I

    move-result v12

    .line 809
    invoke-static {v11, v12}, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->getPRFAlgorithm(Lorg/spongycastle/crypto/tls/TlsContext;I)I

    move-result v11

    iput v11, v10, Lorg/spongycastle/crypto/tls/SecurityParameters;->prfAlgorithm:I

    .line 817
    iget-object v10, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->securityParameters:Lorg/spongycastle/crypto/tls/SecurityParameters;

    const/16 v11, 0xc

    iput v11, v10, Lorg/spongycastle/crypto/tls/SecurityParameters;->verifyDataLength:I

    .line 818
    return-void

    .line 789
    .restart local v6    # "serverSentEncryptThenMAC":Z
    :cond_1dd
    const/4 v10, 0x0

    goto :goto_1aa

    .line 793
    :cond_1df
    const/4 v10, 0x0

    goto :goto_1bb
.end method

.method protected sendCertificateVerifyMessage(Lorg/spongycastle/crypto/tls/DigitallySigned;)V
    .registers 4
    .param p1, "certificateVerify"    # Lorg/spongycastle/crypto/tls/DigitallySigned;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 823
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsProtocol$HandshakeMessage;

    const/16 v1, 0xf

    invoke-direct {v0, p0, v1}, Lorg/spongycastle/crypto/tls/TlsProtocol$HandshakeMessage;-><init>(Lorg/spongycastle/crypto/tls/TlsProtocol;S)V

    .line 825
    .local v0, "message":Lorg/spongycastle/crypto/tls/TlsProtocol$HandshakeMessage;
    invoke-virtual {p1, v0}, Lorg/spongycastle/crypto/tls/DigitallySigned;->encode(Ljava/io/OutputStream;)V

    .line 827
    invoke-virtual {v0}, Lorg/spongycastle/crypto/tls/TlsProtocol$HandshakeMessage;->writeToRecordStream()V

    .line 828
    return-void
.end method

.method protected sendClientHelloMessage()V
    .registers 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v12, 0x5600

    const/16 v11, 0xff

    const/4 v8, 0x0

    const/4 v7, 0x1

    .line 833
    iget-object v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->recordStream:Lorg/spongycastle/crypto/tls/RecordStream;

    iget-object v10, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->tlsClient:Lorg/spongycastle/crypto/tls/TlsClient;

    invoke-interface {v10}, Lorg/spongycastle/crypto/tls/TlsClient;->getClientHelloRecordLayerVersion()Lorg/spongycastle/crypto/tls/ProtocolVersion;

    move-result-object v10

    invoke-virtual {v9, v10}, Lorg/spongycastle/crypto/tls/RecordStream;->setWriteVersion(Lorg/spongycastle/crypto/tls/ProtocolVersion;)V

    .line 835
    iget-object v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->tlsClient:Lorg/spongycastle/crypto/tls/TlsClient;

    invoke-interface {v9}, Lorg/spongycastle/crypto/tls/TlsClient;->getClientVersion()Lorg/spongycastle/crypto/tls/ProtocolVersion;

    move-result-object v0

    .line 836
    .local v0, "client_version":Lorg/spongycastle/crypto/tls/ProtocolVersion;
    invoke-virtual {v0}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->isDTLS()Z

    move-result v9

    if-eqz v9, :cond_25

    .line 838
    new-instance v7, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v8, 0x50

    invoke-direct {v7, v8}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v7

    .line 841
    :cond_25
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->getContextAdmin()Lorg/spongycastle/crypto/tls/AbstractTlsContext;

    move-result-object v9

    invoke-virtual {v9, v0}, Lorg/spongycastle/crypto/tls/AbstractTlsContext;->setClientVersion(Lorg/spongycastle/crypto/tls/ProtocolVersion;)V

    .line 847
    sget-object v6, Lorg/spongycastle/crypto/tls/TlsUtils;->EMPTY_BYTES:[B

    .line 848
    .local v6, "session_id":[B
    iget-object v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->tlsSession:Lorg/spongycastle/crypto/tls/TlsSession;

    if-eqz v9, :cond_41

    .line 850
    iget-object v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->tlsSession:Lorg/spongycastle/crypto/tls/TlsSession;

    invoke-interface {v9}, Lorg/spongycastle/crypto/tls/TlsSession;->getSessionID()[B

    move-result-object v6

    .line 851
    if-eqz v6, :cond_3f

    array-length v9, v6

    const/16 v10, 0x20

    if-le v9, v10, :cond_41

    .line 853
    :cond_3f
    sget-object v6, Lorg/spongycastle/crypto/tls/TlsUtils;->EMPTY_BYTES:[B

    .line 857
    :cond_41
    iget-object v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->tlsClient:Lorg/spongycastle/crypto/tls/TlsClient;

    invoke-interface {v9}, Lorg/spongycastle/crypto/tls/TlsClient;->isFallback()Z

    move-result v1

    .line 859
    .local v1, "fallback":Z
    iget-object v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->tlsClient:Lorg/spongycastle/crypto/tls/TlsClient;

    invoke-interface {v9}, Lorg/spongycastle/crypto/tls/TlsClient;->getCipherSuites()[I

    move-result-object v9

    iput-object v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->offeredCipherSuites:[I

    .line 861
    iget-object v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->tlsClient:Lorg/spongycastle/crypto/tls/TlsClient;

    invoke-interface {v9}, Lorg/spongycastle/crypto/tls/TlsClient;->getCompressionMethods()[S

    move-result-object v9

    iput-object v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->offeredCompressionMethods:[S

    .line 863
    array-length v9, v6

    if-lez v9, :cond_7c

    iget-object v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->sessionParameters:Lorg/spongycastle/crypto/tls/SessionParameters;

    if-eqz v9, :cond_7c

    .line 865
    iget-object v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->offeredCipherSuites:[I

    iget-object v10, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->sessionParameters:Lorg/spongycastle/crypto/tls/SessionParameters;

    invoke-virtual {v10}, Lorg/spongycastle/crypto/tls/SessionParameters;->getCipherSuite()I

    move-result v10

    invoke-static {v9, v10}, Lorg/spongycastle/util/Arrays;->contains([II)Z

    move-result v9

    if-eqz v9, :cond_7a

    iget-object v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->offeredCompressionMethods:[S

    iget-object v10, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->sessionParameters:Lorg/spongycastle/crypto/tls/SessionParameters;

    .line 866
    invoke-virtual {v10}, Lorg/spongycastle/crypto/tls/SessionParameters;->getCompressionAlgorithm()S

    move-result v10

    invoke-static {v9, v10}, Lorg/spongycastle/util/Arrays;->contains([SS)Z

    move-result v9

    if-nez v9, :cond_7c

    .line 868
    :cond_7a
    sget-object v6, Lorg/spongycastle/crypto/tls/TlsUtils;->EMPTY_BYTES:[B

    .line 872
    :cond_7c
    iget-object v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->tlsClient:Lorg/spongycastle/crypto/tls/TlsClient;

    invoke-interface {v9}, Lorg/spongycastle/crypto/tls/TlsClient;->getClientExtensions()Ljava/util/Hashtable;

    move-result-object v9

    iput-object v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->clientExtensions:Ljava/util/Hashtable;

    .line 874
    new-instance v2, Lorg/spongycastle/crypto/tls/TlsProtocol$HandshakeMessage;

    invoke-direct {v2, p0, v7}, Lorg/spongycastle/crypto/tls/TlsProtocol$HandshakeMessage;-><init>(Lorg/spongycastle/crypto/tls/TlsProtocol;S)V

    .line 876
    .local v2, "message":Lorg/spongycastle/crypto/tls/TlsProtocol$HandshakeMessage;
    invoke-static {v0, v2}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeVersion(Lorg/spongycastle/crypto/tls/ProtocolVersion;Ljava/io/OutputStream;)V

    .line 878
    iget-object v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->securityParameters:Lorg/spongycastle/crypto/tls/SecurityParameters;

    invoke-virtual {v9}, Lorg/spongycastle/crypto/tls/SecurityParameters;->getClientRandom()[B

    move-result-object v9

    invoke-virtual {v2, v9}, Lorg/spongycastle/crypto/tls/TlsProtocol$HandshakeMessage;->write([B)V

    .line 880
    invoke-static {v6, v2}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeOpaque8([BLjava/io/OutputStream;)V

    .line 889
    iget-object v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->clientExtensions:Ljava/util/Hashtable;

    sget-object v10, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->EXT_RenegotiationInfo:Ljava/lang/Integer;

    invoke-static {v9, v10}, Lorg/spongycastle/crypto/tls/TlsUtils;->getExtensionData(Ljava/util/Hashtable;Ljava/lang/Integer;)[B

    move-result-object v5

    .line 890
    .local v5, "renegExtData":[B
    if-nez v5, :cond_e1

    move v3, v7

    .line 892
    .local v3, "noRenegExt":Z
    :goto_a3
    iget-object v9, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->offeredCipherSuites:[I

    invoke-static {v9, v11}, Lorg/spongycastle/util/Arrays;->contains([II)Z

    move-result v9

    if-nez v9, :cond_e3

    move v4, v7

    .line 894
    .local v4, "noRenegSCSV":Z
    :goto_ac
    if-eqz v3, :cond_b8

    if-eqz v4, :cond_b8

    .line 899
    iget-object v7, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->offeredCipherSuites:[I

    invoke-static {v7, v11}, Lorg/spongycastle/util/Arrays;->append([II)[I

    move-result-object v7

    iput-object v7, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->offeredCipherSuites:[I

    .line 908
    :cond_b8
    if-eqz v1, :cond_ca

    iget-object v7, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->offeredCipherSuites:[I

    invoke-static {v7, v12}, Lorg/spongycastle/util/Arrays;->contains([II)Z

    move-result v7

    if-nez v7, :cond_ca

    .line 910
    iget-object v7, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->offeredCipherSuites:[I

    invoke-static {v7, v12}, Lorg/spongycastle/util/Arrays;->append([II)[I

    move-result-object v7

    iput-object v7, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->offeredCipherSuites:[I

    .line 913
    :cond_ca
    iget-object v7, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->offeredCipherSuites:[I

    invoke-static {v7, v2}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint16ArrayWithUint16Length([ILjava/io/OutputStream;)V

    .line 916
    iget-object v7, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->offeredCompressionMethods:[S

    invoke-static {v7, v2}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint8ArrayWithUint8Length([SLjava/io/OutputStream;)V

    .line 918
    iget-object v7, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->clientExtensions:Ljava/util/Hashtable;

    if-eqz v7, :cond_dd

    .line 920
    iget-object v7, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->clientExtensions:Ljava/util/Hashtable;

    invoke-static {v2, v7}, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->writeExtensions(Ljava/io/OutputStream;Ljava/util/Hashtable;)V

    .line 923
    :cond_dd
    invoke-virtual {v2}, Lorg/spongycastle/crypto/tls/TlsProtocol$HandshakeMessage;->writeToRecordStream()V

    .line 924
    return-void

    .end local v3    # "noRenegExt":Z
    .end local v4    # "noRenegSCSV":Z
    :cond_e1
    move v3, v8

    .line 890
    goto :goto_a3

    .restart local v3    # "noRenegExt":Z
    :cond_e3
    move v4, v8

    .line 892
    goto :goto_ac
.end method

.method protected sendClientKeyExchangeMessage()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 929
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsProtocol$HandshakeMessage;

    const/16 v1, 0x10

    invoke-direct {v0, p0, v1}, Lorg/spongycastle/crypto/tls/TlsProtocol$HandshakeMessage;-><init>(Lorg/spongycastle/crypto/tls/TlsProtocol;S)V

    .line 931
    .local v0, "message":Lorg/spongycastle/crypto/tls/TlsProtocol$HandshakeMessage;
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/TlsClientProtocol;->keyExchange:Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    invoke-interface {v1, v0}, Lorg/spongycastle/crypto/tls/TlsKeyExchange;->generateClientKeyExchange(Ljava/io/OutputStream;)V

    .line 933
    invoke-virtual {v0}, Lorg/spongycastle/crypto/tls/TlsProtocol$HandshakeMessage;->writeToRecordStream()V

    .line 934
    return-void
.end method
