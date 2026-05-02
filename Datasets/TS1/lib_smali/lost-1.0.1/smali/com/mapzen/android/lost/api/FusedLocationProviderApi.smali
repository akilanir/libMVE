.class public interface abstract Lcom/mapzen/android/lost/api/FusedLocationProviderApi;
.super Ljava/lang/Object;
.source "FusedLocationProviderApi.java"


# virtual methods
.method public abstract getLastLocation()Landroid/location/Location;
.end method

.method public abstract removeLocationUpdates(Landroid/app/PendingIntent;)V
.end method

.method public abstract removeLocationUpdates(Lcom/mapzen/android/lost/api/LocationListener;)V
.end method

.method public abstract requestLocationUpdates(Lcom/mapzen/android/lost/api/LocationRequest;Landroid/app/PendingIntent;)V
.end method

.method public abstract requestLocationUpdates(Lcom/mapzen/android/lost/api/LocationRequest;Lcom/mapzen/android/lost/api/LocationListener;)V
.end method

.method public abstract requestLocationUpdates(Lcom/mapzen/android/lost/api/LocationRequest;Lcom/mapzen/android/lost/api/LocationListener;Landroid/os/Looper;)V
.end method

.method public abstract setMockLocation(Landroid/location/Location;)V
.end method

.method public abstract setMockMode(Z)V
.end method

.method public abstract setMockTrace(Ljava/io/File;)V
.end method
