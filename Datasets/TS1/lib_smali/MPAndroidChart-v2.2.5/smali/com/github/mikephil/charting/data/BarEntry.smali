.class public Lcom/github/mikephil/charting/data/BarEntry;
.super Lcom/github/mikephil/charting/data/Entry;
.source "BarEntry.java"


# instance fields
.field private mNegativeSum:F

.field private mPositiveSum:F

.field private mVals:[F


# direct methods
.method public constructor <init>(FI)V
    .registers 3
    .param p1, "val"    # F
    .param p2, "xIndex"    # I

    .prologue
    .line 40
    invoke-direct {p0, p1, p2}, Lcom/github/mikephil/charting/data/Entry;-><init>(FI)V

    .line 41
    return-void
.end method

.method public constructor <init>(FILjava/lang/Object;)V
    .registers 4
    .param p1, "val"    # F
    .param p2, "xIndex"    # I
    .param p3, "data"    # Ljava/lang/Object;

    .prologue
    .line 68
    invoke-direct {p0, p1, p2, p3}, Lcom/github/mikephil/charting/data/Entry;-><init>(FILjava/lang/Object;)V

    .line 69
    return-void
.end method

.method public constructor <init>([FI)V
    .registers 4
    .param p1, "vals"    # [F
    .param p2, "xIndex"    # I

    .prologue
    .line 27
    invoke-static {p1}, Lcom/github/mikephil/charting/data/BarEntry;->calcSum([F)F

    move-result v0

    invoke-direct {p0, v0, p2}, Lcom/github/mikephil/charting/data/Entry;-><init>(FI)V

    .line 29
    iput-object p1, p0, Lcom/github/mikephil/charting/data/BarEntry;->mVals:[F

    .line 30
    invoke-direct {p0}, Lcom/github/mikephil/charting/data/BarEntry;->calcPosNegSum()V

    .line 31
    return-void
.end method

.method public constructor <init>([FILjava/lang/String;)V
    .registers 5
    .param p1, "vals"    # [F
    .param p2, "xIndex"    # I
    .param p3, "label"    # Ljava/lang/String;

    .prologue
    .line 53
    invoke-static {p1}, Lcom/github/mikephil/charting/data/BarEntry;->calcSum([F)F

    move-result v0

    invoke-direct {p0, v0, p2, p3}, Lcom/github/mikephil/charting/data/Entry;-><init>(FILjava/lang/Object;)V

    .line 55
    iput-object p1, p0, Lcom/github/mikephil/charting/data/BarEntry;->mVals:[F

    .line 56
    invoke-direct {p0}, Lcom/github/mikephil/charting/data/BarEntry;->calcPosNegSum()V

    .line 57
    return-void
.end method

.method private calcPosNegSum()V
    .registers 9

    .prologue
    const/4 v7, 0x0

    .line 157
    iget-object v6, p0, Lcom/github/mikephil/charting/data/BarEntry;->mVals:[F

    if-nez v6, :cond_a

    .line 158
    iput v7, p0, Lcom/github/mikephil/charting/data/BarEntry;->mNegativeSum:F

    .line 159
    iput v7, p0, Lcom/github/mikephil/charting/data/BarEntry;->mPositiveSum:F

    .line 175
    :goto_9
    return-void

    .line 163
    :cond_a
    const/4 v4, 0x0

    .line 164
    .local v4, "sumNeg":F
    const/4 v5, 0x0

    .line 166
    .local v5, "sumPos":F
    iget-object v0, p0, Lcom/github/mikephil/charting/data/BarEntry;->mVals:[F

    .local v0, "arr$":[F
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_10
    if-ge v2, v3, :cond_22

    aget v1, v0, v2

    .line 167
    .local v1, "f":F
    cmpg-float v6, v1, v7

    if-gtz v6, :cond_20

    .line 168
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v6

    add-float/2addr v4, v6

    .line 166
    :goto_1d
    add-int/lit8 v2, v2, 0x1

    goto :goto_10

    .line 170
    :cond_20
    add-float/2addr v5, v1

    goto :goto_1d

    .line 173
    .end local v1    # "f":F
    :cond_22
    iput v4, p0, Lcom/github/mikephil/charting/data/BarEntry;->mNegativeSum:F

    .line 174
    iput v5, p0, Lcom/github/mikephil/charting/data/BarEntry;->mPositiveSum:F

    goto :goto_9
.end method

.method private static calcSum([F)F
    .registers 6
    .param p0, "vals"    # [F

    .prologue
    .line 185
    if-nez p0, :cond_4

    .line 186
    const/4 v4, 0x0

    .line 193
    :cond_3
    return v4

    .line 188
    :cond_4
    const/4 v4, 0x0

    .line 190
    .local v4, "sum":F
    move-object v0, p0

    .local v0, "arr$":[F
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_8
    if-ge v2, v3, :cond_3

    aget v1, v0, v2

    .line 191
    .local v1, "f":F
    add-float/2addr v4, v1

    .line 190
    add-int/lit8 v2, v2, 0x1

    goto :goto_8
.end method


# virtual methods
.method public copy()Lcom/github/mikephil/charting/data/BarEntry;
    .registers 5

    .prologue
    .line 76
    new-instance v0, Lcom/github/mikephil/charting/data/BarEntry;

    invoke-virtual {p0}, Lcom/github/mikephil/charting/data/BarEntry;->getVal()F

    move-result v1

    invoke-virtual {p0}, Lcom/github/mikephil/charting/data/BarEntry;->getXIndex()I

    move-result v2

    invoke-virtual {p0}, Lcom/github/mikephil/charting/data/BarEntry;->getData()Ljava/lang/Object;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lcom/github/mikephil/charting/data/BarEntry;-><init>(FILjava/lang/Object;)V

    .line 77
    .local v0, "copied":Lcom/github/mikephil/charting/data/BarEntry;
    iget-object v1, p0, Lcom/github/mikephil/charting/data/BarEntry;->mVals:[F

    invoke-virtual {v0, v1}, Lcom/github/mikephil/charting/data/BarEntry;->setVals([F)V

    .line 78
    return-object v0
.end method

.method public bridge synthetic copy()Lcom/github/mikephil/charting/data/Entry;
    .registers 2

    .prologue
    .line 8
    invoke-virtual {p0}, Lcom/github/mikephil/charting/data/BarEntry;->copy()Lcom/github/mikephil/charting/data/BarEntry;

    move-result-object v0

    return-object v0
.end method

.method public getBelowSum(I)F
    .registers 5
    .param p1, "stackIndex"    # I

    .prologue
    .line 123
    iget-object v2, p0, Lcom/github/mikephil/charting/data/BarEntry;->mVals:[F

    if-nez v2, :cond_6

    .line 124
    const/4 v1, 0x0

    .line 134
    :cond_5
    return v1

    .line 126
    :cond_6
    const/4 v1, 0x0

    .line 127
    .local v1, "remainder":F
    iget-object v2, p0, Lcom/github/mikephil/charting/data/BarEntry;->mVals:[F

    array-length v2, v2

    add-int/lit8 v0, v2, -0x1

    .line 129
    .local v0, "index":I
    :goto_c
    if-le v0, p1, :cond_5

    if-ltz v0, :cond_5

    .line 130
    iget-object v2, p0, Lcom/github/mikephil/charting/data/BarEntry;->mVals:[F

    aget v2, v2, v0

    add-float/2addr v1, v2

    .line 131
    add-int/lit8 v0, v0, -0x1

    goto :goto_c
.end method

.method public getNegativeSum()F
    .registers 2

    .prologue
    .line 152
    iget v0, p0, Lcom/github/mikephil/charting/data/BarEntry;->mNegativeSum:F

    return v0
.end method

.method public getPositiveSum()F
    .registers 2

    .prologue
    .line 143
    iget v0, p0, Lcom/github/mikephil/charting/data/BarEntry;->mPositiveSum:F

    return v0
.end method

.method public getVal()F
    .registers 2

    .prologue
    .line 109
    invoke-super {p0}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v0

    return v0
.end method

.method public getVals()[F
    .registers 2

    .prologue
    .line 88
    iget-object v0, p0, Lcom/github/mikephil/charting/data/BarEntry;->mVals:[F

    return-object v0
.end method

.method public isStacked()Z
    .registers 2

    .prologue
    .line 118
    iget-object v0, p0, Lcom/github/mikephil/charting/data/BarEntry;->mVals:[F

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public setVals([F)V
    .registers 3
    .param p1, "vals"    # [F

    .prologue
    .line 97
    invoke-static {p1}, Lcom/github/mikephil/charting/data/BarEntry;->calcSum([F)F

    move-result v0

    invoke-virtual {p0, v0}, Lcom/github/mikephil/charting/data/BarEntry;->setVal(F)V

    .line 98
    iput-object p1, p0, Lcom/github/mikephil/charting/data/BarEntry;->mVals:[F

    .line 99
    invoke-direct {p0}, Lcom/github/mikephil/charting/data/BarEntry;->calcPosNegSum()V

    .line 100
    return-void
.end method
