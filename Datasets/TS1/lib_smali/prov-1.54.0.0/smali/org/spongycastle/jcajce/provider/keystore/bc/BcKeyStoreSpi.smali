.class public Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;
.super Ljava/security/KeyStoreSpi;
.source "BcKeyStoreSpi.java"

# interfaces
.implements Lorg/spongycastle/jce/interfaces/BCKeyStore;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$Version1;,
        Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$Std;,
        Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$BouncyCastleStore;,
        Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$StoreEntry;
    }
.end annotation


# static fields
.field static final CERTIFICATE:I = 0x1

.field static final KEY:I = 0x2

.field private static final KEY_CIPHER:Ljava/lang/String; = "PBEWithSHAAnd3-KeyTripleDES-CBC"

.field static final KEY_PRIVATE:I = 0x0

.field static final KEY_PUBLIC:I = 0x1

.field private static final KEY_SALT_SIZE:I = 0x14

.field static final KEY_SECRET:I = 0x2

.field private static final MIN_ITERATIONS:I = 0x400

.field static final NULL:I = 0x0

.field static final SEALED:I = 0x4

.field static final SECRET:I = 0x3

.field private static final STORE_CIPHER:Ljava/lang/String; = "PBEWithSHAAndTwofish-CBC"

.field private static final STORE_SALT_SIZE:I = 0x14

.field private static final STORE_VERSION:I = 0x2


# instance fields
.field private final helper:Lorg/spongycastle/jcajce/util/JcaJceHelper;

.field protected random:Ljava/security/SecureRandom;

.field protected table:Ljava/util/Hashtable;

.field protected version:I


# direct methods
.method public constructor <init>(I)V
    .registers 3
    .param p1, "version"    # I

    .prologue
    .line 98
    invoke-direct {p0}, Ljava/security/KeyStoreSpi;-><init>()V

    .line 89
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;->table:Ljava/util/Hashtable;

    .line 91
    new-instance v0, Ljava/security/SecureRandom;

    invoke-direct {v0}, Ljava/security/SecureRandom;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;->random:Ljava/security/SecureRandom;

    .line 95
    new-instance v0, Lorg/spongycastle/jcajce/util/BCJcaJceHelper;

    invoke-direct {v0}, Lorg/spongycastle/jcajce/util/BCJcaJceHelper;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;->helper:Lorg/spongycastle/jcajce/util/JcaJceHelper;

    .line 99
    iput p1, p0, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;->version:I

    .line 100
    return-void
.end method

.method static synthetic access$000(Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;Ljava/security/Key;Ljava/io/DataOutputStream;)V
    .registers 3
    .param p0, "x0"    # Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;
    .param p1, "x1"    # Ljava/security/Key;
    .param p2, "x2"    # Ljava/io/DataOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 59
    invoke-direct {p0, p1, p2}, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;->encodeKey(Ljava/security/Key;Ljava/io/DataOutputStream;)V

    return-void
.end method

.method static synthetic access$100(Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;Ljava/io/DataInputStream;)Ljava/security/Key;
    .registers 3
    .param p0, "x0"    # Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;
    .param p1, "x1"    # Ljava/io/DataInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 59
    invoke-direct {p0, p1}, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;->decodeKey(Ljava/io/DataInputStream;)Ljava/security/Key;

    move-result-object v0

    return-object v0
.end method

