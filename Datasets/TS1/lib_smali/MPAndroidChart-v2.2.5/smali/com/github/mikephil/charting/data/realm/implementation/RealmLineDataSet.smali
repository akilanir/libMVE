.class public Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;
.super Lcom/github/mikephil/charting/data/realm/base/RealmLineRadarDataSet;
.source "RealmLineDataSet.java"

# interfaces
.implements Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lio/realm/RealmObject;",
        ">",
        "Lcom/github/mikephil/charting/data/realm/base/RealmLineRadarDataSet",
        "<TT;>;",
        "Lcom/github/mikephil/charting/interfaces/datasets/ILineDataSet;"
    }
.end annotation


# instance fields
.field private mCircleColorHole:I

.field private mCircleColors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mCircleHoleRadius:F

.field private mCircleRadius:F

.field private mCubicIntensity:F

.field private mDashPathEffect:Landroid/graphics/DashPathEffect;

.field private mDrawCircleHole:Z

.field private mDrawCircles:Z

.field private mFillFormatter:Lcom/github/mikephil/charting/formatter/FillFormatter;

.field private mMode:Lcom/github/mikephil/charting/data/LineDataSet$Mode;


# direct methods
.method public constructor <init>(Lio/realm/RealmResults;Ljava/lang/String;)V
    .registers 7
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
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet<TT;>;"
    .local p1, "result":Lio/realm/RealmResults;, "Lio/realm/RealmResults<TT;>;"
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 76
    invoke-direct {p0, p1, p2}, Lcom/github/mikephil/charting/data/realm/base/RealmLineRadarDataSet;-><init>(Lio/realm/RealmResults;Ljava/lang/String;)V

    .line 27
    sget-object v0, Lcom/github/mikephil/charting/data/LineDataSet$Mode;->LINEAR:Lcom/github/mikephil/charting/data/LineDataSet$Mode;

    iput-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->mMode:Lcom/github/mikephil/charting/data/LineDataSet$Mode;

    .line 32
    iput-object v2, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->mCircleColors:Ljava/util/List;

    .line 37
    const/4 v0, -0x1

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->mCircleColorHole:I

    .line 42
    const/high16 v0, 0x41000000    # 8.0f

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->mCircleRadius:F

    .line 45
    const/high16 v0, 0x40800000    # 4.0f

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->mCircleHoleRadius:F

    .line 50
    const v0, 0x3e4ccccd    # 0.2f

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->mCubicIntensity:F

    .line 55
    iput-object v2, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->mDashPathEffect:Landroid/graphics/DashPathEffect;

    .line 60
    new-instance v0, Lcom/github/mikephil/charting/formatter/DefaultFillFormatter;

    invoke-direct {v0}, Lcom/github/mikephil/charting/formatter/DefaultFillFormatter;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->mFillFormatter:Lcom/github/mikephil/charting/formatter/FillFormatter;

    .line 65
    iput-boolean v1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->mDrawCircles:Z

    .line 67
    iput-boolean v1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->mDrawCircleHole:Z

    .line 77
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->mCircleColors:Ljava/util/List;

    .line 80
    iget-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->mCircleColors:Ljava/util/List;

    const/16 v1, 0x8c

    const/16 v2, 0xea

    const/16 v3, 0xff

    invoke-static {v1, v2, v3}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 82
    iget-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->results:Lio/realm/RealmResults;

    invoke-virtual {p0, v0}, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->build(Lio/realm/RealmResults;)V

    .line 83
    const/4 v0, 0x0

    iget-object v1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->results:Lio/realm/RealmResults;

    invoke-virtual {v1}, Lio/realm/RealmResults;->size()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->calcMinMax(II)V

    .line 84
    return-void
