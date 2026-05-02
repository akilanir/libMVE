.class public Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;
.super Lcom/github/mikephil/charting/data/realm/base/RealmBarLineScatterCandleBubbleDataSet;
.source "RealmBarDataSet.java"

# interfaces
.implements Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lio/realm/RealmObject;",
        ">",
        "Lcom/github/mikephil/charting/data/realm/base/RealmBarLineScatterCandleBubbleDataSet",
        "<TT;",
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

.field private mHighLightAlpha:I

.field private mStackLabels:[Ljava/lang/String;

.field private mStackSize:I

.field private mStackValueFieldName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lio/realm/RealmResults;Ljava/lang/String;Ljava/lang/String;)V
    .registers 8
    .param p2, "yValuesField"    # Ljava/lang/String;
    .param p3, "xIndexField"    # Ljava/lang/String;
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
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet<TT;>;"
    .local p1, "results":Lio/realm/RealmResults;, "Lio/realm/RealmResults<TT;>;"
    const/4 v3, 0x1

    const/16 v1, 0xd7

    const/4 v2, 0x0

    .line 56
    invoke-direct {p0, p1, p2, p3}, Lcom/github/mikephil/charting/data/realm/base/RealmBarLineScatterCandleBubbleDataSet;-><init>(Lio/realm/RealmResults;Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    const v0, 0x3e19999a    # 0.15f

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mBarSpace:F

    .line 32
    iput v3, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mStackSize:I

    .line 37
    invoke-static {v1, v1, v1}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mBarShadowColor:I

    .line 39
    const/4 v0, 0x0

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mBarBorderWidth:F

    .line 41
    const/high16 v0, -0x1000000

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mBarBorderColor:I

    .line 46
    const/16 v0, 0x78

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mHighLightAlpha:I

    .line 51
    new-array v0, v3, [Ljava/lang/String;

    const-string v1, "Stack"

    aput-object v1, v0, v2

    iput-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mStackLabels:[Ljava/lang/String;

    .line 57
    invoke-static {v2, v2, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mHighLightColor:I

    .line 59
    iget-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->results:Lio/realm/RealmResults;

    invoke-virtual {p0, v0}, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->build(Lio/realm/RealmResults;)V

    .line 60
    invoke-virtual {p1}, Lio/realm/RealmResults;->size()I

    move-result v0

    invoke-virtual {p0, v2, v0}, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->calcMinMax(II)V

    .line 61
    return-void
.end method

.method public constructor <init>(Lio/realm/RealmResults;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 9
    .param p2, "yValuesField"    # Ljava/lang/String;
    .param p3, "xIndexField"    # Ljava/lang/String;
    .param p4, "stackValueFieldName"    # Ljava/lang/String;
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
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet<TT;>;"
    .local p1, "results":Lio/realm/RealmResults;, "Lio/realm/RealmResults<TT;>;"
    const/4 v3, 0x1

    const/16 v1, 0xd7

    const/4 v2, 0x0

    .line 72
    invoke-direct {p0, p1, p2, p3}, Lcom/github/mikephil/charting/data/realm/base/RealmBarLineScatterCandleBubbleDataSet;-><init>(Lio/realm/RealmResults;Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    const v0, 0x3e19999a    # 0.15f

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mBarSpace:F

    .line 32
    iput v3, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mStackSize:I

    .line 37
    invoke-static {v1, v1, v1}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mBarShadowColor:I

    .line 39
    const/4 v0, 0x0

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mBarBorderWidth:F

    .line 41
    const/high16 v0, -0x1000000

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mBarBorderColor:I

    .line 46
    const/16 v0, 0x78

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mHighLightAlpha:I

    .line 51
    new-array v0, v3, [Ljava/lang/String;

    const-string v1, "Stack"

    aput-object v1, v0, v2

    iput-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mStackLabels:[Ljava/lang/String;

    .line 73
    iput-object p4, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mStackValueFieldName:Ljava/lang/String;

    .line 74
    invoke-static {v2, v2, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mHighLightColor:I

    .line 76
    iget-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->results:Lio/realm/RealmResults;

    invoke-virtual {p0, v0}, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->build(Lio/realm/RealmResults;)V

    .line 77
    invoke-virtual {p1}, Lio/realm/RealmResults;->size()I

    move-result v0

    invoke-virtual {p0, v2, v0}, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->calcMinMax(II)V

    .line 78
    return-void
.end method

.method private calcStackSize()V
    .registers 5

    .prologue
    .line 165
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet<TT;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v2, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mValues:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_22

    .line 167
    iget-object v2, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mValues:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/github/mikephil/charting/data/BarEntry;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/data/BarEntry;->getVals()[F

    move-result-object v1

    .line 169
    .local v1, "vals":[F
    if-eqz v1, :cond_1f

    array-length v2, v1

    iget v3, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mStackSize:I

    if-le v2, v3, :cond_1f

    .line 170
    array-length v2, v1

    iput v2, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mStackSize:I

    .line 165
    :cond_1f
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 172
    .end local v1    # "vals":[F
    :cond_22
    return-void
.end method


# virtual methods
.method public build(Lio/realm/RealmResults;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/realm/RealmResults",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 83
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet<TT;>;"
    .local p1, "results":Lio/realm/RealmResults;, "Lio/realm/RealmResults<TT;>;"
    invoke-super {p0, p1}, Lcom/github/mikephil/charting/data/realm/base/RealmBarLineScatterCandleBubbleDataSet;->build(Lio/realm/RealmResults;)V

    .line 85
    invoke-direct {p0}, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->calcStackSize()V

    .line 86
    return-void
.end method

.method public buildEntryFromResultObject(Lio/realm/RealmObject;I)Lcom/github/mikephil/charting/data/BarEntry;
    .registers 12
    .param p2, "xIndex"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;I)",
            "Lcom/github/mikephil/charting/data/BarEntry;"
        }
    .end annotation

    .prologue
    .line 90
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet<TT;>;"
    .local p1, "realmObject":Lio/realm/RealmObject;, "TT;"
    new-instance v0, Lio/realm/DynamicRealmObject;

    invoke-direct {v0, p1}, Lio/realm/DynamicRealmObject;-><init>(Lio/realm/RealmObject;)V

    .line 92
    .local v0, "dynamicObject":Lio/realm/DynamicRealmObject;
    iget-object v7, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mValuesField:Ljava/lang/String;

    invoke-virtual {v0, v7}, Lio/realm/DynamicRealmObject;->getFieldType(Ljava/lang/String;)Lio/realm/RealmFieldType;

    move-result-object v7

    sget-object v8, Lio/realm/RealmFieldType;->LIST:Lio/realm/RealmFieldType;

    if-ne v7, v8, :cond_48

    .line 94
    iget-object v7, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mValuesField:Ljava/lang/String;

    invoke-virtual {v0, v7}, Lio/realm/DynamicRealmObject;->getList(Ljava/lang/String;)Lio/realm/RealmList;

    move-result-object v3

    .line 95
    .local v3, "list":Lio/realm/RealmList;, "Lio/realm/RealmList<Lio/realm/DynamicRealmObject;>;"
    invoke-virtual {v3}, Lio/realm/RealmList;->size()I

    move-result v7

    new-array v6, v7, [F

    .line 97
    .local v6, "values":[F
    const/4 v1, 0x0

    .line 98
    .local v1, "i":I
    invoke-virtual {v3}, Lio/realm/RealmList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_20
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_37

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lio/realm/DynamicRealmObject;

    .line 99
    .local v4, "o":Lio/realm/DynamicRealmObject;
    iget-object v7, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mStackValueFieldName:Ljava/lang/String;

    invoke-virtual {v4, v7}, Lio/realm/DynamicRealmObject;->getFloat(Ljava/lang/String;)F

    move-result v7

    aput v7, v6, v1

    .line 100
    add-int/lit8 v1, v1, 0x1

    .line 101
    goto :goto_20

    .line 103
    .end local v4    # "o":Lio/realm/DynamicRealmObject;
    :cond_37
    new-instance v7, Lcom/github/mikephil/charting/data/BarEntry;

    iget-object v8, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mIndexField:Ljava/lang/String;

    if-nez v8, :cond_41

    .end local p2    # "xIndex":I
    :goto_3d
    invoke-direct {v7, v6, p2}, Lcom/github/mikephil/charting/data/BarEntry;-><init>([FI)V

    .line 107
    .end local v1    # "i":I
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "list":Lio/realm/RealmList;, "Lio/realm/RealmList<Lio/realm/DynamicRealmObject;>;"
    .end local v6    # "values":[F
    :goto_40
    return-object v7

    .line 103
    .restart local v1    # "i":I
    .restart local v2    # "i$":Ljava/util/Iterator;
    .restart local v3    # "list":Lio/realm/RealmList;, "Lio/realm/RealmList<Lio/realm/DynamicRealmObject;>;"
    .restart local v6    # "values":[F
    .restart local p2    # "xIndex":I
    :cond_41
    iget-object v8, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mIndexField:Ljava/lang/String;

    invoke-virtual {v0, v8}, Lio/realm/DynamicRealmObject;->getInt(Ljava/lang/String;)I

    move-result p2

    goto :goto_3d

    .line 106
    .end local v1    # "i":I
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "list":Lio/realm/RealmList;, "Lio/realm/RealmList<Lio/realm/DynamicRealmObject;>;"
    .end local v6    # "values":[F
    :cond_48
    iget-object v7, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mValuesField:Ljava/lang/String;

    invoke-virtual {v0, v7}, Lio/realm/DynamicRealmObject;->getFloat(Ljava/lang/String;)F

    move-result v5

    .line 107
    .local v5, "value":F
    new-instance v7, Lcom/github/mikephil/charting/data/BarEntry;

    iget-object v8, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mIndexField:Ljava/lang/String;

    if-nez v8, :cond_58

    .end local p2    # "xIndex":I
    :goto_54
    invoke-direct {v7, v5, p2}, Lcom/github/mikephil/charting/data/BarEntry;-><init>(FI)V

    goto :goto_40

    .restart local p2    # "xIndex":I
    :cond_58
    iget-object v8, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mIndexField:Ljava/lang/String;

    invoke-virtual {v0, v8}, Lio/realm/DynamicRealmObject;->getInt(Ljava/lang/String;)I

    move-result p2

    goto :goto_54
.end method

.method public bridge synthetic buildEntryFromResultObject(Lio/realm/RealmObject;I)Lcom/github/mikephil/charting/data/Entry;
    .registers 4
    .param p1, "x0"    # Lio/realm/RealmObject;
    .param p2, "x1"    # I

    .prologue
    .line 19
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet<TT;>;"
    invoke-virtual {p0, p1, p2}, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->buildEntryFromResultObject(Lio/realm/RealmObject;I)Lcom/github/mikephil/charting/data/BarEntry;

    move-result-object v0

    return-object v0
.end method

.method public calcMinMax(II)V
    .registers 11
    .param p1, "start"    # I
    .param p2, "end"    # I

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet<TT;>;"
    const v7, 0x7f7fffff    # Float.MAX_VALUE

    const/4 v6, 0x0

    .line 115
    iget-object v4, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mValues:Ljava/util/List;

    if-nez v4, :cond_9

    .line 161
    :cond_8
    :goto_8
    return-void

    .line 118
    :cond_9
    iget-object v4, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mValues:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v3

    .line 120
    .local v3, "yValCount":I
    if-eqz v3, :cond_8

    .line 125
    if-eqz p2, :cond_15

    if-lt p2, v3, :cond_5e

    .line 126
    :cond_15
    add-int/lit8 v1, v3, -0x1

    .line 130
    .local v1, "endValue":I
    :goto_17
    iput v7, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mYMin:F

    .line 131
    const v4, -0x800001

    iput v4, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mYMax:F

    .line 133
    move v2, p1

    .local v2, "i":I
    :goto_1f
    if-gt v2, v1, :cond_83

    .line 135
    iget-object v4, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mValues:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/github/mikephil/charting/data/BarEntry;

    .line 137
    .local v0, "e":Lcom/github/mikephil/charting/data/BarEntry;
    if-eqz v0, :cond_5b

    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/BarEntry;->getVal()F

    move-result v4

    invoke-static {v4}, Ljava/lang/Float;->isNaN(F)Z

    move-result v4

    if-nez v4, :cond_5b

    .line 139
    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/BarEntry;->getVals()[F

    move-result-object v4

    if-nez v4, :cond_60

    .line 141
    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/BarEntry;->getVal()F

    move-result v4

    iget v5, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mYMin:F

    cmpg-float v4, v4, v5

    if-gez v4, :cond_4b

    .line 142
    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/BarEntry;->getVal()F

    move-result v4

    iput v4, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mYMin:F

    .line 144
    :cond_4b
    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/BarEntry;->getVal()F

    move-result v4

    iget v5, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mYMax:F

    cmpl-float v4, v4, v5

    if-lez v4, :cond_5b

    .line 145
    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/BarEntry;->getVal()F

    move-result v4

    iput v4, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mYMax:F

    .line 133
    :cond_5b
    :goto_5b
    add-int/lit8 v2, v2, 0x1

    goto :goto_1f

    .line 128
    .end local v0    # "e":Lcom/github/mikephil/charting/data/BarEntry;
    .end local v1    # "endValue":I
    .end local v2    # "i":I
    :cond_5e
    move v1, p2

    .restart local v1    # "endValue":I
    goto :goto_17

    .line 148
    .restart local v0    # "e":Lcom/github/mikephil/charting/data/BarEntry;
    .restart local v2    # "i":I
    :cond_60
    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/BarEntry;->getNegativeSum()F

    move-result v4

    neg-float v4, v4

    iget v5, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mYMin:F

    cmpg-float v4, v4, v5

    if-gez v4, :cond_72

    .line 149
    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/BarEntry;->getNegativeSum()F

    move-result v4

    neg-float v4, v4

    iput v4, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mYMin:F

    .line 151
    :cond_72
    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/BarEntry;->getPositiveSum()F

    move-result v4

    iget v5, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mYMax:F

    cmpl-float v4, v4, v5

    if-lez v4, :cond_5b

    .line 152
    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/BarEntry;->getPositiveSum()F

    move-result v4

    iput v4, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mYMax:F

    goto :goto_5b

    .line 157
    .end local v0    # "e":Lcom/github/mikephil/charting/data/BarEntry;
    :cond_83
    iget v4, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mYMin:F

    cmpl-float v4, v4, v7

    if-nez v4, :cond_8

    .line 158
    iput v6, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mYMin:F

    .line 159
    iput v6, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mYMax:F

    goto/16 :goto_8
.end method

.method public getBarBorderColor()I
    .registers 2

    .prologue
    .line 260
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mBarBorderColor:I

    return v0
.end method

.method public getBarBorderWidth()F
    .registers 2

    .prologue
    .line 241
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mBarBorderWidth:F

    return v0
.end method

.method public getBarShadowColor()I
    .registers 2

    .prologue
    .line 220
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mBarShadowColor:I

    return v0
.end method

.method public getBarSpace()F
    .registers 2

    .prologue
    .line 195
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mBarSpace:F

    return v0
.end method

.method public getBarSpacePercent()F
    .registers 3

    .prologue
    .line 190
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mBarSpace:F

    const/high16 v1, 0x42c80000    # 100.0f

    mul-float/2addr v0, v1

    return v0
.end method

.method public getHighLightAlpha()I
    .registers 2

    .prologue
    .line 275
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mHighLightAlpha:I

    return v0
.end method

.method public getStackLabels()[Ljava/lang/String;
    .registers 2

    .prologue
    .line 289
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mStackLabels:[Ljava/lang/String;

    return-object v0
.end method

.method public getStackSize()I
    .registers 2

    .prologue
    .line 176
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mStackSize:I

    return v0
.end method

.method public isStacked()Z
    .registers 3

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet<TT;>;"
    const/4 v0, 0x1

    .line 181
    iget v1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mStackSize:I

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
    .line 250
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet<TT;>;"
    iput p1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mBarBorderColor:I

    .line 251
    return-void
.end method

.method public setBarBorderWidth(F)V
    .registers 2
    .param p1, "width"    # F

    .prologue
    .line 230
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet<TT;>;"
    iput p1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mBarBorderWidth:F

    .line 231
    return-void
.end method

.method public setBarShadowColor(I)V
    .registers 2
    .param p1, "color"    # I

    .prologue
    .line 215
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet<TT;>;"
    iput p1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mBarShadowColor:I

    .line 216
    return-void
.end method

.method public setBarSpacePercent(F)V
    .registers 3
    .param p1, "percent"    # F

    .prologue
    .line 204
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet<TT;>;"
    const/high16 v0, 0x42c80000    # 100.0f

    div-float v0, p1, v0

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mBarSpace:F

    .line 205
    return-void
.end method

.method public setHighLightAlpha(I)V
    .registers 2
    .param p1, "alpha"    # I

    .prologue
    .line 270
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet<TT;>;"
    iput p1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mHighLightAlpha:I

    .line 271
    return-void
.end method

.method public setStackLabels([Ljava/lang/String;)V
    .registers 2
    .param p1, "labels"    # [Ljava/lang/String;

    .prologue
    .line 284
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet<TT;>;"
    iput-object p1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmBarDataSet;->mStackLabels:[Ljava/lang/String;

    .line 285
    return-void
.end method
