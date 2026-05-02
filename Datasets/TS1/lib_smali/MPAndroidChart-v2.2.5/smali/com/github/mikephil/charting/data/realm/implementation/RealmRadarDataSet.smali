.class public Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet;
.super Lcom/github/mikephil/charting/data/realm/base/RealmLineRadarDataSet;
.source "RealmRadarDataSet.java"

# interfaces
.implements Lcom/github/mikephil/charting/interfaces/datasets/IRadarDataSet;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lio/realm/RealmObject;",
        ">",
        "Lcom/github/mikephil/charting/data/realm/base/RealmLineRadarDataSet",
        "<TT;>;",
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
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet<TT;>;"
    .local p1, "result":Lio/realm/RealmResults;, "Lio/realm/RealmResults<TT;>;"
    const/4 v1, 0x0

    .line 38
    invoke-direct {p0, p1, p2}, Lcom/github/mikephil/charting/data/realm/base/RealmLineRadarDataSet;-><init>(Lio/realm/RealmResults;Ljava/lang/String;)V

    .line 18
    iput-boolean v1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet;->mDrawHighlightCircleEnabled:Z

    .line 20
    const/4 v0, -0x1

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet;->mHighlightCircleFillColor:I

    .line 24
    const v0, 0x112233

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet;->mHighlightCircleStrokeColor:I

    .line 26
    const/16 v0, 0x4c

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet;->mHighlightCircleStrokeAlpha:I

    .line 27
    const/high16 v0, 0x40400000    # 3.0f

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet;->mHighlightCircleInnerRadius:F

    .line 28
    const/high16 v0, 0x40800000    # 4.0f

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet;->mHighlightCircleOuterRadius:F

    .line 29
    const/high16 v0, 0x40000000    # 2.0f

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet;->mHighlightCircleStrokeWidth:F

    .line 40
    iget-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet;->results:Lio/realm/RealmResults;

    invoke-virtual {p0, v0}, Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet;->build(Lio/realm/RealmResults;)V

    .line 41
    iget-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet;->results:Lio/realm/RealmResults;

    invoke-virtual {v0}, Lio/realm/RealmResults;->size()I

    move-result v0

    invoke-virtual {p0, v1, v0}, Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet;->calcMinMax(II)V

    .line 42
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
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet<TT;>;"
    .local p1, "result":Lio/realm/RealmResults;, "Lio/realm/RealmResults<TT;>;"
    const/4 v1, 0x0

    .line 52
    invoke-direct {p0, p1, p2, p3}, Lcom/github/mikephil/charting/data/realm/base/RealmLineRadarDataSet;-><init>(Lio/realm/RealmResults;Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    iput-boolean v1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet;->mDrawHighlightCircleEnabled:Z

    .line 20
    const/4 v0, -0x1

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet;->mHighlightCircleFillColor:I

    .line 24
    const v0, 0x112233

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet;->mHighlightCircleStrokeColor:I

    .line 26
    const/16 v0, 0x4c

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet;->mHighlightCircleStrokeAlpha:I

    .line 27
    const/high16 v0, 0x40400000    # 3.0f

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet;->mHighlightCircleInnerRadius:F

    .line 28
    const/high16 v0, 0x40800000    # 4.0f

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet;->mHighlightCircleOuterRadius:F

    .line 29
    const/high16 v0, 0x40000000    # 2.0f

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet;->mHighlightCircleStrokeWidth:F

    .line 54
    iget-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet;->results:Lio/realm/RealmResults;

    invoke-virtual {p0, v0}, Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet;->build(Lio/realm/RealmResults;)V

    .line 55
    iget-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet;->results:Lio/realm/RealmResults;

    invoke-virtual {v0}, Lio/realm/RealmResults;->size()I

    move-result v0

    invoke-virtual {p0, v1, v0}, Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet;->calcMinMax(II)V

    .line 56
    return-void
.end method


# virtual methods
.method public getHighlightCircleFillColor()I
    .registers 2

    .prologue
    .line 75
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet;->mHighlightCircleFillColor:I

    return v0
.end method

.method public getHighlightCircleInnerRadius()F
    .registers 2

    .prologue
    .line 112
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet;->mHighlightCircleInnerRadius:F

    return v0
.end method

.method public getHighlightCircleOuterRadius()F
    .registers 2

    .prologue
    .line 123
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet;->mHighlightCircleOuterRadius:F

    return v0
.end method

.method public getHighlightCircleStrokeAlpha()I
    .registers 2

    .prologue
    .line 101
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet;->mHighlightCircleStrokeAlpha:I

    return v0
.end method

.method public getHighlightCircleStrokeColor()I
    .registers 2

    .prologue
    .line 88
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet;->mHighlightCircleStrokeColor:I

    return v0
.end method

.method public getHighlightCircleStrokeWidth()F
    .registers 2

    .prologue
    .line 134
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet;->mHighlightCircleStrokeWidth:F

    return v0
.end method

.method public isDrawHighlightCircleEnabled()Z
    .registers 2

    .prologue
    .line 62
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet<TT;>;"
    iget-boolean v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet;->mDrawHighlightCircleEnabled:Z

    return v0
.end method

.method public setDrawHighlightCircleEnabled(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 69
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet<TT;>;"
    iput-boolean p1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet;->mDrawHighlightCircleEnabled:Z

    .line 70
    return-void
.end method

.method public setHighlightCircleFillColor(I)V
    .registers 2
    .param p1, "color"    # I

    .prologue
    .line 80
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet<TT;>;"
    iput p1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet;->mHighlightCircleFillColor:I

    .line 81
    return-void
.end method

.method public setHighlightCircleInnerRadius(F)V
    .registers 2
    .param p1, "radius"    # F

    .prologue
    .line 117
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet<TT;>;"
    iput p1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet;->mHighlightCircleInnerRadius:F

    .line 118
    return-void
.end method

.method public setHighlightCircleOuterRadius(F)V
    .registers 2
    .param p1, "radius"    # F

    .prologue
    .line 128
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet<TT;>;"
    iput p1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet;->mHighlightCircleOuterRadius:F

    .line 129
    return-void
.end method

.method public setHighlightCircleStrokeAlpha(I)V
    .registers 2
    .param p1, "alpha"    # I

    .prologue
    .line 106
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet<TT;>;"
    iput p1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet;->mHighlightCircleStrokeAlpha:I

    .line 107
    return-void
.end method

.method public setHighlightCircleStrokeColor(I)V
    .registers 2
    .param p1, "color"    # I

    .prologue
    .line 95
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet<TT;>;"
    iput p1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet;->mHighlightCircleStrokeColor:I

    .line 96
    return-void
.end method

.method public setHighlightCircleStrokeWidth(F)V
    .registers 2
    .param p1, "strokeWidth"    # F

    .prologue
    .line 139
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet<TT;>;"
    iput p1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmRadarDataSet;->mHighlightCircleStrokeWidth:F

    .line 140
    return-void
.end method
