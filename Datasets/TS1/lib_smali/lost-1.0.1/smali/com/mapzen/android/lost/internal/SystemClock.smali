.class public Lcom/mapzen/android/lost/internal/SystemClock;
.super Ljava/lang/Object;
.source "SystemClock.java"

# interfaces
.implements Lcom/mapzen/android/lost/internal/Clock;


# static fields
.field public static final MS_TO_NS:J = 0xf4240L


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getTimeInNanos(Landroid/location/Location;)J
    .registers 5
    .param p0, "location"    # Landroid/location/Location;

    .prologue
    .line 15
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-lt v0, v1, :cond_b

    .line 16
    invoke-virtual {p0}, Landroid/location/Location;->getElapsedRealtimeNanos()J

    move-result-wide v0

    .line 19
    :goto_a
    return-wide v0

    :cond_b
    invoke-virtual {p0}, Landroid/location/Location;->getTime()J

    move-result-wide v0

    const-wide/32 v2, 0xf4240

    mul-long/2addr v0, v2

    goto :goto_a
.end method


# virtual methods
.method public getCurrentTimeInMillis()J
    .registers 3

    .prologue
    .line 11
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    return-wide v0
.end method
