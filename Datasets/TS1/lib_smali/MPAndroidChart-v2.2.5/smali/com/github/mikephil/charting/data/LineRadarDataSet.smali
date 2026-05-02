.class public abstract Lcom/github/mikephil/charting/data/LineRadarDataSet;
.super Lcom/github/mikephil/charting/data/LineScatterCandleRadarDataSet;
.source "LineRadarDataSet.java"

# interfaces
.implements Lcom/github/mikephil/charting/interfaces/datasets/ILineRadarDataSet;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/github/mikephil/charting/data/Entry;",
        ">",
        "Lcom/github/mikephil/charting/data/LineScatterCandleRadarDataSet",
        "<TT;>;",
        "Lcom/github/mikephil/charting/interfaces/datasets/ILineRadarDataSet",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private mDrawFilled:Z

.field private mFillAlpha:I

.field private mFillColor:I

.field protected mFillDrawable:Landroid/graphics/drawable/Drawable;

.field private mLineWidth:F


# direct methods
.method public constructor <init>(Ljava/util/List;Ljava/lang/String;)V
    .registers 6
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
    .line 47
    .local p0, "this":Lcom/github/mikephil/charting/data/LineRadarDataSet;, "Lcom/github/mikephil/charting/data/LineRadarDataSet<TT;>;"
    .local p1, "yVals":Ljava/util/List;, "Ljava/util/List<TT;>;"
    invoke-direct {p0, p1, p2}, Lcom/github/mikephil/charting/data/LineScatterCandleRadarDataSet;-><init>(Ljava/util/List;Ljava/lang/String;)V

    .line 23
    const/16 v0, 0x8c

    const/16 v1, 0xea

    const/16 v2, 0xff

    invoke-static {v0, v1, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/data/LineRadarDataSet;->mFillColor:I

    .line 33
    const/16 v0, 0x55

    iput v0, p0, Lcom/github/mikephil/charting/data/LineRadarDataSet;->mFillAlpha:I

    .line 38
    const/high16 v0, 0x40200000    # 2.5f

    iput v0, p0, Lcom/github/mikephil/charting/data/LineRadarDataSet;->mLineWidth:F

    .line 43
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/github/mikephil/charting/data/LineRadarDataSet;->mDrawFilled:Z

    .line 48
    return-void
.end method


# virtual methods
.method public getFillAlpha()I
    .registers 2

    .prologue
    .line 83
    .local p0, "this":Lcom/github/mikephil/charting/data/LineRadarDataSet;, "Lcom/github/mikephil/charting/data/LineRadarDataSet<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/data/LineRadarDataSet;->mFillAlpha:I

    return v0
.end method

.method public getFillColor()I
    .registers 2

    .prologue
    .line 52
    .local p0, "this":Lcom/github/mikephil/charting/data/LineRadarDataSet;, "Lcom/github/mikephil/charting/data/LineRadarDataSet<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/data/LineRadarDataSet;->mFillColor:I

    return v0
.end method

.method public getFillDrawable()Landroid/graphics/drawable/Drawable;
    .registers 2

    .prologue
    .line 68
    .local p0, "this":Lcom/github/mikephil/charting/data/LineRadarDataSet;, "Lcom/github/mikephil/charting/data/LineRadarDataSet<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/data/LineRadarDataSet;->mFillDrawable:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public getLineWidth()F
    .registers 2

    .prologue
    .line 113
    .local p0, "this":Lcom/github/mikephil/charting/data/LineRadarDataSet;, "Lcom/github/mikephil/charting/data/LineRadarDataSet<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/data/LineRadarDataSet;->mLineWidth:F

    return v0
.end method

.method public isDrawFilledEnabled()Z
    .registers 2

    .prologue
    .line 123
    .local p0, "this":Lcom/github/mikephil/charting/data/LineRadarDataSet;, "Lcom/github/mikephil/charting/data/LineRadarDataSet<TT;>;"
    iget-boolean v0, p0, Lcom/github/mikephil/charting/data/LineRadarDataSet;->mDrawFilled:Z

    return v0
.end method

.method public setDrawFilled(Z)V
    .registers 2
    .param p1, "filled"    # Z

    .prologue
    .line 118
    .local p0, "this":Lcom/github/mikephil/charting/data/LineRadarDataSet;, "Lcom/github/mikephil/charting/data/LineRadarDataSet<TT;>;"
    iput-boolean p1, p0, Lcom/github/mikephil/charting/data/LineRadarDataSet;->mDrawFilled:Z

    .line 119
    return-void
.end method

.method public setFillAlpha(I)V
    .registers 2
    .param p1, "alpha"    # I

    .prologue
    .line 93
    .local p0, "this":Lcom/github/mikephil/charting/data/LineRadarDataSet;, "Lcom/github/mikephil/charting/data/LineRadarDataSet<TT;>;"
    iput p1, p0, Lcom/github/mikephil/charting/data/LineRadarDataSet;->mFillAlpha:I

    .line 94
    return-void
.end method

.method public setFillColor(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 62
    .local p0, "this":Lcom/github/mikephil/charting/data/LineRadarDataSet;, "Lcom/github/mikephil/charting/data/LineRadarDataSet<TT;>;"
    iput p1, p0, Lcom/github/mikephil/charting/data/LineRadarDataSet;->mFillColor:I

    .line 63
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/github/mikephil/charting/data/LineRadarDataSet;->mFillDrawable:Landroid/graphics/drawable/Drawable;

    .line 64
    return-void
.end method

.method public setFillDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 2
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x12
    .end annotation

    .prologue
    .line 78
    .local p0, "this":Lcom/github/mikephil/charting/data/LineRadarDataSet;, "Lcom/github/mikephil/charting/data/LineRadarDataSet<TT;>;"
    iput-object p1, p0, Lcom/github/mikephil/charting/data/LineRadarDataSet;->mFillDrawable:Landroid/graphics/drawable/Drawable;

    .line 79
    return-void
.end method

.method public setLineWidth(F)V
    .registers 3
    .param p1, "width"    # F

    .prologue
    .line 104
    .local p0, "this":Lcom/github/mikephil/charting/data/LineRadarDataSet;, "Lcom/github/mikephil/charting/data/LineRadarDataSet<TT;>;"
    const v0, 0x3e4ccccd    # 0.2f

    cmpg-float v0, p1, v0

    if-gez v0, :cond_a

    .line 105
    const p1, 0x3e4ccccd    # 0.2f

    .line 106
    :cond_a
    const/high16 v0, 0x41200000    # 10.0f

    cmpl-float v0, p1, v0

    if-lez v0, :cond_12

    .line 107
    const/high16 p1, 0x41200000    # 10.0f

    .line 108
    :cond_12
    invoke-static {p1}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/data/LineRadarDataSet;->mLineWidth:F

    .line 109
    return-void
.end method
