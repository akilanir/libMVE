.class public abstract Lorg/spongycastle/crypto/tls/DefaultTlsServer;
.super Lorg/spongycastle/crypto/tls/AbstractTlsServer;
.source "DefaultTlsServer.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 13
    invoke-direct {p0}, Lorg/spongycastle/crypto/tls/AbstractTlsServer;-><init>()V

    .line 14
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/tls/TlsCipherFactory;)V
    .registers 2
    .param p1, "cipherFactory"    # Lorg/spongycastle/crypto/tls/TlsCipherFactory;

    .prologue
    .line 18
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/tls/AbstractTlsServer;-><init>(Lorg/spongycastle/crypto/tls/TlsCipherFactory;)V

    .line 19
    return-void
.end method


# virtual methods
.method protected createDHEKeyExchange(I)Lorg/spongycastle/crypto/tls/TlsKeyExchange;
    .registers 5
    .param p1, "keyExchange"    # I

    .prologue
    .line 146
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsDHEKeyExchange;

    iget-object v1, p0, Lorg/spongycastle/crypto/tls/DefaultTlsServer;->supportedSignatureAlgorithms:Ljava/util/Vector;

    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/DefaultTlsServer;->getDHParameters()Lorg/spongycastle/crypto/params/DHParameters;

    move-result-object v2

    invoke-direct {v0, p1, v1, v2}, Lorg/spongycastle/crypto/tls/TlsDHEKeyExchange;-><init>(ILjava/util/Vector;Lorg/spongycastle/crypto/params/DHParameters;)V

    return-object v0
.end method

.method protected createDHKeyExchange(I)Lorg/spongycastle/crypto/tls/TlsKeyExchange;
    .registers 5
    .param p1, "keyExchange"    # I

    .prologue
    .line 141
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsDHKeyExchange;

    iget-object v1, p0, Lorg/spongycastle/crypto/tls/DefaultTlsServer;->supportedSignatureAlgorithms:Ljava/util/Vector;

    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/DefaultTlsServer;->getDHParameters()Lorg/spongycastle/crypto/params/DHParameters;

    move-result-object v2

    invoke-direct {v0, p1, v1, v2}, Lorg/spongycastle/crypto/tls/TlsDHKeyExchange;-><init>(ILjava/util/Vector;Lorg/spongycastle/crypto/params/DHParameters;)V

    return-object v0
.end method

