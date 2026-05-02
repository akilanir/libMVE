.class public Lorg/achartengine/renderer/XYSeriesRenderer;
.super Lorg/achartengine/renderer/SimpleSeriesRenderer;
.source "XYSeriesRenderer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;
    }
.end annotation


# instance fields
.field private mAnnotationsColor:I

.field private mAnnotationsTextAlign:Landroid/graphics/Paint$Align;

.field private mAnnotationsTextSize:F

.field private mChartValuesSpacing:F

.field private mChartValuesTextAlign:Landroid/graphics/Paint$Align;

.field private mChartValuesTextSize:F

.field private mDisplayChartValues:Z

.field private mDisplayChartValuesDistance:I

.field private mFillBelowLine:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;",
            ">;"
        }
    .end annotation
.end field

.field private mFillPoints:Z

.field private mLineWidth:F

.field private mPointStrokeWidth:F

.field private mPointStyle:Lorg/achartengine/chart/PointStyle;


# direct methods
.method public constructor <init>()V
    .registers 4

    .prologue
    const/high16 v2, 0x41200000    # 10.0f

    const/high16 v1, 0x3f800000    # 1.0f

    .line 31
    invoke-direct {p0}, Lorg/achartengine/renderer/SimpleSeriesRenderer;-><init>()V

    .line 33
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mFillPoints:Z

    .line 35
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mFillBelowLine:Ljava/util/List;

    .line 37
    sget-object v0, Lorg/achartengine/chart/PointStyle;->POINT:Lorg/achartengine/chart/PointStyle;

    iput-object v0, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mPointStyle:Lorg/achartengine/chart/PointStyle;

    .line 39
    iput v1, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mPointStrokeWidth:F

    .line 41
    iput v1, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mLineWidth:F

    .line 45
    const/16 v0, 0x64

    iput v0, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mDisplayChartValuesDistance:I

    .line 47
    iput v2, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mChartValuesTextSize:F

    .line 49
    sget-object v0, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    iput-object v0, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mChartValuesTextAlign:Landroid/graphics/Paint$Align;

    .line 51
    const/high16 v0, 0x40a00000    # 5.0f

    iput v0, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mChartValuesSpacing:F

    .line 53
    iput v2, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mAnnotationsTextSize:F

    .line 55
    sget-object v0, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    iput-object v0, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mAnnotationsTextAlign:Landroid/graphics/Paint$Align;

    .line 57
    const v0, -0x333334

    iput v0, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mAnnotationsColor:I

    .line 62
    return-void
.end method


# virtual methods
.method public addFillOutsideLine(Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;)V
    .registers 3
    .param p1, "fill"    # Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;

    .prologue
    .line 178
    iget-object v0, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mFillBelowLine:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 179
    return-void
.end method

.method public getAnnotationsColor()I
    .registers 2

    .prologue
    .line 400
    iget v0, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mAnnotationsColor:I

    return v0
.end method

.method public getAnnotationsTextAlign()Landroid/graphics/Paint$Align;
    .registers 2

    .prologue
    .line 382
    iget-object v0, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mAnnotationsTextAlign:Landroid/graphics/Paint$Align;

    return-object v0
.end method

.method public getAnnotationsTextSize()F
    .registers 2

    .prologue
    .line 364
    iget v0, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mAnnotationsTextSize:F

    return v0
.end method

.method public getChartValuesSpacing()F
    .registers 2

    .prologue
    .line 345
    iget v0, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mChartValuesSpacing:F

    return v0
.end method

.method public getChartValuesTextAlign()Landroid/graphics/Paint$Align;
    .registers 2

    .prologue
    .line 327
    iget-object v0, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mChartValuesTextAlign:Landroid/graphics/Paint$Align;

    return-object v0
.end method

.method public getChartValuesTextSize()F
    .registers 2

    .prologue
    .line 309
    iget v0, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mChartValuesTextSize:F

    return v0
.end method

.method public getDisplayChartValuesDistance()I
    .registers 2

    .prologue
    .line 291
    iget v0, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mDisplayChartValuesDistance:I

    return v0
.end method

