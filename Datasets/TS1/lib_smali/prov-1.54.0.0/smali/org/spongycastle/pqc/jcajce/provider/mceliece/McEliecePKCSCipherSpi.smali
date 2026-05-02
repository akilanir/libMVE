.class public Lorg/spongycastle/pqc/jcajce/provider/mceliece/McEliecePKCSCipherSpi;
.super Lorg/spongycastle/pqc/jcajce/provider/util/AsymmetricBlockCipher;
.source "McEliecePKCSCipherSpi.java"

# interfaces
.implements Lorg/spongycastle/asn1/pkcs/PKCSObjectIdentifiers;
.implements Lorg/spongycastle/asn1/x509/X509ObjectIdentifiers;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/spongycastle/pqc/jcajce/provider/mceliece/McEliecePKCSCipherSpi$McEliecePKCS512;,
        Lorg/spongycastle/pqc/jcajce/provider/mceliece/McEliecePKCSCipherSpi$McEliecePKCS384;,
        Lorg/spongycastle/pqc/jcajce/provider/mceliece/McEliecePKCSCipherSpi$McEliecePKCS256;,
        Lorg/spongycastle/pqc/jcajce/provider/mceliece/McEliecePKCSCipherSpi$McEliecePKCS224;,
        Lorg/spongycastle/pqc/jcajce/provider/mceliece/McEliecePKCSCipherSpi$McEliecePKCS;
    }
.end annotation


# instance fields
.field private cipher:Lorg/spongycastle/pqc/crypto/mceliece/McEliecePKCSCipher;

.field private digest:Lorg/spongycastle/crypto/Digest;


# direct methods
.method public constructor <init>(Lorg/spongycastle/crypto/Digest;Lorg/spongycastle/pqc/crypto/mceliece/McEliecePKCSCipher;)V
    .registers 3
    .param p1, "digest"    # Lorg/spongycastle/crypto/Digest;
    .param p2, "cipher"    # Lorg/spongycastle/pqc/crypto/mceliece/McEliecePKCSCipher;

    .prologue
    .line 37
    invoke-direct {p0}, Lorg/spongycastle/pqc/jcajce/provider/util/AsymmetricBlockCipher;-><init>()V

    .line 38
    iput-object p1, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/McEliecePKCSCipherSpi;->digest:Lorg/spongycastle/crypto/Digest;

    .line 39
    iput-object p2, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/McEliecePKCSCipherSpi;->cipher:Lorg/spongycastle/pqc/crypto/mceliece/McEliecePKCSCipher;

    .line 40
    return-void
.end method


# virtual methods
.method public getKeySize(Ljava/security/Key;)I
    .registers 4
    .param p1, "key"    # Ljava/security/Key;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .prologue
    .line 109
    instance-of v1, p1, Ljava/security/PublicKey;

    if-eqz v1, :cond_13

    .line 111
    check-cast p1, Ljava/security/PublicKey;

    .end local p1    # "key":Ljava/security/Key;
    invoke-static {p1}, Lorg/spongycastle/pqc/jcajce/provider/mceliece/McElieceKeysToParams;->generatePublicKeyParameter(Ljava/security/PublicKey;)Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/pqc/crypto/mceliece/McElieceKeyParameters;

    .line 120
    .local v0, "mcElieceKeyParameters":Lorg/spongycastle/pqc/crypto/mceliece/McElieceKeyParameters;
    :goto_c
    iget-object v1, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/McEliecePKCSCipherSpi;->cipher:Lorg/spongycastle/pqc/crypto/mceliece/McEliecePKCSCipher;

    invoke-virtual {v1, v0}, Lorg/spongycastle/pqc/crypto/mceliece/McEliecePKCSCipher;->getKeySize(Lorg/spongycastle/pqc/crypto/mceliece/McElieceKeyParameters;)I

    move-result v1

    return v1

    .line 115
    .end local v0    # "mcElieceKeyParameters":Lorg/spongycastle/pqc/crypto/mceliece/McElieceKeyParameters;
    .restart local p1    # "key":Ljava/security/Key;
    :cond_13
    check-cast p1, Ljava/security/PrivateKey;

    .end local p1    # "key":Ljava/security/Key;
    invoke-static {p1}, Lorg/spongycastle/pqc/jcajce/provider/mceliece/McElieceKeysToParams;->generatePrivateKeyParameter(Ljava/security/PrivateKey;)Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/pqc/crypto/mceliece/McElieceKeyParameters;

    .restart local v0    # "mcElieceKeyParameters":Lorg/spongycastle/pqc/crypto/mceliece/McElieceKeyParameters;
    goto :goto_c
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 102
    const-string v0, "McEliecePKCS"

    return-object v0
.end method

