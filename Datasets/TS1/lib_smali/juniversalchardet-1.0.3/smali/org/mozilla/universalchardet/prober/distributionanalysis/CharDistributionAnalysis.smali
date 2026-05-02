.class public abstract Lorg/mozilla/universalchardet/prober/distributionanalysis/CharDistributionAnalysis;
.super Ljava/lang/Object;
.source "CharDistributionAnalysis.java"


# static fields
.field public static final ENOUGH_DATA_THRESHOLD:I = 0x400

.field public static final MINIMUM_DATA_THRESHOLD:I = 0x4

.field public static final SURE_NO:F = 0.01f

.field public static final SURE_YES:F = 0.99f


# instance fields
.field protected charToFreqOrder:[I

.field protected done:Z

.field private freqChars:I

.field private totalChars:I

.field protected typicalDistributionRatio:F


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    invoke-virtual {p0}, Lorg/mozilla/universalchardet/prober/distributionanalysis/CharDistributionAnalysis;->reset()V

    .line 68
    return-void
.end method


# virtual methods
.method public getConfidence()F
    .registers 6

    .prologue
    const v1, 0x3f7d70a4    # 0.99f

    .line 93
    iget v2, p0, Lorg/mozilla/universalchardet/prober/distributionanalysis/CharDistributionAnalysis;->totalChars:I

    if-lez v2, :cond_c

    iget v2, p0, Lorg/mozilla/universalchardet/prober/distributionanalysis/CharDistributionAnalysis;->freqChars:I

    const/4 v3, 0x4

    if-gt v2, v3, :cond_10

    .line 94
    :cond_c
    const v0, 0x3c23d70a    # 0.01f

    .line 105
    :cond_f
    :goto_f
    return v0

    .line 97
    :cond_10
    iget v2, p0, Lorg/mozilla/universalchardet/prober/distributionanalysis/CharDistributionAnalysis;->totalChars:I

    iget v3, p0, Lorg/mozilla/universalchardet/prober/distributionanalysis/CharDistributionAnalysis;->freqChars:I

    if-eq v2, v3, :cond_27

    .line 98
    iget v2, p0, Lorg/mozilla/universalchardet/prober/distributionanalysis/CharDistributionAnalysis;->freqChars:I

    iget v3, p0, Lorg/mozilla/universalchardet/prober/distributionanalysis/CharDistributionAnalysis;->totalChars:I

    iget v4, p0, Lorg/mozilla/universalchardet/prober/distributionanalysis/CharDistributionAnalysis;->freqChars:I

    sub-int/2addr v3, v4

    div-int/2addr v2, v3

    int-to-float v2, v2

    iget v3, p0, Lorg/mozilla/universalchardet/prober/distributionanalysis/CharDistributionAnalysis;->typicalDistributionRatio:F

    mul-float v0, v2, v3

    .line 100
    .local v0, "r":F
    cmpg-float v2, v0, v1

    if-ltz v2, :cond_f

    .end local v0    # "r":F
    :cond_27
    move v0, v1

    .line 105
    goto :goto_f
.end method

.method protected abstract getOrder([BI)I
.end method

.method public gotEnoughData()Z
    .registers 3

    .prologue
    .line 120
    iget v0, p0, Lorg/mozilla/universalchardet/prober/distributionanalysis/CharDistributionAnalysis;->totalChars:I

    const/16 v1, 0x400

    if-le v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public handleData([BII)V
    .registers 4
    .param p1, "buf"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    .line 71
    return-void
.end method

.method public handleOneChar([BII)V
    .registers 7
    .param p1, "buf"    # [B
    .param p2, "offset"    # I
    .param p3, "charLength"    # I

    .prologue
    .line 75
    const/4 v0, -0x1

    .line 77
    .local v0, "order":I
    const/4 v1, 0x2

    if-ne p3, v1, :cond_8

    .line 78
    invoke-virtual {p0, p1, p2}, Lorg/mozilla/universalchardet/prober/distributionanalysis/CharDistributionAnalysis;->getOrder([BI)I

    move-result v0

    .line 81
    :cond_8
    if-ltz v0, :cond_23

    .line 82
    iget v1, p0, Lorg/mozilla/universalchardet/prober/distributionanalysis/CharDistributionAnalysis;->totalChars:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/mozilla/universalchardet/prober/distributionanalysis/CharDistributionAnalysis;->totalChars:I

    .line 83
    iget-object v1, p0, Lorg/mozilla/universalchardet/prober/distributionanalysis/CharDistributionAnalysis;->charToFreqOrder:[I

    array-length v1, v1

    if-ge v0, v1, :cond_23

    .line 84
    const/16 v1, 0x200

    iget-object v2, p0, Lorg/mozilla/universalchardet/prober/distributionanalysis/CharDistributionAnalysis;->charToFreqOrder:[I

    aget v2, v2, v0

    if-le v1, v2, :cond_23

    .line 85
    iget v1, p0, Lorg/mozilla/universalchardet/prober/distributionanalysis/CharDistributionAnalysis;->freqChars:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/mozilla/universalchardet/prober/distributionanalysis/CharDistributionAnalysis;->freqChars:I

    .line 89
    :cond_23
    return-void
.end method

.method public reset()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 110
    iput-boolean v0, p0, Lorg/mozilla/universalchardet/prober/distributionanalysis/CharDistributionAnalysis;->done:Z

    .line 111
    iput v0, p0, Lorg/mozilla/universalchardet/prober/distributionanalysis/CharDistributionAnalysis;->totalChars:I

    .line 112
    iput v0, p0, Lorg/mozilla/universalchardet/prober/distributionanalysis/CharDistributionAnalysis;->freqChars:I

    .line 113
    return-void
.end method

.method public setOption()V
    .registers 1

    .prologue
    .line 116
    return-void
.end method
