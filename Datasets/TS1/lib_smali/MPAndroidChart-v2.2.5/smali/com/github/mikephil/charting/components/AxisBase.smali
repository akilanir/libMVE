.class public abstract Lcom/github/mikephil/charting/components/AxisBase;
.super Lcom/github/mikephil/charting/components/ComponentBase;
.source "AxisBase.java"


# instance fields
.field private mAxisLineColor:I

.field private mAxisLineWidth:F

.field public mAxisMaximum:F

.field public mAxisMinimum:F

.field public mAxisRange:F

.field protected mCustomAxisMax:Z

.field protected mCustomAxisMin:Z

.field protected mDrawAxisLine:Z

.field protected mDrawGridLines:Z

.field protected mDrawLabels:Z

.field protected mDrawLimitLineBehindData:Z

.field private mGridColor:I

.field private mGridDashPathEffect:Landroid/graphics/DashPathEffect;

.field private mGridLineWidth:F

.field protected mLimitLines:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/github/mikephil/charting/components/LimitLine;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 7

    .prologue
    const/high16 v5, 0x40a00000    # 5.0f

    const/high16 v4, 0x3f800000    # 1.0f

    const/4 v3, 0x1

    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 86
    invoke-direct {p0}, Lcom/github/mikephil/charting/components/ComponentBase;-><init>()V

    .line 20
    const v0, -0x777778

    iput v0, p0, Lcom/github/mikephil/charting/components/AxisBase;->mGridColor:I

    .line 22
    iput v4, p0, Lcom/github/mikephil/charting/components/AxisBase;->mGridLineWidth:F

    .line 24
    const v0, -0x777778

    iput v0, p0, Lcom/github/mikephil/charting/components/AxisBase;->mAxisLineColor:I

    .line 26
    iput v4, p0, Lcom/github/mikephil/charting/components/AxisBase;->mAxisLineWidth:F

    .line 31
    iput-boolean v3, p0, Lcom/github/mikephil/charting/components/AxisBase;->mDrawGridLines:Z

    .line 36
    iput-boolean v3, p0, Lcom/github/mikephil/charting/components/AxisBase;->mDrawAxisLine:Z

    .line 41
    iput-boolean v3, p0, Lcom/github/mikephil/charting/components/AxisBase;->mDrawLabels:Z

    .line 46
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/github/mikephil/charting/components/AxisBase;->mGridDashPathEffect:Landroid/graphics/DashPathEffect;

    .line 56
    iput-boolean v2, p0, Lcom/github/mikephil/charting/components/AxisBase;->mDrawLimitLineBehindData:Z

    .line 61
    iput-boolean v2, p0, Lcom/github/mikephil/charting/components/AxisBase;->mCustomAxisMin:Z

    .line 66
    iput-boolean v2, p0, Lcom/github/mikephil/charting/components/AxisBase;->mCustomAxisMax:Z

    .line 71
    iput v1, p0, Lcom/github/mikephil/charting/components/AxisBase;->mAxisMaximum:F

    .line 76
    iput v1, p0, Lcom/github/mikephil/charting/components/AxisBase;->mAxisMinimum:F

    .line 81
    iput v1, p0, Lcom/github/mikephil/charting/components/AxisBase;->mAxisRange:F

    .line 87
    const/high16 v0, 0x41200000    # 10.0f

    invoke-static {v0}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/components/AxisBase;->mTextSize:F

    .line 88
    invoke-static {v5}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/components/AxisBase;->mXOffset:F

    .line 89
    invoke-static {v5}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/components/AxisBase;->mYOffset:F

    .line 90
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/components/AxisBase;->mLimitLines:Ljava/util/List;

    .line 91
    return-void
.end method


# virtual methods
.method public addLimitLine(Lcom/github/mikephil/charting/components/LimitLine;)V
    .registers 4
    .param p1, "l"    # Lcom/github/mikephil/charting/components/LimitLine;

    .prologue
    .line 230
    iget-object v0, p0, Lcom/github/mikephil/charting/components/AxisBase;->mLimitLines:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 232
    iget-object v0, p0, Lcom/github/mikephil/charting/components/AxisBase;->mLimitLines:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x6

    if-le v0, v1, :cond_15

    .line 233
    const-string v0, "MPAndroiChart"

    const-string v1, "Warning! You have more than 6 LimitLines on your axis, do you really want that?"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 237
    :cond_15
    return-void
