.class public Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;
.super Ljava/security/KeyStoreSpi;
.source "PKCS12KeyStoreSpi.java"

# interfaces
.implements Lorg/spongycastle/asn1/pkcs/PKCSObjectIdentifiers;
.implements Lorg/spongycastle/asn1/x509/X509ObjectIdentifiers;
.implements Lorg/spongycastle/jce/interfaces/BCKeyStore;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$DefaultSecretKeyProvider;,
        Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;,
        Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$DefPKCS12KeyStore3DES;,
        Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$DefPKCS12KeyStore;,
        Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$BCPKCS12KeyStore3DES;,
        Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$BCPKCS12KeyStore;,
        Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$CertId;
    }
.end annotation


# static fields
.field static final CERTIFICATE:I = 0x1

.field static final KEY:I = 0x2

.field static final KEY_PRIVATE:I = 0x0

.field static final KEY_PUBLIC:I = 0x1

.field static final KEY_SECRET:I = 0x2

.field private static final MIN_ITERATIONS:I = 0x400

.field static final NULL:I = 0x0

.field private static final SALT_SIZE:I = 0x14

.field static final SEALED:I = 0x4

.field static final SECRET:I = 0x3

.field private static final keySizeProvider:Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$DefaultSecretKeyProvider;


# instance fields
.field private certAlgorithm:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field private certFact:Ljava/security/cert/CertificateFactory;

.field private certs:Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;

.field private chainCerts:Ljava/util/Hashtable;

.field private final helper:Lorg/spongycastle/jcajce/util/JcaJceHelper;

.field private keyAlgorithm:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field private keyCerts:Ljava/util/Hashtable;

.field private keys:Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;

.field private localIds:Ljava/util/Hashtable;

.field protected random:Ljava/security/SecureRandom;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 116
    new-instance v0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$DefaultSecretKeyProvider;

    invoke-direct {v0}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$DefaultSecretKeyProvider;-><init>()V

    sput-object v0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->keySizeProvider:Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$DefaultSecretKeyProvider;

    return-void
.end method

