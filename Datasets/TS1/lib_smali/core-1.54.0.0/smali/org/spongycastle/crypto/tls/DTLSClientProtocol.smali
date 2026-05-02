.class public Lorg/spongycastle/crypto/tls/DTLSClientProtocol;
.super Lorg/spongycastle/crypto/tls/DTLSProtocol;
.source "DTLSClientProtocol.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/security/SecureRandom;)V
    .registers 2
    .param p1, "secureRandom"    # Ljava/security/SecureRandom;

    .prologue
    .line 18
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/tls/DTLSProtocol;-><init>(Ljava/security/SecureRandom;)V

    .line 19
    return-void
.end method

.method protected static patchClientHelloWithCookie([B[B)[B
    .registers 10
    .param p0, "clientHelloBody"    # [B
    .param p1, "cookie"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 853
    const/16 v4, 0x22

    .line 854
    .local v4, "sessionIDPos":I
    invoke-static {p0, v4}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint8([BI)S

    move-result v3

    .line 856
    .local v3, "sessionIDLength":I
    add-int/lit8 v0, v3, 0x23

    .line 857
    .local v0, "cookieLengthPos":I
    add-int/lit8 v1, v0, 0x1

    .line 859
    .local v1, "cookiePos":I
    array-length v5, p0

    array-length v6, p1

    add-int/2addr v5, v6

    new-array v2, v5, [B

    .line 860
    .local v2, "patched":[B
    invoke-static {p0, v7, v2, v7, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 861
    array-length v5, p1

    invoke-static {v5}, Lorg/spongycastle/crypto/tls/TlsUtils;->checkUint8(I)V

    .line 862
    array-length v5, p1

    invoke-static {v5, v2, v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint8(I[BI)V

    .line 863
    array-length v5, p1

    invoke-static {p1, v7, v2, v1, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 864
    array-length v5, p1

    add-int/2addr v5, v1

    array-length v6, p0

    sub-int/2addr v6, v1

    invoke-static {p0, v1, v2, v5, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 867
    return-object v2
.end method


# virtual methods
.method protected clientHandshake(Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;Lorg/spongycastle/crypto/tls/DTLSRecordLayer;)Lorg/spongycastle/crypto/tls/DTLSTransport;
    .registers 34
    .param p1, "state"    # Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;
    .param p2, "recordLayer"    # Lorg/spongycastle/crypto/tls/DTLSRecordLayer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 82
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->clientContext:Lorg/spongycastle/crypto/tls/TlsClientContextImpl;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Lorg/spongycastle/crypto/tls/TlsClientContextImpl;->getSecurityParameters()Lorg/spongycastle/crypto/tls/SecurityParameters;

    move-result-object v19

    .line 83
    .local v19, "securityParameters":Lorg/spongycastle/crypto/tls/SecurityParameters;
    new-instance v14, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;

    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->clientContext:Lorg/spongycastle/crypto/tls/TlsClientContextImpl;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    move-object/from16 v1, p2

    invoke-direct {v14, v0, v1}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;-><init>(Lorg/spongycastle/crypto/tls/TlsContext;Lorg/spongycastle/crypto/tls/DTLSRecordLayer;)V

    .line 85
    .local v14, "handshake":Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->client:Lorg/spongycastle/crypto/tls/TlsClient;

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v26

    invoke-virtual {v0, v1, v2}, Lorg/spongycastle/crypto/tls/DTLSClientProtocol;->generateClientHello(Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;Lorg/spongycastle/crypto/tls/TlsClient;)[B

    move-result-object v7

    .line 87
    .local v7, "clientHelloBody":[B
    sget-object v26, Lorg/spongycastle/crypto/tls/ProtocolVersion;->DTLSv10:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    move-object/from16 v0, p2

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->setWriteVersion(Lorg/spongycastle/crypto/tls/ProtocolVersion;)V

    .line 89
    const/16 v26, 0x1

    move/from16 v0, v26

    invoke-virtual {v14, v0, v7}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->sendMessage(S[B)V

    .line 91
    invoke-virtual {v14}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->receiveMessage()Lorg/spongycastle/crypto/tls/DTLSReliableHandshake$Message;

    move-result-object v21

    .line 93
    .local v21, "serverMessage":Lorg/spongycastle/crypto/tls/DTLSReliableHandshake$Message;
    :goto_3d
    invoke-virtual/range {v21 .. v21}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake$Message;->getType()S

    move-result v26

    const/16 v27, 0x3

    move/from16 v0, v26

    move/from16 v1, v27

    if-ne v0, v1, :cond_93

    .line 95
    invoke-virtual/range {p2 .. p2}, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->getReadVersion()Lorg/spongycastle/crypto/tls/ProtocolVersion;

    move-result-object v18

    .line 96
    .local v18, "recordLayerVersion":Lorg/spongycastle/crypto/tls/ProtocolVersion;
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->clientContext:Lorg/spongycastle/crypto/tls/TlsClientContextImpl;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Lorg/spongycastle/crypto/tls/TlsClientContextImpl;->getClientVersion()Lorg/spongycastle/crypto/tls/ProtocolVersion;

    move-result-object v11

    .line 104
    .local v11, "client_version":Lorg/spongycastle/crypto/tls/ProtocolVersion;
    move-object/from16 v0, v18

    invoke-virtual {v0, v11}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->isEqualOrEarlierVersionOf(Lorg/spongycastle/crypto/tls/ProtocolVersion;)Z

    move-result v26

    if-nez v26, :cond_67

    .line 106
    new-instance v26, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v27, 0x2f

    invoke-direct/range {v26 .. v27}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v26

    .line 109
    :cond_67
    const/16 v26, 0x0

    move-object/from16 v0, p2

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->setReadVersion(Lorg/spongycastle/crypto/tls/ProtocolVersion;)V

    .line 111
    invoke-virtual/range {v21 .. v21}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake$Message;->getBody()[B

    move-result-object v26

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v26

    invoke-virtual {v0, v1, v2}, Lorg/spongycastle/crypto/tls/DTLSClientProtocol;->processHelloVerifyRequest(Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;[B)[B

    move-result-object v12

    .line 112
    .local v12, "cookie":[B
    invoke-static {v7, v12}, Lorg/spongycastle/crypto/tls/DTLSClientProtocol;->patchClientHelloWithCookie([B[B)[B

    move-result-object v16

    .line 114
    .local v16, "patched":[B
    invoke-virtual {v14}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->resetHandshakeMessagesDigest()V

    .line 115
    const/16 v26, 0x1

    move/from16 v0, v26

    move-object/from16 v1, v16

    invoke-virtual {v14, v0, v1}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->sendMessage(S[B)V

    .line 117
    invoke-virtual {v14}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->receiveMessage()Lorg/spongycastle/crypto/tls/DTLSReliableHandshake$Message;

    move-result-object v21

    .line 118
    goto :goto_3d

    .line 120
    .end local v11    # "client_version":Lorg/spongycastle/crypto/tls/ProtocolVersion;
    .end local v12    # "cookie":[B
    .end local v16    # "patched":[B
    .end local v18    # "recordLayerVersion":Lorg/spongycastle/crypto/tls/ProtocolVersion;
    :cond_93
    invoke-virtual/range {v21 .. v21}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake$Message;->getType()S

    move-result v26

    const/16 v27, 0x2

    move/from16 v0, v26

    move/from16 v1, v27

    if-ne v0, v1, :cond_170

    .line 122
    invoke-virtual/range {p2 .. p2}, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->getReadVersion()Lorg/spongycastle/crypto/tls/ProtocolVersion;

    move-result-object v18

    .line 123
    .restart local v18    # "recordLayerVersion":Lorg/spongycastle/crypto/tls/ProtocolVersion;
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/spongycastle/crypto/tls/DTLSClientProtocol;->reportServerVersion(Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;Lorg/spongycastle/crypto/tls/ProtocolVersion;)V

    .line 124
    move-object/from16 v0, p2

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->setWriteVersion(Lorg/spongycastle/crypto/tls/ProtocolVersion;)V

    .line 126
    invoke-virtual/range {v21 .. v21}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake$Message;->getBody()[B

    move-result-object v26

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v26

    invoke-virtual {v0, v1, v2}, Lorg/spongycastle/crypto/tls/DTLSClientProtocol;->processServerHello(Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;[B)V

    .line 133
    invoke-virtual {v14}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->notifyHelloComplete()V

    .line 135
    move-object/from16 v0, v19

    iget-short v0, v0, Lorg/spongycastle/crypto/tls/SecurityParameters;->maxFragmentLength:S

    move/from16 v26, v0

    move-object/from16 v0, p2

    move/from16 v1, v26

    invoke-static {v0, v1}, Lorg/spongycastle/crypto/tls/DTLSClientProtocol;->applyMaxFragmentLengthExtension(Lorg/spongycastle/crypto/tls/DTLSRecordLayer;S)V

    .line 137
    move-object/from16 v0, p1

    iget-boolean v0, v0, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->resumedSession:Z

    move/from16 v26, v0

    if-eqz v26, :cond_178

    .line 139
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->sessionParameters:Lorg/spongycastle/crypto/tls/SessionParameters;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Lorg/spongycastle/crypto/tls/SessionParameters;->getMasterSecret()[B

    move-result-object v26

    invoke-static/range {v26 .. v26}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    move-result-object v26

    move-object/from16 v0, v26

    move-object/from16 v1, v19

    iput-object v0, v1, Lorg/spongycastle/crypto/tls/SecurityParameters;->masterSecret:[B

    .line 140
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->client:Lorg/spongycastle/crypto/tls/TlsClient;

    move-object/from16 v26, v0

    invoke-interface/range {v26 .. v26}, Lorg/spongycastle/crypto/tls/TlsClient;->getCipher()Lorg/spongycastle/crypto/tls/TlsCipher;

    move-result-object v26

    move-object/from16 v0, p2

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->initPendingEpoch(Lorg/spongycastle/crypto/tls/TlsCipher;)V

    .line 143
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->clientContext:Lorg/spongycastle/crypto/tls/TlsClientContextImpl;

    move-object/from16 v26, v0

    const-string v27, "server finished"

    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->clientContext:Lorg/spongycastle/crypto/tls/TlsClientContextImpl;

    move-object/from16 v28, v0

    .line 144
    invoke-virtual {v14}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->getHandshakeHash()Lorg/spongycastle/crypto/tls/TlsHandshakeHash;

    move-result-object v29

    const/16 v30, 0x0

    invoke-static/range {v28 .. v30}, Lorg/spongycastle/crypto/tls/TlsProtocol;->getCurrentPRFHash(Lorg/spongycastle/crypto/tls/TlsContext;Lorg/spongycastle/crypto/tls/TlsHandshakeHash;[B)[B

    move-result-object v28

    .line 143
    invoke-static/range {v26 .. v28}, Lorg/spongycastle/crypto/tls/TlsUtils;->calculateVerifyData(Lorg/spongycastle/crypto/tls/TlsContext;Ljava/lang/String;[B)[B

    move-result-object v13

    .line 145
    .local v13, "expectedServerVerifyData":[B
    const/16 v26, 0x14

    move/from16 v0, v26

    invoke-virtual {v14, v0}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->receiveMessageBody(S)[B

    move-result-object v26

    move-object/from16 v0, p0

    move-object/from16 v1, v26

    invoke-virtual {v0, v1, v13}, Lorg/spongycastle/crypto/tls/DTLSClientProtocol;->processFinished([B[B)V

    .line 148
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->clientContext:Lorg/spongycastle/crypto/tls/TlsClientContextImpl;

    move-object/from16 v26, v0

    const-string v27, "client finished"

    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->clientContext:Lorg/spongycastle/crypto/tls/TlsClientContextImpl;

    move-object/from16 v28, v0

    .line 149
    invoke-virtual {v14}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->getHandshakeHash()Lorg/spongycastle/crypto/tls/TlsHandshakeHash;

    move-result-object v29

    const/16 v30, 0x0

    invoke-static/range {v28 .. v30}, Lorg/spongycastle/crypto/tls/TlsProtocol;->getCurrentPRFHash(Lorg/spongycastle/crypto/tls/TlsContext;Lorg/spongycastle/crypto/tls/TlsHandshakeHash;[B)[B

    move-result-object v28

    .line 148
    invoke-static/range {v26 .. v28}, Lorg/spongycastle/crypto/tls/TlsUtils;->calculateVerifyData(Lorg/spongycastle/crypto/tls/TlsContext;Ljava/lang/String;[B)[B

    move-result-object v10

    .line 150
    .local v10, "clientVerifyData":[B
    const/16 v26, 0x14

    move/from16 v0, v26

    invoke-virtual {v14, v0, v10}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->sendMessage(S[B)V

    .line 152
    invoke-virtual {v14}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->finish()V

    .line 154
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->clientContext:Lorg/spongycastle/crypto/tls/TlsClientContextImpl;

    move-object/from16 v26, v0

    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->tlsSession:Lorg/spongycastle/crypto/tls/TlsSession;

    move-object/from16 v27, v0

    invoke-virtual/range {v26 .. v27}, Lorg/spongycastle/crypto/tls/TlsClientContextImpl;->setResumableSession(Lorg/spongycastle/crypto/tls/TlsSession;)V

    .line 156
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->client:Lorg/spongycastle/crypto/tls/TlsClient;

    move-object/from16 v26, v0

    invoke-interface/range {v26 .. v26}, Lorg/spongycastle/crypto/tls/TlsClient;->notifyHandshakeComplete()V

    .line 158
    new-instance v26, Lorg/spongycastle/crypto/tls/DTLSTransport;

    move-object/from16 v0, v26

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/DTLSTransport;-><init>(Lorg/spongycastle/crypto/tls/DTLSRecordLayer;)V

    .line 375
    :goto_16f
    return-object v26

    .line 130
    .end local v10    # "clientVerifyData":[B
    .end local v13    # "expectedServerVerifyData":[B
    .end local v18    # "recordLayerVersion":Lorg/spongycastle/crypto/tls/ProtocolVersion;
    :cond_170
    new-instance v26, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v27, 0xa

    invoke-direct/range {v26 .. v27}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v26

    .line 161
    .restart local v18    # "recordLayerVersion":Lorg/spongycastle/crypto/tls/ProtocolVersion;
    :cond_178
    invoke-virtual/range {p0 .. p1}, Lorg/spongycastle/crypto/tls/DTLSClientProtocol;->invalidateSession(Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;)V

    .line 163
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->selectedSessionID:[B

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    array-length v0, v0

    move/from16 v26, v0

    if-lez v26, :cond_19b

    .line 165
    new-instance v26, Lorg/spongycastle/crypto/tls/TlsSessionImpl;

    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->selectedSessionID:[B

    move-object/from16 v27, v0

    const/16 v28, 0x0

    invoke-direct/range {v26 .. v28}, Lorg/spongycastle/crypto/tls/TlsSessionImpl;-><init>([BLorg/spongycastle/crypto/tls/SessionParameters;)V

    move-object/from16 v0, v26

    move-object/from16 v1, p1

    iput-object v0, v1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->tlsSession:Lorg/spongycastle/crypto/tls/TlsSession;

    .line 168
    :cond_19b
    invoke-virtual {v14}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->receiveMessage()Lorg/spongycastle/crypto/tls/DTLSReliableHandshake$Message;

    move-result-object v21

    .line 170
    invoke-virtual/range {v21 .. v21}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake$Message;->getType()S

    move-result v26

    const/16 v27, 0x17

    move/from16 v0, v26

    move/from16 v1, v27

    if-ne v0, v1, :cond_292

    .line 172
    invoke-virtual/range {v21 .. v21}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake$Message;->getBody()[B

    move-result-object v26

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v26

    invoke-virtual {v0, v1, v2}, Lorg/spongycastle/crypto/tls/DTLSClientProtocol;->processServerSupplementalData(Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;[B)V

    .line 173
    invoke-virtual {v14}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->receiveMessage()Lorg/spongycastle/crypto/tls/DTLSReliableHandshake$Message;

    move-result-object v21

    .line 180
    :goto_1bc
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->client:Lorg/spongycastle/crypto/tls/TlsClient;

    move-object/from16 v26, v0

    invoke-interface/range {v26 .. v26}, Lorg/spongycastle/crypto/tls/TlsClient;->getKeyExchange()Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    move-result-object v26

    move-object/from16 v0, v26

    move-object/from16 v1, p1

    iput-object v0, v1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->keyExchange:Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    .line 181
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->keyExchange:Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    move-object/from16 v26, v0

    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->clientContext:Lorg/spongycastle/crypto/tls/TlsClientContextImpl;

    move-object/from16 v27, v0

    invoke-interface/range {v26 .. v27}, Lorg/spongycastle/crypto/tls/TlsKeyExchange;->init(Lorg/spongycastle/crypto/tls/TlsContext;)V

    .line 183
    const/16 v20, 0x0

    .line 185
    .local v20, "serverCertificate":Lorg/spongycastle/crypto/tls/Certificate;
    invoke-virtual/range {v21 .. v21}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake$Message;->getType()S

    move-result v26

    const/16 v27, 0xb

    move/from16 v0, v26

    move/from16 v1, v27

    if-ne v0, v1, :cond_29f

    .line 187
    invoke-virtual/range {v21 .. v21}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake$Message;->getBody()[B

    move-result-object v26

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v26

    invoke-virtual {v0, v1, v2}, Lorg/spongycastle/crypto/tls/DTLSClientProtocol;->processServerCertificate(Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;[B)Lorg/spongycastle/crypto/tls/Certificate;

    move-result-object v20

    .line 188
    invoke-virtual {v14}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->receiveMessage()Lorg/spongycastle/crypto/tls/DTLSReliableHandshake$Message;

    move-result-object v21

    .line 197
    :goto_1fb
    if-eqz v20, :cond_203

    invoke-virtual/range {v20 .. v20}, Lorg/spongycastle/crypto/tls/Certificate;->isEmpty()Z

    move-result v26

    if-eqz v26, :cond_20b

    .line 199
    :cond_203
    const/16 v26, 0x0

    move/from16 v0, v26

    move-object/from16 v1, p1

    iput-boolean v0, v1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->allowCertificateStatus:Z

    .line 202
    :cond_20b
    invoke-virtual/range {v21 .. v21}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake$Message;->getType()S

    move-result v26

    const/16 v27, 0x16

    move/from16 v0, v26

    move/from16 v1, v27

    if-ne v0, v1, :cond_228

    .line 204
    invoke-virtual/range {v21 .. v21}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake$Message;->getBody()[B

    move-result-object v26

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v26

    invoke-virtual {v0, v1, v2}, Lorg/spongycastle/crypto/tls/DTLSClientProtocol;->processCertificateStatus(Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;[B)V

    .line 205
    invoke-virtual {v14}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->receiveMessage()Lorg/spongycastle/crypto/tls/DTLSReliableHandshake$Message;

    move-result-object v21

    .line 212
    :cond_228
    invoke-virtual/range {v21 .. v21}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake$Message;->getType()S

    move-result v26

    const/16 v27, 0xc

    move/from16 v0, v26

    move/from16 v1, v27

    if-ne v0, v1, :cond_2aa

    .line 214
    invoke-virtual/range {v21 .. v21}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake$Message;->getBody()[B

    move-result-object v26

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v26

    invoke-virtual {v0, v1, v2}, Lorg/spongycastle/crypto/tls/DTLSClientProtocol;->processServerKeyExchange(Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;[B)V

    .line 215
    invoke-virtual {v14}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->receiveMessage()Lorg/spongycastle/crypto/tls/DTLSReliableHandshake$Message;

    move-result-object v21

    .line 223
    :goto_245
    invoke-virtual/range {v21 .. v21}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake$Message;->getType()S

    move-result v26

    const/16 v27, 0xd

    move/from16 v0, v26

    move/from16 v1, v27

    if-ne v0, v1, :cond_273

    .line 225
    invoke-virtual/range {v21 .. v21}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake$Message;->getBody()[B

    move-result-object v26

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v26

    invoke-virtual {v0, v1, v2}, Lorg/spongycastle/crypto/tls/DTLSClientProtocol;->processCertificateRequest(Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;[B)V

    .line 231
    invoke-virtual {v14}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->getHandshakeHash()Lorg/spongycastle/crypto/tls/TlsHandshakeHash;

    move-result-object v26

    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->certificateRequest:Lorg/spongycastle/crypto/tls/CertificateRequest;

    move-object/from16 v27, v0

    .line 232
    invoke-virtual/range {v27 .. v27}, Lorg/spongycastle/crypto/tls/CertificateRequest;->getSupportedSignatureAlgorithms()Ljava/util/Vector;

    move-result-object v27

    .line 231
    invoke-static/range {v26 .. v27}, Lorg/spongycastle/crypto/tls/TlsUtils;->trackHashAlgorithms(Lorg/spongycastle/crypto/tls/TlsHandshakeHash;Ljava/util/Vector;)V

    .line 234
    invoke-virtual {v14}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->receiveMessage()Lorg/spongycastle/crypto/tls/DTLSReliableHandshake$Message;

    move-result-object v21

    .line 241
    :cond_273
    invoke-virtual/range {v21 .. v21}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake$Message;->getType()S

    move-result v26

    const/16 v27, 0xe

    move/from16 v0, v26

    move/from16 v1, v27

    if-ne v0, v1, :cond_2b4

    .line 243
    invoke-virtual/range {v21 .. v21}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake$Message;->getBody()[B

    move-result-object v26

    move-object/from16 v0, v26

    array-length v0, v0

    move/from16 v26, v0

    if-eqz v26, :cond_2bc

    .line 245
    new-instance v26, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v27, 0x32

    invoke-direct/range {v26 .. v27}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v26

    .line 177
    .end local v20    # "serverCertificate":Lorg/spongycastle/crypto/tls/Certificate;
    :cond_292
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->client:Lorg/spongycastle/crypto/tls/TlsClient;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    invoke-interface/range {v26 .. v27}, Lorg/spongycastle/crypto/tls/TlsClient;->processServerSupplementalData(Ljava/util/Vector;)V

    goto/16 :goto_1bc

    .line 193
    .restart local v20    # "serverCertificate":Lorg/spongycastle/crypto/tls/Certificate;
    :cond_29f
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->keyExchange:Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    move-object/from16 v26, v0

    invoke-interface/range {v26 .. v26}, Lorg/spongycastle/crypto/tls/TlsKeyExchange;->skipServerCredentials()V

    goto/16 :goto_1fb

    .line 220
    :cond_2aa
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->keyExchange:Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    move-object/from16 v26, v0

    invoke-interface/range {v26 .. v26}, Lorg/spongycastle/crypto/tls/TlsKeyExchange;->skipServerKeyExchange()V

    goto :goto_245

    .line 250
    :cond_2b4
    new-instance v26, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v27, 0xa

    invoke-direct/range {v26 .. v27}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v26

    .line 253
    :cond_2bc
    invoke-virtual {v14}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->getHandshakeHash()Lorg/spongycastle/crypto/tls/TlsHandshakeHash;

    move-result-object v26

    invoke-interface/range {v26 .. v26}, Lorg/spongycastle/crypto/tls/TlsHandshakeHash;->sealHashAlgorithms()V

    .line 255
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->client:Lorg/spongycastle/crypto/tls/TlsClient;

    move-object/from16 v26, v0

    invoke-interface/range {v26 .. v26}, Lorg/spongycastle/crypto/tls/TlsClient;->getClientSupplementalData()Ljava/util/Vector;

    move-result-object v9

    .line 256
    .local v9, "clientSupplementalData":Ljava/util/Vector;
    if-eqz v9, :cond_2dc

    .line 258
    invoke-static {v9}, Lorg/spongycastle/crypto/tls/DTLSClientProtocol;->generateSupplementalData(Ljava/util/Vector;)[B

    move-result-object v25

    .line 259
    .local v25, "supplementalDataBody":[B
    const/16 v26, 0x17

    move/from16 v0, v26

    move-object/from16 v1, v25

    invoke-virtual {v14, v0, v1}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->sendMessage(S[B)V

    .line 262
    .end local v25    # "supplementalDataBody":[B
    :cond_2dc
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->certificateRequest:Lorg/spongycastle/crypto/tls/CertificateRequest;

    move-object/from16 v26, v0

    if-eqz v26, :cond_31c

    .line 264
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->authentication:Lorg/spongycastle/crypto/tls/TlsAuthentication;

    move-object/from16 v26, v0

    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->certificateRequest:Lorg/spongycastle/crypto/tls/CertificateRequest;

    move-object/from16 v27, v0

    invoke-interface/range {v26 .. v27}, Lorg/spongycastle/crypto/tls/TlsAuthentication;->getClientCredentials(Lorg/spongycastle/crypto/tls/CertificateRequest;)Lorg/spongycastle/crypto/tls/TlsCredentials;

    move-result-object v26

    move-object/from16 v0, v26

    move-object/from16 v1, p1

    iput-object v0, v1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->clientCredentials:Lorg/spongycastle/crypto/tls/TlsCredentials;

    .line 272
    const/4 v6, 0x0

    .line 273
    .local v6, "clientCertificate":Lorg/spongycastle/crypto/tls/Certificate;
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->clientCredentials:Lorg/spongycastle/crypto/tls/TlsCredentials;

    move-object/from16 v26, v0

    if-eqz v26, :cond_30d

    .line 275
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->clientCredentials:Lorg/spongycastle/crypto/tls/TlsCredentials;

    move-object/from16 v26, v0

    invoke-interface/range {v26 .. v26}, Lorg/spongycastle/crypto/tls/TlsCredentials;->getCertificate()Lorg/spongycastle/crypto/tls/Certificate;

    move-result-object v6

    .line 277
    :cond_30d
    if-nez v6, :cond_311

    .line 279
    sget-object v6, Lorg/spongycastle/crypto/tls/Certificate;->EMPTY_CHAIN:Lorg/spongycastle/crypto/tls/Certificate;

    .line 282
    :cond_311
    invoke-static {v6}, Lorg/spongycastle/crypto/tls/DTLSClientProtocol;->generateCertificate(Lorg/spongycastle/crypto/tls/Certificate;)[B

    move-result-object v3

    .line 283
    .local v3, "certificateBody":[B
    const/16 v26, 0xb

    move/from16 v0, v26

    invoke-virtual {v14, v0, v3}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->sendMessage(S[B)V

    .line 286
    .end local v3    # "certificateBody":[B
    .end local v6    # "clientCertificate":Lorg/spongycastle/crypto/tls/Certificate;
    :cond_31c
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->clientCredentials:Lorg/spongycastle/crypto/tls/TlsCredentials;

    move-object/from16 v26, v0

    if-eqz v26, :cond_4ce

    .line 288
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->keyExchange:Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    move-object/from16 v26, v0

    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->clientCredentials:Lorg/spongycastle/crypto/tls/TlsCredentials;

    move-object/from16 v27, v0

    invoke-interface/range {v26 .. v27}, Lorg/spongycastle/crypto/tls/TlsKeyExchange;->processClientCredentials(Lorg/spongycastle/crypto/tls/TlsCredentials;)V

    .line 295
    :goto_333
    invoke-virtual/range {p0 .. p1}, Lorg/spongycastle/crypto/tls/DTLSClientProtocol;->generateClientKeyExchange(Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;)[B

    move-result-object v8

    .line 296
    .local v8, "clientKeyExchangeBody":[B
    const/16 v26, 0x10

    move/from16 v0, v26

    invoke-virtual {v14, v0, v8}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->sendMessage(S[B)V

    .line 298
    invoke-virtual {v14}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->prepareToFinish()Lorg/spongycastle/crypto/tls/TlsHandshakeHash;

    move-result-object v17

    .line 299
    .local v17, "prepareFinishHash":Lorg/spongycastle/crypto/tls/TlsHandshakeHash;
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->clientContext:Lorg/spongycastle/crypto/tls/TlsClientContextImpl;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    move-object/from16 v0, v26

    move-object/from16 v1, v17

    move-object/from16 v2, v27

    invoke-static {v0, v1, v2}, Lorg/spongycastle/crypto/tls/TlsProtocol;->getCurrentPRFHash(Lorg/spongycastle/crypto/tls/TlsContext;Lorg/spongycastle/crypto/tls/TlsHandshakeHash;[B)[B

    move-result-object v26

    move-object/from16 v0, v26

    move-object/from16 v1, v19

    iput-object v0, v1, Lorg/spongycastle/crypto/tls/SecurityParameters;->sessionHash:[B

    .line 301
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->clientContext:Lorg/spongycastle/crypto/tls/TlsClientContextImpl;

    move-object/from16 v26, v0

    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->keyExchange:Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    move-object/from16 v27, v0

    invoke-static/range {v26 .. v27}, Lorg/spongycastle/crypto/tls/TlsProtocol;->establishMasterSecret(Lorg/spongycastle/crypto/tls/TlsContext;Lorg/spongycastle/crypto/tls/TlsKeyExchange;)V

    .line 302
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->client:Lorg/spongycastle/crypto/tls/TlsClient;

    move-object/from16 v26, v0

    invoke-interface/range {v26 .. v26}, Lorg/spongycastle/crypto/tls/TlsClient;->getCipher()Lorg/spongycastle/crypto/tls/TlsCipher;

    move-result-object v26

    move-object/from16 v0, p2

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->initPendingEpoch(Lorg/spongycastle/crypto/tls/TlsCipher;)V

    .line 304
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->clientCredentials:Lorg/spongycastle/crypto/tls/TlsCredentials;

    move-object/from16 v26, v0

    if-eqz v26, :cond_3ca

    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->clientCredentials:Lorg/spongycastle/crypto/tls/TlsCredentials;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    instance-of v0, v0, Lorg/spongycastle/crypto/tls/TlsSignerCredentials;

    move/from16 v26, v0

    if-eqz v26, :cond_3ca

    .line 306
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->clientCredentials:Lorg/spongycastle/crypto/tls/TlsCredentials;

    move-object/from16 v24, v0

    check-cast v24, Lorg/spongycastle/crypto/tls/TlsSignerCredentials;

    .line 311
    .local v24, "signerCredentials":Lorg/spongycastle/crypto/tls/TlsSignerCredentials;
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->clientContext:Lorg/spongycastle/crypto/tls/TlsClientContextImpl;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    move-object/from16 v1, v24

    invoke-static {v0, v1}, Lorg/spongycastle/crypto/tls/TlsUtils;->getSignatureAndHashAlgorithm(Lorg/spongycastle/crypto/tls/TlsContext;Lorg/spongycastle/crypto/tls/TlsSignerCredentials;)Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;

    move-result-object v23

    .line 315
    .local v23, "signatureAndHashAlgorithm":Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;
    if-nez v23, :cond_4d9

    .line 317
    invoke-virtual/range {v19 .. v19}, Lorg/spongycastle/crypto/tls/SecurityParameters;->getSessionHash()[B

    move-result-object v15

    .line 324
    .local v15, "hash":[B
    :goto_3ac
    move-object/from16 v0, v24

    invoke-interface {v0, v15}, Lorg/spongycastle/crypto/tls/TlsSignerCredentials;->generateCertificateSignature([B)[B

    move-result-object v22

    .line 325
    .local v22, "signature":[B
    new-instance v4, Lorg/spongycastle/crypto/tls/DigitallySigned;

    move-object/from16 v0, v23

    move-object/from16 v1, v22

    invoke-direct {v4, v0, v1}, Lorg/spongycastle/crypto/tls/DigitallySigned;-><init>(Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;[B)V

    .line 326
    .local v4, "certificateVerify":Lorg/spongycastle/crypto/tls/DigitallySigned;
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v4}, Lorg/spongycastle/crypto/tls/DTLSClientProtocol;->generateCertificateVerify(Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;Lorg/spongycastle/crypto/tls/DigitallySigned;)[B

    move-result-object v5

    .line 327
    .local v5, "certificateVerifyBody":[B
    const/16 v26, 0xf

    move/from16 v0, v26

    invoke-virtual {v14, v0, v5}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->sendMessage(S[B)V

    .line 331
    .end local v4    # "certificateVerify":Lorg/spongycastle/crypto/tls/DigitallySigned;
    .end local v5    # "certificateVerifyBody":[B
    .end local v15    # "hash":[B
    .end local v22    # "signature":[B
    .end local v23    # "signatureAndHashAlgorithm":Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;
    .end local v24    # "signerCredentials":Lorg/spongycastle/crypto/tls/TlsSignerCredentials;
    :cond_3ca
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->clientContext:Lorg/spongycastle/crypto/tls/TlsClientContextImpl;

    move-object/from16 v26, v0

    const-string v27, "client finished"

    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->clientContext:Lorg/spongycastle/crypto/tls/TlsClientContextImpl;

    move-object/from16 v28, v0

    .line 332
    invoke-virtual {v14}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->getHandshakeHash()Lorg/spongycastle/crypto/tls/TlsHandshakeHash;

    move-result-object v29

    const/16 v30, 0x0

    invoke-static/range {v28 .. v30}, Lorg/spongycastle/crypto/tls/TlsProtocol;->getCurrentPRFHash(Lorg/spongycastle/crypto/tls/TlsContext;Lorg/spongycastle/crypto/tls/TlsHandshakeHash;[B)[B

    move-result-object v28

    .line 331
    invoke-static/range {v26 .. v28}, Lorg/spongycastle/crypto/tls/TlsUtils;->calculateVerifyData(Lorg/spongycastle/crypto/tls/TlsContext;Ljava/lang/String;[B)[B

    move-result-object v10

    .line 333
    .restart local v10    # "clientVerifyData":[B
    const/16 v26, 0x14

    move/from16 v0, v26

    invoke-virtual {v14, v0, v10}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->sendMessage(S[B)V

    .line 335
    move-object/from16 v0, p1

    iget-boolean v0, v0, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->expectSessionTicket:Z

    move/from16 v26, v0

    if-eqz v26, :cond_412

    .line 337
    invoke-virtual {v14}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->receiveMessage()Lorg/spongycastle/crypto/tls/DTLSReliableHandshake$Message;

    move-result-object v21

    .line 338
    invoke-virtual/range {v21 .. v21}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake$Message;->getType()S

    move-result v26

    const/16 v27, 0x4

    move/from16 v0, v26

    move/from16 v1, v27

    if-ne v0, v1, :cond_4e7

    .line 340
    invoke-virtual/range {v21 .. v21}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake$Message;->getBody()[B

    move-result-object v26

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v26

    invoke-virtual {v0, v1, v2}, Lorg/spongycastle/crypto/tls/DTLSClientProtocol;->processNewSessionTicket(Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;[B)V

    .line 349
    :cond_412
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->clientContext:Lorg/spongycastle/crypto/tls/TlsClientContextImpl;

    move-object/from16 v26, v0

    const-string v27, "server finished"

    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->clientContext:Lorg/spongycastle/crypto/tls/TlsClientContextImpl;

    move-object/from16 v28, v0

    .line 350
    invoke-virtual {v14}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->getHandshakeHash()Lorg/spongycastle/crypto/tls/TlsHandshakeHash;

    move-result-object v29

    const/16 v30, 0x0

    invoke-static/range {v28 .. v30}, Lorg/spongycastle/crypto/tls/TlsProtocol;->getCurrentPRFHash(Lorg/spongycastle/crypto/tls/TlsContext;Lorg/spongycastle/crypto/tls/TlsHandshakeHash;[B)[B

    move-result-object v28

    .line 349
    invoke-static/range {v26 .. v28}, Lorg/spongycastle/crypto/tls/TlsUtils;->calculateVerifyData(Lorg/spongycastle/crypto/tls/TlsContext;Ljava/lang/String;[B)[B

    move-result-object v13

    .line 351
    .restart local v13    # "expectedServerVerifyData":[B
    const/16 v26, 0x14

    move/from16 v0, v26

    invoke-virtual {v14, v0}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->receiveMessageBody(S)[B

    move-result-object v26

    move-object/from16 v0, p0

    move-object/from16 v1, v26

    invoke-virtual {v0, v1, v13}, Lorg/spongycastle/crypto/tls/DTLSClientProtocol;->processFinished([B[B)V

    .line 353
    invoke-virtual {v14}, Lorg/spongycastle/crypto/tls/DTLSReliableHandshake;->finish()V

    .line 355
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->tlsSession:Lorg/spongycastle/crypto/tls/TlsSession;

    move-object/from16 v26, v0

    if-eqz v26, :cond_4ba

    .line 357
    new-instance v26, Lorg/spongycastle/crypto/tls/SessionParameters$Builder;

    invoke-direct/range {v26 .. v26}, Lorg/spongycastle/crypto/tls/SessionParameters$Builder;-><init>()V

    .line 358
    invoke-virtual/range {v19 .. v19}, Lorg/spongycastle/crypto/tls/SecurityParameters;->getCipherSuite()I

    move-result v27

    invoke-virtual/range {v26 .. v27}, Lorg/spongycastle/crypto/tls/SessionParameters$Builder;->setCipherSuite(I)Lorg/spongycastle/crypto/tls/SessionParameters$Builder;

    move-result-object v26

    .line 359
    invoke-virtual/range {v19 .. v19}, Lorg/spongycastle/crypto/tls/SecurityParameters;->getCompressionAlgorithm()S

    move-result v27

    invoke-virtual/range {v26 .. v27}, Lorg/spongycastle/crypto/tls/SessionParameters$Builder;->setCompressionAlgorithm(S)Lorg/spongycastle/crypto/tls/SessionParameters$Builder;

    move-result-object v26

    .line 360
    invoke-virtual/range {v19 .. v19}, Lorg/spongycastle/crypto/tls/SecurityParameters;->getMasterSecret()[B

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Lorg/spongycastle/crypto/tls/SessionParameters$Builder;->setMasterSecret([B)Lorg/spongycastle/crypto/tls/SessionParameters$Builder;

    move-result-object v26

    .line 361
    move-object/from16 v0, v26

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lorg/spongycastle/crypto/tls/SessionParameters$Builder;->setPeerCertificate(Lorg/spongycastle/crypto/tls/Certificate;)Lorg/spongycastle/crypto/tls/SessionParameters$Builder;

    move-result-object v26

    .line 362
    invoke-virtual/range {v19 .. v19}, Lorg/spongycastle/crypto/tls/SecurityParameters;->getPSKIdentity()[B

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Lorg/spongycastle/crypto/tls/SessionParameters$Builder;->setPSKIdentity([B)Lorg/spongycastle/crypto/tls/SessionParameters$Builder;

    move-result-object v26

    .line 363
    invoke-virtual/range {v19 .. v19}, Lorg/spongycastle/crypto/tls/SecurityParameters;->getSRPIdentity()[B

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Lorg/spongycastle/crypto/tls/SessionParameters$Builder;->setSRPIdentity([B)Lorg/spongycastle/crypto/tls/SessionParameters$Builder;

    move-result-object v26

    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->serverExtensions:Ljava/util/Hashtable;

    move-object/from16 v27, v0

    .line 365
    invoke-virtual/range {v26 .. v27}, Lorg/spongycastle/crypto/tls/SessionParameters$Builder;->setServerExtensions(Ljava/util/Hashtable;)Lorg/spongycastle/crypto/tls/SessionParameters$Builder;

    move-result-object v26

    .line 366
    invoke-virtual/range {v26 .. v26}, Lorg/spongycastle/crypto/tls/SessionParameters$Builder;->build()Lorg/spongycastle/crypto/tls/SessionParameters;

    move-result-object v26

    move-object/from16 v0, v26

    move-object/from16 v1, p1

    iput-object v0, v1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->sessionParameters:Lorg/spongycastle/crypto/tls/SessionParameters;

    .line 368
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->tlsSession:Lorg/spongycastle/crypto/tls/TlsSession;

    move-object/from16 v26, v0

    invoke-interface/range {v26 .. v26}, Lorg/spongycastle/crypto/tls/TlsSession;->getSessionID()[B

    move-result-object v26

    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->sessionParameters:Lorg/spongycastle/crypto/tls/SessionParameters;

    move-object/from16 v27, v0

    invoke-static/range {v26 .. v27}, Lorg/spongycastle/crypto/tls/TlsUtils;->importSession([BLorg/spongycastle/crypto/tls/SessionParameters;)Lorg/spongycastle/crypto/tls/TlsSession;

    move-result-object v26

    move-object/from16 v0, v26

    move-object/from16 v1, p1

    iput-object v0, v1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->tlsSession:Lorg/spongycastle/crypto/tls/TlsSession;

    .line 370
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->clientContext:Lorg/spongycastle/crypto/tls/TlsClientContextImpl;

    move-object/from16 v26, v0

    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->tlsSession:Lorg/spongycastle/crypto/tls/TlsSession;

    move-object/from16 v27, v0

    invoke-virtual/range {v26 .. v27}, Lorg/spongycastle/crypto/tls/TlsClientContextImpl;->setResumableSession(Lorg/spongycastle/crypto/tls/TlsSession;)V

    .line 373
    :cond_4ba
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->client:Lorg/spongycastle/crypto/tls/TlsClient;

    move-object/from16 v26, v0

    invoke-interface/range {v26 .. v26}, Lorg/spongycastle/crypto/tls/TlsClient;->notifyHandshakeComplete()V

    .line 375
    new-instance v26, Lorg/spongycastle/crypto/tls/DTLSTransport;

    move-object/from16 v0, v26

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/DTLSTransport;-><init>(Lorg/spongycastle/crypto/tls/DTLSRecordLayer;)V

    goto/16 :goto_16f

    .line 292
    .end local v8    # "clientKeyExchangeBody":[B
    .end local v10    # "clientVerifyData":[B
    .end local v13    # "expectedServerVerifyData":[B
    .end local v17    # "prepareFinishHash":Lorg/spongycastle/crypto/tls/TlsHandshakeHash;
    :cond_4ce
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->keyExchange:Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    move-object/from16 v26, v0

    invoke-interface/range {v26 .. v26}, Lorg/spongycastle/crypto/tls/TlsKeyExchange;->skipClientCredentials()V

    goto/16 :goto_333

    .line 321
    .restart local v8    # "clientKeyExchangeBody":[B
    .restart local v17    # "prepareFinishHash":Lorg/spongycastle/crypto/tls/TlsHandshakeHash;
    .restart local v23    # "signatureAndHashAlgorithm":Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;
    .restart local v24    # "signerCredentials":Lorg/spongycastle/crypto/tls/TlsSignerCredentials;
    :cond_4d9
    invoke-virtual/range {v23 .. v23}, Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;->getHash()S

    move-result v26

    move-object/from16 v0, v17

    move/from16 v1, v26

    invoke-interface {v0, v1}, Lorg/spongycastle/crypto/tls/TlsHandshakeHash;->getFinalHash(S)[B

    move-result-object v15

    .restart local v15    # "hash":[B
    goto/16 :goto_3ac

    .line 344
    .end local v15    # "hash":[B
    .end local v23    # "signatureAndHashAlgorithm":Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;
    .end local v24    # "signerCredentials":Lorg/spongycastle/crypto/tls/TlsSignerCredentials;
    .restart local v10    # "clientVerifyData":[B
    :cond_4e7
    new-instance v26, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v27, 0xa

    invoke-direct/range {v26 .. v27}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v26
.end method

.method public connect(Lorg/spongycastle/crypto/tls/TlsClient;Lorg/spongycastle/crypto/tls/DatagramTransport;)Lorg/spongycastle/crypto/tls/DTLSTransport;
    .registers 13
    .param p1, "client"    # Lorg/spongycastle/crypto/tls/TlsClient;
    .param p2, "transport"    # Lorg/spongycastle/crypto/tls/DatagramTransport;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v9, 0x50

    .line 24
    if-nez p1, :cond_c

    .line 26
    new-instance v7, Ljava/lang/IllegalArgumentException;

    const-string v8, "\'client\' cannot be null"

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 28
    :cond_c
    if-nez p2, :cond_16

    .line 30
    new-instance v7, Ljava/lang/IllegalArgumentException;

    const-string v8, "\'transport\' cannot be null"

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 33
    :cond_16
    new-instance v3, Lorg/spongycastle/crypto/tls/SecurityParameters;

    invoke-direct {v3}, Lorg/spongycastle/crypto/tls/SecurityParameters;-><init>()V

    .line 34
    .local v3, "securityParameters":Lorg/spongycastle/crypto/tls/SecurityParameters;
    const/4 v7, 0x1

    iput v7, v3, Lorg/spongycastle/crypto/tls/SecurityParameters;->entity:I

    .line 36
    new-instance v6, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;

    invoke-direct {v6}, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;-><init>()V

    .line 37
    .local v6, "state":Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;
    iput-object p1, v6, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->client:Lorg/spongycastle/crypto/tls/TlsClient;

    .line 38
    new-instance v7, Lorg/spongycastle/crypto/tls/TlsClientContextImpl;

    iget-object v8, p0, Lorg/spongycastle/crypto/tls/DTLSClientProtocol;->secureRandom:Ljava/security/SecureRandom;

    invoke-direct {v7, v8, v3}, Lorg/spongycastle/crypto/tls/TlsClientContextImpl;-><init>(Ljava/security/SecureRandom;Lorg/spongycastle/crypto/tls/SecurityParameters;)V

    iput-object v7, v6, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->clientContext:Lorg/spongycastle/crypto/tls/TlsClientContextImpl;

    .line 40
    invoke-interface {p1}, Lorg/spongycastle/crypto/tls/TlsClient;->shouldUseGMTUnixTime()Z

    move-result v7

    iget-object v8, v6, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->clientContext:Lorg/spongycastle/crypto/tls/TlsClientContextImpl;

    .line 41
    invoke-virtual {v8}, Lorg/spongycastle/crypto/tls/TlsClientContextImpl;->getNonceRandomGenerator()Lorg/spongycastle/crypto/prng/RandomGenerator;

    move-result-object v8

    .line 40
    invoke-static {v7, v8}, Lorg/spongycastle/crypto/tls/TlsProtocol;->createRandomBlock(ZLorg/spongycastle/crypto/prng/RandomGenerator;)[B

    move-result-object v7

    iput-object v7, v3, Lorg/spongycastle/crypto/tls/SecurityParameters;->clientRandom:[B

    .line 43
    iget-object v7, v6, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->clientContext:Lorg/spongycastle/crypto/tls/TlsClientContextImpl;

    invoke-interface {p1, v7}, Lorg/spongycastle/crypto/tls/TlsClient;->init(Lorg/spongycastle/crypto/tls/TlsClientContext;)V

    .line 45
    new-instance v2, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;

    iget-object v7, v6, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->clientContext:Lorg/spongycastle/crypto/tls/TlsClientContextImpl;

    const/16 v8, 0x16

    invoke-direct {v2, p2, v7, p1, v8}, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;-><init>(Lorg/spongycastle/crypto/tls/DatagramTransport;Lorg/spongycastle/crypto/tls/TlsContext;Lorg/spongycastle/crypto/tls/TlsPeer;S)V

    .line 47
    .local v2, "recordLayer":Lorg/spongycastle/crypto/tls/DTLSRecordLayer;
    iget-object v7, v6, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->client:Lorg/spongycastle/crypto/tls/TlsClient;

    invoke-interface {v7}, Lorg/spongycastle/crypto/tls/TlsClient;->getSessionToResume()Lorg/spongycastle/crypto/tls/TlsSession;

    move-result-object v5

    .line 48
    .local v5, "sessionToResume":Lorg/spongycastle/crypto/tls/TlsSession;
    if-eqz v5, :cond_64

    invoke-interface {v5}, Lorg/spongycastle/crypto/tls/TlsSession;->isResumable()Z

    move-result v7

    if-eqz v7, :cond_64

    .line 50
    invoke-interface {v5}, Lorg/spongycastle/crypto/tls/TlsSession;->exportSessionParameters()Lorg/spongycastle/crypto/tls/SessionParameters;

    move-result-object v4

    .line 51
    .local v4, "sessionParameters":Lorg/spongycastle/crypto/tls/SessionParameters;
    if-eqz v4, :cond_64

    .line 53
    iput-object v5, v6, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->tlsSession:Lorg/spongycastle/crypto/tls/TlsSession;

    .line 54
    iput-object v4, v6, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->sessionParameters:Lorg/spongycastle/crypto/tls/SessionParameters;

    .line 60
    .end local v4    # "sessionParameters":Lorg/spongycastle/crypto/tls/SessionParameters;
    :cond_64
    :try_start_64
    invoke-virtual {p0, v6, v2}, Lorg/spongycastle/crypto/tls/DTLSClientProtocol;->clientHandshake(Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;Lorg/spongycastle/crypto/tls/DTLSRecordLayer;)Lorg/spongycastle/crypto/tls/DTLSTransport;
    :try_end_67
    .catch Lorg/spongycastle/crypto/tls/TlsFatalAlert; {:try_start_64 .. :try_end_67} :catch_69
    .catch Ljava/io/IOException; {:try_start_64 .. :try_end_67} :catch_72
    .catch Ljava/lang/RuntimeException; {:try_start_64 .. :try_end_67} :catch_77

    move-result-object v7

    return-object v7

    .line 62
    :catch_69
    move-exception v1

    .line 64
    .local v1, "fatalAlert":Lorg/spongycastle/crypto/tls/TlsFatalAlert;
    invoke-virtual {v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;->getAlertDescription()S

    move-result v7

    invoke-virtual {v2, v7}, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->fail(S)V

    .line 65
    throw v1

    .line 67
    .end local v1    # "fatalAlert":Lorg/spongycastle/crypto/tls/TlsFatalAlert;
    :catch_72
    move-exception v0

    .line 69
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v2, v9}, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->fail(S)V

    .line 70
    throw v0

    .line 72
    .end local v0    # "e":Ljava/io/IOException;
    :catch_77
    move-exception v0

    .line 74
    .local v0, "e":Ljava/lang/RuntimeException;
    invoke-virtual {v2, v9}, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->fail(S)V

    .line 75
    new-instance v7, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    invoke-direct {v7, v9, v0}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(SLjava/lang/Throwable;)V

    throw v7
.end method

.method protected generateCertificateVerify(Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;Lorg/spongycastle/crypto/tls/DigitallySigned;)[B
    .registers 5
    .param p1, "state"    # Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;
    .param p2, "certificateVerify"    # Lorg/spongycastle/crypto/tls/DigitallySigned;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 381
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 382
    .local v0, "buf":Ljava/io/ByteArrayOutputStream;
    invoke-virtual {p2, v0}, Lorg/spongycastle/crypto/tls/DigitallySigned;->encode(Ljava/io/OutputStream;)V

    .line 383
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    return-object v1
.end method

.method protected generateClientHello(Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;Lorg/spongycastle/crypto/tls/TlsClient;)[B
    .registers 15
    .param p1, "state"    # Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;
    .param p2, "client"    # Lorg/spongycastle/crypto/tls/TlsClient;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 389
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 391
    .local v0, "buf":Ljava/io/ByteArrayOutputStream;
    invoke-interface {p2}, Lorg/spongycastle/crypto/tls/TlsClient;->getClientVersion()Lorg/spongycastle/crypto/tls/ProtocolVersion;

    move-result-object v1

    .line 392
    .local v1, "client_version":Lorg/spongycastle/crypto/tls/ProtocolVersion;
    invoke-virtual {v1}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->isDTLS()Z

    move-result v9

    if-nez v9, :cond_17

    .line 394
    new-instance v9, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v10, 0x50

    invoke-direct {v9, v10}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v9

    .line 397
    :cond_17
    iget-object v2, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->clientContext:Lorg/spongycastle/crypto/tls/TlsClientContextImpl;

    .line 399
    .local v2, "context":Lorg/spongycastle/crypto/tls/TlsClientContextImpl;
    invoke-virtual {v2, v1}, Lorg/spongycastle/crypto/tls/TlsClientContextImpl;->setClientVersion(Lorg/spongycastle/crypto/tls/ProtocolVersion;)V

    .line 400
    invoke-static {v1, v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeVersion(Lorg/spongycastle/crypto/tls/ProtocolVersion;Ljava/io/OutputStream;)V

    .line 402
    invoke-virtual {v2}, Lorg/spongycastle/crypto/tls/TlsClientContextImpl;->getSecurityParameters()Lorg/spongycastle/crypto/tls/SecurityParameters;

    move-result-object v7

    .line 403
    .local v7, "securityParameters":Lorg/spongycastle/crypto/tls/SecurityParameters;
    invoke-virtual {v7}, Lorg/spongycastle/crypto/tls/SecurityParameters;->getClientRandom()[B

    move-result-object v9

    invoke-virtual {v0, v9}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 406
    sget-object v8, Lorg/spongycastle/crypto/tls/TlsUtils;->EMPTY_BYTES:[B

    .line 407
    .local v8, "session_id":[B
    iget-object v9, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->tlsSession:Lorg/spongycastle/crypto/tls/TlsSession;

    if-eqz v9, :cond_3f

    .line 409
    iget-object v9, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->tlsSession:Lorg/spongycastle/crypto/tls/TlsSession;

    invoke-interface {v9}, Lorg/spongycastle/crypto/tls/TlsSession;->getSessionID()[B

    move-result-object v8

    .line 410
    if-eqz v8, :cond_3d

    array-length v9, v8

    const/16 v10, 0x20

    if-le v9, v10, :cond_3f

    .line 412
    :cond_3d
    sget-object v8, Lorg/spongycastle/crypto/tls/TlsUtils;->EMPTY_BYTES:[B

    .line 415
    :cond_3f
    invoke-static {v8, v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeOpaque8([BLjava/io/OutputStream;)V

    .line 418
    sget-object v9, Lorg/spongycastle/crypto/tls/TlsUtils;->EMPTY_BYTES:[B

    invoke-static {v9, v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeOpaque8([BLjava/io/OutputStream;)V

    .line 420
    invoke-interface {p2}, Lorg/spongycastle/crypto/tls/TlsClient;->isFallback()Z

    move-result v3

    .line 425
    .local v3, "fallback":Z
    invoke-interface {p2}, Lorg/spongycastle/crypto/tls/TlsClient;->getCipherSuites()[I

    move-result-object v9

    iput-object v9, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->offeredCipherSuites:[I

    .line 428
    invoke-interface {p2}, Lorg/spongycastle/crypto/tls/TlsClient;->getClientExtensions()Ljava/util/Hashtable;

    move-result-object v9

    iput-object v9, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->clientExtensions:Ljava/util/Hashtable;

    .line 437
    iget-object v9, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->clientExtensions:Ljava/util/Hashtable;

    sget-object v10, Lorg/spongycastle/crypto/tls/TlsProtocol;->EXT_RenegotiationInfo:Ljava/lang/Integer;

    invoke-static {v9, v10}, Lorg/spongycastle/crypto/tls/TlsUtils;->getExtensionData(Ljava/util/Hashtable;Ljava/lang/Integer;)[B

    move-result-object v6

    .line 438
    .local v6, "renegExtData":[B
    if-nez v6, :cond_b2

    const/4 v4, 0x1

    .line 440
    .local v4, "noRenegExt":Z
    :goto_62
    iget-object v9, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->offeredCipherSuites:[I

    const/16 v10, 0xff

    invoke-static {v9, v10}, Lorg/spongycastle/util/Arrays;->contains([II)Z

    move-result v9

    if-nez v9, :cond_b4

    const/4 v5, 0x1

    .line 442
    .local v5, "noRenegSCSV":Z
    :goto_6d
    if-eqz v4, :cond_7b

    if-eqz v5, :cond_7b

    .line 445
    iget-object v9, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->offeredCipherSuites:[I

    const/16 v10, 0xff

    invoke-static {v9, v10}, Lorg/spongycastle/util/Arrays;->append([II)[I

    move-result-object v9

    iput-object v9, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->offeredCipherSuites:[I

    .line 454
    :cond_7b
    if-eqz v3, :cond_91

    iget-object v9, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->offeredCipherSuites:[I

    const/16 v10, 0x5600

    invoke-static {v9, v10}, Lorg/spongycastle/util/Arrays;->contains([II)Z

    move-result v9

    if-nez v9, :cond_91

    .line 456
    iget-object v9, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->offeredCipherSuites:[I

    const/16 v10, 0x5600

    invoke-static {v9, v10}, Lorg/spongycastle/util/Arrays;->append([II)[I

    move-result-object v9

    iput-object v9, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->offeredCipherSuites:[I

    .line 459
    :cond_91
    iget-object v9, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->offeredCipherSuites:[I

    invoke-static {v9, v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint16ArrayWithUint16Length([ILjava/io/OutputStream;)V

    .line 465
    const/4 v9, 0x1

    new-array v9, v9, [S

    const/4 v10, 0x0

    const/4 v11, 0x0

    aput-short v11, v9, v10

    iput-object v9, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->offeredCompressionMethods:[S

    .line 467
    iget-object v9, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->offeredCompressionMethods:[S

    invoke-static {v9, v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint8ArrayWithUint8Length([SLjava/io/OutputStream;)V

    .line 470
    iget-object v9, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->clientExtensions:Ljava/util/Hashtable;

    if-eqz v9, :cond_ad

    .line 472
    iget-object v9, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->clientExtensions:Ljava/util/Hashtable;

    invoke-static {v0, v9}, Lorg/spongycastle/crypto/tls/TlsProtocol;->writeExtensions(Ljava/io/OutputStream;Ljava/util/Hashtable;)V

    .line 475
    :cond_ad
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v9

    return-object v9

    .line 438
    .end local v4    # "noRenegExt":Z
    .end local v5    # "noRenegSCSV":Z
    :cond_b2
    const/4 v4, 0x0

    goto :goto_62

    .line 440
    .restart local v4    # "noRenegExt":Z
    :cond_b4
    const/4 v5, 0x0

    goto :goto_6d
.end method

.method protected generateClientKeyExchange(Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;)[B
    .registers 4
    .param p1, "state"    # Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 481
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 482
    .local v0, "buf":Ljava/io/ByteArrayOutputStream;
    iget-object v1, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->keyExchange:Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    invoke-interface {v1, v0}, Lorg/spongycastle/crypto/tls/TlsKeyExchange;->generateClientKeyExchange(Ljava/io/OutputStream;)V

    .line 483
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    return-object v1
.end method

.method protected invalidateSession(Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;)V
    .registers 4
    .param p1, "state"    # Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;

    .prologue
    const/4 v1, 0x0

    .line 488
    iget-object v0, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->sessionParameters:Lorg/spongycastle/crypto/tls/SessionParameters;

    if-eqz v0, :cond_c

    .line 490
    iget-object v0, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->sessionParameters:Lorg/spongycastle/crypto/tls/SessionParameters;

    invoke-virtual {v0}, Lorg/spongycastle/crypto/tls/SessionParameters;->clear()V

    .line 491
    iput-object v1, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->sessionParameters:Lorg/spongycastle/crypto/tls/SessionParameters;

    .line 494
    :cond_c
    iget-object v0, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->tlsSession:Lorg/spongycastle/crypto/tls/TlsSession;

    if-eqz v0, :cond_17

    .line 496
    iget-object v0, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->tlsSession:Lorg/spongycastle/crypto/tls/TlsSession;

    invoke-interface {v0}, Lorg/spongycastle/crypto/tls/TlsSession;->invalidate()V

    .line 497
    iput-object v1, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->tlsSession:Lorg/spongycastle/crypto/tls/TlsSession;

    .line 499
    :cond_17
    return-void
.end method

.method protected processCertificateRequest(Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;[B)V
    .registers 6
    .param p1, "state"    # Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;
    .param p2, "body"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 504
    iget-object v1, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->authentication:Lorg/spongycastle/crypto/tls/TlsAuthentication;

    if-nez v1, :cond_c

    .line 510
    new-instance v1, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v2, 0x28

    invoke-direct {v1, v2}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v1

    .line 513
    :cond_c
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 515
    .local v0, "buf":Ljava/io/ByteArrayInputStream;
    iget-object v1, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->clientContext:Lorg/spongycastle/crypto/tls/TlsClientContextImpl;

    invoke-static {v1, v0}, Lorg/spongycastle/crypto/tls/CertificateRequest;->parse(Lorg/spongycastle/crypto/tls/TlsContext;Ljava/io/InputStream;)Lorg/spongycastle/crypto/tls/CertificateRequest;

    move-result-object v1

    iput-object v1, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->certificateRequest:Lorg/spongycastle/crypto/tls/CertificateRequest;

    .line 517
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsProtocol;->assertEmpty(Ljava/io/ByteArrayInputStream;)V

    .line 519
    iget-object v1, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->keyExchange:Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    iget-object v2, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->certificateRequest:Lorg/spongycastle/crypto/tls/CertificateRequest;

    invoke-interface {v1, v2}, Lorg/spongycastle/crypto/tls/TlsKeyExchange;->validateCertificateRequest(Lorg/spongycastle/crypto/tls/CertificateRequest;)V

    .line 520
    return-void
.end method

.method protected processCertificateStatus(Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;[B)V
    .registers 6
    .param p1, "state"    # Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;
    .param p2, "body"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 525
    iget-boolean v1, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->allowCertificateStatus:Z

    if-nez v1, :cond_c

    .line 532
    new-instance v1, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v2, 0xa

    invoke-direct {v1, v2}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v1

    .line 535
    :cond_c
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 537
    .local v0, "buf":Ljava/io/ByteArrayInputStream;
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/CertificateStatus;->parse(Ljava/io/InputStream;)Lorg/spongycastle/crypto/tls/CertificateStatus;

    move-result-object v1

    iput-object v1, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->certificateStatus:Lorg/spongycastle/crypto/tls/CertificateStatus;

    .line 539
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsProtocol;->assertEmpty(Ljava/io/ByteArrayInputStream;)V

    .line 542
    return-void
.end method

.method protected processHelloVerifyRequest(Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;[B)[B
    .registers 9
    .param p1, "state"    # Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;
    .param p2, "body"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v5, 0x2f

    .line 547
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 549
    .local v0, "buf":Ljava/io/ByteArrayInputStream;
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->readVersion(Ljava/io/InputStream;)Lorg/spongycastle/crypto/tls/ProtocolVersion;

    move-result-object v2

    .line 550
    .local v2, "server_version":Lorg/spongycastle/crypto/tls/ProtocolVersion;
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->readOpaque8(Ljava/io/InputStream;)[B

    move-result-object v1

    .line 552
    .local v1, "cookie":[B
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsProtocol;->assertEmpty(Ljava/io/ByteArrayInputStream;)V

    .line 556
    iget-object v3, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->clientContext:Lorg/spongycastle/crypto/tls/TlsClientContextImpl;

    invoke-virtual {v3}, Lorg/spongycastle/crypto/tls/TlsClientContextImpl;->getClientVersion()Lorg/spongycastle/crypto/tls/ProtocolVersion;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->isEqualOrEarlierVersionOf(Lorg/spongycastle/crypto/tls/ProtocolVersion;)Z

    move-result v3

    if-nez v3, :cond_24

    .line 558
    new-instance v3, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    invoke-direct {v3, v5}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v3

    .line 565
    :cond_24
    sget-object v3, Lorg/spongycastle/crypto/tls/ProtocolVersion;->DTLSv12:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    invoke-virtual {v3, v2}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->isEqualOrEarlierVersionOf(Lorg/spongycastle/crypto/tls/ProtocolVersion;)Z

    move-result v3

    if-nez v3, :cond_37

    array-length v3, v1

    const/16 v4, 0x20

    if-le v3, v4, :cond_37

    .line 567
    new-instance v3, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    invoke-direct {v3, v5}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v3

    .line 570
    :cond_37
    return-object v1
.end method

.method protected processNewSessionTicket(Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;[B)V
    .registers 6
    .param p1, "state"    # Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;
    .param p2, "body"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 576
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 578
    .local v0, "buf":Ljava/io/ByteArrayInputStream;
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/NewSessionTicket;->parse(Ljava/io/InputStream;)Lorg/spongycastle/crypto/tls/NewSessionTicket;

    move-result-object v1

    .line 580
    .local v1, "newSessionTicket":Lorg/spongycastle/crypto/tls/NewSessionTicket;
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsProtocol;->assertEmpty(Ljava/io/ByteArrayInputStream;)V

    .line 582
    iget-object v2, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->client:Lorg/spongycastle/crypto/tls/TlsClient;

    invoke-interface {v2, v1}, Lorg/spongycastle/crypto/tls/TlsClient;->notifyNewSessionTicket(Lorg/spongycastle/crypto/tls/NewSessionTicket;)V

    .line 583
    return-void
.end method

.method protected processServerCertificate(Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;[B)Lorg/spongycastle/crypto/tls/Certificate;
    .registers 6
    .param p1, "state"    # Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;
    .param p2, "body"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 588
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 590
    .local v0, "buf":Ljava/io/ByteArrayInputStream;
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/Certificate;->parse(Ljava/io/InputStream;)Lorg/spongycastle/crypto/tls/Certificate;

    move-result-object v1

    .line 592
    .local v1, "serverCertificate":Lorg/spongycastle/crypto/tls/Certificate;
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsProtocol;->assertEmpty(Ljava/io/ByteArrayInputStream;)V

    .line 594
    iget-object v2, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->keyExchange:Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    invoke-interface {v2, v1}, Lorg/spongycastle/crypto/tls/TlsKeyExchange;->processServerCertificate(Lorg/spongycastle/crypto/tls/Certificate;)V

    .line 595
    iget-object v2, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->client:Lorg/spongycastle/crypto/tls/TlsClient;

    invoke-interface {v2}, Lorg/spongycastle/crypto/tls/TlsClient;->getAuthentication()Lorg/spongycastle/crypto/tls/TlsAuthentication;

    move-result-object v2

    iput-object v2, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->authentication:Lorg/spongycastle/crypto/tls/TlsAuthentication;

    .line 596
    iget-object v2, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->authentication:Lorg/spongycastle/crypto/tls/TlsAuthentication;

    invoke-interface {v2, v1}, Lorg/spongycastle/crypto/tls/TlsAuthentication;->notifyServerCertificate(Lorg/spongycastle/crypto/tls/Certificate;)V

    .line 598
    return-object v1
.end method

.method protected processServerHello(Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;[B)V
    .registers 16
    .param p1, "state"    # Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;
    .param p2, "body"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 604
    iget-object v11, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->clientContext:Lorg/spongycastle/crypto/tls/TlsClientContextImpl;

    invoke-virtual {v11}, Lorg/spongycastle/crypto/tls/TlsClientContextImpl;->getSecurityParameters()Lorg/spongycastle/crypto/tls/SecurityParameters;

    move-result-object v4

    .line 606
    .local v4, "securityParameters":Lorg/spongycastle/crypto/tls/SecurityParameters;
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 609
    .local v0, "buf":Ljava/io/ByteArrayInputStream;
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->readVersion(Ljava/io/InputStream;)Lorg/spongycastle/crypto/tls/ProtocolVersion;

    move-result-object v8

    .line 610
    .local v8, "server_version":Lorg/spongycastle/crypto/tls/ProtocolVersion;
    invoke-virtual {p0, p1, v8}, Lorg/spongycastle/crypto/tls/DTLSClientProtocol;->reportServerVersion(Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;Lorg/spongycastle/crypto/tls/ProtocolVersion;)V

    .line 613
    const/16 v11, 0x20

    invoke-static {v11, v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->readFully(ILjava/io/InputStream;)[B

    move-result-object v11

    iput-object v11, v4, Lorg/spongycastle/crypto/tls/SecurityParameters;->serverRandom:[B

    .line 615
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->readOpaque8(Ljava/io/InputStream;)[B

    move-result-object v11

    iput-object v11, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->selectedSessionID:[B

    .line 616
    iget-object v11, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->selectedSessionID:[B

    array-length v11, v11

    const/16 v12, 0x20

    if-le v11, v12, :cond_2f

    .line 618
    new-instance v11, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v12, 0x2f

    invoke-direct {v11, v12}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v11

    .line 620
    :cond_2f
    iget-object v11, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->client:Lorg/spongycastle/crypto/tls/TlsClient;

    iget-object v12, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->selectedSessionID:[B

    invoke-interface {v11, v12}, Lorg/spongycastle/crypto/tls/TlsClient;->notifySessionID([B)V

    .line 621
    iget-object v11, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->selectedSessionID:[B

    array-length v11, v11

    if-lez v11, :cond_78

    iget-object v11, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->tlsSession:Lorg/spongycastle/crypto/tls/TlsSession;

    if-eqz v11, :cond_78

    iget-object v11, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->selectedSessionID:[B

    iget-object v12, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->tlsSession:Lorg/spongycastle/crypto/tls/TlsSession;

    .line 622
    invoke-interface {v12}, Lorg/spongycastle/crypto/tls/TlsSession;->getSessionID()[B

    move-result-object v12

    invoke-static {v11, v12}, Lorg/spongycastle/util/Arrays;->areEqual([B[B)Z

    move-result v11

    if-eqz v11, :cond_78

    const/4 v11, 0x1

    :goto_4e
    iput-boolean v11, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->resumedSession:Z

    .line 624
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint16(Ljava/io/InputStream;)I

    move-result v5

    .line 625
    .local v5, "selectedCipherSuite":I
    iget-object v11, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->offeredCipherSuites:[I

    invoke-static {v11, v5}, Lorg/spongycastle/util/Arrays;->contains([II)Z

    move-result v11

    if-eqz v11, :cond_70

    if-eqz v5, :cond_70

    .line 627
    invoke-static {v5}, Lorg/spongycastle/crypto/tls/CipherSuite;->isSCSV(I)Z

    move-result v11

    if-nez v11, :cond_70

    iget-object v11, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->clientContext:Lorg/spongycastle/crypto/tls/TlsClientContextImpl;

    .line 628
    invoke-virtual {v11}, Lorg/spongycastle/crypto/tls/TlsClientContextImpl;->getServerVersion()Lorg/spongycastle/crypto/tls/ProtocolVersion;

    move-result-object v11

    invoke-static {v5, v11}, Lorg/spongycastle/crypto/tls/TlsUtils;->isValidCipherSuiteForVersion(ILorg/spongycastle/crypto/tls/ProtocolVersion;)Z

    move-result v11

    if-nez v11, :cond_7a

    .line 630
    :cond_70
    new-instance v11, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v12, 0x2f

    invoke-direct {v11, v12}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v11

    .line 622
    .end local v5    # "selectedCipherSuite":I
    :cond_78
    const/4 v11, 0x0

    goto :goto_4e

    .line 632
    .restart local v5    # "selectedCipherSuite":I
    :cond_7a
    const/16 v11, 0x2f

    invoke-static {v5, v11}, Lorg/spongycastle/crypto/tls/DTLSClientProtocol;->validateSelectedCipherSuite(IS)V

    .line 633
    iget-object v11, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->client:Lorg/spongycastle/crypto/tls/TlsClient;

    invoke-interface {v11, v5}, Lorg/spongycastle/crypto/tls/TlsClient;->notifySelectedCipherSuite(I)V

    .line 635
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint8(Ljava/io/InputStream;)S

    move-result v6

    .line 636
    .local v6, "selectedCompressionMethod":S
    iget-object v11, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->offeredCompressionMethods:[S

    invoke-static {v11, v6}, Lorg/spongycastle/util/Arrays;->contains([SS)Z

    move-result v11

    if-nez v11, :cond_98

    .line 638
    new-instance v11, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v12, 0x2f

    invoke-direct {v11, v12}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v11

    .line 640
    :cond_98
    iget-object v11, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->client:Lorg/spongycastle/crypto/tls/TlsClient;

    invoke-interface {v11, v6}, Lorg/spongycastle/crypto/tls/TlsClient;->notifySelectedCompressionMethod(S)V

    .line 658
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsProtocol;->readExtensions(Ljava/io/ByteArrayInputStream;)Ljava/util/Hashtable;

    move-result-object v11

    iput-object v11, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->serverExtensions:Ljava/util/Hashtable;

    .line 665
    iget-object v11, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->serverExtensions:Ljava/util/Hashtable;

    if-eqz v11, :cond_d6

    .line 667
    iget-object v11, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->serverExtensions:Ljava/util/Hashtable;

    invoke-virtual {v11}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v1

    .line 668
    .local v1, "e":Ljava/util/Enumeration;
    :cond_ad
    :goto_ad
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v11

    if-eqz v11, :cond_d6

    .line 670
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    .line 679
    .local v2, "extType":Ljava/lang/Integer;
    sget-object v11, Lorg/spongycastle/crypto/tls/TlsProtocol;->EXT_RenegotiationInfo:Ljava/lang/Integer;

    invoke-virtual {v2, v11}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_ad

    .line 691
    iget-object v11, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->clientExtensions:Ljava/util/Hashtable;

    invoke-static {v11, v2}, Lorg/spongycastle/crypto/tls/TlsUtils;->getExtensionData(Ljava/util/Hashtable;Ljava/lang/Integer;)[B

    move-result-object v11

    if-nez v11, :cond_d1

    .line 693
    new-instance v11, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v12, 0x6e

    invoke-direct {v11, v12}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v11

    .line 701
    :cond_d1
    iget-boolean v11, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->resumedSession:Z

    if-eqz v11, :cond_ad

    goto :goto_ad

    .line 719
    .end local v1    # "e":Ljava/util/Enumeration;
    .end local v2    # "extType":Ljava/lang/Integer;
    :cond_d6
    iget-object v11, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->serverExtensions:Ljava/util/Hashtable;

    sget-object v12, Lorg/spongycastle/crypto/tls/TlsProtocol;->EXT_RenegotiationInfo:Ljava/lang/Integer;

    invoke-static {v11, v12}, Lorg/spongycastle/crypto/tls/TlsUtils;->getExtensionData(Ljava/util/Hashtable;Ljava/lang/Integer;)[B

    move-result-object v3

    .line 720
    .local v3, "renegExtData":[B
    if-eqz v3, :cond_f7

    .line 728
    const/4 v11, 0x1

    iput-boolean v11, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->secure_renegotiation:Z

    .line 730
    sget-object v11, Lorg/spongycastle/crypto/tls/TlsUtils;->EMPTY_BYTES:[B

    .line 731
    invoke-static {v11}, Lorg/spongycastle/crypto/tls/TlsProtocol;->createRenegotiationInfo([B)[B

    move-result-object v11

    .line 730
    invoke-static {v3, v11}, Lorg/spongycastle/util/Arrays;->constantTimeAreEqual([B[B)Z

    move-result v11

    if-nez v11, :cond_f7

    .line 733
    new-instance v11, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v12, 0x28

    invoke-direct {v11, v12}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v11

    .line 739
    :cond_f7
    iget-object v11, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->client:Lorg/spongycastle/crypto/tls/TlsClient;

    iget-boolean v12, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->secure_renegotiation:Z

    invoke-interface {v11, v12}, Lorg/spongycastle/crypto/tls/TlsClient;->notifySecureRenegotiation(Z)V

    .line 741
    iget-object v9, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->clientExtensions:Ljava/util/Hashtable;

    .local v9, "sessionClientExtensions":Ljava/util/Hashtable;
    iget-object v10, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->serverExtensions:Ljava/util/Hashtable;

    .line 742
    .local v10, "sessionServerExtensions":Ljava/util/Hashtable;
    iget-boolean v11, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->resumedSession:Z

    if-eqz v11, :cond_125

    .line 744
    iget-object v11, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->sessionParameters:Lorg/spongycastle/crypto/tls/SessionParameters;

    invoke-virtual {v11}, Lorg/spongycastle/crypto/tls/SessionParameters;->getCipherSuite()I

    move-result v11

    if-ne v5, v11, :cond_116

    iget-object v11, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->sessionParameters:Lorg/spongycastle/crypto/tls/SessionParameters;

    .line 745
    invoke-virtual {v11}, Lorg/spongycastle/crypto/tls/SessionParameters;->getCompressionAlgorithm()S

    move-result v11

    if-eq v6, v11, :cond_11e

    .line 747
    :cond_116
    new-instance v11, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v12, 0x2f

    invoke-direct {v11, v12}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v11

    .line 750
    :cond_11e
    const/4 v9, 0x0

    .line 751
    iget-object v11, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->sessionParameters:Lorg/spongycastle/crypto/tls/SessionParameters;

    invoke-virtual {v11}, Lorg/spongycastle/crypto/tls/SessionParameters;->readServerExtensions()Ljava/util/Hashtable;

    move-result-object v10

    .line 754
    :cond_125
    iput v5, v4, Lorg/spongycastle/crypto/tls/SecurityParameters;->cipherSuite:I

    .line 755
    iput-short v6, v4, Lorg/spongycastle/crypto/tls/SecurityParameters;->compressionAlgorithm:S

    .line 757
    if-eqz v10, :cond_17d

    .line 766
    invoke-static {v10}, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->hasEncryptThenMACExtension(Ljava/util/Hashtable;)Z

    move-result v7

    .line 767
    .local v7, "serverSentEncryptThenMAC":Z
    if-eqz v7, :cond_143

    invoke-virtual {v4}, Lorg/spongycastle/crypto/tls/SecurityParameters;->getCipherSuite()I

    move-result v11

    invoke-static {v11}, Lorg/spongycastle/crypto/tls/TlsUtils;->isBlockCipherSuite(I)Z

    move-result v11

    if-nez v11, :cond_143

    .line 769
    new-instance v11, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v12, 0x2f

    invoke-direct {v11, v12}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v11

    .line 771
    :cond_143
    iput-boolean v7, v4, Lorg/spongycastle/crypto/tls/SecurityParameters;->encryptThenMAC:Z

    .line 774
    invoke-static {v10}, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->hasExtendedMasterSecretExtension(Ljava/util/Hashtable;)Z

    move-result v11

    iput-boolean v11, v4, Lorg/spongycastle/crypto/tls/SecurityParameters;->extendedMasterSecret:Z

    .line 776
    iget-boolean v11, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->resumedSession:Z

    const/16 v12, 0x2f

    invoke-static {v11, v9, v10, v12}, Lorg/spongycastle/crypto/tls/DTLSClientProtocol;->evaluateMaxFragmentLengthExtension(ZLjava/util/Hashtable;Ljava/util/Hashtable;S)S

    move-result v11

    iput-short v11, v4, Lorg/spongycastle/crypto/tls/SecurityParameters;->maxFragmentLength:S

    .line 779
    invoke-static {v10}, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->hasTruncatedHMacExtension(Ljava/util/Hashtable;)Z

    move-result v11

    iput-boolean v11, v4, Lorg/spongycastle/crypto/tls/SecurityParameters;->truncatedHMac:Z

    .line 785
    iget-boolean v11, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->resumedSession:Z

    if-nez v11, :cond_195

    sget-object v11, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->EXT_status_request:Ljava/lang/Integer;

    const/16 v12, 0x2f

    .line 786
    invoke-static {v10, v11, v12}, Lorg/spongycastle/crypto/tls/TlsUtils;->hasExpectedEmptyExtensionData(Ljava/util/Hashtable;Ljava/lang/Integer;S)Z

    move-result v11

    if-eqz v11, :cond_195

    const/4 v11, 0x1

    :goto_16a
    iput-boolean v11, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->allowCertificateStatus:Z

    .line 789
    iget-boolean v11, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->resumedSession:Z

    if-nez v11, :cond_197

    sget-object v11, Lorg/spongycastle/crypto/tls/TlsProtocol;->EXT_SessionTicket:Ljava/lang/Integer;

    const/16 v12, 0x2f

    .line 790
    invoke-static {v10, v11, v12}, Lorg/spongycastle/crypto/tls/TlsUtils;->hasExpectedEmptyExtensionData(Ljava/util/Hashtable;Ljava/lang/Integer;S)Z

    move-result v11

    if-eqz v11, :cond_197

    const/4 v11, 0x1

    :goto_17b
    iput-boolean v11, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->expectSessionTicket:Z

    .line 801
    .end local v7    # "serverSentEncryptThenMAC":Z
    :cond_17d
    if-eqz v9, :cond_184

    .line 803
    iget-object v11, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->client:Lorg/spongycastle/crypto/tls/TlsClient;

    invoke-interface {v11, v10}, Lorg/spongycastle/crypto/tls/TlsClient;->processServerExtensions(Ljava/util/Hashtable;)V

    .line 806
    :cond_184
    iget-object v11, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->clientContext:Lorg/spongycastle/crypto/tls/TlsClientContextImpl;

    .line 807
    invoke-virtual {v4}, Lorg/spongycastle/crypto/tls/SecurityParameters;->getCipherSuite()I

    move-result v12

    .line 806
    invoke-static {v11, v12}, Lorg/spongycastle/crypto/tls/TlsProtocol;->getPRFAlgorithm(Lorg/spongycastle/crypto/tls/TlsContext;I)I

    move-result v11

    iput v11, v4, Lorg/spongycastle/crypto/tls/SecurityParameters;->prfAlgorithm:I

    .line 813
    const/16 v11, 0xc

    iput v11, v4, Lorg/spongycastle/crypto/tls/SecurityParameters;->verifyDataLength:I

    .line 814
    return-void

    .line 786
    .restart local v7    # "serverSentEncryptThenMAC":Z
    :cond_195
    const/4 v11, 0x0

    goto :goto_16a

    .line 790
    :cond_197
    const/4 v11, 0x0

    goto :goto_17b
.end method

.method protected processServerKeyExchange(Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;[B)V
    .registers 5
    .param p1, "state"    # Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;
    .param p2, "body"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 819
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 821
    .local v0, "buf":Ljava/io/ByteArrayInputStream;
    iget-object v1, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->keyExchange:Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    invoke-interface {v1, v0}, Lorg/spongycastle/crypto/tls/TlsKeyExchange;->processServerKeyExchange(Ljava/io/InputStream;)V

    .line 823
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsProtocol;->assertEmpty(Ljava/io/ByteArrayInputStream;)V

    .line 824
    return-void
.end method

.method protected processServerSupplementalData(Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;[B)V
    .registers 6
    .param p1, "state"    # Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;
    .param p2, "body"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 829
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 830
    .local v0, "buf":Ljava/io/ByteArrayInputStream;
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsProtocol;->readSupplementalDataMessage(Ljava/io/ByteArrayInputStream;)Ljava/util/Vector;

    move-result-object v1

    .line 831
    .local v1, "serverSupplementalData":Ljava/util/Vector;
    iget-object v2, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->client:Lorg/spongycastle/crypto/tls/TlsClient;

    invoke-interface {v2, v1}, Lorg/spongycastle/crypto/tls/TlsClient;->processServerSupplementalData(Ljava/util/Vector;)V

    .line 832
    return-void
.end method

.method protected reportServerVersion(Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;Lorg/spongycastle/crypto/tls/ProtocolVersion;)V
    .registers 7
    .param p1, "state"    # Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;
    .param p2, "server_version"    # Lorg/spongycastle/crypto/tls/ProtocolVersion;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 837
    iget-object v0, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->clientContext:Lorg/spongycastle/crypto/tls/TlsClientContextImpl;

    .line 838
    .local v0, "clientContext":Lorg/spongycastle/crypto/tls/TlsClientContextImpl;
    invoke-virtual {v0}, Lorg/spongycastle/crypto/tls/TlsClientContextImpl;->getServerVersion()Lorg/spongycastle/crypto/tls/ProtocolVersion;

    move-result-object v1

    .line 839
    .local v1, "currentServerVersion":Lorg/spongycastle/crypto/tls/ProtocolVersion;
    if-nez v1, :cond_11

    .line 841
    invoke-virtual {v0, p2}, Lorg/spongycastle/crypto/tls/TlsClientContextImpl;->setServerVersion(Lorg/spongycastle/crypto/tls/ProtocolVersion;)V

    .line 842
    iget-object v2, p1, Lorg/spongycastle/crypto/tls/DTLSClientProtocol$ClientHandshakeState;->client:Lorg/spongycastle/crypto/tls/TlsClient;

    invoke-interface {v2, p2}, Lorg/spongycastle/crypto/tls/TlsClient;->notifyServerVersion(Lorg/spongycastle/crypto/tls/ProtocolVersion;)V

    .line 848
    :cond_10
    return-void

    .line 844
    :cond_11
    invoke-virtual {v1, p2}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->equals(Lorg/spongycastle/crypto/tls/ProtocolVersion;)Z

    move-result v2

    if-nez v2, :cond_10

    .line 846
    new-instance v2, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v3, 0x2f

    invoke-direct {v2, v3}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v2
.end method
