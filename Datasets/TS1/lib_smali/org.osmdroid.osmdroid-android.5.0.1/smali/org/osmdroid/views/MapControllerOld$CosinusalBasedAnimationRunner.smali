.class Lorg/osmdroid/views/MapControllerOld$CosinusalBasedAnimationRunner;
.super Lorg/osmdroid/views/MapControllerOld$AbstractAnimationRunner;
.source "MapControllerOld.java"

# interfaces
.implements Lorg/osmdroid/views/util/constants/MathConstants;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/osmdroid/views/MapControllerOld;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CosinusalBasedAnimationRunner"
.end annotation


# instance fields
.field protected final mAmountStretch:F

.field protected final mStart:F

.field protected final mStepIncrement:F

.field protected final mYOffset:F

.field final synthetic this$0:Lorg/osmdroid/views/MapControllerOld;


# direct methods
.method public constructor <init>(Lorg/osmdroid/views/MapControllerOld;IIFFF)V
    .registers 16
    .param p2, "aTargetLatitudeE6"    # I
    .param p3, "aTargetLongitudeE6"    # I
    .param p4, "aStart"    # F
    .param p5, "aRange"    # F
    .param p6, "aYOffset"    # F

    .prologue
    .line 586
    const/16 v4, 0xa

    const/16 v5, 0x3e8

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v6, p4

    move v7, p5

    move v8, p6

    invoke-direct/range {v0 .. v8}, Lorg/osmdroid/views/MapControllerOld$CosinusalBasedAnimationRunner;-><init>(Lorg/osmdroid/views/MapControllerOld;IIIIFFF)V

    .line 588
    return-void
.end method

.method public constructor <init>(Lorg/osmdroid/views/MapControllerOld;IIIIFFF)V
    .registers 18
    .param p2, "aTargetLatitudeE6"    # I
    .param p3, "aTargetLongitudeE6"    # I
    .param p4, "aSmoothness"    # I
    .param p5, "aDuration"    # I
    .param p6, "aStart"    # F
    .param p7, "aRange"    # F
    .param p8, "aYOffset"    # F

    .prologue
    .line 592
    iput-object p1, p0, Lorg/osmdroid/views/MapControllerOld$CosinusalBasedAnimationRunner;->this$0:Lorg/osmdroid/views/MapControllerOld;

    .line 593
    invoke-direct/range {p0 .. p5}, Lorg/osmdroid/views/MapControllerOld$AbstractAnimationRunner;-><init>(Lorg/osmdroid/views/MapControllerOld;IIII)V

    .line 594
    move/from16 v0, p8

    iput v0, p0, Lorg/osmdroid/views/MapControllerOld$CosinusalBasedAnimationRunner;->mYOffset:F

    .line 595
    iput p6, p0, Lorg/osmdroid/views/MapControllerOld$CosinusalBasedAnimationRunner;->mStart:F

    .line 597
    int-to-float v3, p4

    div-float v3, p7, v3

    iput v3, p0, Lorg/osmdroid/views/MapControllerOld$CosinusalBasedAnimationRunner;->mStepIncrement:F

    .line 600
    const/4 v1, 0x0

    .line 601
    .local v1, "amountSum":F
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_12
    if-ge v2, p4, :cond_28

    .line 602
    float-to-double v3, v1

    move/from16 v0, p8

    float-to-double v5, v0

    iget v7, p0, Lorg/osmdroid/views/MapControllerOld$CosinusalBasedAnimationRunner;->mStepIncrement:F

    int-to-float v8, v2

    mul-float/2addr v7, v8

    add-float/2addr v7, p6

    float-to-double v7, v7

    invoke-static {v7, v8}, Ljava/lang/Math;->cos(D)D

    move-result-wide v7

    add-double/2addr v5, v7

    add-double/2addr v3, v5

    double-to-float v1, v3

    .line 601
    add-int/lit8 v2, v2, 0x1

    goto :goto_12

    .line 605
    :cond_28
    const/high16 v3, 0x3f800000    # 1.0f

    div-float/2addr v3, v1

    iput v3, p0, Lorg/osmdroid/views/MapControllerOld$CosinusalBasedAnimationRunner;->mAmountStretch:F

    .line 607
    const-string v3, "QuarterCosinusalDeceleratingAnimationRunner"

    invoke-virtual {p0, v3}, Lorg/osmdroid/views/MapControllerOld$CosinusalBasedAnimationRunner;->setName(Ljava/lang/String;)V

    .line 608
    return-void
.end method


