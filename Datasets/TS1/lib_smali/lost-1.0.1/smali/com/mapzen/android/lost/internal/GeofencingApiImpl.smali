.class public Lcom/mapzen/android/lost/internal/GeofencingApiImpl;
.super Ljava/lang/Object;
.source "GeofencingApiImpl.java"

# interfaces
.implements Lcom/mapzen/android/lost/api/GeofencingApi;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public addGeofences(Ljava/util/List;Landroid/app/PendingIntent;)V
    .registers 5
    .param p2, "pendingIntent"    # Landroid/app/PendingIntent;
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

    .prologue
    .line 16
    .local p1, "geofences":Ljava/util/List;, "Ljava/util/List<Lcom/mapzen/android/lost/api/Geofence;>;"
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Sorry, not yet implemented"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public removeGeofences(Landroid/app/PendingIntent;)V
    .registers 4
    .param p1, "pendingIntent"    # Landroid/app/PendingIntent;

    .prologue
    .line 26
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Sorry, not yet implemented"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public removeGeofences(Ljava/util/List;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 21
    .local p1, "geofenceRequestIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Sorry, not yet implemented"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
