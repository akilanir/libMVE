.class Lorg/osmdroid/views/MapControllerOld$ExponentialDeceleratingAnimationRunner;
.super Lorg/osmdroid/views/MapControllerOld$AbstractAnimationRunner;
.source "MapControllerOld.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/osmdroid/views/MapControllerOld;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ExponentialDeceleratingAnimationRunner"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/osmdroid/views/MapControllerOld;


# direct methods
.method public constructor <init>(Lorg/osmdroid/views/MapControllerOld;II)V
    .registers 10
    .param p2, "aTargetLatitudeE6"    # I
    .param p3, "aTargetLongitudeE6"    # I

    .prologue
    .line 513
    const/16 v4, 0xa

    const/16 v5, 0x3e8

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    invoke-direct/range {v0 .. v5}, Lorg/osmdroid/views/MapControllerOld$ExponentialDeceleratingAnimationRunner;-><init>(Lorg/osmdroid/views/MapControllerOld;IIII)V

    .line 515
    return-void
.end method

.method public constructor <init>(Lorg/osmdroid/views/MapControllerOld;IIII)V
    .registers 7
    .param p2, "aTargetLatitudeE6"    # I
    .param p3, "aTargetLongitudeE6"    # I
    .param p4, "aSmoothness"    # I
    .param p5, "aDuration"    # I

    .prologue
    .line 518
    iput-object p1, p0, Lorg/osmdroid/views/MapControllerOld$ExponentialDeceleratingAnimationRunner;->this$0:Lorg/osmdroid/views/MapControllerOld;

    .line 519
    invoke-direct/range {p0 .. p5}, Lorg/osmdroid/views/MapControllerOld$AbstractAnimationRunner;-><init>(Lorg/osmdroid/views/MapControllerOld;IIII)V

    .line 521
    const-string v0, "ExponentialDeceleratingAnimationRunner"

    invoke-virtual {p0, v0}, Lorg/osmdroid/views/MapControllerOld$ExponentialDeceleratingAnimationRunner;->setName(Ljava/lang/String;)V

    .line 522
    return-void
.end method


# virtual methods
.method public onRunAnimation()V
    .registers 16

    .prologue
    .line 530
    iget-object v11, p0, Lorg/osmdroid/views/MapControllerOld$ExponentialDeceleratingAnimationRunner;->this$0:Lorg/osmdroid/views/MapControllerOld;

    # getter for: Lorg/osmdroid/views/MapControllerOld;->mOsmv:Lorg/osmdroid/views/MapView;
    invoke-static {v11}, Lorg/osmdroid/views/MapControllerOld;->access$000(Lorg/osmdroid/views/MapControllerOld;)Lorg/osmdroid/views/MapView;

    move-result-object v7

    .line 531
    .local v7, "mapview":Lorg/osmdroid/views/MapView;
    invoke-virtual {v7}, Lorg/osmdroid/views/MapView;->getMapCenter()Lorg/osmdroid/api/IGeoPoint;

    move-result-object v6

    .line 532
    .local v6, "mapCenter":Lorg/osmdroid/api/IGeoPoint;
    iget v10, p0, Lorg/osmdroid/views/MapControllerOld$ExponentialDeceleratingAnimationRunner;->mStepDuration:I

    .line 537
    .local v10, "stepDuration":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_d
    :try_start_d
    iget v11, p0, Lorg/osmdroid/views/MapControllerOld$ExponentialDeceleratingAnimationRunner;->mSmoothness:I

    if-ge v5, v11, :cond_3f

    .line 539
    const-wide/high16 v11, 0x3fe0000000000000L    # 0.5

    add-int/lit8 v13, v5, 0x1

    int-to-double v13, v13

    invoke-static {v11, v12, v13, v14}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v0

    .line 540
    .local v0, "delta":D
    iget v11, p0, Lorg/osmdroid/views/MapControllerOld$ExponentialDeceleratingAnimationRunner;->mPanTotalLatitudeE6:I

    int-to-double v11, v11

    mul-double/2addr v11, v0

    double-to-int v2, v11

    .line 541
    .local v2, "deltaLatitudeE6":I
    iget v11, p0, Lorg/osmdroid/views/MapControllerOld$ExponentialDeceleratingAnimationRunner;->mPanTotalLongitudeE6:I

    int-to-double v11, v11

    mul-double/2addr v11, v0

    double-to-int v3, v11

    .line 543
    .local v3, "detlaLongitudeE6":I
    invoke-interface {v6}, Lorg/osmdroid/api/IGeoPoint;->getLatitudeE6()I

    move-result v11

    sub-int v8, v11, v2

    .line 544
    .local v8, "newMapCenterLatE6":I
    invoke-interface {v6}, Lorg/osmdroid/api/IGeoPoint;->getLongitudeE6()I

    move-result v11

    sub-int v9, v11, v3

    .line 545
    .local v9, "newMapCenterLonE6":I
    new-instance v11, Lorg/osmdroid/util/GeoPoint;

    invoke-direct {v11, v8, v9}, Lorg/osmdroid/util/GeoPoint;-><init>(II)V

    invoke-virtual {v7, v11}, Lorg/osmdroid/views/MapView;->setMapCenter(Lorg/osmdroid/api/IGeoPoint;)V

    .line 547
    int-to-long v11, v10

    invoke-static {v11, v12}, Ljava/lang/Thread;->sleep(J)V

    .line 537
    add-int/lit8 v5, v5, 0x1

    goto :goto_d

    .line 549
    .end local v0    # "delta":D
    .end local v2    # "deltaLatitudeE6":I
    .end local v3    # "detlaLongitudeE6":I
    .end local v8    # "newMapCenterLatE6":I
    .end local v9    # "newMapCenterLonE6":I
    :cond_3f
    new-instance v11, Lorg/osmdroid/util/GeoPoint;

    iget v12, p0, Lorg/osmdroid/views/MapControllerOld$AbstractAnimationRunner;->mTargetLatitudeE6:I

    iget v13, p0, Lorg/osmdroid/views/MapControllerOld$AbstractAnimationRunner;->mTargetLongitudeE6:I

    invoke-direct {v11, v12, v13}, Lorg/osmdroid/util/GeoPoint;-><init>(II)V

    invoke-virtual {v7, v11}, Lorg/osmdroid/views/MapView;->setMapCenter(Lorg/osmdroid/api/IGeoPoint;)V
    :try_end_4b
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_4b} :catch_4c

    .line 553
    :goto_4b
    return-void

    .line 550
    :catch_4c
    move-exception v4

    .line 551
    .local v4, "e":Ljava/lang/Exception;
    invoke-virtual {p0}, Lorg/osmdroid/views/MapControllerOld$ExponentialDeceleratingAnimationRunner;->interrupt()V

    goto :goto_4b
.end method
