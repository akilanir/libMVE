.class public Lorg/spongycastle/jcajce/provider/symmetric/util/BaseMac;
.super Ljavax/crypto/MacSpi;
.source "BaseMac.java"

# interfaces
.implements Lorg/spongycastle/jcajce/provider/symmetric/util/PBE;


# instance fields
.field private keySize:I

.field private macEngine:Lorg/spongycastle/crypto/Mac;

.field private pbeHash:I

.field private scheme:I


# direct methods
.method protected constructor <init>(Lorg/spongycastle/crypto/Mac;)V
    .registers 3
    .param p1, "macEngine"    # Lorg/spongycastle/crypto/Mac;

    .prologue
    .line 36
    invoke-direct {p0}, Ljavax/crypto/MacSpi;-><init>()V

    .line 30
    const/4 v0, 0x2

    iput v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseMac;->scheme:I

    .line 31
    const/4 v0, 0x1

    iput v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseMac;->pbeHash:I

    .line 32
    const/16 v0, 0xa0

    iput v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseMac;->keySize:I

    .line 37
    iput-object p1, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseMac;->macEngine:Lorg/spongycastle/crypto/Mac;

    .line 38
    return-void
.end method

.method protected constructor <init>(Lorg/spongycastle/crypto/Mac;III)V
    .registers 6
    .param p1, "macEngine"    # Lorg/spongycastle/crypto/Mac;
    .param p2, "scheme"    # I
    .param p3, "pbeHash"    # I
    .param p4, "keySize"    # I

    .prologue
    .line 45
    invoke-direct {p0}, Ljavax/crypto/MacSpi;-><init>()V

    .line 30
    const/4 v0, 0x2

    iput v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseMac;->scheme:I

    .line 31
    const/4 v0, 0x1

    iput v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseMac;->pbeHash:I

    .line 32
    const/16 v0, 0xa0

    iput v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseMac;->keySize:I

    .line 46
    iput-object p1, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseMac;->macEngine:Lorg/spongycastle/crypto/Mac;

    .line 47
    iput p2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseMac;->scheme:I

    .line 48
    iput p3, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseMac;->pbeHash:I

    .line 49
    iput p4, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseMac;->keySize:I

    .line 50
    return-void
.end method

.method private static copyMap(Ljava/util/Map;)Ljava/util/Hashtable;
    .registers 5
    .param p0, "paramsMap"    # Ljava/util/Map;

    .prologue
    .line 179
    new-instance v2, Ljava/util/Hashtable;

    invoke-direct {v2}, Ljava/util/Hashtable;-><init>()V

    .line 181
    .local v2, "newTable":Ljava/util/Hashtable;
    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 182
    .local v1, "keys":Ljava/util/Iterator;
    :goto_d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1f

    .line 184
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 185
    .local v0, "key":Ljava/lang/Object;
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v0, v3}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_d

    .line 188
    .end local v0    # "key":Ljava/lang/Object;
    :cond_1f
    return-object v2
.end method


