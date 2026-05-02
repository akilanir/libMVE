.class Lorg/spongycastle/crypto/tls/DTLSRecordLayer;
.super Ljava/lang/Object;
.source "DTLSRecordLayer.java"

# interfaces
.implements Lorg/spongycastle/crypto/tls/DatagramTransport;


# static fields
.field private static final MAX_FRAGMENT_LENGTH:I = 0x4000

.field private static final RECORD_HEADER_LENGTH:I = 0xd

.field private static final RETRANSMIT_TIMEOUT:J = 0x3a980L

.field private static final TCP_MSL:J = 0x1d4c0L


# instance fields
.field private volatile closed:Z

.field private final context:Lorg/spongycastle/crypto/tls/TlsContext;

.field private currentEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

.field private volatile failed:Z

.field private volatile inHandshake:Z

.field private final peer:Lorg/spongycastle/crypto/tls/TlsPeer;

.field private pendingEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

.field private volatile plaintextLimit:I

.field private readEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

.field private volatile readVersion:Lorg/spongycastle/crypto/tls/ProtocolVersion;

.field private final recordQueue:Lorg/spongycastle/crypto/tls/ByteQueue;

.field private retransmit:Lorg/spongycastle/crypto/tls/DTLSHandshakeRetransmit;

.field private retransmitEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

.field private retransmitExpiry:J

.field private final transport:Lorg/spongycastle/crypto/tls/DatagramTransport;

.field private writeEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

.field private volatile writeVersion:Lorg/spongycastle/crypto/tls/ProtocolVersion;


# direct methods
.method constructor <init>(Lorg/spongycastle/crypto/tls/DatagramTransport;Lorg/spongycastle/crypto/tls/TlsContext;Lorg/spongycastle/crypto/tls/TlsPeer;S)V
    .registers 9
    .param p1, "transport"    # Lorg/spongycastle/crypto/tls/DatagramTransport;
    .param p2, "context"    # Lorg/spongycastle/crypto/tls/TlsContext;
    .param p3, "peer"    # Lorg/spongycastle/crypto/tls/TlsPeer;
    .param p4, "contentType"    # S

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    new-instance v0, Lorg/spongycastle/crypto/tls/ByteQueue;

    invoke-direct {v0}, Lorg/spongycastle/crypto/tls/ByteQueue;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->recordQueue:Lorg/spongycastle/crypto/tls/ByteQueue;

    .line 19
    iput-boolean v3, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->closed:Z

    .line 20
    iput-boolean v3, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->failed:Z

    .line 21
    iput-object v2, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->readVersion:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    iput-object v2, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->writeVersion:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    .line 27
    iput-object v2, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->retransmit:Lorg/spongycastle/crypto/tls/DTLSHandshakeRetransmit;

    .line 28
    iput-object v2, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->retransmitEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    .line 29
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->retransmitExpiry:J

    .line 33
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->transport:Lorg/spongycastle/crypto/tls/DatagramTransport;

    .line 34
    iput-object p2, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->context:Lorg/spongycastle/crypto/tls/TlsContext;

    .line 35
    iput-object p3, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->peer:Lorg/spongycastle/crypto/tls/TlsPeer;

    .line 37
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->inHandshake:Z

    .line 39
    new-instance v0, Lorg/spongycastle/crypto/tls/DTLSEpoch;

    new-instance v1, Lorg/spongycastle/crypto/tls/TlsNullCipher;

    invoke-direct {v1, p2}, Lorg/spongycastle/crypto/tls/TlsNullCipher;-><init>(Lorg/spongycastle/crypto/tls/TlsContext;)V

    invoke-direct {v0, v3, v1}, Lorg/spongycastle/crypto/tls/DTLSEpoch;-><init>(ILorg/spongycastle/crypto/tls/TlsCipher;)V

    iput-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->currentEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    .line 40
    iput-object v2, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->pendingEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    .line 41
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->currentEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    iput-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->readEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    .line 42
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->currentEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    iput-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->writeEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    .line 44
    const/16 v0, 0x4000

    invoke-virtual {p0, v0}, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->setPlaintextLimit(I)V

    .line 45
    return-void
.end method

