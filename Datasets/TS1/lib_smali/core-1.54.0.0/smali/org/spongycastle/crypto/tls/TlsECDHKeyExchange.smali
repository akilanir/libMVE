.class public Lorg/spongycastle/crypto/tls/TlsECDHKeyExchange;
.super Lorg/spongycastle/crypto/tls/AbstractTlsKeyExchange;
.source "TlsECDHKeyExchange.java"


# instance fields
.field protected agreementCredentials:Lorg/spongycastle/crypto/tls/TlsAgreementCredentials;

.field protected clientECPointFormats:[S

.field protected ecAgreePrivateKey:Lorg/spongycastle/crypto/params/ECPrivateKeyParameters;

.field protected ecAgreePublicKey:Lorg/spongycastle/crypto/params/ECPublicKeyParameters;

.field protected namedCurves:[I

.field protected serverECPointFormats:[S

.field protected serverPublicKey:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

.field protected tlsSigner:Lorg/spongycastle/crypto/tls/TlsSigner;


# direct methods
.method public constructor <init>(ILjava/util/Vector;[I[S[S)V
    .registers 8
    .param p1, "keyExchange"    # I
    .param p2, "supportedSignatureAlgorithms"    # Ljava/util/Vector;
    .param p3, "namedCurves"    # [I
    .param p4, "clientECPointFormats"    # [S
    .param p5, "serverECPointFormats"    # [S

    .prologue
    .line 34
    invoke-direct {p0, p1, p2}, Lorg/spongycastle/crypto/tls/AbstractTlsKeyExchange;-><init>(ILjava/util/Vector;)V

    .line 36
    packed-switch p1, :pswitch_data_28

    .line 49
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "unsupported key exchange algorithm"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 39
    :pswitch_e
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsRSASigner;

    invoke-direct {v0}, Lorg/spongycastle/crypto/tls/TlsRSASigner;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/crypto/tls/TlsECDHKeyExchange;->tlsSigner:Lorg/spongycastle/crypto/tls/TlsSigner;

    .line 52
    :goto_15
    iput-object p3, p0, Lorg/spongycastle/crypto/tls/TlsECDHKeyExchange;->namedCurves:[I

    .line 53
    iput-object p4, p0, Lorg/spongycastle/crypto/tls/TlsECDHKeyExchange;->clientECPointFormats:[S

    .line 54
    iput-object p5, p0, Lorg/spongycastle/crypto/tls/TlsECDHKeyExchange;->serverECPointFormats:[S

    .line 55
    return-void

    .line 42
    :pswitch_1c
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsECDSASigner;

    invoke-direct {v0}, Lorg/spongycastle/crypto/tls/TlsECDSASigner;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/crypto/tls/TlsECDHKeyExchange;->tlsSigner:Lorg/spongycastle/crypto/tls/TlsSigner;

    goto :goto_15

    .line 46
    :pswitch_24
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/spongycastle/crypto/tls/TlsECDHKeyExchange;->tlsSigner:Lorg/spongycastle/crypto/tls/TlsSigner;

    goto :goto_15

    .line 36
    :pswitch_data_28
    .packed-switch 0x10
        :pswitch_24
        :pswitch_1c
        :pswitch_24
        :pswitch_e
    .end packed-switch
.end method


# virtual methods
.method public generateClientKeyExchange(Ljava/io/OutputStream;)V
    .registers 5
    .param p1, "output"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 175
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsECDHKeyExchange;->agreementCredentials:Lorg/spongycastle/crypto/tls/TlsAgreementCredentials;

    if-nez v0, :cond_18

    .line 177
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsECDHKeyExchange;->context:Lorg/spongycastle/crypto/tls/TlsContext;

    invoke-interface {v0}, Lorg/spongycastle/crypto/tls/TlsContext;->getSecureRandom()Ljava/security/SecureRandom;

    move-result-object v0

    iget-object v1, p0, Lorg/spongycastle/crypto/tls/TlsECDHKeyExchange;->serverECPointFormats:[S

    iget-object v2, p0, Lorg/spongycastle/crypto/tls/TlsECDHKeyExchange;->ecAgreePublicKey:Lorg/spongycastle/crypto/params/ECPublicKeyParameters;

    .line 178
    invoke-virtual {v2}, Lorg/spongycastle/crypto/params/ECPublicKeyParameters;->getParameters()Lorg/spongycastle/crypto/params/ECDomainParameters;

    move-result-object v2

    .line 177
    invoke-static {v0, v1, v2, p1}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->generateEphemeralClientKeyExchange(Ljava/security/SecureRandom;[SLorg/spongycastle/crypto/params/ECDomainParameters;Ljava/io/OutputStream;)Lorg/spongycastle/crypto/params/ECPrivateKeyParameters;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/crypto/tls/TlsECDHKeyExchange;->ecAgreePrivateKey:Lorg/spongycastle/crypto/params/ECPrivateKeyParameters;

    .line 180
    :cond_18
    return-void
.end method

.method public generatePremasterSecret()[B
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 206
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsECDHKeyExchange;->agreementCredentials:Lorg/spongycastle/crypto/tls/TlsAgreementCredentials;

    if-eqz v0, :cond_d

    .line 208
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsECDHKeyExchange;->agreementCredentials:Lorg/spongycastle/crypto/tls/TlsAgreementCredentials;

    iget-object v1, p0, Lorg/spongycastle/crypto/tls/TlsECDHKeyExchange;->ecAgreePublicKey:Lorg/spongycastle/crypto/params/ECPublicKeyParameters;

    invoke-interface {v0, v1}, Lorg/spongycastle/crypto/tls/TlsAgreementCredentials;->generateAgreement(Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;)[B

    move-result-object v0

    .line 213
    :goto_c
    return-object v0

    .line 211
    :cond_d
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsECDHKeyExchange;->ecAgreePrivateKey:Lorg/spongycastle/crypto/params/ECPrivateKeyParameters;

    if-eqz v0, :cond_1a

    .line 213
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsECDHKeyExchange;->ecAgreePublicKey:Lorg/spongycastle/crypto/params/ECPublicKeyParameters;

    iget-object v1, p0, Lorg/spongycastle/crypto/tls/TlsECDHKeyExchange;->ecAgreePrivateKey:Lorg/spongycastle/crypto/params/ECPrivateKeyParameters;

    invoke-static {v0, v1}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->calculateECDHBasicAgreement(Lorg/spongycastle/crypto/params/ECPublicKeyParameters;Lorg/spongycastle/crypto/params/ECPrivateKeyParameters;)[B

    move-result-object v0

    goto :goto_c

    .line 216
    :cond_1a
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v1, 0x50

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v0
.end method

.method public init(Lorg/spongycastle/crypto/tls/TlsContext;)V
    .registers 3
    .param p1, "context"    # Lorg/spongycastle/crypto/tls/TlsContext;

    .prologue
    .line 59
    invoke-super {p0, p1}, Lorg/spongycastle/crypto/tls/AbstractTlsKeyExchange;->init(Lorg/spongycastle/crypto/tls/TlsContext;)V

    .line 61
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsECDHKeyExchange;->tlsSigner:Lorg/spongycastle/crypto/tls/TlsSigner;

    if-eqz v0, :cond_c

    .line 63
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsECDHKeyExchange;->tlsSigner:Lorg/spongycastle/crypto/tls/TlsSigner;

    invoke-interface {v0, p1}, Lorg/spongycastle/crypto/tls/TlsSigner;->init(Lorg/spongycastle/crypto/tls/TlsContext;)V

    .line 65
    :cond_c
    return-void
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
    .line 186
    return-void
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
    .line 157
    instance-of v0, p1, Lorg/spongycastle/crypto/tls/TlsAgreementCredentials;

    if-eqz v0, :cond_9

    .line 161
    check-cast p1, Lorg/spongycastle/crypto/tls/TlsAgreementCredentials;

    .end local p1    # "clientCredentials":Lorg/spongycastle/crypto/tls/TlsCredentials;
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/TlsECDHKeyExchange;->agreementCredentials:Lorg/spongycastle/crypto/tls/TlsAgreementCredentials;

    .line 171
    :cond_8
    return-void

    .line 163
    .restart local p1    # "clientCredentials":Lorg/spongycastle/crypto/tls/TlsCredentials;
    :cond_9
    instance-of v0, p1, Lorg/spongycastle/crypto/tls/TlsSignerCredentials;

    if-nez v0, :cond_8

    .line 169
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v1, 0x50

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v0
.end method

.method public processClientKeyExchange(Ljava/io/InputStream;)V
    .registers 5
    .param p1, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 190
    iget-object v2, p0, Lorg/spongycastle/crypto/tls/TlsECDHKeyExchange;->ecAgreePublicKey:Lorg/spongycastle/crypto/params/ECPublicKeyParameters;

    if-eqz v2, :cond_5

    .line 202
    :goto_4
    return-void

    .line 196
    :cond_5
    invoke-static {p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->readOpaque8(Ljava/io/InputStream;)[B

    move-result-object v1

    .line 198
    .local v1, "point":[B
    iget-object v2, p0, Lorg/spongycastle/crypto/tls/TlsECDHKeyExchange;->ecAgreePrivateKey:Lorg/spongycastle/crypto/params/ECPrivateKeyParameters;

    invoke-virtual {v2}, Lorg/spongycastle/crypto/params/ECPrivateKeyParameters;->getParameters()Lorg/spongycastle/crypto/params/ECDomainParameters;

    move-result-object v0

    .line 200
    .local v0, "curve_params":Lorg/spongycastle/crypto/params/ECDomainParameters;
    iget-object v2, p0, Lorg/spongycastle/crypto/tls/TlsECDHKeyExchange;->serverECPointFormats:[S

    invoke-static {v2, v0, v1}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->deserializeECPublicKey([SLorg/spongycastle/crypto/params/ECDomainParameters;[B)Lorg/spongycastle/crypto/params/ECPublicKeyParameters;

    move-result-object v2

    invoke-static {v2}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->validateECPublicKey(Lorg/spongycastle/crypto/params/ECPublicKeyParameters;)Lorg/spongycastle/crypto/params/ECPublicKeyParameters;

    move-result-object v2

    iput-object v2, p0, Lorg/spongycastle/crypto/tls/TlsECDHKeyExchange;->ecAgreePublicKey:Lorg/spongycastle/crypto/params/ECPublicKeyParameters;

    goto :goto_4
.end method

.method public processServerCertificate(Lorg/spongycastle/crypto/tls/Certificate;)V
    .registers 8
    .param p1, "serverCertificate"    # Lorg/spongycastle/crypto/tls/Certificate;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v5, 0x2e

    .line 74
    invoke-virtual {p1}, Lorg/spongycastle/crypto/tls/Certificate;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_10

    .line 76
    new-instance v3, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v4, 0x2a

    invoke-direct {v3, v4}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v3

    .line 79
    :cond_10
    const/4 v3, 0x0

    invoke-virtual {p1, v3}, Lorg/spongycastle/crypto/tls/Certificate;->getCertificateAt(I)Lorg/spongycastle/asn1/x509/Certificate;

    move-result-object v2

    .line 81
    .local v2, "x509Cert":Lorg/spongycastle/asn1/x509/Certificate;
    invoke-virtual {v2}, Lorg/spongycastle/asn1/x509/Certificate;->getSubjectPublicKeyInfo()Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;

    move-result-object v1

    .line 84
    .local v1, "keyInfo":Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;
    :try_start_19
    invoke-static {v1}, Lorg/spongycastle/crypto/util/PublicKeyFactory;->createKey(Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;)Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    move-result-object v3

    iput-object v3, p0, Lorg/spongycastle/crypto/tls/TlsECDHKeyExchange;->serverPublicKey:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;
    :try_end_1f
    .catch Ljava/lang/RuntimeException; {:try_start_19 .. :try_end_1f} :catch_36

    .line 91
    iget-object v3, p0, Lorg/spongycastle/crypto/tls/TlsECDHKeyExchange;->tlsSigner:Lorg/spongycastle/crypto/tls/TlsSigner;

    if-nez v3, :cond_46

    .line 95
    :try_start_23
    iget-object v3, p0, Lorg/spongycastle/crypto/tls/TlsECDHKeyExchange;->serverPublicKey:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    check-cast v3, Lorg/spongycastle/crypto/params/ECPublicKeyParameters;

    invoke-static {v3}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->validateECPublicKey(Lorg/spongycastle/crypto/params/ECPublicKeyParameters;)Lorg/spongycastle/crypto/params/ECPublicKeyParameters;

    move-result-object v3

    iput-object v3, p0, Lorg/spongycastle/crypto/tls/TlsECDHKeyExchange;->ecAgreePublicKey:Lorg/spongycastle/crypto/params/ECPublicKeyParameters;
    :try_end_2d
    .catch Ljava/lang/ClassCastException; {:try_start_23 .. :try_end_2d} :catch_3f

    .line 102
    const/16 v3, 0x8

    invoke-static {v2, v3}, Lorg/spongycastle/crypto/tls/TlsUtils;->validateKeyUsage(Lorg/spongycastle/asn1/x509/Certificate;I)V

    .line 114
    :goto_32
    invoke-super {p0, p1}, Lorg/spongycastle/crypto/tls/AbstractTlsKeyExchange;->processServerCertificate(Lorg/spongycastle/crypto/tls/Certificate;)V

    .line 115
    return-void

    .line 86
    :catch_36
    move-exception v0

    .line 88
    .local v0, "e":Ljava/lang/RuntimeException;
    new-instance v3, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v4, 0x2b

    invoke-direct {v3, v4, v0}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(SLjava/lang/Throwable;)V

    throw v3

    .line 97
    .end local v0    # "e":Ljava/lang/RuntimeException;
    :catch_3f
    move-exception v0

    .line 99
    .local v0, "e":Ljava/lang/ClassCastException;
    new-instance v3, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    invoke-direct {v3, v5, v0}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(SLjava/lang/Throwable;)V

    throw v3

    .line 106
    .end local v0    # "e":Ljava/lang/ClassCastException;
    :cond_46
    iget-object v3, p0, Lorg/spongycastle/crypto/tls/TlsECDHKeyExchange;->tlsSigner:Lorg/spongycastle/crypto/tls/TlsSigner;

    iget-object v4, p0, Lorg/spongycastle/crypto/tls/TlsECDHKeyExchange;->serverPublicKey:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    invoke-interface {v3, v4}, Lorg/spongycastle/crypto/tls/TlsSigner;->isValidPublicKey(Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;)Z

    move-result v3

    if-nez v3, :cond_56

    .line 108
    new-instance v3, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    invoke-direct {v3, v5}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v3

    .line 111
    :cond_56
    const/16 v3, 0x80

    invoke-static {v2, v3}, Lorg/spongycastle/crypto/tls/TlsUtils;->validateKeyUsage(Lorg/spongycastle/asn1/x509/Certificate;I)V

    goto :goto_32
.end method

.method public requiresServerKeyExchange()Z
    .registers 2

    .prologue
    .line 119
    iget v0, p0, Lorg/spongycastle/crypto/tls/TlsECDHKeyExchange;->keyExchange:I

    packed-switch v0, :pswitch_data_a

    .line 126
    :pswitch_5
    const/4 v0, 0x0

    :goto_6
    return v0

    .line 124
    :pswitch_7
    const/4 v0, 0x1

    goto :goto_6

    .line 119
    nop

    :pswitch_data_a
    .packed-switch 0x11
        :pswitch_7
        :pswitch_5
        :pswitch_7
        :pswitch_7
    .end packed-switch
.end method

.method public skipServerCredentials()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 69
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
    .line 138
    invoke-virtual {p1}, Lorg/spongycastle/crypto/tls/CertificateRequest;->getCertificateTypes()[S

    move-result-object v1

    .line 139
    .local v1, "types":[S
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_5
    array-length v2, v1

    if-ge v0, v2, :cond_18

    .line 141
    aget-short v2, v1, v0

    sparse-switch v2, :sswitch_data_1a

    .line 150
    new-instance v2, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v3, 0x2f

    invoke-direct {v2, v3}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v2

    .line 139
    :sswitch_15
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 153
    :cond_18
    return-void

    .line 141
    nop

    :sswitch_data_1a
    .sparse-switch
        0x1 -> :sswitch_15
        0x2 -> :sswitch_15
        0x40 -> :sswitch_15
        0x41 -> :sswitch_15
        0x42 -> :sswitch_15
    .end sparse-switch
.end method
