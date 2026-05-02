.class public Lcom/github/mikephil/charting/data/BarDataSet;
.super Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleDataSet;
.source "BarDataSet.java"

# interfaces
.implements Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleDataSet",
        "<",
        "Lcom/github/mikephil/charting/data/BarEntry;",
        ">;",
        "Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;"
    }
.end annotation


# instance fields
.field private mBarBorderColor:I

.field private mBarBorderWidth:F

.field private mBarShadowColor:I

.field private mBarSpace:F

.field private mEntryCountStacks:I

.field private mHighLightAlpha:I

.field private mStackLabels:[Ljava/lang/String;

.field private mStackSize:I


# direct methods
.method public constructor <init>(Ljava/util/List;Ljava/lang/String;)V
    .registers 7
    .param p2, "label"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/github/mikephil/charting/data/BarEntry;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .local p1, "yVals":Ljava/util/List;, "Ljava/util/List<Lcom/github/mikephil/charting/data/BarEntry;>;"
    const/4 v3, 0x1

    const/16 v1, 0xd7

    const/4 v2, 0x0

    .line 51
    invoke-direct {p0, p1, p2}, Lcom/github/mikephil/charting/data/BarLineScatterCandleBubbleDataSet;-><init>(Ljava/util/List;Ljava/lang/String;)V

    .line 16
    const v0, 0x3e19999a    # 0.15f

    iput v0, p0, Lcom/github/mikephil/charting/data/BarDataSet;->mBarSpace:F

    .line 22
    iput v3, p0, Lcom/github/mikephil/charting/data/BarDataSet;->mStackSize:I

    .line 27
    invoke-static {v1, v1, v1}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/data/BarDataSet;->mBarShadowColor:I

    .line 29
    const/4 v0, 0x0

    iput v0, p0, Lcom/github/mikephil/charting/data/BarDataSet;->mBarBorderWidth:F

    .line 31
    const/high16 v0, -0x1000000

    iput v0, p0, Lcom/github/mikephil/charting/data/BarDataSet;->mBarBorderColor:I

    .line 36
    const/16 v0, 0x78

    iput v0, p0, Lcom/github/mikephil/charting/data/BarDataSet;->mHighLightAlpha:I

    .line 41
    iput v2, p0, Lcom/github/mikephil/charting/data/BarDataSet;->mEntryCountStacks:I

    .line 46
    new-array v0, v3, [Ljava/lang/String;

    const-string v1, "Stack"

    aput-object v1, v0, v2

    iput-object v0, p0, Lcom/github/mikephil/charting/data/BarDataSet;->mStackLabels:[Ljava/lang/String;

    .line 53
    invoke-static {v2, v2, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/data/BarDataSet;->mHighLightColor:I

    .line 55
    invoke-direct {p0, p1}, Lcom/github/mikephil/charting/data/BarDataSet;->calcStackSize(Ljava/util/List;)V

    .line 56
    invoke-direct {p0, p1}, Lcom/github/mikephil/charting/data/BarDataSet;->calcEntryCountIncludingStacks(Ljava/util/List;)V

    .line 57
    return-void
.end method

.method private calcEntryCountIncludingStacks(Ljava/util/List;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/github/mikephil/charting/data/BarEntry;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 86
    .local p1, "yVals":Ljava/util/List;, "Ljava/util/List<Lcom/github/mikephil/charting/data/BarEntry;>;"
    const/4 v2, 0x0

    iput v2, p0, Lcom/github/mikephil/charting/data/BarDataSet;->mEntryCountStacks:I

    .line 88
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_4
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_26

    .line 90
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/github/mikephil/charting/data/BarEntry;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/data/BarEntry;->getVals()[F

    move-result-object v1

    .line 92
    .local v1, "vals":[F
    if-nez v1, :cond_1f

    .line 93
    iget v2, p0, Lcom/github/mikephil/charting/data/BarDataSet;->mEntryCountStacks:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/github/mikephil/charting/data/BarDataSet;->mEntryCountStacks:I

    .line 88
    :goto_1c
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 95
    :cond_1f
    iget v2, p0, Lcom/github/mikephil/charting/data/BarDataSet;->mEntryCountStacks:I

    array-length v3, v1

    add-int/2addr v2, v3

    iput v2, p0, Lcom/github/mikephil/charting/data/BarDataSet;->mEntryCountStacks:I

    goto :goto_1c

    .line 97
    .end local v1    # "vals":[F
    :cond_26
    return-void
.end method

.method private calcStackSize(Ljava/util/List;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/github/mikephil/charting/data/BarEntry;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 105
    .local p1, "yVals":Ljava/util/List;, "Ljava/util/List<Lcom/github/mikephil/charting/data/BarEntry;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_1e

    .line 107
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/github/mikephil/charting/data/BarEntry;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/data/BarEntry;->getVals()[F

    move-result-object v1

    .line 109
    .local v1, "vals":[F
    if-eqz v1, :cond_1b

    array-length v2, v1

    iget v3, p0, Lcom/github/mikephil/charting/data/BarDataSet;->mStackSize:I

    if-le v2, v3, :cond_1b

    .line 110
    array-length v2, v1

    iput v2, p0, Lcom/github/mikephil/charting/data/BarDataSet;->mStackSize:I

    .line 105
    :cond_1b
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 112
    .end local v1    # "vals":[F
    :cond_1e
    return-void
.end method


# virtual methods
.method public calcMinMax(II)V
    .registers 11
    .param p1, "start"    # I
    .param p2, "end"    # I

    .prologue
    const v7, 0x7f7fffff    # Float.MAX_VALUE

    const/4 v6, 0x0

    .line 117
    iget-object v4, p0, Lcom/github/mikephil/charting/data/BarDataSet;->mYVals:Ljava/util/List;

    if-nez v4, :cond_9

    .line 163
    :cond_8
    :goto_8
    return-void

    .line 120
    :cond_9
    iget-object v4, p0, Lcom/github/mikephil/charting/data/BarDataSet;->mYVals:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v3

    .line 122
    .local v3, "yValCount":I
    if-eqz v3, :cond_8

    .line 127
    if-eqz p2, :cond_15

    if-lt p2, v3, :cond_5e

    .line 128
    :cond_15
    add-int/lit8 v1, v3, -0x1

    .line 132
    .local v1, "endValue":I
    :goto_17
    iput v7, p0, Lcom/github/mikephil/charting/data/BarDataSet;->mYMin:F

    .line 133
    const v4, -0x800001

    iput v4, p0, Lcom/github/mikephil/charting/data/BarDataSet;->mYMax:F

    .line 135
    move v2, p1

    .local v2, "i":I
    :goto_1f
    if-gt v2, v1, :cond_83

    .line 137
    iget-object v4, p0, Lcom/github/mikephil/charting/data/BarDataSet;->mYVals:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/github/mikephil/charting/data/BarEntry;

    .line 139
    .local v0, "e":Lcom/github/mikephil/charting/data/BarEntry;
    if-eqz v0, :cond_5b

    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/BarEntry;->getVal()F

    move-result v4

    invoke-static {v4}, Ljava/lang/Float;->isNaN(F)Z

    move-result v4

    if-nez v4, :cond_5b

    .line 141
    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/BarEntry;->getVals()[F

    move-result-object v4

    if-nez v4, :cond_60

    .line 143
    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/BarEntry;->getVal()F

    move-result v4

    iget v5, p0, Lcom/github/mikephil/charting/data/BarDataSet;->mYMin:F

    cmpg-float v4, v4, v5

    if-gez v4, :cond_4b

    .line 144
    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/BarEntry;->getVal()F

    move-result v4

    iput v4, p0, Lcom/github/mikephil/charting/data/BarDataSet;->mYMin:F

    .line 146
    :cond_4b
    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/BarEntry;->getVal()F

    move-result v4

    iget v5, p0, Lcom/github/mikephil/charting/data/BarDataSet;->mYMax:F

    cmpl-float v4, v4, v5

    if-lez v4, :cond_5b

    .line 147
    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/BarEntry;->getVal()F

    move-result v4

    iput v4, p0, Lcom/github/mikephil/charting/data/BarDataSet;->mYMax:F

    .line 135
    :cond_5b
    :goto_5b
    add-int/lit8 v2, v2, 0x1

    goto :goto_1f

    .line 130
    .end local v0    # "e":Lcom/github/mikephil/charting/data/BarEntry;
    .end local v1    # "endValue":I
    .end local v2    # "i":I
    :cond_5e
    move v1, p2

    .restart local v1    # "endValue":I
    goto :goto_17

    .line 150
    .restart local v0    # "e":Lcom/github/mikephil/charting/data/BarEntry;
    .restart local v2    # "i":I
    :cond_60
    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/BarEntry;->getNegativeSum()F

    move-result v4

    neg-float v4, v4

    iget v5, p0, Lcom/github/mikephil/charting/data/BarDataSet;->mYMin:F

    cmpg-float v4, v4, v5

    if-gez v4, :cond_72

    .line 151
    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/BarEntry;->getNegativeSum()F

    move-result v4

    neg-float v4, v4

    iput v4, p0, Lcom/github/mikephil/charting/data/BarDataSet;->mYMin:F

    .line 153
    :cond_72
    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/BarEntry;->getPositiveSum()F

    move-result v4

    iget v5, p0, Lcom/github/mikephil/charting/data/BarDataSet;->mYMax:F

    cmpl-float v4, v4, v5

    if-lez v4, :cond_5b

    .line 154
    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/BarEntry;->getPositiveSum()F

    move-result v4

    iput v4, p0, Lcom/github/mikephil/charting/data/BarDataSet;->mYMax:F

    goto :goto_5b

    .line 159
    .end local v0    # "e":Lcom/github/mikephil/charting/data/BarEntry;
    :cond_83
    iget v4, p0, Lcom/github/mikephil/charting/data/BarDataSet;->mYMin:F

    cmpl-float v4, v4, v7

    if-nez v4, :cond_8

    .line 160
    iput v6, p0, Lcom/github/mikephil/charting/data/BarDataSet;->mYMin:F

    .line 161
    iput v6, p0, Lcom/github/mikephil/charting/data/BarDataSet;->mYMax:F

    goto/16 :goto_8
.end method

.method public copy()Lcom/github/mikephil/charting/data/DataSet;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/github/mikephil/charting/data/DataSet",
            "<",
            "Lcom/github/mikephil/charting/data/BarEntry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 62
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 64
    .local v2, "yVals":Ljava/util/List;, "Ljava/util/List<Lcom/github/mikephil/charting/data/BarEntry;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_6
    iget-object v3, p0, Lcom/github/mikephil/charting/data/BarDataSet;->mYVals:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v1, v3, :cond_20

    .line 65
    iget-object v3, p0, Lcom/github/mikephil/charting/data/BarDataSet;->mYVals:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/github/mikephil/charting/data/BarEntry;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/data/BarEntry;->copy()Lcom/github/mikephil/charting/data/BarEntry;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 64
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 68
    :cond_20
    new-instance v0, Lcom/github/mikephil/charting/data/BarDataSet;

    invoke-virtual {p0}, Lcom/github/mikephil/charting/data/BarDataSet;->getLabel()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Lcom/github/mikephil/charting/data/BarDataSet;-><init>(Ljava/util/List;Ljava/lang/String;)V

    .line 69
    .local v0, "copied":Lcom/github/mikephil/charting/data/BarDataSet;
    iget-object v3, p0, Lcom/github/mikephil/charting/data/BarDataSet;->mColors:Ljava/util/List;

    iput-object v3, v0, Lcom/github/mikephil/charting/data/BarDataSet;->mColors:Ljava/util/List;

    .line 70
    iget v3, p0, Lcom/github/mikephil/charting/data/BarDataSet;->mStackSize:I

    iput v3, v0, Lcom/github/mikephil/charting/data/BarDataSet;->mStackSize:I

    .line 71
    iget v3, p0, Lcom/github/mikephil/charting/data/BarDataSet;->mBarSpace:F

    iput v3, v0, Lcom/github/mikephil/charting/data/BarDataSet;->mBarSpace:F

    .line 72
    iget v3, p0, Lcom/github/mikephil/charting/data/BarDataSet;->mBarShadowColor:I

    iput v3, v0, Lcom/github/mikephil/charting/data/BarDataSet;->mBarShadowColor:I

    .line 73
    iget-object v3, p0, Lcom/github/mikephil/charting/data/BarDataSet;->mStackLabels:[Ljava/lang/String;

    iput-object v3, v0, Lcom/github/mikephil/charting/data/BarDataSet;->mStackLabels:[Ljava/lang/String;

    .line 74
    iget v3, p0, Lcom/github/mikephil/charting/data/BarDataSet;->mHighLightColor:I

    iput v3, v0, Lcom/github/mikephil/charting/data/BarDataSet;->mHighLightColor:I

    .line 75
    iget v3, p0, Lcom/github/mikephil/charting/data/BarDataSet;->mHighLightAlpha:I

    iput v3, v0, Lcom/github/mikephil/charting/data/BarDataSet;->mHighLightAlpha:I

    .line 77
    return-object v0
.end method

.method public getBarBorderColor()I
    .registers 2

    .prologue
    .line 261
    iget v0, p0, Lcom/github/mikephil/charting/data/BarDataSet;->mBarBorderColor:I

    return v0
.end method

.method public getBarBorderWidth()F
    .registers 2

    .prologue
    .line 242
    iget v0, p0, Lcom/github/mikephil/charting/data/BarDataSet;->mBarBorderWidth:F

    return v0
.end method

.method public getBarShadowColor()I
    .registers 2

    .prologue
    .line 221
    iget v0, p0, Lcom/github/mikephil/charting/data/BarDataSet;->mBarShadowColor:I

    return v0
.end method

.method public getBarSpace()F
    .registers 2

    .prologue
    .line 196
    iget v0, p0, Lcom/github/mikephil/charting/data/BarDataSet;->mBarSpace:F

    return v0
.end method

.method public getBarSpacePercent()F
    .registers 3

    .prologue
    .line 191
    iget v0, p0, Lcom/github/mikephil/charting/data/BarDataSet;->mBarSpace:F

    const/high16 v1, 0x42c80000    # 100.0f

    mul-float/2addr v0, v1

    return v0
.end method

.method public getEntryCountStacks()I
    .registers 2

    .prologue
    .line 182
    iget v0, p0, Lcom/github/mikephil/charting/data/BarDataSet;->mEntryCountStacks:I

    return v0
.end method

.method public getHighLightAlpha()I
    .registers 2

    .prologue
    .line 276
    iget v0, p0, Lcom/github/mikephil/charting/data/BarDataSet;->mHighLightAlpha:I

    return v0
.end method

.method public getStackLabels()[Ljava/lang/String;
    .registers 2

    .prologue
    .line 290
    iget-object v0, p0, Lcom/github/mikephil/charting/data/BarDataSet;->mStackLabels:[Ljava/lang/String;

    return-object v0
.end method

.method public getStackSize()I
    .registers 2

    .prologue
    .line 167
    iget v0, p0, Lcom/github/mikephil/charting/data/BarDataSet;->mStackSize:I

    return v0
.end method

.method public isStacked()Z
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 172
    iget v1, p0, Lcom/github/mikephil/charting/data/BarDataSet;->mStackSize:I

    if-le v1, v0, :cond_6

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public setBarBorderColor(I)V
    .registers 2
    .param p1, "color"    # I

    .prologue
    .line 251
    iput p1, p0, Lcom/github/mikephil/charting/data/BarDataSet;->mBarBorderColor:I

    .line 252
    return-void
.end method

.method public setBarBorderWidth(F)V
    .registers 2
    .param p1, "width"    # F

    .prologue
    .line 231
    iput p1, p0, Lcom/github/mikephil/charting/data/BarDataSet;->mBarBorderWidth:F

    .line 232
    return-void
.end method

.method public setBarShadowColor(I)V
    .registers 2
    .param p1, "color"    # I

    .prologue
    .line 216
    iput p1, p0, Lcom/github/mikephil/charting/data/BarDataSet;->mBarShadowColor:I

    .line 217
    return-void
.end method

.method public setBarSpacePercent(F)V
    .registers 3
    .param p1, "percent"    # F

    .prologue
    .line 205
    const/high16 v0, 0x42c80000    # 100.0f

    div-float v0, p1, v0

    iput v0, p0, Lcom/github/mikephil/charting/data/BarDataSet;->mBarSpace:F

    .line 206
    return-void
.end method

.method public setHighLightAlpha(I)V
    .registers 2
    .param p1, "alpha"    # I

    .prologue
    .line 271
    iput p1, p0, Lcom/github/mikephil/charting/data/BarDataSet;->mHighLightAlpha:I

    .line 272
    return-void
.end method

.method public setStackLabels([Ljava/lang/String;)V
    .registers 2
    .param p1, "labels"    # [Ljava/lang/String;

    .prologue
    .line 285
    iput-object p1, p0, Lcom/github/mikephil/charting/data/BarDataSet;->mStackLabels:[Ljava/lang/String;

    .line 286
    return-void
.end method