.method private closeTransport()V
    .registers 3

    .prologue
    .line 412
    iget-boolean v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->closed:Z

    if-nez v0, :cond_15

    .line 423
    :try_start_4
    iget-boolean v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->failed:Z

    if-nez v0, :cond_d

    .line 425
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->warn(SLjava/lang/String;)V

    .line 427
    :cond_d
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->transport:Lorg/spongycastle/crypto/tls/DatagramTransport;

    invoke-interface {v0}, Lorg/spongycastle/crypto/tls/DatagramTransport;->close()V
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_12} :catch_16

    .line 434
    :goto_12
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->closed:Z

    .line 436
    :cond_15
    return-void

    .line 429
    :catch_16
    move-exception v0

    goto :goto_12
.end method

.method private static getMacSequenceNumber(IJ)J
    .registers 7
    .param p0, "epoch"    # I
    .param p1, "sequence_number"    # J

    .prologue
    .line 527
    int-to-long v0, p0

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    const/16 v2, 0x30

    shl-long/2addr v0, v2

    or-long/2addr v0, p1

    return-wide v0
.end method

.method private raiseAlert(SSLjava/lang/String;Ljava/lang/Throwable;)V
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

    .line 441
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->peer:Lorg/spongycastle/crypto/tls/TlsPeer;

    invoke-interface {v1, p1, p2, p3, p4}, Lorg/spongycastle/crypto/tls/TlsPeer;->notifyAlertRaised(SSLjava/lang/String;Ljava/lang/Throwable;)V

    .line 443
    new-array v0, v4, [B

    .line 444
    .local v0, "error":[B
    int-to-byte v1, p1

    aput-byte v1, v0, v3

    .line 445
    const/4 v1, 0x1

    int-to-byte v2, p2

    aput-byte v2, v0, v1

    .line 447
    const/16 v1, 0x15

    invoke-direct {p0, v1, v0, v3, v4}, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->sendRecord(S[BII)V

    .line 448
    return-void
.end method

.method private receiveRecord([BIII)I
    .registers 14
    .param p1, "buf"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .param p4, "waitMillis"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v6, 0xd

    const/4 v8, 0x2

    const/4 v7, 0x0

    .line 453
    iget-object v5, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->recordQueue:Lorg/spongycastle/crypto/tls/ByteQueue;

    invoke-virtual {v5}, Lorg/spongycastle/crypto/tls/ByteQueue;->available()I

    move-result v5

    if-lez v5, :cond_34

    .line 455
    const/4 v1, 0x0

    .line 456
    .local v1, "length":I
    iget-object v5, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->recordQueue:Lorg/spongycastle/crypto/tls/ByteQueue;

    invoke-virtual {v5}, Lorg/spongycastle/crypto/tls/ByteQueue;->available()I

    move-result v5

    if-lt v5, v6, :cond_22

    .line 458
    new-array v2, v8, [B

    .line 459
    .local v2, "lengthBytes":[B
    iget-object v5, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->recordQueue:Lorg/spongycastle/crypto/tls/ByteQueue;

    const/16 v6, 0xb

    invoke-virtual {v5, v2, v7, v8, v6}, Lorg/spongycastle/crypto/tls/ByteQueue;->read([BIII)V

    .line 460
    invoke-static {v2, v7}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint16([BI)I

    move-result v1

    .line 463
    .end local v2    # "lengthBytes":[B
    :cond_22
    iget-object v5, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->recordQueue:Lorg/spongycastle/crypto/tls/ByteQueue;

    invoke-virtual {v5}, Lorg/spongycastle/crypto/tls/ByteQueue;->available()I

    move-result v5

    add-int/lit8 v6, v1, 0xd

    invoke-static {v5, v6}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 464
    .local v3, "received":I
    iget-object v5, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->recordQueue:Lorg/spongycastle/crypto/tls/ByteQueue;

    invoke-virtual {v5, p1, p2, v3, v7}, Lorg/spongycastle/crypto/tls/ByteQueue;->removeData([BIII)V

    .line 480
    .end local v1    # "length":I
    :cond_33
    :goto_33
    return v3

    .line 468
    .end local v3    # "received":I
    :cond_34
    iget-object v5, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->transport:Lorg/spongycastle/crypto/tls/DatagramTransport;

    invoke-interface {v5, p1, p2, p3, p4}, Lorg/spongycastle/crypto/tls/DatagramTransport;->receive([BIII)I

    move-result v3

    .line 469
    .restart local v3    # "received":I
    if-lt v3, v6, :cond_33

    .line 471
    add-int/lit8 v5, p2, 0xb

    invoke-static {p1, v5}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint16([BI)I

    move-result v0

    .line 472
    .local v0, "fragmentLength":I
    add-int/lit8 v4, v0, 0xd

    .line 473
    .local v4, "recordLength":I
    if-le v3, v4, :cond_33

    .line 475
    iget-object v5, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->recordQueue:Lorg/spongycastle/crypto/tls/ByteQueue;

    add-int v6, p2, v4

    sub-int v7, v3, v4

    invoke-virtual {v5, p1, v6, v7}, Lorg/spongycastle/crypto/tls/ByteQueue;->addData([BII)V

    .line 476
    move v3, v4

    goto :goto_33
.end method

.method private sendRecord(S[BII)V
    .registers 18
    .param p1, "contentType"    # S
    .param p2, "buf"    # [B
    .param p3, "off"    # I
    .param p4, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 487
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->writeVersion:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    if-nez v1, :cond_5

    .line 523
    :goto_4
    return-void

    .line 492
    :cond_5
    iget v1, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->plaintextLimit:I

    move/from16 v0, p4

    if-le v0, v1, :cond_13

    .line 494
    new-instance v1, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v2, 0x50

    invoke-direct {v1, v2}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v1

    .line 501
    :cond_13
    const/4 v1, 0x1

    move/from16 v0, p4

    if-ge v0, v1, :cond_24

    const/16 v1, 0x17

    if-eq p1, v1, :cond_24

    .line 503
    new-instance v1, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v2, 0x50

    invoke-direct {v1, v2}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v1

    .line 506
    :cond_24
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->writeEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    invoke-virtual {v1}, Lorg/spongycastle/crypto/tls/DTLSEpoch;->getEpoch()I

    move-result v10

    .line 507
    .local v10, "recordEpoch":I
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->writeEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    invoke-virtual {v1}, Lorg/spongycastle/crypto/tls/DTLSEpoch;->allocateSequenceNumber()J

    move-result-wide v11

    .line 509
    .local v11, "recordSequenceNumber":J
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->writeEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    invoke-virtual {v1}, Lorg/spongycastle/crypto/tls/DTLSEpoch;->getCipher()Lorg/spongycastle/crypto/tls/TlsCipher;

    move-result-object v1

    .line 510
    invoke-static {v10, v11, v12}, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->getMacSequenceNumber(IJ)J

    move-result-wide v2

    move v4, p1

    move-object v5, p2

    move/from16 v6, p3

    move/from16 v7, p4

    .line 509
    invoke-interface/range {v1 .. v7}, Lorg/spongycastle/crypto/tls/TlsCipher;->encodePlaintext(JS[BII)[B

    move-result-object v8

    .line 514
    .local v8, "ciphertext":[B
    array-length v1, v8

    add-int/lit8 v1, v1, 0xd

    new-array v9, v1, [B

    .line 515
    .local v9, "record":[B
    const/4 v1, 0x0

    invoke-static {p1, v9, v1}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint8(S[BI)V

    .line 516
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->writeVersion:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    const/4 v2, 0x1

    invoke-static {v1, v9, v2}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeVersion(Lorg/spongycastle/crypto/tls/ProtocolVersion;[BI)V

    .line 517
    const/4 v1, 0x3

    invoke-static {v10, v9, v1}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint16(I[BI)V

    .line 518
    const/4 v1, 0x5

    invoke-static {v11, v12, v9, v1}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint48(J[BI)V

    .line 519
    array-length v1, v8

    const/16 v2, 0xb

    invoke-static {v1, v9, v2}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint16(I[BI)V

    .line 520
    const/4 v1, 0x0

    const/16 v2, 0xd

    array-length v3, v8

    invoke-static {v8, v1, v9, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 522
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->transport:Lorg/spongycastle/crypto/tls/DatagramTransport;

    const/4 v2, 0x0

    array-length v3, v9

    invoke-interface {v1, v9, v2, v3}, Lorg/spongycastle/crypto/tls/DatagramTransport;->send([BII)V

    goto :goto_4
.end method


# virtual methods
.method public close()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 375
    iget-boolean v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->closed:Z

    if-nez v0, :cond_12

    .line 377
    iget-boolean v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->inHandshake:Z

    if-eqz v0, :cond_f

    .line 379
    const/16 v0, 0x5a

    const-string v1, "User canceled handshake"

    invoke-virtual {p0, v0, v1}, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->warn(SLjava/lang/String;)V

    .line 381
    :cond_f
    invoke-direct {p0}, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->closeTransport()V

    .line 383
    :cond_12
    return-void
.end method

.method fail(S)V
    .registers 5
    .param p1, "alertDescription"    # S

    .prologue
    .line 387
    iget-boolean v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->closed:Z

    if-nez v0, :cond_10

    .line 391
    const/4 v0, 0x2

    const/4 v1, 0x0

    const/4 v2, 0x0

    :try_start_7
    invoke-direct {p0, v0, p1, v1, v2}, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->raiseAlert(SSLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_a} :catch_11

    .line 398
    :goto_a
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->failed:Z

    .line 400
    invoke-direct {p0}, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->closeTransport()V

    .line 402
    :cond_10
    return-void

    .line 393
    :catch_11
    move-exception v0

    goto :goto_a
.end method

.method getReadVersion()Lorg/spongycastle/crypto/tls/ProtocolVersion;
    .registers 2

    .prologue
    .line 54
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->readVersion:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    return-object v0
.end method

.method public getReceiveLimit()I
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 119
    iget v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->plaintextLimit:I

    iget-object v1, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->readEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    .line 120
    invoke-virtual {v1}, Lorg/spongycastle/crypto/tls/DTLSEpoch;->getCipher()Lorg/spongycastle/crypto/tls/TlsCipher;

    move-result-object v1

    iget-object v2, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->transport:Lorg/spongycastle/crypto/tls/DatagramTransport;

    invoke-interface {v2}, Lorg/spongycastle/crypto/tls/DatagramTransport;->getReceiveLimit()I

    move-result v2

    add-int/lit8 v2, v2, -0xd

    invoke-interface {v1, v2}, Lorg/spongycastle/crypto/tls/TlsCipher;->getPlaintextLimit(I)I

    move-result v1

    .line 119
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    return v0
.end method

.method public getSendLimit()I
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 126
    iget v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->plaintextLimit:I

    iget-object v1, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->writeEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    .line 127
    invoke-virtual {v1}, Lorg/spongycastle/crypto/tls/DTLSEpoch;->getCipher()Lorg/spongycastle/crypto/tls/TlsCipher;

    move-result-object v1

    iget-object v2, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->transport:Lorg/spongycastle/crypto/tls/DatagramTransport;

    invoke-interface {v2}, Lorg/spongycastle/crypto/tls/DatagramTransport;->getSendLimit()I

    move-result v2

    add-int/lit8 v2, v2, -0xd

    invoke-interface {v1, v2}, Lorg/spongycastle/crypto/tls/TlsCipher;->getPlaintextLimit(I)I

    move-result v1

    .line 126
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    return v0
.end method

.method handshakeSuccessful(Lorg/spongycastle/crypto/tls/DTLSHandshakeRetransmit;)V
    .registers 6
    .param p1, "retransmit"    # Lorg/spongycastle/crypto/tls/DTLSHandshakeRetransmit;

    .prologue
    .line 86
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->readEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    iget-object v1, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->currentEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    if-eq v0, v1, :cond_c

    iget-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->writeEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    iget-object v1, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->currentEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    if-ne v0, v1, :cond_12

    .line 89
    :cond_c
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 92
    :cond_12
    if-eqz p1, :cond_24

    .line 94
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->retransmit:Lorg/spongycastle/crypto/tls/DTLSHandshakeRetransmit;

    .line 95
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->currentEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    iput-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->retransmitEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    .line 96
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-wide/32 v2, 0x3a980

    add-long/2addr v0, v2

    iput-wide v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->retransmitExpiry:J

    .line 99
    :cond_24
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->inHandshake:Z

    .line 100
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->pendingEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    iput-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->currentEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    .line 101
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->pendingEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    .line 102
    return-void
.end method

.method initPendingEpoch(Lorg/spongycastle/crypto/tls/TlsCipher;)V
    .registers 4
    .param p1, "pendingCipher"    # Lorg/spongycastle/crypto/tls/TlsCipher;

    .prologue
    .line 69
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->pendingEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    if-eqz v0, :cond_a

    .line 71
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 81
    :cond_a
    new-instance v0, Lorg/spongycastle/crypto/tls/DTLSEpoch;

    iget-object v1, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->writeEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    invoke-virtual {v1}, Lorg/spongycastle/crypto/tls/DTLSEpoch;->getEpoch()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-direct {v0, v1, p1}, Lorg/spongycastle/crypto/tls/DTLSEpoch;-><init>(ILorg/spongycastle/crypto/tls/TlsCipher;)V

    iput-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->pendingEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    .line 82
    return-void
.end method

.method public receive([BIII)I
    .registers 29
    .param p1, "buf"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .param p4, "waitMillis"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 133
    const/4 v7, 0x0

    .line 137
    .local v7, "record":[B
    :cond_1
    :goto_1
    :pswitch_1
    invoke-virtual/range {p0 .. p0}, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->getReceiveLimit()I

    move-result v3

    move/from16 v0, p3

    invoke-static {v0, v3}, Ljava/lang/Math;->min(II)I

    move-result v3

    add-int/lit8 v18, v3, 0xd

    .line 138
    .local v18, "receiveLimit":I
    if-eqz v7, :cond_14

    array-length v3, v7

    move/from16 v0, v18

    if-ge v3, v0, :cond_18

    .line 140
    :cond_14
    move/from16 v0, v18

    new-array v7, v0, [B

    .line 145
    :cond_18
    :try_start_18
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->retransmit:Lorg/spongycastle/crypto/tls/DTLSHandshakeRetransmit;

    if-eqz v3, :cond_34

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    move-object/from16 v0, p0

    iget-wide v8, v0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->retransmitExpiry:J

    cmp-long v3, v3, v8

    if-lez v3, :cond_34

    .line 147
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput-object v3, v0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->retransmit:Lorg/spongycastle/crypto/tls/DTLSHandshakeRetransmit;

    .line 148
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput-object v3, v0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->retransmitEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    .line 151
    :cond_34
    const/4 v3, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v18

    move/from16 v2, p4

    invoke-direct {v0, v7, v3, v1, v2}, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->receiveRecord([BIII)I

    move-result v19

    .line 152
    .local v19, "received":I
    if-gez v19, :cond_42

    .line 321
    .end local v19    # "received":I
    :goto_41
    return v19

    .line 156
    .restart local v19    # "received":I
    :cond_42
    const/16 v3, 0xd

    move/from16 v0, v19

    if-lt v0, v3, :cond_1

    .line 160
    const/16 v3, 0xb

    invoke-static {v7, v3}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint16([BI)I

    move-result v15

    .line 161
    .local v15, "length":I
    add-int/lit8 v3, v15, 0xd

    move/from16 v0, v19

    if-ne v0, v3, :cond_1

    .line 166
    const/4 v3, 0x0

    invoke-static {v7, v3}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint8([BI)S

    move-result v6

    .line 169
    .local v6, "type":S
    packed-switch v6, :pswitch_data_194

    goto :goto_1

    .line 182
    :pswitch_5d
    const/4 v3, 0x3

    invoke-static {v7, v3}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint16([BI)I

    move-result v13

    .line 184
    .local v13, "epoch":I
    const/16 v20, 0x0

    .line 185
    .local v20, "recordEpoch":Lorg/spongycastle/crypto/tls/DTLSEpoch;
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->readEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    invoke-virtual {v3}, Lorg/spongycastle/crypto/tls/DTLSEpoch;->getEpoch()I

    move-result v3

    if-ne v13, v3, :cond_105

    .line 187
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->readEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    move-object/from16 v20, v0

    .line 195
    :cond_74
    :goto_74
    if-eqz v20, :cond_1

    .line 200
    const/4 v3, 0x5

    invoke-static {v7, v3}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint48([BI)J

    move-result-wide v21

    .line 201
    .local v21, "seq":J
    invoke-virtual/range {v20 .. v20}, Lorg/spongycastle/crypto/tls/DTLSEpoch;->getReplayWindow()Lorg/spongycastle/crypto/tls/DTLSReplayWindow;

    move-result-object v3

    move-wide/from16 v0, v21

    invoke-virtual {v3, v0, v1}, Lorg/spongycastle/crypto/tls/DTLSReplayWindow;->shouldDiscard(J)Z

    move-result v3

    if-nez v3, :cond_1

    .line 206
    const/4 v3, 0x1

    invoke-static {v7, v3}, Lorg/spongycastle/crypto/tls/TlsUtils;->readVersion([BI)Lorg/spongycastle/crypto/tls/ProtocolVersion;

    move-result-object v23

    .line 207
    .local v23, "version":Lorg/spongycastle/crypto/tls/ProtocolVersion;
    invoke-virtual/range {v23 .. v23}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->isDTLS()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 212
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->readVersion:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    if-eqz v3, :cond_a4

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->readVersion:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    move-object/from16 v0, v23

    invoke-virtual {v3, v0}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->equals(Lorg/spongycastle/crypto/tls/ProtocolVersion;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 217
    :cond_a4
    invoke-virtual/range {v20 .. v20}, Lorg/spongycastle/crypto/tls/DTLSEpoch;->getCipher()Lorg/spongycastle/crypto/tls/TlsCipher;

    move-result-object v3

    .line 218
    invoke-virtual/range {v20 .. v20}, Lorg/spongycastle/crypto/tls/DTLSEpoch;->getEpoch()I

    move-result v4

    move-wide/from16 v0, v21

    invoke-static {v4, v0, v1}, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->getMacSequenceNumber(IJ)J

    move-result-wide v4

    const/16 v8, 0xd

    add-int/lit8 v9, v19, -0xd

    .line 217
    invoke-interface/range {v3 .. v9}, Lorg/spongycastle/crypto/tls/TlsCipher;->decodeCiphertext(JS[BII)[B

    move-result-object v17

    .line 221
    .local v17, "plaintext":[B
    invoke-virtual/range {v20 .. v20}, Lorg/spongycastle/crypto/tls/DTLSEpoch;->getReplayWindow()Lorg/spongycastle/crypto/tls/DTLSReplayWindow;

    move-result-object v3

    move-wide/from16 v0, v21

    invoke-virtual {v3, v0, v1}, Lorg/spongycastle/crypto/tls/DTLSReplayWindow;->reportAuthenticated(J)V

    .line 223
    move-object/from16 v0, v17

    array-length v3, v0

    move-object/from16 v0, p0

    iget v4, v0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->plaintextLimit:I

    if-gt v3, v4, :cond_1

    .line 228
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->readVersion:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    if-nez v3, :cond_d8

    .line 230
    move-object/from16 v0, v23

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->readVersion:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    .line 233
    :cond_d8
    packed-switch v6, :pswitch_data_1a2

    .line 314
    :cond_db
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->inHandshake:Z

    if-nez v3, :cond_f1

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->retransmit:Lorg/spongycastle/crypto/tls/DTLSHandshakeRetransmit;

    if-eqz v3, :cond_f1

    .line 316
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput-object v3, v0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->retransmit:Lorg/spongycastle/crypto/tls/DTLSHandshakeRetransmit;

    .line 317
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput-object v3, v0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->retransmitEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    .line 320
    :cond_f1
    const/4 v3, 0x0

    move-object/from16 v0, v17

    array-length v4, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    move/from16 v2, p2

    invoke-static {v0, v3, v1, v2, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 321
    move-object/from16 v0, v17

    array-length v0, v0

    move/from16 v19, v0

    goto/16 :goto_41

    .line 189
    .end local v17    # "plaintext":[B
    .end local v21    # "seq":J
    .end local v23    # "version":Lorg/spongycastle/crypto/tls/ProtocolVersion;
    :cond_105
    const/16 v3, 0x16

    if-ne v6, v3, :cond_74

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->retransmitEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    if-eqz v3, :cond_74

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->retransmitEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    .line 190
    invoke-virtual {v3}, Lorg/spongycastle/crypto/tls/DTLSEpoch;->getEpoch()I

    move-result v3

    if-ne v13, v3, :cond_74

    .line 192
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->retransmitEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    move-object/from16 v20, v0

    goto/16 :goto_74

    .line 237
    .restart local v17    # "plaintext":[B
    .restart local v21    # "seq":J
    .restart local v23    # "version":Lorg/spongycastle/crypto/tls/ProtocolVersion;
    :pswitch_121
    move-object/from16 v0, v17

    array-length v3, v0

    const/4 v4, 0x2

    if-ne v3, v4, :cond_1

    .line 239
    const/4 v3, 0x0

    aget-byte v3, v17, v3

    int-to-short v11, v3

    .line 240
    .local v11, "alertLevel":S
    const/4 v3, 0x1

    aget-byte v3, v17, v3

    int-to-short v10, v3

    .line 242
    .local v10, "alertDescription":S
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->peer:Lorg/spongycastle/crypto/tls/TlsPeer;

    invoke-interface {v3, v11, v10}, Lorg/spongycastle/crypto/tls/TlsPeer;->notifyAlertReceived(SS)V

    .line 244
    const/4 v3, 0x2

    if-ne v11, v3, :cond_146

    .line 246
    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->fail(S)V

    .line 247
    new-instance v3, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    invoke-direct {v3, v10}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v3
    :try_end_144
    .catch Ljava/io/IOException; {:try_start_18 .. :try_end_144} :catch_144

    .line 323
    .end local v6    # "type":S
    .end local v10    # "alertDescription":S
    .end local v11    # "alertLevel":S
    .end local v13    # "epoch":I
    .end local v15    # "length":I
    .end local v17    # "plaintext":[B
    .end local v19    # "received":I
    .end local v20    # "recordEpoch":Lorg/spongycastle/crypto/tls/DTLSEpoch;
    .end local v21    # "seq":J
    .end local v23    # "version":Lorg/spongycastle/crypto/tls/ProtocolVersion;
    :catch_144
    move-exception v12

    .line 326
    .local v12, "e":Ljava/io/IOException;
    throw v12

    .line 251
    .end local v12    # "e":Ljava/io/IOException;
    .restart local v6    # "type":S
    .restart local v10    # "alertDescription":S
    .restart local v11    # "alertLevel":S
    .restart local v13    # "epoch":I
    .restart local v15    # "length":I
    .restart local v17    # "plaintext":[B
    .restart local v19    # "received":I
    .restart local v20    # "recordEpoch":Lorg/spongycastle/crypto/tls/DTLSEpoch;
    .restart local v21    # "seq":J
    .restart local v23    # "version":Lorg/spongycastle/crypto/tls/ProtocolVersion;
    :cond_146
    if-nez v10, :cond_1

    .line 253
    :try_start_148
    invoke-direct/range {p0 .. p0}, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->closeTransport()V

    goto/16 :goto_1

    .line 261
    .end local v10    # "alertDescription":S
    .end local v11    # "alertLevel":S
    :pswitch_14d
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->inHandshake:Z

    if-eqz v3, :cond_db

    goto/16 :goto_1

    .line 273
    :pswitch_155
    const/4 v14, 0x0

    .local v14, "i":I
    :goto_156
    move-object/from16 v0, v17

    array-length v3, v0

    if-ge v14, v3, :cond_1

    .line 275
    move-object/from16 v0, v17

    invoke-static {v0, v14}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint8([BI)S

    move-result v16

    .line 276
    .local v16, "message":S
    const/4 v3, 0x1

    move/from16 v0, v16

    if-eq v0, v3, :cond_169

    .line 273
    :cond_166
    :goto_166
    add-int/lit8 v14, v14, 0x1

    goto :goto_156

    .line 281
    :cond_169
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->pendingEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    if-eqz v3, :cond_166

    .line 283
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->pendingEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    move-object/from16 v0, p0

    iput-object v3, v0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->readEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    goto :goto_166

    .line 291
    .end local v14    # "i":I
    .end local v16    # "message":S
    :pswitch_178
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->inHandshake:Z

    if-nez v3, :cond_db

    .line 293
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->retransmit:Lorg/spongycastle/crypto/tls/DTLSHandshakeRetransmit;

    if-eqz v3, :cond_1

    .line 295
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->retransmit:Lorg/spongycastle/crypto/tls/DTLSHandshakeRetransmit;

    const/4 v4, 0x0

    move-object/from16 v0, v17

    array-length v5, v0

    move-object/from16 v0, v17

    invoke-interface {v3, v13, v0, v4, v5}, Lorg/spongycastle/crypto/tls/DTLSHandshakeRetransmit;->receivedHandshakeRecord(I[BII)V
    :try_end_191
    .catch Ljava/io/IOException; {:try_start_148 .. :try_end_191} :catch_144

    goto/16 :goto_1

    .line 169
    nop

    :pswitch_data_194
    .packed-switch 0x14
        :pswitch_5d
        :pswitch_5d
        :pswitch_5d
        :pswitch_5d
        :pswitch_5d
    .end packed-switch

    .line 233
    :pswitch_data_1a2
    .packed-switch 0x14
        :pswitch_155
        :pswitch_121
        :pswitch_178
        :pswitch_14d
        :pswitch_1
    .end packed-switch
.end method

.method resetWriteEpoch()V
    .registers 2

    .prologue
    .line 106
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->retransmitEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    if-eqz v0, :cond_9

    .line 108
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->retransmitEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    iput-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->writeEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    .line 114
    :goto_8
    return-void

    .line 112
    :cond_9
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->currentEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    iput-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->writeEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    goto :goto_8
.end method

.method public send([BII)V
    .registers 13
    .param p1, "buf"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v8, 0x14

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 334
    const/16 v0, 0x17

    .line 336
    .local v0, "contentType":S
    iget-boolean v4, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->inHandshake:Z

    if-nez v4, :cond_10

    iget-object v4, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->writeEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    iget-object v5, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->retransmitEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    if-ne v4, v5, :cond_3a

    .line 338
    :cond_10
    const/16 v0, 0x16

    .line 340
    invoke-static {p1, p2}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint8([BI)S

    move-result v2

    .line 341
    .local v2, "handshakeType":S
    if-ne v2, v8, :cond_3a

    .line 343
    const/4 v3, 0x0

    .line 344
    .local v3, "nextEpoch":Lorg/spongycastle/crypto/tls/DTLSEpoch;
    iget-boolean v4, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->inHandshake:Z

    if-eqz v4, :cond_27

    .line 346
    iget-object v3, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->pendingEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    .line 353
    :cond_1f
    :goto_1f
    if-nez v3, :cond_30

    .line 356
    new-instance v4, Ljava/lang/IllegalStateException;

    invoke-direct {v4}, Ljava/lang/IllegalStateException;-><init>()V

    throw v4

    .line 348
    :cond_27
    iget-object v4, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->writeEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    iget-object v5, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->retransmitEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    if-ne v4, v5, :cond_1f

    .line 350
    iget-object v3, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->currentEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    goto :goto_1f

    .line 362
    :cond_30
    new-array v1, v7, [B

    aput-byte v7, v1, v6

    .line 363
    .local v1, "data":[B
    array-length v4, v1

    invoke-direct {p0, v8, v1, v6, v4}, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->sendRecord(S[BII)V

    .line 365
    iput-object v3, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->writeEpoch:Lorg/spongycastle/crypto/tls/DTLSEpoch;

    .line 369
    .end local v1    # "data":[B
    .end local v2    # "handshakeType":S
    .end local v3    # "nextEpoch":Lorg/spongycastle/crypto/tls/DTLSEpoch;
    :cond_3a
    invoke-direct {p0, v0, p1, p2, p3}, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->sendRecord(S[BII)V

    .line 370
    return-void
.end method

.method setPlaintextLimit(I)V
    .registers 2
    .param p1, "plaintextLimit"    # I

    .prologue
    .line 49
    iput p1, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->plaintextLimit:I

    .line 50
    return-void
.end method

.method setReadVersion(Lorg/spongycastle/crypto/tls/ProtocolVersion;)V
    .registers 2
    .param p1, "readVersion"    # Lorg/spongycastle/crypto/tls/ProtocolVersion;

    .prologue
    .line 59
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->readVersion:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    .line 60
    return-void
.end method

.method setWriteVersion(Lorg/spongycastle/crypto/tls/ProtocolVersion;)V
    .registers 2
    .param p1, "writeVersion"    # Lorg/spongycastle/crypto/tls/ProtocolVersion;

    .prologue
    .line 64
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->writeVersion:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    .line 65
    return-void
.end method

.method warn(SLjava/lang/String;)V
    .registers 5
    .param p1, "alertDescription"    # S
    .param p2, "message"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 407
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-direct {p0, v0, p1, p2, v1}, Lorg/spongycastle/crypto/tls/DTLSRecordLayer;->raiseAlert(SSLjava/lang/String;Ljava/lang/Throwable;)V

    .line 408
    return-void
.end method
