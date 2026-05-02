.class public Lorg/spongycastle/crypto/tls/TlsRSAKeyExchange;
.super Lorg/spongycastle/crypto/tls/AbstractTlsKeyExchange;
.source "TlsRSAKeyExchange.java"


# instance fields
.field protected premasterSecret:[B

.field protected rsaServerPublicKey:Lorg/spongycastle/crypto/params/RSAKeyParameters;

.field protected serverCredentials:Lorg/spongycastle/crypto/tls/TlsEncryptionCredentials;

.field protected serverPublicKey:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;


# direct methods
.method public constructor <init>(Ljava/util/Vector;)V
    .registers 4
    .param p1, "supportedSignatureAlgorithms"    # Ljava/util/Vector;

    .prologue
    const/4 v1, 0x0

    .line 31
    const/4 v0, 0x1

    invoke-direct {p0, v0, p1}, Lorg/spongycastle/crypto/tls/AbstractTlsKeyExchange;-><init>(ILjava/util/Vector;)V

    .line 21
    iput-object v1, p0, Lorg/spongycastle/crypto/tls/TlsRSAKeyExchange;->serverPublicKey:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    .line 23
    iput-object v1, p0, Lorg/spongycastle/crypto/tls/TlsRSAKeyExchange;->rsaServerPublicKey:Lorg/spongycastle/crypto/params/RSAKeyParameters;

    .line 25
    iput-object v1, p0, Lorg/spongycastle/crypto/tls/TlsRSAKeyExchange;->serverCredentials:Lorg/spongycastle/crypto/tls/TlsEncryptionCredentials;

    .line 32
    return-void
.end method


# virtual methods
.method public generateClientKeyExchange(Ljava/io/OutputStream;)V
    .registers 4
    .param p1, "output"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 116
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsRSAKeyExchange;->context:Lorg/spongycastle/crypto/tls/TlsContext;

    iget-object v1, p0, Lorg/spongycastle/crypto/tls/TlsRSAKeyExchange;->rsaServerPublicKey:Lorg/spongycastle/crypto/params/RSAKeyParameters;

    invoke-static {v0, v1, p1}, Lorg/spongycastle/crypto/tls/TlsRSAUtils;->generateEncryptedPreMasterSecret(Lorg/spongycastle/crypto/tls/TlsContext;Lorg/spongycastle/crypto/params/RSAKeyParameters;Ljava/io/OutputStream;)[B

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/crypto/tls/TlsRSAKeyExchange;->premasterSecret:[B

    .line 117
    return-void
.end method

.method public generatePremasterSecret()[B
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 139
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/TlsRSAKeyExchange;->premasterSecret:[B

    if-nez v1, :cond_c

    .line 141
    new-instance v1, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v2, 0x50

    invoke-direct {v1, v2}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v1

    .line 144
    :cond_c
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsRSAKeyExchange;->premasterSecret:[B

    .line 145
    .local v0, "tmp":[B
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/spongycastle/crypto/tls/TlsRSAKeyExchange;->premasterSecret:[B

    .line 146
    return-object v0
.end method

.method public processClientCredentials(Lorg/spongycastle/crypto/tls/TlsCredentials;)V
    .registers 4
    .param p1, "clientCredentials"    # Lorg/spongycastle/crypto/tls/TlsCredentials;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 107
    instance-of v0, p1, Lorg/spongycastle/crypto/tls/TlsSignerCredentials;

    if-nez v0, :cond_c

    .line 109
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v1, 0x50

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v0

    .line 111
    :cond_c
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
    .line 123
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/TlsRSAKeyExchange;->context:Lorg/spongycastle/crypto/tls/TlsContext;

    invoke-static {v1}, Lorg/spongycastle/crypto/tls/TlsUtils;->isSSL(Lorg/spongycastle/crypto/tls/TlsContext;)Z

    move-result v1

    if-eqz v1, :cond_15

    .line 126
    invoke-static {p1}, Lorg/spongycastle/util/io/Streams;->readAll(Ljava/io/InputStream;)[B

    move-result-object v0

    .line 133
    .local v0, "encryptedPreMasterSecret":[B
    :goto_c
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/TlsRSAKeyExchange;->serverCredentials:Lorg/spongycastle/crypto/tls/TlsEncryptionCredentials;

    invoke-interface {v1, v0}, Lorg/spongycastle/crypto/tls/TlsEncryptionCredentials;->decryptPreMasterSecret([B)[B

    move-result-object v1

    iput-object v1, p0, Lorg/spongycastle/crypto/tls/TlsRSAKeyExchange;->premasterSecret:[B

    .line 134
    return-void

    .line 130
    .end local v0    # "encryptedPreMasterSecret":[B
    :cond_15
    invoke-static {p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->readOpaque16(Ljava/io/InputStream;)[B

    move-result-object v0

    .restart local v0    # "encryptedPreMasterSecret":[B
    goto :goto_c
.end method

.method public processServerCertificate(Lorg/spongycastle/crypto/tls/Certificate;)V
    .registers 7
    .param p1, "serverCertificate"    # Lorg/spongycastle/crypto/tls/Certificate;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 56
    invoke-virtual {p1}, Lorg/spongycastle/crypto/tls/Certificate;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_e

    .line 58
    new-instance v3, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v4, 0x2a

    invoke-direct {v3, v4}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v3

    .line 61
    :cond_e
    const/4 v3, 0x0

    invoke-virtual {p1, v3}, Lorg/spongycastle/crypto/tls/Certificate;->getCertificateAt(I)Lorg/spongycastle/asn1/x509/Certificate;

    move-result-object v2

    .line 63
    .local v2, "x509Cert":Lorg/spongycastle/asn1/x509/Certificate;
    invoke-virtual {v2}, Lorg/spongycastle/asn1/x509/Certificate;->getSubjectPublicKeyInfo()Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;

    move-result-object v1

    .line 66
    .local v1, "keyInfo":Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;
    :try_start_17
    invoke-static {v1}, Lorg/spongycastle/crypto/util/PublicKeyFactory;->createKey(Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;)Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    move-result-object v3

    iput-object v3, p0, Lorg/spongycastle/crypto/tls/TlsRSAKeyExchange;->serverPublicKey:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;
    :try_end_1d
    .catch Ljava/lang/RuntimeException; {:try_start_17 .. :try_end_1d} :catch_2d

    .line 74
    iget-object v3, p0, Lorg/spongycastle/crypto/tls/TlsRSAKeyExchange;->serverPublicKey:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    invoke-virtual {v3}, Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;->isPrivate()Z

    move-result v3

    if-eqz v3, :cond_36

    .line 76
    new-instance v3, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v4, 0x50

    invoke-direct {v3, v4}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v3

    .line 68
    :catch_2d
    move-exception v0

    .line 70
    .local v0, "e":Ljava/lang/RuntimeException;
    new-instance v3, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v4, 0x2b

    invoke-direct {v3, v4, v0}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(SLjava/lang/Throwable;)V

    throw v3

    .line 79
    .end local v0    # "e":Ljava/lang/RuntimeException;
    :cond_36
    iget-object v3, p0, Lorg/spongycastle/crypto/tls/TlsRSAKeyExchange;->serverPublicKey:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    check-cast v3, Lorg/spongycastle/crypto/params/RSAKeyParameters;

    invoke-virtual {p0, v3}, Lorg/spongycastle/crypto/tls/TlsRSAKeyExchange;->validateRSAPublicKey(Lorg/spongycastle/crypto/params/RSAKeyParameters;)Lorg/spongycastle/crypto/params/RSAKeyParameters;

    move-result-object v3

    iput-object v3, p0, Lorg/spongycastle/crypto/tls/TlsRSAKeyExchange;->rsaServerPublicKey:Lorg/spongycastle/crypto/params/RSAKeyParameters;

    .line 81
    const/16 v3, 0x20

    invoke-static {v2, v3}, Lorg/spongycastle/crypto/tls/TlsUtils;->validateKeyUsage(Lorg/spongycastle/asn1/x509/Certificate;I)V

    .line 83
    invoke-super {p0, p1}, Lorg/spongycastle/crypto/tls/AbstractTlsKeyExchange;->processServerCertificate(Lorg/spongycastle/crypto/tls/Certificate;)V

    .line 84
    return-void
.end method

.method public processServerCredentials(Lorg/spongycastle/crypto/tls/TlsCredentials;)V
    .registers 4
    .param p1, "serverCredentials"    # Lorg/spongycastle/crypto/tls/TlsCredentials;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 43
    instance-of v0, p1, Lorg/spongycastle/crypto/tls/TlsEncryptionCredentials;

    if-nez v0, :cond_c

    .line 45
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v1, 0x50

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v0

    .line 48
    :cond_c
    invoke-interface {p1}, Lorg/spongycastle/crypto/tls/TlsCredentials;->getCertificate()Lorg/spongycastle/crypto/tls/Certificate;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/spongycastle/crypto/tls/TlsRSAKeyExchange;->processServerCertificate(Lorg/spongycastle/crypto/tls/Certificate;)V

    .line 50
    check-cast p1, Lorg/spongycastle/crypto/tls/TlsEncryptionCredentials;

    .end local p1    # "serverCredentials":Lorg/spongycastle/crypto/tls/TlsCredentials;
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/TlsRSAKeyExchange;->serverCredentials:Lorg/spongycastle/crypto/tls/TlsEncryptionCredentials;

    .line 51
    return-void
.end method

.method public skipServerCredentials()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 37
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v0
.end method

.method public validateCertificateRequest(Lorg/spongycastle/crypto/tls/CertificateRequest;)V
    .registers 6
    .param p1, "certificateRequest"    # Lorg/spongycastle/crypto/tls/CertificateRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 89
    invoke-virtual {p1}, Lorg/spongycastle/crypto/tls/CertificateRequest;->getCertificateTypes()[S

    move-result-object v1

    .line 90
    .local v1, "types":[S
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_5
    array-length v2, v1

    if-ge v0, v2, :cond_18

    .line 92
    aget-short v2, v1, v0

    sparse-switch v2, :sswitch_data_1a

    .line 99
    new-instance v2, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v3, 0x2f

    invoke-direct {v2, v3}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v2

    .line 90
    :sswitch_15
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 102
    :cond_18
    return-void

    .line 92
    nop

    :sswitch_data_1a
    .sparse-switch
        0x1 -> :sswitch_15
        0x2 -> :sswitch_15
        0x40 -> :sswitch_15
    .end sparse-switch
.end method

.method protected validateRSAPublicKey(Lorg/spongycastle/crypto/params/RSAKeyParameters;)Lorg/spongycastle/crypto/params/RSAKeyParameters;
    .registers 4
    .param p1, "key"    # Lorg/spongycastle/crypto/params/RSAKeyParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 184
    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/RSAKeyParameters;->getExponent()Ljava/math/BigInteger;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->isProbablePrime(I)Z

    move-result v0

    if-nez v0, :cond_13

    .line 186
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v1, 0x2f

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v0

    .line 189
    :cond_13
    return-object p1
.end method
