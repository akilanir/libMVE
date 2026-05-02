.class public Lcom/github/mikephil/charting/components/YAxis;
.super Lcom/github/mikephil/charting/components/AxisBase;
.source "YAxis.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/github/mikephil/charting/components/YAxis$AxisDependency;,
        Lcom/github/mikephil/charting/components/YAxis$YAxisLabelPosition;
    }
.end annotation


# instance fields
.field private mAxisDependency:Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

.field public mDecimals:I

.field private mDrawTopYLabelEntry:Z

.field protected mDrawZeroLine:Z

.field public mEntries:[F

.field public mEntryCount:I

.field protected mForceLabels:Z

.field protected mGranularity:F

.field protected mGranularityEnabled:Z

.field protected mInverted:Z

.field private mLabelCount:I

.field protected mMaxWidth:F

.field protected mMinWidth:F

.field private mPosition:Lcom/github/mikephil/charting/components/YAxis$YAxisLabelPosition;

.field protected mShowOnlyMinMax:Z

.field protected mSpacePercentBottom:F

.field protected mSpacePercentTop:F

.field protected mYAxisValueFormatter:Lcom/github/mikephil/charting/formatter/YAxisValueFormatter;

.field protected mZeroLineColor:I

.field protected mZeroLineWidth:F


# direct methods
.method public constructor <init>()V
    .registers 6

    .prologue
    const/high16 v4, 0x41200000    # 10.0f

    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 148
    invoke-direct {p0}, Lcom/github/mikephil/charting/components/AxisBase;-><init>()V

    .line 32
    new-array v0, v1, [F

    iput-object v0, p0, Lcom/github/mikephil/charting/components/YAxis;->mEntries:[F

    .line 47
    const/4 v0, 0x6

    iput v0, p0, Lcom/github/mikephil/charting/components/YAxis;->mLabelCount:I

    .line 52
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/github/mikephil/charting/components/YAxis;->mDrawTopYLabelEntry:Z

    .line 57
    iput-boolean v1, p0, Lcom/github/mikephil/charting/components/YAxis;->mShowOnlyMinMax:Z

    .line 62
    iput-boolean v1, p0, Lcom/github/mikephil/charting/components/YAxis;->mInverted:Z

    .line 67
    iput-boolean v1, p0, Lcom/github/mikephil/charting/components/YAxis;->mForceLabels:Z

    .line 72
    iput-boolean v1, p0, Lcom/github/mikephil/charting/components/YAxis;->mDrawZeroLine:Z

    .line 77
    const v0, -0x777778

    iput v0, p0, Lcom/github/mikephil/charting/components/YAxis;->mZeroLineColor:I

    .line 82
    iput v3, p0, Lcom/github/mikephil/charting/components/YAxis;->mZeroLineWidth:F

    .line 87
    iput v4, p0, Lcom/github/mikephil/charting/components/YAxis;->mSpacePercentTop:F

    .line 92
    iput v4, p0, Lcom/github/mikephil/charting/components/YAxis;->mSpacePercentBottom:F

    .line 97
    sget-object v0, Lcom/github/mikephil/charting/components/YAxis$YAxisLabelPosition;->OUTSIDE_CHART:Lcom/github/mikephil/charting/components/YAxis$YAxisLabelPosition;

    iput-object v0, p0, Lcom/github/mikephil/charting/components/YAxis;->mPosition:Lcom/github/mikephil/charting/components/YAxis$YAxisLabelPosition;

    .line 116
    iput v2, p0, Lcom/github/mikephil/charting/components/YAxis;->mMinWidth:F

    .line 123
    const/high16 v0, 0x7f800000    # Float.POSITIVE_INFINITY

    iput v0, p0, Lcom/github/mikephil/charting/components/YAxis;->mMaxWidth:F

    .line 131
    iput-boolean v1, p0, Lcom/github/mikephil/charting/components/YAxis;->mGranularityEnabled:Z

    .line 136
    iput v3, p0, Lcom/github/mikephil/charting/components/YAxis;->mGranularity:F

    .line 151
    sget-object v0, Lcom/github/mikephil/charting/components/YAxis$AxisDependency;->LEFT:Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    iput-object v0, p0, Lcom/github/mikephil/charting/components/YAxis;->mAxisDependency:Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    .line 152
    iput v2, p0, Lcom/github/mikephil/charting/components/YAxis;->mYOffset:F

    .line 153
    return-void
.end method

.method public constructor <init>(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)V
    .registers 7
    .param p1, "position"    # Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    .prologue
    const/high16 v4, 0x41200000    # 10.0f

    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 156
    invoke-direct {p0}, Lcom/github/mikephil/charting/components/AxisBase;-><init>()V

    .line 32
    new-array v0, v1, [F

    iput-object v0, p0, Lcom/github/mikephil/charting/components/YAxis;->mEntries:[F

    .line 47
    const/4 v0, 0x6

    iput v0, p0, Lcom/github/mikephil/charting/components/YAxis;->mLabelCount:I

    .line 52
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/github/mikephil/charting/components/YAxis;->mDrawTopYLabelEntry:Z

    .line 57
    iput-boolean v1, p0, Lcom/github/mikephil/charting/components/YAxis;->mShowOnlyMinMax:Z

    .line 62
    iput-boolean v1, p0, Lcom/github/mikephil/charting/components/YAxis;->mInverted:Z

    .line 67
    iput-boolean v1, p0, Lcom/github/mikephil/charting/components/YAxis;->mForceLabels:Z

    .line 72
    iput-boolean v1, p0, Lcom/github/mikephil/charting/components/YAxis;->mDrawZeroLine:Z

    .line 77
    const v0, -0x777778

    iput v0, p0, Lcom/github/mikephil/charting/components/YAxis;->mZeroLineColor:I

    .line 82
    iput v3, p0, Lcom/github/mikephil/charting/components/YAxis;->mZeroLineWidth:F

    .line 87
    iput v4, p0, Lcom/github/mikephil/charting/components/YAxis;->mSpacePercentTop:F

    .line 92
    iput v4, p0, Lcom/github/mikephil/charting/components/YAxis;->mSpacePercentBottom:F

    .line 97
    sget-object v0, Lcom/github/mikephil/charting/components/YAxis$YAxisLabelPosition;->OUTSIDE_CHART:Lcom/github/mikephil/charting/components/YAxis$YAxisLabelPosition;

    iput-object v0, p0, Lcom/github/mikephil/charting/components/YAxis;->mPosition:Lcom/github/mikephil/charting/components/YAxis$YAxisLabelPosition;

    .line 116
    iput v2, p0, Lcom/github/mikephil/charting/components/YAxis;->mMinWidth:F

    .line 123
    const/high16 v0, 0x7f800000    # Float.POSITIVE_INFINITY

    iput v0, p0, Lcom/github/mikephil/charting/components/YAxis;->mMaxWidth:F

    .line 131
    iput-boolean v1, p0, Lcom/github/mikephil/charting/components/YAxis;->mGranularityEnabled:Z

    .line 136
    iput v3, p0, Lcom/github/mikephil/charting/components/YAxis;->mGranularity:F

    .line 157
    iput-object p1, p0, Lcom/github/mikephil/charting/components/YAxis;->mAxisDependency:Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    .line 158
    iput v2, p0, Lcom/github/mikephil/charting/components/YAxis;->mYOffset:F

    .line 159
    return-void
.end method


# virtual methods
.method public calculate(FF)V
    .registers 11
    .param p1, "dataMin"    # F
    .param p2, "dataMax"    # F

    .prologue
    const/high16 v7, 0x42c80000    # 100.0f

    const/high16 v6, 0x3f800000    # 1.0f

    .line 579
    iget-boolean v5, p0, Lcom/github/mikephil/charting/components/YAxis;->mCustomAxisMin:Z

    if-eqz v5, :cond_49

    iget v2, p0, Lcom/github/mikephil/charting/components/YAxis;->mAxisMinimum:F

    .line 580
    .local v2, "min":F
    :goto_a
    iget-boolean v5, p0, Lcom/github/mikephil/charting/components/YAxis;->mCustomAxisMax:Z

    if-eqz v5, :cond_4b

    iget v1, p0, Lcom/github/mikephil/charting/components/YAxis;->mAxisMaximum:F

    .line 583
    .local v1, "max":F
    :goto_10
    sub-float v5, v1, v2

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v3

    .line 586
    .local v3, "range":F
    const/4 v5, 0x0

    cmpl-float v5, v3, v5

    if-nez v5, :cond_1d

    .line 587
    add-float/2addr v1, v6

    .line 588
    sub-float/2addr v2, v6

    .line 592
    :cond_1d
    iget-boolean v5, p0, Lcom/github/mikephil/charting/components/YAxis;->mCustomAxisMin:Z

    if-nez v5, :cond_2d

    .line 594
    div-float v5, v3, v7

    invoke-virtual {p0}, Lcom/github/mikephil/charting/components/YAxis;->getSpaceBottom()F

    move-result v6

    mul-float v0, v5, v6

    .line 595
    .local v0, "bottomSpace":F
    sub-float v5, v2, v0

    iput v5, p0, Lcom/github/mikephil/charting/components/YAxis;->mAxisMinimum:F

    .line 599
    .end local v0    # "bottomSpace":F
    :cond_2d
    iget-boolean v5, p0, Lcom/github/mikephil/charting/components/YAxis;->mCustomAxisMax:Z

    if-nez v5, :cond_3d

    .line 601
    div-float v5, v3, v7

    invoke-virtual {p0}, Lcom/github/mikephil/charting/components/YAxis;->getSpaceTop()F

    move-result v6

    mul-float v4, v5, v6

    .line 602
    .local v4, "topSpace":F
    add-float v5, v1, v4

    iput v5, p0, Lcom/github/mikephil/charting/components/YAxis;->mAxisMaximum:F

    .line 606
    .end local v4    # "topSpace":F
    :cond_3d
    iget v5, p0, Lcom/github/mikephil/charting/components/YAxis;->mAxisMaximum:F

    iget v6, p0, Lcom/github/mikephil/charting/components/YAxis;->mAxisMinimum:F

    sub-float/2addr v5, v6

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    iput v5, p0, Lcom/github/mikephil/charting/components/YAxis;->mAxisRange:F

    .line 614
    return-void

    .end local v1    # "max":F
    .end local v2    # "min":F
    .end local v3    # "range":F
    :cond_49
    move v2, p1

    .line 579
    goto :goto_a

    .restart local v2    # "min":F
    :cond_4b
    move v1, p2

    .line 580
    goto :goto_10
.end method

.method public getAxisDependency()Lcom/github/mikephil/charting/components/YAxis$AxisDependency;
    .registers 2

    .prologue
    .line 162
    iget-object v0, p0, Lcom/github/mikephil/charting/components/YAxis;->mAxisDependency:Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    return-object v0
.end method

.method public getFormattedLabel(I)Ljava/lang/String;
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 505
    if-ltz p1, :cond_7

    iget-object v0, p0, Lcom/github/mikephil/charting/components/YAxis;->mEntries:[F

    array-length v0, v0

    if-lt p1, v0, :cond_a

    .line 506
    :cond_7
    const-string v0, ""

    .line 508
    :goto_9
    return-object v0

    :cond_a
    invoke-virtual {p0}, Lcom/github/mikephil/charting/components/YAxis;->getValueFormatter()Lcom/github/mikephil/charting/formatter/YAxisValueFormatter;

    move-result-object v0

    iget-object v1, p0, Lcom/github/mikephil/charting/components/YAxis;->mEntries:[F

    aget v1, v1, p1

    invoke-interface {v0, v1, p0}, Lcom/github/mikephil/charting/formatter/YAxisValueFormatter;->getFormattedValue(FLcom/github/mikephil/charting/components/YAxis;)Ljava/lang/String;

    move-result-object v0

    goto :goto_9
.end method

.method public getGranularity()F
    .registers 2

    .prologue
    .line 218
    iget v0, p0, Lcom/github/mikephil/charting/components/YAxis;->mGranularity:F

    return v0
.end method

.method public getLabelCount()I
    .registers 2

    .prologue
    .line 297
    iget v0, p0, Lcom/github/mikephil/charting/components/YAxis;->mLabelCount:I

    return v0
.end method

.method public getLabelPosition()Lcom/github/mikephil/charting/components/YAxis$YAxisLabelPosition;
    .registers 2

    .prologue
    .line 237
    iget-object v0, p0, Lcom/github/mikephil/charting/components/YAxis;->mPosition:Lcom/github/mikephil/charting/components/YAxis$YAxisLabelPosition;

    return-object v0
.end method

.method public getLongestLabel()Ljava/lang/String;
    .registers 6

    .prologue
    .line 483
    const-string v1, ""

    .line 485
    .local v1, "longest":Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_3
    iget-object v3, p0, Lcom/github/mikephil/charting/components/YAxis;->mEntries:[F

    array-length v3, v3

    if-ge v0, v3, :cond_1a

    .line 486
    invoke-virtual {p0, v0}, Lcom/github/mikephil/charting/components/YAxis;->getFormattedLabel(I)Ljava/lang/String;

    move-result-object v2

    .line 488
    .local v2, "text":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v3, v4, :cond_17

    .line 489
    move-object v1, v2

    .line 485
    :cond_17
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 492
    .end local v2    # "text":Ljava/lang/String;
    :cond_1a
    return-object v1
.end method

.method public getMaxWidth()F
    .registers 2

    .prologue
    .line 185
    iget v0, p0, Lcom/github/mikephil/charting/components/YAxis;->mMaxWidth:F

    return v0
.end method

.method public getMinWidth()F
    .registers 2

    .prologue
    .line 169
    iget v0, p0, Lcom/github/mikephil/charting/components/YAxis;->mMinWidth:F

    return v0
.end method

.method public getRequiredHeightSpace(Landroid/graphics/Paint;)F
    .registers 6
    .param p1, "p"    # Landroid/graphics/Paint;

    .prologue
    .line 474
    iget v1, p0, Lcom/github/mikephil/charting/components/YAxis;->mTextSize:F

    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 476
    invoke-virtual {p0}, Lcom/github/mikephil/charting/components/YAxis;->getLongestLabel()Ljava/lang/String;

    move-result-object v0

    .line 477
    .local v0, "label":Ljava/lang/String;
    invoke-static {p1, v0}, Lcom/github/mikephil/charting/utils/Utils;->calcTextHeight(Landroid/graphics/Paint;Ljava/lang/String;)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p0}, Lcom/github/mikephil/charting/components/YAxis;->getYOffset()F

    move-result v2

    const/high16 v3, 0x40000000    # 2.0f

    mul-float/2addr v2, v3

    add-float/2addr v1, v2

    return v1
.end method

.method public getRequiredWidthSpace(Landroid/graphics/Paint;)F
    .registers 10
    .param p1, "p"    # Landroid/graphics/Paint;

    .prologue
    const/4 v7, 0x0

    .line 447
    iget v4, p0, Lcom/github/mikephil/charting/components/YAxis;->mTextSize:F

    invoke-virtual {p1, v4}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 449
    invoke-virtual {p0}, Lcom/github/mikephil/charting/components/YAxis;->getLongestLabel()Ljava/lang/String;

    move-result-object v0

    .line 450
    .local v0, "label":Ljava/lang/String;
    invoke-static {p1, v0}, Lcom/github/mikephil/charting/utils/Utils;->calcTextWidth(Landroid/graphics/Paint;Ljava/lang/String;)I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {p0}, Lcom/github/mikephil/charting/components/YAxis;->getXOffset()F

    move-result v5

    const/high16 v6, 0x40000000    # 2.0f

    mul-float/2addr v5, v6

    add-float v3, v4, v5

    .line 452
    .local v3, "width":F
    invoke-virtual {p0}, Lcom/github/mikephil/charting/components/YAxis;->getMinWidth()F

    move-result v2

    .line 453
    .local v2, "minWidth":F
    invoke-virtual {p0}, Lcom/github/mikephil/charting/components/YAxis;->getMaxWidth()F

    move-result v1

    .line 455
    .local v1, "maxWidth":F
    cmpl-float v4, v2, v7

    if-lez v4, :cond_28

    .line 456
    invoke-static {v2}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v2

    .line 458
    :cond_28
    cmpl-float v4, v1, v7

    if-lez v4, :cond_36

    const/high16 v4, 0x7f800000    # Float.POSITIVE_INFINITY

    cmpl-float v4, v1, v4

    if-eqz v4, :cond_36

    .line 459
    invoke-static {v1}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v1

    .line 461
    :cond_36
    float-to-double v4, v1

    const-wide/16 v6, 0x0

    cmpl-double v4, v4, v6

    if-lez v4, :cond_46

    .end local v1    # "maxWidth":F
    :goto_3d
    invoke-static {v3, v1}, Ljava/lang/Math;->min(FF)F

    move-result v4

    invoke-static {v2, v4}, Ljava/lang/Math;->max(FF)F

    move-result v3

    .line 463
    return v3

    .restart local v1    # "maxWidth":F
    :cond_46
    move v1, v3

    .line 461
    goto :goto_3d
.end method

.method public getSpaceBottom()F
    .registers 2

    .prologue
    .line 396
    iget v0, p0, Lcom/github/mikephil/charting/components/YAxis;->mSpacePercentBottom:F

    return v0
.end method

.method public getSpaceTop()F
    .registers 2

    .prologue
    .line 378
    iget v0, p0, Lcom/github/mikephil/charting/components/YAxis;->mSpacePercentTop:F

    return v0
.end method

.method public getValueFormatter()Lcom/github/mikephil/charting/formatter/YAxisValueFormatter;
    .registers 3

    .prologue
    .line 535
    iget-object v0, p0, Lcom/github/mikephil/charting/components/YAxis;->mYAxisValueFormatter:Lcom/github/mikephil/charting/formatter/YAxisValueFormatter;

    if-nez v0, :cond_d

    .line 536
    new-instance v0, Lcom/github/mikephil/charting/formatter/DefaultYAxisValueFormatter;

    iget v1, p0, Lcom/github/mikephil/charting/components/YAxis;->mDecimals:I

    invoke-direct {v0, v1}, Lcom/github/mikephil/charting/formatter/DefaultYAxisValueFormatter;-><init>(I)V

    iput-object v0, p0, Lcom/github/mikephil/charting/components/YAxis;->mYAxisValueFormatter:Lcom/github/mikephil/charting/formatter/YAxisValueFormatter;

    .line 538
    :cond_d
    iget-object v0, p0, Lcom/github/mikephil/charting/components/YAxis;->mYAxisValueFormatter:Lcom/github/mikephil/charting/formatter/YAxisValueFormatter;

    return-object v0
.end method

.method public getZeroLineColor()I
    .registers 2

    .prologue
    .line 414
    iget v0, p0, Lcom/github/mikephil/charting/components/YAxis;->mZeroLineColor:I

    return v0
.end method

.method public getZeroLineWidth()F
    .registers 2

    .prologue
    .line 427
    iget v0, p0, Lcom/github/mikephil/charting/components/YAxis;->mZeroLineWidth:F

    return v0
.end method

.method public isDrawTopYLabelEntryEnabled()Z
    .registers 2

    .prologue
    .line 255
    iget-boolean v0, p0, Lcom/github/mikephil/charting/components/YAxis;->mDrawTopYLabelEntry:Z

    return v0
.end method

.method public isDrawZeroLineEnabled()Z
    .registers 2

    .prologue
    .line 400
    iget-boolean v0, p0, Lcom/github/mikephil/charting/components/YAxis;->mDrawZeroLine:Z

    return v0
.end method

.method public isForceLabelsEnabled()Z
    .registers 2

    .prologue
    .line 306
    iget-boolean v0, p0, Lcom/github/mikephil/charting/components/YAxis;->mForceLabels:Z

    return v0
.end method

.method public isGranularityEnabled()Z
    .registers 2

    .prologue
    .line 201
    iget-boolean v0, p0, Lcom/github/mikephil/charting/components/YAxis;->mGranularityEnabled:Z

    return v0
.end method

.method public isInverted()Z
    .registers 2

    .prologue
    .line 346
    iget-boolean v0, p0, Lcom/github/mikephil/charting/components/YAxis;->mInverted:Z

    return v0
.end method

.method public isShowOnlyMinMaxEnabled()Z
    .registers 2

    .prologue
    .line 326
    iget-boolean v0, p0, Lcom/github/mikephil/charting/components/YAxis;->mShowOnlyMinMax:Z

    return v0
.end method

.method public needsDefaultFormatter()Z
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 548
    iget-object v1, p0, Lcom/github/mikephil/charting/components/YAxis;->mYAxisValueFormatter:Lcom/github/mikephil/charting/formatter/YAxisValueFormatter;

    if-nez v1, :cond_6

    .line 553
    :cond_5
    :goto_5
    return v0

    .line 550
    :cond_6
    iget-object v1, p0, Lcom/github/mikephil/charting/components/YAxis;->mYAxisValueFormatter:Lcom/github/mikephil/charting/formatter/YAxisValueFormatter;

    instance-of v1, v1, Lcom/github/mikephil/charting/formatter/DefaultValueFormatter;

    if-nez v1, :cond_5

    .line 553
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public needsOffset()Z
    .registers 3

    .prologue
    .line 562
    invoke-virtual {p0}, Lcom/github/mikephil/charting/components/YAxis;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_16

    invoke-virtual {p0}, Lcom/github/mikephil/charting/components/YAxis;->isDrawLabelsEnabled()Z

    move-result v0

    if-eqz v0, :cond_16

    invoke-virtual {p0}, Lcom/github/mikephil/charting/components/YAxis;->getLabelPosition()Lcom/github/mikephil/charting/components/YAxis$YAxisLabelPosition;

    move-result-object v0

    sget-object v1, Lcom/github/mikephil/charting/components/YAxis$YAxisLabelPosition;->OUTSIDE_CHART:Lcom/github/mikephil/charting/components/YAxis$YAxisLabelPosition;

    if-ne v0, v1, :cond_16

    .line 564
    const/4 v0, 0x1

    .line 566
    :goto_15
    return v0

    :cond_16
    const/4 v0, 0x0

    goto :goto_15
.end method

.method public setDrawTopYLabelEntry(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 266
    iput-boolean p1, p0, Lcom/github/mikephil/charting/components/YAxis;->mDrawTopYLabelEntry:Z

    .line 267
    return-void
.end method

.method public setDrawZeroLine(Z)V
    .registers 2
    .param p1, "mDrawZeroLine"    # Z

    .prologue
    .line 410
    iput-boolean p1, p0, Lcom/github/mikephil/charting/components/YAxis;->mDrawZeroLine:Z

    .line 411
    return-void
.end method

.method public setGranularity(F)V
    .registers 3
    .param p1, "granularity"    # F

    .prologue
    .line 228
    iput p1, p0, Lcom/github/mikephil/charting/components/YAxis;->mGranularity:F

    .line 230
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/github/mikephil/charting/components/YAxis;->mGranularityEnabled:Z

    .line 231
    return-void
.end method

.method public setGranularityEnabled(Z)V
    .registers 3
    .param p1, "enabled"    # Z

    .prologue
    .line 211
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/github/mikephil/charting/components/YAxis;->mGranularityEnabled:Z

    .line 212
    return-void
.end method

.method public setInverted(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 337
    iput-boolean p1, p0, Lcom/github/mikephil/charting/components/YAxis;->mInverted:Z

    .line 338
    return-void
.end method

.method public setLabelCount(IZ)V
    .registers 4
    .param p1, "count"    # I
    .param p2, "force"    # Z

    .prologue
    .line 282
    const/16 v0, 0x19

    if-le p1, v0, :cond_6

    .line 283
    const/16 p1, 0x19

    .line 284
    :cond_6
    const/4 v0, 0x2

    if-ge p1, v0, :cond_a

    .line 285
    const/4 p1, 0x2

    .line 287
    :cond_a
    iput p1, p0, Lcom/github/mikephil/charting/components/YAxis;->mLabelCount:I

    .line 288
    iput-boolean p2, p0, Lcom/github/mikephil/charting/components/YAxis;->mForceLabels:Z

    .line 289
    return-void
.end method

.method public setMaxWidth(F)V
    .registers 2
    .param p1, "maxWidth"    # F

    .prologue
    .line 194
    iput p1, p0, Lcom/github/mikephil/charting/components/YAxis;->mMaxWidth:F

    .line 195
    return-void
.end method

.method public setMinWidth(F)V
    .registers 2
    .param p1, "minWidth"    # F

    .prologue
    .line 178
    iput p1, p0, Lcom/github/mikephil/charting/components/YAxis;->mMinWidth:F

    .line 179
    return-void
.end method

.method public setPosition(Lcom/github/mikephil/charting/components/YAxis$YAxisLabelPosition;)V
    .registers 2
    .param p1, "pos"    # Lcom/github/mikephil/charting/components/YAxis$YAxisLabelPosition;

    .prologue
    .line 246
    iput-object p1, p0, Lcom/github/mikephil/charting/components/YAxis;->mPosition:Lcom/github/mikephil/charting/components/YAxis$YAxisLabelPosition;

    .line 247
    return-void
.end method

.method public setShowOnlyMinMax(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 317
    iput-boolean p1, p0, Lcom/github/mikephil/charting/components/YAxis;->mShowOnlyMinMax:Z

    .line 318
    return-void
.end method

.method public setSpaceBottom(F)V
    .registers 2
    .param p1, "percent"    # F

    .prologue
    .line 387
    iput p1, p0, Lcom/github/mikephil/charting/components/YAxis;->mSpacePercentBottom:F

    .line 388
    return-void
.end method

.method public setSpaceTop(F)V
    .registers 2
    .param p1, "percent"    # F

    .prologue
    .line 369
    iput p1, p0, Lcom/github/mikephil/charting/components/YAxis;->mSpacePercentTop:F

    .line 370
    return-void
.end method

.method public setStartAtZero(Z)V
    .registers 3
    .param p1, "startAtZero"    # Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 357
    if-eqz p1, :cond_7

    .line 358
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/github/mikephil/charting/components/YAxis;->setAxisMinValue(F)V

    .line 361
    :goto_6
    return-void

    .line 360
    :cond_7
    invoke-virtual {p0}, Lcom/github/mikephil/charting/components/YAxis;->resetAxisMinValue()V

    goto :goto_6
.end method

.method public setValueFormatter(Lcom/github/mikephil/charting/formatter/YAxisValueFormatter;)V
    .registers 4
    .param p1, "f"    # Lcom/github/mikephil/charting/formatter/YAxisValueFormatter;

    .prologue
    .line 522
    if-nez p1, :cond_c

    .line 523
    new-instance v0, Lcom/github/mikephil/charting/formatter/DefaultYAxisValueFormatter;

    iget v1, p0, Lcom/github/mikephil/charting/components/YAxis;->mDecimals:I

    invoke-direct {v0, v1}, Lcom/github/mikephil/charting/formatter/DefaultYAxisValueFormatter;-><init>(I)V

    iput-object v0, p0, Lcom/github/mikephil/charting/components/YAxis;->mYAxisValueFormatter:Lcom/github/mikephil/charting/formatter/YAxisValueFormatter;

    .line 526
    :goto_b
    return-void

    .line 525
    :cond_c
    iput-object p1, p0, Lcom/github/mikephil/charting/components/YAxis;->mYAxisValueFormatter:Lcom/github/mikephil/charting/formatter/YAxisValueFormatter;

    goto :goto_b
.end method

.method public setZeroLineColor(I)V
    .registers 2
    .param p1, "color"    # I

    .prologue
    .line 423
    iput p1, p0, Lcom/github/mikephil/charting/components/YAxis;->mZeroLineColor:I

    .line 424
    return-void
.end method

.method public setZeroLineWidth(F)V
    .registers 3
    .param p1, "width"    # F

    .prologue
    .line 436
    invoke-static {p1}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/components/YAxis;->mZeroLineWidth:F

    .line 437
    return-void
.end method
