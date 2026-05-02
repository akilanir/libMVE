.class public abstract Lcom/github/mikephil/charting/charts/PieRadarChartBase;
.super Lcom/github/mikephil/charting/charts/Chart;
.source "PieRadarChartBase.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/github/mikephil/charting/charts/PieRadarChartBase$2;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/github/mikephil/charting/data/ChartData",
        "<+",
        "Lcom/github/mikephil/charting/interfaces/datasets/IDataSet",
        "<+",
        "Lcom/github/mikephil/charting/data/Entry;",
        ">;>;>",
        "Lcom/github/mikephil/charting/charts/Chart",
        "<TT;>;"
    }
.end annotation


# instance fields
.field protected mMinOffset:F

.field private mRawRotationAngle:F

.field protected mRotateEnabled:Z

.field private mRotationAngle:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/charts/PieRadarChartBase;, "Lcom/github/mikephil/charting/charts/PieRadarChartBase<TT;>;"
    const/high16 v0, 0x43870000    # 270.0f

    .line 50
    invoke-direct {p0, p1}, Lcom/github/mikephil/charting/charts/Chart;-><init>(Landroid/content/Context;)V

    .line 38
    iput v0, p0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mRotationAngle:F

    .line 41
    iput v0, p0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mRawRotationAngle:F

    .line 44
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mRotateEnabled:Z

    .line 47
    const/4 v0, 0x0

    iput v0, p0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mMinOffset:F

    .line 51
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/charts/PieRadarChartBase;, "Lcom/github/mikephil/charting/charts/PieRadarChartBase<TT;>;"
    const/high16 v0, 0x43870000    # 270.0f

    .line 54
    invoke-direct {p0, p1, p2}, Lcom/github/mikephil/charting/charts/Chart;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 38
    iput v0, p0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mRotationAngle:F

    .line 41
    iput v0, p0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mRawRotationAngle:F

    .line 44
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mRotateEnabled:Z

    .line 47
    const/4 v0, 0x0

    iput v0, p0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mMinOffset:F

    .line 55
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/charts/PieRadarChartBase;, "Lcom/github/mikephil/charting/charts/PieRadarChartBase<TT;>;"
    const/high16 v0, 0x43870000    # 270.0f

    .line 58
    invoke-direct {p0, p1, p2, p3}, Lcom/github/mikephil/charting/charts/Chart;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 38
    iput v0, p0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mRotationAngle:F

    .line 41
    iput v0, p0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mRawRotationAngle:F

    .line 44
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mRotateEnabled:Z

    .line 47
    const/4 v0, 0x0

    iput v0, p0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mMinOffset:F

    .line 59
    return-void
.end method


# virtual methods
.method protected calcMinMax()V
    .registers 3

    .prologue
    .line 70
    .local p0, "this":Lcom/github/mikephil/charting/charts/PieRadarChartBase;, "Lcom/github/mikephil/charting/charts/PieRadarChartBase<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mXAxis:Lcom/github/mikephil/charting/components/XAxis;

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mData:Lcom/github/mikephil/charting/data/ChartData;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/data/ChartData;->getXVals()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    int-to-float v1, v1

    iput v1, v0, Lcom/github/mikephil/charting/components/XAxis;->mAxisRange:F

    .line 71
    return-void
.end method

