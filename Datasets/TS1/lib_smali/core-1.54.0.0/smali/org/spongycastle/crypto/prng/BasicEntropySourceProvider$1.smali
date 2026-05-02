.class Lorg/spongycastle/crypto/prng/BasicEntropySourceProvider$1;
.super Ljava/lang/Object;
.source "BasicEntropySourceProvider.java"

# interfaces
.implements Lorg/spongycastle/crypto/prng/EntropySource;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/spongycastle/crypto/prng/BasicEntropySourceProvider;->get(I)Lorg/spongycastle/crypto/prng/EntropySource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/spongycastle/crypto/prng/BasicEntropySourceProvider;

.field final synthetic val$bitsRequired:I


# direct methods
.method constructor <init>(Lorg/spongycastle/crypto/prng/BasicEntropySourceProvider;I)V
    .registers 3
    .param p1, "this$0"    # Lorg/spongycastle/crypto/prng/BasicEntropySourceProvider;

    .prologue
    .line 36
    iput-object p1, p0, Lorg/spongycastle/crypto/prng/BasicEntropySourceProvider$1;->this$0:Lorg/spongycastle/crypto/prng/BasicEntropySourceProvider;

    iput p2, p0, Lorg/spongycastle/crypto/prng/BasicEntropySourceProvider$1;->val$bitsRequired:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public entropySize()I
    .registers 2

    .prologue
    .line 58
    iget v0, p0, Lorg/spongycastle/crypto/prng/BasicEntropySourceProvider$1;->val$bitsRequired:I

    return v0
.end method

.method public getEntropy()[B
    .registers 4

    .prologue
    .line 45
    iget-object v1, p0, Lorg/spongycastle/crypto/prng/BasicEntropySourceProvider$1;->this$0:Lorg/spongycastle/crypto/prng/BasicEntropySourceProvider;

    # getter for: Lorg/spongycastle/crypto/prng/BasicEntropySourceProvider;->_sr:Ljava/security/SecureRandom;
    invoke-static {v1}, Lorg/spongycastle/crypto/prng/BasicEntropySourceProvider;->access$100(Lorg/spongycastle/crypto/prng/BasicEntropySourceProvider;)Ljava/security/SecureRandom;

    move-result-object v1

    instance-of v1, v1, Lorg/spongycastle/crypto/prng/SP800SecureRandom;

    if-nez v1, :cond_14

    iget-object v1, p0, Lorg/spongycastle/crypto/prng/BasicEntropySourceProvider$1;->this$0:Lorg/spongycastle/crypto/prng/BasicEntropySourceProvider;

    # getter for: Lorg/spongycastle/crypto/prng/BasicEntropySourceProvider;->_sr:Ljava/security/SecureRandom;
    invoke-static {v1}, Lorg/spongycastle/crypto/prng/BasicEntropySourceProvider;->access$100(Lorg/spongycastle/crypto/prng/BasicEntropySourceProvider;)Ljava/security/SecureRandom;

    move-result-object v1

    instance-of v1, v1, Lorg/spongycastle/crypto/prng/X931SecureRandom;

    if-eqz v1, :cond_26

    .line 47
    :cond_14
    iget v1, p0, Lorg/spongycastle/crypto/prng/BasicEntropySourceProvider$1;->val$bitsRequired:I

    add-int/lit8 v1, v1, 0x7

    div-int/lit8 v1, v1, 0x8

    new-array v0, v1, [B

    .line 49
    .local v0, "rv":[B
    iget-object v1, p0, Lorg/spongycastle/crypto/prng/BasicEntropySourceProvider$1;->this$0:Lorg/spongycastle/crypto/prng/BasicEntropySourceProvider;

    # getter for: Lorg/spongycastle/crypto/prng/BasicEntropySourceProvider;->_sr:Ljava/security/SecureRandom;
    invoke-static {v1}, Lorg/spongycastle/crypto/prng/BasicEntropySourceProvider;->access$100(Lorg/spongycastle/crypto/prng/BasicEntropySourceProvider;)Ljava/security/SecureRandom;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 53
    .end local v0    # "rv":[B
    :goto_25
    return-object v0

    :cond_26
    iget-object v1, p0, Lorg/spongycastle/crypto/prng/BasicEntropySourceProvider$1;->this$0:Lorg/spongycastle/crypto/prng/BasicEntropySourceProvider;

    # getter for: Lorg/spongycastle/crypto/prng/BasicEntropySourceProvider;->_sr:Ljava/security/SecureRandom;
    invoke-static {v1}, Lorg/spongycastle/crypto/prng/BasicEntropySourceProvider;->access$100(Lorg/spongycastle/crypto/prng/BasicEntropySourceProvider;)Ljava/security/SecureRandom;

    move-result-object v1

    iget v2, p0, Lorg/spongycastle/crypto/prng/BasicEntropySourceProvider$1;->val$bitsRequired:I

    add-int/lit8 v2, v2, 0x7

    div-int/lit8 v2, v2, 0x8

    invoke-virtual {v1, v2}, Ljava/security/SecureRandom;->generateSeed(I)[B

    move-result-object v0

    goto :goto_25
.end method

.method public isPredictionResistant()Z
    .registers 2

    .prologue
    .line 39
    iget-object v0, p0, Lorg/spongycastle/crypto/prng/BasicEntropySourceProvider$1;->this$0:Lorg/spongycastle/crypto/prng/BasicEntropySourceProvider;

    # getter for: Lorg/spongycastle/crypto/prng/BasicEntropySourceProvider;->_predictionResistant:Z
    invoke-static {v0}, Lorg/spongycastle/crypto/prng/BasicEntropySourceProvider;->access$000(Lorg/spongycastle/crypto/prng/BasicEntropySourceProvider;)Z

    move-result v0

    return v0
.end method
