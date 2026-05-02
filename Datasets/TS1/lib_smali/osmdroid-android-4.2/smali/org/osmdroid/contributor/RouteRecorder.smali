.class public Lorg/osmdroid/contributor/RouteRecorder;
.super Ljava/lang/Object;
.source "RouteRecorder.java"


# instance fields
.field protected final mRecords:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lorg/osmdroid/contributor/util/RecordedGeoPoint;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/osmdroid/contributor/RouteRecorder;->mRecords:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public add(Landroid/location/Location;I)V
    .registers 10
    .param p1, "aLocation"    # Landroid/location/Location;
    .param p2, "aNumSatellites"    # I

    .prologue
    const-wide v4, 0x412e848000000000L    # 1000000.0

    .line 48
    iget-object v6, p0, Lorg/osmdroid/contributor/RouteRecorder;->mRecords:Ljava/util/ArrayList;

    new-instance v0, Lorg/osmdroid/contributor/util/RecordedGeoPoint;

    invoke-virtual {p1}, Landroid/location/Location;->getLatitude()D

    move-result-wide v1

    mul-double/2addr v1, v4

    double-to-int v1, v1

    invoke-virtual {p1}, Landroid/location/Location;->getLongitude()D

    move-result-wide v2

    mul-double/2addr v2, v4

    double-to-int v2, v2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    move v5, p2

    invoke-direct/range {v0 .. v5}, Lorg/osmdroid/contributor/util/RecordedGeoPoint;-><init>(IIJI)V

    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 51
    return-void
.end method

.method public add(Lorg/osmdroid/util/GeoPoint;I)V
    .registers 10
    .param p1, "aGeoPoint"    # Lorg/osmdroid/util/GeoPoint;
    .param p2, "aNumSatellites"    # I

    .prologue
    .line 54
    iget-object v6, p0, Lorg/osmdroid/contributor/RouteRecorder;->mRecords:Ljava/util/ArrayList;

    new-instance v0, Lorg/osmdroid/contributor/util/RecordedGeoPoint;

    invoke-virtual {p1}, Lorg/osmdroid/util/GeoPoint;->getLatitudeE6()I

    move-result v1

    invoke-virtual {p1}, Lorg/osmdroid/util/GeoPoint;->getLongitudeE6()I

    move-result v2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    move v5, p2

    invoke-direct/range {v0 .. v5}, Lorg/osmdroid/contributor/util/RecordedGeoPoint;-><init>(IIJI)V

    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 56
    return-void
.end method

.method public getRecordedGeoPoints()Ljava/util/ArrayList;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lorg/osmdroid/contributor/util/RecordedGeoPoint;",
            ">;"
        }
    .end annotation

    .prologue
    .line 36
    iget-object v0, p0, Lorg/osmdroid/contributor/RouteRecorder;->mRecords:Ljava/util/ArrayList;

    return-object v0
.end method
