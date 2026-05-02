.class public abstract Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;
.super Lcom/github/mikephil/charting/data/BaseDataSet;
.source "RealmBaseDataSet.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lio/realm/RealmObject;",
        "S:",
        "Lcom/github/mikephil/charting/data/Entry;",
        ">",
        "Lcom/github/mikephil/charting/data/BaseDataSet",
        "<TS;>;"
    }
.end annotation


# instance fields
.field protected mIndexField:Ljava/lang/String;

.field protected mValues:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<TS;>;"
        }
    .end annotation
.end field

.field protected mValuesField:Ljava/lang/String;

.field protected mYMax:F

.field protected mYMin:F

.field protected results:Lio/realm/RealmResults;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/realm/RealmResults",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lio/realm/RealmResults;Ljava/lang/String;)V
    .registers 6
    .param p2, "yValuesField"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/realm/RealmResults",
            "<TT;>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;, "Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet<TT;TS;>;"
    .local p1, "results":Lio/realm/RealmResults;, "Lio/realm/RealmResults<TT;>;"
    const/4 v0, 0x0

    .line 51
    invoke-direct {p0}, Lcom/github/mikephil/charting/data/BaseDataSet;-><init>()V

    .line 34
    iput v0, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mYMax:F

    .line 39
    iput v0, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mYMin:F

    .line 52
    iput-object p1, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->results:Lio/realm/RealmResults;

    .line 53
    iput-object p2, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mValuesField:Ljava/lang/String;

    .line 54
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mValues:Ljava/util/List;

    .line 56
    iget-object v0, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mIndexField:Ljava/lang/String;

    if-eqz v0, :cond_20

    .line 57
    iget-object v0, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->results:Lio/realm/RealmResults;

    iget-object v1, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mIndexField:Ljava/lang/String;

    sget-object v2, Lio/realm/Sort;->ASCENDING:Lio/realm/Sort;

    invoke-virtual {v0, v1, v2}, Lio/realm/RealmResults;->sort(Ljava/lang/String;Lio/realm/Sort;)V

    .line 58
    :cond_20
    return-void
.end method

.method public constructor <init>(Lio/realm/RealmResults;Ljava/lang/String;Ljava/lang/String;)V
    .registers 7
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
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;, "Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet<TT;TS;>;"
    .local p1, "results":Lio/realm/RealmResults;, "Lio/realm/RealmResults<TT;>;"
    const/4 v0, 0x0

    .line 67
    invoke-direct {p0}, Lcom/github/mikephil/charting/data/BaseDataSet;-><init>()V

    .line 34
    iput v0, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mYMax:F

    .line 39
    iput v0, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mYMin:F

    .line 68
    iput-object p1, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->results:Lio/realm/RealmResults;

    .line 69
    iput-object p2, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mValuesField:Ljava/lang/String;

    .line 70
    iput-object p3, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mIndexField:Ljava/lang/String;

    .line 71
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mValues:Ljava/util/List;

    .line 73
    iget-object v0, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mIndexField:Ljava/lang/String;

    if-eqz v0, :cond_22

    .line 74
    iget-object v0, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->results:Lio/realm/RealmResults;

    iget-object v1, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mIndexField:Ljava/lang/String;

    sget-object v2, Lio/realm/Sort;->ASCENDING:Lio/realm/Sort;

    invoke-virtual {v0, v1, v2}, Lio/realm/RealmResults;->sort(Ljava/lang/String;Lio/realm/Sort;)V

    .line 75
    :cond_22
    return-void
.end method


