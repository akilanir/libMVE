.class public Lcom/jjoe64/graphview/GridLabelRenderer;
.super Ljava/lang/Object;
.source "GridLabelRenderer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/jjoe64/graphview/GridLabelRenderer$GridStyle;,
        Lcom/jjoe64/graphview/GridLabelRenderer$Styles;
    }
.end annotation


# instance fields
.field private final mGraphView:Lcom/jjoe64/graphview/GraphView;

.field private mHorizontalAxisTitle:Ljava/lang/String;

.field private mIsAdjusted:Z

.field private mLabelFormatter:Lcom/jjoe64/graphview/LabelFormatter;

.field private mLabelHorizontalHeight:Ljava/lang/Integer;

.field private mLabelHorizontalHeightFixed:Z

.field private mLabelHorizontalWidth:Ljava/lang/Integer;

.field private mLabelVerticalHeight:Ljava/lang/Integer;

.field private mLabelVerticalSecondScaleHeight:Ljava/lang/Integer;

.field private mLabelVerticalSecondScaleWidth:Ljava/lang/Integer;

.field private mLabelVerticalWidth:Ljava/lang/Integer;

.field private mLabelVerticalWidthFixed:Z

.field private mNumHorizontalLabels:I

.field private mNumVerticalLabels:I

.field private mPaintAxisTitle:Landroid/graphics/Paint;

.field private mPaintLabel:Landroid/graphics/Paint;

.field private mPaintLine:Landroid/graphics/Paint;

.field private mStepsHorizontal:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation
.end field

.field private mStepsVertical:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation
.end field

.field private mStepsVerticalSecondScale:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation
.end field

.field protected mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

.field private mVerticalAxisTitle:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/jjoe64/graphview/GraphView;)V
    .registers 4
    .param p1, "graphView"    # Lcom/jjoe64/graphview/GraphView;

    .prologue
    const/4 v1, 0x5

    .line 279
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 280
    iput-object p1, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    .line 281
    new-instance v0, Lcom/jjoe64/graphview/DefaultLabelFormatter;

    invoke-direct {v0}, Lcom/jjoe64/graphview/DefaultLabelFormatter;-><init>()V

    invoke-virtual {p0, v0}, Lcom/jjoe64/graphview/GridLabelRenderer;->setLabelFormatter(Lcom/jjoe64/graphview/LabelFormatter;)V

    .line 282
    new-instance v0, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    invoke-direct {v0, p0}, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;-><init>(Lcom/jjoe64/graphview/GridLabelRenderer;)V

    iput-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    .line 283
    invoke-virtual {p0}, Lcom/jjoe64/graphview/GridLabelRenderer;->resetStyles()V

    .line 284
    iput v1, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mNumVerticalLabels:I

    .line 285
    iput v1, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mNumHorizontalLabels:I

    .line 286
    return-void
.end method


# virtual methods
.method protected adjust()V
    .registers 3

    .prologue
    .line 737
    invoke-virtual {p0}, Lcom/jjoe64/graphview/GridLabelRenderer;->adjustVertical()Z

    move-result v0

    iput-boolean v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mIsAdjusted:Z

    .line 738
    iget-boolean v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mIsAdjusted:Z

    invoke-virtual {p0}, Lcom/jjoe64/graphview/GridLabelRenderer;->adjustVerticalSecondScale()Z

    move-result v1

    and-int/2addr v0, v1

    iput-boolean v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mIsAdjusted:Z

    .line 739
    iget-boolean v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mIsAdjusted:Z

    invoke-virtual {p0}, Lcom/jjoe64/graphview/GridLabelRenderer;->adjustHorizontal()Z

    move-result v1

    and-int/2addr v0, v1

    iput-boolean v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mIsAdjusted:Z

    .line 740
    return-void
.end method

