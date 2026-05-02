.class public Lcom/mapzen/android/lost/internal/FusionEngine;
.super Lcom/mapzen/android/lost/internal/LocationEngine;
.source "FusionEngine.java"

# interfaces
.implements Landroid/location/LocationListener;


# static fields
.field public static final RECENT_UPDATE_THRESHOLD_IN_MILLIS:J = 0xea60L

.field public static final RECENT_UPDATE_THRESHOLD_IN_NANOS:J = 0xdf8475800L

.field private static final TAG:Ljava/lang/String;

.field static clock:Lcom/mapzen/android/lost/internal/Clock;


# instance fields
.field private gpsLocation:Landroid/location/Location;

.field private final locationManager:Landroid/location/LocationManager;

.field private networkLocation:Landroid/location/Location;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 22
    const-class v0, Lcom/mapzen/android/lost/internal/FusionEngine;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/mapzen/android/lost/internal/FusionEngine;->TAG:Ljava/lang/String;

    .line 34
    new-instance v0, Lcom/mapzen/android/lost/internal/SystemClock;

    invoke-direct {v0}, Lcom/mapzen/android/lost/internal/SystemClock;-><init>()V

    sput-object v0, Lcom/mapzen/android/lost/internal/FusionEngine;->clock:Lcom/mapzen/android/lost/internal/Clock;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/mapzen/android/lost/internal/LocationEngine$Callback;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "callback"    # Lcom/mapzen/android/lost/internal/LocationEngine$Callback;

    .prologue
    .line 37
    invoke-direct {p0, p1, p2}, Lcom/mapzen/android/lost/internal/LocationEngine;-><init>(Landroid/content/Context;Lcom/mapzen/android/lost/internal/LocationEngine$Callback;)V

    .line 38
    const-string v0, "location"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/location/LocationManager;

    iput-object v0, p0, Lcom/mapzen/android/lost/internal/FusionEngine;->locationManager:Landroid/location/LocationManager;

    .line 39
    return-void
.end method

