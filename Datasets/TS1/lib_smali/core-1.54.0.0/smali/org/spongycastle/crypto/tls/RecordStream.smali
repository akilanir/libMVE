.class Lorg/spongycastle/crypto/tls/RecordStream;
.super Ljava/lang/Object;
.source "RecordStream.java"


# static fields
.field private static DEFAULT_PLAINTEXT_LIMIT:I = 0x0

.field static final TLS_HEADER_LENGTH_OFFSET:I = 0x3

.field static final TLS_HEADER_SIZE:I = 0x5

.field static final TLS_HEADER_TYPE_OFFSET:I = 0x0

.field static final TLS_HEADER_VERSION_OFFSET:I = 0x1


# instance fields
.field private buffer:Ljava/io/ByteArrayOutputStream;

.field private ciphertextLimit:I

.field private compressedLimit:I

.field private handler:Lorg/spongycastle/crypto/tls/TlsProtocol;

.field private handshakeHash:Lorg/spongycastle/crypto/tls/TlsHandshakeHash;

.field private input:Ljava/io/InputStream;

.field private output:Ljava/io/OutputStream;

.field private pendingCipher:Lorg/spongycastle/crypto/tls/TlsCipher;

.field private pendingCompression:Lorg/spongycastle/crypto/tls/TlsCompression;

.field private plaintextLimit:I

.field private readCipher:Lorg/spongycastle/crypto/tls/TlsCipher;

.field private readCompression:Lorg/spongycastle/crypto/tls/TlsCompression;

.field private readSeqNo:J

.field private readVersion:Lorg/spongycastle/crypto/tls/ProtocolVersion;

.field private restrictReadVersion:Z

.field private writeCipher:Lorg/spongycastle/crypto/tls/TlsCipher;

.field private writeCompression:Lorg/spongycastle/crypto/tls/TlsCompression;

.field private writeSeqNo:J

.field private writeVersion:Lorg/spongycastle/crypto/tls/ProtocolVersion;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 13
    const/16 v0, 0x4000

    sput v0, Lorg/spongycastle/crypto/tls/RecordStream;->DEFAULT_PLAINTEXT_LIMIT:I

    return-void
.end method

.method constructor <init>(Lorg/spongycastle/crypto/tls/TlsProtocol;Ljava/io/InputStream;Ljava/io/OutputStream;)V
    .registers 8
    .param p1, "handler"    # Lorg/spongycastle/crypto/tls/TlsProtocol;
    .param p2, "input"    # Ljava/io/InputStream;
    .param p3, "output"    # Ljava/io/OutputStream;

    .prologue
    const-wide/16 v2, 0x0

    const/4 v1, 0x0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-object v1, p0, Lorg/spongycastle/crypto/tls/RecordStream;->pendingCompression:Lorg/spongycastle/crypto/tls/TlsCompression;

    iput-object v1, p0, Lorg/spongycastle/crypto/tls/RecordStream;->readCompression:Lorg/spongycastle/crypto/tls/TlsCompression;

    iput-object v1, p0, Lorg/spongycastle/crypto/tls/RecordStream;->writeCompression:Lorg/spongycastle/crypto/tls/TlsCompression;

    .line 23
    iput-object v1, p0, Lorg/spongycastle/crypto/tls/RecordStream;->pendingCipher:Lorg/spongycastle/crypto/tls/TlsCipher;

    iput-object v1, p0, Lorg/spongycastle/crypto/tls/RecordStream;->readCipher:Lorg/spongycastle/crypto/tls/TlsCipher;

    iput-object v1, p0, Lorg/spongycastle/crypto/tls/RecordStream;->writeCipher:Lorg/spongycastle/crypto/tls/TlsCipher;

    .line 24
    iput-wide v2, p0, Lorg/spongycastle/crypto/tls/RecordStream;->readSeqNo:J

    iput-wide v2, p0, Lorg/spongycastle/crypto/tls/RecordStream;->writeSeqNo:J

    .line 25
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/crypto/tls/RecordStream;->buffer:Ljava/io/ByteArrayOutputStream;

    .line 27
    iput-object v1, p0, Lorg/spongycastle/crypto/tls/RecordStream;->handshakeHash:Lorg/spongycastle/crypto/tls/TlsHandshakeHash;

    .line 29
    iput-object v1, p0, Lorg/spongycastle/crypto/tls/RecordStream;->readVersion:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    iput-object v1, p0, Lorg/spongycastle/crypto/tls/RecordStream;->writeVersion:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    .line 30
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/spongycastle/crypto/tls/RecordStream;->restrictReadVersion:Z

    .line 36
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/RecordStream;->handler:Lorg/spongycastle/crypto/tls/TlsProtocol;

    .line 37
    iput-object p2, p0, Lorg/spongycastle/crypto/tls/RecordStream;->input:Ljava/io/InputStream;

    .line 38
    iput-object p3, p0, Lorg/spongycastle/crypto/tls/RecordStream;->output:Ljava/io/OutputStream;

    .line 39
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsNullCompression;

    invoke-direct {v0}, Lorg/spongycastle/crypto/tls/TlsNullCompression;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/crypto/tls/RecordStream;->readCompression:Lorg/spongycastle/crypto/tls/TlsCompression;

    .line 40
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/RecordStream;->readCompression:Lorg/spongycastle/crypto/tls/TlsCompression;

    iput-object v0, p0, Lorg/spongycastle/crypto/tls/RecordStream;->writeCompression:Lorg/spongycastle/crypto/tls/TlsCompression;

    .line 41
    return-void
