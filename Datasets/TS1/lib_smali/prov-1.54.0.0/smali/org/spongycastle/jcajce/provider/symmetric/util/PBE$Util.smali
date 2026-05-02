.class public Lorg/spongycastle/jcajce/provider/symmetric/util/PBE$Util;
.super Ljava/lang/Object;
.source "PBE.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/spongycastle/jcajce/provider/symmetric/util/PBE;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Util"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static convertPassword(ILjavax/crypto/spec/PBEKeySpec;)[B
    .registers 4
    .param p0, "type"    # I
    .param p1, "keySpec"    # Ljavax/crypto/spec/PBEKeySpec;

    .prologue
    .line 393
    const/4 v1, 0x2

    if-ne p0, v1, :cond_c

    .line 395
    invoke-virtual {p1}, Ljavax/crypto/spec/PBEKeySpec;->getPassword()[C

    move-result-object v1

    invoke-static {v1}, Lorg/spongycastle/crypto/PBEParametersGenerator;->PKCS12PasswordToBytes([C)[B

    move-result-object v0

    .line 405
    .local v0, "key":[B
    :goto_b
    return-object v0

    .line 397
    .end local v0    # "key":[B
    :cond_c
    const/4 v1, 0x5

    if-eq p0, v1, :cond_12

    const/4 v1, 0x4

    if-ne p0, v1, :cond_1b

    .line 399
    :cond_12
    invoke-virtual {p1}, Ljavax/crypto/spec/PBEKeySpec;->getPassword()[C

    move-result-object v1

    invoke-static {v1}, Lorg/spongycastle/crypto/PBEParametersGenerator;->PKCS5PasswordToUTF8Bytes([C)[B

    move-result-object v0

    .restart local v0    # "key":[B
    goto :goto_b

    .line 403
    .end local v0    # "key":[B
    :cond_1b
    invoke-virtual {p1}, Ljavax/crypto/spec/PBEKeySpec;->getPassword()[C

    move-result-object v1

    invoke-static {v1}, Lorg/spongycastle/crypto/PBEParametersGenerator;->PKCS5PasswordToBytes([C)[B

    move-result-object v0

    .restart local v0    # "key":[B
    goto :goto_b
.end method

.method private static makePBEGenerator(II)Lorg/spongycastle/crypto/PBEParametersGenerator;
    .registers 5
    .param p0, "type"    # I
    .param p1, "hash"    # I

    .prologue
    .line 58
    if-eqz p0, :cond_5

    const/4 v1, 0x4

    if-ne p0, v1, :cond_31

    .line 60
    :cond_5
    packed-switch p1, :pswitch_data_f8

    .line 72
    :pswitch_8
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "PKCS5 scheme 1 only supports MD2, MD5 and SHA1."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 63
    :pswitch_10
    new-instance v0, Lorg/spongycastle/crypto/generators/PKCS5S1ParametersGenerator;

    new-instance v1, Lorg/spongycastle/crypto/digests/MD2Digest;

    invoke-direct {v1}, Lorg/spongycastle/crypto/digests/MD2Digest;-><init>()V

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/generators/PKCS5S1ParametersGenerator;-><init>(Lorg/spongycastle/crypto/Digest;)V

    .line 138
    .local v0, "generator":Lorg/spongycastle/crypto/PBEParametersGenerator;
    :goto_1a
    return-object v0

    .line 66
    .end local v0    # "generator":Lorg/spongycastle/crypto/PBEParametersGenerator;
    :pswitch_1b
    new-instance v0, Lorg/spongycastle/crypto/generators/PKCS5S1ParametersGenerator;

    new-instance v1, Lorg/spongycastle/crypto/digests/MD5Digest;

    invoke-direct {v1}, Lorg/spongycastle/crypto/digests/MD5Digest;-><init>()V

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/generators/PKCS5S1ParametersGenerator;-><init>(Lorg/spongycastle/crypto/Digest;)V

    .line 67
    .restart local v0    # "generator":Lorg/spongycastle/crypto/PBEParametersGenerator;
    goto :goto_1a

    .line 69
    .end local v0    # "generator":Lorg/spongycastle/crypto/PBEParametersGenerator;
    :pswitch_26
    new-instance v0, Lorg/spongycastle/crypto/generators/PKCS5S1ParametersGenerator;

    new-instance v1, Lorg/spongycastle/crypto/digests/SHA1Digest;

    invoke-direct {v1}, Lorg/spongycastle/crypto/digests/SHA1Digest;-><init>()V

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/generators/PKCS5S1ParametersGenerator;-><init>(Lorg/spongycastle/crypto/Digest;)V

    .line 70
    .restart local v0    # "generator":Lorg/spongycastle/crypto/PBEParametersGenerator;
    goto :goto_1a

    .line 75
    .end local v0    # "generator":Lorg/spongycastle/crypto/PBEParametersGenerator;
    :cond_31
    const/4 v1, 0x1

    if-eq p0, v1, :cond_37

    const/4 v1, 0x5

    if-ne p0, v1, :cond_8f

    .line 77
    :cond_37
    packed-switch p1, :pswitch_data_108

    .line 101
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "unknown digest scheme for PBE PKCS5S2 encryption."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 80
    :pswitch_42
    new-instance v0, Lorg/spongycastle/crypto/generators/PKCS5S2ParametersGenerator;

    new-instance v1, Lorg/spongycastle/crypto/digests/MD2Digest;

    invoke-direct {v1}, Lorg/spongycastle/crypto/digests/MD2Digest;-><init>()V

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/generators/PKCS5S2ParametersGenerator;-><init>(Lorg/spongycastle/crypto/Digest;)V

    .line 81
    .restart local v0    # "generator":Lorg/spongycastle/crypto/PBEParametersGenerator;
    goto :goto_1a

    .line 83
    .end local v0    # "generator":Lorg/spongycastle/crypto/PBEParametersGenerator;
    :pswitch_4d
    new-instance v0, Lorg/spongycastle/crypto/generators/PKCS5S2ParametersGenerator;

    new-instance v1, Lorg/spongycastle/crypto/digests/MD5Digest;

    invoke-direct {v1}, Lorg/spongycastle/crypto/digests/MD5Digest;-><init>()V

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/generators/PKCS5S2ParametersGenerator;-><init>(Lorg/spongycastle/crypto/Digest;)V

    .line 84
    .restart local v0    # "generator":Lorg/spongycastle/crypto/PBEParametersGenerator;
    goto :goto_1a

    .line 86
    .end local v0    # "generator":Lorg/spongycastle/crypto/PBEParametersGenerator;
    :pswitch_58
    new-instance v0, Lorg/spongycastle/crypto/generators/PKCS5S2ParametersGenerator;

    new-instance v1, Lorg/spongycastle/crypto/digests/SHA1Digest;

    invoke-direct {v1}, Lorg/spongycastle/crypto/digests/SHA1Digest;-><init>()V

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/generators/PKCS5S2ParametersGenerator;-><init>(Lorg/spongycastle/crypto/Digest;)V

    .line 87
    .restart local v0    # "generator":Lorg/spongycastle/crypto/PBEParametersGenerator;
    goto :goto_1a

    .line 89
    .end local v0    # "generator":Lorg/spongycastle/crypto/PBEParametersGenerator;
    :pswitch_63
    new-instance v0, Lorg/spongycastle/crypto/generators/PKCS5S2ParametersGenerator;

    new-instance v1, Lorg/spongycastle/crypto/digests/RIPEMD160Digest;

    invoke-direct {v1}, Lorg/spongycastle/crypto/digests/RIPEMD160Digest;-><init>()V

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/generators/PKCS5S2ParametersGenerator;-><init>(Lorg/spongycastle/crypto/Digest;)V

    .line 90
    .restart local v0    # "generator":Lorg/spongycastle/crypto/PBEParametersGenerator;
    goto :goto_1a

    .line 92
    .end local v0    # "generator":Lorg/spongycastle/crypto/PBEParametersGenerator;
    :pswitch_6e
    new-instance v0, Lorg/spongycastle/crypto/generators/PKCS5S2ParametersGenerator;

    new-instance v1, Lorg/spongycastle/crypto/digests/TigerDigest;

    invoke-direct {v1}, Lorg/spongycastle/crypto/digests/TigerDigest;-><init>()V

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/generators/PKCS5S2ParametersGenerator;-><init>(Lorg/spongycastle/crypto/Digest;)V

    .line 93
    .restart local v0    # "generator":Lorg/spongycastle/crypto/PBEParametersGenerator;
    goto :goto_1a

    .line 95
    .end local v0    # "generator":Lorg/spongycastle/crypto/PBEParametersGenerator;
    :pswitch_79
    new-instance v0, Lorg/spongycastle/crypto/generators/PKCS5S2ParametersGenerator;

    new-instance v1, Lorg/spongycastle/crypto/digests/SHA256Digest;

    invoke-direct {v1}, Lorg/spongycastle/crypto/digests/SHA256Digest;-><init>()V

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/generators/PKCS5S2ParametersGenerator;-><init>(Lorg/spongycastle/crypto/Digest;)V

    .line 96
    .restart local v0    # "generator":Lorg/spongycastle/crypto/PBEParametersGenerator;
    goto :goto_1a

    .line 98
    .end local v0    # "generator":Lorg/spongycastle/crypto/PBEParametersGenerator;
    :pswitch_84
    new-instance v0, Lorg/spongycastle/crypto/generators/PKCS5S2ParametersGenerator;

    new-instance v1, Lorg/spongycastle/crypto/digests/GOST3411Digest;

    invoke-direct {v1}, Lorg/spongycastle/crypto/digests/GOST3411Digest;-><init>()V

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/generators/PKCS5S2ParametersGenerator;-><init>(Lorg/spongycastle/crypto/Digest;)V

    .line 99
    .restart local v0    # "generator":Lorg/spongycastle/crypto/PBEParametersGenerator;
    goto :goto_1a

    .line 104
    .end local v0    # "generator":Lorg/spongycastle/crypto/PBEParametersGenerator;
    :cond_8f
    const/4 v1, 0x2

    if-ne p0, v1, :cond_f1

    .line 106
    packed-switch p1, :pswitch_data_11a

    .line 130
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "unknown digest scheme for PBE encryption."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 109
    :pswitch_9d
    new-instance v0, Lorg/spongycastle/crypto/generators/PKCS12ParametersGenerator;

    new-instance v1, Lorg/spongycastle/crypto/digests/MD2Digest;

    invoke-direct {v1}, Lorg/spongycastle/crypto/digests/MD2Digest;-><init>()V

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/generators/PKCS12ParametersGenerator;-><init>(Lorg/spongycastle/crypto/Digest;)V

    .line 110
    .restart local v0    # "generator":Lorg/spongycastle/crypto/PBEParametersGenerator;
    goto/16 :goto_1a

    .line 112
    .end local v0    # "generator":Lorg/spongycastle/crypto/PBEParametersGenerator;
    :pswitch_a9
    new-instance v0, Lorg/spongycastle/crypto/generators/PKCS12ParametersGenerator;

    new-instance v1, Lorg/spongycastle/crypto/digests/MD5Digest;

    invoke-direct {v1}, Lorg/spongycastle/crypto/digests/MD5Digest;-><init>()V

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/generators/PKCS12ParametersGenerator;-><init>(Lorg/spongycastle/crypto/Digest;)V

    .line 113
    .restart local v0    # "generator":Lorg/spongycastle/crypto/PBEParametersGenerator;
    goto/16 :goto_1a

    .line 115
    .end local v0    # "generator":Lorg/spongycastle/crypto/PBEParametersGenerator;
    :pswitch_b5
    new-instance v0, Lorg/spongycastle/crypto/generators/PKCS12ParametersGenerator;

    new-instance v1, Lorg/spongycastle/crypto/digests/SHA1Digest;

    invoke-direct {v1}, Lorg/spongycastle/crypto/digests/SHA1Digest;-><init>()V

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/generators/PKCS12ParametersGenerator;-><init>(Lorg/spongycastle/crypto/Digest;)V

    .line 116
    .restart local v0    # "generator":Lorg/spongycastle/crypto/PBEParametersGenerator;
    goto/16 :goto_1a

    .line 118
    .end local v0    # "generator":Lorg/spongycastle/crypto/PBEParametersGenerator;
    :pswitch_c1
    new-instance v0, Lorg/spongycastle/crypto/generators/PKCS12ParametersGenerator;

    new-instance v1, Lorg/spongycastle/crypto/digests/RIPEMD160Digest;

    invoke-direct {v1}, Lorg/spongycastle/crypto/digests/RIPEMD160Digest;-><init>()V

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/generators/PKCS12ParametersGenerator;-><init>(Lorg/spongycastle/crypto/Digest;)V

    .line 119
    .restart local v0    # "generator":Lorg/spongycastle/crypto/PBEParametersGenerator;
    goto/16 :goto_1a

    .line 121
    .end local v0    # "generator":Lorg/spongycastle/crypto/PBEParametersGenerator;
    :pswitch_cd
    new-instance v0, Lorg/spongycastle/crypto/generators/PKCS12ParametersGenerator;

    new-instance v1, Lorg/spongycastle/crypto/digests/TigerDigest;

    invoke-direct {v1}, Lorg/spongycastle/crypto/digests/TigerDigest;-><init>()V

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/generators/PKCS12ParametersGenerator;-><init>(Lorg/spongycastle/crypto/Digest;)V

    .line 122
    .restart local v0    # "generator":Lorg/spongycastle/crypto/PBEParametersGenerator;
    goto/16 :goto_1a

    .line 124
    .end local v0    # "generator":Lorg/spongycastle/crypto/PBEParametersGenerator;
    :pswitch_d9
    new-instance v0, Lorg/spongycastle/crypto/generators/PKCS12ParametersGenerator;

    new-instance v1, Lorg/spongycastle/crypto/digests/SHA256Digest;

    invoke-direct {v1}, Lorg/spongycastle/crypto/digests/SHA256Digest;-><init>()V

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/generators/PKCS12ParametersGenerator;-><init>(Lorg/spongycastle/crypto/Digest;)V

    .line 125
    .restart local v0    # "generator":Lorg/spongycastle/crypto/PBEParametersGenerator;
    goto/16 :goto_1a

    .line 127
    .end local v0    # "generator":Lorg/spongycastle/crypto/PBEParametersGenerator;
    :pswitch_e5
    new-instance v0, Lorg/spongycastle/crypto/generators/PKCS12ParametersGenerator;

    new-instance v1, Lorg/spongycastle/crypto/digests/GOST3411Digest;

    invoke-direct {v1}, Lorg/spongycastle/crypto/digests/GOST3411Digest;-><init>()V

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/generators/PKCS12ParametersGenerator;-><init>(Lorg/spongycastle/crypto/Digest;)V

    .line 128
    .restart local v0    # "generator":Lorg/spongycastle/crypto/PBEParametersGenerator;
    goto/16 :goto_1a

    .line 135
    .end local v0    # "generator":Lorg/spongycastle/crypto/PBEParametersGenerator;
    :cond_f1
    new-instance v0, Lorg/spongycastle/crypto/generators/OpenSSLPBEParametersGenerator;

    invoke-direct {v0}, Lorg/spongycastle/crypto/generators/OpenSSLPBEParametersGenerator;-><init>()V

    .restart local v0    # "generator":Lorg/spongycastle/crypto/PBEParametersGenerator;
    goto/16 :goto_1a

    .line 60
    :pswitch_data_f8
    .packed-switch 0x0
        :pswitch_1b
        :pswitch_26
        :pswitch_8
        :pswitch_8
        :pswitch_8
        :pswitch_10
    .end packed-switch

    .line 77
    :pswitch_data_108
    .packed-switch 0x0
        :pswitch_4d
        :pswitch_58
        :pswitch_63
        :pswitch_6e
        :pswitch_79
        :pswitch_42
        :pswitch_84
    .end packed-switch

    .line 106
    :pswitch_data_11a
    .packed-switch 0x0
        :pswitch_a9
        :pswitch_b5
        :pswitch_c1
        :pswitch_cd
        :pswitch_d9
        :pswitch_9d
        :pswitch_e5
    .end packed-switch
.end method

.method public static makePBEMacParameters(Ljavax/crypto/SecretKey;IIILjavax/crypto/spec/PBEParameterSpec;)Lorg/spongycastle/crypto/CipherParameters;
    .registers 12
    .param p0, "key"    # Ljavax/crypto/SecretKey;
    .param p1, "type"    # I
    .param p2, "hash"    # I
    .param p3, "keySize"    # I
    .param p4, "pbeSpec"    # Ljavax/crypto/spec/PBEParameterSpec;

    .prologue
    .line 372
    invoke-static {p1, p2}, Lorg/spongycastle/jcajce/provider/symmetric/util/PBE$Util;->makePBEGenerator(II)Lorg/spongycastle/crypto/PBEParametersGenerator;

    move-result-object v0

    .line 375
    .local v0, "generator":Lorg/spongycastle/crypto/PBEParametersGenerator;
    invoke-interface {p0}, Ljavax/crypto/SecretKey;->getEncoded()[B

    move-result-object v2

    .line 377
    .local v2, "keyBytes":[B
    invoke-interface {p0}, Ljavax/crypto/SecretKey;->getEncoded()[B

    move-result-object v4

    invoke-virtual {p4}, Ljavax/crypto/spec/PBEParameterSpec;->getSalt()[B

    move-result-object v5

    invoke-virtual {p4}, Ljavax/crypto/spec/PBEParameterSpec;->getIterationCount()I

    move-result v6

    invoke-virtual {v0, v4, v5, v6}, Lorg/spongycastle/crypto/PBEParametersGenerator;->init([B[BI)V

    .line 379
    invoke-virtual {v0, p3}, Lorg/spongycastle/crypto/PBEParametersGenerator;->generateDerivedMacParameters(I)Lorg/spongycastle/crypto/CipherParameters;

    move-result-object v3

    .line 381
    .local v3, "param":Lorg/spongycastle/crypto/CipherParameters;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1c
    array-length v4, v2

    if-eq v1, v4, :cond_25

    .line 383
    const/4 v4, 0x0

    aput-byte v4, v2, v1

    .line 381
    add-int/lit8 v1, v1, 0x1

    goto :goto_1c

    .line 386
    :cond_25
    return-object v3
.end method

.method public static makePBEMacParameters(Ljavax/crypto/spec/PBEKeySpec;III)Lorg/spongycastle/crypto/CipherParameters;
    .registers 10
    .param p0, "keySpec"    # Ljavax/crypto/spec/PBEKeySpec;
    .param p1, "type"    # I
    .param p2, "hash"    # I
    .param p3, "keySize"    # I

    .prologue
    .line 306
    invoke-static {p1, p2}, Lorg/spongycastle/jcajce/provider/symmetric/util/PBE$Util;->makePBEGenerator(II)Lorg/spongycastle/crypto/PBEParametersGenerator;

    move-result-object v0

    .line 310
    .local v0, "generator":Lorg/spongycastle/crypto/PBEParametersGenerator;
    invoke-static {p1, p0}, Lorg/spongycastle/jcajce/provider/symmetric/util/PBE$Util;->convertPassword(ILjavax/crypto/spec/PBEKeySpec;)[B

    move-result-object v2

    .line 312
    .local v2, "key":[B
    invoke-virtual {p0}, Ljavax/crypto/spec/PBEKeySpec;->getSalt()[B

    move-result-object v4

    invoke-virtual {p0}, Ljavax/crypto/spec/PBEKeySpec;->getIterationCount()I

    move-result v5

    invoke-virtual {v0, v2, v4, v5}, Lorg/spongycastle/crypto/PBEParametersGenerator;->init([B[BI)V

    .line 314
    invoke-virtual {v0, p3}, Lorg/spongycastle/crypto/PBEParametersGenerator;->generateDerivedMacParameters(I)Lorg/spongycastle/crypto/CipherParameters;

    move-result-object v3

    .line 316
    .local v3, "param":Lorg/spongycastle/crypto/CipherParameters;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_18
    array-length v4, v2

    if-eq v1, v4, :cond_21

    .line 318
    const/4 v4, 0x0

    aput-byte v4, v2, v1

    .line 316
    add-int/lit8 v1, v1, 0x1

    goto :goto_18

    .line 321
    :cond_21
    return-object v3
.end method

.method public static makePBEMacParameters(Lorg/spongycastle/jcajce/provider/symmetric/util/BCPBEKey;Ljava/security/spec/AlgorithmParameterSpec;)Lorg/spongycastle/crypto/CipherParameters;
    .registers 9
    .param p0, "pbeKey"    # Lorg/spongycastle/jcajce/provider/symmetric/util/BCPBEKey;
    .param p1, "spec"    # Ljava/security/spec/AlgorithmParameterSpec;

    .prologue
    .line 273
    if-eqz p1, :cond_6

    instance-of v5, p1, Ljavax/crypto/spec/PBEParameterSpec;

    if-nez v5, :cond_e

    .line 275
    :cond_6
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "Need a PBEParameter spec with a PBE key."

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    :cond_e
    move-object v4, p1

    .line 278
    check-cast v4, Ljavax/crypto/spec/PBEParameterSpec;

    .line 279
    .local v4, "pbeParam":Ljavax/crypto/spec/PBEParameterSpec;
    invoke-virtual {p0}, Lorg/spongycastle/jcajce/provider/symmetric/util/BCPBEKey;->getType()I

    move-result v5

    invoke-virtual {p0}, Lorg/spongycastle/jcajce/provider/symmetric/util/BCPBEKey;->getDigest()I

    move-result v6

    invoke-static {v5, v6}, Lorg/spongycastle/jcajce/provider/symmetric/util/PBE$Util;->makePBEGenerator(II)Lorg/spongycastle/crypto/PBEParametersGenerator;

    move-result-object v0

    .line 280
    .local v0, "generator":Lorg/spongycastle/crypto/PBEParametersGenerator;
    invoke-virtual {p0}, Lorg/spongycastle/jcajce/provider/symmetric/util/BCPBEKey;->getEncoded()[B

    move-result-object v2

    .line 283
    .local v2, "key":[B
    invoke-virtual {v4}, Ljavax/crypto/spec/PBEParameterSpec;->getSalt()[B

    move-result-object v5

    invoke-virtual {v4}, Ljavax/crypto/spec/PBEParameterSpec;->getIterationCount()I

    move-result v6

    invoke-virtual {v0, v2, v5, v6}, Lorg/spongycastle/crypto/PBEParametersGenerator;->init([B[BI)V

    .line 285
    invoke-virtual {p0}, Lorg/spongycastle/jcajce/provider/symmetric/util/BCPBEKey;->getKeySize()I

    move-result v5

    invoke-virtual {v0, v5}, Lorg/spongycastle/crypto/PBEParametersGenerator;->generateDerivedMacParameters(I)Lorg/spongycastle/crypto/CipherParameters;

    move-result-object v3

    .line 287
    .local v3, "param":Lorg/spongycastle/crypto/CipherParameters;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_35
    array-length v5, v2

    if-eq v1, v5, :cond_3e

    .line 289
    const/4 v5, 0x0

    aput-byte v5, v2, v1

    .line 287
    add-int/lit8 v1, v1, 0x1

    goto :goto_35

    .line 292
    :cond_3e
    return-object v3
.end method

.method public static makePBEParameters(Ljavax/crypto/spec/PBEKeySpec;IIII)Lorg/spongycastle/crypto/CipherParameters;
    .registers 11
    .param p0, "keySpec"    # Ljavax/crypto/spec/PBEKeySpec;
    .param p1, "type"    # I
    .param p2, "hash"    # I
    .param p3, "keySize"    # I
    .param p4, "ivSize"    # I

    .prologue
    .line 335
    invoke-static {p1, p2}, Lorg/spongycastle/jcajce/provider/symmetric/util/PBE$Util;->makePBEGenerator(II)Lorg/spongycastle/crypto/PBEParametersGenerator;

    move-result-object v0

    .line 339
    .local v0, "generator":Lorg/spongycastle/crypto/PBEParametersGenerator;
    invoke-static {p1, p0}, Lorg/spongycastle/jcajce/provider/symmetric/util/PBE$Util;->convertPassword(ILjavax/crypto/spec/PBEKeySpec;)[B

    move-result-object v2

    .line 341
    .local v2, "key":[B
    invoke-virtual {p0}, Ljavax/crypto/spec/PBEKeySpec;->getSalt()[B

    move-result-object v4

    invoke-virtual {p0}, Ljavax/crypto/spec/PBEKeySpec;->getIterationCount()I

    move-result v5

    invoke-virtual {v0, v2, v4, v5}, Lorg/spongycastle/crypto/PBEParametersGenerator;->init([B[BI)V

    .line 343
    if-eqz p4, :cond_23

    .line 345
    invoke-virtual {v0, p3, p4}, Lorg/spongycastle/crypto/PBEParametersGenerator;->generateDerivedParameters(II)Lorg/spongycastle/crypto/CipherParameters;

    move-result-object v3

    .line 352
    .local v3, "param":Lorg/spongycastle/crypto/CipherParameters;
    :goto_19
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1a
    array-length v4, v2

    if-eq v1, v4, :cond_28

    .line 354
    const/4 v4, 0x0

    aput-byte v4, v2, v1

    .line 352
    add-int/lit8 v1, v1, 0x1

    goto :goto_1a

    .line 349
    .end local v1    # "i":I
    .end local v3    # "param":Lorg/spongycastle/crypto/CipherParameters;
    :cond_23
    invoke-virtual {v0, p3}, Lorg/spongycastle/crypto/PBEParametersGenerator;->generateDerivedParameters(I)Lorg/spongycastle/crypto/CipherParameters;

    move-result-object v3

    .restart local v3    # "param":Lorg/spongycastle/crypto/CipherParameters;
    goto :goto_19

    .line 357
    .restart local v1    # "i":I
    :cond_28
    return-object v3
.end method

.method public static makePBEParameters(Lorg/spongycastle/jcajce/provider/symmetric/util/BCPBEKey;Ljava/security/spec/AlgorithmParameterSpec;Ljava/lang/String;)Lorg/spongycastle/crypto/CipherParameters;
    .registers 11
    .param p0, "pbeKey"    # Lorg/spongycastle/jcajce/provider/symmetric/util/BCPBEKey;
    .param p1, "spec"    # Ljava/security/spec/AlgorithmParameterSpec;
    .param p2, "targetAlgorithm"    # Ljava/lang/String;

    .prologue
    .line 214
    if-eqz p1, :cond_6

    instance-of v6, p1, Ljavax/crypto/spec/PBEParameterSpec;

    if-nez v6, :cond_e

    .line 216
    :cond_6
    new-instance v6, Ljava/lang/IllegalArgumentException;

    const-string v7, "Need a PBEParameter spec with a PBE key."

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    :cond_e
    move-object v5, p1

    .line 219
    check-cast v5, Ljavax/crypto/spec/PBEParameterSpec;

    .line 220
    .local v5, "pbeParam":Ljavax/crypto/spec/PBEParameterSpec;
    invoke-virtual {p0}, Lorg/spongycastle/jcajce/provider/symmetric/util/BCPBEKey;->getType()I

    move-result v6

    invoke-virtual {p0}, Lorg/spongycastle/jcajce/provider/symmetric/util/BCPBEKey;->getDigest()I

    move-result v7

    invoke-static {v6, v7}, Lorg/spongycastle/jcajce/provider/symmetric/util/PBE$Util;->makePBEGenerator(II)Lorg/spongycastle/crypto/PBEParametersGenerator;

    move-result-object v0

    .line 221
    .local v0, "generator":Lorg/spongycastle/crypto/PBEParametersGenerator;
    invoke-virtual {p0}, Lorg/spongycastle/jcajce/provider/symmetric/util/BCPBEKey;->getEncoded()[B

    move-result-object v3

    .line 224
    .local v3, "key":[B
    invoke-virtual {p0}, Lorg/spongycastle/jcajce/provider/symmetric/util/BCPBEKey;->shouldTryWrongPKCS12()Z

    move-result v6

    if-eqz v6, :cond_2a

    .line 226
    const/4 v6, 0x2

    new-array v3, v6, [B

    .line 229
    :cond_2a
    invoke-virtual {v5}, Ljavax/crypto/spec/PBEParameterSpec;->getSalt()[B

    move-result-object v6

    invoke-virtual {v5}, Ljavax/crypto/spec/PBEParameterSpec;->getIterationCount()I

    move-result v7

    invoke-virtual {v0, v3, v6, v7}, Lorg/spongycastle/crypto/PBEParametersGenerator;->init([B[BI)V

    .line 231
    invoke-virtual {p0}, Lorg/spongycastle/jcajce/provider/symmetric/util/BCPBEKey;->getIvSize()I

    move-result v6

    if-eqz v6, :cond_6d

    .line 233
    invoke-virtual {p0}, Lorg/spongycastle/jcajce/provider/symmetric/util/BCPBEKey;->getKeySize()I

    move-result v6

    invoke-virtual {p0}, Lorg/spongycastle/jcajce/provider/symmetric/util/BCPBEKey;->getIvSize()I

    move-result v7

    invoke-virtual {v0, v6, v7}, Lorg/spongycastle/crypto/PBEParametersGenerator;->generateDerivedParameters(II)Lorg/spongycastle/crypto/CipherParameters;

    move-result-object v4

    .line 240
    .local v4, "param":Lorg/spongycastle/crypto/CipherParameters;
    :goto_47
    const-string v6, "DES"

    invoke-virtual {p2, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_63

    .line 242
    instance-of v6, v4, Lorg/spongycastle/crypto/params/ParametersWithIV;

    if-eqz v6, :cond_76

    move-object v6, v4

    .line 244
    check-cast v6, Lorg/spongycastle/crypto/params/ParametersWithIV;

    invoke-virtual {v6}, Lorg/spongycastle/crypto/params/ParametersWithIV;->getParameters()Lorg/spongycastle/crypto/CipherParameters;

    move-result-object v2

    check-cast v2, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 246
    .local v2, "kParam":Lorg/spongycastle/crypto/params/KeyParameter;
    invoke-virtual {v2}, Lorg/spongycastle/crypto/params/KeyParameter;->getKey()[B

    move-result-object v6

    invoke-static {v6}, Lorg/spongycastle/crypto/params/DESParameters;->setOddParity([B)V

    .line 256
    .end local v2    # "kParam":Lorg/spongycastle/crypto/params/KeyParameter;
    :cond_63
    :goto_63
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_64
    array-length v6, v3

    if-eq v1, v6, :cond_81

    .line 258
    const/4 v6, 0x0

    aput-byte v6, v3, v1

    .line 256
    add-int/lit8 v1, v1, 0x1

    goto :goto_64

    .line 237
    .end local v1    # "i":I
    .end local v4    # "param":Lorg/spongycastle/crypto/CipherParameters;
    :cond_6d
    invoke-virtual {p0}, Lorg/spongycastle/jcajce/provider/symmetric/util/BCPBEKey;->getKeySize()I

    move-result v6

    invoke-virtual {v0, v6}, Lorg/spongycastle/crypto/PBEParametersGenerator;->generateDerivedParameters(I)Lorg/spongycastle/crypto/CipherParameters;

    move-result-object v4

    .restart local v4    # "param":Lorg/spongycastle/crypto/CipherParameters;
    goto :goto_47

    :cond_76
    move-object v2, v4

    .line 250
    check-cast v2, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 252
    .restart local v2    # "kParam":Lorg/spongycastle/crypto/params/KeyParameter;
    invoke-virtual {v2}, Lorg/spongycastle/crypto/params/KeyParameter;->getKey()[B

    move-result-object v6

    invoke-static {v6}, Lorg/spongycastle/crypto/params/DESParameters;->setOddParity([B)V

    goto :goto_63

    .line 261
    .end local v2    # "kParam":Lorg/spongycastle/crypto/params/KeyParameter;
    .restart local v1    # "i":I
    :cond_81
    return-object v4
.end method

.method public static makePBEParameters([BIIIILjava/security/spec/AlgorithmParameterSpec;Ljava/lang/String;)Lorg/spongycastle/crypto/CipherParameters;
    .registers 15
    .param p0, "pbeKey"    # [B
    .param p1, "scheme"    # I
    .param p2, "digest"    # I
    .param p3, "keySize"    # I
    .param p4, "ivSize"    # I
    .param p5, "spec"    # Ljava/security/spec/AlgorithmParameterSpec;
    .param p6, "targetAlgorithm"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidAlgorithmParameterException;
        }
    .end annotation

    .prologue
    .line 155
    if-eqz p5, :cond_6

    instance-of v6, p5, Ljavax/crypto/spec/PBEParameterSpec;

    if-nez v6, :cond_e

    .line 157
    :cond_6
    new-instance v6, Ljava/security/InvalidAlgorithmParameterException;

    const-string v7, "Need a PBEParameter spec with a PBE key."

    invoke-direct {v6, v7}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    throw v6

    :cond_e
    move-object v5, p5

    .line 160
    check-cast v5, Ljavax/crypto/spec/PBEParameterSpec;

    .line 161
    .local v5, "pbeParam":Ljavax/crypto/spec/PBEParameterSpec;
    invoke-static {p1, p2}, Lorg/spongycastle/jcajce/provider/symmetric/util/PBE$Util;->makePBEGenerator(II)Lorg/spongycastle/crypto/PBEParametersGenerator;

    move-result-object v0

    .line 162
    .local v0, "generator":Lorg/spongycastle/crypto/PBEParametersGenerator;
    move-object v3, p0

    .line 170
    .local v3, "key":[B
    invoke-virtual {v5}, Ljavax/crypto/spec/PBEParameterSpec;->getSalt()[B

    move-result-object v6

    invoke-virtual {v5}, Ljavax/crypto/spec/PBEParameterSpec;->getIterationCount()I

    move-result v7

    invoke-virtual {v0, v3, v6, v7}, Lorg/spongycastle/crypto/PBEParametersGenerator;->init([B[BI)V

    .line 172
    if-eqz p4, :cond_4d

    .line 174
    invoke-virtual {v0, p3, p4}, Lorg/spongycastle/crypto/PBEParametersGenerator;->generateDerivedParameters(II)Lorg/spongycastle/crypto/CipherParameters;

    move-result-object v4

    .line 181
    .local v4, "param":Lorg/spongycastle/crypto/CipherParameters;
    :goto_27
    const-string v6, "DES"

    invoke-virtual {p6, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_43

    .line 183
    instance-of v6, v4, Lorg/spongycastle/crypto/params/ParametersWithIV;

    if-eqz v6, :cond_52

    move-object v6, v4

    .line 185
    check-cast v6, Lorg/spongycastle/crypto/params/ParametersWithIV;

    invoke-virtual {v6}, Lorg/spongycastle/crypto/params/ParametersWithIV;->getParameters()Lorg/spongycastle/crypto/CipherParameters;

    move-result-object v2

    check-cast v2, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 187
    .local v2, "kParam":Lorg/spongycastle/crypto/params/KeyParameter;
    invoke-virtual {v2}, Lorg/spongycastle/crypto/params/KeyParameter;->getKey()[B

    move-result-object v6

    invoke-static {v6}, Lorg/spongycastle/crypto/params/DESParameters;->setOddParity([B)V

    .line 197
    .end local v2    # "kParam":Lorg/spongycastle/crypto/params/KeyParameter;
    :cond_43
    :goto_43
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_44
    array-length v6, v3

    if-eq v1, v6, :cond_5d

    .line 199
    const/4 v6, 0x0

    aput-byte v6, v3, v1

    .line 197
    add-int/lit8 v1, v1, 0x1

    goto :goto_44

    .line 178
    .end local v1    # "i":I
    .end local v4    # "param":Lorg/spongycastle/crypto/CipherParameters;
    :cond_4d
    invoke-virtual {v0, p3}, Lorg/spongycastle/crypto/PBEParametersGenerator;->generateDerivedParameters(I)Lorg/spongycastle/crypto/CipherParameters;

    move-result-object v4

    .restart local v4    # "param":Lorg/spongycastle/crypto/CipherParameters;
    goto :goto_27

    :cond_52
    move-object v2, v4

    .line 191
    check-cast v2, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 193
    .restart local v2    # "kParam":Lorg/spongycastle/crypto/params/KeyParameter;
    invoke-virtual {v2}, Lorg/spongycastle/crypto/params/KeyParameter;->getKey()[B

    move-result-object v6

    invoke-static {v6}, Lorg/spongycastle/crypto/params/DESParameters;->setOddParity([B)V

    goto :goto_43

    .line 202
    .end local v2    # "kParam":Lorg/spongycastle/crypto/params/KeyParameter;
    .restart local v1    # "i":I
    :cond_5d
    return-object v4
.end method
