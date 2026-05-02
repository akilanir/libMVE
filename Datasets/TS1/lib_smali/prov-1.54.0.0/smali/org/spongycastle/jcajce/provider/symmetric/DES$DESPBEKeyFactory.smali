.class public Lorg/spongycastle/jcajce/provider/symmetric/DES$DESPBEKeyFactory;
.super Lorg/spongycastle/jcajce/provider/symmetric/util/BaseSecretKeyFactory;
.source "DES.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/spongycastle/jcajce/provider/symmetric/DES;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DESPBEKeyFactory"
.end annotation


# instance fields
.field private digest:I

.field private forCipher:Z

.field private ivSize:I

.field private keySize:I

.field private scheme:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;ZIIII)V
    .registers 8
    .param p1, "algorithm"    # Ljava/lang/String;
    .param p2, "oid"    # Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .param p3, "forCipher"    # Z
    .param p4, "scheme"    # I
    .param p5, "digest"    # I
    .param p6, "keySize"    # I
    .param p7, "ivSize"    # I

    .prologue
    .line 302
    invoke-direct {p0, p1, p2}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseSecretKeyFactory;-><init>(Ljava/lang/String;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V

    .line 304
    iput-boolean p3, p0, Lorg/spongycastle/jcajce/provider/symmetric/DES$DESPBEKeyFactory;->forCipher:Z

    .line 305
    iput p4, p0, Lorg/spongycastle/jcajce/provider/symmetric/DES$DESPBEKeyFactory;->scheme:I

    .line 306
    iput p5, p0, Lorg/spongycastle/jcajce/provider/symmetric/DES$DESPBEKeyFactory;->digest:I

    .line 307
    iput p6, p0, Lorg/spongycastle/jcajce/provider/symmetric/DES$DESPBEKeyFactory;->keySize:I

    .line 308
    iput p7, p0, Lorg/spongycastle/jcajce/provider/symmetric/DES$DESPBEKeyFactory;->ivSize:I

    .line 309
    return-void
.end method


# virtual methods
.method protected engineGenerateSecret(Ljava/security/spec/KeySpec;)Ljavax/crypto/SecretKey;
    .registers 12
    .param p1, "keySpec"    # Ljava/security/spec/KeySpec;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/spec/InvalidKeySpecException;
        }
    .end annotation

    .prologue
    .line 315
    instance-of v0, p1, Ljavax/crypto/spec/PBEKeySpec;

    if-eqz v0, :cond_65

    move-object v7, p1

    .line 317
    check-cast v7, Ljavax/crypto/spec/PBEKeySpec;

    .line 320
    .local v7, "pbeSpec":Ljavax/crypto/spec/PBEKeySpec;
    invoke-virtual {v7}, Ljavax/crypto/spec/PBEKeySpec;->getSalt()[B

    move-result-object v0

    if-nez v0, :cond_20

    .line 322
    new-instance v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BCPBEKey;

    iget-object v1, p0, Lorg/spongycastle/jcajce/provider/symmetric/DES$DESPBEKeyFactory;->algName:Ljava/lang/String;

    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/DES$DESPBEKeyFactory;->algOid:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    iget v3, p0, Lorg/spongycastle/jcajce/provider/symmetric/DES$DESPBEKeyFactory;->scheme:I

    iget v4, p0, Lorg/spongycastle/jcajce/provider/symmetric/DES$DESPBEKeyFactory;->digest:I

    iget v5, p0, Lorg/spongycastle/jcajce/provider/symmetric/DES$DESPBEKeyFactory;->keySize:I

    iget v6, p0, Lorg/spongycastle/jcajce/provider/symmetric/DES$DESPBEKeyFactory;->ivSize:I

    const/4 v8, 0x0

    invoke-direct/range {v0 .. v8}, Lorg/spongycastle/jcajce/provider/symmetric/util/BCPBEKey;-><init>(Ljava/lang/String;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;IIIILjavax/crypto/spec/PBEKeySpec;Lorg/spongycastle/crypto/CipherParameters;)V

    .line 346
    :goto_1f
    return-object v0

    .line 325
    :cond_20
    iget-boolean v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/DES$DESPBEKeyFactory;->forCipher:Z

    if-eqz v0, :cond_56

    .line 327
    iget v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/DES$DESPBEKeyFactory;->scheme:I

    iget v1, p0, Lorg/spongycastle/jcajce/provider/symmetric/DES$DESPBEKeyFactory;->digest:I

    iget v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/DES$DESPBEKeyFactory;->keySize:I

    iget v3, p0, Lorg/spongycastle/jcajce/provider/symmetric/DES$DESPBEKeyFactory;->ivSize:I

    invoke-static {v7, v0, v1, v2, v3}, Lorg/spongycastle/jcajce/provider/symmetric/util/PBE$Util;->makePBEParameters(Ljavax/crypto/spec/PBEKeySpec;IIII)Lorg/spongycastle/crypto/CipherParameters;

    move-result-object v8

    .line 335
    .local v8, "param":Lorg/spongycastle/crypto/CipherParameters;
    :goto_30
    instance-of v0, v8, Lorg/spongycastle/crypto/params/ParametersWithIV;

    if-eqz v0, :cond_61

    move-object v0, v8

    .line 337
    check-cast v0, Lorg/spongycastle/crypto/params/ParametersWithIV;

    invoke-virtual {v0}, Lorg/spongycastle/crypto/params/ParametersWithIV;->getParameters()Lorg/spongycastle/crypto/CipherParameters;

    move-result-object v9

    check-cast v9, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 344
    .local v9, "kParam":Lorg/spongycastle/crypto/params/KeyParameter;
    :goto_3d
    invoke-virtual {v9}, Lorg/spongycastle/crypto/params/KeyParameter;->getKey()[B

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/crypto/params/DESParameters;->setOddParity([B)V

    .line 346
    new-instance v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BCPBEKey;

    iget-object v1, p0, Lorg/spongycastle/jcajce/provider/symmetric/DES$DESPBEKeyFactory;->algName:Ljava/lang/String;

    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/DES$DESPBEKeyFactory;->algOid:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    iget v3, p0, Lorg/spongycastle/jcajce/provider/symmetric/DES$DESPBEKeyFactory;->scheme:I

    iget v4, p0, Lorg/spongycastle/jcajce/provider/symmetric/DES$DESPBEKeyFactory;->digest:I

    iget v5, p0, Lorg/spongycastle/jcajce/provider/symmetric/DES$DESPBEKeyFactory;->keySize:I

    iget v6, p0, Lorg/spongycastle/jcajce/provider/symmetric/DES$DESPBEKeyFactory;->ivSize:I

    invoke-direct/range {v0 .. v8}, Lorg/spongycastle/jcajce/provider/symmetric/util/BCPBEKey;-><init>(Ljava/lang/String;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;IIIILjavax/crypto/spec/PBEKeySpec;Lorg/spongycastle/crypto/CipherParameters;)V

    goto :goto_1f

    .line 331
    .end local v8    # "param":Lorg/spongycastle/crypto/CipherParameters;
    .end local v9    # "kParam":Lorg/spongycastle/crypto/params/KeyParameter;
    :cond_56
    iget v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/DES$DESPBEKeyFactory;->scheme:I

    iget v1, p0, Lorg/spongycastle/jcajce/provider/symmetric/DES$DESPBEKeyFactory;->digest:I

    iget v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/DES$DESPBEKeyFactory;->keySize:I

    invoke-static {v7, v0, v1, v2}, Lorg/spongycastle/jcajce/provider/symmetric/util/PBE$Util;->makePBEMacParameters(Ljavax/crypto/spec/PBEKeySpec;III)Lorg/spongycastle/crypto/CipherParameters;

    move-result-object v8

    .restart local v8    # "param":Lorg/spongycastle/crypto/CipherParameters;
    goto :goto_30

    :cond_61
    move-object v9, v8

    .line 341
    check-cast v9, Lorg/spongycastle/crypto/params/KeyParameter;

    .restart local v9    # "kParam":Lorg/spongycastle/crypto/params/KeyParameter;
    goto :goto_3d

    .line 349
    .end local v7    # "pbeSpec":Ljavax/crypto/spec/PBEKeySpec;
    .end local v8    # "param":Lorg/spongycastle/crypto/CipherParameters;
    .end local v9    # "kParam":Lorg/spongycastle/crypto/params/KeyParameter;
    :cond_65
    new-instance v0, Ljava/security/spec/InvalidKeySpecException;

    const-string v1, "Invalid KeySpec"

    invoke-direct {v0, v1}, Ljava/security/spec/InvalidKeySpecException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