.method protected adjustHorizontal()Z
    .registers 35

    .prologue
    .line 591
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mLabelVerticalWidth:Ljava/lang/Integer;

    move-object/from16 v30, v0

    if-nez v30, :cond_b

    .line 592
    const/16 v30, 0x0

    .line 727
    :goto_a
    return v30

    .line 595
    :cond_b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Lcom/jjoe64/graphview/GraphView;->getViewport()Lcom/jjoe64/graphview/Viewport;

    move-result-object v30

    const/16 v31, 0x0

    invoke-virtual/range {v30 .. v31}, Lcom/jjoe64/graphview/Viewport;->getMinX(Z)D

    move-result-wide v10

    .line 596
    .local v10, "minX":D
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Lcom/jjoe64/graphview/GraphView;->getViewport()Lcom/jjoe64/graphview/Viewport;

    move-result-object v30

    const/16 v31, 0x0

    invoke-virtual/range {v30 .. v31}, Lcom/jjoe64/graphview/Viewport;->getMaxX(Z)D

    move-result-wide v8

    .line 597
    .local v8, "maxX":D
    cmpl-double v30, v10, v8

    if-nez v30, :cond_32

    const/16 v30, 0x0

    goto :goto_a

    .line 600
    :cond_32
    move-object/from16 v0, p0

    iget v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mNumHorizontalLabels:I

    move/from16 v17, v0

    .line 605
    .local v17, "numHorizontalLabels":I
    const/16 v24, 0x0

    .line 606
    .local v24, "scalingOffset":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Lcom/jjoe64/graphview/GraphView;->getViewport()Lcom/jjoe64/graphview/Viewport;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Lcom/jjoe64/graphview/Viewport;->isXAxisBoundsManual()Z

    move-result v30

    if-eqz v30, :cond_1fa

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Lcom/jjoe64/graphview/GraphView;->getViewport()Lcom/jjoe64/graphview/Viewport;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Lcom/jjoe64/graphview/Viewport;->getXAxisBoundsStatus()Lcom/jjoe64/graphview/Viewport$AxisBoundsStatus;

    move-result-object v30

    sget-object v31, Lcom/jjoe64/graphview/Viewport$AxisBoundsStatus;->READJUST_AFTER_SCALE:Lcom/jjoe64/graphview/Viewport$AxisBoundsStatus;

    move-object/from16 v0, v30

    move-object/from16 v1, v31

    if-eq v0, v1, :cond_1fa

    .line 608
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Lcom/jjoe64/graphview/GraphView;->getViewport()Lcom/jjoe64/graphview/Viewport;

    move-result-object v30

    move-object/from16 v0, v30

    iget-boolean v0, v0, Lcom/jjoe64/graphview/Viewport;->mScalingActive:Z

    move/from16 v30, v0

    if-eqz v30, :cond_9c

    .line 609
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Lcom/jjoe64/graphview/GraphView;->getViewport()Lcom/jjoe64/graphview/Viewport;

    move-result-object v30

    move-object/from16 v0, v30

    iget v0, v0, Lcom/jjoe64/graphview/Viewport;->mScalingBeginLeft:F

    move/from16 v30, v0

    move/from16 v0, v30

    float-to-double v10, v0

    .line 610
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Lcom/jjoe64/graphview/GraphView;->getViewport()Lcom/jjoe64/graphview/Viewport;

    move-result-object v30

    move-object/from16 v0, v30

    iget v0, v0, Lcom/jjoe64/graphview/Viewport;->mScalingBeginWidth:F

    move/from16 v30, v0

    move/from16 v0, v30

    float-to-double v0, v0

    move-wide/from16 v30, v0

    add-double v8, v10, v30

    .line 616
    :cond_9c
    move-wide v14, v10

    .line 617
    .local v14, "newMinX":D
    sub-double v21, v8, v14

    .line 618
    .local v21, "rangeX":D
    add-int/lit8 v30, v17, -0x1

    move/from16 v0, v30

    int-to-double v0, v0

    move-wide/from16 v30, v0

    div-double v4, v21, v30

    .line 676
    .end local v21    # "rangeX":D
    .local v4, "exactSteps":D
    :goto_a8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStepsHorizontal:Ljava/util/Map;

    move-object/from16 v30, v0

    if-eqz v30, :cond_2ef

    .line 677
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStepsHorizontal:Ljava/util/Map;

    move-object/from16 v30, v0

    invoke-interface/range {v30 .. v30}, Ljava/util/Map;->clear()V

    .line 681
    :goto_b9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Lcom/jjoe64/graphview/GraphView;->getGraphContentWidth()I

    move-result v29

    .line 683
    .local v29, "width":I
    const/16 v25, 0x0

    .line 684
    .local v25, "scrolled":F
    const/16 v26, 0x0

    .line 686
    .local v26, "scrolledPixels":F
    move-wide/from16 v27, v14

    .line 687
    .local v27, "v":D
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Lcom/jjoe64/graphview/GraphView;->getGraphContentLeft()I

    move-result v19

    .line 688
    .local v19, "p":I
    add-int/lit8 v30, v17, -0x1

    div-int v30, v29, v30

    move/from16 v0, v30

    int-to-float v0, v0

    move/from16 v20, v0

    .line 690
    .local v20, "pixelStep":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Lcom/jjoe64/graphview/GraphView;->getViewport()Lcom/jjoe64/graphview/Viewport;

    move-result-object v30

    move-object/from16 v0, v30

    iget-boolean v0, v0, Lcom/jjoe64/graphview/Viewport;->mScalingActive:Z

    move/from16 v30, v0

    if-eqz v30, :cond_14d

    .line 691
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Lcom/jjoe64/graphview/GraphView;->getViewport()Lcom/jjoe64/graphview/Viewport;

    move-result-object v30

    move-object/from16 v0, v30

    iget v0, v0, Lcom/jjoe64/graphview/Viewport;->mScalingBeginWidth:F

    move/from16 v30, v0

    add-int/lit8 v31, v17, -0x1

    move/from16 v0, v31

    int-to-float v0, v0

    move/from16 v31, v0

    div-float v18, v30, v31

    .line 692
    .local v18, "oldStep":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Lcom/jjoe64/graphview/GraphView;->getViewport()Lcom/jjoe64/graphview/Viewport;

    move-result-object v30

    move-object/from16 v0, v30

    iget-object v0, v0, Lcom/jjoe64/graphview/Viewport;->mCurrentViewport:Landroid/graphics/RectF;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Landroid/graphics/RectF;->width()F

    move-result v30

    add-float v30, v30, v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Lcom/jjoe64/graphview/GraphView;->getViewport()Lcom/jjoe64/graphview/Viewport;

    move-result-object v31

    move-object/from16 v0, v31

    iget v0, v0, Lcom/jjoe64/graphview/Viewport;->mScalingBeginWidth:F

    move/from16 v31, v0

    add-float v31, v31, v18

    div-float v6, v30, v31

    .line 693
    .local v6, "factor":F
    const/high16 v30, 0x3f800000    # 1.0f

    div-float v30, v30, v6

    mul-float v20, v20, v30

    .line 699
    move/from16 v0, v29

    int-to-float v0, v0

    move/from16 v30, v0

    const/high16 v31, 0x3f800000    # 1.0f

    mul-float v30, v30, v31

    div-float v16, v30, v6

    .line 700
    .local v16, "newWidth":F
    move/from16 v0, v29

    int-to-float v0, v0

    move/from16 v30, v0

    sub-float v30, v16, v30

    const/high16 v31, -0x41000000    # -0.5f

    mul-float v26, v30, v31

    .line 705
    .end local v6    # "factor":F
    .end local v16    # "newWidth":F
    .end local v18    # "oldStep":F
    :cond_14d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Lcom/jjoe64/graphview/GraphView;->getViewport()Lcom/jjoe64/graphview/Viewport;

    move-result-object v30

    move-object/from16 v0, v30

    iget v0, v0, Lcom/jjoe64/graphview/Viewport;->mScrollingReferenceX:F

    move/from16 v30, v0

    invoke-static/range {v30 .. v30}, Ljava/lang/Float;->isNaN(F)Z

    move-result v30

    if-nez v30, :cond_1b0

    .line 706
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Lcom/jjoe64/graphview/GraphView;->getViewport()Lcom/jjoe64/graphview/Viewport;

    move-result-object v30

    move-object/from16 v0, v30

    iget v0, v0, Lcom/jjoe64/graphview/Viewport;->mScrollingReferenceX:F

    move/from16 v30, v0

    double-to-float v0, v14

    move/from16 v31, v0

    sub-float v25, v30, v31

    .line 707
    double-to-float v0, v4

    move/from16 v30, v0

    div-float v30, v20, v30

    mul-float v30, v30, v25

    add-float v26, v26, v30

    .line 709
    move/from16 v0, v25

    float-to-double v0, v0

    move-wide/from16 v30, v0

    const-wide/16 v32, 0x0

    sub-double v32, v32, v4

    cmpg-double v30, v30, v32

    if-gez v30, :cond_300

    .line 710
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Lcom/jjoe64/graphview/GraphView;->getViewport()Lcom/jjoe64/graphview/Viewport;

    move-result-object v30

    move-object/from16 v0, v30

    iget v0, v0, Lcom/jjoe64/graphview/Viewport;->mScrollingReferenceX:F

    move/from16 v31, v0

    move/from16 v0, v31

    float-to-double v0, v0

    move-wide/from16 v31, v0

    add-double v31, v31, v4

    move-wide/from16 v0, v31

    double-to-float v0, v0

    move/from16 v31, v0

    move/from16 v0, v31

    move-object/from16 v1, v30

    iput v0, v1, Lcom/jjoe64/graphview/Viewport;->mScrollingReferenceX:F

    .line 715
    :cond_1b0
    :goto_1b0
    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v30, v0

    add-float v30, v30, v26

    move/from16 v0, v30

    float-to-int v0, v0

    move/from16 v19, v0

    .line 716
    move/from16 v0, v25

    float-to-double v0, v0

    move-wide/from16 v30, v0

    add-double v27, v27, v30

    .line 718
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_1c4
    move/from16 v0, v17

    if-ge v7, v0, :cond_32d

    .line 720
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Lcom/jjoe64/graphview/GraphView;->getGraphContentLeft()I

    move-result v30

    move/from16 v0, v19

    move/from16 v1, v30

    if-lt v0, v1, :cond_1e9

    .line 721
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStepsHorizontal:Ljava/util/Map;

    move-object/from16 v30, v0

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v31

    invoke-static/range {v27 .. v28}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v32

    invoke-interface/range {v30 .. v32}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 723
    :cond_1e9
    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v30, v0

    add-float v30, v30, v20

    move/from16 v0, v30

    float-to-int v0, v0

    move/from16 v19, v0

    .line 724
    add-double v27, v27, v4

    .line 718
    add-int/lit8 v7, v7, 0x1

    goto :goto_1c4

    .line 621
    .end local v4    # "exactSteps":D
    .end local v7    # "i":I
    .end local v14    # "newMinX":D
    .end local v19    # "p":I
    .end local v20    # "pixelStep":F
    .end local v25    # "scrolled":F
    .end local v26    # "scrolledPixels":F
    .end local v27    # "v":D
    .end local v29    # "width":I
    :cond_1fa
    const/4 v2, 0x1

    .line 622
    .local v2, "adjusting":Z
    move-wide v14, v10

    .line 623
    .restart local v14    # "newMinX":D
    const-wide/16 v4, 0x0

    .line 624
    .restart local v4    # "exactSteps":D
    :goto_1fe
    if-eqz v2, :cond_28e

    .line 625
    sub-double v21, v8, v14

    .line 626
    .restart local v21    # "rangeX":D
    add-int/lit8 v30, v17, -0x1

    move/from16 v0, v30

    int-to-double v0, v0

    move-wide/from16 v30, v0

    div-double v4, v21, v30

    .line 628
    const/16 v23, 0x1

    .line 629
    .local v23, "roundAlwaysUp":Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Lcom/jjoe64/graphview/GraphView;->getViewport()Lcom/jjoe64/graphview/Viewport;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Lcom/jjoe64/graphview/Viewport;->getXAxisBoundsStatus()Lcom/jjoe64/graphview/Viewport$AxisBoundsStatus;

    move-result-object v30

    sget-object v31, Lcom/jjoe64/graphview/Viewport$AxisBoundsStatus;->READJUST_AFTER_SCALE:Lcom/jjoe64/graphview/Viewport$AxisBoundsStatus;

    move-object/from16 v0, v30

    move-object/from16 v1, v31

    if-ne v0, v1, :cond_24d

    .line 631
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Lcom/jjoe64/graphview/GraphView;->getViewport()Lcom/jjoe64/graphview/Viewport;

    move-result-object v30

    move-object/from16 v0, v30

    iget-object v0, v0, Lcom/jjoe64/graphview/Viewport;->mCurrentViewport:Landroid/graphics/RectF;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Landroid/graphics/RectF;->width()F

    move-result v30

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Lcom/jjoe64/graphview/GraphView;->getViewport()Lcom/jjoe64/graphview/Viewport;

    move-result-object v31

    move-object/from16 v0, v31

    iget v0, v0, Lcom/jjoe64/graphview/Viewport;->mScalingBeginWidth:F

    move/from16 v31, v0

    cmpg-float v30, v30, v31

    if-gez v30, :cond_24d

    .line 632
    const/16 v23, 0x0

    .line 635
    :cond_24d
    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v4, v5, v1}, Lcom/jjoe64/graphview/GridLabelRenderer;->humanRound(DZ)D

    move-result-wide v4

    .line 639
    const/4 v3, 0x0

    .line 640
    .local v3, "count":I
    const-wide/16 v30, 0x0

    cmpl-double v30, v14, v30

    if-ltz v30, :cond_273

    .line 642
    :goto_25c
    sub-double v30, v14, v4

    const-wide/16 v32, 0x0

    cmpl-double v30, v30, v32

    if-ltz v30, :cond_268

    .line 643
    sub-double/2addr v14, v4

    .line 644
    add-int/lit8 v3, v3, 0x1

    goto :goto_25c

    .line 646
    :cond_268
    int-to-double v0, v3

    move-wide/from16 v30, v0

    mul-double v14, v4, v30

    .line 659
    :goto_26d
    cmpl-double v30, v14, v10

    if-nez v30, :cond_28b

    .line 660
    const/4 v2, 0x0

    goto :goto_1fe

    .line 649
    :cond_273
    add-int/lit8 v3, v3, 0x1

    .line 650
    :goto_275
    add-double v30, v14, v4

    const-wide/16 v32, 0x0

    cmpg-double v30, v30, v32

    if-gez v30, :cond_281

    .line 651
    add-double/2addr v14, v4

    .line 652
    add-int/lit8 v3, v3, 0x1

    goto :goto_275

    .line 654
    :cond_281
    int-to-double v0, v3

    move-wide/from16 v30, v0

    mul-double v30, v30, v4

    const-wide/high16 v32, -0x4010000000000000L    # -1.0

    mul-double v14, v30, v32

    goto :goto_26d

    .line 662
    :cond_28b
    move-wide v10, v14

    goto/16 :goto_1fe

    .line 666
    .end local v3    # "count":I
    .end local v21    # "rangeX":D
    .end local v23    # "roundAlwaysUp":Z
    :cond_28e
    add-int/lit8 v30, v17, -0x1

    move/from16 v0, v30

    int-to-double v0, v0

    move-wide/from16 v30, v0

    mul-double v30, v30, v4

    add-double v12, v14, v30

    .line 667
    .local v12, "newMaxX":D
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Lcom/jjoe64/graphview/GraphView;->getViewport()Lcom/jjoe64/graphview/Viewport;

    move-result-object v30

    move-object/from16 v0, v30

    invoke-virtual {v0, v14, v15}, Lcom/jjoe64/graphview/Viewport;->setMinX(D)V

    .line 668
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Lcom/jjoe64/graphview/GraphView;->getViewport()Lcom/jjoe64/graphview/Viewport;

    move-result-object v30

    move-object/from16 v0, v30

    invoke-virtual {v0, v12, v13}, Lcom/jjoe64/graphview/Viewport;->setMaxX(D)V

    .line 669
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Lcom/jjoe64/graphview/GraphView;->getViewport()Lcom/jjoe64/graphview/Viewport;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Lcom/jjoe64/graphview/Viewport;->getXAxisBoundsStatus()Lcom/jjoe64/graphview/Viewport$AxisBoundsStatus;

    move-result-object v30

    sget-object v31, Lcom/jjoe64/graphview/Viewport$AxisBoundsStatus;->READJUST_AFTER_SCALE:Lcom/jjoe64/graphview/Viewport$AxisBoundsStatus;

    move-object/from16 v0, v30

    move-object/from16 v1, v31

    if-ne v0, v1, :cond_2de

    .line 670
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Lcom/jjoe64/graphview/GraphView;->getViewport()Lcom/jjoe64/graphview/Viewport;

    move-result-object v30

    sget-object v31, Lcom/jjoe64/graphview/Viewport$AxisBoundsStatus;->FIX:Lcom/jjoe64/graphview/Viewport$AxisBoundsStatus;

    invoke-virtual/range {v30 .. v31}, Lcom/jjoe64/graphview/Viewport;->setXAxisBoundsStatus(Lcom/jjoe64/graphview/Viewport$AxisBoundsStatus;)V

    goto/16 :goto_a8

    .line 672
    :cond_2de
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Lcom/jjoe64/graphview/GraphView;->getViewport()Lcom/jjoe64/graphview/Viewport;

    move-result-object v30

    sget-object v31, Lcom/jjoe64/graphview/Viewport$AxisBoundsStatus;->AUTO_ADJUSTED:Lcom/jjoe64/graphview/Viewport$AxisBoundsStatus;

    invoke-virtual/range {v30 .. v31}, Lcom/jjoe64/graphview/Viewport;->setXAxisBoundsStatus(Lcom/jjoe64/graphview/Viewport$AxisBoundsStatus;)V

    goto/16 :goto_a8

    .line 679
    .end local v2    # "adjusting":Z
    .end local v12    # "newMaxX":D
    :cond_2ef
    new-instance v30, Ljava/util/LinkedHashMap;

    move-object/from16 v0, v30

    move/from16 v1, v17

    invoke-direct {v0, v1}, Ljava/util/LinkedHashMap;-><init>(I)V

    move-object/from16 v0, v30

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jjoe64/graphview/GridLabelRenderer;->mStepsHorizontal:Ljava/util/Map;

    goto/16 :goto_b9

    .line 711
    .restart local v19    # "p":I
    .restart local v20    # "pixelStep":F
    .restart local v25    # "scrolled":F
    .restart local v26    # "scrolledPixels":F
    .restart local v27    # "v":D
    .restart local v29    # "width":I
    :cond_300
    move/from16 v0, v25

    float-to-double v0, v0

    move-wide/from16 v30, v0

    cmpl-double v30, v30, v4

    if-lez v30, :cond_1b0

    .line 712
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Lcom/jjoe64/graphview/GraphView;->getViewport()Lcom/jjoe64/graphview/Viewport;

    move-result-object v30

    move-object/from16 v0, v30

    iget v0, v0, Lcom/jjoe64/graphview/Viewport;->mScrollingReferenceX:F

    move/from16 v31, v0

    move/from16 v0, v31

    float-to-double v0, v0

    move-wide/from16 v31, v0

    sub-double v31, v31, v4

    move-wide/from16 v0, v31

    double-to-float v0, v0

    move/from16 v31, v0

    move/from16 v0, v31

    move-object/from16 v1, v30

    iput v0, v1, Lcom/jjoe64/graphview/Viewport;->mScrollingReferenceX:F

    goto/16 :goto_1b0

    .line 727
    .restart local v7    # "i":I
    :cond_32d
    const/16 v30, 0x1

    goto/16 :goto_a
.end method

