.class public Lorg/spongycastle/pqc/jcajce/spec/RainbowParameterSpec;
.super Ljava/lang/Object;
.source "RainbowParameterSpec.java"

# interfaces
.implements Ljava/security/spec/AlgorithmParameterSpec;


# static fields
.field private static final DEFAULT_VI:[I


# instance fields
.field private vi:[I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 37
    const/4 v0, 0x5

    new-array v0, v0, [I

    fill-array-data v0, :array_a

    sput-object v0, Lorg/spongycastle/pqc/jcajce/spec/RainbowParameterSpec;->DEFAULT_VI:[I

    return-void

    nop

    :array_a
    .array-data 4
        0x6
        0xc
        0x11
        0x16
        0x21
    .end array-data
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    sget-object v0, Lorg/spongycastle/pqc/jcajce/spec/RainbowParameterSpec;->DEFAULT_VI:[I

    iput-object v0, p0, Lorg/spongycastle/pqc/jcajce/spec/RainbowParameterSpec;->vi:[I

    .line 48
    return-void
.end method

.method public constructor <init>([I)V
    .registers 3
    .param p1, "vi"    # [I

    .prologue
    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    iput-object p1, p0, Lorg/spongycastle/pqc/jcajce/spec/RainbowParameterSpec;->vi:[I

    .line 62
    :try_start_5
    invoke-direct {p0}, Lorg/spongycastle/pqc/jcajce/spec/RainbowParameterSpec;->checkParams()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_8} :catch_9

    .line 68
    :goto_8
    return-void

    .line 64
    :catch_9
    move-exception v0

    .line 66
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_8
.end method

.method private checkParams()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 73
    iget-object v1, p0, Lorg/spongycastle/pqc/jcajce/spec/RainbowParameterSpec;->vi:[I

    if-nez v1, :cond_c

    .line 75
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "no layers defined."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 77
    :cond_c
    iget-object v1, p0, Lorg/spongycastle/pqc/jcajce/spec/RainbowParameterSpec;->vi:[I

    array-length v1, v1

    const/4 v2, 0x1

    if-le v1, v2, :cond_31

    .line 79
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_13
    iget-object v1, p0, Lorg/spongycastle/pqc/jcajce/spec/RainbowParameterSpec;->vi:[I

    array-length v1, v1

    add-int/lit8 v1, v1, -0x1

    if-ge v0, v1, :cond_39

    .line 81
    iget-object v1, p0, Lorg/spongycastle/pqc/jcajce/spec/RainbowParameterSpec;->vi:[I

    aget v1, v1, v0

    iget-object v2, p0, Lorg/spongycastle/pqc/jcajce/spec/RainbowParameterSpec;->vi:[I

    add-int/lit8 v3, v0, 0x1

    aget v2, v2, v3

    if-lt v1, v2, :cond_2e

    .line 83
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "v[i] has to be smaller than v[i+1]"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 79
    :cond_2e
    add-int/lit8 v0, v0, 0x1

    goto :goto_13

    .line 90
    .end local v0    # "i":I
    :cond_31
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Rainbow needs at least 1 layer, such that v1 < v2."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 93
    .restart local v0    # "i":I
    :cond_39
    return-void
.end method


# virtual methods
.method public getDocumentLength()I
    .registers 4

    .prologue
    .line 112
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/spec/RainbowParameterSpec;->vi:[I

    iget-object v1, p0, Lorg/spongycastle/pqc/jcajce/spec/RainbowParameterSpec;->vi:[I

    array-length v1, v1

    add-int/lit8 v1, v1, -0x1

    aget v0, v0, v1

    iget-object v1, p0, Lorg/spongycastle/pqc/jcajce/spec/RainbowParameterSpec;->vi:[I

    const/4 v2, 0x0

    aget v1, v1, v2

    sub-int/2addr v0, v1

    return v0
.end method

.method public getNumOfLayers()I
    .registers 2

    .prologue
    .line 102
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/spec/RainbowParameterSpec;->vi:[I

    array-length v0, v0

    add-int/lit8 v0, v0, -0x1

    return v0
.end method

.method public getVi()[I
    .registers 2

    .prologue
    .line 122
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/spec/RainbowParameterSpec;->vi:[I

    invoke-static {v0}, Lorg/spongycastle/util/Arrays;->clone([I)[I

    move-result-object v0

    return-object v0
.end method