# virtual methods
.method public addEntry(Lcom/github/mikephil/charting/data/Entry;)Z
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TS;)Z"
        }
    .end annotation

    .prologue
    .line 270
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;, "Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet<TT;TS;>;"
    .local p1, "e":Lcom/github/mikephil/charting/data/Entry;, "TS;"
    if-nez p1, :cond_4

    .line 271
    const/4 v1, 0x0

    .line 291
    :goto_3
    return v1

    .line 273
    :cond_4
    invoke-virtual {p1}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v0

    .line 275
    .local v0, "val":F
    iget-object v1, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mValues:Ljava/util/List;

    if-nez v1, :cond_13

    .line 276
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mValues:Ljava/util/List;

    .line 279
    :cond_13
    iget-object v1, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mValues:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_26

    .line 280
    iput v0, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mYMax:F

    .line 281
    iput v0, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mYMin:F

    .line 290
    :cond_1f
    :goto_1f
    iget-object v1, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mValues:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 291
    const/4 v1, 0x1

    goto :goto_3

    .line 283
    :cond_26
    iget v1, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mYMax:F

    cmpg-float v1, v1, v0

    if-gez v1, :cond_2e

    .line 284
    iput v0, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mYMax:F

    .line 285
    :cond_2e
    iget v1, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mYMin:F

    cmpl-float v1, v1, v0

    if-lez v1, :cond_1f

    .line 286
    iput v0, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mYMin:F

    goto :goto_1f
.end method