.method protected adjustVertical()Z
    .registers 28

    .prologue
    .line 496
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mLabelHorizontalHeight:Ljava/lang/Integer;

    move-object/from16 v23, v0

    if-nez v23, :cond_b

    .line 497
    const/16 v23, 0x0

    .line 580
    :goto_a
    return v23

    .line 500
    :cond_b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/jjoe64/graphview/GraphView;->getViewport()Lcom/jjoe64/graphview/Viewport;

    move-result-object v23

    const/16 v24, 0x0

    invoke-virtual/range {v23 .. v24}, Lcom/jjoe64/graphview/Viewport;->getMinY(Z)D

    move-result-wide v10

    .line 501
    .local v10, "minY":D
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/jjoe64/graphview/GraphView;->getViewport()Lcom/jjoe64/graphview/Viewport;

    move-result-object v23

    const/16 v24, 0x0

    invoke-virtual/range {v23 .. v24}, Lcom/jjoe64/graphview/Viewport;->getMaxY(Z)D

    move-result-wide v8

    .line 503
    .local v8, "maxY":D
    cmpl-double v23, v10, v8

    if-nez v23, :cond_32

    .line 504
    const/16 v23, 0x0

    goto :goto_a

    .line 508
    :cond_32
    move-object/from16 v0, p0

    iget v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mNumVerticalLabels:I

    move/from16 v16, v0

    .line 513
    .local v16, "numVerticalLabels":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/jjoe64/graphview/GraphView;->getViewport()Lcom/jjoe64/graphview/Viewport;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Lcom/jjoe64/graphview/Viewport;->isYAxisBoundsManual()Z

    move-result v23

    if-eqz v23, :cond_e4

    .line 514
    move-wide v14, v10

    .line 515
    .local v14, "newMinY":D
    sub-double v19, v8, v14

    .line 516
    .local v19, "rangeY":D
    add-int/lit8 v23, v16, -0x1

    move/from16 v0, v23

    int-to-double v0, v0

    move-wide/from16 v23, v0

    div-double v4, v19, v23

    .line 557
    .end local v19    # "rangeY":D
    .local v4, "exactSteps":D
    :cond_54
    add-int/lit8 v23, v16, -0x1

    move/from16 v0, v23

    int-to-double v0, v0

    move-wide/from16 v23, v0

    mul-double v23, v23, v4

    add-double v12, v14, v23

    .line 558
    .local v12, "newMaxY":D
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/jjoe64/graphview/GraphView;->getViewport()Lcom/jjoe64/graphview/Viewport;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v0, v14, v15}, Lcom/jjoe64/graphview/Viewport;->setMinY(D)V

    .line 559
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/jjoe64/graphview/GraphView;->getViewport()Lcom/jjoe64/graphview/Viewport;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v0, v12, v13}, Lcom/jjoe64/graphview/Viewport;->setMaxY(D)V

    .line 561
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/jjoe64/graphview/GraphView;->getViewport()Lcom/jjoe64/graphview/Viewport;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Lcom/jjoe64/graphview/Viewport;->isYAxisBoundsManual()Z

    move-result v23

    if-nez v23, :cond_9c

    .line 562
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/jjoe64/graphview/GraphView;->getViewport()Lcom/jjoe64/graphview/Viewport;

    move-result-object v23

    sget-object v24, Lcom/jjoe64/graphview/Viewport$AxisBoundsStatus;->AUTO_ADJUSTED:Lcom/jjoe64/graphview/Viewport$AxisBoundsStatus;

    invoke-virtual/range {v23 .. v24}, Lcom/jjoe64/graphview/Viewport;->setYAxisBoundsStatus(Lcom/jjoe64/graphview/Viewport$AxisBoundsStatus;)V

    .line 565
    :cond_9c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStepsVertical:Ljava/util/Map;

    move-object/from16 v23, v0

    if-eqz v23, :cond_137

    .line 566
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStepsVertical:Ljava/util/Map;

    move-object/from16 v23, v0

    invoke-interface/range {v23 .. v23}, Ljava/util/Map;->clear()V

    .line 570
    :goto_ad
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/jjoe64/graphview/GraphView;->getGraphContentHeight()I

    move-result v6

    .line 571
    .local v6, "height":I
    move-wide/from16 v21, v12

    .line 572
    .local v21, "v":D
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/jjoe64/graphview/GraphView;->getGraphContentTop()I

    move-result v17

    .line 573
    .local v17, "p":I
    add-int/lit8 v23, v16, -0x1

    div-int v18, v6, v23

    .line 574
    .local v18, "pixelStep":I
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_c8
    move/from16 v0, v16

    if-ge v7, v0, :cond_148

    .line 575
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStepsVertical:Ljava/util/Map;

    move-object/from16 v23, v0

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v24

    invoke-static/range {v21 .. v22}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v25

    invoke-interface/range {v23 .. v25}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 576
    add-int v17, v17, v18

    .line 577
    sub-double v21, v21, v4

    .line 574
    add-int/lit8 v7, v7, 0x1

    goto :goto_c8

    .line 519
    .end local v4    # "exactSteps":D
    .end local v6    # "height":I
    .end local v7    # "i":I
    .end local v12    # "newMaxY":D
    .end local v14    # "newMinY":D
    .end local v17    # "p":I
    .end local v18    # "pixelStep":I
    .end local v21    # "v":D
    :cond_e4
    const/4 v2, 0x1

    .line 520
    .local v2, "adjusting":Z
    move-wide v14, v10

    .line 521
    .restart local v14    # "newMinY":D
    const-wide/16 v4, 0x0

    .line 522
    .restart local v4    # "exactSteps":D
    :goto_e8
    if-eqz v2, :cond_54

    .line 523
    sub-double v19, v8, v14

    .line 524
    .restart local v19    # "rangeY":D
    add-int/lit8 v23, v16, -0x1

    move/from16 v0, v23

    int-to-double v0, v0

    move-wide/from16 v23, v0

    div-double v4, v19, v23

    .line 525
    const/16 v23, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v4, v5, v1}, Lcom/jjoe64/graphview/GridLabelRenderer;->humanRound(DZ)D

    move-result-wide v4

    .line 529
    const/4 v3, 0x0

    .line 530
    .local v3, "count":I
    const-wide/16 v23, 0x0

    cmpl-double v23, v14, v23

    if-ltz v23, :cond_11d

    .line 532
    :goto_106
    sub-double v23, v14, v4

    const-wide/16 v25, 0x0

    cmpl-double v23, v23, v25

    if-ltz v23, :cond_112

    .line 533
    sub-double/2addr v14, v4

    .line 534
    add-int/lit8 v3, v3, 0x1

    goto :goto_106

    .line 536
    :cond_112
    int-to-double v0, v3

    move-wide/from16 v23, v0

    mul-double v14, v4, v23

    .line 549
    :goto_117
    cmpl-double v23, v14, v10

    if-nez v23, :cond_135

    .line 550
    const/4 v2, 0x0

    goto :goto_e8

    .line 539
    :cond_11d
    add-int/lit8 v3, v3, 0x1

    .line 540
    :goto_11f
    add-double v23, v14, v4

    const-wide/16 v25, 0x0

    cmpg-double v23, v23, v25

    if-gez v23, :cond_12b

    .line 541
    add-double/2addr v14, v4

    .line 542
    add-int/lit8 v3, v3, 0x1

    goto :goto_11f

    .line 544
    :cond_12b
    int-to-double v0, v3

    move-wide/from16 v23, v0

    mul-double v23, v23, v4

    const-wide/high16 v25, -0x4010000000000000L    # -1.0

    mul-double v14, v23, v25

    goto :goto_117

    .line 552
    :cond_135
    move-wide v10, v14

    goto :goto_e8

    .line 568
    .end local v2    # "adjusting":Z
    .end local v3    # "count":I
    .end local v19    # "rangeY":D
    .restart local v12    # "newMaxY":D
    :cond_137
    new-instance v23, Ljava/util/LinkedHashMap;

    move-object/from16 v0, v23

    move/from16 v1, v16

    invoke-direct {v0, v1}, Ljava/util/LinkedHashMap;-><init>(I)V

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jjoe64/graphview/GridLabelRenderer;->mStepsVertical:Ljava/util/Map;

    goto/16 :goto_ad

    .line 580
    .restart local v6    # "height":I
    .restart local v7    # "i":I
    .restart local v17    # "p":I
    .restart local v18    # "pixelStep":I
    .restart local v21    # "v":D
    :cond_148
    const/16 v23, 0x1

    goto/16 :goto_a
.end method

.method protected adjustVerticalSecondScale()Z
    .registers 25

    .prologue
    .line 435
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mLabelHorizontalHeight:Ljava/lang/Integer;

    move-object/from16 v21, v0

    if-nez v21, :cond_b

    .line 436
    const/16 v21, 0x0

    .line 485
    :goto_a
    return v21

    .line 438
    :cond_b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/jjoe64/graphview/GraphView;->mSecondScale:Lcom/jjoe64/graphview/SecondScale;

    move-object/from16 v21, v0

    if-nez v21, :cond_1c

    .line 439
    const/16 v21, 0x1

    goto :goto_a

    .line 442
    :cond_1c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/jjoe64/graphview/GraphView;->mSecondScale:Lcom/jjoe64/graphview/SecondScale;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/jjoe64/graphview/SecondScale;->getMinY()D

    move-result-wide v8

    .line 443
    .local v8, "minY":D
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/jjoe64/graphview/GraphView;->mSecondScale:Lcom/jjoe64/graphview/SecondScale;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/jjoe64/graphview/SecondScale;->getMaxY()D

    move-result-wide v6

    .line 446
    .local v6, "maxY":D
    move-object/from16 v0, p0

    iget v14, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mNumVerticalLabels:I

    .line 451
    .local v14, "numVerticalLabels":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/jjoe64/graphview/GraphView;->mSecondScale:Lcom/jjoe64/graphview/SecondScale;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/jjoe64/graphview/SecondScale;->isYAxisBoundsManual()Z

    move-result v21

    if-eqz v21, :cond_af

    .line 452
    move-wide v12, v8

    .line 453
    .local v12, "newMinY":D
    sub-double v17, v6, v12

    .line 454
    .local v17, "rangeY":D
    add-int/lit8 v21, v14, -0x1

    move/from16 v0, v21

    int-to-double v0, v0

    move-wide/from16 v21, v0

    div-double v2, v17, v21

    .line 460
    .local v2, "exactSteps":D
    add-int/lit8 v21, v14, -0x1

    move/from16 v0, v21

    int-to-double v0, v0

    move-wide/from16 v21, v0

    mul-double v21, v21, v2

    add-double v10, v12, v21

    .line 470
    .local v10, "newMaxY":D
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStepsVerticalSecondScale:Ljava/util/Map;

    move-object/from16 v21, v0

    if-eqz v21, :cond_b7

    .line 471
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStepsVerticalSecondScale:Ljava/util/Map;

    move-object/from16 v21, v0

    invoke-interface/range {v21 .. v21}, Ljava/util/Map;->clear()V

    .line 475
    :goto_7a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/jjoe64/graphview/GraphView;->getGraphContentHeight()I

    move-result v4

    .line 476
    .local v4, "height":I
    move-wide/from16 v19, v10

    .line 477
    .local v19, "v":D
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/jjoe64/graphview/GraphView;->getGraphContentTop()I

    move-result v15

    .line 478
    .local v15, "p":I
    add-int/lit8 v21, v14, -0x1

    div-int v16, v4, v21

    .line 479
    .local v16, "pixelStep":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_95
    if-ge v5, v14, :cond_c5

    .line 480
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStepsVerticalSecondScale:Ljava/util/Map;

    move-object/from16 v21, v0

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v22

    invoke-static/range {v19 .. v20}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v23

    invoke-interface/range {v21 .. v23}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 481
    add-int v15, v15, v16

    .line 482
    sub-double v19, v19, v2

    .line 479
    add-int/lit8 v5, v5, 0x1

    goto :goto_95

    .line 457
    .end local v2    # "exactSteps":D
    .end local v4    # "height":I
    .end local v5    # "i":I
    .end local v10    # "newMaxY":D
    .end local v12    # "newMinY":D
    .end local v15    # "p":I
    .end local v16    # "pixelStep":I
    .end local v17    # "rangeY":D
    .end local v19    # "v":D
    :cond_af
    new-instance v21, Ljava/lang/IllegalStateException;

    const-string v22, "Not yet implemented"

    invoke-direct/range {v21 .. v22}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v21

    .line 473
    .restart local v2    # "exactSteps":D
    .restart local v10    # "newMaxY":D
    .restart local v12    # "newMinY":D
    .restart local v17    # "rangeY":D
    :cond_b7
    new-instance v21, Ljava/util/LinkedHashMap;

    move-object/from16 v0, v21

    invoke-direct {v0, v14}, Ljava/util/LinkedHashMap;-><init>(I)V

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/jjoe64/graphview/GridLabelRenderer;->mStepsVerticalSecondScale:Ljava/util/Map;

    goto :goto_7a

    .line 485
    .restart local v4    # "height":I
    .restart local v5    # "i":I
    .restart local v15    # "p":I
    .restart local v16    # "pixelStep":I
    .restart local v19    # "v":D
    :cond_c5
    const/16 v21, 0x1

    goto/16 :goto_a
