.class public Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;
.super Lcom/github/mikephil/charting/data/realm/base/RealmLineScatterCandleRadarDataSet;
.source "RealmCandleDataSet.java"

# interfaces
.implements Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lio/realm/RealmObject;",
        ">",
        "Lcom/github/mikephil/charting/data/realm/base/RealmLineScatterCandleRadarDataSet",
        "<TT;",
        "Lcom/github/mikephil/charting/data/CandleEntry;",
        ">;",
        "Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;"
    }
.end annotation


# instance fields
.field private mBarSpace:F

.field private mCloseField:Ljava/lang/String;

.field protected mDecreasingColor:I

.field protected mDecreasingPaintStyle:Landroid/graphics/Paint$Style;

.field private mHighField:Ljava/lang/String;

.field protected mIncreasingColor:I

.field protected mIncreasingPaintStyle:Landroid/graphics/Paint$Style;

.field private mLowField:Ljava/lang/String;

.field protected mNeutralColor:I

.field private mOpenField:Ljava/lang/String;

.field protected mShadowColor:I

.field private mShadowColorSameAsCandle:Z

.field private mShadowWidth:F

.field private mShowCandleBar:Z


# direct methods
.method public constructor <init>(Lio/realm/RealmResults;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 9
    .param p2, "highField"    # Ljava/lang/String;
    .param p3, "lowField"    # Ljava/lang/String;
    .param p4, "openField"    # Ljava/lang/String;
    .param p5, "closeField"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/realm/RealmResults",
            "<TT;>;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet<TT;>;"
    .local p1, "result":Lio/realm/RealmResults;, "Lio/realm/RealmResults<TT;>;"
    const/4 v2, 0x0

    const v1, 0x112233

    .line 92
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/github/mikephil/charting/data/realm/base/RealmLineScatterCandleRadarDataSet;-><init>(Lio/realm/RealmResults;Ljava/lang/String;)V

    .line 29
    const/high16 v0, 0x40400000    # 3.0f

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mShadowWidth:F

    .line 37
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mShowCandleBar:Z

    .line 42
    const v0, 0x3dcccccd    # 0.1f

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mBarSpace:F

    .line 47
    iput-boolean v2, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mShadowColorSameAsCandle:Z

    .line 53
    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    iput-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mIncreasingPaintStyle:Landroid/graphics/Paint$Style;

    .line 59
    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    iput-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mDecreasingPaintStyle:Landroid/graphics/Paint$Style;

    .line 64
    iput v1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mNeutralColor:I

    .line 69
    iput v1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mIncreasingColor:I

    .line 74
    iput v1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mDecreasingColor:I

    .line 80
    iput v1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mShadowColor:I

    .line 93
    iput-object p2, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mHighField:Ljava/lang/String;

    .line 94
    iput-object p3, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mLowField:Ljava/lang/String;

    .line 95
    iput-object p4, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mOpenField:Ljava/lang/String;

    .line 96
    iput-object p5, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mCloseField:Ljava/lang/String;

    .line 98
    iget-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->results:Lio/realm/RealmResults;

    invoke-virtual {p0, v0}, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->build(Lio/realm/RealmResults;)V

    .line 99
    iget-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->results:Lio/realm/RealmResults;

    invoke-virtual {v0}, Lio/realm/RealmResults;->size()I

    move-result v0

    invoke-virtual {p0, v2, v0}, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->calcMinMax(II)V

    .line 100
    return-void
.end method

.method public constructor <init>(Lio/realm/RealmResults;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 10
    .param p2, "highField"    # Ljava/lang/String;
    .param p3, "lowField"    # Ljava/lang/String;
    .param p4, "openField"    # Ljava/lang/String;
    .param p5, "closeField"    # Ljava/lang/String;
    .param p6, "xIndexField"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/realm/RealmResults",
            "<TT;>;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet<TT;>;"
    .local p1, "result":Lio/realm/RealmResults;, "Lio/realm/RealmResults<TT;>;"
    const/4 v2, 0x0

    const v1, 0x112233

    .line 113
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p6}, Lcom/github/mikephil/charting/data/realm/base/RealmLineScatterCandleRadarDataSet;-><init>(Lio/realm/RealmResults;Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    const/high16 v0, 0x40400000    # 3.0f

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mShadowWidth:F

    .line 37
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mShowCandleBar:Z

    .line 42
    const v0, 0x3dcccccd    # 0.1f

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mBarSpace:F

    .line 47
    iput-boolean v2, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mShadowColorSameAsCandle:Z

    .line 53
    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    iput-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mIncreasingPaintStyle:Landroid/graphics/Paint$Style;

    .line 59
    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    iput-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mDecreasingPaintStyle:Landroid/graphics/Paint$Style;

    .line 64
    iput v1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mNeutralColor:I

    .line 69
    iput v1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mIncreasingColor:I

    .line 74
    iput v1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mDecreasingColor:I

    .line 80
    iput v1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mShadowColor:I

    .line 114
    iput-object p2, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mHighField:Ljava/lang/String;

    .line 115
    iput-object p3, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mLowField:Ljava/lang/String;

    .line 116
    iput-object p4, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mOpenField:Ljava/lang/String;

    .line 117
    iput-object p5, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mCloseField:Ljava/lang/String;

    .line 119
    iget-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->results:Lio/realm/RealmResults;

    invoke-virtual {p0, v0}, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->build(Lio/realm/RealmResults;)V

    .line 120
    iget-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->results:Lio/realm/RealmResults;

    invoke-virtual {v0}, Lio/realm/RealmResults;->size()I

    move-result v0

    invoke-virtual {p0, v2, v0}, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->calcMinMax(II)V

    .line 121
    return-void
.end method


# virtual methods
.method public buildEntryFromResultObject(Lio/realm/RealmObject;I)Lcom/github/mikephil/charting/data/CandleEntry;
    .registers 10
    .param p2, "xIndex"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;I)",
            "Lcom/github/mikephil/charting/data/CandleEntry;"
        }
    .end annotation

    .prologue
    .line 124
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet<TT;>;"
    .local p1, "realmObject":Lio/realm/RealmObject;, "TT;"
    new-instance v6, Lio/realm/DynamicRealmObject;

    invoke-direct {v6, p1}, Lio/realm/DynamicRealmObject;-><init>(Lio/realm/RealmObject;)V

    .line 126
    .local v6, "dynamicObject":Lio/realm/DynamicRealmObject;
    new-instance v0, Lcom/github/mikephil/charting/data/CandleEntry;

    iget-object v1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mIndexField:Ljava/lang/String;

    if-nez v1, :cond_28

    move v1, p2

    :goto_c
    iget-object v2, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mHighField:Ljava/lang/String;

    invoke-virtual {v6, v2}, Lio/realm/DynamicRealmObject;->getFloat(Ljava/lang/String;)F

    move-result v2

    iget-object v3, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mLowField:Ljava/lang/String;

    invoke-virtual {v6, v3}, Lio/realm/DynamicRealmObject;->getFloat(Ljava/lang/String;)F

    move-result v3

    iget-object v4, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mOpenField:Ljava/lang/String;

    invoke-virtual {v6, v4}, Lio/realm/DynamicRealmObject;->getFloat(Ljava/lang/String;)F

    move-result v4

    iget-object v5, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mCloseField:Ljava/lang/String;

    invoke-virtual {v6, v5}, Lio/realm/DynamicRealmObject;->getFloat(Ljava/lang/String;)F

    move-result v5

    invoke-direct/range {v0 .. v5}, Lcom/github/mikephil/charting/data/CandleEntry;-><init>(IFFFF)V

    return-object v0

    :cond_28
    iget-object v1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mIndexField:Ljava/lang/String;

    invoke-virtual {v6, v1}, Lio/realm/DynamicRealmObject;->getInt(Ljava/lang/String;)I

    move-result v1

    goto :goto_c