.method public getFillOutsideLine()[Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;
    .registers 3

    .prologue
    .line 167
    iget-object v0, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mFillBelowLine:Ljava/util/List;

    const/4 v1, 0x0

    new-array v1, v1, [Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;

    return-object v0
.end method

.method public getLineWidth()F
    .registers 2

    .prologue
    .line 255
    iget v0, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mLineWidth:F

    return v0
.end method

.method public getPointStrokeWidth()F
    .registers 2

    .prologue
    .line 237
    iget v0, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mPointStrokeWidth:F

    return v0
.end method

.method public getPointStyle()Lorg/achartengine/chart/PointStyle;
    .registers 2

    .prologue
    .line 219
    iget-object v0, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mPointStyle:Lorg/achartengine/chart/PointStyle;

    return-object v0
.end method

.method public isDisplayChartValues()Z
    .registers 2

    .prologue
    .line 273
    iget-boolean v0, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mDisplayChartValues:Z

    return v0
.end method

.method public isFillBelowLine()Z
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 140
    iget-object v0, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mFillBelowLine:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public isFillPoints()Z
    .registers 2

    .prologue
    .line 187
    iget-boolean v0, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mFillPoints:Z

    return v0
.end method

.method public setAnnotationsColor(I)V
    .registers 2
    .param p1, "color"    # I

    .prologue
    .line 409
    iput p1, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mAnnotationsColor:I

    .line 410
    return-void
.end method

.method public setAnnotationsTextAlign(Landroid/graphics/Paint$Align;)V
    .registers 2
    .param p1, "align"    # Landroid/graphics/Paint$Align;

    .prologue
    .line 391
    iput-object p1, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mAnnotationsTextAlign:Landroid/graphics/Paint$Align;

    .line 392
    return-void
.end method

.method public setAnnotationsTextSize(F)V
    .registers 2
    .param p1, "textSize"    # F

    .prologue
    .line 373
    iput p1, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mAnnotationsTextSize:F

    .line 374
    return-void
.end method

.method public setChartValuesSpacing(F)V
    .registers 2
    .param p1, "spacing"    # F

    .prologue
    .line 355
    iput p1, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mChartValuesSpacing:F

    .line 356
    return-void
.end method

.method public setChartValuesTextAlign(Landroid/graphics/Paint$Align;)V
    .registers 2
    .param p1, "align"    # Landroid/graphics/Paint$Align;

    .prologue
    .line 336
    iput-object p1, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mChartValuesTextAlign:Landroid/graphics/Paint$Align;

    .line 337
    return-void
.end method

.method public setChartValuesTextSize(F)V
    .registers 2
    .param p1, "textSize"    # F

    .prologue
    .line 318
    iput p1, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mChartValuesTextSize:F

    .line 319
    return-void
.end method

.method public setDisplayChartValues(Z)V
    .registers 2
    .param p1, "display"    # Z

    .prologue
    .line 282
    iput-boolean p1, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mDisplayChartValues:Z

    .line 283
    return-void
.end method

.method public setDisplayChartValuesDistance(I)V
    .registers 2
    .param p1, "distance"    # I

    .prologue
    .line 300
    iput p1, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mDisplayChartValuesDistance:I

    .line 301
    return-void
.end method

.method public setFillBelowLine(Z)V
    .registers 5
    .param p1, "fill"    # Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 153
    iget-object v0, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mFillBelowLine:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 154
    if-eqz p1, :cond_14

    .line 155
    iget-object v0, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mFillBelowLine:Ljava/util/List;

    new-instance v1, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;

    sget-object v2, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;->BOUNDS_ALL:Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;

    invoke-direct {v1, v2}, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;-><init>(Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 159
    :goto_13
    return-void

    .line 157
    :cond_14
    iget-object v0, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mFillBelowLine:Ljava/util/List;

    new-instance v1, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;

    sget-object v2, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;->NONE:Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;

    invoke-direct {v1, v2}, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;-><init>(Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine$Type;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_13
.end method

.method public setFillBelowLineColor(I)V
    .registers 4
    .param p1, "color"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 208
    iget-object v0, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mFillBelowLine:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_14

    .line 209
    iget-object v0, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mFillBelowLine:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;

    invoke-virtual {v0, p1}, Lorg/achartengine/renderer/XYSeriesRenderer$FillOutsideLine;->setColor(I)V

    .line 211
    :cond_14
    return-void
.end method

.method public setFillPoints(Z)V
    .registers 2
    .param p1, "fill"    # Z

    .prologue
    .line 196
    iput-boolean p1, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mFillPoints:Z

    .line 197
    return-void
.end method

.method public setLineWidth(F)V
    .registers 2
    .param p1, "lineWidth"    # F

    .prologue
    .line 264
    iput p1, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mLineWidth:F

    .line 265
    return-void
.end method

.method public setPointStrokeWidth(F)V
    .registers 2
    .param p1, "strokeWidth"    # F

    .prologue
    .line 246
    iput p1, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mPointStrokeWidth:F

    .line 247
    return-void
.end method

.method public setPointStyle(Lorg/achartengine/chart/PointStyle;)V
    .registers 2
    .param p1, "style"    # Lorg/achartengine/chart/PointStyle;

    .prologue
    .line 228
    iput-object p1, p0, Lorg/achartengine/renderer/XYSeriesRenderer;->mPointStyle:Lorg/achartengine/chart/PointStyle;

    .line 229
    return-void
.end method