.end method

.method protected calcLabelHorizontalSize(Landroid/graphics/Canvas;)V
    .registers 13
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v6, 0x0

    .line 810
    iget-object v7, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    invoke-virtual {v7}, Lcom/jjoe64/graphview/GraphView;->getViewport()Lcom/jjoe64/graphview/Viewport;

    move-result-object v7

    invoke-virtual {v7, v6}, Lcom/jjoe64/graphview/Viewport;->getMaxX(Z)D

    move-result-wide v7

    iget-object v9, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    invoke-virtual {v9}, Lcom/jjoe64/graphview/GraphView;->getViewport()Lcom/jjoe64/graphview/Viewport;

    move-result-object v9

    invoke-virtual {v9, v6}, Lcom/jjoe64/graphview/Viewport;->getMinX(Z)D

    move-result-wide v9

    sub-double/2addr v7, v9

    const-wide v9, 0x3fe90e5604189375L    # 0.783

    mul-double/2addr v7, v9

    iget-object v9, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    invoke-virtual {v9}, Lcom/jjoe64/graphview/GraphView;->getViewport()Lcom/jjoe64/graphview/Viewport;

    move-result-object v9

    invoke-virtual {v9, v6}, Lcom/jjoe64/graphview/Viewport;->getMinX(Z)D

    move-result-wide v9

    add-double v3, v7, v9

    .line 811
    .local v3, "testX":D
    iget-object v7, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mLabelFormatter:Lcom/jjoe64/graphview/LabelFormatter;

    const/4 v8, 0x1

    invoke-interface {v7, v3, v4, v8}, Lcom/jjoe64/graphview/LabelFormatter;->formatLabel(DZ)Ljava/lang/String;

    move-result-object v2

    .line 812
    .local v2, "testLabel":Ljava/lang/String;
    if-nez v2, :cond_33

    .line 813
    const-string v2, ""

    .line 815
    :cond_33
    new-instance v5, Landroid/graphics/Rect;

    invoke-direct {v5}, Landroid/graphics/Rect;-><init>()V

    .line 816
    .local v5, "textBounds":Landroid/graphics/Rect;
    iget-object v7, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mPaintLabel:Landroid/graphics/Paint;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v8

    invoke-virtual {v7, v2, v6, v8, v5}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 817
    invoke-virtual {v5}, Landroid/graphics/Rect;->width()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    iput-object v7, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mLabelHorizontalWidth:Ljava/lang/Integer;

    .line 819
    iget-boolean v7, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mLabelHorizontalHeightFixed:Z

    if-nez v7, :cond_8f

    .line 820
    invoke-virtual {v5}, Landroid/graphics/Rect;->height()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    iput-object v7, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mLabelHorizontalHeight:Ljava/lang/Integer;

    .line 823
    const/4 v1, 0x1

    .line 824
    .local v1, "lines":I
    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v7

    array-length v8, v7

    :goto_5f
    if-ge v6, v8, :cond_6c

    aget-byte v0, v7, v6

    .line 825
    .local v0, "c":B
    const/16 v9, 0xa

    if-ne v0, v9, :cond_69

    add-int/lit8 v1, v1, 0x1

    .line 824
    :cond_69
    add-int/lit8 v6, v6, 0x1

    goto :goto_5f

    .line 827
    .end local v0    # "c":B
    :cond_6c
    iget-object v6, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mLabelHorizontalHeight:Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    mul-int/2addr v6, v1

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    iput-object v6, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mLabelHorizontalHeight:Ljava/lang/Integer;

    .line 829
    iget-object v6, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mLabelHorizontalHeight:Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    int-to-float v6, v6

    iget-object v7, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iget v7, v7, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->textSize:F

    invoke-static {v6, v7}, Ljava/lang/Math;->max(FF)F

    move-result v6

    float-to-int v6, v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    iput-object v6, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mLabelHorizontalHeight:Ljava/lang/Integer;

    .line 833
    .end local v1    # "lines":I
    :cond_8f
    iget-object v6, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mLabelHorizontalHeight:Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    iget-object v7, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iget v7, v7, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->labelsSpace:I

    add-int/2addr v6, v7

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    iput-object v6, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mLabelHorizontalHeight:Ljava/lang/Integer;

    .line 834
    return-void
.end method

.method protected calcLabelVerticalSecondScaleSize(Landroid/graphics/Canvas;)V
    .registers 13
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v6, 0x0

    .line 782
    iget-object v7, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    iget-object v7, v7, Lcom/jjoe64/graphview/GraphView;->mSecondScale:Lcom/jjoe64/graphview/SecondScale;

    if-nez v7, :cond_14

    .line 783
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    iput-object v7, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mLabelVerticalSecondScaleWidth:Ljava/lang/Integer;

    .line 784
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    iput-object v6, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mLabelVerticalSecondScaleHeight:Ljava/lang/Integer;

    .line 802
    :goto_13
    return-void

    .line 789
    :cond_14
    iget-object v7, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    iget-object v7, v7, Lcom/jjoe64/graphview/GraphView;->mSecondScale:Lcom/jjoe64/graphview/SecondScale;

    invoke-virtual {v7}, Lcom/jjoe64/graphview/SecondScale;->getMaxY()D

    move-result-wide v7

    iget-object v9, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    iget-object v9, v9, Lcom/jjoe64/graphview/GraphView;->mSecondScale:Lcom/jjoe64/graphview/SecondScale;

    invoke-virtual {v9}, Lcom/jjoe64/graphview/SecondScale;->getMinY()D

    move-result-wide v9

    sub-double/2addr v7, v9

    const-wide v9, 0x3fe90e5604189375L    # 0.783

    mul-double/2addr v7, v9

    iget-object v9, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    iget-object v9, v9, Lcom/jjoe64/graphview/GraphView;->mSecondScale:Lcom/jjoe64/graphview/SecondScale;

    invoke-virtual {v9}, Lcom/jjoe64/graphview/SecondScale;->getMinY()D

    move-result-wide v9

    add-double v3, v7, v9

    .line 790
    .local v3, "testY":D
    iget-object v7, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    iget-object v7, v7, Lcom/jjoe64/graphview/GraphView;->mSecondScale:Lcom/jjoe64/graphview/SecondScale;

    invoke-virtual {v7}, Lcom/jjoe64/graphview/SecondScale;->getLabelFormatter()Lcom/jjoe64/graphview/LabelFormatter;

    move-result-object v7

    invoke-interface {v7, v3, v4, v6}, Lcom/jjoe64/graphview/LabelFormatter;->formatLabel(DZ)Ljava/lang/String;

    move-result-object v2

    .line 791
    .local v2, "testLabel":Ljava/lang/String;
    new-instance v5, Landroid/graphics/Rect;

    invoke-direct {v5}, Landroid/graphics/Rect;-><init>()V

    .line 792
    .local v5, "textBounds":Landroid/graphics/Rect;
    iget-object v7, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mPaintLabel:Landroid/graphics/Paint;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v8

    invoke-virtual {v7, v2, v6, v8, v5}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 793
    invoke-virtual {v5}, Landroid/graphics/Rect;->width()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    iput-object v7, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mLabelVerticalSecondScaleWidth:Ljava/lang/Integer;

    .line 794
    invoke-virtual {v5}, Landroid/graphics/Rect;->height()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    iput-object v7, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mLabelVerticalSecondScaleHeight:Ljava/lang/Integer;

    .line 797
    const/4 v1, 0x1

    .line 798
    .local v1, "lines":I
    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v7

    array-length v8, v7

    :goto_69
    if-ge v6, v8, :cond_76

    aget-byte v0, v7, v6

    .line 799
    .local v0, "c":B
    const/16 v9, 0xa

    if-ne v0, v9, :cond_73

    add-int/lit8 v1, v1, 0x1

    .line 798
    :cond_73
    add-int/lit8 v6, v6, 0x1

    goto :goto_69

    .line 801
    .end local v0    # "c":B
    :cond_76
    iget-object v6, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mLabelVerticalSecondScaleHeight:Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    mul-int/2addr v6, v1

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    iput-object v6, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mLabelVerticalSecondScaleHeight:Ljava/lang/Integer;

    goto :goto_13
.end method

