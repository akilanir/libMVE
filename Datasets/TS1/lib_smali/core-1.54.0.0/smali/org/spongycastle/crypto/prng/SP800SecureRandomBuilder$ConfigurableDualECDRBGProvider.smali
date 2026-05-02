.class Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder$ConfigurableDualECDRBGProvider;
.super Ljava/lang/Object;
.source "SP800SecureRandomBuilder.java"

# interfaces
.implements Lorg/spongycastle/crypto/prng/DRBGProvider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ConfigurableDualECDRBGProvider"
.end annotation


# instance fields
.field private final digest:Lorg/spongycastle/crypto/Digest;

.field private final nonce:[B

.field private final personalizationString:[B

.field private final pointSet:[Lorg/spongycastle/crypto/prng/drbg/DualECPoints;

.field private final securityStrength:I


# direct methods
.method public constructor <init>([Lorg/spongycastle/crypto/prng/drbg/DualECPoints;Lorg/spongycastle/crypto/Digest;[B[BI)V
    .registers 9
    .param p1, "pointSet"    # [Lorg/spongycastle/crypto/prng/drbg/DualECPoints;
    .param p2, "digest"    # Lorg/spongycastle/crypto/Digest;
    .param p3, "nonce"    # [B
    .param p4, "personalizationString"    # [B
    .param p5, "securityStrength"    # I

    .prologue
    const/4 v2, 0x0

    .line 230
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 231
    array-length v0, p1

    new-array v0, v0, [Lorg/spongycastle/crypto/prng/drbg/DualECPoints;

    iput-object v0, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder$ConfigurableDualECDRBGProvider;->pointSet:[Lorg/spongycastle/crypto/prng/drbg/DualECPoints;

    .line 232
    iget-object v0, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder$ConfigurableDualECDRBGProvider;->pointSet:[Lorg/spongycastle/crypto/prng/drbg/DualECPoints;

    array-length v1, p1

    invoke-static {p1, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 233
    iput-object p2, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder$ConfigurableDualECDRBGProvider;->digest:Lorg/spongycastle/crypto/Digest;

    .line 234
    iput-object p3, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder$ConfigurableDualECDRBGProvider;->nonce:[B

    .line 235
    iput-object p4, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder$ConfigurableDualECDRBGProvider;->personalizationString:[B

    .line 236
    iput p5, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder$ConfigurableDualECDRBGProvider;->securityStrength:I

    .line 237
    return-void
.end method


# virtual methods
.method public get(Lorg/spongycastle/crypto/prng/EntropySource;)Lorg/spongycastle/crypto/prng/drbg/SP80090DRBG;
    .registers 9
    .param p1, "entropySource"    # Lorg/spongycastle/crypto/prng/EntropySource;

    .prologue
    .line 241
    new-instance v0, Lorg/spongycastle/crypto/prng/drbg/DualECSP800DRBG;

    iget-object v1, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder$ConfigurableDualECDRBGProvider;->pointSet:[Lorg/spongycastle/crypto/prng/drbg/DualECPoints;

    iget-object v2, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder$ConfigurableDualECDRBGProvider;->digest:Lorg/spongycastle/crypto/Digest;

    iget v3, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder$ConfigurableDualECDRBGProvider;->securityStrength:I

    iget-object v5, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder$ConfigurableDualECDRBGProvider;->personalizationString:[B

    iget-object v6, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder$ConfigurableDualECDRBGProvider;->nonce:[B

    move-object v4, p1

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/prng/drbg/DualECSP800DRBG;-><init>([Lorg/spongycastle/crypto/prng/drbg/DualECPoints;Lorg/spongycastle/crypto/Digest;ILorg/spongycastle/crypto/prng/EntropySource;[B[B)V

    return-object v0
.end method
