.class public Lcom/mapzen/android/lost/internal/FusedLocationProviderApiImpl;
.super Ljava/lang/Object;
.source "FusedLocationProviderApiImpl.java"

# interfaces
.implements Lcom/mapzen/android/lost/api/FusedLocationProviderApi;
.implements Lcom/mapzen/android/lost/internal/LocationEngine$Callback;


# instance fields
.field private final context:Landroid/content/Context;

.field private locationEngine:Lcom/mapzen/android/lost/internal/LocationEngine;

.field private locationListener:Lcom/mapzen/android/lost/api/LocationListener;

.field private mockMode:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    iput-object p1, p0, Lcom/mapzen/android/lost/internal/FusedLocationProviderApiImpl;->context:Landroid/content/Context;

    .line 27
    new-instance v0, Lcom/mapzen/android/lost/internal/FusionEngine;

    invoke-direct {v0, p1, p0}, Lcom/mapzen/android/lost/internal/FusionEngine;-><init>(Landroid/content/Context;Lcom/mapzen/android/lost/internal/LocationEngine$Callback;)V

    iput-object v0, p0, Lcom/mapzen/android/lost/internal/FusedLocationProviderApiImpl;->locationEngine:Lcom/mapzen/android/lost/internal/LocationEngine;

    .line 28
    return-void
.end method

.method private toggleMockMode()V
    .registers 3

    .prologue
    .line 70
    iget-boolean v0, p0, Lcom/mapzen/android/lost/internal/FusedLocationProviderApiImpl;->mockMode:Z

    if-nez v0, :cond_1b

    const/4 v0, 0x1

    :goto_5
    iput-boolean v0, p0, Lcom/mapzen/android/lost/internal/FusedLocationProviderApiImpl;->mockMode:Z

    .line 71
    iget-object v0, p0, Lcom/mapzen/android/lost/internal/FusedLocationProviderApiImpl;->locationEngine:Lcom/mapzen/android/lost/internal/LocationEngine;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/mapzen/android/lost/internal/LocationEngine;->setRequest(Lcom/mapzen/android/lost/api/LocationRequest;)V

    .line 72
    iget-boolean v0, p0, Lcom/mapzen/android/lost/internal/FusedLocationProviderApiImpl;->mockMode:Z

    if-eqz v0, :cond_1d

    .line 73
    new-instance v0, Lcom/mapzen/android/lost/internal/MockEngine;

    iget-object v1, p0, Lcom/mapzen/android/lost/internal/FusedLocationProviderApiImpl;->context:Landroid/content/Context;

    invoke-direct {v0, v1, p0}, Lcom/mapzen/android/lost/internal/MockEngine;-><init>(Landroid/content/Context;Lcom/mapzen/android/lost/internal/LocationEngine$Callback;)V

    iput-object v0, p0, Lcom/mapzen/android/lost/internal/FusedLocationProviderApiImpl;->locationEngine:Lcom/mapzen/android/lost/internal/LocationEngine;

    .line 77
    :goto_1a
    return-void

    .line 70
    :cond_1b
    const/4 v0, 0x0

    goto :goto_5

    .line 75
    :cond_1d
    new-instance v0, Lcom/mapzen/android/lost/internal/FusionEngine;

    iget-object v1, p0, Lcom/mapzen/android/lost/internal/FusedLocationProviderApiImpl;->context:Landroid/content/Context;

    invoke-direct {v0, v1, p0}, Lcom/mapzen/android/lost/internal/FusionEngine;-><init>(Landroid/content/Context;Lcom/mapzen/android/lost/internal/LocationEngine$Callback;)V

    iput-object v0, p0, Lcom/mapzen/android/lost/internal/FusedLocationProviderApiImpl;->locationEngine:Lcom/mapzen/android/lost/internal/LocationEngine;

    goto :goto_1a
.end method


# virtual methods
.method public getLastLocation()Landroid/location/Location;
    .registers 2

    .prologue
    .line 32
    iget-object v0, p0, Lcom/mapzen/android/lost/internal/FusedLocationProviderApiImpl;->locationEngine:Lcom/mapzen/android/lost/internal/LocationEngine;

    invoke-virtual {v0}, Lcom/mapzen/android/lost/internal/LocationEngine;->getLastLocation()Landroid/location/Location;

    move-result-object v0

    return-object v0
.end method

.method public removeLocationUpdates(Landroid/app/PendingIntent;)V
    .registers 4
    .param p1, "callbackIntent"    # Landroid/app/PendingIntent;

    .prologue
    .line 59
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Sorry, not yet implemented"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public removeLocationUpdates(Lcom/mapzen/android/lost/api/LocationListener;)V
    .registers 4
    .param p1, "listener"    # Lcom/mapzen/android/lost/api/LocationListener;

    .prologue
    .line 54
    iget-object v0, p0, Lcom/mapzen/android/lost/internal/FusedLocationProviderApiImpl;->locationEngine:Lcom/mapzen/android/lost/internal/LocationEngine;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/mapzen/android/lost/internal/LocationEngine;->setRequest(Lcom/mapzen/android/lost/api/LocationRequest;)V

    .line 55
    return-void
