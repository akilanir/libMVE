.class Lorg/osmdroid/views/MapControllerOld$LinearAnimationRunner;
.super Lorg/osmdroid/views/MapControllerOld$AbstractAnimationRunner;
.source "MapControllerOld.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/osmdroid/views/MapControllerOld;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "LinearAnimationRunner"
.end annotation


# instance fields
.field protected final mPanPerStepLatitudeE6:I

.field protected final mPanPerStepLongitudeE6:I

.field final synthetic this$0:Lorg/osmdroid/views/MapControllerOld;


# direct methods
.method public constructor <init>(Lorg/osmdroid/views/MapControllerOld;II)V
    .registers 10
    .param p2, "aTargetLatitudeE6"    # I
    .param p3, "aTargetLongitudeE6"    # I

    .prologue
    .line 453
    const/16 v4, 0xa

    const/16 v5, 0x3e8

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    invoke-direct/range {v0 .. v5}, Lorg/osmdroid/views/MapControllerOld$LinearAnimationRunner;-><init>(Lorg/osmdroid/views/MapControllerOld;IIII)V

    .line 455
    return-void
.end method

.method public constructor <init>(Lorg/osmdroid/views/MapControllerOld;IIII)V
    .registers 9
    .param p2, "aTargetLatitudeE6"    # I
    .param p3, "aTargetLongitudeE6"    # I
    .param p4, "aSmoothness"    # I
    .param p5, "aDuration"    # I

    .prologue
    .line 458
    iput-object p1, p0, Lorg/osmdroid/views/MapControllerOld$LinearAnimationRunner;->this$0:Lorg/osmdroid/views/MapControllerOld;

    .line 459
    invoke-direct/range {p0 .. p5}, Lorg/osmdroid/views/MapControllerOld$AbstractAnimationRunner;-><init>(Lorg/osmdroid/views/MapControllerOld;IIII)V

    .line 462
    # getter for: Lorg/osmdroid/views/MapControllerOld;->mOsmv:Lorg/osmdroid/views/MapView;
    invoke-static {p1}, Lorg/osmdroid/views/MapControllerOld;->access$000(Lorg/osmdroid/views/MapControllerOld;)Lorg/osmdroid/views/MapView;

    move-result-object v1

    .line 463
    .local v1, "mapview":Lorg/osmdroid/views/MapView;
    invoke-virtual {v1}, Lorg/osmdroid/views/MapView;->getMapCenter()Lorg/osmdroid/api/IGeoPoint;

    move-result-object v0

    .line 465
    .local v0, "mapCenter":Lorg/osmdroid/api/IGeoPoint;
    invoke-interface {v0}, Lorg/osmdroid/api/IGeoPoint;->getLatitudeE6()I

    move-result v2

    sub-int/2addr v2, p2

    div-int/2addr v2, p4

    iput v2, p0, Lorg/osmdroid/views/MapControllerOld$LinearAnimationRunner;->mPanPerStepLatitudeE6:I

    .line 467
    invoke-interface {v0}, Lorg/osmdroid/api/IGeoPoint;->getLongitudeE6()I

    move-result v2

    sub-int/2addr v2, p3

    div-int/2addr v2, p4

    iput v2, p0, Lorg/osmdroid/views/MapControllerOld$LinearAnimationRunner;->mPanPerStepLongitudeE6:I

    .line 470
    const-string v2, "LinearAnimationRunner"

    invoke-virtual {p0, v2}, Lorg/osmdroid/views/MapControllerOld$LinearAnimationRunner;->setName(Ljava/lang/String;)V

    .line 471
    return-void
.end method


# virtual methods
.method public onRunAnimation()V
    .registers 12

    .prologue
    .line 479
    iget-object v9, p0, Lorg/osmdroid/views/MapControllerOld$LinearAnimationRunner;->this$0:Lorg/osmdroid/views/MapControllerOld;

    # getter for: Lorg/osmdroid/views/MapControllerOld;->mOsmv:Lorg/osmdroid/views/MapView;
    invoke-static {v9}, Lorg/osmdroid/views/MapControllerOld;->access$000(Lorg/osmdroid/views/MapControllerOld;)Lorg/osmdroid/views/MapView;

    move-result-object v3

    .line 480
    .local v3, "mapview":Lorg/osmdroid/views/MapView;
    invoke-virtual {v3}, Lorg/osmdroid/views/MapView;->getMapCenter()Lorg/osmdroid/api/IGeoPoint;

    move-result-object v2

    .line 481
    .local v2, "mapCenter":Lorg/osmdroid/api/IGeoPoint;
    iget v6, p0, Lorg/osmdroid/views/MapControllerOld$LinearAnimationRunner;->mPanPerStepLatitudeE6:I

    .line 482
    .local v6, "panPerStepLatitudeE6":I
    iget v7, p0, Lorg/osmdroid/views/MapControllerOld$LinearAnimationRunner;->mPanPerStepLongitudeE6:I

    .line 483
    .local v7, "panPerStepLongitudeE6":I
    iget v8, p0, Lorg/osmdroid/views/MapControllerOld$LinearAnimationRunner;->mStepDuration:I

    .line 488
    .local v8, "stepDuration":I
    :try_start_10
    iget v1, p0, Lorg/osmdroid/views/MapControllerOld$LinearAnimationRunner;->mSmoothness:I

    .local v1, "i":I
    :goto_12
    if-lez v1, :cond_33

    .line 490
    invoke-interface {v2}, Lorg/osmdroid/api/IGeoPoint;->getLatitudeE6()I

    move-result v9

    sub-int v4, v9, v6

    .line 491
    .local v4, "newMapCenterLatE6":I
    invoke-interface {v2}, Lorg/osmdroid/api/IGeoPoint;->getLongitudeE6()I

    move-result v9

    sub-int v5, v9, v7

    .line 492
    .local v5, "newMapCenterLonE6":I
    new-instance v9, Lorg/osmdroid/util/GeoPoint;

    invoke-direct {v9, v4, v5}, Lorg/osmdroid/util/GeoPoint;-><init>(II)V

    invoke-virtual {v3, v9}, Lorg/osmdroid/views/MapView;->setMapCenter(Lorg/osmdroid/api/IGeoPoint;)V

    .line 494
    int-to-long v9, v8

    invoke-static {v9, v10}, Ljava/lang/Thread;->sleep(J)V
    :try_end_2c
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_2c} :catch_2f

    .line 488
    add-int/lit8 v1, v1, -0x1

    goto :goto_12

    .line 496
    .end local v1    # "i":I
    .end local v4    # "newMapCenterLatE6":I
    .end local v5    # "newMapCenterLonE6":I
    :catch_2f
    move-exception v0

    .line 497
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {p0}, Lorg/osmdroid/views/MapControllerOld$LinearAnimationRunner;->interrupt()V

    .line 499
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_33
    return-void
.end method
