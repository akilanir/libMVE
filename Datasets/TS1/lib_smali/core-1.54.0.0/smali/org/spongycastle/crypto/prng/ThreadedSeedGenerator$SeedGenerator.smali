.class Lorg/spongycastle/crypto/prng/ThreadedSeedGenerator$SeedGenerator;
.super Ljava/lang/Object;
.source "ThreadedSeedGenerator.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/spongycastle/crypto/prng/ThreadedSeedGenerator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SeedGenerator"
.end annotation


# instance fields
.field private volatile counter:I

.field private volatile stop:Z

.field final synthetic this$0:Lorg/spongycastle/crypto/prng/ThreadedSeedGenerator;


# direct methods
.method private constructor <init>(Lorg/spongycastle/crypto/prng/ThreadedSeedGenerator;)V
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 11
    iput-object p1, p0, Lorg/spongycastle/crypto/prng/ThreadedSeedGenerator$SeedGenerator;->this$0:Lorg/spongycastle/crypto/prng/ThreadedSeedGenerator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput v0, p0, Lorg/spongycastle/crypto/prng/ThreadedSeedGenerator$SeedGenerator;->counter:I

    .line 15
    iput-boolean v0, p0, Lorg/spongycastle/crypto/prng/ThreadedSeedGenerator$SeedGenerator;->stop:Z

    return-void
.end method

.method synthetic constructor <init>(Lorg/spongycastle/crypto/prng/ThreadedSeedGenerator;Lorg/spongycastle/crypto/prng/ThreadedSeedGenerator$1;)V
    .registers 3
    .param p1, "x0"    # Lorg/spongycastle/crypto/prng/ThreadedSeedGenerator;
    .param p2, "x1"    # Lorg/spongycastle/crypto/prng/ThreadedSeedGenerator$1;

    .prologue
    .line 11
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/prng/ThreadedSeedGenerator$SeedGenerator;-><init>(Lorg/spongycastle/crypto/prng/ThreadedSeedGenerator;)V

    return-void
.end method


# virtual methods
.method public generateSeed(IZ)[B
    .registers 11
    .param p1, "numbytes"    # I
    .param p2, "fast"    # Z

    .prologue
    const/4 v6, 0x0

    .line 30
    new-instance v5, Ljava/lang/Thread;

    invoke-direct {v5, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 31
    .local v5, "t":Ljava/lang/Thread;
    new-array v4, p1, [B

    .line 32
    .local v4, "result":[B
    iput v6, p0, Lorg/spongycastle/crypto/prng/ThreadedSeedGenerator$SeedGenerator;->counter:I

    .line 33
    iput-boolean v6, p0, Lorg/spongycastle/crypto/prng/ThreadedSeedGenerator$SeedGenerator;->stop:Z

    .line 34
    const/4 v3, 0x0

    .line 37
    .local v3, "last":I
    invoke-virtual {v5}, Ljava/lang/Thread;->start()V

    .line 38
    if-eqz p2, :cond_22

    .line 40
    move v1, p1

    .line 46
    .local v1, "end":I
    :goto_13
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_14
    if-ge v2, v1, :cond_3e

    .line 48
    :goto_16
    iget v6, p0, Lorg/spongycastle/crypto/prng/ThreadedSeedGenerator$SeedGenerator;->counter:I

    if-ne v6, v3, :cond_25

    .line 52
    const-wide/16 v6, 0x1

    :try_start_1c
    invoke-static {v6, v7}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1f
    .catch Ljava/lang/InterruptedException; {:try_start_1c .. :try_end_1f} :catch_20

    goto :goto_16

    .line 54
    :catch_20
    move-exception v6

    goto :goto_16

    .line 44
    .end local v1    # "end":I
    .end local v2    # "i":I
    :cond_22
    mul-int/lit8 v1, p1, 0x8

    .restart local v1    # "end":I
    goto :goto_13

    .line 59
    .restart local v2    # "i":I
    :cond_25
    iget v3, p0, Lorg/spongycastle/crypto/prng/ThreadedSeedGenerator$SeedGenerator;->counter:I

    .line 60
    if-eqz p2, :cond_31

    .line 62
    and-int/lit16 v6, v3, 0xff

    int-to-byte v6, v6

    aput-byte v6, v4, v2

    .line 46
    :goto_2e
    add-int/lit8 v2, v2, 0x1

    goto :goto_14

    .line 66
    :cond_31
    div-int/lit8 v0, v2, 0x8

    .line 67
    .local v0, "bytepos":I
    aget-byte v6, v4, v0

    shl-int/lit8 v6, v6, 0x1

    and-int/lit8 v7, v3, 0x1

    or-int/2addr v6, v7

    int-to-byte v6, v6

    aput-byte v6, v4, v0

    goto :goto_2e

    .line 71
    .end local v0    # "bytepos":I
    :cond_3e
    const/4 v6, 0x1

    iput-boolean v6, p0, Lorg/spongycastle/crypto/prng/ThreadedSeedGenerator$SeedGenerator;->stop:Z

    .line 72
    return-object v4
.end method

.method public run()V
    .registers 2

    .prologue
    .line 19
    :goto_0
    iget-boolean v0, p0, Lorg/spongycastle/crypto/prng/ThreadedSeedGenerator$SeedGenerator;->stop:Z

    if-nez v0, :cond_b

    .line 21
    iget v0, p0, Lorg/spongycastle/crypto/prng/ThreadedSeedGenerator$SeedGenerator;->counter:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/spongycastle/crypto/prng/ThreadedSeedGenerator$SeedGenerator;->counter:I

    goto :goto_0

    .line 24
    :cond_b
    return-void
.end method
