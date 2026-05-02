.class public abstract Lcom/github/mikephil/charting/data/DataSet;
.super Lcom/github/mikephil/charting/data/BaseDataSet;
.source "DataSet.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/github/mikephil/charting/data/DataSet$Rounding;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/github/mikephil/charting/data/Entry;",
        ">",
        "Lcom/github/mikephil/charting/data/BaseDataSet",
        "<TT;>;"
    }
.end annotation


# instance fields
.field protected mYMax:F

.field protected mYMin:F

.field protected mYVals:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;Ljava/lang/String;)V
    .registers 5
    .param p2, "label"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<TT;>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/data/DataSet;, "Lcom/github/mikephil/charting/data/DataSet<TT;>;"
    .local p1, "yVals":Ljava/util/List;, "Ljava/util/List<TT;>;"
    const/4 v1, 0x0

    .line 42
    invoke-direct {p0, p2}, Lcom/github/mikephil/charting/data/BaseDataSet;-><init>(Ljava/lang/String;)V

    .line 20
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/github/mikephil/charting/data/DataSet;->mYVals:Ljava/util/List;

    .line 25
    iput v1, p0, Lcom/github/mikephil/charting/data/DataSet;->mYMax:F

    .line 30
    iput v1, p0, Lcom/github/mikephil/charting/data/DataSet;->mYMin:F

    .line 43
    iput-object p1, p0, Lcom/github/mikephil/charting/data/DataSet;->mYVals:Ljava/util/List;

    .line 45
    iget-object v0, p0, Lcom/github/mikephil/charting/data/DataSet;->mYVals:Ljava/util/List;

    if-nez v0, :cond_18

    .line 46
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/data/DataSet;->mYVals:Ljava/util/List;

    .line 48
    :cond_18
    const/4 v0, 0x0

    iget-object v1, p0, Lcom/github/mikephil/charting/data/DataSet;->mYVals:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/github/mikephil/charting/data/DataSet;->calcMinMax(II)V

    .line 49
    return-void
.end method


# virtual methods
.method public addEntry(Lcom/github/mikephil/charting/data/Entry;)Z
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .prologue
    .line 195
    .local p0, "this":Lcom/github/mikephil/charting/data/DataSet;, "Lcom/github/mikephil/charting/data/DataSet<TT;>;"
    .local p1, "e":Lcom/github/mikephil/charting/data/Entry;, "TT;"
    if-nez p1, :cond_4

    .line 196
    const/4 v2, 0x0

    .line 217
    :goto_3
    return v2

    .line 198
    :cond_4
    invoke-virtual {p1}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v0

    .line 200
    .local v0, "val":F
    invoke-virtual {p0}, Lcom/github/mikephil/charting/data/DataSet;->getYVals()Ljava/util/List;

    move-result-object v1

    .line 201
    .local v1, "yVals":Ljava/util/List;, "Ljava/util/List<TT;>;"
    if-nez v1, :cond_13

    .line 202
    new-instance v1, Ljava/util/ArrayList;

    .end local v1    # "yVals":Ljava/util/List;, "Ljava/util/List<TT;>;"
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 205
    .restart local v1    # "yVals":Ljava/util/List;, "Ljava/util/List<TT;>;"
    :cond_13
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    if-nez v2, :cond_22

    .line 206
    iput v0, p0, Lcom/github/mikephil/charting/data/DataSet;->mYMax:F

    .line 207
    iput v0, p0, Lcom/github/mikephil/charting/data/DataSet;->mYMin:F

    .line 216
    :cond_1d
    :goto_1d
    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 217
    const/4 v2, 0x1

    goto :goto_3

    .line 209
    :cond_22
    iget v2, p0, Lcom/github/mikephil/charting/data/DataSet;->mYMax:F

    cmpg-float v2, v2, v0

    if-gez v2, :cond_2a

    .line 210
    iput v0, p0, Lcom/github/mikephil/charting/data/DataSet;->mYMax:F

    .line 211
    :cond_2a
    iget v2, p0, Lcom/github/mikephil/charting/data/DataSet;->mYMin:F

    cmpl-float v2, v2, v0

    if-lez v2, :cond_1d

    .line 212
    iput v0, p0, Lcom/github/mikephil/charting/data/DataSet;->mYMin:F

    goto :goto_1d
.end method

