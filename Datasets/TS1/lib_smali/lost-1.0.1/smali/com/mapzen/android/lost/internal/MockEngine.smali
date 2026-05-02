.class public Lcom/mapzen/android/lost/internal/MockEngine;
.super Lcom/mapzen/android/lost/internal/LocationEngine;
.source "MockEngine.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mapzen/android/lost/internal/MockEngine$1;,
        Lcom/mapzen/android/lost/internal/MockEngine$TraceThread;
    }
.end annotation


# static fields
.field public static final MOCK_PROVIDER:Ljava/lang/String; = "mock"

.field public static final TAG_LAT:Ljava/lang/String; = "lat"

.field public static final TAG_LNG:Ljava/lang/String; = "lon"

.field public static final TAG_SPEED:Ljava/lang/String; = "speed"

.field public static final TAG_TRACK_POINT:Ljava/lang/String; = "trkpt"


# instance fields
.field private location:Landroid/location/Location;

.field private traceFile:Ljava/io/File;

.field private traceThread:Lcom/mapzen/android/lost/internal/MockEngine$TraceThread;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/mapzen/android/lost/internal/LocationEngine$Callback;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "callback"    # Lcom/mapzen/android/lost/internal/LocationEngine$Callback;

    .prologue
    .line 40
    invoke-direct {p0, p1, p2}, Lcom/mapzen/android/lost/internal/LocationEngine;-><init>(Landroid/content/Context;Lcom/mapzen/android/lost/internal/LocationEngine$Callback;)V

    .line 41
    return-void
.end method

.method static synthetic access$100(Lcom/mapzen/android/lost/internal/MockEngine;)Ljava/io/File;
    .registers 2
    .param p0, "x0"    # Lcom/mapzen/android/lost/internal/MockEngine;

    .prologue
    .line 26
    iget-object v0, p0, Lcom/mapzen/android/lost/internal/MockEngine;->traceFile:Ljava/io/File;

    return-object v0
.end method


# virtual methods
.method protected disable()V
    .registers 2

    .prologue
    .line 58
    iget-object v0, p0, Lcom/mapzen/android/lost/internal/MockEngine;->traceThread:Lcom/mapzen/android/lost/internal/MockEngine$TraceThread;

    if-eqz v0, :cond_9

    .line 59
    iget-object v0, p0, Lcom/mapzen/android/lost/internal/MockEngine;->traceThread:Lcom/mapzen/android/lost/internal/MockEngine$TraceThread;

    invoke-virtual {v0}, Lcom/mapzen/android/lost/internal/MockEngine$TraceThread;->cancel()V

    .line 61
    :cond_9
    return-void
.end method

.method protected enable()V
    .registers 3

    .prologue
    .line 50
    iget-object v0, p0, Lcom/mapzen/android/lost/internal/MockEngine;->traceFile:Ljava/io/File;

    if-eqz v0, :cond_11

    .line 51
    new-instance v0, Lcom/mapzen/android/lost/internal/MockEngine$TraceThread;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/mapzen/android/lost/internal/MockEngine$TraceThread;-><init>(Lcom/mapzen/android/lost/internal/MockEngine;Lcom/mapzen/android/lost/internal/MockEngine$1;)V

    iput-object v0, p0, Lcom/mapzen/android/lost/internal/MockEngine;->traceThread:Lcom/mapzen/android/lost/internal/MockEngine$TraceThread;

    .line 52
    iget-object v0, p0, Lcom/mapzen/android/lost/internal/MockEngine;->traceThread:Lcom/mapzen/android/lost/internal/MockEngine$TraceThread;

    invoke-virtual {v0}, Lcom/mapzen/android/lost/internal/MockEngine$TraceThread;->start()V

    .line 54
    :cond_11
    return-void
.end method

.method public getLastLocation()Landroid/location/Location;
    .registers 2

    .prologue
    .line 45
    iget-object v0, p0, Lcom/mapzen/android/lost/internal/MockEngine;->location:Landroid/location/Location;

    return-object v0
.end method

.method public setLocation(Landroid/location/Location;)V
    .registers 3
    .param p1, "location"    # Landroid/location/Location;

    .prologue
    .line 64
    iput-object p1, p0, Lcom/mapzen/android/lost/internal/MockEngine;->location:Landroid/location/Location;

    .line 65
    invoke-virtual {p0}, Lcom/mapzen/android/lost/internal/MockEngine;->getCallback()Lcom/mapzen/android/lost/internal/LocationEngine$Callback;

    move-result-object v0

    if-eqz v0, :cond_f

    .line 66
    invoke-virtual {p0}, Lcom/mapzen/android/lost/internal/MockEngine;->getCallback()Lcom/mapzen/android/lost/internal/LocationEngine$Callback;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/mapzen/android/lost/internal/LocationEngine$Callback;->reportLocation(Landroid/location/Location;)V

    .line 68
    :cond_f
    return-void
.end method

.method public setTrace(Ljava/io/File;)V
    .registers 2
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 74
    iput-object p1, p0, Lcom/mapzen/android/lost/internal/MockEngine;->traceFile:Ljava/io/File;

    .line 75
    return-void
.end method