.method private decodeCertificate(Ljava/io/DataInputStream;)Ljava/security/cert/Certificate;
    .registers 9
    .param p1, "dIn"    # Ljava/io/DataInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 363
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    move-result-object v4

    .line 364
    .local v4, "type":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readInt()I

    move-result v5

    new-array v1, v5, [B

    .line 366
    .local v1, "cEnc":[B
    invoke-virtual {p1, v1}, Ljava/io/DataInputStream;->readFully([B)V

    .line 370
    :try_start_d
    iget-object v5, p0, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;->helper:Lorg/spongycastle/jcajce/util/JcaJceHelper;

    invoke-interface {v5, v4}, Lorg/spongycastle/jcajce/util/JcaJceHelper;->createCertificateFactory(Ljava/lang/String;)Ljava/security/cert/CertificateFactory;

    move-result-object v2

    .line 371
    .local v2, "cFact":Ljava/security/cert/CertificateFactory;
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 373
    .local v0, "bIn":Ljava/io/ByteArrayInputStream;
    invoke-virtual {v2, v0}, Ljava/security/cert/CertificateFactory;->generateCertificate(Ljava/io/InputStream;)Ljava/security/cert/Certificate;
    :try_end_1b
    .catch Ljava/security/NoSuchProviderException; {:try_start_d .. :try_end_1b} :catch_1d
    .catch Ljava/security/cert/CertificateException; {:try_start_d .. :try_end_1b} :catch_28

    move-result-object v5

    return-object v5

    .line 375
    .end local v0    # "bIn":Ljava/io/ByteArrayInputStream;
    .end local v2    # "cFact":Ljava/security/cert/CertificateFactory;
    :catch_1d
    move-exception v3

    .line 377
    .local v3, "ex":Ljava/security/NoSuchProviderException;
    new-instance v5, Ljava/io/IOException;

    invoke-virtual {v3}, Ljava/security/NoSuchProviderException;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 379
    .end local v3    # "ex":Ljava/security/NoSuchProviderException;
    :catch_28
    move-exception v3

    .line 381
    .local v3, "ex":Ljava/security/cert/CertificateException;
    new-instance v5, Ljava/io/IOException;

    invoke-virtual {v3}, Ljava/security/cert/CertificateException;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5
.end method

.method private decodeKey(Ljava/io/DataInputStream;)Ljava/security/Key;
    .registers 11
    .param p1, "dIn"    # Ljava/io/DataInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 415
    invoke-virtual {p1}, Ljava/io/DataInputStream;->read()I

    move-result v4

    .line 416
    .local v4, "keyType":I
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    move-result-object v3

    .line 417
    .local v3, "format":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    move-result-object v0

    .line 418
    .local v0, "algorithm":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readInt()I

    move-result v6

    new-array v2, v6, [B

    .line 421
    .local v2, "enc":[B
    invoke-virtual {p1, v2}, Ljava/io/DataInputStream;->readFully([B)V

    .line 423
    const-string v6, "PKCS#8"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_25

    const-string v6, "PKCS8"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_6a

    .line 425
    :cond_25
    new-instance v5, Ljava/security/spec/PKCS8EncodedKeySpec;

    invoke-direct {v5, v2}, Ljava/security/spec/PKCS8EncodedKeySpec;-><init>([B)V

    .line 442
    .local v5, "spec":Ljava/security/spec/KeySpec;
    :goto_2a
    packed-switch v4, :pswitch_data_ce

    .line 451
    :try_start_2d
    new-instance v6, Ljava/io/IOException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Key type "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " not recognised!"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_4c
    .catch Ljava/lang/Exception; {:try_start_2d .. :try_end_4c} :catch_4c

    .line 454
    :catch_4c
    move-exception v1

    .line 456
    .local v1, "e":Ljava/lang/Exception;
    new-instance v6, Ljava/io/IOException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Exception creating key: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 427
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v5    # "spec":Ljava/security/spec/KeySpec;
    :cond_6a
    const-string v6, "X.509"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_7a

    const-string v6, "X509"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_80

    .line 429
    :cond_7a
    new-instance v5, Ljava/security/spec/X509EncodedKeySpec;

    invoke-direct {v5, v2}, Ljava/security/spec/X509EncodedKeySpec;-><init>([B)V

    .restart local v5    # "spec":Ljava/security/spec/KeySpec;
    goto :goto_2a

    .line 431
    .end local v5    # "spec":Ljava/security/spec/KeySpec;
    :cond_80
    const-string v6, "RAW"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_8e

    .line 433
    new-instance v6, Ljavax/crypto/spec/SecretKeySpec;

    invoke-direct {v6, v2, v0}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 449
    :goto_8d
    return-object v6

    .line 437
    :cond_8e
    new-instance v6, Ljava/io/IOException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Key format "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " not recognised!"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 445
    .restart local v5    # "spec":Ljava/security/spec/KeySpec;
    :pswitch_ad
    :try_start_ad
    iget-object v6, p0, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;->helper:Lorg/spongycastle/jcajce/util/JcaJceHelper;

    invoke-interface {v6, v0}, Lorg/spongycastle/jcajce/util/JcaJceHelper;->createKeyFactory(Ljava/lang/String;)Ljava/security/KeyFactory;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/security/KeyFactory;->generatePrivate(Ljava/security/spec/KeySpec;)Ljava/security/PrivateKey;

    move-result-object v6

    goto :goto_8d

    .line 447
    :pswitch_b8
    iget-object v6, p0, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;->helper:Lorg/spongycastle/jcajce/util/JcaJceHelper;

    invoke-interface {v6, v0}, Lorg/spongycastle/jcajce/util/JcaJceHelper;->createKeyFactory(Ljava/lang/String;)Ljava/security/KeyFactory;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/security/KeyFactory;->generatePublic(Ljava/security/spec/KeySpec;)Ljava/security/PublicKey;

    move-result-object v6

    goto :goto_8d

    .line 449
    :pswitch_c3
    iget-object v6, p0, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;->helper:Lorg/spongycastle/jcajce/util/JcaJceHelper;

    invoke-interface {v6, v0}, Lorg/spongycastle/jcajce/util/JcaJceHelper;->createSecretKeyFactory(Ljava/lang/String;)Ljavax/crypto/SecretKeyFactory;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljavax/crypto/SecretKeyFactory;->generateSecret(Ljava/security/spec/KeySpec;)Ljavax/crypto/SecretKey;
    :try_end_cc
    .catch Ljava/lang/Exception; {:try_start_ad .. :try_end_cc} :catch_4c

    move-result-object v6

    goto :goto_8d

    .line 442
    :pswitch_data_ce
    .packed-switch 0x0
        :pswitch_ad
        :pswitch_b8
        :pswitch_c3
    .end packed-switch
.end method

.method private encodeCertificate(Ljava/security/cert/Certificate;Ljava/io/DataOutputStream;)V
    .registers 7
    .param p1, "cert"    # Ljava/security/cert/Certificate;
    .param p2, "dOut"    # Ljava/io/DataOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 347
    :try_start_0
    invoke-virtual {p1}, Ljava/security/cert/Certificate;->getEncoded()[B

    move-result-object v0

    .line 349
    .local v0, "cEnc":[B
    invoke-virtual {p1}, Ljava/security/cert/Certificate;->getType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 350
    array-length v2, v0

    invoke-virtual {p2, v2}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 351
    invoke-virtual {p2, v0}, Ljava/io/DataOutputStream;->write([B)V
    :try_end_12
    .catch Ljava/security/cert/CertificateEncodingException; {:try_start_0 .. :try_end_12} :catch_13

    .line 357
    return-void

    .line 353
    .end local v0    # "cEnc":[B
    :catch_13
    move-exception v1

    .line 355
    .local v1, "ex":Ljava/security/cert/CertificateEncodingException;
    new-instance v2, Ljava/io/IOException;

    invoke-virtual {v1}, Ljava/security/cert/CertificateEncodingException;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private encodeKey(Ljava/security/Key;Ljava/io/DataOutputStream;)V
    .registers 5
    .param p1, "key"    # Ljava/security/Key;
    .param p2, "dOut"    # Ljava/io/DataOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 390
    invoke-interface {p1}, Ljava/security/Key;->getEncoded()[B

    move-result-object v0

    .line 392
    .local v0, "enc":[B
    instance-of v1, p1, Ljava/security/PrivateKey;

    if-eqz v1, :cond_22

    .line 394
    const/4 v1, 0x0

    invoke-virtual {p2, v1}, Ljava/io/DataOutputStream;->write(I)V

    .line 405
    :goto_c
    invoke-interface {p1}, Ljava/security/Key;->getFormat()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 406
    invoke-interface {p1}, Ljava/security/Key;->getAlgorithm()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 407
    array-length v1, v0

    invoke-virtual {p2, v1}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 408
    invoke-virtual {p2, v0}, Ljava/io/DataOutputStream;->write([B)V

    .line 409
    return-void

    .line 396
    :cond_22
    instance-of v1, p1, Ljava/security/PublicKey;

    if-eqz v1, :cond_2b

    .line 398
    const/4 v1, 0x1

    invoke-virtual {p2, v1}, Ljava/io/DataOutputStream;->write(I)V

    goto :goto_c

    .line 402
    :cond_2b
    const/4 v1, 0x2

    invoke-virtual {p2, v1}, Ljava/io/DataOutputStream;->write(I)V

    goto :goto_c
.end method

.method static getBouncyCastleProvider()Ljava/security/Provider;
    .registers 1

    .prologue
    .line 1052
    const-string v0, "SC"

    invoke-static {v0}, Ljava/security/Security;->getProvider(Ljava/lang/String;)Ljava/security/Provider;

    move-result-object v0

    if-eqz v0, :cond_f

    .line 1054
    const-string v0, "SC"

    invoke-static {v0}, Ljava/security/Security;->getProvider(Ljava/lang/String;)Ljava/security/Provider;

    move-result-object v0

    .line 1058
    :goto_e
    return-object v0

    :cond_f
    new-instance v0, Lorg/spongycastle/jce/provider/BouncyCastleProvider;

    invoke-direct {v0}, Lorg/spongycastle/jce/provider/BouncyCastleProvider;-><init>()V

    goto :goto_e
.end method


# virtual methods
.method public engineAliases()Ljava/util/Enumeration;
    .registers 2

    .prologue
    .line 494
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;->table:Ljava/util/Hashtable;

    invoke-virtual {v0}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public engineContainsAlias(Ljava/lang/String;)Z
    .registers 3
    .param p1, "alias"    # Ljava/lang/String;

    .prologue
    .line 500
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;->table:Ljava/util/Hashtable;

    invoke-virtual {v0, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public engineDeleteEntry(Ljava/lang/String;)V
    .registers 4
    .param p1, "alias"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/KeyStoreException;
        }
    .end annotation

    .prologue
    .line 507
    iget-object v1, p0, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;->table:Ljava/util/Hashtable;

    invoke-virtual {v1, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 509
    .local v0, "entry":Ljava/lang/Object;
    if-nez v0, :cond_9

    .line 515
    :goto_8
    return-void

    .line 514
    :cond_9
    iget-object v1, p0, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;->table:Ljava/util/Hashtable;

    invoke-virtual {v1, p1}, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_8
.end method

.method public engineGetCertificate(Ljava/lang/String;)Ljava/security/cert/Certificate;
    .registers 6
    .param p1, "alias"    # Ljava/lang/String;

    .prologue
    .line 520
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;->table:Ljava/util/Hashtable;

    invoke-virtual {v2, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$StoreEntry;

    .line 522
    .local v1, "entry":Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$StoreEntry;
    if-eqz v1, :cond_22

    .line 524
    invoke-virtual {v1}, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$StoreEntry;->getType()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_18

    .line 526
    invoke-virtual {v1}, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$StoreEntry;->getObject()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/security/cert/Certificate;

    .line 539
    :goto_17
    return-object v2

    .line 530
    :cond_18
    invoke-virtual {v1}, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$StoreEntry;->getCertificateChain()[Ljava/security/cert/Certificate;

    move-result-object v0

    .line 532
    .local v0, "chain":[Ljava/security/cert/Certificate;
    if-eqz v0, :cond_22

    .line 534
    const/4 v2, 0x0

    aget-object v2, v0, v2

    goto :goto_17

    .line 539
    .end local v0    # "chain":[Ljava/security/cert/Certificate;
    :cond_22
    const/4 v2, 0x0

    goto :goto_17
.end method

.method public engineGetCertificateAlias(Ljava/security/cert/Certificate;)Ljava/lang/String;
    .registers 7
    .param p1, "cert"    # Ljava/security/cert/Certificate;

    .prologue
    .line 545
    iget-object v4, p0, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;->table:Ljava/util/Hashtable;

    invoke-virtual {v4}, Ljava/util/Hashtable;->elements()Ljava/util/Enumeration;

    move-result-object v2

    .line 546
    .local v2, "e":Ljava/util/Enumeration;
    :cond_6
    invoke-interface {v2}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-eqz v4, :cond_3f

    .line 548
    invoke-interface {v2}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$StoreEntry;

    .line 550
    .local v3, "entry":Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$StoreEntry;
    invoke-virtual {v3}, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$StoreEntry;->getObject()Ljava/lang/Object;

    move-result-object v4

    instance-of v4, v4, Ljava/security/cert/Certificate;

    if-eqz v4, :cond_2b

    .line 552
    invoke-virtual {v3}, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$StoreEntry;->getObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/security/cert/Certificate;

    .line 554
    .local v0, "c":Ljava/security/cert/Certificate;
    invoke-virtual {v0, p1}, Ljava/security/cert/Certificate;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 556
    invoke-virtual {v3}, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$StoreEntry;->getAlias()Ljava/lang/String;

    move-result-object v4

    .line 570
    .end local v0    # "c":Ljava/security/cert/Certificate;
    .end local v3    # "entry":Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$StoreEntry;
    :goto_2a
    return-object v4

    .line 561
    .restart local v3    # "entry":Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$StoreEntry;
    :cond_2b
    invoke-virtual {v3}, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$StoreEntry;->getCertificateChain()[Ljava/security/cert/Certificate;

    move-result-object v1

    .line 563
    .local v1, "chain":[Ljava/security/cert/Certificate;
    if-eqz v1, :cond_6

    const/4 v4, 0x0

    aget-object v4, v1, v4

    invoke-virtual {v4, p1}, Ljava/security/cert/Certificate;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 565
    invoke-virtual {v3}, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$StoreEntry;->getAlias()Ljava/lang/String;

    move-result-object v4

    goto :goto_2a

    .line 570
    .end local v1    # "chain":[Ljava/security/cert/Certificate;
    .end local v3    # "entry":Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$StoreEntry;
    :cond_3f
    const/4 v4, 0x0

    goto :goto_2a
.end method

.method public engineGetCertificateChain(Ljava/lang/String;)[Ljava/security/cert/Certificate;
    .registers 4
    .param p1, "alias"    # Ljava/lang/String;

    .prologue
    .line 576
    iget-object v1, p0, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;->table:Ljava/util/Hashtable;

    invoke-virtual {v1, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$StoreEntry;

    .line 578
    .local v0, "entry":Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$StoreEntry;
    if-eqz v0, :cond_f

    .line 580
    invoke-virtual {v0}, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$StoreEntry;->getCertificateChain()[Ljava/security/cert/Certificate;

    move-result-object v1

    .line 583
    :goto_e
    return-object v1

    :cond_f
    const/4 v1, 0x0

    goto :goto_e
.end method

.method public engineGetCreationDate(Ljava/lang/String;)Ljava/util/Date;
    .registers 4
    .param p1, "alias"    # Ljava/lang/String;

    .prologue
    .line 588
    iget-object v1, p0, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;->table:Ljava/util/Hashtable;

    invoke-virtual {v1, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$StoreEntry;

    .line 590
    .local v0, "entry":Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$StoreEntry;
    if-eqz v0, :cond_f

    .line 592
    invoke-virtual {v0}, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$StoreEntry;->getDate()Ljava/util/Date;

    move-result-object v1

    .line 595
    :goto_e
    return-object v1

    :cond_f
    const/4 v1, 0x0

    goto :goto_e
.end method

.method public engineGetKey(Ljava/lang/String;[C)Ljava/security/Key;
    .registers 6
    .param p1, "alias"    # Ljava/lang/String;
    .param p2, "password"    # [C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/UnrecoverableKeyException;
        }
    .end annotation

    .prologue
    .line 603
    iget-object v1, p0, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;->table:Ljava/util/Hashtable;

    invoke-virtual {v1, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$StoreEntry;

    .line 605
    .local v0, "entry":Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$StoreEntry;
    if-eqz v0, :cond_11

    invoke-virtual {v0}, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$StoreEntry;->getType()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_13

    .line 607
    :cond_11
    const/4 v1, 0x0

    .line 610
    :goto_12
    return-object v1

    :cond_13
    invoke-virtual {v0, p2}, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$StoreEntry;->getObject([C)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/security/Key;

    goto :goto_12
.end method

.method public engineIsCertificateEntry(Ljava/lang/String;)Z
    .registers 5
    .param p1, "alias"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x1

    .line 616
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;->table:Ljava/util/Hashtable;

    invoke-virtual {v2, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$StoreEntry;

    .line 618
    .local v0, "entry":Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$StoreEntry;
    if-eqz v0, :cond_12

    invoke-virtual {v0}, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$StoreEntry;->getType()I

    move-result v2

    if-ne v2, v1, :cond_12

    .line 623
    :goto_11
    return v1

    :cond_12
    const/4 v1, 0x0

    goto :goto_11
.end method

.method public engineIsKeyEntry(Ljava/lang/String;)Z
    .registers 5
    .param p1, "alias"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x1

    .line 629
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;->table:Ljava/util/Hashtable;

    invoke-virtual {v2, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$StoreEntry;

    .line 631
    .local v0, "entry":Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$StoreEntry;
    if-eqz v0, :cond_12

    invoke-virtual {v0}, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$StoreEntry;->getType()I

    move-result v2

    if-eq v2, v1, :cond_12

    .line 636
    :goto_11
    return v1

    :cond_12
    const/4 v1, 0x0

    goto :goto_11
.end method

.method public engineLoad(Ljava/io/InputStream;[C)V
    .registers 18
    .param p1, "stream"    # Ljava/io/InputStream;
    .param p2, "password"    # [C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 797
    iget-object v13, p0, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;->table:Ljava/util/Hashtable;

    invoke-virtual {v13}, Ljava/util/Hashtable;->clear()V

    .line 799
    if-nez p1, :cond_8

    .line 880
    :cond_7
    :goto_7
    return-void

    .line 804
    :cond_8
    new-instance v1, Ljava/io/DataInputStream;

    move-object/from16 v0, p1

    invoke-direct {v1, v0}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    .line 805
    .local v1, "dIn":Ljava/io/DataInputStream;
    invoke-virtual {v1}, Ljava/io/DataInputStream;->readInt()I

    move-result v12

    .line 807
    .local v12, "version":I
    const/4 v13, 0x2

    if-eq v12, v13, :cond_23

    .line 809
    if-eqz v12, :cond_23

    const/4 v13, 0x1

    if-eq v12, v13, :cond_23

    .line 811
    new-instance v13, Ljava/io/IOException;

    const-string v14, "Wrong version of key store."

    invoke-direct {v13, v14}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 815
    :cond_23
    invoke-virtual {v1}, Ljava/io/DataInputStream;->readInt()I

    move-result v11

    .line 816
    .local v11, "saltLength":I
    if-gtz v11, :cond_31

    .line 818
    new-instance v13, Ljava/io/IOException;

    const-string v14, "Invalid salt detected"

    invoke-direct {v13, v14}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 821
    :cond_31
    new-array v10, v11, [B

    .line 823
    .local v10, "salt":[B
    invoke-virtual {v1, v10}, Ljava/io/DataInputStream;->readFully([B)V

    .line 825
    invoke-virtual {v1}, Ljava/io/DataInputStream;->readInt()I

    move-result v3

    .line 830
    .local v3, "iterationCount":I
    new-instance v2, Lorg/spongycastle/crypto/macs/HMac;

    new-instance v13, Lorg/spongycastle/crypto/digests/SHA1Digest;

    invoke-direct {v13}, Lorg/spongycastle/crypto/digests/SHA1Digest;-><init>()V

    invoke-direct {v2, v13}, Lorg/spongycastle/crypto/macs/HMac;-><init>(Lorg/spongycastle/crypto/Digest;)V

    .line 831
    .local v2, "hMac":Lorg/spongycastle/crypto/macs/HMac;
    if-eqz p2, :cond_a7

    move-object/from16 v0, p2

    array-length v13, v0

    if-eqz v13, :cond_a7

    .line 833
    invoke-static/range {p2 .. p2}, Lorg/spongycastle/crypto/PBEParametersGenerator;->PKCS12PasswordToBytes([C)[B

    move-result-object v8

    .line 835
    .local v8, "passKey":[B
    new-instance v9, Lorg/spongycastle/crypto/generators/PKCS12ParametersGenerator;

    new-instance v13, Lorg/spongycastle/crypto/digests/SHA1Digest;

    invoke-direct {v13}, Lorg/spongycastle/crypto/digests/SHA1Digest;-><init>()V

    invoke-direct {v9, v13}, Lorg/spongycastle/crypto/generators/PKCS12ParametersGenerator;-><init>(Lorg/spongycastle/crypto/Digest;)V

    .line 836
    .local v9, "pbeGen":Lorg/spongycastle/crypto/PBEParametersGenerator;
    invoke-virtual {v9, v8, v10, v3}, Lorg/spongycastle/crypto/PBEParametersGenerator;->init([B[BI)V

    .line 840
    const/4 v13, 0x2

    if-eq v12, v13, :cond_9c

    .line 842
    invoke-virtual {v2}, Lorg/spongycastle/crypto/macs/HMac;->getMacSize()I

    move-result v13

    invoke-virtual {v9, v13}, Lorg/spongycastle/crypto/PBEParametersGenerator;->generateDerivedMacParameters(I)Lorg/spongycastle/crypto/CipherParameters;

    move-result-object v6

    .line 849
    .local v6, "macParams":Lorg/spongycastle/crypto/CipherParameters;
    :goto_67
    const/4 v13, 0x0

    invoke-static {v8, v13}, Lorg/spongycastle/util/Arrays;->fill([BB)V

    .line 851
    invoke-virtual {v2, v6}, Lorg/spongycastle/crypto/macs/HMac;->init(Lorg/spongycastle/crypto/CipherParameters;)V

    .line 852
    new-instance v4, Lorg/spongycastle/crypto/io/MacInputStream;

    invoke-direct {v4, v1, v2}, Lorg/spongycastle/crypto/io/MacInputStream;-><init>(Ljava/io/InputStream;Lorg/spongycastle/crypto/Mac;)V

    .line 854
    .local v4, "mIn":Lorg/spongycastle/crypto/io/MacInputStream;
    invoke-virtual {p0, v4}, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;->loadStore(Ljava/io/InputStream;)V

    .line 857
    invoke-virtual {v2}, Lorg/spongycastle/crypto/macs/HMac;->getMacSize()I

    move-result v13

    new-array v5, v13, [B

    .line 858
    .local v5, "mac":[B
    const/4 v13, 0x0

    invoke-virtual {v2, v5, v13}, Lorg/spongycastle/crypto/macs/HMac;->doFinal([BI)I

    .line 862
    invoke-virtual {v2}, Lorg/spongycastle/crypto/macs/HMac;->getMacSize()I

    move-result v13

    new-array v7, v13, [B

    .line 863
    .local v7, "oldMac":[B
    invoke-virtual {v1, v7}, Ljava/io/DataInputStream;->readFully([B)V

    .line 865
    invoke-static {v5, v7}, Lorg/spongycastle/util/Arrays;->constantTimeAreEqual([B[B)Z

    move-result v13

    if-nez v13, :cond_7

    .line 867
    iget-object v13, p0, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;->table:Ljava/util/Hashtable;

    invoke-virtual {v13}, Ljava/util/Hashtable;->clear()V

    .line 868
    new-instance v13, Ljava/io/IOException;

    const-string v14, "KeyStore integrity check failed."

    invoke-direct {v13, v14}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 846
    .end local v4    # "mIn":Lorg/spongycastle/crypto/io/MacInputStream;
    .end local v5    # "mac":[B
    .end local v6    # "macParams":Lorg/spongycastle/crypto/CipherParameters;
    .end local v7    # "oldMac":[B
    :cond_9c
    invoke-virtual {v2}, Lorg/spongycastle/crypto/macs/HMac;->getMacSize()I

    move-result v13

    mul-int/lit8 v13, v13, 0x8

    invoke-virtual {v9, v13}, Lorg/spongycastle/crypto/PBEParametersGenerator;->generateDerivedMacParameters(I)Lorg/spongycastle/crypto/CipherParameters;

    move-result-object v6

    .restart local v6    # "macParams":Lorg/spongycastle/crypto/CipherParameters;
    goto :goto_67

    .line 873
    .end local v6    # "macParams":Lorg/spongycastle/crypto/CipherParameters;
    .end local v8    # "passKey":[B
    .end local v9    # "pbeGen":Lorg/spongycastle/crypto/PBEParametersGenerator;
    :cond_a7
    invoke-virtual {p0, v1}, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;->loadStore(Ljava/io/InputStream;)V

    .line 877
    invoke-virtual {v2}, Lorg/spongycastle/crypto/macs/HMac;->getMacSize()I

    move-result v13

    new-array v7, v13, [B

    .line 878
    .restart local v7    # "oldMac":[B
    invoke-virtual {v1, v7}, Ljava/io/DataInputStream;->readFully([B)V

    goto/16 :goto_7
.end method

.method public engineSetCertificateEntry(Ljava/lang/String;Ljava/security/cert/Certificate;)V
    .registers 7
    .param p1, "alias"    # Ljava/lang/String;
    .param p2, "cert"    # Ljava/security/cert/Certificate;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/KeyStoreException;
        }
    .end annotation

    .prologue
    .line 644
    iget-object v1, p0, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;->table:Ljava/util/Hashtable;

    invoke-virtual {v1, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$StoreEntry;

    .line 646
    .local v0, "entry":Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$StoreEntry;
    if-eqz v0, :cond_2a

    invoke-virtual {v0}, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$StoreEntry;->getType()I

    move-result v1

    const/4 v2, 0x1

    if-eq v1, v2, :cond_2a

    .line 648
    new-instance v1, Ljava/security/KeyStoreException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "key store already has a key entry with alias "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/security/KeyStoreException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 651
    :cond_2a
    iget-object v1, p0, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;->table:Ljava/util/Hashtable;

    new-instance v2, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$StoreEntry;

    invoke-direct {v2, p0, p1, p2}, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$StoreEntry;-><init>(Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;Ljava/lang/String;Ljava/security/cert/Certificate;)V

    invoke-virtual {v1, p1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 652
    return-void
.end method

.method public engineSetKeyEntry(Ljava/lang/String;Ljava/security/Key;[C[Ljava/security/cert/Certificate;)V
    .registers 13
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
    .line 670
    instance-of v0, p2, Ljava/security/PrivateKey;

    if-eqz v0, :cond_e

    if-nez p4, :cond_e

    .line 672
    new-instance v0, Ljava/security/KeyStoreException;

    const-string v1, "no certificate chain for private key"

    invoke-direct {v0, v1}, Ljava/security/KeyStoreException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 677
    :cond_e
    :try_start_e
    iget-object v7, p0, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;->table:Ljava/util/Hashtable;

    new-instance v0, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$StoreEntry;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$StoreEntry;-><init>(Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;Ljava/lang/String;Ljava/security/Key;[C[Ljava/security/cert/Certificate;)V

    invoke-virtual {v7, p1, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1d
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_1d} :catch_1e

    .line 683
    return-void

    .line 679
    :catch_1e
    move-exception v6

    .line 681
    .local v6, "e":Ljava/lang/Exception;
    new-instance v0, Ljava/security/KeyStoreException;

    invoke-virtual {v6}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/security/KeyStoreException;-><init>(Ljava/lang/String;)V

    throw v0
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
    .line 660
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;->table:Ljava/util/Hashtable;

    new-instance v1, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$StoreEntry;

    invoke-direct {v1, p0, p1, p2, p3}, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$StoreEntry;-><init>(Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;Ljava/lang/String;[B[Ljava/security/cert/Certificate;)V

    invoke-virtual {v0, p1, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 661
    return-void
.end method

.method public engineSize()I
    .registers 2

    .prologue
    .line 687
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;->table:Ljava/util/Hashtable;

    invoke-virtual {v0}, Ljava/util/Hashtable;->size()I

    move-result v0

    return v0
.end method

.method public engineStore(Ljava/io/OutputStream;[C)V
    .registers 15
    .param p1, "stream"    # Ljava/io/OutputStream;
    .param p2, "password"    # [C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x0

    .line 886
    new-instance v0, Ljava/io/DataOutputStream;

    invoke-direct {v0, p1}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 887
    .local v0, "dOut":Ljava/io/DataOutputStream;
    const/16 v9, 0x14

    new-array v8, v9, [B

    .line 888
    .local v8, "salt":[B
    iget-object v9, p0, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;->random:Ljava/security/SecureRandom;

    invoke-virtual {v9}, Ljava/security/SecureRandom;->nextInt()I

    move-result v9

    and-int/lit16 v9, v9, 0x3ff

    add-int/lit16 v3, v9, 0x400

    .line 890
    .local v3, "iterationCount":I
    iget-object v9, p0, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;->random:Ljava/security/SecureRandom;

    invoke-virtual {v9, v8}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 892
    iget v9, p0, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;->version:I

    invoke-virtual {v0, v9}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 893
    array-length v9, v8

    invoke-virtual {v0, v9}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 894
    invoke-virtual {v0, v8}, Ljava/io/DataOutputStream;->write([B)V

    .line 895
    invoke-virtual {v0, v3}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 897
    new-instance v1, Lorg/spongycastle/crypto/macs/HMac;

    new-instance v9, Lorg/spongycastle/crypto/digests/SHA1Digest;

    invoke-direct {v9}, Lorg/spongycastle/crypto/digests/SHA1Digest;-><init>()V

    invoke-direct {v1, v9}, Lorg/spongycastle/crypto/macs/HMac;-><init>(Lorg/spongycastle/crypto/Digest;)V

    .line 898
    .local v1, "hMac":Lorg/spongycastle/crypto/macs/HMac;
    new-instance v4, Lorg/spongycastle/crypto/io/MacOutputStream;

    invoke-direct {v4, v1}, Lorg/spongycastle/crypto/io/MacOutputStream;-><init>(Lorg/spongycastle/crypto/Mac;)V

    .line 899
    .local v4, "mOut":Lorg/spongycastle/crypto/io/MacOutputStream;
    new-instance v7, Lorg/spongycastle/crypto/generators/PKCS12ParametersGenerator;

    new-instance v9, Lorg/spongycastle/crypto/digests/SHA1Digest;

    invoke-direct {v9}, Lorg/spongycastle/crypto/digests/SHA1Digest;-><init>()V

    invoke-direct {v7, v9}, Lorg/spongycastle/crypto/generators/PKCS12ParametersGenerator;-><init>(Lorg/spongycastle/crypto/Digest;)V

    .line 900
    .local v7, "pbeGen":Lorg/spongycastle/crypto/PBEParametersGenerator;
    invoke-static {p2}, Lorg/spongycastle/crypto/PBEParametersGenerator;->PKCS12PasswordToBytes([C)[B

    move-result-object v6

    .line 902
    .local v6, "passKey":[B
    invoke-virtual {v7, v6, v8, v3}, Lorg/spongycastle/crypto/PBEParametersGenerator;->init([B[BI)V

    .line 904
    iget v9, p0, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;->version:I

    const/4 v10, 0x2

    if-ge v9, v10, :cond_61

    .line 906
    invoke-virtual {v1}, Lorg/spongycastle/crypto/macs/HMac;->getMacSize()I

    move-result v9

    invoke-virtual {v7, v9}, Lorg/spongycastle/crypto/PBEParametersGenerator;->generateDerivedMacParameters(I)Lorg/spongycastle/crypto/CipherParameters;

    move-result-object v9

    invoke-virtual {v1, v9}, Lorg/spongycastle/crypto/macs/HMac;->init(Lorg/spongycastle/crypto/CipherParameters;)V

    .line 913
    :goto_58
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_59
    array-length v9, v6

    if-eq v2, v9, :cond_6f

    .line 915
    aput-byte v11, v6, v2

    .line 913
    add-int/lit8 v2, v2, 0x1

    goto :goto_59

    .line 910
    .end local v2    # "i":I
    :cond_61
    invoke-virtual {v1}, Lorg/spongycastle/crypto/macs/HMac;->getMacSize()I

    move-result v9

    mul-int/lit8 v9, v9, 0x8

    invoke-virtual {v7, v9}, Lorg/spongycastle/crypto/PBEParametersGenerator;->generateDerivedMacParameters(I)Lorg/spongycastle/crypto/CipherParameters;

    move-result-object v9

    invoke-virtual {v1, v9}, Lorg/spongycastle/crypto/macs/HMac;->init(Lorg/spongycastle/crypto/CipherParameters;)V

    goto :goto_58

    .line 918
    .restart local v2    # "i":I
    :cond_6f
    new-instance v9, Lorg/spongycastle/util/io/TeeOutputStream;

    invoke-direct {v9, v0, v4}, Lorg/spongycastle/util/io/TeeOutputStream;-><init>(Ljava/io/OutputStream;Ljava/io/OutputStream;)V

    invoke-virtual {p0, v9}, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;->saveStore(Ljava/io/OutputStream;)V

    .line 920
    invoke-virtual {v1}, Lorg/spongycastle/crypto/macs/HMac;->getMacSize()I

    move-result v9

    new-array v5, v9, [B

    .line 922
    .local v5, "mac":[B
    invoke-virtual {v1, v5, v11}, Lorg/spongycastle/crypto/macs/HMac;->doFinal([BI)I

    .line 924
    invoke-virtual {v0, v5}, Ljava/io/DataOutputStream;->write([B)V

    .line 926
    invoke-virtual {v0}, Ljava/io/DataOutputStream;->close()V

    .line 927
    return-void
.end method

.method protected loadStore(Ljava/io/InputStream;)V
    .registers 27
    .param p1, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 694
    new-instance v23, Ljava/io/DataInputStream;

    move-object/from16 v0, v23

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    .line 695
    .local v23, "dIn":Ljava/io/DataInputStream;
    invoke-virtual/range {v23 .. v23}, Ljava/io/DataInputStream;->read()I

    move-result v19

    .line 697
    .local v19, "type":I
    :goto_d
    if-lez v19, :cond_a1

    .line 699
    invoke-virtual/range {v23 .. v23}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    move-result-object v4

    .line 700
    .local v4, "alias":Ljava/lang/String;
    new-instance v5, Ljava/util/Date;

    invoke-virtual/range {v23 .. v23}, Ljava/io/DataInputStream;->readLong()J

    move-result-wide v2

    invoke-direct {v5, v2, v3}, Ljava/util/Date;-><init>(J)V

    .line 701
    .local v5, "date":Ljava/util/Date;
    invoke-virtual/range {v23 .. v23}, Ljava/io/DataInputStream;->readInt()I

    move-result v22

    .line 702
    .local v22, "chainLength":I
    const/4 v14, 0x0

    .line 704
    .local v14, "chain":[Ljava/security/cert/Certificate;
    if-eqz v22, :cond_3c

    .line 706
    move/from16 v0, v22

    new-array v14, v0, [Ljava/security/cert/Certificate;

    .line 708
    const/16 v24, 0x0

    .local v24, "i":I
    :goto_29
    move/from16 v0, v24

    move/from16 v1, v22

    if-eq v0, v1, :cond_3c

    .line 710
    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-direct {v0, v1}, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;->decodeCertificate(Ljava/io/DataInputStream;)Ljava/security/cert/Certificate;

    move-result-object v2

    aput-object v2, v14, v24

    .line 708
    add-int/lit8 v24, v24, 0x1

    goto :goto_29

    .line 714
    .end local v24    # "i":I
    :cond_3c
    packed-switch v19, :pswitch_data_a2

    .line 733
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "Unknown object type in store."

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 717
    :pswitch_47
    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-direct {v0, v1}, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;->decodeCertificate(Ljava/io/DataInputStream;)Ljava/security/cert/Certificate;

    move-result-object v7

    .line 719
    .local v7, "cert":Ljava/security/cert/Certificate;
    move-object/from16 v0, p0

    iget-object v8, v0, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;->table:Ljava/util/Hashtable;

    new-instance v2, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$StoreEntry;

    const/4 v6, 0x1

    move-object/from16 v3, p0

    invoke-direct/range {v2 .. v7}, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$StoreEntry;-><init>(Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;Ljava/lang/String;Ljava/util/Date;ILjava/lang/Object;)V

    invoke-virtual {v8, v4, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 736
    .end local v7    # "cert":Ljava/security/cert/Certificate;
    :goto_5e
    invoke-virtual/range {v23 .. v23}, Ljava/io/DataInputStream;->read()I

    move-result v19

    .line 737
    goto :goto_d

    .line 722
    :pswitch_63
    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-direct {v0, v1}, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;->decodeKey(Ljava/io/DataInputStream;)Ljava/security/Key;

    move-result-object v13

    .line 723
    .local v13, "key":Ljava/security/Key;
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;->table:Ljava/util/Hashtable;

    new-instance v8, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$StoreEntry;

    const/4 v12, 0x2

    move-object/from16 v9, p0

    move-object v10, v4

    move-object v11, v5

    invoke-direct/range {v8 .. v14}, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$StoreEntry;-><init>(Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;Ljava/lang/String;Ljava/util/Date;ILjava/lang/Object;[Ljava/security/cert/Certificate;)V

    invoke-virtual {v2, v4, v8}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_5e

    .line 727
    .end local v13    # "key":Ljava/security/Key;
    :pswitch_7d
    invoke-virtual/range {v23 .. v23}, Ljava/io/DataInputStream;->readInt()I

    move-result v2

    new-array v0, v2, [B

    move-object/from16 v20, v0

    .line 729
    .local v20, "b":[B
    move-object/from16 v0, v23

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/io/DataInputStream;->readFully([B)V

    .line 730
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;->table:Ljava/util/Hashtable;

    new-instance v15, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$StoreEntry;

    move-object/from16 v16, p0

    move-object/from16 v17, v4

    move-object/from16 v18, v5

    move-object/from16 v21, v14

    invoke-direct/range {v15 .. v21}, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$StoreEntry;-><init>(Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;Ljava/lang/String;Ljava/util/Date;ILjava/lang/Object;[Ljava/security/cert/Certificate;)V

    invoke-virtual {v2, v4, v15}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_5e

    .line 738
    .end local v4    # "alias":Ljava/lang/String;
    .end local v5    # "date":Ljava/util/Date;
    .end local v14    # "chain":[Ljava/security/cert/Certificate;
    .end local v20    # "b":[B
    .end local v22    # "chainLength":I
    :cond_a1
    return-void

    .line 714
    :pswitch_data_a2
    .packed-switch 0x1
        :pswitch_47
        :pswitch_63
        :pswitch_7d
        :pswitch_7d
    .end packed-switch
.end method

.method protected makePBECipher(Ljava/lang/String;I[C[BI)Ljavax/crypto/Cipher;
    .registers 14
    .param p1, "algorithm"    # Ljava/lang/String;
    .param p2, "mode"    # I
    .param p3, "password"    # [C
    .param p4, "salt"    # [B
    .param p5, "iterationCount"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 470
    :try_start_0
    new-instance v4, Ljavax/crypto/spec/PBEKeySpec;

    invoke-direct {v4, p3}, Ljavax/crypto/spec/PBEKeySpec;-><init>([C)V

    .line 471
    .local v4, "pbeSpec":Ljavax/crypto/spec/PBEKeySpec;
    iget-object v5, p0, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;->helper:Lorg/spongycastle/jcajce/util/JcaJceHelper;

    invoke-interface {v5, p1}, Lorg/spongycastle/jcajce/util/JcaJceHelper;->createSecretKeyFactory(Ljava/lang/String;)Ljavax/crypto/SecretKeyFactory;

    move-result-object v3

    .line 472
    .local v3, "keyFact":Ljavax/crypto/SecretKeyFactory;
    new-instance v1, Ljavax/crypto/spec/PBEParameterSpec;

    invoke-direct {v1, p4, p5}, Ljavax/crypto/spec/PBEParameterSpec;-><init>([BI)V

    .line 474
    .local v1, "defParams":Ljavax/crypto/spec/PBEParameterSpec;
    iget-object v5, p0, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;->helper:Lorg/spongycastle/jcajce/util/JcaJceHelper;

    invoke-interface {v5, p1}, Lorg/spongycastle/jcajce/util/JcaJceHelper;->createCipher(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v0

    .line 476
    .local v0, "cipher":Ljavax/crypto/Cipher;
    invoke-virtual {v3, v4}, Ljavax/crypto/SecretKeyFactory;->generateSecret(Ljava/security/spec/KeySpec;)Ljavax/crypto/SecretKey;

    move-result-object v5

    invoke-virtual {v0, p2, v5, v1}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V
    :try_end_1d
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_1d} :catch_1e

    .line 478
    return-object v0

    .line 480
    .end local v0    # "cipher":Ljavax/crypto/Cipher;
    .end local v1    # "defParams":Ljavax/crypto/spec/PBEParameterSpec;
    .end local v3    # "keyFact":Ljavax/crypto/SecretKeyFactory;
    .end local v4    # "pbeSpec":Ljavax/crypto/spec/PBEKeySpec;
    :catch_1e
    move-exception v2

    .line 482
    .local v2, "e":Ljava/lang/Exception;
    new-instance v5, Ljava/io/IOException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Error initialising store of key store: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5
.end method

.method protected saveStore(Ljava/io/OutputStream;)V
    .registers 11
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    .line 744
    iget-object v6, p0, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;->table:Ljava/util/Hashtable;

    invoke-virtual {v6}, Ljava/util/Hashtable;->elements()Ljava/util/Enumeration;

    move-result-object v3

    .line 745
    .local v3, "e":Ljava/util/Enumeration;
    new-instance v2, Ljava/io/DataOutputStream;

    invoke-direct {v2, p1}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 747
    .local v2, "dOut":Ljava/io/DataOutputStream;
    :goto_c
    invoke-interface {v3}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v6

    if-eqz v6, :cond_7e

    .line 749
    invoke-interface {v3}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$StoreEntry;

    .line 751
    .local v4, "entry":Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$StoreEntry;
    invoke-virtual {v4}, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$StoreEntry;->getType()I

    move-result v6

    invoke-virtual {v2, v6}, Ljava/io/DataOutputStream;->write(I)V

    .line 752
    invoke-virtual {v4}, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$StoreEntry;->getAlias()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 753
    invoke-virtual {v4}, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$StoreEntry;->getDate()Ljava/util/Date;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/Date;->getTime()J

    move-result-wide v6

    invoke-virtual {v2, v6, v7}, Ljava/io/DataOutputStream;->writeLong(J)V

    .line 755
    invoke-virtual {v4}, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$StoreEntry;->getCertificateChain()[Ljava/security/cert/Certificate;

    move-result-object v1

    .line 756
    .local v1, "chain":[Ljava/security/cert/Certificate;
    if-nez v1, :cond_49

    .line 758
    invoke-virtual {v2, v8}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 769
    :cond_3a
    invoke-virtual {v4}, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$StoreEntry;->getType()I

    move-result v6

    packed-switch v6, :pswitch_data_82

    .line 785
    new-instance v6, Ljava/lang/RuntimeException;

    const-string v7, "Unknown object type in store."

    invoke-direct {v6, v7}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 762
    :cond_49
    array-length v6, v1

    invoke-virtual {v2, v6}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 763
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_4e
    array-length v6, v1

    if-eq v5, v6, :cond_3a

    .line 765
    aget-object v6, v1, v5

    invoke-direct {p0, v6, v2}, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;->encodeCertificate(Ljava/security/cert/Certificate;Ljava/io/DataOutputStream;)V

    .line 763
    add-int/lit8 v5, v5, 0x1

    goto :goto_4e

    .line 772
    .end local v5    # "i":I
    :pswitch_59
    invoke-virtual {v4}, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$StoreEntry;->getObject()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/security/cert/Certificate;

    invoke-direct {p0, v6, v2}, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;->encodeCertificate(Ljava/security/cert/Certificate;Ljava/io/DataOutputStream;)V

    goto :goto_c

    .line 775
    :pswitch_63
    invoke-virtual {v4}, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$StoreEntry;->getObject()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/security/Key;

    invoke-direct {p0, v6, v2}, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;->encodeKey(Ljava/security/Key;Ljava/io/DataOutputStream;)V

    goto :goto_c

    .line 779
    :pswitch_6d
    invoke-virtual {v4}, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$StoreEntry;->getObject()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [B

    move-object v0, v6

    check-cast v0, [B

    .line 781
    .local v0, "b":[B
    array-length v6, v0

    invoke-virtual {v2, v6}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 782
    invoke-virtual {v2, v0}, Ljava/io/DataOutputStream;->write([B)V

    goto :goto_c

    .line 789
    .end local v0    # "b":[B
    .end local v1    # "chain":[Ljava/security/cert/Certificate;
    .end local v4    # "entry":Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi$StoreEntry;
    :cond_7e
    invoke-virtual {v2, v8}, Ljava/io/DataOutputStream;->write(I)V

    .line 790
    return-void

    .line 769
    :pswitch_data_82
    .packed-switch 0x1
        :pswitch_59
        :pswitch_63
        :pswitch_6d
        :pswitch_6d
    .end packed-switch
.end method

.method public setRandom(Ljava/security/SecureRandom;)V
    .registers 2
    .param p1, "rand"    # Ljava/security/SecureRandom;

    .prologue
    .line 489
    iput-object p1, p0, Lorg/spongycastle/jcajce/provider/keystore/bc/BcKeyStoreSpi;->random:Ljava/security/SecureRandom;

    .line 490
    return-void
.end method
