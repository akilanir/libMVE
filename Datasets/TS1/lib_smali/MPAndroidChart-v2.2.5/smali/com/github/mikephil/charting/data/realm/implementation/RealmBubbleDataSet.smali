.class public Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;
.super Lcom/github/mikephil/charting/data/realm/base/RealmBarLineScatterCandleBubbleDataSet;
.source "RealmBubbleDataSet.java"

# interfaces
.implements Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lio/realm/RealmObject;",
        ">",
        "Lcom/github/mikephil/charting/data/realm/base/RealmBarLineScatterCandleBubbleDataSet",
        "<TT;",
        "Lcom/github/mikephil/charting/data/BubbleEntry;",
        ">;",
        "Lcom/github/mikephil/charting/interfaces/datasets/IBubbleDataSet;"
    }
.end annotation


# instance fields
.field private mHighlightCircleWidth:F

.field protected mMaxSize:F

.field protected mNormalizeSize:Z

.field private mSizeField:Ljava/lang/String;

.field protected mXMax:F

.field protected mXMin:F


# direct methods
.method public constructor <init>(Lio/realm/RealmResults;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p2, "yValuesField"    # Ljava/lang/String;
    .param p3, "sizeField"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/realm/RealmResults",
            "<TT;>;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 35
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet<TT;>;"
    .local p1, "result":Lio/realm/RealmResults;, "Lio/realm/RealmResults<TT;>;"
    invoke-direct {p0, p1, p2}, Lcom/github/mikephil/charting/data/realm/base/RealmBarLineScatterCandleBubbleDataSet;-><init>(Lio/realm/RealmResults;Ljava/lang/String;)V

    .line 23
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;->mNormalizeSize:Z

    .line 25
    const/high16 v0, 0x40200000    # 2.5f

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;->mHighlightCircleWidth:F

    .line 36
    iput-object p3, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;->mSizeField:Ljava/lang/String;

    .line 38
    iget-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;->results:Lio/realm/RealmResults;

    invoke-virtual {p0, v0}, Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;->build(Lio/realm/RealmResults;)V

    .line 39
    const/4 v0, 0x0

    iget-object v1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;->results:Lio/realm/RealmResults;

    invoke-virtual {v1}, Lio/realm/RealmResults;->size()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;->calcMinMax(II)V

    .line 40
    return-void
.end method

.method public constructor <init>(Lio/realm/RealmResults;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 7
    .param p2, "yValuesField"    # Ljava/lang/String;
    .param p3, "xIndexField"    # Ljava/lang/String;
    .param p4, "sizeField"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/realm/RealmResults",
            "<TT;>;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 51
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet<TT;>;"
    .local p1, "result":Lio/realm/RealmResults;, "Lio/realm/RealmResults<TT;>;"
    invoke-direct {p0, p1, p2, p3}, Lcom/github/mikephil/charting/data/realm/base/RealmBarLineScatterCandleBubbleDataSet;-><init>(Lio/realm/RealmResults;Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;->mNormalizeSize:Z

    .line 25
    const/high16 v0, 0x40200000    # 2.5f

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;->mHighlightCircleWidth:F

    .line 52
    iput-object p4, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;->mSizeField:Ljava/lang/String;

    .line 54
    iget-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;->results:Lio/realm/RealmResults;

    invoke-virtual {p0, v0}, Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;->build(Lio/realm/RealmResults;)V

    .line 55
    const/4 v0, 0x0

    iget-object v1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;->results:Lio/realm/RealmResults;

    invoke-virtual {v1}, Lio/realm/RealmResults;->size()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;->calcMinMax(II)V

    .line 56
    return-void
.end method

.method private largestSize(Lcom/github/mikephil/charting/data/BubbleEntry;)F
    .registers 3
    .param p1, "entry"    # Lcom/github/mikephil/charting/data/BubbleEntry;

    .prologue
    .line 164
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet<TT;>;"
    invoke-virtual {p1}, Lcom/github/mikephil/charting/data/BubbleEntry;->getSize()F

    move-result v0

    return v0
.end method

.method private xMax(Lcom/github/mikephil/charting/data/BubbleEntry;)F
    .registers 3
    .param p1, "entry"    # Lcom/github/mikephil/charting/data/BubbleEntry;

    .prologue
    .line 160
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet<TT;>;"
    invoke-virtual {p1}, Lcom/github/mikephil/charting/data/BubbleEntry;->getXIndex()I

    move-result v0

    int-to-float v0, v0

    return v0
.end method

.method private xMin(Lcom/github/mikephil/charting/data/BubbleEntry;)F
    .registers 3
    .param p1, "entry"    # Lcom/github/mikephil/charting/data/BubbleEntry;

    .prologue
    .line 156
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet<TT;>;"
    invoke-virtual {p1}, Lcom/github/mikephil/charting/data/BubbleEntry;->getXIndex()I

    move-result v0

    int-to-float v0, v0

    return v0
.end method

.method private yMax(Lcom/github/mikephil/charting/data/BubbleEntry;)F
    .registers 3
    .param p1, "entry"    # Lcom/github/mikephil/charting/data/BubbleEntry;

    .prologue
    .line 152
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet<TT;>;"
    invoke-virtual {p1}, Lcom/github/mikephil/charting/data/BubbleEntry;->getVal()F

    move-result v0

    return v0
.end method

.method private yMin(Lcom/github/mikephil/charting/data/BubbleEntry;)F
    .registers 3
    .param p1, "entry"    # Lcom/github/mikephil/charting/data/BubbleEntry;

    .prologue
    .line 148
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet<TT;>;"
    invoke-virtual {p1}, Lcom/github/mikephil/charting/data/BubbleEntry;->getVal()F

    move-result v0

    return v0
.end method


# virtual methods
.method public buildEntryFromResultObject(Lio/realm/RealmObject;I)Lcom/github/mikephil/charting/data/BubbleEntry;
    .registers 7
    .param p2, "xIndex"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;I)",
            "Lcom/github/mikephil/charting/data/BubbleEntry;"
        }
    .end annotation

    .prologue
    .line 60
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet<TT;>;"
    .local p1, "realmObject":Lio/realm/RealmObject;, "TT;"
    new-instance v0, Lio/realm/DynamicRealmObject;

    invoke-direct {v0, p1}, Lio/realm/DynamicRealmObject;-><init>(Lio/realm/RealmObject;)V

    .line 62
    .local v0, "dynamicObject":Lio/realm/DynamicRealmObject;
    new-instance v1, Lcom/github/mikephil/charting/data/BubbleEntry;

    iget-object v2, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;->mIndexField:Ljava/lang/String;

    if-nez v2, :cond_1b

    .end local p2    # "xIndex":I
    :goto_b
    iget-object v2, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;->mValuesField:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lio/realm/DynamicRealmObject;->getFloat(Ljava/lang/String;)F

    move-result v2

    iget-object v3, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;->mSizeField:Ljava/lang/String;

    invoke-virtual {v0, v3}, Lio/realm/DynamicRealmObject;->getFloat(Ljava/lang/String;)F

    move-result v3

    invoke-direct {v1, p2, v2, v3}, Lcom/github/mikephil/charting/data/BubbleEntry;-><init>(IFF)V

    return-object v1

    .restart local p2    # "xIndex":I
    :cond_1b
    iget-object v2, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;->mIndexField:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lio/realm/DynamicRealmObject;->getInt(Ljava/lang/String;)I

    move-result p2

    goto :goto_b
.end method

.method public bridge synthetic buildEntryFromResultObject(Lio/realm/RealmObject;I)Lcom/github/mikephil/charting/data/Entry;
    .registers 4
    .param p1, "x0"    # Lio/realm/RealmObject;
    .param p2, "x1"    # I

    .prologue
    .line 16
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet<TT;>;"
    invoke-virtual {p0, p1, p2}, Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;->buildEntryFromResultObject(Lio/realm/RealmObject;I)Lcom/github/mikephil/charting/data/BubbleEntry;

    move-result-object v0

    return-object v0
.end method

.method public calcMinMax(II)V
    .registers 12
    .param p1, "start"    # I
    .param p2, "end"    # I

    .prologue
    .line 71
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet<TT;>;"
    iget-object v8, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;->mValues:Ljava/util/List;

    if-nez v8, :cond_5

    .line 121
    :cond_4
    return-void

    .line 74
    :cond_5
    iget-object v8, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;->mValues:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    if-eqz v8, :cond_4

    .line 79
    if-eqz p2, :cond_17

    iget-object v8, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;->mValues:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    if-lt p2, v8, :cond_85

    .line 80
    :cond_17
    iget-object v8, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;->mValues:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    add-int/lit8 v0, v8, -0x1

    .line 84
    .local v0, "endValue":I
    :goto_1f
    iget-object v8, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;->mValues:Ljava/util/List;

    invoke-interface {v8, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/github/mikephil/charting/data/BubbleEntry;

    invoke-direct {p0, v8}, Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;->yMin(Lcom/github/mikephil/charting/data/BubbleEntry;)F

    move-result v8

    iput v8, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;->mYMin:F

    .line 85
    iget-object v8, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;->mValues:Ljava/util/List;

    invoke-interface {v8, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/github/mikephil/charting/data/BubbleEntry;

    invoke-direct {p0, v8}, Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;->yMax(Lcom/github/mikephil/charting/data/BubbleEntry;)F

    move-result v8

    iput v8, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;->mYMax:F

    .line 89
    move v2, p1

    .local v2, "i":I
    :goto_3c
    if-ge v2, v0, :cond_4

    .line 91
    iget-object v8, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;->mValues:Ljava/util/List;

    invoke-interface {v8, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/github/mikephil/charting/data/BubbleEntry;

    .line 93
    .local v1, "entry":Lcom/github/mikephil/charting/data/BubbleEntry;
    invoke-direct {p0, v1}, Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;->yMin(Lcom/github/mikephil/charting/data/BubbleEntry;)F

    move-result v7

    .line 94
    .local v7, "ymin":F
    invoke-direct {p0, v1}, Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;->yMax(Lcom/github/mikephil/charting/data/BubbleEntry;)F

    move-result v6

    .line 96
    .local v6, "ymax":F
    iget v8, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;->mYMin:F

    cmpg-float v8, v7, v8

    if-gez v8, :cond_56

    .line 97
    iput v7, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;->mYMin:F

    .line 100
    :cond_56
    iget v8, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;->mYMax:F

    cmpl-float v8, v6, v8

    if-lez v8, :cond_5e

    .line 101
    iput v6, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;->mYMax:F

    .line 104
    :cond_5e
    invoke-direct {p0, v1}, Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;->xMin(Lcom/github/mikephil/charting/data/BubbleEntry;)F

    move-result v5

    .line 105
    .local v5, "xmin":F
    invoke-direct {p0, v1}, Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;->xMax(Lcom/github/mikephil/charting/data/BubbleEntry;)F

    move-result v4

    .line 107
    .local v4, "xmax":F
    iget v8, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;->mXMin:F

    cmpg-float v8, v5, v8

    if-gez v8, :cond_6e

    .line 108
    iput v5, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;->mXMin:F

    .line 111
    :cond_6e
    iget v8, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;->mXMax:F

    cmpl-float v8, v4, v8

    if-lez v8, :cond_76

    .line 112
    iput v4, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;->mXMax:F

    .line 115
    :cond_76
    invoke-direct {p0, v1}, Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;->largestSize(Lcom/github/mikephil/charting/data/BubbleEntry;)F

    move-result v3

    .line 117
    .local v3, "size":F
    iget v8, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;->mMaxSize:F

    cmpl-float v8, v3, v8

    if-lez v8, :cond_82

    .line 118
    iput v3, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;->mMaxSize:F

    .line 89
    :cond_82
    add-int/lit8 v2, v2, 0x1

    goto :goto_3c

    .line 82
    .end local v0    # "endValue":I
    .end local v1    # "entry":Lcom/github/mikephil/charting/data/BubbleEntry;
    .end local v2    # "i":I
    .end local v3    # "size":F
    .end local v4    # "xmax":F
    .end local v5    # "xmin":F
    .end local v6    # "ymax":F
    .end local v7    # "ymin":F
    :cond_85
    move v0, p2

    .restart local v0    # "endValue":I
    goto :goto_1f
.end method

.method public getHighlightCircleWidth()F
    .registers 2

    .prologue
    .line 174
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;->mHighlightCircleWidth:F

    return v0
.end method

.method public getMaxSize()F
    .registers 2

    .prologue
    .line 135
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;->mMaxSize:F

    return v0
.end method

.method public getSizeField()Ljava/lang/String;
    .registers 2

    .prologue
    .line 192
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;->mSizeField:Ljava/lang/String;

    return-object v0
.end method

.method public getXMax()F
    .registers 2

    .prologue
    .line 125
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;->mXMax:F

    return v0
.end method

.method public getXMin()F
    .registers 2

    .prologue
    .line 130
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;->mXMin:F

    return v0
.end method

.method public isNormalizeSizeEnabled()Z
    .registers 2

    .prologue
    .line 140
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet<TT;>;"
    iget-boolean v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;->mNormalizeSize:Z

    return v0
.end method

.method public setHighlightCircleWidth(F)V
    .registers 3
    .param p1, "width"    # F

    .prologue
    .line 169
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet<TT;>;"
    invoke-static {p1}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;->mHighlightCircleWidth:F

    .line 170
    return-void
.end method

.method public setNormalizeSizeEnabled(Z)V
    .registers 2
    .param p1, "normalizeSize"    # Z

    .prologue
    .line 144
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet<TT;>;"
    iput-boolean p1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;->mNormalizeSize:Z

    .line 145
    return-void
.end method

.method public setSizeField(Ljava/lang/String;)V
    .registers 2
    .param p1, "sizeField"    # Ljava/lang/String;

    .prologue
    .line 183
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet<TT;>;"
    iput-object p1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBubbleDataSet;->mSizeField:Ljava/lang/String;

    .line 184
    return-void
.end method
