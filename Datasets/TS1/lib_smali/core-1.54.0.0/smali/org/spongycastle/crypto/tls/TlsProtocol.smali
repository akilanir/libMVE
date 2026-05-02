.class public abstract Lorg/spongycastle/crypto/tls/TlsProtocol;
.super Ljava/lang/Object;
.source "TlsProtocol.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/spongycastle/crypto/tls/TlsProtocol$HandshakeMessage;
    }
.end annotation


# static fields
.field protected static final CS_CERTIFICATE_REQUEST:S = 0x7s

.field protected static final CS_CERTIFICATE_STATUS:S = 0x5s

.field protected static final CS_CERTIFICATE_VERIFY:S = 0xcs

.field protected static final CS_CLIENT_CERTIFICATE:S = 0xas

.field protected static final CS_CLIENT_FINISHED:S = 0xds

.field protected static final CS_CLIENT_HELLO:S = 0x1s

.field protected static final CS_CLIENT_KEY_EXCHANGE:S = 0xbs

.field protected static final CS_CLIENT_SUPPLEMENTAL_DATA:S = 0x9s

.field protected static final CS_END:S = 0x10s

.field protected static final CS_SERVER_CERTIFICATE:S = 0x4s

.field protected static final CS_SERVER_FINISHED:S = 0xfs

.field protected static final CS_SERVER_HELLO:S = 0x2s

.field protected static final CS_SERVER_HELLO_DONE:S = 0x8s

.field protected static final CS_SERVER_KEY_EXCHANGE:S = 0x6s

.field protected static final CS_SERVER_SESSION_TICKET:S = 0xes

.field protected static final CS_SERVER_SUPPLEMENTAL_DATA:S = 0x3s

.field protected static final CS_START:S = 0x0s

.field protected static final EXT_RenegotiationInfo:Ljava/lang/Integer;

.field protected static final EXT_SessionTicket:Ljava/lang/Integer;

.field private static final TLS_ERROR_MESSAGE:Ljava/lang/String; = "Internal TLS error, this could be an attack"


# instance fields
.field private alertQueue:Lorg/spongycastle/crypto/tls/ByteQueue;

.field protected allowCertificateStatus:Z

.field private volatile appDataReady:Z

.field private applicationDataQueue:Lorg/spongycastle/crypto/tls/ByteQueue;

.field protected blocking:Z

.field protected clientExtensions:Ljava/util/Hashtable;

.field private volatile closed:Z

.field protected connection_state:S

.field protected expectSessionTicket:Z

