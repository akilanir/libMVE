.class public Lorg/achartengine/renderer/DefaultRenderer;
.super Ljava/lang/Object;
.source "DefaultRenderer.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field public static final BACKGROUND_COLOR:I = -0x1000000

.field public static final NO_COLOR:I = 0x0

.field private static final REGULAR_TEXT_FONT:Landroid/graphics/Typeface;

.field public static final TEXT_COLOR:I = -0x333334


# instance fields
.field private mAntialiasing:Z

.field private mApplyBackgroundColor:Z

.field private mBackgroundColor:I

.field private mChartTitle:Ljava/lang/String;

.field private mChartTitleTextSize:F

.field private mClickEnabled:Z

.field private mDisplayValues:Z

.field private mExternalZoomEnabled:Z

.field private mFitLegend:Z

.field private mInScroll:Z

.field private mLabelsColor:I

.field private mLabelsTextSize:F

.field private mLegendHeight:I

.field private mLegendTextSize:F

.field private mMargins:[I

.field private mOriginalScale:F

.field private mPanEnabled:Z

.field private mRenderers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/achartengine/renderer/SimpleSeriesRenderer;",
            ">;"
        }
    .end annotation
.end field

.field private mScale:F

.field private mShowAxes:Z

.field private mShowCustomTextGridX:Z

.field private mShowCustomTextGridY:Z

.field private mShowGridX:Z

.field private mShowGridY:Z

.field private mShowLabels:Z

.field private mShowLegend:Z

.field private mShowTickMarks:Z

.field private mStartAngle:F

.field private mTextTypeface:Landroid/graphics/Typeface;

.field private mTextTypefaceName:Ljava/lang/String;

.field private mTextTypefaceStyle:I

.field private mXAxisColor:I

.field private mYAxisColor:I

.field private mZoomButtonsVisible:Z

.field private mZoomEnabled:Z

.field private mZoomRate:F

.field private selectableBuffer:I


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 40
    sget-object v0, Landroid/graphics/Typeface;->SERIF:Landroid/graphics/Typeface;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    move-result-object v0

    sput-object v0, Lorg/achartengine/renderer/DefaultRenderer;->REGULAR_TEXT_FONT:Landroid/graphics/Typeface;

    return-void
.end method

