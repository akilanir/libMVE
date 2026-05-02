.class public Lorg/spongycastle/jcajce/provider/symmetric/DESede$KeyFactory;
.super Lorg/spongycastle/jcajce/provider/symmetric/util/BaseSecretKeyFactory;
.source "DESede.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/spongycastle/jcajce/provider/symmetric/DESede;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "KeyFactory"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 286
    const-string v0, "DESede"

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseSecretKeyFactory;-><init>(Ljava/lang/String;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V

    .line 287
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
    .line 340
    instance-of v1, p1, Ljavax/crypto/spec/DESedeKeySpec;

    if-eqz v1, :cond_13

    move-object v0, p1

    .line 342
    check-cast v0, Ljavax/crypto/spec/DESedeKeySpec;

    .line 343
    .local v0, "desKeySpec":Ljavax/crypto/spec/DESedeKeySpec;
    new-instance v1, Ljavax/crypto/spec/SecretKeySpec;

    invoke-virtual {v0}, Ljavax/crypto/spec/DESedeKeySpec;->getKey()[B

    move-result-object v2

    const-string v3, "DESede"

    invoke-direct {v1, v2, v3}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 346
    .end local v0    # "desKeySpec":Ljavax/crypto/spec/DESedeKeySpec;
    :goto_12
    return-object v1

    :cond_13
    invoke-super {p0, p1}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseSecretKeyFactory;->engineGenerateSecret(Ljava/security/spec/KeySpec;)Ljavax/crypto/SecretKey;

    move-result-object v1

    goto :goto_12
.end method

.method protected engineGetKeySpec(Ljavax/crypto/SecretKey;Ljava/lang/Class;)Ljava/security/spec/KeySpec;
    .registers 9
    .param p1, "key"    # Ljavax/crypto/SecretKey;
    .param p2, "keySpec"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/spec/InvalidKeySpecException;
        }
    .end annotation

    .prologue
    const/16 v4, 0x10

    .line 294
    if-nez p2, :cond_c

    .line 296
    new-instance v3, Ljava/security/spec/InvalidKeySpecException;

    const-string v4, "keySpec parameter is null"

    invoke-direct {v3, v4}, Ljava/security/spec/InvalidKeySpecException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 298
    :cond_c
    if-nez p1, :cond_16

    .line 300
    new-instance v3, Ljava/security/spec/InvalidKeySpecException;

    const-string v4, "key parameter is null"

    invoke-direct {v3, v4}, Ljava/security/spec/InvalidKeySpecException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 303
    :cond_16
    const-class v3, Ljavax/crypto/spec/SecretKeySpec;

    invoke-virtual {v3, p2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_2a

    .line 305
    new-instance v3, Ljavax/crypto/spec/SecretKeySpec;

    invoke-interface {p1}, Ljavax/crypto/SecretKey;->getEncoded()[B

    move-result-object v4

    iget-object v5, p0, Lorg/spongycastle/jcajce/provider/symmetric/DESede$KeyFactory;->algName:Ljava/lang/String;

    invoke-direct {v3, v4, v5}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 324
    :goto_29
    return-object v3

    .line 307
    :cond_2a
    const-class v3, Ljavax/crypto/spec/DESedeKeySpec;

    invoke-virtual {v3, p2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_63

    .line 309
    invoke-interface {p1}, Ljavax/crypto/SecretKey;->getEncoded()[B

    move-result-object v0

    .line 313
    .local v0, "bytes":[B
    :try_start_36
    array-length v3, v0

    if-ne v3, v4, :cond_5d

    .line 315
    const/16 v3, 0x18

    new-array v2, v3, [B

    .line 317
    .local v2, "longKey":[B
    const/4 v3, 0x0

    const/4 v4, 0x0

    const/16 v5, 0x10

    invoke-static {v0, v3, v2, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 318
    const/4 v3, 0x0

    const/16 v4, 0x10

    const/16 v5, 0x8

    invoke-static {v0, v3, v2, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 320
    new-instance v3, Ljavax/crypto/spec/DESedeKeySpec;

    invoke-direct {v3, v2}, Ljavax/crypto/spec/DESedeKeySpec;-><init>([B)V
    :try_end_51
    .catch Ljava/lang/Exception; {:try_start_36 .. :try_end_51} :catch_52

    goto :goto_29

    .line 327
    .end local v2    # "longKey":[B
    :catch_52
    move-exception v1

    .line 329
    .local v1, "e":Ljava/lang/Exception;
    new-instance v3, Ljava/security/spec/InvalidKeySpecException;

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/security/spec/InvalidKeySpecException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 324
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_5d
    :try_start_5d
    new-instance v3, Ljavax/crypto/spec/DESedeKeySpec;

    invoke-direct {v3, v0}, Ljavax/crypto/spec/DESedeKeySpec;-><init>([B)V
    :try_end_62
    .catch Ljava/lang/Exception; {:try_start_5d .. :try_end_62} :catch_52

    goto :goto_29

    .line 333
    .end local v0    # "bytes":[B
    :cond_63
    new-instance v3, Ljava/security/spec/InvalidKeySpecException;

    const-string v4, "Invalid KeySpec"

    invoke-direct {v3, v4}, Ljava/security/spec/InvalidKeySpecException;-><init>(Ljava/lang/String;)V

    throw v3
.end method
