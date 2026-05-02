.class public Lcom/github/mikephil/charting/data/realm/implementation/RealmScatterDataSet;
.super Lcom/github/mikephil/charting/data/realm/base/RealmLineScatterCandleRadarDataSet;
.source "RealmScatterDataSet.java"

# interfaces
.implements Lcom/github/mikephil/charting/interfaces/datasets/IScatterDataSet;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lio/realm/RealmObject;",
        ">",
        "Lcom/github/mikephil/charting/data/realm/base/RealmLineScatterCandleRadarDataSet",
        "<TT;",
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
.method public constructor <init>(Lio/realm/RealmResults;Ljava/lang/String;)V
    .registers 5
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
    .line 50
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmScatterDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmScatterDataSet<TT;>;"
    .local p1, "result":Lio/realm/RealmResults;, "Lio/realm/RealmResults<TT;>;"
    invoke-direct {p0, p1, p2}, Lcom/github/mikephil/charting/data/realm/base/RealmLineScatterCandleRadarDataSet;-><init>(Lio/realm/RealmResults;Ljava/lang/String;)V

    .line 22
    const/high16 v0, 0x41200000    # 10.0f

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmScatterDataSet;->mShapeSize:F

    .line 28
    sget-object v0, Lcom/github/mikephil/charting/charts/ScatterChart$ScatterShape;->SQUARE:Lcom/github/mikephil/charting/charts/ScatterChart$ScatterShape;

    iput-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmScatterDataSet;->mScatterShape:Lcom/github/mikephil/charting/charts/ScatterChart$ScatterShape;

    .line 34
    const/4 v0, 0x0

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmScatterDataSet;->mScatterShapeHoleRadius:F

    .line 41
    const v0, 0x112233

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmScatterDataSet;->mScatterShapeHoleColor:I

    .line 52
    iget-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmScatterDataSet;->results:Lio/realm/RealmResults;

    invoke-virtual {p0, v0}, Lcom/github/mikephil/charting/data/realm/implementation/RealmScatterDataSet;->build(Lio/realm/RealmResults;)V

    .line 53
    const/4 v0, 0x0

    iget-object v1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmScatterDataSet;->results:Lio/realm/RealmResults;

    invoke-virtual {v1}, Lio/realm/RealmResults;->size()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/github/mikephil/charting/data/realm/implementation/RealmScatterDataSet;->calcMinMax(II)V

    .line 54
    return-void
.end method

.method public constructor <init>(Lio/realm/RealmResults;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
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
    .line 64
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmScatterDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmScatterDataSet<TT;>;"
    .local p1, "result":Lio/realm/RealmResults;, "Lio/realm/RealmResults<TT;>;"
    invoke-direct {p0, p1, p2, p3}, Lcom/github/mikephil/charting/data/realm/base/RealmLineScatterCandleRadarDataSet;-><init>(Lio/realm/RealmResults;Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    const/high16 v0, 0x41200000    # 10.0f

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmScatterDataSet;->mShapeSize:F

    .line 28
    sget-object v0, Lcom/github/mikephil/charting/charts/ScatterChart$ScatterShape;->SQUARE:Lcom/github/mikephil/charting/charts/ScatterChart$ScatterShape;

    iput-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmScatterDataSet;->mScatterShape:Lcom/github/mikephil/charting/charts/ScatterChart$ScatterShape;

    .line 34
    const/4 v0, 0x0

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmScatterDataSet;->mScatterShapeHoleRadius:F

    .line 41
    const v0, 0x112233

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmScatterDataSet;->mScatterShapeHoleColor:I

    .line 66
    iget-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmScatterDataSet;->results:Lio/realm/RealmResults;

    invoke-virtual {p0, v0}, Lcom/github/mikephil/charting/data/realm/implementation/RealmScatterDataSet;->build(Lio/realm/RealmResults;)V

    .line 67
    const/4 v0, 0x0

    iget-object v1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmScatterDataSet;->results:Lio/realm/RealmResults;

    invoke-virtual {v1}, Lio/realm/RealmResults;->size()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/github/mikephil/charting/data/realm/implementation/RealmScatterDataSet;->calcMinMax(II)V

    .line 68
    return-void
.end method


# virtual methods
.method public getScatterShape()Lcom/github/mikephil/charting/charts/ScatterChart$ScatterShape;
    .registers 2

    .prologue
    .line 98
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmScatterDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmScatterDataSet<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmScatterDataSet;->mScatterShape:Lcom/github/mikephil/charting/charts/ScatterChart$ScatterShape;

    return-object v0
.end method

.method public getScatterShapeHoleColor()I
    .registers 2

    .prologue
    .line 126
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmScatterDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmScatterDataSet<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmScatterDataSet;->mScatterShapeHoleColor:I

    return v0
.end method

.method public getScatterShapeHoleRadius()F
    .registers 2

    .prologue
    .line 112
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmScatterDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmScatterDataSet<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmScatterDataSet;->mScatterShapeHoleRadius:F

    return v0
.end method

.method public getScatterShapeSize()F
    .registers 2

    .prologue
    .line 82
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmScatterDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmScatterDataSet<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmScatterDataSet;->mShapeSize:F

    return v0
.end method

.method public setScatterShape(Lcom/github/mikephil/charting/charts/ScatterChart$ScatterShape;)V
    .registers 2
    .param p1, "shape"    # Lcom/github/mikephil/charting/charts/ScatterChart$ScatterShape;

    .prologue
    .line 93
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmScatterDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmScatterDataSet<TT;>;"
    iput-object p1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmScatterDataSet;->mScatterShape:Lcom/github/mikephil/charting/charts/ScatterChart$ScatterShape;

    .line 94
    return-void
.end method

.method public setScatterShapeHoleColor(I)V
    .registers 2
    .param p1, "holeColor"    # I

    .prologue
    .line 121
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmScatterDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmScatterDataSet<TT;>;"
    iput p1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmScatterDataSet;->mScatterShapeHoleColor:I

    .line 122
    return-void
.end method

.method public setScatterShapeHoleRadius(F)V
    .registers 2
    .param p1, "holeRadius"    # F

    .prologue
    .line 107
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmScatterDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmScatterDataSet<TT;>;"
    iput p1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmScatterDataSet;->mScatterShapeHoleRadius:F

    .line 108
    return-void
.end method

.method public setScatterShapeSize(F)V
    .registers 2
    .param p1, "size"    # F

    .prologue
    .line 77
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmScatterDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmScatterDataSet<TT;>;"
    iput p1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmScatterDataSet;->mShapeSize:F

    .line 78
    return-void
.end method
