.class public Lorg/spongycastle/crypto/prng/SP800SecureRandom;
.super Ljava/security/SecureRandom;
.source "SP800SecureRandom.java"


# instance fields
.field private drbg:Lorg/spongycastle/crypto/prng/drbg/SP80090DRBG;

.field private final drbgProvider:Lorg/spongycastle/crypto/prng/DRBGProvider;

.field private final entropySource:Lorg/spongycastle/crypto/prng/EntropySource;

.field private final predictionResistant:Z

.field private final randomSource:Ljava/security/SecureRandom;


# direct methods
.method constructor <init>(Ljava/security/SecureRandom;Lorg/spongycastle/crypto/prng/EntropySource;Lorg/spongycastle/crypto/prng/DRBGProvider;Z)V
    .registers 5
    .param p1, "randomSource"    # Ljava/security/SecureRandom;
    .param p2, "entropySource"    # Lorg/spongycastle/crypto/prng/EntropySource;
    .param p3, "drbgProvider"    # Lorg/spongycastle/crypto/prng/DRBGProvider;
    .param p4, "predictionResistant"    # Z

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/security/SecureRandom;-><init>()V

    .line 19
    iput-object p1, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandom;->randomSource:Ljava/security/SecureRandom;

    .line 20
    iput-object p2, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandom;->entropySource:Lorg/spongycastle/crypto/prng/EntropySource;

    .line 21
    iput-object p3, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandom;->drbgProvider:Lorg/spongycastle/crypto/prng/DRBGProvider;

    .line 22
    iput-boolean p4, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandom;->predictionResistant:Z

    .line 23
    return-void
.end method


# virtual methods
.method public generateSeed(I)[B
    .registers 3
    .param p1, "numBytes"    # I

    .prologue
    .line 68
    iget-object v0, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandom;->entropySource:Lorg/spongycastle/crypto/prng/EntropySource;

    invoke-static {v0, p1}, Lorg/spongycastle/crypto/prng/EntropyUtil;->generateSeed(Lorg/spongycastle/crypto/prng/EntropySource;I)[B

    move-result-object v0

    return-object v0
.end method

.method public nextBytes([B)V
    .registers 5
    .param p1, "bytes"    # [B

    .prologue
    .line 50
    monitor-enter p0

    .line 52
    :try_start_1
    iget-object v0, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandom;->drbg:Lorg/spongycastle/crypto/prng/drbg/SP80090DRBG;

    if-nez v0, :cond_f

    .line 54
    iget-object v0, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandom;->drbgProvider:Lorg/spongycastle/crypto/prng/DRBGProvider;

    iget-object v1, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandom;->entropySource:Lorg/spongycastle/crypto/prng/EntropySource;

    invoke-interface {v0, v1}, Lorg/spongycastle/crypto/prng/DRBGProvider;->get(Lorg/spongycastle/crypto/prng/EntropySource;)Lorg/spongycastle/crypto/prng/drbg/SP80090DRBG;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandom;->drbg:Lorg/spongycastle/crypto/prng/drbg/SP80090DRBG;

    .line 58
    :cond_f
    iget-object v0, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandom;->drbg:Lorg/spongycastle/crypto/prng/drbg/SP80090DRBG;

    const/4 v1, 0x0

    iget-boolean v2, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandom;->predictionResistant:Z

    invoke-interface {v0, p1, v1, v2}, Lorg/spongycastle/crypto/prng/drbg/SP80090DRBG;->generate([B[BZ)I

    move-result v0

    if-gez v0, :cond_28

    .line 60
    iget-object v0, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandom;->drbg:Lorg/spongycastle/crypto/prng/drbg/SP80090DRBG;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lorg/spongycastle/crypto/prng/drbg/SP80090DRBG;->reseed([B)V

    .line 61
    iget-object v0, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandom;->drbg:Lorg/spongycastle/crypto/prng/drbg/SP80090DRBG;

    const/4 v1, 0x0

    iget-boolean v2, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandom;->predictionResistant:Z

    invoke-interface {v0, p1, v1, v2}, Lorg/spongycastle/crypto/prng/drbg/SP80090DRBG;->generate([B[BZ)I

    .line 63
    :cond_28
    monitor-exit p0

    .line 64
    return-void

    .line 63
    :catchall_2a
    move-exception v0

    monitor-exit p0
    :try_end_2c
    .catchall {:try_start_1 .. :try_end_2c} :catchall_2a

    throw v0
.end method

.method public setSeed(J)V
    .registers 4
    .param p1, "seed"    # J

    .prologue
    .line 38
    monitor-enter p0

    .line 41
    :try_start_1
    iget-object v0, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandom;->randomSource:Ljava/security/SecureRandom;

    if-eqz v0, :cond_a

    .line 43
    iget-object v0, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandom;->randomSource:Ljava/security/SecureRandom;

    invoke-virtual {v0, p1, p2}, Ljava/security/SecureRandom;->setSeed(J)V

    .line 45
    :cond_a
    monitor-exit p0

    .line 46
    return-void

    .line 45
    :catchall_c
    move-exception v0

    monitor-exit p0
    :try_end_e
    .catchall {:try_start_1 .. :try_end_e} :catchall_c

    throw v0
.end method

.method public setSeed([B)V
    .registers 3
    .param p1, "seed"    # [B

    .prologue
    .line 27
    monitor-enter p0

    .line 29
    :try_start_1
    iget-object v0, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandom;->randomSource:Ljava/security/SecureRandom;

    if-eqz v0, :cond_a

    .line 31
    iget-object v0, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandom;->randomSource:Ljava/security/SecureRandom;

    invoke-virtual {v0, p1}, Ljava/security/SecureRandom;->setSeed([B)V

    .line 33
    :cond_a
    monitor-exit p0

    .line 34
    return-void

    .line 33
    :catchall_c
    move-exception v0

    monitor-exit p0
    :try_end_e
    .catchall {:try_start_1 .. :try_end_e} :catchall_c

    throw v0
.end method
