.class public Lcom/github/mikephil/charting/data/CandleDataSet;
.super Lcom/github/mikephil/charting/data/LineScatterCandleRadarDataSet;
.source "CandleDataSet.java"

# interfaces
.implements Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/github/mikephil/charting/data/LineScatterCandleRadarDataSet",
        "<",
        "Lcom/github/mikephil/charting/data/CandleEntry;",
        ">;",
        "Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;"
    }
.end annotation


# instance fields
.field private mBarSpace:F

.field protected mDecreasingColor:I

.field protected mDecreasingPaintStyle:Landroid/graphics/Paint$Style;

.field protected mIncreasingColor:I

.field protected mIncreasingPaintStyle:Landroid/graphics/Paint$Style;

.field protected mNeutralColor:I

.field protected mShadowColor:I

.field private mShadowColorSameAsCandle:Z

.field private mShadowWidth:F

.field private mShowCandleBar:Z


# direct methods
.method public constructor <init>(Ljava/util/List;Ljava/lang/String;)V
    .registers 5
    .param p2, "label"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/github/mikephil/charting/data/CandleEntry;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .local p1, "yVals":Ljava/util/List;, "Ljava/util/List<Lcom/github/mikephil/charting/data/CandleEntry;>;"
    const v1, 0x112233

    .line 77
    invoke-direct {p0, p1, p2}, Lcom/github/mikephil/charting/data/LineScatterCandleRadarDataSet;-><init>(Ljava/util/List;Ljava/lang/String;)V

    .line 23
    const/high16 v0, 0x40400000    # 3.0f

    iput v0, p0, Lcom/github/mikephil/charting/data/CandleDataSet;->mShadowWidth:F

    .line 31
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/github/mikephil/charting/data/CandleDataSet;->mShowCandleBar:Z

    .line 36
    const v0, 0x3dcccccd    # 0.1f

    iput v0, p0, Lcom/github/mikephil/charting/data/CandleDataSet;->mBarSpace:F

    .line 41
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/github/mikephil/charting/data/CandleDataSet;->mShadowColorSameAsCandle:Z

    .line 47
    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    iput-object v0, p0, Lcom/github/mikephil/charting/data/CandleDataSet;->mIncreasingPaintStyle:Landroid/graphics/Paint$Style;

    .line 53
    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    iput-object v0, p0, Lcom/github/mikephil/charting/data/CandleDataSet;->mDecreasingPaintStyle:Landroid/graphics/Paint$Style;

    .line 58
    iput v1, p0, Lcom/github/mikephil/charting/data/CandleDataSet;->mNeutralColor:I

    .line 63
    iput v1, p0, Lcom/github/mikephil/charting/data/CandleDataSet;->mIncreasingColor:I

    .line 68
    iput v1, p0, Lcom/github/mikephil/charting/data/CandleDataSet;->mDecreasingColor:I

    .line 74
    iput v1, p0, Lcom/github/mikephil/charting/data/CandleDataSet;->mShadowColor:I

    .line 78
    return-void
.end method


