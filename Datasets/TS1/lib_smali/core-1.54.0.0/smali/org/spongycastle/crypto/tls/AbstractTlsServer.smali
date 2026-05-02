.class public abstract Lorg/spongycastle/crypto/tls/AbstractTlsServer;
.super Lorg/spongycastle/crypto/tls/AbstractTlsPeer;
.source "AbstractTlsServer.java"

# interfaces
.implements Lorg/spongycastle/crypto/tls/TlsServer;


# instance fields
.field protected cipherFactory:Lorg/spongycastle/crypto/tls/TlsCipherFactory;

.field protected clientECPointFormats:[S

.field protected clientExtensions:Ljava/util/Hashtable;

.field protected clientVersion:Lorg/spongycastle/crypto/tls/ProtocolVersion;

.field protected context:Lorg/spongycastle/crypto/tls/TlsServerContext;

.field protected eccCipherSuitesOffered:Z

.field protected encryptThenMACOffered:Z

.field protected maxFragmentLengthOffered:S

.field protected namedCurves:[I

.field protected offeredCipherSuites:[I

.field protected offeredCompressionMethods:[S

.field protected selectedCipherSuite:I

.field protected selectedCompressionMethod:S

.field protected serverECPointFormats:[S

.field protected serverExtensions:Ljava/util/Hashtable;

.field protected serverVersion:Lorg/spongycastle/crypto/tls/ProtocolVersion;

.field protected supportedSignatureAlgorithms:Ljava/util/Vector;

.field protected truncatedHMacOffered:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 37
    new-instance v0, Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;

    invoke-direct {v0}, Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;-><init>()V

    invoke-direct {p0, v0}, Lorg/spongycastle/crypto/tls/AbstractTlsServer;-><init>(Lorg/spongycastle/crypto/tls/TlsCipherFactory;)V

    .line 38
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/tls/TlsCipherFactory;)V
    .registers 2
    .param p1, "cipherFactory"    # Lorg/spongycastle/crypto/tls/TlsCipherFactory;

    .prologue
    .line 41
    invoke-direct {p0}, Lorg/spongycastle/crypto/tls/AbstractTlsPeer;-><init>()V

    .line 42
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->cipherFactory:Lorg/spongycastle/crypto/tls/TlsCipherFactory;

    .line 43
    return-void
.end method


# virtual methods
.method protected allowEncryptThenMAC()Z
    .registers 2

    .prologue
    .line 47
    const/4 v0, 0x1

    return v0
.end method

.method protected allowTruncatedHMac()Z
    .registers 2

    .prologue
    .line 52
    const/4 v0, 0x0

    return v0
.end method

.method protected checkServerExtensions()Ljava/util/Hashtable;
    .registers 2

    .prologue
    .line 57
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->serverExtensions:Ljava/util/Hashtable;

    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->ensureExtensionsInitialised(Ljava/util/Hashtable;)Ljava/util/Hashtable;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->serverExtensions:Ljava/util/Hashtable;

    return-object v0
.end method

.method public getCertificateRequest()Lorg/spongycastle/crypto/tls/CertificateRequest;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 315
    const/4 v0, 0x0

    return-object v0
.end method

.method public getCertificateStatus()Lorg/spongycastle/crypto/tls/CertificateStatus;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 309
    const/4 v0, 0x0

    return-object v0
.end method

.method public getCipher()Lorg/spongycastle/crypto/tls/TlsCipher;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 353
    iget v2, p0, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->selectedCipherSuite:I

    invoke-static {v2}, Lorg/spongycastle/crypto/tls/TlsUtils;->getEncryptionAlgorithm(I)I

    move-result v0

    .line 354
    .local v0, "encryptionAlgorithm":I
    iget v2, p0, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->selectedCipherSuite:I

    invoke-static {v2}, Lorg/spongycastle/crypto/tls/TlsUtils;->getMACAlgorithm(I)I

    move-result v1

    .line 356
    .local v1, "macAlgorithm":I
    iget-object v2, p0, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->cipherFactory:Lorg/spongycastle/crypto/tls/TlsCipherFactory;

    iget-object v3, p0, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->context:Lorg/spongycastle/crypto/tls/TlsServerContext;

    invoke-interface {v2, v3, v0, v1}, Lorg/spongycastle/crypto/tls/TlsCipherFactory;->createCipher(Lorg/spongycastle/crypto/tls/TlsContext;II)Lorg/spongycastle/crypto/tls/TlsCipher;

    move-result-object v2

    return-object v2
.end method

.method protected abstract getCipherSuites()[I
.end method

.method public getCompression()Lorg/spongycastle/crypto/tls/TlsCompression;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 336
    iget-short v0, p0, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->selectedCompressionMethod:S

    packed-switch v0, :pswitch_data_14

    .line 346
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v1, 0x50

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v0

    .line 339
    :pswitch_d
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsNullCompression;

    invoke-direct {v0}, Lorg/spongycastle/crypto/tls/TlsNullCompression;-><init>()V

    return-object v0

    .line 336
    nop

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method

.method protected getCompressionMethods()[S
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 64
    const/4 v0, 0x1

    new-array v0, v0, [S

    aput-short v1, v0, v1

    return-object v0
.end method

.method protected getMaximumVersion()Lorg/spongycastle/crypto/tls/ProtocolVersion;
    .registers 2

    .prologue
    .line 69
    sget-object v0, Lorg/spongycastle/crypto/tls/ProtocolVersion;->TLSv11:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    return-object v0
.end method

.method protected getMinimumVersion()Lorg/spongycastle/crypto/tls/ProtocolVersion;
    .registers 2

    .prologue
    .line 74
    sget-object v0, Lorg/spongycastle/crypto/tls/ProtocolVersion;->TLSv10:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    return-object v0
.end method

.method public getNewSessionTicket()Lorg/spongycastle/crypto/tls/NewSessionTicket;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 367
    new-instance v0, Lorg/spongycastle/crypto/tls/NewSessionTicket;

    const-wide/16 v1, 0x0

    sget-object v3, Lorg/spongycastle/crypto/tls/TlsUtils;->EMPTY_BYTES:[B

    invoke-direct {v0, v1, v2, v3}, Lorg/spongycastle/crypto/tls/NewSessionTicket;-><init>(J[B)V

    return-object v0
.end method

.method public getSelectedCipherSuite()I
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 225
    iget-object v4, p0, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->namedCurves:[I

    iget-object v5, p0, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->clientECPointFormats:[S

    invoke-virtual {p0, v4, v5}, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->supportsClientECCCapabilities([I[S)Z

    move-result v2

    .line 227
    .local v2, "eccCipherSuitesEnabled":Z
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->getCipherSuites()[I

    move-result-object v1

    .line 228
    .local v1, "cipherSuites":[I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_d
    array-length v4, v1

    if-ge v3, v4, :cond_30

    .line 230
    aget v0, v1, v3

    .line 232
    .local v0, "cipherSuite":I
    iget-object v4, p0, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->offeredCipherSuites:[I

    invoke-static {v4, v0}, Lorg/spongycastle/util/Arrays;->contains([II)Z

    move-result v4

    if-eqz v4, :cond_2d

    if-nez v2, :cond_22

    .line 233
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->isECCCipherSuite(I)Z

    move-result v4

    if-nez v4, :cond_2d

    :cond_22
    iget-object v4, p0, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->serverVersion:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    .line 234
    invoke-static {v0, v4}, Lorg/spongycastle/crypto/tls/TlsUtils;->isValidCipherSuiteForVersion(ILorg/spongycastle/crypto/tls/ProtocolVersion;)Z

    move-result v4

    if-eqz v4, :cond_2d

    .line 236
    iput v0, p0, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->selectedCipherSuite:I

    return v0

    .line 228
    :cond_2d
    add-int/lit8 v3, v3, 0x1

    goto :goto_d

    .line 239
    .end local v0    # "cipherSuite":I
    :cond_30
    new-instance v4, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v5, 0x28

    invoke-direct {v4, v5}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v4
.end method

.method public getSelectedCompressionMethod()S
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 245
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->getCompressionMethods()[S

    move-result-object v0

    .line 246
    .local v0, "compressionMethods":[S
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_5
    array-length v2, v0

    if-ge v1, v2, :cond_1a

    .line 248
    iget-object v2, p0, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->offeredCompressionMethods:[S

    aget-short v3, v0, v1

    invoke-static {v2, v3}, Lorg/spongycastle/util/Arrays;->contains([SS)Z

    move-result v2

    if-eqz v2, :cond_17

    .line 250
    aget-short v2, v0, v1

    iput-short v2, p0, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->selectedCompressionMethod:S

    return v2

    .line 246
    :cond_17
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 253
    :cond_1a
    new-instance v2, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v3, 0x28

    invoke-direct {v2, v3}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v2
.end method

.method public getServerExtensions()Ljava/util/Hashtable;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 260
    iget-boolean v0, p0, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->encryptThenMACOffered:Z

    if-eqz v0, :cond_19

    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->allowEncryptThenMAC()Z

    move-result v0

    if-eqz v0, :cond_19

    .line 268
    iget v0, p0, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->selectedCipherSuite:I

    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->isBlockCipherSuite(I)Z

    move-result v0

    if-eqz v0, :cond_19

    .line 270
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->checkServerExtensions()Ljava/util/Hashtable;

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->addEncryptThenMACExtension(Ljava/util/Hashtable;)V

    .line 274
    :cond_19
    iget-short v0, p0, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->maxFragmentLengthOffered:S

    if-ltz v0, :cond_2e

    iget-short v0, p0, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->maxFragmentLengthOffered:S

    invoke-static {v0}, Lorg/spongycastle/crypto/tls/MaxFragmentLength;->isValid(S)Z

    move-result v0

    if-eqz v0, :cond_2e

    .line 276
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->checkServerExtensions()Ljava/util/Hashtable;

    move-result-object v0

    iget-short v1, p0, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->maxFragmentLengthOffered:S

    invoke-static {v0, v1}, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->addMaxFragmentLengthExtension(Ljava/util/Hashtable;S)V

    .line 279
    :cond_2e
    iget-boolean v0, p0, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->truncatedHMacOffered:Z

    if-eqz v0, :cond_3f

    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->allowTruncatedHMac()Z

    move-result v0

    if-eqz v0, :cond_3f

    .line 281
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->checkServerExtensions()Ljava/util/Hashtable;

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->addTruncatedHMacExtension(Ljava/util/Hashtable;)V

    .line 284
    :cond_3f
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->clientECPointFormats:[S

    if-eqz v0, :cond_5c

    iget v0, p0, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->selectedCipherSuite:I

    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->isECCCipherSuite(I)Z

    move-result v0

    if-eqz v0, :cond_5c

    .line 291
    const/4 v0, 0x3

    new-array v0, v0, [S

    fill-array-data v0, :array_60

    iput-object v0, p0, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->serverECPointFormats:[S

    .line 294
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->checkServerExtensions()Ljava/util/Hashtable;

    move-result-object v0

    iget-object v1, p0, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->serverECPointFormats:[S

    invoke-static {v0, v1}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->addSupportedPointFormatsExtension(Ljava/util/Hashtable;[S)V

    .line 297
    :cond_5c
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->serverExtensions:Ljava/util/Hashtable;

    return-object v0

    .line 291
    nop

    :array_60
    .array-data 2
        0x0s
        0x1s
        0x2s
    .end array-data
.end method

.method public getServerSupplementalData()Ljava/util/Vector;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 303
    const/4 v0, 0x0

    return-object v0
.end method

.method public getServerVersion()Lorg/spongycastle/crypto/tls/ProtocolVersion;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 193
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->getMinimumVersion()Lorg/spongycastle/crypto/tls/ProtocolVersion;

    move-result-object v1

    iget-object v2, p0, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->clientVersion:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    invoke-virtual {v1, v2}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->isEqualOrEarlierVersionOf(Lorg/spongycastle/crypto/tls/ProtocolVersion;)Z

    move-result v1

    if-eqz v1, :cond_28

    .line 195
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->getMaximumVersion()Lorg/spongycastle/crypto/tls/ProtocolVersion;

    move-result-object v0

    .line 196
    .local v0, "maximumVersion":Lorg/spongycastle/crypto/tls/ProtocolVersion;
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->clientVersion:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    invoke-virtual {v1, v0}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->isEqualOrEarlierVersionOf(Lorg/spongycastle/crypto/tls/ProtocolVersion;)Z

    move-result v1

    if-eqz v1, :cond_1d

    .line 198
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->clientVersion:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    .end local v0    # "maximumVersion":Lorg/spongycastle/crypto/tls/ProtocolVersion;
    iput-object v0, p0, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->serverVersion:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    .line 202
    :goto_1c
    return-object v0

    .line 200
    .restart local v0    # "maximumVersion":Lorg/spongycastle/crypto/tls/ProtocolVersion;
    :cond_1d
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->clientVersion:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    invoke-virtual {v1, v0}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->isLaterVersionOf(Lorg/spongycastle/crypto/tls/ProtocolVersion;)Z

    move-result v1

    if-eqz v1, :cond_28

    .line 202
    iput-object v0, p0, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->serverVersion:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    goto :goto_1c

    .line 205
    .end local v0    # "maximumVersion":Lorg/spongycastle/crypto/tls/ProtocolVersion;
    :cond_28
    new-instance v1, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v2, 0x46

    invoke-direct {v1, v2}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v1
.end method

.method public init(Lorg/spongycastle/crypto/tls/TlsServerContext;)V
    .registers 2
    .param p1, "context"    # Lorg/spongycastle/crypto/tls/TlsServerContext;

    .prologue
    .line 106
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->context:Lorg/spongycastle/crypto/tls/TlsServerContext;

    .line 107
    return-void
.end method

.method public notifyClientCertificate(Lorg/spongycastle/crypto/tls/Certificate;)V
    .registers 4
    .param p1, "clientCertificate"    # Lorg/spongycastle/crypto/tls/Certificate;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 330
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v1, 0x50

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v0
.end method

.method public notifyClientVersion(Lorg/spongycastle/crypto/tls/ProtocolVersion;)V
    .registers 2
    .param p1, "clientVersion"    # Lorg/spongycastle/crypto/tls/ProtocolVersion;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 112
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->clientVersion:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    .line 113
    return-void
.end method

.method public notifyFallback(Z)V
    .registers 4
    .param p1, "isFallback"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 123
    if-eqz p1, :cond_16

    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->getMaximumVersion()Lorg/spongycastle/crypto/tls/ProtocolVersion;

    move-result-object v0

    iget-object v1, p0, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->clientVersion:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    invoke-virtual {v0, v1}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->isLaterVersionOf(Lorg/spongycastle/crypto/tls/ProtocolVersion;)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 125
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v1, 0x56

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v0

    .line 127
    :cond_16
    return-void
.end method

.method public notifyOfferedCipherSuites([I)V
    .registers 3
    .param p1, "offeredCipherSuites"    # [I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 132
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->offeredCipherSuites:[I

    .line 133
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->offeredCipherSuites:[I

    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->containsECCCipherSuites([I)Z

    move-result v0

    iput-boolean v0, p0, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->eccCipherSuitesOffered:Z

    .line 134
    return-void
.end method

.method public notifyOfferedCompressionMethods([S)V
    .registers 2
    .param p1, "offeredCompressionMethods"    # [S
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 139
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->offeredCompressionMethods:[S

    .line 140
    return-void
.end method

.method public processClientExtensions(Ljava/util/Hashtable;)V
    .registers 4
    .param p1, "clientExtensions"    # Ljava/util/Hashtable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v1, 0x2f

    .line 145
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->clientExtensions:Ljava/util/Hashtable;

    .line 147
    if-eqz p1, :cond_4e

    .line 149
    invoke-static {p1}, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->hasEncryptThenMACExtension(Ljava/util/Hashtable;)Z

    move-result v0

    iput-boolean v0, p0, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->encryptThenMACOffered:Z

    .line 151
    invoke-static {p1}, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->getMaxFragmentLengthExtension(Ljava/util/Hashtable;)S

    move-result v0

    iput-short v0, p0, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->maxFragmentLengthOffered:S

    .line 152
    iget-short v0, p0, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->maxFragmentLengthOffered:S

    if-ltz v0, :cond_24

    iget-short v0, p0, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->maxFragmentLengthOffered:S

    invoke-static {v0}, Lorg/spongycastle/crypto/tls/MaxFragmentLength;->isValid(S)Z

    move-result v0

    if-nez v0, :cond_24

    .line 154
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v0

    .line 157
    :cond_24
    invoke-static {p1}, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->hasTruncatedHMacExtension(Ljava/util/Hashtable;)Z

    move-result v0

    iput-boolean v0, p0, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->truncatedHMacOffered:Z

    .line 159
    invoke-static {p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->getSignatureAlgorithmsExtension(Ljava/util/Hashtable;)Ljava/util/Vector;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->supportedSignatureAlgorithms:Ljava/util/Vector;

    .line 160
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->supportedSignatureAlgorithms:Ljava/util/Vector;

    if-eqz v0, :cond_42

    .line 166
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->clientVersion:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->isSignatureAlgorithmsExtensionAllowed(Lorg/spongycastle/crypto/tls/ProtocolVersion;)Z

    move-result v0

    if-nez v0, :cond_42

    .line 168
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v0

    .line 172
    :cond_42
    invoke-static {p1}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->getSupportedEllipticCurvesExtension(Ljava/util/Hashtable;)[I

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->namedCurves:[I

    .line 173
    invoke-static {p1}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->getSupportedPointFormatsExtension(Ljava/util/Hashtable;)[S

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/crypto/tls/AbstractTlsServer;->clientECPointFormats:[S

    .line 188
    :cond_4e
    return-void
.end method

.method public processClientSupplementalData(Ljava/util/Vector;)V
    .registers 4
    .param p1, "clientSupplementalData"    # Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 321
    if-eqz p1, :cond_a

    .line 323
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v0

    .line 325
    :cond_a
    return-void
.end method

.method protected supportsClientECCCapabilities([I[S)Z
    .registers 6
    .param p1, "namedCurves"    # [I
    .param p2, "ecPointFormats"    # [S

    .prologue
    .line 81
    if-nez p1, :cond_7

    .line 88
    invoke-static {}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->hasAnySupportedNamedCurves()Z

    move-result v2

    .line 101
    :goto_6
    return v2

    .line 91
    :cond_7
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_8
    array-length v2, p1

    if-ge v0, v2, :cond_24

    .line 93
    aget v1, p1, v0

    .line 94
    .local v1, "namedCurve":I
    invoke-static {v1}, Lorg/spongycastle/crypto/tls/NamedCurve;->isValid(I)Z

    move-result v2

    if-eqz v2, :cond_21

    .line 95
    invoke-static {v1}, Lorg/spongycastle/crypto/tls/NamedCurve;->refersToASpecificNamedCurve(I)Z

    move-result v2

    if-eqz v2, :cond_1f

    invoke-static {v1}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->isSupportedNamedCurve(I)Z

    move-result v2

    if-eqz v2, :cond_21

    .line 97
    :cond_1f
    const/4 v2, 0x1

    goto :goto_6

    .line 91
    :cond_21
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    .line 101
    .end local v1    # "namedCurve":I
    :cond_24
    const/4 v2, 0x0

    goto :goto_6
.end method
