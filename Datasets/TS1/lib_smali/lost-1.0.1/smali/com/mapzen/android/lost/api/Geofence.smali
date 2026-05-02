.class public interface abstract Lcom/mapzen/android/lost/api/Geofence;
.super Ljava/lang/Object;
.source "Geofence.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mapzen/android/lost/api/Geofence$Builder;
    }
.end annotation


# static fields
.field public static final GEOFENCE_TRANSITION_DWELL:I = 0x4

.field public static final GEOFENCE_TRANSITION_ENTER:I = 0x1

.field public static final GEOFENCE_TRANSITION_EXIT:I = 0x2

.field public static final NEVER_EXPIRE:J = -0x1L


# virtual methods
.method public abstract getRequestId()Ljava/lang/String;
.end method
