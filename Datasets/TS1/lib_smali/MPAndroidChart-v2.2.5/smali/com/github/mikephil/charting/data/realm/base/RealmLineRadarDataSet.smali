.class public abstract Lcom/github/mikephil/charting/data/realm/base/RealmLineRadarDataSet;
.super Lcom/github/mikephil/charting/data/realm/base/RealmLineScatterCandleRadarDataSet;
.source "RealmLineRadarDataSet.java"

# interfaces
.implements Lcom/github/mikephil/charting/interfaces/datasets/ILineRadarDataSet;


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
        "Lcom/github/mikephil/charting/interfaces/datasets/ILineRadarDataSet",
        "<",
        "Lcom/github/mikephil/charting/data/Entry;",
        ">;"
    }
.end annotation


# instance fields
.field private mDrawFilled:Z

.field private mFillAlpha:I

.field private mFillColor:I

.field protected mFillDrawable:Landroid/graphics/drawable/Drawable;

.field private mLineWidth:F


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
    .line 36
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/base/RealmLineRadarDataSet;, "Lcom/github/mikephil/charting/data/realm/base/RealmLineRadarDataSet<TT;>;"
    .local p1, "results":Lio/realm/RealmResults;, "Lio/realm/RealmResults<TT;>;"
    invoke-direct {p0, p1, p2}, Lcom/github/mikephil/charting/data/realm/base/RealmLineScatterCandleRadarDataSet;-><init>(Lio/realm/RealmResults;Ljava/lang/String;)V

    .line 20
    const/16 v0, 0x8c

    const/16 v1, 0xea

    const/16 v2, 0xff

    invoke-static {v0, v1, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/base/RealmLineRadarDataSet;->mFillColor:I

    .line 26
    const/16 v0, 0x55

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/base/RealmLineRadarDataSet;->mFillAlpha:I

    .line 29
    const/high16 v0, 0x40200000    # 2.5f

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/base/RealmLineRadarDataSet;->mLineWidth:F

    .line 32
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/github/mikephil/charting/data/realm/base/RealmLineRadarDataSet;->mDrawFilled:Z

    .line 37
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
    .line 47
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/base/RealmLineRadarDataSet;, "Lcom/github/mikephil/charting/data/realm/base/RealmLineRadarDataSet<TT;>;"
    .local p1, "results":Lio/realm/RealmResults;, "Lio/realm/RealmResults<TT;>;"
    invoke-direct {p0, p1, p2, p3}, Lcom/github/mikephil/charting/data/realm/base/RealmLineScatterCandleRadarDataSet;-><init>(Lio/realm/RealmResults;Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    const/16 v0, 0x8c

    const/16 v1, 0xea

    const/16 v2, 0xff

    invoke-static {v0, v1, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/base/RealmLineRadarDataSet;->mFillColor:I

    .line 26
    const/16 v0, 0x55

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/base/RealmLineRadarDataSet;->mFillAlpha:I

    .line 29
    const/high16 v0, 0x40200000    # 2.5f

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/base/RealmLineRadarDataSet;->mLineWidth:F

    .line 32
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/github/mikephil/charting/data/realm/base/RealmLineRadarDataSet;->mDrawFilled:Z

    .line 48
    return-void
.end method


# virtual methods
.method public getFillAlpha()I
    .registers 2

    .prologue
    .line 81
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/base/RealmLineRadarDataSet;, "Lcom/github/mikephil/charting/data/realm/base/RealmLineRadarDataSet<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/data/realm/base/RealmLineRadarDataSet;->mFillAlpha:I

    return v0
.end method

.method public getFillColor()I
    .registers 2

    .prologue
    .line 52
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/base/RealmLineRadarDataSet;, "Lcom/github/mikephil/charting/data/realm/base/RealmLineRadarDataSet<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/data/realm/base/RealmLineRadarDataSet;->mFillColor:I

    return v0
.end method

.method public getFillDrawable()Landroid/graphics/drawable/Drawable;
    .registers 2

    .prologue
    .line 67
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/base/RealmLineRadarDataSet;, "Lcom/github/mikephil/charting/data/realm/base/RealmLineRadarDataSet<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/data/realm/base/RealmLineRadarDataSet;->mFillDrawable:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public getLineWidth()F
    .registers 2

    .prologue
    .line 111
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/base/RealmLineRadarDataSet;, "Lcom/github/mikephil/charting/data/realm/base/RealmLineRadarDataSet<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/data/realm/base/RealmLineRadarDataSet;->mLineWidth:F

    return v0
.end method

.method public isDrawFilledEnabled()Z
    .registers 2

    .prologue
    .line 121
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/base/RealmLineRadarDataSet;, "Lcom/github/mikephil/charting/data/realm/base/RealmLineRadarDataSet<TT;>;"
    iget-boolean v0, p0, Lcom/github/mikephil/charting/data/realm/base/RealmLineRadarDataSet;->mDrawFilled:Z

    return v0
.end method

.method public setDrawFilled(Z)V
    .registers 2
    .param p1, "filled"    # Z

    .prologue
    .line 116
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/base/RealmLineRadarDataSet;, "Lcom/github/mikephil/charting/data/realm/base/RealmLineRadarDataSet<TT;>;"
    iput-boolean p1, p0, Lcom/github/mikephil/charting/data/realm/base/RealmLineRadarDataSet;->mDrawFilled:Z

    .line 117
    return-void
.end method

.method public setFillAlpha(I)V
    .registers 2
    .param p1, "alpha"    # I

    .prologue
    .line 91
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/base/RealmLineRadarDataSet;, "Lcom/github/mikephil/charting/data/realm/base/RealmLineRadarDataSet<TT;>;"
    iput p1, p0, Lcom/github/mikephil/charting/data/realm/base/RealmLineRadarDataSet;->mFillAlpha:I

    .line 92
    return-void
.end method

.method public setFillColor(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 61
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/base/RealmLineRadarDataSet;, "Lcom/github/mikephil/charting/data/realm/base/RealmLineRadarDataSet<TT;>;"
    iput p1, p0, Lcom/github/mikephil/charting/data/realm/base/RealmLineRadarDataSet;->mFillColor:I

    .line 62
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/github/mikephil/charting/data/realm/base/RealmLineRadarDataSet;->mFillDrawable:Landroid/graphics/drawable/Drawable;

    .line 63
    return-void
.end method

.method public setFillDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 2
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 76
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/base/RealmLineRadarDataSet;, "Lcom/github/mikephil/charting/data/realm/base/RealmLineRadarDataSet<TT;>;"
    iput-object p1, p0, Lcom/github/mikephil/charting/data/realm/base/RealmLineRadarDataSet;->mFillDrawable:Landroid/graphics/drawable/Drawable;

    .line 77
    return-void
.end method

.method public setLineWidth(F)V
    .registers 3
    .param p1, "width"    # F

    .prologue
    .line 102
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/base/RealmLineRadarDataSet;, "Lcom/github/mikephil/charting/data/realm/base/RealmLineRadarDataSet<TT;>;"
    const v0, 0x3e4ccccd    # 0.2f

    cmpg-float v0, p1, v0

    if-gez v0, :cond_a

    .line 103
    const p1, 0x3e4ccccd    # 0.2f

    .line 104
    :cond_a
    const/high16 v0, 0x41200000    # 10.0f

    cmpl-float v0, p1, v0

    if-lez v0, :cond_12

    .line 105
    const/high16 p1, 0x41200000    # 10.0f

    .line 106
    :cond_12
    invoke-static {p1}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/base/RealmLineRadarDataSet;->mLineWidth:F

    .line 107
    return-void
.end method
