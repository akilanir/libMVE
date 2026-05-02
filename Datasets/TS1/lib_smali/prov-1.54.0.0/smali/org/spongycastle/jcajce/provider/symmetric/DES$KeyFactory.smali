.class public Lorg/spongycastle/jcajce/provider/symmetric/DES$KeyFactory;
.super Lorg/spongycastle/jcajce/provider/symmetric/util/BaseSecretKeyFactory;
.source "DES.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/spongycastle/jcajce/provider/symmetric/DES;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "KeyFactory"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 232
    const-string v0, "DES"

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseSecretKeyFactory;-><init>(Ljava/lang/String;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V

    .line 233
    return-void
.end method


# virtual methods
.method protected engineGenerateSecret(Ljava/security/spec/KeySpec;)Ljavax/crypto/SecretKey;
    .registers 6
    .param p1, "keySpec"    # Ljava/security/spec/KeySpec;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/spec/InvalidKeySpecException;
        }
    .end annotation

    .prologue
    .line 274
    instance-of v1, p1, Ljavax/crypto/spec/DESKeySpec;

    if-eqz v1, :cond_13

    move-object v0, p1

    .line 276
    check-cast v0, Ljavax/crypto/spec/DESKeySpec;

    .line 277
    .local v0, "desKeySpec":Ljavax/crypto/spec/DESKeySpec;
    new-instance v1, Ljavax/crypto/spec/SecretKeySpec;

    invoke-virtual {v0}, Ljavax/crypto/spec/DESKeySpec;->getKey()[B

    move-result-object v2

    const-string v3, "DES"

    invoke-direct {v1, v2, v3}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 280
    .end local v0    # "desKeySpec":Ljavax/crypto/spec/DESKeySpec;
    :goto_12
    return-object v1

    :cond_13
    invoke-super {p0, p1}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseSecretKeyFactory;->engineGenerateSecret(Ljava/security/spec/KeySpec;)Ljavax/crypto/SecretKey;

    move-result-object v1

    goto :goto_12
.end method

.method protected engineGetKeySpec(Ljavax/crypto/SecretKey;Ljava/lang/Class;)Ljava/security/spec/KeySpec;
    .registers 8
    .param p1, "key"    # Ljavax/crypto/SecretKey;
    .param p2, "keySpec"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/spec/InvalidKeySpecException;
        }
    .end annotation

    .prologue
    .line 240
    if-nez p2, :cond_a

    .line 242
    new-instance v2, Ljava/security/spec/InvalidKeySpecException;

    const-string v3, "keySpec parameter is null"

    invoke-direct {v2, v3}, Ljava/security/spec/InvalidKeySpecException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 244
    :cond_a
    if-nez p1, :cond_14

    .line 246
    new-instance v2, Ljava/security/spec/InvalidKeySpecException;

    const-string v3, "key parameter is null"

    invoke-direct {v2, v3}, Ljava/security/spec/InvalidKeySpecException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 249
    :cond_14
    const-class v2, Ljavax/crypto/spec/SecretKeySpec;

    invoke-virtual {v2, p2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_28

    .line 251
    new-instance v2, Ljavax/crypto/spec/SecretKeySpec;

    invoke-interface {p1}, Ljavax/crypto/SecretKey;->getEncoded()[B

    move-result-object v3

    iget-object v4, p0, Lorg/spongycastle/jcajce/provider/symmetric/DES$KeyFactory;->algName:Ljava/lang/String;

    invoke-direct {v2, v3, v4}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 259
    :goto_27
    return-object v2

    .line 253
    :cond_28
    const-class v2, Ljavax/crypto/spec/DESKeySpec;

    invoke-virtual {v2, p2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_45

    .line 255
    invoke-interface {p1}, Ljavax/crypto/SecretKey;->getEncoded()[B

    move-result-object v0

    .line 259
    .local v0, "bytes":[B
    :try_start_34
    new-instance v2, Ljavax/crypto/spec/DESKeySpec;

    invoke-direct {v2, v0}, Ljavax/crypto/spec/DESKeySpec;-><init>([B)V
    :try_end_39
    .catch Ljava/lang/Exception; {:try_start_34 .. :try_end_39} :catch_3a

    goto :goto_27

    .line 261
    :catch_3a
    move-exception v1

    .line 263
    .local v1, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/security/spec/InvalidKeySpecException;

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/security/spec/InvalidKeySpecException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 267
    .end local v0    # "bytes":[B
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_45
    new-instance v2, Ljava/security/spec/InvalidKeySpecException;

    const-string v3, "Invalid KeySpec"

    invoke-direct {v2, v3}, Ljava/security/spec/InvalidKeySpecException;-><init>(Ljava/lang/String;)V

    throw v2
.end method
