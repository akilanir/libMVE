.class public Lorg/spongycastle/jcajce/provider/asymmetric/rsa/DigestSignatureSpi;
.super Ljava/security/SignatureSpi;
.source "DigestSignatureSpi.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/spongycastle/jcajce/provider/asymmetric/rsa/DigestSignatureSpi$noneRSA;,
        Lorg/spongycastle/jcajce/provider/asymmetric/rsa/DigestSignatureSpi$RIPEMD256;,
        Lorg/spongycastle/jcajce/provider/asymmetric/rsa/DigestSignatureSpi$RIPEMD128;,
        Lorg/spongycastle/jcajce/provider/asymmetric/rsa/DigestSignatureSpi$RIPEMD160;,
        Lorg/spongycastle/jcajce/provider/asymmetric/rsa/DigestSignatureSpi$MD5;,
        Lorg/spongycastle/jcajce/provider/asymmetric/rsa/DigestSignatureSpi$MD4;,
        Lorg/spongycastle/jcajce/provider/asymmetric/rsa/DigestSignatureSpi$MD2;,
        Lorg/spongycastle/jcajce/provider/asymmetric/rsa/DigestSignatureSpi$SHA512_256;,
        Lorg/spongycastle/jcajce/provider/asymmetric/rsa/DigestSignatureSpi$SHA512_224;,
        Lorg/spongycastle/jcajce/provider/asymmetric/rsa/DigestSignatureSpi$SHA512;,
        Lorg/spongycastle/jcajce/provider/asymmetric/rsa/DigestSignatureSpi$SHA384;,
        Lorg/spongycastle/jcajce/provider/asymmetric/rsa/DigestSignatureSpi$SHA256;,
        Lorg/spongycastle/jcajce/provider/asymmetric/rsa/DigestSignatureSpi$SHA224;,
        Lorg/spongycastle/jcajce/provider/asymmetric/rsa/DigestSignatureSpi$SHA1;
    }
.end annotation


# instance fields
.field private algId:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

.field private cipher:Lorg/spongycastle/crypto/AsymmetricBlockCipher;

.field private digest:Lorg/spongycastle/crypto/Digest;


# direct methods
.method protected constructor <init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/crypto/Digest;Lorg/spongycastle/crypto/AsymmetricBlockCipher;)V
    .registers 6
    .param p1, "objId"    # Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .param p2, "digest"    # Lorg/spongycastle/crypto/Digest;
    .param p3, "cipher"    # Lorg/spongycastle/crypto/AsymmetricBlockCipher;

    .prologue
    .line 65
    invoke-direct {p0}, Ljava/security/SignatureSpi;-><init>()V

    .line 66
    iput-object p2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/DigestSignatureSpi;->digest:Lorg/spongycastle/crypto/Digest;

    .line 67
    iput-object p3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/DigestSignatureSpi;->cipher:Lorg/spongycastle/crypto/AsymmetricBlockCipher;

    .line 68
    new-instance v0, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    sget-object v1, Lorg/spongycastle/asn1/DERNull;->INSTANCE:Lorg/spongycastle/asn1/DERNull;

    invoke-direct {v0, p1, v1}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/ASN1Encodable;)V

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/DigestSignatureSpi;->algId:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    .line 69
    return-void
.end method

.method protected constructor <init>(Lorg/spongycastle/crypto/Digest;Lorg/spongycastle/crypto/AsymmetricBlockCipher;)V
    .registers 4
    .param p1, "digest"    # Lorg/spongycastle/crypto/Digest;
    .param p2, "cipher"    # Lorg/spongycastle/crypto/AsymmetricBlockCipher;

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/security/SignatureSpi;-><init>()V

    .line 55
    iput-object p1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/DigestSignatureSpi;->digest:Lorg/spongycastle/crypto/Digest;

    .line 56
    iput-object p2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/DigestSignatureSpi;->cipher:Lorg/spongycastle/crypto/AsymmetricBlockCipher;

    .line 57
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/DigestSignatureSpi;->algId:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    .line 58
    return-void