.method public addEntryOrdered(Lcom/github/mikephil/charting/data/Entry;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TS;)V"
        }
    .end annotation

    .prologue
    .line 316
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;, "Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet<TT;TS;>;"
    .local p1, "e":Lcom/github/mikephil/charting/data/Entry;, "TS;"
    if-nez p1, :cond_3

    .line 342
    :goto_2
    return-void

    .line 319
    :cond_3
    invoke-virtual {p1}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v1

    .line 321
    .local v1, "val":F
    iget-object v2, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mValues:Ljava/util/List;

    if-nez v2, :cond_12

    .line 322
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mValues:Ljava/util/List;

    .line 325
    :cond_12
    iget-object v2, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mValues:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-nez v2, :cond_50

    .line 326
    iput v1, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mYMax:F

    .line 327
    iput v1, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mYMin:F

    .line 335
    :cond_1e
    :goto_1e
    iget-object v2, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mValues:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_61

    iget-object v2, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mValues:Ljava/util/List;

    iget-object v3, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mValues:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/github/mikephil/charting/data/Entry;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v2

    invoke-virtual {p1}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v3

    if-le v2, v3, :cond_61

    .line 336
    invoke-virtual {p1}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v2

    sget-object v3, Lcom/github/mikephil/charting/data/DataSet$Rounding;->UP:Lcom/github/mikephil/charting/data/DataSet$Rounding;

    invoke-virtual {p0, v2, v3}, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->getEntryIndex(ILcom/github/mikephil/charting/data/DataSet$Rounding;)I

    move-result v0

    .line 337
    .local v0, "closestIndex":I
    iget-object v2, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mValues:Ljava/util/List;

    invoke-interface {v2, v0, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    goto :goto_2

    .line 329
    .end local v0    # "closestIndex":I
    :cond_50
    iget v2, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mYMax:F

    cmpg-float v2, v2, v1

    if-gez v2, :cond_58

    .line 330
    iput v1, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mYMax:F

    .line 331
    :cond_58
    iget v2, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mYMin:F

    cmpl-float v2, v2, v1

    if-lez v2, :cond_1e

    .line 332
    iput v1, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mYMin:F

    goto :goto_1e

    .line 341
    :cond_61
    iget-object v2, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mValues:Ljava/util/List;

    invoke-interface {v2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2
.end method

.method public build(Lio/realm/RealmResults;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/realm/RealmResults",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 82
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;, "Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet<TT;TS;>;"
    .local p1, "results":Lio/realm/RealmResults;, "Lio/realm/RealmResults<TT;>;"
    const/4 v2, 0x0

    .line 83
    .local v2, "xIndex":I
    invoke-virtual {p1}, Lio/realm/RealmResults;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_5
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1e

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/realm/RealmObject;

    .line 84
    .local v1, "object":Lio/realm/RealmObject;, "TT;"
    iget-object v4, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mValues:Ljava/util/List;

    add-int/lit8 v3, v2, 0x1

    .end local v2    # "xIndex":I
    .local v3, "xIndex":I
    invoke-virtual {p0, v1, v2}, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->buildEntryFromResultObject(Lio/realm/RealmObject;I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move v2, v3

    .line 85
    .end local v3    # "xIndex":I
    .restart local v2    # "xIndex":I
    goto :goto_5

    .line 86
    .end local v1    # "object":Lio/realm/RealmObject;, "TT;"
    :cond_1e
    return-void
.end method

.method public buildEntryFromResultObject(Lio/realm/RealmObject;I)Lcom/github/mikephil/charting/data/Entry;
    .registers 7
    .param p2, "xIndex"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;I)TS;"
        }
    .end annotation

    .prologue
    .line 89
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;, "Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet<TT;TS;>;"
    .local p1, "realmObject":Lio/realm/RealmObject;, "TT;"
    new-instance v0, Lio/realm/DynamicRealmObject;

    invoke-direct {v0, p1}, Lio/realm/DynamicRealmObject;-><init>(Lio/realm/RealmObject;)V

    .line 91
    .local v0, "dynamicObject":Lio/realm/DynamicRealmObject;
    new-instance v1, Lcom/github/mikephil/charting/data/Entry;

    iget-object v2, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mValuesField:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lio/realm/DynamicRealmObject;->getFloat(Ljava/lang/String;)F

    move-result v2

    iget-object v3, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mIndexField:Ljava/lang/String;

    if-nez v3, :cond_15

    .end local p2    # "xIndex":I
    :goto_11
    invoke-direct {v1, v2, p2}, Lcom/github/mikephil/charting/data/Entry;-><init>(FI)V

    return-object v1

    .restart local p2    # "xIndex":I
    :cond_15
    iget-object v3, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mIndexField:Ljava/lang/String;

    invoke-virtual {v0, v3}, Lio/realm/DynamicRealmObject;->getInt(Ljava/lang/String;)I

    move-result p2

    goto :goto_11
.end method

.method public calcMinMax(II)V
    .registers 11
    .param p1, "start"    # I
    .param p2, "end"    # I

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;, "Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet<TT;TS;>;"
    const v7, 0x7f7fffff    # Float.MAX_VALUE

    const/4 v6, 0x0

    .line 115
    iget-object v4, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mValues:Ljava/util/List;

    if-nez v4, :cond_9

    .line 151
    :cond_8
    :goto_8
    return-void

    .line 118
    :cond_9
    iget-object v4, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mValues:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v3

    .line 120
    .local v3, "yValCount":I
    if-eqz v3, :cond_8

    .line 125
    if-eqz p2, :cond_15

    if-lt p2, v3, :cond_58

    .line 126
    :cond_15
    add-int/lit8 v1, v3, -0x1

    .line 130
    .local v1, "endValue":I
    :goto_17
    iput v7, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mYMin:F

    .line 131
    const v4, -0x800001

    iput v4, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mYMax:F

    .line 133
    move v2, p1

    .local v2, "i":I
    :goto_1f
    if-gt v2, v1, :cond_5a

    .line 135
    iget-object v4, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mValues:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/github/mikephil/charting/data/Entry;

    .line 137
    .local v0, "e":Lcom/github/mikephil/charting/data/Entry;, "TS;"
    if-eqz v0, :cond_55

    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v4

    invoke-static {v4}, Ljava/lang/Float;->isNaN(F)Z

    move-result v4

    if-nez v4, :cond_55

    .line 139
    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v4

    iget v5, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mYMin:F

    cmpg-float v4, v4, v5

    if-gez v4, :cond_45

    .line 140
    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v4

    iput v4, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mYMin:F

    .line 142
    :cond_45
    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v4

    iget v5, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mYMax:F

    cmpl-float v4, v4, v5

    if-lez v4, :cond_55

    .line 143
    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v4

    iput v4, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mYMax:F

    .line 133
    :cond_55
    add-int/lit8 v2, v2, 0x1

    goto :goto_1f

    .line 128
    .end local v0    # "e":Lcom/github/mikephil/charting/data/Entry;, "TS;"
    .end local v1    # "endValue":I
    .end local v2    # "i":I
    :cond_58
    move v1, p2

    .restart local v1    # "endValue":I
    goto :goto_17

    .line 147
    .restart local v2    # "i":I
    :cond_5a
    iget v4, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mYMin:F

    cmpl-float v4, v4, v7

    if-nez v4, :cond_8

    .line 148
    iput v6, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mYMin:F

    .line 149
    iput v6, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mYMax:F

    goto :goto_8
.end method

.method public clear()V
    .registers 2

    .prologue
    .line 356
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;, "Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet<TT;TS;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mValues:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 357
    invoke-virtual {p0}, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->notifyDataSetChanged()V

    .line 358
    return-void
.end method

.method public getEntriesForXIndex(I)Ljava/util/List;
    .registers 10
    .param p1, "xIndex"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List",
            "<TS;>;"
        }
    .end annotation

    .prologue
    .line 171
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;, "Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet<TT;TS;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 173
    .local v1, "entries":Ljava/util/List;, "Ljava/util/List<TS;>;"
    iget-object v5, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mIndexField:Ljava/lang/String;

    if-nez v5, :cond_19

    .line 174
    iget-object v5, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->results:Lio/realm/RealmResults;

    invoke-virtual {v5, p1}, Lio/realm/RealmResults;->get(I)Lio/realm/RealmObject;

    move-result-object v4

    .line 175
    .local v4, "object":Lio/realm/RealmObject;, "TT;"
    if-eqz v4, :cond_18

    .line 176
    invoke-virtual {p0, v4, p1}, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->buildEntryFromResultObject(Lio/realm/RealmObject;I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 184
    .end local v4    # "object":Lio/realm/RealmObject;, "TT;"
    :cond_18
    return-object v1

    .line 178
    :cond_19
    iget-object v5, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->results:Lio/realm/RealmResults;

    invoke-virtual {v5}, Lio/realm/RealmResults;->where()Lio/realm/RealmQuery;

    move-result-object v5

    iget-object v6, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mIndexField:Ljava/lang/String;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lio/realm/RealmQuery;->equalTo(Ljava/lang/String;Ljava/lang/Integer;)Lio/realm/RealmQuery;

    move-result-object v5

    invoke-virtual {v5}, Lio/realm/RealmQuery;->findAll()Lio/realm/RealmResults;

    move-result-object v2

    .line 180
    .local v2, "foundObjects":Lio/realm/RealmResults;, "Lio/realm/RealmResults<TT;>;"
    invoke-virtual {v2}, Lio/realm/RealmResults;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_31
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_18

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/realm/RealmObject;

    .line 181
    .local v0, "e":Lio/realm/RealmObject;, "TT;"
    invoke-virtual {p0, v0, p1}, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->buildEntryFromResultObject(Lio/realm/RealmObject;I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_31
.end method

.method public getEntryCount()I
    .registers 2

    .prologue
    .line 109
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;, "Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet<TT;TS;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mValues:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;
    .registers 3
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TS;"
        }
    .end annotation

    .prologue
    .line 191
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;, "Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet<TT;TS;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mValues:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/github/mikephil/charting/data/Entry;

    return-object v0
.end method

.method public getEntryForXIndex(I)Lcom/github/mikephil/charting/data/Entry;
    .registers 3
    .param p1, "xIndex"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TS;"
        }
    .end annotation

    .prologue
    .line 157
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;, "Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet<TT;TS;>;"
    sget-object v0, Lcom/github/mikephil/charting/data/DataSet$Rounding;->CLOSEST:Lcom/github/mikephil/charting/data/DataSet$Rounding;

    invoke-virtual {p0, p1, v0}, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->getEntryForXIndex(ILcom/github/mikephil/charting/data/DataSet$Rounding;)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v0

    return-object v0
.end method

.method public getEntryForXIndex(ILcom/github/mikephil/charting/data/DataSet$Rounding;)Lcom/github/mikephil/charting/data/Entry;
    .registers 5
    .param p1, "xIndex"    # I
    .param p2, "rounding"    # Lcom/github/mikephil/charting/data/DataSet$Rounding;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/github/mikephil/charting/data/DataSet$Rounding;",
            ")TS;"
        }
    .end annotation

    .prologue
    .line 162
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;, "Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet<TT;TS;>;"
    invoke-virtual {p0, p1, p2}, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->getEntryIndex(ILcom/github/mikephil/charting/data/DataSet$Rounding;)I

    move-result v0

    .line 163
    .local v0, "index":I
    const/4 v1, -0x1

    if-le v0, v1, :cond_10

    .line 164
    iget-object v1, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mValues:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/github/mikephil/charting/data/Entry;

    .line 165
    :goto_f
    return-object v1

    :cond_10
    const/4 v1, 0x0

    goto :goto_f
