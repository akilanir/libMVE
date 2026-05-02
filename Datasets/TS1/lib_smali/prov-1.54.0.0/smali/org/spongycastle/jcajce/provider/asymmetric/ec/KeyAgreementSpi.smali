.class public Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi;
.super Lorg/spongycastle/jcajce/provider/asymmetric/util/BaseAgreementSpi;
.source "KeyAgreementSpi.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi$MQVwithSHA512CKDF;,
        Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi$MQVwithSHA384CKDF;,
        Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi$MQVwithSHA256CKDF;,
        Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi$MQVwithSHA224CKDF;,
        Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi$MQVwithSHA1CKDF;,
        Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi$DHwithSHA512CKDF;,
        Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi$DHwithSHA384CKDF;,
        Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi$DHwithSHA256CKDF;,
        Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi$DHwithSHA1CKDF;,
        Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi$MQVwithSHA512KDFAndSharedInfo;,
        Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi$MQVwithSHA384KDFAndSharedInfo;,
        Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi$MQVwithSHA256KDFAndSharedInfo;,
        Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi$MQVwithSHA224KDFAndSharedInfo;,
        Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi$MQVwithSHA1KDFAndSharedInfo;,
        Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi$CDHwithSHA512KDFAndSharedInfo;,
        Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi$DHwithSHA512KDFAndSharedInfo;,
        Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi$CDHwithSHA384KDFAndSharedInfo;,
        Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi$DHwithSHA384KDFAndSharedInfo;,
        Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi$CDHwithSHA256KDFAndSharedInfo;,
        Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi$DHwithSHA256KDFAndSharedInfo;,
        Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi$CDHwithSHA224KDFAndSharedInfo;,
        Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi$DHwithSHA224KDFAndSharedInfo;,
        Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi$CDHwithSHA1KDFAndSharedInfo;,
        Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi$DHwithSHA1KDFAndSharedInfo;,
        Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi$DHwithSHA1KDF;,
        Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi$MQV;,
        Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi$DHC;,
        Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi$DH;
    }
.end annotation


# static fields
.field private static final converter:Lorg/spongycastle/asn1/x9/X9IntegerConverter;


# instance fields
.field private agreement:Lorg/spongycastle/crypto/BasicAgreement;

.field private kaAlgorithm:Ljava/lang/String;

.field private mqvParameters:Lorg/spongycastle/jcajce/spec/MQVParameterSpec;

.field private parameters:Lorg/spongycastle/crypto/params/ECDomainParameters;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 49
    new-instance v0, Lorg/spongycastle/asn1/x9/X9IntegerConverter;

    invoke-direct {v0}, Lorg/spongycastle/asn1/x9/X9IntegerConverter;-><init>()V

    sput-object v0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi;->converter:Lorg/spongycastle/asn1/x9/X9IntegerConverter;

    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;Lorg/spongycastle/crypto/BasicAgreement;Lorg/spongycastle/crypto/DerivationFunction;)V
    .registers 4
    .param p1, "kaAlgorithm"    # Ljava/lang/String;
    .param p2, "agreement"    # Lorg/spongycastle/crypto/BasicAgreement;
    .param p3, "kdf"    # Lorg/spongycastle/crypto/DerivationFunction;

    .prologue
    .line 63
    invoke-direct {p0, p1, p3}, Lorg/spongycastle/jcajce/provider/asymmetric/util/BaseAgreementSpi;-><init>(Ljava/lang/String;Lorg/spongycastle/crypto/DerivationFunction;)V

    .line 65
    iput-object p1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi;->kaAlgorithm:Ljava/lang/String;

    .line 66
    iput-object p2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi;->agreement:Lorg/spongycastle/crypto/BasicAgreement;

    .line 67
    return-void
.end method

