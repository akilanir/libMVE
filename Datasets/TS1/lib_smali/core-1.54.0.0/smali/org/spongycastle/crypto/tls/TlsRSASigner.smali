.class public Lorg/spongycastle/crypto/tls/TlsRSASigner;
.super Lorg/spongycastle/crypto/tls/AbstractTlsSigner;
.source "TlsRSASigner.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 17
    invoke-direct {p0}, Lorg/spongycastle/crypto/tls/AbstractTlsSigner;-><init>()V

    return-void
.end method


# virtual methods
.method protected createRSAImpl()Lorg/spongycastle/crypto/AsymmetricBlockCipher;
    .registers 3

    .prologue
    .line 110
    new-instance v0, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;

    new-instance v1, Lorg/spongycastle/crypto/engines/RSABlindedEngine;

    invoke-direct {v1}, Lorg/spongycastle/crypto/engines/RSABlindedEngine;-><init>()V

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;-><init>(Lorg/spongycastle/crypto/AsymmetricBlockCipher;)V

    return-object v0
.end method

.method public createSigner(Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;)Lorg/spongycastle/crypto/Signer;
    .registers 7
    .param p1, "algorithm"    # Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;
    .param p2, "privateKey"    # Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    .prologue
    .line 41
    const/4 v0, 0x0

    const/4 v1, 0x1

    new-instance v2, Lorg/spongycastle/crypto/params/ParametersWithRandom;

    iget-object v3, p0, Lorg/spongycastle/crypto/tls/TlsRSASigner;->context:Lorg/spongycastle/crypto/tls/TlsContext;

    invoke-interface {v3}, Lorg/spongycastle/crypto/tls/TlsContext;->getSecureRandom()Ljava/security/SecureRandom;

    move-result-object v3

    invoke-direct {v2, p2, v3}, Lorg/spongycastle/crypto/params/ParametersWithRandom;-><init>(Lorg/spongycastle/crypto/CipherParameters;Ljava/security/SecureRandom;)V

    invoke-virtual {p0, p1, v0, v1, v2}, Lorg/spongycastle/crypto/tls/TlsRSASigner;->makeSigner(Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;ZZLorg/spongycastle/crypto/CipherParameters;)Lorg/spongycastle/crypto/Signer;

    move-result-object v0

    return-object v0
.end method

.method public createVerifyer(Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;)Lorg/spongycastle/crypto/Signer;
    .registers 4
    .param p1, "algorithm"    # Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;
    .param p2, "publicKey"    # Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    .prologue
    const/4 v0, 0x0

    .line 46
    invoke-virtual {p0, p1, v0, v0, p2}, Lorg/spongycastle/crypto/tls/TlsRSASigner;->makeSigner(Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;ZZLorg/spongycastle/crypto/CipherParameters;)Lorg/spongycastle/crypto/Signer;

    move-result-object v0

    return-object v0
.end method

