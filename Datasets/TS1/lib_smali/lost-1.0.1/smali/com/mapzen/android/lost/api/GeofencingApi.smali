.class public interface abstract Lcom/mapzen/android/lost/api/GeofencingApi;
.super Ljava/lang/Object;
.source "GeofencingApi.java"


# virtual methods
.method public abstract addGeofences(Ljava/util/List;Landroid/app/PendingIntent;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mapzen/android/lost/api/Geofence;",
            ">;",
            "Landroid/app/PendingIntent;",
            ")V"
        }
    .end annotation
.end method

.method public abstract removeGeofences(Landroid/app/PendingIntent;)V
.end method

.method public abstract removeGeofences(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method