.method public calculateOffsets()V
    .registers 33

    .prologue
    .line 105
    .local p0, "this":Lcom/github/mikephil/charting/charts/PieRadarChartBase;, "Lcom/github/mikephil/charting/charts/PieRadarChartBase<TT;>;"
    const/4 v14, 0x0

    .local v14, "legendLeft":F
    const/4 v15, 0x0

    .local v15, "legendRight":F
    const/4 v12, 0x0

    .local v12, "legendBottom":F
    const/16 v16, 0x0

    .line 107
    .local v16, "legendTop":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    move-object/from16 v29, v0

    if-eqz v29, :cond_90

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Lcom/github/mikephil/charting/components/Legend;->isEnabled()Z

    move-result v29

    if-eqz v29, :cond_90

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Lcom/github/mikephil/charting/components/Legend;->isDrawInsideEnabled()Z

    move-result v29

    if-nez v29, :cond_90

    .line 109
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    iget v0, v0, Lcom/github/mikephil/charting/components/Legend;->mNeededWidth:F

    move/from16 v29, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getChartWidth()F

    move-result v30

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Lcom/github/mikephil/charting/components/Legend;->getMaxSizePercent()F

    move-result v31

    mul-float v30, v30, v31

    invoke-static/range {v29 .. v30}, Ljava/lang/Math;->min(FF)F

    move-result v29

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Lcom/github/mikephil/charting/components/Legend;->getFormSize()F

    move-result v30

    add-float v29, v29, v30

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Lcom/github/mikephil/charting/components/Legend;->getFormToTextSpace()F

    move-result v30

    add-float v11, v29, v30

    .line 113
    .local v11, "fullLegendWidth":F
    sget-object v29, Lcom/github/mikephil/charting/charts/PieRadarChartBase$2;->$SwitchMap$com$github$mikephil$charting$components$Legend$LegendOrientation:[I

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Lcom/github/mikephil/charting/components/Legend;->getOrientation()Lcom/github/mikephil/charting/components/Legend$LegendOrientation;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Lcom/github/mikephil/charting/components/Legend$LegendOrientation;->ordinal()I

    move-result v30

    aget v29, v29, v30

    packed-switch v29, :pswitch_data_350

    .line 209
    :cond_78
    :goto_78
    invoke-virtual/range {p0 .. p0}, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->getRequiredBaseOffset()F

    move-result v29

    add-float v14, v14, v29

    .line 210
    invoke-virtual/range {p0 .. p0}, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->getRequiredBaseOffset()F

    move-result v29

    add-float v15, v15, v29

    .line 211
    invoke-virtual/range {p0 .. p0}, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->getRequiredBaseOffset()F

    move-result v29

    add-float v16, v16, v29

    .line 212
    invoke-virtual/range {p0 .. p0}, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->getRequiredBaseOffset()F

    move-result v29

    add-float v12, v12, v29

    .line 215
    .end local v11    # "fullLegendWidth":F
    :cond_90
    move-object/from16 v0, p0

    iget v0, v0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mMinOffset:F

    move/from16 v29, v0

    invoke-static/range {v29 .. v29}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v18

    .line 217
    .local v18, "minOffset":F
    move-object/from16 v0, p0

    instance-of v0, v0, Lcom/github/mikephil/charting/charts/RadarChart;

    move/from16 v29, v0

    if-eqz v29, :cond_c5

    .line 218
    invoke-virtual/range {p0 .. p0}, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->getXAxis()Lcom/github/mikephil/charting/components/XAxis;

    move-result-object v25

    .line 220
    .local v25, "x":Lcom/github/mikephil/charting/components/XAxis;
    invoke-virtual/range {v25 .. v25}, Lcom/github/mikephil/charting/components/XAxis;->isEnabled()Z

    move-result v29

    if-eqz v29, :cond_c5

    invoke-virtual/range {v25 .. v25}, Lcom/github/mikephil/charting/components/XAxis;->isDrawLabelsEnabled()Z

    move-result v29

    if-eqz v29, :cond_c5

    .line 221
    move-object/from16 v0, v25

    iget v0, v0, Lcom/github/mikephil/charting/components/XAxis;->mLabelRotatedWidth:I

    move/from16 v29, v0

    move/from16 v0, v29

    int-to-float v0, v0

    move/from16 v29, v0

    move/from16 v0, v18

    move/from16 v1, v29

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v18

    .line 225
    .end local v25    # "x":Lcom/github/mikephil/charting/components/XAxis;
    :cond_c5
    invoke-virtual/range {p0 .. p0}, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->getExtraTopOffset()F

    move-result v29

    add-float v16, v16, v29

    .line 226
    invoke-virtual/range {p0 .. p0}, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->getExtraRightOffset()F

    move-result v29

    add-float v15, v15, v29

    .line 227
    invoke-virtual/range {p0 .. p0}, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->getExtraBottomOffset()F

    move-result v29

    add-float v12, v12, v29

    .line 228
    invoke-virtual/range {p0 .. p0}, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->getExtraLeftOffset()F

    move-result v29

    add-float v14, v14, v29

    .line 230
    move/from16 v0, v18

    invoke-static {v0, v14}, Ljava/lang/Math;->max(FF)F

    move-result v20

    .line 231
    .local v20, "offsetLeft":F
    move/from16 v0, v18

    move/from16 v1, v16

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v22

    .line 232
    .local v22, "offsetTop":F
    move/from16 v0, v18

    invoke-static {v0, v15}, Ljava/lang/Math;->max(FF)F

    move-result v21

    .line 233
    .local v21, "offsetRight":F
    invoke-virtual/range {p0 .. p0}, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->getRequiredBaseOffset()F

    move-result v29

    move/from16 v0, v29

    invoke-static {v0, v12}, Ljava/lang/Math;->max(FF)F

    move-result v29

    move/from16 v0, v18

    move/from16 v1, v29

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v19

    .line 235
    .local v19, "offsetBottom":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    move/from16 v1, v20

    move/from16 v2, v22

    move/from16 v3, v21

    move/from16 v4, v19

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->restrainViewPort(FFFF)V

    .line 237
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mLogEnabled:Z

    move/from16 v29, v0

    if-eqz v29, :cond_164

    .line 238
    const-string v29, "MPAndroidChart"

    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    const-string v31, "offsetLeft: "

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    move-object/from16 v0, v30

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, ", offsetTop: "

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    move-object/from16 v0, v30

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, ", offsetRight: "

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    move-object/from16 v0, v30

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, ", offsetBottom: "

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    move-object/from16 v0, v30

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v30

    invoke-static/range {v29 .. v30}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 240
    :cond_164
    return-void

    .line 116
    .end local v18    # "minOffset":F
    .end local v19    # "offsetBottom":F
    .end local v20    # "offsetLeft":F
    .end local v21    # "offsetRight":F
    .end local v22    # "offsetTop":F
    .restart local v11    # "fullLegendWidth":F
    :pswitch_165
    const/16 v26, 0x0

    .line 118
    .local v26, "xLegendOffset":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Lcom/github/mikephil/charting/components/Legend;->getHorizontalAlignment()Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;

    move-result-object v29

    sget-object v30, Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;->LEFT:Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;

    move-object/from16 v0, v29

    move-object/from16 v1, v30

    if-eq v0, v1, :cond_18b

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Lcom/github/mikephil/charting/components/Legend;->getHorizontalAlignment()Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;

    move-result-object v29

    sget-object v30, Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;->RIGHT:Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;

    move-object/from16 v0, v29

    move-object/from16 v1, v30

    if-ne v0, v1, :cond_1a5

    .line 120
    :cond_18b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Lcom/github/mikephil/charting/components/Legend;->getVerticalAlignment()Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;

    move-result-object v29

    sget-object v30, Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;->CENTER:Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;

    move-object/from16 v0, v29

    move-object/from16 v1, v30

    if-ne v0, v1, :cond_1c0

    .line 122
    const/high16 v29, 0x41500000    # 13.0f

    invoke-static/range {v29 .. v29}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v24

    .line 124
    .local v24, "spacing":F
    add-float v26, v11, v24

    .line 158
    .end local v24    # "spacing":F
    :cond_1a5
    :goto_1a5
    sget-object v29, Lcom/github/mikephil/charting/charts/PieRadarChartBase$2;->$SwitchMap$com$github$mikephil$charting$components$Legend$LegendHorizontalAlignment:[I

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Lcom/github/mikephil/charting/components/Legend;->getHorizontalAlignment()Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;->ordinal()I

    move-result v30

    aget v29, v29, v30

    packed-switch v29, :pswitch_data_358

    goto/16 :goto_78

    .line 160
    :pswitch_1bc
    move/from16 v14, v26

    .line 161
    goto/16 :goto_78

    .line 128
    :cond_1c0
    const/high16 v29, 0x41000000    # 8.0f

    invoke-static/range {v29 .. v29}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v24

    .line 130
    .restart local v24    # "spacing":F
    add-float v17, v11, v24

    .line 131
    .local v17, "legendWidth":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    iget v0, v0, Lcom/github/mikephil/charting/components/Legend;->mNeededHeight:F

    move/from16 v29, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    iget v0, v0, Lcom/github/mikephil/charting/components/Legend;->mTextHeightMax:F

    move/from16 v30, v0

    add-float v13, v29, v30

    .line 133
    .local v13, "legendHeight":F
    invoke-virtual/range {p0 .. p0}, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->getCenter()Landroid/graphics/PointF;

    move-result-object v7

    .line 135
    .local v7, "c":Landroid/graphics/PointF;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Lcom/github/mikephil/charting/components/Legend;->getHorizontalAlignment()Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;

    move-result-object v29

    sget-object v30, Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;->RIGHT:Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;

    move-object/from16 v0, v29

    move-object/from16 v1, v30

    if-ne v0, v1, :cond_265

    invoke-virtual/range {p0 .. p0}, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->getWidth()I

    move-result v29

    move/from16 v0, v29

    int-to-float v0, v0

    move/from16 v29, v0

    sub-float v29, v29, v17

    const/high16 v30, 0x41700000    # 15.0f

    add-float v5, v29, v30

    .line 139
    .local v5, "bottomX":F
    :goto_207
    const/high16 v29, 0x41700000    # 15.0f

    add-float v6, v13, v29

    .line 140
    .local v6, "bottomY":F
    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v6}, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->distanceToCenter(FF)F

    move-result v9

    .line 142
    .local v9, "distLegend":F
    invoke-virtual/range {p0 .. p0}, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->getRadius()F

    move-result v29

    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v6}, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->getAngleForPoint(FF)F

    move-result v30

    move-object/from16 v0, p0

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-virtual {v0, v7, v1, v2}, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->getPosition(Landroid/graphics/PointF;FF)Landroid/graphics/PointF;

    move-result-object v23

    .line 145
    .local v23, "reference":Landroid/graphics/PointF;
    move-object/from16 v0, v23

    iget v0, v0, Landroid/graphics/PointF;->x:F

    move/from16 v29, v0

    move-object/from16 v0, v23

    iget v0, v0, Landroid/graphics/PointF;->y:F

    move/from16 v30, v0

    move-object/from16 v0, p0

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-virtual {v0, v1, v2}, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->distanceToCenter(FF)F

    move-result v10

    .line 146
    .local v10, "distReference":F
    const/high16 v29, 0x40a00000    # 5.0f

    invoke-static/range {v29 .. v29}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v18

    .line 148
    .restart local v18    # "minOffset":F
    iget v0, v7, Landroid/graphics/PointF;->y:F

    move/from16 v29, v0

    cmpl-float v29, v6, v29

    if-ltz v29, :cond_26a

    invoke-virtual/range {p0 .. p0}, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->getHeight()I

    move-result v29

    move/from16 v0, v29

    int-to-float v0, v0

    move/from16 v29, v0

    sub-float v29, v29, v17

    invoke-virtual/range {p0 .. p0}, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->getWidth()I

    move-result v30

    move/from16 v0, v30

    int-to-float v0, v0

    move/from16 v30, v0

    cmpl-float v29, v29, v30

    if-lez v29, :cond_26a

    .line 149
    move/from16 v26, v17

    goto/16 :goto_1a5

    .line 135
    .end local v5    # "bottomX":F
    .end local v6    # "bottomY":F
    .end local v9    # "distLegend":F
    .end local v10    # "distReference":F
    .end local v18    # "minOffset":F
    .end local v23    # "reference":Landroid/graphics/PointF;
    :cond_265
    const/high16 v29, 0x41700000    # 15.0f

    sub-float v5, v17, v29

    goto :goto_207

    .line 150
    .restart local v5    # "bottomX":F
    .restart local v6    # "bottomY":F
    .restart local v9    # "distLegend":F
    .restart local v10    # "distReference":F
    .restart local v18    # "minOffset":F
    .restart local v23    # "reference":Landroid/graphics/PointF;
    :cond_26a
    cmpg-float v29, v9, v10

    if-gez v29, :cond_1a5

    .line 152
    sub-float v8, v10, v9

    .line 153
    .local v8, "diff":F
    add-float v26, v18, v8

    goto/16 :goto_1a5

    .line 164
    .end local v5    # "bottomX":F
    .end local v6    # "bottomY":F
    .end local v7    # "c":Landroid/graphics/PointF;
    .end local v8    # "diff":F
    .end local v9    # "distLegend":F
    .end local v10    # "distReference":F
    .end local v13    # "legendHeight":F
    .end local v17    # "legendWidth":F
    .end local v18    # "minOffset":F
    .end local v23    # "reference":Landroid/graphics/PointF;
    .end local v24    # "spacing":F
    :pswitch_274
    move/from16 v15, v26

    .line 165
    goto/16 :goto_78

    .line 168
    :pswitch_278
    sget-object v29, Lcom/github/mikephil/charting/charts/PieRadarChartBase$2;->$SwitchMap$com$github$mikephil$charting$components$Legend$LegendVerticalAlignment:[I

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Lcom/github/mikephil/charting/components/Legend;->getVerticalAlignment()Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;->ordinal()I

    move-result v30

    aget v29, v29, v30

    packed-switch v29, :pswitch_data_362

    goto/16 :goto_78

    .line 170
    :pswitch_28f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    iget v0, v0, Lcom/github/mikephil/charting/components/Legend;->mNeededHeight:F

    move/from16 v29, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getChartHeight()F

    move-result v30

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Lcom/github/mikephil/charting/components/Legend;->getMaxSizePercent()F

    move-result v31

    mul-float v30, v30, v31

    invoke-static/range {v29 .. v30}, Ljava/lang/Math;->min(FF)F

    move-result v16

    .line 172
    goto/16 :goto_78

    .line 174
    :pswitch_2b7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    iget v0, v0, Lcom/github/mikephil/charting/components/Legend;->mNeededHeight:F

    move/from16 v29, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getChartHeight()F

    move-result v30

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Lcom/github/mikephil/charting/components/Legend;->getMaxSizePercent()F

    move-result v31

    mul-float v30, v30, v31

    invoke-static/range {v29 .. v30}, Ljava/lang/Math;->min(FF)F

    move-result v12

    goto/16 :goto_78

    .line 184
    .end local v26    # "xLegendOffset":F
    :pswitch_2df
    const/16 v27, 0x0

    .line 186
    .local v27, "yLegendOffset":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Lcom/github/mikephil/charting/components/Legend;->getVerticalAlignment()Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;

    move-result-object v29

    sget-object v30, Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;->TOP:Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;

    move-object/from16 v0, v29

    move-object/from16 v1, v30

    if-eq v0, v1, :cond_305

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Lcom/github/mikephil/charting/components/Legend;->getVerticalAlignment()Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;

    move-result-object v29

    sget-object v30, Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;->BOTTOM:Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;

    move-object/from16 v0, v29

    move-object/from16 v1, v30

    if-ne v0, v1, :cond_78

    .line 192
    :cond_305
    invoke-virtual/range {p0 .. p0}, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->getRequiredLegendOffset()F

    move-result v28

    .line 194
    .local v28, "yOffset":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    iget v0, v0, Lcom/github/mikephil/charting/components/Legend;->mNeededHeight:F

    move/from16 v29, v0

    add-float v29, v29, v28

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getChartHeight()F

    move-result v30

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Lcom/github/mikephil/charting/components/Legend;->getMaxSizePercent()F

    move-result v31

    mul-float v30, v30, v31

    invoke-static/range {v29 .. v30}, Ljava/lang/Math;->min(FF)F

    move-result v27

    .line 197
    sget-object v29, Lcom/github/mikephil/charting/charts/PieRadarChartBase$2;->$SwitchMap$com$github$mikephil$charting$components$Legend$LegendVerticalAlignment:[I

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Lcom/github/mikephil/charting/components/Legend;->getVerticalAlignment()Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;->ordinal()I

    move-result v30

    aget v29, v29, v30

    packed-switch v29, :pswitch_data_36a

    goto/16 :goto_78

    .line 199
    :pswitch_348
    move/from16 v16, v27

    .line 200
    goto/16 :goto_78

    .line 202
    :pswitch_34c
    move/from16 v12, v27

    goto/16 :goto_78

    .line 113
    :pswitch_data_350
    .packed-switch 0x1
        :pswitch_165
        :pswitch_2df
    .end packed-switch

    .line 158
    :pswitch_data_358
    .packed-switch 0x1
        :pswitch_1bc
        :pswitch_274
        :pswitch_278
    .end packed-switch

    .line 168
    :pswitch_data_362
    .packed-switch 0x1
        :pswitch_28f
        :pswitch_2b7
    .end packed-switch

    .line 197
    :pswitch_data_36a
    .packed-switch 0x1
        :pswitch_348
        :pswitch_34c
    .end packed-switch
.end method

.method public computeScroll()V
    .registers 2

    .prologue
    .line 85
    .local p0, "this":Lcom/github/mikephil/charting/charts/PieRadarChartBase;, "Lcom/github/mikephil/charting/charts/PieRadarChartBase<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mChartTouchListener:Lcom/github/mikephil/charting/listener/ChartTouchListener;

    instance-of v0, v0, Lcom/github/mikephil/charting/listener/PieRadarChartTouchListener;

    if-eqz v0, :cond_d

    .line 86
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mChartTouchListener:Lcom/github/mikephil/charting/listener/ChartTouchListener;

    check-cast v0, Lcom/github/mikephil/charting/listener/PieRadarChartTouchListener;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/listener/PieRadarChartTouchListener;->computeScroll()V

    .line 87
    :cond_d
    return-void
.end method

.method public distanceToCenter(FF)F
    .registers 13
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/charts/PieRadarChartBase;, "Lcom/github/mikephil/charting/charts/PieRadarChartBase<TT;>;"
    const-wide/high16 v8, 0x4000000000000000L    # 2.0

    .line 300
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->getCenterOffsets()Landroid/graphics/PointF;

    move-result-object v0

    .line 302
    .local v0, "c":Landroid/graphics/PointF;
    const/4 v1, 0x0

    .line 304
    .local v1, "dist":F
    const/4 v2, 0x0

    .line 305
    .local v2, "xDist":F
    const/4 v3, 0x0

    .line 307
    .local v3, "yDist":F
    iget v4, v0, Landroid/graphics/PointF;->x:F

    cmpl-float v4, p1, v4

    if-lez v4, :cond_2e

    .line 308
    iget v4, v0, Landroid/graphics/PointF;->x:F

    sub-float v2, p1, v4

    .line 313
    :goto_13
    iget v4, v0, Landroid/graphics/PointF;->y:F

    cmpl-float v4, p2, v4

    if-lez v4, :cond_33

    .line 314
    iget v4, v0, Landroid/graphics/PointF;->y:F

    sub-float v3, p2, v4

    .line 320
    :goto_1d
    float-to-double v4, v2

    invoke-static {v4, v5, v8, v9}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v4

    float-to-double v6, v3

    invoke-static {v6, v7, v8, v9}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v6

    add-double/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v4

    double-to-float v1, v4

    .line 322
    return v1

    .line 310
    :cond_2e
    iget v4, v0, Landroid/graphics/PointF;->x:F

    sub-float v2, v4, p1

    goto :goto_13

    .line 316
    :cond_33
    iget v4, v0, Landroid/graphics/PointF;->y:F

    sub-float v3, v4, p2

    goto :goto_1d
.end method

.method public getAngleForPoint(FF)F
    .registers 17
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    .line 253
    .local p0, "this":Lcom/github/mikephil/charting/charts/PieRadarChartBase;, "Lcom/github/mikephil/charting/charts/PieRadarChartBase<TT;>;"
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->getCenterOffsets()Landroid/graphics/PointF;

    move-result-object v1

    .line 255
    .local v1, "c":Landroid/graphics/PointF;
    iget v10, v1, Landroid/graphics/PointF;->x:F

    sub-float v10, p1, v10

    float-to-double v6, v10

    .local v6, "tx":D
    iget v10, v1, Landroid/graphics/PointF;->y:F

    sub-float v10, p2, v10

    float-to-double v8, v10

    .line 256
    .local v8, "ty":D
    mul-double v10, v6, v6

    mul-double v12, v8, v8

    add-double/2addr v10, v12

    invoke-static {v10, v11}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v2

    .line 257
    .local v2, "length":D
    div-double v10, v8, v2

    invoke-static {v10, v11}, Ljava/lang/Math;->acos(D)D

    move-result-wide v4

    .line 259
    .local v4, "r":D
    invoke-static {v4, v5}, Ljava/lang/Math;->toDegrees(D)D

    move-result-wide v10

    double-to-float v0, v10

    .line 261
    .local v0, "angle":F
    iget v10, v1, Landroid/graphics/PointF;->x:F

    cmpl-float v10, p1, v10

    if-lez v10, :cond_2c

    .line 262
    const/high16 v10, 0x43b40000    # 360.0f

    sub-float v0, v10, v0

    .line 265
    :cond_2c
    const/high16 v10, 0x42b40000    # 90.0f

    add-float/2addr v0, v10

    .line 268
    const/high16 v10, 0x43b40000    # 360.0f

    cmpl-float v10, v0, v10

    if-lez v10, :cond_38

    .line 269
    const/high16 v10, 0x43b40000    # 360.0f

    sub-float/2addr v0, v10

    .line 271
    :cond_38
    return v0
.end method

.method public getDiameter()F
    .registers 4

    .prologue
    .line 402
    .local p0, "this":Lcom/github/mikephil/charting/charts/PieRadarChartBase;, "Lcom/github/mikephil/charting/charts/PieRadarChartBase<TT;>;"
    iget-object v1, p0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getContentRect()Landroid/graphics/RectF;

    move-result-object v0

    .line 403
    .local v0, "content":Landroid/graphics/RectF;
    iget v1, v0, Landroid/graphics/RectF;->left:F

    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->getExtraLeftOffset()F

    move-result v2

    add-float/2addr v1, v2

    iput v1, v0, Landroid/graphics/RectF;->left:F

    .line 404
    iget v1, v0, Landroid/graphics/RectF;->top:F

    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->getExtraTopOffset()F

    move-result v2

    add-float/2addr v1, v2

    iput v1, v0, Landroid/graphics/RectF;->top:F

    .line 405
    iget v1, v0, Landroid/graphics/RectF;->right:F

    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->getExtraRightOffset()F

    move-result v2

    sub-float/2addr v1, v2

    iput v1, v0, Landroid/graphics/RectF;->right:F

    .line 406
    iget v1, v0, Landroid/graphics/RectF;->bottom:F

    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->getExtraBottomOffset()F

    move-result v2

    sub-float/2addr v1, v2

    iput v1, v0, Landroid/graphics/RectF;->bottom:F

    .line 407
    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v1

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    move-result v1

    return v1
.end method

.method public abstract getIndexForAngle(F)I
.end method

.method public getMinOffset()F
    .registers 2

    .prologue
    .line 388
    .local p0, "this":Lcom/github/mikephil/charting/charts/PieRadarChartBase;, "Lcom/github/mikephil/charting/charts/PieRadarChartBase<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mMinOffset:F

    return v0
.end method

.method protected getPosition(Landroid/graphics/PointF;FF)Landroid/graphics/PointF;
    .registers 12
    .param p1, "center"    # Landroid/graphics/PointF;
    .param p2, "dist"    # F
    .param p3, "angle"    # F

    .prologue
    .line 285
    .local p0, "this":Lcom/github/mikephil/charting/charts/PieRadarChartBase;, "Lcom/github/mikephil/charting/charts/PieRadarChartBase<TT;>;"
    new-instance v0, Landroid/graphics/PointF;

    iget v1, p1, Landroid/graphics/PointF;->x:F

    float-to-double v1, v1

    float-to-double v3, p2

    float-to-double v5, p3

    invoke-static {v5, v6}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Math;->cos(D)D

    move-result-wide v5

    mul-double/2addr v3, v5

    add-double/2addr v1, v3

    double-to-float v1, v1

    iget v2, p1, Landroid/graphics/PointF;->y:F

    float-to-double v2, v2

    float-to-double v4, p2

    float-to-double v6, p3

    invoke-static {v6, v7}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Math;->sin(D)D

    move-result-wide v6

    mul-double/2addr v4, v6

    add-double/2addr v2, v4

    double-to-float v2, v2

    invoke-direct {v0, v1, v2}, Landroid/graphics/PointF;-><init>(FF)V

    .line 287
    .local v0, "p":Landroid/graphics/PointF;
    return-object v0
.end method

.method public abstract getRadius()F
.end method

.method public getRawRotationAngle()F
    .registers 2

    .prologue
    .line 354
    .local p0, "this":Lcom/github/mikephil/charting/charts/PieRadarChartBase;, "Lcom/github/mikephil/charting/charts/PieRadarChartBase<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mRawRotationAngle:F

    return v0
.end method

.method protected abstract getRequiredBaseOffset()F
.end method

.method protected abstract getRequiredLegendOffset()F
.end method

.method public getRotationAngle()F
    .registers 2

    .prologue
    .line 364
    .local p0, "this":Lcom/github/mikephil/charting/charts/PieRadarChartBase;, "Lcom/github/mikephil/charting/charts/PieRadarChartBase<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mRotationAngle:F

    return v0
.end method

.method public getSelectionDetailsAtIndex(I)Ljava/util/List;
    .registers 7
    .param p1, "xIndex"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List",
            "<",
            "Lcom/github/mikephil/charting/utils/SelectionDetail;",
            ">;"
        }
    .end annotation

    .prologue
    .line 454
    .local p0, "this":Lcom/github/mikephil/charting/charts/PieRadarChartBase;, "Lcom/github/mikephil/charting/charts/PieRadarChartBase<TT;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 456
    .local v2, "vals":Ljava/util/List;, "Ljava/util/List<Lcom/github/mikephil/charting/utils/SelectionDetail;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_6
    iget-object v4, p0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mData:Lcom/github/mikephil/charting/data/ChartData;

    invoke-virtual {v4}, Lcom/github/mikephil/charting/data/ChartData;->getDataSetCount()I

    move-result v4

    if-ge v1, v4, :cond_2a

    .line 458
    iget-object v4, p0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mData:Lcom/github/mikephil/charting/data/ChartData;

    invoke-virtual {v4, v1}, Lcom/github/mikephil/charting/data/ChartData;->getDataSetByIndex(I)Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    move-result-object v0

    .line 461
    .local v0, "dataSet":Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;, "Lcom/github/mikephil/charting/interfaces/datasets/IDataSet<*>;"
    invoke-interface {v0, p1}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getYValForXIndex(I)F

    move-result v3

    .line 462
    .local v3, "yVal":F
    invoke-static {v3}, Ljava/lang/Float;->isNaN(F)Z

    move-result v4

    if-eqz v4, :cond_21

    .line 456
    :goto_1e
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 465
    :cond_21
    new-instance v4, Lcom/github/mikephil/charting/utils/SelectionDetail;

    invoke-direct {v4, v3, v1, v0}, Lcom/github/mikephil/charting/utils/SelectionDetail;-><init>(FILcom/github/mikephil/charting/interfaces/datasets/IDataSet;)V

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1e

    .line 468
    .end local v0    # "dataSet":Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;, "Lcom/github/mikephil/charting/interfaces/datasets/IDataSet<*>;"
    .end local v3    # "yVal":F
    :cond_2a
    return-object v2
.end method

.method public getYChartMax()F
    .registers 2

    .prologue
    .line 435
    .local p0, "this":Lcom/github/mikephil/charting/charts/PieRadarChartBase;, "Lcom/github/mikephil/charting/charts/PieRadarChartBase<TT;>;"
    const/4 v0, 0x0

    return v0
.end method

.method public getYChartMin()F
    .registers 2

    .prologue
    .line 441
    .local p0, "this":Lcom/github/mikephil/charting/charts/PieRadarChartBase;, "Lcom/github/mikephil/charting/charts/PieRadarChartBase<TT;>;"
    const/4 v0, 0x0

    return v0
.end method

.method protected init()V
    .registers 2

    .prologue
    .line 63
    .local p0, "this":Lcom/github/mikephil/charting/charts/PieRadarChartBase;, "Lcom/github/mikephil/charting/charts/PieRadarChartBase<TT;>;"
    invoke-super {p0}, Lcom/github/mikephil/charting/charts/Chart;->init()V

    .line 65
    new-instance v0, Lcom/github/mikephil/charting/listener/PieRadarChartTouchListener;

    invoke-direct {v0, p0}, Lcom/github/mikephil/charting/listener/PieRadarChartTouchListener;-><init>(Lcom/github/mikephil/charting/charts/PieRadarChartBase;)V

    iput-object v0, p0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mChartTouchListener:Lcom/github/mikephil/charting/listener/ChartTouchListener;

    .line 66
    return-void
.end method

.method public isRotationEnabled()Z
    .registers 2

    .prologue
    .line 383
    .local p0, "this":Lcom/github/mikephil/charting/charts/PieRadarChartBase;, "Lcom/github/mikephil/charting/charts/PieRadarChartBase<TT;>;"
    iget-boolean v0, p0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mRotateEnabled:Z

    return v0
.end method

.method public notifyDataSetChanged()V
    .registers 3

    .prologue
    .line 91
    .local p0, "this":Lcom/github/mikephil/charting/charts/PieRadarChartBase;, "Lcom/github/mikephil/charting/charts/PieRadarChartBase<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mData:Lcom/github/mikephil/charting/data/ChartData;

    if-nez v0, :cond_5

    .line 100
    :goto_4
    return-void

    .line 94
    :cond_5
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->calcMinMax()V

    .line 96
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    if-eqz v0, :cond_13

    .line 97
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mLegendRenderer:Lcom/github/mikephil/charting/renderer/LegendRenderer;

    iget-object v1, p0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mData:Lcom/github/mikephil/charting/data/ChartData;

    invoke-virtual {v0, v1}, Lcom/github/mikephil/charting/renderer/LegendRenderer;->computeLegend(Lcom/github/mikephil/charting/data/ChartData;)V

    .line 99
    :cond_13
    invoke-virtual {p0}, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->calculateOffsets()V

    goto :goto_4
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 3
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 76
    .local p0, "this":Lcom/github/mikephil/charting/charts/PieRadarChartBase;, "Lcom/github/mikephil/charting/charts/PieRadarChartBase<TT;>;"
    iget-boolean v0, p0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mTouchEnabled:Z

    if-eqz v0, :cond_f

    iget-object v0, p0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mChartTouchListener:Lcom/github/mikephil/charting/listener/ChartTouchListener;

    if-eqz v0, :cond_f

    .line 77
    iget-object v0, p0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mChartTouchListener:Lcom/github/mikephil/charting/listener/ChartTouchListener;

    invoke-virtual {v0, p0, p1}, Lcom/github/mikephil/charting/listener/ChartTouchListener;->onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result v0

    .line 79
    :goto_e
    return v0

    :cond_f
    invoke-super {p0, p1}, Lcom/github/mikephil/charting/charts/Chart;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    goto :goto_e
.end method

.method public setMinOffset(F)V
    .registers 2
    .param p1, "minOffset"    # F

    .prologue
    .line 393
    .local p0, "this":Lcom/github/mikephil/charting/charts/PieRadarChartBase;, "Lcom/github/mikephil/charting/charts/PieRadarChartBase<TT;>;"
    iput p1, p0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mMinOffset:F

    .line 394
    return-void
.end method

.method public setRotationAngle(F)V
    .registers 3
    .param p1, "angle"    # F

    .prologue
    .line 341
    .local p0, "this":Lcom/github/mikephil/charting/charts/PieRadarChartBase;, "Lcom/github/mikephil/charting/charts/PieRadarChartBase<TT;>;"
    iput p1, p0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mRawRotationAngle:F

    .line 342
    iget v0, p0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mRawRotationAngle:F

    invoke-static {v0}, Lcom/github/mikephil/charting/utils/Utils;->getNormalizedAngle(F)F

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mRotationAngle:F

    .line 343
    return-void
.end method

.method public setRotationEnabled(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 374
    .local p0, "this":Lcom/github/mikephil/charting/charts/PieRadarChartBase;, "Lcom/github/mikephil/charting/charts/PieRadarChartBase<TT;>;"
    iput-boolean p1, p0, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->mRotateEnabled:Z

    .line 375
    return-void
.end method

.method public spin(IFFLcom/github/mikephil/charting/animation/Easing$EasingOption;)V
    .registers 9
    .param p1, "durationmillis"    # I
    .param p2, "fromangle"    # F
    .param p3, "toangle"    # F
    .param p4, "easing"    # Lcom/github/mikephil/charting/animation/Easing$EasingOption;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    .line 486
    .local p0, "this":Lcom/github/mikephil/charting/charts/PieRadarChartBase;, "Lcom/github/mikephil/charting/charts/PieRadarChartBase<TT;>;"
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xb

    if-ge v1, v2, :cond_7

    .line 504
    :goto_6
    return-void

    .line 489
    :cond_7
    invoke-virtual {p0, p2}, Lcom/github/mikephil/charting/charts/PieRadarChartBase;->setRotationAngle(F)V

    .line 491
    const-string v1, "rotationAngle"

    const/4 v2, 0x2

    new-array v2, v2, [F

    const/4 v3, 0x0

    aput p2, v2, v3

    const/4 v3, 0x1

    aput p3, v2, v3

    invoke-static {p0, v1, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    .line 493
    .local v0, "spinAnimator":Landroid/animation/ObjectAnimator;
    int-to-long v1, p1

    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 494
    invoke-static {p4}, Lcom/github/mikephil/charting/animation/Easing;->getEasingFunctionFromOption(Lcom/github/mikephil/charting/animation/Easing$EasingOption;)Lcom/github/mikephil/charting/animation/EasingFunction;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 496
    new-instance v1, Lcom/github/mikephil/charting/charts/PieRadarChartBase$1;

    invoke-direct {v1, p0}, Lcom/github/mikephil/charting/charts/PieRadarChartBase$1;-><init>(Lcom/github/mikephil/charting/charts/PieRadarChartBase;)V

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 503
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    goto :goto_6
.end method
