.class public Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2Parameters;
.super Lorg/spongycastle/pqc/crypto/mceliece/McElieceParameters;
.source "McElieceCCA2Parameters.java"


# instance fields
.field public digest:Lorg/spongycastle/crypto/Digest;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 30
    invoke-direct {p0}, Lorg/spongycastle/pqc/crypto/mceliece/McElieceParameters;-><init>()V

    .line 31
    new-instance v0, Lorg/spongycastle/crypto/digests/SHA256Digest;

    invoke-direct {v0}, Lorg/spongycastle/crypto/digests/SHA256Digest;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2Parameters;->digest:Lorg/spongycastle/crypto/Digest;

    .line 32
    return-void
.end method

.method public constructor <init>(II)V
    .registers 4
    .param p1, "m"    # I
    .param p2, "t"    # I

    .prologue
    .line 36
    invoke-direct {p0, p1, p2}, Lorg/spongycastle/pqc/crypto/mceliece/McElieceParameters;-><init>(II)V

    .line 37
    new-instance v0, Lorg/spongycastle/crypto/digests/SHA256Digest;

    invoke-direct {v0}, Lorg/spongycastle/crypto/digests/SHA256Digest;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2Parameters;->digest:Lorg/spongycastle/crypto/Digest;

    .line 38
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/Digest;)V
    .registers 2
    .param p1, "digest"    # Lorg/spongycastle/crypto/Digest;

    .prologue
    .line 41
    invoke-direct {p0}, Lorg/spongycastle/pqc/crypto/mceliece/McElieceParameters;-><init>()V

    .line 42
    iput-object p1, p0, Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2Parameters;->digest:Lorg/spongycastle/crypto/Digest;

    .line 43
    return-void
.end method


# virtual methods
.method public getDigest()Lorg/spongycastle/crypto/Digest;
    .registers 2

    .prologue
    .line 47
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2Parameters;->digest:Lorg/spongycastle/crypto/Digest;

    return-object v0
.end method
