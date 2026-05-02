.class public final Lcom/mapzen/android/lost/api/Geofence$Builder;
.super Ljava/lang/Object;
.source "Geofence.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mapzen/android/lost/api/Geofence;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public build()Lcom/mapzen/android/lost/api/Geofence;
    .registers 3

    .prologue
    .line 14
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Sorry, not yet implemented"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setCircularRegion(DDF)Lcom/mapzen/android/lost/api/Geofence$Builder;
    .registers 8
    .param p1, "latitude"    # D
    .param p3, "longitude"    # D
    .param p5, "radius"    # F

    .prologue
    .line 19
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Sorry, not yet implemented"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setExpirationDuration(J)Lcom/mapzen/android/lost/api/Geofence$Builder;
    .registers 5
    .param p1, "durationMillis"    # J

    .prologue
    .line 23
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Sorry, not yet implemented"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setLoiteringDelay(I)Lcom/mapzen/android/lost/api/Geofence$Builder;
    .registers 4
    .param p1, "loiteringDelayMs"    # I

    .prologue
    .line 27
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Sorry, not yet implemented"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setNotificationResponsiveness(I)Lcom/mapzen/android/lost/api/Geofence$Builder;
    .registers 4
    .param p1, "notificationResponsivenessMs"    # I

    .prologue
    .line 31
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Sorry, not yet implemented"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setRequestId(Ljava/lang/String;)Lcom/mapzen/android/lost/api/Geofence$Builder;
    .registers 4
    .param p1, "requestId"    # Ljava/lang/String;

    .prologue
    .line 35
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Sorry, not yet implemented"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setTransitionTypes(I)Lcom/mapzen/android/lost/api/Geofence$Builder;
    .registers 4
    .param p1, "transitionTypes"    # I

    .prologue
    .line 39
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Sorry, not yet implemented"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