# virtual methods
.method public calcMinMax(II)V
    .registers 8
    .param p1, "start"    # I
    .param p2, "end"    # I

    .prologue
    .line 106
    iget-object v3, p0, Lcom/github/mikephil/charting/data/CandleDataSet;->mYVals:Ljava/util/List;

    if-nez v3, :cond_5

    .line 132
    :cond_4
    return-void

    .line 109
    :cond_5
    iget-object v3, p0, Lcom/github/mikephil/charting/data/CandleDataSet;->mYVals:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-eqz v3, :cond_4

    .line 114
    if-eqz p2, :cond_17

    iget-object v3, p0, Lcom/github/mikephil/charting/data/CandleDataSet;->mYVals:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-lt p2, v3, :cond_57

    .line 115
    :cond_17
    iget-object v3, p0, Lcom/github/mikephil/charting/data/CandleDataSet;->mYVals:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v1, v3, -0x1

    .line 119
    .local v1, "endValue":I
    :goto_1f
    const v3, 0x7f7fffff    # Float.MAX_VALUE

    iput v3, p0, Lcom/github/mikephil/charting/data/CandleDataSet;->mYMin:F

    .line 120
    const v3, -0x800001

    iput v3, p0, Lcom/github/mikephil/charting/data/CandleDataSet;->mYMax:F

    .line 122
    move v2, p1

    .local v2, "i":I
    :goto_2a
    if-gt v2, v1, :cond_4

    .line 124
    iget-object v3, p0, Lcom/github/mikephil/charting/data/CandleDataSet;->mYVals:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/github/mikephil/charting/data/CandleEntry;

    .line 126
    .local v0, "e":Lcom/github/mikephil/charting/data/CandleEntry;
    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/CandleEntry;->getLow()F

    move-result v3

    iget v4, p0, Lcom/github/mikephil/charting/data/CandleDataSet;->mYMin:F

    cmpg-float v3, v3, v4

    if-gez v3, :cond_44

    .line 127
    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/CandleEntry;->getLow()F

    move-result v3

    iput v3, p0, Lcom/github/mikephil/charting/data/CandleDataSet;->mYMin:F

    .line 129
    :cond_44
    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/CandleEntry;->getHigh()F

    move-result v3

    iget v4, p0, Lcom/github/mikephil/charting/data/CandleDataSet;->mYMax:F

    cmpl-float v3, v3, v4

    if-lez v3, :cond_54

    .line 130
    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/CandleEntry;->getHigh()F

    move-result v3

    iput v3, p0, Lcom/github/mikephil/charting/data/CandleDataSet;->mYMax:F

    .line 122
    :cond_54
    add-int/lit8 v2, v2, 0x1

    goto :goto_2a

    .line 117
    .end local v0    # "e":Lcom/github/mikephil/charting/data/CandleEntry;
    .end local v1    # "endValue":I
    .end local v2    # "i":I
    :cond_57
    move v1, p2

    .restart local v1    # "endValue":I
    goto :goto_1f
.end method