.method public constructor <init>(Ljava/security/Provider;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V
    .registers 8
    .param p1, "provider"    # Ljava/security/Provider;
    .param p2, "keyAlgorithm"    # Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .param p3, "certAlgorithm"    # Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .prologue
    const/4 v2, 0x0

    .line 191
    invoke-direct {p0}, Ljava/security/KeyStoreSpi;-><init>()V

    .line 111
    new-instance v1, Lorg/spongycastle/jcajce/util/BCJcaJceHelper;

    invoke-direct {v1}, Lorg/spongycastle/jcajce/util/BCJcaJceHelper;-><init>()V

    iput-object v1, p0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->helper:Lorg/spongycastle/jcajce/util/JcaJceHelper;

    .line 118
    new-instance v1, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;

    invoke-direct {v1, v2}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;-><init>(Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$1;)V

    iput-object v1, p0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->keys:Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;

    .line 119
    new-instance v1, Ljava/util/Hashtable;

    invoke-direct {v1}, Ljava/util/Hashtable;-><init>()V

    iput-object v1, p0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->localIds:Ljava/util/Hashtable;

    .line 120
    new-instance v1, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;

    invoke-direct {v1, v2}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;-><init>(Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$1;)V

    iput-object v1, p0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->certs:Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;

    .line 121
    new-instance v1, Ljava/util/Hashtable;

    invoke-direct {v1}, Ljava/util/Hashtable;-><init>()V

    iput-object v1, p0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->chainCerts:Ljava/util/Hashtable;

    .line 122
    new-instance v1, Ljava/util/Hashtable;

    invoke-direct {v1}, Ljava/util/Hashtable;-><init>()V

    iput-object v1, p0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->keyCerts:Ljava/util/Hashtable;

    .line 140
    new-instance v1, Ljava/security/SecureRandom;

    invoke-direct {v1}, Ljava/security/SecureRandom;-><init>()V

    iput-object v1, p0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->random:Ljava/security/SecureRandom;

    .line 192
    iput-object p2, p0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->keyAlgorithm:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 193
    iput-object p3, p0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->certAlgorithm:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 197
    if-eqz p1, :cond_44

    .line 199
    :try_start_3b
    const-string v1, "X.509"

    invoke-static {v1, p1}, Ljava/security/cert/CertificateFactory;->getInstance(Ljava/lang/String;Ljava/security/Provider;)Ljava/security/cert/CertificateFactory;

    move-result-object v1

    iput-object v1, p0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->certFact:Ljava/security/cert/CertificateFactory;

    .line 210
    :goto_43
    return-void

    .line 203
    :cond_44
    const-string v1, "X.509"

    invoke-static {v1}, Ljava/security/cert/CertificateFactory;->getInstance(Ljava/lang/String;)Ljava/security/cert/CertificateFactory;

    move-result-object v1

    iput-object v1, p0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->certFact:Ljava/security/cert/CertificateFactory;
    :try_end_4c
    .catch Ljava/lang/Exception; {:try_start_3b .. :try_end_4c} :catch_4d

    goto :goto_43

    .line 206
    :catch_4d
    move-exception v0

    .line 208
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "can\'t create cert factory - "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method static synthetic access$100(Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;Ljava/security/PublicKey;)Lorg/spongycastle/asn1/x509/SubjectKeyIdentifier;
    .registers 3
    .param p0, "x0"    # Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;
    .param p1, "x1"    # Ljava/security/PublicKey;

    .prologue
    .line 107
    invoke-direct {p0, p1}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->createSubjectKeyId(Ljava/security/PublicKey;)Lorg/spongycastle/asn1/x509/SubjectKeyIdentifier;

    move-result-object v0

    return-object v0
.end method

.method private calculatePbeMac(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;[BI[CZ[B)[B
    .registers 11
    .param p1, "oid"    # Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .param p2, "salt"    # [B
    .param p3, "itCount"    # I
    .param p4, "password"    # [C
    .param p5, "wrongPkcs12Zero"    # Z
    .param p6, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 1695
    new-instance v0, Ljavax/crypto/spec/PBEParameterSpec;

    invoke-direct {v0, p2, p3}, Ljavax/crypto/spec/PBEParameterSpec;-><init>([BI)V

    .line 1697
    .local v0, "defParams":Ljavax/crypto/spec/PBEParameterSpec;
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->helper:Lorg/spongycastle/jcajce/util/JcaJceHelper;

    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/spongycastle/jcajce/util/JcaJceHelper;->createMac(Ljava/lang/String;)Ljavax/crypto/Mac;

    move-result-object v1

    .line 1698
    .local v1, "mac":Ljavax/crypto/Mac;
    new-instance v2, Lorg/spongycastle/jcajce/PKCS12Key;

    invoke-direct {v2, p4, p5}, Lorg/spongycastle/jcajce/PKCS12Key;-><init>([CZ)V

    invoke-virtual {v1, v2, v0}, Ljavax/crypto/Mac;->init(Ljava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 1699
    invoke-virtual {v1, p6}, Ljavax/crypto/Mac;->update([B)V

    .line 1701
    invoke-virtual {v1}, Ljavax/crypto/Mac;->doFinal()[B

    move-result-object v2

    return-object v2
.end method

.method private createCipher(I[CLorg/spongycastle/asn1/x509/AlgorithmIdentifier;)Ljavax/crypto/Cipher;
    .registers 20
    .param p1, "mode"    # I
    .param p2, "password"    # [C
    .param p3, "algId"    # Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/spec/InvalidKeySpecException;,
            Ljavax/crypto/NoSuchPaddingException;,
            Ljava/security/InvalidKeyException;,
            Ljava/security/InvalidAlgorithmParameterException;,
            Ljava/security/NoSuchProviderException;
        }
    .end annotation

    .prologue
    .line 729
    invoke-virtual/range {p3 .. p3}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->getParameters()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v1

    invoke-static {v1}, Lorg/spongycastle/asn1/pkcs/PBES2Parameters;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/pkcs/PBES2Parameters;

    move-result-object v7

    .line 730
    .local v7, "alg":Lorg/spongycastle/asn1/pkcs/PBES2Parameters;
    invoke-virtual {v7}, Lorg/spongycastle/asn1/pkcs/PBES2Parameters;->getKeyDerivationFunc()Lorg/spongycastle/asn1/pkcs/KeyDerivationFunc;

    move-result-object v1

    invoke-virtual {v1}, Lorg/spongycastle/asn1/pkcs/KeyDerivationFunc;->getParameters()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v1

    invoke-static {v1}, Lorg/spongycastle/asn1/pkcs/PBKDF2Params;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/pkcs/PBKDF2Params;

    move-result-object v12

    .line 731
    .local v12, "func":Lorg/spongycastle/asn1/pkcs/PBKDF2Params;
    invoke-virtual {v7}, Lorg/spongycastle/asn1/pkcs/PBES2Parameters;->getEncryptionScheme()Lorg/spongycastle/asn1/pkcs/EncryptionScheme;

    move-result-object v1

    invoke-static {v1}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    move-result-object v10

    .line 733
    .local v10, "encScheme":Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->helper:Lorg/spongycastle/jcajce/util/JcaJceHelper;

    invoke-virtual {v7}, Lorg/spongycastle/asn1/pkcs/PBES2Parameters;->getKeyDerivationFunc()Lorg/spongycastle/asn1/pkcs/KeyDerivationFunc;

    move-result-object v2

    invoke-virtual {v2}, Lorg/spongycastle/asn1/pkcs/KeyDerivationFunc;->getAlgorithm()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v2

    invoke-virtual {v2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/spongycastle/jcajce/util/JcaJceHelper;->createSecretKeyFactory(Ljava/lang/String;)Ljavax/crypto/SecretKeyFactory;

    move-result-object v15

    .line 736
    .local v15, "keyFact":Ljavax/crypto/SecretKeyFactory;
    invoke-virtual {v12}, Lorg/spongycastle/asn1/pkcs/PBKDF2Params;->isDefaultPrf()Z

    move-result v1

    if-eqz v1, :cond_8a

    .line 738
    new-instance v1, Ljavax/crypto/spec/PBEKeySpec;

    invoke-virtual {v12}, Lorg/spongycastle/asn1/pkcs/PBKDF2Params;->getSalt()[B

    move-result-object v2

    invoke-virtual {v12}, Lorg/spongycastle/asn1/pkcs/PBKDF2Params;->getIterationCount()Ljava/math/BigInteger;

    move-result-object v3

    invoke-virtual {v3}, Ljava/math/BigInteger;->intValue()I

    move-result v3

    sget-object v4, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->keySizeProvider:Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$DefaultSecretKeyProvider;

    invoke-virtual {v4, v10}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$DefaultSecretKeyProvider;->getKeySize(Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;)I

    move-result v4

    move-object/from16 v0, p2

    invoke-direct {v1, v0, v2, v3, v4}, Ljavax/crypto/spec/PBEKeySpec;-><init>([C[BII)V

    invoke-virtual {v15, v1}, Ljavax/crypto/SecretKeyFactory;->generateSecret(Ljava/security/spec/KeySpec;)Ljavax/crypto/SecretKey;

    move-result-object v14

    .line 745
    .local v14, "key":Ljavax/crypto/SecretKey;
    :goto_53
    invoke-virtual {v7}, Lorg/spongycastle/asn1/pkcs/PBES2Parameters;->getEncryptionScheme()Lorg/spongycastle/asn1/pkcs/EncryptionScheme;

    move-result-object v1

    invoke-virtual {v1}, Lorg/spongycastle/asn1/pkcs/EncryptionScheme;->getAlgorithm()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v1

    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v8

    .line 747
    .local v8, "cipher":Ljavax/crypto/Cipher;
    invoke-virtual {v7}, Lorg/spongycastle/asn1/pkcs/PBES2Parameters;->getEncryptionScheme()Lorg/spongycastle/asn1/pkcs/EncryptionScheme;

    move-result-object v1

    invoke-static {v1}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    move-result-object v11

    .line 749
    .local v11, "encryptionAlg":Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;
    invoke-virtual {v7}, Lorg/spongycastle/asn1/pkcs/PBES2Parameters;->getEncryptionScheme()Lorg/spongycastle/asn1/pkcs/EncryptionScheme;

    move-result-object v1

    invoke-virtual {v1}, Lorg/spongycastle/asn1/pkcs/EncryptionScheme;->getParameters()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v9

    .line 750
    .local v9, "encParams":Lorg/spongycastle/asn1/ASN1Encodable;
    instance-of v1, v9, Lorg/spongycastle/asn1/ASN1OctetString;

    if-eqz v1, :cond_ac

    .line 752
    new-instance v1, Ljavax/crypto/spec/IvParameterSpec;

    invoke-static {v9}, Lorg/spongycastle/asn1/ASN1OctetString;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1OctetString;

    move-result-object v2

    invoke-virtual {v2}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v2

    invoke-direct {v1, v2}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    move/from16 v0, p1

    invoke-virtual {v8, v0, v14, v1}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 761
    :goto_89
    return-object v8

    .line 742
    .end local v8    # "cipher":Ljavax/crypto/Cipher;
    .end local v9    # "encParams":Lorg/spongycastle/asn1/ASN1Encodable;
    .end local v11    # "encryptionAlg":Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;
    .end local v14    # "key":Ljavax/crypto/SecretKey;
    :cond_8a
    new-instance v1, Lorg/spongycastle/jcajce/spec/PBKDF2KeySpec;

    invoke-virtual {v12}, Lorg/spongycastle/asn1/pkcs/PBKDF2Params;->getSalt()[B

    move-result-object v3

    invoke-virtual {v12}, Lorg/spongycastle/asn1/pkcs/PBKDF2Params;->getIterationCount()Ljava/math/BigInteger;

    move-result-object v2

    invoke-virtual {v2}, Ljava/math/BigInteger;->intValue()I

    move-result v4

    sget-object v2, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->keySizeProvider:Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$DefaultSecretKeyProvider;

    invoke-virtual {v2, v10}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$DefaultSecretKeyProvider;->getKeySize(Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;)I

    move-result v5

    invoke-virtual {v12}, Lorg/spongycastle/asn1/pkcs/PBKDF2Params;->getPrf()Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    move-result-object v6

    move-object/from16 v2, p2

    invoke-direct/range {v1 .. v6}, Lorg/spongycastle/jcajce/spec/PBKDF2KeySpec;-><init>([C[BIILorg/spongycastle/asn1/x509/AlgorithmIdentifier;)V

    invoke-virtual {v15, v1}, Ljavax/crypto/SecretKeyFactory;->generateSecret(Ljava/security/spec/KeySpec;)Ljavax/crypto/SecretKey;

    move-result-object v14

    .restart local v14    # "key":Ljavax/crypto/SecretKey;
    goto :goto_53

    .line 757
    .restart local v8    # "cipher":Ljavax/crypto/Cipher;
    .restart local v9    # "encParams":Lorg/spongycastle/asn1/ASN1Encodable;
    .restart local v11    # "encryptionAlg":Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;
    :cond_ac
    invoke-static {v9}, Lorg/spongycastle/asn1/cryptopro/GOST28147Parameters;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cryptopro/GOST28147Parameters;

    move-result-object v13

    .line 759
    .local v13, "gParams":Lorg/spongycastle/asn1/cryptopro/GOST28147Parameters;
    new-instance v1, Lorg/spongycastle/jcajce/spec/GOST28147ParameterSpec;

    invoke-virtual {v13}, Lorg/spongycastle/asn1/cryptopro/GOST28147Parameters;->getEncryptionParamSet()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v2

    invoke-virtual {v13}, Lorg/spongycastle/asn1/cryptopro/GOST28147Parameters;->getIV()[B

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lorg/spongycastle/jcajce/spec/GOST28147ParameterSpec;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;[B)V

    move/from16 v0, p1

    invoke-virtual {v8, v0, v14, v1}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    goto :goto_89
.end method

.method private createSubjectKeyId(Ljava/security/PublicKey;)Lorg/spongycastle/asn1/x509/SubjectKeyIdentifier;
    .registers 6
    .param p1, "pubKey"    # Ljava/security/PublicKey;

    .prologue
    .line 217
    :try_start_0
    invoke-interface {p1}, Ljava/security/PublicKey;->getEncoded()[B

    move-result-object v2

    invoke-static {v2}, Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;

    move-result-object v1

    .line 219
    .local v1, "info":Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;
    new-instance v2, Lorg/spongycastle/asn1/x509/SubjectKeyIdentifier;

    invoke-static {v1}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->getDigest(Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;)[B

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/spongycastle/asn1/x509/SubjectKeyIdentifier;-><init>([B)V
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_11} :catch_12

    return-object v2

    .line 221
    .end local v1    # "info":Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;
    :catch_12
    move-exception v0

    .line 223
    .local v0, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "error creating key"

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private doStore(Ljava/io/OutputStream;[CZ)V
    .registers 67
    .param p1, "stream"    # Ljava/io/OutputStream;
    .param p2, "password"    # [C
    .param p3, "useDEREncoding"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1266
    if-nez p2, :cond_a

    .line 1268
    new-instance v4, Ljava/lang/NullPointerException;

    const-string v5, "No password supplied for PKCS#12 KeyStore."

    invoke-direct {v4, v5}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 1274
    :cond_a
    new-instance v48, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct/range {v48 .. v48}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 1276
    .local v48, "keyS":Lorg/spongycastle/asn1/ASN1EncodableVector;
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->keys:Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;

    invoke-virtual {v4}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;->keys()Ljava/util/Enumeration;

    move-result-object v51

    .line 1278
    .local v51, "ks":Ljava/util/Enumeration;
    :goto_17
    invoke-interface/range {v51 .. v51}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-eqz v4, :cond_18a

    .line 1280
    const/16 v4, 0x14

    new-array v0, v4, [B

    move-object/from16 v46, v0

    .line 1282
    .local v46, "kSalt":[B
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->random:Ljava/security/SecureRandom;

    move-object/from16 v0, v46

    invoke-virtual {v4, v0}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 1284
    invoke-interface/range {v51 .. v51}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v54

    check-cast v54, Ljava/lang/String;

    .line 1285
    .local v54, "name":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->keys:Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;

    move-object/from16 v0, v54

    invoke-virtual {v4, v0}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v59

    check-cast v59, Ljava/security/PrivateKey;

    .line 1286
    .local v59, "privKey":Ljava/security/PrivateKey;
    new-instance v45, Lorg/spongycastle/asn1/pkcs/PKCS12PBEParams;

    const/16 v4, 0x400

    move-object/from16 v0, v45

    move-object/from16 v1, v46

    invoke-direct {v0, v1, v4}, Lorg/spongycastle/asn1/pkcs/PKCS12PBEParams;-><init>([BI)V

    .line 1287
    .local v45, "kParams":Lorg/spongycastle/asn1/pkcs/PKCS12PBEParams;
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->keyAlgorithm:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v4}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    move-object/from16 v1, v59

    move-object/from16 v2, v45

    move-object/from16 v3, p2

    invoke-virtual {v0, v4, v1, v2, v3}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->wrapKey(Ljava/lang/String;Ljava/security/Key;Lorg/spongycastle/asn1/pkcs/PKCS12PBEParams;[C)[B

    move-result-object v42

    .line 1288
    .local v42, "kBytes":[B
    new-instance v40, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->keyAlgorithm:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual/range {v45 .. v45}, Lorg/spongycastle/asn1/pkcs/PKCS12PBEParams;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v5

    move-object/from16 v0, v40

    invoke-direct {v0, v4, v5}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 1289
    .local v40, "kAlgId":Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;
    new-instance v43, Lorg/spongycastle/asn1/pkcs/EncryptedPrivateKeyInfo;

    move-object/from16 v0, v43

    move-object/from16 v1, v40

    move-object/from16 v2, v42

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/asn1/pkcs/EncryptedPrivateKeyInfo;-><init>(Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;[B)V

    .line 1290
    .local v43, "kInfo":Lorg/spongycastle/asn1/pkcs/EncryptedPrivateKeyInfo;
    const/16 v19, 0x0

    .line 1291
    .local v19, "attrSet":Z
    new-instance v44, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct/range {v44 .. v44}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 1293
    .local v44, "kName":Lorg/spongycastle/asn1/ASN1EncodableVector;
    move-object/from16 v0, v59

    instance-of v4, v0, Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;

    if-eqz v4, :cond_10e

    move-object/from16 v22, v59

    .line 1295
    check-cast v22, Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;

    .line 1299
    .local v22, "bagAttrs":Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;
    sget-object v4, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->pkcs_9_at_friendlyName:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-object/from16 v0, v22

    invoke-interface {v0, v4}, Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;->getBagAttribute(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v55

    check-cast v55, Lorg/spongycastle/asn1/DERBMPString;

    .line 1300
    .local v55, "nm":Lorg/spongycastle/asn1/DERBMPString;
    if-eqz v55, :cond_a0

    invoke-virtual/range {v55 .. v55}, Lorg/spongycastle/asn1/DERBMPString;->getString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v54

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_ae

    .line 1302
    :cond_a0
    sget-object v4, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->pkcs_9_at_friendlyName:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    new-instance v5, Lorg/spongycastle/asn1/DERBMPString;

    move-object/from16 v0, v54

    invoke-direct {v5, v0}, Lorg/spongycastle/asn1/DERBMPString;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v22

    invoke-interface {v0, v4, v5}, Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;->setBagAttribute(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 1308
    :cond_ae
    sget-object v4, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->pkcs_9_at_localKeyId:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-object/from16 v0, v22

    invoke-interface {v0, v4}, Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;->getBagAttribute(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v4

    if-nez v4, :cond_d1

    .line 1310
    move-object/from16 v0, p0

    move-object/from16 v1, v54

    invoke-virtual {v0, v1}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->engineGetCertificate(Ljava/lang/String;)Ljava/security/cert/Certificate;

    move-result-object v33

    .line 1312
    .local v33, "ct":Ljava/security/cert/Certificate;
    sget-object v4, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->pkcs_9_at_localKeyId:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual/range {v33 .. v33}, Ljava/security/cert/Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v5

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->createSubjectKeyId(Ljava/security/PublicKey;)Lorg/spongycastle/asn1/x509/SubjectKeyIdentifier;

    move-result-object v5

    move-object/from16 v0, v22

    invoke-interface {v0, v4, v5}, Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;->setBagAttribute(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 1315
    .end local v33    # "ct":Ljava/security/cert/Certificate;
    :cond_d1
    invoke-interface/range {v22 .. v22}, Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;->getBagAttributeKeys()Ljava/util/Enumeration;

    move-result-object v36

    .line 1317
    .local v36, "e":Ljava/util/Enumeration;
    :goto_d5
    invoke-interface/range {v36 .. v36}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-eqz v4, :cond_10e

    .line 1319
    invoke-interface/range {v36 .. v36}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v56

    check-cast v56, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 1320
    .local v56, "oid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    new-instance v47, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct/range {v47 .. v47}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 1322
    .local v47, "kSeq":Lorg/spongycastle/asn1/ASN1EncodableVector;
    move-object/from16 v0, v47

    move-object/from16 v1, v56

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 1323
    new-instance v4, Lorg/spongycastle/asn1/DERSet;

    move-object/from16 v0, v22

    move-object/from16 v1, v56

    invoke-interface {v0, v1}, Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;->getBagAttribute(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/spongycastle/asn1/DERSet;-><init>(Lorg/spongycastle/asn1/ASN1Encodable;)V

    move-object/from16 v0, v47

    invoke-virtual {v0, v4}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 1325
    const/16 v19, 0x1

    .line 1327
    new-instance v4, Lorg/spongycastle/asn1/DERSequence;

    move-object/from16 v0, v47

    invoke-direct {v4, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    move-object/from16 v0, v44

    invoke-virtual {v0, v4}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    goto :goto_d5

    .line 1331
    .end local v22    # "bagAttrs":Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;
    .end local v36    # "e":Ljava/util/Enumeration;
    .end local v47    # "kSeq":Lorg/spongycastle/asn1/ASN1EncodableVector;
    .end local v55    # "nm":Lorg/spongycastle/asn1/DERBMPString;
    .end local v56    # "oid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    :cond_10e
    if-nez v19, :cond_16d

    .line 1336
    new-instance v47, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct/range {v47 .. v47}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 1337
    .restart local v47    # "kSeq":Lorg/spongycastle/asn1/ASN1EncodableVector;
    move-object/from16 v0, p0

    move-object/from16 v1, v54

    invoke-virtual {v0, v1}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->engineGetCertificate(Ljava/lang/String;)Ljava/security/cert/Certificate;

    move-result-object v33

    .line 1339
    .restart local v33    # "ct":Ljava/security/cert/Certificate;
    sget-object v4, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->pkcs_9_at_localKeyId:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-object/from16 v0, v47

    invoke-virtual {v0, v4}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 1340
    new-instance v4, Lorg/spongycastle/asn1/DERSet;

    invoke-virtual/range {v33 .. v33}, Ljava/security/cert/Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v5

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->createSubjectKeyId(Ljava/security/PublicKey;)Lorg/spongycastle/asn1/x509/SubjectKeyIdentifier;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/spongycastle/asn1/DERSet;-><init>(Lorg/spongycastle/asn1/ASN1Encodable;)V

    move-object/from16 v0, v47

    invoke-virtual {v0, v4}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 1342
    new-instance v4, Lorg/spongycastle/asn1/DERSequence;

    move-object/from16 v0, v47

    invoke-direct {v4, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    move-object/from16 v0, v44

    invoke-virtual {v0, v4}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 1344
    new-instance v47, Lorg/spongycastle/asn1/ASN1EncodableVector;

    .end local v47    # "kSeq":Lorg/spongycastle/asn1/ASN1EncodableVector;
    invoke-direct/range {v47 .. v47}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 1346
    .restart local v47    # "kSeq":Lorg/spongycastle/asn1/ASN1EncodableVector;
    sget-object v4, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->pkcs_9_at_friendlyName:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-object/from16 v0, v47

    invoke-virtual {v0, v4}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 1347
    new-instance v4, Lorg/spongycastle/asn1/DERSet;

    new-instance v5, Lorg/spongycastle/asn1/DERBMPString;

    move-object/from16 v0, v54

    invoke-direct {v5, v0}, Lorg/spongycastle/asn1/DERBMPString;-><init>(Ljava/lang/String;)V

    invoke-direct {v4, v5}, Lorg/spongycastle/asn1/DERSet;-><init>(Lorg/spongycastle/asn1/ASN1Encodable;)V

    move-object/from16 v0, v47

    invoke-virtual {v0, v4}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 1349
    new-instance v4, Lorg/spongycastle/asn1/DERSequence;

    move-object/from16 v0, v47

    invoke-direct {v4, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    move-object/from16 v0, v44

    invoke-virtual {v0, v4}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 1352
    .end local v33    # "ct":Ljava/security/cert/Certificate;
    .end local v47    # "kSeq":Lorg/spongycastle/asn1/ASN1EncodableVector;
    :cond_16d
    new-instance v41, Lorg/spongycastle/asn1/pkcs/SafeBag;

    sget-object v4, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->pkcs8ShroudedKeyBag:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual/range {v43 .. v43}, Lorg/spongycastle/asn1/pkcs/EncryptedPrivateKeyInfo;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v5

    new-instance v7, Lorg/spongycastle/asn1/DERSet;

    move-object/from16 v0, v44

    invoke-direct {v7, v0}, Lorg/spongycastle/asn1/DERSet;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    move-object/from16 v0, v41

    invoke-direct {v0, v4, v5, v7}, Lorg/spongycastle/asn1/pkcs/SafeBag;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/ASN1Encodable;Lorg/spongycastle/asn1/ASN1Set;)V

    .line 1353
    .local v41, "kBag":Lorg/spongycastle/asn1/pkcs/SafeBag;
    move-object/from16 v0, v48

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    goto/16 :goto_17

    .line 1356
    .end local v19    # "attrSet":Z
    .end local v40    # "kAlgId":Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;
    .end local v41    # "kBag":Lorg/spongycastle/asn1/pkcs/SafeBag;
    .end local v42    # "kBytes":[B
    .end local v43    # "kInfo":Lorg/spongycastle/asn1/pkcs/EncryptedPrivateKeyInfo;
    .end local v44    # "kName":Lorg/spongycastle/asn1/ASN1EncodableVector;
    .end local v45    # "kParams":Lorg/spongycastle/asn1/pkcs/PKCS12PBEParams;
    .end local v46    # "kSalt":[B
    .end local v54    # "name":Ljava/lang/String;
    .end local v59    # "privKey":Ljava/security/PrivateKey;
    :cond_18a
    new-instance v4, Lorg/spongycastle/asn1/DERSequence;

    move-object/from16 v0, v48

    invoke-direct {v4, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    const-string v5, "DER"

    invoke-virtual {v4, v5}, Lorg/spongycastle/asn1/DERSequence;->getEncoded(Ljava/lang/String;)[B

    move-result-object v49

    .line 1357
    .local v49, "keySEncoded":[B
    new-instance v50, Lorg/spongycastle/asn1/BEROctetString;

    move-object/from16 v0, v50

    move-object/from16 v1, v49

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/BEROctetString;-><init>([B)V

    .line 1362
    .local v50, "keyString":Lorg/spongycastle/asn1/BEROctetString;
    const/16 v4, 0x14

    new-array v0, v4, [B

    move-object/from16 v27, v0

    .line 1364
    .local v27, "cSalt":[B
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->random:Ljava/security/SecureRandom;

    move-object/from16 v0, v27

    invoke-virtual {v4, v0}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 1366
    new-instance v31, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct/range {v31 .. v31}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 1367
    .local v31, "certSeq":Lorg/spongycastle/asn1/ASN1EncodableVector;
    new-instance v26, Lorg/spongycastle/asn1/pkcs/PKCS12PBEParams;

    const/16 v4, 0x400

    move-object/from16 v0, v26

    move-object/from16 v1, v27

    invoke-direct {v0, v1, v4}, Lorg/spongycastle/asn1/pkcs/PKCS12PBEParams;-><init>([BI)V

    .line 1368
    .local v26, "cParams":Lorg/spongycastle/asn1/pkcs/PKCS12PBEParams;
    new-instance v6, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->certAlgorithm:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual/range {v26 .. v26}, Lorg/spongycastle/asn1/pkcs/PKCS12PBEParams;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v5

    invoke-direct {v6, v4, v5}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 1369
    .local v6, "cAlgId":Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;
    new-instance v35, Ljava/util/Hashtable;

    invoke-direct/range {v35 .. v35}, Ljava/util/Hashtable;-><init>()V

    .line 1371
    .local v35, "doneCerts":Ljava/util/Hashtable;
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->keys:Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;

    invoke-virtual {v4}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;->keys()Ljava/util/Enumeration;

    move-result-object v32

    .line 1372
    .local v32, "cs":Ljava/util/Enumeration;
    :goto_1d9
    invoke-interface/range {v32 .. v32}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-eqz v4, :cond_32b

    .line 1376
    :try_start_1df
    invoke-interface/range {v32 .. v32}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v54

    check-cast v54, Ljava/lang/String;

    .line 1377
    .restart local v54    # "name":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v54

    invoke-virtual {v0, v1}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->engineGetCertificate(Ljava/lang/String;)Ljava/security/cert/Certificate;

    move-result-object v28

    .line 1378
    .local v28, "cert":Ljava/security/cert/Certificate;
    const/16 v23, 0x0

    .line 1379
    .local v23, "cAttrSet":Z
    new-instance v24, Lorg/spongycastle/asn1/pkcs/CertBag;

    sget-object v4, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->x509Certificate:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    new-instance v5, Lorg/spongycastle/asn1/DEROctetString;

    .line 1381
    invoke-virtual/range {v28 .. v28}, Ljava/security/cert/Certificate;->getEncoded()[B

    move-result-object v7

    invoke-direct {v5, v7}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    move-object/from16 v0, v24

    invoke-direct {v0, v4, v5}, Lorg/spongycastle/asn1/pkcs/CertBag;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 1382
    .local v24, "cBag":Lorg/spongycastle/asn1/pkcs/CertBag;
    new-instance v37, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct/range {v37 .. v37}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 1384
    .local v37, "fName":Lorg/spongycastle/asn1/ASN1EncodableVector;
    move-object/from16 v0, v28

    instance-of v4, v0, Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;

    if-eqz v4, :cond_290

    .line 1386
    move-object/from16 v0, v28

    check-cast v0, Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;

    move-object/from16 v22, v0

    .line 1390
    .restart local v22    # "bagAttrs":Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;
    sget-object v4, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->pkcs_9_at_friendlyName:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-object/from16 v0, v22

    invoke-interface {v0, v4}, Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;->getBagAttribute(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v55

    check-cast v55, Lorg/spongycastle/asn1/DERBMPString;

    .line 1391
    .restart local v55    # "nm":Lorg/spongycastle/asn1/DERBMPString;
    if-eqz v55, :cond_22a

    invoke-virtual/range {v55 .. v55}, Lorg/spongycastle/asn1/DERBMPString;->getString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v54

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_238

    .line 1393
    :cond_22a
    sget-object v4, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->pkcs_9_at_friendlyName:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    new-instance v5, Lorg/spongycastle/asn1/DERBMPString;

    move-object/from16 v0, v54

    invoke-direct {v5, v0}, Lorg/spongycastle/asn1/DERBMPString;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v22

    invoke-interface {v0, v4, v5}, Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;->setBagAttribute(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 1399
    :cond_238
    sget-object v4, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->pkcs_9_at_localKeyId:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-object/from16 v0, v22

    invoke-interface {v0, v4}, Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;->getBagAttribute(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v4

    if-nez v4, :cond_253

    .line 1401
    sget-object v4, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->pkcs_9_at_localKeyId:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual/range {v28 .. v28}, Ljava/security/cert/Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v5

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->createSubjectKeyId(Ljava/security/PublicKey;)Lorg/spongycastle/asn1/x509/SubjectKeyIdentifier;

    move-result-object v5

    move-object/from16 v0, v22

    invoke-interface {v0, v4, v5}, Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;->setBagAttribute(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 1404
    :cond_253
    invoke-interface/range {v22 .. v22}, Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;->getBagAttributeKeys()Ljava/util/Enumeration;

    move-result-object v36

    .line 1406
    .restart local v36    # "e":Ljava/util/Enumeration;
    :goto_257
    invoke-interface/range {v36 .. v36}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-eqz v4, :cond_290

    .line 1408
    invoke-interface/range {v36 .. v36}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v56

    check-cast v56, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 1409
    .restart local v56    # "oid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    new-instance v38, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct/range {v38 .. v38}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 1411
    .local v38, "fSeq":Lorg/spongycastle/asn1/ASN1EncodableVector;
    move-object/from16 v0, v38

    move-object/from16 v1, v56

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 1412
    new-instance v4, Lorg/spongycastle/asn1/DERSet;

    move-object/from16 v0, v22

    move-object/from16 v1, v56

    invoke-interface {v0, v1}, Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;->getBagAttribute(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/spongycastle/asn1/DERSet;-><init>(Lorg/spongycastle/asn1/ASN1Encodable;)V

    move-object/from16 v0, v38

    invoke-virtual {v0, v4}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 1413
    new-instance v4, Lorg/spongycastle/asn1/DERSequence;

    move-object/from16 v0, v38

    invoke-direct {v4, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    move-object/from16 v0, v37

    invoke-virtual {v0, v4}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 1415
    const/16 v23, 0x1

    .line 1416
    goto :goto_257

    .line 1419
    .end local v22    # "bagAttrs":Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;
    .end local v36    # "e":Ljava/util/Enumeration;
    .end local v38    # "fSeq":Lorg/spongycastle/asn1/ASN1EncodableVector;
    .end local v55    # "nm":Lorg/spongycastle/asn1/DERBMPString;
    .end local v56    # "oid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    :cond_290
    if-nez v23, :cond_2e7

    .line 1421
    new-instance v38, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct/range {v38 .. v38}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 1423
    .restart local v38    # "fSeq":Lorg/spongycastle/asn1/ASN1EncodableVector;
    sget-object v4, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->pkcs_9_at_localKeyId:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-object/from16 v0, v38

    invoke-virtual {v0, v4}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 1424
    new-instance v4, Lorg/spongycastle/asn1/DERSet;

    invoke-virtual/range {v28 .. v28}, Ljava/security/cert/Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v5

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->createSubjectKeyId(Ljava/security/PublicKey;)Lorg/spongycastle/asn1/x509/SubjectKeyIdentifier;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/spongycastle/asn1/DERSet;-><init>(Lorg/spongycastle/asn1/ASN1Encodable;)V

    move-object/from16 v0, v38

    invoke-virtual {v0, v4}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 1425
    new-instance v4, Lorg/spongycastle/asn1/DERSequence;

    move-object/from16 v0, v38

    invoke-direct {v4, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    move-object/from16 v0, v37

    invoke-virtual {v0, v4}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 1427
    new-instance v38, Lorg/spongycastle/asn1/ASN1EncodableVector;

    .end local v38    # "fSeq":Lorg/spongycastle/asn1/ASN1EncodableVector;
    invoke-direct/range {v38 .. v38}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 1429
    .restart local v38    # "fSeq":Lorg/spongycastle/asn1/ASN1EncodableVector;
    sget-object v4, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->pkcs_9_at_friendlyName:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-object/from16 v0, v38

    invoke-virtual {v0, v4}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 1430
    new-instance v4, Lorg/spongycastle/asn1/DERSet;

    new-instance v5, Lorg/spongycastle/asn1/DERBMPString;

    move-object/from16 v0, v54

    invoke-direct {v5, v0}, Lorg/spongycastle/asn1/DERBMPString;-><init>(Ljava/lang/String;)V

    invoke-direct {v4, v5}, Lorg/spongycastle/asn1/DERSet;-><init>(Lorg/spongycastle/asn1/ASN1Encodable;)V

    move-object/from16 v0, v38

    invoke-virtual {v0, v4}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 1432
    new-instance v4, Lorg/spongycastle/asn1/DERSequence;

    move-object/from16 v0, v38

    invoke-direct {v4, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    move-object/from16 v0, v37

    invoke-virtual {v0, v4}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 1435
    .end local v38    # "fSeq":Lorg/spongycastle/asn1/ASN1EncodableVector;
    :cond_2e7
    new-instance v61, Lorg/spongycastle/asn1/pkcs/SafeBag;

    sget-object v4, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->certBag:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual/range {v24 .. v24}, Lorg/spongycastle/asn1/pkcs/CertBag;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v5

    new-instance v7, Lorg/spongycastle/asn1/DERSet;

    move-object/from16 v0, v37

    invoke-direct {v7, v0}, Lorg/spongycastle/asn1/DERSet;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    move-object/from16 v0, v61

    invoke-direct {v0, v4, v5, v7}, Lorg/spongycastle/asn1/pkcs/SafeBag;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/ASN1Encodable;Lorg/spongycastle/asn1/ASN1Set;)V

    .line 1437
    .local v61, "sBag":Lorg/spongycastle/asn1/pkcs/SafeBag;
    move-object/from16 v0, v31

    move-object/from16 v1, v61

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 1439
    move-object/from16 v0, v35

    move-object/from16 v1, v28

    move-object/from16 v2, v28

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_30b
    .catch Ljava/security/cert/CertificateEncodingException; {:try_start_1df .. :try_end_30b} :catch_30d

    goto/16 :goto_1d9

    .line 1441
    .end local v23    # "cAttrSet":Z
    .end local v24    # "cBag":Lorg/spongycastle/asn1/pkcs/CertBag;
    .end local v28    # "cert":Ljava/security/cert/Certificate;
    .end local v37    # "fName":Lorg/spongycastle/asn1/ASN1EncodableVector;
    .end local v54    # "name":Ljava/lang/String;
    .end local v61    # "sBag":Lorg/spongycastle/asn1/pkcs/SafeBag;
    :catch_30d
    move-exception v36

    .line 1443
    .local v36, "e":Ljava/security/cert/CertificateEncodingException;
    new-instance v4, Ljava/io/IOException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Error encoding certificate: "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual/range {v36 .. v36}, Ljava/security/cert/CertificateEncodingException;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 1447
    .end local v36    # "e":Ljava/security/cert/CertificateEncodingException;
    :cond_32b
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->certs:Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;

    invoke-virtual {v4}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;->keys()Ljava/util/Enumeration;

    move-result-object v32

    .line 1448
    :cond_333
    :goto_333
    invoke-interface/range {v32 .. v32}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-eqz v4, :cond_458

    .line 1452
    :try_start_339
    invoke-interface/range {v32 .. v32}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v30

    check-cast v30, Ljava/lang/String;

    .line 1453
    .local v30, "certId":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->certs:Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;

    move-object/from16 v0, v30

    invoke-virtual {v4, v0}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v28

    check-cast v28, Ljava/security/cert/Certificate;

    .line 1454
    .restart local v28    # "cert":Ljava/security/cert/Certificate;
    const/16 v23, 0x0

    .line 1456
    .restart local v23    # "cAttrSet":Z
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->keys:Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;

    move-object/from16 v0, v30

    invoke-virtual {v4, v0}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    if-nez v4, :cond_333

    .line 1461
    new-instance v24, Lorg/spongycastle/asn1/pkcs/CertBag;

    sget-object v4, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->x509Certificate:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    new-instance v5, Lorg/spongycastle/asn1/DEROctetString;

    .line 1463
    invoke-virtual/range {v28 .. v28}, Ljava/security/cert/Certificate;->getEncoded()[B

    move-result-object v7

    invoke-direct {v5, v7}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    move-object/from16 v0, v24

    invoke-direct {v0, v4, v5}, Lorg/spongycastle/asn1/pkcs/CertBag;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 1464
    .restart local v24    # "cBag":Lorg/spongycastle/asn1/pkcs/CertBag;
    new-instance v37, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct/range {v37 .. v37}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 1466
    .restart local v37    # "fName":Lorg/spongycastle/asn1/ASN1EncodableVector;
    move-object/from16 v0, v28

    instance-of v4, v0, Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;

    if-eqz v4, :cond_3e9

    .line 1468
    move-object/from16 v0, v28

    check-cast v0, Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;

    move-object/from16 v22, v0

    .line 1472
    .restart local v22    # "bagAttrs":Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;
    sget-object v4, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->pkcs_9_at_friendlyName:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-object/from16 v0, v22

    invoke-interface {v0, v4}, Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;->getBagAttribute(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v55

    check-cast v55, Lorg/spongycastle/asn1/DERBMPString;

    .line 1473
    .restart local v55    # "nm":Lorg/spongycastle/asn1/DERBMPString;
    if-eqz v55, :cond_394

    invoke-virtual/range {v55 .. v55}, Lorg/spongycastle/asn1/DERBMPString;->getString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v30

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3a2

    .line 1475
    :cond_394
    sget-object v4, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->pkcs_9_at_friendlyName:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    new-instance v5, Lorg/spongycastle/asn1/DERBMPString;

    move-object/from16 v0, v30

    invoke-direct {v5, v0}, Lorg/spongycastle/asn1/DERBMPString;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v22

    invoke-interface {v0, v4, v5}, Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;->setBagAttribute(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 1478
    :cond_3a2
    invoke-interface/range {v22 .. v22}, Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;->getBagAttributeKeys()Ljava/util/Enumeration;

    move-result-object v36

    .line 1480
    .local v36, "e":Ljava/util/Enumeration;
    :cond_3a6
    :goto_3a6
    invoke-interface/range {v36 .. v36}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-eqz v4, :cond_3e9

    .line 1482
    invoke-interface/range {v36 .. v36}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v56

    check-cast v56, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 1488
    .restart local v56    # "oid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    sget-object v4, Lorg/spongycastle/asn1/pkcs/PKCSObjectIdentifiers;->pkcs_9_at_localKeyId:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-object/from16 v0, v56

    invoke-virtual {v0, v4}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3a6

    .line 1493
    new-instance v38, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct/range {v38 .. v38}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 1495
    .restart local v38    # "fSeq":Lorg/spongycastle/asn1/ASN1EncodableVector;
    move-object/from16 v0, v38

    move-object/from16 v1, v56

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 1496
    new-instance v4, Lorg/spongycastle/asn1/DERSet;

    move-object/from16 v0, v22

    move-object/from16 v1, v56

    invoke-interface {v0, v1}, Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;->getBagAttribute(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/spongycastle/asn1/DERSet;-><init>(Lorg/spongycastle/asn1/ASN1Encodable;)V

    move-object/from16 v0, v38

    invoke-virtual {v0, v4}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 1497
    new-instance v4, Lorg/spongycastle/asn1/DERSequence;

    move-object/from16 v0, v38

    invoke-direct {v4, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    move-object/from16 v0, v37

    invoke-virtual {v0, v4}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 1499
    const/16 v23, 0x1

    .line 1500
    goto :goto_3a6

    .line 1503
    .end local v22    # "bagAttrs":Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;
    .end local v36    # "e":Ljava/util/Enumeration;
    .end local v38    # "fSeq":Lorg/spongycastle/asn1/ASN1EncodableVector;
    .end local v55    # "nm":Lorg/spongycastle/asn1/DERBMPString;
    .end local v56    # "oid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    :cond_3e9
    if-nez v23, :cond_414

    .line 1505
    new-instance v38, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct/range {v38 .. v38}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 1507
    .restart local v38    # "fSeq":Lorg/spongycastle/asn1/ASN1EncodableVector;
    sget-object v4, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->pkcs_9_at_friendlyName:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-object/from16 v0, v38

    invoke-virtual {v0, v4}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 1508
    new-instance v4, Lorg/spongycastle/asn1/DERSet;

    new-instance v5, Lorg/spongycastle/asn1/DERBMPString;

    move-object/from16 v0, v30

    invoke-direct {v5, v0}, Lorg/spongycastle/asn1/DERBMPString;-><init>(Ljava/lang/String;)V

    invoke-direct {v4, v5}, Lorg/spongycastle/asn1/DERSet;-><init>(Lorg/spongycastle/asn1/ASN1Encodable;)V

    move-object/from16 v0, v38

    invoke-virtual {v0, v4}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 1510
    new-instance v4, Lorg/spongycastle/asn1/DERSequence;

    move-object/from16 v0, v38

    invoke-direct {v4, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    move-object/from16 v0, v37

    invoke-virtual {v0, v4}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 1513
    .end local v38    # "fSeq":Lorg/spongycastle/asn1/ASN1EncodableVector;
    :cond_414
    new-instance v61, Lorg/spongycastle/asn1/pkcs/SafeBag;

    sget-object v4, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->certBag:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual/range {v24 .. v24}, Lorg/spongycastle/asn1/pkcs/CertBag;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v5

    new-instance v7, Lorg/spongycastle/asn1/DERSet;

    move-object/from16 v0, v37

    invoke-direct {v7, v0}, Lorg/spongycastle/asn1/DERSet;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    move-object/from16 v0, v61

    invoke-direct {v0, v4, v5, v7}, Lorg/spongycastle/asn1/pkcs/SafeBag;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/ASN1Encodable;Lorg/spongycastle/asn1/ASN1Set;)V

    .line 1515
    .restart local v61    # "sBag":Lorg/spongycastle/asn1/pkcs/SafeBag;
    move-object/from16 v0, v31

    move-object/from16 v1, v61

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 1517
    move-object/from16 v0, v35

    move-object/from16 v1, v28

    move-object/from16 v2, v28

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_438
    .catch Ljava/security/cert/CertificateEncodingException; {:try_start_339 .. :try_end_438} :catch_43a

    goto/16 :goto_333

    .line 1519
    .end local v23    # "cAttrSet":Z
    .end local v24    # "cBag":Lorg/spongycastle/asn1/pkcs/CertBag;
    .end local v28    # "cert":Ljava/security/cert/Certificate;
    .end local v30    # "certId":Ljava/lang/String;
    .end local v37    # "fName":Lorg/spongycastle/asn1/ASN1EncodableVector;
    .end local v61    # "sBag":Lorg/spongycastle/asn1/pkcs/SafeBag;
    :catch_43a
    move-exception v36

    .line 1521
    .local v36, "e":Ljava/security/cert/CertificateEncodingException;
    new-instance v4, Ljava/io/IOException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Error encoding certificate: "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual/range {v36 .. v36}, Ljava/security/cert/CertificateEncodingException;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 1525
    .end local v36    # "e":Ljava/security/cert/CertificateEncodingException;
    :cond_458
    invoke-direct/range {p0 .. p0}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->getUsedCertificateSet()Ljava/util/Set;

    move-result-object v62

    .line 1527
    .local v62, "usedSet":Ljava/util/Set;
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->chainCerts:Ljava/util/Hashtable;

    invoke-virtual {v4}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v32

    .line 1528
    :cond_464
    :goto_464
    invoke-interface/range {v32 .. v32}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-eqz v4, :cond_533

    .line 1532
    :try_start_46a
    invoke-interface/range {v32 .. v32}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v30

    check-cast v30, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$CertId;

    .line 1533
    .local v30, "certId":Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$CertId;
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->chainCerts:Ljava/util/Hashtable;

    move-object/from16 v0, v30

    invoke-virtual {v4, v0}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v28

    check-cast v28, Ljava/security/cert/Certificate;

    .line 1535
    .restart local v28    # "cert":Ljava/security/cert/Certificate;
    move-object/from16 v0, v62

    move-object/from16 v1, v28

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_464

    .line 1540
    move-object/from16 v0, v35

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-nez v4, :cond_464

    .line 1545
    new-instance v24, Lorg/spongycastle/asn1/pkcs/CertBag;

    sget-object v4, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->x509Certificate:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    new-instance v5, Lorg/spongycastle/asn1/DEROctetString;

    .line 1547
    invoke-virtual/range {v28 .. v28}, Ljava/security/cert/Certificate;->getEncoded()[B

    move-result-object v7

    invoke-direct {v5, v7}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    move-object/from16 v0, v24

    invoke-direct {v0, v4, v5}, Lorg/spongycastle/asn1/pkcs/CertBag;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 1548
    .restart local v24    # "cBag":Lorg/spongycastle/asn1/pkcs/CertBag;
    new-instance v37, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct/range {v37 .. v37}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 1550
    .restart local v37    # "fName":Lorg/spongycastle/asn1/ASN1EncodableVector;
    move-object/from16 v0, v28

    instance-of v4, v0, Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;

    if-eqz v4, :cond_516

    .line 1552
    move-object/from16 v0, v28

    check-cast v0, Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;

    move-object/from16 v22, v0

    .line 1553
    .restart local v22    # "bagAttrs":Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;
    invoke-interface/range {v22 .. v22}, Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;->getBagAttributeKeys()Ljava/util/Enumeration;

    move-result-object v36

    .line 1555
    .local v36, "e":Ljava/util/Enumeration;
    :cond_4b7
    :goto_4b7
    invoke-interface/range {v36 .. v36}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-eqz v4, :cond_516

    .line 1557
    invoke-interface/range {v36 .. v36}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v56

    check-cast v56, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 1563
    .restart local v56    # "oid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    sget-object v4, Lorg/spongycastle/asn1/pkcs/PKCSObjectIdentifiers;->pkcs_9_at_localKeyId:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-object/from16 v0, v56

    invoke-virtual {v0, v4}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_4b7

    .line 1568
    new-instance v38, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct/range {v38 .. v38}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 1570
    .restart local v38    # "fSeq":Lorg/spongycastle/asn1/ASN1EncodableVector;
    move-object/from16 v0, v38

    move-object/from16 v1, v56

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 1571
    new-instance v4, Lorg/spongycastle/asn1/DERSet;

    move-object/from16 v0, v22

    move-object/from16 v1, v56

    invoke-interface {v0, v1}, Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;->getBagAttribute(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/spongycastle/asn1/DERSet;-><init>(Lorg/spongycastle/asn1/ASN1Encodable;)V

    move-object/from16 v0, v38

    invoke-virtual {v0, v4}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 1572
    new-instance v4, Lorg/spongycastle/asn1/DERSequence;

    move-object/from16 v0, v38

    invoke-direct {v4, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    move-object/from16 v0, v37

    invoke-virtual {v0, v4}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V
    :try_end_4f7
    .catch Ljava/security/cert/CertificateEncodingException; {:try_start_46a .. :try_end_4f7} :catch_4f8

    goto :goto_4b7

    .line 1580
    .end local v22    # "bagAttrs":Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;
    .end local v24    # "cBag":Lorg/spongycastle/asn1/pkcs/CertBag;
    .end local v28    # "cert":Ljava/security/cert/Certificate;
    .end local v30    # "certId":Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$CertId;
    .end local v36    # "e":Ljava/util/Enumeration;
    .end local v37    # "fName":Lorg/spongycastle/asn1/ASN1EncodableVector;
    .end local v38    # "fSeq":Lorg/spongycastle/asn1/ASN1EncodableVector;
    .end local v56    # "oid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    :catch_4f8
    move-exception v36

    .line 1582
    .local v36, "e":Ljava/security/cert/CertificateEncodingException;
    new-instance v4, Ljava/io/IOException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Error encoding certificate: "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual/range {v36 .. v36}, Ljava/security/cert/CertificateEncodingException;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 1576
    .end local v36    # "e":Ljava/security/cert/CertificateEncodingException;
    .restart local v24    # "cBag":Lorg/spongycastle/asn1/pkcs/CertBag;
    .restart local v28    # "cert":Ljava/security/cert/Certificate;
    .restart local v30    # "certId":Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$CertId;
    .restart local v37    # "fName":Lorg/spongycastle/asn1/ASN1EncodableVector;
    :cond_516
    :try_start_516
    new-instance v61, Lorg/spongycastle/asn1/pkcs/SafeBag;

    sget-object v4, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->certBag:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual/range {v24 .. v24}, Lorg/spongycastle/asn1/pkcs/CertBag;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v5

    new-instance v7, Lorg/spongycastle/asn1/DERSet;

    move-object/from16 v0, v37

    invoke-direct {v7, v0}, Lorg/spongycastle/asn1/DERSet;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    move-object/from16 v0, v61

    invoke-direct {v0, v4, v5, v7}, Lorg/spongycastle/asn1/pkcs/SafeBag;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/ASN1Encodable;Lorg/spongycastle/asn1/ASN1Set;)V

    .line 1578
    .restart local v61    # "sBag":Lorg/spongycastle/asn1/pkcs/SafeBag;
    move-object/from16 v0, v31

    move-object/from16 v1, v61

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V
    :try_end_531
    .catch Ljava/security/cert/CertificateEncodingException; {:try_start_516 .. :try_end_531} :catch_4f8

    goto/16 :goto_464

    .line 1586
    .end local v24    # "cBag":Lorg/spongycastle/asn1/pkcs/CertBag;
    .end local v28    # "cert":Ljava/security/cert/Certificate;
    .end local v30    # "certId":Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$CertId;
    .end local v37    # "fName":Lorg/spongycastle/asn1/ASN1EncodableVector;
    .end local v61    # "sBag":Lorg/spongycastle/asn1/pkcs/SafeBag;
    :cond_533
    new-instance v4, Lorg/spongycastle/asn1/DERSequence;

    move-object/from16 v0, v31

    invoke-direct {v4, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    const-string v5, "DER"

    invoke-virtual {v4, v5}, Lorg/spongycastle/asn1/DERSequence;->getEncoded(Ljava/lang/String;)[B

    move-result-object v9

    .line 1587
    .local v9, "certSeqEncoded":[B
    const/4 v5, 0x1

    const/4 v8, 0x0

    move-object/from16 v4, p0

    move-object/from16 v7, p2

    invoke-virtual/range {v4 .. v9}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->cryptData(ZLorg/spongycastle/asn1/x509/AlgorithmIdentifier;[CZ[B)[B

    move-result-object v29

    .line 1588
    .local v29, "certBytes":[B
    new-instance v25, Lorg/spongycastle/asn1/pkcs/EncryptedData;

    sget-object v4, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->data:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    new-instance v5, Lorg/spongycastle/asn1/BEROctetString;

    move-object/from16 v0, v29

    invoke-direct {v5, v0}, Lorg/spongycastle/asn1/BEROctetString;-><init>([B)V

    move-object/from16 v0, v25

    invoke-direct {v0, v4, v6, v5}, Lorg/spongycastle/asn1/pkcs/EncryptedData;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 1590
    .local v25, "cInfo":Lorg/spongycastle/asn1/pkcs/EncryptedData;
    const/4 v4, 0x2

    new-array v0, v4, [Lorg/spongycastle/asn1/pkcs/ContentInfo;

    move-object/from16 v39, v0

    const/4 v4, 0x0

    new-instance v5, Lorg/spongycastle/asn1/pkcs/ContentInfo;

    sget-object v7, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->data:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-object/from16 v0, v50

    invoke-direct {v5, v7, v0}, Lorg/spongycastle/asn1/pkcs/ContentInfo;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/ASN1Encodable;)V

    aput-object v5, v39, v4

    const/4 v4, 0x1

    new-instance v5, Lorg/spongycastle/asn1/pkcs/ContentInfo;

    sget-object v7, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->encryptedData:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 1593
    invoke-virtual/range {v25 .. v25}, Lorg/spongycastle/asn1/pkcs/EncryptedData;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v8

    invoke-direct {v5, v7, v8}, Lorg/spongycastle/asn1/pkcs/ContentInfo;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/ASN1Encodable;)V

    aput-object v5, v39, v4

    .line 1596
    .local v39, "info":[Lorg/spongycastle/asn1/pkcs/ContentInfo;
    new-instance v20, Lorg/spongycastle/asn1/pkcs/AuthenticatedSafe;

    move-object/from16 v0, v20

    move-object/from16 v1, v39

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/pkcs/AuthenticatedSafe;-><init>([Lorg/spongycastle/asn1/pkcs/ContentInfo;)V

    .line 1598
    .local v20, "auth":Lorg/spongycastle/asn1/pkcs/AuthenticatedSafe;
    new-instance v21, Ljava/io/ByteArrayOutputStream;

    invoke-direct/range {v21 .. v21}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 1600
    .local v21, "bOut":Ljava/io/ByteArrayOutputStream;
    if-eqz p3, :cond_60c

    .line 1602
    new-instance v18, Lorg/spongycastle/asn1/DEROutputStream;

    move-object/from16 v0, v18

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/DEROutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 1609
    .local v18, "asn1Out":Lorg/spongycastle/asn1/DEROutputStream;
    :goto_592
    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/DEROutputStream;->writeObject(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 1611
    invoke-virtual/range {v21 .. v21}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v58

    .line 1613
    .local v58, "pkg":[B
    new-instance v53, Lorg/spongycastle/asn1/pkcs/ContentInfo;

    sget-object v4, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->data:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    new-instance v5, Lorg/spongycastle/asn1/BEROctetString;

    move-object/from16 v0, v58

    invoke-direct {v5, v0}, Lorg/spongycastle/asn1/BEROctetString;-><init>([B)V

    move-object/from16 v0, v53

    invoke-direct {v0, v4, v5}, Lorg/spongycastle/asn1/pkcs/ContentInfo;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 1618
    .local v53, "mainInfo":Lorg/spongycastle/asn1/pkcs/ContentInfo;
    const/16 v4, 0x14

    new-array v12, v4, [B

    .line 1619
    .local v12, "mSalt":[B
    const/16 v13, 0x400

    .line 1621
    .local v13, "itCount":I
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->random:Ljava/security/SecureRandom;

    invoke-virtual {v4, v12}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 1623
    invoke-virtual/range {v53 .. v53}, Lorg/spongycastle/asn1/pkcs/ContentInfo;->getContent()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v4

    check-cast v4, Lorg/spongycastle/asn1/ASN1OctetString;

    invoke-virtual {v4}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v16

    .line 1629
    .local v16, "data":[B
    :try_start_5c4
    sget-object v11, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->id_SHA1:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    const/4 v15, 0x0

    move-object/from16 v10, p0

    move-object/from16 v14, p2

    invoke-direct/range {v10 .. v16}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->calculatePbeMac(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;[BI[CZ[B)[B

    move-result-object v60

    .line 1631
    .local v60, "res":[B
    new-instance v17, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    sget-object v4, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->id_SHA1:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    sget-object v5, Lorg/spongycastle/asn1/DERNull;->INSTANCE:Lorg/spongycastle/asn1/DERNull;

    move-object/from16 v0, v17

    invoke-direct {v0, v4, v5}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 1632
    .local v17, "algId":Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;
    new-instance v34, Lorg/spongycastle/asn1/x509/DigestInfo;

    move-object/from16 v0, v34

    move-object/from16 v1, v17

    move-object/from16 v2, v60

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/asn1/x509/DigestInfo;-><init>(Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;[B)V

    .line 1634
    .local v34, "dInfo":Lorg/spongycastle/asn1/x509/DigestInfo;
    new-instance v52, Lorg/spongycastle/asn1/pkcs/MacData;

    move-object/from16 v0, v52

    move-object/from16 v1, v34

    invoke-direct {v0, v1, v12, v13}, Lorg/spongycastle/asn1/pkcs/MacData;-><init>(Lorg/spongycastle/asn1/x509/DigestInfo;[BI)V
    :try_end_5ee
    .catch Ljava/lang/Exception; {:try_start_5c4 .. :try_end_5ee} :catch_617

    .line 1644
    .local v52, "mData":Lorg/spongycastle/asn1/pkcs/MacData;
    new-instance v57, Lorg/spongycastle/asn1/pkcs/Pfx;

    move-object/from16 v0, v57

    move-object/from16 v1, v53

    move-object/from16 v2, v52

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/asn1/pkcs/Pfx;-><init>(Lorg/spongycastle/asn1/pkcs/ContentInfo;Lorg/spongycastle/asn1/pkcs/MacData;)V

    .line 1646
    .local v57, "pfx":Lorg/spongycastle/asn1/pkcs/Pfx;
    if-eqz p3, :cond_635

    .line 1648
    new-instance v18, Lorg/spongycastle/asn1/DEROutputStream;

    .end local v18    # "asn1Out":Lorg/spongycastle/asn1/DEROutputStream;
    move-object/from16 v0, v18

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/DEROutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 1655
    .restart local v18    # "asn1Out":Lorg/spongycastle/asn1/DEROutputStream;
    :goto_604
    move-object/from16 v0, v18

    move-object/from16 v1, v57

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/DEROutputStream;->writeObject(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 1656
    return-void

    .line 1606
    .end local v12    # "mSalt":[B
    .end local v13    # "itCount":I
    .end local v16    # "data":[B
    .end local v17    # "algId":Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;
    .end local v18    # "asn1Out":Lorg/spongycastle/asn1/DEROutputStream;
    .end local v34    # "dInfo":Lorg/spongycastle/asn1/x509/DigestInfo;
    .end local v52    # "mData":Lorg/spongycastle/asn1/pkcs/MacData;
    .end local v53    # "mainInfo":Lorg/spongycastle/asn1/pkcs/ContentInfo;
    .end local v57    # "pfx":Lorg/spongycastle/asn1/pkcs/Pfx;
    .end local v58    # "pkg":[B
    .end local v60    # "res":[B
    :cond_60c
    new-instance v18, Lorg/spongycastle/asn1/BEROutputStream;

    move-object/from16 v0, v18

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/BEROutputStream;-><init>(Ljava/io/OutputStream;)V

    .restart local v18    # "asn1Out":Lorg/spongycastle/asn1/DEROutputStream;
    goto/16 :goto_592

    .line 1636
    .restart local v12    # "mSalt":[B
    .restart local v13    # "itCount":I
    .restart local v16    # "data":[B
    .restart local v53    # "mainInfo":Lorg/spongycastle/asn1/pkcs/ContentInfo;
    .restart local v58    # "pkg":[B
    :catch_617
    move-exception v36

    .line 1638
    .local v36, "e":Ljava/lang/Exception;
    new-instance v4, Ljava/io/IOException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "error constructing MAC: "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual/range {v36 .. v36}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 1652
    .end local v36    # "e":Ljava/lang/Exception;
    .restart local v17    # "algId":Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;
    .restart local v34    # "dInfo":Lorg/spongycastle/asn1/x509/DigestInfo;
    .restart local v52    # "mData":Lorg/spongycastle/asn1/pkcs/MacData;
    .restart local v57    # "pfx":Lorg/spongycastle/asn1/pkcs/Pfx;
    .restart local v60    # "res":[B
    :cond_635
    new-instance v18, Lorg/spongycastle/asn1/BEROutputStream;

    .end local v18    # "asn1Out":Lorg/spongycastle/asn1/DEROutputStream;
    move-object/from16 v0, v18

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/BEROutputStream;-><init>(Ljava/io/OutputStream;)V

    .restart local v18    # "asn1Out":Lorg/spongycastle/asn1/DEROutputStream;
    goto :goto_604
.end method

.method private static getDigest(Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;)[B
    .registers 6
    .param p0, "spki"    # Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;

    .prologue
    const/4 v4, 0x0

    .line 229
    new-instance v1, Lorg/spongycastle/crypto/digests/SHA1Digest;

    invoke-direct {v1}, Lorg/spongycastle/crypto/digests/SHA1Digest;-><init>()V

    .line 230
    .local v1, "digest":Lorg/spongycastle/crypto/Digest;
    invoke-interface {v1}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    move-result v3

    new-array v2, v3, [B

    .line 232
    .local v2, "resBuf":[B
    invoke-virtual {p0}, Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;->getPublicKeyData()Lorg/spongycastle/asn1/DERBitString;

    move-result-object v3

    invoke-virtual {v3}, Lorg/spongycastle/asn1/DERBitString;->getBytes()[B

    move-result-object v0

    .line 233
    .local v0, "bytes":[B
    array-length v3, v0

    invoke-interface {v1, v0, v4, v3}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 234
    invoke-interface {v1, v2, v4}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 235
    return-object v2
.end method

.method private getUsedCertificateSet()Ljava/util/Set;
    .registers 8

    .prologue
    .line 1660
    new-instance v5, Ljava/util/HashSet;

    invoke-direct {v5}, Ljava/util/HashSet;-><init>()V

    .line 1662
    .local v5, "usedSet":Ljava/util/Set;
    iget-object v6, p0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->keys:Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;

    invoke-virtual {v6}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;->keys()Ljava/util/Enumeration;

    move-result-object v3

    .local v3, "en":Ljava/util/Enumeration;
    :cond_b
    invoke-interface {v3}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v6

    if-eqz v6, :cond_27

    .line 1664
    invoke-interface {v3}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1666
    .local v0, "alias":Ljava/lang/String;
    invoke-virtual {p0, v0}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->engineGetCertificateChain(Ljava/lang/String;)[Ljava/security/cert/Certificate;

    move-result-object v2

    .line 1668
    .local v2, "certs":[Ljava/security/cert/Certificate;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1c
    array-length v6, v2

    if-eq v4, v6, :cond_b

    .line 1670
    aget-object v6, v2, v4

    invoke-interface {v5, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1668
    add-int/lit8 v4, v4, 0x1

    goto :goto_1c

    .line 1674
    .end local v0    # "alias":Ljava/lang/String;
    .end local v2    # "certs":[Ljava/security/cert/Certificate;
    .end local v4    # "i":I
    :cond_27
    iget-object v6, p0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->certs:Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;

    invoke-virtual {v6}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;->keys()Ljava/util/Enumeration;

    move-result-object v3

    :goto_2d
    invoke-interface {v3}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v6

    if-eqz v6, :cond_41

    .line 1676
    invoke-interface {v3}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1678
    .restart local v0    # "alias":Ljava/lang/String;
    invoke-virtual {p0, v0}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->engineGetCertificate(Ljava/lang/String;)Ljava/security/cert/Certificate;

    move-result-object v1

    .line 1680
    .local v1, "cert":Ljava/security/cert/Certificate;
    invoke-interface {v5, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_2d

    .line 1683
    .end local v0    # "alias":Ljava/lang/String;
    .end local v1    # "cert":Ljava/security/cert/Certificate;
    :cond_41
    return-object v5
.end method


# virtual methods
.method protected cryptData(ZLorg/spongycastle/asn1/x509/AlgorithmIdentifier;[CZ[B)[B
    .registers 18
    .param p1, "forEncryption"    # Z
    .param p2, "algId"    # Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;
    .param p3, "password"    # [C
    .param p4, "wrongPKCS12Zero"    # Z
    .param p5, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 682
    invoke-virtual {p2}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->getAlgorithm()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v1

    .line 683
    .local v1, "algorithm":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    if-eqz p1, :cond_48

    const/4 v6, 0x1

    .line 685
    .local v6, "mode":I
    :goto_7
    sget-object v9, Lorg/spongycastle/asn1/pkcs/PKCSObjectIdentifiers;->pkcs_12PbeIds:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v1, v9}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->on(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Z

    move-result v9

    if-eqz v9, :cond_68

    .line 687
    invoke-virtual {p2}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->getParameters()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v9

    invoke-static {v9}, Lorg/spongycastle/asn1/pkcs/PKCS12PBEParams;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/pkcs/PKCS12PBEParams;

    move-result-object v7

    .line 688
    .local v7, "pbeParams":Lorg/spongycastle/asn1/pkcs/PKCS12PBEParams;
    new-instance v8, Ljavax/crypto/spec/PBEKeySpec;

    invoke-direct {v8, p3}, Ljavax/crypto/spec/PBEKeySpec;-><init>([C)V

    .line 692
    .local v8, "pbeSpec":Ljavax/crypto/spec/PBEKeySpec;
    :try_start_1c
    new-instance v3, Ljavax/crypto/spec/PBEParameterSpec;

    .line 693
    invoke-virtual {v7}, Lorg/spongycastle/asn1/pkcs/PKCS12PBEParams;->getIV()[B

    move-result-object v9

    .line 694
    invoke-virtual {v7}, Lorg/spongycastle/asn1/pkcs/PKCS12PBEParams;->getIterations()Ljava/math/BigInteger;

    move-result-object v10

    invoke-virtual {v10}, Ljava/math/BigInteger;->intValue()I

    move-result v10

    invoke-direct {v3, v9, v10}, Ljavax/crypto/spec/PBEParameterSpec;-><init>([BI)V

    .line 695
    .local v3, "defParams":Ljavax/crypto/spec/PBEParameterSpec;
    new-instance v5, Lorg/spongycastle/jcajce/PKCS12Key;

    move/from16 v0, p4

    invoke-direct {v5, p3, v0}, Lorg/spongycastle/jcajce/PKCS12Key;-><init>([CZ)V

    .line 697
    .local v5, "key":Lorg/spongycastle/jcajce/PKCS12Key;
    iget-object v9, p0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->helper:Lorg/spongycastle/jcajce/util/JcaJceHelper;

    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v9, v10}, Lorg/spongycastle/jcajce/util/JcaJceHelper;->createCipher(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v2

    .line 699
    .local v2, "cipher":Ljavax/crypto/Cipher;
    invoke-virtual {v2, v6, v5, v3}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 700
    move-object/from16 v0, p5

    invoke-virtual {v2, v0}, Ljavax/crypto/Cipher;->doFinal([B)[B
    :try_end_46
    .catch Ljava/lang/Exception; {:try_start_1c .. :try_end_46} :catch_4a

    move-result-object v9

    .line 713
    .end local v3    # "defParams":Ljavax/crypto/spec/PBEParameterSpec;
    .end local v5    # "key":Lorg/spongycastle/jcajce/PKCS12Key;
    .end local v7    # "pbeParams":Lorg/spongycastle/asn1/pkcs/PKCS12PBEParams;
    .end local v8    # "pbeSpec":Ljavax/crypto/spec/PBEKeySpec;
    :goto_47
    return-object v9

    .line 683
    .end local v2    # "cipher":Ljavax/crypto/Cipher;
    .end local v6    # "mode":I
    :cond_48
    const/4 v6, 0x2

    goto :goto_7

    .line 702
    .restart local v6    # "mode":I
    .restart local v7    # "pbeParams":Lorg/spongycastle/asn1/pkcs/PKCS12PBEParams;
    .restart local v8    # "pbeSpec":Ljavax/crypto/spec/PBEKeySpec;
    :catch_4a
    move-exception v4

    .line 704
    .local v4, "e":Ljava/lang/Exception;
    new-instance v9, Ljava/io/IOException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "exception decrypting data - "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v4}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 707
    .end local v4    # "e":Ljava/lang/Exception;
    .end local v7    # "pbeParams":Lorg/spongycastle/asn1/pkcs/PKCS12PBEParams;
    .end local v8    # "pbeSpec":Ljavax/crypto/spec/PBEKeySpec;
    :cond_68
    sget-object v9, Lorg/spongycastle/asn1/pkcs/PKCSObjectIdentifiers;->id_PBES2:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v1, v9}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_99

    .line 711
    :try_start_70
    invoke-direct {p0, v6, p3, p2}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->createCipher(I[CLorg/spongycastle/asn1/x509/AlgorithmIdentifier;)Ljavax/crypto/Cipher;

    move-result-object v2

    .line 713
    .restart local v2    # "cipher":Ljavax/crypto/Cipher;
    move-object/from16 v0, p5

    invoke-virtual {v2, v0}, Ljavax/crypto/Cipher;->doFinal([B)[B
    :try_end_79
    .catch Ljava/lang/Exception; {:try_start_70 .. :try_end_79} :catch_7b

    move-result-object v9

    goto :goto_47

    .line 715
    .end local v2    # "cipher":Ljavax/crypto/Cipher;
    :catch_7b
    move-exception v4

    .line 717
    .restart local v4    # "e":Ljava/lang/Exception;
    new-instance v9, Ljava/io/IOException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "exception decrypting data - "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v4}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 722
    .end local v4    # "e":Ljava/lang/Exception;
    :cond_99
    new-instance v9, Ljava/io/IOException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "unknown PBE algorithm: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v9
.end method

.method public engineAliases()Ljava/util/Enumeration;
    .registers 6

    .prologue
    .line 246
    new-instance v2, Ljava/util/Hashtable;

    invoke-direct {v2}, Ljava/util/Hashtable;-><init>()V

    .line 248
    .local v2, "tab":Ljava/util/Hashtable;
    iget-object v3, p0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->certs:Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;

    invoke-virtual {v3}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;->keys()Ljava/util/Enumeration;

    move-result-object v1

    .line 249
    .local v1, "e":Ljava/util/Enumeration;
    :goto_b
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_1b

    .line 251
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    const-string v4, "cert"

    invoke-virtual {v2, v3, v4}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_b

    .line 254
    :cond_1b
    iget-object v3, p0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->keys:Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;

    invoke-virtual {v3}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;->keys()Ljava/util/Enumeration;

    move-result-object v1

    .line 255
    :cond_21
    :goto_21
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_39

    .line 257
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 258
    .local v0, "a":Ljava/lang/String;
    invoke-virtual {v2, v0}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_21

    .line 260
    const-string v3, "key"

    invoke-virtual {v2, v0, v3}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_21

    .line 264
    .end local v0    # "a":Ljava/lang/String;
    :cond_39
    invoke-virtual {v2}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v3

    return-object v3
.end method

.method public engineContainsAlias(Ljava/lang/String;)Z
    .registers 3
    .param p1, "alias"    # Ljava/lang/String;

    .prologue
    .line 270
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->certs:Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;

    invoke-virtual {v0, p1}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_10

    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->keys:Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;

    invoke-virtual {v0, p1}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_12

    :cond_10
    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public engineDeleteEntry(Ljava/lang/String;)V
    .registers 8
    .param p1, "alias"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/KeyStoreException;
        }
    .end annotation

    .prologue
    .line 282
    iget-object v3, p0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->keys:Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;

    invoke-virtual {v3, p1}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;->remove(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/security/Key;

    .line 284
    .local v2, "k":Ljava/security/Key;
    iget-object v3, p0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->certs:Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;

    invoke-virtual {v3, p1}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;->remove(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/security/cert/Certificate;

    .line 286
    .local v0, "c":Ljava/security/cert/Certificate;
    if-eqz v0, :cond_20

    .line 288
    iget-object v3, p0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->chainCerts:Ljava/util/Hashtable;

    new-instance v4, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$CertId;

    invoke-virtual {v0}, Ljava/security/cert/Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v5

    invoke-direct {v4, p0, v5}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$CertId;-><init>(Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;Ljava/security/PublicKey;)V

    invoke-virtual {v3, v4}, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 291
    :cond_20
    if-eqz v2, :cond_44

    .line 293
    iget-object v3, p0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->localIds:Ljava/util/Hashtable;

    invoke-virtual {v3, p1}, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 294
    .local v1, "id":Ljava/lang/String;
    if-eqz v1, :cond_34

    .line 296
    iget-object v3, p0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->keyCerts:Ljava/util/Hashtable;

    invoke-virtual {v3, v1}, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "c":Ljava/security/cert/Certificate;
    check-cast v0, Ljava/security/cert/Certificate;

    .line 298
    .restart local v0    # "c":Ljava/security/cert/Certificate;
    :cond_34
    if-eqz v0, :cond_44

    .line 300
    iget-object v3, p0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->chainCerts:Ljava/util/Hashtable;

    new-instance v4, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$CertId;

    invoke-virtual {v0}, Ljava/security/cert/Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v5

    invoke-direct {v4, p0, v5}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$CertId;-><init>(Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;Ljava/security/PublicKey;)V

    invoke-virtual {v3, v4}, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 303
    .end local v1    # "id":Ljava/lang/String;
    :cond_44
    return-void
.end method

.method public engineGetCertificate(Ljava/lang/String;)Ljava/security/cert/Certificate;
    .registers 6
    .param p1, "alias"    # Ljava/lang/String;

    .prologue
    .line 311
    if-nez p1, :cond_a

    .line 313
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "null alias passed to getCertificate."

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 316
    :cond_a
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->certs:Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;

    invoke-virtual {v2, p1}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/security/cert/Certificate;

    .line 321
    .local v0, "c":Ljava/security/cert/Certificate;
    if-nez v0, :cond_26

    .line 323
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->localIds:Ljava/util/Hashtable;

    invoke-virtual {v2, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 324
    .local v1, "id":Ljava/lang/String;
    if-eqz v1, :cond_27

    .line 326
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->keyCerts:Ljava/util/Hashtable;

    invoke-virtual {v2, v1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "c":Ljava/security/cert/Certificate;
    check-cast v0, Ljava/security/cert/Certificate;

    .line 334
    .end local v1    # "id":Ljava/lang/String;
    .restart local v0    # "c":Ljava/security/cert/Certificate;
    :cond_26
    :goto_26
    return-object v0

    .line 330
    .restart local v1    # "id":Ljava/lang/String;
    :cond_27
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->keyCerts:Ljava/util/Hashtable;

    invoke-virtual {v2, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "c":Ljava/security/cert/Certificate;
    check-cast v0, Ljava/security/cert/Certificate;

    .restart local v0    # "c":Ljava/security/cert/Certificate;
    goto :goto_26
.end method

.method public engineGetCertificateAlias(Ljava/security/cert/Certificate;)Ljava/lang/String;
    .registers 7
    .param p1, "cert"    # Ljava/security/cert/Certificate;

    .prologue
    .line 340
    iget-object v4, p0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->certs:Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;

    invoke-virtual {v4}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .line 341
    .local v0, "c":Ljava/util/Enumeration;
    iget-object v4, p0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->certs:Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;

    invoke-virtual {v4}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;->keys()Ljava/util/Enumeration;

    move-result-object v1

    .line 343
    .local v1, "k":Ljava/util/Enumeration;
    :cond_c
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-eqz v4, :cond_25

    .line 345
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/security/cert/Certificate;

    .line 346
    .local v3, "tc":Ljava/security/cert/Certificate;
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 348
    .local v2, "ta":Ljava/lang/String;
    invoke-virtual {v3, p1}, Ljava/security/cert/Certificate;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_c

    .line 368
    .end local v2    # "ta":Ljava/lang/String;
    .end local v3    # "tc":Ljava/security/cert/Certificate;
    :goto_24
    return-object v2

    .line 354
    :cond_25
    iget-object v4, p0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->keyCerts:Ljava/util/Hashtable;

    invoke-virtual {v4}, Ljava/util/Hashtable;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .line 355
    iget-object v4, p0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->keyCerts:Ljava/util/Hashtable;

    invoke-virtual {v4}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v1

    .line 357
    :cond_31
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-eqz v4, :cond_4a

    .line 359
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/security/cert/Certificate;

    .line 360
    .restart local v3    # "tc":Ljava/security/cert/Certificate;
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 362
    .restart local v2    # "ta":Ljava/lang/String;
    invoke-virtual {v3, p1}, Ljava/security/cert/Certificate;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_31

    goto :goto_24

    .line 368
    .end local v2    # "ta":Ljava/lang/String;
    .end local v3    # "tc":Ljava/security/cert/Certificate;
    :cond_4a
    const/4 v2, 0x0

    goto :goto_24
.end method

.method public engineGetCertificateChain(Ljava/lang/String;)[Ljava/security/cert/Certificate;
    .registers 22
    .param p1, "alias"    # Ljava/lang/String;

    .prologue
    .line 374
    if-nez p1, :cond_a

    .line 376
    new-instance v17, Ljava/lang/IllegalArgumentException;

    const-string v18, "null alias passed to getCertificateChain."

    invoke-direct/range {v17 .. v18}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v17

    .line 379
    :cond_a
    invoke-virtual/range {p0 .. p1}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->engineIsKeyEntry(Ljava/lang/String;)Z

    move-result v17

    if-nez v17, :cond_12

    .line 381
    const/4 v7, 0x0

    .line 479
    :cond_11
    :goto_11
    return-object v7

    .line 384
    :cond_12
    invoke-virtual/range {p0 .. p1}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->engineGetCertificate(Ljava/lang/String;)Ljava/security/cert/Certificate;

    move-result-object v6

    .line 386
    .local v6, "c":Ljava/security/cert/Certificate;
    if-eqz v6, :cond_e9

    .line 388
    new-instance v9, Ljava/util/Vector;

    invoke-direct {v9}, Ljava/util/Vector;-><init>()V

    .line 390
    .local v9, "cs":Ljava/util/Vector;
    :goto_1d
    if-eqz v6, :cond_ce

    move-object/from16 v16, v6

    .line 392
    check-cast v16, Ljava/security/cert/X509Certificate;

    .line 393
    .local v16, "x509c":Ljava/security/cert/X509Certificate;
    const/4 v13, 0x0

    .line 395
    .local v13, "nextC":Ljava/security/cert/Certificate;
    sget-object v17, Lorg/spongycastle/asn1/x509/Extension;->authorityKeyIdentifier:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual/range {v17 .. v17}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/security/cert/X509Certificate;->getExtensionValue(Ljava/lang/String;)[B

    move-result-object v5

    .line 396
    .local v5, "bytes":[B
    if-eqz v5, :cond_6d

    .line 400
    :try_start_30
    new-instance v3, Lorg/spongycastle/asn1/ASN1InputStream;

    invoke-direct {v3, v5}, Lorg/spongycastle/asn1/ASN1InputStream;-><init>([B)V

    .line 402
    .local v3, "aIn":Lorg/spongycastle/asn1/ASN1InputStream;
    invoke-virtual {v3}, Lorg/spongycastle/asn1/ASN1InputStream;->readObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v17

    check-cast v17, Lorg/spongycastle/asn1/ASN1OctetString;

    invoke-virtual/range {v17 .. v17}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v4

    .line 403
    .local v4, "authBytes":[B
    new-instance v3, Lorg/spongycastle/asn1/ASN1InputStream;

    .end local v3    # "aIn":Lorg/spongycastle/asn1/ASN1InputStream;
    invoke-direct {v3, v4}, Lorg/spongycastle/asn1/ASN1InputStream;-><init>([B)V

    .line 405
    .restart local v3    # "aIn":Lorg/spongycastle/asn1/ASN1InputStream;
    invoke-virtual {v3}, Lorg/spongycastle/asn1/ASN1InputStream;->readObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Lorg/spongycastle/asn1/x509/AuthorityKeyIdentifier;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/AuthorityKeyIdentifier;

    move-result-object v12

    .line 406
    .local v12, "id":Lorg/spongycastle/asn1/x509/AuthorityKeyIdentifier;
    invoke-virtual {v12}, Lorg/spongycastle/asn1/x509/AuthorityKeyIdentifier;->getKeyIdentifier()[B

    move-result-object v17

    if-eqz v17, :cond_6d

    .line 408
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->chainCerts:Ljava/util/Hashtable;

    move-object/from16 v17, v0

    new-instance v18, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$CertId;

    invoke-virtual {v12}, Lorg/spongycastle/asn1/x509/AuthorityKeyIdentifier;->getKeyIdentifier()[B

    move-result-object v19

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    move-object/from16 v2, v19

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$CertId;-><init>(Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;[B)V

    invoke-virtual/range {v17 .. v18}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    .end local v13    # "nextC":Ljava/security/cert/Certificate;
    check-cast v13, Ljava/security/cert/Certificate;
    :try_end_6d
    .catch Ljava/io/IOException; {:try_start_30 .. :try_end_6d} :catch_b8

    .line 418
    .end local v3    # "aIn":Lorg/spongycastle/asn1/ASN1InputStream;
    .end local v4    # "authBytes":[B
    .end local v12    # "id":Lorg/spongycastle/asn1/x509/AuthorityKeyIdentifier;
    .restart local v13    # "nextC":Ljava/security/cert/Certificate;
    :cond_6d
    if-nez v13, :cond_af

    .line 423
    invoke-virtual/range {v16 .. v16}, Ljava/security/cert/X509Certificate;->getIssuerDN()Ljava/security/Principal;

    move-result-object v11

    .line 424
    .local v11, "i":Ljava/security/Principal;
    invoke-virtual/range {v16 .. v16}, Ljava/security/cert/X509Certificate;->getSubjectDN()Ljava/security/Principal;

    move-result-object v14

    .line 426
    .local v14, "s":Ljava/security/Principal;
    invoke-interface {v11, v14}, Ljava/security/Principal;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_af

    .line 428
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->chainCerts:Ljava/util/Hashtable;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v10

    .line 430
    .local v10, "e":Ljava/util/Enumeration;
    :cond_87
    :goto_87
    invoke-interface {v10}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v17

    if-eqz v17, :cond_af

    .line 432
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->chainCerts:Ljava/util/Hashtable;

    move-object/from16 v17, v0

    invoke-interface {v10}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/security/cert/X509Certificate;

    .line 433
    .local v8, "crt":Ljava/security/cert/X509Certificate;
    invoke-virtual {v8}, Ljava/security/cert/X509Certificate;->getSubjectDN()Ljava/security/Principal;

    move-result-object v15

    .line 434
    .local v15, "sub":Ljava/security/Principal;
    invoke-interface {v15, v11}, Ljava/security/Principal;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_87

    .line 438
    :try_start_a7
    invoke-virtual {v8}, Ljava/security/cert/X509Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/security/cert/X509Certificate;->verify(Ljava/security/PublicKey;)V
    :try_end_ae
    .catch Ljava/lang/Exception; {:try_start_a7 .. :try_end_ae} :catch_ec

    .line 439
    move-object v13, v8

    .line 451
    .end local v8    # "crt":Ljava/security/cert/X509Certificate;
    .end local v10    # "e":Ljava/util/Enumeration;
    .end local v11    # "i":Ljava/security/Principal;
    .end local v14    # "s":Ljava/security/Principal;
    .end local v15    # "sub":Ljava/security/Principal;
    :cond_af
    invoke-virtual {v9, v6}, Ljava/util/Vector;->contains(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_c3

    .line 453
    const/4 v6, 0x0

    goto/16 :goto_1d

    .line 412
    .end local v13    # "nextC":Ljava/security/cert/Certificate;
    :catch_b8
    move-exception v10

    .line 414
    .local v10, "e":Ljava/io/IOException;
    new-instance v17, Ljava/lang/RuntimeException;

    invoke-virtual {v10}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v17

    .line 457
    .end local v10    # "e":Ljava/io/IOException;
    .restart local v13    # "nextC":Ljava/security/cert/Certificate;
    :cond_c3
    invoke-virtual {v9, v6}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 458
    if-eq v13, v6, :cond_cb

    .line 460
    move-object v6, v13

    goto/16 :goto_1d

    .line 464
    :cond_cb
    const/4 v6, 0x0

    goto/16 :goto_1d

    .line 469
    .end local v5    # "bytes":[B
    .end local v13    # "nextC":Ljava/security/cert/Certificate;
    .end local v16    # "x509c":Ljava/security/cert/X509Certificate;
    :cond_ce
    invoke-virtual {v9}, Ljava/util/Vector;->size()I

    move-result v17

    move/from16 v0, v17

    new-array v7, v0, [Ljava/security/cert/Certificate;

    .line 471
    .local v7, "certChain":[Ljava/security/cert/Certificate;
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_d7
    array-length v0, v7

    move/from16 v17, v0

    move/from16 v0, v17

    if-eq v11, v0, :cond_11

    .line 473
    invoke-virtual {v9, v11}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/security/cert/Certificate;

    aput-object v17, v7, v11

    .line 471
    add-int/lit8 v11, v11, 0x1

    goto :goto_d7

    .line 479
    .end local v7    # "certChain":[Ljava/security/cert/Certificate;
    .end local v9    # "cs":Ljava/util/Vector;
    .end local v11    # "i":I
    :cond_e9
    const/4 v7, 0x0

    goto/16 :goto_11

    .line 442
    .restart local v5    # "bytes":[B
    .restart local v8    # "crt":Ljava/security/cert/X509Certificate;
    .restart local v9    # "cs":Ljava/util/Vector;
    .local v10, "e":Ljava/util/Enumeration;
    .local v11, "i":Ljava/security/Principal;
    .restart local v13    # "nextC":Ljava/security/cert/Certificate;
    .restart local v14    # "s":Ljava/security/Principal;
    .restart local v15    # "sub":Ljava/security/Principal;
    .restart local v16    # "x509c":Ljava/security/cert/X509Certificate;
    :catch_ec
    move-exception v17

    goto :goto_87
.end method

.method public engineGetCreationDate(Ljava/lang/String;)Ljava/util/Date;
    .registers 4
    .param p1, "alias"    # Ljava/lang/String;

    .prologue
    .line 484
    if-nez p1, :cond_a

    .line 486
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "alias == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 488
    :cond_a
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->keys:Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;

    invoke-virtual {v0, p1}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_1c

    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->certs:Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;

    invoke-virtual {v0, p1}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_1c

    .line 490
    const/4 v0, 0x0

    .line 492
    :goto_1b
    return-object v0

    :cond_1c
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    goto :goto_1b
.end method

.method public engineGetKey(Ljava/lang/String;[C)Ljava/security/Key;
    .registers 5
    .param p1, "alias"    # Ljava/lang/String;
    .param p2, "password"    # [C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/UnrecoverableKeyException;
        }
    .end annotation

    .prologue
    .line 500
    if-nez p1, :cond_a

    .line 502
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "null alias passed to getKey."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 505
    :cond_a
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->keys:Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;

    invoke-virtual {v0, p1}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/security/Key;

    return-object v0
.end method

.method public engineIsCertificateEntry(Ljava/lang/String;)Z
    .registers 3
    .param p1, "alias"    # Ljava/lang/String;

    .prologue
    .line 511
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->certs:Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;

    invoke-virtual {v0, p1}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_12

    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->keys:Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;

    invoke-virtual {v0, p1}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_12

    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public engineIsKeyEntry(Ljava/lang/String;)Z
    .registers 3
    .param p1, "alias"    # Ljava/lang/String;

    .prologue
    .line 517
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->keys:Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;

    invoke-virtual {v0, p1}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public engineLoad(Ljava/io/InputStream;[C)V
    .registers 58
    .param p1, "stream"    # Ljava/io/InputStream;
    .param p2, "password"    # [C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 769
    if-nez p1, :cond_3

    .line 1209
    :cond_2
    return-void

    .line 774
    :cond_3
    if-nez p2, :cond_d

    .line 776
    new-instance v3, Ljava/lang/NullPointerException;

    const-string v4, "No password supplied for PKCS#12 KeyStore."

    invoke-direct {v3, v4}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 779
    :cond_d
    new-instance v26, Ljava/io/BufferedInputStream;

    move-object/from16 v0, v26

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 781
    .local v26, "bufIn":Ljava/io/BufferedInputStream;
    const/16 v3, 0xa

    move-object/from16 v0, v26

    invoke-virtual {v0, v3}, Ljava/io/BufferedInputStream;->mark(I)V

    .line 783
    invoke-virtual/range {v26 .. v26}, Ljava/io/BufferedInputStream;->read()I

    move-result v39

    .line 785
    .local v39, "head":I
    const/16 v3, 0x30

    move/from16 v0, v39

    if-eq v0, v3, :cond_2f

    .line 787
    new-instance v3, Ljava/io/IOException;

    const-string v4, "stream does not represent a PKCS12 key store"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 790
    :cond_2f
    invoke-virtual/range {v26 .. v26}, Ljava/io/BufferedInputStream;->reset()V

    .line 792
    new-instance v23, Lorg/spongycastle/asn1/ASN1InputStream;

    move-object/from16 v0, v23

    move-object/from16 v1, v26

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1InputStream;-><init>(Ljava/io/InputStream;)V

    .line 793
    .local v23, "bIn":Lorg/spongycastle/asn1/ASN1InputStream;
    invoke-virtual/range {v23 .. v23}, Lorg/spongycastle/asn1/ASN1InputStream;->readObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v47

    check-cast v47, Lorg/spongycastle/asn1/ASN1Sequence;

    .line 794
    .local v47, "obj":Lorg/spongycastle/asn1/ASN1Sequence;
    invoke-static/range {v47 .. v47}, Lorg/spongycastle/asn1/pkcs/Pfx;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/pkcs/Pfx;

    move-result-object v24

    .line 795
    .local v24, "bag":Lorg/spongycastle/asn1/pkcs/Pfx;
    invoke-virtual/range {v24 .. v24}, Lorg/spongycastle/asn1/pkcs/Pfx;->getAuthSafe()Lorg/spongycastle/asn1/pkcs/ContentInfo;

    move-result-object v41

    .line 796
    .local v41, "info":Lorg/spongycastle/asn1/pkcs/ContentInfo;
    new-instance v31, Ljava/util/Vector;

    invoke-direct/range {v31 .. v31}, Ljava/util/Vector;-><init>()V

    .line 797
    .local v31, "chain":Ljava/util/Vector;
    const/16 v54, 0x0

    .line 798
    .local v54, "unmarkedKey":Z
    const/4 v14, 0x0

    .line 800
    .local v14, "wrongPKCS12Zero":Z
    invoke-virtual/range {v24 .. v24}, Lorg/spongycastle/asn1/pkcs/Pfx;->getMacData()Lorg/spongycastle/asn1/pkcs/MacData;

    move-result-object v3

    if-eqz v3, :cond_e1

    .line 802
    invoke-virtual/range {v24 .. v24}, Lorg/spongycastle/asn1/pkcs/Pfx;->getMacData()Lorg/spongycastle/asn1/pkcs/MacData;

    move-result-object v45

    .line 803
    .local v45, "mData":Lorg/spongycastle/asn1/pkcs/MacData;
    invoke-virtual/range {v45 .. v45}, Lorg/spongycastle/asn1/pkcs/MacData;->getMac()Lorg/spongycastle/asn1/x509/DigestInfo;

    move-result-object v34

    .line 804
    .local v34, "dInfo":Lorg/spongycastle/asn1/x509/DigestInfo;
    invoke-virtual/range {v34 .. v34}, Lorg/spongycastle/asn1/x509/DigestInfo;->getAlgorithmId()Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    move-result-object v17

    .line 805
    .local v17, "algId":Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;
    invoke-virtual/range {v45 .. v45}, Lorg/spongycastle/asn1/pkcs/MacData;->getSalt()[B

    move-result-object v5

    .line 806
    .local v5, "salt":[B
    invoke-virtual/range {v45 .. v45}, Lorg/spongycastle/asn1/pkcs/MacData;->getIterationCount()Ljava/math/BigInteger;

    move-result-object v3

    invoke-virtual {v3}, Ljava/math/BigInteger;->intValue()I

    move-result v6

    .line 808
    .local v6, "itCount":I
    invoke-virtual/range {v41 .. v41}, Lorg/spongycastle/asn1/pkcs/ContentInfo;->getContent()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v3

    check-cast v3, Lorg/spongycastle/asn1/ASN1OctetString;

    invoke-virtual {v3}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v9

    .line 812
    .local v9, "data":[B
    :try_start_79
    invoke-virtual/range {v17 .. v17}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->getAlgorithm()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v4

    const/4 v8, 0x0

    move-object/from16 v3, p0

    move-object/from16 v7, p2

    invoke-direct/range {v3 .. v9}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->calculatePbeMac(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;[BI[CZ[B)[B

    move-result-object v51

    .line 813
    .local v51, "res":[B
    invoke-virtual/range {v34 .. v34}, Lorg/spongycastle/asn1/x509/DigestInfo;->getDigest()[B

    move-result-object v35

    .line 815
    .local v35, "dig":[B
    move-object/from16 v0, v51

    move-object/from16 v1, v35

    invoke-static {v0, v1}, Lorg/spongycastle/util/Arrays;->constantTimeAreEqual([B[B)Z

    move-result v3

    if-nez v3, :cond_e1

    .line 817
    move-object/from16 v0, p2

    array-length v3, v0

    if-lez v3, :cond_a3

    .line 819
    new-instance v3, Ljava/io/IOException;

    const-string v4, "PKCS12 key store mac invalid - wrong password or corrupted file."

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_a1
    .catch Ljava/io/IOException; {:try_start_79 .. :try_end_a1} :catch_a1
    .catch Ljava/lang/Exception; {:try_start_79 .. :try_end_a1} :catch_c2

    .line 833
    .end local v35    # "dig":[B
    .end local v51    # "res":[B
    :catch_a1
    move-exception v36

    .line 835
    .local v36, "e":Ljava/io/IOException;
    throw v36

    .line 823
    .end local v36    # "e":Ljava/io/IOException;
    .restart local v35    # "dig":[B
    .restart local v51    # "res":[B
    :cond_a3
    :try_start_a3
    invoke-virtual/range {v17 .. v17}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->getAlgorithm()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v4

    const/4 v8, 0x1

    move-object/from16 v3, p0

    move-object/from16 v7, p2

    invoke-direct/range {v3 .. v9}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->calculatePbeMac(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;[BI[CZ[B)[B

    move-result-object v51

    .line 825
    move-object/from16 v0, v51

    move-object/from16 v1, v35

    invoke-static {v0, v1}, Lorg/spongycastle/util/Arrays;->constantTimeAreEqual([B[B)Z

    move-result v3

    if-nez v3, :cond_e0

    .line 827
    new-instance v3, Ljava/io/IOException;

    const-string v4, "PKCS12 key store mac invalid - wrong password or corrupted file."

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_c2
    .catch Ljava/io/IOException; {:try_start_a3 .. :try_end_c2} :catch_a1
    .catch Ljava/lang/Exception; {:try_start_a3 .. :try_end_c2} :catch_c2

    .line 837
    .end local v35    # "dig":[B
    .end local v51    # "res":[B
    :catch_c2
    move-exception v36

    .line 839
    .local v36, "e":Ljava/lang/Exception;
    new-instance v3, Ljava/io/IOException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "error constructing MAC: "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {v36 .. v36}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 830
    .end local v36    # "e":Ljava/lang/Exception;
    .restart local v35    # "dig":[B
    .restart local v51    # "res":[B
    :cond_e0
    const/4 v14, 0x1

    .line 843
    .end local v5    # "salt":[B
    .end local v6    # "itCount":I
    .end local v9    # "data":[B
    .end local v17    # "algId":Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;
    .end local v34    # "dInfo":Lorg/spongycastle/asn1/x509/DigestInfo;
    .end local v35    # "dig":[B
    .end local v45    # "mData":Lorg/spongycastle/asn1/pkcs/MacData;
    .end local v51    # "res":[B
    :cond_e1
    new-instance v3, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;

    const/4 v4, 0x0

    invoke-direct {v3, v4}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;-><init>(Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$1;)V

    move-object/from16 v0, p0

    iput-object v3, v0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->keys:Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;

    .line 844
    new-instance v3, Ljava/util/Hashtable;

    invoke-direct {v3}, Ljava/util/Hashtable;-><init>()V

    move-object/from16 v0, p0

    iput-object v3, v0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->localIds:Ljava/util/Hashtable;

    .line 846
    invoke-virtual/range {v41 .. v41}, Lorg/spongycastle/asn1/pkcs/ContentInfo;->getContentType()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v3

    sget-object v4, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->data:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v3, v4}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_51f

    .line 848
    new-instance v23, Lorg/spongycastle/asn1/ASN1InputStream;

    .end local v23    # "bIn":Lorg/spongycastle/asn1/ASN1InputStream;
    invoke-virtual/range {v41 .. v41}, Lorg/spongycastle/asn1/pkcs/ContentInfo;->getContent()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v3

    check-cast v3, Lorg/spongycastle/asn1/ASN1OctetString;

    invoke-virtual {v3}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v3

    move-object/from16 v0, v23

    invoke-direct {v0, v3}, Lorg/spongycastle/asn1/ASN1InputStream;-><init>([B)V

    .line 850
    .restart local v23    # "bIn":Lorg/spongycastle/asn1/ASN1InputStream;
    invoke-virtual/range {v23 .. v23}, Lorg/spongycastle/asn1/ASN1InputStream;->readObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v3

    invoke-static {v3}, Lorg/spongycastle/asn1/pkcs/AuthenticatedSafe;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/pkcs/AuthenticatedSafe;

    move-result-object v21

    .line 851
    .local v21, "authSafe":Lorg/spongycastle/asn1/pkcs/AuthenticatedSafe;
    invoke-virtual/range {v21 .. v21}, Lorg/spongycastle/asn1/pkcs/AuthenticatedSafe;->getContentInfo()[Lorg/spongycastle/asn1/pkcs/ContentInfo;

    move-result-object v27

    .line 853
    .local v27, "c":[Lorg/spongycastle/asn1/pkcs/ContentInfo;
    const/16 v40, 0x0

    .local v40, "i":I
    :goto_11f
    move-object/from16 v0, v27

    array-length v3, v0

    move/from16 v0, v40

    if-eq v0, v3, :cond_51f

    .line 855
    aget-object v3, v27, v40

    invoke-virtual {v3}, Lorg/spongycastle/asn1/pkcs/ContentInfo;->getContentType()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v3

    sget-object v4, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->data:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v3, v4}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_294

    .line 857
    new-instance v33, Lorg/spongycastle/asn1/ASN1InputStream;

    aget-object v3, v27, v40

    invoke-virtual {v3}, Lorg/spongycastle/asn1/pkcs/ContentInfo;->getContent()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v3

    check-cast v3, Lorg/spongycastle/asn1/ASN1OctetString;

    invoke-virtual {v3}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v3

    move-object/from16 v0, v33

    invoke-direct {v0, v3}, Lorg/spongycastle/asn1/ASN1InputStream;-><init>([B)V

    .line 858
    .local v33, "dIn":Lorg/spongycastle/asn1/ASN1InputStream;
    invoke-virtual/range {v33 .. v33}, Lorg/spongycastle/asn1/ASN1InputStream;->readObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v52

    check-cast v52, Lorg/spongycastle/asn1/ASN1Sequence;

    .line 860
    .local v52, "seq":Lorg/spongycastle/asn1/ASN1Sequence;
    const/16 v42, 0x0

    .local v42, "j":I
    :goto_14f
    invoke-virtual/range {v52 .. v52}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v3

    move/from16 v0, v42

    if-eq v0, v3, :cond_51b

    .line 862
    move-object/from16 v0, v52

    move/from16 v1, v42

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v3

    invoke-static {v3}, Lorg/spongycastle/asn1/pkcs/SafeBag;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/pkcs/SafeBag;

    move-result-object v22

    .line 863
    .local v22, "b":Lorg/spongycastle/asn1/pkcs/SafeBag;
    invoke-virtual/range {v22 .. v22}, Lorg/spongycastle/asn1/pkcs/SafeBag;->getBagId()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v3

    sget-object v4, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->pkcs8ShroudedKeyBag:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v3, v4}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_25a

    .line 865
    invoke-virtual/range {v22 .. v22}, Lorg/spongycastle/asn1/pkcs/SafeBag;->getBagValue()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v3

    invoke-static {v3}, Lorg/spongycastle/asn1/pkcs/EncryptedPrivateKeyInfo;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/pkcs/EncryptedPrivateKeyInfo;

    move-result-object v37

    .line 866
    .local v37, "eIn":Lorg/spongycastle/asn1/pkcs/EncryptedPrivateKeyInfo;
    invoke-virtual/range {v37 .. v37}, Lorg/spongycastle/asn1/pkcs/EncryptedPrivateKeyInfo;->getEncryptionAlgorithm()Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    move-result-object v3

    invoke-virtual/range {v37 .. v37}, Lorg/spongycastle/asn1/pkcs/EncryptedPrivateKeyInfo;->getEncryptedData()[B

    move-result-object v4

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v3, v4, v1, v14}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->unwrapKey(Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;[B[CZ)Ljava/security/PrivateKey;

    move-result-object v50

    .local v50, "privKey":Ljava/security/PrivateKey;
    move-object/from16 v25, v50

    .line 871
    check-cast v25, Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;

    .line 872
    .local v25, "bagAttr":Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;
    const/16 v18, 0x0

    .line 873
    .local v18, "alias":Ljava/lang/String;
    const/16 v44, 0x0

    .line 875
    .local v44, "localId":Lorg/spongycastle/asn1/ASN1OctetString;
    invoke-virtual/range {v22 .. v22}, Lorg/spongycastle/asn1/pkcs/SafeBag;->getBagAttributes()Lorg/spongycastle/asn1/ASN1Set;

    move-result-object v3

    if-eqz v3, :cond_21e

    .line 877
    invoke-virtual/range {v22 .. v22}, Lorg/spongycastle/asn1/pkcs/SafeBag;->getBagAttributes()Lorg/spongycastle/asn1/ASN1Set;

    move-result-object v3

    invoke-virtual {v3}, Lorg/spongycastle/asn1/ASN1Set;->getObjects()Ljava/util/Enumeration;

    move-result-object v36

    .line 878
    .local v36, "e":Ljava/util/Enumeration;
    :cond_19d
    :goto_19d
    invoke-interface/range {v36 .. v36}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_21e

    .line 880
    invoke-interface/range {v36 .. v36}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v53

    check-cast v53, Lorg/spongycastle/asn1/ASN1Sequence;

    .line 881
    .local v53, "sq":Lorg/spongycastle/asn1/ASN1Sequence;
    const/4 v3, 0x0

    move-object/from16 v0, v53

    invoke-virtual {v0, v3}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v16

    check-cast v16, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 882
    .local v16, "aOid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    const/4 v3, 0x1

    move-object/from16 v0, v53

    invoke-virtual {v0, v3}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v20

    check-cast v20, Lorg/spongycastle/asn1/ASN1Set;

    .line 883
    .local v20, "attrSet":Lorg/spongycastle/asn1/ASN1Set;
    const/16 v19, 0x0

    .line 885
    .local v19, "attr":Lorg/spongycastle/asn1/ASN1Primitive;
    invoke-virtual/range {v20 .. v20}, Lorg/spongycastle/asn1/ASN1Set;->size()I

    move-result v3

    if-lez v3, :cond_1f3

    .line 887
    const/4 v3, 0x0

    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Lorg/spongycastle/asn1/ASN1Set;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v19

    .end local v19    # "attr":Lorg/spongycastle/asn1/ASN1Primitive;
    check-cast v19, Lorg/spongycastle/asn1/ASN1Primitive;

    .line 889
    .restart local v19    # "attr":Lorg/spongycastle/asn1/ASN1Primitive;
    move-object/from16 v0, v25

    move-object/from16 v1, v16

    invoke-interface {v0, v1}, Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;->getBagAttribute(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v38

    .line 890
    .local v38, "existing":Lorg/spongycastle/asn1/ASN1Encodable;
    if-eqz v38, :cond_1ea

    .line 893
    invoke-interface/range {v38 .. v38}, Lorg/spongycastle/asn1/ASN1Encodable;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v3

    move-object/from16 v0, v19

    invoke-virtual {v3, v0}, Lorg/spongycastle/asn1/ASN1Primitive;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1f3

    .line 895
    new-instance v3, Ljava/io/IOException;

    const-string v4, "attempt to add existing attribute with different value"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 901
    :cond_1ea
    move-object/from16 v0, v25

    move-object/from16 v1, v16

    move-object/from16 v2, v19

    invoke-interface {v0, v1, v2}, Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;->setBagAttribute(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 905
    .end local v38    # "existing":Lorg/spongycastle/asn1/ASN1Encodable;
    :cond_1f3
    sget-object v3, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->pkcs_9_at_friendlyName:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-object/from16 v0, v16

    invoke-virtual {v0, v3}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_20f

    .line 907
    check-cast v19, Lorg/spongycastle/asn1/DERBMPString;

    .end local v19    # "attr":Lorg/spongycastle/asn1/ASN1Primitive;
    invoke-virtual/range {v19 .. v19}, Lorg/spongycastle/asn1/DERBMPString;->getString()Ljava/lang/String;

    move-result-object v18

    .line 908
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->keys:Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;

    move-object/from16 v0, v18

    move-object/from16 v1, v50

    invoke-virtual {v3, v0, v1}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;->put(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_19d

    .line 910
    .restart local v19    # "attr":Lorg/spongycastle/asn1/ASN1Primitive;
    :cond_20f
    sget-object v3, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->pkcs_9_at_localKeyId:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-object/from16 v0, v16

    invoke-virtual {v0, v3}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_19d

    move-object/from16 v44, v19

    .line 912
    check-cast v44, Lorg/spongycastle/asn1/ASN1OctetString;

    goto :goto_19d

    .line 917
    .end local v16    # "aOid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .end local v19    # "attr":Lorg/spongycastle/asn1/ASN1Primitive;
    .end local v20    # "attrSet":Lorg/spongycastle/asn1/ASN1Set;
    .end local v36    # "e":Ljava/util/Enumeration;
    .end local v53    # "sq":Lorg/spongycastle/asn1/ASN1Sequence;
    :cond_21e
    if-eqz v44, :cond_24c

    .line 919
    new-instance v46, Ljava/lang/String;

    invoke-virtual/range {v44 .. v44}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v3

    invoke-static {v3}, Lorg/spongycastle/util/encoders/Hex;->encode([B)[B

    move-result-object v3

    move-object/from16 v0, v46

    invoke-direct {v0, v3}, Ljava/lang/String;-><init>([B)V

    .line 921
    .local v46, "name":Ljava/lang/String;
    if-nez v18, :cond_240

    .line 923
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->keys:Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;

    move-object/from16 v0, v46

    move-object/from16 v1, v50

    invoke-virtual {v3, v0, v1}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;->put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 860
    .end local v18    # "alias":Ljava/lang/String;
    .end local v25    # "bagAttr":Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;
    .end local v37    # "eIn":Lorg/spongycastle/asn1/pkcs/EncryptedPrivateKeyInfo;
    .end local v44    # "localId":Lorg/spongycastle/asn1/ASN1OctetString;
    .end local v46    # "name":Ljava/lang/String;
    .end local v50    # "privKey":Ljava/security/PrivateKey;
    :goto_23c
    add-int/lit8 v42, v42, 0x1

    goto/16 :goto_14f

    .line 927
    .restart local v18    # "alias":Ljava/lang/String;
    .restart local v25    # "bagAttr":Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;
    .restart local v37    # "eIn":Lorg/spongycastle/asn1/pkcs/EncryptedPrivateKeyInfo;
    .restart local v44    # "localId":Lorg/spongycastle/asn1/ASN1OctetString;
    .restart local v46    # "name":Ljava/lang/String;
    .restart local v50    # "privKey":Ljava/security/PrivateKey;
    :cond_240
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->localIds:Ljava/util/Hashtable;

    move-object/from16 v0, v18

    move-object/from16 v1, v46

    invoke-virtual {v3, v0, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_23c

    .line 932
    .end local v46    # "name":Ljava/lang/String;
    :cond_24c
    const/16 v54, 0x1

    .line 933
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->keys:Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;

    const-string v4, "unmarked"

    move-object/from16 v0, v50

    invoke-virtual {v3, v4, v0}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;->put(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_23c

    .line 936
    .end local v18    # "alias":Ljava/lang/String;
    .end local v25    # "bagAttr":Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;
    .end local v37    # "eIn":Lorg/spongycastle/asn1/pkcs/EncryptedPrivateKeyInfo;
    .end local v44    # "localId":Lorg/spongycastle/asn1/ASN1OctetString;
    .end local v50    # "privKey":Ljava/security/PrivateKey;
    :cond_25a
    invoke-virtual/range {v22 .. v22}, Lorg/spongycastle/asn1/pkcs/SafeBag;->getBagId()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v3

    sget-object v4, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->certBag:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v3, v4}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_26e

    .line 938
    move-object/from16 v0, v31

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_23c

    .line 942
    :cond_26e
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "extra in data "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {v22 .. v22}, Lorg/spongycastle/asn1/pkcs/SafeBag;->getBagId()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 943
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static/range {v22 .. v22}, Lorg/spongycastle/asn1/util/ASN1Dump;->dumpAsString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_23c

    .line 947
    .end local v22    # "b":Lorg/spongycastle/asn1/pkcs/SafeBag;
    .end local v33    # "dIn":Lorg/spongycastle/asn1/ASN1InputStream;
    .end local v42    # "j":I
    .end local v52    # "seq":Lorg/spongycastle/asn1/ASN1Sequence;
    :cond_294
    aget-object v3, v27, v40

    invoke-virtual {v3}, Lorg/spongycastle/asn1/pkcs/ContentInfo;->getContentType()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v3

    sget-object v4, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->encryptedData:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v3, v4}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4d7

    .line 949
    aget-object v3, v27, v40

    invoke-virtual {v3}, Lorg/spongycastle/asn1/pkcs/ContentInfo;->getContent()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v3

    invoke-static {v3}, Lorg/spongycastle/asn1/pkcs/EncryptedData;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/pkcs/EncryptedData;

    move-result-object v32

    .line 950
    .local v32, "d":Lorg/spongycastle/asn1/pkcs/EncryptedData;
    const/4 v11, 0x0

    invoke-virtual/range {v32 .. v32}, Lorg/spongycastle/asn1/pkcs/EncryptedData;->getEncryptionAlgorithm()Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    move-result-object v12

    .line 951
    invoke-virtual/range {v32 .. v32}, Lorg/spongycastle/asn1/pkcs/EncryptedData;->getContent()Lorg/spongycastle/asn1/ASN1OctetString;

    move-result-object v3

    invoke-virtual {v3}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v15

    move-object/from16 v10, p0

    move-object/from16 v13, p2

    .line 950
    invoke-virtual/range {v10 .. v15}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->cryptData(ZLorg/spongycastle/asn1/x509/AlgorithmIdentifier;[CZ[B)[B

    move-result-object v48

    .line 952
    .local v48, "octets":[B
    invoke-static/range {v48 .. v48}, Lorg/spongycastle/asn1/ASN1Primitive;->fromByteArray([B)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v52

    check-cast v52, Lorg/spongycastle/asn1/ASN1Sequence;

    .line 954
    .restart local v52    # "seq":Lorg/spongycastle/asn1/ASN1Sequence;
    const/16 v42, 0x0

    .restart local v42    # "j":I
    :goto_2c9
    invoke-virtual/range {v52 .. v52}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v3

    move/from16 v0, v42

    if-eq v0, v3, :cond_51b

    .line 956
    move-object/from16 v0, v52

    move/from16 v1, v42

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v3

    invoke-static {v3}, Lorg/spongycastle/asn1/pkcs/SafeBag;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/pkcs/SafeBag;

    move-result-object v22

    .line 958
    .restart local v22    # "b":Lorg/spongycastle/asn1/pkcs/SafeBag;
    invoke-virtual/range {v22 .. v22}, Lorg/spongycastle/asn1/pkcs/SafeBag;->getBagId()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v3

    sget-object v4, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->certBag:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v3, v4}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2f3

    .line 960
    move-object/from16 v0, v31

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 954
    :goto_2f0
    add-int/lit8 v42, v42, 0x1

    goto :goto_2c9

    .line 962
    :cond_2f3
    invoke-virtual/range {v22 .. v22}, Lorg/spongycastle/asn1/pkcs/SafeBag;->getBagId()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v3

    sget-object v4, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->pkcs8ShroudedKeyBag:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v3, v4}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3d3

    .line 964
    invoke-virtual/range {v22 .. v22}, Lorg/spongycastle/asn1/pkcs/SafeBag;->getBagValue()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v3

    invoke-static {v3}, Lorg/spongycastle/asn1/pkcs/EncryptedPrivateKeyInfo;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/pkcs/EncryptedPrivateKeyInfo;

    move-result-object v37

    .line 965
    .restart local v37    # "eIn":Lorg/spongycastle/asn1/pkcs/EncryptedPrivateKeyInfo;
    invoke-virtual/range {v37 .. v37}, Lorg/spongycastle/asn1/pkcs/EncryptedPrivateKeyInfo;->getEncryptionAlgorithm()Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    move-result-object v3

    invoke-virtual/range {v37 .. v37}, Lorg/spongycastle/asn1/pkcs/EncryptedPrivateKeyInfo;->getEncryptedData()[B

    move-result-object v4

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v3, v4, v1, v14}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->unwrapKey(Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;[B[CZ)Ljava/security/PrivateKey;

    move-result-object v50

    .restart local v50    # "privKey":Ljava/security/PrivateKey;
    move-object/from16 v25, v50

    .line 970
    check-cast v25, Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;

    .line 971
    .restart local v25    # "bagAttr":Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;
    const/16 v18, 0x0

    .line 972
    .restart local v18    # "alias":Ljava/lang/String;
    const/16 v44, 0x0

    .line 974
    .restart local v44    # "localId":Lorg/spongycastle/asn1/ASN1OctetString;
    invoke-virtual/range {v22 .. v22}, Lorg/spongycastle/asn1/pkcs/SafeBag;->getBagAttributes()Lorg/spongycastle/asn1/ASN1Set;

    move-result-object v3

    invoke-virtual {v3}, Lorg/spongycastle/asn1/ASN1Set;->getObjects()Ljava/util/Enumeration;

    move-result-object v36

    .line 975
    .restart local v36    # "e":Ljava/util/Enumeration;
    :cond_327
    :goto_327
    invoke-interface/range {v36 .. v36}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_3a8

    .line 977
    invoke-interface/range {v36 .. v36}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v53

    check-cast v53, Lorg/spongycastle/asn1/ASN1Sequence;

    .line 978
    .restart local v53    # "sq":Lorg/spongycastle/asn1/ASN1Sequence;
    const/4 v3, 0x0

    move-object/from16 v0, v53

    invoke-virtual {v0, v3}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v16

    check-cast v16, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 979
    .restart local v16    # "aOid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    const/4 v3, 0x1

    move-object/from16 v0, v53

    invoke-virtual {v0, v3}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v20

    check-cast v20, Lorg/spongycastle/asn1/ASN1Set;

    .line 980
    .restart local v20    # "attrSet":Lorg/spongycastle/asn1/ASN1Set;
    const/16 v19, 0x0

    .line 982
    .restart local v19    # "attr":Lorg/spongycastle/asn1/ASN1Primitive;
    invoke-virtual/range {v20 .. v20}, Lorg/spongycastle/asn1/ASN1Set;->size()I

    move-result v3

    if-lez v3, :cond_37d

    .line 984
    const/4 v3, 0x0

    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Lorg/spongycastle/asn1/ASN1Set;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v19

    .end local v19    # "attr":Lorg/spongycastle/asn1/ASN1Primitive;
    check-cast v19, Lorg/spongycastle/asn1/ASN1Primitive;

    .line 986
    .restart local v19    # "attr":Lorg/spongycastle/asn1/ASN1Primitive;
    move-object/from16 v0, v25

    move-object/from16 v1, v16

    invoke-interface {v0, v1}, Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;->getBagAttribute(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v38

    .line 987
    .restart local v38    # "existing":Lorg/spongycastle/asn1/ASN1Encodable;
    if-eqz v38, :cond_374

    .line 990
    invoke-interface/range {v38 .. v38}, Lorg/spongycastle/asn1/ASN1Encodable;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v3

    move-object/from16 v0, v19

    invoke-virtual {v3, v0}, Lorg/spongycastle/asn1/ASN1Primitive;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_37d

    .line 992
    new-instance v3, Ljava/io/IOException;

    const-string v4, "attempt to add existing attribute with different value"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 998
    :cond_374
    move-object/from16 v0, v25

    move-object/from16 v1, v16

    move-object/from16 v2, v19

    invoke-interface {v0, v1, v2}, Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;->setBagAttribute(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 1002
    .end local v38    # "existing":Lorg/spongycastle/asn1/ASN1Encodable;
    :cond_37d
    sget-object v3, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->pkcs_9_at_friendlyName:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-object/from16 v0, v16

    invoke-virtual {v0, v3}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_399

    .line 1004
    check-cast v19, Lorg/spongycastle/asn1/DERBMPString;

    .end local v19    # "attr":Lorg/spongycastle/asn1/ASN1Primitive;
    invoke-virtual/range {v19 .. v19}, Lorg/spongycastle/asn1/DERBMPString;->getString()Ljava/lang/String;

    move-result-object v18

    .line 1005
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->keys:Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;

    move-object/from16 v0, v18

    move-object/from16 v1, v50

    invoke-virtual {v3, v0, v1}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;->put(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_327

    .line 1007
    .restart local v19    # "attr":Lorg/spongycastle/asn1/ASN1Primitive;
    :cond_399
    sget-object v3, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->pkcs_9_at_localKeyId:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-object/from16 v0, v16

    invoke-virtual {v0, v3}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_327

    move-object/from16 v44, v19

    .line 1009
    check-cast v44, Lorg/spongycastle/asn1/ASN1OctetString;

    goto :goto_327

    .line 1013
    .end local v16    # "aOid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .end local v19    # "attr":Lorg/spongycastle/asn1/ASN1Primitive;
    .end local v20    # "attrSet":Lorg/spongycastle/asn1/ASN1Set;
    .end local v53    # "sq":Lorg/spongycastle/asn1/ASN1Sequence;
    :cond_3a8
    new-instance v46, Ljava/lang/String;

    invoke-virtual/range {v44 .. v44}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v3

    invoke-static {v3}, Lorg/spongycastle/util/encoders/Hex;->encode([B)[B

    move-result-object v3

    move-object/from16 v0, v46

    invoke-direct {v0, v3}, Ljava/lang/String;-><init>([B)V

    .line 1015
    .restart local v46    # "name":Ljava/lang/String;
    if-nez v18, :cond_3c6

    .line 1017
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->keys:Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;

    move-object/from16 v0, v46

    move-object/from16 v1, v50

    invoke-virtual {v3, v0, v1}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;->put(Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_2f0

    .line 1021
    :cond_3c6
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->localIds:Ljava/util/Hashtable;

    move-object/from16 v0, v18

    move-object/from16 v1, v46

    invoke-virtual {v3, v0, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_2f0

    .line 1024
    .end local v18    # "alias":Ljava/lang/String;
    .end local v25    # "bagAttr":Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;
    .end local v36    # "e":Ljava/util/Enumeration;
    .end local v37    # "eIn":Lorg/spongycastle/asn1/pkcs/EncryptedPrivateKeyInfo;
    .end local v44    # "localId":Lorg/spongycastle/asn1/ASN1OctetString;
    .end local v46    # "name":Ljava/lang/String;
    .end local v50    # "privKey":Ljava/security/PrivateKey;
    :cond_3d3
    invoke-virtual/range {v22 .. v22}, Lorg/spongycastle/asn1/pkcs/SafeBag;->getBagId()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v3

    sget-object v4, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->keyBag:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v3, v4}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4b0

    .line 1026
    invoke-virtual/range {v22 .. v22}, Lorg/spongycastle/asn1/pkcs/SafeBag;->getBagValue()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v3

    invoke-static {v3}, Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;

    move-result-object v43

    .line 1027
    .local v43, "kInfo":Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;
    invoke-static/range {v43 .. v43}, Lorg/spongycastle/jce/provider/BouncyCastleProvider;->getPrivateKey(Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;)Ljava/security/PrivateKey;

    move-result-object v50

    .restart local v50    # "privKey":Ljava/security/PrivateKey;
    move-object/from16 v25, v50

    .line 1032
    check-cast v25, Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;

    .line 1033
    .restart local v25    # "bagAttr":Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;
    const/16 v18, 0x0

    .line 1034
    .restart local v18    # "alias":Ljava/lang/String;
    const/16 v44, 0x0

    .line 1036
    .restart local v44    # "localId":Lorg/spongycastle/asn1/ASN1OctetString;
    invoke-virtual/range {v22 .. v22}, Lorg/spongycastle/asn1/pkcs/SafeBag;->getBagAttributes()Lorg/spongycastle/asn1/ASN1Set;

    move-result-object v3

    invoke-virtual {v3}, Lorg/spongycastle/asn1/ASN1Set;->getObjects()Ljava/util/Enumeration;

    move-result-object v36

    .line 1037
    .restart local v36    # "e":Ljava/util/Enumeration;
    :cond_3fb
    :goto_3fb
    invoke-interface/range {v36 .. v36}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_485

    .line 1039
    invoke-interface/range {v36 .. v36}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v53

    .line 1040
    .restart local v53    # "sq":Lorg/spongycastle/asn1/ASN1Sequence;
    const/4 v3, 0x0

    move-object/from16 v0, v53

    invoke-virtual {v0, v3}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v3

    invoke-static {v3}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v16

    .line 1041
    .restart local v16    # "aOid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    const/4 v3, 0x1

    move-object/from16 v0, v53

    invoke-virtual {v0, v3}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v3

    invoke-static {v3}, Lorg/spongycastle/asn1/ASN1Set;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Set;

    move-result-object v20

    .line 1042
    .restart local v20    # "attrSet":Lorg/spongycastle/asn1/ASN1Set;
    const/16 v19, 0x0

    .line 1044
    .restart local v19    # "attr":Lorg/spongycastle/asn1/ASN1Primitive;
    invoke-virtual/range {v20 .. v20}, Lorg/spongycastle/asn1/ASN1Set;->size()I

    move-result v3

    if-lez v3, :cond_3fb

    .line 1046
    const/4 v3, 0x0

    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Lorg/spongycastle/asn1/ASN1Set;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v19

    .end local v19    # "attr":Lorg/spongycastle/asn1/ASN1Primitive;
    check-cast v19, Lorg/spongycastle/asn1/ASN1Primitive;

    .line 1048
    .restart local v19    # "attr":Lorg/spongycastle/asn1/ASN1Primitive;
    move-object/from16 v0, v25

    move-object/from16 v1, v16

    invoke-interface {v0, v1}, Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;->getBagAttribute(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v38

    .line 1049
    .restart local v38    # "existing":Lorg/spongycastle/asn1/ASN1Encodable;
    if-eqz v38, :cond_44e

    .line 1052
    invoke-interface/range {v38 .. v38}, Lorg/spongycastle/asn1/ASN1Encodable;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v3

    move-object/from16 v0, v19

    invoke-virtual {v3, v0}, Lorg/spongycastle/asn1/ASN1Primitive;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_457

    .line 1054
    new-instance v3, Ljava/io/IOException;

    const-string v4, "attempt to add existing attribute with different value"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1060
    :cond_44e
    move-object/from16 v0, v25

    move-object/from16 v1, v16

    move-object/from16 v2, v19

    invoke-interface {v0, v1, v2}, Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;->setBagAttribute(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 1063
    :cond_457
    sget-object v3, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->pkcs_9_at_friendlyName:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-object/from16 v0, v16

    invoke-virtual {v0, v3}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_475

    move-object/from16 v3, v19

    .line 1065
    check-cast v3, Lorg/spongycastle/asn1/DERBMPString;

    invoke-virtual {v3}, Lorg/spongycastle/asn1/DERBMPString;->getString()Ljava/lang/String;

    move-result-object v18

    .line 1066
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->keys:Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;

    move-object/from16 v0, v18

    move-object/from16 v1, v50

    invoke-virtual {v3, v0, v1}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;->put(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_3fb

    .line 1068
    :cond_475
    sget-object v3, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->pkcs_9_at_localKeyId:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-object/from16 v0, v16

    invoke-virtual {v0, v3}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3fb

    move-object/from16 v44, v19

    .line 1070
    check-cast v44, Lorg/spongycastle/asn1/ASN1OctetString;

    goto/16 :goto_3fb

    .line 1075
    .end local v16    # "aOid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .end local v19    # "attr":Lorg/spongycastle/asn1/ASN1Primitive;
    .end local v20    # "attrSet":Lorg/spongycastle/asn1/ASN1Set;
    .end local v38    # "existing":Lorg/spongycastle/asn1/ASN1Encodable;
    .end local v53    # "sq":Lorg/spongycastle/asn1/ASN1Sequence;
    :cond_485
    new-instance v46, Ljava/lang/String;

    invoke-virtual/range {v44 .. v44}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v3

    invoke-static {v3}, Lorg/spongycastle/util/encoders/Hex;->encode([B)[B

    move-result-object v3

    move-object/from16 v0, v46

    invoke-direct {v0, v3}, Ljava/lang/String;-><init>([B)V

    .line 1077
    .restart local v46    # "name":Ljava/lang/String;
    if-nez v18, :cond_4a3

    .line 1079
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->keys:Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;

    move-object/from16 v0, v46

    move-object/from16 v1, v50

    invoke-virtual {v3, v0, v1}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;->put(Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_2f0

    .line 1083
    :cond_4a3
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->localIds:Ljava/util/Hashtable;

    move-object/from16 v0, v18

    move-object/from16 v1, v46

    invoke-virtual {v3, v0, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_2f0

    .line 1088
    .end local v18    # "alias":Ljava/lang/String;
    .end local v25    # "bagAttr":Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;
    .end local v36    # "e":Ljava/util/Enumeration;
    .end local v43    # "kInfo":Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;
    .end local v44    # "localId":Lorg/spongycastle/asn1/ASN1OctetString;
    .end local v46    # "name":Ljava/lang/String;
    .end local v50    # "privKey":Ljava/security/PrivateKey;
    :cond_4b0
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "extra in encryptedData "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {v22 .. v22}, Lorg/spongycastle/asn1/pkcs/SafeBag;->getBagId()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 1089
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static/range {v22 .. v22}, Lorg/spongycastle/asn1/util/ASN1Dump;->dumpAsString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto/16 :goto_2f0

    .line 1095
    .end local v22    # "b":Lorg/spongycastle/asn1/pkcs/SafeBag;
    .end local v32    # "d":Lorg/spongycastle/asn1/pkcs/EncryptedData;
    .end local v42    # "j":I
    .end local v48    # "octets":[B
    .end local v52    # "seq":Lorg/spongycastle/asn1/ASN1Sequence;
    :cond_4d7
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "extra "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    aget-object v7, v27, v40

    invoke-virtual {v7}, Lorg/spongycastle/asn1/pkcs/ContentInfo;->getContentType()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v7

    invoke-virtual {v7}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 1096
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "extra "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    aget-object v7, v27, v40

    invoke-virtual {v7}, Lorg/spongycastle/asn1/pkcs/ContentInfo;->getContent()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v7

    invoke-static {v7}, Lorg/spongycastle/asn1/util/ASN1Dump;->dumpAsString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 853
    :cond_51b
    add-int/lit8 v40, v40, 0x1

    goto/16 :goto_11f

    .line 1101
    .end local v21    # "authSafe":Lorg/spongycastle/asn1/pkcs/AuthenticatedSafe;
    .end local v27    # "c":[Lorg/spongycastle/asn1/pkcs/ContentInfo;
    .end local v40    # "i":I
    :cond_51f
    new-instance v3, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;

    const/4 v4, 0x0

    invoke-direct {v3, v4}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;-><init>(Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$1;)V

    move-object/from16 v0, p0

    iput-object v3, v0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->certs:Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;

    .line 1102
    new-instance v3, Ljava/util/Hashtable;

    invoke-direct {v3}, Ljava/util/Hashtable;-><init>()V

    move-object/from16 v0, p0

    iput-object v3, v0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->chainCerts:Ljava/util/Hashtable;

    .line 1103
    new-instance v3, Ljava/util/Hashtable;

    invoke-direct {v3}, Ljava/util/Hashtable;-><init>()V

    move-object/from16 v0, p0

    iput-object v3, v0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->keyCerts:Ljava/util/Hashtable;

    .line 1105
    const/16 v40, 0x0

    .restart local v40    # "i":I
    :goto_53d
    invoke-virtual/range {v31 .. v31}, Ljava/util/Vector;->size()I

    move-result v3

    move/from16 v0, v40

    if-eq v0, v3, :cond_2

    .line 1107
    move-object/from16 v0, v31

    move/from16 v1, v40

    invoke-virtual {v0, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Lorg/spongycastle/asn1/pkcs/SafeBag;

    .line 1108
    .restart local v22    # "b":Lorg/spongycastle/asn1/pkcs/SafeBag;
    invoke-virtual/range {v22 .. v22}, Lorg/spongycastle/asn1/pkcs/SafeBag;->getBagValue()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v3

    invoke-static {v3}, Lorg/spongycastle/asn1/pkcs/CertBag;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/pkcs/CertBag;

    move-result-object v29

    .line 1110
    .local v29, "cb":Lorg/spongycastle/asn1/pkcs/CertBag;
    invoke-virtual/range {v29 .. v29}, Lorg/spongycastle/asn1/pkcs/CertBag;->getCertId()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v3

    sget-object v4, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->x509Certificate:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v3, v4}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_580

    .line 1112
    new-instance v3, Ljava/lang/RuntimeException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Unsupported certificate type: "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {v29 .. v29}, Lorg/spongycastle/asn1/pkcs/CertBag;->getCertId()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1119
    :cond_580
    :try_start_580
    new-instance v28, Ljava/io/ByteArrayInputStream;

    .line 1120
    invoke-virtual/range {v29 .. v29}, Lorg/spongycastle/asn1/pkcs/CertBag;->getCertValue()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v3

    check-cast v3, Lorg/spongycastle/asn1/ASN1OctetString;

    invoke-virtual {v3}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v3

    move-object/from16 v0, v28

    invoke-direct {v0, v3}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 1121
    .local v28, "cIn":Ljava/io/ByteArrayInputStream;
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->certFact:Ljava/security/cert/CertificateFactory;

    move-object/from16 v0, v28

    invoke-virtual {v3, v0}, Ljava/security/cert/CertificateFactory;->generateCertificate(Ljava/io/InputStream;)Ljava/security/cert/Certificate;
    :try_end_59a
    .catch Ljava/lang/Exception; {:try_start_580 .. :try_end_59a} :catch_60a

    move-result-object v30

    .line 1131
    .local v30, "cert":Ljava/security/cert/Certificate;
    const/16 v44, 0x0

    .line 1132
    .restart local v44    # "localId":Lorg/spongycastle/asn1/ASN1OctetString;
    const/16 v18, 0x0

    .line 1134
    .restart local v18    # "alias":Ljava/lang/String;
    invoke-virtual/range {v22 .. v22}, Lorg/spongycastle/asn1/pkcs/SafeBag;->getBagAttributes()Lorg/spongycastle/asn1/ASN1Set;

    move-result-object v3

    if-eqz v3, :cond_640

    .line 1136
    invoke-virtual/range {v22 .. v22}, Lorg/spongycastle/asn1/pkcs/SafeBag;->getBagAttributes()Lorg/spongycastle/asn1/ASN1Set;

    move-result-object v3

    invoke-virtual {v3}, Lorg/spongycastle/asn1/ASN1Set;->getObjects()Ljava/util/Enumeration;

    move-result-object v36

    .line 1137
    .restart local v36    # "e":Ljava/util/Enumeration;
    :cond_5ad
    :goto_5ad
    invoke-interface/range {v36 .. v36}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_640

    .line 1139
    invoke-interface/range {v36 .. v36}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v53

    .line 1140
    .restart local v53    # "sq":Lorg/spongycastle/asn1/ASN1Sequence;
    const/4 v3, 0x0

    move-object/from16 v0, v53

    invoke-virtual {v0, v3}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v3

    invoke-static {v3}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v49

    .line 1141
    .local v49, "oid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    const/4 v3, 0x1

    move-object/from16 v0, v53

    invoke-virtual {v0, v3}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v3

    invoke-static {v3}, Lorg/spongycastle/asn1/ASN1Set;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Set;

    move-result-object v20

    .line 1143
    .restart local v20    # "attrSet":Lorg/spongycastle/asn1/ASN1Set;
    invoke-virtual/range {v20 .. v20}, Lorg/spongycastle/asn1/ASN1Set;->size()I

    move-result v3

    if-lez v3, :cond_5ad

    .line 1145
    const/4 v3, 0x0

    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Lorg/spongycastle/asn1/ASN1Set;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v19

    check-cast v19, Lorg/spongycastle/asn1/ASN1Primitive;

    .line 1146
    .restart local v19    # "attr":Lorg/spongycastle/asn1/ASN1Primitive;
    const/16 v25, 0x0

    .line 1148
    .restart local v25    # "bagAttr":Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;
    move-object/from16 v0, v30

    instance-of v3, v0, Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;

    if-eqz v3, :cond_61e

    move-object/from16 v25, v30

    .line 1150
    check-cast v25, Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;

    .line 1152
    move-object/from16 v0, v25

    move-object/from16 v1, v49

    invoke-interface {v0, v1}, Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;->getBagAttribute(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v38

    .line 1153
    .restart local v38    # "existing":Lorg/spongycastle/asn1/ASN1Encodable;
    if-eqz v38, :cond_615

    .line 1156
    invoke-interface/range {v38 .. v38}, Lorg/spongycastle/asn1/ASN1Encodable;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v3

    move-object/from16 v0, v19

    invoke-virtual {v3, v0}, Lorg/spongycastle/asn1/ASN1Primitive;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_61e

    .line 1158
    new-instance v3, Ljava/io/IOException;

    const-string v4, "attempt to add existing attribute with different value"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1123
    .end local v18    # "alias":Ljava/lang/String;
    .end local v19    # "attr":Lorg/spongycastle/asn1/ASN1Primitive;
    .end local v20    # "attrSet":Lorg/spongycastle/asn1/ASN1Set;
    .end local v25    # "bagAttr":Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;
    .end local v28    # "cIn":Ljava/io/ByteArrayInputStream;
    .end local v30    # "cert":Ljava/security/cert/Certificate;
    .end local v36    # "e":Ljava/util/Enumeration;
    .end local v38    # "existing":Lorg/spongycastle/asn1/ASN1Encodable;
    .end local v44    # "localId":Lorg/spongycastle/asn1/ASN1OctetString;
    .end local v49    # "oid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .end local v53    # "sq":Lorg/spongycastle/asn1/ASN1Sequence;
    :catch_60a
    move-exception v36

    .line 1125
    .local v36, "e":Ljava/lang/Exception;
    new-instance v3, Ljava/lang/RuntimeException;

    invoke-virtual/range {v36 .. v36}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1164
    .restart local v18    # "alias":Ljava/lang/String;
    .restart local v19    # "attr":Lorg/spongycastle/asn1/ASN1Primitive;
    .restart local v20    # "attrSet":Lorg/spongycastle/asn1/ASN1Set;
    .restart local v25    # "bagAttr":Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;
    .restart local v28    # "cIn":Ljava/io/ByteArrayInputStream;
    .restart local v30    # "cert":Ljava/security/cert/Certificate;
    .local v36, "e":Ljava/util/Enumeration;
    .restart local v38    # "existing":Lorg/spongycastle/asn1/ASN1Encodable;
    .restart local v44    # "localId":Lorg/spongycastle/asn1/ASN1OctetString;
    .restart local v49    # "oid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .restart local v53    # "sq":Lorg/spongycastle/asn1/ASN1Sequence;
    :cond_615
    move-object/from16 v0, v25

    move-object/from16 v1, v49

    move-object/from16 v2, v19

    invoke-interface {v0, v1, v2}, Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;->setBagAttribute(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 1168
    .end local v38    # "existing":Lorg/spongycastle/asn1/ASN1Encodable;
    :cond_61e
    sget-object v3, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->pkcs_9_at_friendlyName:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-object/from16 v0, v49

    invoke-virtual {v0, v3}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_630

    .line 1170
    check-cast v19, Lorg/spongycastle/asn1/DERBMPString;

    .end local v19    # "attr":Lorg/spongycastle/asn1/ASN1Primitive;
    invoke-virtual/range {v19 .. v19}, Lorg/spongycastle/asn1/DERBMPString;->getString()Ljava/lang/String;

    move-result-object v18

    goto/16 :goto_5ad

    .line 1172
    .restart local v19    # "attr":Lorg/spongycastle/asn1/ASN1Primitive;
    :cond_630
    sget-object v3, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->pkcs_9_at_localKeyId:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-object/from16 v0, v49

    invoke-virtual {v0, v3}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5ad

    move-object/from16 v44, v19

    .line 1174
    check-cast v44, Lorg/spongycastle/asn1/ASN1OctetString;

    goto/16 :goto_5ad

    .line 1180
    .end local v19    # "attr":Lorg/spongycastle/asn1/ASN1Primitive;
    .end local v20    # "attrSet":Lorg/spongycastle/asn1/ASN1Set;
    .end local v25    # "bagAttr":Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;
    .end local v36    # "e":Ljava/util/Enumeration;
    .end local v49    # "oid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .end local v53    # "sq":Lorg/spongycastle/asn1/ASN1Sequence;
    :cond_640
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->chainCerts:Ljava/util/Hashtable;

    new-instance v4, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$CertId;

    invoke-virtual/range {v30 .. v30}, Ljava/security/cert/Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v7

    move-object/from16 v0, p0

    invoke-direct {v4, v0, v7}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$CertId;-><init>(Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;Ljava/security/PublicKey;)V

    move-object/from16 v0, v30

    invoke-virtual {v3, v4, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1182
    if-eqz v54, :cond_69b

    .line 1184
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->keyCerts:Ljava/util/Hashtable;

    invoke-virtual {v3}, Ljava/util/Hashtable;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_697

    .line 1186
    new-instance v46, Ljava/lang/String;

    invoke-virtual/range {v30 .. v30}, Ljava/security/cert/Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v3

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->createSubjectKeyId(Ljava/security/PublicKey;)Lorg/spongycastle/asn1/x509/SubjectKeyIdentifier;

    move-result-object v3

    invoke-virtual {v3}, Lorg/spongycastle/asn1/x509/SubjectKeyIdentifier;->getKeyIdentifier()[B

    move-result-object v3

    invoke-static {v3}, Lorg/spongycastle/util/encoders/Hex;->encode([B)[B

    move-result-object v3

    move-object/from16 v0, v46

    invoke-direct {v0, v3}, Ljava/lang/String;-><init>([B)V

    .line 1188
    .restart local v46    # "name":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->keyCerts:Ljava/util/Hashtable;

    move-object/from16 v0, v46

    move-object/from16 v1, v30

    invoke-virtual {v3, v0, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1189
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->keys:Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->keys:Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;

    const-string v7, "unmarked"

    invoke-virtual {v4, v7}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;->remove(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    move-object/from16 v0, v46

    invoke-virtual {v3, v0, v4}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;->put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 1105
    .end local v46    # "name":Ljava/lang/String;
    :cond_697
    :goto_697
    add-int/lit8 v40, v40, 0x1

    goto/16 :goto_53d

    .line 1197
    :cond_69b
    if-eqz v44, :cond_6b7

    .line 1199
    new-instance v46, Ljava/lang/String;

    invoke-virtual/range {v44 .. v44}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v3

    invoke-static {v3}, Lorg/spongycastle/util/encoders/Hex;->encode([B)[B

    move-result-object v3

    move-object/from16 v0, v46

    invoke-direct {v0, v3}, Ljava/lang/String;-><init>([B)V

    .line 1201
    .restart local v46    # "name":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->keyCerts:Ljava/util/Hashtable;

    move-object/from16 v0, v46

    move-object/from16 v1, v30

    invoke-virtual {v3, v0, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1203
    .end local v46    # "name":Ljava/lang/String;
    :cond_6b7
    if-eqz v18, :cond_697

    .line 1205
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->certs:Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;

    move-object/from16 v0, v18

    move-object/from16 v1, v30

    invoke-virtual {v3, v0, v1}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;->put(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_697
.end method

.method public engineSetCertificateEntry(Ljava/lang/String;Ljava/security/cert/Certificate;)V
    .registers 6
    .param p1, "alias"    # Ljava/lang/String;
    .param p2, "cert"    # Ljava/security/cert/Certificate;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/KeyStoreException;
        }
    .end annotation

    .prologue
    .line 525
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->keys:Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;

    invoke-virtual {v0, p1}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_27

    .line 527
    new-instance v0, Ljava/security/KeyStoreException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "There is a key entry with the name "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/security/KeyStoreException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 530
    :cond_27
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->certs:Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;

    invoke-virtual {v0, p1, p2}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;->put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 531
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->chainCerts:Ljava/util/Hashtable;

    new-instance v1, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$CertId;

    invoke-virtual {p2}, Ljava/security/cert/Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$CertId;-><init>(Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;Ljava/security/PublicKey;)V

    invoke-virtual {v0, v1, p2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 532
    return-void
.end method

.method public engineSetKeyEntry(Ljava/lang/String;Ljava/security/Key;[C[Ljava/security/cert/Certificate;)V
    .registers 9
    .param p1, "alias"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/security/Key;
    .param p3, "password"    # [C
    .param p4, "chain"    # [Ljava/security/cert/Certificate;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/KeyStoreException;
        }
    .end annotation

    .prologue
    .line 550
    instance-of v1, p2, Ljava/security/PrivateKey;

    if-nez v1, :cond_c

    .line 552
    new-instance v1, Ljava/security/KeyStoreException;

    const-string v2, "PKCS12 does not support non-PrivateKeys"

    invoke-direct {v1, v2}, Ljava/security/KeyStoreException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 555
    :cond_c
    instance-of v1, p2, Ljava/security/PrivateKey;

    if-eqz v1, :cond_1a

    if-nez p4, :cond_1a

    .line 557
    new-instance v1, Ljava/security/KeyStoreException;

    const-string v2, "no certificate chain for private key"

    invoke-direct {v1, v2}, Ljava/security/KeyStoreException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 560
    :cond_1a
    iget-object v1, p0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->keys:Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;

    invoke-virtual {v1, p1}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_25

    .line 562
    invoke-virtual {p0, p1}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->engineDeleteEntry(Ljava/lang/String;)V

    .line 565
    :cond_25
    iget-object v1, p0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->keys:Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;

    invoke-virtual {v1, p1, p2}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;->put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 566
    if-eqz p4, :cond_4d

    .line 568
    iget-object v1, p0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->certs:Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;

    const/4 v2, 0x0

    aget-object v2, p4, v2

    invoke-virtual {v1, p1, v2}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;->put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 570
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_35
    array-length v1, p4

    if-eq v0, v1, :cond_4d

    .line 572
    iget-object v1, p0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->chainCerts:Ljava/util/Hashtable;

    new-instance v2, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$CertId;

    aget-object v3, p4, v0

    invoke-virtual {v3}, Ljava/security/cert/Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v3

    invoke-direct {v2, p0, v3}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$CertId;-><init>(Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;Ljava/security/PublicKey;)V

    aget-object v3, p4, v0

    invoke-virtual {v1, v2, v3}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 570
    add-int/lit8 v0, v0, 0x1

    goto :goto_35

    .line 575
    .end local v0    # "i":I
    :cond_4d
    return-void
.end method

.method public engineSetKeyEntry(Ljava/lang/String;[B[Ljava/security/cert/Certificate;)V
    .registers 6
    .param p1, "alias"    # Ljava/lang/String;
    .param p2, "key"    # [B
    .param p3, "chain"    # [Ljava/security/cert/Certificate;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/KeyStoreException;
        }
    .end annotation

    .prologue
    .line 540
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "operation not supported"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public engineSize()I
    .registers 6

    .prologue
    .line 579
    new-instance v2, Ljava/util/Hashtable;

    invoke-direct {v2}, Ljava/util/Hashtable;-><init>()V

    .line 581
    .local v2, "tab":Ljava/util/Hashtable;
    iget-object v3, p0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->certs:Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;

    invoke-virtual {v3}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;->keys()Ljava/util/Enumeration;

    move-result-object v1

    .line 582
    .local v1, "e":Ljava/util/Enumeration;
    :goto_b
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_1b

    .line 584
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    const-string v4, "cert"

    invoke-virtual {v2, v3, v4}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_b

    .line 587
    :cond_1b
    iget-object v3, p0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->keys:Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;

    invoke-virtual {v3}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi$IgnoresCaseHashtable;->keys()Ljava/util/Enumeration;

    move-result-object v1

    .line 588
    :cond_21
    :goto_21
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_39

    .line 590
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 591
    .local v0, "a":Ljava/lang/String;
    invoke-virtual {v2, v0}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_21

    .line 593
    const-string v3, "key"

    invoke-virtual {v2, v0, v3}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_21

    .line 597
    .end local v0    # "a":Ljava/lang/String;
    :cond_39
    invoke-virtual {v2}, Ljava/util/Hashtable;->size()I

    move-result v3

    return v3
.end method

.method public engineStore(Ljava/io/OutputStream;[C)V
    .registers 4
    .param p1, "stream"    # Ljava/io/OutputStream;
    .param p2, "password"    # [C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1260
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->doStore(Ljava/io/OutputStream;[CZ)V

    .line 1261
    return-void
.end method

.method public engineStore(Ljava/security/KeyStore$LoadStoreParameter;)V
    .registers 8
    .param p1, "param"    # Ljava/security/KeyStore$LoadStoreParameter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/cert/CertificateException;
        }
    .end annotation

    .prologue
    .line 1215
    if-nez p1, :cond_a

    .line 1217
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "\'param\' arg cannot be null"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1220
    :cond_a
    instance-of v3, p1, Lorg/spongycastle/jcajce/PKCS12StoreParameter;

    if-nez v3, :cond_33

    instance-of v3, p1, Lorg/spongycastle/jce/provider/JDKPKCS12StoreParameter;

    if-nez v3, :cond_33

    .line 1222
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "No support for \'param\' of type "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 1223
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1228
    :cond_33
    instance-of v3, p1, Lorg/spongycastle/jcajce/PKCS12StoreParameter;

    if-eqz v3, :cond_4d

    move-object v0, p1

    .line 1230
    check-cast v0, Lorg/spongycastle/jcajce/PKCS12StoreParameter;

    .line 1239
    .local v0, "bcParam":Lorg/spongycastle/jcajce/PKCS12StoreParameter;
    :goto_3a
    invoke-interface {p1}, Ljava/security/KeyStore$LoadStoreParameter;->getProtectionParameter()Ljava/security/KeyStore$ProtectionParameter;

    move-result-object v2

    .line 1240
    .local v2, "protParam":Ljava/security/KeyStore$ProtectionParameter;
    if-nez v2, :cond_65

    .line 1242
    const/4 v1, 0x0

    .line 1254
    .end local v2    # "protParam":Ljava/security/KeyStore$ProtectionParameter;
    .local v1, "password":[C
    :goto_41
    invoke-virtual {v0}, Lorg/spongycastle/jcajce/PKCS12StoreParameter;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v3

    invoke-virtual {v0}, Lorg/spongycastle/jcajce/PKCS12StoreParameter;->isForDEREncoding()Z

    move-result v4

    invoke-direct {p0, v3, v1, v4}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->doStore(Ljava/io/OutputStream;[CZ)V

    .line 1255
    return-void

    .line 1234
    .end local v0    # "bcParam":Lorg/spongycastle/jcajce/PKCS12StoreParameter;
    .end local v1    # "password":[C
    :cond_4d
    new-instance v0, Lorg/spongycastle/jcajce/PKCS12StoreParameter;

    move-object v3, p1

    check-cast v3, Lorg/spongycastle/jce/provider/JDKPKCS12StoreParameter;

    invoke-virtual {v3}, Lorg/spongycastle/jce/provider/JDKPKCS12StoreParameter;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v4

    .line 1235
    invoke-interface {p1}, Ljava/security/KeyStore$LoadStoreParameter;->getProtectionParameter()Ljava/security/KeyStore$ProtectionParameter;

    move-result-object v5

    move-object v3, p1

    check-cast v3, Lorg/spongycastle/jce/provider/JDKPKCS12StoreParameter;

    invoke-virtual {v3}, Lorg/spongycastle/jce/provider/JDKPKCS12StoreParameter;->isUseDEREncoding()Z

    move-result v3

    invoke-direct {v0, v4, v5, v3}, Lorg/spongycastle/jcajce/PKCS12StoreParameter;-><init>(Ljava/io/OutputStream;Ljava/security/KeyStore$ProtectionParameter;Z)V

    .restart local v0    # "bcParam":Lorg/spongycastle/jcajce/PKCS12StoreParameter;
    goto :goto_3a

    .line 1244
    .restart local v2    # "protParam":Ljava/security/KeyStore$ProtectionParameter;
    :cond_65
    instance-of v3, v2, Ljava/security/KeyStore$PasswordProtection;

    if-eqz v3, :cond_70

    .line 1246
    check-cast v2, Ljava/security/KeyStore$PasswordProtection;

    .end local v2    # "protParam":Ljava/security/KeyStore$ProtectionParameter;
    invoke-virtual {v2}, Ljava/security/KeyStore$PasswordProtection;->getPassword()[C

    move-result-object v1

    .restart local v1    # "password":[C
    goto :goto_41

    .line 1250
    .end local v1    # "password":[C
    .restart local v2    # "protParam":Ljava/security/KeyStore$ProtectionParameter;
    :cond_70
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "No support for protection parameter of type "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 1251
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method public setRandom(Ljava/security/SecureRandom;)V
    .registers 2
    .param p1, "rand"    # Ljava/security/SecureRandom;

    .prologue
    .line 241
    iput-object p1, p0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->random:Ljava/security/SecureRandom;

    .line 242
    return-void
.end method

.method protected unwrapKey(Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;[B[CZ)Ljava/security/PrivateKey;
    .registers 14
    .param p1, "algId"    # Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;
    .param p2, "data"    # [B
    .param p3, "password"    # [C
    .param p4, "wrongPKCS12Zero"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 607
    invoke-virtual {p1}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->getAlgorithm()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v0

    .line 610
    .local v0, "algorithm":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    :try_start_4
    sget-object v6, Lorg/spongycastle/asn1/pkcs/PKCSObjectIdentifiers;->pkcs_12PbeIds:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0, v6}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->on(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Z

    move-result v6

    if-eqz v6, :cond_42

    .line 612
    invoke-virtual {p1}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->getParameters()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v6

    invoke-static {v6}, Lorg/spongycastle/asn1/pkcs/PKCS12PBEParams;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/pkcs/PKCS12PBEParams;

    move-result-object v5

    .line 613
    .local v5, "pbeParams":Lorg/spongycastle/asn1/pkcs/PKCS12PBEParams;
    new-instance v2, Ljavax/crypto/spec/PBEParameterSpec;

    .line 614
    invoke-virtual {v5}, Lorg/spongycastle/asn1/pkcs/PKCS12PBEParams;->getIV()[B

    move-result-object v6

    .line 615
    invoke-virtual {v5}, Lorg/spongycastle/asn1/pkcs/PKCS12PBEParams;->getIterations()Ljava/math/BigInteger;

    move-result-object v7

    invoke-virtual {v7}, Ljava/math/BigInteger;->intValue()I

    move-result v7

    invoke-direct {v2, v6, v7}, Ljavax/crypto/spec/PBEParameterSpec;-><init>([BI)V

    .line 617
    .local v2, "defParams":Ljavax/crypto/spec/PBEParameterSpec;
    iget-object v6, p0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->helper:Lorg/spongycastle/jcajce/util/JcaJceHelper;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Lorg/spongycastle/jcajce/util/JcaJceHelper;->createCipher(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v1

    .line 619
    .local v1, "cipher":Ljavax/crypto/Cipher;
    new-instance v4, Lorg/spongycastle/jcajce/PKCS12Key;

    invoke-direct {v4, p3, p4}, Lorg/spongycastle/jcajce/PKCS12Key;-><init>([CZ)V

    .line 621
    .local v4, "key":Lorg/spongycastle/jcajce/PKCS12Key;
    const/4 v6, 0x4

    invoke-virtual {v1, v6, v4, v2}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 624
    const-string v6, ""

    const/4 v7, 0x2

    invoke-virtual {v1, p2, v6, v7}, Ljavax/crypto/Cipher;->unwrap([BLjava/lang/String;I)Ljava/security/Key;

    move-result-object v6

    check-cast v6, Ljava/security/PrivateKey;

    .line 632
    .end local v2    # "defParams":Ljavax/crypto/spec/PBEParameterSpec;
    .end local v4    # "key":Lorg/spongycastle/jcajce/PKCS12Key;
    .end local v5    # "pbeParams":Lorg/spongycastle/asn1/pkcs/PKCS12PBEParams;
    :goto_41
    return-object v6

    .line 626
    .end local v1    # "cipher":Ljavax/crypto/Cipher;
    :cond_42
    sget-object v6, Lorg/spongycastle/asn1/pkcs/PKCSObjectIdentifiers;->id_PBES2:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0, v6}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_77

    .line 629
    const/4 v6, 0x4

    invoke-direct {p0, v6, p3, p1}, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->createCipher(I[CLorg/spongycastle/asn1/x509/AlgorithmIdentifier;)Ljavax/crypto/Cipher;

    move-result-object v1

    .line 632
    .restart local v1    # "cipher":Ljavax/crypto/Cipher;
    const-string v6, ""

    const/4 v7, 0x2

    invoke-virtual {v1, p2, v6, v7}, Ljavax/crypto/Cipher;->unwrap([BLjava/lang/String;I)Ljava/security/Key;

    move-result-object v6

    check-cast v6, Ljava/security/PrivateKey;
    :try_end_58
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_58} :catch_59

    goto :goto_41

    .line 635
    .end local v1    # "cipher":Ljavax/crypto/Cipher;
    :catch_59
    move-exception v3

    .line 637
    .local v3, "e":Ljava/lang/Exception;
    new-instance v6, Ljava/io/IOException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "exception unwrapping private key - "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v3}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 640
    .end local v3    # "e":Ljava/lang/Exception;
    :cond_77
    new-instance v6, Ljava/io/IOException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "exception unwrapping private key - cannot recognise: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6
.end method

.method protected wrapKey(Ljava/lang/String;Ljava/security/Key;Lorg/spongycastle/asn1/pkcs/PKCS12PBEParams;[C)[B
    .registers 14
    .param p1, "algorithm"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/security/Key;
    .param p3, "pbeParams"    # Lorg/spongycastle/asn1/pkcs/PKCS12PBEParams;
    .param p4, "password"    # [C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 650
    new-instance v5, Ljavax/crypto/spec/PBEKeySpec;

    invoke-direct {v5, p4}, Ljavax/crypto/spec/PBEKeySpec;-><init>([C)V

    .line 655
    .local v5, "pbeSpec":Ljavax/crypto/spec/PBEKeySpec;
    :try_start_5
    iget-object v6, p0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->helper:Lorg/spongycastle/jcajce/util/JcaJceHelper;

    invoke-interface {v6, p1}, Lorg/spongycastle/jcajce/util/JcaJceHelper;->createSecretKeyFactory(Ljava/lang/String;)Ljavax/crypto/SecretKeyFactory;

    move-result-object v3

    .line 656
    .local v3, "keyFact":Ljavax/crypto/SecretKeyFactory;
    new-instance v1, Ljavax/crypto/spec/PBEParameterSpec;

    .line 657
    invoke-virtual {p3}, Lorg/spongycastle/asn1/pkcs/PKCS12PBEParams;->getIV()[B

    move-result-object v6

    .line 658
    invoke-virtual {p3}, Lorg/spongycastle/asn1/pkcs/PKCS12PBEParams;->getIterations()Ljava/math/BigInteger;

    move-result-object v7

    invoke-virtual {v7}, Ljava/math/BigInteger;->intValue()I

    move-result v7

    invoke-direct {v1, v6, v7}, Ljavax/crypto/spec/PBEParameterSpec;-><init>([BI)V

    .line 660
    .local v1, "defParams":Ljavax/crypto/spec/PBEParameterSpec;
    iget-object v6, p0, Lorg/spongycastle/jcajce/provider/keystore/pkcs12/PKCS12KeyStoreSpi;->helper:Lorg/spongycastle/jcajce/util/JcaJceHelper;

    invoke-interface {v6, p1}, Lorg/spongycastle/jcajce/util/JcaJceHelper;->createCipher(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v0

    .line 662
    .local v0, "cipher":Ljavax/crypto/Cipher;
    const/4 v6, 0x3

    invoke-virtual {v3, v5}, Ljavax/crypto/SecretKeyFactory;->generateSecret(Ljava/security/spec/KeySpec;)Ljavax/crypto/SecretKey;

    move-result-object v7

    invoke-virtual {v0, v6, v7, v1}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 664
    invoke-virtual {v0, p2}, Ljavax/crypto/Cipher;->wrap(Ljava/security/Key;)[B
    :try_end_2d
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_2d} :catch_2f

    move-result-object v4

    .line 671
    .local v4, "out":[B
    return-object v4

    .line 666
    .end local v0    # "cipher":Ljavax/crypto/Cipher;
    .end local v1    # "defParams":Ljavax/crypto/spec/PBEParameterSpec;
    .end local v3    # "keyFact":Ljavax/crypto/SecretKeyFactory;
    .end local v4    # "out":[B
    :catch_2f
    move-exception v2

    .line 668
    .local v2, "e":Ljava/lang/Exception;
    new-instance v6, Ljava/io/IOException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "exception encrypting data - "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6
.end method
