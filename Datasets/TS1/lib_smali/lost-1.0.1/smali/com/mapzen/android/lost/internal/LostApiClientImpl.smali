.class public Lcom/mapzen/android/lost/internal/LostApiClientImpl;
.super Ljava/lang/Object;
.source "LostApiClientImpl.java"

# interfaces
.implements Lcom/mapzen/android/lost/api/LostApiClient;


# instance fields
.field private final context:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-object p1, p0, Lcom/mapzen/android/lost/internal/LostApiClientImpl;->context:Landroid/content/Context;

    .line 17
    return-void
.end method


# virtual methods
.method public connect()V
    .registers 3

    .prologue
    .line 21
    new-instance v0, Lcom/mapzen/android/lost/internal/FusedLocationProviderApiImpl;

    iget-object v1, p0, Lcom/mapzen/android/lost/internal/LostApiClientImpl;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/mapzen/android/lost/internal/FusedLocationProviderApiImpl;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/mapzen/android/lost/api/LocationServices;->FusedLocationApi:Lcom/mapzen/android/lost/api/FusedLocationProviderApi;

    .line 22
    new-instance v0, Lcom/mapzen/android/lost/internal/GeofencingApiImpl;

    invoke-direct {v0}, Lcom/mapzen/android/lost/internal/GeofencingApiImpl;-><init>()V

    sput-object v0, Lcom/mapzen/android/lost/api/LocationServices;->GeofencingApi:Lcom/mapzen/android/lost/api/GeofencingApi;

    .line 23
    return-void
.end method

.method public disconnect()V
    .registers 4

    .prologue
    const/4 v1, 0x0

    .line 27
    sget-object v0, Lcom/mapzen/android/lost/api/LocationServices;->FusedLocationApi:Lcom/mapzen/android/lost/api/FusedLocationProviderApi;

    if-eqz v0, :cond_d

    .line 28
    sget-object v2, Lcom/mapzen/android/lost/api/LocationServices;->FusedLocationApi:Lcom/mapzen/android/lost/api/FusedLocationProviderApi;

    move-object v0, v1

    check-cast v0, Lcom/mapzen/android/lost/api/LocationListener;

    invoke-interface {v2, v0}, Lcom/mapzen/android/lost/api/FusedLocationProviderApi;->removeLocationUpdates(Lcom/mapzen/android/lost/api/LocationListener;)V

    .line 31
    :cond_d
    sput-object v1, Lcom/mapzen/android/lost/api/LocationServices;->FusedLocationApi:Lcom/mapzen/android/lost/api/FusedLocationProviderApi;

    .line 32
    sput-object v1, Lcom/mapzen/android/lost/api/LocationServices;->GeofencingApi:Lcom/mapzen/android/lost/api/GeofencingApi;

    .line 33
    return-void
.end method

.method public isConnected()Z
    .registers 2

    .prologue
    .line 37
    sget-object v0, Lcom/mapzen/android/lost/api/LocationServices;->FusedLocationApi:Lcom/mapzen/android/lost/api/FusedLocationProviderApi;

    if-eqz v0, :cond_a

    sget-object v0, Lcom/mapzen/android/lost/api/LocationServices;->GeofencingApi:Lcom/mapzen/android/lost/api/GeofencingApi;

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method
