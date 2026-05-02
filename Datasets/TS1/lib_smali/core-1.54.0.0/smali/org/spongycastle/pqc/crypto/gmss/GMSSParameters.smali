.class public Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;
.super Ljava/lang/Object;
.source "GMSSParameters.java"


# instance fields
.field private K:[I

.field private heightOfTrees:[I

.field private numOfLayers:I

.field private winternitzParameter:[I


# direct methods
.method public constructor <init>(I)V
    .registers 10
    .param p1, "keySize"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    const/16 v3, 0xa

    const/4 v7, 0x4

    const/4 v6, 0x1

    const/4 v5, 0x0

    const/4 v4, 0x2

    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 91
    if-gt p1, v3, :cond_1d

    .line 93
    new-array v0, v6, [I

    aput v3, v0, v5

    .line 94
    .local v0, "defh":[I
    new-array v2, v6, [I

    const/4 v3, 0x3

    aput v3, v2, v5

    .line 95
    .local v2, "defw":[I
    new-array v1, v6, [I

    aput v4, v1, v5

    .line 96
    .local v1, "defk":[I
    array-length v3, v0

    invoke-direct {p0, v3, v0, v2, v1}, Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;->init(I[I[I[I)V

    .line 112
    :goto_1c
    return-void

    .line 98
    .end local v0    # "defh":[I
    .end local v1    # "defk":[I
    .end local v2    # "defw":[I
    :cond_1d
    const/16 v3, 0x14

    if-gt p1, v3, :cond_35

    .line 100
    new-array v0, v4, [I

    fill-array-data v0, :array_4a

    .line 101
    .restart local v0    # "defh":[I
    new-array v2, v4, [I

    fill-array-data v2, :array_52

    .line 102
    .restart local v2    # "defw":[I
    new-array v1, v4, [I

    fill-array-data v1, :array_5a

    .line 103
    .restart local v1    # "defk":[I
    array-length v3, v0

    invoke-direct {p0, v3, v0, v2, v1}, Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;->init(I[I[I[I)V

    goto :goto_1c

    .line 107
    .end local v0    # "defh":[I
    .end local v1    # "defk":[I
    .end local v2    # "defw":[I
    :cond_35
    new-array v0, v7, [I

    fill-array-data v0, :array_62

    .line 108
    .restart local v0    # "defh":[I
    new-array v2, v7, [I

    fill-array-data v2, :array_6e

    .line 109
    .restart local v2    # "defw":[I
    new-array v1, v7, [I

    fill-array-data v1, :array_7a

    .line 110
    .restart local v1    # "defk":[I
    array-length v3, v0

    invoke-direct {p0, v3, v0, v2, v1}, Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;->init(I[I[I[I)V

    goto :goto_1c

    .line 100
    nop

    :array_4a
    .array-data 4
        0xa
        0xa
    .end array-data

    .line 101
    :array_52
    .array-data 4
        0x5
        0x4
    .end array-data

    .line 102
    :array_5a
    .array-data 4
        0x2
        0x2
    .end array-data

    .line 107
    :array_62
    .array-data 4
        0xa
        0xa
        0xa
        0xa
    .end array-data

    .line 108
    :array_6e
    .array-data 4
        0x9
        0x9
        0x9
        0x3
    .end array-data

    .line 109
    :array_7a
    .array-data 4
        0x2
        0x2
        0x2
        0x2
    .end array-data
.end method

.method public constructor <init>(I[I[I[I)V
    .registers 5
    .param p1, "layers"    # I
    .param p2, "heightOfTrees"    # [I
    .param p3, "winternitzParameter"    # [I
    .param p4, "K"    # [I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;->init(I[I[I[I)V

    .line 45
    return-void
.end method

.method private init(I[I[I[I)V
    .registers 11
    .param p1, "layers"    # I
    .param p2, "heightOfTrees"    # [I
    .param p3, "winternitzParameter"    # [I
    .param p4, "K"    # [I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x2

    .line 51
    const/4 v2, 0x1

    .line 52
    .local v2, "valid":Z
    const-string v0, ""

    .line 53
    .local v0, "errMsg":Ljava/lang/String;
    iput p1, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;->numOfLayers:I

    .line 54
    iget v3, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;->numOfLayers:I

    array-length v4, p3

    if-ne v3, v4, :cond_15

    iget v3, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;->numOfLayers:I

    array-length v4, p2

    if-ne v3, v4, :cond_15

    iget v3, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;->numOfLayers:I

    array-length v4, p4

    if-eq v3, v4, :cond_18

    .line 58
    :cond_15
    const/4 v2, 0x0

    .line 59
    const-string v0, "Unexpected parameterset format"

    .line 61
    :cond_18
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_19
    iget v3, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;->numOfLayers:I

    if-ge v1, v3, :cond_3c

    .line 63
    aget v3, p4, v1

    if-lt v3, v5, :cond_2a

    aget v3, p2, v1

    aget v4, p4, v1

    sub-int/2addr v3, v4

    rem-int/lit8 v3, v3, 0x2

    if-eqz v3, :cond_2d

    .line 65
    :cond_2a
    const/4 v2, 0x0

    .line 66
    const-string v0, "Wrong parameter K (K >= 2 and H-K even required)!"

    .line 69
    :cond_2d
    aget v3, p2, v1

    const/4 v4, 0x4

    if-lt v3, v4, :cond_36

    aget v3, p3, v1

    if-ge v3, v5, :cond_39

    .line 71
    :cond_36
    const/4 v2, 0x0

    .line 72
    const-string v0, "Wrong parameter H or w (H > 3 and w > 1 required)!"

    .line 61
    :cond_39
    add-int/lit8 v1, v1, 0x1

    goto :goto_19

    .line 76
    :cond_3c
    if-eqz v2, :cond_51

    .line 78
    invoke-static {p2}, Lorg/spongycastle/util/Arrays;->clone([I)[I

    move-result-object v3

    iput-object v3, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;->heightOfTrees:[I

    .line 79
    invoke-static {p3}, Lorg/spongycastle/util/Arrays;->clone([I)[I

    move-result-object v3

    iput-object v3, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;->winternitzParameter:[I

    .line 80
    invoke-static {p4}, Lorg/spongycastle/util/Arrays;->clone([I)[I

    move-result-object v3

    iput-object v3, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;->K:[I

    .line 86
    return-void

    .line 84
    :cond_51
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-direct {v3, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3
.end method


# virtual methods
.method public getHeightOfTrees()[I
    .registers 2

    .prologue
    .line 131
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;->heightOfTrees:[I

    invoke-static {v0}, Lorg/spongycastle/util/Arrays;->clone([I)[I

    move-result-object v0

    return-object v0
.end method

.method public getK()[I
    .registers 2

    .prologue
    .line 153
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;->K:[I

    invoke-static {v0}, Lorg/spongycastle/util/Arrays;->clone([I)[I

    move-result-object v0

    return-object v0
.end method

.method public getNumOfLayers()I
    .registers 2

    .prologue
    .line 121
    iget v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;->numOfLayers:I

    return v0
.end method

.method public getWinternitzParameter()[I
    .registers 2

    .prologue
    .line 143
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;->winternitzParameter:[I

    invoke-static {v0}, Lorg/spongycastle/util/Arrays;->clone([I)[I

    move-result-object v0

    return-object v0
.end method
