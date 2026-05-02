.class public Lcom/github/mikephil/charting/data/ScatterDataSet;
.super Lcom/github/mikephil/charting/data/LineScatterCandleRadarDataSet;
.source "ScatterDataSet.java"

# interfaces
.implements Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/github/mikephil/charting/data/LineScatterCandleRadarDataSet",
        "<",
        "Lcom/github/mikephil/charting/data/Entry;",
        ">;",
        "Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;"
    }
.end annotation


# instance fields
.field private mScatterShape:Lcom/github/mikephil/charting/charts/ScatterChart$ScatterShape;

.field private mScatterShapeHoleColor:I

.field private mScatterShapeHoleRadius:F

.field private mShapeSize:F


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
    .line 43
    .local p1, "yVals":Ljava/util/List;, "Ljava/util/List<Lcom/github/mikephil/charting/data/Entry;>;"
    invoke-direct {p0, p1, p2}, Lcom/github/mikephil/charting/data/LineScatterCandleRadarDataSet;-><init>(Ljava/util/List;Ljava/lang/String;)V

    .line 16
    const/high16 v0, 0x41700000    # 15.0f

    iput v0, p0, Lcom/github/mikephil/charting/data/ScatterDataSet;->mShapeSize:F

    .line 22
    sget-object v0, Lcom/github/mikephil/charting/charts/ScatterChart$ScatterShape;->SQUARE:Lcom/github/mikephil/charting/charts/ScatterChart$ScatterShape;

    iput-object v0, p0, Lcom/github/mikephil/charting/data/ScatterDataSet;->mScatterShape:Lcom/github/mikephil/charting/charts/ScatterChart$ScatterShape;

    .line 28
    const/4 v0, 0x0

    iput v0, p0, Lcom/github/mikephil/charting/data/ScatterDataSet;->mScatterShapeHoleRadius:F

    .line 35
    const v0, 0x112233

    iput v0, p0, Lcom/github/mikephil/charting/data/ScatterDataSet;->mScatterShapeHoleColor:I

    .line 44
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
    .line 49
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 51
    .local v2, "yVals":Ljava/util/List;, "Ljava/util/List<Lcom/github/mikephil/charting/data/Entry;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_6
    iget-object v3, p0, Lcom/github/mikephil/charting/data/ScatterDataSet;->mYVals:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v1, v3, :cond_20

    .line 52
    iget-object v3, p0, Lcom/github/mikephil/charting/data/ScatterDataSet;->mYVals:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/github/mikephil/charting/data/Entry;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/data/Entry;->copy()Lcom/github/mikephil/charting/data/Entry;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 51
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 55
    :cond_20
    new-instance v0, Lcom/github/mikephil/charting/data/ScatterDataSet;

    invoke-virtual {p0}, Lcom/github/mikephil/charting/data/ScatterDataSet;->getLabel()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Lcom/github/mikephil/charting/data/ScatterDataSet;-><init>(Ljava/util/List;Ljava/lang/String;)V

    .line 56
    .local v0, "copied":Lcom/github/mikephil/charting/data/ScatterDataSet;
    iget-object v3, p0, Lcom/github/mikephil/charting/data/ScatterDataSet;->mColors:Ljava/util/List;

    iput-object v3, v0, Lcom/github/mikephil/charting/data/ScatterDataSet;->mColors:Ljava/util/List;

    .line 57
    iget v3, p0, Lcom/github/mikephil/charting/data/ScatterDataSet;->mShapeSize:F

    iput v3, v0, Lcom/github/mikephil/charting/data/ScatterDataSet;->mShapeSize:F

    .line 58
    iget-object v3, p0, Lcom/github/mikephil/charting/data/ScatterDataSet;->mScatterShape:Lcom/github/mikephil/charting/charts/ScatterChart$ScatterShape;

    iput-object v3, v0, Lcom/github/mikephil/charting/data/ScatterDataSet;->mScatterShape:Lcom/github/mikephil/charting/charts/ScatterChart$ScatterShape;

    .line 59
    iget v3, p0, Lcom/github/mikephil/charting/data/ScatterDataSet;->mScatterShapeHoleRadius:F

    iput v3, v0, Lcom/github/mikephil/charting/data/ScatterDataSet;->mScatterShapeHoleRadius:F

    .line 60
    iget v3, p0, Lcom/github/mikephil/charting/data/ScatterDataSet;->mScatterShapeHoleColor:I

    iput v3, v0, Lcom/github/mikephil/charting/data/ScatterDataSet;->mScatterShapeHoleColor:I

    .line 62
    iget v3, p0, Lcom/github/mikephil/charting/data/ScatterDataSet;->mHighLightColor:I

    iput v3, v0, Lcom/github/mikephil/charting/data/ScatterDataSet;->mHighLightColor:I

    .line 64
    return-object v0
.end method

.method public getScatterShape()Lcom/github/mikephil/charting/charts/ScatterChart$ScatterShape;
    .registers 2

    .prologue
    .line 93
    iget-object v0, p0, Lcom/github/mikephil/charting/data/ScatterDataSet;->mScatterShape:Lcom/github/mikephil/charting/charts/ScatterChart$ScatterShape;

    return-object v0
.end method

.method public getScatterShapeHoleColor()I
    .registers 2

    .prologue
    .line 122
    iget v0, p0, Lcom/github/mikephil/charting/data/ScatterDataSet;->mScatterShapeHoleColor:I

    return v0
.end method

.method public getScatterShapeHoleRadius()F
    .registers 2

    .prologue
    .line 108
    iget v0, p0, Lcom/github/mikephil/charting/data/ScatterDataSet;->mScatterShapeHoleRadius:F

    return v0
.end method

.method public getScatterShapeSize()F
    .registers 2

    .prologue
    .line 79
    iget v0, p0, Lcom/github/mikephil/charting/data/ScatterDataSet;->mShapeSize:F

    return v0
.end method

.method public setScatterShape(Lcom/github/mikephil/charting/charts/ScatterChart$ScatterShape;)V
    .registers 2
    .param p1, "shape"    # Lcom/github/mikephil/charting/charts/ScatterChart$ScatterShape;

    .prologue
    .line 88
    iput-object p1, p0, Lcom/github/mikephil/charting/data/ScatterDataSet;->mScatterShape:Lcom/github/mikephil/charting/charts/ScatterChart$ScatterShape;

    .line 89
    return-void
.end method

.method public setScatterShapeHoleColor(I)V
    .registers 2
    .param p1, "holeColor"    # I

    .prologue
    .line 117
    iput p1, p0, Lcom/github/mikephil/charting/data/ScatterDataSet;->mScatterShapeHoleColor:I

    .line 118
    return-void
.end method

.method public setScatterShapeHoleRadius(F)V
    .registers 2
    .param p1, "holeRadius"    # F

    .prologue
    .line 103
    iput p1, p0, Lcom/github/mikephil/charting/data/ScatterDataSet;->mScatterShapeHoleRadius:F

    .line 104
    return-void
.end method

.method public setScatterShapeSize(F)V
    .registers 2
    .param p1, "size"    # F

    .prologue
    .line 74
    iput p1, p0, Lcom/github/mikephil/charting/data/ScatterDataSet;->mShapeSize:F

    .line 75
    return-void
.end method
