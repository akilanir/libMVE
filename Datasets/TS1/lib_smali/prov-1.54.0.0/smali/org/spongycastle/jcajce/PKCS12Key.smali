.class public Lorg/spongycastle/jcajce/PKCS12Key;
.super Ljava/lang/Object;
.source "PKCS12Key.java"

# interfaces
.implements Lorg/spongycastle/jcajce/PBKDFKey;


# instance fields
.field private final password:[C

.field private final useWrongZeroLengthConversion:Z


# direct methods
.method public constructor <init>([C)V
    .registers 3
    .param p1, "password"    # [C

    .prologue
    .line 20
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/spongycastle/jcajce/PKCS12Key;-><init>([CZ)V

    .line 21
    return-void
.end method

.method public constructor <init>([CZ)V
    .registers 6
    .param p1, "password"    # [C
    .param p2, "useWrongZeroLengthConversion"    # Z

    .prologue
    const/4 v2, 0x0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    array-length v0, p1

    new-array v0, v0, [C

    iput-object v0, p0, Lorg/spongycastle/jcajce/PKCS12Key;->password:[C

    .line 33
    iput-boolean p2, p0, Lorg/spongycastle/jcajce/PKCS12Key;->useWrongZeroLengthConversion:Z

    .line 35
    iget-object v0, p0, Lorg/spongycastle/jcajce/PKCS12Key;->password:[C

    array-length v1, p1

    invoke-static {p1, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 36
    return-void
.end method


# virtual methods
.method public getAlgorithm()Ljava/lang/String;
    .registers 2

    .prologue
    .line 55
    const-string v0, "PKCS12"

    return-object v0
.end method

.method public getEncoded()[B
    .registers 2

    .prologue
    .line 75
    iget-boolean v0, p0, Lorg/spongycastle/jcajce/PKCS12Key;->useWrongZeroLengthConversion:Z

    if-eqz v0, :cond_d

    iget-object v0, p0, Lorg/spongycastle/jcajce/PKCS12Key;->password:[C

    array-length v0, v0

    if-nez v0, :cond_d

    .line 77
    const/4 v0, 0x2

    new-array v0, v0, [B

    .line 80
    :goto_c
    return-object v0

    :cond_d
    iget-object v0, p0, Lorg/spongycastle/jcajce/PKCS12Key;->password:[C

    invoke-static {v0}, Lorg/spongycastle/crypto/PBEParametersGenerator;->PKCS12PasswordToBytes([C)[B

    move-result-object v0

    goto :goto_c
.end method

.method public getFormat()Ljava/lang/String;
    .registers 2

    .prologue
    .line 65
    const-string v0, "PKCS12"

    return-object v0
.end method

.method public getPassword()[C
    .registers 2

    .prologue
    .line 45
    iget-object v0, p0, Lorg/spongycastle/jcajce/PKCS12Key;->password:[C

    return-object v0
.end method