.end method

.method public getEntryIndex(ILcom/github/mikephil/charting/data/DataSet$Rounding;)I
    .registers 11
    .param p1, "x"    # I
    .param p2, "rounding"    # Lcom/github/mikephil/charting/data/DataSet$Rounding;

    .prologue
    .line 197
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;, "Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet<TT;TS;>;"
    const/4 v4, 0x0

    .line 198
    .local v4, "low":I
    iget-object v6, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mValues:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    add-int/lit8 v3, v6, -0x1

    .line 199
    .local v3, "high":I
    const/4 v0, -0x1

    .line 201
    .local v0, "closest":I
    :goto_a
    if-gt v4, v3, :cond_40

    .line 202
    add-int v6, v3, v4

    div-int/lit8 v5, v6, 0x2

    .line 204
    .local v5, "m":I
    iget-object v6, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mValues:Ljava/util/List;

    invoke-interface {v6, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/github/mikephil/charting/data/Entry;

    .line 206
    .local v2, "entry":Lcom/github/mikephil/charting/data/Entry;, "TS;"
    invoke-virtual {v2}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v6

    if-ne p1, v6, :cond_33

    .line 207
    :goto_1e
    if-lez v5, :cond_62

    iget-object v6, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mValues:Ljava/util/List;

    add-int/lit8 v7, v5, -0x1

    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/github/mikephil/charting/data/Entry;

    invoke-virtual {v6}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v6

    if-ne v6, p1, :cond_62

    .line 208
    add-int/lit8 v5, v5, -0x1

    goto :goto_1e

    .line 213
    :cond_33
    invoke-virtual {v2}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v6

    if-le p1, v6, :cond_3d

    .line 214
    add-int/lit8 v4, v5, 0x1

    .line 218
    :goto_3b
    move v0, v5

    .line 219
    goto :goto_a

    .line 216
    :cond_3d
    add-int/lit8 v3, v5, -0x1

    goto :goto_3b

    .line 221
    .end local v2    # "entry":Lcom/github/mikephil/charting/data/Entry;, "TS;"
    .end local v5    # "m":I
    :cond_40
    const/4 v6, -0x1

    if-eq v0, v6, :cond_61

    .line 222
    iget-object v6, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mValues:Ljava/util/List;

    invoke-interface {v6, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/github/mikephil/charting/data/Entry;

    invoke-virtual {v6}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v1

    .line 223
    .local v1, "closestXIndex":I
    sget-object v6, Lcom/github/mikephil/charting/data/DataSet$Rounding;->UP:Lcom/github/mikephil/charting/data/DataSet$Rounding;

    if-ne p2, v6, :cond_63

    .line 224
    if-ge v1, p1, :cond_61

    iget-object v6, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mValues:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    if-ge v0, v6, :cond_61

    .line 225
    add-int/lit8 v0, v0, 0x1

    .end local v1    # "closestXIndex":I
    :cond_61
    :goto_61
    move v5, v0

    .line 234
    :cond_62
    return v5

    .line 227
    .restart local v1    # "closestXIndex":I
    :cond_63
    sget-object v6, Lcom/github/mikephil/charting/data/DataSet$Rounding;->DOWN:Lcom/github/mikephil/charting/data/DataSet$Rounding;

    if-ne p2, v6, :cond_61

    .line 228
    if-le v1, p1, :cond_61

    if-lez v0, :cond_61

    .line 229
    add-int/lit8 v0, v0, -0x1

    goto :goto_61
.end method

.method public getEntryIndex(Lcom/github/mikephil/charting/data/Entry;)I
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TS;)I"
        }
    .end annotation

    .prologue
    .line 239
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;, "Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet<TT;TS;>;"
    .local p1, "e":Lcom/github/mikephil/charting/data/Entry;, "TS;"
    iget-object v0, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mValues:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public getIndexField()Ljava/lang/String;
    .registers 2

    .prologue
    .line 388
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;, "Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet<TT;TS;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mIndexField:Ljava/lang/String;

    return-object v0