.end method

.method private derEncode([B)[B
    .registers 4
    .param p1, "hash"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 242
    iget-object v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/DigestSignatureSpi;->algId:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    if-nez v1, :cond_5

    .line 250
    .end local p1    # "hash":[B
    :goto_4
    return-object p1

    .line 248
    .restart local p1    # "hash":[B
    :cond_5
    new-instance v0, Lorg/spongycastle/asn1/x509/DigestInfo;

    iget-object v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/DigestSignatureSpi;->algId:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    invoke-direct {v0, v1, p1}, Lorg/spongycastle/asn1/x509/DigestInfo;-><init>(Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;[B)V

    .line 250
    .local v0, "dInfo":Lorg/spongycastle/asn1/x509/DigestInfo;
    const-string v1, "DER"

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/x509/DigestInfo;->getEncoded(Ljava/lang/String;)[B

    move-result-object p1

    goto :goto_4
.end method

.method private getType(Ljava/lang/Object;)Ljava/lang/String;
    .registers 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 105
    if-nez p1, :cond_4

    .line 107
    const/4 v0, 0x0

    .line 110
    :goto_3
    return-object v0

    :cond_4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_3
.end method


# virtual methods
.method protected engineGetParameter(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p1, "param"    # Ljava/lang/String;

    .prologue
    .line 230
    const/4 v0, 0x0

    return-object v0
.end method

.method protected engineGetParameters()Ljava/security/AlgorithmParameters;
    .registers 2

    .prologue
    .line 235
    const/4 v0, 0x0

    return-object v0
.end method

.method protected engineInitSign(Ljava/security/PrivateKey;)V
    .registers 6
    .param p1, "privateKey"    # Ljava/security/PrivateKey;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .prologue
    .line 90
    instance-of v1, p1, Ljava/security/interfaces/RSAPrivateKey;

    if-nez v1, :cond_27

    .line 92
    new-instance v1, Ljava/security/InvalidKeyException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Supplied key ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-direct {p0, p1}, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/DigestSignatureSpi;->getType(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ") is not a RSAPrivateKey instance"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 95
    :cond_27
    check-cast p1, Ljava/security/interfaces/RSAPrivateKey;

    .end local p1    # "privateKey":Ljava/security/PrivateKey;
    invoke-static {p1}, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/RSAUtil;->generatePrivateKeyParameter(Ljava/security/interfaces/RSAPrivateKey;)Lorg/spongycastle/crypto/params/RSAKeyParameters;

    move-result-object v0

    .line 97
    .local v0, "param":Lorg/spongycastle/crypto/CipherParameters;
    iget-object v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/DigestSignatureSpi;->digest:Lorg/spongycastle/crypto/Digest;

    invoke-interface {v1}, Lorg/spongycastle/crypto/Digest;->reset()V

    .line 99
    iget-object v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/DigestSignatureSpi;->cipher:Lorg/spongycastle/crypto/AsymmetricBlockCipher;

    const/4 v2, 0x1

    invoke-interface {v1, v2, v0}, Lorg/spongycastle/crypto/AsymmetricBlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 100
    return-void
.end method

.method protected engineInitVerify(Ljava/security/PublicKey;)V
    .registers 6
    .param p1, "publicKey"    # Ljava/security/PublicKey;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .prologue
    .line 75
    instance-of v1, p1, Ljava/security/interfaces/RSAPublicKey;

    if-nez v1, :cond_27

    .line 77
    new-instance v1, Ljava/security/InvalidKeyException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Supplied key ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-direct {p0, p1}, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/DigestSignatureSpi;->getType(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ") is not a RSAPublicKey instance"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 80
    :cond_27
    check-cast p1, Ljava/security/interfaces/RSAPublicKey;

    .end local p1    # "publicKey":Ljava/security/PublicKey;
    invoke-static {p1}, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/RSAUtil;->generatePublicKeyParameter(Ljava/security/interfaces/RSAPublicKey;)Lorg/spongycastle/crypto/params/RSAKeyParameters;

    move-result-object v0

    .line 82
    .local v0, "param":Lorg/spongycastle/crypto/CipherParameters;
    iget-object v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/DigestSignatureSpi;->digest:Lorg/spongycastle/crypto/Digest;

    invoke-interface {v1}, Lorg/spongycastle/crypto/Digest;->reset()V

    .line 83
    iget-object v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/DigestSignatureSpi;->cipher:Lorg/spongycastle/crypto/AsymmetricBlockCipher;

    const/4 v2, 0x0

    invoke-interface {v1, v2, v0}, Lorg/spongycastle/crypto/AsymmetricBlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 84
    return-void
.end method

.method protected engineSetParameter(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 5
    .param p1, "param"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 221
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "engineSetParameter unsupported"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected engineSetParameter(Ljava/security/spec/AlgorithmParameterSpec;)V
    .registers 4
    .param p1, "params"    # Ljava/security/spec/AlgorithmParameterSpec;

    .prologue
    .line 211
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "engineSetParameter unsupported"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected engineSign()[B
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/SignatureException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 132
    iget-object v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/DigestSignatureSpi;->digest:Lorg/spongycastle/crypto/Digest;

    invoke-interface {v3}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    move-result v3

    new-array v2, v3, [B

    .line 134
    .local v2, "hash":[B
    iget-object v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/DigestSignatureSpi;->digest:Lorg/spongycastle/crypto/Digest;

    invoke-interface {v3, v2, v4}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 138
    :try_start_e
    invoke-direct {p0, v2}, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/DigestSignatureSpi;->derEncode([B)[B

    move-result-object v0

    .line 140
    .local v0, "bytes":[B
    iget-object v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/DigestSignatureSpi;->cipher:Lorg/spongycastle/crypto/AsymmetricBlockCipher;

    const/4 v4, 0x0

    array-length v5, v0

    invoke-interface {v3, v0, v4, v5}, Lorg/spongycastle/crypto/AsymmetricBlockCipher;->processBlock([BII)[B
    :try_end_19
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_e .. :try_end_19} :catch_1b
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_19} :catch_24

    move-result-object v3

    return-object v3

    .line 142
    .end local v0    # "bytes":[B
    :catch_1b
    move-exception v1

    .line 144
    .local v1, "e":Ljava/lang/ArrayIndexOutOfBoundsException;
    new-instance v3, Ljava/security/SignatureException;

    const-string v4, "key too small for signature type"

    invoke-direct {v3, v4}, Ljava/security/SignatureException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 146
    .end local v1    # "e":Ljava/lang/ArrayIndexOutOfBoundsException;
    :catch_24
    move-exception v1

    .line 148
    .local v1, "e":Ljava/lang/Exception;
    new-instance v3, Ljava/security/SignatureException;

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/security/SignatureException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method protected engineUpdate(B)V
    .registers 3
    .param p1, "b"    # B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/SignatureException;
        }
    .end annotation

    .prologue
    .line 117
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/DigestSignatureSpi;->digest:Lorg/spongycastle/crypto/Digest;

    invoke-interface {v0, p1}, Lorg/spongycastle/crypto/Digest;->update(B)V

    .line 118
    return-void
.end method

.method protected engineUpdate([BII)V
    .registers 5
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/SignatureException;
        }
    .end annotation

    .prologue
    .line 126
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/DigestSignatureSpi;->digest:Lorg/spongycastle/crypto/Digest;

    invoke-interface {v0, p1, p2, p3}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 127
    return-void
.end method

.method protected engineVerify([B)Z
    .registers 15
    .param p1, "sigBytes"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/SignatureException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x1

    const/4 v9, 0x0

    .line 156
    iget-object v10, p0, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/DigestSignatureSpi;->digest:Lorg/spongycastle/crypto/Digest;

    invoke-interface {v10}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    move-result v10

    new-array v3, v10, [B

    .line 158
    .local v3, "hash":[B
    iget-object v10, p0, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/DigestSignatureSpi;->digest:Lorg/spongycastle/crypto/Digest;

    invoke-interface {v10, v3, v9}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 165
    :try_start_f
    iget-object v10, p0, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/DigestSignatureSpi;->cipher:Lorg/spongycastle/crypto/AsymmetricBlockCipher;

    const/4 v11, 0x0

    array-length v12, p1

    invoke-interface {v10, p1, v11, v12}, Lorg/spongycastle/crypto/AsymmetricBlockCipher;->processBlock([BII)[B

    move-result-object v6

    .line 167
    .local v6, "sig":[B
    invoke-direct {p0, v3}, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/DigestSignatureSpi;->derEncode([B)[B
    :try_end_1a
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_1a} :catch_24

    move-result-object v1

    .line 174
    .local v1, "expected":[B
    array-length v10, v6

    array-length v11, v1

    if-ne v10, v11, :cond_26

    .line 176
    invoke-static {v6, v1}, Lorg/spongycastle/util/Arrays;->constantTimeAreEqual([B[B)Z

    move-result v9

    .line 204
    .end local v1    # "expected":[B
    .end local v6    # "sig":[B
    :goto_23
    return v9

    .line 169
    :catch_24
    move-exception v0

    .line 171
    .local v0, "e":Ljava/lang/Exception;
    goto :goto_23

    .line 178
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v1    # "expected":[B
    .restart local v6    # "sig":[B
    :cond_26
    array-length v10, v6

    array-length v11, v1

    add-int/lit8 v11, v11, -0x2

    if-ne v10, v11, :cond_69

    .line 180
    array-length v10, v6

    array-length v11, v3

    sub-int/2addr v10, v11

    add-int/lit8 v7, v10, -0x2

    .line 181
    .local v7, "sigOffset":I
    array-length v10, v1

    array-length v11, v3

    sub-int/2addr v10, v11

    add-int/lit8 v2, v10, -0x2

    .line 183
    .local v2, "expectedOffset":I
    aget-byte v10, v1, v8

    add-int/lit8 v10, v10, -0x2

    int-to-byte v10, v10

    aput-byte v10, v1, v8

    .line 184
    const/4 v10, 0x3

    aget-byte v11, v1, v10

    add-int/lit8 v11, v11, -0x2

    int-to-byte v11, v11

    aput-byte v11, v1, v10

    .line 186
    const/4 v5, 0x0

    .line 188
    .local v5, "nonEqual":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_47
    array-length v10, v3

    if-ge v4, v10, :cond_57

    .line 190
    add-int v10, v7, v4

    aget-byte v10, v6, v10

    add-int v11, v2, v4

    aget-byte v11, v1, v11

    xor-int/2addr v10, v11

    or-int/2addr v5, v10

    .line 188
    add-int/lit8 v4, v4, 0x1

    goto :goto_47

    .line 193
    :cond_57
    const/4 v4, 0x0

    :goto_58
    if-ge v4, v7, :cond_63

    .line 195
    aget-byte v10, v6, v4

    aget-byte v11, v1, v4

    xor-int/2addr v10, v11

    or-int/2addr v5, v10

    .line 193
    add-int/lit8 v4, v4, 0x1

    goto :goto_58

    .line 198
    :cond_63
    if-nez v5, :cond_67

    :goto_65
    move v9, v8

    goto :goto_23

    :cond_67
    move v8, v9

    goto :goto_65

    .line 202
    .end local v2    # "expectedOffset":I
    .end local v4    # "i":I
    .end local v5    # "nonEqual":I
    .end local v7    # "sigOffset":I
    :cond_69
    invoke-static {v1, v1}, Lorg/spongycastle/util/Arrays;->constantTimeAreEqual([B[B)Z

    goto :goto_23
.end method