.method public generateRawSignature(Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;[B)[B
    .registers 8
    .param p1, "algorithm"    # Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;
    .param p2, "privateKey"    # Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;
    .param p3, "hash"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/CryptoException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    .line 24
    new-instance v1, Lorg/spongycastle/crypto/params/ParametersWithRandom;

    iget-object v2, p0, Lorg/spongycastle/crypto/tls/TlsRSASigner;->context:Lorg/spongycastle/crypto/tls/TlsContext;

    .line 25
    invoke-interface {v2}, Lorg/spongycastle/crypto/tls/TlsContext;->getSecureRandom()Ljava/security/SecureRandom;

    move-result-object v2

    invoke-direct {v1, p2, v2}, Lorg/spongycastle/crypto/params/ParametersWithRandom;-><init>(Lorg/spongycastle/crypto/CipherParameters;Ljava/security/SecureRandom;)V

    .line 24
    invoke-virtual {p0, p1, v3, v3, v1}, Lorg/spongycastle/crypto/tls/TlsRSASigner;->makeSigner(Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;ZZLorg/spongycastle/crypto/CipherParameters;)Lorg/spongycastle/crypto/Signer;

    move-result-object v0

    .line 26
    .local v0, "signer":Lorg/spongycastle/crypto/Signer;
    const/4 v1, 0x0

    array-length v2, p3

    invoke-interface {v0, p3, v1, v2}, Lorg/spongycastle/crypto/Signer;->update([BII)V

    .line 27
    invoke-interface {v0}, Lorg/spongycastle/crypto/Signer;->generateSignature()[B

    move-result-object v1

    return-object v1
.end method

.method public isValidPublicKey(Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;)Z
    .registers 3
    .param p1, "publicKey"    # Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    .prologue
    .line 51
    instance-of v0, p1, Lorg/spongycastle/crypto/params/RSAKeyParameters;

    if-eqz v0, :cond_c

    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;->isPrivate()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method protected makeSigner(Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;ZZLorg/spongycastle/crypto/CipherParameters;)Lorg/spongycastle/crypto/Signer;
    .registers 10
    .param p1, "algorithm"    # Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;
    .param p2, "raw"    # Z
    .param p3, "forSigning"    # Z
    .param p4, "cp"    # Lorg/spongycastle/crypto/CipherParameters;

    .prologue
    const/4 v3, 0x1

    .line 57
    if-eqz p1, :cond_12

    move v2, v3

    :goto_4
    iget-object v4, p0, Lorg/spongycastle/crypto/tls/TlsRSASigner;->context:Lorg/spongycastle/crypto/tls/TlsContext;

    invoke-static {v4}, Lorg/spongycastle/crypto/tls/TlsUtils;->isTLSv12(Lorg/spongycastle/crypto/tls/TlsContext;)Z

    move-result v4

    if-eq v2, v4, :cond_14

    .line 59
    new-instance v2, Ljava/lang/IllegalStateException;

    invoke-direct {v2}, Ljava/lang/IllegalStateException;-><init>()V

    throw v2

    .line 57
    :cond_12
    const/4 v2, 0x0

    goto :goto_4

    .line 62
    :cond_14
    if-eqz p1, :cond_22

    invoke-virtual {p1}, Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;->getSignature()S

    move-result v2

    if-eq v2, v3, :cond_22

    .line 64
    new-instance v2, Ljava/lang/IllegalStateException;

    invoke-direct {v2}, Ljava/lang/IllegalStateException;-><init>()V

    throw v2

    .line 68
    :cond_22
    if-eqz p2, :cond_3c

    .line 70
    new-instance v0, Lorg/spongycastle/crypto/digests/NullDigest;

    invoke-direct {v0}, Lorg/spongycastle/crypto/digests/NullDigest;-><init>()V

    .line 82
    .local v0, "d":Lorg/spongycastle/crypto/Digest;
    :goto_29
    if-eqz p1, :cond_4d

    .line 88
    new-instance v1, Lorg/spongycastle/crypto/signers/RSADigestSigner;

    invoke-virtual {p1}, Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;->getHash()S

    move-result v2

    invoke-static {v2}, Lorg/spongycastle/crypto/tls/TlsUtils;->getOIDForHashAlgorithm(S)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Lorg/spongycastle/crypto/signers/RSADigestSigner;-><init>(Lorg/spongycastle/crypto/Digest;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V

    .line 98
    .local v1, "s":Lorg/spongycastle/crypto/Signer;
    :goto_38
    invoke-interface {v1, p3, p4}, Lorg/spongycastle/crypto/Signer;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 99
    return-object v1

    .line 72
    .end local v0    # "d":Lorg/spongycastle/crypto/Digest;
    .end local v1    # "s":Lorg/spongycastle/crypto/Signer;
    :cond_3c
    if-nez p1, :cond_44

    .line 74
    new-instance v0, Lorg/spongycastle/crypto/tls/CombinedHash;

    invoke-direct {v0}, Lorg/spongycastle/crypto/tls/CombinedHash;-><init>()V

    .restart local v0    # "d":Lorg/spongycastle/crypto/Digest;
    goto :goto_29

    .line 78
    .end local v0    # "d":Lorg/spongycastle/crypto/Digest;
    :cond_44
    invoke-virtual {p1}, Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;->getHash()S

    move-result v2

    invoke-static {v2}, Lorg/spongycastle/crypto/tls/TlsUtils;->createHash(S)Lorg/spongycastle/crypto/Digest;

    move-result-object v0

    .restart local v0    # "d":Lorg/spongycastle/crypto/Digest;
    goto :goto_29

    .line 96
    :cond_4d
    new-instance v1, Lorg/spongycastle/crypto/signers/GenericSigner;

    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsRSASigner;->createRSAImpl()Lorg/spongycastle/crypto/AsymmetricBlockCipher;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lorg/spongycastle/crypto/signers/GenericSigner;-><init>(Lorg/spongycastle/crypto/AsymmetricBlockCipher;Lorg/spongycastle/crypto/Digest;)V

    .restart local v1    # "s":Lorg/spongycastle/crypto/Signer;
    goto :goto_38
.end method

.method public verifyRawSignature(Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;[BLorg/spongycastle/crypto/params/AsymmetricKeyParameter;[B)Z
    .registers 8
    .param p1, "algorithm"    # Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;
    .param p2, "sigBytes"    # [B
    .param p3, "publicKey"    # Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;
    .param p4, "hash"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/CryptoException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 34
    const/4 v1, 0x1

    invoke-virtual {p0, p1, v1, v2, p3}, Lorg/spongycastle/crypto/tls/TlsRSASigner;->makeSigner(Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;ZZLorg/spongycastle/crypto/CipherParameters;)Lorg/spongycastle/crypto/Signer;

    move-result-object v0

    .line 35
    .local v0, "signer":Lorg/spongycastle/crypto/Signer;
    array-length v1, p4

    invoke-interface {v0, p4, v2, v1}, Lorg/spongycastle/crypto/Signer;->update([BII)V

    .line 36
    invoke-interface {v0, p2}, Lorg/spongycastle/crypto/Signer;->verifySignature([B)Z

    move-result v1

    return v1
.end method
