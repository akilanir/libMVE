.class public Lorg/spongycastle/jcajce/provider/symmetric/DESede$KeyGenerator;
.super Lorg/spongycastle/jcajce/provider/symmetric/util/BaseKeyGenerator;
.source "DESede.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/spongycastle/jcajce/provider/symmetric/DESede;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "KeyGenerator"
.end annotation


# instance fields
.field private keySizeSet:Z


# direct methods
.method public constructor <init>()V
    .registers 4

    .prologue
    .line 145
    const-string v0, "DESede"

    const/16 v1, 0xc0

    new-instance v2, Lorg/spongycastle/crypto/generators/DESedeKeyGenerator;

    invoke-direct {v2}, Lorg/spongycastle/crypto/generators/DESedeKeyGenerator;-><init>()V

    invoke-direct {p0, v0, v1, v2}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseKeyGenerator;-><init>(Ljava/lang/String;ILorg/spongycastle/crypto/CipherKeyGenerator;)V

    .line 141
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/DESede$KeyGenerator;->keySizeSet:Z

    .line 146
    return-void
.end method


# virtual methods
.method protected engineGenerateKey()Ljavax/crypto/SecretKey;
    .registers 7

    .prologue
    const/4 v5, 0x0

    .line 158
    iget-boolean v1, p0, Lorg/spongycastle/jcajce/provider/symmetric/DESede$KeyGenerator;->uninitialised:Z

    if-eqz v1, :cond_18

    .line 160
    iget-object v1, p0, Lorg/spongycastle/jcajce/provider/symmetric/DESede$KeyGenerator;->engine:Lorg/spongycastle/crypto/CipherKeyGenerator;

    new-instance v2, Lorg/spongycastle/crypto/KeyGenerationParameters;

    new-instance v3, Ljava/security/SecureRandom;

    invoke-direct {v3}, Ljava/security/SecureRandom;-><init>()V

    iget v4, p0, Lorg/spongycastle/jcajce/provider/symmetric/DESede$KeyGenerator;->defaultKeySize:I

    invoke-direct {v2, v3, v4}, Lorg/spongycastle/crypto/KeyGenerationParameters;-><init>(Ljava/security/SecureRandom;I)V

    invoke-virtual {v1, v2}, Lorg/spongycastle/crypto/CipherKeyGenerator;->init(Lorg/spongycastle/crypto/KeyGenerationParameters;)V

    .line 161
    iput-boolean v5, p0, Lorg/spongycastle/jcajce/provider/symmetric/DESede$KeyGenerator;->uninitialised:Z

    .line 168
    :cond_18
    iget-boolean v1, p0, Lorg/spongycastle/jcajce/provider/symmetric/DESede$KeyGenerator;->keySizeSet:Z

    if-nez v1, :cond_31

    .line 170
    iget-object v1, p0, Lorg/spongycastle/jcajce/provider/symmetric/DESede$KeyGenerator;->engine:Lorg/spongycastle/crypto/CipherKeyGenerator;

    invoke-virtual {v1}, Lorg/spongycastle/crypto/CipherKeyGenerator;->generateKey()[B

    move-result-object v0

    .line 172
    .local v0, "k":[B
    const/16 v1, 0x10

    const/16 v2, 0x8

    invoke-static {v0, v5, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 174
    new-instance v1, Ljavax/crypto/spec/SecretKeySpec;

    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/DESede$KeyGenerator;->algName:Ljava/lang/String;

    invoke-direct {v1, v0, v2}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 178
    .end local v0    # "k":[B
    :goto_30
    return-object v1

    :cond_31
    new-instance v1, Ljavax/crypto/spec/SecretKeySpec;

    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/DESede$KeyGenerator;->engine:Lorg/spongycastle/crypto/CipherKeyGenerator;

    invoke-virtual {v2}, Lorg/spongycastle/crypto/CipherKeyGenerator;->generateKey()[B

    move-result-object v2

    iget-object v3, p0, Lorg/spongycastle/jcajce/provider/symmetric/DESede$KeyGenerator;->algName:Ljava/lang/String;

    invoke-direct {v1, v2, v3}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    goto :goto_30
.end method

.method protected engineInit(ILjava/security/SecureRandom;)V
    .registers 4
    .param p1, "keySize"    # I
    .param p2, "random"    # Ljava/security/SecureRandom;

    .prologue
    .line 152
    invoke-super {p0, p1, p2}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseKeyGenerator;->engineInit(ILjava/security/SecureRandom;)V

    .line 153
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/DESede$KeyGenerator;->keySizeSet:Z

    .line 154
    return-void
.end method