.end method

.method public bridge synthetic buildEntryFromResultObject(Lio/realm/RealmObject;I)Lcom/github/mikephil/charting/data/Entry;
    .registers 4
    .param p1, "x0"    # Lio/realm/RealmObject;
    .param p2, "x1"    # I

    .prologue
    .line 19
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet<TT;>;"
    invoke-virtual {p0, p1, p2}, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->buildEntryFromResultObject(Lio/realm/RealmObject;I)Lcom/github/mikephil/charting/data/CandleEntry;

    move-result-object v0

    return-object v0
.end method

.method public calcMinMax(II)V
    .registers 8
    .param p1, "start"    # I
    .param p2, "end"    # I

    .prologue
    .line 137
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet<TT;>;"
    iget-object v3, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mValues:Ljava/util/List;

    if-nez v3, :cond_5

    .line 163
    :cond_4
    return-void

    .line 140
    :cond_5
    iget-object v3, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mValues:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-eqz v3, :cond_4

    .line 145
    if-eqz p2, :cond_17

    iget-object v3, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mValues:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-lt p2, v3, :cond_57

    .line 146
    :cond_17
    iget-object v3, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mValues:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v1, v3, -0x1

    .line 150
    .local v1, "endValue":I
    :goto_1f
    const v3, 0x7f7fffff    # Float.MAX_VALUE

    iput v3, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mYMin:F

    .line 151
    const v3, -0x800001

    iput v3, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mYMax:F

    .line 153
    move v2, p1

    .local v2, "i":I
    :goto_2a
    if-gt v2, v1, :cond_4

    .line 155
    iget-object v3, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mValues:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/github/mikephil/charting/data/CandleEntry;

    .line 157
    .local v0, "e":Lcom/github/mikephil/charting/data/CandleEntry;
    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/CandleEntry;->getLow()F

    move-result v3

    iget v4, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mYMin:F

    cmpg-float v3, v3, v4

    if-gez v3, :cond_44

    .line 158
    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/CandleEntry;->getLow()F

    move-result v3

    iput v3, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mYMin:F

    .line 160
    :cond_44
    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/CandleEntry;->getHigh()F

    move-result v3

    iget v4, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mYMax:F

    cmpl-float v3, v3, v4

    if-lez v3, :cond_54

    .line 161
    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/CandleEntry;->getHigh()F

    move-result v3

    iput v3, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mYMax:F

    .line 153
    :cond_54
    add-int/lit8 v2, v2, 0x1

    goto :goto_2a

    .line 148
    .end local v0    # "e":Lcom/github/mikephil/charting/data/CandleEntry;
    .end local v1    # "endValue":I
    .end local v2    # "i":I
    :cond_57
    move v1, p2

    .restart local v1    # "endValue":I
    goto :goto_1f