.end method

.method public getResults()Lio/realm/RealmResults;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/realm/RealmResults",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 361
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;, "Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet<TT;TS;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->results:Lio/realm/RealmResults;

    return-object v0
.end method

.method public getValues()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<TS;>;"
        }
    .end annotation

    .prologue
    .line 351
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;, "Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet<TT;TS;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mValues:Ljava/util/List;

    return-object v0
.end method

.method public getValuesField()Ljava/lang/String;
    .registers 2

    .prologue
    .line 370
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;, "Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet<TT;TS;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mValuesField:Ljava/lang/String;

    return-object v0
.end method

.method public getYMax()F
    .registers 2

    .prologue
    .line 104
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;, "Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet<TT;TS;>;"
    iget v0, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mYMax:F

    return v0
.end method

.method public getYMin()F
    .registers 2

    .prologue
    .line 98
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;, "Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet<TT;TS;>;"
    iget v0, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mYMin:F

    return v0
.end method

.method public getYValForXIndex(I)F
    .registers 4
    .param p1, "xIndex"    # I

    .prologue
    .line 245
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;, "Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet<TT;TS;>;"
    invoke-virtual {p0, p1}, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->getEntryForXIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v0

    .line 247
    .local v0, "e":Lcom/github/mikephil/charting/data/Entry;
    if-eqz v0, :cond_11

    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v1

    if-ne v1, p1, :cond_11

    .line 248
    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v1

    .line 250
    :goto_10
    return v1

    :cond_11
    const/high16 v1, 0x7fc00000    # Float.NaN

    goto :goto_10
