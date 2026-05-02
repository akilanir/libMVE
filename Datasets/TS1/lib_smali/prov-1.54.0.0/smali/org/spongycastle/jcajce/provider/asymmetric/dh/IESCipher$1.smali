.class Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher$1;
.super Ljava/lang/Object;
.source "IESCipher.java"

# interfaces
.implements Lorg/spongycastle/crypto/KeyEncoder;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->engineDoFinal([BII)[B
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;


# direct methods
.method constructor <init>(Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;)V
    .registers 2
    .param p1, "this$0"    # Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;

    .prologue
    .line 414
    iput-object p1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher$1;->this$0:Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getEncoded(Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;)[B
    .registers 7
    .param p1, "keyParameter"    # Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    .prologue
    .line 417
    move-object v2, p1

    check-cast v2, Lorg/spongycastle/crypto/params/DHKeyParameters;

    invoke-virtual {v2}, Lorg/spongycastle/crypto/params/DHKeyParameters;->getParameters()Lorg/spongycastle/crypto/params/DHParameters;

    move-result-object v2

    invoke-virtual {v2}, Lorg/spongycastle/crypto/params/DHParameters;->getP()Ljava/math/BigInteger;

    move-result-object v2

    invoke-virtual {v2}, Ljava/math/BigInteger;->bitLength()I

    move-result v2

    add-int/lit8 v2, v2, 0x7

    div-int/lit8 v2, v2, 0x8

    new-array v0, v2, [B

    .line 418
    .local v0, "Vloc":[B
    check-cast p1, Lorg/spongycastle/crypto/params/DHPublicKeyParameters;

    .end local p1    # "keyParameter":Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;
    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/DHPublicKeyParameters;->getY()Ljava/math/BigInteger;

    move-result-object v2

    invoke-static {v2}, Lorg/spongycastle/util/BigIntegers;->asUnsignedByteArray(Ljava/math/BigInteger;)[B

    move-result-object v1

    .line 420
    .local v1, "Vtmp":[B
    array-length v2, v1

    array-length v3, v0

    if-le v2, v3, :cond_2b

    .line 422
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Senders\'s public key longer than expected."

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 426
    :cond_2b
    const/4 v2, 0x0

    array-length v3, v0

    array-length v4, v1

    sub-int/2addr v3, v4

    array-length v4, v1

    invoke-static {v1, v2, v0, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 429
    return-object v0
.end method
