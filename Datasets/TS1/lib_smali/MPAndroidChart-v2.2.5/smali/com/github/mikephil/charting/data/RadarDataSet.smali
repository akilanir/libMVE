.class public Lcom/github/mikephil/charting/data/RadarDataSet;
.super Lcom/github/mikephil/charting/data/LineRadarDataSet;
.source "RadarDataSet.java"

# interfaces
.implements Lcom/github/mikephil/charting/interfaces/datasets/IRadarDataSet;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/github/mikephil/charting/data/LineRadarDataSet",
        "<",
        "Lcom/github/mikephil/charting/data/Entry;",
        ">;",
        "Lcom/github/mikephil/charting/interfaces/datasets/IRadarDataSet;"
    }
.end annotation


# instance fields
.field protected mDrawHighlightCircleEnabled:Z

.field protected mHighlightCircleFillColor:I

.field protected mHighlightCircleInnerRadius:F

.field protected mHighlightCircleOuterRadius:F

.field protected mHighlightCircleStrokeAlpha:I

.field protected mHighlightCircleStrokeColor:I

.field protected mHighlightCircleStrokeWidth:F


# direct methods
.method public constructor <init>(Ljava/util/List;Ljava/lang/String;)V
    .registers 4
    .param p2, "label"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/github/mikephil/charting/data/Entry;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 29
    .local p1, "yVals":Ljava/util/List;, "Ljava/util/List<Lcom/github/mikephil/charting/data/Entry;>;"
    invoke-direct {p0, p1, p2}, Lcom/github/mikephil/charting/data/LineRadarDataSet;-><init>(Ljava/util/List;Ljava/lang/String;)V

    .line 15
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/github/mikephil/charting/data/RadarDataSet;->mDrawHighlightCircleEnabled:Z

    .line 17
    const/4 v0, -0x1

    iput v0, p0, Lcom/github/mikephil/charting/data/RadarDataSet;->mHighlightCircleFillColor:I

    .line 21
    const v0, 0x112233

    iput v0, p0, Lcom/github/mikephil/charting/data/RadarDataSet;->mHighlightCircleStrokeColor:I

    .line 23
    const/16 v0, 0x4c

    iput v0, p0, Lcom/github/mikephil/charting/data/RadarDataSet;->mHighlightCircleStrokeAlpha:I

    .line 24
    const/high16 v0, 0x40400000    # 3.0f

    iput v0, p0, Lcom/github/mikephil/charting/data/RadarDataSet;->mHighlightCircleInnerRadius:F

    .line 25
    const/high16 v0, 0x40800000    # 4.0f

    iput v0, p0, Lcom/github/mikephil/charting/data/RadarDataSet;->mHighlightCircleOuterRadius:F

    .line 26
    const/high16 v0, 0x40000000    # 2.0f

    iput v0, p0, Lcom/github/mikephil/charting/data/RadarDataSet;->mHighlightCircleStrokeWidth:F

    .line 30
    return-void
.end method


# virtual methods
.method public copy()Lcom/github/mikephil/charting/data/DataSet;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/github/mikephil/charting/data/DataSet",
            "<",
            "Lcom/github/mikephil/charting/data/Entry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 119
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 121
    .local v2, "yVals":Ljava/util/List;, "Ljava/util/List<Lcom/github/mikephil/charting/data/Entry;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_6
    iget-object v3, p0, Lcom/github/mikephil/charting/data/RadarDataSet;->mYVals:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v1, v3, :cond_20

    .line 122
    iget-object v3, p0, Lcom/github/mikephil/charting/data/RadarDataSet;->mYVals:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/github/mikephil/charting/data/Entry;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/data/Entry;->copy()Lcom/github/mikephil/charting/data/Entry;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 121
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 125
    :cond_20
    new-instance v0, Lcom/github/mikephil/charting/data/RadarDataSet;

    invoke-virtual {p0}, Lcom/github/mikephil/charting/data/RadarDataSet;->getLabel()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Lcom/github/mikephil/charting/data/RadarDataSet;-><init>(Ljava/util/List;Ljava/lang/String;)V

    .line 126
    .local v0, "copied":Lcom/github/mikephil/charting/data/RadarDataSet;
    iget-object v3, p0, Lcom/github/mikephil/charting/data/RadarDataSet;->mColors:Ljava/util/List;

    iput-object v3, v0, Lcom/github/mikephil/charting/data/RadarDataSet;->mColors:Ljava/util/List;

    .line 127
    iget v3, p0, Lcom/github/mikephil/charting/data/RadarDataSet;->mHighLightColor:I

    iput v3, v0, Lcom/github/mikephil/charting/data/RadarDataSet;->mHighLightColor:I

    .line 129
    return-object v0