# virtual methods
.method public onRunAnimation()V
    .registers 18

    .prologue
    .line 616
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/osmdroid/views/MapControllerOld$CosinusalBasedAnimationRunner;->this$0:Lorg/osmdroid/views/MapControllerOld;

    # getter for: Lorg/osmdroid/views/MapControllerOld;->mOsmv:Lorg/osmdroid/views/MapView;
    invoke-static {v13}, Lorg/osmdroid/views/MapControllerOld;->access$000(Lorg/osmdroid/views/MapControllerOld;)Lorg/osmdroid/views/MapView;

    move-result-object v9

    .line 617
    .local v9, "mapview":Lorg/osmdroid/views/MapView;
    invoke-virtual {v9}, Lorg/osmdroid/views/MapView;->getMapCenter()Lorg/osmdroid/api/IGeoPoint;

    move-result-object v8

    .line 618
    .local v8, "mapCenter":Lorg/osmdroid/api/IGeoPoint;
    move-object/from16 v0, p0

    iget v12, v0, Lorg/osmdroid/views/MapControllerOld$CosinusalBasedAnimationRunner;->mStepDuration:I

    .line 619
    .local v12, "stepDuration":I
    move-object/from16 v0, p0

    iget v1, v0, Lorg/osmdroid/views/MapControllerOld$CosinusalBasedAnimationRunner;->mAmountStretch:F

    .line 624
    .local v1, "amountStretch":F
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_15
    :try_start_15
    move-object/from16 v0, p0

    iget v13, v0, Lorg/osmdroid/views/MapControllerOld$CosinusalBasedAnimationRunner;->mSmoothness:I

    if-ge v7, v13, :cond_63

    .line 626
    move-object/from16 v0, p0

    iget v13, v0, Lorg/osmdroid/views/MapControllerOld$CosinusalBasedAnimationRunner;->mYOffset:F

    float-to-double v13, v13

    move-object/from16 v0, p0

    iget v15, v0, Lorg/osmdroid/views/MapControllerOld$CosinusalBasedAnimationRunner;->mStepIncrement:F

    int-to-float v0, v7

    move/from16 v16, v0

    mul-float v15, v15, v16

    move-object/from16 v0, p0

    iget v0, v0, Lorg/osmdroid/views/MapControllerOld$CosinusalBasedAnimationRunner;->mStart:F

    move/from16 v16, v0

    add-float v15, v15, v16

    float-to-double v15, v15

    invoke-static/range {v15 .. v16}, Ljava/lang/Math;->cos(D)D

    move-result-wide v15

    add-double/2addr v13, v15

    float-to-double v15, v1

    mul-double v2, v13, v15

    .line 629
    .local v2, "delta":D
    move-object/from16 v0, p0

    iget v13, v0, Lorg/osmdroid/views/MapControllerOld$CosinusalBasedAnimationRunner;->mPanTotalLatitudeE6:I

    int-to-double v13, v13

    mul-double/2addr v13, v2

    double-to-int v4, v13

    .line 630
    .local v4, "deltaLatitudeE6":I
    move-object/from16 v0, p0

    iget v13, v0, Lorg/osmdroid/views/MapControllerOld$CosinusalBasedAnimationRunner;->mPanTotalLongitudeE6:I

    int-to-double v13, v13

    mul-double/2addr v13, v2

    double-to-int v5, v13

    .line 632
    .local v5, "deltaLongitudeE6":I
    invoke-interface {v8}, Lorg/osmdroid/api/IGeoPoint;->getLatitudeE6()I

    move-result v13

    sub-int v10, v13, v4

    .line 633
    .local v10, "newMapCenterLatE6":I
    invoke-interface {v8}, Lorg/osmdroid/api/IGeoPoint;->getLongitudeE6()I

    move-result v13

    sub-int v11, v13, v5

    .line 634
    .local v11, "newMapCenterLonE6":I
    new-instance v13, Lorg/osmdroid/util/GeoPoint;

    invoke-direct {v13, v10, v11}, Lorg/osmdroid/util/GeoPoint;-><init>(II)V

    invoke-virtual {v9, v13}, Lorg/osmdroid/views/MapView;->setMapCenter(Lorg/osmdroid/api/IGeoPoint;)V

    .line 636
    int-to-long v13, v12

    invoke-static {v13, v14}, Ljava/lang/Thread;->sleep(J)V

    .line 624
    add-int/lit8 v7, v7, 0x1

    goto :goto_15

    .line 638
    .end local v2    # "delta":D
    .end local v4    # "deltaLatitudeE6":I
    .end local v5    # "deltaLongitudeE6":I
    .end local v10    # "newMapCenterLatE6":I
    .end local v11    # "newMapCenterLonE6":I
    :cond_63
    new-instance v13, Lorg/osmdroid/util/GeoPoint;

    move-object/from16 v0, p0

    iget v14, v0, Lorg/osmdroid/views/MapControllerOld$AbstractAnimationRunner;->mTargetLatitudeE6:I

    move-object/from16 v0, p0

    iget v15, v0, Lorg/osmdroid/views/MapControllerOld$AbstractAnimationRunner;->mTargetLongitudeE6:I

    invoke-direct {v13, v14, v15}, Lorg/osmdroid/util/GeoPoint;-><init>(II)V

    invoke-virtual {v9, v13}, Lorg/osmdroid/views/MapView;->setMapCenter(Lorg/osmdroid/api/IGeoPoint;)V
    :try_end_73
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_73} :catch_74

    .line 642
    :goto_73
    return-void

    .line 639
    :catch_74
    move-exception v6

    .line 640
    .local v6, "e":Ljava/lang/Exception;
    invoke-virtual/range {p0 .. p0}, Lorg/osmdroid/views/MapControllerOld$CosinusalBasedAnimationRunner;->interrupt()V

    goto :goto_73
.end method