.end method

.method public disableGridDashedLine()V
    .registers 2

    .prologue
    .line 305
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/github/mikephil/charting/components/AxisBase;->mGridDashPathEffect:Landroid/graphics/DashPathEffect;

    .line 306
    return-void
.end method

.method public enableGridDashedLine(FFF)V
    .registers 7
    .param p1, "lineLength"    # F
    .param p2, "spaceLength"    # F
    .param p3, "phase"    # F

    .prologue
    .line 296
    new-instance v0, Landroid/graphics/DashPathEffect;

    const/4 v1, 0x2

    new-array v1, v1, [F

    const/4 v2, 0x0

    aput p1, v1, v2

    const/4 v2, 0x1

    aput p2, v1, v2

    invoke-direct {v0, v1, p3}, Landroid/graphics/DashPathEffect;-><init>([FF)V

    iput-object v0, p0, Lcom/github/mikephil/charting/components/AxisBase;->mGridDashPathEffect:Landroid/graphics/DashPathEffect;

    .line 299
    return-void
.end method

.method public getAxisLineColor()I
    .registers 2

    .prologue
    .line 202
    iget v0, p0, Lcom/github/mikephil/charting/components/AxisBase;->mAxisLineColor:I

    return v0
.end method

.method public getAxisLineWidth()F
    .registers 2

    .prologue
    .line 164
    iget v0, p0, Lcom/github/mikephil/charting/components/AxisBase;->mAxisLineWidth:F

    return v0
.end method

.method public getAxisMaximum()F
    .registers 2

    .prologue
    .line 331
    iget v0, p0, Lcom/github/mikephil/charting/components/AxisBase;->mAxisMaximum:F

    return v0
.end method

.method public getAxisMinimum()F
    .registers 2

    .prologue
    .line 335
    iget v0, p0, Lcom/github/mikephil/charting/components/AxisBase;->mAxisMinimum:F

    return v0
.end method

.method public getGridColor()I
    .registers 2

    .prologue
    .line 146
    iget v0, p0, Lcom/github/mikephil/charting/components/AxisBase;->mGridColor:I

    return v0
.end method

.method public getGridDashPathEffect()Landroid/graphics/DashPathEffect;
    .registers 2

    .prologue
    .line 323
    iget-object v0, p0, Lcom/github/mikephil/charting/components/AxisBase;->mGridDashPathEffect:Landroid/graphics/DashPathEffect;

    return-object v0
.end method

.method public getGridLineWidth()F
    .registers 2

    .prologue
    .line 184
    iget v0, p0, Lcom/github/mikephil/charting/components/AxisBase;->mGridLineWidth:F

    return v0
.end method

.method public getLimitLines()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/github/mikephil/charting/components/LimitLine;",
            ">;"
        }
    .end annotation

    .prologue
    .line 261
    iget-object v0, p0, Lcom/github/mikephil/charting/components/AxisBase;->mLimitLines:Ljava/util/List;

    return-object v0
.end method

.method public abstract getLongestLabel()Ljava/lang/String;
.end method

.method public isAxisMaxCustom()Z
    .registers 2

    .prologue
    .line 353
    iget-boolean v0, p0, Lcom/github/mikephil/charting/components/AxisBase;->mCustomAxisMax:Z

    return v0
.end method

.method public isAxisMinCustom()Z
    .registers 2

    .prologue
    .line 371
    iget-boolean v0, p0, Lcom/github/mikephil/charting/components/AxisBase;->mCustomAxisMin:Z

    return v0
.end method

.method public isDrawAxisLineEnabled()Z
    .registers 2

    .prologue
    .line 126
    iget-boolean v0, p0, Lcom/github/mikephil/charting/components/AxisBase;->mDrawAxisLine:Z

    return v0
.end method

.method public isDrawGridLinesEnabled()Z
    .registers 2

    .prologue
    .line 108
    iget-boolean v0, p0, Lcom/github/mikephil/charting/components/AxisBase;->mDrawGridLines:Z

    return v0
.end method

.method public isDrawLabelsEnabled()Z
    .registers 2

    .prologue
    .line 221
    iget-boolean v0, p0, Lcom/github/mikephil/charting/components/AxisBase;->mDrawLabels:Z

    return v0
.end method

.method public isDrawLimitLinesBehindDataEnabled()Z
    .registers 2

    .prologue
    .line 275
    iget-boolean v0, p0, Lcom/github/mikephil/charting/components/AxisBase;->mDrawLimitLineBehindData:Z

    return v0
.end method

.method public isGridDashedLineEnabled()Z
    .registers 2

    .prologue
    .line 314
    iget-object v0, p0, Lcom/github/mikephil/charting/components/AxisBase;->mGridDashPathEffect:Landroid/graphics/DashPathEffect;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x1

    goto :goto_5
.end method

.method public removeAllLimitLines()V
    .registers 2

    .prologue
    .line 252
    iget-object v0, p0, Lcom/github/mikephil/charting/components/AxisBase;->mLimitLines:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 253
    return-void
.end method

.method public removeLimitLine(Lcom/github/mikephil/charting/components/LimitLine;)V
    .registers 3
    .param p1, "l"    # Lcom/github/mikephil/charting/components/LimitLine;

    .prologue
    .line 245
    iget-object v0, p0, Lcom/github/mikephil/charting/components/AxisBase;->mLimitLines:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 246
    return-void
.end method

.method public resetAxisMaxValue()V
    .registers 2

    .prologue
    .line 344
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/github/mikephil/charting/components/AxisBase;->mCustomAxisMax:Z

    .line 345
    return-void
.end method

.method public resetAxisMinValue()V
    .registers 2

    .prologue
    .line 362
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/github/mikephil/charting/components/AxisBase;->mCustomAxisMin:Z

    .line 363
    return-void
.end method

.method public setAxisLineColor(I)V
    .registers 2
    .param p1, "color"    # I

    .prologue
    .line 193
    iput p1, p0, Lcom/github/mikephil/charting/components/AxisBase;->mAxisLineColor:I

    .line 194
    return-void
.end method

.method public setAxisLineWidth(F)V
    .registers 3
    .param p1, "width"    # F

    .prologue
    .line 155
    invoke-static {p1}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/components/AxisBase;->mAxisLineWidth:F

    .line 156
    return-void
.end method

.method public setAxisMaxValue(F)V
    .registers 3
    .param p1, "max"    # F

    .prologue
    .line 396
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/github/mikephil/charting/components/AxisBase;->mCustomAxisMax:Z

    .line 397
    iput p1, p0, Lcom/github/mikephil/charting/components/AxisBase;->mAxisMaximum:F

    .line 398
    return-void
.end method

.method public setAxisMinValue(F)V
    .registers 3
    .param p1, "min"    # F

    .prologue
    .line 384
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/github/mikephil/charting/components/AxisBase;->mCustomAxisMin:Z

    .line 385
    iput p1, p0, Lcom/github/mikephil/charting/components/AxisBase;->mAxisMinimum:F

    .line 386
    return-void
.end method

.method public setDrawAxisLine(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 117
    iput-boolean p1, p0, Lcom/github/mikephil/charting/components/AxisBase;->mDrawAxisLine:Z

    .line 118
    return-void
.end method

.method public setDrawGridLines(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 99
    iput-boolean p1, p0, Lcom/github/mikephil/charting/components/AxisBase;->mDrawGridLines:Z

    .line 100
    return-void
.end method

.method public setDrawLabels(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 212
    iput-boolean p1, p0, Lcom/github/mikephil/charting/components/AxisBase;->mDrawLabels:Z

    .line 213
    return-void
.end method

.method public setDrawLimitLinesBehindData(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 271
    iput-boolean p1, p0, Lcom/github/mikephil/charting/components/AxisBase;->mDrawLimitLineBehindData:Z

    .line 272
    return-void
.end method

.method public setGridColor(I)V
    .registers 2
    .param p1, "color"    # I

    .prologue
    .line 136
    iput p1, p0, Lcom/github/mikephil/charting/components/AxisBase;->mGridColor:I

    .line 137
    return-void
.end method

.method public setGridLineWidth(F)V
    .registers 3
    .param p1, "width"    # F

    .prologue
    .line 174
    invoke-static {p1}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/components/AxisBase;->mGridLineWidth:F

    .line 175
    return-void
.end method