.method protected initCipherDecrypt(Ljava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V
    .registers 6
    .param p1, "key"    # Ljava/security/Key;
    .param p2, "params"    # Ljava/security/spec/AlgorithmParameterSpec;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidKeyException;,
            Ljava/security/InvalidAlgorithmParameterException;
        }
    .end annotation

    .prologue
    .line 62
    check-cast p1, Ljava/security/PrivateKey;

    .end local p1    # "key":Ljava/security/Key;
    invoke-static {p1}, Lorg/spongycastle/pqc/jcajce/provider/mceliece/McElieceKeysToParams;->generatePrivateKeyParameter(Ljava/security/PrivateKey;)Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    move-result-object v0

    .line 64
    .local v0, "param":Lorg/spongycastle/crypto/CipherParameters;
    iget-object v1, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/McEliecePKCSCipherSpi;->digest:Lorg/spongycastle/crypto/Digest;

    invoke-interface {v1}, Lorg/spongycastle/crypto/Digest;->reset()V

    .line 65
    iget-object v1, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/McEliecePKCSCipherSpi;->cipher:Lorg/spongycastle/pqc/crypto/mceliece/McEliecePKCSCipher;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v0}, Lorg/spongycastle/pqc/crypto/mceliece/McEliecePKCSCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 66
    iget-object v1, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/McEliecePKCSCipherSpi;->cipher:Lorg/spongycastle/pqc/crypto/mceliece/McEliecePKCSCipher;

    iget v1, v1, Lorg/spongycastle/pqc/crypto/mceliece/McEliecePKCSCipher;->maxPlainTextSize:I

    iput v1, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/McEliecePKCSCipherSpi;->maxPlainTextSize:I

    .line 67
    iget-object v1, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/McEliecePKCSCipherSpi;->cipher:Lorg/spongycastle/pqc/crypto/mceliece/McEliecePKCSCipher;

    iget v1, v1, Lorg/spongycastle/pqc/crypto/mceliece/McEliecePKCSCipher;->cipherTextSize:I

    iput v1, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/McEliecePKCSCipherSpi;->cipherTextSize:I

    .line 68
    return-void
.end method

.method protected initCipherEncrypt(Ljava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;Ljava/security/SecureRandom;)V
    .registers 8
    .param p1, "key"    # Ljava/security/Key;
    .param p2, "params"    # Ljava/security/spec/AlgorithmParameterSpec;
    .param p3, "sr"    # Ljava/security/SecureRandom;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidKeyException;,
            Ljava/security/InvalidAlgorithmParameterException;
        }
    .end annotation

    .prologue
    .line 49
    check-cast p1, Ljava/security/PublicKey;

    .end local p1    # "key":Ljava/security/Key;
    invoke-static {p1}, Lorg/spongycastle/pqc/jcajce/provider/mceliece/McElieceKeysToParams;->generatePublicKeyParameter(Ljava/security/PublicKey;)Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    move-result-object v0

    .line 51
    .local v0, "param":Lorg/spongycastle/crypto/CipherParameters;
    new-instance v1, Lorg/spongycastle/crypto/params/ParametersWithRandom;

    invoke-direct {v1, v0, p3}, Lorg/spongycastle/crypto/params/ParametersWithRandom;-><init>(Lorg/spongycastle/crypto/CipherParameters;Ljava/security/SecureRandom;)V

    .line 52
    .end local v0    # "param":Lorg/spongycastle/crypto/CipherParameters;
    .local v1, "param":Lorg/spongycastle/crypto/CipherParameters;
    iget-object v2, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/McEliecePKCSCipherSpi;->digest:Lorg/spongycastle/crypto/Digest;

    invoke-interface {v2}, Lorg/spongycastle/crypto/Digest;->reset()V

    .line 53
    iget-object v2, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/McEliecePKCSCipherSpi;->cipher:Lorg/spongycastle/pqc/crypto/mceliece/McEliecePKCSCipher;

    const/4 v3, 0x1

    invoke-virtual {v2, v3, v1}, Lorg/spongycastle/pqc/crypto/mceliece/McEliecePKCSCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 54
    iget-object v2, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/McEliecePKCSCipherSpi;->cipher:Lorg/spongycastle/pqc/crypto/mceliece/McEliecePKCSCipher;

    iget v2, v2, Lorg/spongycastle/pqc/crypto/mceliece/McEliecePKCSCipher;->maxPlainTextSize:I

    iput v2, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/McEliecePKCSCipherSpi;->maxPlainTextSize:I

    .line 55
    iget-object v2, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/McEliecePKCSCipherSpi;->cipher:Lorg/spongycastle/pqc/crypto/mceliece/McEliecePKCSCipher;

    iget v2, v2, Lorg/spongycastle/pqc/crypto/mceliece/McEliecePKCSCipher;->cipherTextSize:I

    iput v2, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/McEliecePKCSCipherSpi;->cipherTextSize:I

    .line 56
    return-void
.end method

.method protected messageDecrypt([B)[B
    .registers 5
    .param p1, "input"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/crypto/IllegalBlockSizeException;,
            Ljavax/crypto/BadPaddingException;
        }
    .end annotation

    .prologue
    .line 88
    const/4 v1, 0x0

    .line 91
    .local v1, "output":[B
    :try_start_1
    iget-object v2, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/McEliecePKCSCipherSpi;->cipher:Lorg/spongycastle/pqc/crypto/mceliece/McEliecePKCSCipher;

    invoke-virtual {v2, p1}, Lorg/spongycastle/pqc/crypto/mceliece/McEliecePKCSCipher;->messageDecrypt([B)[B
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_6} :catch_8

    move-result-object v1

    .line 97
    :goto_7
    return-object v1

    .line 93
    :catch_8
    move-exception v0

    .line 95
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_7
.end method

.method protected messageEncrypt([B)[B
    .registers 5
    .param p1, "input"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/crypto/IllegalBlockSizeException;,
            Ljavax/crypto/BadPaddingException;
        }
    .end annotation

    .prologue
    .line 73
    const/4 v1, 0x0

    .line 76
    .local v1, "output":[B
    :try_start_1
    iget-object v2, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/McEliecePKCSCipherSpi;->cipher:Lorg/spongycastle/pqc/crypto/mceliece/McEliecePKCSCipher;

    invoke-virtual {v2, p1}, Lorg/spongycastle/pqc/crypto/mceliece/McEliecePKCSCipher;->messageEncrypt([B)[B
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_6} :catch_8

    move-result-object v1

    .line 82
    :goto_7
    return-object v1

    .line 78
    :catch_8
    move-exception v0

    .line 80
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_7
.end method