# virtual methods
.method protected engineDoFinal()[B
    .registers 4

    .prologue
    .line 170
    invoke-virtual {p0}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseMac;->engineGetMacLength()I

    move-result v1

    new-array v0, v1, [B

    .line 172
    .local v0, "out":[B
    iget-object v1, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseMac;->macEngine:Lorg/spongycastle/crypto/Mac;

    const/4 v2, 0x0

    invoke-interface {v1, v0, v2}, Lorg/spongycastle/crypto/Mac;->doFinal([BI)I

    .line 174
    return-object v0
.end method

.method protected engineGetMacLength()I
    .registers 2

    .prologue
    .line 146
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseMac;->macEngine:Lorg/spongycastle/crypto/Mac;

    invoke-interface {v0}, Lorg/spongycastle/crypto/Mac;->getMacSize()I

    move-result v0

    return v0
.end method

.method protected engineInit(Ljava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V
    .registers 12
    .param p1, "key"    # Ljava/security/Key;
    .param p2, "params"    # Ljava/security/spec/AlgorithmParameterSpec;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidKeyException;,
            Ljava/security/InvalidAlgorithmParameterException;
        }
    .end annotation

    .prologue
    .line 59
    if-nez p1, :cond_a

    .line 61
    new-instance v7, Ljava/security/InvalidKeyException;

    const-string v8, "key is null"

    invoke-direct {v7, v8}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 64
    :cond_a
    instance-of v7, p1, Lorg/spongycastle/jcajce/PKCS12Key;

    if-eqz v7, :cond_72

    .line 71
    :try_start_e
    move-object v0, p1

    check-cast v0, Ljavax/crypto/SecretKey;

    move-object v3, v0
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_12} :catch_4e

    .line 80
    .local v3, "k":Ljavax/crypto/SecretKey;
    :try_start_12
    move-object v0, p2

    check-cast v0, Ljavax/crypto/spec/PBEParameterSpec;

    move-object v6, v0
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_16} :catch_57

    .line 87
    .local v6, "pbeSpec":Ljavax/crypto/spec/PBEParameterSpec;
    instance-of v7, v3, Ljavax/crypto/interfaces/PBEKey;

    if-eqz v7, :cond_2f

    if-nez v6, :cond_2f

    .line 89
    new-instance v6, Ljavax/crypto/spec/PBEParameterSpec;

    .end local v6    # "pbeSpec":Ljavax/crypto/spec/PBEParameterSpec;
    move-object v7, v3

    check-cast v7, Ljavax/crypto/interfaces/PBEKey;

    invoke-interface {v7}, Ljavax/crypto/interfaces/PBEKey;->getSalt()[B

    move-result-object v8

    move-object v7, v3

    check-cast v7, Ljavax/crypto/interfaces/PBEKey;

    invoke-interface {v7}, Ljavax/crypto/interfaces/PBEKey;->getIterationCount()I

    move-result v7

    invoke-direct {v6, v8, v7}, Ljavax/crypto/spec/PBEParameterSpec;-><init>([BI)V

    .line 92
    .restart local v6    # "pbeSpec":Ljavax/crypto/spec/PBEParameterSpec;
    :cond_2f
    const/4 v1, 0x1

    .line 93
    .local v1, "digest":I
    const/16 v4, 0xa0

    .line 94
    .local v4, "keySize":I
    iget-object v7, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseMac;->macEngine:Lorg/spongycastle/crypto/Mac;

    invoke-interface {v7}, Lorg/spongycastle/crypto/Mac;->getAlgorithmName()Ljava/lang/String;

    move-result-object v7

    const-string v8, "GOST"

    invoke-virtual {v7, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_60

    .line 96
    const/4 v1, 0x6

    .line 97
    const/16 v4, 0x100

    .line 105
    :cond_43
    :goto_43
    const/4 v7, 0x2

    invoke-static {v3, v7, v1, v4, v6}, Lorg/spongycastle/jcajce/provider/symmetric/util/PBE$Util;->makePBEMacParameters(Ljavax/crypto/SecretKey;IIILjavax/crypto/spec/PBEParameterSpec;)Lorg/spongycastle/crypto/CipherParameters;

    move-result-object v5

    .line 141
    .end local v1    # "digest":I
    .end local v3    # "k":Ljavax/crypto/SecretKey;
    .end local v4    # "keySize":I
    .end local v6    # "pbeSpec":Ljavax/crypto/spec/PBEParameterSpec;
    .end local p2    # "params":Ljava/security/spec/AlgorithmParameterSpec;
    .local v5, "param":Lorg/spongycastle/crypto/CipherParameters;
    :goto_48
    iget-object v7, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseMac;->macEngine:Lorg/spongycastle/crypto/Mac;

    invoke-interface {v7, v5}, Lorg/spongycastle/crypto/Mac;->init(Lorg/spongycastle/crypto/CipherParameters;)V

    .line 142
    return-void

    .line 73
    .end local v5    # "param":Lorg/spongycastle/crypto/CipherParameters;
    .restart local p2    # "params":Ljava/security/spec/AlgorithmParameterSpec;
    :catch_4e
    move-exception v2

    .line 75
    .local v2, "e":Ljava/lang/Exception;
    new-instance v7, Ljava/security/InvalidKeyException;

    const-string v8, "PKCS12 requires a SecretKey/PBEKey"

    invoke-direct {v7, v8}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 82
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v3    # "k":Ljavax/crypto/SecretKey;
    :catch_57
    move-exception v2

    .line 84
    .restart local v2    # "e":Ljava/lang/Exception;
    new-instance v7, Ljava/security/InvalidAlgorithmParameterException;

    const-string v8, "PKCS12 requires a PBEParameterSpec"

    invoke-direct {v7, v8}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 99
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v1    # "digest":I
    .restart local v4    # "keySize":I
    .restart local v6    # "pbeSpec":Ljavax/crypto/spec/PBEParameterSpec;
    :cond_60
    iget-object v7, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseMac;->macEngine:Lorg/spongycastle/crypto/Mac;

    invoke-interface {v7}, Lorg/spongycastle/crypto/Mac;->getAlgorithmName()Ljava/lang/String;

    move-result-object v7

    const-string v8, "SHA256"

    invoke-virtual {v7, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_43

    .line 101
    const/4 v1, 0x4

    .line 102
    const/16 v4, 0x100

    goto :goto_43

    .line 107
    .end local v1    # "digest":I
    .end local v3    # "k":Ljavax/crypto/SecretKey;
    .end local v4    # "keySize":I
    .end local v6    # "pbeSpec":Ljavax/crypto/spec/PBEParameterSpec;
    :cond_72
    instance-of v7, p1, Lorg/spongycastle/jcajce/provider/symmetric/util/BCPBEKey;

    if-eqz v7, :cond_95

    move-object v3, p1

    .line 109
    check-cast v3, Lorg/spongycastle/jcajce/provider/symmetric/util/BCPBEKey;

    .line 111
    .local v3, "k":Lorg/spongycastle/jcajce/provider/symmetric/util/BCPBEKey;
    invoke-virtual {v3}, Lorg/spongycastle/jcajce/provider/symmetric/util/BCPBEKey;->getParam()Lorg/spongycastle/crypto/CipherParameters;

    move-result-object v7

    if-eqz v7, :cond_84

    .line 113
    invoke-virtual {v3}, Lorg/spongycastle/jcajce/provider/symmetric/util/BCPBEKey;->getParam()Lorg/spongycastle/crypto/CipherParameters;

    move-result-object v5

    .restart local v5    # "param":Lorg/spongycastle/crypto/CipherParameters;
    goto :goto_48

    .line 115
    .end local v5    # "param":Lorg/spongycastle/crypto/CipherParameters;
    :cond_84
    instance-of v7, p2, Ljavax/crypto/spec/PBEParameterSpec;

    if-eqz v7, :cond_8d

    .line 117
    invoke-static {v3, p2}, Lorg/spongycastle/jcajce/provider/symmetric/util/PBE$Util;->makePBEMacParameters(Lorg/spongycastle/jcajce/provider/symmetric/util/BCPBEKey;Ljava/security/spec/AlgorithmParameterSpec;)Lorg/spongycastle/crypto/CipherParameters;

    move-result-object v5

    .restart local v5    # "param":Lorg/spongycastle/crypto/CipherParameters;
    goto :goto_48

    .line 121
    .end local v5    # "param":Lorg/spongycastle/crypto/CipherParameters;
    :cond_8d
    new-instance v7, Ljava/security/InvalidAlgorithmParameterException;

    const-string v8, "PBE requires PBE parameters to be set."

    invoke-direct {v7, v8}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 124
    .end local v3    # "k":Lorg/spongycastle/jcajce/provider/symmetric/util/BCPBEKey;
    :cond_95
    instance-of v7, p2, Ljavax/crypto/spec/IvParameterSpec;

    if-eqz v7, :cond_ae

    .line 126
    new-instance v5, Lorg/spongycastle/crypto/params/ParametersWithIV;

    new-instance v7, Lorg/spongycastle/crypto/params/KeyParameter;

    invoke-interface {p1}, Ljava/security/Key;->getEncoded()[B

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/spongycastle/crypto/params/KeyParameter;-><init>([B)V

    check-cast p2, Ljavax/crypto/spec/IvParameterSpec;

    .end local p2    # "params":Ljava/security/spec/AlgorithmParameterSpec;
    invoke-virtual {p2}, Ljavax/crypto/spec/IvParameterSpec;->getIV()[B

    move-result-object v8

    invoke-direct {v5, v7, v8}, Lorg/spongycastle/crypto/params/ParametersWithIV;-><init>(Lorg/spongycastle/crypto/CipherParameters;[B)V

    .restart local v5    # "param":Lorg/spongycastle/crypto/CipherParameters;
    goto :goto_48

    .line 128
    .end local v5    # "param":Lorg/spongycastle/crypto/CipherParameters;
    .restart local p2    # "params":Ljava/security/spec/AlgorithmParameterSpec;
    :cond_ae
    instance-of v7, p2, Lorg/spongycastle/jcajce/spec/SkeinParameterSpec;

    if-eqz v7, :cond_cf

    .line 130
    new-instance v7, Lorg/spongycastle/crypto/params/SkeinParameters$Builder;

    check-cast p2, Lorg/spongycastle/jcajce/spec/SkeinParameterSpec;

    .end local p2    # "params":Ljava/security/spec/AlgorithmParameterSpec;
    invoke-virtual {p2}, Lorg/spongycastle/jcajce/spec/SkeinParameterSpec;->getParameters()Ljava/util/Map;

    move-result-object v8

    invoke-static {v8}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseMac;->copyMap(Ljava/util/Map;)Ljava/util/Hashtable;

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/spongycastle/crypto/params/SkeinParameters$Builder;-><init>(Ljava/util/Hashtable;)V

    invoke-interface {p1}, Ljava/security/Key;->getEncoded()[B

    move-result-object v8

    invoke-virtual {v7, v8}, Lorg/spongycastle/crypto/params/SkeinParameters$Builder;->setKey([B)Lorg/spongycastle/crypto/params/SkeinParameters$Builder;

    move-result-object v7

    invoke-virtual {v7}, Lorg/spongycastle/crypto/params/SkeinParameters$Builder;->build()Lorg/spongycastle/crypto/params/SkeinParameters;

    move-result-object v5

    .restart local v5    # "param":Lorg/spongycastle/crypto/CipherParameters;
    goto/16 :goto_48

    .line 132
    .end local v5    # "param":Lorg/spongycastle/crypto/CipherParameters;
    .restart local p2    # "params":Ljava/security/spec/AlgorithmParameterSpec;
    :cond_cf
    if-nez p2, :cond_dc

    .line 134
    new-instance v5, Lorg/spongycastle/crypto/params/KeyParameter;

    invoke-interface {p1}, Ljava/security/Key;->getEncoded()[B

    move-result-object v7

    invoke-direct {v5, v7}, Lorg/spongycastle/crypto/params/KeyParameter;-><init>([B)V

    .restart local v5    # "param":Lorg/spongycastle/crypto/CipherParameters;
    goto/16 :goto_48

    .line 138
    .end local v5    # "param":Lorg/spongycastle/crypto/CipherParameters;
    :cond_dc
    new-instance v7, Ljava/security/InvalidAlgorithmParameterException;

    const-string v8, "unknown parameter type."

    invoke-direct {v7, v8}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    throw v7
.end method

.method protected engineReset()V
    .registers 2

    .prologue
    .line 151
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseMac;->macEngine:Lorg/spongycastle/crypto/Mac;

    invoke-interface {v0}, Lorg/spongycastle/crypto/Mac;->reset()V

    .line 152
    return-void
.end method

.method protected engineUpdate(B)V
    .registers 3
    .param p1, "input"    # B

    .prologue
    .line 157
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseMac;->macEngine:Lorg/spongycastle/crypto/Mac;

    invoke-interface {v0, p1}, Lorg/spongycastle/crypto/Mac;->update(B)V

    .line 158
    return-void
.end method

.method protected engineUpdate([BII)V
    .registers 5
    .param p1, "input"    # [B
    .param p2, "offset"    # I
    .param p3, "len"    # I

    .prologue
    .line 165
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseMac;->macEngine:Lorg/spongycastle/crypto/Mac;

    invoke-interface {v0, p1, p2, p3}, Lorg/spongycastle/crypto/Mac;->update([BII)V

    .line 166
    return-void
.end method
