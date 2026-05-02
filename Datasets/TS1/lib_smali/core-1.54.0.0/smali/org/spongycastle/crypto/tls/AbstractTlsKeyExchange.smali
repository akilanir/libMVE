.class public abstract Lorg/spongycastle/crypto/tls/AbstractTlsKeyExchange;
.super Ljava/lang/Object;
.source "AbstractTlsKeyExchange.java"

# interfaces
.implements Lorg/spongycastle/crypto/tls/TlsKeyExchange;


# instance fields
.field protected context:Lorg/spongycastle/crypto/tls/TlsContext;

.field protected keyExchange:I

.field protected supportedSignatureAlgorithms:Ljava/util/Vector;


# direct methods
.method protected constructor <init>(ILjava/util/Vector;)V
    .registers 3
    .param p1, "keyExchange"    # I
    .param p2, "supportedSignatureAlgorithms"    # Ljava/util/Vector;

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput p1, p0, Lorg/spongycastle/crypto/tls/AbstractTlsKeyExchange;->keyExchange:I

    .line 18
    iput-object p2, p0, Lorg/spongycastle/crypto/tls/AbstractTlsKeyExchange;->supportedSignatureAlgorithms:Ljava/util/Vector;

    .line 19
    return-void
.end method


# virtual methods
.method public generateServerKeyExchange()[B
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 135
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/AbstractTlsKeyExchange;->requiresServerKeyExchange()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 137
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v1, 0x50

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v0

    .line 139
    :cond_e
    const/4 v0, 0x0

    return-object v0
.end method

.method public init(Lorg/spongycastle/crypto/tls/TlsContext;)V
    .registers 6
    .param p1, "context"    # Lorg/spongycastle/crypto/tls/TlsContext;

    .prologue
    .line 34
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/AbstractTlsKeyExchange;->context:Lorg/spongycastle/crypto/tls/TlsContext;

    .line 36
    invoke-interface {p1}, Lorg/spongycastle/crypto/tls/TlsContext;->getClientVersion()Lorg/spongycastle/crypto/tls/ProtocolVersion;

    move-result-object v0

    .line 38
    .local v0, "clientVersion":Lorg/spongycastle/crypto/tls/ProtocolVersion;
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->isSignatureAlgorithmsExtensionAllowed(Lorg/spongycastle/crypto/tls/ProtocolVersion;)Z

    move-result v1

    if-eqz v1, :cond_32

    .line 53
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/AbstractTlsKeyExchange;->supportedSignatureAlgorithms:Ljava/util/Vector;

    if-nez v1, :cond_23

    .line 55
    iget v1, p0, Lorg/spongycastle/crypto/tls/AbstractTlsKeyExchange;->keyExchange:I

    packed-switch v1, :pswitch_data_50

    .line 91
    :pswitch_15
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "unsupported key exchange algorithm"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 61
    :pswitch_1d
    invoke-static {}, Lorg/spongycastle/crypto/tls/TlsUtils;->getDefaultDSSSignatureAlgorithms()Ljava/util/Vector;

    move-result-object v1

    iput-object v1, p0, Lorg/spongycastle/crypto/tls/AbstractTlsKeyExchange;->supportedSignatureAlgorithms:Ljava/util/Vector;

    .line 99
    :cond_23
    :goto_23
    :pswitch_23
    return-void

    .line 68
    :pswitch_24
    invoke-static {}, Lorg/spongycastle/crypto/tls/TlsUtils;->getDefaultECDSASignatureAlgorithms()Ljava/util/Vector;

    move-result-object v1

    iput-object v1, p0, Lorg/spongycastle/crypto/tls/AbstractTlsKeyExchange;->supportedSignatureAlgorithms:Ljava/util/Vector;

    goto :goto_23

    .line 80
    :pswitch_2b
    invoke-static {}, Lorg/spongycastle/crypto/tls/TlsUtils;->getDefaultRSASignatureAlgorithms()Ljava/util/Vector;

    move-result-object v1

    iput-object v1, p0, Lorg/spongycastle/crypto/tls/AbstractTlsKeyExchange;->supportedSignatureAlgorithms:Ljava/util/Vector;

    goto :goto_23

    .line 95
    :cond_32
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/AbstractTlsKeyExchange;->supportedSignatureAlgorithms:Ljava/util/Vector;

    if-eqz v1, :cond_23

    .line 97
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "supported_signature_algorithms not allowed for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 55
    nop

    :pswitch_data_50
    .packed-switch 0x1
        :pswitch_2b
        :pswitch_15
        :pswitch_1d
        :pswitch_15
        :pswitch_2b
        :pswitch_15
        :pswitch_1d
        :pswitch_15
        :pswitch_2b
        :pswitch_15
        :pswitch_15
        :pswitch_15
        :pswitch_23
        :pswitch_23
        :pswitch_2b
        :pswitch_24
        :pswitch_24
        :pswitch_2b
        :pswitch_2b
        :pswitch_15
        :pswitch_23
        :pswitch_1d
        :pswitch_2b
        :pswitch_23
    .end packed-switch
.end method

.method protected parseSignature(Ljava/io/InputStream;)Lorg/spongycastle/crypto/tls/DigitallySigned;
    .registers 5
    .param p1, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 23
    iget-object v2, p0, Lorg/spongycastle/crypto/tls/AbstractTlsKeyExchange;->context:Lorg/spongycastle/crypto/tls/TlsContext;

    invoke-static {v2, p1}, Lorg/spongycastle/crypto/tls/DigitallySigned;->parse(Lorg/spongycastle/crypto/tls/TlsContext;Ljava/io/InputStream;)Lorg/spongycastle/crypto/tls/DigitallySigned;

    move-result-object v0

    .line 24
    .local v0, "signature":Lorg/spongycastle/crypto/tls/DigitallySigned;
    invoke-virtual {v0}, Lorg/spongycastle/crypto/tls/DigitallySigned;->getAlgorithm()Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;

    move-result-object v1

    .line 25
    .local v1, "signatureAlgorithm":Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;
    if-eqz v1, :cond_11

    .line 27
    iget-object v2, p0, Lorg/spongycastle/crypto/tls/AbstractTlsKeyExchange;->supportedSignatureAlgorithms:Ljava/util/Vector;

    invoke-static {v2, v1}, Lorg/spongycastle/crypto/tls/TlsUtils;->verifySupportedSignatureAlgorithm(Ljava/util/Vector;Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;)V

    .line 29
    :cond_11
    return-object v0
.end method

.method public processClientCertificate(Lorg/spongycastle/crypto/tls/Certificate;)V
    .registers 2
    .param p1, "clientCertificate"    # Lorg/spongycastle/crypto/tls/Certificate;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 168
    return-void
.end method

.method public processClientKeyExchange(Ljava/io/InputStream;)V
    .registers 4
    .param p1, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 174
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v1, 0x50

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v0
.end method

.method public processServerCertificate(Lorg/spongycastle/crypto/tls/Certificate;)V
    .registers 3
    .param p1, "serverCertificate"    # Lorg/spongycastle/crypto/tls/Certificate;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 104
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/AbstractTlsKeyExchange;->supportedSignatureAlgorithms:Ljava/util/Vector;

    if-nez v0, :cond_4

    .line 119
    :cond_4
    return-void
.end method

.method public processServerCredentials(Lorg/spongycastle/crypto/tls/TlsCredentials;)V
    .registers 3
    .param p1, "serverCredentials"    # Lorg/spongycastle/crypto/tls/TlsCredentials;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 124
    invoke-interface {p1}, Lorg/spongycastle/crypto/tls/TlsCredentials;->getCertificate()Lorg/spongycastle/crypto/tls/Certificate;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/spongycastle/crypto/tls/AbstractTlsKeyExchange;->processServerCertificate(Lorg/spongycastle/crypto/tls/Certificate;)V

    .line 125
    return-void
.end method

.method public processServerKeyExchange(Ljava/io/InputStream;)V
    .registers 4
    .param p1, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 154
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/AbstractTlsKeyExchange;->requiresServerKeyExchange()Z

    move-result v0

    if-nez v0, :cond_e

    .line 156
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v0

    .line 158
    :cond_e
    return-void
.end method

.method public requiresServerKeyExchange()Z
    .registers 2

    .prologue
    .line 129
    const/4 v0, 0x0

    return v0
.end method

.method public skipClientCredentials()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 163
    return-void
.end method

.method public skipServerKeyExchange()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 145
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/AbstractTlsKeyExchange;->requiresServerKeyExchange()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 147
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v0

    .line 149
    :cond_e
    return-void
.end method
