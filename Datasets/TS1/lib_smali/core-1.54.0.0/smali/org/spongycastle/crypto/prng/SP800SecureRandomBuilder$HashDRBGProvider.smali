.class Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder$HashDRBGProvider;
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
    name = "HashDRBGProvider"
.end annotation


# instance fields
.field private final digest:Lorg/spongycastle/crypto/Digest;

.field private final nonce:[B

.field private final personalizationString:[B

.field private final securityStrength:I


# direct methods
.method public constructor <init>(Lorg/spongycastle/crypto/Digest;[B[BI)V
    .registers 5
    .param p1, "digest"    # Lorg/spongycastle/crypto/Digest;
    .param p2, "nonce"    # [B
    .param p3, "personalizationString"    # [B
    .param p4, "securityStrength"    # I

    .prologue
    .line 185
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 186
    iput-object p1, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder$HashDRBGProvider;->digest:Lorg/spongycastle/crypto/Digest;

    .line 187
    iput-object p2, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder$HashDRBGProvider;->nonce:[B

    .line 188
    iput-object p3, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder$HashDRBGProvider;->personalizationString:[B

    .line 189
    iput p4, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder$HashDRBGProvider;->securityStrength:I

    .line 190
    return-void
.end method


# virtual methods
.method public get(Lorg/spongycastle/crypto/prng/EntropySource;)Lorg/spongycastle/crypto/prng/drbg/SP80090DRBG;
    .registers 8
    .param p1, "entropySource"    # Lorg/spongycastle/crypto/prng/EntropySource;

    .prologue
    .line 194
    new-instance v0, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;

    iget-object v1, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder$HashDRBGProvider;->digest:Lorg/spongycastle/crypto/Digest;

    iget v2, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder$HashDRBGProvider;->securityStrength:I

    iget-object v4, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder$HashDRBGProvider;->personalizationString:[B

    iget-object v5, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder$HashDRBGProvider;->nonce:[B

    move-object v3, p1

    invoke-direct/range {v0 .. v5}, Lorg/spongycastle/crypto/prng/drbg/HashSP800DRBG;-><init>(Lorg/spongycastle/crypto/Digest;ILorg/spongycastle/crypto/prng/EntropySource;[B[B)V

    return-object v0
.end method