.method protected calcLabelVerticalSize(Landroid/graphics/Canvas;)V
    .registers 10
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v4, 0x0

    .line 748
    iget-object v5, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mLabelFormatter:Lcom/jjoe64/graphview/LabelFormatter;

    iget-object v6, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    invoke-virtual {v6}, Lcom/jjoe64/graphview/GraphView;->getViewport()Lcom/jjoe64/graphview/Viewport;

    move-result-object v6

    invoke-virtual {v6, v4}, Lcom/jjoe64/graphview/Viewport;->getMaxY(Z)D

    move-result-wide v6

    invoke-interface {v5, v6, v7, v4}, Lcom/jjoe64/graphview/LabelFormatter;->formatLabel(DZ)Ljava/lang/String;

    move-result-object v2

    .line 749
    .local v2, "testLabel":Ljava/lang/String;
    if-nez v2, :cond_15

    const-string v2, ""

    .line 751
    :cond_15
    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    .line 752
    .local v3, "textBounds":Landroid/graphics/Rect;
    iget-object v5, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mPaintLabel:Landroid/graphics/Paint;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v6

    invoke-virtual {v5, v2, v4, v6, v3}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 753
    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    iput-object v5, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mLabelVerticalWidth:Ljava/lang/Integer;

    .line 754
    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    iput-object v5, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mLabelVerticalHeight:Ljava/lang/Integer;

    .line 756
    iget-object v5, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mLabelFormatter:Lcom/jjoe64/graphview/LabelFormatter;

    iget-object v6, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    invoke-virtual {v6}, Lcom/jjoe64/graphview/GraphView;->getViewport()Lcom/jjoe64/graphview/Viewport;

    move-result-object v6

    invoke-virtual {v6, v4}, Lcom/jjoe64/graphview/Viewport;->getMinY(Z)D

    move-result-wide v6

    invoke-interface {v5, v6, v7, v4}, Lcom/jjoe64/graphview/LabelFormatter;->formatLabel(DZ)Ljava/lang/String;

    move-result-object v2

    .line 757
    if-nez v2, :cond_4b

    const-string v2, ""

    .line 759
    :cond_4b
    iget-object v5, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mPaintLabel:Landroid/graphics/Paint;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v6

    invoke-virtual {v5, v2, v4, v6, v3}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 760
    iget-object v5, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mLabelVerticalWidth:Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    move-result v6

    invoke-static {v5, v6}, Ljava/lang/Math;->max(II)I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    iput-object v5, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mLabelVerticalWidth:Ljava/lang/Integer;

    .line 763
    iget-object v5, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mLabelVerticalWidth:Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    add-int/lit8 v5, v5, 0x6

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    iput-object v5, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mLabelVerticalWidth:Ljava/lang/Integer;

    .line 766
    iget-object v5, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mLabelVerticalWidth:Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    iget-object v6, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iget v6, v6, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->labelsSpace:I

    add-int/2addr v5, v6

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    iput-object v5, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mLabelVerticalWidth:Ljava/lang/Integer;

    .line 769
    const/4 v1, 0x1

    .line 770
    .local v1, "lines":I
    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    array-length v6, v5

    :goto_8d
    if-ge v4, v6, :cond_9a

    aget-byte v0, v5, v4

    .line 771
    .local v0, "c":B
    const/16 v7, 0xa

    if-ne v0, v7, :cond_97

    add-int/lit8 v1, v1, 0x1

    .line 770
    :cond_97
    add-int/lit8 v4, v4, 0x1

    goto :goto_8d

    .line 773
    .end local v0    # "c":B
    :cond_9a
    iget-object v4, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mLabelVerticalHeight:Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    mul-int/2addr v4, v1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    iput-object v4, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mLabelVerticalHeight:Ljava/lang/Integer;

    .line 774
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .registers 4
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 842
    const/4 v0, 0x0

    .line 843
    .local v0, "labelSizeChanged":Z
    iget-object v1, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mLabelHorizontalWidth:Ljava/lang/Integer;

    if-nez v1, :cond_9

    .line 844
    invoke-virtual {p0, p1}, Lcom/jjoe64/graphview/GridLabelRenderer;->calcLabelHorizontalSize(Landroid/graphics/Canvas;)V

    .line 845
    const/4 v0, 0x1

    .line 847
    :cond_9
    iget-object v1, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mLabelVerticalWidth:Ljava/lang/Integer;

    if-nez v1, :cond_11

    .line 848
    invoke-virtual {p0, p1}, Lcom/jjoe64/graphview/GridLabelRenderer;->calcLabelVerticalSize(Landroid/graphics/Canvas;)V

    .line 849
    const/4 v0, 0x1

    .line 851
    :cond_11
    iget-object v1, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mLabelVerticalSecondScaleWidth:Ljava/lang/Integer;

    if-nez v1, :cond_19

    .line 852
    invoke-virtual {p0, p1}, Lcom/jjoe64/graphview/GridLabelRenderer;->calcLabelVerticalSecondScaleSize(Landroid/graphics/Canvas;)V

    .line 853
    const/4 v0, 0x1

    .line 855
    :cond_19
    if-eqz v0, :cond_21

    .line 857
    iget-object v1, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    invoke-static {v1}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    .line 876
    :cond_20
    :goto_20
    return-void

    .line 861
    :cond_21
    iget-boolean v1, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mIsAdjusted:Z

    if-nez v1, :cond_28

    .line 862
    invoke-virtual {p0}, Lcom/jjoe64/graphview/GridLabelRenderer;->adjust()V

    .line 865
    :cond_28
    iget-boolean v1, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mIsAdjusted:Z

    if-eqz v1, :cond_20

    .line 866
    invoke-virtual {p0, p1}, Lcom/jjoe64/graphview/GridLabelRenderer;->drawVerticalSteps(Landroid/graphics/Canvas;)V

    .line 867
    invoke-virtual {p0, p1}, Lcom/jjoe64/graphview/GridLabelRenderer;->drawVerticalStepsSecondScale(Landroid/graphics/Canvas;)V

    .line 868
    invoke-virtual {p0, p1}, Lcom/jjoe64/graphview/GridLabelRenderer;->drawHorizontalSteps(Landroid/graphics/Canvas;)V

    .line 874
    invoke-virtual {p0, p1}, Lcom/jjoe64/graphview/GridLabelRenderer;->drawHorizontalAxisTitle(Landroid/graphics/Canvas;)V

    .line 875
    invoke-virtual {p0, p1}, Lcom/jjoe64/graphview/GridLabelRenderer;->drawVerticalAxisTitle(Landroid/graphics/Canvas;)V

    goto :goto_20
.end method

