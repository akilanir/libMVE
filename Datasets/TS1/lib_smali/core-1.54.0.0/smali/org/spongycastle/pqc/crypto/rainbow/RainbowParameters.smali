.class public Lorg/spongycastle/pqc/crypto/rainbow/RainbowParameters;
.super Ljava/lang/Object;
.source "RainbowParameters.java"

# interfaces
.implements Lorg/spongycastle/crypto/CipherParameters;


# instance fields
.field private final DEFAULT_VI:[I

.field private vi:[I


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    const/4 v0, 0x5

    new-array v0, v0, [I

    fill-array-data v0, :array_10

    iput-object v0, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowParameters;->DEFAULT_VI:[I

    .line 35
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowParameters;->DEFAULT_VI:[I

    iput-object v0, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowParameters;->vi:[I

    .line 36
    return-void

    .line 25
    :array_10
    .array-data 4
        0x6
        0xc
        0x11
        0x16
        0x21
    .end array-data
.end method

.method public constructor <init>([I)V
    .registers 4
    .param p1, "vi"    # [I

    .prologue
    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    const/4 v1, 0x5

    new-array v1, v1, [I

    fill-array-data v1, :array_16

    iput-object v1, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowParameters;->DEFAULT_VI:[I

    .line 46
    iput-object p1, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowParameters;->vi:[I

    .line 49
    :try_start_d
    invoke-direct {p0}, Lorg/spongycastle/pqc/crypto/rainbow/RainbowParameters;->checkParams()V
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_10} :catch_11

    .line 55
    :goto_10
    return-void

    .line 51
    :catch_11
    move-exception v0

    .line 53
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_10

    .line 25
    :array_16
    .array-data 4
        0x6
        0xc
        0x11
        0x16
        0x21
    .end array-data
.end method

.method private checkParams()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 60
    iget-object v1, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowParameters;->vi:[I

    if-nez v1, :cond_c

    .line 62
    new-instance v1, Ljava/lang/Exception;

    const-string v2, "no layers defined."

    invoke-direct {v1, v2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v1

    .line 64
    :cond_c
    iget-object v1, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowParameters;->vi:[I

    array-length v1, v1

    const/4 v2, 0x1

    if-le v1, v2, :cond_31

    .line 66
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_13
    iget-object v1, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowParameters;->vi:[I

    array-length v1, v1

    add-int/lit8 v1, v1, -0x1

    if-ge v0, v1, :cond_39

    .line 68
    iget-object v1, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowParameters;->vi:[I

    aget v1, v1, v0

    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowParameters;->vi:[I

    add-int/lit8 v3, v0, 0x1

    aget v2, v2, v3

    if-lt v1, v2, :cond_2e

    .line 70
    new-instance v1, Ljava/lang/Exception;

    const-string v2, "v[i] has to be smaller than v[i+1]"

    invoke-direct {v1, v2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v1

    .line 66
    :cond_2e
    add-int/lit8 v0, v0, 0x1

    goto :goto_13

    .line 77
    .end local v0    # "i":I
    :cond_31
    new-instance v1, Ljava/lang/Exception;

    const-string v2, "Rainbow needs at least 1 layer, such that v1 < v2."

    invoke-direct {v1, v2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v1

    .line 80
    .restart local v0    # "i":I
    :cond_39
    return-void
.end method


# virtual methods
.method public getDocLength()I
    .registers 4

    .prologue
    .line 99
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowParameters;->vi:[I

    iget-object v1, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowParameters;->vi:[I

    array-length v1, v1

    add-int/lit8 v1, v1, -0x1

    aget v0, v0, v1

    iget-object v1, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowParameters;->vi:[I

    const/4 v2, 0x0

    aget v1, v1, v2

    sub-int/2addr v0, v1

    return v0
.end method

.method public getNumOfLayers()I
    .registers 2

    .prologue
    .line 89
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowParameters;->vi:[I

    array-length v0, v0

    add-int/lit8 v0, v0, -0x1

    return v0
.end method

.method public getVi()[I
    .registers 2

    .prologue
    .line 109
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/rainbow/RainbowParameters;->vi:[I

    return-object v0
.end method