.end method

.method public getYValsForXIndex(I)[F
    .registers 9
    .param p1, "xIndex"    # I

    .prologue
    .line 256
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;, "Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet<TT;TS;>;"
    invoke-virtual {p0, p1}, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->getEntriesForXIndex(I)Ljava/util/List;

    move-result-object v1

    .line 258
    .local v1, "entries":Ljava/util/List;, "Ljava/util/List<TS;>;"
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v6

    new-array v5, v6, [F

    .line 259
    .local v5, "yVals":[F
    const/4 v2, 0x0

    .line 261
    .local v2, "i":I
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :goto_f
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_25

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/github/mikephil/charting/data/Entry;

    .line 262
    .local v0, "e":Lcom/github/mikephil/charting/data/Entry;, "TS;"
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "i":I
    .local v3, "i":I
    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v6

    aput v6, v5, v2

    move v2, v3

    .end local v3    # "i":I
    .restart local v2    # "i":I
    goto :goto_f

    .line 264
    .end local v0    # "e":Lcom/github/mikephil/charting/data/Entry;, "TS;"
    :cond_25
    return-object v5
.end method

.method public removeEntry(Lcom/github/mikephil/charting/data/Entry;)Z
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TS;)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;, "Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet<TT;TS;>;"
    .local p1, "e":Lcom/github/mikephil/charting/data/Entry;, "TS;"
    const/4 v1, 0x0

    .line 297
    if-nez p1, :cond_5

    move v0, v1

    .line 310
    :cond_4
    :goto_4
    return v0

    .line 300
    :cond_5
    iget-object v2, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mValues:Ljava/util/List;

    if-nez v2, :cond_b

    move v0, v1

    .line 301
    goto :goto_4

    .line 304
    :cond_b
    iget-object v2, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mValues:Ljava/util/List;

    invoke-interface {v2, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-result v0

    .line 306
    .local v0, "removed":Z
    if-eqz v0, :cond_4

    .line 307
    iget-object v2, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mValues:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {p0, v1, v2}, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->calcMinMax(II)V

    goto :goto_4
.end method

.method public setIndexField(Ljava/lang/String;)V
    .registers 2
    .param p1, "xIndexField"    # Ljava/lang/String;

    .prologue
    .line 397
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;, "Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet<TT;TS;>;"
    iput-object p1, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mIndexField:Ljava/lang/String;

    .line 398
    return-void
.end method

.method public setValuesField(Ljava/lang/String;)V
    .registers 2
    .param p1, "yValuesField"    # Ljava/lang/String;

    .prologue
    .line 379
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;, "Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet<TT;TS;>;"
    iput-object p1, p0, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;->mValuesField:Ljava/lang/String;

    .line 380
    return-void
.end method