.field private expected_verify_data:[B

.field private volatile failedWithError:Z

.field private handshakeQueue:Lorg/spongycastle/crypto/tls/ByteQueue;

.field protected inputBuffers:Lorg/spongycastle/crypto/tls/ByteQueueInputStream;

.field protected offeredCipherSuites:[I

.field protected offeredCompressionMethods:[S

.field protected outputBuffer:Lorg/spongycastle/crypto/tls/ByteQueueOutputStream;

.field protected peerCertificate:Lorg/spongycastle/crypto/tls/Certificate;

.field protected receivedChangeCipherSpec:Z

.field recordStream:Lorg/spongycastle/crypto/tls/RecordStream;

.field protected resumedSession:Z

.field protected secureRandom:Ljava/security/SecureRandom;

.field protected secure_renegotiation:Z

.field protected securityParameters:Lorg/spongycastle/crypto/tls/SecurityParameters;

.field protected serverExtensions:Ljava/util/Hashtable;

.field protected sessionParameters:Lorg/spongycastle/crypto/tls/SessionParameters;

.field private volatile splitApplicationDataRecords:Z

.field private tlsInputStream:Lorg/spongycastle/crypto/tls/TlsInputStream;

.field private tlsOutputStream:Lorg/spongycastle/crypto/tls/TlsOutputStream;

.field protected tlsSession:Lorg/spongycastle/crypto/tls/TlsSession;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 21
    const v0, 0xff01

    invoke-static {v0}, Lorg/spongycastle/util/Integers;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lorg/spongycastle/crypto/tls/TlsProtocol;->EXT_RenegotiationInfo:Ljava/lang/Integer;

    .line 22
    const/16 v0, 0x23

    invoke-static {v0}, Lorg/spongycastle/util/Integers;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lorg/spongycastle/crypto/tls/TlsProtocol;->EXT_SessionTicket:Ljava/lang/Integer;

    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Ljava/io/OutputStream;Ljava/security/SecureRandom;)V
    .registers 9
    .param p1, "input"    # Ljava/io/InputStream;
    .param p2, "output"    # Ljava/io/OutputStream;
    .param p3, "secureRandom"    # Ljava/security/SecureRandom;

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 92
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    new-instance v0, Lorg/spongycastle/crypto/tls/ByteQueue;

    invoke-direct {v0}, Lorg/spongycastle/crypto/tls/ByteQueue;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->applicationDataQueue:Lorg/spongycastle/crypto/tls/ByteQueue;

    .line 51
    new-instance v0, Lorg/spongycastle/crypto/tls/ByteQueue;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/ByteQueue;-><init>(I)V

    iput-object v0, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->alertQueue:Lorg/spongycastle/crypto/tls/ByteQueue;

    .line 52
    new-instance v0, Lorg/spongycastle/crypto/tls/ByteQueue;

    invoke-direct {v0}, Lorg/spongycastle/crypto/tls/ByteQueue;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->handshakeQueue:Lorg/spongycastle/crypto/tls/ByteQueue;

    .line 61
    iput-object v2, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->tlsInputStream:Lorg/spongycastle/crypto/tls/TlsInputStream;

    .line 62
    iput-object v2, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->tlsOutputStream:Lorg/spongycastle/crypto/tls/TlsOutputStream;

    .line 64
    iput-boolean v3, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->closed:Z

    .line 65
    iput-boolean v3, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->failedWithError:Z

    .line 66
    iput-boolean v3, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->appDataReady:Z

    .line 67
    iput-boolean v4, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->splitApplicationDataRecords:Z

    .line 68
    iput-object v2, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->expected_verify_data:[B

    .line 70
    iput-object v2, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->tlsSession:Lorg/spongycastle/crypto/tls/TlsSession;

    .line 71
    iput-object v2, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->sessionParameters:Lorg/spongycastle/crypto/tls/SessionParameters;

    .line 72
    iput-object v2, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->securityParameters:Lorg/spongycastle/crypto/tls/SecurityParameters;

    .line 73
    iput-object v2, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->peerCertificate:Lorg/spongycastle/crypto/tls/Certificate;

    .line 75
    iput-object v2, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->offeredCipherSuites:[I

    .line 76
    iput-object v2, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->offeredCompressionMethods:[S

    .line 77
    iput-object v2, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->clientExtensions:Ljava/util/Hashtable;

    .line 78
    iput-object v2, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->serverExtensions:Ljava/util/Hashtable;

    .line 80
    iput-short v3, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->connection_state:S

    .line 81
    iput-boolean v3, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->resumedSession:Z

    .line 82
    iput-boolean v3, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->receivedChangeCipherSpec:Z

    .line 83
    iput-boolean v3, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->secure_renegotiation:Z

    .line 84
    iput-boolean v3, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->allowCertificateStatus:Z

    .line 85
    iput-boolean v3, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->expectSessionTicket:Z

    .line 93
    iput-boolean v4, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->blocking:Z

    .line 94
    new-instance v0, Lorg/spongycastle/crypto/tls/RecordStream;

    invoke-direct {v0, p0, p1, p2}, Lorg/spongycastle/crypto/tls/RecordStream;-><init>(Lorg/spongycastle/crypto/tls/TlsProtocol;Ljava/io/InputStream;Ljava/io/OutputStream;)V

    iput-object v0, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->recordStream:Lorg/spongycastle/crypto/tls/RecordStream;

    .line 95
    iput-object p3, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->secureRandom:Ljava/security/SecureRandom;

    .line 96
    return-void
.end method

.method public constructor <init>(Ljava/security/SecureRandom;)V
    .registers 6
    .param p1, "secureRandom"    # Ljava/security/SecureRandom;

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 99
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    new-instance v0, Lorg/spongycastle/crypto/tls/ByteQueue;

    invoke-direct {v0}, Lorg/spongycastle/crypto/tls/ByteQueue;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->applicationDataQueue:Lorg/spongycastle/crypto/tls/ByteQueue;

    .line 51
    new-instance v0, Lorg/spongycastle/crypto/tls/ByteQueue;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/ByteQueue;-><init>(I)V

    iput-object v0, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->alertQueue:Lorg/spongycastle/crypto/tls/ByteQueue;

    .line 52
    new-instance v0, Lorg/spongycastle/crypto/tls/ByteQueue;

    invoke-direct {v0}, Lorg/spongycastle/crypto/tls/ByteQueue;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->handshakeQueue:Lorg/spongycastle/crypto/tls/ByteQueue;

    .line 61
    iput-object v2, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->tlsInputStream:Lorg/spongycastle/crypto/tls/TlsInputStream;

    .line 62
    iput-object v2, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->tlsOutputStream:Lorg/spongycastle/crypto/tls/TlsOutputStream;

    .line 64
    iput-boolean v3, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->closed:Z

    .line 65
    iput-boolean v3, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->failedWithError:Z

    .line 66
    iput-boolean v3, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->appDataReady:Z

    .line 67
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->splitApplicationDataRecords:Z

    .line 68
    iput-object v2, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->expected_verify_data:[B

    .line 70
    iput-object v2, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->tlsSession:Lorg/spongycastle/crypto/tls/TlsSession;

    .line 71
    iput-object v2, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->sessionParameters:Lorg/spongycastle/crypto/tls/SessionParameters;

    .line 72
    iput-object v2, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->securityParameters:Lorg/spongycastle/crypto/tls/SecurityParameters;

    .line 73
    iput-object v2, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->peerCertificate:Lorg/spongycastle/crypto/tls/Certificate;

    .line 75
    iput-object v2, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->offeredCipherSuites:[I

    .line 76
    iput-object v2, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->offeredCompressionMethods:[S

    .line 77
    iput-object v2, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->clientExtensions:Ljava/util/Hashtable;

    .line 78
    iput-object v2, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->serverExtensions:Ljava/util/Hashtable;

    .line 80
    iput-short v3, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->connection_state:S

    .line 81
    iput-boolean v3, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->resumedSession:Z

    .line 82
    iput-boolean v3, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->receivedChangeCipherSpec:Z

    .line 83
    iput-boolean v3, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->secure_renegotiation:Z

    .line 84
    iput-boolean v3, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->allowCertificateStatus:Z

    .line 85
    iput-boolean v3, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->expectSessionTicket:Z

    .line 100
    iput-boolean v3, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->blocking:Z

    .line 101
    new-instance v0, Lorg/spongycastle/crypto/tls/ByteQueueInputStream;

    invoke-direct {v0}, Lorg/spongycastle/crypto/tls/ByteQueueInputStream;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->inputBuffers:Lorg/spongycastle/crypto/tls/ByteQueueInputStream;

    .line 102
    new-instance v0, Lorg/spongycastle/crypto/tls/ByteQueueOutputStream;

    invoke-direct {v0}, Lorg/spongycastle/crypto/tls/ByteQueueOutputStream;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->outputBuffer:Lorg/spongycastle/crypto/tls/ByteQueueOutputStream;

    .line 103
    new-instance v0, Lorg/spongycastle/crypto/tls/RecordStream;

    iget-object v1, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->inputBuffers:Lorg/spongycastle/crypto/tls/ByteQueueInputStream;

    iget-object v2, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->outputBuffer:Lorg/spongycastle/crypto/tls/ByteQueueOutputStream;

    invoke-direct {v0, p0, v1, v2}, Lorg/spongycastle/crypto/tls/RecordStream;-><init>(Lorg/spongycastle/crypto/tls/TlsProtocol;Ljava/io/InputStream;Ljava/io/OutputStream;)V

    iput-object v0, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->recordStream:Lorg/spongycastle/crypto/tls/RecordStream;

    .line 104
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->secureRandom:Ljava/security/SecureRandom;

    .line 105
    return-void
.end method

.method protected static assertEmpty(Ljava/io/ByteArrayInputStream;)V
    .registers 3
    .param p0, "buf"    # Ljava/io/ByteArrayInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1083
    invoke-virtual {p0}, Ljava/io/ByteArrayInputStream;->available()I

    move-result v0

    if-lez v0, :cond_e

    .line 1085
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v1, 0x32

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v0

    .line 1087
    :cond_e
    return-void
.end method

.method protected static createRandomBlock(ZLorg/spongycastle/crypto/prng/RandomGenerator;)[B
    .registers 4
    .param p0, "useGMTUnixTime"    # Z
    .param p1, "randomGenerator"    # Lorg/spongycastle/crypto/prng/RandomGenerator;

    .prologue
    .line 1091
    const/16 v1, 0x20

    new-array v0, v1, [B

    .line 1092
    .local v0, "result":[B
    invoke-interface {p1, v0}, Lorg/spongycastle/crypto/prng/RandomGenerator;->nextBytes([B)V

    .line 1094
    if-eqz p0, :cond_d

    .line 1096
    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeGMTUnixTime([BI)V

    .line 1099
    :cond_d
    return-object v0
.end method

.method protected static createRenegotiationInfo([B)[B
    .registers 2
    .param p0, "renegotiated_connection"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1105
    invoke-static {p0}, Lorg/spongycastle/crypto/tls/TlsUtils;->encodeOpaque8([B)[B

    move-result-object v0

    return-object v0
.end method

.method protected static establishMasterSecret(Lorg/spongycastle/crypto/tls/TlsContext;Lorg/spongycastle/crypto/tls/TlsKeyExchange;)V
    .registers 6
    .param p0, "context"    # Lorg/spongycastle/crypto/tls/TlsContext;
    .param p1, "keyExchange"    # Lorg/spongycastle/crypto/tls/TlsKeyExchange;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 1111
    invoke-interface {p1}, Lorg/spongycastle/crypto/tls/TlsKeyExchange;->generatePremasterSecret()[B

    move-result-object v0

    .line 1115
    .local v0, "pre_master_secret":[B
    :try_start_5
    invoke-interface {p0}, Lorg/spongycastle/crypto/tls/TlsContext;->getSecurityParameters()Lorg/spongycastle/crypto/tls/SecurityParameters;

    move-result-object v1

    invoke-static {p0, v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->calculateMasterSecret(Lorg/spongycastle/crypto/tls/TlsContext;[B)[B

    move-result-object v2

    iput-object v2, v1, Lorg/spongycastle/crypto/tls/SecurityParameters;->masterSecret:[B
    :try_end_f
    .catchall {:try_start_5 .. :try_end_f} :catchall_15

    .line 1124
    if-eqz v0, :cond_14

    .line 1126
    invoke-static {v0, v3}, Lorg/spongycastle/util/Arrays;->fill([BB)V

    .line 1129
    :cond_14
    return-void

    .line 1124
    :catchall_15
    move-exception v1

    if-eqz v0, :cond_1b

    .line 1126
    invoke-static {v0, v3}, Lorg/spongycastle/util/Arrays;->fill([BB)V

    :cond_1b
    throw v1
.end method

.method protected static getCurrentPRFHash(Lorg/spongycastle/crypto/tls/TlsContext;Lorg/spongycastle/crypto/tls/TlsHandshakeHash;[B)[B
    .registers 7
    .param p0, "context"    # Lorg/spongycastle/crypto/tls/TlsContext;
    .param p1, "handshakeHash"    # Lorg/spongycastle/crypto/tls/TlsHandshakeHash;
    .param p2, "sslSender"    # [B

    .prologue
    const/4 v3, 0x0

    .line 1136
    invoke-interface {p1}, Lorg/spongycastle/crypto/tls/TlsHandshakeHash;->forkPRFHash()Lorg/spongycastle/crypto/Digest;

    move-result-object v1

    .line 1138
    .local v1, "d":Lorg/spongycastle/crypto/Digest;
    if-eqz p2, :cond_11

    invoke-static {p0}, Lorg/spongycastle/crypto/tls/TlsUtils;->isSSL(Lorg/spongycastle/crypto/tls/TlsContext;)Z

    move-result v2

    if-eqz v2, :cond_11

    .line 1140
    array-length v2, p2

    invoke-interface {v1, p2, v3, v2}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 1143
    :cond_11
    invoke-interface {v1}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    move-result v2

    new-array v0, v2, [B

    .line 1144
    .local v0, "bs":[B
    invoke-interface {v1, v0, v3}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 1145
    return-object v0
.end method

.method protected static getPRFAlgorithm(Lorg/spongycastle/crypto/tls/TlsContext;I)I
    .registers 7
    .param p0, "context"    # Lorg/spongycastle/crypto/tls/TlsContext;
    .param p1, "ciphersuite"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v4, 0x2f

    const/4 v2, 0x2

    const/4 v1, 0x1

    const/4 v3, 0x0

    .line 1248
    invoke-static {p0}, Lorg/spongycastle/crypto/tls/TlsUtils;->isTLSv12(Lorg/spongycastle/crypto/tls/TlsContext;)Z

    move-result v0

    .line 1250
    .local v0, "isTLSv12":Z
    sparse-switch p1, :sswitch_data_2a

    .line 1402
    if-eqz v0, :cond_27

    .line 1406
    :cond_e
    :goto_e
    return v1

    .line 1332
    :sswitch_f
    if-nez v0, :cond_e

    .line 1336
    new-instance v1, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    invoke-direct {v1, v4}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v1

    .line 1373
    :sswitch_17
    if-eqz v0, :cond_1b

    move v1, v2

    .line 1375
    goto :goto_e

    .line 1377
    :cond_1b
    new-instance v1, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    invoke-direct {v1, v4}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v1

    .line 1393
    :sswitch_21
    if-eqz v0, :cond_25

    move v1, v2

    .line 1395
    goto :goto_e

    :cond_25
    move v1, v3

    .line 1397
    goto :goto_e

    :cond_27
    move v1, v3

    .line 1406
    goto :goto_e

    .line 1250
    nop

    :sswitch_data_2a
    .sparse-switch
        0x3b -> :sswitch_f
        0x3c -> :sswitch_f
        0x3d -> :sswitch_f
        0x3e -> :sswitch_f
        0x3f -> :sswitch_f
        0x40 -> :sswitch_f
        0x67 -> :sswitch_f
        0x68 -> :sswitch_f
        0x69 -> :sswitch_f
        0x6a -> :sswitch_f
        0x6b -> :sswitch_f
        0x9c -> :sswitch_f
        0x9d -> :sswitch_17
        0x9e -> :sswitch_f
        0x9f -> :sswitch_17
        0xa0 -> :sswitch_f
        0xa1 -> :sswitch_17
        0xa2 -> :sswitch_f
        0xa3 -> :sswitch_17
        0xa4 -> :sswitch_f
        0xa5 -> :sswitch_17
        0xa8 -> :sswitch_f
        0xa9 -> :sswitch_17
        0xaa -> :sswitch_f
        0xab -> :sswitch_17
        0xac -> :sswitch_f
        0xad -> :sswitch_17
        0xaf -> :sswitch_21
        0xb1 -> :sswitch_21
        0xb3 -> :sswitch_21
        0xb5 -> :sswitch_21
        0xb7 -> :sswitch_21
        0xb9 -> :sswitch_21
        0xba -> :sswitch_f
        0xbb -> :sswitch_f
        0xbc -> :sswitch_f
        0xbd -> :sswitch_f
        0xbe -> :sswitch_f
        0xbf -> :sswitch_f
        0xc0 -> :sswitch_f
        0xc1 -> :sswitch_f
        0xc2 -> :sswitch_f
        0xc3 -> :sswitch_f
        0xc4 -> :sswitch_f
        0xc5 -> :sswitch_f
        0xc023 -> :sswitch_f
        0xc024 -> :sswitch_17
        0xc025 -> :sswitch_f
        0xc026 -> :sswitch_17
        0xc027 -> :sswitch_f
        0xc028 -> :sswitch_17
        0xc029 -> :sswitch_f
        0xc02a -> :sswitch_17
        0xc02b -> :sswitch_f
        0xc02c -> :sswitch_17
        0xc02d -> :sswitch_f
        0xc02e -> :sswitch_17
        0xc02f -> :sswitch_f
        0xc030 -> :sswitch_17
        0xc031 -> :sswitch_f
        0xc032 -> :sswitch_17
        0xc038 -> :sswitch_21
        0xc03b -> :sswitch_21
        0xc072 -> :sswitch_f
        0xc073 -> :sswitch_17
        0xc074 -> :sswitch_f
        0xc075 -> :sswitch_17
        0xc076 -> :sswitch_f
        0xc077 -> :sswitch_17
        0xc078 -> :sswitch_f
        0xc079 -> :sswitch_17
        0xc07a -> :sswitch_f
        0xc07b -> :sswitch_17
        0xc07c -> :sswitch_f
        0xc07d -> :sswitch_17
        0xc07e -> :sswitch_f
        0xc07f -> :sswitch_17
        0xc080 -> :sswitch_f
        0xc081 -> :sswitch_17
        0xc082 -> :sswitch_f
        0xc083 -> :sswitch_17
        0xc084 -> :sswitch_f
        0xc085 -> :sswitch_17
        0xc086 -> :sswitch_f
        0xc087 -> :sswitch_17
        0xc088 -> :sswitch_f
        0xc089 -> :sswitch_17
        0xc08a -> :sswitch_f
        0xc08b -> :sswitch_17
        0xc08c -> :sswitch_f
        0xc08d -> :sswitch_17
        0xc08e -> :sswitch_f
        0xc08f -> :sswitch_17
        0xc090 -> :sswitch_f
        0xc091 -> :sswitch_17
        0xc092 -> :sswitch_f
        0xc093 -> :sswitch_17
        0xc095 -> :sswitch_21
        0xc097 -> :sswitch_21
        0xc099 -> :sswitch_21
        0xc09b -> :sswitch_21
        0xc09c -> :sswitch_f
        0xc09d -> :sswitch_f
        0xc09e -> :sswitch_f
        0xc09f -> :sswitch_f
        0xc0a0 -> :sswitch_f
        0xc0a1 -> :sswitch_f
        0xc0a2 -> :sswitch_f
        0xc0a3 -> :sswitch_f
        0xc0a4 -> :sswitch_f
        0xc0a5 -> :sswitch_f
        0xc0a6 -> :sswitch_f
        0xc0a7 -> :sswitch_f
        0xc0a8 -> :sswitch_f
        0xc0a9 -> :sswitch_f
        0xc0aa -> :sswitch_f
        0xc0ab -> :sswitch_f
        0xc0ac -> :sswitch_f
        0xc0ad -> :sswitch_f
        0xc0ae -> :sswitch_f
        0xc0af -> :sswitch_f
        0xcc13 -> :sswitch_f
        0xcc14 -> :sswitch_f
        0xcc15 -> :sswitch_f
    .end sparse-switch
.end method

.method private processAlert()V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 374
    :goto_3
    iget-object v3, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->alertQueue:Lorg/spongycastle/crypto/tls/ByteQueue;

    invoke-virtual {v3}, Lorg/spongycastle/crypto/tls/ByteQueue;->available()I

    move-result v3

    if-lt v3, v6, :cond_3d

    .line 379
    iget-object v3, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->alertQueue:Lorg/spongycastle/crypto/tls/ByteQueue;

    invoke-virtual {v3, v6, v4}, Lorg/spongycastle/crypto/tls/ByteQueue;->removeData(II)[B

    move-result-object v2

    .line 380
    .local v2, "tmp":[B
    aget-byte v3, v2, v4

    int-to-short v1, v3

    .line 381
    .local v1, "level":S
    aget-byte v3, v2, v5

    int-to-short v0, v3

    .line 383
    .local v0, "description":S
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsProtocol;->getPeer()Lorg/spongycastle/crypto/tls/TlsPeer;

    move-result-object v3

    invoke-interface {v3, v1, v0}, Lorg/spongycastle/crypto/tls/TlsPeer;->notifyAlertReceived(SS)V

    .line 385
    if-ne v1, v6, :cond_34

    .line 391
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsProtocol;->invalidateSession()V

    .line 393
    iput-boolean v5, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->failedWithError:Z

    .line 394
    iput-boolean v5, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->closed:Z

    .line 396
    iget-object v3, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->recordStream:Lorg/spongycastle/crypto/tls/RecordStream;

    invoke-virtual {v3}, Lorg/spongycastle/crypto/tls/RecordStream;->safeClose()V

    .line 398
    new-instance v3, Ljava/io/IOException;

    const-string v4, "Internal TLS error, this could be an attack"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 408
    :cond_34
    if-nez v0, :cond_39

    .line 410
    invoke-virtual {p0, v4}, Lorg/spongycastle/crypto/tls/TlsProtocol;->handleClose(Z)V

    .line 416
    :cond_39
    invoke-virtual {p0, v0}, Lorg/spongycastle/crypto/tls/TlsProtocol;->handleWarningMessage(S)V

    goto :goto_3

    .line 419
    .end local v0    # "description":S
    .end local v1    # "level":S
    .end local v2    # "tmp":[B
    :cond_3d
    return-void
.end method

.method private processApplicationData()V
    .registers 1

    .prologue
    .line 369
    return-void
.end method

.method private processChangeCipherSpec([BII)V
    .registers 8
    .param p1, "buf"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    .line 430
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2
    if-ge v0, p3, :cond_3d

    .line 432
    add-int v2, p2, v0

    invoke-static {p1, v2}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint8([BI)S

    move-result v1

    .line 434
    .local v1, "message":S
    if-eq v1, v3, :cond_14

    .line 436
    new-instance v2, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v3, 0x32

    invoke-direct {v2, v3}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v2

    .line 439
    :cond_14
    iget-boolean v2, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->receivedChangeCipherSpec:Z

    if-nez v2, :cond_28

    iget-object v2, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->alertQueue:Lorg/spongycastle/crypto/tls/ByteQueue;

    .line 440
    invoke-virtual {v2}, Lorg/spongycastle/crypto/tls/ByteQueue;->available()I

    move-result v2

    if-gtz v2, :cond_28

    iget-object v2, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->handshakeQueue:Lorg/spongycastle/crypto/tls/ByteQueue;

    .line 441
    invoke-virtual {v2}, Lorg/spongycastle/crypto/tls/ByteQueue;->available()I

    move-result v2

    if-lez v2, :cond_30

    .line 443
    :cond_28
    new-instance v2, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v3, 0xa

    invoke-direct {v2, v3}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v2

    .line 446
    :cond_30
    iget-object v2, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->recordStream:Lorg/spongycastle/crypto/tls/RecordStream;

    invoke-virtual {v2}, Lorg/spongycastle/crypto/tls/RecordStream;->receivedReadCipherSpec()V

    .line 448
    iput-boolean v3, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->receivedChangeCipherSpec:Z

    .line 450
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsProtocol;->handleChangeCipherSpecMessage()V

    .line 430
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 452
    .end local v1    # "message":S
    :cond_3d
    return-void
.end method

.method private processHandshake()V
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x1

    const/4 v10, 0x4

    const/4 v7, 0x0

    .line 302
    :cond_3
    const/4 v4, 0x0

    .line 306
    .local v4, "read":Z
    iget-object v6, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->handshakeQueue:Lorg/spongycastle/crypto/tls/ByteQueue;

    invoke-virtual {v6}, Lorg/spongycastle/crypto/tls/ByteQueue;->available()I

    move-result v6

    if-lt v6, v10, :cond_4a

    .line 308
    new-array v0, v10, [B

    .line 309
    .local v0, "beginning":[B
    iget-object v6, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->handshakeQueue:Lorg/spongycastle/crypto/tls/ByteQueue;

    invoke-virtual {v6, v0, v7, v10, v7}, Lorg/spongycastle/crypto/tls/ByteQueue;->read([BIII)V

    .line 310
    invoke-static {v0, v7}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint8([BI)S

    move-result v5

    .line 311
    .local v5, "type":S
    invoke-static {v0, v8}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint24([BI)I

    move-result v3

    .line 316
    .local v3, "len":I
    iget-object v6, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->handshakeQueue:Lorg/spongycastle/crypto/tls/ByteQueue;

    invoke-virtual {v6}, Lorg/spongycastle/crypto/tls/ByteQueue;->available()I

    move-result v6

    add-int/lit8 v9, v3, 0x4

    if-lt v6, v9, :cond_4a

    .line 321
    iget-object v6, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->handshakeQueue:Lorg/spongycastle/crypto/tls/ByteQueue;

    invoke-virtual {v6, v3, v10}, Lorg/spongycastle/crypto/tls/ByteQueue;->removeData(II)[B

    move-result-object v1

    .line 323
    .local v1, "buf":[B
    iget-short v6, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->connection_state:S

    const/16 v9, 0x10

    if-eq v6, v9, :cond_35

    const/16 v6, 0x14

    if-ne v5, v6, :cond_4d

    :cond_35
    move v6, v8

    :goto_36
    invoke-virtual {p0, v6}, Lorg/spongycastle/crypto/tls/TlsProtocol;->checkReceivedChangeCipherSpec(Z)V

    .line 330
    sparse-switch v5, :sswitch_data_72

    .line 346
    :cond_3c
    :goto_3c
    iget-object v6, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->recordStream:Lorg/spongycastle/crypto/tls/RecordStream;

    invoke-virtual {v6, v0, v7, v10}, Lorg/spongycastle/crypto/tls/RecordStream;->updateHandshakeData([BII)V

    .line 347
    iget-object v6, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->recordStream:Lorg/spongycastle/crypto/tls/RecordStream;

    invoke-virtual {v6, v1, v7, v3}, Lorg/spongycastle/crypto/tls/RecordStream;->updateHandshakeData([BII)V

    .line 354
    :sswitch_46
    invoke-virtual {p0, v5, v1}, Lorg/spongycastle/crypto/tls/TlsProtocol;->handleHandshakeMessage(S[B)V

    .line 355
    const/4 v4, 0x1

    .line 359
    .end local v0    # "beginning":[B
    .end local v1    # "buf":[B
    .end local v3    # "len":I
    .end local v5    # "type":S
    :cond_4a
    if-nez v4, :cond_3

    .line 360
    return-void

    .restart local v0    # "beginning":[B
    .restart local v1    # "buf":[B
    .restart local v3    # "len":I
    .restart local v5    # "type":S
    :cond_4d
    move v6, v7

    .line 323
    goto :goto_36

    .line 336
    :sswitch_4f
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsProtocol;->getContext()Lorg/spongycastle/crypto/tls/TlsContext;

    move-result-object v2

    .line 337
    .local v2, "ctx":Lorg/spongycastle/crypto/tls/TlsContext;
    iget-object v6, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->expected_verify_data:[B

    if-nez v6, :cond_3c

    .line 338
    invoke-interface {v2}, Lorg/spongycastle/crypto/tls/TlsContext;->getSecurityParameters()Lorg/spongycastle/crypto/tls/SecurityParameters;

    move-result-object v6

    invoke-virtual {v6}, Lorg/spongycastle/crypto/tls/SecurityParameters;->getMasterSecret()[B

    move-result-object v6

    if-eqz v6, :cond_3c

    .line 340
    invoke-interface {v2}, Lorg/spongycastle/crypto/tls/TlsContext;->isServer()Z

    move-result v6

    if-nez v6, :cond_6f

    move v6, v8

    :goto_68
    invoke-virtual {p0, v6}, Lorg/spongycastle/crypto/tls/TlsProtocol;->createVerifyData(Z)[B

    move-result-object v6

    iput-object v6, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->expected_verify_data:[B

    goto :goto_3c

    :cond_6f
    move v6, v7

    goto :goto_68

    .line 330
    nop

    :sswitch_data_72
    .sparse-switch
        0x0 -> :sswitch_46
        0x14 -> :sswitch_4f
    .end sparse-switch
.end method

.method protected static readExtensions(Ljava/io/ByteArrayInputStream;)Ljava/util/Hashtable;
    .registers 8
    .param p0, "input"    # Ljava/io/ByteArrayInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1151
    invoke-virtual {p0}, Ljava/io/ByteArrayInputStream;->available()I

    move-result v5

    const/4 v6, 0x1

    if-ge v5, v6, :cond_9

    .line 1153
    const/4 v4, 0x0

    .line 1179
    :cond_8
    return-object v4

    .line 1156
    :cond_9
    invoke-static {p0}, Lorg/spongycastle/crypto/tls/TlsUtils;->readOpaque16(Ljava/io/InputStream;)[B

    move-result-object v1

    .line 1158
    .local v1, "extBytes":[B
    invoke-static {p0}, Lorg/spongycastle/crypto/tls/TlsProtocol;->assertEmpty(Ljava/io/ByteArrayInputStream;)V

    .line 1160
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 1163
    .local v0, "buf":Ljava/io/ByteArrayInputStream;
    new-instance v4, Ljava/util/Hashtable;

    invoke-direct {v4}, Ljava/util/Hashtable;-><init>()V

    .line 1165
    .local v4, "extensions":Ljava/util/Hashtable;
    :cond_1a
    invoke-virtual {v0}, Ljava/io/ByteArrayInputStream;->available()I

    move-result v5

    if-lez v5, :cond_8

    .line 1167
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint16(Ljava/io/InputStream;)I

    move-result v5

    invoke-static {v5}, Lorg/spongycastle/util/Integers;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 1168
    .local v3, "extension_type":Ljava/lang/Integer;
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->readOpaque16(Ljava/io/InputStream;)[B

    move-result-object v2

    .line 1173
    .local v2, "extension_data":[B
    invoke-virtual {v4, v3, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_1a

    .line 1175
    new-instance v5, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v6, 0x2f

    invoke-direct {v5, v6}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v5
.end method

.method protected static readSupplementalDataMessage(Ljava/io/ByteArrayInputStream;)Ljava/util/Vector;
    .registers 7
    .param p0, "input"    # Ljava/io/ByteArrayInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1185
    invoke-static {p0}, Lorg/spongycastle/crypto/tls/TlsUtils;->readOpaque24(Ljava/io/InputStream;)[B

    move-result-object v2

    .line 1187
    .local v2, "supp_data":[B
    invoke-static {p0}, Lorg/spongycastle/crypto/tls/TlsProtocol;->assertEmpty(Ljava/io/ByteArrayInputStream;)V

    .line 1189
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, v2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 1191
    .local v0, "buf":Ljava/io/ByteArrayInputStream;
    new-instance v4, Ljava/util/Vector;

    invoke-direct {v4}, Ljava/util/Vector;-><init>()V

    .line 1193
    .local v4, "supplementalData":Ljava/util/Vector;
    :goto_11
    invoke-virtual {v0}, Ljava/io/ByteArrayInputStream;->available()I

    move-result v5

    if-lez v5, :cond_28

    .line 1195
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint16(Ljava/io/InputStream;)I

    move-result v3

    .line 1196
    .local v3, "supp_data_type":I
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->readOpaque16(Ljava/io/InputStream;)[B

    move-result-object v1

    .line 1198
    .local v1, "data":[B
    new-instance v5, Lorg/spongycastle/crypto/tls/SupplementalDataEntry;

    invoke-direct {v5, v3, v1}, Lorg/spongycastle/crypto/tls/SupplementalDataEntry;-><init>(I[B)V

    invoke-virtual {v4, v5}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_11

    .line 1201
    .end local v1    # "data":[B
    .end local v3    # "supp_data_type":I
    :cond_28
    return-object v4
.end method

.method protected static writeExtensions(Ljava/io/OutputStream;Ljava/util/Hashtable;)V
    .registers 9
    .param p0, "output"    # Ljava/io/OutputStream;
    .param p1, "extensions"    # Ljava/util/Hashtable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1207
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 1209
    .local v0, "buf":Ljava/io/ByteArrayOutputStream;
    invoke-virtual {p1}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v5

    .line 1210
    .local v5, "keys":Ljava/util/Enumeration;
    :goto_9
    invoke-interface {v5}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v6

    if-eqz v6, :cond_2c

    .line 1212
    invoke-interface {v5}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    .line 1213
    .local v4, "key":Ljava/lang/Integer;
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 1214
    .local v3, "extension_type":I
    invoke-virtual {p1, v4}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [B

    move-object v2, v6

    check-cast v2, [B

    .line 1216
    .local v2, "extension_data":[B
    invoke-static {v3}, Lorg/spongycastle/crypto/tls/TlsUtils;->checkUint16(I)V

    .line 1217
    invoke-static {v3, v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint16(ILjava/io/OutputStream;)V

    .line 1218
    invoke-static {v2, v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeOpaque16([BLjava/io/OutputStream;)V

    goto :goto_9

    .line 1221
    .end local v2    # "extension_data":[B
    .end local v3    # "extension_type":I
    .end local v4    # "key":Ljava/lang/Integer;
    :cond_2c
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    .line 1223
    .local v1, "extBytes":[B
    invoke-static {v1, p0}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeOpaque16([BLjava/io/OutputStream;)V

    .line 1224
    return-void
.end method

.method protected static writeSupplementalData(Ljava/io/OutputStream;Ljava/util/Vector;)V
    .registers 8
    .param p0, "output"    # Ljava/io/OutputStream;
    .param p1, "supplementalData"    # Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1229
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 1231
    .local v0, "buf":Ljava/io/ByteArrayOutputStream;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_6
    invoke-virtual {p1}, Ljava/util/Vector;->size()I

    move-result v5

    if-ge v2, v5, :cond_26

    .line 1233
    invoke-virtual {p1, v2}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/spongycastle/crypto/tls/SupplementalDataEntry;

    .line 1235
    .local v1, "entry":Lorg/spongycastle/crypto/tls/SupplementalDataEntry;
    invoke-virtual {v1}, Lorg/spongycastle/crypto/tls/SupplementalDataEntry;->getDataType()I

    move-result v4

    .line 1236
    .local v4, "supp_data_type":I
    invoke-static {v4}, Lorg/spongycastle/crypto/tls/TlsUtils;->checkUint16(I)V

    .line 1237
    invoke-static {v4, v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint16(ILjava/io/OutputStream;)V

    .line 1238
    invoke-virtual {v1}, Lorg/spongycastle/crypto/tls/SupplementalDataEntry;->getData()[B

    move-result-object v5

    invoke-static {v5, v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeOpaque16([BLjava/io/OutputStream;)V

    .line 1231
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    .line 1241
    .end local v1    # "entry":Lorg/spongycastle/crypto/tls/SupplementalDataEntry;
    .end local v4    # "supp_data_type":I
    :cond_26
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    .line 1243
    .local v3, "supp_data":[B
    invoke-static {v3, p0}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeOpaque24([BLjava/io/OutputStream;)V

    .line 1244
    return-void
.end method


# virtual methods
.method protected applicationDataAvailable()I
    .registers 2

    .prologue
    .line 456
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->applicationDataQueue:Lorg/spongycastle/crypto/tls/ByteQueue;

    invoke-virtual {v0}, Lorg/spongycastle/crypto/tls/ByteQueue;->available()I

    move-result v0

    return v0
.end method

.method protected applyMaxFragmentLengthExtension()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 128
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->securityParameters:Lorg/spongycastle/crypto/tls/SecurityParameters;

    iget-short v1, v1, Lorg/spongycastle/crypto/tls/SecurityParameters;->maxFragmentLength:S

    if-ltz v1, :cond_26

    .line 130
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->securityParameters:Lorg/spongycastle/crypto/tls/SecurityParameters;

    iget-short v1, v1, Lorg/spongycastle/crypto/tls/SecurityParameters;->maxFragmentLength:S

    invoke-static {v1}, Lorg/spongycastle/crypto/tls/MaxFragmentLength;->isValid(S)Z

    move-result v1

    if-nez v1, :cond_18

    .line 132
    new-instance v1, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v2, 0x50

    invoke-direct {v1, v2}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v1

    .line 135
    :cond_18
    const/4 v1, 0x1

    iget-object v2, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->securityParameters:Lorg/spongycastle/crypto/tls/SecurityParameters;

    iget-short v2, v2, Lorg/spongycastle/crypto/tls/SecurityParameters;->maxFragmentLength:S

    add-int/lit8 v2, v2, 0x8

    shl-int v0, v1, v2

    .line 136
    .local v0, "plainTextLimit":I
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->recordStream:Lorg/spongycastle/crypto/tls/RecordStream;

    invoke-virtual {v1, v0}, Lorg/spongycastle/crypto/tls/RecordStream;->setPlaintextLimit(I)V

    .line 138
    .end local v0    # "plainTextLimit":I
    :cond_26
    return-void
.end method

.method protected blockForHandshake()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 174
    iget-boolean v0, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->blocking:Z

    if-eqz v0, :cond_12

    .line 176
    :goto_4
    iget-short v0, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->connection_state:S

    const/16 v1, 0x10

    if-eq v0, v1, :cond_12

    .line 178
    iget-boolean v0, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->closed:Z

    if-eqz v0, :cond_e

    .line 183
    :cond_e
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsProtocol;->safeReadRecord()V

    goto :goto_4

    .line 186
    :cond_12
    return-void
.end method

.method protected checkReceivedChangeCipherSpec(Z)V
    .registers 4
    .param p1, "expected"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 143
    iget-boolean v0, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->receivedChangeCipherSpec:Z

    if-eq p1, v0, :cond_c

    .line 145
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v0

    .line 147
    :cond_c
    return-void
.end method

.method protected cleanupHandshake()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 151
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->expected_verify_data:[B

    if-eqz v0, :cond_d

    .line 153
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->expected_verify_data:[B

    invoke-static {v0, v1}, Lorg/spongycastle/util/Arrays;->fill([BB)V

    .line 154
    iput-object v2, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->expected_verify_data:[B

    .line 157
    :cond_d
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->securityParameters:Lorg/spongycastle/crypto/tls/SecurityParameters;

    invoke-virtual {v0}, Lorg/spongycastle/crypto/tls/SecurityParameters;->clear()V

    .line 158
    iput-object v2, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->peerCertificate:Lorg/spongycastle/crypto/tls/Certificate;

    .line 160
    iput-object v2, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->offeredCipherSuites:[I

    .line 161
    iput-object v2, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->offeredCompressionMethods:[S

    .line 162
    iput-object v2, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->clientExtensions:Ljava/util/Hashtable;

    .line 163
    iput-object v2, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->serverExtensions:Ljava/util/Hashtable;

    .line 165
    iput-boolean v1, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->resumedSession:Z

    .line 166
    iput-boolean v1, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->receivedChangeCipherSpec:Z

    .line 167
    iput-boolean v1, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->secure_renegotiation:Z

    .line 168
    iput-boolean v1, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->allowCertificateStatus:Z

    .line 169
    iput-boolean v1, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->expectSessionTicket:Z

    .line 170
    return-void
.end method

.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1016
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/spongycastle/crypto/tls/TlsProtocol;->handleClose(Z)V

    .line 1017
    return-void
.end method

.method protected completeHandshake()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x1

    .line 193
    :try_start_1
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->recordStream:Lorg/spongycastle/crypto/tls/RecordStream;

    invoke-virtual {v1}, Lorg/spongycastle/crypto/tls/RecordStream;->finaliseHandshake()V

    .line 195
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsProtocol;->getContext()Lorg/spongycastle/crypto/tls/TlsContext;

    move-result-object v1

    invoke-static {v1}, Lorg/spongycastle/crypto/tls/TlsUtils;->isTLSv11(Lorg/spongycastle/crypto/tls/TlsContext;)Z

    move-result v1

    if-nez v1, :cond_9f

    :goto_10
    iput-boolean v0, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->splitApplicationDataRecords:Z

    .line 200
    iget-boolean v0, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->appDataReady:Z

    if-nez v0, :cond_2b

    .line 202
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->appDataReady:Z

    .line 204
    iget-boolean v0, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->blocking:Z

    if-eqz v0, :cond_2b

    .line 206
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsInputStream;

    invoke-direct {v0, p0}, Lorg/spongycastle/crypto/tls/TlsInputStream;-><init>(Lorg/spongycastle/crypto/tls/TlsProtocol;)V

    iput-object v0, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->tlsInputStream:Lorg/spongycastle/crypto/tls/TlsInputStream;

    .line 207
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsOutputStream;

    invoke-direct {v0, p0}, Lorg/spongycastle/crypto/tls/TlsOutputStream;-><init>(Lorg/spongycastle/crypto/tls/TlsProtocol;)V

    iput-object v0, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->tlsOutputStream:Lorg/spongycastle/crypto/tls/TlsOutputStream;

    .line 211
    :cond_2b
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->tlsSession:Lorg/spongycastle/crypto/tls/TlsSession;

    if-eqz v0, :cond_94

    .line 213
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->sessionParameters:Lorg/spongycastle/crypto/tls/SessionParameters;

    if-nez v0, :cond_8b

    .line 215
    new-instance v0, Lorg/spongycastle/crypto/tls/SessionParameters$Builder;

    invoke-direct {v0}, Lorg/spongycastle/crypto/tls/SessionParameters$Builder;-><init>()V

    iget-object v1, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->securityParameters:Lorg/spongycastle/crypto/tls/SecurityParameters;

    .line 216
    invoke-virtual {v1}, Lorg/spongycastle/crypto/tls/SecurityParameters;->getCipherSuite()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/spongycastle/crypto/tls/SessionParameters$Builder;->setCipherSuite(I)Lorg/spongycastle/crypto/tls/SessionParameters$Builder;

    move-result-object v0

    iget-object v1, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->securityParameters:Lorg/spongycastle/crypto/tls/SecurityParameters;

    .line 217
    invoke-virtual {v1}, Lorg/spongycastle/crypto/tls/SecurityParameters;->getCompressionAlgorithm()S

    move-result v1

    invoke-virtual {v0, v1}, Lorg/spongycastle/crypto/tls/SessionParameters$Builder;->setCompressionAlgorithm(S)Lorg/spongycastle/crypto/tls/SessionParameters$Builder;

    move-result-object v0

    iget-object v1, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->securityParameters:Lorg/spongycastle/crypto/tls/SecurityParameters;

    .line 218
    invoke-virtual {v1}, Lorg/spongycastle/crypto/tls/SecurityParameters;->getMasterSecret()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/spongycastle/crypto/tls/SessionParameters$Builder;->setMasterSecret([B)Lorg/spongycastle/crypto/tls/SessionParameters$Builder;

    move-result-object v0

    iget-object v1, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->peerCertificate:Lorg/spongycastle/crypto/tls/Certificate;

    .line 219
    invoke-virtual {v0, v1}, Lorg/spongycastle/crypto/tls/SessionParameters$Builder;->setPeerCertificate(Lorg/spongycastle/crypto/tls/Certificate;)Lorg/spongycastle/crypto/tls/SessionParameters$Builder;

    move-result-object v0

    iget-object v1, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->securityParameters:Lorg/spongycastle/crypto/tls/SecurityParameters;

    .line 220
    invoke-virtual {v1}, Lorg/spongycastle/crypto/tls/SecurityParameters;->getPSKIdentity()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/spongycastle/crypto/tls/SessionParameters$Builder;->setPSKIdentity([B)Lorg/spongycastle/crypto/tls/SessionParameters$Builder;

    move-result-object v0

    iget-object v1, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->securityParameters:Lorg/spongycastle/crypto/tls/SecurityParameters;

    .line 221
    invoke-virtual {v1}, Lorg/spongycastle/crypto/tls/SecurityParameters;->getSRPIdentity()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/spongycastle/crypto/tls/SessionParameters$Builder;->setSRPIdentity([B)Lorg/spongycastle/crypto/tls/SessionParameters$Builder;

    move-result-object v0

    iget-object v1, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->serverExtensions:Ljava/util/Hashtable;

    .line 223
    invoke-virtual {v0, v1}, Lorg/spongycastle/crypto/tls/SessionParameters$Builder;->setServerExtensions(Ljava/util/Hashtable;)Lorg/spongycastle/crypto/tls/SessionParameters$Builder;

    move-result-object v0

    .line 224
    invoke-virtual {v0}, Lorg/spongycastle/crypto/tls/SessionParameters$Builder;->build()Lorg/spongycastle/crypto/tls/SessionParameters;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->sessionParameters:Lorg/spongycastle/crypto/tls/SessionParameters;

    .line 226
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsSessionImpl;

    iget-object v1, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->tlsSession:Lorg/spongycastle/crypto/tls/TlsSession;

    invoke-interface {v1}, Lorg/spongycastle/crypto/tls/TlsSession;->getSessionID()[B

    move-result-object v1

    iget-object v2, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->sessionParameters:Lorg/spongycastle/crypto/tls/SessionParameters;

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/crypto/tls/TlsSessionImpl;-><init>([BLorg/spongycastle/crypto/tls/SessionParameters;)V

    iput-object v0, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->tlsSession:Lorg/spongycastle/crypto/tls/TlsSession;

    .line 229
    :cond_8b
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsProtocol;->getContextAdmin()Lorg/spongycastle/crypto/tls/AbstractTlsContext;

    move-result-object v0

    iget-object v1, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->tlsSession:Lorg/spongycastle/crypto/tls/TlsSession;

    invoke-virtual {v0, v1}, Lorg/spongycastle/crypto/tls/AbstractTlsContext;->setResumableSession(Lorg/spongycastle/crypto/tls/TlsSession;)V

    .line 232
    :cond_94
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsProtocol;->getPeer()Lorg/spongycastle/crypto/tls/TlsPeer;

    move-result-object v0

    invoke-interface {v0}, Lorg/spongycastle/crypto/tls/TlsPeer;->notifyHandshakeComplete()V
    :try_end_9b
    .catchall {:try_start_1 .. :try_end_9b} :catchall_a2

    .line 236
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsProtocol;->cleanupHandshake()V

    .line 238
    return-void

    .line 195
    :cond_9f
    const/4 v0, 0x0

    goto/16 :goto_10

    .line 236
    :catchall_a2
    move-exception v0

    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsProtocol;->cleanupHandshake()V

    throw v0
.end method

.method protected createVerifyData(Z)[B
    .registers 7
    .param p1, "isServer"    # Z

    .prologue
    .line 1001
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsProtocol;->getContext()Lorg/spongycastle/crypto/tls/TlsContext;

    move-result-object v1

    .line 1002
    .local v1, "context":Lorg/spongycastle/crypto/tls/TlsContext;
    if-eqz p1, :cond_1b

    const-string v0, "server finished"

    .line 1003
    .local v0, "asciiLabel":Ljava/lang/String;
    :goto_8
    if-eqz p1, :cond_1e

    sget-object v3, Lorg/spongycastle/crypto/tls/TlsUtils;->SSL_SERVER:[B

    .line 1004
    .local v3, "sslSender":[B
    :goto_c
    iget-object v4, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->recordStream:Lorg/spongycastle/crypto/tls/RecordStream;

    invoke-virtual {v4}, Lorg/spongycastle/crypto/tls/RecordStream;->getHandshakeHash()Lorg/spongycastle/crypto/tls/TlsHandshakeHash;

    move-result-object v4

    invoke-static {v1, v4, v3}, Lorg/spongycastle/crypto/tls/TlsProtocol;->getCurrentPRFHash(Lorg/spongycastle/crypto/tls/TlsContext;Lorg/spongycastle/crypto/tls/TlsHandshakeHash;[B)[B

    move-result-object v2

    .line 1005
    .local v2, "hash":[B
    invoke-static {v1, v0, v2}, Lorg/spongycastle/crypto/tls/TlsUtils;->calculateVerifyData(Lorg/spongycastle/crypto/tls/TlsContext;Ljava/lang/String;[B)[B

    move-result-object v4

    return-object v4

    .line 1002
    .end local v0    # "asciiLabel":Ljava/lang/String;
    .end local v2    # "hash":[B
    .end local v3    # "sslSender":[B
    :cond_1b
    const-string v0, "client finished"

    goto :goto_8

    .line 1003
    .restart local v0    # "asciiLabel":Ljava/lang/String;
    :cond_1e
    sget-object v3, Lorg/spongycastle/crypto/tls/TlsUtils;->SSL_CLIENT:[B

    goto :goto_c
.end method

.method protected failWithError(SSLjava/lang/String;Ljava/lang/Throwable;)V
    .registers 8
    .param p1, "alertLevel"    # S
    .param p2, "alertDescription"    # S
    .param p3, "message"    # Ljava/lang/String;
    .param p4, "cause"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x2

    const/4 v1, 0x1

    .line 853
    iget-boolean v0, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->closed:Z

    if-nez v0, :cond_1a

    .line 858
    iput-boolean v1, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->closed:Z

    .line 860
    if-ne p1, v2, :cond_f

    .line 867
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsProtocol;->invalidateSession()V

    .line 869
    iput-boolean v1, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->failedWithError:Z

    .line 871
    :cond_f
    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/spongycastle/crypto/tls/TlsProtocol;->raiseAlert(SSLjava/lang/String;Ljava/lang/Throwable;)V

    .line 872
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->recordStream:Lorg/spongycastle/crypto/tls/RecordStream;

    invoke-virtual {v0}, Lorg/spongycastle/crypto/tls/RecordStream;->safeClose()V

    .line 873
    if-eq p1, v2, :cond_1a

    .line 875
    return-void

    .line 879
    :cond_1a
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Internal TLS error, this could be an attack"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected flush()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1035
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->recordStream:Lorg/spongycastle/crypto/tls/RecordStream;

    invoke-virtual {v0}, Lorg/spongycastle/crypto/tls/RecordStream;->flush()V

    .line 1036
    return-void
.end method

.method public getAvailableInputBytes()I
    .registers 3

    .prologue
    .line 726
    iget-boolean v0, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->blocking:Z

    if-eqz v0, :cond_c

    .line 728
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot use getAvailableInputBytes() in blocking mode! Use getInputStream().available() instead."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 730
    :cond_c
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsProtocol;->applicationDataAvailable()I

    move-result v0

    return v0
.end method

.method public getAvailableOutputBytes()I
    .registers 3

    .prologue
    .line 804
    iget-boolean v0, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->blocking:Z

    if-eqz v0, :cond_c

    .line 806
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot use getAvailableOutputBytes() in blocking mode! Use getOutputStream() instead."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 809
    :cond_c
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->outputBuffer:Lorg/spongycastle/crypto/tls/ByteQueueOutputStream;

    invoke-virtual {v0}, Lorg/spongycastle/crypto/tls/ByteQueueOutputStream;->getBuffer()Lorg/spongycastle/crypto/tls/ByteQueue;

    move-result-object v0

    invoke-virtual {v0}, Lorg/spongycastle/crypto/tls/ByteQueue;->available()I

    move-result v0

    return v0
.end method

.method protected abstract getContext()Lorg/spongycastle/crypto/tls/TlsContext;
.end method

.method abstract getContextAdmin()Lorg/spongycastle/crypto/tls/AbstractTlsContext;
.end method

.method public getInputStream()Ljava/io/InputStream;
    .registers 3

    .prologue
    .line 661
    iget-boolean v0, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->blocking:Z

    if-nez v0, :cond_c

    .line 663
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot use InputStream in non-blocking mode! Use offerInput() instead."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 665
    :cond_c
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->tlsInputStream:Lorg/spongycastle/crypto/tls/TlsInputStream;

    return-object v0
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .registers 3

    .prologue
    .line 649
    iget-boolean v0, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->blocking:Z

    if-nez v0, :cond_c

    .line 651
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot use OutputStream in non-blocking mode! Use offerOutput() instead."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 653
    :cond_c
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->tlsOutputStream:Lorg/spongycastle/crypto/tls/TlsOutputStream;

    return-object v0
.end method

.method protected abstract getPeer()Lorg/spongycastle/crypto/tls/TlsPeer;
.end method

.method protected handleChangeCipherSpecMessage()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 115
    return-void
.end method

.method protected handleClose(Z)V
    .registers 6
    .param p1, "user_canceled"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1022
    iget-boolean v0, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->closed:Z

    if-nez v0, :cond_19

    .line 1024
    if-eqz p1, :cond_11

    iget-boolean v0, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->appDataReady:Z

    if-nez v0, :cond_11

    .line 1026
    const/16 v0, 0x5a

    const-string v1, "User canceled handshake"

    invoke-virtual {p0, v0, v1}, Lorg/spongycastle/crypto/tls/TlsProtocol;->raiseWarning(SLjava/lang/String;)V

    .line 1028
    :cond_11
    const/4 v0, 0x1

    const/4 v1, 0x0

    const-string v2, "Connection closed"

    const/4 v3, 0x0

    invoke-virtual {p0, v0, v1, v2, v3}, Lorg/spongycastle/crypto/tls/TlsProtocol;->failWithError(SSLjava/lang/String;Ljava/lang/Throwable;)V

    .line 1030
    :cond_19
    return-void
.end method

.method protected abstract handleHandshakeMessage(S[B)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected handleWarningMessage(S)V
    .registers 2
    .param p1, "description"    # S
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 123
    return-void
.end method

.method protected invalidateSession()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 884
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->sessionParameters:Lorg/spongycastle/crypto/tls/SessionParameters;

    if-eqz v0, :cond_c

    .line 886
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->sessionParameters:Lorg/spongycastle/crypto/tls/SessionParameters;

    invoke-virtual {v0}, Lorg/spongycastle/crypto/tls/SessionParameters;->clear()V

    .line 887
    iput-object v1, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->sessionParameters:Lorg/spongycastle/crypto/tls/SessionParameters;

    .line 890
    :cond_c
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->tlsSession:Lorg/spongycastle/crypto/tls/TlsSession;

    if-eqz v0, :cond_17

    .line 892
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->tlsSession:Lorg/spongycastle/crypto/tls/TlsSession;

    invoke-interface {v0}, Lorg/spongycastle/crypto/tls/TlsSession;->invalidate()V

    .line 893
    iput-object v1, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->tlsSession:Lorg/spongycastle/crypto/tls/TlsSession;

    .line 895
    :cond_17
    return-void
.end method

.method public isClosed()Z
    .registers 2

    .prologue
    .line 1040
    iget-boolean v0, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->closed:Z

    return v0
.end method

.method public offerInput([B)V
    .registers 6
    .param p1, "input"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x5

    .line 688
    iget-boolean v2, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->blocking:Z

    if-eqz v2, :cond_d

    .line 690
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "Cannot use offerInput() in blocking mode! Use getInputStream() instead."

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 693
    :cond_d
    iget-boolean v2, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->closed:Z

    if-eqz v2, :cond_19

    .line 695
    new-instance v2, Ljava/io/IOException;

    const-string v3, "Connection is closed, cannot accept any more input"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 698
    :cond_19
    iget-object v2, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->inputBuffers:Lorg/spongycastle/crypto/tls/ByteQueueInputStream;

    invoke-virtual {v2, p1}, Lorg/spongycastle/crypto/tls/ByteQueueInputStream;->addBytes([B)V

    .line 701
    :goto_1e
    iget-object v2, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->inputBuffers:Lorg/spongycastle/crypto/tls/ByteQueueInputStream;

    invoke-virtual {v2}, Lorg/spongycastle/crypto/tls/ByteQueueInputStream;->available()I

    move-result v2

    if-lt v2, v3, :cond_3c

    .line 703
    new-array v0, v3, [B

    .line 704
    .local v0, "header":[B
    iget-object v2, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->inputBuffers:Lorg/spongycastle/crypto/tls/ByteQueueInputStream;

    invoke-virtual {v2, v0}, Lorg/spongycastle/crypto/tls/ByteQueueInputStream;->peek([B)I

    .line 706
    const/4 v2, 0x3

    invoke-static {v0, v2}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint16([BI)I

    move-result v2

    add-int/lit8 v1, v2, 0x5

    .line 707
    .local v1, "totalLength":I
    iget-object v2, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->inputBuffers:Lorg/spongycastle/crypto/tls/ByteQueueInputStream;

    invoke-virtual {v2}, Lorg/spongycastle/crypto/tls/ByteQueueInputStream;->available()I

    move-result v2

    if-ge v2, v1, :cond_3d

    .line 715
    .end local v0    # "header":[B
    .end local v1    # "totalLength":I
    :cond_3c
    return-void

    .line 713
    .restart local v0    # "header":[B
    .restart local v1    # "totalLength":I
    :cond_3d
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsProtocol;->safeReadRecord()V

    goto :goto_1e
.end method

.method public offerOutput([BII)V
    .registers 6
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 781
    iget-boolean v0, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->blocking:Z

    if-eqz v0, :cond_c

    .line 783
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot use offerOutput() in blocking mode! Use getOutputStream() instead."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 786
    :cond_c
    iget-boolean v0, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->appDataReady:Z

    if-nez v0, :cond_18

    .line 788
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Application data cannot be sent until the handshake is complete!"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 791
    :cond_18
    invoke-virtual {p0, p1, p2, p3}, Lorg/spongycastle/crypto/tls/TlsProtocol;->writeData([BII)V

    .line 792
    return-void
.end method

.method protected processFinishedMessage(Ljava/io/ByteArrayInputStream;)V
    .registers 5
    .param p1, "buf"    # Ljava/io/ByteArrayInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 900
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->expected_verify_data:[B

    if-nez v1, :cond_c

    .line 902
    new-instance v1, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v2, 0x50

    invoke-direct {v1, v2}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v1

    .line 905
    :cond_c
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->expected_verify_data:[B

    array-length v1, v1

    invoke-static {v1, p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->readFully(ILjava/io/InputStream;)[B

    move-result-object v0

    .line 907
    .local v0, "verify_data":[B
    invoke-static {p1}, Lorg/spongycastle/crypto/tls/TlsProtocol;->assertEmpty(Ljava/io/ByteArrayInputStream;)V

    .line 912
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->expected_verify_data:[B

    invoke-static {v1, v0}, Lorg/spongycastle/util/Arrays;->constantTimeAreEqual([B[B)Z

    move-result v1

    if-nez v1, :cond_26

    .line 917
    new-instance v1, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v2, 0x33

    invoke-direct {v1, v2}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v1

    .line 919
    :cond_26
    return-void
.end method

.method protected processMaxFragmentLengthExtension(Ljava/util/Hashtable;Ljava/util/Hashtable;S)S
    .registers 6
    .param p1, "clientExtensions"    # Ljava/util/Hashtable;
    .param p2, "serverExtensions"    # Ljava/util/Hashtable;
    .param p3, "alertDescription"    # S
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1047
    invoke-static {p2}, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->getMaxFragmentLengthExtension(Ljava/util/Hashtable;)S

    move-result v0

    .line 1048
    .local v0, "maxFragmentLength":S
    if-ltz v0, :cond_1c

    .line 1050
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/MaxFragmentLength;->isValid(S)Z

    move-result v1

    if-eqz v1, :cond_16

    iget-boolean v1, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->resumedSession:Z

    if-nez v1, :cond_1c

    .line 1052
    invoke-static {p1}, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->getMaxFragmentLengthExtension(Ljava/util/Hashtable;)S

    move-result v1

    if-eq v0, v1, :cond_1c

    .line 1054
    :cond_16
    new-instance v1, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    invoke-direct {v1, p3}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v1

    .line 1057
    :cond_1c
    return v0
.end method

.method protected processRecord(S[BII)V
    .registers 7
    .param p1, "protocol"    # S
    .param p2, "buf"    # [B
    .param p3, "offset"    # I
    .param p4, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v1, 0xa

    .line 246
    packed-switch p1, :pswitch_data_3a

    .line 294
    :cond_5
    :goto_5
    return-void

    .line 250
    :pswitch_6
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->alertQueue:Lorg/spongycastle/crypto/tls/ByteQueue;

    invoke-virtual {v0, p2, p3, p4}, Lorg/spongycastle/crypto/tls/ByteQueue;->addData([BII)V

    .line 251
    invoke-direct {p0}, Lorg/spongycastle/crypto/tls/TlsProtocol;->processAlert()V

    goto :goto_5

    .line 256
    :pswitch_f
    iget-boolean v0, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->appDataReady:Z

    if-nez v0, :cond_19

    .line 258
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v0

    .line 260
    :cond_19
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->applicationDataQueue:Lorg/spongycastle/crypto/tls/ByteQueue;

    invoke-virtual {v0, p2, p3, p4}, Lorg/spongycastle/crypto/tls/ByteQueue;->addData([BII)V

    .line 261
    invoke-direct {p0}, Lorg/spongycastle/crypto/tls/TlsProtocol;->processApplicationData()V

    goto :goto_5

    .line 266
    :pswitch_22
    invoke-direct {p0, p2, p3, p4}, Lorg/spongycastle/crypto/tls/TlsProtocol;->processChangeCipherSpec([BII)V

    goto :goto_5

    .line 271
    :pswitch_26
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->handshakeQueue:Lorg/spongycastle/crypto/tls/ByteQueue;

    invoke-virtual {v0, p2, p3, p4}, Lorg/spongycastle/crypto/tls/ByteQueue;->addData([BII)V

    .line 272
    invoke-direct {p0}, Lorg/spongycastle/crypto/tls/TlsProtocol;->processHandshake()V

    goto :goto_5

    .line 277
    :pswitch_2f
    iget-boolean v0, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->appDataReady:Z

    if-nez v0, :cond_5

    .line 279
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v0

    .line 246
    nop

    :pswitch_data_3a
    .packed-switch 0x14
        :pswitch_22
        :pswitch_6
        :pswitch_26
        :pswitch_f
        :pswitch_2f
    .end packed-switch
.end method

.method protected raiseAlert(SSLjava/lang/String;Ljava/lang/Throwable;)V
    .registers 10
    .param p1, "alertLevel"    # S
    .param p2, "alertDescription"    # S
    .param p3, "message"    # Ljava/lang/String;
    .param p4, "cause"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x0

    .line 924
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsProtocol;->getPeer()Lorg/spongycastle/crypto/tls/TlsPeer;

    move-result-object v1

    invoke-interface {v1, p1, p2, p3, p4}, Lorg/spongycastle/crypto/tls/TlsPeer;->notifyAlertRaised(SSLjava/lang/String;Ljava/lang/Throwable;)V

    .line 926
    new-array v0, v4, [B

    .line 927
    .local v0, "error":[B
    int-to-byte v1, p1

    aput-byte v1, v0, v3

    .line 928
    const/4 v1, 0x1

    int-to-byte v2, p2

    aput-byte v2, v0, v1

    .line 930
    const/16 v1, 0x15

    invoke-virtual {p0, v1, v0, v3, v4}, Lorg/spongycastle/crypto/tls/TlsProtocol;->safeWriteRecord(S[BII)V

    .line 931
    return-void
.end method

.method protected raiseWarning(SLjava/lang/String;)V
    .registers 5
    .param p1, "alertDescription"    # S
    .param p2, "message"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 936
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, p2, v1}, Lorg/spongycastle/crypto/tls/TlsProtocol;->raiseAlert(SSLjava/lang/String;Ljava/lang/Throwable;)V

    .line 937
    return-void
.end method

.method protected readApplicationData([BII)I
    .registers 6
    .param p1, "buf"    # [B
    .param p2, "offset"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 472
    const/4 v1, 0x1

    if-ge p3, v1, :cond_8

    .line 503
    :goto_4
    return v0

    .line 498
    :cond_5
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsProtocol;->safeReadRecord()V

    .line 477
    :cond_8
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->applicationDataQueue:Lorg/spongycastle/crypto/tls/ByteQueue;

    invoke-virtual {v1}, Lorg/spongycastle/crypto/tls/ByteQueue;->available()I

    move-result v1

    if-nez v1, :cond_22

    .line 482
    iget-boolean v1, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->closed:Z

    if-eqz v1, :cond_5

    .line 484
    iget-boolean v0, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->failedWithError:Z

    if-eqz v0, :cond_20

    .line 489
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Internal TLS error, this could be an attack"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 495
    :cond_20
    const/4 v0, -0x1

    goto :goto_4

    .line 501
    :cond_22
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->applicationDataQueue:Lorg/spongycastle/crypto/tls/ByteQueue;

    invoke-virtual {v1}, Lorg/spongycastle/crypto/tls/ByteQueue;->available()I

    move-result v1

    invoke-static {p3, v1}, Ljava/lang/Math;->min(II)I

    move-result p3

    .line 502
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->applicationDataQueue:Lorg/spongycastle/crypto/tls/ByteQueue;

    invoke-virtual {v1, p1, p2, p3, v0}, Lorg/spongycastle/crypto/tls/ByteQueue;->removeData([BIII)V

    move v0, p3

    .line 503
    goto :goto_4
.end method

.method public readInput([BII)I
    .registers 7
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    .line 748
    iget-boolean v1, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->blocking:Z

    if-eqz v1, :cond_c

    .line 750
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Cannot use readInput() in blocking mode! Use getInputStream() instead."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 755
    :cond_c
    :try_start_c
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsProtocol;->applicationDataAvailable()I

    move-result v1

    invoke-static {p3, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-virtual {p0, p1, p2, v1}, Lorg/spongycastle/crypto/tls/TlsProtocol;->readApplicationData([BII)I
    :try_end_17
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_17} :catch_19

    move-result v1

    return v1

    .line 757
    :catch_19
    move-exception v0

    .line 760
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public readOutput([BII)I
    .registers 7
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    .line 827
    iget-boolean v1, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->blocking:Z

    if-eqz v1, :cond_c

    .line 829
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Cannot use readOutput() in blocking mode! Use getOutputStream() instead."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 832
    :cond_c
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsProtocol;->getAvailableOutputBytes()I

    move-result v1

    invoke-static {v1, p3}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 833
    .local v0, "bytesToRead":I
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->outputBuffer:Lorg/spongycastle/crypto/tls/ByteQueueOutputStream;

    invoke-virtual {v1}, Lorg/spongycastle/crypto/tls/ByteQueueOutputStream;->getBuffer()Lorg/spongycastle/crypto/tls/ByteQueue;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, p1, p2, v0, v2}, Lorg/spongycastle/crypto/tls/ByteQueue;->removeData([BIII)V

    .line 834
    return v0
.end method

.method protected refuseRenegotiation()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1066
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsProtocol;->getContext()Lorg/spongycastle/crypto/tls/TlsContext;

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->isSSL(Lorg/spongycastle/crypto/tls/TlsContext;)Z

    move-result v0

    if-eqz v0, :cond_12

    .line 1068
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v1, 0x28

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v0

    .line 1071
    :cond_12
    const/16 v0, 0x64

    const-string v1, "Renegotiation not supported"

    invoke-virtual {p0, v0, v1}, Lorg/spongycastle/crypto/tls/TlsProtocol;->raiseWarning(SLjava/lang/String;)V

    .line 1072
    return-void
.end method

.method protected safeReadRecord()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v2, 0x50

    const/4 v3, 0x2

    .line 511
    :try_start_3
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->recordStream:Lorg/spongycastle/crypto/tls/RecordStream;

    invoke-virtual {v1}, Lorg/spongycastle/crypto/tls/RecordStream;->readRecord()Z

    move-result v1

    if-nez v1, :cond_36

    .line 515
    new-instance v1, Ljava/io/EOFException;

    invoke-direct {v1}, Ljava/io/EOFException;-><init>()V

    throw v1
    :try_end_11
    .catch Lorg/spongycastle/crypto/tls/TlsFatalAlert; {:try_start_3 .. :try_end_11} :catch_11
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_11} :catch_20
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_11} :catch_2b

    .line 518
    :catch_11
    move-exception v0

    .line 520
    .local v0, "e":Lorg/spongycastle/crypto/tls/TlsFatalAlert;
    iget-boolean v1, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->closed:Z

    if-nez v1, :cond_1f

    .line 522
    invoke-virtual {v0}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;->getAlertDescription()S

    move-result v1

    const-string v2, "Failed to read record"

    invoke-virtual {p0, v3, v1, v2, v0}, Lorg/spongycastle/crypto/tls/TlsProtocol;->failWithError(SSLjava/lang/String;Ljava/lang/Throwable;)V

    .line 524
    :cond_1f
    throw v0

    .line 526
    .end local v0    # "e":Lorg/spongycastle/crypto/tls/TlsFatalAlert;
    :catch_20
    move-exception v0

    .line 528
    .local v0, "e":Ljava/io/IOException;
    iget-boolean v1, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->closed:Z

    if-nez v1, :cond_2a

    .line 530
    const-string v1, "Failed to read record"

    invoke-virtual {p0, v3, v2, v1, v0}, Lorg/spongycastle/crypto/tls/TlsProtocol;->failWithError(SSLjava/lang/String;Ljava/lang/Throwable;)V

    .line 532
    :cond_2a
    throw v0

    .line 534
    .end local v0    # "e":Ljava/io/IOException;
    :catch_2b
    move-exception v0

    .line 536
    .local v0, "e":Ljava/lang/RuntimeException;
    iget-boolean v1, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->closed:Z

    if-nez v1, :cond_35

    .line 538
    const-string v1, "Failed to read record"

    invoke-virtual {p0, v3, v2, v1, v0}, Lorg/spongycastle/crypto/tls/TlsProtocol;->failWithError(SSLjava/lang/String;Ljava/lang/Throwable;)V

    .line 540
    :cond_35
    throw v0

    .line 542
    .end local v0    # "e":Ljava/lang/RuntimeException;
    :cond_36
    return-void
.end method

.method protected safeWriteRecord(S[BII)V
    .registers 9
    .param p1, "type"    # S
    .param p2, "buf"    # [B
    .param p3, "offset"    # I
    .param p4, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v2, 0x50

    const/4 v3, 0x2

    .line 549
    :try_start_3
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->recordStream:Lorg/spongycastle/crypto/tls/RecordStream;

    invoke-virtual {v1, p1, p2, p3, p4}, Lorg/spongycastle/crypto/tls/RecordStream;->writeRecord(S[BII)V
    :try_end_8
    .catch Lorg/spongycastle/crypto/tls/TlsFatalAlert; {:try_start_3 .. :try_end_8} :catch_9
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_8} :catch_18
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_8} :catch_23

    .line 575
    return-void

    .line 551
    :catch_9
    move-exception v0

    .line 553
    .local v0, "e":Lorg/spongycastle/crypto/tls/TlsFatalAlert;
    iget-boolean v1, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->closed:Z

    if-nez v1, :cond_17

    .line 555
    invoke-virtual {v0}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;->getAlertDescription()S

    move-result v1

    const-string v2, "Failed to write record"

    invoke-virtual {p0, v3, v1, v2, v0}, Lorg/spongycastle/crypto/tls/TlsProtocol;->failWithError(SSLjava/lang/String;Ljava/lang/Throwable;)V

    .line 557
    :cond_17
    throw v0

    .line 559
    .end local v0    # "e":Lorg/spongycastle/crypto/tls/TlsFatalAlert;
    :catch_18
    move-exception v0

    .line 561
    .local v0, "e":Ljava/io/IOException;
    iget-boolean v1, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->closed:Z

    if-nez v1, :cond_22

    .line 563
    const-string v1, "Failed to write record"

    invoke-virtual {p0, v3, v2, v1, v0}, Lorg/spongycastle/crypto/tls/TlsProtocol;->failWithError(SSLjava/lang/String;Ljava/lang/Throwable;)V

    .line 565
    :cond_22
    throw v0

    .line 567
    .end local v0    # "e":Ljava/io/IOException;
    :catch_23
    move-exception v0

    .line 569
    .local v0, "e":Ljava/lang/RuntimeException;
    iget-boolean v1, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->closed:Z

    if-nez v1, :cond_2d

    .line 571
    const-string v1, "Failed to write record"

    invoke-virtual {p0, v3, v2, v1, v0}, Lorg/spongycastle/crypto/tls/TlsProtocol;->failWithError(SSLjava/lang/String;Ljava/lang/Throwable;)V

    .line 573
    :cond_2d
    throw v0
.end method

.method protected sendCertificateMessage(Lorg/spongycastle/crypto/tls/Certificate;)V
    .registers 8
    .param p1, "certificate"    # Lorg/spongycastle/crypto/tls/Certificate;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 942
    if-nez p1, :cond_4

    .line 944
    sget-object p1, Lorg/spongycastle/crypto/tls/Certificate;->EMPTY_CHAIN:Lorg/spongycastle/crypto/tls/Certificate;

    .line 947
    :cond_4
    invoke-virtual {p1}, Lorg/spongycastle/crypto/tls/Certificate;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_3f

    .line 949
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsProtocol;->getContext()Lorg/spongycastle/crypto/tls/TlsContext;

    move-result-object v0

    .line 950
    .local v0, "context":Lorg/spongycastle/crypto/tls/TlsContext;
    invoke-interface {v0}, Lorg/spongycastle/crypto/tls/TlsContext;->isServer()Z

    move-result v4

    if-nez v4, :cond_3f

    .line 952
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsProtocol;->getContext()Lorg/spongycastle/crypto/tls/TlsContext;

    move-result-object v4

    invoke-interface {v4}, Lorg/spongycastle/crypto/tls/TlsContext;->getServerVersion()Lorg/spongycastle/crypto/tls/ProtocolVersion;

    move-result-object v3

    .line 953
    .local v3, "serverVersion":Lorg/spongycastle/crypto/tls/ProtocolVersion;
    invoke-virtual {v3}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->isSSL()Z

    move-result v4

    if-eqz v4, :cond_3f

    .line 955
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " client didn\'t provide credentials"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 956
    .local v1, "errorMessage":Ljava/lang/String;
    const/16 v4, 0x29

    invoke-virtual {p0, v4, v1}, Lorg/spongycastle/crypto/tls/TlsProtocol;->raiseWarning(SLjava/lang/String;)V

    .line 967
    .end local v0    # "context":Lorg/spongycastle/crypto/tls/TlsContext;
    .end local v1    # "errorMessage":Ljava/lang/String;
    .end local v3    # "serverVersion":Lorg/spongycastle/crypto/tls/ProtocolVersion;
    :goto_3e
    return-void

    .line 962
    :cond_3f
    new-instance v2, Lorg/spongycastle/crypto/tls/TlsProtocol$HandshakeMessage;

    const/16 v4, 0xb

    invoke-direct {v2, p0, v4}, Lorg/spongycastle/crypto/tls/TlsProtocol$HandshakeMessage;-><init>(Lorg/spongycastle/crypto/tls/TlsProtocol;S)V

    .line 964
    .local v2, "message":Lorg/spongycastle/crypto/tls/TlsProtocol$HandshakeMessage;
    invoke-virtual {p1, v2}, Lorg/spongycastle/crypto/tls/Certificate;->encode(Ljava/io/OutputStream;)V

    .line 966
    invoke-virtual {v2}, Lorg/spongycastle/crypto/tls/TlsProtocol$HandshakeMessage;->writeToRecordStream()V

    goto :goto_3e
.end method

.method protected sendChangeCipherSpecMessage()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    const/4 v3, 0x0

    .line 972
    new-array v0, v1, [B

    aput-byte v1, v0, v3

    .line 973
    .local v0, "message":[B
    const/16 v1, 0x14

    array-length v2, v0

    invoke-virtual {p0, v1, v0, v3, v2}, Lorg/spongycastle/crypto/tls/TlsProtocol;->safeWriteRecord(S[BII)V

    .line 974
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->recordStream:Lorg/spongycastle/crypto/tls/RecordStream;

    invoke-virtual {v1}, Lorg/spongycastle/crypto/tls/RecordStream;->sentWriteCipherSpec()V

    .line 975
    return-void
.end method

.method protected sendFinishedMessage()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 980
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsProtocol;->getContext()Lorg/spongycastle/crypto/tls/TlsContext;

    move-result-object v2

    invoke-interface {v2}, Lorg/spongycastle/crypto/tls/TlsContext;->isServer()Z

    move-result v2

    invoke-virtual {p0, v2}, Lorg/spongycastle/crypto/tls/TlsProtocol;->createVerifyData(Z)[B

    move-result-object v1

    .line 982
    .local v1, "verify_data":[B
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsProtocol$HandshakeMessage;

    const/16 v2, 0x14

    array-length v3, v1

    invoke-direct {v0, p0, v2, v3}, Lorg/spongycastle/crypto/tls/TlsProtocol$HandshakeMessage;-><init>(Lorg/spongycastle/crypto/tls/TlsProtocol;SI)V

    .line 984
    .local v0, "message":Lorg/spongycastle/crypto/tls/TlsProtocol$HandshakeMessage;
    invoke-virtual {v0, v1}, Lorg/spongycastle/crypto/tls/TlsProtocol$HandshakeMessage;->write([B)V

    .line 986
    invoke-virtual {v0}, Lorg/spongycastle/crypto/tls/TlsProtocol$HandshakeMessage;->writeToRecordStream()V

    .line 987
    return-void
.end method

.method protected sendSupplementalDataMessage(Ljava/util/Vector;)V
    .registers 4
    .param p1, "supplementalData"    # Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 992
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsProtocol$HandshakeMessage;

    const/16 v1, 0x17

    invoke-direct {v0, p0, v1}, Lorg/spongycastle/crypto/tls/TlsProtocol$HandshakeMessage;-><init>(Lorg/spongycastle/crypto/tls/TlsProtocol;S)V

    .line 994
    .local v0, "message":Lorg/spongycastle/crypto/tls/TlsProtocol$HandshakeMessage;
    invoke-static {v0, p1}, Lorg/spongycastle/crypto/tls/TlsProtocol;->writeSupplementalData(Ljava/io/OutputStream;Ljava/util/Vector;)V

    .line 996
    invoke-virtual {v0}, Lorg/spongycastle/crypto/tls/TlsProtocol$HandshakeMessage;->writeToRecordStream()V

    .line 997
    return-void
.end method

.method protected writeData([BII)V
    .registers 7
    .param p1, "buf"    # [B
    .param p2, "offset"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v2, 0x17

    .line 590
    iget-boolean v1, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->closed:Z

    if-eqz v1, :cond_1a

    .line 592
    iget-boolean v1, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->failedWithError:Z

    if-eqz v1, :cond_12

    .line 594
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Internal TLS error, this could be an attack"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 597
    :cond_12
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Sorry, connection has been closed, you cannot write more data"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 600
    :cond_1a
    :goto_1a
    if-lez p3, :cond_3a

    .line 609
    iget-boolean v1, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->splitApplicationDataRecords:Z

    if-eqz v1, :cond_28

    .line 616
    const/4 v1, 0x1

    invoke-virtual {p0, v2, p1, p2, v1}, Lorg/spongycastle/crypto/tls/TlsProtocol;->safeWriteRecord(S[BII)V

    .line 617
    add-int/lit8 p2, p2, 0x1

    .line 618
    add-int/lit8 p3, p3, -0x1

    .line 621
    :cond_28
    if-lez p3, :cond_1a

    .line 624
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->recordStream:Lorg/spongycastle/crypto/tls/RecordStream;

    invoke-virtual {v1}, Lorg/spongycastle/crypto/tls/RecordStream;->getPlaintextLimit()I

    move-result v1

    invoke-static {p3, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 625
    .local v0, "toWrite":I
    invoke-virtual {p0, v2, p1, p2, v0}, Lorg/spongycastle/crypto/tls/TlsProtocol;->safeWriteRecord(S[BII)V

    .line 626
    add-int/2addr p2, v0

    .line 627
    sub-int/2addr p3, v0

    .line 628
    goto :goto_1a

    .line 630
    .end local v0    # "toWrite":I
    :cond_3a
    return-void
.end method

.method protected writeHandshakeMessage([BII)V
    .registers 6
    .param p1, "buf"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 634
    :goto_0
    if-lez p3, :cond_14

    .line 637
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/TlsProtocol;->recordStream:Lorg/spongycastle/crypto/tls/RecordStream;

    invoke-virtual {v1}, Lorg/spongycastle/crypto/tls/RecordStream;->getPlaintextLimit()I

    move-result v1

    invoke-static {p3, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 638
    .local v0, "toWrite":I
    const/16 v1, 0x16

    invoke-virtual {p0, v1, p1, p2, v0}, Lorg/spongycastle/crypto/tls/TlsProtocol;->safeWriteRecord(S[BII)V

    .line 639
    add-int/2addr p2, v0

    .line 640
    sub-int/2addr p3, v0

    .line 641
    goto :goto_0

    .line 642
    .end local v0    # "toWrite":I
    :cond_14
    return-void
.end method
