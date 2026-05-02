.class public Lorg/spongycastle/jcajce/util/DefaultJcaJceHelper;
.super Ljava/lang/Object;
.source "DefaultJcaJceHelper.java"

# interfaces
.implements Lorg/spongycastle/jcajce/util/JcaJceHelper;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createAlgorithmParameterGenerator(Ljava/lang/String;)Ljava/security/AlgorithmParameterGenerator;
    .registers 3
    .param p1, "algorithm"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .prologue
    .line 49
    invoke-static {p1}, Ljava/security/AlgorithmParameterGenerator;->getInstance(Ljava/lang/String;)Ljava/security/AlgorithmParameterGenerator;

    move-result-object v0

    return-object v0
.end method

.method public createAlgorithmParameters(Ljava/lang/String;)Ljava/security/AlgorithmParameters;
    .registers 3
    .param p1, "algorithm"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .prologue
    .line 55
    invoke-static {p1}, Ljava/security/AlgorithmParameters;->getInstance(Ljava/lang/String;)Ljava/security/AlgorithmParameters;

    move-result-object v0

    return-object v0
.end method

.method public createCertificateFactory(Ljava/lang/String;)Ljava/security/cert/CertificateFactory;
    .registers 3
    .param p1, "algorithm"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateException;
        }
    .end annotation

    .prologue
    .line 97
    invoke-static {p1}, Ljava/security/cert/CertificateFactory;->getInstance(Ljava/lang/String;)Ljava/security/cert/CertificateFactory;

    move-result-object v0

    return-object v0
.end method

.method public createCipher(Ljava/lang/String;)Ljavax/crypto/Cipher;
    .registers 3
    .param p1, "algorithm"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;,
            Ljavax/crypto/NoSuchPaddingException;
        }
    .end annotation

    .prologue
    .line 31
    invoke-static {p1}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v0

    return-object v0
.end method

.method public createDigest(Ljava/lang/String;)Ljava/security/MessageDigest;
    .registers 3
    .param p1, "algorithm"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .prologue
    .line 85
    invoke-static {p1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    return-object v0
.end method

.method public createKeyAgreement(Ljava/lang/String;)Ljavax/crypto/KeyAgreement;
    .registers 3
    .param p1, "algorithm"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .prologue
    .line 43
    invoke-static {p1}, Ljavax/crypto/KeyAgreement;->getInstance(Ljava/lang/String;)Ljavax/crypto/KeyAgreement;

    move-result-object v0

    return-object v0
.end method

.method public createKeyFactory(Ljava/lang/String;)Ljava/security/KeyFactory;
    .registers 3
    .param p1, "algorithm"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .prologue
    .line 67
    invoke-static {p1}, Ljava/security/KeyFactory;->getInstance(Ljava/lang/String;)Ljava/security/KeyFactory;

    move-result-object v0

    return-object v0
.end method

.method public createKeyGenerator(Ljava/lang/String;)Ljavax/crypto/KeyGenerator;
    .registers 3
    .param p1, "algorithm"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .prologue
    .line 61
    invoke-static {p1}, Ljavax/crypto/KeyGenerator;->getInstance(Ljava/lang/String;)Ljavax/crypto/KeyGenerator;

    move-result-object v0

    return-object v0
.end method

.method public createKeyPairGenerator(Ljava/lang/String;)Ljava/security/KeyPairGenerator;
    .registers 3
    .param p1, "algorithm"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .prologue
    .line 79
    invoke-static {p1}, Ljava/security/KeyPairGenerator;->getInstance(Ljava/lang/String;)Ljava/security/KeyPairGenerator;

    move-result-object v0

    return-object v0
.end method

.method public createMac(Ljava/lang/String;)Ljavax/crypto/Mac;
    .registers 3
    .param p1, "algorithm"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .prologue
    .line 37
    invoke-static {p1}, Ljavax/crypto/Mac;->getInstance(Ljava/lang/String;)Ljavax/crypto/Mac;

    move-result-object v0

    return-object v0
.end method

.method public createSecretKeyFactory(Ljava/lang/String;)Ljavax/crypto/SecretKeyFactory;
    .registers 3
    .param p1, "algorithm"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .prologue
    .line 73
    invoke-static {p1}, Ljavax/crypto/SecretKeyFactory;->getInstance(Ljava/lang/String;)Ljavax/crypto/SecretKeyFactory;

    move-result-object v0

    return-object v0
.end method

.method public createSignature(Ljava/lang/String;)Ljava/security/Signature;
    .registers 3
    .param p1, "algorithm"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .prologue
    .line 91
    invoke-static {p1}, Ljava/security/Signature;->getInstance(Ljava/lang/String;)Ljava/security/Signature;

    move-result-object v0

    return-object v0
.end method