.method public constructor <init>()V
    .registers 5

    .prologue
    const v3, -0x333334

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    const-string v0, ""

    iput-object v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mChartTitle:Ljava/lang/String;

    .line 32
    const/high16 v0, 0x41700000    # 15.0f

    iput v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mChartTitleTextSize:F

    .line 43
    sget-object v0, Lorg/achartengine/renderer/DefaultRenderer;->REGULAR_TEXT_FONT:Landroid/graphics/Typeface;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mTextTypefaceName:Ljava/lang/String;

    .line 45
    iput v1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mTextTypefaceStyle:I

    .line 53
    iput-boolean v2, p0, Lorg/achartengine/renderer/DefaultRenderer;->mShowAxes:Z

    .line 55
    iput v3, p0, Lorg/achartengine/renderer/DefaultRenderer;->mYAxisColor:I

    .line 57
    iput v3, p0, Lorg/achartengine/renderer/DefaultRenderer;->mXAxisColor:I

    .line 59
    iput-boolean v2, p0, Lorg/achartengine/renderer/DefaultRenderer;->mShowLabels:Z

    .line 61
    iput-boolean v2, p0, Lorg/achartengine/renderer/DefaultRenderer;->mShowTickMarks:Z

    .line 63
    iput v3, p0, Lorg/achartengine/renderer/DefaultRenderer;->mLabelsColor:I

    .line 65
    const/high16 v0, 0x41200000    # 10.0f

    iput v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mLabelsTextSize:F

    .line 67
    iput-boolean v2, p0, Lorg/achartengine/renderer/DefaultRenderer;->mShowLegend:Z

    .line 69
    const/high16 v0, 0x41400000    # 12.0f

    iput v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mLegendTextSize:F

    .line 71
    iput-boolean v1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mFitLegend:Z

    .line 73
    iput-boolean v1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mShowGridX:Z

    .line 75
    iput-boolean v1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mShowGridY:Z

    .line 77
    iput-boolean v1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mShowCustomTextGridX:Z

    .line 79
    iput-boolean v1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mShowCustomTextGridY:Z

    .line 81
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mRenderers:Ljava/util/List;

    .line 83
    iput-boolean v2, p0, Lorg/achartengine/renderer/DefaultRenderer;->mAntialiasing:Z

    .line 85
    iput v1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mLegendHeight:I

    .line 87
    const/4 v0, 0x4

    new-array v0, v0, [I

    fill-array-data v0, :array_6c

    iput-object v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mMargins:[I

    .line 89
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mScale:F

    .line 91
    iput-boolean v2, p0, Lorg/achartengine/renderer/DefaultRenderer;->mPanEnabled:Z

    .line 93
    iput-boolean v2, p0, Lorg/achartengine/renderer/DefaultRenderer;->mZoomEnabled:Z

    .line 95
    iput-boolean v1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mZoomButtonsVisible:Z

    .line 97
    const/high16 v0, 0x3fc00000    # 1.5f

    iput v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mZoomRate:F

    .line 99
    iput-boolean v1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mExternalZoomEnabled:Z

    .line 101
    iget v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mScale:F

    iput v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mOriginalScale:F

    .line 103
    iput-boolean v1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mClickEnabled:Z

    .line 105
    const/16 v0, 0xf

    iput v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->selectableBuffer:I

    .line 115
    const/4 v0, 0x0

    iput v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mStartAngle:F

    return-void

    .line 87
    nop

    :array_6c
    .array-data 4
        0x14
        0x1e
        0xa
        0x14
    .end array-data
.end method


# virtual methods
.method public addSeriesRenderer(ILorg/achartengine/renderer/SimpleSeriesRenderer;)V
    .registers 4
    .param p1, "index"    # I
    .param p2, "renderer"    # Lorg/achartengine/renderer/SimpleSeriesRenderer;

    .prologue
    .line 169
    iget-object v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mRenderers:Ljava/util/List;

    invoke-interface {v0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 170
    return-void
.end method

.method public addSeriesRenderer(Lorg/achartengine/renderer/SimpleSeriesRenderer;)V
    .registers 3
    .param p1, "renderer"    # Lorg/achartengine/renderer/SimpleSeriesRenderer;

    .prologue
    .line 159
    iget-object v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mRenderers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 160
    return-void
.end method

.method public getAxesColor()I
    .registers 3

    .prologue
    .line 258
    iget v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mXAxisColor:I

    const v1, -0x333334

    if-eq v0, v1, :cond_a

    .line 259
    iget v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mXAxisColor:I

    .line 261
    :goto_9
    return v0

    :cond_a
    iget v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mYAxisColor:I

    goto :goto_9
.end method

.method public getBackgroundColor()I
    .registers 2

    .prologue
    .line 222
    iget v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mBackgroundColor:I

    return v0
.end method

.method public getChartTitle()Ljava/lang/String;
    .registers 2

    .prologue
    .line 123
    iget-object v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mChartTitle:Ljava/lang/String;

    return-object v0
.end method

.method public getChartTitleTextSize()F
    .registers 2

    .prologue
    .line 141
    iget v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mChartTitleTextSize:F

    return v0
.end method

.method public getLabelsColor()I
    .registers 2

    .prologue
    .line 317
    iget v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mLabelsColor:I

    return v0
.end method

.method public getLabelsTextSize()F
    .registers 2

    .prologue
    .line 335
    iget v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mLabelsTextSize:F

    return v0
.end method

.method public getLegendHeight()I
    .registers 2

    .prologue
    .line 772
    iget v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mLegendHeight:I

    return v0
.end method

.method public getLegendTextSize()F
    .registers 2

    .prologue
    .line 562
    iget v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mLegendTextSize:F

    return v0
.end method

.method public getMargins()[I
    .registers 2

    .prologue
    .line 791
    iget-object v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mMargins:[I

    return-object v0
.end method

.method public getOriginalScale()F
    .registers 2

    .prologue
    .line 627
    iget v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mOriginalScale:F

    return v0
.end method

.method public getScale()F
    .registers 2

    .prologue
    .line 618
    iget v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mScale:F

    return v0
.end method

.method public getSelectableBuffer()I
    .registers 2

    .prologue
    .line 754
    iget v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->selectableBuffer:I

    return v0
.end method

.method public getSeriesRendererAt(I)Lorg/achartengine/renderer/SimpleSeriesRenderer;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 195
    iget-object v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mRenderers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/achartengine/renderer/SimpleSeriesRenderer;

    return-object v0
.end method

.method public getSeriesRendererCount()I
    .registers 2

    .prologue
    .line 204
    iget-object v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mRenderers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getSeriesRenderers()[Lorg/achartengine/renderer/SimpleSeriesRenderer;
    .registers 3

    .prologue
    .line 213
    iget-object v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mRenderers:Ljava/util/List;

    const/4 v1, 0x0

    new-array v1, v1, [Lorg/achartengine/renderer/SimpleSeriesRenderer;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/achartengine/renderer/SimpleSeriesRenderer;

    return-object v0
.end method

.method public getStartAngle()F
    .registers 2

    .prologue
    .line 831
    iget v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mStartAngle:F

    return v0
.end method

.method public getTextTypeface()Landroid/graphics/Typeface;
    .registers 2

    .prologue
    .line 553
    iget-object v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mTextTypeface:Landroid/graphics/Typeface;

    return-object v0
.end method

.method public getTextTypefaceName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 535
    iget-object v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mTextTypefaceName:Ljava/lang/String;

    return-object v0
.end method

.method public getTextTypefaceStyle()I
    .registers 2

    .prologue
    .line 544
    iget v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mTextTypefaceStyle:I

    return v0
.end method

.method public getXAxisColor()I
    .registers 2

    .prologue
    .line 299
    iget v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mXAxisColor:I

    return v0
.end method

.method public getYAxisColor()I
    .registers 2

    .prologue
    .line 281
    iget v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mYAxisColor:I

    return v0
.end method

.method public getZoomRate()F
    .registers 2

    .prologue
    .line 700
    iget v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mZoomRate:F

    return v0
.end method

.method public isAntialiasing()Z
    .registers 2

    .prologue
    .line 600
    iget-boolean v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mAntialiasing:Z

    return v0
.end method

.method public isApplyBackgroundColor()Z
    .registers 2

    .prologue
    .line 240
    iget-boolean v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mApplyBackgroundColor:Z

    return v0
.end method

.method public isClickEnabled()Z
    .registers 2

    .prologue
    .line 736
    iget-boolean v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mClickEnabled:Z

    return v0
.end method

.method public isDisplayValues()Z
    .registers 2

    .prologue
    .line 854
    iget-boolean v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mDisplayValues:Z

    return v0
.end method

.method public isExternalZoomEnabled()Z
    .registers 2

    .prologue
    .line 682
    iget-boolean v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mExternalZoomEnabled:Z

    return v0
.end method

.method public isFitLegend()Z
    .registers 2

    .prologue
    .line 517
    iget-boolean v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mFitLegend:Z

    return v0
.end method

.method public isInScroll()Z
    .registers 2

    .prologue
    .line 810
    iget-boolean v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mInScroll:Z

    return v0
.end method

.method public isPanEnabled()Z
    .registers 2

    .prologue
    .line 709
    iget-boolean v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mPanEnabled:Z

    return v0
.end method

.method public isShowAxes()Z
    .registers 2

    .prologue
    .line 353
    iget-boolean v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mShowAxes:Z

    return v0
.end method

.method public isShowCustomTextGridX()Z
    .registers 2

    .prologue
    .line 453
    iget-boolean v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mShowCustomTextGridX:Z

    return v0
.end method

.method public isShowCustomTextGridY()Z
    .registers 2

    .prologue
    .line 462
    iget-boolean v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mShowCustomTextGridY:Z

    return v0
.end method

.method public isShowGridX()Z
    .registers 2

    .prologue
    .line 407
    iget-boolean v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mShowGridX:Z

    return v0
.end method

.method public isShowGridY()Z
    .registers 2

    .prologue
    .line 416
    iget-boolean v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mShowGridY:Z

    return v0
.end method

.method public isShowLabels()Z
    .registers 2

    .prologue
    .line 371
    iget-boolean v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mShowLabels:Z

    return v0
.end method

.method public isShowLegend()Z
    .registers 2

    .prologue
    .line 499
    iget-boolean v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mShowLegend:Z

    return v0
.end method

.method public isShowTickMarks()Z
    .registers 2

    .prologue
    .line 389
    iget-boolean v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mShowTickMarks:Z

    return v0
.end method

.method public isZoomButtonsVisible()Z
    .registers 2

    .prologue
    .line 664
    iget-boolean v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mZoomButtonsVisible:Z

    return v0
.end method

.method public isZoomEnabled()Z
    .registers 2

    .prologue
    .line 646
    iget-boolean v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mZoomEnabled:Z

    return v0
.end method

.method public removeAllRenderers()V
    .registers 2

    .prologue
    .line 185
    iget-object v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mRenderers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 186
    return-void
.end method

.method public removeSeriesRenderer(Lorg/achartengine/renderer/SimpleSeriesRenderer;)V
    .registers 3
    .param p1, "renderer"    # Lorg/achartengine/renderer/SimpleSeriesRenderer;

    .prologue
    .line 178
    iget-object v0, p0, Lorg/achartengine/renderer/DefaultRenderer;->mRenderers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 179
    return-void
.end method

.method public setAntialiasing(Z)V
    .registers 2
    .param p1, "antialiasing"    # Z

    .prologue
    .line 609
    iput-boolean p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mAntialiasing:Z

    .line 610
    return-void
.end method

.method public setApplyBackgroundColor(Z)V
    .registers 2
    .param p1, "apply"    # Z

    .prologue
    .line 249
    iput-boolean p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mApplyBackgroundColor:Z

    .line 250
    return-void
.end method

.method public setAxesColor(I)V
    .registers 2
    .param p1, "color"    # I

    .prologue
    .line 271
    invoke-virtual {p0, p1}, Lorg/achartengine/renderer/DefaultRenderer;->setXAxisColor(I)V

    .line 272
    invoke-virtual {p0, p1}, Lorg/achartengine/renderer/DefaultRenderer;->setYAxisColor(I)V

    .line 273
    return-void
.end method

.method public setBackgroundColor(I)V
    .registers 2
    .param p1, "color"    # I

    .prologue
    .line 231
    iput p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mBackgroundColor:I

    .line 232
    return-void
.end method

.method public setChartTitle(Ljava/lang/String;)V
    .registers 2
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 132
    iput-object p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mChartTitle:Ljava/lang/String;

    .line 133
    return-void
.end method

.method public setChartTitleTextSize(F)V
    .registers 2
    .param p1, "textSize"    # F

    .prologue
    .line 150
    iput p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mChartTitleTextSize:F

    .line 151
    return-void
.end method

.method public setClickEnabled(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 745
    iput-boolean p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mClickEnabled:Z

    .line 746
    return-void
.end method

.method public setDisplayValues(Z)V
    .registers 2
    .param p1, "display"    # Z

    .prologue
    .line 863
    iput-boolean p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mDisplayValues:Z

    .line 864
    return-void
.end method

.method public setExternalZoomEnabled(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 691
    iput-boolean p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mExternalZoomEnabled:Z

    .line 692
    return-void
.end method

.method public setFitLegend(Z)V
    .registers 2
    .param p1, "fit"    # Z

    .prologue
    .line 526
    iput-boolean p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mFitLegend:Z

    .line 527
    return-void
.end method

.method public setInScroll(Z)V
    .registers 2
    .param p1, "inScroll"    # Z

    .prologue
    .line 820
    iput-boolean p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mInScroll:Z

    .line 821
    return-void
.end method

.method public setLabelsColor(I)V
    .registers 2
    .param p1, "color"    # I

    .prologue
    .line 326
    iput p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mLabelsColor:I

    .line 327
    return-void
.end method

.method public setLabelsTextSize(F)V
    .registers 2
    .param p1, "textSize"    # F

    .prologue
    .line 344
    iput p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mLabelsTextSize:F

    .line 345
    return-void
.end method

.method public setLegendHeight(I)V
    .registers 2
    .param p1, "height"    # I

    .prologue
    .line 781
    iput p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mLegendHeight:I

    .line 782
    return-void
.end method

.method public setLegendTextSize(F)V
    .registers 2
    .param p1, "textSize"    # F

    .prologue
    .line 571
    iput p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mLegendTextSize:F

    .line 572
    return-void
.end method

.method public setMargins([I)V
    .registers 2
    .param p1, "margins"    # [I

    .prologue
    .line 801
    iput-object p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mMargins:[I

    .line 802
    return-void
.end method

.method public setPanEnabled(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 718
    iput-boolean p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mPanEnabled:Z

    .line 719
    return-void
.end method

.method public setScale(F)V
    .registers 2
    .param p1, "scale"    # F

    .prologue
    .line 637
    iput p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mScale:F

    .line 638
    return-void
.end method

.method public setSelectableBuffer(I)V
    .registers 2
    .param p1, "buffer"    # I

    .prologue
    .line 763
    iput p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->selectableBuffer:I

    .line 764
    return-void
.end method

.method public setShowAxes(Z)V
    .registers 2
    .param p1, "showAxes"    # Z

    .prologue
    .line 362
    iput-boolean p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mShowAxes:Z

    .line 363
    return-void
.end method

.method public setShowCustomTextGrid(Z)V
    .registers 2
    .param p1, "showGrid"    # Z

    .prologue
    .line 489
    invoke-virtual {p0, p1}, Lorg/achartengine/renderer/DefaultRenderer;->setShowCustomTextGridX(Z)V

    .line 490
    invoke-virtual {p0, p1}, Lorg/achartengine/renderer/DefaultRenderer;->setShowCustomTextGridY(Z)V

    .line 491
    return-void
.end method

.method public setShowCustomTextGridX(Z)V
    .registers 2
    .param p1, "showGrid"    # Z

    .prologue
    .line 471
    iput-boolean p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mShowCustomTextGridX:Z

    .line 472
    return-void
.end method

.method public setShowCustomTextGridY(Z)V
    .registers 2
    .param p1, "showGrid"    # Z

    .prologue
    .line 480
    iput-boolean p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mShowCustomTextGridY:Z

    .line 481
    return-void
.end method

.method public setShowGrid(Z)V
    .registers 2
    .param p1, "showGrid"    # Z

    .prologue
    .line 443
    invoke-virtual {p0, p1}, Lorg/achartengine/renderer/DefaultRenderer;->setShowGridX(Z)V

    .line 444
    invoke-virtual {p0, p1}, Lorg/achartengine/renderer/DefaultRenderer;->setShowGridY(Z)V

    .line 445
    return-void
.end method

.method public setShowGridX(Z)V
    .registers 2
    .param p1, "showGrid"    # Z

    .prologue
    .line 425
    iput-boolean p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mShowGridX:Z

    .line 426
    return-void
.end method

.method public setShowGridY(Z)V
    .registers 2
    .param p1, "showGrid"    # Z

    .prologue
    .line 434
    iput-boolean p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mShowGridY:Z

    .line 435
    return-void
.end method

.method public setShowLabels(Z)V
    .registers 2
    .param p1, "showLabels"    # Z

    .prologue
    .line 380
    iput-boolean p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mShowLabels:Z

    .line 381
    return-void
.end method

.method public setShowLegend(Z)V
    .registers 2
    .param p1, "showLegend"    # Z

    .prologue
    .line 508
    iput-boolean p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mShowLegend:Z

    .line 509
    return-void
.end method

.method public setShowTickMarks(Z)V
    .registers 2
    .param p1, "mShowTickMarks"    # Z

    .prologue
    .line 398
    iput-boolean p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mShowTickMarks:Z

    .line 399
    return-void
.end method

.method public setStartAngle(F)V
    .registers 3
    .param p1, "startAngle"    # F

    .prologue
    .line 842
    :goto_0
    const/4 v0, 0x0

    cmpg-float v0, p1, v0

    if-gez v0, :cond_9

    .line 843
    const/high16 v0, 0x43b40000    # 360.0f

    add-float/2addr p1, v0

    goto :goto_0

    .line 845
    :cond_9
    iput p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mStartAngle:F

    .line 846
    return-void
.end method

.method public setTextTypeface(Landroid/graphics/Typeface;)V
    .registers 2
    .param p1, "typeface"    # Landroid/graphics/Typeface;

    .prologue
    .line 591
    iput-object p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mTextTypeface:Landroid/graphics/Typeface;

    .line 592
    return-void
.end method

.method public setTextTypeface(Ljava/lang/String;I)V
    .registers 3
    .param p1, "typefaceName"    # Ljava/lang/String;
    .param p2, "style"    # I

    .prologue
    .line 581
    iput-object p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mTextTypefaceName:Ljava/lang/String;

    .line 582
    iput p2, p0, Lorg/achartengine/renderer/DefaultRenderer;->mTextTypefaceStyle:I

    .line 583
    return-void
.end method

.method public setXAxisColor(I)V
    .registers 2
    .param p1, "color"    # I

    .prologue
    .line 308
    iput p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mXAxisColor:I

    .line 309
    return-void
.end method

.method public setYAxisColor(I)V
    .registers 2
    .param p1, "color"    # I

    .prologue
    .line 290
    iput p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mYAxisColor:I

    .line 291
    return-void
.end method

.method public setZoomButtonsVisible(Z)V
    .registers 2
    .param p1, "visible"    # Z

    .prologue
    .line 673
    iput-boolean p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mZoomButtonsVisible:Z

    .line 674
    return-void
.end method

.method public setZoomEnabled(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 655
    iput-boolean p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mZoomEnabled:Z

    .line 656
    return-void
.end method

.method public setZoomRate(F)V
    .registers 2
    .param p1, "rate"    # F

    .prologue
    .line 727
    iput p1, p0, Lorg/achartengine/renderer/DefaultRenderer;->mZoomRate:F

    .line 728
    return-void
.end method