.method protected createECDHEKeyExchange(I)Lorg/spongycastle/crypto/tls/TlsKeyExchange;
    .registers 8
    .param p1, "keyExchange"    # I

    .prologue
    .line 157
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsECDHEKeyExchange;

    iget-object v2, p0, Lorg/spongycastle/crypto/tls/DefaultTlsServer;->supportedSignatureAlgorithms:Ljava/util/Vector;

    iget-object v3, p0, Lorg/spongycastle/crypto/tls/DefaultTlsServer;->namedCurves:[I

    iget-object v4, p0, Lorg/spongycastle/crypto/tls/DefaultTlsServer;->clientECPointFormats:[S

    iget-object v5, p0, Lorg/spongycastle/crypto/tls/DefaultTlsServer;->serverECPointFormats:[S

    move v1, p1

    invoke-direct/range {v0 .. v5}, Lorg/spongycastle/crypto/tls/TlsECDHEKeyExchange;-><init>(ILjava/util/Vector;[I[S[S)V

    return-object v0
.end method

.method protected createECDHKeyExchange(I)Lorg/spongycastle/crypto/tls/TlsKeyExchange;
    .registers 8
    .param p1, "keyExchange"    # I

    .prologue
    .line 151
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsECDHKeyExchange;

    iget-object v2, p0, Lorg/spongycastle/crypto/tls/DefaultTlsServer;->supportedSignatureAlgorithms:Ljava/util/Vector;

    iget-object v3, p0, Lorg/spongycastle/crypto/tls/DefaultTlsServer;->namedCurves:[I

    iget-object v4, p0, Lorg/spongycastle/crypto/tls/DefaultTlsServer;->clientECPointFormats:[S

    iget-object v5, p0, Lorg/spongycastle/crypto/tls/DefaultTlsServer;->serverECPointFormats:[S

    move v1, p1

    invoke-direct/range {v0 .. v5}, Lorg/spongycastle/crypto/tls/TlsECDHKeyExchange;-><init>(ILjava/util/Vector;[I[S[S)V

    return-object v0
.end method

.method protected createRSAKeyExchange()Lorg/spongycastle/crypto/tls/TlsKeyExchange;
    .registers 3

    .prologue
    .line 163
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsRSAKeyExchange;

    iget-object v1, p0, Lorg/spongycastle/crypto/tls/DefaultTlsServer;->supportedSignatureAlgorithms:Ljava/util/Vector;

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/TlsRSAKeyExchange;-><init>(Ljava/util/Vector;)V

    return-object v0
.end method

.method protected getCipherSuites()[I
    .registers 2

    .prologue
    .line 52
    const/16 v0, 0x12

    new-array v0, v0, [I

    fill-array-data v0, :array_8

    return-object v0

    :array_8
    .array-data 4
        0xc030
        0xc02f
        0xc028
        0xc027
        0xc014
        0xc013
        0x9f
        0x9e
        0x6b
        0x67
        0x39
        0x33
        0x9d
        0x9c
        0x3d
        0x3c
        0x35
        0x2f
    .end array-data
.end method

.method public getCredentials()Lorg/spongycastle/crypto/tls/TlsCredentials;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 78
    iget v1, p0, Lorg/spongycastle/crypto/tls/DefaultTlsServer;->selectedCipherSuite:I

    invoke-static {v1}, Lorg/spongycastle/crypto/tls/TlsUtils;->getKeyExchangeAlgorithm(I)I

    move-result v0

    .line 80
    .local v0, "keyExchangeAlgorithm":I
    sparse-switch v0, :sswitch_data_26

    .line 99
    new-instance v1, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v2, 0x50

    invoke-direct {v1, v2}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v1

    .line 84
    :sswitch_11
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/DefaultTlsServer;->getDSASignerCredentials()Lorg/spongycastle/crypto/tls/TlsSignerCredentials;

    move-result-object v1

    .line 95
    :goto_15
    return-object v1

    .line 88
    :sswitch_16
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/DefaultTlsServer;->getECDSASignerCredentials()Lorg/spongycastle/crypto/tls/TlsSignerCredentials;

    move-result-object v1

    goto :goto_15

    .line 92
    :sswitch_1b
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/DefaultTlsServer;->getRSASignerCredentials()Lorg/spongycastle/crypto/tls/TlsSignerCredentials;

    move-result-object v1

    goto :goto_15

    .line 95
    :sswitch_20
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/DefaultTlsServer;->getRSAEncryptionCredentials()Lorg/spongycastle/crypto/tls/TlsEncryptionCredentials;

    move-result-object v1

    goto :goto_15

    .line 80
    nop

    :sswitch_data_26
    .sparse-switch
        0x1 -> :sswitch_20
        0x3 -> :sswitch_11
        0x5 -> :sswitch_1b
        0x7 -> :sswitch_11
        0x10 -> :sswitch_16
        0x11 -> :sswitch_16
        0x13 -> :sswitch_1b
    .end sparse-switch
.end method

.method protected getDHParameters()Lorg/spongycastle/crypto/params/DHParameters;
    .registers 2

    .prologue
    .line 47
    sget-object v0, Lorg/spongycastle/crypto/agreement/DHStandardGroups;->rfc5114_2048_256:Lorg/spongycastle/crypto/params/DHParameters;

    return-object v0
.end method

.method protected getDSASignerCredentials()Lorg/spongycastle/crypto/tls/TlsSignerCredentials;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 24
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v1, 0x50

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v0
.end method

.method protected getECDSASignerCredentials()Lorg/spongycastle/crypto/tls/TlsSignerCredentials;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 30
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v1, 0x50

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v0
.end method

.method public getKeyExchange()Lorg/spongycastle/crypto/tls/TlsKeyExchange;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 106
    iget v1, p0, Lorg/spongycastle/crypto/tls/DefaultTlsServer;->selectedCipherSuite:I

    invoke-static {v1}, Lorg/spongycastle/crypto/tls/TlsUtils;->getKeyExchangeAlgorithm(I)I

    move-result v0

    .line 108
    .local v0, "keyExchangeAlgorithm":I
    packed-switch v0, :pswitch_data_2a

    .line 135
    :pswitch_9
    new-instance v1, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v2, 0x50

    invoke-direct {v1, v2}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v1

    .line 112
    :pswitch_11
    invoke-virtual {p0, v0}, Lorg/spongycastle/crypto/tls/DefaultTlsServer;->createDHKeyExchange(I)Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    move-result-object v1

    .line 127
    :goto_15
    return-object v1

    .line 116
    :pswitch_16
    invoke-virtual {p0, v0}, Lorg/spongycastle/crypto/tls/DefaultTlsServer;->createDHEKeyExchange(I)Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    move-result-object v1

    goto :goto_15

    .line 120
    :pswitch_1b
    invoke-virtual {p0, v0}, Lorg/spongycastle/crypto/tls/DefaultTlsServer;->createECDHKeyExchange(I)Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    move-result-object v1

    goto :goto_15

    .line 124
    :pswitch_20
    invoke-virtual {p0, v0}, Lorg/spongycastle/crypto/tls/DefaultTlsServer;->createECDHEKeyExchange(I)Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    move-result-object v1

    goto :goto_15

    .line 127
    :pswitch_25
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/DefaultTlsServer;->createRSAKeyExchange()Lorg/spongycastle/crypto/tls/TlsKeyExchange;

    move-result-object v1

    goto :goto_15

    .line 108
    :pswitch_data_2a
    .packed-switch 0x1
        :pswitch_25
        :pswitch_9
        :pswitch_16
        :pswitch_9
        :pswitch_16
        :pswitch_9
        :pswitch_11
        :pswitch_9
        :pswitch_11
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_1b
        :pswitch_20
        :pswitch_1b
        :pswitch_20
    .end packed-switch
.end method

.method protected getRSAEncryptionCredentials()Lorg/spongycastle/crypto/tls/TlsEncryptionCredentials;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 36
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v1, 0x50

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v0
.end method

.method protected getRSASignerCredentials()Lorg/spongycastle/crypto/tls/TlsSignerCredentials;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 42
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v1, 0x50

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v0
.end method
