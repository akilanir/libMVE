.class public Lorg/spongycastle/jcajce/provider/asymmetric/util/ECUtil;
.super Ljava/lang/Object;
.source "ECUtil.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static convertMidTerms([I)[I
    .registers 7
    .param p0, "k"    # [I

    .prologue
    const/4 v2, 0x3

    const/4 v5, 0x0

    const/4 v4, 0x2

    const/4 v3, 0x1

    .line 47
    new-array v0, v2, [I

    .line 49
    .local v0, "res":[I
    array-length v1, p0

    if-ne v1, v3, :cond_e

    .line 51
    aget v1, p0, v5

    aput v1, v0, v5

    .line 104
    :goto_d
    return-object v0

    .line 55
    :cond_e
    array-length v1, p0

    if-eq v1, v2, :cond_19

    .line 57
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Only Trinomials and pentanomials supported"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 60
    :cond_19
    aget v1, p0, v5

    aget v2, p0, v3

    if-ge v1, v2, :cond_41

    aget v1, p0, v5

    aget v2, p0, v4

    if-ge v1, v2, :cond_41

    .line 62
    aget v1, p0, v5

    aput v1, v0, v5

    .line 63
    aget v1, p0, v3

    aget v2, p0, v4

    if-ge v1, v2, :cond_38

    .line 65
    aget v1, p0, v3

    aput v1, v0, v3

    .line 66
    aget v1, p0, v4

    aput v1, v0, v4

    goto :goto_d

    .line 70
    :cond_38
    aget v1, p0, v4

    aput v1, v0, v3

    .line 71
    aget v1, p0, v3

    aput v1, v0, v4

    goto :goto_d

    .line 74
    :cond_41
    aget v1, p0, v3

    aget v2, p0, v4

    if-ge v1, v2, :cond_63

    .line 76
    aget v1, p0, v3

    aput v1, v0, v5

    .line 77
    aget v1, p0, v5

    aget v2, p0, v4

    if-ge v1, v2, :cond_5a

    .line 79
    aget v1, p0, v5

    aput v1, v0, v3

    .line 80
    aget v1, p0, v4

    aput v1, v0, v4

    goto :goto_d

    .line 84
    :cond_5a
    aget v1, p0, v4

    aput v1, v0, v3

    .line 85
    aget v1, p0, v5

    aput v1, v0, v4

    goto :goto_d

    .line 90
    :cond_63
    aget v1, p0, v4

    aput v1, v0, v5

    .line 91
    aget v1, p0, v5

    aget v2, p0, v3

    if-ge v1, v2, :cond_76

    .line 93
    aget v1, p0, v5

    aput v1, v0, v3

    .line 94
    aget v1, p0, v3

    aput v1, v0, v4

    goto :goto_d

    .line 98
    :cond_76
    aget v1, p0, v3

    aput v1, v0, v3

    .line 99
    aget v1, p0, v5

    aput v1, v0, v4

    goto :goto_d
.end method

.method public static generatePrivateKeyParameter(Ljava/security/PrivateKey;)Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;
    .registers 15
    .param p0, "key"    # Ljava/security/PrivateKey;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .prologue
    .line 171
    instance-of v0, p0, Lorg/spongycastle/jce/interfaces/ECPrivateKey;

    if-eqz v0, :cond_37

    move-object v8, p0

    .line 173
    check-cast v8, Lorg/spongycastle/jce/interfaces/ECPrivateKey;

    .line 174
    .local v8, "k":Lorg/spongycastle/jce/interfaces/ECPrivateKey;
    invoke-interface {v8}, Lorg/spongycastle/jce/interfaces/ECPrivateKey;->getParameters()Lorg/spongycastle/jce/spec/ECParameterSpec;

    move-result-object v11

    .line 176
    .local v11, "s":Lorg/spongycastle/jce/spec/ECParameterSpec;
    if-nez v11, :cond_13

    .line 178
    sget-object v0, Lorg/spongycastle/jce/provider/BouncyCastleProvider;->CONFIGURATION:Lorg/spongycastle/jcajce/provider/config/ProviderConfiguration;

    invoke-interface {v0}, Lorg/spongycastle/jcajce/provider/config/ProviderConfiguration;->getEcImplicitlyCa()Lorg/spongycastle/jce/spec/ECParameterSpec;

    move-result-object v11

    .line 181
    :cond_13
    new-instance v12, Lorg/spongycastle/crypto/params/ECPrivateKeyParameters;

    .line 182
    invoke-interface {v8}, Lorg/spongycastle/jce/interfaces/ECPrivateKey;->getD()Ljava/math/BigInteger;

    move-result-object v13

    new-instance v0, Lorg/spongycastle/crypto/params/ECDomainParameters;

    .line 183
    invoke-virtual {v11}, Lorg/spongycastle/jce/spec/ECParameterSpec;->getCurve()Lorg/spongycastle/math/ec/ECCurve;

    move-result-object v1

    invoke-virtual {v11}, Lorg/spongycastle/jce/spec/ECParameterSpec;->getG()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v2

    invoke-virtual {v11}, Lorg/spongycastle/jce/spec/ECParameterSpec;->getN()Ljava/math/BigInteger;

    move-result-object v3

    invoke-virtual {v11}, Lorg/spongycastle/jce/spec/ECParameterSpec;->getH()Ljava/math/BigInteger;

    move-result-object v4

    invoke-virtual {v11}, Lorg/spongycastle/jce/spec/ECParameterSpec;->getSeed()[B

    move-result-object v5

    invoke-direct/range {v0 .. v5}, Lorg/spongycastle/crypto/params/ECDomainParameters;-><init>(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/math/ec/ECPoint;Ljava/math/BigInteger;Ljava/math/BigInteger;[B)V

    invoke-direct {v12, v13, v0}, Lorg/spongycastle/crypto/params/ECPrivateKeyParameters;-><init>(Ljava/math/BigInteger;Lorg/spongycastle/crypto/params/ECDomainParameters;)V

    move-object v0, v12

    .line 209
    .end local v8    # "k":Lorg/spongycastle/jce/interfaces/ECPrivateKey;
    .end local v11    # "s":Lorg/spongycastle/jce/spec/ECParameterSpec;
    :goto_36
    return-object v0

    .line 185
    :cond_37
    instance-of v0, p0, Ljava/security/interfaces/ECPrivateKey;

    if-eqz v0, :cond_6b

    move-object v9, p0

    .line 187
    check-cast v9, Ljava/security/interfaces/ECPrivateKey;

    .line 188
    .local v9, "privKey":Ljava/security/interfaces/ECPrivateKey;
    invoke-interface {v9}, Ljava/security/interfaces/ECPrivateKey;->getParams()Ljava/security/spec/ECParameterSpec;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/spongycastle/jcajce/provider/asymmetric/util/EC5Util;->convertSpec(Ljava/security/spec/ECParameterSpec;Z)Lorg/spongycastle/jce/spec/ECParameterSpec;

    move-result-object v11

    .line 189
    .restart local v11    # "s":Lorg/spongycastle/jce/spec/ECParameterSpec;
    new-instance v12, Lorg/spongycastle/crypto/params/ECPrivateKeyParameters;

    .line 190
    invoke-interface {v9}, Ljava/security/interfaces/ECPrivateKey;->getS()Ljava/math/BigInteger;

    move-result-object v13

    new-instance v0, Lorg/spongycastle/crypto/params/ECDomainParameters;

    .line 191
    invoke-virtual {v11}, Lorg/spongycastle/jce/spec/ECParameterSpec;->getCurve()Lorg/spongycastle/math/ec/ECCurve;

    move-result-object v1

    invoke-virtual {v11}, Lorg/spongycastle/jce/spec/ECParameterSpec;->getG()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v2

    invoke-virtual {v11}, Lorg/spongycastle/jce/spec/ECParameterSpec;->getN()Ljava/math/BigInteger;

    move-result-object v3

    invoke-virtual {v11}, Lorg/spongycastle/jce/spec/ECParameterSpec;->getH()Ljava/math/BigInteger;

    move-result-object v4

    invoke-virtual {v11}, Lorg/spongycastle/jce/spec/ECParameterSpec;->getSeed()[B

    move-result-object v5

    invoke-direct/range {v0 .. v5}, Lorg/spongycastle/crypto/params/ECDomainParameters;-><init>(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/math/ec/ECPoint;Ljava/math/BigInteger;Ljava/math/BigInteger;[B)V

    invoke-direct {v12, v13, v0}, Lorg/spongycastle/crypto/params/ECPrivateKeyParameters;-><init>(Ljava/math/BigInteger;Lorg/spongycastle/crypto/params/ECDomainParameters;)V

    move-object v0, v12

    goto :goto_36

    .line 198
    .end local v9    # "privKey":Ljava/security/interfaces/ECPrivateKey;
    .end local v11    # "s":Lorg/spongycastle/jce/spec/ECParameterSpec;
    :cond_6b
    :try_start_6b
    invoke-interface {p0}, Ljava/security/PrivateKey;->getEncoded()[B

    move-result-object v6

    .line 200
    .local v6, "bytes":[B
    if-nez v6, :cond_97

    .line 202
    new-instance v0, Ljava/security/InvalidKeyException;

    const-string v1, "no encoding for EC private key"

    invoke-direct {v0, v1}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_79
    .catch Ljava/lang/Exception; {:try_start_6b .. :try_end_79} :catch_79

    .line 212
    .end local v6    # "bytes":[B
    :catch_79
    move-exception v7

    .line 214
    .local v7, "e":Ljava/lang/Exception;
    new-instance v0, Ljava/security/InvalidKeyException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "cannot identify EC private key: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v7}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 205
    .end local v7    # "e":Ljava/lang/Exception;
    .restart local v6    # "bytes":[B
    :cond_97
    :try_start_97
    invoke-static {v6}, Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/jce/provider/BouncyCastleProvider;->getPrivateKey(Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;)Ljava/security/PrivateKey;

    move-result-object v10

    .line 207
    .local v10, "privateKey":Ljava/security/PrivateKey;
    instance-of v0, v10, Ljava/security/interfaces/ECPrivateKey;

    if-eqz v0, :cond_a8

    .line 209
    invoke-static {v10}, Lorg/spongycastle/jcajce/provider/asymmetric/util/ECUtil;->generatePrivateKeyParameter(Ljava/security/PrivateKey;)Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;
    :try_end_a6
    .catch Ljava/lang/Exception; {:try_start_97 .. :try_end_a6} :catch_79

    move-result-object v0

    goto :goto_36

    .line 218
    :cond_a8
    new-instance v0, Ljava/security/InvalidKeyException;

    const-string v1, "can\'t identify EC private key."

    invoke-direct {v0, v1}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static generatePublicKeyParameter(Ljava/security/PublicKey;)Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;
    .registers 15
    .param p0, "key"    # Ljava/security/PublicKey;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 111
    instance-of v0, p0, Lorg/spongycastle/jce/interfaces/ECPublicKey;

    if-eqz v0, :cond_5e

    move-object v8, p0

    .line 113
    check-cast v8, Lorg/spongycastle/jce/interfaces/ECPublicKey;

    .line 114
    .local v8, "k":Lorg/spongycastle/jce/interfaces/ECPublicKey;
    invoke-interface {v8}, Lorg/spongycastle/jce/interfaces/ECPublicKey;->getParameters()Lorg/spongycastle/jce/spec/ECParameterSpec;

    move-result-object v11

    .line 116
    .local v11, "s":Lorg/spongycastle/jce/spec/ECParameterSpec;
    if-nez v11, :cond_3a

    .line 118
    sget-object v0, Lorg/spongycastle/jce/provider/BouncyCastleProvider;->CONFIGURATION:Lorg/spongycastle/jcajce/provider/config/ProviderConfiguration;

    invoke-interface {v0}, Lorg/spongycastle/jcajce/provider/config/ProviderConfiguration;->getEcImplicitlyCa()Lorg/spongycastle/jce/spec/ECParameterSpec;

    move-result-object v11

    .line 120
    new-instance v12, Lorg/spongycastle/crypto/params/ECPublicKeyParameters;

    check-cast v8, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;

    .line 121
    .end local v8    # "k":Lorg/spongycastle/jce/interfaces/ECPublicKey;
    invoke-virtual {v8}, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->engineGetQ()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v13

    new-instance v0, Lorg/spongycastle/crypto/params/ECDomainParameters;

    .line 122
    invoke-virtual {v11}, Lorg/spongycastle/jce/spec/ECParameterSpec;->getCurve()Lorg/spongycastle/math/ec/ECCurve;

    move-result-object v1

    invoke-virtual {v11}, Lorg/spongycastle/jce/spec/ECParameterSpec;->getG()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v2

    invoke-virtual {v11}, Lorg/spongycastle/jce/spec/ECParameterSpec;->getN()Ljava/math/BigInteger;

    move-result-object v3

    invoke-virtual {v11}, Lorg/spongycastle/jce/spec/ECParameterSpec;->getH()Ljava/math/BigInteger;

    move-result-object v4

    invoke-virtual {v11}, Lorg/spongycastle/jce/spec/ECParameterSpec;->getSeed()[B

    move-result-object v5

    invoke-direct/range {v0 .. v5}, Lorg/spongycastle/crypto/params/ECDomainParameters;-><init>(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/math/ec/ECPoint;Ljava/math/BigInteger;Ljava/math/BigInteger;[B)V

    invoke-direct {v12, v13, v0}, Lorg/spongycastle/crypto/params/ECPublicKeyParameters;-><init>(Lorg/spongycastle/math/ec/ECPoint;Lorg/spongycastle/crypto/params/ECDomainParameters;)V

    move-object v0, v12

    .line 155
    .end local v11    # "s":Lorg/spongycastle/jce/spec/ECParameterSpec;
    :goto_39
    return-object v0

    .line 126
    .restart local v8    # "k":Lorg/spongycastle/jce/interfaces/ECPublicKey;
    .restart local v11    # "s":Lorg/spongycastle/jce/spec/ECParameterSpec;
    :cond_3a
    new-instance v12, Lorg/spongycastle/crypto/params/ECPublicKeyParameters;

    .line 127
    invoke-interface {v8}, Lorg/spongycastle/jce/interfaces/ECPublicKey;->getQ()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v13

    new-instance v0, Lorg/spongycastle/crypto/params/ECDomainParameters;

    .line 128
    invoke-virtual {v11}, Lorg/spongycastle/jce/spec/ECParameterSpec;->getCurve()Lorg/spongycastle/math/ec/ECCurve;

    move-result-object v1

    invoke-virtual {v11}, Lorg/spongycastle/jce/spec/ECParameterSpec;->getG()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v2

    invoke-virtual {v11}, Lorg/spongycastle/jce/spec/ECParameterSpec;->getN()Ljava/math/BigInteger;

    move-result-object v3

    invoke-virtual {v11}, Lorg/spongycastle/jce/spec/ECParameterSpec;->getH()Ljava/math/BigInteger;

    move-result-object v4

    invoke-virtual {v11}, Lorg/spongycastle/jce/spec/ECParameterSpec;->getSeed()[B

    move-result-object v5

    invoke-direct/range {v0 .. v5}, Lorg/spongycastle/crypto/params/ECDomainParameters;-><init>(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/math/ec/ECPoint;Ljava/math/BigInteger;Ljava/math/BigInteger;[B)V

    invoke-direct {v12, v13, v0}, Lorg/spongycastle/crypto/params/ECPublicKeyParameters;-><init>(Lorg/spongycastle/math/ec/ECPoint;Lorg/spongycastle/crypto/params/ECDomainParameters;)V

    move-object v0, v12

    goto :goto_39

    .line 131
    .end local v8    # "k":Lorg/spongycastle/jce/interfaces/ECPublicKey;
    .end local v11    # "s":Lorg/spongycastle/jce/spec/ECParameterSpec;
    :cond_5e
    instance-of v0, p0, Ljava/security/interfaces/ECPublicKey;

    if-eqz v0, :cond_99

    move-object v9, p0

    .line 133
    check-cast v9, Ljava/security/interfaces/ECPublicKey;

    .line 134
    .local v9, "pubKey":Ljava/security/interfaces/ECPublicKey;
    invoke-interface {v9}, Ljava/security/interfaces/ECPublicKey;->getParams()Ljava/security/spec/ECParameterSpec;

    move-result-object v0

    invoke-static {v0, v2}, Lorg/spongycastle/jcajce/provider/asymmetric/util/EC5Util;->convertSpec(Ljava/security/spec/ECParameterSpec;Z)Lorg/spongycastle/jce/spec/ECParameterSpec;

    move-result-object v11

    .line 135
    .restart local v11    # "s":Lorg/spongycastle/jce/spec/ECParameterSpec;
    new-instance v12, Lorg/spongycastle/crypto/params/ECPublicKeyParameters;

    .line 136
    invoke-interface {v9}, Ljava/security/interfaces/ECPublicKey;->getParams()Ljava/security/spec/ECParameterSpec;

    move-result-object v0

    invoke-interface {v9}, Ljava/security/interfaces/ECPublicKey;->getW()Ljava/security/spec/ECPoint;

    move-result-object v1

    invoke-static {v0, v1, v2}, Lorg/spongycastle/jcajce/provider/asymmetric/util/EC5Util;->convertPoint(Ljava/security/spec/ECParameterSpec;Ljava/security/spec/ECPoint;Z)Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v13

    new-instance v0, Lorg/spongycastle/crypto/params/ECDomainParameters;

    .line 137
    invoke-virtual {v11}, Lorg/spongycastle/jce/spec/ECParameterSpec;->getCurve()Lorg/spongycastle/math/ec/ECCurve;

    move-result-object v1

    invoke-virtual {v11}, Lorg/spongycastle/jce/spec/ECParameterSpec;->getG()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v2

    invoke-virtual {v11}, Lorg/spongycastle/jce/spec/ECParameterSpec;->getN()Ljava/math/BigInteger;

    move-result-object v3

    invoke-virtual {v11}, Lorg/spongycastle/jce/spec/ECParameterSpec;->getH()Ljava/math/BigInteger;

    move-result-object v4

    invoke-virtual {v11}, Lorg/spongycastle/jce/spec/ECParameterSpec;->getSeed()[B

    move-result-object v5

    invoke-direct/range {v0 .. v5}, Lorg/spongycastle/crypto/params/ECDomainParameters;-><init>(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/math/ec/ECPoint;Ljava/math/BigInteger;Ljava/math/BigInteger;[B)V

    invoke-direct {v12, v13, v0}, Lorg/spongycastle/crypto/params/ECPublicKeyParameters;-><init>(Lorg/spongycastle/math/ec/ECPoint;Lorg/spongycastle/crypto/params/ECDomainParameters;)V

    move-object v0, v12

    goto :goto_39

    .line 144
    .end local v9    # "pubKey":Ljava/security/interfaces/ECPublicKey;
    .end local v11    # "s":Lorg/spongycastle/jce/spec/ECParameterSpec;
    :cond_99
    :try_start_99
    invoke-interface {p0}, Ljava/security/PublicKey;->getEncoded()[B

    move-result-object v6

    .line 146
    .local v6, "bytes":[B
    if-nez v6, :cond_c5

    .line 148
    new-instance v0, Ljava/security/InvalidKeyException;

    const-string v1, "no encoding for EC public key"

    invoke-direct {v0, v1}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_a7
    .catch Ljava/lang/Exception; {:try_start_99 .. :try_end_a7} :catch_a7

    .line 158
    .end local v6    # "bytes":[B
    :catch_a7
    move-exception v7

    .line 160
    .local v7, "e":Ljava/lang/Exception;
    new-instance v0, Ljava/security/InvalidKeyException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "cannot identify EC public key: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v7}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 151
    .end local v7    # "e":Ljava/lang/Exception;
    .restart local v6    # "bytes":[B
    :cond_c5
    :try_start_c5
    invoke-static {v6}, Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/jce/provider/BouncyCastleProvider;->getPublicKey(Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;)Ljava/security/PublicKey;

    move-result-object v10

    .line 153
    .local v10, "publicKey":Ljava/security/PublicKey;
    instance-of v0, v10, Ljava/security/interfaces/ECPublicKey;

    if-eqz v0, :cond_d7

    .line 155
    invoke-static {v10}, Lorg/spongycastle/jcajce/provider/asymmetric/util/ECUtil;->generatePublicKeyParameter(Ljava/security/PublicKey;)Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;
    :try_end_d4
    .catch Ljava/lang/Exception; {:try_start_c5 .. :try_end_d4} :catch_a7

    move-result-object v0

    goto/16 :goto_39

    .line 164
    :cond_d7
    new-instance v0, Ljava/security/InvalidKeyException;

    const-string v1, "cannot identify EC public key."

    invoke-direct {v0, v1}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static getCurveName(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Ljava/lang/String;
    .registers 2
    .param p0, "oid"    # Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .prologue
    .line 373
    invoke-static {p0}, Lorg/spongycastle/asn1/x9/X962NamedCurves;->getName(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Ljava/lang/String;

    move-result-object v0

    .line 375
    .local v0, "name":Ljava/lang/String;
    if-nez v0, :cond_1c

    .line 377
    invoke-static {p0}, Lorg/spongycastle/asn1/sec/SECNamedCurves;->getName(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Ljava/lang/String;

    move-result-object v0

    .line 378
    if-nez v0, :cond_10

    .line 380
    invoke-static {p0}, Lorg/spongycastle/asn1/nist/NISTNamedCurves;->getName(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Ljava/lang/String;

    move-result-object v0

    .line 382
    :cond_10
    if-nez v0, :cond_16

    .line 384
    invoke-static {p0}, Lorg/spongycastle/asn1/teletrust/TeleTrusTNamedCurves;->getName(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Ljava/lang/String;

    move-result-object v0

    .line 386
    :cond_16
    if-nez v0, :cond_1c

    .line 388
    invoke-static {p0}, Lorg/spongycastle/asn1/cryptopro/ECGOST3410NamedCurves;->getName(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Ljava/lang/String;

    move-result-object v0

    .line 392
    :cond_1c
    return-object v0
.end method

.method public static getNamedCurveByName(Ljava/lang/String;)Lorg/spongycastle/asn1/x9/X9ECParameters;
    .registers 2
    .param p0, "curveName"    # Ljava/lang/String;

    .prologue
    .line 348
    invoke-static {p0}, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->getByName(Ljava/lang/String;)Lorg/spongycastle/asn1/x9/X9ECParameters;

    move-result-object v0

    .line 350
    .local v0, "params":Lorg/spongycastle/asn1/x9/X9ECParameters;
    if-nez v0, :cond_1c

    .line 352
    invoke-static {p0}, Lorg/spongycastle/asn1/x9/X962NamedCurves;->getByName(Ljava/lang/String;)Lorg/spongycastle/asn1/x9/X9ECParameters;

    move-result-object v0

    .line 353
    if-nez v0, :cond_10

    .line 355
    invoke-static {p0}, Lorg/spongycastle/asn1/sec/SECNamedCurves;->getByName(Ljava/lang/String;)Lorg/spongycastle/asn1/x9/X9ECParameters;

    move-result-object v0

    .line 357
    :cond_10
    if-nez v0, :cond_16

    .line 359
    invoke-static {p0}, Lorg/spongycastle/asn1/nist/NISTNamedCurves;->getByName(Ljava/lang/String;)Lorg/spongycastle/asn1/x9/X9ECParameters;

    move-result-object v0

    .line 361
    :cond_16
    if-nez v0, :cond_1c

    .line 363
    invoke-static {p0}, Lorg/spongycastle/asn1/teletrust/TeleTrusTNamedCurves;->getByName(Ljava/lang/String;)Lorg/spongycastle/asn1/x9/X9ECParameters;

    move-result-object v0

    .line 367
    :cond_1c
    return-object v0
.end method

.method public static getNamedCurveByOid(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Lorg/spongycastle/asn1/x9/X9ECParameters;
    .registers 2
    .param p0, "oid"    # Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .prologue
    .line 323
    invoke-static {p0}, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->getByOID(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Lorg/spongycastle/asn1/x9/X9ECParameters;

    move-result-object v0

    .line 325
    .local v0, "params":Lorg/spongycastle/asn1/x9/X9ECParameters;
    if-nez v0, :cond_1c

    .line 327
    invoke-static {p0}, Lorg/spongycastle/asn1/x9/X962NamedCurves;->getByOID(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Lorg/spongycastle/asn1/x9/X9ECParameters;

    move-result-object v0

    .line 328
    if-nez v0, :cond_10

    .line 330
    invoke-static {p0}, Lorg/spongycastle/asn1/sec/SECNamedCurves;->getByOID(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Lorg/spongycastle/asn1/x9/X9ECParameters;

    move-result-object v0

    .line 332
    :cond_10
    if-nez v0, :cond_16

    .line 334
    invoke-static {p0}, Lorg/spongycastle/asn1/nist/NISTNamedCurves;->getByOID(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Lorg/spongycastle/asn1/x9/X9ECParameters;

    move-result-object v0

    .line 336
    :cond_16
    if-nez v0, :cond_1c

    .line 338
    invoke-static {p0}, Lorg/spongycastle/asn1/teletrust/TeleTrusTNamedCurves;->getByOID(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Lorg/spongycastle/asn1/x9/X9ECParameters;

    move-result-object v0

    .line 342
    :cond_1c
    return-object v0
.end method

.method public static getNamedCurveOid(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .registers 5
    .param p0, "curveName"    # Ljava/lang/String;

    .prologue
    const/16 v3, 0x20

    .line 245
    invoke-virtual {p0, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    if-lez v2, :cond_2a

    .line 247
    invoke-virtual {p0, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 256
    .local v1, "name":Ljava/lang/String;
    :goto_12
    const/4 v2, 0x0

    :try_start_13
    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x30

    if-lt v2, v3, :cond_2c

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x32

    if-gt v2, v3, :cond_2c

    .line 258
    new-instance v2, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-direct {v2, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 267
    :goto_29
    return-object v2

    .line 251
    .end local v1    # "name":Ljava/lang/String;
    :cond_2a
    move-object v1, p0

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_12

    .line 262
    :cond_2c
    invoke-static {v1}, Lorg/spongycastle/jcajce/provider/asymmetric/util/ECUtil;->lookupOidByName(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    :try_end_2f
    .catch Ljava/lang/IllegalArgumentException; {:try_start_13 .. :try_end_2f} :catch_31

    move-result-object v2

    goto :goto_29

    .line 265
    :catch_31
    move-exception v0

    .line 267
    .local v0, "ex":Ljava/lang/IllegalArgumentException;
    invoke-static {v1}, Lorg/spongycastle/jcajce/provider/asymmetric/util/ECUtil;->lookupOidByName(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v2

    goto :goto_29
.end method

.method public static getNamedCurveOid(Lorg/spongycastle/jce/spec/ECParameterSpec;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .registers 6
    .param p0, "ecParameterSpec"    # Lorg/spongycastle/jce/spec/ECParameterSpec;

    .prologue
    .line 302
    invoke-static {}, Lorg/spongycastle/asn1/x9/ECNamedCurveTable;->getNames()Ljava/util/Enumeration;

    move-result-object v1

    .local v1, "names":Ljava/util/Enumeration;
    :cond_4
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_51

    .line 304
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 306
    .local v0, "name":Ljava/lang/String;
    invoke-static {v0}, Lorg/spongycastle/asn1/x9/ECNamedCurveTable;->getByName(Ljava/lang/String;)Lorg/spongycastle/asn1/x9/X9ECParameters;

    move-result-object v2

    .line 308
    .local v2, "params":Lorg/spongycastle/asn1/x9/X9ECParameters;
    invoke-virtual {v2}, Lorg/spongycastle/asn1/x9/X9ECParameters;->getN()Ljava/math/BigInteger;

    move-result-object v3

    invoke-virtual {p0}, Lorg/spongycastle/jce/spec/ECParameterSpec;->getN()Ljava/math/BigInteger;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 309
    invoke-virtual {v2}, Lorg/spongycastle/asn1/x9/X9ECParameters;->getH()Ljava/math/BigInteger;

    move-result-object v3

    invoke-virtual {p0}, Lorg/spongycastle/jce/spec/ECParameterSpec;->getH()Ljava/math/BigInteger;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 310
    invoke-virtual {v2}, Lorg/spongycastle/asn1/x9/X9ECParameters;->getCurve()Lorg/spongycastle/math/ec/ECCurve;

    move-result-object v3

    invoke-virtual {p0}, Lorg/spongycastle/jce/spec/ECParameterSpec;->getCurve()Lorg/spongycastle/math/ec/ECCurve;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/spongycastle/math/ec/ECCurve;->equals(Lorg/spongycastle/math/ec/ECCurve;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 311
    invoke-virtual {v2}, Lorg/spongycastle/asn1/x9/X9ECParameters;->getG()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v3

    invoke-virtual {p0}, Lorg/spongycastle/jce/spec/ECParameterSpec;->getG()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/spongycastle/math/ec/ECPoint;->equals(Lorg/spongycastle/math/ec/ECPoint;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 313
    invoke-static {v0}, Lorg/spongycastle/asn1/x9/ECNamedCurveTable;->getOID(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v3

    .line 317
    .end local v0    # "name":Ljava/lang/String;
    .end local v2    # "params":Lorg/spongycastle/asn1/x9/X9ECParameters;
    :goto_50
    return-object v3

    :cond_51
    const/4 v3, 0x0

    goto :goto_50
.end method

.method public static getOrderBitLength(Ljava/math/BigInteger;Ljava/math/BigInteger;)I
    .registers 4
    .param p0, "order"    # Ljava/math/BigInteger;
    .param p1, "privateValue"    # Ljava/math/BigInteger;

    .prologue
    .line 223
    if-nez p0, :cond_18

    .line 225
    sget-object v1, Lorg/spongycastle/jce/provider/BouncyCastleProvider;->CONFIGURATION:Lorg/spongycastle/jcajce/provider/config/ProviderConfiguration;

    invoke-interface {v1}, Lorg/spongycastle/jcajce/provider/config/ProviderConfiguration;->getEcImplicitlyCa()Lorg/spongycastle/jce/spec/ECParameterSpec;

    move-result-object v0

    .line 227
    .local v0, "implicitCA":Lorg/spongycastle/jce/spec/ECParameterSpec;
    if-nez v0, :cond_f

    .line 229
    invoke-virtual {p1}, Ljava/math/BigInteger;->bitLength()I

    move-result v1

    .line 236
    .end local v0    # "implicitCA":Lorg/spongycastle/jce/spec/ECParameterSpec;
    :goto_e
    return v1

    .line 232
    .restart local v0    # "implicitCA":Lorg/spongycastle/jce/spec/ECParameterSpec;
    :cond_f
    invoke-virtual {v0}, Lorg/spongycastle/jce/spec/ECParameterSpec;->getN()Ljava/math/BigInteger;

    move-result-object v1

    invoke-virtual {v1}, Ljava/math/BigInteger;->bitLength()I

    move-result v1

    goto :goto_e

    .line 236
    .end local v0    # "implicitCA":Lorg/spongycastle/jce/spec/ECParameterSpec;
    :cond_18
    invoke-virtual {p0}, Ljava/math/BigInteger;->bitLength()I

    move-result v1

    goto :goto_e
.end method

.method private static lookupOidByName(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 273
    invoke-static {p0}, Lorg/spongycastle/asn1/x9/X962NamedCurves;->getOID(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v0

    .line 275
    .local v0, "oid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    if-nez v0, :cond_22

    .line 277
    invoke-static {p0}, Lorg/spongycastle/asn1/sec/SECNamedCurves;->getOID(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v0

    .line 278
    if-nez v0, :cond_10

    .line 280
    invoke-static {p0}, Lorg/spongycastle/asn1/nist/NISTNamedCurves;->getOID(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v0

    .line 282
    :cond_10
    if-nez v0, :cond_16

    .line 284
    invoke-static {p0}, Lorg/spongycastle/asn1/teletrust/TeleTrusTNamedCurves;->getOID(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v0

    .line 286
    :cond_16
    if-nez v0, :cond_1c

    .line 288
    invoke-static {p0}, Lorg/spongycastle/asn1/cryptopro/ECGOST3410NamedCurves;->getOID(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v0

    .line 290
    :cond_1c
    if-nez v0, :cond_22

    .line 292
    invoke-static {p0}, Lorg/spongycastle/asn1/anssi/ANSSINamedCurves;->getOID(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v0

    .line 296
    :cond_22
    return-object v0
.end method