.end method

.method public getBarSpace()F
    .registers 2

    .prologue
    .line 183
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mBarSpace:F

    return v0
.end method

.method public getDecreasingColor()I
    .registers 2

    .prologue
    .line 259
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mDecreasingColor:I

    return v0
.end method

.method public getDecreasingPaintStyle()Landroid/graphics/Paint$Style;
    .registers 2

    .prologue
    .line 278
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mDecreasingPaintStyle:Landroid/graphics/Paint$Style;

    return-object v0
.end method

.method public getIncreasingColor()I
    .registers 2

    .prologue
    .line 244
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mIncreasingColor:I

    return v0
.end method

.method public getIncreasingPaintStyle()Landroid/graphics/Paint$Style;
    .registers 2

    .prologue
    .line 264
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mIncreasingPaintStyle:Landroid/graphics/Paint$Style;

    return-object v0
.end method

.method public getNeutralColor()I
    .registers 2

    .prologue
    .line 229
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mNeutralColor:I

    return v0
.end method

.method public getShadowColor()I
    .registers 2

    .prologue
    .line 292
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mShadowColor:I

    return v0
.end method

.method public getShadowColorSameAsCandle()Z
    .registers 2

    .prologue
    .line 306
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet<TT;>;"
    iget-boolean v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mShadowColorSameAsCandle:Z

    return v0