.end method

.method public getHighlightCircleFillColor()I
    .registers 2

    .prologue
    .line 49
    iget v0, p0, Lcom/github/mikephil/charting/data/RadarDataSet;->mHighlightCircleFillColor:I

    return v0
.end method

.method public getHighlightCircleInnerRadius()F
    .registers 2

    .prologue
    .line 86
    iget v0, p0, Lcom/github/mikephil/charting/data/RadarDataSet;->mHighlightCircleInnerRadius:F

    return v0
.end method

.method public getHighlightCircleOuterRadius()F
    .registers 2

    .prologue
    .line 97
    iget v0, p0, Lcom/github/mikephil/charting/data/RadarDataSet;->mHighlightCircleOuterRadius:F

    return v0
.end method

.method public getHighlightCircleStrokeAlpha()I
    .registers 2

    .prologue
    .line 75
    iget v0, p0, Lcom/github/mikephil/charting/data/RadarDataSet;->mHighlightCircleStrokeAlpha:I

    return v0
.end method

.method public getHighlightCircleStrokeColor()I
    .registers 2

    .prologue
    .line 62
    iget v0, p0, Lcom/github/mikephil/charting/data/RadarDataSet;->mHighlightCircleStrokeColor:I

    return v0
.end method

.method public getHighlightCircleStrokeWidth()F
    .registers 2

    .prologue
    .line 108
    iget v0, p0, Lcom/github/mikephil/charting/data/RadarDataSet;->mHighlightCircleStrokeWidth:F

    return v0
.end method

.method public isDrawHighlightCircleEnabled()Z
    .registers 2

    .prologue
    .line 36
    iget-boolean v0, p0, Lcom/github/mikephil/charting/data/RadarDataSet;->mDrawHighlightCircleEnabled:Z

    return v0
.end method

.method public setDrawHighlightCircleEnabled(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 43
    iput-boolean p1, p0, Lcom/github/mikephil/charting/data/RadarDataSet;->mDrawHighlightCircleEnabled:Z

    .line 44
    return-void
.end method

.method public setHighlightCircleFillColor(I)V
    .registers 2
    .param p1, "color"    # I

    .prologue
    .line 54
    iput p1, p0, Lcom/github/mikephil/charting/data/RadarDataSet;->mHighlightCircleFillColor:I

    .line 55
    return-void
.end method

.method public setHighlightCircleInnerRadius(F)V
    .registers 2
    .param p1, "radius"    # F

    .prologue
    .line 91
    iput p1, p0, Lcom/github/mikephil/charting/data/RadarDataSet;->mHighlightCircleInnerRadius:F

    .line 92
    return-void
.end method

.method public setHighlightCircleOuterRadius(F)V
    .registers 2
    .param p1, "radius"    # F

    .prologue
    .line 102
    iput p1, p0, Lcom/github/mikephil/charting/data/RadarDataSet;->mHighlightCircleOuterRadius:F

    .line 103
    return-void
.end method

.method public setHighlightCircleStrokeAlpha(I)V
    .registers 2
    .param p1, "alpha"    # I

    .prologue
    .line 80
    iput p1, p0, Lcom/github/mikephil/charting/data/RadarDataSet;->mHighlightCircleStrokeAlpha:I

    .line 81
    return-void
.end method

.method public setHighlightCircleStrokeColor(I)V
    .registers 2
    .param p1, "color"    # I

    .prologue
    .line 69
    iput p1, p0, Lcom/github/mikephil/charting/data/RadarDataSet;->mHighlightCircleStrokeColor:I

    .line 70
    return-void
.end method

.method public setHighlightCircleStrokeWidth(F)V
    .registers 2
    .param p1, "strokeWidth"    # F

    .prologue
    .line 113
    iput p1, p0, Lcom/github/mikephil/charting/data/RadarDataSet;->mHighlightCircleStrokeWidth:F

    .line 114
    return-void
.end method