.method public copy()Lcom/github/mikephil/charting/data/DataSet;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/github/mikephil/charting/data/DataSet",
            "<",
            "Lcom/github/mikephil/charting/data/CandleEntry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 83
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 85
    .local v2, "yVals":Ljava/util/List;, "Ljava/util/List<Lcom/github/mikephil/charting/data/CandleEntry;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_6
    iget-object v3, p0, Lcom/github/mikephil/charting/data/CandleDataSet;->mYVals:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v1, v3, :cond_20

    .line 86
    iget-object v3, p0, Lcom/github/mikephil/charting/data/CandleDataSet;->mYVals:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/github/mikephil/charting/data/CandleEntry;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/data/CandleEntry;->copy()Lcom/github/mikephil/charting/data/CandleEntry;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 85
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 89
    :cond_20
    new-instance v0, Lcom/github/mikephil/charting/data/CandleDataSet;

    invoke-virtual {p0}, Lcom/github/mikephil/charting/data/CandleDataSet;->getLabel()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Lcom/github/mikephil/charting/data/CandleDataSet;-><init>(Ljava/util/List;Ljava/lang/String;)V

    .line 90
    .local v0, "copied":Lcom/github/mikephil/charting/data/CandleDataSet;
    iget-object v3, p0, Lcom/github/mikephil/charting/data/CandleDataSet;->mColors:Ljava/util/List;

    iput-object v3, v0, Lcom/github/mikephil/charting/data/CandleDataSet;->mColors:Ljava/util/List;

    .line 91
    iget v3, p0, Lcom/github/mikephil/charting/data/CandleDataSet;->mShadowWidth:F

    iput v3, v0, Lcom/github/mikephil/charting/data/CandleDataSet;->mShadowWidth:F

    .line 92
    iget-boolean v3, p0, Lcom/github/mikephil/charting/data/CandleDataSet;->mShowCandleBar:Z

    iput-boolean v3, v0, Lcom/github/mikephil/charting/data/CandleDataSet;->mShowCandleBar:Z

    .line 93
    iget v3, p0, Lcom/github/mikephil/charting/data/CandleDataSet;->mBarSpace:F

    iput v3, v0, Lcom/github/mikephil/charting/data/CandleDataSet;->mBarSpace:F

    .line 94
    iget v3, p0, Lcom/github/mikephil/charting/data/CandleDataSet;->mHighLightColor:I

    iput v3, v0, Lcom/github/mikephil/charting/data/CandleDataSet;->mHighLightColor:I

    .line 95
    iget-object v3, p0, Lcom/github/mikephil/charting/data/CandleDataSet;->mIncreasingPaintStyle:Landroid/graphics/Paint$Style;

    iput-object v3, v0, Lcom/github/mikephil/charting/data/CandleDataSet;->mIncreasingPaintStyle:Landroid/graphics/Paint$Style;

    .line 96
    iget-object v3, p0, Lcom/github/mikephil/charting/data/CandleDataSet;->mDecreasingPaintStyle:Landroid/graphics/Paint$Style;

    iput-object v3, v0, Lcom/github/mikephil/charting/data/CandleDataSet;->mDecreasingPaintStyle:Landroid/graphics/Paint$Style;

    .line 97
    iget v3, p0, Lcom/github/mikephil/charting/data/CandleDataSet;->mShadowColor:I

    iput v3, v0, Lcom/github/mikephil/charting/data/CandleDataSet;->mShadowColor:I

    .line 99
    return-object v0
.end method

.method public getBarSpace()F
    .registers 2

    .prologue
    .line 152
    iget v0, p0, Lcom/github/mikephil/charting/data/CandleDataSet;->mBarSpace:F

    return v0
.end method

.method public getDecreasingColor()I
    .registers 2

    .prologue
    .line 237
    iget v0, p0, Lcom/github/mikephil/charting/data/CandleDataSet;->mDecreasingColor:I

    return v0
.end method

.method public getDecreasingPaintStyle()Landroid/graphics/Paint$Style;
    .registers 2

    .prologue
    .line 256
    iget-object v0, p0, Lcom/github/mikephil/charting/data/CandleDataSet;->mDecreasingPaintStyle:Landroid/graphics/Paint$Style;

    return-object v0
.end method

.method public getIncreasingColor()I
    .registers 2

    .prologue
    .line 222
    iget v0, p0, Lcom/github/mikephil/charting/data/CandleDataSet;->mIncreasingColor:I

    return v0
.end method

.method public getIncreasingPaintStyle()Landroid/graphics/Paint$Style;
    .registers 2

    .prologue
    .line 242
    iget-object v0, p0, Lcom/github/mikephil/charting/data/CandleDataSet;->mIncreasingPaintStyle:Landroid/graphics/Paint$Style;

    return-object v0
.end method

.method public getNeutralColor()I
    .registers 2

    .prologue
    .line 207
    iget v0, p0, Lcom/github/mikephil/charting/data/CandleDataSet;->mNeutralColor:I

    return v0
.end method

.method public getShadowColor()I
    .registers 2

    .prologue
    .line 270
    iget v0, p0, Lcom/github/mikephil/charting/data/CandleDataSet;->mShadowColor:I

    return v0
.end method

.method public getShadowColorSameAsCandle()Z
    .registers 2

    .prologue
    .line 284
    iget-boolean v0, p0, Lcom/github/mikephil/charting/data/CandleDataSet;->mShadowColorSameAsCandle:Z

    return v0
.end method

.method public getShadowWidth()F
    .registers 2

    .prologue
    .line 166
    iget v0, p0, Lcom/github/mikephil/charting/data/CandleDataSet;->mShadowWidth:F

    return v0