.end method

.method private static checkLength(IIS)V
    .registers 4
    .param p0, "length"    # I
    .param p1, "limit"    # I
    .param p2, "alertDescription"    # S
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 362
    if-le p0, p1, :cond_8

    .line 364
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    invoke-direct {v0, p2}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v0

    .line 366
    :cond_8
    return-void
.end method

.method private static checkType(SS)V
    .registers 3
    .param p0, "type"    # S
    .param p1, "alertDescription"    # S
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 346
    packed-switch p0, :pswitch_data_a

    .line 355
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    invoke-direct {v0, p1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v0

    .line 357
    :pswitch_9
    return-void

    .line 346
    :pswitch_data_a
    .packed-switch 0x14
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_9
    .end packed-switch
.end method

.method private getBufferContents()[B
    .registers 3

    .prologue
    .line 338
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/RecordStream;->buffer:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    .line 339
    .local v0, "contents":[B
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/RecordStream;->buffer:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->reset()V

    .line 340
    return-object v0
.end method


# virtual methods
.method decodeAndVerify(SLjava/io/InputStream;I)[B
    .registers 16
    .param p1, "type"    # S
    .param p2, "input"    # Ljava/io/InputStream;
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v11, 0x16

    const/4 v5, 0x0

    .line 181
    iget v0, p0, Lorg/spongycastle/crypto/tls/RecordStream;->ciphertextLimit:I

    invoke-static {p3, v0, v11}, Lorg/spongycastle/crypto/tls/RecordStream;->checkLength(IIS)V

    .line 183
    invoke-static {p3, p2}, Lorg/spongycastle/crypto/tls/TlsUtils;->readFully(ILjava/io/InputStream;)[B

    move-result-object v4

    .line 184
    .local v4, "buf":[B
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/RecordStream;->readCipher:Lorg/spongycastle/crypto/tls/TlsCipher;

    iget-wide v1, p0, Lorg/spongycastle/crypto/tls/RecordStream;->readSeqNo:J

    const-wide/16 v9, 0x1

    add-long/2addr v9, v1

    iput-wide v9, p0, Lorg/spongycastle/crypto/tls/RecordStream;->readSeqNo:J

    array-length v6, v4

    move v3, p1

    invoke-interface/range {v0 .. v6}, Lorg/spongycastle/crypto/tls/TlsCipher;->decodeCiphertext(JS[BII)[B

    move-result-object v8

    .line 186
    .local v8, "decoded":[B
    array-length v0, v8

    iget v1, p0, Lorg/spongycastle/crypto/tls/RecordStream;->compressedLimit:I

    invoke-static {v0, v1, v11}, Lorg/spongycastle/crypto/tls/RecordStream;->checkLength(IIS)V

    .line 192
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/RecordStream;->readCompression:Lorg/spongycastle/crypto/tls/TlsCompression;

    iget-object v1, p0, Lorg/spongycastle/crypto/tls/RecordStream;->buffer:Ljava/io/ByteArrayOutputStream;

    invoke-interface {v0, v1}, Lorg/spongycastle/crypto/tls/TlsCompression;->decompress(Ljava/io/OutputStream;)Ljava/io/OutputStream;

    move-result-object v7

    .line 193
    .local v7, "cOut":Ljava/io/OutputStream;
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/RecordStream;->buffer:Ljava/io/ByteArrayOutputStream;

    if-eq v7, v0, :cond_38

    .line 195
    array-length v0, v8

    invoke-virtual {v7, v8, v5, v0}, Ljava/io/OutputStream;->write([BII)V

    .line 196
    invoke-virtual {v7}, Ljava/io/OutputStream;->flush()V

    .line 197
    invoke-direct {p0}, Lorg/spongycastle/crypto/tls/RecordStream;->getBufferContents()[B

    move-result-object v8

    .line 205
    :cond_38
    array-length v0, v8

    iget v1, p0, Lorg/spongycastle/crypto/tls/RecordStream;->plaintextLimit:I

    const/16 v2, 0x1e

    invoke-static {v0, v1, v2}, Lorg/spongycastle/crypto/tls/RecordStream;->checkLength(IIS)V

    .line 211
    array-length v0, v8

    const/4 v1, 0x1

    if-ge v0, v1, :cond_50

    const/16 v0, 0x17

    if-eq p1, v0, :cond_50

    .line 213
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v1, 0x2f

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v0

    .line 216
    :cond_50
    return-object v8
.end method

.method finaliseHandshake()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 125
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/RecordStream;->readCompression:Lorg/spongycastle/crypto/tls/TlsCompression;

    iget-object v1, p0, Lorg/spongycastle/crypto/tls/RecordStream;->pendingCompression:Lorg/spongycastle/crypto/tls/TlsCompression;

    if-ne v0, v1, :cond_19

    iget-object v0, p0, Lorg/spongycastle/crypto/tls/RecordStream;->writeCompression:Lorg/spongycastle/crypto/tls/TlsCompression;

    iget-object v1, p0, Lorg/spongycastle/crypto/tls/RecordStream;->pendingCompression:Lorg/spongycastle/crypto/tls/TlsCompression;

    if-ne v0, v1, :cond_19

    iget-object v0, p0, Lorg/spongycastle/crypto/tls/RecordStream;->readCipher:Lorg/spongycastle/crypto/tls/TlsCipher;

    iget-object v1, p0, Lorg/spongycastle/crypto/tls/RecordStream;->pendingCipher:Lorg/spongycastle/crypto/tls/TlsCipher;

    if-ne v0, v1, :cond_19

    iget-object v0, p0, Lorg/spongycastle/crypto/tls/RecordStream;->writeCipher:Lorg/spongycastle/crypto/tls/TlsCipher;

    iget-object v1, p0, Lorg/spongycastle/crypto/tls/RecordStream;->pendingCipher:Lorg/spongycastle/crypto/tls/TlsCipher;

    if-eq v0, v1, :cond_21

    .line 128
    :cond_19
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v1, 0x28

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v0

    .line 130
    :cond_21
    iput-object v2, p0, Lorg/spongycastle/crypto/tls/RecordStream;->pendingCompression:Lorg/spongycastle/crypto/tls/TlsCompression;

    .line 131
    iput-object v2, p0, Lorg/spongycastle/crypto/tls/RecordStream;->pendingCipher:Lorg/spongycastle/crypto/tls/TlsCipher;

    .line 132
    return-void
.end method

.method flush()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 333
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/RecordStream;->output:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 334
    return-void
.end method

.method getHandshakeHash()Lorg/spongycastle/crypto/tls/TlsHandshakeHash;
    .registers 2

    .prologue
    .line 296
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/RecordStream;->handshakeHash:Lorg/spongycastle/crypto/tls/TlsHandshakeHash;

    return-object v0
.end method

.method getPlaintextLimit()I
    .registers 2

    .prologue
    .line 55
    iget v0, p0, Lorg/spongycastle/crypto/tls/RecordStream;->plaintextLimit:I

    return v0
.end method

.method getReadVersion()Lorg/spongycastle/crypto/tls/ProtocolVersion;
    .registers 2

    .prologue
    .line 67
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/RecordStream;->readVersion:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    return-object v0
.end method

.method init(Lorg/spongycastle/crypto/tls/TlsContext;)V
    .registers 3
    .param p1, "context"    # Lorg/spongycastle/crypto/tls/TlsContext;

    .prologue
    .line 45
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsNullCipher;

    invoke-direct {v0, p1}, Lorg/spongycastle/crypto/tls/TlsNullCipher;-><init>(Lorg/spongycastle/crypto/tls/TlsContext;)V

    iput-object v0, p0, Lorg/spongycastle/crypto/tls/RecordStream;->readCipher:Lorg/spongycastle/crypto/tls/TlsCipher;

    .line 46
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/RecordStream;->readCipher:Lorg/spongycastle/crypto/tls/TlsCipher;

    iput-object v0, p0, Lorg/spongycastle/crypto/tls/RecordStream;->writeCipher:Lorg/spongycastle/crypto/tls/TlsCipher;

    .line 47
    new-instance v0, Lorg/spongycastle/crypto/tls/DeferredHash;

    invoke-direct {v0}, Lorg/spongycastle/crypto/tls/DeferredHash;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/crypto/tls/RecordStream;->handshakeHash:Lorg/spongycastle/crypto/tls/TlsHandshakeHash;

    .line 48
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/RecordStream;->handshakeHash:Lorg/spongycastle/crypto/tls/TlsHandshakeHash;

    invoke-interface {v0, p1}, Lorg/spongycastle/crypto/tls/TlsHandshakeHash;->init(Lorg/spongycastle/crypto/tls/TlsContext;)V

    .line 50
    sget v0, Lorg/spongycastle/crypto/tls/RecordStream;->DEFAULT_PLAINTEXT_LIMIT:I

    invoke-virtual {p0, v0}, Lorg/spongycastle/crypto/tls/RecordStream;->setPlaintextLimit(I)V

    .line 51
    return-void
.end method

.method notifyHelloComplete()V
    .registers 2

    .prologue
    .line 291
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/RecordStream;->handshakeHash:Lorg/spongycastle/crypto/tls/TlsHandshakeHash;

    invoke-interface {v0}, Lorg/spongycastle/crypto/tls/TlsHandshakeHash;->notifyPRFDetermined()Lorg/spongycastle/crypto/tls/TlsHandshakeHash;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/crypto/tls/RecordStream;->handshakeHash:Lorg/spongycastle/crypto/tls/TlsHandshakeHash;

    .line 292
    return-void
.end method

.method prepareToFinish()Lorg/spongycastle/crypto/tls/TlsHandshakeHash;
    .registers 3

    .prologue
    .line 301
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/RecordStream;->handshakeHash:Lorg/spongycastle/crypto/tls/TlsHandshakeHash;

    .line 302
    .local v0, "result":Lorg/spongycastle/crypto/tls/TlsHandshakeHash;
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/RecordStream;->handshakeHash:Lorg/spongycastle/crypto/tls/TlsHandshakeHash;

    invoke-interface {v1}, Lorg/spongycastle/crypto/tls/TlsHandshakeHash;->stopTracking()Lorg/spongycastle/crypto/tls/TlsHandshakeHash;

    move-result-object v1

    iput-object v1, p0, Lorg/spongycastle/crypto/tls/RecordStream;->handshakeHash:Lorg/spongycastle/crypto/tls/TlsHandshakeHash;

    .line 303
    return-object v0
.end method

.method readRecord()Z
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v9, 0x2f

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 137
    const/4 v7, 0x5

    iget-object v8, p0, Lorg/spongycastle/crypto/tls/RecordStream;->input:Ljava/io/InputStream;

    invoke-static {v7, v8}, Lorg/spongycastle/crypto/tls/TlsUtils;->readAllOrNothing(ILjava/io/InputStream;)[B

    move-result-object v2

    .line 138
    .local v2, "recordHeader":[B
    if-nez v2, :cond_e

    .line 175
    :goto_d
    return v5

    .line 143
    :cond_e
    invoke-static {v2, v5}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint8([BI)S

    move-result v3

    .line 149
    .local v3, "type":S
    const/16 v7, 0xa

    invoke-static {v3, v7}, Lorg/spongycastle/crypto/tls/RecordStream;->checkType(SS)V

    .line 151
    iget-boolean v7, p0, Lorg/spongycastle/crypto/tls/RecordStream;->restrictReadVersion:Z

    if-nez v7, :cond_2b

    .line 153
    invoke-static {v2, v6}, Lorg/spongycastle/crypto/tls/TlsUtils;->readVersionRaw([BI)I

    move-result v4

    .line 154
    .local v4, "version":I
    and-int/lit16 v7, v4, -0x100

    const/16 v8, 0x300

    if-eq v7, v8, :cond_35

    .line 156
    new-instance v5, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    invoke-direct {v5, v9}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v5

    .line 161
    .end local v4    # "version":I
    :cond_2b
    invoke-static {v2, v6}, Lorg/spongycastle/crypto/tls/TlsUtils;->readVersion([BI)Lorg/spongycastle/crypto/tls/ProtocolVersion;

    move-result-object v4

    .line 162
    .local v4, "version":Lorg/spongycastle/crypto/tls/ProtocolVersion;
    iget-object v7, p0, Lorg/spongycastle/crypto/tls/RecordStream;->readVersion:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    if-nez v7, :cond_48

    .line 164
    iput-object v4, p0, Lorg/spongycastle/crypto/tls/RecordStream;->readVersion:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    .line 172
    .end local v4    # "version":Lorg/spongycastle/crypto/tls/ProtocolVersion;
    :cond_35
    const/4 v7, 0x3

    invoke-static {v2, v7}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint16([BI)I

    move-result v0

    .line 173
    .local v0, "length":I
    iget-object v7, p0, Lorg/spongycastle/crypto/tls/RecordStream;->input:Ljava/io/InputStream;

    invoke-virtual {p0, v3, v7, v0}, Lorg/spongycastle/crypto/tls/RecordStream;->decodeAndVerify(SLjava/io/InputStream;I)[B

    move-result-object v1

    .line 174
    .local v1, "plaintext":[B
    iget-object v7, p0, Lorg/spongycastle/crypto/tls/RecordStream;->handler:Lorg/spongycastle/crypto/tls/TlsProtocol;

    array-length v8, v1

    invoke-virtual {v7, v3, v1, v5, v8}, Lorg/spongycastle/crypto/tls/TlsProtocol;->processRecord(S[BII)V

    move v5, v6

    .line 175
    goto :goto_d

    .line 166
    .end local v0    # "length":I
    .end local v1    # "plaintext":[B
    .restart local v4    # "version":Lorg/spongycastle/crypto/tls/ProtocolVersion;
    :cond_48
    iget-object v7, p0, Lorg/spongycastle/crypto/tls/RecordStream;->readVersion:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    invoke-virtual {v4, v7}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->equals(Lorg/spongycastle/crypto/tls/ProtocolVersion;)Z

    move-result v7

    if-nez v7, :cond_35

    .line 168
    new-instance v5, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    invoke-direct {v5, v9}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v5
.end method

.method receivedReadCipherSpec()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 113
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/RecordStream;->pendingCompression:Lorg/spongycastle/crypto/tls/TlsCompression;

    if-eqz v0, :cond_8

    iget-object v0, p0, Lorg/spongycastle/crypto/tls/RecordStream;->pendingCipher:Lorg/spongycastle/crypto/tls/TlsCipher;

    if-nez v0, :cond_10

    .line 115
    :cond_8
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v1, 0x28

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v0

    .line 117
    :cond_10
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/RecordStream;->pendingCompression:Lorg/spongycastle/crypto/tls/TlsCompression;

    iput-object v0, p0, Lorg/spongycastle/crypto/tls/RecordStream;->readCompression:Lorg/spongycastle/crypto/tls/TlsCompression;

    .line 118
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/RecordStream;->pendingCipher:Lorg/spongycastle/crypto/tls/TlsCipher;

    iput-object v0, p0, Lorg/spongycastle/crypto/tls/RecordStream;->readCipher:Lorg/spongycastle/crypto/tls/TlsCipher;

    .line 119
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/spongycastle/crypto/tls/RecordStream;->readSeqNo:J

    .line 120
    return-void
.end method

.method safeClose()V
    .registers 2

    .prologue
    .line 315
    :try_start_0
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/RecordStream;->input:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_d

    .line 323
    :goto_5
    :try_start_5
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/RecordStream;->output:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_a} :catch_b

    .line 328
    :goto_a
    return-void

    .line 325
    :catch_b
    move-exception v0

    goto :goto_a

    .line 317
    :catch_d
    move-exception v0

    goto :goto_5
.end method

.method sentWriteCipherSpec()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 101
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/RecordStream;->pendingCompression:Lorg/spongycastle/crypto/tls/TlsCompression;

    if-eqz v0, :cond_8

    iget-object v0, p0, Lorg/spongycastle/crypto/tls/RecordStream;->pendingCipher:Lorg/spongycastle/crypto/tls/TlsCipher;

    if-nez v0, :cond_10

    .line 103
    :cond_8
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v1, 0x28

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v0

    .line 105
    :cond_10
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/RecordStream;->pendingCompression:Lorg/spongycastle/crypto/tls/TlsCompression;

    iput-object v0, p0, Lorg/spongycastle/crypto/tls/RecordStream;->writeCompression:Lorg/spongycastle/crypto/tls/TlsCompression;

    .line 106
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/RecordStream;->pendingCipher:Lorg/spongycastle/crypto/tls/TlsCipher;

    iput-object v0, p0, Lorg/spongycastle/crypto/tls/RecordStream;->writeCipher:Lorg/spongycastle/crypto/tls/TlsCipher;

    .line 107
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/spongycastle/crypto/tls/RecordStream;->writeSeqNo:J

    .line 108
    return-void
.end method

.method setPendingConnectionState(Lorg/spongycastle/crypto/tls/TlsCompression;Lorg/spongycastle/crypto/tls/TlsCipher;)V
    .registers 3
    .param p1, "tlsCompression"    # Lorg/spongycastle/crypto/tls/TlsCompression;
    .param p2, "tlsCipher"    # Lorg/spongycastle/crypto/tls/TlsCipher;

    .prologue
    .line 94
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/RecordStream;->pendingCompression:Lorg/spongycastle/crypto/tls/TlsCompression;

    .line 95
    iput-object p2, p0, Lorg/spongycastle/crypto/tls/RecordStream;->pendingCipher:Lorg/spongycastle/crypto/tls/TlsCipher;

    .line 96
    return-void
.end method

.method setPlaintextLimit(I)V
    .registers 3
    .param p1, "plaintextLimit"    # I

    .prologue
    .line 60
    iput p1, p0, Lorg/spongycastle/crypto/tls/RecordStream;->plaintextLimit:I

    .line 61
    iget v0, p0, Lorg/spongycastle/crypto/tls/RecordStream;->plaintextLimit:I

    add-int/lit16 v0, v0, 0x400

    iput v0, p0, Lorg/spongycastle/crypto/tls/RecordStream;->compressedLimit:I

    .line 62
    iget v0, p0, Lorg/spongycastle/crypto/tls/RecordStream;->compressedLimit:I

    add-int/lit16 v0, v0, 0x400

    iput v0, p0, Lorg/spongycastle/crypto/tls/RecordStream;->ciphertextLimit:I

    .line 63
    return-void
.end method

.method setReadVersion(Lorg/spongycastle/crypto/tls/ProtocolVersion;)V
    .registers 2
    .param p1, "readVersion"    # Lorg/spongycastle/crypto/tls/ProtocolVersion;

    .prologue
    .line 72
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/RecordStream;->readVersion:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    .line 73
    return-void
.end method

.method setRestrictReadVersion(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 89
    iput-boolean p1, p0, Lorg/spongycastle/crypto/tls/RecordStream;->restrictReadVersion:Z

    .line 90
    return-void
.end method

.method setWriteVersion(Lorg/spongycastle/crypto/tls/ProtocolVersion;)V
    .registers 2
    .param p1, "writeVersion"    # Lorg/spongycastle/crypto/tls/ProtocolVersion;

    .prologue
    .line 77
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/RecordStream;->writeVersion:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    .line 78
    return-void
.end method

.method updateHandshakeData([BII)V
    .registers 5
    .param p1, "message"    # [B
    .param p2, "offset"    # I
    .param p3, "len"    # I

    .prologue
    .line 308
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/RecordStream;->handshakeHash:Lorg/spongycastle/crypto/tls/TlsHandshakeHash;

    invoke-interface {v0, p1, p2, p3}, Lorg/spongycastle/crypto/tls/TlsHandshakeHash;->update([BII)V

    .line 309
    return-void
.end method

.method writeRecord(S[BII)V
    .registers 15
    .param p1, "type"    # S
    .param p2, "plaintext"    # [B
    .param p3, "plaintextOffset"    # I
    .param p4, "plaintextLength"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 223
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/RecordStream;->writeVersion:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    if-nez v0, :cond_5

    .line 287
    :goto_4
    return-void

    .line 232
    :cond_5
    const/16 v0, 0x50

    invoke-static {p1, v0}, Lorg/spongycastle/crypto/tls/RecordStream;->checkType(SS)V

    .line 237
    iget v0, p0, Lorg/spongycastle/crypto/tls/RecordStream;->plaintextLimit:I

    const/16 v1, 0x50

    invoke-static {p4, v0, v1}, Lorg/spongycastle/crypto/tls/RecordStream;->checkLength(IIS)V

    .line 243
    const/4 v0, 0x1

    if-ge p4, v0, :cond_20

    const/16 v0, 0x17

    if-eq p1, v0, :cond_20

    .line 245
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v1, 0x50

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v0

    .line 248
    :cond_20
    const/16 v0, 0x16

    if-ne p1, v0, :cond_27

    .line 250
    invoke-virtual {p0, p2, p3, p4}, Lorg/spongycastle/crypto/tls/RecordStream;->updateHandshakeData([BII)V

    .line 253
    :cond_27
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/RecordStream;->writeCompression:Lorg/spongycastle/crypto/tls/TlsCompression;

    iget-object v1, p0, Lorg/spongycastle/crypto/tls/RecordStream;->buffer:Ljava/io/ByteArrayOutputStream;

    invoke-interface {v0, v1}, Lorg/spongycastle/crypto/tls/TlsCompression;->compress(Ljava/io/OutputStream;)Ljava/io/OutputStream;

    move-result-object v7

    .line 256
    .local v7, "cOut":Ljava/io/OutputStream;
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/RecordStream;->buffer:Ljava/io/ByteArrayOutputStream;

    if-ne v7, v0, :cond_71

    .line 258
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/RecordStream;->writeCipher:Lorg/spongycastle/crypto/tls/TlsCipher;

    iget-wide v1, p0, Lorg/spongycastle/crypto/tls/RecordStream;->writeSeqNo:J

    const-wide/16 v5, 0x1

    add-long/2addr v5, v1

    iput-wide v5, p0, Lorg/spongycastle/crypto/tls/RecordStream;->writeSeqNo:J

    move v3, p1

    move-object v4, p2

    move v5, p3

    move v6, p4

    invoke-interface/range {v0 .. v6}, Lorg/spongycastle/crypto/tls/TlsCipher;->encodePlaintext(JS[BII)[B

    move-result-object v8

    .line 278
    .local v8, "ciphertext":[B
    :goto_44
    array-length v0, v8

    iget v1, p0, Lorg/spongycastle/crypto/tls/RecordStream;->ciphertextLimit:I

    const/16 v2, 0x50

    invoke-static {v0, v1, v2}, Lorg/spongycastle/crypto/tls/RecordStream;->checkLength(IIS)V

    .line 280
    array-length v0, v8

    add-int/lit8 v0, v0, 0x5

    new-array v9, v0, [B

    .line 281
    .local v9, "record":[B
    const/4 v0, 0x0

    invoke-static {p1, v9, v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint8(S[BI)V

    .line 282
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/RecordStream;->writeVersion:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    const/4 v1, 0x1

    invoke-static {v0, v9, v1}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeVersion(Lorg/spongycastle/crypto/tls/ProtocolVersion;[BI)V

    .line 283
    array-length v0, v8

    const/4 v1, 0x3

    invoke-static {v0, v9, v1}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint16(I[BI)V

    .line 284
    const/4 v0, 0x0

    const/4 v1, 0x5

    array-length v2, v8

    invoke-static {v8, v0, v9, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 285
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/RecordStream;->output:Ljava/io/OutputStream;

    invoke-virtual {v0, v9}, Ljava/io/OutputStream;->write([B)V

    .line 286
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/RecordStream;->output:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    goto :goto_4

    .line 262
    .end local v8    # "ciphertext":[B
    .end local v9    # "record":[B
    :cond_71
    invoke-virtual {v7, p2, p3, p4}, Ljava/io/OutputStream;->write([BII)V

    .line 263
    invoke-virtual {v7}, Ljava/io/OutputStream;->flush()V

    .line 264
    invoke-direct {p0}, Lorg/spongycastle/crypto/tls/RecordStream;->getBufferContents()[B

    move-result-object v4

    .line 270
    .local v4, "compressed":[B
    array-length v0, v4

    add-int/lit16 v1, p4, 0x400

    const/16 v2, 0x50

    invoke-static {v0, v1, v2}, Lorg/spongycastle/crypto/tls/RecordStream;->checkLength(IIS)V

    .line 272
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/RecordStream;->writeCipher:Lorg/spongycastle/crypto/tls/TlsCipher;

    iget-wide v1, p0, Lorg/spongycastle/crypto/tls/RecordStream;->writeSeqNo:J

    const-wide/16 v5, 0x1

    add-long/2addr v5, v1

    iput-wide v5, p0, Lorg/spongycastle/crypto/tls/RecordStream;->writeSeqNo:J

    const/4 v5, 0x0

    array-length v6, v4

    move v3, p1

    invoke-interface/range {v0 .. v6}, Lorg/spongycastle/crypto/tls/TlsCipher;->encodePlaintext(JS[BII)[B

    move-result-object v8

    .restart local v8    # "ciphertext":[B
    goto :goto_44
.end method