.method private static getSimpleName(Ljava/lang/Class;)Ljava/lang/String;
    .registers 3
    .param p0, "clazz"    # Ljava/lang/Class;

    .prologue
    .line 228
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 230
    .local v0, "fullName":Ljava/lang/String;
    const/16 v1, 0x2e

    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private initFromKey(Ljava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V
    .registers 13
    .param p1, "key"    # Ljava/security/Key;
    .param p2, "parameterSpec"    # Ljava/security/spec/AlgorithmParameterSpec;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 158
    iget-object v8, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi;->agreement:Lorg/spongycastle/crypto/BasicAgreement;

    instance-of v8, v8, Lorg/spongycastle/crypto/agreement/ECMQVBasicAgreement;

    if-eqz v8, :cond_a8

    .line 160
    iput-object v7, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi;->mqvParameters:Lorg/spongycastle/jcajce/spec/MQVParameterSpec;

    .line 161
    instance-of v7, p1, Lorg/spongycastle/jce/interfaces/MQVPrivateKey;

    if-nez v7, :cond_3c

    instance-of v7, p2, Lorg/spongycastle/jcajce/spec/MQVParameterSpec;

    if-nez v7, :cond_3c

    .line 163
    new-instance v7, Ljava/security/InvalidKeyException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v9, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi;->kaAlgorithm:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " key agreement requires "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-class v9, Lorg/spongycastle/jcajce/spec/MQVParameterSpec;

    .line 164
    invoke-static {v9}, Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi;->getSimpleName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " for initialisation"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 170
    :cond_3c
    instance-of v7, p1, Lorg/spongycastle/jce/interfaces/MQVPrivateKey;

    if-eqz v7, :cond_79

    move-object v4, p1

    .line 172
    check-cast v4, Lorg/spongycastle/jce/interfaces/MQVPrivateKey;

    .line 174
    .local v4, "mqvPrivKey":Lorg/spongycastle/jce/interfaces/MQVPrivateKey;
    invoke-interface {v4}, Lorg/spongycastle/jce/interfaces/MQVPrivateKey;->getStaticPrivateKey()Ljava/security/PrivateKey;

    move-result-object v7

    invoke-static {v7}, Lorg/spongycastle/jcajce/provider/asymmetric/util/ECUtil;->generatePrivateKeyParameter(Ljava/security/PrivateKey;)Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    move-result-object v6

    check-cast v6, Lorg/spongycastle/crypto/params/ECPrivateKeyParameters;

    .line 176
    .local v6, "staticPrivKey":Lorg/spongycastle/crypto/params/ECPrivateKeyParameters;
    invoke-interface {v4}, Lorg/spongycastle/jce/interfaces/MQVPrivateKey;->getEphemeralPrivateKey()Ljava/security/PrivateKey;

    move-result-object v7

    invoke-static {v7}, Lorg/spongycastle/jcajce/provider/asymmetric/util/ECUtil;->generatePrivateKeyParameter(Ljava/security/PrivateKey;)Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/crypto/params/ECPrivateKeyParameters;

    .line 178
    .local v0, "ephemPrivKey":Lorg/spongycastle/crypto/params/ECPrivateKeyParameters;
    const/4 v1, 0x0

    .line 179
    .local v1, "ephemPubKey":Lorg/spongycastle/crypto/params/ECPublicKeyParameters;
    invoke-interface {v4}, Lorg/spongycastle/jce/interfaces/MQVPrivateKey;->getEphemeralPublicKey()Ljava/security/PublicKey;

    move-result-object v7

    if-eqz v7, :cond_68

    .line 182
    invoke-interface {v4}, Lorg/spongycastle/jce/interfaces/MQVPrivateKey;->getEphemeralPublicKey()Ljava/security/PublicKey;

    move-result-object v7

    invoke-static {v7}, Lorg/spongycastle/jcajce/provider/asymmetric/util/ECUtil;->generatePublicKeyParameter(Ljava/security/PublicKey;)Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    move-result-object v1

    .end local v1    # "ephemPubKey":Lorg/spongycastle/crypto/params/ECPublicKeyParameters;
    check-cast v1, Lorg/spongycastle/crypto/params/ECPublicKeyParameters;

    .line 204
    .end local v4    # "mqvPrivKey":Lorg/spongycastle/jce/interfaces/MQVPrivateKey;
    .end local p1    # "key":Ljava/security/Key;
    .restart local v1    # "ephemPubKey":Lorg/spongycastle/crypto/params/ECPublicKeyParameters;
    :cond_68
    :goto_68
    new-instance v2, Lorg/spongycastle/crypto/params/MQVPrivateParameters;

    invoke-direct {v2, v6, v0, v1}, Lorg/spongycastle/crypto/params/MQVPrivateParameters;-><init>(Lorg/spongycastle/crypto/params/ECPrivateKeyParameters;Lorg/spongycastle/crypto/params/ECPrivateKeyParameters;Lorg/spongycastle/crypto/params/ECPublicKeyParameters;)V

    .line 205
    .local v2, "localParams":Lorg/spongycastle/crypto/params/MQVPrivateParameters;
    invoke-virtual {v6}, Lorg/spongycastle/crypto/params/ECPrivateKeyParameters;->getParameters()Lorg/spongycastle/crypto/params/ECDomainParameters;

    move-result-object v7

    iput-object v7, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi;->parameters:Lorg/spongycastle/crypto/params/ECDomainParameters;

    .line 209
    iget-object v7, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi;->agreement:Lorg/spongycastle/crypto/BasicAgreement;

    invoke-interface {v7, v2}, Lorg/spongycastle/crypto/BasicAgreement;->init(Lorg/spongycastle/crypto/CipherParameters;)V

    .line 224
    .end local v0    # "ephemPrivKey":Lorg/spongycastle/crypto/params/ECPrivateKeyParameters;
    .end local v1    # "ephemPubKey":Lorg/spongycastle/crypto/params/ECPublicKeyParameters;
    .end local v2    # "localParams":Lorg/spongycastle/crypto/params/MQVPrivateParameters;
    .end local v6    # "staticPrivKey":Lorg/spongycastle/crypto/params/ECPrivateKeyParameters;
    .end local p2    # "parameterSpec":Ljava/security/spec/AlgorithmParameterSpec;
    :goto_78
    return-void

    .restart local p1    # "key":Ljava/security/Key;
    .restart local p2    # "parameterSpec":Ljava/security/spec/AlgorithmParameterSpec;
    :cond_79
    move-object v3, p2

    .line 187
    check-cast v3, Lorg/spongycastle/jcajce/spec/MQVParameterSpec;

    .line 189
    .local v3, "mqvParameterSpec":Lorg/spongycastle/jcajce/spec/MQVParameterSpec;
    check-cast p1, Ljava/security/PrivateKey;

    .line 190
    .end local p1    # "key":Ljava/security/Key;
    invoke-static {p1}, Lorg/spongycastle/jcajce/provider/asymmetric/util/ECUtil;->generatePrivateKeyParameter(Ljava/security/PrivateKey;)Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    move-result-object v6

    check-cast v6, Lorg/spongycastle/crypto/params/ECPrivateKeyParameters;

    .line 192
    .restart local v6    # "staticPrivKey":Lorg/spongycastle/crypto/params/ECPrivateKeyParameters;
    invoke-virtual {v3}, Lorg/spongycastle/jcajce/spec/MQVParameterSpec;->getEphemeralPrivateKey()Ljava/security/PrivateKey;

    move-result-object v7

    invoke-static {v7}, Lorg/spongycastle/jcajce/provider/asymmetric/util/ECUtil;->generatePrivateKeyParameter(Ljava/security/PrivateKey;)Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/crypto/params/ECPrivateKeyParameters;

    .line 194
    .restart local v0    # "ephemPrivKey":Lorg/spongycastle/crypto/params/ECPrivateKeyParameters;
    const/4 v1, 0x0

    .line 195
    .restart local v1    # "ephemPubKey":Lorg/spongycastle/crypto/params/ECPublicKeyParameters;
    invoke-virtual {v3}, Lorg/spongycastle/jcajce/spec/MQVParameterSpec;->getEphemeralPublicKey()Ljava/security/PublicKey;

    move-result-object v7

    if-eqz v7, :cond_9f

    .line 198
    invoke-virtual {v3}, Lorg/spongycastle/jcajce/spec/MQVParameterSpec;->getEphemeralPublicKey()Ljava/security/PublicKey;

    move-result-object v7

    invoke-static {v7}, Lorg/spongycastle/jcajce/provider/asymmetric/util/ECUtil;->generatePublicKeyParameter(Ljava/security/PublicKey;)Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    move-result-object v1

    .end local v1    # "ephemPubKey":Lorg/spongycastle/crypto/params/ECPublicKeyParameters;
    check-cast v1, Lorg/spongycastle/crypto/params/ECPublicKeyParameters;

    .line 200
    .restart local v1    # "ephemPubKey":Lorg/spongycastle/crypto/params/ECPublicKeyParameters;
    :cond_9f
    iput-object v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi;->mqvParameters:Lorg/spongycastle/jcajce/spec/MQVParameterSpec;

    .line 201
    invoke-virtual {v3}, Lorg/spongycastle/jcajce/spec/MQVParameterSpec;->getUserKeyingMaterial()[B

    move-result-object v7

    iput-object v7, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi;->ukmParameters:[B

    goto :goto_68

    .line 213
    .end local v0    # "ephemPrivKey":Lorg/spongycastle/crypto/params/ECPrivateKeyParameters;
    .end local v1    # "ephemPubKey":Lorg/spongycastle/crypto/params/ECPublicKeyParameters;
    .end local v3    # "mqvParameterSpec":Lorg/spongycastle/jcajce/spec/MQVParameterSpec;
    .end local v6    # "staticPrivKey":Lorg/spongycastle/crypto/params/ECPrivateKeyParameters;
    .restart local p1    # "key":Ljava/security/Key;
    :cond_a8
    instance-of v8, p1, Ljava/security/PrivateKey;

    if-nez v8, :cond_d7

    .line 215
    new-instance v7, Ljava/security/InvalidKeyException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v9, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi;->kaAlgorithm:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " key agreement requires "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-class v9, Lorg/spongycastle/jce/interfaces/ECPrivateKey;

    .line 216
    invoke-static {v9}, Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi;->getSimpleName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " for initialisation"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 219
    :cond_d7
    check-cast p1, Ljava/security/PrivateKey;

    .end local p1    # "key":Ljava/security/Key;
    invoke-static {p1}, Lorg/spongycastle/jcajce/provider/asymmetric/util/ECUtil;->generatePrivateKeyParameter(Ljava/security/PrivateKey;)Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    move-result-object v5

    check-cast v5, Lorg/spongycastle/crypto/params/ECPrivateKeyParameters;

    .line 220
    .local v5, "privKey":Lorg/spongycastle/crypto/params/ECPrivateKeyParameters;
    invoke-virtual {v5}, Lorg/spongycastle/crypto/params/ECPrivateKeyParameters;->getParameters()Lorg/spongycastle/crypto/params/ECDomainParameters;

    move-result-object v8

    iput-object v8, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi;->parameters:Lorg/spongycastle/crypto/params/ECDomainParameters;

    .line 221
    instance-of v8, p2, Lorg/spongycastle/jcajce/spec/UserKeyingMaterialSpec;

    if-eqz v8, :cond_ef

    check-cast p2, Lorg/spongycastle/jcajce/spec/UserKeyingMaterialSpec;

    .end local p2    # "parameterSpec":Ljava/security/spec/AlgorithmParameterSpec;
    invoke-virtual {p2}, Lorg/spongycastle/jcajce/spec/UserKeyingMaterialSpec;->getUserKeyingMaterial()[B

    move-result-object v7

    :cond_ef
    iput-object v7, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi;->ukmParameters:[B

    .line 222
    iget-object v7, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi;->agreement:Lorg/spongycastle/crypto/BasicAgreement;

    invoke-interface {v7, v5}, Lorg/spongycastle/crypto/BasicAgreement;->init(Lorg/spongycastle/crypto/CipherParameters;)V

    goto :goto_78
.end method


# virtual methods
.method protected bigIntToBytes(Ljava/math/BigInteger;)[B
    .registers 5
    .param p1, "r"    # Ljava/math/BigInteger;

    .prologue
    .line 72
    sget-object v0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi;->converter:Lorg/spongycastle/asn1/x9/X9IntegerConverter;

    sget-object v1, Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi;->converter:Lorg/spongycastle/asn1/x9/X9IntegerConverter;

    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi;->parameters:Lorg/spongycastle/crypto/params/ECDomainParameters;

    invoke-virtual {v2}, Lorg/spongycastle/crypto/params/ECDomainParameters;->getCurve()Lorg/spongycastle/math/ec/ECCurve;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/spongycastle/asn1/x9/X9IntegerConverter;->getByteLength(Lorg/spongycastle/math/ec/ECCurve;)I

    move-result v1

    invoke-virtual {v0, p1, v1}, Lorg/spongycastle/asn1/x9/X9IntegerConverter;->integerToBytes(Ljava/math/BigInteger;I)[B

    move-result-object v0

    return-object v0
.end method

.method protected engineDoPhase(Ljava/security/Key;Z)Ljava/security/Key;
    .registers 10
    .param p1, "key"    # Ljava/security/Key;
    .param p2, "lastPhase"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidKeyException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .prologue
    .line 80
    iget-object v4, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi;->parameters:Lorg/spongycastle/crypto/params/ECDomainParameters;

    if-nez v4, :cond_1f

    .line 82
    new-instance v4, Ljava/lang/IllegalStateException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi;->kaAlgorithm:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " not initialised."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 85
    :cond_1f
    if-nez p2, :cond_3c

    .line 87
    new-instance v4, Ljava/lang/IllegalStateException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi;->kaAlgorithm:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " can only be between two parties."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 91
    :cond_3c
    iget-object v4, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi;->agreement:Lorg/spongycastle/crypto/BasicAgreement;

    instance-of v4, v4, Lorg/spongycastle/crypto/agreement/ECMQVBasicAgreement;

    if-eqz v4, :cond_86

    .line 93
    instance-of v4, p1, Lorg/spongycastle/jce/interfaces/MQVPublicKey;

    if-nez v4, :cond_69

    .line 95
    check-cast p1, Ljava/security/PublicKey;

    .line 96
    .end local p1    # "key":Ljava/security/Key;
    invoke-static {p1}, Lorg/spongycastle/jcajce/provider/asymmetric/util/ECUtil;->generatePublicKeyParameter(Ljava/security/PublicKey;)Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    move-result-object v3

    check-cast v3, Lorg/spongycastle/crypto/params/ECPublicKeyParameters;

    .line 97
    .local v3, "staticKey":Lorg/spongycastle/crypto/params/ECPublicKeyParameters;
    iget-object v4, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi;->mqvParameters:Lorg/spongycastle/jcajce/spec/MQVParameterSpec;

    .line 98
    invoke-virtual {v4}, Lorg/spongycastle/jcajce/spec/MQVParameterSpec;->getOtherPartyEphemeralKey()Ljava/security/PublicKey;

    move-result-object v4

    invoke-static {v4}, Lorg/spongycastle/jcajce/provider/asymmetric/util/ECUtil;->generatePublicKeyParameter(Ljava/security/PublicKey;)Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/crypto/params/ECPublicKeyParameters;

    .line 100
    .local v0, "ephemKey":Lorg/spongycastle/crypto/params/ECPublicKeyParameters;
    new-instance v2, Lorg/spongycastle/crypto/params/MQVPublicParameters;

    invoke-direct {v2, v3, v0}, Lorg/spongycastle/crypto/params/MQVPublicParameters;-><init>(Lorg/spongycastle/crypto/params/ECPublicKeyParameters;Lorg/spongycastle/crypto/params/ECPublicKeyParameters;)V

    .line 128
    .end local v0    # "ephemKey":Lorg/spongycastle/crypto/params/ECPublicKeyParameters;
    .end local v3    # "staticKey":Lorg/spongycastle/crypto/params/ECPublicKeyParameters;
    .local v2, "pubKey":Lorg/spongycastle/crypto/CipherParameters;
    :goto_5f
    iget-object v4, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi;->agreement:Lorg/spongycastle/crypto/BasicAgreement;

    invoke-interface {v4, v2}, Lorg/spongycastle/crypto/BasicAgreement;->calculateAgreement(Lorg/spongycastle/crypto/CipherParameters;)Ljava/math/BigInteger;

    move-result-object v4

    iput-object v4, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi;->result:Ljava/math/BigInteger;

    .line 130
    const/4 v4, 0x0

    return-object v4

    .end local v2    # "pubKey":Lorg/spongycastle/crypto/CipherParameters;
    .restart local p1    # "key":Ljava/security/Key;
    :cond_69
    move-object v1, p1

    .line 104
    check-cast v1, Lorg/spongycastle/jce/interfaces/MQVPublicKey;

    .line 106
    .local v1, "mqvPubKey":Lorg/spongycastle/jce/interfaces/MQVPublicKey;
    invoke-interface {v1}, Lorg/spongycastle/jce/interfaces/MQVPublicKey;->getStaticKey()Ljava/security/PublicKey;

    move-result-object v4

    invoke-static {v4}, Lorg/spongycastle/jcajce/provider/asymmetric/util/ECUtil;->generatePublicKeyParameter(Ljava/security/PublicKey;)Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    move-result-object v3

    check-cast v3, Lorg/spongycastle/crypto/params/ECPublicKeyParameters;

    .line 108
    .restart local v3    # "staticKey":Lorg/spongycastle/crypto/params/ECPublicKeyParameters;
    invoke-interface {v1}, Lorg/spongycastle/jce/interfaces/MQVPublicKey;->getEphemeralKey()Ljava/security/PublicKey;

    move-result-object v4

    invoke-static {v4}, Lorg/spongycastle/jcajce/provider/asymmetric/util/ECUtil;->generatePublicKeyParameter(Ljava/security/PublicKey;)Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/crypto/params/ECPublicKeyParameters;

    .line 110
    .restart local v0    # "ephemKey":Lorg/spongycastle/crypto/params/ECPublicKeyParameters;
    new-instance v2, Lorg/spongycastle/crypto/params/MQVPublicParameters;

    invoke-direct {v2, v3, v0}, Lorg/spongycastle/crypto/params/MQVPublicParameters;-><init>(Lorg/spongycastle/crypto/params/ECPublicKeyParameters;Lorg/spongycastle/crypto/params/ECPublicKeyParameters;)V

    .line 113
    .restart local v2    # "pubKey":Lorg/spongycastle/crypto/CipherParameters;
    goto :goto_5f

    .line 117
    .end local v0    # "ephemKey":Lorg/spongycastle/crypto/params/ECPublicKeyParameters;
    .end local v1    # "mqvPubKey":Lorg/spongycastle/jce/interfaces/MQVPublicKey;
    .end local v2    # "pubKey":Lorg/spongycastle/crypto/CipherParameters;
    .end local v3    # "staticKey":Lorg/spongycastle/crypto/params/ECPublicKeyParameters;
    :cond_86
    instance-of v4, p1, Ljava/security/PublicKey;

    if-nez v4, :cond_b5

    .line 119
    new-instance v4, Ljava/security/InvalidKeyException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi;->kaAlgorithm:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " key agreement requires "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-class v6, Lorg/spongycastle/jce/interfaces/ECPublicKey;

    .line 120
    invoke-static {v6}, Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi;->getSimpleName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " for doPhase"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 123
    :cond_b5
    check-cast p1, Ljava/security/PublicKey;

    .end local p1    # "key":Ljava/security/Key;
    invoke-static {p1}, Lorg/spongycastle/jcajce/provider/asymmetric/util/ECUtil;->generatePublicKeyParameter(Ljava/security/PublicKey;)Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    move-result-object v2

    .restart local v2    # "pubKey":Lorg/spongycastle/crypto/CipherParameters;
    goto :goto_5f
.end method

.method protected engineInit(Ljava/security/Key;Ljava/security/SecureRandom;)V
    .registers 4
    .param p1, "key"    # Ljava/security/Key;
    .param p2, "random"    # Ljava/security/SecureRandom;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .prologue
    .line 152
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi;->initFromKey(Ljava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 153
    return-void
.end method

.method protected engineInit(Ljava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;Ljava/security/SecureRandom;)V
    .registers 6
    .param p1, "key"    # Ljava/security/Key;
    .param p2, "params"    # Ljava/security/spec/AlgorithmParameterSpec;
    .param p3, "random"    # Ljava/security/SecureRandom;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidKeyException;,
            Ljava/security/InvalidAlgorithmParameterException;
        }
    .end annotation

    .prologue
    .line 139
    if-eqz p2, :cond_12

    instance-of v0, p2, Lorg/spongycastle/jcajce/spec/MQVParameterSpec;

    if-nez v0, :cond_12

    instance-of v0, p2, Lorg/spongycastle/jcajce/spec/UserKeyingMaterialSpec;

    if-nez v0, :cond_12

    .line 141
    new-instance v0, Ljava/security/InvalidAlgorithmParameterException;

    const-string v1, "No algorithm parameters supported"

    invoke-direct {v0, v1}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 144
    :cond_12
    invoke-direct {p0, p1, p2}, Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi;->initFromKey(Ljava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 145
    return-void
.end method