.end method

.method public getShowCandleBar()Z
    .registers 2

    .prologue
    .line 180
    iget-boolean v0, p0, Lcom/github/mikephil/charting/data/CandleDataSet;->mShowCandleBar:Z

    return v0
.end method

.method public setBarSpace(F)V
    .registers 3
    .param p1, "space"    # F

    .prologue
    .line 142
    const/4 v0, 0x0

    cmpg-float v0, p1, v0

    if-gez v0, :cond_6

    .line 143
    const/4 p1, 0x0

    .line 144
    :cond_6
    const v0, 0x3ee66666    # 0.45f

    cmpl-float v0, p1, v0

    if-lez v0, :cond_10

    .line 145
    const p1, 0x3ee66666    # 0.45f

    .line 147
    :cond_10
    iput p1, p0, Lcom/github/mikephil/charting/data/CandleDataSet;->mBarSpace:F

    .line 148
    return-void
.end method

.method public setDecreasingColor(I)V
    .registers 2
    .param p1, "color"    # I

    .prologue
    .line 232
    iput p1, p0, Lcom/github/mikephil/charting/data/CandleDataSet;->mDecreasingColor:I

    .line 233
    return-void
.end method

.method public setDecreasingPaintStyle(Landroid/graphics/Paint$Style;)V
    .registers 2
    .param p1, "decreasingPaintStyle"    # Landroid/graphics/Paint$Style;

    .prologue
    .line 265
    iput-object p1, p0, Lcom/github/mikephil/charting/data/CandleDataSet;->mDecreasingPaintStyle:Landroid/graphics/Paint$Style;

    .line 266
    return-void
.end method

.method public setIncreasingColor(I)V
    .registers 2
    .param p1, "color"    # I

    .prologue
    .line 217
    iput p1, p0, Lcom/github/mikephil/charting/data/CandleDataSet;->mIncreasingColor:I

    .line 218
    return-void
.end method

.method public setIncreasingPaintStyle(Landroid/graphics/Paint$Style;)V
    .registers 2
    .param p1, "paintStyle"    # Landroid/graphics/Paint$Style;

    .prologue
    .line 251
    iput-object p1, p0, Lcom/github/mikephil/charting/data/CandleDataSet;->mIncreasingPaintStyle:Landroid/graphics/Paint$Style;

    .line 252
    return-void
.end method

.method public setNeutralColor(I)V
    .registers 2
    .param p1, "color"    # I

    .prologue
    .line 202
    iput p1, p0, Lcom/github/mikephil/charting/data/CandleDataSet;->mNeutralColor:I

    .line 203
    return-void
.end method

.method public setShadowColor(I)V
    .registers 2
    .param p1, "shadowColor"    # I

    .prologue
    .line 279
    iput p1, p0, Lcom/github/mikephil/charting/data/CandleDataSet;->mShadowColor:I

    .line 280
    return-void
.end method

.method public setShadowColorSameAsCandle(Z)V
    .registers 2
    .param p1, "shadowColorSameAsCandle"    # Z

    .prologue
    .line 293
    iput-boolean p1, p0, Lcom/github/mikephil/charting/data/CandleDataSet;->mShadowColorSameAsCandle:Z

    .line 294
    return-void
.end method

.method public setShadowWidth(F)V
    .registers 3
    .param p1, "width"    # F

    .prologue
    .line 161
    invoke-static {p1}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/data/CandleDataSet;->mShadowWidth:F

    .line 162
    return-void
.end method

.method public setShowCandleBar(Z)V
    .registers 2
    .param p1, "showCandleBar"    # Z

    .prologue
    .line 175
    iput-boolean p1, p0, Lcom/github/mikephil/charting/data/CandleDataSet;->mShowCandleBar:Z

    .line 176
    return-void
.end method