.end method

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
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet<TT;>;"
    .local p1, "result":Lio/realm/RealmResults;, "Lio/realm/RealmResults<TT;>;"
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 94
    invoke-direct {p0, p1, p2, p3}, Lcom/github/mikephil/charting/data/realm/base/RealmLineRadarDataSet;-><init>(Lio/realm/RealmResults;Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    sget-object v0, Lcom/github/mikephil/charting/data/LineDataSet$Mode;->LINEAR:Lcom/github/mikephil/charting/data/LineDataSet$Mode;

    iput-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->mMode:Lcom/github/mikephil/charting/data/LineDataSet$Mode;

    .line 32
    iput-object v2, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->mCircleColors:Ljava/util/List;

    .line 37
    const/4 v0, -0x1

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->mCircleColorHole:I

    .line 42
    const/high16 v0, 0x41000000    # 8.0f

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->mCircleRadius:F

    .line 45
    const/high16 v0, 0x40800000    # 4.0f

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->mCircleHoleRadius:F

    .line 50
    const v0, 0x3e4ccccd    # 0.2f

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->mCubicIntensity:F

    .line 55
    iput-object v2, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->mDashPathEffect:Landroid/graphics/DashPathEffect;

    .line 60
    new-instance v0, Lcom/github/mikephil/charting/formatter/DefaultFillFormatter;

    invoke-direct {v0}, Lcom/github/mikephil/charting/formatter/DefaultFillFormatter;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->mFillFormatter:Lcom/github/mikephil/charting/formatter/FillFormatter;

    .line 65
    iput-boolean v1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->mDrawCircles:Z

    .line 67
    iput-boolean v1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->mDrawCircleHole:Z

    .line 95
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->mCircleColors:Ljava/util/List;

    .line 98
    iget-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->mCircleColors:Ljava/util/List;

    const/16 v1, 0x8c

    const/16 v2, 0xea

    const/16 v3, 0xff

    invoke-static {v1, v2, v3}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 100
    iget-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->results:Lio/realm/RealmResults;

    invoke-virtual {p0, v0}, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->build(Lio/realm/RealmResults;)V

    .line 101
    const/4 v0, 0x0

    iget-object v1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->results:Lio/realm/RealmResults;

    invoke-virtual {v1}, Lio/realm/RealmResults;->size()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->calcMinMax(II)V

    .line 102
    return-void
.end method


# virtual methods
.method public disableDashedLine()V
    .registers 2

    .prologue
    .line 193
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet<TT;>;"
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->mDashPathEffect:Landroid/graphics/DashPathEffect;

    .line 194
    return-void
.end method

.method public enableDashedLine(FFF)V
    .registers 7
    .param p1, "lineLength"    # F
    .param p2, "spaceLength"    # F
    .param p3, "phase"    # F

    .prologue
    .line 184
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet<TT;>;"
    new-instance v0, Landroid/graphics/DashPathEffect;

    const/4 v1, 0x2

    new-array v1, v1, [F

    const/4 v2, 0x0

    aput p1, v1, v2

    const/4 v2, 0x1

    aput p2, v1, v2

    invoke-direct {v0, v1, p3}, Landroid/graphics/DashPathEffect;-><init>([FF)V

    iput-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->mDashPathEffect:Landroid/graphics/DashPathEffect;

    .line 187
    return-void
.end method

.method public getCircleColor(I)I
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 256
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->mCircleColors:Ljava/util/List;

    iget-object v1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->mCircleColors:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    rem-int v1, p1, v1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public getCircleColors()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 251
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->mCircleColors:Ljava/util/List;

    return-object v0
.end method

.method public getCircleHoleColor()I
    .registers 2

    .prologue
    .line 335
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->mCircleColorHole:I

    return v0
.end method

.method public getCircleHoleRadius()F
    .registers 2

    .prologue
    .line 171
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->mCircleHoleRadius:F

    return v0
.end method

.method public getCircleRadius()F
    .registers 2

    .prologue
    .line 156
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->mCircleRadius:F

    return v0
.end method

.method public getCubicIntensity()F
    .registers 2

    .prologue
    .line 141
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->mCubicIntensity:F

    return v0
.end method

.method public getDashPathEffect()Landroid/graphics/DashPathEffect;
    .registers 2

    .prologue
    .line 203
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->mDashPathEffect:Landroid/graphics/DashPathEffect;

    return-object v0
.end method

.method public getFillFormatter()Lcom/github/mikephil/charting/formatter/FillFormatter;
    .registers 2

    .prologue
    .line 368
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->mFillFormatter:Lcom/github/mikephil/charting/formatter/FillFormatter;

    return-object v0
.end method

.method public getMode()Lcom/github/mikephil/charting/data/LineDataSet$Mode;
    .registers 2

    .prologue
    .line 111
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->mMode:Lcom/github/mikephil/charting/data/LineDataSet$Mode;

    return-object v0
.end method

.method public isDashedLineEnabled()Z
    .registers 2

    .prologue
    .line 198
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->mDashPathEffect:Landroid/graphics/DashPathEffect;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x1

    goto :goto_5
.end method

.method public isDrawCircleHoleEnabled()Z
    .registers 2

    .prologue
    .line 349
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet<TT;>;"
    iget-boolean v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->mDrawCircleHole:Z

    return v0
.end method

.method public isDrawCirclesEnabled()Z
    .registers 2

    .prologue
    .line 218
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet<TT;>;"
    iget-boolean v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->mDrawCircles:Z

    return v0
.end method

.method public isDrawCubicEnabled()Z
    .registers 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 229
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->mMode:Lcom/github/mikephil/charting/data/LineDataSet$Mode;

    sget-object v1, Lcom/github/mikephil/charting/data/LineDataSet$Mode;->CUBIC_BEZIER:Lcom/github/mikephil/charting/data/LineDataSet$Mode;

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isDrawSteppedEnabled()Z
    .registers 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 240
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->mMode:Lcom/github/mikephil/charting/data/LineDataSet$Mode;

    sget-object v1, Lcom/github/mikephil/charting/data/LineDataSet$Mode;->STEPPED:Lcom/github/mikephil/charting/data/LineDataSet$Mode;

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public resetCircleColors()V
    .registers 2

    .prologue
    .line 321
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet<TT;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->mCircleColors:Ljava/util/List;

    .line 322
    return-void
.end method

.method public setCircleColor(I)V
    .registers 4
    .param p1, "color"    # I

    .prologue
    .line 313
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet<TT;>;"
    invoke-virtual {p0}, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->resetCircleColors()V

    .line 314
    iget-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->mCircleColors:Ljava/util/List;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 315
    return-void
.end method

.method public setCircleColorHole(I)V
    .registers 2
    .param p1, "color"    # I

    .prologue
    .line 330
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet<TT;>;"
    iput p1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->mCircleColorHole:I

    .line 331
    return-void
.end method

.method public setCircleColors(Ljava/util/List;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 269
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet<TT;>;"
    .local p1, "colors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    iput-object p1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->mCircleColors:Ljava/util/List;

    .line 270
    return-void
.end method

.method public setCircleColors([I)V
    .registers 3
    .param p1, "colors"    # [I

    .prologue
    .line 282
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet<TT;>;"
    invoke-static {p1}, Lcom/github/mikephil/charting/utils/ColorTemplate;->createColors([I)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->mCircleColors:Ljava/util/List;

    .line 283
    return-void
.end method

.method public setCircleColors([ILandroid/content/Context;)V
    .registers 9
    .param p1, "colors"    # [I
    .param p2, "c"    # Landroid/content/Context;

    .prologue
    .line 297
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet<TT;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 299
    .local v1, "clrs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    move-object v0, p1

    .local v0, "arr$":[I
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_8
    if-ge v3, v4, :cond_1e

    aget v2, v0, v3

    .line 300
    .local v2, "color":I
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 299
    add-int/lit8 v3, v3, 0x1

    goto :goto_8

    .line 303
    .end local v2    # "color":I
    :cond_1e
    iput-object v1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->mCircleColors:Ljava/util/List;

    .line 304
    return-void
.end method

.method public setCircleHoleRadius(F)V
    .registers 3
    .param p1, "holeRadius"    # F

    .prologue
    .line 166
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet<TT;>;"
    invoke-static {p1}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->mCircleHoleRadius:F

    .line 167
    return-void
.end method

.method public setCircleSize(F)V
    .registers 3
    .param p1, "size"    # F

    .prologue
    .line 151
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet<TT;>;"
    invoke-static {p1}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->mCircleRadius:F

    .line 152
    return-void
.end method

.method public setCubicIntensity(F)V
    .registers 3
    .param p1, "intensity"    # F

    .prologue
    .line 131
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet<TT;>;"
    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float v0, p1, v0

    if-lez v0, :cond_8

    .line 132
    const/high16 p1, 0x3f800000    # 1.0f

    .line 133
    :cond_8
    const v0, 0x3d4ccccd    # 0.05f

    cmpg-float v0, p1, v0

    if-gez v0, :cond_12

    .line 134
    const p1, 0x3d4ccccd    # 0.05f

    .line 136
    :cond_12
    iput p1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->mCubicIntensity:F

    .line 137
    return-void
.end method

.method public setDrawCircleHole(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 344
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet<TT;>;"
    iput-boolean p1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->mDrawCircleHole:Z

    .line 345
    return-void
.end method

.method public setDrawCircles(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 213
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet<TT;>;"
    iput-boolean p1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->mDrawCircles:Z

    .line 214
    return-void
.end method

.method public setDrawCubic(Z)V
    .registers 3
    .param p1, "enabled"    # Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 223
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet<TT;>;"
    if-eqz p1, :cond_7

    sget-object v0, Lcom/github/mikephil/charting/data/LineDataSet$Mode;->CUBIC_BEZIER:Lcom/github/mikephil/charting/data/LineDataSet$Mode;

    :goto_4
    iput-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->mMode:Lcom/github/mikephil/charting/data/LineDataSet$Mode;

    .line 224
    return-void

    .line 223
    :cond_7
    sget-object v0, Lcom/github/mikephil/charting/data/LineDataSet$Mode;->LINEAR:Lcom/github/mikephil/charting/data/LineDataSet$Mode;

    goto :goto_4
.end method

.method public setDrawStepped(Z)V
    .registers 3
    .param p1, "enabled"    # Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 234
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet<TT;>;"
    if-eqz p1, :cond_7

    sget-object v0, Lcom/github/mikephil/charting/data/LineDataSet$Mode;->STEPPED:Lcom/github/mikephil/charting/data/LineDataSet$Mode;

    :goto_4
    iput-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->mMode:Lcom/github/mikephil/charting/data/LineDataSet$Mode;

    .line 235
    return-void

    .line 234
    :cond_7
    sget-object v0, Lcom/github/mikephil/charting/data/LineDataSet$Mode;->LINEAR:Lcom/github/mikephil/charting/data/LineDataSet$Mode;

    goto :goto_4
.end method

.method public setFillFormatter(Lcom/github/mikephil/charting/formatter/FillFormatter;)V
    .registers 3
    .param p1, "formatter"    # Lcom/github/mikephil/charting/formatter/FillFormatter;

    .prologue
    .line 360
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet<TT;>;"
    if-nez p1, :cond_a

    .line 361
    new-instance v0, Lcom/github/mikephil/charting/formatter/DefaultFillFormatter;

    invoke-direct {v0}, Lcom/github/mikephil/charting/formatter/DefaultFillFormatter;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->mFillFormatter:Lcom/github/mikephil/charting/formatter/FillFormatter;

    .line 364
    :goto_9
    return-void

    .line 363
    :cond_a
    iput-object p1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->mFillFormatter:Lcom/github/mikephil/charting/formatter/FillFormatter;

    goto :goto_9
.end method

.method public setMode(Lcom/github/mikephil/charting/data/LineDataSet$Mode;)V
    .registers 2
    .param p1, "mode"    # Lcom/github/mikephil/charting/data/LineDataSet$Mode;

    .prologue
    .line 120
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet<TT;>;"
    iput-object p1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmLineDataSet;->mMode:Lcom/github/mikephil/charting/data/LineDataSet$Mode;

    .line 121
    return-void
.end method