.end method

.method public getShadowWidth()F
    .registers 2

    .prologue
    .line 197
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mShadowWidth:F

    return v0
.end method

.method public getShowCandleBar()Z
    .registers 2

    .prologue
    .line 211
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet<TT;>;"
    iget-boolean v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mShowCandleBar:Z

    return v0
.end method

.method public setBarSpace(F)V
    .registers 3
    .param p1, "space"    # F

    .prologue
    .line 173
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet<TT;>;"
    const/4 v0, 0x0

    cmpg-float v0, p1, v0

    if-gez v0, :cond_6

    .line 174
    const/4 p1, 0x0

    .line 175
    :cond_6
    const v0, 0x3ee66666    # 0.45f

    cmpl-float v0, p1, v0

    if-lez v0, :cond_10

    .line 176
    const p1, 0x3ee66666    # 0.45f

    .line 178
    :cond_10
    iput p1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mBarSpace:F

    .line 179
    return-void
.end method

.method public setDecreasingColor(I)V
    .registers 2
    .param p1, "color"    # I

    .prologue
    .line 254
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet<TT;>;"
    iput p1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mDecreasingColor:I

    .line 255
    return-void
.end method

.method public setDecreasingPaintStyle(Landroid/graphics/Paint$Style;)V
    .registers 2
    .param p1, "decreasingPaintStyle"    # Landroid/graphics/Paint$Style;

    .prologue
    .line 287
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet<TT;>;"
    iput-object p1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mDecreasingPaintStyle:Landroid/graphics/Paint$Style;

    .line 288
    return-void
.end method

.method public setIncreasingColor(I)V
    .registers 2
    .param p1, "color"    # I

    .prologue
    .line 239
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet<TT;>;"
    iput p1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mIncreasingColor:I

    .line 240
    return-void
.end method

.method public setIncreasingPaintStyle(Landroid/graphics/Paint$Style;)V
    .registers 2
    .param p1, "paintStyle"    # Landroid/graphics/Paint$Style;

    .prologue
    .line 273
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet<TT;>;"
    iput-object p1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mIncreasingPaintStyle:Landroid/graphics/Paint$Style;

    .line 274
    return-void
.end method

.method public setNeutralColor(I)V
    .registers 2
    .param p1, "color"    # I

    .prologue
    .line 224
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet<TT;>;"
    iput p1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mNeutralColor:I

    .line 225
    return-void
.end method

.method public setShadowColor(I)V
    .registers 2
    .param p1, "shadowColor"    # I

    .prologue
    .line 301
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet<TT;>;"
    iput p1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mShadowColor:I

    .line 302
    return-void
.end method

.method public setShadowColorSameAsCandle(Z)V
    .registers 2
    .param p1, "shadowColorSameAsCandle"    # Z

    .prologue
    .line 315
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet<TT;>;"
    iput-boolean p1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mShadowColorSameAsCandle:Z

    .line 316
    return-void
.end method

.method public setShadowWidth(F)V
    .registers 3
    .param p1, "width"    # F

    .prologue
    .line 192
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet<TT;>;"
    invoke-static {p1}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mShadowWidth:F

    .line 193
    return-void
.end method

.method public setShowCandleBar(Z)V
    .registers 2
    .param p1, "showCandleBar"    # Z

    .prologue
    .line 206
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet<TT;>;"
    iput-boolean p1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmCandleDataSet;->mShowCandleBar:Z

    .line 207
    return-void
.end method
