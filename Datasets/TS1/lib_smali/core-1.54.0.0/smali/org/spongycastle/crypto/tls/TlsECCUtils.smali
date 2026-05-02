.class public Lorg/spongycastle/crypto/tls/TlsECCUtils;
.super Ljava/lang/Object;
.source "TlsECCUtils.java"


# static fields
.field private static final CURVE_NAMES:[Ljava/lang/String;

.field public static final EXT_ec_point_formats:Ljava/lang/Integer;

.field public static final EXT_elliptic_curves:Ljava/lang/Integer;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/16 v4, 0xb

    const/16 v3, 0xa

    .line 32
    invoke-static {v3}, Lorg/spongycastle/util/Integers;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lorg/spongycastle/crypto/tls/TlsECCUtils;->EXT_elliptic_curves:Ljava/lang/Integer;

    .line 33
    invoke-static {v4}, Lorg/spongycastle/util/Integers;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lorg/spongycastle/crypto/tls/TlsECCUtils;->EXT_ec_point_formats:Ljava/lang/Integer;

    .line 35
    const/16 v0, 0x1c

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "sect163k1"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "sect163r1"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "sect163r2"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "sect193r1"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "sect193r2"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "sect233k1"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "sect233r1"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "sect239k1"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "sect283k1"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "sect283r1"

    aput-object v2, v0, v1

    const-string v1, "sect409k1"

    aput-object v1, v0, v3

    const-string v1, "sect409r1"

    aput-object v1, v0, v4

    const/16 v1, 0xc

    const-string v2, "sect571k1"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "sect571r1"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string v2, "secp160k1"

    aput-object v2, v0, v1

    const/16 v1, 0xf

    const-string v2, "secp160r1"

    aput-object v2, v0, v1

    const/16 v1, 0x10

    const-string v2, "secp160r2"

    aput-object v2, v0, v1

    const/16 v1, 0x11

    const-string v2, "secp192k1"

    aput-object v2, v0, v1

    const/16 v1, 0x12

    const-string v2, "secp192r1"

    aput-object v2, v0, v1

    const/16 v1, 0x13

    const-string v2, "secp224k1"

    aput-object v2, v0, v1

    const/16 v1, 0x14

    const-string v2, "secp224r1"

    aput-object v2, v0, v1

    const/16 v1, 0x15

    const-string v2, "secp256k1"

    aput-object v2, v0, v1

    const/16 v1, 0x16

    const-string v2, "secp256r1"

    aput-object v2, v0, v1

    const/16 v1, 0x17

    const-string v2, "secp384r1"

    aput-object v2, v0, v1

    const/16 v1, 0x18

    const-string v2, "secp521r1"

    aput-object v2, v0, v1

    const/16 v1, 0x19

    const-string v2, "brainpoolP256r1"

    aput-object v2, v0, v1

    const/16 v1, 0x1a

    const-string v2, "brainpoolP384r1"

    aput-object v2, v0, v1

    const/16 v1, 0x1b

    const-string v2, "brainpoolP512r1"

    aput-object v2, v0, v1

    sput-object v0, Lorg/spongycastle/crypto/tls/TlsECCUtils;->CURVE_NAMES:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addSupportedEllipticCurvesExtension(Ljava/util/Hashtable;[I)V
    .registers 4
    .param p0, "extensions"    # Ljava/util/Hashtable;
    .param p1, "namedCurves"    # [I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 43
    sget-object v0, Lorg/spongycastle/crypto/tls/TlsECCUtils;->EXT_elliptic_curves:Ljava/lang/Integer;

    invoke-static {p1}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->createSupportedEllipticCurvesExtension([I)[B

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    return-void
.end method

.method public static addSupportedPointFormatsExtension(Ljava/util/Hashtable;[S)V
    .registers 4
    .param p0, "extensions"    # Ljava/util/Hashtable;
    .param p1, "ecPointFormats"    # [S
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 49
    sget-object v0, Lorg/spongycastle/crypto/tls/TlsECCUtils;->EXT_ec_point_formats:Ljava/lang/Integer;

    invoke-static {p1}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->createSupportedPointFormatsExtension([S)[B

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    return-void
.end method

.method public static areOnSameCurve(Lorg/spongycastle/crypto/params/ECDomainParameters;Lorg/spongycastle/crypto/params/ECDomainParameters;)Z
    .registers 4
    .param p0, "a"    # Lorg/spongycastle/crypto/params/ECDomainParameters;
    .param p1, "b"    # Lorg/spongycastle/crypto/params/ECDomainParameters;

    .prologue
    .line 313
    invoke-virtual {p0}, Lorg/spongycastle/crypto/params/ECDomainParameters;->getCurve()Lorg/spongycastle/math/ec/ECCurve;

    move-result-object v0

    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/ECDomainParameters;->getCurve()Lorg/spongycastle/math/ec/ECCurve;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/spongycastle/math/ec/ECCurve;->equals(Lorg/spongycastle/math/ec/ECCurve;)Z

    move-result v0

    if-eqz v0, :cond_3a

    invoke-virtual {p0}, Lorg/spongycastle/crypto/params/ECDomainParameters;->getG()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v0

    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/ECDomainParameters;->getG()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/spongycastle/math/ec/ECPoint;->equals(Lorg/spongycastle/math/ec/ECPoint;)Z

    move-result v0

    if-eqz v0, :cond_3a

    invoke-virtual {p0}, Lorg/spongycastle/crypto/params/ECDomainParameters;->getN()Ljava/math/BigInteger;

    move-result-object v0

    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/ECDomainParameters;->getN()Ljava/math/BigInteger;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3a

    .line 314
    invoke-virtual {p0}, Lorg/spongycastle/crypto/params/ECDomainParameters;->getH()Ljava/math/BigInteger;

    move-result-object v0

    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/ECDomainParameters;->getH()Ljava/math/BigInteger;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3a

    const/4 v0, 0x1

    :goto_39
    return v0

    :cond_3a
    const/4 v0, 0x0

    goto :goto_39
.end method

.method public static calculateECDHBasicAgreement(Lorg/spongycastle/crypto/params/ECPublicKeyParameters;Lorg/spongycastle/crypto/params/ECPrivateKeyParameters;)[B
    .registers 5
    .param p0, "publicKey"    # Lorg/spongycastle/crypto/params/ECPublicKeyParameters;
    .param p1, "privateKey"    # Lorg/spongycastle/crypto/params/ECPrivateKeyParameters;

    .prologue
    .line 450
    new-instance v1, Lorg/spongycastle/crypto/agreement/ECDHBasicAgreement;

    invoke-direct {v1}, Lorg/spongycastle/crypto/agreement/ECDHBasicAgreement;-><init>()V

    .line 451
    .local v1, "basicAgreement":Lorg/spongycastle/crypto/agreement/ECDHBasicAgreement;
    invoke-virtual {v1, p1}, Lorg/spongycastle/crypto/agreement/ECDHBasicAgreement;->init(Lorg/spongycastle/crypto/CipherParameters;)V

    .line 452
    invoke-virtual {v1, p0}, Lorg/spongycastle/crypto/agreement/ECDHBasicAgreement;->calculateAgreement(Lorg/spongycastle/crypto/CipherParameters;)Ljava/math/BigInteger;

    move-result-object v0

    .line 459
    .local v0, "agreementValue":Ljava/math/BigInteger;
    invoke-virtual {v1}, Lorg/spongycastle/crypto/agreement/ECDHBasicAgreement;->getFieldSize()I

    move-result v2

    invoke-static {v2, v0}, Lorg/spongycastle/util/BigIntegers;->asUnsignedByteArray(ILjava/math/BigInteger;)[B

    move-result-object v2

    return-object v2
.end method

.method private static checkNamedCurve([II)V
    .registers 4
    .param p0, "namedCurves"    # [I
    .param p1, "namedCurve"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 658
    if-eqz p0, :cond_10

    invoke-static {p0, p1}, Lorg/spongycastle/util/Arrays;->contains([II)Z

    move-result v0

    if-nez v0, :cond_10

    .line 665
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v1, 0x2f

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v0

    .line 667
    :cond_10
    return-void
.end method

.method public static containsECCCipherSuites([I)Z
    .registers 3
    .param p0, "cipherSuites"    # [I

    .prologue
    .line 179
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v1, p0

    if-ge v0, v1, :cond_11

    .line 181
    aget v1, p0, v0

    invoke-static {v1}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->isECCCipherSuite(I)Z

    move-result v1

    if-eqz v1, :cond_e

    .line 183
    const/4 v1, 0x1

    .line 186
    :goto_d
    return v1

    .line 179
    :cond_e
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 186
    :cond_11
    const/4 v1, 0x0

    goto :goto_d
.end method

.method public static createSupportedEllipticCurvesExtension([I)[B
    .registers 3
    .param p0, "namedCurves"    # [I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 66
    if-eqz p0, :cond_6

    array-length v0, p0

    const/4 v1, 0x1

    if-ge v0, v1, :cond_e

    .line 68
    :cond_6
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v1, 0x50

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v0

    .line 71
    :cond_e
    invoke-static {p0}, Lorg/spongycastle/crypto/tls/TlsUtils;->encodeUint16ArrayWithUint16Length([I)[B

    move-result-object v0

    return-object v0
.end method

.method public static createSupportedPointFormatsExtension([S)[B
    .registers 3
    .param p0, "ecPointFormats"    # [S
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 76
    if-eqz p0, :cond_9

    invoke-static {p0, v1}, Lorg/spongycastle/util/Arrays;->contains([SS)Z

    move-result v0

    if-nez v0, :cond_d

    .line 84
    :cond_9
    invoke-static {p0, v1}, Lorg/spongycastle/util/Arrays;->append([SS)[S

    move-result-object p0

    .line 87
    :cond_d
    invoke-static {p0}, Lorg/spongycastle/crypto/tls/TlsUtils;->encodeUint8ArrayWithUint8Length([S)[B

    move-result-object v0

    return-object v0
.end method

.method public static deserializeECFieldElement(I[B)Ljava/math/BigInteger;
    .registers 5
    .param p0, "fieldSize"    # I
    .param p1, "encoding"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 378
    add-int/lit8 v1, p0, 0x7

    div-int/lit8 v0, v1, 0x8

    .line 379
    .local v0, "requiredLength":I
    array-length v1, p1

    if-eq v1, v0, :cond_f

    .line 381
    new-instance v1, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v2, 0x32

    invoke-direct {v1, v2}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v1

    .line 383
    :cond_f
    new-instance v1, Ljava/math/BigInteger;

    const/4 v2, 0x1

    invoke-direct {v1, v2, p1}, Ljava/math/BigInteger;-><init>(I[B)V

    return-object v1
.end method

.method public static deserializeECPoint([SLorg/spongycastle/math/ec/ECCurve;[B)Lorg/spongycastle/math/ec/ECPoint;
    .registers 7
    .param p0, "ecPointFormats"    # [S
    .param p1, "curve"    # Lorg/spongycastle/math/ec/ECCurve;
    .param p2, "encoding"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v3, 0x2f

    .line 388
    if-eqz p2, :cond_8

    array-length v1, p2

    const/4 v2, 0x1

    if-ge v1, v2, :cond_e

    .line 390
    :cond_8
    new-instance v1, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    invoke-direct {v1, v3}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v1

    .line 394
    :cond_e
    const/4 v1, 0x0

    aget-byte v1, p2, v1

    packed-switch v1, :pswitch_data_46

    .line 422
    new-instance v1, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    invoke-direct {v1, v3}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v1

    .line 399
    :pswitch_1a
    invoke-static {p1}, Lorg/spongycastle/math/ec/ECAlgorithms;->isF2mCurve(Lorg/spongycastle/math/ec/ECCurve;)Z

    move-result v1

    if-eqz v1, :cond_31

    .line 401
    const/4 v0, 0x2

    .line 425
    .local v0, "actualFormat":S
    :goto_21
    if-eqz v0, :cond_41

    if-eqz p0, :cond_2b

    .line 426
    invoke-static {p0, v0}, Lorg/spongycastle/util/Arrays;->contains([SS)Z

    move-result v1

    if-nez v1, :cond_41

    .line 428
    :cond_2b
    new-instance v1, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    invoke-direct {v1, v3}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v1

    .line 403
    .end local v0    # "actualFormat":S
    :cond_31
    invoke-static {p1}, Lorg/spongycastle/math/ec/ECAlgorithms;->isFpCurve(Lorg/spongycastle/math/ec/ECCurve;)Z

    move-result v1

    if-eqz v1, :cond_39

    .line 405
    const/4 v0, 0x1

    .restart local v0    # "actualFormat":S
    goto :goto_21

    .line 409
    .end local v0    # "actualFormat":S
    :cond_39
    new-instance v1, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    invoke-direct {v1, v3}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v1

    .line 415
    :pswitch_3f
    const/4 v0, 0x0

    .line 416
    .restart local v0    # "actualFormat":S
    goto :goto_21

    .line 431
    :cond_41
    invoke-virtual {p1, p2}, Lorg/spongycastle/math/ec/ECCurve;->decodePoint([B)Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v1

    return-object v1

    .line 394
    :pswitch_data_46
    .packed-switch 0x2
        :pswitch_1a
        :pswitch_1a
        :pswitch_3f
    .end packed-switch
.end method

.method public static deserializeECPublicKey([SLorg/spongycastle/crypto/params/ECDomainParameters;[B)Lorg/spongycastle/crypto/params/ECPublicKeyParameters;
    .registers 7
    .param p0, "ecPointFormats"    # [S
    .param p1, "curve_params"    # Lorg/spongycastle/crypto/params/ECDomainParameters;
    .param p2, "encoding"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 439
    :try_start_0
    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/ECDomainParameters;->getCurve()Lorg/spongycastle/math/ec/ECCurve;

    move-result-object v2

    invoke-static {p0, v2, p2}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->deserializeECPoint([SLorg/spongycastle/math/ec/ECCurve;[B)Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v0

    .line 440
    .local v0, "Y":Lorg/spongycastle/math/ec/ECPoint;
    new-instance v2, Lorg/spongycastle/crypto/params/ECPublicKeyParameters;

    invoke-direct {v2, v0, p1}, Lorg/spongycastle/crypto/params/ECPublicKeyParameters;-><init>(Lorg/spongycastle/math/ec/ECPoint;Lorg/spongycastle/crypto/params/ECDomainParameters;)V
    :try_end_d
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_d} :catch_e

    return-object v2

    .line 442
    .end local v0    # "Y":Lorg/spongycastle/math/ec/ECPoint;
    :catch_e
    move-exception v1

    .line 444
    .local v1, "e":Ljava/lang/RuntimeException;
    new-instance v2, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v3, 0x2f

    invoke-direct {v2, v3, v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(SLjava/lang/Throwable;)V

    throw v2
.end method

.method public static generateECKeyPair(Ljava/security/SecureRandom;Lorg/spongycastle/crypto/params/ECDomainParameters;)Lorg/spongycastle/crypto/AsymmetricCipherKeyPair;
    .registers 4
    .param p0, "random"    # Ljava/security/SecureRandom;
    .param p1, "ecParams"    # Lorg/spongycastle/crypto/params/ECDomainParameters;

    .prologue
    .line 464
    new-instance v0, Lorg/spongycastle/crypto/generators/ECKeyPairGenerator;

    invoke-direct {v0}, Lorg/spongycastle/crypto/generators/ECKeyPairGenerator;-><init>()V

    .line 465
    .local v0, "keyPairGenerator":Lorg/spongycastle/crypto/generators/ECKeyPairGenerator;
    new-instance v1, Lorg/spongycastle/crypto/params/ECKeyGenerationParameters;

    invoke-direct {v1, p1, p0}, Lorg/spongycastle/crypto/params/ECKeyGenerationParameters;-><init>(Lorg/spongycastle/crypto/params/ECDomainParameters;Ljava/security/SecureRandom;)V

    invoke-virtual {v0, v1}, Lorg/spongycastle/crypto/generators/ECKeyPairGenerator;->init(Lorg/spongycastle/crypto/KeyGenerationParameters;)V

    .line 466
    invoke-virtual {v0}, Lorg/spongycastle/crypto/generators/ECKeyPairGenerator;->generateKeyPair()Lorg/spongycastle/crypto/AsymmetricCipherKeyPair;

    move-result-object v1

    return-object v1
.end method

.method public static generateEphemeralClientKeyExchange(Ljava/security/SecureRandom;[SLorg/spongycastle/crypto/params/ECDomainParameters;Ljava/io/OutputStream;)Lorg/spongycastle/crypto/params/ECPrivateKeyParameters;
    .registers 7
    .param p0, "random"    # Ljava/security/SecureRandom;
    .param p1, "ecPointFormats"    # [S
    .param p2, "ecParams"    # Lorg/spongycastle/crypto/params/ECDomainParameters;
    .param p3, "output"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 472
    invoke-static {p0, p2}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->generateECKeyPair(Ljava/security/SecureRandom;Lorg/spongycastle/crypto/params/ECDomainParameters;)Lorg/spongycastle/crypto/AsymmetricCipherKeyPair;

    move-result-object v1

    .line 474
    .local v1, "kp":Lorg/spongycastle/crypto/AsymmetricCipherKeyPair;
    invoke-virtual {v1}, Lorg/spongycastle/crypto/AsymmetricCipherKeyPair;->getPublic()Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/crypto/params/ECPublicKeyParameters;

    .line 475
    .local v0, "ecPublicKey":Lorg/spongycastle/crypto/params/ECPublicKeyParameters;
    invoke-virtual {v0}, Lorg/spongycastle/crypto/params/ECPublicKeyParameters;->getQ()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v2

    invoke-static {p1, v2, p3}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->writeECPoint([SLorg/spongycastle/math/ec/ECPoint;Ljava/io/OutputStream;)V

    .line 477
    invoke-virtual {v1}, Lorg/spongycastle/crypto/AsymmetricCipherKeyPair;->getPrivate()Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    move-result-object v2

    check-cast v2, Lorg/spongycastle/crypto/params/ECPrivateKeyParameters;

    return-object v2
.end method

.method static generateEphemeralServerKeyExchange(Ljava/security/SecureRandom;[I[SLjava/io/OutputStream;)Lorg/spongycastle/crypto/params/ECPrivateKeyParameters;
    .registers 10
    .param p0, "random"    # Ljava/security/SecureRandom;
    .param p1, "namedCurves"    # [I
    .param p2, "ecPointFormats"    # [S
    .param p3, "output"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 485
    const/4 v3, -0x1

    .line 486
    .local v3, "namedCurve":I
    if-nez p1, :cond_16

    .line 489
    const/16 v3, 0x17

    .line 504
    :cond_5
    :goto_5
    const/4 v0, 0x0

    .line 505
    .local v0, "ecParams":Lorg/spongycastle/crypto/params/ECDomainParameters;
    if-ltz v3, :cond_2d

    .line 507
    invoke-static {v3}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->getParametersForNamedCurve(I)Lorg/spongycastle/crypto/params/ECDomainParameters;

    move-result-object v0

    .line 522
    :cond_c
    :goto_c
    if-nez v0, :cond_4d

    .line 528
    new-instance v4, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v5, 0x50

    invoke-direct {v4, v5}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v4

    .line 493
    .end local v0    # "ecParams":Lorg/spongycastle/crypto/params/ECDomainParameters;
    :cond_16
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_17
    array-length v4, p1

    if-ge v2, v4, :cond_5

    .line 495
    aget v1, p1, v2

    .line 496
    .local v1, "entry":I
    invoke-static {v1}, Lorg/spongycastle/crypto/tls/NamedCurve;->isValid(I)Z

    move-result v4

    if-eqz v4, :cond_2a

    invoke-static {v1}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->isSupportedNamedCurve(I)Z

    move-result v4

    if-eqz v4, :cond_2a

    .line 498
    move v3, v1

    .line 499
    goto :goto_5

    .line 493
    :cond_2a
    add-int/lit8 v2, v2, 0x1

    goto :goto_17

    .line 512
    .end local v1    # "entry":I
    .end local v2    # "i":I
    .restart local v0    # "ecParams":Lorg/spongycastle/crypto/params/ECDomainParameters;
    :cond_2d
    const v4, 0xff01

    invoke-static {p1, v4}, Lorg/spongycastle/util/Arrays;->contains([II)Z

    move-result v4

    if-eqz v4, :cond_3d

    .line 514
    const/16 v4, 0x17

    invoke-static {v4}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->getParametersForNamedCurve(I)Lorg/spongycastle/crypto/params/ECDomainParameters;

    move-result-object v0

    goto :goto_c

    .line 516
    :cond_3d
    const v4, 0xff02

    invoke-static {p1, v4}, Lorg/spongycastle/util/Arrays;->contains([II)Z

    move-result v4

    if-eqz v4, :cond_c

    .line 518
    const/16 v4, 0xa

    invoke-static {v4}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->getParametersForNamedCurve(I)Lorg/spongycastle/crypto/params/ECDomainParameters;

    move-result-object v0

    goto :goto_c

    .line 531
    :cond_4d
    if-gez v3, :cond_57

    .line 533
    invoke-static {p2, v0, p3}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->writeExplicitECParameters([SLorg/spongycastle/crypto/params/ECDomainParameters;Ljava/io/OutputStream;)V

    .line 540
    :goto_52
    invoke-static {p0, p2, v0, p3}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->generateEphemeralClientKeyExchange(Ljava/security/SecureRandom;[SLorg/spongycastle/crypto/params/ECDomainParameters;Ljava/io/OutputStream;)Lorg/spongycastle/crypto/params/ECPrivateKeyParameters;

    move-result-object v4

    return-object v4

    .line 537
    :cond_57
    invoke-static {v3, p3}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->writeNamedECParameters(ILjava/io/OutputStream;)V

    goto :goto_52
.end method

.method public static getNameOfNamedCurve(I)Ljava/lang/String;
    .registers 3
    .param p0, "namedCurve"    # I

    .prologue
    .line 145
    invoke-static {p0}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->isSupportedNamedCurve(I)Z

    move-result v0

    if-eqz v0, :cond_d

    sget-object v0, Lorg/spongycastle/crypto/tls/TlsECCUtils;->CURVE_NAMES:[Ljava/lang/String;

    add-int/lit8 v1, p0, -0x1

    aget-object v0, v0, v1

    :goto_c
    return-object v0

    :cond_d
    const/4 v0, 0x0

    goto :goto_c
.end method

.method public static getParametersForNamedCurve(I)Lorg/spongycastle/crypto/params/ECDomainParameters;
    .registers 9
    .param p0, "namedCurve"    # I

    .prologue
    const/4 v0, 0x0

    .line 150
    invoke-static {p0}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->getNameOfNamedCurve(I)Ljava/lang/String;

    move-result-object v6

    .line 151
    .local v6, "curveName":Ljava/lang/String;
    if-nez v6, :cond_8

    .line 169
    :cond_7
    :goto_7
    return-object v0

    .line 158
    :cond_8
    invoke-static {v6}, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->getByName(Ljava/lang/String;)Lorg/spongycastle/asn1/x9/X9ECParameters;

    move-result-object v7

    .line 159
    .local v7, "ecP":Lorg/spongycastle/asn1/x9/X9ECParameters;
    if-nez v7, :cond_14

    .line 161
    invoke-static {v6}, Lorg/spongycastle/asn1/x9/ECNamedCurveTable;->getByName(Ljava/lang/String;)Lorg/spongycastle/asn1/x9/X9ECParameters;

    move-result-object v7

    .line 162
    if-eqz v7, :cond_7

    .line 169
    :cond_14
    new-instance v0, Lorg/spongycastle/crypto/params/ECDomainParameters;

    invoke-virtual {v7}, Lorg/spongycastle/asn1/x9/X9ECParameters;->getCurve()Lorg/spongycastle/math/ec/ECCurve;

    move-result-object v1

    invoke-virtual {v7}, Lorg/spongycastle/asn1/x9/X9ECParameters;->getG()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v2

    invoke-virtual {v7}, Lorg/spongycastle/asn1/x9/X9ECParameters;->getN()Ljava/math/BigInteger;

    move-result-object v3

    invoke-virtual {v7}, Lorg/spongycastle/asn1/x9/X9ECParameters;->getH()Ljava/math/BigInteger;

    move-result-object v4

    invoke-virtual {v7}, Lorg/spongycastle/asn1/x9/X9ECParameters;->getSeed()[B

    move-result-object v5

    invoke-direct/range {v0 .. v5}, Lorg/spongycastle/crypto/params/ECDomainParameters;-><init>(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/math/ec/ECPoint;Ljava/math/BigInteger;Ljava/math/BigInteger;[B)V

    goto :goto_7
.end method

.method public static getSupportedEllipticCurvesExtension(Ljava/util/Hashtable;)[I
    .registers 3
    .param p0, "extensions"    # Ljava/util/Hashtable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 54
    sget-object v1, Lorg/spongycastle/crypto/tls/TlsECCUtils;->EXT_elliptic_curves:Ljava/lang/Integer;

    invoke-static {p0, v1}, Lorg/spongycastle/crypto/tls/TlsUtils;->getExtensionData(Ljava/util/Hashtable;Ljava/lang/Integer;)[B

    move-result-object v0

    .line 55
    .local v0, "extensionData":[B
    if-nez v0, :cond_a

    const/4 v1, 0x0

    :goto_9
    return-object v1

    :cond_a
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->readSupportedEllipticCurvesExtension([B)[I

    move-result-object v1

    goto :goto_9
.end method

.method public static getSupportedPointFormatsExtension(Ljava/util/Hashtable;)[S
    .registers 3
    .param p0, "extensions"    # Ljava/util/Hashtable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 60
    sget-object v1, Lorg/spongycastle/crypto/tls/TlsECCUtils;->EXT_ec_point_formats:Ljava/lang/Integer;

    invoke-static {p0, v1}, Lorg/spongycastle/crypto/tls/TlsUtils;->getExtensionData(Ljava/util/Hashtable;Ljava/lang/Integer;)[B

    move-result-object v0

    .line 61
    .local v0, "extensionData":[B
    if-nez v0, :cond_a

    const/4 v1, 0x0

    :goto_9
    return-object v1

    :cond_a
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->readSupportedPointFormatsExtension([B)[S

    move-result-object v1

    goto :goto_9
.end method

.method public static hasAnySupportedNamedCurves()Z
    .registers 1

    .prologue
    .line 174
    sget-object v0, Lorg/spongycastle/crypto/tls/TlsECCUtils;->CURVE_NAMES:[Ljava/lang/String;

    array-length v0, v0

    if-lez v0, :cond_7

    const/4 v0, 0x1

    :goto_6
    return v0

    :cond_7
    const/4 v0, 0x0

    goto :goto_6
.end method

.method public static isCompressionPreferred([SS)Z
    .registers 6
    .param p0, "ecPointFormats"    # [S
    .param p1, "compressionFormat"    # S

    .prologue
    const/4 v2, 0x0

    .line 324
    if-nez p0, :cond_4

    .line 340
    :cond_3
    :goto_3
    return v2

    .line 328
    :cond_4
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_5
    array-length v3, p0

    if-ge v1, v3, :cond_3

    .line 330
    aget-short v0, p0, v1

    .line 331
    .local v0, "ecPointFormat":S
    if-eqz v0, :cond_3

    .line 335
    if-ne v0, p1, :cond_10

    .line 337
    const/4 v2, 0x1

    goto :goto_3

    .line 328
    :cond_10
    add-int/lit8 v1, v1, 0x1

    goto :goto_5
.end method

.method public static isECCCipherSuite(I)Z
    .registers 2
    .param p0, "cipherSuite"    # I

    .prologue
    .line 191
    sparse-switch p0, :sswitch_data_8

    .line 306
    const/4 v0, 0x0

    :goto_4
    return v0

    .line 303
    :sswitch_5
    const/4 v0, 0x1

    goto :goto_4

    .line 191
    nop

    :sswitch_data_8
    .sparse-switch
        0xc001 -> :sswitch_5
        0xc002 -> :sswitch_5
        0xc003 -> :sswitch_5
        0xc004 -> :sswitch_5
        0xc005 -> :sswitch_5
        0xc006 -> :sswitch_5
        0xc007 -> :sswitch_5
        0xc008 -> :sswitch_5
        0xc009 -> :sswitch_5
        0xc00a -> :sswitch_5
        0xc00b -> :sswitch_5
        0xc00c -> :sswitch_5
        0xc00d -> :sswitch_5
        0xc00e -> :sswitch_5
        0xc00f -> :sswitch_5
        0xc010 -> :sswitch_5
        0xc011 -> :sswitch_5
        0xc012 -> :sswitch_5
        0xc013 -> :sswitch_5
        0xc014 -> :sswitch_5
        0xc015 -> :sswitch_5
        0xc016 -> :sswitch_5
        0xc017 -> :sswitch_5
        0xc018 -> :sswitch_5
        0xc019 -> :sswitch_5
        0xc023 -> :sswitch_5
        0xc024 -> :sswitch_5
        0xc025 -> :sswitch_5
        0xc026 -> :sswitch_5
        0xc027 -> :sswitch_5
        0xc028 -> :sswitch_5
        0xc029 -> :sswitch_5
        0xc02a -> :sswitch_5
        0xc02b -> :sswitch_5
        0xc02c -> :sswitch_5
        0xc02d -> :sswitch_5
        0xc02e -> :sswitch_5
        0xc02f -> :sswitch_5
        0xc030 -> :sswitch_5
        0xc031 -> :sswitch_5
        0xc032 -> :sswitch_5
        0xc033 -> :sswitch_5
        0xc034 -> :sswitch_5
        0xc035 -> :sswitch_5
        0xc036 -> :sswitch_5
        0xc037 -> :sswitch_5
        0xc038 -> :sswitch_5
        0xc039 -> :sswitch_5
        0xc03a -> :sswitch_5
        0xc03b -> :sswitch_5
        0xc072 -> :sswitch_5
        0xc073 -> :sswitch_5
        0xc074 -> :sswitch_5
        0xc075 -> :sswitch_5
        0xc076 -> :sswitch_5
        0xc077 -> :sswitch_5
        0xc078 -> :sswitch_5
        0xc079 -> :sswitch_5
        0xc086 -> :sswitch_5
        0xc087 -> :sswitch_5
        0xc088 -> :sswitch_5
        0xc089 -> :sswitch_5
        0xc08a -> :sswitch_5
        0xc08b -> :sswitch_5
        0xc08c -> :sswitch_5
        0xc08d -> :sswitch_5
        0xc09a -> :sswitch_5
        0xc09b -> :sswitch_5
        0xc0ac -> :sswitch_5
        0xc0ad -> :sswitch_5
        0xc0ae -> :sswitch_5
        0xc0af -> :sswitch_5
        0xcc13 -> :sswitch_5
        0xcc14 -> :sswitch_5
        0xe412 -> :sswitch_5
        0xe413 -> :sswitch_5
        0xe414 -> :sswitch_5
        0xe415 -> :sswitch_5
        0xe418 -> :sswitch_5
        0xe419 -> :sswitch_5
    .end sparse-switch
.end method

.method public static isSupportedNamedCurve(I)Z
    .registers 2
    .param p0, "namedCurve"    # I

    .prologue
    .line 319
    if-lez p0, :cond_9

    sget-object v0, Lorg/spongycastle/crypto/tls/TlsECCUtils;->CURVE_NAMES:[Ljava/lang/String;

    array-length v0, v0

    if-gt p0, v0, :cond_9

    const/4 v0, 0x1

    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public static readECExponent(ILjava/io/InputStream;)I
    .registers 6
    .param p0, "fieldSize"    # I
    .param p1, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 551
    invoke-static {p1}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->readECParameter(Ljava/io/InputStream;)Ljava/math/BigInteger;

    move-result-object v0

    .line 552
    .local v0, "K":Ljava/math/BigInteger;
    invoke-virtual {v0}, Ljava/math/BigInteger;->bitLength()I

    move-result v2

    const/16 v3, 0x20

    if-ge v2, v3, :cond_15

    .line 554
    invoke-virtual {v0}, Ljava/math/BigInteger;->intValue()I

    move-result v1

    .line 555
    .local v1, "k":I
    if-lez v1, :cond_15

    if-ge v1, p0, :cond_15

    .line 557
    return v1

    .line 560
    .end local v1    # "k":I
    :cond_15
    new-instance v2, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v3, 0x2f

    invoke-direct {v2, v3}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v2
.end method

.method public static readECFieldElement(ILjava/io/InputStream;)Ljava/math/BigInteger;
    .registers 3
    .param p0, "fieldSize"    # I
    .param p1, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 565
    invoke-static {p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->readOpaque8(Ljava/io/InputStream;)[B

    move-result-object v0

    invoke-static {p0, v0}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->deserializeECFieldElement(I[B)Ljava/math/BigInteger;

    move-result-object v0

    return-object v0
.end method

.method public static readECParameter(Ljava/io/InputStream;)Ljava/math/BigInteger;
    .registers 4
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 571
    new-instance v0, Ljava/math/BigInteger;

    const/4 v1, 0x1

    invoke-static {p0}, Lorg/spongycastle/crypto/tls/TlsUtils;->readOpaque8(Ljava/io/InputStream;)[B

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/math/BigInteger;-><init>(I[B)V

    return-object v0
.end method

.method public static readECParameters([I[SLjava/io/InputStream;)Lorg/spongycastle/crypto/params/ECDomainParameters;
    .registers 29
    .param p0, "namedCurves"    # [I
    .param p1, "ecPointFormats"    # [S
    .param p2, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 579
    :try_start_0
    invoke-static/range {p2 .. p2}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint8(Ljava/io/InputStream;)S

    move-result v23

    .line 581
    .local v23, "curveType":S
    packed-switch v23, :pswitch_data_fa

    .line 647
    new-instance v8, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v13, 0x2f

    invoke-direct {v8, v13}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v8
    :try_end_f
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_f} :catch_f

    .line 650
    .end local v23    # "curveType":S
    :catch_f
    move-exception v24

    .line 652
    .local v24, "e":Ljava/lang/RuntimeException;
    new-instance v8, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v13, 0x2f

    move-object/from16 v0, v24

    invoke-direct {v8, v13, v0}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(SLjava/lang/Throwable;)V

    throw v8

    .line 585
    .end local v24    # "e":Ljava/lang/RuntimeException;
    .restart local v23    # "curveType":S
    :pswitch_1a
    const v8, 0xff01

    :try_start_1d
    move-object/from16 v0, p0

    invoke-static {v0, v8}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->checkNamedCurve([II)V

    .line 587
    invoke-static/range {p2 .. p2}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->readECParameter(Ljava/io/InputStream;)Ljava/math/BigInteger;

    move-result-object v3

    .line 588
    .local v3, "prime_p":Ljava/math/BigInteger;
    invoke-virtual {v3}, Ljava/math/BigInteger;->bitLength()I

    move-result v8

    move-object/from16 v0, p2

    invoke-static {v8, v0}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->readECFieldElement(ILjava/io/InputStream;)Ljava/math/BigInteger;

    move-result-object v4

    .line 589
    .local v4, "a":Ljava/math/BigInteger;
    invoke-virtual {v3}, Ljava/math/BigInteger;->bitLength()I

    move-result v8

    move-object/from16 v0, p2

    invoke-static {v8, v0}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->readECFieldElement(ILjava/io/InputStream;)Ljava/math/BigInteger;

    move-result-object v5

    .line 590
    .local v5, "b":Ljava/math/BigInteger;
    invoke-static/range {p2 .. p2}, Lorg/spongycastle/crypto/tls/TlsUtils;->readOpaque8(Ljava/io/InputStream;)[B

    move-result-object v21

    .line 591
    .local v21, "baseEncoding":[B
    invoke-static/range {p2 .. p2}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->readECParameter(Ljava/io/InputStream;)Ljava/math/BigInteger;

    move-result-object v6

    .line 592
    .local v6, "order":Ljava/math/BigInteger;
    invoke-static/range {p2 .. p2}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->readECParameter(Ljava/io/InputStream;)Ljava/math/BigInteger;

    move-result-object v7

    .line 593
    .local v7, "cofactor":Ljava/math/BigInteger;
    new-instance v2, Lorg/spongycastle/math/ec/ECCurve$Fp;

    invoke-direct/range {v2 .. v7}, Lorg/spongycastle/math/ec/ECCurve$Fp;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    .line 594
    .local v2, "curve":Lorg/spongycastle/math/ec/ECCurve;
    move-object/from16 v0, p1

    move-object/from16 v1, v21

    invoke-static {v0, v2, v1}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->deserializeECPoint([SLorg/spongycastle/math/ec/ECCurve;[B)Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v20

    .line 595
    .local v20, "base":Lorg/spongycastle/math/ec/ECPoint;
    new-instance v8, Lorg/spongycastle/crypto/params/ECDomainParameters;

    move-object/from16 v0, v20

    invoke-direct {v8, v2, v0, v6, v7}, Lorg/spongycastle/crypto/params/ECDomainParameters;-><init>(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/math/ec/ECPoint;Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    .line 644
    .end local v2    # "curve":Lorg/spongycastle/math/ec/ECCurve;
    .end local v3    # "prime_p":Ljava/math/BigInteger;
    .end local v4    # "a":Ljava/math/BigInteger;
    .end local v5    # "b":Ljava/math/BigInteger;
    .end local v6    # "order":Ljava/math/BigInteger;
    .end local v7    # "cofactor":Ljava/math/BigInteger;
    .end local v20    # "base":Lorg/spongycastle/math/ec/ECPoint;
    .end local v21    # "baseEncoding":[B
    :goto_5a
    return-object v8

    .line 599
    :pswitch_5b
    const v8, 0xff02

    move-object/from16 v0, p0

    invoke-static {v0, v8}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->checkNamedCurve([II)V

    .line 601
    invoke-static/range {p2 .. p2}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint16(Ljava/io/InputStream;)I

    move-result v9

    .line 602
    .local v9, "m":I
    invoke-static/range {p2 .. p2}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint8(Ljava/io/InputStream;)S

    move-result v22

    .line 603
    .local v22, "basis":S
    invoke-static/range {v22 .. v22}, Lorg/spongycastle/crypto/tls/ECBasisType;->isValid(S)Z

    move-result v8

    if-nez v8, :cond_79

    .line 605
    new-instance v8, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v13, 0x2f

    invoke-direct {v8, v13}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v8

    .line 608
    :cond_79
    move-object/from16 v0, p2

    invoke-static {v9, v0}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->readECExponent(ILjava/io/InputStream;)I

    move-result v10

    .local v10, "k1":I
    const/4 v11, -0x1

    .local v11, "k2":I
    const/4 v12, -0x1

    .line 609
    .local v12, "k3":I
    const/4 v8, 0x2

    move/from16 v0, v22

    if-ne v0, v8, :cond_92

    .line 611
    move-object/from16 v0, p2

    invoke-static {v9, v0}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->readECExponent(ILjava/io/InputStream;)I

    move-result v11

    .line 612
    move-object/from16 v0, p2

    invoke-static {v9, v0}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->readECExponent(ILjava/io/InputStream;)I

    move-result v12

    .line 615
    :cond_92
    move-object/from16 v0, p2

    invoke-static {v9, v0}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->readECFieldElement(ILjava/io/InputStream;)Ljava/math/BigInteger;

    move-result-object v4

    .line 616
    .restart local v4    # "a":Ljava/math/BigInteger;
    move-object/from16 v0, p2

    invoke-static {v9, v0}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->readECFieldElement(ILjava/io/InputStream;)Ljava/math/BigInteger;

    move-result-object v5

    .line 617
    .restart local v5    # "b":Ljava/math/BigInteger;
    invoke-static/range {p2 .. p2}, Lorg/spongycastle/crypto/tls/TlsUtils;->readOpaque8(Ljava/io/InputStream;)[B

    move-result-object v21

    .line 618
    .restart local v21    # "baseEncoding":[B
    invoke-static/range {p2 .. p2}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->readECParameter(Ljava/io/InputStream;)Ljava/math/BigInteger;

    move-result-object v6

    .line 619
    .restart local v6    # "order":Ljava/math/BigInteger;
    invoke-static/range {p2 .. p2}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->readECParameter(Ljava/io/InputStream;)Ljava/math/BigInteger;

    move-result-object v7

    .line 621
    .restart local v7    # "cofactor":Ljava/math/BigInteger;
    const/4 v8, 0x2

    move/from16 v0, v22

    if-ne v0, v8, :cond_ca

    new-instance v8, Lorg/spongycastle/math/ec/ECCurve$F2m;

    move-object v13, v4

    move-object v14, v5

    move-object v15, v6

    move-object/from16 v16, v7

    invoke-direct/range {v8 .. v16}, Lorg/spongycastle/math/ec/ECCurve$F2m;-><init>(IIIILjava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    move-object v2, v8

    .line 625
    .restart local v2    # "curve":Lorg/spongycastle/math/ec/ECCurve;
    :goto_ba
    move-object/from16 v0, p1

    move-object/from16 v1, v21

    invoke-static {v0, v2, v1}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->deserializeECPoint([SLorg/spongycastle/math/ec/ECCurve;[B)Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v20

    .line 627
    .restart local v20    # "base":Lorg/spongycastle/math/ec/ECPoint;
    new-instance v8, Lorg/spongycastle/crypto/params/ECDomainParameters;

    move-object/from16 v0, v20

    invoke-direct {v8, v2, v0, v6, v7}, Lorg/spongycastle/crypto/params/ECDomainParameters;-><init>(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/math/ec/ECPoint;Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    goto :goto_5a

    .line 621
    .end local v2    # "curve":Lorg/spongycastle/math/ec/ECCurve;
    .end local v20    # "base":Lorg/spongycastle/math/ec/ECPoint;
    :cond_ca
    new-instance v13, Lorg/spongycastle/math/ec/ECCurve$F2m;

    move v14, v9

    move v15, v10

    move-object/from16 v16, v4

    move-object/from16 v17, v5

    move-object/from16 v18, v6

    move-object/from16 v19, v7

    invoke-direct/range {v13 .. v19}, Lorg/spongycastle/math/ec/ECCurve$F2m;-><init>(IILjava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    move-object v2, v13

    goto :goto_ba

    .line 631
    .end local v4    # "a":Ljava/math/BigInteger;
    .end local v5    # "b":Ljava/math/BigInteger;
    .end local v6    # "order":Ljava/math/BigInteger;
    .end local v7    # "cofactor":Ljava/math/BigInteger;
    .end local v9    # "m":I
    .end local v10    # "k1":I
    .end local v11    # "k2":I
    .end local v12    # "k3":I
    .end local v21    # "baseEncoding":[B
    .end local v22    # "basis":S
    :pswitch_db
    invoke-static/range {p2 .. p2}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint16(Ljava/io/InputStream;)I

    move-result v25

    .line 632
    .local v25, "namedCurve":I
    invoke-static/range {v25 .. v25}, Lorg/spongycastle/crypto/tls/NamedCurve;->refersToASpecificNamedCurve(I)Z

    move-result v8

    if-nez v8, :cond_ed

    .line 639
    new-instance v8, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v13, 0x2f

    invoke-direct {v8, v13}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v8

    .line 642
    :cond_ed
    move-object/from16 v0, p0

    move/from16 v1, v25

    invoke-static {v0, v1}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->checkNamedCurve([II)V

    .line 644
    invoke-static/range {v25 .. v25}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->getParametersForNamedCurve(I)Lorg/spongycastle/crypto/params/ECDomainParameters;
    :try_end_f7
    .catch Ljava/lang/RuntimeException; {:try_start_1d .. :try_end_f7} :catch_f

    move-result-object v8

    goto/16 :goto_5a

    .line 581
    :pswitch_data_fa
    .packed-switch 0x1
        :pswitch_1a
        :pswitch_5b
        :pswitch_db
    .end packed-switch
.end method

.method public static readSupportedEllipticCurvesExtension([B)[I
    .registers 6
    .param p0, "extensionData"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 92
    if-nez p0, :cond_a

    .line 94
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "\'extensionData\' cannot be null"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 97
    :cond_a
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 99
    .local v0, "buf":Ljava/io/ByteArrayInputStream;
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint16(Ljava/io/InputStream;)I

    move-result v1

    .line 100
    .local v1, "length":I
    const/4 v3, 0x2

    if-lt v1, v3, :cond_1a

    and-int/lit8 v3, v1, 0x1

    if-eqz v3, :cond_22

    .line 102
    :cond_1a
    new-instance v3, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v4, 0x32

    invoke-direct {v3, v4}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v3

    .line 105
    :cond_22
    div-int/lit8 v3, v1, 0x2

    invoke-static {v3, v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint16Array(ILjava/io/InputStream;)[I

    move-result-object v2

    .line 107
    .local v2, "namedCurves":[I
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsProtocol;->assertEmpty(Ljava/io/ByteArrayInputStream;)V

    .line 109
    return-object v2
.end method

.method public static readSupportedPointFormatsExtension([B)[S
    .registers 6
    .param p0, "extensionData"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 114
    if-nez p0, :cond_a

    .line 116
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "\'extensionData\' cannot be null"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 119
    :cond_a
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 121
    .local v0, "buf":Ljava/io/ByteArrayInputStream;
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint8(Ljava/io/InputStream;)S

    move-result v2

    .line 122
    .local v2, "length":S
    const/4 v3, 0x1

    if-ge v2, v3, :cond_1e

    .line 124
    new-instance v3, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v4, 0x32

    invoke-direct {v3, v4}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v3

    .line 127
    :cond_1e
    invoke-static {v2, v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint8Array(ILjava/io/InputStream;)[S

    move-result-object v1

    .line 129
    .local v1, "ecPointFormats":[S
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsProtocol;->assertEmpty(Ljava/io/ByteArrayInputStream;)V

    .line 131
    const/4 v3, 0x0

    invoke-static {v1, v3}, Lorg/spongycastle/util/Arrays;->contains([SS)Z

    move-result v3

    if-nez v3, :cond_34

    .line 137
    new-instance v3, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v4, 0x2f

    invoke-direct {v3, v4}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v3

    .line 140
    :cond_34
    return-object v1
.end method

.method public static serializeECFieldElement(ILjava/math/BigInteger;)[B
    .registers 3
    .param p0, "fieldSize"    # I
    .param p1, "x"    # Ljava/math/BigInteger;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 345
    add-int/lit8 v0, p0, 0x7

    div-int/lit8 v0, v0, 0x8

    invoke-static {v0, p1}, Lorg/spongycastle/util/BigIntegers;->asUnsignedByteArray(ILjava/math/BigInteger;)[B

    move-result-object v0

    return-object v0
.end method

.method public static serializeECPoint([SLorg/spongycastle/math/ec/ECPoint;)[B
    .registers 5
    .param p0, "ecPointFormats"    # [S
    .param p1, "point"    # Lorg/spongycastle/math/ec/ECPoint;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 350
    invoke-virtual {p1}, Lorg/spongycastle/math/ec/ECPoint;->getCurve()Lorg/spongycastle/math/ec/ECCurve;

    move-result-object v1

    .line 358
    .local v1, "curve":Lorg/spongycastle/math/ec/ECCurve;
    const/4 v0, 0x0

    .line 359
    .local v0, "compressed":Z
    invoke-static {v1}, Lorg/spongycastle/math/ec/ECAlgorithms;->isFpCurve(Lorg/spongycastle/math/ec/ECCurve;)Z

    move-result v2

    if-eqz v2, :cond_15

    .line 361
    const/4 v2, 0x1

    invoke-static {p0, v2}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->isCompressionPreferred([SS)Z

    move-result v0

    .line 367
    :cond_10
    :goto_10
    invoke-virtual {p1, v0}, Lorg/spongycastle/math/ec/ECPoint;->getEncoded(Z)[B

    move-result-object v2

    return-object v2

    .line 363
    :cond_15
    invoke-static {v1}, Lorg/spongycastle/math/ec/ECAlgorithms;->isF2mCurve(Lorg/spongycastle/math/ec/ECCurve;)Z

    move-result v2

    if-eqz v2, :cond_10

    .line 365
    const/4 v2, 0x2

    invoke-static {p0, v2}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->isCompressionPreferred([SS)Z

    move-result v0

    goto :goto_10
.end method

.method public static serializeECPublicKey([SLorg/spongycastle/crypto/params/ECPublicKeyParameters;)[B
    .registers 3
    .param p0, "ecPointFormats"    # [S
    .param p1, "keyParameters"    # Lorg/spongycastle/crypto/params/ECPublicKeyParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 373
    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/ECPublicKeyParameters;->getQ()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v0

    invoke-static {p0, v0}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->serializeECPoint([SLorg/spongycastle/math/ec/ECPoint;)[B

    move-result-object v0

    return-object v0
.end method

.method public static validateECPublicKey(Lorg/spongycastle/crypto/params/ECPublicKeyParameters;)Lorg/spongycastle/crypto/params/ECPublicKeyParameters;
    .registers 1
    .param p0, "key"    # Lorg/spongycastle/crypto/params/ECPublicKeyParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 546
    return-object p0
.end method

.method public static writeECExponent(ILjava/io/OutputStream;)V
    .registers 5
    .param p0, "k"    # I
    .param p1, "output"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 671
    int-to-long v1, p0

    invoke-static {v1, v2}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v0

    .line 672
    .local v0, "K":Ljava/math/BigInteger;
    invoke-static {v0, p1}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->writeECParameter(Ljava/math/BigInteger;Ljava/io/OutputStream;)V

    .line 673
    return-void
.end method

.method public static writeECFieldElement(ILjava/math/BigInteger;Ljava/io/OutputStream;)V
    .registers 4
    .param p0, "fieldSize"    # I
    .param p1, "x"    # Ljava/math/BigInteger;
    .param p2, "output"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 682
    invoke-static {p0, p1}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->serializeECFieldElement(ILjava/math/BigInteger;)[B

    move-result-object v0

    invoke-static {v0, p2}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeOpaque8([BLjava/io/OutputStream;)V

    .line 683
    return-void
.end method

.method public static writeECFieldElement(Lorg/spongycastle/math/ec/ECFieldElement;Ljava/io/OutputStream;)V
    .registers 3
    .param p0, "x"    # Lorg/spongycastle/math/ec/ECFieldElement;
    .param p1, "output"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 677
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/ECFieldElement;->getEncoded()[B

    move-result-object v0

    invoke-static {v0, p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeOpaque8([BLjava/io/OutputStream;)V

    .line 678
    return-void
.end method

.method public static writeECParameter(Ljava/math/BigInteger;Ljava/io/OutputStream;)V
    .registers 3
    .param p0, "x"    # Ljava/math/BigInteger;
    .param p1, "output"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 687
    invoke-static {p0}, Lorg/spongycastle/util/BigIntegers;->asUnsignedByteArray(Ljava/math/BigInteger;)[B

    move-result-object v0

    invoke-static {v0, p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeOpaque8([BLjava/io/OutputStream;)V

    .line 688
    return-void
.end method

.method public static writeECPoint([SLorg/spongycastle/math/ec/ECPoint;Ljava/io/OutputStream;)V
    .registers 4
    .param p0, "ecPointFormats"    # [S
    .param p1, "point"    # Lorg/spongycastle/math/ec/ECPoint;
    .param p2, "output"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 743
    invoke-static {p0, p1}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->serializeECPoint([SLorg/spongycastle/math/ec/ECPoint;)[B

    move-result-object v0

    invoke-static {v0, p2}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeOpaque8([BLjava/io/OutputStream;)V

    .line 744
    return-void
.end method

.method public static writeExplicitECParameters([SLorg/spongycastle/crypto/params/ECDomainParameters;Ljava/io/OutputStream;)V
    .registers 12
    .param p0, "ecPointFormats"    # [S
    .param p1, "ecParameters"    # Lorg/spongycastle/crypto/params/ECDomainParameters;
    .param p2, "output"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x3

    const/4 v7, 0x2

    const/4 v6, 0x1

    .line 693
    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/ECDomainParameters;->getCurve()Lorg/spongycastle/math/ec/ECCurve;

    move-result-object v0

    .line 695
    .local v0, "curve":Lorg/spongycastle/math/ec/ECCurve;
    invoke-static {v0}, Lorg/spongycastle/math/ec/ECAlgorithms;->isFpCurve(Lorg/spongycastle/math/ec/ECCurve;)Z

    move-result v4

    if-eqz v4, :cond_43

    .line 697
    invoke-static {v6, p2}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint8(SLjava/io/OutputStream;)V

    .line 699
    invoke-virtual {v0}, Lorg/spongycastle/math/ec/ECCurve;->getField()Lorg/spongycastle/math/field/FiniteField;

    move-result-object v4

    invoke-interface {v4}, Lorg/spongycastle/math/field/FiniteField;->getCharacteristic()Ljava/math/BigInteger;

    move-result-object v4

    invoke-static {v4, p2}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->writeECParameter(Ljava/math/BigInteger;Ljava/io/OutputStream;)V

    .line 734
    :goto_1b
    invoke-virtual {v0}, Lorg/spongycastle/math/ec/ECCurve;->getA()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v4

    invoke-static {v4, p2}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->writeECFieldElement(Lorg/spongycastle/math/ec/ECFieldElement;Ljava/io/OutputStream;)V

    .line 735
    invoke-virtual {v0}, Lorg/spongycastle/math/ec/ECCurve;->getB()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v4

    invoke-static {v4, p2}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->writeECFieldElement(Lorg/spongycastle/math/ec/ECFieldElement;Ljava/io/OutputStream;)V

    .line 736
    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/ECDomainParameters;->getG()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v4

    invoke-static {p0, v4}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->serializeECPoint([SLorg/spongycastle/math/ec/ECPoint;)[B

    move-result-object v4

    invoke-static {v4, p2}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeOpaque8([BLjava/io/OutputStream;)V

    .line 737
    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/ECDomainParameters;->getN()Ljava/math/BigInteger;

    move-result-object v4

    invoke-static {v4, p2}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->writeECParameter(Ljava/math/BigInteger;Ljava/io/OutputStream;)V

    .line 738
    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/ECDomainParameters;->getH()Ljava/math/BigInteger;

    move-result-object v4

    invoke-static {v4, p2}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->writeECParameter(Ljava/math/BigInteger;Ljava/io/OutputStream;)V

    .line 739
    return-void

    .line 701
    :cond_43
    invoke-static {v0}, Lorg/spongycastle/math/ec/ECAlgorithms;->isF2mCurve(Lorg/spongycastle/math/ec/ECCurve;)Z

    move-result v4

    if-eqz v4, :cond_90

    .line 703
    invoke-virtual {v0}, Lorg/spongycastle/math/ec/ECCurve;->getField()Lorg/spongycastle/math/field/FiniteField;

    move-result-object v2

    check-cast v2, Lorg/spongycastle/math/field/PolynomialExtensionField;

    .line 704
    .local v2, "field":Lorg/spongycastle/math/field/PolynomialExtensionField;
    invoke-interface {v2}, Lorg/spongycastle/math/field/PolynomialExtensionField;->getMinimalPolynomial()Lorg/spongycastle/math/field/Polynomial;

    move-result-object v4

    invoke-interface {v4}, Lorg/spongycastle/math/field/Polynomial;->getExponentsPresent()[I

    move-result-object v1

    .line 706
    .local v1, "exponents":[I
    invoke-static {v7, p2}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint8(SLjava/io/OutputStream;)V

    .line 708
    array-length v4, v1

    add-int/lit8 v4, v4, -0x1

    aget v3, v1, v4

    .line 709
    .local v3, "m":I
    invoke-static {v3}, Lorg/spongycastle/crypto/tls/TlsUtils;->checkUint16(I)V

    .line 710
    invoke-static {v3, p2}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint16(ILjava/io/OutputStream;)V

    .line 712
    array-length v4, v1

    if-ne v4, v8, :cond_71

    .line 714
    invoke-static {v6, p2}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint8(SLjava/io/OutputStream;)V

    .line 715
    aget v4, v1, v6

    invoke-static {v4, p2}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->writeECExponent(ILjava/io/OutputStream;)V

    goto :goto_1b

    .line 717
    :cond_71
    array-length v4, v1

    const/4 v5, 0x5

    if-ne v4, v5, :cond_88

    .line 719
    invoke-static {v7, p2}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint8(SLjava/io/OutputStream;)V

    .line 720
    aget v4, v1, v6

    invoke-static {v4, p2}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->writeECExponent(ILjava/io/OutputStream;)V

    .line 721
    aget v4, v1, v7

    invoke-static {v4, p2}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->writeECExponent(ILjava/io/OutputStream;)V

    .line 722
    aget v4, v1, v8

    invoke-static {v4, p2}, Lorg/spongycastle/crypto/tls/TlsECCUtils;->writeECExponent(ILjava/io/OutputStream;)V

    goto :goto_1b

    .line 726
    :cond_88
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "Only trinomial and pentomial curves are supported"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 731
    .end local v1    # "exponents":[I
    .end local v2    # "field":Lorg/spongycastle/math/field/PolynomialExtensionField;
    .end local v3    # "m":I
    :cond_90
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "\'ecParameters\' not a known curve type"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method public static writeNamedECParameters(ILjava/io/OutputStream;)V
    .registers 4
    .param p0, "namedCurve"    # I
    .param p1, "output"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 748
    invoke-static {p0}, Lorg/spongycastle/crypto/tls/NamedCurve;->refersToASpecificNamedCurve(I)Z

    move-result v0

    if-nez v0, :cond_e

    .line 755
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v1, 0x50

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v0

    .line 758
    :cond_e
    const/4 v0, 0x3

    invoke-static {v0, p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint8(SLjava/io/OutputStream;)V

    .line 759
    invoke-static {p0}, Lorg/spongycastle/crypto/tls/TlsUtils;->checkUint16(I)V

    .line 760
    invoke-static {p0, p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint16(ILjava/io/OutputStream;)V

    .line 761
    return-void
.end method