.method protected drawHorizontalAxisTitle(Landroid/graphics/Canvas;)V
    .registers 6
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 884
    iget-object v2, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mHorizontalAxisTitle:Ljava/lang/String;

    if-eqz v2, :cond_36

    iget-object v2, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mHorizontalAxisTitle:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_36

    .line 885
    iget-object v2, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mPaintAxisTitle:Landroid/graphics/Paint;

    invoke-virtual {p0}, Lcom/jjoe64/graphview/GridLabelRenderer;->getHorizontalAxisTitleColor()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 886
    iget-object v2, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mPaintAxisTitle:Landroid/graphics/Paint;

    invoke-virtual {p0}, Lcom/jjoe64/graphview/GridLabelRenderer;->getHorizontalAxisTitleTextSize()F

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 887
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    int-to-float v0, v2

    .line 888
    .local v0, "x":F
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v2

    iget-object v3, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iget v3, v3, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->padding:I

    sub-int/2addr v2, v3

    int-to-float v1, v2

    .line 889
    .local v1, "y":F
    iget-object v2, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mHorizontalAxisTitle:Ljava/lang/String;

    iget-object v3, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mPaintAxisTitle:Landroid/graphics/Paint;

    invoke-virtual {p1, v2, v0, v1, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 891
    .end local v0    # "x":F
    .end local v1    # "y":F
    :cond_36
    return-void
.end method

.method protected drawHorizontalSteps(Landroid/graphics/Canvas;)V
    .registers 15
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 943
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mPaintLabel:Landroid/graphics/Paint;

    invoke-virtual {p0}, Lcom/jjoe64/graphview/GridLabelRenderer;->getHorizontalLabelsColor()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 944
    const/4 v7, 0x0

    .line 945
    .local v7, "i":I
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStepsHorizontal:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_14
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_104

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map$Entry;

    .line 947
    .local v6, "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/lang/Double;>;"
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iget-boolean v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->highlightZeroLines:Z

    if-eqz v0, :cond_3d

    .line 948
    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmpl-double v0, v0, v2

    if-nez v0, :cond_f8

    .line 949
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mPaintLine:Landroid/graphics/Paint;

    const/high16 v1, 0x40a00000    # 5.0f

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 954
    :cond_3d
    :goto_3d
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iget-object v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->gridStyle:Lcom/jjoe64/graphview/GridLabelRenderer$GridStyle;

    invoke-virtual {v0}, Lcom/jjoe64/graphview/GridLabelRenderer$GridStyle;->drawVertical()Z

    move-result v0

    if-eqz v0, :cond_78

    .line 955
    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    int-to-float v1, v0

    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    invoke-virtual {v0}, Lcom/jjoe64/graphview/GraphView;->getGraphContentTop()I

    move-result v0

    int-to-float v2, v0

    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    int-to-float v3, v0

    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    invoke-virtual {v0}, Lcom/jjoe64/graphview/GraphView;->getGraphContentTop()I

    move-result v0

    iget-object v4, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    invoke-virtual {v4}, Lcom/jjoe64/graphview/GraphView;->getGraphContentHeight()I

    move-result v4

    add-int/2addr v0, v4

    int-to-float v4, v0

    iget-object v5, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mPaintLine:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 959
    :cond_78
    invoke-virtual {p0}, Lcom/jjoe64/graphview/GridLabelRenderer;->isHorizontalLabelsVisible()Z

    move-result v0

    if-eqz v0, :cond_100

    .line 960
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mPaintLabel:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 961
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStepsHorizontal:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-ne v7, v0, :cond_96

    .line 962
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mPaintLabel:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Align;->RIGHT:Landroid/graphics/Paint$Align;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 963
    :cond_96
    if-nez v7, :cond_9f

    .line 964
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mPaintLabel:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 967
    :cond_9f
    iget-object v1, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mLabelFormatter:Lcom/jjoe64/graphview/LabelFormatter;

    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    const/4 v0, 0x1

    invoke-interface {v1, v2, v3, v0}, Lcom/jjoe64/graphview/LabelFormatter;->formatLabel(DZ)Ljava/lang/String;

    move-result-object v8

    .line 968
    .local v8, "label":Ljava/lang/String;
    if-nez v8, :cond_b4

    .line 969
    const-string v8, ""

    .line 971
    :cond_b4
    const-string v0, "\n"

    invoke-virtual {v8, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v10

    .line 972
    .local v10, "lines":[Ljava/lang/String;
    const/4 v9, 0x0

    .local v9, "li":I
    :goto_bb
    array-length v0, v10

    if-ge v9, v0, :cond_100

    .line 974
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v0

    iget-object v1, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iget v1, v1, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->padding:I

    sub-int/2addr v0, v1

    invoke-virtual {p0}, Lcom/jjoe64/graphview/GridLabelRenderer;->getHorizontalAxisTitleHeight()I

    move-result v1

    sub-int/2addr v0, v1

    int-to-float v0, v0

    array-length v1, v10

    sub-int/2addr v1, v9

    add-int/lit8 v1, v1, -0x1

    int-to-float v1, v1

    invoke-virtual {p0}, Lcom/jjoe64/graphview/GridLabelRenderer;->getTextSize()F

    move-result v2

    mul-float/2addr v1, v2

    const v2, 0x3f8ccccd    # 1.1f

    mul-float/2addr v1, v2

    sub-float/2addr v0, v1

    iget-object v1, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iget v1, v1, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->labelsSpace:I

    int-to-float v1, v1

    add-float v11, v0, v1

    .line 975
    .local v11, "y":F
    aget-object v1, v10, v9

    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    int-to-float v0, v0

    iget-object v2, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mPaintLabel:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v0, v11, v2}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 972
    add-int/lit8 v9, v9, 0x1

    goto :goto_bb

    .line 951
    .end local v8    # "label":Ljava/lang/String;
    .end local v9    # "li":I
    .end local v10    # "lines":[Ljava/lang/String;
    .end local v11    # "y":F
    :cond_f8
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mPaintLine:Landroid/graphics/Paint;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    goto/16 :goto_3d

    .line 978
    :cond_100
    add-int/lit8 v7, v7, 0x1

    .line 979
    goto/16 :goto_14

    .line 980
    .end local v6    # "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/lang/Double;>;"
    :cond_104
    return-void
.end method

.method protected drawVerticalAxisTitle(Landroid/graphics/Canvas;)V
    .registers 6
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 899
    iget-object v2, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mVerticalAxisTitle:Ljava/lang/String;

    if-eqz v2, :cond_3c

    iget-object v2, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mVerticalAxisTitle:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_3c

    .line 900
    iget-object v2, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mPaintAxisTitle:Landroid/graphics/Paint;

    invoke-virtual {p0}, Lcom/jjoe64/graphview/GridLabelRenderer;->getVerticalAxisTitleColor()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 901
    iget-object v2, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mPaintAxisTitle:Landroid/graphics/Paint;

    invoke-virtual {p0}, Lcom/jjoe64/graphview/GridLabelRenderer;->getVerticalAxisTitleTextSize()F

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 902
    invoke-virtual {p0}, Lcom/jjoe64/graphview/GridLabelRenderer;->getVerticalAxisTitleWidth()I

    move-result v2

    int-to-float v0, v2

    .line 903
    .local v0, "x":F
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    int-to-float v1, v2

    .line 904
    .local v1, "y":F
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 905
    const/high16 v2, -0x3d4c0000    # -90.0f

    invoke-virtual {p1, v2, v0, v1}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 906
    iget-object v2, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mVerticalAxisTitle:Ljava/lang/String;

    iget-object v3, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mPaintAxisTitle:Landroid/graphics/Paint;

    invoke-virtual {p1, v2, v0, v1, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 907
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 909
    .end local v0    # "x":F
    .end local v1    # "y":F
    :cond_3c
    return-void
.end method

.method protected drawVerticalSteps(Landroid/graphics/Canvas;)V
    .registers 18
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 1027
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    invoke-virtual {v1}, Lcom/jjoe64/graphview/GraphView;->getGraphContentLeft()I

    move-result v1

    int-to-float v2, v1

    .line 1028
    .local v2, "startLeft":F
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mPaintLabel:Landroid/graphics/Paint;

    invoke-virtual/range {p0 .. p0}, Lcom/jjoe64/graphview/GridLabelRenderer;->getVerticalLabelsColor()I

    move-result v3

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 1029
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mPaintLabel:Landroid/graphics/Paint;

    invoke-virtual/range {p0 .. p0}, Lcom/jjoe64/graphview/GridLabelRenderer;->getVerticalLabelsAlign()Landroid/graphics/Paint$Align;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 1030
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStepsVertical:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :cond_2b
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_128

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Map$Entry;

    .line 1032
    .local v7, "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/lang/Double;>;"
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iget-boolean v1, v1, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->highlightZeroLines:Z

    if-eqz v1, :cond_58

    .line 1033
    invoke-interface {v7}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Double;

    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v3

    const-wide/16 v5, 0x0

    cmpl-double v1, v3, v5

    if-nez v1, :cond_113

    .line 1034
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mPaintLine:Landroid/graphics/Paint;

    const/high16 v3, 0x40a00000    # 5.0f

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 1039
    :cond_58
    :goto_58
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iget-object v1, v1, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->gridStyle:Lcom/jjoe64/graphview/GridLabelRenderer$GridStyle;

    invoke-virtual {v1}, Lcom/jjoe64/graphview/GridLabelRenderer$GridStyle;->drawHorizontal()Z

    move-result v1

    if-eqz v1, :cond_8e

    .line 1040
    invoke-interface {v7}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    int-to-float v3, v1

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    invoke-virtual {v1}, Lcom/jjoe64/graphview/GraphView;->getGraphContentWidth()I

    move-result v1

    int-to-float v1, v1

    add-float v4, v2, v1

    invoke-interface {v7}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    int-to-float v5, v1

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mPaintLine:Landroid/graphics/Paint;

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 1044
    :cond_8e
    invoke-virtual/range {p0 .. p0}, Lcom/jjoe64/graphview/GridLabelRenderer;->isVerticalLabelsVisible()Z

    move-result v1

    if-eqz v1, :cond_2b

    .line 1045
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mLabelVerticalWidth:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v10

    .line 1046
    .local v10, "labelsWidth":I
    const/4 v9, 0x0

    .line 1047
    .local v9, "labelsOffset":I
    invoke-virtual/range {p0 .. p0}, Lcom/jjoe64/graphview/GridLabelRenderer;->getVerticalLabelsAlign()Landroid/graphics/Paint$Align;

    move-result-object v1

    sget-object v3, Landroid/graphics/Paint$Align;->RIGHT:Landroid/graphics/Paint$Align;

    if-ne v1, v3, :cond_11d

    .line 1048
    move v9, v10

    .line 1049
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iget v1, v1, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->labelsSpace:I

    sub-int/2addr v9, v1

    .line 1053
    :cond_ad
    :goto_ad
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iget v1, v1, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->padding:I

    invoke-virtual/range {p0 .. p0}, Lcom/jjoe64/graphview/GridLabelRenderer;->getVerticalAxisTitleWidth()I

    move-result v3

    add-int/2addr v1, v3

    add-int/2addr v9, v1

    .line 1055
    invoke-interface {v7}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    int-to-float v13, v1

    .line 1057
    .local v13, "y":F
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mLabelFormatter:Lcom/jjoe64/graphview/LabelFormatter;

    invoke-interface {v7}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Double;

    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v4

    const/4 v1, 0x0

    invoke-interface {v3, v4, v5, v1}, Lcom/jjoe64/graphview/LabelFormatter;->formatLabel(DZ)Ljava/lang/String;

    move-result-object v8

    .line 1058
    .local v8, "label":Ljava/lang/String;
    if-nez v8, :cond_db

    .line 1059
    const-string v8, ""

    .line 1061
    :cond_db
    const-string v1, "\n"

    invoke-virtual {v8, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v12

    .line 1062
    .local v12, "lines":[Ljava/lang/String;
    array-length v1, v12

    int-to-float v1, v1

    invoke-virtual/range {p0 .. p0}, Lcom/jjoe64/graphview/GridLabelRenderer;->getTextSize()F

    move-result v3

    mul-float/2addr v1, v3

    const v3, 0x3f8ccccd    # 1.1f

    mul-float/2addr v1, v3

    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr v1, v3

    add-float/2addr v13, v1

    .line 1063
    const/4 v11, 0x0

    .local v11, "li":I
    :goto_f1
    array-length v1, v12

    if-ge v11, v1, :cond_2b

    .line 1065
    array-length v1, v12

    sub-int/2addr v1, v11

    add-int/lit8 v1, v1, -0x1

    int-to-float v1, v1

    invoke-virtual/range {p0 .. p0}, Lcom/jjoe64/graphview/GridLabelRenderer;->getTextSize()F

    move-result v3

    mul-float/2addr v1, v3

    const v3, 0x3f8ccccd    # 1.1f

    mul-float/2addr v1, v3

    sub-float v14, v13, v1

    .line 1066
    .local v14, "y2":F
    aget-object v1, v12, v11

    int-to-float v3, v9

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mPaintLabel:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v1, v3, v14, v4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 1063
    add-int/lit8 v11, v11, 0x1

    goto :goto_f1

    .line 1036
    .end local v8    # "label":Ljava/lang/String;
    .end local v9    # "labelsOffset":I
    .end local v10    # "labelsWidth":I
    .end local v11    # "li":I
    .end local v12    # "lines":[Ljava/lang/String;
    .end local v13    # "y":F
    .end local v14    # "y2":F
    :cond_113
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/jjoe64/graphview/GridLabelRenderer;->mPaintLine:Landroid/graphics/Paint;

    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    goto/16 :goto_58

    .line 1050
    .restart local v9    # "labelsOffset":I
    .restart local v10    # "labelsWidth":I
    :cond_11d
    invoke-virtual/range {p0 .. p0}, Lcom/jjoe64/graphview/GridLabelRenderer;->getVerticalLabelsAlign()Landroid/graphics/Paint$Align;

    move-result-object v1

    sget-object v3, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    if-ne v1, v3, :cond_ad

    .line 1051
    div-int/lit8 v9, v10, 0x2

    goto :goto_ad

    .line 1070
    .end local v7    # "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/lang/Double;>;"
    .end local v9    # "labelsOffset":I
    .end local v10    # "labelsWidth":I
    :cond_128
    return-void
.end method

.method protected drawVerticalStepsSecondScale(Landroid/graphics/Canvas;)V
    .registers 16
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const v13, 0x3f8ccccd    # 1.1f

    .line 989
    iget-object v8, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    iget-object v8, v8, Lcom/jjoe64/graphview/GraphView;->mSecondScale:Lcom/jjoe64/graphview/SecondScale;

    if-nez v8, :cond_a

    .line 1017
    :cond_9
    return-void

    .line 994
    :cond_a
    iget-object v8, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    invoke-virtual {v8}, Lcom/jjoe64/graphview/GraphView;->getGraphContentLeft()I

    move-result v8

    iget-object v9, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    invoke-virtual {v9}, Lcom/jjoe64/graphview/GraphView;->getGraphContentWidth()I

    move-result v9

    add-int/2addr v8, v9

    int-to-float v5, v8

    .line 995
    .local v5, "startLeft":F
    iget-object v8, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mPaintLabel:Landroid/graphics/Paint;

    invoke-virtual {p0}, Lcom/jjoe64/graphview/GridLabelRenderer;->getVerticalLabelsSecondScaleColor()I

    move-result v9

    invoke-virtual {v8, v9}, Landroid/graphics/Paint;->setColor(I)V

    .line 996
    iget-object v8, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mPaintLabel:Landroid/graphics/Paint;

    invoke-virtual {p0}, Lcom/jjoe64/graphview/GridLabelRenderer;->getVerticalLabelsSecondScaleAlign()Landroid/graphics/Paint$Align;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 997
    iget-object v8, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStepsVerticalSecondScale:Ljava/util/Map;

    invoke-interface {v8}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_34
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_9

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 999
    .local v0, "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/lang/Double;>;"
    iget-object v8, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mLabelVerticalSecondScaleWidth:Ljava/lang/Integer;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 1000
    .local v2, "labelsWidth":I
    float-to-int v1, v5

    .line 1001
    .local v1, "labelsOffset":I
    invoke-virtual {p0}, Lcom/jjoe64/graphview/GridLabelRenderer;->getVerticalLabelsSecondScaleAlign()Landroid/graphics/Paint$Align;

    move-result-object v8

    sget-object v10, Landroid/graphics/Paint$Align;->RIGHT:Landroid/graphics/Paint$Align;

    if-ne v8, v10, :cond_9e

    .line 1002
    add-int/2addr v1, v2

    .line 1007
    :cond_50
    :goto_50
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Integer;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    int-to-float v6, v8

    .line 1009
    .local v6, "y":F
    iget-object v8, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    iget-object v8, v8, Lcom/jjoe64/graphview/GraphView;->mSecondScale:Lcom/jjoe64/graphview/SecondScale;

    iget-object v10, v8, Lcom/jjoe64/graphview/SecondScale;->mLabelFormatter:Lcom/jjoe64/graphview/LabelFormatter;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Double;

    invoke-virtual {v8}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v11

    const/4 v8, 0x0

    invoke-interface {v10, v11, v12, v8}, Lcom/jjoe64/graphview/LabelFormatter;->formatLabel(DZ)Ljava/lang/String;

    move-result-object v8

    const-string v10, "\n"

    invoke-virtual {v8, v10}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 1010
    .local v4, "lines":[Ljava/lang/String;
    array-length v8, v4

    int-to-float v8, v8

    invoke-virtual {p0}, Lcom/jjoe64/graphview/GridLabelRenderer;->getTextSize()F

    move-result v10

    mul-float/2addr v8, v10

    mul-float/2addr v8, v13

    const/high16 v10, 0x40000000    # 2.0f

    div-float/2addr v8, v10

    add-float/2addr v6, v8

    .line 1011
    const/4 v3, 0x0

    .local v3, "li":I
    :goto_83
    array-length v8, v4

    if-ge v3, v8, :cond_34

    .line 1013
    array-length v8, v4

    sub-int/2addr v8, v3

    add-int/lit8 v8, v8, -0x1

    int-to-float v8, v8

    invoke-virtual {p0}, Lcom/jjoe64/graphview/GridLabelRenderer;->getTextSize()F

    move-result v10

    mul-float/2addr v8, v10

    mul-float/2addr v8, v13

    sub-float v7, v6, v8

    .line 1014
    .local v7, "y2":F
    aget-object v8, v4, v3

    int-to-float v10, v1

    iget-object v11, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mPaintLabel:Landroid/graphics/Paint;

    invoke-virtual {p1, v8, v10, v7, v11}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 1011
    add-int/lit8 v3, v3, 0x1

    goto :goto_83

    .line 1003
    .end local v3    # "li":I
    .end local v4    # "lines":[Ljava/lang/String;
    .end local v6    # "y":F
    .end local v7    # "y2":F
    :cond_9e
    invoke-virtual {p0}, Lcom/jjoe64/graphview/GridLabelRenderer;->getVerticalLabelsSecondScaleAlign()Landroid/graphics/Paint$Align;

    move-result-object v8

    sget-object v10, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    if-ne v8, v10, :cond_50

    .line 1004
    div-int/lit8 v8, v2, 0x2

    add-int/2addr v1, v8

    goto :goto_50
.end method

.method public getGridColor()I
    .registers 2

    .prologue
    .line 1166
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iget v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->gridColor:I

    return v0
.end method

.method public getGridStyle()Lcom/jjoe64/graphview/GridLabelRenderer$GridStyle;
    .registers 2

    .prologue
    .line 1440
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iget-object v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->gridStyle:Lcom/jjoe64/graphview/GridLabelRenderer$GridStyle;

    return-object v0
.end method

.method public getHorizontalAxisTitle()Ljava/lang/String;
    .registers 2

    .prologue
    .line 1256
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mHorizontalAxisTitle:Ljava/lang/String;

    return-object v0
.end method

.method public getHorizontalAxisTitleColor()I
    .registers 2

    .prologue
    .line 1326
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iget v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->horizontalAxisTitleColor:I

    return v0
.end method

.method public getHorizontalAxisTitleHeight()I
    .registers 2

    .prologue
    .line 916
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mHorizontalAxisTitle:Ljava/lang/String;

    if-eqz v0, :cond_12

    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mHorizontalAxisTitle:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_12

    .line 917
    invoke-virtual {p0}, Lcom/jjoe64/graphview/GridLabelRenderer;->getHorizontalAxisTitleTextSize()F

    move-result v0

    float-to-int v0, v0

    .line 919
    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public getHorizontalAxisTitleTextSize()F
    .registers 2

    .prologue
    .line 1312
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iget v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->horizontalAxisTitleTextSize:F

    return v0
.end method

.method public getHorizontalLabelsColor()I
    .registers 2

    .prologue
    .line 390
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iget v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->horizontalLabelsColor:I

    return v0
.end method

.method public getLabelFormatter()Lcom/jjoe64/graphview/LabelFormatter;
    .registers 2

    .prologue
    .line 1240
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mLabelFormatter:Lcom/jjoe64/graphview/LabelFormatter;

    return-object v0
.end method

.method public getLabelHorizontalHeight()I
    .registers 2

    .prologue
    .line 1146
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mLabelHorizontalHeight:Ljava/lang/Integer;

    if-eqz v0, :cond_a

    invoke-virtual {p0}, Lcom/jjoe64/graphview/GridLabelRenderer;->isHorizontalLabelsVisible()Z

    move-result v0

    if-nez v0, :cond_c

    :cond_a
    const/4 v0, 0x0

    :goto_b
    return v0

    :cond_c
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mLabelHorizontalHeight:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    goto :goto_b
.end method

.method public getLabelVerticalSecondScaleWidth()I
    .registers 2

    .prologue
    .line 1369
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mLabelVerticalSecondScaleWidth:Ljava/lang/Integer;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mLabelVerticalSecondScaleWidth:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    goto :goto_5
.end method

.method public getLabelVerticalWidth()I
    .registers 2

    .prologue
    .line 1125
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mLabelVerticalWidth:Ljava/lang/Integer;

    if-eqz v0, :cond_a

    invoke-virtual {p0}, Lcom/jjoe64/graphview/GridLabelRenderer;->isVerticalLabelsVisible()Z

    move-result v0

    if-nez v0, :cond_c

    :cond_a
    const/4 v0, 0x0

    :goto_b
    return v0

    :cond_c
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mLabelVerticalWidth:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    goto :goto_b
.end method

.method public getLabelsSpace()I
    .registers 2

    .prologue
    .line 1456
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iget v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->labelsSpace:I

    return v0
.end method

.method public getNumHorizontalLabels()I
    .registers 2

    .prologue
    .line 1425
    iget v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mNumHorizontalLabels:I

    return v0
.end method

.method public getNumVerticalLabels()I
    .registers 2

    .prologue
    .line 1409
    iget v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mNumVerticalLabels:I

    return v0
.end method

.method public getPadding()I
    .registers 2

    .prologue
    .line 1180
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iget v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->padding:I

    return v0
.end method

.method public getStyles()Lcom/jjoe64/graphview/GridLabelRenderer$Styles;
    .registers 2

    .prologue
    .line 1117
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    return-object v0
.end method

.method public getTextSize()F
    .registers 2

    .prologue
    .line 368
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iget v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->textSize:F

    return v0
.end method

.method public getVerticalAxisTitle()Ljava/lang/String;
    .registers 2

    .prologue
    .line 1270
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mVerticalAxisTitle:Ljava/lang/String;

    return-object v0
.end method

.method public getVerticalAxisTitleColor()I
    .registers 2

    .prologue
    .line 1298
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iget v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->verticalAxisTitleColor:I

    return v0
.end method

.method public getVerticalAxisTitleTextSize()F
    .registers 2

    .prologue
    .line 1284
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iget v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->verticalAxisTitleTextSize:F

    return v0
.end method

.method public getVerticalAxisTitleWidth()I
    .registers 2

    .prologue
    .line 928
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mVerticalAxisTitle:Ljava/lang/String;

    if-eqz v0, :cond_12

    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mVerticalAxisTitle:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_12

    .line 929
    invoke-virtual {p0}, Lcom/jjoe64/graphview/GridLabelRenderer;->getVerticalAxisTitleTextSize()F

    move-result v0

    float-to-int v0, v0

    .line 931
    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public getVerticalLabelsAlign()Landroid/graphics/Paint$Align;
    .registers 2

    .prologue
    .line 383
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iget-object v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->verticalLabelsAlign:Landroid/graphics/Paint$Align;

    return-object v0
.end method

.method public getVerticalLabelsColor()I
    .registers 2

    .prologue
    .line 375
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iget v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->verticalLabelsColor:I

    return v0
.end method

.method public getVerticalLabelsSecondScaleAlign()Landroid/graphics/Paint$Align;
    .registers 2

    .prologue
    .line 1340
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iget-object v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->verticalLabelsSecondScaleAlign:Landroid/graphics/Paint$Align;

    return-object v0
.end method

.method public getVerticalLabelsSecondScaleColor()I
    .registers 2

    .prologue
    .line 1354
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iget v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->verticalLabelsSecondScaleColor:I

    return v0
.end method

.method protected humanRound(DZ)D
    .registers 11
    .param p1, "in"    # D
    .param p3, "roundAlwaysUp"    # Z

    .prologue
    const-wide/high16 v5, 0x3ff0000000000000L    # 1.0

    const-wide/high16 v3, 0x4024000000000000L    # 10.0

    .line 1082
    const/4 v0, 0x0

    .line 1083
    .local v0, "ten":I
    :goto_5
    cmpl-double v1, p1, v3

    if-ltz v1, :cond_d

    .line 1084
    div-double/2addr p1, v3

    .line 1085
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 1087
    :cond_d
    :goto_d
    cmpg-double v1, p1, v5

    if-gez v1, :cond_15

    .line 1088
    mul-double/2addr p1, v3

    .line 1089
    add-int/lit8 v0, v0, -0x1

    goto :goto_d

    .line 1091
    :cond_15
    if-eqz p3, :cond_3b

    .line 1092
    cmpl-double v1, p1, v5

    if-nez v1, :cond_22

    .line 1110
    :cond_1b
    :goto_1b
    int-to-double v1, v0

    invoke-static {v3, v4, v1, v2}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v1

    mul-double/2addr v1, p1

    return-wide v1

    .line 1093
    :cond_22
    const-wide/high16 v1, 0x4000000000000000L    # 2.0

    cmpg-double v1, p1, v1

    if-gtz v1, :cond_2b

    .line 1094
    const-wide/high16 p1, 0x4000000000000000L    # 2.0

    goto :goto_1b

    .line 1095
    :cond_2b
    const-wide/high16 v1, 0x4014000000000000L    # 5.0

    cmpg-double v1, p1, v1

    if-gtz v1, :cond_34

    .line 1096
    const-wide/high16 p1, 0x4014000000000000L    # 5.0

    goto :goto_1b

    .line 1097
    :cond_34
    cmpg-double v1, p1, v3

    if-gez v1, :cond_1b

    .line 1098
    const-wide/high16 p1, 0x4024000000000000L    # 10.0

    goto :goto_1b

    .line 1101
    :cond_3b
    cmpl-double v1, p1, v5

    if-eqz v1, :cond_1b

    .line 1102
    const-wide v1, 0x401399999999999aL    # 4.9

    cmpg-double v1, p1, v1

    if-gtz v1, :cond_4b

    .line 1103
    const-wide/high16 p1, 0x4000000000000000L    # 2.0

    goto :goto_1b

    .line 1104
    :cond_4b
    const-wide v1, 0x4023cccccccccccdL    # 9.9

    cmpg-double v1, p1, v1

    if-gtz v1, :cond_57

    .line 1105
    const-wide/high16 p1, 0x4014000000000000L    # 5.0

    goto :goto_1b

    .line 1106
    :cond_57
    const-wide/high16 v1, 0x402e000000000000L    # 15.0

    cmpg-double v1, p1, v1

    if-gez v1, :cond_1b

    .line 1107
    const-wide/high16 p1, 0x4024000000000000L    # 10.0

    goto :goto_1b
.end method

.method public invalidate(ZZ)V
    .registers 5
    .param p1, "keepLabelsSize"    # Z
    .param p2, "keepViewport"    # Z

    .prologue
    const/4 v1, 0x0

    .line 411
    if-nez p2, :cond_6

    .line 412
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mIsAdjusted:Z

    .line 414
    :cond_6
    if-nez p1, :cond_14

    .line 415
    iget-boolean v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mLabelVerticalWidthFixed:Z

    if-nez v0, :cond_e

    .line 416
    iput-object v1, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mLabelVerticalWidth:Ljava/lang/Integer;

    .line 418
    :cond_e
    iput-object v1, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mLabelVerticalHeight:Ljava/lang/Integer;

    .line 419
    iput-object v1, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mLabelVerticalSecondScaleWidth:Ljava/lang/Integer;

    .line 420
    iput-object v1, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mLabelVerticalSecondScaleHeight:Ljava/lang/Integer;

    .line 423
    :cond_14
    return-void
.end method

.method public isHighlightZeroLines()Z
    .registers 2

    .prologue
    .line 1173
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iget-boolean v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->highlightZeroLines:Z

    return v0
.end method

.method public isHorizontalLabelsVisible()Z
    .registers 2

    .prologue
    .line 1377
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iget-boolean v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->horizontalLabelsVisible:Z

    return v0
.end method

.method public isVerticalLabelsVisible()Z
    .registers 2

    .prologue
    .line 1393
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iget-boolean v0, v0, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->verticalLabelsVisible:Z

    return v0
.end method

.method public reloadStyles()V
    .registers 3

    .prologue
    .line 352
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mPaintLine:Landroid/graphics/Paint;

    .line 353
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mPaintLine:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iget v1, v1, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->gridColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 354
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mPaintLine:Landroid/graphics/Paint;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 356
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mPaintLabel:Landroid/graphics/Paint;

    .line 357
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mPaintLabel:Landroid/graphics/Paint;

    invoke-virtual {p0}, Lcom/jjoe64/graphview/GridLabelRenderer;->getTextSize()F

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 359
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mPaintAxisTitle:Landroid/graphics/Paint;

    .line 360
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mPaintAxisTitle:Landroid/graphics/Paint;

    invoke-virtual {p0}, Lcom/jjoe64/graphview/GridLabelRenderer;->getTextSize()F

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 361
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mPaintAxisTitle:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 362
    return-void
.end method

.method public resetStyles()V
    .registers 12

    .prologue
    const/4 v10, 0x1

    .line 295
    new-instance v6, Landroid/util/TypedValue;

    invoke-direct {v6}, Landroid/util/TypedValue;-><init>()V

    .line 296
    .local v6, "typedValue":Landroid/util/TypedValue;
    iget-object v7, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    invoke-virtual {v7}, Lcom/jjoe64/graphview/GraphView;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v7

    const v8, 0x1010042

    invoke-virtual {v7, v8, v6, v10}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 303
    const/4 v0, 0x0

    .line 305
    .local v0, "array":Landroid/content/res/TypedArray;
    :try_start_17
    iget-object v7, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    invoke-virtual {v7}, Lcom/jjoe64/graphview/GraphView;->getContext()Landroid/content/Context;

    move-result-object v7

    iget v8, v6, Landroid/util/TypedValue;->data:I

    const/4 v9, 0x4

    new-array v9, v9, [I

    fill-array-data v9, :array_ba

    invoke-virtual {v7, v8, v9}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 310
    const/4 v7, 0x0

    const/high16 v8, -0x1000000

    invoke-virtual {v0, v7, v8}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    .line 311
    .local v1, "color1":I
    const/4 v7, 0x1

    const v8, -0x777778

    invoke-virtual {v0, v7, v8}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v2

    .line 312
    .local v2, "color2":I
    const/4 v7, 0x2

    const/16 v8, 0x14

    invoke-virtual {v0, v7, v8}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    .line 313
    .local v4, "size":I
    const/4 v7, 0x3

    const/16 v8, 0x14

    invoke-virtual {v0, v7, v8}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v5

    .line 314
    .local v5, "size2":I
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V
    :try_end_49
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_49} :catch_af

    .line 322
    :goto_49
    iget-object v7, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iput v1, v7, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->verticalLabelsColor:I

    .line 323
    iget-object v7, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iput v1, v7, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->verticalLabelsSecondScaleColor:I

    .line 324
    iget-object v7, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iput v1, v7, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->horizontalLabelsColor:I

    .line 325
    iget-object v7, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iput v2, v7, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->gridColor:I

    .line 326
    iget-object v7, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    int-to-float v8, v4

    iput v8, v7, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->textSize:F

    .line 327
    iget-object v7, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iput v5, v7, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->padding:I

    .line 328
    iget-object v7, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iget-object v8, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iget v8, v8, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->textSize:F

    float-to-int v8, v8

    div-int/lit8 v8, v8, 0x5

    iput v8, v7, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->labelsSpace:I

    .line 330
    iget-object v7, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    sget-object v8, Landroid/graphics/Paint$Align;->RIGHT:Landroid/graphics/Paint$Align;

    iput-object v8, v7, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->verticalLabelsAlign:Landroid/graphics/Paint$Align;

    .line 331
    iget-object v7, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    sget-object v8, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    iput-object v8, v7, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->verticalLabelsSecondScaleAlign:Landroid/graphics/Paint$Align;

    .line 332
    iget-object v7, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iput-boolean v10, v7, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->highlightZeroLines:Z

    .line 334
    iget-object v7, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iget-object v8, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iget v8, v8, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->verticalLabelsColor:I

    iput v8, v7, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->verticalAxisTitleColor:I

    .line 335
    iget-object v7, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iget-object v8, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iget v8, v8, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->horizontalLabelsColor:I

    iput v8, v7, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->horizontalAxisTitleColor:I

    .line 336
    iget-object v7, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iget-object v8, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iget v8, v8, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->textSize:F

    iput v8, v7, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->verticalAxisTitleTextSize:F

    .line 337
    iget-object v7, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iget-object v8, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iget v8, v8, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->textSize:F

    iput v8, v7, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->horizontalAxisTitleTextSize:F

    .line 339
    iget-object v7, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iput-boolean v10, v7, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->horizontalLabelsVisible:Z

    .line 340
    iget-object v7, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iput-boolean v10, v7, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->verticalLabelsVisible:Z

    .line 342
    iget-object v7, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    sget-object v8, Lcom/jjoe64/graphview/GridLabelRenderer$GridStyle;->BOTH:Lcom/jjoe64/graphview/GridLabelRenderer$GridStyle;

    iput-object v8, v7, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->gridStyle:Lcom/jjoe64/graphview/GridLabelRenderer$GridStyle;

    .line 344
    invoke-virtual {p0}, Lcom/jjoe64/graphview/GridLabelRenderer;->reloadStyles()V

    .line 345
    return-void

    .line 315
    .end local v1    # "color1":I
    .end local v2    # "color2":I
    .end local v4    # "size":I
    .end local v5    # "size2":I
    :catch_af
    move-exception v3

    .line 316
    .local v3, "e":Ljava/lang/Exception;
    const/high16 v1, -0x1000000

    .line 317
    .restart local v1    # "color1":I
    const v2, -0x777778

    .line 318
    .restart local v2    # "color2":I
    const/16 v4, 0x14

    .line 319
    .restart local v4    # "size":I
    const/16 v5, 0x14

    .restart local v5    # "size2":I
    goto :goto_49

    .line 305
    :array_ba
    .array-data 4
        0x1010036
        0x1010038
        0x1010095
        0x101023f
    .end array-data
.end method

.method public setGridColor(I)V
    .registers 3
    .param p1, "gridColor"    # I

    .prologue
    .line 1217
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iput p1, v0, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->gridColor:I

    .line 1218
    return-void
.end method

.method public setGridStyle(Lcom/jjoe64/graphview/GridLabelRenderer$GridStyle;)V
    .registers 3
    .param p1, "gridStyle"    # Lcom/jjoe64/graphview/GridLabelRenderer$GridStyle;

    .prologue
    .line 1449
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iput-object p1, v0, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->gridStyle:Lcom/jjoe64/graphview/GridLabelRenderer$GridStyle;

    .line 1450
    return-void
.end method

.method public setHighlightZeroLines(Z)V
    .registers 3
    .param p1, "highlightZeroLines"    # Z

    .prologue
    .line 1225
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iput-boolean p1, v0, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->highlightZeroLines:Z

    .line 1226
    return-void
.end method

.method public setHorizontalAxisTitle(Ljava/lang/String;)V
    .registers 2
    .param p1, "mHorizontalAxisTitle"    # Ljava/lang/String;

    .prologue
    .line 1263
    iput-object p1, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mHorizontalAxisTitle:Ljava/lang/String;

    .line 1264
    return-void
.end method

.method public setHorizontalAxisTitleColor(I)V
    .registers 3
    .param p1, "horizontalAxisTitleColor"    # I

    .prologue
    .line 1333
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iput p1, v0, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->horizontalAxisTitleColor:I

    .line 1334
    return-void
.end method

.method public setHorizontalAxisTitleTextSize(F)V
    .registers 3
    .param p1, "horizontalAxisTitleTextSize"    # F

    .prologue
    .line 1319
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iput p1, v0, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->horizontalAxisTitleTextSize:F

    .line 1320
    return-void
.end method

.method public setHorizontalLabelsColor(I)V
    .registers 3
    .param p1, "horizontalLabelsColor"    # I

    .prologue
    .line 1210
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iput p1, v0, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->horizontalLabelsColor:I

    .line 1211
    return-void
.end method

.method public setHorizontalLabelsVisible(Z)V
    .registers 3
    .param p1, "horizontalTitleVisible"    # Z

    .prologue
    .line 1385
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iput-boolean p1, v0, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->horizontalLabelsVisible:Z

    .line 1386
    return-void
.end method

.method public setLabelFormatter(Lcom/jjoe64/graphview/LabelFormatter;)V
    .registers 3
    .param p1, "mLabelFormatter"    # Lcom/jjoe64/graphview/LabelFormatter;

    .prologue
    .line 1248
    iput-object p1, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mLabelFormatter:Lcom/jjoe64/graphview/LabelFormatter;

    .line 1249
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    invoke-virtual {v0}, Lcom/jjoe64/graphview/GraphView;->getViewport()Lcom/jjoe64/graphview/Viewport;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/jjoe64/graphview/LabelFormatter;->setViewport(Lcom/jjoe64/graphview/Viewport;)V

    .line 1250
    return-void
.end method

.method public setLabelHorizontalHeight(Ljava/lang/Integer;)V
    .registers 3
    .param p1, "height"    # Ljava/lang/Integer;

    .prologue
    .line 1158
    iput-object p1, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mLabelHorizontalHeight:Ljava/lang/Integer;

    .line 1159
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mLabelHorizontalHeight:Ljava/lang/Integer;

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    :goto_7
    iput-boolean v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mLabelHorizontalHeightFixed:Z

    .line 1160
    return-void

    .line 1159
    :cond_a
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public setLabelVerticalWidth(Ljava/lang/Integer;)V
    .registers 3
    .param p1, "width"    # Ljava/lang/Integer;

    .prologue
    .line 1137
    iput-object p1, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mLabelVerticalWidth:Ljava/lang/Integer;

    .line 1138
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mLabelVerticalWidth:Ljava/lang/Integer;

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    :goto_7
    iput-boolean v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mLabelVerticalWidthFixed:Z

    .line 1139
    return-void

    .line 1138
    :cond_a
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public setLabelsSpace(I)V
    .registers 3
    .param p1, "labelsSpace"    # I

    .prologue
    .line 1465
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iput p1, v0, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->labelsSpace:I

    .line 1466
    return-void
.end method

.method public setNumHorizontalLabels(I)V
    .registers 2
    .param p1, "mNumHorizontalLabels"    # I

    .prologue
    .line 1433
    iput p1, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mNumHorizontalLabels:I

    .line 1434
    return-void
.end method

.method public setNumVerticalLabels(I)V
    .registers 2
    .param p1, "mNumVerticalLabels"    # I

    .prologue
    .line 1417
    iput p1, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mNumVerticalLabels:I

    .line 1418
    return-void
.end method

.method public setPadding(I)V
    .registers 3
    .param p1, "padding"    # I

    .prologue
    .line 1232
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iput p1, v0, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->padding:I

    .line 1233
    return-void
.end method

.method public setTextSize(F)V
    .registers 3
    .param p1, "textSize"    # F

    .prologue
    .line 1189
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iput p1, v0, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->textSize:F

    .line 1190
    return-void
.end method

.method public setVerticalAxisTitle(Ljava/lang/String;)V
    .registers 2
    .param p1, "mVerticalAxisTitle"    # Ljava/lang/String;

    .prologue
    .line 1277
    iput-object p1, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mVerticalAxisTitle:Ljava/lang/String;

    .line 1278
    return-void
.end method

.method public setVerticalAxisTitleColor(I)V
    .registers 3
    .param p1, "verticalAxisTitleColor"    # I

    .prologue
    .line 1305
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iput p1, v0, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->verticalAxisTitleColor:I

    .line 1306
    return-void
.end method

.method public setVerticalAxisTitleTextSize(F)V
    .registers 3
    .param p1, "verticalAxisTitleTextSize"    # F

    .prologue
    .line 1291
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iput p1, v0, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->verticalAxisTitleTextSize:F

    .line 1292
    return-void
.end method

.method public setVerticalLabelsAlign(Landroid/graphics/Paint$Align;)V
    .registers 3
    .param p1, "verticalLabelsAlign"    # Landroid/graphics/Paint$Align;

    .prologue
    .line 1196
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iput-object p1, v0, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->verticalLabelsAlign:Landroid/graphics/Paint$Align;

    .line 1197
    return-void
.end method

.method public setVerticalLabelsColor(I)V
    .registers 3
    .param p1, "verticalLabelsColor"    # I

    .prologue
    .line 1203
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iput p1, v0, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->verticalLabelsColor:I

    .line 1204
    return-void
.end method

.method public setVerticalLabelsSecondScaleAlign(Landroid/graphics/Paint$Align;)V
    .registers 3
    .param p1, "verticalLabelsSecondScaleAlign"    # Landroid/graphics/Paint$Align;

    .prologue
    .line 1347
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iput-object p1, v0, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->verticalLabelsSecondScaleAlign:Landroid/graphics/Paint$Align;

    .line 1348
    return-void
.end method

.method public setVerticalLabelsSecondScaleColor(I)V
    .registers 3
    .param p1, "verticalLabelsSecondScaleColor"    # I

    .prologue
    .line 1361
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iput p1, v0, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->verticalLabelsSecondScaleColor:I

    .line 1362
    return-void
.end method

.method public setVerticalLabelsVisible(Z)V
    .registers 3
    .param p1, "verticalTitleVisible"    # Z

    .prologue
    .line 1401
    iget-object v0, p0, Lcom/jjoe64/graphview/GridLabelRenderer;->mStyles:Lcom/jjoe64/graphview/GridLabelRenderer$Styles;

    iput-boolean p1, v0, Lcom/jjoe64/graphview/GridLabelRenderer$Styles;->verticalLabelsVisible:Z

    .line 1402
    return-void
.end method