.end method

.method public reportLocation(Landroid/location/Location;)V
    .registers 3
    .param p1, "location"    # Landroid/location/Location;

    .prologue
    .line 95
    iget-object v0, p0, Lcom/mapzen/android/lost/internal/FusedLocationProviderApiImpl;->locationListener:Lcom/mapzen/android/lost/api/LocationListener;

    if-eqz v0, :cond_9

    .line 96
    iget-object v0, p0, Lcom/mapzen/android/lost/internal/FusedLocationProviderApiImpl;->locationListener:Lcom/mapzen/android/lost/api/LocationListener;

    invoke-interface {v0, p1}, Lcom/mapzen/android/lost/api/LocationListener;->onLocationChanged(Landroid/location/Location;)V

    .line 98
    :cond_9
    return-void
.end method

.method public requestLocationUpdates(Lcom/mapzen/android/lost/api/LocationRequest;Landroid/app/PendingIntent;)V
    .registers 5
    .param p1, "request"    # Lcom/mapzen/android/lost/api/LocationRequest;
    .param p2, "callbackIntent"    # Landroid/app/PendingIntent;

    .prologue
    .line 49
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Sorry, not yet implemented"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public requestLocationUpdates(Lcom/mapzen/android/lost/api/LocationRequest;Lcom/mapzen/android/lost/api/LocationListener;)V
    .registers 4
    .param p1, "request"    # Lcom/mapzen/android/lost/api/LocationRequest;
    .param p2, "listener"    # Lcom/mapzen/android/lost/api/LocationListener;

    .prologue
    .line 37
    iput-object p2, p0, Lcom/mapzen/android/lost/internal/FusedLocationProviderApiImpl;->locationListener:Lcom/mapzen/android/lost/api/LocationListener;

    .line 38
    iget-object v0, p0, Lcom/mapzen/android/lost/internal/FusedLocationProviderApiImpl;->locationEngine:Lcom/mapzen/android/lost/internal/LocationEngine;

    invoke-virtual {v0, p1}, Lcom/mapzen/android/lost/internal/LocationEngine;->setRequest(Lcom/mapzen/android/lost/api/LocationRequest;)V

    .line 39
    return-void
.end method

.method public requestLocationUpdates(Lcom/mapzen/android/lost/api/LocationRequest;Lcom/mapzen/android/lost/api/LocationListener;Landroid/os/Looper;)V
    .registers 6
    .param p1, "request"    # Lcom/mapzen/android/lost/api/LocationRequest;
    .param p2, "listener"    # Lcom/mapzen/android/lost/api/LocationListener;
    .param p3, "looper"    # Landroid/os/Looper;

    .prologue
    .line 44
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Sorry, not yet implemented"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setMockLocation(Landroid/location/Location;)V
    .registers 3
    .param p1, "mockLocation"    # Landroid/location/Location;

    .prologue
    .line 81
    iget-object v0, p0, Lcom/mapzen/android/lost/internal/FusedLocationProviderApiImpl;->locationEngine:Lcom/mapzen/android/lost/internal/LocationEngine;

    instance-of v0, v0, Lcom/mapzen/android/lost/internal/MockEngine;

    if-eqz v0, :cond_d

    .line 82
    iget-object v0, p0, Lcom/mapzen/android/lost/internal/FusedLocationProviderApiImpl;->locationEngine:Lcom/mapzen/android/lost/internal/LocationEngine;

    check-cast v0, Lcom/mapzen/android/lost/internal/MockEngine;

    invoke-virtual {v0, p1}, Lcom/mapzen/android/lost/internal/MockEngine;->setLocation(Landroid/location/Location;)V

    .line 84
    :cond_d
    return-void
.end method

.method public setMockMode(Z)V
    .registers 3
    .param p1, "isMockMode"    # Z

    .prologue
    .line 64
    iget-boolean v0, p0, Lcom/mapzen/android/lost/internal/FusedLocationProviderApiImpl;->mockMode:Z

    if-eq v0, p1, :cond_7

    .line 65
    invoke-direct {p0}, Lcom/mapzen/android/lost/internal/FusedLocationProviderApiImpl;->toggleMockMode()V

    .line 67
    :cond_7
    return-void
.end method

.method public setMockTrace(Ljava/io/File;)V
    .registers 3
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 88
    iget-object v0, p0, Lcom/mapzen/android/lost/internal/FusedLocationProviderApiImpl;->locationEngine:Lcom/mapzen/android/lost/internal/LocationEngine;

    instance-of v0, v0, Lcom/mapzen/android/lost/internal/MockEngine;

    if-eqz v0, :cond_d

    .line 89
    iget-object v0, p0, Lcom/mapzen/android/lost/internal/FusedLocationProviderApiImpl;->locationEngine:Lcom/mapzen/android/lost/internal/LocationEngine;

    check-cast v0, Lcom/mapzen/android/lost/internal/MockEngine;

    invoke-virtual {v0, p1}, Lcom/mapzen/android/lost/internal/MockEngine;->setTrace(Ljava/io/File;)V

    .line 91
    :cond_d
    return-void
.end method