.method public addEntryOrdered(Lcom/github/mikephil/charting/data/Entry;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 158
    .local p0, "this":Lcom/github/mikephil/charting/data/DataSet;, "Lcom/github/mikephil/charting/data/DataSet<TT;>;"
    .local p1, "e":Lcom/github/mikephil/charting/data/Entry;, "TT;"
    if-nez p1, :cond_3

    .line 184
    :goto_2
    return-void

    .line 161
    :cond_3
    invoke-virtual {p1}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v1

    .line 163
    .local v1, "val":F
    iget-object v2, p0, Lcom/github/mikephil/charting/data/DataSet;->mYVals:Ljava/util/List;

    if-nez v2, :cond_12

    .line 164
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/github/mikephil/charting/data/DataSet;->mYVals:Ljava/util/List;

    .line 167
    :cond_12
    iget-object v2, p0, Lcom/github/mikephil/charting/data/DataSet;->mYVals:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-nez v2, :cond_50

    .line 168
    iput v1, p0, Lcom/github/mikephil/charting/data/DataSet;->mYMax:F

    .line 169
    iput v1, p0, Lcom/github/mikephil/charting/data/DataSet;->mYMin:F

    .line 177
    :cond_1e
    :goto_1e
    iget-object v2, p0, Lcom/github/mikephil/charting/data/DataSet;->mYVals:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_61

    iget-object v2, p0, Lcom/github/mikephil/charting/data/DataSet;->mYVals:Ljava/util/List;

    iget-object v3, p0, Lcom/github/mikephil/charting/data/DataSet;->mYVals:Ljava/util/List;

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

    .line 178
    invoke-virtual {p1}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v2

    sget-object v3, Lcom/github/mikephil/charting/data/DataSet$Rounding;->UP:Lcom/github/mikephil/charting/data/DataSet$Rounding;

    invoke-virtual {p0, v2, v3}, Lcom/github/mikephil/charting/data/DataSet;->getEntryIndex(ILcom/github/mikephil/charting/data/DataSet$Rounding;)I

    move-result v0

    .line 179
    .local v0, "closestIndex":I
    iget-object v2, p0, Lcom/github/mikephil/charting/data/DataSet;->mYVals:Ljava/util/List;

    invoke-interface {v2, v0, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    goto :goto_2

    .line 171
    .end local v0    # "closestIndex":I
    :cond_50
    iget v2, p0, Lcom/github/mikephil/charting/data/DataSet;->mYMax:F

    cmpg-float v2, v2, v1

    if-gez v2, :cond_58

    .line 172
    iput v1, p0, Lcom/github/mikephil/charting/data/DataSet;->mYMax:F

    .line 173
    :cond_58
    iget v2, p0, Lcom/github/mikephil/charting/data/DataSet;->mYMin:F

    cmpl-float v2, v2, v1

    if-lez v2, :cond_1e

    .line 174
    iput v1, p0, Lcom/github/mikephil/charting/data/DataSet;->mYMin:F

    goto :goto_1e

    .line 183
    :cond_61
    iget-object v2, p0, Lcom/github/mikephil/charting/data/DataSet;->mYVals:Ljava/util/List;

    invoke-interface {v2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2
.end method

.method public calcMinMax(II)V
    .registers 11
    .param p1, "start"    # I
    .param p2, "end"    # I

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/data/DataSet;, "Lcom/github/mikephil/charting/data/DataSet<TT;>;"
    const v7, 0x7f7fffff    # Float.MAX_VALUE

    const/4 v6, 0x0

    .line 54
    iget-object v4, p0, Lcom/github/mikephil/charting/data/DataSet;->mYVals:Ljava/util/List;

    if-nez v4, :cond_9

    .line 90
    :cond_8
    :goto_8
    return-void

    .line 57
    :cond_9
    iget-object v4, p0, Lcom/github/mikephil/charting/data/DataSet;->mYVals:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v3

    .line 59
    .local v3, "yValCount":I
    if-eqz v3, :cond_8

    .line 64
    if-eqz p2, :cond_15

    if-lt p2, v3, :cond_58

    .line 65
    :cond_15
    add-int/lit8 v1, v3, -0x1

    .line 69
    .local v1, "endValue":I
    :goto_17
    iput v7, p0, Lcom/github/mikephil/charting/data/DataSet;->mYMin:F

    .line 70
    const v4, -0x800001

    iput v4, p0, Lcom/github/mikephil/charting/data/DataSet;->mYMax:F

    .line 72
    move v2, p1

    .local v2, "i":I
    :goto_1f
    if-gt v2, v1, :cond_5a

    .line 74
    iget-object v4, p0, Lcom/github/mikephil/charting/data/DataSet;->mYVals:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/github/mikephil/charting/data/Entry;

    .line 76
    .local v0, "e":Lcom/github/mikephil/charting/data/Entry;, "TT;"
    if-eqz v0, :cond_55

    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v4

    invoke-static {v4}, Ljava/lang/Float;->isNaN(F)Z

    move-result v4

    if-nez v4, :cond_55

    .line 78
    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v4

    iget v5, p0, Lcom/github/mikephil/charting/data/DataSet;->mYMin:F

    cmpg-float v4, v4, v5

    if-gez v4, :cond_45

    .line 79
    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v4

    iput v4, p0, Lcom/github/mikephil/charting/data/DataSet;->mYMin:F

    .line 81
    :cond_45
    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v4

    iget v5, p0, Lcom/github/mikephil/charting/data/DataSet;->mYMax:F

    cmpl-float v4, v4, v5

    if-lez v4, :cond_55

    .line 82
    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v4

    iput v4, p0, Lcom/github/mikephil/charting/data/DataSet;->mYMax:F

    .line 72
    :cond_55
    add-int/lit8 v2, v2, 0x1

    goto :goto_1f

    .line 67
    .end local v0    # "e":Lcom/github/mikephil/charting/data/Entry;, "TT;"
    .end local v1    # "endValue":I
    .end local v2    # "i":I
    :cond_58
    move v1, p2

    .restart local v1    # "endValue":I
    goto :goto_17

    .line 86
    .restart local v2    # "i":I
    :cond_5a
    iget v4, p0, Lcom/github/mikephil/charting/data/DataSet;->mYMin:F

    cmpl-float v4, v4, v7

    if-nez v4, :cond_8

    .line 87
    iput v6, p0, Lcom/github/mikephil/charting/data/DataSet;->mYMin:F

    .line 88
    iput v6, p0, Lcom/github/mikephil/charting/data/DataSet;->mYMax:F

    goto :goto_8
.end method

.method public clear()V
    .registers 2

    .prologue
    .line 188
    .local p0, "this":Lcom/github/mikephil/charting/data/DataSet;, "Lcom/github/mikephil/charting/data/DataSet<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/data/DataSet;->mYVals:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 189
    invoke-virtual {p0}, Lcom/github/mikephil/charting/data/DataSet;->notifyDataSetChanged()V

    .line 190
    return-void
.end method

.method public abstract copy()Lcom/github/mikephil/charting/data/DataSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/github/mikephil/charting/data/DataSet",
            "<TT;>;"
        }
    .end annotation
.end method

.method public getEntriesForXIndex(I)Ljava/util/List;
    .registers 9
    .param p1, "xIndex"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 340
    .local p0, "this":Lcom/github/mikephil/charting/data/DataSet;, "Lcom/github/mikephil/charting/data/DataSet<TT;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 342
    .local v0, "entries":Ljava/util/List;, "Ljava/util/List<TT;>;"
    const/4 v3, 0x0

    .line 343
    .local v3, "low":I
    iget-object v5, p0, Lcom/github/mikephil/charting/data/DataSet;->mYVals:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    add-int/lit8 v2, v5, -0x1

    .line 345
    .local v2, "high":I
    :goto_e
    if-gt v3, v2, :cond_5f

    .line 346
    add-int v5, v2, v3

    div-int/lit8 v4, v5, 0x2

    .line 347
    .local v4, "m":I
    iget-object v5, p0, Lcom/github/mikephil/charting/data/DataSet;->mYVals:Ljava/util/List;

    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/github/mikephil/charting/data/Entry;

    .line 349
    .local v1, "entry":Lcom/github/mikephil/charting/data/Entry;, "TT;"
    invoke-virtual {v1}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v5

    if-ne p1, v5, :cond_53

    .line 350
    :goto_22
    if-lez v4, :cond_37

    iget-object v5, p0, Lcom/github/mikephil/charting/data/DataSet;->mYVals:Ljava/util/List;

    add-int/lit8 v6, v4, -0x1

    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/github/mikephil/charting/data/Entry;

    invoke-virtual {v5}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v5

    if-ne v5, p1, :cond_37

    .line 351
    add-int/lit8 v4, v4, -0x1

    goto :goto_22

    .line 353
    :cond_37
    iget-object v5, p0, Lcom/github/mikephil/charting/data/DataSet;->mYVals:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v2

    .line 354
    :goto_3d
    if-ge v4, v2, :cond_5f

    .line 355
    iget-object v5, p0, Lcom/github/mikephil/charting/data/DataSet;->mYVals:Ljava/util/List;

    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "entry":Lcom/github/mikephil/charting/data/Entry;, "TT;"
    check-cast v1, Lcom/github/mikephil/charting/data/Entry;

    .line 356
    .restart local v1    # "entry":Lcom/github/mikephil/charting/data/Entry;, "TT;"
    invoke-virtual {v1}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v5

    if-ne v5, p1, :cond_5f

    .line 357
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 354
    add-int/lit8 v4, v4, 0x1

    goto :goto_3d

    .line 365
    :cond_53
    invoke-virtual {v1}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v5

    if-le p1, v5, :cond_5c

    .line 366
    add-int/lit8 v3, v4, 0x1

    goto :goto_e

    .line 368
    :cond_5c
    add-int/lit8 v2, v4, -0x1

    goto :goto_e

    .line 372
    .end local v1    # "entry":Lcom/github/mikephil/charting/data/Entry;, "TT;"
    .end local v4    # "m":I
    :cond_5f
    return-object v0
.end method

.method public getEntryCount()I
    .registers 2

    .prologue
    .line 94
    .local p0, "this":Lcom/github/mikephil/charting/data/DataSet;, "Lcom/github/mikephil/charting/data/DataSet<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/data/DataSet;->mYVals:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;
    .registers 3
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 260
    .local p0, "this":Lcom/github/mikephil/charting/data/DataSet;, "Lcom/github/mikephil/charting/data/DataSet<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/data/DataSet;->mYVals:Ljava/util/List;

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
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 255
    .local p0, "this":Lcom/github/mikephil/charting/data/DataSet;, "Lcom/github/mikephil/charting/data/DataSet<TT;>;"
    sget-object v0, Lcom/github/mikephil/charting/data/DataSet$Rounding;->CLOSEST:Lcom/github/mikephil/charting/data/DataSet$Rounding;

    invoke-virtual {p0, p1, v0}, Lcom/github/mikephil/charting/data/DataSet;->getEntryForXIndex(ILcom/github/mikephil/charting/data/DataSet$Rounding;)Lcom/github/mikephil/charting/data/Entry;

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
            ")TT;"
        }
    .end annotation

    .prologue
    .line 247
    .local p0, "this":Lcom/github/mikephil/charting/data/DataSet;, "Lcom/github/mikephil/charting/data/DataSet<TT;>;"
    invoke-virtual {p0, p1, p2}, Lcom/github/mikephil/charting/data/DataSet;->getEntryIndex(ILcom/github/mikephil/charting/data/DataSet$Rounding;)I

    move-result v0

    .line 248
    .local v0, "index":I
    const/4 v1, -0x1

    if-le v0, v1, :cond_10

    .line 249
    iget-object v1, p0, Lcom/github/mikephil/charting/data/DataSet;->mYVals:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/github/mikephil/charting/data/Entry;

    .line 250
    :goto_f
    return-object v1

    :cond_10
    const/4 v1, 0x0

    goto :goto_f
.end method

.method public getEntryIndex(ILcom/github/mikephil/charting/data/DataSet$Rounding;)I
    .registers 10
    .param p1, "xIndex"    # I
    .param p2, "rounding"    # Lcom/github/mikephil/charting/data/DataSet$Rounding;

    .prologue
    .line 266
    .local p0, "this":Lcom/github/mikephil/charting/data/DataSet;, "Lcom/github/mikephil/charting/data/DataSet<TT;>;"
    const/4 v3, 0x0

    .line 267
    .local v3, "low":I
    iget-object v5, p0, Lcom/github/mikephil/charting/data/DataSet;->mYVals:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    add-int/lit8 v2, v5, -0x1

    .line 268
    .local v2, "high":I
    const/4 v0, -0x1

    .line 270
    .local v0, "closest":I
    :goto_a
    if-gt v3, v2, :cond_48

    .line 271
    add-int v5, v2, v3

    div-int/lit8 v4, v5, 0x2

    .line 273
    .local v4, "m":I
    iget-object v5, p0, Lcom/github/mikephil/charting/data/DataSet;->mYVals:Ljava/util/List;

    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/github/mikephil/charting/data/Entry;

    invoke-virtual {v5}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v5

    if-ne p1, v5, :cond_33

    .line 274
    :goto_1e
    if-lez v4, :cond_6a

    iget-object v5, p0, Lcom/github/mikephil/charting/data/DataSet;->mYVals:Ljava/util/List;

    add-int/lit8 v6, v4, -0x1

    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/github/mikephil/charting/data/Entry;

    invoke-virtual {v5}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v5

    if-ne v5, p1, :cond_6a

    .line 275
    add-int/lit8 v4, v4, -0x1

    goto :goto_1e

    .line 280
    :cond_33
    iget-object v5, p0, Lcom/github/mikephil/charting/data/DataSet;->mYVals:Ljava/util/List;

    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/github/mikephil/charting/data/Entry;

    invoke-virtual {v5}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v5

    if-le p1, v5, :cond_45

    .line 281
    add-int/lit8 v3, v4, 0x1

    .line 285
    :goto_43
    move v0, v4

    .line 286
    goto :goto_a

    .line 283
    :cond_45
    add-int/lit8 v2, v4, -0x1

    goto :goto_43

    .line 288
    .end local v4    # "m":I
    :cond_48
    const/4 v5, -0x1

    if-eq v0, v5, :cond_69

    .line 289
    iget-object v5, p0, Lcom/github/mikephil/charting/data/DataSet;->mYVals:Ljava/util/List;

    invoke-interface {v5, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/github/mikephil/charting/data/Entry;

    invoke-virtual {v5}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v1

    .line 290
    .local v1, "closestXIndex":I
    sget-object v5, Lcom/github/mikephil/charting/data/DataSet$Rounding;->UP:Lcom/github/mikephil/charting/data/DataSet$Rounding;

    if-ne p2, v5, :cond_6b

    .line 291
    if-ge v1, p1, :cond_69

    iget-object v5, p0, Lcom/github/mikephil/charting/data/DataSet;->mYVals:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    if-ge v0, v5, :cond_69

    .line 292
    add-int/lit8 v0, v0, 0x1

    .end local v1    # "closestXIndex":I
    :cond_69
    :goto_69
    move v4, v0

    .line 301
    :cond_6a
    return v4

    .line 294
    .restart local v1    # "closestXIndex":I
    :cond_6b
    sget-object v5, Lcom/github/mikephil/charting/data/DataSet$Rounding;->DOWN:Lcom/github/mikephil/charting/data/DataSet$Rounding;

    if-ne p2, v5, :cond_69

    .line 295
    if-le v1, p1, :cond_69

    if-lez v0, :cond_69

    .line 296
    add-int/lit8 v0, v0, -0x1

    goto :goto_69
.end method

.method public getEntryIndex(Lcom/github/mikephil/charting/data/Entry;)I
    .registers 3
    .param p1, "e"    # Lcom/github/mikephil/charting/data/Entry;

    .prologue
    .line 241
    .local p0, "this":Lcom/github/mikephil/charting/data/DataSet;, "Lcom/github/mikephil/charting/data/DataSet<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/data/DataSet;->mYVals:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public getYMax()F
    .registers 2

    .prologue
    .line 152
    .local p0, "this":Lcom/github/mikephil/charting/data/DataSet;, "Lcom/github/mikephil/charting/data/DataSet<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/data/DataSet;->mYMax:F

    return v0
.end method

.method public getYMin()F
    .registers 2

    .prologue
    .line 147
    .local p0, "this":Lcom/github/mikephil/charting/data/DataSet;, "Lcom/github/mikephil/charting/data/DataSet<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/data/DataSet;->mYMin:F

    return v0
.end method

.method public getYValForXIndex(I)F
    .registers 4
    .param p1, "xIndex"    # I

    .prologue
    .line 307
    .local p0, "this":Lcom/github/mikephil/charting/data/DataSet;, "Lcom/github/mikephil/charting/data/DataSet<TT;>;"
    invoke-virtual {p0, p1}, Lcom/github/mikephil/charting/data/DataSet;->getEntryForXIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v0

    .line 309
    .local v0, "e":Lcom/github/mikephil/charting/data/Entry;
    if-eqz v0, :cond_11

    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v1

    if-ne v1, p1, :cond_11

    .line 310
    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v1

    .line 312
    :goto_10
    return v1

    :cond_11
    const/high16 v1, 0x7fc00000    # Float.NaN

    goto :goto_10
.end method

.method public getYVals()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 103
    .local p0, "this":Lcom/github/mikephil/charting/data/DataSet;, "Lcom/github/mikephil/charting/data/DataSet<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/data/DataSet;->mYVals:Ljava/util/List;

    return-object v0
.end method

.method public getYValsForXIndex(I)[F
    .registers 9
    .param p1, "xIndex"    # I

    .prologue
    .line 318
    .local p0, "this":Lcom/github/mikephil/charting/data/DataSet;, "Lcom/github/mikephil/charting/data/DataSet<TT;>;"
    invoke-virtual {p0, p1}, Lcom/github/mikephil/charting/data/DataSet;->getEntriesForXIndex(I)Ljava/util/List;

    move-result-object v1

    .line 320
    .local v1, "entries":Ljava/util/List;, "Ljava/util/List<TT;>;"
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v6

    new-array v5, v6, [F

    .line 321
    .local v5, "yVals":[F
    const/4 v2, 0x0

    .line 323
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

    .line 324
    .local v0, "e":Lcom/github/mikephil/charting/data/Entry;, "TT;"
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

    .line 326
    .end local v0    # "e":Lcom/github/mikephil/charting/data/Entry;, "TT;"
    :cond_25
    return-object v5
.end method

.method public removeEntry(Lcom/github/mikephil/charting/data/Entry;)Z
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/data/DataSet;, "Lcom/github/mikephil/charting/data/DataSet<TT;>;"
    .local p1, "e":Lcom/github/mikephil/charting/data/Entry;, "TT;"
    const/4 v1, 0x0

    .line 223
    if-nez p1, :cond_5

    move v0, v1

    .line 236
    :cond_4
    :goto_4
    return v0

    .line 226
    :cond_5
    iget-object v2, p0, Lcom/github/mikephil/charting/data/DataSet;->mYVals:Ljava/util/List;

    if-nez v2, :cond_b

    move v0, v1

    .line 227
    goto :goto_4

    .line 230
    :cond_b
    iget-object v2, p0, Lcom/github/mikephil/charting/data/DataSet;->mYVals:Ljava/util/List;

    invoke-interface {v2, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-result v0

    .line 232
    .local v0, "removed":Z
    if-eqz v0, :cond_4

    .line 233
    iget-object v2, p0, Lcom/github/mikephil/charting/data/DataSet;->mYVals:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {p0, v1, v2}, Lcom/github/mikephil/charting/data/DataSet;->calcMinMax(II)V

    goto :goto_4
.end method

.method public setYVals(Ljava/util/List;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 112
    .local p0, "this":Lcom/github/mikephil/charting/data/DataSet;, "Lcom/github/mikephil/charting/data/DataSet<TT;>;"
    .local p1, "yVals":Ljava/util/List;, "Ljava/util/List<TT;>;"
    iput-object p1, p0, Lcom/github/mikephil/charting/data/DataSet;->mYVals:Ljava/util/List;

    .line 113
    invoke-virtual {p0}, Lcom/github/mikephil/charting/data/DataSet;->notifyDataSetChanged()V

    .line 114
    return-void
.end method

.method public toSimpleString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 140
    .local p0, "this":Lcom/github/mikephil/charting/data/DataSet;, "Lcom/github/mikephil/charting/data/DataSet<TT;>;"
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 141
    .local v0, "buffer":Ljava/lang/StringBuffer;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "DataSet, label: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/github/mikephil/charting/data/DataSet;->getLabel()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_3e

    const-string v1, ""

    :goto_18
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", entries: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/github/mikephil/charting/data/DataSet;->mYVals:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 142
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 141
    :cond_3e
    invoke-virtual {p0}, Lcom/github/mikephil/charting/data/DataSet;->getLabel()Ljava/lang/String;

    move-result-object v1

    goto :goto_18
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 125
    .local p0, "this":Lcom/github/mikephil/charting/data/DataSet;, "Lcom/github/mikephil/charting/data/DataSet<TT;>;"
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 126
    .local v0, "buffer":Ljava/lang/StringBuffer;
    invoke-virtual {p0}, Lcom/github/mikephil/charting/data/DataSet;->toSimpleString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 127
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_d
    iget-object v2, p0, Lcom/github/mikephil/charting/data/DataSet;->mYVals:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_3a

    .line 128
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/github/mikephil/charting/data/DataSet;->mYVals:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/github/mikephil/charting/data/Entry;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/data/Entry;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 127
    add-int/lit8 v1, v1, 0x1

    goto :goto_d

    .line 130
    :cond_3a
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