.method private enableGps()V
    .registers 8

    .prologue
    .line 96
    :try_start_0
    iget-object v0, p0, Lcom/mapzen/android/lost/internal/FusionEngine;->locationManager:Landroid/location/LocationManager;

    const-string v1, "gps"

    invoke-virtual {p0}, Lcom/mapzen/android/lost/internal/FusionEngine;->getRequest()Lcom/mapzen/android/lost/api/LocationRequest;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mapzen/android/lost/api/LocationRequest;->getFastestInterval()J

    move-result-wide v2

    invoke-virtual {p0}, Lcom/mapzen/android/lost/internal/FusionEngine;->getRequest()Lcom/mapzen/android/lost/api/LocationRequest;

    move-result-object v4

    invoke-virtual {v4}, Lcom/mapzen/android/lost/api/LocationRequest;->getSmallestDisplacement()F

    move-result v4

    move-object v5, p0

    invoke-virtual/range {v0 .. v5}, Landroid/location/LocationManager;->requestLocationUpdates(Ljava/lang/String;JFLandroid/location/LocationListener;)V
    :try_end_18
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_18} :catch_19

    .line 103
    :goto_18
    return-void

    .line 100
    :catch_19
    move-exception v6

    .line 101
    .local v6, "e":Ljava/lang/IllegalArgumentException;
    sget-object v0, Lcom/mapzen/android/lost/internal/FusionEngine;->TAG:Ljava/lang/String;

    const-string v1, "Unable to register for GPS updates."

    invoke-static {v0, v1, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_18
.end method

.method private enableNetwork()V
    .registers 8

    .prologue
    .line 107
    :try_start_0
    iget-object v0, p0, Lcom/mapzen/android/lost/internal/FusionEngine;->locationManager:Landroid/location/LocationManager;

    const-string v1, "network"

    invoke-virtual {p0}, Lcom/mapzen/android/lost/internal/FusionEngine;->getRequest()Lcom/mapzen/android/lost/api/LocationRequest;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mapzen/android/lost/api/LocationRequest;->getFastestInterval()J

    move-result-wide v2

    invoke-virtual {p0}, Lcom/mapzen/android/lost/internal/FusionEngine;->getRequest()Lcom/mapzen/android/lost/api/LocationRequest;

    move-result-object v4

    invoke-virtual {v4}, Lcom/mapzen/android/lost/api/LocationRequest;->getSmallestDisplacement()F

    move-result v4

    move-object v5, p0

    invoke-virtual/range {v0 .. v5}, Landroid/location/LocationManager;->requestLocationUpdates(Ljava/lang/String;JFLandroid/location/LocationListener;)V
    :try_end_18
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_18} :catch_19

    .line 114
    :goto_18
    return-void

    .line 111
    :catch_19
    move-exception v6

    .line 112
    .local v6, "e":Ljava/lang/IllegalArgumentException;
    sget-object v0, Lcom/mapzen/android/lost/internal/FusionEngine;->TAG:Ljava/lang/String;

    const-string v1, "Unable to register for network updates."

    invoke-static {v0, v1, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_18
.end method

.method private enablePassive()V
    .registers 8

    .prologue
    .line 118
    :try_start_0
    iget-object v0, p0, Lcom/mapzen/android/lost/internal/FusionEngine;->locationManager:Landroid/location/LocationManager;

    const-string v1, "passive"

    invoke-virtual {p0}, Lcom/mapzen/android/lost/internal/FusionEngine;->getRequest()Lcom/mapzen/android/lost/api/LocationRequest;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mapzen/android/lost/api/LocationRequest;->getFastestInterval()J

    move-result-wide v2

    invoke-virtual {p0}, Lcom/mapzen/android/lost/internal/FusionEngine;->getRequest()Lcom/mapzen/android/lost/api/LocationRequest;

    move-result-object v4

    invoke-virtual {v4}, Lcom/mapzen/android/lost/api/LocationRequest;->getSmallestDisplacement()F

    move-result v4

    move-object v5, p0

    invoke-virtual/range {v0 .. v5}, Landroid/location/LocationManager;->requestLocationUpdates(Ljava/lang/String;JFLandroid/location/LocationListener;)V
    :try_end_18
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_18} :catch_19

    .line 125
    :goto_18
    return-void

    .line 122
    :catch_19
    move-exception v6

    .line 123
    .local v6, "e":Ljava/lang/IllegalArgumentException;
    sget-object v0, Lcom/mapzen/android/lost/internal/FusionEngine;->TAG:Ljava/lang/String;

    const-string v1, "Unable to register for passive updates."

    invoke-static {v0, v1, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_18
.end method

.method public static isBetterThan(Landroid/location/Location;Landroid/location/Location;)Z
    .registers 10
    .param p0, "locationA"    # Landroid/location/Location;
    .param p1, "locationB"    # Landroid/location/Location;

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 155
    if-nez p0, :cond_6

    move v0, v1

    .line 176
    :cond_5
    :goto_5
    return v0

    .line 159
    :cond_6
    if-eqz p1, :cond_5

    .line 163
    invoke-static {p0}, Lcom/mapzen/android/lost/internal/SystemClock;->getTimeInNanos(Landroid/location/Location;)J

    move-result-wide v2

    invoke-static {p1}, Lcom/mapzen/android/lost/internal/SystemClock;->getTimeInNanos(Landroid/location/Location;)J

    move-result-wide v4

    const-wide v6, 0xdf8475800L

    add-long/2addr v4, v6

    cmp-long v2, v2, v4

    if-gtz v2, :cond_5

    .line 168
    invoke-virtual {p0}, Landroid/location/Location;->hasAccuracy()Z

    move-result v2

    if-nez v2, :cond_22

    move v0, v1

    .line 169
    goto :goto_5

    .line 172
    :cond_22
    invoke-virtual {p1}, Landroid/location/Location;->hasAccuracy()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 176
    invoke-virtual {p0}, Landroid/location/Location;->getAccuracy()F

    move-result v2

    invoke-virtual {p1}, Landroid/location/Location;->getAccuracy()F

    move-result v3

    cmpg-float v2, v2, v3

    if-ltz v2, :cond_5

    move v0, v1

    goto :goto_5
.end method


# virtual methods
.method protected disable()V
    .registers 2

    .prologue
    .line 89
    iget-object v0, p0, Lcom/mapzen/android/lost/internal/FusionEngine;->locationManager:Landroid/location/LocationManager;

    if-eqz v0, :cond_9

    .line 90
    iget-object v0, p0, Lcom/mapzen/android/lost/internal/FusionEngine;->locationManager:Landroid/location/LocationManager;

    invoke-virtual {v0, p0}, Landroid/location/LocationManager;->removeUpdates(Landroid/location/LocationListener;)V

    .line 92
    :cond_9
    return-void
.end method

.method protected enable()V
    .registers 2

    .prologue
    .line 70
    invoke-virtual {p0}, Lcom/mapzen/android/lost/internal/FusionEngine;->getRequest()Lcom/mapzen/android/lost/api/LocationRequest;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mapzen/android/lost/api/LocationRequest;->getPriority()I

    move-result v0

    packed-switch v0, :pswitch_data_20

    .line 85
    :goto_b
    :pswitch_b
    return-void

    .line 72
    :pswitch_c
    invoke-direct {p0}, Lcom/mapzen/android/lost/internal/FusionEngine;->enableGps()V

    .line 73
    invoke-direct {p0}, Lcom/mapzen/android/lost/internal/FusionEngine;->enableNetwork()V

    goto :goto_b

    .line 76
    :pswitch_13
    invoke-direct {p0}, Lcom/mapzen/android/lost/internal/FusionEngine;->enableNetwork()V

    goto :goto_b

    .line 79
    :pswitch_17
    invoke-direct {p0}, Lcom/mapzen/android/lost/internal/FusionEngine;->enableNetwork()V

    goto :goto_b

    .line 82
    :pswitch_1b
    invoke-direct {p0}, Lcom/mapzen/android/lost/internal/FusionEngine;->enablePassive()V

    goto :goto_b

    .line 70
    nop

    :pswitch_data_20
    .packed-switch 0x64
        :pswitch_c
        :pswitch_b
        :pswitch_13
        :pswitch_b
        :pswitch_17
        :pswitch_1b
    .end packed-switch
.end method

.method public getLastLocation()Landroid/location/Location;
    .registers 19

    .prologue
    .line 42
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/mapzen/android/lost/internal/FusionEngine;->locationManager:Landroid/location/LocationManager;

    invoke-virtual {v14}, Landroid/location/LocationManager;->getAllProviders()Ljava/util/List;

    move-result-object v11

    .line 43
    .local v11, "providers":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    sget-object v14, Lcom/mapzen/android/lost/internal/FusionEngine;->clock:Lcom/mapzen/android/lost/internal/Clock;

    invoke-interface {v14}, Lcom/mapzen/android/lost/internal/Clock;->getCurrentTimeInMillis()J

    move-result-wide v14

    const-wide/32 v16, 0xea60

    sub-long v8, v14, v16

    .line 45
    .local v8, "minTime":J
    const/4 v3, 0x0

    .line 46
    .local v3, "bestLocation":Landroid/location/Location;
    const v2, 0x7f7fffff    # Float.MAX_VALUE

    .line 47
    .local v2, "bestAccuracy":F
    const-wide/high16 v4, -0x8000000000000000L

    .line 49
    .local v4, "bestTime":J
    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "i$":Ljava/util/Iterator;
    :cond_1d
    :goto_1d
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_59

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    .line 50
    .local v10, "provider":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/mapzen/android/lost/internal/FusionEngine;->locationManager:Landroid/location/LocationManager;

    invoke-virtual {v14, v10}, Landroid/location/LocationManager;->getLastKnownLocation(Ljava/lang/String;)Landroid/location/Location;

    move-result-object v7

    .line 51
    .local v7, "location":Landroid/location/Location;
    if-eqz v7, :cond_1d

    .line 52
    invoke-virtual {v7}, Landroid/location/Location;->getAccuracy()F

    move-result v1

    .line 53
    .local v1, "accuracy":F
    invoke-virtual {v7}, Landroid/location/Location;->getTime()J

    move-result-wide v12

    .line 54
    .local v12, "time":J
    cmp-long v14, v12, v8

    if-lez v14, :cond_47

    cmpg-float v14, v1, v2

    if-gez v14, :cond_47

    .line 55
    move-object v3, v7

    .line 56
    move v2, v1

    .line 57
    move-wide v4, v12

    goto :goto_1d

    .line 58
    :cond_47
    cmp-long v14, v12, v8

    if-gez v14, :cond_1d

    const v14, 0x7f7fffff    # Float.MAX_VALUE

    cmpl-float v14, v2, v14

    if-nez v14, :cond_1d

    cmp-long v14, v12, v4

    if-lez v14, :cond_1d

    .line 59
    move-object v3, v7

    .line 60
    move-wide v4, v12

    goto :goto_1d

    .line 65
    .end local v1    # "accuracy":F
    .end local v7    # "location":Landroid/location/Location;
    .end local v10    # "provider":Ljava/lang/String;
    .end local v12    # "time":J
    :cond_59
    return-object v3
.end method

.method public onLocationChanged(Landroid/location/Location;)V
    .registers 4
    .param p1, "location"    # Landroid/location/Location;

    .prologue
    .line 129
    const-string v0, "gps"

    invoke-virtual {p1}, Landroid/location/Location;->getProvider()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_26

    .line 130
    iput-object p1, p0, Lcom/mapzen/android/lost/internal/FusionEngine;->gpsLocation:Landroid/location/Location;

    .line 131
    invoke-virtual {p0}, Lcom/mapzen/android/lost/internal/FusionEngine;->getCallback()Lcom/mapzen/android/lost/internal/LocationEngine$Callback;

    move-result-object v0

    if-eqz v0, :cond_25

    iget-object v0, p0, Lcom/mapzen/android/lost/internal/FusionEngine;->gpsLocation:Landroid/location/Location;

    iget-object v1, p0, Lcom/mapzen/android/lost/internal/FusionEngine;->networkLocation:Landroid/location/Location;

    invoke-static {v0, v1}, Lcom/mapzen/android/lost/internal/FusionEngine;->isBetterThan(Landroid/location/Location;Landroid/location/Location;)Z

    move-result v0

    if-eqz v0, :cond_25

    .line 132
    invoke-virtual {p0}, Lcom/mapzen/android/lost/internal/FusionEngine;->getCallback()Lcom/mapzen/android/lost/internal/LocationEngine$Callback;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/mapzen/android/lost/internal/LocationEngine$Callback;->reportLocation(Landroid/location/Location;)V

    .line 140
    :cond_25
    :goto_25
    return-void

    .line 134
    :cond_26
    const-string v0, "network"

    invoke-virtual {p1}, Landroid/location/Location;->getProvider()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_25

    .line 135
    iput-object p1, p0, Lcom/mapzen/android/lost/internal/FusionEngine;->networkLocation:Landroid/location/Location;

    .line 136
    invoke-virtual {p0}, Lcom/mapzen/android/lost/internal/FusionEngine;->getCallback()Lcom/mapzen/android/lost/internal/LocationEngine$Callback;

    move-result-object v0

    if-eqz v0, :cond_25

    iget-object v0, p0, Lcom/mapzen/android/lost/internal/FusionEngine;->networkLocation:Landroid/location/Location;

    iget-object v1, p0, Lcom/mapzen/android/lost/internal/FusionEngine;->gpsLocation:Landroid/location/Location;

    invoke-static {v0, v1}, Lcom/mapzen/android/lost/internal/FusionEngine;->isBetterThan(Landroid/location/Location;Landroid/location/Location;)Z

    move-result v0

    if-eqz v0, :cond_25

    .line 137
    invoke-virtual {p0}, Lcom/mapzen/android/lost/internal/FusionEngine;->getCallback()Lcom/mapzen/android/lost/internal/LocationEngine$Callback;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/mapzen/android/lost/internal/LocationEngine$Callback;->reportLocation(Landroid/location/Location;)V

    goto :goto_25
.end method

.method public onProviderDisabled(Ljava/lang/String;)V
    .registers 2
    .param p1, "provider"    # Ljava/lang/String;

    .prologue
    .line 152
    return-void
.end method

.method public onProviderEnabled(Ljava/lang/String;)V
    .registers 2
    .param p1, "provider"    # Ljava/lang/String;

    .prologue
    .line 148
    return-void
.end method

.method public onStatusChanged(Ljava/lang/String;ILandroid/os/Bundle;)V
    .registers 4
    .param p1, "provider"    # Ljava/lang/String;
    .param p2, "status"    # I
    .param p3, "extras"    # Landroid/os/Bundle;

    .prologue
    .line 144
    return-void
.end method
