.class public abstract Lorg/spongycastle/jcajce/provider/asymmetric/util/BaseCipherSpi;
.super Ljavax/crypto/CipherSpi;
.source "BaseCipherSpi.java"


# instance fields
.field private availableSpecs:[Ljava/lang/Class;

.field protected engineParams:Ljava/security/AlgorithmParameters;

.field private final helper:Lorg/spongycastle/jcajce/util/JcaJceHelper;

.field private iv:[B

.field private ivSize:I

.field protected wrapEngine:Lorg/spongycastle/crypto/Wrapper;


# direct methods
.method protected constructor <init>()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 56
    invoke-direct {p0}, Ljavax/crypto/CipherSpi;-><init>()V

    .line 38
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/Class;

    const/4 v1, 0x0

    const-class v2, Ljavax/crypto/spec/IvParameterSpec;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-class v2, Ljavax/crypto/spec/PBEParameterSpec;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-class v2, Ljavax/crypto/spec/RC2ParameterSpec;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-class v2, Ljavax/crypto/spec/RC5ParameterSpec;

    aput-object v2, v0, v1

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/util/BaseCipherSpi;->availableSpecs:[Ljava/lang/Class;

    .line 46
    new-instance v0, Lorg/spongycastle/jcajce/util/BCJcaJceHelper;

    invoke-direct {v0}, Lorg/spongycastle/jcajce/util/BCJcaJceHelper;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/util/BaseCipherSpi;->helper:Lorg/spongycastle/jcajce/util/JcaJceHelper;

    .line 48
    iput-object v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/util/BaseCipherSpi;->engineParams:Ljava/security/AlgorithmParameters;

    .line 50
    iput-object v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/util/BaseCipherSpi;->wrapEngine:Lorg/spongycastle/crypto/Wrapper;

    .line 57
    return-void
.end method


# virtual methods
.method protected final createParametersInstance(Ljava/lang/String;)Ljava/security/AlgorithmParameters;
    .registers 3
    .param p1, "algorithm"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/NoSuchProviderException;
        }
    .end annotation

    .prologue
    .line 89
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/util/BaseCipherSpi;->helper:Lorg/spongycastle/jcajce/util/JcaJceHelper;

    invoke-interface {v0, p1}, Lorg/spongycastle/jcajce/util/JcaJceHelper;->createAlgorithmParameters(Ljava/lang/String;)Ljava/security/AlgorithmParameters;

    move-result-object v0

    return-object v0
.end method

.method protected engineGetBlockSize()I
    .registers 2

    .prologue
    .line 61
    const/4 v0, 0x0

    return v0
.end method

.method protected engineGetIV()[B
    .registers 2

    .prologue
    .line 66
    const/4 v0, 0x0

    return-object v0
.end method

.method protected engineGetKeySize(Ljava/security/Key;)I
    .registers 3
    .param p1, "key"    # Ljava/security/Key;

    .prologue
    .line 72
    invoke-interface {p1}, Ljava/security/Key;->getEncoded()[B

    move-result-object v0

    array-length v0, v0

    return v0
.end method

.method protected engineGetOutputSize(I)I
    .registers 3
    .param p1, "inputLen"    # I

    .prologue
    .line 78
    const/4 v0, -0x1

    return v0
.end method

.method protected engineGetParameters()Ljava/security/AlgorithmParameters;
    .registers 2

    .prologue
    .line 83
    const/4 v0, 0x0

    return-object v0
.end method

.method protected engineSetMode(Ljava/lang/String;)V
    .registers 5
    .param p1, "mode"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .prologue
    .line 96
    new-instance v0, Ljava/security/NoSuchAlgorithmException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "can\'t support mode "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/security/NoSuchAlgorithmException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected engineSetPadding(Ljava/lang/String;)V
    .registers 5
    .param p1, "padding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/crypto/NoSuchPaddingException;
        }
    .end annotation

    .prologue
    .line 103
    new-instance v0, Ljavax/crypto/NoSuchPaddingException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Padding "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " unknown."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljavax/crypto/NoSuchPaddingException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected engineUnwrap([BLjava/lang/String;I)Ljava/security/Key;
    .registers 14
    .param p1, "wrappedKey"    # [B
    .param p2, "wrappedKeyAlgorithm"    # Ljava/lang/String;
    .param p3, "wrappedKeyType"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x2

    .line 142
    :try_start_1
    iget-object v6, p0, Lorg/spongycastle/jcajce/provider/asymmetric/util/BaseCipherSpi;->wrapEngine:Lorg/spongycastle/crypto/Wrapper;

    if-nez v6, :cond_14

    .line 144
    const/4 v6, 0x0

    array-length v7, p1

    invoke-virtual {p0, p1, v6, v7}, Lorg/spongycastle/jcajce/provider/asymmetric/util/BaseCipherSpi;->engineDoFinal([BII)[B
    :try_end_a
    .catch Lorg/spongycastle/crypto/InvalidCipherTextException; {:try_start_1 .. :try_end_a} :catch_1d
    .catch Ljavax/crypto/BadPaddingException; {:try_start_1 .. :try_end_a} :catch_28
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_1 .. :try_end_a} :catch_33

    move-result-object v2

    .line 164
    .local v2, "encoded":[B
    :goto_b
    const/4 v6, 0x3

    if-ne p3, v6, :cond_3e

    .line 166
    new-instance v5, Ljavax/crypto/spec/SecretKeySpec;

    invoke-direct {v5, v2, p2}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 206
    :cond_13
    :goto_13
    return-object v5

    .line 148
    .end local v2    # "encoded":[B
    :cond_14
    :try_start_14
    iget-object v6, p0, Lorg/spongycastle/jcajce/provider/asymmetric/util/BaseCipherSpi;->wrapEngine:Lorg/spongycastle/crypto/Wrapper;

    const/4 v7, 0x0

    array-length v8, p1

    invoke-interface {v6, p1, v7, v8}, Lorg/spongycastle/crypto/Wrapper;->unwrap([BII)[B
    :try_end_1b
    .catch Lorg/spongycastle/crypto/InvalidCipherTextException; {:try_start_14 .. :try_end_1b} :catch_1d
    .catch Ljavax/crypto/BadPaddingException; {:try_start_14 .. :try_end_1b} :catch_28
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_14 .. :try_end_1b} :catch_33

    move-result-object v2

    .restart local v2    # "encoded":[B
    goto :goto_b

    .line 151
    .end local v2    # "encoded":[B
    :catch_1d
    move-exception v0

    .line 153
    .local v0, "e":Lorg/spongycastle/crypto/InvalidCipherTextException;
    new-instance v6, Ljava/security/InvalidKeyException;

    invoke-virtual {v0}, Lorg/spongycastle/crypto/InvalidCipherTextException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 155
    .end local v0    # "e":Lorg/spongycastle/crypto/InvalidCipherTextException;
    :catch_28
    move-exception v0

    .line 157
    .local v0, "e":Ljavax/crypto/BadPaddingException;
    new-instance v6, Ljava/security/InvalidKeyException;

    invoke-virtual {v0}, Ljavax/crypto/BadPaddingException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 159
    .end local v0    # "e":Ljavax/crypto/BadPaddingException;
    :catch_33
    move-exception v1

    .line 161
    .local v1, "e2":Ljavax/crypto/IllegalBlockSizeException;
    new-instance v6, Ljava/security/InvalidKeyException;

    invoke-virtual {v1}, Ljavax/crypto/IllegalBlockSizeException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 168
    .end local v1    # "e2":Ljavax/crypto/IllegalBlockSizeException;
    .restart local v2    # "encoded":[B
    :cond_3e
    const-string v6, ""

    invoke-virtual {p2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_82

    if-ne p3, v9, :cond_82

    .line 176
    :try_start_48
    invoke-static {v2}, Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;

    move-result-object v3

    .line 178
    .local v3, "in":Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;
    invoke-static {v3}, Lorg/spongycastle/jce/provider/BouncyCastleProvider;->getPrivateKey(Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;)Ljava/security/PrivateKey;

    move-result-object v5

    .line 180
    .local v5, "privKey":Ljava/security/PrivateKey;
    if-nez v5, :cond_13

    .line 186
    new-instance v6, Ljava/security/InvalidKeyException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "algorithm "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v3}, Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;->getPrivateKeyAlgorithm()Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    move-result-object v8

    invoke-virtual {v8}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->getAlgorithm()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " not supported"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_79
    .catch Ljava/lang/Exception; {:try_start_48 .. :try_end_79} :catch_79

    .line 189
    .end local v3    # "in":Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;
    .end local v5    # "privKey":Ljava/security/PrivateKey;
    :catch_79
    move-exception v0

    .line 191
    .local v0, "e":Ljava/lang/Exception;
    new-instance v6, Ljava/security/InvalidKeyException;

    const-string v7, "Invalid key encoding."

    invoke-direct {v6, v7}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 198
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_82
    :try_start_82
    iget-object v6, p0, Lorg/spongycastle/jcajce/provider/asymmetric/util/BaseCipherSpi;->helper:Lorg/spongycastle/jcajce/util/JcaJceHelper;

    invoke-interface {v6, p2}, Lorg/spongycastle/jcajce/util/JcaJceHelper;->createKeyFactory(Ljava/lang/String;)Ljava/security/KeyFactory;

    move-result-object v4

    .line 200
    .local v4, "kf":Ljava/security/KeyFactory;
    const/4 v6, 0x1

    if-ne p3, v6, :cond_96

    .line 202
    new-instance v6, Ljava/security/spec/X509EncodedKeySpec;

    invoke-direct {v6, v2}, Ljava/security/spec/X509EncodedKeySpec;-><init>([B)V

    invoke-virtual {v4, v6}, Ljava/security/KeyFactory;->generatePublic(Ljava/security/spec/KeySpec;)Ljava/security/PublicKey;

    move-result-object v5

    goto/16 :goto_13

    .line 204
    :cond_96
    if-ne p3, v9, :cond_fd

    .line 206
    new-instance v6, Ljava/security/spec/PKCS8EncodedKeySpec;

    invoke-direct {v6, v2}, Ljava/security/spec/PKCS8EncodedKeySpec;-><init>([B)V

    invoke-virtual {v4, v6}, Ljava/security/KeyFactory;->generatePrivate(Ljava/security/spec/KeySpec;)Ljava/security/PrivateKey;
    :try_end_a0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_82 .. :try_end_a0} :catch_a3
    .catch Ljava/security/spec/InvalidKeySpecException; {:try_start_82 .. :try_end_a0} :catch_c1
    .catch Ljava/security/NoSuchProviderException; {:try_start_82 .. :try_end_a0} :catch_df

    move-result-object v5

    goto/16 :goto_13

    .line 209
    .end local v4    # "kf":Ljava/security/KeyFactory;
    :catch_a3
    move-exception v0

    .line 211
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v6, Ljava/security/InvalidKeyException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Unknown key type "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v0}, Ljava/security/NoSuchAlgorithmException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 213
    .end local v0    # "e":Ljava/security/NoSuchAlgorithmException;
    :catch_c1
    move-exception v0

    .line 215
    .local v0, "e":Ljava/security/spec/InvalidKeySpecException;
    new-instance v6, Ljava/security/InvalidKeyException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Unknown key type "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v0}, Ljava/security/spec/InvalidKeySpecException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 217
    .end local v0    # "e":Ljava/security/spec/InvalidKeySpecException;
    :catch_df
    move-exception v0

    .line 219
    .local v0, "e":Ljava/security/NoSuchProviderException;
    new-instance v6, Ljava/security/InvalidKeyException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Unknown key type "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v0}, Ljava/security/NoSuchProviderException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 222
    .end local v0    # "e":Ljava/security/NoSuchProviderException;
    .restart local v4    # "kf":Ljava/security/KeyFactory;
    :cond_fd
    new-instance v6, Ljava/security/InvalidKeyException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Unknown key type "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v6
.end method

.method protected engineWrap(Ljava/security/Key;)[B
    .registers 7
    .param p1, "key"    # Ljava/security/Key;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/crypto/IllegalBlockSizeException;,
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .prologue
    .line 110
    invoke-interface {p1}, Ljava/security/Key;->getEncoded()[B

    move-result-object v1

    .line 111
    .local v1, "encoded":[B
    if-nez v1, :cond_e

    .line 113
    new-instance v2, Ljava/security/InvalidKeyException;

    const-string v3, "Cannot wrap key, null encoding."

    invoke-direct {v2, v3}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 118
    :cond_e
    :try_start_e
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/util/BaseCipherSpi;->wrapEngine:Lorg/spongycastle/crypto/Wrapper;

    if-nez v2, :cond_19

    .line 120
    const/4 v2, 0x0

    array-length v3, v1

    invoke-virtual {p0, v1, v2, v3}, Lorg/spongycastle/jcajce/provider/asymmetric/util/BaseCipherSpi;->engineDoFinal([BII)[B

    move-result-object v2

    .line 124
    :goto_18
    return-object v2

    :cond_19
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/util/BaseCipherSpi;->wrapEngine:Lorg/spongycastle/crypto/Wrapper;

    const/4 v3, 0x0

    array-length v4, v1

    invoke-interface {v2, v1, v3, v4}, Lorg/spongycastle/crypto/Wrapper;->wrap([BII)[B
    :try_end_20
    .catch Ljavax/crypto/BadPaddingException; {:try_start_e .. :try_end_20} :catch_22

    move-result-object v2

    goto :goto_18

    .line 127
    :catch_22
    move-exception v0

    .line 129
    .local v0, "e":Ljavax/crypto/BadPaddingException;
    new-instance v2, Ljavax/crypto/IllegalBlockSizeException;

    invoke-virtual {v0}, Ljavax/crypto/BadPaddingException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljavax/crypto/IllegalBlockSizeException;-><init>(Ljava/lang/String;)V

    throw v2
.end method
